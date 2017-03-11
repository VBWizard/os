/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "schedule.h"
#include "kernelVariables.h"
static task_t *kTaskList0;
static task_t *kTaskList1;
static task_t *kTaskList2;
static task_t *kTaskList3;
static task_t *kTaskList4;
static task_t *kTaskList5;
static task_t *kTaskList[6];

extern uint32_t* kTicksSinceStart;
uint32_t kTaskSwitchCount;
uint32_t NO_TASK=0xFFFFFFFF;
void* NO_PREV=(void*)0xFFFFFFFF, *NO_NEXT=(void*)0xFFFFFFFF;

uint32_t nextScheduleTicks;

const char* TASK_STATE_NAMES[] = {"Zombie","Running","Runnable","Stopped","Uninterruptable Sleep","Interruptable Sleep","Exited","None"};
extern bool schedulerTaskSwitched;
extern task_t* kKernelTask;

task_t* submitNewTask(task_t* task);
task_t* changeTaskState(task_t* task, eTaskState newState);
task_t* findRunningTaskToReplace();
task_t* findFirstActiveTaskInList(eTaskState state);
task_t* findFirstActiveTaskInListL(task_t* taskList);
void setTaskNextAndPrev(task_t* task);
void removeTaskFromList(task_t* taskList);

const char* taskListName(task_t* list)
{
    if (list>=kTaskList[0] && list<kTaskList[1])
        return TASK_STATE_NAMES[0];
    else if (list>=kTaskList[1] && list<kTaskList[2])
        return TASK_STATE_NAMES[1];
    else if (list>=kTaskList[2] && list<kTaskList[3])
        return TASK_STATE_NAMES[2];
    else if (list>=kTaskList[3] && list<kTaskList[4])
        return TASK_STATE_NAMES[3];
    else if (list>=kTaskList[4] && list<kTaskList[5])
        return TASK_STATE_NAMES[4];
    else if (list>=kTaskList[5] && list<kTaskList[6])
        return TASK_STATE_NAMES[5];
    else return TASK_STATE_NAMES[7];
}

void initSched()
{
    nextScheduleTicks=*kTicksSinceStart+TICKS_PER_SCHEDULE;
    //Malloc zeroes out memory, so no need to initialize each list
    kTaskList0=malloc(TSS_TABLE_RECORD_COUNT*sizeof(task_t));
    kTaskList1=malloc(TSS_TABLE_RECORD_COUNT*sizeof(task_t));
    kTaskList2=malloc(TSS_TABLE_RECORD_COUNT*sizeof(task_t));
    kTaskList3=malloc(TSS_TABLE_RECORD_COUNT*sizeof(task_t));
    kTaskList4=malloc(TSS_TABLE_RECORD_COUNT*sizeof(task_t));
    kTaskList5=malloc(TSS_TABLE_RECORD_COUNT*sizeof(task_t));

    kTaskList0->prev=NO_PREV;
    ((task_t*)kTaskList0+(TSS_TABLE_RECORD_COUNT-1))->next=NO_NEXT;      //-1 because our array is 0 based
    kTaskList1->prev=NO_PREV;
    ((task_t*)kTaskList1+(TSS_TABLE_RECORD_COUNT-1))->next=NO_NEXT;
    kTaskList2->prev=NO_PREV;
    ((task_t*)kTaskList2+(TSS_TABLE_RECORD_COUNT-1))->next=NO_NEXT;
    kTaskList3->prev=NO_PREV;
    ((task_t*)kTaskList3+(TSS_TABLE_RECORD_COUNT-1))->next=NO_NEXT;
    kTaskList4->prev=NO_PREV;
    ((task_t*)kTaskList4+(TSS_TABLE_RECORD_COUNT-1))->next=NO_NEXT;
    kTaskList5->prev=NO_PREV;
    ((task_t*)kTaskList5+(TSS_TABLE_RECORD_COUNT-1))->next=NO_NEXT;
    kTaskList[0]=kTaskList0;
    kTaskList[1]=kTaskList1;
    kTaskList[2]=kTaskList2;
    kTaskList[3]=kTaskList3;
    kTaskList[4]=kTaskList4;
    kTaskList[5]=kTaskList5;
    
    //Put the current (kernel) task in the running queue, as it IS running!
    kTaskSwitchCount=0;
    kKernelTask=submitNewTask(kKernelTask);
    kKernelTask=changeTaskState(kKernelTask,TASK_RUNNING);
}

