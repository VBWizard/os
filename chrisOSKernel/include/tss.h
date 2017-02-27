/* 
 * File:   tss.h
 * Author: yogi
 *
 * Created on June 1, 2016, 9:34 AM
 */

#ifndef TSS_H
#define	TSS_H

typedef struct sTss
{
    uint32_t    LINK;               //0x0
    uint32_t    ESP0;               //0x4
    uint32_t    SS0;                //0x8
    uint32_t    ESP1;               //0xC
    uint32_t    SS1;                //0x10
    uint32_t    ESP2;               //0x14
    uint32_t    SS2;                //0x18
    uint32_t    CR3,                //0x1C
                EIP,                //0x20
                EFLAGS,             //0x24
                EAX,                //0x28
                ECX,                //0x2C
                EDX,                //0x30
                EBX,                //0x34
                ESP,                //0x38
                EBP,                //0x3C
                ESI,                //0x40
                EDI;                //0x44
    uint32_t    ES;                 //0x48
    uint32_t    CS;                 //0x4C
    uint32_t    SS;                 //0x50
    uint32_t    DS;                 //0x54
    uint32_t    FS;                 //0x58
    uint32_t    GS;                 //0x5C
    uint32_t    LDTR;               //0x60
    uint16_t    trap;
    uint16_t    IOPB;               //0x64
} __attribute__((packed)) tss_t;

#endif	/* TSS_H */

