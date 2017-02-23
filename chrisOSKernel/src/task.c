#include <stdint.h>
#include <stdbool.h>
#include "chrisos.h"
#include "i386/bits/bits.h"
#include "../include/tss.h"
#include "../../chrisOSKernel/include/task.h"
#include "../../chrisOSKernel/include/alloc.h"
#include "i386/kPaging.h"

extern uint32_t* kTaskSlotAvailableInd;
extern tss_t* kTSSTable;
extern task_t* kTaskTable;
extern uint32_t kDebugLevel;
extern void pagingMapPage(uintptr_t pageDirAddress, uintptr_t virtualAddress, uintptr_t physicalAddress, uint8_t flags);

void taskInit()
{
    for (int cnt=0;cnt<TSS_TABLE_RECORD_COUNT/8;cnt++)
    {
        kTaskSlotAvailableInd[cnt]=0xFFFFFFFF;
    }
}

///Find an open TSS slot and mark it in use
task_t* getTaskSlot()
{
   int cnt=1,slot=0; //The first slot will ALWAYS be blank, so start with slot 1
   uint32_t* ptr=kTaskSlotAvailableInd;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
    {
        printd (DEBUG_TASK,"getTask: Checking slots at 0x%08X, cnt=%u\n",ptr,cnt);
        slot=bitsScanF(ptr);
        if (slot>-1)
        {
            task_t* task=&kTaskTable[slot];
            printd(DEBUG_TASK,"getTaskSlot: Marking TSS %u used\n",slot);
            bitsReset(ptr,slot);
            task->tss=&kTSSTable[slot];
            if (slot>0)
            {
                (task-1)->next=task;
                task->prev=(task-1);
            }
            printd(DEBUG_TASK,"getTaskSlot: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
            return task;
        }
        ptr++;cnt++;
    }
    printk("tssUseAvailable: Cannot allocate TSS for new task");
    return NULL;
}

void mmMapKernelIntoTask(task_t* task)
{
    uint32_t oldDebugLevel=kDebugLevel;
    kDebugLevel &= (~DEBUG_PAGING);
    //Map lower memory to process for access to kernel variables & ISR code
    for (uint32_t cnt=0x0;cnt<0x01000000;cnt+=0x1000) 
        pagingMapPage(task->tss->CR3,cnt,cnt,0x5); //read access only
    printd(DEBUG_PAGING,"Mapping kernel pages 0x%08X-0x%08X into task via CR3 0x%08X\n",KERNEL_PAGED_BASE_ADDRESS,KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF);
    for (uint32_t cnt=0x0;cnt<0x0FFFFFFF;cnt+=0x1000)
    {
        pagingMapPage(task->tss->CR3,cnt | KERNEL_PAGED_BASE_ADDRESS,cnt,0x5); //read access only
    }
    kDebugLevel=oldDebugLevel;
}

task_t* createTask(bool kernelTSS)
{
    printd(DEBUG_TASK,"createTask: calling getTaskSlot\n");
    task_t* task=getTaskSlot();     //create task in the kTaskTable, also a tss in the same slot# in kTSSTable
    
    if (task==0)
        return NULL;
    
    //Configure the task registers
    task->tss->EAX=0;
    task->tss->EBX=task->tss->ECX=task->tss->EDX=task->tss->ESI=task->tss->EDI=task->tss->EBP=0;
    task->tss->SS0=0x10;
    if (kernelTSS)
        task->tss->SS=0x10;
    else
        task->tss->SS=0x43;
    task->tss->ESP0=0x1ffffff0;
    task->tss->ESP=0xFFFF00;
    task->tss->EFLAGS=0x200046;
    //If it is a kernel task
    task->kernel=kernelTSS;
    if (kernelTSS)
        task->tss->DS=task->tss->ES=task->tss->FS=task->tss->GS=0x108;
    else
        task->tss->DS=task->tss->ES=task->tss->FS=task->tss->GS=0x33;
    task->tss->IOPB=0x0;
    task->tss->CR3=(uint32_t)allocPagesAndMap(0x1000);
    task->pageDir=(uint32_t*)task->tss->CR3;
    printd(DEBUG_TASK,"Setting CR3 to malloc'd 1k task page directory @ 0x%08X\n",task->tss->CR3);
    printd(DEBUG_TASK,"createTask: createTask: Mapping kernel into task\n");
    mmMapKernelIntoTask(task);
    return task;
}