//Find a task when we know what list it is in
task_t* findTaskInList(task_t* taskList, uint32_t taskNum)
{
/*    printd(DEBUG_PROCESS | DEBUG_DETAILED,"findTaskinList: Finding 0x%04X in list %s (%u)",taskNum, taskListName(taskList),taskList->taskState);
    taskList=findFirstActiveTaskInListL(taskList);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,", starting at 0x%08X\n",taskList);
    if (taskList==NULL)
        panic("findTaskinList: Couldn't find the first task in the list.");
    while (taskList->next!=NO_NEXT)
    {
        if (taskList->taskNum>0)
            printd(DEBUG_PROCESS | DEBUG_DETAILED,"Comparing task 0x%04X to our task (0x%04X)\n",taskList->taskNum,taskNum);
        if (taskList->taskNum==taskNum)
        {
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"findTaskinList: Found task 0x%04X @ 0x%08X\n",taskNum,taskList);
            return taskList;
        }
        if (taskList->next==0)
            break;
        taskList=taskList->next;
    }
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"findTaskinList: Didn't find task, returning NULL\n\n",taskNum,taskList);
    return NULL;
*/
    task_t* task=taskList;
    while (task->prev!=NO_PREV)
        task--;
    while (task->next != NO_NEXT)
    {
        if (task->taskNum==taskNum)
            return task;
        task++;
    }
    panic("couldn't find taks in the list");
}

void removeTaskFromList(task_t* taskList)
{
    task_t* prev=NULL, *next=NULL;
    
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"removeTaskFromList: Removing task @ 0x%08X\n",taskList);
    //PAUSEHERE
    //NOTE: Don't update the first (NO_PREV) or last (NO_NEXT) list items
    if (taskList->prev!=0 && taskList->prev!=NO_PREV)
        prev=taskList->prev;
    if (taskList->next!=0 && taskList->next!=NO_NEXT)
        next=taskList->next;
    
    if (prev!=NULL)
    {
        if (next!=NULL)
            prev->next=next;
        else
            prev->next=0;
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"removeTaskFromList: Set previous task (0x%08X)->next to 0x%08X\n",prev,next);
    }
    
    if (next!=NULL)
    {
        if (prev!=NULL)
            next->prev=prev;
        else
            next->prev=0;
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"removeTaskFromList: Set next task (0x%08X)->prev to 0x%08X\n",next,prev);
    }
    //PAUSEHERE
    memset(taskList,0,sizeof(task_t));
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"removeTaskFromList: Zeroed out memory of the task @ 0x%08X\n\n",taskList);
}

//Set up the new task in the Destination list, and clears the Source list entry
void moveTask(task_t* destTask, task_t* srcTask, eTaskState state)
{
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"moveTask: Moving task 0x%04X from %s(0x%08X) to %s(0x%08X)\n",
            srcTask->taskNum,
            taskListName(srcTask),srcTask,
            taskListName(destTask),destTask);
    memcpy(destTask,srcTask,sizeof(task_t));    
    destTask->taskState=state;
    setTaskNextAndPrev(destTask);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"moveTask: Set moved task's prev and next to 0x%08X and 0x%08X\n\n",destTask->prev,destTask->next);
    removeTaskFromList(srcTask);
    //PAUSEHERE
}

task_t* findFirstSlotInList(task_t* taskList)
{
    while (taskList->prev != NO_PREV)
        taskList--;
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"findFirstSlotInList: Found the first slot in the list @ 0x%08X\n\n",taskList);
    return taskList;
}

