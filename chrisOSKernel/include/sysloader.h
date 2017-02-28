/* 
 * File:   sysloader.h
 * Author: yogi
 *
 * Created on June 9, 2016, 3:12 PM
 */

#ifndef SYSLOADER_H
#define	SYSLOADER_H
#include "process.h"
#include "elf.h"
int sysExec(process_t* process,int argc,char** argv);
uint32_t sysLoadElf(char* fileName, elfInfo_t* pElfInfo, uintptr_t CR3, bool isLibrary);
#endif	/* SYSLOADER_H */