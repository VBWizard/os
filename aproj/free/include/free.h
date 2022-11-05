/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   free.h
 * Author: yogi
 *
 * Created on February 19, 2019, 1:11 PM
 */

#ifndef FREE_H
#define FREE_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stddef.h>

    char *getFree(bool humanReadable, char *in, int inLen);


#ifdef __cplusplus
}
#endif

#endif /* FREE_H */

