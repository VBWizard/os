/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "schedule.h"
#include "strings.h"
#include "filesystem/pipe.h"
#include "thesignals.h"
#include "drivers/tty_driver.h"
#include "../../chrisOS/include/utility.h"
#include "printf.h"

#define SCHEDULER_DEBUG 1
#define MAX_TASKS 1000

extern bool schedulerTaskSwitched;
extern task_t* kKernelTask;
extern process_t *kKernelProcess;
extern task_t* kIdleTask;
extern sGDT* bootGdt;
extern bool signalCheckEnabled;
extern volatile uint32_t* kTicksSinceStart;

extern void processSignalDelivery(uintptr_t* sigHandler, uintptr_t* processReturnAddress);
extern uint32_t kCPUCyclesPerSecond;
extern uint32_t sigProcAddress, sigProcCR3; //_scheduler.s
extern void _sigJumpPoint();

void triggerScheduler();

task_t *kTaskList;
uintptr_t *qZombie;
uintptr_t *qRunning;
uintptr_t *qRunnable;
uintptr_t *qStopped;
uintptr_t *qUSleep;
uintptr_t *qISleep;
uintptr_t *qExited;
uint32_t forkReturn;
uint32_t nextTaskTSS;

uint32_t kTaskSwitchCount;
uint32_t kSchedulerCallCount;
uint32_t NO_TASK=0xFFFFFFFF;
uintptr_t* schedStack; //Loaded by scheduler when it is called 

uint32_t nextScheduleTicks;
uint32_t kPagingExceptionCount;

pipe_t *activeSTDOUT, *activeSTDIN, *activeSTDERR;


const char* TASK_STATE_NAMES[] = {"Zombie","Running","Runnable","Stopped","Uninterruptable Sleep","Interruptable Sleep","Exited","None"};

bool schedulerEnabled=false;

void changeTaskQueue(task_t* task, eTaskState newState);

void initSched()
{
    kPagingExceptionCount = 0;
    schedStack = kMalloc(0x16000);
    pagingMapPageCount(KERNEL_CR3, (uintptr_t)schedStack, (uintptr_t)schedStack, 0x16000/PAGE_SIZE, 0x7, true);
    NO_PREV = 0xFFFFFFFF;
    NO_NEXT = 0xFFFFFFFF;
    kTaskList=kMalloc(1000*sizeof(task_t));
    memset(kTaskList,0,1000*sizeof(task_t));
    printd(DEBUG_SCHEDULER,"\tInitialized kTaskList @ 0x%08x, sizeof(task_t)=0x%02X\n",kTaskList,sizeof(task_t));
    kTaskList[0].prev=(task_t*)NO_PREV;
    kTaskList[MAX_TASKS-1].next=(task_t*)NO_NEXT;
    //TODO: Change # of array elements to # of processors
    qRunning=kMalloc(MAX_TASKS*sizeof(uintptr_t));
    memset(qRunning,0,MAX_TASKS*sizeof(uintptr_t));
    qRunning[MAX_TASKS-1]=NO_NEXT;
    
    //TODO: Change # of array elements to # of processors
    qRunnable=kMalloc(MAX_TASKS*sizeof(uintptr_t));
    memset(qRunnable,0,MAX_TASKS*sizeof(uintptr_t));
    qRunnable[MAX_TASKS-1]=NO_NEXT;
    
    //TODO: Change # of array elements to # of processors
    qZombie=kMalloc(MAX_TASKS*sizeof(uintptr_t));
    memset(qZombie,0,MAX_TASKS*sizeof(uintptr_t));
    qZombie[MAX_TASKS-1]=NO_NEXT;
    
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

    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"\tfindTaskByCR3: Finding task with CR3=0x%08x\n",cr3);
    taskList=kTaskList;
    do
    {
        if ((uint32_t)taskList->pageDir==cr3)
            break;
        taskList++;
    } while (taskList->next!=(task_t*)NO_NEXT);

    if (taskList->taskNum==0x0 || (uint32_t)taskList->pageDir!=cr3)
    {
        printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"\tfindTaskByCR3: Could not find task with CR3=0x%08x\n",cr3);
        return NULL;
    }
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"\tfindTaskByCR3: Found task 0x%04x @ 0x%08x\n", taskList->taskNum, taskList);
    return taskList;
}

