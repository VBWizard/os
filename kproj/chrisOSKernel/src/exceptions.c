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
#include "alloc.h"
#include "paging.h"
#include "mmap.h"
#include "task.h"
#include "schedule.h" 

extern volatile uint32_t* kTicksSinceStart;
extern uint32_t exceptionErrorCode;
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
extern tss_t* pagingExceptionTSS;
extern void pagingExceptionHandler();
extern task_t* kKernelTask;
extern struct idt_entry* idtTable;
extern uint16_t isrNumber;
extern void waitForDeath();

#define KEYB_DATA_PORT 0x60
#define KEYB_CTRL_PORT 0x61

uint32_t tds=0;
unsigned volatile char kKeyStatus[11];
extern struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf);
extern void kpagingUpdatePresentFlagA(uint32_t address, bool present);
void* sys_sigaction2(int signal, uintptr_t* sigAction, uint32_t sigData, uint32_t cr3);

void defaultISRHandler()
{
    //terminal_clear();

    if (isrNumber==7)
    {
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
    {
        //printd(DEBUG_EXCEPTIONS,"defaultISRHandler: Exception 0x7 triggered.  We are ignoring the CR0 task switched flag (TS) for now.  Will reset the flag and resume.\n",kPagingExceptionsSinceStart+1);
    }
        __asm__("clts\n");
        return;
    }
#endif
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
    {
        printk("Exception handler called for exception # 0x%02x\n\n", isrNumber);
        //printDumpedRegs();
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
        printk("Double Fault for exception %02X, CS:EIP = %04X:%08x, error = %08X\n", isrNumber, exceptionCS, exceptionEIP, exceptionCR2);
        printk ("Stack:\n");
        for (int cnt=0;cnt<10;cnt++)
        {
            printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
            esp+=4;
        }
    __asm__("cli");
    __asm__("hlt");
}

void setupPagingHandler()
{
    pagingExceptionTSS = allocPages(sizeof(tss_t));
    printd(DEBUG_PROCESS, "Allocated TSS for paging exception task gate at 0x%08X",pagingExceptionTSS);
    pagingMapPageCount(KERNEL_CR3,((uint32_t)pagingExceptionTSS | KERNEL_PAGED_BASE_ADDRESS),(uint32_t)pagingExceptionTSS,0x1,0x7);
    pagingMapPageCount(KERNEL_CR3,((uint32_t)pagingExceptionTSS),(uint32_t)pagingExceptionTSS,0x1,0x7);
    memset(pagingExceptionTSS, 0, sizeof(tss_t));
    pagingExceptionTSS->CR3=KERNEL_CR3;
    pagingExceptionTSS->CS=0x8;
    pagingExceptionTSS->EIP=&pagingExceptionHandler;
    pagingExceptionTSS->DS=kKernelTask->tss->DS;
    
    pagingExceptionTSS->ES=kKernelTask->tss->ES;
    pagingExceptionTSS->FS=kKernelTask->tss->FS;
    pagingExceptionTSS->GS=kKernelTask->tss->GS;
    pagingExceptionTSS->DS=kKernelTask->tss->DS;
    pagingExceptionTSS->SS=kKernelTask->tss->SS;
    pagingExceptionTSS->SS0=kKernelTask->tss->SS0;

    pagingExceptionTSS->ESP0=allocPagesAndMap(0x16000);
    printd(DEBUG_PROCESS,"Allocated pages at 0x%08X for paging exception handler ESP0\n",pagingExceptionTSS->ESP0);
    pagingMapPageCount(KERNEL_CR3,pagingExceptionTSS->ESP0 | KERNEL_PAGED_BASE_ADDRESS,pagingExceptionTSS->ESP0,0x16,0x7);
    pagingMapPageCount(KERNEL_CR3,pagingExceptionTSS->ESP0,pagingExceptionTSS->ESP0,0x16,0x7);
    pagingExceptionTSS->ESP0+=0x10000;
    printd(DEBUG_PROCESS,"Offset paging exception handler ESP0 to 0x%08X\n",pagingExceptionTSS->ESP0);
    
    
    pagingExceptionTSS->ESP=allocPagesAndMap(0x16000);
    printd(DEBUG_PROCESS,"Allocated pages at 0x%08X for paging exception handler ESP\n",pagingExceptionTSS->ESP);
    pagingMapPageCount(KERNEL_CR3,pagingExceptionTSS->ESP | KERNEL_PAGED_BASE_ADDRESS,pagingExceptionTSS->ESP,0x16,0x7);
    pagingMapPageCount(KERNEL_CR3,pagingExceptionTSS->ESP ,pagingExceptionTSS->ESP,0x16,0x7);
    pagingExceptionTSS->ESP+=0x10000;
    printd(DEBUG_PROCESS,"Offset paging exception handler ESP to 0x%08X\n",pagingExceptionTSS->ESP);

    pagingExceptionTSS->SS1=pagingExceptionTSS->SS0;
    pagingExceptionTSS->ESP1=pagingExceptionTSS->ESP0;
    pagingExceptionTSS->SS2=pagingExceptionTSS->SS0;
    pagingExceptionTSS->ESP2=pagingExceptionTSS->ESP0;
    
    
    pagingExceptionTSS->EFLAGS=0x200007;

    gdtEntryOS(0x17,pagingExceptionTSS,sizeof(tss_t), ACS_TSS,GDT_GRANULAR | GDT_32BIT,true);

    //install the paging exception handler task TSS
    idt_set_gate (&idtTable[0xe], 0xB8, 0, ACS_TASK | ACS_DPL_0); //paging exception
}

void kPagingExceptionHandlerNew(uint32_t exceptionCR2, int ErrorCode)
{
    uint32_t lPDEValue=0;
    uint32_t lPTEValue=0;
    uint32_t lPDEAddress=0, lPTEAddress=0;
    uint32_t lOldDebugLevel=0;
    bool isCow=false;
    uint32_t pagePhysAddr=lPTEValue&0xFFFFF000;
    uint32_t pageFlags=lPTEValue&0x00000FFF;
    uint32_t pageVirtAddress;
    tss_t* ourTSS = pagingExceptionTSS;
    uint32_t victimTaskNum = ourTSS->LINK;
    victimTaskNum >>= 3;
    task_t* victimTask = findTaskByTaskNum(victimTaskNum);
    process_t* victimProcess = victimTask->process;
    uint32_t exceptionCR3 = victimProcess->pageDirPtr;
    uint32_t pagingExceptionESP = victimTask->tss->ESP;
    

    __asm__("mov cr3,eax\n"::"a"(KERNEL_CR3));
    
    lPTEAddress=kPagingGet4kPTEntryAddressCR3(exceptionCR3,exceptionCR2);
    lPDEAddress=kPagingGet4kPDEntryAddressCR3(exceptionCR3,exceptionCR2);
    lPDEValue=kPagingGet4kPDEntryValueCR3(exceptionCR3,exceptionCR2);
    lPTEValue=kPagingGet4kPTEntryValueCR3(exceptionCR3,exceptionCR2);
    elfInfo_t* elf=victimProcess->elf;
    //printd(DEBUG_EXCEPTIONS,"Paging exception START: for address 0x%08X (CR3=0x%08X)\n",exceptionCR2,exceptionCR3);
    printd(DEBUG_EXCEPTIONS,"kPagingExceptionHandlerNew: Paging exception occurred at 0x%08X (CR3=0x%08X)\n",exceptionCR2,exceptionCR3);
    printd(DEBUG_EXCEPTIONS,"\tProcess=%s (0x%08X)\n\tChecking for uninitialized mmap page, pt entry=0x%08X\n",victimProcess->path,victimProcess->task->taskNum, lPTEValue);
    //Phys addr portion will equal virtual address, admin/user page will be 1, present will be 0
    pageVirtAddress=lPTEValue&0xFFFFF000;
    if ( (pageVirtAddress==(exceptionCR2&0xFFFFF000)) 
            && (pageFlags&4==4) 
            && (lPTEValue&1==0) )
    {
        printd(DEBUG_EXCEPTIONS,"\t\tFound uninitialized mmap page\n",victimProcess->path,lPTEValue);
        dllist_t* mmaps=victimProcess->mmaps;
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
            printd(DEBUG_EXCEPTIONS,"\t\tProcess has no mmaps, skipping mmap check\n",victimProcess->path,lPTEValue);
    }
    else
        printd(DEBUG_EXCEPTIONS,"\t\tNot mmap page\n",victimProcess->path,lPTEValue);
    
    //Check for CoW pages in libraries
    printd(DEBUG_EXCEPTIONS,"\tChecking for CoW bss/data in libraries\n",victimProcess->path);
    if (pagingGet4kPTEntryValueCR3((uint32_t)victimProcess->task->pageDir,exceptionCR2) & COW_PAGE)
    {
        isCow=true;
        printd(DEBUG_EXCEPTIONS,"\tAddress is CoW per PTE\n");
    }
    


    if (!isCow)
    {
        for (int cnt=0;cnt<victimProcess->elf->libraryElfCount;cnt++)
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
        pagingMapPage(KERNEL_CR3,newPhys,newPhys,0x7);
        memcpy((void*)newPhys,(void*)(mappedCR2),PAGE_SIZE);
        pagingMapPage(exceptionCR3,exceptionCR2 & 0xFFFFF000,newPhys,0x7);
        pagingMapPage(KERNEL_CR3,exceptionCR2 & 0xFFFFF000,newPhys,0x7);
        printd(DEBUG_EXCEPTIONS,"\tReplaced CoW page 0x%08X (0x%08X) with writable page 0x%08X (contents copied)\n",exceptionCR2&0xFFFFF000,mappedCR2,newPhys);
        __asm__("xor ebx,ebx\nmov cr2,ebx\n");
        return 0;
    }
    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
    {
          printk("\nPaging handler: Exception for virtual address 0x%02X\n",exceptionCR2);
          printk("PDE@0x%08X=0x%08X, PTE@0x%08X=0x%08X\n", lPDEAddress, lPDEValue, lPTEAddress, lPTEValue);
          printPagingExceptionRegs(pagingExceptionESP);
          //printDumpedRegs();
          if (!isCow) //CLR 12/29/2018: Stop logging exception info for CoWs
            logDumpedRegs();
          //printk("handler called %u times since system start\n",kPagingExceptionsSinceStart+1);
          printk("Finding symbol for 0x%08X ...\n",exceptionCR2);
    }
    
    kPagingExceptionsSinceStart++;
    printd(DEBUG_EXCEPTIONS,"kPagingExceptionHandler: Signalling SEGV for cr3=0x%08X\n",exceptionCR3);
    printk("segfault in '%s' at 0x%08X (cr2=0x%08X)\n",victimProcess->path,exceptionEIP,exceptionCR2);
    __asm__("push eax\n mov eax,0\nmov cr2,eax\npop eax\n  #reset CR2 after paging exception handled");
    sys_sigaction2(SIGSEGV,0,0xe,exceptionCR3);

    //Set the return address from the exception to a loop where the process can ... wait for death
    victimTask->tss->EIP = (uint32_t)&waitForDeath;
    victimProcess->retVal = -1;
    //Return 1 which means SEGV
    return;
    
}