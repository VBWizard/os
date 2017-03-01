#include <stdint.h>
#include <stdbool.h>
#include "chrisos.h"
#include "i386/bits/bits.h"
#include "../include/tss.h"
#include "task.h"
#include "../../chrisOSKernel/include/alloc.h"
#include "i386/kPaging.h"
#include "paging.h"
#include "alloc.h"

extern uint32_t* kTaskSlotAvailableInd;
extern tss_t* kTSSTable;
extern task_t* kTaskTable;
extern uint32_t kDebugLevel;
extern void pagingMapPage(uintptr_t pageDirAddress, uintptr_t virtualAddress, uintptr_t physicalAddress, uint8_t flags);
extern void pagingMapPageIntoKernel(uintptr_t processCR3, uintptr_t virtualAddress, uint8_t flags);
extern char* kernelDataLoadAddress, *kernelLoadAddress, *kernelLoadEnd;
extern uint32_t getESP();

void taskInit()
{
    for (int cnt=0;cnt<TSS_TABLE_RECORD_COUNT/8;cnt++)
    {
        kTaskSlotAvailableInd[cnt]=0xFFFFFFFF;
    }
    for (int cnt=1;cnt<RESERVED_TASKS;cnt++)
        bitsReset(kTaskSlotAvailableInd, cnt);
    
    //There is padding at the end of the task table.  Make sure the padding is 0's so that we don's BSF past the end
    kTaskSlotAvailableInd[TSS_TABLE_RECORD_COUNT]=0x0;
}

