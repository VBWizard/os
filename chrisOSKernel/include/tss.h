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
    uint16_t    reserved1, LINK;    //0x0
    uint32_t    ESP0;               //0x4
    uint16_t    reserved2, SS0;     //0x8
    uint32_t    ESP1;               //0xC
    uint16_t    reserved3, SS1;     //0x10
    uint32_t    ESP2;               //0x14
    uint16_t    reserved4, SS2;     //0x18
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
    uint16_t    reserved5, ES;      //0x48
    uint16_t    reserved6, CS;      //0x4C
    uint16_t    reserved7, SS;      //0x50
    uint16_t    reserved8, DS;      //0x54
    uint16_t    reserved9, FS;      //0x58
    uint16_t    reserved10, GS;     //0x5C
    uint16_t    reserved11, LDTR;   //0x60
    uint16_t    IOPB, reserved12;   //0x64
} __attribute__((packed)) tss_t;

#endif	/* TSS_H */

