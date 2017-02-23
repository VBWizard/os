
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
/home/yogi/src/os/testMainProgramEntry/main.c:14
    __asm__("pop ebx\nmov eax,0xDEADBEEE\ncli\nhlt\niret\n");
10000003:	5b                   	pop    ebx
10000004:	b8 ee be ad de       	mov    eax,0xdeadbeee
10000009:	fa                   	cli    
1000000a:	f4                   	hlt    
1000000b:	cf                   	iret   
/home/yogi/src/os/testMainProgramEntry/main.c:15
}
1000000c:	90                   	nop
1000000d:	5d                   	pop    ebp
1000000e:	c3                   	ret    
