/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   ps_main.c
 * Author: yogi
 *
 * Created on February 21, 2019, 11:36 AM
 */
//CHANGELOG
//CLR   11/25/2022  Changed pid & ppid display to base-10
#include "libChrisOS.h"
#include "../../top/include/top.h"

int main(int argc, char** argv) 
{
    bool showAll=false;
    
    if (argc>1)
        showAll=true;
    
    
    //procInfo_t proc=
    int *handle=open("/proc/self/stat","r");
    procInfo_t *parentProc=malloc(sizeof(procInfo_t)); 
    procInfo_t *currProc=malloc(sizeof(procInfo_t));
    procInfo_t **topinfo;
    double userCPU=0, kernelCPU=0;

    printf("PID\t\tTTY\t\tTIME\t\tCMD\n");

    if (!showAll)
    {
        if (handle)
        {
            char *statBuffer=malloc(1024);
            read(handle,statBuffer,1024,1);
            close(handle);

            buildProcInfoT(currProc,statBuffer);
            free(statBuffer);

            char *parentPath=malloc(128);
            char ppids[8];
            strcpy(parentPath,"/proc/");
            itoa(currProc->ppid,ppids);
            strcat(parentPath,ppids);
            strcat(parentPath,"/stat");
            handle=open(parentPath,"r");
            if (handle)
            {
                char *pstatBuffer=malloc(1024);
                read(handle,pstatBuffer,1024,1);
                close(handle);
                buildProcInfoT(parentProc,pstatBuffer);
                free(pstatBuffer);
            }
        }
        if (parentProc)
            printf("%u\ttty%04u\t%s\t%s\n",parentProc->pid, parentProc->tty, parentProc->time,parentProc->name);
        printf("%u\ttty%04u\t%s\t%s\n",currProc->pid, currProc->tty, currProc->time, currProc->name);
    }
    else
    {
        topinfo=malloc(TOP_MAX_PROCESSES*sizeof(procInfo_t*));
        memset(topinfo,0,TOP_MAX_PROCESSES*sizeof(procInfo_t*));
        buildAllProcInfoTs(topinfo, TICKS_PER_SECOND, 1, &userCPU, &kernelCPU);
        
        for (int cnt=0;cnt<TOP_MAX_PROCESSES;cnt++)
        {
            if (topinfo[cnt]!=NULL)
                printf("%u\ttty%04u\t%s\t%s\n",topinfo[cnt]->pid, topinfo[cnt]->tty, topinfo[cnt]->time,topinfo[cnt]->name);
        }
    }
                
    free(currProc);
    free(parentProc);
    return 0;
}

