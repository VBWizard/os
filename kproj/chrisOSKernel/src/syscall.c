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
#include "thesignals.h"
#include "fs.h"

#define KBRD_INTRFC 0x64
/* keyboard interface bits */
#define KBRD_BIT_KDATA 0 /* keyboard data is in buffer (output buffer is empty) (bit 0) */
#define KBRD_BIT_UDATA 1 /* user data is in buffer (command buffer is empty) (bit 1) */
#define KBRD_IO 0x60 /* keyboard IO port */
#define KBRD_RESET 0xFE /* reset CPU command */
#define bit(n) (1<<(n)) /* Set bit n to 1 */
#define check_flag(flags, n) ((flags) & bit(n))

extern int kTimeZone;
char* processGetCWD(char* buf, unsigned long size);

//NOTE: Upon entering _sysCall, the process' CR3 is still being used
void _sysCall(uint32_t callNum, uint32_t param1, uint32_t param2, uint32_t param3)
{
    uint32_t processCR3;
    va_list ap;
    uint32_t retVal, retVal2;
    void* parentProcess;
    process_t* process;
    char test[2][50];
    char* testp[2];
    
    __asm__("mov eax,cr3": "=a" (processCR3));
    //printd(DEBUG_PROCESS,"In _sysCall, callNum=0x%08X\n",callNum);
    __asm__("cli\n");
    switch (callNum)
    {
        case 0x0:       //***Invalid call #
            printd(DEBUG_PROCESS,"_syscall: Called with CallNum=0x%08X, invalid call number. (cr3=0x%08X)\n",callNum,processCR3);
            break;
        case 0x1:       //***exit
            __asm__("mov eax,0x10;mov ds,eax;mov es,eax;mov fs,eax;mov gs,eax\n");
             __asm__("mov cr3,%[cr3]\n"::[cr3] "a" (KERNEL_CR3));
             printd(DEBUG_PROCESS,"syscall: Ending process with CR3=0x%08X\n",processCR3);
             markTaskEnded(processCR3, param1);
             printd(DEBUG_PROCESS,"syscall: The process is dead, long live the process!\n");
             //****DESTROY STUFF HERE****
             //When a task is ended, the scheduler is will deal with it on the next tick, so lets wait for that to happen
             __asm__("sysCallIdleLoop: sti;hlt;jmp sysCallIdleLoop");
             panic("_syscall: exit call, continued after halt!");
             __asm__("mov eax,0xbad;mov ebx,0xbad;mov ecx,0xbad; mov edx,0xbad\nhlt\n");               //We should never get here
            break;
        case 0x3:       //***read from descriptor, param1 = descriptor #
            if (param1==STDIN_FILE)
                retVal=getc();
            else
                panic("_sysCall: sys_read for descriptor 0x%08X not implemented\n",param1);
            break;
        case 0x4:       //***write to descriptor, param1 = descriptor #, param2 = string to write
            if (param1==STDOUT_FILE)
            {
                //printd(DEBUG_PROCESS,"_syscall: print(0x%08X,0x%08X)\n",param1,&param2,processCR3);
                printu((const char*)param2, NULL);
            }
            else
                panic("_sysCall: sys_write for descriptor 0x%08X not implemented\n",param1);
            break;
        case SYSCALL_GETCWD:    //param1=buffer *, param2=size of buffer
            retVal=processGetCWD(param1,param2);
            break;
        case 0x59:      //***exec: param1=program path
            __asm__("mov cr3,eax;"::"a" (KERNEL_CR3));
            parentProcess=(process_t*)(findTaskByCR3(processCR3))->process;
            printd(DEBUG_PROCESS,"_sysCall: createProcess(0x%08X,0x%08X,0x%08X,0x%08X,false)\n",param1,param2,param3,parentProcess);
            process = createProcess((char*)param1, param2, param3, parentProcess, false);
            if (process!=NULL)
                retVal=process->task->taskNum;
            else
                retVal=0;
            __asm__("mov cr3,eax"::"a" (processCR3));
            break;
        case 0x61:      //***waitForPID - param1=pid to check
            printd(DEBUG_PROCESS,"_syscall: waitForPID signalling SIG_USLEEP for current task (cr3=0x%08X) on pid=0x%04X.  Good night!\n",processCR3,param1);
            sys_sigaction(SIG_USLEEP,0,param1);
            break;
        case 0x97:      //***Set process priority - param1=new priority, returns old priority
            retVal=sys_setpriority(findTaskByCR3(processCR3)->process,param1);
            break;
        case 0x163:     //***Register exit handler
            __asm__("mov cr3,eax\n"::"a" (KERNEL_CR3));
            processRegExit(findTaskByCR3(processCR3)->process,(void*)param1);
            __asm__("mov cr3,eax\n"::"a" (processCR3));
            break;
        case 0x164:     //***free - free system mory
            //__asm__("mov cr3,eax;"::"a" (KERNEL_CR3));
            printd(DEBUG_PROCESS,"_syscall: free(0x%08X) called, NOT IMPLEMENTED (cr3=0x%08X)\n",param1,processCR3);
            //__asm__("mov cr3,eax;"::"a" (processCR3));
            break;
        case 0x165:     //***mallocI - allocate system memory
            __asm__("mov cr3,eax;"::"a" (KERNEL_CR3));
            retVal=mallocI(processCR3,param1);
            printd(DEBUG_PROCESS,"_syscall: malloc(0x%08X) returned 0x%08X (cr3=0x%08X)\n",param1,retVal,processCR3);
            //printd(DEBUG_PROCESS,"_syscall: malloc returning 0x%08X\n",retVal);
            __asm__("mov cr3,eax;"::"a" (processCR3));
            break;
        case 0x166:     //***sleep - sleep until kTicksSinceStart==param1
            printd(DEBUG_PROCESS,"_syscall: sleep(0x%08X) called (cr3=0x%08X)\n",param1,processCR3);
            sys_sigaction(SIG_SLEEP,0,param1);
            break;
        case 0x167:     //***setsigaction
            printd(DEBUG_PROCESS,"_syscall: sys_setsigaction(0x%08X, 0x%08X, 0x%08X) called\n",param1,param2,param3);
            sys_setsigaction(param1,(uintptr_t*)param2,param3);
            break;
        case 0x168:     //******stop - put process in STOPPED queue
            printd(DEBUG_PROCESS,"_syscall: Stop() called.\n");
            sys_sigaction(SIG_STOP,0,0);
            break;
        case 0x169:     //***reboot
            sysReboot();
            break;
        case 0x170:     //***ticks - return current system ticks
            retVal=*kTicksSinceStart;
            //retVal2=kTimeZone;
            break;
        case 0x300:     //sys_print (prints to screen)
            va_copy(ap,(va_list*)(param2));
            //printd(DEBUG_PROCESS,"_syscall: print(0x%08X,0x%08X)\n",param1,&param2,processCR3);
            printu((const char*)param1, ap);
            break;
        case 0x301: //printd: Debug print - param1 debuglevel, param2 format, param3 args
            //printd(DEBUG_PROCESS,"_syscall: printd(0x%08X,0x%08X,0x%08X)\n",param1,&param2,param3);
            va_copy(ap,(va_list*)(param3));
            printd_valist(param1, (const char*)param2, ap);
            break;
        case 0x302:     //***hlt - execute hlt instruction
            __asm__("sti;hlt;");
            break;
        default:
            panic("_syscall: Invalid call number 0x%04X\n",callNum);
    }
    //__asm__("mov esp,ebp;add esp,4;ret"); /* BLACK MAGIC! */
    __asm__("sti\n\nmov esp,ebp;add esp,4;ret"::"a" (retVal)); /* BLACK MAGIC! */

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
