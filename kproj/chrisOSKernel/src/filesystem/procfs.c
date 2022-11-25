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
#include "schedule.h"
#include "kernelVariables.h"
#include "drivers/termdrv.h"
#include "task.h"
#include "assert.h"

extern uint64_t kE820MemoryBytes;
extern uint32_t kmmHeapMemoryTotal;
extern uint32_t kernelPoolMemorySize;
extern sMemInfo* heapMemoryInfo;
extern task_t *kTaskList;;
extern task_t *kKernelTask;

char **pathTokens;
volatile int kProcRefreshLock;

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
    kProcRefreshLock=0;
    return fs;
}

void buildProcfs()
{
    updateRootDirFiles();
}

size_t procFileSize(char *procfilename, procfile_t* procfile)
{
    char content[1024];
    
    if (strcmp(procfilename,"meminfo")==0)
    {
        getMemInfo(content,1024);
    }
    if (strcmp(procfilename,"interrupts")==0)
    {
        getInterruptInfo(content,1024);

    }
    if (strcmp(procfilename,"cmdline")==0)
    {
        getCmdline(content, 1024, procfile);
    }
    if (strcmp(procfilename,"stat")==0)
    {
        getStat(content, 1024, procfile);
    }
    
    if (!procfile->content)
        procfile->content=kMalloc(1024);
    strcpy(procfile->content,content);
    return strlen(content);
}

void updateRootDirFiles()
{
    task_t* taskList=kTaskList;
    uint32_t currentTaskNum=getCurrentTask()->taskNum;

    //kProcRefreshLock
    while (__sync_lock_test_and_set(&kProcRefreshLock, 1));
    if (!procRootDir.dirs)
        procRootDir.dirs=kMalloc(PROCFS_DIR_MAXDIRS*sizeof(procdir_t));

    procRootDirFilePtr=procRootDirDirPtr=0;
    memset(&procRootDir.files,0,PROCFS_DIR_MAXFILES*sizeof(procfile_t));
    memset(procRootDir.dirs,0,PROCFS_DIR_MAXDIRS*sizeof(procdir_t));

    strcpy(procRootDir.files[procRootDirFilePtr].filename,"meminfo");
    procRootDir.files[procRootDirFilePtr].parentDir=&procRootDir;
    procRootDir.files[procRootDirFilePtr++].size=&procFileSize;

    strcpy(procRootDir.files[procRootDirFilePtr].filename,"interrupts");
    procRootDir.files[procRootDirFilePtr].parentDir=&procRootDir;
    procRootDir.files[procRootDirFilePtr++].size=&procFileSize;
    //disableScheduler();
    do
    {
        if (taskList->taskNum!=0)
        {
            //sprintf(procRootDir.dirs[procRootDirDirPtr].dirname, "%u (%s)",taskList->taskNum,((process_t*)taskList->process)->exename);
            sprintf(procRootDir.dirs[procRootDirDirPtr].dirname, "%u",taskList->taskNum);
            procRootDir.dirs[procRootDirDirPtr].size=0;
            procRootDir.dirs[procRootDirDirPtr].parentDir=&procRootDir;
            strcpy(procRootDir.dirs[procRootDirDirPtr].files[0].filename,"cmdline");
            procRootDir.dirs[procRootDirDirPtr].files[0].size=&procFileSize;
            procRootDir.dirs[procRootDirDirPtr].files[0].parentDir=&procRootDir.dirs[procRootDirDirPtr];
            strcpy(procRootDir.dirs[procRootDirDirPtr].files[1].filename,"stat");
            procRootDir.dirs[procRootDirDirPtr].files[1].size=&procFileSize;
            procRootDir.dirs[procRootDirDirPtr].files[1].parentDir=&procRootDir.dirs[procRootDirDirPtr];
            procRootDirDirPtr++;
            if (taskList->taskNum==currentTaskNum)
            {
                sprintf(procRootDir.dirs[procRootDirDirPtr].dirname, "self");
                procRootDir.dirs[procRootDirDirPtr].size=0;
                procRootDir.dirs[procRootDirDirPtr].parentDir=&procRootDir;
                strcpy(procRootDir.dirs[procRootDirDirPtr].files[0].filename,"cmdline");
                procRootDir.dirs[procRootDirDirPtr].files[0].size=&procFileSize;
                procRootDir.dirs[procRootDirDirPtr].files[0].parentDir=&procRootDir.dirs[procRootDirDirPtr];
                strcpy(procRootDir.dirs[procRootDirDirPtr].files[1].filename,"stat");
                procRootDir.dirs[procRootDirDirPtr].files[1].size=&procFileSize;
                procRootDir.dirs[procRootDirDirPtr].files[1].parentDir=&procRootDir.dirs[procRootDirDirPtr];
                procRootDirDirPtr++;
            }
        }
        taskList++;
    }
    while (taskList->next!=(task_t*)NO_NEXT);
    //enableScheduler();
    __sync_lock_release(&kProcRefreshLock);   
}

