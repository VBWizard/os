#define USE_FILELIB_STDIO_COMPAT_NAMES 1
#include <stdbool.h> /* C doesn't have booleans by default. */
#include "../fat/fat_filelib.h"
#include <stdint.h>
#include "multiboot.h"
#include "utility.h"
#include "memory.h"
#include "init/initVars.h"
#include "i386/gdt.h"
#include "i386/cpu.h"
#include "io.h"
#include "printf.h"
#include "init/ata_disk.h"
#include "build_num.h"
#include "chrisos.h"
#include "pci/pci.h"
#include "i386/kPaging.h"
#include "init/ata_disk.h"
#include "filesystem.h"
#include "../../include/time_os.h"
#include "elfloader.h"
#include "i386/bits/types.h"
#include "init/ata_disk.h"
#include "kbd.h"
#include "filesystem.h"
#include "i386/apic.h"
#include "ahci.h"
#include "kernelObjects.h"

extern uint32_t storeGDT(struct gdt_ptr* gdtp);
extern void set_gdt(struct gdt_ptr *);
extern int detect_cpu();
extern bool kInitDone;
extern bool kPagingInitDone;
struct cpuinfo_t kcpuInfo;
extern void identifyCPUFeatures(cpuid_features_t* cpuFeatures);
extern char   __BUILD_DATE;
extern char   __BUILD_NUMBER;
extern void pciInitialize();
extern void kSetPhysicalRangeRO(uint32_t startAddy, uint32_t endPage, bool readOnly);
extern void kUnMapPage(uintptr_t mapTo);
extern uint64_t kE820MemoryBytes;
extern struct mbr_t* kMBR;
extern uint8_t* lowSmapTablePtr;
extern uint32_t kOriginalAddressZeroValue;
extern uint8_t smpBootCPUCount, smpBootCPUsStarted;
extern void bootShell();
extern void AP_startup();
extern int ahciBlockingWrite28(/*unsigned drive, */uint32_t sector, uint8_t *buffer, uint32_t sector_count);
extern int ahciBlockingRead28(uint32_t sector, uint8_t *buffer, uint32_t sector_count);

bool ParamExists(char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char* cmdToFind, int paramCount);

