/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   schedule.h
 * Author: yogi
 *
 * Created on February 28, 2017, 7:24 AM
 */

#ifndef SCHEDULE_H
#define SCHEDULE_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdbool.h>
#include "chrisos.h"
#include "task.h"
#include "tss.h"
#include "kmalloc.h"
#include "kernelVariables.h"
#include "alloc.h"
#include "paging.h"
#include "process.h"
#include "kernel.h"
#include "thesignals.h"
    
#define RUNNABLE_TICKS_INTERVAL 20
    
    extern uint32_t* kTaskSlotAvailableInd;
    extern tss_t* kTSSTable;
    extern task_t* kTaskTable;

    void initSched();
    void scheduler();
    task_t* submitNewTask(task_t* task);
    void markTaskEnded(uint32_t taskNum, uint32_t retval);
    task_t* findTaskByCR3(uint32_t cr3);
    task_t* findTaskByTaskNum(uint32_t taskNum);
    uint32_t NO_PREV, NO_NEXT;

#ifdef __cplusplus
}
#endif

#endif /* SCHEDULE_H */

