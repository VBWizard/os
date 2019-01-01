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
bool libcInitialized = false;

int do_syscall4(int callnum, uint32_t param1, uint32_t param2, uint32_t param3)
{
    int retVal=0;
    SYSCALL4(callnum, param1, param2, param3, retVal);
    return retVal;
}

int do_syscall3(int callnum, uint32_t param1, uint32_t param2)
{
    int retVal=0;
    SYSCALL3(callnum, param1, param2, retVal);
    return retVal;
}

int do_syscall2(int callnum, uint32_t param1)
{
    int retVal=0;
    SYSCALL2(callnum, param1, retVal);
    return retVal;
}

int do_syscall1(int callnum)
{
    int retVal=0;
    SYSCALL1(callnum, retVal);
    return retVal;
}

VISIBLE void __attribute__((constructor)) libc_init()
{
    printdI(DEBUG_LIBC,"***libc_init called\n***");
    if (!libcInitialized)
    {
        initmalloc();
        //processEnvp = envp;
        __asm__("mov %0,[ebp+52]\n":"=a" (processEnvp));
        libcTZ=-4;
        do_syscall1(SYSCALL_INVALID);
        do_syscall2(SYSCALL_REGEXITHANDLER,(uint32_t)&libc_cleanup);
        libcInitialized = true;
        printdI(DEBUG_LIBC,"***libc_init completed\n");
    }
    else
        printI("libc_init called previously, exiting\n");
}

void __attribute__((destructor)) libc_cleanup(void)
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
    
    do_syscall4(SYSCALL_PRINTD, DebugLevel, (uint32_t)format, (uint32_t)args);
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

VISIBLE void modifySignal(int signal, void* sigHandler, int sigData)
{
    do_syscall4(SYSCALL_SETSIGACTION,signal,(uint32_t)sigHandler,sigData);
}

VISIBLE int exec(char* path, int argc, char** argv)
{
    int pid=0;
    //Using the syscall is breaking the stack
//    SYSCALL4(SYSCALL_EXEC,path,argc,argv);
    printdI(DEBUG_LIBC,"libc: exec for %s\n",path);;
    __asm__("push ds\nint 0x80\npop ds\n"
            :"=a" (pid)
            :"a" (0x59),"b" (path),"c" (argc),"d" (argv));
    return pid;
}

VISIBLE int waitpid(uint32_t pid)
{
    return do_syscall2(SYSCALL_WAITFORPID,pid);
}

VISIBLE struct tm* gettime()
{
    uint32_t ticks=0;
    struct tm theTime;
    
    GET_TICKS(ticks);
    return gmtime_r((time_t*)&ticks,&theTime);
}

VISIBLE char* getcwd(char* buf, size_t size)
{
    return (char*)do_syscall3(SYSCALL_GETCWD,(uint32_t)buf,size);
}
