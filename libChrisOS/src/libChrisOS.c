/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "libChrisOS.h"

extern void sysEnter_Vector();
int a=123;int b=456; int c=789;

VISIBLE void libc_init(void)
{
    initmalloc();
    SYSCALL1(SYSCALL_INVALID)
    SYSCALL2(SYSCALL_REGEXITHANDLER,&libc_cleanup)
}

void libc_cleanup(void)
{
    malloc_cleanup();
}

VISIBLE int print(const char *format, ...)
{
    va_list args;
    va_start( args, format );
    SYSCALL3(SYSCALL_PRINT,format,args);
    return 0;
}

VISIBLE int printDebug(uint32_t DebugLevel, const char *format, ...)
{
    va_list args;
    va_start( args, format );
    asm("mov eax,0x301\ncall sysEnter_Vector\n"::"b" (DebugLevel), "c" (format), "d" (args));
    return 0;
}

VISIBLE unsigned int sleep (unsigned int __seconds)
{
    SLEEP_SECONDS(__seconds)
    return 0;
}

void stop()
{
    SYSCALL1(SYSCALL_STOP)
}

void modifySignal(int signal, void* sigHandler, int sigData)
{
    SYSCALL4(SYSCALL_SETSIGACTION,signal,sigHandler,sigData)
}

VISIBLE void exec(char* path, int argc, char** argv)
{
    print("libc_exec: Not implemented, see 0x80 call in kshell");
    execError: goto execError;
    
}

VISIBLE void waitpid(uint32_t pid)
{
    SYSCALL2(SYSCALL_WAITFORPID,pid)
}