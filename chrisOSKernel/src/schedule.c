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
void* NO_TASK=(void*)0xFFFFFFFF;

#define TICKS_PER_SCHEDULE TICKS_PER_SECOND * 1
uint32_t nextScheduleTicks;

const char* TASK_STATE_NAMES[] = {"Zombie","Stopped","Running","Runnable","Uninterruptable Sleep","Interruptable Sleep"};
extern bool schedulerTaskSwitched;

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

    kTaskList0->prev=NO_TASK;

    kTaskList1->prev=NO_TASK;

    kTaskList2->prev=NO_TASK;

    kTaskList3->prev=NO_TASK;

    kTaskList4->prev=NO_TASK;

    kTaskList5->prev=NO_TASK;

    kTaskList[0]=kTaskList0;
    kTaskList[1]=kTaskList1;
    kTaskList[2]=kTaskList2;
    kTaskList[3]=kTaskList3;
    kTaskList[4]=kTaskList4;
    kTaskList[5]=kTaskList5;
}


void copyTaskInternals(task_t* srcTask,task_t* destTask)
{
    srcTask->next=destTask->next;
    srcTask->prev=destTask->prev;
    memcpy(destTask,srcTask,sizeof(task_t));                               
}

void setTaskNextAndPrev(task_t* task)
{
    task_t* prev;
    task_t* next;

    if (task->prev!=NO_TASK)
    {
        prev=((task_t*)task->prev);
        if (!prev->taskNum && prev->taskNum!=(int)NO_TASK) //If it isn't really a task (i.e.)
            prev=task+1;                    //Go to the next task in the list following the one we just created
        prev->next=task;                    //Set the prev of the found slot
        task->prev=prev;
    }
    
    if (task->next!=NO_TASK)
    {
        next=((task_t*)task->next);         //Get the next task in the chain
        if (!next->taskNum && next->taskNum!=(int)NO_TASK) //If it isn't really a task (i.e.)
            next=task+1;                    //Go to the next task in the list following the one we just created
        next->prev=task;                    //Set the prev of the found slot
        task->next=next;
    }

}

//Submit a new task, which will put it in the TASK_RUNNABLE list
//Copy the task into 
void submitNewTask(task_t* task)
{
    
    task_t* destTaskList=kTaskList[TASK_RUNNABLE];

    task->taskState=TASK_RUNNABLE;
    
    while (destTaskList->taskNum && destTaskList->taskNum!=(int)NO_TASK)    //Find an empty task in the list
    {
        destTaskList=destTaskList->next;                                        //Move to the next task in the list
    }    
    
    if (destTaskList->taskNum==(int)NO_TASK)
            panic("submitNewTask: Cannot find a task slot in TASK_RUNNABLE to place the new task\n");
    
    copyTaskInternals(task,destTaskList);                                   //Found one, copy our task to it
    //free(task);
    setTaskNextAndPrev(destTaskList);
    printd(DEBUG_PROCESS,"Added task 0x%04X to runnable list\n",task->taskNum);
}
task_t* changeTaskState(task_t* task, eTaskState newState)
{
    task_t* destTaskList=kTaskList[newState],
            *srcTaskList=kTaskList[task->taskState];
    
    //Find an open task in the new task state's list
    while (destTaskList->next) {destTaskList++;} //Find the end of the list
    if (destTaskList->next)
        panic("changeTaskState: Could not find a free slot in list %s\n",TASK_STATE_NAMES[newState]);
    
    //Find the task passed in
    while (srcTaskList->next && srcTaskList->taskNum!=task->taskNum) {srcTaskList++;}
    if (srcTaskList->taskNum!=task->taskNum)
        panic("changeTaskState: Could not find task 0x%04X\n",task->taskNum);
    
    //Move the task into place
    copyTaskInternals(task,destTaskList);
    setTaskNextAndPrev(destTaskList);

    //Remove from source list
    srcTaskList->prev=srcTaskList->next;
    srcTaskList->taskNum=0;
    srcTaskList->taskState=TASK_NONE;

    //Change the task's status
    destTaskList->taskState=newState;
    
    //Clear the ticks since last interrupted
    if (newState >= TASK_STOPPED)
    {
        destTaskList->ticksSinceLastInterrupted=0;
    }
    return destTaskList;
}