//Find a task by only task number when we don't know which list it is in
task_t* findTaskByTaskNum(uint32_t taskNum)
{
    task_t* taskList;
    //printd(DEBUG_DETAILED,"\tfindTaskByNum: Finding task 0x%04X\n",taskNum);
    taskList=kTaskList;
    do
    {
        if (taskList->taskNum==taskNum)
            break;
        taskList++;
    } while (taskList->next!=(task_t*)NO_NEXT);

    if (taskList->taskNum==0x0)
    {
        printd(DEBUG_EXCEPTIONS,"\tfindTaskByTaskNum: Could not find task with TaskNum=0x%08x\n",taskNum);
        return NULL;
    }

    printd(DEBUG_DETAILED,"\tfindTaskByNum: Found task @ 0x%08x\n",taskList);
    return taskList;
}

void markTaskEndedByTask(task_t* task, uint32_t retval, bool TriggerScheduler)
{
    int listNum=0;

    ((process_t*)task->process)->retVal=retval;
    task->exited=true;
    //If the task being ended is running, trigger a schedule on the next tick to get rid of it
    printd(DEBUG_SCHEDULER,"\tmarkTaskEnded: Marked task 0x%04x ended w/ retval=0x%08x, triggered scheduler\n",task->taskNum,retval);
    //****DESTROY STUFF HERE****
    //When a task is ended, the scheduler will deal with it on the next tick, so lets wait for that to happen
    if (TriggerScheduler)
    {
        triggerScheduler();
        __asm__("sysCallIdleLoop: sti\nhlt\njmp sysCallIdleLoop\n");
    }
    //Remove task from all queues, not panicing if the task isn't found in a queue
    removeFromQ(qStopped, task, false);
    removeFromQ(qUSleep, task, false);
    removeFromQ(qISleep, task, false);
    removeFromQ(qRunnable, task, false);

}

void markTaskEnded(uint32_t cr3, uint32_t retval, bool TriggerScheduler)
{
    int listNum=0;
    task_t* taskList=findTaskByCR3(cr3);

    ((process_t*)taskList->process)->retVal=retval;
    if ((uint32_t)taskList->pageDir!=cr3)
        panic("markTaskEnded: Could not find task for CR3=0x%08x to end\n",cr3);
    markTaskEndedByTask(taskList, retval, TriggerScheduler);
}

