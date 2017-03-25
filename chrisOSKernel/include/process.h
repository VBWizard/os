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

#include "signals.h"
#define PROCESS_HEAP_START 0x70000000
#define PROCESS_HEAP_END   0xBFFFFFFF
#define PROCESS_MAX_EXIT_HANDLERS 20    
#define PROCESS_STRUCT_VADDR 0xF000F000
    
    typedef void exitHandler(void);
    
    typedef struct sprocess
    {
        uint32_t processSyscallESP;         //NOTE: this must be the first item in the struct, as it is mapped into the process later
        uint32_t pageDirPtr;
        task_t* task;
        sGDT* gdtEntry;
        elfInfo_t* elf;
        char* path;
        uint32_t retVal;
        signal_t signals;
        uint32_t heapStart, heapEnd;
        void* exitHandler[PROCESS_MAX_EXIT_HANDLERS];
    } process_t;


    process_t* createProcess(char* path,int argc,uint32_t argv, bool kernelProcess);
    void processExit();
    bool processRegExit(process_t* process, void* routineAddr);
    
#ifdef __cplusplus
}
#endif

#endif /* PROCESS_H */
