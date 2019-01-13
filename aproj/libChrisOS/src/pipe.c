/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "libChrisOS.h"
#include "pipe.h"

VISIBLE int pipe(int pipefd[2])
{
    return do_syscall1(SYSCALL_PIPE, (uintptr_t)pipefd);
}