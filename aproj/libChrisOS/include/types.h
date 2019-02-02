/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   types.h
 * Author: yogi
 *
 * Created on April 29, 2017, 12:07 AM
 */

#ifndef TYPES_H
#define TYPES_H

#ifdef __cplusplus
extern "C" {
#endif

    typedef long int off_t;

        typedef enum epageprotection
    {
        PROT_READ = 1,
        PROT_WRITE = 2,
        PROT_EXEC = 3
    } ePageProtection;
    
    typedef enum emapflags
    {
        MAP_PRIVATE = 1<<1,
        MAP_SHARED = 1<<2,
        MAP_ANONYMOUS = 1<<3,
        MAP_STACK = 1<<4,
        MAP_FIXED = 1<<10 //MAP_FIXED has to be the largest value
    } eMapFlags;

#ifdef __cplusplus
}
#endif

#endif /* TYPES_H */