void storeISRSavedRegs(task_t* task)
{
    if (((process_t*)task->process)->execDontSaveRegisters)
    {
        printd(DEBUG_SCHEDULER, "* ***Process %u exec'd, not saving registers***\n", task->taskNum);
        ((process_t*)task->process)->execDontSaveRegisters = false;
    }
    else
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
    }
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"*\tSave (or not): ");
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"CR3=0x%08x,",task->tss->CR3);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"CS=0x%04X,",task->tss->CS);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"EIP=0x%08x,",task->tss->EIP);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"SS=0x%04X,",task->tss->SS);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"DS=0x%04X,",task->tss->DS);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"EAX=0x%08x,",task->tss->EAX);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"EBX=0x%08x,",task->tss->EBX);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"ECX=0x%08x,",task->tss->ECX);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"EDX=0x%08x,",task->tss->EDX);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"ESI=0x%08x,",task->tss->ESI);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"EDI=0x%08x,",task->tss->EDI);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"ESP=0x%08x,",task->tss->ESP);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"EBP=0x%08x,",task->tss->EBP);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"FLAGS=0x%08x\n",task->tss->EFLAGS);
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
    if (((process_t*)task->process)->justForked)
    {
        printd(DEBUG_SCHEDULER,"loadISRSavedRegs: Fork return for newly spawned child\n");
        process_t* parent = ((process_t*)task->process)->parent;
        tss_t *parentTSS = findTaskByTaskNum(parent->task->taskNum)->tss;
        isrSavedCS = parentTSS->CS;
        isrSavedEIP = parentTSS->EIP;
        isrSavedSS = parentTSS->SS;
        isrSavedDS = parentTSS->DS;
        isrSavedEAX = parentTSS->EAX;
        isrSavedEBX = parentTSS->EBX;
        isrSavedECX = parentTSS->ECX;
        isrSavedEDX = parentTSS->EDX;
        isrSavedESI = parentTSS->ESI;
        isrSavedEDI = parentTSS->EDI;
        isrSavedESP = task->tss->ESP1;
        uint32_t parentESP1Offset = parentTSS->ESP - parent->stack1Start;
        uint32_t parentEBPOffset = parentTSS->EBP - parent->stack1Start;
        isrSavedESP = ((process_t*)task->process)->stack1Start + parentESP1Offset;
        isrSavedEBP = ((process_t*)task->process)->stack1Start + parentEBPOffset;
        isrSavedEBP = parentTSS->EBP;
        isrSavedFlags = parentTSS->EFLAGS;
        isrSavedES = parentTSS->ES;
        isrSavedFS = parentTSS->FS;
        isrSavedGS = parentTSS->GS;
        //We need to load the CR3 because whatever CR3 the parent was using, that's what the child should use for the FIRST return from syscall.
        isrSavedCR3 = parentTSS->CR3; 
//        memcpy((uintptr_t*)((process_t*)task->process)->stackStart, (uintptr_t*)parent->stackStart, ((process_t*)task->process)->stackSize);
        memcpy((uintptr_t*)((process_t*)task->process)->stack1Start, (uintptr_t*)parent->stack1Start, ((process_t*)task->process)->stack1Size);
    }
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"*\tLoad: ");
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"CR3=0x%08x,",isrSavedCR3);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"CS=0x%04X,",isrSavedCS);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"EIP=0x%08x,",isrSavedEIP);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"SS=0x%04X,",isrSavedSS);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"DS=0x%04X,",isrSavedDS);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"EAX=0x%08x,",isrSavedEAX);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"DBX=0x%08x,",isrSavedEBX);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"ECX=0x%08x,",isrSavedECX);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"EDX=0x%08x,",isrSavedEDX);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"ESI=0x%08x,",isrSavedESI);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"EDI=0x%08x,",isrSavedEDI);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"ESP=0x%08x,",isrSavedESP);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"EBP=0x%08x,",isrSavedEBP);
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"FLAGS=0x%08x\n",isrSavedFlags);
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
            printd(DEBUG_SCHEDULER,"getQ: Invalid queue 0x%02X - %s",state,TASK_STATE_NAMES[state]);
            return NULL;
            break;
    }
}

task_t* findOpenTaskSlot()
{
	task_t* list=kTaskList;
        int slotNum = 0;
	while (list!=(task_t*)NO_NEXT && list->taskNum!=0)
	{
		list++;
                slotNum++;
	}
	if (list==(task_t*)NO_NEXT)
            panic("No free task slots to assign to new task.  Increase scheduler MAX_TASKS to fix this\n");
        printd(DEBUG_SCHEDULER, "findOpenTaskSlot: Found process at slot # %u\n", slotNum);
	return list;
}
void addToQ(uintptr_t* queue, task_t* taskPtr);

