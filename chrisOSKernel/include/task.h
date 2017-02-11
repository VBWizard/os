/* 
 * File:   task.h
 * Author: yogi
 *
 * Created on June 8, 2016, 6:58 PM
 */

#ifndef TASK_H
#define	TASK_H
#include <stdbool.h>

#include "tss.h"
typedef struct s_task
{
    tss_t* tss;
    uint32_t* pageTable;
    uintptr_t* next, previous;
} task_t;

task_t* createTask(bool kernelTSS);

#endif	/* TASK_H */

