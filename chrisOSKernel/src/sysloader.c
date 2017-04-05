#define USE_FILELIB_STDIO_COMPAT_NAMES 1
#include "chrisos.h"
#include <elf.h>
#include <string.h>
#include "elfloader.h"
#include "printf.h"
#include "utility.h"
#include "exec.h"
#include "task.h"
#include "strings.h"
#include "../../chrisOS/include/init/ata_disk.h"
#include "../../chrisOS/src/fat/fat_filelib.h"
#include "../../chrisOS/include/filesystem.h"
#include "sysloader.h"
#include "../include/mm.h"
#include "../include/paging.h"
#include "../include/alloc.h"
#include "kmalloc.h"
#include "../../chrisOS/include/printf.h"
#include "dllist.h"

extern struct ataDeviceInfo_t* kATADeviceInfo;
extern tss_t* kTSSTable;
uint32_t cr3BeforeExec;
extern int kAHCISelectedDiskNum; 
extern int kAHCISelectedPartNum;
extern int ahciBlockingRead28(uint32_t sector, uint8_t *buffer, uint32_t sector_count);
extern int ahciBlockingWrite28(/*unsigned drive, */uint32_t sector, uint8_t *buffer, uint32_t sector_count);
extern uint32_t getCS();
extern uint32_t getDS();
extern uint32_t getES();
extern uint32_t getFS();
extern uint32_t getGS();
extern uint32_t getSS();
extern uint32_t getESP();
extern sGDT* bootGdt;
extern dllist_t* kLoadedElfInfo;

uint32_t libLoadOffset=LIBRARY_BASE_LOAD_ADDRESS;
uintptr_t previousCR3=0,newCR3;

#define GET_OLD_CR3 __asm__("mov ebx,cr3\n":[previousCR3] "=b" (previousCR3));
#define SWITCH_CR3 __asm__("mov cr3,eax\n"::[newCR3] "a" (newCR3));
#define CURRENT_CR3 ({uint32_t cr3Val; \
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})
#define LOAD_ZERO_BASED_DS     __asm__("mov eax,0x90\nmov ds,eax":::"eax");
#define LOAD_KERNEL_BASED_DS __asm__("mov eax,0x10\nmov ds,eax":::"eax");

void _sysCall(uint32_t CallNum, uint32_t param1, uint32_t param2, uint32_t param3);
static int elf_relocate(elfInfo_t* elf);
void elfDumpSymbols(elfInfo_t* elf);

char* strTabEntry(int tableNum, elfInfo_t* elf, int index)
{
    char* addr=NULL;
    if (elf->dynamicInfo.strTableAddress[tableNum] && index < elf->dynamicInfo.strTableSize[tableNum])
    {
        addr=(char*)elf->dynamicInfo.strTableAddress[tableNum];
        addr+=index;
    }
    return (char*)addr;
}

char* strTabEntryBySTName(char* stringTableName, elfInfo_t* elf, int index)
{
    int stringTableNum=0;
    
    for (int cnt=0;cnt<50;cnt++)
    {
        if (strncmp(
                stringTableName,
                strTabEntry(elf->sectionNameStringTable, elf, elf->dynamicInfo.strTableName[cnt]),255))
        {
            stringTableNum=cnt;
            break;
        }
    }
    return strTabEntry(stringTableNum,elf,index);
}

void restoreCR3()
{
    __asm__("mov cr3,eax\n"::[previousCR3] "a" (INIT_GDT_TABLE_ADDRESS));
}


