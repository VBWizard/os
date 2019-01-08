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


int do_syscall4(int callnum, uint32_t param1, uint32_t param2, uint32_t param3, uint32_t param4)
{
    int retVal=0;
    SYSCALL4(callnum, param1, param2, param3, param4, retVal);
    return retVal;
}

int do_syscall3(int callnum, uint32_t param1, uint32_t param2, uint32_t param3)
{
    int retVal=0;
    SYSCALL3(callnum, param1, param2, param3, retVal);
    return retVal;
}

int do_syscall2(int callnum, uint32_t param1, uint32_t param2)
{
    int retVal=0;
    SYSCALL2(callnum, param1, param2, retVal);
    return retVal;
}

int do_syscall1(int callnum, uint32_t param1)
{
    int retVal=0;
    SYSCALL1(callnum, param1, retVal);
    return retVal;
}

int do_syscall0(int callnum)
{
    int retVal=0;
    SYSCALL0(callnum, retVal);
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
        do_syscall0(SYSCALL_INVALID);
        do_syscall1(SYSCALL_REGEXITHANDLER,(uint32_t)&libc_cleanup);
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
    do_syscall2(SYSCALL_PRINT,(uint32_t)format,(uint32_t)args);
    return 0;
}

int printI(const char *format, ...)
{
    va_list args;
    va_start( args, format );
    do_syscall2(SYSCALL_PRINT,(uint32_t)format,(uint32_t)args);
    return 0;
}

int printdI(uint32_t DebugLevel, const char *format, ...)
{
    va_list args;
    va_start( args, format );
    
    do_syscall3(SYSCALL_PRINTD, DebugLevel, (uint32_t)format, (uint32_t)args);
    return 0;
}

VISIBLE unsigned int sleep (unsigned int __seconds)
{
    SLEEP_SECONDS(__seconds)
    return 0;
}

void stop()
{
    do_syscall0(SYSCALL_STOP);
}

VISIBLE void modifySignal(int signal, void* sigHandler, int sigData)
{
    do_syscall3(SYSCALL_SETSIGACTION,signal,(uint32_t)sigHandler,sigData);
}

VISIBLE int fork()
{
    return do_syscall0(SYSCALL_FORK);
}

VISIBLE int exec(char* path)
{
    int pid=0, argc=0;
    char** argv;
    char* spacePtr=path, *lastSpacePtr=path;
    char* program;
    program=mallocI(512);
    do
    {
        spacePtr=strstrI(spacePtr," ");
        if (argc==0)
        {
            if (spacePtr==0)
                strncpyI(program, path, strlenI(path));
            else
                strncpyI(program, path, spacePtr-path);
        }
        argc++;
            
    } while (spacePtr++);
    
    argv=mallocI((argc*50)+(argc*4));
    int argvPtr=4*argc;
    spacePtr=path;
    for (int cnt=0;cnt<argc; cnt++)
    {
        argv[cnt]=(char*)argv+argvPtr;
        spacePtr=strstrI(spacePtr," ");
        if (spacePtr)
            strncpyI(argv[cnt],lastSpacePtr,spacePtr-lastSpacePtr);
        else
            strncpyI(argv[cnt],lastSpacePtr,strlenI(lastSpacePtr));
        strtrimI(argv[cnt]);
        lastSpacePtr=spacePtr++;
        argvPtr+=50;
    }
    printdI(DEBUG_LIBC,"libc: executing for %s\n",path);;
    pid = do_syscall3(SYSCALL_EXEC, (uintptr_t)program, argc, (uintptr_t)argv);
/*    __asm__("push ds\nint 0x80\npop ds\n"
            :"=a" (pid)
            :"a" (0x59),"b" (program),"c" (argc),"d" (argv));*/
    return pid;
    freeI(argv);
    freeI(program);
}

VISIBLE int execa(char* path, int argc, char** argv)
{
    int pid=0;
    //Using the syscall is breaking the stack
//    SYSCALL3(SYSCALL_EXEC,path,argc,argv);
    printdI(DEBUG_LIBC,"libc: exec for %s\n",path);;
    pid = do_syscall3(SYSCALL_EXEC, (uintptr_t)path, argc, (uintptr_t)argv);
/*    __asm__("push ds\nint 0x80\npop ds\n"
            :"=a" (pid)
            :"a" (0x59),"b" (path),"c" (argc),"d" (argv));*/
    return pid;
}

VISIBLE int waitpid(uint32_t pid)
{
    return do_syscall1(SYSCALL_WAITFORPID,pid);
}

VISIBLE char* getcwd(char* buf, size_t size)
{
    return (char*)do_syscall2(SYSCALL_GETCWD,(uint32_t)buf,size);
}
