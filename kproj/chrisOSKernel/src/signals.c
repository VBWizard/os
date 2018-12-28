/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "signals.h"
#include "process.h"
#include "thesignals.h"
//TODO: ******************** Tie signals into scheduler ********************************
extern void sigSleepReturn();
extern void triggerScheduler();
extern void changeTaskQueue(task_t* task, eTaskState newState);

extern uintptr_t *qRunning;
extern uintptr_t *qRunnable;
extern uintptr_t *qISleep;
extern uint32_t* kTicksSinceStart;
extern task_t* findTaskByCR3(uint32_t cr3);
extern task_t* findTaskByTaskNum(uint32_t taskNum);

//Set a signal but don't trigger the scheduler
void sys_setsigaction(int signal, uintptr_t* sigAction, uint32_t sigData)
{
    uint32_t oldCR3;

    __asm__("mov eax,cr3\n":"=a" (oldCR3));
    __asm__("cli\n");
    __asm__("mov eax,%[newCR3]\n"
            "mov cr3,eax\n"::[newCR3] "r" (KERNEL_CR3));
    
    process_t *p=findTaskByCR3(oldCR3)->process;

    printd(DEBUG_SIGNALS,"Handling signal 0x%08X\n",signal);
    switch (signal)
    {
        case SIG_SEGV:
            printd(DEBUG_SIGNALS,"Set signal 0x%08X, action=*0x%08X, sigData=0x%08X\n",signal,sigAction,sigData);
            p->signals.sigind|=SIG_SEGV;
            p->signals.sighandler[SIG_SEGV]=sigAction;
            p->signals.sigdata[SIG_SEGV]=sigData;
            break; 
        case SIG_SLEEP:
            printd(DEBUG_SIGNALS,"Set signal 0x%08X, action=*0x%08X, sigData=0x%08X\n",signal,sigAction,sigData);
            p->signals.sigind|=SIG_SLEEP;
            p->signals.sighandler[SIG_SLEEP]=sigAction;
            p->signals.sigdata[SIG_SLEEP]=sigData;
            triggerScheduler();
            break;
        default:
            panic("sys_setsigaction: Unhandled signal 0x%08X, sigAction 0x%08X\n",signal,sigAction);
            break;
    }
    printd(DEBUG_SIGNALS,"Setting CR3 back to 0x%08X\n",oldCR3);
    __asm__("mov cr3,eax\nsti\n"::"a" (oldCR3));
}

//Process a sigaction against a process, called by sys_sigaction or the kernel
void* sys_sigaction2(int signal, uintptr_t* sigAction, uint32_t sigData, uint32_t callerCR3)
{
    process_t *p;
    
    printd(DEBUG_SIGNALS, "sys_sigAction2(0x%08X, 0x%08X, 0x%08X, 0x%08X)\n"
            ,signal, sigAction, sigData,callerCR3);

    void* processAddr=findTaskByCR3(callerCR3);
    if (!processAddr)
        panic("Could not find task with CR3 of 0x%08X for signal 0x%08X, sigAction 0x%08X\n",callerCR3,signal,sigAction);
    p=((task_t*)processAddr)->process;
    printd(DEBUG_SIGNALS, "sys_sigaction2: Found process 0x%08X, task 0x%04X for cr3 of 0x%08X\n",p,p->task->taskNum,sigData);
    switch (signal)
    {
        case SIG_USLEEP:    //Put task to sleep until a situation occurs.  For now its only when another task ends
            p->signals.sigind|=SIG_USLEEP;
            p->signals.sigdata[SIG_USLEEP]=sigData;
            printd(DEBUG_SIGNALS,"Signalling USLEEP for cr3=0x%08X, sigData=0x%08X, sigind=0x%08X\n",callerCR3,sigData,p->signals.sigind);
            triggerScheduler();
            __asm__("mov cr3,eax\nsti\n"::"a" (callerCR3));
            __asm__("sti\nhlt\n");      //Halt until the next tick when another task will take its place
            break;
        case SIG_SLEEP:
            p->signals.sigind|=SIG_SLEEP;
            p->signals.sigdata[SIG_SLEEP]=sigData;
            printd(DEBUG_SIGNALS,"Signalling SLEEP for task 0x%04X, wakeTicks=0x%08X\n",p->task->taskNum,sigData);
            __asm__("cli\n");
            triggerScheduler();
            __asm__("mov cr3,eax\nsti\n"::"a" (callerCR3));
            __asm__("sti\nhlt\n");      //Halt until the next tick when another task will take its place
            break;
        case SIG_STOP:
            printd(DEBUG_SIGNALS,"Signalling STOP for task 0x%04X, old sigind=0x%08X, ",p->task->taskNum,p->signals.sigind);
            p->signals.sigind|=SIG_STOP;
            printd(DEBUG_SIGNALS,"new sigind=0x%08X\n",p->signals.sigind);
            __asm__("cli\n");
            triggerScheduler();
            printd(DEBUG_SIGNALS,"Scheduler triggered, halting until next tick\n");
            __asm__("mov cr3,eax\nsti\n"::"a" (callerCR3));
            __asm__("sti\nhlt\n");      //Put the task to sleep until the next tick when another task will take its place    
            printd(DEBUG_SIGNALS,"Process resumed from SIG_STOP");
            break;
        case SIG_SEGV:
            printd(DEBUG_EXCEPTIONS,"SEGV signalled for cr3=0x%08X, signald=0x%08X processing signal\n",callerCR3,p->signals.sigind);
            p->signals.sigind|=SIG_SEGV;
            triggerScheduler();
            printd(DEBUG_EXCEPTIONS,"SEGV signalled for cr3=0x%08X, signald=0x%08X, returning to caller\n",callerCR3,p->signals.sigind);
            return p;      //SEGV is called by kernel exception handler which is an INT handler.  We just need to return so it an IRET
            break;
        default:
            panic("sys_sigaction2: Unhandled signal 0x%08X, sigAction 0x%08X\n",signal,sigAction);
    }
    return NULL;
}

