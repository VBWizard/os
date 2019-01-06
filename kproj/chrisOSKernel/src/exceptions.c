/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "kernel.h"
#include "i386/bits/types.h"
#include "process.h"
#include <time.h>
#include "printf.h"
#include "i386/irqHandlers.h"
#include "i386/kPaging.h"
#include "utility.h"
#include "signals.h"
#include "elfloader.h"
#include "thesignals.h"
#include "alloc.h"
#include "paging.h"
#include "mmap.h"
#include "task.h"

extern volatile uint32_t* kTicksSinceStart;
extern uint32_t exceptionErrorCode;
extern uint16_t exceptionNumber;
extern uint32_t exceptionCS;
extern uint32_t exceptionEIP;
extern uint32_t exceptionFlags;
extern uint32_t exceptionCR2;
extern uint32_t *exceptionSavedStack;
extern uint32_t exceptionSavedESP;
extern uint32_t irq14SavedESP;
extern bool kDebugStartsNow;
extern volatile  uint32_t kPagingExceptionsSinceStart;
extern volatile  uint32_t kExceptionsSinceStart;
extern void kPagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly);
extern uint32_t kDebugLevel;
extern int kTicksPerSecond;
extern time_t kSystemCurrentTime;
extern uint32_t exceptionAX, exceptionBX, exceptionCX, exceptionDX, exceptionSI, exceptionDI, exceptionBP, exceptionCR0, exceptionCR3, exceptionCR4;
extern bool kPagingInitDone;
extern volatile char* kKbdBuffCurrTop;
extern void* kMalloc(size_t size);

#define KEYB_DATA_PORT 0x60
#define KEYB_CTRL_PORT 0x61

uint32_t tds=0;
unsigned volatile char kKeyStatus[11];
extern struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf);
extern void kpagingUpdatePresentFlagA(uint32_t address, bool present);
void* sys_sigaction2(int signal, uintptr_t* sigAction, uint32_t sigData, uint32_t cr3);