task_t* submitNewTask(task_t *task)
{
	task_t *prev=NULL, *next=NULL;
	task_t *slot=findOpenTaskSlot();
	printd(DEBUG_SCHEDULER,"\taddTaskToTaskList: Found open slot @ 0x%08x\n",slot);
	prev=slot->prev;
	next=slot->next;
	memcpy(slot,task,sizeof(task_t));
	printd(DEBUG_SCHEDULER,"\tmoved new task 0x%04x there\n",task->taskNum);
	slot->prev=prev;
	slot->next=next;
        slot->taskState=TASK_RUNNABLE;
        addToQ(qRunnable,slot);
        if (slot->taskNum>1)
            ((process_t*)(slot->process))->signals.sigind=0;
        task->totalRunningTicks = 0;
	return slot;
}

//Find a task in the running list to replace
task_t* findRunningTask()
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
    uint32_t mostIdleTicks=0, oldTicks;
    task_t* taskToRun=NULL, *task;
    process_t* process;
    uintptr_t* queue=qRunnable;
    
    processSignals();
    int queEntryNum = 0;
    while (*queue!=NO_NEXT)
    {
        if (*queue!=0)
        {
            task = (task_t*)*queue;
            process = task->process;
            oldTicks=task->prioritizedTicksInRunnable;
            //This is where we increment all the runnable ticks, based on the process' priority
            if ( task!=kIdleTask || (task==kIdleTask) && task->prioritizedTicksInRunnable==0)
                task->prioritizedTicksInRunnable+=(RUNNABLE_TICKS_INTERVAL-process->priority)+1;
            printd(DEBUG_SCHEDULER,"*\t(%u) Task 0x%04x (%s-%u[%s-%u]), priority=%i, old ticks=%u, new ticks=%u (ticks RUNNING=%u)\n",
                    queEntryNum,
                    task->taskNum, process->exename,process->childNumber,
                    process->task->taskNum==0x20?"":process->parent->exename, process->parent->task->taskNum,
                    process->priority,
                    oldTicks,
                    task->prioritizedTicksInRunnable, process->totalRunTicks);
            if ( task->prioritizedTicksInRunnable >= mostIdleTicks)
            {
                taskToRun=task;
                mostIdleTicks=task->prioritizedTicksInRunnable;
            }
        }
        queEntryNum++;
        queue++;
    }
    
    if (taskToRun!=NULL)
        return taskToRun;
    return NULL;
}

void removeFromQ(uintptr_t* queue, task_t* taskPtr, bool panicOnNotFound)
{
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"*\t\tremoveFromQ: Removing task 0x%04x (0x%08x) from queue 0x%08x\n",
            taskPtr->taskNum,
            taskPtr,
            queue);
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
    if (panicOnNotFound)
        panic("Can't find queue entry to remove!");
}

void addToQ(uintptr_t* queue, task_t* taskPtr)
{
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"*\t\taddToQ: Adding task 0x%04x to queue %s\n",taskPtr->taskNum,TASK_STATE_NAMES[taskPtr->taskState]);
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
    printd(DEBUG_SCHEDULER,"*\tchangeTaskQueue: Changing task state for 0x%04x from %s to %s\n",
            task->taskNum,
            TASK_STATE_NAMES[task->taskState],
            TASK_STATE_NAMES[newState]);
#endif
    if (oldQ==NULL)
        panic("changeTaskQueue: Invalid queue oldQ=0x%08x, state=%s",oldQ,TASK_STATE_NAMES[task->taskState]);
    if (newQ==NULL)
        panic("changeTaskQueue: Invalid queue newQ=0x%08x, state=%s",newQ,TASK_STATE_NAMES[newState]);
    removeFromQ(oldQ,task,true);
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
    triggerScheduler();
    __asm__("sti\nhlt\n");
}

void triggerScheduler()
{
    printd(DEBUG_SCHEDULER,"triggerScheduler: triggering scheduler\n");
    nextScheduleTicks=*kTicksSinceStart+1; //delay schedule by 1 tick to get the caller a chance to STI
    enableScheduler();
}

void enableScheduler()
{
    schedulerEnabled = true;
}

