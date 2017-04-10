#include <stdbool.h>
#include "../../../chrisOS/include/chrisos.h"
#include "i386/kPaging.h"
#include "pci/pci.h"
#include "memory.h"
#include "printf.h"
#include "ahci.h"
#include "init/ata_disk.h"
#include "ahcicommands.h"
#include "kbd.h"
#include "init/diskPartition.h"

#define PCI_CLASS_SATA 1
#define PCI_SUBCLASS_SATA 6

extern struct pci_device_t kPCISATADevice;
extern uint8_t KERNEL_DATA_SECTION kPCIDeviceCount;
extern uint8_t KERNEL_DATA_SECTION kPCIFunctionCount;
extern struct KERNEL_DATA_SECTION pci_device_t* kPCIDeviceHeaders;
extern struct KERNEL_DATA_SECTION pci_device_t* kPCIDeviceFunctions;
extern bool kInitDone;
extern uint32_t kDebugLevel;
extern struct ataDeviceInfo_t* kATADeviceInfo;
extern int ahciCapsCount;
extern ahcicaps_t* ahciCaps;
extern int kATADeviceInfoCount;
uint8_t ahciReadBuff[512];
int ahciHostCount = 2;

extern HBA_PORT* kAHCICurrentDisk;
extern partEntry_t kAHCICurrentPart;
extern HBA_MEM* ahciABAR;


// Check device type

int AhciIssueCmd(volatile HBA_PORT *port,int cmdslot) 
{
    unsigned i;
    int delay = 0;
    int Status = true;

    port->cmd.ST=0;
    //make sure bit0 Start set to enable process cmd list
    if (!(port->cmd.ST)) {
        printd(DEBUG_AHCI, "AHCI: ahciIssueCmd - ST was cleared, setting FRE and STE\n");
        port->cmd.FRE = 1;
        port->cmd.ST = 1;
    }

    //if err status or busy, reset PxCMD.
    if ((port->pxis.TFES || port->pxis.HBFS || port->pxis.HBDS || port->pxis.IFS || port->pxis.INFS || port->pxis.OFS || port->pxis.IPMS) || (port->tfd.BSY || port->tfd.BSY)) {
        printd(DEBUG_AHCI, "AHCI: ahciIssueCmd - clearing error/busy\n");
        port->cmd.ST &= ~port->cmd.ST;
        //Start|Command List Override|FIS Receive Enable
        port->cmd.CLO=1;
        while (port->cmd.CLO);
        port->cmd.ST = 1;
        port->cmd.FRE = 1;
        port->pxis.AsUlong = 0;
    }

    //issue cmd
    printd(DEBUG_AHCI, "AHCI: issueCmd - CI before issuing command: 0x%08X\n", port->ci);
    port->ci |= (1 << cmdslot);
    printd(DEBUG_AHCI, "AHCI: issueCmd - CI after issuing command: 0x%08X\n", port->ci);

    //wait cmd
    for (i = 0; i < 100; i++) {
        wait(50);
        if (!port->tfd.BSY)
            break;
    }

    // Wait for completion
    delay = 5000;
    while (delay > 0) {

        if ((port->ci & (1 << cmdslot)) == 0)
            break;
        // In some longer duration reads, it may be helpful to spin on the DPS bit 
        // in the PxIS port field as well (1 << 5)
        if (port->pxis.TFES) // Task file error
        {
            printd(DEBUG_AHCI, "AHCI: Read disk error\n");
            return -1;
        }
        wait(20);
        delay -= 1;
    }

    if (port->tfd.ERR || delay == 0)
        Status = -2;

    return Status;
}

int check_type(volatile HBA_PORT *port, uint32_t* sig) {
    uint32_t ssts = port->ssts;
    uint8_t ipm = (ssts >> 8) & 0x0F;
    uint8_t det = ssts & 0x0F;

    if (det != HBA_PORT_DET_PRESENT) // Check drive status
        return AHCI_DEV_NULL;
    if (ipm != HBA_PORT_IPM_ACTIVE)
        return AHCI_DEV_NULL;

    *sig = port->sig;
    switch (port->sig) {
        case SATA_SIG_ATAPI:
            return AHCI_DEV_SATAPI;
        case SATA_SIG_SEMB:
            return AHCI_DEV_SEMB;
        case SATA_SIG_PM:
            return AHCI_DEV_PM;
        case SATA_SIG_ATAPI & 0xFFFF0000:
            return AHCI_DEV_SATAPI;
        default:
            return AHCI_DEV_SATA;
    }
}