uint32_t processELFDynamicSection(elfInfo_t* elfInfo, uint32_t targetCR3)
{
    Elf32_Dyn* dyn=(Elf32_Dyn*)elfInfo->dynamicSectionAddress;

    printd(DEBUG_ELF_LOADER,"Processing ELF Dynamic section at 0x%08X, %u records\n",elfInfo->dynamicSectionAddress,elfInfo->dynamicRecordCount);
    //Next process the rest of the dynamic section entries
    elfInfo->dynamicInfo.neededCount=0;
    LOAD_ZERO_BASED_DS
    for (int cnt=0;cnt<elfInfo->dynamicRecordCount;cnt++)
    {
        switch (dyn[cnt].d_tag)
        {
            //DT_NEEDED is a library which we need to load
            case DT_NEEDED:
                printd(DEBUG_ELF_LOADER,"ELF at: 0x%08X, copy to: 0x%08X, neededCount=0x%08X\n",
                        elfInfo, elfInfo->dynamicInfo.neededName[elfInfo->dynamicInfo.neededCount],++elfInfo->dynamicInfo.neededCount);
                printd(DEBUG_ELF_LOADER,"Reading NEEDED name from string table index 0x%04X (0x%04X)\n",dyn[cnt].d_un.d_val, dyn[cnt].d_un.d_ptr);
                printd(DEBUG_ELF_LOADER,"Needed name = %s\n",strTabEntry(elfInfo->dynamicNameStringTable,elfInfo,dyn[cnt].d_un.d_val));
                strcpy(elfInfo->dynamicInfo.neededName[elfInfo->dynamicInfo.neededCount],
                        //strTabEntryBySTName(".strtab",elfInfo,dyn[cnt].d_un.d_val));
                        strTabEntry(elfInfo->dynamicNameStringTable,elfInfo,dyn[cnt].d_un.d_val));
                char fileName[100]="/";
                strcat(fileName,elfInfo->dynamicInfo.neededName[elfInfo->dynamicInfo.neededCount]);
                printd(DEBUG_ELF_LOADER,"Found NEEDED, library name='%s', checking to see if it is already loaded.\n",
                        fileName);
                
                dllist_t* theList=kLoadedElfInfo;
                do
                {
                    elfInfo_t* searchElf=theList->payload;
                    printd(DEBUG_ELF_LOADER,"\tFound loaded module %s ... ",searchElf->fileName);
                    if (searchElf->isLibrary)
                    {
                        if (strncmp(searchElf->fileName,fileName,1024)==0)
                        {
                            printd(DEBUG_ELF_LOADER,"\tthis is the module we want ... mapping into program's vm.\n",searchElf->fileName);
                            //TODO: Implement this when ready to test again: searchElf->mapMemoryOnly=true;
                            //DO STUFF HERE
                            break;
                        }
                    }
                    else
                    {
                        printd(DEBUG_ELF_LOADER,"Not a library, skipping to the next\n");
                    }
                    theList=theList->next;
                } while (theList->next!=theList);
                
                if (kDebugLevel&DEBUG_ELF_LOADER)
                {
                    printd(DEBUG_ELF_LOADER,"loadElf: Calling loadElf again to load '%s'\n",&fileName);
                }
                elfInfo->libraryElfPtr[elfInfo->libraryElfCount]=sysLoadElf(fileName,NULL,targetCR3);
                ((elfInfo_t*)elfInfo->libraryElfPtr[elfInfo->libraryElfCount])->isLibrary=true;
                if (! ((elfInfo_t*)elfInfo->libraryElfPtr[elfInfo->libraryElfCount++])->loadCompleted)
                {
                    printd(DEBUG_ELF_LOADER,"EXEC: processELFDynamicSection ... loading library failed.");
                    elfInfo->loadCompleted=false;
                    return -1;
                }
                break;
            case DT_PLTRELSZ:
                elfInfo->dynamicInfo.pltGOTTableTableSize=dyn[cnt].d_un.d_val;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_PLT_RELSZ",dyn[cnt].d_un.d_ptr);
                break;
            case DT_PLTGOT:
                elfInfo->dynamicInfo.pltGOTTableAddress=dyn[cnt].d_un.d_ptr;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_PLTGOT",dyn[cnt].d_un.d_ptr);
                break;
            case DT_HASH:
                elfInfo->dynamicInfo.hashTableAddress=dyn[cnt].d_un.d_ptr;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_HASH",dyn[cnt].d_un.d_ptr);
                break;
            case DT_STRTAB:
                //This is the general string table
                
                break;
            case DT_SYMTAB:
                //Already found it
                break;
            case DT_RELA:
                //elfInfo->dynamicInfo.relATableAddress=dyn[cnt].d_un.d_ptr;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_RELA",dyn[cnt].d_un.d_ptr);
                break;
            case DT_RELASZ:
                //elfInfo->dynamicInfo.relATableSize=dyn[cnt].d_un.d_val;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_RELASZ",dyn[cnt].d_un.d_ptr);
                break;
            case DT_RELAENT:
                elfInfo->dynamicInfo.relAEntrySize=dyn[cnt].d_un.d_val;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_RELAENT",dyn[cnt].d_un.d_ptr);
                break;
//            case DT_STRSZ:
//                elfInfo->dynamicInfo.strTableSize=dyn[cnt].d_un.d_val;
                break;
            case DT_SYMENT:
                elfInfo->dynamicInfo.symEntrySize=dyn[cnt].d_un.d_val;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_SYMENT",dyn[cnt].d_un.d_val);
                break;
            case DT_INIT:
                elfInfo->dynamicInfo.initFunctionAddress=dyn[cnt].d_un.d_ptr;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_INIT",dyn[cnt].d_un.d_ptr);
                break;
            case DT_FINI:
                elfInfo->dynamicInfo.termFunctionAddress=dyn[cnt].d_un.d_ptr;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_FINI",dyn[cnt].d_un.d_ptr);
                break;
            case DT_SONAME:
                //
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_SONAME",dyn[cnt].d_un.d_ptr);
                break;
            case DT_REL:
                //Can't find the relocation section this way, using section headers
                //elfInfo->dynamicInfo.relTableAddress=dyn[cnt].d_un.d_ptr;
                //printk("%s: Found DT_REL, address=0x%08X (0x%08X)\n",isLibrary?"library":"executable",dyn[cnt].d_un.d_ptr,elfInfo->dynamicInfo.relTableAddress);
                break;
            case DT_RELSZ:
                elfInfo->dynamicInfo.relTableSize=dyn[cnt].d_un.d_val;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_RELSZ",dyn[cnt].d_un.d_ptr);
                break;
            case DT_RELENT:
                elfInfo->dynamicInfo.relEntrySize=dyn[cnt].d_un.d_val;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_RELENT",dyn[cnt].d_un.d_ptr);
                break;
            case DT_PLTREL:
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_PLTREL",dyn[cnt].d_un.d_ptr);
                break;
            case DT_TEXTREL:
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_TEXTREL",dyn[cnt].d_un.d_ptr);
                break;
            case DT_JMPREL:
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_JMPREL",dyn[cnt].d_un.d_ptr);
                break;
            case DT_BIND_NOW:
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_BIND_NOW",dyn[cnt].d_un.d_ptr);
                break;
            case DT_INIT_ARRAY:
                elfInfo->dynamicInfo.initFunctionAddress=dyn[cnt].d_un.d_ptr;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_INIT_ARRAY",dyn[cnt].d_un.d_ptr);
                break;
            case DT_FINI_ARRAY:
                elfInfo->dynamicInfo.termFunctionAddress=dyn[cnt].d_un.d_ptr;
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_FIN_ARRAY",dyn[cnt].d_un.d_ptr);
                break;
            case DT_INIT_ARRAYSZ:
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_INIT_ARRYSZ",dyn[cnt].d_un.d_ptr);
                break;
            case DT_FINI_ARRAYSZ:
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_FINI_ARRAYSZ",dyn[cnt].d_un.d_ptr);
                break;
            case DT_FLAGS:
                printd(DEBUG_ELF_LOADER,"Found dynamic tag '%s', pointer=0x%08X\n","DT_FLAGS",dyn[cnt].d_un.d_ptr);
                break;
            default:
                printd(DEBUG_ELF_LOADER,"Found dynamic tag (0x%08x), pointer=0x%08X\n",dyn[cnt].d_tag,dyn[cnt].d_un.d_ptr);
                break;
        }
    }
    LOAD_KERNEL_BASED_DS
    return 0;
}


