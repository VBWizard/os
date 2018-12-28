/*Parts from: http://wiki.osdev.org/ATAPI*/

#include "io.h"
#include "init/ata_disk.h"
#include "i386/bits/types.h"
#include "printf.h"
#include "chrisos.h"
#include "utility.h"
#include "filesystem.h"
#include "kbd.h"

bool useCDROMIdentify=false;
int hdError=0;
int partOffset=0, lastDiskSelected=0;
extern volatile int kMSPerTick;
extern int kTicksPerMS;
float ticks=0;
struct ataDeviceInfo_t* atablockingReadDev;

//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
    while (ticks > 0)
    {
        STI
        //waitTicks(1);
        __asm__("sti\nhlt\n");
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (toBeSet && (inValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ)
                return 0;
        else if ((!toBeSet && (inValue & ATA_STATUS_DRQ) != ATA_STATUS_DRQ))
                return 0;
        ticks--;
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
    if ((hdError & 0x4)==0x4)
        return 0;
    return inValue;
}

uint8_t ataWaitForIdle(struct ataDeviceInfo_t* devInfo)
{
    ticks = 0;
    uint8_t lValue=0;
    //printd(DEBUG_HARDDRIVE,"aaWaitForIdle: ticks(%u@0x%08X)=ATA_STANDARD_WAIT_MS(%d)*kTicksPerMS((%d@0x%08X))\n", ticks, &ticks, (ATA_STANDARD_WAIT_MS), kTicksPerMS, &kTicksPerMS);
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
    {
        __asm__("sti\nhlt\n");
        lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
                    return 0;
        ticks++;
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
    return lValue;
}


uint8_t ataControllerIsReady(struct ataDeviceInfo_t* devInfo)
{
    int ticks = 0;
    
    int lStatus=0;
    uint8_t err=0;

    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
    {
        lStatus=inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
        ticks++;
	lStatus &= (ATA_STATUS_BUSY | ATA_STATUS_READY| ATA_STATUS_SEEK);
        if (lStatus & ATA_STATUS_READY )
                return true;
    }

    if (lStatus==ATA_STATUS_ERROR || lStatus==ATA_STATUS_BUSY)
    {
         err=inb(0x1f1);
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printd(DEBUG_HARDDRIVE,"ataControllerIsReady: DRQ wait failed, lStatus=%02X, err=%02X\n",lStatus,err);
#endif
    }
    if ( (lStatus & ATA_STATUS_READY)==0 && err==4)
        lStatus=ATA_STATUS_READY;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printd(DEBUG_HARDDRIVE,"ataControllerIsReady: returning %02X\n",lStatus);
#endif
    return true;
}

static bool ataStatusIsOk(struct ataDeviceInfo_t* devInfo)
{
	unsigned char status = inb(devInfo->ioPort+ATA_PORT_STATUS);

	if (status & ATA_STATUS_BUSY)
		return false;
	if (status & ATA_STATUS_WRITE_ERROR)
		return true;
	if (!(status & ATA_STATUS_READY))
		return true;
	if (!(status & ATA_STATUS_SEEK))
		return true;
	return 1;
}

bool ataSelectDrive(struct ataDeviceInfo_t* devInfo, uint8_t head)
{
    ataWaitForIdle(devInfo);
    outb(devInfo->ioPort+ATA_DRIVE_SELECT, devInfo->driveHeadPortDesignation | (head& 0xF) ); 
    //printk("Sending 0x%02X", drive==master?ATA_DRIVE_MASTER:ATA_DRIVE_SLAVE | (head& 0xF));
    if (!ataStatusIsOk(devInfo))
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printd(DEBUG_HARDDRIVE,"ataSelectDrive: Failed to select drive %u, bus %u, status=0x%02X is not ok\n", devInfo->driveNo, devInfo->bus, inb(devInfo->ioPort+ATA_PORT_STATUS));
#endif
            return inb(devInfo->ioPort+ATA_PORT_STATUS);
    }
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
    {
        wait(10);
        unsigned lDrive=inb(devInfo->ioPort+ATA_DRIVE_SELECT);
            printd(DEBUG_HARDDRIVE,"ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
    }
#endif
        
    return 0;
}
/*
static void ataHDOut(unsigned int drive,unsigned int nsect,unsigned int sect,
		unsigned int head,unsigned int cyl,unsigned int cmd)
{
	unsigned short port;

	if (drive>1 || head>15)
            panic("invalid drive/head 0x%02X/0x02X", drive/head);
	if (!ataControllerIsReady())
            panic("ataHDOut: hd %u not ready");
        ataSelectDrive(drive, head);
        
	//outb(hd_info[drive].ctl,HD_CMD);
	port=devInfo->ioPort+ATA_PORT_DATA+1 ;
	outb(++port,nsect);
	outb(++port, sect);
	outb(++port, cyl);
	outb(++port, cyl>>8);
	outb(++port, 0xA0 |(drive<<4)|head);
	outb(++port, cmd);
}
*/
static void ataResetController(struct ataDeviceInfo_t* devInfo)
{
        outb(devInfo->ioPort+ATA_PORT_COMMAND, 4);
        waitTicks(kTicksPerSecond/10);
        outb(devInfo->ioPort+ATA_PORT_CONTROL, 1<<2);
        wait(10);
        outb(devInfo->ioPort+ATA_PORT_CONTROL, 0);
        if (!ataControllerIsReady(devInfo))
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printd(DEBUG_HARDDRIVE,"HD-controller still busy\n");
#endif
        if ((hdError = inb(devInfo->ioPort+ATA_PORT_ERROR)) != 0 && (hdError = inb(devInfo->ioPort+ATA_PORT_ERROR)) != 4)
            printd(DEBUG_HARDDRIVE,"Controller reset failed on %s bus: %02x\n",devInfo->bus==0?"Primary":"Secondary", hdError);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printd(DEBUG_HARDDRIVE,"ataResetController: controller is ready\n");
#endif
}
int ataInit(struct ataDeviceInfo_t* devInfo)
{
    ataResetController(devInfo);
    int cStatus=0, ticks=0;
    ataSelectDrive(devInfo,0);
    outb(devInfo->ioPort+ATA_PORT_SECTORCOUNT, 0x55);
    outb(devInfo->ioPort+ATA_PORT_SECTOR_NUMBER, 0xAA);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW,0x55);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH,0xAA);
    outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
    wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
    cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
    if (cStatus==0)
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printd(DEBUG_HARDDRIVE,"Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
        return false;
    }
    if ((cStatus & 1) == 1)
    {
        int err = inb(devInfo->ioPort+ATA_PORT_ERROR);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printd(DEBUG_HARDDRIVE,"drive %02X, cStatus=%02X, errreg=%02X\n",devInfo->driveNo, cStatus,err);
#endif
        if (err!=4)
            return false;
        useCDROMIdentify = true;
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (cStatus==0)
        {
#ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
                printd(DEBUG_HARDDRIVE,"Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
            return false;
        }
    }
    ticks=ATA_STANDARD_WAIT_MS*kTicksPerMS;
    while ((cStatus & ATA_STATUS_BUSY) == ATA_STATUS_BUSY && (ticks>0))
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
        ticks--;
    }
    if (!ataControllerIsReady(devInfo))
        return false;
    if (inb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW)!=0x55 || inb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH)!=0xaa)
    {
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
        printd(DEBUG_HARDDRIVE,"Cylinder port non-zero (%X,%X), device is non-ATA\n",inb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW), inb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH));