void setTaskNextAndPrev(task_t* task)
{
    //PAUSEHERE
    //task_t* taskList=findFirstActiveTaskInListL(task);
//    if (taskList==NULL)   //No first task found, so our entry is the first one in the list so link it to NO_PREV
//    {
//        taskList=kTaskList[task->taskState];
//        if (taskList->prev!=NO_PREV)
//            panic("OOPS2!");
//    }
    
    //Find the entry in the list which has a taskNum and no ->next value
    //PAUSEHERE
    task->next=task->prev=0;

    task_t* taskList=kTaskList[task->taskState];
    
//    printd(DEBUG_PROCESS | DEBUG_DETAILED,"setTaskNextAndPrev: Setting for task 0x%04X in the %s list, looking for the right task\n",task->taskNum,taskListName(task));
    while (taskList->next!=NO_NEXT)
    {
        if (taskList->taskNum)
            if (taskList->next==0)
                if (taskList->taskNum!=task->taskNum)
                    break;
        taskList++;
    }
    
//    printd(DEBUG_PROCESS | DEBUG_DETAILED,"setTaskNextAndPrev: Found task 0x%04X to be updated\n",task->taskNum);
    
    //Note: if ->prev==NO_PREV we still want to link the current task to it
    if ((taskList->next!=0 || taskList->taskNum==0) && taskList->prev!=NO_PREV)
        taskList=findFirstSlotInList(taskList);
//        panic("Could not find target task to update 'next' on");
    
    if (taskList->taskNum==task->taskNum)
    {
        taskList=findFirstSlotInList(taskList);
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"setTaskNextAndPrev: Found task was parameter task so I got the first task in list @ 0x%08X\n",taskList);
    }
    taskList->next=task;
    task->prev=taskList;
//    printd(DEBUG_PROCESS | DEBUG_DETAILED,"setTaskNextAndPrev: Task 0x%04X @ 0x%08X->next set to 0x%08X.  Task 0x%04X@ 0x%08X->prev set to 0x%08X\n\n",
//            taskList->taskNum,taskList,task,
//          task->taskNum,task,taskList);
}

task_t* findFreeTaskSlot(task_t* taskList)
{
    taskList++; //always skip the first task as we can't set its PREV (must always be NO_PREV)
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"findFreeTaskSlot: Skipped first entry, starting search @ 0x%08X\n",taskList);
    while (taskList->next!=NO_NEXT)    //Find an empty task in the list
    {
        if (taskList->taskNum==0 && taskList->prev==0 && taskList->next==0)
            break;
        taskList++;
    }
    if (taskList->taskNum!=0)
        panic("Cannot find a free task in list %u\n");
    else if (taskList->next==NO_NEXT)
        panic("All slots are in use, cannot find a free one");
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"findFreeTaskSlot: Found slot at 0x%08X\n\n",taskList);
    return taskList;                                                    //NOTE: May return NO_TASK slot
}

//Submit a new task, which will put it in the TASK_RUNNABLE list
//Copy the task into 
task_t* submitNewTask(task_t* task)
{
    printd(DEBUG_PROCESS,"***Submitting new task %u***\n");
    task_t* destTaskList;

    destTaskList=findFreeTaskSlot(kTaskList[TASK_RUNNABLE]);

    moveTask(destTaskList,task,TASK_RUNNABLE);                                   //Found one, copy our task to it

    destTaskList->taskState=TASK_RUNNABLE;
    //free(task);

    printd(DEBUG_PROCESS,"submitNewTask: Added task 0x%04X to runnable list at slot %u\n\n",
            destTaskList->taskNum,
            (destTaskList-kTaskList[TASK_RUNNABLE])/sizeof(task_t));
    return destTaskList;
}


task_t* changeTaskState(task_t* taskToStateChange, eTaskState newState)
{
    task_t* destTaskList,
            *srcTaskList=kTaskList[taskToStateChange->taskState];
    
    if (newState==TASK_EXITED)
    {}
    else
        destTaskList=kTaskList[newState];
            
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"Changing task state for task 0x%04X, from %s to %s\n",taskToStateChange->taskNum,taskListName(taskToStateChange),TASK_STATE_NAMES[newState]);

    //Find the source task
    srcTaskList=findTaskInList(srcTaskList,taskToStateChange->taskNum);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"changeTaskState: Found source task @ 0x%08X (state=%u)\n",srcTaskList,srcTaskList->taskState);
    if (srcTaskList==NULL)
        panic("changeTaskState: Could not find task 0x%04X to change the state of in its old list\n",taskToStateChange->taskNum);

    //Find an open task in the new task state's list
    if (newState!=TASK_EXITED)
        destTaskList=findFreeTaskSlot(destTaskList);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"changeTaskState: free slot found in list @ 0x%08X\n",destTaskList);

    //Move the task into place
    if (newState!=TASK_EXITED)
    {
        moveTask(destTaskList,srcTaskList,TASK_RUNNING);
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"changeTaskState: Task moved from 0x%08X to 0x%08X (new prev=0x%08X, next=0x%08X)\n",srcTaskList,destTaskList,destTaskList->prev,destTaskList->prev);
    }
    if (newState==TASK_EXITED)
        return NULL;
    //Change the task's status
    destTaskList->taskState=newState;
    
    //Clear the ticks since last interrupted
    switch (newState)
    {
        case TASK_STOPPED:
            destTaskList->ticksSinceLastInterrupted=0;
            break;
        case TASK_RUNNABLE:
            destTaskList->ticksSincePutInRunnable=0;
            break;
        default:
            break;
    }
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"changeTaskState: Changed task state for 0x%04X to %s",TASK_STATE_NAMES[newState]);
    return destTaskList;
}

