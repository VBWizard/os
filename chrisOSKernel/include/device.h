/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   device.h
 * Author: yogi
 *
 * Created on March 25, 2017, 11:29 AM
 */

#ifndef DEVICE_H
#define DEVICE_H

#ifdef __cplusplus
extern "C" {
#endif

    //Types of device
    //methods
    //  read                USB/HD/Mouse/Keyboard/Display/Timer/
    //  write               USB/HD/Display/Timer
    //  seek                HD/Display
    //  delete              USB/HD
    //  change properties   USB/HD/Mouse/Keyboard/Display/Timer
    //  

    typedef struct sport
    {
        uint64_t port_num;
        bool readable, writable;
    } port_t;
    
    typedef struct sinterrupt
    {
        int interrupt_num;
        void handler_high();
        void handler_low();
    } interrupt_t;
    
    typedef enum eseektype
    {
        SEEK_SET,
        SEEK_CUR,
        SEEK_END
    } seek_t;
    
    typedef struct sdevice
    {
        uint64_t node_id;
        char* device_id;
        uint64_t port;
        int read (uint64_t node, uint64_t targetAddress, void* buffer, uint64_t count);          //Function prototype for reading
        int write(uint64_t node, uint64_t targetAddress, void* buffer, uint64_t count);          //Function prototype for writing
        int seek (uint64_t node, uint64_t targetAddress, seek_t seek_type);          //Function prototype for seeking
        
    } device_t;

    typedef struct sdevices
    {
        listhead_t list;
        device_t* device;
    } devices_t;
    

#ifdef __cplusplus
}
#endif

#endif /* DEVICE_H */