void ahciEnablePortMultiplier(volatile HBA_PORT* port) {
    HBA_CMD_HEADER* cmdheader = (HBA_CMD_HEADER*) port->clb;

    port->cmd.ST = 0;

    //waitForPortIdle(port);
    printk("Entered ahciEnablePortMultiplier, shouldn't be here?!?!?!\n");
    printd(DEBUG_AHCI, "AHCI: EnablePortMultipler: port=0x%08X\n", port);
    int slot = find_cmdslot(port);
    if (slot == -1)
        return;
    port->ie.AsUlong = 0; //xffffffff;
    cmdheader += slot;
    printd(DEBUG_AHCI, "AHCI: cmdheader=0x%08X\n", cmdheader);
    cmdheader->prdtl = 1;
    cmdheader->cfl = sizeof (FIS_REG_H2D) / sizeof (uint32_t);
    cmdheader->w = 0;
    cmdheader->c = 1; //required for reset
    cmdheader->p = 0;
    cmdheader->r = 1; //srst field

    HBA_CMD_TBL *cmdtbl = (HBA_CMD_TBL*) cmdheader->ctba;
    printd(DEBUG_AHCI, "AHCI: cmdtable=0x%08X,ctba=0x%08X\n", cmdtbl, cmdheader->ctba);
    cmdtbl->prdt_entry[0].dba = AHCI_DISK_BUFFER_ADDRESS;
    cmdtbl->prdt_entry[0].dbc = 0;
    cmdtbl->prdt_entry[0].i = 0;

    FIS_REG_H2D *cmdfis = (FIS_REG_H2D*) (&cmdtbl->cfis);
    memset(cmdfis, 0, sizeof (FIS_REG_H2D));
    cmdfis->fis_type = FIS_TYPE_REG_H2D;
    cmdfis->c = 0; // Control
    cmdfis->control |= (1 << 2); //reset bit
    cmdfis->pmport = 0xf;
    port->cmd.CLO = 1;
    while (port->cmd.CLO);
    port->cmd.ST = 1;
    port->ci |= slot;

    slot = find_cmdslot(port);
    if (slot == -1)
        return;
    port->ie.AsUlong = 0; //xffffffff;
    cmdheader += slot;
    printd(DEBUG_AHCI, "AHCI: cmdheader=0x%08X\n", cmdheader);
    cmdheader->prdtl = 1;
    cmdheader->cfl = sizeof (FIS_REG_H2D) / sizeof (uint32_t);
    cmdheader->w = 0;
    cmdheader->c = 1; //required for reset
    cmdheader->p = 0;
    cmdheader->r = 0; //srst field
    cmdtbl = (HBA_CMD_TBL*) cmdheader->ctba;
    printd(DEBUG_AHCI, "AHCI: cmdtable=0x%08X,ctba=0x%08X\n", cmdtbl, cmdheader->ctba);
    cmdtbl->prdt_entry[0].dba = AHCI_DISK_BUFFER_ADDRESS;
    cmdtbl->prdt_entry[0].dbc = 0;
    cmdtbl->prdt_entry[0].i = 0;

    cmdfis = (FIS_REG_H2D*) (&cmdtbl->cfis);
    memset(cmdfis, 0, sizeof (FIS_REG_H2D));
    cmdfis->fis_type = FIS_TYPE_REG_H2D;
    cmdfis->c = 0; // control
    cmdfis->control &= ~(1 << 2); //reset bit
    cmdfis->pmport = 0xf;
    port->ci |= slot;
}

bool ahciSpinupDrive(volatile HBA_PORT* port, int portno) {
    int waitMS = 0;
    port->sctl.SPD = 1;

    //enable_port_multiplier(&abar->ports[i]);
    //wait(1000);
    //stop_cmd(&abar->ports[i]);
    //port->cmd.PMA=1;
    //start_cmd(&abar->ports[i]);

    //Spin up the drive
    port->cmd.ST = 0;

    port->sctl.DET = 1;
    wait(100);
    port->sctl.DET = 0;


    waitMS = 1000;
    //wait for DET to be set to 1 or 3
    while (((port->ssts & 0xF) != 3) && ((port->ssts & 0xF) != 1) && (waitMS > 0)) {
        wait(10);
        waitMS -= 10;
    }
    if (waitMS == 0) {
        printd(DEBUG_AHCI, "AHCI: Error spinning up device,  DET not cleared (0x%08X)\n", port->ssts);
        //printd(DEBUG_AHCI,"****status=0x%08X, error=0x%08X, count=0x%08X\n",rfis->status,rfis->error,rfis->countl);
        printd(DEBUG_AHCI, "***tfd=0x%08X, ssts=0x%08X, serr=0x%08X, is=0x%08X\n", port->tfd, port->ssts, port->serr, port->pxis.AsUlong);
        printd(DEBUG_AHCI, "Attempting to continue ... \n");
    }
    //This should clear PxSERR
    ahciABAR->pi |= 1 << portno;
    printd(DEBUG_AHCI, "PxSERR=0x%08X\n", port->serr.AsUlong);
    waitMS = 1000;
    //Now wait for BSY(, DRQ and ERR to be cleared.
    while ((port->tfd.BSY || port->tfd.ERR) && waitMS > 0) {
        wait(10);
        waitMS -= 10;
    }
    if (waitMS == 0) {
        printd(DEBUG_AHCI, "AHCI: Error spinning up device, BSY, DRQ OR ERR not cleared (0x%08X)\n", port->ssts);
        //printd(DEBUG_AHCI,"****status=0x%08X, error=0x%08X, count=0x%08X\n",rfis->status,rfis->error,rfis->countl);
        printd(DEBUG_AHCI, "***tfd=0x%08X, ssts=0x%08X, serr=0x%08X, is=0x%08X\n", port->tfd, port->ssts, port->serr, port->pxis.AsUlong);
        printd(DEBUG_AHCI, "Attempting to continue ... \n");
    }
    port->cmd.ST = 1;
    if (waitMS == 0)
        return false;
    return true;
}

