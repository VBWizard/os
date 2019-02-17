/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include <stddef.h>

/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on February 16, 2019, 10:03 AM
 */

/*
 * 
 */
int main(int argc, char** argv) 
{
    char *buffer=NULL;
    int* file=open("/proc/meminfo","r");
    char *freeMemPtr=NULL;
    char *printPtr=NULL, *printEndPtr=NULL;
    char *printVal=NULL;
    bool humanReadable=false;
    int freeMemory=0;
    char temp[20]={0};
    
    
    if (argc>1)
    {
        strcpy(temp,argv[1]);
        if (strcmp(argv[1],"-h")==0)
            humanReadable=true;
    }
    
    if (file)
    {
        buffer=malloc(999);
        int readCount=read(file,buffer,999,1);
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
                    printf("%uM\n",freeMemory/(1024*1024));
                else
                    printf("%u\n",freeMemory);
                free(printVal);
            }
                
        }
        free(buffer);
    }
    return 0;
}

