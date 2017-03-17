/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "libChrisOS.h"

extern void sysEnter_Vector();

void /*VISIBLE*/ libc_init(void)
{
    print("Hi from libc!!!");
    //asm("mov eax,0\ncall sysEnter_Vector\n");
}

void initMe()
{
    
}

int /*VISIBLE*/ print(const char *format, ...)
{
    //TODO: This needs to be update once the syscall prints to a file pointer, but for now ...
    va_list args;

    va_start( args, format );
    //asm("gotohere2: jmp gotohere2\n"::"b" (format), "c" (&args));
    asm("mov eax,0x300\ncall sysEnter_Vector\n"::"b" (format), "c" (&args));
    return 0;
}
