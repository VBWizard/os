/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   pipe.h
 * Author: yogi
 *
 * Created on January 12, 2019, 9:00 PM
 */

#ifndef PIPE_H
#define PIPE_H

#ifdef __cplusplus
extern "C" {
#endif

#include "fs.h"
    
#define PIPE_FILE_SIZE 65535

    typedef enum EPipeMode
    {
        PIPEREAD = 1,
        PIPEWRITE = 2,
        PIPENOBLOCK = 4
    } ePipeMode;
    
    typedef struct sPipe
    {
        file_t *file[2];       //This has to be the first field so I can use the pointer to create a pipe_t
        process_t* owner;
        char mode[10];
        uint32_t flags;
        uint32_t usecount;
        fileops_t* fops;
        uint32_t check;
        //char* bufferptr; NOTE: Using file->currOffset instead of bufferptr
        
    } pipe_t;

    filesystem_t *initpipefs();
    void *pipeopen(void* filePtr, const char *mode);
    bool pipeclose(file_t *file);
    size_t piperead(void *buffer, int size, int length, void *f);
    size_t pipewrite(const void *buffer, int size, int count, void *f);
    pipe_t *pipedup1(void* path, const char *mode, file_t* file);
    int fs_pipe(process_t *process, int pipefd[2]);
    int fs_pipeI(process_t *process, int pipefd[2], int flags);
    int fs_dup3(process_t *process, file_t *oldFile, int newFileFD, int flags);
    
    typedef struct
    {
        char* path;
        pipe_t* pipe;
        file_t* file;
    } pipes_t;
    
    pipes_t openPipes[10000];
    
#ifdef __cplusplus
}
#endif

#endif /* PIPE_H */

