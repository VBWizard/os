/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   x86idt.h
 * Author: yogi
 *
 * Created on February 23, 2017, 8:30 PM
 */

#ifndef X86IDT_H
#define X86IDT_H

#ifdef __cplusplus
extern "C" {
#endif

void idt_set_gate(struct idt_entry *idt, unsigned short sel, uint32_t base, unsigned char flags);
void idt_install();

#ifdef __cplusplus
}
#endif

#endif /* X86IDT_H */

