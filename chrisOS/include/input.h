/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   input.h
 * Author: yogi
 *
 * Created on March 26, 2017, 1:23 AM
 */

#ifndef INPUT_H
#define INPUT_H

#ifdef __cplusplus
extern "C" {
#endif

    char getc();
    void gets(char* buffer, int maxlen, int stream);
    void puts(char* buffer);

#ifdef __cplusplus
}
#endif

#endif /* INPUT_H */

