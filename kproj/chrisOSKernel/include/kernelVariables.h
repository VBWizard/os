/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   kernelVariables.h
 * Author: yogi
 *
 * Created on February 28, 2017, 12:55 PM
 */

#ifndef KERNELVARIABLES_H
#define KERNELVARIABLES_H
#include "fs.h"

#ifdef __cplusplus
extern "C" {
#endif
#define NUMBER_OF_ISRS 100
    
volatile uint32_t isrSavedEAX, isrSavedEBX, isrSavedECX, isrSavedEDX, isrSavedESI, isrSavedEDI, isrSavedEBP, isrSavedCR0, isrSavedCR3, isrSavedCR4,
                             isrSavedDS, isrSavedES, isrSavedFS, isrSavedGS, isrSavedSS, isrSavedESP,isrSavedFlags, isrSavedErrorCode, isrSavedEIP, isrSavedCS, isrSavedCR2, isrSavedTR;
volatile uint32_t*isrSavedStack;

volatile uint32_t isrCounts[NUMBER_OF_ISRS];

#ifdef __cplusplus
}
#endif

#endif /* KERNELVARIABLES_H */

