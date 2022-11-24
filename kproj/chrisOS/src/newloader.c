#define USE_FILELIB_STDIO_COMPAT_NAMES 1
#include "chrisos.h"
#include "fat/fat_filelib.h"
#include <elf.h>
#include "elfloader.h"
#include "printf.h"
#include "kbd.h"
#include "utility.h"
#include "exec.h"
#include "strings.h"
#include "debugger.h"


uint32_t libLoadOffset=LIBRARY_BASE_LOAD_ADDRESS;
extern int kExecLoadCount;
extern elfInfo_t* KERNEL_DATA_SECTION kExecLoadInfo;

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
/*            case DT_NEEDED:
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
                loadElf(fPtr,elfLibPtr,true);
                fclose(fPtr);
                if (!elfLibPtr->loadCompleted)
                {
                    printd(DEBUG_ELF_LOADER,"EXEC: processELFDynamicSection ... loading library failed.");
                    elfInfo->loadCompleted=false;
                    return;
                }
                break;
*/            case DT_PLTRELSZ:
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
                elfInfo->dynamicInfo.strTableSize[0]=dyn[cnt].d_un.d_val;
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

void loadSections(void* file,elfInfo_t* elfInfo, bool isLibrary)
{
    uint8_t* loadAddress;

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
                    return;
                }
    
    //Make sure the file is viable
    if (elfInfo->hdr.e_type!=ET_EXEC && elfInfo->hdr.e_type!=ET_DYN)
    {
        printd(DEBUG_ELF_LOADER,"Wrong ELF type 0x%04x, cannot load\n", elfInfo->hdr.e_type);
        elfInfo->loadCompleted=false;
        return;
    }
    if (elfInfo->hdr.e_machine!=EM_386)
    {
        printd(DEBUG_ELF_LOADER,"Wrong ELF architecture 0x%04x, cannot load\n", elfInfo->hdr.e_type);
        elfInfo->loadCompleted=false;
        return;
    }
    
    //Get the section header table
    printd(DEBUG_ELF_LOADER,"section header record count= %u\n", elfInfo->hdr.e_shnum);
    printd(DEBUG_ELF_LOADER,"e_shentsize=%u, oursize=%u\n", elfInfo->hdr.e_shentsize, sizeof(Elf32_Shdr) );
    fl_fseek(file, elfInfo->hdr.e_shoff,SEEK_SET);
    printd(DEBUG_ELF_LOADER,"reading SHOFF\n",elfInfo->hdr.e_shoff);
    fl_fread(elfInfo->secHdrTable, sizeof(Elf32_Shdr),elfInfo->hdr.e_shnum,file);
    
    //Get the program header table
    printd(DEBUG_ELF_LOADER,"seeking to 0x%08X ...",elfInfo->hdr.e_phoff);
    printd(DEBUG_ELF_LOADER,"reading PHOFF\n",elfInfo->hdr.e_phoff);
    fl_fseek(file, elfInfo->hdr.e_phoff, SEEK_SET);
    fl_fread(elfInfo->pgmHdrTable, sizeof(Elf32_Phdr),elfInfo->hdr.e_phnum,file);
    
    //Process the program header table and load all of the sections in the file into memory
    for (int cnt=0;cnt<elfInfo->hdr.e_phnum;cnt++)
    {
        loadAddress = (uint8_t*)elfInfo->pgmHdrTable[cnt].p_vaddr;
        if (isLibrary)
        {
            loadAddress+=libLoadOffset;
            elfInfo->pgmHdrTable[cnt].p_vaddr=(Elf32_Addr)loadAddress;
        }

        if (elfInfo->pgmHdrTable[cnt].p_vaddr==(Elf32_Addr)KERNEL_DATA_LOAD_ADDRESS)
        {
            printd(DEBUG_ELF_LOADER,"Section %u load address is kernel data base address (0x%08X), skipping load\n",cnt,loadAddress);
            continue;
        }
        else if (elfInfo->pgmHdrTable[cnt].p_offset==elfInfo->hdr.e_phoff)
        {
            printd(DEBUG_ELF_LOADER,"Section %u file offset is program header address (0x%08X),skipping load\n",cnt,elfInfo->pgmHdrTable[cnt].p_offset);
            continue;
        }
        if (loadAddress!=0 && elfInfo->libLoadAddress==0 && (elfInfo->hdr.e_type!=ET_REL && elfInfo->hdr.e_type!=ET_DYN))
        {
            elfInfo->libLoadAddress=(uintptr_t)loadAddress;
            printd(DEBUG_ELF_LOADER,"Setting main load address to 0x%08X\n",loadAddress);
            
        }
        //printd(DEBUG_ELF_LOADER,"Next load address is 0x%08X\n",elfInfo->pgmHdrTable[cnt].p_vaddr);
        if (elfInfo->pgmHdrTable[cnt].p_filesz>0)
        {
            printd(DEBUG_ELF_LOADER,"seeking to 0x%08X ...",elfInfo->pgmHdrTable[cnt].p_offset);
            fl_fseek(file, elfInfo->pgmHdrTable[cnt].p_offset, SEEK_SET);
            printd(DEBUG_ELF_LOADER,"reading %u bytes to 0x%08X\n",elfInfo->pgmHdrTable[cnt].p_filesz,loadAddress);
            if (loadAddress==0xc0100000)
            {
                int a=0;
                a+=1-1+2-2+3;
            }
            fl_fread(loadAddress, elfInfo->pgmHdrTable[cnt].p_filesz, 1, file); //CLR 03/12/2017: Changed from p_memsz to p_filesz (prev & next line too))
            printd(DEBUG_ELF_LOADER,"Section %u loaded 0x%08X bytes at 0x%08X\n", cnt, elfInfo->pgmHdrTable[cnt].p_filesz, loadAddress);
            if (elfInfo->pgmHdrTable[cnt].p_filesz<elfInfo->pgmHdrTable[cnt].p_memsz)
            {
                printd(DEBUG_ELF_LOADER,"Section %u has uninitialized data, zeroed 0x%08X bytes at 0x%08X\n", cnt, elfInfo->pgmHdrTable[cnt].p_memsz-elfInfo->pgmHdrTable[cnt].p_filesz, loadAddress+elfInfo->pgmHdrTable[cnt].p_filesz);
                memset(loadAddress+elfInfo->pgmHdrTable[cnt].p_filesz+1,0,elfInfo->pgmHdrTable[cnt].p_memsz-elfInfo->pgmHdrTable[cnt].p_filesz);
            }
        }
        else if (elfInfo->pgmHdrTable[cnt].p_memsz>0)
        {
            printd(DEBUG_ELF_LOADER,"Section %u not loadable, zeroed 0x%08X bytes at 0x%08X\n",cnt, elfInfo->pgmHdrTable[cnt].p_memsz, loadAddress);
        }
#ifndef DEBUG_NONE
        else
            if ((kDebugLevel & DEBUG_ELF_LOADER) == DEBUG_ELF_LOADER)
                printd(DEBUG_ELF_LOADER,"Section %u, file/mem sizes=0x%X/0x%X, not loading\n", cnt, elfInfo->pgmHdrTable[cnt].p_filesz>0,elfInfo->pgmHdrTable[cnt].p_memsz);
#endif

    }
    //Done processing the program header table
    printd(DEBUG_ELF_LOADER,"LoadElf: done loading file\n");
    
}

