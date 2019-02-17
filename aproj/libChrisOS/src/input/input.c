/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "libChrisOS.h"
#include "syscalls.h"
#include "stdio.h"

#define READCHAR(c)     {asm("call sysEnter_Vector\n":"=a" (c):"a" (SYSCALL_READ), "b" (STDIN_FILE));}
#define PUTSTRING(c) {asm("call sysEnter_Vector\n"::"a" (SYSCALL_WRITE), "b" (STDOUT_FILE), "c" (c));}

extern int printI(const char *format, ...);

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



VISIBLE char getchar()
{
    char c;
    while (1==1)
    {
        READCHAR(c);
        if (c)
            return c;
        asm("call sysEnter_Vector\n"::"a" (0x302)); //hlt
    }
    return 0; //Should not get here
}

//Get a string of {maxlen} characters, returning when the # of characters is reached or enter is pressed
VISIBLE int gets(char* buffer, int maxlen, int stream)
{
    char inchar;
    int len=0;
    char lbuf[2];
    
    lbuf[0]=lbuf[1]=0;
    if (stream!=1)
    {
        printI("Stream %u not implemented\n",stream);
        getsError: goto getsError;
    }
    
    while (1==1)
    {
        READCHAR(inchar)
        if (inchar=='\b' && len>0)
        {
            buffer[len]=0;
            len--;
        }
        else if (inchar!=0)
        {
            lbuf[0]=inchar;
            //PUTSTRING(&lbuf);
            buffer[len++]=inchar;
            //Note: Written this way so that gets an be used as a getc which waits for the key
            if ((len+1>=maxlen) || (inchar==0x0a)) //-1 because we need to leave the terminator (0x0) at the end of the string
            
                return len;
        }
        else
            asm("call sysEnter_Vector\n"::"a" (0x302)); //hlt
        //added these for 1000 hertz clock, not needed for 100 hertz
/*            asm("call sysEnter_Vector\n"::"a" (0x302)); //hlt
            asm("call sysEnter_Vector\n"::"a" (0x302)); //hlt*/

    }
}

