/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   time.c
 * Author: yogi
 *
 * Created on April 1, 2017, 9:08 AM
 */

#include "libChrisOS.h"

/*
 * 
 */
int main(int argc, char** argv) {

    int pid=0;
    struct tm *totalTime;
    time_t startTime, endTime, elapsed;
    int retVal=0;
    
    libc_init();
#ifdef DEBUG
    print("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
        print("Param %u=%s\n",cnt,argv[cnt]);
#endif
    if (argc<2)
    {
        print("Error: Not enough parameters supplied, must pass path to program to be run\n");
        retVal=-1;
    }
    char* execpgm=malloc(512);
    if (argv[1]==NULL)
    {
        print("Parameter 2 must be a program name to run\n");
        retVal=-4;
    }
    else
    {
        strcpy(execpgm,argv[1]);
        strtrim(execpgm);
        if (retVal==0)
        {
            if (strlen(execpgm)==0)
            {
                print("Parameter 2 must be a program name to run\n");
                retVal=-2;
            }
        }
    }
    if (retVal==0)
    {
        startTime=time();
        pid=exec(execpgm,0,NULL);
        if (pid==0)
        {
            print("Error executing %s\n",argv[1]);
            retVal=-3;
        }
        else
        {
            waitpid(pid);
            endTime=time();
            elapsed=(endTime-startTime);
            totalTime=malloc(sizeof(totalTime));    
            print("Elapsed ticks = %u\n",elapsed);
            int ms=elapsed%TICKS_PER_SECOND;
            elapsed/= TICKS_PER_SECOND;
            gmtime_r(&elapsed,totalTime);
            print("Elapsed time = %02u:%02u:%02u.%03u\n",totalTime->tm_hour,totalTime->tm_min,totalTime->tm_sec,ms);
        }
    }
    free(execpgm);
//    free (execpgm);
    return (retVal);
}

