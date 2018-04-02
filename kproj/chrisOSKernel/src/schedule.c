/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "schedule.h"

#define SCHEDULER_DEBUG 1


task_t *kTaskList;
uintptr_t *qZombie;
uintptr_t *qRunning;
uintptr_t *qRunnable;
uintptr_t *qStopped;
uintptr_t *qUSleep;
uintptr_t *qISleep;
uintptr_t *qExited;

extern uint32_t* kTicksSinceStart;
uint32_t kTaskSwitchCount;
uint32_t kSchedulerCallCount;
uint32_t NO_TASK=0xFFFFFFFF;

uint32_t nextScheduleTicks;

const char* TASK_STATE_NAMES[] = {"Zombie","Running","Runnable","Stopped","Uninterruptable Sleep","Interruptable Sleep","Exited","None"};
extern bool schedulerTaskSwitched;
extern task_t* kKernelTask;
extern task_t* kIdleTask;

void changeTaskQueue(task_t* task, eTaskState newState);

#define MAX_TASKS 100

void initSched()
{
    kTaskList=kMalloc(1000*sizeof(task_t));
    memset(kTaskList,0,1000*sizeof(task_t));
    printd(DEBUG_PROCESS,"\tInitialized kTaskList @ 0x%08X, sizeof(task_t)=0x%02X\n",kTaskList,sizeof(task_t));
    kTaskList[0].prev=NO_PREV;
    kTaskList[999].next=NO_NEXT;
    //TODO: Change # of array elements to # of processors
    qRunning=kMalloc(MAX_TASKS*sizeof(uintptr_t));
    memset(qRunning,0,MAX_TASKS*sizeof(uintptr_t));
    qRunning[MAX_TASKS-1]=NO_NEXT;
    //TODO: Change # of array elements to # of processors
    qRunnable=kMalloc(MAX_TASKS*sizeof(uintptr_t));
    memset(qRunnable,0,MAX_TASKS*sizeof(uintptr_t));
    qRunnable[MAX_TASKS-1]=NO_NEXT;

    qStopped=kMalloc(MAX_TASKS*sizeof(uintptr_t));
    memset(qStopped,0,MAX_TASKS*sizeof(uintptr_t));
    qStopped[MAX_TASKS-1]=NO_NEXT;
    
    qISleep=kMalloc(MAX_TASKS*sizeof(uintptr_t));
    memset(qISleep,0,MAX_TASKS*sizeof(uintptr_t));
    qISleep[MAX_TASKS-1]=NO_NEXT;

    qExited=kMalloc(MAX_TASKS*10*sizeof(uintptr_t));    //We want to store lots of exited tasks!
    memset(qExited,0,MAX_TASKS*10*sizeof(uintptr_t));
    qExited[(MAX_TASKS*10)-1]=NO_NEXT;

    qUSleep=kMalloc(MAX_TASKS*sizeof(uintptr_t));
    memset(qUSleep,0,MAX_TASKS*sizeof(uintptr_t));
    qUSleep[MAX_TASKS-1]=NO_NEXT;

    //Put the current (kernel) task in the running queue, as it IS running!
    kTaskSwitchCount=0;
    kKernelTask=submitNewTask(kKernelTask);
    changeTaskQueue(kKernelTask,TASK_RUNNING);
}

#define SET_CR3(a) {__asm__("mov cr3,eax\n"::"a" (a));}

task_t* findTaskByCR3(uint32_t cr3)
{
    task_t* taskList;

    printd(DEBUG_PROCESS | DEBUG_DETAILED,"\tfindTaskByCR3: Finding task with CR3=0x%08X\n",cr3);
    taskList=kTaskList;
    do
    {
        if ((uint32_t)taskList->pageDir==cr3)
            break;
        taskList++;
    } while (taskList->next!=NO_NEXT);

    if (taskList->taskNum==0x0 || (uint32_t)taskList->pageDir!=cr3)
    {
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"\tfindTaskByCR3: Could not find task with CR3=0x%08X\n",cr3);
        return NULL;
    }
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"\tfindTaskByCR3: Found task @ 0x%08X\n",taskList);
    return taskList;
}

