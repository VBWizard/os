/* 
 * File:   bishell.h
 * Author: yogi
 *
 * Created on May 19, 2016, 12:15 PM
 */

#ifndef BISHELL_H
#define	BISHELL_H
/*Parts from: http://wiki.osdev.org/Creating_A_Shell*/
#include "memory.h"
#include "utility.h"
#include "pci/pci.h"

#define INITIAL_MAXARGC 20
#define EOS '\0'
#define NUMBER_OF_COMMANDS sizeof(cmds)/sizeof(command_table_t)

extern void terminal_clear();
extern void printMPTable();

typedef struct
{
    char *name;
    char *description;
    void *function;
    int paramCount;
} command_table_t;

void helpMe();
void dumpP(char* cmdline);
void dumpV(char* cmdline);
extern void printPCIConfig();
void QueryBDF(char* cmdline);
void biShell();
void inPortB(char* cmdline);
void inPortW(char* cmdline);
void inPortD(char* cmdline);
void outPortB(char* cmdline);
void outPortW(char* cmdline);
void outPortD(char* cmdline);
void writeBytes(char* cmdline);
void writeWords(char* cmdline);
void writeDWords(char* cmdline);
void printAHCICaps();
void showMapping(char* cmdline);
void HIGH_CODE_SECTION showMappingCR3(char* cmdline);
void HIGH_CODE_SECTION selectHDNum (char* cmdline);
void HIGH_CODE_SECTION selectPart(char* cmdline);
void HIGH_CODE_SECTION listParts(char* cmdline);
void HIGH_CODE_SECTION attach(char* cmdline);
void HIGH_CODE_SECTION listDir(char* cmdline);
void HIGH_CODE_SECTION execProgram(char* cmdline);
void HIGH_CODE_SECTION displayGDTTable(char *cmdline);

command_table_t cmds[] = { 
        {"help","Get help (this information)",helpMe,0},
        {"ahci","Get AHCI capabilities info",printAHCICaps,0},
//        {"attach","Attach selected disk and partition to /",attach,0},
        {"bdf","Query PCI device by bus/device/function",QueryBDF,1},
        {"cls","Clear screen",terminal_clear,0}, 
        {"disk","Make a disk the 'current' disk (integer)",selectHDNum,1},
        {"dko","Dump kernel object addresses",dumpKernelAddresses,0},
        {"e820","Print E820 Memory Map",printE820Map,0},
        {"exec","Execute a program from disk",execProgram,1},
        {"gdt","Display the GDT table",displayGDTTable,1},
        {"inb","Get a byte from a port",inPortB,1},
        {"inw","Get a word from a port",inPortW,1},
        {"ind","Get a dword from a port",inPortD,1},
        {"listparts","List partitions for the current disk",listParts,1},
        {"ls","List directory",listDir,1},
        {"outb","Write a byte to a port",outPortB,1},
        {"outw","Write a word to a port",outPortW,1},
        {"outd","Write a dword to a port",outPortD,1},
        {"page","Show the mapping for a virtual address (optionally pass CR3 as first parameter)",showMapping,1},
        {"pci","Dump PCI table",printPCIConfig,0},
        {"part","select partition of selected HD",selectPart,1},
        {"reboot","Reboot the computer",reboot,0},
        {"scanpci","Re-scan the PCI busses",pciInitialize,0},
        {"smp","Dump MP table",printMPTable,0}, 
        {"db","Write bytes at address",writeBytes,1},
        {"dw","Write bytes at address",writeWords,1},
        {"dd","Write bytes at address",writeDWords,1},
        {"xp","Dump physical memory addresses",dumpP,1}, 
        {"x","Dump virtual memory addresses",dumpV,1} };
void (*command_function)(void);
void (*command_function_p)(char*);

#endif	/* BISHELL_H */