void ahciProbePorts(HBA_MEM *abar) {
    // Search disk in impelemented ports
    uint32_t pi = abar->pi;
    int i = 0;
    int rb = AHCI_PORT_BASE_REMAP_ADDRESS + (0x10000 * ahciHostCount); //probably only need 0xA000
    if (pi > 0)
        printd(DEBUG_AHCI, "AHCI: Probing ports via ABAR 0x%08X, value 0x%02X\n", abar, abar->pi);
    while (i < 32) {
        if (pi & 1) {
        ahci_enable_port(abar,i);
        //waitForPortIdle(&abar->ports[i]);
            uint32_t sig = 0;
            //Get the SATA device signature
            int dt = check_type(&abar->ports[i], &sig);
            printd(DEBUG_AHCI, "AHCI: Checking port %u (0x%08X), sig=%08X\n", i, &abar->ports[i], sig);
            //Found a SATA disk
            if (dt == AHCI_DEV_SATA) {
                printd(DEBUG_AHCI, "AHCI: SATA drive found at port %d (0x%08X)\n", i, &abar->ports[i]);
                printd(DEBUG_AHCI, "AHCI:\tCLB=0x%08X, fb=0x%08X\n", abar->ports[i].clb, abar->ports[i].fb);
                port_rebase(&abar->ports[i], i, rb);
                	//det reset, disable slumber and Partial state
			//reset port, send COMRESET signal
                ahciIdentify(&abar->ports[i], AHCI_DEV_SATA);
                /*                            if (!ahciRead(&abar->ports[i],0,0,1,ahciReadBuff))
                    printd(DEBUG_AHCI,"AHCI: error reading from device\n");
                else
                {
                    printk("AHCI: Successfully read sector 0 from device to 0x%08X\n",ahciReadBuff);
                    printk("AHCI: Read Buffer: %s\n",ahciReadBuff);
                    printk("sig=0x%08X\n",abar->ports[i].sig);
                }
                 */
            } else if (dt == AHCI_DEV_SATAPI) {
                printd(DEBUG_AHCI, "AHCI:SATAPI drive found at port %d (0x%08X)\n", i, &abar->ports[i]);
                printd(DEBUG_AHCI, "AHCI:\tCLB=0x%08X, fb=0x%08X\n", abar->ports[i].clb, abar->ports[i].fb);
                port_rebase(&abar->ports[i], i, rb);
                //Run an ATA_IDENTIFY
                ahciIdentify(&abar->ports[i], AHCI_DEV_SATAPI);
            } else if (dt == AHCI_DEV_SEMB) {
                printd(DEBUG_AHCI, "AHCI: SEMB drive found at port %d (0x%08X)\n", i, &abar->ports[i]);
                //port_rebase(abar->ports,i,rb+=0x10000);
            } else if (dt == AHCI_DEV_PM) {
                printd(DEBUG_AHCI, "AHCI: PM drive found at port %d (0x%08X)\n", i, &abar->ports[i]);
                //port_rebase(abar->ports,i,rb+=0x10000);
            }
            //			else
            //			{
            //				printk("No drive found at port %d\n", i);
            //			}
        }

        pi >>= 1;
        i++;
    }
}

void printAHCICaps() {
    //printk("ahciCaps=0x%08X, sizeof=%u\n",ahciCaps,sizeof(ahcicaps_t));
    terminal_clear();
    printk("AHCI Caps:\n");
    printk("\tSupports 64-bit Addressing (S64A):\t\t\t\t%s\n", ahciCaps->S64A ? "Yes" : "No");
    printk("\tSupprorts Native Command Queueing (SNCQ):\t\t%s\n", ahciCaps->SNCQ ? "Yes" : "No");
    printk("\tSupports SNotification Register (SSNTF):\t\t%s\n", ahciCaps->SSNTF ? "Yes" : "No");
    printk("\tSupports Mechanical Presence Switch (SMPS):\t\t%s\n", ahciCaps->SMPS ? "Yes" : "No");
    printk("\tSupports Staggered Spin-up (SSS):\t\t\t\t%s\n", ahciCaps->SSS ? "Yes" : "No");
    printk("\tSupports Aggressive Link Power Management (SALP):\t%s\n", ahciCaps->SALP ? "Yes" : "No");
    printk("\tSupports Active LED (SAL):\t\t\t\t\t%s\n", ahciCaps->SAL ? "Yes" : "No");
    printk("\tSupports Command List Override (SCLO):\t\t\t%s\n", ahciCaps->SCLO ? "Yes" : "No");
    printk("\tInterface Speed Support (ISS):\t\t\t\t%s\n", ahciCaps->ISS == 1 ? "1.5 Gbps" : ahciCaps->ISS == 2 ? "3 Gbps" : ahciCaps->ISS == 3 ? "6 Gbps" : "Reserved");
    printk("\tSupports AHCI mode only (SAM):\t\t\t\t%s\n", ahciCaps->SAM ? "Yes" : "No");
    printk("\tSupports Port Multiplier (SPM):\t\t\t\t%s\n", ahciCaps->SPM ? "Yes" : "No");
    printk("\tFIS-based Switching Support (FBSS):\t\t\t%s\n", ahciCaps->FBSS ? "Yes" : "No");   
    printk("\tPIO Multiple DRQ Block (PMD):\t\t\t\t\t%s\n", ahciCaps->PMD ? "Yes" : "No");
    printk("\tSlumber State Capable (SSC):\t\t\t\t\t%s\n", ahciCaps->SSC ? "Yes" : "No");
    printk("\tPartial State Capable (PSC):\t\t\t\t\t%s\n", ahciCaps->PSC ? "Yes" : "No");
    printk("\tNumber of Command Slots (NSC):\t\t\t\t%u\n", ahciCaps->NCS);
    printk("\tCommand Completion Coalescing Supported (CCCS):\t%s\n", ahciCaps->CCCS ? "Yes" : "No");
    printk("\tEnclosure Management Supported (EMS):\t\t\t%s\n", ahciCaps->EMS ? "Yes" : "No");
    printk("\tSupports External SATA (SXS):\t\t\t\t\t%s\n", ahciCaps->SXS ? "Yes" : "No");
    printk("\tNumber of Ports (NP):\t\t\t\t\t\t%u\n", ahciCaps->NP);
    //printk("Press a key for more ...");
    //waitForKeyboardKey();
    printk("AHCI: SATA Disks:\n");
    char p1[512];
    for (int cnt = 4; cnt < 10; cnt++)
        if (kATADeviceInfo[cnt].ATADeviceAvailable) {
            memset(p1, 0, 512);
            strcpy(p1, kATADeviceInfo[cnt].ATADeviceModel);
            printk("AHCI: Device %u:  %s", cnt, kATADeviceInfo[cnt].ATADeviceAvailable == 1 ? p1 : "none\n");
            printk("\t%uMB (%ubps %s%s%s)\n\t* ABAR/port: 0x%08X/0x%08X\n",
                    (kATADeviceInfo[cnt].totalSectorCount * kATADeviceInfo[cnt].sectorSize) / (1024 * 1024),
                    kATADeviceInfo[cnt].sectorSize,
                    kATADeviceInfo[cnt].lbaSupported ? ",LBA" : "",
                    kATADeviceInfo[cnt].lba48Supported ? ",LBA48" : "",
                    kATADeviceInfo[cnt].dmaSupported ? ",DMA" : "",
                    kATADeviceInfo[cnt].ABAR,
                    kATADeviceInfo[cnt].ioPort);
            volatile HBA_PORT* port = (HBA_PORT*) kATADeviceInfo[cnt].ioPort;
            HBA_CMD_HEADER* cmdheader = (HBA_CMD_HEADER*) port->clb;
            HBA_CMD_TBL *cmdtbl = (HBA_CMD_TBL*) cmdheader->ctba;
            printk("\t\tCLB=0x%08X, FB=0x%08X\n",port->clb,port->fb);
            printk("\t\tCMDHeader=0x%08X, CMDTable=0x%08X\n", port->clb, cmdheader->ctba);
        }
}

