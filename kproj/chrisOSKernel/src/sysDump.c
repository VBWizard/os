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
    
    do
    {
        proc=taskList->process;
        printd("",
                taskList->taskNum,
                proc->childNumber,
                proc->exename,
                proc->cwd,
                taskList->taskState
                );
        if (taskList->next!=NO_NEXT)
            taskList=taskList->next;
    }
    while (taskList->next!=NO_NEXT);
    
}