//Read the data from the file and write it to the virtual addresses, mapping new pages as necessary
bool putDataOnPages(uintptr_t CR3, uintptr_t virtAddr, void* file, bool writeFromFile, int size, byte nonFileWriteValue, _Bool mapOnly)
{
    int startVirtAddr=virtAddr;
    int startPhysAddr=0;
    int countToWrite=0;
    int totalLeftToWrite=size;
    while(totalLeftToWrite>0)
    {
        printd(DEBUG_ELF_LOADER,"putDataOnPages: Bytes left to go: 0x%08X\n",totalLeftToWrite);
        //If either the write doesn't start at the beginning of the page, or there is less than a page left to write
        if ((startVirtAddr%PAGE_SIZE!=0) || (totalLeftToWrite < PAGE_SIZE))
        {
            if (totalLeftToWrite>PAGE_SIZE-(startVirtAddr%PAGE_SIZE))
                countToWrite=PAGE_SIZE-(startVirtAddr%PAGE_SIZE);
            else
                countToWrite=totalLeftToWrite;
            printd(DEBUG_ELF_LOADER,"putDataOnPages: Non-aligned or not full page write, writing 0x%08X bytes to 0x%08X\n",countToWrite,startVirtAddr);
        }
        else
        {
                countToWrite=PAGE_SIZE;
                printd(DEBUG_ELF_LOADER,"putDataOnPages: Full page write, writing 1 page to 0x%08X\n",startVirtAddr);
        }
        
        //find out if page is mapped
        //printd(DEBUG_ELF_LOADER,"isPageMapped returning %s for startVirtAddr=0x%08X\n",isPageMapped(CR3,startVirtAddr)==true?"true":"false",startVirtAddr);
        if (isPageMapped(CR3,startVirtAddr))
        {
            startPhysAddr=pagingGet4kPTEntryValueCR3(CR3,startVirtAddr) & 0xFFFFF000;  //Clear the last 3 bytes of the 
            startPhysAddr |= (startVirtAddr & 0x00000FFF);
            printd(DEBUG_ELF_LOADER,"putDataOnPages: V=0x%08X already mapped to P=0x%08X\n",startVirtAddr,startPhysAddr);
        }
        else
        {
            startPhysAddr=(uintptr_t)allocPages(countToWrite) | (startVirtAddr & 0x00000FFF);
            pagingMapPage(CR3,startVirtAddr,startPhysAddr,0x7);
            printd(DEBUG_ELF_LOADER,"putDataOnPages: V=0x%08X not mapped, mapped to P=0x%08X (CR3=0x%08X)\n",startVirtAddr,startPhysAddr,CR3);
            pagingMapPage(previousCR3,startVirtAddr,startPhysAddr,0x7);
            pagingMapPage(previousCR3,startPhysAddr,startPhysAddr,0x7);
            printd(DEBUG_ELF_LOADER,"putDataOnPages: V=0x%08X also mapped to KP=0x%08X (CR3=0x%08X)\n",startVirtAddr,startPhysAddr,previousCR3);
        }
        //if page is not mapped, map it!
        printd(DEBUG_ELF_LOADER,"putDataOnPages: Reading %u bytes to 0x%08X (0x%08X)\n",countToWrite,startVirtAddr,startPhysAddr);
        //write the data to the page
        if (writeFromFile)
            fl_fread((void*)startPhysAddr, 1, countToWrite, file);
        else
            memset((void*)startPhysAddr,nonFileWriteValue,countToWrite);
        //Decrement the total left to write by the count written
        totalLeftToWrite-=countToWrite;
        printd(DEBUG_ELF_LOADER,"putDataOnPages: Page written, 0x%08X bytes left to go\n",totalLeftToWrite);
        startVirtAddr+=countToWrite;
        startPhysAddr+=countToWrite;
    }
    return true;
}

bool putDataOnPages2(uintptr_t CR3, uintptr_t virtAddr, void* file, bool writeFromFile, int size, byte nonFileWriteValue, _Bool mapOnly)
{
    //New strategy.  
    //  1) If enter function with page aligned virtAddr, see if virtAddr is mapped.  
    //      *If it is, write the whole size there and leave
    //      *If it is not, alloc entire size, write there, map there (page count to map is +1 if size%PAGE_SIZE!=0)
    //  2) If enter function with non-aligned virtAddr, see if virtAddr is already mapped.  
    //      *If it is, write the whole size there and leave
    //      *If it is not, alloc entire size, write there, map there

    int startVirtAddr=virtAddr;
    int startPhysAddr=0;
    int countToWrite=size + PAGE_SIZE;
    bool areaIsMapped=true;

    if (isPageMapped(CR3,startVirtAddr))    //Write overlaps previous one, write the whole thing without mapping and leave
    {
        int tempAddr=startVirtAddr+PAGE_SIZE;
        countToWrite-=size%PAGE_SIZE;  //size of 3328 = 3328-328=3000 - doesn't matter if non-aligned data is on first page or last
        //see if the entire area is mapped.
        while (isPageMapped(CR3,tempAddr) && countToWrite>0)
        {
            countToWrite-=PAGE_SIZE;
            tempAddr+=PAGE_SIZE;
        }
        if (countToWrite==0)
        {
            startPhysAddr=(pagingGet4kPTEntryValueCR3(CR3,startVirtAddr) & 0xFFFFF000) | (startVirtAddr&0x00000FFF);  //Clear the last 3 bytes of the 
            printd(DEBUG_ELF_LOADER,"putDataOnPages2: Entire write area (startVirtAddr=0x%08X) already mapped.  %s 0x%08X bytes to 0x%08X\n",startVirtAddr, writeFromFile?"Writing":"Zeroing", size, startPhysAddr);
            if (writeFromFile)
                fl_fread((void*)startPhysAddr, 1, size, file);
            else
                memset((void*)startPhysAddr,nonFileWriteValue,size);
            return true;
        }
        else
        {
            printd(DEBUG_ELF_LOADER,"putDataOnPages2: Entire area starting at 0x%08X for 0x%08X bytes isn't mapped, falling back to putDataOnPages\n",startVirtAddr,size);
            return putDataOnPages(CR3, virtAddr, file, writeFromFile, size, nonFileWriteValue, mapOnly);   //Everything is not mapped, fallback to page-at-a-time strategy
        }
    }
    else        //alloc, map, write
    {
        startPhysAddr=(uintptr_t)allocPages(size+(PAGE_SIZE-(size%PAGE_SIZE))) | (startVirtAddr & 0x00000FFF);
        printd(DEBUG_ELF_LOADER,"Mapping v=0x%08X to p=0x%08X via cr3=0x%08X\n",startVirtAddr,startPhysAddr,CR3);
        pagingMapPageCount(CR3,startVirtAddr,startPhysAddr,(size/PAGE_SIZE)+1,0x7);
        printd(DEBUG_ELF_LOADER,"Also mapping v=0x%08X to p=0x%08X via cr3=0x%08X\n",startVirtAddr,startPhysAddr,KERNEL_CR3);
        pagingMapPageCount(KERNEL_CR3,startPhysAddr,startPhysAddr,(size/PAGE_SIZE)+1,0x7);
        pagingMapPageCount(KERNEL_CR3,startVirtAddr,startPhysAddr,(size/PAGE_SIZE)+1,0x7);
        printd(DEBUG_ELF_LOADER,"putDataOnPages2: %s 0x%08X bytes to v=0x%08X/p=0x%08X\n",writeFromFile?"Writing":"Zeroing",size, startVirtAddr,startPhysAddr);
        if (writeFromFile)
            fl_fread((void*)startPhysAddr, 1, size, file);
        else
            memset((void*)startPhysAddr,nonFileWriteValue,size);
        return true;
    }
}

