/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   syscalls.h
 * Author: yogi
 *
 * Created on April 1, 2017, 4:19 AM
 */

#ifndef SYSCALLS_H
#define SYSCALLS_H

#ifdef __cplusplus
extern "C" {
#endif

    typedef enum esyscalls
    {
        SYSCALL_INVALID                 = 0x0,
        SYSCALL_ENDPROCESS 		= 0x1,
        SYSCALL_OPEN                    = 0x2,
        SYSCALL_CLOSE                   = 0x3,
        SYSCALL_READ 			= 0x4,  
        SYSCALL_WRITE 			= 0x5,
        SYSCALL_FORK                    = 0x6,
        SYSCALL_GETCWD                  = 0x4f,
        SYSCALL_EXEC			= 0x59,
        SYSCALL_WAITFORPID		= 0x61,
        SYSCALL_SETPRIORITY             = 0x97,
        SYSCALL_REGEXITHANDLER          = 0x163,
        SYSCALL_FREE			= 0x164,
        SYSCALL_ALLOC			= 0x165,
        SYSCALL_SLEEP			= 0x166,
        SYSCALL_SETSIGACTION            = 0x167,
        SYSCALL_STOP			= 0x168,
        SYSCALL_REBOOT			= 0x169,
        SYSCALL_GETTICKS		= 0x170,
        SYSCALL_GETTIME                 = 0x171,
        SYSCALL_PRINT			= 0x300,
        SYSCALL_PRINTD			= 0x301,
        SYSCALL_HLT			= 0x302,
        SYSCALL_MASKSIG                 = 0x303,
        SYSCALL_GETDENTS                = 0x304
    } E_SYSCALLS;



#ifdef __cplusplus
}
#endif

#endif /* SYSCALLS_H */

