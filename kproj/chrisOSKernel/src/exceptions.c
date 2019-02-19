/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
#include "thesignals.h"
#include "filesystem/pipe.h"
#include "drivers/tty_driver.h"
#include "kutility.h"

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
extern pipe_t *activeSTDOUT;
#define KEYB_DATA_PORT 0x60
#define KEYB_CTRL_PORT 0x61

uint32_t tds=0;
unsigned volatile char kKeyStatus[11];
extern struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf);
extern void kpagingUpdatePresentFlagA(uint32_t address, bool present);
void* sys_sigaction2(int signal, uintptr_t* sigAction, uint32_t sigData, void *process);


void defaultISRHandler()
{
    uintptr_t oldCR3;
    
    SAVE_CURRENT_CR3(oldCR3);
    LOAD_KERNEL_CR3;
    task_t *victimTask = getCurrentTask();
    //terminal_clear();

    if (isrNumber==7)
    {
        if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
        {
            //printd(DEBUG_EXCEPTIONS,"defaultISRHandler: Exception 0x7 triggered.  We are ignoring the CR0 task switched flag (TS) for now.  Will reset the flag and resume.\n",kPagingExceptionsSinceStart+1);
        }
        LOAD_CR3(oldCR3);
        __asm__("clts\n");
        return;
    }
    
    //We are going to "mess up" the TSS now but we're going to except anyways
/*    victimTask->tss->EAX = isrSavedEAX;
    victimTask->tss->EBX = isrSavedEBX;
    victimTask->tss->ECX = isrSavedECX;
    victimTask->tss->EDX = isrSavedEDX;
    victimTask->tss->ESI = isrSavedESI;
    victimTask->tss->EDI = isrSavedEDI;
    victimTask->tss->ESP = isrSavedESP;
    victimTask->tss->EBP = isrSavedEBP;
    victimTask->tss->CS = isrSavedCS;
    victimTask->tss->DS = isrSavedDS;
    victimTask->tss->ES = isrSavedES;
    victimTask->tss->FS = isrSavedFS;
    victimTask->tss->GS = isrSavedGS;
    victimTask->tss->SS = isrSavedSS;
    printd(DEBUG_EXCEPTIONS, "Exception 0x%02x triggered at 0x%04x:0x%08x (error code 0x%08x\n", isrNumber, isrSavedCS, isrSavedEIP, isrSavedErrorCode);
    printPagingExceptionRegs(victimTask, 0, isrSavedErrorCode, false);
    printPagingExceptionRegs(victimTask, 0, isrSavedErrorCode, true);
   */
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
    {
	printk("Exception 0x%02x triggered at 0x%04x:0x%08x (error code 0x%08x\n", isrNumber, isrSavedCS, isrSavedEIP, isrSavedErrorCode);
//        printk("Exception handler called for exception # 0x%02x\n\n", isrNumber);
        printDumpedRegs();
        printd(DEBUG_EXCEPTIONS,"handler called %u times since system start\n",kPagingExceptionsSinceStart+1);
    }
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
            printk("\t0x%08x%: 0x%08x\n",esp, exceptionSavedStack[cnt]);
            esp+=4;
        }
    __asm__("cli");
    __asm__("hlt");
}