void port_rebase(volatile HBA_PORT *port, int portno, uintptr_t remapBase) {
    //each command list is 1k (32k possible per port))
    printd(DEBUG_AHCI, "AHCI: Rebasing port %u (0x%08X) clb/fb from 0x%08X/0x%08X\n\t", portno, port, port->clb, port->fb);
    stop_cmd(port); // Stop command engine

    // Command list offset: 1K*portno
    // Command list entry size = 32
    // Command list entry maxim count = 32
    // Command list maxim size = 32*32 = 1K per port
    port->clbu = 0;
    port->clb = (remapBase + (portno<<15) + 0x1000) & 0xFFFFF000;
    memset((void*) (port->clb), 0, 1024);
    kMapPage(port->clb,port->clb,0x73); //make un-cached
    
    //each FIS is 256 bytes
    // FIS offset: 32K+256*portno
    // FIS entry size = 256 bytes per port
    port->fbu = 0;
//    port->fb = (remapBase + (32 << 10) + (portno << 12) + 0x1000) & 0xFFFFF000;
    port->fb = (port->clb + 0x1000);
    memset((void*) (port->fb), 0, 256);
    kMapPage(port->fb,port->fb,0x73); //make un-cached


    // Command table offset: 40K + 8K*portno
    // Command table size = 256*32 = 8K per port
    HBA_CMD_HEADER *cmdheader = (HBA_CMD_HEADER*) (port->clb);
    for (int i = 0; i < 32; i++) {
        cmdheader[i].prdtl = 8; // 8 prdt entries per command table
        // 256 bytes per command table, 64+16+48+16*8
        // Command table offset: 40K + 8K*portno + cmdheader_index*256
        cmdheader[i].ctba = remapBase + (40 << 10) + (portno << 13) + (i << 8);
        cmdheader[i].ctbau = 0;
        memset((void*) cmdheader[i].ctba, 0, 256);
    }
    printd(DEBUG_AHCI, " to 0x%08X/0x%08X\n", port->clb, port->fb);
    start_cmd(port); // Start command engine
}

// Start command engine

void start_cmd(volatile HBA_PORT *port) {
    // Wait until CR (bit15) is cleared
    while (port->cmd.CR);

    // Set FRE (bit4) and ST (bit0)
    port->cmd.FRE = 1;
    port->cmd.ST = 1;
}

void waitForPortIdle(volatile HBA_PORT *port) {
    while (port->cmd.ST | port->cmd.CR | port->cmd.FRE | port->cmd.FR) {
        waitTicks(20);
    }
}

// Stop command engine

void stop_cmd(volatile volatile HBA_PORT *port) {
    // Clear ST (bit0)
    port->cmd.ST = 0;
    // Wait until FR (bit14), CR (bit15) are cleared
    while (1) {
        if (!(port->cmd.FR))
            break;
        if (!(port->cmd.CR))
            break;
        waitTicks(20);
    }

    // Clear FRE (bit4)
    port->cmd.FRE = 0;
}

