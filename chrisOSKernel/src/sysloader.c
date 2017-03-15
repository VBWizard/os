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
#include "malloc.h"
#include "../../chrisOS/include/printf.h"

extern struct ataDeviceInfo_t* kATADeviceInfo;
extern tss_t* kTSSTable;
uint32_t cr3BeforeExec;
extern int kAHCISelectedDiskNum; 
extern int kAHCISelectedPartNum;
extern int ahciBlockingRead28(uint32_t sector, uint8_t *buffer, uint32_t sector_count);
extern int ahciBlockingWrite28(/*unsigned drive, */uint32_t sector, uint8_t *buffer, uint32_t sector_count);
extern int kExecLoadCount;
extern elfInfo_t* kExecLoadInfo;
extern uint32_t getCS();
extern uint32_t getDS();
extern uint32_t getES();
extern uint32_t getFS();
extern uint32_t getGS();
extern uint32_t getSS();
extern uint32_t getESP();
extern sGDT* bootGdt;

uint32_t libLoadOffset=LIBRARY_BASE_LOAD_ADDRESS;
uintptr_t oldCR3=0,newCR3;

#define GET_OLD_CR3 __asm__("mov ebx,cr3\n":[oldCR3] "=b" (oldCR3));
#define SWITCH_CR3 __asm__("mov cr3,eax\n"::[newCR3] "a" (newCR3));
#define CURRENT_CR3 ({uint32_t cr3Val; \
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})
#define LOAD_ZERO_BASED_DS     __asm__("mov eax,0x90\nmov ds,eax":::"eax");
#define LOAD_KERNEL_BASED_DS __asm__("mov eax,0x10\nmov ds,eax":::"eax");

void _sysCall(uint32_t CallNum, uint32_t param1, uint32_t param2, uint32_t param3);
static int elf_relocate(elfInfo_t* elf);

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
    __asm__("mov cr3,eax\n"::[oldCR3] "a" (INIT_GDT_TABLE_ADDRESS));
}

