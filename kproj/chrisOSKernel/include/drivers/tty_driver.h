/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   terminal_driver.h
 * Author: yogi
 *
 * Created on January 21, 2019, 1:42 PM
 */

#ifndef TERMINAL_DRIVER_H
#define TERMINAL_DRIVER_H
#include "filesystem/pipe.h"
#include "fs.h"

#define TTY_MAX_DEVICES 20

    typedef struct sTTYDriver
    {
        int termDeviceMajor, termDeviceMinor;
        file_t* piper, *pipew;
    } ttydevice_t;

    ttydevice_t *ttyDevices;
    int ttysRegistered;
    
    ttydevice_t *registerTTY(int deviceMajor, int deviceMinor);
    
#ifdef __cplusplus
extern "C" {
#endif




#ifdef __cplusplus
}
#endif

#endif /* TERMINAL_DRIVER_H */

