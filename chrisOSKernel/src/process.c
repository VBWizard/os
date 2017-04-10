/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "../../chrisOS/include/chrisos.h"
#include <stdbool.h>
#include "task.h"
#include "process.h"
#include "alloc.h"
#include "printf.h"
#include "kmalloc.h"
#include "sysloader.h"
#include "strings.h"
#include "paging.h"

extern time_t kSystemCurrentTime;
extern task_t* submitNewTask(task_t *task);
extern uint64_t kIdleTicks;

void processWrapup();
bool taskRegInitialized=false;

//This runs in user space.  We're just calling cleanup procedures and passing on the return value.
void processExit()
{
    uint32_t lRetVal=0;
    __asm__("mov %0,eax\n":"=r" (lRetVal));
    int lCounter;
    process_t* process=(process_t*)PROCESS_STRUCT_VADDR;
    printd(DEBUG_PROCESS,"processExit: Checking for exit handlers\n");
    for (lCounter=0;lCounter<PROCESS_MAX_EXIT_HANDLERS;lCounter++)
        if (process->exitHandler[lCounter]!=NULL)
        {
            exitHandler* x=process->exitHandler[lCounter];
            printd(DEBUG_PROCESS,"processExit: Executing exitHandler %u @ 0x%08X\n",lCounter,process->exitHandler[lCounter]);
            x();
        }
    gmtime_r((time_t*)&kSystemCurrentTime,&process->endTime);

     __asm__("mov ecx,cs\ncall sysEnter_Vector\n"::"a" (0x1), "b" (lRetVal));
    //Free memory allocated to the process
     
     //freeMemory(process);
}

bool processRegExit(process_t* process, void* routineAddr)
{
    for (int cnt=0;cnt<PROCESS_MAX_EXIT_HANDLERS;cnt++)
        if (process->exitHandler[cnt]==NULL)
        {
            process->exitHandler[cnt]=routineAddr;
            printd(DEBUG_PROCESS,"processRegExit: Registered exitHandler %u @ 0x%08X\n",cnt,process->exitHandler[cnt]);
            return true;
        }
    return false;
}

int sys_setpriority(process_t* process, int newpriority)
{
    int retVal=process->priority;
    process->priority=newpriority;
    return retVal;
}

void processCopyArgV(char** dest, char** src, uint32_t dVirt, int pcount)
{
    for (int cnt=0;cnt<pcount;cnt++)
    {
        //Make the dest pointer [cnt] point to the same offset within the page as the source [cnt]
        dest[cnt]=(char*)(((uintptr_t)dest & 0xFFFFF000) | ((uintptr_t)src[cnt] & 0x00000FFF));
        memcpy(dest[cnt],src[cnt],50);
        dest[cnt]=(char*)((dVirt & 0xFFFFF000) | ((uint32_t)dest[cnt] & 0x00000FFF));
    }
}

void processIdleLoop()
{
    uint32_t cr3=0;
    
    __asm__("mov eax,cr3\n":"=a" (cr3));
    process_t* process=findTaskByCR3(cr3)->process;
    sys_setpriority(process,20);
    while (1==1)
    {
        kIdleTicks++;
        __asm__("sti;hlt;");
    }   
}