bool elfLoadSections(void* file,elfInfo_t* elfInfo,uintptr_t CR3)
{
    uint32_t virtualLoadAddress;
    
    //Go to the beginning of the file and get the elf header
    fl_fseek(file, 0, SEEK_SET);
    fl_fread(&elfInfo->hdr, sizeof(elfInfo->hdr),1,file);
    if (elfInfo->hdr.e_ident[0] != 0x7F) 
        if (elfInfo->hdr.e_ident[1] != 'E') 
            if (elfInfo->hdr.e_ident[1] != 'L') 
                if (elfInfo->hdr.e_ident[2] != 'F')
                {
                    printd(DEBUG_ELF_LOADER,"Invalid ELF magic '%c' '%c' '%c', cannot load", elfInfo->hdr.e_ident[1], elfInfo->hdr.e_ident[2], elfInfo->hdr.e_ident[3]);
                    elfInfo->loadCompleted=false;
                    return false;
                }
    
    //Make sure the file is viable
    if (elfInfo->hdr.e_type!=ET_EXEC && elfInfo->hdr.e_type!=ET_DYN)
    {
        printd(DEBUG_ELF_LOADER,"Wrong ELF type 0x%04X, cannot load\n", elfInfo->hdr.e_type);
        elfInfo->loadCompleted=false;
        return false;
    }
    if (elfInfo->hdr.e_machine!=EM_386)
    {
        printd(DEBUG_ELF_LOADER,"Wrong ELF architecture 0x%04X, cannot load\n", elfInfo->hdr.e_type);
        elfInfo->loadCompleted=false;
        return false;
    }
    
    if (elfInfo->hdr.e_type!=ET_DYN)
        elfInfo->isLibrary=true;
            
    printd(DEBUG_ELF_LOADER,"ELF file type %u, machine type %u\n",elfInfo->hdr.e_type,elfInfo->hdr.e_machine);
    
    //Get the Section Header String Table Index (e_shstrndx)
    elfInfo->sectionNameStringTable=elfInfo->hdr.e_shstrndx;
    printd(DEBUG_ELF_LOADER,"Section Name String Table number = 0x%04X\n",elfInfo->sectionNameStringTable);
    
    //Get the section header table
    printd(DEBUG_ELF_LOADER,"section header record count= %u\n", elfInfo->hdr.e_shnum);
    elfInfo->secHdrRecordCount= elfInfo->hdr.e_shnum;

    printd(DEBUG_ELF_LOADER,"e_shentsize=%u, oursize=%u\n", elfInfo->hdr.e_shentsize, sizeof(Elf32_Shdr) );
    printd(DEBUG_ELF_LOADER,"seeking to 0x%08X ...",elfInfo->hdr.e_shoff);
    fl_fseek(file, elfInfo->hdr.e_shoff,SEEK_SET);
    printd(DEBUG_ELF_LOADER,"reading SHOFF: 0x%08X bytes (s=0x%08X*n=0x%08X), to 0x%08X\n",elfInfo->hdr.e_shentsize*elfInfo->hdr.e_shnum,elfInfo->hdr.e_shentsize,elfInfo->hdr.e_shnum,elfInfo->secHdrTable);
    fl_fread(elfInfo->secHdrTable, elfInfo->hdr.e_shentsize,elfInfo->hdr.e_shnum,file);
    //Get the program header table
    printd(DEBUG_ELF_LOADER,"seeking to 0x%08X ...",elfInfo->hdr.e_phoff);
    printd(DEBUG_ELF_LOADER,"reading PHOFF: 0x%08X bytes (s=0x%08X*n=0x%08X), to 0x%08X\n",elfInfo->hdr.e_phentsize*elfInfo->hdr.e_phnum,elfInfo->hdr.e_phentsize,elfInfo->hdr.e_phnum,elfInfo->pgmHdrTable);
    fl_fseek(file, elfInfo->hdr.e_phoff, SEEK_SET);
    fl_fread(elfInfo->pgmHdrTable, elfInfo->hdr.e_phentsize,elfInfo->hdr.e_phnum,file);
    //Process the program header table and load all of the sections in the file into memory
//    char dumpPCmdLine[100];
//    sprintf(dumpPCmdLine,"x /100bx 0x%08X v",&elfInfo->pgmHdrTable[0]);
//    dumpP(dumpPCmdLine);
    for (int pgmSectionNum=0;pgmSectionNum<elfInfo->hdr.e_phnum;pgmSectionNum++)
    {
        virtualLoadAddress = elfInfo->pgmHdrTable[pgmSectionNum].p_vaddr;
//        if (isLibrary)
//        {
//            //virtualLoadAddress+=libLoadOffset;
//            //elfInfo->pgmHdrTable[cnt].p_vaddr=virtualLoadAddress;
//        }

        if (virtualLoadAddress==(uint32_t)&KERNEL_DATA_LOAD_ADDRESS)
        {
            printd(DEBUG_ELF_LOADER,"Section %u load address is kernel data base address (0x%08X), skipping load\n",pgmSectionNum,virtualLoadAddress);
            continue;
        }
        else if (elfInfo->pgmHdrTable[pgmSectionNum].p_offset==elfInfo->hdr.e_phoff)
        {
            printd(DEBUG_ELF_LOADER,"Section %u file offset is program header address (0x%08X),skipping load\n",pgmSectionNum,elfInfo->pgmHdrTable[pgmSectionNum].p_offset);
            continue;
        }
        if (virtualLoadAddress!=0 && elfInfo->libLoadAddress==0 && (elfInfo->hdr.e_type!=ET_REL && elfInfo->hdr.e_type!=ET_DYN))
        {
            elfInfo->libLoadAddress=(uintptr_t)virtualLoadAddress;
            printd(DEBUG_ELF_LOADER,"Setting main load address to 0x%08X\n",virtualLoadAddress);
            
        }
        if (elfInfo->pgmHdrTable[pgmSectionNum].p_filesz>0)
        {
            printd(DEBUG_ELF_LOADER,"Section %u, load fsize=0x%04X,msize=0x%04X to 0x%08X, seeking to 0x%08X ...\n",
                    pgmSectionNum,
                    elfInfo->pgmHdrTable[pgmSectionNum].p_filesz,
                    elfInfo->pgmHdrTable[pgmSectionNum].p_memsz,
                    virtualLoadAddress,
                    elfInfo->pgmHdrTable[pgmSectionNum].p_offset);
            //Seek to the loadable section in the file
            fl_fseek(file, elfInfo->pgmHdrTable[pgmSectionNum].p_offset, SEEK_SET);
            
            //Get pages 
            if (!putDataOnPages(CR3, virtualLoadAddress, file, true, elfInfo->pgmHdrTable[pgmSectionNum].p_filesz, 0, elfInfo->mapMemoryOnly))
                return false;
            
            printd(DEBUG_ELF_LOADER,"Section %u loaded 0x%08X bytes at 0x%08X\n", pgmSectionNum, elfInfo->pgmHdrTable[pgmSectionNum].p_filesz, virtualLoadAddress);
            
            if (elfInfo->pgmHdrTable[pgmSectionNum].p_filesz<elfInfo->pgmHdrTable[pgmSectionNum].p_memsz)
            {
                printd(DEBUG_ELF_LOADER,"Section %u has uninitialized data (msize>fsize), zeroed 0x%08X bytes at 0x%08X\n", 
                        pgmSectionNum, 
                        elfInfo->pgmHdrTable[pgmSectionNum].p_memsz-elfInfo->pgmHdrTable[pgmSectionNum].p_filesz, 
                        virtualLoadAddress+elfInfo->pgmHdrTable[pgmSectionNum].p_filesz);
                //CLR 02/20/2017 - Replaced memset
                if (!putDataOnPages(CR3,
                        virtualLoadAddress+elfInfo->pgmHdrTable[pgmSectionNum].p_filesz,
                        NULL,
                        false,
                        elfInfo->pgmHdrTable[pgmSectionNum].p_memsz-elfInfo->pgmHdrTable[pgmSectionNum].p_filesz,
                        0, elfInfo->mapMemoryOnly))
                    return false;
            }
        }
        else if (elfInfo->pgmHdrTable[pgmSectionNum].p_memsz>0)
        {
            printd(DEBUG_ELF_LOADER,"Section %u not loadable (fsize=0,msize>0), zeroed 0x%08X bytes at 0x%08X\n",pgmSectionNum, elfInfo->pgmHdrTable[pgmSectionNum].p_memsz, virtualLoadAddress);
            putDataOnPages(CR3, virtualLoadAddress, NULL, false, elfInfo->pgmHdrTable[pgmSectionNum].p_memsz, 0, elfInfo->mapMemoryOnly);
            
        }
#ifndef DEBUG_NONE
        else
            printd(DEBUG_ELF_LOADER,"Section %u @ 0x%08X : file/mem sizes=0x%X/0x%X, not loading\n", 
                    pgmSectionNum, 
                    &elfInfo->pgmHdrTable[pgmSectionNum],
                    elfInfo->pgmHdrTable[pgmSectionNum].p_filesz,
                    elfInfo->pgmHdrTable[pgmSectionNum].p_memsz);
#endif

    }
    //Done processing the program header table
    printd(DEBUG_ELF_LOADER,"LoadElf: done loading elf sections\n");
    return true;
}

