/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   errors.h
 * Author: yogi
 *
 * Created on April 14, 2017, 1:28 AM
 */

#ifndef ERRORS_H
#define ERRORS_H

#ifdef __cplusplus
extern "C" {
#endif

#define ERROR_MMAP_ADDRESS_INVALID      -100
#define ERROR_MMAP_OFFSET_INVALID       -101
#define ERROR_MMAP_PROT_INVALID         -102
#define ERROR_MMAP_FLAGS_INVALID         -103
#define ERROR_MMAP_ADDRESS_IN_USE       -104

#ifdef __cplusplus
}
#endif

#endif /* ERRORS_H */