#endif
        if (useCDROMIdentify)
            return true;
        else
            return false;
    }
    return true;
}

void ataGetModelFromIdentify(struct ataDeviceInfo_t* devInfo)
{
    uint16_t* ident=devInfo->ATAIdentifyData+27;
    for (int cnt=0;cnt<40;cnt+=2)
    {
        devInfo->ATADeviceModel[cnt]=(*ident >> 8) & 0xFF;
        devInfo->ATADeviceModel[cnt+1]=(*ident++) & 0xFF;
    }
    devInfo->ATADeviceModel[79]='\0';
}

int ataIdentify(struct ataDeviceInfo_t* devInfo)
{
    //For ATA devices, read the identity data.  For SATA, we've already read it into ATAIdentityData
    if (devInfo->queryATAData)
    {
        if (useCDROMIdentify)
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_CDROM_COMMAND);
        else
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
        wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
        for (int readCount=0;readCount<=255;readCount++)
        {
            devInfo->ATAIdentifyData[readCount]=inw(devInfo->ioPort+ATA_PORT_DATA);
        }
    }
    ataGetModelFromIdentify(devInfo);
    devInfo->totalSectorCount = devInfo->ATAIdentifyData[60] | (devInfo->ATAIdentifyData[61]<<16);
    devInfo->sectorSize = (devInfo->ATAIdentifyData[106] & 1<<12)==1<<12
            ?devInfo->ATAIdentifyData[117] | (devInfo->ATAIdentifyData[18]<<16)
            :512;
    devInfo->dmaSupported=devInfo->ATAIdentifyData[49]>>8 & 0x1;
    devInfo->lbaSupported=devInfo->ATAIdentifyData[49]>>9 & 0x1;
    devInfo->lba48Supported=devInfo->ATAIdentifyData[83]>>10 & 0x1;
    
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
        printd(DEBUG_HARDDRIVE,"drive %d, model=%s\n",devInfo->driveNo, devInfo->ATADeviceModel);
