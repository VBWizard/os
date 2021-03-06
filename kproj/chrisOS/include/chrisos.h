/* 
 * File:   chrisos.h
 * Author: yogi
 *
 * Created on May 6, 2016, 6:57 AM
 */

#ifndef CHRISOS_H
#define	CHRISOS_H
#include <stdint.h>
#include "i386/cpu.h"
#include "memory.h"
#include "../../chrisOSKernel/include/task.h"
#include "config.h"

//2
//* 3

//kernelDataLoadAddress is defined in kernelData2.ld.  It is the address of kernelData
extern char* kernelDataLoadAddress;
//KERNEL_DATA_LOAD_ADDRESS is used by our loader to skip loading of kernel data by programs which are loaded.
#define KERNEL_DATA_LOAD_ADDRESS kernelDataLoadAddress         //Change this if the kernelData1.ld kernelData load address changes
#define KERNEL_DATA_NAME "kernelData"
//#define KERNEL_DATA_NAME ".data"
#define KERNEL_DATA_SECTION __attribute__ ((section(KERNEL_DATA_NAME)))
#define SYSENTER_SECTION __attribute__ ((section("SystemData")))
#define HIGH_CODE_NAME ".text"
//#define HIGH_CODE_NAME "hiCode"
#define HIGH_CODE_SECTION __attribute__ ((section(HIGH_CODE_NAME)))
///Base address for library loading
#define LIBRARY_BASE_LOAD_ADDRESS 0x0

#define MMAP_VIRT_START 0xA0000000

/***************************************** CONFIG ****************************************/
//#define DISABLE_PAGING 1
#define __SMP__
/*ADDRESSES*/
#define E820_TABLE_SIZE (sizeof(SMAP_entry)*50)   //SMAP table of 50 records
#define MP_CONFIG_TABLE_SIZE 8192
#define IDT_TABLE_SIZE 256*8                    //IDT table of 256 records
#define KEYBOARD_BUFFER_SIZE 128
#define GDT_TABLE_SIZE 8*256                   //GDT table of 256 entries
#define ATA_MBR_ARRAY_SIZE 0x1000
#define GDT_PMODE_16BIT_TABLE_SIZE 256*8
#define RAM_AMT_TO_PAGE_INITIALLY 0x1000000
#define KERNEL_PAGE_DIR_SIZE 0x10000 //64GB max memory (0x1000000000) max
#define KERNEL_PAGE_TABLE_INITIAL_SIZE 0x400000 + 0x200000      //4GB + map 0xC0000000-0xDFFFFFFF to 0x00000000-0x3FFFFFFF
#define SAVED_STACK_FOR_EXCEPTIONS_SIZE 0x1000
#define TSS_TABLE_RECORD_COUNT 1024                             //This is effectively the max number of processes
#define TSS_TABLE_SIZE (0x68*TSS_TABLE_RECORD_COUNT)
#define TASK_TABLE_SIZE (((TSS_TABLE_RECORD_COUNT)/sizeof(uint32_t))*sizeof(task_t))          //need task_t size

