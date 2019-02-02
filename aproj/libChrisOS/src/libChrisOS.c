/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "libChrisOS.h"
#include "time.h"
#include "strings.h"
#include "config.h"

extern void sysEnter_Vector();
bool libcInitialized = false;
char *printBuffer;


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
        printBuffer = mallocI(0x1000);
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
    
    int size = vsprintf(printBuffer, format, args);
    do_syscall3(SYSCALL_WRITE, 1, (uint32_t)printBuffer, size);
    return 0;
}

VISIBLE int printf(const char *format, ...)
{
    va_list args;
    va_start( args, format );
    
    int size = vsprintf(printBuffer, format, args);
    return do_syscall3(SYSCALL_WRITE, 1, (uint32_t)printBuffer, size);
}

int printfI(const char *format, ...)
{
    va_list args;
    va_start( args, format );
    
    int size = vsprintf(printBuffer, format, args);
    return do_syscall3(SYSCALL_WRITE, 1, (uint32_t)printBuffer, size);
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
    va_end(args);
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
    uint32_t retVal = 0;
    //return do_syscall0(SYSCALL_FORK);
    asm("call sysEnter_Vector\n":"=a" (retVal): "a" (SYSCALL_FORK));
    return retVal;
}

VISIBLE int exec(char* path, int argc, char** argv)
{
    int pid=0;
    printdI(DEBUG_LIBC,"libc: exec for %s\n",path);;
    pid = do_syscall3(SYSCALL_EXEC, (uintptr_t)path, argc, (uintptr_t)argv);
    return pid;
}

VISIBLE int execb(char* path)
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
    printdI(DEBUG_LIBC,"libc: execb for %s\n",path);;
    pid = do_syscall3(SYSCALL_EXECNEW, (uintptr_t)program, argc, (uintptr_t)argv);
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
    printdI(DEBUG_LIBC,"libc: execa for %s\n",path);;
    pid = do_syscall3(SYSCALL_EXECNEW, (uintptr_t)path, argc, (uintptr_t)argv);
    return pid;
}

VISIBLE int waitpid(uint32_t pid)
{
    return do_syscall1(SYSCALL_WAITFORPID,pid);
}


VISIBLE void exit (int status)
{
    do_syscall2(SYSCALL_ENDPROCESS, 0, status);
}


VISIBLE char* getcwd(char* buf, size_t size)
{
    return (char*)do_syscall2(SYSCALL_GETCWD,(uint32_t)buf,size);
}


size_t splitI(char *buffer, char *argv[], size_t argv_size)
{
    char *p, *start_of_word;
    int c;
    enum states { DULL, IN_WORD, IN_STRING } state = DULL;
    size_t argc = 0;

    for (p = buffer; argc < argv_size && *p != '\0'; p++) {
        c = (unsigned char) *p;
        switch (state) {
        case DULL:
            if (ISSPACE(c)) {
                continue;
            }

            if (c == '"') {
                state = IN_STRING;
                start_of_word = p + 1; 
                continue;
            }
            state = IN_WORD;
            start_of_word = p;
            continue;

        case IN_STRING:
            if (c == '"') {
                *p = 0;
                argv[argc++] = start_of_word;
                state = DULL;
            }
            continue;

        case IN_WORD:
            if (ISSPACE(c)) {
                *p = 0;
                argv[argc++] = start_of_word;
                state = DULL;
            }
            continue;
        }
    }

    if (state != DULL && argc < argv_size)
        argv[argc++] = start_of_word;

    return argc;
}

VISIBLE size_t split(char *buffer, char *argv[], size_t argv_size)
{
    return splitI(buffer, argv, argv_size);
}

char** cmdlineToArgvI(const char* cmdline, int *argc)
{
    char** argv;
    char cmd[1024];
    char *spacePtr=cmd, *lastSpacePtr=cmd, *quotePtr=cmd;
    char dblquote[2] = {'"',0};
    *argc = 0;
    
    strncpyI(cmd,cmdline,1024);
    strtrimI(cmd);
    do
    {
        quotePtr = strnstrI(spacePtr,dblquote,4000);        //Need to honor double quotes
        spacePtr=strstrI(spacePtr," ");
        if (quotePtr!=0 && (quotePtr <= spacePtr))                            //If a double quote shows up before a space ...
        {
            char *temp = spacePtr;
            spacePtr = strnstrI(quotePtr+1,dblquote,4000);  //Look for the closing double quote
            if (spacePtr>=quotePtr+4000)
                spacePtr = temp;                            //Didn't find it so resume normal processing (space bound)
            else
                spacePtr += 1;                              //Skip the closing quote
        }
        *argc+=1;
        if (spacePtr!=0 && *spacePtr)
            spacePtr++;
    
    } while (spacePtr!=0 && *spacePtr);
    
    argv=mallocI((*argc*MAXPARAMLEN)+(*argc*sizeof(int)));
    int argvPtr=4* *argc;
    spacePtr=cmd;
    for (int cnt=0;cnt<*argc; cnt++)
    {
        argv[cnt]=(char*)argv+argvPtr;
        quotePtr = strnstrI(spacePtr,dblquote,4000);                    //Need to honor double quotes
        if (quotePtr && quotePtr <= spacePtr)                                       //If a double quote shows up before a space ...
        {
            char *temp = spacePtr;
            spacePtr = strnstrI(quotePtr+1,dblquote,4000);              //Look for the closing double quote
            if (spacePtr>=quotePtr+4000)
                spacePtr = temp;                                        //Didn't find it so resume normal processing (space bound)
            else
            {
                strncpyI(argv[cnt],quotePtr+1,spacePtr-lastSpacePtr-2); //parameter value becomes the entire quoted string minus the 2 quotes
            }
        }
        else
        {
            spacePtr=strstrI(spacePtr," ");
            if (spacePtr)
                strncpyI(argv[cnt],lastSpacePtr,spacePtr-lastSpacePtr);
            else
                strncpyI(argv[cnt],lastSpacePtr,strlenI(lastSpacePtr));
            strtrimI(argv[cnt]);
        }
        lastSpacePtr=spacePtr++;
        argvPtr+=MAXPARAMLEN;
    }
    return argv;
}

VISIBLE char** cmdlineToArgv(char* cmdline, int *argc)
{
    return cmdlineToArgvI(cmdline, argc);
}

VISIBLE int test()
{
    return do_syscall0(0);
}