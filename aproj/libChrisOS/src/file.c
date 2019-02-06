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
    return (void*)do_syscall2(SYSCALL_OPEN, (uint32_t)path, (uint32_t)mode);
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
