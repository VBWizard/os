/* 
 * File:   kernelObjectAddresses.h
 * Author: yogi
 *
 * Created on May 16, 2016, 4:32 PM
 */
#include <stdint.h>
#include <time.h>
#include "i386/gdt.h"
#include "memory.h"
#include "utility.h"
#include "init/ata_disk.h"
#include "chrisos.h"
#include "pci/pci.h"
#include "i386/cpu.h"
#include "filesystem.h"
#include "i386/smp.h"
#include "ahci.h"
#include "../../chrisOSKernel/include/tss.h"
#include "../../chrisOSKernel/include/task.h"
#include "elfloader.h"

#ifndef KERNELOBJECTADDRESSES_H
#define	KERNELOBJECTADDRESSES_H

/*NOTE: Code & Data are loaded below 200k so keep everything above 400k to be safe.*/
#define     SMAP_TABLE_OFFSET 0x0

KERNEL_DATA_SECTION SMAP_entry* smap_table=(SMAP_entry*)E820_TABLE_ADDRESS;
KERNEL_DATA_SECTION int kE820Status = 0;
KERNEL_DATA_SECTION uint64_t kE820MemoryBytes = 0;
KERNEL_DATA_SECTION word kE820RecordCount = 0;
KERNEL_DATA_SECTION struct cpuinfo_t kcpuInfo;
KERNEL_DATA_SECTION uint32_t exceptionNumber;
uint32_t KERNEL_DATA_SECTION *exceptionSavedStack = (uint32_t *)SAVED_STACK_FOR_EXCEPTIONS_ADDRESS;
KERNEL_DATA_SECTION uint32_t *debugSavedStack = (uint32_t *)SAVED_STACK_FOR_DEBUGGING_ADDRESS;
uint32_t KERNEL_DATA_SECTION exceptionAX, exceptionBX, exceptionCX, exceptionDX, exceptionSI, exceptionDI, exceptionBP, exceptionCR0, exceptionCR3, exceptionCR4,
                             exceptionDS, exceptionES, exceptionFS, exceptionGS, exceptionSS, exceptionSavedESP,exceptionFlags, exceptionErrorCode, exceptionEIP, exceptionCS, exceptionCR2, exceptionTR;
KERNEL_DATA_SECTION uint32_t debugAX, debugBX, debugCX, debugDX, debugSI, debugDI, debugBP, debugCR0, debugCR3, debugCR4,
                             debugDS, debugES, debugFS, debugGS, debugSS, debugSavedESP,debugFlags, debugErrorCode, debugCS, debugEIP;