#define KERNEL_OBJECT_BASE_ADDRESS 0x160000     //NOTE: Needs to be larger than KERNEL_DATA_LOAD_ADDRESS by the size of the kernel variables
#define E820_TABLE_ADDRESS KERNEL_OBJECT_BASE_ADDRESS
#define MP_CONFIG_TABLE_ADDRESS (E820_TABLE_ADDRESS + E820_TABLE_SIZE)
#define KEYBOARD_BUFFER_ADDRESS (MP_CONFIG_TABLE_ADDRESS + MP_CONFIG_TABLE_SIZE)
#define IDT_TABLE_ADDRESS ((KEYBOARD_BUFFER_ADDRESS + KEYBOARD_BUFFER_SIZE + 4096) & 0xFFFFF000)
#define INIT_GDT_TABLE_ADDRESS ((IDT_TABLE_ADDRESS + IDT_TABLE_SIZE + 4096))
#define TASK_TABLE_ADDRESS ((INIT_GDT_TABLE_ADDRESS + GDT_TABLE_SIZE + 4096) & 0xFFFFF000)
#define TSS_TABLE_ADDRESS ((TASK_TABLE_ADDRESS + TASK_TABLE_SIZE+4096) & 0xFFFFF000)
#define ATA_MBR_ARRAY_ADDRESS (TSS_TABLE_ADDRESS + TSS_TABLE_SIZE)
#define PCI_DEVICE_LIST_ADDRESS (ATA_MBR_ARRAY_ADDRESS + ATA_MBR_ARRAY_SIZE)
#define PCI_BRIDGE_LIST_ADDRESS (PCI_DEVICE_LIST_ADDRESS+0x10000)
#define PCI_FUNCTION_LIST_ADDRESS (PCI_BRIDGE_LIST_ADDRESS+0x10000)
#define GDT_PMODE_16BIT_TABLE_ADDRESS (PCI_FUNCTION_LIST_ADDRESS + 0x1000)
#define KERNEL_CR3 ((GDT_PMODE_16BIT_TABLE_ADDRESS + GDT_PMODE_16BIT_TABLE_SIZE + 4096) & 0xFFFFF000)
#define KERNEL_PAGE_TABLE_BASE_ADDRESS (KERNEL_CR3 + KERNEL_PAGE_DIR_SIZE + 0x2000)
#define SAVED_STACK_FOR_EXCEPTIONS_ADDRESS (KERNEL_PAGE_TABLE_BASE_ADDRESS + KERNEL_PAGE_TABLE_INITIAL_SIZE + 4096)
#define SAVED_STACK_FOR_DEBUGGING_ADDRESS (SAVED_STACK_FOR_EXCEPTIONS_ADDRESS + SAVED_STACK_FOR_EXCEPTIONS_SIZE + 4096)
#define CPU_APIC_REGISTER_REMAP_BASE_ADDRESS (SAVED_STACK_FOR_DEBUGGING_ADDRESS + SAVED_STACK_FOR_EXCEPTIONS_SIZE + 4096)       //this number is no longer static in the asm code
#define CPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS (CPU_APIC_REGISTER_REMAP_BASE_ADDRESS + 0x1000)
#define KERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS (CPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS+4)
#define AHCI_ABAR_REMAPPED_ADDRESS ((KERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS+0x1000)&0xFFFFF000)
#define AHCI_PORT_BASE_REMAP_ADDRESS ((AHCI_ABAR_REMAPPED_ADDRESS+0x40000)&0xFFFFF000)                        //command list base starts here - possibly 10 controllers (each is A000-10000 bytes))
#define AHCI_DISK_BUFFER_ADDRESS (AHCI_PORT_BASE_REMAP_ADDRESS+((0x10000*20)&0xFFFF0000))
#define ATA_DEVICE_INFO_ADDRESS (AHCI_DISK_BUFFER_ADDRESS+(0x10000*20))
#define AHCI_CAPS_ADDRESS (ATA_DEVICE_INFO_ADDRESS + 20*1000)
#define TASK_AVAILABLE_ADDRESS (AHCI_CAPS_ADDRESS + (20*1000))
#define GDT_AVAILABLE_ADDRESS (TASK_AVAILABLE_ADDRESS + (TSS_TABLE_RECORD_COUNT/8)) //2048 bytes = 16384 tasks maximum
#define EXEC_FILE_LOAD_INFO (GDT_AVAILABLE_ADDRESS + (16384/8))
#define AHCI_ABAR_ADDRESS (EXEC_FILE_LOAD_INFO + 100000) //(sizeof(elfInfo_t)*100))
#define END_OF_KERNEL_OBJECTS_ADDRESS (AHCI_ABAR_ADDRESS+0x100000)

//#define KERNEL_CODE_BASE_ADDRESS
#define STACK_BASE_ADDRESS 0xFFFF00
#define KERNEL_PAGED_BASE_ADDRESS 0xC0000000
#define KERNEL_TEMP_LOW_PAGE_TABLE_BASE_ADDRESS 0x5090000


#define SYS_VGA_WIDTH 80
#define SYS_VGA_HEIGHT 50
#define MINIMUM_USABLE_MEMORY (256 * 1024 * 1024)
#define SMAP_TABLE_MAX_ENTRIES 50
#define TIMEZONE -4

#define PIC_REMAP_OFFSET 32

#define SCREEN_SPACES_PER_TAB 5

#define PAGING_IN_USE_FLAG_MASK 0x800

#define STOPHERE(val) \
        __asm__("push eax\n mov eax,%0\n cli\n hlt\n pop eax\n" \
: \
: "r" (val) );

#define STOPHERE2 \
        __asm__("cli\n hlt\n");
#define BREAKPOINT __asm__("int 0x3\n");

#define PAUSEHERE {bool test=false;while(!test){}}

#define CLI \
__asm__("cli\n");

#define STI \
__asm__("sti\n");
#endif	/* CHRISOS_H */

