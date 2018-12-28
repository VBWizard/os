/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   syscall.h
 * Author: yogi
 *
 * Created on February 8, 2017, 10:18 AM
 */

#ifndef SYSCALL_H
#define SYSCALL_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdarg.h>
#include "signals.h"
#include "syscalls.h"
    
extern volatile uint32_t* kTicksSinceStart;
void syscall169();

#define sysReboot() syscall169()


#ifdef __cplusplus
}
#endif

#endif /* SYSCALL_H */

