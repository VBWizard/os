/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "schedule.h"
#include "strings.h"
#include "filesystem/pipe.h"
#include "thesignals.h"

#define SCHEDULER_DEBUG 1
#define MAX_TASKS 1000

extern uint32_t* kTicksSinceStart;
extern bool schedulerTaskSwitched;
extern task_t* kKernelTask;
extern task_t* kIdleTask;
extern sGDT* bootGdt;
extern bool signalCheckEnabled;

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
    pagingMapPageCount(KERNEL_CR3, schedStack, schedStack, 0x16000/PAGE_SIZE, 0x7, true);
    NO_PREV = 0xFFFFFFFF;
    NO_NEXT = 0xFFFFFFFF;
    kTaskList=kMalloc(1000*sizeof(task_t));
    memset(kTaskList,0,1000*sizeof(task_t));
    printd(DEBUG_PROCESS,"\tInitialized kTaskList @ 0x%08x, sizeof(task_t)=0x%02X\n",kTaskList,sizeof(task_t));
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

    printd(DEBUG_PROCESS | DEBUG_DETAILED,"\tfindTaskByCR3: Finding task with CR3=0x%08x\n",cr3);
    taskList=kTaskList;
    do
    {
        if ((uint32_t)taskList->pageDir==cr3)
            break;
        taskList++;
    } while (taskList->next!=NO_NEXT);

    if (taskList->taskNum==0x0 || (uint32_t)taskList->pageDir!=cr3)
    {
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"\tfindTaskByCR3: Could not find task with CR3=0x%08x\n",cr3);
        return NULL;
    }
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"\tfindTaskByCR3: Found task 0x%04X @ 0x%08x\n", taskList->taskNum, taskList);
    return taskList;
}

//Find a task by only task number when we don't know which list it is in
task_t* findTaskByTaskNum(uint32_t taskNum)
{
    task_t* taskList;
    printd(DEBUG_TASK | DEBUG_DETAILED,"\tfindTaskByNum: Finding task 0x%04X\n",taskNum);
    taskList=kTaskList;
    do
    {
        if (taskList->taskNum==taskNum)
            break;
        taskList++;
    } while (taskList->next!=NO_NEXT);

    if (taskList->taskNum==0x0)
    {
        printd(DEBUG_TASK | DEBUG_DETAILED,"\tfindTaskByTaskNum: Could not find task with TaskNum=0x%08x\n",taskNum);
        return NULL;
    }

    printd(DEBUG_TASK | DEBUG_DETAILED,"\tfindTaskByNum: Found task @ 0x%08x\n",taskList);
    return taskList;
}

void markTaskEnded(uint32_t cr3, uint32_t retval)
{
    int listNum=0;
    task_t* taskList=findTaskByCR3(cr3);

    ((process_t*)taskList->process)->retVal=retval;
    if ((uint32_t)taskList->pageDir!=cr3)
        panic("markTaskEnded: Could not find task for CR3=0x%08x to end\n",cr3);
    taskList->exited=true;
    //If the task being ended is running, trigger a schedule on the next tick to get rid of it
    printd(DEBUG_PROCESS,"\tmarkTaskEnded: Marked task 0x%04X ended w/ retval=0x%08x, triggered scheduler\n",taskList->taskNum,retval);
    //****DESTROY STUFF HERE****
    //When a task is ended, the scheduler will deal with it on the next tick, so lets wait for that to happen
    triggerScheduler();
    __asm__("sysCallIdleLoop: sti\nhlt\njmp sysCallIdleLoop\n");

}