void disableScheduler()
{
    schedulerEnabled = false;
}

void checkUSleepTasks(task_t* taskToStop)
{
    uintptr_t* q=qUSleep;
    task_t* task;
    process_t* process;
    printd(DEBUG_SCHEDULER,"checkUSleepTasks: Looking through USLEEP queue for tasks to wake up\n");
    while (*q!=NULL)
    {
        task=(task_t*)*q;
        if (task->taskNum!=0)
        {
            process=task->process;
            printd(DEBUG_SCHEDULER, "\tTask 0x%04x: Waiting for task 0x%04x\n",task->taskNum, process->signals.sigdata[SIGUSLEEP]);
            if (process->signals.sigdata[SIGUSLEEP]==taskToStop->taskNum || findTaskByTaskNum(process->signals.sigdata[SIGUSLEEP])->taskState==TASK_ZOMBIE)
            {
                uint32_t taskWaitingFor = 0;
                if (process->signals.sigdata[SIGUSLEEP]==taskToStop->taskNum)
                     taskWaitingFor = taskToStop->taskNum;
                else
                    findTaskByTaskNum(process->signals.sigdata[SIGUSLEEP]);
                    
                printd(DEBUG_SCHEDULER,"\tFound process 0x%04x in usleep queue waiting for process 0x%04x, moving to Runnable queue\n",task->taskNum,taskWaitingFor);
                process->signals.sigdata[SIGUSLEEP]=0;
                process->signals.sigind &=~SIGUSLEEP;
                printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"\tReset SIGUSLEEP for task 0x%04x, sigind=0x%08x\n",task->taskNum,process->signals.sigind);
                changeTaskQueue(task,TASK_RUNNABLE);
            }
        }
        q++;
    }
    printd(DEBUG_SCHEDULER, "checkUSleepTasks: Done!\n");
}