void initPathTokens()
{
    if (!pathTokens)
        pathTokens=kMalloc(20*sizeof(char*));
    if (pathTokens[0]==NULL)
        for (int cnt=0;cnt<20;cnt++)
            pathTokens[cnt]=kMalloc(128);
    else
        for (int cnt=0;cnt<20;cnt++)
            memset(pathTokens[cnt],0,128);
}

void *procOpenFile(void *file, const char *mode)
{
    char path[128];
    char filename[128];
    char *subdir;
    
    initPathTokens();
    
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
        procRootDir.files[0].size("meminfo",&procRootDir.files[0]);
        strcpy(pFile->content,procRootDir.files[0].content);
        pFile->offset=0;
        pFile->fops=&procFOps;
        return pFile;
    }
    else if (strcmp(filename,"interrupts")==0)
    {
        pfile_t *pFile=kMalloc(sizeof(pfile_t));
        pFile->procfile=&procRootDir.files[1];
        pFile->offset=0;
        pFile->handle=pFile;
        pFile->content=kMalloc(1024);
        procRootDir.files[0].size("interrupts",&procRootDir.files[1]);
        strcpy(pFile->content,procRootDir.files[1].content);
        pFile->offset=0;
        pFile->fops=&procFOps;
        return pFile;
    }
    else if (strcmp(filename,"cmdline")==0)
    {
        pfile_t *pFile=kMalloc(sizeof(pfile_t));
        pFile->offset=0;
        pFile->handle=pFile;
        pFile->content=kMalloc(1024);
        pFile->offset=0;
        pFile->fops=&procFOps;
        updateRootDirFiles();
        procdir_t *dir=NULL;
        for (int cnt=0;cnt<PROCFS_DIR_MAXDIRS;cnt++)
            if (strcmp(procRootDir.dirs[cnt].dirname,pathTokens[1])==0)
            {
                dir=&procRootDir.dirs[cnt];
                break;
            }

        if (dir==NULL)
            panic("procOpenFile: assert 1\n");
        
        for (int cnt=0;cnt<PROCFS_DIR_MAXFILES;cnt++)
            if (strcmp(dir->files[cnt].filename,"cmdline")==0)
            {
                pFile->procfile=&dir->files[cnt];
                break;
            }

        if (pFile->procfile==NULL)
            panic("procOpenFile: assert 2\n");

        pFile->procfile->size("cmdline",pFile->procfile);
        strcpy(pFile->content,pFile->procfile->content);
        return pFile;
    }
    else if (strcmp(filename,"stat")==0)
    {
        pfile_t *pFile=kMalloc(sizeof(pfile_t));
        pFile->offset=0;
        pFile->handle=pFile;
        pFile->content=kMalloc(1024);
        pFile->offset=0;
        pFile->fops=&procFOps;
        updateRootDirFiles();
        procdir_t *dir=NULL;
        for (int cnt=0;cnt<PROCFS_DIR_MAXDIRS;cnt++)
            if (strcmp(procRootDir.dirs[cnt].dirname,pathTokens[1])==0)
            {
                dir=&procRootDir.dirs[cnt];
                break;
            }

        if (dir==NULL)
            return NULL;
        
        for (int cnt=0;cnt<PROCFS_DIR_MAXFILES;cnt++)
            if (strcmp(dir->files[cnt].filename,"stat")==0)
            {
                pFile->procfile=&dir->files[cnt];
                break;
            }

        if (pFile->procfile==NULL)
            panic("procOpenFile: assert 4\n");

        pFile->procfile->size("stat",pFile->procfile);
        strcpy(pFile->content,pFile->procfile->content);
        return pFile;    }
}

