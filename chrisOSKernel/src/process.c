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
#include "malloc.h"
#include "sysloader.h"
#include "strings.h"

extern elfInfo_t* kExecLoadInfo;
extern int kExecLoadCount;
extern void submitNewTask(task_t* task);
void processWrapup();
bool taskRegInitialized=false;

void destroyProcess(process_t* process)
{
    freePage(process);
}

process_t* createProcess(char* path,int argc,uint32_t argv, bool kernelProcess)
{

    process_t* process;
    

    printd(DEBUG_PROCESS,"Creating %s process for %s\n",kernelProcess?"kernel":"user",path);
    process=(process_t*)malloc(sizeof(process_t));
    process->path=(char*)malloc(512);
    printd(DEBUG_PROCESS,"createProcess: Malloc'd 0x%08X for process->path\n",process->path);
    strcpy(process->path,path);
    printd(DEBUG_PROCESS,"createProcess: Copied path (0x%08X) to process->path (0x%08X)\n",path,process->path);
    printd(DEBUG_PROCESS,"process->path (0x%08X)=%s\n",process->path,process->path);
    process->elf=&kExecLoadInfo[kExecLoadCount++];
    process->task=createTask(kernelProcess);
    //CR3 was set and PDir created by createTask.  Page tables will be created by the load process
    if (!sysLoadElf(process->path,process->elf,process->task->tss->CR3,false))
        return NULL;
    process->task->tss->EIP=process->elf->hdr.e_entry;

    //printk("ESP-20=0x%08X, &schedulerEnabled=0x%08X",process->task->tss->ESP+20,&schedulerEnabled);
    printk("************task ESP=0x%08X************\n",process->task->tss->ESP);
    void* var=&processWrapup;
    memcpy((void*)process->task->tss->ESP,&process->task->tss->EIP,8);
    memcpy((void*)process->task->tss->ESP+4,&process->task->tss->CS,8);
    memcpy((void*)process->task->tss->ESP+8,&process->task->tss->EFLAGS,8);
    memcpy((void*)process->task->tss->ESP+12,&process->task->tss->ESP,8);
    memcpy((void*)process->task->tss->ESP+16,&process->task->tss->SS,8);
    
    //memcpy((void*)process->task->tss->ESP+12,&argc,4);
    //memcpy((void*)process->task->tss->ESP+16,&argv,4);
    //Set the return point since the task will simply ret to exit
    //memcpy((void*)process->task->tss->ESP+8,&var,4);
    printd(DEBUG_PROCESS,"Return point for process is 0x%08X",&processWrapup);
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
    __asm__("mov ebx,eax\nmov eax,0x1\nint 0x80\n");
 }