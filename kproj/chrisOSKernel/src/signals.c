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
extern task_t* findTaskByTaskNum(uint32_t taskNum);
extern task_t *kTaskList;

//Set a signal but don't trigger the scheduler
void sys_setsigaction(int signal, uintptr_t* sigAction, uint32_t sigData)
{
    uint32_t oldCR3;

    __asm__("mov eax,cr3\n":"=a" (oldCR3));
    __asm__("cli\n");
    __asm__("mov eax,%[newCR3]\n"
            "mov cr3,eax\n"::[newCR3] "r" (KERNEL_CR3));
    
    process_t *p=getCurrentProcess();

    //CLR 12/24/2018: Removed sigind's as we don't want to trigger signals, just set their actions
    printd(DEBUG_SIGNALS,"Handling signal 0x%08x\n",signal);
    printd(DEBUG_SIGNALS,"Set signal 0x%08x, action=*0x%08x, sigData=0x%08x\n",signal,sigAction,sigData);
    switch (signal)
    {
        case SIGSEGV:
            //p->signals.sigind|=SIG_SEGV;
            p->signals.sighandler[SIGSEGV]=sigAction;
            p->signals.sigdata[SIGSEGV]=sigData;
            break; 
        case SIGSLEEP:
            //p->signals.sigind|=SIG_SLEEP;
            p->signals.sighandler[SIGSLEEP]=sigAction;
            p->signals.sigdata[SIGSLEEP]=sigData;
            triggerScheduler();
            break;
        case SIGINT:
            p->signals.sighandler[SIGINT]=sigAction;
            p->signals.sigdata[SIGINT]=sigData;
            break;
        //case SIGIO:
        default:
            panic("sys_setsigaction: Unhandled signal 0x%08x, sigAction 0x%08x\n",signal,sigAction);
            break;
    }
    printd(DEBUG_SIGNALS,"Setting CR3 back to 0x%08x\n",oldCR3);
    __asm__("mov cr3,eax\nsti\n"::"a" (oldCR3));
}

    typedef void sigHandler(void);


