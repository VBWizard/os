/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   signals.h
 * Author: yogi
 *
 * Created on March 19, 2017, 5:43 PM
 */

#ifndef SIGNALS_H
#define SIGNALS_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>
#include "task.h"

    extern task_t* findTaskByCR3(uint32_t cr3);
    extern uint32_t NO_PREV;
    extern uint32_t NO_NEXT;
    
    typedef struct ssignal
    {
        void* sighandler[32];
        uint32_t sigdata[32];
        uint32_t sigmask;
        uintptr_t sigind;
        
    } signal_t;

    void* sys_sigaction2(int signal, uintptr_t* sigAction, uint32_t sigData, void *process);
    void* sys_sigaction(int signal, uintptr_t* sigAction, uint32_t sigData, void *process);
    void sys_masksig(int signal, bool mask);
    void processSignals();

#ifdef __cplusplus
}
#endif

#endif /* SIGNALS_H */