//Find a task by only task number when we don't know which list it is in
task_t* findTaskByTaskNum(uint32_t taskNum)
{
    task_t* taskList;
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"\tfindTaskByNum: Finding task 0x%04X\n",taskNum);
    taskList=kTaskList;
    do
    {
        if (taskList->taskNum==taskNum)
            break;
        taskList++;
    } while (taskList->next!=NO_NEXT);

    if (taskList->taskNum==0x0)
    {
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"\tfindTaskByTaskNum: Could not find task with TaskNum=0x%08X\n",taskNum);
        return NULL;
    }

    printd(DEBUG_PROCESS | DEBUG_DETAILED,"\tfindTaskByNum: Found task @ 0x%08X\n",taskList);
    return taskList;
}

void markTaskEnded(uint32_t cr3, uint32_t retval)
{
    int listNum=0;
    task_t* taskList=findTaskByCR3(cr3);

    ((process_t*)taskList->process)->retVal=retval;
    if ((uint32_t)taskList->pageDir!=cr3)
        panic("markTaskEnded: Could not find task for CR3=0x%08X to end\n",cr3);
    taskList->exited=true;
    //If the task being ended is running, trigger a schedule on the next tick to get rid of it
    if (listNum==TASK_RUNNING)
        nextScheduleTicks=*kTicksSinceStart;
    printd(DEBUG_PROCESS,"\tmarkTaskEnded: Marked task 0x%04X ended w/ retval=0x%08X, triggered scheduler\n",taskList->taskNum,retval);
}

void storeISRSavedRegs(task_t* task)
{
    task->tss->CS=isrSavedCS;
    task->tss->EIP=isrSavedEIP;
    task->tss->SS=isrSavedSS;
    task->tss->DS=isrSavedDS;
    task->tss->EAX=isrSavedEAX;
    task->tss->EBX=isrSavedEBX;
    task->tss->ECX=isrSavedECX;
    task->tss->EDX=isrSavedEDX;
    task->tss->ESI=isrSavedESI;
    task->tss->EDI=isrSavedEDI;
    task->tss->ESP=isrSavedESP;
    task->tss->EBP=isrSavedEBP;
    task->tss->EFLAGS=isrSavedFlags;
    task->tss->ES=isrSavedES;
    task->tss->FS=isrSavedFS;
    task->tss->GS=isrSavedGS;
    task->tss->CR3=isrSavedCR3;
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"*\tSave: ");
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"CR3=0x%08X,",task->tss->CR3);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"CS=0x%04X,",task->tss->CS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EIP=0x%08X,",task->tss->EIP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"SS=0x%04X,",task->tss->SS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"DS=0x%04X,",task->tss->DS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EAX=0x%08X,",task->tss->EAX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"DBX=0x%08X,",task->tss->EBX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ECX=0x%08X,",task->tss->ECX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EDX=0x%08X,",task->tss->EDX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ESI=0x%08X,",task->tss->ESI);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EDI=0x%08X,",task->tss->EDI);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ESP=0x%08X,",task->tss->ESP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EBP=0x%08X,",task->tss->EBP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"FLAGS=0x%08X\n",task->tss->EFLAGS);
#endif
}

void loadISRSavedRegs(task_t* task)
{
    isrSavedCS=task->tss->CS;
    isrSavedEIP=task->tss->EIP;
    isrSavedSS=task->tss->SS;
    isrSavedDS=task->tss->DS;
    isrSavedEAX=task->tss->EAX;
    isrSavedEBX=task->tss->EBX;
    isrSavedECX=task->tss->ECX;
    isrSavedEDX=task->tss->EDX;
    isrSavedESI=task->tss->ESI;
    isrSavedEDI=task->tss->EDI;
    isrSavedESP=task->tss->ESP;
    isrSavedEBP=task->tss->EBP;
    isrSavedFlags=task->tss->EFLAGS;
    isrSavedES=task->tss->ES;
    isrSavedFS=task->tss->FS;
    isrSavedGS=task->tss->GS;
    isrSavedCR3=task->tss->CR3;
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"*\tLoad: ");
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"CR3=0x%08X,",task->tss->CR3);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"CS=0x%04X,",task->tss->CS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EIP=0x%08X,",task->tss->EIP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"SS=0x%04X,",task->tss->SS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"DS=0x%04X,",task->tss->DS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EAX=0x%08X,",task->tss->EAX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"DBX=0x%08X,",task->tss->EBX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ECX=0x%08X,",task->tss->ECX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EDX=0x%08X,",task->tss->EDX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ESI=0x%08X,",task->tss->ESI);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EDI=0x%08X,",task->tss->EDI);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ESP=0x%08X,",task->tss->ESP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EBP=0x%08X,",task->tss->EBP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"FLAGS=0x%08X\n",task->tss->EFLAGS);
#endif
}