uint32_t processELFDynamicSection(elfInfo_t* elfInfo)
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
                printd(DEBUG_ELF_LOADER,"Needed name = %s\n",strTabEntry(0x6,elfInfo,dyn[cnt].d_un.d_val));
                strcpy(elfInfo->dynamicInfo.neededName[elfInfo->dynamicInfo.neededCount],
                        //strTabEntryBySTName(".strtab",elfInfo,dyn[cnt].d_un.d_val));
                        strTabEntry(0x6,elfInfo,dyn[cnt].d_un.d_val));
                char fileName[100]="/";
                strcat(fileName,elfInfo->dynamicInfo.neededName[elfInfo->dynamicInfo.neededCount]);
                printd(DEBUG_ELF_LOADER,"Found NEEDED, library name='%s', orig name='%s'\n",fileName,elfInfo->dynamicInfo.strTableAddress+dyn[cnt].d_un.d_ptr);
                if (kDebugLevel&DEBUG_ELF_LOADER)
                {
                    printd(DEBUG_ELF_LOADER,"loadElf: Calling loadElf again to load '%s'\n",&fileName);
                }
                elfInfo->dynamicInfo.neededExecLoadNum[elfInfo->dynamicInfo.neededPtr++]=kExecLoadCount;
                elfInfo_t* elfLibPtr=&kExecLoadInfo[kExecLoadCount++];
                sysLoadElf(fileName,elfLibPtr,0x0,true);
                if (!elfLibPtr->loadCompleted)
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
bool putDataOnPages(uintptr_t CR3, uintptr_t virtAddr, void* file, bool writeFromFile, int size, byte nonFileWriteValue)
{
    int startVirtAddr=virtAddr;
    int startPhysAddr=0;
    int countToWrite=0;
    int totalLeftToWrite=size;
    while(totalLeftToWrite>0)
    {
        printd(DEBUG_ELF_LOADER,"putDataOnPages: Bytes left to go: 0x%08X\n",totalLeftToWrite);
        //If either the write doesn't start at the beginning of the page, or there is less than a page left to write
        if ((!startVirtAddr%PAGE_SIZE) | (totalLeftToWrite < PAGE_SIZE))
        {
                countToWrite=totalLeftToWrite%PAGE_SIZE;
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
            startPhysAddr=(uintptr_t)allocPages(size) | (startVirtAddr & 0x00000FFF);
            pagingMapPage(CR3,startVirtAddr,startPhysAddr,0x7);
            printd(DEBUG_ELF_LOADER,"putDataOnPages: V=0x%08X not mapped, mapped to P=0x%08X (CR3=0x%08X)\n",startVirtAddr,startPhysAddr,CR3);
            pagingMapPage(oldCR3,startVirtAddr,startPhysAddr,0x7);
            pagingMapPage(oldCR3,startPhysAddr,startPhysAddr,0x7);
            printd(DEBUG_ELF_LOADER,"putDataOnPages: V=0x%08X also mapped to KP=0x%08X (CR3=0x%08X)\n",startVirtAddr,startPhysAddr,oldCR3);
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

bool elfLoadSections(void* file,elfInfo_t* elfInfo,uintptr_t CR3,bool isLibrary)
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
        if (isLibrary)
        {
            //virtualLoadAddress+=libLoadOffset;
            //elfInfo->pgmHdrTable[cnt].p_vaddr=virtualLoadAddress;
        }

        if (virtualLoadAddress==(uint32_t)KERNEL_DATA_LOAD_ADDRESS)
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
            printd(DEBUG_ELF_LOADER,"Found loadable section (fsize > 0), seeking to 0x%08X ...\n",elfInfo->pgmHdrTable[pgmSectionNum].p_offset);
            //Seek to the loadable section in the file
            fl_fseek(file, elfInfo->pgmHdrTable[pgmSectionNum].p_offset, SEEK_SET);
            
            //Get pages 
            printd(DEBUG_ELF_LOADER,"Allocating pages to store %u bytes of data on\n",elfInfo->pgmHdrTable[pgmSectionNum].p_memsz);
            if (!putDataOnPages(CR3,virtualLoadAddress,file,true,elfInfo->pgmHdrTable[pgmSectionNum].p_memsz,0))
                return false;
            printd(DEBUG_ELF_LOADER,"Section %u loaded 0x%08X bytes at 0x%08X\n", pgmSectionNum, elfInfo->pgmHdrTable[pgmSectionNum].p_memsz, virtualLoadAddress);
            if (elfInfo->pgmHdrTable[pgmSectionNum].p_filesz<elfInfo->pgmHdrTable[pgmSectionNum].p_memsz)
            {
                printd(DEBUG_ELF_LOADER,"Section %u has uninitialized data (msize>fsize), zeroed 0x%08X bytes at 0x%08X\n", pgmSectionNum, elfInfo->pgmHdrTable[pgmSectionNum].p_memsz-elfInfo->pgmHdrTable[pgmSectionNum].p_filesz, virtualLoadAddress);
                //CLR 02/20/2017 - Replaced memset
                if (!putDataOnPages(CR3,virtualLoadAddress,NULL,false,elfInfo->pgmHdrTable[pgmSectionNum].p_memsz-elfInfo->pgmHdrTable[pgmSectionNum].p_filesz,0))
                    return false;
            }
        }
        else if (elfInfo->pgmHdrTable[pgmSectionNum].p_memsz>0)
        {
            printd(DEBUG_ELF_LOADER,"Section %u not loadable (fsize=0,msize>0), zeroed 0x%08X bytes at 0x%08X\n",pgmSectionNum, elfInfo->pgmHdrTable[pgmSectionNum].p_memsz, virtualLoadAddress);
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

uint32_t sysLoadElf(char* fileName, elfInfo_t* pElfInfo, uintptr_t CR3, bool isLibrary)
{

    printd(DEBUG_ELF_LOADER,"Opening image file %s\n",fileName);
    void* fPtr=fopen(fileName, "r");
    printd(DEBUG_ELF_LOADER,"fopen returned %u\n",fPtr);
    if (fPtr==0)
    {
        printk("Error opening file '%s' (err=%u), cannot exec\n",fileName,fPtr);
        return -3;
    }   
 
    GET_OLD_CR3;
            
    if (CR3==0x0)
        CR3=CURRENT_CR3;
    elfInfo_t* elfInfo;
    if (pElfInfo==NULL)
        //Get a slot in the load info
        elfInfo=&kExecLoadInfo[kExecLoadCount++];
    else
        elfInfo=pElfInfo;
    
    //Initialize the structs we will be using
    memset(elfInfo,0,sizeof(elfInfo_t));
    memset(&elfInfo->dynamicInfo,0,sizeof(elfDynamic_t));

    elfInfo->loadCompleted=true;
    //Load all of the sections in the file to memory
    if (!elfLoadSections(fPtr,elfInfo,CR3,isLibrary))
        return -4;

    //First iterate the sections to find the string & symbol tables
    printd(DEBUG_ELF_LOADER,"Scanning section header entries (%u)\n",elfInfo->secHdrRecordCount);
    //First find the string table
    uint32_t tabCount=0;
    for (int cnt=0;cnt<elfInfo->secHdrRecordCount;cnt++)
    {
        if (elfInfo->secHdrTable[cnt].sh_type==SHT_STRTAB)
        {
            if (cnt==elfInfo->sectionNameStringTable)
                elfInfo->sectionNameStringTable=cnt;
            fl_fseek(fPtr,elfInfo->secHdrTable[cnt].sh_offset,SEEK_SET);
            elfInfo->dynamicInfo.strTableAddress[cnt]=allocPages(elfInfo->secHdrTable[cnt].sh_size);
            printd(DEBUG_ELF_LOADER,"Mapping string table @ 0x%08X (0x%08X) for 0x%08X bytes into kernel\n",
                    elfInfo->dynamicInfo.strTableAddress[cnt], 
                    (uint32_t)(elfInfo->dynamicInfo.strTableAddress[cnt]) | KERNEL_PAGED_BASE_ADDRESS,
                    elfInfo->secHdrTable[cnt].sh_size/0x1000+1);
            pagingMapPageCount(KERNEL_CR3,
                    (uint32_t)(elfInfo->dynamicInfo.strTableAddress[cnt]) | KERNEL_PAGED_BASE_ADDRESS,
                    elfInfo->dynamicInfo.strTableAddress[cnt],
                    elfInfo->secHdrTable[cnt].sh_size/0x1000+1,0x7);
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
        }
    }
    printd(DEBUG_ELF_LOADER,"Scanning section header table, %u records\n",elfInfo->secHdrRecordCount);
    for (int cnt=0;cnt<elfInfo->secHdrRecordCount;cnt++)
    {
        if (elfInfo->secHdrTable[cnt].sh_type==SHT_STRTAB)
        {}
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_SYMTAB)
        {
            elfInfo->symTable=malloc(elfInfo->secHdrTable[cnt].sh_size);
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
            elfInfo->dynamicInfo.relATable=malloc(elfInfo->secHdrTable[cnt].sh_size);
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
            elfInfo->dynamicInfo.relTable=malloc(elfInfo->dynamicInfo.relTableSize);
            elfInfo->dynamicInfo.relTable_shlink=elfInfo->secHdrTable[cnt].sh_link;
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
    printd(DEBUG_ELF_LOADER | DEBUG_DETAILED,"Iterating the symbol table, %u records\n",elfInfo->symTableRecordCount);
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
    uint32_t err=processELFDynamicSection(elfInfo);
     if (err)
     {
         printd(DEBUG_ELF_LOADER,"Failed ot process ELF dynamic section, error=0x%08X\n",err);
        fl_fclose(fPtr);
         return -3;
     }
     elf_relocate(elfInfo);
     fl_fclose(fPtr);
     return 0;
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
 
static int elf_do_reloc(Elf32_Rel* relEntry)
{
    
}

static int elf_relocate(elfInfo_t* elf) {
    Elf32_Rel* relEntry;
    uint32_t symVal;

    LOAD_ZERO_BASED_DS
    printd(DEBUG_ELF_LOADER,"Processing relocation (REL) table at 0x%08X, record count=0x%08X\n",elf->dynamicInfo.relTable, elf->dynamicInfo.relTableSize/sizeof(Elf32_Rel));
    printd(DEBUG_ELF_LOADER, "NOTE: Only processing REL tables, TODO: process RELA tables\n");
    if (elf->dynamicInfo.relTableSize>0)
    {
        for (int cnt=0;cnt<elf->dynamicInfo.relTableSize / sizeof(Elf32_Rel);cnt++)
        {
            relEntry=&elf->dynamicInfo.relTable[cnt];
            if (ELF32_R_SYM(relEntry->r_info) != SHN_UNDEF && relEntry->r_offset !=0)
            {
                uint32_t dynEntryNum=elf->symTable[ELF32_R_SYM(relEntry->r_info)].st_value;
                printd(DEBUG_ELF_LOADER,"Found relocation entry type 0x%08X with offset 0x%08X, dynamic symbol table entry 0x%04X\n",
                        relEntry->r_info, 
                        relEntry->r_offset,
                        ELF32_R_SYM(relEntry->r_info));
                //NOTE: I don't know why I had to subtract 1 from the entry number
                Elf32_Dyn* dyn = (Elf32_Dyn*)(elf->dynamicSymbolAddress+((ELF32_R_SYM(relEntry->r_info)-1)*sizeof(Elf32_Dyn)));
                printd(DEBUG_ELF_LOADER,"sizeof Elf32_Dyn=0x%08X, dynEntryNum=0x%04X, dynPtr=0x%08X, dynPtr+base=0x%08X\n",sizeof(Elf32_Dyn), 
                        (ELF32_R_SYM(relEntry->r_info)-1),
                        ((ELF32_R_SYM(relEntry->r_info)-1)*sizeof(Elf32_Dyn)),
                        elf->dynamicSymbolAddress+(ELF32_R_SYM(relEntry->r_info)*sizeof(Elf32_Dyn)));
                printd(DEBUG_ELF_LOADER,"\tUsing dynamic symbol at 0x%08X (0x%08X)\n",elf->dynamicSymbolAddress,dyn);
                symVal=dyn->d_un.d_ptr;
                printd(DEBUG_ELF_LOADER,"\tSymbol value=0x%08X (addr=0x%08X)\n",symVal,dyn);
                uint32_t* rel=relEntry->r_offset;
                printd(DEBUG_ELF_LOADER,"\tWriting 0x%08X to memory address 0x%08X.  Value before/after=0x%08X/ ",symVal,rel,*rel);
                *rel=symVal;
                printd(DEBUG_ELF_LOADER,"0x%08X\n",*rel);
            }
        }
    }
    LOAD_KERNEL_BASED_DS;
    return 0;
}
int sysExec(process_t* process,int argc,char** argv)
{
    int lsysExecRetVal=0;
     register int *eax __asm__("eax");

     GET_OLD_CR3;
    newCR3=process->task->tss->CR3;
    printd(DEBUG_LOADER,"sysExec: Entered ... executing '%s'\n",process->path);
    //If loaded successfully then execute
    if (process->elf->loadCompleted)
    {
        printd(DEBUG_ELF_LOADER,"exec: Executing %s at 0x%08X, CR3=0x%08X, return address is =0x%08X\n", process->path, process->elf->hdr.e_entry, newCR3 ,__builtin_return_address(0));
        //Create tss GDT entry for the process
        uint32_t tssFlags=ACS_TSS;
        uint32_t gdtFlags=GDT_PRESENT | GDT_CODE;
        if (process->task->kernel)
        {
            gdtFlags |= GDT_DPL0;
            tssFlags |= ACS_DPL_0;
        }
        else
        {
            gdtFlags |= GDT_DPL3;
            tssFlags |= ACS_DPL_3;
        }
        
        printk("Process CS=0x%08X, taskNum=0x%08X\n",process->task->tss->CS,process->task->taskNum);
        //This is the gdt TSS entry for the process
        gdtEntryOS(process->task->taskNum,(uint32_t)process->task->tss,sizeof(tss_t), tssFlags ,GDT_GRANULAR | GDT_32BIT,true);
        __asm__("mov  ds,bx\n":: "b" (process->task->tss->DS));
        __asm__("mov  es,bx\n":: "b" (process->task->tss->ES));
        __asm__("mov  fs,bx\n":: "b" (process->task->tss->FS));
        __asm__("mov  gs,bx\n":: "b" (process->task->tss->GS));
        __asm__("push %[ssTSS]\n"
        "push %[stackPtr]\n"                                //Target esp
        "push %[eFlags]\n"                                  //Target EFLAGS
        "mov eax,%[taskTSS]\n"                                    //Load task register with user process TSS entry
        "ltr ax\n"
        "mov eax,%[procCSTSS]\n"                            //GDT of DPL 0/3 code segment, not specific to the process
        "push eax\n"                                        //Target CS
        "lea eax,jmpHere\npush eax\n"                       //Target EIP is right after the iRet
        ::[stackPtr] "b" (process->task->tss->ESP),
                [eFlags] "d" (process->task->tss->EFLAGS),
                [procCSTSS] "r" (process->task->tss->CS),
                [ssTSS] "r" (process->task->tss->SS),
                        [taskTSS] "r" (process->task->taskNum<<3));
       SWITCH_CR3;                                          //Switch to the process CR3 before the jump
        __asm__("iretd\njmpHere:nop\n");                    //Jump to (possibly) ring 3
         printk("MADE IT!!!\n");                             //We've made it!
        //Now jump to the user task
        printd(DEBUG_ELF_LOADER,"sysExec: Jumping to 0x%04X:0x%08X\n", process->task->tss->CS,process->task->tss->EIP);
        __asm__("push cs\npush %[entryPoint]\nretf\n"::[entryPoint] "r" (process->task->tss->EIP));
        JMPHR: goto JMPHR;
        panic("SysExec: Should never get here!!!");
        lsysExecRetVal=(uint32_t)eax;
        printd(DEBUG_ELF_LOADER,"exec: Back from executing %s, return value is 0x%08X, 0x%08X, __bra=0x%08X\n", process->path, lsysExecRetVal, &process->path, __builtin_return_address(0));
    }
    else
    {
        panic("SysExec: Should never get here!!!");
    }
    return lsysExecRetVal;
}

extern void markTaskEnded(uint32_t taskNum);

void _sysCall(uint32_t callNum, uint32_t param1, uint32_t param2, uint32_t param3)
{
    uint32_t processID, processCR3;
    
    __asm__("str ecx\nmov %[cr3],cr3":[processID] "=c" (processID),[cr3] "=a" (processCR3));
    printd(DEBUG_PROCESS,"In _sysCall, callNum=0x%08X\n",callNum);

    switch (callNum)
    {
        case 0x0:
            printd(DEBUG_PROCESS,"_syscall: Called with CallNum=0x%08X, invalid call number.\n",callNum);
            break;
        case 0x1:       //exit
             //Get back home
             __asm__("mov eax,0x10;mov ds,eax;mov es,eax;mov fs,eax;mov gs,eax\n");
             __asm__("mov cr3,%[cr3]\n"::[cr3] "a" (KERNEL_CR3));
             printd(DEBUG_PROCESS,"syscall: Ending process with CR3=0x%08X\n",processCR3);
             markTaskEnded(processCR3);
             printd(DEBUG_PROCESS,"syscall: The process is dead, long live the process!\n",processID);
             //****DESTROY STUFF HERE****
             //When a task is ended, the scheduler is will deal with it on the next tick, so lets wait for that to happen
             __asm__("sysCallIdleLoop: sti;hlt;jmp sysCallIdleLoop");
             panic("_syscall: exit call, continued after halt!");
             __asm__("mov eax,0xbad;mov ebx,0xbad;mov ecx,0xbad; mov edx,0xbad\nhlt\n");               //We should never get here
            break;
        default:
            panic("_syscall: Invalid call number 0x%04X\n",callNum);
    }
    __asm__("mov esp,ebp;add esp,4;ret"); /* BLACK MAGIC! */
}