/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "libChrisOS.h"
#include "../../chrisOSKernel/include/signals.h"

extern void sysEnter_Vector();
extern uint32_t* kTicksSinceStart;
int a=123;int b=456; int c=789;

void VISIBLE libc_init(void)
{
    print("libc initialized %u, %u, %u.\n",a,b,c);
    asm("mov eax,0\ncall sysEnter_Vector\n");
}

void initMe()
{
    
}

int VISIBLE print(const char *format, ...)
{
    va_list args;
    //TODO: This needs to be update once the syscall prints to a file pointer, but for now ...

    va_start( args, format );
    //asm("gotohere2: jmp gotohere2\n"::"b" (format), "c" (&args));
    asm("mov eax,0x300\ncall sysEnter_Vector\n"::"b" (format), "c" (args));
    return 0;
}

unsigned int VISIBLE sleep (unsigned int __seconds)
{
    uint32_t currTicks,wakeTicks;
    
    asm("mov eax,0x170\ncall sysEnter_Vector\n":[currTicks] "=a" (currTicks));
    wakeTicks=currTicks+(TICKS_PER_SECOND*__seconds);
//    print("sleep(%u): Starting with currTicks=0x%08X,__seconds, wakeTicks=0x%08X\n",__seconds,currTicks,wakeTicks);
    while (wakeTicks>currTicks)
    {
        //yield the CPU
        asm("mov eax,0x170\ncall sysEnter_Vector\n":[currTicks] "=a" (currTicks));
    }
//    print("sleep(%u): Ticks at return=0x%08X\n",__seconds,currTicks);
    return 0;
}

void stop()
{
        asm("call sysEnter_Vector\n"::"a" (0x168));
}