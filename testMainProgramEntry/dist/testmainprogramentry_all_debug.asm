
Debug/cross-Linux/testmainprogramentry:     file format elf32-i386


Disassembly of section .text:

10000000 <main>:
main():
/home/yogi/src/os/testMainProgramEntry/main.c:13
#include "../chrisOS/include/kernelObjects.h"

/*
 * testMainProgramEntry
 */
int main(int argc, char** argv) {
10000000:	55                   	push   ebp
10000001:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/main.c:21
            "push edx\n"        //return esp
            "pushfd\n"     //return flags
            "push ebx\n"        //return CS
            "push esi\n"        //return eip
            "nop\njmpd 0x48:0\n");
*/        __asm__("cld\nint 0x80\n");
10000003:	fc                   	cld    
10000004:	cd 80                	int    0x80
/home/yogi/src/os/testMainProgramEntry/main.c:23
            //xxx
}
10000006:	90                   	nop
10000007:	5d                   	pop    ebp
10000008:	c3                   	ret    