void ahciIdentify(volatile HBA_PORT* port, int deviceType) {
    printd(DEBUG_AHCI, "AHCI: ahciIdentify, port@0x%08X(%u), 0x%08X\n", port, kATADeviceInfoCount, &port->clb);
    HBA_CMD_HEADER* cmdhdr = (HBA_CMD_HEADER*) port->clb;
    int slot = find_cmdslot(port);
    if (slot == -1)
        return;
    port->ie.AsUlong = 0xFFFFFFFF;
    HBA_CMD_HEADER* cmdheader = cmdhdr + slot;
    printd(DEBUG_AHCI, "AHCI: cmdheader=0x%08X\n", cmdheader);
    cmdheader->prdtl = 1;
    cmdheader->cfl = 5; //sizeof (FIS_REG_H2D) / sizeof (uint32_t);
    cmdheader->w = 0;
    cmdheader->a = 0;
    cmdheader->c = 0;
    cmdheader->p = 0;
    HBA_CMD_TBL *cmdtbl = (HBA_CMD_TBL*) cmdheader->ctba;
    memset(cmdtbl, 0, sizeof (HBA_CMD_TBL) +
            (cmdheader->prdtl - 1) * sizeof (HBA_PRDT_ENTRY));
    printd(DEBUG_AHCI, "AHCI: cmdtable=0x%08X,ctba=0x%08X\n", cmdtbl, cmdheader->ctba);
    cmdtbl->prdt_entry[0].dba = AHCI_DISK_BUFFER_ADDRESS;
    cmdtbl->prdt_entry[0].dbc = 0x1ff;
    cmdtbl->prdt_entry[0].i = 1;

    FIS_REG_H2D *cmdfis = (FIS_REG_H2D*) (&cmdtbl->cfis);
    cmdfis->fis_type = FIS_TYPE_REG_H2D;
    cmdfis->c = 1; // Command
    if (deviceType == AHCI_DEV_SATAPI)
        cmdfis->command = ATA_IDENTIFY_CDROM_COMMAND;
    else
        cmdfis->command = ATA_IDENTIFY_COMMAND;
    cmdfis->lba0 = 0;
    cmdfis->lba1 = 0;
    cmdfis->lba2 = 0;
    cmdfis->lba3 = 0;
    cmdfis->lba4 = 0;
    cmdfis->lba5 = 0;
    cmdfis->lba5 = 0;
    cmdfis->pmport = 0;
    cmdfis->device = 0;
    cmdfis->countl = 1;
    cmdfis->counth = 0;
    int lCmdVal = AhciIssueCmd(port, slot);
    if (!lCmdVal) {
        printk("AHCI: ***Error identifying device (%u)***\n",lCmdVal);
        return;
    }
    kATADeviceInfo[kATADeviceInfoCount].ATADeviceAvailable = true;
    kATADeviceInfo[kATADeviceInfoCount].bus = SATA;
    kATADeviceInfo[kATADeviceInfoCount].driveNo = kATADeviceInfoCount;
    kATADeviceInfo[kATADeviceInfoCount].ioPort = (uintptr_t) port;
    kATADeviceInfo[kATADeviceInfoCount].irqNum = 0;
    kATADeviceInfo[kATADeviceInfoCount].driveHeadPortDesignation = 0x0;
    kATADeviceInfo[kATADeviceInfoCount].queryATAData = false;
    if (deviceType == AHCI_DEV_SATAPI)
        kATADeviceInfo[kATADeviceInfoCount].ATADeviceType=ATA_DEVICE_TYPE_SATA_CD;
    else
        kATADeviceInfo[kATADeviceInfoCount].ATADeviceType=ATA_DEVICE_TYPE_SATA_HD;
    kATADeviceInfo[kATADeviceInfoCount].ABAR=ahciABAR;
    memcpy(kATADeviceInfo[kATADeviceInfoCount].ATAIdentifyData, (void*) AHCI_DISK_BUFFER_ADDRESS, 512);
    ataIdentify(&kATADeviceInfo[kATADeviceInfoCount++]);
    printd(DEBUG_AHCI, "AHCI: SATA device found, name=%s\n", kATADeviceInfo[kATADeviceInfoCount - 1].ATADeviceModel);
}
// Find a free command list slot

int find_cmdslot(volatile HBA_PORT *port) {
    printd(DEBUG_AHCI, "AHCI: find_cmdslot - finding a slot to use to execute a command\n");
    // An empty command slot has its respective bit cleared to �0� in both the PxCI and PxSACT registers.
    // If not set in SACT and CI, the slot is free // Checked
    
    uint32_t slots = (/*port->sact | */port->ci);
    int num_of_slots = ahciABAR->cap.NCS;
    printd(DEBUG_AHCI,"ahciABAR = %08X, Total slots available: %d\n",ahciABAR, ahciABAR->cap.NCS);
    int i;
    for (i = 0; i < num_of_slots; i++) {

        if ((slots & 1) == 0) {
            printd(DEBUG_AHCI, "AHCI: [command slot is : %d]\n", i);
            return i;

        }
        printd(DEBUG_AHCI, "Slot %u is busy (0x%08X)\n", i,slots);
        slots >>= 1;
    }
    printd(DEBUG_AHCI, "AHCI: Cannot find free command list entry, count=%u, slots=0x%08X\n", num_of_slots, slots);
    return -1;
}

#define ATA_DEV_BUSY 0x80
#define ATA_DEV_DRQ 0x08

void ahciSetCurrentDisk(volatile HBA_PORT* port) {
    kAHCICurrentDisk = port;
}

void ahciSetCurrentPart(partEntry_t part) 
{
    kAHCICurrentPart = part;
}

