/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   mmap.h
 * Author: yogi
 *
 * Created on January 27, 2019, 4:31 PM
 */

#ifndef MMAP_H
#define MMAP_H

#ifdef __cplusplus
extern "C" {
#endif
#include "types.h"
#include "../../../kproj/chrisOSKernel/include/mmap.h"
    
    void* mmap (void *addr,size_t len,int prot,int flags,int fd,off_t offset);


#ifdef __cplusplus
}
#endif

#endif /* MMAP_H */

