/* 
 * File:   gpt.h
 * Author: yogi
 *
 * Created on June 7, 2016, 9:11 AM
 */

#ifndef GPT_H
#define	GPT_H

typedef struct gptHeader
{
    uint32_t    sigl;                //0
    uint32_t    sigh;
    uint32_t    revision;           //8
    uint32_t    hdrSize;            //12
    uint32_t    crc32;              //16
    uint32_t    zeroes;             //20
    uint32_t    headerLBAL, headerLBAH;          //24
    uint32_t    backupHeaderLBAL,backupHeaderLBAH;    //32
    uint32_t    firstUsableLBAL,firstUsableLBAH;     //40
    uint32_t    lastUsableLBAL,lastUsableLBAH;      //48
    uint8_t     diskGUID[16];       //56
    uint32_t    partEntryLBAL,partEntryLBAH;       //72
    uint32_t    partEntryCount;     //80
    uint32_t    partEntrySize;      //84
    uint32_t    partArrayCRC32;     //88
} __attribute__((packed)) gptHeader_t;

typedef struct gptPartEntry
{
    uint8_t     partTypeGUID[16];
    uint8_t     uniquePartGUID[16];
    uint32_t    partFirstLBAL,partFirstLBAH;
    uint32_t    partLastLBAL,partLastLBAH;
    uint32_t    partFlagsL,partFlagsH;
    uint16_t     partName[36];
} gptPartEntry_t;

#endif	/* GPT_H */

