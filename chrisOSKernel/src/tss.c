#include <stdint.h>
#include <stdbool.h>
#include "chrisos.h"
#include "i386/bits/bits.h"
#include "../include/tss.h"
#include "../../chrisOSKernel/include/task.h"
#include "../../chrisOSKernel/include/alloc.h"

extern uint32_t* kTSSSlotAvailableInd;
extern tss_t* kTSSTable;
extern task_t* kTaskTable;
extern uint32_t kDebugLevel;

///Find an open TSS slot and mark it in use
task_t* getTask()
{
   int cnt=0,slot=0;
   uint32_t* ptr=kTSSSlotAvailableInd;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
    {
        printd (DEBUG_TASK,"Checking slots at 0x%08X, cnt=%u\n",ptr,cnt);
        slot=bitsScanF(ptr);
        if (slot>-1)
        {
            task_t* task=&kTaskTable[slot];
            printd(DEBUG_TASK,"TASK: Marking TSS %u used\n",slot);
            bitsReset(ptr,slot);
            task->tss=&kTSSTable[slot];
            if (slot>0)
            {
                //(task-1)->next=task;
                //task->prev=(task-1);
            }
            printd(DEBUG_TASK,"TASK: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
            return task;
        }
        ptr+=4;cnt++;
    }
    panic("tssUseAvailable: Cannot allocate TSS for new task");
    return NULL;
}

void mmMapKernelIntoTask(task_t* task)
{
    uint32_t debugVal=kDebugLevel;
    kDebugLevel=0;
    for (int cnt=KERNEL_PAGED_BASE_ADDRESS;cnt<KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF;cnt+=1000)
        pagingMapPage(task->tss->CR3,cnt,cnt,0x3);
    kDebugLevel=debugVal;
}

task_t* createTask(bool kernelTSS)
{
    task_t* task=getTask();
    
    
    task->tss->EAX=0;
    task->tss->EBX=task->tss->ECX=task->tss->EDX=task->tss->ESI=task->tss->EDI=task->tss->EBP=0;
    task->tss->SS0=0x10;
    if (kernelTSS)
        task->tss->ES=task->tss->DS=task->tss->FS=task->tss->GS=0x10;
    else
        panic("write non-kernel segment pop code");
    task->tss->IOPB=0xABCD;
    task->tss->CR3=(uint32_t)mallocA1k(0x1000,0x1000);
    printd(DEBUG_TASK,"Malloc'd 1k task page directory @ 0x%08X\n",task->tss->CR3);
    task->pageTable=(uint32_t*)task->tss->CR3;
    mmMapKernelIntoTask(task);
    return task;
}

