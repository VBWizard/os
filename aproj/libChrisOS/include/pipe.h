/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   pipe.h
 * Author: yogi
 *
 * Created on January 13, 2019, 12:28 AM
 */

#ifndef PIPE_H
#define PIPE_H

#ifdef __cplusplus
extern "C" {
#endif
    
    typedef enum EPipeMode
    {
        PIPEREAD = 1,
        PIPEWRITE = 2,
        PIPENOBLOCK = 4
    } ePipeMode;
    
    int pipe(int pipefd[2]);
    int dup3(int oldfd, int newfd, int flags);

#ifdef __cplusplus
}
#endif

#endif /* PIPE_H */

