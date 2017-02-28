/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   initKernel.h
 * Author: yogi
 *
 * Created on February 27, 2017, 4:54 PM
 */

#ifndef INITKERNEL_H
#define INITKERNEL_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>
#include "tss.h"
#include "task.h"
#include "chrisos.h"
#include "x86idt.h"
#include "../../chrisOS/include/printf.h"
#include "../../chrisOS/include/i386/gdt.h"
    
    
void initKernelInternals();



#ifdef __cplusplus
}
#endif

#endif /* INITKERNEL_H */

