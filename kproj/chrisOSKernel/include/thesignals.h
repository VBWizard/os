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
        SIG_HALT = 1,
        SIG_SLEEP = 2,
        SIG_USLEEP = 4,
        SIG_SEGV = 0x800,
        SIG_STOP = 0x2000,
    } eSignals;
    



#ifdef __cplusplus
}
#endif

#endif /* THESIGNALS_H */

