/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "schedule.h"

task_t* kTaskList[6];

const char* TASK_STATE_NAMES[] = {"Zombie","Stopped","Running","Runnable","Uninterruptable Sleep","Interruptable Sleep"};

//Submit a new task, which will put it in the TASK_RUNNABLE list
void submitNewTask(task_t* task)
{
    task_t* destTaskList=kTaskList[TASK_RUNNABLE];
    
    while (destTaskList->next) {destTaskList++;} //Find the end of the list
    destTaskList->next=task;                //assign the incoming task to the end of the list
    task->prev=destTaskList;                //assign the old last task as previous task
}

void changeTaskState(task_t* task, eTaskState newState)
{
    task_t* destTaskList=kTaskList[newState],
            *srcTaskList=kTaskList[task->taskStatus];
    
    //Find an open task in the new task state's list
    while (destTaskList->next) {destTaskList++;} //Find the end of the list
    if (destTaskList->next)
        panic("schedAs: Could not find a free slot in list %s\n",TASK_STATE_NAMES[newState]);
    
    //Find the task passed in
    while (srcTaskList->next && srcTaskList->taskNum!=task->taskNum) {srcTaskList++;}
    if (srcTaskList->taskNum!=task->taskNum)
        panic("schedAs: Could not find task 0x%04X\n",task->taskNum);
    
    //Remove from source list
    srcTaskList->prev=srcTaskList->next;

    //Move the task
    //Add to the destination list
    destTaskList->next=task;                //assign the incoming task to the end of the list
    task->prev=destTaskList;                //assign the old last task as previous task

    //Change the task's status
    task->taskStatus=newState;
    
    if (newState >= TASK_STOPPED)
        task->ticksSinceLastInterrupted=0;
}

void initSched()
{
    //Malloc zeroes out memory, so no need to initialize each list
    for (int cnt=0;cnt<6;cnt++)
        kTaskList[cnt]=malloc(TSS_TABLE_RECORD_COUNT);
}

task_t* findRunningTaskToReplace()
{
    uint64_t mostTicks=0;
    task_t* targetTask;
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
    
    if (currTask->taskNum==0)
        panic("findRunningTaskToReplace: Could not find a RUNNING task\n");
}

void scheduler()
{
    uint64_t mostIdleTicks=0;
    task_t* targetTask;
    task_t* currTask=kTaskList[TASK_RUNNABLE];
    
    //Only scheduling on CPU 0 for now
    do
    {
        if (!currTask->taskNum) //No running tasks, so bail
            break;
        if (currTask->ticksSincePutInRunnable>mostIdleTicks)
        {
            mostIdleTicks=currTask->ticksSincePutInRunnable;
            targetTask=currTask;
        }
        if (currTask->taskNum) //If =0 then no runnable tasks, so do not switch tasks
        {
            changeTaskState(currTask,TASK_RUNNING);
            //Move the task onto the CPU
        }
    } while (currTask->next);
    
}