//Find a task by only task number when we don't know which list it is in
task_t* findTaskByTaskNum(uint32_t taskNum,int *listNum)
{
    task_t* taskList;
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"findTaskByNum: Finding task 0x%04X\n",taskNum);
    for (int cnt=0;cnt<6;cnt++)
    {
        *listNum=cnt;
        taskList=kTaskList[cnt];
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"findTaskByNum: Searching list %u starting at 0x%08X\n",cnt,taskList);
        do
        {
            if (taskList->taskNum==taskNum)
                break;
            taskList=taskList->next;
        } while (taskList->next && taskList->next!=NO_NEXT);
        
        if (taskList->taskNum==taskNum)
            break;
    }
        
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"findTaskByNum: Found task @ 0x%08X\n",taskList);
    return taskList;
}

void markTaskEnded(uint32_t taskNum)
{
    int listNum=0;
    taskNum >>=3;   //taskNum=Task Register task number, so shift it right to get our task #
    task_t* taskList=findTaskByTaskNum(taskNum,&listNum);

    if (taskList->taskNum!=taskNum)
        printd("endTaskByTaskNum: Could not find task 0x%04X to end\n");
    else
    {
        taskList->exited=true;
        //If the task being ended is running, trigger a schedule on the next tick to get rid of it
        if (listNum==TASK_RUNNING)
            nextScheduleTicks=*kTicksSinceStart;
    }
}

task_t* findRunningTaskToReplace()
{
    int32_t mostTicks=-1;
    task_t* targetTask={0};
    task_t* currTask=kTaskList[TASK_RUNNING];

    currTask=findFirstActiveTaskInListL(currTask);
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"findTaskToReplace: Finding task starting at 0x%08X\n",currTask);

    while (currTask->next != NO_NEXT)
    {
        if (currTask->taskNum && currTask->ticksSinceLastInterrupted>mostTicks)
        {
            mostTicks=currTask->ticksSinceLastInterrupted;
            targetTask=currTask;
        }
        if (currTask->next==0)
            break;
        currTask=currTask->next;
    }
    
    if (!targetTask->taskNum)
    {
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"findRunningTaskToReplace: Could not find a RUNNING task\n");
        return NULL;   //Return null pointer
    }
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"findTaskToReplace: Found task @ 0x%08X\n",targetTask);
    return targetTask;
}

