/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on May 16, 2016, 11:49 AM
 */

#include "../chrisOS/include/kernelObjects.h"

/*
 * testMainProgramEntry
 */
int main(int argc, char** argv) {
    __asm__("pop ebx\nmov eax,0xDEADBEEE\ncli\nhlt\niret\n");
}