elfInfo_t* sysLoadElf(char* fileName, elfInfo_t* pElfInfo, uintptr_t CR3)
{
    GET_OLD_CR3;
            
    if (CR3==0x0)
        CR3=CURRENT_CR3;
    elfInfo_t* elfInfo;
    if (pElfInfo==NULL)
        elfInfo=kMalloc(sizeof(elfInfo_t));
    else
    {
        elfInfo=pElfInfo;
    }
    
    //Initialize the structs we will be using
    memset(elfInfo,0,sizeof(elfInfo_t));
    memset(&elfInfo->dynamicInfo,0,sizeof(elfDynamic_t));

    //NOTE: Any elfInfo_t added to the kLoadedElfInfo list must exist (not be free()d until after it is removed from the list!
    if (kLoadedElfInfo==NULL)
        kLoadedElfInfo=listInit(&elfInfo->loadList,elfInfo);
    else if (elfInfo->loadList.next==0)
        listAdd(kLoadedElfInfo,&elfInfo->loadList,elfInfo);
    
    printd(DEBUG_ELF_LOADER,"Added elfInfo to kLoadedElfInfo list\n");
    

    elfInfo->fileName=kMalloc(strlen(fileName));
    strcpy(elfInfo->fileName,fileName);

    printd(DEBUG_ELF_LOADER,"Opening image file %s\n",elfInfo->fileName);
    void* fPtr=fopen(elfInfo->fileName, "r");
    printd(DEBUG_ELF_LOADER,"fopen returned %u\n",fPtr);
    if (fPtr==0)
    {
        printk("Error opening file '%s' (err=%u), cannot exec\n",elfInfo->fileName,fPtr);
        elfInfo->loadCompleted=false;
        return elfInfo;
    }   

    elfInfo->loadCompleted=true;
    //Load all of the sections in the file to memory
    if (!elfLoadSections(fPtr,elfInfo,CR3))
    {
        elfInfo->loadCompleted=false;
        return elfInfo;
    }

    //First iterate the sections to find the string & symbol tables
    printd(DEBUG_ELF_LOADER,"Scanning section header entries (%u)\n",elfInfo->secHdrRecordCount);
    //First find the string table
    uint32_t tabCount=0;
    for (int cnt=0;cnt<elfInfo->secHdrRecordCount;cnt++)
    {
        if (elfInfo->secHdrTable[cnt].sh_type==SHT_STRTAB)
        {
            fl_fseek(fPtr,elfInfo->secHdrTable[cnt].sh_offset,SEEK_SET);
            elfInfo->dynamicInfo.strTableAddress[cnt]=kMalloc(elfInfo->secHdrTable[cnt].sh_size+0x1000);
            printd(DEBUG_ELF_LOADER,"Mapping string table @ 0x%08X (0x%08X) for 0x%08X bytes into kernel\n",
                    elfInfo->dynamicInfo.strTableAddress[cnt], 
                    (uint32_t)(elfInfo->dynamicInfo.strTableAddress[cnt]) | KERNEL_PAGED_BASE_ADDRESS,
                    elfInfo->secHdrTable[cnt].sh_size/0x1000+0x1000);
            elfInfo->dynamicInfo.strTableName[cnt]=elfInfo->secHdrTable[cnt].sh_name;
            uint32_t lResult=fl_fread((char*)elfInfo->dynamicInfo.strTableAddress[cnt],1,elfInfo->secHdrTable[cnt].sh_size,fPtr);
            printd(DEBUG_ELF_LOADER,"Reading string table to 0x%08X, 0x%08X bytes, result=0x%08X\n",elfInfo->dynamicInfo.strTableAddress[cnt],elfInfo->secHdrTable[cnt].sh_size,lResult);
            elfInfo->dynamicInfo.strTableFilePtr[cnt]=elfInfo->secHdrTable[cnt].sh_offset;
            elfInfo->dynamicInfo.strTableSize[cnt]=elfInfo->secHdrTable[cnt].sh_size;
            tabCount++;
            //break;
        }
    }    
    printd(DEBUG_ELF_LOADER,"Found %u string tables, index of section header table=0x%08X\n",tabCount,elfInfo->sectionNameStringTable);
    for (int cnt=0;cnt<50;cnt++)
    {
        if (elfInfo->dynamicInfo.strTableName[cnt])
        {
                printd(DEBUG_ELF_LOADER,"Found string (STRTAB) table 0x%04X named %s, read to address 0x%08X, size=0x%08X\n",
                cnt,
                strTabEntry(elfInfo->sectionNameStringTable,elfInfo,elfInfo->dynamicInfo.strTableName[cnt]),
                elfInfo->dynamicInfo.strTableAddress[cnt], elfInfo->dynamicInfo.strTableSize[cnt]);
                if (strncmp(strTabEntry(elfInfo->sectionNameStringTable,elfInfo,elfInfo->dynamicInfo.strTableName[cnt]),".dynstr",7)==0)
                {
                    elfInfo->dynamicNameStringTable=cnt;
                    printd(DEBUG_ELF_LOADER,"Dynamic string table entry = 0x%04X\n",cnt);
                }
                else if (strncmp(strTabEntry(elfInfo->sectionNameStringTable,elfInfo,elfInfo->dynamicInfo.strTableName[cnt]),".strtab",7)==0)
                {
                    elfInfo->generalNameStringTable=cnt;
                    printd(DEBUG_ELF_LOADER,"General string table entry = 0x%04X\n",cnt);
                }
        }
    }
    printd(DEBUG_ELF_LOADER,"Scanning section header table, %u records\n",elfInfo->secHdrRecordCount);
    for (int cnt=0;cnt<elfInfo->secHdrRecordCount;cnt++)
    {
        if (elfInfo->secHdrTable[cnt].sh_type==SHT_STRTAB)
        {printd(DEBUG_ELF_LOADER,"Found (STRTAB), already processed string tables, skipping\n");}
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_SYMTAB)
        {
            elfInfo->symTable=kMalloc(elfInfo->secHdrTable[cnt].sh_size+0x1000);
            fl_fseek(fPtr,elfInfo->secHdrTable[cnt].sh_offset,SEEK_SET);
            fl_fread(elfInfo->symTable,elfInfo->secHdrTable[cnt].sh_size,1,fPtr);
            elfInfo->symTableRecordCount=(elfInfo->secHdrTable[cnt].sh_size / sizeof(Elf32_Sym));
            elfInfo->symStrTabLink=elfInfo->secHdrTable[cnt].sh_link;
            printd(DEBUG_ELF_LOADER,"Found symbol table (SYMTAB) using string table 0x%02X, read %u bytes to 0x%08X\n",elfInfo->symStrTabLink,elfInfo->secHdrTable[cnt].sh_size, elfInfo->symTable);
        }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_DYNAMIC)
        {
            elfInfo->dynamicSectionAddress=elfInfo->secHdrTable[cnt].sh_addr;
            elfInfo->dynamicRecordCount=elfInfo->secHdrTable[cnt].sh_size/sizeof(Elf32_Dyn);
            printd(DEBUG_ELF_LOADER,"Found section %s (DYNAMIC) table address 0x%08X.\n",
                    strTabEntry(elfInfo->sectionNameStringTable,elfInfo,elfInfo->secHdrTable[cnt].sh_name),
                    elfInfo->dynamicSectionAddress);
        }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_DYNSYM)
        {
            elfInfo->dynamicSymbolAddress=elfInfo->secHdrTable[cnt].sh_addr;
            elfInfo->dynamicSymbolRecordCount=elfInfo->secHdrTable[cnt].sh_size/sizeof(Elf32_Dyn);
            printd(DEBUG_ELF_LOADER,"Found %s (DYNSYM) section address 0x%08X.\n",strTabEntry(elfInfo->sectionNameStringTable,elfInfo,elfInfo->secHdrTable[cnt].sh_name),elfInfo->secHdrTable[cnt].sh_addr);
        }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_RELA)
        {
            fl_fseek(fPtr,elfInfo->secHdrTable[cnt].sh_offset,SEEK_SET);
            elfInfo->dynamicInfo.relATable=kMalloc(elfInfo->secHdrTable[cnt].sh_size+0x1000);
            elfInfo->dynamicInfo.relATableSize=elfInfo->secHdrTable[cnt].sh_size;
            fl_fread(elfInfo->dynamicInfo.relATable,1,elfInfo->dynamicInfo.relATableSize,fPtr);
            printd(DEBUG_ELF_LOADER,"Found %s (RELA) section, read %u bytes to 0x%08X.\n",
                    strTabEntry(elfInfo->sectionNameStringTable,elfInfo,elfInfo->secHdrTable[cnt].sh_name),
                    elfInfo->dynamicInfo.relATableSize,
                    elfInfo->dynamicInfo.relATable);
        }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_REL)
        {
            fl_fseek(fPtr,elfInfo->secHdrTable[cnt].sh_offset,SEEK_SET);
            elfInfo->dynamicInfo.relTableSize=elfInfo->secHdrTable[cnt].sh_size;
            elfInfo->dynamicInfo.relTable=kMalloc(elfInfo->dynamicInfo.relTableSize+0x1000);
            elfInfo->dynamicInfo.relTable_symTableLink=elfInfo->secHdrTable[cnt].sh_link;
            fl_fread(elfInfo->dynamicInfo.relTable,1,elfInfo->secHdrTable[cnt].sh_size,fPtr);
            printd(DEBUG_ELF_LOADER,"Found %s (REL) section, read %u bytes to 0x%08X.\n",
                    strTabEntry(elfInfo->sectionNameStringTable,elfInfo,elfInfo->secHdrTable[cnt].sh_name),
                    elfInfo->dynamicInfo.relTableSize,
                    elfInfo->dynamicInfo.relTable);
        }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_HASH)
        {
            printd(DEBUG_ELF_LOADER,"Found %s (HASH) section address 0x%08X.\n",strTabEntry(elfInfo->sectionNameStringTable,elfInfo,elfInfo->secHdrTable[cnt].sh_name),elfInfo->secHdrTable[cnt].sh_addr);
        }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_NOTE)
        {
            printd(DEBUG_ELF_LOADER,"Found %s (NOTE) section address 0x%08X.\n",strTabEntry(elfInfo->sectionNameStringTable,elfInfo,elfInfo->secHdrTable[cnt].sh_name),elfInfo->secHdrTable[cnt].sh_addr);
        }
        else
        {
            printd(DEBUG_ELF_LOADER,"Found (%s) section (type=0x%08X)address 0x%08X.\n",strTabEntry(elfInfo->sectionNameStringTable,elfInfo,elfInfo->secHdrTable[cnt].sh_name),elfInfo->secHdrTable[cnt].sh_type,elfInfo->secHdrTable[cnt].sh_addr);
        }

    }
    printd(DEBUG_ELF_LOADER,"Done processing the section header table\n");
    printd(DEBUG_ELF_LOADER  | DEBUG_DETAILED,"Iterating the symbol table, %u records\n",elfInfo->symTableRecordCount);
    printd(DEBUG_ELF_LOADER | DEBUG_DETAILED,"Using string table 0x%04X\n",elfInfo->symStrTabLink);
    for (int cnt=0;cnt<elfInfo->symTableRecordCount;cnt++)
    {
        Elf32_Sym* sym=&elfInfo->symTable[cnt];
        printd(DEBUG_ELF_LOADER | DEBUG_DETAILED, "Name: %s, Value: %08X, Size: %04X, B/T: %02X/%02X, SecIdx: %04X\n",
                strTabEntry(elfInfo->symStrTabLink, elfInfo, sym->st_name), sym->st_value, sym->st_size,
                ELF32_ST_BIND(sym->st_info), 
                ELF32_ST_TYPE(sym->st_info), 
                sym->st_other, sym->st_shndx);
    }
    uint32_t err=processELFDynamicSection(elfInfo,CR3);
     if (err)
     {
         printd(DEBUG_ELF_LOADER,"Failed to process ELF dynamic section, error=0x%08X\n",err);
        fl_fclose(fPtr);
        elfInfo->loadCompleted=false;
        return elfInfo;
     }
    elfDumpSymbols(elfInfo);
    elf_relocate(elfInfo);
     fl_fclose(fPtr);
        elfInfo->loadCompleted=true;
        return elfInfo;
}



