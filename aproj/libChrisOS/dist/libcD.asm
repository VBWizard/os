
Debug/cross-Linux/libc.so:     file format elf32-i386


Disassembly of section .text:

30000000 <strchr>:
strchr():
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:9
 * and open the template in the editor.
 */
#include "strings.h"

VISIBLE char *strchr(const char *s, int c)
{
30000000:	55                   	push   ebp
30000001:	89 e5                	mov    ebp,esp
30000003:	e8 5e 1f 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000008:	05 50 33 00 00       	add    eax,0x3350
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:10
    while (*s != (char)c)
3000000d:	eb 17                	jmp    30000026 <strchr+0x26>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:11
        if (!*s++)
3000000f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000012:	8d 50 01             	lea    edx,[eax+0x1]
30000015:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
30000018:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000001b:	84 c0                	test   al,al
3000001d:	75 07                	jne    30000026 <strchr+0x26>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:12
            return 0;
3000001f:	b8 00 00 00 00       	mov    eax,0x0
30000024:	eb 10                	jmp    30000036 <strchr+0x36>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:10
 */
#include "strings.h"

VISIBLE char *strchr(const char *s, int c)
{
    while (*s != (char)c)
30000026:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000029:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000002c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
3000002f:	38 d0                	cmp    al,dl
30000031:	75 dc                	jne    3000000f <strchr+0xf>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:13
        if (!*s++)
            return 0;
    return (char *)s;
30000033:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:14
}
30000036:	5d                   	pop    ebp
30000037:	c3                   	ret    

30000038 <strchrI>:
strchrI():
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:17

char *strchrI(const char *s, int c)
{
30000038:	55                   	push   ebp
30000039:	89 e5                	mov    ebp,esp
3000003b:	e8 26 1f 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000040:	05 18 33 00 00       	add    eax,0x3318
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:18
    while (*s != (char)c)
30000045:	eb 17                	jmp    3000005e <strchrI+0x26>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:19
        if (!*s++)
30000047:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000004a:	8d 50 01             	lea    edx,[eax+0x1]
3000004d:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
30000050:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000053:	84 c0                	test   al,al
30000055:	75 07                	jne    3000005e <strchrI+0x26>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:20
            return 0;
30000057:	b8 00 00 00 00       	mov    eax,0x0
3000005c:	eb 10                	jmp    3000006e <strchrI+0x36>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:18
    return (char *)s;
}

char *strchrI(const char *s, int c)
{
    while (*s != (char)c)
3000005e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000061:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000064:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000067:	38 d0                	cmp    al,dl
30000069:	75 dc                	jne    30000047 <strchrI+0xf>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:21
        if (!*s++)
            return 0;
    return (char *)s;
3000006b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strchr.c:22
}
3000006e:	5d                   	pop    ebp
3000006f:	c3                   	ret    

30000070 <strcspn>:
strcspn():
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:38
 */

#include "strings.h"

VISIBLE int strcspn(char* string, char* chars)
{
30000070:	55                   	push   ebp
30000071:	89 e5                	mov    ebp,esp
30000073:	56                   	push   esi
30000074:	53                   	push   ebx
30000075:	e8 ec 1e 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
3000007a:	05 de 32 00 00       	add    eax,0x32de
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:41
    register char c, *p, *s;

    for (s = string, c = *s; c != 0; s++, c = *s) {
3000007f:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
30000082:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
30000085:	89 c1                	mov    ecx,eax
30000087:	eb 29                	jmp    300000b2 <strcspn+0x42>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:42
	for (p = chars; *p != 0; p++) {
30000089:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
3000008c:	eb 15                	jmp    300000a3 <strcspn+0x33>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:43
	    if (c == *p) {
3000008e:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30000091:	38 c8                	cmp    al,cl
30000093:	75 0b                	jne    300000a0 <strcspn+0x30>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:44
		return s-string;
30000095:	89 da                	mov    edx,ebx
30000097:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000009a:	29 c2                	sub    edx,eax
3000009c:	89 d0                	mov    eax,edx
3000009e:	eb 21                	jmp    300000c1 <strcspn+0x51>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:42 (discriminator 2)
VISIBLE int strcspn(char* string, char* chars)
{
    register char c, *p, *s;

    for (s = string, c = *s; c != 0; s++, c = *s) {
	for (p = chars; *p != 0; p++) {
300000a0:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:42 (discriminator 1)
300000a3:	0f b6 06             	movzx  eax,BYTE PTR [esi]
300000a6:	84 c0                	test   al,al
300000a8:	75 e4                	jne    3000008e <strcspn+0x1e>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:41 (discriminator 2)

VISIBLE int strcspn(char* string, char* chars)
{
    register char c, *p, *s;

    for (s = string, c = *s; c != 0; s++, c = *s) {
300000aa:	83 c3 01             	add    ebx,0x1
300000ad:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
300000b0:	89 c1                	mov    ecx,eax
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:41 (discriminator 1)
300000b2:	89 c8                	mov    eax,ecx
300000b4:	84 c0                	test   al,al
300000b6:	75 d1                	jne    30000089 <strcspn+0x19>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:48
	    if (c == *p) {
		return s-string;
	    }
	}
    }
    return s-string;
300000b8:	89 da                	mov    edx,ebx
300000ba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300000bd:	29 c2                	sub    edx,eax
300000bf:	89 d0                	mov    eax,edx
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:49
}
300000c1:	5b                   	pop    ebx
300000c2:	5e                   	pop    esi
300000c3:	5d                   	pop    ebp
300000c4:	c3                   	ret    

300000c5 <strcspnI>:
strcspnI():
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:52

int strcspnI(char* string, char* chars)
{
300000c5:	55                   	push   ebp
300000c6:	89 e5                	mov    ebp,esp
300000c8:	56                   	push   esi
300000c9:	53                   	push   ebx
300000ca:	e8 97 1e 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
300000cf:	05 89 32 00 00       	add    eax,0x3289
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:55
    register char c, *p, *s;

    for (s = string, c = *s; c != 0; s++, c = *s) {
300000d4:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
300000d7:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
300000da:	89 c1                	mov    ecx,eax
300000dc:	eb 29                	jmp    30000107 <strcspnI+0x42>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:56
	for (p = chars; *p != 0; p++) {
300000de:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
300000e1:	eb 15                	jmp    300000f8 <strcspnI+0x33>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:57
	    if (c == *p) {
300000e3:	0f b6 06             	movzx  eax,BYTE PTR [esi]
300000e6:	38 c8                	cmp    al,cl
300000e8:	75 0b                	jne    300000f5 <strcspnI+0x30>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:58
		return s-string;
300000ea:	89 da                	mov    edx,ebx
300000ec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300000ef:	29 c2                	sub    edx,eax
300000f1:	89 d0                	mov    eax,edx
300000f3:	eb 21                	jmp    30000116 <strcspnI+0x51>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:56 (discriminator 2)
int strcspnI(char* string, char* chars)
{
    register char c, *p, *s;

    for (s = string, c = *s; c != 0; s++, c = *s) {
	for (p = chars; *p != 0; p++) {
300000f5:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:56 (discriminator 1)
300000f8:	0f b6 06             	movzx  eax,BYTE PTR [esi]
300000fb:	84 c0                	test   al,al
300000fd:	75 e4                	jne    300000e3 <strcspnI+0x1e>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:55 (discriminator 2)

int strcspnI(char* string, char* chars)
{
    register char c, *p, *s;

    for (s = string, c = *s; c != 0; s++, c = *s) {
300000ff:	83 c3 01             	add    ebx,0x1
30000102:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
30000105:	89 c1                	mov    ecx,eax
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:55 (discriminator 1)
30000107:	89 c8                	mov    eax,ecx
30000109:	84 c0                	test   al,al
3000010b:	75 d1                	jne    300000de <strcspnI+0x19>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:62
	    if (c == *p) {
		return s-string;
	    }
	}
    }
    return s-string;
3000010d:	89 da                	mov    edx,ebx
3000010f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000112:	29 c2                	sub    edx,eax
30000114:	89 d0                	mov    eax,edx
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strcspn.c:63
}
30000116:	5b                   	pop    ebx
30000117:	5e                   	pop    esi
30000118:	5d                   	pop    ebp
30000119:	c3                   	ret    
3000011a:	66 90                	xchg   ax,ax

3000011c <strtok>:
strtok():
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:41
#include "strings.h"
int strcspnI(char* string, char* chars);
char *strchrI(const char *s, int c);

VISIBLE char * strtok(char* s, /*const*/ char* delim)
{
3000011c:	55                   	push   ebp
3000011d:	89 e5                	mov    ebp,esp
3000011f:	56                   	push   esi
30000120:	53                   	push   ebx
30000121:	e8 9a 1e 00 00       	call   30001fc0 <__x86.get_pc_thunk.bx>
30000126:	81 c3 32 32 00 00    	add    ebx,0x3232
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:45
    static char *lasts;
    register int ch;

    if (s == 0)
3000012c:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
30000130:	75 09                	jne    3000013b <strtok+0x1f>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:46
	s = lasts;
30000132:	8b 83 e8 00 00 00    	mov    eax,DWORD PTR [ebx+0xe8]
30000138:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:48
    do {
	if ((ch = *s++) == '\0')
3000013b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000013e:	8d 50 01             	lea    edx,[eax+0x1]
30000141:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
30000144:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000147:	0f be f0             	movsx  esi,al
3000014a:	85 f6                	test   esi,esi
3000014c:	75 07                	jne    30000155 <strtok+0x39>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:49
	    return 0;
3000014e:	b8 00 00 00 00       	mov    eax,0x0
30000153:	eb 57                	jmp    300001ac <strtok+0x90>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:50
    } while (strchrI(delim, ch));
30000155:	83 ec 08             	sub    esp,0x8
30000158:	56                   	push   esi
30000159:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
3000015c:	e8 d7 fe ff ff       	call   30000038 <strchrI>
30000161:	83 c4 10             	add    esp,0x10
30000164:	85 c0                	test   eax,eax
30000166:	75 d3                	jne    3000013b <strtok+0x1f>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:51
    --s;
30000168:	83 6d 08 01          	sub    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:52
    lasts = s + strcspnI(s, delim);
3000016c:	83 ec 08             	sub    esp,0x8
3000016f:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000172:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000175:	e8 4b ff ff ff       	call   300000c5 <strcspnI>
3000017a:	83 c4 10             	add    esp,0x10
3000017d:	89 c2                	mov    edx,eax
3000017f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000182:	01 d0                	add    eax,edx
30000184:	89 83 e8 00 00 00    	mov    DWORD PTR [ebx+0xe8],eax
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:53
    if (*lasts != 0)
3000018a:	8b 83 e8 00 00 00    	mov    eax,DWORD PTR [ebx+0xe8]
30000190:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000193:	84 c0                	test   al,al
30000195:	74 12                	je     300001a9 <strtok+0x8d>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:54
	*lasts++ = 0;
30000197:	8b 83 e8 00 00 00    	mov    eax,DWORD PTR [ebx+0xe8]
3000019d:	8d 50 01             	lea    edx,[eax+0x1]
300001a0:	89 93 e8 00 00 00    	mov    DWORD PTR [ebx+0xe8],edx
300001a6:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:55
    return s;
300001a9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:56
}
300001ac:	8d 65 f8             	lea    esp,[ebp-0x8]
300001af:	5b                   	pop    ebx
300001b0:	5e                   	pop    esi
300001b1:	5d                   	pop    ebp
300001b2:	c3                   	ret    
300001b3:	90                   	nop

300001b4 <puts>:
puts():
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:16
#define PUTSTRING(c) {asm("call sysEnter_Vector\n"::"a" (SYSCALL_WRITE), "b" (STDOUT_FILE), "c" (c));}

extern int printI(const char *format, ...);

VISIBLE void puts(char* buffer)
{
300001b4:	55                   	push   ebp
300001b5:	89 e5                	mov    ebp,esp
300001b7:	53                   	push   ebx
300001b8:	e8 a9 1d 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
300001bd:	05 9b 31 00 00       	add    eax,0x319b
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:17
    PUTSTRING(buffer)
300001c2:	b8 04 00 00 00       	mov    eax,0x4
300001c7:	bb 01 00 00 00       	mov    ebx,0x1
300001cc:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
300001cf:	89 d1                	mov    ecx,edx
300001d1:	e8 fc ff ff ff       	call   300001d2 <puts+0x1e>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:18
}
300001d6:	90                   	nop
300001d7:	5b                   	pop    ebx
300001d8:	5d                   	pop    ebp
300001d9:	c3                   	ret    

300001da <putc>:
putc():
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:21

VISIBLE void putc(char c)
{
300001da:	55                   	push   ebp
300001db:	89 e5                	mov    ebp,esp
300001dd:	53                   	push   ebx
300001de:	83 ec 14             	sub    esp,0x14
300001e1:	e8 80 1d 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
300001e6:	05 72 31 00 00       	add    eax,0x3172
300001eb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300001ee:	88 45 e8             	mov    BYTE PTR [ebp-0x18],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:22
    char buffer[2]={0};
300001f1:	66 c7 45 fa 00 00    	mov    WORD PTR [ebp-0x6],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:24
    
    buffer[0]=c;
300001f7:	0f b6 45 e8          	movzx  eax,BYTE PTR [ebp-0x18]
300001fb:	88 45 fa             	mov    BYTE PTR [ebp-0x6],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:25
    buffer[1]=0;
300001fe:	c6 45 fb 00          	mov    BYTE PTR [ebp-0x5],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:26
    PUTSTRING(&buffer);
30000202:	b8 04 00 00 00       	mov    eax,0x4
30000207:	bb 01 00 00 00       	mov    ebx,0x1
3000020c:	8d 55 fa             	lea    edx,[ebp-0x6]
3000020f:	89 d1                	mov    ecx,edx
30000211:	e8 fc ff ff ff       	call   30000212 <putc+0x38>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:27
}
30000216:	90                   	nop
30000217:	83 c4 14             	add    esp,0x14
3000021a:	5b                   	pop    ebx
3000021b:	5d                   	pop    ebp
3000021c:	c3                   	ret    

3000021d <getc>:
getc():
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:30

VISIBLE char getc()
{
3000021d:	55                   	push   ebp
3000021e:	89 e5                	mov    ebp,esp
30000220:	53                   	push   ebx
30000221:	83 ec 10             	sub    esp,0x10
30000224:	e8 3d 1d 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000229:	05 2f 31 00 00       	add    eax,0x312f
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:32
    char c;
    READCHAR(c)
3000022e:	b8 03 00 00 00       	mov    eax,0x3
30000233:	ba 00 00 00 00       	mov    edx,0x0
30000238:	89 d3                	mov    ebx,edx
3000023a:	e8 fc ff ff ff       	call   3000023b <getc+0x1e>
3000023f:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:33
    return c;
30000242:	0f b6 45 fb          	movzx  eax,BYTE PTR [ebp-0x5]
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:34
}
30000246:	83 c4 10             	add    esp,0x10
30000249:	5b                   	pop    ebx
3000024a:	5d                   	pop    ebp
3000024b:	c3                   	ret    

3000024c <gets>:
gets():
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:37

VISIBLE int gets(char* buffer, int maxlen, int stream)
{
3000024c:	55                   	push   ebp
3000024d:	89 e5                	mov    ebp,esp
3000024f:	53                   	push   ebx
30000250:	83 ec 14             	sub    esp,0x14
30000253:	e8 0e 1d 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000258:	05 00 31 00 00       	add    eax,0x3100
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:39
    char inchar;
    int len=0;
3000025d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:40
    char lbuf[2]={0,0};
30000264:	c6 45 f1 00          	mov    BYTE PTR [ebp-0xf],0x0
30000268:	c6 45 f2 00          	mov    BYTE PTR [ebp-0xe],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:42
    
    if (stream!=1)
3000026c:	83 7d 10 01          	cmp    DWORD PTR [ebp+0x10],0x1
30000270:	74 19                	je     3000028b <gets+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:44
    {
        printI("Stream %u not implemented\n",stream);
30000272:	83 ec 08             	sub    esp,0x8
30000275:	ff 75 10             	push   DWORD PTR [ebp+0x10]
30000278:	8d 90 48 fa ff ff    	lea    edx,[eax-0x5b8]
3000027e:	52                   	push   edx
3000027f:	89 c3                	mov    ebx,eax
30000281:	e8 12 02 00 00       	call   30000498 <printI>
30000286:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:45 (discriminator 1)
        getsError: goto getsError;
30000289:	eb fe                	jmp    30000289 <gets+0x3d>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:50
    }
    
    while (1==1)
    {
        READCHAR(inchar)
3000028b:	b8 03 00 00 00       	mov    eax,0x3
30000290:	ba 00 00 00 00       	mov    edx,0x0
30000295:	89 d3                	mov    ebx,edx
30000297:	e8 fc ff ff ff       	call   30000298 <gets+0x4c>
3000029c:	88 45 f3             	mov    BYTE PTR [ebp-0xd],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:51
        if (inchar=='\b' && len>0)
3000029f:	80 7d f3 08          	cmp    BYTE PTR [ebp-0xd],0x8
300002a3:	75 17                	jne    300002bc <gets+0x70>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:51 (discriminator 1)
300002a5:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
300002a9:	7e 11                	jle    300002bc <gets+0x70>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:53
        {
            buffer[len]=0;
300002ab:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
300002ae:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300002b1:	01 d0                	add    eax,edx
300002b3:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:54
            len--;
300002b6:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
300002ba:	eb 57                	jmp    30000313 <gets+0xc7>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:56
        }
        else if (inchar!=0)
300002bc:	80 7d f3 00          	cmp    BYTE PTR [ebp-0xd],0x0
300002c0:	74 47                	je     30000309 <gets+0xbd>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:58
        {
            lbuf[0]=inchar;
300002c2:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
300002c6:	88 45 f1             	mov    BYTE PTR [ebp-0xf],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:59
            PUTSTRING(&lbuf);
300002c9:	b8 04 00 00 00       	mov    eax,0x4
300002ce:	bb 01 00 00 00       	mov    ebx,0x1
300002d3:	8d 55 f1             	lea    edx,[ebp-0xf]
300002d6:	89 d1                	mov    ecx,edx
300002d8:	e8 fc ff ff ff       	call   300002d9 <gets+0x8d>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:60
            buffer[len++]=inchar;
300002dd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300002e0:	8d 50 01             	lea    edx,[eax+0x1]
300002e3:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
300002e6:	89 c2                	mov    edx,eax
300002e8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300002eb:	01 c2                	add    edx,eax
300002ed:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
300002f1:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:62
            //Note: Written this way so that gets an be used as a getc which waits for the key
            if ((len+1>=maxlen) || (inchar==0x0a)) //-1 because we need to leave the terminator (0x0) at the end of the string
300002f3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300002f6:	83 c0 01             	add    eax,0x1
300002f9:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
300002fc:	7d 06                	jge    30000304 <gets+0xb8>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:62 (discriminator 1)
300002fe:	80 7d f3 0a          	cmp    BYTE PTR [ebp-0xd],0xa
30000302:	75 87                	jne    3000028b <gets+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:64
            
                return len;
30000304:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000307:	eb 0f                	jmp    30000318 <gets+0xcc>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:67
        }
        else
            asm("call sysEnter_Vector\n"::"a" (0x302)); //hlt
30000309:	b8 02 03 00 00       	mov    eax,0x302
3000030e:	e8 fc ff ff ff       	call   3000030f <gets+0xc3>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:69 (discriminator 2)

    }
30000313:	e9 73 ff ff ff       	jmp    3000028b <gets+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:70
}
30000318:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
3000031b:	c9                   	leave  
3000031c:	c3                   	ret    
3000031d:	66 90                	xchg   ax,ax
3000031f:	90                   	nop

30000320 <do_syscall4>:
do_syscall4():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:16

extern void sysEnter_Vector();
int a=123;int b=456; int c=789;

int do_syscall4(int callnum, uint32_t param1, uint32_t param2, uint32_t param3)
{
30000320:	55                   	push   ebp
30000321:	89 e5                	mov    ebp,esp
30000323:	53                   	push   ebx
30000324:	83 ec 10             	sub    esp,0x10
30000327:	e8 3a 1c 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
3000032c:	05 2c 30 00 00       	add    eax,0x302c
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:17
    int retVal=0;
30000331:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:18
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum), "b" (param1), "c" (param2), "d" (param3));
30000338:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000033b:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
3000033e:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30000341:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
30000344:	e8 fc ff ff ff       	call   30000345 <do_syscall4+0x25>
30000349:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:19
    return retVal;
3000034c:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:20
}
3000034f:	83 c4 10             	add    esp,0x10
30000352:	5b                   	pop    ebx
30000353:	5d                   	pop    ebp
30000354:	c3                   	ret    

30000355 <do_syscall3>:
do_syscall3():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:23

int do_syscall3(int callnum, uint32_t param1, uint32_t param2)
{
30000355:	55                   	push   ebp
30000356:	89 e5                	mov    ebp,esp
30000358:	53                   	push   ebx
30000359:	83 ec 10             	sub    esp,0x10
3000035c:	e8 05 1c 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000361:	05 f7 2f 00 00       	add    eax,0x2ff7
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:24
    int retVal=0;
30000366:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:25
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum), "b" (param1), "c" (param2));
3000036d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000370:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000373:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30000376:	89 d3                	mov    ebx,edx
30000378:	e8 fc ff ff ff       	call   30000379 <do_syscall3+0x24>
3000037d:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:26
    return retVal;
30000380:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:27
}
30000383:	83 c4 10             	add    esp,0x10
30000386:	5b                   	pop    ebx
30000387:	5d                   	pop    ebp
30000388:	c3                   	ret    

30000389 <do_syscall2>:
do_syscall2():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:30

int do_syscall2(int callnum, uint32_t param1)
{
30000389:	55                   	push   ebp
3000038a:	89 e5                	mov    ebp,esp
3000038c:	53                   	push   ebx
3000038d:	83 ec 10             	sub    esp,0x10
30000390:	e8 d1 1b 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000395:	05 c3 2f 00 00       	add    eax,0x2fc3
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:31
    int retVal=0;
3000039a:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:32
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum), "b" (param1));
300003a1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300003a4:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
300003a7:	89 d3                	mov    ebx,edx
300003a9:	e8 fc ff ff ff       	call   300003aa <do_syscall2+0x21>
300003ae:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:33
    return retVal;
300003b1:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:34
}
300003b4:	83 c4 10             	add    esp,0x10
300003b7:	5b                   	pop    ebx
300003b8:	5d                   	pop    ebp
300003b9:	c3                   	ret    

300003ba <do_syscall1>:
do_syscall1():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:37

int do_syscall1(int callnum)
{
300003ba:	55                   	push   ebp
300003bb:	89 e5                	mov    ebp,esp
300003bd:	83 ec 10             	sub    esp,0x10
300003c0:	e8 a1 1b 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
300003c5:	05 93 2f 00 00       	add    eax,0x2f93
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:38
    int retVal=0;
300003ca:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:39
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum));
300003d1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300003d4:	e8 fc ff ff ff       	call   300003d5 <do_syscall1+0x1b>
300003d9:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:40
    return retVal;
300003dc:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:41
}
300003df:	c9                   	leave  
300003e0:	c3                   	ret    

300003e1 <libc_init>:
libc_init():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:44

VISIBLE void libc_init(void)
{
300003e1:	55                   	push   ebp
300003e2:	89 e5                	mov    ebp,esp
300003e4:	53                   	push   ebx
300003e5:	83 ec 04             	sub    esp,0x4
300003e8:	e8 d3 1b 00 00       	call   30001fc0 <__x86.get_pc_thunk.bx>
300003ed:	81 c3 6b 2f 00 00    	add    ebx,0x2f6b
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:45
    printdI(DEBUG_LIBC,"***Initializing libc\n***");
300003f3:	83 ec 08             	sub    esp,0x8
300003f6:	8d 83 63 fa ff ff    	lea    eax,[ebx-0x59d]
300003fc:	50                   	push   eax
300003fd:	68 00 00 00 02       	push   0x2000000
30000402:	e8 c5 00 00 00       	call   300004cc <printdI>
30000407:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:46
    initmalloc();
3000040a:	e8 1d 02 00 00       	call   3000062c <initmalloc>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:47
    libcTZ=-4;
3000040f:	8b 83 fc ff ff ff    	mov    eax,DWORD PTR [ebx-0x4]
30000415:	c7 00 fc ff ff ff    	mov    DWORD PTR [eax],0xfffffffc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:48
    do_syscall1(SYSCALL_INVALID);
3000041b:	83 ec 0c             	sub    esp,0xc
3000041e:	6a 00                	push   0x0
30000420:	e8 95 ff ff ff       	call   300003ba <do_syscall1>
30000425:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:49
    do_syscall2(SYSCALL_REGEXITHANDLER,(uint32_t)&libc_cleanup);
30000428:	8d 83 ed d0 ff ff    	lea    eax,[ebx-0x2f13]
3000042e:	83 ec 08             	sub    esp,0x8
30000431:	50                   	push   eax
30000432:	68 63 01 00 00       	push   0x163
30000437:	e8 4d ff ff ff       	call   30000389 <do_syscall2>
3000043c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:50
}
3000043f:	90                   	nop
30000440:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000443:	c9                   	leave  
30000444:	c3                   	ret    

30000445 <libc_cleanup>:
libc_cleanup():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:53

void libc_cleanup(void)
{
30000445:	55                   	push   ebp
30000446:	89 e5                	mov    ebp,esp
30000448:	53                   	push   ebx
30000449:	83 ec 04             	sub    esp,0x4
3000044c:	e8 15 1b 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000451:	05 07 2f 00 00       	add    eax,0x2f07
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:54
    malloc_cleanup();
30000456:	89 c3                	mov    ebx,eax
30000458:	e8 9a 04 00 00       	call   300008f7 <malloc_cleanup>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:55
}
3000045d:	90                   	nop
3000045e:	83 c4 04             	add    esp,0x4
30000461:	5b                   	pop    ebx
30000462:	5d                   	pop    ebp
30000463:	c3                   	ret    

30000464 <print>:
print():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:58

VISIBLE int print(const char *format, ...)
{
30000464:	55                   	push   ebp
30000465:	89 e5                	mov    ebp,esp
30000467:	83 ec 10             	sub    esp,0x10
3000046a:	e8 f7 1a 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
3000046f:	05 e9 2e 00 00       	add    eax,0x2ee9
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:60
    va_list args;
    va_start( args, format );
30000474:	8d 45 0c             	lea    eax,[ebp+0xc]
30000477:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:61
    do_syscall3(SYSCALL_PRINT,(uint32_t)format,(uint32_t)args);
3000047a:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
3000047d:	89 c2                	mov    edx,eax
3000047f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000482:	52                   	push   edx
30000483:	50                   	push   eax
30000484:	68 00 03 00 00       	push   0x300
30000489:	e8 c7 fe ff ff       	call   30000355 <do_syscall3>
3000048e:	83 c4 0c             	add    esp,0xc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:62
    return 0;
30000491:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:63
}
30000496:	c9                   	leave  
30000497:	c3                   	ret    

30000498 <printI>:
printI():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:66

int printI(const char *format, ...)
{
30000498:	55                   	push   ebp
30000499:	89 e5                	mov    ebp,esp
3000049b:	83 ec 10             	sub    esp,0x10
3000049e:	e8 c3 1a 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
300004a3:	05 b5 2e 00 00       	add    eax,0x2eb5
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:68
    va_list args;
    va_start( args, format );
300004a8:	8d 45 0c             	lea    eax,[ebp+0xc]
300004ab:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:69
    do_syscall3(SYSCALL_PRINT,(uint32_t)format,(uint32_t)args);
300004ae:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300004b1:	89 c2                	mov    edx,eax
300004b3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300004b6:	52                   	push   edx
300004b7:	50                   	push   eax
300004b8:	68 00 03 00 00       	push   0x300
300004bd:	e8 93 fe ff ff       	call   30000355 <do_syscall3>
300004c2:	83 c4 0c             	add    esp,0xc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:70
    return 0;
300004c5:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:71
}
300004ca:	c9                   	leave  
300004cb:	c3                   	ret    

300004cc <printdI>:
printdI():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:74

int printdI(uint32_t DebugLevel, const char *format, ...)
{
300004cc:	55                   	push   ebp
300004cd:	89 e5                	mov    ebp,esp
300004cf:	53                   	push   ebx
300004d0:	83 ec 10             	sub    esp,0x10
300004d3:	e8 8e 1a 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
300004d8:	05 80 2e 00 00       	add    eax,0x2e80
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:76
    va_list args;
    va_start( args, format );
300004dd:	8d 45 10             	lea    eax,[ebp+0x10]
300004e0:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:77
    asm("mov eax,0x301\ncall sysEnter_Vector\n"::"b" (DebugLevel), "c" (format), "d" (args));
300004e3:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
300004e6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300004e9:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
300004ec:	89 c3                	mov    ebx,eax
300004ee:	b8 01 03 00 00       	mov    eax,0x301
300004f3:	e8 fc ff ff ff       	call   300004f4 <printdI+0x28>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:78
    return 0;
300004f8:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:79
}
300004fd:	83 c4 10             	add    esp,0x10
30000500:	5b                   	pop    ebx
30000501:	5d                   	pop    ebp
30000502:	c3                   	ret    

30000503 <sleep>:
sleep():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:82

VISIBLE unsigned int sleep (unsigned int __seconds)
{
30000503:	55                   	push   ebp
30000504:	89 e5                	mov    ebp,esp
30000506:	53                   	push   ebx
30000507:	83 ec 10             	sub    esp,0x10
3000050a:	e8 57 1a 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
3000050f:	05 49 2e 00 00       	add    eax,0x2e49
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:83
    SLEEP_SECONDS(__seconds)
30000514:	b8 70 01 00 00       	mov    eax,0x170
30000519:	e8 fc ff ff ff       	call   3000051a <sleep+0x17>
3000051e:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
30000521:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000524:	6b d0 64             	imul   edx,eax,0x64
30000527:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
3000052a:	01 d0                	add    eax,edx
3000052c:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
3000052f:	b8 66 01 00 00       	mov    eax,0x166
30000534:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
30000537:	b9 00 00 00 00       	mov    ecx,0x0
3000053c:	ba 00 00 00 00       	mov    edx,0x0
30000541:	e8 fc ff ff ff       	call   30000542 <sleep+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:84
    return 0;
30000546:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:85
}
3000054b:	83 c4 10             	add    esp,0x10
3000054e:	5b                   	pop    ebx
3000054f:	5d                   	pop    ebp
30000550:	c3                   	ret    

30000551 <stop>:
stop():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:88

void stop()
{
30000551:	55                   	push   ebp
30000552:	89 e5                	mov    ebp,esp
30000554:	e8 0d 1a 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000559:	05 ff 2d 00 00       	add    eax,0x2dff
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:89
    do_syscall1(SYSCALL_STOP);
3000055e:	68 68 01 00 00       	push   0x168
30000563:	e8 52 fe ff ff       	call   300003ba <do_syscall1>
30000568:	83 c4 04             	add    esp,0x4
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:90
}
3000056b:	90                   	nop
3000056c:	c9                   	leave  
3000056d:	c3                   	ret    

3000056e <modifySignal>:
modifySignal():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:93

void modifySignal(int signal, void* sigHandler, int sigData)
{
3000056e:	55                   	push   ebp
3000056f:	89 e5                	mov    ebp,esp
30000571:	e8 f0 19 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000576:	05 e2 2d 00 00       	add    eax,0x2de2
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:94
    do_syscall4(SYSCALL_SETSIGACTION,signal,(uint32_t)sigHandler,sigData);
3000057b:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
3000057e:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000581:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000584:	51                   	push   ecx
30000585:	52                   	push   edx
30000586:	50                   	push   eax
30000587:	68 67 01 00 00       	push   0x167
3000058c:	e8 8f fd ff ff       	call   30000320 <do_syscall4>
30000591:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:95
}
30000594:	90                   	nop
30000595:	c9                   	leave  
30000596:	c3                   	ret    

30000597 <exec>:
exec():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:98

VISIBLE int exec(char* path, int argc, char** argv)
{
30000597:	55                   	push   ebp
30000598:	89 e5                	mov    ebp,esp
3000059a:	53                   	push   ebx
3000059b:	83 ec 10             	sub    esp,0x10
3000059e:	e8 c3 19 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
300005a3:	05 b5 2d 00 00       	add    eax,0x2db5
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:99
    int pid=0;
300005a8:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:102
    //Using the syscall is breaking the stack
//    SYSCALL4(SYSCALL_EXEC,path,argc,argv);
    __asm__("int 0x80\n"
300005af:	b8 59 00 00 00       	mov    eax,0x59
300005b4:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
300005b7:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
300005ba:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
300005bd:	cd 80                	int    0x80
300005bf:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:105
            :"=a" (pid)
            :"a" (0x59),"b" (path),"c" (argc),"d" (argv));
    return pid;
300005c2:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:106
}
300005c5:	83 c4 10             	add    esp,0x10
300005c8:	5b                   	pop    ebx
300005c9:	5d                   	pop    ebp
300005ca:	c3                   	ret    

300005cb <waitpid>:
waitpid():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:109

VISIBLE void waitpid(uint32_t pid)
{
300005cb:	55                   	push   ebp
300005cc:	89 e5                	mov    ebp,esp
300005ce:	e8 93 19 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
300005d3:	05 85 2d 00 00       	add    eax,0x2d85
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:110
    do_syscall2(SYSCALL_WAITFORPID,pid);
300005d8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
300005db:	6a 61                	push   0x61
300005dd:	e8 a7 fd ff ff       	call   30000389 <do_syscall2>
300005e2:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:111
}
300005e5:	90                   	nop
300005e6:	c9                   	leave  
300005e7:	c3                   	ret    

300005e8 <gettime>:
gettime():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:114

VISIBLE struct tm* gettime()
{
300005e8:	55                   	push   ebp
300005e9:	89 e5                	mov    ebp,esp
300005eb:	53                   	push   ebx
300005ec:	83 ec 34             	sub    esp,0x34
300005ef:	e8 cc 19 00 00       	call   30001fc0 <__x86.get_pc_thunk.bx>
300005f4:	81 c3 64 2d 00 00    	add    ebx,0x2d64
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:115
    uint32_t ticks=0;
300005fa:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:117
    struct tm theTime;
    do_syscall2(SYSCALL_GETTICKS,ticks);
30000601:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000604:	50                   	push   eax
30000605:	68 70 01 00 00       	push   0x170
3000060a:	e8 7a fd ff ff       	call   30000389 <do_syscall2>
3000060f:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:118
    return gmtime_r((time_t*)&ticks,&theTime);
30000612:	83 ec 08             	sub    esp,0x8
30000615:	8d 45 c8             	lea    eax,[ebp-0x38]
30000618:	50                   	push   eax
30000619:	8d 45 f4             	lea    eax,[ebp-0xc]
3000061c:	50                   	push   eax
3000061d:	e8 7e 19 00 00       	call   30001fa0 <__x86.get_pc_thunk.ax+0x3a>
30000622:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:119
}
30000625:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000628:	c9                   	leave  
30000629:	c3                   	ret    
3000062a:	66 90                	xchg   ax,ax

3000062c <initmalloc>:
initmalloc():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:13
#include "libChrisOS.h"

#define HEAP_NEXT(s,t) {t=s+s->len+sizeof(heaprec_t);}
#define HEAP_CURR(s,t) {t=((heaprec_t*)s)-1;}
void initmalloc()
{
3000062c:	55                   	push   ebp
3000062d:	89 e5                	mov    ebp,esp
3000062f:	e8 32 19 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000634:	05 24 2d 00 00       	add    eax,0x2d24
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:14
    heapBase=0;
30000639:	8b 90 f4 ff ff ff    	mov    edx,DWORD PTR [eax-0xc]
3000063f:	c7 02 00 00 00 00    	mov    DWORD PTR [edx],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:15
    heapCurr=0;
30000645:	8b 90 f8 ff ff ff    	mov    edx,DWORD PTR [eax-0x8]
3000064b:	c7 02 00 00 00 00    	mov    DWORD PTR [edx],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:16
    heapEnd=0;
30000651:	8b 80 f0 ff ff ff    	mov    eax,DWORD PTR [eax-0x10]
30000657:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:17
}
3000065d:	90                   	nop
3000065e:	5d                   	pop    ebp
3000065f:	c3                   	ret    

30000660 <newHeapRequiredToFulfillRequest>:
newHeapRequiredToFulfillRequest():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:20

uint32_t newHeapRequiredToFulfillRequest(size_t size)
{
30000660:	55                   	push   ebp
30000661:	89 e5                	mov    ebp,esp
30000663:	83 ec 10             	sub    esp,0x10
30000666:	e8 fb 18 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
3000066b:	05 ed 2c 00 00       	add    eax,0x2ced
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:21
    uint32_t newSize=size+sizeof(heaprec_t);
30000670:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30000673:	83 c2 10             	add    edx,0x10
30000676:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:23
    //printDebug(DEBUG_MALLOC,"size=0x%08X, heapEnd=0x%08X, heapCurr=0x%08X\n",newSize, heapEnd, heapCurr);
    if (heapCurr+newSize > heapEnd)
30000679:	8b 90 f8 ff ff ff    	mov    edx,DWORD PTR [eax-0x8]
3000067f:	8b 0a                	mov    ecx,DWORD PTR [edx]
30000681:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000684:	01 d1                	add    ecx,edx
30000686:	8b 90 f0 ff ff ff    	mov    edx,DWORD PTR [eax-0x10]
3000068c:	8b 12                	mov    edx,DWORD PTR [edx]
3000068e:	39 d1                	cmp    ecx,edx
30000690:	76 43                	jbe    300006d5 <newHeapRequiredToFulfillRequest+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:26
    {
        //printDebug(DEBUG_MALLOC,"Heap requested 0x%08X, heap available 0x%08X\n",newSize, heapEnd-heapCurr);
        newSize =(heapEnd-heapCurr);
30000692:	8b 90 f0 ff ff ff    	mov    edx,DWORD PTR [eax-0x10]
30000698:	8b 12                	mov    edx,DWORD PTR [edx]
3000069a:	8b 80 f8 ff ff ff    	mov    eax,DWORD PTR [eax-0x8]
300006a0:	8b 00                	mov    eax,DWORD PTR [eax]
300006a2:	29 c2                	sub    edx,eax
300006a4:	89 d0                	mov    eax,edx
300006a6:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:27
        if (newSize== 0 || newSize%PAGE_SIZE)
300006a9:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
300006ad:	74 0c                	je     300006bb <newHeapRequiredToFulfillRequest+0x5b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:27 (discriminator 1)
300006af:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300006b2:	25 ff 0f 00 00       	and    eax,0xfff
300006b7:	85 c0                	test   eax,eax
300006b9:	74 10                	je     300006cb <newHeapRequiredToFulfillRequest+0x6b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:29
       {
           newSize+=(PAGE_SIZE-(newSize % PAGE_SIZE));
300006bb:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300006be:	25 00 f0 ff ff       	and    eax,0xfffff000
300006c3:	05 00 10 00 00       	add    eax,0x1000
300006c8:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:32
           //printDebug(DEBUG_MALLOC,"libcnewHeapRequiredToFulfillRequest: Size adjusted from %u to %u\n",size,newSize);
       }
        return newSize+ALLOC_REQUEST_SIZE;
300006cb:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300006ce:	05 00 20 03 00       	add    eax,0x32000
300006d3:	eb 05                	jmp    300006da <newHeapRequiredToFulfillRequest+0x7a>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:35
    }
    else
        return 0;
300006d5:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:36
}
300006da:	c9                   	leave  
300006db:	c3                   	ret    

300006dc <malloc>:
malloc():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:39

VISIBLE void*  malloc(size_t size)
{
300006dc:	55                   	push   ebp
300006dd:	89 e5                	mov    ebp,esp
300006df:	56                   	push   esi
300006e0:	53                   	push   ebx
300006e1:	83 ec 20             	sub    esp,0x20
300006e4:	e8 db 18 00 00       	call   30001fc4 <__x86.get_pc_thunk.si>
300006e9:	81 c6 6f 2c 00 00    	add    esi,0x2c6f
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:45
    void* retVal;

    uint32_t needed;
    uint32_t allocatedPtr;
    heaprec_t* heapPtr, *heapPtrNext;
    printdI(DEBUG_MALLOC,"malloc(0x%08X)\n",size);
300006ef:	83 ec 04             	sub    esp,0x4
300006f2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
300006f5:	8d 86 7c fa ff ff    	lea    eax,[esi-0x584]
300006fb:	50                   	push   eax
300006fc:	68 00 00 00 01       	push   0x1000000
30000701:	89 f3                	mov    ebx,esi
30000703:	e8 c4 fd ff ff       	call   300004cc <printdI>
30000708:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:46
    needed = newHeapRequiredToFulfillRequest(size);
3000070b:	83 ec 0c             	sub    esp,0xc
3000070e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000711:	e8 4a ff ff ff       	call   30000660 <newHeapRequiredToFulfillRequest>
30000716:	83 c4 10             	add    esp,0x10
30000719:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:47
    printdI(DEBUG_MALLOC,"libc_malloc: needed=0x%08X\n",needed);
3000071c:	83 ec 04             	sub    esp,0x4
3000071f:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
30000722:	8d 86 8c fa ff ff    	lea    eax,[esi-0x574]
30000728:	50                   	push   eax
30000729:	68 00 00 00 01       	push   0x1000000
3000072e:	89 f3                	mov    ebx,esi
30000730:	e8 97 fd ff ff       	call   300004cc <printdI>
30000735:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:48
    if (needed!=0)      //No new heap required
30000738:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
3000073c:	0f 84 b0 00 00 00    	je     300007f2 <malloc+0x116>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:50
    {
        asm("mov eax,0x165\ncall sysEnter_Vector\n":"=a" (allocatedPtr):"b" (needed));
30000742:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000745:	89 c3                	mov    ebx,eax
30000747:	b8 65 01 00 00       	mov    eax,0x165
3000074c:	e8 fc ff ff ff       	call   3000074d <malloc+0x71>
30000751:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:52
        //This is needed to keep in sync with what the kernel thinks
        printdI(DEBUG_MALLOC,"libc_malloc: heaEnd=0x%08X\n",heapEnd);
30000754:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
3000075a:	8b 00                	mov    eax,DWORD PTR [eax]
3000075c:	83 ec 04             	sub    esp,0x4
3000075f:	50                   	push   eax
30000760:	8d 86 a8 fa ff ff    	lea    eax,[esi-0x558]
30000766:	50                   	push   eax
30000767:	68 00 00 00 01       	push   0x1000000
3000076c:	89 f3                	mov    ebx,esi
3000076e:	e8 59 fd ff ff       	call   300004cc <printdI>
30000773:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:53
        heapEnd=allocatedPtr+needed;
30000776:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
30000779:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000077c:	01 c2                	add    edx,eax
3000077e:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
30000784:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:54
        printdI(DEBUG_MALLOC,"libc_malloc: Req 0x%08X bytes, ret was 0x%08X, heapEnd=0x%08X\n",needed,allocatedPtr,heapEnd);
30000786:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
3000078c:	8b 00                	mov    eax,DWORD PTR [eax]
3000078e:	83 ec 0c             	sub    esp,0xc
30000791:	50                   	push   eax
30000792:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
30000795:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
30000798:	8d 86 c4 fa ff ff    	lea    eax,[esi-0x53c]
3000079e:	50                   	push   eax
3000079f:	68 00 00 00 01       	push   0x1000000
300007a4:	89 f3                	mov    ebx,esi
300007a6:	e8 21 fd ff ff       	call   300004cc <printdI>
300007ab:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:55
        if (heapBase==0)    //Hasn't been initialized yet!
300007ae:	8b 86 f4 ff ff ff    	mov    eax,DWORD PTR [esi-0xc]
300007b4:	8b 00                	mov    eax,DWORD PTR [eax]
300007b6:	85 c0                	test   eax,eax
300007b8:	75 38                	jne    300007f2 <malloc+0x116>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:57
        {
            heapCurr=allocatedPtr;
300007ba:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300007c0:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
300007c3:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:58
            heapBase=allocatedPtr;
300007c5:	8b 86 f4 ff ff ff    	mov    eax,DWORD PTR [esi-0xc]
300007cb:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
300007ce:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:59
            printdI(DEBUG_MALLOC,"libc_malloc: Initialized heapCurr and heapBase to 0x%08X\n",heapCurr);
300007d0:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300007d6:	8b 00                	mov    eax,DWORD PTR [eax]
300007d8:	83 ec 04             	sub    esp,0x4
300007db:	50                   	push   eax
300007dc:	8d 86 04 fb ff ff    	lea    eax,[esi-0x4fc]
300007e2:	50                   	push   eax
300007e3:	68 00 00 00 01       	push   0x1000000
300007e8:	89 f3                	mov    ebx,esi
300007ea:	e8 dd fc ff ff       	call   300004cc <printdI>
300007ef:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:62
        }
    }
    printdI(DEBUG_MALLOC,"libc_malloc:creating heap rec @ 0x%08X\n",heapCurr);
300007f2:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300007f8:	8b 00                	mov    eax,DWORD PTR [eax]
300007fa:	83 ec 04             	sub    esp,0x4
300007fd:	50                   	push   eax
300007fe:	8d 86 40 fb ff ff    	lea    eax,[esi-0x4c0]
30000804:	50                   	push   eax
30000805:	68 00 00 00 01       	push   0x1000000
3000080a:	89 f3                	mov    ebx,esi
3000080c:	e8 bb fc ff ff       	call   300004cc <printdI>
30000811:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:63
    heapPtr = (heaprec_t*)heapCurr;
30000814:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
3000081a:	8b 00                	mov    eax,DWORD PTR [eax]
3000081c:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:64
    heapPtr->marker=ALLOC_MARKER_VALUE;
3000081f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000822:	c7 00 d0 00 0f b0    	mov    DWORD PTR [eax],0xb00f00d0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:65
    heapPtr->len=size;
30000828:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
3000082b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
3000082e:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:66
    heapPtr->inUse=true;
30000831:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000834:	c6 40 08 01          	mov    BYTE PTR [eax+0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:67
    printdI(DEBUG_MALLOC,"libc_malloc: heapCurr=0x%08X, sizeof(heaprec_t)=0x%08X\n",heapCurr,sizeof(heaprec_t));
30000838:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
3000083e:	8b 00                	mov    eax,DWORD PTR [eax]
30000840:	6a 10                	push   0x10
30000842:	50                   	push   eax
30000843:	8d 86 68 fb ff ff    	lea    eax,[esi-0x498]
30000849:	50                   	push   eax
3000084a:	68 00 00 00 01       	push   0x1000000
3000084f:	89 f3                	mov    ebx,esi
30000851:	e8 76 fc ff ff       	call   300004cc <printdI>
30000856:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:68
    retVal=(void*)(heapCurr+sizeof(heaprec_t));
30000859:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
3000085f:	8b 00                	mov    eax,DWORD PTR [eax]
30000861:	83 c0 10             	add    eax,0x10
30000864:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:69
    HEAP_NEXT(heapPtr,heapPtrNext);
30000867:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
3000086a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
3000086d:	83 c0 10             	add    eax,0x10
30000870:	c1 e0 04             	shl    eax,0x4
30000873:	89 c2                	mov    edx,eax
30000875:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000878:	01 d0                	add    eax,edx
3000087a:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:70
    heapPtrNext=heapPtr+heapPtr->len+sizeof(heaprec_t);
3000087d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000880:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30000883:	83 c0 10             	add    eax,0x10
30000886:	c1 e0 04             	shl    eax,0x4
30000889:	89 c2                	mov    edx,eax
3000088b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
3000088e:	01 d0                	add    eax,edx
30000890:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:71
    heapPtrNext->prev=heapPtr;
30000893:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
30000896:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000899:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:72
    heapCurr+=size+(sizeof(heaprec_t));
3000089c:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300008a2:	8b 10                	mov    edx,DWORD PTR [eax]
300008a4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300008a7:	01 d0                	add    eax,edx
300008a9:	8d 50 10             	lea    edx,[eax+0x10]
300008ac:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300008b2:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:74
    //printDebug(DEBUG_MALLOC,"\n");
    return retVal;
300008b4:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:75
}
300008b7:	8d 65 f8             	lea    esp,[ebp-0x8]
300008ba:	5b                   	pop    ebx
300008bb:	5e                   	pop    esi
300008bc:	5d                   	pop    ebp
300008bd:	c3                   	ret    

300008be <free>:
free():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:78

VISIBLE void free(void* fpointer)
{
300008be:	55                   	push   ebp
300008bf:	89 e5                	mov    ebp,esp
300008c1:	83 ec 10             	sub    esp,0x10
300008c4:	e8 9d 16 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
300008c9:	05 8f 2a 00 00       	add    eax,0x2a8f
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:81
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if (fpointer==NULL)
300008ce:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
300008d2:	74 20                	je     300008f4 <free+0x36>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:83
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
    HEAP_CURR(fpointer,mp);
300008d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300008d7:	83 e8 10             	sub    eax,0x10
300008da:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:86
    
    //printDebug(DEBUG_MALLOC,"libc_free: Freeing heap @ fp=0x%08X (mp=0x%08X)\n",fpointer,mp);
    if (mp->marker!=ALLOC_MARKER_VALUE)
300008dd:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300008e0:	8b 00                	mov    eax,DWORD PTR [eax]
300008e2:	3d d0 00 0f b0       	cmp    eax,0xb00f00d0
300008e7:	74 02                	je     300008eb <free+0x2d>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:90 (discriminator 2)
    {
        //print("malloc: marker not found error!!!\n");
gotoHere:
        goto gotoHere;
300008e9:	eb fe                	jmp    300008e9 <free+0x2b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:92
    }
    mp->inUse=false;
300008eb:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300008ee:	c6 40 08 00          	mov    BYTE PTR [eax+0x8],0x0
300008f2:	eb 01                	jmp    300008f5 <free+0x37>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:82
VISIBLE void free(void* fpointer)
{
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if (fpointer==NULL)
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
300008f4:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:93
        //print("malloc: marker not found error!!!\n");
gotoHere:
        goto gotoHere;
    }
    mp->inUse=false;
}
300008f5:	c9                   	leave  
300008f6:	c3                   	ret    

300008f7 <malloc_cleanup>:
malloc_cleanup():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:96

void malloc_cleanup()
{
300008f7:	55                   	push   ebp
300008f8:	89 e5                	mov    ebp,esp
300008fa:	53                   	push   ebx
300008fb:	e8 66 16 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000900:	05 58 2a 00 00       	add    eax,0x2a58
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:97
    asm("mov eax,0x164\ncall sysEnter_Vector\n"::"b" (heapBase));
30000905:	8b 80 f4 ff ff ff    	mov    eax,DWORD PTR [eax-0xc]
3000090b:	8b 00                	mov    eax,DWORD PTR [eax]
3000090d:	89 c3                	mov    ebx,eax
3000090f:	b8 64 01 00 00       	mov    eax,0x164
30000914:	e8 fc ff ff ff       	call   30000915 <malloc_cleanup+0x1e>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:98
30000919:	90                   	nop
3000091a:	5b                   	pop    ebx
3000091b:	5d                   	pop    ebp
3000091c:	c3                   	ret    
3000091d:	66 90                	xchg   ax,ax
3000091f:	90                   	nop

30000920 <memcpy>:
memcpy():
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:11
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
VISIBLE void * memcpy(void *dest, const void *src, size_t n)
{
30000920:	55                   	push   ebp
30000921:	89 e5                	mov    ebp,esp
30000923:	83 ec 20             	sub    esp,0x20
30000926:	e8 3b 16 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
3000092b:	05 2d 2a 00 00       	add    eax,0x2a2d
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:14
    bool dw,dd;
    
    dd=n%4==0;
30000930:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000933:	83 e0 03             	and    eax,0x3
30000936:	85 c0                	test   eax,eax
30000938:	0f 94 c0             	sete   al
3000093b:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:15
    dw=n%2==0;
3000093e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000941:	83 e0 01             	and    eax,0x1
30000944:	85 c0                	test   eax,eax
30000946:	0f 94 c0             	sete   al
30000949:	88 45 e6             	mov    BYTE PTR [ebp-0x1a],al
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:16
    if (dd)
3000094c:	80 7d e7 00          	cmp    BYTE PTR [ebp-0x19],0x0
30000950:	74 7d                	je     300009cf <memcpy+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:18
    {
        n /=4;
30000952:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000955:	c1 e8 02             	shr    eax,0x2
30000958:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:19
        const uint32_t *f = src;
3000095b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000095e:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:20
        uint32_t *t = dest;
30000961:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000964:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:22

        if (f < t) {
30000967:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
3000096a:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
3000096d:	73 4b                	jae    300009ba <memcpy+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:23
                f += n;
3000096f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000972:	c1 e0 02             	shl    eax,0x2
30000975:	01 45 fc             	add    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:24
                t += n;
30000978:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
3000097b:	c1 e0 02             	shl    eax,0x2
3000097e:	01 45 f8             	add    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:25
                while ( (n)-- > 0)
30000981:	eb 12                	jmp    30000995 <memcpy+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:26
                        *--t = *--f;
30000983:	83 6d f8 04          	sub    DWORD PTR [ebp-0x8],0x4
30000987:	83 6d fc 04          	sub    DWORD PTR [ebp-0x4],0x4
3000098b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
3000098e:	8b 10                	mov    edx,DWORD PTR [eax]
30000990:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000993:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:25
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
30000995:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000998:	8d 50 ff             	lea    edx,[eax-0x1]
3000099b:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
3000099e:	85 c0                	test   eax,eax
300009a0:	75 e1                	jne    30000983 <memcpy+0x63>
300009a2:	eb 23                	jmp    300009c7 <memcpy+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:29
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
300009a4:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
300009a7:	8d 50 04             	lea    edx,[eax+0x4]
300009aa:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
300009ad:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
300009b0:	8d 4a 04             	lea    ecx,[edx+0x4]
300009b3:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
300009b6:	8b 12                	mov    edx,DWORD PTR [edx]
300009b8:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:28
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
300009ba:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300009bd:	8d 50 ff             	lea    edx,[eax-0x1]
300009c0:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
300009c3:	85 c0                	test   eax,eax
300009c5:	75 dd                	jne    300009a4 <memcpy+0x84>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:30
                        *t++ = *f++;
        return dest;
300009c7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300009ca:	e9 ea 00 00 00       	jmp    30000ab9 <memcpy+0x199>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:32
    }
    else if (dw)
300009cf:	80 7d e6 00          	cmp    BYTE PTR [ebp-0x1a],0x0
300009d3:	74 79                	je     30000a4e <memcpy+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:34
    {
        n /=2;
300009d5:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300009d8:	d1 e8                	shr    eax,1
300009da:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:35
        const uint32_t *f = src;
300009dd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300009e0:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:36
        uint32_t *t = dest;
300009e3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300009e6:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:38

        if (f < t) {
300009e9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300009ec:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
300009ef:	73 4b                	jae    30000a3c <memcpy+0x11c>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:39
                f += n;
300009f1:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300009f4:	c1 e0 02             	shl    eax,0x2
300009f7:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:40
                t += n;
300009fa:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300009fd:	c1 e0 02             	shl    eax,0x2
30000a00:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:41
                while ( (n)-- > 0)
30000a03:	eb 12                	jmp    30000a17 <memcpy+0xf7>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:42
                        *--t = *--f;
30000a05:	83 6d f0 04          	sub    DWORD PTR [ebp-0x10],0x4
30000a09:	83 6d f4 04          	sub    DWORD PTR [ebp-0xc],0x4
30000a0d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000a10:	8b 10                	mov    edx,DWORD PTR [eax]
30000a12:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000a15:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:41
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
30000a17:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a1a:	8d 50 ff             	lea    edx,[eax-0x1]
30000a1d:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000a20:	85 c0                	test   eax,eax
30000a22:	75 e1                	jne    30000a05 <memcpy+0xe5>
30000a24:	eb 23                	jmp    30000a49 <memcpy+0x129>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:45
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
30000a26:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000a29:	8d 50 04             	lea    edx,[eax+0x4]
30000a2c:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
30000a2f:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
30000a32:	8d 4a 04             	lea    ecx,[edx+0x4]
30000a35:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
30000a38:	8b 12                	mov    edx,DWORD PTR [edx]
30000a3a:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:44
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
30000a3c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a3f:	8d 50 ff             	lea    edx,[eax-0x1]
30000a42:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000a45:	85 c0                	test   eax,eax
30000a47:	75 dd                	jne    30000a26 <memcpy+0x106>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:46
                        *t++ = *f++;
        return dest;
30000a49:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000a4c:	eb 6b                	jmp    30000ab9 <memcpy+0x199>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:50
    }
    else
    {
        const char *f = src;
30000a4e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000a51:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:51
        char *t = dest;
30000a54:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000a57:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:53

        if (f < t) {
30000a5a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a5d:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
30000a60:	73 47                	jae    30000aa9 <memcpy+0x189>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:54
                f += n;
30000a62:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a65:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:55
                t += n;
30000a68:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a6b:	01 45 e8             	add    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:56
                while (n-- > 0)
30000a6e:	eb 13                	jmp    30000a83 <memcpy+0x163>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:57
                        *--t = *--f;
30000a70:	83 6d e8 01          	sub    DWORD PTR [ebp-0x18],0x1
30000a74:	83 6d ec 01          	sub    DWORD PTR [ebp-0x14],0x1
30000a78:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a7b:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30000a7e:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30000a81:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:56
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
30000a83:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a86:	8d 50 ff             	lea    edx,[eax-0x1]
30000a89:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000a8c:	85 c0                	test   eax,eax
30000a8e:	75 e0                	jne    30000a70 <memcpy+0x150>
30000a90:	eb 24                	jmp    30000ab6 <memcpy+0x196>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:60
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
30000a92:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30000a95:	8d 50 01             	lea    edx,[eax+0x1]
30000a98:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
30000a9b:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000a9e:	8d 4a 01             	lea    ecx,[edx+0x1]
30000aa1:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
30000aa4:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000aa7:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:59
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
30000aa9:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000aac:	8d 50 ff             	lea    edx,[eax-0x1]
30000aaf:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000ab2:	85 c0                	test   eax,eax
30000ab4:	75 dc                	jne    30000a92 <memcpy+0x172>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:61
                        *t++ = *f++;
        return dest;
30000ab6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:63
    }
}
30000ab9:	c9                   	leave  
30000aba:	c3                   	ret    
30000abb:	90                   	nop

30000abc <memset>:
memset():
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:9
 * and open the template in the editor.
 */
#include "libChrisOS.h"

VISIBLE void *memset(void *d1, int val, size_t len)
{
30000abc:	55                   	push   ebp
30000abd:	89 e5                	mov    ebp,esp
30000abf:	83 ec 20             	sub    esp,0x20
30000ac2:	e8 9f 14 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000ac7:	05 91 28 00 00       	add    eax,0x2891
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:10
    uint8_t *d = d1;
30000acc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000acf:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:11
    uint16_t*e = d1;
30000ad2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000ad5:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:12
    uint16_t eVal=(val << 16) | (val << 8) | val;
30000ad8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000adb:	c1 e0 10             	shl    eax,0x10
30000ade:	89 c2                	mov    edx,eax
30000ae0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000ae3:	c1 e0 08             	shl    eax,0x8
30000ae6:	09 c2                	or     edx,eax
30000ae8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000aeb:	09 d0                	or     eax,edx
30000aed:	66 89 45 f2          	mov    WORD PTR [ebp-0xe],ax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:13
    uint32_t*f = d1;
30000af1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000af4:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:14
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
30000af7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000afa:	c1 e0 18             	shl    eax,0x18
30000afd:	89 c2                	mov    edx,eax
30000aff:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000b02:	c1 e0 10             	shl    eax,0x10
30000b05:	09 c2                	or     edx,eax
30000b07:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000b0a:	c1 e0 08             	shl    eax,0x8
30000b0d:	09 d0                	or     eax,edx
30000b0f:	0b 45 0c             	or     eax,DWORD PTR [ebp+0xc]
30000b12:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:16
    
    if ((len%4)==0)
30000b15:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b18:	83 e0 03             	and    eax,0x3
30000b1b:	85 c0                	test   eax,eax
30000b1d:	75 1c                	jne    30000b3b <memset+0x7f>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:17
    while (len-=4) {
30000b1f:	eb 0e                	jmp    30000b2f <memset+0x73>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:18
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
30000b21:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000b24:	8d 50 04             	lea    edx,[eax+0x4]
30000b27:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000b2a:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000b2d:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:17
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
30000b2f:	83 6d 10 04          	sub    DWORD PTR [ebp+0x10],0x4
30000b33:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000b37:	75 e8                	jne    30000b21 <memset+0x65>
30000b39:	eb 43                	jmp    30000b7e <memset+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:20
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
30000b3b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b3e:	83 e0 01             	and    eax,0x1
30000b41:	85 c0                	test   eax,eax
30000b43:	75 2c                	jne    30000b71 <memset+0xb5>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:21
    while (len-=2) {
30000b45:	eb 10                	jmp    30000b57 <memset+0x9b>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:22
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
30000b47:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000b4a:	8d 50 02             	lea    edx,[eax+0x2]
30000b4d:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
30000b50:	0f b7 55 f2          	movzx  edx,WORD PTR [ebp-0xe]
30000b54:	66 89 10             	mov    WORD PTR [eax],dx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:21
    if ((len%4)==0)
    while (len-=4) {
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
    while (len-=2) {
30000b57:	83 6d 10 02          	sub    DWORD PTR [ebp+0x10],0x2
30000b5b:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000b5f:	75 e6                	jne    30000b47 <memset+0x8b>
30000b61:	eb 1b                	jmp    30000b7e <memset+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:26
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
        *d++ = val;
30000b63:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000b66:	8d 50 01             	lea    edx,[eax+0x1]
30000b69:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000b6c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000b6f:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:25
    else if (((len%2)==0))
    while (len-=2) {
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
30000b71:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b74:	8d 50 ff             	lea    edx,[eax-0x1]
30000b77:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000b7a:	85 c0                	test   eax,eax
30000b7c:	75 e5                	jne    30000b63 <memset+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:28
        *d++ = val;
    }
    return d1;
30000b7e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:29
30000b81:	c9                   	leave  
30000b82:	c3                   	ret    
30000b83:	90                   	nop

30000b84 <readConsole>:
readConsole():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:16
file_operations_t fops;
inode_t console_node={.i_dev=1,.i_mode=0};
file_t console_file;

size_t readConsole (struct file * fptr, char *buffer, size_t size, uint64_t* whatever) 
{
30000b84:	55                   	push   ebp
30000b85:	89 e5                	mov    ebp,esp
30000b87:	53                   	push   ebx
30000b88:	83 ec 04             	sub    esp,0x4
30000b8b:	e8 d6 13 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000b90:	05 c8 27 00 00       	add    eax,0x27c8
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:17
    return gets(buffer,size,1);
30000b95:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
30000b98:	83 ec 04             	sub    esp,0x4
30000b9b:	6a 01                	push   0x1
30000b9d:	52                   	push   edx
30000b9e:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000ba1:	89 c3                	mov    ebx,eax
30000ba3:	e8 e8 13 00 00       	call   30001f90 <__x86.get_pc_thunk.ax+0x2a>
30000ba8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:18
}
30000bab:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000bae:	c9                   	leave  
30000baf:	c3                   	ret    

30000bb0 <writeConsole>:
writeConsole():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:21

size_t writeConsole(struct file * fptr, const char *buffer, size_t size, uint64_t *whatever)
{
30000bb0:	55                   	push   ebp
30000bb1:	89 e5                	mov    ebp,esp
30000bb3:	53                   	push   ebx
30000bb4:	83 ec 04             	sub    esp,0x4
30000bb7:	e8 aa 13 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000bbc:	05 9c 27 00 00       	add    eax,0x279c
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:22
    return printI(buffer);
30000bc1:	83 ec 0c             	sub    esp,0xc
30000bc4:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000bc7:	89 c3                	mov    ebx,eax
30000bc9:	e8 ca f8 ff ff       	call   30000498 <printI>
30000bce:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:23
}
30000bd1:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000bd4:	c9                   	leave  
30000bd5:	c3                   	ret    

30000bd6 <ioInit>:
ioInit():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:26

void ioInit()
{
30000bd6:	55                   	push   ebp
30000bd7:	89 e5                	mov    ebp,esp
30000bd9:	e8 88 13 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000bde:	05 7a 27 00 00       	add    eax,0x277a
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:27
    console_file.f_inode=&console_node;
30000be3:	8b 90 ec ff ff ff    	mov    edx,DWORD PTR [eax-0x14]
30000be9:	8d 88 28 ff ff ff    	lea    ecx,[eax-0xd8]
30000bef:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:28
    fops.read=readConsole;
30000bf2:	8b 90 e8 ff ff ff    	mov    edx,DWORD PTR [eax-0x18]
30000bf8:	8d 88 2c d8 ff ff    	lea    ecx,[eax-0x27d4]
30000bfe:	89 0a                	mov    DWORD PTR [edx],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:29
    fops.write=writeConsole;
30000c00:	8b 90 e8 ff ff ff    	mov    edx,DWORD PTR [eax-0x18]
30000c06:	8d 88 58 d8 ff ff    	lea    ecx,[eax-0x27a8]
30000c0c:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:30
    console_file.fops=fops;
30000c0f:	8b 88 ec ff ff ff    	mov    ecx,DWORD PTR [eax-0x14]
30000c15:	8b 80 e8 ff ff ff    	mov    eax,DWORD PTR [eax-0x18]
30000c1b:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
30000c1e:	8b 00                	mov    eax,DWORD PTR [eax]
30000c20:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
30000c23:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:31
30000c26:	90                   	nop
30000c27:	5d                   	pop    ebp
30000c28:	c3                   	ret    
30000c29:	66 90                	xchg   ax,ax
30000c2b:	90                   	nop

30000c2c <strcat>:
strcat():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:30
   #endif
   
   /* Append SRC on the end of DEST.  */
   __attribute__((visibility("default"))) char *
   STRCAT (char *dest, const char *src)
   {
30000c2c:	55                   	push   ebp
30000c2d:	89 e5                	mov    ebp,esp
30000c2f:	53                   	push   ebx
30000c30:	83 ec 04             	sub    esp,0x4
30000c33:	e8 88 13 00 00       	call   30001fc0 <__x86.get_pc_thunk.bx>
30000c38:	81 c3 20 27 00 00    	add    ebx,0x2720
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:31
     strcpy (dest + strlen (dest), src);
30000c3e:	83 ec 0c             	sub    esp,0xc
30000c41:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000c44:	e8 67 13 00 00       	call   30001fb0 <__x86.get_pc_thunk.ax+0x4a>
30000c49:	83 c4 10             	add    esp,0x10
30000c4c:	89 c2                	mov    edx,eax
30000c4e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000c51:	01 d0                	add    eax,edx
30000c53:	83 ec 08             	sub    esp,0x8
30000c56:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000c59:	50                   	push   eax
30000c5a:	e8 21 13 00 00       	call   30001f80 <__x86.get_pc_thunk.ax+0x1a>
30000c5f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:32
     return dest;
30000c62:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:33
   }
30000c65:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000c68:	c9                   	leave  
30000c69:	c3                   	ret    

30000c6a <concatenate>:
concatenate():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:35

   void concatenate(char p[], char q[]) {
30000c6a:	55                   	push   ebp
30000c6b:	89 e5                	mov    ebp,esp
30000c6d:	83 ec 10             	sub    esp,0x10
30000c70:	e8 f1 12 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000c75:	05 e3 26 00 00       	add    eax,0x26e3
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:38
   int c, d;
 
   c = 0;
30000c7a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:40
 
   while (p[c] != '\0') {
30000c81:	eb 04                	jmp    30000c87 <concatenate+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:41
      c++;  	
30000c83:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:40
   void concatenate(char p[], char q[]) {
   int c, d;
 
   c = 0;
 
   while (p[c] != '\0') {
30000c87:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000c8a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000c8d:	01 d0                	add    eax,edx
30000c8f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000c92:	84 c0                	test   al,al
30000c94:	75 ed                	jne    30000c83 <concatenate+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:44
      c++;  	
   }
 
   d = 0;
30000c96:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:46
 
   while (q[d] != '\0') {
30000c9d:	eb 1d                	jmp    30000cbc <concatenate+0x52>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:47
      p[c] = q[d];
30000c9f:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000ca2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000ca5:	01 c2                	add    edx,eax
30000ca7:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
30000caa:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cad:	01 c8                	add    eax,ecx
30000caf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000cb2:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:48
      d++;
30000cb4:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:49
      c++;	
30000cb8:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:46
      c++;  	
   }
 
   d = 0;
 
   while (q[d] != '\0') {
30000cbc:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30000cbf:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cc2:	01 d0                	add    eax,edx
30000cc4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000cc7:	84 c0                	test   al,al
30000cc9:	75 d4                	jne    30000c9f <concatenate+0x35>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:52
      p[c] = q[d];
      d++;
      c++;	
   }
 
   p[c] = '\0';
30000ccb:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000cce:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000cd1:	01 d0                	add    eax,edx
30000cd3:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:53
30000cd6:	90                   	nop
30000cd7:	c9                   	leave  
30000cd8:	c3                   	ret    
30000cd9:	66 90                	xchg   ax,ax
30000cdb:	90                   	nop

30000cdc <strcmp>:
strcmp():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:25

/* Compare S1 and S2, returning less than, equal to or
   greater than zero if S1 is lexicographically less than,
   equal to or greater than S2.  */
VISIBLE int strcmp (const char *p1, const char *p2)
{
30000cdc:	55                   	push   ebp
30000cdd:	89 e5                	mov    ebp,esp
30000cdf:	56                   	push   esi
30000ce0:	53                   	push   ebx
30000ce1:	83 ec 10             	sub    esp,0x10
30000ce4:	e8 7d 12 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000ce9:	05 6f 26 00 00       	add    eax,0x266f
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:26
  register const unsigned char *s1 = (const unsigned char *) p1;
30000cee:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:27
  register const unsigned char *s2 = (const unsigned char *) p2;
30000cf1:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:32
  unsigned char c1, c2;

  do
    {
      c1 = (unsigned char) *s1++;
30000cf4:	89 d8                	mov    eax,ebx
30000cf6:	8d 58 01             	lea    ebx,[eax+0x1]
30000cf9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000cfc:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:33
      c2 = (unsigned char) *s2++;
30000cff:	89 f0                	mov    eax,esi
30000d01:	8d 70 01             	lea    esi,[eax+0x1]
30000d04:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000d07:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:34
      if (c1 == '\0')
30000d0a:	80 7d f7 00          	cmp    BYTE PTR [ebp-0x9],0x0
30000d0e:	75 0e                	jne    30000d1e <strcmp+0x42>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:35
	return c1 - c2;
30000d10:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
30000d14:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30000d18:	29 c2                	sub    edx,eax
30000d1a:	89 d0                	mov    eax,edx
30000d1c:	eb 15                	jmp    30000d33 <strcmp+0x57>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:37
    }
  while (c1 == c2);
30000d1e:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30000d22:	3a 45 f6             	cmp    al,BYTE PTR [ebp-0xa]
30000d25:	74 cd                	je     30000cf4 <strcmp+0x18>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:39

  return c1 - c2;
30000d27:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
30000d2b:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30000d2f:	29 c2                	sub    edx,eax
30000d31:	89 d0                	mov    eax,edx
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:40
}
30000d33:	83 c4 10             	add    esp,0x10
30000d36:	5b                   	pop    ebx
30000d37:	5e                   	pop    esi
30000d38:	5d                   	pop    ebp
30000d39:	c3                   	ret    
30000d3a:	66 90                	xchg   ax,ax

30000d3c <strcpy>:
strcpy():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:5
#include "strings.h"

__attribute__((visibility("default"))) char *
strcpy(char *s1, const char *s2)
{
30000d3c:	55                   	push   ebp
30000d3d:	89 e5                	mov    ebp,esp
30000d3f:	83 ec 10             	sub    esp,0x10
30000d42:	e8 1f 12 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000d47:	05 11 26 00 00       	add    eax,0x2611
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:6
    char *s = s1;
30000d4c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000d4f:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:7
    while ((*s++ = *s2++) != 0)
30000d52:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:7 (discriminator 1)
30000d53:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000d56:	8d 50 01             	lea    edx,[eax+0x1]
30000d59:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000d5c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000d5f:	8d 4a 01             	lea    ecx,[edx+0x1]
30000d62:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
30000d65:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000d68:	88 10                	mov    BYTE PTR [eax],dl
30000d6a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000d6d:	84 c0                	test   al,al
30000d6f:	75 e2                	jne    30000d53 <strcpy+0x17>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:9
	;
    *s=0;       //CLR 04/20/2017: Added terminating null character to returned string
30000d71:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000d74:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:10
    return (s1);
30000d77:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:11
}
30000d7a:	c9                   	leave  
30000d7b:	c3                   	ret    

30000d7c <strcpyc>:
strcpyc():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:15

__attribute__((visibility("default"))) char *
strcpyc(char *s1, const char *s2, unsigned count)
{
30000d7c:	55                   	push   ebp
30000d7d:	89 e5                	mov    ebp,esp
30000d7f:	83 ec 10             	sub    esp,0x10
30000d82:	e8 df 11 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000d87:	05 d1 25 00 00       	add    eax,0x25d1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:16
    char *s = s1;
30000d8c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000d8f:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17
    while ((*s++ = *s2++) != 0 && count-->0)
30000d92:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17 (discriminator 2)
30000d93:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000d96:	8d 50 01             	lea    edx,[eax+0x1]
30000d99:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000d9c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000d9f:	8d 4a 01             	lea    ecx,[edx+0x1]
30000da2:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
30000da5:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000da8:	88 10                	mov    BYTE PTR [eax],dl
30000daa:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000dad:	84 c0                	test   al,al
30000daf:	74 0d                	je     30000dbe <strcpyc+0x42>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17 (discriminator 1)
30000db1:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000db4:	8d 50 ff             	lea    edx,[eax-0x1]
30000db7:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000dba:	85 c0                	test   eax,eax
30000dbc:	75 d5                	jne    30000d93 <strcpyc+0x17>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:19
	;
    return (s1);
30000dbe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:20
}
30000dc1:	c9                   	leave  
30000dc2:	c3                   	ret    
30000dc3:	90                   	nop

30000dc4 <strlen>:
strlen():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:3
#include <stddef.h>

__attribute__((visibility("default"))) size_t strlen(const char* str) {
30000dc4:	55                   	push   ebp
30000dc5:	89 e5                	mov    ebp,esp
30000dc7:	83 ec 10             	sub    esp,0x10
30000dca:	e8 97 11 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000dcf:	05 89 25 00 00       	add    eax,0x2589
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:4
          size_t ret = 0;
30000dd4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:5
        while ( str[ret] != 0 )
30000ddb:	eb 04                	jmp    30000de1 <strlen+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:6
                ret++;
30000ddd:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:5
#include <stddef.h>

__attribute__((visibility("default"))) size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
30000de1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30000de4:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000de7:	01 d0                	add    eax,edx
30000de9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000dec:	84 c0                	test   al,al
30000dee:	75 ed                	jne    30000ddd <strlen+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:7
                ret++;
        return ret;
30000df0:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:8
}
30000df3:	c9                   	leave  
30000df4:	c3                   	ret    
30000df5:	66 90                	xchg   ax,ax
30000df7:	90                   	nop

30000df8 <strncmp>:
strncmp():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:13
 *   array pointed to by `s2'.  [4.11.4.4]
 */
#include <stddef.h>

__attribute__((visibility("default"))) int strncmp(const char *s1, const char *s2, size_t n)
{
30000df8:	55                   	push   ebp
30000df9:	89 e5                	mov    ebp,esp
30000dfb:	e8 66 11 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000e00:	05 58 25 00 00       	add    eax,0x2558
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14
    for ( ; n > 0; s1++, s2++, --n)
30000e05:	eb 4b                	jmp    30000e52 <strncmp+0x5a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:15
	if (*s1 != *s2)
30000e07:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000e0a:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30000e0d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000e10:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000e13:	38 c2                	cmp    dl,al
30000e15:	74 1e                	je     30000e35 <strncmp+0x3d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
30000e17:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000e1a:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30000e1d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000e20:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000e23:	38 c2                	cmp    dl,al
30000e25:	73 07                	jae    30000e2e <strncmp+0x36>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16 (discriminator 1)
30000e27:	b8 ff ff ff ff       	mov    eax,0xffffffff
30000e2c:	eb 2f                	jmp    30000e5d <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16 (discriminator 2)
30000e2e:	b8 01 00 00 00       	mov    eax,0x1
30000e33:	eb 28                	jmp    30000e5d <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:17
	else if (*s1 == '\0')
30000e35:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000e38:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000e3b:	84 c0                	test   al,al
30000e3d:	75 07                	jne    30000e46 <strncmp+0x4e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:18
	    return 0;
30000e3f:	b8 00 00 00 00       	mov    eax,0x0
30000e44:	eb 17                	jmp    30000e5d <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14
 */
#include <stddef.h>

__attribute__((visibility("default"))) int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
30000e46:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
30000e4a:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
30000e4e:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14 (discriminator 1)
30000e52:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000e56:	75 af                	jne    30000e07 <strncmp+0xf>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:19
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
    return 0;
30000e58:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:20
}
30000e5d:	5d                   	pop    ebp
30000e5e:	c3                   	ret    
30000e5f:	90                   	nop

30000e60 <strncpy>:
strncpy():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:14
 *   The `strncpy' function returns the value of `s1'.  [4.11.2.4]
 */
#include <stddef.h>

__attribute__((visibility("default"))) char * strncpy(char *s1, const char *s2, size_t n)
{
30000e60:	55                   	push   ebp
30000e61:	89 e5                	mov    ebp,esp
30000e63:	83 ec 10             	sub    esp,0x10
30000e66:	e8 fb 10 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000e6b:	05 ed 24 00 00       	add    eax,0x24ed
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:15
    char *s = s1;
30000e70:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000e73:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16
    while (n > 0 && *s2 != '\0') {
30000e76:	eb 1b                	jmp    30000e93 <strncpy+0x33>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:17
	*s++ = *s2++;
30000e78:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000e7b:	8d 50 01             	lea    edx,[eax+0x1]
30000e7e:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000e81:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000e84:	8d 4a 01             	lea    ecx,[edx+0x1]
30000e87:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
30000e8a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000e8d:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:18
	--n;
30000e8f:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16
#include <stddef.h>

__attribute__((visibility("default"))) char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
30000e93:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000e97:	74 1c                	je     30000eb5 <strncpy+0x55>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16 (discriminator 1)
30000e99:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000e9c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000e9f:	84 c0                	test   al,al
30000ea1:	75 d5                	jne    30000e78 <strncpy+0x18>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:20
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
30000ea3:	eb 10                	jmp    30000eb5 <strncpy+0x55>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:21
	*s++ = '\0';
30000ea5:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000ea8:	8d 50 01             	lea    edx,[eax+0x1]
30000eab:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000eae:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:22
	--n;
30000eb1:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:20
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
30000eb5:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000eb9:	75 ea                	jne    30000ea5 <strncpy+0x45>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:24
	*s++ = '\0';
	--n;
    }
    return s1;
30000ebb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:25
}
30000ebe:	c9                   	leave  
30000ebf:	c3                   	ret    

30000ec0 <strtoul>:
strtoul():
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:60
 * Ignores `locale' stuff.  Assumes that the upper and lower case
 * alphabets and digits are each contiguous.
 */
unsigned long
__attribute__((visibility("default"))) strtoul(const char *nptr, char **endptr, register int base)
{
30000ec0:	55                   	push   ebp
30000ec1:	89 e5                	mov    ebp,esp
30000ec3:	57                   	push   edi
30000ec4:	56                   	push   esi
30000ec5:	53                   	push   ebx
30000ec6:	83 ec 08             	sub    esp,0x8
30000ec9:	e8 98 10 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30000ece:	05 8a 24 00 00       	add    eax,0x248a
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:61
	register const char *s = nptr;
30000ed3:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:65
	register unsigned long acc;
	register int c;
	register unsigned long cutoff;
	register int neg = 0, any, cutlim;
30000ed6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:71 (discriminator 1)

	/*
	 * See strtol for comments as to the logic used.
	 */
	do {
		c = *s++;
30000edd:	89 f0                	mov    eax,esi
30000edf:	8d 70 01             	lea    esi,[eax+0x1]
30000ee2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000ee5:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:72 (discriminator 1)
	} while (c==' ');
30000ee8:	83 fb 20             	cmp    ebx,0x20
30000eeb:	74 f0                	je     30000edd <strtoul+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:73
	if (c == '-') {
30000eed:	83 fb 2d             	cmp    ebx,0x2d
30000ef0:	75 14                	jne    30000f06 <strtoul+0x46>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:74
		neg = 1;
30000ef2:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:75
		c = *s++;
30000ef9:	89 f0                	mov    eax,esi
30000efb:	8d 70 01             	lea    esi,[eax+0x1]
30000efe:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f01:	0f be d8             	movsx  ebx,al
30000f04:	eb 10                	jmp    30000f16 <strtoul+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:76
	} else if (c == '+')
30000f06:	83 fb 2b             	cmp    ebx,0x2b
30000f09:	75 0b                	jne    30000f16 <strtoul+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:77
		c = *s++;
30000f0b:	89 f0                	mov    eax,esi
30000f0d:	8d 70 01             	lea    esi,[eax+0x1]
30000f10:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f13:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78
	if ((base == 0 || base == 16) &&
30000f16:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000f1a:	74 06                	je     30000f22 <strtoul+0x62>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78 (discriminator 2)
30000f1c:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
30000f20:	75 26                	jne    30000f48 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78 (discriminator 3)
30000f22:	83 fb 30             	cmp    ebx,0x30
30000f25:	75 21                	jne    30000f48 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:79
	    c == '0' && (*s == 'x' || *s == 'X')) {
30000f27:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30000f2a:	3c 78                	cmp    al,0x78
30000f2c:	74 07                	je     30000f35 <strtoul+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:79 (discriminator 1)
30000f2e:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30000f31:	3c 58                	cmp    al,0x58
30000f33:	75 13                	jne    30000f48 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:80
		c = s[1];
30000f35:	8d 46 01             	lea    eax,[esi+0x1]
30000f38:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f3b:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:81
		s += 2;
30000f3e:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:82
		base = 16;
30000f41:	c7 45 10 10 00 00 00 	mov    DWORD PTR [ebp+0x10],0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:84
	}
	if (base == 0)
30000f48:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000f4c:	75 14                	jne    30000f62 <strtoul+0xa2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85
		base = c == '0' ? 8 : 10;
30000f4e:	83 fb 30             	cmp    ebx,0x30
30000f51:	75 07                	jne    30000f5a <strtoul+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 1)
30000f53:	b8 08 00 00 00       	mov    eax,0x8
30000f58:	eb 05                	jmp    30000f5f <strtoul+0x9f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 2)
30000f5a:	b8 0a 00 00 00       	mov    eax,0xa
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 4)
30000f5f:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:86
	cutoff = (unsigned long)ULONG_MAX / (unsigned long)base;
30000f62:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30000f65:	b8 ff ff ff ff       	mov    eax,0xffffffff
30000f6a:	ba 00 00 00 00       	mov    edx,0x0
30000f6f:	f7 f1                	div    ecx
30000f71:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:87
	cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;
30000f74:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30000f77:	b8 ff ff ff ff       	mov    eax,0xffffffff
30000f7c:	ba 00 00 00 00       	mov    edx,0x0
30000f81:	f7 f1                	div    ecx
30000f83:	89 d0                	mov    eax,edx
30000f85:	89 c2                	mov    edx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:88
	for (acc = 0, any = 0;; c = *s++) {
30000f87:	bf 00 00 00 00       	mov    edi,0x0
30000f8c:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:89
		if (ISDIGIT(c))
30000f91:	8d 43 d0             	lea    eax,[ebx-0x30]
30000f94:	83 f8 09             	cmp    eax,0x9
30000f97:	77 05                	ja     30000f9e <strtoul+0xde>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:90
			c -= '0';
30000f99:	83 eb 30             	sub    ebx,0x30
30000f9c:	eb 25                	jmp    30000fc3 <strtoul+0x103>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:91
		else if (ISALPHA(c))
30000f9e:	89 d8                	mov    eax,ebx
30000fa0:	83 c8 20             	or     eax,0x20
30000fa3:	83 e8 61             	sub    eax,0x61
30000fa6:	83 f8 19             	cmp    eax,0x19
30000fa9:	77 56                	ja     30001001 <strtoul+0x141>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
30000fab:	83 fb 40             	cmp    ebx,0x40
30000fae:	7e 0c                	jle    30000fbc <strtoul+0xfc>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 1)
30000fb0:	83 fb 5a             	cmp    ebx,0x5a
30000fb3:	7f 07                	jg     30000fbc <strtoul+0xfc>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 3)
30000fb5:	b8 37 00 00 00       	mov    eax,0x37
30000fba:	eb 05                	jmp    30000fc1 <strtoul+0x101>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 4)
30000fbc:	b8 57 00 00 00       	mov    eax,0x57
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 6)
30000fc1:	29 c3                	sub    ebx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:95
		else
			break;
		if (c >= base)
30000fc3:	3b 5d 10             	cmp    ebx,DWORD PTR [ebp+0x10]
30000fc6:	7d 3c                	jge    30001004 <strtoul+0x144>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97
			break;
		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
30000fc8:	89 c8                	mov    eax,ecx
30000fca:	85 c0                	test   eax,eax
30000fcc:	78 10                	js     30000fde <strtoul+0x11e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 1)
30000fce:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30000fd1:	77 0b                	ja     30000fde <strtoul+0x11e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 2)
30000fd3:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30000fd6:	75 0d                	jne    30000fe5 <strtoul+0x125>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 3)
30000fd8:	89 d0                	mov    eax,edx
30000fda:	39 c3                	cmp    ebx,eax
30000fdc:	7e 07                	jle    30000fe5 <strtoul+0x125>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:98
			any = -1;
30000fde:	b9 ff ff ff ff       	mov    ecx,0xffffffff
30000fe3:	eb 0f                	jmp    30000ff4 <strtoul+0x134>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:100
		else {
			any = 1;
30000fe5:	b9 01 00 00 00       	mov    ecx,0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:101
			acc *= base;
30000fea:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000fed:	0f af f8             	imul   edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:102
			acc += c;
30000ff0:	89 d8                	mov    eax,ebx
30000ff2:	01 c7                	add    edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:88
	}
	if (base == 0)
		base = c == '0' ? 8 : 10;
	cutoff = (unsigned long)ULONG_MAX / (unsigned long)base;
	cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;
	for (acc = 0, any = 0;; c = *s++) {
30000ff4:	89 f0                	mov    eax,esi
30000ff6:	8d 70 01             	lea    esi,[eax+0x1]
30000ff9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000ffc:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:104
		else {
			any = 1;
			acc *= base;
			acc += c;
		}
	}
30000fff:	eb 90                	jmp    30000f91 <strtoul+0xd1>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:94
		if (ISDIGIT(c))
			c -= '0';
		else if (ISALPHA(c))
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
		else
			break;
30001001:	90                   	nop
30001002:	eb 01                	jmp    30001005 <strtoul+0x145>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:96
		if (c >= base)
			break;
30001004:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:105
			any = 1;
			acc *= base;
			acc += c;
		}
	}
	if (any < 0) {
30001005:	89 c8                	mov    eax,ecx
30001007:	85 c0                	test   eax,eax
30001009:	79 07                	jns    30001012 <strtoul+0x152>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:106
		acc = ULONG_MAX;
3000100b:	bf ff ff ff ff       	mov    edi,0xffffffff
30001010:	eb 08                	jmp    3000101a <strtoul+0x15a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:107
	} else if (neg)
30001012:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30001016:	74 02                	je     3000101a <strtoul+0x15a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:108
		acc = -acc;
30001018:	f7 df                	neg    edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:109
	if (endptr != 0)
3000101a:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
3000101e:	74 13                	je     30001033 <strtoul+0x173>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110
		*endptr = (char *) (any ? s - 1 : nptr);
30001020:	89 c8                	mov    eax,ecx
30001022:	85 c0                	test   eax,eax
30001024:	74 05                	je     3000102b <strtoul+0x16b>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 1)
30001026:	8d 46 ff             	lea    eax,[esi-0x1]
30001029:	eb 03                	jmp    3000102e <strtoul+0x16e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 2)
3000102b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 4)
3000102e:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001031:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:111
	return (acc);
30001033:	89 f8                	mov    eax,edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:112
}
30001035:	83 c4 08             	add    esp,0x8
30001038:	5b                   	pop    ebx
30001039:	5e                   	pop    esi
3000103a:	5f                   	pop    edi
3000103b:	5d                   	pop    ebp
3000103c:	c3                   	ret    
3000103d:	66 90                	xchg   ax,ax
3000103f:	90                   	nop

30001040 <strleft>:
strleft():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:2
__attribute__((visibility("default"))) char* strleft(char* val, int cnt)
{
30001040:	55                   	push   ebp
30001041:	89 e5                	mov    ebp,esp
30001043:	e8 1e 0f 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
30001048:	05 10 23 00 00       	add    eax,0x2310
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:3
    val[cnt]='\0';
3000104d:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001050:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001053:	01 d0                	add    eax,edx
30001055:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:4
    return val;
30001058:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:5
}
3000105b:	5d                   	pop    ebp
3000105c:	c3                   	ret    
3000105d:	66 90                	xchg   ax,ax
3000105f:	90                   	nop

30001060 <strtol>:
strtol():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:88
 * Ignores `locale' stuff.  Assumes that the upper and lower case
 * alphabets and digits are each contiguous.
 */
__attribute__((visibility("default"))) long
strtol(const char *nptr, char **endptr, register int base)
{
30001060:	55                   	push   ebp
30001061:	89 e5                	mov    ebp,esp
30001063:	57                   	push   edi
30001064:	56                   	push   esi
30001065:	53                   	push   ebx
30001066:	83 ec 0c             	sub    esp,0xc
30001069:	e8 f8 0e 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
3000106e:	05 ea 22 00 00       	add    eax,0x22ea
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:89
	register const char *s = nptr;
30001073:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:93
	register unsigned long acc;
	register int c;
	register unsigned long cutoff;
	register int neg = 0, any, cutlim;
30001076:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:101 (discriminator 1)
	 * Skip white space and pick up leading +/- sign if any.
	 * If base is 0, allow 0x for hex and 0 for octal, else
	 * assume decimal; if base is already 16, allow 0x.
	 */
	do {
		c = *s++;
3000107d:	89 f0                	mov    eax,esi
3000107f:	8d 70 01             	lea    esi,[eax+0x1]
30001082:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001085:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:102 (discriminator 1)
	} while (c==' ');
30001088:	83 fb 20             	cmp    ebx,0x20
3000108b:	74 f0                	je     3000107d <strtol+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:103
	if (c == '-') {
3000108d:	83 fb 2d             	cmp    ebx,0x2d
30001090:	75 14                	jne    300010a6 <strtol+0x46>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:104
		neg = 1;
30001092:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:105
		c = *s++;
30001099:	89 f0                	mov    eax,esi
3000109b:	8d 70 01             	lea    esi,[eax+0x1]
3000109e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300010a1:	0f be d8             	movsx  ebx,al
300010a4:	eb 10                	jmp    300010b6 <strtol+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:106
	} else if (c == '+')
300010a6:	83 fb 2b             	cmp    ebx,0x2b
300010a9:	75 0b                	jne    300010b6 <strtol+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:107
		c = *s++;
300010ab:	89 f0                	mov    eax,esi
300010ad:	8d 70 01             	lea    esi,[eax+0x1]
300010b0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300010b3:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108
	if ((base == 0 || base == 16) &&
300010b6:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
300010ba:	74 06                	je     300010c2 <strtol+0x62>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108 (discriminator 2)
300010bc:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
300010c0:	75 26                	jne    300010e8 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108 (discriminator 3)
300010c2:	83 fb 30             	cmp    ebx,0x30
300010c5:	75 21                	jne    300010e8 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:109
	    c == '0' && (*s == 'x' || *s == 'X')) {
300010c7:	0f b6 06             	movzx  eax,BYTE PTR [esi]
300010ca:	3c 78                	cmp    al,0x78
300010cc:	74 07                	je     300010d5 <strtol+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:109 (discriminator 1)
300010ce:	0f b6 06             	movzx  eax,BYTE PTR [esi]
300010d1:	3c 58                	cmp    al,0x58
300010d3:	75 13                	jne    300010e8 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:110
		c = s[1];
300010d5:	8d 46 01             	lea    eax,[esi+0x1]
300010d8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300010db:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:111
		s += 2;
300010de:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:112
		base = 16;
300010e1:	c7 45 10 10 00 00 00 	mov    DWORD PTR [ebp+0x10],0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:114
	}
	if (base == 0)
300010e8:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
300010ec:	75 14                	jne    30001102 <strtol+0xa2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115
		base = c == '0' ? 8 : 10;
300010ee:	83 fb 30             	cmp    ebx,0x30
300010f1:	75 07                	jne    300010fa <strtol+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 1)
300010f3:	b8 08 00 00 00       	mov    eax,0x8
300010f8:	eb 05                	jmp    300010ff <strtol+0x9f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 2)
300010fa:	b8 0a 00 00 00       	mov    eax,0xa
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 4)
300010ff:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134
	 * the number is too big, and we will return a range error.
	 *
	 * Set any if any `digits' consumed; make it negative to indicate
	 * overflow.
	 */
	cutoff = neg ? -(unsigned long)LONG_MIN : LONG_MAX;
30001102:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30001106:	74 07                	je     3000110f <strtol+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134 (discriminator 1)
30001108:	b8 00 00 00 80       	mov    eax,0x80000000
3000110d:	eb 05                	jmp    30001114 <strtol+0xb4>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134 (discriminator 2)
3000110f:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:135 (discriminator 4)
	cutlim = cutoff % (unsigned long)base;
30001114:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30001117:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
3000111a:	ba 00 00 00 00       	mov    edx,0x0
3000111f:	f7 f1                	div    ecx
30001121:	89 d1                	mov    ecx,edx
30001123:	89 c8                	mov    eax,ecx
30001125:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:136 (discriminator 4)
	cutoff /= (unsigned long)base;
30001128:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
3000112b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
3000112e:	ba 00 00 00 00       	mov    edx,0x0
30001133:	f7 f7                	div    edi
30001135:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:137 (discriminator 4)
	for (acc = 0, any = 0;; c = *s++) {
30001138:	bf 00 00 00 00       	mov    edi,0x0
3000113d:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:138
		if (ISDIGIT(c))
30001142:	8d 43 d0             	lea    eax,[ebx-0x30]
30001145:	83 f8 09             	cmp    eax,0x9
30001148:	77 05                	ja     3000114f <strtol+0xef>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:139
			c -= '0';
3000114a:	83 eb 30             	sub    ebx,0x30
3000114d:	eb 25                	jmp    30001174 <strtol+0x114>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:140
		else if (ISALPHA(c))
3000114f:	89 d8                	mov    eax,ebx
30001151:	83 c8 20             	or     eax,0x20
30001154:	83 e8 61             	sub    eax,0x61
30001157:	83 f8 19             	cmp    eax,0x19
3000115a:	77 55                	ja     300011b1 <strtol+0x151>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
3000115c:	83 fb 40             	cmp    ebx,0x40
3000115f:	7e 0c                	jle    3000116d <strtol+0x10d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 1)
30001161:	83 fb 5a             	cmp    ebx,0x5a
30001164:	7f 07                	jg     3000116d <strtol+0x10d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 3)
30001166:	b8 37 00 00 00       	mov    eax,0x37
3000116b:	eb 05                	jmp    30001172 <strtol+0x112>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 4)
3000116d:	b8 57 00 00 00       	mov    eax,0x57
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 6)
30001172:	29 c3                	sub    ebx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:144
		else
			break;
		if (c >= base)
30001174:	3b 5d 10             	cmp    ebx,DWORD PTR [ebp+0x10]
30001177:	7d 3b                	jge    300011b4 <strtol+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146
			break;
		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
30001179:	89 c8                	mov    eax,ecx
3000117b:	85 c0                	test   eax,eax
3000117d:	78 0f                	js     3000118e <strtol+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 1)
3000117f:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30001182:	77 0a                	ja     3000118e <strtol+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 2)
30001184:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30001187:	75 0c                	jne    30001195 <strtol+0x135>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 3)
30001189:	3b 5d e8             	cmp    ebx,DWORD PTR [ebp-0x18]
3000118c:	7e 07                	jle    30001195 <strtol+0x135>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:147
			any = -1;
3000118e:	b9 ff ff ff ff       	mov    ecx,0xffffffff
30001193:	eb 0f                	jmp    300011a4 <strtol+0x144>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:149
		else {
			any = 1;
30001195:	b9 01 00 00 00       	mov    ecx,0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:150
			acc *= base;
3000119a:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
3000119d:	0f af f8             	imul   edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:151
			acc += c;
300011a0:	89 d8                	mov    eax,ebx
300011a2:	01 c7                	add    edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:137
	 * overflow.
	 */
	cutoff = neg ? -(unsigned long)LONG_MIN : LONG_MAX;
	cutlim = cutoff % (unsigned long)base;
	cutoff /= (unsigned long)base;
	for (acc = 0, any = 0;; c = *s++) {
300011a4:	89 f0                	mov    eax,esi
300011a6:	8d 70 01             	lea    esi,[eax+0x1]
300011a9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300011ac:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:153
		else {
			any = 1;
			acc *= base;
			acc += c;
		}
	}
300011af:	eb 91                	jmp    30001142 <strtol+0xe2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:143
		if (ISDIGIT(c))
			c -= '0';
		else if (ISALPHA(c))
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
		else
			break;
300011b1:	90                   	nop
300011b2:	eb 01                	jmp    300011b5 <strtol+0x155>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:145
		if (c >= base)
			break;
300011b4:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:154
			any = 1;
			acc *= base;
			acc += c;
		}
	}
	if (any < 0) {
300011b5:	89 c8                	mov    eax,ecx
300011b7:	85 c0                	test   eax,eax
300011b9:	79 16                	jns    300011d1 <strtol+0x171>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155
		acc = neg ? LONG_MIN : LONG_MAX;
300011bb:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
300011bf:	74 07                	je     300011c8 <strtol+0x168>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 1)
300011c1:	b8 00 00 00 80       	mov    eax,0x80000000
300011c6:	eb 05                	jmp    300011cd <strtol+0x16d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 2)
300011c8:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 4)
300011cd:	89 c7                	mov    edi,eax
300011cf:	eb 08                	jmp    300011d9 <strtol+0x179>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:156
	} else if (neg)
300011d1:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
300011d5:	74 02                	je     300011d9 <strtol+0x179>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:157
		acc = -acc;
300011d7:	f7 df                	neg    edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:158
	if (endptr != 0)
300011d9:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
300011dd:	74 13                	je     300011f2 <strtol+0x192>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159
		*endptr = (char *) (any ? s - 1 : nptr);
300011df:	89 c8                	mov    eax,ecx
300011e1:	85 c0                	test   eax,eax
300011e3:	74 05                	je     300011ea <strtol+0x18a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 1)
300011e5:	8d 46 ff             	lea    eax,[esi-0x1]
300011e8:	eb 03                	jmp    300011ed <strtol+0x18d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 2)
300011ea:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 4)
300011ed:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
300011f0:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:160
	return (acc);
300011f2:	89 f8                	mov    eax,edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:161
}
300011f4:	83 c4 0c             	add    esp,0xc
300011f7:	5b                   	pop    ebx
300011f8:	5e                   	pop    esi
300011f9:	5f                   	pop    edi
300011fa:	5d                   	pop    ebp
300011fb:	c3                   	ret    

300011fc <strtrim>:
strtrim():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:5
#include "strings.h"

/*FROM: http://codereview.stackexchange.com/questions/20897/trim-function-in-c*/
__attribute__((visibility("default"))) char * strtrim(char * *pointerToString)
{
300011fc:	55                   	push   ebp
300011fd:	89 e5                	mov    ebp,esp
300011ff:	53                   	push   ebx
30001200:	83 ec 14             	sub    esp,0x14
30001203:	e8 b8 0d 00 00       	call   30001fc0 <__x86.get_pc_thunk.bx>
30001208:	81 c3 50 21 00 00    	add    ebx,0x2150
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:6
    uint8_t start=0, length=0;
3000120e:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
30001212:	c6 45 f5 00          	mov    BYTE PTR [ebp-0xb],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:9

        // Trim.Start:
        length = strlen(*pointerToString);
30001216:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001219:	8b 00                	mov    eax,DWORD PTR [eax]
3000121b:	83 ec 0c             	sub    esp,0xc
3000121e:	50                   	push   eax
3000121f:	e8 8c 0d 00 00       	call   30001fb0 <__x86.get_pc_thunk.ax+0x4a>
30001224:	83 c4 10             	add    esp,0x10
30001227:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10
        while ((*pointerToString)[start]==' ') start++;
3000122a:	eb 0a                	jmp    30001236 <strtrim+0x3a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10 (discriminator 2)
3000122c:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001230:	83 c0 01             	add    eax,0x1
30001233:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10 (discriminator 1)
30001236:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001239:	8b 10                	mov    edx,DWORD PTR [eax]
3000123b:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
3000123f:	01 d0                	add    eax,edx
30001241:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001244:	3c 20                	cmp    al,0x20
30001246:	74 e4                	je     3000122c <strtrim+0x30>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:11
        (*pointerToString) += start;
30001248:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000124b:	8b 10                	mov    edx,DWORD PTR [eax]
3000124d:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001251:	01 c2                	add    edx,eax
30001253:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001256:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:13

        if (start < length) // Required for empty (ex. "    ") input
30001258:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
3000125c:	3a 45 f5             	cmp    al,BYTE PTR [ebp-0xb]
3000125f:	73 46                	jae    300012a7 <strtrim+0xab>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:16
        {
            // Trim.End:
            uint8_t end = strlen(*pointerToString)-1; // Get string length again (after Trim.Start)
30001261:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001264:	8b 00                	mov    eax,DWORD PTR [eax]
30001266:	83 ec 0c             	sub    esp,0xc
30001269:	50                   	push   eax
3000126a:	e8 41 0d 00 00       	call   30001fb0 <__x86.get_pc_thunk.ax+0x4a>
3000126f:	83 c4 10             	add    esp,0x10
30001272:	83 e8 01             	sub    eax,0x1
30001275:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:17
            while ((*pointerToString)[end]==' ') end--;
30001278:	eb 0a                	jmp    30001284 <strtrim+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:17 (discriminator 2)
3000127a:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
3000127e:	83 e8 01             	sub    eax,0x1
30001281:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:17 (discriminator 1)
30001284:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001287:	8b 10                	mov    edx,DWORD PTR [eax]
30001289:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
3000128d:	01 d0                	add    eax,edx
3000128f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001292:	3c 20                	cmp    al,0x20
30001294:	74 e4                	je     3000127a <strtrim+0x7e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:18
            (*pointerToString)[end+1] = 0;
30001296:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001299:	8b 00                	mov    eax,DWORD PTR [eax]
3000129b:	0f b6 55 f6          	movzx  edx,BYTE PTR [ebp-0xa]
3000129f:	83 c2 01             	add    edx,0x1
300012a2:	01 d0                	add    eax,edx
300012a4:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:21
        }

    return *pointerToString;
300012a7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300012aa:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:22
}
300012ac:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300012af:	c9                   	leave  
300012b0:	c3                   	ret    

300012b1 <strtrim2>:
strtrim2():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:25

__attribute__((visibility("default"))) char * strtrim2(char* pointerToString)
{
300012b1:	55                   	push   ebp
300012b2:	89 e5                	mov    ebp,esp
300012b4:	53                   	push   ebx
300012b5:	83 ec 14             	sub    esp,0x14
300012b8:	e8 03 0d 00 00       	call   30001fc0 <__x86.get_pc_thunk.bx>
300012bd:	81 c3 9b 20 00 00    	add    ebx,0x209b
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:26
    uint8_t start=0, length=0;
300012c3:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
300012c7:	c6 45 f5 00          	mov    BYTE PTR [ebp-0xb],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:29

        // Trim.Start:
        length = strlen(pointerToString);
300012cb:	83 ec 0c             	sub    esp,0xc
300012ce:	ff 75 08             	push   DWORD PTR [ebp+0x8]
300012d1:	e8 da 0c 00 00       	call   30001fb0 <__x86.get_pc_thunk.ax+0x4a>
300012d6:	83 c4 10             	add    esp,0x10
300012d9:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:30
        while ((pointerToString)[start]==' ') start++;
300012dc:	eb 0a                	jmp    300012e8 <strtrim2+0x37>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:30 (discriminator 2)
300012de:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
300012e2:	83 c0 01             	add    eax,0x1
300012e5:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:30 (discriminator 1)
300012e8:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
300012ec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300012ef:	01 d0                	add    eax,edx
300012f1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300012f4:	3c 20                	cmp    al,0x20
300012f6:	74 e6                	je     300012de <strtrim2+0x2d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:31
        (pointerToString) += start;
300012f8:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
300012fc:	01 45 08             	add    DWORD PTR [ebp+0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:33

        if (start < length) // Required for empty (ex. "    ") input
300012ff:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001303:	3a 45 f5             	cmp    al,BYTE PTR [ebp-0xb]
30001306:	73 3f                	jae    30001347 <strtrim2+0x96>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:36
        {
            // Trim.End:
            uint8_t end = strlen(pointerToString)-1; // Get string length again (after Trim.Start)
30001308:	83 ec 0c             	sub    esp,0xc
3000130b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
3000130e:	e8 9d 0c 00 00       	call   30001fb0 <__x86.get_pc_thunk.ax+0x4a>
30001313:	83 c4 10             	add    esp,0x10
30001316:	83 e8 01             	sub    eax,0x1
30001319:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:37
            while ((pointerToString)[end]==' ') end--;
3000131c:	eb 0a                	jmp    30001328 <strtrim2+0x77>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:37 (discriminator 2)
3000131e:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30001322:	83 e8 01             	sub    eax,0x1
30001325:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:37 (discriminator 1)
30001328:	0f b6 55 f6          	movzx  edx,BYTE PTR [ebp-0xa]
3000132c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000132f:	01 d0                	add    eax,edx
30001331:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001334:	3c 20                	cmp    al,0x20
30001336:	74 e6                	je     3000131e <strtrim2+0x6d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:38
            (pointerToString)[end+1] = 0;
30001338:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
3000133c:	8d 50 01             	lea    edx,[eax+0x1]
3000133f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001342:	01 d0                	add    eax,edx
30001344:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:41
        }

    return pointerToString;
30001347:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:42
}
3000134a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
3000134d:	c9                   	leave  
3000134e:	c3                   	ret    
3000134f:	90                   	nop

30001350 <time>:
time():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:47
  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
  {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
};

VISIBLE time_t time(/*time_t* arg*/)
{
30001350:	55                   	push   ebp
30001351:	89 e5                	mov    ebp,esp
30001353:	83 ec 10             	sub    esp,0x10
30001356:	e8 0b 0c 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
3000135b:	05 fd 1f 00 00       	add    eax,0x1ffd
/home/yogi/src/os/aproj/libChrisOS/src/time.c:48
    uint32_t retVal=0;
30001360:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49
    __asm__("call sysEnter_Vector\n":"=a" (retVal):"a" (SYSCALL_GETTICKS));
30001367:	b8 70 01 00 00       	mov    eax,0x170
3000136c:	e8 fc ff ff ff       	call   3000136d <time+0x1d>
30001371:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50
    return (time_t)retVal;
30001374:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:51
}
30001377:	c9                   	leave  
30001378:	c3                   	ret    

30001379 <gmtime_r>:
gmtime_r():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:54


VISIBLE struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
30001379:	55                   	push   ebp
3000137a:	89 e5                	mov    ebp,esp
3000137c:	53                   	push   ebx
3000137d:	83 ec 10             	sub    esp,0x10
30001380:	e8 3b 0c 00 00       	call   30001fc0 <__x86.get_pc_thunk.bx>
30001385:	81 c3 d3 1f 00 00    	add    ebx,0x1fd3
/home/yogi/src/os/aproj/libChrisOS/src/time.c:55
  time_t time = *timer;
3000138b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000138e:	8b 00                	mov    eax,DWORD PTR [eax]
30001390:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:57
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;
30001393:	c7 45 f4 b2 07 00 00 	mov    DWORD PTR [ebp-0xc],0x7b2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:59

  dayclock = (unsigned long) time % SECS_DAY;
3000139a:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
3000139d:	ba 07 45 2e c2       	mov    edx,0xc22e4507
300013a2:	89 c8                	mov    eax,ecx
300013a4:	f7 e2                	mul    edx
300013a6:	89 d0                	mov    eax,edx
300013a8:	c1 e8 10             	shr    eax,0x10
300013ab:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
300013ae:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
300013b1:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
300013b7:	29 c1                	sub    ecx,eax
300013b9:	89 c8                	mov    eax,ecx
300013bb:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:60
  dayno = (unsigned long) time / SECS_DAY;
300013be:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
300013c1:	ba 07 45 2e c2       	mov    edx,0xc22e4507
300013c6:	f7 e2                	mul    edx
300013c8:	89 d0                	mov    eax,edx
300013ca:	c1 e8 10             	shr    eax,0x10
300013cd:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:62

  tmbuf->tm_sec = dayclock % 60;
300013d0:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
300013d3:	ba 89 88 88 88       	mov    edx,0x88888889
300013d8:	89 c8                	mov    eax,ecx
300013da:	f7 e2                	mul    edx
300013dc:	89 d0                	mov    eax,edx
300013de:	c1 e8 05             	shr    eax,0x5
300013e1:	89 c2                	mov    edx,eax
300013e3:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
300013ea:	89 c2                	mov    edx,eax
300013ec:	89 d0                	mov    eax,edx
300013ee:	c1 e0 04             	shl    eax,0x4
300013f1:	29 d0                	sub    eax,edx
300013f3:	29 c1                	sub    ecx,eax
300013f5:	89 c8                	mov    eax,ecx
300013f7:	89 c2                	mov    edx,eax
300013f9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300013fc:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:63
  tmbuf->tm_min = (dayclock % 3600) / 60;
300013fe:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
30001401:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
30001406:	89 c8                	mov    eax,ecx
30001408:	f7 e2                	mul    edx
3000140a:	89 d0                	mov    eax,edx
3000140c:	c1 e8 0b             	shr    eax,0xb
3000140f:	69 c0 10 0e 00 00    	imul   eax,eax,0xe10
30001415:	29 c1                	sub    ecx,eax
30001417:	89 c8                	mov    eax,ecx
30001419:	ba 89 88 88 88       	mov    edx,0x88888889
3000141e:	f7 e2                	mul    edx
30001420:	89 d0                	mov    eax,edx
30001422:	c1 e8 05             	shr    eax,0x5
30001425:	89 c2                	mov    edx,eax
30001427:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000142a:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:64
  tmbuf->tm_hour = dayclock / 3600;
3000142d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001430:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
30001435:	f7 e2                	mul    edx
30001437:	89 d0                	mov    eax,edx
30001439:	c1 e8 0b             	shr    eax,0xb
3000143c:	89 c2                	mov    edx,eax
3000143e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001441:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:65
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
30001444:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30001447:	8d 48 04             	lea    ecx,[eax+0x4]
3000144a:	ba 25 49 92 24       	mov    edx,0x24924925
3000144f:	89 c8                	mov    eax,ecx
30001451:	f7 e2                	mul    edx
30001453:	89 c8                	mov    eax,ecx
30001455:	29 d0                	sub    eax,edx
30001457:	d1 e8                	shr    eax,1
30001459:	01 d0                	add    eax,edx
3000145b:	c1 e8 02             	shr    eax,0x2
3000145e:	89 c2                	mov    edx,eax
30001460:	c1 e2 03             	shl    edx,0x3
30001463:	29 c2                	sub    edx,eax
30001465:	89 c8                	mov    eax,ecx
30001467:	29 d0                	sub    eax,edx
30001469:	89 c2                	mov    edx,eax
3000146b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000146e:	89 50 18             	mov    DWORD PTR [eax+0x18],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66
  while (dayno >= (unsigned long) YEARSIZE(year)) {
30001471:	eb 66                	jmp    300014d9 <gmtime_r+0x160>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67
    dayno -= YEARSIZE(year);
30001473:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001476:	83 e0 03             	and    eax,0x3
30001479:	85 c0                	test   eax,eax
3000147b:	75 50                	jne    300014cd <gmtime_r+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 1)
3000147d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001480:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001485:	89 c8                	mov    eax,ecx
30001487:	f7 ea                	imul   edx
30001489:	c1 fa 05             	sar    edx,0x5
3000148c:	89 c8                	mov    eax,ecx
3000148e:	c1 f8 1f             	sar    eax,0x1f
30001491:	29 c2                	sub    edx,eax
30001493:	89 d0                	mov    eax,edx
30001495:	6b c0 64             	imul   eax,eax,0x64
30001498:	29 c1                	sub    ecx,eax
3000149a:	89 c8                	mov    eax,ecx
3000149c:	85 c0                	test   eax,eax
3000149e:	75 26                	jne    300014c6 <gmtime_r+0x14d>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 4)
300014a0:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300014a3:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300014a8:	89 c8                	mov    eax,ecx
300014aa:	f7 ea                	imul   edx
300014ac:	c1 fa 07             	sar    edx,0x7
300014af:	89 c8                	mov    eax,ecx
300014b1:	c1 f8 1f             	sar    eax,0x1f
300014b4:	29 c2                	sub    edx,eax
300014b6:	89 d0                	mov    eax,edx
300014b8:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300014be:	29 c1                	sub    ecx,eax
300014c0:	89 c8                	mov    eax,ecx
300014c2:	85 c0                	test   eax,eax
300014c4:	75 07                	jne    300014cd <gmtime_r+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 5)
300014c6:	b8 6e 01 00 00       	mov    eax,0x16e
300014cb:	eb 05                	jmp    300014d2 <gmtime_r+0x159>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 6)
300014cd:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 8)
300014d2:	29 45 f8             	sub    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:68 (discriminator 8)
    year++;
300014d5:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
300014d9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300014dc:	83 e0 03             	and    eax,0x3
300014df:	85 c0                	test   eax,eax
300014e1:	75 50                	jne    30001533 <gmtime_r+0x1ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 1)
300014e3:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300014e6:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300014eb:	89 c8                	mov    eax,ecx
300014ed:	f7 ea                	imul   edx
300014ef:	c1 fa 05             	sar    edx,0x5
300014f2:	89 c8                	mov    eax,ecx
300014f4:	c1 f8 1f             	sar    eax,0x1f
300014f7:	29 c2                	sub    edx,eax
300014f9:	89 d0                	mov    eax,edx
300014fb:	6b c0 64             	imul   eax,eax,0x64
300014fe:	29 c1                	sub    ecx,eax
30001500:	89 c8                	mov    eax,ecx
30001502:	85 c0                	test   eax,eax
30001504:	75 26                	jne    3000152c <gmtime_r+0x1b3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 4)
30001506:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001509:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000150e:	89 c8                	mov    eax,ecx
30001510:	f7 ea                	imul   edx
30001512:	c1 fa 07             	sar    edx,0x7
30001515:	89 c8                	mov    eax,ecx
30001517:	c1 f8 1f             	sar    eax,0x1f
3000151a:	29 c2                	sub    edx,eax
3000151c:	89 d0                	mov    eax,edx
3000151e:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001524:	29 c1                	sub    ecx,eax
30001526:	89 c8                	mov    eax,ecx
30001528:	85 c0                	test   eax,eax
3000152a:	75 07                	jne    30001533 <gmtime_r+0x1ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 5)
3000152c:	b8 6e 01 00 00       	mov    eax,0x16e
30001531:	eb 05                	jmp    30001538 <gmtime_r+0x1bf>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 6)
30001533:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 8)
30001538:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
3000153b:	0f 86 32 ff ff ff    	jbe    30001473 <gmtime_r+0xfa>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:70
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
30001541:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001544:	8d 90 94 f8 ff ff    	lea    edx,[eax-0x76c]
3000154a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000154d:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:71
  tmbuf->tm_yday = dayno;
30001550:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30001553:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001556:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:72
  tmbuf->tm_mon = 0;
30001559:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000155c:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
30001563:	e9 89 00 00 00       	jmp    300015f1 <gmtime_r+0x278>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
30001568:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000156b:	83 e0 03             	and    eax,0x3
3000156e:	85 c0                	test   eax,eax
30001570:	75 50                	jne    300015c2 <gmtime_r+0x249>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 1)
30001572:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001575:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000157a:	89 c8                	mov    eax,ecx
3000157c:	f7 ea                	imul   edx
3000157e:	c1 fa 05             	sar    edx,0x5
30001581:	89 c8                	mov    eax,ecx
30001583:	c1 f8 1f             	sar    eax,0x1f
30001586:	29 c2                	sub    edx,eax
30001588:	89 d0                	mov    eax,edx
3000158a:	6b c0 64             	imul   eax,eax,0x64
3000158d:	29 c1                	sub    ecx,eax
3000158f:	89 c8                	mov    eax,ecx
30001591:	85 c0                	test   eax,eax
30001593:	75 26                	jne    300015bb <gmtime_r+0x242>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 4)
30001595:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001598:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000159d:	89 c8                	mov    eax,ecx
3000159f:	f7 ea                	imul   edx
300015a1:	c1 fa 07             	sar    edx,0x7
300015a4:	89 c8                	mov    eax,ecx
300015a6:	c1 f8 1f             	sar    eax,0x1f
300015a9:	29 c2                	sub    edx,eax
300015ab:	89 d0                	mov    eax,edx
300015ad:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300015b3:	29 c1                	sub    ecx,eax
300015b5:	89 c8                	mov    eax,ecx
300015b7:	85 c0                	test   eax,eax
300015b9:	75 07                	jne    300015c2 <gmtime_r+0x249>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 5)
300015bb:	ba 01 00 00 00       	mov    edx,0x1
300015c0:	eb 05                	jmp    300015c7 <gmtime_r+0x24e>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 6)
300015c2:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 8)
300015c7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300015ca:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
300015cd:	89 d0                	mov    eax,edx
300015cf:	01 c0                	add    eax,eax
300015d1:	01 d0                	add    eax,edx
300015d3:	c1 e0 02             	shl    eax,0x2
300015d6:	01 c8                	add    eax,ecx
300015d8:	8b 84 83 88 fc ff ff 	mov    eax,DWORD PTR [ebx+eax*4-0x378]
300015df:	29 45 f8             	sub    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:75 (discriminator 8)
    tmbuf->tm_mon++;
300015e2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300015e5:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
300015e8:	8d 50 01             	lea    edx,[eax+0x1]
300015eb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300015ee:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
300015f1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300015f4:	83 e0 03             	and    eax,0x3
300015f7:	85 c0                	test   eax,eax
300015f9:	75 50                	jne    3000164b <gmtime_r+0x2d2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 1)
300015fb:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300015fe:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001603:	89 c8                	mov    eax,ecx
30001605:	f7 ea                	imul   edx
30001607:	c1 fa 05             	sar    edx,0x5
3000160a:	89 c8                	mov    eax,ecx
3000160c:	c1 f8 1f             	sar    eax,0x1f
3000160f:	29 c2                	sub    edx,eax
30001611:	89 d0                	mov    eax,edx
30001613:	6b c0 64             	imul   eax,eax,0x64
30001616:	29 c1                	sub    ecx,eax
30001618:	89 c8                	mov    eax,ecx
3000161a:	85 c0                	test   eax,eax
3000161c:	75 26                	jne    30001644 <gmtime_r+0x2cb>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 4)
3000161e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001621:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001626:	89 c8                	mov    eax,ecx
30001628:	f7 ea                	imul   edx
3000162a:	c1 fa 07             	sar    edx,0x7
3000162d:	89 c8                	mov    eax,ecx
3000162f:	c1 f8 1f             	sar    eax,0x1f
30001632:	29 c2                	sub    edx,eax
30001634:	89 d0                	mov    eax,edx
30001636:	69 c0 90 01 00 00    	imul   eax,eax,0x190
3000163c:	29 c1                	sub    ecx,eax
3000163e:	89 c8                	mov    eax,ecx
30001640:	85 c0                	test   eax,eax
30001642:	75 07                	jne    3000164b <gmtime_r+0x2d2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 5)
30001644:	ba 01 00 00 00       	mov    edx,0x1
30001649:	eb 05                	jmp    30001650 <gmtime_r+0x2d7>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 6)
3000164b:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 8)
30001650:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001653:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
30001656:	89 d0                	mov    eax,edx
30001658:	01 c0                	add    eax,eax
3000165a:	01 d0                	add    eax,edx
3000165c:	c1 e0 02             	shl    eax,0x2
3000165f:	01 c8                	add    eax,ecx
30001661:	8b 84 83 88 fc ff ff 	mov    eax,DWORD PTR [ebx+eax*4-0x378]
30001668:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
3000166b:	0f 86 f7 fe ff ff    	jbe    30001568 <gmtime_r+0x1ef>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:77
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
30001671:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30001674:	83 c0 01             	add    eax,0x1
30001677:	89 c2                	mov    edx,eax
30001679:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000167c:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:78
  tmbuf->tm_isdst = 0;
3000167f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001682:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:79
  return tmbuf;
30001689:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:80
}
3000168c:	83 c4 10             	add    esp,0x10
3000168f:	5b                   	pop    ebx
30001690:	5d                   	pop    ebp
30001691:	c3                   	ret    

30001692 <localtime>:
localtime():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:82

VISIBLE struct tm *localtime(const time_t *timer) {
30001692:	55                   	push   ebp
30001693:	89 e5                	mov    ebp,esp
30001695:	53                   	push   ebx
30001696:	83 ec 34             	sub    esp,0x34
30001699:	e8 c8 08 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
3000169e:	05 ba 1c 00 00       	add    eax,0x1cba
/home/yogi/src/os/aproj/libChrisOS/src/time.c:86
  time_t t;
  struct tm tmbuf;
  
  t = *timer - libcTZ;
300016a3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
300016a6:	8b 0a                	mov    ecx,DWORD PTR [edx]
300016a8:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
300016ae:	8b 12                	mov    edx,DWORD PTR [edx]
300016b0:	29 d1                	sub    ecx,edx
300016b2:	89 ca                	mov    edx,ecx
300016b4:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:87
  return gmtime_r(&t, &tmbuf);
300016b7:	83 ec 08             	sub    esp,0x8
300016ba:	8d 55 c8             	lea    edx,[ebp-0x38]
300016bd:	52                   	push   edx
300016be:	8d 55 f4             	lea    edx,[ebp-0xc]
300016c1:	52                   	push   edx
300016c2:	89 c3                	mov    ebx,eax
300016c4:	e8 d7 08 00 00       	call   30001fa0 <__x86.get_pc_thunk.ax+0x3a>
300016c9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:88
}
300016cc:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300016cf:	c9                   	leave  
300016d0:	c3                   	ret    

300016d1 <localtime_r>:
localtime_r():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:90

VISIBLE struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
300016d1:	55                   	push   ebp
300016d2:	89 e5                	mov    ebp,esp
300016d4:	53                   	push   ebx
300016d5:	83 ec 14             	sub    esp,0x14
300016d8:	e8 89 08 00 00       	call   30001f66 <__x86.get_pc_thunk.ax>
300016dd:	05 7b 1c 00 00       	add    eax,0x1c7b
/home/yogi/src/os/aproj/libChrisOS/src/time.c:93
  time_t t;

  t = *timer - libcTZ;
300016e2:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
300016e5:	8b 0a                	mov    ecx,DWORD PTR [edx]
300016e7:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
300016ed:	8b 12                	mov    edx,DWORD PTR [edx]
300016ef:	29 d1                	sub    ecx,edx
300016f1:	89 ca                	mov    edx,ecx
300016f3:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:94
  return gmtime_r(&t, tmbuf);
300016f6:	83 ec 08             	sub    esp,0x8
300016f9:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
300016fc:	8d 55 f4             	lea    edx,[ebp-0xc]
300016ff:	52                   	push   edx
30001700:	89 c3                	mov    ebx,eax
30001702:	e8 99 08 00 00       	call   30001fa0 <__x86.get_pc_thunk.ax+0x3a>
30001707:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:95
}
3000170a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
3000170d:	c9                   	leave  
3000170e:	c3                   	ret    

3000170f <mktime>:
mktime():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:97

VISIBLE time_t mktime(struct tm *tmbuf) {
3000170f:	55                   	push   ebp
30001710:	89 e5                	mov    ebp,esp
30001712:	57                   	push   edi
30001713:	56                   	push   esi
30001714:	53                   	push   ebx
30001715:	83 ec 20             	sub    esp,0x20
30001718:	e8 ab 08 00 00       	call   30001fc8 <__x86.get_pc_thunk.cx>
3000171d:	81 c1 3b 1c 00 00    	add    ecx,0x1c3b
/home/yogi/src/os/aproj/libChrisOS/src/time.c:105
  int yday, month;
  long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
30001723:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001726:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
30001729:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000172c:	8b 18                	mov    ebx,DWORD PTR [eax]
3000172e:	ba 89 88 88 88       	mov    edx,0x88888889
30001733:	89 d8                	mov    eax,ebx
30001735:	f7 ea                	imul   edx
30001737:	8d 04 1a             	lea    eax,[edx+ebx*1]
3000173a:	c1 f8 05             	sar    eax,0x5
3000173d:	89 c2                	mov    edx,eax
3000173f:	89 d8                	mov    eax,ebx
30001741:	c1 f8 1f             	sar    eax,0x1f
30001744:	29 c2                	sub    edx,eax
30001746:	89 d0                	mov    eax,edx
30001748:	8d 14 06             	lea    edx,[esi+eax*1]
3000174b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000174e:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:106
  tmbuf->tm_sec %= 60;
30001751:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001754:	8b 18                	mov    ebx,DWORD PTR [eax]
30001756:	ba 89 88 88 88       	mov    edx,0x88888889
3000175b:	89 d8                	mov    eax,ebx
3000175d:	f7 ea                	imul   edx
3000175f:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001762:	c1 f8 05             	sar    eax,0x5
30001765:	89 c2                	mov    edx,eax
30001767:	89 d8                	mov    eax,ebx
30001769:	c1 f8 1f             	sar    eax,0x1f
3000176c:	29 c2                	sub    edx,eax
3000176e:	89 d0                	mov    eax,edx
30001770:	89 c2                	mov    edx,eax
30001772:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
30001779:	89 c2                	mov    edx,eax
3000177b:	89 d0                	mov    eax,edx
3000177d:	c1 e0 04             	shl    eax,0x4
30001780:	29 d0                	sub    eax,edx
30001782:	29 c3                	sub    ebx,eax
30001784:	89 d8                	mov    eax,ebx
30001786:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001789:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:107
  if (tmbuf->tm_sec < 0) {
3000178b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000178e:	8b 00                	mov    eax,DWORD PTR [eax]
30001790:	85 c0                	test   eax,eax
30001792:	79 1c                	jns    300017b0 <mktime+0xa1>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:108
    tmbuf->tm_sec += 60;
30001794:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001797:	8b 00                	mov    eax,DWORD PTR [eax]
30001799:	8d 50 3c             	lea    edx,[eax+0x3c]
3000179c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000179f:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:109
    tmbuf->tm_min--;
300017a1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017a4:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
300017a7:	8d 50 ff             	lea    edx,[eax-0x1]
300017aa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017ad:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
300017b0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017b3:	8b 70 08             	mov    esi,DWORD PTR [eax+0x8]
300017b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017b9:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
300017bc:	ba 89 88 88 88       	mov    edx,0x88888889
300017c1:	89 d8                	mov    eax,ebx
300017c3:	f7 ea                	imul   edx
300017c5:	8d 04 1a             	lea    eax,[edx+ebx*1]
300017c8:	c1 f8 05             	sar    eax,0x5
300017cb:	89 c2                	mov    edx,eax
300017cd:	89 d8                	mov    eax,ebx
300017cf:	c1 f8 1f             	sar    eax,0x1f
300017d2:	29 c2                	sub    edx,eax
300017d4:	89 d0                	mov    eax,edx
300017d6:	8d 14 06             	lea    edx,[esi+eax*1]
300017d9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017dc:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:112
  tmbuf->tm_min = tmbuf->tm_min % 60;
300017df:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017e2:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
300017e5:	ba 89 88 88 88       	mov    edx,0x88888889
300017ea:	89 d8                	mov    eax,ebx
300017ec:	f7 ea                	imul   edx
300017ee:	8d 04 1a             	lea    eax,[edx+ebx*1]
300017f1:	c1 f8 05             	sar    eax,0x5
300017f4:	89 c2                	mov    edx,eax
300017f6:	89 d8                	mov    eax,ebx
300017f8:	c1 f8 1f             	sar    eax,0x1f
300017fb:	29 c2                	sub    edx,eax
300017fd:	89 d0                	mov    eax,edx
300017ff:	89 c2                	mov    edx,eax
30001801:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
30001808:	89 c2                	mov    edx,eax
3000180a:	89 d0                	mov    eax,edx
3000180c:	c1 e0 04             	shl    eax,0x4
3000180f:	29 d0                	sub    eax,edx
30001811:	29 c3                	sub    ebx,eax
30001813:	89 d8                	mov    eax,ebx
30001815:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001818:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113
  if (tmbuf->tm_min < 0) {
3000181b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000181e:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001821:	85 c0                	test   eax,eax
30001823:	79 1e                	jns    30001843 <mktime+0x134>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114
    tmbuf->tm_min += 60;
30001825:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001828:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
3000182b:	8d 50 3c             	lea    edx,[eax+0x3c]
3000182e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001831:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:115
    tmbuf->tm_hour--;
30001834:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001837:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
3000183a:	8d 50 ff             	lea    edx,[eax-0x1]
3000183d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001840:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:117
  }
  day = tmbuf->tm_hour / 24;
30001843:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001846:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
30001849:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
3000184e:	89 d8                	mov    eax,ebx
30001850:	f7 ea                	imul   edx
30001852:	c1 fa 02             	sar    edx,0x2
30001855:	89 d8                	mov    eax,ebx
30001857:	c1 f8 1f             	sar    eax,0x1f
3000185a:	29 c2                	sub    edx,eax
3000185c:	89 d0                	mov    eax,edx
3000185e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:118
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
30001861:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001864:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
30001867:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
3000186c:	89 d8                	mov    eax,ebx
3000186e:	f7 ea                	imul   edx
30001870:	c1 fa 02             	sar    edx,0x2
30001873:	89 d8                	mov    eax,ebx
30001875:	c1 f8 1f             	sar    eax,0x1f
30001878:	29 c2                	sub    edx,eax
3000187a:	89 d0                	mov    eax,edx
3000187c:	01 c0                	add    eax,eax
3000187e:	01 d0                	add    eax,edx
30001880:	c1 e0 03             	shl    eax,0x3
30001883:	29 c3                	sub    ebx,eax
30001885:	89 da                	mov    edx,ebx
30001887:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000188a:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:119
  if (tmbuf->tm_hour < 0) {
3000188d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001890:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30001893:	85 c0                	test   eax,eax
30001895:	79 13                	jns    300018aa <mktime+0x19b>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:120
    tmbuf->tm_hour += 24;
30001897:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000189a:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
3000189d:	8d 50 18             	lea    edx,[eax+0x18]
300018a0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018a3:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:121
    day--;
300018a6:	83 6d f0 01          	sub    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:123
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
300018aa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018ad:	8b 70 14             	mov    esi,DWORD PTR [eax+0x14]
300018b0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018b3:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
300018b6:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
300018bb:	89 d8                	mov    eax,ebx
300018bd:	f7 ea                	imul   edx
300018bf:	d1 fa                	sar    edx,1
300018c1:	89 d8                	mov    eax,ebx
300018c3:	c1 f8 1f             	sar    eax,0x1f
300018c6:	29 c2                	sub    edx,eax
300018c8:	89 d0                	mov    eax,edx
300018ca:	8d 14 06             	lea    edx,[esi+eax*1]
300018cd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018d0:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:124
  tmbuf->tm_mon %= 12;
300018d3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018d6:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
300018d9:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
300018de:	89 d8                	mov    eax,ebx
300018e0:	f7 ea                	imul   edx
300018e2:	d1 fa                	sar    edx,1
300018e4:	89 d8                	mov    eax,ebx
300018e6:	c1 f8 1f             	sar    eax,0x1f
300018e9:	29 c2                	sub    edx,eax
300018eb:	89 d0                	mov    eax,edx
300018ed:	01 c0                	add    eax,eax
300018ef:	01 d0                	add    eax,edx
300018f1:	c1 e0 02             	shl    eax,0x2
300018f4:	29 c3                	sub    ebx,eax
300018f6:	89 da                	mov    edx,ebx
300018f8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018fb:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:125
  if (tmbuf->tm_mon < 0) {
300018fe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001901:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001904:	85 c0                	test   eax,eax
30001906:	79 1e                	jns    30001926 <mktime+0x217>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:126
    tmbuf->tm_mon += 12;
30001908:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000190b:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
3000190e:	8d 50 0c             	lea    edx,[eax+0xc]
30001911:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001914:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:127
    tmbuf->tm_year--;
30001917:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000191a:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
3000191d:	8d 50 ff             	lea    edx,[eax-0x1]
30001920:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001923:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:129
  }
  day += (tmbuf->tm_mday - 1);
30001926:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001929:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
3000192c:	83 e8 01             	sub    eax,0x1
3000192f:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:130
  while (day < 0) {
30001932:	e9 c1 00 00 00       	jmp    300019f8 <mktime+0x2e9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:131
    if(--tmbuf->tm_mon < 0) {
30001937:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000193a:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
3000193d:	8d 50 ff             	lea    edx,[eax-0x1]
30001940:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001943:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
30001946:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001949:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
3000194c:	85 c0                	test   eax,eax
3000194e:	79 19                	jns    30001969 <mktime+0x25a>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:132
      tmbuf->tm_year--;
30001950:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001953:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001956:	8d 50 ff             	lea    edx,[eax-0x1]
30001959:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000195c:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:133
      tmbuf->tm_mon = 11;
3000195f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001962:	c7 40 10 0b 00 00 00 	mov    DWORD PTR [eax+0x10],0xb
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
30001969:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000196c:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
3000196f:	83 e0 03             	and    eax,0x3
30001972:	85 c0                	test   eax,eax
30001974:	75 62                	jne    300019d8 <mktime+0x2c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 1)
30001976:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001979:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
3000197c:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001982:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001987:	89 d8                	mov    eax,ebx
30001989:	f7 ea                	imul   edx
3000198b:	c1 fa 05             	sar    edx,0x5
3000198e:	89 d8                	mov    eax,ebx
30001990:	c1 f8 1f             	sar    eax,0x1f
30001993:	29 c2                	sub    edx,eax
30001995:	89 d0                	mov    eax,edx
30001997:	6b c0 64             	imul   eax,eax,0x64
3000199a:	29 c3                	sub    ebx,eax
3000199c:	89 d8                	mov    eax,ebx
3000199e:	85 c0                	test   eax,eax
300019a0:	75 2f                	jne    300019d1 <mktime+0x2c2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 4)
300019a2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300019a5:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
300019a8:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
300019ae:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300019b3:	89 d8                	mov    eax,ebx
300019b5:	f7 ea                	imul   edx
300019b7:	c1 fa 07             	sar    edx,0x7
300019ba:	89 d8                	mov    eax,ebx
300019bc:	c1 f8 1f             	sar    eax,0x1f
300019bf:	29 c2                	sub    edx,eax
300019c1:	89 d0                	mov    eax,edx
300019c3:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300019c9:	29 c3                	sub    ebx,eax
300019cb:	89 d8                	mov    eax,ebx
300019cd:	85 c0                	test   eax,eax
300019cf:	75 07                	jne    300019d8 <mktime+0x2c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 5)
300019d1:	ba 01 00 00 00       	mov    edx,0x1
300019d6:	eb 05                	jmp    300019dd <mktime+0x2ce>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 6)
300019d8:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 8)
300019dd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300019e0:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
300019e3:	89 d0                	mov    eax,edx
300019e5:	01 c0                	add    eax,eax
300019e7:	01 d0                	add    eax,edx
300019e9:	c1 e0 02             	shl    eax,0x2
300019ec:	01 d8                	add    eax,ebx
300019ee:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
300019f5:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:130
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
300019f8:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
300019fc:	0f 88 35 ff ff ff    	js     30001937 <mktime+0x228>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
30001a02:	e9 c2 00 00 00       	jmp    30001ac9 <mktime+0x3ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
30001a07:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a0a:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001a0d:	83 e0 03             	and    eax,0x3
30001a10:	85 c0                	test   eax,eax
30001a12:	75 62                	jne    30001a76 <mktime+0x367>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 1)
30001a14:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a17:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001a1a:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001a20:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001a25:	89 d8                	mov    eax,ebx
30001a27:	f7 ea                	imul   edx
30001a29:	c1 fa 05             	sar    edx,0x5
30001a2c:	89 d8                	mov    eax,ebx
30001a2e:	c1 f8 1f             	sar    eax,0x1f
30001a31:	29 c2                	sub    edx,eax
30001a33:	89 d0                	mov    eax,edx
30001a35:	6b c0 64             	imul   eax,eax,0x64
30001a38:	29 c3                	sub    ebx,eax
30001a3a:	89 d8                	mov    eax,ebx
30001a3c:	85 c0                	test   eax,eax
30001a3e:	75 2f                	jne    30001a6f <mktime+0x360>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 4)
30001a40:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a43:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001a46:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001a4c:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001a51:	89 d8                	mov    eax,ebx
30001a53:	f7 ea                	imul   edx
30001a55:	c1 fa 07             	sar    edx,0x7
30001a58:	89 d8                	mov    eax,ebx
30001a5a:	c1 f8 1f             	sar    eax,0x1f
30001a5d:	29 c2                	sub    edx,eax
30001a5f:	89 d0                	mov    eax,edx
30001a61:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001a67:	29 c3                	sub    ebx,eax
30001a69:	89 d8                	mov    eax,ebx
30001a6b:	85 c0                	test   eax,eax
30001a6d:	75 07                	jne    30001a76 <mktime+0x367>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 5)
30001a6f:	ba 01 00 00 00       	mov    edx,0x1
30001a74:	eb 05                	jmp    30001a7b <mktime+0x36c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 6)
30001a76:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 8)
30001a7b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a7e:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001a81:	89 d0                	mov    eax,edx
30001a83:	01 c0                	add    eax,eax
30001a85:	01 d0                	add    eax,edx
30001a87:	c1 e0 02             	shl    eax,0x2
30001a8a:	01 d8                	add    eax,ebx
30001a8c:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
30001a93:	29 45 f0             	sub    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 8)
    if (++(tmbuf->tm_mon) == 12) {
30001a96:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a99:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001a9c:	8d 50 01             	lea    edx,[eax+0x1]
30001a9f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001aa2:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
30001aa5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001aa8:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001aab:	83 f8 0c             	cmp    eax,0xc
30001aae:	75 19                	jne    30001ac9 <mktime+0x3ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:140
      tmbuf->tm_mon = 0;
30001ab0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ab3:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:141
      tmbuf->tm_year++;
30001aba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001abd:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001ac0:	8d 50 01             	lea    edx,[eax+0x1]
30001ac3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ac6:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
30001ac9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001acc:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001acf:	83 e0 03             	and    eax,0x3
30001ad2:	85 c0                	test   eax,eax
30001ad4:	75 62                	jne    30001b38 <mktime+0x429>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 1)
30001ad6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ad9:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001adc:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001ae2:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001ae7:	89 d8                	mov    eax,ebx
30001ae9:	f7 ea                	imul   edx
30001aeb:	c1 fa 05             	sar    edx,0x5
30001aee:	89 d8                	mov    eax,ebx
30001af0:	c1 f8 1f             	sar    eax,0x1f
30001af3:	29 c2                	sub    edx,eax
30001af5:	89 d0                	mov    eax,edx
30001af7:	6b c0 64             	imul   eax,eax,0x64
30001afa:	29 c3                	sub    ebx,eax
30001afc:	89 d8                	mov    eax,ebx
30001afe:	85 c0                	test   eax,eax
30001b00:	75 2f                	jne    30001b31 <mktime+0x422>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 4)
30001b02:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b05:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001b08:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001b0e:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001b13:	89 d8                	mov    eax,ebx
30001b15:	f7 ea                	imul   edx
30001b17:	c1 fa 07             	sar    edx,0x7
30001b1a:	89 d8                	mov    eax,ebx
30001b1c:	c1 f8 1f             	sar    eax,0x1f
30001b1f:	29 c2                	sub    edx,eax
30001b21:	89 d0                	mov    eax,edx
30001b23:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001b29:	29 c3                	sub    ebx,eax
30001b2b:	89 d8                	mov    eax,ebx
30001b2d:	85 c0                	test   eax,eax
30001b2f:	75 07                	jne    30001b38 <mktime+0x429>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 5)
30001b31:	ba 01 00 00 00       	mov    edx,0x1
30001b36:	eb 05                	jmp    30001b3d <mktime+0x42e>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 6)
30001b38:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 8)
30001b3d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b40:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001b43:	89 d0                	mov    eax,edx
30001b45:	01 c0                	add    eax,eax
30001b47:	01 d0                	add    eax,edx
30001b49:	c1 e0 02             	shl    eax,0x2
30001b4c:	01 d8                	add    eax,ebx
30001b4e:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
30001b55:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30001b58:	0f 8e a9 fe ff ff    	jle    30001a07 <mktime+0x2f8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:144
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
30001b5e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001b61:	8d 50 01             	lea    edx,[eax+0x1]
30001b64:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b67:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:145
  year = EPOCH_YR;
30001b6a:	c7 45 dc b2 07 00 00 	mov    DWORD PTR [ebp-0x24],0x7b2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:146
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
30001b71:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b74:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001b77:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
30001b7a:	81 ea 6c 07 00 00    	sub    edx,0x76c
30001b80:	39 d0                	cmp    eax,edx
30001b82:	7d 0a                	jge    30001b8e <mktime+0x47f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:146 (discriminator 1)
30001b84:	b8 19 fc ff ff       	mov    eax,0xfffffc19
30001b89:	e9 d0 03 00 00       	jmp    30001f5e <mktime+0x84f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:147
  seconds = 0;
30001b8e:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:148
  day = 0;                      // Means days since day 0 now
30001b95:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:149
  overflow = 0;
30001b9c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:156
  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;
30001ba3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ba6:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001ba9:	05 6c 07 00 00       	add    eax,0x76c
30001bae:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:158

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
30001bb1:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001bb4:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001bb7:	3d 7c c6 59 00       	cmp    eax,0x59c67c
30001bbc:	7e 07                	jle    30001bc5 <mktime+0x4b6>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:158 (discriminator 1)
30001bbe:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:159
  day = (tm_year - year) * 365;
30001bc5:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001bc8:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001bcb:	69 c0 6d 01 00 00    	imul   eax,eax,0x16d
30001bd1:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:160
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
30001bd4:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
30001bd9:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
30001bdc:	89 c2                	mov    edx,eax
30001bde:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001be1:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001be4:	8d 58 03             	lea    ebx,[eax+0x3]
30001be7:	85 c0                	test   eax,eax
30001be9:	0f 48 c3             	cmovs  eax,ebx
30001bec:	c1 f8 02             	sar    eax,0x2
30001bef:	83 c0 01             	add    eax,0x1
30001bf2:	39 c2                	cmp    edx,eax
30001bf4:	7d 04                	jge    30001bfa <mktime+0x4eb>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:160 (discriminator 1)
30001bf6:	83 4d e4 02          	or     DWORD PTR [ebp-0x1c],0x2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
30001bfa:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001bfd:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001c00:	8d 50 03             	lea    edx,[eax+0x3]
30001c03:	85 c0                	test   eax,eax
30001c05:	0f 48 c2             	cmovs  eax,edx
30001c08:	c1 f8 02             	sar    eax,0x2
30001c0b:	89 c3                	mov    ebx,eax
30001c0d:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c10:	83 e0 03             	and    eax,0x3
30001c13:	85 c0                	test   eax,eax
30001c15:	74 29                	je     30001c40 <mktime+0x531>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 1)
30001c17:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c1a:	99                   	cdq    
30001c1b:	c1 ea 1e             	shr    edx,0x1e
30001c1e:	01 d0                	add    eax,edx
30001c20:	83 e0 03             	and    eax,0x3
30001c23:	29 d0                	sub    eax,edx
30001c25:	89 c6                	mov    esi,eax
30001c27:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
30001c2a:	99                   	cdq    
30001c2b:	c1 ea 1e             	shr    edx,0x1e
30001c2e:	01 d0                	add    eax,edx
30001c30:	83 e0 03             	and    eax,0x3
30001c33:	29 d0                	sub    eax,edx
30001c35:	39 c6                	cmp    esi,eax
30001c37:	7d 07                	jge    30001c40 <mktime+0x531>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 3)
30001c39:	b8 01 00 00 00       	mov    eax,0x1
30001c3e:	eb 05                	jmp    30001c45 <mktime+0x536>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 4)
30001c40:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 6)
30001c45:	01 d8                	add    eax,ebx
30001c47:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 6)
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
30001c4a:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c4d:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001c50:	89 c3                	mov    ebx,eax
30001c52:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001c57:	89 d8                	mov    eax,ebx
30001c59:	f7 ea                	imul   edx
30001c5b:	c1 fa 05             	sar    edx,0x5
30001c5e:	89 d8                	mov    eax,ebx
30001c60:	c1 f8 1f             	sar    eax,0x1f
30001c63:	89 d7                	mov    edi,edx
30001c65:	29 c7                	sub    edi,eax
30001c67:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001c6a:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001c6f:	89 d8                	mov    eax,ebx
30001c71:	f7 ea                	imul   edx
30001c73:	c1 fa 05             	sar    edx,0x5
30001c76:	89 d8                	mov    eax,ebx
30001c78:	c1 f8 1f             	sar    eax,0x1f
30001c7b:	29 c2                	sub    edx,eax
30001c7d:	89 d0                	mov    eax,edx
30001c7f:	6b c0 64             	imul   eax,eax,0x64
30001c82:	29 c3                	sub    ebx,eax
30001c84:	89 d8                	mov    eax,ebx
30001c86:	85 c0                	test   eax,eax
30001c88:	74 49                	je     30001cd3 <mktime+0x5c4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 1)
30001c8a:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001c8d:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001c92:	89 d8                	mov    eax,ebx
30001c94:	f7 ea                	imul   edx
30001c96:	c1 fa 05             	sar    edx,0x5
30001c99:	89 d8                	mov    eax,ebx
30001c9b:	c1 f8 1f             	sar    eax,0x1f
30001c9e:	89 d6                	mov    esi,edx
30001ca0:	29 c6                	sub    esi,eax
30001ca2:	6b c6 64             	imul   eax,esi,0x64
30001ca5:	89 de                	mov    esi,ebx
30001ca7:	29 c6                	sub    esi,eax
30001ca9:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
30001cac:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001cb1:	89 d8                	mov    eax,ebx
30001cb3:	f7 ea                	imul   edx
30001cb5:	c1 fa 05             	sar    edx,0x5
30001cb8:	89 d8                	mov    eax,ebx
30001cba:	c1 f8 1f             	sar    eax,0x1f
30001cbd:	29 c2                	sub    edx,eax
30001cbf:	89 d0                	mov    eax,edx
30001cc1:	6b c0 64             	imul   eax,eax,0x64
30001cc4:	29 c3                	sub    ebx,eax
30001cc6:	89 d8                	mov    eax,ebx
30001cc8:	39 c6                	cmp    esi,eax
30001cca:	7d 07                	jge    30001cd3 <mktime+0x5c4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 3)
30001ccc:	b8 01 00 00 00       	mov    eax,0x1
30001cd1:	eb 05                	jmp    30001cd8 <mktime+0x5c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 4)
30001cd3:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 6)
30001cd8:	01 f8                	add    eax,edi
30001cda:	29 45 f0             	sub    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 6)
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);
30001cdd:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001ce0:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001ce3:	89 c3                	mov    ebx,eax
30001ce5:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001cea:	89 d8                	mov    eax,ebx
30001cec:	f7 ea                	imul   edx
30001cee:	c1 fa 07             	sar    edx,0x7
30001cf1:	89 d8                	mov    eax,ebx
30001cf3:	c1 f8 1f             	sar    eax,0x1f
30001cf6:	89 d7                	mov    edi,edx
30001cf8:	29 c7                	sub    edi,eax
30001cfa:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001cfd:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d02:	89 d8                	mov    eax,ebx
30001d04:	f7 ea                	imul   edx
30001d06:	c1 fa 07             	sar    edx,0x7
30001d09:	89 d8                	mov    eax,ebx
30001d0b:	c1 f8 1f             	sar    eax,0x1f
30001d0e:	29 c2                	sub    edx,eax
30001d10:	89 d0                	mov    eax,edx
30001d12:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001d18:	29 c3                	sub    ebx,eax
30001d1a:	89 d8                	mov    eax,ebx
30001d1c:	85 c0                	test   eax,eax
30001d1e:	74 4f                	je     30001d6f <mktime+0x660>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 1)
30001d20:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001d23:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d28:	89 d8                	mov    eax,ebx
30001d2a:	f7 ea                	imul   edx
30001d2c:	c1 fa 07             	sar    edx,0x7
30001d2f:	89 d8                	mov    eax,ebx
30001d31:	c1 f8 1f             	sar    eax,0x1f
30001d34:	89 d6                	mov    esi,edx
30001d36:	29 c6                	sub    esi,eax
30001d38:	69 c6 90 01 00 00    	imul   eax,esi,0x190
30001d3e:	89 de                	mov    esi,ebx
30001d40:	29 c6                	sub    esi,eax
30001d42:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
30001d45:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d4a:	89 d8                	mov    eax,ebx
30001d4c:	f7 ea                	imul   edx
30001d4e:	c1 fa 07             	sar    edx,0x7
30001d51:	89 d8                	mov    eax,ebx
30001d53:	c1 f8 1f             	sar    eax,0x1f
30001d56:	29 c2                	sub    edx,eax
30001d58:	89 d0                	mov    eax,edx
30001d5a:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001d60:	29 c3                	sub    ebx,eax
30001d62:	89 d8                	mov    eax,ebx
30001d64:	39 c6                	cmp    esi,eax
30001d66:	7d 07                	jge    30001d6f <mktime+0x660>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 3)
30001d68:	b8 01 00 00 00       	mov    eax,0x1
30001d6d:	eb 05                	jmp    30001d74 <mktime+0x665>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 4)
30001d6f:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 6)
30001d74:	01 f8                	add    eax,edi
30001d76:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:165 (discriminator 6)

  yday = month = 0;
30001d79:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
30001d80:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30001d83:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:166 (discriminator 6)
  while (month < tmbuf->tm_mon) {
30001d86:	eb 7b                	jmp    30001e03 <mktime+0x6f4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167
    yday += _ytab[LEAPYEAR(tm_year)][month];
30001d88:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001d8b:	83 e0 03             	and    eax,0x3
30001d8e:	85 c0                	test   eax,eax
30001d90:	75 50                	jne    30001de2 <mktime+0x6d3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 1)
30001d92:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001d95:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d9a:	89 d8                	mov    eax,ebx
30001d9c:	f7 ea                	imul   edx
30001d9e:	c1 fa 05             	sar    edx,0x5
30001da1:	89 d8                	mov    eax,ebx
30001da3:	c1 f8 1f             	sar    eax,0x1f
30001da6:	29 c2                	sub    edx,eax
30001da8:	89 d0                	mov    eax,edx
30001daa:	6b c0 64             	imul   eax,eax,0x64
30001dad:	29 c3                	sub    ebx,eax
30001daf:	89 d8                	mov    eax,ebx
30001db1:	85 c0                	test   eax,eax
30001db3:	75 26                	jne    30001ddb <mktime+0x6cc>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 4)
30001db5:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001db8:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001dbd:	89 d8                	mov    eax,ebx
30001dbf:	f7 ea                	imul   edx
30001dc1:	c1 fa 07             	sar    edx,0x7
30001dc4:	89 d8                	mov    eax,ebx
30001dc6:	c1 f8 1f             	sar    eax,0x1f
30001dc9:	29 c2                	sub    edx,eax
30001dcb:	89 d0                	mov    eax,edx
30001dcd:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001dd3:	29 c3                	sub    ebx,eax
30001dd5:	89 d8                	mov    eax,ebx
30001dd7:	85 c0                	test   eax,eax
30001dd9:	75 07                	jne    30001de2 <mktime+0x6d3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 5)
30001ddb:	ba 01 00 00 00       	mov    edx,0x1
30001de0:	eb 05                	jmp    30001de7 <mktime+0x6d8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 6)
30001de2:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 8)
30001de7:	89 d0                	mov    eax,edx
30001de9:	01 c0                	add    eax,eax
30001deb:	01 d0                	add    eax,edx
30001ded:	c1 e0 02             	shl    eax,0x2
30001df0:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
30001df3:	01 d0                	add    eax,edx
30001df5:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
30001dfc:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:168 (discriminator 8)
    month++;
30001dff:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:166
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
30001e03:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e06:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001e09:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
30001e0c:	0f 8f 76 ff ff ff    	jg     30001d88 <mktime+0x679>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:170
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
30001e12:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e15:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
30001e18:	83 e8 01             	sub    eax,0x1
30001e1b:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:171
  if (day + yday < 0) overflow|=4;
30001e1e:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
30001e21:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001e24:	01 d0                	add    eax,edx
30001e26:	85 c0                	test   eax,eax
30001e28:	79 04                	jns    30001e2e <mktime+0x71f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:171 (discriminator 1)
30001e2a:	83 4d e4 04          	or     DWORD PTR [ebp-0x1c],0x4
/home/yogi/src/os/aproj/libChrisOS/src/time.c:172
  day += yday;
30001e2e:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001e31:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:174

  tmbuf->tm_yday = yday;
30001e34:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e37:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30001e3a:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:175
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)
30001e3d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001e40:	8d 58 04             	lea    ebx,[eax+0x4]
30001e43:	ba 93 24 49 92       	mov    edx,0x92492493
30001e48:	89 d8                	mov    eax,ebx
30001e4a:	f7 ea                	imul   edx
30001e4c:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001e4f:	c1 f8 02             	sar    eax,0x2
30001e52:	89 c2                	mov    edx,eax
30001e54:	89 d8                	mov    eax,ebx
30001e56:	c1 f8 1f             	sar    eax,0x1f
30001e59:	29 c2                	sub    edx,eax
30001e5b:	89 d0                	mov    eax,edx
30001e5d:	89 c2                	mov    edx,eax
30001e5f:	c1 e2 03             	shl    edx,0x3
30001e62:	29 c2                	sub    edx,eax
30001e64:	89 d8                	mov    eax,ebx
30001e66:	29 d0                	sub    eax,edx
30001e68:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001e6b:	89 42 18             	mov    DWORD PTR [edx+0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:177

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;
30001e6e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e71:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30001e74:	c1 e0 02             	shl    eax,0x2
30001e77:	89 c2                	mov    edx,eax
30001e79:	c1 e2 04             	shl    edx,0x4
30001e7c:	29 c2                	sub    edx,eax
30001e7e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e81:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001e84:	01 d0                	add    eax,edx
30001e86:	c1 e0 02             	shl    eax,0x2
30001e89:	89 c2                	mov    edx,eax
30001e8b:	c1 e2 04             	shl    edx,0x4
30001e8e:	29 c2                	sub    edx,eax
30001e90:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e93:	8b 00                	mov    eax,DWORD PTR [eax]
30001e95:	01 d0                	add    eax,edx
30001e97:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:179

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
30001e9a:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
30001e9f:	2b 45 d8             	sub    eax,DWORD PTR [ebp-0x28]
30001ea2:	89 c3                	mov    ebx,eax
30001ea4:	ba 07 45 2e c2       	mov    edx,0xc22e4507
30001ea9:	89 d8                	mov    eax,ebx
30001eab:	f7 ea                	imul   edx
30001ead:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001eb0:	c1 f8 10             	sar    eax,0x10
30001eb3:	89 c2                	mov    edx,eax
30001eb5:	89 d8                	mov    eax,ebx
30001eb7:	c1 f8 1f             	sar    eax,0x1f
30001eba:	29 c2                	sub    edx,eax
30001ebc:	89 d0                	mov    eax,edx
30001ebe:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30001ec1:	7d 04                	jge    30001ec7 <mktime+0x7b8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:179 (discriminator 1)
30001ec3:	83 4d e4 08          	or     DWORD PTR [ebp-0x1c],0x8
/home/yogi/src/os/aproj/libChrisOS/src/time.c:180
  seconds += day * SECS_DAY;
30001ec7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001eca:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
30001ed0:	01 45 d8             	add    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:183

  // Now adjust according to timezone and daylight saving time
  if (((libcTZ > 0) && (TIME_MAX - libcTZ < seconds)) || 
30001ed3:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001ed9:	8b 00                	mov    eax,DWORD PTR [eax]
30001edb:	85 c0                	test   eax,eax
30001edd:	7e 16                	jle    30001ef5 <mktime+0x7e6>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:183 (discriminator 1)
30001edf:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001ee5:	8b 00                	mov    eax,DWORD PTR [eax]
30001ee7:	ba ff ff ff 7f       	mov    edx,0x7fffffff
30001eec:	29 c2                	sub    edx,eax
30001eee:	89 d0                	mov    eax,edx
30001ef0:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
30001ef3:	7c 1b                	jl     30001f10 <mktime+0x801>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:184 (discriminator 3)
      ((libcTZ < 0) && (seconds < -libcTZ))) {
30001ef5:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001efb:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:183 (discriminator 3)

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
  seconds += day * SECS_DAY;

  // Now adjust according to timezone and daylight saving time
  if (((libcTZ > 0) && (TIME_MAX - libcTZ < seconds)) || 
30001efd:	85 c0                	test   eax,eax
30001eff:	79 13                	jns    30001f14 <mktime+0x805>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:184
      ((libcTZ < 0) && (seconds < -libcTZ))) {
30001f01:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001f07:	8b 00                	mov    eax,DWORD PTR [eax]
30001f09:	f7 d8                	neg    eax
30001f0b:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
30001f0e:	7e 04                	jle    30001f14 <mktime+0x805>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:185
          overflow|=16;
30001f10:	83 4d e4 10          	or     DWORD PTR [ebp-0x1c],0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:187
  }
  seconds += libcTZ;
30001f14:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001f1a:	8b 00                	mov    eax,DWORD PTR [eax]
30001f1c:	01 45 d8             	add    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:189

  if (tmbuf->tm_isdst) {
30001f1f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f22:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
30001f25:	85 c0                	test   eax,eax
30001f27:	74 0b                	je     30001f34 <mktime+0x825>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:190
    dst = _dstbias;
30001f29:	8b 81 04 01 00 00    	mov    eax,DWORD PTR [ecx+0x104]
30001f2f:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
30001f32:	eb 07                	jmp    30001f3b <mktime+0x82c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:192
  } else {
    dst = 0;
30001f34:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:195
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
30001f3b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
30001f3e:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
30001f41:	7e 04                	jle    30001f47 <mktime+0x838>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:195 (discriminator 1)
30001f43:	83 4d e4 20          	or     DWORD PTR [ebp-0x1c],0x20
/home/yogi/src/os/aproj/libChrisOS/src/time.c:196
  seconds -= dst;
30001f47:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
30001f4a:	29 45 d8             	sub    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:198

  if (overflow) return (time_t) overflow-2;
30001f4d:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
30001f51:	74 08                	je     30001f5b <mktime+0x84c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:198 (discriminator 1)
30001f53:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
30001f56:	83 e8 02             	sub    eax,0x2
30001f59:	eb 03                	jmp    30001f5e <mktime+0x84f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:201

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
30001f5b:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:202
}
30001f5e:	83 c4 20             	add    esp,0x20
30001f61:	5b                   	pop    ebx
30001f62:	5e                   	pop    esi
30001f63:	5f                   	pop    edi
30001f64:	5d                   	pop    ebp
30001f65:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

30001f66 <__x86.get_pc_thunk.ax>:
__x86.get_pc_thunk.ax():
30001f66:	8b 04 24             	mov    eax,DWORD PTR [esp]
30001f69:	c3                   	ret    

Disassembly of section .plt:

30001f70 <.plt>:
30001f70:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
30001f76:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
30001f7c:	00 00                	add    BYTE PTR [eax],al
30001f7e:	00 00                	add    BYTE PTR [eax],al
30001f80:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
30001f86:	68 00 00 00 00       	push   0x0
30001f8b:	e9 e0 ff ff ff       	jmp    30001f70 <__x86.get_pc_thunk.ax+0xa>
30001f90:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
30001f96:	68 08 00 00 00       	push   0x8
30001f9b:	e9 d0 ff ff ff       	jmp    30001f70 <__x86.get_pc_thunk.ax+0xa>
30001fa0:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
30001fa6:	68 10 00 00 00       	push   0x10
30001fab:	e9 c0 ff ff ff       	jmp    30001f70 <__x86.get_pc_thunk.ax+0xa>
30001fb0:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
30001fb6:	68 18 00 00 00       	push   0x18
30001fbb:	e9 b0 ff ff ff       	jmp    30001f70 <__x86.get_pc_thunk.ax+0xa>

Disassembly of section .text.__x86.get_pc_thunk.bx:

30001fc0 <__x86.get_pc_thunk.bx>:
__x86.get_pc_thunk.bx():
30001fc0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
30001fc3:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.si:

30001fc4 <__x86.get_pc_thunk.si>:
__x86.get_pc_thunk.si():
30001fc4:	8b 34 24             	mov    esi,DWORD PTR [esp]
30001fc7:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.cx:

30001fc8 <__x86.get_pc_thunk.cx>:
__x86.get_pc_thunk.cx():
30001fc8:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
30001fcb:	c3                   	ret    

Disassembly of section .eh_frame:

30001fcc <.eh_frame>:
30001fcc:	14 00                	adc    al,0x0
30001fce:	00 00                	add    BYTE PTR [eax],al
30001fd0:	00 00                	add    BYTE PTR [eax],al
30001fd2:	00 00                	add    BYTE PTR [eax],al
30001fd4:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
30001fd7:	00 01                	add    BYTE PTR [ecx],al
30001fd9:	7c 08                	jl     30001fe3 <__x86.get_pc_thunk.cx+0x1b>
30001fdb:	01 1b                	add    DWORD PTR [ebx],ebx
30001fdd:	0c 04                	or     al,0x4
30001fdf:	04 88                	add    al,0x88
30001fe1:	01 00                	add    DWORD PTR [eax],eax
30001fe3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30001fe6:	00 00                	add    BYTE PTR [eax],al
30001fe8:	1c 00                	sbb    al,0x0
30001fea:	00 00                	add    BYTE PTR [eax],al
30001fec:	14 e0                	adc    al,0xe0
30001fee:	ff                   	(bad)  
30001fef:	ff                   	(bad)  
30001ff0:	38 00                	cmp    BYTE PTR [eax],al
30001ff2:	00 00                	add    BYTE PTR [eax],al
30001ff4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30001ff7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30001ffd:	74 c5                	je     30001fc4 <__x86.get_pc_thunk.si>
30001fff:	0c 04                	or     al,0x4
30002001:	04 00                	add    al,0x0
30002003:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002006:	00 00                	add    BYTE PTR [eax],al
30002008:	3c 00                	cmp    al,0x0
3000200a:	00 00                	add    BYTE PTR [eax],al
3000200c:	2c e0                	sub    al,0xe0
3000200e:	ff                   	(bad)  
3000200f:	ff                   	(bad)  
30002010:	38 00                	cmp    BYTE PTR [eax],al
30002012:	00 00                	add    BYTE PTR [eax],al
30002014:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002017:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000201d:	74 c5                	je     30001fe4 <__x86.get_pc_thunk.cx+0x1c>
3000201f:	0c 04                	or     al,0x4
30002021:	04 00                	add    al,0x0
30002023:	00 10                	add    BYTE PTR [eax],dl
30002025:	00 00                	add    BYTE PTR [eax],al
30002027:	00 5c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bl
3000202b:	00 3a                	add    BYTE PTR [edx],bh
3000202d:	ff                   	(bad)  
3000202e:	ff                   	(bad)  
3000202f:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
30002032:	00 00                	add    BYTE PTR [eax],al
30002034:	00 00                	add    BYTE PTR [eax],al
30002036:	00 00                	add    BYTE PTR [eax],al
30002038:	24 00                	and    al,0x0
3000203a:	00 00                	add    BYTE PTR [eax],al
3000203c:	70 00                	jo     3000203e <__x86.get_pc_thunk.cx+0x76>
3000203e:	00 00                	add    BYTE PTR [eax],al
30002040:	30 e0                	xor    al,ah
30002042:	ff                   	(bad)  
30002043:	ff 55 00             	call   DWORD PTR [ebp+0x0]
30002046:	00 00                	add    BYTE PTR [eax],al
30002048:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000204b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002051:	42                   	inc    edx
30002052:	86 03                	xchg   BYTE PTR [ebx],al
30002054:	83 04 02 4d          	add    DWORD PTR [edx+eax*1],0x4d
30002058:	c3                   	ret    
30002059:	41                   	inc    ecx
3000205a:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
3000205e:	04 04                	add    al,0x4
30002060:	24 00                	and    al,0x0
30002062:	00 00                	add    BYTE PTR [eax],al
30002064:	98                   	cwde   
30002065:	00 00                	add    BYTE PTR [eax],al
30002067:	00 5d e0             	add    BYTE PTR [ebp-0x20],bl
3000206a:	ff                   	(bad)  
3000206b:	ff 55 00             	call   DWORD PTR [ebp+0x0]
3000206e:	00 00                	add    BYTE PTR [eax],al
30002070:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002073:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002079:	42                   	inc    edx
3000207a:	86 03                	xchg   BYTE PTR [ebx],al
3000207c:	83 04 02 4d          	add    DWORD PTR [edx+eax*1],0x4d
30002080:	c3                   	ret    
30002081:	41                   	inc    ecx
30002082:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
30002086:	04 04                	add    al,0x4
30002088:	24 00                	and    al,0x0
3000208a:	00 00                	add    BYTE PTR [eax],al
3000208c:	c0 00 00             	rol    BYTE PTR [eax],0x0
3000208f:	00 8c e0 ff ff 97 00 	add    BYTE PTR [eax+eiz*8+0x97ffff],cl
30002096:	00 00                	add    BYTE PTR [eax],al
30002098:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000209b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300020a1:	42                   	inc    edx
300020a2:	86 03                	xchg   BYTE PTR [ebx],al
300020a4:	83 04 02 8f          	add    DWORD PTR [edx+eax*1],0xffffff8f
300020a8:	c3                   	ret    
300020a9:	41                   	inc    ecx
300020aa:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
300020ae:	04 04                	add    al,0x4
300020b0:	10 00                	adc    BYTE PTR [eax],al
300020b2:	00 00                	add    BYTE PTR [eax],al
300020b4:	e8 00 00 00 08       	call   380020b9 <ticksToWait+0x7ffec59>
300020b9:	ff                   	(bad)  
300020ba:	ff                   	(bad)  
300020bb:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
300020be:	00 00                	add    BYTE PTR [eax],al
300020c0:	00 00                	add    BYTE PTR [eax],al
300020c2:	00 00                	add    BYTE PTR [eax],al
300020c4:	20 00                	and    BYTE PTR [eax],al
300020c6:	00 00                	add    BYTE PTR [eax],al
300020c8:	fc                   	cld    
300020c9:	00 00                	add    BYTE PTR [eax],al
300020cb:	00 e8                	add    al,ch
300020cd:	e0 ff                	loopne 300020ce <__x86.get_pc_thunk.cx+0x106>
300020cf:	ff 26                	jmp    DWORD PTR [esi]
300020d1:	00 00                	add    BYTE PTR [eax],al
300020d3:	00 00                	add    BYTE PTR [eax],al
300020d5:	41                   	inc    ecx
300020d6:	0e                   	push   cs
300020d7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300020dd:	41                   	inc    ecx
300020de:	83 03 60             	add    DWORD PTR [ebx],0x60
300020e1:	c3                   	ret    
300020e2:	41                   	inc    ecx
300020e3:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300020e6:	04 00                	add    al,0x0
300020e8:	20 00                	and    BYTE PTR [eax],al
300020ea:	00 00                	add    BYTE PTR [eax],al
300020ec:	20 01                	and    BYTE PTR [ecx],al
300020ee:	00 00                	add    BYTE PTR [eax],al
300020f0:	ea e0 ff ff 43 00 00 	jmp    0x0:0x43ffffe0
300020f7:	00 00                	add    BYTE PTR [eax],al
300020f9:	41                   	inc    ecx
300020fa:	0e                   	push   cs
300020fb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002101:	44                   	inc    esp
30002102:	83 03 7a             	add    DWORD PTR [ebx],0x7a
30002105:	c3                   	ret    
30002106:	41                   	inc    ecx
30002107:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000210a:	04 00                	add    al,0x0
3000210c:	20 00                	and    BYTE PTR [eax],al
3000210e:	00 00                	add    BYTE PTR [eax],al
30002110:	44                   	inc    esp
30002111:	01 00                	add    DWORD PTR [eax],eax
30002113:	00 09                	add    BYTE PTR [ecx],cl
30002115:	e1 ff                	loope  30002116 <__x86.get_pc_thunk.cx+0x14e>
30002117:	ff 2f                	jmp    FWORD PTR [edi]
30002119:	00 00                	add    BYTE PTR [eax],al
3000211b:	00 00                	add    BYTE PTR [eax],al
3000211d:	41                   	inc    ecx
3000211e:	0e                   	push   cs
3000211f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002125:	44                   	inc    esp
30002126:	83 03 66             	add    DWORD PTR [ebx],0x66
30002129:	c3                   	ret    
3000212a:	41                   	inc    ecx
3000212b:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000212e:	04 00                	add    al,0x0
30002130:	20 00                	and    BYTE PTR [eax],al
30002132:	00 00                	add    BYTE PTR [eax],al
30002134:	68 01 00 00 14       	push   0x14000001
30002139:	e1 ff                	loope  3000213a <__x86.get_pc_thunk.cx+0x172>
3000213b:	ff d1                	call   ecx
3000213d:	00 00                	add    BYTE PTR [eax],al
3000213f:	00 00                	add    BYTE PTR [eax],al
30002141:	41                   	inc    ecx
30002142:	0e                   	push   cs
30002143:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002149:	44                   	inc    esp
3000214a:	83 03 02             	add    DWORD PTR [ebx],0x2
3000214d:	c9                   	leave  
3000214e:	c5 c3 0c             	(bad)  
30002151:	04 04                	add    al,0x4
30002153:	00 20                	add    BYTE PTR [eax],ah
30002155:	00 00                	add    BYTE PTR [eax],al
30002157:	00 8c 01 00 00 c4 e1 	add    BYTE PTR [ecx+eax*1-0x1e3c0000],cl
3000215e:	ff                   	(bad)  
3000215f:	ff 35 00 00 00 00    	push   DWORD PTR ds:0x0
30002165:	41                   	inc    ecx
30002166:	0e                   	push   cs
30002167:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000216d:	44                   	inc    esp
3000216e:	83 03 6c             	add    DWORD PTR [ebx],0x6c
30002171:	c3                   	ret    
30002172:	41                   	inc    ecx
30002173:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002176:	04 00                	add    al,0x0
30002178:	20 00                	and    BYTE PTR [eax],al
3000217a:	00 00                	add    BYTE PTR [eax],al
3000217c:	b0 01                	mov    al,0x1
3000217e:	00 00                	add    BYTE PTR [eax],al
30002180:	d5 e1                	aad    0xe1
30002182:	ff                   	(bad)  
30002183:	ff 34 00             	push   DWORD PTR [eax+eax*1]
30002186:	00 00                	add    BYTE PTR [eax],al
30002188:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000218b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002191:	44                   	inc    esp
30002192:	83 03 6b             	add    DWORD PTR [ebx],0x6b
30002195:	c3                   	ret    
30002196:	41                   	inc    ecx
30002197:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000219a:	04 00                	add    al,0x0
3000219c:	20 00                	and    BYTE PTR [eax],al
3000219e:	00 00                	add    BYTE PTR [eax],al
300021a0:	d4 01                	aam    0x1
300021a2:	00 00                	add    BYTE PTR [eax],al
300021a4:	e5 e1                	in     eax,0xe1
300021a6:	ff                   	(bad)  
300021a7:	ff 31                	push   DWORD PTR [ecx]
300021a9:	00 00                	add    BYTE PTR [eax],al
300021ab:	00 00                	add    BYTE PTR [eax],al
300021ad:	41                   	inc    ecx
300021ae:	0e                   	push   cs
300021af:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300021b5:	44                   	inc    esp
300021b6:	83 03 68             	add    DWORD PTR [ebx],0x68
300021b9:	c3                   	ret    
300021ba:	41                   	inc    ecx
300021bb:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300021be:	04 00                	add    al,0x0
300021c0:	1c 00                	sbb    al,0x0
300021c2:	00 00                	add    BYTE PTR [eax],al
300021c4:	f8                   	clc    
300021c5:	01 00                	add    DWORD PTR [eax],eax
300021c7:	00 f2                	add    dl,dh
300021c9:	e1 ff                	loope  300021ca <__x86.get_pc_thunk.cx+0x202>
300021cb:	ff 27                	jmp    DWORD PTR [edi]
300021cd:	00 00                	add    BYTE PTR [eax],al
300021cf:	00 00                	add    BYTE PTR [eax],al
300021d1:	41                   	inc    ecx
300021d2:	0e                   	push   cs
300021d3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300021d9:	63 c5                	arpl   bp,ax
300021db:	0c 04                	or     al,0x4
300021dd:	04 00                	add    al,0x0
300021df:	00 20                	add    BYTE PTR [eax],ah
300021e1:	00 00                	add    BYTE PTR [eax],al
300021e3:	00 18                	add    BYTE PTR [eax],bl
300021e5:	02 00                	add    al,BYTE PTR [eax]
300021e7:	00 f9                	add    cl,bh
300021e9:	e1 ff                	loope  300021ea <__x86.get_pc_thunk.cx+0x222>
300021eb:	ff 64 00 00          	jmp    DWORD PTR [eax+eax*1+0x0]
300021ef:	00 00                	add    BYTE PTR [eax],al
300021f1:	41                   	inc    ecx
300021f2:	0e                   	push   cs
300021f3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300021f9:	44                   	inc    esp
300021fa:	83 03 02             	add    DWORD PTR [ebx],0x2
300021fd:	5c                   	pop    esp
300021fe:	c5 c3 0c             	(bad)  
30002201:	04 04                	add    al,0x4
30002203:	00 20                	add    BYTE PTR [eax],ah
30002205:	00 00                	add    BYTE PTR [eax],al
30002207:	00 3c 02             	add    BYTE PTR [edx+eax*1],bh
3000220a:	00 00                	add    BYTE PTR [eax],al
3000220c:	39 e2                	cmp    edx,esp
3000220e:	ff                   	(bad)  
3000220f:	ff 1f                	call   FWORD PTR [edi]
30002211:	00 00                	add    BYTE PTR [eax],al
30002213:	00 00                	add    BYTE PTR [eax],al
30002215:	41                   	inc    ecx
30002216:	0e                   	push   cs
30002217:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000221d:	44                   	inc    esp
3000221e:	83 03 56             	add    DWORD PTR [ebx],0x56
30002221:	c3                   	ret    
30002222:	41                   	inc    ecx
30002223:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002226:	04 00                	add    al,0x0
30002228:	1c 00                	sbb    al,0x0
3000222a:	00 00                	add    BYTE PTR [eax],al
3000222c:	60                   	pusha  
3000222d:	02 00                	add    al,BYTE PTR [eax]
3000222f:	00 34 e2             	add    BYTE PTR [edx+eiz*8],dh
30002232:	ff                   	(bad)  
30002233:	ff 34 00             	push   DWORD PTR [eax+eax*1]
30002236:	00 00                	add    BYTE PTR [eax],al
30002238:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000223b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002241:	70 c5                	jo     30002208 <__x86.get_pc_thunk.cx+0x240>
30002243:	0c 04                	or     al,0x4
30002245:	04 00                	add    al,0x0
30002247:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3000224a:	00 00                	add    BYTE PTR [eax],al
3000224c:	80 02 00             	add    BYTE PTR [edx],0x0
3000224f:	00 48 e2             	add    BYTE PTR [eax-0x1e],cl
30002252:	ff                   	(bad)  
30002253:	ff 34 00             	push   DWORD PTR [eax+eax*1]
30002256:	00 00                	add    BYTE PTR [eax],al
30002258:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000225b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002261:	70 c5                	jo     30002228 <__x86.get_pc_thunk.cx+0x260>
30002263:	0c 04                	or     al,0x4
30002265:	04 00                	add    al,0x0
30002267:	00 20                	add    BYTE PTR [eax],ah
30002269:	00 00                	add    BYTE PTR [eax],al
3000226b:	00 a0 02 00 00 5c    	add    BYTE PTR [eax+0x5c000002],ah
30002271:	e2 ff                	loop   30002272 <__x86.get_pc_thunk.cx+0x2aa>
30002273:	ff 37                	push   DWORD PTR [edi]
30002275:	00 00                	add    BYTE PTR [eax],al
30002277:	00 00                	add    BYTE PTR [eax],al
30002279:	41                   	inc    ecx
3000227a:	0e                   	push   cs
3000227b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002281:	44                   	inc    esp
30002282:	83 03 6e             	add    DWORD PTR [ebx],0x6e
30002285:	c3                   	ret    
30002286:	41                   	inc    ecx
30002287:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000228a:	04 00                	add    al,0x0
3000228c:	20 00                	and    BYTE PTR [eax],al
3000228e:	00 00                	add    BYTE PTR [eax],al
30002290:	c4 02                	les    eax,FWORD PTR [edx]
30002292:	00 00                	add    BYTE PTR [eax],al
30002294:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002295:	e2 ff                	loop   30002296 <__x86.get_pc_thunk.cx+0x2ce>
30002297:	ff 4e 00             	dec    DWORD PTR [esi+0x0]
3000229a:	00 00                	add    BYTE PTR [eax],al
3000229c:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000229f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300022a5:	44                   	inc    esp
300022a6:	83 03 02             	add    DWORD PTR [ebx],0x2
300022a9:	45                   	inc    ebp
300022aa:	c3                   	ret    
300022ab:	41                   	inc    ecx
300022ac:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300022af:	04 1c                	add    al,0x1c
300022b1:	00 00                	add    BYTE PTR [eax],al
300022b3:	00 e8                	add    al,ch
300022b5:	02 00                	add    al,BYTE PTR [eax]
300022b7:	00 99 e2 ff ff 1d    	add    BYTE PTR [ecx+0x1dffffe2],bl
300022bd:	00 00                	add    BYTE PTR [eax],al
300022bf:	00 00                	add    BYTE PTR [eax],al
300022c1:	41                   	inc    ecx
300022c2:	0e                   	push   cs
300022c3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300022c9:	59                   	pop    ecx
300022ca:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300022cd:	04 00                	add    al,0x0
300022cf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300022d2:	00 00                	add    BYTE PTR [eax],al
300022d4:	08 03                	or     BYTE PTR [ebx],al
300022d6:	00 00                	add    BYTE PTR [eax],al
300022d8:	96                   	xchg   esi,eax
300022d9:	e2 ff                	loop   300022da <__x86.get_pc_thunk.cx+0x312>
300022db:	ff 29                	jmp    FWORD PTR [ecx]
300022dd:	00 00                	add    BYTE PTR [eax],al
300022df:	00 00                	add    BYTE PTR [eax],al
300022e1:	41                   	inc    ecx
300022e2:	0e                   	push   cs
300022e3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300022e9:	65 c5 0c 04          	lds    ecx,FWORD PTR gs:[esp+eax*1]
300022ed:	04 00                	add    al,0x0
300022ef:	00 20                	add    BYTE PTR [eax],ah
300022f1:	00 00                	add    BYTE PTR [eax],al
300022f3:	00 28                	add    BYTE PTR [eax],ch
300022f5:	03 00                	add    eax,DWORD PTR [eax]
300022f7:	00 9f e2 ff ff 34    	add    BYTE PTR [edi+0x34ffffe2],bl
300022fd:	00 00                	add    BYTE PTR [eax],al
300022ff:	00 00                	add    BYTE PTR [eax],al
30002301:	41                   	inc    ecx
30002302:	0e                   	push   cs
30002303:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002309:	44                   	inc    esp
3000230a:	83 03 6b             	add    DWORD PTR [ebx],0x6b
3000230d:	c3                   	ret    
3000230e:	41                   	inc    ecx
3000230f:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002312:	04 00                	add    al,0x0
30002314:	1c 00                	sbb    al,0x0
30002316:	00 00                	add    BYTE PTR [eax],al
30002318:	4c                   	dec    esp
30002319:	03 00                	add    eax,DWORD PTR [eax]
3000231b:	00 af e2 ff ff 1d    	add    BYTE PTR [edi+0x1dffffe2],ch
30002321:	00 00                	add    BYTE PTR [eax],al
30002323:	00 00                	add    BYTE PTR [eax],al
30002325:	41                   	inc    ecx
30002326:	0e                   	push   cs
30002327:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000232d:	59                   	pop    ecx
3000232e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002331:	04 00                	add    al,0x0
30002333:	00 20                	add    BYTE PTR [eax],ah
30002335:	00 00                	add    BYTE PTR [eax],al
30002337:	00 6c 03 00          	add    BYTE PTR [ebx+eax*1+0x0],ch
3000233b:	00 ac e2 ff ff 42 00 	add    BYTE PTR [edx+eiz*8+0x42ffff],ch
30002342:	00 00                	add    BYTE PTR [eax],al
30002344:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002347:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000234d:	44                   	inc    esp
3000234e:	83 03 7a             	add    DWORD PTR [ebx],0x7a
30002351:	c5 c3 0c             	(bad)  
30002354:	04 04                	add    al,0x4
30002356:	00 00                	add    BYTE PTR [eax],al
30002358:	1c 00                	sbb    al,0x0
3000235a:	00 00                	add    BYTE PTR [eax],al
3000235c:	90                   	nop
3000235d:	03 00                	add    eax,DWORD PTR [eax]
3000235f:	00 cc                	add    ah,cl
30002361:	e2 ff                	loop   30002362 <__x86.get_pc_thunk.cx+0x39a>
30002363:	ff 34 00             	push   DWORD PTR [eax+eax*1]
30002366:	00 00                	add    BYTE PTR [eax],al
30002368:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000236b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002371:	70 c5                	jo     30002338 <__x86.get_pc_thunk.cx+0x370>
30002373:	0c 04                	or     al,0x4
30002375:	04 00                	add    al,0x0
30002377:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3000237a:	00 00                	add    BYTE PTR [eax],al
3000237c:	b0 03                	mov    al,0x3
3000237e:	00 00                	add    BYTE PTR [eax],al
30002380:	e0 e2                	loopne 30002364 <__x86.get_pc_thunk.cx+0x39c>
30002382:	ff                   	(bad)  
30002383:	ff                   	(bad)  
30002384:	7c 00                	jl     30002386 <__x86.get_pc_thunk.cx+0x3be>
30002386:	00 00                	add    BYTE PTR [eax],al
30002388:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000238b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002391:	02 78 c5             	add    bh,BYTE PTR [eax-0x3b]
30002394:	0c 04                	or     al,0x4
30002396:	04 00                	add    al,0x0
30002398:	28 00                	sub    BYTE PTR [eax],al
3000239a:	00 00                	add    BYTE PTR [eax],al
3000239c:	d0 03                	rol    BYTE PTR [ebx],1
3000239e:	00 00                	add    BYTE PTR [eax],al
300023a0:	3c e3                	cmp    al,0xe3
300023a2:	ff                   	(bad)  
300023a3:	ff e2                	jmp    edx
300023a5:	01 00                	add    DWORD PTR [eax],eax
300023a7:	00 00                	add    BYTE PTR [eax],al
300023a9:	41                   	inc    ecx
300023aa:	0e                   	push   cs
300023ab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300023b1:	45                   	inc    ebp
300023b2:	86 03                	xchg   BYTE PTR [ebx],al
300023b4:	83 04 03 d7          	add    DWORD PTR [ebx+eax*1],0xffffffd7
300023b8:	01 c3                	add    ebx,eax
300023ba:	41                   	inc    ecx
300023bb:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
300023bf:	04 04                	add    al,0x4
300023c1:	00 00                	add    BYTE PTR [eax],al
300023c3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300023c6:	00 00                	add    BYTE PTR [eax],al
300023c8:	fc                   	cld    
300023c9:	03 00                	add    eax,DWORD PTR [eax]
300023cb:	00 f2                	add    dl,dh
300023cd:	e4 ff                	in     al,0xff
300023cf:	ff                   	(bad)  
300023d0:	39 00                	cmp    DWORD PTR [eax],eax
300023d2:	00 00                	add    BYTE PTR [eax],al
300023d4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300023d7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300023dd:	75 c5                	jne    300023a4 <__x86.get_pc_thunk.cx+0x3dc>
300023df:	0c 04                	or     al,0x4
300023e1:	04 00                	add    al,0x0
300023e3:	00 20                	add    BYTE PTR [eax],ah
300023e5:	00 00                	add    BYTE PTR [eax],al
300023e7:	00 1c 04             	add    BYTE PTR [esp+eax*1],bl
300023ea:	00 00                	add    BYTE PTR [eax],al
300023ec:	0b e5                	or     esp,ebp
300023ee:	ff                   	(bad)  
300023ef:	ff 26                	jmp    DWORD PTR [esi]
300023f1:	00 00                	add    BYTE PTR [eax],al
300023f3:	00 00                	add    BYTE PTR [eax],al
300023f5:	41                   	inc    ecx
300023f6:	0e                   	push   cs
300023f7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300023fd:	41                   	inc    ecx
300023fe:	83 03 60             	add    DWORD PTR [ebx],0x60
30002401:	c3                   	ret    
30002402:	41                   	inc    ecx
30002403:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002406:	04 00                	add    al,0x0
30002408:	10 00                	adc    BYTE PTR [eax],al
3000240a:	00 00                	add    BYTE PTR [eax],al
3000240c:	40                   	inc    eax
3000240d:	04 00                	add    al,0x0
3000240f:	00 b4 fb ff ff 04 00 	add    BYTE PTR [ebx+edi*8+0x4ffff],dh
30002416:	00 00                	add    BYTE PTR [eax],al
30002418:	00 00                	add    BYTE PTR [eax],al
3000241a:	00 00                	add    BYTE PTR [eax],al
3000241c:	1c 00                	sbb    al,0x0
3000241e:	00 00                	add    BYTE PTR [eax],al
30002420:	54                   	push   esp
30002421:	04 00                	add    al,0x0
30002423:	00 fc                	add    ah,bh
30002425:	e4 ff                	in     al,0xff
30002427:	ff 9b 01 00 00 00    	call   FWORD PTR [ebx+0x1]
3000242d:	41                   	inc    ecx
3000242e:	0e                   	push   cs
3000242f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002435:	03 97 01 c5 0c 04    	add    edx,DWORD PTR [edi+0x40cc501]
3000243b:	04 1c                	add    al,0x1c
3000243d:	00 00                	add    BYTE PTR [eax],al
3000243f:	00 74 04 00          	add    BYTE PTR [esp+eax*1+0x0],dh
30002443:	00 78 e6             	add    BYTE PTR [eax-0x1a],bh
30002446:	ff                   	(bad)  
30002447:	ff c7                	inc    edi
30002449:	00 00                	add    BYTE PTR [eax],al
3000244b:	00 00                	add    BYTE PTR [eax],al
3000244d:	41                   	inc    ecx
3000244e:	0e                   	push   cs
3000244f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002455:	02 c3                	add    al,bl
30002457:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000245a:	04 00                	add    al,0x0
3000245c:	20 00                	and    BYTE PTR [eax],al
3000245e:	00 00                	add    BYTE PTR [eax],al
30002460:	94                   	xchg   esp,eax
30002461:	04 00                	add    al,0x0
30002463:	00 20                	add    BYTE PTR [eax],ah
30002465:	e7 ff                	out    0xff,eax
30002467:	ff 2c 00             	jmp    FWORD PTR [eax+eax*1]
3000246a:	00 00                	add    BYTE PTR [eax],al
3000246c:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000246f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002475:	44                   	inc    esp
30002476:	83 03 64             	add    DWORD PTR [ebx],0x64
30002479:	c5 c3 0c             	(bad)  
3000247c:	04 04                	add    al,0x4
3000247e:	00 00                	add    BYTE PTR [eax],al
30002480:	20 00                	and    BYTE PTR [eax],al
30002482:	00 00                	add    BYTE PTR [eax],al
30002484:	b8 04 00 00 28       	mov    eax,0x28000004
30002489:	e7 ff                	out    0xff,eax
3000248b:	ff 26                	jmp    DWORD PTR [esi]
3000248d:	00 00                	add    BYTE PTR [eax],al
3000248f:	00 00                	add    BYTE PTR [eax],al
30002491:	41                   	inc    ecx
30002492:	0e                   	push   cs
30002493:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002499:	44                   	inc    esp
3000249a:	83 03 5e             	add    DWORD PTR [ebx],0x5e
3000249d:	c5 c3 0c             	(bad)  
300024a0:	04 04                	add    al,0x4
300024a2:	00 00                	add    BYTE PTR [eax],al
300024a4:	1c 00                	sbb    al,0x0
300024a6:	00 00                	add    BYTE PTR [eax],al
300024a8:	dc 04 00             	fadd   QWORD PTR [eax+eax*1]
300024ab:	00 2a                	add    BYTE PTR [edx],ch
300024ad:	e7 ff                	out    0xff,eax
300024af:	ff 53 00             	call   DWORD PTR [ebx+0x0]
300024b2:	00 00                	add    BYTE PTR [eax],al
300024b4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300024b7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300024bd:	02 4f c5             	add    cl,BYTE PTR [edi-0x3b]
300024c0:	0c 04                	or     al,0x4
300024c2:	04 00                	add    al,0x0
300024c4:	20 00                	and    BYTE PTR [eax],al
300024c6:	00 00                	add    BYTE PTR [eax],al
300024c8:	fc                   	cld    
300024c9:	04 00                	add    al,0x0
300024cb:	00 60 e7             	add    BYTE PTR [eax-0x19],ah
300024ce:	ff                   	(bad)  
300024cf:	ff                   	(bad)  
300024d0:	3e 00 00             	add    BYTE PTR ds:[eax],al
300024d3:	00 00                	add    BYTE PTR [eax],al
300024d5:	41                   	inc    ecx
300024d6:	0e                   	push   cs
300024d7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300024dd:	44                   	inc    esp
300024de:	83 03 76             	add    DWORD PTR [ebx],0x76
300024e1:	c5 c3 0c             	(bad)  
300024e4:	04 04                	add    al,0x4
300024e6:	00 00                	add    BYTE PTR [eax],al
300024e8:	1c 00                	sbb    al,0x0
300024ea:	00 00                	add    BYTE PTR [eax],al
300024ec:	20 05 00 00 7a e7    	and    BYTE PTR ds:0xe77a0000,al
300024f2:	ff                   	(bad)  
300024f3:	ff 6f 00             	jmp    FWORD PTR [edi+0x0]
300024f6:	00 00                	add    BYTE PTR [eax],al
300024f8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300024fb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002501:	02 6b c5             	add    ch,BYTE PTR [ebx-0x3b]
30002504:	0c 04                	or     al,0x4
30002506:	04 00                	add    al,0x0
30002508:	24 00                	and    al,0x0
3000250a:	00 00                	add    BYTE PTR [eax],al
3000250c:	40                   	inc    eax
3000250d:	05 00 00 cc e7       	add    eax,0xe7cc0000
30002512:	ff                   	(bad)  
30002513:	ff 5e 00             	call   FWORD PTR [esi+0x0]
30002516:	00 00                	add    BYTE PTR [eax],al
30002518:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000251b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002521:	45                   	inc    ebp
30002522:	86 03                	xchg   BYTE PTR [ebx],al
30002524:	83 04 02 53          	add    DWORD PTR [edx+eax*1],0x53
30002528:	c3                   	ret    
30002529:	41                   	inc    ecx
3000252a:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
3000252e:	04 04                	add    al,0x4
30002530:	1c 00                	sbb    al,0x0
30002532:	00 00                	add    BYTE PTR [eax],al
30002534:	68 05 00 00 04       	push   0x4000005
30002539:	e8 ff ff 40 00       	call   3041253d <ticksToWait+0x40f0dd>
3000253e:	00 00                	add    BYTE PTR [eax],al
30002540:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002543:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002549:	7c c5                	jl     30002510 <__x86.get_pc_thunk.cx+0x548>
3000254b:	0c 04                	or     al,0x4
3000254d:	04 00                	add    al,0x0
3000254f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002552:	00 00                	add    BYTE PTR [eax],al
30002554:	88 05 00 00 24 e8    	mov    BYTE PTR ds:0xe8240000,al
3000255a:	ff                   	(bad)  
3000255b:	ff 47 00             	inc    DWORD PTR [edi+0x0]
3000255e:	00 00                	add    BYTE PTR [eax],al
30002560:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002563:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002569:	02 43 c5             	add    al,BYTE PTR [ebx-0x3b]
3000256c:	0c 04                	or     al,0x4
3000256e:	04 00                	add    al,0x0
30002570:	1c 00                	sbb    al,0x0
30002572:	00 00                	add    BYTE PTR [eax],al
30002574:	a8 05                	test   al,0x5
30002576:	00 00                	add    BYTE PTR [eax],al
30002578:	4c                   	dec    esp
30002579:	e8 ff ff 31 00       	call   3032257d <ticksToWait+0x31f11d>
3000257e:	00 00                	add    BYTE PTR [eax],al
30002580:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002583:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002589:	6d                   	ins    DWORD PTR es:[edi],dx
3000258a:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000258d:	04 00                	add    al,0x0
3000258f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002592:	00 00                	add    BYTE PTR [eax],al
30002594:	c8 05 00 00          	enter  0x5,0x0
30002598:	60                   	pusha  
30002599:	e8 ff ff 67 00       	call   3068259d <ticksToWait+0x67f13d>
3000259e:	00 00                	add    BYTE PTR [eax],al
300025a0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300025a3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025a9:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
300025ac:	0c 04                	or     al,0x4
300025ae:	04 00                	add    al,0x0
300025b0:	1c 00                	sbb    al,0x0
300025b2:	00 00                	add    BYTE PTR [eax],al
300025b4:	e8 05 00 00 a8       	call   d80025be <ticksToWait+0xa7fff15e>
300025b9:	e8 ff ff 60 00       	call   306125bd <ticksToWait+0x60f15d>
300025be:	00 00                	add    BYTE PTR [eax],al
300025c0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300025c3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025c9:	02 5c c5 0c          	add    bl,BYTE PTR [ebp+eax*8+0xc]
300025cd:	04 04                	add    al,0x4
300025cf:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
300025d2:	00 00                	add    BYTE PTR [eax],al
300025d4:	08 06                	or     BYTE PTR [esi],al
300025d6:	00 00                	add    BYTE PTR [eax],al
300025d8:	e8 e8 ff ff 7d       	call   ae0025c5 <ticksToWait+0x7dfff165>
300025dd:	01 00                	add    DWORD PTR [eax],eax
300025df:	00 00                	add    BYTE PTR [eax],al
300025e1:	41                   	inc    ecx
300025e2:	0e                   	push   cs
300025e3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025e9:	46                   	inc    esi
300025ea:	87 03                	xchg   DWORD PTR [ebx],eax
300025ec:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
300025ef:	05 03 70 01 c3       	add    eax,0xc3017003
300025f4:	41                   	inc    ecx
300025f5:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
300025f9:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300025fc:	04 00                	add    al,0x0
300025fe:	00 00                	add    BYTE PTR [eax],al
30002600:	1c 00                	sbb    al,0x0
30002602:	00 00                	add    BYTE PTR [eax],al
30002604:	38 06                	cmp    BYTE PTR [esi],al
30002606:	00 00                	add    BYTE PTR [eax],al
30002608:	38 ea                	cmp    dl,ch
3000260a:	ff                   	(bad)  
3000260b:	ff 1d 00 00 00 00    	call   FWORD PTR ds:0x0
30002611:	41                   	inc    ecx
30002612:	0e                   	push   cs
30002613:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002619:	59                   	pop    ecx
3000261a:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000261d:	04 00                	add    al,0x0
3000261f:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
30002622:	00 00                	add    BYTE PTR [eax],al
30002624:	58                   	pop    eax
30002625:	06                   	push   es
30002626:	00 00                	add    BYTE PTR [eax],al
30002628:	38 ea                	cmp    dl,ch
3000262a:	ff                   	(bad)  
3000262b:	ff 9c 01 00 00 00 41 	call   FWORD PTR [ecx+eax*1+0x41000000]
30002632:	0e                   	push   cs
30002633:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002639:	46                   	inc    esi
3000263a:	87 03                	xchg   DWORD PTR [ebx],eax
3000263c:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
3000263f:	05 03 8f 01 c3       	add    eax,0xc3018f03
30002644:	41                   	inc    ecx
30002645:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002649:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000264c:	04 00                	add    al,0x0
3000264e:	00 00                	add    BYTE PTR [eax],al
30002650:	20 00                	and    BYTE PTR [eax],al
30002652:	00 00                	add    BYTE PTR [eax],al
30002654:	88 06                	mov    BYTE PTR [esi],al
30002656:	00 00                	add    BYTE PTR [eax],al
30002658:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
30002659:	eb ff                	jmp    3000265a <__x86.get_pc_thunk.cx+0x692>
3000265b:	ff b5 00 00 00 00    	push   DWORD PTR [ebp+0x0]
30002661:	41                   	inc    ecx
30002662:	0e                   	push   cs
30002663:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002669:	44                   	inc    esp
3000266a:	83 03 02             	add    DWORD PTR [ebx],0x2
3000266d:	ad                   	lods   eax,DWORD PTR ds:[esi]
3000266e:	c5 c3 0c             	(bad)  
30002671:	04 04                	add    al,0x4
30002673:	00 20                	add    BYTE PTR [eax],ah
30002675:	00 00                	add    BYTE PTR [eax],al
30002677:	00 ac 06 00 00 35 ec 	add    BYTE PTR [esi+eax*1-0x13cb0000],ch
3000267e:	ff                   	(bad)  
3000267f:	ff 9e 00 00 00 00    	call   FWORD PTR [esi+0x0]
30002685:	41                   	inc    ecx
30002686:	0e                   	push   cs
30002687:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000268d:	44                   	inc    esp
3000268e:	83 03 02             	add    DWORD PTR [ebx],0x2
30002691:	96                   	xchg   esi,eax
30002692:	c5 c3 0c             	(bad)  
30002695:	04 04                	add    al,0x4
30002697:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3000269a:	00 00                	add    BYTE PTR [eax],al
3000269c:	d0 06                	rol    BYTE PTR [esi],1
3000269e:	00 00                	add    BYTE PTR [eax],al
300026a0:	b0 ec                	mov    al,0xec
300026a2:	ff                   	(bad)  
300026a3:	ff 29                	jmp    FWORD PTR [ecx]
300026a5:	00 00                	add    BYTE PTR [eax],al
300026a7:	00 00                	add    BYTE PTR [eax],al
300026a9:	41                   	inc    ecx
300026aa:	0e                   	push   cs
300026ab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026b1:	65 c5 0c 04          	lds    ecx,FWORD PTR gs:[esp+eax*1]
300026b5:	04 00                	add    al,0x0
300026b7:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
300026ba:	00 00                	add    BYTE PTR [eax],al
300026bc:	f0 06                	lock push es
300026be:	00 00                	add    BYTE PTR [eax],al
300026c0:	b9 ec ff ff 19       	mov    ecx,0x19ffffec
300026c5:	03 00                	add    eax,DWORD PTR [eax]
300026c7:	00 00                	add    BYTE PTR [eax],al
300026c9:	41                   	inc    ecx
300026ca:	0e                   	push   cs
300026cb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026d1:	44                   	inc    esp
300026d2:	83 03 03             	add    DWORD PTR [ebx],0x3
300026d5:	10 03                	adc    BYTE PTR [ebx],al
300026d7:	c3                   	ret    
300026d8:	41                   	inc    ecx
300026d9:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300026dc:	04 00                	add    al,0x0
300026de:	00 00                	add    BYTE PTR [eax],al
300026e0:	20 00                	and    BYTE PTR [eax],al
300026e2:	00 00                	add    BYTE PTR [eax],al
300026e4:	18 07                	sbb    BYTE PTR [edi],al
300026e6:	00 00                	add    BYTE PTR [eax],al
300026e8:	aa                   	stos   BYTE PTR es:[edi],al
300026e9:	ef                   	out    dx,eax
300026ea:	ff                   	(bad)  
300026eb:	ff                   	(bad)  
300026ec:	3f                   	aas    
300026ed:	00 00                	add    BYTE PTR [eax],al
300026ef:	00 00                	add    BYTE PTR [eax],al
300026f1:	41                   	inc    ecx
300026f2:	0e                   	push   cs
300026f3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026f9:	44                   	inc    esp
300026fa:	83 03 77             	add    DWORD PTR [ebx],0x77
300026fd:	c5 c3 0c             	(bad)  
30002700:	04 04                	add    al,0x4
30002702:	00 00                	add    BYTE PTR [eax],al
30002704:	20 00                	and    BYTE PTR [eax],al
30002706:	00 00                	add    BYTE PTR [eax],al
30002708:	3c 07                	cmp    al,0x7
3000270a:	00 00                	add    BYTE PTR [eax],al
3000270c:	c5 ef ff             	(bad)  
3000270f:	ff                   	(bad)  
30002710:	3e 00 00             	add    BYTE PTR ds:[eax],al
30002713:	00 00                	add    BYTE PTR [eax],al
30002715:	41                   	inc    ecx
30002716:	0e                   	push   cs
30002717:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000271d:	44                   	inc    esp
3000271e:	83 03 76             	add    DWORD PTR [ebx],0x76
30002721:	c5 c3 0c             	(bad)  
30002724:	04 04                	add    al,0x4
30002726:	00 00                	add    BYTE PTR [eax],al
30002728:	2c 00                	sub    al,0x0
3000272a:	00 00                	add    BYTE PTR [eax],al
3000272c:	60                   	pusha  
3000272d:	07                   	pop    es
3000272e:	00 00                	add    BYTE PTR [eax],al
30002730:	df ef                	fucomip st,st(7)
30002732:	ff                   	(bad)  
30002733:	ff 57 08             	call   DWORD PTR [edi+0x8]
30002736:	00 00                	add    BYTE PTR [eax],al
30002738:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000273b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002741:	46                   	inc    esi
30002742:	87 03                	xchg   DWORD PTR [ebx],eax
30002744:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
30002747:	05 03 4a 08 c3       	add    eax,0xc3084a03
3000274c:	41                   	inc    ecx
3000274d:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002751:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002754:	04 00                	add    al,0x0
30002756:	00 00                	add    BYTE PTR [eax],al
30002758:	10 00                	adc    BYTE PTR [eax],al
3000275a:	00 00                	add    BYTE PTR [eax],al
3000275c:	90                   	nop
3000275d:	07                   	pop    es
3000275e:	00 00                	add    BYTE PTR [eax],al
30002760:	68 f8 ff ff 04       	push   0x4fffff8
30002765:	00 00                	add    BYTE PTR [eax],al
30002767:	00 00                	add    BYTE PTR [eax],al
30002769:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynsym:

3000276c <.dynsym>:
	...
3000277c:	97                   	xchg   edi,eax
3000277d:	00 00                	add    BYTE PTR [eax],al
3000277f:	00 3c 0d 00 30 40 00 	add    BYTE PTR [ecx*1+0x403000],bh
30002786:	00 00                	add    BYTE PTR [eax],al
30002788:	12 00                	adc    al,BYTE PTR [eax]
3000278a:	01 00                	add    DWORD PTR [eax],eax
3000278c:	56                   	push   esi
3000278d:	00 00                	add    BYTE PTR [eax],al
3000278f:	00 cb                	add    bl,cl
30002791:	05 00 30 1d 00       	add    eax,0x1d3000
30002796:	00 00                	add    BYTE PTR [eax],al
30002798:	12 00                	adc    al,BYTE PTR [eax]
3000279a:	01 00                	add    DWORD PTR [eax],eax
3000279c:	45                   	inc    ebp
3000279d:	00 00                	add    BYTE PTR [eax],al
3000279f:	00 64 04 00          	add    BYTE PTR [esp+eax*1+0x0],ah
300027a3:	30 34 00             	xor    BYTE PTR [eax+eax*1],dh
300027a6:	00 00                	add    BYTE PTR [eax],al
300027a8:	12 00                	adc    al,BYTE PTR [eax]
300027aa:	01 00                	add    DWORD PTR [eax],eax
300027ac:	36 00 00             	add    BYTE PTR ss:[eax],al
300027af:	00 4c 02 00          	add    BYTE PTR [edx+eax*1+0x0],cl
300027b3:	30 d1                	xor    cl,dl
300027b5:	00 00                	add    BYTE PTR [eax],al
300027b7:	00 12                	add    BYTE PTR [edx],dl
300027b9:	00 01                	add    BYTE PTR [ecx],al
300027bb:	00 31                	add    BYTE PTR [ecx],dh
300027bd:	00 00                	add    BYTE PTR [eax],al
300027bf:	00 1d 02 00 30 2f    	add    BYTE PTR ds:0x2f300002,bl
300027c5:	00 00                	add    BYTE PTR [eax],al
300027c7:	00 12                	add    BYTE PTR [edx],dl
300027c9:	00 01                	add    BYTE PTR [ecx],al
300027cb:	00 7b 00             	add    BYTE PTR [ebx+0x0],bh
300027ce:	00 00                	add    BYTE PTR [eax],al
300027d0:	20 09                	and    BYTE PTR [ecx],cl
300027d2:	00 30                	add    BYTE PTR [eax],dh
300027d4:	9b                   	fwait
300027d5:	01 00                	add    DWORD PTR [eax],eax
300027d7:	00 12                	add    BYTE PTR [edx],dl
300027d9:	00 01                	add    BYTE PTR [ecx],al
300027db:	00 17                	add    BYTE PTR [edi],dl
300027dd:	00 00                	add    BYTE PTR [eax],al
300027df:	00 b4 01 00 30 26 00 	add    BYTE PTR [ecx+eax*1+0x263000],dh
300027e6:	00 00                	add    BYTE PTR [eax],al
300027e8:	12 00                	adc    al,BYTE PTR [eax]
300027ea:	01 00                	add    DWORD PTR [eax],eax
300027ec:	6f                   	outs   dx,DWORD PTR ds:[esi]
300027ed:	00 00                	add    BYTE PTR [eax],al
300027ef:	00 dc                	add    ah,bl
300027f1:	06                   	push   es
300027f2:	00 30                	add    BYTE PTR [eax],dh
300027f4:	e2 01                	loop   300027f7 <__x86.get_pc_thunk.cx+0x82f>
300027f6:	00 00                	add    BYTE PTR [eax],al
300027f8:	12 00                	adc    al,BYTE PTR [eax]
300027fa:	01 00                	add    DWORD PTR [eax],eax
300027fc:	4b                   	dec    ebx
300027fd:	00 00                	add    BYTE PTR [eax],al
300027ff:	00 03                	add    BYTE PTR [ebx],al
30002801:	05 00 30 4e 00       	add    eax,0x4e3000
30002806:	00 00                	add    BYTE PTR [eax],al
30002808:	12 00                	adc    al,BYTE PTR [eax]
3000280a:	01 00                	add    DWORD PTR [eax],eax
3000280c:	bd 00 00 00 c0       	mov    ebp,0xc0000000
30002811:	0e                   	push   cs
30002812:	00 30                	add    BYTE PTR [eax],dh
30002814:	7d 01                	jge    30002817 <__x86.get_pc_thunk.cx+0x84f>
30002816:	00 00                	add    BYTE PTR [eax],al
30002818:	12 00                	adc    al,BYTE PTR [eax]
3000281a:	01 00                	add    DWORD PTR [eax],eax
3000281c:	66                   	data16
3000281d:	00 00                	add    BYTE PTR [eax],al
3000281f:	00 79 13             	add    BYTE PTR [ecx+0x13],bh
30002822:	00 30                	add    BYTE PTR [eax],dh
30002824:	19 03                	sbb    DWORD PTR [ebx],eax
30002826:	00 00                	add    BYTE PTR [eax],al
30002828:	12 00                	adc    al,BYTE PTR [eax]
3000282a:	01 00                	add    DWORD PTR [eax],eax
3000282c:	cd 00                	int    0x0
3000282e:	00 00                	add    BYTE PTR [eax],al
30002830:	60                   	pusha  
30002831:	10 00                	adc    BYTE PTR [eax],al
30002833:	30 9c 01 00 00 12 00 	xor    BYTE PTR [ecx+eax*1+0x120000],bl
3000283a:	01 00                	add    DWORD PTR [eax],eax
3000283c:	3b 00                	cmp    eax,DWORD PTR [eax]
3000283e:	00 00                	add    BYTE PTR [eax],al
30002840:	e1 03                	loope  30002845 <__x86.get_pc_thunk.cx+0x87d>
30002842:	00 30                	add    BYTE PTR [eax],dh
30002844:	64 00 00             	add    BYTE PTR fs:[eax],al
30002847:	00 12                	add    BYTE PTR [edx],dl
30002849:	00 01                	add    BYTE PTR [ecx],al
3000284b:	00 89 00 00 00 2c    	add    BYTE PTR [ecx+0x2c000000],cl
30002851:	0c 00                	or     al,0x0
30002853:	30 3e                	xor    BYTE PTR [esi],bh
30002855:	00 00                	add    BYTE PTR [eax],al
30002857:	00 12                	add    BYTE PTR [edx],dl
30002859:	00 01                	add    BYTE PTR [ecx],al
3000285b:	00 51 00             	add    BYTE PTR [ecx+0x0],dl
3000285e:	00 00                	add    BYTE PTR [eax],al
30002860:	97                   	xchg   edi,eax
30002861:	05 00 30 34 00       	add    eax,0x343000
30002866:	00 00                	add    BYTE PTR [eax],al
30002868:	12 00                	adc    al,BYTE PTR [eax]
3000286a:	01 00                	add    DWORD PTR [eax],eax
3000286c:	fb                   	sti    
3000286d:	00 00                	add    BYTE PTR [eax],al
3000286f:	00 0f                	add    BYTE PTR [edi],cl
30002871:	17                   	pop    ss
30002872:	00 30                	add    BYTE PTR [eax],dh
30002874:	57                   	push   edi
30002875:	08 00                	or     BYTE PTR [eax],al
30002877:	00 12                	add    BYTE PTR [edx],dl
30002879:	00 01                	add    BYTE PTR [ecx],al
3000287b:	00 ad 00 00 00 f8    	add    BYTE PTR [ebp-0x8000000],ch
30002881:	0d 00 30 67 00       	or     eax,0x673000
30002886:	00 00                	add    BYTE PTR [eax],al
30002888:	12 00                	adc    al,BYTE PTR [eax]
3000288a:	01 00                	add    DWORD PTR [eax],eax
3000288c:	b5 00                	mov    ch,0x0
3000288e:	00 00                	add    BYTE PTR [eax],al
30002890:	60                   	pusha  
30002891:	0e                   	push   cs
30002892:	00 30                	add    BYTE PTR [eax],dh
30002894:	60                   	pusha  
30002895:	00 00                	add    BYTE PTR [eax],al
30002897:	00 12                	add    BYTE PTR [edx],dl
30002899:	00 01                	add    BYTE PTR [ecx],al
3000289b:	00 10                	add    BYTE PTR [eax],dl
3000289d:	00 00                	add    BYTE PTR [eax],al
3000289f:	00 1c 01             	add    BYTE PTR [ecx+eax*1],bl
300028a2:	00 30                	add    BYTE PTR [eax],dh
300028a4:	97                   	xchg   edi,eax
300028a5:	00 00                	add    BYTE PTR [eax],al
300028a7:	00 12                	add    BYTE PTR [edx],dl
300028a9:	00 01                	add    BYTE PTR [ecx],al
300028ab:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300028ae:	00 00                	add    BYTE PTR [eax],al
300028b0:	00 00                	add    BYTE PTR [eax],al
300028b2:	13 00                	adc    eax,DWORD PTR [eax]
300028b4:	00 00                	add    BYTE PTR [eax],al
300028b6:	00 00                	add    BYTE PTR [eax],al
300028b8:	10 00                	adc    BYTE PTR [eax],al
300028ba:	01 00                	add    DWORD PTR [eax],eax
300028bc:	e5 00                	in     eax,0x0
300028be:	00 00                	add    BYTE PTR [eax],al
300028c0:	92                   	xchg   edx,eax
300028c1:	16                   	push   ss
300028c2:	00 30                	add    BYTE PTR [eax],dh
300028c4:	3f                   	aas    
300028c5:	00 00                	add    BYTE PTR [eax],al
300028c7:	00 12                	add    BYTE PTR [edx],dl
300028c9:	00 01                	add    BYTE PTR [ecx],al
300028cb:	00 82 00 00 00 bc    	add    BYTE PTR [edx-0x44000000],al
300028d1:	0a 00                	or     al,BYTE PTR [eax]
300028d3:	30 c7                	xor    bh,al
300028d5:	00 00                	add    BYTE PTR [eax],al
300028d7:	00 12                	add    BYTE PTR [edx],dl
300028d9:	00 01                	add    BYTE PTR [ecx],al
300028db:	00 d4                	add    ah,dl
300028dd:	00 00                	add    BYTE PTR [eax],al
300028df:	00 fc                	add    ah,bh
300028e1:	11 00                	adc    DWORD PTR [eax],eax
300028e3:	30 b5 00 00 00 12    	xor    BYTE PTR [ebp+0x12000000],dh
300028e9:	00 01                	add    BYTE PTR [ecx],al
300028eb:	00 fd                	add    ch,bh
300028ed:	00 00                	add    BYTE PTR [eax],al
300028ef:	00 50 13             	add    BYTE PTR [eax+0x13],dl
300028f2:	00 30                	add    BYTE PTR [eax],dh
300028f4:	29 00                	sub    DWORD PTR [eax],eax
300028f6:	00 00                	add    BYTE PTR [eax],al
300028f8:	12 00                	adc    al,BYTE PTR [eax]
300028fa:	01 00                	add    DWORD PTR [eax],eax
300028fc:	2c 00                	sub    al,0x0
300028fe:	00 00                	add    BYTE PTR [eax],al
30002900:	da 01                	fiadd  DWORD PTR [ecx]
30002902:	00 30                	add    BYTE PTR [eax],dh
30002904:	43                   	inc    ebx
30002905:	00 00                	add    BYTE PTR [eax],al
30002907:	00 12                	add    BYTE PTR [edx],dl
30002909:	00 01                	add    BYTE PTR [ecx],al
3000290b:	00 9e 00 00 00 dc    	add    BYTE PTR [esi-0x24000000],bl
30002911:	0c 00                	or     al,0x0
30002913:	30 5e 00             	xor    BYTE PTR [esi+0x0],bl
30002916:	00 00                	add    BYTE PTR [eax],al
30002918:	12 00                	adc    al,BYTE PTR [eax]
3000291a:	01 00                	add    DWORD PTR [eax],eax
3000291c:	dc 00                	fadd   QWORD PTR [eax]
3000291e:	00 00                	add    BYTE PTR [eax],al
30002920:	b1 12                	mov    cl,0x12
30002922:	00 30                	add    BYTE PTR [eax],dh
30002924:	9e                   	sahf   
30002925:	00 00                	add    BYTE PTR [eax],al
30002927:	00 12                	add    BYTE PTR [edx],dl
30002929:	00 01                	add    BYTE PTR [ecx],al
3000292b:	00 08                	add    BYTE PTR [eax],cl
3000292d:	00 00                	add    BYTE PTR [eax],al
3000292f:	00 70 00             	add    BYTE PTR [eax+0x0],dh
30002932:	00 30                	add    BYTE PTR [eax],dh
30002934:	55                   	push   ebp
30002935:	00 00                	add    BYTE PTR [eax],al
30002937:	00 12                	add    BYTE PTR [edx],dl
30002939:	00 01                	add    BYTE PTR [ecx],al
3000293b:	00 a5 00 00 00 7c    	add    BYTE PTR [ebp+0x7c000000],ah
30002941:	0d 00 30 47 00       	or     eax,0x473000
30002946:	00 00                	add    BYTE PTR [eax],al
30002948:	12 00                	adc    al,BYTE PTR [eax]
3000294a:	01 00                	add    DWORD PTR [eax],eax
3000294c:	ef                   	out    dx,eax
3000294d:	00 00                	add    BYTE PTR [eax],al
3000294f:	00 d1                	add    cl,dl
30002951:	16                   	push   ss
30002952:	00 30                	add    BYTE PTR [eax],dh
30002954:	3e 00 00             	add    BYTE PTR ds:[eax],al
30002957:	00 12                	add    BYTE PTR [edx],dl
30002959:	00 01                	add    BYTE PTR [ecx],al
3000295b:	00 5e 00             	add    BYTE PTR [esi+0x0],bl
3000295e:	00 00                	add    BYTE PTR [eax],al
30002960:	e8 05 00 30 42       	call   7230296a <ticksToWait+0x422ff50a>
30002965:	00 00                	add    BYTE PTR [eax],al
30002967:	00 12                	add    BYTE PTR [edx],dl
30002969:	00 01                	add    BYTE PTR [ecx],al
3000296b:	00 90 00 00 00 c4    	add    BYTE PTR [eax-0x3c000000],dl
30002971:	0d 00 30 31 00       	or     eax,0x313000
30002976:	00 00                	add    BYTE PTR [eax],al
30002978:	12 00                	adc    al,BYTE PTR [eax]
3000297a:	01 00                	add    DWORD PTR [eax],eax
3000297c:	01 00                	add    DWORD PTR [eax],eax
3000297e:	00 00                	add    BYTE PTR [eax],al
30002980:	00 00                	add    BYTE PTR [eax],al
30002982:	00 30                	add    BYTE PTR [eax],dh
30002984:	38 00                	cmp    BYTE PTR [eax],al
30002986:	00 00                	add    BYTE PTR [eax],al
30002988:	12 00                	adc    al,BYTE PTR [eax]
3000298a:	01 00                	add    DWORD PTR [eax],eax
3000298c:	c5 00                	lds    eax,FWORD PTR [eax]
3000298e:	00 00                	add    BYTE PTR [eax],al
30002990:	40                   	inc    eax
30002991:	10 00                	adc    BYTE PTR [eax],al
30002993:	30 1d 00 00 00 12    	xor    BYTE PTR ds:0x12000000,bl
30002999:	00 01                	add    BYTE PTR [ecx],al
3000299b:	00 76 00             	add    BYTE PTR [esi+0x0],dh
3000299e:	00 00                	add    BYTE PTR [eax],al
300029a0:	be 08 00 30 39       	mov    esi,0x39300008
300029a5:	00 00                	add    BYTE PTR [eax],al
300029a7:	00 12                	add    BYTE PTR [edx],dl
300029a9:	00 01                	add    BYTE PTR [ecx],al
	...

Disassembly of section .dynstr:

300029ac <.dynstr>:
300029ac:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
300029af:	72 63                	jb     30002a14 <__x86.get_pc_thunk.cx+0xa4c>
300029b1:	68 72 00 73 74       	push   0x74730072
300029b6:	72 63                	jb     30002a1b <__x86.get_pc_thunk.cx+0xa53>
300029b8:	73 70                	jae    30002a2a <__x86.get_pc_thunk.cx+0xa62>
300029ba:	6e                   	outs   dx,BYTE PTR ds:[esi]
300029bb:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
300029be:	72 74                	jb     30002a34 <__x86.get_pc_thunk.cx+0xa6c>
300029c0:	6f                   	outs   dx,DWORD PTR ds:[esi]
300029c1:	6b 00 70             	imul   eax,DWORD PTR [eax],0x70
300029c4:	75 74                	jne    30002a3a <__x86.get_pc_thunk.cx+0xa72>
300029c6:	73 00                	jae    300029c8 <__x86.get_pc_thunk.cx+0xa00>
300029c8:	73 79                	jae    30002a43 <__x86.get_pc_thunk.cx+0xa7b>
300029ca:	73 45                	jae    30002a11 <__x86.get_pc_thunk.cx+0xa49>
300029cc:	6e                   	outs   dx,BYTE PTR ds:[esi]
300029cd:	74 65                	je     30002a34 <__x86.get_pc_thunk.cx+0xa6c>
300029cf:	72 5f                	jb     30002a30 <__x86.get_pc_thunk.cx+0xa68>
300029d1:	56                   	push   esi
300029d2:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
300029d7:	00 70 75             	add    BYTE PTR [eax+0x75],dh
300029da:	74 63                	je     30002a3f <__x86.get_pc_thunk.cx+0xa77>
300029dc:	00 67 65             	add    BYTE PTR [edi+0x65],ah
300029df:	74 63                	je     30002a44 <__x86.get_pc_thunk.cx+0xa7c>
300029e1:	00 67 65             	add    BYTE PTR [edi+0x65],ah
300029e4:	74 73                	je     30002a59 <__x86.get_pc_thunk.cx+0xa91>
300029e6:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
300029ea:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
300029ed:	6e                   	outs   dx,BYTE PTR ds:[esi]
300029ee:	69 74 00 70 72 69 6e 	imul   esi,DWORD PTR [eax+eax*1+0x70],0x746e6972
300029f5:	74 
300029f6:	00 73 6c             	add    BYTE PTR [ebx+0x6c],dh
300029f9:	65                   	gs
300029fa:	65                   	gs
300029fb:	70 00                	jo     300029fd <__x86.get_pc_thunk.cx+0xa35>
300029fd:	65                   	gs
300029fe:	78 65                	js     30002a65 <__x86.get_pc_thunk.cx+0xa9d>
30002a00:	63 00                	arpl   WORD PTR [eax],ax
30002a02:	77 61                	ja     30002a65 <__x86.get_pc_thunk.cx+0xa9d>
30002a04:	69 74 70 69 64 00 67 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x65670064
30002a0b:	65 
30002a0c:	74 74                	je     30002a82 <__x86.get_pc_thunk.cx+0xaba>
30002a0e:	69 6d 65 00 67 6d 74 	imul   ebp,DWORD PTR [ebp+0x65],0x746d6700
30002a15:	69 6d 65 5f 72 00 6d 	imul   ebp,DWORD PTR [ebp+0x65],0x6d00725f
30002a1c:	61                   	popa   
30002a1d:	6c                   	ins    BYTE PTR es:[edi],dx
30002a1e:	6c                   	ins    BYTE PTR es:[edi],dx
30002a1f:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002a20:	63 00                	arpl   WORD PTR [eax],ax
30002a22:	66                   	data16
30002a23:	72 65                	jb     30002a8a <__x86.get_pc_thunk.cx+0xac2>
30002a25:	65 00 6d 65          	add    BYTE PTR gs:[ebp+0x65],ch
30002a29:	6d                   	ins    DWORD PTR es:[edi],dx
30002a2a:	63 70 79             	arpl   WORD PTR [eax+0x79],si
30002a2d:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
30002a30:	6d                   	ins    DWORD PTR es:[edi],dx
30002a31:	73 65                	jae    30002a98 <__x86.get_pc_thunk.cx+0xad0>
30002a33:	74 00                	je     30002a35 <__x86.get_pc_thunk.cx+0xa6d>
30002a35:	73 74                	jae    30002aab <__x86.get_pc_thunk.cx+0xae3>
30002a37:	72 63                	jb     30002a9c <__x86.get_pc_thunk.cx+0xad4>
30002a39:	61                   	popa   
30002a3a:	74 00                	je     30002a3c <__x86.get_pc_thunk.cx+0xa74>
30002a3c:	73 74                	jae    30002ab2 <__x86.get_pc_thunk.cx+0xaea>
30002a3e:	72 6c                	jb     30002aac <__x86.get_pc_thunk.cx+0xae4>
30002a40:	65 6e                	outs   dx,BYTE PTR gs:[esi]
30002a42:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a45:	72 63                	jb     30002aaa <__x86.get_pc_thunk.cx+0xae2>
30002a47:	70 79                	jo     30002ac2 <__x86.get_pc_thunk.cx+0xafa>
30002a49:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a4c:	72 63                	jb     30002ab1 <__x86.get_pc_thunk.cx+0xae9>
30002a4e:	6d                   	ins    DWORD PTR es:[edi],dx
30002a4f:	70 00                	jo     30002a51 <__x86.get_pc_thunk.cx+0xa89>
30002a51:	73 74                	jae    30002ac7 <__x86.get_pc_thunk.cx+0xaff>
30002a53:	72 63                	jb     30002ab8 <__x86.get_pc_thunk.cx+0xaf0>
30002a55:	70 79                	jo     30002ad0 <__x86.get_pc_thunk.cx+0xb08>
30002a57:	63 00                	arpl   WORD PTR [eax],ax
30002a59:	73 74                	jae    30002acf <__x86.get_pc_thunk.cx+0xb07>
30002a5b:	72 6e                	jb     30002acb <__x86.get_pc_thunk.cx+0xb03>
30002a5d:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
30002a60:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a63:	72 6e                	jb     30002ad3 <__x86.get_pc_thunk.cx+0xb0b>
30002a65:	63 70 79             	arpl   WORD PTR [eax+0x79],si
30002a68:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a6b:	72 74                	jb     30002ae1 <__x86.get_pc_thunk.cx+0xb19>
30002a6d:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002a6e:	75 6c                	jne    30002adc <__x86.get_pc_thunk.cx+0xb14>
30002a70:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a73:	72 6c                	jb     30002ae1 <__x86.get_pc_thunk.cx+0xb19>
30002a75:	65                   	gs
30002a76:	66                   	data16
30002a77:	74 00                	je     30002a79 <__x86.get_pc_thunk.cx+0xab1>
30002a79:	73 74                	jae    30002aef <__x86.get_pc_thunk.cx+0xb27>
30002a7b:	72 74                	jb     30002af1 <__x86.get_pc_thunk.cx+0xb29>
30002a7d:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002a7e:	6c                   	ins    BYTE PTR es:[edi],dx
30002a7f:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a82:	72 74                	jb     30002af8 <__x86.get_pc_thunk.cx+0xb30>
30002a84:	72 69                	jb     30002aef <__x86.get_pc_thunk.cx+0xb27>
30002a86:	6d                   	ins    DWORD PTR es:[edi],dx
30002a87:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a8a:	72 74                	jb     30002b00 <__x86.get_pc_thunk.cx+0xb38>
30002a8c:	72 69                	jb     30002af7 <__x86.get_pc_thunk.cx+0xb2f>
30002a8e:	6d                   	ins    DWORD PTR es:[edi],dx
30002a8f:	32 00                	xor    al,BYTE PTR [eax]
30002a91:	6c                   	ins    BYTE PTR es:[edi],dx
30002a92:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002a93:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
30002a96:	74 69                	je     30002b01 <__x86.get_pc_thunk.cx+0xb39>
30002a98:	6d                   	ins    DWORD PTR es:[edi],dx
30002a99:	65 00 6c 6f 63       	add    BYTE PTR gs:[edi+ebp*2+0x63],ch
30002a9e:	61                   	popa   
30002a9f:	6c                   	ins    BYTE PTR es:[edi],dx
30002aa0:	74 69                	je     30002b0b <__x86.get_pc_thunk.cx+0xb43>
30002aa2:	6d                   	ins    DWORD PTR es:[edi],dx
30002aa3:	65                   	gs
30002aa4:	5f                   	pop    edi
30002aa5:	72 00                	jb     30002aa7 <__x86.get_pc_thunk.cx+0xadf>
30002aa7:	6d                   	ins    DWORD PTR es:[edi],dx
30002aa8:	6b 74 69 6d 65       	imul   esi,DWORD PTR [ecx+ebp*2+0x6d],0x65
	...

Disassembly of section .hash:

30002ab0 <.hash>:
30002ab0:	11 00                	adc    DWORD PTR [eax],eax
30002ab2:	00 00                	add    BYTE PTR [eax],al
30002ab4:	24 00                	and    al,0x0
30002ab6:	00 00                	add    BYTE PTR [eax],al
30002ab8:	0f 00 00             	sldt   WORD PTR [eax]
30002abb:	00 1f                	add    BYTE PTR [edi],bl
30002abd:	00 00                	add    BYTE PTR [eax],al
30002abf:	00 00                	add    BYTE PTR [eax],al
30002ac1:	00 00                	add    BYTE PTR [eax],al
30002ac3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002ac6:	00 00                	add    BYTE PTR [eax],al
30002ac8:	20 00                	and    BYTE PTR [eax],al
30002aca:	00 00                	add    BYTE PTR [eax],al
30002acc:	19 00                	sbb    DWORD PTR [eax],eax
30002ace:	00 00                	add    BYTE PTR [eax],al
30002ad0:	1e                   	push   ds
30002ad1:	00 00                	add    BYTE PTR [eax],al
30002ad3:	00 03                	add    BYTE PTR [ebx],al
30002ad5:	00 00                	add    BYTE PTR [eax],al
30002ad7:	00 0d 00 00 00 00    	add    BYTE PTR ds:0x0,cl
30002add:	00 00                	add    BYTE PTR [eax],al
30002adf:	00 17                	add    BYTE PTR [edi],dl
30002ae1:	00 00                	add    BYTE PTR [eax],al
30002ae3:	00 22                	add    BYTE PTR [edx],ah
30002ae5:	00 00                	add    BYTE PTR [eax],al
30002ae7:	00 23                	add    BYTE PTR [ebx],ah
30002ae9:	00 00                	add    BYTE PTR [eax],al
30002aeb:	00 21                	add    BYTE PTR [ecx],ah
30002aed:	00 00                	add    BYTE PTR [eax],al
30002aef:	00 0b                	add    BYTE PTR [ebx],cl
30002af1:	00 00                	add    BYTE PTR [eax],al
30002af3:	00 18                	add    BYTE PTR [eax],bl
30002af5:	00 00                	add    BYTE PTR [eax],al
30002af7:	00 1d 00 00 00 00    	add    BYTE PTR ds:0x0,bl
	...
30002b25:	00 00                	add    BYTE PTR [eax],al
30002b27:	00 04 00             	add    BYTE PTR [eax+eax*1],al
30002b2a:	00 00                	add    BYTE PTR [eax],al
30002b2c:	09 00                	or     DWORD PTR [eax],eax
30002b2e:	00 00                	add    BYTE PTR [eax],al
30002b30:	06                   	push   es
30002b31:	00 00                	add    BYTE PTR [eax],al
30002b33:	00 00                	add    BYTE PTR [eax],al
30002b35:	00 00                	add    BYTE PTR [eax],al
30002b37:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
30002b3a:	00 00                	add    BYTE PTR [eax],al
30002b3c:	02 00                	add    al,BYTE PTR [eax]
	...
30002b4a:	00 00                	add    BYTE PTR [eax],al
30002b4c:	01 00                	add    DWORD PTR [eax],eax
30002b4e:	00 00                	add    BYTE PTR [eax],al
30002b50:	0a 00                	or     al,BYTE PTR [eax]
30002b52:	00 00                	add    BYTE PTR [eax],al
30002b54:	10 00                	adc    BYTE PTR [eax],al
30002b56:	00 00                	add    BYTE PTR [eax],al
30002b58:	08 00                	or     BYTE PTR [eax],al
30002b5a:	00 00                	add    BYTE PTR [eax],al
30002b5c:	05 00 00 00 0e       	add    eax,0xe000000
30002b61:	00 00                	add    BYTE PTR [eax],al
30002b63:	00 12                	add    BYTE PTR [edx],dl
30002b65:	00 00                	add    BYTE PTR [eax],al
30002b67:	00 1a                	add    BYTE PTR [edx],bl
30002b69:	00 00                	add    BYTE PTR [eax],al
30002b6b:	00 15 00 00 00 13    	add    BYTE PTR ds:0x13000000,dl
30002b71:	00 00                	add    BYTE PTR [eax],al
30002b73:	00 1b                	add    BYTE PTR [ebx],bl
30002b75:	00 00                	add    BYTE PTR [eax],al
30002b77:	00 00                	add    BYTE PTR [eax],al
30002b79:	00 00                	add    BYTE PTR [eax],al
30002b7b:	00 07                	add    BYTE PTR [edi],al
30002b7d:	00 00                	add    BYTE PTR [eax],al
30002b7f:	00 16                	add    BYTE PTR [esi],dl
30002b81:	00 00                	add    BYTE PTR [eax],al
30002b83:	00 11                	add    BYTE PTR [ecx],dl
30002b85:	00 00                	add    BYTE PTR [eax],al
30002b87:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
	...

Disassembly of section .eh_frame:

30002b8c <.eh_frame>:
30002b8c:	14 00                	adc    al,0x0
30002b8e:	00 00                	add    BYTE PTR [eax],al
30002b90:	00 00                	add    BYTE PTR [eax],al
30002b92:	00 00                	add    BYTE PTR [eax],al
30002b94:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
30002b97:	00 01                	add    BYTE PTR [ecx],al
30002b99:	7c 08                	jl     30002ba3 <__x86.get_pc_thunk.cx+0xbdb>
30002b9b:	01 1b                	add    DWORD PTR [ebx],ebx
30002b9d:	0c 04                	or     al,0x4
30002b9f:	04 88                	add    al,0x88
30002ba1:	01 00                	add    DWORD PTR [eax],eax
30002ba3:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
30002ba6:	00 00                	add    BYTE PTR [eax],al
30002ba8:	1c 00                	sbb    al,0x0
30002baa:	00 00                	add    BYTE PTR [eax],al
30002bac:	c4                   	(bad)  
30002bad:	f3 ff                	repz (bad) 
30002baf:	ff 50 00             	call   DWORD PTR [eax+0x0]
30002bb2:	00 00                	add    BYTE PTR [eax],al
30002bb4:	00 0e                	add    BYTE PTR [esi],cl
30002bb6:	08 46 0e             	or     BYTE PTR [esi+0xe],al
30002bb9:	0c 4a                	or     al,0x4a
30002bbb:	0f 0b                	ud2    
30002bbd:	74 04                	je     30002bc3 <__x86.get_pc_thunk.cx+0xbfb>
30002bbf:	78 00                	js     30002bc1 <__x86.get_pc_thunk.cx+0xbf9>
30002bc1:	3f                   	aas    
30002bc2:	1a 3b                	sbb    bh,BYTE PTR [ebx]
30002bc4:	2a 32                	sub    dh,BYTE PTR [edx]
30002bc6:	24 22                	and    al,0x22
30002bc8:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

30002bcc <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
30002bcc:	01 1b                	add    DWORD PTR [ebx],ebx
30002bce:	03 3b                	add    edi,DWORD PTR [ebx]
30002bd0:	fc                   	cld    
30002bd1:	f3 ff                	repz (bad) 
30002bd3:	ff                   	(bad)  
30002bd4:	38 00                	cmp    BYTE PTR [eax],al
30002bd6:	00 00                	add    BYTE PTR [eax],al
30002bd8:	34 d4                	xor    al,0xd4
30002bda:	ff                   	(bad)  
30002bdb:	ff 18                	call   FWORD PTR [eax]
30002bdd:	f4                   	hlt    
30002bde:	ff                   	(bad)  
30002bdf:	ff 6c d4 ff          	jmp    FWORD PTR [esp+edx*8-0x1]
30002be3:	ff                   	(bad)  
30002be4:	38 f4                	cmp    ah,dh
30002be6:	ff                   	(bad)  
30002be7:	ff a4 d4 ff ff 6c f4 	jmp    DWORD PTR [esp+edx*8-0xb930001]
30002bee:	ff                   	(bad)  
30002bef:	ff                   	(bad)  
30002bf0:	f9                   	stc    
30002bf1:	d4 ff                	aam    0xff
30002bf3:	ff 94 f4 ff ff 50 d5 	call   DWORD PTR [esp+esi*8-0x2aaf0001]
30002bfa:	ff                   	(bad)  
30002bfb:	ff                   	(bad)  
30002bfc:	bc f4 ff ff e8       	mov    esp,0xe8fffff4
30002c01:	d5 ff                	aad    0xff
30002c03:	ff                   	(bad)  
30002c04:	f8                   	clc    
30002c05:	f4                   	hlt    
30002c06:	ff                   	(bad)  
30002c07:	ff 0e                	dec    DWORD PTR [esi]
30002c09:	d6                   	(bad)  
30002c0a:	ff                   	(bad)  
30002c0b:	ff 1c f5 ff ff 51 d6 	call   FWORD PTR [esi*8-0x29ae0001]
30002c12:	ff                   	(bad)  
30002c13:	ff 40 f5             	inc    DWORD PTR [eax-0xb]
30002c16:	ff                   	(bad)  
30002c17:	ff 80 d6 ff ff 64    	inc    DWORD PTR [eax+0x64ffffd6]
30002c1d:	f5                   	cmc    
30002c1e:	ff                   	(bad)  
30002c1f:	ff 54 d7 ff          	call   DWORD PTR [edi+edx*8-0x1]
30002c23:	ff 88 f5 ff ff 89    	dec    DWORD PTR [eax-0x7600000b]
30002c29:	d7                   	xlat   BYTE PTR ds:[ebx]
30002c2a:	ff                   	(bad)  
30002c2b:	ff ac f5 ff ff bd d7 	jmp    FWORD PTR [ebp+esi*8-0x28420001]
30002c32:	ff                   	(bad)  
30002c33:	ff d0                	call   eax
30002c35:	f5                   	cmc    
30002c36:	ff                   	(bad)  
30002c37:	ff ee                	jmp    <internal disassembler error>
30002c39:	d7                   	xlat   BYTE PTR ds:[ebx]
30002c3a:	ff                   	(bad)  
30002c3b:	ff f4                	push   esp
30002c3d:	f5                   	cmc    
30002c3e:	ff                   	(bad)  
30002c3f:	ff 15 d8 ff ff 14    	call   DWORD PTR ds:0x14ffffd8
30002c45:	f6 ff                	idiv   bh
30002c47:	ff                   	(bad)  
30002c48:	79 d8                	jns    30002c22 <__GNU_EH_FRAME_HDR+0x56>
30002c4a:	ff                   	(bad)  
30002c4b:	ff                   	(bad)  
30002c4c:	38 f6                	cmp    dh,dh
30002c4e:	ff                   	(bad)  
30002c4f:	ff 98 d8 ff ff 5c    	call   FWORD PTR [eax+0x5cffffd8]
30002c55:	f6 ff                	idiv   bh
30002c57:	ff cc                	dec    esp
30002c59:	d8 ff                	fdivr  st,st(7)
30002c5b:	ff                   	(bad)  
30002c5c:	7c f6                	jl     30002c54 <__GNU_EH_FRAME_HDR+0x88>
30002c5e:	ff                   	(bad)  
30002c5f:	ff 00                	inc    DWORD PTR [eax]
30002c61:	d9 ff                	fcos   
30002c63:	ff 9c f6 ff ff 37 d9 	call   FWORD PTR [esi+esi*8-0x26c80001]
30002c6a:	ff                   	(bad)  
30002c6b:	ff c0                	inc    eax
30002c6d:	f6 ff                	idiv   bh
30002c6f:	ff 85 d9 ff ff e4    	inc    DWORD PTR [ebp-0x1b000027]
30002c75:	f6 ff                	idiv   bh
30002c77:	ff a2 d9 ff ff 04    	jmp    DWORD PTR [edx+0x4ffffd9]
30002c7d:	f7 ff                	idiv   edi
30002c7f:	ff cb                	dec    ebx
30002c81:	d9 ff                	fcos   
30002c83:	ff 24 f7             	jmp    DWORD PTR [edi+esi*8]
30002c86:	ff                   	(bad)  
30002c87:	ff                   	(bad)  
30002c88:	ff d9                	call   <internal disassembler error>
30002c8a:	ff                   	(bad)  
30002c8b:	ff 48 f7             	dec    DWORD PTR [eax-0x9]
30002c8e:	ff                   	(bad)  
30002c8f:	ff 1c da             	call   FWORD PTR [edx+ebx*8]
30002c92:	ff                   	(bad)  
30002c93:	ff 68 f7             	jmp    FWORD PTR [eax-0x9]
30002c96:	ff                   	(bad)  
30002c97:	ff 60 da             	jmp    DWORD PTR [eax-0x26]
30002c9a:	ff                   	(bad)  
30002c9b:	ff 8c f7 ff ff 94 da 	dec    DWORD PTR [edi+esi*8-0x256b0001]
30002ca2:	ff                   	(bad)  
30002ca3:	ff ac f7 ff ff 10 db 	jmp    FWORD PTR [edi+esi*8-0x24ef0001]
30002caa:	ff                   	(bad)  
30002cab:	ff cc                	dec    esp
30002cad:	f7 ff                	idiv   edi
30002caf:	ff f2                	push   edx
30002cb1:	dc ff                	fdiv   st(7),st
30002cb3:	ff                   	(bad)  
30002cb4:	f8                   	clc    
30002cb5:	f7 ff                	idiv   edi
30002cb7:	ff 2b                	jmp    FWORD PTR [ebx]
30002cb9:	dd ff                	(bad)  
30002cbb:	ff 18                	call   FWORD PTR [eax]
30002cbd:	f8                   	clc    
30002cbe:	ff                   	(bad)  
30002cbf:	ff 54 dd ff          	call   DWORD PTR [ebp+ebx*8-0x1]
30002cc3:	ff 50 f8             	call   DWORD PTR [eax-0x8]
30002cc6:	ff                   	(bad)  
30002cc7:	ff f0                	push   eax
30002cc9:	de ff                	fdivp  st(7),st
30002ccb:	ff 70 f8             	push   DWORD PTR [eax-0x8]
30002cce:	ff                   	(bad)  
30002ccf:	ff                   	(bad)  
30002cd0:	b8 df ff ff 90       	mov    eax,0x90ffffdf
30002cd5:	f8                   	clc    
30002cd6:	ff                   	(bad)  
30002cd7:	ff e4                	jmp    esp
30002cd9:	df ff                	(bad)  
30002cdb:	ff b4 f8 ff ff 0a e0 	push   DWORD PTR [eax+edi*8-0x1ff50001]
30002ce2:	ff                   	(bad)  
30002ce3:	ff d8                	call   <internal disassembler error>
30002ce5:	f8                   	clc    
30002ce6:	ff                   	(bad)  
30002ce7:	ff 60 e0             	jmp    DWORD PTR [eax-0x20]
30002cea:	ff                   	(bad)  
30002ceb:	ff                   	(bad)  
30002cec:	f8                   	clc    
30002ced:	f8                   	clc    
30002cee:	ff                   	(bad)  
30002cef:	ff 9e e0 ff ff 1c    	call   FWORD PTR [esi+0x1cffffe0]
30002cf5:	f9                   	stc    
30002cf6:	ff                   	(bad)  
30002cf7:	ff 10                	call   DWORD PTR [eax]
30002cf9:	e1 ff                	loope  30002cfa <__GNU_EH_FRAME_HDR+0x12e>
30002cfb:	ff                   	(bad)  
30002cfc:	3c f9                	cmp    al,0xf9
30002cfe:	ff                   	(bad)  
30002cff:	ff 70 e1             	push   DWORD PTR [eax-0x1f]
30002d02:	ff                   	(bad)  
30002d03:	ff 64 f9 ff          	jmp    DWORD PTR [ecx+edi*8-0x1]
30002d07:	ff b0 e1 ff ff 84    	push   DWORD PTR [eax-0x7b00001f]
30002d0d:	f9                   	stc    
30002d0e:	ff                   	(bad)  
30002d0f:	ff                   	(bad)  
30002d10:	f8                   	clc    
30002d11:	e1 ff                	loope  30002d12 <__GNU_EH_FRAME_HDR+0x146>
30002d13:	ff a4 f9 ff ff 2c e2 	jmp    DWORD PTR [ecx+edi*8-0x1dd30001]
30002d1a:	ff                   	(bad)  
30002d1b:	ff c4                	inc    esp
30002d1d:	f9                   	stc    
30002d1e:	ff                   	(bad)  
30002d1f:	ff 94 e2 ff ff e4 f9 	call   DWORD PTR [edx+eiz*8-0x61b0001]
30002d26:	ff                   	(bad)  
30002d27:	ff f4                	push   esp
30002d29:	e2 ff                	loop   30002d2a <__GNU_EH_FRAME_HDR+0x15e>
30002d2b:	ff 04 fa             	inc    DWORD PTR [edx+edi*8]
30002d2e:	ff                   	(bad)  
30002d2f:	ff 74 e4 ff          	push   DWORD PTR [esp+eiz*8-0x1]
30002d33:	ff 34 fa             	push   DWORD PTR [edx+edi*8]
30002d36:	ff                   	(bad)  
30002d37:	ff 94 e4 ff ff 54 fa 	call   DWORD PTR [esp+eiz*8-0x5ab0001]
30002d3e:	ff                   	(bad)  
30002d3f:	ff 30                	push   DWORD PTR [eax]
30002d41:	e6 ff                	out    0xff,al
30002d43:	ff 84 fa ff ff e5 e6 	inc    DWORD PTR [edx+edi*8-0x191a0001]
30002d4a:	ff                   	(bad)  
30002d4b:	ff a8 fa ff ff 84    	jmp    FWORD PTR [eax-0x7b000006]
30002d51:	e7 ff                	out    0xff,eax
30002d53:	ff cc                	dec    esp
30002d55:	fa                   	cli    
30002d56:	ff                   	(bad)  
30002d57:	ff ad e7 ff ff ec    	jmp    FWORD PTR [ebp-0x13000019]
30002d5d:	fa                   	cli    
30002d5e:	ff                   	(bad)  
30002d5f:	ff c6                	inc    esi
30002d61:	ea ff ff 14 fb ff ff 	jmp    0xffff:0xfb14ffff
30002d68:	05 eb ff ff 38       	add    eax,0x38ffffeb
30002d6d:	fb                   	sti    
30002d6e:	ff                   	(bad)  
30002d6f:	ff 43 eb             	inc    DWORD PTR [ebx-0x15]
30002d72:	ff                   	(bad)  
30002d73:	ff 5c fb ff          	call   FWORD PTR [ebx+edi*8-0x1]
30002d77:	ff 9a f3 ff ff 58    	call   FWORD PTR [edx+0x58fffff3]
30002d7d:	f4                   	hlt    
30002d7e:	ff                   	(bad)  
30002d7f:	ff f4                	push   esp
30002d81:	f3 ff                	repz (bad) 
30002d83:	ff e4                	jmp    esp
30002d85:	f4                   	hlt    
30002d86:	ff                   	(bad)  
30002d87:	ff                   	(bad)  
30002d88:	f8                   	clc    
30002d89:	f3 ff                	repz (bad) 
30002d8b:	ff                   	(bad)  
30002d8c:	3c f8                	cmp    al,0xf8
30002d8e:	ff                   	(bad)  
30002d8f:	ff                   	(bad)  
30002d90:	fc                   	cld    
30002d91:	f3 ff                	repz (bad) 
30002d93:	ff                   	.byte 0xff
30002d94:	8c fb                	mov    ebx,?
30002d96:	ff                   	(bad)  
30002d97:	ff                   	.byte 0xff

Disassembly of section .rodata:

30002da0 <_ytab-0x240>:
30002da0:	53                   	push   ebx
30002da1:	74 72                	je     30002e15 <__GNU_EH_FRAME_HDR+0x249>
30002da3:	65                   	gs
30002da4:	61                   	popa   
30002da5:	6d                   	ins    DWORD PTR es:[edi],dx
30002da6:	20 25 75 20 6e 6f    	and    BYTE PTR ds:0x6f6e2075,ah
30002dac:	74 20                	je     30002dce <__GNU_EH_FRAME_HDR+0x202>
30002dae:	69 6d 70 6c 65 6d 65 	imul   ebp,DWORD PTR [ebp+0x70],0x656d656c
30002db5:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002db6:	74 65                	je     30002e1d <__GNU_EH_FRAME_HDR+0x251>
30002db8:	64 0a 00             	or     al,BYTE PTR fs:[eax]
30002dbb:	2a 2a                	sub    ch,BYTE PTR [edx]
30002dbd:	2a 49 6e             	sub    cl,BYTE PTR [ecx+0x6e]
30002dc0:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x697a696c
30002dc7:	69 
30002dc8:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002dc9:	67 20 6c 69          	and    BYTE PTR [si+0x69],ch
30002dcd:	62 63 0a             	bound  esp,QWORD PTR [ebx+0xa]
30002dd0:	2a 2a                	sub    ch,BYTE PTR [edx]
30002dd2:	2a 00                	sub    al,BYTE PTR [eax]
30002dd4:	6d                   	ins    DWORD PTR es:[edi],dx
30002dd5:	61                   	popa   
30002dd6:	6c                   	ins    BYTE PTR es:[edi],dx
30002dd7:	6c                   	ins    BYTE PTR es:[edi],dx
30002dd8:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002dd9:	63 28                	arpl   WORD PTR [eax],bp
30002ddb:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002dde:	30 38                	xor    BYTE PTR [eax],bh
30002de0:	58                   	pop    eax
30002de1:	29 0a                	sub    DWORD PTR [edx],ecx
30002de3:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002de7:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30002dea:	61                   	popa   
30002deb:	6c                   	ins    BYTE PTR es:[edi],dx
30002dec:	6c                   	ins    BYTE PTR es:[edi],dx
30002ded:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002dee:	63 3a                	arpl   WORD PTR [edx],di
30002df0:	20 6e 65             	and    BYTE PTR [esi+0x65],ch
30002df3:	65                   	gs
30002df4:	64                   	fs
30002df5:	65                   	gs
30002df6:	64                   	fs
30002df7:	3d 30 78 25 30       	cmp    eax,0x30257830
30002dfc:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30002dff:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002e03:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30002e06:	61                   	popa   
30002e07:	6c                   	ins    BYTE PTR es:[edi],dx
30002e08:	6c                   	ins    BYTE PTR es:[edi],dx
30002e09:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002e0a:	63 3a                	arpl   WORD PTR [edx],di
30002e0c:	20 68 65             	and    BYTE PTR [eax+0x65],ch
30002e0f:	61                   	popa   
30002e10:	45                   	inc    ebp
30002e11:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002e12:	64                   	fs
30002e13:	3d 30 78 25 30       	cmp    eax,0x30257830
30002e18:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30002e1b:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002e1f:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30002e22:	61                   	popa   
30002e23:	6c                   	ins    BYTE PTR es:[edi],dx
30002e24:	6c                   	ins    BYTE PTR es:[edi],dx
30002e25:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002e26:	63 3a                	arpl   WORD PTR [edx],di
30002e28:	20 52 65             	and    BYTE PTR [edx+0x65],dl
30002e2b:	71 20                	jno    30002e4d <__GNU_EH_FRAME_HDR+0x281>
30002e2d:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002e30:	30 38                	xor    BYTE PTR [eax],bh
30002e32:	58                   	pop    eax
30002e33:	20 62 79             	and    BYTE PTR [edx+0x79],ah
30002e36:	74 65                	je     30002e9d <__GNU_EH_FRAME_HDR+0x2d1>
30002e38:	73 2c                	jae    30002e66 <__GNU_EH_FRAME_HDR+0x29a>
30002e3a:	20 72 65             	and    BYTE PTR [edx+0x65],dh
30002e3d:	74 20                	je     30002e5f <__GNU_EH_FRAME_HDR+0x293>
30002e3f:	77 61                	ja     30002ea2 <__GNU_EH_FRAME_HDR+0x2d6>
30002e41:	73 20                	jae    30002e63 <__GNU_EH_FRAME_HDR+0x297>
30002e43:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002e46:	30 38                	xor    BYTE PTR [eax],bh
30002e48:	58                   	pop    eax
30002e49:	2c 20                	sub    al,0x20
30002e4b:	68 65 61 70 45       	push   0x45706165
30002e50:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002e51:	64                   	fs
30002e52:	3d 30 78 25 30       	cmp    eax,0x30257830
30002e57:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30002e5a:	00 00                	add    BYTE PTR [eax],al
30002e5c:	6c                   	ins    BYTE PTR es:[edi],dx
30002e5d:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
30002e64:	6c                   	ins    BYTE PTR es:[edi],dx
30002e65:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002e66:	63 3a                	arpl   WORD PTR [edx],di
30002e68:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
30002e6b:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x657a696c
30002e72:	65 
30002e73:	64 20 68 65          	and    BYTE PTR fs:[eax+0x65],ch
30002e77:	61                   	popa   
30002e78:	70 43                	jo     30002ebd <__GNU_EH_FRAME_HDR+0x2f1>
30002e7a:	75 72                	jne    30002eee <__GNU_EH_FRAME_HDR+0x322>
30002e7c:	72 20                	jb     30002e9e <__GNU_EH_FRAME_HDR+0x2d2>
30002e7e:	61                   	popa   
30002e7f:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002e80:	64 20 68 65          	and    BYTE PTR fs:[eax+0x65],ch
30002e84:	61                   	popa   
30002e85:	70 42                	jo     30002ec9 <__GNU_EH_FRAME_HDR+0x2fd>
30002e87:	61                   	popa   
30002e88:	73 65                	jae    30002eef <__GNU_EH_FRAME_HDR+0x323>
30002e8a:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
30002e8e:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002e91:	30 38                	xor    BYTE PTR [eax],bh
30002e93:	58                   	pop    eax
30002e94:	0a 00                	or     al,BYTE PTR [eax]
30002e96:	00 00                	add    BYTE PTR [eax],al
30002e98:	6c                   	ins    BYTE PTR es:[edi],dx
30002e99:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
30002ea0:	6c                   	ins    BYTE PTR es:[edi],dx
30002ea1:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002ea2:	63 3a                	arpl   WORD PTR [edx],di
30002ea4:	63 72 65             	arpl   WORD PTR [edx+0x65],si
30002ea7:	61                   	popa   
30002ea8:	74 69                	je     30002f13 <__GNU_EH_FRAME_HDR+0x347>
30002eaa:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002eab:	67 20 68 65          	and    BYTE PTR [bx+si+0x65],ch
30002eaf:	61                   	popa   
30002eb0:	70 20                	jo     30002ed2 <__GNU_EH_FRAME_HDR+0x306>
30002eb2:	72 65                	jb     30002f19 <__GNU_EH_FRAME_HDR+0x34d>
30002eb4:	63 20                	arpl   WORD PTR [eax],sp
30002eb6:	40                   	inc    eax
30002eb7:	20 30                	and    BYTE PTR [eax],dh
30002eb9:	78 25                	js     30002ee0 <__GNU_EH_FRAME_HDR+0x314>
30002ebb:	30 38                	xor    BYTE PTR [eax],bh
30002ebd:	58                   	pop    eax
30002ebe:	0a 00                	or     al,BYTE PTR [eax]
30002ec0:	6c                   	ins    BYTE PTR es:[edi],dx
30002ec1:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
30002ec8:	6c                   	ins    BYTE PTR es:[edi],dx
30002ec9:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002eca:	63 3a                	arpl   WORD PTR [edx],di
30002ecc:	20 68 65             	and    BYTE PTR [eax+0x65],ch
30002ecf:	61                   	popa   
30002ed0:	70 43                	jo     30002f15 <__GNU_EH_FRAME_HDR+0x349>
30002ed2:	75 72                	jne    30002f46 <__GNU_EH_FRAME_HDR+0x37a>
30002ed4:	72 3d                	jb     30002f13 <__GNU_EH_FRAME_HDR+0x347>
30002ed6:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002ed9:	30 38                	xor    BYTE PTR [eax],bh
30002edb:	58                   	pop    eax
30002edc:	2c 20                	sub    al,0x20
30002ede:	73 69                	jae    30002f49 <__GNU_EH_FRAME_HDR+0x37d>
30002ee0:	7a 65                	jp     30002f47 <__GNU_EH_FRAME_HDR+0x37b>
30002ee2:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002ee3:	66                   	data16
30002ee4:	28 68 65             	sub    BYTE PTR [eax+0x65],ch
30002ee7:	61                   	popa   
30002ee8:	70 72                	jo     30002f5c <__GNU_EH_FRAME_HDR+0x390>
30002eea:	65 63 5f 74          	arpl   WORD PTR gs:[edi+0x74],bx
30002eee:	29 3d 30 78 25 30    	sub    DWORD PTR ds:0x30257830,edi
30002ef4:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
	...
30002eff:	00 47 4d             	add    BYTE PTR [edi+0x4d],al
30002f02:	54                   	push   esp
30002f03:	00 53 75             	add    BYTE PTR [ebx+0x75],dl
30002f06:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f07:	64                   	fs
30002f08:	61                   	popa   
30002f09:	79 00                	jns    30002f0b <__GNU_EH_FRAME_HDR+0x33f>
30002f0b:	4d                   	dec    ebp
30002f0c:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002f0d:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f0e:	64                   	fs
30002f0f:	61                   	popa   
30002f10:	79 00                	jns    30002f12 <__GNU_EH_FRAME_HDR+0x346>
30002f12:	54                   	push   esp
30002f13:	75 65                	jne    30002f7a <__GNU_EH_FRAME_HDR+0x3ae>
30002f15:	73 64                	jae    30002f7b <__GNU_EH_FRAME_HDR+0x3af>
30002f17:	61                   	popa   
30002f18:	79 00                	jns    30002f1a <__GNU_EH_FRAME_HDR+0x34e>
30002f1a:	57                   	push   edi
30002f1b:	65 64 6e             	gs outs dx,BYTE PTR fs:gs:[esi]
30002f1e:	65                   	gs
30002f1f:	73 64                	jae    30002f85 <__GNU_EH_FRAME_HDR+0x3b9>
30002f21:	61                   	popa   
30002f22:	79 00                	jns    30002f24 <__GNU_EH_FRAME_HDR+0x358>
30002f24:	54                   	push   esp
30002f25:	68 75 72 73 64       	push   0x64737275
30002f2a:	61                   	popa   
30002f2b:	79 00                	jns    30002f2d <__GNU_EH_FRAME_HDR+0x361>
30002f2d:	46                   	inc    esi
30002f2e:	72 69                	jb     30002f99 <__GNU_EH_FRAME_HDR+0x3cd>
30002f30:	64                   	fs
30002f31:	61                   	popa   
30002f32:	79 00                	jns    30002f34 <__GNU_EH_FRAME_HDR+0x368>
30002f34:	53                   	push   ebx
30002f35:	61                   	popa   
30002f36:	74 75                	je     30002fad <__GNU_EH_FRAME_HDR+0x3e1>
30002f38:	72 64                	jb     30002f9e <__GNU_EH_FRAME_HDR+0x3d2>
30002f3a:	61                   	popa   
30002f3b:	79 00                	jns    30002f3d <__GNU_EH_FRAME_HDR+0x371>
30002f3d:	53                   	push   ebx
30002f3e:	75 6e                	jne    30002fae <__GNU_EH_FRAME_HDR+0x3e2>
30002f40:	00 4d 6f             	add    BYTE PTR [ebp+0x6f],cl
30002f43:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f44:	00 54 75 65          	add    BYTE PTR [ebp+esi*2+0x65],dl
30002f48:	00 57 65             	add    BYTE PTR [edi+0x65],dl
30002f4b:	64 00 54 68 75       	add    BYTE PTR fs:[eax+ebp*2+0x75],dl
30002f50:	00 46 72             	add    BYTE PTR [esi+0x72],al
30002f53:	69 00 53 61 74 00    	imul   eax,DWORD PTR [eax],0x746153
30002f59:	4a                   	dec    edx
30002f5a:	61                   	popa   
30002f5b:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f5c:	75 61                	jne    30002fbf <__GNU_EH_FRAME_HDR+0x3f3>
30002f5e:	72 79                	jb     30002fd9 <__GNU_EH_FRAME_HDR+0x40d>
30002f60:	00 46 65             	add    BYTE PTR [esi+0x65],al
30002f63:	62 72 75             	bound  esi,QWORD PTR [edx+0x75]
30002f66:	61                   	popa   
30002f67:	72 79                	jb     30002fe2 <_ytab+0x2>
30002f69:	00 4d 61             	add    BYTE PTR [ebp+0x61],cl
30002f6c:	72 63                	jb     30002fd1 <__GNU_EH_FRAME_HDR+0x405>
30002f6e:	68 00 41 70 72       	push   0x72704100
30002f73:	69 6c 00 4d 61 79 00 	imul   ebp,DWORD PTR [eax+eax*1+0x4d],0x4a007961
30002f7a:	4a 
30002f7b:	75 6e                	jne    30002feb <_ytab+0xb>
30002f7d:	65 00 4a 75          	add    BYTE PTR gs:[edx+0x75],cl
30002f81:	6c                   	ins    BYTE PTR es:[edi],dx
30002f82:	79 00                	jns    30002f84 <__GNU_EH_FRAME_HDR+0x3b8>
30002f84:	41                   	inc    ecx
30002f85:	75 67                	jne    30002fee <_ytab+0xe>
30002f87:	75 73                	jne    30002ffc <_ytab+0x1c>
30002f89:	74 00                	je     30002f8b <__GNU_EH_FRAME_HDR+0x3bf>
30002f8b:	53                   	push   ebx
30002f8c:	65                   	gs
30002f8d:	70 74                	jo     30003003 <_ytab+0x23>
30002f8f:	65                   	gs
30002f90:	6d                   	ins    DWORD PTR es:[edi],dx
30002f91:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
30002f94:	00 4f 63             	add    BYTE PTR [edi+0x63],cl
30002f97:	74 6f                	je     30003008 <_ytab+0x28>
30002f99:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
30002f9c:	00 4e 6f             	add    BYTE PTR [esi+0x6f],cl
30002f9f:	76 65                	jbe    30003006 <_ytab+0x26>
30002fa1:	6d                   	ins    DWORD PTR es:[edi],dx
30002fa2:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
30002fa5:	00 44 65 63          	add    BYTE PTR [ebp+eiz*2+0x63],al
30002fa9:	65                   	gs
30002faa:	6d                   	ins    DWORD PTR es:[edi],dx
30002fab:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
30002fae:	00 4a 61             	add    BYTE PTR [edx+0x61],cl
30002fb1:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002fb2:	00 46 65             	add    BYTE PTR [esi+0x65],al
30002fb5:	62 00                	bound  eax,QWORD PTR [eax]
30002fb7:	4d                   	dec    ebp
30002fb8:	61                   	popa   
30002fb9:	72 00                	jb     30002fbb <__GNU_EH_FRAME_HDR+0x3ef>
30002fbb:	41                   	inc    ecx
30002fbc:	70 72                	jo     30003030 <_ytab+0x50>
30002fbe:	00 4a 75             	add    BYTE PTR [edx+0x75],cl
30002fc1:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002fc2:	00 4a 75             	add    BYTE PTR [edx+0x75],cl
30002fc5:	6c                   	ins    BYTE PTR es:[edi],dx
30002fc6:	00 41 75             	add    BYTE PTR [ecx+0x75],al
30002fc9:	67 00 53 65          	add    BYTE PTR [bp+di+0x65],dl
30002fcd:	70 00                	jo     30002fcf <__GNU_EH_FRAME_HDR+0x403>
30002fcf:	4f                   	dec    edi
30002fd0:	63 74 00 4e          	arpl   WORD PTR [eax+eax*1+0x4e],si
30002fd4:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002fd5:	76 00                	jbe    30002fd7 <__GNU_EH_FRAME_HDR+0x40b>
30002fd7:	44                   	inc    esp
30002fd8:	65 63 00             	arpl   WORD PTR gs:[eax],ax
30002fdb:	00 00                	add    BYTE PTR [eax],al
30002fdd:	00 00                	add    BYTE PTR [eax],al
	...

30002fe0 <_ytab>:
30002fe0:	1f                   	pop    ds
30002fe1:	00 00                	add    BYTE PTR [eax],al
30002fe3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002fe6:	00 00                	add    BYTE PTR [eax],al
30002fe8:	1f                   	pop    ds
30002fe9:	00 00                	add    BYTE PTR [eax],al
30002feb:	00 1e                	add    BYTE PTR [esi],bl
30002fed:	00 00                	add    BYTE PTR [eax],al
30002fef:	00 1f                	add    BYTE PTR [edi],bl
30002ff1:	00 00                	add    BYTE PTR [eax],al
30002ff3:	00 1e                	add    BYTE PTR [esi],bl
30002ff5:	00 00                	add    BYTE PTR [eax],al
30002ff7:	00 1f                	add    BYTE PTR [edi],bl
30002ff9:	00 00                	add    BYTE PTR [eax],al
30002ffb:	00 1f                	add    BYTE PTR [edi],bl
30002ffd:	00 00                	add    BYTE PTR [eax],al
30002fff:	00 1e                	add    BYTE PTR [esi],bl
30003001:	00 00                	add    BYTE PTR [eax],al
30003003:	00 1f                	add    BYTE PTR [edi],bl
30003005:	00 00                	add    BYTE PTR [eax],al
30003007:	00 1e                	add    BYTE PTR [esi],bl
30003009:	00 00                	add    BYTE PTR [eax],al
3000300b:	00 1f                	add    BYTE PTR [edi],bl
3000300d:	00 00                	add    BYTE PTR [eax],al
3000300f:	00 1f                	add    BYTE PTR [edi],bl
30003011:	00 00                	add    BYTE PTR [eax],al
30003013:	00 1d 00 00 00 1f    	add    BYTE PTR ds:0x1f000000,bl
30003019:	00 00                	add    BYTE PTR [eax],al
3000301b:	00 1e                	add    BYTE PTR [esi],bl
3000301d:	00 00                	add    BYTE PTR [eax],al
3000301f:	00 1f                	add    BYTE PTR [edi],bl
30003021:	00 00                	add    BYTE PTR [eax],al
30003023:	00 1e                	add    BYTE PTR [esi],bl
30003025:	00 00                	add    BYTE PTR [eax],al
30003027:	00 1f                	add    BYTE PTR [edi],bl
30003029:	00 00                	add    BYTE PTR [eax],al
3000302b:	00 1f                	add    BYTE PTR [edi],bl
3000302d:	00 00                	add    BYTE PTR [eax],al
3000302f:	00 1e                	add    BYTE PTR [esi],bl
30003031:	00 00                	add    BYTE PTR [eax],al
30003033:	00 1f                	add    BYTE PTR [edi],bl
30003035:	00 00                	add    BYTE PTR [eax],al
30003037:	00 1e                	add    BYTE PTR [esi],bl
30003039:	00 00                	add    BYTE PTR [eax],al
3000303b:	00 1f                	add    BYTE PTR [edi],bl
3000303d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .rel.dyn:

30003040 <.rel.dyn>:
30003040:	40                   	inc    eax
30003041:	33 00                	xor    eax,DWORD PTR [eax]
30003043:	30 08                	xor    BYTE PTR [eax],cl
30003045:	00 00                	add    BYTE PTR [eax],al
30003047:	00 44 33 00          	add    BYTE PTR [ebx+esi*1+0x0],al
3000304b:	30 08                	xor    BYTE PTR [eax],cl
3000304d:	00 00                	add    BYTE PTR [eax],al
3000304f:	00 48 33             	add    BYTE PTR [eax+0x33],cl
30003052:	00 30                	add    BYTE PTR [eax],dh
30003054:	08 00                	or     BYTE PTR [eax],al
30003056:	00 00                	add    BYTE PTR [eax],al
30003058:	4c                   	dec    esp
30003059:	33 00                	xor    eax,DWORD PTR [eax]
3000305b:	30 08                	xor    BYTE PTR [eax],cl
3000305d:	00 00                	add    BYTE PTR [eax],al
3000305f:	00 50 33             	add    BYTE PTR [eax+0x33],dl
30003062:	00 30                	add    BYTE PTR [eax],dh
30003064:	08 00                	or     BYTE PTR [eax],al
30003066:	00 00                	add    BYTE PTR [eax],al
30003068:	54                   	push   esp
30003069:	33 00                	xor    eax,DWORD PTR [eax]
3000306b:	30 08                	xor    BYTE PTR [eax],cl
3000306d:	00 00                	add    BYTE PTR [eax],al
3000306f:	00 80 33 00 30 08    	add    BYTE PTR [eax+0x8300033],al
30003075:	00 00                	add    BYTE PTR [eax],al
30003077:	00 84 33 00 30 08 00 	add    BYTE PTR [ebx+esi*1+0x83000],al
3000307e:	00 00                	add    BYTE PTR [eax],al
30003080:	88 33                	mov    BYTE PTR [ebx],dh
30003082:	00 30                	add    BYTE PTR [eax],dh
30003084:	08 00                	or     BYTE PTR [eax],al
30003086:	00 00                	add    BYTE PTR [eax],al
30003088:	8c 33                	mov    WORD PTR [ebx],?
3000308a:	00 30                	add    BYTE PTR [eax],dh
3000308c:	08 00                	or     BYTE PTR [eax],al
3000308e:	00 00                	add    BYTE PTR [eax],al
30003090:	90                   	nop
30003091:	33 00                	xor    eax,DWORD PTR [eax]
30003093:	30 08                	xor    BYTE PTR [eax],cl
30003095:	00 00                	add    BYTE PTR [eax],al
30003097:	00 94 33 00 30 08 00 	add    BYTE PTR [ebx+esi*1+0x83000],dl
3000309e:	00 00                	add    BYTE PTR [eax],al
300030a0:	98                   	cwde   
300030a1:	33 00                	xor    eax,DWORD PTR [eax]
300030a3:	30 08                	xor    BYTE PTR [eax],cl
300030a5:	00 00                	add    BYTE PTR [eax],al
300030a7:	00 9c 33 00 30 08 00 	add    BYTE PTR [ebx+esi*1+0x83000],bl
300030ae:	00 00                	add    BYTE PTR [eax],al
300030b0:	a0 33 00 30 08       	mov    al,ds:0x8300033
300030b5:	00 00                	add    BYTE PTR [eax],al
300030b7:	00 a4 33 00 30 08 00 	add    BYTE PTR [ebx+esi*1+0x83000],ah
300030be:	00 00                	add    BYTE PTR [eax],al
300030c0:	a8 33                	test   al,0x33
300030c2:	00 30                	add    BYTE PTR [eax],dh
300030c4:	08 00                	or     BYTE PTR [eax],al
300030c6:	00 00                	add    BYTE PTR [eax],al
300030c8:	ac                   	lods   al,BYTE PTR ds:[esi]
300030c9:	33 00                	xor    eax,DWORD PTR [eax]
300030cb:	30 08                	xor    BYTE PTR [eax],cl
300030cd:	00 00                	add    BYTE PTR [eax],al
300030cf:	00 b0 33 00 30 08    	add    BYTE PTR [eax+0x8300033],dh
300030d5:	00 00                	add    BYTE PTR [eax],al
300030d7:	00 b4 33 00 30 08 00 	add    BYTE PTR [ebx+esi*1+0x83000],dh
300030de:	00 00                	add    BYTE PTR [eax],al
300030e0:	b8 33 00 30 08       	mov    eax,0x8300033
300030e5:	00 00                	add    BYTE PTR [eax],al
300030e7:	00 bc 33 00 30 08 00 	add    BYTE PTR [ebx+esi*1+0x83000],bh
300030ee:	00 00                	add    BYTE PTR [eax],al
300030f0:	c0                   	(bad)  
300030f1:	33 00                	xor    eax,DWORD PTR [eax]
300030f3:	30 08                	xor    BYTE PTR [eax],cl
300030f5:	00 00                	add    BYTE PTR [eax],al
300030f7:	00 c4                	add    ah,al
300030f9:	33 00                	xor    eax,DWORD PTR [eax]
300030fb:	30 08                	xor    BYTE PTR [eax],cl
300030fd:	00 00                	add    BYTE PTR [eax],al
300030ff:	00 c8                	add    al,cl
30003101:	33 00                	xor    eax,DWORD PTR [eax]
30003103:	30 08                	xor    BYTE PTR [eax],cl
30003105:	00 00                	add    BYTE PTR [eax],al
30003107:	00 cc                	add    ah,cl
30003109:	33 00                	xor    eax,DWORD PTR [eax]
3000310b:	30 08                	xor    BYTE PTR [eax],cl
3000310d:	00 00                	add    BYTE PTR [eax],al
3000310f:	00 d0                	add    al,dl
30003111:	33 00                	xor    eax,DWORD PTR [eax]
30003113:	30 08                	xor    BYTE PTR [eax],cl
30003115:	00 00                	add    BYTE PTR [eax],al
30003117:	00 d4                	add    ah,dl
30003119:	33 00                	xor    eax,DWORD PTR [eax]
3000311b:	30 08                	xor    BYTE PTR [eax],cl
3000311d:	00 00                	add    BYTE PTR [eax],al
3000311f:	00 d8                	add    al,bl
30003121:	33 00                	xor    eax,DWORD PTR [eax]
30003123:	30 08                	xor    BYTE PTR [eax],cl
30003125:	00 00                	add    BYTE PTR [eax],al
30003127:	00 dc                	add    ah,bl
30003129:	33 00                	xor    eax,DWORD PTR [eax]
3000312b:	30 08                	xor    BYTE PTR [eax],cl
3000312d:	00 00                	add    BYTE PTR [eax],al
3000312f:	00 e0                	add    al,ah
30003131:	33 00                	xor    eax,DWORD PTR [eax]
30003133:	30 08                	xor    BYTE PTR [eax],cl
30003135:	00 00                	add    BYTE PTR [eax],al
30003137:	00 e4                	add    ah,ah
30003139:	33 00                	xor    eax,DWORD PTR [eax]
3000313b:	30 08                	xor    BYTE PTR [eax],cl
3000313d:	00 00                	add    BYTE PTR [eax],al
3000313f:	00 e8                	add    al,ch
30003141:	33 00                	xor    eax,DWORD PTR [eax]
30003143:	30 08                	xor    BYTE PTR [eax],cl
30003145:	00 00                	add    BYTE PTR [eax],al
30003147:	00 ec                	add    ah,ch
30003149:	33 00                	xor    eax,DWORD PTR [eax]
3000314b:	30 08                	xor    BYTE PTR [eax],cl
3000314d:	00 00                	add    BYTE PTR [eax],al
3000314f:	00 00                	add    BYTE PTR [eax],al
30003151:	34 00                	xor    al,0x0
30003153:	30 08                	xor    BYTE PTR [eax],cl
30003155:	00 00                	add    BYTE PTR [eax],al
30003157:	00 04 34             	add    BYTE PTR [esp+esi*1],al
3000315a:	00 30                	add    BYTE PTR [eax],dh
3000315c:	08 00                	or     BYTE PTR [eax],al
3000315e:	00 00                	add    BYTE PTR [eax],al
30003160:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
30003163:	30 08                	xor    BYTE PTR [eax],cl
30003165:	00 00                	add    BYTE PTR [eax],al
30003167:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
3000316a:	00 30                	add    BYTE PTR [eax],dh
3000316c:	08 00                	or     BYTE PTR [eax],al
3000316e:	00 00                	add    BYTE PTR [eax],al
30003170:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
30003173:	30 08                	xor    BYTE PTR [eax],cl
30003175:	00 00                	add    BYTE PTR [eax],al
30003177:	00 14 34             	add    BYTE PTR [esp+esi*1],dl
3000317a:	00 30                	add    BYTE PTR [eax],dh
3000317c:	08 00                	or     BYTE PTR [eax],al
3000317e:	00 00                	add    BYTE PTR [eax],al
30003180:	18 34 00             	sbb    BYTE PTR [eax+eax*1],dh
30003183:	30 08                	xor    BYTE PTR [eax],cl
30003185:	00 00                	add    BYTE PTR [eax],al
30003187:	00 1c 34             	add    BYTE PTR [esp+esi*1],bl
3000318a:	00 30                	add    BYTE PTR [eax],dh
3000318c:	08 00                	or     BYTE PTR [eax],al
3000318e:	00 00                	add    BYTE PTR [eax],al
30003190:	20 34 00             	and    BYTE PTR [eax+eax*1],dh
30003193:	30 08                	xor    BYTE PTR [eax],cl
30003195:	00 00                	add    BYTE PTR [eax],al
30003197:	00 24 34             	add    BYTE PTR [esp+esi*1],ah
3000319a:	00 30                	add    BYTE PTR [eax],dh
3000319c:	08 00                	or     BYTE PTR [eax],al
3000319e:	00 00                	add    BYTE PTR [eax],al
300031a0:	28 34 00             	sub    BYTE PTR [eax+eax*1],dh
300031a3:	30 08                	xor    BYTE PTR [eax],cl
300031a5:	00 00                	add    BYTE PTR [eax],al
300031a7:	00 2c 34             	add    BYTE PTR [esp+esi*1],ch
300031aa:	00 30                	add    BYTE PTR [eax],dh
300031ac:	08 00                	or     BYTE PTR [eax],al
300031ae:	00 00                	add    BYTE PTR [eax],al
300031b0:	d2 01                	rol    BYTE PTR [ecx],cl
300031b2:	00 30                	add    BYTE PTR [eax],dh
300031b4:	02 14 00             	add    dl,BYTE PTR [eax+eax*1]
300031b7:	00 12                	add    BYTE PTR [edx],dl
300031b9:	02 00                	add    al,BYTE PTR [eax]
300031bb:	30 02                	xor    BYTE PTR [edx],al
300031bd:	14 00                	adc    al,0x0
300031bf:	00 3b                	add    BYTE PTR [ebx],bh
300031c1:	02 00                	add    al,BYTE PTR [eax]
300031c3:	30 02                	xor    BYTE PTR [edx],al
300031c5:	14 00                	adc    al,0x0
300031c7:	00 98 02 00 30 02    	add    BYTE PTR [eax+0x2300002],bl
300031cd:	14 00                	adc    al,0x0
300031cf:	00 d9                	add    cl,bl
300031d1:	02 00                	add    al,BYTE PTR [eax]
300031d3:	30 02                	xor    BYTE PTR [edx],al
300031d5:	14 00                	adc    al,0x0
300031d7:	00 0f                	add    BYTE PTR [edi],cl
300031d9:	03 00                	add    eax,DWORD PTR [eax]
300031db:	30 02                	xor    BYTE PTR [edx],al
300031dd:	14 00                	adc    al,0x0
300031df:	00 45 03             	add    BYTE PTR [ebp+0x3],al
300031e2:	00 30                	add    BYTE PTR [eax],dh
300031e4:	02 14 00             	add    dl,BYTE PTR [eax+eax*1]
300031e7:	00 79 03             	add    BYTE PTR [ecx+0x3],bh
300031ea:	00 30                	add    BYTE PTR [eax],dh
300031ec:	02 14 00             	add    dl,BYTE PTR [eax+eax*1]
300031ef:	00 aa 03 00 30 02    	add    BYTE PTR [edx+0x2300003],ch
300031f5:	14 00                	adc    al,0x0
300031f7:	00 d5                	add    ch,dl
300031f9:	03 00                	add    eax,DWORD PTR [eax]
300031fb:	30 02                	xor    BYTE PTR [edx],al
300031fd:	14 00                	adc    al,0x0
300031ff:	00 f4                	add    ah,dh
30003201:	04 00                	add    al,0x0
30003203:	30 02                	xor    BYTE PTR [edx],al
30003205:	14 00                	adc    al,0x0
30003207:	00 1a                	add    BYTE PTR [edx],bl
30003209:	05 00 30 02 14       	add    eax,0x14023000
3000320e:	00 00                	add    BYTE PTR [eax],al
30003210:	42                   	inc    edx
30003211:	05 00 30 02 14       	add    eax,0x14023000
30003216:	00 00                	add    BYTE PTR [eax],al
30003218:	4d                   	dec    ebp
30003219:	07                   	pop    es
3000321a:	00 30                	add    BYTE PTR [eax],dh
3000321c:	02 14 00             	add    dl,BYTE PTR [eax+eax*1]
3000321f:	00 15 09 00 30 02    	add    BYTE PTR ds:0x2300009,dl
30003225:	14 00                	adc    al,0x0
30003227:	00 6d 13             	add    BYTE PTR [ebp+0x13],ch
3000322a:	00 30                	add    BYTE PTR [eax],dh
3000322c:	02 14 00             	add    dl,BYTE PTR [eax+eax*1]
3000322f:	00 64 33 00          	add    BYTE PTR [ebx+esi*1+0x0],ah
30003233:	30 07                	xor    BYTE PTR [edi],al
30003235:	01 00                	add    DWORD PTR [eax],eax
30003237:	00 68 33             	add    BYTE PTR [eax+0x33],ch
3000323a:	00 30                	add    BYTE PTR [eax],dh
3000323c:	07                   	pop    es
3000323d:	04 00                	add    al,0x0
3000323f:	00 6c 33 00          	add    BYTE PTR [ebx+esi*1+0x0],ch
30003243:	30 07                	xor    BYTE PTR [edi],al
30003245:	0b 00                	or     eax,DWORD PTR [eax]
30003247:	00 70 33             	add    BYTE PTR [eax+0x33],dh
3000324a:	00 30                	add    BYTE PTR [eax],dh
3000324c:	07                   	pop    es
3000324d:	20 00                	and    BYTE PTR [eax],al
	...

Disassembly of section .data:

30003260 <a>:
30003260:	7b 00                	jnp    30003262 <a+0x2>
	...

30003264 <b>:
30003264:	c8 01 00 00          	enter  0x1,0x0

30003268 <c>:
30003268:	15 03 00 00 00       	adc    eax,0x3
	...

30003280 <console_node>:
30003280:	01 00                	add    DWORD PTR [eax],eax
	...

300032a4 <_daylight>:
300032a4:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

300032a8 <_DYNAMIC>:
300032a8:	04 00                	add    al,0x0
300032aa:	00 00                	add    BYTE PTR [eax],al
300032ac:	b0 2a                	mov    al,0x2a
300032ae:	00 30                	add    BYTE PTR [eax],dh
300032b0:	05 00 00 00 ac       	add    eax,0xac000000
300032b5:	29 00                	sub    DWORD PTR [eax],eax
300032b7:	30 06                	xor    BYTE PTR [esi],al
300032b9:	00 00                	add    BYTE PTR [eax],al
300032bb:	00 6c 27 00          	add    BYTE PTR [edi+eiz*1+0x0],ch
300032bf:	30 0a                	xor    BYTE PTR [edx],cl
300032c1:	00 00                	add    BYTE PTR [eax],al
300032c3:	00 02                	add    BYTE PTR [edx],al
300032c5:	01 00                	add    DWORD PTR [eax],eax
300032c7:	00 0b                	add    BYTE PTR [ebx],cl
300032c9:	00 00                	add    BYTE PTR [eax],al
300032cb:	00 10                	add    BYTE PTR [eax],dl
300032cd:	00 00                	add    BYTE PTR [eax],al
300032cf:	00 03                	add    BYTE PTR [ebx],al
300032d1:	00 00                	add    BYTE PTR [eax],al
300032d3:	00 58 33             	add    BYTE PTR [eax+0x33],bl
300032d6:	00 30                	add    BYTE PTR [eax],dh
300032d8:	02 00                	add    al,BYTE PTR [eax]
300032da:	00 00                	add    BYTE PTR [eax],al
300032dc:	20 00                	and    BYTE PTR [eax],al
300032de:	00 00                	add    BYTE PTR [eax],al
300032e0:	14 00                	adc    al,0x0
300032e2:	00 00                	add    BYTE PTR [eax],al
300032e4:	11 00                	adc    DWORD PTR [eax],eax
300032e6:	00 00                	add    BYTE PTR [eax],al
300032e8:	17                   	pop    ss
300032e9:	00 00                	add    BYTE PTR [eax],al
300032eb:	00 30                	add    BYTE PTR [eax],dh
300032ed:	32 00                	xor    al,BYTE PTR [eax]
300032ef:	30 11                	xor    BYTE PTR [ecx],dl
300032f1:	00 00                	add    BYTE PTR [eax],al
300032f3:	00 40 30             	add    BYTE PTR [eax+0x30],al
300032f6:	00 30                	add    BYTE PTR [eax],dh
300032f8:	12 00                	adc    al,BYTE PTR [eax]
300032fa:	00 00                	add    BYTE PTR [eax],al
300032fc:	f0 01 00             	lock add DWORD PTR [eax],eax
300032ff:	00 13                	add    BYTE PTR [ebx],dl
30003301:	00 00                	add    BYTE PTR [eax],al
30003303:	00 08                	add    BYTE PTR [eax],cl
30003305:	00 00                	add    BYTE PTR [eax],al
30003307:	00 16                	add    BYTE PTR [esi],dl
30003309:	00 00                	add    BYTE PTR [eax],al
3000330b:	00 00                	add    BYTE PTR [eax],al
3000330d:	00 00                	add    BYTE PTR [eax],al
3000330f:	00 fa                	add    dl,bh
30003311:	ff                   	(bad)  
30003312:	ff 6f 2e             	jmp    FWORD PTR [edi+0x2e]
	...

Disassembly of section .got:

30003340 <.got>:
30003340:	44                   	inc    esp
30003341:	34 00                	xor    al,0x0
30003343:	30 4c 34 00          	xor    BYTE PTR [esp+esi*1+0x0],cl
30003347:	30 30                	xor    BYTE PTR [eax],dh
30003349:	34 00                	xor    al,0x0
3000334b:	30 34 34             	xor    BYTE PTR [esp+esi*1],dh
3000334e:	00 30                	add    BYTE PTR [eax],dh
30003350:	38 34 00             	cmp    BYTE PTR [eax+eax*1],dh
30003353:	30 3c 34             	xor    BYTE PTR [esp+esi*1],bh
30003356:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .got.plt:

30003358 <_GLOBAL_OFFSET_TABLE_>:
30003358:	a8 32                	test   al,0x32
3000335a:	00 30                	add    BYTE PTR [eax],dh
	...
30003364:	86 1f                	xchg   BYTE PTR [edi],bl
30003366:	00 30                	add    BYTE PTR [eax],dh
30003368:	96                   	xchg   esi,eax
30003369:	1f                   	pop    ds
3000336a:	00 30                	add    BYTE PTR [eax],dh
3000336c:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
3000336d:	1f                   	pop    ds
3000336e:	00 30                	add    BYTE PTR [eax],dh
30003370:	b6 1f                	mov    dh,0x1f
30003372:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .data.rel.local:

30003380 <_tzname>:
30003380:	00 2f                	add    BYTE PTR [edi],ch
30003382:	00 30                	add    BYTE PTR [eax],dh
30003384:	00 2f                	add    BYTE PTR [edi],ch
30003386:	00 30                	add    BYTE PTR [eax],dh

30003388 <_days>:
30003388:	04 2f                	add    al,0x2f
3000338a:	00 30                	add    BYTE PTR [eax],dh
3000338c:	0b 2f                	or     ebp,DWORD PTR [edi]
3000338e:	00 30                	add    BYTE PTR [eax],dh
30003390:	12 2f                	adc    ch,BYTE PTR [edi]
30003392:	00 30                	add    BYTE PTR [eax],dh
30003394:	1a 2f                	sbb    ch,BYTE PTR [edi]
30003396:	00 30                	add    BYTE PTR [eax],dh
30003398:	24 2f                	and    al,0x2f
3000339a:	00 30                	add    BYTE PTR [eax],dh
3000339c:	2d 2f 00 30 34       	sub    eax,0x3430002f
300033a1:	2f                   	das    
300033a2:	00 30                	add    BYTE PTR [eax],dh

300033a4 <_days_abbrev>:
300033a4:	3d 2f 00 30 41       	cmp    eax,0x4130002f
300033a9:	2f                   	das    
300033aa:	00 30                	add    BYTE PTR [eax],dh
300033ac:	45                   	inc    ebp
300033ad:	2f                   	das    
300033ae:	00 30                	add    BYTE PTR [eax],dh
300033b0:	49                   	dec    ecx
300033b1:	2f                   	das    
300033b2:	00 30                	add    BYTE PTR [eax],dh
300033b4:	4d                   	dec    ebp
300033b5:	2f                   	das    
300033b6:	00 30                	add    BYTE PTR [eax],dh
300033b8:	51                   	push   ecx
300033b9:	2f                   	das    
300033ba:	00 30                	add    BYTE PTR [eax],dh
300033bc:	55                   	push   ebp
300033bd:	2f                   	das    
300033be:	00 30                	add    BYTE PTR [eax],dh

300033c0 <_months>:
300033c0:	59                   	pop    ecx
300033c1:	2f                   	das    
300033c2:	00 30                	add    BYTE PTR [eax],dh
300033c4:	61                   	popa   
300033c5:	2f                   	das    
300033c6:	00 30                	add    BYTE PTR [eax],dh
300033c8:	6a 2f                	push   0x2f
300033ca:	00 30                	add    BYTE PTR [eax],dh
300033cc:	70 2f                	jo     300033fd <_months+0x3d>
300033ce:	00 30                	add    BYTE PTR [eax],dh
300033d0:	76 2f                	jbe    30003401 <_months_abbrev+0x1>
300033d2:	00 30                	add    BYTE PTR [eax],dh
300033d4:	7a 2f                	jp     30003405 <_months_abbrev+0x5>
300033d6:	00 30                	add    BYTE PTR [eax],dh
300033d8:	7f 2f                	jg     30003409 <_months_abbrev+0x9>
300033da:	00 30                	add    BYTE PTR [eax],dh
300033dc:	84 2f                	test   BYTE PTR [edi],ch
300033de:	00 30                	add    BYTE PTR [eax],dh
300033e0:	8b 2f                	mov    ebp,DWORD PTR [edi]
300033e2:	00 30                	add    BYTE PTR [eax],dh
300033e4:	95                   	xchg   ebp,eax
300033e5:	2f                   	das    
300033e6:	00 30                	add    BYTE PTR [eax],dh
300033e8:	9d                   	popf   
300033e9:	2f                   	das    
300033ea:	00 30                	add    BYTE PTR [eax],dh
300033ec:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
300033ed:	2f                   	das    
300033ee:	00 30                	add    BYTE PTR [eax],dh
	...

30003400 <_months_abbrev>:
30003400:	af                   	scas   eax,DWORD PTR es:[edi]
30003401:	2f                   	das    
30003402:	00 30                	add    BYTE PTR [eax],dh
30003404:	b3 2f                	mov    bl,0x2f
30003406:	00 30                	add    BYTE PTR [eax],dh
30003408:	b7 2f                	mov    bh,0x2f
3000340a:	00 30                	add    BYTE PTR [eax],dh
3000340c:	bb 2f 00 30 76       	mov    ebx,0x7630002f
30003411:	2f                   	das    
30003412:	00 30                	add    BYTE PTR [eax],dh
30003414:	bf 2f 00 30 c3       	mov    edi,0xc330002f
30003419:	2f                   	das    
3000341a:	00 30                	add    BYTE PTR [eax],dh
3000341c:	c7                   	(bad)  
3000341d:	2f                   	das    
3000341e:	00 30                	add    BYTE PTR [eax],dh
30003420:	cb                   	retf   
30003421:	2f                   	das    
30003422:	00 30                	add    BYTE PTR [eax],dh
30003424:	cf                   	iret   
30003425:	2f                   	das    
30003426:	00 30                	add    BYTE PTR [eax],dh
30003428:	d3 2f                	shr    DWORD PTR [edi],cl
3000342a:	00 30                	add    BYTE PTR [eax],dh
3000342c:	d7                   	xlat   BYTE PTR ds:[ebx]
3000342d:	2f                   	das    
3000342e:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .bss:

30003430 <heapEnd>:
30003430:	00 00                	add    BYTE PTR [eax],al
	...

30003434 <heapBase>:
30003434:	00 00                	add    BYTE PTR [eax],al
	...

30003438 <heapCurr>:
30003438:	00 00                	add    BYTE PTR [eax],al
	...

3000343c <libcTZ>:
3000343c:	00 00                	add    BYTE PTR [eax],al
	...

30003440 <lasts.1234>:
30003440:	00 00                	add    BYTE PTR [eax],al
	...

30003444 <fops>:
	...

3000344c <console_file>:
	...

3000345c <_dstbias>:
3000345c:	00 00                	add    BYTE PTR [eax],al
	...

30003460 <ticksToWait>:
30003460:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	53                   	push   ebx
       1:	01 00                	add    DWORD PTR [eax],eax
       3:	00 04 00             	add    BYTE PTR [eax+eax*1],al
       6:	00 00                	add    BYTE PTR [eax],al
       8:	00 00                	add    BYTE PTR [eax],al
       a:	04 01                	add    al,0x1
       c:	ef                   	out    dx,eax
       d:	00 00                	add    BYTE PTR [eax],al
       f:	00 0c b3             	add    BYTE PTR [ebx+esi*4],cl
      12:	00 00                	add    BYTE PTR [eax],al
      14:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
      17:	00 00                	add    BYTE PTR [eax],al
      19:	00 00                	add    BYTE PTR [eax],al
      1b:	00 30                	add    BYTE PTR [eax],dh
      1d:	70 00                	jo     1f <sysEnter_Vector-0x12ffe1>
      1f:	00 00                	add    BYTE PTR [eax],al
      21:	00 00                	add    BYTE PTR [eax],al
      23:	00 00                	add    BYTE PTR [eax],al
      25:	02 01                	add    al,BYTE PTR [ecx]
      27:	06                   	push   es
      28:	58                   	pop    eax
      29:	00 00                	add    BYTE PTR [eax],al
      2b:	00 02                	add    BYTE PTR [edx],al
      2d:	01 06                	add    DWORD PTR [esi],eax
      2f:	51                   	push   ecx
      30:	00 00                	add    BYTE PTR [eax],al
      32:	00 02                	add    BYTE PTR [edx],al
      34:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
      3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
      41:	02 08                	add    cl,BYTE PTR [eax]
      43:	05 00 00 00 00       	add    eax,0x0
      48:	02 01                	add    al,BYTE PTR [ecx]
      4a:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
      4d:	00 00                	add    BYTE PTR [eax],al
      4f:	02 02                	add    al,BYTE PTR [edx]
      51:	07                   	pop    es
      52:	0e                   	push   cs
      53:	00 00                	add    BYTE PTR [eax],al
      55:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
      58:	00 00                	add    BYTE PTR [eax],al
      5a:	00 02                	add    BYTE PTR [edx],al
      5c:	34 61                	xor    al,0x61
      5e:	00 00                	add    BYTE PTR [eax],al
      60:	00 02                	add    BYTE PTR [edx],al
      62:	04 07                	add    al,0x7
      64:	32 00                	xor    al,BYTE PTR [eax]
      66:	00 00                	add    BYTE PTR [eax],al
      68:	02 08                	add    cl,BYTE PTR [eax]
      6a:	07                   	pop    es
      6b:	28 00                	sub    BYTE PTR [eax],al
      6d:	00 00                	add    BYTE PTR [eax],al
      6f:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
      76:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
      79:	96                   	xchg   esi,eax
      7a:	00 00                	add    BYTE PTR [eax],al
      7c:	00 02                	add    BYTE PTR [edx],al
      7e:	01 02                	add    DWORD PTR [edx],eax
      80:	90                   	nop
      81:	00 00                	add    BYTE PTR [eax],al
      83:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
      8a:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
      8d:	00 00                	add    BYTE PTR [eax],al
      8f:	05 04 95 00 00       	add    eax,0x9504
      94:	00 06                	add    BYTE PTR [esi],al
      96:	25 00 00 00 02       	and    eax,0x2000000
      9b:	04 07                	add    al,0x7
      9d:	2d 00 00 00 02       	sub    eax,0x2000000
      a2:	04 07                	add    al,0x7
      a4:	dc 00                	fadd   QWORD PTR [eax]
      a6:	00 00                	add    BYTE PTR [eax],al
      a8:	05 04 25 00 00       	add    eax,0x2504
      ad:	00 07                	add    BYTE PTR [edi],al
      af:	21 00                	and    DWORD PTR [eax],eax
      b1:	00 00                	add    BYTE PTR [eax],al
      b3:	01 08                	add    DWORD PTR [eax],ecx
      b5:	a8 00                	test   al,0x0
      b7:	00 00                	add    BYTE PTR [eax],al
      b9:	00 00                	add    BYTE PTR [eax],al
      bb:	00 30                	add    BYTE PTR [eax],dh
      bd:	38 00                	cmp    BYTE PTR [eax],al
      bf:	00 00                	add    BYTE PTR [eax],al
      c1:	01 9c e0 00 00 00 08 	add    DWORD PTR [eax+eiz*8+0x8000000],ebx
      c8:	73 00                	jae    ca <sysEnter_Vector-0x12ff36>
      ca:	01 08                	add    DWORD PTR [eax],ecx
      cc:	8f 00                	pop    DWORD PTR [eax]
      ce:	00 00                	add    BYTE PTR [eax],al
      d0:	02 91 00 08 63 00    	add    dl,BYTE PTR [ecx+0x630800]
      d6:	01 08                	add    DWORD PTR [eax],ecx
      d8:	3a 00                	cmp    al,BYTE PTR [eax]
      da:	00 00                	add    BYTE PTR [eax],al
      dc:	02 91 04 00 07 a2    	add    dl,BYTE PTR [ecx-0x5df8fffc]
      e2:	00 00                	add    BYTE PTR [eax],al
      e4:	00 01                	add    BYTE PTR [ecx],al
      e6:	10 a8 00 00 00 38    	adc    BYTE PTR [eax+0x38000000],ch
      ec:	00 00                	add    BYTE PTR [eax],al
      ee:	30 38                	xor    BYTE PTR [eax],bh
      f0:	00 00                	add    BYTE PTR [eax],al
      f2:	00 01                	add    BYTE PTR [ecx],al
      f4:	9c                   	pushf  
      f5:	12 01                	adc    al,BYTE PTR [ecx]
      f7:	00 00                	add    BYTE PTR [eax],al
      f9:	08 73 00             	or     BYTE PTR [ebx+0x0],dh
      fc:	01 10                	add    DWORD PTR [eax],edx
      fe:	8f 00                	pop    DWORD PTR [eax]
     100:	00 00                	add    BYTE PTR [eax],al
     102:	02 91 00 08 63 00    	add    dl,BYTE PTR [ecx+0x630800]
     108:	01 10                	add    DWORD PTR [eax],edx
     10a:	3a 00                	cmp    al,BYTE PTR [eax]
     10c:	00 00                	add    BYTE PTR [eax],al
     10e:	02 91 04 00 09 3f    	add    dl,BYTE PTR [ecx+0x3f090004]
     114:	00 00                	add    BYTE PTR [eax],al
     116:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
     119:	56                   	push   esi
     11a:	00 00                	add    BYTE PTR [eax],al
     11c:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
     122:	30 09                	xor    BYTE PTR [ecx],cl
     124:	aa                   	stos   BYTE PTR es:[edi],al
     125:	00 00                	add    BYTE PTR [eax],al
     127:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     12a:	56                   	push   esi
     12b:	00 00                	add    BYTE PTR [eax],al
     12d:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
     133:	30 09                	xor    BYTE PTR [ecx],cl
     135:	56                   	push   esi
     136:	01 00                	add    DWORD PTR [eax],eax
     138:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     13f:	05 03 30 34 00       	add    eax,0x343003
     144:	30 09                	xor    BYTE PTR [ecx],cl
     146:	48                   	dec    eax
     147:	00 00                	add    BYTE PTR [eax],al
     149:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     14f:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
     155:	30 00                	xor    BYTE PTR [eax],al
     157:	92                   	xchg   edx,eax
     158:	01 00                	add    DWORD PTR [eax],eax
     15a:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     15d:	83 00 00             	add    DWORD PTR [eax],0x0
     160:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     163:	ef                   	out    dx,eax
     164:	00 00                	add    BYTE PTR [eax],al
     166:	00 0c 6b             	add    BYTE PTR [ebx+ebp*2],cl
     169:	01 00                	add    DWORD PTR [eax],eax
     16b:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
     16e:	00 00                	add    BYTE PTR [eax],al
     170:	70 00                	jo     172 <sysEnter_Vector-0x12fe8e>
     172:	00 30                	add    BYTE PTR [eax],dh
     174:	aa                   	stos   BYTE PTR es:[edi],al
     175:	00 00                	add    BYTE PTR [eax],al
     177:	00 de                	add    dh,bl
     179:	00 00                	add    BYTE PTR [eax],al
     17b:	00 02                	add    BYTE PTR [edx],al
     17d:	01 06                	add    DWORD PTR [esi],eax
     17f:	58                   	pop    eax
     180:	00 00                	add    BYTE PTR [eax],al
     182:	00 02                	add    BYTE PTR [edx],al
     184:	01 06                	add    DWORD PTR [esi],eax
     186:	51                   	push   ecx
     187:	00 00                	add    BYTE PTR [eax],al
     189:	00 02                	add    BYTE PTR [edx],al
     18b:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
     191:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     198:	02 08                	add    cl,BYTE PTR [eax]
     19a:	05 00 00 00 00       	add    eax,0x0
     19f:	02 01                	add    al,BYTE PTR [ecx]
     1a1:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
     1a4:	00 00                	add    BYTE PTR [eax],al
     1a6:	02 02                	add    al,BYTE PTR [edx]
     1a8:	07                   	pop    es
     1a9:	0e                   	push   cs
     1aa:	00 00                	add    BYTE PTR [eax],al
     1ac:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
     1af:	00 00                	add    BYTE PTR [eax],al
     1b1:	00 02                	add    BYTE PTR [edx],al
     1b3:	34 61                	xor    al,0x61
     1b5:	00 00                	add    BYTE PTR [eax],al
     1b7:	00 02                	add    BYTE PTR [edx],al
     1b9:	04 07                	add    al,0x7
     1bb:	32 00                	xor    al,BYTE PTR [eax]
     1bd:	00 00                	add    BYTE PTR [eax],al
     1bf:	02 08                	add    cl,BYTE PTR [eax]
     1c1:	07                   	pop    es
     1c2:	28 00                	sub    BYTE PTR [eax],al
     1c4:	00 00                	add    BYTE PTR [eax],al
     1c6:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
     1cd:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
     1d0:	96                   	xchg   esi,eax
     1d1:	00 00                	add    BYTE PTR [eax],al
     1d3:	00 02                	add    BYTE PTR [edx],al
     1d5:	01 02                	add    DWORD PTR [edx],eax
     1d7:	90                   	nop
     1d8:	00 00                	add    BYTE PTR [eax],al
     1da:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
     1e1:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
     1e4:	00 00                	add    BYTE PTR [eax],al
     1e6:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     1e9:	2d 00 00 00 02       	sub    eax,0x2000000
     1ee:	04 07                	add    al,0x7
     1f0:	dc 00                	fadd   QWORD PTR [eax]
     1f2:	00 00                	add    BYTE PTR [eax],al
     1f4:	05 04 25 00 00       	add    eax,0x2504
     1f9:	00 06                	add    BYTE PTR [esi],al
     1fb:	95                   	xchg   ebp,eax
     1fc:	01 00                	add    DWORD PTR [eax],eax
     1fe:	00 01                	add    BYTE PTR [ecx],al
     200:	25 3a 00 00 00       	and    eax,0x3a
     205:	70 00                	jo     207 <sysEnter_Vector-0x12fdf9>
     207:	00 30                	add    BYTE PTR [eax],dh
     209:	55                   	push   ebp
     20a:	00 00                	add    BYTE PTR [eax],al
     20c:	00 01                	add    BYTE PTR [ecx],al
     20e:	9c                   	pushf  
     20f:	fa                   	cli    
     210:	00 00                	add    BYTE PTR [eax],al
     212:	00 07                	add    BYTE PTR [edi],al
     214:	5e                   	pop    esi
     215:	01 00                	add    DWORD PTR [eax],eax
     217:	00 01                	add    BYTE PTR [ecx],al
     219:	25 9d 00 00 00       	and    eax,0x9d
     21e:	02 91 00 07 65 01    	add    dl,BYTE PTR [ecx+0x1650700]
     224:	00 00                	add    BYTE PTR [eax],al
     226:	01 25 9d 00 00 00    	add    DWORD PTR ds:0x9d,esp
     22c:	02 91 04 08 63 00    	add    dl,BYTE PTR [ecx+0x630804]
     232:	01 27                	add    DWORD PTR [edi],esp
     234:	25 00 00 00 01       	and    eax,0x1000000
     239:	51                   	push   ecx
     23a:	08 70 00             	or     BYTE PTR [eax+0x0],dh
     23d:	01 27                	add    DWORD PTR [edi],esp
     23f:	9d                   	popf   
     240:	00 00                	add    BYTE PTR [eax],al
     242:	00 01                	add    BYTE PTR [ecx],al
     244:	56                   	push   esi
     245:	08 73 00             	or     BYTE PTR [ebx+0x0],dh
     248:	01 27                	add    DWORD PTR [edi],esp
     24a:	9d                   	popf   
     24b:	00 00                	add    BYTE PTR [eax],al
     24d:	00 01                	add    BYTE PTR [ecx],al
     24f:	53                   	push   ebx
     250:	00 06                	add    BYTE PTR [esi],al
     252:	9d                   	popf   
     253:	01 00                	add    DWORD PTR [eax],eax
     255:	00 01                	add    BYTE PTR [ecx],al
     257:	33 3a                	xor    edi,DWORD PTR [edx]
     259:	00 00                	add    BYTE PTR [eax],al
     25b:	00 c5                	add    ch,al
     25d:	00 00                	add    BYTE PTR [eax],al
     25f:	30 55 00             	xor    BYTE PTR [ebp+0x0],dl
     262:	00 00                	add    BYTE PTR [eax],al
     264:	01 9c 51 01 00 00 07 	add    DWORD PTR [ecx+edx*2+0x7000001],ebx
     26b:	5e                   	pop    esi
     26c:	01 00                	add    DWORD PTR [eax],eax
     26e:	00 01                	add    BYTE PTR [ecx],al
     270:	33 9d 00 00 00 02    	xor    ebx,DWORD PTR [ebp+0x2000000]
     276:	91                   	xchg   ecx,eax
     277:	00 07                	add    BYTE PTR [edi],al
     279:	65 01 00             	add    DWORD PTR gs:[eax],eax
     27c:	00 01                	add    BYTE PTR [ecx],al
     27e:	33 9d 00 00 00 02    	xor    ebx,DWORD PTR [ebp+0x2000000]
     284:	91                   	xchg   ecx,eax
     285:	04 08                	add    al,0x8
     287:	63 00                	arpl   WORD PTR [eax],ax
     289:	01 35 25 00 00 00    	add    DWORD PTR ds:0x25,esi
     28f:	01 51 08             	add    DWORD PTR [ecx+0x8],edx
     292:	70 00                	jo     294 <sysEnter_Vector-0x12fd6c>
     294:	01 35 9d 00 00 00    	add    DWORD PTR ds:0x9d,esi
     29a:	01 56 08             	add    DWORD PTR [esi+0x8],edx
     29d:	73 00                	jae    29f <sysEnter_Vector-0x12fd61>
     29f:	01 35 9d 00 00 00    	add    DWORD PTR ds:0x9d,esi
     2a5:	01 53 00             	add    DWORD PTR [ebx+0x0],edx
     2a8:	09 3f                	or     DWORD PTR [edi],edi
     2aa:	00 00                	add    BYTE PTR [eax],al
     2ac:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
     2af:	56                   	push   esi
     2b0:	00 00                	add    BYTE PTR [eax],al
     2b2:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
     2b8:	30 09                	xor    BYTE PTR [ecx],cl
     2ba:	aa                   	stos   BYTE PTR es:[edi],al
     2bb:	00 00                	add    BYTE PTR [eax],al
     2bd:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     2c0:	56                   	push   esi
     2c1:	00 00                	add    BYTE PTR [eax],al
     2c3:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
     2c9:	30 09                	xor    BYTE PTR [ecx],cl
     2cb:	56                   	push   esi
     2cc:	01 00                	add    DWORD PTR [eax],eax
     2ce:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     2d5:	05 03 30 34 00       	add    eax,0x343003
     2da:	30 09                	xor    BYTE PTR [ecx],cl
     2dc:	48                   	dec    eax
     2dd:	00 00                	add    BYTE PTR [eax],al
     2df:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     2e5:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
     2eb:	30 00                	xor    BYTE PTR [eax],al
     2ed:	35 01 00 00 04       	xor    eax,0x4000001
     2f2:	00 0e                	add    BYTE PTR [esi],cl
     2f4:	01 00                	add    DWORD PTR [eax],eax
     2f6:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     2f9:	ef                   	out    dx,eax
     2fa:	00 00                	add    BYTE PTR [eax],al
     2fc:	00 0c a6             	add    BYTE PTR [esi+eiz*4],cl
     2ff:	01 00                	add    DWORD PTR [eax],eax
     301:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
     304:	00 00                	add    BYTE PTR [eax],al
     306:	1c 01                	sbb    al,0x1
     308:	00 30                	add    BYTE PTR [eax],dh
     30a:	97                   	xchg   edi,eax
     30b:	00 00                	add    BYTE PTR [eax],al
     30d:	00 ef                	add    bh,ch
     30f:	01 00                	add    DWORD PTR [eax],eax
     311:	00 02                	add    BYTE PTR [edx],al
     313:	01 06                	add    DWORD PTR [esi],eax
     315:	58                   	pop    eax
     316:	00 00                	add    BYTE PTR [eax],al
     318:	00 02                	add    BYTE PTR [edx],al
     31a:	01 06                	add    DWORD PTR [esi],eax
     31c:	51                   	push   ecx
     31d:	00 00                	add    BYTE PTR [eax],al
     31f:	00 02                	add    BYTE PTR [edx],al
     321:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
     327:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     32e:	02 08                	add    cl,BYTE PTR [eax]
     330:	05 00 00 00 00       	add    eax,0x0
     335:	02 01                	add    al,BYTE PTR [ecx]
     337:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
     33a:	00 00                	add    BYTE PTR [eax],al
     33c:	02 02                	add    al,BYTE PTR [edx]
     33e:	07                   	pop    es
     33f:	0e                   	push   cs
     340:	00 00                	add    BYTE PTR [eax],al
     342:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
     345:	00 00                	add    BYTE PTR [eax],al
     347:	00 02                	add    BYTE PTR [edx],al
     349:	34 61                	xor    al,0x61
     34b:	00 00                	add    BYTE PTR [eax],al
     34d:	00 02                	add    BYTE PTR [edx],al
     34f:	04 07                	add    al,0x7
     351:	32 00                	xor    al,BYTE PTR [eax]
     353:	00 00                	add    BYTE PTR [eax],al
     355:	02 08                	add    cl,BYTE PTR [eax]
     357:	07                   	pop    es
     358:	28 00                	sub    BYTE PTR [eax],al
     35a:	00 00                	add    BYTE PTR [eax],al
     35c:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
     363:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
     366:	96                   	xchg   esi,eax
     367:	00 00                	add    BYTE PTR [eax],al
     369:	00 02                	add    BYTE PTR [edx],al
     36b:	01 02                	add    DWORD PTR [edx],eax
     36d:	90                   	nop
     36e:	00 00                	add    BYTE PTR [eax],al
     370:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
     377:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
     37a:	00 00                	add    BYTE PTR [eax],al
     37c:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     37f:	2d 00 00 00 02       	sub    eax,0x2000000
     384:	04 07                	add    al,0x7
     386:	dc 00                	fadd   QWORD PTR [eax]
     388:	00 00                	add    BYTE PTR [eax],al
     38a:	05 04 25 00 00       	add    eax,0x2504
     38f:	00 06                	add    BYTE PTR [esi],al
     391:	db 01                	fild   DWORD PTR [ecx]
     393:	00 00                	add    BYTE PTR [eax],al
     395:	01 28                	add    DWORD PTR [eax],ebp
     397:	9d                   	popf   
     398:	00 00                	add    BYTE PTR [eax],al
     39a:	00 1c 01             	add    BYTE PTR [ecx+eax*1],bl
     39d:	00 30                	add    BYTE PTR [eax],dh
     39f:	97                   	xchg   edi,eax
     3a0:	00 00                	add    BYTE PTR [eax],al
     3a2:	00 01                	add    BYTE PTR [ecx],al
     3a4:	9c                   	pushf  
     3a5:	f4                   	hlt    
     3a6:	00 00                	add    BYTE PTR [eax],al
     3a8:	00 07                	add    BYTE PTR [edi],al
     3aa:	73 00                	jae    3ac <sysEnter_Vector-0x12fc54>
     3ac:	01 28                	add    DWORD PTR [eax],ebp
     3ae:	9d                   	popf   
     3af:	00 00                	add    BYTE PTR [eax],al
     3b1:	00 02                	add    BYTE PTR [edx],al
     3b3:	91                   	xchg   ecx,eax
     3b4:	00 08                	add    BYTE PTR [eax],cl
     3b6:	cf                   	iret   
     3b7:	01 00                	add    DWORD PTR [eax],eax
     3b9:	00 01                	add    BYTE PTR [ecx],al
     3bb:	28 9d 00 00 00 02    	sub    BYTE PTR [ebp+0x2000000],bl
     3c1:	91                   	xchg   ecx,eax
     3c2:	04 09                	add    al,0x9
     3c4:	d5 01                	aad    0x1
     3c6:	00 00                	add    BYTE PTR [eax],al
     3c8:	01 2a                	add    DWORD PTR [edx],ebp
     3ca:	9d                   	popf   
     3cb:	00 00                	add    BYTE PTR [eax],al
     3cd:	00 05 03 40 34 00    	add    BYTE PTR ds:0x344003,al
     3d3:	30 0a                	xor    BYTE PTR [edx],cl
     3d5:	63 68 00             	arpl   WORD PTR [eax+0x0],bp
     3d8:	01 2b                	add    DWORD PTR [ebx],ebp
     3da:	3a 00                	cmp    al,BYTE PTR [eax]
     3dc:	00 00                	add    BYTE PTR [eax],al
     3de:	01 56 00             	add    DWORD PTR [esi+0x0],edx
     3e1:	0b 3f                	or     edi,DWORD PTR [edi]
     3e3:	00 00                	add    BYTE PTR [eax],al
     3e5:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
     3e8:	56                   	push   esi
     3e9:	00 00                	add    BYTE PTR [eax],al
     3eb:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
     3f1:	30 0b                	xor    BYTE PTR [ebx],cl
     3f3:	aa                   	stos   BYTE PTR es:[edi],al
     3f4:	00 00                	add    BYTE PTR [eax],al
     3f6:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     3f9:	56                   	push   esi
     3fa:	00 00                	add    BYTE PTR [eax],al
     3fc:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
     402:	30 0b                	xor    BYTE PTR [ebx],cl
     404:	56                   	push   esi
     405:	01 00                	add    DWORD PTR [eax],eax
     407:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     40e:	05 03 30 34 00       	add    eax,0x343003
     413:	30 0b                	xor    BYTE PTR [ebx],cl
     415:	48                   	dec    eax
     416:	00 00                	add    BYTE PTR [eax],al
     418:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     41e:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
     424:	30 00                	xor    BYTE PTR [eax],al
     426:	6f                   	outs   dx,DWORD PTR ds:[esi]
     427:	02 00                	add    al,BYTE PTR [eax]
     429:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     42c:	b7 01                	mov    bh,0x1
     42e:	00 00                	add    BYTE PTR [eax],al
     430:	04 01                	add    al,0x1
     432:	ef                   	out    dx,eax
     433:	00 00                	add    BYTE PTR [eax],al
     435:	00 0c 17             	add    BYTE PTR [edi+edx*1],cl
     438:	02 00                	add    al,BYTE PTR [eax]
     43a:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
     43d:	00 00                	add    BYTE PTR [eax],al
     43f:	b4 01                	mov    ah,0x1
     441:	00 30                	add    BYTE PTR [eax],dh
     443:	69 01 00 00 d1 02    	imul   eax,DWORD PTR [ecx],0x2d10000
     449:	00 00                	add    BYTE PTR [eax],al
     44b:	02 01                	add    al,BYTE PTR [ecx]
     44d:	06                   	push   es
     44e:	58                   	pop    eax
     44f:	00 00                	add    BYTE PTR [eax],al
     451:	00 02                	add    BYTE PTR [edx],al
     453:	01 06                	add    DWORD PTR [esi],eax
     455:	51                   	push   ecx
     456:	00 00                	add    BYTE PTR [eax],al
     458:	00 02                	add    BYTE PTR [edx],al
     45a:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
     460:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     467:	02 08                	add    cl,BYTE PTR [eax]
     469:	05 00 00 00 00       	add    eax,0x0
     46e:	02 01                	add    al,BYTE PTR [ecx]
     470:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
     473:	00 00                	add    BYTE PTR [eax],al
     475:	02 02                	add    al,BYTE PTR [edx]
     477:	07                   	pop    es
     478:	0e                   	push   cs
     479:	00 00                	add    BYTE PTR [eax],al
     47b:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
     47e:	00 00                	add    BYTE PTR [eax],al
     480:	00 02                	add    BYTE PTR [edx],al
     482:	34 61                	xor    al,0x61
     484:	00 00                	add    BYTE PTR [eax],al
     486:	00 02                	add    BYTE PTR [edx],al
     488:	04 07                	add    al,0x7
     48a:	32 00                	xor    al,BYTE PTR [eax]
     48c:	00 00                	add    BYTE PTR [eax],al
     48e:	02 08                	add    cl,BYTE PTR [eax]
     490:	07                   	pop    es
     491:	28 00                	sub    BYTE PTR [eax],al
     493:	00 00                	add    BYTE PTR [eax],al
     495:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
     49c:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
     49f:	96                   	xchg   esi,eax
     4a0:	00 00                	add    BYTE PTR [eax],al
     4a2:	00 02                	add    BYTE PTR [edx],al
     4a4:	01 02                	add    DWORD PTR [edx],eax
     4a6:	90                   	nop
     4a7:	00 00                	add    BYTE PTR [eax],al
     4a9:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
     4b0:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
     4b3:	00 00                	add    BYTE PTR [eax],al
     4b5:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     4b8:	2d 00 00 00 02       	sub    eax,0x2000000
     4bd:	04 07                	add    al,0x7
     4bf:	dc 00                	fadd   QWORD PTR [eax]
     4c1:	00 00                	add    BYTE PTR [eax],al
     4c3:	05 04 25 00 00       	add    eax,0x2504
     4c8:	00 06                	add    BYTE PTR [esi],al
     4ca:	29 02                	sub    DWORD PTR [edx],eax
     4cc:	00 00                	add    BYTE PTR [eax],al
     4ce:	04 61                	add    al,0x61
     4d0:	00 00                	add    BYTE PTR [eax],al
     4d2:	00 06                	add    BYTE PTR [esi],al
     4d4:	15 2b 01 00 00       	adc    eax,0x12b
     4d9:	07                   	pop    es
     4da:	0f 03 00             	lsl    eax,WORD PTR [eax]
     4dd:	00 00                	add    BYTE PTR [eax],al
     4df:	07                   	pop    es
     4e0:	b8 02 00 00 01       	mov    eax,0x1000002
     4e5:	07                   	pop    es
     4e6:	9e                   	sahf   
     4e7:	02 00                	add    al,BYTE PTR [eax]
     4e9:	00 03                	add    BYTE PTR [ebx],al
     4eb:	07                   	pop    es
     4ec:	01 03                	add    DWORD PTR [ebx],eax
     4ee:	00 00                	add    BYTE PTR [eax],al
     4f0:	04 07                	add    al,0x7
     4f2:	ab                   	stos   DWORD PTR es:[edi],eax
     4f3:	02 00                	add    al,BYTE PTR [eax]
     4f5:	00 59 07             	add    BYTE PTR [ecx+0x7],bl
     4f8:	33 02                	xor    eax,DWORD PTR [edx]
     4fa:	00 00                	add    BYTE PTR [eax],al
     4fc:	61                   	popa   
     4fd:	07                   	pop    es
     4fe:	2e 03 00             	add    eax,DWORD PTR cs:[eax]
     501:	00 97 08 d0 02 00    	add    BYTE PTR [edi+0x2d008],dl
     507:	00 63 01             	add    BYTE PTR [ebx+0x1],ah
     50a:	08 e7                	or     bh,ah
     50c:	02 00                	add    al,BYTE PTR [eax]
     50e:	00 64 01 08          	add    BYTE PTR [ecx+eax*1+0x8],ah
     512:	8b 02                	mov    eax,DWORD PTR [edx]
     514:	00 00                	add    BYTE PTR [eax],al
     516:	65 01 08             	add    DWORD PTR gs:[eax],ecx
     519:	62 02                	bound  eax,QWORD PTR [edx]
     51b:	00 00                	add    BYTE PTR [eax],al
     51d:	66 01 08             	add    WORD PTR [eax],cx
     520:	46                   	inc    esi
     521:	02 00                	add    al,BYTE PTR [eax]
     523:	00 67 01             	add    BYTE PTR [edi+0x1],ah
     526:	08 f4                	or     ah,dh
     528:	02 00                	add    al,BYTE PTR [eax]
     52a:	00 68 01             	add    BYTE PTR [eax+0x1],ch
     52d:	08 1f                	or     BYTE PTR [edi],bl
     52f:	03 00                	add    eax,DWORD PTR [eax]
     531:	00 69 01             	add    BYTE PTR [ecx+0x1],ch
     534:	08 e9                	or     cl,ch
     536:	01 00                	add    DWORD PTR [eax],eax
     538:	00 70 01             	add    BYTE PTR [eax+0x1],dh
     53b:	08 4c 03 00          	or     BYTE PTR [ebx+eax*1+0x0],cl
     53f:	00 00                	add    BYTE PTR [eax],al
     541:	03 08                	add    ecx,DWORD PTR [eax]
     543:	7c 02                	jl     547 <sysEnter_Vector-0x12fab9>
     545:	00 00                	add    BYTE PTR [eax],al
     547:	01 03                	add    DWORD PTR [ebx],eax
     549:	08 fa                	or     dl,bh
     54b:	01 00                	add    DWORD PTR [eax],eax
     54d:	00 02                	add    BYTE PTR [edx],al
     54f:	03 00                	add    eax,DWORD PTR [eax]
     551:	09 47 03             	or     DWORD PTR [edi+0x3],eax
     554:	00 00                	add    BYTE PTR [eax],al
     556:	01 0f                	add    DWORD PTR [edi],ecx
     558:	b4 01                	mov    ah,0x1
     55a:	00 30                	add    BYTE PTR [eax],dh
     55c:	26 00 00             	add    BYTE PTR es:[eax],al
     55f:	00 01                	add    BYTE PTR [ecx],al
     561:	9c                   	pushf  
     562:	4f                   	dec    edi
     563:	01 00                	add    DWORD PTR [eax],eax
     565:	00 0a                	add    BYTE PTR [edx],cl
     567:	06                   	push   es
     568:	02 00                	add    al,BYTE PTR [eax]
     56a:	00 01                	add    BYTE PTR [ecx],al
     56c:	0f 9d 00             	setge  BYTE PTR [eax]
     56f:	00 00                	add    BYTE PTR [eax],al
     571:	02 91 00 00 09 cb    	add    dl,BYTE PTR [ecx-0x34f70000]
     577:	02 00                	add    al,BYTE PTR [eax]
     579:	00 01                	add    BYTE PTR [ecx],al
     57b:	14 da                	adc    al,0xda
     57d:	01 00                	add    DWORD PTR [eax],eax
     57f:	30 43 00             	xor    BYTE PTR [ebx+0x0],al
     582:	00 00                	add    BYTE PTR [eax],al
     584:	01 9c 7f 01 00 00 0b 	add    DWORD PTR [edi+edi*2+0xb000001],ebx
     58b:	63 00                	arpl   WORD PTR [eax],ax
     58d:	01 14 25 00 00 00 02 	add    DWORD PTR [eiz*1+0x2000000],edx
     594:	91                   	xchg   ecx,eax
     595:	60                   	pusha  
     596:	0c 06                	or     al,0x6
     598:	02 00                	add    al,BYTE PTR [eax]
     59a:	00 01                	add    BYTE PTR [ecx],al
     59c:	16                   	push   ss
     59d:	7f 01                	jg     5a0 <sysEnter_Vector-0x12fa60>
     59f:	00 00                	add    BYTE PTR [eax],al
     5a1:	02 91 72 00 0d 25    	add    dl,BYTE PTR [ecx+0x250d0072]
     5a7:	00 00                	add    BYTE PTR [eax],al
     5a9:	00 8f 01 00 00 0e    	add    BYTE PTR [edi+0xe000001],cl
     5af:	96                   	xchg   esi,eax
     5b0:	00 00                	add    BYTE PTR [eax],al
     5b2:	00 01                	add    BYTE PTR [ecx],al
     5b4:	00 0f                	add    BYTE PTR [edi],cl
     5b6:	70 02                	jo     5ba <sysEnter_Vector-0x12fa46>
     5b8:	00 00                	add    BYTE PTR [eax],al
     5ba:	01 1d 25 00 00 00    	add    DWORD PTR ds:0x25,ebx
     5c0:	1d 02 00 30 2f       	sbb    eax,0x2f300002
     5c5:	00 00                	add    BYTE PTR [eax],al
     5c7:	00 01                	add    BYTE PTR [ecx],al
     5c9:	9c                   	pushf  
     5ca:	b5 01                	mov    ch,0x1
     5cc:	00 00                	add    BYTE PTR [eax],al
     5ce:	10 63 00             	adc    BYTE PTR [ebx+0x0],ah
     5d1:	01 1f                	add    DWORD PTR [edi],ebx
     5d3:	25 00 00 00 02       	and    eax,0x2000000
     5d8:	91                   	xchg   ecx,eax
     5d9:	73 00                	jae    5db <sysEnter_Vector-0x12fa25>
     5db:	11 99 02 00 00 01    	adc    DWORD PTR [ecx+0x1000002],ebx
     5e1:	24 3a                	and    al,0x3a
     5e3:	00 00                	add    BYTE PTR [eax],al
     5e5:	00 4c 02 00          	add    BYTE PTR [edx+eax*1+0x0],cl
     5e9:	30 d1                	xor    cl,dl
     5eb:	00 00                	add    BYTE PTR [eax],al
     5ed:	00 01                	add    BYTE PTR [ecx],al
     5ef:	9c                   	pushf  
     5f0:	2e 02 00             	add    al,BYTE PTR cs:[eax]
     5f3:	00 0a                	add    BYTE PTR [edx],cl
     5f5:	06                   	push   es
     5f6:	02 00                	add    al,BYTE PTR [eax]
     5f8:	00 01                	add    BYTE PTR [ecx],al
     5fa:	24 9d                	and    al,0x9d
     5fc:	00 00                	add    BYTE PTR [eax],al
     5fe:	00 02                	add    BYTE PTR [edx],al
     600:	91                   	xchg   ecx,eax
     601:	00 0a                	add    BYTE PTR [edx],cl
     603:	75 02                	jne    607 <sysEnter_Vector-0x12f9f9>
     605:	00 00                	add    BYTE PTR [eax],al
     607:	01 24 3a             	add    DWORD PTR [edx+edi*1],esp
     60a:	00 00                	add    BYTE PTR [eax],al
     60c:	00 02                	add    BYTE PTR [edx],al
     60e:	91                   	xchg   ecx,eax
     60f:	04 0a                	add    al,0xa
     611:	e2 01                	loop   614 <sysEnter_Vector-0x12f9ec>
     613:	00 00                	add    BYTE PTR [eax],al
     615:	01 24 3a             	add    DWORD PTR [edx+edi*1],esp
     618:	00 00                	add    BYTE PTR [eax],al
     61a:	00 02                	add    BYTE PTR [edx],al
     61c:	91                   	xchg   ecx,eax
     61d:	08 0c 5b             	or     BYTE PTR [ebx+ebx*2],cl
     620:	02 00                	add    al,BYTE PTR [eax]
     622:	00 01                	add    BYTE PTR [ecx],al
     624:	26                   	es
     625:	25 00 00 00 02       	and    eax,0x2000000
     62a:	91                   	xchg   ecx,eax
     62b:	6b 10 6c             	imul   edx,DWORD PTR [eax],0x6c
     62e:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     630:	00 01                	add    BYTE PTR [ecx],al
     632:	27                   	daa    
     633:	3a 00                	cmp    al,BYTE PTR [eax]
     635:	00 00                	add    BYTE PTR [eax],al
     637:	02 91 6c 0c 42 03    	add    dl,BYTE PTR [ecx+0x3420c6c]
     63d:	00 00                	add    BYTE PTR [eax],al
     63f:	01 28                	add    DWORD PTR [eax],ebp
     641:	7f 01                	jg     644 <sysEnter_Vector-0x12f9bc>
     643:	00 00                	add    BYTE PTR [eax],al
     645:	02 91 69 12 0d 02    	add    dl,BYTE PTR [ecx+0x20d1269]
     64b:	00 00                	add    BYTE PTR [eax],al
     64d:	01 2d 89 02 00 30    	add    DWORD PTR ds:0x30000289,ebp
     653:	00 13                	add    BYTE PTR [ebx],dl
     655:	3f                   	aas    
     656:	00 00                	add    BYTE PTR [eax],al
     658:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
     65b:	56                   	push   esi
     65c:	00 00                	add    BYTE PTR [eax],al
     65e:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
     664:	30 13                	xor    BYTE PTR [ebx],dl
     666:	aa                   	stos   BYTE PTR es:[edi],al
     667:	00 00                	add    BYTE PTR [eax],al
     669:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     66c:	56                   	push   esi
     66d:	00 00                	add    BYTE PTR [eax],al
     66f:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
     675:	30 13                	xor    BYTE PTR [ebx],dl
     677:	56                   	push   esi
     678:	01 00                	add    DWORD PTR [eax],eax
     67a:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     681:	05 03 30 34 00       	add    eax,0x343003
     686:	30 13                	xor    BYTE PTR [ebx],dl
     688:	48                   	dec    eax
     689:	00 00                	add    BYTE PTR [eax],al
     68b:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     691:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
     697:	30 00                	xor    BYTE PTR [eax],al
     699:	9f                   	lahf   
     69a:	05 00 00 04 00       	add    eax,0x40000
     69f:	d6                   	(bad)  
     6a0:	02 00                	add    al,BYTE PTR [eax]
     6a2:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     6a5:	ef                   	out    dx,eax
     6a6:	00 00                	add    BYTE PTR [eax],al
     6a8:	00 0c 7c             	add    BYTE PTR [esp+edi*2],cl
     6ab:	04 00                	add    al,0x0
     6ad:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
     6b0:	00 00                	add    BYTE PTR [eax],al
     6b2:	20 03                	and    BYTE PTR [ebx],al
     6b4:	00 30                	add    BYTE PTR [eax],dh
     6b6:	0a 03                	or     al,BYTE PTR [ebx]
     6b8:	00 00                	add    BYTE PTR [eax],al
     6ba:	fc                   	cld    
     6bb:	03 00                	add    eax,DWORD PTR [eax]
     6bd:	00 02                	add    BYTE PTR [edx],al
     6bf:	29 04 00             	sub    DWORD PTR [eax+eax*1],eax
     6c2:	00 02                	add    BYTE PTR [edx],al
     6c4:	28 30                	sub    BYTE PTR [eax],dh
     6c6:	00 00                	add    BYTE PTR [eax],al
     6c8:	00 03                	add    BYTE PTR [ebx],al
     6ca:	04 97                	add    al,0x97
     6cc:	03 00                	add    eax,DWORD PTR [eax]
     6ce:	00 3a                	add    BYTE PTR [edx],bh
     6d0:	00 00                	add    BYTE PTR [eax],al
     6d2:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     6d5:	06                   	push   es
     6d6:	58                   	pop    eax
     6d7:	00 00                	add    BYTE PTR [eax],al
     6d9:	00 02                	add    BYTE PTR [edx],al
     6db:	30 04 00             	xor    BYTE PTR [eax+eax*1],al
     6de:	00 02                	add    BYTE PTR [edx],al
     6e0:	62 25 00 00 00 04    	bound  esp,QWORD PTR ds:0x4000000
     6e6:	01 06                	add    DWORD PTR [esi],eax
     6e8:	51                   	push   ecx
     6e9:	00 00                	add    BYTE PTR [eax],al
     6eb:	00 04 02             	add    BYTE PTR [edx+eax*1],al
     6ee:	05 e5 00 00 00       	add    eax,0xe5
     6f3:	05 04 05 69 6e       	add    eax,0x6e690504
     6f8:	74 00                	je     6fa <sysEnter_Vector-0x12f906>
     6fa:	04 08                	add    al,0x8
     6fc:	05 00 00 00 00       	add    eax,0x0
     701:	04 01                	add    al,0x1
     703:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
     706:	00 00                	add    BYTE PTR [eax],al
     708:	04 02                	add    al,0x2
     70a:	07                   	pop    es
     70b:	0e                   	push   cs
     70c:	00 00                	add    BYTE PTR [eax],al
     70e:	00 02                	add    BYTE PTR [edx],al
     710:	64 00 00             	add    BYTE PTR fs:[eax],al
     713:	00 03                	add    BYTE PTR [ebx],al
     715:	34 81                	xor    al,0x81
     717:	00 00                	add    BYTE PTR [eax],al
     719:	00 04 04             	add    BYTE PTR [esp+eax*1],al
     71c:	07                   	pop    es
     71d:	32 00                	xor    al,BYTE PTR [eax]
     71f:	00 00                	add    BYTE PTR [eax],al
     721:	04 08                	add    al,0x8
     723:	07                   	pop    es
     724:	28 00                	sub    BYTE PTR [eax],al
     726:	00 00                	add    BYTE PTR [eax],al
     728:	04 04                	add    al,0x4
     72a:	05 05 00 00 00       	add    eax,0x5
     72f:	04 0c                	add    al,0xc
     731:	04 96                	add    al,0x96
     733:	00 00                	add    BYTE PTR [eax],al
     735:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     738:	02 90 00 00 00 02    	add    dl,BYTE PTR [eax+0x2000000]
     73e:	5d                   	pop    ebp
     73f:	00 00                	add    BYTE PTR [eax],al
     741:	00 04 2a             	add    BYTE PTR [edx+ebp*1],al
     744:	8f 00                	pop    DWORD PTR [eax]
     746:	00 00                	add    BYTE PTR [eax],al
     748:	06                   	push   es
     749:	74 6d                	je     7b8 <sysEnter_Vector-0x12f848>
     74b:	00 2c 04             	add    BYTE PTR [esp+eax*1],ch
     74e:	2c 3f                	sub    al,0x3f
     750:	01 00                	add    DWORD PTR [eax],eax
     752:	00 07                	add    BYTE PTR [edi],al
     754:	af                   	scas   eax,DWORD PTR es:[edi]
     755:	04 00                	add    al,0x0
     757:	00 04 2e             	add    BYTE PTR [esi+ebp*1],al
     75a:	5a                   	pop    edx
     75b:	00 00                	add    BYTE PTR [eax],al
     75d:	00 00                	add    BYTE PTR [eax],al
     75f:	07                   	pop    es
     760:	14 04                	adc    al,0x4
     762:	00 00                	add    BYTE PTR [eax],al
     764:	04 2f                	add    al,0x2f
     766:	5a                   	pop    edx
     767:	00 00                	add    BYTE PTR [eax],al
     769:	00 04 07             	add    BYTE PTR [edi+eax*1],al
     76c:	61                   	popa   
     76d:	03 00                	add    eax,DWORD PTR [eax]
     76f:	00 04 30             	add    BYTE PTR [eax+esi*1],al
     772:	5a                   	pop    edx
     773:	00 00                	add    BYTE PTR [eax],al
     775:	00 08                	add    BYTE PTR [eax],cl
     777:	07                   	pop    es
     778:	9a 04 00 00 04 31 5a 	call   0x5a31:0x4000004
     77f:	00 00                	add    BYTE PTR [eax],al
     781:	00 0c 07             	add    BYTE PTR [edi+eax*1],cl
     784:	a9 03 00 00 04       	test   eax,0x4000003
     789:	32 5a 00             	xor    bl,BYTE PTR [edx+0x0]
     78c:	00 00                	add    BYTE PTR [eax],al
     78e:	10 07                	adc    BYTE PTR [edi],al
     790:	b0 03                	mov    al,0x3
     792:	00 00                	add    BYTE PTR [eax],al
     794:	04 33                	add    al,0x33
     796:	5a                   	pop    edx
     797:	00 00                	add    BYTE PTR [eax],al
     799:	00 14 07             	add    BYTE PTR [edi+eax*1],dl
     79c:	92                   	xchg   edx,eax
     79d:	04 00                	add    al,0x0
     79f:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     7a2:	5a                   	pop    edx
     7a3:	00 00                	add    BYTE PTR [eax],al
     7a5:	00 18                	add    BYTE PTR [eax],bl
     7a7:	07                   	pop    es
     7a8:	21 04 00             	and    DWORD PTR [eax+eax*1],eax
     7ab:	00 04 35 5a 00 00 00 	add    BYTE PTR [esi*1+0x5a],al
     7b2:	1c 07                	sbb    al,0x7
     7b4:	db 03                	fild   DWORD PTR [ebx]
     7b6:	00 00                	add    BYTE PTR [eax],al
     7b8:	04 36                	add    al,0x36
     7ba:	5a                   	pop    edx
     7bb:	00 00                	add    BYTE PTR [eax],al
     7bd:	00 20                	add    BYTE PTR [eax],ah
     7bf:	07                   	pop    es
     7c0:	5c                   	pop    esp
     7c1:	04 00                	add    al,0x0
     7c3:	00 04 37             	add    BYTE PTR [edi+esi*1],al
     7c6:	8f 00                	pop    DWORD PTR [eax]
     7c8:	00 00                	add    BYTE PTR [eax],al
     7ca:	24 07                	and    al,0x7
     7cc:	7f 03                	jg     7d1 <sysEnter_Vector-0x12f82f>
     7ce:	00 00                	add    BYTE PTR [eax],al
     7d0:	04 38                	add    al,0x38
     7d2:	3f                   	aas    
     7d3:	01 00                	add    DWORD PTR [eax],eax
     7d5:	00 28                	add    BYTE PTR [eax],ch
     7d7:	00 08                	add    BYTE PTR [eax],cl
     7d9:	04 45                	add    al,0x45
     7db:	01 00                	add    DWORD PTR [eax],eax
     7dd:	00 09                	add    BYTE PTR [ecx],cl
     7df:	3a 00                	cmp    al,BYTE PTR [eax]
     7e1:	00 00                	add    BYTE PTR [eax],al
     7e3:	04 04                	add    al,0x4
     7e5:	07                   	pop    es
     7e6:	2d 00 00 00 04       	sub    eax,0x4000000
     7eb:	04 07                	add    al,0x7
     7ed:	dc 00                	fadd   QWORD PTR [eax]
     7ef:	00 00                	add    BYTE PTR [eax],al
     7f1:	0a 04 08             	or     al,BYTE PTR [eax+ecx*1]
     7f4:	04 3a                	add    al,0x3a
     7f6:	00 00                	add    BYTE PTR [eax],al
     7f8:	00 0b                	add    BYTE PTR [ebx],cl
     7fa:	29 02                	sub    DWORD PTR [edx],eax
     7fc:	00 00                	add    BYTE PTR [eax],al
     7fe:	04 81                	add    al,0x81
     800:	00 00                	add    BYTE PTR [eax],al
     802:	00 07                	add    BYTE PTR [edi],al
     804:	15 e8 01 00 00       	adc    eax,0x1e8
     809:	0c 0f                	or     al,0xf
     80b:	03 00                	add    eax,DWORD PTR [eax]
     80d:	00 00                	add    BYTE PTR [eax],al
     80f:	0c b8                	or     al,0xb8
     811:	02 00                	add    al,BYTE PTR [eax]
     813:	00 01                	add    BYTE PTR [ecx],al
     815:	0c 9e                	or     al,0x9e
     817:	02 00                	add    al,BYTE PTR [eax]
     819:	00 03                	add    BYTE PTR [ebx],al
     81b:	0c 01                	or     al,0x1
     81d:	03 00                	add    eax,DWORD PTR [eax]
     81f:	00 04 0c             	add    BYTE PTR [esp+ecx*1],al
     822:	ab                   	stos   DWORD PTR es:[edi],eax
     823:	02 00                	add    al,BYTE PTR [eax]
     825:	00 59 0c             	add    BYTE PTR [ecx+0xc],bl
     828:	33 02                	xor    eax,DWORD PTR [edx]
     82a:	00 00                	add    BYTE PTR [eax],al
     82c:	61                   	popa   
     82d:	0c 2e                	or     al,0x2e
     82f:	03 00                	add    eax,DWORD PTR [eax]
     831:	00 97 0d d0 02 00    	add    BYTE PTR [edi+0x2d00d],dl
     837:	00 63 01             	add    BYTE PTR [ebx+0x1],ah
     83a:	0d e7 02 00 00       	or     eax,0x2e7
     83f:	64 01 0d 8b 02 00 00 	add    DWORD PTR fs:0x28b,ecx
     846:	65 01 0d 62 02 00 00 	add    DWORD PTR gs:0x262,ecx
     84d:	66 01 0d 46 02 00 00 	add    WORD PTR ds:0x246,cx
     854:	67 01 0d             	add    DWORD PTR [di],ecx
     857:	f4                   	hlt    
     858:	02 00                	add    al,BYTE PTR [eax]
     85a:	00 68 01             	add    BYTE PTR [eax+0x1],ch
     85d:	0d 1f 03 00 00       	or     eax,0x31f
     862:	69 01 0d e9 01 00    	imul   eax,DWORD PTR [ecx],0x1e90d
     868:	00 70 01             	add    BYTE PTR [eax+0x1],dh
     86b:	0d 4c 03 00 00       	or     eax,0x34c
     870:	00 03                	add    BYTE PTR [ebx],al
     872:	0d 7c 02 00 00       	or     eax,0x27c
     877:	01 03                	add    DWORD PTR [ebx],eax
     879:	0d fa 01 00 00       	or     eax,0x1fa
     87e:	02 03                	add    al,BYTE PTR [ebx]
     880:	00 0e                	add    BYTE PTR [esi],cl
     882:	08 04 00             	or     BYTE PTR [eax+eax*1],al
     885:	00 01                	add    BYTE PTR [ecx],al
     887:	0f 5a 00             	cvtps2pd xmm0,QWORD PTR [eax]
     88a:	00 00                	add    BYTE PTR [eax],al
     88c:	20 03                	and    BYTE PTR [ebx],al
     88e:	00 30                	add    BYTE PTR [eax],dh
     890:	35 00 00 00 01       	xor    eax,0x1000000
     895:	9c                   	pushf  
     896:	48                   	dec    eax
     897:	02 00                	add    al,BYTE PTR [eax]
     899:	00 0f                	add    BYTE PTR [edi],cl
     89b:	d3 03                	rol    DWORD PTR [ebx],cl
     89d:	00 00                	add    BYTE PTR [eax],al
     89f:	01 0f                	add    DWORD PTR [edi],ecx
     8a1:	5a                   	pop    edx
     8a2:	00 00                	add    BYTE PTR [eax],al
     8a4:	00 02                	add    BYTE PTR [edx],al
     8a6:	91                   	xchg   ecx,eax
     8a7:	00 0f                	add    BYTE PTR [edi],cl
     8a9:	40                   	inc    eax
     8aa:	04 00                	add    al,0x0
     8ac:	00 01                	add    BYTE PTR [ecx],al
     8ae:	0f 76 00             	pcmpeqd mm0,QWORD PTR [eax]
     8b1:	00 00                	add    BYTE PTR [eax],al
     8b3:	02 91 04 0f 47 04    	add    dl,BYTE PTR [ecx+0x4470f04]
     8b9:	00 00                	add    BYTE PTR [eax],al
     8bb:	01 0f                	add    DWORD PTR [edi],ecx
     8bd:	76 00                	jbe    8bf <sysEnter_Vector-0x12f741>
     8bf:	00 00                	add    BYTE PTR [eax],al
     8c1:	02 91 08 0f 4e 04    	add    dl,BYTE PTR [ecx+0x44e0f08]
     8c7:	00 00                	add    BYTE PTR [eax],al
     8c9:	01 0f                	add    DWORD PTR [edi],ecx
     8cb:	76 00                	jbe    8cd <sysEnter_Vector-0x12f733>
     8cd:	00 00                	add    BYTE PTR [eax],al
     8cf:	02 91 0c 10 5a 03    	add    dl,BYTE PTR [ecx+0x35a100c]
     8d5:	00 00                	add    BYTE PTR [eax],al
     8d7:	01 11                	add    DWORD PTR [ecx],edx
     8d9:	5a                   	pop    edx
     8da:	00 00                	add    BYTE PTR [eax],al
     8dc:	00 02                	add    BYTE PTR [edx],al
     8de:	91                   	xchg   ecx,eax
     8df:	70 00                	jo     8e1 <sysEnter_Vector-0x12f71f>
     8e1:	0e                   	push   cs
     8e2:	fc                   	cld    
     8e3:	03 00                	add    eax,DWORD PTR [eax]
     8e5:	00 01                	add    BYTE PTR [ecx],al
     8e7:	16                   	push   ss
     8e8:	5a                   	pop    edx
     8e9:	00 00                	add    BYTE PTR [eax],al
     8eb:	00 55 03             	add    BYTE PTR [ebp+0x3],dl
     8ee:	00 30                	add    BYTE PTR [eax],dh
     8f0:	34 00                	xor    al,0x0
     8f2:	00 00                	add    BYTE PTR [eax],al
     8f4:	01 9c 9a 02 00 00 0f 	add    DWORD PTR [edx+ebx*4+0xf000002],ebx
     8fb:	d3 03                	rol    DWORD PTR [ebx],cl
     8fd:	00 00                	add    BYTE PTR [eax],al
     8ff:	01 16                	add    DWORD PTR [esi],edx
     901:	5a                   	pop    edx
     902:	00 00                	add    BYTE PTR [eax],al
     904:	00 02                	add    BYTE PTR [edx],al
     906:	91                   	xchg   ecx,eax
     907:	00 0f                	add    BYTE PTR [edi],cl
     909:	40                   	inc    eax
     90a:	04 00                	add    al,0x0
     90c:	00 01                	add    BYTE PTR [ecx],al
     90e:	16                   	push   ss
     90f:	76 00                	jbe    911 <sysEnter_Vector-0x12f6ef>
     911:	00 00                	add    BYTE PTR [eax],al
     913:	02 91 04 0f 47 04    	add    dl,BYTE PTR [ecx+0x4470f04]
     919:	00 00                	add    BYTE PTR [eax],al
     91b:	01 16                	add    DWORD PTR [esi],edx
     91d:	76 00                	jbe    91f <sysEnter_Vector-0x12f6e1>
     91f:	00 00                	add    BYTE PTR [eax],al
     921:	02 91 08 10 5a 03    	add    dl,BYTE PTR [ecx+0x35a1008]
     927:	00 00                	add    BYTE PTR [eax],al
     929:	01 18                	add    DWORD PTR [eax],ebx
     92b:	5a                   	pop    edx
     92c:	00 00                	add    BYTE PTR [eax],al
     92e:	00 02                	add    BYTE PTR [edx],al
     930:	91                   	xchg   ecx,eax
     931:	70 00                	jo     933 <sysEnter_Vector-0x12f6cd>
     933:	0e                   	push   cs
     934:	f0 03 00             	lock add eax,DWORD PTR [eax]
     937:	00 01                	add    BYTE PTR [ecx],al
     939:	1d 5a 00 00 00       	sbb    eax,0x5a
     93e:	89 03                	mov    DWORD PTR [ebx],eax
     940:	00 30                	add    BYTE PTR [eax],dh
     942:	31 00                	xor    DWORD PTR [eax],eax
     944:	00 00                	add    BYTE PTR [eax],al
     946:	01 9c de 02 00 00 0f 	add    DWORD PTR [esi+ebx*8+0xf000002],ebx
     94d:	d3 03                	rol    DWORD PTR [ebx],cl
     94f:	00 00                	add    BYTE PTR [eax],al
     951:	01 1d 5a 00 00 00    	add    DWORD PTR ds:0x5a,ebx
     957:	02 91 00 0f 40 04    	add    dl,BYTE PTR [ecx+0x4400f00]
     95d:	00 00                	add    BYTE PTR [eax],al
     95f:	01 1d 76 00 00 00    	add    DWORD PTR ds:0x76,ebx
     965:	02 91 04 10 5a 03    	add    dl,BYTE PTR [ecx+0x35a1004]
     96b:	00 00                	add    BYTE PTR [eax],al
     96d:	01 1f                	add    DWORD PTR [edi],ebx
     96f:	5a                   	pop    edx
     970:	00 00                	add    BYTE PTR [eax],al
     972:	00 02                	add    BYTE PTR [edx],al
     974:	91                   	xchg   ecx,eax
     975:	70 00                	jo     977 <sysEnter_Vector-0x12f689>
     977:	0e                   	push   cs
     978:	e4 03                	in     al,0x3
     97a:	00 00                	add    BYTE PTR [eax],al
     97c:	01 24 5a             	add    DWORD PTR [edx+ebx*2],esp
     97f:	00 00                	add    BYTE PTR [eax],al
     981:	00 ba 03 00 30 27    	add    BYTE PTR [edx+0x27300003],bh
     987:	00 00                	add    BYTE PTR [eax],al
     989:	00 01                	add    BYTE PTR [ecx],al
     98b:	9c                   	pushf  
     98c:	14 03                	adc    al,0x3
     98e:	00 00                	add    BYTE PTR [eax],al
     990:	0f d3 03             	psrlq  mm0,QWORD PTR [ebx]
     993:	00 00                	add    BYTE PTR [eax],al
     995:	01 24 5a             	add    DWORD PTR [edx+ebx*2],esp
     998:	00 00                	add    BYTE PTR [eax],al
     99a:	00 02                	add    BYTE PTR [edx],al
     99c:	91                   	xchg   ecx,eax
     99d:	00 10                	add    BYTE PTR [eax],dl
     99f:	5a                   	pop    edx
     9a0:	03 00                	add    eax,DWORD PTR [eax]
     9a2:	00 01                	add    BYTE PTR [ecx],al
     9a4:	26                   	es
     9a5:	5a                   	pop    edx
     9a6:	00 00                	add    BYTE PTR [eax],al
     9a8:	00 02                	add    BYTE PTR [edx],al
     9aa:	91                   	xchg   ecx,eax
     9ab:	74 00                	je     9ad <sysEnter_Vector-0x12f653>
     9ad:	11 87 03 00 00 01    	adc    DWORD PTR [edi+0x1000003],eax
     9b3:	2b e1                	sub    esp,ecx
     9b5:	03 00                	add    eax,DWORD PTR [eax]
     9b7:	30 64 00 00          	xor    BYTE PTR [eax+eax*1+0x0],ah
     9bb:	00 01                	add    BYTE PTR [ecx],al
     9bd:	9c                   	pushf  
     9be:	11 a2 04 00 00 01    	adc    DWORD PTR [edx+0x1000004],esp
     9c4:	34 45                	xor    al,0x45
     9c6:	04 00                	add    al,0x0
     9c8:	30 1f                	xor    BYTE PTR [edi],bl
     9ca:	00 00                	add    BYTE PTR [eax],al
     9cc:	00 01                	add    BYTE PTR [ecx],al
     9ce:	9c                   	pushf  
     9cf:	12 91 03 00 00 01    	adc    dl,BYTE PTR [ecx+0x1000003]
     9d5:	39 5a 00             	cmp    DWORD PTR [edx+0x0],ebx
     9d8:	00 00                	add    BYTE PTR [eax],al
     9da:	64                   	fs
     9db:	04 00                	add    al,0x0
     9dd:	30 34 00             	xor    BYTE PTR [eax+eax*1],dh
     9e0:	00 00                	add    BYTE PTR [eax],al
     9e2:	01 9c 6d 03 00 00 0f 	add    DWORD PTR [ebp+ebp*2+0xf000003],ebx
     9e9:	55                   	push   ebp
     9ea:	04 00                	add    al,0x0
     9ec:	00 01                	add    BYTE PTR [ecx],al
     9ee:	39 3f                	cmp    DWORD PTR [edi],edi
     9f0:	01 00                	add    DWORD PTR [eax],eax
     9f2:	00 02                	add    BYTE PTR [edx],al
     9f4:	91                   	xchg   ecx,eax
     9f5:	00 13                	add    BYTE PTR [ebx],dl
     9f7:	10 d3                	adc    bl,dl
     9f9:	04 00                	add    al,0x0
     9fb:	00 01                	add    BYTE PTR [ecx],al
     9fd:	3b 41 00             	cmp    eax,DWORD PTR [ecx+0x0]
     a00:	00 00                	add    BYTE PTR [eax],al
     a02:	02 91 74 00 12 d8    	add    dl,BYTE PTR [ecx-0x27edff8c]
     a08:	04 00                	add    al,0x0
     a0a:	00 01                	add    BYTE PTR [ecx],al
     a0c:	41                   	inc    ecx
     a0d:	5a                   	pop    edx
     a0e:	00 00                	add    BYTE PTR [eax],al
     a10:	00 98 04 00 30 34    	add    BYTE PTR [eax+0x34300004],bl
     a16:	00 00                	add    BYTE PTR [eax],al
     a18:	00 01                	add    BYTE PTR [ecx],al
     a1a:	9c                   	pushf  
     a1b:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
     a1c:	03 00                	add    eax,DWORD PTR [eax]
     a1e:	00 0f                	add    BYTE PTR [edi],cl
     a20:	55                   	push   ebp
     a21:	04 00                	add    al,0x0
     a23:	00 01                	add    BYTE PTR [ecx],al
     a25:	41                   	inc    ecx
     a26:	3f                   	aas    
     a27:	01 00                	add    DWORD PTR [eax],eax
     a29:	00 02                	add    BYTE PTR [edx],al
     a2b:	91                   	xchg   ecx,eax
     a2c:	00 13                	add    BYTE PTR [ebx],dl
     a2e:	10 d3                	adc    bl,dl
     a30:	04 00                	add    al,0x0
     a32:	00 01                	add    BYTE PTR [ecx],al
     a34:	43                   	inc    ebx
     a35:	41                   	inc    ecx
     a36:	00 00                	add    BYTE PTR [eax],al
     a38:	00 02                	add    BYTE PTR [edx],al
     a3a:	91                   	xchg   ecx,eax
     a3b:	74 00                	je     a3d <sysEnter_Vector-0x12f5c3>
     a3d:	0e                   	push   cs
     a3e:	38 04 00             	cmp    BYTE PTR [eax+eax*1],al
     a41:	00 01                	add    BYTE PTR [ecx],al
     a43:	49                   	dec    ecx
     a44:	5a                   	pop    edx
     a45:	00 00                	add    BYTE PTR [eax],al
     a47:	00 cc                	add    ah,cl
     a49:	04 00                	add    al,0x0
     a4b:	30 37                	xor    BYTE PTR [edi],dh
     a4d:	00 00                	add    BYTE PTR [eax],al
     a4f:	00 01                	add    BYTE PTR [ecx],al
     a51:	9c                   	pushf  
     a52:	e9 03 00 00 0f       	jmp    f000a5a <sysEnter_Vector+0xeed0a5a>
     a57:	c8 03 00 00          	enter  0x3,0x0
     a5b:	01 49 76             	add    DWORD PTR [ecx+0x76],ecx
     a5e:	00 00                	add    BYTE PTR [eax],al
     a60:	00 02                	add    BYTE PTR [edx],al
     a62:	91                   	xchg   ecx,eax
     a63:	00 0f                	add    BYTE PTR [edi],cl
     a65:	55                   	push   ebp
     a66:	04 00                	add    al,0x0
     a68:	00 01                	add    BYTE PTR [ecx],al
     a6a:	49                   	dec    ecx
     a6b:	3f                   	aas    
     a6c:	01 00                	add    DWORD PTR [eax],eax
     a6e:	00 02                	add    BYTE PTR [edx],al
     a70:	91                   	xchg   ecx,eax
     a71:	04 13                	add    al,0x13
     a73:	10 d3                	adc    bl,dl
     a75:	04 00                	add    al,0x0
     a77:	00 01                	add    BYTE PTR [ecx],al
     a79:	4b                   	dec    ebx
     a7a:	41                   	inc    ecx
     a7b:	00 00                	add    BYTE PTR [eax],al
     a7d:	00 02                	add    BYTE PTR [edx],al
     a7f:	91                   	xchg   ecx,eax
     a80:	70 00                	jo     a82 <sysEnter_Vector-0x12f57e>
     a82:	0e                   	push   cs
     a83:	69 03 00 00 01 51    	imul   eax,DWORD PTR [ebx],0x51010000
     a89:	81 00 00 00 03 05    	add    DWORD PTR [eax],0x5030000
     a8f:	00 30                	add    BYTE PTR [eax],dh
     a91:	4e                   	dec    esi
     a92:	00 00                	add    BYTE PTR [eax],al
     a94:	00 01                	add    BYTE PTR [ecx],al
     a96:	9c                   	pushf  
     a97:	28 04 00             	sub    BYTE PTR [eax+eax*1],al
     a9a:	00 0f                	add    BYTE PTR [edi],cl
     a9c:	72 04                	jb     aa2 <sysEnter_Vector-0x12f55e>
     a9e:	00 00                	add    BYTE PTR [eax],al
     aa0:	01 51 81             	add    DWORD PTR [ecx-0x7f],edx
     aa3:	00 00                	add    BYTE PTR [eax],al
     aa5:	00 02                	add    BYTE PTR [edx],al
     aa7:	91                   	xchg   ecx,eax
     aa8:	00 14 14             	add    BYTE PTR [esp+edx*1],dl
     aab:	05 00 30 32 00       	add    eax,0x323000
     ab0:	00 00                	add    BYTE PTR [eax],al
     ab2:	15 63 74 00 01       	adc    eax,0x1007463
     ab7:	53                   	push   ebx
     ab8:	76 00                	jbe    aba <sysEnter_Vector-0x12f546>
     aba:	00 00                	add    BYTE PTR [eax],al
     abc:	02 91 70 00 00 16    	add    dl,BYTE PTR [ecx+0x16000070]
     ac2:	df 04 00             	fild   WORD PTR [eax+eax*1]
     ac5:	00 01                	add    BYTE PTR [ecx],al
     ac7:	57                   	push   edi
     ac8:	51                   	push   ecx
     ac9:	05 00 30 1d 00       	add    eax,0x1d3000
     ace:	00 00                	add    BYTE PTR [eax],al
     ad0:	01 9c 17 c6 04 00 00 	add    DWORD PTR [edi+edx*1+0x4c6],ebx
     ad7:	01 5c 6e 05          	add    DWORD PTR [esi+ebp*2+0x5],ebx
     adb:	00 30                	add    BYTE PTR [eax],dh
     add:	29 00                	sub    DWORD PTR [eax],eax
     adf:	00 00                	add    BYTE PTR [eax],al
     ae1:	01 9c 79 04 00 00 0f 	add    DWORD PTR [ecx+edi*2+0xf000004],ebx
     ae8:	66                   	data16
     ae9:	04 00                	add    al,0x0
     aeb:	00 01                	add    BYTE PTR [ecx],al
     aed:	5c                   	pop    esp
     aee:	5a                   	pop    edx
     aef:	00 00                	add    BYTE PTR [eax],al
     af1:	00 02                	add    BYTE PTR [edx],al
     af3:	91                   	xchg   ecx,eax
     af4:	00 0f                	add    BYTE PTR [edi],cl
     af6:	bb 04 00 00 01       	mov    ebx,0x1000004
     afb:	5c                   	pop    esp
     afc:	58                   	pop    eax
     afd:	01 00                	add    DWORD PTR [eax],eax
     aff:	00 02                	add    BYTE PTR [edx],al
     b01:	91                   	xchg   ecx,eax
     b02:	04 0f                	add    al,0xf
     b04:	6f                   	outs   dx,DWORD PTR ds:[esi]
     b05:	03 00                	add    eax,DWORD PTR [eax]
     b07:	00 01                	add    BYTE PTR [ecx],al
     b09:	5c                   	pop    esp
     b0a:	5a                   	pop    edx
     b0b:	00 00                	add    BYTE PTR [eax],al
     b0d:	00 02                	add    BYTE PTR [edx],al
     b0f:	91                   	xchg   ecx,eax
     b10:	08 00                	or     BYTE PTR [eax],al
     b12:	0e                   	push   cs
     b13:	6d                   	ins    DWORD PTR es:[edi],dx
     b14:	04 00                	add    al,0x0
     b16:	00 01                	add    BYTE PTR [ecx],al
     b18:	61                   	popa   
     b19:	5a                   	pop    edx
     b1a:	00 00                	add    BYTE PTR [eax],al
     b1c:	00 97 05 00 30 34    	add    BYTE PTR [edi+0x34300005],dl
     b22:	00 00                	add    BYTE PTR [eax],al
     b24:	00 01                	add    BYTE PTR [ecx],al
     b26:	9c                   	pushf  
     b27:	cb                   	retf   
     b28:	04 00                	add    al,0x0
     b2a:	00 0f                	add    BYTE PTR [edi],cl
     b2c:	b2 06                	mov    dl,0x6
     b2e:	00 00                	add    BYTE PTR [eax],al
     b30:	01 61 5a             	add    DWORD PTR [ecx+0x5a],esp
     b33:	01 00                	add    DWORD PTR [eax],eax
     b35:	00 02                	add    BYTE PTR [edx],al
     b37:	91                   	xchg   ecx,eax
     b38:	00 0f                	add    BYTE PTR [edi],cl
     b3a:	8d 04 00             	lea    eax,[eax+eax*1]
     b3d:	00 01                	add    BYTE PTR [ecx],al
     b3f:	61                   	popa   
     b40:	5a                   	pop    edx
     b41:	00 00                	add    BYTE PTR [eax],al
     b43:	00 02                	add    BYTE PTR [edx],al
     b45:	91                   	xchg   ecx,eax
     b46:	04 0f                	add    al,0xf
     b48:	b6 04                	mov    dh,0x4
     b4a:	00 00                	add    BYTE PTR [eax],al
     b4c:	01 61 cb             	add    DWORD PTR [ecx-0x35],esp
     b4f:	04 00                	add    al,0x0
     b51:	00 02                	add    BYTE PTR [edx],al
     b53:	91                   	xchg   ecx,eax
     b54:	08 15 70 69 64 00    	or     BYTE PTR ds:0x646970,dl
     b5a:	01 63 5a             	add    DWORD PTR [ebx+0x5a],esp
     b5d:	00 00                	add    BYTE PTR [eax],al
     b5f:	00 02                	add    BYTE PTR [edx],al
     b61:	91                   	xchg   ecx,eax
     b62:	70 00                	jo     b64 <sysEnter_Vector-0x12f49c>
     b64:	08 04 5a             	or     BYTE PTR [edx+ebx*2],al
     b67:	01 00                	add    DWORD PTR [eax],eax
     b69:	00 17                	add    BYTE PTR [edi],dl
     b6b:	c0 03 00             	rol    BYTE PTR [ebx],0x0
     b6e:	00 01                	add    BYTE PTR [ecx],al
     b70:	6c                   	ins    BYTE PTR es:[edi],dx
     b71:	cb                   	retf   
     b72:	05 00 30 1d 00       	add    eax,0x1d3000
     b77:	00 00                	add    BYTE PTR [eax],al
     b79:	01 9c f5 04 00 00 18 	add    DWORD PTR [ebp+esi*8+0x18000004],ebx
     b80:	70 69                	jo     beb <sysEnter_Vector-0x12f415>
     b82:	64 00 01             	add    BYTE PTR fs:[ecx],al
     b85:	6c                   	ins    BYTE PTR es:[edi],dx
     b86:	76 00                	jbe    b88 <sysEnter_Vector-0x12f478>
     b88:	00 00                	add    BYTE PTR [eax],al
     b8a:	02 91 00 00 19 b8    	add    dl,BYTE PTR [ecx-0x47e70000]
     b90:	03 00                	add    eax,DWORD PTR [eax]
     b92:	00 01                	add    BYTE PTR [ecx],al
     b94:	71 2b                	jno    bc1 <sysEnter_Vector-0x12f43f>
     b96:	05 00 00 e8 05       	add    eax,0x5e80000
     b9b:	00 30                	add    BYTE PTR [eax],dh
     b9d:	42                   	inc    edx
     b9e:	00 00                	add    BYTE PTR [eax],al
     ba0:	00 01                	add    BYTE PTR [ecx],al
     ba2:	9c                   	pushf  
     ba3:	2b 05 00 00 10 1b    	sub    eax,DWORD PTR ds:0x1b100000
     ba9:	04 00                	add    al,0x0
     bab:	00 01                	add    BYTE PTR [ecx],al
     bad:	73 76                	jae    c25 <sysEnter_Vector-0x12f3db>
     baf:	00 00                	add    BYTE PTR [eax],al
     bb1:	00 02                	add    BYTE PTR [edx],al
     bb3:	91                   	xchg   ecx,eax
     bb4:	6c                   	ins    BYTE PTR es:[edi],dx
     bb5:	10 77 03             	adc    BYTE PTR [edi+0x3],dh
     bb8:	00 00                	add    BYTE PTR [eax],al
     bba:	01 74 af 00          	add    DWORD PTR [edi+ebp*4+0x0],esi
     bbe:	00 00                	add    BYTE PTR [eax],al
     bc0:	02 91 40 00 08 04    	add    dl,BYTE PTR [ecx+0x4080040]
     bc6:	af                   	scas   eax,DWORD PTR es:[edi]
     bc7:	00 00                	add    BYTE PTR [eax],al
     bc9:	00 1a                	add    BYTE PTR [edx],bl
     bcb:	3f                   	aas    
     bcc:	00 00                	add    BYTE PTR [eax],al
     bce:	00 05 33 76 00 00    	add    BYTE PTR ds:0x7633,al
     bd4:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
     bda:	30 1a                	xor    BYTE PTR [edx],bl
     bdc:	aa                   	stos   BYTE PTR es:[edi],al
     bdd:	00 00                	add    BYTE PTR [eax],al
     bdf:	00 05 34 76 00 00    	add    BYTE PTR ds:0x7634,al
     be5:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
     beb:	30 1a                	xor    BYTE PTR [edx],bl
     bed:	56                   	push   esi
     bee:	01 00                	add    DWORD PTR [eax],eax
     bf0:	00 05 35 76 00 00    	add    BYTE PTR ds:0x7635,al
     bf6:	00 05 03 30 34 00    	add    BYTE PTR ds:0x343003,al
     bfc:	30 1a                	xor    BYTE PTR [edx],bl
     bfe:	48                   	dec    eax
     bff:	00 00                	add    BYTE PTR [eax],al
     c01:	00 06                	add    BYTE PTR [esi],al
     c03:	36 a4                	movs   BYTE PTR es:[edi],BYTE PTR ss:[esi]
     c05:	00 00                	add    BYTE PTR [eax],al
     c07:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
     c0d:	30 1b                	xor    BYTE PTR [ebx],bl
     c0f:	61                   	popa   
     c10:	00 01                	add    BYTE PTR [ecx],al
     c12:	0d 5a 00 00 00       	or     eax,0x5a
     c17:	05 03 60 32 00       	add    eax,0x326003
     c1c:	30 1b                	xor    BYTE PTR [ebx],bl
     c1e:	62 00                	bound  eax,QWORD PTR [eax]
     c20:	01 0d 5a 00 00 00    	add    DWORD PTR ds:0x5a,ecx
     c26:	05 03 64 32 00       	add    eax,0x326403
     c2b:	30 1b                	xor    BYTE PTR [ebx],bl
     c2d:	63 00                	arpl   WORD PTR [eax],ax
     c2f:	01 0d 5a 00 00 00    	add    DWORD PTR ds:0x5a,ecx
     c35:	05 03 68 32 00       	add    eax,0x326803
     c3a:	30 00                	xor    BYTE PTR [eax],al
     c3c:	41                   	inc    ecx
     c3d:	02 00                	add    al,BYTE PTR [eax]
     c3f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     c42:	76 04                	jbe    c48 <sysEnter_Vector-0x12f3b8>
     c44:	00 00                	add    BYTE PTR [eax],al
     c46:	04 01                	add    al,0x1
     c48:	ef                   	out    dx,eax
     c49:	00 00                	add    BYTE PTR [eax],al
     c4b:	00 0c 84             	add    BYTE PTR [esp+eax*4],cl
     c4e:	05 00 00 6d 00       	add    eax,0x6d0000
     c53:	00 00                	add    BYTE PTR [eax],al
     c55:	2c 06                	sub    al,0x6
     c57:	00 30                	add    BYTE PTR [eax],dh
     c59:	f1                   	icebp  
     c5a:	02 00                	add    al,BYTE PTR [eax]
     c5c:	00 4c 05 00          	add    BYTE PTR [ebp+eax*1+0x0],cl
     c60:	00 02                	add    BYTE PTR [edx],al
     c62:	01 06                	add    DWORD PTR [esi],eax
     c64:	51                   	push   ecx
     c65:	00 00                	add    BYTE PTR [eax],al
     c67:	00 02                	add    BYTE PTR [edx],al
     c69:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
     c6f:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     c76:	02 08                	add    cl,BYTE PTR [eax]
     c78:	05 00 00 00 00       	add    eax,0x0
     c7d:	02 01                	add    al,BYTE PTR [ecx]
     c7f:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
     c82:	00 00                	add    BYTE PTR [eax],al
     c84:	02 02                	add    al,BYTE PTR [edx]
     c86:	07                   	pop    es
     c87:	0e                   	push   cs
     c88:	00 00                	add    BYTE PTR [eax],al
     c8a:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
     c8d:	00 00                	add    BYTE PTR [eax],al
     c8f:	00 02                	add    BYTE PTR [edx],al
     c91:	34 5a                	xor    al,0x5a
     c93:	00 00                	add    BYTE PTR [eax],al
     c95:	00 02                	add    BYTE PTR [edx],al
     c97:	04 07                	add    al,0x7
     c99:	32 00                	xor    al,BYTE PTR [eax]
     c9b:	00 00                	add    BYTE PTR [eax],al
     c9d:	02 08                	add    cl,BYTE PTR [eax]
     c9f:	07                   	pop    es
     ca0:	28 00                	sub    BYTE PTR [eax],al
     ca2:	00 00                	add    BYTE PTR [eax],al
     ca4:	04 02                	add    al,0x2
     ca6:	05 00 00 03 d8       	add    eax,0xd8030000
     cab:	5a                   	pop    edx
     cac:	00 00                	add    BYTE PTR [eax],al
     cae:	00 02                	add    BYTE PTR [edx],al
     cb0:	04 05                	add    al,0x5
     cb2:	05 00 00 00 02       	add    eax,0x2000000
     cb7:	0c 04                	or     al,0x4
     cb9:	96                   	xchg   esi,eax
     cba:	00 00                	add    BYTE PTR [eax],al
     cbc:	00 05 33 05 00 00    	add    BYTE PTR ds:0x533,al
     cc2:	10 04 2b             	adc    BYTE PTR [ebx+ebp*1],al
     cc5:	be 00 00 00 06       	mov    esi,0x6000000
     cca:	18 05 00 00 04 2d    	sbb    BYTE PTR ds:0x2d040000,al
     cd0:	4f                   	dec    edi
     cd1:	00 00                	add    BYTE PTR [eax],al
     cd3:	00 00                	add    BYTE PTR [eax],al
     cd5:	07                   	pop    es
     cd6:	6c                   	ins    BYTE PTR es:[edi],dx
     cd7:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     cd9:	00 04 2e             	add    BYTE PTR [esi+ebp*1],al
     cdc:	4f                   	dec    edi
     cdd:	00 00                	add    BYTE PTR [eax],al
     cdf:	00 04 06             	add    BYTE PTR [esi+eax*1],al
     ce2:	39 05 00 00 04 2f    	cmp    DWORD PTR ds:0x2f040000,eax
     ce8:	be 00 00 00 08       	mov    esi,0x8000000
     ced:	06                   	push   es
     cee:	91                   	xchg   ecx,eax
     cef:	05 00 00 04 30       	add    eax,0x30040000
     cf4:	c5 00                	lds    eax,FWORD PTR [eax]
     cf6:	00 00                	add    BYTE PTR [eax],al
     cf8:	0c 00                	or     al,0x0
     cfa:	02 01                	add    al,BYTE PTR [ecx]
     cfc:	02 90 00 00 00 08    	add    dl,BYTE PTR [eax+0x8000000]
     d02:	04 81                	add    al,0x81
     d04:	00 00                	add    BYTE PTR [eax],al
     d06:	00 04 96             	add    BYTE PTR [esi+edx*4],al
     d09:	05 00 00 04 31       	add    eax,0x31040000
     d0e:	81 00 00 00 02 01    	add    DWORD PTR [eax],0x1020000
     d14:	06                   	push   es
     d15:	58                   	pop    eax
     d16:	00 00                	add    BYTE PTR [eax],al
     d18:	00 04 5d 00 00 00 05 	add    BYTE PTR [ebx*2+0x5000000],al
     d1f:	2a 73 00             	sub    dh,BYTE PTR [ebx+0x0]
     d22:	00 00                	add    BYTE PTR [eax],al
     d24:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     d27:	2d 00 00 00 02       	sub    eax,0x2000000
     d2c:	04 07                	add    al,0x7
     d2e:	dc 00                	fadd   QWORD PTR [eax]
     d30:	00 00                	add    BYTE PTR [eax],al
     d32:	09 04 0a             	or     DWORD PTR [edx+ecx*1],eax
     d35:	3f                   	aas    
     d36:	05 00 00 01 0c       	add    eax,0xc010000
     d3b:	2c 06                	sub    al,0x6
     d3d:	00 30                	add    BYTE PTR [eax],dh
     d3f:	34 00                	xor    al,0x0
     d41:	00 00                	add    BYTE PTR [eax],al
     d43:	01 9c 0b 64 05 00 00 	add    DWORD PTR [ebx+ecx*1+0x564],ebx
     d4a:	01 13                	add    DWORD PTR [ebx],edx
     d4c:	4f                   	dec    edi
     d4d:	00 00                	add    BYTE PTR [eax],al
     d4f:	00 60 06             	add    BYTE PTR [eax+0x6],ah
     d52:	00 30                	add    BYTE PTR [eax],dh
     d54:	7c 00                	jl     d56 <sysEnter_Vector-0x12f2aa>
     d56:	00 00                	add    BYTE PTR [eax],al
     d58:	01 9c 3f 01 00 00 0c 	add    DWORD PTR [edi+edi*1+0xc000001],ebx
     d5f:	5f                   	pop    edi
     d60:	05 00 00 01 13       	add    eax,0x13010000
     d65:	68 00 00 00 02       	push   0x2000000
     d6a:	91                   	xchg   ecx,eax
     d6b:	00 0d fa 04 00 00    	add    BYTE PTR ds:0x4fa,cl
     d71:	01 15 4f 00 00 00    	add    DWORD PTR ds:0x4f,edx
     d77:	02 91 74 00 0e 43    	add    dl,BYTE PTR [ecx+0x430e0074]
     d7d:	05 00 00 01 26       	add    eax,0x26010000
     d82:	f6 00 00             	test   BYTE PTR [eax],0x0
     d85:	00 dc                	add    ah,bl
     d87:	06                   	push   es
     d88:	00 30                	add    BYTE PTR [eax],dh
     d8a:	e2 01                	loop   d8d <sysEnter_Vector-0x12f273>
     d8c:	00 00                	add    BYTE PTR [eax],al
     d8e:	01 9c ad 01 00 00 0c 	add    DWORD PTR [ebp+ebp*4+0xc000001],ebx
     d95:	5f                   	pop    edi
     d96:	05 00 00 01 26       	add    eax,0x26010000
     d9b:	68 00 00 00 02       	push   0x2000000
     da0:	91                   	xchg   ecx,eax
     da1:	00 0d 5a 03 00 00    	add    BYTE PTR ds:0x35a,cl
     da7:	01 28                	add    DWORD PTR [eax],ebp
     da9:	f6 00 00             	test   BYTE PTR [eax],0x0
     dac:	00 02                	add    BYTE PTR [edx],al
     dae:	91                   	xchg   ecx,eax
     daf:	60                   	pusha  
     db0:	0d 2c 05 00 00       	or     eax,0x52c
     db5:	01 2a                	add    DWORD PTR [edx],ebp
     db7:	4f                   	dec    edi
     db8:	00 00                	add    BYTE PTR [eax],al
     dba:	00 02                	add    BYTE PTR [edx],al
     dbc:	91                   	xchg   ecx,eax
     dbd:	6c                   	ins    BYTE PTR es:[edi],dx
     dbe:	0d e4 04 00 00       	or     eax,0x4e4
     dc3:	01 2b                	add    DWORD PTR [ebx],ebp
     dc5:	4f                   	dec    edi
     dc6:	00 00                	add    BYTE PTR [eax],al
     dc8:	00 02                	add    BYTE PTR [edx],al
     dca:	91                   	xchg   ecx,eax
     dcb:	68 0d 24 05 00       	push   0x5240d
     dd0:	00 01                	add    BYTE PTR [ecx],al
     dd2:	2c ad                	sub    al,0xad
     dd4:	01 00                	add    DWORD PTR [eax],eax
     dd6:	00 02                	add    BYTE PTR [edx],al
     dd8:	91                   	xchg   ecx,eax
     dd9:	64                   	fs
     dda:	0d 53 05 00 00       	or     eax,0x553
     ddf:	01 2c ad 01 00 00 02 	add    DWORD PTR [ebp*4+0x2000001],ebp
     de6:	91                   	xchg   ecx,eax
     de7:	5c                   	pop    esp
     de8:	00 08                	add    BYTE PTR [eax],cl
     dea:	04 cb                	add    al,0xcb
     dec:	00 00                	add    BYTE PTR [eax],al
     dee:	00 0f                	add    BYTE PTR [edi],cl
     df0:	1f                   	pop    ds
     df1:	05 00 00 01 4d       	add    eax,0x4d010000
     df6:	be 08 00 30 39       	mov    esi,0x39300008
     dfb:	00 00                	add    BYTE PTR [eax],al
     dfd:	00 01                	add    BYTE PTR [ecx],al
     dff:	9c                   	pushf  
     e00:	ef                   	out    dx,eax
     e01:	01 00                	add    DWORD PTR [eax],eax
     e03:	00 0c f1             	add    BYTE PTR [ecx+esi*8],cl
     e06:	04 00                	add    al,0x0
     e08:	00 01                	add    BYTE PTR [ecx],al
     e0a:	4d                   	dec    ebp
     e0b:	f6 00 00             	test   BYTE PTR [eax],0x0
     e0e:	00 02                	add    BYTE PTR [edx],al
     e10:	91                   	xchg   ecx,eax
     e11:	00 10                	add    BYTE PTR [eax],dl
     e13:	6d                   	ins    DWORD PTR es:[edi],dx
     e14:	70 00                	jo     e16 <sysEnter_Vector-0x12f1ea>
     e16:	01 4f ad             	add    DWORD PTR [edi-0x53],ecx
     e19:	01 00                	add    DWORD PTR [eax],eax
     e1b:	00 02                	add    BYTE PTR [edx],al
     e1d:	91                   	xchg   ecx,eax
     e1e:	74 11                	je     e31 <sysEnter_Vector-0x12f1cf>
     e20:	4a                   	dec    edx
     e21:	05 00 00 01 59       	add    eax,0x59010000
     e26:	e9 08 00 30 00       	jmp    300e33 <sysEnter_Vector+0x1d0e33>
     e2b:	0a 09                	or     cl,BYTE PTR [ecx]
     e2d:	05 00 00 01 5f       	add    eax,0x5f010000
     e32:	f7                   	(bad)  
     e33:	08 00                	or     BYTE PTR [eax],al
     e35:	30 26                	xor    BYTE PTR [esi],ah
     e37:	00 00                	add    BYTE PTR [eax],al
     e39:	00 01                	add    BYTE PTR [ecx],al
     e3b:	9c                   	pushf  
     e3c:	12 3f                	adc    bh,BYTE PTR [edi]
     e3e:	00 00                	add    BYTE PTR [eax],al
     e40:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
     e43:	4f                   	dec    edi
     e44:	00 00                	add    BYTE PTR [eax],al
     e46:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
     e4c:	30 12                	xor    BYTE PTR [edx],dl
     e4e:	aa                   	stos   BYTE PTR es:[edi],al
     e4f:	00 00                	add    BYTE PTR [eax],al
     e51:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     e54:	4f                   	dec    edi
     e55:	00 00                	add    BYTE PTR [eax],al
     e57:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
     e5d:	30 12                	xor    BYTE PTR [edx],dl
     e5f:	56                   	push   esi
     e60:	01 00                	add    DWORD PTR [eax],eax
     e62:	00 04 35 4f 00 00 00 	add    BYTE PTR [esi*1+0x4f],al
     e69:	05 03 30 34 00       	add    eax,0x343003
     e6e:	30 12                	xor    BYTE PTR [edx],dl
     e70:	48                   	dec    eax
     e71:	00 00                	add    BYTE PTR [eax],al
     e73:	00 06                	add    BYTE PTR [esi],al
     e75:	36 dd 00             	fld    QWORD PTR ss:[eax]
     e78:	00 00                	add    BYTE PTR [eax],al
     e7a:	05 03 3c 34 00       	add    eax,0x343c03
     e7f:	30 00                	xor    BYTE PTR [eax],al
     e81:	de 01                	fiadd  WORD PTR [ecx]
     e83:	00 00                	add    BYTE PTR [eax],al
     e85:	04 00                	add    al,0x0
     e87:	9d                   	popf   
     e88:	05 00 00 04 01       	add    eax,0x1040000
     e8d:	ef                   	out    dx,eax
     e8e:	00 00                	add    BYTE PTR [eax],al
     e90:	00 0c a0             	add    BYTE PTR [eax+eiz*4],cl
     e93:	05 00 00 6d 00       	add    eax,0x6d0000
     e98:	00 00                	add    BYTE PTR [eax],al
     e9a:	20 09                	and    BYTE PTR [ecx],cl
     e9c:	00 30                	add    BYTE PTR [eax],dh
     e9e:	9b                   	fwait
     e9f:	01 00                	add    DWORD PTR [eax],eax
     ea1:	00 64 06 00          	add    BYTE PTR [esi+eax*1+0x0],ah
     ea5:	00 02                	add    BYTE PTR [edx],al
     ea7:	01 08                	add    DWORD PTR [eax],ecx
     ea9:	4f                   	dec    edi
     eaa:	00 00                	add    BYTE PTR [eax],al
     eac:	00 02                	add    BYTE PTR [edx],al
     eae:	02 07                	add    al,BYTE PTR [edi]
     eb0:	0e                   	push   cs
     eb1:	00 00                	add    BYTE PTR [eax],al
     eb3:	00 02                	add    BYTE PTR [edx],al
     eb5:	04 07                	add    al,0x7
     eb7:	32 00                	xor    al,BYTE PTR [eax]
     eb9:	00 00                	add    BYTE PTR [eax],al
     ebb:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     ebe:	2d 00 00 00 02       	sub    eax,0x2000000
     ec3:	01 06                	add    DWORD PTR [esi],eax
     ec5:	51                   	push   ecx
     ec6:	00 00                	add    BYTE PTR [eax],al
     ec8:	00 02                	add    BYTE PTR [edx],al
     eca:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
     ed0:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     ed7:	02 08                	add    cl,BYTE PTR [eax]
     ed9:	05 00 00 00 00       	add    eax,0x0
     ede:	02 08                	add    cl,BYTE PTR [eax]
     ee0:	07                   	pop    es
     ee1:	28 00                	sub    BYTE PTR [eax],al
     ee3:	00 00                	add    BYTE PTR [eax],al
     ee5:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
     eec:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     eef:	dc 00                	fadd   QWORD PTR [eax]
     ef1:	00 00                	add    BYTE PTR [eax],al
     ef3:	04 04                	add    al,0x4
     ef5:	05 04 7a 00 00       	add    eax,0x7a04
     efa:	00 02                	add    BYTE PTR [edx],al
     efc:	01 06                	add    DWORD PTR [esi],eax
     efe:	58                   	pop    eax
     eff:	00 00                	add    BYTE PTR [eax],al
     f01:	00 06                	add    BYTE PTR [esi],al
     f03:	64 00 00             	add    BYTE PTR fs:[eax],al
     f06:	00 02                	add    BYTE PTR [edx],al
     f08:	34 33                	xor    al,0x33
     f0a:	00 00                	add    BYTE PTR [eax],al
     f0c:	00 06                	add    BYTE PTR [esi],al
     f0e:	5d                   	pop    ebp
     f0f:	00 00                	add    BYTE PTR [eax],al
     f11:	00 03                	add    BYTE PTR [ebx],al
     f13:	2a 64 00 00          	sub    ah,BYTE PTR [eax+eax*1+0x0]
     f17:	00 05 04 9d 00 00    	add    BYTE PTR ds:0x9d04,al
     f1d:	00 07                	add    BYTE PTR [edi],al
     f1f:	7a 00                	jp     f21 <sysEnter_Vector-0x12f0df>
     f21:	00 00                	add    BYTE PTR [eax],al
     f23:	06                   	push   es
     f24:	02 05 00 00 04 d8    	add    al,BYTE PTR ds:0xd8040000
     f2a:	33 00                	xor    eax,DWORD PTR [eax]
     f2c:	00 00                	add    BYTE PTR [eax],al
     f2e:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
     f31:	96                   	xchg   esi,eax
     f32:	00 00                	add    BYTE PTR [eax],al
     f34:	00 02                	add    BYTE PTR [edx],al
     f36:	01 02                	add    DWORD PTR [edx],eax
     f38:	90                   	nop
     f39:	00 00                	add    BYTE PTR [eax],al
     f3b:	00 08                	add    BYTE PTR [eax],cl
     f3d:	b2 05                	mov    dl,0x5
     f3f:	00 00                	add    BYTE PTR [eax],al
     f41:	01 0a                	add    DWORD PTR [edx],ecx
     f43:	72 00                	jb     f45 <sysEnter_Vector-0x12f0bb>
     f45:	00 00                	add    BYTE PTR [eax],al
     f47:	20 09                	and    BYTE PTR [ecx],cl
     f49:	00 30                	add    BYTE PTR [eax],dh
     f4b:	9b                   	fwait
     f4c:	01 00                	add    DWORD PTR [eax],eax
     f4e:	00 01                	add    BYTE PTR [ecx],al
     f50:	9c                   	pushf  
     f51:	85 01                	test   DWORD PTR [ecx],eax
     f53:	00 00                	add    BYTE PTR [eax],al
     f55:	09 ad 05 00 00 01    	or     DWORD PTR [ebp+0x1000005],ebp
     f5b:	0a 72 00             	or     dh,BYTE PTR [edx+0x0]
     f5e:	00 00                	add    BYTE PTR [eax],al
     f60:	02 91 00 0a 73 72    	add    dl,BYTE PTR [ecx+0x72730a00]
     f66:	63 00                	arpl   WORD PTR [eax],ax
     f68:	01 0a                	add    DWORD PTR [edx],ecx
     f6a:	85 01                	test   DWORD PTR [ecx],eax
     f6c:	00 00                	add    BYTE PTR [eax],al
     f6e:	02 91 04 0a 6e 00    	add    dl,BYTE PTR [ecx+0x6e0a04]
     f74:	01 0a                	add    DWORD PTR [edx],ecx
     f76:	a2 00 00 00 02       	mov    ds:0x2000000,al
     f7b:	91                   	xchg   ecx,eax
     f7c:	08 0b                	or     BYTE PTR [ebx],cl
     f7e:	64                   	fs
     f7f:	77 00                	ja     f81 <sysEnter_Vector-0x12f07f>
     f81:	01 0c b4             	add    DWORD PTR [esp+esi*4],ecx
     f84:	00 00                	add    BYTE PTR [eax],al
     f86:	00 02                	add    BYTE PTR [edx],al
     f88:	91                   	xchg   ecx,eax
     f89:	5e                   	pop    esi
     f8a:	0b 64 64 00          	or     esp,DWORD PTR [esp+eiz*2+0x0]
     f8e:	01 0c b4             	add    DWORD PTR [esp+esi*4],ecx
     f91:	00 00                	add    BYTE PTR [eax],al
     f93:	00 02                	add    BYTE PTR [edx],al
     f95:	91                   	xchg   ecx,eax
     f96:	5f                   	pop    edi
     f97:	0c 52                	or     al,0x52
     f99:	09 00                	or     DWORD PTR [eax],eax
     f9b:	30 7d 00             	xor    BYTE PTR [ebp+0x0],bh
     f9e:	00 00                	add    BYTE PTR [eax],al
     fa0:	3c 01                	cmp    al,0x1
     fa2:	00 00                	add    BYTE PTR [eax],al
     fa4:	0b 66 00             	or     esp,DWORD PTR [esi+0x0]
     fa7:	01 13                	add    DWORD PTR [ebx],edx
     fa9:	8c 01                	mov    WORD PTR [ecx],es
     fab:	00 00                	add    BYTE PTR [eax],al
     fad:	02 91 74 0b 74 00    	add    dl,BYTE PTR [ecx+0x740b74]
     fb3:	01 14 97             	add    DWORD PTR [edi+edx*4],edx
     fb6:	01 00                	add    DWORD PTR [eax],eax
     fb8:	00 02                	add    BYTE PTR [edx],al
     fba:	91                   	xchg   ecx,eax
     fbb:	70 00                	jo     fbd <sysEnter_Vector-0x12f043>
     fbd:	0c d5                	or     al,0xd5
     fbf:	09 00                	or     DWORD PTR [eax],eax
     fc1:	30 79 00             	xor    BYTE PTR [ecx+0x0],bh
     fc4:	00 00                	add    BYTE PTR [eax],al
     fc6:	62 01                	bound  eax,QWORD PTR [ecx]
     fc8:	00 00                	add    BYTE PTR [eax],al
     fca:	0b 66 00             	or     esp,DWORD PTR [esi+0x0]
     fcd:	01 23                	add    DWORD PTR [ebx],esp
     fcf:	8c 01                	mov    WORD PTR [ecx],es
     fd1:	00 00                	add    BYTE PTR [eax],al
     fd3:	02 91 6c 0b 74 00    	add    dl,BYTE PTR [ecx+0x740b6c]
     fd9:	01 24 97             	add    DWORD PTR [edi+edx*4],esp
     fdc:	01 00                	add    DWORD PTR [eax],eax
     fde:	00 02                	add    BYTE PTR [edx],al
     fe0:	91                   	xchg   ecx,eax
     fe1:	68 00 0d 4e 0a       	push   0xa4e0d00
     fe6:	00 30                	add    BYTE PTR [eax],dh
     fe8:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
     feb:	00 0b                	add    BYTE PTR [ebx],cl
     fed:	66                   	data16
     fee:	00 01                	add    BYTE PTR [ecx],al
     ff0:	32 97 00 00 00 02    	xor    dl,BYTE PTR [edi+0x2000000]
     ff6:	91                   	xchg   ecx,eax
     ff7:	64 0b 74 00 01       	or     esi,DWORD PTR fs:[eax+eax*1+0x1]
     ffc:	33 74 00 00          	xor    esi,DWORD PTR [eax+eax*1+0x0]
    1000:	00 02                	add    BYTE PTR [edx],al
    1002:	91                   	xchg   ecx,eax
    1003:	60                   	pusha  
    1004:	00 00                	add    BYTE PTR [eax],al
    1006:	05 04 8b 01 00       	add    eax,0x18b04
    100b:	00 0e                	add    BYTE PTR [esi],cl
    100d:	05 04 92 01 00       	add    eax,0x19204
    1012:	00 07                	add    BYTE PTR [edi],al
    1014:	81 00 00 00 05 04    	add    DWORD PTR [eax],0x4050000
    101a:	81 00 00 00 0f 3f    	add    DWORD PTR [eax],0x3f0f0000
    1020:	00 00                	add    BYTE PTR [eax],al
    1022:	00 05 33 81 00 00    	add    BYTE PTR ds:0x8133,al
    1028:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
    102e:	30 0f                	xor    BYTE PTR [edi],cl
    1030:	aa                   	stos   BYTE PTR es:[edi],al
    1031:	00 00                	add    BYTE PTR [eax],al
    1033:	00 05 34 81 00 00    	add    BYTE PTR ds:0x8134,al
    1039:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
    103f:	30 0f                	xor    BYTE PTR [edi],cl
    1041:	56                   	push   esi
    1042:	01 00                	add    DWORD PTR [eax],eax
    1044:	00 05 35 81 00 00    	add    BYTE PTR ds:0x8135,al
    104a:	00 05 03 30 34 00    	add    BYTE PTR ds:0x343003,al
    1050:	30 0f                	xor    BYTE PTR [edi],cl
    1052:	48                   	dec    eax
    1053:	00 00                	add    BYTE PTR [eax],al
    1055:	00 06                	add    BYTE PTR [esi],al
    1057:	36 8c 00             	mov    WORD PTR ss:[eax],es
    105a:	00 00                	add    BYTE PTR [eax],al
    105c:	05 03 3c 34 00       	add    eax,0x343c03
    1061:	30 00                	xor    BYTE PTR [eax],al
    1063:	96                   	xchg   esi,eax
    1064:	01 00                	add    DWORD PTR [eax],eax
    1066:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1069:	5e                   	pop    esi
    106a:	06                   	push   es
    106b:	00 00                	add    BYTE PTR [eax],al
    106d:	04 01                	add    al,0x1
    106f:	ef                   	out    dx,eax
    1070:	00 00                	add    BYTE PTR [eax],al
    1072:	00 0c cd 05 00 00 6d 	add    BYTE PTR [ecx*8+0x6d000005],cl
    1079:	00 00                	add    BYTE PTR [eax],al
    107b:	00 bc 0a 00 30 c7 00 	add    BYTE PTR [edx+ecx*1+0xc73000],bh
    1082:	00 00                	add    BYTE PTR [eax],al
    1084:	55                   	push   ebp
    1085:	07                   	pop    es
    1086:	00 00                	add    BYTE PTR [eax],al
    1088:	02 01                	add    al,BYTE PTR [ecx]
    108a:	06                   	push   es
    108b:	58                   	pop    eax
    108c:	00 00                	add    BYTE PTR [eax],al
    108e:	00 02                	add    BYTE PTR [edx],al
    1090:	01 06                	add    DWORD PTR [esi],eax
    1092:	51                   	push   ecx
    1093:	00 00                	add    BYTE PTR [eax],al
    1095:	00 02                	add    BYTE PTR [edx],al
    1097:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    109d:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    10a4:	02 08                	add    cl,BYTE PTR [eax]
    10a6:	05 00 00 00 00       	add    eax,0x0
    10ab:	04 be                	add    al,0xbe
    10ad:	05 00 00 02 2e       	add    eax,0x2e020000
    10b2:	53                   	push   ebx
    10b3:	00 00                	add    BYTE PTR [eax],al
    10b5:	00 02                	add    BYTE PTR [edx],al
    10b7:	01 08                	add    DWORD PTR [eax],ecx
    10b9:	4f                   	dec    edi
    10ba:	00 00                	add    BYTE PTR [eax],al
    10bc:	00 04 df             	add    BYTE PTR [edi+ebx*8],al
    10bf:	05 00 00 02 31       	add    eax,0x31020000
    10c4:	65 00 00             	add    BYTE PTR gs:[eax],al
    10c7:	00 02                	add    BYTE PTR [edx],al
    10c9:	02 07                	add    al,BYTE PTR [edi]
    10cb:	0e                   	push   cs
    10cc:	00 00                	add    BYTE PTR [eax],al
    10ce:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    10d1:	00 00                	add    BYTE PTR [eax],al
    10d3:	00 02                	add    BYTE PTR [edx],al
    10d5:	34 77                	xor    al,0x77
    10d7:	00 00                	add    BYTE PTR [eax],al
    10d9:	00 02                	add    BYTE PTR [edx],al
    10db:	04 07                	add    al,0x7
    10dd:	32 00                	xor    al,BYTE PTR [eax]
    10df:	00 00                	add    BYTE PTR [eax],al
    10e1:	02 08                	add    cl,BYTE PTR [eax]
    10e3:	07                   	pop    es
    10e4:	28 00                	sub    BYTE PTR [eax],al
    10e6:	00 00                	add    BYTE PTR [eax],al
    10e8:	04 02                	add    al,0x2
    10ea:	05 00 00 03 d8       	add    eax,0xd8030000
    10ef:	77 00                	ja     10f1 <sysEnter_Vector-0x12ef0f>
    10f1:	00 00                	add    BYTE PTR [eax],al
    10f3:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    10fa:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    10fd:	96                   	xchg   esi,eax
    10fe:	00 00                	add    BYTE PTR [eax],al
    1100:	00 02                	add    BYTE PTR [edx],al
    1102:	01 02                	add    DWORD PTR [edx],eax
    1104:	90                   	nop
    1105:	00 00                	add    BYTE PTR [eax],al
    1107:	00 04 5d 00 00 00 04 	add    BYTE PTR [ebx*2+0x4000000],al
    110e:	2a 90 00 00 00 02    	sub    dl,BYTE PTR [eax+0x2000000]
    1114:	04 07                	add    al,0x7
    1116:	2d 00 00 00 02       	sub    eax,0x2000000
    111b:	04 07                	add    al,0x7
    111d:	dc 00                	fadd   QWORD PTR [eax]
    111f:	00 00                	add    BYTE PTR [eax],al
    1121:	05 04 06 c6 05       	add    eax,0x5c60604
    1126:	00 00                	add    BYTE PTR [eax],al
    1128:	01 08                	add    DWORD PTR [eax],ecx
    112a:	be 00 00 00 bc       	mov    esi,0xbc000000
    112f:	0a 00                	or     al,BYTE PTR [eax]
    1131:	30 c7                	xor    bh,al
    1133:	00 00                	add    BYTE PTR [eax],al
    1135:	00 01                	add    BYTE PTR [ecx],al
    1137:	9c                   	pushf  
    1138:	43                   	inc    ebx
    1139:	01 00                	add    DWORD PTR [eax],eax
    113b:	00 07                	add    BYTE PTR [edi],al
    113d:	64 31 00             	xor    DWORD PTR fs:[eax],eax
    1140:	01 08                	add    DWORD PTR [eax],ecx
    1142:	be 00 00 00 02       	mov    esi,0x2000000
    1147:	91                   	xchg   ecx,eax
    1148:	00 07                	add    BYTE PTR [edi],al
    114a:	76 61                	jbe    11ad <sysEnter_Vector-0x12ee53>
    114c:	6c                   	ins    BYTE PTR es:[edi],dx
    114d:	00 01                	add    BYTE PTR [ecx],al
    114f:	08 3a                	or     BYTE PTR [edx],bh
    1151:	00 00                	add    BYTE PTR [eax],al
    1153:	00 02                	add    BYTE PTR [edx],al
    1155:	91                   	xchg   ecx,eax
    1156:	04 07                	add    al,0x7
    1158:	6c                   	ins    BYTE PTR es:[edi],dx
    1159:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    115b:	00 01                	add    BYTE PTR [ecx],al
    115d:	08 85 00 00 00 02    	or     BYTE PTR [ebp+0x2000000],al
    1163:	91                   	xchg   ecx,eax
    1164:	08 08                	or     BYTE PTR [eax],cl
    1166:	64 00 01             	add    BYTE PTR fs:[ecx],al
    1169:	0a 43 01             	or     al,BYTE PTR [ebx+0x1]
    116c:	00 00                	add    BYTE PTR [eax],al
    116e:	02 91 74 08 65 00    	add    dl,BYTE PTR [ecx+0x650874]
    1174:	01 0b                	add    DWORD PTR [ebx],ecx
    1176:	49                   	dec    ecx
    1177:	01 00                	add    DWORD PTR [eax],eax
    1179:	00 02                	add    BYTE PTR [edx],al
    117b:	91                   	xchg   ecx,eax
    117c:	70 09                	jo     1187 <sysEnter_Vector-0x12ee79>
    117e:	b9 05 00 00 01       	mov    ecx,0x1000005
    1183:	0c 5a                	or     al,0x5a
    1185:	00 00                	add    BYTE PTR [eax],al
    1187:	00 02                	add    BYTE PTR [edx],al
    1189:	91                   	xchg   ecx,eax
    118a:	6a 08                	push   0x8
    118c:	66                   	data16
    118d:	00 01                	add    BYTE PTR [ecx],al
    118f:	0d 4f 01 00 00       	or     eax,0x14f
    1194:	02 91 6c 09 da 05    	add    dl,BYTE PTR [ecx+0x5da096c]
    119a:	00 00                	add    BYTE PTR [eax],al
    119c:	01 0e                	add    DWORD PTR [esi],ecx
    119e:	6c                   	ins    BYTE PTR es:[edi],dx
    119f:	00 00                	add    BYTE PTR [eax],al
    11a1:	00 02                	add    BYTE PTR [edx],al
    11a3:	91                   	xchg   ecx,eax
    11a4:	64 00 0a             	add    BYTE PTR fs:[edx],cl
    11a7:	04 48                	add    al,0x48
    11a9:	00 00                	add    BYTE PTR [eax],al
    11ab:	00 0a                	add    BYTE PTR [edx],cl
    11ad:	04 5a                	add    al,0x5a
    11af:	00 00                	add    BYTE PTR [eax],al
    11b1:	00 0a                	add    BYTE PTR [edx],cl
    11b3:	04 6c                	add    al,0x6c
    11b5:	00 00                	add    BYTE PTR [eax],al
    11b7:	00 0b                	add    BYTE PTR [ebx],cl
    11b9:	3f                   	aas    
    11ba:	00 00                	add    BYTE PTR [eax],al
    11bc:	00 05 33 6c 00 00    	add    BYTE PTR ds:0x6c33,al
    11c2:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
    11c8:	30 0b                	xor    BYTE PTR [ebx],cl
    11ca:	aa                   	stos   BYTE PTR es:[edi],al
    11cb:	00 00                	add    BYTE PTR [eax],al
    11cd:	00 05 34 6c 00 00    	add    BYTE PTR ds:0x6c34,al
    11d3:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
    11d9:	30 0b                	xor    BYTE PTR [ebx],cl
    11db:	56                   	push   esi
    11dc:	01 00                	add    DWORD PTR [eax],eax
    11de:	00 05 35 6c 00 00    	add    BYTE PTR ds:0x6c35,al
    11e4:	00 05 03 30 34 00    	add    BYTE PTR ds:0x343003,al
    11ea:	30 0b                	xor    BYTE PTR [ebx],cl
    11ec:	48                   	dec    eax
    11ed:	00 00                	add    BYTE PTR [eax],al
    11ef:	00 06                	add    BYTE PTR [esi],al
    11f1:	36 a5                	movs   DWORD PTR es:[edi],DWORD PTR ss:[esi]
    11f3:	00 00                	add    BYTE PTR [eax],al
    11f5:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
    11fb:	30 00                	xor    BYTE PTR [eax],al
    11fd:	50                   	push   eax
    11fe:	04 00                	add    al,0x0
    1200:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1203:	ff 06                	inc    DWORD PTR [esi]
    1205:	00 00                	add    BYTE PTR [eax],al
    1207:	04 01                	add    al,0x1
    1209:	ef                   	out    dx,eax
    120a:	00 00                	add    BYTE PTR [eax],al
    120c:	00 0c ef             	add    BYTE PTR [edi+ebp*8],cl
    120f:	06                   	push   es
    1210:	00 00                	add    BYTE PTR [eax],al
    1212:	6d                   	ins    DWORD PTR es:[edi],dx
    1213:	00 00                	add    BYTE PTR [eax],al
    1215:	00 84 0b 00 30 a5 00 	add    BYTE PTR [ebx+ecx*1+0xa53000],al
    121c:	00 00                	add    BYTE PTR [eax],al
    121e:	29 08                	sub    DWORD PTR [eax],ecx
    1220:	00 00                	add    BYTE PTR [eax],al
    1222:	02 04 05 69 6e 74 00 	add    al,BYTE PTR [eax*1+0x746e69]
    1229:	03 02                	add    eax,DWORD PTR [edx]
    122b:	05 00 00 03 d8       	add    eax,0xd8030000
    1230:	37                   	aaa    
    1231:	00 00                	add    BYTE PTR [eax],al
    1233:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    1236:	07                   	pop    es
    1237:	32 00                	xor    al,BYTE PTR [eax]
    1239:	00 00                	add    BYTE PTR [eax],al
    123b:	04 04                	add    al,0x4
    123d:	05 05 00 00 00       	add    eax,0x5
    1242:	04 08                	add    al,0x8
    1244:	05 00 00 00 00       	add    eax,0x0
    1249:	04 0c                	add    al,0xc
    124b:	04 96                	add    al,0x96
    124d:	00 00                	add    BYTE PTR [eax],al
    124f:	00 05 54 06 00 00    	add    BYTE PTR ds:0x654,al
    1255:	0c 02                	or     al,0x2
    1257:	17                   	pop    ss
    1258:	84 00                	test   BYTE PTR [eax],al
    125a:	00 00                	add    BYTE PTR [eax],al
    125c:	06                   	push   es
    125d:	6f                   	outs   dx,DWORD PTR ds:[esi]
    125e:	07                   	pop    es
    125f:	00 00                	add    BYTE PTR [eax],al
    1261:	02 19                	add    bl,BYTE PTR [ecx]
    1263:	84 00                	test   BYTE PTR [eax],al
    1265:	00 00                	add    BYTE PTR [eax],al
    1267:	00 06                	add    BYTE PTR [esi],al
    1269:	91                   	xchg   ecx,eax
    126a:	05 00 00 02 19       	add    eax,0x19020000
    126f:	84 00                	test   BYTE PTR [eax],al
    1271:	00 00                	add    BYTE PTR [eax],al
    1273:	04 06                	add    al,0x6
    1275:	67 07                	addr16 pop es
    1277:	00 00                	add    BYTE PTR [eax],al
    1279:	02 1a                	add    bl,BYTE PTR [edx]
    127b:	8a 00                	mov    al,BYTE PTR [eax]
    127d:	00 00                	add    BYTE PTR [eax],al
    127f:	08 00                	or     BYTE PTR [eax],al
    1281:	07                   	pop    es
    1282:	04 53                	add    al,0x53
    1284:	00 00                	add    BYTE PTR [eax],al
    1286:	00 08                	add    BYTE PTR [eax],cl
    1288:	04 03                	add    al,0x3
    128a:	40                   	inc    eax
    128b:	07                   	pop    es
    128c:	00 00                	add    BYTE PTR [eax],al
    128e:	02 1b                	add    bl,BYTE PTR [ebx]
    1290:	53                   	push   ebx
    1291:	00 00                	add    BYTE PTR [eax],al
    1293:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1296:	06                   	push   es
    1297:	51                   	push   ecx
    1298:	00 00                	add    BYTE PTR [eax],al
    129a:	00 04 02             	add    BYTE PTR [edx+eax*1],al
    129d:	05 e5 00 00 00       	add    eax,0xe5
    12a2:	04 01                	add    al,0x1
    12a4:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    12a7:	00 00                	add    BYTE PTR [eax],al
    12a9:	04 02                	add    al,0x2
    12ab:	07                   	pop    es
    12ac:	0e                   	push   cs
    12ad:	00 00                	add    BYTE PTR [eax],al
    12af:	00 03                	add    BYTE PTR [ebx],al
    12b1:	fc                   	cld    
    12b2:	05 00 00 04 37       	add    eax,0x37040000
    12b7:	be 00 00 00 04       	mov    esi,0x4000000
    12bc:	08 07                	or     BYTE PTR [edi],al
    12be:	28 00                	sub    BYTE PTR [eax],al
    12c0:	00 00                	add    BYTE PTR [eax],al
    12c2:	05 05 06 00 00       	add    eax,0x605
    12c7:	14 05                	adc    al,0x5
    12c9:	1b f6                	sbb    esi,esi
    12cb:	00 00                	add    BYTE PTR [eax],al
    12cd:	00 06                	add    BYTE PTR [esi],al
    12cf:	03 07                	add    eax,DWORD PTR [edi]
    12d1:	00 00                	add    BYTE PTR [eax],al
    12d3:	05 1d 8c 00 00       	add    eax,0x8c1d
    12d8:	00 00                	add    BYTE PTR [eax],al
    12da:	06                   	push   es
    12db:	7e 06                	jle    12e3 <sysEnter_Vector-0x12ed1d>
    12dd:	00 00                	add    BYTE PTR [eax],al
    12df:	05 1e 37 00 00       	add    eax,0x371e
    12e4:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
    12e7:	b7 06                	mov    bh,0x6
    12e9:	00 00                	add    BYTE PTR [eax],al
    12eb:	05 1f 27 01 00       	add    eax,0x1271f
    12f0:	00 10                	add    BYTE PTR [eax],dl
    12f2:	00 05 ee 05 00 00    	add    BYTE PTR ds:0x5ee,al
    12f8:	0c 05                	or     al,0x5
    12fa:	37                   	aaa    
    12fb:	27                   	daa    
    12fc:	01 00                	add    DWORD PTR [eax],eax
    12fe:	00 06                	add    BYTE PTR [esi],al
    1300:	e8 06 00 00 05       	call   500130b <sysEnter_Vector+0x4ed130b>
    1305:	39 30                	cmp    DWORD PTR [eax],esi
    1307:	02 00                	add    al,BYTE PTR [eax]
    1309:	00 00                	add    BYTE PTR [eax],al
    130b:	06                   	push   es
    130c:	d1 06                	rol    DWORD PTR [esi],1
    130e:	00 00                	add    BYTE PTR [eax],al
    1310:	05 3a 3d 02 00       	add    eax,0x23d3a
    1315:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    1318:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
    1319:	06                   	push   es
    131a:	00 00                	add    BYTE PTR [eax],al
    131c:	05 3b 27 01 00       	add    eax,0x1273b
    1321:	00 08                	add    BYTE PTR [eax],cl
    1323:	00 07                	add    BYTE PTR [edi],al
    1325:	04 f6                	add    al,0xf6
    1327:	00 00                	add    BYTE PTR [eax],al
    1329:	00 05 1c 06 00 00    	add    BYTE PTR ds:0x61c,al
    132f:	0c 05                	or     al,0x5
    1331:	22 5e 01             	and    bl,BYTE PTR [esi+0x1]
    1334:	00 00                	add    BYTE PTR [eax],al
    1336:	06                   	push   es
    1337:	11 06                	adc    DWORD PTR [esi],eax
    1339:	00 00                	add    BYTE PTR [eax],al
    133b:	05 24 27 01 00       	add    eax,0x12724
    1340:	00 00                	add    BYTE PTR [eax],al
    1342:	06                   	push   es
    1343:	64                   	fs
    1344:	06                   	push   es
    1345:	00 00                	add    BYTE PTR [eax],al
    1347:	05 25 5e 01 00       	add    eax,0x15e25
    134c:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    134f:	0a 07                	or     al,BYTE PTR [edi]
    1351:	00 00                	add    BYTE PTR [eax],al
    1353:	05 26 25 00 00       	add    eax,0x2526
    1358:	00 08                	add    BYTE PTR [eax],cl
    135a:	00 07                	add    BYTE PTR [edi],al
    135c:	04 c5                	add    al,0xc5
    135e:	00 00                	add    BYTE PTR [eax],al
    1360:	00 05 d3 06 00 00    	add    BYTE PTR ds:0x6d3,al
    1366:	24 05                	and    al,0x5
    1368:	29 d1                	sub    ecx,edx
    136a:	01 00                	add    DWORD PTR [eax],eax
    136c:	00 06                	add    BYTE PTR [esi],al
    136e:	78 06                	js     1376 <sysEnter_Vector-0x12ec8a>
    1370:	00 00                	add    BYTE PTR [eax],al
    1372:	05 2b 37 00 00       	add    eax,0x372b
    1377:	00 00                	add    BYTE PTR [eax],al
    1379:	06                   	push   es
    137a:	39 07                	cmp    DWORD PTR [edi],eax
    137c:	00 00                	add    BYTE PTR [eax],al
    137e:	05 2c ac 00 00       	add    eax,0xac2c
    1383:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    1386:	9d                   	popf   
    1387:	06                   	push   es
    1388:	00 00                	add    BYTE PTR [eax],al
    138a:	05 2d ac 00 00       	add    eax,0xac2d
    138f:	00 06                	add    BYTE PTR [esi],al
    1391:	06                   	push   es
    1392:	84 06                	test   BYTE PTR [esi],al
    1394:	00 00                	add    BYTE PTR [eax],al
    1396:	05 2e 37 00 00       	add    eax,0x372e
    139b:	00 08                	add    BYTE PTR [eax],cl
    139d:	06                   	push   es
    139e:	74 07                	je     13a7 <sysEnter_Vector-0x12ec59>
    13a0:	00 00                	add    BYTE PTR [eax],al
    13a2:	05 2f 37 00 00       	add    eax,0x372f
    13a7:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
    13aa:	6b 06 00             	imul   eax,DWORD PTR [esi],0x0
    13ad:	00 05 30 37 00 00    	add    BYTE PTR ds:0x3730,al
    13b3:	00 10                	add    BYTE PTR [eax],dl
    13b5:	06                   	push   es
    13b6:	62 07                	bound  eax,QWORD PTR [edi]
    13b8:	00 00                	add    BYTE PTR [eax],al
    13ba:	05 31 1a 02 00       	add    eax,0x21a31
    13bf:	00 14 06             	add    BYTE PTR [esi+eax*1],dl
    13c2:	1a 06                	sbb    al,BYTE PTR [esi]
    13c4:	00 00                	add    BYTE PTR [eax],al
    13c6:	05 32 2d 01 00       	add    eax,0x12d32
    13cb:	00 18                	add    BYTE PTR [eax],bl
    13cd:	00 05 43 06 00 00    	add    BYTE PTR ds:0x643,al
    13d3:	14 05                	adc    al,0x5
    13d5:	3e 1a 02             	sbb    al,BYTE PTR ds:[edx]
    13d8:	00 00                	add    BYTE PTR [eax],al
    13da:	06                   	push   es
    13db:	96                   	xchg   esi,eax
    13dc:	06                   	push   es
    13dd:	00 00                	add    BYTE PTR [eax],al
    13df:	05 40 57 02 00       	add    eax,0x25740
    13e4:	00 00                	add    BYTE PTR [eax],al
    13e6:	06                   	push   es
    13e7:	33 07                	xor    eax,DWORD PTR [edi]
    13e9:	00 00                	add    BYTE PTR [eax],al
    13eb:	05 41 57 02 00       	add    eax,0x25741
    13f0:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    13f3:	cb                   	retf   
    13f4:	06                   	push   es
    13f5:	00 00                	add    BYTE PTR [eax],al
    13f7:	05 42 57 02 00       	add    eax,0x25742
    13fc:	00 08                	add    BYTE PTR [eax],cl
    13fe:	06                   	push   es
    13ff:	5e                   	pop    esi
    1400:	06                   	push   es
    1401:	00 00                	add    BYTE PTR [eax],al
    1403:	05 43 71 02 00       	add    eax,0x27143
    1408:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
    140b:	2a 06                	sub    al,BYTE PTR [esi]
    140d:	00 00                	add    BYTE PTR [eax],al
    140f:	05 44 9a 02 00       	add    eax,0x29a44
    1414:	00 10                	add    BYTE PTR [eax],dl
    1416:	00 07                	add    BYTE PTR [edi],al
    1418:	04 20                	add    al,0x20
    141a:	02 00                	add    al,BYTE PTR [eax]
    141c:	00 09                	add    BYTE PTR [ecx],cl
    141e:	d1 01                	rol    DWORD PTR [ecx],1
    1420:	00 00                	add    BYTE PTR [eax],al
    1422:	03 d9                	add    ebx,ecx
    1424:	06                   	push   es
    1425:	00 00                	add    BYTE PTR [eax],al
    1427:	05 35 64 01 00       	add    eax,0x16435
    142c:	00 07                	add    BYTE PTR [edi],al
    142e:	04 36                	add    al,0x36
    1430:	02 00                	add    al,BYTE PTR [eax]
    1432:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1435:	06                   	push   es
    1436:	58                   	pop    eax
    1437:	00 00                	add    BYTE PTR [eax],al
    1439:	00 07                	add    BYTE PTR [edi],al
    143b:	04 64                	add    al,0x64
    143d:	01 00                	add    DWORD PTR [eax],eax
    143f:	00 0a                	add    BYTE PTR [edx],cl
    1441:	25 00 00 00 57       	and    eax,0x57000000
    1446:	02 00                	add    al,BYTE PTR [eax]
    1448:	00 0b                	add    BYTE PTR [ebx],cl
    144a:	3d 02 00 00 0b       	cmp    eax,0xb000002
    144f:	27                   	daa    
    1450:	01 00                	add    DWORD PTR [eax],eax
    1452:	00 00                	add    BYTE PTR [eax],al
    1454:	07                   	pop    es
    1455:	04 43                	add    al,0x43
    1457:	02 00                	add    al,BYTE PTR [eax]
    1459:	00 0a                	add    BYTE PTR [edx],cl
    145b:	25 00 00 00 71       	and    eax,0x71000000
    1460:	02 00                	add    al,BYTE PTR [eax]
    1462:	00 0b                	add    BYTE PTR [ebx],cl
    1464:	3d 02 00 00 0b       	cmp    eax,0xb000002
    1469:	f6 00 00             	test   BYTE PTR [eax],0x0
    146c:	00 00                	add    BYTE PTR [eax],al
    146e:	07                   	pop    es
    146f:	04 5d                	add    al,0x5d
    1471:	02 00                	add    al,BYTE PTR [eax]
    1473:	00 0a                	add    BYTE PTR [edx],cl
    1475:	25 00 00 00 9a       	and    eax,0x9a000000
    147a:	02 00                	add    al,BYTE PTR [eax]
    147c:	00 0b                	add    BYTE PTR [ebx],cl
    147e:	3d 02 00 00 0b       	cmp    eax,0xb000002
    1483:	27                   	daa    
    1484:	01 00                	add    DWORD PTR [eax],eax
    1486:	00 0b                	add    BYTE PTR [ebx],cl
    1488:	3d 02 00 00 0b       	cmp    eax,0xb000002
    148d:	27                   	daa    
    148e:	01 00                	add    DWORD PTR [eax],eax
    1490:	00 0b                	add    BYTE PTR [ebx],cl
    1492:	37                   	aaa    
    1493:	00 00                	add    BYTE PTR [eax],al
    1495:	00 00                	add    BYTE PTR [eax],al
    1497:	07                   	pop    es
    1498:	04 77                	add    al,0x77
    149a:	02 00                	add    al,BYTE PTR [eax]
    149c:	00 03                	add    BYTE PTR [ebx],al
    149e:	f5                   	cmc    
    149f:	05 00 00 05 47       	add    eax,0x47050000
    14a4:	ab                   	stos   DWORD PTR es:[edi],eax
    14a5:	02 00                	add    al,BYTE PTR [eax]
    14a7:	00 05 c6 06 00 00    	add    BYTE PTR ds:0x6c6,al
    14ad:	10 05 4f dc 02 00    	adc    BYTE PTR ds:0x2dc4f,al
    14b3:	00 06                	add    BYTE PTR [esi],al
    14b5:	b0 06                	mov    al,0x6
    14b7:	00 00                	add    BYTE PTR [eax],al
    14b9:	05 51 30 02 00       	add    eax,0x23051
    14be:	00 00                	add    BYTE PTR [eax],al
    14c0:	06                   	push   es
    14c1:	fb                   	sti    
    14c2:	06                   	push   es
    14c3:	00 00                	add    BYTE PTR [eax],al
    14c5:	05 52 3d 02 00       	add    eax,0x23d52
    14ca:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    14cd:	25 06 00 00 05       	and    eax,0x5000006
    14d2:	53                   	push   ebx
    14d3:	dc 02                	fadd   QWORD PTR [edx]
    14d5:	00 00                	add    BYTE PTR [eax],al
    14d7:	08 00                	or     BYTE PTR [eax],al
    14d9:	05 49 07 00 00       	add    eax,0x749
    14de:	08 05 49 01 03 00    	or     BYTE PTR ds:0x30149,al
    14e4:	00 06                	add    BYTE PTR [esi],al
    14e6:	73 06                	jae    14ee <sysEnter_Vector-0x12eb12>
    14e8:	00 00                	add    BYTE PTR [eax],al
    14ea:	05 4b 2b 03 00       	add    eax,0x32b4b
    14ef:	00 00                	add    BYTE PTR [eax],al
    14f1:	06                   	push   es
    14f2:	e8 05 00 00 05       	call   50014fc <sysEnter_Vector+0x4ed14fc>
    14f7:	4c                   	dec    esp
    14f8:	5a                   	pop    edx
    14f9:	03 00                	add    eax,DWORD PTR [eax]
    14fb:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    14fe:	0a 2c 00             	or     ch,BYTE PTR [eax+eax*1]
    1501:	00 00                	add    BYTE PTR [eax],al
    1503:	1f                   	pop    ds
    1504:	03 00                	add    eax,DWORD PTR [eax]
    1506:	00 0b                	add    BYTE PTR [ebx],cl
    1508:	1f                   	pop    ds
    1509:	03 00                	add    eax,DWORD PTR [eax]
    150b:	00 0b                	add    BYTE PTR [ebx],cl
    150d:	30 02                	xor    BYTE PTR [edx],al
    150f:	00 00                	add    BYTE PTR [eax],al
    1511:	0b 2c 00             	or     ebp,DWORD PTR [eax+eax*1]
    1514:	00 00                	add    BYTE PTR [eax],al
    1516:	0b 25 03 00 00 00    	or     esp,DWORD PTR ds:0x3
    151c:	07                   	pop    es
    151d:	04 ab                	add    al,0xab
    151f:	02 00                	add    al,BYTE PTR [eax]
    1521:	00 07                	add    BYTE PTR [edi],al
    1523:	04 b3                	add    al,0xb3
    1525:	00 00                	add    BYTE PTR [eax],al
    1527:	00 07                	add    BYTE PTR [edi],al
    1529:	04 01                	add    al,0x1
    152b:	03 00                	add    eax,DWORD PTR [eax]
    152d:	00 0a                	add    BYTE PTR [edx],cl
    152f:	2c 00                	sub    al,0x0
    1531:	00 00                	add    BYTE PTR [eax],al
    1533:	4f                   	dec    edi
    1534:	03 00                	add    eax,DWORD PTR [eax]
    1536:	00 0b                	add    BYTE PTR [ebx],cl
    1538:	1f                   	pop    ds
    1539:	03 00                	add    eax,DWORD PTR [eax]
    153b:	00 0b                	add    BYTE PTR [ebx],cl
    153d:	4f                   	dec    edi
    153e:	03 00                	add    eax,DWORD PTR [eax]
    1540:	00 0b                	add    BYTE PTR [ebx],cl
    1542:	2c 00                	sub    al,0x0
    1544:	00 00                	add    BYTE PTR [eax],al
    1546:	0b 25 03 00 00 00    	or     esp,DWORD PTR ds:0x3
    154c:	07                   	pop    es
    154d:	04 55                	add    al,0x55
    154f:	03 00                	add    eax,DWORD PTR [eax]
    1551:	00 09                	add    BYTE PTR [ecx],cl
    1553:	36 02 00             	add    al,BYTE PTR ss:[eax]
    1556:	00 07                	add    BYTE PTR [edi],al
    1558:	04 31                	add    al,0x31
    155a:	03 00                	add    eax,DWORD PTR [eax]
    155c:	00 03                	add    BYTE PTR [ebx],al
    155e:	14 07                	adc    al,0x7
    1560:	00 00                	add    BYTE PTR [eax],al
    1562:	05 4d dc 02 00       	add    eax,0x2dc4d
    1567:	00 0c 8a             	add    BYTE PTR [edx+ecx*4],cl
    156a:	06                   	push   es
    156b:	00 00                	add    BYTE PTR [eax],al
    156d:	01 0f                	add    DWORD PTR [edi],ecx
    156f:	2c 00                	sub    al,0x0
    1571:	00 00                	add    BYTE PTR [eax],al
    1573:	84 0b                	test   BYTE PTR [ebx],cl
    1575:	00 30                	add    BYTE PTR [eax],dh
    1577:	2c 00                	sub    al,0x0
    1579:	00 00                	add    BYTE PTR [eax],al
    157b:	01 9c bd 03 00 00 0d 	add    DWORD PTR [ebp+edi*4+0xd000003],ebx
    1582:	3e                   	ds
    1583:	06                   	push   es
    1584:	00 00                	add    BYTE PTR [eax],al
    1586:	01 0f                	add    DWORD PTR [edi],ecx
    1588:	1f                   	pop    ds
    1589:	03 00                	add    eax,DWORD PTR [eax]
    158b:	00 02                	add    BYTE PTR [edx],al
    158d:	91                   	xchg   ecx,eax
    158e:	00 0d 06 02 00 00    	add    BYTE PTR ds:0x206,cl
    1594:	01 0f                	add    DWORD PTR [edi],ecx
    1596:	30 02                	xor    BYTE PTR [edx],al
    1598:	00 00                	add    BYTE PTR [eax],al
    159a:	02 91 04 0d 5f 05    	add    dl,BYTE PTR [ecx+0x55f0d04]
    15a0:	00 00                	add    BYTE PTR [eax],al
    15a2:	01 0f                	add    DWORD PTR [edi],ecx
    15a4:	2c 00                	sub    al,0x0
    15a6:	00 00                	add    BYTE PTR [eax],al
    15a8:	02 91 08 0d 59 07    	add    dl,BYTE PTR [ecx+0x7590d08]
    15ae:	00 00                	add    BYTE PTR [eax],al
    15b0:	01 0f                	add    DWORD PTR [edi],ecx
    15b2:	25 03 00 00 02       	and    eax,0x2000003
    15b7:	91                   	xchg   ecx,eax
    15b8:	0c 00                	or     al,0x0
    15ba:	0c 31                	or     al,0x31
    15bc:	06                   	push   es
    15bd:	00 00                	add    BYTE PTR [eax],al
    15bf:	01 14 2c             	add    DWORD PTR [esp+ebp*1],edx
    15c2:	00 00                	add    BYTE PTR [eax],al
    15c4:	00 b0 0b 00 30 26    	add    BYTE PTR [eax+0x2630000b],dh
    15ca:	00 00                	add    BYTE PTR [eax],al
    15cc:	00 01                	add    BYTE PTR [ecx],al
    15ce:	9c                   	pushf  
    15cf:	0f 04                	(bad)  
    15d1:	00 00                	add    BYTE PTR [eax],al
    15d3:	0d 3e 06 00 00       	or     eax,0x63e
    15d8:	01 14 1f             	add    DWORD PTR [edi+ebx*1],edx
    15db:	03 00                	add    eax,DWORD PTR [eax]
    15dd:	00 02                	add    BYTE PTR [edx],al
    15df:	91                   	xchg   ecx,eax
    15e0:	00 0d 06 02 00 00    	add    BYTE PTR ds:0x206,cl
    15e6:	01 14 4f             	add    DWORD PTR [edi+ecx*2],edx
    15e9:	03 00                	add    eax,DWORD PTR [eax]
    15eb:	00 02                	add    BYTE PTR [edx],al
    15ed:	91                   	xchg   ecx,eax
    15ee:	04 0d                	add    al,0xd
    15f0:	5f                   	pop    edi
    15f1:	05 00 00 01 14       	add    eax,0x14010000
    15f6:	2c 00                	sub    al,0x0
    15f8:	00 00                	add    BYTE PTR [eax],al
    15fa:	02 91 08 0d 59 07    	add    dl,BYTE PTR [ecx+0x7590d08]
    1600:	00 00                	add    BYTE PTR [eax],al
    1602:	01 14 25 03 00 00 02 	add    DWORD PTR [eiz*1+0x2000003],edx
    1609:	91                   	xchg   ecx,eax
    160a:	0c 00                	or     al,0x0
    160c:	0e                   	push   cs
    160d:	e1 06                	loope  1615 <sysEnter_Vector-0x12e9eb>
    160f:	00 00                	add    BYTE PTR [eax],al
    1611:	01 19                	add    DWORD PTR [ecx],ebx
    1613:	d6                   	(bad)  
    1614:	0b 00                	or     eax,DWORD PTR [eax]
    1616:	30 53 00             	xor    BYTE PTR [ebx+0x0],dl
    1619:	00 00                	add    BYTE PTR [eax],al
    161b:	01 9c 0f 25 06 00 00 	add    DWORD PTR [edi+ecx*1+0x625],ebx
    1622:	01 0b                	add    DWORD PTR [ebx],ecx
    1624:	60                   	pusha  
    1625:	03 00                	add    eax,DWORD PTR [eax]
    1627:	00 05 03 44 34 00    	add    BYTE PTR ds:0x344403,al
    162d:	30 0f                	xor    BYTE PTR [edi],cl
    162f:	26                   	es
    1630:	07                   	pop    es
    1631:	00 00                	add    BYTE PTR [eax],al
    1633:	01 0c 25 02 00 00 05 	add    DWORD PTR [eiz*1+0x5000002],ecx
    163a:	03 80 32 00 30 0f    	add    eax,DWORD PTR [eax+0xf300032]
    1640:	be 06 00 00 01       	mov    esi,0x1000006
    1645:	0d a0 02 00 00       	or     eax,0x2a0
    164a:	05 03 4c 34 00       	add    eax,0x344c03
    164f:	30 00                	xor    BYTE PTR [eax],al
    1651:	6b 01 00             	imul   eax,DWORD PTR [ecx],0x0
    1654:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1657:	cf                   	iret   
    1658:	07                   	pop    es
    1659:	00 00                	add    BYTE PTR [eax],al
    165b:	04 01                	add    al,0x1
    165d:	ef                   	out    dx,eax
    165e:	00 00                	add    BYTE PTR [eax],al
    1660:	00 0c 8d 07 00 00 6d 	add    BYTE PTR [ecx*4+0x6d000007],cl
    1667:	00 00                	add    BYTE PTR [eax],al
    1669:	00 2c 0c             	add    BYTE PTR [esp+ecx*1],ch
    166c:	00 30                	add    BYTE PTR [eax],dh
    166e:	ad                   	lods   eax,DWORD PTR ds:[esi]
    166f:	00 00                	add    BYTE PTR [eax],al
    1671:	00 0d 09 00 00 02    	add    BYTE PTR ds:0x2000009,cl
    1677:	01 06                	add    DWORD PTR [esi],eax
    1679:	58                   	pop    eax
    167a:	00 00                	add    BYTE PTR [eax],al
    167c:	00 02                	add    BYTE PTR [edx],al
    167e:	01 06                	add    DWORD PTR [esi],eax
    1680:	51                   	push   ecx
    1681:	00 00                	add    BYTE PTR [eax],al
    1683:	00 02                	add    BYTE PTR [edx],al
    1685:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    168b:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1692:	02 08                	add    cl,BYTE PTR [eax]
    1694:	05 00 00 00 00       	add    eax,0x0
    1699:	02 01                	add    al,BYTE PTR [ecx]
    169b:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    169e:	00 00                	add    BYTE PTR [eax],al
    16a0:	02 02                	add    al,BYTE PTR [edx]
    16a2:	07                   	pop    es
    16a3:	0e                   	push   cs
    16a4:	00 00                	add    BYTE PTR [eax],al
    16a6:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    16a9:	00 00                	add    BYTE PTR [eax],al
    16ab:	00 02                	add    BYTE PTR [edx],al
    16ad:	34 61                	xor    al,0x61
    16af:	00 00                	add    BYTE PTR [eax],al
    16b1:	00 02                	add    BYTE PTR [edx],al
    16b3:	04 07                	add    al,0x7
    16b5:	32 00                	xor    al,BYTE PTR [eax]
    16b7:	00 00                	add    BYTE PTR [eax],al
    16b9:	02 08                	add    cl,BYTE PTR [eax]
    16bb:	07                   	pop    es
    16bc:	28 00                	sub    BYTE PTR [eax],al
    16be:	00 00                	add    BYTE PTR [eax],al
    16c0:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    16c7:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    16ca:	96                   	xchg   esi,eax
    16cb:	00 00                	add    BYTE PTR [eax],al
    16cd:	00 02                	add    BYTE PTR [edx],al
    16cf:	01 02                	add    DWORD PTR [edx],eax
    16d1:	90                   	nop
    16d2:	00 00                	add    BYTE PTR [eax],al
    16d4:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    16db:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    16de:	00 00                	add    BYTE PTR [eax],al
    16e0:	05 04 95 00 00       	add    eax,0x9504
    16e5:	00 06                	add    BYTE PTR [esi],al
    16e7:	25 00 00 00 02       	and    eax,0x2000000
    16ec:	04 07                	add    al,0x7
    16ee:	2d 00 00 00 02       	sub    eax,0x2000000
    16f3:	04 07                	add    al,0x7
    16f5:	dc 00                	fadd   QWORD PTR [eax]
    16f7:	00 00                	add    BYTE PTR [eax],al
    16f9:	05 04 25 00 00       	add    eax,0x2504
    16fe:	00 07                	add    BYTE PTR [edi],al
    1700:	7a 07                	jp     1709 <sysEnter_Vector-0x12e8f7>
    1702:	00 00                	add    BYTE PTR [eax],al
    1704:	01 1d a8 00 00 00    	add    DWORD PTR ds:0xa8,ebx
    170a:	2c 0c                	sub    al,0xc
    170c:	00 30                	add    BYTE PTR [eax],dh
    170e:	3e 00 00             	add    BYTE PTR ds:[eax],al
    1711:	00 01                	add    BYTE PTR [ecx],al
    1713:	9c                   	pushf  
    1714:	e4 00                	in     al,0x0
    1716:	00 00                	add    BYTE PTR [eax],al
    1718:	08 ad 05 00 00 01    	or     BYTE PTR [ebp+0x1000005],ch
    171e:	1d a8 00 00 00       	sbb    eax,0xa8
    1723:	02 91 00 09 73 72    	add    dl,BYTE PTR [ecx+0x72730900]
    1729:	63 00                	arpl   WORD PTR [eax],ax
    172b:	01 1d 8f 00 00 00    	add    DWORD PTR ds:0x8f,ebx
    1731:	02 91 04 00 0a 81    	add    dl,BYTE PTR [ecx-0x7ef5fffc]
    1737:	07                   	pop    es
    1738:	00 00                	add    BYTE PTR [eax],al
    173a:	01 23                	add    DWORD PTR [ebx],esp
    173c:	6a 0c                	push   0xc
    173e:	00 30                	add    BYTE PTR [eax],dh
    1740:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1741:	00 00                	add    BYTE PTR [eax],al
    1743:	00 01                	add    BYTE PTR [ecx],al
    1745:	9c                   	pushf  
    1746:	2a 01                	sub    al,BYTE PTR [ecx]
    1748:	00 00                	add    BYTE PTR [eax],al
    174a:	09 70 00             	or     DWORD PTR [eax+0x0],esi
    174d:	01 23                	add    DWORD PTR [ebx],esp
    174f:	a8 00                	test   al,0x0
    1751:	00 00                	add    BYTE PTR [eax],al
    1753:	02 91 00 09 71 00    	add    dl,BYTE PTR [ecx+0x710900]
    1759:	01 23                	add    DWORD PTR [ebx],esp
    175b:	a8 00                	test   al,0x0
    175d:	00 00                	add    BYTE PTR [eax],al
    175f:	02 91 04 0b 63 00    	add    dl,BYTE PTR [ecx+0x630b04]
    1765:	01 24 3a             	add    DWORD PTR [edx+edi*1],esp
    1768:	00 00                	add    BYTE PTR [eax],al
    176a:	00 02                	add    BYTE PTR [edx],al
    176c:	91                   	xchg   ecx,eax
    176d:	74 0b                	je     177a <sysEnter_Vector-0x12e886>
    176f:	64 00 01             	add    BYTE PTR fs:[ecx],al
    1772:	24 3a                	and    al,0x3a
    1774:	00 00                	add    BYTE PTR [eax],al
    1776:	00 02                	add    BYTE PTR [edx],al
    1778:	91                   	xchg   ecx,eax
    1779:	70 00                	jo     177b <sysEnter_Vector-0x12e885>
    177b:	0c 3f                	or     al,0x3f
    177d:	00 00                	add    BYTE PTR [eax],al
    177f:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    1782:	56                   	push   esi
    1783:	00 00                	add    BYTE PTR [eax],al
    1785:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
    178b:	30 0c aa             	xor    BYTE PTR [edx+ebp*4],cl
    178e:	00 00                	add    BYTE PTR [eax],al
    1790:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1793:	56                   	push   esi
    1794:	00 00                	add    BYTE PTR [eax],al
    1796:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
    179c:	30 0c 56             	xor    BYTE PTR [esi+edx*2],cl
    179f:	01 00                	add    DWORD PTR [eax],eax
    17a1:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    17a8:	05 03 30 34 00       	add    eax,0x343003
    17ad:	30 0c 48             	xor    BYTE PTR [eax+ecx*2],cl
    17b0:	00 00                	add    BYTE PTR [eax],al
    17b2:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    17b8:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
    17be:	30 00                	xor    BYTE PTR [eax],al
    17c0:	5a                   	pop    edx
    17c1:	01 00                	add    DWORD PTR [eax],eax
    17c3:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    17c6:	8a 08                	mov    cl,BYTE PTR [eax]
    17c8:	00 00                	add    BYTE PTR [eax],al
    17ca:	04 01                	add    al,0x1
    17cc:	ef                   	out    dx,eax
    17cd:	00 00                	add    BYTE PTR [eax],al
    17cf:	00 0c a9             	add    BYTE PTR [ecx+ebp*4],cl
    17d2:	07                   	pop    es
    17d3:	00 00                	add    BYTE PTR [eax],al
    17d5:	6d                   	ins    DWORD PTR es:[edi],dx
    17d6:	00 00                	add    BYTE PTR [eax],al
    17d8:	00 dc                	add    ah,bl
    17da:	0c 00                	or     al,0x0
    17dc:	30 5e 00             	xor    BYTE PTR [esi+0x0],bl
    17df:	00 00                	add    BYTE PTR [eax],al
    17e1:	e0 09                	loopne 17ec <sysEnter_Vector-0x12e814>
    17e3:	00 00                	add    BYTE PTR [eax],al
    17e5:	02 01                	add    al,BYTE PTR [ecx]
    17e7:	06                   	push   es
    17e8:	58                   	pop    eax
    17e9:	00 00                	add    BYTE PTR [eax],al
    17eb:	00 02                	add    BYTE PTR [edx],al
    17ed:	01 06                	add    DWORD PTR [esi],eax
    17ef:	51                   	push   ecx
    17f0:	00 00                	add    BYTE PTR [eax],al
    17f2:	00 02                	add    BYTE PTR [edx],al
    17f4:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    17fa:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1801:	02 08                	add    cl,BYTE PTR [eax]
    1803:	05 00 00 00 00       	add    eax,0x0
    1808:	02 01                	add    al,BYTE PTR [ecx]
    180a:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    180d:	00 00                	add    BYTE PTR [eax],al
    180f:	02 02                	add    al,BYTE PTR [edx]
    1811:	07                   	pop    es
    1812:	0e                   	push   cs
    1813:	00 00                	add    BYTE PTR [eax],al
    1815:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1818:	00 00                	add    BYTE PTR [eax],al
    181a:	00 02                	add    BYTE PTR [edx],al
    181c:	34 61                	xor    al,0x61
    181e:	00 00                	add    BYTE PTR [eax],al
    1820:	00 02                	add    BYTE PTR [edx],al
    1822:	04 07                	add    al,0x7
    1824:	32 00                	xor    al,BYTE PTR [eax]
    1826:	00 00                	add    BYTE PTR [eax],al
    1828:	02 08                	add    cl,BYTE PTR [eax]
    182a:	07                   	pop    es
    182b:	28 00                	sub    BYTE PTR [eax],al
    182d:	00 00                	add    BYTE PTR [eax],al
    182f:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1836:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1839:	96                   	xchg   esi,eax
    183a:	00 00                	add    BYTE PTR [eax],al
    183c:	00 02                	add    BYTE PTR [edx],al
    183e:	01 02                	add    DWORD PTR [edx],eax
    1840:	90                   	nop
    1841:	00 00                	add    BYTE PTR [eax],al
    1843:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    184a:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    184d:	00 00                	add    BYTE PTR [eax],al
    184f:	05 04 95 00 00       	add    eax,0x9504
    1854:	00 06                	add    BYTE PTR [esi],al
    1856:	25 00 00 00 02       	and    eax,0x2000000
    185b:	04 07                	add    al,0x7
    185d:	2d 00 00 00 02       	sub    eax,0x2000000
    1862:	04 07                	add    al,0x7
    1864:	dc 00                	fadd   QWORD PTR [eax]
    1866:	00 00                	add    BYTE PTR [eax],al
    1868:	07                   	pop    es
    1869:	a2 07 00 00 01       	mov    ds:0x1000007,al
    186e:	18 3a                	sbb    BYTE PTR [edx],bh
    1870:	00 00                	add    BYTE PTR [eax],al
    1872:	00 dc                	add    ah,bl
    1874:	0c 00                	or     al,0x0
    1876:	30 5e 00             	xor    BYTE PTR [esi+0x0],bl
    1879:	00 00                	add    BYTE PTR [eax],al
    187b:	01 9c 0e 01 00 00 08 	add    DWORD PTR [esi+ecx*1+0x8000001],ebx
    1882:	70 31                	jo     18b5 <sysEnter_Vector-0x12e74b>
    1884:	00 01                	add    BYTE PTR [ecx],al
    1886:	18 8f 00 00 00 02    	sbb    BYTE PTR [edi+0x2000000],cl
    188c:	91                   	xchg   ecx,eax
    188d:	00 08                	add    BYTE PTR [eax],cl
    188f:	70 32                	jo     18c3 <sysEnter_Vector-0x12e73d>
    1891:	00 01                	add    BYTE PTR [ecx],al
    1893:	18 8f 00 00 00 02    	sbb    BYTE PTR [edi+0x2000000],cl
    1899:	91                   	xchg   ecx,eax
    189a:	04 09                	add    al,0x9
    189c:	73 31                	jae    18cf <sysEnter_Vector-0x12e731>
    189e:	00 01                	add    BYTE PTR [ecx],al
    18a0:	1a 0e                	sbb    cl,BYTE PTR [esi]
    18a2:	01 00                	add    DWORD PTR [eax],eax
    18a4:	00 01                	add    BYTE PTR [ecx],al
    18a6:	53                   	push   ebx
    18a7:	09 73 32             	or     DWORD PTR [ebx+0x32],esi
    18aa:	00 01                	add    BYTE PTR [ecx],al
    18ac:	1b 0e                	sbb    ecx,DWORD PTR [esi]
    18ae:	01 00                	add    DWORD PTR [eax],eax
    18b0:	00 01                	add    BYTE PTR [ecx],al
    18b2:	56                   	push   esi
    18b3:	09 63 31             	or     DWORD PTR [ebx+0x31],esp
    18b6:	00 01                	add    BYTE PTR [ecx],al
    18b8:	1c 48                	sbb    al,0x48
    18ba:	00 00                	add    BYTE PTR [eax],al
    18bc:	00 02                	add    BYTE PTR [edx],al
    18be:	91                   	xchg   ecx,eax
    18bf:	6f                   	outs   dx,DWORD PTR ds:[esi]
    18c0:	09 63 32             	or     DWORD PTR [ebx+0x32],esp
    18c3:	00 01                	add    BYTE PTR [ecx],al
    18c5:	1c 48                	sbb    al,0x48
    18c7:	00 00                	add    BYTE PTR [eax],al
    18c9:	00 02                	add    BYTE PTR [edx],al
    18cb:	91                   	xchg   ecx,eax
    18cc:	6e                   	outs   dx,BYTE PTR ds:[esi]
    18cd:	00 05 04 14 01 00    	add    BYTE PTR ds:0x11404,al
    18d3:	00 06                	add    BYTE PTR [esi],al
    18d5:	48                   	dec    eax
    18d6:	00 00                	add    BYTE PTR [eax],al
    18d8:	00 0a                	add    BYTE PTR [edx],cl
    18da:	3f                   	aas    
    18db:	00 00                	add    BYTE PTR [eax],al
    18dd:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    18e0:	56                   	push   esi
    18e1:	00 00                	add    BYTE PTR [eax],al
    18e3:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
    18e9:	30 0a                	xor    BYTE PTR [edx],cl
    18eb:	aa                   	stos   BYTE PTR es:[edi],al
    18ec:	00 00                	add    BYTE PTR [eax],al
    18ee:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    18f1:	56                   	push   esi
    18f2:	00 00                	add    BYTE PTR [eax],al
    18f4:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
    18fa:	30 0a                	xor    BYTE PTR [edx],cl
    18fc:	56                   	push   esi
    18fd:	01 00                	add    DWORD PTR [eax],eax
    18ff:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    1906:	05 03 30 34 00       	add    eax,0x343003
    190b:	30 0a                	xor    BYTE PTR [edx],cl
    190d:	48                   	dec    eax
    190e:	00 00                	add    BYTE PTR [eax],al
    1910:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    1916:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
    191c:	30 00                	xor    BYTE PTR [eax],al
    191e:	7d 01                	jge    1921 <sysEnter_Vector-0x12e6df>
    1920:	00 00                	add    BYTE PTR [eax],al
    1922:	04 00                	add    al,0x0
    1924:	1c 09                	sbb    al,0x9
    1926:	00 00                	add    BYTE PTR [eax],al
    1928:	04 01                	add    al,0x1
    192a:	ef                   	out    dx,eax
    192b:	00 00                	add    BYTE PTR [eax],al
    192d:	00 0c d3             	add    BYTE PTR [ebx+edx*8],cl
    1930:	07                   	pop    es
    1931:	00 00                	add    BYTE PTR [eax],al
    1933:	6d                   	ins    DWORD PTR es:[edi],dx
    1934:	00 00                	add    BYTE PTR [eax],al
    1936:	00 3c 0d 00 30 87 00 	add    BYTE PTR [ecx*1+0x873000],bh
    193d:	00 00                	add    BYTE PTR [eax],al
    193f:	a9 0a 00 00 02       	test   eax,0x200000a
    1944:	01 06                	add    DWORD PTR [esi],eax
    1946:	58                   	pop    eax
    1947:	00 00                	add    BYTE PTR [eax],al
    1949:	00 02                	add    BYTE PTR [edx],al
    194b:	01 06                	add    DWORD PTR [esi],eax
    194d:	51                   	push   ecx
    194e:	00 00                	add    BYTE PTR [eax],al
    1950:	00 02                	add    BYTE PTR [edx],al
    1952:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1958:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    195f:	02 08                	add    cl,BYTE PTR [eax]
    1961:	05 00 00 00 00       	add    eax,0x0
    1966:	02 01                	add    al,BYTE PTR [ecx]
    1968:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    196b:	00 00                	add    BYTE PTR [eax],al
    196d:	02 02                	add    al,BYTE PTR [edx]
    196f:	07                   	pop    es
    1970:	0e                   	push   cs
    1971:	00 00                	add    BYTE PTR [eax],al
    1973:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1976:	00 00                	add    BYTE PTR [eax],al
    1978:	00 02                	add    BYTE PTR [edx],al
    197a:	34 61                	xor    al,0x61
    197c:	00 00                	add    BYTE PTR [eax],al
    197e:	00 02                	add    BYTE PTR [edx],al
    1980:	04 07                	add    al,0x7
    1982:	32 00                	xor    al,BYTE PTR [eax]
    1984:	00 00                	add    BYTE PTR [eax],al
    1986:	02 08                	add    cl,BYTE PTR [eax]
    1988:	07                   	pop    es
    1989:	28 00                	sub    BYTE PTR [eax],al
    198b:	00 00                	add    BYTE PTR [eax],al
    198d:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1994:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1997:	96                   	xchg   esi,eax
    1998:	00 00                	add    BYTE PTR [eax],al
    199a:	00 02                	add    BYTE PTR [edx],al
    199c:	01 02                	add    DWORD PTR [edx],eax
    199e:	90                   	nop
    199f:	00 00                	add    BYTE PTR [eax],al
    19a1:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    19a8:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    19ab:	00 00                	add    BYTE PTR [eax],al
    19ad:	05 04 95 00 00       	add    eax,0x9504
    19b2:	00 06                	add    BYTE PTR [esi],al
    19b4:	25 00 00 00 02       	and    eax,0x2000000
    19b9:	04 07                	add    al,0x7
    19bb:	2d 00 00 00 02       	sub    eax,0x2000000
    19c0:	04 07                	add    al,0x7
    19c2:	dc 00                	fadd   QWORD PTR [eax]
    19c4:	00 00                	add    BYTE PTR [eax],al
    19c6:	05 04 25 00 00       	add    eax,0x2504
    19cb:	00 07                	add    BYTE PTR [edi],al
    19cd:	be 07 00 00 01       	mov    esi,0x1000007
    19d2:	04 a8                	add    al,0xa8
    19d4:	00 00                	add    BYTE PTR [eax],al
    19d6:	00 3c 0d 00 30 40 00 	add    BYTE PTR [ecx*1+0x403000],bh
    19dd:	00 00                	add    BYTE PTR [eax],al
    19df:	01 9c ee 00 00 00 08 	add    DWORD PTR [esi+ebp*8+0x8000000],ebx
    19e6:	73 31                	jae    1a19 <sysEnter_Vector-0x12e5e7>
    19e8:	00 01                	add    BYTE PTR [ecx],al
    19ea:	04 a8                	add    al,0xa8
    19ec:	00 00                	add    BYTE PTR [eax],al
    19ee:	00 02                	add    BYTE PTR [edx],al
    19f0:	91                   	xchg   ecx,eax
    19f1:	00 08                	add    BYTE PTR [eax],cl
    19f3:	73 32                	jae    1a27 <sysEnter_Vector-0x12e5d9>
    19f5:	00 01                	add    BYTE PTR [ecx],al
    19f7:	04 8f                	add    al,0x8f
    19f9:	00 00                	add    BYTE PTR [eax],al
    19fb:	00 02                	add    BYTE PTR [edx],al
    19fd:	91                   	xchg   ecx,eax
    19fe:	04 09                	add    al,0x9
    1a00:	73 00                	jae    1a02 <sysEnter_Vector-0x12e5fe>
    1a02:	01 06                	add    DWORD PTR [esi],eax
    1a04:	a8 00                	test   al,0x0
    1a06:	00 00                	add    BYTE PTR [eax],al
    1a08:	02 91 74 00 07 cb    	add    dl,BYTE PTR [ecx-0x34f8ff8c]
    1a0e:	07                   	pop    es
    1a0f:	00 00                	add    BYTE PTR [eax],al
    1a11:	01 0e                	add    DWORD PTR [esi],ecx
    1a13:	a8 00                	test   al,0x0
    1a15:	00 00                	add    BYTE PTR [eax],al
    1a17:	7c 0d                	jl     1a26 <sysEnter_Vector-0x12e5da>
    1a19:	00 30                	add    BYTE PTR [eax],dh
    1a1b:	47                   	inc    edi
    1a1c:	00 00                	add    BYTE PTR [eax],al
    1a1e:	00 01                	add    BYTE PTR [ecx],al
    1a20:	9c                   	pushf  
    1a21:	3c 01                	cmp    al,0x1
    1a23:	00 00                	add    BYTE PTR [eax],al
    1a25:	08 73 31             	or     BYTE PTR [ebx+0x31],dh
    1a28:	00 01                	add    BYTE PTR [ecx],al
    1a2a:	0e                   	push   cs
    1a2b:	a8 00                	test   al,0x0
    1a2d:	00 00                	add    BYTE PTR [eax],al
    1a2f:	02 91 00 08 73 32    	add    dl,BYTE PTR [ecx+0x32730800]
    1a35:	00 01                	add    BYTE PTR [ecx],al
    1a37:	0e                   	push   cs
    1a38:	8f 00                	pop    DWORD PTR [eax]
    1a3a:	00 00                	add    BYTE PTR [eax],al
    1a3c:	02 91 04 0a c5 07    	add    dl,BYTE PTR [ecx+0x7c50a04]
    1a42:	00 00                	add    BYTE PTR [eax],al
    1a44:	01 0e                	add    DWORD PTR [esi],ecx
    1a46:	61                   	popa   
    1a47:	00 00                	add    BYTE PTR [eax],al
    1a49:	00 02                	add    BYTE PTR [edx],al
    1a4b:	91                   	xchg   ecx,eax
    1a4c:	08 09                	or     BYTE PTR [ecx],cl
    1a4e:	73 00                	jae    1a50 <sysEnter_Vector-0x12e5b0>
    1a50:	01 10                	add    DWORD PTR [eax],edx
    1a52:	a8 00                	test   al,0x0
    1a54:	00 00                	add    BYTE PTR [eax],al
    1a56:	02 91 74 00 0b 3f    	add    dl,BYTE PTR [ecx+0x3f0b0074]
    1a5c:	00 00                	add    BYTE PTR [eax],al
    1a5e:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    1a61:	56                   	push   esi
    1a62:	00 00                	add    BYTE PTR [eax],al
    1a64:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
    1a6a:	30 0b                	xor    BYTE PTR [ebx],cl
    1a6c:	aa                   	stos   BYTE PTR es:[edi],al
    1a6d:	00 00                	add    BYTE PTR [eax],al
    1a6f:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1a72:	56                   	push   esi
    1a73:	00 00                	add    BYTE PTR [eax],al
    1a75:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
    1a7b:	30 0b                	xor    BYTE PTR [ebx],cl
    1a7d:	56                   	push   esi
    1a7e:	01 00                	add    DWORD PTR [eax],eax
    1a80:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    1a87:	05 03 30 34 00       	add    eax,0x343003
    1a8c:	30 0b                	xor    BYTE PTR [ebx],cl
    1a8e:	48                   	dec    eax
    1a8f:	00 00                	add    BYTE PTR [eax],al
    1a91:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    1a97:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
    1a9d:	30 00                	xor    BYTE PTR [eax],al
    1a9f:	98                   	cwde   
    1aa0:	00 00                	add    BYTE PTR [eax],al
    1aa2:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1aa5:	bd 09 00 00 04       	mov    ebp,0x4000009
    1aaa:	01 ef                	add    edi,ebp
    1aac:	00 00                	add    BYTE PTR [eax],al
    1aae:	00 0c ef             	add    BYTE PTR [edi+ebp*8],cl
    1ab1:	07                   	pop    es
    1ab2:	00 00                	add    BYTE PTR [eax],al
    1ab4:	6d                   	ins    DWORD PTR es:[edi],dx
    1ab5:	00 00                	add    BYTE PTR [eax],al
    1ab7:	00 c4                	add    ah,al
    1ab9:	0d 00 30 31 00       	or     eax,0x313000
    1abe:	00 00                	add    BYTE PTR [eax],al
    1ac0:	85 0b                	test   DWORD PTR [ebx],ecx
    1ac2:	00 00                	add    BYTE PTR [eax],al
    1ac4:	02 04 05 69 6e 74 00 	add    al,BYTE PTR [eax*1+0x746e69]
    1acb:	03 02                	add    eax,DWORD PTR [edx]
    1acd:	05 00 00 02 d8       	add    eax,0xd8020000
    1ad2:	37                   	aaa    
    1ad3:	00 00                	add    BYTE PTR [eax],al
    1ad5:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    1ad8:	07                   	pop    es
    1ad9:	32 00                	xor    al,BYTE PTR [eax]
    1adb:	00 00                	add    BYTE PTR [eax],al
    1add:	04 04                	add    al,0x4
    1adf:	05 05 00 00 00       	add    eax,0x5
    1ae4:	04 08                	add    al,0x8
    1ae6:	05 00 00 00 00       	add    eax,0x0
    1aeb:	04 0c                	add    al,0xc
    1aed:	04 96                	add    al,0x96
    1aef:	00 00                	add    BYTE PTR [eax],al
    1af1:	00 05 e8 07 00 00    	add    BYTE PTR ds:0x7e8,al
    1af7:	01 03                	add    DWORD PTR [ebx],eax
    1af9:	2c 00                	sub    al,0x0
    1afb:	00 00                	add    BYTE PTR [eax],al
    1afd:	c4 0d 00 30 31 00    	les    ecx,FWORD PTR ds:0x313000
    1b03:	00 00                	add    BYTE PTR [eax],al
    1b05:	01 9c 89 00 00 00 06 	add    DWORD PTR [ecx+ecx*4+0x6000000],ebx
    1b0c:	73 74                	jae    1b82 <sysEnter_Vector-0x12e47e>
    1b0e:	72 00                	jb     1b10 <sysEnter_Vector-0x12e4f0>
    1b10:	01 03                	add    DWORD PTR [ebx],eax
    1b12:	89 00                	mov    DWORD PTR [eax],eax
    1b14:	00 00                	add    BYTE PTR [eax],al
    1b16:	02 91 00 07 72 65    	add    dl,BYTE PTR [ecx+0x65720700]
    1b1c:	74 00                	je     1b1e <sysEnter_Vector-0x12e4e2>
    1b1e:	01 04 2c             	add    DWORD PTR [esp+ebp*1],eax
    1b21:	00 00                	add    BYTE PTR [eax],al
    1b23:	00 02                	add    BYTE PTR [edx],al
    1b25:	91                   	xchg   ecx,eax
    1b26:	74 00                	je     1b28 <sysEnter_Vector-0x12e4d8>
    1b28:	08 04 96             	or     BYTE PTR [esi+edx*4],al
    1b2b:	00 00                	add    BYTE PTR [eax],al
    1b2d:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1b30:	06                   	push   es
    1b31:	58                   	pop    eax
    1b32:	00 00                	add    BYTE PTR [eax],al
    1b34:	00 09                	add    BYTE PTR [ecx],cl
    1b36:	8f 00                	pop    DWORD PTR [eax]
    1b38:	00 00                	add    BYTE PTR [eax],al
    1b3a:	00 a2 00 00 00 04    	add    BYTE PTR [edx+0x4000000],ah
    1b40:	00 3e                	add    BYTE PTR [esi],bh
    1b42:	0a 00                	or     al,BYTE PTR [eax]
    1b44:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1b47:	ef                   	out    dx,eax
    1b48:	00 00                	add    BYTE PTR [eax],al
    1b4a:	00 0c 0c             	add    BYTE PTR [esp+ecx*1],cl
    1b4d:	08 00                	or     BYTE PTR [eax],al
    1b4f:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1b52:	00 00                	add    BYTE PTR [eax],al
    1b54:	f8                   	clc    
    1b55:	0d 00 30 67 00       	or     eax,0x673000
    1b5a:	00 00                	add    BYTE PTR [eax],al
    1b5c:	16                   	push   ss
    1b5d:	0c 00                	or     al,0x0
    1b5f:	00 02                	add    BYTE PTR [edx],al
    1b61:	04 05                	add    al,0x5
    1b63:	69 6e 74 00 03 02 05 	imul   ebp,DWORD PTR [esi+0x74],0x5020300
    1b6a:	00 00                	add    BYTE PTR [eax],al
    1b6c:	02 d8                	add    bl,al
    1b6e:	37                   	aaa    
    1b6f:	00 00                	add    BYTE PTR [eax],al
    1b71:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    1b74:	07                   	pop    es
    1b75:	32 00                	xor    al,BYTE PTR [eax]
    1b77:	00 00                	add    BYTE PTR [eax],al
    1b79:	04 04                	add    al,0x4
    1b7b:	05 05 00 00 00       	add    eax,0x5
    1b80:	04 08                	add    al,0x8
    1b82:	05 00 00 00 00       	add    eax,0x0
    1b87:	04 0c                	add    al,0xc
    1b89:	04 96                	add    al,0x96
    1b8b:	00 00                	add    BYTE PTR [eax],al
    1b8d:	00 05 04 08 00 00    	add    BYTE PTR ds:0x804,al
    1b93:	01 0c 25 00 00 00 f8 	add    DWORD PTR [eiz*1-0x8000000],ecx
    1b9a:	0d 00 30 67 00       	or     eax,0x673000
    1b9f:	00 00                	add    BYTE PTR [eax],al
    1ba1:	01 9c 93 00 00 00 06 	add    DWORD PTR [ebx+edx*4+0x6000000],ebx
    1ba8:	73 31                	jae    1bdb <sysEnter_Vector-0x12e425>
    1baa:	00 01                	add    BYTE PTR [ecx],al
    1bac:	0c 93                	or     al,0x93
    1bae:	00 00                	add    BYTE PTR [eax],al
    1bb0:	00 02                	add    BYTE PTR [edx],al
    1bb2:	91                   	xchg   ecx,eax
    1bb3:	00 06                	add    BYTE PTR [esi],al
    1bb5:	73 32                	jae    1be9 <sysEnter_Vector-0x12e417>
    1bb7:	00 01                	add    BYTE PTR [ecx],al
    1bb9:	0c 93                	or     al,0x93
    1bbb:	00 00                	add    BYTE PTR [eax],al
    1bbd:	00 02                	add    BYTE PTR [edx],al
    1bbf:	91                   	xchg   ecx,eax
    1bc0:	04 06                	add    al,0x6
    1bc2:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1bc3:	00 01                	add    BYTE PTR [ecx],al
    1bc5:	0c 2c                	or     al,0x2c
    1bc7:	00 00                	add    BYTE PTR [eax],al
    1bc9:	00 02                	add    BYTE PTR [edx],al
    1bcb:	91                   	xchg   ecx,eax
    1bcc:	08 00                	or     BYTE PTR [eax],al
    1bce:	07                   	pop    es
    1bcf:	04 a0                	add    al,0xa0
    1bd1:	00 00                	add    BYTE PTR [eax],al
    1bd3:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1bd6:	06                   	push   es
    1bd7:	58                   	pop    eax
    1bd8:	00 00                	add    BYTE PTR [eax],al
    1bda:	00 08                	add    BYTE PTR [eax],cl
    1bdc:	99                   	cdq    
    1bdd:	00 00                	add    BYTE PTR [eax],al
    1bdf:	00 00                	add    BYTE PTR [eax],al
    1be1:	b4 00                	mov    ah,0x0
    1be3:	00 00                	add    BYTE PTR [eax],al
    1be5:	04 00                	add    al,0x0
    1be7:	b0 0a                	mov    al,0xa
    1be9:	00 00                	add    BYTE PTR [eax],al
    1beb:	04 01                	add    al,0x1
    1bed:	ef                   	out    dx,eax
    1bee:	00 00                	add    BYTE PTR [eax],al
    1bf0:	00 0c 22             	add    BYTE PTR [edx+eiz*1],cl
    1bf3:	08 00                	or     BYTE PTR [eax],al
    1bf5:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1bf8:	00 00                	add    BYTE PTR [eax],al
    1bfa:	60                   	pusha  
    1bfb:	0e                   	push   cs
    1bfc:	00 30                	add    BYTE PTR [eax],dh
    1bfe:	60                   	pusha  
    1bff:	00 00                	add    BYTE PTR [eax],al
    1c01:	00 bf 0c 00 00 02    	add    BYTE PTR [edi+0x200000c],bh
    1c07:	04 05                	add    al,0x5
    1c09:	69 6e 74 00 03 02 05 	imul   ebp,DWORD PTR [esi+0x74],0x5020300
    1c10:	00 00                	add    BYTE PTR [eax],al
    1c12:	02 d8                	add    bl,al
    1c14:	37                   	aaa    
    1c15:	00 00                	add    BYTE PTR [eax],al
    1c17:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    1c1a:	07                   	pop    es
    1c1b:	32 00                	xor    al,BYTE PTR [eax]
    1c1d:	00 00                	add    BYTE PTR [eax],al
    1c1f:	04 04                	add    al,0x4
    1c21:	05 05 00 00 00       	add    eax,0x5
    1c26:	04 08                	add    al,0x8
    1c28:	05 00 00 00 00       	add    eax,0x0
    1c2d:	04 0c                	add    al,0xc
    1c2f:	04 96                	add    al,0x96
    1c31:	00 00                	add    BYTE PTR [eax],al
    1c33:	00 05 38 08 00 00    	add    BYTE PTR ds:0x838,al
    1c39:	01 0d 9f 00 00 00    	add    DWORD PTR ds:0x9f,ecx
    1c3f:	60                   	pusha  
    1c40:	0e                   	push   cs
    1c41:	00 30                	add    BYTE PTR [eax],dh
    1c43:	60                   	pusha  
    1c44:	00 00                	add    BYTE PTR [eax],al
    1c46:	00 01                	add    BYTE PTR [ecx],al
    1c48:	9c                   	pushf  
    1c49:	9f                   	lahf   
    1c4a:	00 00                	add    BYTE PTR [eax],al
    1c4c:	00 06                	add    BYTE PTR [esi],al
    1c4e:	73 31                	jae    1c81 <sysEnter_Vector-0x12e37f>
    1c50:	00 01                	add    BYTE PTR [ecx],al
    1c52:	0d 9f 00 00 00       	or     eax,0x9f
    1c57:	02 91 00 06 73 32    	add    dl,BYTE PTR [ecx+0x32730600]
    1c5d:	00 01                	add    BYTE PTR [ecx],al
    1c5f:	0d ac 00 00 00       	or     eax,0xac
    1c64:	02 91 04 06 6e 00    	add    dl,BYTE PTR [ecx+0x6e0604]
    1c6a:	01 0d 2c 00 00 00    	add    DWORD PTR ds:0x2c,ecx
    1c70:	02 91 08 07 73 00    	add    dl,BYTE PTR [ecx+0x730708]
    1c76:	01 0f                	add    DWORD PTR [edi],ecx
    1c78:	9f                   	lahf   
    1c79:	00 00                	add    BYTE PTR [eax],al
    1c7b:	00 02                	add    BYTE PTR [edx],al
    1c7d:	91                   	xchg   ecx,eax
    1c7e:	74 00                	je     1c80 <sysEnter_Vector-0x12e380>
    1c80:	08 04 a5 00 00 00 04 	or     BYTE PTR [eiz*4+0x4000000],al
    1c87:	01 06                	add    DWORD PTR [esi],eax
    1c89:	58                   	pop    eax
    1c8a:	00 00                	add    BYTE PTR [eax],al
    1c8c:	00 08                	add    BYTE PTR [eax],cl
    1c8e:	04 b2                	add    al,0xb2
    1c90:	00 00                	add    BYTE PTR [eax],al
    1c92:	00 09                	add    BYTE PTR [ecx],cl
    1c94:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
    1c95:	00 00                	add    BYTE PTR [eax],al
    1c97:	00 00                	add    BYTE PTR [eax],al
    1c99:	8c 01                	mov    WORD PTR [ecx],es
    1c9b:	00 00                	add    BYTE PTR [eax],al
    1c9d:	04 00                	add    al,0x0
    1c9f:	31 0b                	xor    DWORD PTR [ebx],ecx
    1ca1:	00 00                	add    BYTE PTR [eax],al
    1ca3:	04 01                	add    al,0x1
    1ca5:	ef                   	out    dx,eax
    1ca6:	00 00                	add    BYTE PTR [eax],al
    1ca8:	00 0c 40             	add    BYTE PTR [eax+eax*2],cl
    1cab:	08 00                	or     BYTE PTR [eax],al
    1cad:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1cb0:	00 00                	add    BYTE PTR [eax],al
    1cb2:	c0 0e 00             	ror    BYTE PTR [esi],0x0
    1cb5:	30 7d 01             	xor    BYTE PTR [ebp+0x1],bh
    1cb8:	00 00                	add    BYTE PTR [eax],al
    1cba:	60                   	pusha  
    1cbb:	0d 00 00 02 01       	or     eax,0x1020000
    1cc0:	06                   	push   es
    1cc1:	58                   	pop    eax
    1cc2:	00 00                	add    BYTE PTR [eax],al
    1cc4:	00 02                	add    BYTE PTR [edx],al
    1cc6:	01 06                	add    DWORD PTR [esi],eax
    1cc8:	51                   	push   ecx
    1cc9:	00 00                	add    BYTE PTR [eax],al
    1ccb:	00 02                	add    BYTE PTR [edx],al
    1ccd:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1cd3:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1cda:	02 08                	add    cl,BYTE PTR [eax]
    1cdc:	05 00 00 00 00       	add    eax,0x0
    1ce1:	02 01                	add    al,BYTE PTR [ecx]
    1ce3:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1ce6:	00 00                	add    BYTE PTR [eax],al
    1ce8:	02 02                	add    al,BYTE PTR [edx]
    1cea:	07                   	pop    es
    1ceb:	0e                   	push   cs
    1cec:	00 00                	add    BYTE PTR [eax],al
    1cee:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1cf1:	00 00                	add    BYTE PTR [eax],al
    1cf3:	00 02                	add    BYTE PTR [edx],al
    1cf5:	34 61                	xor    al,0x61
    1cf7:	00 00                	add    BYTE PTR [eax],al
    1cf9:	00 02                	add    BYTE PTR [edx],al
    1cfb:	04 07                	add    al,0x7
    1cfd:	32 00                	xor    al,BYTE PTR [eax]
    1cff:	00 00                	add    BYTE PTR [eax],al
    1d01:	02 08                	add    cl,BYTE PTR [eax]
    1d03:	07                   	pop    es
    1d04:	28 00                	sub    BYTE PTR [eax],al
    1d06:	00 00                	add    BYTE PTR [eax],al
    1d08:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1d0f:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1d12:	96                   	xchg   esi,eax
    1d13:	00 00                	add    BYTE PTR [eax],al
    1d15:	00 02                	add    BYTE PTR [edx],al
    1d17:	01 02                	add    DWORD PTR [edx],eax
    1d19:	90                   	nop
    1d1a:	00 00                	add    BYTE PTR [eax],al
    1d1c:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1d23:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1d26:	00 00                	add    BYTE PTR [eax],al
    1d28:	05 04 95 00 00       	add    eax,0x9504
    1d2d:	00 06                	add    BYTE PTR [esi],al
    1d2f:	25 00 00 00 02       	and    eax,0x2000000
    1d34:	04 07                	add    al,0x7
    1d36:	2d 00 00 00 02       	sub    eax,0x2000000
    1d3b:	04 07                	add    al,0x7
    1d3d:	dc 00                	fadd   QWORD PTR [eax]
    1d3f:	00 00                	add    BYTE PTR [eax],al
    1d41:	05 04 25 00 00       	add    eax,0x2504
    1d46:	00 07                	add    BYTE PTR [edi],al
    1d48:	63 08                	arpl   WORD PTR [eax],cx
    1d4a:	00 00                	add    BYTE PTR [eax],al
    1d4c:	01 3b                	add    DWORD PTR [ebx],edi
    1d4e:	9a 00 00 00 c0 0e 00 	call   0xe:0xc0000000
    1d55:	30 7d 01             	xor    BYTE PTR [ebp+0x1],bh
    1d58:	00 00                	add    BYTE PTR [eax],al
    1d5a:	01 9c 45 01 00 00 08 	add    DWORD PTR [ebp+eax*2+0x8000001],ebx
    1d61:	72 08                	jb     1d6b <sysEnter_Vector-0x12e295>
    1d63:	00 00                	add    BYTE PTR [eax],al
    1d65:	01 3b                	add    DWORD PTR [ebx],edi
    1d67:	8f 00                	pop    DWORD PTR [eax]
    1d69:	00 00                	add    BYTE PTR [eax],al
    1d6b:	02 91 00 08 6b 08    	add    dl,BYTE PTR [ecx+0x86b0800]
    1d71:	00 00                	add    BYTE PTR [eax],al
    1d73:	01 3b                	add    DWORD PTR [ebx],edi
    1d75:	45                   	inc    ebp
    1d76:	01 00                	add    DWORD PTR [eax],eax
    1d78:	00 02                	add    BYTE PTR [edx],al
    1d7a:	91                   	xchg   ecx,eax
    1d7b:	04 08                	add    al,0x8
    1d7d:	77 08                	ja     1d87 <sysEnter_Vector-0x12e279>
    1d7f:	00 00                	add    BYTE PTR [eax],al
    1d81:	01 3b                	add    DWORD PTR [ebx],edi
    1d83:	3a 00                	cmp    al,BYTE PTR [eax]
    1d85:	00 00                	add    BYTE PTR [eax],al
    1d87:	02 91 08 09 73 00    	add    dl,BYTE PTR [ecx+0x730908]
    1d8d:	01 3d 8f 00 00 00    	add    DWORD PTR ds:0x8f,edi
    1d93:	01 56 09             	add    DWORD PTR [esi+0x9],edx
    1d96:	61                   	popa   
    1d97:	63 63 00             	arpl   WORD PTR [ebx+0x0],sp
    1d9a:	01 3e                	add    DWORD PTR [esi],edi
    1d9c:	9a 00 00 00 01 57 09 	call   0x957:0x1000000
    1da3:	63 00                	arpl   WORD PTR [eax],ax
    1da5:	01 3f                	add    DWORD PTR [edi],edi
    1da7:	3a 00                	cmp    al,BYTE PTR [eax]
    1da9:	00 00                	add    BYTE PTR [eax],al
    1dab:	01 53 0a             	add    DWORD PTR [ebx+0xa],edx
    1dae:	55                   	push   ebp
    1daf:	08 00                	or     BYTE PTR [eax],al
    1db1:	00 01                	add    BYTE PTR [ecx],al
    1db3:	40                   	inc    eax
    1db4:	9a 00 00 00 0b 6e 65 	call   0x656e:0xb000000
    1dbb:	67 00 01             	add    BYTE PTR [bx+di],al
    1dbe:	41                   	inc    ecx
    1dbf:	3a 00                	cmp    al,BYTE PTR [eax]
    1dc1:	00 00                	add    BYTE PTR [eax],al
    1dc3:	09 61 6e             	or     DWORD PTR [ecx+0x6e],esp
    1dc6:	79 00                	jns    1dc8 <sysEnter_Vector-0x12e238>
    1dc8:	01 41 3a             	add    DWORD PTR [ecx+0x3a],eax
    1dcb:	00 00                	add    BYTE PTR [eax],al
    1dcd:	00 01                	add    BYTE PTR [ecx],al
    1dcf:	51                   	push   ecx
    1dd0:	0c 5c                	or     al,0x5c
    1dd2:	08 00                	or     BYTE PTR [eax],al
    1dd4:	00 01                	add    BYTE PTR [ecx],al
    1dd6:	41                   	inc    ecx
    1dd7:	3a 00                	cmp    al,BYTE PTR [eax]
    1dd9:	00 00                	add    BYTE PTR [eax],al
    1ddb:	01 52 00             	add    DWORD PTR [edx+0x0],edx
    1dde:	05 04 a8 00 00       	add    eax,0xa804
    1de3:	00 0d 3f 00 00 00    	add    BYTE PTR ds:0x3f,cl
    1de9:	04 33                	add    al,0x33
    1deb:	56                   	push   esi
    1dec:	00 00                	add    BYTE PTR [eax],al
    1dee:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
    1df4:	30 0d aa 00 00 00    	xor    BYTE PTR ds:0xaa,cl
    1dfa:	04 34                	add    al,0x34
    1dfc:	56                   	push   esi
    1dfd:	00 00                	add    BYTE PTR [eax],al
    1dff:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
    1e05:	30 0d 56 01 00 00    	xor    BYTE PTR ds:0x156,cl
    1e0b:	04 35                	add    al,0x35
    1e0d:	56                   	push   esi
    1e0e:	00 00                	add    BYTE PTR [eax],al
    1e10:	00 05 03 30 34 00    	add    BYTE PTR ds:0x343003,al
    1e16:	30 0d 48 00 00 00    	xor    BYTE PTR ds:0x48,cl
    1e1c:	05 36 84 00 00       	add    eax,0x8436
    1e21:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
    1e27:	30 00                	xor    BYTE PTR [eax],al
    1e29:	6c                   	ins    BYTE PTR es:[edi],dx
    1e2a:	00 00                	add    BYTE PTR [eax],al
    1e2c:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1e2f:	ec                   	in     al,dx
    1e30:	0b 00                	or     eax,DWORD PTR [eax]
    1e32:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1e35:	ef                   	out    dx,eax
    1e36:	00 00                	add    BYTE PTR [eax],al
    1e38:	00 0c 7c             	add    BYTE PTR [esp+edi*2],cl
    1e3b:	08 00                	or     BYTE PTR [eax],al
    1e3d:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1e40:	00 00                	add    BYTE PTR [eax],al
    1e42:	40                   	inc    eax
    1e43:	10 00                	adc    BYTE PTR [eax],al
    1e45:	30 1d 00 00 00 b7    	xor    BYTE PTR ds:0xb7000000,bl
    1e4b:	0e                   	push   cs
    1e4c:	00 00                	add    BYTE PTR [eax],al
    1e4e:	02 93 08 00 00 01    	add    dl,BYTE PTR [ebx+0x1000008]
    1e54:	01 5b 00             	add    DWORD PTR [ebx+0x0],ebx
    1e57:	00 00                	add    BYTE PTR [eax],al
    1e59:	40                   	inc    eax
    1e5a:	10 00                	adc    BYTE PTR [eax],al
    1e5c:	30 1d 00 00 00 01    	xor    BYTE PTR ds:0x1000000,bl
    1e62:	9c                   	pushf  
    1e63:	5b                   	pop    ebx
    1e64:	00 00                	add    BYTE PTR [eax],al
    1e66:	00 03                	add    BYTE PTR [ebx],al
    1e68:	76 61                	jbe    1ecb <sysEnter_Vector-0x12e135>
    1e6a:	6c                   	ins    BYTE PTR es:[edi],dx
    1e6b:	00 01                	add    BYTE PTR [ecx],al
    1e6d:	01 5b 00             	add    DWORD PTR [ebx+0x0],ebx
    1e70:	00 00                	add    BYTE PTR [eax],al
    1e72:	02 91 00 03 63 6e    	add    dl,BYTE PTR [ecx+0x6e630300]
    1e78:	74 00                	je     1e7a <sysEnter_Vector-0x12e186>
    1e7a:	01 01                	add    DWORD PTR [ecx],eax
    1e7c:	68 00 00 00 02       	push   0x2000000
    1e81:	91                   	xchg   ecx,eax
    1e82:	04 00                	add    al,0x0
    1e84:	04 04                	add    al,0x4
    1e86:	61                   	popa   
    1e87:	00 00                	add    BYTE PTR [eax],al
    1e89:	00 05 01 06 58 00    	add    BYTE PTR ds:0x580601,al
    1e8f:	00 00                	add    BYTE PTR [eax],al
    1e91:	06                   	push   es
    1e92:	04 05                	add    al,0x5
    1e94:	69 6e 74 00 00 8a 01 	imul   ebp,DWORD PTR [esi+0x74],0x18a0000
    1e9b:	00 00                	add    BYTE PTR [eax],al
    1e9d:	04 00                	add    al,0x0
    1e9f:	4a                   	dec    edx
    1ea0:	0c 00                	or     al,0x0
    1ea2:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1ea5:	ef                   	out    dx,eax
    1ea6:	00 00                	add    BYTE PTR [eax],al
    1ea8:	00 0c 9b             	add    BYTE PTR [ebx+ebx*4],cl
    1eab:	08 00                	or     BYTE PTR [eax],al
    1ead:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1eb0:	00 00                	add    BYTE PTR [eax],al
    1eb2:	60                   	pusha  
    1eb3:	10 00                	adc    BYTE PTR [eax],al
    1eb5:	30 9c 01 00 00 fe 0e 	xor    BYTE PTR [ecx+eax*1+0xefe0000],bl
    1ebc:	00 00                	add    BYTE PTR [eax],al
    1ebe:	02 01                	add    al,BYTE PTR [ecx]
    1ec0:	06                   	push   es
    1ec1:	58                   	pop    eax
    1ec2:	00 00                	add    BYTE PTR [eax],al
    1ec4:	00 02                	add    BYTE PTR [edx],al
    1ec6:	01 06                	add    DWORD PTR [esi],eax
    1ec8:	51                   	push   ecx
    1ec9:	00 00                	add    BYTE PTR [eax],al
    1ecb:	00 02                	add    BYTE PTR [edx],al
    1ecd:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1ed3:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1eda:	02 08                	add    cl,BYTE PTR [eax]
    1edc:	05 00 00 00 00       	add    eax,0x0
    1ee1:	02 01                	add    al,BYTE PTR [ecx]
    1ee3:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1ee6:	00 00                	add    BYTE PTR [eax],al
    1ee8:	02 02                	add    al,BYTE PTR [edx]
    1eea:	07                   	pop    es
    1eeb:	0e                   	push   cs
    1eec:	00 00                	add    BYTE PTR [eax],al
    1eee:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1ef1:	00 00                	add    BYTE PTR [eax],al
    1ef3:	00 02                	add    BYTE PTR [edx],al
    1ef5:	34 61                	xor    al,0x61
    1ef7:	00 00                	add    BYTE PTR [eax],al
    1ef9:	00 02                	add    BYTE PTR [edx],al
    1efb:	04 07                	add    al,0x7
    1efd:	32 00                	xor    al,BYTE PTR [eax]
    1eff:	00 00                	add    BYTE PTR [eax],al
    1f01:	02 08                	add    cl,BYTE PTR [eax]
    1f03:	07                   	pop    es
    1f04:	28 00                	sub    BYTE PTR [eax],al
    1f06:	00 00                	add    BYTE PTR [eax],al
    1f08:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1f0f:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1f12:	96                   	xchg   esi,eax
    1f13:	00 00                	add    BYTE PTR [eax],al
    1f15:	00 02                	add    BYTE PTR [edx],al
    1f17:	01 02                	add    DWORD PTR [edx],eax
    1f19:	90                   	nop
    1f1a:	00 00                	add    BYTE PTR [eax],al
    1f1c:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1f23:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1f26:	00 00                	add    BYTE PTR [eax],al
    1f28:	05 04 95 00 00       	add    eax,0x9504
    1f2d:	00 06                	add    BYTE PTR [esi],al
    1f2f:	25 00 00 00 02       	and    eax,0x2000000
    1f34:	04 07                	add    al,0x7
    1f36:	2d 00 00 00 02       	sub    eax,0x2000000
    1f3b:	04 07                	add    al,0x7
    1f3d:	dc 00                	fadd   QWORD PTR [eax]
    1f3f:	00 00                	add    BYTE PTR [eax],al
    1f41:	05 04 25 00 00       	add    eax,0x2504
    1f46:	00 07                	add    BYTE PTR [edi],al
    1f48:	b0 08                	mov    al,0x8
    1f4a:	00 00                	add    BYTE PTR [eax],al
    1f4c:	01 57 6f             	add    DWORD PTR [edi+0x6f],edx
    1f4f:	00 00                	add    BYTE PTR [eax],al
    1f51:	00 60 10             	add    BYTE PTR [eax+0x10],ah
    1f54:	00 30                	add    BYTE PTR [eax],dh
    1f56:	9c                   	pushf  
    1f57:	01 00                	add    DWORD PTR [eax],eax
    1f59:	00 01                	add    BYTE PTR [ecx],al
    1f5b:	9c                   	pushf  
    1f5c:	43                   	inc    ebx
    1f5d:	01 00                	add    DWORD PTR [eax],eax
    1f5f:	00 08                	add    BYTE PTR [eax],cl
    1f61:	72 08                	jb     1f6b <sysEnter_Vector-0x12e095>
    1f63:	00 00                	add    BYTE PTR [eax],al
    1f65:	01 57 8f             	add    DWORD PTR [edi-0x71],edx
    1f68:	00 00                	add    BYTE PTR [eax],al
    1f6a:	00 02                	add    BYTE PTR [edx],al
    1f6c:	91                   	xchg   ecx,eax
    1f6d:	00 08                	add    BYTE PTR [eax],cl
    1f6f:	6b 08 00             	imul   ecx,DWORD PTR [eax],0x0
    1f72:	00 01                	add    BYTE PTR [ecx],al
    1f74:	57                   	push   edi
    1f75:	43                   	inc    ebx
    1f76:	01 00                	add    DWORD PTR [eax],eax
    1f78:	00 02                	add    BYTE PTR [edx],al
    1f7a:	91                   	xchg   ecx,eax
    1f7b:	04 08                	add    al,0x8
    1f7d:	77 08                	ja     1f87 <sysEnter_Vector-0x12e079>
    1f7f:	00 00                	add    BYTE PTR [eax],al
    1f81:	01 57 3a             	add    DWORD PTR [edi+0x3a],edx
    1f84:	00 00                	add    BYTE PTR [eax],al
    1f86:	00 02                	add    BYTE PTR [edx],al
    1f88:	91                   	xchg   ecx,eax
    1f89:	08 09                	or     BYTE PTR [ecx],cl
    1f8b:	73 00                	jae    1f8d <sysEnter_Vector-0x12e073>
    1f8d:	01 59 8f             	add    DWORD PTR [ecx-0x71],ebx
    1f90:	00 00                	add    BYTE PTR [eax],al
    1f92:	00 01                	add    BYTE PTR [ecx],al
    1f94:	56                   	push   esi
    1f95:	09 61 63             	or     DWORD PTR [ecx+0x63],esp
    1f98:	63 00                	arpl   WORD PTR [eax],ax
    1f9a:	01 5a 9a             	add    DWORD PTR [edx-0x66],ebx
    1f9d:	00 00                	add    BYTE PTR [eax],al
    1f9f:	00 01                	add    BYTE PTR [ecx],al
    1fa1:	57                   	push   edi
    1fa2:	09 63 00             	or     DWORD PTR [ebx+0x0],esp
    1fa5:	01 5b 3a             	add    DWORD PTR [ebx+0x3a],ebx
    1fa8:	00 00                	add    BYTE PTR [eax],al
    1faa:	00 01                	add    BYTE PTR [ecx],al
    1fac:	53                   	push   ebx
    1fad:	0a 55 08             	or     dl,BYTE PTR [ebp+0x8]
    1fb0:	00 00                	add    BYTE PTR [eax],al
    1fb2:	01 5c 9a 00          	add    DWORD PTR [edx+ebx*4+0x0],ebx
    1fb6:	00 00                	add    BYTE PTR [eax],al
    1fb8:	0b 6e 65             	or     ebp,DWORD PTR [esi+0x65]
    1fbb:	67 00 01             	add    BYTE PTR [bx+di],al
    1fbe:	5d                   	pop    ebp
    1fbf:	3a 00                	cmp    al,BYTE PTR [eax]
    1fc1:	00 00                	add    BYTE PTR [eax],al
    1fc3:	09 61 6e             	or     DWORD PTR [ecx+0x6e],esp
    1fc6:	79 00                	jns    1fc8 <sysEnter_Vector-0x12e038>
    1fc8:	01 5d 3a             	add    DWORD PTR [ebp+0x3a],ebx
    1fcb:	00 00                	add    BYTE PTR [eax],al
    1fcd:	00 01                	add    BYTE PTR [ecx],al
    1fcf:	51                   	push   ecx
    1fd0:	0a 5c 08 00          	or     bl,BYTE PTR [eax+ecx*1+0x0]
    1fd4:	00 01                	add    BYTE PTR [ecx],al
    1fd6:	5d                   	pop    ebp
    1fd7:	3a 00                	cmp    al,BYTE PTR [eax]
    1fd9:	00 00                	add    BYTE PTR [eax],al
    1fdb:	00 05 04 a8 00 00    	add    BYTE PTR ds:0xa804,al
    1fe1:	00 0c 3f             	add    BYTE PTR [edi+edi*1],cl
    1fe4:	00 00                	add    BYTE PTR [eax],al
    1fe6:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    1fe9:	56                   	push   esi
    1fea:	00 00                	add    BYTE PTR [eax],al
    1fec:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
    1ff2:	30 0c aa             	xor    BYTE PTR [edx+ebp*4],cl
    1ff5:	00 00                	add    BYTE PTR [eax],al
    1ff7:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1ffa:	56                   	push   esi
    1ffb:	00 00                	add    BYTE PTR [eax],al
    1ffd:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
    2003:	30 0c 56             	xor    BYTE PTR [esi+edx*2],cl
    2006:	01 00                	add    DWORD PTR [eax],eax
    2008:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    200f:	05 03 30 34 00       	add    eax,0x343003
    2014:	30 0c 48             	xor    BYTE PTR [eax+ecx*2],cl
    2017:	00 00                	add    BYTE PTR [eax],al
    2019:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    201f:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
    2025:	30 00                	xor    BYTE PTR [eax],al
    2027:	ad                   	lods   eax,DWORD PTR ds:[esi]
    2028:	01 00                	add    DWORD PTR [eax],eax
    202a:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    202d:	f6                   	(bad)  
    202e:	0c 00                	or     al,0x0
    2030:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    2033:	ef                   	out    dx,eax
    2034:	00 00                	add    BYTE PTR [eax],al
    2036:	00 0c c4             	add    BYTE PTR [esp+eax*8],cl
    2039:	08 00                	or     BYTE PTR [eax],al
    203b:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    203e:	00 00                	add    BYTE PTR [eax],al
    2040:	fc                   	cld    
    2041:	11 00                	adc    DWORD PTR [eax],eax
    2043:	30 53 01             	xor    BYTE PTR [ebx+0x1],dl
    2046:	00 00                	add    BYTE PTR [eax],al
    2048:	81 10 00 00 02 01    	adc    DWORD PTR [eax],0x1020000
    204e:	06                   	push   es
    204f:	58                   	pop    eax
    2050:	00 00                	add    BYTE PTR [eax],al
    2052:	00 02                	add    BYTE PTR [edx],al
    2054:	01 06                	add    DWORD PTR [esi],eax
    2056:	51                   	push   ecx
    2057:	00 00                	add    BYTE PTR [eax],al
    2059:	00 02                	add    BYTE PTR [edx],al
    205b:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    2061:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    2068:	02 08                	add    cl,BYTE PTR [eax]
    206a:	05 00 00 00 00       	add    eax,0x0
    206f:	04 be                	add    al,0xbe
    2071:	05 00 00 02 2e       	add    eax,0x2e020000
    2076:	53                   	push   ebx
    2077:	00 00                	add    BYTE PTR [eax],al
    2079:	00 02                	add    BYTE PTR [edx],al
    207b:	01 08                	add    DWORD PTR [eax],ecx
    207d:	4f                   	dec    edi
    207e:	00 00                	add    BYTE PTR [eax],al
    2080:	00 02                	add    BYTE PTR [edx],al
    2082:	02 07                	add    al,BYTE PTR [edi]
    2084:	0e                   	push   cs
    2085:	00 00                	add    BYTE PTR [eax],al
    2087:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    208a:	00 00                	add    BYTE PTR [eax],al
    208c:	00 02                	add    BYTE PTR [edx],al
    208e:	34 6c                	xor    al,0x6c
    2090:	00 00                	add    BYTE PTR [eax],al
    2092:	00 02                	add    BYTE PTR [edx],al
    2094:	04 07                	add    al,0x7
    2096:	32 00                	xor    al,BYTE PTR [eax]
    2098:	00 00                	add    BYTE PTR [eax],al
    209a:	02 08                	add    cl,BYTE PTR [eax]
    209c:	07                   	pop    es
    209d:	28 00                	sub    BYTE PTR [eax],al
    209f:	00 00                	add    BYTE PTR [eax],al
    20a1:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    20a8:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    20ab:	96                   	xchg   esi,eax
    20ac:	00 00                	add    BYTE PTR [eax],al
    20ae:	00 02                	add    BYTE PTR [edx],al
    20b0:	01 02                	add    DWORD PTR [edx],eax
    20b2:	90                   	nop
    20b3:	00 00                	add    BYTE PTR [eax],al
    20b5:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    20bc:	2a 7a 00             	sub    bh,BYTE PTR [edx+0x0]
    20bf:	00 00                	add    BYTE PTR [eax],al
    20c1:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
    20c4:	2d 00 00 00 02       	sub    eax,0x2000000
    20c9:	04 07                	add    al,0x7
    20cb:	dc 00                	fadd   QWORD PTR [eax]
    20cd:	00 00                	add    BYTE PTR [eax],al
    20cf:	05 04 25 00 00       	add    eax,0x2504
    20d4:	00 06                	add    BYTE PTR [esi],al
    20d6:	da 08                	fimul  DWORD PTR [eax]
    20d8:	00 00                	add    BYTE PTR [eax],al
    20da:	01 04 a8             	add    DWORD PTR [eax+ebp*4],eax
    20dd:	00 00                	add    BYTE PTR [eax],al
    20df:	00 fc                	add    ah,bh
    20e1:	11 00                	adc    DWORD PTR [eax],eax
    20e3:	30 b5 00 00 00 01    	xor    BYTE PTR [ebp+0x1000000],dh
    20e9:	9c                   	pushf  
    20ea:	0a 01                	or     al,BYTE PTR [ecx]
    20ec:	00 00                	add    BYTE PTR [eax],al
    20ee:	07                   	pop    es
    20ef:	eb 08                	jmp    20f9 <sysEnter_Vector-0x12df07>
    20f1:	00 00                	add    BYTE PTR [eax],al
    20f3:	01 04 0a             	add    DWORD PTR [edx+ecx*1],eax
    20f6:	01 00                	add    DWORD PTR [eax],eax
    20f8:	00 02                	add    BYTE PTR [edx],al
    20fa:	91                   	xchg   ecx,eax
    20fb:	00 08                	add    BYTE PTR [eax],cl
    20fd:	be 08 00 00 01       	mov    esi,0x1000008
    2102:	06                   	push   es
    2103:	48                   	dec    eax
    2104:	00 00                	add    BYTE PTR [eax],al
    2106:	00 02                	add    BYTE PTR [edx],al
    2108:	91                   	xchg   ecx,eax
    2109:	6f                   	outs   dx,DWORD PTR ds:[esi]
    210a:	08 b7 08 00 00 01    	or     BYTE PTR [edi+0x1000008],dh
    2110:	06                   	push   es
    2111:	48                   	dec    eax
    2112:	00 00                	add    BYTE PTR [eax],al
    2114:	00 02                	add    BYTE PTR [edx],al
    2116:	91                   	xchg   ecx,eax
    2117:	6d                   	ins    DWORD PTR es:[edi],dx
    2118:	09 61 12             	or     DWORD PTR [ecx+0x12],esp
    211b:	00 30                	add    BYTE PTR [eax],dh
    211d:	46                   	inc    esi
    211e:	00 00                	add    BYTE PTR [eax],al
    2120:	00 0a                	add    BYTE PTR [edx],cl
    2122:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    2124:	64 00 01             	add    BYTE PTR fs:[ecx],al
    2127:	10 48 00             	adc    BYTE PTR [eax+0x0],cl
    212a:	00 00                	add    BYTE PTR [eax],al
    212c:	02 91 6e 00 00 05    	add    dl,BYTE PTR [ecx+0x500006e]
    2132:	04 a8                	add    al,0xa8
    2134:	00 00                	add    BYTE PTR [eax],al
    2136:	00 06                	add    BYTE PTR [esi],al
    2138:	e2 08                	loop   2142 <sysEnter_Vector-0x12debe>
    213a:	00 00                	add    BYTE PTR [eax],al
    213c:	01 18                	add    DWORD PTR [eax],ebx
    213e:	a8 00                	test   al,0x0
    2140:	00 00                	add    BYTE PTR [eax],al
    2142:	b1 12                	mov    cl,0x12
    2144:	00 30                	add    BYTE PTR [eax],dh
    2146:	9e                   	sahf   
    2147:	00 00                	add    BYTE PTR [eax],al
    2149:	00 01                	add    BYTE PTR [ecx],al
    214b:	9c                   	pushf  
    214c:	6c                   	ins    BYTE PTR es:[edi],dx
    214d:	01 00                	add    DWORD PTR [eax],eax
    214f:	00 07                	add    BYTE PTR [edi],al
    2151:	eb 08                	jmp    215b <sysEnter_Vector-0x12dea5>
    2153:	00 00                	add    BYTE PTR [eax],al
    2155:	01 18                	add    DWORD PTR [eax],ebx
    2157:	a8 00                	test   al,0x0
    2159:	00 00                	add    BYTE PTR [eax],al
    215b:	02 91 00 08 be 08    	add    dl,BYTE PTR [ecx+0x8be0800]
    2161:	00 00                	add    BYTE PTR [eax],al
    2163:	01 1a                	add    DWORD PTR [edx],ebx
    2165:	48                   	dec    eax
    2166:	00 00                	add    BYTE PTR [eax],al
    2168:	00 02                	add    BYTE PTR [edx],al
    216a:	91                   	xchg   ecx,eax
    216b:	6f                   	outs   dx,DWORD PTR ds:[esi]
    216c:	08 b7 08 00 00 01    	or     BYTE PTR [edi+0x1000008],dh
    2172:	1a 48 00             	sbb    cl,BYTE PTR [eax+0x0]
    2175:	00 00                	add    BYTE PTR [eax],al
    2177:	02 91 6d 09 08 13    	add    dl,BYTE PTR [ecx+0x1308096d]
    217d:	00 30                	add    BYTE PTR [eax],dh
    217f:	3f                   	aas    
    2180:	00 00                	add    BYTE PTR [eax],al
    2182:	00 0a                	add    BYTE PTR [edx],cl
    2184:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    2186:	64 00 01             	add    BYTE PTR fs:[ecx],al
    2189:	24 48                	and    al,0x48
    218b:	00 00                	add    BYTE PTR [eax],al
    218d:	00 02                	add    BYTE PTR [edx],al
    218f:	91                   	xchg   ecx,eax
    2190:	6e                   	outs   dx,BYTE PTR ds:[esi]
    2191:	00 00                	add    BYTE PTR [eax],al
    2193:	0b 3f                	or     edi,DWORD PTR [edi]
    2195:	00 00                	add    BYTE PTR [eax],al
    2197:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    219a:	61                   	popa   
    219b:	00 00                	add    BYTE PTR [eax],al
    219d:	00 05 03 34 34 00    	add    BYTE PTR ds:0x343403,al
    21a3:	30 0b                	xor    BYTE PTR [ebx],cl
    21a5:	aa                   	stos   BYTE PTR es:[edi],al
    21a6:	00 00                	add    BYTE PTR [eax],al
    21a8:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    21ab:	61                   	popa   
    21ac:	00 00                	add    BYTE PTR [eax],al
    21ae:	00 05 03 38 34 00    	add    BYTE PTR ds:0x343803,al
    21b4:	30 0b                	xor    BYTE PTR [ebx],cl
    21b6:	56                   	push   esi
    21b7:	01 00                	add    DWORD PTR [eax],eax
    21b9:	00 04 35 61 00 00 00 	add    BYTE PTR [esi*1+0x61],al
    21c0:	05 03 30 34 00       	add    eax,0x343003
    21c5:	30 0b                	xor    BYTE PTR [ebx],cl
    21c7:	48                   	dec    eax
    21c8:	00 00                	add    BYTE PTR [eax],al
    21ca:	00 05 36 8f 00 00    	add    BYTE PTR ds:0x8f36,al
    21d0:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
    21d6:	30 00                	xor    BYTE PTR [eax],al
    21d8:	ae                   	scas   al,BYTE PTR es:[edi]
    21d9:	04 00                	add    al,0x0
    21db:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    21de:	99                   	cdq    
    21df:	0d 00 00 04 01       	or     eax,0x1040000
    21e4:	ef                   	out    dx,eax
    21e5:	00 00                	add    BYTE PTR [eax],al
    21e7:	00 0c a2             	add    BYTE PTR [edx+eiz*4],cl
    21ea:	09 00                	or     DWORD PTR [eax],eax
    21ec:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    21ef:	00 00                	add    BYTE PTR [eax],al
    21f1:	50                   	push   eax
    21f2:	13 00                	adc    eax,DWORD PTR [eax]
    21f4:	30 16                	xor    BYTE PTR [esi],dl
    21f6:	0c 00                	or     al,0x0
    21f8:	00 8d 11 00 00 02    	add    BYTE PTR [ebp+0x2000011],cl
    21fe:	29 02                	sub    DWORD PTR [edx],eax
    2200:	00 00                	add    BYTE PTR [eax],al
    2202:	04 ad                	add    al,0xad
    2204:	00 00                	add    BYTE PTR [eax],al
    2206:	00 06                	add    BYTE PTR [esi],al
    2208:	15 ad 00 00 00       	adc    eax,0xad
    220d:	03 0f                	add    ecx,DWORD PTR [edi]
    220f:	03 00                	add    eax,DWORD PTR [eax]
    2211:	00 00                	add    BYTE PTR [eax],al
    2213:	03 b8 02 00 00 01    	add    edi,DWORD PTR [eax+0x1000002]
    2219:	03 9e 02 00 00 03    	add    ebx,DWORD PTR [esi+0x3000002]
    221f:	03 01                	add    eax,DWORD PTR [ecx]
    2221:	03 00                	add    eax,DWORD PTR [eax]
    2223:	00 04 03             	add    BYTE PTR [ebx+eax*1],al
    2226:	ab                   	stos   DWORD PTR es:[edi],eax
    2227:	02 00                	add    al,BYTE PTR [eax]
    2229:	00 59 03             	add    BYTE PTR [ecx+0x3],bl
    222c:	33 02                	xor    eax,DWORD PTR [edx]
    222e:	00 00                	add    BYTE PTR [eax],al
    2230:	61                   	popa   
    2231:	03 2e                	add    ebp,DWORD PTR [esi]
    2233:	03 00                	add    eax,DWORD PTR [eax]
    2235:	00 97 04 d0 02 00    	add    BYTE PTR [edi+0x2d004],dl
    223b:	00 63 01             	add    BYTE PTR [ebx+0x1],ah
    223e:	04 e7                	add    al,0xe7
    2240:	02 00                	add    al,BYTE PTR [eax]
    2242:	00 64 01 04          	add    BYTE PTR [ecx+eax*1+0x4],ah
    2246:	8b 02                	mov    eax,DWORD PTR [edx]
    2248:	00 00                	add    BYTE PTR [eax],al
    224a:	65 01 04 62          	add    DWORD PTR gs:[edx+eiz*2],eax
    224e:	02 00                	add    al,BYTE PTR [eax]
    2250:	00 66 01             	add    BYTE PTR [esi+0x1],ah
    2253:	04 46                	add    al,0x46
    2255:	02 00                	add    al,BYTE PTR [eax]
    2257:	00 67 01             	add    BYTE PTR [edi+0x1],ah
    225a:	04 f4                	add    al,0xf4
    225c:	02 00                	add    al,BYTE PTR [eax]
    225e:	00 68 01             	add    BYTE PTR [eax+0x1],ch
    2261:	04 1f                	add    al,0x1f
    2263:	03 00                	add    eax,DWORD PTR [eax]
    2265:	00 69 01             	add    BYTE PTR [ecx+0x1],ch
    2268:	04 e9                	add    al,0xe9
    226a:	01 00                	add    DWORD PTR [eax],eax
    226c:	00 70 01             	add    BYTE PTR [eax+0x1],dh
    226f:	04 4c                	add    al,0x4c
    2271:	03 00                	add    eax,DWORD PTR [eax]
    2273:	00 00                	add    BYTE PTR [eax],al
    2275:	03 04 7c             	add    eax,DWORD PTR [esp+edi*2]
    2278:	02 00                	add    al,BYTE PTR [eax]
    227a:	00 01                	add    BYTE PTR [ecx],al
    227c:	03 04 fa             	add    eax,DWORD PTR [edx+edi*8]
    227f:	01 00                	add    DWORD PTR [eax],eax
    2281:	00 02                	add    BYTE PTR [edx],al
    2283:	03 00                	add    eax,DWORD PTR [eax]
    2285:	05 04 07 32 00       	add    eax,0x320704
    228a:	00 00                	add    BYTE PTR [eax],al
    228c:	05 01 06 58 00       	add    eax,0x580601
    2291:	00 00                	add    BYTE PTR [eax],al
    2293:	05 01 06 51 00       	add    eax,0x510601
    2298:	00 00                	add    BYTE PTR [eax],al
    229a:	05 02 05 e5 00       	add    eax,0xe50502
    229f:	00 00                	add    BYTE PTR [eax],al
    22a1:	06                   	push   es
    22a2:	04 05                	add    al,0x5
    22a4:	69 6e 74 00 05 08 05 	imul   ebp,DWORD PTR [esi+0x74],0x5080500
    22ab:	00 00                	add    BYTE PTR [eax],al
    22ad:	00 00                	add    BYTE PTR [eax],al
    22af:	05 01 08 4f 00       	add    eax,0x4f0801
    22b4:	00 00                	add    BYTE PTR [eax],al
    22b6:	05 02 07 0e 00       	add    eax,0xe0702
    22bb:	00 00                	add    BYTE PTR [eax],al
    22bd:	07                   	pop    es
    22be:	64 00 00             	add    BYTE PTR fs:[eax],al
    22c1:	00 02                	add    BYTE PTR [edx],al
    22c3:	34 ad                	xor    al,0xad
    22c5:	00 00                	add    BYTE PTR [eax],al
    22c7:	00 05 08 07 28 00    	add    BYTE PTR ds:0x280708,al
    22cd:	00 00                	add    BYTE PTR [eax],al
    22cf:	05 04 05 05 00       	add    eax,0x50504
    22d4:	00 00                	add    BYTE PTR [eax],al
    22d6:	05 0c 04 96 00       	add    eax,0x96040c
    22db:	00 00                	add    BYTE PTR [eax],al
    22dd:	05 01 02 90 00       	add    eax,0x900201
    22e2:	00 00                	add    BYTE PTR [eax],al
    22e4:	07                   	pop    es
    22e5:	5d                   	pop    ebp
    22e6:	00 00                	add    BYTE PTR [eax],al
    22e8:	00 03                	add    BYTE PTR [ebx],al
    22ea:	2a f7                	sub    dh,bh
    22ec:	00 00                	add    BYTE PTR [eax],al
    22ee:	00 08                	add    BYTE PTR [eax],cl
    22f0:	74 6d                	je     235f <sysEnter_Vector-0x12dca1>
    22f2:	00 2c 03             	add    BYTE PTR [ebx+eax*1],ch
    22f5:	2c a7                	sub    al,0xa7
    22f7:	01 00                	add    DWORD PTR [eax],eax
    22f9:	00 09                	add    BYTE PTR [ecx],cl
    22fb:	af                   	scas   eax,DWORD PTR es:[edi]
    22fc:	04 00                	add    al,0x0
    22fe:	00 03                	add    BYTE PTR [ebx],al
    2300:	2e                   	cs
    2301:	c9                   	leave  
    2302:	00 00                	add    BYTE PTR [eax],al
    2304:	00 00                	add    BYTE PTR [eax],al
    2306:	09 14 04             	or     DWORD PTR [esp+eax*1],edx
    2309:	00 00                	add    BYTE PTR [eax],al
    230b:	03 2f                	add    ebp,DWORD PTR [edi]
    230d:	c9                   	leave  
    230e:	00 00                	add    BYTE PTR [eax],al
    2310:	00 04 09             	add    BYTE PTR [ecx+ecx*1],al
    2313:	61                   	popa   
    2314:	03 00                	add    eax,DWORD PTR [eax]
    2316:	00 03                	add    BYTE PTR [ebx],al
    2318:	30 c9                	xor    cl,cl
    231a:	00 00                	add    BYTE PTR [eax],al
    231c:	00 08                	add    BYTE PTR [eax],cl
    231e:	09 9a 04 00 00 03    	or     DWORD PTR [edx+0x3000004],ebx
    2324:	31 c9                	xor    ecx,ecx
    2326:	00 00                	add    BYTE PTR [eax],al
    2328:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
    232b:	a9 03 00 00 03       	test   eax,0x3000003
    2330:	32 c9                	xor    cl,cl
    2332:	00 00                	add    BYTE PTR [eax],al
    2334:	00 10                	add    BYTE PTR [eax],dl
    2336:	09 b0 03 00 00 03    	or     DWORD PTR [eax+0x3000003],esi
    233c:	33 c9                	xor    ecx,ecx
    233e:	00 00                	add    BYTE PTR [eax],al
    2340:	00 14 09             	add    BYTE PTR [ecx+ecx*1],dl
    2343:	92                   	xchg   edx,eax
    2344:	04 00                	add    al,0x0
    2346:	00 03                	add    BYTE PTR [ebx],al
    2348:	34 c9                	xor    al,0xc9
    234a:	00 00                	add    BYTE PTR [eax],al
    234c:	00 18                	add    BYTE PTR [eax],bl
    234e:	09 21                	or     DWORD PTR [ecx],esp
    2350:	04 00                	add    al,0x0
    2352:	00 03                	add    BYTE PTR [ebx],al
    2354:	35 c9 00 00 00       	xor    eax,0xc9
    2359:	1c 09                	sbb    al,0x9
    235b:	db 03                	fild   DWORD PTR [ebx]
    235d:	00 00                	add    BYTE PTR [eax],al
    235f:	03 36                	add    esi,DWORD PTR [esi]
    2361:	c9                   	leave  
    2362:	00 00                	add    BYTE PTR [eax],al
    2364:	00 20                	add    BYTE PTR [eax],ah
    2366:	09 5c 04 00          	or     DWORD PTR [esp+eax*1+0x0],ebx
    236a:	00 03                	add    BYTE PTR [ebx],al
    236c:	37                   	aaa    
    236d:	f7 00 00 00 24 09    	test   DWORD PTR [eax],0x9240000
    2373:	7f 03                	jg     2378 <sysEnter_Vector-0x12dc88>
    2375:	00 00                	add    BYTE PTR [eax],al
    2377:	03 38                	add    edi,DWORD PTR [eax]
    2379:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
    237a:	01 00                	add    DWORD PTR [eax],eax
    237c:	00 28                	add    BYTE PTR [eax],ch
    237e:	00 0a                	add    BYTE PTR [edx],cl
    2380:	04 ad                	add    al,0xad
    2382:	01 00                	add    DWORD PTR [eax],eax
    2384:	00 0b                	add    BYTE PTR [ebx],cl
    2386:	b4 00                	mov    ah,0x0
    2388:	00 00                	add    BYTE PTR [eax],al
    238a:	05 04 07 2d 00       	add    eax,0x2d0704
    238f:	00 00                	add    BYTE PTR [eax],al
    2391:	05 04 07 dc 00       	add    eax,0xdc0704
    2396:	00 00                	add    BYTE PTR [eax],al
    2398:	0a 04 b4             	or     al,BYTE PTR [esp+esi*4]
    239b:	00 00                	add    BYTE PTR [eax],al
    239d:	00 0c 62             	add    BYTE PTR [edx+eiz*2],cl
    23a0:	09 00                	or     DWORD PTR [eax],eax
    23a2:	00 01                	add    BYTE PTR [ecx],al
    23a4:	2e                   	cs
    23a5:	0c 01                	or     al,0x1
    23a7:	00 00                	add    BYTE PTR [eax],al
    23a9:	50                   	push   eax
    23aa:	13 00                	adc    eax,DWORD PTR [eax]
    23ac:	30 29                	xor    BYTE PTR [ecx],ch
    23ae:	00 00                	add    BYTE PTR [eax],al
    23b0:	00 01                	add    BYTE PTR [ecx],al
    23b2:	9c                   	pushf  
    23b3:	ee                   	out    dx,al
    23b4:	01 00                	add    DWORD PTR [eax],eax
    23b6:	00 0d 5a 03 00 00    	add    BYTE PTR ds:0x35a,cl
    23bc:	01 30                	add    DWORD PTR [eax],esi
    23be:	e5 00                	in     eax,0x0
    23c0:	00 00                	add    BYTE PTR [eax],al
    23c2:	02 91 74 00 0e 14    	add    dl,BYTE PTR [ecx+0x140e0074]
    23c8:	09 00                	or     DWORD PTR [eax],eax
    23ca:	00 01                	add    BYTE PTR [ecx],al
    23cc:	36                   	ss
    23cd:	5c                   	pop    esp
    23ce:	02 00                	add    al,BYTE PTR [eax]
    23d0:	00 79 13             	add    BYTE PTR [ecx+0x13],bh
    23d3:	00 30                	add    BYTE PTR [eax],dh
    23d5:	19 03                	sbb    DWORD PTR [ebx],eax
    23d7:	00 00                	add    BYTE PTR [eax],al
    23d9:	01 9c 5c 02 00 00 0f 	add    DWORD PTR [esp+ebx*2+0xf000002],ebx
    23e0:	1d 09 00 00 01       	sbb    eax,0x1000009
    23e5:	36 62 02             	bound  eax,QWORD PTR ss:[edx]
    23e8:	00 00                	add    BYTE PTR [eax],al
    23ea:	02 91 00 0f 96 09    	add    dl,BYTE PTR [ecx+0x9960f00]
    23f0:	00 00                	add    BYTE PTR [eax],al
    23f2:	01 36                	add    DWORD PTR [esi],esi
    23f4:	5c                   	pop    esp
    23f5:	02 00                	add    al,BYTE PTR [eax]
    23f7:	00 02                	add    BYTE PTR [edx],al
    23f9:	91                   	xchg   ecx,eax
    23fa:	04 0d                	add    al,0xd
    23fc:	62 09                	bound  ecx,QWORD PTR [ecx]
    23fe:	00 00                	add    BYTE PTR [eax],al
    2400:	01 37                	add    DWORD PTR [edi],esi
    2402:	0c 01                	or     al,0x1
    2404:	00 00                	add    BYTE PTR [eax],al
    2406:	02 91 68 0d 67 09    	add    dl,BYTE PTR [ecx+0x9670d68]
    240c:	00 00                	add    BYTE PTR [eax],al
    240e:	01 38                	add    DWORD PTR [eax],edi
    2410:	b2 01                	mov    dl,0x1
    2412:	00 00                	add    BYTE PTR [eax],al
    2414:	02 91 64 0d 05 09    	add    dl,BYTE PTR [ecx+0x9050d64]
    241a:	00 00                	add    BYTE PTR [eax],al
    241c:	01 38                	add    DWORD PTR [eax],edi
    241e:	b2 01                	mov    dl,0x1
    2420:	00 00                	add    BYTE PTR [eax],al
    2422:	02 91 70 0d b3 03    	add    dl,BYTE PTR [ecx+0x3b30d70]
    2428:	00 00                	add    BYTE PTR [eax],al
    242a:	01 39                	add    DWORD PTR [ecx],edi
    242c:	c9                   	leave  
    242d:	00 00                	add    BYTE PTR [eax],al
    242f:	00 02                	add    BYTE PTR [edx],al
    2431:	91                   	xchg   ecx,eax
    2432:	6c                   	ins    BYTE PTR es:[edi],dx
    2433:	00 0a                	add    BYTE PTR [edx],cl
    2435:	04 17                	add    al,0x17
    2437:	01 00                	add    DWORD PTR [eax],eax
    2439:	00 0a                	add    BYTE PTR [edx],cl
    243b:	04 68                	add    al,0x68
    243d:	02 00                	add    al,BYTE PTR [eax]
    243f:	00 0b                	add    BYTE PTR [ebx],cl
    2441:	0c 01                	or     al,0x1
    2443:	00 00                	add    BYTE PTR [eax],al
    2445:	10 fb                	adc    bl,bh
    2447:	08 00                	or     BYTE PTR [eax],al
    2449:	00 01                	add    BYTE PTR [ecx],al
    244b:	52                   	push   edx
    244c:	5c                   	pop    esp
    244d:	02 00                	add    al,BYTE PTR [eax]
    244f:	00 92 16 00 30 3f    	add    BYTE PTR [edx+0x3f300016],dl
    2455:	00 00                	add    BYTE PTR [eax],al
    2457:	00 01                	add    BYTE PTR [ecx],al
    2459:	9c                   	pushf  
    245a:	af                   	scas   eax,DWORD PTR es:[edi]
    245b:	02 00                	add    al,BYTE PTR [eax]
    245d:	00 0f                	add    BYTE PTR [edi],cl
    245f:	1d 09 00 00 01       	sbb    eax,0x1000009
    2464:	52                   	push   edx
    2465:	62 02                	bound  eax,QWORD PTR [edx]
    2467:	00 00                	add    BYTE PTR [eax],al
    2469:	02 91 00 11 74 00    	add    dl,BYTE PTR [ecx+0x741100]
    246f:	01 53 0c             	add    DWORD PTR [ebx+0xc],edx
    2472:	01 00                	add    DWORD PTR [eax],eax
    2474:	00 02                	add    BYTE PTR [edx],al
    2476:	91                   	xchg   ecx,eax
    2477:	6c                   	ins    BYTE PTR es:[edi],dx
    2478:	0d 96 09 00 00       	or     eax,0x996
    247d:	01 54 17 01          	add    DWORD PTR [edi+edx*1+0x1],edx
    2481:	00 00                	add    BYTE PTR [eax],al
    2483:	02 91 40 00 10 23    	add    dl,BYTE PTR [ecx+0x23100040]
    2489:	09 00                	or     DWORD PTR [eax],eax
    248b:	00 01                	add    BYTE PTR [ecx],al
    248d:	5a                   	pop    edx
    248e:	5c                   	pop    esp
    248f:	02 00                	add    al,BYTE PTR [eax]
    2491:	00 d1                	add    cl,dl
    2493:	16                   	push   ss
    2494:	00 30                	add    BYTE PTR [eax],dh
    2496:	3e 00 00             	add    BYTE PTR ds:[eax],al
    2499:	00 01                	add    BYTE PTR [ecx],al
    249b:	9c                   	pushf  
    249c:	f1                   	icebp  
    249d:	02 00                	add    al,BYTE PTR [eax]
    249f:	00 0f                	add    BYTE PTR [edi],cl
    24a1:	1d 09 00 00 01       	sbb    eax,0x1000009
    24a6:	5a                   	pop    edx
    24a7:	62 02                	bound  eax,QWORD PTR [edx]
    24a9:	00 00                	add    BYTE PTR [eax],al
    24ab:	02 91 00 0f 96 09    	add    dl,BYTE PTR [ecx+0x9960f00]
    24b1:	00 00                	add    BYTE PTR [eax],al
    24b3:	01 5a 5c             	add    DWORD PTR [edx+0x5c],ebx
    24b6:	02 00                	add    al,BYTE PTR [eax]
    24b8:	00 02                	add    BYTE PTR [edx],al
    24ba:	91                   	xchg   ecx,eax
    24bb:	04 11                	add    al,0x11
    24bd:	74 00                	je     24bf <sysEnter_Vector-0x12db41>
    24bf:	01 5b 0c             	add    DWORD PTR [ebx+0xc],ebx
    24c2:	01 00                	add    DWORD PTR [eax],eax
    24c4:	00 02                	add    BYTE PTR [edx],al
    24c6:	91                   	xchg   ecx,eax
    24c7:	6c                   	ins    BYTE PTR es:[edi],dx
    24c8:	00 0e                	add    BYTE PTR [esi],cl
    24ca:	60                   	pusha  
    24cb:	09 00                	or     DWORD PTR [eax],eax
    24cd:	00 01                	add    BYTE PTR [ecx],al
    24cf:	61                   	popa   
    24d0:	0c 01                	or     al,0x1
    24d2:	00 00                	add    BYTE PTR [eax],al
    24d4:	0f 17 00             	movhps QWORD PTR [eax],xmm0
    24d7:	30 57 08             	xor    BYTE PTR [edi+0x8],dl
    24da:	00 00                	add    BYTE PTR [eax],al
    24dc:	01 9c 89 03 00 00 0f 	add    DWORD PTR [ecx+ecx*4+0xf000003],ebx
    24e3:	96                   	xchg   esi,eax
    24e4:	09 00                	or     DWORD PTR [eax],eax
    24e6:	00 01                	add    BYTE PTR [ecx],al
    24e8:	61                   	popa   
    24e9:	5c                   	pop    esp
    24ea:	02 00                	add    al,BYTE PTR [eax]
    24ec:	00 02                	add    BYTE PTR [edx],al
    24ee:	91                   	xchg   ecx,eax
    24ef:	00 11                	add    BYTE PTR [ecx],dl
    24f1:	64                   	fs
    24f2:	61                   	popa   
    24f3:	79 00                	jns    24f5 <sysEnter_Vector-0x12db0b>
    24f5:	01 62 f7             	add    DWORD PTR [edx-0x9],esp
    24f8:	00 00                	add    BYTE PTR [eax],al
    24fa:	00 02                	add    BYTE PTR [edx],al
    24fc:	91                   	xchg   ecx,eax
    24fd:	68 0d b3 03 00       	push   0x3b30d
    2502:	00 01                	add    BYTE PTR [ecx],al
    2504:	62                   	(bad)  
    2505:	f7 00 00 00 02 91    	test   DWORD PTR [eax],0x91020000
    250b:	54                   	push   esp
    250c:	0d b0 03 00 00       	or     eax,0x3b0
    2511:	01 63 c9             	add    DWORD PTR [ebx-0x37],esp
    2514:	00 00                	add    BYTE PTR [eax],al
    2516:	00 02                	add    BYTE PTR [edx],al
    2518:	91                   	xchg   ecx,eax
    2519:	4c                   	dec    esp
    251a:	0d 24 04 00 00       	or     eax,0x424
    251f:	01 64 c9 00          	add    DWORD PTR [ecx+ecx*8+0x0],esp
    2523:	00 00                	add    BYTE PTR [eax],al
    2525:	02 91 64 0d 90 09    	add    dl,BYTE PTR [ecx+0x9900d64]
    252b:	00 00                	add    BYTE PTR [eax],al
    252d:	01 64 c9 00          	add    DWORD PTR [ecx+ecx*8+0x0],esp
    2531:	00 00                	add    BYTE PTR [eax],al
    2533:	02 91 60 0d 74 04    	add    dl,BYTE PTR [ecx+0x4740d60]
    2539:	00 00                	add    BYTE PTR [eax],al
    253b:	01 65 f7             	add    DWORD PTR [ebp-0x9],esp
    253e:	00 00                	add    BYTE PTR [eax],al
    2540:	00 02                	add    BYTE PTR [edx],al
    2542:	91                   	xchg   ecx,eax
    2543:	50                   	push   eax
    2544:	0d 87 09 00 00       	or     eax,0x987
    2549:	01 66 c9             	add    DWORD PTR [esi-0x37],esp
    254c:	00 00                	add    BYTE PTR [eax],al
    254e:	00 02                	add    BYTE PTR [edx],al
    2550:	91                   	xchg   ecx,eax
    2551:	5c                   	pop    esp
    2552:	11 64 73 74          	adc    DWORD PTR [ebx+esi*2+0x74],esp
    2556:	00 01                	add    BYTE PTR [ecx],al
    2558:	67 f7 00 00 00 02 91 	test   DWORD PTR [bx+si],0x91020000
    255f:	58                   	pop    eax
    2560:	00 12                	add    BYTE PTR [edx],dl
    2562:	3f                   	aas    
    2563:	00 00                	add    BYTE PTR [eax],al
    2565:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    2568:	e5 00                	in     eax,0x0
    256a:	00 00                	add    BYTE PTR [eax],al
    256c:	05 03 34 34 00       	add    eax,0x343403
    2571:	30 12                	xor    BYTE PTR [edx],dl
    2573:	aa                   	stos   BYTE PTR es:[edi],al
    2574:	00 00                	add    BYTE PTR [eax],al
    2576:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    2579:	e5 00                	in     eax,0x0
    257b:	00 00                	add    BYTE PTR [eax],al
    257d:	05 03 38 34 00       	add    eax,0x343803
    2582:	30 12                	xor    BYTE PTR [edx],dl
    2584:	56                   	push   esi
    2585:	01 00                	add    DWORD PTR [eax],eax
    2587:	00 04 35 e5 00 00 00 	add    BYTE PTR [esi*1+0xe5],al
    258e:	05 03 30 34 00       	add    eax,0x343003
    2593:	30 12                	xor    BYTE PTR [edx],dl
    2595:	48                   	dec    eax
    2596:	00 00                	add    BYTE PTR [eax],al
    2598:	00 05 36 0c 01 00    	add    BYTE PTR ds:0x10c36,al
    259e:	00 05 03 3c 34 00    	add    BYTE PTR ds:0x343c03,al
    25a4:	30 12                	xor    BYTE PTR [edx],dl
    25a6:	70 09                	jo     25b1 <sysEnter_Vector-0x12da4f>
    25a8:	00 00                	add    BYTE PTR [eax],al
    25aa:	01 0c c9             	add    DWORD PTR [ecx+ecx*8],ecx
    25ad:	00 00                	add    BYTE PTR [eax],al
    25af:	00 05 03 a4 32 00    	add    BYTE PTR ds:0x32a403,al
    25b5:	30 12                	xor    BYTE PTR [edx],dl
    25b7:	0b 09                	or     ecx,DWORD PTR [ecx]
    25b9:	00 00                	add    BYTE PTR [eax],al
    25bb:	01 0d f7 00 00 00    	add    DWORD PTR ds:0xf7,ecx
    25c1:	05 03 5c 34 00       	add    eax,0x345c03
    25c6:	30 13                	xor    BYTE PTR [ebx],dl
    25c8:	c0 01 00             	rol    BYTE PTR [ecx],0x0
    25cb:	00 ff                	add    bh,bh
    25cd:	03 00                	add    eax,DWORD PTR [eax]
    25cf:	00 14 b9             	add    BYTE PTR [ecx+edi*4],dl
    25d2:	01 00                	add    DWORD PTR [eax],eax
    25d4:	00 01                	add    BYTE PTR [ecx],al
    25d6:	00 12                	add    BYTE PTR [edx],dl
    25d8:	3e 09 00             	or     DWORD PTR ds:[eax],eax
    25db:	00 01                	add    BYTE PTR [ecx],al
    25dd:	0e                   	push   cs
    25de:	ef                   	out    dx,eax
    25df:	03 00                	add    eax,DWORD PTR [eax]
    25e1:	00 05 03 80 33 00    	add    BYTE PTR ds:0x338003,al
    25e7:	30 12                	xor    BYTE PTR [edx],dl
    25e9:	54                   	push   esp
    25ea:	09 00                	or     DWORD PTR [eax],eax
    25ec:	00 01                	add    BYTE PTR [ecx],al
    25ee:	0f c9                	bswap  ecx
    25f0:	00 00                	add    BYTE PTR [eax],al
    25f2:	00 05 03 60 34 00    	add    BYTE PTR ds:0x346003,al
    25f8:	30 13                	xor    BYTE PTR [ebx],dl
    25fa:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
    25fb:	01 00                	add    DWORD PTR [eax],eax
    25fd:	00 31                	add    BYTE PTR [ecx],dh
    25ff:	04 00                	add    al,0x0
    2601:	00 14 b9             	add    BYTE PTR [ecx+edi*4],dl
    2604:	01 00                	add    DWORD PTR [eax],eax
    2606:	00 06                	add    BYTE PTR [esi],al
    2608:	00 12                	add    BYTE PTR [edx],dl
    260a:	9c                   	pushf  
    260b:	09 00                	or     DWORD PTR [eax],eax
    260d:	00 01                	add    BYTE PTR [ecx],al
    260f:	11 21                	adc    DWORD PTR [ecx],esp
    2611:	04 00                	add    al,0x0
    2613:	00 05 03 88 33 00    	add    BYTE PTR ds:0x338803,al
    2619:	30 12                	xor    BYTE PTR [edx],dl
    261b:	7a 09                	jp     2626 <sysEnter_Vector-0x12d9da>
    261d:	00 00                	add    BYTE PTR [eax],al
    261f:	01 16                	add    DWORD PTR [esi],edx
    2621:	21 04 00             	and    DWORD PTR [eax+eax*1],eax
    2624:	00 05 03 a4 33 00    	add    BYTE PTR ds:0x33a403,al
    262a:	30 13                	xor    BYTE PTR [ebx],dl
    262c:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
    262d:	01 00                	add    DWORD PTR [eax],eax
    262f:	00 63 04             	add    BYTE PTR [ebx+0x4],ah
    2632:	00 00                	add    BYTE PTR [eax],al
    2634:	14 b9                	adc    al,0xb9
    2636:	01 00                	add    DWORD PTR [eax],eax
    2638:	00 0b                	add    BYTE PTR [ebx],cl
    263a:	00 12                	add    BYTE PTR [edx],dl
    263c:	46                   	inc    esi
    263d:	09 00                	or     DWORD PTR [eax],eax
    263f:	00 01                	add    BYTE PTR [ecx],al
    2641:	1b 53 04             	sbb    edx,DWORD PTR [ebx+0x4]
    2644:	00 00                	add    BYTE PTR [eax],al
    2646:	05 03 c0 33 00       	add    eax,0x33c003
    264b:	30 12                	xor    BYTE PTR [edx],dl
    264d:	2f                   	das    
    264e:	09 00                	or     DWORD PTR [eax],eax
    2650:	00 01                	add    BYTE PTR [ecx],al
    2652:	22 53 04             	and    dl,BYTE PTR [ebx+0x4]
    2655:	00 00                	add    BYTE PTR [eax],al
    2657:	05 03 00 34 00       	add    eax,0x340003
    265c:	30 13                	xor    BYTE PTR [ebx],dl
    265e:	c9                   	leave  
    265f:	00 00                	add    BYTE PTR [eax],al
    2661:	00 9b 04 00 00 14    	add    BYTE PTR [ebx+0x14000004],bl
    2667:	b9 01 00 00 01       	mov    ecx,0x1000001
    266c:	14 b9                	adc    al,0xb9
    266e:	01 00                	add    DWORD PTR [eax],eax
    2670:	00 0b                	add    BYTE PTR [ebx],cl
    2672:	00 12                	add    BYTE PTR [edx],dl
    2674:	4e                   	dec    esi
    2675:	09 00                	or     DWORD PTR [eax],eax
    2677:	00 01                	add    BYTE PTR [ecx],al
    2679:	29 ac 04 00 00 05 03 	sub    DWORD PTR [esp+eax*1+0x3050000],ebp
    2680:	e0 2f                	loopne 26b1 <sysEnter_Vector-0x12d94f>
    2682:	00 30                	add    BYTE PTR [eax],dh
    2684:	0b 85 04 00 00 00    	or     eax,DWORD PTR [ebp+0x4]

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    DWORD PTR [ecx],edx
   2:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
   8:	0e                   	push   cs
   9:	1b 0e                	sbb    ecx,DWORD PTR [esi]
   b:	11 01                	adc    DWORD PTR [ecx],eax
   d:	12 06                	adc    al,BYTE PTR [esi]
   f:	10 17                	adc    BYTE PTR [edi],dl
  11:	00 00                	add    BYTE PTR [eax],al
  13:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
  16:	0b 0b                	or     ecx,DWORD PTR [ebx]
  18:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
  1b:	0e                   	push   cs
  1c:	00 00                	add    BYTE PTR [eax],al
  1e:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
  21:	0b 0b                	or     ecx,DWORD PTR [ebx]
  23:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
  26:	08 00                	or     BYTE PTR [eax],al
  28:	00 04 16             	add    BYTE PTR [esi+edx*1],al
  2b:	00 03                	add    BYTE PTR [ebx],al
  2d:	0e                   	push   cs
  2e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  30:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  32:	49                   	dec    ecx
  33:	13 00                	adc    eax,DWORD PTR [eax]
  35:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
  3b:	49                   	dec    ecx
  3c:	13 00                	adc    eax,DWORD PTR [eax]
  3e:	00 06                	add    BYTE PTR [esi],al
  40:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
  44:	00 00                	add    BYTE PTR [eax],al
  46:	07                   	pop    es
  47:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  4a:	19 03                	sbb    DWORD PTR [ebx],eax
  4c:	0e                   	push   cs
  4d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  4f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  51:	27                   	daa    
  52:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
  55:	11 01                	adc    DWORD PTR [ecx],eax
  57:	12 06                	adc    al,BYTE PTR [esi]
  59:	40                   	inc    eax
  5a:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
  60:	00 00                	add    BYTE PTR [eax],al
  62:	08 05 00 03 08 3a    	or     BYTE PTR ds:0x3a080300,al
  68:	0b 3b                	or     edi,DWORD PTR [ebx]
  6a:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  6d:	02 18                	add    bl,BYTE PTR [eax]
  6f:	00 00                	add    BYTE PTR [eax],al
  71:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
  74:	03 0e                	add    ecx,DWORD PTR [esi]
  76:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  78:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  7a:	49                   	dec    ecx
  7b:	13 3f                	adc    edi,DWORD PTR [edi]
  7d:	19 02                	sbb    DWORD PTR [edx],eax
  7f:	18 00                	sbb    BYTE PTR [eax],al
  81:	00 00                	add    BYTE PTR [eax],al
  83:	01 11                	add    DWORD PTR [ecx],edx
  85:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
  8b:	0e                   	push   cs
  8c:	1b 0e                	sbb    ecx,DWORD PTR [esi]
  8e:	11 01                	adc    DWORD PTR [ecx],eax
  90:	12 06                	adc    al,BYTE PTR [esi]
  92:	10 17                	adc    BYTE PTR [edi],dl
  94:	00 00                	add    BYTE PTR [eax],al
  96:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
  99:	0b 0b                	or     ecx,DWORD PTR [ebx]
  9b:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
  9e:	0e                   	push   cs
  9f:	00 00                	add    BYTE PTR [eax],al
  a1:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
  a4:	0b 0b                	or     ecx,DWORD PTR [ebx]
  a6:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
  a9:	08 00                	or     BYTE PTR [eax],al
  ab:	00 04 16             	add    BYTE PTR [esi+edx*1],al
  ae:	00 03                	add    BYTE PTR [ebx],al
  b0:	0e                   	push   cs
  b1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  b3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  b5:	49                   	dec    ecx
  b6:	13 00                	adc    eax,DWORD PTR [eax]
  b8:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
  be:	49                   	dec    ecx
  bf:	13 00                	adc    eax,DWORD PTR [eax]
  c1:	00 06                	add    BYTE PTR [esi],al
  c3:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  c6:	19 03                	sbb    DWORD PTR [ebx],eax
  c8:	0e                   	push   cs
  c9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  cb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  cd:	27                   	daa    
  ce:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
  d1:	11 01                	adc    DWORD PTR [ecx],eax
  d3:	12 06                	adc    al,BYTE PTR [esi]
  d5:	40                   	inc    eax
  d6:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
  dc:	00 00                	add    BYTE PTR [eax],al
  de:	07                   	pop    es
  df:	05 00 03 0e 3a       	add    eax,0x3a0e0300
  e4:	0b 3b                	or     edi,DWORD PTR [ebx]
  e6:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  e9:	02 18                	add    bl,BYTE PTR [eax]
  eb:	00 00                	add    BYTE PTR [eax],al
  ed:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
  f0:	03 08                	add    ecx,DWORD PTR [eax]
  f2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  f4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  f6:	49                   	dec    ecx
  f7:	13 02                	adc    eax,DWORD PTR [edx]
  f9:	18 00                	sbb    BYTE PTR [eax],al
  fb:	00 09                	add    BYTE PTR [ecx],cl
  fd:	34 00                	xor    al,0x0
  ff:	03 0e                	add    ecx,DWORD PTR [esi]
 101:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 103:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 105:	49                   	dec    ecx
 106:	13 3f                	adc    edi,DWORD PTR [edi]
 108:	19 02                	sbb    DWORD PTR [edx],eax
 10a:	18 00                	sbb    BYTE PTR [eax],al
 10c:	00 00                	add    BYTE PTR [eax],al
 10e:	01 11                	add    DWORD PTR [ecx],edx
 110:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 116:	0e                   	push   cs
 117:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 119:	11 01                	adc    DWORD PTR [ecx],eax
 11b:	12 06                	adc    al,BYTE PTR [esi]
 11d:	10 17                	adc    BYTE PTR [edi],dl
 11f:	00 00                	add    BYTE PTR [eax],al
 121:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 124:	0b 0b                	or     ecx,DWORD PTR [ebx]
 126:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 129:	0e                   	push   cs
 12a:	00 00                	add    BYTE PTR [eax],al
 12c:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 12f:	0b 0b                	or     ecx,DWORD PTR [ebx]
 131:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 134:	08 00                	or     BYTE PTR [eax],al
 136:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 139:	00 03                	add    BYTE PTR [ebx],al
 13b:	0e                   	push   cs
 13c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 13e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 140:	49                   	dec    ecx
 141:	13 00                	adc    eax,DWORD PTR [eax]
 143:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 149:	49                   	dec    ecx
 14a:	13 00                	adc    eax,DWORD PTR [eax]
 14c:	00 06                	add    BYTE PTR [esi],al
 14e:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 151:	19 03                	sbb    DWORD PTR [ebx],eax
 153:	0e                   	push   cs
 154:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 156:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 158:	27                   	daa    
 159:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 15c:	11 01                	adc    DWORD PTR [ecx],eax
 15e:	12 06                	adc    al,BYTE PTR [esi]
 160:	40                   	inc    eax
 161:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 167:	00 00                	add    BYTE PTR [eax],al
 169:	07                   	pop    es
 16a:	05 00 03 08 3a       	add    eax,0x3a080300
 16f:	0b 3b                	or     edi,DWORD PTR [ebx]
 171:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 174:	02 18                	add    bl,BYTE PTR [eax]
 176:	00 00                	add    BYTE PTR [eax],al
 178:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
 17e:	0b 3b                	or     edi,DWORD PTR [ebx]
 180:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 183:	02 18                	add    bl,BYTE PTR [eax]
 185:	00 00                	add    BYTE PTR [eax],al
 187:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
 18a:	03 0e                	add    ecx,DWORD PTR [esi]
 18c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 18e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 190:	49                   	dec    ecx
 191:	13 02                	adc    eax,DWORD PTR [edx]
 193:	18 00                	sbb    BYTE PTR [eax],al
 195:	00 0a                	add    BYTE PTR [edx],cl
 197:	34 00                	xor    al,0x0
 199:	03 08                	add    ecx,DWORD PTR [eax]
 19b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 19d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 19f:	49                   	dec    ecx
 1a0:	13 02                	adc    eax,DWORD PTR [edx]
 1a2:	18 00                	sbb    BYTE PTR [eax],al
 1a4:	00 0b                	add    BYTE PTR [ebx],cl
 1a6:	34 00                	xor    al,0x0
 1a8:	03 0e                	add    ecx,DWORD PTR [esi]
 1aa:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1ac:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1ae:	49                   	dec    ecx
 1af:	13 3f                	adc    edi,DWORD PTR [edi]
 1b1:	19 02                	sbb    DWORD PTR [edx],eax
 1b3:	18 00                	sbb    BYTE PTR [eax],al
 1b5:	00 00                	add    BYTE PTR [eax],al
 1b7:	01 11                	add    DWORD PTR [ecx],edx
 1b9:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 1bf:	0e                   	push   cs
 1c0:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 1c2:	11 01                	adc    DWORD PTR [ecx],eax
 1c4:	12 06                	adc    al,BYTE PTR [esi]
 1c6:	10 17                	adc    BYTE PTR [edi],dl
 1c8:	00 00                	add    BYTE PTR [eax],al
 1ca:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 1cd:	0b 0b                	or     ecx,DWORD PTR [ebx]
 1cf:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 1d2:	0e                   	push   cs
 1d3:	00 00                	add    BYTE PTR [eax],al
 1d5:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 1d8:	0b 0b                	or     ecx,DWORD PTR [ebx]
 1da:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 1dd:	08 00                	or     BYTE PTR [eax],al
 1df:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 1e2:	00 03                	add    BYTE PTR [ebx],al
 1e4:	0e                   	push   cs
 1e5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1e7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1e9:	49                   	dec    ecx
 1ea:	13 00                	adc    eax,DWORD PTR [eax]
 1ec:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 1f2:	49                   	dec    ecx
 1f3:	13 00                	adc    eax,DWORD PTR [eax]
 1f5:	00 06                	add    BYTE PTR [esi],al
 1f7:	04 01                	add    al,0x1
 1f9:	03 0e                	add    ecx,DWORD PTR [esi]
 1fb:	0b 0b                	or     ecx,DWORD PTR [ebx]
 1fd:	49                   	dec    ecx
 1fe:	13 3a                	adc    edi,DWORD PTR [edx]
 200:	0b 3b                	or     edi,DWORD PTR [ebx]
 202:	0b 01                	or     eax,DWORD PTR [ecx]
 204:	13 00                	adc    eax,DWORD PTR [eax]
 206:	00 07                	add    BYTE PTR [edi],al
 208:	28 00                	sub    BYTE PTR [eax],al
 20a:	03 0e                	add    ecx,DWORD PTR [esi]
 20c:	1c 0b                	sbb    al,0xb
 20e:	00 00                	add    BYTE PTR [eax],al
 210:	08 28                	or     BYTE PTR [eax],ch
 212:	00 03                	add    BYTE PTR [ebx],al
 214:	0e                   	push   cs
 215:	1c 05                	sbb    al,0x5
 217:	00 00                	add    BYTE PTR [eax],al
 219:	09 2e                	or     DWORD PTR [esi],ebp
 21b:	01 3f                	add    DWORD PTR [edi],edi
 21d:	19 03                	sbb    DWORD PTR [ebx],eax
 21f:	0e                   	push   cs
 220:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 222:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 224:	27                   	daa    
 225:	19 11                	sbb    DWORD PTR [ecx],edx
 227:	01 12                	add    DWORD PTR [edx],edx
 229:	06                   	push   es
 22a:	40                   	inc    eax
 22b:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 231:	00 00                	add    BYTE PTR [eax],al
 233:	0a 05 00 03 0e 3a    	or     al,BYTE PTR ds:0x3a0e0300
 239:	0b 3b                	or     edi,DWORD PTR [ebx]
 23b:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 23e:	02 18                	add    bl,BYTE PTR [eax]
 240:	00 00                	add    BYTE PTR [eax],al
 242:	0b 05 00 03 08 3a    	or     eax,DWORD PTR ds:0x3a080300
 248:	0b 3b                	or     edi,DWORD PTR [ebx]
 24a:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 24d:	02 18                	add    bl,BYTE PTR [eax]
 24f:	00 00                	add    BYTE PTR [eax],al
 251:	0c 34                	or     al,0x34
 253:	00 03                	add    BYTE PTR [ebx],al
 255:	0e                   	push   cs
 256:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 258:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 25a:	49                   	dec    ecx
 25b:	13 02                	adc    eax,DWORD PTR [edx]
 25d:	18 00                	sbb    BYTE PTR [eax],al
 25f:	00 0d 01 01 49 13    	add    BYTE PTR ds:0x13490101,cl
 265:	01 13                	add    DWORD PTR [ebx],edx
 267:	00 00                	add    BYTE PTR [eax],al
 269:	0e                   	push   cs
 26a:	21 00                	and    DWORD PTR [eax],eax
 26c:	49                   	dec    ecx
 26d:	13 2f                	adc    ebp,DWORD PTR [edi]
 26f:	0b 00                	or     eax,DWORD PTR [eax]
 271:	00 0f                	add    BYTE PTR [edi],cl
 273:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 276:	19 03                	sbb    DWORD PTR [ebx],eax
 278:	0e                   	push   cs
 279:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 27b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 27d:	49                   	dec    ecx
 27e:	13 11                	adc    edx,DWORD PTR [ecx]
 280:	01 12                	add    DWORD PTR [edx],edx
 282:	06                   	push   es
 283:	40                   	inc    eax
 284:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 28a:	00 00                	add    BYTE PTR [eax],al
 28c:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
 28f:	03 08                	add    ecx,DWORD PTR [eax]
 291:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 293:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 295:	49                   	dec    ecx
 296:	13 02                	adc    eax,DWORD PTR [edx]
 298:	18 00                	sbb    BYTE PTR [eax],al
 29a:	00 11                	add    BYTE PTR [ecx],dl
 29c:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 29f:	19 03                	sbb    DWORD PTR [ebx],eax
 2a1:	0e                   	push   cs
 2a2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2a4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2a6:	27                   	daa    
 2a7:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 2aa:	11 01                	adc    DWORD PTR [ecx],eax
 2ac:	12 06                	adc    al,BYTE PTR [esi]
 2ae:	40                   	inc    eax
 2af:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 2b5:	00 00                	add    BYTE PTR [eax],al
 2b7:	12 0a                	adc    cl,BYTE PTR [edx]
 2b9:	00 03                	add    BYTE PTR [ebx],al
 2bb:	0e                   	push   cs
 2bc:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2be:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2c0:	11 01                	adc    DWORD PTR [ecx],eax
 2c2:	00 00                	add    BYTE PTR [eax],al
 2c4:	13 34 00             	adc    esi,DWORD PTR [eax+eax*1]
 2c7:	03 0e                	add    ecx,DWORD PTR [esi]
 2c9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2cb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2cd:	49                   	dec    ecx
 2ce:	13 3f                	adc    edi,DWORD PTR [edi]
 2d0:	19 02                	sbb    DWORD PTR [edx],eax
 2d2:	18 00                	sbb    BYTE PTR [eax],al
 2d4:	00 00                	add    BYTE PTR [eax],al
 2d6:	01 11                	add    DWORD PTR [ecx],edx
 2d8:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 2de:	0e                   	push   cs
 2df:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 2e1:	11 01                	adc    DWORD PTR [ecx],eax
 2e3:	12 06                	adc    al,BYTE PTR [esi]
 2e5:	10 17                	adc    BYTE PTR [edi],dl
 2e7:	00 00                	add    BYTE PTR [eax],al
 2e9:	02 16                	add    dl,BYTE PTR [esi]
 2eb:	00 03                	add    BYTE PTR [ebx],al
 2ed:	0e                   	push   cs
 2ee:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2f0:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2f2:	49                   	dec    ecx
 2f3:	13 00                	adc    eax,DWORD PTR [eax]
 2f5:	00 03                	add    BYTE PTR [ebx],al
 2f7:	0f 00 0b             	str    WORD PTR [ebx]
 2fa:	0b 03                	or     eax,DWORD PTR [ebx]
 2fc:	0e                   	push   cs
 2fd:	49                   	dec    ecx
 2fe:	13 00                	adc    eax,DWORD PTR [eax]
 300:	00 04 24             	add    BYTE PTR [esp],al
 303:	00 0b                	add    BYTE PTR [ebx],cl
 305:	0b 3e                	or     edi,DWORD PTR [esi]
 307:	0b 03                	or     eax,DWORD PTR [ebx]
 309:	0e                   	push   cs
 30a:	00 00                	add    BYTE PTR [eax],al
 30c:	05 24 00 0b 0b       	add    eax,0xb0b0024
 311:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 314:	08 00                	or     BYTE PTR [eax],al
 316:	00 06                	add    BYTE PTR [esi],al
 318:	13 01                	adc    eax,DWORD PTR [ecx]
 31a:	03 08                	add    ecx,DWORD PTR [eax]
 31c:	0b 0b                	or     ecx,DWORD PTR [ebx]
 31e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 320:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 322:	01 13                	add    DWORD PTR [ebx],edx
 324:	00 00                	add    BYTE PTR [eax],al
 326:	07                   	pop    es
 327:	0d 00 03 0e 3a       	or     eax,0x3a0e0300
 32c:	0b 3b                	or     edi,DWORD PTR [ebx]
 32e:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 331:	38 0b                	cmp    BYTE PTR [ebx],cl
 333:	00 00                	add    BYTE PTR [eax],al
 335:	08 0f                	or     BYTE PTR [edi],cl
 337:	00 0b                	add    BYTE PTR [ebx],cl
 339:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 33c:	00 00                	add    BYTE PTR [eax],al
 33e:	09 26                	or     DWORD PTR [esi],esp
 340:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 343:	00 00                	add    BYTE PTR [eax],al
 345:	0a 0f                	or     cl,BYTE PTR [edi]
 347:	00 0b                	add    BYTE PTR [ebx],cl
 349:	0b 00                	or     eax,DWORD PTR [eax]
 34b:	00 0b                	add    BYTE PTR [ebx],cl
 34d:	04 01                	add    al,0x1
 34f:	03 0e                	add    ecx,DWORD PTR [esi]
 351:	0b 0b                	or     ecx,DWORD PTR [ebx]
 353:	49                   	dec    ecx
 354:	13 3a                	adc    edi,DWORD PTR [edx]
 356:	0b 3b                	or     edi,DWORD PTR [ebx]
 358:	0b 01                	or     eax,DWORD PTR [ecx]
 35a:	13 00                	adc    eax,DWORD PTR [eax]
 35c:	00 0c 28             	add    BYTE PTR [eax+ebp*1],cl
 35f:	00 03                	add    BYTE PTR [ebx],al
 361:	0e                   	push   cs
 362:	1c 0b                	sbb    al,0xb
 364:	00 00                	add    BYTE PTR [eax],al
 366:	0d 28 00 03 0e       	or     eax,0xe030028
 36b:	1c 05                	sbb    al,0x5
 36d:	00 00                	add    BYTE PTR [eax],al
 36f:	0e                   	push   cs
 370:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 373:	19 03                	sbb    DWORD PTR [ebx],eax
 375:	0e                   	push   cs
 376:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 378:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 37a:	27                   	daa    
 37b:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 37e:	11 01                	adc    DWORD PTR [ecx],eax
 380:	12 06                	adc    al,BYTE PTR [esi]
 382:	40                   	inc    eax
 383:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 389:	00 00                	add    BYTE PTR [eax],al
 38b:	0f 05                	syscall 
 38d:	00 03                	add    BYTE PTR [ebx],al
 38f:	0e                   	push   cs
 390:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 392:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 394:	49                   	dec    ecx
 395:	13 02                	adc    eax,DWORD PTR [edx]
 397:	18 00                	sbb    BYTE PTR [eax],al
 399:	00 10                	add    BYTE PTR [eax],dl
 39b:	34 00                	xor    al,0x0
 39d:	03 0e                	add    ecx,DWORD PTR [esi]
 39f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3a1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 3a3:	49                   	dec    ecx
 3a4:	13 02                	adc    eax,DWORD PTR [edx]
 3a6:	18 00                	sbb    BYTE PTR [eax],al
 3a8:	00 11                	add    BYTE PTR [ecx],dl
 3aa:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
 3ad:	19 03                	sbb    DWORD PTR [ebx],eax
 3af:	0e                   	push   cs
 3b0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3b2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 3b4:	27                   	daa    
 3b5:	19 11                	sbb    DWORD PTR [ecx],edx
 3b7:	01 12                	add    DWORD PTR [edx],edx
 3b9:	06                   	push   es
 3ba:	40                   	inc    eax
 3bb:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 3c1:	12 2e                	adc    ch,BYTE PTR [esi]
 3c3:	01 3f                	add    DWORD PTR [edi],edi
 3c5:	19 03                	sbb    DWORD PTR [ebx],eax
 3c7:	0e                   	push   cs
 3c8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3ca:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 3cc:	27                   	daa    
 3cd:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 3d0:	11 01                	adc    DWORD PTR [ecx],eax
 3d2:	12 06                	adc    al,BYTE PTR [esi]
 3d4:	40                   	inc    eax
 3d5:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 3db:	00 00                	add    BYTE PTR [eax],al
 3dd:	13 18                	adc    ebx,DWORD PTR [eax]
 3df:	00 00                	add    BYTE PTR [eax],al
 3e1:	00 14 0b             	add    BYTE PTR [ebx+ecx*1],dl
 3e4:	01 11                	add    DWORD PTR [ecx],edx
 3e6:	01 12                	add    DWORD PTR [edx],edx
 3e8:	06                   	push   es
 3e9:	00 00                	add    BYTE PTR [eax],al
 3eb:	15 34 00 03 08       	adc    eax,0x8030034
 3f0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3f2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 3f4:	49                   	dec    ecx
 3f5:	13 02                	adc    eax,DWORD PTR [edx]
 3f7:	18 00                	sbb    BYTE PTR [eax],al
 3f9:	00 16                	add    BYTE PTR [esi],dl
 3fb:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
 3fe:	19 03                	sbb    DWORD PTR [ebx],eax
 400:	0e                   	push   cs
 401:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 403:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 405:	11 01                	adc    DWORD PTR [ecx],eax
 407:	12 06                	adc    al,BYTE PTR [esi]
 409:	40                   	inc    eax
 40a:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 410:	17                   	pop    ss
 411:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 414:	19 03                	sbb    DWORD PTR [ebx],eax
 416:	0e                   	push   cs
 417:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 419:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 41b:	27                   	daa    
 41c:	19 11                	sbb    DWORD PTR [ecx],edx
 41e:	01 12                	add    DWORD PTR [edx],edx
 420:	06                   	push   es
 421:	40                   	inc    eax
 422:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 428:	00 00                	add    BYTE PTR [eax],al
 42a:	18 05 00 03 08 3a    	sbb    BYTE PTR ds:0x3a080300,al
 430:	0b 3b                	or     edi,DWORD PTR [ebx]
 432:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 435:	02 18                	add    bl,BYTE PTR [eax]
 437:	00 00                	add    BYTE PTR [eax],al
 439:	19 2e                	sbb    DWORD PTR [esi],ebp
 43b:	01 3f                	add    DWORD PTR [edi],edi
 43d:	19 03                	sbb    DWORD PTR [ebx],eax
 43f:	0e                   	push   cs
 440:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 442:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 444:	49                   	dec    ecx
 445:	13 11                	adc    edx,DWORD PTR [ecx]
 447:	01 12                	add    DWORD PTR [edx],edx
 449:	06                   	push   es
 44a:	40                   	inc    eax
 44b:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 451:	00 00                	add    BYTE PTR [eax],al
 453:	1a 34 00             	sbb    dh,BYTE PTR [eax+eax*1]
 456:	03 0e                	add    ecx,DWORD PTR [esi]
 458:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 45a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 45c:	49                   	dec    ecx
 45d:	13 3f                	adc    edi,DWORD PTR [edi]
 45f:	19 02                	sbb    DWORD PTR [edx],eax
 461:	18 00                	sbb    BYTE PTR [eax],al
 463:	00 1b                	add    BYTE PTR [ebx],bl
 465:	34 00                	xor    al,0x0
 467:	03 08                	add    ecx,DWORD PTR [eax]
 469:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 46b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 46d:	49                   	dec    ecx
 46e:	13 3f                	adc    edi,DWORD PTR [edi]
 470:	19 02                	sbb    DWORD PTR [edx],eax
 472:	18 00                	sbb    BYTE PTR [eax],al
 474:	00 00                	add    BYTE PTR [eax],al
 476:	01 11                	add    DWORD PTR [ecx],edx
 478:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 47e:	0e                   	push   cs
 47f:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 481:	11 01                	adc    DWORD PTR [ecx],eax
 483:	12 06                	adc    al,BYTE PTR [esi]
 485:	10 17                	adc    BYTE PTR [edi],dl
 487:	00 00                	add    BYTE PTR [eax],al
 489:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 48c:	0b 0b                	or     ecx,DWORD PTR [ebx]
 48e:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 491:	0e                   	push   cs
 492:	00 00                	add    BYTE PTR [eax],al
 494:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 497:	0b 0b                	or     ecx,DWORD PTR [ebx]
 499:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 49c:	08 00                	or     BYTE PTR [eax],al
 49e:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 4a1:	00 03                	add    BYTE PTR [ebx],al
 4a3:	0e                   	push   cs
 4a4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 4a6:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 4a8:	49                   	dec    ecx
 4a9:	13 00                	adc    eax,DWORD PTR [eax]
 4ab:	00 05 13 01 03 0e    	add    BYTE PTR ds:0xe030113,al
 4b1:	0b 0b                	or     ecx,DWORD PTR [ebx]
 4b3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 4b5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 4b7:	01 13                	add    DWORD PTR [ebx],edx
 4b9:	00 00                	add    BYTE PTR [eax],al
 4bb:	06                   	push   es
 4bc:	0d 00 03 0e 3a       	or     eax,0x3a0e0300
 4c1:	0b 3b                	or     edi,DWORD PTR [ebx]
 4c3:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 4c6:	38 0b                	cmp    BYTE PTR [ebx],cl
 4c8:	00 00                	add    BYTE PTR [eax],al
 4ca:	07                   	pop    es
 4cb:	0d 00 03 08 3a       	or     eax,0x3a080300
 4d0:	0b 3b                	or     edi,DWORD PTR [ebx]
 4d2:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 4d5:	38 0b                	cmp    BYTE PTR [ebx],cl
 4d7:	00 00                	add    BYTE PTR [eax],al
 4d9:	08 0f                	or     BYTE PTR [edi],cl
 4db:	00 0b                	add    BYTE PTR [ebx],cl
 4dd:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 4e0:	00 00                	add    BYTE PTR [eax],al
 4e2:	09 0f                	or     DWORD PTR [edi],ecx
 4e4:	00 0b                	add    BYTE PTR [ebx],cl
 4e6:	0b 00                	or     eax,DWORD PTR [eax]
 4e8:	00 0a                	add    BYTE PTR [edx],cl
 4ea:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
 4ed:	19 03                	sbb    DWORD PTR [ebx],eax
 4ef:	0e                   	push   cs
 4f0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 4f2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 4f4:	11 01                	adc    DWORD PTR [ecx],eax
 4f6:	12 06                	adc    al,BYTE PTR [esi]
 4f8:	40                   	inc    eax
 4f9:	18 97 42 19 00 00    	sbb    BYTE PTR [edi+0x1942],dl
 4ff:	0b 2e                	or     ebp,DWORD PTR [esi]
 501:	01 3f                	add    DWORD PTR [edi],edi
 503:	19 03                	sbb    DWORD PTR [ebx],eax
 505:	0e                   	push   cs
 506:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 508:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 50a:	27                   	daa    
 50b:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 50e:	11 01                	adc    DWORD PTR [ecx],eax
 510:	12 06                	adc    al,BYTE PTR [esi]
 512:	40                   	inc    eax
 513:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 519:	00 00                	add    BYTE PTR [eax],al
 51b:	0c 05                	or     al,0x5
 51d:	00 03                	add    BYTE PTR [ebx],al
 51f:	0e                   	push   cs
 520:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 522:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 524:	49                   	dec    ecx
 525:	13 02                	adc    eax,DWORD PTR [edx]
 527:	18 00                	sbb    BYTE PTR [eax],al
 529:	00 0d 34 00 03 0e    	add    BYTE PTR ds:0xe030034,cl
 52f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 531:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 533:	49                   	dec    ecx
 534:	13 02                	adc    eax,DWORD PTR [edx]
 536:	18 00                	sbb    BYTE PTR [eax],al
 538:	00 0e                	add    BYTE PTR [esi],cl
 53a:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 53d:	19 03                	sbb    DWORD PTR [ebx],eax
 53f:	0e                   	push   cs
 540:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 542:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 544:	27                   	daa    
 545:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 548:	11 01                	adc    DWORD PTR [ecx],eax
 54a:	12 06                	adc    al,BYTE PTR [esi]
 54c:	40                   	inc    eax
 54d:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 553:	00 00                	add    BYTE PTR [eax],al
 555:	0f 2e 01             	ucomiss xmm0,DWORD PTR [ecx]
 558:	3f                   	aas    
 559:	19 03                	sbb    DWORD PTR [ebx],eax
 55b:	0e                   	push   cs
 55c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 55e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 560:	27                   	daa    
 561:	19 11                	sbb    DWORD PTR [ecx],edx
 563:	01 12                	add    DWORD PTR [edx],edx
 565:	06                   	push   es
 566:	40                   	inc    eax
 567:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 56d:	00 00                	add    BYTE PTR [eax],al
 56f:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
 572:	03 08                	add    ecx,DWORD PTR [eax]
 574:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 576:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 578:	49                   	dec    ecx
 579:	13 02                	adc    eax,DWORD PTR [edx]
 57b:	18 00                	sbb    BYTE PTR [eax],al
 57d:	00 11                	add    BYTE PTR [ecx],dl
 57f:	0a 00                	or     al,BYTE PTR [eax]
 581:	03 0e                	add    ecx,DWORD PTR [esi]
 583:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 585:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 587:	11 01                	adc    DWORD PTR [ecx],eax
 589:	00 00                	add    BYTE PTR [eax],al
 58b:	12 34 00             	adc    dh,BYTE PTR [eax+eax*1]
 58e:	03 0e                	add    ecx,DWORD PTR [esi]
 590:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 592:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 594:	49                   	dec    ecx
 595:	13 3f                	adc    edi,DWORD PTR [edi]
 597:	19 02                	sbb    DWORD PTR [edx],eax
 599:	18 00                	sbb    BYTE PTR [eax],al
 59b:	00 00                	add    BYTE PTR [eax],al
 59d:	01 11                	add    DWORD PTR [ecx],edx
 59f:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 5a5:	0e                   	push   cs
 5a6:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 5a8:	11 01                	adc    DWORD PTR [ecx],eax
 5aa:	12 06                	adc    al,BYTE PTR [esi]
 5ac:	10 17                	adc    BYTE PTR [edi],dl
 5ae:	00 00                	add    BYTE PTR [eax],al
 5b0:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 5b3:	0b 0b                	or     ecx,DWORD PTR [ebx]
 5b5:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 5b8:	0e                   	push   cs
 5b9:	00 00                	add    BYTE PTR [eax],al
 5bb:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 5be:	0b 0b                	or     ecx,DWORD PTR [ebx]
 5c0:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 5c3:	08 00                	or     BYTE PTR [eax],al
 5c5:	00 04 0f             	add    BYTE PTR [edi+ecx*1],al
 5c8:	00 0b                	add    BYTE PTR [ebx],cl
 5ca:	0b 00                	or     eax,DWORD PTR [eax]
 5cc:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 5d2:	49                   	dec    ecx
 5d3:	13 00                	adc    eax,DWORD PTR [eax]
 5d5:	00 06                	add    BYTE PTR [esi],al
 5d7:	16                   	push   ss
 5d8:	00 03                	add    BYTE PTR [ebx],al
 5da:	0e                   	push   cs
 5db:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 5dd:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 5df:	49                   	dec    ecx
 5e0:	13 00                	adc    eax,DWORD PTR [eax]
 5e2:	00 07                	add    BYTE PTR [edi],al
 5e4:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 5e8:	00 00                	add    BYTE PTR [eax],al
 5ea:	08 2e                	or     BYTE PTR [esi],ch
 5ec:	01 3f                	add    DWORD PTR [edi],edi
 5ee:	19 03                	sbb    DWORD PTR [ebx],eax
 5f0:	0e                   	push   cs
 5f1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 5f3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 5f5:	27                   	daa    
 5f6:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 5f9:	11 01                	adc    DWORD PTR [ecx],eax
 5fb:	12 06                	adc    al,BYTE PTR [esi]
 5fd:	40                   	inc    eax
 5fe:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 604:	00 00                	add    BYTE PTR [eax],al
 606:	09 05 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,eax
 60c:	0b 3b                	or     edi,DWORD PTR [ebx]
 60e:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 611:	02 18                	add    bl,BYTE PTR [eax]
 613:	00 00                	add    BYTE PTR [eax],al
 615:	0a 05 00 03 08 3a    	or     al,BYTE PTR ds:0x3a080300
 61b:	0b 3b                	or     edi,DWORD PTR [ebx]
 61d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 620:	02 18                	add    bl,BYTE PTR [eax]
 622:	00 00                	add    BYTE PTR [eax],al
 624:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
 627:	03 08                	add    ecx,DWORD PTR [eax]
 629:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 62b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 62d:	49                   	dec    ecx
 62e:	13 02                	adc    eax,DWORD PTR [edx]
 630:	18 00                	sbb    BYTE PTR [eax],al
 632:	00 0c 0b             	add    BYTE PTR [ebx+ecx*1],cl
 635:	01 11                	add    DWORD PTR [ecx],edx
 637:	01 12                	add    DWORD PTR [edx],edx
 639:	06                   	push   es
 63a:	01 13                	add    DWORD PTR [ebx],edx
 63c:	00 00                	add    BYTE PTR [eax],al
 63e:	0d 0b 01 11 01       	or     eax,0x111010b
 643:	12 06                	adc    al,BYTE PTR [esi]
 645:	00 00                	add    BYTE PTR [eax],al
 647:	0e                   	push   cs
 648:	26 00 00             	add    BYTE PTR es:[eax],al
 64b:	00 0f                	add    BYTE PTR [edi],cl
 64d:	34 00                	xor    al,0x0
 64f:	03 0e                	add    ecx,DWORD PTR [esi]
 651:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 653:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 655:	49                   	dec    ecx
 656:	13 3f                	adc    edi,DWORD PTR [edi]
 658:	19 02                	sbb    DWORD PTR [edx],eax
 65a:	18 00                	sbb    BYTE PTR [eax],al
 65c:	00 00                	add    BYTE PTR [eax],al
 65e:	01 11                	add    DWORD PTR [ecx],edx
 660:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 666:	0e                   	push   cs
 667:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 669:	11 01                	adc    DWORD PTR [ecx],eax
 66b:	12 06                	adc    al,BYTE PTR [esi]
 66d:	10 17                	adc    BYTE PTR [edi],dl
 66f:	00 00                	add    BYTE PTR [eax],al
 671:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 674:	0b 0b                	or     ecx,DWORD PTR [ebx]
 676:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 679:	0e                   	push   cs
 67a:	00 00                	add    BYTE PTR [eax],al
 67c:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 67f:	0b 0b                	or     ecx,DWORD PTR [ebx]
 681:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 684:	08 00                	or     BYTE PTR [eax],al
 686:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 689:	00 03                	add    BYTE PTR [ebx],al
 68b:	0e                   	push   cs
 68c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 68e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 690:	49                   	dec    ecx
 691:	13 00                	adc    eax,DWORD PTR [eax]
 693:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 699:	00 00                	add    BYTE PTR [eax],al
 69b:	06                   	push   es
 69c:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 69f:	19 03                	sbb    DWORD PTR [ebx],eax
 6a1:	0e                   	push   cs
 6a2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 6a4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 6a6:	27                   	daa    
 6a7:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 6aa:	11 01                	adc    DWORD PTR [ecx],eax
 6ac:	12 06                	adc    al,BYTE PTR [esi]
 6ae:	40                   	inc    eax
 6af:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 6b5:	00 00                	add    BYTE PTR [eax],al
 6b7:	07                   	pop    es
 6b8:	05 00 03 08 3a       	add    eax,0x3a080300
 6bd:	0b 3b                	or     edi,DWORD PTR [ebx]
 6bf:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 6c2:	02 18                	add    bl,BYTE PTR [eax]
 6c4:	00 00                	add    BYTE PTR [eax],al
 6c6:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
 6c9:	03 08                	add    ecx,DWORD PTR [eax]
 6cb:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 6cd:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 6cf:	49                   	dec    ecx
 6d0:	13 02                	adc    eax,DWORD PTR [edx]
 6d2:	18 00                	sbb    BYTE PTR [eax],al
 6d4:	00 09                	add    BYTE PTR [ecx],cl
 6d6:	34 00                	xor    al,0x0
 6d8:	03 0e                	add    ecx,DWORD PTR [esi]
 6da:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 6dc:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 6de:	49                   	dec    ecx
 6df:	13 02                	adc    eax,DWORD PTR [edx]
 6e1:	18 00                	sbb    BYTE PTR [eax],al
 6e3:	00 0a                	add    BYTE PTR [edx],cl
 6e5:	0f 00 0b             	str    WORD PTR [ebx]
 6e8:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 6eb:	00 00                	add    BYTE PTR [eax],al
 6ed:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
 6f0:	03 0e                	add    ecx,DWORD PTR [esi]
 6f2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 6f4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 6f6:	49                   	dec    ecx
 6f7:	13 3f                	adc    edi,DWORD PTR [edi]
 6f9:	19 02                	sbb    DWORD PTR [edx],eax
 6fb:	18 00                	sbb    BYTE PTR [eax],al
 6fd:	00 00                	add    BYTE PTR [eax],al
 6ff:	01 11                	add    DWORD PTR [ecx],edx
 701:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 707:	0e                   	push   cs
 708:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 70a:	11 01                	adc    DWORD PTR [ecx],eax
 70c:	12 06                	adc    al,BYTE PTR [esi]
 70e:	10 17                	adc    BYTE PTR [edi],dl
 710:	00 00                	add    BYTE PTR [eax],al
 712:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 715:	0b 0b                	or     ecx,DWORD PTR [ebx]
 717:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 71a:	08 00                	or     BYTE PTR [eax],al
 71c:	00 03                	add    BYTE PTR [ebx],al
 71e:	16                   	push   ss
 71f:	00 03                	add    BYTE PTR [ebx],al
 721:	0e                   	push   cs
 722:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 724:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 726:	49                   	dec    ecx
 727:	13 00                	adc    eax,DWORD PTR [eax]
 729:	00 04 24             	add    BYTE PTR [esp],al
 72c:	00 0b                	add    BYTE PTR [ebx],cl
 72e:	0b 3e                	or     edi,DWORD PTR [esi]
 730:	0b 03                	or     eax,DWORD PTR [ebx]
 732:	0e                   	push   cs
 733:	00 00                	add    BYTE PTR [eax],al
 735:	05 13 01 03 0e       	add    eax,0xe030113
 73a:	0b 0b                	or     ecx,DWORD PTR [ebx]
 73c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 73e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 740:	01 13                	add    DWORD PTR [ebx],edx
 742:	00 00                	add    BYTE PTR [eax],al
 744:	06                   	push   es
 745:	0d 00 03 0e 3a       	or     eax,0x3a0e0300
 74a:	0b 3b                	or     edi,DWORD PTR [ebx]
 74c:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 74f:	38 0b                	cmp    BYTE PTR [ebx],cl
 751:	00 00                	add    BYTE PTR [eax],al
 753:	07                   	pop    es
 754:	0f 00 0b             	str    WORD PTR [ebx]
 757:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 75a:	00 00                	add    BYTE PTR [eax],al
 75c:	08 0f                	or     BYTE PTR [edi],cl
 75e:	00 0b                	add    BYTE PTR [ebx],cl
 760:	0b 00                	or     eax,DWORD PTR [eax]
 762:	00 09                	add    BYTE PTR [ecx],cl
 764:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 768:	00 00                	add    BYTE PTR [eax],al
 76a:	0a 15 01 27 19 49    	or     dl,BYTE PTR ds:0x49192701
 770:	13 01                	adc    eax,DWORD PTR [ecx]
 772:	13 00                	adc    eax,DWORD PTR [eax]
 774:	00 0b                	add    BYTE PTR [ebx],cl
 776:	05 00 49 13 00       	add    eax,0x134900
 77b:	00 0c 2e             	add    BYTE PTR [esi+ebp*1],cl
 77e:	01 3f                	add    DWORD PTR [edi],edi
 780:	19 03                	sbb    DWORD PTR [ebx],eax
 782:	0e                   	push   cs
 783:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 785:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 787:	27                   	daa    
 788:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 78b:	11 01                	adc    DWORD PTR [ecx],eax
 78d:	12 06                	adc    al,BYTE PTR [esi]
 78f:	40                   	inc    eax
 790:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 796:	00 00                	add    BYTE PTR [eax],al
 798:	0d 05 00 03 0e       	or     eax,0xe030005
 79d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 79f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 7a1:	49                   	dec    ecx
 7a2:	13 02                	adc    eax,DWORD PTR [edx]
 7a4:	18 00                	sbb    BYTE PTR [eax],al
 7a6:	00 0e                	add    BYTE PTR [esi],cl
 7a8:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
 7ab:	19 03                	sbb    DWORD PTR [ebx],eax
 7ad:	0e                   	push   cs
 7ae:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 7b0:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 7b2:	11 01                	adc    DWORD PTR [ecx],eax
 7b4:	12 06                	adc    al,BYTE PTR [esi]
 7b6:	40                   	inc    eax
 7b7:	18 97 42 19 00 00    	sbb    BYTE PTR [edi+0x1942],dl
 7bd:	0f 34                	sysenter 
 7bf:	00 03                	add    BYTE PTR [ebx],al
 7c1:	0e                   	push   cs
 7c2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 7c4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 7c6:	49                   	dec    ecx
 7c7:	13 3f                	adc    edi,DWORD PTR [edi]
 7c9:	19 02                	sbb    DWORD PTR [edx],eax
 7cb:	18 00                	sbb    BYTE PTR [eax],al
 7cd:	00 00                	add    BYTE PTR [eax],al
 7cf:	01 11                	add    DWORD PTR [ecx],edx
 7d1:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 7d7:	0e                   	push   cs
 7d8:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 7da:	11 01                	adc    DWORD PTR [ecx],eax
 7dc:	12 06                	adc    al,BYTE PTR [esi]
 7de:	10 17                	adc    BYTE PTR [edi],dl
 7e0:	00 00                	add    BYTE PTR [eax],al
 7e2:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 7e5:	0b 0b                	or     ecx,DWORD PTR [ebx]
 7e7:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 7ea:	0e                   	push   cs
 7eb:	00 00                	add    BYTE PTR [eax],al
 7ed:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 7f0:	0b 0b                	or     ecx,DWORD PTR [ebx]
 7f2:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 7f5:	08 00                	or     BYTE PTR [eax],al
 7f7:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 7fa:	00 03                	add    BYTE PTR [ebx],al
 7fc:	0e                   	push   cs
 7fd:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 7ff:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 801:	49                   	dec    ecx
 802:	13 00                	adc    eax,DWORD PTR [eax]
 804:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 80a:	49                   	dec    ecx
 80b:	13 00                	adc    eax,DWORD PTR [eax]
 80d:	00 06                	add    BYTE PTR [esi],al
 80f:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 813:	00 00                	add    BYTE PTR [eax],al
 815:	07                   	pop    es
 816:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 819:	19 03                	sbb    DWORD PTR [ebx],eax
 81b:	0e                   	push   cs
 81c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 81e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 820:	27                   	daa    
 821:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 824:	11 01                	adc    DWORD PTR [ecx],eax
 826:	12 06                	adc    al,BYTE PTR [esi]
 828:	40                   	inc    eax
 829:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 82f:	00 00                	add    BYTE PTR [eax],al
 831:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
 837:	0b 3b                	or     edi,DWORD PTR [ebx]
 839:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 83c:	02 18                	add    bl,BYTE PTR [eax]
 83e:	00 00                	add    BYTE PTR [eax],al
 840:	09 05 00 03 08 3a    	or     DWORD PTR ds:0x3a080300,eax
 846:	0b 3b                	or     edi,DWORD PTR [ebx]
 848:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 84b:	02 18                	add    bl,BYTE PTR [eax]
 84d:	00 00                	add    BYTE PTR [eax],al
 84f:	0a 2e                	or     ch,BYTE PTR [esi]
 851:	01 3f                	add    DWORD PTR [edi],edi
 853:	19 03                	sbb    DWORD PTR [ebx],eax
 855:	0e                   	push   cs
 856:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 858:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 85a:	27                   	daa    
 85b:	19 11                	sbb    DWORD PTR [ecx],edx
 85d:	01 12                	add    DWORD PTR [edx],edx
 85f:	06                   	push   es
 860:	40                   	inc    eax
 861:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 867:	00 00                	add    BYTE PTR [eax],al
 869:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
 86c:	03 08                	add    ecx,DWORD PTR [eax]
 86e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 870:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 872:	49                   	dec    ecx
 873:	13 02                	adc    eax,DWORD PTR [edx]
 875:	18 00                	sbb    BYTE PTR [eax],al
 877:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
 87a:	00 03                	add    BYTE PTR [ebx],al
 87c:	0e                   	push   cs
 87d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 87f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 881:	49                   	dec    ecx
 882:	13 3f                	adc    edi,DWORD PTR [edi]
 884:	19 02                	sbb    DWORD PTR [edx],eax
 886:	18 00                	sbb    BYTE PTR [eax],al
 888:	00 00                	add    BYTE PTR [eax],al
 88a:	01 11                	add    DWORD PTR [ecx],edx
 88c:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 892:	0e                   	push   cs
 893:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 895:	11 01                	adc    DWORD PTR [ecx],eax
 897:	12 06                	adc    al,BYTE PTR [esi]
 899:	10 17                	adc    BYTE PTR [edi],dl
 89b:	00 00                	add    BYTE PTR [eax],al
 89d:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 8a0:	0b 0b                	or     ecx,DWORD PTR [ebx]
 8a2:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 8a5:	0e                   	push   cs
 8a6:	00 00                	add    BYTE PTR [eax],al
 8a8:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 8ab:	0b 0b                	or     ecx,DWORD PTR [ebx]
 8ad:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 8b0:	08 00                	or     BYTE PTR [eax],al
 8b2:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 8b5:	00 03                	add    BYTE PTR [ebx],al
 8b7:	0e                   	push   cs
 8b8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 8ba:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 8bc:	49                   	dec    ecx
 8bd:	13 00                	adc    eax,DWORD PTR [eax]
 8bf:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 8c5:	49                   	dec    ecx
 8c6:	13 00                	adc    eax,DWORD PTR [eax]
 8c8:	00 06                	add    BYTE PTR [esi],al
 8ca:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 8ce:	00 00                	add    BYTE PTR [eax],al
 8d0:	07                   	pop    es
 8d1:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 8d4:	19 03                	sbb    DWORD PTR [ebx],eax
 8d6:	0e                   	push   cs
 8d7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 8d9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 8db:	27                   	daa    
 8dc:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 8df:	11 01                	adc    DWORD PTR [ecx],eax
 8e1:	12 06                	adc    al,BYTE PTR [esi]
 8e3:	40                   	inc    eax
 8e4:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 8ea:	00 00                	add    BYTE PTR [eax],al
 8ec:	08 05 00 03 08 3a    	or     BYTE PTR ds:0x3a080300,al
 8f2:	0b 3b                	or     edi,DWORD PTR [ebx]
 8f4:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 8f7:	02 18                	add    bl,BYTE PTR [eax]
 8f9:	00 00                	add    BYTE PTR [eax],al
 8fb:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
 8fe:	03 08                	add    ecx,DWORD PTR [eax]
 900:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 902:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 904:	49                   	dec    ecx
 905:	13 02                	adc    eax,DWORD PTR [edx]
 907:	18 00                	sbb    BYTE PTR [eax],al
 909:	00 0a                	add    BYTE PTR [edx],cl
 90b:	34 00                	xor    al,0x0
 90d:	03 0e                	add    ecx,DWORD PTR [esi]
 90f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 911:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 913:	49                   	dec    ecx
 914:	13 3f                	adc    edi,DWORD PTR [edi]
 916:	19 02                	sbb    DWORD PTR [edx],eax
 918:	18 00                	sbb    BYTE PTR [eax],al
 91a:	00 00                	add    BYTE PTR [eax],al
 91c:	01 11                	add    DWORD PTR [ecx],edx
 91e:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 924:	0e                   	push   cs
 925:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 927:	11 01                	adc    DWORD PTR [ecx],eax
 929:	12 06                	adc    al,BYTE PTR [esi]
 92b:	10 17                	adc    BYTE PTR [edi],dl
 92d:	00 00                	add    BYTE PTR [eax],al
 92f:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 932:	0b 0b                	or     ecx,DWORD PTR [ebx]
 934:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 937:	0e                   	push   cs
 938:	00 00                	add    BYTE PTR [eax],al
 93a:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 93d:	0b 0b                	or     ecx,DWORD PTR [ebx]
 93f:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 942:	08 00                	or     BYTE PTR [eax],al
 944:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 947:	00 03                	add    BYTE PTR [ebx],al
 949:	0e                   	push   cs
 94a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 94c:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 94e:	49                   	dec    ecx
 94f:	13 00                	adc    eax,DWORD PTR [eax]
 951:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 957:	49                   	dec    ecx
 958:	13 00                	adc    eax,DWORD PTR [eax]
 95a:	00 06                	add    BYTE PTR [esi],al
 95c:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 960:	00 00                	add    BYTE PTR [eax],al
 962:	07                   	pop    es
 963:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 966:	19 03                	sbb    DWORD PTR [ebx],eax
 968:	0e                   	push   cs
 969:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 96b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 96d:	27                   	daa    
 96e:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 971:	11 01                	adc    DWORD PTR [ecx],eax
 973:	12 06                	adc    al,BYTE PTR [esi]
 975:	40                   	inc    eax
 976:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 97c:	00 00                	add    BYTE PTR [eax],al
 97e:	08 05 00 03 08 3a    	or     BYTE PTR ds:0x3a080300,al
 984:	0b 3b                	or     edi,DWORD PTR [ebx]
 986:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 989:	02 18                	add    bl,BYTE PTR [eax]
 98b:	00 00                	add    BYTE PTR [eax],al
 98d:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
 990:	03 08                	add    ecx,DWORD PTR [eax]
 992:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 994:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 996:	49                   	dec    ecx
 997:	13 02                	adc    eax,DWORD PTR [edx]
 999:	18 00                	sbb    BYTE PTR [eax],al
 99b:	00 0a                	add    BYTE PTR [edx],cl
 99d:	05 00 03 0e 3a       	add    eax,0x3a0e0300
 9a2:	0b 3b                	or     edi,DWORD PTR [ebx]
 9a4:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 9a7:	02 18                	add    bl,BYTE PTR [eax]
 9a9:	00 00                	add    BYTE PTR [eax],al
 9ab:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
 9ae:	03 0e                	add    ecx,DWORD PTR [esi]
 9b0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 9b2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 9b4:	49                   	dec    ecx
 9b5:	13 3f                	adc    edi,DWORD PTR [edi]
 9b7:	19 02                	sbb    DWORD PTR [edx],eax
 9b9:	18 00                	sbb    BYTE PTR [eax],al
 9bb:	00 00                	add    BYTE PTR [eax],al
 9bd:	01 11                	add    DWORD PTR [ecx],edx
 9bf:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 9c5:	0e                   	push   cs
 9c6:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 9c8:	11 01                	adc    DWORD PTR [ecx],eax
 9ca:	12 06                	adc    al,BYTE PTR [esi]
 9cc:	10 17                	adc    BYTE PTR [edi],dl
 9ce:	00 00                	add    BYTE PTR [eax],al
 9d0:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 9d3:	0b 0b                	or     ecx,DWORD PTR [ebx]
 9d5:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 9d8:	08 00                	or     BYTE PTR [eax],al
 9da:	00 03                	add    BYTE PTR [ebx],al
 9dc:	16                   	push   ss
 9dd:	00 03                	add    BYTE PTR [ebx],al
 9df:	0e                   	push   cs
 9e0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 9e2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 9e4:	49                   	dec    ecx
 9e5:	13 00                	adc    eax,DWORD PTR [eax]
 9e7:	00 04 24             	add    BYTE PTR [esp],al
 9ea:	00 0b                	add    BYTE PTR [ebx],cl
 9ec:	0b 3e                	or     edi,DWORD PTR [esi]
 9ee:	0b 03                	or     eax,DWORD PTR [ebx]
 9f0:	0e                   	push   cs
 9f1:	00 00                	add    BYTE PTR [eax],al
 9f3:	05 2e 01 3f 19       	add    eax,0x193f012e
 9f8:	03 0e                	add    ecx,DWORD PTR [esi]
 9fa:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 9fc:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 9fe:	27                   	daa    
 9ff:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 a02:	11 01                	adc    DWORD PTR [ecx],eax
 a04:	12 06                	adc    al,BYTE PTR [esi]
 a06:	40                   	inc    eax
 a07:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 a0d:	00 00                	add    BYTE PTR [eax],al
 a0f:	06                   	push   es
 a10:	05 00 03 08 3a       	add    eax,0x3a080300
 a15:	0b 3b                	or     edi,DWORD PTR [ebx]
 a17:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 a1a:	02 18                	add    bl,BYTE PTR [eax]
 a1c:	00 00                	add    BYTE PTR [eax],al
 a1e:	07                   	pop    es
 a1f:	34 00                	xor    al,0x0
 a21:	03 08                	add    ecx,DWORD PTR [eax]
 a23:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 a25:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 a27:	49                   	dec    ecx
 a28:	13 02                	adc    eax,DWORD PTR [edx]
 a2a:	18 00                	sbb    BYTE PTR [eax],al
 a2c:	00 08                	add    BYTE PTR [eax],cl
 a2e:	0f 00 0b             	str    WORD PTR [ebx]
 a31:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 a34:	00 00                	add    BYTE PTR [eax],al
 a36:	09 26                	or     DWORD PTR [esi],esp
 a38:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 a3b:	00 00                	add    BYTE PTR [eax],al
 a3d:	00 01                	add    BYTE PTR [ecx],al
 a3f:	11 01                	adc    DWORD PTR [ecx],eax
 a41:	25 0e 13 0b 03       	and    eax,0x30b130e
 a46:	0e                   	push   cs
 a47:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 a49:	11 01                	adc    DWORD PTR [ecx],eax
 a4b:	12 06                	adc    al,BYTE PTR [esi]
 a4d:	10 17                	adc    BYTE PTR [edi],dl
 a4f:	00 00                	add    BYTE PTR [eax],al
 a51:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 a54:	0b 0b                	or     ecx,DWORD PTR [ebx]
 a56:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 a59:	08 00                	or     BYTE PTR [eax],al
 a5b:	00 03                	add    BYTE PTR [ebx],al
 a5d:	16                   	push   ss
 a5e:	00 03                	add    BYTE PTR [ebx],al
 a60:	0e                   	push   cs
 a61:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 a63:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 a65:	49                   	dec    ecx
 a66:	13 00                	adc    eax,DWORD PTR [eax]
 a68:	00 04 24             	add    BYTE PTR [esp],al
 a6b:	00 0b                	add    BYTE PTR [ebx],cl
 a6d:	0b 3e                	or     edi,DWORD PTR [esi]
 a6f:	0b 03                	or     eax,DWORD PTR [ebx]
 a71:	0e                   	push   cs
 a72:	00 00                	add    BYTE PTR [eax],al
 a74:	05 2e 01 3f 19       	add    eax,0x193f012e
 a79:	03 0e                	add    ecx,DWORD PTR [esi]
 a7b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 a7d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 a7f:	27                   	daa    
 a80:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 a83:	11 01                	adc    DWORD PTR [ecx],eax
 a85:	12 06                	adc    al,BYTE PTR [esi]
 a87:	40                   	inc    eax
 a88:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 a8e:	00 00                	add    BYTE PTR [eax],al
 a90:	06                   	push   es
 a91:	05 00 03 08 3a       	add    eax,0x3a080300
 a96:	0b 3b                	or     edi,DWORD PTR [ebx]
 a98:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 a9b:	02 18                	add    bl,BYTE PTR [eax]
 a9d:	00 00                	add    BYTE PTR [eax],al
 a9f:	07                   	pop    es
 aa0:	0f 00 0b             	str    WORD PTR [ebx]
 aa3:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 aa6:	00 00                	add    BYTE PTR [eax],al
 aa8:	08 26                	or     BYTE PTR [esi],ah
 aaa:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 aad:	00 00                	add    BYTE PTR [eax],al
 aaf:	00 01                	add    BYTE PTR [ecx],al
 ab1:	11 01                	adc    DWORD PTR [ecx],eax
 ab3:	25 0e 13 0b 03       	and    eax,0x30b130e
 ab8:	0e                   	push   cs
 ab9:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 abb:	11 01                	adc    DWORD PTR [ecx],eax
 abd:	12 06                	adc    al,BYTE PTR [esi]
 abf:	10 17                	adc    BYTE PTR [edi],dl
 ac1:	00 00                	add    BYTE PTR [eax],al
 ac3:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 ac6:	0b 0b                	or     ecx,DWORD PTR [ebx]
 ac8:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 acb:	08 00                	or     BYTE PTR [eax],al
 acd:	00 03                	add    BYTE PTR [ebx],al
 acf:	16                   	push   ss
 ad0:	00 03                	add    BYTE PTR [ebx],al
 ad2:	0e                   	push   cs
 ad3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 ad5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 ad7:	49                   	dec    ecx
 ad8:	13 00                	adc    eax,DWORD PTR [eax]
 ada:	00 04 24             	add    BYTE PTR [esp],al
 add:	00 0b                	add    BYTE PTR [ebx],cl
 adf:	0b 3e                	or     edi,DWORD PTR [esi]
 ae1:	0b 03                	or     eax,DWORD PTR [ebx]
 ae3:	0e                   	push   cs
 ae4:	00 00                	add    BYTE PTR [eax],al
 ae6:	05 2e 01 3f 19       	add    eax,0x193f012e
 aeb:	03 0e                	add    ecx,DWORD PTR [esi]
 aed:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 aef:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 af1:	27                   	daa    
 af2:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 af5:	11 01                	adc    DWORD PTR [ecx],eax
 af7:	12 06                	adc    al,BYTE PTR [esi]
 af9:	40                   	inc    eax
 afa:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 b00:	00 00                	add    BYTE PTR [eax],al
 b02:	06                   	push   es
 b03:	05 00 03 08 3a       	add    eax,0x3a080300
 b08:	0b 3b                	or     edi,DWORD PTR [ebx]
 b0a:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 b0d:	02 18                	add    bl,BYTE PTR [eax]
 b0f:	00 00                	add    BYTE PTR [eax],al
 b11:	07                   	pop    es
 b12:	34 00                	xor    al,0x0
 b14:	03 08                	add    ecx,DWORD PTR [eax]
 b16:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 b18:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 b1a:	49                   	dec    ecx
 b1b:	13 02                	adc    eax,DWORD PTR [edx]
 b1d:	18 00                	sbb    BYTE PTR [eax],al
 b1f:	00 08                	add    BYTE PTR [eax],cl
 b21:	0f 00 0b             	str    WORD PTR [ebx]
 b24:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 b27:	00 00                	add    BYTE PTR [eax],al
 b29:	09 26                	or     DWORD PTR [esi],esp
 b2b:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 b2e:	00 00                	add    BYTE PTR [eax],al
 b30:	00 01                	add    BYTE PTR [ecx],al
 b32:	11 01                	adc    DWORD PTR [ecx],eax
 b34:	25 0e 13 0b 03       	and    eax,0x30b130e
 b39:	0e                   	push   cs
 b3a:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 b3c:	11 01                	adc    DWORD PTR [ecx],eax
 b3e:	12 06                	adc    al,BYTE PTR [esi]
 b40:	10 17                	adc    BYTE PTR [edi],dl
 b42:	00 00                	add    BYTE PTR [eax],al
 b44:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 b47:	0b 0b                	or     ecx,DWORD PTR [ebx]
 b49:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 b4c:	0e                   	push   cs
 b4d:	00 00                	add    BYTE PTR [eax],al
 b4f:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 b52:	0b 0b                	or     ecx,DWORD PTR [ebx]
 b54:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 b57:	08 00                	or     BYTE PTR [eax],al
 b59:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 b5c:	00 03                	add    BYTE PTR [ebx],al
 b5e:	0e                   	push   cs
 b5f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 b61:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 b63:	49                   	dec    ecx
 b64:	13 00                	adc    eax,DWORD PTR [eax]
 b66:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 b6c:	49                   	dec    ecx
 b6d:	13 00                	adc    eax,DWORD PTR [eax]
 b6f:	00 06                	add    BYTE PTR [esi],al
 b71:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 b75:	00 00                	add    BYTE PTR [eax],al
 b77:	07                   	pop    es
 b78:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 b7b:	19 03                	sbb    DWORD PTR [ebx],eax
 b7d:	0e                   	push   cs
 b7e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 b80:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 b82:	27                   	daa    
 b83:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 b86:	11 01                	adc    DWORD PTR [ecx],eax
 b88:	12 06                	adc    al,BYTE PTR [esi]
 b8a:	40                   	inc    eax
 b8b:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 b91:	00 00                	add    BYTE PTR [eax],al
 b93:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
 b99:	0b 3b                	or     edi,DWORD PTR [ebx]
 b9b:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 b9e:	02 18                	add    bl,BYTE PTR [eax]
 ba0:	00 00                	add    BYTE PTR [eax],al
 ba2:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
 ba5:	03 08                	add    ecx,DWORD PTR [eax]
 ba7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 ba9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 bab:	49                   	dec    ecx
 bac:	13 02                	adc    eax,DWORD PTR [edx]
 bae:	18 00                	sbb    BYTE PTR [eax],al
 bb0:	00 0a                	add    BYTE PTR [edx],cl
 bb2:	34 00                	xor    al,0x0
 bb4:	03 0e                	add    ecx,DWORD PTR [esi]
 bb6:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 bb8:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 bba:	49                   	dec    ecx
 bbb:	13 00                	adc    eax,DWORD PTR [eax]
 bbd:	00 0b                	add    BYTE PTR [ebx],cl
 bbf:	34 00                	xor    al,0x0
 bc1:	03 08                	add    ecx,DWORD PTR [eax]
 bc3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 bc5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 bc7:	49                   	dec    ecx
 bc8:	13 00                	adc    eax,DWORD PTR [eax]
 bca:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
 bcd:	00 03                	add    BYTE PTR [ebx],al
 bcf:	0e                   	push   cs
 bd0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 bd2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 bd4:	49                   	dec    ecx
 bd5:	13 02                	adc    eax,DWORD PTR [edx]
 bd7:	18 00                	sbb    BYTE PTR [eax],al
 bd9:	00 0d 34 00 03 0e    	add    BYTE PTR ds:0xe030034,cl
 bdf:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 be1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 be3:	49                   	dec    ecx
 be4:	13 3f                	adc    edi,DWORD PTR [edi]
 be6:	19 02                	sbb    DWORD PTR [edx],eax
 be8:	18 00                	sbb    BYTE PTR [eax],al
 bea:	00 00                	add    BYTE PTR [eax],al
 bec:	01 11                	add    DWORD PTR [ecx],edx
 bee:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 bf4:	0e                   	push   cs
 bf5:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 bf7:	11 01                	adc    DWORD PTR [ecx],eax
 bf9:	12 06                	adc    al,BYTE PTR [esi]
 bfb:	10 17                	adc    BYTE PTR [edi],dl
 bfd:	00 00                	add    BYTE PTR [eax],al
 bff:	02 2e                	add    ch,BYTE PTR [esi]
 c01:	01 3f                	add    DWORD PTR [edi],edi
 c03:	19 03                	sbb    DWORD PTR [ebx],eax
 c05:	0e                   	push   cs
 c06:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 c08:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 c0a:	27                   	daa    
 c0b:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 c0e:	11 01                	adc    DWORD PTR [ecx],eax
 c10:	12 06                	adc    al,BYTE PTR [esi]
 c12:	40                   	inc    eax
 c13:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 c19:	00 00                	add    BYTE PTR [eax],al
 c1b:	03 05 00 03 08 3a    	add    eax,DWORD PTR ds:0x3a080300
 c21:	0b 3b                	or     edi,DWORD PTR [ebx]
 c23:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 c26:	02 18                	add    bl,BYTE PTR [eax]
 c28:	00 00                	add    BYTE PTR [eax],al
 c2a:	04 0f                	add    al,0xf
 c2c:	00 0b                	add    BYTE PTR [ebx],cl
 c2e:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 c31:	00 00                	add    BYTE PTR [eax],al
 c33:	05 24 00 0b 0b       	add    eax,0xb0b0024
 c38:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 c3b:	0e                   	push   cs
 c3c:	00 00                	add    BYTE PTR [eax],al
 c3e:	06                   	push   es
 c3f:	24 00                	and    al,0x0
 c41:	0b 0b                	or     ecx,DWORD PTR [ebx]
 c43:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 c46:	08 00                	or     BYTE PTR [eax],al
 c48:	00 00                	add    BYTE PTR [eax],al
 c4a:	01 11                	add    DWORD PTR [ecx],edx
 c4c:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 c52:	0e                   	push   cs
 c53:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 c55:	11 01                	adc    DWORD PTR [ecx],eax
 c57:	12 06                	adc    al,BYTE PTR [esi]
 c59:	10 17                	adc    BYTE PTR [edi],dl
 c5b:	00 00                	add    BYTE PTR [eax],al
 c5d:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 c60:	0b 0b                	or     ecx,DWORD PTR [ebx]
 c62:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 c65:	0e                   	push   cs
 c66:	00 00                	add    BYTE PTR [eax],al
 c68:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 c6b:	0b 0b                	or     ecx,DWORD PTR [ebx]
 c6d:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 c70:	08 00                	or     BYTE PTR [eax],al
 c72:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 c75:	00 03                	add    BYTE PTR [ebx],al
 c77:	0e                   	push   cs
 c78:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 c7a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 c7c:	49                   	dec    ecx
 c7d:	13 00                	adc    eax,DWORD PTR [eax]
 c7f:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 c85:	49                   	dec    ecx
 c86:	13 00                	adc    eax,DWORD PTR [eax]
 c88:	00 06                	add    BYTE PTR [esi],al
 c8a:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 c8e:	00 00                	add    BYTE PTR [eax],al
 c90:	07                   	pop    es
 c91:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 c94:	19 03                	sbb    DWORD PTR [ebx],eax
 c96:	0e                   	push   cs
 c97:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 c99:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 c9b:	27                   	daa    
 c9c:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 c9f:	11 01                	adc    DWORD PTR [ecx],eax
 ca1:	12 06                	adc    al,BYTE PTR [esi]
 ca3:	40                   	inc    eax
 ca4:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 caa:	00 00                	add    BYTE PTR [eax],al
 cac:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
 cb2:	0b 3b                	or     edi,DWORD PTR [ebx]
 cb4:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 cb7:	02 18                	add    bl,BYTE PTR [eax]
 cb9:	00 00                	add    BYTE PTR [eax],al
 cbb:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
 cbe:	03 08                	add    ecx,DWORD PTR [eax]
 cc0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 cc2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 cc4:	49                   	dec    ecx
 cc5:	13 02                	adc    eax,DWORD PTR [edx]
 cc7:	18 00                	sbb    BYTE PTR [eax],al
 cc9:	00 0a                	add    BYTE PTR [edx],cl
 ccb:	34 00                	xor    al,0x0
 ccd:	03 0e                	add    ecx,DWORD PTR [esi]
 ccf:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 cd1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 cd3:	49                   	dec    ecx
 cd4:	13 00                	adc    eax,DWORD PTR [eax]
 cd6:	00 0b                	add    BYTE PTR [ebx],cl
 cd8:	34 00                	xor    al,0x0
 cda:	03 08                	add    ecx,DWORD PTR [eax]
 cdc:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 cde:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 ce0:	49                   	dec    ecx
 ce1:	13 00                	adc    eax,DWORD PTR [eax]
 ce3:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
 ce6:	00 03                	add    BYTE PTR [ebx],al
 ce8:	0e                   	push   cs
 ce9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 ceb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 ced:	49                   	dec    ecx
 cee:	13 3f                	adc    edi,DWORD PTR [edi]
 cf0:	19 02                	sbb    DWORD PTR [edx],eax
 cf2:	18 00                	sbb    BYTE PTR [eax],al
 cf4:	00 00                	add    BYTE PTR [eax],al
 cf6:	01 11                	add    DWORD PTR [ecx],edx
 cf8:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 cfe:	0e                   	push   cs
 cff:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 d01:	11 01                	adc    DWORD PTR [ecx],eax
 d03:	12 06                	adc    al,BYTE PTR [esi]
 d05:	10 17                	adc    BYTE PTR [edi],dl
 d07:	00 00                	add    BYTE PTR [eax],al
 d09:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 d0c:	0b 0b                	or     ecx,DWORD PTR [ebx]
 d0e:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 d11:	0e                   	push   cs
 d12:	00 00                	add    BYTE PTR [eax],al
 d14:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 d17:	0b 0b                	or     ecx,DWORD PTR [ebx]
 d19:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 d1c:	08 00                	or     BYTE PTR [eax],al
 d1e:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 d21:	00 03                	add    BYTE PTR [ebx],al
 d23:	0e                   	push   cs
 d24:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 d26:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 d28:	49                   	dec    ecx
 d29:	13 00                	adc    eax,DWORD PTR [eax]
 d2b:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 d31:	49                   	dec    ecx
 d32:	13 00                	adc    eax,DWORD PTR [eax]
 d34:	00 06                	add    BYTE PTR [esi],al
 d36:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 d39:	19 03                	sbb    DWORD PTR [ebx],eax
 d3b:	0e                   	push   cs
 d3c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 d3e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 d40:	27                   	daa    
 d41:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 d44:	11 01                	adc    DWORD PTR [ecx],eax
 d46:	12 06                	adc    al,BYTE PTR [esi]
 d48:	40                   	inc    eax
 d49:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 d4f:	00 00                	add    BYTE PTR [eax],al
 d51:	07                   	pop    es
 d52:	05 00 03 0e 3a       	add    eax,0x3a0e0300
 d57:	0b 3b                	or     edi,DWORD PTR [ebx]
 d59:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 d5c:	02 18                	add    bl,BYTE PTR [eax]
 d5e:	00 00                	add    BYTE PTR [eax],al
 d60:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
 d63:	03 0e                	add    ecx,DWORD PTR [esi]
 d65:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 d67:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 d69:	49                   	dec    ecx
 d6a:	13 02                	adc    eax,DWORD PTR [edx]
 d6c:	18 00                	sbb    BYTE PTR [eax],al
 d6e:	00 09                	add    BYTE PTR [ecx],cl
 d70:	0b 01                	or     eax,DWORD PTR [ecx]
 d72:	11 01                	adc    DWORD PTR [ecx],eax
 d74:	12 06                	adc    al,BYTE PTR [esi]
 d76:	00 00                	add    BYTE PTR [eax],al
 d78:	0a 34 00             	or     dh,BYTE PTR [eax+eax*1]
 d7b:	03 08                	add    ecx,DWORD PTR [eax]
 d7d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 d7f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 d81:	49                   	dec    ecx
 d82:	13 02                	adc    eax,DWORD PTR [edx]
 d84:	18 00                	sbb    BYTE PTR [eax],al
 d86:	00 0b                	add    BYTE PTR [ebx],cl
 d88:	34 00                	xor    al,0x0
 d8a:	03 0e                	add    ecx,DWORD PTR [esi]
 d8c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 d8e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 d90:	49                   	dec    ecx
 d91:	13 3f                	adc    edi,DWORD PTR [edi]
 d93:	19 02                	sbb    DWORD PTR [edx],eax
 d95:	18 00                	sbb    BYTE PTR [eax],al
 d97:	00 00                	add    BYTE PTR [eax],al
 d99:	01 11                	add    DWORD PTR [ecx],edx
 d9b:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 da1:	0e                   	push   cs
 da2:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 da4:	11 01                	adc    DWORD PTR [ecx],eax
 da6:	12 06                	adc    al,BYTE PTR [esi]
 da8:	10 17                	adc    BYTE PTR [edi],dl
 daa:	00 00                	add    BYTE PTR [eax],al
 dac:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 daf:	03 0e                	add    ecx,DWORD PTR [esi]
 db1:	0b 0b                	or     ecx,DWORD PTR [ebx]
 db3:	49                   	dec    ecx
 db4:	13 3a                	adc    edi,DWORD PTR [edx]
 db6:	0b 3b                	or     edi,DWORD PTR [ebx]
 db8:	0b 01                	or     eax,DWORD PTR [ecx]
 dba:	13 00                	adc    eax,DWORD PTR [eax]
 dbc:	00 03                	add    BYTE PTR [ebx],al
 dbe:	28 00                	sub    BYTE PTR [eax],al
 dc0:	03 0e                	add    ecx,DWORD PTR [esi]
 dc2:	1c 0b                	sbb    al,0xb
 dc4:	00 00                	add    BYTE PTR [eax],al
 dc6:	04 28                	add    al,0x28
 dc8:	00 03                	add    BYTE PTR [ebx],al
 dca:	0e                   	push   cs
 dcb:	1c 05                	sbb    al,0x5
 dcd:	00 00                	add    BYTE PTR [eax],al
 dcf:	05 24 00 0b 0b       	add    eax,0xb0b0024
 dd4:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 dd7:	0e                   	push   cs
 dd8:	00 00                	add    BYTE PTR [eax],al
 dda:	06                   	push   es
 ddb:	24 00                	and    al,0x0
 ddd:	0b 0b                	or     ecx,DWORD PTR [ebx]
 ddf:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 de2:	08 00                	or     BYTE PTR [eax],al
 de4:	00 07                	add    BYTE PTR [edi],al
 de6:	16                   	push   ss
 de7:	00 03                	add    BYTE PTR [ebx],al
 de9:	0e                   	push   cs
 dea:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 dec:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 dee:	49                   	dec    ecx
 def:	13 00                	adc    eax,DWORD PTR [eax]
 df1:	00 08                	add    BYTE PTR [eax],cl
 df3:	13 01                	adc    eax,DWORD PTR [ecx]
 df5:	03 08                	add    ecx,DWORD PTR [eax]
 df7:	0b 0b                	or     ecx,DWORD PTR [ebx]
 df9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 dfb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 dfd:	01 13                	add    DWORD PTR [ebx],edx
 dff:	00 00                	add    BYTE PTR [eax],al
 e01:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
 e07:	0b 3b                	or     edi,DWORD PTR [ebx]
 e09:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 e0c:	38 0b                	cmp    BYTE PTR [ebx],cl
 e0e:	00 00                	add    BYTE PTR [eax],al
 e10:	0a 0f                	or     cl,BYTE PTR [edi]
 e12:	00 0b                	add    BYTE PTR [ebx],cl
 e14:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 e17:	00 00                	add    BYTE PTR [eax],al
 e19:	0b 26                	or     esp,DWORD PTR [esi]
 e1b:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 e1e:	00 00                	add    BYTE PTR [eax],al
 e20:	0c 2e                	or     al,0x2e
 e22:	01 3f                	add    DWORD PTR [edi],edi
 e24:	19 03                	sbb    DWORD PTR [ebx],eax
 e26:	0e                   	push   cs
 e27:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 e29:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 e2b:	49                   	dec    ecx
 e2c:	13 11                	adc    edx,DWORD PTR [ecx]
 e2e:	01 12                	add    DWORD PTR [edx],edx
 e30:	06                   	push   es
 e31:	40                   	inc    eax
 e32:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 e38:	00 00                	add    BYTE PTR [eax],al
 e3a:	0d 34 00 03 0e       	or     eax,0xe030034
 e3f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 e41:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 e43:	49                   	dec    ecx
 e44:	13 02                	adc    eax,DWORD PTR [edx]
 e46:	18 00                	sbb    BYTE PTR [eax],al
 e48:	00 0e                	add    BYTE PTR [esi],cl
 e4a:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 e4d:	19 03                	sbb    DWORD PTR [ebx],eax
 e4f:	0e                   	push   cs
 e50:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 e52:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 e54:	27                   	daa    
 e55:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 e58:	11 01                	adc    DWORD PTR [ecx],eax
 e5a:	12 06                	adc    al,BYTE PTR [esi]
 e5c:	40                   	inc    eax
 e5d:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 e63:	00 00                	add    BYTE PTR [eax],al
 e65:	0f 05                	syscall 
 e67:	00 03                	add    BYTE PTR [ebx],al
 e69:	0e                   	push   cs
 e6a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 e6c:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 e6e:	49                   	dec    ecx
 e6f:	13 02                	adc    eax,DWORD PTR [edx]
 e71:	18 00                	sbb    BYTE PTR [eax],al
 e73:	00 10                	add    BYTE PTR [eax],dl
 e75:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 e78:	19 03                	sbb    DWORD PTR [ebx],eax
 e7a:	0e                   	push   cs
 e7b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 e7d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 e7f:	27                   	daa    
 e80:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 e83:	11 01                	adc    DWORD PTR [ecx],eax
 e85:	12 06                	adc    al,BYTE PTR [esi]
 e87:	40                   	inc    eax
 e88:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 e8e:	00 00                	add    BYTE PTR [eax],al
 e90:	11 34 00             	adc    DWORD PTR [eax+eax*1],esi
 e93:	03 08                	add    ecx,DWORD PTR [eax]
 e95:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 e97:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 e99:	49                   	dec    ecx
 e9a:	13 02                	adc    eax,DWORD PTR [edx]
 e9c:	18 00                	sbb    BYTE PTR [eax],al
 e9e:	00 12                	add    BYTE PTR [edx],dl
 ea0:	34 00                	xor    al,0x0
 ea2:	03 0e                	add    ecx,DWORD PTR [esi]
 ea4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 ea6:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 ea8:	49                   	dec    ecx
 ea9:	13 3f                	adc    edi,DWORD PTR [edi]
 eab:	19 02                	sbb    DWORD PTR [edx],eax
 ead:	18 00                	sbb    BYTE PTR [eax],al
 eaf:	00 13                	add    BYTE PTR [ebx],dl
 eb1:	01 01                	add    DWORD PTR [ecx],eax
 eb3:	49                   	dec    ecx
 eb4:	13 01                	adc    eax,DWORD PTR [ecx]
 eb6:	13 00                	adc    eax,DWORD PTR [eax]
 eb8:	00 14 21             	add    BYTE PTR [ecx+eiz*1],dl
 ebb:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 ebe:	2f                   	das    
 ebf:	0b 00                	or     eax,DWORD PTR [eax]
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	1c 00                	sbb    al,0x0
   2:	00 00                	add    BYTE PTR [eax],al
   4:	02 00                	add    al,BYTE PTR [eax]
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 00                	add    al,0x0
   c:	00 00                	add    BYTE PTR [eax],al
   e:	00 00                	add    BYTE PTR [eax],al
  10:	00 00                	add    BYTE PTR [eax],al
  12:	00 30                	add    BYTE PTR [eax],dh
  14:	70 00                	jo     16 <sysEnter_Vector-0x12ffea>
	...
  1e:	00 00                	add    BYTE PTR [eax],al
  20:	1c 00                	sbb    al,0x0
  22:	00 00                	add    BYTE PTR [eax],al
  24:	02 00                	add    al,BYTE PTR [eax]
  26:	57                   	push   edi
  27:	01 00                	add    DWORD PTR [eax],eax
  29:	00 04 00             	add    BYTE PTR [eax+eax*1],al
  2c:	00 00                	add    BYTE PTR [eax],al
  2e:	00 00                	add    BYTE PTR [eax],al
  30:	70 00                	jo     32 <sysEnter_Vector-0x12ffce>
  32:	00 30                	add    BYTE PTR [eax],dh
  34:	aa                   	stos   BYTE PTR es:[edi],al
	...
  3d:	00 00                	add    BYTE PTR [eax],al
  3f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  42:	00 00                	add    BYTE PTR [eax],al
  44:	02 00                	add    al,BYTE PTR [eax]
  46:	ed                   	in     eax,dx
  47:	02 00                	add    al,BYTE PTR [eax]
  49:	00 04 00             	add    BYTE PTR [eax+eax*1],al
  4c:	00 00                	add    BYTE PTR [eax],al
  4e:	00 00                	add    BYTE PTR [eax],al
  50:	1c 01                	sbb    al,0x1
  52:	00 30                	add    BYTE PTR [eax],dh
  54:	97                   	xchg   edi,eax
	...
  5d:	00 00                	add    BYTE PTR [eax],al
  5f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  62:	00 00                	add    BYTE PTR [eax],al
  64:	02 00                	add    al,BYTE PTR [eax]
  66:	26                   	es
  67:	04 00                	add    al,0x0
  69:	00 04 00             	add    BYTE PTR [eax+eax*1],al
  6c:	00 00                	add    BYTE PTR [eax],al
  6e:	00 00                	add    BYTE PTR [eax],al
  70:	b4 01                	mov    ah,0x1
  72:	00 30                	add    BYTE PTR [eax],dh
  74:	69 01 00 00 00 00    	imul   eax,DWORD PTR [ecx],0x0
  7a:	00 00                	add    BYTE PTR [eax],al
  7c:	00 00                	add    BYTE PTR [eax],al
  7e:	00 00                	add    BYTE PTR [eax],al
  80:	1c 00                	sbb    al,0x0
  82:	00 00                	add    BYTE PTR [eax],al
  84:	02 00                	add    al,BYTE PTR [eax]
  86:	99                   	cdq    
  87:	06                   	push   es
  88:	00 00                	add    BYTE PTR [eax],al
  8a:	04 00                	add    al,0x0
  8c:	00 00                	add    BYTE PTR [eax],al
  8e:	00 00                	add    BYTE PTR [eax],al
  90:	20 03                	and    BYTE PTR [ebx],al
  92:	00 30                	add    BYTE PTR [eax],dh
  94:	0a 03                	or     al,BYTE PTR [ebx]
	...
  9e:	00 00                	add    BYTE PTR [eax],al
  a0:	1c 00                	sbb    al,0x0
  a2:	00 00                	add    BYTE PTR [eax],al
  a4:	02 00                	add    al,BYTE PTR [eax]
  a6:	3c 0c                	cmp    al,0xc
  a8:	00 00                	add    BYTE PTR [eax],al
  aa:	04 00                	add    al,0x0
  ac:	00 00                	add    BYTE PTR [eax],al
  ae:	00 00                	add    BYTE PTR [eax],al
  b0:	2c 06                	sub    al,0x6
  b2:	00 30                	add    BYTE PTR [eax],dh
  b4:	f1                   	icebp  
  b5:	02 00                	add    al,BYTE PTR [eax]
	...
  bf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  c2:	00 00                	add    BYTE PTR [eax],al
  c4:	02 00                	add    al,BYTE PTR [eax]
  c6:	81 0e 00 00 04 00    	or     DWORD PTR [esi],0x40000
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	00 00                	add    BYTE PTR [eax],al
  d0:	20 09                	and    BYTE PTR [ecx],cl
  d2:	00 30                	add    BYTE PTR [eax],dh
  d4:	9b                   	fwait
  d5:	01 00                	add    DWORD PTR [eax],eax
	...
  df:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  e2:	00 00                	add    BYTE PTR [eax],al
  e4:	02 00                	add    al,BYTE PTR [eax]
  e6:	63 10                	arpl   WORD PTR [eax],dx
  e8:	00 00                	add    BYTE PTR [eax],al
  ea:	04 00                	add    al,0x0
  ec:	00 00                	add    BYTE PTR [eax],al
  ee:	00 00                	add    BYTE PTR [eax],al
  f0:	bc 0a 00 30 c7       	mov    esp,0xc730000a
	...
  fd:	00 00                	add    BYTE PTR [eax],al
  ff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 102:	00 00                	add    BYTE PTR [eax],al
 104:	02 00                	add    al,BYTE PTR [eax]
 106:	fd                   	std    
 107:	11 00                	adc    DWORD PTR [eax],eax
 109:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 10c:	00 00                	add    BYTE PTR [eax],al
 10e:	00 00                	add    BYTE PTR [eax],al
 110:	84 0b                	test   BYTE PTR [ebx],cl
 112:	00 30                	add    BYTE PTR [eax],dh
 114:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
	...
 11d:	00 00                	add    BYTE PTR [eax],al
 11f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 122:	00 00                	add    BYTE PTR [eax],al
 124:	02 00                	add    al,BYTE PTR [eax]
 126:	51                   	push   ecx
 127:	16                   	push   ss
 128:	00 00                	add    BYTE PTR [eax],al
 12a:	04 00                	add    al,0x0
 12c:	00 00                	add    BYTE PTR [eax],al
 12e:	00 00                	add    BYTE PTR [eax],al
 130:	2c 0c                	sub    al,0xc
 132:	00 30                	add    BYTE PTR [eax],dh
 134:	ad                   	lods   eax,DWORD PTR ds:[esi]
	...
 13d:	00 00                	add    BYTE PTR [eax],al
 13f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 142:	00 00                	add    BYTE PTR [eax],al
 144:	02 00                	add    al,BYTE PTR [eax]
 146:	c0 17 00             	rcl    BYTE PTR [edi],0x0
 149:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 14c:	00 00                	add    BYTE PTR [eax],al
 14e:	00 00                	add    BYTE PTR [eax],al
 150:	dc 0c 00             	fmul   QWORD PTR [eax+eax*1]
 153:	30 5e 00             	xor    BYTE PTR [esi+0x0],bl
	...
 15e:	00 00                	add    BYTE PTR [eax],al
 160:	1c 00                	sbb    al,0x0
 162:	00 00                	add    BYTE PTR [eax],al
 164:	02 00                	add    al,BYTE PTR [eax]
 166:	1e                   	push   ds
 167:	19 00                	sbb    DWORD PTR [eax],eax
 169:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 16c:	00 00                	add    BYTE PTR [eax],al
 16e:	00 00                	add    BYTE PTR [eax],al
 170:	3c 0d                	cmp    al,0xd
 172:	00 30                	add    BYTE PTR [eax],dh
 174:	87 00                	xchg   DWORD PTR [eax],eax
	...
 17e:	00 00                	add    BYTE PTR [eax],al
 180:	1c 00                	sbb    al,0x0
 182:	00 00                	add    BYTE PTR [eax],al
 184:	02 00                	add    al,BYTE PTR [eax]
 186:	9f                   	lahf   
 187:	1a 00                	sbb    al,BYTE PTR [eax]
 189:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 18c:	00 00                	add    BYTE PTR [eax],al
 18e:	00 00                	add    BYTE PTR [eax],al
 190:	c4 0d 00 30 31 00    	les    ecx,FWORD PTR ds:0x313000
	...
 19e:	00 00                	add    BYTE PTR [eax],al
 1a0:	1c 00                	sbb    al,0x0
 1a2:	00 00                	add    BYTE PTR [eax],al
 1a4:	02 00                	add    al,BYTE PTR [eax]
 1a6:	3b 1b                	cmp    ebx,DWORD PTR [ebx]
 1a8:	00 00                	add    BYTE PTR [eax],al
 1aa:	04 00                	add    al,0x0
 1ac:	00 00                	add    BYTE PTR [eax],al
 1ae:	00 00                	add    BYTE PTR [eax],al
 1b0:	f8                   	clc    
 1b1:	0d 00 30 67 00       	or     eax,0x673000
	...
 1be:	00 00                	add    BYTE PTR [eax],al
 1c0:	1c 00                	sbb    al,0x0
 1c2:	00 00                	add    BYTE PTR [eax],al
 1c4:	02 00                	add    al,BYTE PTR [eax]
 1c6:	e1 1b                	loope  1e3 <sysEnter_Vector-0x12fe1d>
 1c8:	00 00                	add    BYTE PTR [eax],al
 1ca:	04 00                	add    al,0x0
 1cc:	00 00                	add    BYTE PTR [eax],al
 1ce:	00 00                	add    BYTE PTR [eax],al
 1d0:	60                   	pusha  
 1d1:	0e                   	push   cs
 1d2:	00 30                	add    BYTE PTR [eax],dh
 1d4:	60                   	pusha  
	...
 1dd:	00 00                	add    BYTE PTR [eax],al
 1df:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 1e2:	00 00                	add    BYTE PTR [eax],al
 1e4:	02 00                	add    al,BYTE PTR [eax]
 1e6:	99                   	cdq    
 1e7:	1c 00                	sbb    al,0x0
 1e9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 1ec:	00 00                	add    BYTE PTR [eax],al
 1ee:	00 00                	add    BYTE PTR [eax],al
 1f0:	c0 0e 00             	ror    BYTE PTR [esi],0x0
 1f3:	30 7d 01             	xor    BYTE PTR [ebp+0x1],bh
	...
 1fe:	00 00                	add    BYTE PTR [eax],al
 200:	1c 00                	sbb    al,0x0
 202:	00 00                	add    BYTE PTR [eax],al
 204:	02 00                	add    al,BYTE PTR [eax]
 206:	29 1e                	sub    DWORD PTR [esi],ebx
 208:	00 00                	add    BYTE PTR [eax],al
 20a:	04 00                	add    al,0x0
 20c:	00 00                	add    BYTE PTR [eax],al
 20e:	00 00                	add    BYTE PTR [eax],al
 210:	40                   	inc    eax
 211:	10 00                	adc    BYTE PTR [eax],al
 213:	30 1d 00 00 00 00    	xor    BYTE PTR ds:0x0,bl
 219:	00 00                	add    BYTE PTR [eax],al
 21b:	00 00                	add    BYTE PTR [eax],al
 21d:	00 00                	add    BYTE PTR [eax],al
 21f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 222:	00 00                	add    BYTE PTR [eax],al
 224:	02 00                	add    al,BYTE PTR [eax]
 226:	99                   	cdq    
 227:	1e                   	push   ds
 228:	00 00                	add    BYTE PTR [eax],al
 22a:	04 00                	add    al,0x0
 22c:	00 00                	add    BYTE PTR [eax],al
 22e:	00 00                	add    BYTE PTR [eax],al
 230:	60                   	pusha  
 231:	10 00                	adc    BYTE PTR [eax],al
 233:	30 9c 01 00 00 00 00 	xor    BYTE PTR [ecx+eax*1+0x0],bl
 23a:	00 00                	add    BYTE PTR [eax],al
 23c:	00 00                	add    BYTE PTR [eax],al
 23e:	00 00                	add    BYTE PTR [eax],al
 240:	1c 00                	sbb    al,0x0
 242:	00 00                	add    BYTE PTR [eax],al
 244:	02 00                	add    al,BYTE PTR [eax]
 246:	27                   	daa    
 247:	20 00                	and    BYTE PTR [eax],al
 249:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 24c:	00 00                	add    BYTE PTR [eax],al
 24e:	00 00                	add    BYTE PTR [eax],al
 250:	fc                   	cld    
 251:	11 00                	adc    DWORD PTR [eax],eax
 253:	30 53 01             	xor    BYTE PTR [ebx+0x1],dl
	...
 25e:	00 00                	add    BYTE PTR [eax],al
 260:	1c 00                	sbb    al,0x0
 262:	00 00                	add    BYTE PTR [eax],al
 264:	02 00                	add    al,BYTE PTR [eax]
 266:	d8 21                	fsub   DWORD PTR [ecx]
 268:	00 00                	add    BYTE PTR [eax],al
 26a:	04 00                	add    al,0x0
 26c:	00 00                	add    BYTE PTR [eax],al
 26e:	00 00                	add    BYTE PTR [eax],al
 270:	50                   	push   eax
 271:	13 00                	adc    eax,DWORD PTR [eax]
 273:	30 16                	xor    BYTE PTR [esi],dl
 275:	0c 00                	or     al,0x0
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
       0:	da 00                	fiadd  DWORD PTR [eax]
       2:	00 00                	add    BYTE PTR [eax],al
       4:	02 00                	add    al,BYTE PTR [eax]
       6:	ba 00 00 00 01       	mov    edx,0x1000000
       b:	01 fb                	add    ebx,edi
       d:	0e                   	push   cs
       e:	0d 00 01 01 01       	or     eax,0x1010100
      13:	01 00                	add    DWORD PTR [eax],eax
      15:	00 00                	add    BYTE PTR [eax],al
      17:	01 00                	add    DWORD PTR [eax],eax
      19:	00 01                	add    BYTE PTR [ecx],al
      1b:	2e                   	cs
      1c:	2e                   	cs
      1d:	2f                   	das    
      1e:	2e                   	cs
      1f:	2e                   	cs
      20:	2f                   	das    
      21:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
      25:	6a 2f                	push   0x2f
      27:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
      2a:	69 73 4f 53 2f 73 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72732f53
      31:	63 2f                	arpl   WORD PTR [edi],bp
      33:	73 74                	jae    a9 <sysEnter_Vector-0x12ff57>
      35:	72 69                	jb     a0 <sysEnter_Vector-0x12ff60>
      37:	6e                   	outs   dx,BYTE PTR ds:[esi]
      38:	67 73 00             	addr16 jae 3b <sysEnter_Vector-0x12ffc5>
      3b:	2f                   	das    
      3c:	68 6f 6d 65 2f       	push   0x2f656d6f
      41:	79 6f                	jns    b2 <sysEnter_Vector-0x12ff4e>
      43:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
      4a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
      4d:	73 73                	jae    c2 <sysEnter_Vector-0x12ff3e>
      4f:	2f                   	das    
      50:	6c                   	ins    BYTE PTR es:[edi],dx
      51:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
      58:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
      5e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
      64:	78 2d                	js     93 <sysEnter_Vector-0x12ff6d>
      66:	67 6e                	outs   dx,BYTE PTR ds:[si]
      68:	75 2f                	jne    99 <sysEnter_Vector-0x12ff67>
      6a:	35 2e 33 2e 30       	xor    eax,0x302e332e
      6f:	2f                   	das    
      70:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
      77:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
      7a:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
      7e:	65 00 00             	add    BYTE PTR gs:[eax],al
      81:	73 74                	jae    f7 <sysEnter_Vector-0x12ff09>
      83:	72 63                	jb     e8 <sysEnter_Vector-0x12ff18>
      85:	68 72 2e 63 00       	push   0x632e72
      8a:	01 00                	add    DWORD PTR [eax],eax
      8c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
      8f:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
      96:	63 
      97:	2e                   	cs
      98:	68 00 02 00 00       	push   0x200
      9d:	74 69                	je     108 <sysEnter_Vector-0x12fef8>
      9f:	6d                   	ins    DWORD PTR es:[edi],dx
      a0:	65                   	gs
      a1:	2e                   	cs
      a2:	68 00 03 00 00       	push   0x300
      a7:	6d                   	ins    DWORD PTR es:[edi],dx
      a8:	61                   	popa   
      a9:	6c                   	ins    BYTE PTR es:[edi],dx
      aa:	6c                   	ins    BYTE PTR es:[edi],dx
      ab:	6f                   	outs   dx,DWORD PTR ds:[esi]
      ac:	63 2e                	arpl   WORD PTR [esi],bp
      ae:	68 00 03 00 00       	push   0x300
      b3:	6c                   	ins    BYTE PTR es:[edi],dx
      b4:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
      bb:	4f                   	dec    edi
      bc:	53                   	push   ebx
      bd:	2e                   	cs
      be:	68 00 03 00 00       	push   0x300
      c3:	00 00                	add    BYTE PTR [eax],al
      c5:	05 02 00 00 00       	add    eax,0x2
      ca:	30 1a                	xor    BYTE PTR [edx],bl
      cc:	c9                   	leave  
      cd:	2f                   	das    
      ce:	f3 72 cb             	repz jb 9c <sysEnter_Vector-0x12ff64>
      d1:	3d 31 c9 2f f3       	cmp    eax,0xf32fc931
      d6:	72 cb                	jb     a3 <sysEnter_Vector-0x12ff5d>
      d8:	3d 02 02 00 01       	cmp    eax,0x1000202
      dd:	01 0d 01 00 00 02    	add    DWORD PTR ds:0x2000001,ecx
      e3:	00 bb 00 00 00 01    	add    BYTE PTR [ebx+0x1000000],bh
      e9:	01 fb                	add    ebx,edi
      eb:	0e                   	push   cs
      ec:	0d 00 01 01 01       	or     eax,0x1010100
      f1:	01 00                	add    DWORD PTR [eax],eax
      f3:	00 00                	add    BYTE PTR [eax],al
      f5:	01 00                	add    DWORD PTR [eax],eax
      f7:	00 01                	add    BYTE PTR [ecx],al
      f9:	2e                   	cs
      fa:	2e                   	cs
      fb:	2f                   	das    
      fc:	2e                   	cs
      fd:	2e                   	cs
      fe:	2f                   	das    
      ff:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
     103:	6a 2f                	push   0x2f
     105:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
     108:	69 73 4f 53 2f 73 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72732f53
     10f:	63 2f                	arpl   WORD PTR [edi],bp
     111:	73 74                	jae    187 <sysEnter_Vector-0x12fe79>
     113:	72 69                	jb     17e <sysEnter_Vector-0x12fe82>
     115:	6e                   	outs   dx,BYTE PTR ds:[esi]
     116:	67 73 00             	addr16 jae 119 <sysEnter_Vector-0x12fee7>
     119:	2f                   	das    
     11a:	68 6f 6d 65 2f       	push   0x2f656d6f
     11f:	79 6f                	jns    190 <sysEnter_Vector-0x12fe70>
     121:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     128:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     12b:	73 73                	jae    1a0 <sysEnter_Vector-0x12fe60>
     12d:	2f                   	das    
     12e:	6c                   	ins    BYTE PTR es:[edi],dx
     12f:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     136:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     13c:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     142:	78 2d                	js     171 <sysEnter_Vector-0x12fe8f>
     144:	67 6e                	outs   dx,BYTE PTR ds:[si]
     146:	75 2f                	jne    177 <sysEnter_Vector-0x12fe89>
     148:	35 2e 33 2e 30       	xor    eax,0x302e332e
     14d:	2f                   	das    
     14e:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     155:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     158:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     15c:	65 00 00             	add    BYTE PTR gs:[eax],al
     15f:	73 74                	jae    1d5 <sysEnter_Vector-0x12fe2b>
     161:	72 63                	jb     1c6 <sysEnter_Vector-0x12fe3a>
     163:	73 70                	jae    1d5 <sysEnter_Vector-0x12fe2b>
     165:	6e                   	outs   dx,BYTE PTR ds:[esi]
     166:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     169:	01 00                	add    DWORD PTR [eax],eax
     16b:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     16e:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     175:	63 
     176:	2e                   	cs
     177:	68 00 02 00 00       	push   0x200
     17c:	74 69                	je     1e7 <sysEnter_Vector-0x12fe19>
     17e:	6d                   	ins    DWORD PTR es:[edi],dx
     17f:	65                   	gs
     180:	2e                   	cs
     181:	68 00 03 00 00       	push   0x300
     186:	6d                   	ins    DWORD PTR es:[edi],dx
     187:	61                   	popa   
     188:	6c                   	ins    BYTE PTR es:[edi],dx
     189:	6c                   	ins    BYTE PTR es:[edi],dx
     18a:	6f                   	outs   dx,DWORD PTR ds:[esi]
     18b:	63 2e                	arpl   WORD PTR [esi],bp
     18d:	68 00 03 00 00       	push   0x300
     192:	6c                   	ins    BYTE PTR es:[edi],dx
     193:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     19a:	4f                   	dec    edi
     19b:	53                   	push   ebx
     19c:	2e                   	cs
     19d:	68 00 03 00 00       	push   0x300
     1a2:	00 00                	add    BYTE PTR [eax],al
     1a4:	05 02 70 00 00       	add    eax,0x7002
     1a9:	30 03                	xor    BYTE PTR [ebx],al
     1ab:	25 01 e7 9f 59       	and    eax,0x599fe701
     1b0:	75 00                	jne    1b2 <sysEnter_Vector-0x12fe4e>
     1b2:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
     1b5:	aa                   	stos   BYTE PTR es:[edi],al
     1b6:	00 02                	add    BYTE PTR [edx],al
     1b8:	04 01                	add    al,0x1
     1ba:	06                   	push   es
     1bb:	3c 00                	cmp    al,0x0
     1bd:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
     1c0:	06                   	push   es
     1c1:	73 00                	jae    1c3 <sysEnter_Vector-0x12fe3d>
     1c3:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     1c6:	06                   	push   es
     1c7:	82                   	(bad)  
     1c8:	06                   	push   es
     1c9:	6d                   	ins    DWORD PTR es:[edi],dx
     1ca:	91                   	xchg   ecx,eax
     1cb:	4d                   	dec    ebp
     1cc:	e7 9f                	out    0x9f,eax
     1ce:	59                   	pop    ecx
     1cf:	75 00                	jne    1d1 <sysEnter_Vector-0x12fe2f>
     1d1:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
     1d4:	aa                   	stos   BYTE PTR es:[edi],al
     1d5:	00 02                	add    BYTE PTR [edx],al
     1d7:	04 01                	add    al,0x1
     1d9:	06                   	push   es
     1da:	3c 00                	cmp    al,0x0
     1dc:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
     1df:	06                   	push   es
     1e0:	73 00                	jae    1e2 <sysEnter_Vector-0x12fe1e>
     1e2:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     1e5:	06                   	push   es
     1e6:	82                   	(bad)  
     1e7:	06                   	push   es
     1e8:	6d                   	ins    DWORD PTR es:[edi],dx
     1e9:	91                   	xchg   ecx,eax
     1ea:	02 04 00             	add    al,BYTE PTR [eax+eax*1]
     1ed:	01 01                	add    DWORD PTR [ecx],eax
     1ef:	de 00                	fiadd  WORD PTR [eax]
     1f1:	00 00                	add    BYTE PTR [eax],al
     1f3:	02 00                	add    al,BYTE PTR [eax]
     1f5:	ba 00 00 00 01       	mov    edx,0x1000000
     1fa:	01 fb                	add    ebx,edi
     1fc:	0e                   	push   cs
     1fd:	0d 00 01 01 01       	or     eax,0x1010100
     202:	01 00                	add    DWORD PTR [eax],eax
     204:	00 00                	add    BYTE PTR [eax],al
     206:	01 00                	add    DWORD PTR [eax],eax
     208:	00 01                	add    BYTE PTR [ecx],al
     20a:	2e                   	cs
     20b:	2e                   	cs
     20c:	2f                   	das    
     20d:	2e                   	cs
     20e:	2e                   	cs
     20f:	2f                   	das    
     210:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
     214:	6a 2f                	push   0x2f
     216:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
     219:	69 73 4f 53 2f 73 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72732f53
     220:	63 2f                	arpl   WORD PTR [edi],bp
     222:	73 74                	jae    298 <sysEnter_Vector-0x12fd68>
     224:	72 69                	jb     28f <sysEnter_Vector-0x12fd71>
     226:	6e                   	outs   dx,BYTE PTR ds:[esi]
     227:	67 73 00             	addr16 jae 22a <sysEnter_Vector-0x12fdd6>
     22a:	2f                   	das    
     22b:	68 6f 6d 65 2f       	push   0x2f656d6f
     230:	79 6f                	jns    2a1 <sysEnter_Vector-0x12fd5f>
     232:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     239:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     23c:	73 73                	jae    2b1 <sysEnter_Vector-0x12fd4f>
     23e:	2f                   	das    
     23f:	6c                   	ins    BYTE PTR es:[edi],dx
     240:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     247:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     24d:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     253:	78 2d                	js     282 <sysEnter_Vector-0x12fd7e>
     255:	67 6e                	outs   dx,BYTE PTR ds:[si]
     257:	75 2f                	jne    288 <sysEnter_Vector-0x12fd78>
     259:	35 2e 33 2e 30       	xor    eax,0x302e332e
     25e:	2f                   	das    
     25f:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     266:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     269:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     26d:	65 00 00             	add    BYTE PTR gs:[eax],al
     270:	73 74                	jae    2e6 <sysEnter_Vector-0x12fd1a>
     272:	72 74                	jb     2e8 <sysEnter_Vector-0x12fd18>
     274:	6f                   	outs   dx,DWORD PTR ds:[esi]
     275:	6b 2e 63             	imul   ebp,DWORD PTR [esi],0x63
     278:	00 01                	add    BYTE PTR [ecx],al
     27a:	00 00                	add    BYTE PTR [eax],al
     27c:	73 74                	jae    2f2 <sysEnter_Vector-0x12fd0e>
     27e:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     285:	63 
     286:	2e                   	cs
     287:	68 00 02 00 00       	push   0x200
     28c:	74 69                	je     2f7 <sysEnter_Vector-0x12fd09>
     28e:	6d                   	ins    DWORD PTR es:[edi],dx
     28f:	65                   	gs
     290:	2e                   	cs
     291:	68 00 03 00 00       	push   0x300
     296:	6d                   	ins    DWORD PTR es:[edi],dx
     297:	61                   	popa   
     298:	6c                   	ins    BYTE PTR es:[edi],dx
     299:	6c                   	ins    BYTE PTR es:[edi],dx
     29a:	6f                   	outs   dx,DWORD PTR ds:[esi]
     29b:	63 2e                	arpl   WORD PTR [esi],bp
     29d:	68 00 03 00 00       	push   0x300
     2a2:	6c                   	ins    BYTE PTR es:[edi],dx
     2a3:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     2aa:	4f                   	dec    edi
     2ab:	53                   	push   ebx
     2ac:	2e                   	cs
     2ad:	68 00 03 00 00       	push   0x300
     2b2:	00 00                	add    BYTE PTR [eax],al
     2b4:	05 02 1c 01 00       	add    eax,0x11c02
     2b9:	30 03                	xor    BYTE PTR [ebx],al
     2bb:	28 01                	sub    BYTE PTR [ecx],al
     2bd:	f6 67 92             	mul    BYTE PTR [edi-0x6e]
     2c0:	08 2f                	or     BYTE PTR [edi],ch
     2c2:	75 08                	jne    2cc <sysEnter_Vector-0x12fd34>
     2c4:	2f                   	das    
     2c5:	4b                   	dec    ebx
     2c6:	08 c9                	or     cl,cl
     2c8:	c9                   	leave  
     2c9:	08 21                	or     BYTE PTR [ecx],ah
     2cb:	3d 02 07 00 01       	cmp    eax,0x1000702
     2d0:	01 27                	add    DWORD PTR [edi],esp
     2d2:	01 00                	add    DWORD PTR [eax],eax
     2d4:	00 02                	add    BYTE PTR [edx],al
     2d6:	00 d3                	add    bl,dl
     2d8:	00 00                	add    BYTE PTR [eax],al
     2da:	00 01                	add    BYTE PTR [ecx],al
     2dc:	01 fb                	add    ebx,edi
     2de:	0e                   	push   cs
     2df:	0d 00 01 01 01       	or     eax,0x1010100
     2e4:	01 00                	add    DWORD PTR [eax],eax
     2e6:	00 00                	add    BYTE PTR [eax],al
     2e8:	01 00                	add    DWORD PTR [eax],eax
     2ea:	00 01                	add    BYTE PTR [ecx],al
     2ec:	73 72                	jae    360 <sysEnter_Vector-0x12fca0>
     2ee:	63 2f                	arpl   WORD PTR [edi],bp
     2f0:	69 6e 70 75 74 00 2f 	imul   ebp,DWORD PTR [esi+0x70],0x2f007475
     2f7:	68 6f 6d 65 2f       	push   0x2f656d6f
     2fc:	79 6f                	jns    36d <sysEnter_Vector-0x12fc93>
     2fe:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     305:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     308:	73 73                	jae    37d <sysEnter_Vector-0x12fc83>
     30a:	2f                   	das    
     30b:	6c                   	ins    BYTE PTR es:[edi],dx
     30c:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     313:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     319:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     31f:	78 2d                	js     34e <sysEnter_Vector-0x12fcb2>
     321:	67 6e                	outs   dx,BYTE PTR ds:[si]
     323:	75 2f                	jne    354 <sysEnter_Vector-0x12fcac>
     325:	35 2e 33 2e 30       	xor    eax,0x302e332e
     32a:	2f                   	das    
     32b:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     332:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     335:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     339:	65 00 2e             	add    BYTE PTR gs:[esi],ch
     33c:	2e                   	cs
     33d:	2f                   	das    
     33e:	2e                   	cs
     33f:	2e                   	cs
     340:	2f                   	das    
     341:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
     345:	6a 2f                	push   0x2f
     347:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
     34a:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
     351:	6e                   	outs   dx,BYTE PTR ds:[esi]
     352:	65                   	gs
     353:	6c                   	ins    BYTE PTR es:[edi],dx
     354:	2f                   	das    
     355:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     35c:	00 00                	add    BYTE PTR [eax],al
     35e:	69 6e 70 75 74 2e 63 	imul   ebp,DWORD PTR [esi+0x70],0x632e7475
     365:	00 01                	add    BYTE PTR [ecx],al
     367:	00 00                	add    BYTE PTR [eax],al
     369:	73 74                	jae    3df <sysEnter_Vector-0x12fc21>
     36b:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     372:	63 
     373:	2e                   	cs
     374:	68 00 02 00 00       	push   0x200
     379:	74 69                	je     3e4 <sysEnter_Vector-0x12fc1c>
     37b:	6d                   	ins    DWORD PTR es:[edi],dx
     37c:	65                   	gs
     37d:	2e                   	cs
     37e:	68 00 03 00 00       	push   0x300
     383:	6d                   	ins    DWORD PTR es:[edi],dx
     384:	61                   	popa   
     385:	6c                   	ins    BYTE PTR es:[edi],dx
     386:	6c                   	ins    BYTE PTR es:[edi],dx
     387:	6f                   	outs   dx,DWORD PTR ds:[esi]
     388:	63 2e                	arpl   WORD PTR [esi],bp
     38a:	68 00 03 00 00       	push   0x300
     38f:	6c                   	ins    BYTE PTR es:[edi],dx
     390:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     397:	4f                   	dec    edi
     398:	53                   	push   ebx
     399:	2e                   	cs
     39a:	68 00 03 00 00       	push   0x300
     39f:	73 79                	jae    41a <sysEnter_Vector-0x12fbe6>
     3a1:	73 63                	jae    406 <sysEnter_Vector-0x12fbfa>
     3a3:	61                   	popa   
     3a4:	6c                   	ins    BYTE PTR es:[edi],dx
     3a5:	6c                   	ins    BYTE PTR es:[edi],dx
     3a6:	73 2e                	jae    3d6 <sysEnter_Vector-0x12fc2a>
     3a8:	68 00 04 00 00       	push   0x400
     3ad:	00 00                	add    BYTE PTR [eax],al
     3af:	05 02 b4 01 00       	add    eax,0x1b402
     3b4:	30 03                	xor    BYTE PTR [ebx],al
     3b6:	0f 01                	(bad)  
     3b8:	d7                   	xlat   BYTE PTR ds:[ebx]
     3b9:	08 3d 4d 08 67 68    	or     BYTE PTR ds:0x6867084d,bh
     3bf:	75 4b                	jne    40c <sysEnter_Vector-0x12fbf4>
     3c1:	08 3d 77 08 14 08    	or     BYTE PTR ds:0x8140877,bh
     3c7:	3d 4b 69 08 14       	cmp    eax,0x1408694b
     3cc:	75 84                	jne    352 <sysEnter_Vector-0x12fcae>
     3ce:	68 00 02 04 01       	push   0x1040200
     3d3:	08 67 33             	or     BYTE PTR [edi+0x33],ah
     3d6:	08 3d 00 02 04 01    	or     BYTE PTR ds:0x1040200,bh
     3dc:	06                   	push   es
     3dd:	66 06                	pushw  es
     3df:	68 ad 68 68 75       	push   0x756868ad
     3e4:	08 3d 08 5a 00 02    	or     BYTE PTR ds:0x2005a08,bh
     3ea:	04 01                	add    al,0x1
     3ec:	06                   	push   es
     3ed:	ac                   	lods   al,BYTE PTR ds:[esi]
     3ee:	06                   	push   es
     3ef:	68 5b 00 02 04       	push   0x402005b
     3f4:	02 a0 59 02 05 00    	add    ah,BYTE PTR [eax+0x50259]
     3fa:	01 01                	add    DWORD PTR [ecx],eax
     3fc:	4c                   	dec    esp
     3fd:	01 00                	add    DWORD PTR [eax],eax
     3ff:	00 02                	add    BYTE PTR [edx],al
     401:	00 de                	add    dh,bl
     403:	00 00                	add    BYTE PTR [eax],al
     405:	00 01                	add    BYTE PTR [ecx],al
     407:	01 fb                	add    ebx,edi
     409:	0e                   	push   cs
     40a:	0d 00 01 01 01       	or     eax,0x1010100
     40f:	01 00                	add    DWORD PTR [eax],eax
     411:	00 00                	add    BYTE PTR [eax],al
     413:	01 00                	add    DWORD PTR [eax],eax
     415:	00 01                	add    BYTE PTR [ecx],al
     417:	73 72                	jae    48b <sysEnter_Vector-0x12fb75>
     419:	63 00                	arpl   WORD PTR [eax],ax
     41b:	2f                   	das    
     41c:	68 6f 6d 65 2f       	push   0x2f656d6f
     421:	79 6f                	jns    492 <sysEnter_Vector-0x12fb6e>
     423:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     42a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     42d:	73 73                	jae    4a2 <sysEnter_Vector-0x12fb5e>
     42f:	2f                   	das    
     430:	6c                   	ins    BYTE PTR es:[edi],dx
     431:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     438:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     43e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     444:	78 2d                	js     473 <sysEnter_Vector-0x12fb8d>
     446:	67 6e                	outs   dx,BYTE PTR ds:[si]
     448:	75 2f                	jne    479 <sysEnter_Vector-0x12fb87>
     44a:	35 2e 33 2e 30       	xor    eax,0x302e332e
     44f:	2f                   	das    
     450:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     457:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     45a:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     45e:	65 00 2e             	add    BYTE PTR gs:[esi],ch
     461:	2e                   	cs
     462:	2f                   	das    
     463:	2e                   	cs
     464:	2e                   	cs
     465:	2f                   	das    
     466:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
     46a:	6a 2f                	push   0x2f
     46c:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
     46f:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
     476:	6e                   	outs   dx,BYTE PTR ds:[esi]
     477:	65                   	gs
     478:	6c                   	ins    BYTE PTR es:[edi],dx
     479:	2f                   	das    
     47a:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     481:	00 00                	add    BYTE PTR [eax],al
     483:	6c                   	ins    BYTE PTR es:[edi],dx
     484:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     48b:	4f                   	dec    edi
     48c:	53                   	push   ebx
     48d:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     490:	01 00                	add    DWORD PTR [eax],eax
     492:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     495:	64                   	fs
     496:	61                   	popa   
     497:	72 67                	jb     500 <sysEnter_Vector-0x12fb00>
     499:	2e                   	cs
     49a:	68 00 02 00 00       	push   0x200
     49f:	73 74                	jae    515 <sysEnter_Vector-0x12faeb>
     4a1:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     4a8:	63 
     4a9:	2e                   	cs
     4aa:	68 00 02 00 00       	push   0x200
     4af:	74 69                	je     51a <sysEnter_Vector-0x12fae6>
     4b1:	6d                   	ins    DWORD PTR es:[edi],dx
     4b2:	65                   	gs
     4b3:	2e                   	cs
     4b4:	68 00 03 00 00       	push   0x300
     4b9:	6d                   	ins    DWORD PTR es:[edi],dx
     4ba:	61                   	popa   
     4bb:	6c                   	ins    BYTE PTR es:[edi],dx
     4bc:	6c                   	ins    BYTE PTR es:[edi],dx
     4bd:	6f                   	outs   dx,DWORD PTR ds:[esi]
     4be:	63 2e                	arpl   WORD PTR [esi],bp
     4c0:	68 00 03 00 00       	push   0x300
     4c5:	6c                   	ins    BYTE PTR es:[edi],dx
     4c6:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     4cd:	4f                   	dec    edi
     4ce:	53                   	push   ebx
     4cf:	2e                   	cs
     4d0:	68 00 03 00 00       	push   0x300
     4d5:	73 79                	jae    550 <sysEnter_Vector-0x12fab0>
     4d7:	73 63                	jae    53c <sysEnter_Vector-0x12fac4>
     4d9:	61                   	popa   
     4da:	6c                   	ins    BYTE PTR es:[edi],dx
     4db:	6c                   	ins    BYTE PTR es:[edi],dx
     4dc:	73 2e                	jae    50c <sysEnter_Vector-0x12faf4>
     4de:	68 00 04 00 00       	push   0x400
     4e3:	00 00                	add    BYTE PTR [eax],al
     4e5:	05 02 20 03 00       	add    eax,0x32002
     4ea:	30 03                	xor    BYTE PTR [ebx],al
     4ec:	0f 01 08             	sidtd  [eax]
     4ef:	13 75 08             	adc    esi,DWORD PTR [ebp+0x8]
     4f2:	3d 3d 69 08 13       	cmp    eax,0x1308693d
     4f7:	75 08                	jne    501 <sysEnter_Vector-0x12faff>
     4f9:	2f                   	das    
     4fa:	3d 69 08 13 75       	cmp    eax,0x75130869
     4ff:	f3 3d 69 f3 75 ad    	repz cmp eax,0xad75f369
     505:	3d 31 08 21 08       	cmp    eax,0x8210831
     50a:	67 59                	addr16 pop ecx
     50c:	bb c9 08 67 69       	mov    ebx,0x696708c9
     511:	08 13                	or     BYTE PTR [ebx],dl
     513:	75 77                	jne    58c <sysEnter_Vector-0x12fa74>
     515:	f4                   	hlt    
     516:	67 08 67 59          	or     BYTE PTR [bx+0x59],ah
     51a:	31 f4                	xor    esp,esi
     51c:	67 08 67 59          	or     BYTE PTR [bx+0x59],ah
     520:	31 08                	xor    DWORD PTR [eax],ecx
     522:	14 67                	adc    al,0x67
     524:	08 4b 59             	or     BYTE PTR [ebx+0x59],cl
     527:	69 08 13 02 32 13    	imul   ecx,DWORD PTR [eax],0x13320213
     52d:	59                   	pop    ecx
     52e:	69 c9 c9 3f c9 08    	imul   ecx,ecx,0x8c93fc9
     534:	83 3f 08             	cmp    DWORD PTR [edi],0x8
     537:	13 77 08             	adc    esi,DWORD PTR [edi+0x8]
     53a:	31 3d 69 c9 c9 3f    	xor    DWORD PTR ds:0x3fc9c969,edi
     540:	08 21                	or     BYTE PTR [ecx],ah
     542:	76 08                	jbe    54c <sysEnter_Vector-0x12fab4>
     544:	13 08                	adc    ecx,DWORD PTR [eax]
     546:	2f                   	das    
     547:	02 05 00 01 01 14    	add    al,BYTE PTR ds:0x14010100
     54d:	01 00                	add    DWORD PTR [eax],eax
     54f:	00 02                	add    BYTE PTR [edx],al
     551:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     557:	01 fb                	add    ebx,edi
     559:	0e                   	push   cs
     55a:	0d 00 01 01 01       	or     eax,0x1010100
     55f:	01 00                	add    DWORD PTR [eax],eax
     561:	00 00                	add    BYTE PTR [eax],al
     563:	01 00                	add    DWORD PTR [eax],eax
     565:	00 01                	add    BYTE PTR [ecx],al
     567:	73 72                	jae    5db <sysEnter_Vector-0x12fa25>
     569:	63 00                	arpl   WORD PTR [eax],ax
     56b:	2f                   	das    
     56c:	68 6f 6d 65 2f       	push   0x2f656d6f
     571:	79 6f                	jns    5e2 <sysEnter_Vector-0x12fa1e>
     573:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     57a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     57d:	73 73                	jae    5f2 <sysEnter_Vector-0x12fa0e>
     57f:	2f                   	das    
     580:	6c                   	ins    BYTE PTR es:[edi],dx
     581:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     588:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     58e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     594:	78 2d                	js     5c3 <sysEnter_Vector-0x12fa3d>
     596:	67 6e                	outs   dx,BYTE PTR ds:[si]
     598:	75 2f                	jne    5c9 <sysEnter_Vector-0x12fa37>
     59a:	35 2e 33 2e 30       	xor    eax,0x302e332e
     59f:	2f                   	das    
     5a0:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     5a7:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     5aa:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     5ae:	65 00 00             	add    BYTE PTR gs:[eax],al
     5b1:	6d                   	ins    DWORD PTR es:[edi],dx
     5b2:	61                   	popa   
     5b3:	6c                   	ins    BYTE PTR es:[edi],dx
     5b4:	6c                   	ins    BYTE PTR es:[edi],dx
     5b5:	6f                   	outs   dx,DWORD PTR ds:[esi]
     5b6:	63 2e                	arpl   WORD PTR [esi],bp
     5b8:	63 00                	arpl   WORD PTR [eax],ax
     5ba:	01 00                	add    DWORD PTR [eax],eax
     5bc:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     5bf:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     5c6:	63 
     5c7:	2e                   	cs
     5c8:	68 00 02 00 00       	push   0x200
     5cd:	73 74                	jae    643 <sysEnter_Vector-0x12f9bd>
     5cf:	64                   	fs
     5d0:	64                   	fs
     5d1:	65                   	gs
     5d2:	66                   	data16
     5d3:	2e                   	cs
     5d4:	68 00 02 00 00       	push   0x200
     5d9:	6d                   	ins    DWORD PTR es:[edi],dx
     5da:	61                   	popa   
     5db:	6c                   	ins    BYTE PTR es:[edi],dx
     5dc:	6c                   	ins    BYTE PTR es:[edi],dx
     5dd:	6f                   	outs   dx,DWORD PTR ds:[esi]
     5de:	63 2e                	arpl   WORD PTR [esi],bp
     5e0:	68 00 03 00 00       	push   0x300
     5e5:	74 69                	je     650 <sysEnter_Vector-0x12f9b0>
     5e7:	6d                   	ins    DWORD PTR es:[edi],dx
     5e8:	65                   	gs
     5e9:	2e                   	cs
     5ea:	68 00 03 00 00       	push   0x300
     5ef:	6c                   	ins    BYTE PTR es:[edi],dx
     5f0:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     5f7:	4f                   	dec    edi
     5f8:	53                   	push   ebx
     5f9:	2e                   	cs
     5fa:	68 00 03 00 00       	push   0x300
     5ff:	00 00                	add    BYTE PTR [eax],al
     601:	05 02 2c 06 00       	add    eax,0x62c02
     606:	30 03                	xor    BYTE PTR [ebx],al
     608:	0c 01                	or     al,0x1
     60a:	c9                   	leave  
     60b:	bb bb bb 3f f3       	mov    ebx,0xf33fbbbb
     610:	92                   	xchg   edx,eax
     611:	08 85 08 67 00 02    	or     BYTE PTR [ebp+0x2006708],al
     617:	04 01                	add    al,0x1
     619:	06                   	push   es
     61a:	66 06                	pushw  es
     61c:	bc f5 a1 59 31       	mov    esp,0x3159a1f5
     621:	08 34 08             	or     BYTE PTR [eax+ecx*1],dh
     624:	ad                   	lods   eax,DWORD PTR ds:[esi]
     625:	08 13                	or     BYTE PTR [ebx],dl
     627:	08 ad a0 08 22 02    	or     BYTE PTR [ebp+0x22208a0],ch
     62d:	22 13                	and    dl,BYTE PTR [ebx]
     62f:	f3 02 28             	repz add ch,BYTE PTR [eax]
     632:	13 bc ad ad 02 22 15 	adc    edi,DWORD PTR [ebp+ebp*4+0x152202ad]
     639:	02 22                	add    ah,BYTE PTR [edx]
     63b:	13 ad 91 91 75 08    	adc    ebp,DWORD PTR [ebp+0x8759191]
     641:	f3 d7                	repz xlat BYTE PTR ds:[ebx]
     643:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
     646:	59                   	pop    ecx
     647:	91                   	xchg   ecx,eax
     648:	08 76 3d             	or     BYTE PTR [esi+0x3d],dh
     64b:	77 f5                	ja     642 <sysEnter_Vector-0x12f9be>
     64d:	68 93 00 02 04       	push   0x4020093
     652:	02 be 30 03 76 90    	add    bh,BYTE PTR [esi-0x6f89fcd0]
     658:	03 0b                	add    ecx,DWORD PTR [ebx]
     65a:	20 31                	and    BYTE PTR [ecx],dh
     65c:	d7                   	xlat   BYTE PTR ds:[ebx]
     65d:	08 3d 02 04 00 01    	or     BYTE PTR ds:0x1000402,bh
     663:	01 ed                	add    ebp,ebp
     665:	00 00                	add    BYTE PTR [eax],al
     667:	00 02                	add    BYTE PTR [edx],al
     669:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     66f:	01 fb                	add    ebx,edi
     671:	0e                   	push   cs
     672:	0d 00 01 01 01       	or     eax,0x1010100
     677:	01 00                	add    DWORD PTR [eax],eax
     679:	00 00                	add    BYTE PTR [eax],al
     67b:	01 00                	add    DWORD PTR [eax],eax
     67d:	00 01                	add    BYTE PTR [ecx],al
     67f:	73 72                	jae    6f3 <sysEnter_Vector-0x12f90d>
     681:	63 00                	arpl   WORD PTR [eax],ax
     683:	2f                   	das    
     684:	68 6f 6d 65 2f       	push   0x2f656d6f
     689:	79 6f                	jns    6fa <sysEnter_Vector-0x12f906>
     68b:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     692:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     695:	73 73                	jae    70a <sysEnter_Vector-0x12f8f6>
     697:	2f                   	das    
     698:	6c                   	ins    BYTE PTR es:[edi],dx
     699:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     6a0:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     6a6:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     6ac:	78 2d                	js     6db <sysEnter_Vector-0x12f925>
     6ae:	67 6e                	outs   dx,BYTE PTR ds:[si]
     6b0:	75 2f                	jne    6e1 <sysEnter_Vector-0x12f91f>
     6b2:	35 2e 33 2e 30       	xor    eax,0x302e332e
     6b7:	2f                   	das    
     6b8:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     6bf:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     6c2:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     6c6:	65 00 00             	add    BYTE PTR gs:[eax],al
     6c9:	6d                   	ins    DWORD PTR es:[edi],dx
     6ca:	65                   	gs
     6cb:	6d                   	ins    DWORD PTR es:[edi],dx
     6cc:	63 70 79             	arpl   WORD PTR [eax+0x79],si
     6cf:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     6d2:	01 00                	add    DWORD PTR [eax],eax
     6d4:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     6d7:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     6de:	63 
     6df:	2e                   	cs
     6e0:	68 00 02 00 00       	push   0x200
     6e5:	74 69                	je     750 <sysEnter_Vector-0x12f8b0>
     6e7:	6d                   	ins    DWORD PTR es:[edi],dx
     6e8:	65                   	gs
     6e9:	2e                   	cs
     6ea:	68 00 03 00 00       	push   0x300
     6ef:	73 74                	jae    765 <sysEnter_Vector-0x12f89b>
     6f1:	64                   	fs
     6f2:	64                   	fs
     6f3:	65                   	gs
     6f4:	66                   	data16
     6f5:	2e                   	cs
     6f6:	68 00 02 00 00       	push   0x200
     6fb:	6d                   	ins    DWORD PTR es:[edi],dx
     6fc:	61                   	popa   
     6fd:	6c                   	ins    BYTE PTR es:[edi],dx
     6fe:	6c                   	ins    BYTE PTR es:[edi],dx
     6ff:	6f                   	outs   dx,DWORD PTR ds:[esi]
     700:	63 2e                	arpl   WORD PTR [esi],bp
     702:	68 00 03 00 00       	push   0x300
     707:	6c                   	ins    BYTE PTR es:[edi],dx
     708:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     70f:	4f                   	dec    edi
     710:	53                   	push   ebx
     711:	2e                   	cs
     712:	68 00 03 00 00       	push   0x300
     717:	00 00                	add    BYTE PTR [eax],al
     719:	05 02 20 09 00       	add    eax,0x92002
     71e:	30 03                	xor    BYTE PTR [ebx],al
     720:	0a 01                	or     al,BYTE PTR [ecx]
     722:	f5                   	cmc    
     723:	d7                   	xlat   BYTE PTR ds:[ebx]
     724:	d7                   	xlat   BYTE PTR ds:[ebx]
     725:	68 91 67 68 83       	push   0x83686791
     72a:	91                   	xchg   ecx,eax
     72b:	91                   	xchg   ecx,eax
     72c:	2f                   	das    
     72d:	08 1f                	or     BYTE PTR [edi],bl
     72f:	e8 08 57 ca 84       	call   84ca5e3c <ticksToWait+0x54ca29dc>
     734:	68 83 67 68 83       	push   0x83686783
     739:	91                   	xchg   ecx,eax
     73a:	91                   	xchg   ecx,eax
     73b:	2f                   	das    
     73c:	08 1f                	or     BYTE PTR [edi],bl
     73e:	e8 08 57 ca 5c       	call   5cca5e4b <ticksToWait+0x2cca29eb>
     743:	67 68 83 67 67 2f    	addr16 push 0x2f676783
     749:	08 2d e8 08 65 ca    	or     BYTE PTR ds:0xca6508e8,ch
     74f:	3e 02 02             	add    al,BYTE PTR ds:[edx]
     752:	00 01                	add    BYTE PTR [ecx],al
     754:	01 d0                	add    eax,edx
     756:	00 00                	add    BYTE PTR [eax],al
     758:	00 02                	add    BYTE PTR [edx],al
     75a:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     760:	01 fb                	add    ebx,edi
     762:	0e                   	push   cs
     763:	0d 00 01 01 01       	or     eax,0x1010100
     768:	01 00                	add    DWORD PTR [eax],eax
     76a:	00 00                	add    BYTE PTR [eax],al
     76c:	01 00                	add    DWORD PTR [eax],eax
     76e:	00 01                	add    BYTE PTR [ecx],al
     770:	73 72                	jae    7e4 <sysEnter_Vector-0x12f81c>
     772:	63 00                	arpl   WORD PTR [eax],ax
     774:	2f                   	das    
     775:	68 6f 6d 65 2f       	push   0x2f656d6f
     77a:	79 6f                	jns    7eb <sysEnter_Vector-0x12f815>
     77c:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     783:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     786:	73 73                	jae    7fb <sysEnter_Vector-0x12f805>
     788:	2f                   	das    
     789:	6c                   	ins    BYTE PTR es:[edi],dx
     78a:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     791:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     797:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     79d:	78 2d                	js     7cc <sysEnter_Vector-0x12f834>
     79f:	67 6e                	outs   dx,BYTE PTR ds:[si]
     7a1:	75 2f                	jne    7d2 <sysEnter_Vector-0x12f82e>
     7a3:	35 2e 33 2e 30       	xor    eax,0x302e332e
     7a8:	2f                   	das    
     7a9:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     7b0:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     7b3:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     7b7:	65 00 00             	add    BYTE PTR gs:[eax],al
     7ba:	6d                   	ins    DWORD PTR es:[edi],dx
     7bb:	65                   	gs
     7bc:	6d                   	ins    DWORD PTR es:[edi],dx
     7bd:	73 65                	jae    824 <sysEnter_Vector-0x12f7dc>
     7bf:	74 2e                	je     7ef <sysEnter_Vector-0x12f811>
     7c1:	63 00                	arpl   WORD PTR [eax],ax
     7c3:	01 00                	add    DWORD PTR [eax],eax
     7c5:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     7c8:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     7cf:	63 
     7d0:	2e                   	cs
     7d1:	68 00 02 00 00       	push   0x200
     7d6:	73 74                	jae    84c <sysEnter_Vector-0x12f7b4>
     7d8:	64                   	fs
     7d9:	64                   	fs
     7da:	65                   	gs
     7db:	66                   	data16
     7dc:	2e                   	cs
     7dd:	68 00 02 00 00       	push   0x200
     7e2:	74 69                	je     84d <sysEnter_Vector-0x12f7b3>
     7e4:	6d                   	ins    DWORD PTR es:[edi],dx
     7e5:	65                   	gs
     7e6:	2e                   	cs
     7e7:	68 00 03 00 00       	push   0x300
     7ec:	6d                   	ins    DWORD PTR es:[edi],dx
     7ed:	61                   	popa   
     7ee:	6c                   	ins    BYTE PTR es:[edi],dx
     7ef:	6c                   	ins    BYTE PTR es:[edi],dx
     7f0:	6f                   	outs   dx,DWORD PTR ds:[esi]
     7f1:	63 2e                	arpl   WORD PTR [esi],bp
     7f3:	68 00 03 00 00       	push   0x300
     7f8:	6c                   	ins    BYTE PTR es:[edi],dx
     7f9:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     800:	4f                   	dec    edi
     801:	53                   	push   ebx
     802:	2e                   	cs
     803:	68 00 03 00 00       	push   0x300
     808:	00 00                	add    BYTE PTR [eax],al
     80a:	05 02 bc 0a 00       	add    eax,0xabc02
     80f:	30 1a                	xor    BYTE PTR [edx],bl
     811:	f3 67 67 08 83 67 08 	repz addr32 or BYTE PTR [bp+di+0x867],al
     818:	ca 9f 2f             	retf   0x2f9f
     81b:	d5 bd                	aad    0xbd
     81d:	9f                   	lahf   
     81e:	2f                   	das    
     81f:	f1                   	icebp  
     820:	bf d5 cb 3d 02       	mov    edi,0x23dcbd5
     825:	02 00                	add    al,BYTE PTR [eax]
     827:	01 01                	add    DWORD PTR [ecx],eax
     829:	e0 00                	loopne 82b <sysEnter_Vector-0x12f7d5>
     82b:	00 00                	add    BYTE PTR [eax],al
     82d:	02 00                	add    al,BYTE PTR [eax]
     82f:	bc 00 00 00 01       	mov    esp,0x1000000
     834:	01 fb                	add    ebx,edi
     836:	0e                   	push   cs
     837:	0d 00 01 01 01       	or     eax,0x1010100
     83c:	01 00                	add    DWORD PTR [eax],eax
     83e:	00 00                	add    BYTE PTR [eax],al
     840:	01 00                	add    DWORD PTR [eax],eax
     842:	00 01                	add    BYTE PTR [ecx],al
     844:	73 72                	jae    8b8 <sysEnter_Vector-0x12f748>
     846:	63 00                	arpl   WORD PTR [eax],ax
     848:	2e                   	cs
     849:	2e                   	cs
     84a:	2f                   	das    
     84b:	2e                   	cs
     84c:	2e                   	cs
     84d:	2f                   	das    
     84e:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
     852:	6a 2f                	push   0x2f
     854:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
     857:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
     85e:	6e                   	outs   dx,BYTE PTR ds:[esi]
     85f:	65                   	gs
     860:	6c                   	ins    BYTE PTR es:[edi],dx
     861:	2f                   	das    
     862:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     869:	00 2f                	add    BYTE PTR [edi],ch
     86b:	68 6f 6d 65 2f       	push   0x2f656d6f
     870:	79 6f                	jns    8e1 <sysEnter_Vector-0x12f71f>
     872:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     879:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     87c:	73 73                	jae    8f1 <sysEnter_Vector-0x12f70f>
     87e:	2f                   	das    
     87f:	6c                   	ins    BYTE PTR es:[edi],dx
     880:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     887:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     88d:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     893:	78 2d                	js     8c2 <sysEnter_Vector-0x12f73e>
     895:	67 6e                	outs   dx,BYTE PTR ds:[si]
     897:	75 2f                	jne    8c8 <sysEnter_Vector-0x12f738>
     899:	35 2e 33 2e 30       	xor    eax,0x302e332e
     89e:	2f                   	das    
     89f:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     8a6:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     8a9:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     8ad:	65 00 00             	add    BYTE PTR gs:[eax],al
     8b0:	73 74                	jae    926 <sysEnter_Vector-0x12f6da>
     8b2:	64 69 6f 2e 63 00 01 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x10063
     8b9:	00 
     8ba:	00 64 6c 6c          	add    BYTE PTR [esp+ebp*2+0x6c],ah
     8be:	69 73 74 2e 68 00 02 	imul   esi,DWORD PTR [ebx+0x74],0x200682e
     8c5:	00 00                	add    BYTE PTR [eax],al
     8c7:	73 74                	jae    93d <sysEnter_Vector-0x12f6c3>
     8c9:	64                   	fs
     8ca:	64                   	fs
     8cb:	65                   	gs
     8cc:	66                   	data16
     8cd:	2e                   	cs
     8ce:	68 00 03 00 00       	push   0x300
     8d3:	73 74                	jae    949 <sysEnter_Vector-0x12f6b7>
     8d5:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     8dc:	63 
     8dd:	2e                   	cs
     8de:	68 00 03 00 00       	push   0x300
     8e3:	73 74                	jae    959 <sysEnter_Vector-0x12f6a7>
     8e5:	64 69 6f 2e 68 00 04 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x40068
     8ec:	00 
     8ed:	00 00                	add    BYTE PTR [eax],al
     8ef:	00 05 02 84 0b 00    	add    BYTE PTR ds:0xb8402,al
     8f5:	30 03                	xor    BYTE PTR [ebx],al
     8f7:	0f 01 08             	sidtd  [eax]
     8fa:	13 08                	adc    ecx,DWORD PTR [eax]
     8fc:	59                   	pop    ecx
     8fd:	5b                   	pop    ebx
     8fe:	08 13                	or     BYTE PTR [ebx],dl
     900:	f3 5b                	repz pop ebx
     902:	c9                   	leave  
     903:	e5 d7                	in     eax,0xd7
     905:	e5 08                	in     eax,0x8
     907:	67 02 03             	add    al,BYTE PTR [bp+di]
     90a:	00 01                	add    BYTE PTR [ecx],al
     90c:	01 cf                	add    edi,ecx
     90e:	00 00                	add    BYTE PTR [eax],al
     910:	00 02                	add    BYTE PTR [edx],al
     912:	00 a6 00 00 00 01    	add    BYTE PTR [esi+0x1000000],ah
     918:	01 fb                	add    ebx,edi
     91a:	0e                   	push   cs
     91b:	0d 00 01 01 01       	or     eax,0x1010100
     920:	01 00                	add    DWORD PTR [eax],eax
     922:	00 00                	add    BYTE PTR [eax],al
     924:	01 00                	add    DWORD PTR [eax],eax
     926:	00 01                	add    BYTE PTR [ecx],al
     928:	73 72                	jae    99c <sysEnter_Vector-0x12f664>
     92a:	63 2f                	arpl   WORD PTR [edi],bp
     92c:	73 74                	jae    9a2 <sysEnter_Vector-0x12f65e>
     92e:	72 69                	jb     999 <sysEnter_Vector-0x12f667>
     930:	6e                   	outs   dx,BYTE PTR ds:[esi]
     931:	67 73 00             	addr16 jae 934 <sysEnter_Vector-0x12f6cc>
     934:	2f                   	das    
     935:	68 6f 6d 65 2f       	push   0x2f656d6f
     93a:	79 6f                	jns    9ab <sysEnter_Vector-0x12f655>
     93c:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     943:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     946:	73 73                	jae    9bb <sysEnter_Vector-0x12f645>
     948:	2f                   	das    
     949:	6c                   	ins    BYTE PTR es:[edi],dx
     94a:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     951:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     957:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     95d:	78 2d                	js     98c <sysEnter_Vector-0x12f674>
     95f:	67 6e                	outs   dx,BYTE PTR ds:[si]
     961:	75 2f                	jne    992 <sysEnter_Vector-0x12f66e>
     963:	35 2e 33 2e 30       	xor    eax,0x302e332e
     968:	2f                   	das    
     969:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     970:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     973:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     977:	65 00 00             	add    BYTE PTR gs:[eax],al
     97a:	73 74                	jae    9f0 <sysEnter_Vector-0x12f610>
     97c:	72 63                	jb     9e1 <sysEnter_Vector-0x12f61f>
     97e:	61                   	popa   
     97f:	74 2e                	je     9af <sysEnter_Vector-0x12f651>
     981:	63 00                	arpl   WORD PTR [eax],ax
     983:	01 00                	add    DWORD PTR [eax],eax
     985:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     988:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     98f:	63 
     990:	2e                   	cs
     991:	68 00 02 00 00       	push   0x200
     996:	74 69                	je     a01 <sysEnter_Vector-0x12f5ff>
     998:	6d                   	ins    DWORD PTR es:[edi],dx
     999:	65                   	gs
     99a:	2e                   	cs
     99b:	68 00 03 00 00       	push   0x300
     9a0:	6d                   	ins    DWORD PTR es:[edi],dx
     9a1:	61                   	popa   
     9a2:	6c                   	ins    BYTE PTR es:[edi],dx
     9a3:	6c                   	ins    BYTE PTR es:[edi],dx
     9a4:	6f                   	outs   dx,DWORD PTR ds:[esi]
     9a5:	63 2e                	arpl   WORD PTR [esi],bp
     9a7:	68 00 03 00 00       	push   0x300
     9ac:	6c                   	ins    BYTE PTR es:[edi],dx
     9ad:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     9b4:	4f                   	dec    edi
     9b5:	53                   	push   ebx
     9b6:	2e                   	cs
     9b7:	68 00 03 00 00       	push   0x300
     9bc:	00 00                	add    BYTE PTR [eax],al
     9be:	05 02 2c 0c 00       	add    eax,0xc2c02
     9c3:	30 03                	xor    BYTE PTR [ebx],al
     9c5:	1d 01 08 21 02       	sbb    eax,0x2210801
     9ca:	24 13                	and    al,0x13
     9cc:	3d 5a f5 76 2f       	cmp    eax,0x2f76f55a
     9d1:	49                   	dec    ecx
     9d2:	e8 76 2f 08 4b       	call   4b08394d <ticksToWait+0x1b0804ed>
     9d7:	4b                   	dec    ebx
     9d8:	47                   	inc    edi
     9d9:	ea ad 02 03 00 01 01 	jmp    0x101:0x302ad
     9e0:	c5 00                	lds    eax,FWORD PTR [eax]
     9e2:	00 00                	add    BYTE PTR [eax],al
     9e4:	02 00                	add    al,BYTE PTR [eax]
     9e6:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     9e7:	00 00                	add    BYTE PTR [eax],al
     9e9:	00 01                	add    BYTE PTR [ecx],al
     9eb:	01 fb                	add    ebx,edi
     9ed:	0e                   	push   cs
     9ee:	0d 00 01 01 01       	or     eax,0x1010100
     9f3:	01 00                	add    DWORD PTR [eax],eax
     9f5:	00 00                	add    BYTE PTR [eax],al
     9f7:	01 00                	add    DWORD PTR [eax],eax
     9f9:	00 01                	add    BYTE PTR [ecx],al
     9fb:	73 72                	jae    a6f <sysEnter_Vector-0x12f591>
     9fd:	63 2f                	arpl   WORD PTR [edi],bp
     9ff:	73 74                	jae    a75 <sysEnter_Vector-0x12f58b>
     a01:	72 69                	jb     a6c <sysEnter_Vector-0x12f594>
     a03:	6e                   	outs   dx,BYTE PTR ds:[esi]
     a04:	67 73 00             	addr16 jae a07 <sysEnter_Vector-0x12f5f9>
     a07:	2f                   	das    
     a08:	68 6f 6d 65 2f       	push   0x2f656d6f
     a0d:	79 6f                	jns    a7e <sysEnter_Vector-0x12f582>
     a0f:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     a16:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     a19:	73 73                	jae    a8e <sysEnter_Vector-0x12f572>
     a1b:	2f                   	das    
     a1c:	6c                   	ins    BYTE PTR es:[edi],dx
     a1d:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     a24:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     a2a:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     a30:	78 2d                	js     a5f <sysEnter_Vector-0x12f5a1>
     a32:	67 6e                	outs   dx,BYTE PTR ds:[si]
     a34:	75 2f                	jne    a65 <sysEnter_Vector-0x12f59b>
     a36:	35 2e 33 2e 30       	xor    eax,0x302e332e
     a3b:	2f                   	das    
     a3c:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     a43:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     a46:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     a4a:	65 00 00             	add    BYTE PTR gs:[eax],al
     a4d:	73 74                	jae    ac3 <sysEnter_Vector-0x12f53d>
     a4f:	72 63                	jb     ab4 <sysEnter_Vector-0x12f54c>
     a51:	6d                   	ins    DWORD PTR es:[edi],dx
     a52:	70 2e                	jo     a82 <sysEnter_Vector-0x12f57e>
     a54:	63 00                	arpl   WORD PTR [eax],ax
     a56:	01 00                	add    DWORD PTR [eax],eax
     a58:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     a5b:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     a62:	63 
     a63:	2e                   	cs
     a64:	68 00 02 00 00       	push   0x200
     a69:	74 69                	je     ad4 <sysEnter_Vector-0x12f52c>
     a6b:	6d                   	ins    DWORD PTR es:[edi],dx
     a6c:	65                   	gs
     a6d:	2e                   	cs
     a6e:	68 00 03 00 00       	push   0x300
     a73:	6d                   	ins    DWORD PTR es:[edi],dx
     a74:	61                   	popa   
     a75:	6c                   	ins    BYTE PTR es:[edi],dx
     a76:	6c                   	ins    BYTE PTR es:[edi],dx
     a77:	6f                   	outs   dx,DWORD PTR ds:[esi]
     a78:	63 2e                	arpl   WORD PTR [esi],bp
     a7a:	68 00 03 00 00       	push   0x300
     a7f:	6c                   	ins    BYTE PTR es:[edi],dx
     a80:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     a87:	4f                   	dec    edi
     a88:	53                   	push   ebx
     a89:	2e                   	cs
     a8a:	68 00 03 00 00       	push   0x300
     a8f:	00 00                	add    BYTE PTR [eax],al
     a91:	05 02 dc 0c 00       	add    eax,0xcdc02
     a96:	30 03                	xor    BYTE PTR [ebx],al
     a98:	18 01                	sbb    BYTE PTR [ecx],al
     a9a:	08 21                	or     BYTE PTR [ecx],ah
     a9c:	3d 41 ad ad 67       	cmp    eax,0x67adad41
     aa1:	d8 92 bb 02 07 00    	fcom   DWORD PTR [edx+0x702bb]
     aa7:	01 01                	add    DWORD PTR [ecx],eax
     aa9:	d8 00                	fadd   DWORD PTR [eax]
     aab:	00 00                	add    BYTE PTR [eax],al
     aad:	02 00                	add    al,BYTE PTR [eax]
     aaf:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     ab0:	00 00                	add    BYTE PTR [eax],al
     ab2:	00 01                	add    BYTE PTR [ecx],al
     ab4:	01 fb                	add    ebx,edi
     ab6:	0e                   	push   cs
     ab7:	0d 00 01 01 01       	or     eax,0x1010100
     abc:	01 00                	add    DWORD PTR [eax],eax
     abe:	00 00                	add    BYTE PTR [eax],al
     ac0:	01 00                	add    DWORD PTR [eax],eax
     ac2:	00 01                	add    BYTE PTR [ecx],al
     ac4:	73 72                	jae    b38 <sysEnter_Vector-0x12f4c8>
     ac6:	63 2f                	arpl   WORD PTR [edi],bp
     ac8:	73 74                	jae    b3e <sysEnter_Vector-0x12f4c2>
     aca:	72 69                	jb     b35 <sysEnter_Vector-0x12f4cb>
     acc:	6e                   	outs   dx,BYTE PTR ds:[esi]
     acd:	67 73 00             	addr16 jae ad0 <sysEnter_Vector-0x12f530>
     ad0:	2f                   	das    
     ad1:	68 6f 6d 65 2f       	push   0x2f656d6f
     ad6:	79 6f                	jns    b47 <sysEnter_Vector-0x12f4b9>
     ad8:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     adf:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     ae2:	73 73                	jae    b57 <sysEnter_Vector-0x12f4a9>
     ae4:	2f                   	das    
     ae5:	6c                   	ins    BYTE PTR es:[edi],dx
     ae6:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     aed:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     af3:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     af9:	78 2d                	js     b28 <sysEnter_Vector-0x12f4d8>
     afb:	67 6e                	outs   dx,BYTE PTR ds:[si]
     afd:	75 2f                	jne    b2e <sysEnter_Vector-0x12f4d2>
     aff:	35 2e 33 2e 30       	xor    eax,0x302e332e
     b04:	2f                   	das    
     b05:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     b0c:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     b0f:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     b13:	65 00 00             	add    BYTE PTR gs:[eax],al
     b16:	73 74                	jae    b8c <sysEnter_Vector-0x12f474>
     b18:	72 63                	jb     b7d <sysEnter_Vector-0x12f483>
     b1a:	70 79                	jo     b95 <sysEnter_Vector-0x12f46b>
     b1c:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     b1f:	01 00                	add    DWORD PTR [eax],eax
     b21:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     b24:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     b2b:	63 
     b2c:	2e                   	cs
     b2d:	68 00 02 00 00       	push   0x200
     b32:	74 69                	je     b9d <sysEnter_Vector-0x12f463>
     b34:	6d                   	ins    DWORD PTR es:[edi],dx
     b35:	65                   	gs
     b36:	2e                   	cs
     b37:	68 00 03 00 00       	push   0x300
     b3c:	6d                   	ins    DWORD PTR es:[edi],dx
     b3d:	61                   	popa   
     b3e:	6c                   	ins    BYTE PTR es:[edi],dx
     b3f:	6c                   	ins    BYTE PTR es:[edi],dx
     b40:	6f                   	outs   dx,DWORD PTR ds:[esi]
     b41:	63 2e                	arpl   WORD PTR [esi],bp
     b43:	68 00 03 00 00       	push   0x300
     b48:	6c                   	ins    BYTE PTR es:[edi],dx
     b49:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     b50:	4f                   	dec    edi
     b51:	53                   	push   ebx
     b52:	2e                   	cs
     b53:	68 00 03 00 00       	push   0x300
     b58:	00 00                	add    BYTE PTR [eax],al
     b5a:	05 02 3c 0d 00       	add    eax,0xd3c02
     b5f:	30 16                	xor    BYTE PTR [esi],dl
     b61:	f3 67 00 02          	repz add BYTE PTR [bp+si],al
     b65:	04 01                	add    al,0x1
     b67:	06                   	push   es
     b68:	20 06                	and    BYTE PTR [esi],al
     b6a:	08 ca                	or     dl,cl
     b6c:	67 3d 32 f3 67 00    	addr16 cmp eax,0x67f332
     b72:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
     b75:	06                   	push   es
     b76:	20 00                	and    BYTE PTR [eax],al
     b78:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     b7b:	08 c8                	or     al,cl
     b7d:	06                   	push   es
     b7e:	ca 3d 02             	retf   0x23d
     b81:	02 00                	add    al,BYTE PTR [eax]
     b83:	01 01                	add    DWORD PTR [ecx],eax
     b85:	8d 00                	lea    eax,[eax]
     b87:	00 00                	add    BYTE PTR [eax],al
     b89:	02 00                	add    al,BYTE PTR [eax]
     b8b:	74 00                	je     b8d <sysEnter_Vector-0x12f473>
     b8d:	00 00                	add    BYTE PTR [eax],al
     b8f:	01 01                	add    DWORD PTR [ecx],eax
     b91:	fb                   	sti    
     b92:	0e                   	push   cs
     b93:	0d 00 01 01 01       	or     eax,0x1010100
     b98:	01 00                	add    DWORD PTR [eax],eax
     b9a:	00 00                	add    BYTE PTR [eax],al
     b9c:	01 00                	add    DWORD PTR [eax],eax
     b9e:	00 01                	add    BYTE PTR [ecx],al
     ba0:	73 72                	jae    c14 <sysEnter_Vector-0x12f3ec>
     ba2:	63 2f                	arpl   WORD PTR [edi],bp
     ba4:	73 74                	jae    c1a <sysEnter_Vector-0x12f3e6>
     ba6:	72 69                	jb     c11 <sysEnter_Vector-0x12f3ef>
     ba8:	6e                   	outs   dx,BYTE PTR ds:[esi]
     ba9:	67 73 00             	addr16 jae bac <sysEnter_Vector-0x12f454>
     bac:	2f                   	das    
     bad:	68 6f 6d 65 2f       	push   0x2f656d6f
     bb2:	79 6f                	jns    c23 <sysEnter_Vector-0x12f3dd>
     bb4:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     bbb:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     bbe:	73 73                	jae    c33 <sysEnter_Vector-0x12f3cd>
     bc0:	2f                   	das    
     bc1:	6c                   	ins    BYTE PTR es:[edi],dx
     bc2:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     bc9:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     bcf:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     bd5:	78 2d                	js     c04 <sysEnter_Vector-0x12f3fc>
     bd7:	67 6e                	outs   dx,BYTE PTR ds:[si]
     bd9:	75 2f                	jne    c0a <sysEnter_Vector-0x12f3f6>
     bdb:	35 2e 33 2e 30       	xor    eax,0x302e332e
     be0:	2f                   	das    
     be1:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     be8:	00 00                	add    BYTE PTR [eax],al
     bea:	73 74                	jae    c60 <sysEnter_Vector-0x12f3a0>
     bec:	72 6c                	jb     c5a <sysEnter_Vector-0x12f3a6>
     bee:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     bf0:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     bf3:	01 00                	add    DWORD PTR [eax],eax
     bf5:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     bf8:	64                   	fs
     bf9:	64                   	fs
     bfa:	65                   	gs
     bfb:	66                   	data16
     bfc:	2e                   	cs
     bfd:	68 00 02 00 00       	push   0x200
     c02:	00 00                	add    BYTE PTR [eax],al
     c04:	05 02 c4 0d 00       	add    eax,0xdc402
     c09:	30 14 f3             	xor    BYTE PTR [ebx+esi*8],dl
     c0c:	75 2f                	jne    c3d <sysEnter_Vector-0x12f3c3>
     c0e:	49                   	dec    ecx
     c0f:	e6 3d                	out    0x3d,al
     c11:	02 02                	add    al,BYTE PTR [edx]
     c13:	00 01                	add    BYTE PTR [ecx],al
     c15:	01 a5 00 00 00 02    	add    DWORD PTR [ebp+0x2000000],esp
     c1b:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
     c1e:	00 00                	add    BYTE PTR [eax],al
     c20:	01 01                	add    DWORD PTR [ecx],eax
     c22:	fb                   	sti    
     c23:	0e                   	push   cs
     c24:	0d 00 01 01 01       	or     eax,0x1010100
     c29:	01 00                	add    DWORD PTR [eax],eax
     c2b:	00 00                	add    BYTE PTR [eax],al
     c2d:	01 00                	add    DWORD PTR [eax],eax
     c2f:	00 01                	add    BYTE PTR [ecx],al
     c31:	73 72                	jae    ca5 <sysEnter_Vector-0x12f35b>
     c33:	63 2f                	arpl   WORD PTR [edi],bp
     c35:	73 74                	jae    cab <sysEnter_Vector-0x12f355>
     c37:	72 69                	jb     ca2 <sysEnter_Vector-0x12f35e>
     c39:	6e                   	outs   dx,BYTE PTR ds:[esi]
     c3a:	67 73 00             	addr16 jae c3d <sysEnter_Vector-0x12f3c3>
     c3d:	2f                   	das    
     c3e:	68 6f 6d 65 2f       	push   0x2f656d6f
     c43:	79 6f                	jns    cb4 <sysEnter_Vector-0x12f34c>
     c45:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     c4c:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     c4f:	73 73                	jae    cc4 <sysEnter_Vector-0x12f33c>
     c51:	2f                   	das    
     c52:	6c                   	ins    BYTE PTR es:[edi],dx
     c53:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     c5a:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     c60:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     c66:	78 2d                	js     c95 <sysEnter_Vector-0x12f36b>
     c68:	67 6e                	outs   dx,BYTE PTR ds:[si]
     c6a:	75 2f                	jne    c9b <sysEnter_Vector-0x12f365>
     c6c:	35 2e 33 2e 30       	xor    eax,0x302e332e
     c71:	2f                   	das    
     c72:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     c79:	00 00                	add    BYTE PTR [eax],al
     c7b:	73 74                	jae    cf1 <sysEnter_Vector-0x12f30f>
     c7d:	72 6e                	jb     ced <sysEnter_Vector-0x12f313>
     c7f:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
     c82:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     c85:	01 00                	add    DWORD PTR [eax],eax
     c87:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     c8a:	64                   	fs
     c8b:	64                   	fs
     c8c:	65                   	gs
     c8d:	66                   	data16
     c8e:	2e                   	cs
     c8f:	68 00 02 00 00       	push   0x200
     c94:	00 00                	add    BYTE PTR [eax],al
     c96:	05 02 f8 0d 00       	add    eax,0xdf802
     c9b:	30 03                	xor    BYTE PTR [ebx],al
     c9d:	0c 01                	or     al,0x1
     c9f:	c9                   	leave  
     ca0:	2f                   	das    
     ca1:	f3 00 02             	repz add BYTE PTR [edx],al
     ca4:	04 01                	add    al,0x1
     ca6:	06                   	push   es
     ca7:	f2 00 02             	repnz add BYTE PTR [edx],al
     caa:	04 02                	add    al,0x2
     cac:	74 06                	je     cb4 <sysEnter_Vector-0x12f34c>
     cae:	75 9f                	jne    c4f <sysEnter_Vector-0x12f3b1>
     cb0:	70 00                	jo     cb2 <sysEnter_Vector-0x12f34e>
     cb2:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     cb5:	06                   	push   es
     cb6:	ba 06 6b 59 02       	mov    edx,0x2596b06
     cbb:	02 00                	add    al,BYTE PTR [eax]
     cbd:	01 01                	add    DWORD PTR [ecx],eax
     cbf:	9d                   	popf   
     cc0:	00 00                	add    BYTE PTR [eax],al
     cc2:	00 02                	add    BYTE PTR [edx],al
     cc4:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
     cc7:	00 00                	add    BYTE PTR [eax],al
     cc9:	01 01                	add    DWORD PTR [ecx],eax
     ccb:	fb                   	sti    
     ccc:	0e                   	push   cs
     ccd:	0d 00 01 01 01       	or     eax,0x1010100
     cd2:	01 00                	add    DWORD PTR [eax],eax
     cd4:	00 00                	add    BYTE PTR [eax],al
     cd6:	01 00                	add    DWORD PTR [eax],eax
     cd8:	00 01                	add    BYTE PTR [ecx],al
     cda:	73 72                	jae    d4e <sysEnter_Vector-0x12f2b2>
     cdc:	63 2f                	arpl   WORD PTR [edi],bp
     cde:	73 74                	jae    d54 <sysEnter_Vector-0x12f2ac>
     ce0:	72 69                	jb     d4b <sysEnter_Vector-0x12f2b5>
     ce2:	6e                   	outs   dx,BYTE PTR ds:[esi]
     ce3:	67 73 00             	addr16 jae ce6 <sysEnter_Vector-0x12f31a>
     ce6:	2f                   	das    
     ce7:	68 6f 6d 65 2f       	push   0x2f656d6f
     cec:	79 6f                	jns    d5d <sysEnter_Vector-0x12f2a3>
     cee:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     cf5:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     cf8:	73 73                	jae    d6d <sysEnter_Vector-0x12f293>
     cfa:	2f                   	das    
     cfb:	6c                   	ins    BYTE PTR es:[edi],dx
     cfc:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     d03:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     d09:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     d0f:	78 2d                	js     d3e <sysEnter_Vector-0x12f2c2>
     d11:	67 6e                	outs   dx,BYTE PTR ds:[si]
     d13:	75 2f                	jne    d44 <sysEnter_Vector-0x12f2bc>
     d15:	35 2e 33 2e 30       	xor    eax,0x302e332e
     d1a:	2f                   	das    
     d1b:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     d22:	00 00                	add    BYTE PTR [eax],al
     d24:	73 74                	jae    d9a <sysEnter_Vector-0x12f266>
     d26:	72 6e                	jb     d96 <sysEnter_Vector-0x12f26a>
     d28:	63 70 79             	arpl   WORD PTR [eax+0x79],si
     d2b:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     d2e:	01 00                	add    DWORD PTR [eax],eax
     d30:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     d33:	64                   	fs
     d34:	64                   	fs
     d35:	65                   	gs
     d36:	66                   	data16
     d37:	2e                   	cs
     d38:	68 00 02 00 00       	push   0x200
     d3d:	00 00                	add    BYTE PTR [eax],al
     d3f:	05 02 60 0e 00       	add    eax,0xe6002
     d44:	30 03                	xor    BYTE PTR [ebx],al
     d46:	0d 01 f3 67 2f       	or     eax,0x2f67f301
     d4b:	08 67 48             	or     BYTE PTR [edi+0x48],ah
     d4e:	00 02                	add    BYTE PTR [edx],al
     d50:	04 01                	add    al,0x1
     d52:	06                   	push   es
     d53:	66 06                	pushw  es
     d55:	a2 2f bb 48 6a       	mov    ds:0x6a48bb2f,al
     d5a:	3d 02 02 00 01       	cmp    eax,0x1000202
     d5f:	01 53 01             	add    DWORD PTR [ebx+0x1],edx
     d62:	00 00                	add    BYTE PTR [eax],al
     d64:	02 00                	add    al,BYTE PTR [eax]
     d66:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     d67:	00 00                	add    BYTE PTR [eax],al
     d69:	00 01                	add    BYTE PTR [ecx],al
     d6b:	01 fb                	add    ebx,edi
     d6d:	0e                   	push   cs
     d6e:	0d 00 01 01 01       	or     eax,0x1010100
     d73:	01 00                	add    DWORD PTR [eax],eax
     d75:	00 00                	add    BYTE PTR [eax],al
     d77:	01 00                	add    DWORD PTR [eax],eax
     d79:	00 01                	add    BYTE PTR [ecx],al
     d7b:	73 72                	jae    def <sysEnter_Vector-0x12f211>
     d7d:	63 2f                	arpl   WORD PTR [edi],bp
     d7f:	73 74                	jae    df5 <sysEnter_Vector-0x12f20b>
     d81:	72 69                	jb     dec <sysEnter_Vector-0x12f214>
     d83:	6e                   	outs   dx,BYTE PTR ds:[esi]
     d84:	67 73 00             	addr16 jae d87 <sysEnter_Vector-0x12f279>
     d87:	2f                   	das    
     d88:	68 6f 6d 65 2f       	push   0x2f656d6f
     d8d:	79 6f                	jns    dfe <sysEnter_Vector-0x12f202>
     d8f:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     d96:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     d99:	73 73                	jae    e0e <sysEnter_Vector-0x12f1f2>
     d9b:	2f                   	das    
     d9c:	6c                   	ins    BYTE PTR es:[edi],dx
     d9d:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     da4:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     daa:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     db0:	78 2d                	js     ddf <sysEnter_Vector-0x12f221>
     db2:	67 6e                	outs   dx,BYTE PTR ds:[si]
     db4:	75 2f                	jne    de5 <sysEnter_Vector-0x12f21b>
     db6:	35 2e 33 2e 30       	xor    eax,0x302e332e
     dbb:	2f                   	das    
     dbc:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     dc3:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     dc6:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     dca:	65 00 00             	add    BYTE PTR gs:[eax],al
     dcd:	73 74                	jae    e43 <sysEnter_Vector-0x12f1bd>
     dcf:	72 6f                	jb     e40 <sysEnter_Vector-0x12f1c0>
     dd1:	75 6c                	jne    e3f <sysEnter_Vector-0x12f1c1>
     dd3:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     dd6:	01 00                	add    DWORD PTR [eax],eax
     dd8:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     ddb:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     de2:	63 
     de3:	2e                   	cs
     de4:	68 00 02 00 00       	push   0x200
     de9:	74 69                	je     e54 <sysEnter_Vector-0x12f1ac>
     deb:	6d                   	ins    DWORD PTR es:[edi],dx
     dec:	65                   	gs
     ded:	2e                   	cs
     dee:	68 00 03 00 00       	push   0x300
     df3:	6d                   	ins    DWORD PTR es:[edi],dx
     df4:	61                   	popa   
     df5:	6c                   	ins    BYTE PTR es:[edi],dx
     df6:	6c                   	ins    BYTE PTR es:[edi],dx
     df7:	6f                   	outs   dx,DWORD PTR ds:[esi]
     df8:	63 2e                	arpl   WORD PTR [esi],bp
     dfa:	68 00 03 00 00       	push   0x300
     dff:	6c                   	ins    BYTE PTR es:[edi],dx
     e00:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     e07:	4f                   	dec    edi
     e08:	53                   	push   ebx
     e09:	2e                   	cs
     e0a:	68 00 03 00 00       	push   0x300
     e0f:	00 00                	add    BYTE PTR [eax],al
     e11:	05 02 c0 0e 00       	add    eax,0xec002
     e16:	30 03                	xor    BYTE PTR [ebx],al
     e18:	3b 01                	cmp    eax,DWORD PTR [ecx]
     e1a:	08 2f                	or     BYTE PTR [edi],ch
     e1c:	40                   	inc    eax
     e1d:	00 02                	add    BYTE PTR [edx],al
     e1f:	04 01                	add    al,0x1
     e21:	7a 00                	jp     e23 <sysEnter_Vector-0x12f1dd>
     e23:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     e26:	ad                   	lods   eax,DWORD PTR ds:[esi]
     e27:	59                   	pop    ecx
     e28:	59                   	pop    ecx
     e29:	75 c9                	jne    df4 <sysEnter_Vector-0x12f20c>
     e2b:	59                   	pop    ecx
     e2c:	ad                   	lods   eax,DWORD PTR ds:[esi]
     e2d:	00 02                	add    BYTE PTR [edx],al
     e2f:	04 02                	add    al,0x2
     e31:	06                   	push   es
     e32:	66                   	data16
     e33:	00 02                	add    BYTE PTR [edx],al
     e35:	04 03                	add    al,0x3
     e37:	66 06                	pushw  es
     e39:	59                   	pop    ecx
     e3a:	00 02                	add    BYTE PTR [edx],al
     e3c:	04 01                	add    al,0x1
     e3e:	06                   	push   es
     e3f:	74 06                	je     e47 <sysEnter_Vector-0x12f1b9>
     e41:	75 91                	jne    dd4 <sysEnter_Vector-0x12f22c>
     e43:	3d 76 67 00 02       	cmp    eax,0x2006776
     e48:	04 01                	add    al,0x1
     e4a:	06                   	push   es
     e4b:	58                   	pop    eax
     e4c:	00 02                	add    BYTE PTR [edx],al
     e4e:	04 02                	add    al,0x2
     e50:	74 00                	je     e52 <sysEnter_Vector-0x12f1ae>
     e52:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
     e55:	58                   	pop    eax
     e56:	06                   	push   es
     e57:	3d 08 21 08 2f       	cmp    eax,0x2f082108
     e5c:	9f                   	lahf   
     e5d:	83 59 c9 00          	sbb    DWORD PTR [ecx-0x37],0x0
     e61:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     e64:	06                   	push   es
     e65:	58                   	pop    eax
     e66:	00 02                	add    BYTE PTR [edx],al
     e68:	04 03                	add    al,0x3
     e6a:	58                   	pop    eax
     e6b:	00 02                	add    BYTE PTR [edx],al
     e6d:	04 04                	add    al,0x4
     e6f:	74 00                	je     e71 <sysEnter_Vector-0x12f18f>
     e71:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
     e74:	58                   	pop    eax
     e75:	06                   	push   es
     e76:	31 5a 00             	xor    DWORD PTR [edx+0x0],ebx
     e79:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     e7c:	06                   	push   es
     e7d:	66                   	data16
     e7e:	00 02                	add    BYTE PTR [edx],al
     e80:	04 02                	add    al,0x2
     e82:	58                   	pop    eax
     e83:	00 02                	add    BYTE PTR [edx],al
     e85:	04 03                	add    al,0x3
     e87:	58                   	pop    eax
     e88:	06                   	push   es
     e89:	67 76 59             	addr16 jbe ee5 <sysEnter_Vector-0x12f11b>
     e8c:	67 03 72 4a          	add    esi,DWORD PTR [bp+si+0x4a]
     e90:	03 10                	add    edx,DWORD PTR [eax]
     e92:	ac                   	lods   al,BYTE PTR ds:[esi]
     e93:	03 76 2e             	add    esi,DWORD PTR [esi+0x2e]
     e96:	3e 03 09             	add    ecx,DWORD PTR ds:[ecx]
     e99:	20 67 75             	and    BYTE PTR [edi+0x75],ah
     e9c:	67 2f                	addr16 das 
     e9e:	67 00 02             	add    BYTE PTR [bp+si],al
     ea1:	04 01                	add    al,0x1
     ea3:	06                   	push   es
     ea4:	66                   	data16
     ea5:	00 02                	add    BYTE PTR [edx],al
     ea7:	04 02                	add    al,0x2
     ea9:	58                   	pop    eax
     eaa:	00 02                	add    BYTE PTR [edx],al
     eac:	04 04                	add    al,0x4
     eae:	3c 06                	cmp    al,0x6
     eb0:	59                   	pop    ecx
     eb1:	2f                   	das    
     eb2:	02 08                	add    cl,BYTE PTR [eax]
     eb4:	00 01                	add    BYTE PTR [ecx],al
     eb6:	01 43 00             	add    DWORD PTR [ebx+0x0],eax
     eb9:	00 00                	add    BYTE PTR [eax],al
     ebb:	02 00                	add    al,BYTE PTR [eax]
     ebd:	2d 00 00 00 01       	sub    eax,0x1000000
     ec2:	01 fb                	add    ebx,edi
     ec4:	0e                   	push   cs
     ec5:	0d 00 01 01 01       	or     eax,0x1010100
     eca:	01 00                	add    DWORD PTR [eax],eax
     ecc:	00 00                	add    BYTE PTR [eax],al
     ece:	01 00                	add    DWORD PTR [eax],eax
     ed0:	00 01                	add    BYTE PTR [ecx],al
     ed2:	73 72                	jae    f46 <sysEnter_Vector-0x12f0ba>
     ed4:	63 2f                	arpl   WORD PTR [edi],bp
     ed6:	73 74                	jae    f4c <sysEnter_Vector-0x12f0b4>
     ed8:	72 69                	jb     f43 <sysEnter_Vector-0x12f0bd>
     eda:	6e                   	outs   dx,BYTE PTR ds:[esi]
     edb:	67 73 00             	addr16 jae ede <sysEnter_Vector-0x12f122>
     ede:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     ee1:	72 70                	jb     f53 <sysEnter_Vector-0x12f0ad>
     ee3:	61                   	popa   
     ee4:	72 74                	jb     f5a <sysEnter_Vector-0x12f0a6>
     ee6:	73 2e                	jae    f16 <sysEnter_Vector-0x12f0ea>
     ee8:	63 00                	arpl   WORD PTR [eax],ax
     eea:	01 00                	add    DWORD PTR [eax],eax
     eec:	00 00                	add    BYTE PTR [eax],al
     eee:	00 05 02 40 10 00    	add    BYTE PTR ds:0x104002,al
     ef4:	30 13                	xor    BYTE PTR [ebx],dl
     ef6:	c9                   	leave  
     ef7:	ad                   	lods   eax,DWORD PTR ds:[esi]
     ef8:	3d 02 02 00 01       	cmp    eax,0x1000202
     efd:	01 7f 01             	add    DWORD PTR [edi+0x1],edi
     f00:	00 00                	add    BYTE PTR [eax],al
     f02:	02 00                	add    al,BYTE PTR [eax]
     f04:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     f05:	00 00                	add    BYTE PTR [eax],al
     f07:	00 01                	add    BYTE PTR [ecx],al
     f09:	01 fb                	add    ebx,edi
     f0b:	0e                   	push   cs
     f0c:	0d 00 01 01 01       	or     eax,0x1010100
     f11:	01 00                	add    DWORD PTR [eax],eax
     f13:	00 00                	add    BYTE PTR [eax],al
     f15:	01 00                	add    DWORD PTR [eax],eax
     f17:	00 01                	add    BYTE PTR [ecx],al
     f19:	73 72                	jae    f8d <sysEnter_Vector-0x12f073>
     f1b:	63 2f                	arpl   WORD PTR [edi],bp
     f1d:	73 74                	jae    f93 <sysEnter_Vector-0x12f06d>
     f1f:	72 69                	jb     f8a <sysEnter_Vector-0x12f076>
     f21:	6e                   	outs   dx,BYTE PTR ds:[esi]
     f22:	67 73 00             	addr16 jae f25 <sysEnter_Vector-0x12f0db>
     f25:	2f                   	das    
     f26:	68 6f 6d 65 2f       	push   0x2f656d6f
     f2b:	79 6f                	jns    f9c <sysEnter_Vector-0x12f064>
     f2d:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     f34:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     f37:	73 73                	jae    fac <sysEnter_Vector-0x12f054>
     f39:	2f                   	das    
     f3a:	6c                   	ins    BYTE PTR es:[edi],dx
     f3b:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     f42:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     f48:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     f4e:	78 2d                	js     f7d <sysEnter_Vector-0x12f083>
     f50:	67 6e                	outs   dx,BYTE PTR ds:[si]
     f52:	75 2f                	jne    f83 <sysEnter_Vector-0x12f07d>
     f54:	35 2e 33 2e 30       	xor    eax,0x302e332e
     f59:	2f                   	das    
     f5a:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     f61:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     f64:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     f68:	65 00 00             	add    BYTE PTR gs:[eax],al
     f6b:	73 74                	jae    fe1 <sysEnter_Vector-0x12f01f>
     f6d:	72 74                	jb     fe3 <sysEnter_Vector-0x12f01d>
     f6f:	6f                   	outs   dx,DWORD PTR ds:[esi]
     f70:	6c                   	ins    BYTE PTR es:[edi],dx
     f71:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     f74:	01 00                	add    DWORD PTR [eax],eax
     f76:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     f79:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     f80:	63 
     f81:	2e                   	cs
     f82:	68 00 02 00 00       	push   0x200
     f87:	74 69                	je     ff2 <sysEnter_Vector-0x12f00e>
     f89:	6d                   	ins    DWORD PTR es:[edi],dx
     f8a:	65                   	gs
     f8b:	2e                   	cs
     f8c:	68 00 03 00 00       	push   0x300
     f91:	6d                   	ins    DWORD PTR es:[edi],dx
     f92:	61                   	popa   
     f93:	6c                   	ins    BYTE PTR es:[edi],dx
     f94:	6c                   	ins    BYTE PTR es:[edi],dx
     f95:	6f                   	outs   dx,DWORD PTR ds:[esi]
     f96:	63 2e                	arpl   WORD PTR [esi],bp
     f98:	68 00 03 00 00       	push   0x300
     f9d:	6c                   	ins    BYTE PTR es:[edi],dx
     f9e:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     fa5:	4f                   	dec    edi
     fa6:	53                   	push   ebx
     fa7:	2e                   	cs
     fa8:	68 00 03 00 00       	push   0x300
     fad:	00 00                	add    BYTE PTR [eax],al
     faf:	05 02 60 10 00       	add    eax,0x106002
     fb4:	30 03                	xor    BYTE PTR [ebx],al
     fb6:	d7                   	xlat   BYTE PTR ds:[ebx]
     fb7:	00 01                	add    BYTE PTR [ecx],al
     fb9:	08 2f                	or     BYTE PTR [edi],ch
     fbb:	40                   	inc    eax
     fbc:	00 02                	add    BYTE PTR [edx],al
     fbe:	04 01                	add    al,0x1
     fc0:	7c 00                	jl     fc2 <sysEnter_Vector-0x12f03e>
     fc2:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     fc5:	ad                   	lods   eax,DWORD PTR ds:[esi]
     fc6:	59                   	pop    ecx
     fc7:	59                   	pop    ecx
     fc8:	75 c9                	jne    f93 <sysEnter_Vector-0x12f06d>
     fca:	59                   	pop    ecx
     fcb:	ad                   	lods   eax,DWORD PTR ds:[esi]
     fcc:	00 02                	add    BYTE PTR [edx],al
     fce:	04 02                	add    al,0x2
     fd0:	06                   	push   es
     fd1:	66                   	data16
     fd2:	00 02                	add    BYTE PTR [edx],al
     fd4:	04 03                	add    al,0x3
     fd6:	66 06                	pushw  es
     fd8:	59                   	pop    ecx
     fd9:	00 02                	add    BYTE PTR [edx],al
     fdb:	04 01                	add    al,0x1
     fdd:	06                   	push   es
     fde:	74 06                	je     fe6 <sysEnter_Vector-0x12f01a>
     fe0:	75 91                	jne    f73 <sysEnter_Vector-0x12f08d>
     fe2:	3d 76 67 00 02       	cmp    eax,0x2006776
     fe7:	04 01                	add    al,0x1
     fe9:	06                   	push   es
     fea:	58                   	pop    eax
     feb:	00 02                	add    BYTE PTR [edx],al
     fed:	04 02                	add    al,0x2
     fef:	74 00                	je     ff1 <sysEnter_Vector-0x12f00f>
     ff1:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
     ff4:	58                   	pop    eax
     ff5:	06                   	push   es
     ff6:	03 13                	add    edx,DWORD PTR [ebx]
     ff8:	3c 00                	cmp    al,0x0
     ffa:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     ffd:	06                   	push   es
     ffe:	66                   	data16
     fff:	00 02                	add    BYTE PTR [edx],al
    1001:	04 02                	add    al,0x2
    1003:	74 00                	je     1005 <sysEnter_Vector-0x12effb>
    1005:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1008:	06                   	push   es
    1009:	59                   	pop    ecx
    100a:	00 02                	add    BYTE PTR [edx],al
    100c:	04 04                	add    al,0x4
    100e:	08 3d 00 02 04 04    	or     BYTE PTR ds:0x4040200,bh
    1014:	f3 9f                	repz lahf 
    1016:	83 59 c9 00          	sbb    DWORD PTR [ecx-0x37],0x0
    101a:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    101d:	06                   	push   es
    101e:	58                   	pop    eax
    101f:	00 02                	add    BYTE PTR [edx],al
    1021:	04 03                	add    al,0x3
    1023:	58                   	pop    eax
    1024:	00 02                	add    BYTE PTR [edx],al
    1026:	04 04                	add    al,0x4
    1028:	74 00                	je     102a <sysEnter_Vector-0x12efd6>
    102a:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    102d:	58                   	pop    eax
    102e:	06                   	push   es
    102f:	31 5a 00             	xor    DWORD PTR [edx+0x0],ebx
    1032:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1035:	06                   	push   es
    1036:	66                   	data16
    1037:	00 02                	add    BYTE PTR [edx],al
    1039:	04 02                	add    al,0x2
    103b:	58                   	pop    eax
    103c:	00 02                	add    BYTE PTR [edx],al
    103e:	04 03                	add    al,0x3
    1040:	58                   	pop    eax
    1041:	06                   	push   es
    1042:	59                   	pop    ecx
    1043:	76 59                	jbe    109e <sysEnter_Vector-0x12ef62>
    1045:	67 03 72 4a          	add    esi,DWORD PTR [bp+si+0x4a]
    1049:	03 10                	add    edx,DWORD PTR [eax]
    104b:	ac                   	lods   al,BYTE PTR ds:[esi]
    104c:	03 76 2e             	add    esi,DWORD PTR [esi+0x2e]
    104f:	3e 03 09             	add    ecx,DWORD PTR ds:[ecx]
    1052:	20 67 00             	and    BYTE PTR [edi+0x0],ah
    1055:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1058:	06                   	push   es
    1059:	66                   	data16
    105a:	00 02                	add    BYTE PTR [edx],al
    105c:	04 02                	add    al,0x2
    105e:	74 00                	je     1060 <sysEnter_Vector-0x12efa0>
    1060:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1063:	58                   	pop    eax
    1064:	06                   	push   es
    1065:	4b                   	dec    ebx
    1066:	67 2f                	addr16 das 
    1068:	67 00 02             	add    BYTE PTR [bp+si],al
    106b:	04 01                	add    al,0x1
    106d:	06                   	push   es
    106e:	66                   	data16
    106f:	00 02                	add    BYTE PTR [edx],al
    1071:	04 02                	add    al,0x2
    1073:	58                   	pop    eax
    1074:	00 02                	add    BYTE PTR [edx],al
    1076:	04 04                	add    al,0x4
    1078:	3c 06                	cmp    al,0x6
    107a:	59                   	pop    ecx
    107b:	2f                   	das    
    107c:	02 08                	add    cl,BYTE PTR [eax]
    107e:	00 01                	add    BYTE PTR [ecx],al
    1080:	01 08                	add    DWORD PTR [eax],ecx
    1082:	01 00                	add    DWORD PTR [eax],eax
    1084:	00 02                	add    BYTE PTR [edx],al
    1086:	00 a7 00 00 00 01    	add    BYTE PTR [edi+0x1000000],ah
    108c:	01 fb                	add    ebx,edi
    108e:	0e                   	push   cs
    108f:	0d 00 01 01 01       	or     eax,0x1010100
    1094:	01 00                	add    DWORD PTR [eax],eax
    1096:	00 00                	add    BYTE PTR [eax],al
    1098:	01 00                	add    DWORD PTR [eax],eax
    109a:	00 01                	add    BYTE PTR [ecx],al
    109c:	73 72                	jae    1110 <sysEnter_Vector-0x12eef0>
    109e:	63 2f                	arpl   WORD PTR [edi],bp
    10a0:	73 74                	jae    1116 <sysEnter_Vector-0x12eeea>
    10a2:	72 69                	jb     110d <sysEnter_Vector-0x12eef3>
    10a4:	6e                   	outs   dx,BYTE PTR ds:[esi]
    10a5:	67 73 00             	addr16 jae 10a8 <sysEnter_Vector-0x12ef58>
    10a8:	2f                   	das    
    10a9:	68 6f 6d 65 2f       	push   0x2f656d6f
    10ae:	79 6f                	jns    111f <sysEnter_Vector-0x12eee1>
    10b0:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    10b7:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    10ba:	73 73                	jae    112f <sysEnter_Vector-0x12eed1>
    10bc:	2f                   	das    
    10bd:	6c                   	ins    BYTE PTR es:[edi],dx
    10be:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    10c5:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    10cb:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    10d1:	78 2d                	js     1100 <sysEnter_Vector-0x12ef00>
    10d3:	67 6e                	outs   dx,BYTE PTR ds:[si]
    10d5:	75 2f                	jne    1106 <sysEnter_Vector-0x12eefa>
    10d7:	35 2e 33 2e 30       	xor    eax,0x302e332e
    10dc:	2f                   	das    
    10dd:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    10e4:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    10e7:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    10eb:	65 00 00             	add    BYTE PTR gs:[eax],al
    10ee:	73 74                	jae    1164 <sysEnter_Vector-0x12ee9c>
    10f0:	72 74                	jb     1166 <sysEnter_Vector-0x12ee9a>
    10f2:	72 69                	jb     115d <sysEnter_Vector-0x12eea3>
    10f4:	6d                   	ins    DWORD PTR es:[edi],dx
    10f5:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
    10f8:	01 00                	add    DWORD PTR [eax],eax
    10fa:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    10fd:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    1104:	63 
    1105:	2e                   	cs
    1106:	68 00 02 00 00       	push   0x200
    110b:	74 69                	je     1176 <sysEnter_Vector-0x12ee8a>
    110d:	6d                   	ins    DWORD PTR es:[edi],dx
    110e:	65                   	gs
    110f:	2e                   	cs
    1110:	68 00 03 00 00       	push   0x300
    1115:	6d                   	ins    DWORD PTR es:[edi],dx
    1116:	61                   	popa   
    1117:	6c                   	ins    BYTE PTR es:[edi],dx
    1118:	6c                   	ins    BYTE PTR es:[edi],dx
    1119:	6f                   	outs   dx,DWORD PTR ds:[esi]
    111a:	63 2e                	arpl   WORD PTR [esi],bp
    111c:	68 00 03 00 00       	push   0x300
    1121:	6c                   	ins    BYTE PTR es:[edi],dx
    1122:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    1129:	4f                   	dec    edi
    112a:	53                   	push   ebx
    112b:	2e                   	cs
    112c:	68 00 03 00 00       	push   0x300
    1131:	00 00                	add    BYTE PTR [eax],al
    1133:	05 02 fc 11 00       	add    eax,0x11fc02
    1138:	30 16                	xor    BYTE PTR [esi],dl
    113a:	08 21                	or     BYTE PTR [ecx],ah
    113c:	85 08                	test   DWORD PTR [eax],ecx
    113e:	3d 00 02 04 02       	cmp    eax,0x2040200
    1143:	06                   	push   es
    1144:	2e 00 02             	add    BYTE PTR cs:[edx],al
    1147:	04 01                	add    al,0x1
    1149:	9e                   	sahf   
    114a:	06                   	push   es
    114b:	08 21                	or     BYTE PTR [ecx],ah
    114d:	f4                   	hlt    
    114e:	93                   	xchg   ebx,eax
    114f:	08 67 00             	or     BYTE PTR [edi+0x0],ah
    1152:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
    1155:	06                   	push   es
    1156:	2e 00 02             	add    BYTE PTR cs:[edx],al
    1159:	04 01                	add    al,0x1
    115b:	9e                   	sahf   
    115c:	06                   	push   es
    115d:	08 21                	or     BYTE PTR [ecx],ah
    115f:	08 15 59 5b 08 21    	or     BYTE PTR ds:0x21085b59,dl
    1165:	85 08                	test   DWORD PTR [eax],ecx
    1167:	13 00                	adc    eax,DWORD PTR [eax]
    1169:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
    116c:	06                   	push   es
    116d:	2e 00 02             	add    BYTE PTR cs:[edx],al
    1170:	04 01                	add    al,0x1
    1172:	9e                   	sahf   
    1173:	06                   	push   es
    1174:	f3 76 93             	repz jbe 110a <sysEnter_Vector-0x12eef6>
    1177:	08 3d 00 02 04 02    	or     BYTE PTR ds:0x2040200,bh
    117d:	06                   	push   es
    117e:	2e 00 02             	add    BYTE PTR cs:[edx],al
    1181:	04 01                	add    al,0x1
    1183:	9e                   	sahf   
    1184:	06                   	push   es
    1185:	f3 e7 3d             	repz out 0x3d,eax
    1188:	02 05 00 01 01 27    	add    al,BYTE PTR ds:0x27010100
    118e:	03 00                	add    eax,DWORD PTR [eax]
    1190:	00 02                	add    BYTE PTR [edx],al
    1192:	00 cc                	add    ah,cl
    1194:	00 00                	add    BYTE PTR [eax],al
    1196:	00 01                	add    BYTE PTR [ecx],al
    1198:	01 fb                	add    ebx,edi
    119a:	0e                   	push   cs
    119b:	0d 00 01 01 01       	or     eax,0x1010100
    11a0:	01 00                	add    DWORD PTR [eax],eax
    11a2:	00 00                	add    BYTE PTR [eax],al
    11a4:	01 00                	add    DWORD PTR [eax],eax
    11a6:	00 01                	add    BYTE PTR [ecx],al
    11a8:	73 72                	jae    121c <sysEnter_Vector-0x12ede4>
    11aa:	63 00                	arpl   WORD PTR [eax],ax
    11ac:	2f                   	das    
    11ad:	68 6f 6d 65 2f       	push   0x2f656d6f
    11b2:	79 6f                	jns    1223 <sysEnter_Vector-0x12eddd>
    11b4:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    11bb:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    11be:	73 73                	jae    1233 <sysEnter_Vector-0x12edcd>
    11c0:	2f                   	das    
    11c1:	6c                   	ins    BYTE PTR es:[edi],dx
    11c2:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    11c9:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    11cf:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    11d5:	78 2d                	js     1204 <sysEnter_Vector-0x12edfc>
    11d7:	67 6e                	outs   dx,BYTE PTR ds:[si]
    11d9:	75 2f                	jne    120a <sysEnter_Vector-0x12edf6>
    11db:	35 2e 33 2e 30       	xor    eax,0x302e332e
    11e0:	2f                   	das    
    11e1:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    11e8:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    11eb:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    11ef:	65 00 2e             	add    BYTE PTR gs:[esi],ch
    11f2:	2e                   	cs
    11f3:	2f                   	das    
    11f4:	2e                   	cs
    11f5:	2e                   	cs
    11f6:	2f                   	das    
    11f7:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
    11fb:	6a 2f                	push   0x2f
    11fd:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
    1200:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
    1207:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1208:	65                   	gs
    1209:	6c                   	ins    BYTE PTR es:[edi],dx
    120a:	2f                   	das    
    120b:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    1212:	00 00                	add    BYTE PTR [eax],al
    1214:	74 69                	je     127f <sysEnter_Vector-0x12ed81>
    1216:	6d                   	ins    DWORD PTR es:[edi],dx
    1217:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax
    121b:	01 00                	add    DWORD PTR [eax],eax
    121d:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    1220:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    1227:	63 
    1228:	2e                   	cs
    1229:	68 00 02 00 00       	push   0x200
    122e:	74 69                	je     1299 <sysEnter_Vector-0x12ed67>
    1230:	6d                   	ins    DWORD PTR es:[edi],dx
    1231:	65                   	gs
    1232:	2e                   	cs
    1233:	68 00 03 00 00       	push   0x300
    1238:	6d                   	ins    DWORD PTR es:[edi],dx
    1239:	61                   	popa   
    123a:	6c                   	ins    BYTE PTR es:[edi],dx
    123b:	6c                   	ins    BYTE PTR es:[edi],dx
    123c:	6f                   	outs   dx,DWORD PTR ds:[esi]
    123d:	63 2e                	arpl   WORD PTR [esi],bp
    123f:	68 00 03 00 00       	push   0x300
    1244:	6c                   	ins    BYTE PTR es:[edi],dx
    1245:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    124c:	4f                   	dec    edi
    124d:	53                   	push   ebx
    124e:	2e                   	cs
    124f:	68 00 03 00 00       	push   0x300
    1254:	73 79                	jae    12cf <sysEnter_Vector-0x12ed31>
    1256:	73 63                	jae    12bb <sysEnter_Vector-0x12ed45>
    1258:	61                   	popa   
    1259:	6c                   	ins    BYTE PTR es:[edi],dx
    125a:	6c                   	ins    BYTE PTR es:[edi],dx
    125b:	73 2e                	jae    128b <sysEnter_Vector-0x12ed75>
    125d:	68 00 04 00 00       	push   0x400
    1262:	00 00                	add    BYTE PTR [eax],al
    1264:	05 02 50 13 00       	add    eax,0x135002
    1269:	30 03                	xor    BYTE PTR [ebx],al
    126b:	2e                   	cs
    126c:	01 f3                	add    ebx,esi
    126e:	75 c9                	jne    1239 <sysEnter_Vector-0x12edc7>
    1270:	3d 31 08 21 84       	cmp    eax,0x84210831
    1275:	76 02                	jbe    1279 <sysEnter_Vector-0x12ed87>
    1277:	24 13                	and    al,0x13
    1279:	08 22                	or     BYTE PTR [edx],ah
    127b:	02 2e                	add    ch,BYTE PTR [esi]
    127d:	13 02                	adc    eax,DWORD PTR [edx]
    127f:	2f                   	das    
    1280:	13 08                	adc    ecx,DWORD PTR [eax]
    1282:	67 02 2d             	add    ch,BYTE PTR [di]
    1285:	13 2f                	adc    ebp,DWORD PTR [edi]
    1287:	00 02                	add    BYTE PTR [edx],al
    1289:	04 01                	add    al,0x1
    128b:	06                   	push   es
    128c:	9e                   	sahf   
    128d:	00 02                	add    BYTE PTR [edx],al
    128f:	04 04                	add    al,0x4
    1291:	02 23                	add    ah,BYTE PTR [ebx]
    1293:	12 00                	adc    al,BYTE PTR [eax]
    1295:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    129c:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    129f:	74 00                	je     12a1 <sysEnter_Vector-0x12ed5f>
    12a1:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    12a4:	58                   	pop    eax
    12a5:	00 02                	add    BYTE PTR [edx],al
    12a7:	04 08                	add    al,0x8
    12a9:	06                   	push   es
    12aa:	3d 48 00 02 04       	cmp    eax,0x4020048
    12af:	01 06                	add    DWORD PTR [esi],eax
    12b1:	9e                   	sahf   
    12b2:	00 02                	add    BYTE PTR [edx],al
    12b4:	04 04                	add    al,0x4
    12b6:	02 23                	add    ah,BYTE PTR [ebx]
    12b8:	12 00                	adc    al,BYTE PTR [eax]
    12ba:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    12c1:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    12c4:	74 00                	je     12c6 <sysEnter_Vector-0x12ed3a>
    12c6:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    12c9:	58                   	pop    eax
    12ca:	06                   	push   es
    12cb:	94                   	xchg   esp,eax
    12cc:	e5 91                	in     eax,0x91
    12ce:	9f                   	lahf   
    12cf:	59                   	pop    ecx
    12d0:	00 02                	add    BYTE PTR [edx],al
    12d2:	04 01                	add    al,0x1
    12d4:	06                   	push   es
    12d5:	9e                   	sahf   
    12d6:	00 02                	add    BYTE PTR [edx],al
    12d8:	04 04                	add    al,0x4
    12da:	02 23                	add    ah,BYTE PTR [ebx]
    12dc:	12 00                	adc    al,BYTE PTR [eax]
    12de:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    12e5:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    12e8:	74 00                	je     12ea <sysEnter_Vector-0x12ed16>
    12ea:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    12ed:	58                   	pop    eax
    12ee:	00 02                	add    BYTE PTR [edx],al
    12f0:	04 08                	add    al,0x8
    12f2:	06                   	push   es
    12f3:	08 9f e2 00 02 04    	or     BYTE PTR [edi+0x40200e2],bl
    12f9:	01 06                	add    DWORD PTR [esi],eax
    12fb:	9e                   	sahf   
    12fc:	00 02                	add    BYTE PTR [edx],al
    12fe:	04 04                	add    al,0x4
    1300:	02 23                	add    ah,BYTE PTR [ebx]
    1302:	12 00                	adc    al,BYTE PTR [eax]
    1304:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    130b:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    130e:	74 00                	je     1310 <sysEnter_Vector-0x12ecf0>
    1310:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1313:	58                   	pop    eax
    1314:	06                   	push   es
    1315:	08 f6                	or     dh,dh
    1317:	d7                   	xlat   BYTE PTR ds:[ebx]
    1318:	9f                   	lahf   
    1319:	3d 68 08 16 08       	cmp    eax,0x8160868
    131e:	3d 08 4b 5a 08       	cmp    eax,0x85a4b08
    1323:	15 08 3d 08 3d       	adc    eax,0x3d083d08
    1328:	5a                   	pop    edx
    1329:	08 44 02 2e          	or     BYTE PTR [edx+eax*1+0x2e],al
    132d:	13 02                	adc    eax,DWORD PTR [edx]
    132f:	3a 13                	cmp    dl,BYTE PTR [ebx]
    1331:	91                   	xchg   ecx,eax
    1332:	c9                   	leave  
    1333:	e6 02                	out    0x2,al
    1335:	2f                   	das    
    1336:	13 02                	adc    eax,DWORD PTR [edx]
    1338:	3c 13                	cmp    al,0x13
    133a:	9f                   	lahf   
    133b:	e5 e6                	in     eax,0xe6
    133d:	08 c9                	or     cl,cl
    133f:	02 2c 13             	add    ch,BYTE PTR [ebx+edx*1]
    1342:	9f                   	lahf   
    1343:	e5 4c                	in     eax,0x4c
    1345:	02 29                	add    ch,BYTE PTR [ecx]
    1347:	13 02                	adc    eax,DWORD PTR [edx]
    1349:	2b 13                	sub    edx,DWORD PTR [ebx]
    134b:	9f                   	lahf   
    134c:	e5 e6                	in     eax,0xe6
    134e:	bb 59 08 83 e5       	mov    ebx,0xe5830859
    1353:	a0 00 02 04 01       	mov    al,ds:0x1040200
    1358:	06                   	push   es
    1359:	c8 00 02 04          	enter  0x200,0x4
    135d:	04 02                	add    al,0x2
    135f:	2c 12                	sub    al,0x12
    1361:	00 02                	add    BYTE PTR [edx],al
    1363:	04 05                	add    al,0x5
    1365:	02 2f                	add    ch,BYTE PTR [edi]
    1367:	12 00                	adc    al,BYTE PTR [eax]
    1369:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    136c:	74 00                	je     136e <sysEnter_Vector-0x12ec92>
    136e:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1371:	58                   	pop    eax
    1372:	06                   	push   es
    1373:	08 99 a5 59 00 02    	or     BYTE PTR [ecx+0x20059a5],bl
    1379:	04 01                	add    al,0x1
    137b:	06                   	push   es
    137c:	c8 00 02 04          	enter  0x200,0x4
    1380:	04 02                	add    al,0x2
    1382:	2c 12                	sub    al,0x12
    1384:	00 02                	add    BYTE PTR [edx],al
    1386:	04 05                	add    al,0x5
    1388:	02 2f                	add    ch,BYTE PTR [edi]
    138a:	12 00                	adc    al,BYTE PTR [eax]
    138c:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    138f:	74 00                	je     1391 <sysEnter_Vector-0x12ec6f>
    1391:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1394:	58                   	pop    eax
    1395:	00 02                	add    BYTE PTR [edx],al
    1397:	04 08                	add    al,0x8
    1399:	06                   	push   es
    139a:	08 9f 08 91 9f e0    	or     BYTE PTR [edi-0x1f606ef8],bl
    13a0:	00 02                	add    BYTE PTR [edx],al
    13a2:	04 01                	add    al,0x1
    13a4:	06                   	push   es
    13a5:	c8 00 02 04          	enter  0x200,0x4
    13a9:	04 02                	add    al,0x2
    13ab:	2c 12                	sub    al,0x12
    13ad:	00 02                	add    BYTE PTR [edx],al
    13af:	04 05                	add    al,0x5
    13b1:	02 2f                	add    ch,BYTE PTR [edi]
    13b3:	12 00                	adc    al,BYTE PTR [eax]
    13b5:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    13b8:	74 00                	je     13ba <sysEnter_Vector-0x12ec46>
    13ba:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    13bd:	58                   	pop    eax
    13be:	06                   	push   es
    13bf:	08 f9                	or     cl,bh
    13c1:	bb 75 00 02 04       	mov    ebx,0x4020075
    13c6:	01 06                	add    DWORD PTR [esi],eax
    13c8:	08 2e                	or     BYTE PTR [esi],ch
    13ca:	06                   	push   es
    13cb:	9f                   	lahf   
    13cc:	75 75                	jne    1443 <sysEnter_Vector-0x12ebbd>
    13ce:	7b d8                	jnp    13a8 <sysEnter_Vector-0x12ec58>
    13d0:	00 02                	add    BYTE PTR [edx],al
    13d2:	04 01                	add    al,0x1
    13d4:	06                   	push   es
    13d5:	c8 06 75 e5          	enter  0x7506,0xe5
    13d9:	00 02                	add    BYTE PTR [edx],al
    13db:	04 01                	add    al,0x1
    13dd:	06                   	push   es
    13de:	02 22                	add    ah,BYTE PTR [edx]
    13e0:	12 06                	adc    al,BYTE PTR [esi]
    13e2:	4b                   	dec    ebx
    13e3:	00 02                	add    BYTE PTR [edx],al
    13e5:	04 01                	add    al,0x1
    13e7:	06                   	push   es
    13e8:	08 ba 00 02 04 03    	or     BYTE PTR [edx+0x3040200],bh
    13ee:	02 22                	add    ah,BYTE PTR [edx]
    13f0:	12 00                	adc    al,BYTE PTR [eax]
    13f2:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    13f5:	74 00                	je     13f7 <sysEnter_Vector-0x12ec09>
    13f7:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    13fa:	58                   	pop    eax
    13fb:	00 02                	add    BYTE PTR [edx],al
    13fd:	04 06                	add    al,0x6
    13ff:	06                   	push   es
    1400:	59                   	pop    ecx
    1401:	00 02                	add    BYTE PTR [edx],al
    1403:	04 01                	add    al,0x1
    1405:	06                   	push   es
    1406:	02 40 12             	add    al,BYTE PTR [eax+0x12]
    1409:	00 02                	add    BYTE PTR [edx],al
    140b:	04 03                	add    al,0x3
    140d:	02 42 12             	add    al,BYTE PTR [edx+0x12]
    1410:	00 02                	add    BYTE PTR [edx],al
    1412:	04 04                	add    al,0x4
    1414:	74 00                	je     1416 <sysEnter_Vector-0x12ebea>
    1416:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1419:	58                   	pop    eax
    141a:	00 02                	add    BYTE PTR [edx],al
    141c:	04 06                	add    al,0x6
    141e:	06                   	push   es
    141f:	59                   	pop    ecx
    1420:	00 02                	add    BYTE PTR [edx],al
    1422:	04 01                	add    al,0x1
    1424:	06                   	push   es
    1425:	02 43 12             	add    al,BYTE PTR [ebx+0x12]
    1428:	00 02                	add    BYTE PTR [edx],al
    142a:	04 03                	add    al,0x3
    142c:	02 48 12             	add    cl,BYTE PTR [eax+0x12]
    142f:	00 02                	add    BYTE PTR [edx],al
    1431:	04 04                	add    al,0x4
    1433:	74 00                	je     1435 <sysEnter_Vector-0x12ebcb>
    1435:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1438:	58                   	pop    eax
    1439:	00 02                	add    BYTE PTR [edx],al
    143b:	04 06                	add    al,0x6
    143d:	06                   	push   es
    143e:	5a                   	pop    edx
    143f:	00 02                	add    BYTE PTR [edx],al
    1441:	04 06                	add    al,0x6
    1443:	c9                   	leave  
    1444:	2f                   	das    
    1445:	00 02                	add    BYTE PTR [edx],al
    1447:	04 01                	add    al,0x1
    1449:	06                   	push   es
    144a:	9e                   	sahf   
    144b:	00 02                	add    BYTE PTR [edx],al
    144d:	04 04                	add    al,0x4
    144f:	02 23                	add    ah,BYTE PTR [ebx]
    1451:	12 00                	adc    al,BYTE PTR [eax]
    1453:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    145a:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    145d:	74 00                	je     145f <sysEnter_Vector-0x12eba1>
    145f:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1462:	58                   	pop    eax
    1463:	00 02                	add    BYTE PTR [edx],al
    1465:	04 08                	add    al,0x8
    1467:	06                   	push   es
    1468:	08 75 48             	or     BYTE PTR [ebp+0x48],dh
    146b:	e8 bb 00 02 04       	call   402152b <sysEnter_Vector+0x3ef152b>
    1470:	01 06                	add    DWORD PTR [esi],eax
    1472:	ba 06 4b 68 91       	mov    edx,0x91684b06
    1477:	02 31                	add    dh,BYTE PTR [ecx]
    1479:	14 02                	adc    al,0x2
    147b:	2c 14                	sub    al,0x14
    147d:	00 02                	add    BYTE PTR [edx],al
    147f:	04 01                	add    al,0x1
    1481:	06                   	push   es
    1482:	02 29                	add    ch,BYTE PTR [ecx]
    1484:	12 06                	adc    al,BYTE PTR [esi]
    1486:	4b                   	dec    ebx
    1487:	bd 00 02 04 01       	mov    ebp,0x1040200
    148c:	06                   	push   es
    148d:	ba 00 02 04 03       	mov    edx,0x3040200
    1492:	06                   	push   es
    1493:	08 59 00             	or     BYTE PTR [ecx+0x0],bl
    1496:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
    1499:	81 4b e5 4c ae 9f ae 	or     DWORD PTR [ebx-0x1b],0xae9fae4c
    14a0:	77 00                	ja     14a2 <sysEnter_Vector-0x12eb5e>
    14a2:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    14a5:	06                   	push   es
    14a6:	82                   	(bad)  
    14a7:	06                   	push   es
    14a8:	4b                   	dec    ebx
    14a9:	68 00 02 04 01       	push   0x1040200
    14ae:	06                   	push   es
    14af:	66 06                	pushw  es
    14b1:	85 3d 02 08 00 01    	test   DWORD PTR ds:0x1000802,edi
    14b7:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6c                   	ins    BYTE PTR es:[edi],dx
   1:	6f                   	outs   dx,DWORD PTR ds:[esi]
   2:	6e                   	outs   dx,BYTE PTR ds:[esi]
   3:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
   7:	6e                   	outs   dx,BYTE PTR ds:[esi]
   8:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
   c:	74 00                	je     e <sysEnter_Vector-0x12fff2>
   e:	73 68                	jae    78 <sysEnter_Vector-0x12ff88>
  10:	6f                   	outs   dx,DWORD PTR ds:[esi]
  11:	72 74                	jb     87 <sysEnter_Vector-0x12ff79>
  13:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
  16:	73 69                	jae    81 <sysEnter_Vector-0x12ff7f>
  18:	67 6e                	outs   dx,BYTE PTR ds:[si]
  1a:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  1f:	74 00                	je     21 <sysEnter_Vector-0x12ffdf>
  21:	73 74                	jae    97 <sysEnter_Vector-0x12ff69>
  23:	72 63                	jb     88 <sysEnter_Vector-0x12ff78>
  25:	68 72 00 6c 6f       	push   0x6f6c0072
  2a:	6e                   	outs   dx,BYTE PTR ds:[esi]
  2b:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  2f:	6e                   	outs   dx,BYTE PTR ds:[esi]
  30:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
  34:	73 69                	jae    9f <sysEnter_Vector-0x12ff61>
  36:	67 6e                	outs   dx,BYTE PTR ds:[si]
  38:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  3d:	74 00                	je     3f <sysEnter_Vector-0x12ffc1>
  3f:	68 65 61 70 42       	push   0x42706165
  44:	61                   	popa   
  45:	73 65                	jae    ac <sysEnter_Vector-0x12ff54>
  47:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
  4b:	63 54 5a 00          	arpl   WORD PTR [edx+ebx*2+0x0],dx
  4f:	75 6e                	jne    bf <sysEnter_Vector-0x12ff41>
  51:	73 69                	jae    bc <sysEnter_Vector-0x12ff44>
  53:	67 6e                	outs   dx,BYTE PTR ds:[si]
  55:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
  5a:	61                   	popa   
  5b:	72 00                	jb     5d <sysEnter_Vector-0x12ffa3>
  5d:	74 69                	je     c8 <sysEnter_Vector-0x12ff38>
  5f:	6d                   	ins    DWORD PTR es:[edi],dx
  60:	65                   	gs
  61:	5f                   	pop    edi
  62:	74 00                	je     64 <sysEnter_Vector-0x12ff9c>
  64:	75 69                	jne    cf <sysEnter_Vector-0x12ff31>
  66:	6e                   	outs   dx,BYTE PTR ds:[esi]
  67:	74 33                	je     9c <sysEnter_Vector-0x12ff64>
  69:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
  6c:	00 2f                	add    BYTE PTR [edi],ch
  6e:	68 6f 6d 65 2f       	push   0x2f656d6f
  73:	79 6f                	jns    e4 <sysEnter_Vector-0x12ff1c>
  75:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  7c:	6f                   	outs   dx,DWORD PTR ds:[esi]
  7d:	73 2f                	jae    ae <sysEnter_Vector-0x12ff52>
  7f:	61                   	popa   
  80:	70 72                	jo     f4 <sysEnter_Vector-0x12ff0c>
  82:	6f                   	outs   dx,DWORD PTR ds:[esi]
  83:	6a 2f                	push   0x2f
  85:	6c                   	ins    BYTE PTR es:[edi],dx
  86:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  8d:	4f                   	dec    edi
  8e:	53                   	push   ebx
  8f:	00 5f 42             	add    BYTE PTR [edi+0x42],bl
  92:	6f                   	outs   dx,DWORD PTR ds:[esi]
  93:	6f                   	outs   dx,DWORD PTR ds:[esi]
  94:	6c                   	ins    BYTE PTR es:[edi],dx
  95:	00 6c 6f 6e          	add    BYTE PTR [edi+ebp*2+0x6e],ch
  99:	67 20 64 6f          	and    BYTE PTR [si+0x6f],ah
  9d:	75 62                	jne    101 <sysEnter_Vector-0x12feff>
  9f:	6c                   	ins    BYTE PTR es:[edi],dx
  a0:	65 00 73 74          	add    BYTE PTR gs:[ebx+0x74],dh
  a4:	72 63                	jb     109 <sysEnter_Vector-0x12fef7>
  a6:	68 72 49 00 68       	push   0x68004972
  ab:	65                   	gs
  ac:	61                   	popa   
  ad:	70 43                	jo     f2 <sysEnter_Vector-0x12ff0e>
  af:	75 72                	jne    123 <sysEnter_Vector-0x12fedd>
  b1:	72 00                	jb     b3 <sysEnter_Vector-0x12ff4d>
  b3:	2e                   	cs
  b4:	2e                   	cs
  b5:	2f                   	das    
  b6:	2e                   	cs
  b7:	2e                   	cs
  b8:	2f                   	das    
  b9:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
  bd:	6a 2f                	push   0x2f
  bf:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
  c2:	69 73 4f 53 2f 73 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72732f53
  c9:	63 2f                	arpl   WORD PTR [edi],bp
  cb:	73 74                	jae    141 <sysEnter_Vector-0x12febf>
  cd:	72 69                	jb     138 <sysEnter_Vector-0x12fec8>
  cf:	6e                   	outs   dx,BYTE PTR ds:[esi]
  d0:	67 73 2f             	addr16 jae 102 <sysEnter_Vector-0x12fefe>
  d3:	73 74                	jae    149 <sysEnter_Vector-0x12feb7>
  d5:	72 63                	jb     13a <sysEnter_Vector-0x12fec6>
  d7:	68 72 2e 63 00       	push   0x632e72
  dc:	73 69                	jae    147 <sysEnter_Vector-0x12feb9>
  de:	7a 65                	jp     145 <sysEnter_Vector-0x12febb>
  e0:	74 79                	je     15b <sysEnter_Vector-0x12fea5>
  e2:	70 65                	jo     149 <sysEnter_Vector-0x12feb7>
  e4:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
  e7:	6f                   	outs   dx,DWORD PTR ds:[esi]
  e8:	72 74                	jb     15e <sysEnter_Vector-0x12fea2>
  ea:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
  ed:	74 00                	je     ef <sysEnter_Vector-0x12ff11>
  ef:	47                   	inc    edi
  f0:	4e                   	dec    esi
  f1:	55                   	push   ebp
  f2:	20 43 31             	and    BYTE PTR [ebx+0x31],al
  f5:	31 20                	xor    DWORD PTR [eax],esp
  f7:	35 2e 33 2e 30       	xor    eax,0x302e332e
  fc:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
 102:	3d 69 6e 74 65       	cmp    eax,0x65746e69
 107:	6c                   	ins    BYTE PTR es:[edi],dx
 108:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
 10e:	65                   	gs
 10f:	3d 67 65 6e 65       	cmp    eax,0x656e6567
 114:	72 69                	jb     17f <sysEnter_Vector-0x12fe81>
 116:	63 20                	arpl   WORD PTR [eax],sp
 118:	2d 6d 61 72 63       	sub    eax,0x6372616d
 11d:	68 3d 70 65 6e       	push   0x6e65703d
 122:	74 69                	je     18d <sysEnter_Vector-0x12fe73>
 124:	75 6d                	jne    193 <sysEnter_Vector-0x12fe6d>
 126:	70 72                	jo     19a <sysEnter_Vector-0x12fe66>
 128:	6f                   	outs   dx,DWORD PTR ds:[esi]
 129:	20 2d 67 20 2d 66    	and    BYTE PTR ds:0x662d2067,ch
 12f:	66                   	data16
 130:	72 65                	jb     197 <sysEnter_Vector-0x12fe69>
 132:	65                   	gs
 133:	73 74                	jae    1a9 <sysEnter_Vector-0x12fe57>
 135:	61                   	popa   
 136:	6e                   	outs   dx,BYTE PTR ds:[esi]
 137:	64 69 6e 67 20 2d 66 	imul   ebp,DWORD PTR fs:[esi+0x67],0x76662d20
 13e:	76 
 13f:	69 73 69 62 69 6c 69 	imul   esi,DWORD PTR [ebx+0x69],0x696c6962
 146:	74 79                	je     1c1 <sysEnter_Vector-0x12fe3f>
 148:	3d 68 69 64 64       	cmp    eax,0x64646968
 14d:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 14f:	20 2d 66 50 49 43    	and    BYTE PTR ds:0x43495066,ch
 155:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 158:	61                   	popa   
 159:	70 45                	jo     1a0 <sysEnter_Vector-0x12fe60>
 15b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 15c:	64 00 73 74          	add    BYTE PTR fs:[ebx+0x74],dh
 160:	72 69                	jb     1cb <sysEnter_Vector-0x12fe35>
 162:	6e                   	outs   dx,BYTE PTR ds:[esi]
 163:	67 00 63 68          	add    BYTE PTR [bp+di+0x68],ah
 167:	61                   	popa   
 168:	72 73                	jb     1dd <sysEnter_Vector-0x12fe23>
 16a:	00 2e                	add    BYTE PTR [esi],ch
 16c:	2e                   	cs
 16d:	2f                   	das    
 16e:	2e                   	cs
 16f:	2e                   	cs
 170:	2f                   	das    
 171:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 175:	6a 2f                	push   0x2f
 177:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 17a:	69 73 4f 53 2f 73 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72732f53
 181:	63 2f                	arpl   WORD PTR [edi],bp
 183:	73 74                	jae    1f9 <sysEnter_Vector-0x12fe07>
 185:	72 69                	jb     1f0 <sysEnter_Vector-0x12fe10>
 187:	6e                   	outs   dx,BYTE PTR ds:[esi]
 188:	67 73 2f             	addr16 jae 1ba <sysEnter_Vector-0x12fe46>
 18b:	73 74                	jae    201 <sysEnter_Vector-0x12fdff>
 18d:	72 63                	jb     1f2 <sysEnter_Vector-0x12fe0e>
 18f:	73 70                	jae    201 <sysEnter_Vector-0x12fdff>
 191:	6e                   	outs   dx,BYTE PTR ds:[esi]
 192:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 195:	73 74                	jae    20b <sysEnter_Vector-0x12fdf5>
 197:	72 63                	jb     1fc <sysEnter_Vector-0x12fe04>
 199:	73 70                	jae    20b <sysEnter_Vector-0x12fdf5>
 19b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 19c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 19f:	72 63                	jb     204 <sysEnter_Vector-0x12fdfc>
 1a1:	73 70                	jae    213 <sysEnter_Vector-0x12fded>
 1a3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1a4:	49                   	dec    ecx
 1a5:	00 2e                	add    BYTE PTR [esi],ch
 1a7:	2e                   	cs
 1a8:	2f                   	das    
 1a9:	2e                   	cs
 1aa:	2e                   	cs
 1ab:	2f                   	das    
 1ac:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 1b0:	6a 2f                	push   0x2f
 1b2:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 1b5:	69 73 4f 53 2f 73 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72732f53
 1bc:	63 2f                	arpl   WORD PTR [edi],bp
 1be:	73 74                	jae    234 <sysEnter_Vector-0x12fdcc>
 1c0:	72 69                	jb     22b <sysEnter_Vector-0x12fdd5>
 1c2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1c3:	67 73 2f             	addr16 jae 1f5 <sysEnter_Vector-0x12fe0b>
 1c6:	73 74                	jae    23c <sysEnter_Vector-0x12fdc4>
 1c8:	72 74                	jb     23e <sysEnter_Vector-0x12fdc2>
 1ca:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1cb:	6b 2e 63             	imul   ebp,DWORD PTR [esi],0x63
 1ce:	00 64 65 6c          	add    BYTE PTR [ebp+eiz*2+0x6c],ah
 1d2:	69 6d 00 6c 61 73 74 	imul   ebp,DWORD PTR [ebp+0x0],0x7473616c
 1d9:	73 00                	jae    1db <sysEnter_Vector-0x12fe25>
 1db:	73 74                	jae    251 <sysEnter_Vector-0x12fdaf>
 1dd:	72 74                	jb     253 <sysEnter_Vector-0x12fdad>
 1df:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1e0:	6b 00 73             	imul   eax,DWORD PTR [eax],0x73
 1e3:	74 72                	je     257 <sysEnter_Vector-0x12fda9>
 1e5:	65                   	gs
 1e6:	61                   	popa   
 1e7:	6d                   	ins    DWORD PTR es:[edi],dx
 1e8:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 1eb:	53                   	push   ebx
 1ec:	43                   	inc    ebx
 1ed:	41                   	inc    ecx
 1ee:	4c                   	dec    esp
 1ef:	4c                   	dec    esp
 1f0:	5f                   	pop    edi
 1f1:	47                   	inc    edi
 1f2:	45                   	inc    ebp
 1f3:	54                   	push   esp
 1f4:	54                   	push   esp
 1f5:	49                   	dec    ecx
 1f6:	43                   	inc    ebx
 1f7:	4b                   	dec    ebx
 1f8:	53                   	push   ebx
 1f9:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 1fc:	53                   	push   ebx
 1fd:	43                   	inc    ebx
 1fe:	41                   	inc    ecx
 1ff:	4c                   	dec    esp
 200:	4c                   	dec    esp
 201:	5f                   	pop    edi
 202:	48                   	dec    eax
 203:	4c                   	dec    esp
 204:	54                   	push   esp
 205:	00 62 75             	add    BYTE PTR [edx+0x75],ah
 208:	66                   	data16
 209:	66                   	data16
 20a:	65                   	gs
 20b:	72 00                	jb     20d <sysEnter_Vector-0x12fdf3>
 20d:	67                   	addr16
 20e:	65                   	gs
 20f:	74 73                	je     284 <sysEnter_Vector-0x12fd7c>
 211:	45                   	inc    ebp
 212:	72 72                	jb     286 <sysEnter_Vector-0x12fd7a>
 214:	6f                   	outs   dx,DWORD PTR ds:[esi]
 215:	72 00                	jb     217 <sysEnter_Vector-0x12fde9>
 217:	73 72                	jae    28b <sysEnter_Vector-0x12fd75>
 219:	63 2f                	arpl   WORD PTR [edi],bp
 21b:	69 6e 70 75 74 2f 69 	imul   ebp,DWORD PTR [esi+0x70],0x692f7475
 222:	6e                   	outs   dx,BYTE PTR ds:[esi]
 223:	70 75                	jo     29a <sysEnter_Vector-0x12fd66>
 225:	74 2e                	je     255 <sysEnter_Vector-0x12fdab>
 227:	63 00                	arpl   WORD PTR [eax],ax
 229:	65                   	gs
 22a:	73 79                	jae    2a5 <sysEnter_Vector-0x12fd5b>
 22c:	73 63                	jae    291 <sysEnter_Vector-0x12fd6f>
 22e:	61                   	popa   
 22f:	6c                   	ins    BYTE PTR es:[edi],dx
 230:	6c                   	ins    BYTE PTR es:[edi],dx
 231:	73 00                	jae    233 <sysEnter_Vector-0x12fdcd>
 233:	53                   	push   ebx
 234:	59                   	pop    ecx
 235:	53                   	push   ebx
 236:	43                   	inc    ebx
 237:	41                   	inc    ecx
 238:	4c                   	dec    esp
 239:	4c                   	dec    esp
 23a:	5f                   	pop    edi
 23b:	57                   	push   edi
 23c:	41                   	inc    ecx
 23d:	49                   	dec    ecx
 23e:	54                   	push   esp
 23f:	46                   	inc    esi
 240:	4f                   	dec    edi
 241:	52                   	push   edx
 242:	50                   	push   eax
 243:	49                   	dec    ecx
 244:	44                   	inc    esp
 245:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 248:	53                   	push   ebx
 249:	43                   	inc    ebx
 24a:	41                   	inc    ecx
 24b:	4c                   	dec    esp
 24c:	4c                   	dec    esp
 24d:	5f                   	pop    edi
 24e:	53                   	push   ebx
 24f:	45                   	inc    ebp
 250:	54                   	push   esp
 251:	53                   	push   ebx
 252:	49                   	dec    ecx
 253:	47                   	inc    edi
 254:	41                   	inc    ecx
 255:	43                   	inc    ebx
 256:	54                   	push   esp
 257:	49                   	dec    ecx
 258:	4f                   	dec    edi
 259:	4e                   	dec    esi
 25a:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 25d:	63 68 61             	arpl   WORD PTR [eax+0x61],bp
 260:	72 00                	jb     262 <sysEnter_Vector-0x12fd9e>
 262:	53                   	push   ebx
 263:	59                   	pop    ecx
 264:	53                   	push   ebx
 265:	43                   	inc    ebx
 266:	41                   	inc    ecx
 267:	4c                   	dec    esp
 268:	4c                   	dec    esp
 269:	5f                   	pop    edi
 26a:	53                   	push   ebx
 26b:	4c                   	dec    esp
 26c:	45                   	inc    ebp
 26d:	45                   	inc    ebp
 26e:	50                   	push   eax
 26f:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 272:	74 63                	je     2d7 <sysEnter_Vector-0x12fd29>
 274:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 277:	78 6c                	js     2e5 <sysEnter_Vector-0x12fd1b>
 279:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 27b:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 27e:	53                   	push   ebx
 27f:	43                   	inc    ebx
 280:	41                   	inc    ecx
 281:	4c                   	dec    esp
 282:	4c                   	dec    esp
 283:	5f                   	pop    edi
 284:	50                   	push   eax
 285:	52                   	push   edx
 286:	49                   	dec    ecx
 287:	4e                   	dec    esi
 288:	54                   	push   esp
 289:	44                   	inc    esp
 28a:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 28d:	53                   	push   ebx
 28e:	43                   	inc    ebx
 28f:	41                   	inc    ecx
 290:	4c                   	dec    esp
 291:	4c                   	dec    esp
 292:	5f                   	pop    edi
 293:	41                   	inc    ecx
 294:	4c                   	dec    esp
 295:	4c                   	dec    esp
 296:	4f                   	dec    edi
 297:	43                   	inc    ebx
 298:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 29b:	74 73                	je     310 <sysEnter_Vector-0x12fcf0>
 29d:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2a0:	53                   	push   ebx
 2a1:	43                   	inc    ebx
 2a2:	41                   	inc    ecx
 2a3:	4c                   	dec    esp
 2a4:	4c                   	dec    esp
 2a5:	5f                   	pop    edi
 2a6:	52                   	push   edx
 2a7:	45                   	inc    ebp
 2a8:	41                   	inc    ecx
 2a9:	44                   	inc    esp
 2aa:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2ad:	53                   	push   ebx
 2ae:	43                   	inc    ebx
 2af:	41                   	inc    ecx
 2b0:	4c                   	dec    esp
 2b1:	4c                   	dec    esp
 2b2:	5f                   	pop    edi
 2b3:	45                   	inc    ebp
 2b4:	58                   	pop    eax
 2b5:	45                   	inc    ebp
 2b6:	43                   	inc    ebx
 2b7:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2ba:	53                   	push   ebx
 2bb:	43                   	inc    ebx
 2bc:	41                   	inc    ecx
 2bd:	4c                   	dec    esp
 2be:	4c                   	dec    esp
 2bf:	5f                   	pop    edi
 2c0:	45                   	inc    ebp
 2c1:	4e                   	dec    esi
 2c2:	44                   	inc    esp
 2c3:	50                   	push   eax
 2c4:	52                   	push   edx
 2c5:	4f                   	dec    edi
 2c6:	43                   	inc    ebx
 2c7:	45                   	inc    ebp
 2c8:	53                   	push   ebx
 2c9:	53                   	push   ebx
 2ca:	00 70 75             	add    BYTE PTR [eax+0x75],dh
 2cd:	74 63                	je     332 <sysEnter_Vector-0x12fcce>
 2cf:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2d2:	53                   	push   ebx
 2d3:	43                   	inc    ebx
 2d4:	41                   	inc    ecx
 2d5:	4c                   	dec    esp
 2d6:	4c                   	dec    esp
 2d7:	5f                   	pop    edi
 2d8:	52                   	push   edx
 2d9:	45                   	inc    ebp
 2da:	47                   	inc    edi
 2db:	45                   	inc    ebp
 2dc:	58                   	pop    eax
 2dd:	49                   	dec    ecx
 2de:	54                   	push   esp
 2df:	48                   	dec    eax
 2e0:	41                   	inc    ecx
 2e1:	4e                   	dec    esi
 2e2:	44                   	inc    esp
 2e3:	4c                   	dec    esp
 2e4:	45                   	inc    ebp
 2e5:	52                   	push   edx
 2e6:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2e9:	53                   	push   ebx
 2ea:	43                   	inc    ebx
 2eb:	41                   	inc    ecx
 2ec:	4c                   	dec    esp
 2ed:	4c                   	dec    esp
 2ee:	5f                   	pop    edi
 2ef:	46                   	inc    esi
 2f0:	52                   	push   edx
 2f1:	45                   	inc    ebp
 2f2:	45                   	inc    ebp
 2f3:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2f6:	53                   	push   ebx
 2f7:	43                   	inc    ebx
 2f8:	41                   	inc    ecx
 2f9:	4c                   	dec    esp
 2fa:	4c                   	dec    esp
 2fb:	5f                   	pop    edi
 2fc:	53                   	push   ebx
 2fd:	54                   	push   esp
 2fe:	4f                   	dec    edi
 2ff:	50                   	push   eax
 300:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 303:	53                   	push   ebx
 304:	43                   	inc    ebx
 305:	41                   	inc    ecx
 306:	4c                   	dec    esp
 307:	4c                   	dec    esp
 308:	5f                   	pop    edi
 309:	57                   	push   edi
 30a:	52                   	push   edx
 30b:	49                   	dec    ecx
 30c:	54                   	push   esp
 30d:	45                   	inc    ebp
 30e:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 311:	53                   	push   ebx
 312:	43                   	inc    ebx
 313:	41                   	inc    ecx
 314:	4c                   	dec    esp
 315:	4c                   	dec    esp
 316:	5f                   	pop    edi
 317:	49                   	dec    ecx
 318:	4e                   	dec    esi
 319:	56                   	push   esi
 31a:	41                   	inc    ecx
 31b:	4c                   	dec    esp
 31c:	49                   	dec    ecx
 31d:	44                   	inc    esp
 31e:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 321:	53                   	push   ebx
 322:	43                   	inc    ebx
 323:	41                   	inc    ecx
 324:	4c                   	dec    esp
 325:	4c                   	dec    esp
 326:	5f                   	pop    edi
 327:	52                   	push   edx
 328:	45                   	inc    ebp
 329:	42                   	inc    edx
 32a:	4f                   	dec    edi
 32b:	4f                   	dec    edi
 32c:	54                   	push   esp
 32d:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 330:	53                   	push   ebx
 331:	43                   	inc    ebx
 332:	41                   	inc    ecx
 333:	4c                   	dec    esp
 334:	4c                   	dec    esp
 335:	5f                   	pop    edi
 336:	53                   	push   ebx
 337:	45                   	inc    ebp
 338:	54                   	push   esp
 339:	50                   	push   eax
 33a:	52                   	push   edx
 33b:	49                   	dec    ecx
 33c:	4f                   	dec    edi
 33d:	52                   	push   edx
 33e:	49                   	dec    ecx
 33f:	54                   	push   esp
 340:	59                   	pop    ecx
 341:	00 6c 62 75          	add    BYTE PTR [edx+eiz*2+0x75],ch
 345:	66                   	data16
 346:	00 70 75             	add    BYTE PTR [eax+0x75],dh
 349:	74 73                	je     3be <sysEnter_Vector-0x12fc42>
 34b:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 34e:	53                   	push   ebx
 34f:	43                   	inc    ebx
 350:	41                   	inc    ecx
 351:	4c                   	dec    esp
 352:	4c                   	dec    esp
 353:	5f                   	pop    edi
 354:	50                   	push   eax
 355:	52                   	push   edx
 356:	49                   	dec    ecx
 357:	4e                   	dec    esi
 358:	54                   	push   esp
 359:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 35c:	74 56                	je     3b4 <sysEnter_Vector-0x12fc4c>
 35e:	61                   	popa   
 35f:	6c                   	ins    BYTE PTR es:[edi],dx
 360:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 364:	68 6f 75 72 00       	push   0x72756f
 369:	73 6c                	jae    3d7 <sysEnter_Vector-0x12fc29>
 36b:	65                   	gs
 36c:	65                   	gs
 36d:	70 00                	jo     36f <sysEnter_Vector-0x12fc91>
 36f:	73 69                	jae    3da <sysEnter_Vector-0x12fc26>
 371:	67 44                	addr16 inc esp
 373:	61                   	popa   
 374:	74 61                	je     3d7 <sysEnter_Vector-0x12fc29>
 376:	00 74 68 65          	add    BYTE PTR [eax+ebp*2+0x65],dh
 37a:	54                   	push   esp
 37b:	69 6d 65 00 74 6d 5f 	imul   ebp,DWORD PTR [ebp+0x65],0x5f6d7400
 382:	7a 6f                	jp     3f3 <sysEnter_Vector-0x12fc0d>
 384:	6e                   	outs   dx,BYTE PTR ds:[esi]
 385:	65 00 6c 69 62       	add    BYTE PTR gs:[ecx+ebp*2+0x62],ch
 38a:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
 38d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 38e:	69 74 00 70 72 69 6e 	imul   esi,DWORD PTR [eax+eax*1+0x70],0x746e6972
 395:	74 
 396:	00 5f 5f             	add    BYTE PTR [edi+0x5f],bl
 399:	62 75 69             	bound  esi,QWORD PTR [ebp+0x69]
 39c:	6c                   	ins    BYTE PTR es:[edi],dx
 39d:	74 69                	je     408 <sysEnter_Vector-0x12fbf8>
 39f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3a0:	5f                   	pop    edi
 3a1:	76 61                	jbe    404 <sysEnter_Vector-0x12fbfc>
 3a3:	5f                   	pop    edi
 3a4:	6c                   	ins    BYTE PTR es:[edi],dx
 3a5:	69 73 74 00 74 6d 5f 	imul   esi,DWORD PTR [ebx+0x74],0x5f6d7400
 3ac:	6d                   	ins    DWORD PTR es:[edi],dx
 3ad:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3ae:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3af:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 3b3:	79 65                	jns    41a <sysEnter_Vector-0x12fbe6>
 3b5:	61                   	popa   
 3b6:	72 00                	jb     3b8 <sysEnter_Vector-0x12fc48>
 3b8:	67                   	addr16
 3b9:	65                   	gs
 3ba:	74 74                	je     430 <sysEnter_Vector-0x12fbd0>
 3bc:	69 6d 65 00 77 61 69 	imul   ebp,DWORD PTR [ebp+0x65],0x69617700
 3c3:	74 70                	je     435 <sysEnter_Vector-0x12fbcb>
 3c5:	69 64 00 44 65 62 75 	imul   esp,DWORD PTR [eax+eax*1+0x44],0x67756265
 3cc:	67 
 3cd:	4c                   	dec    esp
 3ce:	65                   	gs
 3cf:	76 65                	jbe    436 <sysEnter_Vector-0x12fbca>
 3d1:	6c                   	ins    BYTE PTR es:[edi],dx
 3d2:	00 63 61             	add    BYTE PTR [ebx+0x61],ah
 3d5:	6c                   	ins    BYTE PTR es:[edi],dx
 3d6:	6c                   	ins    BYTE PTR es:[edi],dx
 3d7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3d8:	75 6d                	jne    447 <sysEnter_Vector-0x12fbb9>
 3da:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 3de:	69 73 64 73 74 00 64 	imul   esi,DWORD PTR [ebx+0x64],0x64007473
 3e5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3e6:	5f                   	pop    edi
 3e7:	73 79                	jae    462 <sysEnter_Vector-0x12fb9e>
 3e9:	73 63                	jae    44e <sysEnter_Vector-0x12fbb2>
 3eb:	61                   	popa   
 3ec:	6c                   	ins    BYTE PTR es:[edi],dx
 3ed:	6c                   	ins    BYTE PTR es:[edi],dx
 3ee:	31 00                	xor    DWORD PTR [eax],eax
 3f0:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 3f2:	5f                   	pop    edi
 3f3:	73 79                	jae    46e <sysEnter_Vector-0x12fb92>
 3f5:	73 63                	jae    45a <sysEnter_Vector-0x12fba6>
 3f7:	61                   	popa   
 3f8:	6c                   	ins    BYTE PTR es:[edi],dx
 3f9:	6c                   	ins    BYTE PTR es:[edi],dx
 3fa:	32 00                	xor    al,BYTE PTR [eax]
 3fc:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 3fe:	5f                   	pop    edi
 3ff:	73 79                	jae    47a <sysEnter_Vector-0x12fb86>
 401:	73 63                	jae    466 <sysEnter_Vector-0x12fb9a>
 403:	61                   	popa   
 404:	6c                   	ins    BYTE PTR es:[edi],dx
 405:	6c                   	ins    BYTE PTR es:[edi],dx
 406:	33 00                	xor    eax,DWORD PTR [eax]
 408:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 40a:	5f                   	pop    edi
 40b:	73 79                	jae    486 <sysEnter_Vector-0x12fb7a>
 40d:	73 63                	jae    472 <sysEnter_Vector-0x12fb8e>
 40f:	61                   	popa   
 410:	6c                   	ins    BYTE PTR es:[edi],dx
 411:	6c                   	ins    BYTE PTR es:[edi],dx
 412:	34 00                	xor    al,0x0
 414:	74 6d                	je     483 <sysEnter_Vector-0x12fb7d>
 416:	5f                   	pop    edi
 417:	6d                   	ins    DWORD PTR es:[edi],dx
 418:	69 6e 00 74 69 63 6b 	imul   ebp,DWORD PTR [esi+0x0],0x6b636974
 41f:	73 00                	jae    421 <sysEnter_Vector-0x12fbdf>
 421:	74 6d                	je     490 <sysEnter_Vector-0x12fb70>
 423:	5f                   	pop    edi
 424:	79 64                	jns    48a <sysEnter_Vector-0x12fb76>
 426:	61                   	popa   
 427:	79 00                	jns    429 <sysEnter_Vector-0x12fbd7>
 429:	5f                   	pop    edi
 42a:	5f                   	pop    edi
 42b:	67 6e                	outs   dx,BYTE PTR ds:[si]
 42d:	75 63                	jne    492 <sysEnter_Vector-0x12fb6e>
 42f:	5f                   	pop    edi
 430:	76 61                	jbe    493 <sysEnter_Vector-0x12fb6d>
 432:	5f                   	pop    edi
 433:	6c                   	ins    BYTE PTR es:[edi],dx
 434:	69 73 74 00 70 72 69 	imul   esi,DWORD PTR [ebx+0x74],0x69727000
 43b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 43c:	74 64                	je     4a2 <sysEnter_Vector-0x12fb5e>
 43e:	49                   	dec    ecx
 43f:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 442:	72 61                	jb     4a5 <sysEnter_Vector-0x12fb5b>
 444:	6d                   	ins    DWORD PTR es:[edi],dx
 445:	31 00                	xor    DWORD PTR [eax],eax
 447:	70 61                	jo     4aa <sysEnter_Vector-0x12fb56>
 449:	72 61                	jb     4ac <sysEnter_Vector-0x12fb54>
 44b:	6d                   	ins    DWORD PTR es:[edi],dx
 44c:	32 00                	xor    al,BYTE PTR [eax]
 44e:	70 61                	jo     4b1 <sysEnter_Vector-0x12fb4f>
 450:	72 61                	jb     4b3 <sysEnter_Vector-0x12fb4d>
 452:	6d                   	ins    DWORD PTR es:[edi],dx
 453:	33 00                	xor    eax,DWORD PTR [eax]
 455:	66 6f                	outs   dx,WORD PTR ds:[esi]
 457:	72 6d                	jb     4c6 <sysEnter_Vector-0x12fb3a>
 459:	61                   	popa   
 45a:	74 00                	je     45c <sysEnter_Vector-0x12fba4>
 45c:	74 6d                	je     4cb <sysEnter_Vector-0x12fb35>
 45e:	5f                   	pop    edi
 45f:	67 6d                	ins    DWORD PTR es:[di],dx
 461:	74 6f                	je     4d2 <sysEnter_Vector-0x12fb2e>
 463:	66                   	data16
 464:	66                   	data16
 465:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 468:	67 6e                	outs   dx,BYTE PTR ds:[si]
 46a:	61                   	popa   
 46b:	6c                   	ins    BYTE PTR es:[edi],dx
 46c:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 46f:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 472:	5f                   	pop    edi
 473:	5f                   	pop    edi
 474:	73 65                	jae    4db <sysEnter_Vector-0x12fb25>
 476:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 479:	64                   	fs
 47a:	73 00                	jae    47c <sysEnter_Vector-0x12fb84>
 47c:	73 72                	jae    4f0 <sysEnter_Vector-0x12fb10>
 47e:	63 2f                	arpl   WORD PTR [edi],bp
 480:	6c                   	ins    BYTE PTR es:[edi],dx
 481:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 488:	4f                   	dec    edi
 489:	53                   	push   ebx
 48a:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 48d:	61                   	popa   
 48e:	72 67                	jb     4f7 <sysEnter_Vector-0x12fb09>
 490:	63 00                	arpl   WORD PTR [eax],ax
 492:	74 6d                	je     501 <sysEnter_Vector-0x12faff>
 494:	5f                   	pop    edi
 495:	77 64                	ja     4fb <sysEnter_Vector-0x12fb05>
 497:	61                   	popa   
 498:	79 00                	jns    49a <sysEnter_Vector-0x12fb66>
 49a:	74 6d                	je     509 <sysEnter_Vector-0x12faf7>
 49c:	5f                   	pop    edi
 49d:	6d                   	ins    DWORD PTR es:[edi],dx
 49e:	64                   	fs
 49f:	61                   	popa   
 4a0:	79 00                	jns    4a2 <sysEnter_Vector-0x12fb5e>
 4a2:	6c                   	ins    BYTE PTR es:[edi],dx
 4a3:	69 62 63 5f 63 6c 65 	imul   esp,DWORD PTR [edx+0x63],0x656c635f
 4aa:	61                   	popa   
 4ab:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4ac:	75 70                	jne    51e <sysEnter_Vector-0x12fae2>
 4ae:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 4b2:	73 65                	jae    519 <sysEnter_Vector-0x12fae7>
 4b4:	63 00                	arpl   WORD PTR [eax],ax
 4b6:	61                   	popa   
 4b7:	72 67                	jb     520 <sysEnter_Vector-0x12fae0>
 4b9:	76 00                	jbe    4bb <sysEnter_Vector-0x12fb45>
 4bb:	73 69                	jae    526 <sysEnter_Vector-0x12fada>
 4bd:	67 48                	addr16 dec eax
 4bf:	61                   	popa   
 4c0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4c1:	64                   	fs
 4c2:	6c                   	ins    BYTE PTR es:[edi],dx
 4c3:	65                   	gs
 4c4:	72 00                	jb     4c6 <sysEnter_Vector-0x12fb3a>
 4c6:	6d                   	ins    DWORD PTR es:[edi],dx
 4c7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4c8:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
 4cf:	6e 
 4d0:	61                   	popa   
 4d1:	6c                   	ins    BYTE PTR es:[edi],dx
 4d2:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 4d5:	67 73 00             	addr16 jae 4d8 <sysEnter_Vector-0x12fb28>
 4d8:	70 72                	jo     54c <sysEnter_Vector-0x12fab4>
 4da:	69 6e 74 49 00 73 74 	imul   ebp,DWORD PTR [esi+0x74],0x74730049
 4e1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4e2:	70 00                	jo     4e4 <sysEnter_Vector-0x12fb1c>
 4e4:	61                   	popa   
 4e5:	6c                   	ins    BYTE PTR es:[edi],dx
 4e6:	6c                   	ins    BYTE PTR es:[edi],dx
 4e7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4e8:	63 61 74             	arpl   WORD PTR [ecx+0x74],sp
 4eb:	65                   	gs
 4ec:	64                   	fs
 4ed:	50                   	push   eax
 4ee:	74 72                	je     562 <sysEnter_Vector-0x12fa9e>
 4f0:	00 66 70             	add    BYTE PTR [esi+0x70],ah
 4f3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4f4:	69 6e 74 65 72 00 6e 	imul   ebp,DWORD PTR [esi+0x74],0x6e007265
 4fb:	65                   	gs
 4fc:	77 53                	ja     551 <sysEnter_Vector-0x12faaf>
 4fe:	69 7a 65 00 73 69 7a 	imul   edi,DWORD PTR [edx+0x65],0x7a697300
 505:	65                   	gs
 506:	5f                   	pop    edi
 507:	74 00                	je     509 <sysEnter_Vector-0x12faf7>
 509:	6d                   	ins    DWORD PTR es:[edi],dx
 50a:	61                   	popa   
 50b:	6c                   	ins    BYTE PTR es:[edi],dx
 50c:	6c                   	ins    BYTE PTR es:[edi],dx
 50d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 50e:	63 5f 63             	arpl   WORD PTR [edi+0x63],bx
 511:	6c                   	ins    BYTE PTR es:[edi],dx
 512:	65                   	gs
 513:	61                   	popa   
 514:	6e                   	outs   dx,BYTE PTR ds:[esi]
 515:	75 70                	jne    587 <sysEnter_Vector-0x12fa79>
 517:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 51a:	72 6b                	jb     587 <sysEnter_Vector-0x12fa79>
 51c:	65                   	gs
 51d:	72 00                	jb     51f <sysEnter_Vector-0x12fae1>
 51f:	66                   	data16
 520:	72 65                	jb     587 <sysEnter_Vector-0x12fa79>
 522:	65 00 68 65          	add    BYTE PTR gs:[eax+0x65],ch
 526:	61                   	popa   
 527:	70 50                	jo     579 <sysEnter_Vector-0x12fa87>
 529:	74 72                	je     59d <sysEnter_Vector-0x12fa63>
 52b:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 52e:	65 64 65 64 00 73 68 	gs fs gs add BYTE PTR fs:gs:[ebx+0x68],dh
 535:	65                   	gs
 536:	61                   	popa   
 537:	70 00                	jo     539 <sysEnter_Vector-0x12fac7>
 539:	69 6e 55 73 65 00 69 	imul   ebp,DWORD PTR [esi+0x55],0x69006573
 540:	6e                   	outs   dx,BYTE PTR ds:[esi]
 541:	69 74 6d 61 6c 6c 6f 	imul   esi,DWORD PTR [ebp+ebp*2+0x61],0x636f6c6c
 548:	63 
 549:	00 67 6f             	add    BYTE PTR [edi+0x6f],ah
 54c:	74 6f                	je     5bd <sysEnter_Vector-0x12fa43>
 54e:	48                   	dec    eax
 54f:	65                   	gs
 550:	72 65                	jb     5b7 <sysEnter_Vector-0x12fa49>
 552:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 555:	61                   	popa   
 556:	70 50                	jo     5a8 <sysEnter_Vector-0x12fa58>
 558:	74 72                	je     5cc <sysEnter_Vector-0x12fa34>
 55a:	4e                   	dec    esi
 55b:	65                   	gs
 55c:	78 74                	js     5d2 <sysEnter_Vector-0x12fa2e>
 55e:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 561:	7a 65                	jp     5c8 <sysEnter_Vector-0x12fa38>
 563:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 566:	77 48                	ja     5b0 <sysEnter_Vector-0x12fa50>
 568:	65                   	gs
 569:	61                   	popa   
 56a:	70 52                	jo     5be <sysEnter_Vector-0x12fa42>
 56c:	65                   	gs
 56d:	71 75                	jno    5e4 <sysEnter_Vector-0x12fa1c>
 56f:	69 72 65 64 54 6f 46 	imul   esi,DWORD PTR [edx+0x65],0x466f5464
 576:	75 6c                	jne    5e4 <sysEnter_Vector-0x12fa1c>
 578:	66 69 6c 6c 52 65 71 	imul   bp,WORD PTR [esp+ebp*2+0x52],0x7165
 57f:	75 65                	jne    5e6 <sysEnter_Vector-0x12fa1a>
 581:	73 74                	jae    5f7 <sysEnter_Vector-0x12fa09>
 583:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 586:	63 2f                	arpl   WORD PTR [edi],bp
 588:	6d                   	ins    DWORD PTR es:[edi],dx
 589:	61                   	popa   
 58a:	6c                   	ins    BYTE PTR es:[edi],dx
 58b:	6c                   	ins    BYTE PTR es:[edi],dx
 58c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 58d:	63 2e                	arpl   WORD PTR [esi],bp
 58f:	63 00                	arpl   WORD PTR [eax],ax
 591:	70 72                	jo     605 <sysEnter_Vector-0x12f9fb>
 593:	65                   	gs
 594:	76 00                	jbe    596 <sysEnter_Vector-0x12fa6a>
 596:	68 65 61 70 72       	push   0x72706165
 59b:	65 63 5f 74          	arpl   WORD PTR gs:[edi+0x74],bx
 59f:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 5a2:	63 2f                	arpl   WORD PTR [edi],bp
 5a4:	6d                   	ins    DWORD PTR es:[edi],dx
 5a5:	65                   	gs
 5a6:	6d                   	ins    DWORD PTR es:[edi],dx
 5a7:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 5aa:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 5ad:	64                   	fs
 5ae:	65                   	gs
 5af:	73 74                	jae    625 <sysEnter_Vector-0x12f9db>
 5b1:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 5b4:	6d                   	ins    DWORD PTR es:[edi],dx
 5b5:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 5b8:	00 65 56             	add    BYTE PTR [ebp+0x56],ah
 5bb:	61                   	popa   
 5bc:	6c                   	ins    BYTE PTR es:[edi],dx
 5bd:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 5c0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5c1:	74 38                	je     5fb <sysEnter_Vector-0x12fa05>
 5c3:	5f                   	pop    edi
 5c4:	74 00                	je     5c6 <sysEnter_Vector-0x12fa3a>
 5c6:	6d                   	ins    DWORD PTR es:[edi],dx
 5c7:	65                   	gs
 5c8:	6d                   	ins    DWORD PTR es:[edi],dx
 5c9:	73 65                	jae    630 <sysEnter_Vector-0x12f9d0>
 5cb:	74 00                	je     5cd <sysEnter_Vector-0x12fa33>
 5cd:	73 72                	jae    641 <sysEnter_Vector-0x12f9bf>
 5cf:	63 2f                	arpl   WORD PTR [edi],bp
 5d1:	6d                   	ins    DWORD PTR es:[edi],dx
 5d2:	65                   	gs
 5d3:	6d                   	ins    DWORD PTR es:[edi],dx
 5d4:	73 65                	jae    63b <sysEnter_Vector-0x12f9c5>
 5d6:	74 2e                	je     606 <sysEnter_Vector-0x12f9fa>
 5d8:	63 00                	arpl   WORD PTR [eax],ax
 5da:	66 56                	push   si
 5dc:	61                   	popa   
 5dd:	6c                   	ins    BYTE PTR es:[edi],dx
 5de:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 5e1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5e2:	74 31                	je     615 <sysEnter_Vector-0x12f9eb>
 5e4:	36                   	ss
 5e5:	5f                   	pop    edi
 5e6:	74 00                	je     5e8 <sysEnter_Vector-0x12fa18>
 5e8:	77 72                	ja     65c <sysEnter_Vector-0x12f9a4>
 5ea:	69 74 65 00 64 65 6e 	imul   esi,DWORD PTR [ebp+eiz*2+0x0],0x746e6564
 5f1:	74 
 5f2:	72 79                	jb     66d <sysEnter_Vector-0x12f993>
 5f4:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 5f7:	6c                   	ins    BYTE PTR es:[edi],dx
 5f8:	65                   	gs
 5f9:	5f                   	pop    edi
 5fa:	74 00                	je     5fc <sysEnter_Vector-0x12fa04>
 5fc:	75 69                	jne    667 <sysEnter_Vector-0x12f999>
 5fe:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5ff:	74 36                	je     637 <sysEnter_Vector-0x12f9c9>
 601:	34 5f                	xor    al,0x5f
 603:	74 00                	je     605 <sysEnter_Vector-0x12f9fb>
 605:	73 75                	jae    67c <sysEnter_Vector-0x12f984>
 607:	70 65                	jo     66e <sysEnter_Vector-0x12f992>
 609:	72 5f                	jb     66a <sysEnter_Vector-0x12f996>
 60b:	62 6c 6f 63          	bound  ebp,QWORD PTR [edi+ebp*2+0x63]
 60f:	6b 00 6d             	imul   eax,DWORD PTR [eax],0x6d
 612:	6e                   	outs   dx,BYTE PTR ds:[esi]
 613:	74 5f                	je     674 <sysEnter_Vector-0x12f98c>
 615:	72 6f                	jb     686 <sysEnter_Vector-0x12f97a>
 617:	6f                   	outs   dx,DWORD PTR ds:[esi]
 618:	74 00                	je     61a <sysEnter_Vector-0x12f9e6>
 61a:	69 5f 76 66 73 6d 6f 	imul   ebx,DWORD PTR [edi+0x76],0x6f6d7366
 621:	75 6e                	jne    691 <sysEnter_Vector-0x12f96f>
 623:	74 00                	je     625 <sysEnter_Vector-0x12f9db>
 625:	66 6f                	outs   dx,WORD PTR ds:[esi]
 627:	70 73                	jo     69c <sysEnter_Vector-0x12f964>
 629:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 62c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 62d:	61                   	popa   
 62e:	6d                   	ins    DWORD PTR es:[edi],dx
 62f:	65 00 77 72          	add    BYTE PTR gs:[edi+0x72],dh
 633:	69 74 65 43 6f 6e 73 	imul   esi,DWORD PTR [ebp+eiz*2+0x43],0x6f736e6f
 63a:	6f 
 63b:	6c                   	ins    BYTE PTR es:[edi],dx
 63c:	65 00 66 70          	add    BYTE PTR gs:[esi+0x70],ah
 640:	74 72                	je     6b4 <sysEnter_Vector-0x12f94c>
 642:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 645:	6f                   	outs   dx,DWORD PTR ds:[esi]
 646:	64                   	fs
 647:	65                   	gs
 648:	5f                   	pop    edi
 649:	6f                   	outs   dx,DWORD PTR ds:[esi]
 64a:	70 65                	jo     6b1 <sysEnter_Vector-0x12f94f>
 64c:	72 61                	jb     6af <sysEnter_Vector-0x12f951>
 64e:	74 69                	je     6b9 <sysEnter_Vector-0x12f947>
 650:	6f                   	outs   dx,DWORD PTR ds:[esi]
 651:	6e                   	outs   dx,BYTE PTR ds:[esi]
 652:	73 00                	jae    654 <sysEnter_Vector-0x12f9ac>
 654:	73 6c                	jae    6c2 <sysEnter_Vector-0x12f93e>
 656:	69 73 74 68 65 61 64 	imul   esi,DWORD PTR [ebx+0x74],0x64616568
 65d:	00 6d 6b             	add    BYTE PTR [ebp+0x6b],ch
 660:	6e                   	outs   dx,BYTE PTR ds:[esi]
 661:	6f                   	outs   dx,DWORD PTR ds:[esi]
 662:	64 00 6d 6e          	add    BYTE PTR fs:[ebp+0x6e],ch
 666:	74 5f                	je     6c7 <sysEnter_Vector-0x12f939>
 668:	73 62                	jae    6cc <sysEnter_Vector-0x12f934>
 66a:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 66d:	66                   	data16
 66e:	6c                   	ins    BYTE PTR es:[edi],dx
 66f:	61                   	popa   
 670:	67 73 00             	addr16 jae 673 <sysEnter_Vector-0x12f98d>
 673:	72 65                	jb     6da <sysEnter_Vector-0x12f926>
 675:	61                   	popa   
 676:	64 00 69 5f          	add    BYTE PTR fs:[ecx+0x5f],ch
 67a:	64                   	fs
 67b:	65                   	gs
 67c:	76 00                	jbe    67e <sysEnter_Vector-0x12f982>
 67e:	73 5f                	jae    6df <sysEnter_Vector-0x12f921>
 680:	64                   	fs
 681:	65                   	gs
 682:	76 00                	jbe    684 <sysEnter_Vector-0x12f97c>
 684:	69 5f 75 69 64 00 72 	imul   ebx,DWORD PTR [edi+0x75],0x72006469
 68b:	65                   	gs
 68c:	61                   	popa   
 68d:	64                   	fs
 68e:	43                   	inc    ebx
 68f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 690:	6e                   	outs   dx,BYTE PTR ds:[esi]
 691:	73 6f                	jae    702 <sysEnter_Vector-0x12f8fe>
 693:	6c                   	ins    BYTE PTR es:[edi],dx
 694:	65 00 63 72          	add    BYTE PTR gs:[ebx+0x72],ah
 698:	65                   	gs
 699:	61                   	popa   
 69a:	74 65                	je     701 <sysEnter_Vector-0x12f8ff>
 69c:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 69f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6a0:	70 66                	jo     708 <sysEnter_Vector-0x12f8f8>
 6a2:	6c                   	ins    BYTE PTR es:[edi],dx
 6a3:	61                   	popa   
 6a4:	67 73 00             	addr16 jae 6a7 <sysEnter_Vector-0x12f959>
 6a7:	64                   	fs
 6a8:	5f                   	pop    edi
 6a9:	70 61                	jo     70c <sysEnter_Vector-0x12f8f4>
 6ab:	72 65                	jb     712 <sysEnter_Vector-0x12f8ee>
 6ad:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6ae:	74 00                	je     6b0 <sysEnter_Vector-0x12f950>
 6b0:	66 5f                	pop    di
 6b2:	70 61                	jo     715 <sysEnter_Vector-0x12f8eb>
 6b4:	74 68                	je     71e <sysEnter_Vector-0x12f8e2>
 6b6:	00 73 5f             	add    BYTE PTR [ebx+0x5f],dh
 6b9:	72 6f                	jb     72a <sysEnter_Vector-0x12f8d6>
 6bb:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6bc:	74 00                	je     6be <sysEnter_Vector-0x12f942>
 6be:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 6c1:	73 6f                	jae    732 <sysEnter_Vector-0x12f8ce>
 6c3:	6c                   	ins    BYTE PTR es:[edi],dx
 6c4:	65                   	gs
 6c5:	5f                   	pop    edi
 6c6:	66 69 6c 65 00 72 6d 	imul   bp,WORD PTR [ebp+eiz*2+0x0],0x6d72
 6cd:	64 69 72 00 64 5f 69 	imul   esi,DWORD PTR fs:[edx+0x0],0x6e695f64
 6d4:	6e 
 6d5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6d6:	64 65 00 69 6e       	fs add BYTE PTR fs:gs:[ecx+0x6e],ch
 6db:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6dc:	64                   	fs
 6dd:	65                   	gs
 6de:	5f                   	pop    edi
 6df:	74 00                	je     6e1 <sysEnter_Vector-0x12f91f>
 6e1:	69 6f 49 6e 69 74 00 	imul   ebp,DWORD PTR [edi+0x49],0x74696e
 6e8:	64                   	fs
 6e9:	5f                   	pop    edi
 6ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6eb:	61                   	popa   
 6ec:	6d                   	ins    DWORD PTR es:[edi],dx
 6ed:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 6f1:	63 2f                	arpl   WORD PTR [edi],bp
 6f3:	73 74                	jae    769 <sysEnter_Vector-0x12f897>
 6f5:	64 69 6f 2e 63 00 66 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x5f660063
 6fc:	5f 
 6fd:	69 6e 6f 64 65 00 73 	imul   ebp,DWORD PTR [esi+0x6f],0x73006564
 704:	5f                   	pop    edi
 705:	6c                   	ins    BYTE PTR es:[edi],dx
 706:	69 73 74 00 6d 6e 74 	imul   esi,DWORD PTR [ebx+0x74],0x746e6d00
 70d:	5f                   	pop    edi
 70e:	66                   	data16
 70f:	6c                   	ins    BYTE PTR es:[edi],dx
 710:	61                   	popa   
 711:	67 73 00             	addr16 jae 714 <sysEnter_Vector-0x12f8ec>
 714:	66 69 6c 65 5f 6f 70 	imul   bp,WORD PTR [ebp+eiz*2+0x5f],0x706f
 71b:	65                   	gs
 71c:	72 61                	jb     77f <sysEnter_Vector-0x12f881>
 71e:	74 69                	je     789 <sysEnter_Vector-0x12f877>
 720:	6f                   	outs   dx,DWORD PTR ds:[esi]
 721:	6e                   	outs   dx,BYTE PTR ds:[esi]
 722:	73 5f                	jae    783 <sysEnter_Vector-0x12f87d>
 724:	74 00                	je     726 <sysEnter_Vector-0x12f8da>
 726:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 729:	73 6f                	jae    79a <sysEnter_Vector-0x12f866>
 72b:	6c                   	ins    BYTE PTR es:[edi],dx
 72c:	65                   	gs
 72d:	5f                   	pop    edi
 72e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 72f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 730:	64 65 00 6d 6b       	fs add BYTE PTR fs:gs:[ebp+0x6b],ch
 735:	64 69 72 00 69 5f 6d 	imul   esi,DWORD PTR fs:[edx+0x0],0x6f6d5f69
 73c:	6f 
 73d:	64 65 00 64 6c 6c    	fs add BYTE PTR fs:gs:[esp+ebp*2+0x6c],ah
 743:	69 73 74 5f 74 00 66 	imul   esi,DWORD PTR [ebx+0x74],0x6600745f
 74a:	69 6c 65 5f 6f 70 65 	imul   ebp,DWORD PTR [ebp+eiz*2+0x5f],0x7265706f
 751:	72 
 752:	61                   	popa   
 753:	74 69                	je     7be <sysEnter_Vector-0x12f842>
 755:	6f                   	outs   dx,DWORD PTR ds:[esi]
 756:	6e                   	outs   dx,BYTE PTR ds:[esi]
 757:	73 00                	jae    759 <sysEnter_Vector-0x12f8a7>
 759:	77 68                	ja     7c3 <sysEnter_Vector-0x12f83d>
 75b:	61                   	popa   
 75c:	74 65                	je     7c3 <sysEnter_Vector-0x12f83d>
 75e:	76 65                	jbe    7c5 <sysEnter_Vector-0x12f83b>
 760:	72 00                	jb     762 <sysEnter_Vector-0x12f89e>
 762:	69 5f 6f 70 00 70 61 	imul   ebx,DWORD PTR [edi+0x6f],0x61700070
 769:	79 6c                	jns    7d7 <sysEnter_Vector-0x12f829>
 76b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 76c:	61                   	popa   
 76d:	64 00 6e 65          	add    BYTE PTR fs:[esi+0x65],ch
 771:	78 74                	js     7e7 <sysEnter_Vector-0x12f819>
 773:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 776:	67 69 64 00 73 74 72 	imul   esp,DWORD PTR [si+0x0],0x63727473
 77d:	63 
 77e:	61                   	popa   
 77f:	74 00                	je     781 <sysEnter_Vector-0x12f87f>
 781:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 784:	63 61 74             	arpl   WORD PTR [ecx+0x74],sp
 787:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 789:	61                   	popa   
 78a:	74 65                	je     7f1 <sysEnter_Vector-0x12f80f>
 78c:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 78f:	63 2f                	arpl   WORD PTR [edi],bp
 791:	73 74                	jae    807 <sysEnter_Vector-0x12f7f9>
 793:	72 69                	jb     7fe <sysEnter_Vector-0x12f802>
 795:	6e                   	outs   dx,BYTE PTR ds:[esi]
 796:	67 73 2f             	addr16 jae 7c8 <sysEnter_Vector-0x12f838>
 799:	73 74                	jae    80f <sysEnter_Vector-0x12f7f1>
 79b:	72 63                	jb     800 <sysEnter_Vector-0x12f800>
 79d:	61                   	popa   
 79e:	74 2e                	je     7ce <sysEnter_Vector-0x12f832>
 7a0:	63 00                	arpl   WORD PTR [eax],ax
 7a2:	73 74                	jae    818 <sysEnter_Vector-0x12f7e8>
 7a4:	72 63                	jb     809 <sysEnter_Vector-0x12f7f7>
 7a6:	6d                   	ins    DWORD PTR es:[edi],dx
 7a7:	70 00                	jo     7a9 <sysEnter_Vector-0x12f857>
 7a9:	73 72                	jae    81d <sysEnter_Vector-0x12f7e3>
 7ab:	63 2f                	arpl   WORD PTR [edi],bp
 7ad:	73 74                	jae    823 <sysEnter_Vector-0x12f7dd>
 7af:	72 69                	jb     81a <sysEnter_Vector-0x12f7e6>
 7b1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7b2:	67 73 2f             	addr16 jae 7e4 <sysEnter_Vector-0x12f81c>
 7b5:	73 74                	jae    82b <sysEnter_Vector-0x12f7d5>
 7b7:	72 63                	jb     81c <sysEnter_Vector-0x12f7e4>
 7b9:	6d                   	ins    DWORD PTR es:[edi],dx
 7ba:	70 2e                	jo     7ea <sysEnter_Vector-0x12f816>
 7bc:	63 00                	arpl   WORD PTR [eax],ax
 7be:	73 74                	jae    834 <sysEnter_Vector-0x12f7cc>
 7c0:	72 63                	jb     825 <sysEnter_Vector-0x12f7db>
 7c2:	70 79                	jo     83d <sysEnter_Vector-0x12f7c3>
 7c4:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 7c7:	75 6e                	jne    837 <sysEnter_Vector-0x12f7c9>
 7c9:	74 00                	je     7cb <sysEnter_Vector-0x12f835>
 7cb:	73 74                	jae    841 <sysEnter_Vector-0x12f7bf>
 7cd:	72 63                	jb     832 <sysEnter_Vector-0x12f7ce>
 7cf:	70 79                	jo     84a <sysEnter_Vector-0x12f7b6>
 7d1:	63 00                	arpl   WORD PTR [eax],ax
 7d3:	73 72                	jae    847 <sysEnter_Vector-0x12f7b9>
 7d5:	63 2f                	arpl   WORD PTR [edi],bp
 7d7:	73 74                	jae    84d <sysEnter_Vector-0x12f7b3>
 7d9:	72 69                	jb     844 <sysEnter_Vector-0x12f7bc>
 7db:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7dc:	67 73 2f             	addr16 jae 80e <sysEnter_Vector-0x12f7f2>
 7df:	73 74                	jae    855 <sysEnter_Vector-0x12f7ab>
 7e1:	72 63                	jb     846 <sysEnter_Vector-0x12f7ba>
 7e3:	70 79                	jo     85e <sysEnter_Vector-0x12f7a2>
 7e5:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 7e8:	73 74                	jae    85e <sysEnter_Vector-0x12f7a2>
 7ea:	72 6c                	jb     858 <sysEnter_Vector-0x12f7a8>
 7ec:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 7ee:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 7f1:	63 2f                	arpl   WORD PTR [edi],bp
 7f3:	73 74                	jae    869 <sysEnter_Vector-0x12f797>
 7f5:	72 69                	jb     860 <sysEnter_Vector-0x12f7a0>
 7f7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7f8:	67 73 2f             	addr16 jae 82a <sysEnter_Vector-0x12f7d6>
 7fb:	73 74                	jae    871 <sysEnter_Vector-0x12f78f>
 7fd:	72 6c                	jb     86b <sysEnter_Vector-0x12f795>
 7ff:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 801:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 804:	73 74                	jae    87a <sysEnter_Vector-0x12f786>
 806:	72 6e                	jb     876 <sysEnter_Vector-0x12f78a>
 808:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 80b:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 80e:	63 2f                	arpl   WORD PTR [edi],bp
 810:	73 74                	jae    886 <sysEnter_Vector-0x12f77a>
 812:	72 69                	jb     87d <sysEnter_Vector-0x12f783>
 814:	6e                   	outs   dx,BYTE PTR ds:[esi]
 815:	67 73 2f             	addr16 jae 847 <sysEnter_Vector-0x12f7b9>
 818:	73 74                	jae    88e <sysEnter_Vector-0x12f772>
 81a:	72 6e                	jb     88a <sysEnter_Vector-0x12f776>
 81c:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 81f:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 822:	73 72                	jae    896 <sysEnter_Vector-0x12f76a>
 824:	63 2f                	arpl   WORD PTR [edi],bp
 826:	73 74                	jae    89c <sysEnter_Vector-0x12f764>
 828:	72 69                	jb     893 <sysEnter_Vector-0x12f76d>
 82a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 82b:	67 73 2f             	addr16 jae 85d <sysEnter_Vector-0x12f7a3>
 82e:	73 74                	jae    8a4 <sysEnter_Vector-0x12f75c>
 830:	72 6e                	jb     8a0 <sysEnter_Vector-0x12f760>
 832:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 835:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 838:	73 74                	jae    8ae <sysEnter_Vector-0x12f752>
 83a:	72 6e                	jb     8aa <sysEnter_Vector-0x12f756>
 83c:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 83f:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 842:	63 2f                	arpl   WORD PTR [edi],bp
 844:	73 74                	jae    8ba <sysEnter_Vector-0x12f746>
 846:	72 69                	jb     8b1 <sysEnter_Vector-0x12f74f>
 848:	6e                   	outs   dx,BYTE PTR ds:[esi]
 849:	67 73 2f             	addr16 jae 87b <sysEnter_Vector-0x12f785>
 84c:	73 74                	jae    8c2 <sysEnter_Vector-0x12f73e>
 84e:	72 6f                	jb     8bf <sysEnter_Vector-0x12f741>
 850:	75 6c                	jne    8be <sysEnter_Vector-0x12f742>
 852:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 855:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 858:	6f                   	outs   dx,DWORD PTR ds:[esi]
 859:	66                   	data16
 85a:	66                   	data16
 85b:	00 63 75             	add    BYTE PTR [ebx+0x75],ah
 85e:	74 6c                	je     8cc <sysEnter_Vector-0x12f734>
 860:	69 6d 00 73 74 72 74 	imul   ebp,DWORD PTR [ebp+0x0],0x74727473
 867:	6f                   	outs   dx,DWORD PTR ds:[esi]
 868:	75 6c                	jne    8d6 <sysEnter_Vector-0x12f72a>
 86a:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 86d:	64                   	fs
 86e:	70 74                	jo     8e4 <sysEnter_Vector-0x12f71c>
 870:	72 00                	jb     872 <sysEnter_Vector-0x12f78e>
 872:	6e                   	outs   dx,BYTE PTR ds:[esi]
 873:	70 74                	jo     8e9 <sysEnter_Vector-0x12f717>
 875:	72 00                	jb     877 <sysEnter_Vector-0x12f789>
 877:	62 61 73             	bound  esp,QWORD PTR [ecx+0x73]
 87a:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 87e:	63 2f                	arpl   WORD PTR [edi],bp
 880:	73 74                	jae    8f6 <sysEnter_Vector-0x12f70a>
 882:	72 69                	jb     8ed <sysEnter_Vector-0x12f713>
 884:	6e                   	outs   dx,BYTE PTR ds:[esi]
 885:	67 73 2f             	addr16 jae 8b7 <sysEnter_Vector-0x12f749>
 888:	73 74                	jae    8fe <sysEnter_Vector-0x12f702>
 88a:	72 70                	jb     8fc <sysEnter_Vector-0x12f704>
 88c:	61                   	popa   
 88d:	72 74                	jb     903 <sysEnter_Vector-0x12f6fd>
 88f:	73 2e                	jae    8bf <sysEnter_Vector-0x12f741>
 891:	63 00                	arpl   WORD PTR [eax],ax
 893:	73 74                	jae    909 <sysEnter_Vector-0x12f6f7>
 895:	72 6c                	jb     903 <sysEnter_Vector-0x12f6fd>
 897:	65                   	gs
 898:	66                   	data16
 899:	74 00                	je     89b <sysEnter_Vector-0x12f765>
 89b:	73 72                	jae    90f <sysEnter_Vector-0x12f6f1>
 89d:	63 2f                	arpl   WORD PTR [edi],bp
 89f:	73 74                	jae    915 <sysEnter_Vector-0x12f6eb>
 8a1:	72 69                	jb     90c <sysEnter_Vector-0x12f6f4>
 8a3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8a4:	67 73 2f             	addr16 jae 8d6 <sysEnter_Vector-0x12f72a>
 8a7:	73 74                	jae    91d <sysEnter_Vector-0x12f6e3>
 8a9:	72 74                	jb     91f <sysEnter_Vector-0x12f6e1>
 8ab:	6f                   	outs   dx,DWORD PTR ds:[esi]
 8ac:	6c                   	ins    BYTE PTR es:[edi],dx
 8ad:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8b0:	73 74                	jae    926 <sysEnter_Vector-0x12f6da>
 8b2:	72 74                	jb     928 <sysEnter_Vector-0x12f6d8>
 8b4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 8b5:	6c                   	ins    BYTE PTR es:[edi],dx
 8b6:	00 6c 65 6e          	add    BYTE PTR [ebp+eiz*2+0x6e],ch
 8ba:	67 74 68             	addr16 je 925 <sysEnter_Vector-0x12f6db>
 8bd:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 8c0:	61                   	popa   
 8c1:	72 74                	jb     937 <sysEnter_Vector-0x12f6c9>
 8c3:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 8c6:	63 2f                	arpl   WORD PTR [edi],bp
 8c8:	73 74                	jae    93e <sysEnter_Vector-0x12f6c2>
 8ca:	72 69                	jb     935 <sysEnter_Vector-0x12f6cb>
 8cc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8cd:	67 73 2f             	addr16 jae 8ff <sysEnter_Vector-0x12f701>
 8d0:	73 74                	jae    946 <sysEnter_Vector-0x12f6ba>
 8d2:	72 74                	jb     948 <sysEnter_Vector-0x12f6b8>
 8d4:	72 69                	jb     93f <sysEnter_Vector-0x12f6c1>
 8d6:	6d                   	ins    DWORD PTR es:[edi],dx
 8d7:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8da:	73 74                	jae    950 <sysEnter_Vector-0x12f6b0>
 8dc:	72 74                	jb     952 <sysEnter_Vector-0x12f6ae>
 8de:	72 69                	jb     949 <sysEnter_Vector-0x12f6b7>
 8e0:	6d                   	ins    DWORD PTR es:[edi],dx
 8e1:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 8e4:	72 74                	jb     95a <sysEnter_Vector-0x12f6a6>
 8e6:	72 69                	jb     951 <sysEnter_Vector-0x12f6af>
 8e8:	6d                   	ins    DWORD PTR es:[edi],dx
 8e9:	32 00                	xor    al,BYTE PTR [eax]
 8eb:	70 6f                	jo     95c <sysEnter_Vector-0x12f6a4>
 8ed:	69 6e 74 65 72 54 6f 	imul   ebp,DWORD PTR [esi+0x74],0x6f547265
 8f4:	53                   	push   ebx
 8f5:	74 72                	je     969 <sysEnter_Vector-0x12f697>
 8f7:	69 6e 67 00 6c 6f 63 	imul   ebp,DWORD PTR [esi+0x67],0x636f6c00
 8fe:	61                   	popa   
 8ff:	6c                   	ins    BYTE PTR es:[edi],dx
 900:	74 69                	je     96b <sysEnter_Vector-0x12f695>
 902:	6d                   	ins    DWORD PTR es:[edi],dx
 903:	65 00 64 61 79       	add    BYTE PTR gs:[ecx+eiz*2+0x79],ah
 908:	6e                   	outs   dx,BYTE PTR ds:[esi]
 909:	6f                   	outs   dx,DWORD PTR ds:[esi]
 90a:	00 5f 64             	add    BYTE PTR [edi+0x64],bl
 90d:	73 74                	jae    983 <sysEnter_Vector-0x12f67d>
 90f:	62 69 61             	bound  ebp,QWORD PTR [ecx+0x61]
 912:	73 00                	jae    914 <sysEnter_Vector-0x12f6ec>
 914:	67 6d                	ins    DWORD PTR es:[di],dx
 916:	74 69                	je     981 <sysEnter_Vector-0x12f67f>
 918:	6d                   	ins    DWORD PTR es:[edi],dx
 919:	65                   	gs
 91a:	5f                   	pop    edi
 91b:	72 00                	jb     91d <sysEnter_Vector-0x12f6e3>
 91d:	74 69                	je     988 <sysEnter_Vector-0x12f678>
 91f:	6d                   	ins    DWORD PTR es:[edi],dx
 920:	65                   	gs
 921:	72 00                	jb     923 <sysEnter_Vector-0x12f6dd>
 923:	6c                   	ins    BYTE PTR es:[edi],dx
 924:	6f                   	outs   dx,DWORD PTR ds:[esi]
 925:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
 928:	74 69                	je     993 <sysEnter_Vector-0x12f66d>
 92a:	6d                   	ins    DWORD PTR es:[edi],dx
 92b:	65                   	gs
 92c:	5f                   	pop    edi
 92d:	72 00                	jb     92f <sysEnter_Vector-0x12f6d1>
 92f:	5f                   	pop    edi
 930:	6d                   	ins    DWORD PTR es:[edi],dx
 931:	6f                   	outs   dx,DWORD PTR ds:[esi]
 932:	6e                   	outs   dx,BYTE PTR ds:[esi]
 933:	74 68                	je     99d <sysEnter_Vector-0x12f663>
 935:	73 5f                	jae    996 <sysEnter_Vector-0x12f66a>
 937:	61                   	popa   
 938:	62 62 72             	bound  esp,QWORD PTR [edx+0x72]
 93b:	65                   	gs
 93c:	76 00                	jbe    93e <sysEnter_Vector-0x12f6c2>
 93e:	5f                   	pop    edi
 93f:	74 7a                	je     9bb <sysEnter_Vector-0x12f645>
 941:	6e                   	outs   dx,BYTE PTR ds:[esi]
 942:	61                   	popa   
 943:	6d                   	ins    DWORD PTR es:[edi],dx
 944:	65 00 5f 6d          	add    BYTE PTR gs:[edi+0x6d],bl
 948:	6f                   	outs   dx,DWORD PTR ds:[esi]
 949:	6e                   	outs   dx,BYTE PTR ds:[esi]
 94a:	74 68                	je     9b4 <sysEnter_Vector-0x12f64c>
 94c:	73 00                	jae    94e <sysEnter_Vector-0x12f6b2>
 94e:	5f                   	pop    edi
 94f:	79 74                	jns    9c5 <sysEnter_Vector-0x12f63b>
 951:	61                   	popa   
 952:	62 00                	bound  eax,QWORD PTR [eax]
 954:	74 69                	je     9bf <sysEnter_Vector-0x12f641>
 956:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 959:	54                   	push   esp
 95a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 95b:	57                   	push   edi
 95c:	61                   	popa   
 95d:	69 74 00 6d 6b 74 69 	imul   esi,DWORD PTR [eax+eax*1+0x6d],0x6d69746b
 964:	6d 
 965:	65 00 64 61 79       	add    BYTE PTR gs:[ecx+eiz*2+0x79],ah
 96a:	63 6c 6f 63          	arpl   WORD PTR [edi+ebp*2+0x63],bp
 96e:	6b 00 5f             	imul   eax,DWORD PTR [eax],0x5f
 971:	64                   	fs
 972:	61                   	popa   
 973:	79 6c                	jns    9e1 <sysEnter_Vector-0x12f61f>
 975:	69 67 68 74 00 5f 64 	imul   esp,DWORD PTR [edi+0x68],0x645f0074
 97c:	61                   	popa   
 97d:	79 73                	jns    9f2 <sysEnter_Vector-0x12f60e>
 97f:	5f                   	pop    edi
 980:	61                   	popa   
 981:	62 62 72             	bound  esp,QWORD PTR [edx+0x72]
 984:	65                   	gs
 985:	76 00                	jbe    987 <sysEnter_Vector-0x12f679>
 987:	6f                   	outs   dx,DWORD PTR ds:[esi]
 988:	76 65                	jbe    9ef <sysEnter_Vector-0x12f611>
 98a:	72 66                	jb     9f2 <sysEnter_Vector-0x12f60e>
 98c:	6c                   	ins    BYTE PTR es:[edi],dx
 98d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 98e:	77 00                	ja     990 <sysEnter_Vector-0x12f670>
 990:	6d                   	ins    DWORD PTR es:[edi],dx
 991:	6f                   	outs   dx,DWORD PTR ds:[esi]
 992:	6e                   	outs   dx,BYTE PTR ds:[esi]
 993:	74 68                	je     9fd <sysEnter_Vector-0x12f603>
 995:	00 74 6d 62          	add    BYTE PTR [ebp+ebp*2+0x62],dh
 999:	75 66                	jne    a01 <sysEnter_Vector-0x12f5ff>
 99b:	00 5f 64             	add    BYTE PTR [edi+0x64],bl
 99e:	61                   	popa   
 99f:	79 73                	jns    a14 <sysEnter_Vector-0x12f5ec>
 9a1:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 9a4:	63 2f                	arpl   WORD PTR [edi],bp
 9a6:	74 69                	je     a11 <sysEnter_Vector-0x12f5ef>
 9a8:	6d                   	ins    DWORD PTR es:[edi],dx
 9a9:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    edi
   1:	43                   	inc    ebx
   2:	43                   	inc    ebx
   3:	3a 20                	cmp    ah,BYTE PTR [eax]
   5:	28 47 4e             	sub    BYTE PTR [edi+0x4e],al
   8:	55                   	push   ebp
   9:	29 20                	sub    DWORD PTR [eax],esp
   b:	35 2e 33 2e 30       	xor    eax,0x302e332e
	...
