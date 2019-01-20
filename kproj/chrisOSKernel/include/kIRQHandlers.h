/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   kIRQHandlers.h
 * Author: yogi
 *
 * Created on February 28, 2017, 12:22 PM
 */

#ifndef KIRQHANDLERS_H
#define KIRQHANDLERS_H

#ifdef __cplusplus
extern "C" {
#endif

#include <time.h>
#include "chrisos.h"

extern volatile uint32_t* kTicksSinceStart;
extern int kTicksPerSecond;
extern time_t kSystemCurrentTime;
extern uint32_t kDebugLevel;
extern uint32_t isrSavedAX, isrSavedBX, isrSavedCX, isrSavedDX, isrSavedSI, isrSavedDI, isrSavedBP, isrSavedCR0, isrSavedCR3, isrSavedCR4;
extern uint32_t isrSavedCS;
extern uint32_t isrSavedEIP;
extern uint32_t isrSavedFlags;
void kIRQ8_handler();

#ifdef __cpluplus
}
#endif

#endif /* KIRQHANDLERS_H */

