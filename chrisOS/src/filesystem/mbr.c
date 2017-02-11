#include "filesystem.h"
#include "init/ata_disk.h"
#include "memory.h"
#include "utility.h"
#include "gpt.h"

uint8_t mbrBuffer[512]; //20480
uint8_t partBuffer[512*20]; //10240
gptHeader_t* gptHdr;
gptPartEntry_t* gptPart;

void printMBR(struct mbr_t* mbr)
{
    printk("Part#\tStart\tEnd\t\tTotal\t\tPartType\tBoot\n");
    for (int cnt=0;cnt<mbr->partCount;cnt++)
    {
        if (mbr->parts[cnt].partStartSector>0)
            printk("%u\t\t%u\t\t%u\t%u\t\t%u\t\t%s\n",cnt,mbr->parts[cnt].partStartSector, mbr->parts[cnt].partEndSector, mbr->parts[cnt].partTotalSectors,mbr->parts[cnt].systemID,mbr->parts[cnt].bootable?"Y":"N");
    }
    printk("\n");
}
    
bool parseMBR(struct ataDeviceInfo_t* devInfo, struct mbr_t* mbr)
{
    HBA_PORT* port=(HBA_PORT*)devInfo->ioPort;
    
    memset(mbr,0,sizeof(struct mbr_t));
    mbr->parts[0].partStartSector=0;
    printd(DEBUG_HARDDRIVE,"devInfo->ABAR=0x%08X\n",devInfo->ABAR);
    if (devInfo->ABAR)
    {
        printd(DEBUG_HARDDRIVE,"Disk is SATA\n");
        ahciSetCurrentDisk(port);
        bool lResult=ahciRead(port,0,mbrBuffer,1);
        if (!lResult)
        {
            printk("Could not read ATA MBR (0x%08X)", lResult);
            return false;
        }
    }
    else
    {
        printd(DEBUG_HARDDRIVE,"Disk is ATA\n");
        int lResult=ataReadDisk(devInfo, mbr->parts, 0, mbrBuffer, 1);
        if (lResult!=512)
        {
            printk("Could not read ATA MBR (0x%08X)", lResult);
            return false;
        }
    }
    memcpy(mbr->diskID, &mbrBuffer[0x1b4], 10);
    mbr->validBootSector=mbrBuffer[0x1FE]==0x55 && mbrBuffer[0x1FF]==0xAA;
    mbr->parts[0].bootable = mbrBuffer[MBR_PART1_OFFSET+0]==0x80;
    mbr->parts[0].systemID = mbrBuffer[MBR_PART1_OFFSET+4];
    mbr->parts[0].partStartSector = mbrBuffer[MBR_PART1_OFFSET+8] | (mbrBuffer[MBR_PART1_OFFSET+9]<<8) | (mbrBuffer[MBR_PART1_OFFSET+10]<<16) | (mbrBuffer[MBR_PART1_OFFSET+11]<<24);
    mbr->parts[0].partTotalSectors = mbrBuffer[MBR_PART1_OFFSET+12] | (mbrBuffer[MBR_PART1_OFFSET+13]<<8) | (mbrBuffer[MBR_PART1_OFFSET+14]<<16) | (mbrBuffer[MBR_PART1_OFFSET+15]<<24);
    mbr->parts[0].partEndSector = mbr->parts[0].partStartSector + mbr->parts[0].partTotalSectors;

    mbr->parts[1].bootable = mbrBuffer[MBR_PART2_OFFSET+0]==0x80;
    mbr->parts[1].systemID = mbrBuffer[MBR_PART2_OFFSET+4];
    mbr->parts[1].partStartSector = mbrBuffer[MBR_PART2_OFFSET+8] | (mbrBuffer[MBR_PART2_OFFSET+9]<<8) | (mbrBuffer[MBR_PART2_OFFSET+10]<<16) | (mbrBuffer[MBR_PART2_OFFSET+11]<<24);
    mbr->parts[1].partTotalSectors = mbrBuffer[MBR_PART2_OFFSET+12] | (mbrBuffer[MBR_PART2_OFFSET+13]<<8) | (mbrBuffer[MBR_PART2_OFFSET+14]<<16) | (mbrBuffer[MBR_PART2_OFFSET+15]<<24);
    mbr->parts[1].partEndSector = mbr->parts[1].partStartSector + mbr->parts[1].partTotalSectors;

    mbr->parts[2].bootable = mbrBuffer[MBR_PART3_OFFSET+0]==0x80;
    mbr->parts[2].systemID = mbrBuffer[MBR_PART3_OFFSET+4];
    mbr->parts[2].partStartSector = mbrBuffer[MBR_PART3_OFFSET+8] | (mbrBuffer[MBR_PART3_OFFSET+9]<<8) | (mbrBuffer[MBR_PART3_OFFSET+10]<<16) | (mbrBuffer[MBR_PART3_OFFSET+11]<<24);
    mbr->parts[2].partTotalSectors = mbrBuffer[MBR_PART3_OFFSET+12] | (mbrBuffer[MBR_PART3_OFFSET+13]<<8) | (mbrBuffer[MBR_PART3_OFFSET+14]<<16) | (mbrBuffer[MBR_PART3_OFFSET+15]<<24);
    mbr->parts[2].partEndSector = mbr->parts[2].partStartSector + mbr->parts[2].partTotalSectors;

    mbr->parts[3].bootable = mbrBuffer[MBR_PART4_OFFSET+0]==0x80;
    mbr->parts[3].systemID = mbrBuffer[MBR_PART4_OFFSET+4];
    mbr->parts[3].partStartSector = mbrBuffer[MBR_PART4_OFFSET+8] | (mbrBuffer[MBR_PART4_OFFSET+9]<<8) | (mbrBuffer[MBR_PART4_OFFSET+10]<<16) | (mbrBuffer[MBR_PART4_OFFSET+11]<<24);
    mbr->parts[3].partTotalSectors = mbrBuffer[MBR_PART4_OFFSET+12] | (mbrBuffer[MBR_PART4_OFFSET+13]<<8) | (mbrBuffer[MBR_PART4_OFFSET+14]<<16) | (mbrBuffer[MBR_PART4_OFFSET+15]<<24);
    mbr->parts[3].partEndSector = mbr->parts[3].partStartSector + mbr->parts[3].partTotalSectors;
    mbr->partCount=4;
    if (mbr->parts[0].systemID=0xEE)
    {
        printd(DEBUG_HARDDRIVE,"Found GPT partition table\n");
        return parseGPT(port, mbr);
    }
    return true;
}

