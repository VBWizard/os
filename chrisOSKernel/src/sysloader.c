#define USE_FILELIB_STDIO_COMPAT_NAMES 1
#include "chrisos.h"
#include <elf.h>
#include "elfloader.h"
#include "printf.h"
#include "kbd.h"
#include "utility.h"
#include "exec.h"
#include "task.h"
#include "../../chrisOS/include/init/ata_disk.h"
#include "../../chrisOS/src/fat/fat_filelib.h"
#include "../../chrisOS/include/filesystem.h"

extern struct ataDeviceInfo_t* kATADeviceInfo;
uint32_t cr3BeforeExec;
extern int kAHCISelectedDiskNum; 
extern int kAHCISelectedPartNum;
extern int ahciBlockingRead28(uint32_t sector, uint8_t *buffer, uint32_t sector_count);
int ahciBlockingWrite28(/*unsigned drive, */uint32_t sector, uint8_t *buffer, uint32_t sector_count);


uintptr_t switchCR3(uintptr_t newCR3)
{
    uintptr_t lOldCR3=0;
    __asm__("mov ebx,cr3\n mov cr3,eax\n":[lOldCR3] "=b" (lOldCR3):[newCR3] "a" (newCR3));
    return lOldCR3;
}


uint32_t sysLoadElf(void* file, task_t* task, bool isLibrary)   //returns entry point
{
    Elf32_Ehdr hdr;
    Elf32_Shdr secHdrTable[50];
    Elf32_Phdr pgmHdrTable[50];
    int secHdrRecordCount=0, pgmHdrRecordCount=0;;
    uint8_t* loadAddress;
    
    cr3BeforeExec=switchCR3(task->tss->CR3);
    STOPHERE2
    fl_fseek(file, 0, SEEK_SET);
    fl_fread(&hdr, sizeof(hdr),1,file);
    if (hdr.e_ident[0] != 0x7F) 
        if (hdr.e_ident[1] != 'E') 
            if (hdr.e_ident[1] != 'L') 
                if (hdr.e_ident[2] != 'F')
    {
        printd(DEBUG_LOADER,"Invalid ELF magic '%c' '%c' '%c', cannot load", hdr.e_ident[1], hdr.e_ident[2], hdr.e_ident[3]);
        return -1;
    }
    if (hdr.e_type!=ET_EXEC)
    {
        printd(DEBUG_LOADER,"Wrong ELF type 0x%04X, cannot load\n", hdr.e_type);
        return -2;
    }
    if (hdr.e_machine!=EM_386)
    {
        printd(DEBUG_LOADER,"Wrong ELF architecture 0x%04X, cannot load\n", hdr.e_type);
        return -3;
    }
    
    secHdrRecordCount=hdr.e_shnum;
    pgmHdrRecordCount=hdr.e_phnum;
    printd(DEBUG_LOADER,"section header record count= %u\n", hdr.e_shnum);
    printd(DEBUG_LOADER,"e_shentsize=%u, oursize=%u\n", hdr.e_shentsize, sizeof(Elf32_Shdr) );

    printd(DEBUG_LOADER,"seeking to 0x%08X ...",hdr.e_shoff);
    fl_fseek(file, hdr.e_shoff,SEEK_SET);
    printd(DEBUG_LOADER,"reading SHOFF\n",hdr.e_shoff);
    fl_fread(&secHdrTable, sizeof(Elf32_Shdr),secHdrRecordCount,file);
    
    printd(DEBUG_LOADER,"seeking to 0x%08X ...",hdr.e_phoff);
    printd(DEBUG_LOADER,"reading PHOFF\n",hdr.e_phoff);
    fl_fseek(file, hdr.e_phoff, SEEK_SET);
    fl_fread(&pgmHdrTable, sizeof(Elf32_Phdr),pgmHdrRecordCount,file);
    
    for (int cnt=0;cnt<pgmHdrRecordCount;cnt++)
    {
        //Get the address to load the section to
        loadAddress = (uint8_t*)pgmHdrTable[cnt].p_vaddr;
        if (pgmHdrTable[cnt].p_vaddr==KERNEL_DATA_LOAD_ADDRESS)
        {
            printd(DEBUG_LOADER,"Load address is kernel data base address (0x%08X), skipping load\n",loadAddress);
            continue;
        }
        printd(DEBUG_LOADER,"Next load address is 0x%08X\n",pgmHdrTable[cnt].p_vaddr);
        if (pgmHdrTable[cnt].p_filesz>0)
        {
            printd(DEBUG_LOADER,"seeking to 0x%08X ...",pgmHdrTable[cnt].p_offset);
            fl_fseek(file, pgmHdrTable[cnt].p_offset, SEEK_SET);
            printd(DEBUG_LOADER,"reading %u bytes to 0x%08X\n",pgmHdrTable[cnt].p_memsz,loadAddress);
            //NOTE: Need to switch to the new CR3 first, but to do that we have to map the kernel into the new CR3
            //Map the page into the processes 
            pagingMapPage(task->tss->CR3,loadAddress,loadAddress,0x3);
            fl_fread(loadAddress, 1, pgmHdrTable[cnt].p_memsz, file);

            if ((kDebugLevel & DEBUG_LOADER) == DEBUG_LOADER)
                printd(DEBUG_LOADER,"Section %u loaded 0x%08X bytes at 0x%08X\n", cnt, pgmHdrTable[cnt].p_memsz, loadAddress);
            if (pgmHdrTable[cnt].p_filesz<pgmHdrTable[cnt].p_memsz)
            {
                if ((kDebugLevel & DEBUG_LOADER) == DEBUG_LOADER)
                    printd(DEBUG_LOADER,"Section %u has uninitialized data, zeroed 0x%08X bytes at 0x%08X\n", cnt, pgmHdrTable[cnt].p_memsz-pgmHdrTable[cnt].p_filesz, loadAddress+pgmHdrTable[cnt].p_filesz);
                memset(loadAddress+pgmHdrTable[cnt].p_filesz+1,0,pgmHdrTable[cnt].p_memsz-pgmHdrTable[cnt].p_filesz);
            }
        }
        else if (pgmHdrTable[cnt].p_memsz>0)
        {
            if ((kDebugLevel & DEBUG_LOADER) == DEBUG_LOADER)
                printd(DEBUG_LOADER,"Section %u not loadable, zeroed 0x%08X bytes at 0x%08X\n",cnt, pgmHdrTable[cnt].p_memsz, loadAddress);
            memset(loadAddress,0,pgmHdrTable[cnt].p_memsz);
        }
        else
            if ((kDebugLevel & DEBUG_LOADER) == DEBUG_LOADER)
                printd(DEBUG_LOADER,"Section %u, file/mem sizes=0x%X/0x%X, not loading\n", cnt, pgmHdrTable[cnt].p_filesz>0,pgmHdrTable[cnt].p_memsz);

    }
    printd(DEBUG_LOADER,"LoadElf: done loading file\n");
    return hdr.e_entry;
}

