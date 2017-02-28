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
#include "malloc.h"
    
    extern uint32_t* kTaskSlotAvailableInd;
    extern tss_t* kTSSTable;
    extern task_t* kTaskTable;

    void initSched();
    void scheduler();
    void submitNewTask(task_t* task);
    
#ifdef __cplusplus
}
#endif

#endif /* SCHEDULE_H */