static inline Elf32_Shdr *elf_sheader(Elf32_Ehdr *hdr) {
	return (Elf32_Shdr *)((int)hdr + hdr->e_shoff);
}
 
static inline Elf32_Shdr *elf_section(Elf32_Ehdr *hdr, int idx) {
	return &elf_sheader(hdr)[idx];
}

static inline char *elf_str_table(Elf32_Ehdr *hdr) {
	if(hdr->e_shstrndx == SHN_UNDEF) return NULL;
	return (char *)hdr + elf_section(hdr, hdr->e_shstrndx)->sh_offset;
}
 
static inline char *elf_lookup_string(Elf32_Ehdr *hdr, int offset) {
	char *strtab = elf_str_table(hdr);
	if(strtab == NULL) return NULL;
	return strtab + offset;
}


static inline char *elf_lookup_symbol(Elf32_Ehdr *elf, const char* name)
{
}

# define ELF_RELOC_ERR -1

static int elf_get_symval(elfInfo_t *elfInfo, uint32_t idx) {
//	if(table == SHN_UNDEF || idx == SHN_UNDEF) return 0;
	Elf32_Shdr *symtab = elfInfo->symTable;
 
	uint32_t symtab_entries = elfInfo->symTableRecordCount;
//	if(idx >= symtab_entries) {
//		printd(DEBUG_ELF_LOADER,"Symbol Index out of Range (%d:%u).\n", table, idx);
//		return ELF_RELOC_ERR;
//	}
 
	Elf32_Sym *symbol = &elfInfo->symTable[idx];
        if(symbol->st_shndx == SHN_UNDEF) 
        {
            // External symbol, lookup value
            const char *name = strTabEntry(elfInfo->symStrTabLink,elfInfo,elfInfo->symTable[idx].st_name);

            void *target = elfInfo->symTable[idx].st_value;

            if(target == NULL) 
            {
                // Extern symbol not found
                if(ELF32_ST_BIND(symbol->st_info) & STB_WEAK) {
                        // Weak symbol initialized as 0
                        return 0;
                } else {
                        printd(DEBUG_ELF_LOADER,"Undefined External Symbol : %s.\n", name);
                        return ELF_RELOC_ERR;
                }
            } 
            else 
            {
                    return (int)target;
            }
        }
        else if(symbol->st_shndx == SHN_ABS) {
            // Absolute symbol
            return symbol->st_value;
	} 
        else 
        {
		// Internally defined symbol
		Elf32_Shdr *target = &elfInfo->secHdrTable[symbol->st_shndx];
		return symbol->st_value + target->sh_offset; //?
	}
}

