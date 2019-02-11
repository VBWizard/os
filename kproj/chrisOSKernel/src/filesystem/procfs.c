/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "filesystem/procfs.h"
#include "../../../chrisOS/include/config.h"
#include "kmalloc.h"
#include "utility.h"
#include "strings.h"
#include "printf.h"
#include "device.h"
#include "alloc.h"
#include "task.h"
#include "process.h"

extern uint64_t kE820MemoryBytes;
extern uint32_t kmmHeapMemoryTotal;
extern uint32_t kernelPoolMemorySize;
extern sMemInfo* heapMemoryInfo;
extern task_t *kTaskList;;

filesystem_t *initprocfs()
{
    filesystem_t* fs;
    
    memset(&procFOps, 0, sizeof(file_operations_t));
    procFOps.open=&procOpenFile;
    procFOps.read=&procReadFile;
    procFOps.write=&procWriteFile;
    procFOps.close=&procCloseFile;
    procFOps.seek=&procSeekFile;
    
    procDOps.open=&procDirOpen;
    procDOps.close=&procDirClose;
    procDOps.read=&procDirRead;
    
    dirops_t *dops=kMalloc(sizeof(dirops_t));
    //dops->open
    
    fs = kRegisterFileSystem("/proc", &procFOps, &procDOps);
    buildProcfs();
    return fs;
}

void buildProcfs()
{
    updateRootDirFiles();
}

size_t procFileSize(procfile_t *file)
{
    char content[1024];
    
    if (strcmp(file->filename,"meminfo")==0)
    {
        getMemInfo(content,1024);
        return strlen(content);
    }
    return 0;
}

void getMemInfo(char *buffer, int buffersize)
{
    char *bufptr=buffer;
    sMemInfo* mInfo=heapMemoryInfo;
    uint32_t usedHeap=0, availableHeap=0;
    
    do
    {
        if (mInfo->inUse)
            usedHeap+=mInfo->size;
        else
            availableHeap+=mInfo->size;
        if (mInfo->next)
            mInfo++;
    }
    while (mInfo->next);
    
    sprintf(buffer, "SystemMemory=%i\n",kE820MemoryBytes);
    bufptr=buffer+strlen(buffer);
    sprintf(bufptr,"KernelMemory=%i\n",kernelPoolMemorySize);
    bufptr=buffer+strlen(buffer);
    sprintf(bufptr,"HeapMemory=%i\n",kmmHeapMemoryTotal);
    bufptr=buffer+strlen(buffer);
    sprintf(bufptr,"UsedHeap=%i\n",usedHeap);
    bufptr=buffer+strlen(buffer);
    sprintf(bufptr,"AvailableHeap=%i\n",availableHeap);
}

void updateRootDirFiles()
{
    task_t* taskList=kTaskList;

    if (!procRootDir.dirs)
        procRootDir.dirs=kMalloc(PROCFS_DIR_MAXDIRS*sizeof(procdir_t));

    procRootDirFilePtr=0;
    memset(&procRootDir.files,0,PROCFS_DIR_MAXFILES*sizeof(procfile_t));
    memset(procRootDir.dirs,0,PROCFS_DIR_MAXDIRS*sizeof(procdir_t));
    strcpy(procRootDir.files[procRootDirFilePtr].filename,"meminfo");
    procRootDir.files[procRootDirFilePtr].parentDir=&procRootDir;
    char meminfo[1024];
    getMemInfo(meminfo,1024);
    procRootDir.files[procRootDirFilePtr++].size=&procFileSize;
    do
    {
        if (taskList->taskNum!=0)
        {
            sprintf(procRootDir.dirs[procRootDirDirPtr].dirname, "%u (%s)",taskList->taskNum,((process_t*)taskList->process)->exename);
            procRootDir.dirs[procRootDirDirPtr].size=0;
            procRootDir.dirs[procRootDirDirPtr].parentDir=&procRootDir;
            procRootDirDirPtr++;
        }
        taskList++;
    }
    while (taskList->next!=NO_NEXT);
}


