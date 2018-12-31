/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "signals.h"
#include "process.h"
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

    //CLR 12/24/2018: Removed sigind's as we don't want to trigger signals, just set their actions
    printd(DEBUG_SIGNALS,"Handling signal 0x%08X\n",signal);
    switch (signal)
    {
        case SIGSEGV:
            printd(DEBUG_SIGNALS,"Set signal 0x%08X, action=*0x%08X, sigData=0x%08X\n",signal,sigAction,sigData);
            //p->signals.sigind|=SIG_SEGV;
            p->signals.sighandler[SIGSEGV]=sigAction;
            p->signals.sigdata[SIGSEGV]=sigData;
            break; 
        case SIGSLEEP:
            printd(DEBUG_SIGNALS,"Set signal 0x%08X, action=*0x%08X, sigData=0x%08X\n",signal,sigAction,sigData);
            //p->signals.sigind|=SIG_SLEEP;
            p->signals.sighandler[SIGSLEEP]=sigAction;
            p->signals.sigdata[SIGSLEEP]=sigData;
            triggerScheduler();
            break;
        default:
            panic("sys_setsigaction: Unhandled signal 0x%08X, sigAction 0x%08X\n",signal,sigAction);
            break;
    }
    printd(DEBUG_SIGNALS,"Setting CR3 back to 0x%08X\n",oldCR3);
    __asm__("mov cr3,eax\nsti\n"::"a" (oldCR3));
}

    typedef void sigHandler(void);


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
    printd(DEBUG_SIGNALS, "sys_sigaction2: Found process 0x%08X, task 0x%04X for cr3 of 0x%08X\n",p,p->task->taskNum,callerCR3);
    switch (signal)
    {
        case SIGUSLEEP:    //Put task to sleep until a situation occurs.  For now its only when another task ends
            p->signals.sigind|=SIGUSLEEP;
            p->signals.sigdata[SIGUSLEEP]=sigData;
            printd(DEBUG_SIGNALS,"Signalling USLEEP for cr3=0x%08X, sigData=0x%08X, sigind=0x%08X\n",callerCR3,sigData,p->signals.sigind);
            triggerScheduler();
            __asm__("mov cr3,eax\nsti\n"::"a" (callerCR3));
            __asm__("sti\nhlt\n");      //Halt until the next tick when another task will take its place
            break;
        case SIGSLEEP:
            p->signals.sigind|=SIGSLEEP;
            p->signals.sigdata[SIGSLEEP]=sigData;
            printd(DEBUG_SIGNALS,"Signalling SLEEP for task 0x%04X, wakeTicks=0x%08X\n",p->task->taskNum,sigData);
            __asm__("cli\n");
            triggerScheduler();
            __asm__("mov cr3,eax\nsti\n"::"a" (callerCR3));
            __asm__("sti\nhlt\n");      //Halt until the next tick when another task will take its place
            break;
        case SIGSTOP:
            printd(DEBUG_SIGNALS,"Signalling STOP for task 0x%04X, old sigind=0x%08X, ",p->task->taskNum,p->signals.sigind);
            p->signals.sigind|=SIGSTOP;
            printd(DEBUG_SIGNALS,"new sigind=0x%08X\n",p->signals.sigind);
            __asm__("cli\n");
            triggerScheduler();
            printd(DEBUG_SIGNALS,"Scheduler triggered, halting until next tick\n");
            __asm__("mov cr3,eax\nsti\n"::"a" (callerCR3));
            __asm__("sti\nhlt\n");      //Put the task to sleep until the next tick when another task will take its place    
            printd(DEBUG_SIGNALS,"Process resumed from SIG_STOP");
            break;
        case SIGSEGV:
            printd(DEBUG_EXCEPTIONS,"SEGV signalled for cr3=0x%08X, signald=0x%08X processing signal\n",callerCR3,p->signals.sigind);
            p->signals.sigind|=SIGSEGV;
            triggerScheduler();
            return p;      //SEGV is called by kernel exception handler which is an INT handler.  We just need to return so it an IRET
            break;
        case SIGINT:
            //If signal is not blocked then set it
            if (!(p->signals.sigmask & (SIGINT)))
            {
                p->signals.sigind|=SIGINT;
                printd(DEBUG_EXCEPTIONS,"SIGINT signalled for cr3=0x%08X (signald=0x%08X, sigmask=0x%08X) processing signal\n",callerCR3,p->signals.sigind,p->signals.sigmask);
            }
            else
                printd(DEBUG_EXCEPTIONS,"SIGINT signalled for cr3=0x%08X but blocked (sigmask=0x%08X), ignoring signal.\n",callerCR3,p->signals.sigmask);
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
    __asm__("mov cr3,eax\nsti\n"::"a" (oldCR3));

}

//Pass a signal to the currently running task
void sys_sigactionC(int signal, uintptr_t* sigAction, uint32_t sigData)
{
    __asm__("cli\n");
    
    __asm__("sti\n");
}

//NOTE: true will mask/block the signal, false will unmask/unblock it
void sys_masksig(signals signal, bool mask)
{
    uint32_t oldCR3;
    
    __asm__("mov eax,cr3\n":"=a" (oldCR3));
    __asm__("cli\n");
    __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));

    process_t *p=findTaskByCR3(oldCR3)->process;
    
    printd(DEBUG_PROCESS,"sys_masksig: Old sigmask = 0x%08X\n",p->signals.sigmask);
    if (mask)
        p->signals.sigmask |= signal;
    else
        p->signals.sigmask &= ~(signal);
    printd(DEBUG_PROCESS,"sys_masksig: New sigmask = 0x%08X\n",p->signals.sigmask);
    
    __asm__("mov cr3,eax\nsti\n"::"a" (oldCR3));
}

//Iterate the running, runnable and sleeping queues, looking for new signals
void processSignals()
{
    uintptr_t*run;
    uintptr_t*sleep;
    bool awoken=false;
    //Process running

    uint32_t priorCR3;

    __asm__("cli\nmov ebx,cr3\nmov cr3,%[cr3Val]\n"
            :"=b" (priorCR3):[cr3Val] "r" (KERNEL_CR3));
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
                    case SIGSLEEP:
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
            if (((process_t*)(task->process))->signals.sigdata[SIGSLEEP]<*kTicksSinceStart)
            {
                printd(DEBUG_SIGNALS,"\tWaking task 0x%04X as wakeTicks (0x%08X) < kTicksSinceStart (0x%08X)\n",task->taskNum,((process_t*)(task->process))->signals.sigdata[SIGSLEEP],*kTicksSinceStart);
                changeTaskQueue(task,TASK_RUNNABLE);
                ((process_t*)(task->process))->signals.sigdata[SIGSLEEP]=0;
                ((process_t*)(task->process))->signals.sigind&=~SIGSLEEP;
                task->prioritizedTicksInRunnable=1000000;  //Make this the next chosen task
                awoken=true;
            }
        }
        sleep++;
    }
    __asm__("mov cr3,%[cr3Val]"::[cr3Val] "r" (priorCR3));
    if (awoken) 
    {
        printd(DEBUG_SIGNALS,"Trigger the scheduler to process ... the awoken\n");
        triggerScheduler();
    }
    printd(DEBUG_SIGNALS,"Done processing signals\n");
}

void executeSigHandler()
{
    
}