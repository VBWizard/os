/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   assert.h
 * Author: yogi
 *
 * Created on March 3, 2019, 6:43 AM
 */

#ifndef ASSERT_H
#define ASSERT_H

#ifdef __cplusplus
extern "C" {
#endif

#include "printf.h"
    
//#define ASSERT(a) {if (!a) assertPanic("",__FILE__,__LINE__);}
#define ASSERTM(a,b) {if (!a) assertPanic(b,__FILE__,__LINE__);}
//FROM: https://barrgroup.com/Embedded-Systems/How-To/Define-Assert-Macro
#define ASSERT(expr) \
    if (!(expr)) \
        assertPanic(#expr,__FILE__,__LINE__)

#ifdef __cplusplus
}
#endif

#endif /* ASSERT_H */

