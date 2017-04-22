/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "libChrisOS.h"
#include "syscalls.h"
#include "time.h"
#include "stdio.h"

extern void sysEnter_Vector();
int a=123;int b=456; int c=789;

int do_syscall4(int callnum, uint32_t param1, uint32_t param2, uint32_t param3)
{
    int retVal=0;
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum), "b" (param1), "c" (param2), "d" (param3));
    return retVal;
}

int do_syscall3(int callnum, uint32_t param1, uint32_t param2)
{
    int retVal=0;
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum), "b" (param1), "c" (param2));
    return retVal;
}

int do_syscall2(int callnum, uint32_t param1)
{
    int retVal=0;
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum), "b" (param1));
    return retVal;
}

int do_syscall1(int callnum)
{
    int retVal=0;
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum));
    return retVal;
}

VISIBLE void libc_init(void)
{
    printdI(DEBUG_LIBC,"***Initializing libc\n***");
    initmalloc();
    libcTZ=-4;
    do_syscall1(SYSCALL_INVALID);
    do_syscall2(SYSCALL_REGEXITHANDLER,(uint32_t)&libc_cleanup);
}

void libc_cleanup(void)
{
    malloc_cleanup();
}

VISIBLE int print(const char *format, ...)
{
    va_list args;
    va_start( args, format );
    do_syscall3(SYSCALL_PRINT,(uint32_t)format,(uint32_t)args);
    return 0;
}

int printI(const char *format, ...)
{
    va_list args;
    va_start( args, format );
    do_syscall3(SYSCALL_PRINT,(uint32_t)format,(uint32_t)args);
    return 0;
}

int printdI(uint32_t DebugLevel, const char *format, ...)
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
    do_syscall1(SYSCALL_STOP);
}

void modifySignal(int signal, void* sigHandler, int sigData)
{
    do_syscall4(SYSCALL_SETSIGACTION,signal,(uint32_t)sigHandler,sigData);
}

VISIBLE int exec(char* path, int argc, char** argv)
{
    int pid=0;
    //Using the syscall is breaking the stack
//    SYSCALL4(SYSCALL_EXEC,path,argc,argv);
    __asm__("int 0x80\n"
            :"=a" (pid)
            :"a" (0x59),"b" (path),"c" (argc),"d" (argv));
    return pid;
}

VISIBLE void waitpid(uint32_t pid)
{
    do_syscall2(SYSCALL_WAITFORPID,pid);
}

VISIBLE struct tm* gettime()
{
    uint32_t ticks=0;
    struct tm theTime;
    do_syscall2(SYSCALL_GETTICKS,ticks);
    return gmtime_r((time_t*)&ticks,&theTime);
}

VISIBLE char* getcwd(char* buf, size_t size)
{
    return (char*)do_syscall3(SYSCALL_GETCWD,(uint32_t)buf,size);
}