//Process a sigaction, called by running program which wants the signal
void sys_sigaction(int signal, uintptr_t* sigAction, uint32_t sigData)
{
    uint32_t oldCR3;
    
    __asm__("mov eax,cr3\n":"=a" (oldCR3));
    __asm__("cli\n");
    __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));

    printd(DEBUG_PROCESS,"sys_sigaction(0x%08X,0x%08X,0x%08X,0x%08X)\n",signal,sigAction,sigData,oldCR3);
    void* junk=sys_sigaction2(signal, sigAction, sigData, oldCR3);
    
}

//Pass a signal to the currently running task
void sys_sigactionC(int signal, uintptr_t* sigAction, uint32_t sigData)
{
    __asm__("cli\n");
    
    __asm__("sti\n");
}

//Iterate the running, runnable and sleeping queues, looking for new signals
void processSignals()
{
    uintptr_t*run;
    uintptr_t*sleep;
    //Process running

    uint32_t priorCR3;

    __asm__("cli\nmov ebx,cr3\nmov cr3,%[cr3Val]\n"
            :"=b" (priorCR3):[cr3Val] "r" (KERNEL_CR3));
    printd(DEBUG_SIGNALS,"\tSaving old CR3 value (0x%08X)\n",priorCR3);
    run=qRunning;
    sleep=qISleep;
goto scanSleep; //Currently no running signals to process, remove me later
    printd(DEBUG_SIGNALS,"\tScanning running queue\n");
    while (*run!=NO_NEXT)
    {
        if (*run!=0)
        {
            task_t* task=(task_t*)*run;
            if (((process_t*)(task->process))->signals.sigind)
                switch (((process_t*)(task->process))->signals.sigind)
                {
                    case SIG_SLEEP:
                        //((process_t*)(task->process))->signals.sigdata[SIG_SLEEP]+=*kTicksSinceStart;
                         //changeTaskQueue(task,TASK_ISLEEP);
                        break;
                    default:
                        break;
                }
        }
        run++;
    }

scanSleep:
    printd(DEBUG_SIGNALS,"\tScanning Interruptable Sleep queue\n");
    while (*sleep!=NO_NEXT)
    {
        if (*sleep!=0)
        {
            task_t* task=(task_t*)*sleep;
            if (((process_t*)(task->process))->signals.sigdata[SIG_SLEEP]<*kTicksSinceStart)
            {
                printd("\tWaking task %0x04X as wakeTicks (0x%08X) < kTicksSinceStart (0x%08X)",((process_t*)(task->process))->signals.sigdata[SIG_SLEEP],*kTicksSinceStart);
                changeTaskQueue(task,TASK_RUNNABLE);
                ((process_t*)(task->process))->signals.sigdata[SIG_SLEEP]=0;
                ((process_t*)(task->process))->signals.sigind&=~SIG_SLEEP;
                task->prioritizedTicksInRunnable=1000000;  //Make this the next chosen task
            }
        }
        sleep++;
    }
    __asm__("mov cr3,%[cr3Val]"::[cr3Val] "r" (priorCR3));
    printd(DEBUG_SIGNALS,"\tRestored old CR3 (0x%08X)\n",priorCR3);
    printd(DEBUG_SIGNALS,"Done processing signals\n");
}