# define DO_386_32(S, A)	((S) + (A))
# define DO_386_PC32(S, A, P)	((S) + (A) - (P))
 
uint32_t elfLookUpSymVal(elfInfo_t* elf, char* symName)
{
    Elf32_Sym* symToFind;
    for (int libNum=0;libNum<elf->libraryElfCount;libNum++)
    {
        elfInfo_t* lib=elf->libraryElfPtr[libNum];
        for (int symNum=0;symNum<lib->symTableRecordCount;symNum++)
        {
            symToFind=&lib->symTable[symNum];
            char symNameToLinkTo[255];
            strcpy(symNameToLinkTo,strTabEntry(lib->symStrTabLink, lib, symToFind->st_name));
            if (strncmp(symNameToLinkTo, symName,255)==0)
            {
                printd(DEBUG_ELF_LOADER,"elfLookupSymVal: Found symbol '%s', value=0x%08X\n",symNameToLinkTo,symToFind->st_value);
                return symToFind->st_value;
            }
        }
        panic("elfLookupSymVal: Could not find symbol '%s'",symName);
    }
}

void elfDumpSymbols(elfInfo_t* elf)
{
    Elf32_Sym* symToFind;
    
    printd(DEBUG_ELF_LOADER,"Dumping ELF Symbol Table\n");
    for (int symNum=0;symNum<elf->symTableRecordCount;symNum++)
    {
        symToFind=&elf->symTable[symNum];
        printd(DEBUG_ELF_LOADER,"\t%u: %s @ 0x%08X (size=0x%08X)\n",symNum,strTabEntry(elf->symStrTabLink, elf, symToFind->st_name),symToFind->st_value, symToFind->st_size);
    }
    printd(DEBUG_ELF_LOADER,"Done dumping ELF Symbol Table\n");
}

