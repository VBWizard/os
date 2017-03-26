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
    asm("mov eax,0\ncall sysEnter_Vector\n");
    asm("mov eax,0x163\ncall sysEnter_Vector\n"::"b" (&libc_cleanup));
}

void libc_cleanup(void)
{
    malloc_cleanup();
}

VISIBLE int print(const char *format, ...)
{
    va_list args;
    va_start( args, format );
    asm("mov eax,0x300\ncall sysEnter_Vector\n"::"b" (format), "c" (args));
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
        asm("call sysEnter_Vector\n"::"a" (0x168));
}

void modifySignal(int signal, void* sigHandler, int sigData)
{
    asm("call sysEnter_Vector\n"::"a" (0x167), "b" (signal), "c" (sigHandler), "d" (sigData));
}

VISIBLE void exec(char* path, int argc, char** argv)
{
    print("libc_exec: Not implemented, see 0x80 call in kshell");
    execError: goto execError;
    
}

VISIBLE void waitpid(uint32_t pid)
{
    bool isPidBusy=true;
    
    do 
    {
        asm("call sysEnter_Vector\n":"=a" (isPidBusy):"a" (0x61),"b" (pid));    //waitForPID
        if (isPidBusy)
            asm("call sysEnter_Vector\n"::"a" (0x302));         //hlt
    } while (isPidBusy);
}