int sysExec(char* fileName,int argc,char** argv,)
{
    int lsysExecRetVal=0;
    register int *eax __asm__("eax");
    
    printd(DEBUG_LOADER,"sysExec: Entered ... executing '%s'\n",fileName);
    void* fPtr=fopen(fileName, "r");
    printd(DEBUG_LOADER,"fopen returned %u\n",fPtr);
    if (fPtr<=0)
    {
        printk("Error opening file '%s' (err=%u), cannot exec\n",fileName,fPtr);
        return fPtr;
    }   

    task_t* task = createTask(true);
    sysLoadElf(fPtr,task)

    //printd(DEBUG_ELF_LOADER,"exec: Executing %s at 0x%08X, return address is =0x%08X\n", fileName, testFunction, __builtin_return_address(0));

    __asm__("push ebx\npush ecx\n"::[argvp] "b" (argv), [argcv] "c" (argc));
    __asm__("mov edx,%[pgmptr]\n"::[pgmptr] "d" (task->tss->EIP));
    //__asm__("call edx\n"::[pgmptr] "d" (testFunction));
    lsysExecRetVal=(uint32_t)eax;
    printd(DEBUG_LOADER,"exec: Back from executing %s, return value is 0x%08X, 0x%08X, __bra=0x%08X\n", fileName, lsysExecRetVal, &fileName, __builtin_return_address(0));
    switchCR3(cr3BeforeExec);
    return lsysExecRetVal;
}
