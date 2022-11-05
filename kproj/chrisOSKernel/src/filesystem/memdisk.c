/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "filesystem/memdisk.h"
#include "kmalloc.h"
#include "utility.h"

void initmemdiskfs()
{
    memDisks=kMalloc(DISK_MAX_MEMDISKS*sizeof(memdisk_t));
    memset(memDisks,0,DISK_MAX_MEMDISKS*sizeof(memdisk_t));
    memDisksRegistered=0;
}

void registerMemDisk(char *mountPoint, uint32_t sizeInBytes)
{
        memDisks[memDisksRegistered].mountPoint=mountPoint;
        memDisks[memDisksRegistered].size=sizeInBytes;
        memDisks[memDisksRegistered].image=kMalloc(sizeInBytes);
        
}