/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   process.h
 * Author: yogi
 *
 * Created on February 14, 2017, 5:32 AM
 */

#include "task.h"

#ifndef PROCESS_H
#define PROCESS_H

#ifdef __cplusplus
extern "C" {
#endif

typedef struct sprocess
{
    task_t* task;
    char image[512];
} process_t;

    
process_t* createProcess(bool kernelTSS, char* path);
void destroyProcess(process_t* process);

#ifdef __cplusplus
}
#endif

#endif /* PROCESS_H */

