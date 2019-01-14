/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "libChrisOS.h"

VISIBLE void* open(char* path, const char* mode)
{
    return (void*)do_syscall2(SYSCALL_OPEN, (uint32_t)path, (uint32_t)mode);
}

VISIBLE void close(void* handle)
{
    do_syscall1(SYSCALL_CLOSE, (uint32_t)handle);
}

VISIBLE int read(void* handle, void *buffer, int size, int length)
{
    return do_syscall4(SYSCALL_READ, (uint32_t)handle, (uint32_t)buffer, size, length);
}

VISIBLE int write(void* handle, void *buffer, int size, int length)
{
    return do_syscall4(SYSCALL_WRITE, (uint32_t)handle, (uint32_t)buffer, size, length);
}


VISIBLE int getdir(char* path, char *buffer, int bufferCount)
{
    return do_syscall3(SYSCALL_GETDENTS, (uint32_t)path, (uint32_t)buffer, bufferCount);
}
