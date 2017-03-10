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

const char* TASK_STATE_NAMES[] = {"Zombie","Stopped","Running","Runnable","Uninterruptable Sleep","Interruptable Sleep"};
extern bool schedulerTaskSwitched;
extern task_t* kKernelTask;

task_t* submitNewTask(task_t* task);
task_t* changeTaskState(task_t* task, eTaskState newState);
task_t* findRunningTaskToReplace();
task_t* findFirstTaskInList(eTaskState state);


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
    changeTaskState(kKernelTask,TASK_RUNNING);
}
//Set up the new task in the Destination list, and clears the Source list entry
void moveTask(task_t* destTask, task_t* srcTask)
{
    void* next=NULL, *prev=NULL;
    
    //If ->next denotes this is the last, keep track of that fact
    if (destTask->next==NO_NEXT)
        next=NO_NEXT;
    //If ->prev denotes this is the first, keep track of that fact
    if (destTask->prev==NO_PREV)
        prev=NO_PREV;
    memcpy(destTask,srcTask,sizeof(task_t));    
    destTask->next=next;                        //Will either = NULL (0) or NO_NEXT
    destTask->prev=prev;                        //Will either = NULL (0) or NO_PREV
}

void setTaskNextAndPrev(task_t* taskList,eTaskState state)
{
    //NOTE: Won't set next/prev for any task if we're the only task running
    task_t* taskToLinkTo=kTaskList[state];
    
    //Have to go forward through the list till we find a task with an empty prev
    while (taskList->prev!=0            //If it has a prev, there is a task in the slot
            && taskList->next!=NO_NEXT  //If next is NO_EXT we've reached the end of the list
            && taskList->next!=0        //If next is 0, we're at the last task in the linked list
            && taskList->taskNum!=taskToLinkTo->taskNum)    //We may run into our own task
    {taskToLinkTo=taskToLinkTo->next;}  
    if (taskList->taskNum==taskToLinkTo->taskNum)
        return;
    if (taskList->prev!=NO_PREV)
        taskList->prev=taskToLinkTo;
    if (taskList->next!=NO_NEXT)
        taskToLinkTo->next=taskList;

    
    /*NOTE: this function will not set a next/previous if the next/previous entry is the first/last in the list (those aren't used) */
}

task_t* findFreeTaskSlot(task_t* taskList)
{
    while ((taskList->taskNum)!=0 && taskList->next!=NO_NEXT)    //Find an empty task in the list
    {taskList++;}
    if (taskList->taskNum!=0)
        panic("Cannot find a free task in list %u\n");
    return taskList;                                                    //NOTE: May return NO_TASK slot
}
//Submit a new task, which will put it in the TASK_RUNNABLE list
//Copy the task into 
task_t* submitNewTask(task_t* task)
{
    task_t* destTaskList;

    destTaskList=findFreeTaskSlot(kTaskList[TASK_RUNNABLE]);

    moveTask(destTaskList,task);                                   //Found one, copy our task to it
    //free(task);

    destTaskList->taskState=TASK_RUNNABLE;

    setTaskNextAndPrev(destTaskList,destTaskList->taskState);
    return destTaskList;
    printd(DEBUG_PROCESS,"submitNewTask: Added task 0x%04X to runnable list at slot %u\n",destTaskList->taskNum,(destTaskList-kTaskList[TASK_RUNNABLE])/sizeof(task_t));
}
task_t* changeTaskState(task_t* taskToStateChange, eTaskState newState)
{
    task_t* destTaskList,
            *srcTaskList=kTaskList[taskToStateChange->taskState];
    
    if (newState==TASK_EXITED)
    {}
    else
        destTaskList=kTaskList[newState];
            
    //First find the head of the list
    srcTaskList=findFirstTaskInList(taskToStateChange->taskState);
    //Find the task passed in
    while (srcTaskList->next!=NO_NEXT && srcTaskList->taskNum!=taskToStateChange->taskNum) {srcTaskList=srcTaskList->next;}
    if (srcTaskList->taskNum!=taskToStateChange->taskNum)
    {
        panic("changeTaskState: Could not find task 0x%04X\n",taskToStateChange->taskNum);
    }
    
    //Find an open task in the new task state's list
    if (newState!=TASK_EXITED)
    {
        while (destTaskList->taskNum) {destTaskList++;} //Find the end of the destination list
            if (destTaskList->next)
                panic("changeTaskState: Could not find a free slot in list %s\n",TASK_STATE_NAMES[newState]);
    }
    
    //Remove from source list, relinking the prev to the next in both directions
    task_t* prev=NULL;
    task_t* next=NULL;
    if (srcTaskList->prev!=NO_PREV)                             //Make sure we aren't at the beginning of the list.  Don't want to set Prev if we are
        prev=(task_t*)srcTaskList->prev;                        //Make sure we aren't at the end of the list.  Don't want to set Prev if we are
    
    if (srcTaskList->next!=NO_NEXT)
        next=(task_t*)srcTaskList->next;
    
    if (next!=NULL && prev!=NULL)
    {
        next->prev=prev;     //Re-link the next task's prev to the previous task
        prev->next=next;     //Re-link the previous task's NEXT to the next task
    }
    if (next!=NULL && prev==NULL)
        next->prev=0;
    if (prev!=NULL && next==NULL)
        prev->next=0;
    //Move the task into place
    if (newState!=TASK_EXITED)
    {
        moveTask(destTaskList,srcTaskList);
        setTaskNextAndPrev(destTaskList,newState);
    }
    //Wipe out the memory from the source task list
    task_t tempTask = {0};                //Interesting side note, internally gcc uses memset when you init ={0}
    //NOTE: Use CopyTask with a "blank" task instead of just using memset to preserve next & last, incase its the first or last slot
    moveTask(srcTaskList,&tempTask);
    
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
    return destTaskList;
    STOPHERE2
}