int ahciRead(volatile HBA_PORT* port, int sector, uint8_t* buffer, int sector_count) {
    ahciSetCurrentDisk(port);
    if (ahciBlockingRead28(sector, buffer, sector_count))
        return sector_count;
    else
        return 0;
}

///Read the current disk *partition* 
int ahciBlockingRead28(uint32_t sector, uint8_t *buffer, uint32_t sector_count) {
    int prdCntr = 0;

    //CLR 06/07/2016 - Must add partition start sector
    sector+=kAHCICurrentPart.partStartSector;
    
    memset(buffer,0,sector_count*512);
    
    printd(DEBUG_AHCI, "AHCI: read on port=0x%08X,sector=0x%08X,buffer=0x%08X,sector_count=%u\n", kAHCICurrentDisk,sector,buffer,sector_count);

    kAHCICurrentDisk->pxis.AsUlong = (uint32_t) - 1; // Clear pending interrupt bits
    int spin = 0; // Spin lock timeout counter

    HBA_CMD_HEADER* cmdhdr = (HBA_CMD_HEADER*) kAHCICurrentDisk->clb;
    int slot = find_cmdslot(kAHCICurrentDisk);
    if (slot == -1)
        return false;
    HBA_CMD_HEADER* cmdheader = cmdhdr + slot;
    printd(DEBUG_AHCI, "AHCI: cmdheader=0x%08X\n", cmdheader);
    cmdheader->prdtl = (uint16_t) ((sector_count - 1) >> 4) + 1; // PRDT entries count

    HBA_CMD_TBL *cmdtbl = (HBA_CMD_TBL*) (cmdheader->ctba);
    memset(cmdtbl, 0, sizeof (HBA_CMD_TBL) +
            (cmdheader->prdtl - 1) * sizeof (HBA_PRDT_ENTRY));
    printd(DEBUG_AHCI, "AHCI: read - cmdtable=0x%08X,ctba=0x%08X\n", cmdtbl, cmdheader->ctba);

    // 8K bytes (16 sectors) per PRDT
    for (int i = 0; i < cmdheader->prdtl - 1; i++) {
        cmdtbl->prdt_entry[prdCntr].dba = (uint32_t) buffer;
        cmdtbl->prdt_entry[prdCntr].dbc = 8 * 1024; // 8K bytes
        cmdtbl->prdt_entry[prdCntr].i = 1;
        buffer += 4 * 1024; // 4K words
        sector_count -= 16; // 16 sectors
        prdCntr++;
    }
    // Last entry
    cmdtbl->prdt_entry[prdCntr].dba = (uint32_t) buffer;
    cmdtbl->prdt_entry[prdCntr].dbc = sector_count << 9; // 512 bytes per sector
    cmdtbl->prdt_entry[prdCntr].i = 1;

    // Setup command
    FIS_REG_H2D *cmdfis = (FIS_REG_H2D*) (&cmdtbl->cfis);

    cmdfis->fis_type = FIS_TYPE_REG_H2D;
    cmdfis->c = 1; // Command
    cmdfis->command = ATA_CMD_READ_DMA_EX;
    cmdfis->lba0 = (uint8_t) sector;
    cmdfis->lba1 = (uint8_t) (sector >> 8);
    cmdfis->lba2 = (uint8_t) (sector >> 16);
    cmdfis->device = 1 << 6; // LBA mode

    cmdfis->lba3 = (uint8_t) (sector >> 24);
    cmdfis->lba4 = (uint8_t) 0;
    cmdfis->lba5 = (uint8_t) 0;

    cmdfis->countl = LOBYTE((uint16_t) sector_count);
    cmdfis->counth = HIBYTE((uint16_t) sector_count);

    int lCMdVal = AhciIssueCmd(kAHCICurrentDisk, slot);
    if (!lCMdVal) {
        printd(DEBUG_AHCI, "AHCI: ***Error reading from disk***\n");
        return -1;
    }

    // Check again
    if (kAHCICurrentDisk->pxis.TFES) {
        printd(DEBUG_AHCI, "AHCI: Read disk error\n");
        return false;
    }

    return true;
}

int ahciBlockingWrite28(/*unsigned drive, */uint32_t sector, uint8_t *buffer, uint32_t sector_count) {
    return 0;
}

