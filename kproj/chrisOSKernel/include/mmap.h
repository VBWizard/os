/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   mmap.h
 * Author: yogi
 *
 * Created on April 14, 2017, 1:04 AM
 */

#ifndef MMAP_H
#define MMAP_H


#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>
#include <stddef.h> 
#include <sys/types.h>
#include "config.h"
#include "process.h"
#include "printf.h"
#include "mm.h"
    
#define MAP_FAILED -1;
    typedef enum epageprotection
    {
        PROT_READ = 1,
        PROT_WRITE = 2,
        PROT_EXEC = 3
    } ePageProtection;
    
    typedef enum emapflags
    {
        MAP_PRIVATE = 1,
        MAP_SHARED = 2,
        MAP_FIXED = 3
    } eMapFlags;

    typedef struct smmappedpage
    {
        uintptr_t offset;   //file offset
        uintptr_t address;  //memory offset
        bool loaded;        //Is page loaded?
        dllist_t listItem;
    } mmappedPage_t;
    
    struct smemorymapping
    {
        process_t* process;
        uintptr_t startAddress;     //Does this need to be page aligned?
        uint32_t startFileOffset;   //Does this need to be page aligned?
        size_t len;                 //We will round to interval of PAGE_SIZE
        int protection;             
        int flags;
        int fd;
        dllist_t listItem;
        mmappedPage_t* mmappedPages;
    };

    typedef struct smemorymapping memmap_t;

    void * sys_mmap (void *addr,size_t len,int prot,int flags,int fd,off_t offset);
    
#ifdef __cplusplus
}
#endif

#endif /* MMAP_H */

