/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   common.h
 * Author: yogi
 *
 * Created on February 23, 2019, 2:37 PM
 */

#ifndef COMMON_H
#define COMMON_H

#ifdef __cplusplus
extern "C" {
#endif

#include <bits/time.h>
#include <stdarg.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
    
#include "../../../kproj/chrisOSKernel/include/syscalls.h"

#define VISIBLE __attribute__((visibility("default")))
#define SYSCALL0(a,b) {asm("call sysEnter_Vector\n":"=a" (b):"a" (a), "b" (0), "c" (0), "d" (0), "S" (0));}
#define SYSCALL1(a,b,c) {asm("call sysEnter_Vector\n":"=a" (c):"a" (a), "b" (b), "c" (0), "d" (0), "S" (0));}
#define SYSCALL2(a,b,c,d) {asm("call sysEnter_Vector\n":"=a" (d):"a" (a), "b" (b), "c" (c), "d" (0), "S" (0));}
#define SYSCALL3(a,b,c,d,e) {asm("call sysEnter_Vector\n":"=a" (e):"a" (a), "b" (b), "c" (c), "d" (d), "S" (0));}
#define SYSCALL4(a,b,c,d,e,f) {asm("call sysEnter_Vector\n":"=a" (f):"a" (a), "b" (b), "c" (c), "d" (d), "S" (e));}
#define GET_TICKS(t) SYSCALL0(SYSCALL_GETTICKS,t);
#define SLEEP_SECONDS(s) ({uint32_t s2=s; uint32_t ct; GET_TICKS(ct); s=(s*TICKS_PER_SECOND)+ct; SYSCALL1(SYSCALL_SLEEP,s,s2);s2;})
#define SLEEP_TICKS(s) ({uint32_t s2=s; uint32_t ct; GET_TICKS(ct); s=s+ct-1; SYSCALL1(SYSCALL_SLEEP,s,s2);s2;})

    int do_syscall0(int callnum);
    int do_syscall1(int callnum, uint32_t param1);
    int do_syscall2(int callnum, uint32_t param1, uint32_t param2);
    int do_syscall3(int callnum, uint32_t param1, uint32_t param2, uint32_t param3);
    int do_syscall4(int callnum, uint32_t param1, uint32_t param2, uint32_t param3, uint32_t param4);
    int print(const char *format, ...);         //NOTE: Works with linker option  -fvisibility=hidden
    int printf(const char *format, ...);
    int printfI(const char *format, ...);
    int printI(const char *format, ...);         //NOTE: Works with linker option  -fvisibility=hidden
    int printdI(uint32_t DebugLevel, const char *format, ...);
    int printd(uint32_t DebugLevel, const char *format, ...);

    char** processEnvp;

#ifdef __cplusplus
}
#endif

#endif /* COMMON_H */

