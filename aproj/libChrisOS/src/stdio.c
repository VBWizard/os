/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "libChrisOS.h"
#include "stdio.h"
#include "ascii.h"

extern int printI(const char *format, ...);
extern int gets(char* buffer, int maxlen, int stream);

file_operations_t fops;
inode_t console_node={.i_dev=1,.i_mode=0};
file_t console_file;

/*
size_t readConsole (struct file * fptr, char *buffer, size_t size, uint64_t* whatever) 
{
    return gets(buffer,size,1);
}

size_t writeConsole(struct file * fptr, const char *buffer, size_t size, uint64_t *whatever)
{
    return printI(buffer);
}

VISIBLE void moveTo(int row, int col)
{
    char buff[10];
    char rowString[3], colString[3];
    int buffPtr=0;
    

    memsetI(buff,0,10);
    //Convert row and column values to strings
    itoaI(row, rowString);
    itoaI(col, colString);
    
    //Send the ansi escape sequence CSI characters
    buff[buffPtr++] = '\033';
    buff[buffPtr++] = '[';

    
    for (int cnt=0;cnt<3;cnt++)
        if (rowString[cnt]!=0)
            buff[buffPtr++]=rowString[cnt];
        else
            break;
    buff[buffPtr++] = ';';
    for (int cnt=0;cnt<3;cnt++)
        if (colString[cnt]!=0)
            buff[buffPtr++]=colString[cnt];
        else
            break;
    buff[buffPtr++] = 'H';
    for (int cnt=buffPtr;cnt<10;cnt++)
        buff[buffPtr++]=0;
    
    printI(buff);
    
    return;
}
*/
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

/*
void ioInit()
{
    console_file.f_inode=&console_node;
    fops.read=readConsole;
    fops.write=writeConsole;
    console_file.fops=fops;
}
 */