/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   procinfo.h
 * Author: yogi
 *
 * Created on February 21, 2019, 7:23 AM
 */

#ifndef PROCINFO_H
#define PROCINFO_H

#ifdef __cplusplus
extern "C" {
#endif

#include "../../../kproj/chrisOS/include/config.h"

#define PROCINFO_MAX_PROCESSES 256
    
    typedef struct sProcInfo procInfo_t;
    
    struct sProcInfo                         //97
    {
        int pid;                            //4
        char name[40];                     //40
        char status;                        //1
        int ppid;                           //4
        int tty;                            //4
        int minorFaults;                    //4
        int majorFaults;                    //4
        int ticks, lastTicks, totalTicks;   //12
        double cpu;                         //8
        int priority;                       //4
        int virtualSize;                    //4
        int memorySize;                     //4
        int lastUpdateIteration;            //4
        char time[40];
    };

    procInfo_t *buildProcInfoT(procInfo_t *procinfo, char *statinfo);
    void buildAllProcInfoTs(procInfo_t **topinfo, int intervalTicks, int iteration);


#ifdef __cplusplus
}
#endif

#endif /* PROCINFO_H */

