/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   libChrisOS.h
 * Author: yogi
 *
 * Created on March 14, 2017, 6:46 PM
 */

#ifndef LIBCHRISOS_H
#define LIBCHRISOS_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdarg.h>
#include <stdint.h>
#include "chrisos.h"
    
#define VISIBLE __attribute__((visibility("default")))

void VISIBLE libc_init(void);
int VISIBLE print(const char *format, ...);         //NOTE: Works with linker option  -fvisibility=hidden
unsigned int VISIBLE sleep (unsigned int __seconds);
void stop();

#ifdef __cplusplus
}
#endif

#endif /* LIBCHRISOS_H */