void storeISRSavedRegs(task_t* task)
{
    printd(DEBUG_DETAILED,"Save: ");
    task->tss->CS=isrSavedCS;
    printd(DEBUG_DETAILED,"CS=0x%04X,",task->tss->CS);
    task->tss->EIP=isrSavedEIP;
    printd(DEBUG_DETAILED,"EIP=0x%08X,",task->tss->EIP);
    task->tss->SS=isrSavedSS;
    printd(DEBUG_DETAILED,"SS=0x%08X,",task->tss->SS);
    task->tss->DS=isrSavedDS;
    printd(DEBUG_DETAILED,"DS=0x%08X,",task->tss->DS);
    task->tss->EAX=isrSavedEAX;
    printd(DEBUG_DETAILED,"EAX=0x%08X,",task->tss->EAX);
    task->tss->EBX=isrSavedEBX;
    printd(DEBUG_DETAILED,"DBX=0x%08X,",task->tss->EBX);
    task->tss->ECX=isrSavedECX;
    printd(DEBUG_DETAILED,"ECX=0x%08X,",task->tss->ECX);
    task->tss->EDX=isrSavedEDX;
    printd(DEBUG_DETAILED,"EDX=0x%08X,",task->tss->EDX);
    task->tss->ESI=isrSavedESI;
    printd(DEBUG_DETAILED,"ESI=0x%08X,",task->tss->ESI);
    task->tss->EDI=isrSavedEDI;
    printd(DEBUG_DETAILED,"EDI=0x%08X,",task->tss->EDI);
    task->tss->ESP=isrSavedESP;
    printd(DEBUG_DETAILED,"ESP=0x%08X,",task->tss->ESP);
    task->tss->EBP=isrSavedEBP;
    printd(DEBUG_DETAILED,"EBP=0x%08X,",task->tss->EBP);
    task->tss->EFLAGS=isrSavedFlags;
    printd(DEBUG_DETAILED,"FLAGS=0x%08X\n",task->tss->EFLAGS);
    task->tss->ES=isrSavedES;
    task->tss->FS=isrSavedFS;
    task->tss->GS=isrSavedGS;
}

void loadISRSavedRegs(task_t* task)
{
    printd(DEBUG_DETAILED,"Load: ");


    isrSavedCS=task->tss->CS;
    printd(DEBUG_DETAILED,"CS=0x%04X,",task->tss->CS);
    isrSavedEIP=task->tss->EIP;
    printd(DEBUG_DETAILED,"EIP=0x%08X,",task->tss->EIP);
    isrSavedSS=task->tss->SS;
    printd(DEBUG_DETAILED,"SS=0x%08X,",task->tss->SS);
    isrSavedDS=task->tss->DS;
    printd(DEBUG_DETAILED,"DS=0x%08X,",task->tss->DS);
    isrSavedEAX=task->tss->EAX;
    printd(DEBUG_DETAILED,"EAX=0x%08X,",task->tss->EAX);
    isrSavedEBX=task->tss->EBX;
    printd(DEBUG_DETAILED,"EBX=0x%08X,",task->tss->EBX);
    isrSavedECX=task->tss->ECX;
    printd(DEBUG_DETAILED,"ECX=0x%08X,",task->tss->ECX);
    isrSavedEDX=task->tss->EDX;
    printd(DEBUG_DETAILED,"EDX=0x%08X,",task->tss->EDX);
    isrSavedESI=task->tss->ESI;
    printd(DEBUG_DETAILED,"ESI=0x%08X,",task->tss->ESI);
    isrSavedEDI=task->tss->EDI;
    printd(DEBUG_DETAILED,"EDI=0x%08X,",task->tss->EDI);
    isrSavedESP=task->tss->ESP;
    printd(DEBUG_DETAILED,"ESP=0x%08X,",task->tss->ESP);
    isrSavedEBP=task->tss->EBP;
    printd(DEBUG_DETAILED,"EBP=0x%08X,",task->tss->EBP);
    isrSavedFlags=task->tss->EFLAGS;
    printd(DEBUG_DETAILED,"FLAGS=0x%08X,",task->tss->EFLAGS);
    isrSavedES=task->tss->ES;
    isrSavedFS=task->tss->FS;
    isrSavedGS=task->tss->GS;
    isrSavedCR3=task->tss->CR3;
    printd(DEBUG_DETAILED,"CR3=0x%08X\n",task->tss->CR3);
}

task_t* findFirstActiveTaskInListL(task_t* taskList)
{
    //First find the beginning of the list.  it will be the entry after the one where PREV=NO_PREV
    //PAUSEHERE
    while (taskList->prev!=NO_PREV)
        taskList--;
    
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"findFirstActiveTaskInListL: Finding task starting at 0x%08X\n",taskList);
        
    while (taskList->next!=NO_NEXT)
    {
        task_t* prev=taskList->prev;
        if ( taskList->taskNum && (taskList->prev==0 || prev->prev==NO_PREV))
            break;
        taskList++;
    }

    //If we don't have a task now, bail
    if (taskList->taskNum==0)
    {
        printd(DEBUG_PROCESS | DEBUG_DETAILED,"findFirstActiveTaskInListL: Couldn't find an active task in the list, returning NULL\n",taskList);
        return NULL;
    }
    
    printd(DEBUG_PROCESS | DEBUG_DETAILED,"findFirstActiveTaskInListL: Found task 0x%04X @ 0x%08X, returning it.\n",taskList->taskNum,taskList);
    return taskList;
}