void procCloseFile(void *file)
{
    pfile_t *pf=file;
    if (pf->handle==file)
    {
        if (pf->content)
            kFree(pf->content);
        if (pf->procfile->content)
            kFree(pf->procfile->content);
        kFree(file);
    }
    else
        panic("procCloseFile: passed file is not a proc file\n");
    return;
}

size_t procReadFile(void *buffer, int size, int length, void *file)
{
    int contentLen=0,available=0;
    int copySize=size*length;
    pfile_t *pf=file;
    
    if (pf->handle!=file)
        panic("procReadFile: passed file is not pfile_t\n");
    
    contentLen=strlen(pf->content);

    if (pf->offset>=contentLen)
        return 0;
    
    available=contentLen-(pf->offset-contentLen);
    if (available)
    {
        copySize=available>size*length?
                size*length:
                    available;

        memset(buffer,0,length*size);
        strncpy(buffer,pf->content+pf->offset,copySize);
        pf->offset+=copySize;
        return copySize+1;
    }
    return 0;
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
    char resolvedPath[128];
    char resolvedFilename[128];
    int taskNum=0;
    char taskNumString[7] = {0,0,0,0,0,0,0};
    uint32_t currentTaskNum=getCurrentTask()->taskNum;
    
    strncpy((char*)lPath,(char*)path,256);
    strtrim(lPath);
    if (strncmp(lPath,"/proc",5)!=0)
        panic("procDirOpen: Opening subdirectories of /proc is not implemented\n");
    
    initPathTokens();
    parsePath(lPath, resolvedPath, resolvedFilename, pathTokens, 20);
    
    pdir_t *pdir=kMalloc(sizeof(pdir_t));
    pdir->handle=pdir;
    pdir->offset=0;
    pdir->dops=&procDOps;
    pdir->returningFileSet=false;
    dir=pdir;
    updateRootDirFiles();
    if (strcmp(lPath,"/proc")==0 || strcmp(lPath,"/proc/")==0)
    {
        pdir->procdir=&procRootDir;
    }
    else 
    {
        int tnsptr=0;
        char temp[10];
        
        if (strcmp(pathTokens[1],"self")==0)
            strcpy(taskNumString,pathTokens[1]);
        else
        {
            strcpy(temp,pathTokens[1]);
            for (int cnt=0;cnt<10;cnt++)
                if (temp[cnt]==0)
                    break;
                else if (temp[cnt]>='0' && temp[cnt]<='9')
                    taskNumString[tnsptr++]=temp[cnt];
            if (strlen(taskNumString)>0)
                taskNum=atoi(taskNumString);
            else
                panic("procDirOpen: Not implemented\n");
        }    
        for (int cnt=0;cnt<PROCFS_DIR_MAXFILES;cnt++)
            if (strcmp(procRootDir.dirs[cnt].dirname,taskNumString)==0)
            {
                pdir->procdir=&procRootDir.dirs[cnt];
                break;
            }
        
    }
    if (!pdir->procdir)
        return 0;
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

    if (!pdir->returningFileSet && pdir->procdir->dirs[pdir->offset].dirname[0]==0)
    {
        pdir->returningFileSet=true;
        pdir->offset=0;
    }
    if (pdir->returningFileSet && pdir->procdir->files[pdir->offset].filename[0]==0)
    {
        return -1;
    }
    
    if (!pdir->returningFileSet)
    {
        strcpy(entry->filename,pdir->procdir->dirs[pdir->offset].dirname);
        entry->is_dir=true;
        entry->size=0;
        pdir->offset++;
    }
    else
    {
        strcpy(entry->filename,pdir->procdir->files[pdir->offset].filename);
        entry->is_dir=false;
        if (pdir->procdir->files[pdir->offset].size)
            entry->size=pdir->procdir->files[pdir->offset].size((char*)&pdir->procdir->files[pdir->offset].filename, &pdir->procdir->files[pdir->offset]);
        else
            entry->size=0;
        pdir->offset++;
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
    
    sprintf(buffer, "SystemMemory=%u\n",kE820MemoryBytes);
    bufptr=buffer+strlen(buffer);
    sprintf(bufptr,"KernelMemory=%u\n",kernelPoolMemorySize);
    bufptr=buffer+strlen(buffer);
    sprintf(bufptr,"HeapMemory=%u\n",kmmHeapMemoryTotal);
    bufptr=buffer+strlen(buffer);
    sprintf(bufptr,"UsedHeap=%u\n",usedHeap);
    bufptr=buffer+strlen(buffer);
    sprintf(bufptr,"AvailableHeap=%u\n",availableHeap);
}

void getInterruptInfo(char *buffer, int buffersize)
{
    char *bufptr=buffer;

    sprintf(buffer, "Interrupts\n");
    bufptr=buffer+strlen(buffer);
    for (int cnt=0;cnt<100;cnt++)
    {
        if (isrCounts[cnt]!=0)
        {
            sprintf(bufptr, "%u=%u\n",cnt,isrCounts[cnt]);
            bufptr=buffer+strlen(buffer);
        }
    }
}

void getCmdline(char *buffer, int buffersize, procfile_t *pf)
{
    int taskNum=0;
    //parent directory name
    if (strcmp(pf->parentDir->dirname,"self")==0)
        taskNum=getCurrentTask()->taskNum;
    else
        taskNum=atoi(pf->parentDir->dirname);
    
    task_t *task=findTaskByTaskNum(taskNum);
    strcpy(buffer,((process_t*)task->process)->exename);
}

void getStat(char *buffer, int buffersize, procfile_t *pf)
{
    process_t *proc;
    char procState=0;
    int taskNum=0;
    if (strcmp(pf->parentDir->dirname,"self")==0)
        taskNum=getCurrentTask()->taskNum;
    else
        taskNum=atoi(pf->parentDir->dirname);

    ASSERTM(taskNum>=32,"getStat: Invalid task number");
    
    task_t *task=findTaskByTaskNum(taskNum);

    ASSERTM(task!=0,"getStat: task is null\n");
    proc=task->process;
    if (!proc)
    {
        printd(DEBUG_PROCESS,"Can't get process for task number 0x%04x\n",taskNum);
    }
    ASSERTM(proc!=0,"getStat: process is null\n");
     int tty=getTTYForPipe((int)proc->stdout);
     switch (task->taskState)
     {
         case TASK_RUNNING:
             procState='R';
             break;
         case TASK_ISLEEP:
             procState='S';
             break;
         case TASK_USLEEP:
             procState='D';
             break;
         case TASK_ZOMBIE:
             procState='Z';
             break;
         case TASK_RUNNABLE:
             procState='W';
             break;
         case TASK_EXITED:
             procState='E';
             break;
         case TASK_STOPPED:
             procState='T';
             break;
         default:
             procState='X';
             break;
     }
     int printPPID=0;
     if (taskNum>kKernelTask->taskNum)
         printPPID=proc->parent->task->taskNum;
     sprintf(buffer,"%d (%s) %c %d %d %d %d %d %u %lu %lu %lu %lu %lu %ld %ld %ld %ld %ld %ld %u %u %u %u",
             taskNum,                       //pid
             proc->exename,                 //comm
             procState,                     //state
             printPPID,                    //ppid
             0,                             //pgrp
             0,                             //session
             tty,                           //tty_nr
             0,                             //tpgid
             0,                             //flags
             proc->minorFaults,             //minflt
             proc->majorFaults,              //majflt
             0,                             //cmajflt
             proc->totalRunTicks,           //utime
             0,                             //stime
             0,                             //cutime
             0,                             //cstime
             proc->priority,                 //priority
             0,                             //nice*
             1,                             //num_threads
             0,                             //itrealvalue
             0,                             //starttime
             (uint32_t)proc->heapEnd-(uint32_t)proc->heapStart>0?(uint32_t)proc->heapEnd-(uint32_t)proc->heapStart:0, //vsize
             calcProcessSize(proc),          //rss
             proc->cSwitches
             );
}