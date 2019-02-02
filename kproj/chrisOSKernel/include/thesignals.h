/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   thesignals.h
 * Author: yogi
 *
 * Created on April 1, 2017, 4:15 AM
 */

#ifndef THESIGNALS_H
#define THESIGNALS_H

#ifdef __cplusplus
extern "C" {
#endif

    typedef enum esignals
    {
        SIGHALT = 1,
        SIGSLEEP = 1 << 1,
        SIGUSLEEP = 1 << 2,
        SIGINT = 1 << 3,
        SIGSEGV = 1 << 4,
        SIGSTOP = 1 << 5,
        SIGIO = 1 << 6
    } signals;
    



#ifdef __cplusplus
}
#endif

#endif /* THESIGNALS_H */