void kPagingExceptionHandler()
{
    uint32_t lPDEValue=0;
    uint32_t lPTEValue=0;
    uint32_t lPDEAddress=0, lPTEAddress=0;
    uint32_t lOldDebugLevel=0;
    bool isCow=false;
    uint32_t pagePhysAddr=lPTEValue&0xFFFFF000;
    uint32_t pageFlags=lPTEValue&0x00000FFF;
    uint32_t pageVirtAddress;
    
    __asm__("mov cr3,eax\n"::"a"(KERNEL_CR3));
    
    lPTEAddress=kPagingGet4kPTEntryAddressCR3(exceptionCR3,exceptionCR2);
    lPDEAddress=kPagingGet4kPDEntryAddressCR3(exceptionCR3,exceptionCR2);
    lPDEValue=kPagingGet4kPDEntryValueCR3(exceptionCR3,exceptionCR2);
    lPTEValue=kPagingGet4kPTEntryValueCR3(exceptionCR3,exceptionCR2);
    process_t* process=findTaskByCR3(exceptionCR3)->process;
    elfInfo_t* elf=process->elf;
    printd(DEBUG_EXCEPTIONS,"Paging exception START: for address 0x%08X (CR3=0x%08X)\n",exceptionCR2,exceptionCR3);
    printd(DEBUG_EXCEPTIONS,"\tProcess=%s (0X%08X)\n\tChecking for uninitialized mmap page, pt entry=0x%08X\n",process->path,process->task->taskNum, lPTEValue);
    //Phys addr portion will equal virtual address, admin/user page will be 1, present will be 0
    pageVirtAddress=lPTEValue&0xFFFFF000;
    if ( (pageVirtAddress==(exceptionCR2&0xFFFFF000)) 
            && (pageFlags&4==4) 
            && (lPTEValue&1==0) )
    {
        printd(DEBUG_EXCEPTIONS,"\t\tFound uninitialized mmap page\n",process->path,lPTEValue);
        dllist_t* mmaps=process->mmaps;
        memmap_t* mmap=NULL;
        if (pageVirtAddress==exceptionCR2&0xFFFFF000)
        if (mmaps!=NULL)
        {
            while (mmaps->next!=mmaps)
            {
                mmap=mmaps->payload;
                if (mmap->startAddress<exceptionCR2 && mmap->startAddress+mmap->len>exceptionCR2)
                    break;
                mmaps=mmaps->next;
            }
            if (mmap==NULL)
                panic("kPagingExceptionHandler: Could not find mmap for address 0x%08X\n",exceptionCR2);
            printd(DEBUG_EXCEPTIONS,"\t\tFound corrrect mmap.  Will map this page and add to mmap->mmappedPages\n");
            pagePhysAddr=(uint32_t)allocPages(PAGE_SIZE);
            pagingMapPage(exceptionCR3,pageVirtAddress,pagePhysAddr,0x7);  //Map page read/write
            mmappedPage_t* mappedPage=kMalloc(sizeof(mmappedPage_t));
            mappedPage->address=pageVirtAddress;
            mappedPage->loaded=true;
            dllist_t* mapList=&mmap->mmappedPages->listItem;
            listAdd(mapList,&mappedPage->listItem,mappedPage);
            printd(DEBUG_EXCEPTIONS,"\tMapped v=0x%08X to p=0x%08X (CR3=0x%08X)\n",pageVirtAddress,pagePhysAddr,exceptionCR3);
            //NOTE: Later we'll add loading from a file if one is defined in the mmap
            __asm__("xor ebx,ebx\nmov cr2,ebx\nmov cr3,eax\n"::"a" (exceptionCR3));
        }
        else
            printd(DEBUG_EXCEPTIONS,"\t\tProcess has no mmaps, skipping mmap check\n",process->path,lPTEValue);
    }
    else
        printd(DEBUG_EXCEPTIONS,"\t\tNot mmap page\n",process->path,lPTEValue);
    
    //Check for CoW pages in libraries
    printd(DEBUG_EXCEPTIONS,"\tChecking for CoW bss/data in libraries\n",process->path);
    if (pagingGet4kPTEntryValueCR3((uint32_t)process->task->pageDir,exceptionCR2) & COW_PAGE)
    {
        isCow=true;
        printd(DEBUG_EXCEPTIONS,"\tAddress is CoW per PTE\n");
    }
    


    if (!isCow)
    {
        for (int cnt=0;cnt<process->elf->libraryElfCount;cnt++)
        {
            elfInfo_t* lib=elf->libraryElfPtr[cnt];
            printd(DEBUG_EXCEPTIONS,"\t\tChecking for CoW in library @ 0x%08X, bss=0x%08X/0x%08X, data=0x%08X/0x%08X, tdata=0x%08X/0x%08X\n",
                    lib,
                    lib->bssAddress,
                    lib->bssSize,
                    lib->dataAddress,
                    lib->dataSize,
                    lib->tdataAddress,
                    lib->tdataSize);
            if (lib->bssAddress<=exceptionCR2 && lib->bssAddress+lib->bssSize>exceptionCR2)
            {
                //CLR 01/04/2019: lib->fileName suddenly is 0x50000000, so can't use it???
                printd(DEBUG_EXCEPTIONS,"\t\tThe page with address 0x%08X is a CoW .bss page from library %s\n",exceptionCR2,""/*lib->fileName*/);
                isCow=true;
                break;
            }
            else if (lib->dataAddress<=exceptionCR2 && lib->dataAddress+lib->dataSize>exceptionCR2)
            {
                //CLR 01/04/2019: lib->fileName suddenly is 0x50000000, so can't use it???
                printd(DEBUG_EXCEPTIONS,"\t\tPage (0x%08X) is CoW .data page from library %s\n",exceptionCR2,""/*lib->fileName*/);
                isCow=true;
                break;
            }
        }
    }

    if (isCow)
    {
        uintptr_t mappedCR2=pagingGet4kPTEntryValueCR3(exceptionCR3,exceptionCR2) & 0xFFFFF000;
        uint32_t newPhys=(uint32_t)allocPages(PAGE_SIZE);
        pagingMapPage(exceptionCR3,exceptionCR2 & 0xFFFFF000,newPhys,0x7);
        pagingMapPage(KERNEL_CR3,exceptionCR2 & 0xFFFFF000,newPhys,0x7);
        pagingMapPage(KERNEL_CR3,newPhys,newPhys,0x7);
        memcpy((void*)newPhys,(void*)(mappedCR2),PAGE_SIZE);
        printd(DEBUG_EXCEPTIONS,"\tReplaced CoW page 0x%08X (0x%08X) with writable page 0x%08X (contents copied)\n",exceptionCR2&0xFFFFF000,mappedCR2,newPhys);
        __asm__("xor ebx,ebx\nmov cr2,ebx\nmov cr3,eax\n"::"a" (exceptionCR3));
        return;
    }
    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
    {
        if (exceptionNumber==0x0e)
          printk("\nPaging handler called for virtual address 0x%02X\n",exceptionCR2);
          printk("PDE@0x%08X=0x%08X, PTE@0x%08X=0x%08X\n", lPDEAddress, lPDEValue, lPTEAddress, lPTEValue);
          printDumpedRegs();
          if (!isCow) //CLR 12/29/2018: Stop logging exception info for CoWs
            logDumpedRegs();
          //printk("handler called %u times since system start\n",kPagingExceptionsSinceStart+1);
          printk("Finding symbol for 0x%08X ...\n",exceptionCR2);
    }
    
    kPagingExceptionsSinceStart++;
    printd(DEBUG_EXCEPTIONS,"kPagingExceptionHandler: Signalling SEGV for cr3=0x%08X\n",exceptionCR3);
    process_t* p=sys_sigaction2(SIGSEGV,0,0xe,exceptionCR3);
    printk("segfault in '%s' at 0x%08X (cr2=0x%08X)\n",p->path,exceptionEIP,exceptionCR2);

    __asm__("push eax\n mov eax,0\nmov cr2,eax\npop eax\n  #reset CR2 after paging exception handled");

    if (p->task->taskNum!=RESERVED_TASKS)
    {
        printd(DEBUG_EXCEPTIONS,"kPagingExceptionHandler: Returning\n");
        __asm__("\nsti\nnop\nnop\nnop\nmov cr3,eax\n"::"a"(exceptionCR3));
        return;
    }
pagingExceptionStop: 
    printk("Exception was in kernel task (taskNum=0x%04X), cannot continue, halting system\n",p->task->taskNum);
    __asm__("cli");
    __asm__("hlt");
    goto pagingExceptionStop;
}

void defaultISRHandler()
{
    //terminal_clear();
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
    {
        printk("Exception handler called for exception # 0x%02x\n\n", exceptionNumber);
        printDumpedRegs();
        printd(DEBUG_EXCEPTIONS,"handler called %u times since system start\n",kPagingExceptionsSinceStart+1);
    }
#endif
#ifndef DEBUG_NONE
//    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
//    {
//        waitForKeyboardKey();
//    }
#endif

//    __asm__("mov eax,%0\nmov ebx,%1\n"::"r" (exceptionAX), "r" (exceptionEIP));
//    return;
    
defaultHandlerLoop:
    __asm__("cli");
    __asm__("hlt");
    goto defaultHandlerLoop;
}

void doubleFaultHandler()
{
    uint32_t esp = (uint32_t)exceptionSavedESP;
        terminal_clear();
        printk("Double Fault for exception %02X, CS:EIP = %04X:%08x, error = %08X\n", exceptionNumber, exceptionCS, exceptionEIP, exceptionCR2);
        printk ("Stack:\n");
        for (int cnt=0;cnt<10;cnt++)
        {
            printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
            esp+=4;
        }
    __asm__("cli");
    __asm__("hlt");
}