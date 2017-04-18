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
#include "time_os.h"
#include "rusage.h"
#include "fs.h"
#include "signals.h"

#ifndef PROCESS_H
#define PROCESS_H

#ifdef __cplusplus
extern "C" {
#endif

#define PROCESS_HEAP_START 0x70000000
#define PROCESS_HEAP_END   0xBFFFFFFF
#define PROCESS_MAX_EXIT_HANDLERS 20    
#define PROCESS_STRUCT_VADDR 0xF000F000

    
    typedef void exitHandler(void);

    //NOTE: Any code can use PROCESS_STRUCT_VADDR for access to the process r/o
    //NOTE: Kernel code can use PROCESS_STRUCT_VADDR+4 for a pointer to the process which will be r/w
    typedef struct sprocess
    {
        uint32_t processSyscallESP;         //NOTE: this must be the first item in the struct, as it is mapped into the process later
        uintptr_t this;                     //NOTE: This must remain the second item in the struct at offset +4
        uint32_t pageDirPtr;
        task_t* task;
        sGDT* gdtEntry;
        elfInfo_t* elf;
        char* path;
        uint32_t retVal;
        signal_t signals;
        uint32_t heapStart, heapEnd;
        short priority;           //-20=highest, 20=lowest
        void* exitHandler[PROCESS_MAX_EXIT_HANDLERS];
        void* parent;
        bool kernelProcess;
        struct tm startTime, endTime;
        uint32_t totalRunTicks;
        int argc;
        uintptr_t argv;
        struct rusage usage;
        file_t* stdin, *stdout, *stderr;
        dllist_t* mmaps;
        int errno;
    } process_t;


    process_t* createProcess(char* path, int argc, uint32_t argv, process_t* parentProcessPtr, bool kernelProcess);
    void processExit();
    bool processRegExit(process_t* process, void* routineAddr);
    int sys_setpriority(process_t* process, int newpriority);

#define PROCESS_DEFAULT_PRIORITY 0
#ifdef __cplusplus
}
#endif

#endif /* PROCESS_H */
