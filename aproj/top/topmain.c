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
#include "../../kproj/chrisOS/include/config.h"
#include "../free/include/free.h"

const char ansiEscSeq[3] =  {0x1b,0x5b,0};
int iteration;
int intervalTicks;

    void buildTopInfo(char *buffer, topInfo_t **tops);

int main(int argc, char** argv) {
    struct tm *timeinfo = malloc(sizeof(struct tm));
    char *printBuffer=malloc(4096);
    direntry_t *dirEntries=malloc(1024*sizeof(direntry_t));
    char *printBufferPtr=printBuffer;
    char path[128];
    char *statBuffer=malloc(4096);
    topInfo_t **topinfo;
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
    topinfo=malloc(TOP_MAX_PROCESSES*sizeof(topInfo_t*));
    memset(topinfo,0,TOP_MAX_PROCESSES*sizeof(topInfo_t*));
    iteration=0;
    sysmem=malloc(1024);
    while (++iteration)
    {
        char c=0xff;
        if (read(STDIN_FILE,&c,1,1))
            break;
        int currTicks=getticks();
        intervalTicks=currTicks-lastSleepTicks;
        
        printBufferPtr=printBuffer;
        time_t theTime = time(&theTime);
        timeinfo = localtime(&theTime);
        
        int procCount=getdir("/proc/",dirEntries,1024*100);
        //char *junk=malloc(102400);
        
        sysmem=getFree(true,sysmem,1024);
        
        for (int cnt=0;cnt<procCount;cnt++)
        {
            if (dirEntries[cnt].is_dir)
            {
                strcpy(path,"/proc/");
                strcat(path,dirEntries[cnt].filename);
                strcat(path,"/stat");
                int *handle=open(path,"r");
                if (handle)
                {
                    read(handle,statBuffer,1024,1);
                    close(handle);
                    buildTopInfo(statBuffer,topinfo);
                }
            }
        }

        printf("%s2JTop\t%02i:%02i:%02i\nHeapAvail:%sPID\tCommand\tStts\tPPID\tTTY\tMIF\tMAF\tCPU\tTime\t\tPRI\tVSiz\t\tPSiz\n",ansiEscSeq,timeinfo->tm_hour,timeinfo->tm_min,timeinfo->tm_sec,sysmem);

        for (int cnt=0;cnt<TOP_MAX_PROCESSES;cnt++)
            if (topinfo[cnt]!=NULL && topinfo[cnt]->lastUpdateIteration!=iteration)
                    memset(topinfo[cnt],0,sizeof(topInfo_t));

        for (int cpuVal=100;cpuVal>=0;cpuVal--)
        {
            for (int cnt=0;cnt<TOP_MAX_PROCESSES;cnt++)
            {
                    if (topinfo[cnt]!=NULL && topinfo[cnt]->cpu>=(double)cpuVal && topinfo[cnt]->cpu<(double)(cpuVal+1))
                    {
                        topInfo_t *ti=topinfo[cnt];
                        time_t runtime_secs=ti->totalTicks/TICKS_PER_SECOND;
                        timeinfo=gmtime_r((time_t*)&runtime_secs,timeinfo);
                         sprintf(printBufferPtr,"%u\t%s\t%c\t%u\t%u\t%u\t%u\t%d\t%02i:%02i:%02i\t%u\t%iK\t\t%iK\n",
                                 ti->pid,
                                 ti->name,
                                 ti->status,
                                 ti->ppid,
                                 ti->tty,
                                 ti->minorFaults,
                                 ti->majorFaults,
                                 (uint32_t)ti->cpu,
                                 timeinfo->tm_hour,timeinfo->tm_min,timeinfo->tm_sec,
                                 ti->priority,
                                 ti->virtualSize/1024,
                                 ti->memorySize/1024);
                         printBufferPtr=printBuffer+strlen(printBuffer);
                    }
            }
        }
        printf("%s",printBuffer);
        lastSleepTicks=currTicks;
        sleep(intervalDelay);
    }
    if (sysmem)
        free(sysmem);
    if (timeinfo)
        free(timeinfo);
    if (printBuffer)
        free(printBuffer);
    if (statBuffer)
        free(statBuffer);
    for (int cnt=0;cnt<TOP_MAX_PROCESSES;cnt++)
        if (topinfo[cnt])
            free(topinfo[cnt]);
    free(topinfo);
    close(STDIN_FILE);
    return 0;
}

void buildTopInfo(char *buffer, topInfo_t **tops)
{
    char delim[4]={'\n','\t',' ','\0'};
    char *token;
    int tokenNumber=1, ticks=0;
    int pid;
    static char *name, *name2, *name3;
    
    if (!name3)
    {
        name=malloc(100);
        name2=malloc(100);
        name3=malloc(100);
        memset(name,0,100);
        memset(name2,0,100);
        memset(name3,0,100);
    }
    
    
    token=strtok(buffer,delim);
    while (token)
    {
        switch (tokenNumber)
        {
            case 1: //pid
                pid=atoi(token);
                if (!tops[pid])
                {
                    tops[pid]=malloc(sizeof(topInfo_t));
                    memset(tops[pid],0,sizeof(topInfo_t));
                }
                tops[pid]->pid=pid;
                tops[pid]->lastUpdateIteration=iteration;
                break;
            case 3: //state
                tops[pid]->status=token[0];
                break;
            case 4: //ppid
                tops[pid]->ppid=atoi(token);
                break;
            case 7: //tty_nr
                tops[pid]->tty=atoi(token);
                break;
            case 10://minflt
                tops[pid]->minorFaults=atoi(token);
                break;
            case 11://majflt
                tops[pid]->majorFaults=atoi(token);
                break;
            case 17://priority
                tops[pid]->priority=atoi(token);
                break;
            case 2: //comm
                name=strreplace(token,"(","",name);
                name2=strreplace(name,")","",name2);
                sprintf(name3,"%-10s",name2);
                strncpy((char*)tops[pid]->name,name3,9);
                free(name); //pointers returned by strreplace have to be freed as strreplace malloc's them
                free(name2);//pointers returned by strreplace have to be freed
                break;
            case 13://ticks
                tops[pid]->ticks=atoi(token);
                if (tops[pid]->lastTicks>0)
                    tops[pid]->totalTicks+=(tops[pid]->ticks-tops[pid]->lastTicks);
                else
                    tops[pid]->totalTicks=tops[pid]->ticks;
                tops[pid]->cpu=(((double)tops[pid]->ticks-(double)tops[pid]->lastTicks)/(double)intervalTicks)*100;
                tops[pid]->lastTicks=tops[pid]->ticks;
                break;
            case 22://vsize
                tops[pid]->virtualSize=atoi(token);
                break;
            case 23://rss
                tops[pid]->memorySize=atoi(token);
                break;
        }
        tokenNumber++;
        token=strtok(NULL,delim);
    }
    return;
}