static int elf_relocate(elfInfo_t* elf) {
    Elf32_Rel* relEntry;
    uint32_t symValPtr;

    LOAD_ZERO_BASED_DS
    printd(DEBUG_ELF_LOADER,"Processing relocation (REL) table at 0x%08X, record count=0x%08X\n",elf->dynamicInfo.relTable, elf->dynamicInfo.relTableSize/sizeof(Elf32_Rel));
    printd(DEBUG_ELF_LOADER, "NOTE: Only processing REL tables, TODO: process RELA tables\n");
    if (elf->dynamicInfo.relTableSize>0)
    {
        for (int cnt=0;cnt<(elf->dynamicInfo.relTableSize / sizeof(Elf32_Rel))+1;cnt++)
        {
            relEntry=&elf->dynamicInfo.relTable[cnt];
                printd(DEBUG_ELF_LOADER,"Found relocation entry type 0x%02X with offset 0x%08X, dynamic symbol table entry 0x%02X\n",
                        ELF32_R_TYPE(relEntry->r_info), 
                        relEntry->r_offset,
                        ELF32_R_SYM(relEntry->r_info));
            if (ELF32_R_SYM(relEntry->r_info) != SHN_UNDEF)
            {
                //NOTE: I don't know why I had to subtract 1 from the entry number
                printd(DEBUG_ELF_LOADER," Getting symbol entry number from 0x%08X\n",&elf->symTable[ELF32_R_SYM(relEntry->r_info)].st_value);
                uint32_t symEntryNum=elf->symTable[ELF32_R_SYM(relEntry->r_info)].st_value;
                Elf32_Sym* sym = (Elf32_Sym*)(elf->dynamicSymbolAddress+((ELF32_R_SYM(relEntry->r_info))*sizeof(Elf32_Sym)));
/*                printd(DEBUG_ELF_LOADER,"sizeof Elf32_Sym=0x%08X, symTable=0x%08X, symEntryNum=0x%04X, symPtr=0x%08X, base+symPtr=0x%08X\n",
                        sizeof(Elf32_Sym), 
                        elf->dynamicSymbolAddress,
                        symEntryNum,
                        (symEntryNum*sizeof(Elf32_Sym)),
                        elf->dynamicSymbolAddress+(symEntryNum*sizeof(Elf32_Sym)));
*/                symValPtr=sym->st_value;
                printd(DEBUG_ELF_LOADER," Symbol Name '%s', Symbol value=0x%08X (addr=0x%08X)\n",
                        strTabEntry(elf->dynamicNameStringTable,elf,sym->st_name), 
                        symValPtr,
                        sym);
                if (symValPtr==0)
                    symValPtr=elfLookUpSymVal(elf,strTabEntry(elf->dynamicNameStringTable,elf,sym->st_name));
                uint32_t* rel=relEntry->r_offset;
                printd(DEBUG_ELF_LOADER," Writing 0x%08X to memory address 0x%08X.\n\tValue before/after=0x%08X/ ",symValPtr,rel,*rel);
                switch(ELF32_R_TYPE(relEntry->r_info)) {
		case R_386_NONE:
                    // No relocation
                    break;
		case R_386_32:
                case R_386_GLOB_DAT:        //CLR 03/24/2017: Added glob dat
                    // Symbol + Offset
                    *rel = DO_386_32(symValPtr, *rel);
                    printd(DEBUG_ELF_LOADER,"0x%08X (using R_386_32)\n",*rel);
                    break;
                case R_386_JMP_SLOT:
                    *rel = symValPtr;
                    printd(DEBUG_ELF_LOADER,"0x%08X (using R_386_JMP_SLOT)\n",*rel);
                    break;
		case R_386_PC32:
                    // Symbol + Offset - Section Offset
                    *rel = DO_386_PC32(symValPtr, *rel, (int)rel);
                    printd(DEBUG_ELF_LOADER,"0x%08X (using R_386_PC32)\n",*rel);
                    break;
		default:
			// Relocation type not supported, display error and return
			panic("Unsupported Relocation Type (%d).\n", ELF32_R_TYPE(relEntry->r_info));
			return ELF_RELOC_ERR;
                }
            }
        }
    }
    LOAD_KERNEL_BASED_DS;
    return 0;
}

extern void markTaskEnded(uint32_t taskNum, uint32_t retval);