void loadElf(void* file,elfInfo_t* elfInfo, bool isLibrary)
{
    char* sectStringTable=(char*)0x1900000;  //TODO: Fix this!!!

    //Initialize the structs we will be using
    memset(elfInfo,0,sizeof(elfInfo_t));
    memset(&elfInfo->dynamicInfo,0,sizeof(elfDynamic_t));

    elfInfo->loadCompleted=true;
    //Load all of the sections in the file to memory
    loadSections(file,elfInfo,isLibrary);
    

    //List the sections (debugging)
    if (kDebugLevel&DEBUG_ELF_LOADER)
    {
        printd(DEBUG_ELF_LOADER,"Table\t     MemAddr\t\tFileAddr\t\tSize\ttype\n");
        for (int cnt=0;cnt<elfInfo->hdr.e_shentsize;cnt++)
        {
            if (*(sectStringTable+elfInfo->secHdrTable[cnt].sh_name)>0)
                printd(DEBUG_ELF_LOADER,"%-10s\t0x%08X\t0x%08X\t0x%08X\t0x%08X\n",
                        sectStringTable+elfInfo->secHdrTable[cnt].sh_name,
                        elfInfo->secHdrTable[cnt].sh_addr,
                        elfInfo->secHdrTable[cnt].sh_offset,
                        elfInfo->secHdrTable[cnt].sh_size, 
                        elfInfo->secHdrTable[cnt].sh_type);
        }
        printd(DEBUG_ELF_LOADER,"End of section table... press a key to continue\n");
    }
    
    //Find the symbol and string tables in the dynamic section
    if (elfInfo->dynamicSectionAddress>0)
    {
        printd(DEBUG_ELF_LOADER,"Processing dynamic sect, section address=0x%08X, count=%u\n",elfInfo->dynamicSectionAddress,elfInfo->dynamicRecordCount);
        Elf32_Dyn* dyn=(Elf32_Dyn*)elfInfo->dynamicSectionAddress;

        //First iterate the section to find the string & symbol tables
        for (int cnt=0;cnt<elfInfo->dynamicRecordCount;cnt++)
        {
            if (dyn[cnt].d_tag==DT_STRTAB)
            {
                elfInfo->dynamicInfo.strTableAddress[0]=(uintptr_t*)dyn[cnt].d_un.d_ptr;
                if (isLibrary)
                    elfInfo->dynamicInfo.strTableAddress[0]+=libLoadOffset;
                printd(DEBUG_ELF_LOADER,"Found dynamic string table address 0x%08X\n",elfInfo->dynamicInfo.strTableAddress);
            }
            else if (dyn[cnt].d_tag==DT_SYMTAB)
            {
                elfInfo->dynamicInfo.symTableAddress=dyn[cnt].d_un.d_ptr;
                if (isLibrary)
                    elfInfo->dynamicInfo.symTableAddress+=libLoadOffset;
                printd(DEBUG_ELF_LOADER,"Found dynamic symbol table address 0x%08X\n",elfInfo->dynamicInfo.symTableAddress);
            }
        }
        if (!elfInfo->dynamicInfo.strTableAddress)
        {
            printk("EXEC: Dynamic loading, unable to find dynamic string table address, cannot execute.\n");
            elfInfo->loadCompleted=false;
            return;
        }
        else if (!elfInfo->dynamicInfo.symTableAddress)
        {
            printk("EXEC: Dynamic loading, unable to find dynamic symbol table address, cannot execute.\n");
            elfInfo->loadCompleted=false;
            return;
        }

     processELFDynamicSection(elfInfo);   
    
    }
}

