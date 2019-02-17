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

#ifndef PROCESS_H
#define PROCESS_H

#ifdef __cplusplus
extern "C" {
#endif

#include "task.h"
#include "../../chrisOS/include/i386/gdt.h"
#include "time_os.h"
#include "rusage.h"
#include "signals.h"
#include "dllist.h"

#define PROCESS_HEAP_START 0x70000000
#define PROCESS_HEAP_END   0xBFFFFFFF
#define PROCESS_MAX_EXIT_HANDLERS 20    
#define PROCESS_MAX_ENVIRONMENT_VARIABLES 512
#define PROCESS_STRUCT_VADDR 0xF000F000
#define PROCESS_STRUCT_VADDR_THIS_OFFSET 0x4
    
    typedef void exitHandler(void);
    typedef void startHandler();

    //NOTE: Any code can use PROCESS_STRUCT_VADDR for access to the process r/o
    //NOTE: Kernel code can use PROCESS_STRUCT_VADDR+4 for a pointer to the process which will be r/w
    typedef struct sprocess
    {
        uint32_t processSyscallESP;         //NOTE: this must be the first item in the struct, as it is mapped into the process later
        uint32_t pageDirPtr;
        char exename[128];
        struct sprocess* this;                     //NOTE: This must remain the second item in the struct at offset +4
        task_t* task;
        sGDT* gdtEntry;
        void* elf;
        char* path;
        uint32_t retVal;
        signal_t signals;
        uint32_t heapStart, heapEnd, stackStart, stackSize, stack1Start, stack1Size, stack0Start, stack0Size;
        short priority;           //-20=highest, 20=lowest
        void* exitHandler[PROCESS_MAX_EXIT_HANDLERS];
        struct sprocess* parent;
        bool kernelProcess;
        struct tm startTime, endTime;
        uint32_t totalRunTicks;
        uint32_t entryPoint;
        int argc;
        char** argv;
        struct rusage usage;
        void* stdin, *stdout, *stderr;        //standard input/output/error pointers
        dllist_t* mmaps;
        int errno;
        char* cwd;                              //Current working directory for the process
        void* startHandler[PROCESS_MAX_EXIT_HANDLERS];
        int startHandlerPtr;
        char** mappedEnvp;
        char** realEnvp;
        char* mappedEnv;
        char* realEnv;
        bool justForked;
        uint32_t forkChildCR3;
        uint32_t childNumber;
        uint32_t lastChildNumber;
        bool execDontSaveRegisters;
        bool foreground, stdinRedirected, stdoutRedirected, stderrRedirected;
        uintptr_t *stackInitialPage;
        uint32_t minorFaults, majorFaults;
    } process_t;


    process_t* createProcess(char* path, int argc, char** argv, process_t* parentProcessPtr, bool isKernelProcess, bool useExistingProcess);
    void processExit();
    bool processRegExit(process_t* process, void* routineAddr);
    int sys_setpriority(process_t* process, int newpriority);
    int processGetCWD(process_t *process, char* buf, unsigned long size);
    void* copyFromKernel(process_t* process, void* dest, const void* src, unsigned long size); //Copy memory from kernel to user space (assumes dest is user page)
    void* copyToKernel(process_t* srcProcess, void* dest, const void* src, unsigned long size); //Copy memory from user space to kernel (assumes dest is kernel page)
    process_t *getCurrentProcess ();
    void freeProcess(process_t *process);

#define PROCESS_DEFAULT_PRIORITY 0
#ifdef __cplusplus
}
#endif

#endif /* PROCESS_H */
