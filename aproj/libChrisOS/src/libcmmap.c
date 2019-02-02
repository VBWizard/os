/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "libChrisOS.h"
#include "libcmmap.h"
#include "types.h"
//#include "../../../kproj/chrisOSKernel/include/syscalls.h"

syscall_mmap_t params;

VISIBLE void* mmap (void *addr,size_t len,int prot,int flags,int fd,off_t offset)
{
    
    params.addr = addr;
    params.len = len;
    params.prot = prot;
    params.flags = flags;
    params.fd = fd;
    params.offset = offset;
    
    return (void*)do_syscall1(SYSCALL_MMAP, (uint32_t)&params);
}
