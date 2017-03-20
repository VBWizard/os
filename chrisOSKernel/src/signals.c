/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "signals.h"
#include "process.h"
#include "chrisos.h"
extern void sigSleepReturn();
extern void triggerScheduler();

void sys_sigaction(int signal, uintptr_t* sigAction, uint32_t sigData)
{
    uint32_t oldCR3;
    
    __asm__("mov eax,cr3\n":"=a" (oldCR3));
    __asm__("cli\n");
    __asm__("mov eax,%[newCR3]\n"
            "mov cr3,eax\n"::[newCR3] "r" (KERNEL_CR3));
    process_t *p=findTaskByCR3(oldCR3)->process;
    if (!p)
        panic("Could not find task with CR3 of 0x%08X for signal 0x%08X, sigAction 0x%08X\n",oldCR3,signal,sigAction);
    switch (signal)
    {
        case SIG_SLEEP:
            p->signals.sigind|=SIG_SLEEP;
            p->signals.sighandler[SIG_SLEEP]=sigSleepReturn;
            p->signals.sigdata[SIG_SLEEP]=sigData;
            printd(DEBUG_PROCESS,"Signalling STOP for task 0x%04X\n",p->task->taskNum);
            triggerScheduler();
            __asm__("sti\nhlt\n");      //Put the task to sleep until the next tick when another task will take its place    
__asm__("sigSleepReturn:");
            break;
        case SIG_STOP:
            printd(DEBUG_PROCESS,"Signalling STOP for task 0x%04X, old sigind=0x%08X, ",p->task->taskNum,p->signals.sigind);
            p->signals.sigind|=SIG_STOP;
            printd(DEBUG_PROCESS,"new sigind=0x%08X\n",p->signals.sigind);
            __asm__("cli\n");
            triggerScheduler();
            printd(DEBUG_PROCESS,"Scheduler triggered, halting until next tick\n");
            __asm__("sti\nhlt\n");      //Put the task to sleep until the next tick when another task will take its place    
            printd(DEBUG_PROCESS,"Process resumed from SIG_STOP");
            break;
        default:
            panic("Unhandled signal 0x%08X, sigAction 0x%08X\n",signal,sigAction);
    }
    __asm__("mov oldCR3,eax\n"::"a" (oldCR3));

}

