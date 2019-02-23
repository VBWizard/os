/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "common.h"
#include "file.h"
#include "malloc.h"
#include "strings.h"
#include "environment.h"

    char *resolvePath_envPath;
    char *resolvePath_inPath;
    char *resolvePath_resPath;
    char *resolvePath_cwd;

int getdirI(char* path, direntry_t *entries, int bufferCount)
{
    return do_syscall3(SYSCALL_GETDENTS, (uint32_t)path, (uint32_t)entries, bufferCount);
    
}
VISIBLE int getdir(char* path, direntry_t *entries, int bufferCount)
{
    return getdirI(path, entries, bufferCount);
}

void* openI(char* path, const char* mode)
{
    //NOTE: Using syscall3 and passing -1 as 3rd parameter, otherwise param3 will be 0 and syscall will think freopen is calling!
    return (void*)do_syscall3(SYSCALL_OPEN, (uint32_t)path, (uint32_t)mode,-1);
}

VISIBLE void* open(char* path, const char* mode)
{
    return openI(path, mode);
}

void file_cleanup()
{
    while (filesToClose)
        closeI(filesToClose++);
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

void closeI(void* handle)
{
    do_syscall1(SYSCALL_CLOSE, (uint32_t)handle);
}

VISIBLE void close(void* handle)
{
    return closeI(handle);
}

int readI(void* handle, void *buffer, int size, int length)
{
    return do_syscall4(SYSCALL_READ, (uint32_t)handle, (uint32_t)buffer, size, length);
}

VISIBLE int read(void* handle, void *buffer, int size, int length)
{
    return readI(handle, buffer, size, length);
}
int writeI(void* handle, void *buffer, int size, int length)
{
    return do_syscall4(SYSCALL_WRITE, (uint32_t)handle, (uint32_t)buffer, size, length);
}

VISIBLE int write(void* handle, void *buffer, int size, int length)
{
    return writeI(handle, buffer, size, length);
}

int seekI(void* handle, long position, int whence)
{
    return do_syscall3(SYSCALL_SEEK, (uint32_t)handle, position, whence);
}

VISIBLE int seek(void* handle, long position, int whence)
{
    return seekI(handle, position, whence);
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
    int retVal=-1;
    fstat_t fstat;
    
    if (!resolvePath_envPath)
        resolvePath_envPath=mallocI(1024);
    if (!resolvePath_cwd)
        resolvePath_cwd=mallocI(1024);
    if (!resolvePath_inPath)
            resolvePath_inPath=mallocI(1024);
    if (!resolvePath_resPath)
        resolvePath_resPath=mallocI(1024);

    //using the PATH variable, attempt to resolve the path to an executable when a path isn't given in the commandline
    
    //If there is a / character in the path, then don't attempt to resolve
    getenvI("PATH",resolvePath_envPath);

    getcwdI(resolvePath_cwd,1024);
    
    if (strstrI(inPath, "/"))
    {
        if (*inPath!='/')
        {
            strcpyI(outPath,resolvePath_cwd);
            strcatI(outPath,"/");
        }
        strcatI(outPath,inPath);
        retVal=0;
    }
    else
    {
        strcpyI(resolvePath_inPath,inPath);
        token=strtokI(resolvePath_envPath,delim);
        while (token!=NULL)
        {
            strcpyI(resolvePath_resPath,token);
            if (strcmpI(resolvePath_resPath,"/")!=0)
                strcatI(resolvePath_resPath,"/");
            strcatI(resolvePath_resPath,inPath);
            int res=statI(resolvePath_resPath,&fstat);
            if (res==0)
            {
                strcpyI(outPath,resolvePath_resPath);
                retVal=0;
                break;
            }
            token=strtokI(NULL,delim);
        }

        if (retVal==-1)
        {
            strcpyI(resolvePath_resPath,resolvePath_cwd);
            strcatI(resolvePath_resPath,"/");
            strcatI(resolvePath_resPath,inPath);
            int res=statI(resolvePath_resPath,&fstat);
            if (res==0)
            {
                strcpyI(outPath,resolvePath_resPath);
                retVal=0;
            }
        }
    }
    
    return retVal;
}

long tellI(void *stream)
{
    return do_syscall1(SYSCALL_TELL,(uint32_t)stream);
}

VISIBLE long tell(void *stream)
{
    return tellI(stream);
}

size_t getlineI(char **lineptr, size_t *n, void *stream)
{
    char *buffer;
    int bytesReturned=0;
    size_t bytesParsed=0;
    char *crPtr=NULL;
    char *lineToOutput=*lineptr;
    size_t lLinePtrLen=*n;
    int startFilePos=tellI(stream);
    int retVal=-1;
    
    buffer=mallocI(GETLINE_BUFFER_SIZE);        
    
    while ((bytesReturned=readI(stream, buffer,GETLINE_BUFFER_SIZE,1))>0)
    {
        if (crPtr==strstrI(buffer,"\n"))
        { 
            if (crPtr-buffer+bytesParsed<*n)
                strncatI(lineToOutput,buffer,crPtr-buffer);
            if (bytesParsed+(crPtr-buffer)>*n)
                reallocI(lineToOutput,bytesParsed+(crPtr-buffer));
            strncatI(lineToOutput,buffer,crPtr-buffer);
            bytesParsed+=(crPtr-buffer);
            seekI(stream, startFilePos+bytesParsed,SEEK_SET);
            *n=lLinePtrLen;
            lineptr=&lineToOutput;
            retVal=bytesParsed;
            goto getlineReturn;
        }
        else
        {
            lLinePtrLen+=bytesReturned;
            bytesParsed+=bytesReturned;
            reallocI(lineToOutput,lLinePtrLen);
            strncatI(lineToOutput,buffer,GETLINE_BUFFER_SIZE);
        }
    }

getlineReturn:    
    freeI(buffer);
    return retVal;
}

VISIBLE size_t getline(char **lineptr, size_t *n, void *stream)
{
    return getlineI(lineptr, n, stream);
}