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
#include "kutility.h"
#include "errors.h"

extern time_t kSystemCurrentTime;
extern task_t* submitNewTask(task_t *task);
extern uint64_t kIdleTicks;

#define PAGE_USER_READABLE 0x4
#define PAGE_USER_WRITABLE 0x6           //0x4 for "User" | 0x2 for "Writable"
#define PAGE_PRESENT 0x1
#define GET_PROCESS_POINTER(process) {process=(process_t*)(PROCESS_STRUCT_VADDR);process=(process_t*)process->this;} //Use the process' virtual process pointer to get the kernel friendly pointer to the process
#define PATH_MAX 512

uintptr_t userCR3=0;

void* copyToKernel(process_t* process, void* dest, const void* src, unsigned long size) //Copy memory from user space to kernel (assumes dest is kernel page)
{
    uintptr_t srcCR3=process->pageDirPtr, destCR3=KERNEL_CR3;
    uintptr_t workingDestAddr=0, workingSrcAddr=0;
    unsigned long bytesLeft=size,loopBytesLeft=0;
    uintptr_t destPagedAddress, srcPagedAddress;

    //Initialize the source and destination addresses
    workingSrcAddr=(uintptr_t)src;
    workingDestAddr=(uintptr_t)dest;

    //Loop until nothing left to copy, subtracting the local "copied bytes" amount from bytesLeft every iteration
    while (bytesLeft)
    {
        //Get the page table entries for the source and destination
        destPagedAddress=pagingGet4kPTEntryValueCR3(destCR3,(uintptr_t)workingDestAddr);
        srcPagedAddress=pagingGet4kPTEntryValueCR3(srcCR3,(uintptr_t)workingSrcAddr);
        
        //Verify the page table entry for the source is present and allows reading by the kernel
        if (!srcPagedAddress&PAGE_PRESENT)
            process->errno=ERROR_SOURCE_ADDRESS_NOT_PRESENT;
        if (!srcPagedAddress&PAGE_USER_READABLE)
            process->errno=ERROR_SOURCE_ADDRESS_NOT_READABLE;

        //Verify the page table entry for the destination is present, allows reading by the user and allows writing by the kernel
        if (!destPagedAddress&PAGE_PRESENT)
            process->errno=ERROR_DEST_ADDRESS_NOT_PRESENT;
        if (!destPagedAddress&PAGE_USER_WRITABLE)
            process->errno=ERROR_DEST_ADDRESS_NOT_WRITABLE;
        if (process->errno)
            return NULL;
        
        destPagedAddress=(destPagedAddress&0xFFFFF000) | (workingDestAddr&0x00000FFF);
        srcPagedAddress=(srcPagedAddress&0xFFFFF000) | (workingSrcAddr&0x00000FFF);
        
        if ((workingDestAddr%PAGE_SIZE!=0) || (bytesLeft < PAGE_SIZE))  //If not page aligned write or bytes left < an entire page
        {
            if (bytesLeft>PAGE_SIZE-(workingDestAddr%PAGE_SIZE))        //If bytes left greater than 
                loopBytesLeft=PAGE_SIZE-(workingDestAddr%PAGE_SIZE);
            else
                loopBytesLeft=bytesLeft;
        }
        else
            loopBytesLeft=PAGE_SIZE;
        
        memcpy((void*)destPagedAddress,(void*)srcPagedAddress,loopBytesLeft);
        //Decrement the total bytes left by the loop bytes left
        bytesLeft-=loopBytesLeft;
        //Increment the source and destination addresses
        workingDestAddr+=loopBytesLeft;
        workingSrcAddr+=loopBytesLeft;
    }
    return dest;
}

