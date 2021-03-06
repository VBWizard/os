/* 
 * File:   gdt.h
 * Author: yogi
 *
 * Created on April 27, 2016, 11:01 PM
 */

#ifndef GDT_H
#define	GDT_H
#include <stdbool.h>
#include <stdint.h>

#pragma once
#pragma pack(1)

typedef struct sgdt
{
    unsigned short limit_low;       //2
    unsigned short base_low;        //2
    char base_middle;               //1
    char access;                    //1
    char flags_and_limit;           //1
    char base_high;                 //1
} sGDT;

struct gdt_ptr 
{
    unsigned short limit;
    unsigned int base;
}__attribute__((packed));

enum {
    // Access byte properties
    GDT_PRESENT    = 0x80,

    GDT_DPL0       = 0x00, // DPL = descriptor privilege level (ring level)
    GDT_DPL1       = 0x20,
    GDT_DPL2       = 0x40,
    GDT_DPL3       = 0x60,

    GDT_CODE       = 0x08,
    GDT_READABLE   = 0x00,
    GDT_CONFORMING = 0x04,

    GDT_DATA       = 0x00,
    GDT_WRITABLE   = 0x02,
    GDT_GROW_DOWN  = 0x04,

    // Flags
    GDT_GRANULAR   = 0x80,
    GDT_32BIT       = 0x40,
    GDT_16BIT       = 0x00
};
//80+60+

void gdt_init();
void gdtEntryApplication(int entryNo, int base, int limit, char access, char flags,bool inUse);
void gdtEntryOS(int entryNo, int base, int limit, char access, char flags,bool inUse);
sGDT* getNewGDTEntry();
uint16_t getNonKernelCodeGDTIndex();
uint16_t getNonKernelDataGDTIndex();
uint16_t getKernelCodeGDTIndex();
uint16_t getKernelDataGDTIndex();
void installGDT();
#endif	/* GDT_H */
