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
/*    __asm__("pop ebp\n"
            "push edi\n"          //return SS
            "push edx\n"        //return esp
            "pushfd\n"     //return flags
            "push ebx\n"        //return CS
            "push esi\n"        //return eip
            "nop\njmpd 0x48:0\n");
*/        __asm__("cld\nint 0x80\n");
            //xxx
}