char kBootParams[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
int kBootParamCount;
struct gdt_ptr lGDT;

//CLR 04/27/2016: Even though we are working on our cross compiler env, somehow __linus is set
//so unset it
#undef __linux__
/* Check if the compiler thinks we are targeting the wrong operating system. */
#if defined(__linux__)
#error "You are not using a cross-compiler, you will most certainly run into trouble"
#endif

/* This tutorial will only work for the 32-bit ix86 targets. */
#if !defined(__i386__)
#error "This tutorial needs to be compiled with a ix86-elf compiler"
#endif



/*Initially set the entries to:
 0 - blank
 1 (0x08) - code @ 0x0          <-- Exceptions/Interrupts code section: will eventually be set to 0xC0000000 & will belong to the exception handlers
 2 (0x10) - data @ 0x0          <-- Kernel data (DS/ES/FS/GS/SS): Will eventually be set to 0xC0000000 & will belong to the exception handlers
 3 (0x18) - data @ 0x0          <-- Non-kernel data (DS/ES/FS/GS/SS): Will always be 0x0
 4 (0x20) - code @ 0xC0000000   <-- will belong to the kernel proper
 5 (0x28) - code @ 0x0          <-- Non-kernel code (CS): Will always be 0x0
 */
void HIGH_CODE_SECTION gdt_init()
{
    gdtEntryApplication(0x1, 0, 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_CODE | GDT_READABLE,       //ring 0 starting at 0x00, always
              GDT_GRANULAR | GDT_32BIT,true);
    gdtEntryApplication(0x2, 0, 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_DATA | GDT_WRITABLE,       //ring 0 starting at 0x0, updated to 0xC0000000 when paging initialized
              GDT_GRANULAR | GDT_32BIT,true);
    gdtEntryApplication(0x3, 0, 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_DATA | GDT_WRITABLE,    //18 - ring 0 Kernel starting at 0x0 ***Need to change this to KERNEL_PAGED_BASE_ADDRESS base
              GDT_GRANULAR | GDT_32BIT,true);
    gdtEntryApplication(0x4, KERNEL_PAGED_BASE_ADDRESS , 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_CODE | GDT_READABLE,  //20 - ring 0 Kernel starting at 0xC0000000
              GDT_GRANULAR | GDT_32BIT,true);
    gdtEntryApplication(0x5, 0x0 , 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_DATA | GDT_WRITABLE /*| GDT_GROW_DOWN*/,       //28 - ring 0 starting at 0x0
              GDT_GRANULAR | GDT_32BIT,true);
    gdtEntryApplication(0x6, 0, 0xFFFFFFFF, GDT_PRESENT | GDT_DPL3 | GDT_DATA | GDT_WRITABLE,    //30 (33) - ring 3 segment starting at 0x0
              GDT_GRANULAR | GDT_32BIT,true);
    gdtEntryApplication(0x7, 0 , 0xFFFFF, GDT_PRESENT | GDT_DPL3 | GDT_CODE | GDT_READABLE ,       //38 (3b) - ring 3 starting at 0x0
              GDT_GRANULAR | GDT_32BIT,true);
    gdtEntryApplication(0x8, 0x0 , 0xFFFFF, GDT_PRESENT | GDT_DPL3 | GDT_DATA | GDT_WRITABLE /*| GDT_GROW_DOWN*/,       //40 (43) - ring 3 starting at 0x0
          GDT_GRANULAR | GDT_32BIT,true);
    gdtEntryApplication(0x10, 0x0 , 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_CODE | GDT_READABLE,  //20 - ring 0 starting at 0x0
              GDT_GRANULAR | GDT_32BIT,true);

    gdtEntryApplication(0x11, 0x0, 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_CODE | GDT_READABLE, //88 ring 0 starting at 0x0 - code used by sysEnter
          GDT_GRANULAR | GDT_32BIT,true);
    gdtEntryApplication(0x12, 0x0, 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_DATA | GDT_WRITABLE,    //90 - ring 0 starting at 0x0 data used by sysEnter
              GDT_GRANULAR | GDT_32BIT,true);

    
    gdtEntryRM(1, 0, 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_CODE | GDT_READABLE,
              GDT_GRANULAR | GDT_16BIT);
    gdtEntryRM(2, 0, 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_DATA | GDT_WRITABLE,
              GDT_GRANULAR | GDT_16BIT);
    gdtEntryRM(3, 0, 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_CODE | GDT_WRITABLE,
              GDT_GRANULAR | GDT_32BIT);

    kernelGDT.limit = 0x7ff; // (sizeof(sGDT) * GDT_ENTRIES) - 1;
    kernelGDT.base = (unsigned int)INIT_GDT_TABLE_ADDRESS;
    rmGdtp.limit = sizeof(sGDT) * (GDT_TABLE_SIZE*8) - 1;
    rmGdtp.base = (unsigned int)rmGdt;
    set_gdt(&kernelGDT);
}

void HIGH_CODE_SECTION quietHardware()
{
    outb(0xa1, 0x7f);
    outb(0x21, 0xff);
}

void doHDSetup()
{
    printk("ATA: Scanning for hard drives on primary bus ...\n");
    ataScanForHarddrives();
    char* p1[512];
    memset(p1,0,512);
    
    *p1=kATADeviceInfo[0].ATADeviceModel;
    printk("ATA: \tMaster: %s", kATADeviceInfo[0].ATADeviceAvailable==1?strtrim(&p1):"none\n");
    if (kATADeviceInfo[0].ATADeviceAvailable)
    {
        printk("\t%uMB (%ubps%s%s%s)\n", (kATADeviceInfo[0].totalSectorCount*kATADeviceInfo[0].sectorSize) / (1024*1024),
                kATADeviceInfo[0].sectorSize,
                kATADeviceInfo[0].lbaSupported?",LBA":"",
                kATADeviceInfo[0].lba48Supported?",LBA48":"",
                kATADeviceInfo[0].dmaSupported?",DMA":"");
    }
    *p1=kATADeviceInfo[1].ATADeviceModel;
    printk("ATA: \tSlave:  %s", kATADeviceInfo[1].ATADeviceAvailable==1?strtrim(&p1):"none\n");
    if (kATADeviceInfo[1].ATADeviceAvailable)
    {
        printk("\t%uMB (%ubps %s%s%s)\n", (kATADeviceInfo[1].totalSectorCount*kATADeviceInfo[1].sectorSize) / (1024*1024),
                kATADeviceInfo[1].sectorSize,
                kATADeviceInfo[1].lbaSupported?",LBA":"",
                kATADeviceInfo[1].lba48Supported?",LBA48":"",
                kATADeviceInfo[1].dmaSupported?",DMA":"");
    }
    printk("ATA: Scanning for hard drives on secondary bus ...\n");
    *p1=kATADeviceInfo[2].ATADeviceModel;
    printk("ATA: \tMaster: %s", kATADeviceInfo[2].ATADeviceAvailable==1?strtrim(&p1):"none\n");
    if (kATADeviceInfo[2].ATADeviceAvailable)
    {
        printk("\t%uMB (%ubps%s%s%s)\n", (kATADeviceInfo[2].totalSectorCount*kATADeviceInfo[2].sectorSize) / (1024*1024),
                kATADeviceInfo[2].sectorSize,
                kATADeviceInfo[2].lbaSupported?",LBA":"",
                kATADeviceInfo[2].lba48Supported?",LBA48":"",
                kATADeviceInfo[2].dmaSupported?",DMA":"");
    }
    *p1=kATADeviceInfo[3].ATADeviceModel;
    printk("ATA: \tSlave:  %s", kATADeviceInfo[3].ATADeviceAvailable==1?strtrim(&p1):"none\n");
    if (kATADeviceInfo[3].ATADeviceAvailable)
    {
        printk("\t%uMB (%ubps %s%s%s)\n", (kATADeviceInfo[3].totalSectorCount*kATADeviceInfo[3].sectorSize) / (1024*1024),
                kATADeviceInfo[3].sectorSize,
                kATADeviceInfo[3].lbaSupported?",LBA":"",
                kATADeviceInfo[3].lba48Supported?",LBA48":"",
                kATADeviceInfo[3].dmaSupported?",DMA":"");
    }
    if (ParamExists(kBootParams,"noahci",kBootParamCount))
        printk("AHCI: No scanning per parameter 'noahci'\n");
    else
    {
        printk("AHCI: Initializing ...\n");
        ahciInit();
        printk(" done\n");
        printk("AHCI: SATA Disks:\n");
        for (int cnt=4;cnt<10;cnt++)
            if (kATADeviceInfo[cnt].ATADeviceAvailable)
            {
                *p1=kATADeviceInfo[cnt].ATADeviceModel;
                printk("AHCI: Device %u:  %s", cnt,kATADeviceInfo[cnt].ATADeviceAvailable==1?strtrim(&p1):"none\n");
                printk("\t%uMB (%ubps %s%s%s)\n", 
                        (kATADeviceInfo[cnt].totalSectorCount*kATADeviceInfo[cnt].sectorSize) / (1024*1024),
                        kATADeviceInfo[cnt].sectorSize,
                        kATADeviceInfo[cnt].lbaSupported?",LBA":"",
                        kATADeviceInfo[cnt].lba48Supported?",LBA48":"",
                        kATADeviceInfo[cnt].dmaSupported?",DMA":"");
            }
    }
}

bool HIGH_CODE_SECTION ParamExists(char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char* cmdToFind, int paramCount)
{
    for (int cnt=0;cnt<paramCount+1;cnt++)
        if (!strcmp(params[cnt],cmdToFind))
            return true;
    return false;
}
void extern enableCR0_WP();

void HIGH_CODE_SECTION testWPBit()
{
    enableCR0_WP();
    printk("PAGING: Kernel paged base: 0x%08X\n",KERNEL_PAGED_BASE_ADDRESS);
    printk("PAGING: Making page @ 0x00000000 read only\n");
    kSetPhysicalRangeRO(0x0,0xFFF,true);
    printk("PAGING: Testing whether CPU honors WP flag ... ");
  __asm__("cli\n");
  __asm__("mov %0,[0x0]\n":"=r" (kOriginalAddressZeroValue));
  __asm__("mov eax,0xdeadbeef\n mov [0x0],eax\n");    //purposely write address 0 which we made "read only"
  __asm__("mov eax,cr0\n":::"eax");
  if (kPagingExceptionsSinceStart==1)
    printk("WP bit works!\n");
  else
      printk("WP bit does not work\n");
  //Can't unmap page 0x0 or the memory manager will see it as free space, so set it read-only again
  __asm__("mov eax,0x0\n mov [0x0],eax\n");    //purposely write address 0 which we made "read only"
  kSetPhysicalRangeRO(0x0,0xFFF,true);
}

void HIGH_CODE_SECTION kernel_main(/*multiboot_info_t* mbd, unsigned int magic*/) {
    
char currTime[150];
struct tm theDateTime;
    //Zero out all of the memory we will be using as rebooting a computer doesn't necessarily clear memory
    memset(KERNEL_OBJECT_BASE_ADDRESS,0,0x2000000);
    kBootCmd[0]=0x0;
    kExecLoadCount=0;
__asm__("cli\nsgdt [eax]\n"::"a" (&kernelGDT));
gdt_init();
    kTicksPerSecond=TICKS_PER_SECOND;
    kTermInit();
    kInitDone=false;
    kPagingInitDone=false;
    kTicksPerMS=1000/kTicksPerSecond;
    kDebugStartsNow=false;
    memset(kATADeviceInfo,0x0,sizeof(struct ataDeviceInfo_t)*20);
    memset(kGDTSlotAvailableInd,0xFF,GDT_TABLE_SIZE);
    memset(kTaskSlotAvailableInd,0xFF,TASK_TABLE_SIZE);

    __asm__("mov esp,0xff00\n" /*\
            "mov eax,0\nmov dr6,eax":::"eax"*/);
    /* Initialize terminal interface */
    *kTicksSinceStart=0;
    identify_data_sizes(&kDataSizes);
    terminal_clear();
    printk("Booting ...\n");

    quietHardware();
    int lLowMemKB = getInt12Memory();
    kE820Status = isE820Available(); //
    if (kE820Status==0x534d4150)
        kE820RecordCount = getE820Memory_asm();
    //Move the SMAP table from low memory up to where we want it
    memcpy(smap_table, lowSmapTablePtr, kE820RecordCount*24);
    idt_init(&kInitialIDTReg, PIC_REMAP_OFFSET);
    init_PIT(kTicksPerSecond);
    //Remap the exception vectors (0x0-0x1f)
    PIC_remap(0x00+PIC_REMAP_OFFSET, 0x8+PIC_REMAP_OFFSET);
    IRQ_clear_mask(0);
    IRQ_clear_mask(1);
    __asm__("sti\n");
    initSystemDate();
    gmtime_r(&kSystemStartTime,&theDateTime);
    printk("Boot: ");
    gets(kBootCmd,150);
    kBootParamCount=parseParamsShell(kBootCmd, kBootParams, MAX_PARAM_COUNT*MAX_PARAM_WIDTH);
    strftime((char*)&currTime, 50, "%H:%M:%S on %m/%d/%y", &theDateTime);
    //wait(50);
    printk("chrisOS %s booting @%s",  COMPLETE_VERSION, &currTime);
#ifndef DEBUG_NONE
    if (kDebugLevel > 0)
        printk ("(debug=%X)", kDebugLevel);
#endif
    printk("\n");
    if (kE820Status==0x534d4150)
    {
        printk("E820: available (%08X), translating ...", kE820Status);
        kE820MemoryBytes = sum_e820_usable_memory(smap_table,kE820RecordCount);
        printk("done\n");
        //print_e820_map(smap_table, kE820RecordCount);
    }
    else
        printk("E820: not available (%08X ... looking for alternatives.\n", kE820Status);

    printk("E820: Usable memory: Low=%6d (INT12), Total=%10d (E820)\n",lLowMemKB * 1024, kE820MemoryBytes);
    if (kE820MemoryBytes < MINIMUM_USABLE_MEMORY)
    {
        printk("\n\nE820: Either the available memory is less than the minimum required of %d MB\nor memory capacity cannot be determined\n.", MINIMUM_USABLE_MEMORY / 1024 / 1024);
        printk("3820: Ignore? ");
        
        while (waitForKeyboardKey()!='y')
        {}
    }
    __asm__ ("mov eax,%0\n push eax\n pop esp\n"::"r" (STACK_BASE_ADDRESS):"eax");
    detect_cpu();
    printk("CPU: Detected CPU: %s\n", kcpuInfo.brand_name);
    identifyCPUFeatures(&kCPUFeatures);
    if (apicCheckFor())
    {
        kCPU[0].apicID=apciGetAPICID(0);
        kCPU[0].registerBase=apicGetAPICBase();
        kCPU[0].ticksPerSecond=apicGetHZ();
        //IRQ_set_mask(0);
        printk("APIC: %s APIC %u Found, address %08X, initializing ... ", acpiGetAPICVersion()==0?"Discrete":"Integrated", kCPU[0].apicID, kCPU[0].registerBase);
        if (apicIsEnabled())
            printk("enabled ... ");
        printk("done\n");
        printk("APIC: Timer running at %u hz.\n",kCPU[0].ticksPerSecond);
    }
    else
        printk("APIC: not found\n");
    printk("TSC: ticks per 10 = %u\n", tscGetTicksPerSecond());
#ifndef DISABLE_PAGING
    kCPU[0].registerBase=apicGetAPICBase();
    printk("PAGING: enabling 4k paging\n");
    initializeKernelPaging();
    printk("PAGING: remapping APIC from 0x%08X to 0x%08X\n", kCPU[0].registerBase, kAPICRegisterRemapAddress);
    //map APIC address 0xFEE00000 to 0x825000
    kMapPage(kAPICRegisterRemapAddress, kCPU[0].registerBase,0x13);  //0x63 + cache disabled
    kSetPhysicalRangeRO(0x0,0xFFF,true);
    testWPBit();
    kPagingInitDone=true;
#endif
    printk("CLOCK: tick frequency is %uhz\n",kTicksPerSecond);
    printk("CLOCK: testing ... "); wait(100); printk("works\n");

#ifdef __SMP__
    if (ParamExists(kBootParams,"nosmp",kBootParamCount))
        printk("SMP: No AP processor startup per 'nosmp' parameter\n");
    else
    {
        printk("SMP: Initializing, ");
        printk("%u MP records parsed\n",mpInit());
        //cursorUpdateBiosCursor();
        printk("SMP: Starting up AP processors\n");
        AP_startup();
        wait(500);
        printk("SMP: CPUs 2 thru %u (of %u total) started... done\n",smpBootCPUsStarted+1, smpBootCPUCount+1);
        //if (kIOAPICPtr)
        //    kMapPage(CPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS, (uintptr_t)kIOAPICPtr, 0x13);
    }
#endif
    if (ParamExists(kBootParams,"nopci",kBootParamCount))
        printk("PCI: No scanning per parameter 'nopci'\n");
    else
    {
        printk("PCI: initializing ...");
        pciInitialize();
        printk(" found %u %s, %u devices (%u bridges)\n",kPCIBusCount, kPCIBusCount<=1?"bus":"busses", kPCIDeviceCount, kPCIBridgeCount);
        printk("PCI: initialization complete ...\n");
    }
    doHDSetup();
    __asm__("mov eax,0x28\nmov ss,eax\n":::"eax");
kInitDone = true;
printk("Boot commandline: %s\n",kBootCmd);
goto overStuff; /*******************************************/
    
    bool lRetVal=parseMBR(&kATADeviceInfo[4], (struct mbr_t*)&kMBR[0]);
    if (!lRetVal)
        goto overStuff;
    printk("validBS=%s, part0 start=0x%08X\n", kMBR[0].validBootSector?"true":"false", kMBR[0].parts[0].partStartSector);
    if (kATADeviceInfo[4].ABAR)
    {
        {
            printk("Using AHCI attaches\n");
            lRetVal=fl_attach_media((fn_diskio_read)ahciBlockingRead28, (fn_diskio_write)ahciBlockingWrite28);
            ahciSetCurrentDisk((HBA_PORT*)kATADeviceInfo[4].ioPort);
        }
    }
    else
    {
        printk("Using ATA attaches\n");
        lRetVal=fl_attach_media((fn_diskio_read)ataBlockingRead28, (fn_diskio_write)ataBlockingWrite28);
    }

    printk("Media Attach=%u\n",lRetVal);

overStuff:
       /*
        if (kBootParamCount==0)
        {
        execInternalCommand("disk 4");
        execInternalCommand("part 5");
        execInternalCommand("exec /kernel");
        }*/
MAINLOOPv:
        bootShell();
    goto MAINLOOPv;
    __asm__("cli\nhlt\n");
}
