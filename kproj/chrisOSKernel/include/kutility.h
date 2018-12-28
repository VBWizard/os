/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   kutility.h
 * Author: yogi
 *
 * Created on April 21, 2017, 6:50 AM
 */

#ifndef KUTILITY_H
#define KUTILITY_H

#ifdef __cplusplus
extern "C" {
#endif

#define SAVE_CURRENT_CR3(cr3) {__asm__("mov eax,cr3\n":"=a" (cr3));}
#define LOAD_CR3(cr3) {__asm__("mov cr3,eax\n"::"a" (cr3));}
#define LOAD_KERNEL_CR3 LOAD_CR3(KERNEL_CR3)
    
#ifdef __cplusplus
}
#endif

#endif /* KUTILITY_H */

