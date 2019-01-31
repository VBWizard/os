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

#include <stdint.h>
    
    struct direntry
    {
    char                      filename[260];
    uint8_t                   is_dir;
    uint32_t                  cluster;
    uint32_t                  size;
    uint16_t                  access_date;
    uint16_t                  write_time;
    uint16_t                  write_date;
    uint16_t                  create_date;
    uint16_t                  create_time;
    } __attribute((packed));
    
    typedef struct direntry direntry_t;
    
    void* open(char* path, const char* mode);
    void close(void* handle);
    int read(void* handle, void *buffer, int size, int length);
    int write(void* handle, void *buffer, int size, int length);
    int getdir(char* path, char *buffer, int bufferCount);
    int seek(void* handle, long position, int whence);
    
    int writeI(void* handle, void *buffer, int size, int length);
    
#ifdef __cplusplus
}
#endif

#endif /* FILE_H */

