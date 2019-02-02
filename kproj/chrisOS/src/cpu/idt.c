#include "i386/cpu.h"
#include "memory.h"
#include "chrisos.h"
#include "i386/gdt.h"

//extern void idt_load();//Defined in CPU.h

/* Use this function to set an entry in the IDT. Alot simpler
*  than twiddling with the GDT ;) */
void idt_set_gate(struct idt_entry *idt, unsigned short sel, uint32_t base, unsigned char flags)
{
  idt->base_lo = base & 0xFFFF;
  idt->sel = sel;
  idt->flags = flags | 0x80;
  idt->base_hi = (base >> 16) & 0xFFFF;}

/* Installs the IDT */
void idt_install(struct idt_ptr* idtp)
{
    /* Sets the special IDT pointer up, just like in 'gdt.c' */
    idtp->limit = (sizeof (struct idt_entry) * 256) - 1;
    idtp->base = (int)IDT_TABLE_ADDRESS;

    /* Clear out the entire IDT, initializing it to zeros */
    //memset(&idt, 0, sizeof(struct idt_entry) * 256);

    /* Add any new ISRs to the IDT here using idt_set_gate */

    /* Points the processor's internal register to the new IDT */
    idt_load((uint64_t)((uint64_t)(idtp->limit)<<32 | idtp->base));
}
void idt_init(struct idt_ptr* idtp, int remap_offset)
{
/* setting up the exception handlers and timer, keyboard ISRs */
    
    struct idt_entry* idtTable=(struct idt_entry*)IDT_TABLE_ADDRESS;
    idt_set_gate (&idtTable[0], 0x08, (int)&_isr_00_wrapper, ACS_INT); //divide by zero exception
    idt_set_gate (&idtTable[1], 0x08, (int)&_isr_31_wrapper, ACS_INT); //debug exception:1gdkmd64. triggered when TF=1 (I set TF=1 with INT03)
    idt_set_gate (&idtTable[2], 0x08, (int)&_isr_02_wrapper, ACS_INT); 
    idt_set_gate (&idtTable[3], 0x08, (int)&_isr_03_wrapper, ACS_INT | ACS_DPL_3); //this is the breakpoint exception.  Called with INT03.  Has to be CPL=3
    idt_set_gate (&idtTable[4], 0x08, (int)&_isr_04_wrapper, ACS_INT);
    idt_set_gate (&idtTable[5], 0x08, (int)&_isr_05_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x6], 0x08, (int)&_isr_06_wrapper, ACS_INT);    //Invalid Opcode
    idt_set_gate (&idtTable[0x7], 0x08, (int)&_isr_07_wrapper, ACS_INT);
    //idt_set_gate (&idtTable[0x8], 0x08, (int)&_isr_08_wrapper, ACS_INT);   //Double Fault
    idt_set_gate (&idtTable[0x9], 0x08, (int)&_isr_09_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0xa], 0x08, (int)&_isr_10_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0xb], 0x08, (int)&_isr_11_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0xc], 0x08, (int)&_isr_12_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0xd/*+remap_offset*/], 0x08, (int)&_isr_13_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0xe/*+remap_offset*/], 0x08, (int)&_isr_14_wrapper, ACS_INT);   //paging exception
    idt_set_gate (&idtTable[0xf], 0x08, (int)&_isr_15_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x10], 0x08, (int)&_isr_16_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x11], 0x08, (int)&_isr_17_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x12], 0x08, (int)&_isr_18_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x13], 0x08, (int)&_isr_19_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x16], 0x08, (int)&_isr_22_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x17], 0x08, (int)&_isr_23_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x18], 0x08, (int)&_isr_24_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x19], 0x08, (int)&_isr_25_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x1a], 0x08, (int)&_isr_26_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x1b], 0x08, (int)&_isr_27_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x1c], 0x08, (int)&_isr_28_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x1d], 0x08, (int)&_isr_29_wrapper, ACS_INT);
    idt_set_gate (&idtTable[0x1e], 0x08, (int)&_isr_30_wrapper, ACS_INT);

    idt_set_gate (&idtTable[0+remap_offset], 0x08, (int)&_irq0_handler, ACS_INT); //This is the IRQ0 handler, notice it is remapped
    idt_set_gate (&idtTable[1+remap_offset], 0x08, (int)&_isr_01_wrapper, ACS_INT); //Keyboard IRQ
    idt_set_gate (&idtTable[0x8+remap_offset], 0x08, (int)&_irq8_handler, ACS_INT); //RTC 0x28
    idt_set_gate (&idtTable[0x14+remap_offset], 0x08, (int)&_isr_20_wrapper, ACS_INT);   
    idt_set_gate (&idtTable[0x15+remap_offset], 0x08, (int)&_isr_21_wrapper, ACS_INT);  //leave this alone because this is the initially remapped keyboard irq
     
//    for (int cnt=0x24+remap_offset;cnt<0x90;cnt++)
//        idt_set_gate (&idtTable[cnt+remap_offset], 0x3b, (int)&_isr_32_wrapper, ACS_INT);
    idt_install(idtp);

}

//void idt_get_gate(struct idt_entry* idtTable, uint8_t idtIndex, unsigned short *sel, uint32_t *base, unsigned *char flags)
void idt_get_gate(struct idt_entry *idt, uint8_t idtIndex, unsigned short *sel, uint32_t *base, unsigned char *flags)
{
    *sel = idt[idtIndex].sel;
    *base = (idt[idtIndex].base_hi << 16) | idt[idtIndex].base_lo;
    *flags = idt[idtIndex].flags;
}

uintptr_t idt_get_gate_address(int vector)
{
   struct idt_entry* idtTable=(struct idt_entry*)IDT_TABLE_ADDRESS;
    unsigned short sel;
    uint32_t base;
    unsigned char flags;
    idt_get_gate(idtTable,vector,&sel,&base,&flags);
    return base;
}