/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "libChrisOS.h"
#include "file.h"

VISIBLE int getdir(char* path, char *buffer, int buflen)
{
    return do_syscall3(SYSCALL_GETDENTS, (uint32_t)path, (uint32_t)buffer, buflen);
}

VISIBLE void* open(char* path, const char* mode)
{
    //NOTE: Using syscall3 and passing -1 as 3rd parameter, otherwise param3 will be 0 and syscall will think freopen is calling!
    return (void*)do_syscall3(SYSCALL_OPEN, (uint32_t)path, (uint32_t)mode,-1);
}

void file_cleanup()
{
    while (filesToClose)
        close(filesToClose++);
    freeI(filesToClose);
}

VISIBLE void* freopen(char* path, const char* mode, void *stream)
{
    void *retVal=0;
    retVal = (void*)do_syscall3(SYSCALL_OPEN, (uint32_t)path, (uint32_t)mode, (uint32_t)stream);
    if (retVal==NULL)
        return (void*)-1;
    if (filesToClose==NULL)
    {
        filesToClose=mallocI(sizeof(uintptr_t)*25);
    }
    filesToClose[filesToCloseCount++]=(uintptr_t)retVal;
    return retVal;
}

VISIBLE void close(void* handle)
{
    do_syscall1(SYSCALL_CLOSE, (uint32_t)handle);
}

VISIBLE int read(void* handle, void *buffer, int size, int length)
{
    return do_syscall4(SYSCALL_READ, (uint32_t)handle, (uint32_t)buffer, size, length);
}

int writeI(void* handle, void *buffer, int size, int length)
{
    return do_syscall4(SYSCALL_WRITE, (uint32_t)handle, (uint32_t)buffer, size, length);
}

VISIBLE int write(void* handle, void *buffer, int size, int length)
{
    return writeI(handle, buffer, size, length);
}

VISIBLE int seek(void* handle, long position, int whence)
{
    return do_syscall3(SYSCALL_SEEK, (uint32_t)handle, position, whence);
}

int statI(char *path, fstat_t *stat)
{
    return do_syscall2(SYSCALL_STAT, (uint32_t)path, (uint32_t)stat);
}

VISIBLE int stat(char *path, fstat_t *stat)
{
    return statI(path, stat);
}

VISIBLE int resolvePath(const char *inPath, char *outPath)
{
    char delim[2]=":";
    char *token;
    char *envPath=NULL;
    char *lInPath=NULL;
    char *resPath=NULL;
    char *cwd;
    int retVal=-1;
    fstat_t fstat;
    
    //using the PATH variable, attempt to resolve the path to an executable when a path isn't given in the commandline
    
    //If there is a / character in the path, then don't attempt to resolve
    envPath=mallocI(1024);
    getenvI("PATH",envPath);

    cwd=mallocI(1024);
    getcwdI(cwd,1024);
    
    if (strstrI(inPath, "/"))
    {
        if (*inPath!='/')
        {
            strcpy(outPath,cwd);
        }
        strcatI(outPath,inPath);
        retVal=0;
    }
    else
    {
        lInPath=mallocI(1024);
        strcpyI(lInPath,inPath);

        resPath=mallocI(1024);

        token=strtokI(envPath,delim);
        while (token!=NULL)
        {
            strcpyI(resPath,token);
            strcatI(resPath,"/");
            strcatI(resPath,inPath);
            int res=statI(resPath,&fstat);
            if (res==0)
            {
                strcpyI(outPath,resPath);
                retVal=0;
                break;
            }
            token=strtokI(NULL,delim);
        }

        if (retVal==-1)
        {
            strcpyI(resPath,cwd);
            strcatI(resPath,"/");
            strcatI(resPath,inPath);
            int res=statI(resPath,&fstat);
            if (res==0)
            {
                strcpyI(outPath,resPath);
                retVal=0;
            }
        }
    }
    
    if (lInPath)
        freeI(lInPath);
    if (envPath)
        freeI(envPath);
    if (resPath)
        freeI(resPath);
    if (cwd)
        freeI(cwd);
    return retVal;
}