void setupPagingHandler()
{
    pagingExceptionTSS = allocPages(sizeof(tss_t));
    printd(DEBUG_PROCESS, "Allocated TSS for paging exception task gate at 0x%08x",pagingExceptionTSS);
    pagingMapPageCount(KERNEL_CR3, ((uint32_t)pagingExceptionTSS | KERNEL_PAGED_BASE_ADDRESS),(uint32_t)pagingExceptionTSS,0x1,0x7,true);
    pagingMapPageCount(KERNEL_CR3, ((uint32_t)pagingExceptionTSS),(uint32_t)pagingExceptionTSS,0x1,0x7,true);
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
    printd(DEBUG_PROCESS,"Allocated pages at 0x%08x for paging exception handler ESP0\n",pagingExceptionTSS->ESP0);
    pagingMapPageCount(KERNEL_CR3, pagingExceptionTSS->ESP0 | KERNEL_PAGED_BASE_ADDRESS, pagingExceptionTSS->ESP0, 0x16, 0x7, true);
    pagingMapPageCount(KERNEL_CR3, pagingExceptionTSS->ESP0, pagingExceptionTSS->ESP0, 0x16, 0x7, true);
    pagingExceptionTSS->ESP0+=0x10000;
    printd(DEBUG_PROCESS,"Offset paging exception handler ESP0 to 0x%08x\n",pagingExceptionTSS->ESP0);
    
    
    pagingExceptionTSS->ESP=allocPagesAndMap(0x16000);
    printd(DEBUG_PROCESS,"Allocated pages at 0x%08x for paging exception handler ESP\n",pagingExceptionTSS->ESP);
    pagingMapPageCount(KERNEL_CR3, pagingExceptionTSS->ESP | KERNEL_PAGED_BASE_ADDRESS, pagingExceptionTSS->ESP, 0x16, 0x7, true);
    pagingMapPageCount(KERNEL_CR3, pagingExceptionTSS->ESP , pagingExceptionTSS->ESP, 0x16, 0x7, true);
    pagingExceptionTSS->ESP+=0x10000;
    printd(DEBUG_PROCESS,"Offset paging exception handler ESP to 0x%08x\n",pagingExceptionTSS->ESP);

    pagingExceptionTSS->SS1=pagingExceptionTSS->SS0;
    pagingExceptionTSS->ESP1=pagingExceptionTSS->ESP0;
    pagingExceptionTSS->SS2=pagingExceptionTSS->SS0;
    pagingExceptionTSS->ESP2=pagingExceptionTSS->ESP0;
    
    
    pagingExceptionTSS->EFLAGS=0x200007;

    gdtEntryOS(0x17,pagingExceptionTSS,sizeof(tss_t), ACS_TSS,GDT_GRANULAR | GDT_32BIT,true);

    //install the paging exception handler task TSS
    idt_set_gate (&idtTable[0xe], 0xB8, 0, ACS_TASK | ACS_DPL_0); //paging exception
}