///Find an open TSS slot and mark it in use
task_t* getAvailableTask()
{
   int cnt=1,slot=0; //The first slot will ALWAYS be blank, so start with slot 1
    uint32_t* ptr=kTaskSlotAvailableInd;
    ptr=(uint32_t*)(uint32_t)ptr+RESERVED_TASKS;    //don't touch the first 10 tasks, kernel is 0, other 9 undefined used internally
    slot=bitsScanF(ptr);
    if (slot>-1)
    {
        task_t* task=(task_t*)malloc(sizeof(task_t));//&kTaskTable[slot+RESERVED_TASKS];
        task->taskNum=slot+RESERVED_TASKS;
        printd(DEBUG_TASK,"getTaskSlot: Marking TSS %u used\n",slot);
        bitsReset(ptr,slot+RESERVED_TASKS);
        task->tss=allocPages(PAGE_SIZE); //&kTSSTable[slot];
        pagingMapPage(KERNEL_PAGE_DIR_ADDRESS,(uint32_t)task->tss | KERNEL_PAGED_BASE_ADDRESS,task->tss,0x3);
        (task-1)->next=task;
        task->prev=(task-1);
        printd(DEBUG_TASK,"getTaskSlot: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
        return task;
    }
        ptr++;cnt++;
    printk("tssUseAvailable: Cannot allocate TSS for new task");
    return NULL;
}

void mmMapKernelIntoTask(task_t* task)
{
    uint32_t oldDebugLevel=kDebugLevel;
    kDebugLevel &= (~DEBUG_PAGING);  //Temporarily turn off paging debug if it is on or this takes forever and produces copious output

    uint32_t kla=(uint32_t)&kernelLoadAddress;
    uint32_t kle1=(uint32_t)&kernelLoadEnd;
    uint32_t kdla=(uint32_t)&kernelDataLoadAddress;
    uint32_t kle=kla+(kle1-kla);

    //printd(DEBUG_TASK,"kla=0x%08X, kle=0x%08X, klda=0x%08X\n",kla,kle,kdla);

    //Map the kernel data into the user process (read/write - process memory space)
    //NOTE: This mapping is first because it is read/write so it will set up the PDE as read/write
    printd(DEBUG_TASK,"Map kernel data into user process: 0x%08X to 0x%08X\n",kdla,kdla+(0x1000*0x100));
    pagingMapPageCount(task->tss->CR3,kdla,kdla,0x100,0x7);
    //Map map kernel into the user process (read only - 0x0 memory space)
    printd(DEBUG_TASK,"Map K to U: p=0x%08X (v=0x%08X) to p=0x%08X (v=0x%08X)\n",kla,kla,kle,kle);
    pagingMapPageRange(task->tss->CR3,kla, kle, kla,0x7);

    //Map map kernel into the user process (read only - kernel memory space)
    printd(DEBUG_TASK,"Map K to U: p=0x%08X (v=0x%08X) to p=0x%08X (v=0x%08X)\n",kla | KERNEL_PAGED_BASE_ADDRESS,kla,kle | KERNEL_PAGED_BASE_ADDRESS,kle);
    pagingMapPageRange(task->tss->CR3,kla |  KERNEL_PAGED_BASE_ADDRESS, kle | KERNEL_PAGED_BASE_ADDRESS, kla,0x3);

    //Map map kernel into the user process (read only - process memory space)
    printd(DEBUG_TASK,"Map K to U: p=0x%08X (v=0x%08X) to p=0x%08X (v=0x%08X)\n",kla,kla|0xC0000000,kle,kle|0xC0000000);
    pagingMapPageRange(task->tss->CR3,kla, kle, kla,0x5);

    //Map our kernel stack into the user process ... FIXME: this is BAD***
    uint32_t kStack=getESP();
    pagingMapPageCount(task->tss->CR3,kStack-0x1000  | 0xC0000000,kStack-0x1000,3,0x7); //read/write
    
    //Map the kernel interrupt table into the process so that it can execute 0x80 to return to the kernel
    pagingMapPageCount(task->tss->CR3,IDT_TABLE_ADDRESS,IDT_TABLE_ADDRESS,10,0x7);
    
    //Map the first 0x100000 (minus 0x0) into the process, where the OS loader is, so that ISRs can run
    printd(DEBUG_TASK,"Map OS loader into user process: 0x%08X to 0x%08X r/o\n",0xC0001000,0x1000+(0x100*0x1000));
    pagingMapPageCount(task->tss->CR3,0x00001000,0x1000,0x100,0x5);
    kDebugLevel=oldDebugLevel;

    printd(DEBUG_TASK,"Map screen buffer into user process at 0xB8000\n");
    pagingMapPageCount(task->tss->CR3,0xB0000,0xB0000,4*0x1000,0x7);
}

task_t* createTask(bool kernelTSS)
{
    printd(DEBUG_TASK,"createTask: calling getTaskSlot\n");
    task_t* task=getAvailableTask();     //create task in the kTaskTable, also a tss in the same slot# in kTSSTable
    
    if (task==0)
        return NULL;
    
    //Configure the task registers
    printd(DEBUG_TASK,"createTask: Set task CR3 to 1k page directory @ 0x%08X\n",task->tss->CR3);
    task->tss->CR3=(uint32_t)pagingAllocatePagingTablePage();
    
    //Map the CR3 into our memory space for before the iRet
    pagingMapPage(KERNEL_PAGE_DIR_ADDRESS,task->tss->CR3 | KERNEL_PAGED_BASE_ADDRESS,task->tss->CR3,0x3);
    task->pageDir=(uint32_t*)task->tss->CR3;
    
    mmMapKernelIntoTask(task);
    
    //Map our CR3 into program's memory space, needed before the iRet
    printd(DEBUG_TASK,"Mapping our CR3 into program, v=0x%08X, p=0x%08X\n",KERNEL_PAGE_DIR_ADDRESS & ~KERNEL_PAGED_BASE_ADDRESS, KERNEL_PAGE_DIR_ADDRESS & ~KERNEL_PAGED_BASE_ADDRESS);
    pagingMapPageCount(task->tss->CR3,KERNEL_PAGE_DIR_ADDRESS & ~KERNEL_PAGED_BASE_ADDRESS, KERNEL_PAGE_DIR_ADDRESS & ~KERNEL_PAGED_BASE_ADDRESS,(0xFFFFFFFF/0x400000)+1,0x7);
    printd(DEBUG_TASK,"createTask: Mapping kernel into task\n");
    
    //Initialize task registers
    task->tss->EAX=0;
    task->tss->EBX=task->tss->ECX=task->tss->EDX=task->tss->ESI=task->tss->EDI=task->tss->EBP=0;
    task->tss->SS0=0x10;
    if (kernelTSS)
    {
        task->tss->SS=0x28;
        task->tss->DS=task->tss->ES=task->tss->FS=task->tss->GS=0x18;
        task->tss->CS=0x10<<3;
    }
    else
    {
        task->tss->SS=0x43;
        task->tss->DS=task->tss->ES=task->tss->FS=task->tss->GS=0x33;
        task->tss->CS=(0x7<<3)|3;
    }
    task->tss->ESP0=0x1ffffff0;
    //Allocate space for the stack
    task->tss->ESP=(uint32_t)allocPages(0x16000);
    pagingMapPageCount(task->tss->CR3,task->tss->ESP,task->tss->ESP,0x16,0x7);
    //Map the stack process into our address space so that we can use it after the iRet
    pagingMapPageCount(KERNEL_PAGE_DIR_ADDRESS,task->tss->ESP,task->tss->ESP,0x16,0x7);
    //Set the pointer so that we don't go off the pages
    task->tss->ESP+=0x15000;
    
    task->tss->EFLAGS=0x200046;
    task->tss->LINK=0x0; //need an old TSS entry (garbage) to "store" the old variables to on LTR
    //If it is a kernel task
    task->kernel=kernelTSS;
    task->tss->IOPB=sizeof(tss_t);
    return task;
}

