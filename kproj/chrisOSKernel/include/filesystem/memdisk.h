/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   memdisk.h
 * Author: yogi
 *
 * Created on February 10, 2019, 10:07 AM
 */

#ifndef MEMDISK_H
#define MEMDISK_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

#define TERMINAL_DISK_MAJOR_NUMBER 0x4321
#define DISK_MAX_MEMDISKS 10
    
    typedef struct smemdisk
    {
        int termDeviceMajor, termDeviceMinor;
        uint32_t size;
        char *mountPoint;
        char *image;
        
    } memdisk_t;

    memdisk_t *memDisks;
    int memDisksRegistered;
#ifdef __cplusplus
}
#endif

#endif /* MEMDISK_H */