uintptr_t* getQ(eTaskState state)
{
    switch (state)
    {
        case TASK_RUNNABLE:
            return qRunnable;
            break;
        case TASK_RUNNING:
            return qRunning;
            break;
        case TASK_ZOMBIE:
            return qZombie;
            break;
        case TASK_USLEEP:
            return qUSleep;
            break;
        case TASK_ISLEEP:
            return qISleep;
            break;
        case TASK_STOPPED:
            return qStopped;
            break;
        case TASK_EXITED:
            return qExited;
        default:
            printd(DEBUG_PROCESS,"getQ: Invalid queue 0x%02X - %s",state,TASK_STATE_NAMES[state]);
            return NULL;
            break;
    }
}

task_t* findOpenTaskSlot()
{
	task_t* list=kTaskList;
	while (list!=(task_t*)NO_NEXT && list->taskNum!=0)
	{
		list++;
	}
	if (list==(task_t*)NO_NEXT)
		return NULL;
	return list;
}
void addToQ(uintptr_t* queue, task_t* taskPtr);

task_t* submitNewTask(task_t *task)
{
	uint32_t prev=0, next=0;
	task_t *slot=findOpenTaskSlot();
	printd(DEBUG_PROCESS,"\taddTaskToTaskList: Found open slot @ 0x%08X\n",slot);
	prev=slot->prev;
	next=slot->next;
	memcpy(slot,task,sizeof(task_t));
	printd(DEBUG_PROCESS,"\tmoved new task 0x%04X there\n",task->taskNum);
	slot->prev=prev;
	slot->next=next;
        slot->taskState=TASK_RUNNABLE;
        addToQ(qRunnable,slot);
        if (slot->taskNum>1)
            ((process_t*)(slot->process))->signals.sigind=0;
	return slot;
}

//Find a task in the running list to replace
task_t* findRunningTaskToReplace()
{
    uintptr_t* queue=qRunning;
    
    while (*queue==0 && *queue!=NO_NEXT)
        queue++;
    
    if (*queue!=NO_NEXT)
        return (task_t*)*queue;
    return NULL;
}

//Find a task in the runnable queue that we can run
//Using the fairness doctrine for now, so task with most ticks in runnable gets to run
task_t* findTaskToRun()
{
    int32_t mostIdleTicks=-1;
    task_t* taskToRun=NULL;

    uintptr_t* queue=qRunnable;
    
    while (*queue!=NO_NEXT)
    {
        if (*queue!=0)
        {
            //This is where we increment all the runnable ticks, based on the process' priority
            printd(DEBUG_PROCESS,"*\tfindTaskToRun: task 0x%04X, priority=%u, old ticks=%u, new ticks=",
                    ((task_t*)*queue)->taskNum,
                    ((process_t*)((task_t*)*queue)->process)->priority,
                    ((task_t*)*queue)->prioritizedTicksInRunnable);
            if ( (task_t*)*queue!=kIdleTask)
                ((task_t*)*queue)->prioritizedTicksInRunnable+=(RUNNABLE_TICKS_INTERVAL-((process_t*)((task_t*)*queue)->process)->priority)+1;
            printd(DEBUG_PROCESS,"%u",((task_t*)*queue)->prioritizedTicksInRunnable);
            if ( (task_t*)*queue==kIdleTask)
                printd(DEBUG_PROCESS," (idle task)");
            printd(DEBUG_PROCESS,"\n");
            if ( ((task_t*)*queue)->prioritizedTicksInRunnable > mostIdleTicks)
            {
                taskToRun=(task_t*)*queue;
                mostIdleTicks=((task_t*)*queue)->prioritizedTicksInRunnable;
            }
        }
        queue++;
    }
    
    if (taskToRun!=NULL)
        return taskToRun;
    return NULL;
}

void removeFromQ(uintptr_t* queue, task_t* taskPtr)
{
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_PROCESS,"*\t\tremoveFromQ: Removing task 0x%04X (0x%08X) from queue %s\n",
            taskPtr->taskNum,
            taskPtr,
            TASK_STATE_NAMES[taskPtr->taskState]);
