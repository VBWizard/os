/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "kIRQHandlers.h"

bool schedulerEnabled=false;
extern uint32_t nextScheduleTicks;
extern void processSignals();

void kIRQ0_handler()
{
#ifndef DEBUG_NONE
static char currTime[200];
static struct tm theDateTime;
static bool doSigProc=true;
#endif
    *kTicksSinceStart=*kTicksSinceStart+1;
    if (*kTicksSinceStart % kTicksPerSecond == 0)
        kSystemCurrentTime++;
    if (schedulerEnabled)
    {
        if(*kTicksSinceStart>nextScheduleTicks)
        {
            scheduler();
        }
        else if (doSigProc)
        {
            printd(DEBUG_SIGNALS,"\nProcessing signals\n");
            processSignals();
            doSigProc=!doSigProc;
        }
        else
            doSigProc=!doSigProc;
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
            //printf("0x%04X:0x%08X 0x%08X",exceptionCS, exceptionEIP, exceptionFlags);
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
