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
#include "thesignals.h"
#include "syscalls.h"
#include "alloc.h"
#include "schedule.h"
#include "mmap.h"
#include "task.h"

extern time_t kSystemCurrentTime;
extern task_t* submitNewTask(task_t *task);
extern uint64_t kIdleTicks;
extern uintptr_t *qRunnable;
void CoWProcess(process_t* process);
void dupPageTables(process_t* newProcess, process_t* currProcess);
process_t* kKernelProcess;
extern void _schedule();

#define PAGE_USER_READABLE 0x4
#define PAGE_USER_WRITABLE 0x6           //0x4 for "User" | 0x2 for "Writable"
#define PAGE_PRESENT 0x1
#define GET_PROCESS_POINTER(process) {process=(process_t*)(PROCESS_STRUCT_VADDR);process=(process_t*)process->this;} //Use the process' virtual process pointer to get the kernel friendly pointer to the process
#define PATH_MAX 512

uintptr_t userCR3=0;

process_t *getCurrentProcess()
{
    uint32_t taskNum;
    process_t* process;
    __asm__("str eax\nshr eax,3\n":"=a" (taskNum)); 
    process = findTaskByTaskNum(taskNum)->process;
    return process;
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
    uint32_t taskNum;
    LOAD_KERNEL_CR3;
    __asm__("str eax\n":"=a" (taskNum));
    taskNum>>=3;
    process=findTaskByTaskNum(taskNum);
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
    //Can't save endTime here because we had to change VADDR to be read-only for ring 3
    //gmtime_r((time_t*)&kSystemCurrentTime,&process->endTime);
    
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

void processIdleLoop()
{
    uint32_t cr3=0;
    
    __asm__("mov eax,cr3\n":"=a" (cr3));
    process_t* process=findTaskByCR3(cr3)->process;
    sys_setpriority(process,20);
    //Block idle task SIGINT ... default action for SIGINT is to kill the process
    sys_masksig(SIGINT,1);
    while (1==1)
    {
/*        if (++kIdleTicks % 10 == 0)
            printd(DEBUG_PROCESS,"IDLE TASK: Idle ticks = %u\n",kIdleTicks);*/
        __asm__("sti;hlt;");
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
    process->heapStart=PROCESS_HEAP_START;
    process->heapEnd=PROCESS_HEAP_START;
    process->path=(char*)kMalloc(0x1000); 
    printd(DEBUG_PROCESS,"createProcess: Malloc'd 0x%08x for process->path\n",process->path);
    process->cwd=allocPagesAndMap(PAGE_SIZE);
    process->task->process=process;
    process->processSyscallESP=process->task->tss->ESP1;
    process->priority=PROCESS_DEFAULT_PRIORITY;
    printd(DEBUG_PROCESS,"Mapping the process struct into the process, v=0x%08x, p=0x%08x\n",PROCESS_STRUCT_VADDR,process);
    pagingMapPage(process->task->tss->CR3, PROCESS_STRUCT_VADDR, (uint32_t)process & 0xFFFFF000, 0x5); //FIX ME!!!  Had to change to 0x7 for sys_sigaction2 USLEEP
    pagingMapPage(process->task->tss->CR3, process->task, process->task, 0x5);

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
    process->execDontSaveRegisters = false;
    return process;
}

//NOTE: if initialize parameter is passed as false, parentProcessPtr is the pointer to the process to use
//NOT to its parent. In this case:
//      1) If the process' real parent is NULL then we will free some resources
//      2) We will leave the environment alone (i.e. not pass argc and argv)
//      3) 
process_t* createProcess(char* path, int argc, char** argv, process_t* parentProcessPtr, bool isKernelProcess, bool useExistingProcess)
{

    process_t* process;

    //Disable the scheduler or it will invariably try to schedule this task off the CPU before we're done reloading it
    if (useExistingProcess)
        disableScheduler();
    //TODO: If useExistingProcess, we should remove the text, data, tdata and bss mappings from the CR3 
    //since we're replacing those segments
    
    printd(DEBUG_PROCESS,"Creating %s process for %s\n",isKernelProcess?"kernel":"user",path);
    
    //If useExistingProcess then we'll not initialize a new one
    if (useExistingProcess)
        process = parentProcessPtr;
    else
        process = initializeProcess(isKernelProcess);
    
    //We will always load startHandlers whether we're createing a process or just loading into it
    process->startHandlerPtr=0; //CLR 12/23/2018: Initialize the start handler pointer to the first entry

    process->path=(char*)kMalloc(0x1000); 

    //Copy the path (parameter) value from the parent's memory.
    if (parentProcessPtr!=NULL && parentProcessPtr->pageDirPtr!=0)
    {
        if (parentProcessPtr->pageDirPtr!=KERNEL_CR3)
           copyToKernel(parentProcessPtr,process->path,path,PATH_MAX);
    }
    else
        strcpy(process->path,path);
    printd(DEBUG_PROCESS,"process->path (0x%08x)=%s\n",process->path,process->path);
   
    //Always set the elf to NULL, even when useExistingProcess, because we don't want to disturb the paren't elf
    process->elf=NULL;
    gmtime_r((time_t*)&kSystemCurrentTime,&process->startTime);
    
    //Initialize the current working directory and set it to '/'
    memset(process->cwd,0,PAGE_SIZE);
    strcpy(process->cwd,"/");
    
    if (useExistingProcess)
    {
       process->parent=parentProcessPtr->parent;
       process->kernelProcess=((process_t*)process->parent)->kernelProcess;
       process->stdin=((process_t*)parentProcessPtr)->stdin;
       process->stdout=((process_t*)parentProcessPtr)->stdout;
       process->stderr=((process_t*)parentProcessPtr)->stderr;
    }
    else if (parentProcessPtr != NULL)
    {
       process->parent=parentProcessPtr;
       process->kernelProcess=((process_t*)process->parent)->kernelProcess;
       process->stdin=((process_t*)parentProcessPtr)->stdin;
       process->stdout=((process_t*)parentProcessPtr)->stdout;
       process->stderr=((process_t*)parentProcessPtr)->stderr;
    }
    else
    {
       process->kernelProcess=isKernelProcess;
       process->stdin=0;
       process->stdout=1;
       process->stderr=2;
    }
    
    //Not sure if this should be re-initialized for execve'd program
    process->mmaps=kMalloc(sizeof(dllist_t));
    
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
        process->argv=(uintptr_t)allocPages(50*argc+(4*argc));
        pagingMapPageCount(KERNEL_CR3, process->argv, process->argv, ((50*argc+(4*argc))/PAGE_SIZE)+1,0x7,true);
        printd(DEBUG_PROCESS,"Retrieving argv parameter values from parent process\n");
        //processCopyArgV((char**)process->argv,(char**)argv,argvVirt,argc);
        uint32_t argcPtr=argc*4; //start at the end of the pointer
        uint32_t argvVal=(char*)process->argv;
        for (int cnt=0;cnt<argc;cnt++)
        {
            //argv[cnt] = address of argv + # of arguments * 8 (char**) + 
            process->argv[cnt]=(char*)process->argv+argcPtr;
            if (useExistingProcess)
                memcpy(process->argv[cnt],argv[cnt],50);
            else
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
    else
    {
        //The reason kSHell throws a paging exception when you type an invalid filename is because we remove the program segment mappings
        //before attempting to load the new executable, so if the new executable fails to load and we try to return to the calling program,
        //we can't.  (our program was unmapped!)
        //This is our temporary fix to the problem.  Try to open the file and if it fails, return before unmapping!
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
        process->elf=sysLoadElf(process->path, process->elf, process->task->tss->CR3);
        if (!process->elf->loadCompleted)
        {
            if (useExistingProcess)
                enableScheduler();
            return NULL;
        }
        //CLR 12/23/2018: point to processStart ... which will initialize anything that needs to be initialized 
        //and then jump into the loaded program
        process->entryPoint = process->elf->hdr.e_entry;
        //process->task->tss->EIP=process->elf->hdr.e_entry;
        process->task->tss->EIP=(uint32_t)&processStart;
        //Get processStart handlers
        process->startHandlerPtr = 0;
        for (int cnt=0;cnt<process->elf->libraryElfCount;cnt++)
        {
            elfInfo_t* lElf = (elfInfo_t*)process->elf->libraryElfPtr[cnt];
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
        enableScheduler();
        triggerScheduler();
        __asm__("sti\nhlt\nhlt\nhlt\nhlt\nhlt\n");
    }
    else
    {
        process->task=submitNewTask(process->task);
        printd(DEBUG_PROCESS,"Submitted process 0x%04X to be run\n",process->task->taskNum);
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
    
    __asm__("cli\n");
    dupPageTables(newProcess, currProcess); //Duplicates the current process' page tables to the new one

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
    pagingMapPage(newProcess->task->tss->CR3,(uintptr_t)newProcess->task->tss,(uintptr_t)newProcess->task->tss,0x7);


    //Clone the parent's ESP Stack
/*
    newProcess->stackSize = currProcess->stackSize;
    newProcess->stack1Size = currProcess->stack1Size;
    ((process_t*)newTask->process)->stackStart=kMalloc(newProcess->stackSize);
    //Make the physical addresses of the original ESP stack into virtual addresses in the child's task space
    //So that we can use the cloned stack
    pagingMapPageCount(newTask->tss->CR3,newProcess->stackStart, newProcess->stackStart,currProcess->stackSize/PAGE_SIZE,0x7);  
    //Also map the parent's stack addresses into our space as virtual
    //NOTE: YOu can not both virtually map and CoW an address :-)
    //pagingMapPageCount(newTask->tss->CR3,currProcess->stackStart, newProcess->stackStart,currProcess->stackSize/PAGE_SIZE,0x7);  
    pagingMapPageCount(newTask->tss->CR3,newTask->tss->ESP | KERNEL_PAGED_BASE_ADDRESS,newTask->tss->ESP,0x16,0x7);
    pagingMapPageCount(KERNEL_CR3,newTask->tss->ESP,newTask->tss->ESP,0x16,0x7);
    printd(DEBUG_PROCESS,"process_fork: Allocated task ESP at 0x%08x (0x%08x bytes)\n",newProcess->stackStart,newProcess->stackSize);
    printd(DEBUG_PROCESS,"process_fork: Mapped parent's physical stack addresses to virtual in our address space. (0x%08x-0x%08x)\n",currProcess->stackStart, currProcess->stackStart + currProcess->stackSize);
    memcpy(newProcess->stackStart, currProcess->stackStart, currProcess->stackSize);
*/
    
    //Clone the parent's ESP1 Stack
    ((process_t*)newTask->process)->stack1Start=kMalloc(newProcess->stack1Size);
    newProcess->stack1Size = currProcess->stack1Size;
    pagingMapPageCount(newTask->tss->CR3, newProcess->stack1Start, newProcess->stack1Start, currProcess->stack1Size / PAGE_SIZE, 0x7, true);  //NOTE: the -0x15000 is because after we allocated the stack, we set it 0x15000 forward
    pagingMapPageCount(KERNEL_CR3, newProcess->stack1Start, newProcess->stack1Start, currProcess->stack1Size / PAGE_SIZE, 0x7, true);  //NOTE: the -0x15000 is because after we allocated the stack, we set it 0x15000 forward
    pagingMapPageCount(newTask->tss->CR3, newProcess->stack1Start | KERNEL_PAGED_BASE_ADDRESS, newProcess->stack1Start, 0x16, 0x7, true);
    printd(DEBUG_PROCESS,"process_fork: Allocated task ESP1 for syscall at 0x%08x (0x%08x bytes)\n",newProcess->stack1Start,currProcess->stack1Size);
    newProcess->task->tss->ESP1 = newProcess->stack1Start + newProcess->stack1Size - 0x1000;
    newProcess->processSyscallESP=newProcess->task->tss->ESP1;
    
    //Don't forget to map the new process to VADDR!
    pagingMapPage(newProcess->task->tss->CR3, PROCESS_STRUCT_VADDR, (uint32_t)newProcess & 0xFFFFF000, 0x7); //FIX ME!!!  Had to change to 0x7 for sys_sigaction2 USLEEP
    
    currProcess->lastChildCR3 = newProcess->pageDirPtr;
    newProcess->task->pageDir = (uint32_t*)newProcess->pageDirPtr;

    submitNewTask(newTask);
    returnCount = 0;
    retVal = newTask->taskNum;      //parent gets this
    triggerScheduler();
    __asm__("sti\nhlt\nhlt\nhlt\n\n");
    if (returnCount++ > 0)
        return retVal;
    else
        return 0;
}

void CoWProcess(process_t* process)
{
    printd(DEBUG_PROCESS, "CoWing the child process' copy of the parent's memory\n");
    //CoW the text segment
    if (process->elf->textAddress>0)
    {
        sys_mmapI(process, (uintptr_t*)(process->elf->textAddress & 0xFFFFF000), process->elf->textSize, PROT_EXEC, MAP_SHARED | MAP_ANONYMOUS, 0, 0);
        printd(DEBUG_PROCESS, "\tCoW'd the .text at 0x%08x for 0x%08x bytes\n",process->elf->textAddress, process->elf->textSize);
    }
    //CoW the bss segment
    if (process->elf->bssAddress>0)
    {
        sys_mmapI(process, (uintptr_t*)(process->elf->bssAddress & 0xFFFFF000), process->elf->bssSize, PROT_READ, MAP_SHARED | MAP_ANONYMOUS, 0, 0);
        printd(DEBUG_PROCESS, "\tCoW'd the .bss at 0x%08x for 0x%08x bytes\n",process->elf->bssAddress, process->elf->bssSize);
    }
    //CoW the data/tata segments
    if (process->elf->dataAddress>0)
    {
        sys_mmapI(process, (uintptr_t*)(process->elf->dataAddress & 0xFFFFF000), process->elf->dataSize, PROT_READ, MAP_SHARED | MAP_ANONYMOUS, 0, 0);
        printd(DEBUG_PROCESS, "\tCoW'd the .data at 0x%08x for 0x%08x bytes\n",process->elf->dataAddress, process->elf->dataSize);
    }
    if (process->elf->tdataAddress>0)
    {
        sys_mmapI(process, (uintptr_t*)(process->elf->tdataAddress & 0xFFFFF000), process->elf->tdataSize, PROT_READ, MAP_SHARED | MAP_ANONYMOUS, 0, 0);
        printd(DEBUG_PROCESS, "\tCoW'd the .tdata at 0x%08x for 0x%08x bytes\n",process->elf->tdataAddress, process->elf->tdataSize);
    }
    //CoW the heap segment
    if (process->heapEnd - process->heapStart > 0)
    {
        sys_mmapI(process, (uintptr_t*)(process->heapStart & 0xFFFFF000), process->heapEnd - process->heapStart, PROT_READ, MAP_SHARED | MAP_ANONYMOUS, 0, 0);
        printd(DEBUG_PROCESS, "\tCoW'd the .heap at 0x%08x for 0x%08x bytes\n",process->heapStart, process->heapEnd - process->heapStart);
    }
    sys_mmapI(process, (uintptr_t*)(process->stackStart & 0xFFFFF000), process->stackSize, PROT_READ, MAP_SHARED | MAP_ANONYMOUS, 0, 0);
    printd(DEBUG_PROCESS, "\tCoW'd the stack at 0x%08x for 0x%08x bytes\n",process->stackStart, process->stackSize);
}

void dupPageTables(process_t* newProcess, process_t* currProcess)
{
    newProcess->pageDirPtr = (uint32_t)pagingAllocatePagingTablePage();
    memset(newProcess->pageDirPtr, 0, PAGE_SIZE);
    newProcess->task->tss->CR3 = newProcess->pageDirPtr;
    printd(DEBUG_PROCESS, "\tdupPageTables: Duping page tables from 0x%08x to 0x%08x\n",currProcess->pageDirPtr, newProcess->pageDirPtr);
    pagingMapPage(KERNEL_CR3,newProcess->task->tss->CR3 | KERNEL_PAGED_BASE_ADDRESS,newProcess->task->tss->CR3,0x3);
    pagingMapPage(KERNEL_CR3,newProcess->task->tss->CR3, newProcess->task->tss->CR3,0x3);
    pagingMapPage(newProcess->pageDirPtr,newProcess->task->tss->CR3, newProcess->task->tss->CR3,0x7);

    uint32_t* oldCR3 = (uint32_t*)currProcess->pageDirPtr;
    uint32_t* newCR3 = (uint32_t*)newProcess->pageDirPtr;
    uint32_t textMin = currProcess->elf->textAddress;
    uint32_t textMax = currProcess->elf->textAddress + currProcess->elf->textSize;
    uint32_t dataMin = currProcess->elf->dataAddress;
    uint32_t dataMax = currProcess->elf->dataAddress + currProcess->elf->dataSize;
    uint32_t tdataMin = currProcess->elf->tdataAddress;
    uint32_t tdataMax = currProcess->elf->tdataAddress + currProcess->elf->tdataSize;
    uint32_t bssMin = currProcess->elf->bssAddress;
    uint32_t bssMax = currProcess->elf->bssAddress + currProcess->elf->bssSize;
    
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
            pagingMapPage(KERNEL_CR3,(uint32_t)newPT | KERNEL_PAGED_BASE_ADDRESS,(uint32_t)newPT | ((uint32_t)oldPT | 0x00000FFF),0x3);
            pagingMapPage(KERNEL_CR3, newPT, newPT, (uint32_t)oldPT | 0x00000FFF);
            pagingMapPage(newProcess->pageDirPtr,newPT, newPT,0x7);
            
            //Put the address of the page table in the CR3 page directory
            newCR3[cr3Ptr] = (uint32_t)newPT | ((uint32_t)oldPT & 0x00000FFF);

            //Now iterate the old page table creating entries on the new table where they exist on the old
            //Now dup the page table
            memcpy(newPT, (uint32_t)oldPT & 0xFFFFF000, PAGE_SIZE);
            printd(DEBUG_PROCESS,"\t\tDup'd PT from 0x%08x to 0x%08x\n",(uint32_t)oldPT & 0xFFFFF000, newPT);
        }
    }
}

void removeProgramSegmentMappings(process_t *currProcess, process_t *newProcess)
{
    if (currProcess->elf->textAddress>0)
        pagingMapPageCount(newProcess->pageDirPtr, currProcess->elf->textAddress, 0, currProcess->elf->textSize/PAGE_SIZE+1, 0, false);
    if (currProcess->elf->dataAddress>0)
        pagingMapPageCount(newProcess->pageDirPtr, currProcess->elf->dataAddress, 0, currProcess->elf->dataSize/PAGE_SIZE+1, 0, false);
    if (currProcess->elf->tdataAddress>0)
        pagingMapPageCount(newProcess->pageDirPtr, currProcess->elf->tdataAddress, 0, currProcess->elf->tdataSize/PAGE_SIZE+1, 0, false);
    if (currProcess->elf->bssAddress>0)
        pagingMapPageCount(newProcess->pageDirPtr, currProcess->elf->bssAddress, 0, currProcess->elf->bssSize/PAGE_SIZE+1, 0, false);

 
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