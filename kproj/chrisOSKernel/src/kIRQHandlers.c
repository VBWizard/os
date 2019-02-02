/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "kIRQHandlers.h"
#include "printf.h"
#include "kInit.h"
#include "../../chrisOS/include/io.h"
#include "drivers/termdrv.h"
#include "kutility.h"

extern uint32_t nextScheduleTicks;
extern void processSignals();
uint32_t kNextSignalCheckTicks=0;
bool schedulerTriggered=false;
bool signalCheckTriggered=false;
extern bool schedulerEnabled;
extern terminfo_t *sysConsole;

void kIRQ0_handler()
{
#ifndef DEBUG_NONE
static char currTime[200];
static struct tm theDateTime;
#endif
    if (++*kTicksSinceStart % kTicksPerSecond == 0)
        kSystemCurrentTime++;
    if (schedulerEnabled)
    {
        if(*kTicksSinceStart>=nextScheduleTicks && schedulerEnabled)
        {
            printd(DEBUG_PROCESS,"kIRQ0_Handler: triggering scheduler\n");
            schedulerTriggered=true;
        }
        if (*kTicksSinceStart>kNextSignalCheckTicks)
        {
            printd(DEBUG_SIGNALS,"\nProcessing signals\n");
            //signalCheckTriggered=true;
            processSignals();
            kNextSignalCheckTicks=*kTicksSinceStart+TICKS_PER_SIGNAL_CHECK;
/*            uint32_t currCR3;
            SAVE_CURRENT_CR3(currCR3);
            LOAD_KERNEL_CR3
            __asm__("CLI\n");
            printd(DEBUG_PROCESS,"Starting term update @ 0x%08x\n",sysConsole->updateTerminal);
            sysConsole->updateTerminal();
            printd(DEBUG_PROCESS,"Term update done @ 0x%08x\n",sysConsole->updateTerminal);
            __asm__("STI\n");
            LOAD_CR3(currCR3);
*/        }
    }
#ifndef DEBUG_EXPANDED_TICK
        if ((kDebugLevel & DEBUG_EXPANDED_TICK) == DEBUG_EXPANDED_TICK)
        {
            cursorSavePosition();
            gmtime_r((time_t*)&kSystemCurrentTime,&theDateTime);
            strftime((char*)&currTime, 50, "%m/%d/%Y %H:%M:%S", &theDateTime);
            cursorMoveTo(0,24);
            printk("The time is currently %s", &currTime);
            cursorMoveTo(65,24);
            printk("ticks=%d", *kTicksSinceStart);
            cursorRestorePosition();
        }
#endif
#ifndef DEBUG_TICK
        if ((kDebugLevel & DEBUG_TICK) == DEBUG_TICK)
        {
            cursorSavePosition();
            cursorMoveTo(55,SYS_VGA_HEIGHT-1);
            //printf("0x%04X:0x%08x 0x%08x",exceptionCS, exceptionEIP, exceptionFlags);
            //kTermMoveTo(65,0);
            printk("%u",*kTicksSinceStart);
            printk("-%c-%04X:%08X",(isrSavedFlags & 0x200)==0x200?'I':'i',isrSavedCS, isrSavedEIP);
            //gmtime_r((time_t*)&kSystemCurrentTime,&theDateTime);
            //strftime((char*)&currTime, 50, "%H:%M:%S", &theDateTime);
            //kTermMoveTo(65,0);
            //printf("%s",currTime);
            cursorRestorePosition();
        }
#endif
}

void kIRQ8_handler()
{
    printd(DEBUG_EXCEPTIONS,"In kernel irq8 handler\n");
}

void IRQ_clear_mask(unsigned char IRQline) {
    uint16_t port;
    uint8_t value;
 
    if(IRQline < 8) {
        port = PIC1_DATA;
    } else {
        port = PIC2_DATA;
        IRQline -= 8;
    }
    value = inb(port) & ~(1 << IRQline);
    outb(port, value);        
}
