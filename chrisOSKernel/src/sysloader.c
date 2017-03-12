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

void _sysCall(uint32_t CallNum, uint32_t param1, uint32_t param2, uint32_t param3);


char* strTabEntry(elfInfo_t* elf, int index)
{
    char* addr=NULL;
    if (elf->dynamicInfo.strTableAddress && index < elf->dynamicInfo.strTableSize)
    {
        addr=(char*)elf->dynamicInfo.strTableAddress;
        addr+=index;
    }
    return (char*)addr;
}

void restoreCR3()
{
    __asm__("mov cr3,eax\n"::[oldCR3] "a" (INIT_GDT_TABLE_ADDRESS));
}

void processELFDynamicSection(elfInfo_t* elfInfo)
{
    Elf32_Dyn* dyn=(Elf32_Dyn*)elfInfo->dynamicSectionAddress;

    //Next process the rest of the dynamic section entries
    elfInfo->dynamicInfo.neededCount=0;
    for (int cnt=0;cnt<elfInfo->dynamicRecordCount;cnt++)
    {
        switch (dyn[cnt].d_tag)
        {
            //DT_NEEDED is a library which we need to load
            case DT_NEEDED:
                printk("ELF at: 0x%08X, copy to: 0x%08X, neededCount=0x%08X\n",elfInfo, elfInfo->dynamicInfo.neededName[elfInfo->dynamicInfo.neededCount],elfInfo->dynamicInfo.neededCount);
                strcpy(elfInfo->dynamicInfo.neededName[elfInfo->dynamicInfo.neededCount++],(char*)(elfInfo->dynamicInfo.strTableAddress+dyn[cnt].d_un.d_ptr));
                char fileName[100]="/";
                strcat(fileName,elfInfo->dynamicInfo.neededName[elfInfo->dynamicInfo.neededCount-1]);
                printd(DEBUG_ELF_LOADER,"Found NEEDED, library name='%s', orig name='%s'\n",fileName,elfInfo->dynamicInfo.strTableAddress+dyn[cnt].d_un.d_ptr);
                if (kDebugLevel&DEBUG_ELF_LOADER)
                {
                    printd(DEBUG_ELF_LOADER,"loadElf: Calling loadElf again to load '%s' ... press a key to continue\n",&fileName);
                    waitForKeyboardKey();
                }
                void* fPtr=fopen(fileName, "r");
                if (fPtr==0)
                {
                    printk("Error opening file '%s', cannot exec\n",fileName);
                    elfInfo->loadCompleted=false;
                    return;
                }   
                elfInfo->dynamicInfo.neededExecLoadNum[elfInfo->dynamicInfo.neededPtr++]=kExecLoadCount;
                elfInfo_t* elfLibPtr=&kExecLoadInfo[kExecLoadCount++];
                sysLoadElf(fPtr,elfLibPtr,0x0,true);
                fclose(fPtr);
                if (!elfLibPtr->loadCompleted)
                {
                    printd(DEBUG_ELF_LOADER,"EXEC: processELFDynamicSection ... loading library failed.");
                    elfInfo->loadCompleted=false;
                    return;
                }
                break;
            case DT_PLTRELSZ:
                elfInfo->dynamicInfo.pltGOTTableTableSize=dyn[cnt].d_un.d_val;
                break;
            case DT_PLTGOT:
                elfInfo->dynamicInfo.pltGOTTableAddress=dyn[cnt].d_un.d_ptr;
                break;
            case DT_HASH:
                elfInfo->dynamicInfo.hashTableAddress=dyn[cnt].d_un.d_ptr;
                break;
            case DT_STRTAB:
                //Already found it above
                break;
            case DT_SYMTAB:
                //Already found it above
                break;
            case DT_RELA:
                elfInfo->dynamicInfo.relATableAddress=dyn[cnt].d_un.d_ptr;
                break;
            case DT_RELASZ:
                elfInfo->dynamicInfo.relATableSize=dyn[cnt].d_un.d_val;
                break;
            case DT_RELAENT:
                elfInfo->dynamicInfo.relAEntrySize=dyn[cnt].d_un.d_val;
                break;
            case DT_STRSZ:
                elfInfo->dynamicInfo.strTableSize=dyn[cnt].d_un.d_val;
                break;
            case DT_SYMENT:
                elfInfo->dynamicInfo.symEntrySize=dyn[cnt].d_un.d_val;
                break;
            case DT_INIT:
                elfInfo->dynamicInfo.initFunctionAddress=dyn[cnt].d_un.d_ptr;
                elfInfo->dynamicInfo.initFunctionAddress+=libLoadOffset;
                break;
            case DT_FINI:
                elfInfo->dynamicInfo.termFunctionAddress=dyn[cnt].d_un.d_ptr;
                elfInfo->dynamicInfo.termFunctionAddress+=libLoadOffset;
                break;
            case DT_SONAME:
                //
                break;
            case DT_REL:
                //Can't find the relocation section this way, using section headers
                //elfInfo->dynamicInfo.relTableAddress=dyn[cnt].d_un.d_ptr;
                //printk("%s: Found DT_REL, address=0x%08X (0x%08X)\n",isLibrary?"library":"executable",dyn[cnt].d_un.d_ptr,elfInfo->dynamicInfo.relTableAddress);
                break;
            case DT_RELSZ:
                elfInfo->dynamicInfo.relTableSize=dyn[cnt].d_un.d_val;
                break;
            case DT_RELENT:
                elfInfo->dynamicInfo.relEntrySize=dyn[cnt].d_un.d_val;
                break;
            case DT_PLTREL:
                //
                break;
            case DT_TEXTREL:
                //
                break;
            case DT_JMPREL:
                break;
            case DT_BIND_NOW:
                break;
            case DT_INIT_ARRAY:
                elfInfo->dynamicInfo.initFunctionAddress=dyn[cnt].d_un.d_ptr;
                elfInfo->dynamicInfo.initFunctionAddress+=libLoadOffset;
                break;
            case DT_FINI_ARRAY:
                elfInfo->dynamicInfo.termFunctionAddress=dyn[cnt].d_un.d_ptr;
                elfInfo->dynamicInfo.termFunctionAddress+=libLoadOffset;
                break;
            case DT_INIT_ARRAYSZ:
                break;
            case DT_FINI_ARRAYSZ:
                break;
            case DT_FLAGS:
                break;
            default:
                break;
        }
    }

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
            printd(DEBUG_ELF_LOADER,"putDataOnPages: V=0x%08X not mapped, mapped to P=0x%08X\n",startVirtAddr,startPhysAddr);
            pagingMapPage(oldCR3,startPhysAddr | KERNEL_PAGED_BASE_ADDRESS,startPhysAddr,0x7);
            printd(DEBUG_ELF_LOADER,"putDataOnPages: V=0x%08X also mapped to KP=0x%08X\n",startVirtAddr,startPhysAddr| KERNEL_PAGED_BASE_ADDRESS);
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

bool loadSections(void* file,elfInfo_t* elfInfo,uintptr_t CR3,bool isLibrary)
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
    
    //Get the section header tablex
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
            if ((kDebugLevel & DEBUG_ELF_LOADER) == DEBUG_ELF_LOADER)
                printd(DEBUG_ELF_LOADER,"Section %u, file/mem sizes=0x%X/0x%X, not loading\n", pgmSectionNum, elfInfo->pgmHdrTable[pgmSectionNum].p_filesz>0,elfInfo->pgmHdrTable[pgmSectionNum].p_memsz);
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
    if (!loadSections(fPtr,elfInfo,CR3,isLibrary))
        return -4;

    //First iterate the sections to find the string & symbol tables
    printd(DEBUG_ELF_LOADER,"Scanning section header entries (%u)\n",elfInfo->secHdrRecordCount);
    //First find the string table
    for (int cnt=0;cnt<elfInfo->secHdrRecordCount;cnt++)
    {
        if (elfInfo->secHdrTable[cnt].sh_type==SHT_STRTAB)
        {
            fl_fseek(fPtr,elfInfo->secHdrTable[cnt].sh_offset,SEEK_SET);
            elfInfo->dynamicInfo.strTableAddress=malloc(elfInfo->secHdrTable[cnt].sh_size);
            fl_fread((char*)elfInfo->dynamicInfo.strTableAddress,1,elfInfo->secHdrTable[cnt].sh_size,fPtr);
            elfInfo->dynamicInfo.strTableFilePtr=elfInfo->secHdrTable[cnt].sh_offset;
            elfInfo->dynamicInfo.strTableSize=elfInfo->secHdrTable[cnt].sh_size;
            printd(DEBUG_ELF_LOADER,"Found string (STRTAB) table, read to address 0x%08X, size=0x%08X\n",elfInfo->dynamicInfo.strTableAddress, elfInfo->secHdrTable[cnt].sh_size);
            break;
        }
    }    
    for (int cnt=0;cnt<elfInfo->secHdrRecordCount;cnt++)
    {
        if (elfInfo->secHdrTable[cnt].sh_type==SHT_STRTAB)
            if (elfInfo->dynamicInfo.strTableFilePtr==elfInfo->secHdrTable[cnt].sh_offset)
            {
             /*do nothing, we already found this*/   
            }
            else
            {
                printd(DEBUG_ELF_LOADER,"Found secondary string (STRTAB) table address 0x%08X, ***not using***\n",elfInfo->secHdrTable[cnt].sh_addr);
            }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_SYMTAB)
        {
            elfInfo->dynamicInfo.symTableAddress=elfInfo->secHdrTable[cnt].sh_addr;
            if (isLibrary)
                elfInfo->dynamicInfo.symTableAddress+=libLoadOffset;
            printd(DEBUG_ELF_LOADER,"Found symbol (SYMTAB) table address 0x%08X\n",elfInfo->dynamicInfo.symTableAddress);
        }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_DYNAMIC)
        {
            elfInfo->dynamicSectionAddress=elfInfo->secHdrTable[cnt].sh_addr;
            if (isLibrary)
                elfInfo->dynamicSectionAddress+=libLoadOffset;
            printd(DEBUG_ELF_LOADER,"Found section %s (DYNAMIC)  table address 0x%08X.\n",strTabEntry(elfInfo,elfInfo->secHdrTable[cnt].sh_name),elfInfo->dynamicInfo.symTableAddress);
        }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_DYNSYM)
        {
            printd(DEBUG_ELF_LOADER,"Found %s (DYNSYM) section address 0x%08X.\n",strTabEntry(elfInfo,elfInfo->secHdrTable[cnt].sh_name),elfInfo->secHdrTable[cnt].sh_addr);
        }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_RELA)
        {
            printd(DEBUG_ELF_LOADER,"Found %s (RELA) section address 0x%08X.\n",strTabEntry(elfInfo,elfInfo->secHdrTable[cnt].sh_name),elfInfo->secHdrTable[cnt].sh_addr);
        }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_HASH)
        {
            printd(DEBUG_ELF_LOADER,"Found %s (HASH) section address 0x%08X.\n",strTabEntry(elfInfo,elfInfo->secHdrTable[cnt].sh_name),elfInfo->secHdrTable[cnt].sh_addr);
        }
        else if (elfInfo->secHdrTable[cnt].sh_type==SHT_NOTE)
        {
            printd(DEBUG_ELF_LOADER,"Found %s (NOTE) section address 0x%08X.\n",strTabEntry(elfInfo,elfInfo->secHdrTable[cnt].sh_name),elfInfo->secHdrTable[cnt].sh_addr);
        }
        else
        {
            printd(DEBUG_ELF_LOADER,"Found (%s) section address 0x%08X.\n",strTabEntry(elfInfo,elfInfo->secHdrTable[cnt].sh_name),elfInfo->secHdrTable[cnt].sh_addr);
        }
    }
     processELFDynamicSection(elfInfo);   
     return true;
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