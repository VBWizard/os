/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "stdio.h"
extern int print(const char *format, ...);
extern int gets(char* buffer, int maxlen, int stream);

file_operations_t fops;
inode_t console_node={.i_dev=1,.i_mode=0};
file_t console_file;

size_t readConsole (struct file * fptr, char *buffer, size_t size, uint64_t* whatever) 
{
    return gets(buffer,size,1);
}

size_t writeConsole(struct file * fptr, const char *buffer, size_t size, uint64_t *whatever)
{
    return print(buffer);
}

void ioInit()
{
    console_file.f_inode=&console_node;
    fops.read=readConsole;
    fops.write=writeConsole;
    console_file.fops=fops;
}