//Find the first task in a given list where the taskNum is not NULL
task_t* findFirstActiveTaskInList(eTaskState state)
{
    task_t* taskList=kTaskList[state];

    return findFirstActiveTaskInListL(taskList);
}

void scheduler()
{
    int32_t mostIdleTicks=-1;
    task_t* taskToRun = {0};
    task_t* taskToStop = {0};
    task_t* tempTask=kTaskList[TASK_RUNNABLE];
    uint32_t oldCR3;
    if (*kTicksSinceStart<nextScheduleTicks)
        return;
    nextScheduleTicks=*kTicksSinceStart+TICKS_PER_SCHEDULE;

    __asm__("cli\nmov ebx,cr3\nmov cr3,%[cr3Val]\n"
            :"=b" (oldCR3):[cr3Val] "r" (KERNEL_CR3));
    printd(DEBUG_PROCESS,"\n****************************** TASK SWITCH ******************************\n");
    printd(DEBUG_PROCESS,"*Looking through TASK_RUNNABLE for a process to run @ 0x%08X ticks\n",*kTicksSinceStart);
    //Only scheduling on CPU 0 for now
    tempTask=findFirstActiveTaskInList(TASK_RUNNABLE);
    if (tempTask!=NULL)
        while (tempTask->taskNum!=0)                                //Loop through "runnable" processes
        {
            //Using fairness doctrine
            if (tempTask->ticksSincePutInRunnable>mostIdleTicks)
            {
                mostIdleTicks=tempTask->ticksSincePutInRunnable;
                taskToRun=tempTask;
            }
            if (tempTask->next==NO_NEXT || tempTask->next==0)        //Before we go to next, check it
                break;
            tempTask=tempTask->next;
        }
    
    if (taskToRun->taskNum) //If =0 then no runnable tasks, so do not switch tasks
    {
        printd(DEBUG_PROCESS,"*Found one (0x%04X)!\n",taskToRun->taskNum);
        
        taskToStop=findRunningTaskToReplace();
        if (taskToStop!=NULL)                                             //There might not be a prior task if this is the first time through the routine
        {
            printd(DEBUG_PROCESS,"*Found process (0x%04X) to replace @0x%04X:0x%08X (exited=%u).\n",taskToStop->taskNum, taskToStop->tss->CS,taskToStop->tss->EIP,taskToStop->exited);
            //save old task's state
            if (taskToStop->exited)
            {
            printd(DEBUG_PROCESS,"*Task (0x%04X) stopped, removing it.\n",taskToStop->taskNum, taskToStop->tss->CS,taskToStop->tss->EIP,taskToStop->exited);
                taskToStop=changeTaskState(taskToStop,TASK_EXITED);
            }
            else
            {
                taskToStop=changeTaskState(taskToStop,TASK_RUNNABLE);                     //This will move the old task to the runnable list
                storeISRSavedRegs(taskToStop);
            }
        }
        else if (taskToStop==NULL)
            panic("scheduler: Could not find the task that is running on the CPU in the running list\n");
        else if (taskToStop->taskNum==taskToRun->taskNum)
            panic("scheduler: Trying to replace running task (0x04X) with the same task from the runnable queue!\n");
        //Move the new task onto the CPU
        taskToRun=changeTaskState(taskToRun,TASK_RUNNING);
        loadISRSavedRegs(taskToRun);
        printd(DEBUG_PROCESS,"*Restarting CPU with new process (0x%04X) @ 0x%04X:0x%08X",taskToRun->taskNum,taskToRun->tss->CS,taskToRun->tss->EIP);
        schedulerTaskSwitched=true;
//        kTaskSwitchCount++;
        //For each task in the runnable list, increment its ticksSinceLastInterrupted 
    }
    else
    {
        __asm__("cli\nmov cr3,%[cr3Val]"::[cr3Val] "r" (oldCR3));
        printd(DEBUG_PROCESS,"*No new process to run, continuing with the current process");
    }
    printd(DEBUG_PROCESS,"(Task switch count=%u)\n",kTaskSwitchCount);
    return;
}