task_t* findRunningTaskToReplace()
{
    int32_t mostTicks=0;
    task_t* targetTask={0};
    task_t* currTask=kTaskList[TASK_RUNNING];
    do
    {
        if (!currTask->taskNum) //No running tasks, so bail
            break;
        if (currTask->ticksSinceLastInterrupted>mostTicks)
        {
            mostTicks=currTask->ticksSinceLastInterrupted;
            targetTask=currTask;
            currTask++;
        }
    }  while (currTask->next);
    
    if (targetTask->taskNum==0)
    {
        printd(DEBUG_PROCESS,"findRunningTaskToReplace: Could not find a RUNNING task\n");
        return NULL;   //Return null pointer
    }
    return targetTask;
}

void storeISRSavedRegs(task_t* task)
{
    task->tss->EAX=isrSavedEAX;
    task->tss->EBX=isrSavedEBX;
    task->tss->ECX=isrSavedECX;
    task->tss->EDX=isrSavedEDX;
    task->tss->ESI=isrSavedESI;
    task->tss->EDI=isrSavedEDI;
    task->tss->ESP=isrSavedESP;
    task->tss->EBP=isrSavedEBP;
    task->tss->EIP=isrSavedEIP;
    task->tss->EFLAGS=isrSavedFlags;
    task->tss->DS=isrSavedDS;
    task->tss->ES=isrSavedES;
    task->tss->FS=isrSavedFS;
    task->tss->GS=isrSavedGS;
    task->tss->SS=isrSavedSS;
    task->tss->CS=isrSavedCS;
    task->tss->CR3=isrSavedCR3;
    
}

void loadISRSavedRegs(task_t* task)
{
    isrSavedEAX=task->tss->EAX;
    isrSavedEBX=task->tss->EBX;
    isrSavedECX=task->tss->ECX;
    isrSavedEDX=task->tss->EDX;
    isrSavedESI=task->tss->ESI;
    isrSavedEDI=task->tss->EDI;
    isrSavedESP=task->tss->ESP;
    isrSavedEBP=task->tss->EBP;
    isrSavedEIP=task->tss->EIP;
    isrSavedFlags=task->tss->EFLAGS;
    isrSavedDS=task->tss->DS;
    isrSavedES=task->tss->ES;
    isrSavedFS=task->tss->FS;
    isrSavedGS=task->tss->GS;
    isrSavedSS=task->tss->SS;
    isrSavedCS=task->tss->CS;
    isrSavedCR3=task->tss->CR3;
}

void scheduler()
{
    int32_t mostIdleTicks=-1;
    task_t* targetTask = {0};
    task_t* oldTask = {0};
    task_t* currTask=kTaskList[TASK_RUNNABLE];
    
    if (*kTicksSinceStart<nextScheduleTicks)
        return;

    nextScheduleTicks=*kTicksSinceStart+TICKS_PER_SCHEDULE;
    
    printd(DEBUG_PROCESS,"Looking through TASK_RUNNABLE for a process to run @ 0x%08X ticks\n",*kTicksSinceStart);
    //Only scheduling on CPU 0 for now
    do      //Loop through "runnable" processes
    {
        if (!currTask->taskNum) //Not a task, so skip to the comparison at the end of the loop
        {
            if (currTask->taskNum==(int)NO_TASK)                    //This means we hit the end of the list
                break;
            currTask=currTask->next;
            continue;
        }
        if (currTask->ticksSincePutInRunnable>mostIdleTicks)
        {
            mostIdleTicks=currTask->ticksSincePutInRunnable;
            targetTask=currTask;
        }
        currTask=currTask->next ;
    } while (currTask->next);
    
    if (targetTask->taskNum && targetTask->taskNum!=currTask->taskNum) //If =0 then no runnable tasks, so do not switch tasks
    {
        printd(DEBUG_PROCESS,"Found one (0x%04X), moving it to the CPU\n",targetTask->taskNum);
        
        oldTask=findRunningTaskToReplace();
        if (oldTask!=NULL)                                             //There might not be a prior task if this is the first time through the routine
        {
            //save old task's state
            changeTaskState(oldTask,TASK_RUNNABLE);                     //This will move the old task to the runnable list
            storeISRSavedRegs(currTask);
        }
        //Move the new task onto the CPU
        targetTask=changeTaskState(targetTask,TASK_RUNNING);
        loadISRSavedRegs(targetTask);
        printd(DEBUG_PROCESS,"Restarting CPU with new process (0x%04X)\n",targetTask->taskNum);
        schedulerTaskSwitched=true;
        //For each task in the runnable list, increment its ticksSinceLastInterrupted 
    }
    else
        printd(DEBUG_PROCESS,"No new process to run, continuing with the current one\n");
}
