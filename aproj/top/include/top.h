/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   top.h
 * Author: yogi
 *
 * Created on February 17, 2019, 2:28 PM
 */

#ifndef TOP_H
#define TOP_H

#ifdef __cplusplus
extern "C" {
#endif

#define TOP_MAX_PROCESSES 256
    
    typedef struct sTopInfo topInfo_t;
    
    struct sTopInfo                         //97
    {
        int pid;                            //4
        char *name[40];                     //40
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
    };


#ifdef __cplusplus
}
#endif

#endif /* TOP_H */

