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
    time_t startTicks, endTicks, elapsed;
    struct tm *startTime, *endTime;
    char* execpgm;
    int retVal=0;
    
#ifdef DEBUG
    startTime = malloc(sizeof(struct tm));
    endTime = malloc(sizeof(struct tm));
    execpgm = malloc(1024);
//    print("Param count=%u\n",argc);
//    for (int cnt=0;cnt<argc;cnt++)
//        print("Param %u=%s\n",cnt,argv[cnt]);
#endif
    if (argc<2)
    {
        print("Error: Not enough parameters supplied, must pass path to program to be run\n");
        retVal=-1;
    }

    for (int cnt=1;cnt<argc;cnt++)
    {
        strcat(execpgm," ");
        strcat(execpgm,argv[cnt]);
    }
    if (retVal==0)
    {
        int argcl;
        char** argvl;
        
        argvl = cmdlineToArgv(execpgm, &argcl);

        //print("executing %s with first parameter at 0x%08X (%u parameters)\n", execpgm, argv[1], argc-1);
        startTicks=getticks();
        gettime(startTime,true);
        //pid=execb(execpgm);
        //Execute the program
        pid = fork();
        if (pid==0)
        {
            int childPid = exec(argvl[0], argcl, argvl);
            if (childPid <= 0)
            {
                print("Error exec'ing %s\n",execpgm);
                return -1;
            }
            else
            {
                return waitpid(childPid);
                
            }
        }
        if (pid<0)
        {
            print("Error forking: %u\n",pid);
            retVal=-3;
        }
        else
        {
            retVal = waitpid(pid);
            if (retVal >= 0)
            {
                endTicks=getticks();
                gettime(endTime,true);
                elapsed=(endTicks-startTicks);
                retVal=elapsed;
    /*            totalTime=malloc(sizeof(struct tm));    
                print("Start time: %02u:%02u:%02u\n",startTime->tm_hour, startTime->tm_min, startTime->tm_sec);
                print("Elapsed ticks = %u\n",elapsed);
                int ms=elapsed%TICKS_PER_SECOND*(TICKS_PER_SECOND/10);
                elapsed/= TICKS_PER_SECOND;
                gmtime_r(&elapsed,totalTime);
                //print("Elapsed time = %02u:%02u:%02u.%03u\n",totalTime->tm_hour,totalTime->tm_min,totalTime->tm_sec,ms);
    */
    //            free(totalTime);
            }
        }
    }
    free(startTime);
    free(endTime);
    free(execpgm);
    return (retVal);
}