void runAnotherTask(bool schedulerRequested)
{
    uint32_t oldCR3;
    eTaskState taskToStopNewQueue=TASK_NONE, startQueue=TASK_NONE;
    __asm__("cli\nmov ebx,cr3\nmov cr3,%[cr3Val]\n"
            :"=b" (oldCR3):[cr3Val] "r" (KERNEL_CR3));
    //Get task to stop
    task_t* taskToStop=findRunningTask();
    if (taskToStop==NULL)
        panic("Can't find the running task in the running queue  ... unpossible!!!\n");

        process_t* pToStop = taskToStop->process;
    
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_SCHEDULER,"*Found task 0x%04x to take off CPU @0x%04x:0x%08x (exited=%u).\n",taskToStop->taskNum, taskToStop->tss->CS,taskToStop->tss->EIP,taskToStop->exited);
#endif
    if (taskToStop->exited)
    {
#ifdef SCHEDULER_DEBUG
        printd(DEBUG_SCHEDULER,"*Task (0x%04x) ended, removing it from %s list.\n",taskToStop->taskNum,TASK_STATE_NAMES[taskToStop->taskState]);
#endif
        taskToStopNewQueue=TASK_ZOMBIE;
        gdtEntryOS(taskToStop->taskNum,0,0,0,0,false);
        //Look through the USleep looking for task that is waiting on this one to end
        checkUSleepTasks(taskToStop);
    }
    else if (pToStop->signals.sigind)
    {
#ifdef SCHEDULER_DEBUG
        printd(DEBUG_SCHEDULER | DEBUG_DETAILED,"\tStopping task has signals ... sigind=0x%08x\n",((process_t*)(taskToStop->process))->signals.sigind);
#endif
        //CLR 11/25/2022: removed else statements and the panic at the bottom.  We'll ignore un-handled signals
        if ((pToStop->signals.sigind & SIGUSLEEP) == SIGUSLEEP)
            taskToStopNewQueue=TASK_USLEEP;
         if ((pToStop->signals.sigind & SIGSEGV) == SIGSEGV)
        {
            if (!pToStop->signals.sighandler[SIGSEGV])
            {
                printd(DEBUG_SCHEDULER,"*Task 0x%04x: SIGSEGV received, no default handler  Executing default action (kill process).\n",taskToStop->taskNum);
                taskToStopNewQueue=TASK_ZOMBIE;
                checkUSleepTasks(taskToStop);
            }
            else
                taskToStopNewQueue=TASK_RUNNABLE;
        }
        if ((pToStop->signals.sigind & SIGSTOP) == SIGSTOP)
        {
            taskToStopNewQueue=TASK_STOPPED;
#ifdef SCHEDULER_DEBUG
            printd(DEBUG_SCHEDULER,"*SIG_STOP processed\n");
#endif
        }
        if ((pToStop->signals.sigind & SIGSLEEP) == SIGSLEEP)
            taskToStopNewQueue=TASK_ISLEEP;
        if ((pToStop->signals.sigind & SIGINT) == SIGINT)
        {
                //If no handler is installed, default action is to kill the process
                if (!pToStop->signals.sighandler[SIGINT])
                {
                    printd(DEBUG_SCHEDULER,"*Task 0x%04x: SIGINT received, no default handler  Executing default action (kill process).\n",taskToStop->taskNum);
                    taskToStopNewQueue=TASK_ZOMBIE; //CLR 11/30/2022 - changed from TASK_EXITED so that parent process can get exit code
                    checkUSleepTasks(taskToStop);
                }   
                else
                {
                    taskToStopNewQueue=TASK_RUNNABLE;
                }
        }
        if ((pToStop->signals.sigind & SIGIO) == SIGIO)
        {
            taskToStopNewQueue=TASK_RUNNABLE;
            printd(DEBUG_SCHEDULER,"*Task 0x%04x: SIGIO received, no default handler  Executing default action (nothing).\n",taskToStop->taskNum);
        }
    }
    else
    {
        taskToStopNewQueue=TASK_RUNNABLE;
        printd(DEBUG_SCHEDULER, "No signals (sigind=%08X)\n",pToStop->signals.sigind);
    }

    //Get task to start
    storeISRSavedRegs(taskToStop);              //we're taking it off the cpu so save the registers
    changeTaskQueue(taskToStop,taskToStopNewQueue);
    printd(DEBUG_SCHEDULER,"*Finding task to run\n");
    task_t* taskToRun=findTaskToRun();

    if (taskToRun == 0)
        panic("findTaskToRun returned no task, unpossible!!!\n");
    
    if (taskToRun!=NULL && taskToRun->taskNum==taskToStop->taskNum)
    {
        printd(DEBUG_SCHEDULER,"*No new task to run, continuing with the current task\n");
        if (((process_t*)taskToStop)->execDontSaveRegisters)
        {
            printd(DEBUG_SCHEDULER,"Task to keep running was just exec'd, loading registers from tss\n");
            loadISRSavedRegs(taskToStop);
            ((process_t*)taskToStop)->execDontSaveRegisters = false;
        }
        changeTaskQueue(taskToStop,TASK_RUNNING);   //switch it back to the running queue
        printd(DEBUG_SCHEDULER,"CS: 0x%08x, EIP: 0x%08x, DS: 0x%08x\n",isrSavedCS, isrSavedEIP, isrSavedDS);
    }

    if (taskToRun!=NULL && taskToRun->taskNum!=taskToStop->taskNum)
    {
        process_t *process = taskToRun->process;
        printd(DEBUG_SCHEDULER,"*Found task 0x%04x move to CPU\n",taskToRun->taskNum);
        changeTaskQueue(taskToRun,TASK_RUNNING);
        loadISRSavedRegs(taskToRun);
        if (!(strcmp(process->exename,"idle")==0))
        {
            activeSTDIN = process->stdin;
            activeSTDIN->owner = taskToRun->process;
            activeSTDOUT = process->stdout;
            activeSTDOUT->owner = taskToRun->process;
            activeSTDERR = ((process_t *)taskToRun->process)->stderr;
            activeSTDERR->owner = taskToRun->process;
            activeTTY->stdInReadPipe->owner = activeTTY->stdInWritePipe->owner = 
                activeTTY->stdErrReadPipe->owner = activeTTY->stdErrWritePipe->owner = 
                activeTTY->stdOutReadPipe->owner = activeTTY->stdOutWritePipe->owner = taskToRun->process;
            //Keep track of the context switch count
            process->cSwitches++;
        }
        printd(DEBUG_SCHEDULER,"Active STDIN/STDOUT/STDERR=0x%08x/0x%08x/0x%08x, owner %s\n",activeSTDIN, activeSTDOUT, activeSTDERR, (process_t*)(activeSTDIN->owner)->exename==NULL?"":(process_t*)(activeSTDIN->owner)->exename);
        
        //Move the new task onto the CPU
#ifdef SCHEDULER_DEBUG
        printd(DEBUG_SCHEDULER,"*Restarting CPU with new process (0x%04x) @ 0x%04x:0x%08x\n",taskToRun->taskNum,taskToRun->tss->CS,taskToRun->tss->EIP);
#endif

        printd(DEBUG_SCHEDULER,"*Total running ticks: 0x%04x: %u, 0x%04x: %u\n",
                taskToStop->taskNum,
                ((process_t*)taskToStop->process)->totalRunTicks,
                taskToRun->taskNum,
                ((process_t*)taskToRun->process)->totalRunTicks);
        schedulerTaskSwitched=true;
        kTaskSwitchCount++;
        forkReturn = false;
        nextTaskTSS = taskToRun->taskNum;
        nextTaskTSS <<= 3;
        if (!taskToRun->kernel)
            nextTaskTSS |= 3;
        printd(DEBUG_SCHEDULER,"*SET nextTaskTSS to 0x%04x\n",nextTaskTSS);
        //Mark the task being taken off the CPU as "not busy."  This is necessary because the LTR instruction sets the busy flag
        //Since we are using a task gate for exception 0xe, we have to use LTR to keep the currently running task in the TR for back linking
        bootGdt[taskToStop->taskNum].access &= ~(2);
        __asm__("ltr ax\nclts\n":: "a" (nextTaskTSS));
        
        if (((process_t*)taskToRun->process)->justForked)
        {
            forkReturn = isrSavedESP;
            ((process_t*)taskToRun->process)->justForked = 0;
        }

    }

    if (taskToRun->taskNum==0x0022 && taskToStop->taskNum==0x0028)
    {
        int a = 0;
        a+=1;
    }

    printd(DEBUG_SCHEDULER,"Starting process' signals = %u\n",((process_t*)(taskToRun->process))->signals.sigind);

    sigProcAddress = 0x0;
    //If we got here there is a signal handler for the SIGINT/SIGSEGV
    if (((process_t*)taskToRun->process)->signals.sigind & SIGINT || ((process_t*)taskToRun->process)->signals.sigind & SIGSEGV)
    {
        if (((process_t*)taskToRun->process)->signals.sigind & SIGINT)
        {
            sigProcAddress = (uint32_t)((process_t*)taskToRun->process)->signals.sighandler[SIGINT];

            printd(DEBUG_SCHEDULER,"Calling SIGINT handler for the starting process @ 0x%08x\n",sigProcAddress);
        }
        else
        {
            sigProcAddress = (uint32_t)((process_t*)taskToRun->process)->signals.sighandler[SIGSEGV];
            printd(DEBUG_SCHEDULER,"Calling SIGSEGV handler for the starting process @ 0x%08x\n",sigProcAddress);
        }
        sigProcCR3 = ((process_t*)taskToRun->process)->pageDirPtr;
        isrSavedEIP = (uint32_t)&_sigJumpPoint;
        //Got rid of the removing of signals.  This is because if a process doesn't have a SIGING signal handler 
        //  then nothing will be executed when the process starts, to the signal needs to be maintained until 
        //  the process' timeslice ends. (see signal code in runAnotherTask)
    }
    nextScheduleTicks=*kTicksSinceStart+TICKS_PER_SCHEDULER_RUN;
    return;
}