bool parseGPT(HBA_PORT* port, struct mbr_t* mbr)
{
int readLen=0;

    bool lResult=ahciRead(port,mbr->parts[0].partStartSector,mbrBuffer,1);
    gptHdr=mbrBuffer;

    printd(DEBUG_HARDDRIVE,"GPT PT LBA=%u, PT entries=%04x, PT entry len=%04x, last usable LBA=%08x\n",
            gptHdr->partEntryLBAL,
            gptHdr->partEntryCount,
            gptHdr->partEntrySize,
            gptHdr->lastUsableLBAL);
    readLen=((gptHdr->partEntryCount*gptHdr->partEntrySize)/512)+1;
    
    printd(DEBUG_HARDDRIVE,"Reading GPT partition table @ lba %u for %u sectors\n",gptHdr->partEntryLBAL,readLen);
    lResult=ahciRead(port,gptHdr->partEntryLBAL,partBuffer,10);
    
    gptPart=partBuffer;
    mbr->partCount=0;
    for (int cnt=0;cnt<20;cnt++)
    {
        printd(DEBUG_HARDDRIVE,"Part %u, first=%u\n",cnt,gptPart[cnt].partFirstLBAL);
        if (gptPart[cnt].partFirstLBAL>0)
        {
            mbr->parts[cnt].partStartSector=gptPart[cnt].partFirstLBAL;
            mbr->parts[cnt].partEndSector=gptPart[cnt].partLastLBAL;
            mbr->parts[cnt].partTotalSectors=mbr->parts[cnt].partEndSector-mbr->parts[cnt].partStartSector;
            //mbr->parts[cnt].systemID
            mbr->partCount++;
        }
    }


    return true;
        
}