void* copyFromKernel(process_t* process, void* dest, const void* src, unsigned long size) //Copy memory from kernel to user space (assumes dest is user page)
{
    uintptr_t srcCR3=KERNEL_CR3, destCR3=process->pageDirPtr;
    uintptr_t workingDestAddr=0, workingSrcAddr=0;
    unsigned long bytesLeft=size,loopBytesLeft=0;
    uintptr_t destPagedAddress, srcPagedAddress;

    //Initialize the source and destination addresses
    workingSrcAddr=(uintptr_t)src;
    workingDestAddr=(uintptr_t)dest;

    //Loop until nothing left to copy, subtracting the local "copied bytes" amount from bytesLeft every iteration
    while (bytesLeft)
    {
        //Get the page table entries for the source and destination
        destPagedAddress=pagingGet4kPTEntryValueCR3(destCR3,(uintptr_t)workingDestAddr);
        srcPagedAddress=pagingGet4kPTEntryValueCR3(srcCR3,(uintptr_t)workingSrcAddr);
        
        //Verify the page table entry for the source is present and allows reading by the kernel
        if (!srcPagedAddress&PAGE_PRESENT)
            process->errno=ERROR_SOURCE_ADDRESS_NOT_PRESENT;
        if (!srcPagedAddress&PAGE_USER_READABLE)
            process->errno=ERROR_SOURCE_ADDRESS_NOT_READABLE;

        //Verify the page table entry for the destination is present, allows reading by the user and allows writing by the kernel
        if (!destPagedAddress&PAGE_PRESENT)
            process->errno=ERROR_DEST_ADDRESS_NOT_PRESENT;
        if (!destPagedAddress&PAGE_USER_WRITABLE)
            process->errno=ERROR_DEST_ADDRESS_NOT_WRITABLE;
        if (process->errno)
            return NULL;
        
        destPagedAddress=(destPagedAddress&0xFFFFF000) | (workingDestAddr&0x00000FFF);
        srcPagedAddress=(srcPagedAddress&0xFFFFF000) | (workingSrcAddr&0x00000FFF);
        
        if ((workingDestAddr%PAGE_SIZE!=0) || (bytesLeft < PAGE_SIZE))  //If not page aligned write or bytes left < an entire page
        {
            if (bytesLeft>PAGE_SIZE-(workingDestAddr%PAGE_SIZE))        //If bytes left greater than 
                loopBytesLeft=PAGE_SIZE-(workingDestAddr%PAGE_SIZE);
            else
                loopBytesLeft=bytesLeft;
        }
        else
            loopBytesLeft=PAGE_SIZE;
        
        memcpy((void*)destPagedAddress,(void*)srcPagedAddress,loopBytesLeft);
        //Decrement the total bytes left by the loop bytes left
        bytesLeft-=loopBytesLeft;
        //Increment the source and destination addresses
        workingDestAddr+=loopBytesLeft;
        workingSrcAddr+=loopBytesLeft;
    }
    return dest;
}

char* processGetCWD(char* buf, unsigned long size) //NOTE buf required to be not NULL
{
    char* retVal=0, cwdSize=0;
    SAVE_CURRENT_CR3(userCR3);
    //Get the process from 
    process_t* process;
    //GET_PROCESS_POINTER(process);
    process=(process_t*)PROCESS_STRUCT_VADDR;
    process=(process_t*)process->this;
    LOAD_KERNEL_CR3;
    cwdSize=strlen(process->cwd)+1;
    if (buf==NULL)
        process->errno=ERROR_INVALID_DEST;
    else if (size<cwdSize)
        process->errno=ERROR_SIZE_TOO_SMALL;
    else
        copyFromKernel(process,buf,process->cwd,cwdSize);
    if (process->errno)
        retVal=NULL;
    else
        retVal=buf;
    LOAD_CR3(userCR3);
    return retVal;
}

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
    process->task=createTask(isKernelProcess);
    process->pageDirPtr=process->task->tss->CR3;
    process->heapStart=PROCESS_HEAP_START;
    process->heapEnd=PROCESS_HEAP_START;
    process->path=(char*)kMalloc(0x1000);
    printd(DEBUG_PROCESS,"createProcess: Malloc'd 0x%08X for process->path\n",process->path);
    //strcpy(process->path,path);
    if (parentProcessPtr!=NULL)
    {
        if (parentProcessPtr->pageDirPtr!=KERNEL_CR3)
           copyToKernel(parentProcessPtr,process->path,path,PATH_MAX);
    }
    else
        strcpy(process->path,path);
    printd(DEBUG_PROCESS,"process->path (0x%08X)=%s\n",process->path,process->path);
    process->elf=NULL;
    gmtime_r((time_t*)&kSystemCurrentTime,&process->startTime);
    
    //Initialize the current working directory and set it to '/'
    process->cwd=allocPagesAndMap(PAGE_SIZE);
    memset(process->cwd,0,PAGE_SIZE);
    strcpy(process->cwd,"/");
    
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
    process->mmaps=kMalloc(sizeof(dllist_t));
    
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
    process->this=process;
    process->processSyscallESP=process->task->tss->ESP1;
    process->priority=PROCESS_DEFAULT_PRIORITY;
    printd(DEBUG_PROCESS,"Mapping the process struct into the process, v=0x%08X, p=0x%08X\n",PROCESS_STRUCT_VADDR,process);
    pagingMapPage(process->task->tss->CR3,PROCESS_STRUCT_VADDR, (uint32_t)process & 0xFFFFF000,0x7); //FIX ME!!!  Had to change to 0x7 for sys_sigaction2 USLEEP

    //Take care of the special "idle" task 
    if (strncmp(process->path,"/sbin/idle",50)!=0)
    {
        process->elf=sysLoadElf(process->path, process->elf, process->task->tss->CR3, false);
        if (!process->elf->loadCompleted)
        {
            return NULL;
        }
        process->task->tss->EIP=process->elf->hdr.e_entry;
    }
    else    //Configure the idle process
    {
        process->task->tss->EIP=(uintptr_t)&processIdleLoop;
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