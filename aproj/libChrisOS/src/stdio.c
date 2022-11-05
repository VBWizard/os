/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "common.h"
#include "stdio.h"
#include "ascii.h"
#include "memory.h"

extern int printI(const char *format, ...);
extern int gets(char* buffer, int maxlen, int stream);


//Clears the current console row, setting the cursor to column 0
VISIBLE void resetRow()
{
    char buff[5];
    int buffPtr=0;

    memsetI(buff,0,10);
    
    //Send the ansi escape sequence CSI characters
    buff[buffPtr++] = '\033';
    buff[buffPtr++] = '[';
    buff[buffPtr++] = '0';
    buff[buffPtr++] = 'K';
    buff[buffPtr] = '\0';
    printI(buff);
    
    return;
}
