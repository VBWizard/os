/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "fs.h"
#include "filesystem/pipe.h"
#include "drivers/tty_driver.h"
#include "printf.h"
#include "config.h"

void syslogd()
{
    char buffer[1024];
    int bufptr=0;
    int pipeReadSize=0;
    
    while (1==1)
    {
        do
        {
            pipeReadSize = piperead(&buffer[bufptr], 1,1, tty1->stdErrReadPipe);
            
        } while (pipeReadSize && buffer[bufptr++]!='\n');
        
        if (bufptr)
        {
            int* f=fs_open("/var/log/syslog","a",NULL);
            if (f)
            {
                printd(DEBUG_PROCESS,"Printing %u bytes to syslog\n",bufptr);
                fs_write(NULL,f,buffer,bufptr,1);
                fs_close(f);
            }
        }
        bufptr=0;
    }
}