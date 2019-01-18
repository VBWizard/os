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

#define RESERVED_TASKS 32
#define CURRENT_TASKNUM ({uint32_t taskNum; \
                      __asm__("str eax\nshr eax,3\n":"=a" (taskNum));\
                      taskNum;})

#define CURRENT_TASK(t) ({uint32_t taskNum; \
                      __asm__("str eax\nshr eax,3\n":"=a" (taskNum)); task_t *t=findTaskByTaskNum(taskNum);})

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
    uint32_t next, prev;
    bool kernel;
    eTaskState taskState;
    uint32_t ticksSinceLastInterrupted, prioritizedTicksInRunnable;
    bool exited;
    uint32_t buffer;
    void* process;
    uint32_t buffer2;
    uint32_t lastRunStartTicks, lastRunEndTicks;
    uint32_t esp0Base, esp0Size;
} task_t;

task_t* createTask(void* process, bool kernelTSS);
task_t* getAvailableTask();
void freeTask(uint32_t taskNum);

#endif	/* TASK_H */

