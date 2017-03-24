/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "libChrisOS.h"
#include "../../chrisOSKernel/include/signals.h"


extern void sysEnter_Vector();
int a=123;int b=456; int c=789;

void VISIBLE libc_init(void)
{
    initmalloc();
    print("libc initialized %u, %u, %u.\n",a,b,c);
    asm("mov eax,0\ncall sysEnter_Vector\n");
}


int VISIBLE print(const char *format, ...)
{
    va_list args;
    va_start( args, format );
    asm("mov eax,0x300\ncall sysEnter_Vector\n"::"b" (format), "c" (args));
    return 0;
}

int VISIBLE printDebug(uint32_t DebugLevel, const char *format, ...)
{
    va_list args;
    va_start( args, format );
    asm("mov eax,0x301\ncall sysEnter_Vector\n"::"b" (DebugLevel), "c" (format), "d" (args));
    return 0;
}

unsigned int VISIBLE sleep (unsigned int __seconds)
{
    uint32_t currTicks,wakeTicks;
    
    asm("mov eax,0x170\ncall sysEnter_Vector\n":[currTicks] "=a" (currTicks));
    __seconds=(__seconds*TICKS_PER_SECOND)+currTicks;
    asm("call sysEnter_Vector\n"::"a" (0x166), "b" (__seconds), "c" (0), "d" (0));

/*    asm("mov eax,0x170\ncall sysEnter_Vector\n":[currTicks] "=a" (currTicks));
    wakeTicks=currTicks+(TICKS_PER_SECOND*__seconds);
    print("sleep(%u): Starting with currTicks=0x%08X,__seconds, wakeTicks=0x%08X\n",__seconds,currTicks,wakeTicks);
    while (wakeTicks>currTicks)
    {
        //yield the CPU
        asm("mov eax,0x170\ncall sysEnter_Vector\n":[currTicks] "=a" (currTicks));
    }
    print("sleep(%u): Ticks at return=0x%08X\n",__seconds,currTicks);
*/    return 0;
}

void stop()
{
        asm("call sysEnter_Vector\n"::"a" (0x168));
}

void modifySignal(int signal, void* sigHandler, int sigData)
{
    asm("call sysEnter_Vector\n"::"a" (0x167), "b" (signal), "c" (sigHandler), "d" (sigData));
}