int exec(char* fileName,int argc,char** argv)
{
    int lRetVal=-1;
    register int *eax __asm__("eax");
    
    //Open the executable
    void* fPtr=fopen(fileName, "r");
    if (fPtr==0)
    {
        printk("Error opening file '%s' (0x%08X), cannot exec\n",fileName,fPtr);
        return -1;
    } 
    
    //Get a slot in the load info
    elfInfo_t elfF;
    elfInfo_t* elf=&elfF;
    
    //Load the executable
    loadElf(fPtr,elf,false);
    printd(DEBUG_ELF_LOADER,"exec: back from loading ELF file, result=%s\n",elf->loadCompleted?"Success":"Failure");;
    fclose(fPtr);
    
    //If loaded successfully then execute
    if (elf->loadCompleted)
    {
        printd(DEBUG_ELF_LOADER,"exec: Executing %s at 0x%08X, return address is =0x%08X\n", fileName, elf->hdr.e_entry, __builtin_return_address(0));
        __asm__("push ebx\npush ecx\n"::[argvp] "b" (argv), [argcv] "c" (argc));
        __asm__("mov edx,%[pgmptr]\n"::[pgmptr] "d" (elf->hdr.e_entry));
        __asm__("call edx\n"::[pgmptr] "d" (elf->hdr.e_entry));
        lRetVal=(uint32_t)eax;
        printd(DEBUG_ELF_LOADER,"exec: Back from executing %s, return value is 0x%08X, 0x%08X, __bra=0x%08X\n", fileName, lRetVal, &fileName, __builtin_return_address(0));
    }
    return lRetVal;
}


