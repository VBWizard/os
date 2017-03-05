/* 
 * File:   task.h
 * Author: yogi
 *
 * Created on June 8, 2016, 6:58 PM
 */

#ifndef TASK_H
#define	TASK_H
#include <stdbool.h>
#include <stdint.h>
#include "tss.h"

#define RESERVED_TASKS 10

typedef enum etaskstate
{
    TASK_ZOMBIE = 0,
    TASK_RUNNING = 1,
    TASK_RUNNABLE = 2,
    TASK_STOPPED = 3,
    TASK_USLEEP = 4,
    TASK_ISLEEP = 5,
    TASK_EXITED = 6,
    TASK_NONE = 0xFF
} eTaskState;

typedef struct s_task
{
    uint32_t taskNum;
    tss_t* tss;
    uint32_t* pageDir;
    uint32_t* kernelPageDirPtr; //Kernel's paged pointer to pageDir
    void* next, *prev;
    bool kernel;
    eTaskState taskState;
    int32_t ticksSinceLastInterrupted, ticksSincePutInRunnable;
    bool exited;
} task_t;

task_t* createTask(bool kernelTSS);
task_t* getAvailableTask();

#endif	/* TASK_H */

