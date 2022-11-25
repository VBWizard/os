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
#include "strings.h"
#include "paging.h"
#include "kutility.h"
#include "errors.h"
#include "thesignals.h"
#include "syscalls.h"
#include "alloc.h"
#include "schedule.h"
#include "mmap.h"
#include "task.h"
#include "sysloader.h"
#include "filesystem/pipe.h"

extern time_t kSystemCurrentTime;
extern task_t* submitNewTask(task_t *task);
extern uint32_t kIdleTicks;
extern uintptr_t *qRunnable;
void CoWProcess(process_t* process);
uint32_t dupPageTables(process_t* newProcess, process_t* currProcess);
process_t* kKernelProcess;
extern void _schedule();
extern struct gdt_ptr kernelGDT;
extern void syslogd();

#define PAGE_USER_READABLE 0x4
#define PAGE_USER_WRITABLE 0x6           //0x4 for "User" | 0x2 for "Writable"
#define PAGE_PRESENT 0x1
#define GET_PROCESS_POINTER(process) {process=(process_t*)(PROCESS_STRUCT_VADDR);process=(process_t*)process->this;} //Use the process' virtual process pointer to get the kernel friendly pointer to the process
#define PATH_MAX 512

extern void kSetGDT(struct gdt_ptr *);

uintptr_t userCR3=0;

process_t *getCurrentProcess()
{
    uint32_t taskNum;
    process_t* process;
    __asm__("str eax\nshr eax,3\n":"=a" (taskNum)); 
    process = findTaskByTaskNum(taskNum)->process;
    return process;
}

void freeProcess(process_t *process)
{
    elfInfo_t *elf=process->elf;
    elfPageInfo_t *epi=elf->elfLoadedPages;

    printd(DEBUG_PROCESS,"freeProcess: Freeing process memory for %s (task=0x%08x)\n",process->exename,process->task->taskNum);

    gdtEntryOS(process->task->taskNum,0,0, 0,0,false);

    //Only unload the ELF image if the parent is running a different program
    printd(DEBUG_PROCESS,"freeProcess: Checking if elf is ours to free, our exe=%s, parent exe=%s\n", process->exename, process->parent->exename);
    if (!process->parent || strcmp(process->parent->exename,process->exename)!=0)
    {
        pagingMapPage(KERNEL_CR3, (uint32_t)elf->elfLoadedPages | 0xFFFFF000, kPagingGet4kPTEntryValueCR3(process->pageDirPtr,elf->elfLoadedPages) | 0xFFFFF000,0x7);
        while (epi->startPhys!=0)
        {
            printd(DEBUG_PROCESS,"\tFreeing %u bytes at Phys/Virt 0x%08x/0x%08x\n",epi->pages * PAGE_SIZE, epi->startPhys, epi->startVirt);
            kFree(epi->startPhys);
            epi++;
        }
    
        if (elf->symTable)
            kFree(elf->symTable);
        kFree(elf->fileName);
        for (int cnt=0;cnt<50;cnt++)
        {
            if (elf->dynamicInfo.strTableAddress[cnt] != NULL)
                if (((uint32_t)elf->dynamicInfo.strTableAddress[cnt] & 0xFFF) == 0) //CLR 02/10/2019: Hackish, sometimes we kMalloc, other times we use an existing loaded address.  Hopefully loaded addresses don't end with 000
                    kFree(elf->dynamicInfo.strTableAddress[cnt]);
        }
        if (elf->dynamicInfo.relATable)
            kFree(elf->dynamicInfo.relATable);
        if (elf->dynamicInfo.relTable)
            kFree(elf->dynamicInfo.relTable);

        printd(DEBUG_PROCESS,"\tDe-linking this process' elfInfo from the kLoadedElfInfo list\n");

        dllist_t *next=elf->loadedListItem.next, *prev=elf->loadedListItem.prev, *this=&elf->loadedListItem;

        if (next!=this)
        {
            if(prev!=this)
                prev->next=next;
        }
        else
            prev->next=prev;

        if (prev!=this)
        {
            if(next!=this)
                next->prev=prev;
        }
        else
            next->prev=next;

        printd(DEBUG_PROCESS,"\tFreeing the elfInfo for this process @ 0x%08x\n",elf->loadedListItem.payload);
        kFree(elf->loadedListItem.payload);

    }
    //NOTE: Don't free heap, process allocated it with libc malloc and libc frees it!
    
    //Don't free stack0Start because it belongs to the kernel process and everyone shares it
    printd(DEBUG_PROCESS,"\tFreeing initial stack page @ 0x%08x\n",process->stackInitialPage);
    //TODO: Fix this.  Unremarking this causes paging exception SEGV in /sbin/idle
    //kFree(process->stackInitialPage);

    //TODO: Not working, need to fix so that pipes aren't leaked memory when the process ends
/*    bool bPipeClosed = false;
    if (process->stdinRedirected && process->stdin != process->parent->stdin)
    {
        bPipeClosed = pipeclose(process->stdin);
        if (bPipeClosed)
            fs_close(process->stdin);
        printd(DEBUG_FILESYS,"\tfreeProcess: Decremented pipe use count for stdin is %i, pipe is %s\n", ((pipe_t*)(process->stdin))->usecount, (bPipeClosed?"closed":"still open"));
        process->stdinRedirected=false;
    }
    if (process->stdoutRedirected && process->stdout != process->parent->stdout)
    {
        bPipeClosed = pipeclose(process->stdout);
        if (bPipeClosed)
            fs_close(process->stdout);
        printd(DEBUG_FILESYS,"\tfreeProcess: Decremented pipe use count for stdout is %i, pipe is %s\n", ((pipe_t*)(process->stdout))->usecount, (bPipeClosed?"closed":"still open"));
        process->stdoutRedirected=false;
    }
    if (process->stderrRedirected && process->stderr != process->parent->stderr)
    {
        bPipeClosed = pipeclose(process->stdout);
        if (bPipeClosed)
            fs_close(process->stderr);
        printd(DEBUG_FILESYS,"\tfreeProcess: Decremented pipe use count for stderr is %i, pipe is %s\n", ((pipe_t*)(process->stderr))->usecount, (bPipeClosed?"closed":"still open"));
        process->stderrRedirected=false;
    }*/
    kFree(process->stack1Start);
    kFree(process->path);
    kFree(process->cwd);
    kFree(process->argv);
    kFree(process);
    free_mmaps(process);
    printd(DEBUG_PROCESS,"freeProcess: Done!  Process freed!\n");
    
}

