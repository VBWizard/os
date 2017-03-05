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
#include "../../chrisOS/include/i386/gdt.h"
#include "../../chrisOS/include/elfloader.h"

#ifndef PROCESS_H
#define PROCESS_H

#ifdef __cplusplus
extern "C" {
#endif

typedef struct sprocess
{
    task_t* task;
    //char image[512];
    sGDT* gdtEntry;
    elfInfo_t* elf;
    char* path;
    uint32_t retVal;
} process_t;

    
process_t* createProcess(char* path,int argc,uint32_t argv, bool kernelProcess);
void destroyProcess(process_t* process);

#ifdef __cplusplus
}
#endif

#endif /* PROCESS_H */
