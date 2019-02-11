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
    
    struct sfstat
    {
        uint32_t     st_size;        /* Total size, in bytes */
        uint32_t  st_lastmod;
    };
    
    typedef struct direntry direntry_t;
    typedef struct sfstat fstat_t;
    
    uintptr_t *filesToClose;
    uint32_t filesToCloseCount;

    void* open(char* path, const char* mode);
    void close(void* handle);
    int read(void* handle, void *buffer, int size, int length);
    int write(void* handle, void *buffer, int size, int length);
    int getdir(char* path, char *buffer, int bufferCount);
    int seek(void* handle, long position, int whence);
    void* freopen(char* path, const char* mode, void *stream);
    int stat(char *path, fstat_t *stat);
    int resolvePath(const char *inPath, char *outPath);
    
    int writeI(void* handle, void *buffer, int size, int length);
    void file_cleanup();
#ifdef __cplusplus
}
#endif

#endif /* FILE_H */

