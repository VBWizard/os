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
#include "task.h"

int sysExec(process_t* process,int argc,char** argv);
elfInfo_t* sysLoadElf(char* fileName, elfInfo_t* pElfInfo, uintptr_t CR3, bool alreadyLoaded);
#endif	/* SYSLOADER_H */