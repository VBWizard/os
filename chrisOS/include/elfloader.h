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
    int neededPtr, strTableAddressCount;
    int neededExecLoadNum[10];
    int jmpRelSz, relATableSize, relAEntrySize, strTableName[5], strTableSize[5], symEntrySize, relTableSize, pltGOTTableTableSize,relEntrySize,neededCount, soNameStringIndex, rPathStringIndex, relEntryCount;
    uintptr_t pltGOTTableAddress, hashTableAddress, *strTableAddress[5], strTableFilePtr[5], symTableAddress, relATableAddress, initFunctionAddress, termFunctionAddress, relTableAddress;
    
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
    uintptr_t sectionNameStringTable;
} elfInfo_t;

void loadElf(void* file,elfInfo_t* elfInfo, bool isLibrary);
void sysProcessReturn();

#ifdef	__cplusplus
}
#endif

#endif	/* ELFLOADER_H */