KERNEL_DATA_SECTION sizeof_t kDataSizes;
KERNEL_DATA_SECTION volatile  uint32_t* kTicksSinceStart=(uint32_t*)KERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS;
KERNEL_DATA_SECTION volatile uint64_t kISRsSinceStart=1;
KERNEL_DATA_SECTION volatile uint64_t kRTCTicksSinceStart=1;
KERNEL_DATA_SECTION volatile uint32_t kPagingExceptionsSinceStart=0;
KERNEL_DATA_SECTION volatile uint32_t kExceptionsSinceStart=0;
KERNEL_DATA_SECTION int kTicksPerSecond=TICKS_PER_SECOND;
KERNEL_DATA_SECTION int kTicksPerMS;
KERNEL_DATA_SECTION time_t kSystemStartTime=0;
KERNEL_DATA_SECTION time_t kSystemCurrentTime=0;
KERNEL_DATA_SECTION int kTimeZone = (3600*TIMEZONE);
KERNEL_DATA_SECTION uint64_t kKernelPagedBaseAddress = KERNEL_PAGED_BASE_ADDRESS;
KERNEL_DATA_SECTION bool kInitDone = 0;
KERNEL_DATA_SECTION bool kPagingInitDone = 0;
KERNEL_DATA_SECTION uint32_t* kKernelPageDir = (uint32_t*)KERNEL_PAGE_DIR_ADDRESS;
KERNEL_DATA_SECTION uint32_t* kKernelPageTables = (uint32_t*)KERNEL_PAGE_TABLE_BASE_ADDRESS;
KERNEL_DATA_SECTION uint8_t kPCIDeviceCount=0;
KERNEL_DATA_SECTION uint8_t kPCIBridgeCount=0;
KERNEL_DATA_SECTION uint8_t kPCIFunctionCount=0;
KERNEL_DATA_SECTION uint8_t kPCIBusCount=1;
KERNEL_DATA_SECTION bool kDebugStartsNow=false;
KERNEL_DATA_SECTION struct pci_device_t* kPCIDeviceHeaders = (struct pci_device_t*)PCI_DEVICE_LIST_ADDRESS;
KERNEL_DATA_SECTION struct pci_bridge_t* kPCIBridgeHeaders = (struct pci_bridge_t*)PCI_BRIDGE_LIST_ADDRESS;
KERNEL_DATA_SECTION struct pci_device_t* kPCIDeviceFunctions = (struct pci_device_t*)PCI_FUNCTION_LIST_ADDRESS;
KERNEL_DATA_SECTION struct ataDeviceInfo_t* kATADeviceInfo = (struct ataDeviceInfo_t*)ATA_DEVICE_INFO_ADDRESS;                     //NOTE: index 0-3 are ATA, 4+ are SATA (for now)
KERNEL_DATA_SECTION int kATADeviceInfoCount=0;
KERNEL_DATA_SECTION struct pci_device_t kPCISATADevice;
KERNEL_DATA_SECTION struct idt_entry* kInitialIDT = (struct idt_entry*)IDT_TABLE_ADDRESS;  //PIC_REMAP_OFFSET + 256 entries
KERNEL_DATA_SECTION uint32_t kAPICRegisterRemapAddress=CPU_APIC_REGISTER_REMAP_BASE_ADDRESS;
KERNEL_DATA_SECTION struct mbr_t* kMBR = (struct mbr_t*)ATA_MBR_ARRAY_ADDRESS;//[4][4];
KERNEL_DATA_SECTION uint32_t kDebugLevel=KDEBUGLEVEL;
KERNEL_DATA_SECTION uintptr_t* kIOAPICPtr;
KERNEL_DATA_SECTION mpConfig_t* kMPConfigTable=(mpConfig_t*)MP_CONFIG_TABLE_ADDRESS;
KERNEL_DATA_SECTION cpuid_features_t kCPUFeatures;
KERNEL_DATA_SECTION cpu_t kCPU[8];
KERNEL_DATA_SECTION uint32_t kOriginalAddressZeroValue=0;
KERNEL_DATA_SECTION ahcicaps_t* ahciCaps=(ahcicaps_t*)AHCI_CAPS_ADDRESS;
KERNEL_DATA_SECTION int ahciCapsCount=0;
KERNEL_DATA_SECTION uint32_t* kGDTSlotAvailableInd=(uint32_t*)GDT_AVAILABLE_ADDRESS;
KERNEL_DATA_SECTION uint32_t* kTaskSlotAvailableInd=(uint32_t*)TASK_AVAILABLE_ADDRESS;
KERNEL_DATA_SECTION tss_t* kTSSTable=(tss_t*)TSS_TABLE_ADDRESS;
KERNEL_DATA_SECTION task_t* kTaskTable=(task_t*)TASK_TABLE_ADDRESS;
KERNEL_DATA_SECTION elfInfo_t* kExecLoadInfo=(elfInfo_t*)EXEC_FILE_LOAD_INFO;
KERNEL_DATA_SECTION int kExecLoadCount=0;
KERNEL_DATA_SECTION int kSelectedDiskNum=-1; 
KERNEL_DATA_SECTION int kSelectedPartNum=-1;
KERNEL_DATA_SECTION volatile HBA_PORT* kAHCICurrentDisk;
KERNEL_DATA_SECTION partEntry_t kAHCICurrentPart;
KERNEL_DATA_SECTION volatile char* kKbdBuffCurrTop = (char*)KEYBOARD_BUFFER_ADDRESS;

/*time.h*/
KERNEL_DATA_SECTION int _daylight = 0;                  // Non-zero if daylight savings time is used
KERNEL_DATA_SECTION long _dstbias = 0;                  // Offset for Daylight Saving Time
KERNEL_DATA_SECTION char *_tzname[2] = {"GMT", "GMT"};  // Standard/daylight savings time zone names
KERNEL_DATA_SECTION int ticksToWait;

//NOTE: This is a temporary table in the .asm section.  It is copied to smap_table_ptr as soon as the E820 reading is complete
KERNEL_DATA_SECTION struct gdt_ptr rmGdtp;
KERNEL_DATA_SECTION sGDT* rmGdt = (sGDT*)GDT_PMODE_16BIT_TABLE_ADDRESS;
KERNEL_DATA_SECTION sGDT* bootGdt = (sGDT*)INIT_GDT_TABLE_ADDRESS;
KERNEL_DATA_SECTION struct gdt_ptr kernelGDT;
KERNEL_DATA_SECTION volatile char* kKbdBuffCurrChar = (char*)KEYBOARD_BUFFER_ADDRESS;

KERNEL_DATA_SECTION char kBootCmd[255];
//AHCI
KERNEL_DATA_SECTION HBA_MEM* ahciABAR = (HBA_MEM*)AHCI_ABAR_ADDRESS;

KERNEL_DATA_SECTION task_t* kKernelTask;

KERNEL_DATA_SECTION const char *_days[7] = {
  "Sunday", "Monday", "Tuesday", "Wednesday",
  "Thursday", "Friday", "Saturday"
};

KERNEL_DATA_SECTION const char *_days_abbrev[7] = {
  "Sun", "Mon", "Tue", "Wed", 
  "Thu", "Fri", "Sat"
};

KERNEL_DATA_SECTION const char *_months[12] = {
  "January", "February", "March",
  "April", "May", "June",
  "July", "August", "September",
  "October", "November", "December"
};

KERNEL_DATA_SECTION const char *_months_abbrev[12] = {
  "Jan", "Feb", "Mar",
  "Apr", "May", "Jun",
  "Jul", "Aug", "Sep",
  "Oct", "Nov", "Dec"
};


#endif	/* KERNELOBJECTADDRESSES_H */
