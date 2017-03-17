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
    int jmpRelSz, relATableSize, relAEntrySize, strTableName[50], strTableSize[50], symEntrySize, relTableSize, pltGOTTableTableSize,relEntrySize,
            neededCount, soNameStringIndex, rPathStringIndex, relEntryCount;
    uintptr_t pltGOTTableAddress, hashTableAddress, *strTableAddress[50], strTableFilePtr[50], symTableAddress, relATableAddress, initFunctionAddress, 
            termFunctionAddress, relTableAddress,
            relTable_symTableLink;
    Elf32_Rela *relATable;
    Elf32_Rel *relTable;    
} elfDynamic_t;

typedef struct sElfInfo
{
    Elf32_Ehdr hdr;
    Elf32_Shdr secHdrTable[50];
    Elf32_Phdr pgmHdrTable[50];
    Elf32_Sym *symTable;
    int secHdrRecordCount, pgmHdrRecordCount,dynamicRecordCount, dynamicSymbolRecordCount, symTableRecordCount, symStrTabLink;
    uintptr_t dynamicSectionAddress, dynamicSymbolAddress;
    elfDynamic_t dynamicInfo;
    uintptr_t libLoadAddress;
    bool loadCompleted,isLibrary;
    int sectionNameStringTable, dynamicNameStringTable, generalNameStringTable;
    char* fileName;
} elfInfo_t;

void loadElf(void* file,elfInfo_t* elfInfo, bool isLibrary);
void sysProcessReturn();

#ifdef	__cplusplus
}
#endif

#endif	/* ELFLOADER_H */

