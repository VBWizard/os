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

#define VISIBLE __attribute__((visibility("default")))

void libc_init(void);
int VISIBLE print(const char *format, ...);         //NOTE: Works with linker option  -fvisibility=hidden


#ifdef __cplusplus
}
#endif

#endif /* LIBCHRISOS_H */

