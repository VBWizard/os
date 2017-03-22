/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "kernel.h"
#include "i386/bits/types.h"
#include <time.h>
#include "printf.h"
#include "i386/irqHandlers.h"
#include "i386/kPaging.h"
#include "utility.h"
#include "signals.h"
#include "process.h"

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

    __asm__("mov cr3,eax\n"::"a"(KERNEL_CR3));
    
    if (exceptionNumber==0x0e)
        //Get the address of the page table entry for the exception
        lPTEAddress=kPagingGet4kPTEntryAddress(exceptionCR2);

#ifndef DEBUG_NONE
    if (!kPagingInitDone)
    {
        lOldDebugLevel=kDebugLevel;
        kDebugLevel&=!DEBUG_EXCEPTIONS;
    }
    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
    {
        lPDEValue=kPagingGet4kPDEntryValue(exceptionCR2);
        lPTEValue=kPagingGet4kPTEntryValue(exceptionCR2);
        lPDEAddress=kPagingGet4kPDEntryAddress(exceptionCR2);
        if (exceptionNumber==0x0e)
          printk("\nPaging handler called for virtual address 0x%02X\n",exceptionCR2);
          printk("PDE@0x%08X=0x%08X, PTE@0x%08X=0x%08X\n", lPDEAddress, lPDEValue, lPTEAddress, lPTEValue);
          printDumpedRegs();
          //printk("handler called %u times since system start\n",kPagingExceptionsSinceStart+1);
    }
#endif
    if (lOldDebugLevel)
        kDebugLevel=lOldDebugLevel;
    
    kPagingExceptionsSinceStart++;
    printd(DEBUG_EXCEPTIONS,"kPagingExceptionHandler: Signalling SEGV for cr3=0x%08X\n",exceptionCR3);
    process_t* p=sys_sigaction2(SIG_SEGV,0,0xe,exceptionCR3);
    printk("segfault in '%s' at 0x%08X (cr2=0x%08X)\n",p->path,exceptionEIP,exceptionCR2);

    __asm__("push eax\n mov eax,0\nmov cr2,eax\npop eax\n  #reset CR2 after paging exception handled");

    if (p->task->taskNum!=1)      //retval=1 is Kernel, so don't return.
    {
        printd(DEBUG_EXCEPTIONS,"kPagingExceptionHandler: Returning\n");
        __asm__("\sti\nnop\nnop\nnop\nmov cr3,eax\n":"=a"(exceptionCR3));
        return;
    }
pagingExceptionStop: 
    printk("Exception was in kernel, halting system\n");
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