//NOTE: Assumes contiguous memory area
void* copyToKernel(process_t* srcProcess, void* dest, const void* src, unsigned long size) //Copy memory from user space to kernel (assumes dest is kernel page)
{
    uintptr_t srcCR3=srcProcess->task->pageDir , destCR3=KERNEL_CR3;
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
            srcProcess->errno=ERROR_SOURCE_ADDRESS_NOT_PRESENT;
        if (!srcPagedAddress&PAGE_USER_READABLE)
            srcProcess->errno=ERROR_SOURCE_ADDRESS_NOT_READABLE;

        //Verify the page table entry for the destination is present, allows reading by the user and allows writing by the kernel
        if (!destPagedAddress&PAGE_PRESENT)
            srcProcess->errno=ERROR_DEST_ADDRESS_NOT_PRESENT;
        if (!destPagedAddress&PAGE_USER_WRITABLE)
            srcProcess->errno=ERROR_DEST_ADDRESS_NOT_WRITABLE;
        if (srcProcess->errno)
        {
            printd(DEBUG_PROCESS,"copyToKernel: Error! %d, cr3=0x%08x, src=0x%08x, srcPagedAddress=0x%08x\n",srcProcess->errno,srcCR3, workingSrcAddr, srcPagedAddress);
            return NULL;
        }
        
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
    uintptr_t srcCR3=KERNEL_CR3, destCR3=(uintptr_t)process->pageDirPtr;
    uintptr_t workingDestAddr=0;
    uintptr_t workingSrcAddr=0;
    unsigned long bytesLeft=size,loopBytesLeft=0;
    uintptr_t destPagedAddress;
    uintptr_t srcPagedAddress;

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
        
        pagingMapPage(KERNEL_CR3, destPagedAddress, destPagedAddress, 0x7);
        
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
    //TODO: Unmap?
    return dest;
}

int processSetCWD(process_t *process, char* buf, unsigned long size) //NOTE buf required to be not NULL
{
    int retVal=0, cwdSize=1024;

    if (buf==NULL)
        process->errno=ERROR_INVALID_DEST;
    else if (size>cwdSize)
        process->errno=ERROR_SIZE_TOO_SMALL;
    else
        copyToKernel(process,process->cwd,buf,cwdSize);
    if (process->errno)
        return -1;
    else
        return 0;
}

int processGetCWD(process_t *process, char* buf, unsigned long size) //NOTE buf required to be not NULL
{
    char* retVal=0, cwdSize=0;

    cwdSize=strlen(process->cwd)+1;
    if (buf==NULL)
        process->errno=ERROR_INVALID_DEST;
    else if (size<cwdSize)
        process->errno=ERROR_SIZE_TOO_SMALL;
    else if (process)
        copyFromKernel(process,buf,process->cwd,cwdSize);
    else
        memcpy(buf,process->cwd,cwdSize);
    if (process->errno)
        return -1;
    else
        return 0;
}

//This runs in user space.  We're just calling startup procedures
void processStart()
{
    int lCounter;
    process_t* process=(process_t*)PROCESS_STRUCT_VADDR;
    printd(DEBUG_PROCESS,"processStart: Checking for start handlers\n");
    for (lCounter=0;lCounter<process->startHandlerPtr;lCounter++)
        if (process->startHandler[lCounter]!=NULL)
        {
            uint32_t* handlers = (uint32_t*)process->startHandler[lCounter];
            startHandler* x=(void*)handlers[lCounter];
            printd(DEBUG_PROCESS,"processStart: Executing startHandler %u @ 0x%08x\n",lCounter,process->startHandler[lCounter]);
            x();
        }
    return;
}

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
            printd(DEBUG_PROCESS,"processExit: Executing exitHandler %u @ 0x%08x\n",lCounter,process->exitHandler[lCounter]);
            x();
        }
    //TODO: Clean up list items before clearing the list
/*    dllist_t *maplist = process->mmaps;
    do
    {
        if (maplist->next==maplist)
            maplist=NULL;
        else
            maplist=maplist->next;
    } while (maplist!=NULL);
  */  
     __asm__("call sysEnter_Vector\n"::"a" (SYSCALL_ENDPROCESS), "b" (process->pageDirPtr), "c" (lRetVal));
    //Free memory allocated to the process
     
     //freeMemory(process);
}