#endif
    while (*queue!=NO_NEXT)
    {
        if (*queue==(uintptr_t)taskPtr)
        {
            *queue=0;
            return;
        }
        queue++;
    }
    panic("Can't find queue entry to remove!");
}

void addToQ(uintptr_t* queue, task_t* taskPtr)
{
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_PROCESS,"*\t\taddToQ: Adding task 0x%04X to queue %s\n",taskPtr->taskNum,TASK_STATE_NAMES[taskPtr->taskState]);
#endif
    while (*queue!=NO_NEXT)
    {
        if (*queue==0)
        {
            *queue=(uintptr_t)taskPtr;
            return;
        }
        queue++;
    }
    panic("Can't find queue entry to add task to!");
}

//Change state and move to new queue
void changeTaskQueue(task_t* task, eTaskState newState)
{
    uintptr_t* newQ=getQ(newState);
    uintptr_t* oldQ=getQ(task->taskState);

#ifdef SCHEDULER_DEBUG
    printd(DEBUG_PROCESS,"*\tchangeTaskQueue: Changing task state for 0x%04X from %s to %s\n",
            task->taskNum,
            TASK_STATE_NAMES[task->taskState],
            TASK_STATE_NAMES[newState]);
#endif
    if (oldQ==NULL)
        panic("changeTaskQueue: Invalid queue oldQ=0x%08X, state=%s",oldQ,TASK_STATE_NAMES[task->taskState]);
    if (newQ==NULL)
        panic("changeTaskQueue: Invalid queue newQ=0x%08X, state=%s",newQ,TASK_STATE_NAMES[newState]);
    removeFromQ(oldQ,task);
    if (task->taskState==TASK_RUNNING)  //old state
    {
        ((process_t*)task->process)->totalRunTicks+=(*kTicksSinceStart-task->lastRunStartTicks);
    }
    task->taskState=newState;
    addToQ(newQ,task);
    if (newState==TASK_RUNNABLE)
        task->prioritizedTicksInRunnable=0;
    else if (newState==TASK_RUNNING)
        task->lastRunStartTicks=*kTicksSinceStart;
}

void taskYield()
{
    
}

void triggerScheduler()
{
     nextScheduleTicks=*kTicksSinceStart-1;
}

void checkUSleepTasks(task_t* taskToStop)
{
    uintptr_t* q=qUSleep;
    task_t* task;
    process_t* process;
    printd(DEBUG_PROCESS,"checkUSleepTasks: Looking through USLEEP queue for tasks to wake up\n");
    while (*q!=NO_NEXT)
    {
        task=(task_t*)*q;
        process=task->process;
        if (process->signals.sigdata[SIG_USLEEP]==taskToStop->taskNum)
        {
            printd(DEBUG_PROCESS,"checkUSleepTasks: Found process 0x%04X in usleep queue waiting for process 0x%04X, moving to Runnable queue\n",task->taskNum,taskToStop->taskNum);
            process->signals.sigdata[SIG_USLEEP]=0;
            process->signals.sigind &=~SIG_USLEEP;
            printd(DEBUG_PROCESS,"checkUSleepTasks: Process 0x%04X, sigind=0x%08X\n",task->taskNum,process->signals.sigind);
            changeTaskQueue(task,TASK_RUNNABLE);
        }
        q++;
    }
}