void storeISRSavedRegs(task_t* task)
{
    if (((process_t*)task->process)->execDontSaveRegisters)
    {
        printd(DEBUG_PROCESS, "* ***Process %u exec'd, not saving registers***\n", task->taskNum);
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
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"*\tSave (or not): ");
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"CR3=0x%08x,",task->tss->CR3);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"CS=0x%04X,",task->tss->CS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EIP=0x%08x,",task->tss->EIP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"SS=0x%04X,",task->tss->SS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"DS=0x%04X,",task->tss->DS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EAX=0x%08x,",task->tss->EAX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EBX=0x%08x,",task->tss->EBX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ECX=0x%08x,",task->tss->ECX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EDX=0x%08x,",task->tss->EDX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ESI=0x%08x,",task->tss->ESI);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EDI=0x%08x,",task->tss->EDI);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ESP=0x%08x,",task->tss->ESP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EBP=0x%08x,",task->tss->EBP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"FLAGS=0x%08x\n",task->tss->EFLAGS);
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
        printd(DEBUG_PROCESS,"loadISRSavedRegs: Fork return for newly spawned child\n");
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
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"*\tLoad: ");
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"CR3=0x%08x,",isrSavedCR3);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"CS=0x%04X,",isrSavedCS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EIP=0x%08x,",isrSavedEIP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"SS=0x%04X,",isrSavedSS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"DS=0x%04X,",isrSavedDS);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EAX=0x%08x,",isrSavedEAX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"DBX=0x%08x,",isrSavedEBX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ECX=0x%08x,",isrSavedECX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EDX=0x%08x,",isrSavedEDX);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ESI=0x%08x,",isrSavedESI);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EDI=0x%08x,",isrSavedEDI);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"ESP=0x%08x,",isrSavedESP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"EBP=0x%08x,",isrSavedEBP);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"FLAGS=0x%08x\n",isrSavedFlags);
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
        int slotNum = 0;
	while (list!=(task_t*)NO_NEXT && list->taskNum!=0)
	{
		list++;
                slotNum++;
	}
	if (list==(task_t*)NO_NEXT)
            panic("No free task slots to assign to new task.  Increase scheduler MAX_TASKS to fix this\n");
        printd(DEBUG_PROCESS, "findOpenTaskSlot: Found process at slot # %u\n", slotNum);
	return list;
}
void addToQ(uintptr_t* queue, task_t* taskPtr);

