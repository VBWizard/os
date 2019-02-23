/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   topmain.c
 * Author: yogi
 *
 * Created on February 17, 2019, 1:54 AM
 */

#include "libChrisOS.h"
#include "top.h"
#include <time.h>
#include "../../free/include/free.h"

const char ansiEscSeq[3] =  {0x1b,0x5b,0};
int iteration;
int intervalTicks;

    void buildTopInfo(char *buffer, procInfo_t **tops);

int main(int argc, char** argv) {
    char *printBuffer=malloc(4096);
    struct tm *timeinfo = malloc(sizeof(struct tm));
    char *printBufferPtr=printBuffer;
    procInfo_t **topinfo;
    int lastSleepTicks=0;
    intervalTicks=0;
    int intervalDelay=1;
    char *sysmem;
    
    if (argc>1)
    {
        if (strcmp(argv[1],"-d")==0)
            intervalDelay=atoi(argv[2]);
    }
    int pipes[2]={0,0};
    
    dup3(STDIN_FILE,STDIN_FILE,PIPENOBLOCK);
    topinfo=malloc(TOP_MAX_PROCESSES*sizeof(procInfo_t*));
    memset(topinfo,0,TOP_MAX_PROCESSES*sizeof(procInfo_t*));
    iteration=0;
    sysmem=malloc(1024);
    while (++iteration)
    {
        char c=0xff;
        if (read(STDIN_FILE,&c,1,1))
            break;
        int currTicks=getticks();
        intervalTicks=currTicks-lastSleepTicks;
        sysmem=getFree(true,sysmem,40);
        buildAllProcInfoTs(topinfo, intervalTicks, iteration);
        printBufferPtr=printBuffer;
        time_t theTime = time(&theTime);
        timeinfo = localtime(&theTime);
        printf("%s2JTop\t%02i:%02i:%02i\nHeapAvail:%sPID\tCommand\tStts\tPPID\tTTY\tMIF\tMAF\tCPU\tTime\t\tPRI\tVSiz\t\tPSiz\n",
                ansiEscSeq,timeinfo->tm_hour,timeinfo->tm_min,timeinfo->tm_sec,sysmem);
        

        for (int cnt=0;cnt<TOP_MAX_PROCESSES;cnt++)
            if (topinfo[cnt]!=NULL && topinfo[cnt]->lastUpdateIteration!=iteration)
                    memset(topinfo[cnt],0,sizeof(procInfo_t));

        for (int cpuVal=100;cpuVal>=0;cpuVal--)
        {
            for (int cnt=0;cnt<TOP_MAX_PROCESSES;cnt++)
            {
                    if (topinfo[cnt]!=NULL && (uint32_t)topinfo[cnt]->cpu>=cpuVal && topinfo[cnt]->cpu<(cpuVal+1)) //ORDER BY cpu DESC
                    {
                        procInfo_t *ti=topinfo[cnt];
                         sprintf(printBufferPtr,"%u\t%s\t%c\t%u\t%u\t%u\t%u\t%d\t%s\t%u\t%i%c\t\t%iK\n",
                                 ti->pid,
                                 ti->name,
                                 ti->status,
                                 ti->ppid,
                                 ti->tty,
                                 ti->minorFaults,
                                 ti->majorFaults,
                                 (uint32_t)ti->cpu,
                                 ti->time,
                                 ti->priority,
                                 ti->virtualSize>1024*1024?
                                     (ti->virtualSize/1024)/1024:
                                     ti->virtualSize/1024,
                                 ti->virtualSize>1024*1024?'M':'K',
                                 ti->memorySize/1024);
                         printBufferPtr=printBuffer+strlen(printBuffer);
                    }
            }
        }
        printf("%s",printBuffer);
        lastSleepTicks=currTicks;
        //sleepTicks(25);
        sleep(intervalDelay);
    }
    if (sysmem)
        free(sysmem);
    if (timeinfo)
        free(timeinfo);
    if (printBuffer)
        free(printBuffer);
    for (int cnt=0;cnt<TOP_MAX_PROCESSES;cnt++)
        if (topinfo[cnt])
            free(topinfo[cnt]);
    free(topinfo);
    close(STDIN_FILE);
    return 0;
}