void kPagingExceptionHandlerNew(uint32_t pagingExceptionCR2, int ErrorCode)
{
    uint32_t lPDEValue=0;
    uint32_t lPTEValue=0;
    uint32_t lPDEAddress=0, lPTEAddress=0;
    uint32_t lOldDebugLevel=0;
    bool isCow=false, isMMap=false, mmapSucceeded=false, exceptionInKernelMode=false;
    tss_t* ourTSS = pagingExceptionTSS;
    uint32_t victimTaskNum = ourTSS->LINK;
    victimTaskNum >>= 3;
    if (victimTaskNum==0x17 || victimTaskNum==0)
        panic("Paging exception in paging exception handler at 0x%08x, error 0x%08x",pagingExceptionCR2, ErrorCode);
    task_t* victimTask = findTaskByTaskNum(victimTaskNum);
    process_t* victimProcess = victimTask->process;
    uint32_t pagingExceptionCR3 = victimTask->tss->CR3;
    bool nullPointer = false;
    
    if (pagingExceptionCR3 == KERNEL_CR3)
    {
        exceptionInKernelMode=true;
        printd(DEBUG_EXCEPTIONS,"kPagingExceptionHandlerNew: Paging exception was in kernel CR3 (0x%08x), victim CR3=0x%08x (Process 0x%04x).\n",pagingExceptionCR3, victimProcess->pageDirPtr, victimTaskNum);
        //CLR 01/27/2019: TODO: This is a total HACK.  For some reason QEMU is storing the kernel CR3 on task switch from obvious non-kernel code, to this exception handler.
        //So I'm switching it back, in the TSS too!
        //TODO: This needs to be figured out and fixed!
        if ((victimTask->tss->CS & 0x3)==0x3)
        {
            
            printd(DEBUG_EXCEPTIONS,"Switching to victim CR3 (updating TSS.CR3 too which is a HACK)\n");
            victimTask->tss->CR3 = victimProcess->pageDirPtr;
            pagingExceptionCR3 = victimProcess->pageDirPtr;
        }
    }
    lPTEAddress=kPagingGet4kPTEntryAddressCR3(victimProcess->pageDirPtr,pagingExceptionCR2);
    lPDEAddress=kPagingGet4kPDEntryAddressCR3(victimProcess->pageDirPtr,pagingExceptionCR2);
    lPDEValue=kPagingGet4kPDEntryValueCR3(victimProcess->pageDirPtr,pagingExceptionCR2);
    lPTEValue=kPagingGet4kPTEntryValueCR3(victimProcess->pageDirPtr,pagingExceptionCR2);
    uint32_t lKPTEValue=kPagingGet4kPTEntryValueCR3(KERNEL_CR3,pagingExceptionCR2);
    nullPointer=lPDEValue==0;
    
    uint32_t pagePhysAddr=lPTEValue&0xFFFFF000;
    uint32_t pageFlags=lPTEValue&0x00000FFF;
    elfInfo_t* elf=victimProcess->elf;
    
    printd(DEBUG_EXCEPTIONS,"kPagingExceptionHandlerNew: Paging exception occurred at 0x%04X:0x%08x in task 0x%04X, for 0x%08x, error code 0x%08x (CR3=0x%08x, VPTE=0x%08X, KPTE=0x%08X)\n",victimTask->tss->CS, victimTask->tss->EIP, victimTaskNum, pagingExceptionCR2,ErrorCode, pagingExceptionCR3,lPTEValue,lKPTEValue);

    if (exceptionInKernelMode)
    {
        //More hacking
        if ( ( (ErrorCode & 0x2) && (lPTEValue & 0x7) )               //either request was write and PTE is write 
                || ( (ErrorCode & 0x2==0) && lPTEValue & 0x5) )    //or request was read and 
        {
            pagingMapPage(KERNEL_CR3,(pagingExceptionCR2 & 0xFFFFF000),pagePhysAddr,(uint16_t)0x7);
            printd(DEBUG_EXCEPTIONS,"\tpagingMapPage(0x%08x,0x%08x,0x%08x,0x%04x)\n",KERNEL_CR3, (pagingExceptionCR2 & 0xFFFFF000), pagePhysAddr, 0x7);
            pagingMapPage(KERNEL_CR3,(pagingExceptionCR2 & 0xFFFFF000) | 0xC0000000, pagePhysAddr,(uint16_t)0x7);
            printd(DEBUG_EXCEPTIONS,"\tpagingMapPage(0x%08x,0x%08x,0x%08x,0x%04x)\n",KERNEL_CR3, (pagingExceptionCR2 & 0xFFFFF000) | 0xC0000000, pagePhysAddr, 0x7);
            printd(DEBUG_EXCEPTIONS,"kPagingExceptionHandlerNew: Kernel mapping was missing, Mapped it.  Returning\n");
            goto kPagingExceptionHandlerNewReturn;
        }
    }
    //Don't forget to map the victim process to VADDR!
    pagingMapPage(victimProcess->task->tss->CR3, PROCESS_STRUCT_VADDR, (uint32_t)victimProcess & 0xFFFFF000, (uint16_t)0x7); //FIX ME!!!  Had to change to 0x7 for sys_sigaction2 USLEEP
   __asm__("clts\n"); //TODO: Didn't save fpu registers
    //printd(DEBUG_EXCEPTIONS,"Paging exception START: for address 0x%08x (CR3=0x%08x)\n",exceptionCR2,exceptionCR3);
    printd(DEBUG_EXCEPTIONS,"\tProcess=%s (0x%08x)\n\tChecking for uninitialized mmap page, pt entry=0x%08x\n",victimProcess->path,victimProcess->task->taskNum, lPTEValue);

    //Phys addr portion will equal virtual address, admin/user page will be 1, present will be 0
    if ( !nullPointer && (pageFlags&PAGE_MMAP_FLAG) && !(pageFlags&PAGE_PRESENT_FLAG))
    {
        isMMap = true;
        printd(DEBUG_EXCEPTIONS,"\t\tFound uninitialized mmap page\n",victimProcess->path,lPTEValue);
        mmapSucceeded = handleMMapPagingException(victimProcess, pagingExceptionCR2, lPTEValue, ErrorCode);
    }  
    else
        printd(DEBUG_EXCEPTIONS,"\t\tNot mmap page\n",victimProcess->path,lPTEValue);

    if (!nullPointer && !isMMap)
    {
        //Check for page tagged as COW (bit 9)
        printd(DEBUG_EXCEPTIONS,"\tChecking for CoW bits\n");
        uint32_t cowPTEp = pagingGet4kPTEntryAddressCR3((uint32_t)pagingExceptionCR3,pagingExceptionCR2);
        uint32_t cowPTE = pagingGet4kPTEntryValueCR3((uint32_t)pagingExceptionCR3,pagingExceptionCR2);
        if (cowPTE & PAGE_COW_FLAG)
        {
            isCow=true;
            printd(DEBUG_EXCEPTIONS,"\t\tAddress is CoW per PTE (0x%08x=0x%08x)\n",cowPTEp, cowPTE);
        }
        else
        {
            printd(DEBUG_EXCEPTIONS,"\t\tAddress is not CoW per PTE (0x%08x=0x%08x)\n",cowPTEp, cowPTE);
        }
    }
    if (!nullPointer && !isMMap && !isCow)
    {
        //Check for CoW pages in libraries
        printd(DEBUG_EXCEPTIONS,"\tChecking for CoW bss/data in libraries\n",victimProcess->path);
        for (int cnt=0;cnt<((elfInfo_t*)victimProcess->elf)->libraryElfCount;cnt++)
        {
            elfInfo_t* lib=elf->libraryElfPtr[cnt];
            printd(DEBUG_EXCEPTIONS,"\t\tChecking for CoW in library @ 0x%08x, bss=0x%08x/0x%08x, data=0x%08x/0x%08x, tdata=0x%08x/0x%08x\n",
                    lib,
                    lib->bssAddress,
                    lib->bssSize,
                    lib->dataAddress,
                    lib->dataSize,
                    lib->tdataAddress,
                    lib->tdataSize);
            if (lib->bssAddress<=pagingExceptionCR2 && lib->bssAddress+lib->bssSize>pagingExceptionCR2)
            {
                //CLR 01/04/2019: lib->fileName suddenly is 0x50000000, so can't use it???
                printd(DEBUG_EXCEPTIONS,"\t\tThe page with address 0x%08x is a CoW .bss page from library %s\n",pagingExceptionCR2,""/*lib->fileName*/);
                isCow=true;
                break;
            }
            else if (lib->dataAddress<=pagingExceptionCR2 && lib->dataAddress+lib->dataSize>pagingExceptionCR2)
            {
                //CLR 01/04/2019: lib->fileName suddenly is 0x50000000, so can't use it???
                printd(DEBUG_EXCEPTIONS,"\t\tPage (0x%08x) is CoW .data page from library %s\n",pagingExceptionCR2,""/*lib->fileName*/);
                isCow=true;
                break;
            }
        }
        if (!isCow)
            printd(DEBUG_EXCEPTIONS,"\t\tNot library CoW page\n");
    }

    if (!nullPointer && (isCow || (isMMap & mmapSucceeded)))
    {
        if (isCow) //if isMMap then the page was already fixed.  This is the "success" exit point, so skip fixing up the page, clear the CR2 and exit
        {
            victimProcess->minorFaults++;
            uintptr_t exceptionPhysicalCR2Address=pagingGet4kPTEntryValueCR3(pagingExceptionCR3,pagingExceptionCR2) & 0xFFFFF000;
            uint32_t newPhys=(uint32_t)allocPages(PAGE_SIZE);
            pagingMapPage(KERNEL_CR3,exceptionPhysicalCR2Address,exceptionPhysicalCR2Address,(uint16_t)0x7);
            pagingMapPage(KERNEL_CR3,exceptionPhysicalCR2Address | 0xC0000000,exceptionPhysicalCR2Address,(uint16_t)0x7);
            pagingMapPage(KERNEL_CR3,newPhys,newPhys,(uint16_t)0x7);
            memcpy((void*)newPhys,(void*)(exceptionPhysicalCR2Address),PAGE_SIZE);
            pagingMapPage(pagingExceptionCR3,pagingExceptionCR2 & 0xFFFFF000,newPhys,(uint16_t)0x7);
            pagingMapPage(victimProcess->pageDirPtr,pagingExceptionCR2 & 0xFFFFF000,newPhys,(uint16_t)0x7);
            printd(DEBUG_EXCEPTIONS,"\tReplaced CoW page 0x%08x (0x%08x) with writable page 0x%08x (contents copied).  Returning.\n",pagingExceptionCR2&0xFFFFF000,exceptionPhysicalCR2Address,newPhys);
            if (pagingExceptionCR2>=STACK_INITIAL_PAGE_VIRT_ADDRESS && pagingExceptionCR2<=STACK_INITIAL_PAGE_VIRT_ADDRESS+PAGE_SIZE)
            {
                victimProcess->stackInitialPage=(uintptr_t*)newPhys;
                printd(DEBUG_MMAP,"\tPaging exception was in process' initial stack page.  Updated stackInitialPage to 0x%08x\n",newPhys);
            }
        }
kPagingExceptionHandlerNewReturn:
        printd(DEBUG_EXCEPTIONS,"kPagingExceptionHandlerNew: returning\n");
        __asm__("xor ebx,ebx\nmov cr2,ebx\n");
        return;
    }
    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
    {
          //printk("\nPaging handler: Exception for virtual address 0x%02X\n",pagingExceptionCR2);
          //printk("PDE@0x%08x=0x%08x, PTE@0x%08x=0x%08x\n", lPDEAddress, lPDEValue, lPTEAddress, lPTEValue);
          //printPagingExceptionRegs(victimTask, pagingExceptionCR2, ErrorCode, false);
          printPagingExceptionRegs(victimTask, pagingExceptionCR2, ErrorCode, true, pagingExceptionCR3);
          //dumpAllHeapPointers();
          //printk("handler called %u times since system start\n",kPagingExceptionsSinceStart+1);
          //printk("Finding symbol for 0x%08x ...\n",pagingExceptionCR2);
    }
    
    kPagingExceptionsSinceStart++;
    printd(DEBUG_EXCEPTIONS,"kPagingExceptionHandler: Signalling SEGV for cr3=0x%08x\n",pagingExceptionCR3);
    
    //Print to pipe instead of printk if available
    if (activeSTDOUT)
    {
        char err[256];
        sprintf(err, "\nsegfault in '%s' at 0x%08x (cr2=0x%08x)\n",victimProcess->path,victimTask->tss->EIP,pagingExceptionCR2);
        fs_write(NULL, victimProcess->stdout, err,strlen(err),1);
    }
    else
        printk("\nsegfault in '%s' at 0x%08x (cr2=0x%08x)\n",victimProcess->path,victimTask->tss->EIP,pagingExceptionCR2);
    __asm__("push eax\n mov eax,0\nmov cr2,eax\npop eax\n  #reset CR2 after paging exception handled");
    sys_sigaction2(SIGSEGV,0,0xe, victimProcess);

    //Set the return address from the exception to a loop where the process can ... wait for death
    victimTask->tss->EIP = (uint32_t)&waitForDeath;
    victimProcess->retVal = -1;
    //Return 1 which means SEGV
    return;
    
}