void *procOpenFile(void *file, const char *mode)
{
    char path[128];
    char filename[128];
    char *subdir;
    
    if (!pathTokens)
        pathTokens=kMalloc(20*sizeof(char*));
    if (pathTokens[0]==NULL)
        for (int cnt=0;cnt<20;cnt++)
            pathTokens[cnt]=kMalloc(128);
    
    for (int cnt=0;cnt<20;cnt++)
        memset(pathTokens[cnt],0,128);
    parsePath(file, &path[0], &filename[0], pathTokens, 20);
    
    if (strncmp(path,"/proc",5))
        return NULL;

    
    
    subdir=strstr(path+6,"/");
    
    if (subdir!=NULL)
    {
    }   
    
    if (strcmp(filename,"meminfo")==0)
    {
        pfile_t *pFile=kMalloc(sizeof(pfile_t));
        pFile->procfile=&procRootDir.files[0];
        pFile->offset=0;
        pFile->handle=pFile;
        pFile->content=kMalloc(1024);
        getMemInfo(pFile->content,1024);
        pFile->offset=0;
        pFile->fops=&procFOps;
        
        //Build the content of the file
        
        
        return pFile;
    }
}

void procCloseFile(void *file)
{
    pfile_t *pf=file;
    if (pf->handle==file)
    {
        if (pf->content)
            kFree(pf->content);
        kFree(file);
    }
    return;
}

size_t procReadFile(void *buffer, int size, int length, void *file)
{
    int contentLen=0;
    int copySize=0;
    pfile_t *pf=file;
    
    if (pf->handle!=file)
        panic("procReadFile: passed file is not pfile_t\n");
    
    contentLen=strlen(pf->content);
    copySize=contentLen-pf->offset>size*length
            ?size*length:
                contentLen-pf->offset;
    
    memcpy(buffer,pf->content,copySize);
    return copySize;
}

size_t procWriteFile(const void *buffer, int size, int count, void *file)
{
    panic("Writing to proc files not implemented!\n");
}

int procSeekFile(void *f, long offset, int origin)
{
    pfile_t *pf=f;
    int fileLen=0;
    
    if (pf->handle!=f)
        panic("procSeekFile: passed file is not pfile_t\n");
    
    fileLen=strlen(pf->content);
    
    if (offset<0)
        return -1;
    
    if (offset>fileLen)
        pf->offset=fileLen;
    else if (origin==SEEK_CUR)
    {
        if (pf->offset+offset>fileLen)
            pf->offset=fileLen;
        else
            pf->offset+=offset;
    }
    else if (origin==SEEK_SET)
        pf->offset=offset;
    else
        panic("procSeekFile: Not implemented");
    
    return 0;
}

void *procDirOpen(const char* path, void* dir)
{
    char lPath[256];
    
    strncpy((char*)lPath,(char*)path,256);
    strtrim(lPath);
    if (strncmp(lPath,"/proc",5)!=0)
        panic("procDirOpen: Opening subdirectories of /proc is not implemented\n");
    
    pdir_t *pdir=kMalloc(sizeof(pdir_t));
    pdir->handle=pdir;
    pdir->offset=0;
    pdir->procdir=&procRootDir;
    pdir->dops=&procDOps;
    pdir->returningFileSet=false;
    dir=pdir;
    updateRootDirFiles();
    return pdir;
}

int procDirClose(void *dir)
{
    pdir_t *pdir=dir;
    if (pdir->handle==pdir)
    {
        kFree(pdir);
    }
    return 0;
}

int procDirRead(void *dir, dirent_t *entry)
{
    pdir_t *pdir=dir;
    int lOffset;
    
    if (pdir->handle!=pdir)
        panic("procDirRead: Passed handle is not a pdir_t\n");

    memset(entry,0,sizeof(dirent_t));

    if (!pdir->returningFileSet && pdir->offset>=procRootDirDirPtr)
    {
        pdir->returningFileSet=true;
        pdir->offset=0;
    }
    else if (pdir->returningFileSet && pdir->offset>=procRootDirFilePtr)
    {
        return -1;
    }
    
    if (!pdir->returningFileSet)
    {
        strcpy(entry->filename,procRootDir.dirs[pdir->offset].dirname);
        entry->is_dir=true;
        entry->size=0;
        pdir->offset++;
    }
    else
    {
        strcpy(entry->filename,procRootDir.files[pdir->offset].filename);
        entry->is_dir=false;
        if (procRootDir.files[pdir->offset].size)
            entry->size=procRootDir.files[pdir->offset].size(&procRootDir.files[pdir->offset]);
        else
            entry->size=0;
        pdir->offset++;
    }
    
    return 0;
}
