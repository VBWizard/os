/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   params.h
 * Author: yogi
 *
 * Created on April 2, 2017, 12:43 AM
 */

#ifndef PARAMS_H
#define PARAMS_H

#ifdef __cplusplus
extern "C" {
#endif

//Determines whether the scheduler is disabled during syscalls.  Both settings work as of now
#define DISABLE_SCHEDULE_DURING_SYSCALLS 1
//The minimum TPS I've gotten to work is 50.  Not possible to do > 1000 because of MS_PER_TICK.  Seems like 1000 may cause AHCI issues
#define TICKS_PER_SECOND 100
//How many ticks expire between scheduler runs (@100hz - 5=20 ticks per run, 10=10  ticks per run (10 ticks * 10 ms = 100ms @ 100 TPS))
#define TICKS_PER_SCHEDULER_RUN TICKS_PER_SECOND / 10
//How many ticks expire between signal checks
#define TICKS_PER_SIGNAL_CHECK 2 //clr 11/14/2022 - changed from 1 to 2
    //TICKS_PER_SECOND / 5 
    //old=/50
//MS=Milliseconds or thousands of a second
#define MS_PER_TICK 1000 / TICKS_PER_SECOND
//IS=Microseconds or millionths of a second
#define MIS_PER_TICK 1000000 / TICKS_PER_SECOND

#define PAGE_SIZE 0x1000

#define MAX_PARAM_COUNT 10
#define MAX_PARAM_WIDTH 128

#define FS_LAZY_LOAD
    
/* ***NOTE: If DEBUG_NONE is defined then there will be no debugging*** */
//#define DEBUG_NONE 0

#define DEBUG_TICK 1 << 1
#define DEBUG_EXPANDED_TICK 1 << 2
#define DEBUG_HARDDRIVE 1 << 3
#define DEBUG_KEYBOARD 1 << 4
#define DEBUG_PAGING_CONFIG 1 << 5
#define DEBUG_PAGING 1 << 6
#define DEBUG_TIMER 1 << 7
#define DEBUG_PCI_DISCOVERY 1 << 8
#define DEBUG_ELF_LOADER 1 << 9
#define DEBUG_ACPI 1<<10
#define DEBUG_MP 1<<11
#define DEBUG_EXCEPTIONS 1<<12
#define DEBUG_AHCI 1<<13
#define DEBUG_TASK 1<<14
#define DEBUG_KERNEL_PAGING 1<<15
#define DEBUG_MEMORY_MANAGEMENT 1<<16
#define DEBUG_TERMINAL 1<<17
#define DEBUG_PROCESS 1<<18
#define DEBUG_KMALLOC 1<<19
#define DEBUG_KEYBOARD_DRIVER 1<<20
#define DEBUG_PRINT_TO_PORT 1<<21
#define DEBUG_DETAILED 1<<22
#define DEBUG_SIGNALS 1<<23
#define DEBUG_MALLOC 1<<24
#define DEBUG_LIBC 1<<25
#define DEBUG_MMAP 1<<26
#define DEBUG_FILESYS 1<<27
#define DEBUG_COW 1<<28
#define DEBUG_SYSCALL 1<<29
#define DEBUG_USERPROCESS 1<<30
#define DEBUG_SCHEDULER 1<<31
#define DEBUG_MAX 0XFFFFFFFF            //0XFFFF TO TURN ON
#define KDEBUGLEVEL DEBUG_EXCEPTIONS|DEBUG_PRINT_TO_PORT|DEBUG_SYSCALL|DEBUG_LIBC|DEBUG_MMAP|DEBUG_FILESYS|DEBUG_USERPROCESS|DEBUG_TERMINAL|DEBUG_MALLOC|DEBUG_SCHEDULER
//|DEBUG_KMALLOC
//|DEBUG_SCHEDULER|DEBUG_PROCESS|DEBUG_TASK
//|DEBUG_DETAILED 
//| DEBUG_SIGNALS
    //| DEBUG_KEYBOARD_DRIVER  | DEBUG_ELF_LOADER  | DEBUG_DETAILED | DEBUG_FILESYS | DEBUG_MEMORY_MANAGEMENT
    //| DEBUG_AHCI
    
    //| DEBUG_KEYBOARD
    // | DEBUG_SIGNALS ***GETTING SEGV WITH THIS***
#ifdef __cplusplus
}
#endif

#endif /* PARAMS_H */