#endif
    return 1;
}

int ataScanForHarddrives()
{
    kATADeviceInfo[0].bus=ATAPrimary;
    kATADeviceInfo[0].driveNo=0;
    kATADeviceInfo[0].ioPort=0x1F0;
    kATADeviceInfo[0].irqNum=0x14;
    kATADeviceInfo[0].driveHeadPortDesignation=0xA0;
    kATADeviceInfo[0].queryATAData=true;
    kATADeviceInfo[0].ATADeviceAvailable=ataInit(&kATADeviceInfo[0]);
    if (kATADeviceInfo[0].ATADeviceAvailable)
    {
        ataIdentify(&kATADeviceInfo[0]);
        if (useCDROMIdentify)
            kATADeviceInfo[0].ATADeviceType=ATA_DEVICE_TYPE_CD;
        else
            kATADeviceInfo[0].ATADeviceType=ATA_DEVICE_TYPE_HD;
    }
    useCDROMIdentify=false;

    kATADeviceInfo[1].bus=ATAPrimary;
    kATADeviceInfo[1].driveNo=1;
    kATADeviceInfo[1].ioPort=0x1F0;
    kATADeviceInfo[1].irqNum=0x14;
    kATADeviceInfo[1].driveHeadPortDesignation=0xB0;
    kATADeviceInfo[1].queryATAData=true;
    kATADeviceInfo[1].ATADeviceAvailable=ataInit(&kATADeviceInfo[1]);
    if (kATADeviceInfo[1].ATADeviceAvailable)
    {
        ataIdentify(&kATADeviceInfo[1]);
        if (useCDROMIdentify)
            kATADeviceInfo[1].ATADeviceType=ATA_DEVICE_TYPE_CD;
        else
            kATADeviceInfo[1].ATADeviceType=ATA_DEVICE_TYPE_HD;
    }
    kATADeviceInfo[2].bus=ATASecondary;
    kATADeviceInfo[2].driveNo=2;
    kATADeviceInfo[2].ioPort=0x170;
    kATADeviceInfo[2].irqNum=0x15;
    kATADeviceInfo[2].driveHeadPortDesignation=0xA0;
    kATADeviceInfo[2].queryATAData=false;
    kATADeviceInfo[2].ATADeviceAvailable=ataInit(&kATADeviceInfo[2]);
    if (kATADeviceInfo[2].ATADeviceAvailable)
    {
        ataIdentify(&kATADeviceInfo[2]);
        if (useCDROMIdentify)
            kATADeviceInfo[2].ATADeviceType=ATA_DEVICE_TYPE_CD;
        else
            kATADeviceInfo[2].ATADeviceType=ATA_DEVICE_TYPE_HD;
    }

    kATADeviceInfo[3].bus=ATASecondary;
    kATADeviceInfo[3].driveNo=3;
    kATADeviceInfo[3].ioPort=0x170;
    kATADeviceInfo[3].irqNum=0x15;
    kATADeviceInfo[3].driveHeadPortDesignation=0xB0;
    kATADeviceInfo[3].queryATAData=true;
    kATADeviceInfo[3].ATADeviceAvailable=ataInit(&kATADeviceInfo[3]);
    if (kATADeviceInfo[3].ATADeviceAvailable)
    {
        ataIdentify(&kATADeviceInfo[3]);
        if (useCDROMIdentify)
            kATADeviceInfo[3].ATADeviceType=ATA_DEVICE_TYPE_CD;
        else
            kATADeviceInfo[3].ATADeviceType=ATA_DEVICE_TYPE_HD;
    }

#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
        printd(DEBUG_HARDDRIVE,"INIT: Disk1=%s  Disk2=%s\n", kATADeviceInfo[0].ATADeviceModel, kATADeviceInfo[1].ATADeviceModel);
#endif
            return 0;
}
int ataReadDisk(struct ataDeviceInfo_t* devInfo, uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
    atablockingReadDev = devInfo;
    if (sector_count==0)    //this function can be called with a sector_count of 0 in order to set partOffset
        return -1;
    return ataBlockingRead28(sector, buffer, sector_count);
}

