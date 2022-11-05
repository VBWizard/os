/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "alloc.h"
#include "printf.h"
#include "task.h"
#include "process.h"

extern sMemInfo* heapMemoryInfo;
extern uint32_t *kTicksSinceStart;
extern task_t *kTaskList;

void sys_dump()
{
    task_t *taskList=kTaskList;
    process_t *proc;
    sMemInfo* mInfo=heapMemoryInfo;

    printd(DEBUG_EXCEPTIONS,"*kTicksSinceStart=%u\n",*kTicksSinceStart);
    printd(DEBUG_EXCEPTIONS,"Minfo\t\tPAdd\t\tSize\t\tUsed\tCR3\t\tPID\tUses\tLAT\n");
    while (1==1)
    {
        printd(DEBUG_EXCEPTIONS,"0x%08x\t0x%08x\t%u\t\t%u\t0x%08x\t0x%04x\t%u\t%u\n",mInfo, mInfo->address, mInfo->size, mInfo->inUse, mInfo->cr3, mInfo->pid, mInfo->useCount, mInfo->lastAllocTicks);
        mInfo=mInfo->next;
        if (mInfo->next)
            mInfo==mInfo->next;
        else
            break;
    }
    
    printd(DEBUG_EXCEPTIONS,"Tasks\n");
    printd(DEBUG_EXCEPTIONS,"Name\tNum\tCNum\tPName\tPNum\tcwd\tSt\n");
    do
    {
        if (taskList->taskNum!=0)
        {
            proc=taskList->process;
            printd(DEBUG_EXCEPTIONS,"%s\t%i\t%i\t%s\t%i\t%s\t%i\n",
                    proc->exename,
                    taskList->taskNum,
                    proc->childNumber,
                    proc->parent?proc->parent->exename:"",
                    proc->parent?proc->parent->task->taskNum:0,
                    proc->cwd,
                    taskList->taskState
                    );
        }
        if (taskList->next!=NO_NEXT)
            taskList++;
    }
    while (taskList->next!=(task_t*)NO_NEXT);
    
}