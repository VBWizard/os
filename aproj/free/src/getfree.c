/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include <stddef.h>
#include <stdbool.h>

char *getFree(bool humanReadable, char *in, int inLen)
{
    char *freeMemPtr=NULL;
    char *printPtr=NULL, *printEndPtr=NULL;
    char *printVal=NULL;
    int freeMemory=0;
    char temp[20]={0};
    int* file=open("/proc/meminfo","r");
    char buffer[512];
    
    if (file)
    {
        int readCount=read(file,buffer,512,1);
        close(file);
        if (readCount)
        {
            freeMemPtr=strstr(buffer,"AvailableHeap");
            if (freeMemPtr)
            {
                printPtr=strstr(freeMemPtr,"=");
            }
            if (printPtr)
            {
                printPtr+=1;
                printEndPtr=strstr(printPtr,"\n");
            }
            if (printEndPtr)
            {
                printVal=malloc((int)printEndPtr-(int)printPtr+2);
                strncpy(printVal,printPtr,(int)printEndPtr-(int)printPtr);
                
                freeMemory=atoi(printVal);
                
                if (humanReadable)
                    sprintf(in,"%uM\n",freeMemory/(1024*1024));
                else
                    sprintf(in,"%u\n",freeMemory);
                free(printVal);
            }
                
        }
    }    
    strtrim(in);
    return in;
}