#include "chrisos.h"
#include "i386/kPaging.h"
#include "i386/gdt.h"

extern uint32_t*  kKernelPageDir;
extern uint64_t kE820MemoryBytes;
extern uint32_t kDebugLevel;
extern struct idt_entry kInitialIDT[0x30];
extern struct idt_ptr kInitialIDTReg;

void initializeKernelPaging()
{
        uint32_t *ptr;
        uint32_t *ptrT;
        uint32_t *ptr2;
        uint32_t *kKernelPageTables;
        uint16_t tempEntries = (0xFFFFFFFF/0x400000)+1;  //Map entire 4GB memory space 

       
        printd(DEBUG_PAGING_CONFIG,"PAGING CONFIG: Entering setupKernelPaging module\n");
        ptr=(uint32_t*)kKernelPageDir;
        ptrT=(uint32_t*)KERNEL_PAGE_TABLE_BASE_ADDRESS;
        printd(DEBUG_PAGING_CONFIG,"PAGING CONFIG: Page directory at 0x%08X, table at 0x%08x\n", ptr, ptrT);
        printd(DEBUG_PAGING_CONFIG,"PAGING CONFIG: (0x%04X page directory entries)\n", tempEntries);
        for (uint32_t cnt=0;cnt < tempEntries; cnt++)
        {
                ptr[cnt] = (KERNEL_PAGE_TABLE_BASE_ADDRESS + (cnt*4096)) | 0x3;
                //Create a guest page table for each Page Directory
                for (int cnt2=0;cnt2<1024;cnt2++)
                {
                    ptrT[cnt2] = ((0x400000 * cnt)  + ((cnt2) << 12)) | 0x3;
                }
                ptrT += 0x400;
        }
        uint32_t pageDirEntrySize = 0x400000;
        ptr2=(void*)KERNEL_PAGE_DIR_ADDRESS + (KERNEL_PAGED_BASE_ADDRESS / 0x400000)*4; //(((uint32_t)KERNEL_PAGED_BASE_ADDRESS / (uint32_t)0x400000) * 4);
        kKernelPageTables=(uint32_t*)KERNEL_PAGE_TABLE_BASE_ADDRESS;
        //Initialize Kernel Page Directory
        printd(DEBUG_PAGING_CONFIG,"PAGING CONFIG: Kernel page dir at 0x%08X, table at 0x%08x\n", ptr2, kKernelPageTables);
        uint32_t pageDirEntryCount= 0x40;   //Map C0000000-CFFFFFFF=00000000-0FFFFFFF 
        printd(DEBUG_PAGING_CONFIG,"PAGING CONFIG: 0x%08X entries\n", pageDirEntryCount);
        for (uint32_t cnt=0;cnt <= pageDirEntryCount; cnt++)
        {
                ptr2[cnt] = (KERNEL_PAGE_TABLE_BASE_ADDRESS + (cnt*4096)) | 0x3;
        }
        __asm__("mov cr3,%0\n":: "a" (KERNEL_PAGE_DIR_ADDRESS));
       __asm__("mov eax,cr0\n or eax,0x80000000\n mov cr0,eax\n");
        /*NOTE: Interrupts have been disabled so that we can update the IDT bases before non-presenting the temporary low page table entries*/
        //Update the base of GDT entry 0x08 (Code) and 0x10 (data) to our kernel base

/*BEFORE:
 0 - blank
 1 (0x08) - code @ 0x0
 2 (0x10) - data @ 0x0
*/
       gdtEntry(1, KERNEL_PAGED_BASE_ADDRESS, 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_CODE | GDT_READABLE,
                  GDT_GRANULAR | GDT_32BIT,true);
    gdtEntry(2, KERNEL_PAGED_BASE_ADDRESS, 0xFFFFF, GDT_PRESENT | GDT_DPL0 | GDT_DATA | GDT_WRITABLE,
                  GDT_GRANULAR | GDT_32BIT,true);
    /*AFTER:
 0 - blank
 1 (0x08) - code @ 0xC0000000
 2 (0x10) - data @ 0xC0000000
*/

        struct gdt_ptr gdtp;
        gdtp.limit = sizeof(struct GDT) * GDT_ENTRIES - 1;
        gdtp.base = (unsigned int)INIT_GDT_TABLE_ADDRESS;
        set_gdt(&gdtp);
        idt_init(&kInitialIDTReg, PIC_REMAP_OFFSET);
        doPagingJump();

    
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING_CONFIG) == DEBUG_PAGING_CONFIG)
            printk("Clearing up temporary low page entries at 0x%08X\n", KERNEL_TEMP_LOW_PAGE_TABLE_BASE_ADDRESS);
#endif
        //Now that we've fixed our IDT, lets restart interrupts!
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING_CONFIG) == DEBUG_PAGING_CONFIG)
            printk("Exiting setupKernelPaging module\n");
#endif
}

