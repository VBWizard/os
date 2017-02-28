/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "i386/cpu.h"
#include "memory.h"
#include "chrisos.h"

/* Use this function to set an entry in the IDT. Alot simpler
*  than twiddling with the GDT ;) */
void idt_set_gate(struct idt_entry *idt, unsigned short sel, uint32_t base, unsigned char flags)
{
  idt->base_lo = base & 0xFFFF;
  idt->sel = sel;
  idt->flags = flags | 0x80;
  idt->base_hi = (base >> 16) & 0xFFFF;}

/* Installs the IDT */
void idt_install()
{
    struct idt_ptr* idtp;
    /* Sets the special IDT pointer up, just like in 'gdt.c' */
    idtp->limit = (sizeof (struct idt_entry) * 256) - 1;
    idtp->base = (int)IDT_TABLE_ADDRESS;

    /* Clear out the entire IDT, initializing it to zeros */
    //memset(&idt, 0, sizeof(struct idt_entry) * 256);

    /* Add any new ISRs to the IDT here using idt_set_gate */

    /* Points the processor's internal register to the new IDT */
    idt_load((uint64_t)((uint64_t)(idtp->limit)<<32 | idtp->base));
}