process_t* createProcess(char* path, int argc, uint32_t argv, process_t* parentProcessPtr, bool isKernelProcess)
{

    process_t* process;

    printd(DEBUG_PROCESS,"Creating %s process for %s\n",isKernelProcess?"kernel":"user",path);
    //NOTE: Using allocPages instead of malloc because we need the process struct to start on a page boundary for paging reasons, and
    //      allocPages always allocates entire pages
    printd(DEBUG_PROCESS,"createProcess: Mallocing process_t\n");
    process=allocPagesAndMap(sizeof(process_t));
    printd(DEBUG_PROCESS,"createProcess: Malloc'd 0x%08X for process\n",process);
    memset(process,0,sizeof(process_t));
    process->heapStart=PROCESS_HEAP_START;
    process->heapEnd=PROCESS_HEAP_START;
    process->path=(char*)kMalloc(0x1000);
    printd(DEBUG_PROCESS,"createProcess: Malloc'd 0x%08X for process->path\n",process->path);
    strcpy(process->path,path);
    printd(DEBUG_PROCESS,"process->path (0x%08X)=%s\n",process->path,process->path);
    process->elf=NULL;
    gmtime_r((time_t*)&kSystemCurrentTime,&process->startTime);
    
    process->parent=parentProcessPtr;
    if (process->parent!=NULL)
    {
        process->kernelProcess=((process_t*)process->parent)->kernelProcess;
//        process->stdin=((process_t*)parentProcessPtr)->stdin;
//        process->stdin=((process_t*)parentProcessPtr)->stdout;
//        process->stdin=((process_t*)parentProcessPtr)->stderr;
    }
    else
    {
        process->kernelProcess=isKernelProcess;
//        process->stdin=((process_t*)parentProcessPtr)->stdin=STDIN_FILE;
//        process->stdin=((process_t*)parentProcessPtr)->stdout=STDOUT_FILE;
//        process->stdin=((process_t*)parentProcessPtr)->stderr=STDERR_FILE;
    }  
    process->task=createTask(isKernelProcess);

    
    process->argv=argv;
    uint32_t argvVirt=0x6f000000;
    if (process->parent!=NULL)
    {
        //Map the parent's heap into our paging table
        pagingMapProcessPageIntoKernel(((process_t*)process->parent)->pageDirPtr,argv,0x7);
        //Create and populate a page with the parameters, replacing old pointers with new ones which are virtualized to our address space
        process->argv=(uintptr_t)allocPages(50*argc);
        pagingMapPageCount(process->task->tss->CR3,argvVirt,process->argv,((50*argc)/PAGE_SIZE)+1,0x7);
        pagingMapPageCount(KERNEL_CR3,process->argv,process->argv,((50*argc)/PAGE_SIZE)+1,0x7);
        processCopyArgV((char**)process->argv,(char**)argv,argvVirt,argc);
    }
    else
    {
        argv=0;
        argc=0;
    }
    process->task->process=process;
    process->processSyscallESP=process->task->tss->ESP1;
    process->pageDirPtr=process->task->tss->CR3;
    process->priority=PROCESS_DEFAULT_PRIORITY;
    printd(DEBUG_PROCESS,"Mapping the process struct into the process, v=0x%08X, p=0x%08X\n",PROCESS_STRUCT_VADDR,process);
    pagingMapPage(process->task->tss->CR3,PROCESS_STRUCT_VADDR, (uint32_t)process & 0xFFFFF000,0x7); //FIX ME!!!  Had to change this for sys_sigaction2 USLEEP

    //Take care of the special "idle" task 
    if (strncmp(process->path,"/sbin/idle",50)!=0)
    {
        process->elf=sysLoadElf(process->path,process->elf,process->task->tss->CR3);
        if (!process->elf->loadCompleted)
        {
            return NULL;
        }
        process->task->tss->EIP=process->elf->hdr.e_entry;
    }
    else    //Configure the idle process
    {
        process->task->tss->EIP=&processIdleLoop;
    }

    //printk("ESP-20=0x%08X, &schedulerEnabled=0x%08X",process->task->tss->ESP+20,&schedulerEnabled);
    void* var=&processExit;
    memcpy((void*)process->task->tss->ESP,&process->task->tss->EIP,8);
    memcpy((void*)process->task->tss->ESP+4,&process->task->tss->CS,8);
    memcpy((void*)process->task->tss->ESP+8,&process->task->tss->EFLAGS,8);
    uint32_t tempESP=process->task->tss->ESP-0x100;
    memcpy((void*)process->task->tss->ESP+12,&tempESP,8);
    memcpy((void*)process->task->tss->ESP+16,&process->task->tss->SS,8);
    
    //Per the above, the stack will start at -0x100 from where we write the CS/EIP/FLAGS/SS/ESP, so put our params around there
    memcpy((void*)process->task->tss->ESP-0x104,process,4);
    memcpy((void*)process->task->tss->ESP-0x100,&var,4);
    memcpy((void*)process->task->tss->ESP-0xfc,&argc,4);
    memcpy((void*)process->task->tss->ESP-0xf8,&argvVirt,4);
    //Set the return point since the task will simply ret to exit
    printd(DEBUG_PROCESS,"Return point for process is 0x%08X\n",&processExit);
    printd(DEBUG_PROCESS,"Created Process @ 0x%08X\n",process);
 
    uint32_t tssFlags=ACS_TSS;
    uint32_t gdtFlags=GDT_PRESENT | GDT_CODE;
    if (process->task->kernel)
    {
        gdtFlags |= GDT_DPL0;
        tssFlags |= ACS_DPL_0;
    }
    else
    {
        gdtFlags |= GDT_DPL0;
        tssFlags |= ACS_DPL_0;
    }
    gdtEntryOS(process->task->taskNum,(uint32_t)process->task->tss,sizeof(tss_t), tssFlags ,GDT_GRANULAR | GDT_32BIT,true);
    process->task=submitNewTask(process->task);
    printd(DEBUG_PROCESS,"Submitted process 0x%04X to be run\n",process->task->taskNum);
    return process;
}

void processWrapup()
{
    __asm__("mov ebx,eax\nmov eax,0x1\nmov ecx,cs\ncall sysEnter_Vector\n");
 }