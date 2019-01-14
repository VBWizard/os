/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   file.h
 * Author: yogi
 *
 * Created on January 1, 2019, 3:00 PM
 */

#ifndef FILE_H
#define FILE_H

#ifdef __cplusplus
extern "C" {
#endif

    void* open(char* path, const char* mode);
    void close(void* handle);
    int read(void* handle, void *buffer, int size, int length);
    int write(void* handle, void *buffer, int size, int length);
    int getdir(char* path, char *buffer, int bufferCount);

#ifdef __cplusplus
}
#endif

#endif /* FILE_H */