int ataBlockingRead28(uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
    //For now if the FAT library calls this, we assume we've already read the same partition most recently
    int lResult=0;
    uint8_t* bufp=buffer;
    uint32_t lSectorsLeft=sector_count;
    uint32_t lSector=sector+partOffset; //this represents the start of the partition

#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
        {
            printd(DEBUG_HARDDRIVE,"ataBlockingRead28: sec: 0x%08X, buf 0x%08X, cnt 0x%08X\n", lSector, bufp, sector_count);
        }
#endif
    lResult=ataWaitForIdle(atablockingReadDev);
    if (lResult)
        panic("ataBlockingRead28: Timeout waiting for DRQ and BSY to be clear (0x%02X)", lResult);
        //Select the drive we want
        //NOTE: Drive selected prior to calling this function
        //ataSelectDrive(drive,0);
        //Magic bit (6) to set LBA mode and top 4 bits of LBA28 sector # go in bottom 4
    outb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT, inb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT) | (1 << 6) | ((lSector >> 24) & 0x0F));

    //Send the sector count (8 bit))
    outb(atablockingReadDev->ioPort+ATA_PORT_SECTORCOUNT, sector_count);

    //Send the LBA sector number in the next 3 fields + high bit in the 
    outb(atablockingReadDev->ioPort+ATA_PORT_SECTOR_NUMBER, (lSector) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_CYLINDER_LOW, (lSector >> 8) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_CYLINDER_HIGH, (lSector >> 16) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_COMMAND, ATA_COMMAND_READ_SECTOR);
    lResult=ataWaitForDRQ(atablockingReadDev, true, ATA_STANDARD_WAIT_MS*kTicksPerMS);
    if (lResult)
        panic("ataBlockingRead28: Timeout waiting for DRQ to be set Stts=0x%02X, Err=0x%02X", lResult, hdError);
    while (lSectorsLeft)
    {
        insw(atablockingReadDev->ioPort+ATA_PORT_DATA, bufp, 256);
        #ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            {
                printd(DEBUG_HARDDRIVE,"ataBlockingRead28: Debugging: ");
                for (int cnt2=0;cnt2<20;cnt2++)
                    printd(DEBUG_HARDDRIVE,"%02X ", bufp[cnt2]);
                printd(DEBUG_HARDDRIVE,"\n");
            }
        #endif
        if (--lSectorsLeft>0) //zero based vs 1 based
        {
            wait(50);
            lResult=ataWaitForDRQ(atablockingReadDev, true, ATA_STANDARD_WAIT_MS*kTicksPerMS);
            bufp+=512;
            lSector++;
            if (lResult)
                panic("ataBlockingRead28: Timeout in read loop, waiting for DRQ to be set Stts=0x%02X, Err=0x%02X", lResult, hdError);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
        {
            printd(DEBUG_HARDDRIVE,"ataBlockingRead28: sec=0x%08X, buf=0x%08X, rep=0x%08X    \n", lSector, bufp, lSectorsLeft);
            waitForKeyboardKey();
        }
#endif
        }
    }
    return 512*sector_count;
}

int ataBlockingWrite28(/*unsigned drive, */uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
    return 0;
/*    int drive=0;
    int lResult=0;
    uint32_t lSector=sector+partOffset; //temporarily add 2048 sectors to adjust to first partition
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("ataBlockingRead28: sec: 0x%08X, buf 0x%08X, cnt 0x%08X\n", lSector, buffer, sector_count);
#endif
    lResult=ataWaitForIdle();
    if (lResult)
        panic("ataBlockingRead28: Timeout waiting for DRQ and BSY to be clear (0x%02X)", lResult);
    
    //Select the drive we want
    ataSelectDrive(drive,0);
    //Magic bit (6) to set LBA mode and top 4 bits of LBA28 sector # go in bottom 4
    outb(devInfo.ioPort+ATA_DRIVE_SELECT, inb(devInfo.ioPort+ATA_DRIVE_SELECT) | (1 << 6) | ((lSector >> 24) & 0x0F));
   
    //Send the sector count (8 bit))
    outb(devInfo->ioPort+ATA_PORT_SECTORCOUNT, sector_count);

    //Send the LBA sector number in the next 3 fields + high bit in the 
    outb(devInfo->ioPort+ATA_PORT_SECTOR_NUMBER, (lSector >> 16) & 0xFF);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW, (lSector >> 8) & 0xFF);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH, lSector & 0xFF);
    outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_COMMAND_WRITE_SECTOR);
    for (int cnt=0;cnt<512;cnt+=2)
    {
        waitTicks(1);
        outw(devInfo->ioPort+ATA_PORT_DATA, buffer[cnt] | (buffer[cnt+1] << 8));
    }
SHOW_STATUS
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("ataBlockingWrite28: Finished sending data\n");
#endif
    return 512;
*/}