bool ahciInit() {
    kATADeviceInfoCount = 4;
    bool ahciDeviceFound = false;
    char buffer[150];

    memset(buffer, 0, 150);

    if (!kPCIDeviceCount) {
        printd(DEBUG_AHCI, "AHCI: PCI not initialized, cannot initialize AHCI.");
        return false;
    }

    for (int cnt = 0; cnt < kPCIDeviceCount; cnt++)
        if (kPCIDeviceHeaders[cnt].class == 1 && kPCIDeviceHeaders[cnt].subClass == 6) 
        {
            memcpy(&kPCISATADevice, &kPCIDeviceHeaders[cnt], sizeof (struct pci_device_t));
            ahciDeviceFound = true;
            printd(DEBUG_AHCI, "AHCI: Found AHCI controller (D) (%02X/%02X/%02X) '%s'\n", cnt, kPCIDeviceHeaders[cnt].class, kPCIDeviceHeaders[cnt].subClass, getDeviceNameP(&kPCISATADevice, buffer));
            printd(DEBUG_AHCI, "ABAR is at: before/remapped - 0x%08X/", kPCISATADevice.baseAdd[5]);
            ahciABAR = (HBA_MEM*) AHCI_ABAR_REMAPPED_ADDRESS + (0x10 * ahciHostCount);
                kMapPage((uintptr_t) ahciABAR, kPCISATADevice.baseAdd[5] , 0x73); //0x63 + cache disabled
                kMapPage(kPCISATADevice.baseAdd[5],kPCISATADevice.baseAdd[5],0x73);
            RELOAD_CR3
            memcpy((void*) &ABARs[ahciHostCount++], (void*) ahciABAR, sizeof (HBA_MEM));
            printd(DEBUG_AHCI, "0x%08X\n", ahciABAR);
            memcpy(&ahciCaps[ahciCapsCount++], (void*) ahciABAR, sizeof (ahcicaps_t));
            if (!(ahciABAR->ghc.AE)) {
                printd(DEBUG_AHCI,"switching to AHCI mode\n");
                ahciABAR->ghc.AE=1;
            }
            ahciABAR->ghc.IE=1;
            if (ahciABAR->cap2 & 1) {
                panic("Write support for BIOS handoff!!!");
            }
            ahciProbePorts((HBA_MEM*) ahciABAR);
        }
    for (int cnt = 0; cnt < kPCIDeviceCount; cnt++)
        if (kPCIDeviceFunctions[cnt].class == 1 && kPCIDeviceFunctions[cnt].subClass == 6) 
        {
            memcpy(&kPCISATADevice, &kPCIDeviceFunctions[cnt], sizeof (struct pci_device_t));
            ahciDeviceFound = true;
            printd(DEBUG_AHCI, "AHCI: Found AHCI controller (F) (%02X/%02X/%02X) '%s'\n", cnt, kPCIDeviceFunctions[cnt].class, kPCIDeviceFunctions[cnt].subClass, getDeviceNameP(&kPCISATADevice, buffer));
            printd(DEBUG_AHCI, "ABAR is at: 0x%08X\n", kPCISATADevice.baseAdd[5]);
            ahciABAR = (HBA_MEM*) AHCI_ABAR_REMAPPED_ADDRESS + (0x10 * ahciHostCount);
            kMapPage((uintptr_t) ahciABAR, kPCISATADevice.baseAdd[5], 0x73); //0x63 + cache disabled
            RELOAD_CR3
            memcpy((void*) &ABARs[ahciHostCount++], (void*) ahciABAR, sizeof (HBA_MEM));
            printd(DEBUG_AHCI, "Remapped ABAR is now at: 0x%08X\n", ahciABAR);
            memcpy(&ahciCaps[ahciCapsCount], (void*) ahciABAR, sizeof (ahcicaps_t));
            if (!(ahciABAR->ghc.AE)) {
                printd(DEBUG_AHCI,"switching to AHCI mode\n");
                ahciABAR->ghc.AE=1;
            }
            ahciABAR->ghc.IE=1;
            if (ahciABAR->cap2 & 1) {
                panic("Write support for BIOS handoff!!!");
            }
            ahciProbePorts((HBA_MEM*) ahciABAR);
        }
    if (!ahciDeviceFound) {
        printd(DEBUG_AHCI, "AHCI: No AHCI devices found.");
        return false;
    }


    return true;
}

void ahci_port_activate_device(HBA_MEM* h, HBA_PORT* p)
{
    printd(DEBUG_AHCI,"activate port %d @ 0x%08X:\n", p - h->ports,p);
    /* first check the presence flag */
    if ( (p->ssts & 0x7) == HBA_PORT_DET_NOT_PRESENT) { //check DET status
                    printd(DEBUG_AHCI,"activate: DET_NOT_PRESENT\n");
                    /* nothing attached? */
                    if (p->cmd.CPD) { /* we rely on CPD */
                                    if (!p->cmd.CPS) {
                                                    printd(DEBUG_AHCI,"confirmed by CPD\n");
                                                    return;
                                    }
                                    /* there's something */
                                    if (!p->cmd.POD) {
                                                    p->cmd.POD = 1; /* power it */
                                                    wait(20);
                                    }
                                    if ((p->ssts & 0x7) != HBA_PORT_DET_NOT_PRESENT)
                                                    goto next_step;
                    }
                    /* spin-up? */
                    if (!p->cmd.SUD) { /* always !1 if cap.sss == 0 */
                                    printd(DEBUG_AHCI,"not spun-up yet?\n");
                                    if (p->serr.AsUlong & (1 << 26)) /* eXchange bit */
                                                    p->serr.AsUlong |= (1 << 26); /* RWC */
                                    if ((p->ssts & 0x7) != 0) { /* set to 0 prior sud */
                                                    p->sctl.DET = 0;
                                                    wait(20);
                                    }
                                    p->cmd.SUD = 1;
                                    waitTicks(5); /* wait 50 mus */
                                    if (p->serr.AsUlong & ((1 << 26) | (1 << 18))) { /* received sth. */
                                                    /* COMRESET, COMWAKE */
                                                    goto next_step;
                                    }
                                    /* send the reset */
                                    p->sctl.DET = 1;
                                    waitTicks(100);
                                    p->sctl.DET = 0;
                                    wait(20);
                                    if ((p->ssts & 0x7) != HBA_PORT_DET_NOT_PRESENT)
                                                    goto next_step;
                                    p->cmd.SUD = 0; /* we're done enter listening mode */
                                    printd(DEBUG_AHCI,"not present\n");
                                    goto exit;
                    }
                    /* just try ICC */
                    if (p->sctl.IPM != 1) {
                                    printd(DEBUG_AHCI,"IPM != ACTIVE\n");
                                    int ct = 50;
                                    while (p->cmd.ICC && ct--)
                                                    waitTicks(1);
                                    p->cmd.ICC = 1;
                                    wait(10);
                                    if ((p->ssts & 0x7) != HBA_PORT_DET_NOT_PRESENT)
                                                    goto next_step;
                                    printd(DEBUG_AHCI,"unable to set to active\n");
                                    goto exit;
                    }
    }

    /* det != 1*/
next_step:
    if ((p->ssts & 0x7) == HBA_PORT_DET_PRESENT) {
                    /* almost done */
                    if (p->sctl.IPM != HBA_PORT_IPM_ACTIVE) {
                                    int ct, wc;
                                    printd(DEBUG_AHCI,"Present but not active.\n");
activ:
                                    ct = 50, wc = 0;
rewait:
                                    while (p->cmd.ICC && ct--) /* 500ms */
                                                    waitTicks(1);
                                    if (p->sctl.IPM != HBA_PORT_IPM_ACTIVE && !wc) {
                                                    p->cmd.ICC = 1;
                                                    waitTicks(1);
                                                    wc++; ct = 50;
                                                    goto rewait;
                                    }
                                    if (wc) {
                                                    /* reset */
                                                    p->sctl.DET = 1;
                                                    waitTicks(100);
                                                    goto next_step;
                                    }
                    }
                    printd(DEBUG_AHCI,"Device at port %d is active and present.\n",
                                    p - h->ports);
                    printd(DEBUG_AHCI,"details: %x %x %x %u %u\n", p->serr, p->tfd.AsUchar,
                                    p->tfd.ERR, (p->ssts & 0x7), p->sctl.IPM);
                    return;
    } else if ((p->ssts & 0x7) == 4/*?*/) {
                    /* just deactivated */
                    printd(DEBUG_AHCI,"PHY offline mode\n");
                    goto activ;
    } else if ((p->ssts & 0x7) == 5/*DET_PRESENT_NO_PHY*/) {
                    printd(DEBUG_AHCI,"PRESENT_NO_PHY mode\n");
                    goto activ; /* try the same */
    }
exit:
                    /* we're really done */
                    printd(DEBUG_AHCI,"Not present at port %d\n", p - h->ports);
                    return;
}

