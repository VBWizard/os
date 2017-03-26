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
#include "malloc.h"
#include "strings.h"
#include "input.h"
    
#include "/home/yogi/src/os/chrisOS/include/chrisos.h"
    
#define VISIBLE __attribute__((visibility("default")))

void libc_init(void);
int print(const char *format, ...);         //NOTE: Works with linker option  -fvisibility=hidden
int printDebug(uint32_t DebugLevel, const char *format, ...);
unsigned int VISIBLE sleep (unsigned int __seconds);
void stop();
void modifySignal(int signal, void* sigHandler, int sigData);
void libc_cleanup(void);
void exec(char* path, int argc, char** argv);
VISIBLE void waitpid(uint32_t pid);

#define GET_TICKS(t) {asm("mov eax,0x170\ncall sysEnter_Vector\n":"=a" (t));}
#define SLEEP_SECONDS(s) {uint32_t ct; GET_TICKS(ct); s=(s*TICKS_PER_SECOND)+ct; asm("call sysEnter_Vector\n"::"a" (0x166), "b" (s), "c" (0), "d" (0));}
#ifdef __cplusplus
}
#endif

#endif /* LIBCHRISOS_H */