void checkForKilledTasks()
{
    process_t* process;
    task_t* taskList;

    printd(DEBUG_SCHEDULER,"checkForKilledTasks: Start\n");

    taskList=kTaskList;
    do
    {
        process = taskList->process;
        if (process->signals.sigind & SIGKILL == SIGKILL && !taskList->exited)
        {
            printd(DEBUG_SCHEDULER,"\tcheckForKilledTasks: Found task 0x%04x with the SIGKILL signal.  Killing\n", taskList->taskNum);
            changeTaskQueue(taskList,TASK_ZOMBIE);
            markTaskEndedByTask(taskList, 0xffffffff, false);
        }
        taskList++;
    }  while (taskList->next!=(task_t*)NO_NEXT && taskList->taskNum!=0);
    printd(DEBUG_SCHEDULER,"checkForKilledTasks: End\n");
}

void scheduler()
{
    uint64_t ticksBefore=rdtsc();
    printd(DEBUG_SCHEDULER,"\n****************************** SCHEDULER *******************************\n");
    signalCheckEnabled = false;
    //NOTE: When this method is entered, it is time to reschedule.  The check for whether it is time is in kIRQ0_handler()
    checkForKilledTasks();
    runAnotherTask(true);
    kSchedulerCallCount++;
    signalCheckEnabled = true;
    uint64_t ticksAfter=rdtsc();
    
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_SCHEDULER,"*Scheduler: calls=%u, task switchs=%u, ticks since start=0x%08x\n",kSchedulerCallCount, kTaskSwitchCount,*kTicksSinceStart);
    uint32_t diff = ticksAfter-ticksBefore;
