/* 
 * File:   elfloader.h
 * Author: yogi
 *
 * Created on May 15, 2016, 10:11 PM
 */

#ifndef ELFLOADER_H
#define	ELFLOADER_H
#include "../../chrisOSKernel/include/dllist.h"

#ifdef	__cplusplus
extern "C" {
#endif
#include <elf.h>
#include <stdbool.h>
    
extern uint32_t kDebugLevel;

typedef struct sElfPageInfo
{
    uint32_t startVirt, startPhys, pages;
} elfPageInfo_t;

typedef struct sElfDynamicInfo
{
    char neededName[10][256];
    int neededPtr;
    int jmpRelSz, relATableSize, relAEntrySize, strTableName[50], strTableSize[50], symEntrySize, relTableSize, pltGOTTableTableSize,relEntrySize,
            neededCount, soNameStringIndex, rPathStringIndex, relEntryCount, dynTableSize, dynEntrySize, dynEntryCount;
    uintptr_t pltGOTTableAddress, hashTableAddress, *strTableAddress[50], strTableFilePtr[50], symTableAddress, relATableAddress, initFunctionAddress, 
            termFunctionAddress, relTableAddress,
            relTable_symTableLink;
    Elf32_Rela *relATable;
    Elf32_Rel *relTable;    
    Elf32_Dyn* dynTable;
} elfDynamic_t;

typedef struct sElfInfo
{
    dllist_t loadedListItem;
    int libraryElfCount;
    void* libraryElfPtr[10];
    uint32_t bssAddress, bssSize, dataAddress, dataSize, tdataAddress, tdataSize, textAddress, textSize; //CLR 12/23/2018: Added TData variables
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
    elfPageInfo_t* elfLoadedPages;
    bool mapMemoryOnly; //set to true if library is already loaded, and we only want to map it into the new process
    int usageCount;
} __attribute__((packed)) elfInfo_t;

bool loadElf(void* file,elfInfo_t* elfInfo, bool isLibrary);
void sysProcessReturn();

#ifdef	__cplusplus
}
#endif

#endif	/* ELFLOADER_H */

