/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "syscall.h"
#include "syscalls.h"
#include "printf.h"
#include "signals.h"
#include "kmalloc.h"
#include "process.h"
#include "fs.h"
#include "schedule.h"
#include "filesystem/pipe.h"
#include "kutility.h"
#include "mmap.h"
#include "thesignals.h"

//#include "fs.h" - CLR 04/23/2018: Commented out

#define KBRD_INTRFC 0x64
/* keyboard interface bits */
#define KBRD_BIT_KDATA 0 /* keyboard data is in buffer (output buffer is empty) (bit 0) */
#define KBRD_BIT_UDATA 1 /* user data is in buffer (command buffer is empty) (bit 1) */
#define KBRD_IO 0x60 /* keyboard IO port */
#define KBRD_RESET 0xFE /* reset CPU command */
#define bit(n) (1<<(n)) /* Set bit n to 1 */
#define check_flag(flags, n) ((flags) & bit(n))

extern int kTimeZone;
extern time_t kSystemCurrentTime;
char* processGetCWD(char* buf, unsigned long size);


//NOTE: Upon entering _sysCall, the process' CR3 is still being used
void _sysCall(uint32_t callNum, uint32_t param1, uint32_t param2, uint32_t param3)
{
    va_list ap;
    uint32_t retVal = 0;
    void* parentProcess;
    process_t* process;
    task_t* task;
    char test[2][50];
    char* testp[2];
    uint32_t param4;
    uint32_t processCR3;  //NOTE: Moved from module level to here because this needs to be a stack variable for fork()
    bool taskExited = false;
    bool useExisting = false;
    uintptr_t *genericFileHandle;
    syscall_mmap_t mmap_params;
    
    __asm__("mov eax,esi\n": "=a" (param4));
    __asm__("mov eax,cr3\n": "=a" (processCR3));
    __asm__("cli\n");
    printd(DEBUG_PROCESS, "_syscall: call for 0x%04x, CR3=0x%08x\n",callNum, processCR3);
    switch (callNum)
    {
        case 0x0:       //***Invalid call #
            printd(DEBUG_PROCESS,"_syscall: Called with CallNum=0x%08x, invalid call number. (cr3=0x%08x)\n",callNum,processCR3);
            retVal = processCR3;
            break;
        case SYSCALL_ENDPROCESS:       //***exit
            __asm__("mov eax,0x10;mov ds,eax;mov es,eax;mov fs,eax;mov gs,eax\n");
             __asm__("mov cr3,%[cr3]\n"::[cr3] "a" (KERNEL_CR3));
             if (param1==0)
                 param1=processCR3;
             printd(DEBUG_PROCESS,"syscall: Ending process with CR3=0x%08x with return value %u\n",param1,param2);
             markTaskEnded(param1, param2);
             panic("_syscall: exit call, continued after halt!");
             __asm__("mov eax,0xbadbadba;mov ebx,0xbadbadba;mov ecx,0xbadbadba; mov edx,0xbadbadba\n\cli\nhlt\n");               //We should never get here
            break;
        case SYSCALL_FORK:
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            process=getCurrentProcess();
            printd(DEBUG_PROCESS,"syscall: Fork called by %s-%u\n", process->path, process->childNumber);
            retVal=process_fork(process);
            if (process->lastChildCR3 > 0)
            {
                uint32_t temp = process->lastChildCR3;
                process->lastChildCR3 = 0;
                __asm__("mov cr3,eax\n"::"a" (temp));
            }
            else
                //__asm__("mov cr3, eax\n"::"a" (process->pageDirPtr));
                __asm__("mov cr3,eax\n"::"a" (processCR3));
            //__asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_OPEN: //param1=path, param2=mode
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            retVal=(uint32_t)fs_open((char*)param1, (char*)param2);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_CLOSE: //param1=handle
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            fs_close((void*)param1);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_READ:       //***read from descriptor, param1 = descriptor #
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            process=getCurrentProcess();
            genericFileHandle = (uintptr_t*)param1;
            if (genericFileHandle == (uintptr_t*)STDIN_FILE)
                genericFileHandle = process->stdin;
            retVal=fs_read(process, genericFileHandle, (void*)param2, param3, 1);
            printd(DEBUG_FILESYS, "_sysCall: read() returning %u bytes to %s from %s\n",retVal, process->exename, ((file_t*)genericFileHandle)->f_path);
                __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_WRITE:       //***write to descriptor, param1 = descriptor #, param2 = string to write
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            process=getCurrentProcess();
            genericFileHandle = (uintptr_t*)param1;
            if (genericFileHandle == (uintptr_t*)STDOUT_FILE)
                genericFileHandle = process->stdout;
            retVal=fs_write(process, genericFileHandle, (void*)param2, param3, 1);
            printd(DEBUG_FILESYS, "_sysCall: write() wrote %u bytes to %s from %s\n",retVal, ((file_t*)genericFileHandle)->f_path, process->exename);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            if (*((char*)param2) == '\n')
                retVal = 22;
            break;
        case SYSCALL_PIPE:
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            process=getCurrentProcess();
            retVal = fs_pipe(process, (int*)param1);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;

        case SYSCALL_MMAP:
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            process=getCurrentProcess();
            retVal = syscall_mmap(process, (syscall_mmap_t*)param1);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
            
            
        case SYSCALL_SEEK:
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            retVal = fs_seek((void*)param1, param2, param3);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_GETDENTS:
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            process=getCurrentProcess();
            retVal = getDirEntries(process, (char*)param1, (void*)param2, param3);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_GETCWD:    //param1=buffer *, param2=size of buffer
            retVal=(uint32_t)processGetCWD((char*)param1,param2);
            break;
        case SYSCALL_EXEC:
        case SYSCALL_EXECNEW:      //***exec: param1=program path
            if (callNum == SYSCALL_EXEC)
                useExisting = true;
            else
                useExisting = false;
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            parentProcess=getCurrentProcess();
            printd(DEBUG_PROCESS,"_sysCall: createProcess(%s,0x%08x,0x%08x,0x%08x,%u)\n",param1,param2,param3,parentProcess, useExisting);
            process = createProcess((char*)param1, param2, (char**)param3, parentProcess, false, useExisting);
            if (process!=NULL)
            {
                retVal=process->task->taskNum;
                printd(DEBUG_PROCESS, "_sysCall: createProcess returning 0x%04X\n",retVal);
            }
            else
                retVal=0;
            __asm__("mov cr3,eax"::"a" (processCR3));
            break;
        case SYSCALL_WAITFORPID:      //***waitForPID - param1=pid to check
            LOAD_KERNEL_CR3;
            //Find out if the PID to be waited on has already exited
            task = findTaskByTaskNum(param1);
            //If it has
            if (task->taskState == TASK_EXITED)
            {
                //Set the return value that we'll pass back
                retVal = ((process_t*)task->process)->retVal;
                taskExited = true;
            }
            else //Otherwise
                taskExited = false;
            LOAD_CR3(processCR3);
            //Only wait for the PID if it hasn't already exited
            if (!taskExited)
            {
                __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
                process=getCurrentProcess();
                printd(DEBUG_PROCESS,"_syscall: waitForPID signalling SIG_USLEEP for current task (cr3=0x%08x) on pid=0x%04X.  Good night!\n",processCR3,param1);
                retVal = (uint32_t)sys_sigaction(SIGUSLEEP,0,param1, process);
                __asm__("mov cr3,eax\n"::"a" (processCR3));
            }
            break;
        case SYSCALL_SETPRIORITY:      //***Set process priority - param1=new priority, returns old priority
            retVal=sys_setpriority(getCurrentProcess(),param1);
            break;
        case SYSCALL_REGEXITHANDLER:     //***Register exit handler
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            processRegExit(getCurrentProcess(),(void*)param1);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_FREE:     //***free - free system mory
            //__asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            printd(DEBUG_PROCESS,"_syscall: free(0x%08x) called, NOT IMPLEMENTED (cr3=0x%08x)\n",param1,processCR3);
            //__asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_ALLOC:     //***mallocI - allocate system memory
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            retVal=(uint32_t)mallocI(processCR3,param1);
            printd(DEBUG_PROCESS,"_syscall: malloc(0x%08x) returned 0x%08x (cr3=0x%08x)\n",param1,retVal,processCR3);
            //printd(DEBUG_PROCESS,"_syscall: malloc returning 0x%08x\n",retVal);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_SLEEP:     //***sleep - sleep until kTicksSinceStart==param1
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            process=getCurrentProcess();
            printd(DEBUG_PROCESS,"_syscall: sleep(0x%08x) called (cr3=0x%08x)\n",param1,processCR3);
            sys_sigaction(SIGSLEEP,0,param1, process);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_SETSIGACTION:     //***setsigaction
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            printd(DEBUG_PROCESS,"_syscall: sys_setsigaction(0x%08x, 0x%08x, 0x%08x) called\n",param1,param2,param3);
            sys_setsigaction(param1,(uintptr_t*)param2,param3);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_STOP:     //******stop - put process in STOPPED queue
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            process=getCurrentProcess();
            printd(DEBUG_PROCESS,"_syscall: Stop() called.\n");
            sys_sigaction(SIGSTOP,0,0, process);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case SYSCALL_REBOOT:     //***reboot
            sysReboot();
            break;
        case SYSCALL_GETTICKS:     //***ticks - return current system ticks
            retVal=*kTicksSinceStart;
            //retVal2=kTimeZone;
            break;
        case SYSCALL_PRINT:     //sys_print (prints to screen)
            va_copy(ap,(va_list*)(param2));
            //printd(DEBUG_PROCESS,"_syscall: print(0x%08x,0x%08x)\n",param1,&param2,processCR3);
            //printf((char*)param1, ap);
            char printf_buf[1024];
            memset(printf_buf,0,1024);
            retVal = vsprintf(printf_buf, param1, ap);
            putString(printf_buf);

            //printu((const char*)param1, ap);
            break;
        case SYSCALL_PRINTD: //printd: Debug print - param1 debuglevel, param2 format, param3 args
            //printd(DEBUG_PROCESS,"_syscall: printd(0x%08x,0x%08x,0x%08x)\n",param1,&param2,param3);
            printdExternal(param1, (const char*)param2, param3);
            break;
        case SYSCALL_HLT:     //***hlt - execute hlt instruction
            __asm__("sti;hlt;");
            break;
        case SYSCALL_MASKSIG: //sys_masksig (masks/unmasks an individual signal for the running process)
            sys_masksig(param1, param2);
            break;
        case SYSCALL_GETTIME:
            retVal = kSystemCurrentTime;
            break;
        default:
            panic("_syscall: Invalid call number 0x%04X\n",callNum);
    }
    //__asm__("mov esp,ebp;add esp,4;ret"); /* BLACK MAGIC! */
    if (CURRENT_CR3==KERNEL_CR3)
        panic("_syscall: CR3 set to kernel CR3 on exit\n");
    __asm__("sti\nmov esp,ebp\nadd esp,4\nret\n"::"a" (retVal)); /* BLACK MAGIC! */

}

void syscall169()
{
    uint8_t temp;
 
    __asm__ volatile ("cli"); /* disable all interrupts */
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
    goto loop; /* if a NMI is received, halt again */
}
