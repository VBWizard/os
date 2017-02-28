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

void pagingExceptionHandler()
{
    uint32_t lPDEValue=0;
    uint32_t lPTEValue=0;
    uint32_t lPDEAddress=0, lPTEAddress=0;
    uint32_t lOldDebugLevel=0;

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
          printk("handler called %u times since system start\n",kPagingExceptionsSinceStart+1);
    }
#endif
    if (lOldDebugLevel)
        kDebugLevel=lOldDebugLevel;
    if ((exceptionCR2&0xFFFFF000)==0xC0000000 && (!kPagingInitDone))
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printk("\n\tpagingExceptionHandler: Updating 0x%08X to read/write for WP test ...\n\t",exceptionCR2);
#endif
        kPagingSetPageReadOnlyFlag((uintptr_t*)lPTEAddress, false);
    }
    
    kPagingExceptionsSinceStart++;
#ifndef DEBUG_NONE
//    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
//    {
//        waitForKeyboardKey();
//    }
#endif
    __asm__("push eax\n mov eax,0\nmov cr2,eax\npop eax\n  #reset CR2 after paging exception handled");
    if ((!kPagingInitDone) && exceptionCR2==0xC0000000)
    {
        exceptionCR2=0;
        return;
    }
    __asm__("sti\n");
    pagingExceptionStop: __asm__("hlt\n"); goto pagingExceptionStop;
    __asm__("cli");
    __asm__("hlt");
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