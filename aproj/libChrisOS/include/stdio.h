/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   stdio.h
 * Author: yogi
 *
 * Created on April 9, 2017, 3:05 AM
 */

#ifndef STDIO_H
#define STDIO_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>    

#define STDIN_FILE 0
#define STDOUT_FILE 1
#define STDERR_FILE 2
    

    void moveTo(int row, int col);
    void resetRow();



#ifdef __cplusplus
}
#endif

#endif /* STDIO_H */

