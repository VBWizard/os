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

void processWrapup();
bool taskRegInitialized=false;

void processExit()
{
    int lCounter;
    process_t* process=(process_t*)PROCESS_STRUCT_VADDR;
    printd(DEBUG_PROCESS,"processExit: Processing process 0x%08X\n",process);
    printd(DEBUG_PROCESS,"processExit: Checking for exit handlers\n");
    for (lCounter=0;lCounter<PROCESS_MAX_EXIT_HANDLERS;lCounter++)
        if (process->exitHandler[lCounter]!=NULL)
        {
            exitHandler* x=process->exitHandler[lCounter];
            printd(DEBUG_PROCESS,"processExit: Executing exitHandler %u @ 0x%08X\n",lCounter,process->exitHandler[lCounter]);
            x();
        }

     __asm__("mov ebx,eax\nmov eax,0x1\nmov ecx,cs\ncall sysEnter_Vector\n");
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

process_t* createProcess(char* path,int argc,uint32_t argv, bool kernelProcess)
{

    process_t* process;

    printd(DEBUG_PROCESS,"Creating %s process for %s\n",kernelProcess?"kernel":"user",path);
    //NOTE: Using allocPages instead of malloc because we need the process struct to start on a page boundary for paging reasons, and
    //      allocPages always allocates entire pages
    process=allocPagesAndMap(sizeof(process_t));
    memset(process,0,sizeof(process_t));
    process->heapStart=PROCESS_HEAP_START;
    process->heapEnd=PROCESS_HEAP_START;
    process->path=(char*)kMalloc(512);
    printd(DEBUG_PROCESS,"createProcess: Malloc'd 0x%08X for process->path\n",process->path);
    strcpy(process->path,path);
    printd(DEBUG_PROCESS,"createProcess: Copied path (0x%08X) to process->path (0x%08X)\n",path,process->path);
    printd(DEBUG_PROCESS,"process->path (0x%08X)=%s\n",process->path,process->path);
    process->elf=NULL;
    
    process->task=createTask(kernelProcess);
    process->task->process=process;
    process->processSyscallESP=process->task->tss->ESP1;
   
process->pageDirPtr=process->task->tss->CR3;
    
    printd(DEBUG_PROCESS,"Mapping the process struct into the process, v=0x%08X, p=0x%08X\n",PROCESS_STRUCT_VADDR,process);
    pagingMapPage(process->task->tss->CR3,PROCESS_STRUCT_VADDR, (uint32_t)process & 0xFFFFF000,0x5);

    //CR3 was set and PDir created by createTask.  Page tables will be created by the load process
    process->elf=sysLoadElf(process->path,process->elf,process->task->tss->CR3);
    if (!process->elf->loadCompleted)
    {
        printk("SysLoadElf error, failed to load program\n");
        return NULL;
    }
    process->task->tss->EIP=process->elf->hdr.e_entry;

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
    memcpy((void*)process->task->tss->ESP-0xf8,&argv,4);
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
        gdtFlags |= GDT_DPL3;
        tssFlags |= ACS_DPL_3;
    }
    gdtEntryOS(process->task->taskNum,(uint32_t)process->task->tss,sizeof(tss_t), tssFlags ,GDT_GRANULAR | GDT_32BIT,true);
    if (!taskRegInitialized)
    {
        __asm__("mov eax,%[taskTSS]\n"                                    //Load task register with user process TSS entry
                "ltr ax\n"
                ::[taskTSS] "r" (process->task->taskNum<<3));
        taskRegInitialized=true;
    }
    submitNewTask(process->task);
    printk("Submitted process 0x%04X to be run\n",process->task->taskNum);
    return process;
}

void processWrapup()
{
    __asm__("mov ebx,eax\nmov eax,0x1\nmov ecx,cs\ncall sysEnter_Vector\n");
 }