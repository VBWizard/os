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
#include "ascii.h"
#include "common.h"
#include "console.h"
#include "environment.h"
#include "file.h"
#include "input.h"
#include "libcmmap.h"
#include "malloc.h"
#include "memory.h"
#include "procinfo.h"
#include "pipe.h"
#include "stdio.h"
#include "strings.h"
#include "time.h"

#ifndef NULL
#define NULL ((void *) 0)
#endif

#define STDIN_FILE 0
#define STDOUT_FILE 1
#define STDERR_FILE 2
#define MAXPARAMLEN 255

    void libc_init();
    char** cmdlineToArgv(char* cmdline, int *argc);
    unsigned int sleep (unsigned int __seconds);
    unsigned int sleepTicks(unsigned int __milliseconds);
    void stop();
    void modifySignal(int signal, void* sigHandler, int sigData);
    void libc_cleanup(void);
    int exec(char* path, int argc, char** argv);
    int execa(char* path, int argc, char** argv);
    int execb(char* path);
    int waitpid(uint32_t pid);
    time_t time (time_t *result);
    struct tm* gettime(struct tm *time, bool localTime);
    char* getcwd(char* buf, size_t size);
    char* setcwd(char* buf, size_t size);
    bool strisnum(char* str);
    void signalTask(int signal, int taskNum);
    int fork();
    size_t split(char *buffer, char *argv[], size_t argv_size);
    void exit (int status);
    int setSTD(int std, uint32_t filed);
    int setpriority(int which, int who, int prio);
    void takeADump();
    
#ifdef __cplusplus
}
#endif

#endif /* LIBCHRISOS_H */