__asm__("clts\n");  //TODO: Hackish but have to clear the task switched flag BEFORE using the FPU
    uint32_t timeInScheduler = (diff/kCPUCyclesPerSecond)*100;
    printd(DEBUG_SCHEDULER,"%u ticks expired (%u CPU cycles)\n",timeInScheduler, diff);
    printd(DEBUG_SCHEDULER,"**************************************************************************\n");
#endif
}

int32_t getExitCode(uint32_t taskNum)
{
    uintptr_t* q=qZombie;
    task_t* task;
    process_t* process;
    
    printd(DEBUG_SCHEDULER,"getExitCode: Looking through ZOMBIE queue for exit code for task 0x%04x\n", taskNum);


    while (*q!=NO_NEXT)
    {
        task=(task_t*)*q;
        task_t *taskList=kTaskList;
        if (task->taskNum!=0)
        {
            printd(DEBUG_SCHEDULER,"getExitCode: Found task 0x%04x\n", task->taskNum);
            if (task->taskNum == taskNum)
            {
                disableScheduler();
                uint32_t retVal = ((process_t*)task->process)->retVal;
                removeFromQ(qZombie,task,true);
                freeProcess(task->process);
                freeTask(taskNum);
                printd(DEBUG_SCHEDULER,"\tgetExitCode: Looking for task in kTaskList\n");
                do
                {
                    if (taskList->taskNum==taskNum)
                    {
                        printd(DEBUG_SCHEDULER,"\tgetExitCode: Removing task from kTaskList\n");
                        memset(taskList,0,sizeof(task_t));
                        break;
                    }
                    taskList++;
                } 
                while (taskList->next!=NO_NEXT);
                enableScheduler();
                return retVal;
            }
        }
        q++;
    }
    printd(DEBUG_SCHEDULER,"getExitCode: Didn't find the task we were looking for\n", task->taskNum);
    return 0;
}