task_t* findTaskByTaskNum(uint32_t taskNum,int *listNum)
{
    task_t* taskList;
    for (int cnt=0;cnt<6;cnt++)
    {
        *listNum=cnt;
        taskList=kTaskList[cnt];
        do
        {
            if (taskList->taskNum==taskNum)
                break;
            taskList=taskList->next;
        } while (taskList->next && taskList->next!=NO_NEXT);
        
        if (taskList->taskNum==taskNum)
            break;
    }
        
    return taskList;
}

void markTaskEnded(uint32_t taskNum)
{
    int listNum=0;
    task_t* taskList=findTaskByTaskNum(taskNum,&listNum);

    __asm__("cli;");
    if (taskList->taskNum!=taskNum)
        printd("endTaskByTaskNum: Could not find task 0x%04X to end\n");
    else
    {
        taskList->exited=true;
        //If the task being ended is running, trigger a schedule on the next tick to get rid of it
        if (listNum==TASK_RUNNING)
            nextScheduleTicks=*kTicksSinceStart;
    }
    __asm__("sti;");
}

task_t* findRunningTaskToReplace()
{
    int32_t mostTicks=-1;
    task_t* targetTask={0};
    task_t* currTask=kTaskList[TASK_RUNNING];
    do
    {
        if (currTask->taskNum==0) //No running tasks, so bail
            break;
        if (currTask->ticksSinceLastInterrupted>mostTicks)
        {
            mostTicks=currTask->ticksSinceLastInterrupted;
            targetTask=currTask;
        }
        currTask=currTask->next;
    }  while (currTask->next);
    
    if (!targetTask->taskNum)
    {
        printd(DEBUG_PROCESS,"findRunningTaskToReplace: Could not find a RUNNING task\n");
        return NULL;   //Return null pointer
    }
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
    task->tss->CR3=isrSavedCR3;
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
    printd(DEBUG_DETAILED,"FLAGS=0x%08X\n",task->tss->EFLAGS);
    isrSavedES=task->tss->ES;
    isrSavedFS=task->tss->FS;
    isrSavedGS=task->tss->GS;
    isrSavedCR3=task->tss->CR3;
}

task_t* findFirstTaskInList(eTaskState state)
{
    task_t* taskList=kTaskList[state];
    
    while (1==1)
    {
    //Find the first task in the chain.  It will have a taskNum > 0 and a prev of 0 
        if (taskList->taskNum>0 && taskList->prev==0)
            break;
        taskList++;
        if (taskList->next==NO_NEXT)
            break;
    }
    
    //If we didn't find a task, see if there is one in the first slot (NO_PREV)
    if (taskList->taskNum==0 || taskList->prev!=0)
        if (kTaskList[state]->taskNum>0)
            taskList=kTaskList[state];
    
    //If we don't have a task now, bail
    if (taskList->taskNum==0)
        return NULL;
    
    return taskList;
}

void scheduler()
{
    int32_t mostIdleTicks=-1;
    task_t* taskToRun = {0};
    task_t* taskToStop = {0};
    task_t* tempTask=kTaskList[TASK_RUNNABLE];
    if (*kTicksSinceStart<nextScheduleTicks)
        return;
    nextScheduleTicks=*kTicksSinceStart+TICKS_PER_SCHEDULE;

    __asm__("mov cr3,%[cr3Val]"::[cr3Val] "r" (KERNEL_CR3));
    printd(DEBUG_PROCESS,"\n****************************** TASK SWITCH ******************************\n");
    printd(DEBUG_PROCESS,"Looking through TASK_RUNNABLE for a process to run @ 0x%08X ticks\n",*kTicksSinceStart);
    //Only scheduling on CPU 0 for now
    tempTask=findFirstTaskInList(TASK_RUNNABLE);
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
        printd(DEBUG_PROCESS,"Found one (0x%04X)!\n",taskToRun->taskNum);
        
        taskToStop=findRunningTaskToReplace();
        if (taskToStop!=NULL)                                             //There might not be a prior task if this is the first time through the routine
        {
            printd(DEBUG_PROCESS,"Found process (0x%04X) to replace @0x%04X:0x%08X.\n",taskToStop->taskNum, taskToStop->tss->CS,taskToStop->tss->EIP);
            //save old task's state
            if (taskToStop->exited)
                taskToStop=changeTaskState(taskToStop,TASK_EXITED);
            else
                taskToStop=changeTaskState(taskToStop,TASK_RUNNABLE);                     //This will move the old task to the runnable list
            storeISRSavedRegs(taskToStop);
        }
        else if (taskToStop==NULL)
            panic("scheduler: Could not find the task that is running on the CPU in the running list\n");
        else if (taskToStop->taskNum==taskToRun->taskNum)
            panic("scheduler: Trying to replace running task (0x04X) with the same task from the runnable queue!\n");
        //Move the new task onto the CPU
        taskToRun=changeTaskState(taskToRun,TASK_RUNNING);
        loadISRSavedRegs(taskToRun);
        printd(DEBUG_PROCESS,"Restarting CPU with new process (0x%04X) @ 0x%04X:0x%08X\n",taskToRun->taskNum,taskToRun->tss->CS,taskToRun->tss->EIP);
        schedulerTaskSwitched=true;
//        kTaskSwitchCount++;
        //For each task in the runnable list, increment its ticksSinceLastInterrupted 
    }
    else
        printd(DEBUG_PROCESS,"No new process to run, continuing with the current one\n");
        //if (oldTask->taskNum==0xa)
            //STOPHERE2;
    return;
}
