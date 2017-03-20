/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "syscall.h"
#include "printf.h"

#define KBRD_INTRFC 0x64
/* keyboard interface bits */
#define KBRD_BIT_KDATA 0 /* keyboard data is in buffer (output buffer is empty) (bit 0) */
#define KBRD_BIT_UDATA 1 /* user data is in buffer (command buffer is empty) (bit 1) */
#define KBRD_IO 0x60 /* keyboard IO port */
#define KBRD_RESET 0xFE /* reset CPU command */
#define bit(n) (1<<(n)) /* Set bit n to 1 */
#define check_flag(flags, n) ((flags) & bit(n))

void _sysCall(uint32_t callNum, uint32_t param1, uint32_t param2, uint32_t param3)
{
    uint32_t processCR3;
    va_list ap;
    uint32_t retVal;
    
    __asm__("mov %[cr3],cr3":[cr3] "=a" (processCR3));
    //printd(DEBUG_PROCESS,"In _sysCall, callNum=0x%08X\n",callNum);
    __asm__("cli\n");
    switch (callNum)
    {
        case 0x0:
            printd(DEBUG_PROCESS,"_syscall: Called with CallNum=0x%08X, invalid call number.\n",callNum);
            break;
        case 0x1:       //exit
             //Get back home
             __asm__("mov eax,0x10;mov ds,eax;mov es,eax;mov fs,eax;mov gs,eax\n");
             __asm__("mov cr3,%[cr3]\n"::[cr3] "a" (KERNEL_CR3));
             printd(DEBUG_PROCESS,"syscall: Ending process with CR3=0x%08X\n",processCR3);
             markTaskEnded(processCR3);
             printd(DEBUG_PROCESS,"syscall: The process is dead, long live the process!\n");
             //****DESTROY STUFF HERE****
             //When a task is ended, the scheduler is will deal with it on the next tick, so lets wait for that to happen
             __asm__("sysCallIdleLoop: sti;hlt;jmp sysCallIdleLoop");
             panic("_syscall: exit call, continued after halt!");
             __asm__("mov eax,0xbad;mov ebx,0xbad;mov ecx,0xbad; mov edx,0xbad\nhlt\n");               //We should never get here
            break;
        case 0x168:
            printd(DEBUG_PROCESS,"_syscall: SIG_STOP called.\n");
            sys_sigaction(SIG_STOP,0,0);
            break;
        case 0x169:
            sysReboot();
            break;
        case 0x170:
            retVal=*kTicksSinceStart;
            break;
        case 0x300:
            va_copy(ap,(va_list*)(param2));
            printu((const char*)param1, ap);
            break;
        default:
            panic("_syscall: Invalid call number 0x%04X\n",callNum);
    }
    //__asm__("mov esp,ebp;add esp,4;ret"); /* BLACK MAGIC! */
    __asm__("sti\nmov eax,%0\nmov esp,ebp;add esp,4;ret"::"r" (retVal)); /* BLACK MAGIC! */

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
