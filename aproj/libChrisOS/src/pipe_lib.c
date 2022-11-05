/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "common.h"
#include "pipe.h"

VISIBLE int pipe(int pipefd[2])
{
    return do_syscall1(SYSCALL_PIPE, (uintptr_t)pipefd);
}

VISIBLE int dup3(int oldfd, int newfd, int flags)
{
    return do_syscall3(SYSCALL_DUP3,oldfd,newfd,flags);
}