task_t* submitNewTask(task_t *task)
{
	uint32_t prev=0, next=0;
	task_t *slot=findOpenTaskSlot();
	printd(DEBUG_PROCESS,"\taddTaskToTaskList: Found open slot @ 0x%08x\n",slot);
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
            printd(DEBUG_PROCESS,"*\t(%u) Task 0x%04X (%s-%u[%s]), priority=%u, old ticks=%u, new ticks=%u (ticks RUNNING=%u)\n",
                    queEntryNum,
                    task->taskNum, process->exename,
                    process->childNumber,
                    process->parent->exename,
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

void removeFromQ(uintptr_t* queue, task_t* taskPtr)
{
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_PROCESS,"*\t\tremoveFromQ: Removing task 0x%04X (0x%08x) from queue %s\n",
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
        panic("changeTaskQueue: Invalid queue oldQ=0x%08x, state=%s",oldQ,TASK_STATE_NAMES[task->taskState]);
    if (newQ==NULL)
        panic("changeTaskQueue: Invalid queue newQ=0x%08x, state=%s",newQ,TASK_STATE_NAMES[newState]);
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
    printd(DEBUG_PROCESS,"triggerScheduler: triggering scheduler\n");
     nextScheduleTicks=*kTicksSinceStart+1; //delay schedule by 1 tick to get the caller a chance to STI
}

void enableScheduler()
{
    schedulerEnabled = true;
}

void disableScheduler()
{
    schedulerEnabled = false;
}

void checkUSleepTasks(task_t* taskToStop, uint32_t retVal)
{
    uintptr_t* q=qUSleep;
    task_t* task;
    process_t* process;
    printd(DEBUG_PROCESS,"checkUSleepTasks: Looking through USLEEP queue for tasks to wake up\n");
    while (*q!=NULL)
    {
        task=(task_t*)*q;
        if (task->taskNum!=0)
        {
            process=task->process;
            printd(DEBUG_PROCESS, "\tTask 0x%04X: Waiting for task 0x%04X\n",task->taskNum, process->signals.sigdata[SIGUSLEEP]);
            if (process->signals.sigdata[SIGUSLEEP]==taskToStop->taskNum)
            {
                printd(DEBUG_PROCESS,"\tFound process 0x%04X in usleep queue waiting for process 0x%04X, moving to Runnable queue\n",task->taskNum,taskToStop->taskNum);
                process->signals.sigdata[SIGUSLEEP]=0;
                process->signals.sigind &=~SIGUSLEEP;
                printd(DEBUG_PROCESS,"\tProcess 0x%04X, sigind=0x%08x\n",task->taskNum,process->signals.sigind);
                changeTaskQueue(task,TASK_RUNNABLE);
            }
        }
        q++;
    }
    printd(DEBUG_PROCESS, "checkUSleepTasks: Done!\n");
}

void runAnotherTask(bool schedulerRequested)
{
    uint32_t oldCR3;
    eTaskState taskToStopNewQueue=TASK_NONE, startQueue=TASK_NONE;
    __asm__("cli\nmov ebx,cr3\nmov cr3,%[cr3Val]\n"
            :"=b" (oldCR3):[cr3Val] "r" (KERNEL_CR3));
    printd(DEBUG_PROCESS,"\n****************************** SCHEDULER *******************************\n");
    //Get task to stop
    task_t* taskToStop=findRunningTask();
    if (taskToStop==NULL)
        panic("Can't find the running task in the running queue  ... unpossible!!!\n");

        process_t* pToStop = taskToStop->process;
    
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_PROCESS,"*Found task 0x%04X to take off CPU @0x%04X:0x%08x (exited=%u).\n",taskToStop->taskNum, taskToStop->tss->CS,taskToStop->tss->EIP,taskToStop->exited);
#endif
    if (taskToStop->exited)
    {
#ifdef SCHEDULER_DEBUG
        printd(DEBUG_PROCESS,"*Task (0x%04X) ended, removing it from %s list.\n",taskToStop->taskNum,TASK_STATE_NAMES[taskToStop->taskState]);
#endif
        taskToStopNewQueue=TASK_EXITED;
        gdtEntryOS(taskToStop->taskNum,0,0,0,0,false);
        //Look through the USleep looking for task that is waiting on this one to end
        checkUSleepTasks(taskToStop, ((process_t*)taskToStop->process)->retVal);
    }
    else if (pToStop->signals.sigind)
    {
#ifdef SCHEDULER_DEBUG
        printd(DEBUG_PROCESS,"*sys_sigaction: sigind=0x%08x\n",((process_t*)(taskToStop->process))->signals.sigind);
#endif
        if ((pToStop->signals.sigind & SIGUSLEEP) == SIGUSLEEP)
            taskToStopNewQueue=TASK_USLEEP;
        else if ((pToStop->signals.sigind & SIGSEGV) == SIGSEGV)
        {
            taskToStopNewQueue=TASK_EXITED;
            checkUSleepTasks(taskToStop, -1);
        }
        else if ((pToStop->signals.sigind & SIGSTOP) == SIGSTOP)
        {
            taskToStopNewQueue=TASK_STOPPED;
#ifdef SCHEDULER_DEBUG
            printd(DEBUG_PROCESS,"*SIG_STOP processed\n");
#endif
        }
        else if ((pToStop->signals.sigind & SIGSLEEP) == SIGSLEEP)
            taskToStopNewQueue=TASK_ISLEEP;
        else if ((pToStop->signals.sigind & SIGINT) == SIGINT)
        {
                //If no handler is installed, default action is to kill the process
                if (!pToStop->signals.sighandler[SIGINT])
                {
                    printd(DEBUG_PROCESS,"*Task 0x%04X: SIGINT received, no default handler  Executing default action (kill process).\n",taskToStop->taskNum);
                    taskToStopNewQueue=TASK_EXITED;
                    checkUSleepTasks(taskToStop, -1);
                }   
                else
                {
                    taskToStopNewQueue=TASK_RUNNABLE;
                }
        }
        else if ((pToStop->signals.sigind & SIGIO) == SIGIO)
        {
            taskToStopNewQueue=TASK_RUNNABLE;
            printd(DEBUG_PROCESS,"*Task 0x%04X: SIGIO received, no default handler  Executing default action (nothing).\n",taskToStop->taskNum);
        }
        else
        {
            panic("scheduler: Unhandled signal");
        }
    }
    else
    {
        taskToStopNewQueue=TASK_RUNNABLE;
        printd(DEBUG_PROCESS, "No signals (sigind=%08X)\n",pToStop->signals.sigind);
    }

    //Get task to start
    storeISRSavedRegs(taskToStop);              //we're taking it off the cpu so save the registers
    changeTaskQueue(taskToStop,taskToStopNewQueue);
    printd(DEBUG_PROCESS,"*Finding task to run\n");
    task_t* taskToRun=findTaskToRun();

    if (taskToRun == 0)
        panic("findTaskToRun returned no task, unpossible!!!\n");
    
    if (taskToRun!=NULL && taskToRun->taskNum==taskToStop->taskNum)
    {
        printd(DEBUG_PROCESS,"*No new task to run, continuing with the current task\n");
        if (((process_t*)taskToStop)->execDontSaveRegisters)
        {
            printd(DEBUG_PROCESS,"Task to keep running was just exec'd, loading registers from tss\n");
            loadISRSavedRegs(taskToStop);
            ((process_t*)taskToStop)->execDontSaveRegisters = false;
        }
        changeTaskQueue(taskToStop,TASK_RUNNING);   //switch it back to the running queue
        printd(DEBUG_PROCESS,"CS: 0x%08x, EIP: 0x%08x, DS: 0x%08x\n",isrSavedCS, isrSavedEIP, isrSavedDS);
    }

    if (taskToRun!=NULL && taskToRun->taskNum!=taskToStop->taskNum)
    {
        process_t *process = taskToRun->process;
        printd(DEBUG_PROCESS,"*Found task 0x%04X move to CPU\n",taskToRun->taskNum);
        changeTaskQueue(taskToRun,TASK_RUNNING);
        loadISRSavedRegs(taskToRun);
        if (!(strcmp(process->path,"/sbin/idle")==0))
        {
            activeSTDOUT = ((process_t *)taskToRun->process)->stdout;
            activeSTDIN = ((process_t *)taskToRun->process)->stdin;
            activeSTDIN->owner = taskToRun->process;
            activeSTDOUT->owner = taskToRun->process;
            activeSTDERR = ((process_t *)taskToRun->process)->stderr;
            activeSTDERR->owner = taskToRun->process;
        }
        printd(DEBUG_PROCESS,"Active STDIN = 0x%08X\n",activeSTDIN);
        //Move the new task onto the CPU
#ifdef SCHEDULER_DEBUG
        printd(DEBUG_PROCESS,"*Restarting CPU with new process (0x%04X) @ 0x%04X:0x%08x\n",taskToRun->taskNum,taskToRun->tss->CS,taskToRun->tss->EIP);
#endif

        printd(DEBUG_PROCESS,"*Total running ticks: 0x%04X: %u, 0x%04X: %u\n",
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
        printd(DEBUG_PROCESS,"*SET nextTaskTSS to 0x%04X\n",nextTaskTSS);
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

    if (((process_t*)taskToRun->process)->signals.sigind & SIGINT)
    {
        sigProcAddress = (uint32_t)((process_t*)taskToRun->process)->signals.sighandler[SIGINT];
        sigProcCR3 = ((process_t*)taskToRun->process)->pageDirPtr;
        isrSavedEIP = (uint32_t)&_sigJumpPoint;
        ((process_t*)taskToRun->process)->signals.sigind &= ~SIGINT;
    }
    nextScheduleTicks=*kTicksSinceStart+TICKS_PER_SCHEDULER_RUN;
    return;
}

void scheduler()
{
    uint64_t ticksBefore=rdtsc();
    signalCheckEnabled = false;
    //NOTE: When this method is entered, it is time to reschedule.  The check for whether it is time is in kIRQ0_handler()
    runAnotherTask(true);
    kSchedulerCallCount++;
    signalCheckEnabled = true;
    uint64_t ticksAfter=rdtsc();
    
#ifdef SCHEDULER_DEBUG
    printd(DEBUG_PROCESS,"*Scheduler: calls=%u, task switchs=%u, ticks=0x%08x\n",kSchedulerCallCount, kTaskSwitchCount,*kTicksSinceStart);
    uint32_t diff = ticksAfter-ticksBefore;
__asm__("clts\n");  //TODO: Hackish but have to clear the task switched flag BEFORE using the FPU
    uint32_t timeInScheduler = (diff/kCPUCyclesPerSecond)*100;
    printd(DEBUG_PROCESS,"%u MS expired (%u CPU cycles)\n",timeInScheduler, diff);
    printd(DEBUG_PROCESS,"**************************************************************************\n");
#endif
}

int32_t getExitCode(uint32_t taskNum)
{
    uintptr_t* q=qExited;
    task_t* task;
    process_t* process;
    
    printd(DEBUG_PROCESS,"getExitCode: Looking through EXITED queue for exit code for task 0x%04X\n", taskNum);

    while (*q!=NULL)
    {
        task=(task_t*)*q;
        if (task->taskNum!=0)
        {
            //printd(DEBUG_PROCESS,"getExitCode: Found task 0x%04X\n", task->taskNum);
            if (task->taskNum == taskNum)
            {
                uint32_t retVal = ((process_t*)task->process)->retVal;
                freeTask(taskNum);
                return retVal;
            }
        }
        q++;
    }
    printd(DEBUG_PROCESS,"getExitCode: Didn't find the task we were looking for\n", task->taskNum);
    return 0;
}