//Process a sigaction against a process, called by sys_sigaction or the kernel
void* sys_sigaction2(int signal, uintptr_t* sigAction, uint32_t sigData, uint32_t callerCR3)
{
    uint32_t currentTask = 0;
    process_t *p;
    
    __asm__("str eax\nshr eax,3\n":"=a" (currentTask));
    printd(DEBUG_PROCESS, "current task = 0x%04X\n",currentTask);
    if (!currentTask)
        panic("Could not find task with CR3 of 0x%08x for signal 0x%08x, sigAction 0x%08x\n",callerCR3,signal,sigAction);
    if (currentTask!=0x17)
    {
        p = getCurrentProcess();
        callerCR3=p->pageDirPtr;
    }
    else
    {
        p = getCurrentProcess();
    }
    
    printd(DEBUG_SIGNALS, "sys_sigAction2(0x%08x, 0x%08x, 0x%08x, 0x%08x)\n"
            ,signal, sigAction, sigData,callerCR3);
    printd(DEBUG_SIGNALS, "sys_sigaction2: Found process 0x%08x, task 0x%04X for cr3 of 0x%08x\n",p,p->task->taskNum,callerCR3);
    switch (signal)
    {
        case SIGUSLEEP:    //Put task to sleep until a situation occurs.  For now its only when another task ends
            p->signals.sigind|=SIGUSLEEP;
            p->signals.sigdata[SIGUSLEEP]=sigData;
            printd(DEBUG_SIGNALS,"Signalling USLEEP for cr3=0x%08x, sigData=0x%08x, sigind=0x%08x\n",callerCR3,sigData,p->signals.sigind);
            triggerScheduler();
            __asm__("sti\nhlt\n");      //Halt until the next tick when another task will take its place
__asm__("mov cr3,%[cr3]\n"::[cr3] "a" (KERNEL_CR3));
            //Since SIGUSLEEP can be used to wait for a child task, we'll return the exit code from the child task
            return (void*)getExitCode(sigData);
__asm__("mov cr3,eax\n"::"a" (callerCR3));
            break;
        case SIGSLEEP:
            p->signals.sigind|=SIGSLEEP;
            p->signals.sigdata[SIGSLEEP]=sigData;
            printd(DEBUG_SIGNALS,"Signalling SLEEP for task 0x%04X, wakeTicks=0x%08x\n",p->task->taskNum,sigData);
            __asm__("cli\n");
            triggerScheduler();
            __asm__("mov cr3,eax\nsti\n"::"a" (callerCR3));
            __asm__("sti\nhlt\nhlt\nhlt\nhlt\nhlt\nhlt\nhlt\nhlt\nhlt\nhlt\n");      //Halt until the next tick when another task will take its place
            break;
        case SIGSTOP:
            printd(DEBUG_SIGNALS,"Signalling STOP for task 0x%04X, old sigind=0x%08x, ",p->task->taskNum,p->signals.sigind);
            p->signals.sigind|=SIGSTOP;
            printd(DEBUG_SIGNALS,"new sigind=0x%08x\n",p->signals.sigind);
            __asm__("cli\n");
            triggerScheduler();
            printd(DEBUG_SIGNALS,"Scheduler triggered, halting until next tick\n");
            __asm__("mov cr3,eax\nsti\n"::"a" (callerCR3));
            __asm__("sti\nhlt\n");      //Put the task to sleep until the next tick when another task will take its place    
            printd(DEBUG_SIGNALS,"Process resumed from SIG_STOP");
            break;
        case SIGSEGV:
            printd(DEBUG_EXCEPTIONS,"Signaling SEGV for cr3=0x%08x, signald before=0x%08x processing signal\n",callerCR3,p->signals.sigind);
            //No CLI necessary as the exception 0xe handler has already done that
            p->signals.sigind|=SIGSEGV;
            printd(DEBUG_EXCEPTIONS,"Searching for children to SEGV\n");
            for (int cnt=0;cnt<1000;cnt++)
            {
                if (kTaskList[cnt].taskNum != 0)
                {
                    process_t* pc = ((process_t*)kTaskList[cnt].process);
                    if (((process_t*)pc->parent)->task->taskNum==pc->task->taskNum)
                    {
                        p->signals.sigind|=SIGSEGV;
                        printd(DEBUG_EXCEPTIONS,"SEGVing child task %s (0x%04X)\n",pc->path, pc->task->taskNum);
                    }
                }
            }
            printd(DEBUG_EXCEPTIONS,"SEGV signaled for cr3=0x%08x, signald after=0x%08x processing signal\n",callerCR3,p->signals.sigind);
            //NOTE: Triggering of the scheduler and the sti/hlt will be done in the 0xe exception handler
            return;      //SEGV is called by kernel exception handler which is an INT handler.  We just need to return so it an IRET
            break;
        case SIGINT:
            //If signal is not blocked then set it
            if (!(p->signals.sigmask & (SIGINT)))
            {
                p->signals.sigind|=SIGINT;
                printd(DEBUG_EXCEPTIONS,"SIGINT signalled for cr3=0x%08x (signald=0x%08x, sigmask=0x%08x) processing signal\n",callerCR3,p->signals.sigind,p->signals.sigmask);
            }
            else
                printd(DEBUG_EXCEPTIONS,"SIGINT signalled for cr3=0x%08x but blocked (sigmask=0x%08x), ignoring signal.\n",callerCR3,p->signals.sigmask);
            break;
        default:
            panic("sys_sigaction2: Unhandled signal 0x%08x, sigAction 0x%08x\n",signal,sigAction);
    }
    return NULL;
}

//Process a sigaction, called by running program which wants the signal
void* sys_sigaction(int signal, uintptr_t* sigAction, uint32_t sigData)
{
    uint32_t oldCR3;
    
    __asm__("mov eax,cr3\n":"=a" (oldCR3));
    __asm__("cli\n");
    __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));

    printd(DEBUG_PROCESS,"sys_sigaction(0x%08x,0x%08x,0x%08x,0x%08x)\n",signal,sigAction,sigData,oldCR3);
    void* retVal=sys_sigaction2(signal, sigAction, sigData, oldCR3);
    __asm__("mov cr3,eax\n"::"a" (oldCR3));
    return retVal;
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

    process_t *p=getCurrentProcess();
    
    printd(DEBUG_PROCESS,"sys_masksig: Old sigmask = 0x%08x\n",p->signals.sigmask);
    if (mask)
        p->signals.sigmask |= signal;
    else
        p->signals.sigmask &= ~(signal);
    printd(DEBUG_PROCESS,"sys_masksig: New sigmask = 0x%08x\n",p->signals.sigmask);
    
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
                printd(DEBUG_SIGNALS,"\tWaking task 0x%04X as wakeTicks (0x%08x) < kTicksSinceStart (0x%08x)\n",task->taskNum,((process_t*)(task->process))->signals.sigdata[SIGSLEEP],*kTicksSinceStart);
                changeTaskQueue(task,TASK_RUNNABLE);
                ((process_t*)(task->process))->signals.sigdata[SIGSLEEP]=0;
                ((process_t*)(task->process))->signals.sigind&=~SIGSLEEP;
                //CLR 01/17/2019: Don't make sure the task is chosen next!
                //task->prioritizedTicksInRunnable=1000000;  //Make this the next chosen task
                //awoken=true;
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