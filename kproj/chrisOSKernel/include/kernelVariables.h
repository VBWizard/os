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

uint32_t isrSavedEAX, isrSavedEBX, isrSavedECX, isrSavedEDX, isrSavedESI, isrSavedEDI, isrSavedEBP, isrSavedCR0, isrSavedCR3, isrSavedCR4,
                             isrSavedDS, isrSavedES, isrSavedFS, isrSavedGS, isrSavedSS, isrSavedESP,isrSavedFlags, isrSavedErrorCode, isrSavedEIP, isrSavedCS, isrSavedCR2, isrSavedTR;
uint32_t*isrSavedStack;



#ifdef __cplusplus
}
#endif

#endif /* KERNELVARIABLES_H */

