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
#include "ascii.h"
#include "malloc.h"
#include "strings.h"
#include "environment.h"
#include "input.h"
#include "config.h"
#include "time.h"
#include "file.h"
#include "../../../kproj/chrisOSKernel/include/syscalls.h"
    
#include <bits/time.h>
#ifndef NULL
#define NULL ((void *) 0)
#endif

#define VISIBLE __attribute__((visibility("default")))
#define SYSCALL0(a,b) {asm("call sysEnter_Vector\n":"=a" (b):"a" (a));}
#define SYSCALL1(a,b,c) {asm("call sysEnter_Vector\n":"=a" (c):"a" (a), "b" (b));}
#define SYSCALL2(a,b,c,d) {asm("call sysEnter_Vector\n":"=a" (d):"a" (a), "b" (b), "c" (c));}
#define SYSCALL3(a,b,c,d,e) {asm("call sysEnter_Vector\n":"=a" (e):"a" (a), "b" (b), "c" (c), "d" (d));}
#define SYSCALL4(a,b,c,d,e,f) {asm("call sysEnter_Vector\n":"=a" (e):"a" (a), "b" (b), "c" (c), "d" (d), "S" (f));}
#define GET_TICKS(t) SYSCALL0(SYSCALL_GETTICKS,t);
#define SLEEP_SECONDS(s) {uint32_t s2=s; uint32_t ct; GET_TICKS(ct); s=(s*TICKS_PER_SECOND)+ct; SYSCALL1(SYSCALL_SLEEP,s,s2);}

    void libc_init();
    int do_syscall0(int callnum);
    int do_syscall1(int callnum, uint32_t param1);
    int do_syscall2(int callnum, uint32_t param1, uint32_t param2);
    int do_syscall3(int callnum, uint32_t param1, uint32_t param2, uint32_t param3);
    int do_syscall4(int callnum, uint32_t param1, uint32_t param2, uint32_t param3, uint32_t param4);
    int print(const char *format, ...);         //NOTE: Works with linker option  -fvisibility=hidden
    int printI(const char *format, ...);         //NOTE: Works with linker option  -fvisibility=hidden
    int printdI(uint32_t DebugLevel, const char *format, ...);
    unsigned int VISIBLE sleep (unsigned int __seconds);
    void stop();
    void modifySignal(int signal, void* sigHandler, int sigData);
    void libc_cleanup(void);
    int exec(char* path, int argc, char** argv);
    int waitpid(uint32_t pid);
    void *memset(void *d1, int val, size_t len);
    void * memcpy(void *dest, const void *src, size_t n);
    struct tm* gettime();
    char* getcwd(char* buf, size_t size);
    bool strisnum(char* str);
    
    time_t libcTZ;
    char** processEnvp;
    
#ifdef __cplusplus
}
#endif

#endif /* LIBCHRISOS_H */