void runAnotherTask(bool schedulerRequested)
{
    uint32_t oldCR3;
    eTaskState stopQueue=TASK_NONE, startQueue=TASK_NONE;
    __asm__("cli\nmov ebx,cr3\nmov cr3,%[cr3Val]\n"
            :"=b" (oldCR3):[cr3Val] "r" (KERNEL_CR3));
    printd(DEBUG_PROCESS,"\n****************************** SCHEDULER *******************************\n");
    //printd(DEBUG_PROCESS,"*Looking through TASK_RUNNABLE for a process to run @ 0x%08X ticks\n",*kTicksSinceStart);
    //Get task to stop
    task_t* taskToStop=findRunningTaskToReplace();
    if (taskToStop==NULL)
    panic("Can't find task to put in the running queue ... not possible!!!\n");

#ifdef SCHEDULER_DEBUG
    printd(DEBUG_PROCESS,"*Found task 0x%04X to take off CPU @0x%04X:0x%08X (exited=%u).\n",taskToStop->taskNum, taskToStop->tss->CS,taskToStop->tss->EIP,taskToStop->exited);
#endif
    if (taskToStop->exited)
    {
#ifdef SCHEDULER_DEBUG
        printd(DEBUG_PROCESS,"*Task (0x%04X) ended, removing it from %s list.\n",taskToStop->taskNum,TASK_STATE_NAMES[taskToStop->taskState]);
#endif
        stopQueue=TASK_EXITED;
        gdtEntryOS(taskToStop->taskNum,0,0,0,0,false);
        //Look through the USleep looking for task that is waiting on this one to end
        checkUSleepTasks(taskToStop);
    }
    else if (/*(taskToStop->taskNum!=1) && */((process_t*)(taskToStop->process))->signals.sigind)
    {
#ifdef SCHEDULER_DEBUG
        printd(DEBUG_PROCESS,"*sys_sigaction: sigind=0x%08X\n",((process_t*)(taskToStop->process))->signals.sigind);
#endif
        switch (((process_t*)(taskToStop->process))->signals.sigind)
        {
            case SIG_USLEEP:
                stopQueue=TASK_USLEEP;
                break;
            case SIG_SEGV:
                stopQueue=TASK_EXITED;
                checkUSleepTasks(taskToStop);
                break;
            case SIG_STOP:
                stopQueue=TASK_STOPPED;
#ifdef SCHEDULER_DEBUG
                printd(DEBUG_PROCESS,"*SIG_STOP processed\n");
#endif
                break;
            case SIG_SLEEP:
                stopQueue=TASK_ISLEEP;
                break;
            default:
                panic("scheduler: Unhandled signal");
                break;
        }
    }
    else
    {
        stopQueue=TASK_RUNNABLE;
    }
    //Get task to start
    changeTaskQueue(taskToStop,stopQueue);
    printd(DEBUG_PROCESS,"*Finding task to run\n");
    task_t* taskToRun=findTaskToRun();

    if (taskToRun!=NULL && taskToRun->taskNum==taskToStop->taskNum)
    {
        printd(DEBUG_PROCESS,"*No new task to run, continuing with the current task\n");
        changeTaskQueue(taskToStop,TASK_RUNNING);   //switch it back to the running queue
        printd(DEBUG_PROCESS,"CS: 0x%08x, EIP: 0x%08x, DS: 0x%08x\n",taskToStop->tss->CS, taskToStop->tss->EIP, taskToStop->tss->DS);
    }

    if (taskToRun!=NULL && taskToRun->taskNum!=taskToStop->taskNum)
    {
        printd(DEBUG_PROCESS,"*Found task 0x%04X move to CPU\n",taskToRun->taskNum);
        storeISRSavedRegs(taskToStop);              //we're taking it off the cpu so save the registers
        changeTaskQueue(taskToRun,TASK_RUNNING);
        loadISRSavedRegs(taskToRun);
        //Move the new task onto the CPU
#ifdef SCHEDULER_DEBUG
        printd(DEBUG_PROCESS,"*Restarting CPU with new process (0x%04X) @ 0x%04X:0x%08X\n",taskToRun->taskNum,taskToRun->tss->CS,taskToRun->tss->EIP);
#endif

        printd(DEBUG_PROCESS,"*Total running ticks: 0x%04X: %u, 0x%04X: %u\n",
                taskToStop->taskNum,
                ((process_t*)taskToStop->process)->totalRunTicks,
                taskToRun->taskNum,
                ((process_t*)taskToRun->process)->totalRunTicks);
        schedulerTaskSwitched=true;
        kTaskSwitchCount++;
    }
    else
    {
        __asm__("mov cr3,%[cr3Val]"::[cr3Val] "r" (oldCR3));
    }
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_PROCESS,"*Scheduler calls=%u, task switchs=%u, ticks=0x%08X\n",kSchedulerCallCount, kTaskSwitchCount,*kTicksSinceStart);
    printd(DEBUG_PROCESS,"**************************************************************************\n");
#endif
    nextScheduleTicks=*kTicksSinceStart+TICKS_PER_SCHEDULER_RUN;
    return;
}

void scheduler()
{
    //NOTE: When this method is entered, it is time to reschedule.  The check for whether it is time is in kIRQ0_handler()
    runAnotherTask(true);
    kSchedulerCallCount++;
}

