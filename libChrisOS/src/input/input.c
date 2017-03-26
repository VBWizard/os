/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "libChrisOS.h"

#define READCHAR(c)     {asm("mov eax,0x3\ncall sysEnter_Vector\n":"=a" (c):"b" (1));}
#define PUTSTRING(c) {asm("mov eax,0x4\ncall sysEnter_Vector\n"::"b" (1), "c" (c));}

VISIBLE void puts(char* buffer)
{
    PUTSTRING(buffer)
}

VISIBLE void putc(char c)
{
    char buffer[2]={0};
    
    buffer[0]=c;
    buffer[1]=0;
    PUTSTRING(&buffer);
}

VISIBLE char getc()
{
    char c;
    READCHAR(c)
    return c;
}

VISIBLE void gets(char* buffer, int maxlen, int stream)
{
    char inchar;
    int len=0;
    char backspace[2]="\b";
    char lbuf[2]={0,0};
    
    if (stream!=1)
    {
        print("Stream %u not implemented\n",stream);
        getsError: goto getsError;
    }
    
    while (1==1)
    {
        READCHAR(inchar)
        if (inchar=='\b' && len>0)
        {
            buffer[len]=0;
            len--;
            PUTSTRING(&backspace);
            
        }
        else if (inchar>0)
        {
            if ((len-2)<maxlen)
            {
                lbuf[0]=inchar;
                PUTSTRING(&lbuf);
                buffer[len++]=inchar;
            }
            if (inchar==0x0a)
                return;
        }
    }
    return;
}