bool processRegExit(process_t* process, void* routineAddr)
{
    for (int cnt=0;cnt<PROCESS_MAX_EXIT_HANDLERS;cnt++)
        if (process->exitHandler[cnt]==NULL)
        {
            process->exitHandler[cnt]=routineAddr;
            printd(DEBUG_PROCESS,"processRegExit: Registered exitHandler %u @ 0x%08x\n",cnt,process->exitHandler[cnt]);
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

//Called by exception handlers for fatal exceptions.  Just wait for death
//NOTE: Runs in the context of the process that is to be killed
void waitForDeath()
{
    __asm__("sti\n");
    waitForDeathHere:
    goto waitForDeathHere;
}

int calcProcessSize(process_t *process)
{
    int totalBytes=0;
    elfInfo_t *elf=process->elf;
    if (elf!=NULL)
        totalBytes=process->stackSize+elf->textSize+elf->dataSize+elf->tdataSize+elf->bssSize;
    else
        totalBytes=0;
    if (totalBytes<0)
        totalBytes=0;
}

void processIdleLoop()
{
    process_t* process=getCurrentProcess();
    sys_setpriority(process,20);
    //Block idle task SIGINT ... default action for SIGINT is to kill the process
    sys_masksig(SIGINT,1);
    while (1==1)
    {
        kIdleTicks++;
/*        if (kIdleTicks%10==0)
        printd(DEBUG_PROCESS, "tick (%u)\n",kIdleTicks);
*/        __asm__("sti;hlt;");
     }   
}

process_t *initializeProcess(bool isKernelProcess)
{
    process_t* process;

    printd(DEBUG_PROCESS,"createProcess: Mallocing process_t\n");
    //NOTE: Using allocPages instead of malloc because we need the process struct to start on a page boundary for paging reasons, and
    //      allocPages always allocates entire pages
    process=allocPagesAndMap(sizeof(process_t));
    printd(DEBUG_PROCESS,"createProcess: Malloc'd 0x%08x for process\n",process);
    memset(process,0,sizeof(process_t));
    process->task=createTask(process, isKernelProcess);
    process->pageDirPtr=process->task->tss->CR3;
    //process->path=(char*)kMalloc(0x1000); 
    printd(DEBUG_PROCESS,"createProcess: Malloc'd 0x%08x for process->path\n",process->path);
    process->task->process=process;
    process->processSyscallESP=process->task->tss->ESP1;
    process->priority=PROCESS_DEFAULT_PRIORITY;
    printd(DEBUG_PROCESS,"Mapping the process struct into the process, v=0x%08x, p=0x%08x\n",PROCESS_STRUCT_VADDR,process);
    pagingMapPage(process->task->tss->CR3, PROCESS_STRUCT_VADDR, (uint32_t)process & 0xFFFFF000, (uint16_t)0x5); 
    pagingMapPage(process->task->tss->CR3, process->task, process->task, (uint16_t)0x5);

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
    memset(process->task->tss->IOs,0,200);
    process->task->tss->IOPB = sizeof(tss_t)-200;
    gdtEntryOS(process->task->taskNum,(uint32_t)process->task->tss,sizeof(tss_t), tssFlags ,GDT_GRANULAR | GDT_32BIT,true);
    installGDT();
    process->execDontSaveRegisters = false;
    return process;
}

//NOTE: if initialize parameter is passed as false, parentProcessPtr is the pointer to the process which is currently running, NOT its parent
//In this case:
//      1) If the process' real parent is NULL then we will free some resources
//      2) We will leave the environment alone (i.e. not pass argc and argv)
//      3) We won't touch stdin/stdout/stderr
process_t* createProcess(char* path, int argc, char** argv, process_t* parentProcessPtr, bool isKernelProcess, bool useExistingProcess)
{
    process_t* process;

    //Disable the scheduler or it will invariably try to schedule this task off the CPU before we're done reloading it
    if (useExistingProcess)
        disableScheduler();
    //TODO: If useExistingProcess, we should remove the text, data, tdata and bss mappings from the CR3 
    //since we're replacing those segments
    
    //If useExistingProcess then we'll not initialize a new one
    if (useExistingProcess)
    {
        process = parentProcessPtr;
        process->mmaps = NULL;
        process->totalRunTicks=0;
    }
    else
        process = initializeProcess(isKernelProcess);
    
    //We will always load startHandlers whether we're createing a process or just loading into it
    process->startHandlerPtr=0; //CLR 12/23/2018: Initialize the start handler pointer to the first entry

    process->path=(char*)kMalloc(0x1000); 

    //Copy the path (parameter) value from the parent's memory.
    if (parentProcessPtr!=NULL && parentProcessPtr->pageDirPtr!=0)
    {
           copyToKernel(parentProcessPtr,process->path,path,PATH_MAX);
    }
    else
        strcpy(process->path,path);
    
    printd(DEBUG_PROCESS,"Creating %s process for %s\n",isKernelProcess?"kernel":"user",process->path);

    char *slash=process->path, *slash2=process->path;
    
    while (slash!=NULL)
    {
        slash = strstr(slash2+1, "/");
        if (slash)
            slash2 = slash;
        else
            slash2+=1;
    }
    strcpy(process->exename, slash2);
    
    printd(DEBUG_PROCESS,"process->path (0x%08x)=%s\n",process->path,process->path);
   
    //Always set the elf to NULL, even when useExistingProcess, because we don't want to disturb the paren't elf
    process->elf=NULL;
    gmtime_r((time_t*)&kSystemCurrentTime,&process->startTime);
    
    
    process->heapStart=PROCESS_HEAP_START;
    process->heapEnd=PROCESS_HEAP_START;
    
    if (useExistingProcess)
    {
       process->parent=parentProcessPtr->parent;
       process->kernelProcess=((process_t*)process->parent)->kernelProcess;
       //CLR 02/05/2019: If we forked we don't want to mess with the pipes established 
       /*process->stdin=((process_t*)parentProcessPtr)->stdin;
       process->stdout=((process_t*)parentProcessPtr)->stdout;
       process->stderr=((process_t*)parentProcessPtr)->stderr;*/
       for (int cnt=0;cnt<PROCESS_MAX_EXIT_HANDLERS;cnt++)
           process->exitHandler[cnt]=NULL;
    }
    else if (parentProcessPtr != NULL)
    {
       process->parent=parentProcessPtr;
       process->kernelProcess=((process_t*)process->parent)->kernelProcess;
       process->stdin=((process_t*)parentProcessPtr)->stdin;
       process->stdout=((process_t*)parentProcessPtr)->stdout;
       process->stderr=((process_t*)parentProcessPtr)->stderr;
       //Initialize the current working directory to parent's cwd
       process->cwd=allocPagesAndMap(PAGE_SIZE);
       if (parentProcessPtr!=NULL && parentProcessPtr->cwd)
           //Initialize the current working directory to parent's cwd
           strcpy(process->cwd, parentProcessPtr->cwd);
    }
    else
    {
        //Initialize the current working directory and set it to '/'
       process->cwd=allocPagesAndMap(PAGE_SIZE);
       memset(process->cwd,0,PAGE_SIZE);
       strcpy(process->cwd,"/");
       process->kernelProcess=isKernelProcess;
       process->stdin=0;
       process->stdout=1;
       process->stderr=2;
    }
    
    process->argv=argv;
    uint32_t argvVirt=0x6f000000;
    if (process->parent!=NULL)
    {
        process->argc = argc;
        printd(DEBUG_PROCESS,"Mapping parent's argv into our memory\n");
        //Map the parent's argv into our paging table
        if (process->parent!=kKernelProcess)
            pagingMapProcessPageIntoKernel(((process_t*)process->parent)->pageDirPtr,argv,0x7);
        //Create and populate a page with the parameters, replacing old pointers with new ones which are virtualized to our address space
        if (argc>0)
            process->argv=(uintptr_t)allocPages(50*argc+(4*argc));
        else 
            process->argv=(uintptr_t)allocPages(54); //Don't want a NULL pointer floating around
        pagingMapPageCount(KERNEL_CR3, process->argv, process->argv, ((50*argc+(4*argc))/PAGE_SIZE)+1,0x7,true);
        printd(DEBUG_PROCESS,"Retrieving argv parameter values from parent process\n");
        //processCopyArgV((char**)process->argv,(char**)argv,argvVirt,argc);
        uint32_t argcPtr=argc*4; //start at the end of the pointer
        uint32_t argvVal=(char*)process->argv;
        for (int cnt=0;cnt<argc;cnt++)
        {
            //argv[cnt] = address of argv + # of arguments * 8 (char**) + 
            process->argv[cnt]=(char*)process->argv+argcPtr;
            copyToKernel(parentProcessPtr,process->argv[cnt],argv[cnt],50);
            process->argv[cnt]=(char*)argcPtr+argvVirt;
            argcPtr+=50;
        }
        pagingMapPageCount(process->task->tss->CR3, argvVirt, process->argv, ((50*argc)/PAGE_SIZE)+1,0x7,true);
        pagingMapPageCount(KERNEL_CR3, argvVirt, process->argv, ((50*argc)/PAGE_SIZE)+1,0x7,true);
    }
    else
    {
        argv=0;
        argc=0;
    }

    if (argc==0)
    {
        process->argc=1;
        process->argv=(uintptr_t)allocPages(50*1+(4*1));
        uint32_t argvVal=(char*)process->argv;
        pagingMapPageCount(KERNEL_CR3, process->argv, process->argv, ((50*argc+(4*argc))/PAGE_SIZE)+1,0x7,true);
        pagingMapPageCount(process->task->tss->CR3, argvVirt, process->argv, ((50*argc)/PAGE_SIZE)+1,0x7,true);
        pagingMapPageCount(KERNEL_CR3, argvVirt, process->argv, ((50*argc)/PAGE_SIZE)+1,0x7,true);
        uint32_t argcPtr=1*4; //start at the end of the pointer
        process->argv[0]=(char*)process->argv+argcPtr;
        strcpy(process->argv[0],path);
        process->argv[0]=(char*)argcPtr+argvVirt;
    }
        
    uint32_t envpVirt=0x6f050000;
    uint32_t envVirt = 0x6f060000;

    //Only copy the parent's environment if we're not replacing a process
    if (parentProcessPtr != 0 && parentProcessPtr->mappedEnvp != 0 && !useExistingProcess)
    {
        //Create and populate a page with the parameters, replacing old pointers with new ones which are virtualized to our address space
        process->mappedEnvp=(char**)allocPagesAndMap(50*4);
        process->realEnvp = pagingGet4kPTEntryValueCR3(CURRENT_CR3, process->mappedEnvp) & 0xFFFFF000;
        memset(process->mappedEnvp, 0, 50*4);
        process->mappedEnv=(char*)allocPagesAndMap(50*512);
        process->realEnv = pagingGet4kPTEntryValueCR3(CURRENT_CR3, process->mappedEnv) & 0xFFFFF000;
        memset(process->mappedEnv, 0, 50*512);
        //Map envp into process at envpVirt
        pagingMapPageCount(process->task->tss->CR3, envpVirt, process->mappedEnvp, ((50*4)/PAGE_SIZE)+1,0x7,true);
        //Map env into process
        pagingMapPageCount(process->task->tss->CR3, envVirt, process->mappedEnv, ((50*512)/PAGE_SIZE)+1,0x7,true);
        //Map envp into the kernel
        pagingMapPageCount(KERNEL_CR3, process->mappedEnvp, process->mappedEnvp, ((50*4)/PAGE_SIZE)+1,0x7,true);
        //Map env into the kernel
        pagingMapPageCount(KERNEL_CR3, process->mappedEnv, process->mappedEnv, ((50*512)/PAGE_SIZE)+1,0x7,true);
        //processCopyArgV((char**)process->envp,(char**)parentProcessPtr->envp,envpVirt,50);
        printd(DEBUG_PROCESS,"Copying environment variables from parent process\n");
        
        for (int cnt=0;cnt<50;cnt++)
        {
            if (parentProcessPtr->mappedEnvp[cnt]!=0)
            {
                process->mappedEnvp[cnt] = process->mappedEnv+(cnt*512);
                copyToKernel(parentProcessPtr,process->mappedEnvp[cnt],parentProcessPtr->mappedEnvp[cnt],512);
                process->mappedEnvp[cnt] = envVirt+(cnt*512);
            }
        }
    }


    //Take care of the special "idle" task 
    if (strncmp(process->path,"/sbin/idle",50)==0)
        process->task->tss->EIP=(uintptr_t)&processIdleLoop;
    else if (strncmp(process->path,"/sbin/syslogd",50)==0)
        process->task->tss->EIP=(uintptr_t)&syslogd;
    else
    {
        //The reason kSHell throws a paging exception when you type an invalid filename is because we remove the program segment mappings
        //before attempting to load the new executable, so if the new executable fails to load and we try to return to the calling program,
        //we can't.  (our program was unmapped!)
        //This is our temporary fix to the problem.  Try to open the file and if it fails, return before unmapping!
        printd(DEBUG_PROCESS,"temp1\n", process->path);
        printd(DEBUG_PROCESS,"Opening %s because ... \n", process->path);
        void* fPtr=fs_open(process->path, "r");
        if (fPtr==0)
        {
            if (useExistingProcess)
                enableScheduler();
            return NULL;
        }
        fs_close(fPtr);
        if (useExistingProcess)
           removeProgramSegmentMappings(process->parent, process);
        printd(DEBUG_PROCESS,"Temp2\n");
        process->elf=sysLoadElf(process->path, process->elf, process->task->tss->CR3);
        if (!((elfInfo_t*)(process->elf))->loadCompleted)
        {
            if (useExistingProcess)
                enableScheduler();
            return NULL;
        }
        //CLR 12/23/2018: point to processStart ... which will initialize anything that needs to be initialized 
        //and then jump into the loaded program
        process->entryPoint = ((elfInfo_t*)process->elf)->hdr.e_entry;
        //process->task->tss->EIP=process->elf->hdr.e_entry;
        process->task->tss->EIP=(uint32_t)&processStart;
        //Get processStart handlers
        process->startHandlerPtr = 0;
        for (int cnt=0;cnt<((elfInfo_t*)process->elf)->libraryElfCount;cnt++)
        {
            elfInfo_t* lElf = ((elfInfo_t*)process->elf)->libraryElfPtr[cnt];
            if (lElf->dynamicInfo.initFunctionAddress!=0)
            {
                process->startHandler[process->startHandlerPtr++]=(void*)lElf->dynamicInfo.initFunctionAddress;
            }
        }
    }

    //printk("ESP-20=0x%08x, &schedulerEnabled=0x%08x",process->task->tss->ESP+20,&schedulerEnabled);
    printd(DEBUG_PROCESS,"Setting up the stack\n");
    void* processExitAddress=&processExit;

    uint32_t realESP=0;
    if (isKernelProcess)
        realESP=process->task->tss->ESP-0x104;
    else
        realESP=process->task->tss->ESP;
    //Per the above, the stack will start at -0x100 from where we write the CS/EIP/FLAGS/SS/ESP, so put our params around there
//    memcpy((void*)realESP-4,process,4);
    copyFromKernel(process, realESP-4, process, 4);
//    memcpy((void*)realESP,&process->entryPoint,4);
    copyFromKernel(process, realESP, &process->entryPoint, 4);
//    memcpy((void*)realESP+4,&processExitAddress,4);
    copyFromKernel(process, realESP+4, &processExitAddress, 4);
//    memcpy((void*)realESP+8,&argc,4);
    copyFromKernel(process, realESP+8, &process->argc, 4);
//    memcpy((void*)realESP+12,&argvVirt,4);
    copyFromKernel(process, realESP+12, &argvVirt, 4);
//    memcpy((void*)realESP+16,&envpVirt,4);
    copyFromKernel(process, realESP+16, &envpVirt, 4);
    
    //With the new scheduler return logic, we IRETD to kernel proceses, so the EIP/CS/FLAGS/ESP/SS have to be on the stack
    if (isKernelProcess)  
    {
        memcpy((void*)process->task->tss->ESP,&process->task->tss->EIP,4);
        memcpy((void*)process->task->tss->ESP+4,&process->task->tss->CS,4);
        memcpy((void*)process->task->tss->ESP+8,&process->task->tss->EFLAGS,4);
        memcpy((void*)process->task->tss->ESP+12,&realESP,4);
        memcpy((void*)process->task->tss->ESP+16,&process->task->tss->SS,4);
    }
    //Set the return point since the task will simply ret to exit
    printd(DEBUG_PROCESS,"Return point for process is 0x%08x\n",&processExit);
    printd(DEBUG_PROCESS,"Created Process @ 0x%08x\n",process);
 
    if (useExistingProcess) //Process is already scheduled if useExistingProcess
    {
        task_t *t = getCurrentTask();
        t->process=process;
        process->execDontSaveRegisters = true;
        t->tss->EFLAGS |= 0x200;
        enableScheduler();
        triggerScheduler();
        __asm__("sti\nhlt\n");
    }
    else
    {
        process->task=submitNewTask(process->task);
        printd(DEBUG_PROCESS,"Submitted process 0x%04x to be run\n",process->task->taskNum);
    }
    return process;
}

uint32_t process_fork(process_t* currProcess)
{
    process_t* newProcess = allocPagesAndMap(sizeof(process_t));
    task_t* newTask;
    uint32_t retVal=0, returnCount = 0;

    printd(DEBUG_PROCESS, "process_fork: Creating a new task and duplicating the process\n");
    
    //Duplicate the calling process
    memcpy(newProcess,currProcess,sizeof(process_t));
    
    //Create a new task.  Can't dup the task because it needs its own taskNum which is 
    newTask=getAvailableTask();
    uint32_t taskNum = newTask->taskNum;
    
    tss_t* tss = newTask->tss;
    memcpy(newTask, currProcess->task, sizeof(task_t));
    newTask->tss = tss;
    memcpy(newTask->tss,currProcess->task->tss,sizeof(tss_t)); //No need to malloc, getAvailableTask did that already
    newTask->taskNum = taskNum;
    newTask->process = newProcess;
    newProcess->task = newTask;
    newTask->exited = 0;
    newTask->taskState = TASK_RUNNABLE;
    newTask->ticksSinceLastInterrupted = currProcess->task->ticksSinceLastInterrupted+1;
    //Child task will return from child_task_forked with a 0 return value, whereas we will return with the child task PID
    newProcess->justForked=true;
    newProcess->parent = currProcess;
    newProcess->childNumber = ++currProcess->lastChildNumber;
    //Initialize the current working directory to parent's cwd
    newProcess->cwd=allocPagesAndMap(PAGE_SIZE);
    strcpy(newProcess->cwd, currProcess->cwd);
    __asm__("cli\n");
    newProcess->pageDirPtr = dupPageTables(newProcess, currProcess); //Duplicates the current process' page tables to the new one

    //CLR 01/17/2019: Changed order of dup & CoW and now CoWing the child instead of the parent.
    //The parent will maintain direct access to all of its memory.  Whenever the child tries to access the paren't memory
    //it is CoWed, so it is copied and the child gets access to the CoW page.
    CoWProcess(newProcess);

    uint32_t tssFlags=ACS_TSS;
    uint32_t gdtFlags=GDT_PRESENT | GDT_CODE;
    if (currProcess->task->kernel)
    {
        gdtFlags |= GDT_DPL0;
        tssFlags |= ACS_DPL_0;
    }
    else
    {
        gdtFlags |= GDT_DPL3;
        tssFlags |= ACS_DPL_3;
    }
    memset(newProcess->task->tss->IOs,0,200);
    newProcess->task->tss->IOPB = sizeof(tss_t)-200;
    gdtEntryOS(newProcess->task->taskNum,(uintptr_t)newProcess->task->tss,sizeof(tss_t), tssFlags ,GDT_GRANULAR | GDT_32BIT,true);
    pagingMapPage(newProcess->task->tss->CR3,(uintptr_t)newProcess->task->tss,(uintptr_t)newProcess->task->tss,(uint16_t)0x7);
    kSetGDT(&kernelGDT);
    
    //Clone the parent's ESP1 Stack
    newProcess->stack1Size = currProcess->stack1Size;
    ((process_t*)newTask->process)->stack1Start=kMalloc(newProcess->stack1Size);
    pagingMapPageCount(newTask->tss->CR3, newProcess->stack1Start, newProcess->stack1Start, currProcess->stack1Size / PAGE_SIZE, 0x7, true);  //NOTE: the -0x15000 is because after we allocated the stack, we set it 0x15000 forward
    pagingMapPageCount(KERNEL_CR3, newProcess->stack1Start, newProcess->stack1Start, currProcess->stack1Size / PAGE_SIZE, 0x7, true);  //NOTE: the -0x15000 is because after we allocated the stack, we set it 0x15000 forward
    pagingMapPageCount(KERNEL_CR3, newProcess->stack1Start | 0xC0000000, newProcess->stack1Start, currProcess->stack1Size / PAGE_SIZE, 0x7, true);  //NOTE: the -0x15000 is because after we allocated the stack, we set it 0x15000 forward
    pagingMapPageCount(newTask->tss->CR3, newProcess->stack1Start | KERNEL_PAGED_BASE_ADDRESS, newProcess->stack1Start, 0x16, 0x7, true);
    printd(DEBUG_PROCESS,"process_fork: Allocated task ESP1 for syscall at 0x%08x (0x%08x bytes)\n",newProcess->stack1Start,currProcess->stack1Size);
    newProcess->task->tss->ESP1 = newProcess->stack1Start + newProcess->stack1Size - 0x1000;
    newProcess->processSyscallESP=newProcess->task->tss->ESP1;
    
    //Don't forget to map the new process to VADDR!
    pagingMapPage(newProcess->task->tss->CR3, PROCESS_STRUCT_VADDR, (uint32_t)newProcess & 0xFFFFF000, (uint16_t)0x7); //FIX ME!!!  Had to change to 0x7 for sys_sigaction2 USLEEP
    
    newProcess->parent->forkChildCR3 = newProcess->pageDirPtr;
    newProcess->task->pageDir = (uint32_t*)newProcess->pageDirPtr;

    submitNewTask(newTask);
    returnCount = 0;
    retVal = newTask->taskNum;      //parent gets this
    triggerScheduler();
    __asm__("sti\nhlt\n");
    //printd(DEBUG_PROCESS, "fork: lastChildCR3 = 0x%08x\n",getCurrentProcess()->parent->forkChildCR3);
    if (returnCount++ > 0)
        return retVal;
    else
        return 0;
}

void CoWProcess(process_t* process)
{
    elfInfo_t *elf=process->elf;
    printd(DEBUG_PROCESS, "CoWing the child process' copy of the parent's memory\n");
    //CoW the text segment
    if (elf->textAddress>0)
    {
        cowPages(process->pageDirPtr, (uintptr_t*)(elf->textAddress & 0xFFFFFFF0), elf->textSize);
        printd(DEBUG_PROCESS, "\tCoW'd the .text at 0x%08x for 0x%08x bytes\n",elf->textAddress, elf->textSize);
    }
    //CoW the bss segment
    if (elf->bssAddress>0)
    {
        cowPages(process->pageDirPtr, (uintptr_t*)(elf->bssAddress & 0xFFFFFFF0), elf->bssSize);
        printd(DEBUG_PROCESS, "\tCoW'd the .bss at 0x%08x for 0x%08x bytes\n",elf->bssAddress, elf->bssSize);
    }
    //CoW the data/tata segments
    if (elf->dataAddress>0)
    {
        cowPages(process->pageDirPtr, (uintptr_t*)(elf->dataAddress & 0xFFFFF000), elf->dataSize);
        printd(DEBUG_PROCESS, "\tCoW'd the .data at 0x%08x for 0x%08x bytes\n",elf->dataAddress, elf->dataSize);
    }
    if (elf->tdataAddress>0)
    {
        cowPages(process->pageDirPtr, (uintptr_t*)(elf->tdataAddress & 0xFFFFF000), elf->tdataSize);
        printd(DEBUG_PROCESS, "\tCoW'd the .tdata at 0x%08x for 0x%08x bytes\n",elf->tdataAddress, elf->tdataSize);
    }
    //CoW the heap segment
    if (process->heapEnd - process->heapStart > 0)
    {
        cowPages(process->pageDirPtr, (uintptr_t*)(process->heapStart & 0xFFFFF000), process->heapEnd - process->heapStart);
        printd(DEBUG_PROCESS, "\tCoW'd the heap at 0x%08x for 0x%08x bytes\n",process->heapStart, process->heapEnd - process->heapStart);
    }
    cowPages(process->pageDirPtr, (uintptr_t*)(process->stackStart & 0xFFFFF000), process->stackSize);
    printd(DEBUG_PROCESS, "\tCoW'd the stack at 0x%08x for 0x%08x bytes\n",process->stackStart, process->stackSize);
}

uintptr_t dupPageTables(process_t* newProcess, process_t* currProcess)
{
    elfInfo_t *elf=currProcess->elf;
    
    uintptr_t pageDirPtr=(uintptr_t)pagingAllocatePagingTablePage();
    newProcess->task->pageDir = pageDirPtr;
    newProcess->task->tss->CR3 = pageDirPtr;
    memset(pageDirPtr, 0, PAGE_SIZE);
    newProcess->task->tss->CR3 = pageDirPtr;
    printd(DEBUG_PROCESS, "\tdupPageTables: Duping page tables from 0x%08x to 0x%08x\n",currProcess->pageDirPtr, pageDirPtr);
    pagingMapPage(KERNEL_CR3,newProcess->task->tss->CR3 | KERNEL_PAGED_BASE_ADDRESS,newProcess->task->tss->CR3,(uint16_t)0x3);
    pagingMapPage(KERNEL_CR3,newProcess->task->tss->CR3, newProcess->task->tss->CR3,(uint16_t)0x3);
    pagingMapPage(pageDirPtr,newProcess->task->tss->CR3, newProcess->task->tss->CR3,(uint16_t)0x7);

    uint32_t* oldCR3 = (uint32_t*)currProcess->pageDirPtr;
    uint32_t* newCR3 = (uint32_t*)pageDirPtr;
    uint32_t textMin = elf->textAddress;
    uint32_t textMax = elf->textAddress + elf->textSize;
    uint32_t dataMin = elf->dataAddress;
    uint32_t dataMax = elf->dataAddress + elf->dataSize;
    uint32_t tdataMin = elf->tdataAddress;
    uint32_t tdataMax = elf->tdataAddress + elf->tdataSize;
    uint32_t bssMin = elf->bssAddress;
    uint32_t bssMax = elf->bssAddress + elf->bssSize;
    
    //Iterate the current PDE creating a new page and pointing to it whenever you find an entry
    for (int cr3Ptr=0;cr3Ptr<1024;cr3Ptr++)
    {
        //if the CR3 page directory has a value, dup the page table at this entry
        if (oldCR3[cr3Ptr] != 0)
        {
            //Create the new page table and a reference to the old one
            printd(DEBUG_PROCESS,"\tFound PT at 0x%08x to dup (addresses from 0x%08x to 0x%08x\n",&oldCR3[cr3Ptr], cr3Ptr*0x400000, cr3Ptr*0x400000 + 0x3fffff);
            uint32_t *oldPT = oldCR3[cr3Ptr];
            uint32_t *newPT = pagingAllocatePagingTablePage();
            pagingMapPage(KERNEL_CR3,(uint32_t)newPT | KERNEL_PAGED_BASE_ADDRESS,(uint32_t)newPT | ((uint16_t)oldPT & 0x00000FFF),(uint16_t)0x3);
            pagingMapPage(KERNEL_CR3, newPT, newPT, (uint16_t)0x7);
            pagingMapPage(pageDirPtr,newPT, newPT,(uint16_t)0x7);
            
            //Put the address of the page table in the CR3 page directory
            newCR3[cr3Ptr] = (uint32_t)newPT | ((uint32_t)oldPT & 0x00000FFF);

            //Now iterate the old page table creating entries on the new table where they exist on the old
            //Now dup the page table
            memcpy(newPT, (uint32_t)oldPT & 0xFFFFF000, PAGE_SIZE);
            pagingMapPage(pageDirPtr,newPT, newPT,(uint16_t)((uint16_t)oldPT & 0x00000FFF)); //**NOTE**: 3ff is because we don't want to copy PAGE_MMAP_FLAG
            printd(DEBUG_PROCESS,"\t\tDup'd PT from 0x%08x to 0x%08x\n",(uint32_t)oldPT & 0xFFFFF000, newPT);
        }
    }
    //We overwrote the new page directory's entry in the new directory, so re-create it!
    pagingMapPage(KERNEL_CR3,newProcess->task->tss->CR3 | KERNEL_PAGED_BASE_ADDRESS,newProcess->task->tss->CR3,(uint16_t)0x7);
    pagingMapPage(KERNEL_CR3,newProcess->task->tss->CR3, newProcess->task->tss->CR3,(uint16_t)0x7);
    pagingMapPage(pageDirPtr,newProcess->task->tss->CR3, newProcess->task->tss->CR3,(uint16_t)0x7);
    return pageDirPtr;
}

void removeProgramSegmentMappings(process_t *currProcess, process_t *newProcess)
{
    elfInfo_t *elf=currProcess->elf;
    if (elf->textAddress>0)
        pagingMapPageCount(newProcess->pageDirPtr, elf->textAddress, 0, elf->textSize/PAGE_SIZE+1, 0, false);
    if (elf->dataAddress>0)
        pagingMapPageCount(newProcess->pageDirPtr, elf->dataAddress, 0, elf->dataSize/PAGE_SIZE+1, 0, false);
    if (elf->tdataAddress>0)
        pagingMapPageCount(newProcess->pageDirPtr, elf->tdataAddress, 0, elf->tdataSize/PAGE_SIZE+1, 0, false);
    if (elf->bssAddress>0)
        pagingMapPageCount(newProcess->pageDirPtr, elf->bssAddress, 0, elf->bssSize/PAGE_SIZE+1, 0, false);
    pagingMapPageCount(newProcess->pageDirPtr, currProcess->heapStart, 0, (currProcess->heapEnd - currProcess->heapStart)/PAGE_SIZE+1, 0, false);

 
/*    uint32_t* newCR3 = (uint32_t*)newProcess->pageDirPtr;
    uint32_t textMin = currProcess->elf->textAddress;
    uint32_t textMax = currProcess->elf->textAddress + currProcess->elf->textSize;
    uint32_t dataMin = currProcess->elf->dataAddress;
    uint32_t dataMax = currProcess->elf->dataAddress + currProcess->elf->dataSize;
    uint32_t tdataMin = currProcess->elf->tdataAddress;
    uint32_t tdataMax = currProcess->elf->tdataAddress + currProcess->elf->tdataSize;
    uint32_t bssMin = currProcess->elf->bssAddress;
    uint32_t bssMax = currProcess->elf->bssAddress + currProcess->elf->bssSize;
    for (int cr3Ptr=0;cr3Ptr<1024;cr3Ptr++)
    {
        //if the CR3 page directory has a value, dup the page table at this entry
        if (newCR3[cr3Ptr] != 0)
        {
            for (int page=0;page<1024;page++)
            {
                uintptr_t currPage = (cr3Ptr*0x400000) + (page * 4096) ;
   
                if ( (currPage >= textMin && currPage < textMax)
                  || (currPage >= dataMin && currPage < dataMax)
                  || (currPage >= tdataMin && currPage < tdataMax)
                  || (currPage >=  bssMin && currPage < bssMax) )
                {
                    uint32_t *newPT = newCR3[cr3Ptr];
                    newPT[page] = 0;
                }
            }
        }
    }
 */
}