void ahci_enable_port(HBA_MEM* ad, int pt)
{
        HBA_PORT* p = &ad->ports[pt];
        int reset_ct = 0;
 
        /* skip non-implemented ports */
        if (!(ad->pi & (1 << pt)))
                return;
 
Pos1:
        /* clear old data */
        p->serr.AsUlong = 0xffffffff; /* 10.1.2 -> 6. */
        p->pxis.AsUlong = 0xffffffff; /* clear all pending interrupts */
 
        /* first allow for the reception of FISes */
        p->cmd.FRE = 1;
        wait(20); /* wait for BSY to show up */
        while (1) {
                uint8_t sts = p->tfd.AsUchar;
                if (sts & 1) {
                        /* something went wrong! */
                        if (sts == 0x7f) /* no device */
                                break;
                        else if (sts == 0x41 && p->tfd.ERR == 0x20) {
                                if (p->sig == SATA_SIG_ATAPI)
                                        break; /* no medium */
                        }
                        printk("port%d indicated task file error %x"
                                " while starting up.\n", pt, p->tfd.ERR);
                        printd(DEBUG_AHCI,"AHCI: scr1: %x %x\n", p->serr.AsUlong, p->tfd.ERR);
                        printd(DEBUG_AHCI,"AHCI: tfd: %x %x\n", p->tfd.AsUchar, p->tfd.ERR);
                        p->serr.AsUlong = 0xffffffff;
                        if (!reset_ct++) {
                                ahci_port_activate_device(ad, p);
                                goto Pos1;
                        } else if (reset_ct == 1) {
                                /*ahci_reset_port(ad->ptr, p);*/
                                goto Pos1;
                        } else
                                goto defer;
                }
                if (!(sts & (0x80 | 0x8)))
                        break;
                wait(50);
        }
 
        /* set ST only if BSY,DRQ and DET=3h or IPM=2,6,8 */
        if ((p->ssts & 0x7) != 3)
                ahci_port_activate_device(ad, p);
        if (p->tfd.AsUchar & (0x80 | 0x8))  //BSY | DRQ
                goto defer; /* listen */
        if (!(((p->ssts & 0x7) == 3) || (p->sctl.IPM == 2) ||
                (p->sctl.IPM == 6) || (p->sctl.IPM == 8)))
                goto defer;
        /* we're allowed so set it */
        p->cmd.ST = 1;
        /* Change in PhyRdy, CPS, TFS.err, PCS, DPS(I=1), UFS, HBFS, HBDS, IFS */
        p->ie.AsUlong = (1 << 22) | (1 << 6) | (1 << 31) | (1 << 30)
                | (1 << 5) | (1 << 4) | (1 << 29) | (1 << 28) | (1 << 27);
 
        ///* issue the IDENTIFY_(PACKET)_DEVICE command */
        //ahci_issue_command(ad, pt, 0, disk_cmd_identify, 0, 0, NULL, NULL /* wq_worker_ad*/);
 
        printd(DEBUG_AHCI,"AHCI: port %d is now processing commands\n", pt);
        return;
 
defer: /* we're interested in status changes only */
        printd(DEBUG_AHCI,"AHCI: port %d set to listening mode\n", pt);
        p->ie.AsUlong = (1 << 22) | (1 << 31) | (1 << 6); /* PhyRdy change, CPS, CCS */
}
