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
typedef struct s_task
{
    tss_t* tss;
    uint32_t* pageDir;
    uintptr_t* next, *prev;
    bool kernel;
} task_t;

task_t* createTask(bool kernelTSS);
task_t* getTaskSlot();

#endif	/* TASK_H */

