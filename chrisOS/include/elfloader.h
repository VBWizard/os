/* 
 * File:   elfloader.h
 * Author: yogi
 *
 * Created on May 15, 2016, 10:11 PM
 */

#ifndef ELFLOADER_H
#define	ELFLOADER_H

#ifdef	__cplusplus
extern "C" {
#endif
#include <elf.h>
#include <stdbool.h>
    
extern uint32_t kDebugLevel;

typedef struct sElfDynamicInfo
{
    char neededName[10][256];
    int neededPtr;
    int neededExecLoadNum[10];
    int jmpRelSz, relATableSize, relAEntrySize, strTableSize, symEntrySize, relTableSize, pltGOTTableTableSize,relEntrySize,neededCount, soNameStringIndex, rPathStringIndex, relEntryCount;
    uintptr_t pltGOTTableAddress, hashTableAddress, strTableAddress, symTableAddress, relATableAddress, initFunctionAddress, termFunctionAddress, relTableAddress;
    
} elfDynamic_t;

typedef struct sElfInfo
{
    Elf32_Ehdr hdr;
    Elf32_Shdr secHdrTable[50];
    Elf32_Phdr pgmHdrTable[50];
    int secHdrRecordCount, pgmHdrRecordCount,dynamicRecordCount;
    uintptr_t dynamicSectionAddress;
    elfDynamic_t dynamicInfo;
    uintptr_t libLoadAddress;
    bool loadCompleted;
} elfInfo_t;

void loadElf(void* file,elfInfo_t* elfInfo, bool isLibrary);

#ifdef	__cplusplus
}
#endif

#endif	/* ELFLOADER_H */

