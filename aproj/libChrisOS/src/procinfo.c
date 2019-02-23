/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "procinfo.h"
#include "common.h"
#include "time.h"
#include "memory.h"
#include "strings.h"
#include "ascii.h"
#include "file.h"
#include "malloc.h"

procInfo_t *buildProcInfoTI(procInfo_t *procinfo, char *statinfo, int ticksPerUpdateInterval)
{
    char delim[4]={'\n','\t',' ','\0'};
    char *token;
    int tokenNumber=1;
    int pid;
    char name[100], name2[100], name3[100];
    static struct tm tinfo;

    memsetI(name,0,100);
    memsetI(name2,0,100);
    memsetI(name3,0,100);
    
    token=strtokI(statinfo,delim);
    while (token)
    {
        switch (tokenNumber)
        {
            case 1: //pid
                pid=atoiI(token);
                procinfo->pid=pid;
//procinfo->lastUpdateIteration=iteration;
                break;
            case 3: //state
                procinfo->status=token[0];
                break;
            case 4: //ppid
                procinfo->ppid=atoiI(token);
                break;
            case 7: //tty_nr
                procinfo->tty=atoiI(token);
                break;
            case 10://minflt
                procinfo->minorFaults=atoiI(token);
                break;
            case 11://majflt
                procinfo->majorFaults=atoiI(token);
                break;
            case 17://priority
                procinfo->priority=atoiI(token);
                break;
            case 2: //comm
                strreplaceI(token,"(","",name);
                strreplaceI(name,")","",name2);
                sprintfI(name3,"%-10s",name2);
                strncpyI((char*)procinfo->name,name3,9);
                break;
            case 13://ticks
                procinfo->ticks=atoiI(token);
                procinfo->totalTicks+=(procinfo->ticks - procinfo->lastTicks);
                time_t runtime_secs=procinfo->totalTicks/TICKS_PER_SECOND;
                
                memsetI(&tinfo,0,sizeof(struct tm));
                gmtime_rI((time_t*)&runtime_secs,&tinfo);
                memsetI(procinfo->time,0,40);
                sprintfI(procinfo->time,"%02i:%02i:%02i",tinfo.tm_hour,tinfo.tm_min,tinfo.tm_sec);
                procinfo->cpu=(((double)procinfo->ticks-(double)procinfo->lastTicks)/(double)ticksPerUpdateInterval)*100;
                procinfo->lastTicks=procinfo->ticks;
                
//procinfo->cpu=(((double)procinfo->ticks-(double)procinfo->lastTicks)/(double)intervalTicks)*100;
                break;
            case 22://vsize
                procinfo->virtualSize=atoiI(token);
                break;
            case 23://rss
                procinfo->memorySize=atoiI(token);
                break;
        }
        tokenNumber++;
        token=strtokI(NULL,delim);
    }
    return procinfo;
    
}

VISIBLE procInfo_t *buildProcInfoT(procInfo_t *procinfo, char *statinfo)
{
    return buildProcInfoTI(procinfo, statinfo, 0);
}

VISIBLE void buildAllProcInfoTs(procInfo_t **topinfo, int intervalTicks, int iteration)
{
    static direntry_t *dirEntries;
    
    if (!dirEntries)
        dirEntries=mallocI(PROCINFO_MAX_PROCESSES*sizeof(direntry_t));

    char path[128];
    int procCount=getdirI("/proc/",dirEntries,1024*100);
    char statBuffer[256];
    procInfo_t *currProc;

    for (int cnt=0;cnt<procCount;cnt++)
    {
        if (dirEntries[cnt].is_dir)
        {
            strcpyI(path,"/proc/");
            strcatI(path,dirEntries[cnt].filename);
            strcatI(path,"/stat");
            if (strstrI(path,"self")!=NULL)
                continue;
            int *handle=openI(path,"r");
            if (handle)
            {
                readI(handle,statBuffer,1024,1);
                closeI(handle);
                //buildTopInfo(statBuffer,topinfo);
                char *space=strstrI(statBuffer," ");
                char pid[8];
                strncpyI(pid,statBuffer,space-statBuffer);
                int ipid=atoiI(pid);
                if (topinfo[ipid]==NULL)
                    topinfo[ipid]=mallocI(sizeof(procInfo_t));
                currProc=topinfo[ipid];
                buildProcInfoTI(currProc, statBuffer, intervalTicks);
                currProc->lastUpdateIteration=iteration;
            }
        }
    }
    //free(dirEntries); variable is static so it will exist until the program ends
    //at which time it will be free'd automagically
}