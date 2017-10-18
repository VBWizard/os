
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
30000003:	e8 8e 1f 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000008:	05 70 34 00 00       	add    eax,0x3470
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
3000003b:	e8 56 1f 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000040:	05 38 34 00 00       	add    eax,0x3438
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
30000075:	e8 1c 1f 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
3000007a:	05 fe 33 00 00       	add    eax,0x33fe
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
300000ca:	e8 c7 1e 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
300000cf:	05 a9 33 00 00       	add    eax,0x33a9
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
30000121:	e8 ca 1e 00 00       	call   30001ff0 <__x86.get_pc_thunk.bx>
30000126:	81 c3 52 33 00 00    	add    ebx,0x3352
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
300001b8:	e8 d9 1d 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
300001bd:	05 bb 32 00 00       	add    eax,0x32bb
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
300001e1:	e8 b0 1d 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
300001e6:	05 92 32 00 00       	add    eax,0x3292
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
30000224:	e8 6d 1d 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000229:	05 4f 32 00 00       	add    eax,0x324f
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
30000253:	e8 3e 1d 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000258:	05 20 32 00 00       	add    eax,0x3220
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
30000278:	8d 90 28 fa ff ff    	lea    edx,[eax-0x5d8]
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
30000327:	e8 6a 1c 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
3000032c:	05 4c 31 00 00       	add    eax,0x314c
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
3000035c:	e8 35 1c 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000361:	05 17 31 00 00       	add    eax,0x3117
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
30000390:	e8 01 1c 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000395:	05 e3 30 00 00       	add    eax,0x30e3
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
300003c0:	e8 d1 1b 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
300003c5:	05 b3 30 00 00       	add    eax,0x30b3
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
300003e8:	e8 03 1c 00 00       	call   30001ff0 <__x86.get_pc_thunk.bx>
300003ed:	81 c3 8b 30 00 00    	add    ebx,0x308b
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:45
    printdI(DEBUG_LIBC,"***Initializing libc\n***");
300003f3:	83 ec 08             	sub    esp,0x8
300003f6:	8d 83 43 fa ff ff    	lea    eax,[ebx-0x5bd]
300003fc:	50                   	push   eax
300003fd:	68 00 00 00 02       	push   0x2000000
30000402:	e8 c5 00 00 00       	call   300004cc <printdI>
30000407:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:46
    initmalloc();
3000040a:	e8 3d 02 00 00       	call   3000064c <initmalloc>
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
30000428:	8d 83 cd cf ff ff    	lea    eax,[ebx-0x3033]
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
3000044c:	e8 45 1b 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000451:	05 27 30 00 00       	add    eax,0x3027
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:54
    malloc_cleanup();
30000456:	89 c3                	mov    ebx,eax
30000458:	e8 bb 04 00 00       	call   30000918 <malloc_cleanup>
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
3000046a:	e8 27 1b 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
3000046f:	05 09 30 00 00       	add    eax,0x3009
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
3000049e:	e8 f3 1a 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
300004a3:	05 d5 2f 00 00       	add    eax,0x2fd5
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
300004d3:	e8 be 1a 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
300004d8:	05 a0 2f 00 00       	add    eax,0x2fa0
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
3000050a:	e8 87 1a 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
3000050f:	05 69 2f 00 00       	add    eax,0x2f69
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
30000554:	e8 3d 1a 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000559:	05 1f 2f 00 00       	add    eax,0x2f1f
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
30000571:	e8 20 1a 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000576:	05 02 2f 00 00       	add    eax,0x2f02
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
3000059e:	e8 f3 19 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
300005a3:	05 d5 2e 00 00       	add    eax,0x2ed5
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
300005ce:	e8 c3 19 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
300005d3:	05 a5 2e 00 00       	add    eax,0x2ea5
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
300005ef:	e8 fc 19 00 00       	call   30001ff0 <__x86.get_pc_thunk.bx>
300005f4:	81 c3 84 2e 00 00    	add    ebx,0x2e84
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
3000061d:	e8 ae 19 00 00       	call   30001fd0 <__x86.get_pc_thunk.ax+0x3a>
30000622:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:119
}
30000625:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000628:	c9                   	leave  
30000629:	c3                   	ret    

3000062a <getcwd>:
getcwd():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:122

VISIBLE char* getcwd(char* buf, size_t size)
{
3000062a:	55                   	push   ebp
3000062b:	89 e5                	mov    ebp,esp
3000062d:	e8 64 19 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000632:	05 46 2e 00 00       	add    eax,0x2e46
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:123
    return (char*)do_syscall3(SYSCALL_GETCWD,(uint32_t)buf,size);
30000637:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000063a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
3000063d:	50                   	push   eax
3000063e:	6a 4f                	push   0x4f
30000640:	e8 10 fd ff ff       	call   30000355 <do_syscall3>
30000645:	83 c4 0c             	add    esp,0xc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:124
}
30000648:	c9                   	leave  
30000649:	c3                   	ret    
3000064a:	66 90                	xchg   ax,ax

3000064c <initmalloc>:
initmalloc():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:13
#include "libChrisOS.h"

#define HEAP_GET_NEXT(s,t) {t=(uint8_t*)s+s->len+sizeof(heaprec_t);}
#define HEAP_CURR(s,t) {t=((heaprec_t*)s)-1;}
void initmalloc()
{
3000064c:	55                   	push   ebp
3000064d:	89 e5                	mov    ebp,esp
3000064f:	e8 42 19 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000654:	05 24 2e 00 00       	add    eax,0x2e24
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:14
    heapBase=0;
30000659:	8b 90 f4 ff ff ff    	mov    edx,DWORD PTR [eax-0xc]
3000065f:	c7 02 00 00 00 00    	mov    DWORD PTR [edx],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:15
    heapCurr=0;
30000665:	8b 90 f8 ff ff ff    	mov    edx,DWORD PTR [eax-0x8]
3000066b:	c7 02 00 00 00 00    	mov    DWORD PTR [edx],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:16
    heapEnd=0;
30000671:	8b 80 f0 ff ff ff    	mov    eax,DWORD PTR [eax-0x10]
30000677:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:17
}
3000067d:	90                   	nop
3000067e:	5d                   	pop    ebp
3000067f:	c3                   	ret    

30000680 <newHeapRequiredToFulfillRequest>:
newHeapRequiredToFulfillRequest():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:20

uint32_t newHeapRequiredToFulfillRequest(size_t size)
{
30000680:	55                   	push   ebp
30000681:	89 e5                	mov    ebp,esp
30000683:	83 ec 10             	sub    esp,0x10
30000686:	e8 0b 19 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
3000068b:	05 ed 2d 00 00       	add    eax,0x2ded
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:21
    uint32_t newSize=size+sizeof(heaprec_t);
30000690:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30000693:	83 c2 10             	add    edx,0x10
30000696:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:23
    //printDebug(DEBUG_MALLOC,"size=0x%08X, heapEnd=0x%08X, heapCurr=0x%08X\n",newSize, heapEnd, heapCurr);
    if (heapCurr+newSize > heapEnd)
30000699:	8b 90 f8 ff ff ff    	mov    edx,DWORD PTR [eax-0x8]
3000069f:	8b 0a                	mov    ecx,DWORD PTR [edx]
300006a1:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
300006a4:	01 d1                	add    ecx,edx
300006a6:	8b 90 f0 ff ff ff    	mov    edx,DWORD PTR [eax-0x10]
300006ac:	8b 12                	mov    edx,DWORD PTR [edx]
300006ae:	39 d1                	cmp    ecx,edx
300006b0:	76 43                	jbe    300006f5 <newHeapRequiredToFulfillRequest+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:26
    {
        //printDebug(DEBUG_MALLOC,"Heap requested 0x%08X, heap available 0x%08X\n",newSize, heapEnd-heapCurr);
        newSize =(heapEnd-heapCurr);
300006b2:	8b 90 f0 ff ff ff    	mov    edx,DWORD PTR [eax-0x10]
300006b8:	8b 12                	mov    edx,DWORD PTR [edx]
300006ba:	8b 80 f8 ff ff ff    	mov    eax,DWORD PTR [eax-0x8]
300006c0:	8b 00                	mov    eax,DWORD PTR [eax]
300006c2:	29 c2                	sub    edx,eax
300006c4:	89 d0                	mov    eax,edx
300006c6:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:27
        if (newSize== 0 || newSize%PAGE_SIZE)
300006c9:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
300006cd:	74 0c                	je     300006db <newHeapRequiredToFulfillRequest+0x5b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:27 (discriminator 1)
300006cf:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300006d2:	25 ff 0f 00 00       	and    eax,0xfff
300006d7:	85 c0                	test   eax,eax
300006d9:	74 10                	je     300006eb <newHeapRequiredToFulfillRequest+0x6b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:29
       {
           newSize+=(PAGE_SIZE-(newSize % PAGE_SIZE));
300006db:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300006de:	25 00 f0 ff ff       	and    eax,0xfffff000
300006e3:	05 00 10 00 00       	add    eax,0x1000
300006e8:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:32
           //printDebug(DEBUG_MALLOC,"libcnewHeapRequiredToFulfillRequest: Size adjusted from %u to %u\n",size,newSize);
       }
        return newSize+ALLOC_REQUEST_SIZE;
300006eb:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300006ee:	05 00 20 03 00       	add    eax,0x32000
300006f3:	eb 05                	jmp    300006fa <newHeapRequiredToFulfillRequest+0x7a>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:35
    }
    else
        return 0;
300006f5:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:36
}
300006fa:	c9                   	leave  
300006fb:	c3                   	ret    

300006fc <malloc>:
malloc():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:39

__attribute__((visibility("default"))) void*  malloc(size_t size)
{
300006fc:	55                   	push   ebp
300006fd:	89 e5                	mov    ebp,esp
300006ff:	56                   	push   esi
30000700:	53                   	push   ebx
30000701:	83 ec 20             	sub    esp,0x20
30000704:	e8 eb 18 00 00       	call   30001ff4 <__x86.get_pc_thunk.si>
30000709:	81 c6 6f 2d 00 00    	add    esi,0x2d6f
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:46

    uint32_t needed;
    uint32_t allocatedPtr;
    heaprec_t* heapPtr;
    uint8_t* heapPtrNext;
    printdI(DEBUG_MALLOC,"malloc(0x%08X)\n",size);
3000070f:	83 ec 04             	sub    esp,0x4
30000712:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000715:	8d 86 5c fa ff ff    	lea    eax,[esi-0x5a4]
3000071b:	50                   	push   eax
3000071c:	68 00 00 00 01       	push   0x1000000
30000721:	89 f3                	mov    ebx,esi
30000723:	e8 a4 fd ff ff       	call   300004cc <printdI>
30000728:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:47
    needed = newHeapRequiredToFulfillRequest(size);
3000072b:	83 ec 0c             	sub    esp,0xc
3000072e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000731:	e8 4a ff ff ff       	call   30000680 <newHeapRequiredToFulfillRequest>
30000736:	83 c4 10             	add    esp,0x10
30000739:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:48
    printdI(DEBUG_MALLOC,"libc_malloc: needed=0x%08X\n",needed);
3000073c:	83 ec 04             	sub    esp,0x4
3000073f:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
30000742:	8d 86 6c fa ff ff    	lea    eax,[esi-0x594]
30000748:	50                   	push   eax
30000749:	68 00 00 00 01       	push   0x1000000
3000074e:	89 f3                	mov    ebx,esi
30000750:	e8 77 fd ff ff       	call   300004cc <printdI>
30000755:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:49
    if (needed!=0)      //No new heap required
30000758:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
3000075c:	0f 84 b0 00 00 00    	je     30000812 <malloc+0x116>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:51
    {
        asm("mov eax,0x165\ncall sysEnter_Vector\n":"=a" (allocatedPtr):"b" (needed));
30000762:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000765:	89 c3                	mov    ebx,eax
30000767:	b8 65 01 00 00       	mov    eax,0x165
3000076c:	e8 fc ff ff ff       	call   3000076d <malloc+0x71>
30000771:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:53
        //This is needed to keep in sync with what the kernel thinks
        printdI(DEBUG_MALLOC,"libc_malloc: heaEnd=0x%08X\n",heapEnd);
30000774:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
3000077a:	8b 00                	mov    eax,DWORD PTR [eax]
3000077c:	83 ec 04             	sub    esp,0x4
3000077f:	50                   	push   eax
30000780:	8d 86 88 fa ff ff    	lea    eax,[esi-0x578]
30000786:	50                   	push   eax
30000787:	68 00 00 00 01       	push   0x1000000
3000078c:	89 f3                	mov    ebx,esi
3000078e:	e8 39 fd ff ff       	call   300004cc <printdI>
30000793:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:54
        heapEnd=allocatedPtr+needed;
30000796:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
30000799:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000079c:	01 c2                	add    edx,eax
3000079e:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
300007a4:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:55
        printdI(DEBUG_MALLOC,"libc_malloc: Req 0x%08X bytes, ret was 0x%08X, heapEnd=0x%08X\n",needed,allocatedPtr,heapEnd);
300007a6:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
300007ac:	8b 00                	mov    eax,DWORD PTR [eax]
300007ae:	83 ec 0c             	sub    esp,0xc
300007b1:	50                   	push   eax
300007b2:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
300007b5:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
300007b8:	8d 86 a4 fa ff ff    	lea    eax,[esi-0x55c]
300007be:	50                   	push   eax
300007bf:	68 00 00 00 01       	push   0x1000000
300007c4:	89 f3                	mov    ebx,esi
300007c6:	e8 01 fd ff ff       	call   300004cc <printdI>
300007cb:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:56
        if (heapBase==0)    //Hasn't been initialized yet!
300007ce:	8b 86 f4 ff ff ff    	mov    eax,DWORD PTR [esi-0xc]
300007d4:	8b 00                	mov    eax,DWORD PTR [eax]
300007d6:	85 c0                	test   eax,eax
300007d8:	75 38                	jne    30000812 <malloc+0x116>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:58
        {
            heapCurr=allocatedPtr;
300007da:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300007e0:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
300007e3:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:59
            heapBase=allocatedPtr;
300007e5:	8b 86 f4 ff ff ff    	mov    eax,DWORD PTR [esi-0xc]
300007eb:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
300007ee:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:60
            printdI(DEBUG_MALLOC,"libc_malloc: Initialized heapCurr and heapBase to 0x%08X\n",heapCurr);
300007f0:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300007f6:	8b 00                	mov    eax,DWORD PTR [eax]
300007f8:	83 ec 04             	sub    esp,0x4
300007fb:	50                   	push   eax
300007fc:	8d 86 e4 fa ff ff    	lea    eax,[esi-0x51c]
30000802:	50                   	push   eax
30000803:	68 00 00 00 01       	push   0x1000000
30000808:	89 f3                	mov    ebx,esi
3000080a:	e8 bd fc ff ff       	call   300004cc <printdI>
3000080f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:63
        }
    }
    printdI(DEBUG_MALLOC,"libc_malloc:creating heap rec @ 0x%08X\n",heapCurr);
30000812:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000818:	8b 00                	mov    eax,DWORD PTR [eax]
3000081a:	83 ec 04             	sub    esp,0x4
3000081d:	50                   	push   eax
3000081e:	8d 86 20 fb ff ff    	lea    eax,[esi-0x4e0]
30000824:	50                   	push   eax
30000825:	68 00 00 00 01       	push   0x1000000
3000082a:	89 f3                	mov    ebx,esi
3000082c:	e8 9b fc ff ff       	call   300004cc <printdI>
30000831:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:64
    heapPtr = (heaprec_t*)heapCurr;
30000834:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
3000083a:	8b 00                	mov    eax,DWORD PTR [eax]
3000083c:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:65
    heapPtr->marker=ALLOC_MARKER_VALUE;
3000083f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000842:	c7 00 d0 00 0f b0    	mov    DWORD PTR [eax],0xb00f00d0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:66
    heapPtr->len=size;
30000848:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
3000084b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
3000084e:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:67
    heapPtr->inUse=true;
30000851:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000854:	c6 40 08 01          	mov    BYTE PTR [eax+0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:68
    printdI(DEBUG_MALLOC,"libc_malloc: heapCurr=0x%08X, sizeof(heaprec_t)=0x%08X\n",heapCurr,sizeof(heaprec_t));
30000858:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
3000085e:	8b 00                	mov    eax,DWORD PTR [eax]
30000860:	6a 10                	push   0x10
30000862:	50                   	push   eax
30000863:	8d 86 48 fb ff ff    	lea    eax,[esi-0x4b8]
30000869:	50                   	push   eax
3000086a:	68 00 00 00 01       	push   0x1000000
3000086f:	89 f3                	mov    ebx,esi
30000871:	e8 56 fc ff ff       	call   300004cc <printdI>
30000876:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:69
    retVal=(void*)(heapCurr+sizeof(heaprec_t));
30000879:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
3000087f:	8b 00                	mov    eax,DWORD PTR [eax]
30000881:	83 c0 10             	add    eax,0x10
30000884:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:70
    HEAP_GET_NEXT(heapPtr,heapPtrNext);
30000887:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
3000088a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
3000088d:	8d 50 10             	lea    edx,[eax+0x10]
30000890:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000893:	01 d0                	add    eax,edx
30000895:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:71
    ((heaprec_t*)heapPtrNext)->prev=heapPtr;
30000898:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
3000089b:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
3000089e:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:72
    heapCurr+=size+(sizeof(heaprec_t));
300008a1:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300008a7:	8b 10                	mov    edx,DWORD PTR [eax]
300008a9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300008ac:	01 d0                	add    eax,edx
300008ae:	8d 50 10             	lea    edx,[eax+0x10]
300008b1:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300008b7:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:73
    printdI(DEBUG_MALLOC,"returning 0x%08X\n",retVal);
300008b9:	83 ec 04             	sub    esp,0x4
300008bc:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
300008bf:	8d 86 80 fb ff ff    	lea    eax,[esi-0x480]
300008c5:	50                   	push   eax
300008c6:	68 00 00 00 01       	push   0x1000000
300008cb:	89 f3                	mov    ebx,esi
300008cd:	e8 fa fb ff ff       	call   300004cc <printdI>
300008d2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:74
    return retVal;
300008d5:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:75
}
300008d8:	8d 65 f8             	lea    esp,[ebp-0x8]
300008db:	5b                   	pop    ebx
300008dc:	5e                   	pop    esi
300008dd:	5d                   	pop    ebp
300008de:	c3                   	ret    

300008df <free>:
free():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:78

__attribute__((visibility("default"))) void free(void* fpointer)
{
300008df:	55                   	push   ebp
300008e0:	89 e5                	mov    ebp,esp
300008e2:	83 ec 10             	sub    esp,0x10
300008e5:	e8 ac 16 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
300008ea:	05 8e 2b 00 00       	add    eax,0x2b8e
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:81
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if (fpointer==NULL)
300008ef:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
300008f3:	74 20                	je     30000915 <free+0x36>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:83
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
    HEAP_CURR(fpointer,mp);
300008f5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300008f8:	83 e8 10             	sub    eax,0x10
300008fb:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:86
    
    //printDebug(DEBUG_MALLOC,"libc_free: Freeing heap @ fp=0x%08X (mp=0x%08X)\n",fpointer,mp);
    if (mp->marker!=ALLOC_MARKER_VALUE)
300008fe:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000901:	8b 00                	mov    eax,DWORD PTR [eax]
30000903:	3d d0 00 0f b0       	cmp    eax,0xb00f00d0
30000908:	74 02                	je     3000090c <free+0x2d>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:90 (discriminator 2)
    {
        //print("malloc: marker not found error!!!\n");
gotoHere:
        goto gotoHere;
3000090a:	eb fe                	jmp    3000090a <free+0x2b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:92
    }
    mp->inUse=false;
3000090c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
3000090f:	c6 40 08 00          	mov    BYTE PTR [eax+0x8],0x0
30000913:	eb 01                	jmp    30000916 <free+0x37>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:82
__attribute__((visibility("default"))) void free(void* fpointer)
{
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if (fpointer==NULL)
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
30000915:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:93
        //print("malloc: marker not found error!!!\n");
gotoHere:
        goto gotoHere;
    }
    mp->inUse=false;
}
30000916:	c9                   	leave  
30000917:	c3                   	ret    

30000918 <malloc_cleanup>:
malloc_cleanup():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:96

void malloc_cleanup()
{
30000918:	55                   	push   ebp
30000919:	89 e5                	mov    ebp,esp
3000091b:	53                   	push   ebx
3000091c:	e8 75 16 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000921:	05 57 2b 00 00       	add    eax,0x2b57
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:97
    asm("mov eax,0x164\ncall sysEnter_Vector\n"::"b" (heapBase));
30000926:	8b 80 f4 ff ff ff    	mov    eax,DWORD PTR [eax-0xc]
3000092c:	8b 00                	mov    eax,DWORD PTR [eax]
3000092e:	89 c3                	mov    ebx,eax
30000930:	b8 64 01 00 00       	mov    eax,0x164
30000935:	e8 fc ff ff ff       	call   30000936 <malloc_cleanup+0x1e>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:98
3000093a:	90                   	nop
3000093b:	5b                   	pop    ebx
3000093c:	5d                   	pop    ebp
3000093d:	c3                   	ret    
3000093e:	66 90                	xchg   ax,ax

30000940 <memcpy>:
memcpy():
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:11
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
VISIBLE void * memcpy(void *dest, const void *src, size_t n)
{
30000940:	55                   	push   ebp
30000941:	89 e5                	mov    ebp,esp
30000943:	83 ec 20             	sub    esp,0x20
30000946:	e8 4b 16 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
3000094b:	05 2d 2b 00 00       	add    eax,0x2b2d
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:14
    bool dw,dd;
    
    dd=n%4==0;
30000950:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000953:	83 e0 03             	and    eax,0x3
30000956:	85 c0                	test   eax,eax
30000958:	0f 94 c0             	sete   al
3000095b:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:15
    dw=n%2==0;
3000095e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000961:	83 e0 01             	and    eax,0x1
30000964:	85 c0                	test   eax,eax
30000966:	0f 94 c0             	sete   al
30000969:	88 45 e6             	mov    BYTE PTR [ebp-0x1a],al
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:16
    if (dd)
3000096c:	80 7d e7 00          	cmp    BYTE PTR [ebp-0x19],0x0
30000970:	74 7d                	je     300009ef <memcpy+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:18
    {
        n /=4;
30000972:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000975:	c1 e8 02             	shr    eax,0x2
30000978:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:19
        const uint32_t *f = src;
3000097b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000097e:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:20
        uint32_t *t = dest;
30000981:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000984:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:22

        if (f < t) {
30000987:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
3000098a:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
3000098d:	73 4b                	jae    300009da <memcpy+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:23
                f += n;
3000098f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000992:	c1 e0 02             	shl    eax,0x2
30000995:	01 45 fc             	add    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:24
                t += n;
30000998:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
3000099b:	c1 e0 02             	shl    eax,0x2
3000099e:	01 45 f8             	add    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:25
                while ( (n)-- > 0)
300009a1:	eb 12                	jmp    300009b5 <memcpy+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:26
                        *--t = *--f;
300009a3:	83 6d f8 04          	sub    DWORD PTR [ebp-0x8],0x4
300009a7:	83 6d fc 04          	sub    DWORD PTR [ebp-0x4],0x4
300009ab:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300009ae:	8b 10                	mov    edx,DWORD PTR [eax]
300009b0:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
300009b3:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:25
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
300009b5:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300009b8:	8d 50 ff             	lea    edx,[eax-0x1]
300009bb:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
300009be:	85 c0                	test   eax,eax
300009c0:	75 e1                	jne    300009a3 <memcpy+0x63>
300009c2:	eb 23                	jmp    300009e7 <memcpy+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:29
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
300009c4:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
300009c7:	8d 50 04             	lea    edx,[eax+0x4]
300009ca:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
300009cd:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
300009d0:	8d 4a 04             	lea    ecx,[edx+0x4]
300009d3:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
300009d6:	8b 12                	mov    edx,DWORD PTR [edx]
300009d8:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:28
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
300009da:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300009dd:	8d 50 ff             	lea    edx,[eax-0x1]
300009e0:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
300009e3:	85 c0                	test   eax,eax
300009e5:	75 dd                	jne    300009c4 <memcpy+0x84>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:30
                        *t++ = *f++;
        return dest;
300009e7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300009ea:	e9 ea 00 00 00       	jmp    30000ad9 <memcpy+0x199>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:32
    }
    else if (dw)
300009ef:	80 7d e6 00          	cmp    BYTE PTR [ebp-0x1a],0x0
300009f3:	74 79                	je     30000a6e <memcpy+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:34
    {
        n /=2;
300009f5:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300009f8:	d1 e8                	shr    eax,1
300009fa:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:35
        const uint32_t *f = src;
300009fd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000a00:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:36
        uint32_t *t = dest;
30000a03:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000a06:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:38

        if (f < t) {
30000a09:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000a0c:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30000a0f:	73 4b                	jae    30000a5c <memcpy+0x11c>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:39
                f += n;
30000a11:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a14:	c1 e0 02             	shl    eax,0x2
30000a17:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:40
                t += n;
30000a1a:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a1d:	c1 e0 02             	shl    eax,0x2
30000a20:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:41
                while ( (n)-- > 0)
30000a23:	eb 12                	jmp    30000a37 <memcpy+0xf7>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:42
                        *--t = *--f;
30000a25:	83 6d f0 04          	sub    DWORD PTR [ebp-0x10],0x4
30000a29:	83 6d f4 04          	sub    DWORD PTR [ebp-0xc],0x4
30000a2d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000a30:	8b 10                	mov    edx,DWORD PTR [eax]
30000a32:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000a35:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:41
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
30000a37:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a3a:	8d 50 ff             	lea    edx,[eax-0x1]
30000a3d:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000a40:	85 c0                	test   eax,eax
30000a42:	75 e1                	jne    30000a25 <memcpy+0xe5>
30000a44:	eb 23                	jmp    30000a69 <memcpy+0x129>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:45
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
30000a46:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000a49:	8d 50 04             	lea    edx,[eax+0x4]
30000a4c:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
30000a4f:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
30000a52:	8d 4a 04             	lea    ecx,[edx+0x4]
30000a55:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
30000a58:	8b 12                	mov    edx,DWORD PTR [edx]
30000a5a:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:44
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
30000a5c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a5f:	8d 50 ff             	lea    edx,[eax-0x1]
30000a62:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000a65:	85 c0                	test   eax,eax
30000a67:	75 dd                	jne    30000a46 <memcpy+0x106>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:46
                        *t++ = *f++;
        return dest;
30000a69:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000a6c:	eb 6b                	jmp    30000ad9 <memcpy+0x199>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:50
    }
    else
    {
        const char *f = src;
30000a6e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000a71:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:51
        char *t = dest;
30000a74:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000a77:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:53

        if (f < t) {
30000a7a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a7d:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
30000a80:	73 47                	jae    30000ac9 <memcpy+0x189>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:54
                f += n;
30000a82:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a85:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:55
                t += n;
30000a88:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a8b:	01 45 e8             	add    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:56
                while (n-- > 0)
30000a8e:	eb 13                	jmp    30000aa3 <memcpy+0x163>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:57
                        *--t = *--f;
30000a90:	83 6d e8 01          	sub    DWORD PTR [ebp-0x18],0x1
30000a94:	83 6d ec 01          	sub    DWORD PTR [ebp-0x14],0x1
30000a98:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a9b:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30000a9e:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30000aa1:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:56
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
30000aa3:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000aa6:	8d 50 ff             	lea    edx,[eax-0x1]
30000aa9:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000aac:	85 c0                	test   eax,eax
30000aae:	75 e0                	jne    30000a90 <memcpy+0x150>
30000ab0:	eb 24                	jmp    30000ad6 <memcpy+0x196>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:60
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
30000ab2:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30000ab5:	8d 50 01             	lea    edx,[eax+0x1]
30000ab8:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
30000abb:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000abe:	8d 4a 01             	lea    ecx,[edx+0x1]
30000ac1:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
30000ac4:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000ac7:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:59
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
30000ac9:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000acc:	8d 50 ff             	lea    edx,[eax-0x1]
30000acf:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000ad2:	85 c0                	test   eax,eax
30000ad4:	75 dc                	jne    30000ab2 <memcpy+0x172>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:61
                        *t++ = *f++;
        return dest;
30000ad6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:63
    }
}
30000ad9:	c9                   	leave  
30000ada:	c3                   	ret    
30000adb:	90                   	nop

30000adc <memset>:
memset():
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:9
 * and open the template in the editor.
 */
#include "libChrisOS.h"

VISIBLE void *memset(void *d1, int val, size_t len)
{
30000adc:	55                   	push   ebp
30000add:	89 e5                	mov    ebp,esp
30000adf:	83 ec 20             	sub    esp,0x20
30000ae2:	e8 af 14 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000ae7:	05 91 29 00 00       	add    eax,0x2991
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:10
    uint8_t *d = d1;
30000aec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000aef:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:11
    uint16_t*e = d1;
30000af2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000af5:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:12
    uint16_t eVal=(val << 16) | (val << 8) | val;
30000af8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000afb:	c1 e0 10             	shl    eax,0x10
30000afe:	89 c2                	mov    edx,eax
30000b00:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000b03:	c1 e0 08             	shl    eax,0x8
30000b06:	09 c2                	or     edx,eax
30000b08:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000b0b:	09 d0                	or     eax,edx
30000b0d:	66 89 45 f2          	mov    WORD PTR [ebp-0xe],ax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:13
    uint32_t*f = d1;
30000b11:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000b14:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:14
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
30000b17:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000b1a:	c1 e0 18             	shl    eax,0x18
30000b1d:	89 c2                	mov    edx,eax
30000b1f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000b22:	c1 e0 10             	shl    eax,0x10
30000b25:	09 c2                	or     edx,eax
30000b27:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000b2a:	c1 e0 08             	shl    eax,0x8
30000b2d:	09 d0                	or     eax,edx
30000b2f:	0b 45 0c             	or     eax,DWORD PTR [ebp+0xc]
30000b32:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:16
    
    if ((len%4)==0)
30000b35:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b38:	83 e0 03             	and    eax,0x3
30000b3b:	85 c0                	test   eax,eax
30000b3d:	75 1c                	jne    30000b5b <memset+0x7f>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:17
    while (len-=4) {
30000b3f:	eb 0e                	jmp    30000b4f <memset+0x73>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:18
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
30000b41:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000b44:	8d 50 04             	lea    edx,[eax+0x4]
30000b47:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000b4a:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000b4d:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:17
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
30000b4f:	83 6d 10 04          	sub    DWORD PTR [ebp+0x10],0x4
30000b53:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000b57:	75 e8                	jne    30000b41 <memset+0x65>
30000b59:	eb 43                	jmp    30000b9e <memset+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:20
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
30000b5b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b5e:	83 e0 01             	and    eax,0x1
30000b61:	85 c0                	test   eax,eax
30000b63:	75 2c                	jne    30000b91 <memset+0xb5>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:21
    while (len-=2) {
30000b65:	eb 10                	jmp    30000b77 <memset+0x9b>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:22
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
30000b67:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000b6a:	8d 50 02             	lea    edx,[eax+0x2]
30000b6d:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
30000b70:	0f b7 55 f2          	movzx  edx,WORD PTR [ebp-0xe]
30000b74:	66 89 10             	mov    WORD PTR [eax],dx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:21
    if ((len%4)==0)
    while (len-=4) {
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
    while (len-=2) {
30000b77:	83 6d 10 02          	sub    DWORD PTR [ebp+0x10],0x2
30000b7b:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000b7f:	75 e6                	jne    30000b67 <memset+0x8b>
30000b81:	eb 1b                	jmp    30000b9e <memset+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:26
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
        *d++ = val;
30000b83:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000b86:	8d 50 01             	lea    edx,[eax+0x1]
30000b89:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000b8c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000b8f:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:25
    else if (((len%2)==0))
    while (len-=2) {
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
30000b91:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b94:	8d 50 ff             	lea    edx,[eax-0x1]
30000b97:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000b9a:	85 c0                	test   eax,eax
30000b9c:	75 e5                	jne    30000b83 <memset+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:28
        *d++ = val;
    }
    return d1;
30000b9e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:29
30000ba1:	c9                   	leave  
30000ba2:	c3                   	ret    
30000ba3:	90                   	nop

30000ba4 <mmap>:
mmap():
/home/yogi/src/os/aproj/libChrisOS/src/mmap.c:10
 */
#include "libChrisOS.h"
#include "types.h"

VISIBLE void* mmap (void *addr,size_t len,int prot,int flags,int fd,off_t offset) //memory map pages either to a file or anonymously
{
30000ba4:	55                   	push   ebp
30000ba5:	89 e5                	mov    ebp,esp
30000ba7:	e8 ea 13 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000bac:	05 cc 28 00 00       	add    eax,0x28cc
/home/yogi/src/os/aproj/libChrisOS/src/mmap.c:12
    
}
30000bb1:	90                   	nop
30000bb2:	5d                   	pop    ebp
30000bb3:	c3                   	ret    

30000bb4 <readConsole>:
readConsole():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:16
file_operations_t fops;
inode_t console_node={.i_dev=1,.i_mode=0};
file_t console_file;

size_t readConsole (struct file * fptr, char *buffer, size_t size, uint64_t* whatever) 
{
30000bb4:	55                   	push   ebp
30000bb5:	89 e5                	mov    ebp,esp
30000bb7:	53                   	push   ebx
30000bb8:	83 ec 04             	sub    esp,0x4
30000bbb:	e8 d6 13 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000bc0:	05 b8 28 00 00       	add    eax,0x28b8
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:17
    return gets(buffer,size,1);
30000bc5:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
30000bc8:	83 ec 04             	sub    esp,0x4
30000bcb:	6a 01                	push   0x1
30000bcd:	52                   	push   edx
30000bce:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000bd1:	89 c3                	mov    ebx,eax
30000bd3:	e8 e8 13 00 00       	call   30001fc0 <__x86.get_pc_thunk.ax+0x2a>
30000bd8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:18
}
30000bdb:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000bde:	c9                   	leave  
30000bdf:	c3                   	ret    

30000be0 <writeConsole>:
writeConsole():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:21

size_t writeConsole(struct file * fptr, const char *buffer, size_t size, uint64_t *whatever)
{
30000be0:	55                   	push   ebp
30000be1:	89 e5                	mov    ebp,esp
30000be3:	53                   	push   ebx
30000be4:	83 ec 04             	sub    esp,0x4
30000be7:	e8 aa 13 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000bec:	05 8c 28 00 00       	add    eax,0x288c
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:22
    return printI(buffer);
30000bf1:	83 ec 0c             	sub    esp,0xc
30000bf4:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000bf7:	89 c3                	mov    ebx,eax
30000bf9:	e8 9a f8 ff ff       	call   30000498 <printI>
30000bfe:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:23
}
30000c01:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000c04:	c9                   	leave  
30000c05:	c3                   	ret    

30000c06 <ioInit>:
ioInit():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:26

void ioInit()
{
30000c06:	55                   	push   ebp
30000c07:	89 e5                	mov    ebp,esp
30000c09:	e8 88 13 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000c0e:	05 6a 28 00 00       	add    eax,0x286a
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:27
    console_file.f_inode=&console_node;
30000c13:	8b 90 ec ff ff ff    	mov    edx,DWORD PTR [eax-0x14]
30000c19:	8d 88 28 ff ff ff    	lea    ecx,[eax-0xd8]
30000c1f:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:28
    fops.read=readConsole;
30000c22:	8b 90 e8 ff ff ff    	mov    edx,DWORD PTR [eax-0x18]
30000c28:	8d 88 3c d7 ff ff    	lea    ecx,[eax-0x28c4]
30000c2e:	89 0a                	mov    DWORD PTR [edx],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:29
    fops.write=writeConsole;
30000c30:	8b 90 e8 ff ff ff    	mov    edx,DWORD PTR [eax-0x18]
30000c36:	8d 88 68 d7 ff ff    	lea    ecx,[eax-0x2898]
30000c3c:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:30
    console_file.fops=fops;
30000c3f:	8b 88 ec ff ff ff    	mov    ecx,DWORD PTR [eax-0x14]
30000c45:	8b 80 e8 ff ff ff    	mov    eax,DWORD PTR [eax-0x18]
30000c4b:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
30000c4e:	8b 00                	mov    eax,DWORD PTR [eax]
30000c50:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
30000c53:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:31
30000c56:	90                   	nop
30000c57:	5d                   	pop    ebp
30000c58:	c3                   	ret    
30000c59:	66 90                	xchg   ax,ax
30000c5b:	90                   	nop

30000c5c <strcat>:
strcat():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:30
   #endif
   
   /* Append SRC on the end of DEST.  */
   __attribute__((visibility("default"))) char *
   STRCAT (char *dest, const char *src)
   {
30000c5c:	55                   	push   ebp
30000c5d:	89 e5                	mov    ebp,esp
30000c5f:	53                   	push   ebx
30000c60:	83 ec 04             	sub    esp,0x4
30000c63:	e8 88 13 00 00       	call   30001ff0 <__x86.get_pc_thunk.bx>
30000c68:	81 c3 10 28 00 00    	add    ebx,0x2810
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:31
     strcpy (dest + strlen (dest), src);
30000c6e:	83 ec 0c             	sub    esp,0xc
30000c71:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000c74:	e8 67 13 00 00       	call   30001fe0 <__x86.get_pc_thunk.ax+0x4a>
30000c79:	83 c4 10             	add    esp,0x10
30000c7c:	89 c2                	mov    edx,eax
30000c7e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000c81:	01 d0                	add    eax,edx
30000c83:	83 ec 08             	sub    esp,0x8
30000c86:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000c89:	50                   	push   eax
30000c8a:	e8 21 13 00 00       	call   30001fb0 <__x86.get_pc_thunk.ax+0x1a>
30000c8f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:32
     return dest;
30000c92:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:33
   }
30000c95:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000c98:	c9                   	leave  
30000c99:	c3                   	ret    

30000c9a <concatenate>:
concatenate():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:35

   void concatenate(char p[], char q[]) {
30000c9a:	55                   	push   ebp
30000c9b:	89 e5                	mov    ebp,esp
30000c9d:	83 ec 10             	sub    esp,0x10
30000ca0:	e8 f1 12 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000ca5:	05 d3 27 00 00       	add    eax,0x27d3
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:38
   int c, d;
 
   c = 0;
30000caa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:40
 
   while (p[c] != '\0') {
30000cb1:	eb 04                	jmp    30000cb7 <concatenate+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:41
      c++;  	
30000cb3:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:40
   void concatenate(char p[], char q[]) {
   int c, d;
 
   c = 0;
 
   while (p[c] != '\0') {
30000cb7:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000cba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000cbd:	01 d0                	add    eax,edx
30000cbf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000cc2:	84 c0                	test   al,al
30000cc4:	75 ed                	jne    30000cb3 <concatenate+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:44
      c++;  	
   }
 
   d = 0;
30000cc6:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:46
 
   while (q[d] != '\0') {
30000ccd:	eb 1d                	jmp    30000cec <concatenate+0x52>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:47
      p[c] = q[d];
30000ccf:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000cd2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000cd5:	01 c2                	add    edx,eax
30000cd7:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
30000cda:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cdd:	01 c8                	add    eax,ecx
30000cdf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000ce2:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:48
      d++;
30000ce4:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:49
      c++;	
30000ce8:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:46
      c++;  	
   }
 
   d = 0;
 
   while (q[d] != '\0') {
30000cec:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30000cef:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cf2:	01 d0                	add    eax,edx
30000cf4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000cf7:	84 c0                	test   al,al
30000cf9:	75 d4                	jne    30000ccf <concatenate+0x35>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:52
      p[c] = q[d];
      d++;
      c++;	
   }
 
   p[c] = '\0';
30000cfb:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000cfe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000d01:	01 d0                	add    eax,edx
30000d03:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:53
30000d06:	90                   	nop
30000d07:	c9                   	leave  
30000d08:	c3                   	ret    
30000d09:	66 90                	xchg   ax,ax
30000d0b:	90                   	nop

30000d0c <strcmp>:
strcmp():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:25

/* Compare S1 and S2, returning less than, equal to or
   greater than zero if S1 is lexicographically less than,
   equal to or greater than S2.  */
VISIBLE int strcmp (const char *p1, const char *p2)
{
30000d0c:	55                   	push   ebp
30000d0d:	89 e5                	mov    ebp,esp
30000d0f:	56                   	push   esi
30000d10:	53                   	push   ebx
30000d11:	83 ec 10             	sub    esp,0x10
30000d14:	e8 7d 12 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000d19:	05 5f 27 00 00       	add    eax,0x275f
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:26
  register const unsigned char *s1 = (const unsigned char *) p1;
30000d1e:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:27
  register const unsigned char *s2 = (const unsigned char *) p2;
30000d21:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:32
  unsigned char c1, c2;

  do
    {
      c1 = (unsigned char) *s1++;
30000d24:	89 d8                	mov    eax,ebx
30000d26:	8d 58 01             	lea    ebx,[eax+0x1]
30000d29:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000d2c:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:33
      c2 = (unsigned char) *s2++;
30000d2f:	89 f0                	mov    eax,esi
30000d31:	8d 70 01             	lea    esi,[eax+0x1]
30000d34:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000d37:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:34
      if (c1 == '\0')
30000d3a:	80 7d f7 00          	cmp    BYTE PTR [ebp-0x9],0x0
30000d3e:	75 0e                	jne    30000d4e <strcmp+0x42>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:35
	return c1 - c2;
30000d40:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
30000d44:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30000d48:	29 c2                	sub    edx,eax
30000d4a:	89 d0                	mov    eax,edx
30000d4c:	eb 15                	jmp    30000d63 <strcmp+0x57>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:37
    }
  while (c1 == c2);
30000d4e:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30000d52:	3a 45 f6             	cmp    al,BYTE PTR [ebp-0xa]
30000d55:	74 cd                	je     30000d24 <strcmp+0x18>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:39

  return c1 - c2;
30000d57:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
30000d5b:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30000d5f:	29 c2                	sub    edx,eax
30000d61:	89 d0                	mov    eax,edx
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:40
}
30000d63:	83 c4 10             	add    esp,0x10
30000d66:	5b                   	pop    ebx
30000d67:	5e                   	pop    esi
30000d68:	5d                   	pop    ebp
30000d69:	c3                   	ret    
30000d6a:	66 90                	xchg   ax,ax

30000d6c <strcpy>:
strcpy():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:5
#include "strings.h"

__attribute__((visibility("default"))) char *
strcpy(char *s1, const char *s2)
{
30000d6c:	55                   	push   ebp
30000d6d:	89 e5                	mov    ebp,esp
30000d6f:	83 ec 10             	sub    esp,0x10
30000d72:	e8 1f 12 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000d77:	05 01 27 00 00       	add    eax,0x2701
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:6
    char *s = s1;
30000d7c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000d7f:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:7
    while ((*s++ = *s2++) != 0)
30000d82:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:7 (discriminator 1)
30000d83:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000d86:	8d 50 01             	lea    edx,[eax+0x1]
30000d89:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000d8c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000d8f:	8d 4a 01             	lea    ecx,[edx+0x1]
30000d92:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
30000d95:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000d98:	88 10                	mov    BYTE PTR [eax],dl
30000d9a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000d9d:	84 c0                	test   al,al
30000d9f:	75 e2                	jne    30000d83 <strcpy+0x17>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:9
	;
    *s=0;       //CLR 04/20/2017: Added terminating null character to returned string
30000da1:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000da4:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:10
    return (s1);
30000da7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:11
}
30000daa:	c9                   	leave  
30000dab:	c3                   	ret    

30000dac <strcpyc>:
strcpyc():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:15

__attribute__((visibility("default"))) char *
strcpyc(char *s1, const char *s2, unsigned count)
{
30000dac:	55                   	push   ebp
30000dad:	89 e5                	mov    ebp,esp
30000daf:	83 ec 10             	sub    esp,0x10
30000db2:	e8 df 11 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000db7:	05 c1 26 00 00       	add    eax,0x26c1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:16
    char *s = s1;
30000dbc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000dbf:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17
    while ((*s++ = *s2++) != 0 && count-->0)
30000dc2:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17 (discriminator 2)
30000dc3:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000dc6:	8d 50 01             	lea    edx,[eax+0x1]
30000dc9:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000dcc:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000dcf:	8d 4a 01             	lea    ecx,[edx+0x1]
30000dd2:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
30000dd5:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000dd8:	88 10                	mov    BYTE PTR [eax],dl
30000dda:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000ddd:	84 c0                	test   al,al
30000ddf:	74 0d                	je     30000dee <strcpyc+0x42>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17 (discriminator 1)
30000de1:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000de4:	8d 50 ff             	lea    edx,[eax-0x1]
30000de7:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000dea:	85 c0                	test   eax,eax
30000dec:	75 d5                	jne    30000dc3 <strcpyc+0x17>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:19
	;
    return (s1);
30000dee:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:20
}
30000df1:	c9                   	leave  
30000df2:	c3                   	ret    
30000df3:	90                   	nop

30000df4 <strlen>:
strlen():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:3
#include <stddef.h>

__attribute__((visibility("default"))) size_t strlen(const char* str) {
30000df4:	55                   	push   ebp
30000df5:	89 e5                	mov    ebp,esp
30000df7:	83 ec 10             	sub    esp,0x10
30000dfa:	e8 97 11 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000dff:	05 79 26 00 00       	add    eax,0x2679
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:4
          size_t ret = 0;
30000e04:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:5
        while ( str[ret] != 0 )
30000e0b:	eb 04                	jmp    30000e11 <strlen+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:6
                ret++;
30000e0d:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:5
#include <stddef.h>

__attribute__((visibility("default"))) size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
30000e11:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30000e14:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000e17:	01 d0                	add    eax,edx
30000e19:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000e1c:	84 c0                	test   al,al
30000e1e:	75 ed                	jne    30000e0d <strlen+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:7
                ret++;
        return ret;
30000e20:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:8
}
30000e23:	c9                   	leave  
30000e24:	c3                   	ret    
30000e25:	66 90                	xchg   ax,ax
30000e27:	90                   	nop

30000e28 <strncmp>:
strncmp():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:13
 *   array pointed to by `s2'.  [4.11.4.4]
 */
#include <stddef.h>

__attribute__((visibility("default"))) int strncmp(const char *s1, const char *s2, size_t n)
{
30000e28:	55                   	push   ebp
30000e29:	89 e5                	mov    ebp,esp
30000e2b:	e8 66 11 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000e30:	05 48 26 00 00       	add    eax,0x2648
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14
    for ( ; n > 0; s1++, s2++, --n)
30000e35:	eb 4b                	jmp    30000e82 <strncmp+0x5a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:15
	if (*s1 != *s2)
30000e37:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000e3a:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30000e3d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000e40:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000e43:	38 c2                	cmp    dl,al
30000e45:	74 1e                	je     30000e65 <strncmp+0x3d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
30000e47:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000e4a:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30000e4d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000e50:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000e53:	38 c2                	cmp    dl,al
30000e55:	73 07                	jae    30000e5e <strncmp+0x36>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16 (discriminator 1)
30000e57:	b8 ff ff ff ff       	mov    eax,0xffffffff
30000e5c:	eb 2f                	jmp    30000e8d <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16 (discriminator 2)
30000e5e:	b8 01 00 00 00       	mov    eax,0x1
30000e63:	eb 28                	jmp    30000e8d <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:17
	else if (*s1 == '\0')
30000e65:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000e68:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000e6b:	84 c0                	test   al,al
30000e6d:	75 07                	jne    30000e76 <strncmp+0x4e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:18
	    return 0;
30000e6f:	b8 00 00 00 00       	mov    eax,0x0
30000e74:	eb 17                	jmp    30000e8d <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14
 */
#include <stddef.h>

__attribute__((visibility("default"))) int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
30000e76:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
30000e7a:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
30000e7e:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14 (discriminator 1)
30000e82:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000e86:	75 af                	jne    30000e37 <strncmp+0xf>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:19
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
    return 0;
30000e88:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:20
}
30000e8d:	5d                   	pop    ebp
30000e8e:	c3                   	ret    
30000e8f:	90                   	nop

30000e90 <strncpy>:
strncpy():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:14
 *   The `strncpy' function returns the value of `s1'.  [4.11.2.4]
 */
#include <stddef.h>

__attribute__((visibility("default"))) char * strncpy(char *s1, const char *s2, size_t n)
{
30000e90:	55                   	push   ebp
30000e91:	89 e5                	mov    ebp,esp
30000e93:	83 ec 10             	sub    esp,0x10
30000e96:	e8 fb 10 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000e9b:	05 dd 25 00 00       	add    eax,0x25dd
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:15
    char *s = s1;
30000ea0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000ea3:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16
    while (n > 0 && *s2 != '\0') {
30000ea6:	eb 1b                	jmp    30000ec3 <strncpy+0x33>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:17
	*s++ = *s2++;
30000ea8:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000eab:	8d 50 01             	lea    edx,[eax+0x1]
30000eae:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000eb1:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000eb4:	8d 4a 01             	lea    ecx,[edx+0x1]
30000eb7:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
30000eba:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000ebd:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:18
	--n;
30000ebf:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16
#include <stddef.h>

__attribute__((visibility("default"))) char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
30000ec3:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000ec7:	74 1c                	je     30000ee5 <strncpy+0x55>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16 (discriminator 1)
30000ec9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000ecc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000ecf:	84 c0                	test   al,al
30000ed1:	75 d5                	jne    30000ea8 <strncpy+0x18>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:20
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
30000ed3:	eb 10                	jmp    30000ee5 <strncpy+0x55>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:21
	*s++ = '\0';
30000ed5:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000ed8:	8d 50 01             	lea    edx,[eax+0x1]
30000edb:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000ede:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:22
	--n;
30000ee1:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:20
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
30000ee5:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000ee9:	75 ea                	jne    30000ed5 <strncpy+0x45>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:24
	*s++ = '\0';
	--n;
    }
    return s1;
30000eeb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:25
}
30000eee:	c9                   	leave  
30000eef:	c3                   	ret    

30000ef0 <strtoul>:
strtoul():
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:60
 * Ignores `locale' stuff.  Assumes that the upper and lower case
 * alphabets and digits are each contiguous.
 */
unsigned long
__attribute__((visibility("default"))) strtoul(const char *nptr, char **endptr, register int base)
{
30000ef0:	55                   	push   ebp
30000ef1:	89 e5                	mov    ebp,esp
30000ef3:	57                   	push   edi
30000ef4:	56                   	push   esi
30000ef5:	53                   	push   ebx
30000ef6:	83 ec 08             	sub    esp,0x8
30000ef9:	e8 98 10 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30000efe:	05 7a 25 00 00       	add    eax,0x257a
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:61
	register const char *s = nptr;
30000f03:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:65
	register unsigned long acc;
	register int c;
	register unsigned long cutoff;
	register int neg = 0, any, cutlim;
30000f06:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:71 (discriminator 1)

	/*
	 * See strtol for comments as to the logic used.
	 */
	do {
		c = *s++;
30000f0d:	89 f0                	mov    eax,esi
30000f0f:	8d 70 01             	lea    esi,[eax+0x1]
30000f12:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f15:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:72 (discriminator 1)
	} while (c==' ');
30000f18:	83 fb 20             	cmp    ebx,0x20
30000f1b:	74 f0                	je     30000f0d <strtoul+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:73
	if (c == '-') {
30000f1d:	83 fb 2d             	cmp    ebx,0x2d
30000f20:	75 14                	jne    30000f36 <strtoul+0x46>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:74
		neg = 1;
30000f22:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:75
		c = *s++;
30000f29:	89 f0                	mov    eax,esi
30000f2b:	8d 70 01             	lea    esi,[eax+0x1]
30000f2e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f31:	0f be d8             	movsx  ebx,al
30000f34:	eb 10                	jmp    30000f46 <strtoul+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:76
	} else if (c == '+')
30000f36:	83 fb 2b             	cmp    ebx,0x2b
30000f39:	75 0b                	jne    30000f46 <strtoul+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:77
		c = *s++;
30000f3b:	89 f0                	mov    eax,esi
30000f3d:	8d 70 01             	lea    esi,[eax+0x1]
30000f40:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f43:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78
	if ((base == 0 || base == 16) &&
30000f46:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000f4a:	74 06                	je     30000f52 <strtoul+0x62>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78 (discriminator 2)
30000f4c:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
30000f50:	75 26                	jne    30000f78 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78 (discriminator 3)
30000f52:	83 fb 30             	cmp    ebx,0x30
30000f55:	75 21                	jne    30000f78 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:79
	    c == '0' && (*s == 'x' || *s == 'X')) {
30000f57:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30000f5a:	3c 78                	cmp    al,0x78
30000f5c:	74 07                	je     30000f65 <strtoul+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:79 (discriminator 1)
30000f5e:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30000f61:	3c 58                	cmp    al,0x58
30000f63:	75 13                	jne    30000f78 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:80
		c = s[1];
30000f65:	8d 46 01             	lea    eax,[esi+0x1]
30000f68:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f6b:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:81
		s += 2;
30000f6e:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:82
		base = 16;
30000f71:	c7 45 10 10 00 00 00 	mov    DWORD PTR [ebp+0x10],0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:84
	}
	if (base == 0)
30000f78:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000f7c:	75 14                	jne    30000f92 <strtoul+0xa2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85
		base = c == '0' ? 8 : 10;
30000f7e:	83 fb 30             	cmp    ebx,0x30
30000f81:	75 07                	jne    30000f8a <strtoul+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 1)
30000f83:	b8 08 00 00 00       	mov    eax,0x8
30000f88:	eb 05                	jmp    30000f8f <strtoul+0x9f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 2)
30000f8a:	b8 0a 00 00 00       	mov    eax,0xa
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 4)
30000f8f:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:86
	cutoff = (unsigned long)ULONG_MAX / (unsigned long)base;
30000f92:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30000f95:	b8 ff ff ff ff       	mov    eax,0xffffffff
30000f9a:	ba 00 00 00 00       	mov    edx,0x0
30000f9f:	f7 f1                	div    ecx
30000fa1:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:87
	cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;
30000fa4:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30000fa7:	b8 ff ff ff ff       	mov    eax,0xffffffff
30000fac:	ba 00 00 00 00       	mov    edx,0x0
30000fb1:	f7 f1                	div    ecx
30000fb3:	89 d0                	mov    eax,edx
30000fb5:	89 c2                	mov    edx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:88
	for (acc = 0, any = 0;; c = *s++) {
30000fb7:	bf 00 00 00 00       	mov    edi,0x0
30000fbc:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:89
		if (ISDIGIT(c))
30000fc1:	8d 43 d0             	lea    eax,[ebx-0x30]
30000fc4:	83 f8 09             	cmp    eax,0x9
30000fc7:	77 05                	ja     30000fce <strtoul+0xde>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:90
			c -= '0';
30000fc9:	83 eb 30             	sub    ebx,0x30
30000fcc:	eb 25                	jmp    30000ff3 <strtoul+0x103>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:91
		else if (ISALPHA(c))
30000fce:	89 d8                	mov    eax,ebx
30000fd0:	83 c8 20             	or     eax,0x20
30000fd3:	83 e8 61             	sub    eax,0x61
30000fd6:	83 f8 19             	cmp    eax,0x19
30000fd9:	77 56                	ja     30001031 <strtoul+0x141>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
30000fdb:	83 fb 40             	cmp    ebx,0x40
30000fde:	7e 0c                	jle    30000fec <strtoul+0xfc>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 1)
30000fe0:	83 fb 5a             	cmp    ebx,0x5a
30000fe3:	7f 07                	jg     30000fec <strtoul+0xfc>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 3)
30000fe5:	b8 37 00 00 00       	mov    eax,0x37
30000fea:	eb 05                	jmp    30000ff1 <strtoul+0x101>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 4)
30000fec:	b8 57 00 00 00       	mov    eax,0x57
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 6)
30000ff1:	29 c3                	sub    ebx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:95
		else
			break;
		if (c >= base)
30000ff3:	3b 5d 10             	cmp    ebx,DWORD PTR [ebp+0x10]
30000ff6:	7d 3c                	jge    30001034 <strtoul+0x144>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97
			break;
		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
30000ff8:	89 c8                	mov    eax,ecx
30000ffa:	85 c0                	test   eax,eax
30000ffc:	78 10                	js     3000100e <strtoul+0x11e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 1)
30000ffe:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30001001:	77 0b                	ja     3000100e <strtoul+0x11e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 2)
30001003:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30001006:	75 0d                	jne    30001015 <strtoul+0x125>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 3)
30001008:	89 d0                	mov    eax,edx
3000100a:	39 c3                	cmp    ebx,eax
3000100c:	7e 07                	jle    30001015 <strtoul+0x125>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:98
			any = -1;
3000100e:	b9 ff ff ff ff       	mov    ecx,0xffffffff
30001013:	eb 0f                	jmp    30001024 <strtoul+0x134>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:100
		else {
			any = 1;
30001015:	b9 01 00 00 00       	mov    ecx,0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:101
			acc *= base;
3000101a:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
3000101d:	0f af f8             	imul   edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:102
			acc += c;
30001020:	89 d8                	mov    eax,ebx
30001022:	01 c7                	add    edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:88
	}
	if (base == 0)
		base = c == '0' ? 8 : 10;
	cutoff = (unsigned long)ULONG_MAX / (unsigned long)base;
	cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;
	for (acc = 0, any = 0;; c = *s++) {
30001024:	89 f0                	mov    eax,esi
30001026:	8d 70 01             	lea    esi,[eax+0x1]
30001029:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000102c:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:104
		else {
			any = 1;
			acc *= base;
			acc += c;
		}
	}
3000102f:	eb 90                	jmp    30000fc1 <strtoul+0xd1>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:94
		if (ISDIGIT(c))
			c -= '0';
		else if (ISALPHA(c))
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
		else
			break;
30001031:	90                   	nop
30001032:	eb 01                	jmp    30001035 <strtoul+0x145>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:96
		if (c >= base)
			break;
30001034:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:105
			any = 1;
			acc *= base;
			acc += c;
		}
	}
	if (any < 0) {
30001035:	89 c8                	mov    eax,ecx
30001037:	85 c0                	test   eax,eax
30001039:	79 07                	jns    30001042 <strtoul+0x152>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:106
		acc = ULONG_MAX;
3000103b:	bf ff ff ff ff       	mov    edi,0xffffffff
30001040:	eb 08                	jmp    3000104a <strtoul+0x15a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:107
	} else if (neg)
30001042:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30001046:	74 02                	je     3000104a <strtoul+0x15a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:108
		acc = -acc;
30001048:	f7 df                	neg    edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:109
	if (endptr != 0)
3000104a:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
3000104e:	74 13                	je     30001063 <strtoul+0x173>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110
		*endptr = (char *) (any ? s - 1 : nptr);
30001050:	89 c8                	mov    eax,ecx
30001052:	85 c0                	test   eax,eax
30001054:	74 05                	je     3000105b <strtoul+0x16b>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 1)
30001056:	8d 46 ff             	lea    eax,[esi-0x1]
30001059:	eb 03                	jmp    3000105e <strtoul+0x16e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 2)
3000105b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 4)
3000105e:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001061:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:111
	return (acc);
30001063:	89 f8                	mov    eax,edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:112
}
30001065:	83 c4 08             	add    esp,0x8
30001068:	5b                   	pop    ebx
30001069:	5e                   	pop    esi
3000106a:	5f                   	pop    edi
3000106b:	5d                   	pop    ebp
3000106c:	c3                   	ret    
3000106d:	66 90                	xchg   ax,ax
3000106f:	90                   	nop

30001070 <strleft>:
strleft():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:2
__attribute__((visibility("default"))) char* strleft(char* val, int cnt)
{
30001070:	55                   	push   ebp
30001071:	89 e5                	mov    ebp,esp
30001073:	e8 1e 0f 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
30001078:	05 00 24 00 00       	add    eax,0x2400
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:3
    val[cnt]='\0';
3000107d:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001080:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001083:	01 d0                	add    eax,edx
30001085:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:4
    return val;
30001088:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:5
}
3000108b:	5d                   	pop    ebp
3000108c:	c3                   	ret    
3000108d:	66 90                	xchg   ax,ax
3000108f:	90                   	nop

30001090 <strtol>:
strtol():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:88
 * Ignores `locale' stuff.  Assumes that the upper and lower case
 * alphabets and digits are each contiguous.
 */
__attribute__((visibility("default"))) long
strtol(const char *nptr, char **endptr, register int base)
{
30001090:	55                   	push   ebp
30001091:	89 e5                	mov    ebp,esp
30001093:	57                   	push   edi
30001094:	56                   	push   esi
30001095:	53                   	push   ebx
30001096:	83 ec 0c             	sub    esp,0xc
30001099:	e8 f8 0e 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
3000109e:	05 da 23 00 00       	add    eax,0x23da
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:89
	register const char *s = nptr;
300010a3:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:93
	register unsigned long acc;
	register int c;
	register unsigned long cutoff;
	register int neg = 0, any, cutlim;
300010a6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:101 (discriminator 1)
	 * Skip white space and pick up leading +/- sign if any.
	 * If base is 0, allow 0x for hex and 0 for octal, else
	 * assume decimal; if base is already 16, allow 0x.
	 */
	do {
		c = *s++;
300010ad:	89 f0                	mov    eax,esi
300010af:	8d 70 01             	lea    esi,[eax+0x1]
300010b2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300010b5:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:102 (discriminator 1)
	} while (c==' ');
300010b8:	83 fb 20             	cmp    ebx,0x20
300010bb:	74 f0                	je     300010ad <strtol+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:103
	if (c == '-') {
300010bd:	83 fb 2d             	cmp    ebx,0x2d
300010c0:	75 14                	jne    300010d6 <strtol+0x46>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:104
		neg = 1;
300010c2:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:105
		c = *s++;
300010c9:	89 f0                	mov    eax,esi
300010cb:	8d 70 01             	lea    esi,[eax+0x1]
300010ce:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300010d1:	0f be d8             	movsx  ebx,al
300010d4:	eb 10                	jmp    300010e6 <strtol+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:106
	} else if (c == '+')
300010d6:	83 fb 2b             	cmp    ebx,0x2b
300010d9:	75 0b                	jne    300010e6 <strtol+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:107
		c = *s++;
300010db:	89 f0                	mov    eax,esi
300010dd:	8d 70 01             	lea    esi,[eax+0x1]
300010e0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300010e3:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108
	if ((base == 0 || base == 16) &&
300010e6:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
300010ea:	74 06                	je     300010f2 <strtol+0x62>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108 (discriminator 2)
300010ec:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
300010f0:	75 26                	jne    30001118 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108 (discriminator 3)
300010f2:	83 fb 30             	cmp    ebx,0x30
300010f5:	75 21                	jne    30001118 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:109
	    c == '0' && (*s == 'x' || *s == 'X')) {
300010f7:	0f b6 06             	movzx  eax,BYTE PTR [esi]
300010fa:	3c 78                	cmp    al,0x78
300010fc:	74 07                	je     30001105 <strtol+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:109 (discriminator 1)
300010fe:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30001101:	3c 58                	cmp    al,0x58
30001103:	75 13                	jne    30001118 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:110
		c = s[1];
30001105:	8d 46 01             	lea    eax,[esi+0x1]
30001108:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000110b:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:111
		s += 2;
3000110e:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:112
		base = 16;
30001111:	c7 45 10 10 00 00 00 	mov    DWORD PTR [ebp+0x10],0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:114
	}
	if (base == 0)
30001118:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
3000111c:	75 14                	jne    30001132 <strtol+0xa2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115
		base = c == '0' ? 8 : 10;
3000111e:	83 fb 30             	cmp    ebx,0x30
30001121:	75 07                	jne    3000112a <strtol+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 1)
30001123:	b8 08 00 00 00       	mov    eax,0x8
30001128:	eb 05                	jmp    3000112f <strtol+0x9f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 2)
3000112a:	b8 0a 00 00 00       	mov    eax,0xa
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 4)
3000112f:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134
	 * the number is too big, and we will return a range error.
	 *
	 * Set any if any `digits' consumed; make it negative to indicate
	 * overflow.
	 */
	cutoff = neg ? -(unsigned long)LONG_MIN : LONG_MAX;
30001132:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30001136:	74 07                	je     3000113f <strtol+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134 (discriminator 1)
30001138:	b8 00 00 00 80       	mov    eax,0x80000000
3000113d:	eb 05                	jmp    30001144 <strtol+0xb4>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134 (discriminator 2)
3000113f:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:135 (discriminator 4)
	cutlim = cutoff % (unsigned long)base;
30001144:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30001147:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
3000114a:	ba 00 00 00 00       	mov    edx,0x0
3000114f:	f7 f1                	div    ecx
30001151:	89 d1                	mov    ecx,edx
30001153:	89 c8                	mov    eax,ecx
30001155:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:136 (discriminator 4)
	cutoff /= (unsigned long)base;
30001158:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
3000115b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
3000115e:	ba 00 00 00 00       	mov    edx,0x0
30001163:	f7 f7                	div    edi
30001165:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:137 (discriminator 4)
	for (acc = 0, any = 0;; c = *s++) {
30001168:	bf 00 00 00 00       	mov    edi,0x0
3000116d:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:138
		if (ISDIGIT(c))
30001172:	8d 43 d0             	lea    eax,[ebx-0x30]
30001175:	83 f8 09             	cmp    eax,0x9
30001178:	77 05                	ja     3000117f <strtol+0xef>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:139
			c -= '0';
3000117a:	83 eb 30             	sub    ebx,0x30
3000117d:	eb 25                	jmp    300011a4 <strtol+0x114>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:140
		else if (ISALPHA(c))
3000117f:	89 d8                	mov    eax,ebx
30001181:	83 c8 20             	or     eax,0x20
30001184:	83 e8 61             	sub    eax,0x61
30001187:	83 f8 19             	cmp    eax,0x19
3000118a:	77 55                	ja     300011e1 <strtol+0x151>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
3000118c:	83 fb 40             	cmp    ebx,0x40
3000118f:	7e 0c                	jle    3000119d <strtol+0x10d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 1)
30001191:	83 fb 5a             	cmp    ebx,0x5a
30001194:	7f 07                	jg     3000119d <strtol+0x10d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 3)
30001196:	b8 37 00 00 00       	mov    eax,0x37
3000119b:	eb 05                	jmp    300011a2 <strtol+0x112>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 4)
3000119d:	b8 57 00 00 00       	mov    eax,0x57
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 6)
300011a2:	29 c3                	sub    ebx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:144
		else
			break;
		if (c >= base)
300011a4:	3b 5d 10             	cmp    ebx,DWORD PTR [ebp+0x10]
300011a7:	7d 3b                	jge    300011e4 <strtol+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146
			break;
		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
300011a9:	89 c8                	mov    eax,ecx
300011ab:	85 c0                	test   eax,eax
300011ad:	78 0f                	js     300011be <strtol+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 1)
300011af:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
300011b2:	77 0a                	ja     300011be <strtol+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 2)
300011b4:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
300011b7:	75 0c                	jne    300011c5 <strtol+0x135>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 3)
300011b9:	3b 5d e8             	cmp    ebx,DWORD PTR [ebp-0x18]
300011bc:	7e 07                	jle    300011c5 <strtol+0x135>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:147
			any = -1;
300011be:	b9 ff ff ff ff       	mov    ecx,0xffffffff
300011c3:	eb 0f                	jmp    300011d4 <strtol+0x144>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:149
		else {
			any = 1;
300011c5:	b9 01 00 00 00       	mov    ecx,0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:150
			acc *= base;
300011ca:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300011cd:	0f af f8             	imul   edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:151
			acc += c;
300011d0:	89 d8                	mov    eax,ebx
300011d2:	01 c7                	add    edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:137
	 * overflow.
	 */
	cutoff = neg ? -(unsigned long)LONG_MIN : LONG_MAX;
	cutlim = cutoff % (unsigned long)base;
	cutoff /= (unsigned long)base;
	for (acc = 0, any = 0;; c = *s++) {
300011d4:	89 f0                	mov    eax,esi
300011d6:	8d 70 01             	lea    esi,[eax+0x1]
300011d9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300011dc:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:153
		else {
			any = 1;
			acc *= base;
			acc += c;
		}
	}
300011df:	eb 91                	jmp    30001172 <strtol+0xe2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:143
		if (ISDIGIT(c))
			c -= '0';
		else if (ISALPHA(c))
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
		else
			break;
300011e1:	90                   	nop
300011e2:	eb 01                	jmp    300011e5 <strtol+0x155>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:145
		if (c >= base)
			break;
300011e4:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:154
			any = 1;
			acc *= base;
			acc += c;
		}
	}
	if (any < 0) {
300011e5:	89 c8                	mov    eax,ecx
300011e7:	85 c0                	test   eax,eax
300011e9:	79 16                	jns    30001201 <strtol+0x171>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155
		acc = neg ? LONG_MIN : LONG_MAX;
300011eb:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
300011ef:	74 07                	je     300011f8 <strtol+0x168>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 1)
300011f1:	b8 00 00 00 80       	mov    eax,0x80000000
300011f6:	eb 05                	jmp    300011fd <strtol+0x16d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 2)
300011f8:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 4)
300011fd:	89 c7                	mov    edi,eax
300011ff:	eb 08                	jmp    30001209 <strtol+0x179>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:156
	} else if (neg)
30001201:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30001205:	74 02                	je     30001209 <strtol+0x179>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:157
		acc = -acc;
30001207:	f7 df                	neg    edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:158
	if (endptr != 0)
30001209:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
3000120d:	74 13                	je     30001222 <strtol+0x192>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159
		*endptr = (char *) (any ? s - 1 : nptr);
3000120f:	89 c8                	mov    eax,ecx
30001211:	85 c0                	test   eax,eax
30001213:	74 05                	je     3000121a <strtol+0x18a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 1)
30001215:	8d 46 ff             	lea    eax,[esi-0x1]
30001218:	eb 03                	jmp    3000121d <strtol+0x18d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 2)
3000121a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 4)
3000121d:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001220:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:160
	return (acc);
30001222:	89 f8                	mov    eax,edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:161
}
30001224:	83 c4 0c             	add    esp,0xc
30001227:	5b                   	pop    ebx
30001228:	5e                   	pop    esi
30001229:	5f                   	pop    edi
3000122a:	5d                   	pop    ebp
3000122b:	c3                   	ret    

3000122c <strtrim>:
strtrim():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:5
#include "strings.h"

/*FROM: http://codereview.stackexchange.com/questions/20897/trim-function-in-c*/
__attribute__((visibility("default"))) char * strtrim(char * *pointerToString)
{
3000122c:	55                   	push   ebp
3000122d:	89 e5                	mov    ebp,esp
3000122f:	53                   	push   ebx
30001230:	83 ec 14             	sub    esp,0x14
30001233:	e8 b8 0d 00 00       	call   30001ff0 <__x86.get_pc_thunk.bx>
30001238:	81 c3 40 22 00 00    	add    ebx,0x2240
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:6
    uint8_t start=0, length=0;
3000123e:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
30001242:	c6 45 f5 00          	mov    BYTE PTR [ebp-0xb],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:9

        // Trim.Start:
        length = strlen(*pointerToString);
30001246:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001249:	8b 00                	mov    eax,DWORD PTR [eax]
3000124b:	83 ec 0c             	sub    esp,0xc
3000124e:	50                   	push   eax
3000124f:	e8 8c 0d 00 00       	call   30001fe0 <__x86.get_pc_thunk.ax+0x4a>
30001254:	83 c4 10             	add    esp,0x10
30001257:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10
        while ((*pointerToString)[start]==' ') start++;
3000125a:	eb 0a                	jmp    30001266 <strtrim+0x3a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10 (discriminator 2)
3000125c:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001260:	83 c0 01             	add    eax,0x1
30001263:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10 (discriminator 1)
30001266:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001269:	8b 10                	mov    edx,DWORD PTR [eax]
3000126b:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
3000126f:	01 d0                	add    eax,edx
30001271:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001274:	3c 20                	cmp    al,0x20
30001276:	74 e4                	je     3000125c <strtrim+0x30>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:11
        (*pointerToString) += start;
30001278:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000127b:	8b 10                	mov    edx,DWORD PTR [eax]
3000127d:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001281:	01 c2                	add    edx,eax
30001283:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001286:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:13

        if (start < length) // Required for empty (ex. "    ") input
30001288:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
3000128c:	3a 45 f5             	cmp    al,BYTE PTR [ebp-0xb]
3000128f:	73 46                	jae    300012d7 <strtrim+0xab>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:16
        {
            // Trim.End:
            uint8_t end = strlen(*pointerToString)-1; // Get string length again (after Trim.Start)
30001291:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001294:	8b 00                	mov    eax,DWORD PTR [eax]
30001296:	83 ec 0c             	sub    esp,0xc
30001299:	50                   	push   eax
3000129a:	e8 41 0d 00 00       	call   30001fe0 <__x86.get_pc_thunk.ax+0x4a>
3000129f:	83 c4 10             	add    esp,0x10
300012a2:	83 e8 01             	sub    eax,0x1
300012a5:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:17
            while ((*pointerToString)[end]==' ') end--;
300012a8:	eb 0a                	jmp    300012b4 <strtrim+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:17 (discriminator 2)
300012aa:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
300012ae:	83 e8 01             	sub    eax,0x1
300012b1:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:17 (discriminator 1)
300012b4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300012b7:	8b 10                	mov    edx,DWORD PTR [eax]
300012b9:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
300012bd:	01 d0                	add    eax,edx
300012bf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300012c2:	3c 20                	cmp    al,0x20
300012c4:	74 e4                	je     300012aa <strtrim+0x7e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:18
            (*pointerToString)[end+1] = 0;
300012c6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300012c9:	8b 00                	mov    eax,DWORD PTR [eax]
300012cb:	0f b6 55 f6          	movzx  edx,BYTE PTR [ebp-0xa]
300012cf:	83 c2 01             	add    edx,0x1
300012d2:	01 d0                	add    eax,edx
300012d4:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:21
        }

    return *pointerToString;
300012d7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300012da:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:22
}
300012dc:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300012df:	c9                   	leave  
300012e0:	c3                   	ret    

300012e1 <strtrim2>:
strtrim2():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:25

__attribute__((visibility("default"))) char * strtrim2(char* pointerToString)
{
300012e1:	55                   	push   ebp
300012e2:	89 e5                	mov    ebp,esp
300012e4:	53                   	push   ebx
300012e5:	83 ec 14             	sub    esp,0x14
300012e8:	e8 03 0d 00 00       	call   30001ff0 <__x86.get_pc_thunk.bx>
300012ed:	81 c3 8b 21 00 00    	add    ebx,0x218b
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:26
    uint8_t start=0, length=0;
300012f3:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
300012f7:	c6 45 f5 00          	mov    BYTE PTR [ebp-0xb],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:29

        // Trim.Start:
        length = strlen(pointerToString);
300012fb:	83 ec 0c             	sub    esp,0xc
300012fe:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30001301:	e8 da 0c 00 00       	call   30001fe0 <__x86.get_pc_thunk.ax+0x4a>
30001306:	83 c4 10             	add    esp,0x10
30001309:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:30
        while ((pointerToString)[start]==' ') start++;
3000130c:	eb 0a                	jmp    30001318 <strtrim2+0x37>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:30 (discriminator 2)
3000130e:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001312:	83 c0 01             	add    eax,0x1
30001315:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:30 (discriminator 1)
30001318:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
3000131c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000131f:	01 d0                	add    eax,edx
30001321:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001324:	3c 20                	cmp    al,0x20
30001326:	74 e6                	je     3000130e <strtrim2+0x2d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:31
        (pointerToString) += start;
30001328:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
3000132c:	01 45 08             	add    DWORD PTR [ebp+0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:33

        if (start < length) // Required for empty (ex. "    ") input
3000132f:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001333:	3a 45 f5             	cmp    al,BYTE PTR [ebp-0xb]
30001336:	73 3f                	jae    30001377 <strtrim2+0x96>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:36
        {
            // Trim.End:
            uint8_t end = strlen(pointerToString)-1; // Get string length again (after Trim.Start)
30001338:	83 ec 0c             	sub    esp,0xc
3000133b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
3000133e:	e8 9d 0c 00 00       	call   30001fe0 <__x86.get_pc_thunk.ax+0x4a>
30001343:	83 c4 10             	add    esp,0x10
30001346:	83 e8 01             	sub    eax,0x1
30001349:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:37
            while ((pointerToString)[end]==' ') end--;
3000134c:	eb 0a                	jmp    30001358 <strtrim2+0x77>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:37 (discriminator 2)
3000134e:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30001352:	83 e8 01             	sub    eax,0x1
30001355:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:37 (discriminator 1)
30001358:	0f b6 55 f6          	movzx  edx,BYTE PTR [ebp-0xa]
3000135c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000135f:	01 d0                	add    eax,edx
30001361:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001364:	3c 20                	cmp    al,0x20
30001366:	74 e6                	je     3000134e <strtrim2+0x6d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:38
            (pointerToString)[end+1] = 0;
30001368:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
3000136c:	8d 50 01             	lea    edx,[eax+0x1]
3000136f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001372:	01 d0                	add    eax,edx
30001374:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:41
        }

    return pointerToString;
30001377:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:42
}
3000137a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
3000137d:	c9                   	leave  
3000137e:	c3                   	ret    
3000137f:	90                   	nop

30001380 <time>:
time():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:47
  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
  {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
};

VISIBLE time_t time(/*time_t* arg*/)
{
30001380:	55                   	push   ebp
30001381:	89 e5                	mov    ebp,esp
30001383:	83 ec 10             	sub    esp,0x10
30001386:	e8 0b 0c 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
3000138b:	05 ed 20 00 00       	add    eax,0x20ed
/home/yogi/src/os/aproj/libChrisOS/src/time.c:48
    uint32_t retVal=0;
30001390:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49
    __asm__("call sysEnter_Vector\n":"=a" (retVal):"a" (SYSCALL_GETTICKS));
30001397:	b8 70 01 00 00       	mov    eax,0x170
3000139c:	e8 fc ff ff ff       	call   3000139d <time+0x1d>
300013a1:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50
    return (time_t)retVal;
300013a4:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:51
}
300013a7:	c9                   	leave  
300013a8:	c3                   	ret    

300013a9 <gmtime_r>:
gmtime_r():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:54


VISIBLE struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
300013a9:	55                   	push   ebp
300013aa:	89 e5                	mov    ebp,esp
300013ac:	53                   	push   ebx
300013ad:	83 ec 10             	sub    esp,0x10
300013b0:	e8 3b 0c 00 00       	call   30001ff0 <__x86.get_pc_thunk.bx>
300013b5:	81 c3 c3 20 00 00    	add    ebx,0x20c3
/home/yogi/src/os/aproj/libChrisOS/src/time.c:55
  time_t time = *timer;
300013bb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300013be:	8b 00                	mov    eax,DWORD PTR [eax]
300013c0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:57
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;
300013c3:	c7 45 f4 b2 07 00 00 	mov    DWORD PTR [ebp-0xc],0x7b2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:59

  dayclock = (unsigned long) time % SECS_DAY;
300013ca:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
300013cd:	ba 07 45 2e c2       	mov    edx,0xc22e4507
300013d2:	89 c8                	mov    eax,ecx
300013d4:	f7 e2                	mul    edx
300013d6:	89 d0                	mov    eax,edx
300013d8:	c1 e8 10             	shr    eax,0x10
300013db:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
300013de:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
300013e1:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
300013e7:	29 c1                	sub    ecx,eax
300013e9:	89 c8                	mov    eax,ecx
300013eb:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:60
  dayno = (unsigned long) time / SECS_DAY;
300013ee:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
300013f1:	ba 07 45 2e c2       	mov    edx,0xc22e4507
300013f6:	f7 e2                	mul    edx
300013f8:	89 d0                	mov    eax,edx
300013fa:	c1 e8 10             	shr    eax,0x10
300013fd:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:62

  tmbuf->tm_sec = dayclock % 60;
30001400:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
30001403:	ba 89 88 88 88       	mov    edx,0x88888889
30001408:	89 c8                	mov    eax,ecx
3000140a:	f7 e2                	mul    edx
3000140c:	89 d0                	mov    eax,edx
3000140e:	c1 e8 05             	shr    eax,0x5
30001411:	89 c2                	mov    edx,eax
30001413:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
3000141a:	89 c2                	mov    edx,eax
3000141c:	89 d0                	mov    eax,edx
3000141e:	c1 e0 04             	shl    eax,0x4
30001421:	29 d0                	sub    eax,edx
30001423:	29 c1                	sub    ecx,eax
30001425:	89 c8                	mov    eax,ecx
30001427:	89 c2                	mov    edx,eax
30001429:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000142c:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:63
  tmbuf->tm_min = (dayclock % 3600) / 60;
3000142e:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
30001431:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
30001436:	89 c8                	mov    eax,ecx
30001438:	f7 e2                	mul    edx
3000143a:	89 d0                	mov    eax,edx
3000143c:	c1 e8 0b             	shr    eax,0xb
3000143f:	69 c0 10 0e 00 00    	imul   eax,eax,0xe10
30001445:	29 c1                	sub    ecx,eax
30001447:	89 c8                	mov    eax,ecx
30001449:	ba 89 88 88 88       	mov    edx,0x88888889
3000144e:	f7 e2                	mul    edx
30001450:	89 d0                	mov    eax,edx
30001452:	c1 e8 05             	shr    eax,0x5
30001455:	89 c2                	mov    edx,eax
30001457:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000145a:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:64
  tmbuf->tm_hour = dayclock / 3600;
3000145d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001460:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
30001465:	f7 e2                	mul    edx
30001467:	89 d0                	mov    eax,edx
30001469:	c1 e8 0b             	shr    eax,0xb
3000146c:	89 c2                	mov    edx,eax
3000146e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001471:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:65
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
30001474:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30001477:	8d 48 04             	lea    ecx,[eax+0x4]
3000147a:	ba 25 49 92 24       	mov    edx,0x24924925
3000147f:	89 c8                	mov    eax,ecx
30001481:	f7 e2                	mul    edx
30001483:	89 c8                	mov    eax,ecx
30001485:	29 d0                	sub    eax,edx
30001487:	d1 e8                	shr    eax,1
30001489:	01 d0                	add    eax,edx
3000148b:	c1 e8 02             	shr    eax,0x2
3000148e:	89 c2                	mov    edx,eax
30001490:	c1 e2 03             	shl    edx,0x3
30001493:	29 c2                	sub    edx,eax
30001495:	89 c8                	mov    eax,ecx
30001497:	29 d0                	sub    eax,edx
30001499:	89 c2                	mov    edx,eax
3000149b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000149e:	89 50 18             	mov    DWORD PTR [eax+0x18],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66
  while (dayno >= (unsigned long) YEARSIZE(year)) {
300014a1:	eb 66                	jmp    30001509 <gmtime_r+0x160>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67
    dayno -= YEARSIZE(year);
300014a3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300014a6:	83 e0 03             	and    eax,0x3
300014a9:	85 c0                	test   eax,eax
300014ab:	75 50                	jne    300014fd <gmtime_r+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 1)
300014ad:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300014b0:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300014b5:	89 c8                	mov    eax,ecx
300014b7:	f7 ea                	imul   edx
300014b9:	c1 fa 05             	sar    edx,0x5
300014bc:	89 c8                	mov    eax,ecx
300014be:	c1 f8 1f             	sar    eax,0x1f
300014c1:	29 c2                	sub    edx,eax
300014c3:	89 d0                	mov    eax,edx
300014c5:	6b c0 64             	imul   eax,eax,0x64
300014c8:	29 c1                	sub    ecx,eax
300014ca:	89 c8                	mov    eax,ecx
300014cc:	85 c0                	test   eax,eax
300014ce:	75 26                	jne    300014f6 <gmtime_r+0x14d>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 4)
300014d0:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300014d3:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300014d8:	89 c8                	mov    eax,ecx
300014da:	f7 ea                	imul   edx
300014dc:	c1 fa 07             	sar    edx,0x7
300014df:	89 c8                	mov    eax,ecx
300014e1:	c1 f8 1f             	sar    eax,0x1f
300014e4:	29 c2                	sub    edx,eax
300014e6:	89 d0                	mov    eax,edx
300014e8:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300014ee:	29 c1                	sub    ecx,eax
300014f0:	89 c8                	mov    eax,ecx
300014f2:	85 c0                	test   eax,eax
300014f4:	75 07                	jne    300014fd <gmtime_r+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 5)
300014f6:	b8 6e 01 00 00       	mov    eax,0x16e
300014fb:	eb 05                	jmp    30001502 <gmtime_r+0x159>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 6)
300014fd:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 8)
30001502:	29 45 f8             	sub    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:68 (discriminator 8)
    year++;
30001505:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
30001509:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000150c:	83 e0 03             	and    eax,0x3
3000150f:	85 c0                	test   eax,eax
30001511:	75 50                	jne    30001563 <gmtime_r+0x1ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 1)
30001513:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001516:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000151b:	89 c8                	mov    eax,ecx
3000151d:	f7 ea                	imul   edx
3000151f:	c1 fa 05             	sar    edx,0x5
30001522:	89 c8                	mov    eax,ecx
30001524:	c1 f8 1f             	sar    eax,0x1f
30001527:	29 c2                	sub    edx,eax
30001529:	89 d0                	mov    eax,edx
3000152b:	6b c0 64             	imul   eax,eax,0x64
3000152e:	29 c1                	sub    ecx,eax
30001530:	89 c8                	mov    eax,ecx
30001532:	85 c0                	test   eax,eax
30001534:	75 26                	jne    3000155c <gmtime_r+0x1b3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 4)
30001536:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001539:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000153e:	89 c8                	mov    eax,ecx
30001540:	f7 ea                	imul   edx
30001542:	c1 fa 07             	sar    edx,0x7
30001545:	89 c8                	mov    eax,ecx
30001547:	c1 f8 1f             	sar    eax,0x1f
3000154a:	29 c2                	sub    edx,eax
3000154c:	89 d0                	mov    eax,edx
3000154e:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001554:	29 c1                	sub    ecx,eax
30001556:	89 c8                	mov    eax,ecx
30001558:	85 c0                	test   eax,eax
3000155a:	75 07                	jne    30001563 <gmtime_r+0x1ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 5)
3000155c:	b8 6e 01 00 00       	mov    eax,0x16e
30001561:	eb 05                	jmp    30001568 <gmtime_r+0x1bf>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 6)
30001563:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 8)
30001568:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
3000156b:	0f 86 32 ff ff ff    	jbe    300014a3 <gmtime_r+0xfa>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:70
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
30001571:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001574:	8d 90 94 f8 ff ff    	lea    edx,[eax-0x76c]
3000157a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000157d:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:71
  tmbuf->tm_yday = dayno;
30001580:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30001583:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001586:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:72
  tmbuf->tm_mon = 0;
30001589:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000158c:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
30001593:	e9 89 00 00 00       	jmp    30001621 <gmtime_r+0x278>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
30001598:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000159b:	83 e0 03             	and    eax,0x3
3000159e:	85 c0                	test   eax,eax
300015a0:	75 50                	jne    300015f2 <gmtime_r+0x249>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 1)
300015a2:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300015a5:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300015aa:	89 c8                	mov    eax,ecx
300015ac:	f7 ea                	imul   edx
300015ae:	c1 fa 05             	sar    edx,0x5
300015b1:	89 c8                	mov    eax,ecx
300015b3:	c1 f8 1f             	sar    eax,0x1f
300015b6:	29 c2                	sub    edx,eax
300015b8:	89 d0                	mov    eax,edx
300015ba:	6b c0 64             	imul   eax,eax,0x64
300015bd:	29 c1                	sub    ecx,eax
300015bf:	89 c8                	mov    eax,ecx
300015c1:	85 c0                	test   eax,eax
300015c3:	75 26                	jne    300015eb <gmtime_r+0x242>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 4)
300015c5:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300015c8:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300015cd:	89 c8                	mov    eax,ecx
300015cf:	f7 ea                	imul   edx
300015d1:	c1 fa 07             	sar    edx,0x7
300015d4:	89 c8                	mov    eax,ecx
300015d6:	c1 f8 1f             	sar    eax,0x1f
300015d9:	29 c2                	sub    edx,eax
300015db:	89 d0                	mov    eax,edx
300015dd:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300015e3:	29 c1                	sub    ecx,eax
300015e5:	89 c8                	mov    eax,ecx
300015e7:	85 c0                	test   eax,eax
300015e9:	75 07                	jne    300015f2 <gmtime_r+0x249>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 5)
300015eb:	ba 01 00 00 00       	mov    edx,0x1
300015f0:	eb 05                	jmp    300015f7 <gmtime_r+0x24e>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 6)
300015f2:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 8)
300015f7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300015fa:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
300015fd:	89 d0                	mov    eax,edx
300015ff:	01 c0                	add    eax,eax
30001601:	01 d0                	add    eax,edx
30001603:	c1 e0 02             	shl    eax,0x2
30001606:	01 c8                	add    eax,ecx
30001608:	8b 84 83 88 fc ff ff 	mov    eax,DWORD PTR [ebx+eax*4-0x378]
3000160f:	29 45 f8             	sub    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:75 (discriminator 8)
    tmbuf->tm_mon++;
30001612:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001615:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001618:	8d 50 01             	lea    edx,[eax+0x1]
3000161b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000161e:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
30001621:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001624:	83 e0 03             	and    eax,0x3
30001627:	85 c0                	test   eax,eax
30001629:	75 50                	jne    3000167b <gmtime_r+0x2d2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 1)
3000162b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
3000162e:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001633:	89 c8                	mov    eax,ecx
30001635:	f7 ea                	imul   edx
30001637:	c1 fa 05             	sar    edx,0x5
3000163a:	89 c8                	mov    eax,ecx
3000163c:	c1 f8 1f             	sar    eax,0x1f
3000163f:	29 c2                	sub    edx,eax
30001641:	89 d0                	mov    eax,edx
30001643:	6b c0 64             	imul   eax,eax,0x64
30001646:	29 c1                	sub    ecx,eax
30001648:	89 c8                	mov    eax,ecx
3000164a:	85 c0                	test   eax,eax
3000164c:	75 26                	jne    30001674 <gmtime_r+0x2cb>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 4)
3000164e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001651:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001656:	89 c8                	mov    eax,ecx
30001658:	f7 ea                	imul   edx
3000165a:	c1 fa 07             	sar    edx,0x7
3000165d:	89 c8                	mov    eax,ecx
3000165f:	c1 f8 1f             	sar    eax,0x1f
30001662:	29 c2                	sub    edx,eax
30001664:	89 d0                	mov    eax,edx
30001666:	69 c0 90 01 00 00    	imul   eax,eax,0x190
3000166c:	29 c1                	sub    ecx,eax
3000166e:	89 c8                	mov    eax,ecx
30001670:	85 c0                	test   eax,eax
30001672:	75 07                	jne    3000167b <gmtime_r+0x2d2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 5)
30001674:	ba 01 00 00 00       	mov    edx,0x1
30001679:	eb 05                	jmp    30001680 <gmtime_r+0x2d7>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 6)
3000167b:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 8)
30001680:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001683:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
30001686:	89 d0                	mov    eax,edx
30001688:	01 c0                	add    eax,eax
3000168a:	01 d0                	add    eax,edx
3000168c:	c1 e0 02             	shl    eax,0x2
3000168f:	01 c8                	add    eax,ecx
30001691:	8b 84 83 88 fc ff ff 	mov    eax,DWORD PTR [ebx+eax*4-0x378]
30001698:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
3000169b:	0f 86 f7 fe ff ff    	jbe    30001598 <gmtime_r+0x1ef>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:77
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
300016a1:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
300016a4:	83 c0 01             	add    eax,0x1
300016a7:	89 c2                	mov    edx,eax
300016a9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300016ac:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:78
  tmbuf->tm_isdst = 0;
300016af:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300016b2:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:79
  return tmbuf;
300016b9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:80
}
300016bc:	83 c4 10             	add    esp,0x10
300016bf:	5b                   	pop    ebx
300016c0:	5d                   	pop    ebp
300016c1:	c3                   	ret    

300016c2 <localtime>:
localtime():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:82

VISIBLE struct tm *localtime(const time_t *timer) {
300016c2:	55                   	push   ebp
300016c3:	89 e5                	mov    ebp,esp
300016c5:	53                   	push   ebx
300016c6:	83 ec 34             	sub    esp,0x34
300016c9:	e8 c8 08 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
300016ce:	05 aa 1d 00 00       	add    eax,0x1daa
/home/yogi/src/os/aproj/libChrisOS/src/time.c:86
  time_t t;
  struct tm tmbuf;
  
  t = *timer - libcTZ;
300016d3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
300016d6:	8b 0a                	mov    ecx,DWORD PTR [edx]
300016d8:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
300016de:	8b 12                	mov    edx,DWORD PTR [edx]
300016e0:	29 d1                	sub    ecx,edx
300016e2:	89 ca                	mov    edx,ecx
300016e4:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:87
  return gmtime_r(&t, &tmbuf);
300016e7:	83 ec 08             	sub    esp,0x8
300016ea:	8d 55 c8             	lea    edx,[ebp-0x38]
300016ed:	52                   	push   edx
300016ee:	8d 55 f4             	lea    edx,[ebp-0xc]
300016f1:	52                   	push   edx
300016f2:	89 c3                	mov    ebx,eax
300016f4:	e8 d7 08 00 00       	call   30001fd0 <__x86.get_pc_thunk.ax+0x3a>
300016f9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:88
}
300016fc:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300016ff:	c9                   	leave  
30001700:	c3                   	ret    

30001701 <localtime_r>:
localtime_r():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:90

VISIBLE struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
30001701:	55                   	push   ebp
30001702:	89 e5                	mov    ebp,esp
30001704:	53                   	push   ebx
30001705:	83 ec 14             	sub    esp,0x14
30001708:	e8 89 08 00 00       	call   30001f96 <__x86.get_pc_thunk.ax>
3000170d:	05 6b 1d 00 00       	add    eax,0x1d6b
/home/yogi/src/os/aproj/libChrisOS/src/time.c:93
  time_t t;

  t = *timer - libcTZ;
30001712:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001715:	8b 0a                	mov    ecx,DWORD PTR [edx]
30001717:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
3000171d:	8b 12                	mov    edx,DWORD PTR [edx]
3000171f:	29 d1                	sub    ecx,edx
30001721:	89 ca                	mov    edx,ecx
30001723:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:94
  return gmtime_r(&t, tmbuf);
30001726:	83 ec 08             	sub    esp,0x8
30001729:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
3000172c:	8d 55 f4             	lea    edx,[ebp-0xc]
3000172f:	52                   	push   edx
30001730:	89 c3                	mov    ebx,eax
30001732:	e8 99 08 00 00       	call   30001fd0 <__x86.get_pc_thunk.ax+0x3a>
30001737:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:95
}
3000173a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
3000173d:	c9                   	leave  
3000173e:	c3                   	ret    

3000173f <mktime>:
mktime():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:97

VISIBLE time_t mktime(struct tm *tmbuf) {
3000173f:	55                   	push   ebp
30001740:	89 e5                	mov    ebp,esp
30001742:	57                   	push   edi
30001743:	56                   	push   esi
30001744:	53                   	push   ebx
30001745:	83 ec 20             	sub    esp,0x20
30001748:	e8 ab 08 00 00       	call   30001ff8 <__x86.get_pc_thunk.cx>
3000174d:	81 c1 2b 1d 00 00    	add    ecx,0x1d2b
/home/yogi/src/os/aproj/libChrisOS/src/time.c:105
  int yday, month;
  long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
30001753:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001756:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
30001759:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000175c:	8b 18                	mov    ebx,DWORD PTR [eax]
3000175e:	ba 89 88 88 88       	mov    edx,0x88888889
30001763:	89 d8                	mov    eax,ebx
30001765:	f7 ea                	imul   edx
30001767:	8d 04 1a             	lea    eax,[edx+ebx*1]
3000176a:	c1 f8 05             	sar    eax,0x5
3000176d:	89 c2                	mov    edx,eax
3000176f:	89 d8                	mov    eax,ebx
30001771:	c1 f8 1f             	sar    eax,0x1f
30001774:	29 c2                	sub    edx,eax
30001776:	89 d0                	mov    eax,edx
30001778:	8d 14 06             	lea    edx,[esi+eax*1]
3000177b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000177e:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:106
  tmbuf->tm_sec %= 60;
30001781:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001784:	8b 18                	mov    ebx,DWORD PTR [eax]
30001786:	ba 89 88 88 88       	mov    edx,0x88888889
3000178b:	89 d8                	mov    eax,ebx
3000178d:	f7 ea                	imul   edx
3000178f:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001792:	c1 f8 05             	sar    eax,0x5
30001795:	89 c2                	mov    edx,eax
30001797:	89 d8                	mov    eax,ebx
30001799:	c1 f8 1f             	sar    eax,0x1f
3000179c:	29 c2                	sub    edx,eax
3000179e:	89 d0                	mov    eax,edx
300017a0:	89 c2                	mov    edx,eax
300017a2:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
300017a9:	89 c2                	mov    edx,eax
300017ab:	89 d0                	mov    eax,edx
300017ad:	c1 e0 04             	shl    eax,0x4
300017b0:	29 d0                	sub    eax,edx
300017b2:	29 c3                	sub    ebx,eax
300017b4:	89 d8                	mov    eax,ebx
300017b6:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
300017b9:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:107
  if (tmbuf->tm_sec < 0) {
300017bb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017be:	8b 00                	mov    eax,DWORD PTR [eax]
300017c0:	85 c0                	test   eax,eax
300017c2:	79 1c                	jns    300017e0 <mktime+0xa1>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:108
    tmbuf->tm_sec += 60;
300017c4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017c7:	8b 00                	mov    eax,DWORD PTR [eax]
300017c9:	8d 50 3c             	lea    edx,[eax+0x3c]
300017cc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017cf:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:109
    tmbuf->tm_min--;
300017d1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017d4:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
300017d7:	8d 50 ff             	lea    edx,[eax-0x1]
300017da:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017dd:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
300017e0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017e3:	8b 70 08             	mov    esi,DWORD PTR [eax+0x8]
300017e6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017e9:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
300017ec:	ba 89 88 88 88       	mov    edx,0x88888889
300017f1:	89 d8                	mov    eax,ebx
300017f3:	f7 ea                	imul   edx
300017f5:	8d 04 1a             	lea    eax,[edx+ebx*1]
300017f8:	c1 f8 05             	sar    eax,0x5
300017fb:	89 c2                	mov    edx,eax
300017fd:	89 d8                	mov    eax,ebx
300017ff:	c1 f8 1f             	sar    eax,0x1f
30001802:	29 c2                	sub    edx,eax
30001804:	89 d0                	mov    eax,edx
30001806:	8d 14 06             	lea    edx,[esi+eax*1]
30001809:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000180c:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:112
  tmbuf->tm_min = tmbuf->tm_min % 60;
3000180f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001812:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
30001815:	ba 89 88 88 88       	mov    edx,0x88888889
3000181a:	89 d8                	mov    eax,ebx
3000181c:	f7 ea                	imul   edx
3000181e:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001821:	c1 f8 05             	sar    eax,0x5
30001824:	89 c2                	mov    edx,eax
30001826:	89 d8                	mov    eax,ebx
30001828:	c1 f8 1f             	sar    eax,0x1f
3000182b:	29 c2                	sub    edx,eax
3000182d:	89 d0                	mov    eax,edx
3000182f:	89 c2                	mov    edx,eax
30001831:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
30001838:	89 c2                	mov    edx,eax
3000183a:	89 d0                	mov    eax,edx
3000183c:	c1 e0 04             	shl    eax,0x4
3000183f:	29 d0                	sub    eax,edx
30001841:	29 c3                	sub    ebx,eax
30001843:	89 d8                	mov    eax,ebx
30001845:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001848:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113
  if (tmbuf->tm_min < 0) {
3000184b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000184e:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001851:	85 c0                	test   eax,eax
30001853:	79 1e                	jns    30001873 <mktime+0x134>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114
    tmbuf->tm_min += 60;
30001855:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001858:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
3000185b:	8d 50 3c             	lea    edx,[eax+0x3c]
3000185e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001861:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:115
    tmbuf->tm_hour--;
30001864:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001867:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
3000186a:	8d 50 ff             	lea    edx,[eax-0x1]
3000186d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001870:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:117
  }
  day = tmbuf->tm_hour / 24;
30001873:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001876:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
30001879:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
3000187e:	89 d8                	mov    eax,ebx
30001880:	f7 ea                	imul   edx
30001882:	c1 fa 02             	sar    edx,0x2
30001885:	89 d8                	mov    eax,ebx
30001887:	c1 f8 1f             	sar    eax,0x1f
3000188a:	29 c2                	sub    edx,eax
3000188c:	89 d0                	mov    eax,edx
3000188e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:118
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
30001891:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001894:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
30001897:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
3000189c:	89 d8                	mov    eax,ebx
3000189e:	f7 ea                	imul   edx
300018a0:	c1 fa 02             	sar    edx,0x2
300018a3:	89 d8                	mov    eax,ebx
300018a5:	c1 f8 1f             	sar    eax,0x1f
300018a8:	29 c2                	sub    edx,eax
300018aa:	89 d0                	mov    eax,edx
300018ac:	01 c0                	add    eax,eax
300018ae:	01 d0                	add    eax,edx
300018b0:	c1 e0 03             	shl    eax,0x3
300018b3:	29 c3                	sub    ebx,eax
300018b5:	89 da                	mov    edx,ebx
300018b7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018ba:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:119
  if (tmbuf->tm_hour < 0) {
300018bd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018c0:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
300018c3:	85 c0                	test   eax,eax
300018c5:	79 13                	jns    300018da <mktime+0x19b>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:120
    tmbuf->tm_hour += 24;
300018c7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018ca:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
300018cd:	8d 50 18             	lea    edx,[eax+0x18]
300018d0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018d3:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:121
    day--;
300018d6:	83 6d f0 01          	sub    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:123
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
300018da:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018dd:	8b 70 14             	mov    esi,DWORD PTR [eax+0x14]
300018e0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018e3:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
300018e6:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
300018eb:	89 d8                	mov    eax,ebx
300018ed:	f7 ea                	imul   edx
300018ef:	d1 fa                	sar    edx,1
300018f1:	89 d8                	mov    eax,ebx
300018f3:	c1 f8 1f             	sar    eax,0x1f
300018f6:	29 c2                	sub    edx,eax
300018f8:	89 d0                	mov    eax,edx
300018fa:	8d 14 06             	lea    edx,[esi+eax*1]
300018fd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001900:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:124
  tmbuf->tm_mon %= 12;
30001903:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001906:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001909:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
3000190e:	89 d8                	mov    eax,ebx
30001910:	f7 ea                	imul   edx
30001912:	d1 fa                	sar    edx,1
30001914:	89 d8                	mov    eax,ebx
30001916:	c1 f8 1f             	sar    eax,0x1f
30001919:	29 c2                	sub    edx,eax
3000191b:	89 d0                	mov    eax,edx
3000191d:	01 c0                	add    eax,eax
3000191f:	01 d0                	add    eax,edx
30001921:	c1 e0 02             	shl    eax,0x2
30001924:	29 c3                	sub    ebx,eax
30001926:	89 da                	mov    edx,ebx
30001928:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000192b:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:125
  if (tmbuf->tm_mon < 0) {
3000192e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001931:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001934:	85 c0                	test   eax,eax
30001936:	79 1e                	jns    30001956 <mktime+0x217>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:126
    tmbuf->tm_mon += 12;
30001938:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000193b:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
3000193e:	8d 50 0c             	lea    edx,[eax+0xc]
30001941:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001944:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:127
    tmbuf->tm_year--;
30001947:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000194a:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
3000194d:	8d 50 ff             	lea    edx,[eax-0x1]
30001950:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001953:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:129
  }
  day += (tmbuf->tm_mday - 1);
30001956:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001959:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
3000195c:	83 e8 01             	sub    eax,0x1
3000195f:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:130
  while (day < 0) {
30001962:	e9 c1 00 00 00       	jmp    30001a28 <mktime+0x2e9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:131
    if(--tmbuf->tm_mon < 0) {
30001967:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000196a:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
3000196d:	8d 50 ff             	lea    edx,[eax-0x1]
30001970:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001973:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
30001976:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001979:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
3000197c:	85 c0                	test   eax,eax
3000197e:	79 19                	jns    30001999 <mktime+0x25a>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:132
      tmbuf->tm_year--;
30001980:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001983:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001986:	8d 50 ff             	lea    edx,[eax-0x1]
30001989:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000198c:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:133
      tmbuf->tm_mon = 11;
3000198f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001992:	c7 40 10 0b 00 00 00 	mov    DWORD PTR [eax+0x10],0xb
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
30001999:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000199c:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
3000199f:	83 e0 03             	and    eax,0x3
300019a2:	85 c0                	test   eax,eax
300019a4:	75 62                	jne    30001a08 <mktime+0x2c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 1)
300019a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300019a9:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
300019ac:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
300019b2:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300019b7:	89 d8                	mov    eax,ebx
300019b9:	f7 ea                	imul   edx
300019bb:	c1 fa 05             	sar    edx,0x5
300019be:	89 d8                	mov    eax,ebx
300019c0:	c1 f8 1f             	sar    eax,0x1f
300019c3:	29 c2                	sub    edx,eax
300019c5:	89 d0                	mov    eax,edx
300019c7:	6b c0 64             	imul   eax,eax,0x64
300019ca:	29 c3                	sub    ebx,eax
300019cc:	89 d8                	mov    eax,ebx
300019ce:	85 c0                	test   eax,eax
300019d0:	75 2f                	jne    30001a01 <mktime+0x2c2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 4)
300019d2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300019d5:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
300019d8:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
300019de:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300019e3:	89 d8                	mov    eax,ebx
300019e5:	f7 ea                	imul   edx
300019e7:	c1 fa 07             	sar    edx,0x7
300019ea:	89 d8                	mov    eax,ebx
300019ec:	c1 f8 1f             	sar    eax,0x1f
300019ef:	29 c2                	sub    edx,eax
300019f1:	89 d0                	mov    eax,edx
300019f3:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300019f9:	29 c3                	sub    ebx,eax
300019fb:	89 d8                	mov    eax,ebx
300019fd:	85 c0                	test   eax,eax
300019ff:	75 07                	jne    30001a08 <mktime+0x2c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 5)
30001a01:	ba 01 00 00 00       	mov    edx,0x1
30001a06:	eb 05                	jmp    30001a0d <mktime+0x2ce>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 6)
30001a08:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 8)
30001a0d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a10:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001a13:	89 d0                	mov    eax,edx
30001a15:	01 c0                	add    eax,eax
30001a17:	01 d0                	add    eax,edx
30001a19:	c1 e0 02             	shl    eax,0x2
30001a1c:	01 d8                	add    eax,ebx
30001a1e:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
30001a25:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:130
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
30001a28:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30001a2c:	0f 88 35 ff ff ff    	js     30001967 <mktime+0x228>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
30001a32:	e9 c2 00 00 00       	jmp    30001af9 <mktime+0x3ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
30001a37:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a3a:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001a3d:	83 e0 03             	and    eax,0x3
30001a40:	85 c0                	test   eax,eax
30001a42:	75 62                	jne    30001aa6 <mktime+0x367>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 1)
30001a44:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a47:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001a4a:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001a50:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001a55:	89 d8                	mov    eax,ebx
30001a57:	f7 ea                	imul   edx
30001a59:	c1 fa 05             	sar    edx,0x5
30001a5c:	89 d8                	mov    eax,ebx
30001a5e:	c1 f8 1f             	sar    eax,0x1f
30001a61:	29 c2                	sub    edx,eax
30001a63:	89 d0                	mov    eax,edx
30001a65:	6b c0 64             	imul   eax,eax,0x64
30001a68:	29 c3                	sub    ebx,eax
30001a6a:	89 d8                	mov    eax,ebx
30001a6c:	85 c0                	test   eax,eax
30001a6e:	75 2f                	jne    30001a9f <mktime+0x360>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 4)
30001a70:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a73:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001a76:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001a7c:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001a81:	89 d8                	mov    eax,ebx
30001a83:	f7 ea                	imul   edx
30001a85:	c1 fa 07             	sar    edx,0x7
30001a88:	89 d8                	mov    eax,ebx
30001a8a:	c1 f8 1f             	sar    eax,0x1f
30001a8d:	29 c2                	sub    edx,eax
30001a8f:	89 d0                	mov    eax,edx
30001a91:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001a97:	29 c3                	sub    ebx,eax
30001a99:	89 d8                	mov    eax,ebx
30001a9b:	85 c0                	test   eax,eax
30001a9d:	75 07                	jne    30001aa6 <mktime+0x367>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 5)
30001a9f:	ba 01 00 00 00       	mov    edx,0x1
30001aa4:	eb 05                	jmp    30001aab <mktime+0x36c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 6)
30001aa6:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 8)
30001aab:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001aae:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001ab1:	89 d0                	mov    eax,edx
30001ab3:	01 c0                	add    eax,eax
30001ab5:	01 d0                	add    eax,edx
30001ab7:	c1 e0 02             	shl    eax,0x2
30001aba:	01 d8                	add    eax,ebx
30001abc:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
30001ac3:	29 45 f0             	sub    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 8)
    if (++(tmbuf->tm_mon) == 12) {
30001ac6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ac9:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001acc:	8d 50 01             	lea    edx,[eax+0x1]
30001acf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ad2:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
30001ad5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ad8:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001adb:	83 f8 0c             	cmp    eax,0xc
30001ade:	75 19                	jne    30001af9 <mktime+0x3ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:140
      tmbuf->tm_mon = 0;
30001ae0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ae3:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:141
      tmbuf->tm_year++;
30001aea:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001aed:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001af0:	8d 50 01             	lea    edx,[eax+0x1]
30001af3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001af6:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
30001af9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001afc:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001aff:	83 e0 03             	and    eax,0x3
30001b02:	85 c0                	test   eax,eax
30001b04:	75 62                	jne    30001b68 <mktime+0x429>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 1)
30001b06:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b09:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001b0c:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001b12:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001b17:	89 d8                	mov    eax,ebx
30001b19:	f7 ea                	imul   edx
30001b1b:	c1 fa 05             	sar    edx,0x5
30001b1e:	89 d8                	mov    eax,ebx
30001b20:	c1 f8 1f             	sar    eax,0x1f
30001b23:	29 c2                	sub    edx,eax
30001b25:	89 d0                	mov    eax,edx
30001b27:	6b c0 64             	imul   eax,eax,0x64
30001b2a:	29 c3                	sub    ebx,eax
30001b2c:	89 d8                	mov    eax,ebx
30001b2e:	85 c0                	test   eax,eax
30001b30:	75 2f                	jne    30001b61 <mktime+0x422>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 4)
30001b32:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b35:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001b38:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001b3e:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001b43:	89 d8                	mov    eax,ebx
30001b45:	f7 ea                	imul   edx
30001b47:	c1 fa 07             	sar    edx,0x7
30001b4a:	89 d8                	mov    eax,ebx
30001b4c:	c1 f8 1f             	sar    eax,0x1f
30001b4f:	29 c2                	sub    edx,eax
30001b51:	89 d0                	mov    eax,edx
30001b53:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001b59:	29 c3                	sub    ebx,eax
30001b5b:	89 d8                	mov    eax,ebx
30001b5d:	85 c0                	test   eax,eax
30001b5f:	75 07                	jne    30001b68 <mktime+0x429>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 5)
30001b61:	ba 01 00 00 00       	mov    edx,0x1
30001b66:	eb 05                	jmp    30001b6d <mktime+0x42e>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 6)
30001b68:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 8)
30001b6d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b70:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001b73:	89 d0                	mov    eax,edx
30001b75:	01 c0                	add    eax,eax
30001b77:	01 d0                	add    eax,edx
30001b79:	c1 e0 02             	shl    eax,0x2
30001b7c:	01 d8                	add    eax,ebx
30001b7e:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
30001b85:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30001b88:	0f 8e a9 fe ff ff    	jle    30001a37 <mktime+0x2f8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:144
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
30001b8e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001b91:	8d 50 01             	lea    edx,[eax+0x1]
30001b94:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b97:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:145
  year = EPOCH_YR;
30001b9a:	c7 45 dc b2 07 00 00 	mov    DWORD PTR [ebp-0x24],0x7b2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:146
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
30001ba1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ba4:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001ba7:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
30001baa:	81 ea 6c 07 00 00    	sub    edx,0x76c
30001bb0:	39 d0                	cmp    eax,edx
30001bb2:	7d 0a                	jge    30001bbe <mktime+0x47f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:146 (discriminator 1)
30001bb4:	b8 19 fc ff ff       	mov    eax,0xfffffc19
30001bb9:	e9 d0 03 00 00       	jmp    30001f8e <mktime+0x84f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:147
  seconds = 0;
30001bbe:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:148
  day = 0;                      // Means days since day 0 now
30001bc5:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:149
  overflow = 0;
30001bcc:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:156
  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;
30001bd3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001bd6:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001bd9:	05 6c 07 00 00       	add    eax,0x76c
30001bde:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:158

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
30001be1:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001be4:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001be7:	3d 7c c6 59 00       	cmp    eax,0x59c67c
30001bec:	7e 07                	jle    30001bf5 <mktime+0x4b6>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:158 (discriminator 1)
30001bee:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:159
  day = (tm_year - year) * 365;
30001bf5:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001bf8:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001bfb:	69 c0 6d 01 00 00    	imul   eax,eax,0x16d
30001c01:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:160
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
30001c04:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
30001c09:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
30001c0c:	89 c2                	mov    edx,eax
30001c0e:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c11:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001c14:	8d 58 03             	lea    ebx,[eax+0x3]
30001c17:	85 c0                	test   eax,eax
30001c19:	0f 48 c3             	cmovs  eax,ebx
30001c1c:	c1 f8 02             	sar    eax,0x2
30001c1f:	83 c0 01             	add    eax,0x1
30001c22:	39 c2                	cmp    edx,eax
30001c24:	7d 04                	jge    30001c2a <mktime+0x4eb>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:160 (discriminator 1)
30001c26:	83 4d e4 02          	or     DWORD PTR [ebp-0x1c],0x2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
30001c2a:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c2d:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001c30:	8d 50 03             	lea    edx,[eax+0x3]
30001c33:	85 c0                	test   eax,eax
30001c35:	0f 48 c2             	cmovs  eax,edx
30001c38:	c1 f8 02             	sar    eax,0x2
30001c3b:	89 c3                	mov    ebx,eax
30001c3d:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c40:	83 e0 03             	and    eax,0x3
30001c43:	85 c0                	test   eax,eax
30001c45:	74 29                	je     30001c70 <mktime+0x531>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 1)
30001c47:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c4a:	99                   	cdq    
30001c4b:	c1 ea 1e             	shr    edx,0x1e
30001c4e:	01 d0                	add    eax,edx
30001c50:	83 e0 03             	and    eax,0x3
30001c53:	29 d0                	sub    eax,edx
30001c55:	89 c6                	mov    esi,eax
30001c57:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
30001c5a:	99                   	cdq    
30001c5b:	c1 ea 1e             	shr    edx,0x1e
30001c5e:	01 d0                	add    eax,edx
30001c60:	83 e0 03             	and    eax,0x3
30001c63:	29 d0                	sub    eax,edx
30001c65:	39 c6                	cmp    esi,eax
30001c67:	7d 07                	jge    30001c70 <mktime+0x531>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 3)
30001c69:	b8 01 00 00 00       	mov    eax,0x1
30001c6e:	eb 05                	jmp    30001c75 <mktime+0x536>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 4)
30001c70:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 6)
30001c75:	01 d8                	add    eax,ebx
30001c77:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 6)
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
30001c7a:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c7d:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001c80:	89 c3                	mov    ebx,eax
30001c82:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001c87:	89 d8                	mov    eax,ebx
30001c89:	f7 ea                	imul   edx
30001c8b:	c1 fa 05             	sar    edx,0x5
30001c8e:	89 d8                	mov    eax,ebx
30001c90:	c1 f8 1f             	sar    eax,0x1f
30001c93:	89 d7                	mov    edi,edx
30001c95:	29 c7                	sub    edi,eax
30001c97:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001c9a:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001c9f:	89 d8                	mov    eax,ebx
30001ca1:	f7 ea                	imul   edx
30001ca3:	c1 fa 05             	sar    edx,0x5
30001ca6:	89 d8                	mov    eax,ebx
30001ca8:	c1 f8 1f             	sar    eax,0x1f
30001cab:	29 c2                	sub    edx,eax
30001cad:	89 d0                	mov    eax,edx
30001caf:	6b c0 64             	imul   eax,eax,0x64
30001cb2:	29 c3                	sub    ebx,eax
30001cb4:	89 d8                	mov    eax,ebx
30001cb6:	85 c0                	test   eax,eax
30001cb8:	74 49                	je     30001d03 <mktime+0x5c4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 1)
30001cba:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001cbd:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001cc2:	89 d8                	mov    eax,ebx
30001cc4:	f7 ea                	imul   edx
30001cc6:	c1 fa 05             	sar    edx,0x5
30001cc9:	89 d8                	mov    eax,ebx
30001ccb:	c1 f8 1f             	sar    eax,0x1f
30001cce:	89 d6                	mov    esi,edx
30001cd0:	29 c6                	sub    esi,eax
30001cd2:	6b c6 64             	imul   eax,esi,0x64
30001cd5:	89 de                	mov    esi,ebx
30001cd7:	29 c6                	sub    esi,eax
30001cd9:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
30001cdc:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001ce1:	89 d8                	mov    eax,ebx
30001ce3:	f7 ea                	imul   edx
30001ce5:	c1 fa 05             	sar    edx,0x5
30001ce8:	89 d8                	mov    eax,ebx
30001cea:	c1 f8 1f             	sar    eax,0x1f
30001ced:	29 c2                	sub    edx,eax
30001cef:	89 d0                	mov    eax,edx
30001cf1:	6b c0 64             	imul   eax,eax,0x64
30001cf4:	29 c3                	sub    ebx,eax
30001cf6:	89 d8                	mov    eax,ebx
30001cf8:	39 c6                	cmp    esi,eax
30001cfa:	7d 07                	jge    30001d03 <mktime+0x5c4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 3)
30001cfc:	b8 01 00 00 00       	mov    eax,0x1
30001d01:	eb 05                	jmp    30001d08 <mktime+0x5c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 4)
30001d03:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 6)
30001d08:	01 f8                	add    eax,edi
30001d0a:	29 45 f0             	sub    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 6)
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);
30001d0d:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001d10:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001d13:	89 c3                	mov    ebx,eax
30001d15:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d1a:	89 d8                	mov    eax,ebx
30001d1c:	f7 ea                	imul   edx
30001d1e:	c1 fa 07             	sar    edx,0x7
30001d21:	89 d8                	mov    eax,ebx
30001d23:	c1 f8 1f             	sar    eax,0x1f
30001d26:	89 d7                	mov    edi,edx
30001d28:	29 c7                	sub    edi,eax
30001d2a:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001d2d:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d32:	89 d8                	mov    eax,ebx
30001d34:	f7 ea                	imul   edx
30001d36:	c1 fa 07             	sar    edx,0x7
30001d39:	89 d8                	mov    eax,ebx
30001d3b:	c1 f8 1f             	sar    eax,0x1f
30001d3e:	29 c2                	sub    edx,eax
30001d40:	89 d0                	mov    eax,edx
30001d42:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001d48:	29 c3                	sub    ebx,eax
30001d4a:	89 d8                	mov    eax,ebx
30001d4c:	85 c0                	test   eax,eax
30001d4e:	74 4f                	je     30001d9f <mktime+0x660>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 1)
30001d50:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001d53:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d58:	89 d8                	mov    eax,ebx
30001d5a:	f7 ea                	imul   edx
30001d5c:	c1 fa 07             	sar    edx,0x7
30001d5f:	89 d8                	mov    eax,ebx
30001d61:	c1 f8 1f             	sar    eax,0x1f
30001d64:	89 d6                	mov    esi,edx
30001d66:	29 c6                	sub    esi,eax
30001d68:	69 c6 90 01 00 00    	imul   eax,esi,0x190
30001d6e:	89 de                	mov    esi,ebx
30001d70:	29 c6                	sub    esi,eax
30001d72:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
30001d75:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d7a:	89 d8                	mov    eax,ebx
30001d7c:	f7 ea                	imul   edx
30001d7e:	c1 fa 07             	sar    edx,0x7
30001d81:	89 d8                	mov    eax,ebx
30001d83:	c1 f8 1f             	sar    eax,0x1f
30001d86:	29 c2                	sub    edx,eax
30001d88:	89 d0                	mov    eax,edx
30001d8a:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001d90:	29 c3                	sub    ebx,eax
30001d92:	89 d8                	mov    eax,ebx
30001d94:	39 c6                	cmp    esi,eax
30001d96:	7d 07                	jge    30001d9f <mktime+0x660>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 3)
30001d98:	b8 01 00 00 00       	mov    eax,0x1
30001d9d:	eb 05                	jmp    30001da4 <mktime+0x665>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 4)
30001d9f:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 6)
30001da4:	01 f8                	add    eax,edi
30001da6:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:165 (discriminator 6)

  yday = month = 0;
30001da9:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
30001db0:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30001db3:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:166 (discriminator 6)
  while (month < tmbuf->tm_mon) {
30001db6:	eb 7b                	jmp    30001e33 <mktime+0x6f4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167
    yday += _ytab[LEAPYEAR(tm_year)][month];
30001db8:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001dbb:	83 e0 03             	and    eax,0x3
30001dbe:	85 c0                	test   eax,eax
30001dc0:	75 50                	jne    30001e12 <mktime+0x6d3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 1)
30001dc2:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001dc5:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001dca:	89 d8                	mov    eax,ebx
30001dcc:	f7 ea                	imul   edx
30001dce:	c1 fa 05             	sar    edx,0x5
30001dd1:	89 d8                	mov    eax,ebx
30001dd3:	c1 f8 1f             	sar    eax,0x1f
30001dd6:	29 c2                	sub    edx,eax
30001dd8:	89 d0                	mov    eax,edx
30001dda:	6b c0 64             	imul   eax,eax,0x64
30001ddd:	29 c3                	sub    ebx,eax
30001ddf:	89 d8                	mov    eax,ebx
30001de1:	85 c0                	test   eax,eax
30001de3:	75 26                	jne    30001e0b <mktime+0x6cc>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 4)
30001de5:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001de8:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001ded:	89 d8                	mov    eax,ebx
30001def:	f7 ea                	imul   edx
30001df1:	c1 fa 07             	sar    edx,0x7
30001df4:	89 d8                	mov    eax,ebx
30001df6:	c1 f8 1f             	sar    eax,0x1f
30001df9:	29 c2                	sub    edx,eax
30001dfb:	89 d0                	mov    eax,edx
30001dfd:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001e03:	29 c3                	sub    ebx,eax
30001e05:	89 d8                	mov    eax,ebx
30001e07:	85 c0                	test   eax,eax
30001e09:	75 07                	jne    30001e12 <mktime+0x6d3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 5)
30001e0b:	ba 01 00 00 00       	mov    edx,0x1
30001e10:	eb 05                	jmp    30001e17 <mktime+0x6d8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 6)
30001e12:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 8)
30001e17:	89 d0                	mov    eax,edx
30001e19:	01 c0                	add    eax,eax
30001e1b:	01 d0                	add    eax,edx
30001e1d:	c1 e0 02             	shl    eax,0x2
30001e20:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
30001e23:	01 d0                	add    eax,edx
30001e25:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
30001e2c:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:168 (discriminator 8)
    month++;
30001e2f:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:166
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
30001e33:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e36:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001e39:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
30001e3c:	0f 8f 76 ff ff ff    	jg     30001db8 <mktime+0x679>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:170
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
30001e42:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e45:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
30001e48:	83 e8 01             	sub    eax,0x1
30001e4b:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:171
  if (day + yday < 0) overflow|=4;
30001e4e:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
30001e51:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001e54:	01 d0                	add    eax,edx
30001e56:	85 c0                	test   eax,eax
30001e58:	79 04                	jns    30001e5e <mktime+0x71f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:171 (discriminator 1)
30001e5a:	83 4d e4 04          	or     DWORD PTR [ebp-0x1c],0x4
/home/yogi/src/os/aproj/libChrisOS/src/time.c:172
  day += yday;
30001e5e:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001e61:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:174

  tmbuf->tm_yday = yday;
30001e64:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e67:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30001e6a:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:175
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)
30001e6d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001e70:	8d 58 04             	lea    ebx,[eax+0x4]
30001e73:	ba 93 24 49 92       	mov    edx,0x92492493
30001e78:	89 d8                	mov    eax,ebx
30001e7a:	f7 ea                	imul   edx
30001e7c:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001e7f:	c1 f8 02             	sar    eax,0x2
30001e82:	89 c2                	mov    edx,eax
30001e84:	89 d8                	mov    eax,ebx
30001e86:	c1 f8 1f             	sar    eax,0x1f
30001e89:	29 c2                	sub    edx,eax
30001e8b:	89 d0                	mov    eax,edx
30001e8d:	89 c2                	mov    edx,eax
30001e8f:	c1 e2 03             	shl    edx,0x3
30001e92:	29 c2                	sub    edx,eax
30001e94:	89 d8                	mov    eax,ebx
30001e96:	29 d0                	sub    eax,edx
30001e98:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001e9b:	89 42 18             	mov    DWORD PTR [edx+0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:177

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;
30001e9e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ea1:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30001ea4:	c1 e0 02             	shl    eax,0x2
30001ea7:	89 c2                	mov    edx,eax
30001ea9:	c1 e2 04             	shl    edx,0x4
30001eac:	29 c2                	sub    edx,eax
30001eae:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001eb1:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001eb4:	01 d0                	add    eax,edx
30001eb6:	c1 e0 02             	shl    eax,0x2
30001eb9:	89 c2                	mov    edx,eax
30001ebb:	c1 e2 04             	shl    edx,0x4
30001ebe:	29 c2                	sub    edx,eax
30001ec0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ec3:	8b 00                	mov    eax,DWORD PTR [eax]
30001ec5:	01 d0                	add    eax,edx
30001ec7:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:179

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
30001eca:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
30001ecf:	2b 45 d8             	sub    eax,DWORD PTR [ebp-0x28]
30001ed2:	89 c3                	mov    ebx,eax
30001ed4:	ba 07 45 2e c2       	mov    edx,0xc22e4507
30001ed9:	89 d8                	mov    eax,ebx
30001edb:	f7 ea                	imul   edx
30001edd:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001ee0:	c1 f8 10             	sar    eax,0x10
30001ee3:	89 c2                	mov    edx,eax
30001ee5:	89 d8                	mov    eax,ebx
30001ee7:	c1 f8 1f             	sar    eax,0x1f
30001eea:	29 c2                	sub    edx,eax
30001eec:	89 d0                	mov    eax,edx
30001eee:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30001ef1:	7d 04                	jge    30001ef7 <mktime+0x7b8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:179 (discriminator 1)
30001ef3:	83 4d e4 08          	or     DWORD PTR [ebp-0x1c],0x8
/home/yogi/src/os/aproj/libChrisOS/src/time.c:180
  seconds += day * SECS_DAY;
30001ef7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001efa:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
30001f00:	01 45 d8             	add    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:183

  // Now adjust according to timezone and daylight saving time
  if (((libcTZ > 0) && (TIME_MAX - libcTZ < seconds)) || 
30001f03:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001f09:	8b 00                	mov    eax,DWORD PTR [eax]
30001f0b:	85 c0                	test   eax,eax
30001f0d:	7e 16                	jle    30001f25 <mktime+0x7e6>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:183 (discriminator 1)
30001f0f:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001f15:	8b 00                	mov    eax,DWORD PTR [eax]
30001f17:	ba ff ff ff 7f       	mov    edx,0x7fffffff
30001f1c:	29 c2                	sub    edx,eax
30001f1e:	89 d0                	mov    eax,edx
30001f20:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
30001f23:	7c 1b                	jl     30001f40 <mktime+0x801>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:184 (discriminator 3)
      ((libcTZ < 0) && (seconds < -libcTZ))) {
30001f25:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001f2b:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:183 (discriminator 3)

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
  seconds += day * SECS_DAY;

  // Now adjust according to timezone and daylight saving time
  if (((libcTZ > 0) && (TIME_MAX - libcTZ < seconds)) || 
30001f2d:	85 c0                	test   eax,eax
30001f2f:	79 13                	jns    30001f44 <mktime+0x805>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:184
      ((libcTZ < 0) && (seconds < -libcTZ))) {
30001f31:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001f37:	8b 00                	mov    eax,DWORD PTR [eax]
30001f39:	f7 d8                	neg    eax
30001f3b:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
30001f3e:	7e 04                	jle    30001f44 <mktime+0x805>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:185
          overflow|=16;
30001f40:	83 4d e4 10          	or     DWORD PTR [ebp-0x1c],0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:187
  }
  seconds += libcTZ;
30001f44:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001f4a:	8b 00                	mov    eax,DWORD PTR [eax]
30001f4c:	01 45 d8             	add    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:189

  if (tmbuf->tm_isdst) {
30001f4f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f52:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
30001f55:	85 c0                	test   eax,eax
30001f57:	74 0b                	je     30001f64 <mktime+0x825>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:190
    dst = _dstbias;
30001f59:	8b 81 04 01 00 00    	mov    eax,DWORD PTR [ecx+0x104]
30001f5f:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
30001f62:	eb 07                	jmp    30001f6b <mktime+0x82c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:192
  } else {
    dst = 0;
30001f64:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:195
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
30001f6b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
30001f6e:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
30001f71:	7e 04                	jle    30001f77 <mktime+0x838>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:195 (discriminator 1)
30001f73:	83 4d e4 20          	or     DWORD PTR [ebp-0x1c],0x20
/home/yogi/src/os/aproj/libChrisOS/src/time.c:196
  seconds -= dst;
30001f77:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
30001f7a:	29 45 d8             	sub    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:198

  if (overflow) return (time_t) overflow-2;
30001f7d:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
30001f81:	74 08                	je     30001f8b <mktime+0x84c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:198 (discriminator 1)
30001f83:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
30001f86:	83 e8 02             	sub    eax,0x2
30001f89:	eb 03                	jmp    30001f8e <mktime+0x84f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:201

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
30001f8b:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:202
}
30001f8e:	83 c4 20             	add    esp,0x20
30001f91:	5b                   	pop    ebx
30001f92:	5e                   	pop    esi
30001f93:	5f                   	pop    edi
30001f94:	5d                   	pop    ebp
30001f95:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

30001f96 <__x86.get_pc_thunk.ax>:
__x86.get_pc_thunk.ax():
30001f96:	8b 04 24             	mov    eax,DWORD PTR [esp]
30001f99:	c3                   	ret    

Disassembly of section .plt:

30001fa0 <.plt>:
30001fa0:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
30001fa6:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
30001fac:	00 00                	add    BYTE PTR [eax],al
30001fae:	00 00                	add    BYTE PTR [eax],al
30001fb0:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
30001fb6:	68 00 00 00 00       	push   0x0
30001fbb:	e9 e0 ff ff ff       	jmp    30001fa0 <__x86.get_pc_thunk.ax+0xa>
30001fc0:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
30001fc6:	68 08 00 00 00       	push   0x8
30001fcb:	e9 d0 ff ff ff       	jmp    30001fa0 <__x86.get_pc_thunk.ax+0xa>
30001fd0:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
30001fd6:	68 10 00 00 00       	push   0x10
30001fdb:	e9 c0 ff ff ff       	jmp    30001fa0 <__x86.get_pc_thunk.ax+0xa>
30001fe0:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
30001fe6:	68 18 00 00 00       	push   0x18
30001feb:	e9 b0 ff ff ff       	jmp    30001fa0 <__x86.get_pc_thunk.ax+0xa>

Disassembly of section .text.__x86.get_pc_thunk.bx:

30001ff0 <__x86.get_pc_thunk.bx>:
__x86.get_pc_thunk.bx():
30001ff0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
30001ff3:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.si:

30001ff4 <__x86.get_pc_thunk.si>:
__x86.get_pc_thunk.si():
30001ff4:	8b 34 24             	mov    esi,DWORD PTR [esp]
30001ff7:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.cx:

30001ff8 <__x86.get_pc_thunk.cx>:
__x86.get_pc_thunk.cx():
30001ff8:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
30001ffb:	c3                   	ret    

Disassembly of section .eh_frame:

30001ffc <.eh_frame>:
30001ffc:	14 00                	adc    al,0x0
30001ffe:	00 00                	add    BYTE PTR [eax],al
30002000:	00 00                	add    BYTE PTR [eax],al
30002002:	00 00                	add    BYTE PTR [eax],al
30002004:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
30002007:	00 01                	add    BYTE PTR [ecx],al
30002009:	7c 08                	jl     30002013 <__x86.get_pc_thunk.cx+0x1b>
3000200b:	01 1b                	add    DWORD PTR [ebx],ebx
3000200d:	0c 04                	or     al,0x4
3000200f:	04 88                	add    al,0x88
30002011:	01 00                	add    DWORD PTR [eax],eax
30002013:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002016:	00 00                	add    BYTE PTR [eax],al
30002018:	1c 00                	sbb    al,0x0
3000201a:	00 00                	add    BYTE PTR [eax],al
3000201c:	e4 df                	in     al,0xdf
3000201e:	ff                   	(bad)  
3000201f:	ff                   	(bad)  
30002020:	38 00                	cmp    BYTE PTR [eax],al
30002022:	00 00                	add    BYTE PTR [eax],al
30002024:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002027:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000202d:	74 c5                	je     30001ff4 <__x86.get_pc_thunk.si>
3000202f:	0c 04                	or     al,0x4
30002031:	04 00                	add    al,0x0
30002033:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002036:	00 00                	add    BYTE PTR [eax],al
30002038:	3c 00                	cmp    al,0x0
3000203a:	00 00                	add    BYTE PTR [eax],al
3000203c:	fc                   	cld    
3000203d:	df ff                	(bad)  
3000203f:	ff                   	(bad)  
30002040:	38 00                	cmp    BYTE PTR [eax],al
30002042:	00 00                	add    BYTE PTR [eax],al
30002044:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002047:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000204d:	74 c5                	je     30002014 <__x86.get_pc_thunk.cx+0x1c>
3000204f:	0c 04                	or     al,0x4
30002051:	04 00                	add    al,0x0
30002053:	00 10                	add    BYTE PTR [eax],dl
30002055:	00 00                	add    BYTE PTR [eax],al
30002057:	00 5c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bl
3000205b:	00 3a                	add    BYTE PTR [edx],bh
3000205d:	ff                   	(bad)  
3000205e:	ff                   	(bad)  
3000205f:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
30002062:	00 00                	add    BYTE PTR [eax],al
30002064:	00 00                	add    BYTE PTR [eax],al
30002066:	00 00                	add    BYTE PTR [eax],al
30002068:	24 00                	and    al,0x0
3000206a:	00 00                	add    BYTE PTR [eax],al
3000206c:	70 00                	jo     3000206e <__x86.get_pc_thunk.cx+0x76>
3000206e:	00 00                	add    BYTE PTR [eax],al
30002070:	00 e0                	add    al,ah
30002072:	ff                   	(bad)  
30002073:	ff 55 00             	call   DWORD PTR [ebp+0x0]
30002076:	00 00                	add    BYTE PTR [eax],al
30002078:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000207b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002081:	42                   	inc    edx
30002082:	86 03                	xchg   BYTE PTR [ebx],al
30002084:	83 04 02 4d          	add    DWORD PTR [edx+eax*1],0x4d
30002088:	c3                   	ret    
30002089:	41                   	inc    ecx
3000208a:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
3000208e:	04 04                	add    al,0x4
30002090:	24 00                	and    al,0x0
30002092:	00 00                	add    BYTE PTR [eax],al
30002094:	98                   	cwde   
30002095:	00 00                	add    BYTE PTR [eax],al
30002097:	00 2d e0 ff ff 55    	add    BYTE PTR ds:0x55ffffe0,ch
3000209d:	00 00                	add    BYTE PTR [eax],al
3000209f:	00 00                	add    BYTE PTR [eax],al
300020a1:	41                   	inc    ecx
300020a2:	0e                   	push   cs
300020a3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300020a9:	42                   	inc    edx
300020aa:	86 03                	xchg   BYTE PTR [ebx],al
300020ac:	83 04 02 4d          	add    DWORD PTR [edx+eax*1],0x4d
300020b0:	c3                   	ret    
300020b1:	41                   	inc    ecx
300020b2:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
300020b6:	04 04                	add    al,0x4
300020b8:	24 00                	and    al,0x0
300020ba:	00 00                	add    BYTE PTR [eax],al
300020bc:	c0 00 00             	rol    BYTE PTR [eax],0x0
300020bf:	00 5c e0 ff          	add    BYTE PTR [eax+eiz*8-0x1],bl
300020c3:	ff 97 00 00 00 00    	call   DWORD PTR [edi+0x0]
300020c9:	41                   	inc    ecx
300020ca:	0e                   	push   cs
300020cb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300020d1:	42                   	inc    edx
300020d2:	86 03                	xchg   BYTE PTR [ebx],al
300020d4:	83 04 02 8f          	add    DWORD PTR [edx+eax*1],0xffffff8f
300020d8:	c3                   	ret    
300020d9:	41                   	inc    ecx
300020da:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
300020de:	04 04                	add    al,0x4
300020e0:	10 00                	adc    BYTE PTR [eax],al
300020e2:	00 00                	add    BYTE PTR [eax],al
300020e4:	e8 00 00 00 08       	call   380020e9 <ticksToWait+0x7ffeb69>
300020e9:	ff                   	(bad)  
300020ea:	ff                   	(bad)  
300020eb:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
300020ee:	00 00                	add    BYTE PTR [eax],al
300020f0:	00 00                	add    BYTE PTR [eax],al
300020f2:	00 00                	add    BYTE PTR [eax],al
300020f4:	20 00                	and    BYTE PTR [eax],al
300020f6:	00 00                	add    BYTE PTR [eax],al
300020f8:	fc                   	cld    
300020f9:	00 00                	add    BYTE PTR [eax],al
300020fb:	00 b8 e0 ff ff 26    	add    BYTE PTR [eax+0x26ffffe0],bh
30002101:	00 00                	add    BYTE PTR [eax],al
30002103:	00 00                	add    BYTE PTR [eax],al
30002105:	41                   	inc    ecx
30002106:	0e                   	push   cs
30002107:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000210d:	41                   	inc    ecx
3000210e:	83 03 60             	add    DWORD PTR [ebx],0x60
30002111:	c3                   	ret    
30002112:	41                   	inc    ecx
30002113:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002116:	04 00                	add    al,0x0
30002118:	20 00                	and    BYTE PTR [eax],al
3000211a:	00 00                	add    BYTE PTR [eax],al
3000211c:	20 01                	and    BYTE PTR [ecx],al
3000211e:	00 00                	add    BYTE PTR [eax],al
30002120:	ba e0 ff ff 43       	mov    edx,0x43ffffe0
30002125:	00 00                	add    BYTE PTR [eax],al
30002127:	00 00                	add    BYTE PTR [eax],al
30002129:	41                   	inc    ecx
3000212a:	0e                   	push   cs
3000212b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002131:	44                   	inc    esp
30002132:	83 03 7a             	add    DWORD PTR [ebx],0x7a
30002135:	c3                   	ret    
30002136:	41                   	inc    ecx
30002137:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000213a:	04 00                	add    al,0x0
3000213c:	20 00                	and    BYTE PTR [eax],al
3000213e:	00 00                	add    BYTE PTR [eax],al
30002140:	44                   	inc    esp
30002141:	01 00                	add    DWORD PTR [eax],eax
30002143:	00 d9                	add    cl,bl
30002145:	e0 ff                	loopne 30002146 <__x86.get_pc_thunk.cx+0x14e>
30002147:	ff 2f                	jmp    FWORD PTR [edi]
30002149:	00 00                	add    BYTE PTR [eax],al
3000214b:	00 00                	add    BYTE PTR [eax],al
3000214d:	41                   	inc    ecx
3000214e:	0e                   	push   cs
3000214f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002155:	44                   	inc    esp
30002156:	83 03 66             	add    DWORD PTR [ebx],0x66
30002159:	c3                   	ret    
3000215a:	41                   	inc    ecx
3000215b:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000215e:	04 00                	add    al,0x0
30002160:	20 00                	and    BYTE PTR [eax],al
30002162:	00 00                	add    BYTE PTR [eax],al
30002164:	68 01 00 00 e4       	push   0xe4000001
30002169:	e0 ff                	loopne 3000216a <__x86.get_pc_thunk.cx+0x172>
3000216b:	ff d1                	call   ecx
3000216d:	00 00                	add    BYTE PTR [eax],al
3000216f:	00 00                	add    BYTE PTR [eax],al
30002171:	41                   	inc    ecx
30002172:	0e                   	push   cs
30002173:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002179:	44                   	inc    esp
3000217a:	83 03 02             	add    DWORD PTR [ebx],0x2
3000217d:	c9                   	leave  
3000217e:	c5 c3 0c             	(bad)  
30002181:	04 04                	add    al,0x4
30002183:	00 20                	add    BYTE PTR [eax],ah
30002185:	00 00                	add    BYTE PTR [eax],al
30002187:	00 8c 01 00 00 94 e1 	add    BYTE PTR [ecx+eax*1-0x1e6c0000],cl
3000218e:	ff                   	(bad)  
3000218f:	ff 35 00 00 00 00    	push   DWORD PTR ds:0x0
30002195:	41                   	inc    ecx
30002196:	0e                   	push   cs
30002197:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000219d:	44                   	inc    esp
3000219e:	83 03 6c             	add    DWORD PTR [ebx],0x6c
300021a1:	c3                   	ret    
300021a2:	41                   	inc    ecx
300021a3:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300021a6:	04 00                	add    al,0x0
300021a8:	20 00                	and    BYTE PTR [eax],al
300021aa:	00 00                	add    BYTE PTR [eax],al
300021ac:	b0 01                	mov    al,0x1
300021ae:	00 00                	add    BYTE PTR [eax],al
300021b0:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
300021b1:	e1 ff                	loope  300021b2 <__x86.get_pc_thunk.cx+0x1ba>
300021b3:	ff 34 00             	push   DWORD PTR [eax+eax*1]
300021b6:	00 00                	add    BYTE PTR [eax],al
300021b8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300021bb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300021c1:	44                   	inc    esp
300021c2:	83 03 6b             	add    DWORD PTR [ebx],0x6b
300021c5:	c3                   	ret    
300021c6:	41                   	inc    ecx
300021c7:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300021ca:	04 00                	add    al,0x0
300021cc:	20 00                	and    BYTE PTR [eax],al
300021ce:	00 00                	add    BYTE PTR [eax],al
300021d0:	d4 01                	aam    0x1
300021d2:	00 00                	add    BYTE PTR [eax],al
300021d4:	b5 e1                	mov    ch,0xe1
300021d6:	ff                   	(bad)  
300021d7:	ff 31                	push   DWORD PTR [ecx]
300021d9:	00 00                	add    BYTE PTR [eax],al
300021db:	00 00                	add    BYTE PTR [eax],al
300021dd:	41                   	inc    ecx
300021de:	0e                   	push   cs
300021df:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300021e5:	44                   	inc    esp
300021e6:	83 03 68             	add    DWORD PTR [ebx],0x68
300021e9:	c3                   	ret    
300021ea:	41                   	inc    ecx
300021eb:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300021ee:	04 00                	add    al,0x0
300021f0:	1c 00                	sbb    al,0x0
300021f2:	00 00                	add    BYTE PTR [eax],al
300021f4:	f8                   	clc    
300021f5:	01 00                	add    DWORD PTR [eax],eax
300021f7:	00 c2                	add    dl,al
300021f9:	e1 ff                	loope  300021fa <__x86.get_pc_thunk.cx+0x202>
300021fb:	ff 27                	jmp    DWORD PTR [edi]
300021fd:	00 00                	add    BYTE PTR [eax],al
300021ff:	00 00                	add    BYTE PTR [eax],al
30002201:	41                   	inc    ecx
30002202:	0e                   	push   cs
30002203:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002209:	63 c5                	arpl   bp,ax
3000220b:	0c 04                	or     al,0x4
3000220d:	04 00                	add    al,0x0
3000220f:	00 20                	add    BYTE PTR [eax],ah
30002211:	00 00                	add    BYTE PTR [eax],al
30002213:	00 18                	add    BYTE PTR [eax],bl
30002215:	02 00                	add    al,BYTE PTR [eax]
30002217:	00 c9                	add    cl,cl
30002219:	e1 ff                	loope  3000221a <__x86.get_pc_thunk.cx+0x222>
3000221b:	ff 64 00 00          	jmp    DWORD PTR [eax+eax*1+0x0]
3000221f:	00 00                	add    BYTE PTR [eax],al
30002221:	41                   	inc    ecx
30002222:	0e                   	push   cs
30002223:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002229:	44                   	inc    esp
3000222a:	83 03 02             	add    DWORD PTR [ebx],0x2
3000222d:	5c                   	pop    esp
3000222e:	c5 c3 0c             	(bad)  
30002231:	04 04                	add    al,0x4
30002233:	00 20                	add    BYTE PTR [eax],ah
30002235:	00 00                	add    BYTE PTR [eax],al
30002237:	00 3c 02             	add    BYTE PTR [edx+eax*1],bh
3000223a:	00 00                	add    BYTE PTR [eax],al
3000223c:	09 e2                	or     edx,esp
3000223e:	ff                   	(bad)  
3000223f:	ff 1f                	call   FWORD PTR [edi]
30002241:	00 00                	add    BYTE PTR [eax],al
30002243:	00 00                	add    BYTE PTR [eax],al
30002245:	41                   	inc    ecx
30002246:	0e                   	push   cs
30002247:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000224d:	44                   	inc    esp
3000224e:	83 03 56             	add    DWORD PTR [ebx],0x56
30002251:	c3                   	ret    
30002252:	41                   	inc    ecx
30002253:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002256:	04 00                	add    al,0x0
30002258:	1c 00                	sbb    al,0x0
3000225a:	00 00                	add    BYTE PTR [eax],al
3000225c:	60                   	pusha  
3000225d:	02 00                	add    al,BYTE PTR [eax]
3000225f:	00 04 e2             	add    BYTE PTR [edx+eiz*8],al
30002262:	ff                   	(bad)  
30002263:	ff 34 00             	push   DWORD PTR [eax+eax*1]
30002266:	00 00                	add    BYTE PTR [eax],al
30002268:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000226b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002271:	70 c5                	jo     30002238 <__x86.get_pc_thunk.cx+0x240>
30002273:	0c 04                	or     al,0x4
30002275:	04 00                	add    al,0x0
30002277:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3000227a:	00 00                	add    BYTE PTR [eax],al
3000227c:	80 02 00             	add    BYTE PTR [edx],0x0
3000227f:	00 18                	add    BYTE PTR [eax],bl
30002281:	e2 ff                	loop   30002282 <__x86.get_pc_thunk.cx+0x28a>
30002283:	ff 34 00             	push   DWORD PTR [eax+eax*1]
30002286:	00 00                	add    BYTE PTR [eax],al
30002288:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000228b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002291:	70 c5                	jo     30002258 <__x86.get_pc_thunk.cx+0x260>
30002293:	0c 04                	or     al,0x4
30002295:	04 00                	add    al,0x0
30002297:	00 20                	add    BYTE PTR [eax],ah
30002299:	00 00                	add    BYTE PTR [eax],al
3000229b:	00 a0 02 00 00 2c    	add    BYTE PTR [eax+0x2c000002],ah
300022a1:	e2 ff                	loop   300022a2 <__x86.get_pc_thunk.cx+0x2aa>
300022a3:	ff 37                	push   DWORD PTR [edi]
300022a5:	00 00                	add    BYTE PTR [eax],al
300022a7:	00 00                	add    BYTE PTR [eax],al
300022a9:	41                   	inc    ecx
300022aa:	0e                   	push   cs
300022ab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300022b1:	44                   	inc    esp
300022b2:	83 03 6e             	add    DWORD PTR [ebx],0x6e
300022b5:	c3                   	ret    
300022b6:	41                   	inc    ecx
300022b7:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300022ba:	04 00                	add    al,0x0
300022bc:	20 00                	and    BYTE PTR [eax],al
300022be:	00 00                	add    BYTE PTR [eax],al
300022c0:	c4 02                	les    eax,FWORD PTR [edx]
300022c2:	00 00                	add    BYTE PTR [eax],al
300022c4:	3f                   	aas    
300022c5:	e2 ff                	loop   300022c6 <__x86.get_pc_thunk.cx+0x2ce>
300022c7:	ff 4e 00             	dec    DWORD PTR [esi+0x0]
300022ca:	00 00                	add    BYTE PTR [eax],al
300022cc:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300022cf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300022d5:	44                   	inc    esp
300022d6:	83 03 02             	add    DWORD PTR [ebx],0x2
300022d9:	45                   	inc    ebp
300022da:	c3                   	ret    
300022db:	41                   	inc    ecx
300022dc:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300022df:	04 1c                	add    al,0x1c
300022e1:	00 00                	add    BYTE PTR [eax],al
300022e3:	00 e8                	add    al,ch
300022e5:	02 00                	add    al,BYTE PTR [eax]
300022e7:	00 69 e2             	add    BYTE PTR [ecx-0x1e],ch
300022ea:	ff                   	(bad)  
300022eb:	ff 1d 00 00 00 00    	call   FWORD PTR ds:0x0
300022f1:	41                   	inc    ecx
300022f2:	0e                   	push   cs
300022f3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300022f9:	59                   	pop    ecx
300022fa:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300022fd:	04 00                	add    al,0x0
300022ff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002302:	00 00                	add    BYTE PTR [eax],al
30002304:	08 03                	or     BYTE PTR [ebx],al
30002306:	00 00                	add    BYTE PTR [eax],al
30002308:	66                   	data16
30002309:	e2 ff                	loop   3000230a <__x86.get_pc_thunk.cx+0x312>
3000230b:	ff 29                	jmp    FWORD PTR [ecx]
3000230d:	00 00                	add    BYTE PTR [eax],al
3000230f:	00 00                	add    BYTE PTR [eax],al
30002311:	41                   	inc    ecx
30002312:	0e                   	push   cs
30002313:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002319:	65 c5 0c 04          	lds    ecx,FWORD PTR gs:[esp+eax*1]
3000231d:	04 00                	add    al,0x0
3000231f:	00 20                	add    BYTE PTR [eax],ah
30002321:	00 00                	add    BYTE PTR [eax],al
30002323:	00 28                	add    BYTE PTR [eax],ch
30002325:	03 00                	add    eax,DWORD PTR [eax]
30002327:	00 6f e2             	add    BYTE PTR [edi-0x1e],ch
3000232a:	ff                   	(bad)  
3000232b:	ff 34 00             	push   DWORD PTR [eax+eax*1]
3000232e:	00 00                	add    BYTE PTR [eax],al
30002330:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002333:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002339:	44                   	inc    esp
3000233a:	83 03 6b             	add    DWORD PTR [ebx],0x6b
3000233d:	c3                   	ret    
3000233e:	41                   	inc    ecx
3000233f:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002342:	04 00                	add    al,0x0
30002344:	1c 00                	sbb    al,0x0
30002346:	00 00                	add    BYTE PTR [eax],al
30002348:	4c                   	dec    esp
30002349:	03 00                	add    eax,DWORD PTR [eax]
3000234b:	00 7f e2             	add    BYTE PTR [edi-0x1e],bh
3000234e:	ff                   	(bad)  
3000234f:	ff 1d 00 00 00 00    	call   FWORD PTR ds:0x0
30002355:	41                   	inc    ecx
30002356:	0e                   	push   cs
30002357:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000235d:	59                   	pop    ecx
3000235e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002361:	04 00                	add    al,0x0
30002363:	00 20                	add    BYTE PTR [eax],ah
30002365:	00 00                	add    BYTE PTR [eax],al
30002367:	00 6c 03 00          	add    BYTE PTR [ebx+eax*1+0x0],ch
3000236b:	00 7c e2 ff          	add    BYTE PTR [edx+eiz*8-0x1],bh
3000236f:	ff 42 00             	inc    DWORD PTR [edx+0x0]
30002372:	00 00                	add    BYTE PTR [eax],al
30002374:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002377:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000237d:	44                   	inc    esp
3000237e:	83 03 7a             	add    DWORD PTR [ebx],0x7a
30002381:	c5 c3 0c             	(bad)  
30002384:	04 04                	add    al,0x4
30002386:	00 00                	add    BYTE PTR [eax],al
30002388:	1c 00                	sbb    al,0x0
3000238a:	00 00                	add    BYTE PTR [eax],al
3000238c:	90                   	nop
3000238d:	03 00                	add    eax,DWORD PTR [eax]
3000238f:	00 9a e2 ff ff 20    	add    BYTE PTR [edx+0x20ffffe2],bl
30002395:	00 00                	add    BYTE PTR [eax],al
30002397:	00 00                	add    BYTE PTR [eax],al
30002399:	41                   	inc    ecx
3000239a:	0e                   	push   cs
3000239b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300023a1:	5c                   	pop    esp
300023a2:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300023a5:	04 00                	add    al,0x0
300023a7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300023aa:	00 00                	add    BYTE PTR [eax],al
300023ac:	b0 03                	mov    al,0x3
300023ae:	00 00                	add    BYTE PTR [eax],al
300023b0:	9c                   	pushf  
300023b1:	e2 ff                	loop   300023b2 <__x86.get_pc_thunk.cx+0x3ba>
300023b3:	ff 34 00             	push   DWORD PTR [eax+eax*1]
300023b6:	00 00                	add    BYTE PTR [eax],al
300023b8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300023bb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300023c1:	70 c5                	jo     30002388 <__x86.get_pc_thunk.cx+0x390>
300023c3:	0c 04                	or     al,0x4
300023c5:	04 00                	add    al,0x0
300023c7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300023ca:	00 00                	add    BYTE PTR [eax],al
300023cc:	d0 03                	rol    BYTE PTR [ebx],1
300023ce:	00 00                	add    BYTE PTR [eax],al
300023d0:	b0 e2                	mov    al,0xe2
300023d2:	ff                   	(bad)  
300023d3:	ff                   	(bad)  
300023d4:	7c 00                	jl     300023d6 <__x86.get_pc_thunk.cx+0x3de>
300023d6:	00 00                	add    BYTE PTR [eax],al
300023d8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300023db:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300023e1:	02 78 c5             	add    bh,BYTE PTR [eax-0x3b]
300023e4:	0c 04                	or     al,0x4
300023e6:	04 00                	add    al,0x0
300023e8:	28 00                	sub    BYTE PTR [eax],al
300023ea:	00 00                	add    BYTE PTR [eax],al
300023ec:	f0 03 00             	lock add eax,DWORD PTR [eax]
300023ef:	00 0c e3             	add    BYTE PTR [ebx+eiz*8],cl
300023f2:	ff                   	(bad)  
300023f3:	ff e3                	jmp    ebx
300023f5:	01 00                	add    DWORD PTR [eax],eax
300023f7:	00 00                	add    BYTE PTR [eax],al
300023f9:	41                   	inc    ecx
300023fa:	0e                   	push   cs
300023fb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002401:	45                   	inc    ebp
30002402:	86 03                	xchg   BYTE PTR [ebx],al
30002404:	83 04 03 d8          	add    DWORD PTR [ebx+eax*1],0xffffffd8
30002408:	01 c3                	add    ebx,eax
3000240a:	41                   	inc    ecx
3000240b:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
3000240f:	04 04                	add    al,0x4
30002411:	00 00                	add    BYTE PTR [eax],al
30002413:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002416:	00 00                	add    BYTE PTR [eax],al
30002418:	1c 04                	sbb    al,0x4
3000241a:	00 00                	add    BYTE PTR [eax],al
3000241c:	c3                   	ret    
3000241d:	e4 ff                	in     al,0xff
3000241f:	ff                   	(bad)  
30002420:	39 00                	cmp    DWORD PTR [eax],eax
30002422:	00 00                	add    BYTE PTR [eax],al
30002424:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002427:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000242d:	75 c5                	jne    300023f4 <__x86.get_pc_thunk.cx+0x3fc>
3000242f:	0c 04                	or     al,0x4
30002431:	04 00                	add    al,0x0
30002433:	00 20                	add    BYTE PTR [eax],ah
30002435:	00 00                	add    BYTE PTR [eax],al
30002437:	00 3c 04             	add    BYTE PTR [esp+eax*1],bh
3000243a:	00 00                	add    BYTE PTR [eax],al
3000243c:	dc e4                	fsubr  st(4),st
3000243e:	ff                   	(bad)  
3000243f:	ff 26                	jmp    DWORD PTR [esi]
30002441:	00 00                	add    BYTE PTR [eax],al
30002443:	00 00                	add    BYTE PTR [eax],al
30002445:	41                   	inc    ecx
30002446:	0e                   	push   cs
30002447:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000244d:	41                   	inc    ecx
3000244e:	83 03 60             	add    DWORD PTR [ebx],0x60
30002451:	c3                   	ret    
30002452:	41                   	inc    ecx
30002453:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002456:	04 00                	add    al,0x0
30002458:	10 00                	adc    BYTE PTR [eax],al
3000245a:	00 00                	add    BYTE PTR [eax],al
3000245c:	60                   	pusha  
3000245d:	04 00                	add    al,0x0
3000245f:	00 94 fb ff ff 04 00 	add    BYTE PTR [ebx+edi*8+0x4ffff],dl
30002466:	00 00                	add    BYTE PTR [eax],al
30002468:	00 00                	add    BYTE PTR [eax],al
3000246a:	00 00                	add    BYTE PTR [eax],al
3000246c:	1c 00                	sbb    al,0x0
3000246e:	00 00                	add    BYTE PTR [eax],al
30002470:	74 04                	je     30002476 <__x86.get_pc_thunk.cx+0x47e>
30002472:	00 00                	add    BYTE PTR [eax],al
30002474:	cc                   	int3   
30002475:	e4 ff                	in     al,0xff
30002477:	ff 9b 01 00 00 00    	call   FWORD PTR [ebx+0x1]
3000247d:	41                   	inc    ecx
3000247e:	0e                   	push   cs
3000247f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002485:	03 97 01 c5 0c 04    	add    edx,DWORD PTR [edi+0x40cc501]
3000248b:	04 1c                	add    al,0x1c
3000248d:	00 00                	add    BYTE PTR [eax],al
3000248f:	00 94 04 00 00 48 e6 	add    BYTE PTR [esp+eax*1-0x19b80000],dl
30002496:	ff                   	(bad)  
30002497:	ff c7                	inc    edi
30002499:	00 00                	add    BYTE PTR [eax],al
3000249b:	00 00                	add    BYTE PTR [eax],al
3000249d:	41                   	inc    ecx
3000249e:	0e                   	push   cs
3000249f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300024a5:	02 c3                	add    al,bl
300024a7:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300024aa:	04 00                	add    al,0x0
300024ac:	1c 00                	sbb    al,0x0
300024ae:	00 00                	add    BYTE PTR [eax],al
300024b0:	b4 04                	mov    ah,0x4
300024b2:	00 00                	add    BYTE PTR [eax],al
300024b4:	f0 e6 ff             	lock out 0xff,al
300024b7:	ff 10                	call   DWORD PTR [eax]
300024b9:	00 00                	add    BYTE PTR [eax],al
300024bb:	00 00                	add    BYTE PTR [eax],al
300024bd:	41                   	inc    ecx
300024be:	0e                   	push   cs
300024bf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300024c5:	4c                   	dec    esp
300024c6:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300024c9:	04 00                	add    al,0x0
300024cb:	00 20                	add    BYTE PTR [eax],ah
300024cd:	00 00                	add    BYTE PTR [eax],al
300024cf:	00 d4                	add    ah,dl
300024d1:	04 00                	add    al,0x0
300024d3:	00 e0                	add    al,ah
300024d5:	e6 ff                	out    0xff,al
300024d7:	ff 2c 00             	jmp    FWORD PTR [eax+eax*1]
300024da:	00 00                	add    BYTE PTR [eax],al
300024dc:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300024df:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300024e5:	44                   	inc    esp
300024e6:	83 03 64             	add    DWORD PTR [ebx],0x64
300024e9:	c5 c3 0c             	(bad)  
300024ec:	04 04                	add    al,0x4
300024ee:	00 00                	add    BYTE PTR [eax],al
300024f0:	20 00                	and    BYTE PTR [eax],al
300024f2:	00 00                	add    BYTE PTR [eax],al
300024f4:	f8                   	clc    
300024f5:	04 00                	add    al,0x0
300024f7:	00 e8                	add    al,ch
300024f9:	e6 ff                	out    0xff,al
300024fb:	ff 26                	jmp    DWORD PTR [esi]
300024fd:	00 00                	add    BYTE PTR [eax],al
300024ff:	00 00                	add    BYTE PTR [eax],al
30002501:	41                   	inc    ecx
30002502:	0e                   	push   cs
30002503:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002509:	44                   	inc    esp
3000250a:	83 03 5e             	add    DWORD PTR [ebx],0x5e
3000250d:	c5 c3 0c             	(bad)  
30002510:	04 04                	add    al,0x4
30002512:	00 00                	add    BYTE PTR [eax],al
30002514:	1c 00                	sbb    al,0x0
30002516:	00 00                	add    BYTE PTR [eax],al
30002518:	1c 05                	sbb    al,0x5
3000251a:	00 00                	add    BYTE PTR [eax],al
3000251c:	ea e6 ff ff 53 00 00 	jmp    0x0:0x53ffffe6
30002523:	00 00                	add    BYTE PTR [eax],al
30002525:	41                   	inc    ecx
30002526:	0e                   	push   cs
30002527:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000252d:	02 4f c5             	add    cl,BYTE PTR [edi-0x3b]
30002530:	0c 04                	or     al,0x4
30002532:	04 00                	add    al,0x0
30002534:	20 00                	and    BYTE PTR [eax],al
30002536:	00 00                	add    BYTE PTR [eax],al
30002538:	3c 05                	cmp    al,0x5
3000253a:	00 00                	add    BYTE PTR [eax],al
3000253c:	20 e7                	and    bh,ah
3000253e:	ff                   	(bad)  
3000253f:	ff                   	(bad)  
30002540:	3e 00 00             	add    BYTE PTR ds:[eax],al
30002543:	00 00                	add    BYTE PTR [eax],al
30002545:	41                   	inc    ecx
30002546:	0e                   	push   cs
30002547:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000254d:	44                   	inc    esp
3000254e:	83 03 76             	add    DWORD PTR [ebx],0x76
30002551:	c5 c3 0c             	(bad)  
30002554:	04 04                	add    al,0x4
30002556:	00 00                	add    BYTE PTR [eax],al
30002558:	1c 00                	sbb    al,0x0
3000255a:	00 00                	add    BYTE PTR [eax],al
3000255c:	60                   	pusha  
3000255d:	05 00 00 3a e7       	add    eax,0xe73a0000
30002562:	ff                   	(bad)  
30002563:	ff 6f 00             	jmp    FWORD PTR [edi+0x0]
30002566:	00 00                	add    BYTE PTR [eax],al
30002568:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000256b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002571:	02 6b c5             	add    ch,BYTE PTR [ebx-0x3b]
30002574:	0c 04                	or     al,0x4
30002576:	04 00                	add    al,0x0
30002578:	24 00                	and    al,0x0
3000257a:	00 00                	add    BYTE PTR [eax],al
3000257c:	80 05 00 00 8c e7 ff 	add    BYTE PTR ds:0xe78c0000,0xff
30002583:	ff 5e 00             	call   FWORD PTR [esi+0x0]
30002586:	00 00                	add    BYTE PTR [eax],al
30002588:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000258b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002591:	45                   	inc    ebp
30002592:	86 03                	xchg   BYTE PTR [ebx],al
30002594:	83 04 02 53          	add    DWORD PTR [edx+eax*1],0x53
30002598:	c3                   	ret    
30002599:	41                   	inc    ecx
3000259a:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
3000259e:	04 04                	add    al,0x4
300025a0:	1c 00                	sbb    al,0x0
300025a2:	00 00                	add    BYTE PTR [eax],al
300025a4:	a8 05                	test   al,0x5
300025a6:	00 00                	add    BYTE PTR [eax],al
300025a8:	c4                   	(bad)  
300025a9:	e7 ff                	out    0xff,eax
300025ab:	ff 40 00             	inc    DWORD PTR [eax+0x0]
300025ae:	00 00                	add    BYTE PTR [eax],al
300025b0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300025b3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025b9:	7c c5                	jl     30002580 <__x86.get_pc_thunk.cx+0x588>
300025bb:	0c 04                	or     al,0x4
300025bd:	04 00                	add    al,0x0
300025bf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300025c2:	00 00                	add    BYTE PTR [eax],al
300025c4:	c8 05 00 00          	enter  0x5,0x0
300025c8:	e4 e7                	in     al,0xe7
300025ca:	ff                   	(bad)  
300025cb:	ff 47 00             	inc    DWORD PTR [edi+0x0]
300025ce:	00 00                	add    BYTE PTR [eax],al
300025d0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300025d3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025d9:	02 43 c5             	add    al,BYTE PTR [ebx-0x3b]
300025dc:	0c 04                	or     al,0x4
300025de:	04 00                	add    al,0x0
300025e0:	1c 00                	sbb    al,0x0
300025e2:	00 00                	add    BYTE PTR [eax],al
300025e4:	e8 05 00 00 0c       	call   3c0025ee <ticksToWait+0xbfff06e>
300025e9:	e8 ff ff 31 00       	call   303225ed <ticksToWait+0x31f06d>
300025ee:	00 00                	add    BYTE PTR [eax],al
300025f0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300025f3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025f9:	6d                   	ins    DWORD PTR es:[edi],dx
300025fa:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300025fd:	04 00                	add    al,0x0
300025ff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002602:	00 00                	add    BYTE PTR [eax],al
30002604:	08 06                	or     BYTE PTR [esi],al
30002606:	00 00                	add    BYTE PTR [eax],al
30002608:	20 e8                	and    al,ch
3000260a:	ff                   	(bad)  
3000260b:	ff 67 00             	jmp    DWORD PTR [edi+0x0]
3000260e:	00 00                	add    BYTE PTR [eax],al
30002610:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002613:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002619:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
3000261c:	0c 04                	or     al,0x4
3000261e:	04 00                	add    al,0x0
30002620:	1c 00                	sbb    al,0x0
30002622:	00 00                	add    BYTE PTR [eax],al
30002624:	28 06                	sub    BYTE PTR [esi],al
30002626:	00 00                	add    BYTE PTR [eax],al
30002628:	68 e8 ff ff 60       	push   0x60ffffe8
3000262d:	00 00                	add    BYTE PTR [eax],al
3000262f:	00 00                	add    BYTE PTR [eax],al
30002631:	41                   	inc    ecx
30002632:	0e                   	push   cs
30002633:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002639:	02 5c c5 0c          	add    bl,BYTE PTR [ebp+eax*8+0xc]
3000263d:	04 04                	add    al,0x4
3000263f:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
30002642:	00 00                	add    BYTE PTR [eax],al
30002644:	48                   	dec    eax
30002645:	06                   	push   es
30002646:	00 00                	add    BYTE PTR [eax],al
30002648:	a8 e8                	test   al,0xe8
3000264a:	ff                   	(bad)  
3000264b:	ff                   	(bad)  
3000264c:	7d 01                	jge    3000264f <__x86.get_pc_thunk.cx+0x657>
3000264e:	00 00                	add    BYTE PTR [eax],al
30002650:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002653:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002659:	46                   	inc    esi
3000265a:	87 03                	xchg   DWORD PTR [ebx],eax
3000265c:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
3000265f:	05 03 70 01 c3       	add    eax,0xc3017003
30002664:	41                   	inc    ecx
30002665:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002669:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000266c:	04 00                	add    al,0x0
3000266e:	00 00                	add    BYTE PTR [eax],al
30002670:	1c 00                	sbb    al,0x0
30002672:	00 00                	add    BYTE PTR [eax],al
30002674:	78 06                	js     3000267c <__x86.get_pc_thunk.cx+0x684>
30002676:	00 00                	add    BYTE PTR [eax],al
30002678:	f8                   	clc    
30002679:	e9 ff ff 1d 00       	jmp    301e267d <ticksToWait+0x1df0fd>
3000267e:	00 00                	add    BYTE PTR [eax],al
30002680:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002683:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002689:	59                   	pop    ecx
3000268a:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000268d:	04 00                	add    al,0x0
3000268f:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
30002692:	00 00                	add    BYTE PTR [eax],al
30002694:	98                   	cwde   
30002695:	06                   	push   es
30002696:	00 00                	add    BYTE PTR [eax],al
30002698:	f8                   	clc    
30002699:	e9 ff ff 9c 01       	jmp    319d269d <ticksToWait+0x19cf11d>
3000269e:	00 00                	add    BYTE PTR [eax],al
300026a0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300026a3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026a9:	46                   	inc    esi
300026aa:	87 03                	xchg   DWORD PTR [ebx],eax
300026ac:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
300026af:	05 03 8f 01 c3       	add    eax,0xc3018f03
300026b4:	41                   	inc    ecx
300026b5:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
300026b9:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300026bc:	04 00                	add    al,0x0
300026be:	00 00                	add    BYTE PTR [eax],al
300026c0:	20 00                	and    BYTE PTR [eax],al
300026c2:	00 00                	add    BYTE PTR [eax],al
300026c4:	c8 06 00 00          	enter  0x6,0x0
300026c8:	64                   	fs
300026c9:	eb ff                	jmp    300026ca <__x86.get_pc_thunk.cx+0x6d2>
300026cb:	ff b5 00 00 00 00    	push   DWORD PTR [ebp+0x0]
300026d1:	41                   	inc    ecx
300026d2:	0e                   	push   cs
300026d3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026d9:	44                   	inc    esp
300026da:	83 03 02             	add    DWORD PTR [ebx],0x2
300026dd:	ad                   	lods   eax,DWORD PTR ds:[esi]
300026de:	c5 c3 0c             	(bad)  
300026e1:	04 04                	add    al,0x4
300026e3:	00 20                	add    BYTE PTR [eax],ah
300026e5:	00 00                	add    BYTE PTR [eax],al
300026e7:	00 ec                	add    ah,ch
300026e9:	06                   	push   es
300026ea:	00 00                	add    BYTE PTR [eax],al
300026ec:	f5                   	cmc    
300026ed:	eb ff                	jmp    300026ee <__x86.get_pc_thunk.cx+0x6f6>
300026ef:	ff 9e 00 00 00 00    	call   FWORD PTR [esi+0x0]
300026f5:	41                   	inc    ecx
300026f6:	0e                   	push   cs
300026f7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026fd:	44                   	inc    esp
300026fe:	83 03 02             	add    DWORD PTR [ebx],0x2
30002701:	96                   	xchg   esi,eax
30002702:	c5 c3 0c             	(bad)  
30002705:	04 04                	add    al,0x4
30002707:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3000270a:	00 00                	add    BYTE PTR [eax],al
3000270c:	10 07                	adc    BYTE PTR [edi],al
3000270e:	00 00                	add    BYTE PTR [eax],al
30002710:	70 ec                	jo     300026fe <__x86.get_pc_thunk.cx+0x706>
30002712:	ff                   	(bad)  
30002713:	ff 29                	jmp    FWORD PTR [ecx]
30002715:	00 00                	add    BYTE PTR [eax],al
30002717:	00 00                	add    BYTE PTR [eax],al
30002719:	41                   	inc    ecx
3000271a:	0e                   	push   cs
3000271b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002721:	65 c5 0c 04          	lds    ecx,FWORD PTR gs:[esp+eax*1]
30002725:	04 00                	add    al,0x0
30002727:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
3000272a:	00 00                	add    BYTE PTR [eax],al
3000272c:	30 07                	xor    BYTE PTR [edi],al
3000272e:	00 00                	add    BYTE PTR [eax],al
30002730:	79 ec                	jns    3000271e <__x86.get_pc_thunk.cx+0x726>
30002732:	ff                   	(bad)  
30002733:	ff 19                	call   FWORD PTR [ecx]
30002735:	03 00                	add    eax,DWORD PTR [eax]
30002737:	00 00                	add    BYTE PTR [eax],al
30002739:	41                   	inc    ecx
3000273a:	0e                   	push   cs
3000273b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002741:	44                   	inc    esp
30002742:	83 03 03             	add    DWORD PTR [ebx],0x3
30002745:	10 03                	adc    BYTE PTR [ebx],al
30002747:	c3                   	ret    
30002748:	41                   	inc    ecx
30002749:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000274c:	04 00                	add    al,0x0
3000274e:	00 00                	add    BYTE PTR [eax],al
30002750:	20 00                	and    BYTE PTR [eax],al
30002752:	00 00                	add    BYTE PTR [eax],al
30002754:	58                   	pop    eax
30002755:	07                   	pop    es
30002756:	00 00                	add    BYTE PTR [eax],al
30002758:	6a ef                	push   0xffffffef
3000275a:	ff                   	(bad)  
3000275b:	ff                   	(bad)  
3000275c:	3f                   	aas    
3000275d:	00 00                	add    BYTE PTR [eax],al
3000275f:	00 00                	add    BYTE PTR [eax],al
30002761:	41                   	inc    ecx
30002762:	0e                   	push   cs
30002763:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002769:	44                   	inc    esp
3000276a:	83 03 77             	add    DWORD PTR [ebx],0x77
3000276d:	c5 c3 0c             	(bad)  
30002770:	04 04                	add    al,0x4
30002772:	00 00                	add    BYTE PTR [eax],al
30002774:	20 00                	and    BYTE PTR [eax],al
30002776:	00 00                	add    BYTE PTR [eax],al
30002778:	7c 07                	jl     30002781 <__x86.get_pc_thunk.cx+0x789>
3000277a:	00 00                	add    BYTE PTR [eax],al
3000277c:	85 ef                	test   edi,ebp
3000277e:	ff                   	(bad)  
3000277f:	ff                   	(bad)  
30002780:	3e 00 00             	add    BYTE PTR ds:[eax],al
30002783:	00 00                	add    BYTE PTR [eax],al
30002785:	41                   	inc    ecx
30002786:	0e                   	push   cs
30002787:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000278d:	44                   	inc    esp
3000278e:	83 03 76             	add    DWORD PTR [ebx],0x76
30002791:	c5 c3 0c             	(bad)  
30002794:	04 04                	add    al,0x4
30002796:	00 00                	add    BYTE PTR [eax],al
30002798:	2c 00                	sub    al,0x0
3000279a:	00 00                	add    BYTE PTR [eax],al
3000279c:	a0 07 00 00 9f       	mov    al,ds:0x9f000007
300027a1:	ef                   	out    dx,eax
300027a2:	ff                   	(bad)  
300027a3:	ff 57 08             	call   DWORD PTR [edi+0x8]
300027a6:	00 00                	add    BYTE PTR [eax],al
300027a8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300027ab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300027b1:	46                   	inc    esi
300027b2:	87 03                	xchg   DWORD PTR [ebx],eax
300027b4:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
300027b7:	05 03 4a 08 c3       	add    eax,0xc3084a03
300027bc:	41                   	inc    ecx
300027bd:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
300027c1:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300027c4:	04 00                	add    al,0x0
300027c6:	00 00                	add    BYTE PTR [eax],al
300027c8:	10 00                	adc    BYTE PTR [eax],al
300027ca:	00 00                	add    BYTE PTR [eax],al
300027cc:	d0 07                	rol    BYTE PTR [edi],1
300027ce:	00 00                	add    BYTE PTR [eax],al
300027d0:	28 f8                	sub    al,bh
300027d2:	ff                   	(bad)  
300027d3:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
300027d6:	00 00                	add    BYTE PTR [eax],al
300027d8:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynsym:

300027dc <.dynsym>:
	...
300027ec:	a3 00 00 00 6c       	mov    ds:0x6c000000,eax
300027f1:	0d 00 30 40 00       	or     eax,0x403000
300027f6:	00 00                	add    BYTE PTR [eax],al
300027f8:	12 00                	adc    al,BYTE PTR [eax]
300027fa:	01 00                	add    DWORD PTR [eax],eax
300027fc:	56                   	push   esi
300027fd:	00 00                	add    BYTE PTR [eax],al
300027ff:	00 cb                	add    bl,cl
30002801:	05 00 30 1d 00       	add    eax,0x1d3000
30002806:	00 00                	add    BYTE PTR [eax],al
30002808:	12 00                	adc    al,BYTE PTR [eax]
3000280a:	01 00                	add    DWORD PTR [eax],eax
3000280c:	45                   	inc    ebp
3000280d:	00 00                	add    BYTE PTR [eax],al
3000280f:	00 64 04 00          	add    BYTE PTR [esp+eax*1+0x0],ah
30002813:	30 34 00             	xor    BYTE PTR [eax+eax*1],dh
30002816:	00 00                	add    BYTE PTR [eax],al
30002818:	12 00                	adc    al,BYTE PTR [eax]
3000281a:	01 00                	add    DWORD PTR [eax],eax
3000281c:	36 00 00             	add    BYTE PTR ss:[eax],al
3000281f:	00 4c 02 00          	add    BYTE PTR [edx+eax*1+0x0],cl
30002823:	30 d1                	xor    cl,dl
30002825:	00 00                	add    BYTE PTR [eax],al
30002827:	00 12                	add    BYTE PTR [edx],dl
30002829:	00 01                	add    BYTE PTR [ecx],al
3000282b:	00 31                	add    BYTE PTR [ecx],dh
3000282d:	00 00                	add    BYTE PTR [eax],al
3000282f:	00 1d 02 00 30 2f    	add    BYTE PTR ds:0x2f300002,bl
30002835:	00 00                	add    BYTE PTR [eax],al
30002837:	00 12                	add    BYTE PTR [edx],dl
30002839:	00 01                	add    BYTE PTR [ecx],al
3000283b:	00 82 00 00 00 40    	add    BYTE PTR [edx+0x40000000],al
30002841:	09 00                	or     DWORD PTR [eax],eax
30002843:	30 9b 01 00 00 12    	xor    BYTE PTR [ebx+0x12000001],bl
30002849:	00 01                	add    BYTE PTR [ecx],al
3000284b:	00 17                	add    BYTE PTR [edi],dl
3000284d:	00 00                	add    BYTE PTR [eax],al
3000284f:	00 b4 01 00 30 26 00 	add    BYTE PTR [ecx+eax*1+0x263000],dh
30002856:	00 00                	add    BYTE PTR [eax],al
30002858:	12 00                	adc    al,BYTE PTR [eax]
3000285a:	01 00                	add    DWORD PTR [eax],eax
3000285c:	76 00                	jbe    3000285e <__x86.get_pc_thunk.cx+0x866>
3000285e:	00 00                	add    BYTE PTR [eax],al
30002860:	fc                   	cld    
30002861:	06                   	push   es
30002862:	00 30                	add    BYTE PTR [eax],dh
30002864:	e3 01                	jecxz  30002867 <__x86.get_pc_thunk.cx+0x86f>
30002866:	00 00                	add    BYTE PTR [eax],al
30002868:	12 00                	adc    al,BYTE PTR [eax]
3000286a:	01 00                	add    DWORD PTR [eax],eax
3000286c:	4b                   	dec    ebx
3000286d:	00 00                	add    BYTE PTR [eax],al
3000286f:	00 03                	add    BYTE PTR [ebx],al
30002871:	05 00 30 4e 00       	add    eax,0x4e3000
30002876:	00 00                	add    BYTE PTR [eax],al
30002878:	12 00                	adc    al,BYTE PTR [eax]
3000287a:	01 00                	add    DWORD PTR [eax],eax
3000287c:	c9                   	leave  
3000287d:	00 00                	add    BYTE PTR [eax],al
3000287f:	00 f0                	add    al,dh
30002881:	0e                   	push   cs
30002882:	00 30                	add    BYTE PTR [eax],dh
30002884:	7d 01                	jge    30002887 <__x86.get_pc_thunk.cx+0x88f>
30002886:	00 00                	add    BYTE PTR [eax],al
30002888:	12 00                	adc    al,BYTE PTR [eax]
3000288a:	01 00                	add    DWORD PTR [eax],eax
3000288c:	90                   	nop
3000288d:	00 00                	add    BYTE PTR [eax],al
3000288f:	00 a4 0b 00 30 10 00 	add    BYTE PTR [ebx+ecx*1+0x103000],ah
30002896:	00 00                	add    BYTE PTR [eax],al
30002898:	12 00                	adc    al,BYTE PTR [eax]
3000289a:	01 00                	add    DWORD PTR [eax],eax
3000289c:	66                   	data16
3000289d:	00 00                	add    BYTE PTR [eax],al
3000289f:	00 a9 13 00 30 19    	add    BYTE PTR [ecx+0x19300013],ch
300028a5:	03 00                	add    eax,DWORD PTR [eax]
300028a7:	00 12                	add    BYTE PTR [edx],dl
300028a9:	00 01                	add    BYTE PTR [ecx],al
300028ab:	00 d9                	add    cl,bl
300028ad:	00 00                	add    BYTE PTR [eax],al
300028af:	00 90 10 00 30 9c    	add    BYTE PTR [eax-0x63cffff0],dl
300028b5:	01 00                	add    DWORD PTR [eax],eax
300028b7:	00 12                	add    BYTE PTR [edx],dl
300028b9:	00 01                	add    BYTE PTR [ecx],al
300028bb:	00 3b                	add    BYTE PTR [ebx],bh
300028bd:	00 00                	add    BYTE PTR [eax],al
300028bf:	00 e1                	add    cl,ah
300028c1:	03 00                	add    eax,DWORD PTR [eax]
300028c3:	30 64 00 00          	xor    BYTE PTR [eax+eax*1+0x0],ah
300028c7:	00 12                	add    BYTE PTR [edx],dl
300028c9:	00 01                	add    BYTE PTR [ecx],al
300028cb:	00 95 00 00 00 5c    	add    BYTE PTR [ebp+0x5c000000],dl
300028d1:	0c 00                	or     al,0x0
300028d3:	30 3e                	xor    BYTE PTR [esi],bh
300028d5:	00 00                	add    BYTE PTR [eax],al
300028d7:	00 12                	add    BYTE PTR [edx],dl
300028d9:	00 01                	add    BYTE PTR [ecx],al
300028db:	00 51 00             	add    BYTE PTR [ecx+0x0],dl
300028de:	00 00                	add    BYTE PTR [eax],al
300028e0:	97                   	xchg   edi,eax
300028e1:	05 00 30 34 00       	add    eax,0x343000
300028e6:	00 00                	add    BYTE PTR [eax],al
300028e8:	12 00                	adc    al,BYTE PTR [eax]
300028ea:	01 00                	add    DWORD PTR [eax],eax
300028ec:	07                   	pop    es
300028ed:	01 00                	add    DWORD PTR [eax],eax
300028ef:	00 3f                	add    BYTE PTR [edi],bh
300028f1:	17                   	pop    ss
300028f2:	00 30                	add    BYTE PTR [eax],dh
300028f4:	57                   	push   edi
300028f5:	08 00                	or     BYTE PTR [eax],al
300028f7:	00 12                	add    BYTE PTR [edx],dl
300028f9:	00 01                	add    BYTE PTR [ecx],al
300028fb:	00 b9 00 00 00 28    	add    BYTE PTR [ecx+0x28000000],bh
30002901:	0e                   	push   cs
30002902:	00 30                	add    BYTE PTR [eax],dh
30002904:	67 00 00             	add    BYTE PTR [bx+si],al
30002907:	00 12                	add    BYTE PTR [edx],dl
30002909:	00 01                	add    BYTE PTR [ecx],al
3000290b:	00 c1                	add    cl,al
3000290d:	00 00                	add    BYTE PTR [eax],al
3000290f:	00 90 0e 00 30 60    	add    BYTE PTR [eax+0x6030000e],dl
30002915:	00 00                	add    BYTE PTR [eax],al
30002917:	00 12                	add    BYTE PTR [edx],dl
30002919:	00 01                	add    BYTE PTR [ecx],al
3000291b:	00 10                	add    BYTE PTR [eax],dl
3000291d:	00 00                	add    BYTE PTR [eax],al
3000291f:	00 1c 01             	add    BYTE PTR [ecx+eax*1],bl
30002922:	00 30                	add    BYTE PTR [eax],dh
30002924:	97                   	xchg   edi,eax
30002925:	00 00                	add    BYTE PTR [eax],al
30002927:	00 12                	add    BYTE PTR [edx],dl
30002929:	00 01                	add    BYTE PTR [ecx],al
3000292b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3000292e:	00 00                	add    BYTE PTR [eax],al
30002930:	00 00                	add    BYTE PTR [eax],al
30002932:	13 00                	adc    eax,DWORD PTR [eax]
30002934:	00 00                	add    BYTE PTR [eax],al
30002936:	00 00                	add    BYTE PTR [eax],al
30002938:	10 00                	adc    BYTE PTR [eax],al
3000293a:	01 00                	add    DWORD PTR [eax],eax
3000293c:	f1                   	icebp  
3000293d:	00 00                	add    BYTE PTR [eax],al
3000293f:	00 c2                	add    dl,al
30002941:	16                   	push   ss
30002942:	00 30                	add    BYTE PTR [eax],dh
30002944:	3f                   	aas    
30002945:	00 00                	add    BYTE PTR [eax],al
30002947:	00 12                	add    BYTE PTR [edx],dl
30002949:	00 01                	add    BYTE PTR [ecx],al
3000294b:	00 89 00 00 00 dc    	add    BYTE PTR [ecx-0x24000000],cl
30002951:	0a 00                	or     al,BYTE PTR [eax]
30002953:	30 c7                	xor    bh,al
30002955:	00 00                	add    BYTE PTR [eax],al
30002957:	00 12                	add    BYTE PTR [edx],dl
30002959:	00 01                	add    BYTE PTR [ecx],al
3000295b:	00 e0                	add    al,ah
3000295d:	00 00                	add    BYTE PTR [eax],al
3000295f:	00 2c 12             	add    BYTE PTR [edx+edx*1],ch
30002962:	00 30                	add    BYTE PTR [eax],dh
30002964:	b5 00                	mov    ch,0x0
30002966:	00 00                	add    BYTE PTR [eax],al
30002968:	12 00                	adc    al,BYTE PTR [eax]
3000296a:	01 00                	add    DWORD PTR [eax],eax
3000296c:	09 01                	or     DWORD PTR [ecx],eax
3000296e:	00 00                	add    BYTE PTR [eax],al
30002970:	80 13 00             	adc    BYTE PTR [ebx],0x0
30002973:	30 29                	xor    BYTE PTR [ecx],ch
30002975:	00 00                	add    BYTE PTR [eax],al
30002977:	00 12                	add    BYTE PTR [edx],dl
30002979:	00 01                	add    BYTE PTR [ecx],al
3000297b:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
3000297e:	00 00                	add    BYTE PTR [eax],al
30002980:	da 01                	fiadd  DWORD PTR [ecx]
30002982:	00 30                	add    BYTE PTR [eax],dh
30002984:	43                   	inc    ebx
30002985:	00 00                	add    BYTE PTR [eax],al
30002987:	00 12                	add    BYTE PTR [edx],dl
30002989:	00 01                	add    BYTE PTR [ecx],al
3000298b:	00 aa 00 00 00 0c    	add    BYTE PTR [edx+0xc000000],ch
30002991:	0d 00 30 5e 00       	or     eax,0x5e3000
30002996:	00 00                	add    BYTE PTR [eax],al
30002998:	12 00                	adc    al,BYTE PTR [eax]
3000299a:	01 00                	add    DWORD PTR [eax],eax
3000299c:	6f                   	outs   dx,DWORD PTR ds:[esi]
3000299d:	00 00                	add    BYTE PTR [eax],al
3000299f:	00 2a                	add    BYTE PTR [edx],ch
300029a1:	06                   	push   es
300029a2:	00 30                	add    BYTE PTR [eax],dh
300029a4:	20 00                	and    BYTE PTR [eax],al
300029a6:	00 00                	add    BYTE PTR [eax],al
300029a8:	12 00                	adc    al,BYTE PTR [eax]
300029aa:	01 00                	add    DWORD PTR [eax],eax
300029ac:	e8 00 00 00 e1       	call   110029b1 <sysEnter_Vector+0x10ed29b1>
300029b1:	12 00                	adc    al,BYTE PTR [eax]
300029b3:	30 9e 00 00 00 12    	xor    BYTE PTR [esi+0x12000000],bl
300029b9:	00 01                	add    BYTE PTR [ecx],al
300029bb:	00 08                	add    BYTE PTR [eax],cl
300029bd:	00 00                	add    BYTE PTR [eax],al
300029bf:	00 70 00             	add    BYTE PTR [eax+0x0],dh
300029c2:	00 30                	add    BYTE PTR [eax],dh
300029c4:	55                   	push   ebp
300029c5:	00 00                	add    BYTE PTR [eax],al
300029c7:	00 12                	add    BYTE PTR [edx],dl
300029c9:	00 01                	add    BYTE PTR [ecx],al
300029cb:	00 b1 00 00 00 ac    	add    BYTE PTR [ecx-0x54000000],dh
300029d1:	0d 00 30 47 00       	or     eax,0x473000
300029d6:	00 00                	add    BYTE PTR [eax],al
300029d8:	12 00                	adc    al,BYTE PTR [eax]
300029da:	01 00                	add    DWORD PTR [eax],eax
300029dc:	fb                   	sti    
300029dd:	00 00                	add    BYTE PTR [eax],al
300029df:	00 01                	add    BYTE PTR [ecx],al
300029e1:	17                   	pop    ss
300029e2:	00 30                	add    BYTE PTR [eax],dh
300029e4:	3e 00 00             	add    BYTE PTR ds:[eax],al
300029e7:	00 12                	add    BYTE PTR [edx],dl
300029e9:	00 01                	add    BYTE PTR [ecx],al
300029eb:	00 5e 00             	add    BYTE PTR [esi+0x0],bl
300029ee:	00 00                	add    BYTE PTR [eax],al
300029f0:	e8 05 00 30 42       	call   723029fa <ticksToWait+0x422ff47a>
300029f5:	00 00                	add    BYTE PTR [eax],al
300029f7:	00 12                	add    BYTE PTR [edx],dl
300029f9:	00 01                	add    BYTE PTR [ecx],al
300029fb:	00 9c 00 00 00 f4 0d 	add    BYTE PTR [eax+eax*1+0xdf40000],bl
30002a02:	00 30                	add    BYTE PTR [eax],dh
30002a04:	31 00                	xor    DWORD PTR [eax],eax
30002a06:	00 00                	add    BYTE PTR [eax],al
30002a08:	12 00                	adc    al,BYTE PTR [eax]
30002a0a:	01 00                	add    DWORD PTR [eax],eax
30002a0c:	01 00                	add    DWORD PTR [eax],eax
30002a0e:	00 00                	add    BYTE PTR [eax],al
30002a10:	00 00                	add    BYTE PTR [eax],al
30002a12:	00 30                	add    BYTE PTR [eax],dh
30002a14:	38 00                	cmp    BYTE PTR [eax],al
30002a16:	00 00                	add    BYTE PTR [eax],al
30002a18:	12 00                	adc    al,BYTE PTR [eax]
30002a1a:	01 00                	add    DWORD PTR [eax],eax
30002a1c:	d1 00                	rol    DWORD PTR [eax],1
30002a1e:	00 00                	add    BYTE PTR [eax],al
30002a20:	70 10                	jo     30002a32 <__x86.get_pc_thunk.cx+0xa3a>
30002a22:	00 30                	add    BYTE PTR [eax],dh
30002a24:	1d 00 00 00 12       	sbb    eax,0x12000000
30002a29:	00 01                	add    BYTE PTR [ecx],al
30002a2b:	00 7d 00             	add    BYTE PTR [ebp+0x0],bh
30002a2e:	00 00                	add    BYTE PTR [eax],al
30002a30:	df 08                	fisttp WORD PTR [eax]
30002a32:	00 30                	add    BYTE PTR [eax],dh
30002a34:	39 00                	cmp    DWORD PTR [eax],eax
30002a36:	00 00                	add    BYTE PTR [eax],al
30002a38:	12 00                	adc    al,BYTE PTR [eax]
30002a3a:	01 00                	add    DWORD PTR [eax],eax

Disassembly of section .dynstr:

30002a3c <.dynstr>:
30002a3c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a3f:	72 63                	jb     30002aa4 <__x86.get_pc_thunk.cx+0xaac>
30002a41:	68 72 00 73 74       	push   0x74730072
30002a46:	72 63                	jb     30002aab <__x86.get_pc_thunk.cx+0xab3>
30002a48:	73 70                	jae    30002aba <__x86.get_pc_thunk.cx+0xac2>
30002a4a:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002a4b:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a4e:	72 74                	jb     30002ac4 <__x86.get_pc_thunk.cx+0xacc>
30002a50:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002a51:	6b 00 70             	imul   eax,DWORD PTR [eax],0x70
30002a54:	75 74                	jne    30002aca <__x86.get_pc_thunk.cx+0xad2>
30002a56:	73 00                	jae    30002a58 <__x86.get_pc_thunk.cx+0xa60>
30002a58:	73 79                	jae    30002ad3 <__x86.get_pc_thunk.cx+0xadb>
30002a5a:	73 45                	jae    30002aa1 <__x86.get_pc_thunk.cx+0xaa9>
30002a5c:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002a5d:	74 65                	je     30002ac4 <__x86.get_pc_thunk.cx+0xacc>
30002a5f:	72 5f                	jb     30002ac0 <__x86.get_pc_thunk.cx+0xac8>
30002a61:	56                   	push   esi
30002a62:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
30002a67:	00 70 75             	add    BYTE PTR [eax+0x75],dh
30002a6a:	74 63                	je     30002acf <__x86.get_pc_thunk.cx+0xad7>
30002a6c:	00 67 65             	add    BYTE PTR [edi+0x65],ah
30002a6f:	74 63                	je     30002ad4 <__x86.get_pc_thunk.cx+0xadc>
30002a71:	00 67 65             	add    BYTE PTR [edi+0x65],ah
30002a74:	74 73                	je     30002ae9 <__x86.get_pc_thunk.cx+0xaf1>
30002a76:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002a7a:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
30002a7d:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002a7e:	69 74 00 70 72 69 6e 	imul   esi,DWORD PTR [eax+eax*1+0x70],0x746e6972
30002a85:	74 
30002a86:	00 73 6c             	add    BYTE PTR [ebx+0x6c],dh
30002a89:	65                   	gs
30002a8a:	65                   	gs
30002a8b:	70 00                	jo     30002a8d <__x86.get_pc_thunk.cx+0xa95>
30002a8d:	65                   	gs
30002a8e:	78 65                	js     30002af5 <__x86.get_pc_thunk.cx+0xafd>
30002a90:	63 00                	arpl   WORD PTR [eax],ax
30002a92:	77 61                	ja     30002af5 <__x86.get_pc_thunk.cx+0xafd>
30002a94:	69 74 70 69 64 00 67 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x65670064
30002a9b:	65 
30002a9c:	74 74                	je     30002b12 <__x86.get_pc_thunk.cx+0xb1a>
30002a9e:	69 6d 65 00 67 6d 74 	imul   ebp,DWORD PTR [ebp+0x65],0x746d6700
30002aa5:	69 6d 65 5f 72 00 67 	imul   ebp,DWORD PTR [ebp+0x65],0x6700725f
30002aac:	65                   	gs
30002aad:	74 63                	je     30002b12 <__x86.get_pc_thunk.cx+0xb1a>
30002aaf:	77 64                	ja     30002b15 <__x86.get_pc_thunk.cx+0xb1d>
30002ab1:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
30002ab4:	6c                   	ins    BYTE PTR es:[edi],dx
30002ab5:	6c                   	ins    BYTE PTR es:[edi],dx
30002ab6:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002ab7:	63 00                	arpl   WORD PTR [eax],ax
30002ab9:	66                   	data16
30002aba:	72 65                	jb     30002b21 <__x86.get_pc_thunk.cx+0xb29>
30002abc:	65 00 6d 65          	add    BYTE PTR gs:[ebp+0x65],ch
30002ac0:	6d                   	ins    DWORD PTR es:[edi],dx
30002ac1:	63 70 79             	arpl   WORD PTR [eax+0x79],si
30002ac4:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
30002ac7:	6d                   	ins    DWORD PTR es:[edi],dx
30002ac8:	73 65                	jae    30002b2f <__x86.get_pc_thunk.cx+0xb37>
30002aca:	74 00                	je     30002acc <__x86.get_pc_thunk.cx+0xad4>
30002acc:	6d                   	ins    DWORD PTR es:[edi],dx
30002acd:	6d                   	ins    DWORD PTR es:[edi],dx
30002ace:	61                   	popa   
30002acf:	70 00                	jo     30002ad1 <__x86.get_pc_thunk.cx+0xad9>
30002ad1:	73 74                	jae    30002b47 <__x86.get_pc_thunk.cx+0xb4f>
30002ad3:	72 63                	jb     30002b38 <__x86.get_pc_thunk.cx+0xb40>
30002ad5:	61                   	popa   
30002ad6:	74 00                	je     30002ad8 <__x86.get_pc_thunk.cx+0xae0>
30002ad8:	73 74                	jae    30002b4e <__x86.get_pc_thunk.cx+0xb56>
30002ada:	72 6c                	jb     30002b48 <__x86.get_pc_thunk.cx+0xb50>
30002adc:	65 6e                	outs   dx,BYTE PTR gs:[esi]
30002ade:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002ae1:	72 63                	jb     30002b46 <__x86.get_pc_thunk.cx+0xb4e>
30002ae3:	70 79                	jo     30002b5e <__x86.get_pc_thunk.cx+0xb66>
30002ae5:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002ae8:	72 63                	jb     30002b4d <__x86.get_pc_thunk.cx+0xb55>
30002aea:	6d                   	ins    DWORD PTR es:[edi],dx
30002aeb:	70 00                	jo     30002aed <__x86.get_pc_thunk.cx+0xaf5>
30002aed:	73 74                	jae    30002b63 <__x86.get_pc_thunk.cx+0xb6b>
30002aef:	72 63                	jb     30002b54 <__x86.get_pc_thunk.cx+0xb5c>
30002af1:	70 79                	jo     30002b6c <__x86.get_pc_thunk.cx+0xb74>
30002af3:	63 00                	arpl   WORD PTR [eax],ax
30002af5:	73 74                	jae    30002b6b <__x86.get_pc_thunk.cx+0xb73>
30002af7:	72 6e                	jb     30002b67 <__x86.get_pc_thunk.cx+0xb6f>
30002af9:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
30002afc:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002aff:	72 6e                	jb     30002b6f <__x86.get_pc_thunk.cx+0xb77>
30002b01:	63 70 79             	arpl   WORD PTR [eax+0x79],si
30002b04:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002b07:	72 74                	jb     30002b7d <__x86.get_pc_thunk.cx+0xb85>
30002b09:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002b0a:	75 6c                	jne    30002b78 <__x86.get_pc_thunk.cx+0xb80>
30002b0c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002b0f:	72 6c                	jb     30002b7d <__x86.get_pc_thunk.cx+0xb85>
30002b11:	65                   	gs
30002b12:	66                   	data16
30002b13:	74 00                	je     30002b15 <__x86.get_pc_thunk.cx+0xb1d>
30002b15:	73 74                	jae    30002b8b <__x86.get_pc_thunk.cx+0xb93>
30002b17:	72 74                	jb     30002b8d <__x86.get_pc_thunk.cx+0xb95>
30002b19:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002b1a:	6c                   	ins    BYTE PTR es:[edi],dx
30002b1b:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002b1e:	72 74                	jb     30002b94 <__x86.get_pc_thunk.cx+0xb9c>
30002b20:	72 69                	jb     30002b8b <__x86.get_pc_thunk.cx+0xb93>
30002b22:	6d                   	ins    DWORD PTR es:[edi],dx
30002b23:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002b26:	72 74                	jb     30002b9c <__x86.get_pc_thunk.cx+0xba4>
30002b28:	72 69                	jb     30002b93 <__x86.get_pc_thunk.cx+0xb9b>
30002b2a:	6d                   	ins    DWORD PTR es:[edi],dx
30002b2b:	32 00                	xor    al,BYTE PTR [eax]
30002b2d:	6c                   	ins    BYTE PTR es:[edi],dx
30002b2e:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002b2f:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
30002b32:	74 69                	je     30002b9d <__x86.get_pc_thunk.cx+0xba5>
30002b34:	6d                   	ins    DWORD PTR es:[edi],dx
30002b35:	65 00 6c 6f 63       	add    BYTE PTR gs:[edi+ebp*2+0x63],ch
30002b3a:	61                   	popa   
30002b3b:	6c                   	ins    BYTE PTR es:[edi],dx
30002b3c:	74 69                	je     30002ba7 <__x86.get_pc_thunk.cx+0xbaf>
30002b3e:	6d                   	ins    DWORD PTR es:[edi],dx
30002b3f:	65                   	gs
30002b40:	5f                   	pop    edi
30002b41:	72 00                	jb     30002b43 <__x86.get_pc_thunk.cx+0xb4b>
30002b43:	6d                   	ins    DWORD PTR es:[edi],dx
30002b44:	6b 74 69 6d 65       	imul   esi,DWORD PTR [ecx+ebp*2+0x6d],0x65
	...

Disassembly of section .hash:

30002b4c <.hash>:
30002b4c:	25 00 00 00 26       	and    eax,0x26000000
30002b51:	00 00                	add    BYTE PTR [eax],al
30002b53:	00 12                	add    BYTE PTR [edx],dl
30002b55:	00 00                	add    BYTE PTR [eax],al
30002b57:	00 1b                	add    BYTE PTR [ebx],bl
30002b59:	00 00                	add    BYTE PTR [eax],al
30002b5b:	00 1a                	add    BYTE PTR [edx],bl
30002b5d:	00 00                	add    BYTE PTR [eax],al
30002b5f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002b62:	00 00                	add    BYTE PTR [eax],al
30002b64:	16                   	push   ss
	...
30002b89:	00 00                	add    BYTE PTR [eax],al
30002b8b:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
30002b8e:	00 00                	add    BYTE PTR [eax],al
30002b90:	0d 00 00 00 00       	or     eax,0x0
30002b95:	00 00                	add    BYTE PTR [eax],al
30002b97:	00 1f                	add    BYTE PTR [edi],bl
30002b99:	00 00                	add    BYTE PTR [eax],al
30002b9b:	00 1e                	add    BYTE PTR [esi],bl
30002b9d:	00 00                	add    BYTE PTR [eax],al
30002b9f:	00 00                	add    BYTE PTR [eax],al
30002ba1:	00 00                	add    BYTE PTR [eax],al
30002ba3:	00 03                	add    BYTE PTR [ebx],al
30002ba5:	00 00                	add    BYTE PTR [eax],al
30002ba7:	00 20                	add    BYTE PTR [eax],ah
30002ba9:	00 00                	add    BYTE PTR [eax],al
30002bab:	00 18                	add    BYTE PTR [eax],bl
30002bad:	00 00                	add    BYTE PTR [eax],al
30002baf:	00 08                	add    BYTE PTR [eax],cl
30002bb1:	00 00                	add    BYTE PTR [eax],al
30002bb3:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
	...
30002bbe:	00 00                	add    BYTE PTR [eax],al
30002bc0:	0b 00                	or     eax,DWORD PTR [eax]
30002bc2:	00 00                	add    BYTE PTR [eax],al
30002bc4:	0e                   	push   cs
30002bc5:	00 00                	add    BYTE PTR [eax],al
30002bc7:	00 22                	add    BYTE PTR [edx],ah
30002bc9:	00 00                	add    BYTE PTR [eax],al
30002bcb:	00 00                	add    BYTE PTR [eax],al
30002bcd:	00 00                	add    BYTE PTR [eax],al
30002bcf:	00 25 00 00 00 19    	add    BYTE PTR ds:0x19000000,ah
30002bd5:	00 00                	add    BYTE PTR [eax],al
30002bd7:	00 00                	add    BYTE PTR [eax],al
30002bd9:	00 00                	add    BYTE PTR [eax],al
30002bdb:	00 23                	add    BYTE PTR [ebx],ah
30002bdd:	00 00                	add    BYTE PTR [eax],al
30002bdf:	00 1d 00 00 00 00    	add    BYTE PTR ds:0x0,bl
	...
30002bf5:	00 00                	add    BYTE PTR [eax],al
30002bf7:	00 02                	add    BYTE PTR [edx],al
	...
30002c0d:	00 00                	add    BYTE PTR [eax],al
30002c0f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
30002c12:	00 00                	add    BYTE PTR [eax],al
30002c14:	00 00                	add    BYTE PTR [eax],al
30002c16:	00 00                	add    BYTE PTR [eax],al
30002c18:	0a 00                	or     al,BYTE PTR [eax]
	...
30002c32:	00 00                	add    BYTE PTR [eax],al
30002c34:	0f 00 00             	sldt   WORD PTR [eax]
30002c37:	00 09                	add    BYTE PTR [ecx],cl
30002c39:	00 00                	add    BYTE PTR [eax],al
30002c3b:	00 11                	add    BYTE PTR [ecx],dl
30002c3d:	00 00                	add    BYTE PTR [eax],al
30002c3f:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
30002c45:	00 00                	add    BYTE PTR [eax],al
30002c47:	00 10                	add    BYTE PTR [eax],dl
30002c49:	00 00                	add    BYTE PTR [eax],al
30002c4b:	00 17                	add    BYTE PTR [edi],dl
30002c4d:	00 00                	add    BYTE PTR [eax],al
30002c4f:	00 06                	add    BYTE PTR [esi],al
30002c51:	00 00                	add    BYTE PTR [eax],al
30002c53:	00 05 00 00 00 00    	add    BYTE PTR ds:0x0,al
30002c59:	00 00                	add    BYTE PTR [eax],al
30002c5b:	00 13                	add    BYTE PTR [ebx],dl
30002c5d:	00 00                	add    BYTE PTR [eax],al
30002c5f:	00 07                	add    BYTE PTR [edi],al
30002c61:	00 00                	add    BYTE PTR [eax],al
30002c63:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
30002c66:	00 00                	add    BYTE PTR [eax],al
30002c68:	01 00                	add    DWORD PTR [eax],eax
	...
30002c72:	00 00                	add    BYTE PTR [eax],al
30002c74:	21 00                	and    DWORD PTR [eax],eax
	...

Disassembly of section .eh_frame:

30002c80 <.eh_frame>:
30002c80:	14 00                	adc    al,0x0
30002c82:	00 00                	add    BYTE PTR [eax],al
30002c84:	00 00                	add    BYTE PTR [eax],al
30002c86:	00 00                	add    BYTE PTR [eax],al
30002c88:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
30002c8b:	00 01                	add    BYTE PTR [ecx],al
30002c8d:	7c 08                	jl     30002c97 <__x86.get_pc_thunk.cx+0xc9f>
30002c8f:	01 1b                	add    DWORD PTR [ebx],ebx
30002c91:	0c 04                	or     al,0x4
30002c93:	04 88                	add    al,0x88
30002c95:	01 00                	add    DWORD PTR [eax],eax
30002c97:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
30002c9a:	00 00                	add    BYTE PTR [eax],al
30002c9c:	1c 00                	sbb    al,0x0
30002c9e:	00 00                	add    BYTE PTR [eax],al
30002ca0:	00 f3                	add    bl,dh
30002ca2:	ff                   	(bad)  
30002ca3:	ff 50 00             	call   DWORD PTR [eax+0x0]
30002ca6:	00 00                	add    BYTE PTR [eax],al
30002ca8:	00 0e                	add    BYTE PTR [esi],cl
30002caa:	08 46 0e             	or     BYTE PTR [esi+0xe],al
30002cad:	0c 4a                	or     al,0x4a
30002caf:	0f 0b                	ud2    
30002cb1:	74 04                	je     30002cb7 <__x86.get_pc_thunk.cx+0xcbf>
30002cb3:	78 00                	js     30002cb5 <__x86.get_pc_thunk.cx+0xcbd>
30002cb5:	3f                   	aas    
30002cb6:	1a 3b                	sbb    bh,BYTE PTR [ebx]
30002cb8:	2a 32                	sub    dh,BYTE PTR [edx]
30002cba:	24 22                	and    al,0x22
30002cbc:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

30002cc0 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
30002cc0:	01 1b                	add    DWORD PTR [ebx],ebx
30002cc2:	03 3b                	add    edi,DWORD PTR [ebx]
30002cc4:	38 f3                	cmp    bl,dh
30002cc6:	ff                   	(bad)  
30002cc7:	ff                   	(bad)  
30002cc8:	3a 00                	cmp    al,BYTE PTR [eax]
30002cca:	00 00                	add    BYTE PTR [eax],al
30002ccc:	40                   	inc    eax
30002ccd:	d3 ff                	sar    edi,cl
30002ccf:	ff 54 f3 ff          	call   DWORD PTR [ebx+esi*8-0x1]
30002cd3:	ff                   	(bad)  
30002cd4:	78 d3                	js     30002ca9 <__x86.get_pc_thunk.cx+0xcb1>
30002cd6:	ff                   	(bad)  
30002cd7:	ff 74 f3 ff          	push   DWORD PTR [ebx+esi*8-0x1]
30002cdb:	ff b0 d3 ff ff a8    	push   DWORD PTR [eax-0x5700002d]
30002ce1:	f3 ff                	repz (bad) 
30002ce3:	ff 05 d4 ff ff d0    	inc    DWORD PTR ds:0xd0ffffd4
30002ce9:	f3 ff                	repz (bad) 
30002ceb:	ff 5c d4 ff          	call   FWORD PTR [esp+edx*8-0x1]
30002cef:	ff                   	(bad)  
30002cf0:	f8                   	clc    
30002cf1:	f3 ff                	repz (bad) 
30002cf3:	ff f4                	push   esp
30002cf5:	d4 ff                	aam    0xff
30002cf7:	ff 34 f4             	push   DWORD PTR [esp+esi*8]
30002cfa:	ff                   	(bad)  
30002cfb:	ff 1a                	call   FWORD PTR [edx]
30002cfd:	d5 ff                	aad    0xff
30002cff:	ff 58 f4             	call   FWORD PTR [eax-0xc]
30002d02:	ff                   	(bad)  
30002d03:	ff 5d d5             	call   FWORD PTR [ebp-0x2b]
30002d06:	ff                   	(bad)  
30002d07:	ff                   	(bad)  
30002d08:	7c f4                	jl     30002cfe <__GNU_EH_FRAME_HDR+0x3e>
30002d0a:	ff                   	(bad)  
30002d0b:	ff 8c d5 ff ff a0 f4 	dec    DWORD PTR [ebp+edx*8-0xb5f0001]
30002d12:	ff                   	(bad)  
30002d13:	ff 60 d6             	jmp    DWORD PTR [eax-0x2a]
30002d16:	ff                   	(bad)  
30002d17:	ff c4                	inc    esp
30002d19:	f4                   	hlt    
30002d1a:	ff                   	(bad)  
30002d1b:	ff 95 d6 ff ff e8    	call   DWORD PTR [ebp-0x1700002a]
30002d21:	f4                   	hlt    
30002d22:	ff                   	(bad)  
30002d23:	ff c9                	dec    ecx
30002d25:	d6                   	(bad)  
30002d26:	ff                   	(bad)  
30002d27:	ff 0c f5 ff ff fa d6 	dec    DWORD PTR [esi*8-0x29050001]
30002d2e:	ff                   	(bad)  
30002d2f:	ff 30                	push   DWORD PTR [eax]
30002d31:	f5                   	cmc    
30002d32:	ff                   	(bad)  
30002d33:	ff 21                	jmp    DWORD PTR [ecx]
30002d35:	d7                   	xlat   BYTE PTR ds:[ebx]
30002d36:	ff                   	(bad)  
30002d37:	ff 50 f5             	call   DWORD PTR [eax-0xb]
30002d3a:	ff                   	(bad)  
30002d3b:	ff 85 d7 ff ff 74    	inc    DWORD PTR [ebp+0x74ffffd7]
30002d41:	f5                   	cmc    
30002d42:	ff                   	(bad)  
30002d43:	ff a4 d7 ff ff 98 f5 	jmp    DWORD PTR [edi+edx*8-0xa670001]
30002d4a:	ff                   	(bad)  
30002d4b:	ff d8                	call   <internal disassembler error>
30002d4d:	d7                   	xlat   BYTE PTR ds:[ebx]
30002d4e:	ff                   	(bad)  
30002d4f:	ff                   	(bad)  
30002d50:	b8 f5 ff ff 0c       	mov    eax,0xcfffff5
30002d55:	d8 ff                	fdivr  st,st(7)
30002d57:	ff d8                	call   <internal disassembler error>
30002d59:	f5                   	cmc    
30002d5a:	ff                   	(bad)  
30002d5b:	ff 43 d8             	inc    DWORD PTR [ebx-0x28]
30002d5e:	ff                   	(bad)  
30002d5f:	ff                   	(bad)  
30002d60:	fc                   	cld    
30002d61:	f5                   	cmc    
30002d62:	ff                   	(bad)  
30002d63:	ff 91 d8 ff ff 20    	call   DWORD PTR [ecx+0x20ffffd8]
30002d69:	f6 ff                	idiv   bh
30002d6b:	ff ae d8 ff ff 40    	jmp    FWORD PTR [esi+0x40ffffd8]
30002d71:	f6 ff                	idiv   bh
30002d73:	ff d7                	call   edi
30002d75:	d8 ff                	fdivr  st,st(7)
30002d77:	ff 60 f6             	jmp    DWORD PTR [eax-0xa]
30002d7a:	ff                   	(bad)  
30002d7b:	ff 0b                	dec    DWORD PTR [ebx]
30002d7d:	d9 ff                	fcos   
30002d7f:	ff 84 f6 ff ff 28 d9 	inc    DWORD PTR [esi+esi*8-0x26d70001]
30002d86:	ff                   	(bad)  
30002d87:	ff a4 f6 ff ff 6a d9 	jmp    DWORD PTR [esi+esi*8-0x26950001]
30002d8e:	ff                   	(bad)  
30002d8f:	ff c8                	dec    eax
30002d91:	f6 ff                	idiv   bh
30002d93:	ff 8c d9 ff ff e8 f6 	dec    DWORD PTR [ecx+ebx*8-0x9170001]
30002d9a:	ff                   	(bad)  
30002d9b:	ff c0                	inc    eax
30002d9d:	d9 ff                	fcos   
30002d9f:	ff 08                	dec    DWORD PTR [eax]
30002da1:	f7 ff                	idiv   edi
30002da3:	ff                   	(bad)  
30002da4:	3c da                	cmp    al,0xda
30002da6:	ff                   	(bad)  
30002da7:	ff 28                	jmp    FWORD PTR [eax]
30002da9:	f7 ff                	idiv   edi
30002dab:	ff 1f                	call   FWORD PTR [edi]
30002dad:	dc ff                	fdiv   st(7),st
30002daf:	ff 54 f7 ff          	call   DWORD PTR [edi+esi*8-0x1]
30002db3:	ff 58 dc             	call   FWORD PTR [eax-0x24]
30002db6:	ff                   	(bad)  
30002db7:	ff 74 f7 ff          	push   DWORD PTR [edi+esi*8-0x1]
30002dbb:	ff 80 dc ff ff ac    	inc    DWORD PTR [eax-0x53000024]
30002dc1:	f7 ff                	idiv   edi
30002dc3:	ff 1c de             	call   FWORD PTR [esi+ebx*8]
30002dc6:	ff                   	(bad)  
30002dc7:	ff cc                	dec    esp
30002dc9:	f7 ff                	idiv   edi
30002dcb:	ff e4                	jmp    esp
30002dcd:	de ff                	fdivp  st(7),st
30002dcf:	ff ec                	jmp    <internal disassembler error>
30002dd1:	f7 ff                	idiv   edi
30002dd3:	ff f4                	push   esp
30002dd5:	de ff                	fdivp  st(7),st
30002dd7:	ff 0c f8             	dec    DWORD PTR [eax+edi*8]
30002dda:	ff                   	(bad)  
30002ddb:	ff 20                	jmp    DWORD PTR [eax]
30002ddd:	df ff                	(bad)  
30002ddf:	ff 30                	push   DWORD PTR [eax]
30002de1:	f8                   	clc    
30002de2:	ff                   	(bad)  
30002de3:	ff 46 df             	inc    DWORD PTR [esi-0x21]
30002de6:	ff                   	(bad)  
30002de7:	ff 54 f8 ff          	call   DWORD PTR [eax+edi*8-0x1]
30002deb:	ff 9c df ff ff 74 f8 	call   FWORD PTR [edi+ebx*8-0x78b0001]
30002df2:	ff                   	(bad)  
30002df3:	ff da                	call   <internal disassembler error>
30002df5:	df ff                	(bad)  
30002df7:	ff 98 f8 ff ff 4c    	call   FWORD PTR [eax+0x4cfffff8]
30002dfd:	e0 ff                	loopne 30002dfe <__GNU_EH_FRAME_HDR+0x13e>
30002dff:	ff                   	(bad)  
30002e00:	b8 f8 ff ff ac       	mov    eax,0xacfffff8
30002e05:	e0 ff                	loopne 30002e06 <__GNU_EH_FRAME_HDR+0x146>
30002e07:	ff e0                	jmp    eax
30002e09:	f8                   	clc    
30002e0a:	ff                   	(bad)  
30002e0b:	ff ec                	jmp    <internal disassembler error>
30002e0d:	e0 ff                	loopne 30002e0e <__GNU_EH_FRAME_HDR+0x14e>
30002e0f:	ff 00                	inc    DWORD PTR [eax]
30002e11:	f9                   	stc    
30002e12:	ff                   	(bad)  
30002e13:	ff 34 e1             	push   DWORD PTR [ecx+eiz*8]
30002e16:	ff                   	(bad)  
30002e17:	ff 20                	jmp    DWORD PTR [eax]
30002e19:	f9                   	stc    
30002e1a:	ff                   	(bad)  
30002e1b:	ff 68 e1             	jmp    FWORD PTR [eax-0x1f]
30002e1e:	ff                   	(bad)  
30002e1f:	ff 40 f9             	inc    DWORD PTR [eax-0x7]
30002e22:	ff                   	(bad)  
30002e23:	ff d0                	call   eax
30002e25:	e1 ff                	loope  30002e26 <__GNU_EH_FRAME_HDR+0x166>
30002e27:	ff 60 f9             	jmp    DWORD PTR [eax-0x7]
30002e2a:	ff                   	(bad)  
30002e2b:	ff 30                	push   DWORD PTR [eax]
30002e2d:	e2 ff                	loop   30002e2e <__GNU_EH_FRAME_HDR+0x16e>
30002e2f:	ff 80 f9 ff ff b0    	inc    DWORD PTR [eax-0x4f000007]
30002e35:	e3 ff                	jecxz  30002e36 <__GNU_EH_FRAME_HDR+0x176>
30002e37:	ff b0 f9 ff ff d0    	push   DWORD PTR [eax-0x2f000007]
30002e3d:	e3 ff                	jecxz  30002e3e <__GNU_EH_FRAME_HDR+0x17e>
30002e3f:	ff d0                	call   eax
30002e41:	f9                   	stc    
30002e42:	ff                   	(bad)  
30002e43:	ff 6c e5 ff          	jmp    FWORD PTR [ebp+eiz*8-0x1]
30002e47:	ff 00                	inc    DWORD PTR [eax]
30002e49:	fa                   	cli    
30002e4a:	ff                   	(bad)  
30002e4b:	ff 21                	jmp    DWORD PTR [ecx]
30002e4d:	e6 ff                	out    0xff,al
30002e4f:	ff 24 fa             	jmp    DWORD PTR [edx+edi*8]
30002e52:	ff                   	(bad)  
30002e53:	ff c0                	inc    eax
30002e55:	e6 ff                	out    0xff,al
30002e57:	ff 48 fa             	dec    DWORD PTR [eax-0x6]
30002e5a:	ff                   	(bad)  
30002e5b:	ff e9                	jmp    <internal disassembler error>
30002e5d:	e6 ff                	out    0xff,al
30002e5f:	ff 68 fa             	jmp    FWORD PTR [eax-0x6]
30002e62:	ff                   	(bad)  
30002e63:	ff 02                	inc    DWORD PTR [edx]
30002e65:	ea ff ff 90 fa ff ff 	jmp    0xffff:0xfa90ffff
30002e6c:	41                   	inc    ecx
30002e6d:	ea ff ff b4 fa ff ff 	jmp    0xffff:0xfab4ffff
30002e74:	7f ea                	jg     30002e60 <__GNU_EH_FRAME_HDR+0x1a0>
30002e76:	ff                   	(bad)  
30002e77:	ff d8                	call   <internal disassembler error>
30002e79:	fa                   	cli    
30002e7a:	ff                   	(bad)  
30002e7b:	ff d6                	call   esi
30002e7d:	f2 ff                	repnz (bad) 
30002e7f:	ff 94 f3 ff ff 30 f3 	call   DWORD PTR [ebx+esi*8-0xccf0001]
30002e86:	ff                   	(bad)  
30002e87:	ff 20                	jmp    DWORD PTR [eax]
30002e89:	f4                   	hlt    
30002e8a:	ff                   	(bad)  
30002e8b:	ff 34 f3             	push   DWORD PTR [ebx+esi*8]
30002e8e:	ff                   	(bad)  
30002e8f:	ff 98 f7 ff ff 38    	call   FWORD PTR [eax+0x38fffff7]
30002e95:	f3 ff                	repz (bad) 
30002e97:	ff 08                	dec    DWORD PTR [eax]
30002e99:	fb                   	sti    
30002e9a:	ff                   	(bad)  
30002e9b:	ff                   	.byte 0xff

Disassembly of section .rodata:

30002ea0 <_ytab-0x260>:
30002ea0:	53                   	push   ebx
30002ea1:	74 72                	je     30002f15 <__GNU_EH_FRAME_HDR+0x255>
30002ea3:	65                   	gs
30002ea4:	61                   	popa   
30002ea5:	6d                   	ins    DWORD PTR es:[edi],dx
30002ea6:	20 25 75 20 6e 6f    	and    BYTE PTR ds:0x6f6e2075,ah
30002eac:	74 20                	je     30002ece <__GNU_EH_FRAME_HDR+0x20e>
30002eae:	69 6d 70 6c 65 6d 65 	imul   ebp,DWORD PTR [ebp+0x70],0x656d656c
30002eb5:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002eb6:	74 65                	je     30002f1d <__GNU_EH_FRAME_HDR+0x25d>
30002eb8:	64 0a 00             	or     al,BYTE PTR fs:[eax]
30002ebb:	2a 2a                	sub    ch,BYTE PTR [edx]
30002ebd:	2a 49 6e             	sub    cl,BYTE PTR [ecx+0x6e]
30002ec0:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x697a696c
30002ec7:	69 
30002ec8:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002ec9:	67 20 6c 69          	and    BYTE PTR [si+0x69],ch
30002ecd:	62 63 0a             	bound  esp,QWORD PTR [ebx+0xa]
30002ed0:	2a 2a                	sub    ch,BYTE PTR [edx]
30002ed2:	2a 00                	sub    al,BYTE PTR [eax]
30002ed4:	6d                   	ins    DWORD PTR es:[edi],dx
30002ed5:	61                   	popa   
30002ed6:	6c                   	ins    BYTE PTR es:[edi],dx
30002ed7:	6c                   	ins    BYTE PTR es:[edi],dx
30002ed8:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002ed9:	63 28                	arpl   WORD PTR [eax],bp
30002edb:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002ede:	30 38                	xor    BYTE PTR [eax],bh
30002ee0:	58                   	pop    eax
30002ee1:	29 0a                	sub    DWORD PTR [edx],ecx
30002ee3:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002ee7:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30002eea:	61                   	popa   
30002eeb:	6c                   	ins    BYTE PTR es:[edi],dx
30002eec:	6c                   	ins    BYTE PTR es:[edi],dx
30002eed:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002eee:	63 3a                	arpl   WORD PTR [edx],di
30002ef0:	20 6e 65             	and    BYTE PTR [esi+0x65],ch
30002ef3:	65                   	gs
30002ef4:	64                   	fs
30002ef5:	65                   	gs
30002ef6:	64                   	fs
30002ef7:	3d 30 78 25 30       	cmp    eax,0x30257830
30002efc:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30002eff:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002f03:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30002f06:	61                   	popa   
30002f07:	6c                   	ins    BYTE PTR es:[edi],dx
30002f08:	6c                   	ins    BYTE PTR es:[edi],dx
30002f09:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002f0a:	63 3a                	arpl   WORD PTR [edx],di
30002f0c:	20 68 65             	and    BYTE PTR [eax+0x65],ch
30002f0f:	61                   	popa   
30002f10:	45                   	inc    ebp
30002f11:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f12:	64                   	fs
30002f13:	3d 30 78 25 30       	cmp    eax,0x30257830
30002f18:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30002f1b:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002f1f:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30002f22:	61                   	popa   
30002f23:	6c                   	ins    BYTE PTR es:[edi],dx
30002f24:	6c                   	ins    BYTE PTR es:[edi],dx
30002f25:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002f26:	63 3a                	arpl   WORD PTR [edx],di
30002f28:	20 52 65             	and    BYTE PTR [edx+0x65],dl
30002f2b:	71 20                	jno    30002f4d <__GNU_EH_FRAME_HDR+0x28d>
30002f2d:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002f30:	30 38                	xor    BYTE PTR [eax],bh
30002f32:	58                   	pop    eax
30002f33:	20 62 79             	and    BYTE PTR [edx+0x79],ah
30002f36:	74 65                	je     30002f9d <__GNU_EH_FRAME_HDR+0x2dd>
30002f38:	73 2c                	jae    30002f66 <__GNU_EH_FRAME_HDR+0x2a6>
30002f3a:	20 72 65             	and    BYTE PTR [edx+0x65],dh
30002f3d:	74 20                	je     30002f5f <__GNU_EH_FRAME_HDR+0x29f>
30002f3f:	77 61                	ja     30002fa2 <__GNU_EH_FRAME_HDR+0x2e2>
30002f41:	73 20                	jae    30002f63 <__GNU_EH_FRAME_HDR+0x2a3>
30002f43:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002f46:	30 38                	xor    BYTE PTR [eax],bh
30002f48:	58                   	pop    eax
30002f49:	2c 20                	sub    al,0x20
30002f4b:	68 65 61 70 45       	push   0x45706165
30002f50:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f51:	64                   	fs
30002f52:	3d 30 78 25 30       	cmp    eax,0x30257830
30002f57:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30002f5a:	00 00                	add    BYTE PTR [eax],al
30002f5c:	6c                   	ins    BYTE PTR es:[edi],dx
30002f5d:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
30002f64:	6c                   	ins    BYTE PTR es:[edi],dx
30002f65:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002f66:	63 3a                	arpl   WORD PTR [edx],di
30002f68:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
30002f6b:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x657a696c
30002f72:	65 
30002f73:	64 20 68 65          	and    BYTE PTR fs:[eax+0x65],ch
30002f77:	61                   	popa   
30002f78:	70 43                	jo     30002fbd <__GNU_EH_FRAME_HDR+0x2fd>
30002f7a:	75 72                	jne    30002fee <__GNU_EH_FRAME_HDR+0x32e>
30002f7c:	72 20                	jb     30002f9e <__GNU_EH_FRAME_HDR+0x2de>
30002f7e:	61                   	popa   
30002f7f:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f80:	64 20 68 65          	and    BYTE PTR fs:[eax+0x65],ch
30002f84:	61                   	popa   
30002f85:	70 42                	jo     30002fc9 <__GNU_EH_FRAME_HDR+0x309>
30002f87:	61                   	popa   
30002f88:	73 65                	jae    30002fef <__GNU_EH_FRAME_HDR+0x32f>
30002f8a:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
30002f8e:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002f91:	30 38                	xor    BYTE PTR [eax],bh
30002f93:	58                   	pop    eax
30002f94:	0a 00                	or     al,BYTE PTR [eax]
30002f96:	00 00                	add    BYTE PTR [eax],al
30002f98:	6c                   	ins    BYTE PTR es:[edi],dx
30002f99:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
30002fa0:	6c                   	ins    BYTE PTR es:[edi],dx
30002fa1:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002fa2:	63 3a                	arpl   WORD PTR [edx],di
30002fa4:	63 72 65             	arpl   WORD PTR [edx+0x65],si
30002fa7:	61                   	popa   
30002fa8:	74 69                	je     30003013 <__GNU_EH_FRAME_HDR+0x353>
30002faa:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002fab:	67 20 68 65          	and    BYTE PTR [bx+si+0x65],ch
30002faf:	61                   	popa   
30002fb0:	70 20                	jo     30002fd2 <__GNU_EH_FRAME_HDR+0x312>
30002fb2:	72 65                	jb     30003019 <__GNU_EH_FRAME_HDR+0x359>
30002fb4:	63 20                	arpl   WORD PTR [eax],sp
30002fb6:	40                   	inc    eax
30002fb7:	20 30                	and    BYTE PTR [eax],dh
30002fb9:	78 25                	js     30002fe0 <__GNU_EH_FRAME_HDR+0x320>
30002fbb:	30 38                	xor    BYTE PTR [eax],bh
30002fbd:	58                   	pop    eax
30002fbe:	0a 00                	or     al,BYTE PTR [eax]
30002fc0:	6c                   	ins    BYTE PTR es:[edi],dx
30002fc1:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
30002fc8:	6c                   	ins    BYTE PTR es:[edi],dx
30002fc9:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002fca:	63 3a                	arpl   WORD PTR [edx],di
30002fcc:	20 68 65             	and    BYTE PTR [eax+0x65],ch
30002fcf:	61                   	popa   
30002fd0:	70 43                	jo     30003015 <__GNU_EH_FRAME_HDR+0x355>
30002fd2:	75 72                	jne    30003046 <__GNU_EH_FRAME_HDR+0x386>
30002fd4:	72 3d                	jb     30003013 <__GNU_EH_FRAME_HDR+0x353>
30002fd6:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002fd9:	30 38                	xor    BYTE PTR [eax],bh
30002fdb:	58                   	pop    eax
30002fdc:	2c 20                	sub    al,0x20
30002fde:	73 69                	jae    30003049 <__GNU_EH_FRAME_HDR+0x389>
30002fe0:	7a 65                	jp     30003047 <__GNU_EH_FRAME_HDR+0x387>
30002fe2:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002fe3:	66                   	data16
30002fe4:	28 68 65             	sub    BYTE PTR [eax+0x65],ch
30002fe7:	61                   	popa   
30002fe8:	70 72                	jo     3000305c <__GNU_EH_FRAME_HDR+0x39c>
30002fea:	65 63 5f 74          	arpl   WORD PTR gs:[edi+0x74],bx
30002fee:	29 3d 30 78 25 30    	sub    DWORD PTR ds:0x30257830,edi
30002ff4:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30002ff7:	00 72 65             	add    BYTE PTR [edx+0x65],dh
30002ffa:	74 75                	je     30003071 <__GNU_EH_FRAME_HDR+0x3b1>
30002ffc:	72 6e                	jb     3000306c <__GNU_EH_FRAME_HDR+0x3ac>
30002ffe:	69 6e 67 20 30 78 25 	imul   ebp,DWORD PTR [esi+0x67],0x25783020
30003005:	30 38                	xor    BYTE PTR [eax],bh
30003007:	58                   	pop    eax
30003008:	0a 00                	or     al,BYTE PTR [eax]
	...
3000301e:	00 00                	add    BYTE PTR [eax],al
30003020:	47                   	inc    edi
30003021:	4d                   	dec    ebp
30003022:	54                   	push   esp
30003023:	00 53 75             	add    BYTE PTR [ebx+0x75],dl
30003026:	6e                   	outs   dx,BYTE PTR ds:[esi]
30003027:	64                   	fs
30003028:	61                   	popa   
30003029:	79 00                	jns    3000302b <__GNU_EH_FRAME_HDR+0x36b>
3000302b:	4d                   	dec    ebp
3000302c:	6f                   	outs   dx,DWORD PTR ds:[esi]
3000302d:	6e                   	outs   dx,BYTE PTR ds:[esi]
3000302e:	64                   	fs
3000302f:	61                   	popa   
30003030:	79 00                	jns    30003032 <__GNU_EH_FRAME_HDR+0x372>
30003032:	54                   	push   esp
30003033:	75 65                	jne    3000309a <__GNU_EH_FRAME_HDR+0x3da>
30003035:	73 64                	jae    3000309b <__GNU_EH_FRAME_HDR+0x3db>
30003037:	61                   	popa   
30003038:	79 00                	jns    3000303a <__GNU_EH_FRAME_HDR+0x37a>
3000303a:	57                   	push   edi
3000303b:	65 64 6e             	gs outs dx,BYTE PTR fs:gs:[esi]
3000303e:	65                   	gs
3000303f:	73 64                	jae    300030a5 <__GNU_EH_FRAME_HDR+0x3e5>
30003041:	61                   	popa   
30003042:	79 00                	jns    30003044 <__GNU_EH_FRAME_HDR+0x384>
30003044:	54                   	push   esp
30003045:	68 75 72 73 64       	push   0x64737275
3000304a:	61                   	popa   
3000304b:	79 00                	jns    3000304d <__GNU_EH_FRAME_HDR+0x38d>
3000304d:	46                   	inc    esi
3000304e:	72 69                	jb     300030b9 <__GNU_EH_FRAME_HDR+0x3f9>
30003050:	64                   	fs
30003051:	61                   	popa   
30003052:	79 00                	jns    30003054 <__GNU_EH_FRAME_HDR+0x394>
30003054:	53                   	push   ebx
30003055:	61                   	popa   
30003056:	74 75                	je     300030cd <__GNU_EH_FRAME_HDR+0x40d>
30003058:	72 64                	jb     300030be <__GNU_EH_FRAME_HDR+0x3fe>
3000305a:	61                   	popa   
3000305b:	79 00                	jns    3000305d <__GNU_EH_FRAME_HDR+0x39d>
3000305d:	53                   	push   ebx
3000305e:	75 6e                	jne    300030ce <__GNU_EH_FRAME_HDR+0x40e>
30003060:	00 4d 6f             	add    BYTE PTR [ebp+0x6f],cl
30003063:	6e                   	outs   dx,BYTE PTR ds:[esi]
30003064:	00 54 75 65          	add    BYTE PTR [ebp+esi*2+0x65],dl
30003068:	00 57 65             	add    BYTE PTR [edi+0x65],dl
3000306b:	64 00 54 68 75       	add    BYTE PTR fs:[eax+ebp*2+0x75],dl
30003070:	00 46 72             	add    BYTE PTR [esi+0x72],al
30003073:	69 00 53 61 74 00    	imul   eax,DWORD PTR [eax],0x746153
30003079:	4a                   	dec    edx
3000307a:	61                   	popa   
3000307b:	6e                   	outs   dx,BYTE PTR ds:[esi]
3000307c:	75 61                	jne    300030df <__GNU_EH_FRAME_HDR+0x41f>
3000307e:	72 79                	jb     300030f9 <__GNU_EH_FRAME_HDR+0x439>
30003080:	00 46 65             	add    BYTE PTR [esi+0x65],al
30003083:	62 72 75             	bound  esi,QWORD PTR [edx+0x75]
30003086:	61                   	popa   
30003087:	72 79                	jb     30003102 <_ytab+0x2>
30003089:	00 4d 61             	add    BYTE PTR [ebp+0x61],cl
3000308c:	72 63                	jb     300030f1 <__GNU_EH_FRAME_HDR+0x431>
3000308e:	68 00 41 70 72       	push   0x72704100
30003093:	69 6c 00 4d 61 79 00 	imul   ebp,DWORD PTR [eax+eax*1+0x4d],0x4a007961
3000309a:	4a 
3000309b:	75 6e                	jne    3000310b <_ytab+0xb>
3000309d:	65 00 4a 75          	add    BYTE PTR gs:[edx+0x75],cl
300030a1:	6c                   	ins    BYTE PTR es:[edi],dx
300030a2:	79 00                	jns    300030a4 <__GNU_EH_FRAME_HDR+0x3e4>
300030a4:	41                   	inc    ecx
300030a5:	75 67                	jne    3000310e <_ytab+0xe>
300030a7:	75 73                	jne    3000311c <_ytab+0x1c>
300030a9:	74 00                	je     300030ab <__GNU_EH_FRAME_HDR+0x3eb>
300030ab:	53                   	push   ebx
300030ac:	65                   	gs
300030ad:	70 74                	jo     30003123 <_ytab+0x23>
300030af:	65                   	gs
300030b0:	6d                   	ins    DWORD PTR es:[edi],dx
300030b1:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
300030b4:	00 4f 63             	add    BYTE PTR [edi+0x63],cl
300030b7:	74 6f                	je     30003128 <_ytab+0x28>
300030b9:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
300030bc:	00 4e 6f             	add    BYTE PTR [esi+0x6f],cl
300030bf:	76 65                	jbe    30003126 <_ytab+0x26>
300030c1:	6d                   	ins    DWORD PTR es:[edi],dx
300030c2:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
300030c5:	00 44 65 63          	add    BYTE PTR [ebp+eiz*2+0x63],al
300030c9:	65                   	gs
300030ca:	6d                   	ins    DWORD PTR es:[edi],dx
300030cb:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
300030ce:	00 4a 61             	add    BYTE PTR [edx+0x61],cl
300030d1:	6e                   	outs   dx,BYTE PTR ds:[esi]
300030d2:	00 46 65             	add    BYTE PTR [esi+0x65],al
300030d5:	62 00                	bound  eax,QWORD PTR [eax]
300030d7:	4d                   	dec    ebp
300030d8:	61                   	popa   
300030d9:	72 00                	jb     300030db <__GNU_EH_FRAME_HDR+0x41b>
300030db:	41                   	inc    ecx
300030dc:	70 72                	jo     30003150 <_ytab+0x50>
300030de:	00 4a 75             	add    BYTE PTR [edx+0x75],cl
300030e1:	6e                   	outs   dx,BYTE PTR ds:[esi]
300030e2:	00 4a 75             	add    BYTE PTR [edx+0x75],cl
300030e5:	6c                   	ins    BYTE PTR es:[edi],dx
300030e6:	00 41 75             	add    BYTE PTR [ecx+0x75],al
300030e9:	67 00 53 65          	add    BYTE PTR [bp+di+0x65],dl
300030ed:	70 00                	jo     300030ef <__GNU_EH_FRAME_HDR+0x42f>
300030ef:	4f                   	dec    edi
300030f0:	63 74 00 4e          	arpl   WORD PTR [eax+eax*1+0x4e],si
300030f4:	6f                   	outs   dx,DWORD PTR ds:[esi]
300030f5:	76 00                	jbe    300030f7 <__GNU_EH_FRAME_HDR+0x437>
300030f7:	44                   	inc    esp
300030f8:	65 63 00             	arpl   WORD PTR gs:[eax],ax
300030fb:	00 00                	add    BYTE PTR [eax],al
300030fd:	00 00                	add    BYTE PTR [eax],al
	...

30003100 <_ytab>:
30003100:	1f                   	pop    ds
30003101:	00 00                	add    BYTE PTR [eax],al
30003103:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30003106:	00 00                	add    BYTE PTR [eax],al
30003108:	1f                   	pop    ds
30003109:	00 00                	add    BYTE PTR [eax],al
3000310b:	00 1e                	add    BYTE PTR [esi],bl
3000310d:	00 00                	add    BYTE PTR [eax],al
3000310f:	00 1f                	add    BYTE PTR [edi],bl
30003111:	00 00                	add    BYTE PTR [eax],al
30003113:	00 1e                	add    BYTE PTR [esi],bl
30003115:	00 00                	add    BYTE PTR [eax],al
30003117:	00 1f                	add    BYTE PTR [edi],bl
30003119:	00 00                	add    BYTE PTR [eax],al
3000311b:	00 1f                	add    BYTE PTR [edi],bl
3000311d:	00 00                	add    BYTE PTR [eax],al
3000311f:	00 1e                	add    BYTE PTR [esi],bl
30003121:	00 00                	add    BYTE PTR [eax],al
30003123:	00 1f                	add    BYTE PTR [edi],bl
30003125:	00 00                	add    BYTE PTR [eax],al
30003127:	00 1e                	add    BYTE PTR [esi],bl
30003129:	00 00                	add    BYTE PTR [eax],al
3000312b:	00 1f                	add    BYTE PTR [edi],bl
3000312d:	00 00                	add    BYTE PTR [eax],al
3000312f:	00 1f                	add    BYTE PTR [edi],bl
30003131:	00 00                	add    BYTE PTR [eax],al
30003133:	00 1d 00 00 00 1f    	add    BYTE PTR ds:0x1f000000,bl
30003139:	00 00                	add    BYTE PTR [eax],al
3000313b:	00 1e                	add    BYTE PTR [esi],bl
3000313d:	00 00                	add    BYTE PTR [eax],al
3000313f:	00 1f                	add    BYTE PTR [edi],bl
30003141:	00 00                	add    BYTE PTR [eax],al
30003143:	00 1e                	add    BYTE PTR [esi],bl
30003145:	00 00                	add    BYTE PTR [eax],al
30003147:	00 1f                	add    BYTE PTR [edi],bl
30003149:	00 00                	add    BYTE PTR [eax],al
3000314b:	00 1f                	add    BYTE PTR [edi],bl
3000314d:	00 00                	add    BYTE PTR [eax],al
3000314f:	00 1e                	add    BYTE PTR [esi],bl
30003151:	00 00                	add    BYTE PTR [eax],al
30003153:	00 1f                	add    BYTE PTR [edi],bl
30003155:	00 00                	add    BYTE PTR [eax],al
30003157:	00 1e                	add    BYTE PTR [esi],bl
30003159:	00 00                	add    BYTE PTR [eax],al
3000315b:	00 1f                	add    BYTE PTR [edi],bl
3000315d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .rel.dyn:

30003160 <.rel.dyn>:
30003160:	60                   	pusha  
30003161:	34 00                	xor    al,0x0
30003163:	30 08                	xor    BYTE PTR [eax],cl
30003165:	00 00                	add    BYTE PTR [eax],al
30003167:	00 64 34 00          	add    BYTE PTR [esp+esi*1+0x0],ah
3000316b:	30 08                	xor    BYTE PTR [eax],cl
3000316d:	00 00                	add    BYTE PTR [eax],al
3000316f:	00 68 34             	add    BYTE PTR [eax+0x34],ch
30003172:	00 30                	add    BYTE PTR [eax],dh
30003174:	08 00                	or     BYTE PTR [eax],al
30003176:	00 00                	add    BYTE PTR [eax],al
30003178:	6c                   	ins    BYTE PTR es:[edi],dx
30003179:	34 00                	xor    al,0x0
3000317b:	30 08                	xor    BYTE PTR [eax],cl
3000317d:	00 00                	add    BYTE PTR [eax],al
3000317f:	00 70 34             	add    BYTE PTR [eax+0x34],dh
30003182:	00 30                	add    BYTE PTR [eax],dh
30003184:	08 00                	or     BYTE PTR [eax],al
30003186:	00 00                	add    BYTE PTR [eax],al
30003188:	74 34                	je     300031be <_ytab+0xbe>
3000318a:	00 30                	add    BYTE PTR [eax],dh
3000318c:	08 00                	or     BYTE PTR [eax],al
3000318e:	00 00                	add    BYTE PTR [eax],al
30003190:	a0 34 00 30 08       	mov    al,ds:0x8300034
30003195:	00 00                	add    BYTE PTR [eax],al
30003197:	00 a4 34 00 30 08 00 	add    BYTE PTR [esp+esi*1+0x83000],ah
3000319e:	00 00                	add    BYTE PTR [eax],al
300031a0:	a8 34                	test   al,0x34
300031a2:	00 30                	add    BYTE PTR [eax],dh
300031a4:	08 00                	or     BYTE PTR [eax],al
300031a6:	00 00                	add    BYTE PTR [eax],al
300031a8:	ac                   	lods   al,BYTE PTR ds:[esi]
300031a9:	34 00                	xor    al,0x0
300031ab:	30 08                	xor    BYTE PTR [eax],cl
300031ad:	00 00                	add    BYTE PTR [eax],al
300031af:	00 b0 34 00 30 08    	add    BYTE PTR [eax+0x8300034],dh
300031b5:	00 00                	add    BYTE PTR [eax],al
300031b7:	00 b4 34 00 30 08 00 	add    BYTE PTR [esp+esi*1+0x83000],dh
300031be:	00 00                	add    BYTE PTR [eax],al
300031c0:	b8 34 00 30 08       	mov    eax,0x8300034
300031c5:	00 00                	add    BYTE PTR [eax],al
300031c7:	00 bc 34 00 30 08 00 	add    BYTE PTR [esp+esi*1+0x83000],bh
300031ce:	00 00                	add    BYTE PTR [eax],al
300031d0:	c0                   	(bad)  
300031d1:	34 00                	xor    al,0x0
300031d3:	30 08                	xor    BYTE PTR [eax],cl
300031d5:	00 00                	add    BYTE PTR [eax],al
300031d7:	00 c4                	add    ah,al
300031d9:	34 00                	xor    al,0x0
300031db:	30 08                	xor    BYTE PTR [eax],cl
300031dd:	00 00                	add    BYTE PTR [eax],al
300031df:	00 c8                	add    al,cl
300031e1:	34 00                	xor    al,0x0
300031e3:	30 08                	xor    BYTE PTR [eax],cl
300031e5:	00 00                	add    BYTE PTR [eax],al
300031e7:	00 cc                	add    ah,cl
300031e9:	34 00                	xor    al,0x0
300031eb:	30 08                	xor    BYTE PTR [eax],cl
300031ed:	00 00                	add    BYTE PTR [eax],al
300031ef:	00 d0                	add    al,dl
300031f1:	34 00                	xor    al,0x0
300031f3:	30 08                	xor    BYTE PTR [eax],cl
300031f5:	00 00                	add    BYTE PTR [eax],al
300031f7:	00 d4                	add    ah,dl
300031f9:	34 00                	xor    al,0x0
300031fb:	30 08                	xor    BYTE PTR [eax],cl
300031fd:	00 00                	add    BYTE PTR [eax],al
300031ff:	00 d8                	add    al,bl
30003201:	34 00                	xor    al,0x0
30003203:	30 08                	xor    BYTE PTR [eax],cl
30003205:	00 00                	add    BYTE PTR [eax],al
30003207:	00 dc                	add    ah,bl
30003209:	34 00                	xor    al,0x0
3000320b:	30 08                	xor    BYTE PTR [eax],cl
3000320d:	00 00                	add    BYTE PTR [eax],al
3000320f:	00 e0                	add    al,ah
30003211:	34 00                	xor    al,0x0
30003213:	30 08                	xor    BYTE PTR [eax],cl
30003215:	00 00                	add    BYTE PTR [eax],al
30003217:	00 e4                	add    ah,ah
30003219:	34 00                	xor    al,0x0
3000321b:	30 08                	xor    BYTE PTR [eax],cl
3000321d:	00 00                	add    BYTE PTR [eax],al
3000321f:	00 e8                	add    al,ch
30003221:	34 00                	xor    al,0x0
30003223:	30 08                	xor    BYTE PTR [eax],cl
30003225:	00 00                	add    BYTE PTR [eax],al
30003227:	00 ec                	add    ah,ch
30003229:	34 00                	xor    al,0x0
3000322b:	30 08                	xor    BYTE PTR [eax],cl
3000322d:	00 00                	add    BYTE PTR [eax],al
3000322f:	00 f0                	add    al,dh
30003231:	34 00                	xor    al,0x0
30003233:	30 08                	xor    BYTE PTR [eax],cl
30003235:	00 00                	add    BYTE PTR [eax],al
30003237:	00 f4                	add    ah,dh
30003239:	34 00                	xor    al,0x0
3000323b:	30 08                	xor    BYTE PTR [eax],cl
3000323d:	00 00                	add    BYTE PTR [eax],al
3000323f:	00 f8                	add    al,bh
30003241:	34 00                	xor    al,0x0
30003243:	30 08                	xor    BYTE PTR [eax],cl
30003245:	00 00                	add    BYTE PTR [eax],al
30003247:	00 fc                	add    ah,bh
30003249:	34 00                	xor    al,0x0
3000324b:	30 08                	xor    BYTE PTR [eax],cl
3000324d:	00 00                	add    BYTE PTR [eax],al
3000324f:	00 00                	add    BYTE PTR [eax],al
30003251:	35 00 30 08 00       	xor    eax,0x83000
30003256:	00 00                	add    BYTE PTR [eax],al
30003258:	04 35                	add    al,0x35
3000325a:	00 30                	add    BYTE PTR [eax],dh
3000325c:	08 00                	or     BYTE PTR [eax],al
3000325e:	00 00                	add    BYTE PTR [eax],al
30003260:	08 35 00 30 08 00    	or     BYTE PTR ds:0x83000,dh
30003266:	00 00                	add    BYTE PTR [eax],al
30003268:	0c 35                	or     al,0x35
3000326a:	00 30                	add    BYTE PTR [eax],dh
3000326c:	08 00                	or     BYTE PTR [eax],al
3000326e:	00 00                	add    BYTE PTR [eax],al
30003270:	20 35 00 30 08 00    	and    BYTE PTR ds:0x83000,dh
30003276:	00 00                	add    BYTE PTR [eax],al
30003278:	24 35                	and    al,0x35
3000327a:	00 30                	add    BYTE PTR [eax],dh
3000327c:	08 00                	or     BYTE PTR [eax],al
3000327e:	00 00                	add    BYTE PTR [eax],al
30003280:	28 35 00 30 08 00    	sub    BYTE PTR ds:0x83000,dh
30003286:	00 00                	add    BYTE PTR [eax],al
30003288:	2c 35                	sub    al,0x35
3000328a:	00 30                	add    BYTE PTR [eax],dh
3000328c:	08 00                	or     BYTE PTR [eax],al
3000328e:	00 00                	add    BYTE PTR [eax],al
30003290:	30 35 00 30 08 00    	xor    BYTE PTR ds:0x83000,dh
30003296:	00 00                	add    BYTE PTR [eax],al
30003298:	34 35                	xor    al,0x35
3000329a:	00 30                	add    BYTE PTR [eax],dh
3000329c:	08 00                	or     BYTE PTR [eax],al
3000329e:	00 00                	add    BYTE PTR [eax],al
300032a0:	38 35 00 30 08 00    	cmp    BYTE PTR ds:0x83000,dh
300032a6:	00 00                	add    BYTE PTR [eax],al
300032a8:	3c 35                	cmp    al,0x35
300032aa:	00 30                	add    BYTE PTR [eax],dh
300032ac:	08 00                	or     BYTE PTR [eax],al
300032ae:	00 00                	add    BYTE PTR [eax],al
300032b0:	40                   	inc    eax
300032b1:	35 00 30 08 00       	xor    eax,0x83000
300032b6:	00 00                	add    BYTE PTR [eax],al
300032b8:	44                   	inc    esp
300032b9:	35 00 30 08 00       	xor    eax,0x83000
300032be:	00 00                	add    BYTE PTR [eax],al
300032c0:	48                   	dec    eax
300032c1:	35 00 30 08 00       	xor    eax,0x83000
300032c6:	00 00                	add    BYTE PTR [eax],al
300032c8:	4c                   	dec    esp
300032c9:	35 00 30 08 00       	xor    eax,0x83000
300032ce:	00 00                	add    BYTE PTR [eax],al
300032d0:	d2 01                	rol    BYTE PTR [ecx],cl
300032d2:	00 30                	add    BYTE PTR [eax],dh
300032d4:	02 15 00 00 12 02    	add    dl,BYTE PTR ds:0x2120000
300032da:	00 30                	add    BYTE PTR [eax],dh
300032dc:	02 15 00 00 3b 02    	add    dl,BYTE PTR ds:0x23b0000
300032e2:	00 30                	add    BYTE PTR [eax],dh
300032e4:	02 15 00 00 98 02    	add    dl,BYTE PTR ds:0x2980000
300032ea:	00 30                	add    BYTE PTR [eax],dh
300032ec:	02 15 00 00 d9 02    	add    dl,BYTE PTR ds:0x2d90000
300032f2:	00 30                	add    BYTE PTR [eax],dh
300032f4:	02 15 00 00 0f 03    	add    dl,BYTE PTR ds:0x30f0000
300032fa:	00 30                	add    BYTE PTR [eax],dh
300032fc:	02 15 00 00 45 03    	add    dl,BYTE PTR ds:0x3450000
30003302:	00 30                	add    BYTE PTR [eax],dh
30003304:	02 15 00 00 79 03    	add    dl,BYTE PTR ds:0x3790000
3000330a:	00 30                	add    BYTE PTR [eax],dh
3000330c:	02 15 00 00 aa 03    	add    dl,BYTE PTR ds:0x3aa0000
30003312:	00 30                	add    BYTE PTR [eax],dh
30003314:	02 15 00 00 d5 03    	add    dl,BYTE PTR ds:0x3d50000
3000331a:	00 30                	add    BYTE PTR [eax],dh
3000331c:	02 15 00 00 f4 04    	add    dl,BYTE PTR ds:0x4f40000
30003322:	00 30                	add    BYTE PTR [eax],dh
30003324:	02 15 00 00 1a 05    	add    dl,BYTE PTR ds:0x51a0000
3000332a:	00 30                	add    BYTE PTR [eax],dh
3000332c:	02 15 00 00 42 05    	add    dl,BYTE PTR ds:0x5420000
30003332:	00 30                	add    BYTE PTR [eax],dh
30003334:	02 15 00 00 6d 07    	add    dl,BYTE PTR ds:0x76d0000
3000333a:	00 30                	add    BYTE PTR [eax],dh
3000333c:	02 15 00 00 36 09    	add    dl,BYTE PTR ds:0x9360000
30003342:	00 30                	add    BYTE PTR [eax],dh
30003344:	02 15 00 00 9d 13    	add    dl,BYTE PTR ds:0x139d0000
3000334a:	00 30                	add    BYTE PTR [eax],dh
3000334c:	02 15 00 00 84 34    	add    dl,BYTE PTR ds:0x34840000
30003352:	00 30                	add    BYTE PTR [eax],dh
30003354:	07                   	pop    es
30003355:	01 00                	add    DWORD PTR [eax],eax
30003357:	00 88 34 00 30 07    	add    BYTE PTR [eax+0x7300034],cl
3000335d:	04 00                	add    al,0x0
3000335f:	00 8c 34 00 30 07 0c 	add    BYTE PTR [esp+esi*1+0xc073000],cl
30003366:	00 00                	add    BYTE PTR [eax],al
30003368:	90                   	nop
30003369:	34 00                	xor    al,0x0
3000336b:	30 07                	xor    BYTE PTR [edi],al
3000336d:	22 00                	and    al,BYTE PTR [eax]
	...

Disassembly of section .data:

30003380 <a>:
30003380:	7b 00                	jnp    30003382 <a+0x2>
	...

30003384 <b>:
30003384:	c8 01 00 00          	enter  0x1,0x0

30003388 <c>:
30003388:	15 03 00 00 00       	adc    eax,0x3
	...

300033a0 <console_node>:
300033a0:	01 00                	add    DWORD PTR [eax],eax
	...

300033c4 <_daylight>:
300033c4:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

300033c8 <_DYNAMIC>:
300033c8:	04 00                	add    al,0x0
300033ca:	00 00                	add    BYTE PTR [eax],al
300033cc:	4c                   	dec    esp
300033cd:	2b 00                	sub    eax,DWORD PTR [eax]
300033cf:	30 05 00 00 00 3c    	xor    BYTE PTR ds:0x3c000000,al
300033d5:	2a 00                	sub    al,BYTE PTR [eax]
300033d7:	30 06                	xor    BYTE PTR [esi],al
300033d9:	00 00                	add    BYTE PTR [eax],al
300033db:	00 dc                	add    ah,bl
300033dd:	27                   	daa    
300033de:	00 30                	add    BYTE PTR [eax],dh
300033e0:	0a 00                	or     al,BYTE PTR [eax]
300033e2:	00 00                	add    BYTE PTR [eax],al
300033e4:	0e                   	push   cs
300033e5:	01 00                	add    DWORD PTR [eax],eax
300033e7:	00 0b                	add    BYTE PTR [ebx],cl
300033e9:	00 00                	add    BYTE PTR [eax],al
300033eb:	00 10                	add    BYTE PTR [eax],dl
300033ed:	00 00                	add    BYTE PTR [eax],al
300033ef:	00 03                	add    BYTE PTR [ebx],al
300033f1:	00 00                	add    BYTE PTR [eax],al
300033f3:	00 78 34             	add    BYTE PTR [eax+0x34],bh
300033f6:	00 30                	add    BYTE PTR [eax],dh
300033f8:	02 00                	add    al,BYTE PTR [eax]
300033fa:	00 00                	add    BYTE PTR [eax],al
300033fc:	20 00                	and    BYTE PTR [eax],al
300033fe:	00 00                	add    BYTE PTR [eax],al
30003400:	14 00                	adc    al,0x0
30003402:	00 00                	add    BYTE PTR [eax],al
30003404:	11 00                	adc    DWORD PTR [eax],eax
30003406:	00 00                	add    BYTE PTR [eax],al
30003408:	17                   	pop    ss
30003409:	00 00                	add    BYTE PTR [eax],al
3000340b:	00 50 33             	add    BYTE PTR [eax+0x33],dl
3000340e:	00 30                	add    BYTE PTR [eax],dh
30003410:	11 00                	adc    DWORD PTR [eax],eax
30003412:	00 00                	add    BYTE PTR [eax],al
30003414:	60                   	pusha  
30003415:	31 00                	xor    DWORD PTR [eax],eax
30003417:	30 12                	xor    BYTE PTR [edx],dl
30003419:	00 00                	add    BYTE PTR [eax],al
3000341b:	00 f0                	add    al,dh
3000341d:	01 00                	add    DWORD PTR [eax],eax
3000341f:	00 13                	add    BYTE PTR [ebx],dl
30003421:	00 00                	add    BYTE PTR [eax],al
30003423:	00 08                	add    BYTE PTR [eax],cl
30003425:	00 00                	add    BYTE PTR [eax],al
30003427:	00 16                	add    BYTE PTR [esi],dl
30003429:	00 00                	add    BYTE PTR [eax],al
3000342b:	00 00                	add    BYTE PTR [eax],al
3000342d:	00 00                	add    BYTE PTR [eax],al
3000342f:	00 fa                	add    dl,bh
30003431:	ff                   	(bad)  
30003432:	ff 6f 2e             	jmp    FWORD PTR [edi+0x2e]
	...

Disassembly of section .got:

30003460 <.got>:
30003460:	64                   	fs
30003461:	35 00 30 6c 35       	xor    eax,0x356c3000
30003466:	00 30                	add    BYTE PTR [eax],dh
30003468:	50                   	push   eax
30003469:	35 00 30 54 35       	xor    eax,0x35543000
3000346e:	00 30                	add    BYTE PTR [eax],dh
30003470:	58                   	pop    eax
30003471:	35 00 30 5c 35       	xor    eax,0x355c3000
30003476:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .got.plt:

30003478 <_GLOBAL_OFFSET_TABLE_>:
30003478:	c8 33 00 30          	enter  0x33,0x30
	...
30003484:	b6 1f                	mov    dh,0x1f
30003486:	00 30                	add    BYTE PTR [eax],dh
30003488:	c6                   	(bad)  
30003489:	1f                   	pop    ds
3000348a:	00 30                	add    BYTE PTR [eax],dh
3000348c:	d6                   	(bad)  
3000348d:	1f                   	pop    ds
3000348e:	00 30                	add    BYTE PTR [eax],dh
30003490:	e6 1f                	out    0x1f,al
30003492:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .data.rel.local:

300034a0 <_tzname>:
300034a0:	20 30                	and    BYTE PTR [eax],dh
300034a2:	00 30                	add    BYTE PTR [eax],dh
300034a4:	20 30                	and    BYTE PTR [eax],dh
300034a6:	00 30                	add    BYTE PTR [eax],dh

300034a8 <_days>:
300034a8:	24 30                	and    al,0x30
300034aa:	00 30                	add    BYTE PTR [eax],dh
300034ac:	2b 30                	sub    esi,DWORD PTR [eax]
300034ae:	00 30                	add    BYTE PTR [eax],dh
300034b0:	32 30                	xor    dh,BYTE PTR [eax]
300034b2:	00 30                	add    BYTE PTR [eax],dh
300034b4:	3a 30                	cmp    dh,BYTE PTR [eax]
300034b6:	00 30                	add    BYTE PTR [eax],dh
300034b8:	44                   	inc    esp
300034b9:	30 00                	xor    BYTE PTR [eax],al
300034bb:	30 4d 30             	xor    BYTE PTR [ebp+0x30],cl
300034be:	00 30                	add    BYTE PTR [eax],dh
300034c0:	54                   	push   esp
300034c1:	30 00                	xor    BYTE PTR [eax],al
300034c3:	30 5d 30             	xor    BYTE PTR [ebp+0x30],bl

300034c4 <_days_abbrev>:
300034c4:	5d                   	pop    ebp
300034c5:	30 00                	xor    BYTE PTR [eax],al
300034c7:	30 61 30             	xor    BYTE PTR [ecx+0x30],ah
300034ca:	00 30                	add    BYTE PTR [eax],dh
300034cc:	65 30 00             	xor    BYTE PTR gs:[eax],al
300034cf:	30 69 30             	xor    BYTE PTR [ecx+0x30],ch
300034d2:	00 30                	add    BYTE PTR [eax],dh
300034d4:	6d                   	ins    DWORD PTR es:[edi],dx
300034d5:	30 00                	xor    BYTE PTR [eax],al
300034d7:	30 71 30             	xor    BYTE PTR [ecx+0x30],dh
300034da:	00 30                	add    BYTE PTR [eax],dh
300034dc:	75 30                	jne    3000350e <_months+0x2e>
300034de:	00 30                	add    BYTE PTR [eax],dh

300034e0 <_months>:
300034e0:	79 30                	jns    30003512 <_months+0x32>
300034e2:	00 30                	add    BYTE PTR [eax],dh
300034e4:	81 30 00 30 8a 30    	xor    DWORD PTR [eax],0x308a3000
300034ea:	00 30                	add    BYTE PTR [eax],dh
300034ec:	90                   	nop
300034ed:	30 00                	xor    BYTE PTR [eax],al
300034ef:	30 96 30 00 30 9a    	xor    BYTE PTR [esi-0x65cfffd0],dl
300034f5:	30 00                	xor    BYTE PTR [eax],al
300034f7:	30 9f 30 00 30 a4    	xor    BYTE PTR [edi-0x5bcfffd0],bl
300034fd:	30 00                	xor    BYTE PTR [eax],al
300034ff:	30 ab 30 00 30 b5    	xor    BYTE PTR [ebx-0x4acfffd0],ch
30003505:	30 00                	xor    BYTE PTR [eax],al
30003507:	30 bd 30 00 30 c6    	xor    BYTE PTR [ebp-0x39cfffd0],bh
3000350d:	30 00                	xor    BYTE PTR [eax],al
3000350f:	30 00                	xor    BYTE PTR [eax],al
	...

30003520 <_months_abbrev>:
30003520:	cf                   	iret   
30003521:	30 00                	xor    BYTE PTR [eax],al
30003523:	30 d3                	xor    bl,dl
30003525:	30 00                	xor    BYTE PTR [eax],al
30003527:	30 d7                	xor    bh,dl
30003529:	30 00                	xor    BYTE PTR [eax],al
3000352b:	30 db                	xor    bl,bl
3000352d:	30 00                	xor    BYTE PTR [eax],al
3000352f:	30 96 30 00 30 df    	xor    BYTE PTR [esi-0x20cfffd0],dl
30003535:	30 00                	xor    BYTE PTR [eax],al
30003537:	30 e3                	xor    bl,ah
30003539:	30 00                	xor    BYTE PTR [eax],al
3000353b:	30 e7                	xor    bh,ah
3000353d:	30 00                	xor    BYTE PTR [eax],al
3000353f:	30 eb                	xor    bl,ch
30003541:	30 00                	xor    BYTE PTR [eax],al
30003543:	30 ef                	xor    bh,ch
30003545:	30 00                	xor    BYTE PTR [eax],al
30003547:	30 f3                	xor    bl,dh
30003549:	30 00                	xor    BYTE PTR [eax],al
3000354b:	30 f7                	xor    bh,dh
3000354d:	30 00                	xor    BYTE PTR [eax],al
3000354f:	30                   	.byte 0x30

Disassembly of section .bss:

30003550 <heapEnd>:
30003550:	00 00                	add    BYTE PTR [eax],al
	...

30003554 <heapBase>:
30003554:	00 00                	add    BYTE PTR [eax],al
	...

30003558 <heapCurr>:
30003558:	00 00                	add    BYTE PTR [eax],al
	...

3000355c <libcTZ>:
3000355c:	00 00                	add    BYTE PTR [eax],al
	...

30003560 <lasts.1234>:
30003560:	00 00                	add    BYTE PTR [eax],al
	...

30003564 <fops>:
	...

3000356c <console_file>:
	...

3000357c <_dstbias>:
3000357c:	00 00                	add    BYTE PTR [eax],al
	...

30003580 <ticksToWait>:
30003580:	00 00                	add    BYTE PTR [eax],al
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
     11c:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
     122:	30 09                	xor    BYTE PTR [ecx],cl
     124:	aa                   	stos   BYTE PTR es:[edi],al
     125:	00 00                	add    BYTE PTR [eax],al
     127:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     12a:	56                   	push   esi
     12b:	00 00                	add    BYTE PTR [eax],al
     12d:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
     133:	30 09                	xor    BYTE PTR [ecx],cl
     135:	56                   	push   esi
     136:	01 00                	add    DWORD PTR [eax],eax
     138:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     13f:	05 03 50 35 00       	add    eax,0x355003
     144:	30 09                	xor    BYTE PTR [ecx],cl
     146:	48                   	dec    eax
     147:	00 00                	add    BYTE PTR [eax],al
     149:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     14f:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
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
     2b2:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
     2b8:	30 09                	xor    BYTE PTR [ecx],cl
     2ba:	aa                   	stos   BYTE PTR es:[edi],al
     2bb:	00 00                	add    BYTE PTR [eax],al
     2bd:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     2c0:	56                   	push   esi
     2c1:	00 00                	add    BYTE PTR [eax],al
     2c3:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
     2c9:	30 09                	xor    BYTE PTR [ecx],cl
     2cb:	56                   	push   esi
     2cc:	01 00                	add    DWORD PTR [eax],eax
     2ce:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     2d5:	05 03 50 35 00       	add    eax,0x355003
     2da:	30 09                	xor    BYTE PTR [ecx],cl
     2dc:	48                   	dec    eax
     2dd:	00 00                	add    BYTE PTR [eax],al
     2df:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     2e5:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
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
     3cd:	00 05 03 60 35 00    	add    BYTE PTR ds:0x356003,al
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
     3eb:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
     3f1:	30 0b                	xor    BYTE PTR [ebx],cl
     3f3:	aa                   	stos   BYTE PTR es:[edi],al
     3f4:	00 00                	add    BYTE PTR [eax],al
     3f6:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     3f9:	56                   	push   esi
     3fa:	00 00                	add    BYTE PTR [eax],al
     3fc:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
     402:	30 0b                	xor    BYTE PTR [ebx],cl
     404:	56                   	push   esi
     405:	01 00                	add    DWORD PTR [eax],eax
     407:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     40e:	05 03 50 35 00       	add    eax,0x355003
     413:	30 0b                	xor    BYTE PTR [ebx],cl
     415:	48                   	dec    eax
     416:	00 00                	add    BYTE PTR [eax],al
     418:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     41e:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
     424:	30 00                	xor    BYTE PTR [eax],al
     426:	75 02                	jne    42a <sysEnter_Vector-0x12fbd6>
     428:	00 00                	add    BYTE PTR [eax],al
     42a:	04 00                	add    al,0x0
     42c:	b7 01                	mov    bh,0x1
     42e:	00 00                	add    BYTE PTR [eax],al
     430:	04 01                	add    al,0x1
     432:	ef                   	out    dx,eax
     433:	00 00                	add    BYTE PTR [eax],al
     435:	00 0c 26             	add    BYTE PTR [esi+eiz*1],cl
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
     4ca:	38 02                	cmp    BYTE PTR [edx],al
     4cc:	00 00                	add    BYTE PTR [eax],al
     4ce:	04 61                	add    al,0x61
     4d0:	00 00                	add    BYTE PTR [eax],al
     4d2:	00 06                	add    BYTE PTR [esi],al
     4d4:	15 31 01 00 00       	adc    eax,0x131
     4d9:	07                   	pop    es
     4da:	1e                   	push   ds
     4db:	03 00                	add    eax,DWORD PTR [eax]
     4dd:	00 00                	add    BYTE PTR [eax],al
     4df:	07                   	pop    es
     4e0:	c7 02 00 00 01 07    	mov    DWORD PTR [edx],0x7010000
     4e6:	ad                   	lods   eax,DWORD PTR ds:[esi]
     4e7:	02 00                	add    al,BYTE PTR [eax]
     4e9:	00 03                	add    BYTE PTR [ebx],al
     4eb:	07                   	pop    es
     4ec:	10 03                	adc    BYTE PTR [ebx],al
     4ee:	00 00                	add    BYTE PTR [eax],al
     4f0:	04 07                	add    al,0x7
     4f2:	17                   	pop    ss
     4f3:	02 00                	add    al,BYTE PTR [eax]
     4f5:	00 4f 07             	add    BYTE PTR [edi+0x7],cl
     4f8:	ba 02 00 00 59       	mov    edx,0x59000002
     4fd:	07                   	pop    es
     4fe:	42                   	inc    edx
     4ff:	02 00                	add    al,BYTE PTR [eax]
     501:	00 61 07             	add    BYTE PTR [ecx+0x7],ah
     504:	3d 03 00 00 97       	cmp    eax,0x97000003
     509:	08 df                	or     bh,bl
     50b:	02 00                	add    al,BYTE PTR [eax]
     50d:	00 63 01             	add    BYTE PTR [ebx+0x1],ah
     510:	08 f6                	or     dh,dh
     512:	02 00                	add    al,BYTE PTR [eax]
     514:	00 64 01 08          	add    BYTE PTR [ecx+eax*1+0x8],ah
     518:	9a 02 00 00 65 01 08 	call   0x801:0x65000002
     51f:	71 02                	jno    523 <sysEnter_Vector-0x12fadd>
     521:	00 00                	add    BYTE PTR [eax],al
     523:	66 01 08             	add    WORD PTR [eax],cx
     526:	55                   	push   ebp
     527:	02 00                	add    al,BYTE PTR [eax]
     529:	00 67 01             	add    BYTE PTR [edi+0x1],ah
     52c:	08 03                	or     BYTE PTR [ebx],al
     52e:	03 00                	add    eax,DWORD PTR [eax]
     530:	00 68 01             	add    BYTE PTR [eax+0x1],ch
     533:	08 2e                	or     BYTE PTR [esi],ch
     535:	03 00                	add    eax,DWORD PTR [eax]
     537:	00 69 01             	add    BYTE PTR [ecx+0x1],ch
     53a:	08 e9                	or     cl,ch
     53c:	01 00                	add    DWORD PTR [eax],eax
     53e:	00 70 01             	add    BYTE PTR [eax+0x1],dh
     541:	08 5b 03             	or     BYTE PTR [ebx+0x3],bl
     544:	00 00                	add    BYTE PTR [eax],al
     546:	00 03                	add    BYTE PTR [ebx],al
     548:	08 8b 02 00 00 01    	or     BYTE PTR [ebx+0x1000002],cl
     54e:	03 08                	add    ecx,DWORD PTR [eax]
     550:	fa                   	cli    
     551:	01 00                	add    DWORD PTR [eax],eax
     553:	00 02                	add    BYTE PTR [edx],al
     555:	03 00                	add    eax,DWORD PTR [eax]
     557:	09 56 03             	or     DWORD PTR [esi+0x3],edx
     55a:	00 00                	add    BYTE PTR [eax],al
     55c:	01 0f                	add    DWORD PTR [edi],ecx
     55e:	b4 01                	mov    ah,0x1
     560:	00 30                	add    BYTE PTR [eax],dh
     562:	26 00 00             	add    BYTE PTR es:[eax],al
     565:	00 01                	add    BYTE PTR [ecx],al
     567:	9c                   	pushf  
     568:	55                   	push   ebp
     569:	01 00                	add    DWORD PTR [eax],eax
     56b:	00 0a                	add    BYTE PTR [edx],cl
     56d:	06                   	push   es
     56e:	02 00                	add    al,BYTE PTR [eax]
     570:	00 01                	add    BYTE PTR [ecx],al
     572:	0f 9d 00             	setge  BYTE PTR [eax]
     575:	00 00                	add    BYTE PTR [eax],al
     577:	02 91 00 00 09 da    	add    dl,BYTE PTR [ecx-0x25f70000]
     57d:	02 00                	add    al,BYTE PTR [eax]
     57f:	00 01                	add    BYTE PTR [ecx],al
     581:	14 da                	adc    al,0xda
     583:	01 00                	add    DWORD PTR [eax],eax
     585:	30 43 00             	xor    BYTE PTR [ebx+0x0],al
     588:	00 00                	add    BYTE PTR [eax],al
     58a:	01 9c 85 01 00 00 0b 	add    DWORD PTR [ebp+eax*4+0xb000001],ebx
     591:	63 00                	arpl   WORD PTR [eax],ax
     593:	01 14 25 00 00 00 02 	add    DWORD PTR [eiz*1+0x2000000],edx
     59a:	91                   	xchg   ecx,eax
     59b:	60                   	pusha  
     59c:	0c 06                	or     al,0x6
     59e:	02 00                	add    al,BYTE PTR [eax]
     5a0:	00 01                	add    BYTE PTR [ecx],al
     5a2:	16                   	push   ss
     5a3:	85 01                	test   DWORD PTR [ecx],eax
     5a5:	00 00                	add    BYTE PTR [eax],al
     5a7:	02 91 72 00 0d 25    	add    dl,BYTE PTR [ecx+0x250d0072]
     5ad:	00 00                	add    BYTE PTR [eax],al
     5af:	00 95 01 00 00 0e    	add    BYTE PTR [ebp+0xe000001],dl
     5b5:	96                   	xchg   esi,eax
     5b6:	00 00                	add    BYTE PTR [eax],al
     5b8:	00 01                	add    BYTE PTR [ecx],al
     5ba:	00 0f                	add    BYTE PTR [edi],cl
     5bc:	7f 02                	jg     5c0 <sysEnter_Vector-0x12fa40>
     5be:	00 00                	add    BYTE PTR [eax],al
     5c0:	01 1d 25 00 00 00    	add    DWORD PTR ds:0x25,ebx
     5c6:	1d 02 00 30 2f       	sbb    eax,0x2f300002
     5cb:	00 00                	add    BYTE PTR [eax],al
     5cd:	00 01                	add    BYTE PTR [ecx],al
     5cf:	9c                   	pushf  
     5d0:	bb 01 00 00 10       	mov    ebx,0x10000001
     5d5:	63 00                	arpl   WORD PTR [eax],ax
     5d7:	01 1f                	add    DWORD PTR [edi],ebx
     5d9:	25 00 00 00 02       	and    eax,0x2000000
     5de:	91                   	xchg   ecx,eax
     5df:	73 00                	jae    5e1 <sysEnter_Vector-0x12fa1f>
     5e1:	11 a8 02 00 00 01    	adc    DWORD PTR [eax+0x1000002],ebp
     5e7:	24 3a                	and    al,0x3a
     5e9:	00 00                	add    BYTE PTR [eax],al
     5eb:	00 4c 02 00          	add    BYTE PTR [edx+eax*1+0x0],cl
     5ef:	30 d1                	xor    cl,dl
     5f1:	00 00                	add    BYTE PTR [eax],al
     5f3:	00 01                	add    BYTE PTR [ecx],al
     5f5:	9c                   	pushf  
     5f6:	34 02                	xor    al,0x2
     5f8:	00 00                	add    BYTE PTR [eax],al
     5fa:	0a 06                	or     al,BYTE PTR [esi]
     5fc:	02 00                	add    al,BYTE PTR [eax]
     5fe:	00 01                	add    BYTE PTR [ecx],al
     600:	24 9d                	and    al,0x9d
     602:	00 00                	add    BYTE PTR [eax],al
     604:	00 02                	add    BYTE PTR [edx],al
     606:	91                   	xchg   ecx,eax
     607:	00 0a                	add    BYTE PTR [edx],cl
     609:	84 02                	test   BYTE PTR [edx],al
     60b:	00 00                	add    BYTE PTR [eax],al
     60d:	01 24 3a             	add    DWORD PTR [edx+edi*1],esp
     610:	00 00                	add    BYTE PTR [eax],al
     612:	00 02                	add    BYTE PTR [edx],al
     614:	91                   	xchg   ecx,eax
     615:	04 0a                	add    al,0xa
     617:	e2 01                	loop   61a <sysEnter_Vector-0x12f9e6>
     619:	00 00                	add    BYTE PTR [eax],al
     61b:	01 24 3a             	add    DWORD PTR [edx+edi*1],esp
     61e:	00 00                	add    BYTE PTR [eax],al
     620:	00 02                	add    BYTE PTR [edx],al
     622:	91                   	xchg   ecx,eax
     623:	08 0c 6a             	or     BYTE PTR [edx+ebp*2],cl
     626:	02 00                	add    al,BYTE PTR [eax]
     628:	00 01                	add    BYTE PTR [ecx],al
     62a:	26                   	es
     62b:	25 00 00 00 02       	and    eax,0x2000000
     630:	91                   	xchg   ecx,eax
     631:	6b 10 6c             	imul   edx,DWORD PTR [eax],0x6c
     634:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     636:	00 01                	add    BYTE PTR [ecx],al
     638:	27                   	daa    
     639:	3a 00                	cmp    al,BYTE PTR [eax]
     63b:	00 00                	add    BYTE PTR [eax],al
     63d:	02 91 6c 0c 51 03    	add    dl,BYTE PTR [ecx+0x3510c6c]
     643:	00 00                	add    BYTE PTR [eax],al
     645:	01 28                	add    DWORD PTR [eax],ebp
     647:	85 01                	test   DWORD PTR [ecx],eax
     649:	00 00                	add    BYTE PTR [eax],al
     64b:	02 91 69 12 0d 02    	add    dl,BYTE PTR [ecx+0x20d1269]
     651:	00 00                	add    BYTE PTR [eax],al
     653:	01 2d 89 02 00 30    	add    DWORD PTR ds:0x30000289,ebp
     659:	00 13                	add    BYTE PTR [ebx],dl
     65b:	3f                   	aas    
     65c:	00 00                	add    BYTE PTR [eax],al
     65e:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
     661:	56                   	push   esi
     662:	00 00                	add    BYTE PTR [eax],al
     664:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
     66a:	30 13                	xor    BYTE PTR [ebx],dl
     66c:	aa                   	stos   BYTE PTR es:[edi],al
     66d:	00 00                	add    BYTE PTR [eax],al
     66f:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     672:	56                   	push   esi
     673:	00 00                	add    BYTE PTR [eax],al
     675:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
     67b:	30 13                	xor    BYTE PTR [ebx],dl
     67d:	56                   	push   esi
     67e:	01 00                	add    DWORD PTR [eax],eax
     680:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     687:	05 03 50 35 00       	add    eax,0x355003
     68c:	30 13                	xor    BYTE PTR [ebx],dl
     68e:	48                   	dec    eax
     68f:	00 00                	add    BYTE PTR [eax],al
     691:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     697:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
     69d:	30 00                	xor    BYTE PTR [eax],al
     69f:	e6 05                	out    0x5,al
     6a1:	00 00                	add    BYTE PTR [eax],al
     6a3:	04 00                	add    al,0x0
     6a5:	d6                   	(bad)  
     6a6:	02 00                	add    al,BYTE PTR [eax]
     6a8:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     6ab:	ef                   	out    dx,eax
     6ac:	00 00                	add    BYTE PTR [eax],al
     6ae:	00 0c 97             	add    BYTE PTR [edi+edx*4],cl
     6b1:	04 00                	add    al,0x0
     6b3:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
     6b6:	00 00                	add    BYTE PTR [eax],al
     6b8:	20 03                	and    BYTE PTR [ebx],al
     6ba:	00 30                	add    BYTE PTR [eax],dh
     6bc:	2a 03                	sub    al,BYTE PTR [ebx]
     6be:	00 00                	add    BYTE PTR [eax],al
     6c0:	fc                   	cld    
     6c1:	03 00                	add    eax,DWORD PTR [eax]
     6c3:	00 02                	add    BYTE PTR [edx],al
     6c5:	44                   	inc    esp
     6c6:	04 00                	add    al,0x0
     6c8:	00 02                	add    BYTE PTR [edx],al
     6ca:	28 30                	sub    BYTE PTR [eax],dh
     6cc:	00 00                	add    BYTE PTR [eax],al
     6ce:	00 03                	add    BYTE PTR [ebx],al
     6d0:	04 b2                	add    al,0xb2
     6d2:	03 00                	add    eax,DWORD PTR [eax]
     6d4:	00 3a                	add    BYTE PTR [edx],bh
     6d6:	00 00                	add    BYTE PTR [eax],al
     6d8:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     6db:	06                   	push   es
     6dc:	58                   	pop    eax
     6dd:	00 00                	add    BYTE PTR [eax],al
     6df:	00 02                	add    BYTE PTR [edx],al
     6e1:	4b                   	dec    ebx
     6e2:	04 00                	add    al,0x0
     6e4:	00 02                	add    BYTE PTR [edx],al
     6e6:	62 25 00 00 00 04    	bound  esp,QWORD PTR ds:0x4000000
     6ec:	01 06                	add    DWORD PTR [esi],eax
     6ee:	51                   	push   ecx
     6ef:	00 00                	add    BYTE PTR [eax],al
     6f1:	00 04 02             	add    BYTE PTR [edx+eax*1],al
     6f4:	05 e5 00 00 00       	add    eax,0xe5
     6f9:	05 04 05 69 6e       	add    eax,0x6e690504
     6fe:	74 00                	je     700 <sysEnter_Vector-0x12f900>
     700:	04 08                	add    al,0x8
     702:	05 00 00 00 00       	add    eax,0x0
     707:	04 01                	add    al,0x1
     709:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
     70c:	00 00                	add    BYTE PTR [eax],al
     70e:	04 02                	add    al,0x2
     710:	07                   	pop    es
     711:	0e                   	push   cs
     712:	00 00                	add    BYTE PTR [eax],al
     714:	00 02                	add    BYTE PTR [edx],al
     716:	64 00 00             	add    BYTE PTR fs:[eax],al
     719:	00 03                	add    BYTE PTR [ebx],al
     71b:	34 81                	xor    al,0x81
     71d:	00 00                	add    BYTE PTR [eax],al
     71f:	00 04 04             	add    BYTE PTR [esp+eax*1],al
     722:	07                   	pop    es
     723:	32 00                	xor    al,BYTE PTR [eax]
     725:	00 00                	add    BYTE PTR [eax],al
     727:	04 08                	add    al,0x8
     729:	07                   	pop    es
     72a:	28 00                	sub    BYTE PTR [eax],al
     72c:	00 00                	add    BYTE PTR [eax],al
     72e:	02 78 03             	add    bh,BYTE PTR [eax+0x3]
     731:	00 00                	add    BYTE PTR [eax],al
     733:	04 d8                	add    al,0xd8
     735:	81 00 00 00 04 04    	add    DWORD PTR [eax],0x4040000
     73b:	05 05 00 00 00       	add    eax,0x5
     740:	04 0c                	add    al,0xc
     742:	04 96                	add    al,0x96
     744:	00 00                	add    BYTE PTR [eax],al
     746:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     749:	02 90 00 00 00 02    	add    dl,BYTE PTR [eax+0x2000000]
     74f:	5d                   	pop    ebp
     750:	00 00                	add    BYTE PTR [eax],al
     752:	00 05 2a 9a 00 00    	add    BYTE PTR ds:0x9a2a,al
     758:	00 06                	add    BYTE PTR [esi],al
     75a:	74 6d                	je     7c9 <sysEnter_Vector-0x12f837>
     75c:	00 2c 05 2c 4a 01 00 	add    BYTE PTR [eax*1+0x14a2c],ch
     763:	00 07                	add    BYTE PTR [edi],al
     765:	ca 04 00             	retf   0x4
     768:	00 05 2e 5a 00 00    	add    BYTE PTR ds:0x5a2e,al
     76e:	00 00                	add    BYTE PTR [eax],al
     770:	07                   	pop    es
     771:	2f                   	das    
     772:	04 00                	add    al,0x0
     774:	00 05 2f 5a 00 00    	add    BYTE PTR ds:0x5a2f,al
     77a:	00 04 07             	add    BYTE PTR [edi+eax*1],al
     77d:	70 03                	jo     782 <sysEnter_Vector-0x12f87e>
     77f:	00 00                	add    BYTE PTR [eax],al
     781:	05 30 5a 00 00       	add    eax,0x5a30
     786:	00 08                	add    BYTE PTR [eax],cl
     788:	07                   	pop    es
     789:	b5 04                	mov    ch,0x4
     78b:	00 00                	add    BYTE PTR [eax],al
     78d:	05 31 5a 00 00       	add    eax,0x5a31
     792:	00 0c 07             	add    BYTE PTR [edi+eax*1],cl
     795:	c4 03                	les    eax,FWORD PTR [ebx]
     797:	00 00                	add    BYTE PTR [eax],al
     799:	05 32 5a 00 00       	add    eax,0x5a32
     79e:	00 10                	add    BYTE PTR [eax],dl
     7a0:	07                   	pop    es
     7a1:	cb                   	retf   
     7a2:	03 00                	add    eax,DWORD PTR [eax]
     7a4:	00 05 33 5a 00 00    	add    BYTE PTR ds:0x5a33,al
     7aa:	00 14 07             	add    BYTE PTR [edi+eax*1],dl
     7ad:	ad                   	lods   eax,DWORD PTR ds:[esi]
     7ae:	04 00                	add    al,0x0
     7b0:	00 05 34 5a 00 00    	add    BYTE PTR ds:0x5a34,al
     7b6:	00 18                	add    BYTE PTR [eax],bl
     7b8:	07                   	pop    es
     7b9:	3c 04                	cmp    al,0x4
     7bb:	00 00                	add    BYTE PTR [eax],al
     7bd:	05 35 5a 00 00       	add    eax,0x5a35
     7c2:	00 1c 07             	add    BYTE PTR [edi+eax*1],bl
     7c5:	f6 03 00             	test   BYTE PTR [ebx],0x0
     7c8:	00 05 36 5a 00 00    	add    BYTE PTR ds:0x5a36,al
     7ce:	00 20                	add    BYTE PTR [eax],ah
     7d0:	07                   	pop    es
     7d1:	77 04                	ja     7d7 <sysEnter_Vector-0x12f829>
     7d3:	00 00                	add    BYTE PTR [eax],al
     7d5:	05 37 9a 00 00       	add    eax,0x9a37
     7da:	00 24 07             	add    BYTE PTR [edi+eax*1],ah
     7dd:	95                   	xchg   ebp,eax
     7de:	03 00                	add    eax,DWORD PTR [eax]
     7e0:	00 05 38 4a 01 00    	add    BYTE PTR ds:0x14a38,al
     7e6:	00 28                	add    BYTE PTR [eax],ch
     7e8:	00 08                	add    BYTE PTR [eax],cl
     7ea:	04 50                	add    al,0x50
     7ec:	01 00                	add    DWORD PTR [eax],eax
     7ee:	00 09                	add    BYTE PTR [ecx],cl
     7f0:	3a 00                	cmp    al,BYTE PTR [eax]
     7f2:	00 00                	add    BYTE PTR [eax],al
     7f4:	04 04                	add    al,0x4
     7f6:	07                   	pop    es
     7f7:	2d 00 00 00 04       	sub    eax,0x4000000
     7fc:	04 07                	add    al,0x7
     7fe:	dc 00                	fadd   QWORD PTR [eax]
     800:	00 00                	add    BYTE PTR [eax],al
     802:	0a 04 08             	or     al,BYTE PTR [eax+ecx*1]
     805:	04 3a                	add    al,0x3a
     807:	00 00                	add    BYTE PTR [eax],al
     809:	00 0b                	add    BYTE PTR [ebx],cl
     80b:	38 02                	cmp    BYTE PTR [edx],al
     80d:	00 00                	add    BYTE PTR [eax],al
     80f:	04 81                	add    al,0x81
     811:	00 00                	add    BYTE PTR [eax],al
     813:	00 08                	add    BYTE PTR [eax],cl
     815:	15 f9 01 00 00       	adc    eax,0x1f9
     81a:	0c 1e                	or     al,0x1e
     81c:	03 00                	add    eax,DWORD PTR [eax]
     81e:	00 00                	add    BYTE PTR [eax],al
     820:	0c c7                	or     al,0xc7
     822:	02 00                	add    al,BYTE PTR [eax]
     824:	00 01                	add    BYTE PTR [ecx],al
     826:	0c ad                	or     al,0xad
     828:	02 00                	add    al,BYTE PTR [eax]
     82a:	00 03                	add    BYTE PTR [ebx],al
     82c:	0c 10                	or     al,0x10
     82e:	03 00                	add    eax,DWORD PTR [eax]
     830:	00 04 0c             	add    BYTE PTR [esp+ecx*1],al
     833:	17                   	pop    ss
     834:	02 00                	add    al,BYTE PTR [eax]
     836:	00 4f 0c             	add    BYTE PTR [edi+0xc],cl
     839:	ba 02 00 00 59       	mov    edx,0x59000002
     83e:	0c 42                	or     al,0x42
     840:	02 00                	add    al,BYTE PTR [eax]
     842:	00 61 0c             	add    BYTE PTR [ecx+0xc],ah
     845:	3d 03 00 00 97       	cmp    eax,0x97000003
     84a:	0d df 02 00 00       	or     eax,0x2df
     84f:	63 01                	arpl   WORD PTR [ecx],ax
     851:	0d f6 02 00 00       	or     eax,0x2f6
     856:	64 01 0d 9a 02 00 00 	add    DWORD PTR fs:0x29a,ecx
     85d:	65 01 0d 71 02 00 00 	add    DWORD PTR gs:0x271,ecx
     864:	66 01 0d 55 02 00 00 	add    WORD PTR ds:0x255,cx
     86b:	67 01 0d             	add    DWORD PTR [di],ecx
     86e:	03 03                	add    eax,DWORD PTR [ebx]
     870:	00 00                	add    BYTE PTR [eax],al
     872:	68 01 0d 2e 03       	push   0x32e0d01
     877:	00 00                	add    BYTE PTR [eax],al
     879:	69 01 0d e9 01 00    	imul   eax,DWORD PTR [ecx],0x1e90d
     87f:	00 70 01             	add    BYTE PTR [eax+0x1],dh
     882:	0d 5b 03 00 00       	or     eax,0x35b
     887:	00 03                	add    BYTE PTR [ebx],al
     889:	0d 8b 02 00 00       	or     eax,0x28b
     88e:	01 03                	add    DWORD PTR [ebx],eax
     890:	0d fa 01 00 00       	or     eax,0x1fa
     895:	02 03                	add    al,BYTE PTR [ebx]
     897:	00 0e                	add    BYTE PTR [esi],cl
     899:	23 04 00             	and    eax,DWORD PTR [eax+eax*1]
     89c:	00 01                	add    BYTE PTR [ecx],al
     89e:	0f 5a 00             	cvtps2pd xmm0,QWORD PTR [eax]
     8a1:	00 00                	add    BYTE PTR [eax],al
     8a3:	20 03                	and    BYTE PTR [ebx],al
     8a5:	00 30                	add    BYTE PTR [eax],dh
     8a7:	35 00 00 00 01       	xor    eax,0x1000000
     8ac:	9c                   	pushf  
     8ad:	59                   	pop    ecx
     8ae:	02 00                	add    al,BYTE PTR [eax]
     8b0:	00 0f                	add    BYTE PTR [edi],cl
     8b2:	ee                   	out    dx,al
     8b3:	03 00                	add    eax,DWORD PTR [eax]
     8b5:	00 01                	add    BYTE PTR [ecx],al
     8b7:	0f 5a 00             	cvtps2pd xmm0,QWORD PTR [eax]
     8ba:	00 00                	add    BYTE PTR [eax],al
     8bc:	02 91 00 0f 5b 04    	add    dl,BYTE PTR [ecx+0x45b0f00]
     8c2:	00 00                	add    BYTE PTR [eax],al
     8c4:	01 0f                	add    DWORD PTR [edi],ecx
     8c6:	76 00                	jbe    8c8 <sysEnter_Vector-0x12f738>
     8c8:	00 00                	add    BYTE PTR [eax],al
     8ca:	02 91 04 0f 62 04    	add    dl,BYTE PTR [ecx+0x4620f04]
     8d0:	00 00                	add    BYTE PTR [eax],al
     8d2:	01 0f                	add    DWORD PTR [edi],ecx
     8d4:	76 00                	jbe    8d6 <sysEnter_Vector-0x12f72a>
     8d6:	00 00                	add    BYTE PTR [eax],al
     8d8:	02 91 08 0f 69 04    	add    dl,BYTE PTR [ecx+0x4690f08]
     8de:	00 00                	add    BYTE PTR [eax],al
     8e0:	01 0f                	add    DWORD PTR [edi],ecx
     8e2:	76 00                	jbe    8e4 <sysEnter_Vector-0x12f71c>
     8e4:	00 00                	add    BYTE PTR [eax],al
     8e6:	02 91 0c 10 69 03    	add    dl,BYTE PTR [ecx+0x369100c]
     8ec:	00 00                	add    BYTE PTR [eax],al
     8ee:	01 11                	add    DWORD PTR [ecx],edx
     8f0:	5a                   	pop    edx
     8f1:	00 00                	add    BYTE PTR [eax],al
     8f3:	00 02                	add    BYTE PTR [edx],al
     8f5:	91                   	xchg   ecx,eax
     8f6:	70 00                	jo     8f8 <sysEnter_Vector-0x12f708>
     8f8:	0e                   	push   cs
     8f9:	17                   	pop    ss
     8fa:	04 00                	add    al,0x0
     8fc:	00 01                	add    BYTE PTR [ecx],al
     8fe:	16                   	push   ss
     8ff:	5a                   	pop    edx
     900:	00 00                	add    BYTE PTR [eax],al
     902:	00 55 03             	add    BYTE PTR [ebp+0x3],dl
     905:	00 30                	add    BYTE PTR [eax],dh
     907:	34 00                	xor    al,0x0
     909:	00 00                	add    BYTE PTR [eax],al
     90b:	01 9c ab 02 00 00 0f 	add    DWORD PTR [ebx+ebp*4+0xf000002],ebx
     912:	ee                   	out    dx,al
     913:	03 00                	add    eax,DWORD PTR [eax]
     915:	00 01                	add    BYTE PTR [ecx],al
     917:	16                   	push   ss
     918:	5a                   	pop    edx
     919:	00 00                	add    BYTE PTR [eax],al
     91b:	00 02                	add    BYTE PTR [edx],al
     91d:	91                   	xchg   ecx,eax
     91e:	00 0f                	add    BYTE PTR [edi],cl
     920:	5b                   	pop    ebx
     921:	04 00                	add    al,0x0
     923:	00 01                	add    BYTE PTR [ecx],al
     925:	16                   	push   ss
     926:	76 00                	jbe    928 <sysEnter_Vector-0x12f6d8>
     928:	00 00                	add    BYTE PTR [eax],al
     92a:	02 91 04 0f 62 04    	add    dl,BYTE PTR [ecx+0x4620f04]
     930:	00 00                	add    BYTE PTR [eax],al
     932:	01 16                	add    DWORD PTR [esi],edx
     934:	76 00                	jbe    936 <sysEnter_Vector-0x12f6ca>
     936:	00 00                	add    BYTE PTR [eax],al
     938:	02 91 08 10 69 03    	add    dl,BYTE PTR [ecx+0x3691008]
     93e:	00 00                	add    BYTE PTR [eax],al
     940:	01 18                	add    DWORD PTR [eax],ebx
     942:	5a                   	pop    edx
     943:	00 00                	add    BYTE PTR [eax],al
     945:	00 02                	add    BYTE PTR [edx],al
     947:	91                   	xchg   ecx,eax
     948:	70 00                	jo     94a <sysEnter_Vector-0x12f6b6>
     94a:	0e                   	push   cs
     94b:	0b 04 00             	or     eax,DWORD PTR [eax+eax*1]
     94e:	00 01                	add    BYTE PTR [ecx],al
     950:	1d 5a 00 00 00       	sbb    eax,0x5a
     955:	89 03                	mov    DWORD PTR [ebx],eax
     957:	00 30                	add    BYTE PTR [eax],dh
     959:	31 00                	xor    DWORD PTR [eax],eax
     95b:	00 00                	add    BYTE PTR [eax],al
     95d:	01 9c ef 02 00 00 0f 	add    DWORD PTR [edi+ebp*8+0xf000002],ebx
     964:	ee                   	out    dx,al
     965:	03 00                	add    eax,DWORD PTR [eax]
     967:	00 01                	add    BYTE PTR [ecx],al
     969:	1d 5a 00 00 00       	sbb    eax,0x5a
     96e:	02 91 00 0f 5b 04    	add    dl,BYTE PTR [ecx+0x45b0f00]
     974:	00 00                	add    BYTE PTR [eax],al
     976:	01 1d 76 00 00 00    	add    DWORD PTR ds:0x76,ebx
     97c:	02 91 04 10 69 03    	add    dl,BYTE PTR [ecx+0x3691004]
     982:	00 00                	add    BYTE PTR [eax],al
     984:	01 1f                	add    DWORD PTR [edi],ebx
     986:	5a                   	pop    edx
     987:	00 00                	add    BYTE PTR [eax],al
     989:	00 02                	add    BYTE PTR [edx],al
     98b:	91                   	xchg   ecx,eax
     98c:	70 00                	jo     98e <sysEnter_Vector-0x12f672>
     98e:	0e                   	push   cs
     98f:	ff 03                	inc    DWORD PTR [ebx]
     991:	00 00                	add    BYTE PTR [eax],al
     993:	01 24 5a             	add    DWORD PTR [edx+ebx*2],esp
     996:	00 00                	add    BYTE PTR [eax],al
     998:	00 ba 03 00 30 27    	add    BYTE PTR [edx+0x27300003],bh
     99e:	00 00                	add    BYTE PTR [eax],al
     9a0:	00 01                	add    BYTE PTR [ecx],al
     9a2:	9c                   	pushf  
     9a3:	25 03 00 00 0f       	and    eax,0xf000003
     9a8:	ee                   	out    dx,al
     9a9:	03 00                	add    eax,DWORD PTR [eax]
     9ab:	00 01                	add    BYTE PTR [ecx],al
     9ad:	24 5a                	and    al,0x5a
     9af:	00 00                	add    BYTE PTR [eax],al
     9b1:	00 02                	add    BYTE PTR [edx],al
     9b3:	91                   	xchg   ecx,eax
     9b4:	00 10                	add    BYTE PTR [eax],dl
     9b6:	69 03 00 00 01 26    	imul   eax,DWORD PTR [ebx],0x26010000
     9bc:	5a                   	pop    edx
     9bd:	00 00                	add    BYTE PTR [eax],al
     9bf:	00 02                	add    BYTE PTR [edx],al
     9c1:	91                   	xchg   ecx,eax
     9c2:	74 00                	je     9c4 <sysEnter_Vector-0x12f63c>
     9c4:	11 a2 03 00 00 01    	adc    DWORD PTR [edx+0x1000003],esp
     9ca:	2b e1                	sub    esp,ecx
     9cc:	03 00                	add    eax,DWORD PTR [eax]
     9ce:	30 64 00 00          	xor    BYTE PTR [eax+eax*1+0x0],ah
     9d2:	00 01                	add    BYTE PTR [ecx],al
     9d4:	9c                   	pushf  
     9d5:	11 bd 04 00 00 01    	adc    DWORD PTR [ebp+0x1000004],edi
     9db:	34 45                	xor    al,0x45
     9dd:	04 00                	add    al,0x0
     9df:	30 1f                	xor    BYTE PTR [edi],bl
     9e1:	00 00                	add    BYTE PTR [eax],al
     9e3:	00 01                	add    BYTE PTR [ecx],al
     9e5:	9c                   	pushf  
     9e6:	12 ac 03 00 00 01 39 	adc    ch,BYTE PTR [ebx+eax*1+0x39010000]
     9ed:	5a                   	pop    edx
     9ee:	00 00                	add    BYTE PTR [eax],al
     9f0:	00 64 04 00          	add    BYTE PTR [esp+eax*1+0x0],ah
     9f4:	30 34 00             	xor    BYTE PTR [eax+eax*1],dh
     9f7:	00 00                	add    BYTE PTR [eax],al
     9f9:	01 9c 7e 03 00 00 0f 	add    DWORD PTR [esi+edi*2+0xf000003],ebx
     a00:	70 04                	jo     a06 <sysEnter_Vector-0x12f5fa>
     a02:	00 00                	add    BYTE PTR [eax],al
     a04:	01 39                	add    DWORD PTR [ecx],edi
     a06:	4a                   	dec    edx
     a07:	01 00                	add    DWORD PTR [eax],eax
     a09:	00 02                	add    BYTE PTR [edx],al
     a0b:	91                   	xchg   ecx,eax
     a0c:	00 13                	add    BYTE PTR [ebx],dl
     a0e:	10 ee                	adc    dh,ch
     a10:	04 00                	add    al,0x0
     a12:	00 01                	add    BYTE PTR [ecx],al
     a14:	3b 41 00             	cmp    eax,DWORD PTR [ecx+0x0]
     a17:	00 00                	add    BYTE PTR [eax],al
     a19:	02 91 74 00 12 f3    	add    dl,BYTE PTR [ecx-0xcedff8c]
     a1f:	04 00                	add    al,0x0
     a21:	00 01                	add    BYTE PTR [ecx],al
     a23:	41                   	inc    ecx
     a24:	5a                   	pop    edx
     a25:	00 00                	add    BYTE PTR [eax],al
     a27:	00 98 04 00 30 34    	add    BYTE PTR [eax+0x34300004],bl
     a2d:	00 00                	add    BYTE PTR [eax],al
     a2f:	00 01                	add    BYTE PTR [ecx],al
     a31:	9c                   	pushf  
     a32:	b5 03                	mov    ch,0x3
     a34:	00 00                	add    BYTE PTR [eax],al
     a36:	0f 70 04 00 00       	pshufw mm0,QWORD PTR [eax+eax*1],0x0
     a3b:	01 41 4a             	add    DWORD PTR [ecx+0x4a],eax
     a3e:	01 00                	add    DWORD PTR [eax],eax
     a40:	00 02                	add    BYTE PTR [edx],al
     a42:	91                   	xchg   ecx,eax
     a43:	00 13                	add    BYTE PTR [ebx],dl
     a45:	10 ee                	adc    dh,ch
     a47:	04 00                	add    al,0x0
     a49:	00 01                	add    BYTE PTR [ecx],al
     a4b:	43                   	inc    ebx
     a4c:	41                   	inc    ecx
     a4d:	00 00                	add    BYTE PTR [eax],al
     a4f:	00 02                	add    BYTE PTR [edx],al
     a51:	91                   	xchg   ecx,eax
     a52:	74 00                	je     a54 <sysEnter_Vector-0x12f5ac>
     a54:	0e                   	push   cs
     a55:	53                   	push   ebx
     a56:	04 00                	add    al,0x0
     a58:	00 01                	add    BYTE PTR [ecx],al
     a5a:	49                   	dec    ecx
     a5b:	5a                   	pop    edx
     a5c:	00 00                	add    BYTE PTR [eax],al
     a5e:	00 cc                	add    ah,cl
     a60:	04 00                	add    al,0x0
     a62:	30 37                	xor    BYTE PTR [edi],dh
     a64:	00 00                	add    BYTE PTR [eax],al
     a66:	00 01                	add    BYTE PTR [ecx],al
     a68:	9c                   	pushf  
     a69:	fa                   	cli    
     a6a:	03 00                	add    eax,DWORD PTR [eax]
     a6c:	00 0f                	add    BYTE PTR [edi],cl
     a6e:	e3 03                	jecxz  a73 <sysEnter_Vector-0x12f58d>
     a70:	00 00                	add    BYTE PTR [eax],al
     a72:	01 49 76             	add    DWORD PTR [ecx+0x76],ecx
     a75:	00 00                	add    BYTE PTR [eax],al
     a77:	00 02                	add    BYTE PTR [edx],al
     a79:	91                   	xchg   ecx,eax
     a7a:	00 0f                	add    BYTE PTR [edi],cl
     a7c:	70 04                	jo     a82 <sysEnter_Vector-0x12f57e>
     a7e:	00 00                	add    BYTE PTR [eax],al
     a80:	01 49 4a             	add    DWORD PTR [ecx+0x4a],ecx
     a83:	01 00                	add    DWORD PTR [eax],eax
     a85:	00 02                	add    BYTE PTR [edx],al
     a87:	91                   	xchg   ecx,eax
     a88:	04 13                	add    al,0x13
     a8a:	10 ee                	adc    dh,ch
     a8c:	04 00                	add    al,0x0
     a8e:	00 01                	add    BYTE PTR [ecx],al
     a90:	4b                   	dec    ebx
     a91:	41                   	inc    ecx
     a92:	00 00                	add    BYTE PTR [eax],al
     a94:	00 02                	add    BYTE PTR [edx],al
     a96:	91                   	xchg   ecx,eax
     a97:	70 00                	jo     a99 <sysEnter_Vector-0x12f567>
     a99:	0e                   	push   cs
     a9a:	7f 03                	jg     a9f <sysEnter_Vector-0x12f561>
     a9c:	00 00                	add    BYTE PTR [eax],al
     a9e:	01 51 81             	add    DWORD PTR [ecx-0x7f],edx
     aa1:	00 00                	add    BYTE PTR [eax],al
     aa3:	00 03                	add    BYTE PTR [ebx],al
     aa5:	05 00 30 4e 00       	add    eax,0x4e3000
     aaa:	00 00                	add    BYTE PTR [eax],al
     aac:	01 9c 39 04 00 00 0f 	add    DWORD PTR [ecx+edi*1+0xf000004],ebx
     ab3:	8d 04 00             	lea    eax,[eax+eax*1]
     ab6:	00 01                	add    BYTE PTR [ecx],al
     ab8:	51                   	push   ecx
     ab9:	81 00 00 00 02 91    	add    DWORD PTR [eax],0x91020000
     abf:	00 14 14             	add    BYTE PTR [esp+edx*1],dl
     ac2:	05 00 30 32 00       	add    eax,0x323000
     ac7:	00 00                	add    BYTE PTR [eax],al
     ac9:	15 63 74 00 01       	adc    eax,0x1007463
     ace:	53                   	push   ebx
     acf:	76 00                	jbe    ad1 <sysEnter_Vector-0x12f52f>
     ad1:	00 00                	add    BYTE PTR [eax],al
     ad3:	02 91 70 00 00 16    	add    dl,BYTE PTR [ecx+0x16000070]
     ad9:	fa                   	cli    
     ada:	04 00                	add    al,0x0
     adc:	00 01                	add    BYTE PTR [ecx],al
     ade:	57                   	push   edi
     adf:	51                   	push   ecx
     ae0:	05 00 30 1d 00       	add    eax,0x1d3000
     ae5:	00 00                	add    BYTE PTR [eax],al
     ae7:	01 9c 17 e1 04 00 00 	add    DWORD PTR [edi+edx*1+0x4e1],ebx
     aee:	01 5c 6e 05          	add    DWORD PTR [esi+ebp*2+0x5],ebx
     af2:	00 30                	add    BYTE PTR [eax],dh
     af4:	29 00                	sub    DWORD PTR [eax],eax
     af6:	00 00                	add    BYTE PTR [eax],al
     af8:	01 9c 8a 04 00 00 0f 	add    DWORD PTR [edx+ecx*4+0xf000004],ebx
     aff:	81 04 00 00 01 5c 5a 	add    DWORD PTR [eax+eax*1],0x5a5c0100
     b06:	00 00                	add    BYTE PTR [eax],al
     b08:	00 02                	add    BYTE PTR [edx],al
     b0a:	91                   	xchg   ecx,eax
     b0b:	00 0f                	add    BYTE PTR [edi],cl
     b0d:	d6                   	(bad)  
     b0e:	04 00                	add    al,0x0
     b10:	00 01                	add    BYTE PTR [ecx],al
     b12:	5c                   	pop    esp
     b13:	63 01                	arpl   WORD PTR [ecx],ax
     b15:	00 00                	add    BYTE PTR [eax],al
     b17:	02 91 04 0f 85 03    	add    dl,BYTE PTR [ecx+0x3850f04]
     b1d:	00 00                	add    BYTE PTR [eax],al
     b1f:	01 5c 5a 00          	add    DWORD PTR [edx+ebx*2+0x0],ebx
     b23:	00 00                	add    BYTE PTR [eax],al
     b25:	02 91 08 00 0e 88    	add    dl,BYTE PTR [ecx-0x77f1fff8]
     b2b:	04 00                	add    al,0x0
     b2d:	00 01                	add    BYTE PTR [ecx],al
     b2f:	61                   	popa   
     b30:	5a                   	pop    edx
     b31:	00 00                	add    BYTE PTR [eax],al
     b33:	00 97 05 00 30 34    	add    BYTE PTR [edi+0x34300005],dl
     b39:	00 00                	add    BYTE PTR [eax],al
     b3b:	00 01                	add    BYTE PTR [ecx],al
     b3d:	9c                   	pushf  
     b3e:	dc 04 00             	fadd   QWORD PTR [eax+eax*1]
     b41:	00 0f                	add    BYTE PTR [edi],cl
     b43:	ef                   	out    dx,eax
     b44:	06                   	push   es
     b45:	00 00                	add    BYTE PTR [eax],al
     b47:	01 61 65             	add    DWORD PTR [ecx+0x65],esp
     b4a:	01 00                	add    DWORD PTR [eax],eax
     b4c:	00 02                	add    BYTE PTR [edx],al
     b4e:	91                   	xchg   ecx,eax
     b4f:	00 0f                	add    BYTE PTR [edi],cl
     b51:	a8 04                	test   al,0x4
     b53:	00 00                	add    BYTE PTR [eax],al
     b55:	01 61 5a             	add    DWORD PTR [ecx+0x5a],esp
     b58:	00 00                	add    BYTE PTR [eax],al
     b5a:	00 02                	add    BYTE PTR [edx],al
     b5c:	91                   	xchg   ecx,eax
     b5d:	04 0f                	add    al,0xf
     b5f:	d1 04 00             	rol    DWORD PTR [eax+eax*1],1
     b62:	00 01                	add    BYTE PTR [ecx],al
     b64:	61                   	popa   
     b65:	dc 04 00             	fadd   QWORD PTR [eax+eax*1]
     b68:	00 02                	add    BYTE PTR [edx],al
     b6a:	91                   	xchg   ecx,eax
     b6b:	08 15 70 69 64 00    	or     BYTE PTR ds:0x646970,dl
     b71:	01 63 5a             	add    DWORD PTR [ebx+0x5a],esp
     b74:	00 00                	add    BYTE PTR [eax],al
     b76:	00 02                	add    BYTE PTR [edx],al
     b78:	91                   	xchg   ecx,eax
     b79:	70 00                	jo     b7b <sysEnter_Vector-0x12f485>
     b7b:	08 04 65 01 00 00 17 	or     BYTE PTR [eiz*2+0x17000001],al
     b82:	db 03                	fild   DWORD PTR [ebx]
     b84:	00 00                	add    BYTE PTR [eax],al
     b86:	01 6c cb 05          	add    DWORD PTR [ebx+ecx*8+0x5],ebp
     b8a:	00 30                	add    BYTE PTR [eax],dh
     b8c:	1d 00 00 00 01       	sbb    eax,0x1000000
     b91:	9c                   	pushf  
     b92:	06                   	push   es
     b93:	05 00 00 18 70       	add    eax,0x70180000
     b98:	69 64 00 01 6c 76 00 	imul   esp,DWORD PTR [eax+eax*1+0x1],0x766c
     b9f:	00 
     ba0:	00 02                	add    BYTE PTR [edx],al
     ba2:	91                   	xchg   ecx,eax
     ba3:	00 00                	add    BYTE PTR [eax],al
     ba5:	19 d3                	sbb    ebx,edx
     ba7:	03 00                	add    eax,DWORD PTR [eax]
     ba9:	00 01                	add    BYTE PTR [ecx],al
     bab:	71 3c                	jno    be9 <sysEnter_Vector-0x12f417>
     bad:	05 00 00 e8 05       	add    eax,0x5e80000
     bb2:	00 30                	add    BYTE PTR [eax],dh
     bb4:	42                   	inc    edx
     bb5:	00 00                	add    BYTE PTR [eax],al
     bb7:	00 01                	add    BYTE PTR [ecx],al
     bb9:	9c                   	pushf  
     bba:	3c 05                	cmp    al,0x5
     bbc:	00 00                	add    BYTE PTR [eax],al
     bbe:	10 36                	adc    BYTE PTR [esi],dh
     bc0:	04 00                	add    al,0x0
     bc2:	00 01                	add    BYTE PTR [ecx],al
     bc4:	73 76                	jae    c3c <sysEnter_Vector-0x12f3c4>
     bc6:	00 00                	add    BYTE PTR [eax],al
     bc8:	00 02                	add    BYTE PTR [edx],al
     bca:	91                   	xchg   ecx,eax
     bcb:	6c                   	ins    BYTE PTR es:[edi],dx
     bcc:	10 8d 03 00 00 01    	adc    BYTE PTR [ebp+0x1000003],cl
     bd2:	74 ba                	je     b8e <sysEnter_Vector-0x12f472>
     bd4:	00 00                	add    BYTE PTR [eax],al
     bd6:	00 02                	add    BYTE PTR [edx],al
     bd8:	91                   	xchg   ecx,eax
     bd9:	40                   	inc    eax
     bda:	00 08                	add    BYTE PTR [eax],cl
     bdc:	04 ba                	add    al,0xba
     bde:	00 00                	add    BYTE PTR [eax],al
     be0:	00 12                	add    BYTE PTR [edx],dl
     be2:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
     be5:	00 01                	add    BYTE PTR [ecx],al
     be7:	79 65                	jns    c4e <sysEnter_Vector-0x12f3b2>
     be9:	01 00                	add    DWORD PTR [eax],eax
     beb:	00 2a                	add    BYTE PTR [edx],ch
     bed:	06                   	push   es
     bee:	00 30                	add    BYTE PTR [eax],dh
     bf0:	20 00                	and    BYTE PTR [eax],al
     bf2:	00 00                	add    BYTE PTR [eax],al
     bf4:	01 9c 78 05 00 00 18 	add    DWORD PTR [eax+edi*2+0x18000005],ebx
     bfb:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
     bfe:	00 01                	add    BYTE PTR [ecx],al
     c00:	79 65                	jns    c67 <sysEnter_Vector-0x12f399>
     c02:	01 00                	add    DWORD PTR [eax],eax
     c04:	00 02                	add    BYTE PTR [edx],al
     c06:	91                   	xchg   ecx,eax
     c07:	00 0f                	add    BYTE PTR [edi],cl
     c09:	9d                   	popf   
     c0a:	03 00                	add    eax,DWORD PTR [eax]
     c0c:	00 01                	add    BYTE PTR [ecx],al
     c0e:	79 8f                	jns    b9f <sysEnter_Vector-0x12f461>
     c10:	00 00                	add    BYTE PTR [eax],al
     c12:	00 02                	add    BYTE PTR [edx],al
     c14:	91                   	xchg   ecx,eax
     c15:	04 00                	add    al,0x0
     c17:	1a 3f                	sbb    bh,BYTE PTR [edi]
     c19:	00 00                	add    BYTE PTR [eax],al
     c1b:	00 06                	add    BYTE PTR [esi],al
     c1d:	33 76 00             	xor    esi,DWORD PTR [esi+0x0]
     c20:	00 00                	add    BYTE PTR [eax],al
     c22:	05 03 54 35 00       	add    eax,0x355403
     c27:	30 1a                	xor    BYTE PTR [edx],bl
     c29:	aa                   	stos   BYTE PTR es:[edi],al
     c2a:	00 00                	add    BYTE PTR [eax],al
     c2c:	00 06                	add    BYTE PTR [esi],al
     c2e:	34 76                	xor    al,0x76
     c30:	00 00                	add    BYTE PTR [eax],al
     c32:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
     c38:	30 1a                	xor    BYTE PTR [edx],bl
     c3a:	56                   	push   esi
     c3b:	01 00                	add    DWORD PTR [eax],eax
     c3d:	00 06                	add    BYTE PTR [esi],al
     c3f:	35 76 00 00 00       	xor    eax,0x76
     c44:	05 03 50 35 00       	add    eax,0x355003
     c49:	30 1a                	xor    BYTE PTR [edx],bl
     c4b:	48                   	dec    eax
     c4c:	00 00                	add    BYTE PTR [eax],al
     c4e:	00 07                	add    BYTE PTR [edi],al
     c50:	36                   	ss
     c51:	af                   	scas   eax,DWORD PTR es:[edi]
     c52:	00 00                	add    BYTE PTR [eax],al
     c54:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
     c5a:	30 1b                	xor    BYTE PTR [ebx],bl
     c5c:	61                   	popa   
     c5d:	00 01                	add    BYTE PTR [ecx],al
     c5f:	0d 5a 00 00 00       	or     eax,0x5a
     c64:	05 03 80 33 00       	add    eax,0x338003
     c69:	30 1b                	xor    BYTE PTR [ebx],bl
     c6b:	62 00                	bound  eax,QWORD PTR [eax]
     c6d:	01 0d 5a 00 00 00    	add    DWORD PTR ds:0x5a,ecx
     c73:	05 03 84 33 00       	add    eax,0x338403
     c78:	30 1b                	xor    BYTE PTR [ebx],bl
     c7a:	63 00                	arpl   WORD PTR [eax],ax
     c7c:	01 0d 5a 00 00 00    	add    DWORD PTR ds:0x5a,ecx
     c82:	05 03 88 33 00       	add    eax,0x338803
     c87:	30 00                	xor    BYTE PTR [eax],al
     c89:	52                   	push   edx
     c8a:	02 00                	add    al,BYTE PTR [eax]
     c8c:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     c8f:	76 04                	jbe    c95 <sysEnter_Vector-0x12f36b>
     c91:	00 00                	add    BYTE PTR [eax],al
     c93:	04 01                	add    al,0x1
     c95:	ef                   	out    dx,eax
     c96:	00 00                	add    BYTE PTR [eax],al
     c98:	00 0c a2             	add    BYTE PTR [edx+eiz*4],cl
     c9b:	05 00 00 6d 00       	add    eax,0x6d0000
     ca0:	00 00                	add    BYTE PTR [eax],al
     ca2:	4c                   	dec    esp
     ca3:	06                   	push   es
     ca4:	00 30                	add    BYTE PTR [eax],dh
     ca6:	f2 02 00             	repnz add al,BYTE PTR [eax]
     ca9:	00 5c 05 00          	add    BYTE PTR [ebp+eax*1+0x0],bl
     cad:	00 02                	add    BYTE PTR [edx],al
     caf:	01 06                	add    DWORD PTR [esi],eax
     cb1:	51                   	push   ecx
     cb2:	00 00                	add    BYTE PTR [eax],al
     cb4:	00 02                	add    BYTE PTR [edx],al
     cb6:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
     cbc:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     cc3:	02 08                	add    cl,BYTE PTR [eax]
     cc5:	05 00 00 00 00       	add    eax,0x0
     cca:	04 3a                	add    al,0x3a
     ccc:	05 00 00 02 2e       	add    eax,0x2e020000
     cd1:	4c                   	dec    esp
     cd2:	00 00                	add    BYTE PTR [eax],al
     cd4:	00 02                	add    BYTE PTR [edx],al
     cd6:	01 08                	add    DWORD PTR [eax],ecx
     cd8:	4f                   	dec    edi
     cd9:	00 00                	add    BYTE PTR [eax],al
     cdb:	00 02                	add    BYTE PTR [edx],al
     cdd:	02 07                	add    al,BYTE PTR [edi]
     cdf:	0e                   	push   cs
     ce0:	00 00                	add    BYTE PTR [eax],al
     ce2:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
     ce5:	00 00                	add    BYTE PTR [eax],al
     ce7:	00 02                	add    BYTE PTR [edx],al
     ce9:	34 65                	xor    al,0x65
     ceb:	00 00                	add    BYTE PTR [eax],al
     ced:	00 02                	add    BYTE PTR [edx],al
     cef:	04 07                	add    al,0x7
     cf1:	32 00                	xor    al,BYTE PTR [eax]
     cf3:	00 00                	add    BYTE PTR [eax],al
     cf5:	02 08                	add    cl,BYTE PTR [eax]
     cf7:	07                   	pop    es
     cf8:	28 00                	sub    BYTE PTR [eax],al
     cfa:	00 00                	add    BYTE PTR [eax],al
     cfc:	04 78                	add    al,0x78
     cfe:	03 00                	add    eax,DWORD PTR [eax]
     d00:	00 03                	add    BYTE PTR [ebx],al
     d02:	d8 65 00             	fsub   DWORD PTR [ebp+0x0]
     d05:	00 00                	add    BYTE PTR [eax],al
     d07:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
     d0e:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
     d11:	96                   	xchg   esi,eax
     d12:	00 00                	add    BYTE PTR [eax],al
     d14:	00 05 56 05 00 00    	add    BYTE PTR ds:0x556,al
     d1a:	10 04 2b             	adc    BYTE PTR [ebx+ebp*1],al
     d1d:	c9                   	leave  
     d1e:	00 00                	add    BYTE PTR [eax],al
     d20:	00 06                	add    BYTE PTR [esi],al
     d22:	33 05 00 00 04 2d    	xor    eax,DWORD PTR ds:0x2d040000
     d28:	5a                   	pop    edx
     d29:	00 00                	add    BYTE PTR [eax],al
     d2b:	00 00                	add    BYTE PTR [eax],al
     d2d:	07                   	pop    es
     d2e:	6c                   	ins    BYTE PTR es:[edi],dx
     d2f:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     d31:	00 04 2e             	add    BYTE PTR [esi+ebp*1],al
     d34:	5a                   	pop    edx
     d35:	00 00                	add    BYTE PTR [eax],al
     d37:	00 04 06             	add    BYTE PTR [esi+eax*1],al
     d3a:	5c                   	pop    esp
     d3b:	05 00 00 04 2f       	add    eax,0x2f040000
     d40:	c9                   	leave  
     d41:	00 00                	add    BYTE PTR [eax],al
     d43:	00 08                	add    BYTE PTR [eax],cl
     d45:	06                   	push   es
     d46:	af                   	scas   eax,DWORD PTR es:[edi]
     d47:	05 00 00 04 30       	add    eax,0x30040000
     d4c:	d0 00                	rol    BYTE PTR [eax],1
     d4e:	00 00                	add    BYTE PTR [eax],al
     d50:	0c 00                	or     al,0x0
     d52:	02 01                	add    al,BYTE PTR [ecx]
     d54:	02 90 00 00 00 08    	add    dl,BYTE PTR [eax+0x8000000]
     d5a:	04 8c                	add    al,0x8c
     d5c:	00 00                	add    BYTE PTR [eax],al
     d5e:	00 04 b4             	add    BYTE PTR [esp+esi*4],al
     d61:	05 00 00 04 31       	add    eax,0x31040000
     d66:	8c 00                	mov    WORD PTR [eax],es
     d68:	00 00                	add    BYTE PTR [eax],al
     d6a:	02 01                	add    al,BYTE PTR [ecx]
     d6c:	06                   	push   es
     d6d:	58                   	pop    eax
     d6e:	00 00                	add    BYTE PTR [eax],al
     d70:	00 04 5d 00 00 00 05 	add    BYTE PTR [ebx*2+0x5000000],al
     d77:	2a 7e 00             	sub    bh,BYTE PTR [esi+0x0]
     d7a:	00 00                	add    BYTE PTR [eax],al
     d7c:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     d7f:	2d 00 00 00 02       	sub    eax,0x2000000
     d84:	04 07                	add    al,0x7
     d86:	dc 00                	fadd   QWORD PTR [eax]
     d88:	00 00                	add    BYTE PTR [eax],al
     d8a:	09 04 0a             	or     DWORD PTR [edx+ecx*1],eax
     d8d:	62 05 00 00 01 0c    	bound  eax,QWORD PTR ds:0xc010000
     d93:	4c                   	dec    esp
     d94:	06                   	push   es
     d95:	00 30                	add    BYTE PTR [eax],dh
     d97:	34 00                	xor    al,0x0
     d99:	00 00                	add    BYTE PTR [eax],al
     d9b:	01 9c 0b 82 05 00 00 	add    DWORD PTR [ebx+ecx*1+0x582],ebx
     da2:	01 13                	add    DWORD PTR [ebx],edx
     da4:	5a                   	pop    edx
     da5:	00 00                	add    BYTE PTR [eax],al
     da7:	00 80 06 00 30 7c    	add    BYTE PTR [eax+0x7c300006],al
     dad:	00 00                	add    BYTE PTR [eax],al
     daf:	00 01                	add    BYTE PTR [ecx],al
     db1:	9c                   	pushf  
     db2:	4a                   	dec    edx
     db3:	01 00                	add    DWORD PTR [eax],eax
     db5:	00 0c 9d 03 00 00 01 	add    BYTE PTR [ebx*4+0x1000003],cl
     dbc:	13 73 00             	adc    esi,DWORD PTR [ebx+0x0]
     dbf:	00 00                	add    BYTE PTR [eax],al
     dc1:	02 91 00 0d 1c 05    	add    dl,BYTE PTR [ecx+0x51c0d00]
     dc7:	00 00                	add    BYTE PTR [eax],al
     dc9:	01 15 5a 00 00 00    	add    DWORD PTR ds:0x5a,edx
     dcf:	02 91 74 00 0e 66    	add    dl,BYTE PTR [ecx+0x660e0074]
     dd5:	05 00 00 01 26       	add    eax,0x26010000
     dda:	01 01                	add    DWORD PTR [ecx],eax
     ddc:	00 00                	add    BYTE PTR [eax],al
     dde:	fc                   	cld    
     ddf:	06                   	push   es
     de0:	00 30                	add    BYTE PTR [eax],dh
     de2:	e3 01                	jecxz  de5 <sysEnter_Vector-0x12f21b>
     de4:	00 00                	add    BYTE PTR [eax],al
     de6:	01 9c b8 01 00 00 0c 	add    DWORD PTR [eax+edi*4+0xc000001],ebx
     ded:	9d                   	popf   
     dee:	03 00                	add    eax,DWORD PTR [eax]
     df0:	00 01                	add    BYTE PTR [ecx],al
     df2:	26                   	es
     df3:	73 00                	jae    df5 <sysEnter_Vector-0x12f20b>
     df5:	00 00                	add    BYTE PTR [eax],al
     df7:	02 91 00 0d 69 03    	add    dl,BYTE PTR [ecx+0x3690d00]
     dfd:	00 00                	add    BYTE PTR [eax],al
     dff:	01 28                	add    DWORD PTR [eax],ebp
     e01:	01 01                	add    DWORD PTR [ecx],eax
     e03:	00 00                	add    BYTE PTR [eax],al
     e05:	02 91 60 0d 4f 05    	add    dl,BYTE PTR [ecx+0x54f0d60]
     e0b:	00 00                	add    BYTE PTR [eax],al
     e0d:	01 2a                	add    DWORD PTR [edx],ebp
     e0f:	5a                   	pop    edx
     e10:	00 00                	add    BYTE PTR [eax],al
     e12:	00 02                	add    BYTE PTR [edx],al
     e14:	91                   	xchg   ecx,eax
     e15:	6c                   	ins    BYTE PTR es:[edi],dx
     e16:	0d 06 05 00 00       	or     eax,0x506
     e1b:	01 2b                	add    DWORD PTR [ebx],ebp
     e1d:	5a                   	pop    edx
     e1e:	00 00                	add    BYTE PTR [eax],al
     e20:	00 02                	add    BYTE PTR [edx],al
     e22:	91                   	xchg   ecx,eax
     e23:	68 0d 47 05 00       	push   0x5470d
     e28:	00 01                	add    BYTE PTR [ecx],al
     e2a:	2c b8                	sub    al,0xb8
     e2c:	01 00                	add    DWORD PTR [eax],eax
     e2e:	00 02                	add    BYTE PTR [edx],al
     e30:	91                   	xchg   ecx,eax
     e31:	64                   	fs
     e32:	0d 76 05 00 00       	or     eax,0x576
     e37:	01 2d be 01 00 00    	add    DWORD PTR ds:0x1be,ebp
     e3d:	02 91 5c 00 08 04    	add    dl,BYTE PTR [ecx+0x408005c]
     e43:	d6                   	(bad)  
     e44:	00 00                	add    BYTE PTR [eax],al
     e46:	00 08                	add    BYTE PTR [eax],cl
     e48:	04 41                	add    al,0x41
     e4a:	00 00                	add    BYTE PTR [eax],al
     e4c:	00 0f                	add    BYTE PTR [edi],cl
     e4e:	42                   	inc    edx
     e4f:	05 00 00 01 4d       	add    eax,0x4d010000
     e54:	df 08                	fisttp WORD PTR [eax]
     e56:	00 30                	add    BYTE PTR [eax],dh
     e58:	39 00                	cmp    DWORD PTR [eax],eax
     e5a:	00 00                	add    BYTE PTR [eax],al
     e5c:	01 9c 00 02 00 00 0c 	add    DWORD PTR [eax+eax*1+0xc000002],ebx
     e63:	13 05 00 00 01 4d    	adc    eax,DWORD PTR ds:0x4d010000
     e69:	01 01                	add    DWORD PTR [ecx],eax
     e6b:	00 00                	add    BYTE PTR [eax],al
     e6d:	02 91 00 10 6d 70    	add    dl,BYTE PTR [ecx+0x706d1000]
     e73:	00 01                	add    BYTE PTR [ecx],al
     e75:	4f                   	dec    edi
     e76:	b8 01 00 00 02       	mov    eax,0x2000001
     e7b:	91                   	xchg   ecx,eax
     e7c:	74 11                	je     e8f <sysEnter_Vector-0x12f171>
     e7e:	6d                   	ins    DWORD PTR es:[edi],dx
     e7f:	05 00 00 01 59       	add    eax,0x59010000
     e84:	0a 09                	or     cl,BYTE PTR [ecx]
     e86:	00 30                	add    BYTE PTR [eax],dh
     e88:	00 0a                	add    BYTE PTR [edx],cl
     e8a:	24 05                	and    al,0x5
     e8c:	00 00                	add    BYTE PTR [eax],al
     e8e:	01 5f 18             	add    DWORD PTR [edi+0x18],ebx
     e91:	09 00                	or     DWORD PTR [eax],eax
     e93:	30 26                	xor    BYTE PTR [esi],ah
     e95:	00 00                	add    BYTE PTR [eax],al
     e97:	00 01                	add    BYTE PTR [ecx],al
     e99:	9c                   	pushf  
     e9a:	12 3f                	adc    bh,BYTE PTR [edi]
     e9c:	00 00                	add    BYTE PTR [eax],al
     e9e:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
     ea1:	5a                   	pop    edx
     ea2:	00 00                	add    BYTE PTR [eax],al
     ea4:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
     eaa:	30 12                	xor    BYTE PTR [edx],dl
     eac:	aa                   	stos   BYTE PTR es:[edi],al
     ead:	00 00                	add    BYTE PTR [eax],al
     eaf:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     eb2:	5a                   	pop    edx
     eb3:	00 00                	add    BYTE PTR [eax],al
     eb5:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
     ebb:	30 12                	xor    BYTE PTR [edx],dl
     ebd:	56                   	push   esi
     ebe:	01 00                	add    DWORD PTR [eax],eax
     ec0:	00 04 35 5a 00 00 00 	add    BYTE PTR [esi*1+0x5a],al
     ec7:	05 03 50 35 00       	add    eax,0x355003
     ecc:	30 12                	xor    BYTE PTR [edx],dl
     ece:	48                   	dec    eax
     ecf:	00 00                	add    BYTE PTR [eax],al
     ed1:	00 06                	add    BYTE PTR [esi],al
     ed3:	36                   	ss
     ed4:	e8 00 00 00 05       	call   5000ed9 <sysEnter_Vector+0x4ed0ed9>
     ed9:	03 5c 35 00          	add    ebx,DWORD PTR [ebp+esi*1+0x0]
     edd:	30 00                	xor    BYTE PTR [eax],al
     edf:	de 01                	fiadd  WORD PTR [ecx]
     ee1:	00 00                	add    BYTE PTR [eax],al
     ee3:	04 00                	add    al,0x0
     ee5:	9d                   	popf   
     ee6:	05 00 00 04 01       	add    eax,0x1040000
     eeb:	ef                   	out    dx,eax
     eec:	00 00                	add    BYTE PTR [eax],al
     eee:	00 0c be             	add    BYTE PTR [esi+edi*4],cl
     ef1:	05 00 00 6d 00       	add    eax,0x6d0000
     ef6:	00 00                	add    BYTE PTR [eax],al
     ef8:	40                   	inc    eax
     ef9:	09 00                	or     DWORD PTR [eax],eax
     efb:	30 9b 01 00 00 74    	xor    BYTE PTR [ebx+0x74000001],bl
     f01:	06                   	push   es
     f02:	00 00                	add    BYTE PTR [eax],al
     f04:	02 01                	add    al,BYTE PTR [ecx]
     f06:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
     f09:	00 00                	add    BYTE PTR [eax],al
     f0b:	02 02                	add    al,BYTE PTR [edx]
     f0d:	07                   	pop    es
     f0e:	0e                   	push   cs
     f0f:	00 00                	add    BYTE PTR [eax],al
     f11:	00 02                	add    BYTE PTR [edx],al
     f13:	04 07                	add    al,0x7
     f15:	32 00                	xor    al,BYTE PTR [eax]
     f17:	00 00                	add    BYTE PTR [eax],al
     f19:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     f1c:	2d 00 00 00 02       	sub    eax,0x2000000
     f21:	01 06                	add    DWORD PTR [esi],eax
     f23:	51                   	push   ecx
     f24:	00 00                	add    BYTE PTR [eax],al
     f26:	00 02                	add    BYTE PTR [edx],al
     f28:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
     f2e:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     f35:	02 08                	add    cl,BYTE PTR [eax]
     f37:	05 00 00 00 00       	add    eax,0x0
     f3c:	02 08                	add    cl,BYTE PTR [eax]
     f3e:	07                   	pop    es
     f3f:	28 00                	sub    BYTE PTR [eax],al
     f41:	00 00                	add    BYTE PTR [eax],al
     f43:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
     f4a:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     f4d:	dc 00                	fadd   QWORD PTR [eax]
     f4f:	00 00                	add    BYTE PTR [eax],al
     f51:	04 04                	add    al,0x4
     f53:	05 04 7a 00 00       	add    eax,0x7a04
     f58:	00 02                	add    BYTE PTR [edx],al
     f5a:	01 06                	add    DWORD PTR [esi],eax
     f5c:	58                   	pop    eax
     f5d:	00 00                	add    BYTE PTR [eax],al
     f5f:	00 06                	add    BYTE PTR [esi],al
     f61:	64 00 00             	add    BYTE PTR fs:[eax],al
     f64:	00 02                	add    BYTE PTR [edx],al
     f66:	34 33                	xor    al,0x33
     f68:	00 00                	add    BYTE PTR [eax],al
     f6a:	00 06                	add    BYTE PTR [esi],al
     f6c:	5d                   	pop    ebp
     f6d:	00 00                	add    BYTE PTR [eax],al
     f6f:	00 03                	add    BYTE PTR [ebx],al
     f71:	2a 64 00 00          	sub    ah,BYTE PTR [eax+eax*1+0x0]
     f75:	00 05 04 9d 00 00    	add    BYTE PTR ds:0x9d04,al
     f7b:	00 07                	add    BYTE PTR [edi],al
     f7d:	7a 00                	jp     f7f <sysEnter_Vector-0x12f081>
     f7f:	00 00                	add    BYTE PTR [eax],al
     f81:	06                   	push   es
     f82:	78 03                	js     f87 <sysEnter_Vector-0x12f079>
     f84:	00 00                	add    BYTE PTR [eax],al
     f86:	04 d8                	add    al,0xd8
     f88:	33 00                	xor    eax,DWORD PTR [eax]
     f8a:	00 00                	add    BYTE PTR [eax],al
     f8c:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
     f8f:	96                   	xchg   esi,eax
     f90:	00 00                	add    BYTE PTR [eax],al
     f92:	00 02                	add    BYTE PTR [edx],al
     f94:	01 02                	add    DWORD PTR [edx],eax
     f96:	90                   	nop
     f97:	00 00                	add    BYTE PTR [eax],al
     f99:	00 08                	add    BYTE PTR [eax],cl
     f9b:	d0 05 00 00 01 0a    	rol    BYTE PTR ds:0xa010000,1
     fa1:	72 00                	jb     fa3 <sysEnter_Vector-0x12f05d>
     fa3:	00 00                	add    BYTE PTR [eax],al
     fa5:	40                   	inc    eax
     fa6:	09 00                	or     DWORD PTR [eax],eax
     fa8:	30 9b 01 00 00 01    	xor    BYTE PTR [ebx+0x1000001],bl
     fae:	9c                   	pushf  
     faf:	85 01                	test   DWORD PTR [ecx],eax
     fb1:	00 00                	add    BYTE PTR [eax],al
     fb3:	09 cb                	or     ebx,ecx
     fb5:	05 00 00 01 0a       	add    eax,0xa010000
     fba:	72 00                	jb     fbc <sysEnter_Vector-0x12f044>
     fbc:	00 00                	add    BYTE PTR [eax],al
     fbe:	02 91 00 0a 73 72    	add    dl,BYTE PTR [ecx+0x72730a00]
     fc4:	63 00                	arpl   WORD PTR [eax],ax
     fc6:	01 0a                	add    DWORD PTR [edx],ecx
     fc8:	85 01                	test   DWORD PTR [ecx],eax
     fca:	00 00                	add    BYTE PTR [eax],al
     fcc:	02 91 04 0a 6e 00    	add    dl,BYTE PTR [ecx+0x6e0a04]
     fd2:	01 0a                	add    DWORD PTR [edx],ecx
     fd4:	a2 00 00 00 02       	mov    ds:0x2000000,al
     fd9:	91                   	xchg   ecx,eax
     fda:	08 0b                	or     BYTE PTR [ebx],cl
     fdc:	64                   	fs
     fdd:	77 00                	ja     fdf <sysEnter_Vector-0x12f021>
     fdf:	01 0c b4             	add    DWORD PTR [esp+esi*4],ecx
     fe2:	00 00                	add    BYTE PTR [eax],al
     fe4:	00 02                	add    BYTE PTR [edx],al
     fe6:	91                   	xchg   ecx,eax
     fe7:	5e                   	pop    esi
     fe8:	0b 64 64 00          	or     esp,DWORD PTR [esp+eiz*2+0x0]
     fec:	01 0c b4             	add    DWORD PTR [esp+esi*4],ecx
     fef:	00 00                	add    BYTE PTR [eax],al
     ff1:	00 02                	add    BYTE PTR [edx],al
     ff3:	91                   	xchg   ecx,eax
     ff4:	5f                   	pop    edi
     ff5:	0c 72                	or     al,0x72
     ff7:	09 00                	or     DWORD PTR [eax],eax
     ff9:	30 7d 00             	xor    BYTE PTR [ebp+0x0],bh
     ffc:	00 00                	add    BYTE PTR [eax],al
     ffe:	3c 01                	cmp    al,0x1
    1000:	00 00                	add    BYTE PTR [eax],al
    1002:	0b 66 00             	or     esp,DWORD PTR [esi+0x0]
    1005:	01 13                	add    DWORD PTR [ebx],edx
    1007:	8c 01                	mov    WORD PTR [ecx],es
    1009:	00 00                	add    BYTE PTR [eax],al
    100b:	02 91 74 0b 74 00    	add    dl,BYTE PTR [ecx+0x740b74]
    1011:	01 14 97             	add    DWORD PTR [edi+edx*4],edx
    1014:	01 00                	add    DWORD PTR [eax],eax
    1016:	00 02                	add    BYTE PTR [edx],al
    1018:	91                   	xchg   ecx,eax
    1019:	70 00                	jo     101b <sysEnter_Vector-0x12efe5>
    101b:	0c f5                	or     al,0xf5
    101d:	09 00                	or     DWORD PTR [eax],eax
    101f:	30 79 00             	xor    BYTE PTR [ecx+0x0],bh
    1022:	00 00                	add    BYTE PTR [eax],al
    1024:	62 01                	bound  eax,QWORD PTR [ecx]
    1026:	00 00                	add    BYTE PTR [eax],al
    1028:	0b 66 00             	or     esp,DWORD PTR [esi+0x0]
    102b:	01 23                	add    DWORD PTR [ebx],esp
    102d:	8c 01                	mov    WORD PTR [ecx],es
    102f:	00 00                	add    BYTE PTR [eax],al
    1031:	02 91 6c 0b 74 00    	add    dl,BYTE PTR [ecx+0x740b6c]
    1037:	01 24 97             	add    DWORD PTR [edi+edx*4],esp
    103a:	01 00                	add    DWORD PTR [eax],eax
    103c:	00 02                	add    BYTE PTR [edx],al
    103e:	91                   	xchg   ecx,eax
    103f:	68 00 0d 6e 0a       	push   0xa6e0d00
    1044:	00 30                	add    BYTE PTR [eax],dh
    1046:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
    1049:	00 0b                	add    BYTE PTR [ebx],cl
    104b:	66                   	data16
    104c:	00 01                	add    BYTE PTR [ecx],al
    104e:	32 97 00 00 00 02    	xor    dl,BYTE PTR [edi+0x2000000]
    1054:	91                   	xchg   ecx,eax
    1055:	64 0b 74 00 01       	or     esi,DWORD PTR fs:[eax+eax*1+0x1]
    105a:	33 74 00 00          	xor    esi,DWORD PTR [eax+eax*1+0x0]
    105e:	00 02                	add    BYTE PTR [edx],al
    1060:	91                   	xchg   ecx,eax
    1061:	60                   	pusha  
    1062:	00 00                	add    BYTE PTR [eax],al
    1064:	05 04 8b 01 00       	add    eax,0x18b04
    1069:	00 0e                	add    BYTE PTR [esi],cl
    106b:	05 04 92 01 00       	add    eax,0x19204
    1070:	00 07                	add    BYTE PTR [edi],al
    1072:	81 00 00 00 05 04    	add    DWORD PTR [eax],0x4050000
    1078:	81 00 00 00 0f 3f    	add    DWORD PTR [eax],0x3f0f0000
    107e:	00 00                	add    BYTE PTR [eax],al
    1080:	00 05 33 81 00 00    	add    BYTE PTR ds:0x8133,al
    1086:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
    108c:	30 0f                	xor    BYTE PTR [edi],cl
    108e:	aa                   	stos   BYTE PTR es:[edi],al
    108f:	00 00                	add    BYTE PTR [eax],al
    1091:	00 05 34 81 00 00    	add    BYTE PTR ds:0x8134,al
    1097:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
    109d:	30 0f                	xor    BYTE PTR [edi],cl
    109f:	56                   	push   esi
    10a0:	01 00                	add    DWORD PTR [eax],eax
    10a2:	00 05 35 81 00 00    	add    BYTE PTR ds:0x8135,al
    10a8:	00 05 03 50 35 00    	add    BYTE PTR ds:0x355003,al
    10ae:	30 0f                	xor    BYTE PTR [edi],cl
    10b0:	48                   	dec    eax
    10b1:	00 00                	add    BYTE PTR [eax],al
    10b3:	00 06                	add    BYTE PTR [esi],al
    10b5:	36 8c 00             	mov    WORD PTR ss:[eax],es
    10b8:	00 00                	add    BYTE PTR [eax],al
    10ba:	05 03 5c 35 00       	add    eax,0x355c03
    10bf:	30 00                	xor    BYTE PTR [eax],al
    10c1:	96                   	xchg   esi,eax
    10c2:	01 00                	add    DWORD PTR [eax],eax
    10c4:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    10c7:	5e                   	pop    esi
    10c8:	06                   	push   es
    10c9:	00 00                	add    BYTE PTR [eax],al
    10cb:	04 01                	add    al,0x1
    10cd:	ef                   	out    dx,eax
    10ce:	00 00                	add    BYTE PTR [eax],al
    10d0:	00 0c e3             	add    BYTE PTR [ebx+eiz*8],cl
    10d3:	05 00 00 6d 00       	add    eax,0x6d0000
    10d8:	00 00                	add    BYTE PTR [eax],al
    10da:	dc 0a                	fmul   QWORD PTR [edx]
    10dc:	00 30                	add    BYTE PTR [eax],dh
    10de:	c7 00 00 00 65 07    	mov    DWORD PTR [eax],0x7650000
    10e4:	00 00                	add    BYTE PTR [eax],al
    10e6:	02 01                	add    al,BYTE PTR [ecx]
    10e8:	06                   	push   es
    10e9:	58                   	pop    eax
    10ea:	00 00                	add    BYTE PTR [eax],al
    10ec:	00 02                	add    BYTE PTR [edx],al
    10ee:	01 06                	add    DWORD PTR [esi],eax
    10f0:	51                   	push   ecx
    10f1:	00 00                	add    BYTE PTR [eax],al
    10f3:	00 02                	add    BYTE PTR [edx],al
    10f5:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    10fb:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1102:	02 08                	add    cl,BYTE PTR [eax]
    1104:	05 00 00 00 00       	add    eax,0x0
    1109:	04 3a                	add    al,0x3a
    110b:	05 00 00 02 2e       	add    eax,0x2e020000
    1110:	53                   	push   ebx
    1111:	00 00                	add    BYTE PTR [eax],al
    1113:	00 02                	add    BYTE PTR [edx],al
    1115:	01 08                	add    DWORD PTR [eax],ecx
    1117:	4f                   	dec    edi
    1118:	00 00                	add    BYTE PTR [eax],al
    111a:	00 04 f5 05 00 00 02 	add    BYTE PTR [esi*8+0x2000005],al
    1121:	31 65 00             	xor    DWORD PTR [ebp+0x0],esp
    1124:	00 00                	add    BYTE PTR [eax],al
    1126:	02 02                	add    al,BYTE PTR [edx]
    1128:	07                   	pop    es
    1129:	0e                   	push   cs
    112a:	00 00                	add    BYTE PTR [eax],al
    112c:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    112f:	00 00                	add    BYTE PTR [eax],al
    1131:	00 02                	add    BYTE PTR [edx],al
    1133:	34 77                	xor    al,0x77
    1135:	00 00                	add    BYTE PTR [eax],al
    1137:	00 02                	add    BYTE PTR [edx],al
    1139:	04 07                	add    al,0x7
    113b:	32 00                	xor    al,BYTE PTR [eax]
    113d:	00 00                	add    BYTE PTR [eax],al
    113f:	02 08                	add    cl,BYTE PTR [eax]
    1141:	07                   	pop    es
    1142:	28 00                	sub    BYTE PTR [eax],al
    1144:	00 00                	add    BYTE PTR [eax],al
    1146:	04 78                	add    al,0x78
    1148:	03 00                	add    eax,DWORD PTR [eax]
    114a:	00 03                	add    BYTE PTR [ebx],al
    114c:	d8 77 00             	fdiv   DWORD PTR [edi+0x0]
    114f:	00 00                	add    BYTE PTR [eax],al
    1151:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1158:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    115b:	96                   	xchg   esi,eax
    115c:	00 00                	add    BYTE PTR [eax],al
    115e:	00 02                	add    BYTE PTR [edx],al
    1160:	01 02                	add    DWORD PTR [edx],eax
    1162:	90                   	nop
    1163:	00 00                	add    BYTE PTR [eax],al
    1165:	00 04 5d 00 00 00 04 	add    BYTE PTR [ebx*2+0x4000000],al
    116c:	2a 90 00 00 00 02    	sub    dl,BYTE PTR [eax+0x2000000]
    1172:	04 07                	add    al,0x7
    1174:	2d 00 00 00 02       	sub    eax,0x2000000
    1179:	04 07                	add    al,0x7
    117b:	dc 00                	fadd   QWORD PTR [eax]
    117d:	00 00                	add    BYTE PTR [eax],al
    117f:	05 04 06 dc 05       	add    eax,0x5dc0604
    1184:	00 00                	add    BYTE PTR [eax],al
    1186:	01 08                	add    DWORD PTR [eax],ecx
    1188:	be 00 00 00 dc       	mov    esi,0xdc000000
    118d:	0a 00                	or     al,BYTE PTR [eax]
    118f:	30 c7                	xor    bh,al
    1191:	00 00                	add    BYTE PTR [eax],al
    1193:	00 01                	add    BYTE PTR [ecx],al
    1195:	9c                   	pushf  
    1196:	43                   	inc    ebx
    1197:	01 00                	add    DWORD PTR [eax],eax
    1199:	00 07                	add    BYTE PTR [edi],al
    119b:	64 31 00             	xor    DWORD PTR fs:[eax],eax
    119e:	01 08                	add    DWORD PTR [eax],ecx
    11a0:	be 00 00 00 02       	mov    esi,0x2000000
    11a5:	91                   	xchg   ecx,eax
    11a6:	00 07                	add    BYTE PTR [edi],al
    11a8:	76 61                	jbe    120b <sysEnter_Vector-0x12edf5>
    11aa:	6c                   	ins    BYTE PTR es:[edi],dx
    11ab:	00 01                	add    BYTE PTR [ecx],al
    11ad:	08 3a                	or     BYTE PTR [edx],bh
    11af:	00 00                	add    BYTE PTR [eax],al
    11b1:	00 02                	add    BYTE PTR [edx],al
    11b3:	91                   	xchg   ecx,eax
    11b4:	04 07                	add    al,0x7
    11b6:	6c                   	ins    BYTE PTR es:[edi],dx
    11b7:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    11b9:	00 01                	add    BYTE PTR [ecx],al
    11bb:	08 85 00 00 00 02    	or     BYTE PTR [ebp+0x2000000],al
    11c1:	91                   	xchg   ecx,eax
    11c2:	08 08                	or     BYTE PTR [eax],cl
    11c4:	64 00 01             	add    BYTE PTR fs:[ecx],al
    11c7:	0a 43 01             	or     al,BYTE PTR [ebx+0x1]
    11ca:	00 00                	add    BYTE PTR [eax],al
    11cc:	02 91 74 08 65 00    	add    dl,BYTE PTR [ecx+0x650874]
    11d2:	01 0b                	add    DWORD PTR [ebx],ecx
    11d4:	49                   	dec    ecx
    11d5:	01 00                	add    DWORD PTR [eax],eax
    11d7:	00 02                	add    BYTE PTR [edx],al
    11d9:	91                   	xchg   ecx,eax
    11da:	70 09                	jo     11e5 <sysEnter_Vector-0x12ee1b>
    11dc:	d7                   	xlat   BYTE PTR ds:[ebx]
    11dd:	05 00 00 01 0c       	add    eax,0xc010000
    11e2:	5a                   	pop    edx
    11e3:	00 00                	add    BYTE PTR [eax],al
    11e5:	00 02                	add    BYTE PTR [edx],al
    11e7:	91                   	xchg   ecx,eax
    11e8:	6a 08                	push   0x8
    11ea:	66                   	data16
    11eb:	00 01                	add    BYTE PTR [ecx],al
    11ed:	0d 4f 01 00 00       	or     eax,0x14f
    11f2:	02 91 6c 09 f0 05    	add    dl,BYTE PTR [ecx+0x5f0096c]
    11f8:	00 00                	add    BYTE PTR [eax],al
    11fa:	01 0e                	add    DWORD PTR [esi],ecx
    11fc:	6c                   	ins    BYTE PTR es:[edi],dx
    11fd:	00 00                	add    BYTE PTR [eax],al
    11ff:	00 02                	add    BYTE PTR [edx],al
    1201:	91                   	xchg   ecx,eax
    1202:	64 00 0a             	add    BYTE PTR fs:[edx],cl
    1205:	04 48                	add    al,0x48
    1207:	00 00                	add    BYTE PTR [eax],al
    1209:	00 0a                	add    BYTE PTR [edx],cl
    120b:	04 5a                	add    al,0x5a
    120d:	00 00                	add    BYTE PTR [eax],al
    120f:	00 0a                	add    BYTE PTR [edx],cl
    1211:	04 6c                	add    al,0x6c
    1213:	00 00                	add    BYTE PTR [eax],al
    1215:	00 0b                	add    BYTE PTR [ebx],cl
    1217:	3f                   	aas    
    1218:	00 00                	add    BYTE PTR [eax],al
    121a:	00 05 33 6c 00 00    	add    BYTE PTR ds:0x6c33,al
    1220:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
    1226:	30 0b                	xor    BYTE PTR [ebx],cl
    1228:	aa                   	stos   BYTE PTR es:[edi],al
    1229:	00 00                	add    BYTE PTR [eax],al
    122b:	00 05 34 6c 00 00    	add    BYTE PTR ds:0x6c34,al
    1231:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
    1237:	30 0b                	xor    BYTE PTR [ebx],cl
    1239:	56                   	push   esi
    123a:	01 00                	add    DWORD PTR [eax],eax
    123c:	00 05 35 6c 00 00    	add    BYTE PTR ds:0x6c35,al
    1242:	00 05 03 50 35 00    	add    BYTE PTR ds:0x355003,al
    1248:	30 0b                	xor    BYTE PTR [ebx],cl
    124a:	48                   	dec    eax
    124b:	00 00                	add    BYTE PTR [eax],al
    124d:	00 06                	add    BYTE PTR [esi],al
    124f:	36 a5                	movs   DWORD PTR es:[edi],DWORD PTR ss:[esi]
    1251:	00 00                	add    BYTE PTR [eax],al
    1253:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
    1259:	30 00                	xor    BYTE PTR [eax],al
    125b:	63 01                	arpl   WORD PTR [ecx],ax
    125d:	00 00                	add    BYTE PTR [eax],al
    125f:	04 00                	add    al,0x0
    1261:	ff 06                	inc    DWORD PTR [esi]
    1263:	00 00                	add    BYTE PTR [eax],al
    1265:	04 01                	add    al,0x1
    1267:	ef                   	out    dx,eax
    1268:	00 00                	add    BYTE PTR [eax],al
    126a:	00 0c 1a             	add    BYTE PTR [edx+ebx*1],cl
    126d:	06                   	push   es
    126e:	00 00                	add    BYTE PTR [eax],al
    1270:	6d                   	ins    DWORD PTR es:[edi],dx
    1271:	00 00                	add    BYTE PTR [eax],al
    1273:	00 a4 0b 00 30 10 00 	add    BYTE PTR [ebx+ecx*1+0x103000],ah
    127a:	00 00                	add    BYTE PTR [eax],al
    127c:	39 08                	cmp    DWORD PTR [eax],ecx
    127e:	00 00                	add    BYTE PTR [eax],al
    1280:	02 01                	add    al,BYTE PTR [ecx]
    1282:	06                   	push   es
    1283:	58                   	pop    eax
    1284:	00 00                	add    BYTE PTR [eax],al
    1286:	00 02                	add    BYTE PTR [edx],al
    1288:	01 06                	add    DWORD PTR [esi],eax
    128a:	51                   	push   ecx
    128b:	00 00                	add    BYTE PTR [eax],al
    128d:	00 02                	add    BYTE PTR [edx],al
    128f:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1295:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    129c:	02 08                	add    cl,BYTE PTR [eax]
    129e:	05 00 00 00 00       	add    eax,0x0
    12a3:	02 01                	add    al,BYTE PTR [ecx]
    12a5:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    12a8:	00 00                	add    BYTE PTR [eax],al
    12aa:	02 02                	add    al,BYTE PTR [edx]
    12ac:	07                   	pop    es
    12ad:	0e                   	push   cs
    12ae:	00 00                	add    BYTE PTR [eax],al
    12b0:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    12b3:	00 00                	add    BYTE PTR [eax],al
    12b5:	00 02                	add    BYTE PTR [edx],al
    12b7:	34 61                	xor    al,0x61
    12b9:	00 00                	add    BYTE PTR [eax],al
    12bb:	00 02                	add    BYTE PTR [edx],al
    12bd:	04 07                	add    al,0x7
    12bf:	32 00                	xor    al,BYTE PTR [eax]
    12c1:	00 00                	add    BYTE PTR [eax],al
    12c3:	02 08                	add    cl,BYTE PTR [eax]
    12c5:	07                   	pop    es
    12c6:	28 00                	sub    BYTE PTR [eax],al
    12c8:	00 00                	add    BYTE PTR [eax],al
    12ca:	04 78                	add    al,0x78
    12cc:	03 00                	add    eax,DWORD PTR [eax]
    12ce:	00 03                	add    BYTE PTR [ebx],al
    12d0:	d8 61 00             	fsub   DWORD PTR [ecx+0x0]
    12d3:	00 00                	add    BYTE PTR [eax],al
    12d5:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    12dc:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    12df:	96                   	xchg   esi,eax
    12e0:	00 00                	add    BYTE PTR [eax],al
    12e2:	00 02                	add    BYTE PTR [edx],al
    12e4:	01 02                	add    DWORD PTR [edx],eax
    12e6:	90                   	nop
    12e7:	00 00                	add    BYTE PTR [eax],al
    12e9:	00 04 5d 00 00 00 04 	add    BYTE PTR [ebx*2+0x4000000],al
    12f0:	2a 7a 00             	sub    bh,BYTE PTR [edx+0x0]
    12f3:	00 00                	add    BYTE PTR [eax],al
    12f5:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
    12f8:	2d 00 00 00 02       	sub    eax,0x2000000
    12fd:	04 07                	add    al,0x7
    12ff:	dc 00                	fadd   QWORD PTR [eax]
    1301:	00 00                	add    BYTE PTR [eax],al
    1303:	05 04 04 03 06       	add    eax,0x6030404
    1308:	00 00                	add    BYTE PTR [eax],al
    130a:	05 15 7a 00 00       	add    eax,0x7a15
    130f:	00 06                	add    BYTE PTR [esi],al
    1311:	15 06 00 00 01       	adc    eax,0x1000006
    1316:	09 a8 00 00 00 a4    	or     DWORD PTR [eax-0x5c000000],ebp
    131c:	0b 00                	or     eax,DWORD PTR [eax]
    131e:	30 10                	xor    BYTE PTR [eax],dl
    1320:	00 00                	add    BYTE PTR [eax],al
    1322:	00 01                	add    BYTE PTR [ecx],al
    1324:	9c                   	pushf  
    1325:	22 01                	and    al,BYTE PTR [ecx]
    1327:	00 00                	add    BYTE PTR [eax],al
    1329:	07                   	pop    es
    132a:	fe 05 00 00 01 09    	inc    BYTE PTR ds:0x9010000
    1330:	a8 00                	test   al,0x0
    1332:	00 00                	add    BYTE PTR [eax],al
    1334:	02 91 00 08 6c 65    	add    dl,BYTE PTR [ecx+0x656c0800]
    133a:	6e                   	outs   dx,BYTE PTR ds:[esi]
    133b:	00 01                	add    BYTE PTR [ecx],al
    133d:	09 6f 00             	or     DWORD PTR [edi+0x0],ebp
    1340:	00 00                	add    BYTE PTR [eax],al
    1342:	02 91 04 07 09 06    	add    dl,BYTE PTR [ecx+0x6090704]
    1348:	00 00                	add    BYTE PTR [eax],al
    134a:	01 09                	add    DWORD PTR [ecx],ecx
    134c:	3a 00                	cmp    al,BYTE PTR [eax]
    134e:	00 00                	add    BYTE PTR [eax],al
    1350:	02 91 08 07 aa 06    	add    dl,BYTE PTR [ecx+0x6aa0708]
    1356:	00 00                	add    BYTE PTR [eax],al
    1358:	01 09                	add    DWORD PTR [ecx],ecx
    135a:	3a 00                	cmp    al,BYTE PTR [eax]
    135c:	00 00                	add    BYTE PTR [eax],al
    135e:	02 91 0c 08 66 64    	add    dl,BYTE PTR [ecx+0x6466080c]
    1364:	00 01                	add    BYTE PTR [ecx],al
    1366:	09 3a                	or     DWORD PTR [edx],edi
    1368:	00 00                	add    BYTE PTR [eax],al
    136a:	00 02                	add    BYTE PTR [edx],al
    136c:	91                   	xchg   ecx,eax
    136d:	10 07                	adc    BYTE PTR [edi],al
    136f:	0e                   	push   cs
    1370:	06                   	push   es
    1371:	00 00                	add    BYTE PTR [eax],al
    1373:	01 09                	add    DWORD PTR [ecx],ecx
    1375:	aa                   	stos   BYTE PTR es:[edi],al
    1376:	00 00                	add    BYTE PTR [eax],al
    1378:	00 02                	add    BYTE PTR [edx],al
    137a:	91                   	xchg   ecx,eax
    137b:	14 00                	adc    al,0x0
    137d:	09 3f                	or     DWORD PTR [edi],edi
    137f:	00 00                	add    BYTE PTR [eax],al
    1381:	00 06                	add    BYTE PTR [esi],al
    1383:	33 56 00             	xor    edx,DWORD PTR [esi+0x0]
    1386:	00 00                	add    BYTE PTR [eax],al
    1388:	05 03 54 35 00       	add    eax,0x355403
    138d:	30 09                	xor    BYTE PTR [ecx],cl
    138f:	aa                   	stos   BYTE PTR es:[edi],al
    1390:	00 00                	add    BYTE PTR [eax],al
    1392:	00 06                	add    BYTE PTR [esi],al
    1394:	34 56                	xor    al,0x56
    1396:	00 00                	add    BYTE PTR [eax],al
    1398:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
    139e:	30 09                	xor    BYTE PTR [ecx],cl
    13a0:	56                   	push   esi
    13a1:	01 00                	add    DWORD PTR [eax],eax
    13a3:	00 06                	add    BYTE PTR [esi],al
    13a5:	35 56 00 00 00       	xor    eax,0x56
    13aa:	05 03 50 35 00       	add    eax,0x355003
    13af:	30 09                	xor    BYTE PTR [ecx],cl
    13b1:	48                   	dec    eax
    13b2:	00 00                	add    BYTE PTR [eax],al
    13b4:	00 07                	add    BYTE PTR [edi],al
    13b6:	36 8f 00             	pop    DWORD PTR ss:[eax]
    13b9:	00 00                	add    BYTE PTR [eax],al
    13bb:	05 03 5c 35 00       	add    eax,0x355c03
    13c0:	30 00                	xor    BYTE PTR [eax],al
    13c2:	50                   	push   eax
    13c3:	04 00                	add    al,0x0
    13c5:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    13c8:	88 07                	mov    BYTE PTR [edi],al
    13ca:	00 00                	add    BYTE PTR [eax],al
    13cc:	04 01                	add    al,0x1
    13ce:	ef                   	out    dx,eax
    13cf:	00 00                	add    BYTE PTR [eax],al
    13d1:	00 0c 2c             	add    BYTE PTR [esp+ebp*1],cl
    13d4:	07                   	pop    es
    13d5:	00 00                	add    BYTE PTR [eax],al
    13d7:	6d                   	ins    DWORD PTR es:[edi],dx
    13d8:	00 00                	add    BYTE PTR [eax],al
    13da:	00 b4 0b 00 30 a5 00 	add    BYTE PTR [ebx+ecx*1+0xa53000],dh
    13e1:	00 00                	add    BYTE PTR [eax],al
    13e3:	06                   	push   es
    13e4:	09 00                	or     DWORD PTR [eax],eax
    13e6:	00 02                	add    BYTE PTR [edx],al
    13e8:	04 05                	add    al,0x5
    13ea:	69 6e 74 00 03 78 03 	imul   ebp,DWORD PTR [esi+0x74],0x3780300
    13f1:	00 00                	add    BYTE PTR [eax],al
    13f3:	03 d8                	add    ebx,eax
    13f5:	37                   	aaa    
    13f6:	00 00                	add    BYTE PTR [eax],al
    13f8:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    13fb:	07                   	pop    es
    13fc:	32 00                	xor    al,BYTE PTR [eax]
    13fe:	00 00                	add    BYTE PTR [eax],al
    1400:	04 04                	add    al,0x4
    1402:	05 05 00 00 00       	add    eax,0x5
    1407:	04 08                	add    al,0x8
    1409:	05 00 00 00 00       	add    eax,0x0
    140e:	04 0c                	add    al,0xc
    1410:	04 96                	add    al,0x96
    1412:	00 00                	add    BYTE PTR [eax],al
    1414:	00 05 91 06 00 00    	add    BYTE PTR ds:0x691,al
    141a:	0c 02                	or     al,0x2
    141c:	17                   	pop    ss
    141d:	84 00                	test   BYTE PTR [eax],al
    141f:	00 00                	add    BYTE PTR [eax],al
    1421:	06                   	push   es
    1422:	ac                   	lods   al,BYTE PTR ds:[esi]
    1423:	07                   	pop    es
    1424:	00 00                	add    BYTE PTR [eax],al
    1426:	02 19                	add    bl,BYTE PTR [ecx]
    1428:	84 00                	test   BYTE PTR [eax],al
    142a:	00 00                	add    BYTE PTR [eax],al
    142c:	00 06                	add    BYTE PTR [esi],al
    142e:	af                   	scas   eax,DWORD PTR es:[edi]
    142f:	05 00 00 02 19       	add    eax,0x19020000
    1434:	84 00                	test   BYTE PTR [eax],al
    1436:	00 00                	add    BYTE PTR [eax],al
    1438:	04 06                	add    al,0x6
    143a:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
    143b:	07                   	pop    es
    143c:	00 00                	add    BYTE PTR [eax],al
    143e:	02 1a                	add    bl,BYTE PTR [edx]
    1440:	8a 00                	mov    al,BYTE PTR [eax]
    1442:	00 00                	add    BYTE PTR [eax],al
    1444:	08 00                	or     BYTE PTR [eax],al
    1446:	07                   	pop    es
    1447:	04 53                	add    al,0x53
    1449:	00 00                	add    BYTE PTR [eax],al
    144b:	00 08                	add    BYTE PTR [eax],cl
    144d:	04 03                	add    al,0x3
    144f:	7d 07                	jge    1458 <sysEnter_Vector-0x12eba8>
    1451:	00 00                	add    BYTE PTR [eax],al
    1453:	02 1b                	add    bl,BYTE PTR [ebx]
    1455:	53                   	push   ebx
    1456:	00 00                	add    BYTE PTR [eax],al
    1458:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    145b:	06                   	push   es
    145c:	51                   	push   ecx
    145d:	00 00                	add    BYTE PTR [eax],al
    145f:	00 04 02             	add    BYTE PTR [edx+eax*1],al
    1462:	05 e5 00 00 00       	add    eax,0xe5
    1467:	04 01                	add    al,0x1
    1469:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    146c:	00 00                	add    BYTE PTR [eax],al
    146e:	04 02                	add    al,0x2
    1470:	07                   	pop    es
    1471:	0e                   	push   cs
    1472:	00 00                	add    BYTE PTR [eax],al
    1474:	00 03                	add    BYTE PTR [ebx],al
    1476:	39 06                	cmp    DWORD PTR [esi],eax
    1478:	00 00                	add    BYTE PTR [eax],al
    147a:	04 37                	add    al,0x37
    147c:	be 00 00 00 04       	mov    esi,0x4000000
    1481:	08 07                	or     BYTE PTR [edi],al
    1483:	28 00                	sub    BYTE PTR [eax],al
    1485:	00 00                	add    BYTE PTR [eax],al
    1487:	05 42 06 00 00       	add    eax,0x642
    148c:	14 05                	adc    al,0x5
    148e:	1b f6                	sbb    esi,esi
    1490:	00 00                	add    BYTE PTR [eax],al
    1492:	00 06                	add    BYTE PTR [esi],al
    1494:	40                   	inc    eax
    1495:	07                   	pop    es
    1496:	00 00                	add    BYTE PTR [eax],al
    1498:	05 1d 8c 00 00       	add    eax,0x8c1d
    149d:	00 00                	add    BYTE PTR [eax],al
    149f:	06                   	push   es
    14a0:	bb 06 00 00 05       	mov    ebx,0x5000006
    14a5:	1e                   	push   ds
    14a6:	37                   	aaa    
    14a7:	00 00                	add    BYTE PTR [eax],al
    14a9:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
    14ac:	f4                   	hlt    
    14ad:	06                   	push   es
    14ae:	00 00                	add    BYTE PTR [eax],al
    14b0:	05 1f 27 01 00       	add    eax,0x1271f
    14b5:	00 10                	add    BYTE PTR [eax],dl
    14b7:	00 05 2b 06 00 00    	add    BYTE PTR ds:0x62b,al
    14bd:	0c 05                	or     al,0x5
    14bf:	37                   	aaa    
    14c0:	27                   	daa    
    14c1:	01 00                	add    DWORD PTR [eax],eax
    14c3:	00 06                	add    BYTE PTR [esi],al
    14c5:	25 07 00 00 05       	and    eax,0x5000007
    14ca:	39 30                	cmp    DWORD PTR [eax],esi
    14cc:	02 00                	add    al,BYTE PTR [eax]
    14ce:	00 00                	add    BYTE PTR [eax],al
    14d0:	06                   	push   es
    14d1:	0e                   	push   cs
    14d2:	07                   	pop    es
    14d3:	00 00                	add    BYTE PTR [eax],al
    14d5:	05 3a 3d 02 00       	add    eax,0x23d3a
    14da:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    14dd:	e4 06                	in     al,0x6
    14df:	00 00                	add    BYTE PTR [eax],al
    14e1:	05 3b 27 01 00       	add    eax,0x1273b
    14e6:	00 08                	add    BYTE PTR [eax],cl
    14e8:	00 07                	add    BYTE PTR [edi],al
    14ea:	04 f6                	add    al,0xf6
    14ec:	00 00                	add    BYTE PTR [eax],al
    14ee:	00 05 59 06 00 00    	add    BYTE PTR ds:0x659,al
    14f4:	0c 05                	or     al,0x5
    14f6:	22 5e 01             	and    bl,BYTE PTR [esi+0x1]
    14f9:	00 00                	add    BYTE PTR [eax],al
    14fb:	06                   	push   es
    14fc:	4e                   	dec    esi
    14fd:	06                   	push   es
    14fe:	00 00                	add    BYTE PTR [eax],al
    1500:	05 24 27 01 00       	add    eax,0x12724
    1505:	00 00                	add    BYTE PTR [eax],al
    1507:	06                   	push   es
    1508:	a1 06 00 00 05       	mov    eax,ds:0x5000006
    150d:	25 5e 01 00 00       	and    eax,0x15e
    1512:	04 06                	add    al,0x6
    1514:	47                   	inc    edi
    1515:	07                   	pop    es
    1516:	00 00                	add    BYTE PTR [eax],al
    1518:	05 26 25 00 00       	add    eax,0x2526
    151d:	00 08                	add    BYTE PTR [eax],cl
    151f:	00 07                	add    BYTE PTR [edi],al
    1521:	04 c5                	add    al,0xc5
    1523:	00 00                	add    BYTE PTR [eax],al
    1525:	00 05 10 07 00 00    	add    BYTE PTR ds:0x710,al
    152b:	24 05                	and    al,0x5
    152d:	29 d1                	sub    ecx,edx
    152f:	01 00                	add    DWORD PTR [eax],eax
    1531:	00 06                	add    BYTE PTR [esi],al
    1533:	b5 06                	mov    ch,0x6
    1535:	00 00                	add    BYTE PTR [eax],al
    1537:	05 2b 37 00 00       	add    eax,0x372b
    153c:	00 00                	add    BYTE PTR [eax],al
    153e:	06                   	push   es
    153f:	76 07                	jbe    1548 <sysEnter_Vector-0x12eab8>
    1541:	00 00                	add    BYTE PTR [eax],al
    1543:	05 2c ac 00 00       	add    eax,0xac2c
    1548:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    154b:	da 06                	fiadd  DWORD PTR [esi]
    154d:	00 00                	add    BYTE PTR [eax],al
    154f:	05 2d ac 00 00       	add    eax,0xac2d
    1554:	00 06                	add    BYTE PTR [esi],al
    1556:	06                   	push   es
    1557:	c1 06 00             	rol    DWORD PTR [esi],0x0
    155a:	00 05 2e 37 00 00    	add    BYTE PTR ds:0x372e,al
    1560:	00 08                	add    BYTE PTR [eax],cl
    1562:	06                   	push   es
    1563:	b1 07                	mov    cl,0x7
    1565:	00 00                	add    BYTE PTR [eax],al
    1567:	05 2f 37 00 00       	add    eax,0x372f
    156c:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
    156f:	a8 06                	test   al,0x6
    1571:	00 00                	add    BYTE PTR [eax],al
    1573:	05 30 37 00 00       	add    eax,0x3730
    1578:	00 10                	add    BYTE PTR [eax],dl
    157a:	06                   	push   es
    157b:	9f                   	lahf   
    157c:	07                   	pop    es
    157d:	00 00                	add    BYTE PTR [eax],al
    157f:	05 31 1a 02 00       	add    eax,0x21a31
    1584:	00 14 06             	add    BYTE PTR [esi+eax*1],dl
    1587:	57                   	push   edi
    1588:	06                   	push   es
    1589:	00 00                	add    BYTE PTR [eax],al
    158b:	05 32 2d 01 00       	add    eax,0x12d32
    1590:	00 18                	add    BYTE PTR [eax],bl
    1592:	00 05 80 06 00 00    	add    BYTE PTR ds:0x680,al
    1598:	14 05                	adc    al,0x5
    159a:	3e 1a 02             	sbb    al,BYTE PTR ds:[edx]
    159d:	00 00                	add    BYTE PTR [eax],al
    159f:	06                   	push   es
    15a0:	d3 06                	rol    DWORD PTR [esi],cl
    15a2:	00 00                	add    BYTE PTR [eax],al
    15a4:	05 40 57 02 00       	add    eax,0x25740
    15a9:	00 00                	add    BYTE PTR [eax],al
    15ab:	06                   	push   es
    15ac:	70 07                	jo     15b5 <sysEnter_Vector-0x12ea4b>
    15ae:	00 00                	add    BYTE PTR [eax],al
    15b0:	05 41 57 02 00       	add    eax,0x25741
    15b5:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    15b8:	08 07                	or     BYTE PTR [edi],al
    15ba:	00 00                	add    BYTE PTR [eax],al
    15bc:	05 42 57 02 00       	add    eax,0x25742
    15c1:	00 08                	add    BYTE PTR [eax],cl
    15c3:	06                   	push   es
    15c4:	9b                   	fwait
    15c5:	06                   	push   es
    15c6:	00 00                	add    BYTE PTR [eax],al
    15c8:	05 43 71 02 00       	add    eax,0x27143
    15cd:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
    15d0:	67 06                	addr16 push es
    15d2:	00 00                	add    BYTE PTR [eax],al
    15d4:	05 44 9a 02 00       	add    eax,0x29a44
    15d9:	00 10                	add    BYTE PTR [eax],dl
    15db:	00 07                	add    BYTE PTR [edi],al
    15dd:	04 20                	add    al,0x20
    15df:	02 00                	add    al,BYTE PTR [eax]
    15e1:	00 09                	add    BYTE PTR [ecx],cl
    15e3:	d1 01                	rol    DWORD PTR [ecx],1
    15e5:	00 00                	add    BYTE PTR [eax],al
    15e7:	03 16                	add    edx,DWORD PTR [esi]
    15e9:	07                   	pop    es
    15ea:	00 00                	add    BYTE PTR [eax],al
    15ec:	05 35 64 01 00       	add    eax,0x16435
    15f1:	00 07                	add    BYTE PTR [edi],al
    15f3:	04 36                	add    al,0x36
    15f5:	02 00                	add    al,BYTE PTR [eax]
    15f7:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    15fa:	06                   	push   es
    15fb:	58                   	pop    eax
    15fc:	00 00                	add    BYTE PTR [eax],al
    15fe:	00 07                	add    BYTE PTR [edi],al
    1600:	04 64                	add    al,0x64
    1602:	01 00                	add    DWORD PTR [eax],eax
    1604:	00 0a                	add    BYTE PTR [edx],cl
    1606:	25 00 00 00 57       	and    eax,0x57000000
    160b:	02 00                	add    al,BYTE PTR [eax]
    160d:	00 0b                	add    BYTE PTR [ebx],cl
    160f:	3d 02 00 00 0b       	cmp    eax,0xb000002
    1614:	27                   	daa    
    1615:	01 00                	add    DWORD PTR [eax],eax
    1617:	00 00                	add    BYTE PTR [eax],al
    1619:	07                   	pop    es
    161a:	04 43                	add    al,0x43
    161c:	02 00                	add    al,BYTE PTR [eax]
    161e:	00 0a                	add    BYTE PTR [edx],cl
    1620:	25 00 00 00 71       	and    eax,0x71000000
    1625:	02 00                	add    al,BYTE PTR [eax]
    1627:	00 0b                	add    BYTE PTR [ebx],cl
    1629:	3d 02 00 00 0b       	cmp    eax,0xb000002
    162e:	f6 00 00             	test   BYTE PTR [eax],0x0
    1631:	00 00                	add    BYTE PTR [eax],al
    1633:	07                   	pop    es
    1634:	04 5d                	add    al,0x5d
    1636:	02 00                	add    al,BYTE PTR [eax]
    1638:	00 0a                	add    BYTE PTR [edx],cl
    163a:	25 00 00 00 9a       	and    eax,0x9a000000
    163f:	02 00                	add    al,BYTE PTR [eax]
    1641:	00 0b                	add    BYTE PTR [ebx],cl
    1643:	3d 02 00 00 0b       	cmp    eax,0xb000002
    1648:	27                   	daa    
    1649:	01 00                	add    DWORD PTR [eax],eax
    164b:	00 0b                	add    BYTE PTR [ebx],cl
    164d:	3d 02 00 00 0b       	cmp    eax,0xb000002
    1652:	27                   	daa    
    1653:	01 00                	add    DWORD PTR [eax],eax
    1655:	00 0b                	add    BYTE PTR [ebx],cl
    1657:	37                   	aaa    
    1658:	00 00                	add    BYTE PTR [eax],al
    165a:	00 00                	add    BYTE PTR [eax],al
    165c:	07                   	pop    es
    165d:	04 77                	add    al,0x77
    165f:	02 00                	add    al,BYTE PTR [eax]
    1661:	00 03                	add    BYTE PTR [ebx],al
    1663:	32 06                	xor    al,BYTE PTR [esi]
    1665:	00 00                	add    BYTE PTR [eax],al
    1667:	05 47 ab 02 00       	add    eax,0x2ab47
    166c:	00 05 03 07 00 00    	add    BYTE PTR ds:0x703,al
    1672:	10 05 4f dc 02 00    	adc    BYTE PTR ds:0x2dc4f,al
    1678:	00 06                	add    BYTE PTR [esi],al
    167a:	ed                   	in     eax,dx
    167b:	06                   	push   es
    167c:	00 00                	add    BYTE PTR [eax],al
    167e:	05 51 30 02 00       	add    eax,0x23051
    1683:	00 00                	add    BYTE PTR [eax],al
    1685:	06                   	push   es
    1686:	38 07                	cmp    BYTE PTR [edi],al
    1688:	00 00                	add    BYTE PTR [eax],al
    168a:	05 52 3d 02 00       	add    eax,0x23d52
    168f:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    1692:	62 06                	bound  eax,QWORD PTR [esi]
    1694:	00 00                	add    BYTE PTR [eax],al
    1696:	05 53 dc 02 00       	add    eax,0x2dc53
    169b:	00 08                	add    BYTE PTR [eax],cl
    169d:	00 05 86 07 00 00    	add    BYTE PTR ds:0x786,al
    16a3:	08 05 49 01 03 00    	or     BYTE PTR ds:0x30149,al
    16a9:	00 06                	add    BYTE PTR [esi],al
    16ab:	b0 06                	mov    al,0x6
    16ad:	00 00                	add    BYTE PTR [eax],al
    16af:	05 4b 2b 03 00       	add    eax,0x32b4b
    16b4:	00 00                	add    BYTE PTR [eax],al
    16b6:	06                   	push   es
    16b7:	25 06 00 00 05       	and    eax,0x5000006
    16bc:	4c                   	dec    esp
    16bd:	5a                   	pop    edx
    16be:	03 00                	add    eax,DWORD PTR [eax]
    16c0:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    16c3:	0a 2c 00             	or     ch,BYTE PTR [eax+eax*1]
    16c6:	00 00                	add    BYTE PTR [eax],al
    16c8:	1f                   	pop    ds
    16c9:	03 00                	add    eax,DWORD PTR [eax]
    16cb:	00 0b                	add    BYTE PTR [ebx],cl
    16cd:	1f                   	pop    ds
    16ce:	03 00                	add    eax,DWORD PTR [eax]
    16d0:	00 0b                	add    BYTE PTR [ebx],cl
    16d2:	30 02                	xor    BYTE PTR [edx],al
    16d4:	00 00                	add    BYTE PTR [eax],al
    16d6:	0b 2c 00             	or     ebp,DWORD PTR [eax+eax*1]
    16d9:	00 00                	add    BYTE PTR [eax],al
    16db:	0b 25 03 00 00 00    	or     esp,DWORD PTR ds:0x3
    16e1:	07                   	pop    es
    16e2:	04 ab                	add    al,0xab
    16e4:	02 00                	add    al,BYTE PTR [eax]
    16e6:	00 07                	add    BYTE PTR [edi],al
    16e8:	04 b3                	add    al,0xb3
    16ea:	00 00                	add    BYTE PTR [eax],al
    16ec:	00 07                	add    BYTE PTR [edi],al
    16ee:	04 01                	add    al,0x1
    16f0:	03 00                	add    eax,DWORD PTR [eax]
    16f2:	00 0a                	add    BYTE PTR [edx],cl
    16f4:	2c 00                	sub    al,0x0
    16f6:	00 00                	add    BYTE PTR [eax],al
    16f8:	4f                   	dec    edi
    16f9:	03 00                	add    eax,DWORD PTR [eax]
    16fb:	00 0b                	add    BYTE PTR [ebx],cl
    16fd:	1f                   	pop    ds
    16fe:	03 00                	add    eax,DWORD PTR [eax]
    1700:	00 0b                	add    BYTE PTR [ebx],cl
    1702:	4f                   	dec    edi
    1703:	03 00                	add    eax,DWORD PTR [eax]
    1705:	00 0b                	add    BYTE PTR [ebx],cl
    1707:	2c 00                	sub    al,0x0
    1709:	00 00                	add    BYTE PTR [eax],al
    170b:	0b 25 03 00 00 00    	or     esp,DWORD PTR ds:0x3
    1711:	07                   	pop    es
    1712:	04 55                	add    al,0x55
    1714:	03 00                	add    eax,DWORD PTR [eax]
    1716:	00 09                	add    BYTE PTR [ecx],cl
    1718:	36 02 00             	add    al,BYTE PTR ss:[eax]
    171b:	00 07                	add    BYTE PTR [edi],al
    171d:	04 31                	add    al,0x31
    171f:	03 00                	add    eax,DWORD PTR [eax]
    1721:	00 03                	add    BYTE PTR [ebx],al
    1723:	51                   	push   ecx
    1724:	07                   	pop    es
    1725:	00 00                	add    BYTE PTR [eax],al
    1727:	05 4d dc 02 00       	add    eax,0x2dc4d
    172c:	00 0c c7             	add    BYTE PTR [edi+eax*8],cl
    172f:	06                   	push   es
    1730:	00 00                	add    BYTE PTR [eax],al
    1732:	01 0f                	add    DWORD PTR [edi],ecx
    1734:	2c 00                	sub    al,0x0
    1736:	00 00                	add    BYTE PTR [eax],al
    1738:	b4 0b                	mov    ah,0xb
    173a:	00 30                	add    BYTE PTR [eax],dh
    173c:	2c 00                	sub    al,0x0
    173e:	00 00                	add    BYTE PTR [eax],al
    1740:	01 9c bd 03 00 00 0d 	add    DWORD PTR [ebp+edi*4+0xd000003],ebx
    1747:	7b 06                	jnp    174f <sysEnter_Vector-0x12e8b1>
    1749:	00 00                	add    BYTE PTR [eax],al
    174b:	01 0f                	add    DWORD PTR [edi],ecx
    174d:	1f                   	pop    ds
    174e:	03 00                	add    eax,DWORD PTR [eax]
    1750:	00 02                	add    BYTE PTR [edx],al
    1752:	91                   	xchg   ecx,eax
    1753:	00 0d 06 02 00 00    	add    BYTE PTR ds:0x206,cl
    1759:	01 0f                	add    DWORD PTR [edi],ecx
    175b:	30 02                	xor    BYTE PTR [edx],al
    175d:	00 00                	add    BYTE PTR [eax],al
    175f:	02 91 04 0d 9d 03    	add    dl,BYTE PTR [ecx+0x39d0d04]
    1765:	00 00                	add    BYTE PTR [eax],al
    1767:	01 0f                	add    DWORD PTR [edi],ecx
    1769:	2c 00                	sub    al,0x0
    176b:	00 00                	add    BYTE PTR [eax],al
    176d:	02 91 08 0d 96 07    	add    dl,BYTE PTR [ecx+0x7960d08]
    1773:	00 00                	add    BYTE PTR [eax],al
    1775:	01 0f                	add    DWORD PTR [edi],ecx
    1777:	25 03 00 00 02       	and    eax,0x2000003
    177c:	91                   	xchg   ecx,eax
    177d:	0c 00                	or     al,0x0
    177f:	0c 6e                	or     al,0x6e
    1781:	06                   	push   es
    1782:	00 00                	add    BYTE PTR [eax],al
    1784:	01 14 2c             	add    DWORD PTR [esp+ebp*1],edx
    1787:	00 00                	add    BYTE PTR [eax],al
    1789:	00 e0                	add    al,ah
    178b:	0b 00                	or     eax,DWORD PTR [eax]
    178d:	30 26                	xor    BYTE PTR [esi],ah
    178f:	00 00                	add    BYTE PTR [eax],al
    1791:	00 01                	add    BYTE PTR [ecx],al
    1793:	9c                   	pushf  
    1794:	0f 04                	(bad)  
    1796:	00 00                	add    BYTE PTR [eax],al
    1798:	0d 7b 06 00 00       	or     eax,0x67b
    179d:	01 14 1f             	add    DWORD PTR [edi+ebx*1],edx
    17a0:	03 00                	add    eax,DWORD PTR [eax]
    17a2:	00 02                	add    BYTE PTR [edx],al
    17a4:	91                   	xchg   ecx,eax
    17a5:	00 0d 06 02 00 00    	add    BYTE PTR ds:0x206,cl
    17ab:	01 14 4f             	add    DWORD PTR [edi+ecx*2],edx
    17ae:	03 00                	add    eax,DWORD PTR [eax]
    17b0:	00 02                	add    BYTE PTR [edx],al
    17b2:	91                   	xchg   ecx,eax
    17b3:	04 0d                	add    al,0xd
    17b5:	9d                   	popf   
    17b6:	03 00                	add    eax,DWORD PTR [eax]
    17b8:	00 01                	add    BYTE PTR [ecx],al
    17ba:	14 2c                	adc    al,0x2c
    17bc:	00 00                	add    BYTE PTR [eax],al
    17be:	00 02                	add    BYTE PTR [edx],al
    17c0:	91                   	xchg   ecx,eax
    17c1:	08 0d 96 07 00 00    	or     BYTE PTR ds:0x796,cl
    17c7:	01 14 25 03 00 00 02 	add    DWORD PTR [eiz*1+0x2000003],edx
    17ce:	91                   	xchg   ecx,eax
    17cf:	0c 00                	or     al,0x0
    17d1:	0e                   	push   cs
    17d2:	1e                   	push   ds
    17d3:	07                   	pop    es
    17d4:	00 00                	add    BYTE PTR [eax],al
    17d6:	01 19                	add    DWORD PTR [ecx],ebx
    17d8:	06                   	push   es
    17d9:	0c 00                	or     al,0x0
    17db:	30 53 00             	xor    BYTE PTR [ebx+0x0],dl
    17de:	00 00                	add    BYTE PTR [eax],al
    17e0:	01 9c 0f 62 06 00 00 	add    DWORD PTR [edi+ecx*1+0x662],ebx
    17e7:	01 0b                	add    DWORD PTR [ebx],ecx
    17e9:	60                   	pusha  
    17ea:	03 00                	add    eax,DWORD PTR [eax]
    17ec:	00 05 03 64 35 00    	add    BYTE PTR ds:0x356403,al
    17f2:	30 0f                	xor    BYTE PTR [edi],cl
    17f4:	63 07                	arpl   WORD PTR [edi],ax
    17f6:	00 00                	add    BYTE PTR [eax],al
    17f8:	01 0c 25 02 00 00 05 	add    DWORD PTR [eiz*1+0x5000002],ecx
    17ff:	03 a0 33 00 30 0f    	add    esp,DWORD PTR [eax+0xf300033]
    1805:	fb                   	sti    
    1806:	06                   	push   es
    1807:	00 00                	add    BYTE PTR [eax],al
    1809:	01 0d a0 02 00 00    	add    DWORD PTR ds:0x2a0,ecx
    180f:	05 03 6c 35 00       	add    eax,0x356c03
    1814:	30 00                	xor    BYTE PTR [eax],al
    1816:	6b 01 00             	imul   eax,DWORD PTR [ecx],0x0
    1819:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    181c:	58                   	pop    eax
    181d:	08 00                	or     BYTE PTR [eax],al
    181f:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1822:	ef                   	out    dx,eax
    1823:	00 00                	add    BYTE PTR [eax],al
    1825:	00 0c ca             	add    BYTE PTR [edx+ecx*8],cl
    1828:	07                   	pop    es
    1829:	00 00                	add    BYTE PTR [eax],al
    182b:	6d                   	ins    DWORD PTR es:[edi],dx
    182c:	00 00                	add    BYTE PTR [eax],al
    182e:	00 5c 0c 00          	add    BYTE PTR [esp+ecx*1+0x0],bl
    1832:	30 ad 00 00 00 ea    	xor    BYTE PTR [ebp-0x16000000],ch
    1838:	09 00                	or     DWORD PTR [eax],eax
    183a:	00 02                	add    BYTE PTR [edx],al
    183c:	01 06                	add    DWORD PTR [esi],eax
    183e:	58                   	pop    eax
    183f:	00 00                	add    BYTE PTR [eax],al
    1841:	00 02                	add    BYTE PTR [edx],al
    1843:	01 06                	add    DWORD PTR [esi],eax
    1845:	51                   	push   ecx
    1846:	00 00                	add    BYTE PTR [eax],al
    1848:	00 02                	add    BYTE PTR [edx],al
    184a:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1850:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1857:	02 08                	add    cl,BYTE PTR [eax]
    1859:	05 00 00 00 00       	add    eax,0x0
    185e:	02 01                	add    al,BYTE PTR [ecx]
    1860:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1863:	00 00                	add    BYTE PTR [eax],al
    1865:	02 02                	add    al,BYTE PTR [edx]
    1867:	07                   	pop    es
    1868:	0e                   	push   cs
    1869:	00 00                	add    BYTE PTR [eax],al
    186b:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    186e:	00 00                	add    BYTE PTR [eax],al
    1870:	00 02                	add    BYTE PTR [edx],al
    1872:	34 61                	xor    al,0x61
    1874:	00 00                	add    BYTE PTR [eax],al
    1876:	00 02                	add    BYTE PTR [edx],al
    1878:	04 07                	add    al,0x7
    187a:	32 00                	xor    al,BYTE PTR [eax]
    187c:	00 00                	add    BYTE PTR [eax],al
    187e:	02 08                	add    cl,BYTE PTR [eax]
    1880:	07                   	pop    es
    1881:	28 00                	sub    BYTE PTR [eax],al
    1883:	00 00                	add    BYTE PTR [eax],al
    1885:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    188c:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    188f:	96                   	xchg   esi,eax
    1890:	00 00                	add    BYTE PTR [eax],al
    1892:	00 02                	add    BYTE PTR [edx],al
    1894:	01 02                	add    DWORD PTR [edx],eax
    1896:	90                   	nop
    1897:	00 00                	add    BYTE PTR [eax],al
    1899:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    18a0:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    18a3:	00 00                	add    BYTE PTR [eax],al
    18a5:	05 04 95 00 00       	add    eax,0x9504
    18aa:	00 06                	add    BYTE PTR [esi],al
    18ac:	25 00 00 00 02       	and    eax,0x2000000
    18b1:	04 07                	add    al,0x7
    18b3:	2d 00 00 00 02       	sub    eax,0x2000000
    18b8:	04 07                	add    al,0x7
    18ba:	dc 00                	fadd   QWORD PTR [eax]
    18bc:	00 00                	add    BYTE PTR [eax],al
    18be:	05 04 25 00 00       	add    eax,0x2504
    18c3:	00 07                	add    BYTE PTR [edi],al
    18c5:	b7 07                	mov    bh,0x7
    18c7:	00 00                	add    BYTE PTR [eax],al
    18c9:	01 1d a8 00 00 00    	add    DWORD PTR ds:0xa8,ebx
    18cf:	5c                   	pop    esp
    18d0:	0c 00                	or     al,0x0
    18d2:	30 3e                	xor    BYTE PTR [esi],bh
    18d4:	00 00                	add    BYTE PTR [eax],al
    18d6:	00 01                	add    BYTE PTR [ecx],al
    18d8:	9c                   	pushf  
    18d9:	e4 00                	in     al,0x0
    18db:	00 00                	add    BYTE PTR [eax],al
    18dd:	08 cb                	or     bl,cl
    18df:	05 00 00 01 1d       	add    eax,0x1d010000
    18e4:	a8 00                	test   al,0x0
    18e6:	00 00                	add    BYTE PTR [eax],al
    18e8:	02 91 00 09 73 72    	add    dl,BYTE PTR [ecx+0x72730900]
    18ee:	63 00                	arpl   WORD PTR [eax],ax
    18f0:	01 1d 8f 00 00 00    	add    DWORD PTR ds:0x8f,ebx
    18f6:	02 91 04 00 0a be    	add    dl,BYTE PTR [ecx-0x41f5fffc]
    18fc:	07                   	pop    es
    18fd:	00 00                	add    BYTE PTR [eax],al
    18ff:	01 23                	add    DWORD PTR [ebx],esp
    1901:	9a 0c 00 30 6f 00 00 	call   0x0:0x6f30000c
    1908:	00 01                	add    BYTE PTR [ecx],al
    190a:	9c                   	pushf  
    190b:	2a 01                	sub    al,BYTE PTR [ecx]
    190d:	00 00                	add    BYTE PTR [eax],al
    190f:	09 70 00             	or     DWORD PTR [eax+0x0],esi
    1912:	01 23                	add    DWORD PTR [ebx],esp
    1914:	a8 00                	test   al,0x0
    1916:	00 00                	add    BYTE PTR [eax],al
    1918:	02 91 00 09 71 00    	add    dl,BYTE PTR [ecx+0x710900]
    191e:	01 23                	add    DWORD PTR [ebx],esp
    1920:	a8 00                	test   al,0x0
    1922:	00 00                	add    BYTE PTR [eax],al
    1924:	02 91 04 0b 63 00    	add    dl,BYTE PTR [ecx+0x630b04]
    192a:	01 24 3a             	add    DWORD PTR [edx+edi*1],esp
    192d:	00 00                	add    BYTE PTR [eax],al
    192f:	00 02                	add    BYTE PTR [edx],al
    1931:	91                   	xchg   ecx,eax
    1932:	74 0b                	je     193f <sysEnter_Vector-0x12e6c1>
    1934:	64 00 01             	add    BYTE PTR fs:[ecx],al
    1937:	24 3a                	and    al,0x3a
    1939:	00 00                	add    BYTE PTR [eax],al
    193b:	00 02                	add    BYTE PTR [edx],al
    193d:	91                   	xchg   ecx,eax
    193e:	70 00                	jo     1940 <sysEnter_Vector-0x12e6c0>
    1940:	0c 3f                	or     al,0x3f
    1942:	00 00                	add    BYTE PTR [eax],al
    1944:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    1947:	56                   	push   esi
    1948:	00 00                	add    BYTE PTR [eax],al
    194a:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
    1950:	30 0c aa             	xor    BYTE PTR [edx+ebp*4],cl
    1953:	00 00                	add    BYTE PTR [eax],al
    1955:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1958:	56                   	push   esi
    1959:	00 00                	add    BYTE PTR [eax],al
    195b:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
    1961:	30 0c 56             	xor    BYTE PTR [esi+edx*2],cl
    1964:	01 00                	add    DWORD PTR [eax],eax
    1966:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    196d:	05 03 50 35 00       	add    eax,0x355003
    1972:	30 0c 48             	xor    BYTE PTR [eax+ecx*2],cl
    1975:	00 00                	add    BYTE PTR [eax],al
    1977:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    197d:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
    1983:	30 00                	xor    BYTE PTR [eax],al
    1985:	5a                   	pop    edx
    1986:	01 00                	add    DWORD PTR [eax],eax
    1988:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    198b:	13 09                	adc    ecx,DWORD PTR [ecx]
    198d:	00 00                	add    BYTE PTR [eax],al
    198f:	04 01                	add    al,0x1
    1991:	ef                   	out    dx,eax
    1992:	00 00                	add    BYTE PTR [eax],al
    1994:	00 0c e6             	add    BYTE PTR [esi+eiz*8],cl
    1997:	07                   	pop    es
    1998:	00 00                	add    BYTE PTR [eax],al
    199a:	6d                   	ins    DWORD PTR es:[edi],dx
    199b:	00 00                	add    BYTE PTR [eax],al
    199d:	00 0c 0d 00 30 5e 00 	add    BYTE PTR [ecx*1+0x5e3000],cl
    19a4:	00 00                	add    BYTE PTR [eax],al
    19a6:	bd 0a 00 00 02       	mov    ebp,0x200000a
    19ab:	01 06                	add    DWORD PTR [esi],eax
    19ad:	58                   	pop    eax
    19ae:	00 00                	add    BYTE PTR [eax],al
    19b0:	00 02                	add    BYTE PTR [edx],al
    19b2:	01 06                	add    DWORD PTR [esi],eax
    19b4:	51                   	push   ecx
    19b5:	00 00                	add    BYTE PTR [eax],al
    19b7:	00 02                	add    BYTE PTR [edx],al
    19b9:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    19bf:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    19c6:	02 08                	add    cl,BYTE PTR [eax]
    19c8:	05 00 00 00 00       	add    eax,0x0
    19cd:	02 01                	add    al,BYTE PTR [ecx]
    19cf:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    19d2:	00 00                	add    BYTE PTR [eax],al
    19d4:	02 02                	add    al,BYTE PTR [edx]
    19d6:	07                   	pop    es
    19d7:	0e                   	push   cs
    19d8:	00 00                	add    BYTE PTR [eax],al
    19da:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    19dd:	00 00                	add    BYTE PTR [eax],al
    19df:	00 02                	add    BYTE PTR [edx],al
    19e1:	34 61                	xor    al,0x61
    19e3:	00 00                	add    BYTE PTR [eax],al
    19e5:	00 02                	add    BYTE PTR [edx],al
    19e7:	04 07                	add    al,0x7
    19e9:	32 00                	xor    al,BYTE PTR [eax]
    19eb:	00 00                	add    BYTE PTR [eax],al
    19ed:	02 08                	add    cl,BYTE PTR [eax]
    19ef:	07                   	pop    es
    19f0:	28 00                	sub    BYTE PTR [eax],al
    19f2:	00 00                	add    BYTE PTR [eax],al
    19f4:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    19fb:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    19fe:	96                   	xchg   esi,eax
    19ff:	00 00                	add    BYTE PTR [eax],al
    1a01:	00 02                	add    BYTE PTR [edx],al
    1a03:	01 02                	add    DWORD PTR [edx],eax
    1a05:	90                   	nop
    1a06:	00 00                	add    BYTE PTR [eax],al
    1a08:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1a0f:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1a12:	00 00                	add    BYTE PTR [eax],al
    1a14:	05 04 95 00 00       	add    eax,0x9504
    1a19:	00 06                	add    BYTE PTR [esi],al
    1a1b:	25 00 00 00 02       	and    eax,0x2000000
    1a20:	04 07                	add    al,0x7
    1a22:	2d 00 00 00 02       	sub    eax,0x2000000
    1a27:	04 07                	add    al,0x7
    1a29:	dc 00                	fadd   QWORD PTR [eax]
    1a2b:	00 00                	add    BYTE PTR [eax],al
    1a2d:	07                   	pop    es
    1a2e:	df 07                	fild   WORD PTR [edi]
    1a30:	00 00                	add    BYTE PTR [eax],al
    1a32:	01 18                	add    DWORD PTR [eax],ebx
    1a34:	3a 00                	cmp    al,BYTE PTR [eax]
    1a36:	00 00                	add    BYTE PTR [eax],al
    1a38:	0c 0d                	or     al,0xd
    1a3a:	00 30                	add    BYTE PTR [eax],dh
    1a3c:	5e                   	pop    esi
    1a3d:	00 00                	add    BYTE PTR [eax],al
    1a3f:	00 01                	add    BYTE PTR [ecx],al
    1a41:	9c                   	pushf  
    1a42:	0e                   	push   cs
    1a43:	01 00                	add    DWORD PTR [eax],eax
    1a45:	00 08                	add    BYTE PTR [eax],cl
    1a47:	70 31                	jo     1a7a <sysEnter_Vector-0x12e586>
    1a49:	00 01                	add    BYTE PTR [ecx],al
    1a4b:	18 8f 00 00 00 02    	sbb    BYTE PTR [edi+0x2000000],cl
    1a51:	91                   	xchg   ecx,eax
    1a52:	00 08                	add    BYTE PTR [eax],cl
    1a54:	70 32                	jo     1a88 <sysEnter_Vector-0x12e578>
    1a56:	00 01                	add    BYTE PTR [ecx],al
    1a58:	18 8f 00 00 00 02    	sbb    BYTE PTR [edi+0x2000000],cl
    1a5e:	91                   	xchg   ecx,eax
    1a5f:	04 09                	add    al,0x9
    1a61:	73 31                	jae    1a94 <sysEnter_Vector-0x12e56c>
    1a63:	00 01                	add    BYTE PTR [ecx],al
    1a65:	1a 0e                	sbb    cl,BYTE PTR [esi]
    1a67:	01 00                	add    DWORD PTR [eax],eax
    1a69:	00 01                	add    BYTE PTR [ecx],al
    1a6b:	53                   	push   ebx
    1a6c:	09 73 32             	or     DWORD PTR [ebx+0x32],esi
    1a6f:	00 01                	add    BYTE PTR [ecx],al
    1a71:	1b 0e                	sbb    ecx,DWORD PTR [esi]
    1a73:	01 00                	add    DWORD PTR [eax],eax
    1a75:	00 01                	add    BYTE PTR [ecx],al
    1a77:	56                   	push   esi
    1a78:	09 63 31             	or     DWORD PTR [ebx+0x31],esp
    1a7b:	00 01                	add    BYTE PTR [ecx],al
    1a7d:	1c 48                	sbb    al,0x48
    1a7f:	00 00                	add    BYTE PTR [eax],al
    1a81:	00 02                	add    BYTE PTR [edx],al
    1a83:	91                   	xchg   ecx,eax
    1a84:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1a85:	09 63 32             	or     DWORD PTR [ebx+0x32],esp
    1a88:	00 01                	add    BYTE PTR [ecx],al
    1a8a:	1c 48                	sbb    al,0x48
    1a8c:	00 00                	add    BYTE PTR [eax],al
    1a8e:	00 02                	add    BYTE PTR [edx],al
    1a90:	91                   	xchg   ecx,eax
    1a91:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1a92:	00 05 04 14 01 00    	add    BYTE PTR ds:0x11404,al
    1a98:	00 06                	add    BYTE PTR [esi],al
    1a9a:	48                   	dec    eax
    1a9b:	00 00                	add    BYTE PTR [eax],al
    1a9d:	00 0a                	add    BYTE PTR [edx],cl
    1a9f:	3f                   	aas    
    1aa0:	00 00                	add    BYTE PTR [eax],al
    1aa2:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    1aa5:	56                   	push   esi
    1aa6:	00 00                	add    BYTE PTR [eax],al
    1aa8:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
    1aae:	30 0a                	xor    BYTE PTR [edx],cl
    1ab0:	aa                   	stos   BYTE PTR es:[edi],al
    1ab1:	00 00                	add    BYTE PTR [eax],al
    1ab3:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1ab6:	56                   	push   esi
    1ab7:	00 00                	add    BYTE PTR [eax],al
    1ab9:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
    1abf:	30 0a                	xor    BYTE PTR [edx],cl
    1ac1:	56                   	push   esi
    1ac2:	01 00                	add    DWORD PTR [eax],eax
    1ac4:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    1acb:	05 03 50 35 00       	add    eax,0x355003
    1ad0:	30 0a                	xor    BYTE PTR [edx],cl
    1ad2:	48                   	dec    eax
    1ad3:	00 00                	add    BYTE PTR [eax],al
    1ad5:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    1adb:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
    1ae1:	30 00                	xor    BYTE PTR [eax],al
    1ae3:	7d 01                	jge    1ae6 <sysEnter_Vector-0x12e51a>
    1ae5:	00 00                	add    BYTE PTR [eax],al
    1ae7:	04 00                	add    al,0x0
    1ae9:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
    1aea:	09 00                	or     DWORD PTR [eax],eax
    1aec:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1aef:	ef                   	out    dx,eax
    1af0:	00 00                	add    BYTE PTR [eax],al
    1af2:	00 0c 10             	add    BYTE PTR [eax+edx*1],cl
    1af5:	08 00                	or     BYTE PTR [eax],al
    1af7:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1afa:	00 00                	add    BYTE PTR [eax],al
    1afc:	6c                   	ins    BYTE PTR es:[edi],dx
    1afd:	0d 00 30 87 00       	or     eax,0x873000
    1b02:	00 00                	add    BYTE PTR [eax],al
    1b04:	86 0b                	xchg   BYTE PTR [ebx],cl
    1b06:	00 00                	add    BYTE PTR [eax],al
    1b08:	02 01                	add    al,BYTE PTR [ecx]
    1b0a:	06                   	push   es
    1b0b:	58                   	pop    eax
    1b0c:	00 00                	add    BYTE PTR [eax],al
    1b0e:	00 02                	add    BYTE PTR [edx],al
    1b10:	01 06                	add    DWORD PTR [esi],eax
    1b12:	51                   	push   ecx
    1b13:	00 00                	add    BYTE PTR [eax],al
    1b15:	00 02                	add    BYTE PTR [edx],al
    1b17:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1b1d:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1b24:	02 08                	add    cl,BYTE PTR [eax]
    1b26:	05 00 00 00 00       	add    eax,0x0
    1b2b:	02 01                	add    al,BYTE PTR [ecx]
    1b2d:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1b30:	00 00                	add    BYTE PTR [eax],al
    1b32:	02 02                	add    al,BYTE PTR [edx]
    1b34:	07                   	pop    es
    1b35:	0e                   	push   cs
    1b36:	00 00                	add    BYTE PTR [eax],al
    1b38:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1b3b:	00 00                	add    BYTE PTR [eax],al
    1b3d:	00 02                	add    BYTE PTR [edx],al
    1b3f:	34 61                	xor    al,0x61
    1b41:	00 00                	add    BYTE PTR [eax],al
    1b43:	00 02                	add    BYTE PTR [edx],al
    1b45:	04 07                	add    al,0x7
    1b47:	32 00                	xor    al,BYTE PTR [eax]
    1b49:	00 00                	add    BYTE PTR [eax],al
    1b4b:	02 08                	add    cl,BYTE PTR [eax]
    1b4d:	07                   	pop    es
    1b4e:	28 00                	sub    BYTE PTR [eax],al
    1b50:	00 00                	add    BYTE PTR [eax],al
    1b52:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1b59:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1b5c:	96                   	xchg   esi,eax
    1b5d:	00 00                	add    BYTE PTR [eax],al
    1b5f:	00 02                	add    BYTE PTR [edx],al
    1b61:	01 02                	add    DWORD PTR [edx],eax
    1b63:	90                   	nop
    1b64:	00 00                	add    BYTE PTR [eax],al
    1b66:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1b6d:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1b70:	00 00                	add    BYTE PTR [eax],al
    1b72:	05 04 95 00 00       	add    eax,0x9504
    1b77:	00 06                	add    BYTE PTR [esi],al
    1b79:	25 00 00 00 02       	and    eax,0x2000000
    1b7e:	04 07                	add    al,0x7
    1b80:	2d 00 00 00 02       	sub    eax,0x2000000
    1b85:	04 07                	add    al,0x7
    1b87:	dc 00                	fadd   QWORD PTR [eax]
    1b89:	00 00                	add    BYTE PTR [eax],al
    1b8b:	05 04 25 00 00       	add    eax,0x2504
    1b90:	00 07                	add    BYTE PTR [edi],al
    1b92:	fb                   	sti    
    1b93:	07                   	pop    es
    1b94:	00 00                	add    BYTE PTR [eax],al
    1b96:	01 04 a8             	add    DWORD PTR [eax+ebp*4],eax
    1b99:	00 00                	add    BYTE PTR [eax],al
    1b9b:	00 6c 0d 00          	add    BYTE PTR [ebp+ecx*1+0x0],ch
    1b9f:	30 40 00             	xor    BYTE PTR [eax+0x0],al
    1ba2:	00 00                	add    BYTE PTR [eax],al
    1ba4:	01 9c ee 00 00 00 08 	add    DWORD PTR [esi+ebp*8+0x8000000],ebx
    1bab:	73 31                	jae    1bde <sysEnter_Vector-0x12e422>
    1bad:	00 01                	add    BYTE PTR [ecx],al
    1baf:	04 a8                	add    al,0xa8
    1bb1:	00 00                	add    BYTE PTR [eax],al
    1bb3:	00 02                	add    BYTE PTR [edx],al
    1bb5:	91                   	xchg   ecx,eax
    1bb6:	00 08                	add    BYTE PTR [eax],cl
    1bb8:	73 32                	jae    1bec <sysEnter_Vector-0x12e414>
    1bba:	00 01                	add    BYTE PTR [ecx],al
    1bbc:	04 8f                	add    al,0x8f
    1bbe:	00 00                	add    BYTE PTR [eax],al
    1bc0:	00 02                	add    BYTE PTR [edx],al
    1bc2:	91                   	xchg   ecx,eax
    1bc3:	04 09                	add    al,0x9
    1bc5:	73 00                	jae    1bc7 <sysEnter_Vector-0x12e439>
    1bc7:	01 06                	add    DWORD PTR [esi],eax
    1bc9:	a8 00                	test   al,0x0
    1bcb:	00 00                	add    BYTE PTR [eax],al
    1bcd:	02 91 74 00 07 08    	add    dl,BYTE PTR [ecx+0x8070074]
    1bd3:	08 00                	or     BYTE PTR [eax],al
    1bd5:	00 01                	add    BYTE PTR [ecx],al
    1bd7:	0e                   	push   cs
    1bd8:	a8 00                	test   al,0x0
    1bda:	00 00                	add    BYTE PTR [eax],al
    1bdc:	ac                   	lods   al,BYTE PTR ds:[esi]
    1bdd:	0d 00 30 47 00       	or     eax,0x473000
    1be2:	00 00                	add    BYTE PTR [eax],al
    1be4:	01 9c 3c 01 00 00 08 	add    DWORD PTR [esp+edi*1+0x8000001],ebx
    1beb:	73 31                	jae    1c1e <sysEnter_Vector-0x12e3e2>
    1bed:	00 01                	add    BYTE PTR [ecx],al
    1bef:	0e                   	push   cs
    1bf0:	a8 00                	test   al,0x0
    1bf2:	00 00                	add    BYTE PTR [eax],al
    1bf4:	02 91 00 08 73 32    	add    dl,BYTE PTR [ecx+0x32730800]
    1bfa:	00 01                	add    BYTE PTR [ecx],al
    1bfc:	0e                   	push   cs
    1bfd:	8f 00                	pop    DWORD PTR [eax]
    1bff:	00 00                	add    BYTE PTR [eax],al
    1c01:	02 91 04 0a 02 08    	add    dl,BYTE PTR [ecx+0x8020a04]
    1c07:	00 00                	add    BYTE PTR [eax],al
    1c09:	01 0e                	add    DWORD PTR [esi],ecx
    1c0b:	61                   	popa   
    1c0c:	00 00                	add    BYTE PTR [eax],al
    1c0e:	00 02                	add    BYTE PTR [edx],al
    1c10:	91                   	xchg   ecx,eax
    1c11:	08 09                	or     BYTE PTR [ecx],cl
    1c13:	73 00                	jae    1c15 <sysEnter_Vector-0x12e3eb>
    1c15:	01 10                	add    DWORD PTR [eax],edx
    1c17:	a8 00                	test   al,0x0
    1c19:	00 00                	add    BYTE PTR [eax],al
    1c1b:	02 91 74 00 0b 3f    	add    dl,BYTE PTR [ecx+0x3f0b0074]
    1c21:	00 00                	add    BYTE PTR [eax],al
    1c23:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    1c26:	56                   	push   esi
    1c27:	00 00                	add    BYTE PTR [eax],al
    1c29:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
    1c2f:	30 0b                	xor    BYTE PTR [ebx],cl
    1c31:	aa                   	stos   BYTE PTR es:[edi],al
    1c32:	00 00                	add    BYTE PTR [eax],al
    1c34:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1c37:	56                   	push   esi
    1c38:	00 00                	add    BYTE PTR [eax],al
    1c3a:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
    1c40:	30 0b                	xor    BYTE PTR [ebx],cl
    1c42:	56                   	push   esi
    1c43:	01 00                	add    DWORD PTR [eax],eax
    1c45:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    1c4c:	05 03 50 35 00       	add    eax,0x355003
    1c51:	30 0b                	xor    BYTE PTR [ebx],cl
    1c53:	48                   	dec    eax
    1c54:	00 00                	add    BYTE PTR [eax],al
    1c56:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    1c5c:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
    1c62:	30 00                	xor    BYTE PTR [eax],al
    1c64:	98                   	cwde   
    1c65:	00 00                	add    BYTE PTR [eax],al
    1c67:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1c6a:	46                   	inc    esi
    1c6b:	0a 00                	or     al,BYTE PTR [eax]
    1c6d:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1c70:	ef                   	out    dx,eax
    1c71:	00 00                	add    BYTE PTR [eax],al
    1c73:	00 0c 2c             	add    BYTE PTR [esp+ebp*1],cl
    1c76:	08 00                	or     BYTE PTR [eax],al
    1c78:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1c7b:	00 00                	add    BYTE PTR [eax],al
    1c7d:	f4                   	hlt    
    1c7e:	0d 00 30 31 00       	or     eax,0x313000
    1c83:	00 00                	add    BYTE PTR [eax],al
    1c85:	62 0c 00             	bound  ecx,QWORD PTR [eax+eax*1]
    1c88:	00 02                	add    BYTE PTR [edx],al
    1c8a:	04 05                	add    al,0x5
    1c8c:	69 6e 74 00 03 78 03 	imul   ebp,DWORD PTR [esi+0x74],0x3780300
    1c93:	00 00                	add    BYTE PTR [eax],al
    1c95:	02 d8                	add    bl,al
    1c97:	37                   	aaa    
    1c98:	00 00                	add    BYTE PTR [eax],al
    1c9a:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    1c9d:	07                   	pop    es
    1c9e:	32 00                	xor    al,BYTE PTR [eax]
    1ca0:	00 00                	add    BYTE PTR [eax],al
    1ca2:	04 04                	add    al,0x4
    1ca4:	05 05 00 00 00       	add    eax,0x5
    1ca9:	04 08                	add    al,0x8
    1cab:	05 00 00 00 00       	add    eax,0x0
    1cb0:	04 0c                	add    al,0xc
    1cb2:	04 96                	add    al,0x96
    1cb4:	00 00                	add    BYTE PTR [eax],al
    1cb6:	00 05 25 08 00 00    	add    BYTE PTR ds:0x825,al
    1cbc:	01 03                	add    DWORD PTR [ebx],eax
    1cbe:	2c 00                	sub    al,0x0
    1cc0:	00 00                	add    BYTE PTR [eax],al
    1cc2:	f4                   	hlt    
    1cc3:	0d 00 30 31 00       	or     eax,0x313000
    1cc8:	00 00                	add    BYTE PTR [eax],al
    1cca:	01 9c 89 00 00 00 06 	add    DWORD PTR [ecx+ecx*4+0x6000000],ebx
    1cd1:	73 74                	jae    1d47 <sysEnter_Vector-0x12e2b9>
    1cd3:	72 00                	jb     1cd5 <sysEnter_Vector-0x12e32b>
    1cd5:	01 03                	add    DWORD PTR [ebx],eax
    1cd7:	89 00                	mov    DWORD PTR [eax],eax
    1cd9:	00 00                	add    BYTE PTR [eax],al
    1cdb:	02 91 00 07 72 65    	add    dl,BYTE PTR [ecx+0x65720700]
    1ce1:	74 00                	je     1ce3 <sysEnter_Vector-0x12e31d>
    1ce3:	01 04 2c             	add    DWORD PTR [esp+ebp*1],eax
    1ce6:	00 00                	add    BYTE PTR [eax],al
    1ce8:	00 02                	add    BYTE PTR [edx],al
    1cea:	91                   	xchg   ecx,eax
    1ceb:	74 00                	je     1ced <sysEnter_Vector-0x12e313>
    1ced:	08 04 96             	or     BYTE PTR [esi+edx*4],al
    1cf0:	00 00                	add    BYTE PTR [eax],al
    1cf2:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1cf5:	06                   	push   es
    1cf6:	58                   	pop    eax
    1cf7:	00 00                	add    BYTE PTR [eax],al
    1cf9:	00 09                	add    BYTE PTR [ecx],cl
    1cfb:	8f 00                	pop    DWORD PTR [eax]
    1cfd:	00 00                	add    BYTE PTR [eax],al
    1cff:	00 a2 00 00 00 04    	add    BYTE PTR [edx+0x4000000],ah
    1d05:	00 c7                	add    bh,al
    1d07:	0a 00                	or     al,BYTE PTR [eax]
    1d09:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1d0c:	ef                   	out    dx,eax
    1d0d:	00 00                	add    BYTE PTR [eax],al
    1d0f:	00 0c 49             	add    BYTE PTR [ecx+ecx*2],cl
    1d12:	08 00                	or     BYTE PTR [eax],al
    1d14:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1d17:	00 00                	add    BYTE PTR [eax],al
    1d19:	28 0e                	sub    BYTE PTR [esi],cl
    1d1b:	00 30                	add    BYTE PTR [eax],dh
    1d1d:	67 00 00             	add    BYTE PTR [bx+si],al
    1d20:	00 f3                	add    bl,dh
    1d22:	0c 00                	or     al,0x0
    1d24:	00 02                	add    BYTE PTR [edx],al
    1d26:	04 05                	add    al,0x5
    1d28:	69 6e 74 00 03 78 03 	imul   ebp,DWORD PTR [esi+0x74],0x3780300
    1d2f:	00 00                	add    BYTE PTR [eax],al
    1d31:	02 d8                	add    bl,al
    1d33:	37                   	aaa    
    1d34:	00 00                	add    BYTE PTR [eax],al
    1d36:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    1d39:	07                   	pop    es
    1d3a:	32 00                	xor    al,BYTE PTR [eax]
    1d3c:	00 00                	add    BYTE PTR [eax],al
    1d3e:	04 04                	add    al,0x4
    1d40:	05 05 00 00 00       	add    eax,0x5
    1d45:	04 08                	add    al,0x8
    1d47:	05 00 00 00 00       	add    eax,0x0
    1d4c:	04 0c                	add    al,0xc
    1d4e:	04 96                	add    al,0x96
    1d50:	00 00                	add    BYTE PTR [eax],al
    1d52:	00 05 41 08 00 00    	add    BYTE PTR ds:0x841,al
    1d58:	01 0c 25 00 00 00 28 	add    DWORD PTR [eiz*1+0x28000000],ecx
    1d5f:	0e                   	push   cs
    1d60:	00 30                	add    BYTE PTR [eax],dh
    1d62:	67 00 00             	add    BYTE PTR [bx+si],al
    1d65:	00 01                	add    BYTE PTR [ecx],al
    1d67:	9c                   	pushf  
    1d68:	93                   	xchg   ebx,eax
    1d69:	00 00                	add    BYTE PTR [eax],al
    1d6b:	00 06                	add    BYTE PTR [esi],al
    1d6d:	73 31                	jae    1da0 <sysEnter_Vector-0x12e260>
    1d6f:	00 01                	add    BYTE PTR [ecx],al
    1d71:	0c 93                	or     al,0x93
    1d73:	00 00                	add    BYTE PTR [eax],al
    1d75:	00 02                	add    BYTE PTR [edx],al
    1d77:	91                   	xchg   ecx,eax
    1d78:	00 06                	add    BYTE PTR [esi],al
    1d7a:	73 32                	jae    1dae <sysEnter_Vector-0x12e252>
    1d7c:	00 01                	add    BYTE PTR [ecx],al
    1d7e:	0c 93                	or     al,0x93
    1d80:	00 00                	add    BYTE PTR [eax],al
    1d82:	00 02                	add    BYTE PTR [edx],al
    1d84:	91                   	xchg   ecx,eax
    1d85:	04 06                	add    al,0x6
    1d87:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1d88:	00 01                	add    BYTE PTR [ecx],al
    1d8a:	0c 2c                	or     al,0x2c
    1d8c:	00 00                	add    BYTE PTR [eax],al
    1d8e:	00 02                	add    BYTE PTR [edx],al
    1d90:	91                   	xchg   ecx,eax
    1d91:	08 00                	or     BYTE PTR [eax],al
    1d93:	07                   	pop    es
    1d94:	04 a0                	add    al,0xa0
    1d96:	00 00                	add    BYTE PTR [eax],al
    1d98:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1d9b:	06                   	push   es
    1d9c:	58                   	pop    eax
    1d9d:	00 00                	add    BYTE PTR [eax],al
    1d9f:	00 08                	add    BYTE PTR [eax],cl
    1da1:	99                   	cdq    
    1da2:	00 00                	add    BYTE PTR [eax],al
    1da4:	00 00                	add    BYTE PTR [eax],al
    1da6:	b4 00                	mov    ah,0x0
    1da8:	00 00                	add    BYTE PTR [eax],al
    1daa:	04 00                	add    al,0x0
    1dac:	39 0b                	cmp    DWORD PTR [ebx],ecx
    1dae:	00 00                	add    BYTE PTR [eax],al
    1db0:	04 01                	add    al,0x1
    1db2:	ef                   	out    dx,eax
    1db3:	00 00                	add    BYTE PTR [eax],al
    1db5:	00 0c 5f             	add    BYTE PTR [edi+ebx*2],cl
    1db8:	08 00                	or     BYTE PTR [eax],al
    1dba:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1dbd:	00 00                	add    BYTE PTR [eax],al
    1dbf:	90                   	nop
    1dc0:	0e                   	push   cs
    1dc1:	00 30                	add    BYTE PTR [eax],dh
    1dc3:	60                   	pusha  
    1dc4:	00 00                	add    BYTE PTR [eax],al
    1dc6:	00 9c 0d 00 00 02 04 	add    BYTE PTR [ebp+ecx*1+0x4020000],bl
    1dcd:	05 69 6e 74 00       	add    eax,0x746e69
    1dd2:	03 78 03             	add    edi,DWORD PTR [eax+0x3]
    1dd5:	00 00                	add    BYTE PTR [eax],al
    1dd7:	02 d8                	add    bl,al
    1dd9:	37                   	aaa    
    1dda:	00 00                	add    BYTE PTR [eax],al
    1ddc:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    1ddf:	07                   	pop    es
    1de0:	32 00                	xor    al,BYTE PTR [eax]
    1de2:	00 00                	add    BYTE PTR [eax],al
    1de4:	04 04                	add    al,0x4
    1de6:	05 05 00 00 00       	add    eax,0x5
    1deb:	04 08                	add    al,0x8
    1ded:	05 00 00 00 00       	add    eax,0x0
    1df2:	04 0c                	add    al,0xc
    1df4:	04 96                	add    al,0x96
    1df6:	00 00                	add    BYTE PTR [eax],al
    1df8:	00 05 75 08 00 00    	add    BYTE PTR ds:0x875,al
    1dfe:	01 0d 9f 00 00 00    	add    DWORD PTR ds:0x9f,ecx
    1e04:	90                   	nop
    1e05:	0e                   	push   cs
    1e06:	00 30                	add    BYTE PTR [eax],dh
    1e08:	60                   	pusha  
    1e09:	00 00                	add    BYTE PTR [eax],al
    1e0b:	00 01                	add    BYTE PTR [ecx],al
    1e0d:	9c                   	pushf  
    1e0e:	9f                   	lahf   
    1e0f:	00 00                	add    BYTE PTR [eax],al
    1e11:	00 06                	add    BYTE PTR [esi],al
    1e13:	73 31                	jae    1e46 <sysEnter_Vector-0x12e1ba>
    1e15:	00 01                	add    BYTE PTR [ecx],al
    1e17:	0d 9f 00 00 00       	or     eax,0x9f
    1e1c:	02 91 00 06 73 32    	add    dl,BYTE PTR [ecx+0x32730600]
    1e22:	00 01                	add    BYTE PTR [ecx],al
    1e24:	0d ac 00 00 00       	or     eax,0xac
    1e29:	02 91 04 06 6e 00    	add    dl,BYTE PTR [ecx+0x6e0604]
    1e2f:	01 0d 2c 00 00 00    	add    DWORD PTR ds:0x2c,ecx
    1e35:	02 91 08 07 73 00    	add    dl,BYTE PTR [ecx+0x730708]
    1e3b:	01 0f                	add    DWORD PTR [edi],ecx
    1e3d:	9f                   	lahf   
    1e3e:	00 00                	add    BYTE PTR [eax],al
    1e40:	00 02                	add    BYTE PTR [edx],al
    1e42:	91                   	xchg   ecx,eax
    1e43:	74 00                	je     1e45 <sysEnter_Vector-0x12e1bb>
    1e45:	08 04 a5 00 00 00 04 	or     BYTE PTR [eiz*4+0x4000000],al
    1e4c:	01 06                	add    DWORD PTR [esi],eax
    1e4e:	58                   	pop    eax
    1e4f:	00 00                	add    BYTE PTR [eax],al
    1e51:	00 08                	add    BYTE PTR [eax],cl
    1e53:	04 b2                	add    al,0xb2
    1e55:	00 00                	add    BYTE PTR [eax],al
    1e57:	00 09                	add    BYTE PTR [ecx],cl
    1e59:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
    1e5a:	00 00                	add    BYTE PTR [eax],al
    1e5c:	00 00                	add    BYTE PTR [eax],al
    1e5e:	8c 01                	mov    WORD PTR [ecx],es
    1e60:	00 00                	add    BYTE PTR [eax],al
    1e62:	04 00                	add    al,0x0
    1e64:	ba 0b 00 00 04       	mov    edx,0x400000b
    1e69:	01 ef                	add    edi,ebp
    1e6b:	00 00                	add    BYTE PTR [eax],al
    1e6d:	00 0c 7d 08 00 00 6d 	add    BYTE PTR [edi*2+0x6d000008],cl
    1e74:	00 00                	add    BYTE PTR [eax],al
    1e76:	00 f0                	add    al,dh
    1e78:	0e                   	push   cs
    1e79:	00 30                	add    BYTE PTR [eax],dh
    1e7b:	7d 01                	jge    1e7e <sysEnter_Vector-0x12e182>
    1e7d:	00 00                	add    BYTE PTR [eax],al
    1e7f:	3d 0e 00 00 02       	cmp    eax,0x200000e
    1e84:	01 06                	add    DWORD PTR [esi],eax
    1e86:	58                   	pop    eax
    1e87:	00 00                	add    BYTE PTR [eax],al
    1e89:	00 02                	add    BYTE PTR [edx],al
    1e8b:	01 06                	add    DWORD PTR [esi],eax
    1e8d:	51                   	push   ecx
    1e8e:	00 00                	add    BYTE PTR [eax],al
    1e90:	00 02                	add    BYTE PTR [edx],al
    1e92:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1e98:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1e9f:	02 08                	add    cl,BYTE PTR [eax]
    1ea1:	05 00 00 00 00       	add    eax,0x0
    1ea6:	02 01                	add    al,BYTE PTR [ecx]
    1ea8:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1eab:	00 00                	add    BYTE PTR [eax],al
    1ead:	02 02                	add    al,BYTE PTR [edx]
    1eaf:	07                   	pop    es
    1eb0:	0e                   	push   cs
    1eb1:	00 00                	add    BYTE PTR [eax],al
    1eb3:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1eb6:	00 00                	add    BYTE PTR [eax],al
    1eb8:	00 02                	add    BYTE PTR [edx],al
    1eba:	34 61                	xor    al,0x61
    1ebc:	00 00                	add    BYTE PTR [eax],al
    1ebe:	00 02                	add    BYTE PTR [edx],al
    1ec0:	04 07                	add    al,0x7
    1ec2:	32 00                	xor    al,BYTE PTR [eax]
    1ec4:	00 00                	add    BYTE PTR [eax],al
    1ec6:	02 08                	add    cl,BYTE PTR [eax]
    1ec8:	07                   	pop    es
    1ec9:	28 00                	sub    BYTE PTR [eax],al
    1ecb:	00 00                	add    BYTE PTR [eax],al
    1ecd:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1ed4:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1ed7:	96                   	xchg   esi,eax
    1ed8:	00 00                	add    BYTE PTR [eax],al
    1eda:	00 02                	add    BYTE PTR [edx],al
    1edc:	01 02                	add    DWORD PTR [edx],eax
    1ede:	90                   	nop
    1edf:	00 00                	add    BYTE PTR [eax],al
    1ee1:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1ee8:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1eeb:	00 00                	add    BYTE PTR [eax],al
    1eed:	05 04 95 00 00       	add    eax,0x9504
    1ef2:	00 06                	add    BYTE PTR [esi],al
    1ef4:	25 00 00 00 02       	and    eax,0x2000000
    1ef9:	04 07                	add    al,0x7
    1efb:	2d 00 00 00 02       	sub    eax,0x2000000
    1f00:	04 07                	add    al,0x7
    1f02:	dc 00                	fadd   QWORD PTR [eax]
    1f04:	00 00                	add    BYTE PTR [eax],al
    1f06:	05 04 25 00 00       	add    eax,0x2504
    1f0b:	00 07                	add    BYTE PTR [edi],al
    1f0d:	a0 08 00 00 01       	mov    al,ds:0x1000008
    1f12:	3b 9a 00 00 00 f0    	cmp    ebx,DWORD PTR [edx-0x10000000]
    1f18:	0e                   	push   cs
    1f19:	00 30                	add    BYTE PTR [eax],dh
    1f1b:	7d 01                	jge    1f1e <sysEnter_Vector-0x12e0e2>
    1f1d:	00 00                	add    BYTE PTR [eax],al
    1f1f:	01 9c 45 01 00 00 08 	add    DWORD PTR [ebp+eax*2+0x8000001],ebx
    1f26:	af                   	scas   eax,DWORD PTR es:[edi]
    1f27:	08 00                	or     BYTE PTR [eax],al
    1f29:	00 01                	add    BYTE PTR [ecx],al
    1f2b:	3b 8f 00 00 00 02    	cmp    ecx,DWORD PTR [edi+0x2000000]
    1f31:	91                   	xchg   ecx,eax
    1f32:	00 08                	add    BYTE PTR [eax],cl
    1f34:	a8 08                	test   al,0x8
    1f36:	00 00                	add    BYTE PTR [eax],al
    1f38:	01 3b                	add    DWORD PTR [ebx],edi
    1f3a:	45                   	inc    ebp
    1f3b:	01 00                	add    DWORD PTR [eax],eax
    1f3d:	00 02                	add    BYTE PTR [edx],al
    1f3f:	91                   	xchg   ecx,eax
    1f40:	04 08                	add    al,0x8
    1f42:	b4 08                	mov    ah,0x8
    1f44:	00 00                	add    BYTE PTR [eax],al
    1f46:	01 3b                	add    DWORD PTR [ebx],edi
    1f48:	3a 00                	cmp    al,BYTE PTR [eax]
    1f4a:	00 00                	add    BYTE PTR [eax],al
    1f4c:	02 91 08 09 73 00    	add    dl,BYTE PTR [ecx+0x730908]
    1f52:	01 3d 8f 00 00 00    	add    DWORD PTR ds:0x8f,edi
    1f58:	01 56 09             	add    DWORD PTR [esi+0x9],edx
    1f5b:	61                   	popa   
    1f5c:	63 63 00             	arpl   WORD PTR [ebx+0x0],sp
    1f5f:	01 3e                	add    DWORD PTR [esi],edi
    1f61:	9a 00 00 00 01 57 09 	call   0x957:0x1000000
    1f68:	63 00                	arpl   WORD PTR [eax],ax
    1f6a:	01 3f                	add    DWORD PTR [edi],edi
    1f6c:	3a 00                	cmp    al,BYTE PTR [eax]
    1f6e:	00 00                	add    BYTE PTR [eax],al
    1f70:	01 53 0a             	add    DWORD PTR [ebx+0xa],edx
    1f73:	92                   	xchg   edx,eax
    1f74:	08 00                	or     BYTE PTR [eax],al
    1f76:	00 01                	add    BYTE PTR [ecx],al
    1f78:	40                   	inc    eax
    1f79:	9a 00 00 00 0b 6e 65 	call   0x656e:0xb000000
    1f80:	67 00 01             	add    BYTE PTR [bx+di],al
    1f83:	41                   	inc    ecx
    1f84:	3a 00                	cmp    al,BYTE PTR [eax]
    1f86:	00 00                	add    BYTE PTR [eax],al
    1f88:	09 61 6e             	or     DWORD PTR [ecx+0x6e],esp
    1f8b:	79 00                	jns    1f8d <sysEnter_Vector-0x12e073>
    1f8d:	01 41 3a             	add    DWORD PTR [ecx+0x3a],eax
    1f90:	00 00                	add    BYTE PTR [eax],al
    1f92:	00 01                	add    BYTE PTR [ecx],al
    1f94:	51                   	push   ecx
    1f95:	0c 99                	or     al,0x99
    1f97:	08 00                	or     BYTE PTR [eax],al
    1f99:	00 01                	add    BYTE PTR [ecx],al
    1f9b:	41                   	inc    ecx
    1f9c:	3a 00                	cmp    al,BYTE PTR [eax]
    1f9e:	00 00                	add    BYTE PTR [eax],al
    1fa0:	01 52 00             	add    DWORD PTR [edx+0x0],edx
    1fa3:	05 04 a8 00 00       	add    eax,0xa804
    1fa8:	00 0d 3f 00 00 00    	add    BYTE PTR ds:0x3f,cl
    1fae:	04 33                	add    al,0x33
    1fb0:	56                   	push   esi
    1fb1:	00 00                	add    BYTE PTR [eax],al
    1fb3:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
    1fb9:	30 0d aa 00 00 00    	xor    BYTE PTR ds:0xaa,cl
    1fbf:	04 34                	add    al,0x34
    1fc1:	56                   	push   esi
    1fc2:	00 00                	add    BYTE PTR [eax],al
    1fc4:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
    1fca:	30 0d 56 01 00 00    	xor    BYTE PTR ds:0x156,cl
    1fd0:	04 35                	add    al,0x35
    1fd2:	56                   	push   esi
    1fd3:	00 00                	add    BYTE PTR [eax],al
    1fd5:	00 05 03 50 35 00    	add    BYTE PTR ds:0x355003,al
    1fdb:	30 0d 48 00 00 00    	xor    BYTE PTR ds:0x48,cl
    1fe1:	05 36 84 00 00       	add    eax,0x8436
    1fe6:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
    1fec:	30 00                	xor    BYTE PTR [eax],al
    1fee:	6c                   	ins    BYTE PTR es:[edi],dx
    1fef:	00 00                	add    BYTE PTR [eax],al
    1ff1:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1ff4:	75 0c                	jne    2002 <sysEnter_Vector-0x12dffe>
    1ff6:	00 00                	add    BYTE PTR [eax],al
    1ff8:	04 01                	add    al,0x1
    1ffa:	ef                   	out    dx,eax
    1ffb:	00 00                	add    BYTE PTR [eax],al
    1ffd:	00 0c b9             	add    BYTE PTR [ecx+edi*4],cl
    2000:	08 00                	or     BYTE PTR [eax],al
    2002:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2005:	00 00                	add    BYTE PTR [eax],al
    2007:	70 10                	jo     2019 <sysEnter_Vector-0x12dfe7>
    2009:	00 30                	add    BYTE PTR [eax],dh
    200b:	1d 00 00 00 94       	sbb    eax,0x94000000
    2010:	0f 00 00             	sldt   WORD PTR [eax]
    2013:	02 d0                	add    dl,al
    2015:	08 00                	or     BYTE PTR [eax],al
    2017:	00 01                	add    BYTE PTR [ecx],al
    2019:	01 5b 00             	add    DWORD PTR [ebx+0x0],ebx
    201c:	00 00                	add    BYTE PTR [eax],al
    201e:	70 10                	jo     2030 <sysEnter_Vector-0x12dfd0>
    2020:	00 30                	add    BYTE PTR [eax],dh
    2022:	1d 00 00 00 01       	sbb    eax,0x1000000
    2027:	9c                   	pushf  
    2028:	5b                   	pop    ebx
    2029:	00 00                	add    BYTE PTR [eax],al
    202b:	00 03                	add    BYTE PTR [ebx],al
    202d:	76 61                	jbe    2090 <sysEnter_Vector-0x12df70>
    202f:	6c                   	ins    BYTE PTR es:[edi],dx
    2030:	00 01                	add    BYTE PTR [ecx],al
    2032:	01 5b 00             	add    DWORD PTR [ebx+0x0],ebx
    2035:	00 00                	add    BYTE PTR [eax],al
    2037:	02 91 00 03 63 6e    	add    dl,BYTE PTR [ecx+0x6e630300]
    203d:	74 00                	je     203f <sysEnter_Vector-0x12dfc1>
    203f:	01 01                	add    DWORD PTR [ecx],eax
    2041:	68 00 00 00 02       	push   0x2000000
    2046:	91                   	xchg   ecx,eax
    2047:	04 00                	add    al,0x0
    2049:	04 04                	add    al,0x4
    204b:	61                   	popa   
    204c:	00 00                	add    BYTE PTR [eax],al
    204e:	00 05 01 06 58 00    	add    BYTE PTR ds:0x580601,al
    2054:	00 00                	add    BYTE PTR [eax],al
    2056:	06                   	push   es
    2057:	04 05                	add    al,0x5
    2059:	69 6e 74 00 00 8a 01 	imul   ebp,DWORD PTR [esi+0x74],0x18a0000
    2060:	00 00                	add    BYTE PTR [eax],al
    2062:	04 00                	add    al,0x0
    2064:	d3 0c 00             	ror    DWORD PTR [eax+eax*1],cl
    2067:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    206a:	ef                   	out    dx,eax
    206b:	00 00                	add    BYTE PTR [eax],al
    206d:	00 0c d8             	add    BYTE PTR [eax+ebx*8],cl
    2070:	08 00                	or     BYTE PTR [eax],al
    2072:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2075:	00 00                	add    BYTE PTR [eax],al
    2077:	90                   	nop
    2078:	10 00                	adc    BYTE PTR [eax],al
    207a:	30 9c 01 00 00 db 0f 	xor    BYTE PTR [ecx+eax*1+0xfdb0000],bl
    2081:	00 00                	add    BYTE PTR [eax],al
    2083:	02 01                	add    al,BYTE PTR [ecx]
    2085:	06                   	push   es
    2086:	58                   	pop    eax
    2087:	00 00                	add    BYTE PTR [eax],al
    2089:	00 02                	add    BYTE PTR [edx],al
    208b:	01 06                	add    DWORD PTR [esi],eax
    208d:	51                   	push   ecx
    208e:	00 00                	add    BYTE PTR [eax],al
    2090:	00 02                	add    BYTE PTR [edx],al
    2092:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    2098:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    209f:	02 08                	add    cl,BYTE PTR [eax]
    20a1:	05 00 00 00 00       	add    eax,0x0
    20a6:	02 01                	add    al,BYTE PTR [ecx]
    20a8:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    20ab:	00 00                	add    BYTE PTR [eax],al
    20ad:	02 02                	add    al,BYTE PTR [edx]
    20af:	07                   	pop    es
    20b0:	0e                   	push   cs
    20b1:	00 00                	add    BYTE PTR [eax],al
    20b3:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    20b6:	00 00                	add    BYTE PTR [eax],al
    20b8:	00 02                	add    BYTE PTR [edx],al
    20ba:	34 61                	xor    al,0x61
    20bc:	00 00                	add    BYTE PTR [eax],al
    20be:	00 02                	add    BYTE PTR [edx],al
    20c0:	04 07                	add    al,0x7
    20c2:	32 00                	xor    al,BYTE PTR [eax]
    20c4:	00 00                	add    BYTE PTR [eax],al
    20c6:	02 08                	add    cl,BYTE PTR [eax]
    20c8:	07                   	pop    es
    20c9:	28 00                	sub    BYTE PTR [eax],al
    20cb:	00 00                	add    BYTE PTR [eax],al
    20cd:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    20d4:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    20d7:	96                   	xchg   esi,eax
    20d8:	00 00                	add    BYTE PTR [eax],al
    20da:	00 02                	add    BYTE PTR [edx],al
    20dc:	01 02                	add    DWORD PTR [edx],eax
    20de:	90                   	nop
    20df:	00 00                	add    BYTE PTR [eax],al
    20e1:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    20e8:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    20eb:	00 00                	add    BYTE PTR [eax],al
    20ed:	05 04 95 00 00       	add    eax,0x9504
    20f2:	00 06                	add    BYTE PTR [esi],al
    20f4:	25 00 00 00 02       	and    eax,0x2000000
    20f9:	04 07                	add    al,0x7
    20fb:	2d 00 00 00 02       	sub    eax,0x2000000
    2100:	04 07                	add    al,0x7
    2102:	dc 00                	fadd   QWORD PTR [eax]
    2104:	00 00                	add    BYTE PTR [eax],al
    2106:	05 04 25 00 00       	add    eax,0x2504
    210b:	00 07                	add    BYTE PTR [edi],al
    210d:	ed                   	in     eax,dx
    210e:	08 00                	or     BYTE PTR [eax],al
    2110:	00 01                	add    BYTE PTR [ecx],al
    2112:	57                   	push   edi
    2113:	6f                   	outs   dx,DWORD PTR ds:[esi]
    2114:	00 00                	add    BYTE PTR [eax],al
    2116:	00 90 10 00 30 9c    	add    BYTE PTR [eax-0x63cffff0],dl
    211c:	01 00                	add    DWORD PTR [eax],eax
    211e:	00 01                	add    BYTE PTR [ecx],al
    2120:	9c                   	pushf  
    2121:	43                   	inc    ebx
    2122:	01 00                	add    DWORD PTR [eax],eax
    2124:	00 08                	add    BYTE PTR [eax],cl
    2126:	af                   	scas   eax,DWORD PTR es:[edi]
    2127:	08 00                	or     BYTE PTR [eax],al
    2129:	00 01                	add    BYTE PTR [ecx],al
    212b:	57                   	push   edi
    212c:	8f 00                	pop    DWORD PTR [eax]
    212e:	00 00                	add    BYTE PTR [eax],al
    2130:	02 91 00 08 a8 08    	add    dl,BYTE PTR [ecx+0x8a80800]
    2136:	00 00                	add    BYTE PTR [eax],al
    2138:	01 57 43             	add    DWORD PTR [edi+0x43],edx
    213b:	01 00                	add    DWORD PTR [eax],eax
    213d:	00 02                	add    BYTE PTR [edx],al
    213f:	91                   	xchg   ecx,eax
    2140:	04 08                	add    al,0x8
    2142:	b4 08                	mov    ah,0x8
    2144:	00 00                	add    BYTE PTR [eax],al
    2146:	01 57 3a             	add    DWORD PTR [edi+0x3a],edx
    2149:	00 00                	add    BYTE PTR [eax],al
    214b:	00 02                	add    BYTE PTR [edx],al
    214d:	91                   	xchg   ecx,eax
    214e:	08 09                	or     BYTE PTR [ecx],cl
    2150:	73 00                	jae    2152 <sysEnter_Vector-0x12deae>
    2152:	01 59 8f             	add    DWORD PTR [ecx-0x71],ebx
    2155:	00 00                	add    BYTE PTR [eax],al
    2157:	00 01                	add    BYTE PTR [ecx],al
    2159:	56                   	push   esi
    215a:	09 61 63             	or     DWORD PTR [ecx+0x63],esp
    215d:	63 00                	arpl   WORD PTR [eax],ax
    215f:	01 5a 9a             	add    DWORD PTR [edx-0x66],ebx
    2162:	00 00                	add    BYTE PTR [eax],al
    2164:	00 01                	add    BYTE PTR [ecx],al
    2166:	57                   	push   edi
    2167:	09 63 00             	or     DWORD PTR [ebx+0x0],esp
    216a:	01 5b 3a             	add    DWORD PTR [ebx+0x3a],ebx
    216d:	00 00                	add    BYTE PTR [eax],al
    216f:	00 01                	add    BYTE PTR [ecx],al
    2171:	53                   	push   ebx
    2172:	0a 92 08 00 00 01    	or     dl,BYTE PTR [edx+0x1000008]
    2178:	5c                   	pop    esp
    2179:	9a 00 00 00 0b 6e 65 	call   0x656e:0xb000000
    2180:	67 00 01             	add    BYTE PTR [bx+di],al
    2183:	5d                   	pop    ebp
    2184:	3a 00                	cmp    al,BYTE PTR [eax]
    2186:	00 00                	add    BYTE PTR [eax],al
    2188:	09 61 6e             	or     DWORD PTR [ecx+0x6e],esp
    218b:	79 00                	jns    218d <sysEnter_Vector-0x12de73>
    218d:	01 5d 3a             	add    DWORD PTR [ebp+0x3a],ebx
    2190:	00 00                	add    BYTE PTR [eax],al
    2192:	00 01                	add    BYTE PTR [ecx],al
    2194:	51                   	push   ecx
    2195:	0a 99 08 00 00 01    	or     bl,BYTE PTR [ecx+0x1000008]
    219b:	5d                   	pop    ebp
    219c:	3a 00                	cmp    al,BYTE PTR [eax]
    219e:	00 00                	add    BYTE PTR [eax],al
    21a0:	00 05 04 a8 00 00    	add    BYTE PTR ds:0xa804,al
    21a6:	00 0c 3f             	add    BYTE PTR [edi+edi*1],cl
    21a9:	00 00                	add    BYTE PTR [eax],al
    21ab:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    21ae:	56                   	push   esi
    21af:	00 00                	add    BYTE PTR [eax],al
    21b1:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
    21b7:	30 0c aa             	xor    BYTE PTR [edx+ebp*4],cl
    21ba:	00 00                	add    BYTE PTR [eax],al
    21bc:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    21bf:	56                   	push   esi
    21c0:	00 00                	add    BYTE PTR [eax],al
    21c2:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
    21c8:	30 0c 56             	xor    BYTE PTR [esi+edx*2],cl
    21cb:	01 00                	add    DWORD PTR [eax],eax
    21cd:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    21d4:	05 03 50 35 00       	add    eax,0x355003
    21d9:	30 0c 48             	xor    BYTE PTR [eax+ecx*2],cl
    21dc:	00 00                	add    BYTE PTR [eax],al
    21de:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    21e4:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
    21ea:	30 00                	xor    BYTE PTR [eax],al
    21ec:	ad                   	lods   eax,DWORD PTR ds:[esi]
    21ed:	01 00                	add    DWORD PTR [eax],eax
    21ef:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    21f2:	7f 0d                	jg     2201 <sysEnter_Vector-0x12ddff>
    21f4:	00 00                	add    BYTE PTR [eax],al
    21f6:	04 01                	add    al,0x1
    21f8:	ef                   	out    dx,eax
    21f9:	00 00                	add    BYTE PTR [eax],al
    21fb:	00 0c 01             	add    BYTE PTR [ecx+eax*1],cl
    21fe:	09 00                	or     DWORD PTR [eax],eax
    2200:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2203:	00 00                	add    BYTE PTR [eax],al
    2205:	2c 12                	sub    al,0x12
    2207:	00 30                	add    BYTE PTR [eax],dh
    2209:	53                   	push   ebx
    220a:	01 00                	add    DWORD PTR [eax],eax
    220c:	00 5e 11             	add    BYTE PTR [esi+0x11],bl
    220f:	00 00                	add    BYTE PTR [eax],al
    2211:	02 01                	add    al,BYTE PTR [ecx]
    2213:	06                   	push   es
    2214:	58                   	pop    eax
    2215:	00 00                	add    BYTE PTR [eax],al
    2217:	00 02                	add    BYTE PTR [edx],al
    2219:	01 06                	add    DWORD PTR [esi],eax
    221b:	51                   	push   ecx
    221c:	00 00                	add    BYTE PTR [eax],al
    221e:	00 02                	add    BYTE PTR [edx],al
    2220:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    2226:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    222d:	02 08                	add    cl,BYTE PTR [eax]
    222f:	05 00 00 00 00       	add    eax,0x0
    2234:	04 3a                	add    al,0x3a
    2236:	05 00 00 02 2e       	add    eax,0x2e020000
    223b:	53                   	push   ebx
    223c:	00 00                	add    BYTE PTR [eax],al
    223e:	00 02                	add    BYTE PTR [edx],al
    2240:	01 08                	add    DWORD PTR [eax],ecx
    2242:	4f                   	dec    edi
    2243:	00 00                	add    BYTE PTR [eax],al
    2245:	00 02                	add    BYTE PTR [edx],al
    2247:	02 07                	add    al,BYTE PTR [edi]
    2249:	0e                   	push   cs
    224a:	00 00                	add    BYTE PTR [eax],al
    224c:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    224f:	00 00                	add    BYTE PTR [eax],al
    2251:	00 02                	add    BYTE PTR [edx],al
    2253:	34 6c                	xor    al,0x6c
    2255:	00 00                	add    BYTE PTR [eax],al
    2257:	00 02                	add    BYTE PTR [edx],al
    2259:	04 07                	add    al,0x7
    225b:	32 00                	xor    al,BYTE PTR [eax]
    225d:	00 00                	add    BYTE PTR [eax],al
    225f:	02 08                	add    cl,BYTE PTR [eax]
    2261:	07                   	pop    es
    2262:	28 00                	sub    BYTE PTR [eax],al
    2264:	00 00                	add    BYTE PTR [eax],al
    2266:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    226d:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    2270:	96                   	xchg   esi,eax
    2271:	00 00                	add    BYTE PTR [eax],al
    2273:	00 02                	add    BYTE PTR [edx],al
    2275:	01 02                	add    DWORD PTR [edx],eax
    2277:	90                   	nop
    2278:	00 00                	add    BYTE PTR [eax],al
    227a:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    2281:	2a 7a 00             	sub    bh,BYTE PTR [edx+0x0]
    2284:	00 00                	add    BYTE PTR [eax],al
    2286:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
    2289:	2d 00 00 00 02       	sub    eax,0x2000000
    228e:	04 07                	add    al,0x7
    2290:	dc 00                	fadd   QWORD PTR [eax]
    2292:	00 00                	add    BYTE PTR [eax],al
    2294:	05 04 25 00 00       	add    eax,0x2504
    2299:	00 06                	add    BYTE PTR [esi],al
    229b:	17                   	pop    ss
    229c:	09 00                	or     DWORD PTR [eax],eax
    229e:	00 01                	add    BYTE PTR [ecx],al
    22a0:	04 a8                	add    al,0xa8
    22a2:	00 00                	add    BYTE PTR [eax],al
    22a4:	00 2c 12             	add    BYTE PTR [edx+edx*1],ch
    22a7:	00 30                	add    BYTE PTR [eax],dh
    22a9:	b5 00                	mov    ch,0x0
    22ab:	00 00                	add    BYTE PTR [eax],al
    22ad:	01 9c 0a 01 00 00 07 	add    DWORD PTR [edx+ecx*1+0x7000001],ebx
    22b4:	28 09                	sub    BYTE PTR [ecx],cl
    22b6:	00 00                	add    BYTE PTR [eax],al
    22b8:	01 04 0a             	add    DWORD PTR [edx+ecx*1],eax
    22bb:	01 00                	add    DWORD PTR [eax],eax
    22bd:	00 02                	add    BYTE PTR [edx],al
    22bf:	91                   	xchg   ecx,eax
    22c0:	00 08                	add    BYTE PTR [eax],cl
    22c2:	fb                   	sti    
    22c3:	08 00                	or     BYTE PTR [eax],al
    22c5:	00 01                	add    BYTE PTR [ecx],al
    22c7:	06                   	push   es
    22c8:	48                   	dec    eax
    22c9:	00 00                	add    BYTE PTR [eax],al
    22cb:	00 02                	add    BYTE PTR [edx],al
    22cd:	91                   	xchg   ecx,eax
    22ce:	6f                   	outs   dx,DWORD PTR ds:[esi]
    22cf:	08 f4                	or     ah,dh
    22d1:	08 00                	or     BYTE PTR [eax],al
    22d3:	00 01                	add    BYTE PTR [ecx],al
    22d5:	06                   	push   es
    22d6:	48                   	dec    eax
    22d7:	00 00                	add    BYTE PTR [eax],al
    22d9:	00 02                	add    BYTE PTR [edx],al
    22db:	91                   	xchg   ecx,eax
    22dc:	6d                   	ins    DWORD PTR es:[edi],dx
    22dd:	09 91 12 00 30 46    	or     DWORD PTR [ecx+0x46300012],edx
    22e3:	00 00                	add    BYTE PTR [eax],al
    22e5:	00 0a                	add    BYTE PTR [edx],cl
    22e7:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    22e9:	64 00 01             	add    BYTE PTR fs:[ecx],al
    22ec:	10 48 00             	adc    BYTE PTR [eax+0x0],cl
    22ef:	00 00                	add    BYTE PTR [eax],al
    22f1:	02 91 6e 00 00 05    	add    dl,BYTE PTR [ecx+0x500006e]
    22f7:	04 a8                	add    al,0xa8
    22f9:	00 00                	add    BYTE PTR [eax],al
    22fb:	00 06                	add    BYTE PTR [esi],al
    22fd:	1f                   	pop    ds
    22fe:	09 00                	or     DWORD PTR [eax],eax
    2300:	00 01                	add    BYTE PTR [ecx],al
    2302:	18 a8 00 00 00 e1    	sbb    BYTE PTR [eax-0x1f000000],ch
    2308:	12 00                	adc    al,BYTE PTR [eax]
    230a:	30 9e 00 00 00 01    	xor    BYTE PTR [esi+0x1000000],bl
    2310:	9c                   	pushf  
    2311:	6c                   	ins    BYTE PTR es:[edi],dx
    2312:	01 00                	add    DWORD PTR [eax],eax
    2314:	00 07                	add    BYTE PTR [edi],al
    2316:	28 09                	sub    BYTE PTR [ecx],cl
    2318:	00 00                	add    BYTE PTR [eax],al
    231a:	01 18                	add    DWORD PTR [eax],ebx
    231c:	a8 00                	test   al,0x0
    231e:	00 00                	add    BYTE PTR [eax],al
    2320:	02 91 00 08 fb 08    	add    dl,BYTE PTR [ecx+0x8fb0800]
    2326:	00 00                	add    BYTE PTR [eax],al
    2328:	01 1a                	add    DWORD PTR [edx],ebx
    232a:	48                   	dec    eax
    232b:	00 00                	add    BYTE PTR [eax],al
    232d:	00 02                	add    BYTE PTR [edx],al
    232f:	91                   	xchg   ecx,eax
    2330:	6f                   	outs   dx,DWORD PTR ds:[esi]
    2331:	08 f4                	or     ah,dh
    2333:	08 00                	or     BYTE PTR [eax],al
    2335:	00 01                	add    BYTE PTR [ecx],al
    2337:	1a 48 00             	sbb    cl,BYTE PTR [eax+0x0]
    233a:	00 00                	add    BYTE PTR [eax],al
    233c:	02 91 6d 09 38 13    	add    dl,BYTE PTR [ecx+0x1338096d]
    2342:	00 30                	add    BYTE PTR [eax],dh
    2344:	3f                   	aas    
    2345:	00 00                	add    BYTE PTR [eax],al
    2347:	00 0a                	add    BYTE PTR [edx],cl
    2349:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    234b:	64 00 01             	add    BYTE PTR fs:[ecx],al
    234e:	24 48                	and    al,0x48
    2350:	00 00                	add    BYTE PTR [eax],al
    2352:	00 02                	add    BYTE PTR [edx],al
    2354:	91                   	xchg   ecx,eax
    2355:	6e                   	outs   dx,BYTE PTR ds:[esi]
    2356:	00 00                	add    BYTE PTR [eax],al
    2358:	0b 3f                	or     edi,DWORD PTR [edi]
    235a:	00 00                	add    BYTE PTR [eax],al
    235c:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    235f:	61                   	popa   
    2360:	00 00                	add    BYTE PTR [eax],al
    2362:	00 05 03 54 35 00    	add    BYTE PTR ds:0x355403,al
    2368:	30 0b                	xor    BYTE PTR [ebx],cl
    236a:	aa                   	stos   BYTE PTR es:[edi],al
    236b:	00 00                	add    BYTE PTR [eax],al
    236d:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    2370:	61                   	popa   
    2371:	00 00                	add    BYTE PTR [eax],al
    2373:	00 05 03 58 35 00    	add    BYTE PTR ds:0x355803,al
    2379:	30 0b                	xor    BYTE PTR [ebx],cl
    237b:	56                   	push   esi
    237c:	01 00                	add    DWORD PTR [eax],eax
    237e:	00 04 35 61 00 00 00 	add    BYTE PTR [esi*1+0x61],al
    2385:	05 03 50 35 00       	add    eax,0x355003
    238a:	30 0b                	xor    BYTE PTR [ebx],cl
    238c:	48                   	dec    eax
    238d:	00 00                	add    BYTE PTR [eax],al
    238f:	00 05 36 8f 00 00    	add    BYTE PTR ds:0x8f36,al
    2395:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
    239b:	30 00                	xor    BYTE PTR [eax],al
    239d:	b4 04                	mov    ah,0x4
    239f:	00 00                	add    BYTE PTR [eax],al
    23a1:	04 00                	add    al,0x0
    23a3:	22 0e                	and    cl,BYTE PTR [esi]
    23a5:	00 00                	add    BYTE PTR [eax],al
    23a7:	04 01                	add    al,0x1
    23a9:	ef                   	out    dx,eax
    23aa:	00 00                	add    BYTE PTR [eax],al
    23ac:	00 0c df             	add    BYTE PTR [edi+ebx*8],cl
    23af:	09 00                	or     DWORD PTR [eax],eax
    23b1:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    23b4:	00 00                	add    BYTE PTR [eax],al
    23b6:	80 13 00             	adc    BYTE PTR [ebx],0x0
    23b9:	30 16                	xor    BYTE PTR [esi],dl
    23bb:	0c 00                	or     al,0x0
    23bd:	00 6a 12             	add    BYTE PTR [edx+0x12],ch
    23c0:	00 00                	add    BYTE PTR [eax],al
    23c2:	02 38                	add    bh,BYTE PTR [eax]
    23c4:	02 00                	add    al,BYTE PTR [eax]
    23c6:	00 04 b3             	add    BYTE PTR [ebx+esi*4],al
    23c9:	00 00                	add    BYTE PTR [eax],al
    23cb:	00 06                	add    BYTE PTR [esi],al
    23cd:	15 b3 00 00 00       	adc    eax,0xb3
    23d2:	03 1e                	add    ebx,DWORD PTR [esi]
    23d4:	03 00                	add    eax,DWORD PTR [eax]
    23d6:	00 00                	add    BYTE PTR [eax],al
    23d8:	03 c7                	add    eax,edi
    23da:	02 00                	add    al,BYTE PTR [eax]
    23dc:	00 01                	add    BYTE PTR [ecx],al
    23de:	03 ad 02 00 00 03    	add    ebp,DWORD PTR [ebp+0x3000002]
    23e4:	03 10                	add    edx,DWORD PTR [eax]
    23e6:	03 00                	add    eax,DWORD PTR [eax]
    23e8:	00 04 03             	add    BYTE PTR [ebx+eax*1],al
    23eb:	17                   	pop    ss
    23ec:	02 00                	add    al,BYTE PTR [eax]
    23ee:	00 4f 03             	add    BYTE PTR [edi+0x3],cl
    23f1:	ba 02 00 00 59       	mov    edx,0x59000002
    23f6:	03 42 02             	add    eax,DWORD PTR [edx+0x2]
    23f9:	00 00                	add    BYTE PTR [eax],al
    23fb:	61                   	popa   
    23fc:	03 3d 03 00 00 97    	add    edi,DWORD PTR ds:0x97000003
    2402:	04 df                	add    al,0xdf
    2404:	02 00                	add    al,BYTE PTR [eax]
    2406:	00 63 01             	add    BYTE PTR [ebx+0x1],ah
    2409:	04 f6                	add    al,0xf6
    240b:	02 00                	add    al,BYTE PTR [eax]
    240d:	00 64 01 04          	add    BYTE PTR [ecx+eax*1+0x4],ah
    2411:	9a 02 00 00 65 01 04 	call   0x401:0x65000002
    2418:	71 02                	jno    241c <sysEnter_Vector-0x12dbe4>
    241a:	00 00                	add    BYTE PTR [eax],al
    241c:	66 01 04 55 02 00 00 	add    WORD PTR [edx*2+0x67000002],ax
    2423:	67 
    2424:	01 04 03             	add    DWORD PTR [ebx+eax*1],eax
    2427:	03 00                	add    eax,DWORD PTR [eax]
    2429:	00 68 01             	add    BYTE PTR [eax+0x1],ch
    242c:	04 2e                	add    al,0x2e
    242e:	03 00                	add    eax,DWORD PTR [eax]
    2430:	00 69 01             	add    BYTE PTR [ecx+0x1],ch
    2433:	04 e9                	add    al,0xe9
    2435:	01 00                	add    DWORD PTR [eax],eax
    2437:	00 70 01             	add    BYTE PTR [eax+0x1],dh
    243a:	04 5b                	add    al,0x5b
    243c:	03 00                	add    eax,DWORD PTR [eax]
    243e:	00 00                	add    BYTE PTR [eax],al
    2440:	03 04 8b             	add    eax,DWORD PTR [ebx+ecx*4]
    2443:	02 00                	add    al,BYTE PTR [eax]
    2445:	00 01                	add    BYTE PTR [ecx],al
    2447:	03 04 fa             	add    eax,DWORD PTR [edx+edi*8]
    244a:	01 00                	add    DWORD PTR [eax],eax
    244c:	00 02                	add    BYTE PTR [edx],al
    244e:	03 00                	add    eax,DWORD PTR [eax]
    2450:	05 04 07 32 00       	add    eax,0x320704
    2455:	00 00                	add    BYTE PTR [eax],al
    2457:	05 01 06 58 00       	add    eax,0x580601
    245c:	00 00                	add    BYTE PTR [eax],al
    245e:	05 01 06 51 00       	add    eax,0x510601
    2463:	00 00                	add    BYTE PTR [eax],al
    2465:	05 02 05 e5 00       	add    eax,0xe50502
    246a:	00 00                	add    BYTE PTR [eax],al
    246c:	06                   	push   es
    246d:	04 05                	add    al,0x5
    246f:	69 6e 74 00 05 08 05 	imul   ebp,DWORD PTR [esi+0x74],0x5080500
    2476:	00 00                	add    BYTE PTR [eax],al
    2478:	00 00                	add    BYTE PTR [eax],al
    247a:	05 01 08 4f 00       	add    eax,0x4f0801
    247f:	00 00                	add    BYTE PTR [eax],al
    2481:	05 02 07 0e 00       	add    eax,0xe0702
    2486:	00 00                	add    BYTE PTR [eax],al
    2488:	07                   	pop    es
    2489:	64 00 00             	add    BYTE PTR fs:[eax],al
    248c:	00 02                	add    BYTE PTR [edx],al
    248e:	34 b3                	xor    al,0xb3
    2490:	00 00                	add    BYTE PTR [eax],al
    2492:	00 05 08 07 28 00    	add    BYTE PTR ds:0x280708,al
    2498:	00 00                	add    BYTE PTR [eax],al
    249a:	05 04 05 05 00       	add    eax,0x50504
    249f:	00 00                	add    BYTE PTR [eax],al
    24a1:	05 0c 04 96 00       	add    eax,0x96040c
    24a6:	00 00                	add    BYTE PTR [eax],al
    24a8:	05 01 02 90 00       	add    eax,0x900201
    24ad:	00 00                	add    BYTE PTR [eax],al
    24af:	07                   	pop    es
    24b0:	5d                   	pop    ebp
    24b1:	00 00                	add    BYTE PTR [eax],al
    24b3:	00 03                	add    BYTE PTR [ebx],al
    24b5:	2a fd                	sub    bh,ch
    24b7:	00 00                	add    BYTE PTR [eax],al
    24b9:	00 08                	add    BYTE PTR [eax],cl
    24bb:	74 6d                	je     252a <sysEnter_Vector-0x12dad6>
    24bd:	00 2c 03             	add    BYTE PTR [ebx+eax*1],ch
    24c0:	2c ad                	sub    al,0xad
    24c2:	01 00                	add    DWORD PTR [eax],eax
    24c4:	00 09                	add    BYTE PTR [ecx],cl
    24c6:	ca 04 00             	retf   0x4
    24c9:	00 03                	add    BYTE PTR [ebx],al
    24cb:	2e                   	cs
    24cc:	cf                   	iret   
    24cd:	00 00                	add    BYTE PTR [eax],al
    24cf:	00 00                	add    BYTE PTR [eax],al
    24d1:	09 2f                	or     DWORD PTR [edi],ebp
    24d3:	04 00                	add    al,0x0
    24d5:	00 03                	add    BYTE PTR [ebx],al
    24d7:	2f                   	das    
    24d8:	cf                   	iret   
    24d9:	00 00                	add    BYTE PTR [eax],al
    24db:	00 04 09             	add    BYTE PTR [ecx+ecx*1],al
    24de:	70 03                	jo     24e3 <sysEnter_Vector-0x12db1d>
    24e0:	00 00                	add    BYTE PTR [eax],al
    24e2:	03 30                	add    esi,DWORD PTR [eax]
    24e4:	cf                   	iret   
    24e5:	00 00                	add    BYTE PTR [eax],al
    24e7:	00 08                	add    BYTE PTR [eax],cl
    24e9:	09 b5 04 00 00 03    	or     DWORD PTR [ebp+0x3000004],esi
    24ef:	31 cf                	xor    edi,ecx
    24f1:	00 00                	add    BYTE PTR [eax],al
    24f3:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
    24f6:	c4 03                	les    eax,FWORD PTR [ebx]
    24f8:	00 00                	add    BYTE PTR [eax],al
    24fa:	03 32                	add    esi,DWORD PTR [edx]
    24fc:	cf                   	iret   
    24fd:	00 00                	add    BYTE PTR [eax],al
    24ff:	00 10                	add    BYTE PTR [eax],dl
    2501:	09 cb                	or     ebx,ecx
    2503:	03 00                	add    eax,DWORD PTR [eax]
    2505:	00 03                	add    BYTE PTR [ebx],al
    2507:	33 cf                	xor    ecx,edi
    2509:	00 00                	add    BYTE PTR [eax],al
    250b:	00 14 09             	add    BYTE PTR [ecx+ecx*1],dl
    250e:	ad                   	lods   eax,DWORD PTR ds:[esi]
    250f:	04 00                	add    al,0x0
    2511:	00 03                	add    BYTE PTR [ebx],al
    2513:	34 cf                	xor    al,0xcf
    2515:	00 00                	add    BYTE PTR [eax],al
    2517:	00 18                	add    BYTE PTR [eax],bl
    2519:	09 3c 04             	or     DWORD PTR [esp+eax*1],edi
    251c:	00 00                	add    BYTE PTR [eax],al
    251e:	03 35 cf 00 00 00    	add    esi,DWORD PTR ds:0xcf
    2524:	1c 09                	sbb    al,0x9
    2526:	f6 03 00             	test   BYTE PTR [ebx],0x0
    2529:	00 03                	add    BYTE PTR [ebx],al
    252b:	36                   	ss
    252c:	cf                   	iret   
    252d:	00 00                	add    BYTE PTR [eax],al
    252f:	00 20                	add    BYTE PTR [eax],ah
    2531:	09 77 04             	or     DWORD PTR [edi+0x4],esi
    2534:	00 00                	add    BYTE PTR [eax],al
    2536:	03 37                	add    esi,DWORD PTR [edi]
    2538:	fd                   	std    
    2539:	00 00                	add    BYTE PTR [eax],al
    253b:	00 24 09             	add    BYTE PTR [ecx+ecx*1],ah
    253e:	95                   	xchg   ebp,eax
    253f:	03 00                	add    eax,DWORD PTR [eax]
    2541:	00 03                	add    BYTE PTR [ebx],al
    2543:	38 ad 01 00 00 28    	cmp    BYTE PTR [ebp+0x28000001],ch
    2549:	00 0a                	add    BYTE PTR [edx],cl
    254b:	04 b3                	add    al,0xb3
    254d:	01 00                	add    DWORD PTR [eax],eax
    254f:	00 0b                	add    BYTE PTR [ebx],cl
    2551:	ba 00 00 00 05       	mov    edx,0x5000000
    2556:	04 07                	add    al,0x7
    2558:	2d 00 00 00 05       	sub    eax,0x5000000
    255d:	04 07                	add    al,0x7
    255f:	dc 00                	fadd   QWORD PTR [eax]
    2561:	00 00                	add    BYTE PTR [eax],al
    2563:	0a 04 ba             	or     al,BYTE PTR [edx+edi*4]
    2566:	00 00                	add    BYTE PTR [eax],al
    2568:	00 0c 9f             	add    BYTE PTR [edi+ebx*4],cl
    256b:	09 00                	or     DWORD PTR [eax],eax
    256d:	00 01                	add    BYTE PTR [ecx],al
    256f:	2e 12 01             	adc    al,BYTE PTR cs:[ecx]
    2572:	00 00                	add    BYTE PTR [eax],al
    2574:	80 13 00             	adc    BYTE PTR [ebx],0x0
    2577:	30 29                	xor    BYTE PTR [ecx],ch
    2579:	00 00                	add    BYTE PTR [eax],al
    257b:	00 01                	add    BYTE PTR [ecx],al
    257d:	9c                   	pushf  
    257e:	f4                   	hlt    
    257f:	01 00                	add    DWORD PTR [eax],eax
    2581:	00 0d 69 03 00 00    	add    BYTE PTR ds:0x369,cl
    2587:	01 30                	add    DWORD PTR [eax],esi
    2589:	eb 00                	jmp    258b <sysEnter_Vector-0x12da75>
    258b:	00 00                	add    BYTE PTR [eax],al
    258d:	02 91 74 00 0e 51    	add    dl,BYTE PTR [ecx+0x510e0074]
    2593:	09 00                	or     DWORD PTR [eax],eax
    2595:	00 01                	add    BYTE PTR [ecx],al
    2597:	36 62 02             	bound  eax,QWORD PTR ss:[edx]
    259a:	00 00                	add    BYTE PTR [eax],al
    259c:	a9 13 00 30 19       	test   eax,0x19300013
    25a1:	03 00                	add    eax,DWORD PTR [eax]
    25a3:	00 01                	add    BYTE PTR [ecx],al
    25a5:	9c                   	pushf  
    25a6:	62 02                	bound  eax,QWORD PTR [edx]
    25a8:	00 00                	add    BYTE PTR [eax],al
    25aa:	0f 5a 09             	cvtps2pd xmm1,QWORD PTR [ecx]
    25ad:	00 00                	add    BYTE PTR [eax],al
    25af:	01 36                	add    DWORD PTR [esi],esi
    25b1:	68 02 00 00 02       	push   0x2000002
    25b6:	91                   	xchg   ecx,eax
    25b7:	00 0f                	add    BYTE PTR [edi],cl
    25b9:	d3 09                	ror    DWORD PTR [ecx],cl
    25bb:	00 00                	add    BYTE PTR [eax],al
    25bd:	01 36                	add    DWORD PTR [esi],esi
    25bf:	62 02                	bound  eax,QWORD PTR [edx]
    25c1:	00 00                	add    BYTE PTR [eax],al
    25c3:	02 91 04 0d 9f 09    	add    dl,BYTE PTR [ecx+0x99f0d04]
    25c9:	00 00                	add    BYTE PTR [eax],al
    25cb:	01 37                	add    DWORD PTR [edi],esi
    25cd:	12 01                	adc    al,BYTE PTR [ecx]
    25cf:	00 00                	add    BYTE PTR [eax],al
    25d1:	02 91 68 0d a4 09    	add    dl,BYTE PTR [ecx+0x9a40d68]
    25d7:	00 00                	add    BYTE PTR [eax],al
    25d9:	01 38                	add    DWORD PTR [eax],edi
    25db:	b8 01 00 00 02       	mov    eax,0x2000001
    25e0:	91                   	xchg   ecx,eax
    25e1:	64                   	fs
    25e2:	0d 42 09 00 00       	or     eax,0x942
    25e7:	01 38                	add    DWORD PTR [eax],edi
    25e9:	b8 01 00 00 02       	mov    eax,0x2000001
    25ee:	91                   	xchg   ecx,eax
    25ef:	70 0d                	jo     25fe <sysEnter_Vector-0x12da02>
    25f1:	ce                   	into   
    25f2:	03 00                	add    eax,DWORD PTR [eax]
    25f4:	00 01                	add    BYTE PTR [ecx],al
    25f6:	39 cf                	cmp    edi,ecx
    25f8:	00 00                	add    BYTE PTR [eax],al
    25fa:	00 02                	add    BYTE PTR [edx],al
    25fc:	91                   	xchg   ecx,eax
    25fd:	6c                   	ins    BYTE PTR es:[edi],dx
    25fe:	00 0a                	add    BYTE PTR [edx],cl
    2600:	04 1d                	add    al,0x1d
    2602:	01 00                	add    DWORD PTR [eax],eax
    2604:	00 0a                	add    BYTE PTR [edx],cl
    2606:	04 6e                	add    al,0x6e
    2608:	02 00                	add    al,BYTE PTR [eax]
    260a:	00 0b                	add    BYTE PTR [ebx],cl
    260c:	12 01                	adc    al,BYTE PTR [ecx]
    260e:	00 00                	add    BYTE PTR [eax],al
    2610:	10 38                	adc    BYTE PTR [eax],bh
    2612:	09 00                	or     DWORD PTR [eax],eax
    2614:	00 01                	add    BYTE PTR [ecx],al
    2616:	52                   	push   edx
    2617:	62 02                	bound  eax,QWORD PTR [edx]
    2619:	00 00                	add    BYTE PTR [eax],al
    261b:	c2 16 00             	ret    0x16
    261e:	30 3f                	xor    BYTE PTR [edi],bh
    2620:	00 00                	add    BYTE PTR [eax],al
    2622:	00 01                	add    BYTE PTR [ecx],al
    2624:	9c                   	pushf  
    2625:	b5 02                	mov    ch,0x2
    2627:	00 00                	add    BYTE PTR [eax],al
    2629:	0f 5a 09             	cvtps2pd xmm1,QWORD PTR [ecx]
    262c:	00 00                	add    BYTE PTR [eax],al
    262e:	01 52 68             	add    DWORD PTR [edx+0x68],edx
    2631:	02 00                	add    al,BYTE PTR [eax]
    2633:	00 02                	add    BYTE PTR [edx],al
    2635:	91                   	xchg   ecx,eax
    2636:	00 11                	add    BYTE PTR [ecx],dl
    2638:	74 00                	je     263a <sysEnter_Vector-0x12d9c6>
    263a:	01 53 12             	add    DWORD PTR [ebx+0x12],edx
    263d:	01 00                	add    DWORD PTR [eax],eax
    263f:	00 02                	add    BYTE PTR [edx],al
    2641:	91                   	xchg   ecx,eax
    2642:	6c                   	ins    BYTE PTR es:[edi],dx
    2643:	0d d3 09 00 00       	or     eax,0x9d3
    2648:	01 54 1d 01          	add    DWORD PTR [ebp+ebx*1+0x1],edx
    264c:	00 00                	add    BYTE PTR [eax],al
    264e:	02 91 40 00 10 60    	add    dl,BYTE PTR [ecx+0x60100040]
    2654:	09 00                	or     DWORD PTR [eax],eax
    2656:	00 01                	add    BYTE PTR [ecx],al
    2658:	5a                   	pop    edx
    2659:	62 02                	bound  eax,QWORD PTR [edx]
    265b:	00 00                	add    BYTE PTR [eax],al
    265d:	01 17                	add    DWORD PTR [edi],edx
    265f:	00 30                	add    BYTE PTR [eax],dh
    2661:	3e 00 00             	add    BYTE PTR ds:[eax],al
    2664:	00 01                	add    BYTE PTR [ecx],al
    2666:	9c                   	pushf  
    2667:	f7 02 00 00 0f 5a    	test   DWORD PTR [edx],0x5a0f0000
    266d:	09 00                	or     DWORD PTR [eax],eax
    266f:	00 01                	add    BYTE PTR [ecx],al
    2671:	5a                   	pop    edx
    2672:	68 02 00 00 02       	push   0x2000002
    2677:	91                   	xchg   ecx,eax
    2678:	00 0f                	add    BYTE PTR [edi],cl
    267a:	d3 09                	ror    DWORD PTR [ecx],cl
    267c:	00 00                	add    BYTE PTR [eax],al
    267e:	01 5a 62             	add    DWORD PTR [edx+0x62],ebx
    2681:	02 00                	add    al,BYTE PTR [eax]
    2683:	00 02                	add    BYTE PTR [edx],al
    2685:	91                   	xchg   ecx,eax
    2686:	04 11                	add    al,0x11
    2688:	74 00                	je     268a <sysEnter_Vector-0x12d976>
    268a:	01 5b 12             	add    DWORD PTR [ebx+0x12],ebx
    268d:	01 00                	add    DWORD PTR [eax],eax
    268f:	00 02                	add    BYTE PTR [edx],al
    2691:	91                   	xchg   ecx,eax
    2692:	6c                   	ins    BYTE PTR es:[edi],dx
    2693:	00 0e                	add    BYTE PTR [esi],cl
    2695:	9d                   	popf   
    2696:	09 00                	or     DWORD PTR [eax],eax
    2698:	00 01                	add    BYTE PTR [ecx],al
    269a:	61                   	popa   
    269b:	12 01                	adc    al,BYTE PTR [ecx]
    269d:	00 00                	add    BYTE PTR [eax],al
    269f:	3f                   	aas    
    26a0:	17                   	pop    ss
    26a1:	00 30                	add    BYTE PTR [eax],dh
    26a3:	57                   	push   edi
    26a4:	08 00                	or     BYTE PTR [eax],al
    26a6:	00 01                	add    BYTE PTR [ecx],al
    26a8:	9c                   	pushf  
    26a9:	8f 03                	pop    DWORD PTR [ebx]
    26ab:	00 00                	add    BYTE PTR [eax],al
    26ad:	0f d3 09             	psrlq  mm1,QWORD PTR [ecx]
    26b0:	00 00                	add    BYTE PTR [eax],al
    26b2:	01 61 62             	add    DWORD PTR [ecx+0x62],esp
    26b5:	02 00                	add    al,BYTE PTR [eax]
    26b7:	00 02                	add    BYTE PTR [edx],al
    26b9:	91                   	xchg   ecx,eax
    26ba:	00 11                	add    BYTE PTR [ecx],dl
    26bc:	64                   	fs
    26bd:	61                   	popa   
    26be:	79 00                	jns    26c0 <sysEnter_Vector-0x12d940>
    26c0:	01 62 fd             	add    DWORD PTR [edx-0x3],esp
    26c3:	00 00                	add    BYTE PTR [eax],al
    26c5:	00 02                	add    BYTE PTR [edx],al
    26c7:	91                   	xchg   ecx,eax
    26c8:	68 0d ce 03 00       	push   0x3ce0d
    26cd:	00 01                	add    BYTE PTR [ecx],al
    26cf:	62                   	(bad)  
    26d0:	fd                   	std    
    26d1:	00 00                	add    BYTE PTR [eax],al
    26d3:	00 02                	add    BYTE PTR [edx],al
    26d5:	91                   	xchg   ecx,eax
    26d6:	54                   	push   esp
    26d7:	0d cb 03 00 00       	or     eax,0x3cb
    26dc:	01 63 cf             	add    DWORD PTR [ebx-0x31],esp
    26df:	00 00                	add    BYTE PTR [eax],al
    26e1:	00 02                	add    BYTE PTR [edx],al
    26e3:	91                   	xchg   ecx,eax
    26e4:	4c                   	dec    esp
    26e5:	0d 3f 04 00 00       	or     eax,0x43f
    26ea:	01 64 cf 00          	add    DWORD PTR [edi+ecx*8+0x0],esp
    26ee:	00 00                	add    BYTE PTR [eax],al
    26f0:	02 91 64 0d cd 09    	add    dl,BYTE PTR [ecx+0x9cd0d64]
    26f6:	00 00                	add    BYTE PTR [eax],al
    26f8:	01 64 cf 00          	add    DWORD PTR [edi+ecx*8+0x0],esp
    26fc:	00 00                	add    BYTE PTR [eax],al
    26fe:	02 91 60 0d 8f 04    	add    dl,BYTE PTR [ecx+0x48f0d60]
    2704:	00 00                	add    BYTE PTR [eax],al
    2706:	01 65 fd             	add    DWORD PTR [ebp-0x3],esp
    2709:	00 00                	add    BYTE PTR [eax],al
    270b:	00 02                	add    BYTE PTR [edx],al
    270d:	91                   	xchg   ecx,eax
    270e:	50                   	push   eax
    270f:	0d c4 09 00 00       	or     eax,0x9c4
    2714:	01 66 cf             	add    DWORD PTR [esi-0x31],esp
    2717:	00 00                	add    BYTE PTR [eax],al
    2719:	00 02                	add    BYTE PTR [edx],al
    271b:	91                   	xchg   ecx,eax
    271c:	5c                   	pop    esp
    271d:	11 64 73 74          	adc    DWORD PTR [ebx+esi*2+0x74],esp
    2721:	00 01                	add    BYTE PTR [ecx],al
    2723:	67 fd                	addr16 std 
    2725:	00 00                	add    BYTE PTR [eax],al
    2727:	00 02                	add    BYTE PTR [edx],al
    2729:	91                   	xchg   ecx,eax
    272a:	58                   	pop    eax
    272b:	00 12                	add    BYTE PTR [edx],dl
    272d:	3f                   	aas    
    272e:	00 00                	add    BYTE PTR [eax],al
    2730:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    2733:	eb 00                	jmp    2735 <sysEnter_Vector-0x12d8cb>
    2735:	00 00                	add    BYTE PTR [eax],al
    2737:	05 03 54 35 00       	add    eax,0x355403
    273c:	30 12                	xor    BYTE PTR [edx],dl
    273e:	aa                   	stos   BYTE PTR es:[edi],al
    273f:	00 00                	add    BYTE PTR [eax],al
    2741:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    2744:	eb 00                	jmp    2746 <sysEnter_Vector-0x12d8ba>
    2746:	00 00                	add    BYTE PTR [eax],al
    2748:	05 03 58 35 00       	add    eax,0x355803
    274d:	30 12                	xor    BYTE PTR [edx],dl
    274f:	56                   	push   esi
    2750:	01 00                	add    DWORD PTR [eax],eax
    2752:	00 04 35 eb 00 00 00 	add    BYTE PTR [esi*1+0xeb],al
    2759:	05 03 50 35 00       	add    eax,0x355003
    275e:	30 12                	xor    BYTE PTR [edx],dl
    2760:	48                   	dec    eax
    2761:	00 00                	add    BYTE PTR [eax],al
    2763:	00 05 36 12 01 00    	add    BYTE PTR ds:0x11236,al
    2769:	00 05 03 5c 35 00    	add    BYTE PTR ds:0x355c03,al
    276f:	30 12                	xor    BYTE PTR [edx],dl
    2771:	ad                   	lods   eax,DWORD PTR ds:[esi]
    2772:	09 00                	or     DWORD PTR [eax],eax
    2774:	00 01                	add    BYTE PTR [ecx],al
    2776:	0c cf                	or     al,0xcf
    2778:	00 00                	add    BYTE PTR [eax],al
    277a:	00 05 03 c4 33 00    	add    BYTE PTR ds:0x33c403,al
    2780:	30 12                	xor    BYTE PTR [edx],dl
    2782:	48                   	dec    eax
    2783:	09 00                	or     DWORD PTR [eax],eax
    2785:	00 01                	add    BYTE PTR [ecx],al
    2787:	0d fd 00 00 00       	or     eax,0xfd
    278c:	05 03 7c 35 00       	add    eax,0x357c03
    2791:	30 13                	xor    BYTE PTR [ebx],dl
    2793:	c6 01 00             	mov    BYTE PTR [ecx],0x0
    2796:	00 05 04 00 00 14    	add    BYTE PTR ds:0x14000004,al
    279c:	bf 01 00 00 01       	mov    edi,0x1000001
    27a1:	00 12                	add    BYTE PTR [edx],dl
    27a3:	7b 09                	jnp    27ae <sysEnter_Vector-0x12d852>
    27a5:	00 00                	add    BYTE PTR [eax],al
    27a7:	01 0e                	add    DWORD PTR [esi],ecx
    27a9:	f5                   	cmc    
    27aa:	03 00                	add    eax,DWORD PTR [eax]
    27ac:	00 05 03 a0 34 00    	add    BYTE PTR ds:0x34a003,al
    27b2:	30 12                	xor    BYTE PTR [edx],dl
    27b4:	91                   	xchg   ecx,eax
    27b5:	09 00                	or     DWORD PTR [eax],eax
    27b7:	00 01                	add    BYTE PTR [ecx],al
    27b9:	0f cf                	bswap  edi
    27bb:	00 00                	add    BYTE PTR [eax],al
    27bd:	00 05 03 80 35 00    	add    BYTE PTR ds:0x358003,al
    27c3:	30 13                	xor    BYTE PTR [ebx],dl
    27c5:	ad                   	lods   eax,DWORD PTR ds:[esi]
    27c6:	01 00                	add    DWORD PTR [eax],eax
    27c8:	00 37                	add    BYTE PTR [edi],dh
    27ca:	04 00                	add    al,0x0
    27cc:	00 14 bf             	add    BYTE PTR [edi+edi*4],dl
    27cf:	01 00                	add    DWORD PTR [eax],eax
    27d1:	00 06                	add    BYTE PTR [esi],al
    27d3:	00 12                	add    BYTE PTR [edx],dl
    27d5:	d9 09                	(bad)  [ecx]
    27d7:	00 00                	add    BYTE PTR [eax],al
    27d9:	01 11                	add    DWORD PTR [ecx],edx
    27db:	27                   	daa    
    27dc:	04 00                	add    al,0x0
    27de:	00 05 03 a8 34 00    	add    BYTE PTR ds:0x34a803,al
    27e4:	30 12                	xor    BYTE PTR [edx],dl
    27e6:	b7 09                	mov    bh,0x9
    27e8:	00 00                	add    BYTE PTR [eax],al
    27ea:	01 16                	add    DWORD PTR [esi],edx
    27ec:	27                   	daa    
    27ed:	04 00                	add    al,0x0
    27ef:	00 05 03 c4 34 00    	add    BYTE PTR ds:0x34c403,al
    27f5:	30 13                	xor    BYTE PTR [ebx],dl
    27f7:	ad                   	lods   eax,DWORD PTR ds:[esi]
    27f8:	01 00                	add    DWORD PTR [eax],eax
    27fa:	00 69 04             	add    BYTE PTR [ecx+0x4],ch
    27fd:	00 00                	add    BYTE PTR [eax],al
    27ff:	14 bf                	adc    al,0xbf
    2801:	01 00                	add    DWORD PTR [eax],eax
    2803:	00 0b                	add    BYTE PTR [ebx],cl
    2805:	00 12                	add    BYTE PTR [edx],dl
    2807:	83 09 00             	or     DWORD PTR [ecx],0x0
    280a:	00 01                	add    BYTE PTR [ecx],al
    280c:	1b 59 04             	sbb    ebx,DWORD PTR [ecx+0x4]
    280f:	00 00                	add    BYTE PTR [eax],al
    2811:	05 03 e0 34 00       	add    eax,0x34e003
    2816:	30 12                	xor    BYTE PTR [edx],dl
    2818:	6c                   	ins    BYTE PTR es:[edi],dx
    2819:	09 00                	or     DWORD PTR [eax],eax
    281b:	00 01                	add    BYTE PTR [ecx],al
    281d:	22 59 04             	and    bl,BYTE PTR [ecx+0x4]
    2820:	00 00                	add    BYTE PTR [eax],al
    2822:	05 03 20 35 00       	add    eax,0x352003
    2827:	30 13                	xor    BYTE PTR [ebx],dl
    2829:	cf                   	iret   
    282a:	00 00                	add    BYTE PTR [eax],al
    282c:	00 a1 04 00 00 14    	add    BYTE PTR [ecx+0x14000004],ah
    2832:	bf 01 00 00 01       	mov    edi,0x1000001
    2837:	14 bf                	adc    al,0xbf
    2839:	01 00                	add    DWORD PTR [eax],eax
    283b:	00 0b                	add    BYTE PTR [ebx],cl
    283d:	00 12                	add    BYTE PTR [edx],dl
    283f:	8b 09                	mov    ecx,DWORD PTR [ecx]
    2841:	00 00                	add    BYTE PTR [eax],al
    2843:	01 29                	add    DWORD PTR [ecx],ebp
    2845:	b2 04                	mov    dl,0x4
    2847:	00 00                	add    BYTE PTR [eax],al
    2849:	05 03 00 31 00       	add    eax,0x310003
    284e:	30 0b                	xor    BYTE PTR [ebx],cl
    2850:	8b 04 00             	mov    eax,DWORD PTR [eax+eax*1]
	...

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
 71a:	0e                   	push   cs
 71b:	00 00                	add    BYTE PTR [eax],al
 71d:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 720:	0b 0b                	or     ecx,DWORD PTR [ebx]
 722:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 725:	08 00                	or     BYTE PTR [eax],al
 727:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 72a:	00 03                	add    BYTE PTR [ebx],al
 72c:	0e                   	push   cs
 72d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 72f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 731:	49                   	dec    ecx
 732:	13 00                	adc    eax,DWORD PTR [eax]
 734:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 73a:	00 00                	add    BYTE PTR [eax],al
 73c:	06                   	push   es
 73d:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 740:	19 03                	sbb    DWORD PTR [ebx],eax
 742:	0e                   	push   cs
 743:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 745:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 747:	27                   	daa    
 748:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 74b:	11 01                	adc    DWORD PTR [ecx],eax
 74d:	12 06                	adc    al,BYTE PTR [esi]
 74f:	40                   	inc    eax
 750:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 756:	00 00                	add    BYTE PTR [eax],al
 758:	07                   	pop    es
 759:	05 00 03 0e 3a       	add    eax,0x3a0e0300
 75e:	0b 3b                	or     edi,DWORD PTR [ebx]
 760:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 763:	02 18                	add    bl,BYTE PTR [eax]
 765:	00 00                	add    BYTE PTR [eax],al
 767:	08 05 00 03 08 3a    	or     BYTE PTR ds:0x3a080300,al
 76d:	0b 3b                	or     edi,DWORD PTR [ebx]
 76f:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 772:	02 18                	add    bl,BYTE PTR [eax]
 774:	00 00                	add    BYTE PTR [eax],al
 776:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
 779:	03 0e                	add    ecx,DWORD PTR [esi]
 77b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 77d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 77f:	49                   	dec    ecx
 780:	13 3f                	adc    edi,DWORD PTR [edi]
 782:	19 02                	sbb    DWORD PTR [edx],eax
 784:	18 00                	sbb    BYTE PTR [eax],al
 786:	00 00                	add    BYTE PTR [eax],al
 788:	01 11                	add    DWORD PTR [ecx],edx
 78a:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 790:	0e                   	push   cs
 791:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 793:	11 01                	adc    DWORD PTR [ecx],eax
 795:	12 06                	adc    al,BYTE PTR [esi]
 797:	10 17                	adc    BYTE PTR [edi],dl
 799:	00 00                	add    BYTE PTR [eax],al
 79b:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 79e:	0b 0b                	or     ecx,DWORD PTR [ebx]
 7a0:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 7a3:	08 00                	or     BYTE PTR [eax],al
 7a5:	00 03                	add    BYTE PTR [ebx],al
 7a7:	16                   	push   ss
 7a8:	00 03                	add    BYTE PTR [ebx],al
 7aa:	0e                   	push   cs
 7ab:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 7ad:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 7af:	49                   	dec    ecx
 7b0:	13 00                	adc    eax,DWORD PTR [eax]
 7b2:	00 04 24             	add    BYTE PTR [esp],al
 7b5:	00 0b                	add    BYTE PTR [ebx],cl
 7b7:	0b 3e                	or     edi,DWORD PTR [esi]
 7b9:	0b 03                	or     eax,DWORD PTR [ebx]
 7bb:	0e                   	push   cs
 7bc:	00 00                	add    BYTE PTR [eax],al
 7be:	05 13 01 03 0e       	add    eax,0xe030113
 7c3:	0b 0b                	or     ecx,DWORD PTR [ebx]
 7c5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 7c7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 7c9:	01 13                	add    DWORD PTR [ebx],edx
 7cb:	00 00                	add    BYTE PTR [eax],al
 7cd:	06                   	push   es
 7ce:	0d 00 03 0e 3a       	or     eax,0x3a0e0300
 7d3:	0b 3b                	or     edi,DWORD PTR [ebx]
 7d5:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 7d8:	38 0b                	cmp    BYTE PTR [ebx],cl
 7da:	00 00                	add    BYTE PTR [eax],al
 7dc:	07                   	pop    es
 7dd:	0f 00 0b             	str    WORD PTR [ebx]
 7e0:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 7e3:	00 00                	add    BYTE PTR [eax],al
 7e5:	08 0f                	or     BYTE PTR [edi],cl
 7e7:	00 0b                	add    BYTE PTR [ebx],cl
 7e9:	0b 00                	or     eax,DWORD PTR [eax]
 7eb:	00 09                	add    BYTE PTR [ecx],cl
 7ed:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 7f1:	00 00                	add    BYTE PTR [eax],al
 7f3:	0a 15 01 27 19 49    	or     dl,BYTE PTR ds:0x49192701
 7f9:	13 01                	adc    eax,DWORD PTR [ecx]
 7fb:	13 00                	adc    eax,DWORD PTR [eax]
 7fd:	00 0b                	add    BYTE PTR [ebx],cl
 7ff:	05 00 49 13 00       	add    eax,0x134900
 804:	00 0c 2e             	add    BYTE PTR [esi+ebp*1],cl
 807:	01 3f                	add    DWORD PTR [edi],edi
 809:	19 03                	sbb    DWORD PTR [ebx],eax
 80b:	0e                   	push   cs
 80c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 80e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 810:	27                   	daa    
 811:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 814:	11 01                	adc    DWORD PTR [ecx],eax
 816:	12 06                	adc    al,BYTE PTR [esi]
 818:	40                   	inc    eax
 819:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 81f:	00 00                	add    BYTE PTR [eax],al
 821:	0d 05 00 03 0e       	or     eax,0xe030005
 826:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 828:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 82a:	49                   	dec    ecx
 82b:	13 02                	adc    eax,DWORD PTR [edx]
 82d:	18 00                	sbb    BYTE PTR [eax],al
 82f:	00 0e                	add    BYTE PTR [esi],cl
 831:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
 834:	19 03                	sbb    DWORD PTR [ebx],eax
 836:	0e                   	push   cs
 837:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 839:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 83b:	11 01                	adc    DWORD PTR [ecx],eax
 83d:	12 06                	adc    al,BYTE PTR [esi]
 83f:	40                   	inc    eax
 840:	18 97 42 19 00 00    	sbb    BYTE PTR [edi+0x1942],dl
 846:	0f 34                	sysenter 
 848:	00 03                	add    BYTE PTR [ebx],al
 84a:	0e                   	push   cs
 84b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 84d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 84f:	49                   	dec    ecx
 850:	13 3f                	adc    edi,DWORD PTR [edi]
 852:	19 02                	sbb    DWORD PTR [edx],eax
 854:	18 00                	sbb    BYTE PTR [eax],al
 856:	00 00                	add    BYTE PTR [eax],al
 858:	01 11                	add    DWORD PTR [ecx],edx
 85a:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 860:	0e                   	push   cs
 861:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 863:	11 01                	adc    DWORD PTR [ecx],eax
 865:	12 06                	adc    al,BYTE PTR [esi]
 867:	10 17                	adc    BYTE PTR [edi],dl
 869:	00 00                	add    BYTE PTR [eax],al
 86b:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 86e:	0b 0b                	or     ecx,DWORD PTR [ebx]
 870:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 873:	0e                   	push   cs
 874:	00 00                	add    BYTE PTR [eax],al
 876:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 879:	0b 0b                	or     ecx,DWORD PTR [ebx]
 87b:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 87e:	08 00                	or     BYTE PTR [eax],al
 880:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 883:	00 03                	add    BYTE PTR [ebx],al
 885:	0e                   	push   cs
 886:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 888:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 88a:	49                   	dec    ecx
 88b:	13 00                	adc    eax,DWORD PTR [eax]
 88d:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 893:	49                   	dec    ecx
 894:	13 00                	adc    eax,DWORD PTR [eax]
 896:	00 06                	add    BYTE PTR [esi],al
 898:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 89c:	00 00                	add    BYTE PTR [eax],al
 89e:	07                   	pop    es
 89f:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 8a2:	19 03                	sbb    DWORD PTR [ebx],eax
 8a4:	0e                   	push   cs
 8a5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 8a7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 8a9:	27                   	daa    
 8aa:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 8ad:	11 01                	adc    DWORD PTR [ecx],eax
 8af:	12 06                	adc    al,BYTE PTR [esi]
 8b1:	40                   	inc    eax
 8b2:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 8b8:	00 00                	add    BYTE PTR [eax],al
 8ba:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
 8c0:	0b 3b                	or     edi,DWORD PTR [ebx]
 8c2:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 8c5:	02 18                	add    bl,BYTE PTR [eax]
 8c7:	00 00                	add    BYTE PTR [eax],al
 8c9:	09 05 00 03 08 3a    	or     DWORD PTR ds:0x3a080300,eax
 8cf:	0b 3b                	or     edi,DWORD PTR [ebx]
 8d1:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 8d4:	02 18                	add    bl,BYTE PTR [eax]
 8d6:	00 00                	add    BYTE PTR [eax],al
 8d8:	0a 2e                	or     ch,BYTE PTR [esi]
 8da:	01 3f                	add    DWORD PTR [edi],edi
 8dc:	19 03                	sbb    DWORD PTR [ebx],eax
 8de:	0e                   	push   cs
 8df:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 8e1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 8e3:	27                   	daa    
 8e4:	19 11                	sbb    DWORD PTR [ecx],edx
 8e6:	01 12                	add    DWORD PTR [edx],edx
 8e8:	06                   	push   es
 8e9:	40                   	inc    eax
 8ea:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 8f0:	00 00                	add    BYTE PTR [eax],al
 8f2:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
 8f5:	03 08                	add    ecx,DWORD PTR [eax]
 8f7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 8f9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 8fb:	49                   	dec    ecx
 8fc:	13 02                	adc    eax,DWORD PTR [edx]
 8fe:	18 00                	sbb    BYTE PTR [eax],al
 900:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
 903:	00 03                	add    BYTE PTR [ebx],al
 905:	0e                   	push   cs
 906:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 908:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 90a:	49                   	dec    ecx
 90b:	13 3f                	adc    edi,DWORD PTR [edi]
 90d:	19 02                	sbb    DWORD PTR [edx],eax
 90f:	18 00                	sbb    BYTE PTR [eax],al
 911:	00 00                	add    BYTE PTR [eax],al
 913:	01 11                	add    DWORD PTR [ecx],edx
 915:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 91b:	0e                   	push   cs
 91c:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 91e:	11 01                	adc    DWORD PTR [ecx],eax
 920:	12 06                	adc    al,BYTE PTR [esi]
 922:	10 17                	adc    BYTE PTR [edi],dl
 924:	00 00                	add    BYTE PTR [eax],al
 926:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 929:	0b 0b                	or     ecx,DWORD PTR [ebx]
 92b:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 92e:	0e                   	push   cs
 92f:	00 00                	add    BYTE PTR [eax],al
 931:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 934:	0b 0b                	or     ecx,DWORD PTR [ebx]
 936:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 939:	08 00                	or     BYTE PTR [eax],al
 93b:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 93e:	00 03                	add    BYTE PTR [ebx],al
 940:	0e                   	push   cs
 941:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 943:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 945:	49                   	dec    ecx
 946:	13 00                	adc    eax,DWORD PTR [eax]
 948:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 94e:	49                   	dec    ecx
 94f:	13 00                	adc    eax,DWORD PTR [eax]
 951:	00 06                	add    BYTE PTR [esi],al
 953:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 957:	00 00                	add    BYTE PTR [eax],al
 959:	07                   	pop    es
 95a:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 95d:	19 03                	sbb    DWORD PTR [ebx],eax
 95f:	0e                   	push   cs
 960:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 962:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 964:	27                   	daa    
 965:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 968:	11 01                	adc    DWORD PTR [ecx],eax
 96a:	12 06                	adc    al,BYTE PTR [esi]
 96c:	40                   	inc    eax
 96d:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 973:	00 00                	add    BYTE PTR [eax],al
 975:	08 05 00 03 08 3a    	or     BYTE PTR ds:0x3a080300,al
 97b:	0b 3b                	or     edi,DWORD PTR [ebx]
 97d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 980:	02 18                	add    bl,BYTE PTR [eax]
 982:	00 00                	add    BYTE PTR [eax],al
 984:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
 987:	03 08                	add    ecx,DWORD PTR [eax]
 989:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 98b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 98d:	49                   	dec    ecx
 98e:	13 02                	adc    eax,DWORD PTR [edx]
 990:	18 00                	sbb    BYTE PTR [eax],al
 992:	00 0a                	add    BYTE PTR [edx],cl
 994:	34 00                	xor    al,0x0
 996:	03 0e                	add    ecx,DWORD PTR [esi]
 998:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 99a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 99c:	49                   	dec    ecx
 99d:	13 3f                	adc    edi,DWORD PTR [edi]
 99f:	19 02                	sbb    DWORD PTR [edx],eax
 9a1:	18 00                	sbb    BYTE PTR [eax],al
 9a3:	00 00                	add    BYTE PTR [eax],al
 9a5:	01 11                	add    DWORD PTR [ecx],edx
 9a7:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 9ad:	0e                   	push   cs
 9ae:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 9b0:	11 01                	adc    DWORD PTR [ecx],eax
 9b2:	12 06                	adc    al,BYTE PTR [esi]
 9b4:	10 17                	adc    BYTE PTR [edi],dl
 9b6:	00 00                	add    BYTE PTR [eax],al
 9b8:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 9bb:	0b 0b                	or     ecx,DWORD PTR [ebx]
 9bd:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 9c0:	0e                   	push   cs
 9c1:	00 00                	add    BYTE PTR [eax],al
 9c3:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 9c6:	0b 0b                	or     ecx,DWORD PTR [ebx]
 9c8:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 9cb:	08 00                	or     BYTE PTR [eax],al
 9cd:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 9d0:	00 03                	add    BYTE PTR [ebx],al
 9d2:	0e                   	push   cs
 9d3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 9d5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 9d7:	49                   	dec    ecx
 9d8:	13 00                	adc    eax,DWORD PTR [eax]
 9da:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 9e0:	49                   	dec    ecx
 9e1:	13 00                	adc    eax,DWORD PTR [eax]
 9e3:	00 06                	add    BYTE PTR [esi],al
 9e5:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 9e9:	00 00                	add    BYTE PTR [eax],al
 9eb:	07                   	pop    es
 9ec:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 9ef:	19 03                	sbb    DWORD PTR [ebx],eax
 9f1:	0e                   	push   cs
 9f2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 9f4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 9f6:	27                   	daa    
 9f7:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 9fa:	11 01                	adc    DWORD PTR [ecx],eax
 9fc:	12 06                	adc    al,BYTE PTR [esi]
 9fe:	40                   	inc    eax
 9ff:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 a05:	00 00                	add    BYTE PTR [eax],al
 a07:	08 05 00 03 08 3a    	or     BYTE PTR ds:0x3a080300,al
 a0d:	0b 3b                	or     edi,DWORD PTR [ebx]
 a0f:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 a12:	02 18                	add    bl,BYTE PTR [eax]
 a14:	00 00                	add    BYTE PTR [eax],al
 a16:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
 a19:	03 08                	add    ecx,DWORD PTR [eax]
 a1b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 a1d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 a1f:	49                   	dec    ecx
 a20:	13 02                	adc    eax,DWORD PTR [edx]
 a22:	18 00                	sbb    BYTE PTR [eax],al
 a24:	00 0a                	add    BYTE PTR [edx],cl
 a26:	05 00 03 0e 3a       	add    eax,0x3a0e0300
 a2b:	0b 3b                	or     edi,DWORD PTR [ebx]
 a2d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 a30:	02 18                	add    bl,BYTE PTR [eax]
 a32:	00 00                	add    BYTE PTR [eax],al
 a34:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
 a37:	03 0e                	add    ecx,DWORD PTR [esi]
 a39:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 a3b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 a3d:	49                   	dec    ecx
 a3e:	13 3f                	adc    edi,DWORD PTR [edi]
 a40:	19 02                	sbb    DWORD PTR [edx],eax
 a42:	18 00                	sbb    BYTE PTR [eax],al
 a44:	00 00                	add    BYTE PTR [eax],al
 a46:	01 11                	add    DWORD PTR [ecx],edx
 a48:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 a4e:	0e                   	push   cs
 a4f:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 a51:	11 01                	adc    DWORD PTR [ecx],eax
 a53:	12 06                	adc    al,BYTE PTR [esi]
 a55:	10 17                	adc    BYTE PTR [edi],dl
 a57:	00 00                	add    BYTE PTR [eax],al
 a59:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 a5c:	0b 0b                	or     ecx,DWORD PTR [ebx]
 a5e:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 a61:	08 00                	or     BYTE PTR [eax],al
 a63:	00 03                	add    BYTE PTR [ebx],al
 a65:	16                   	push   ss
 a66:	00 03                	add    BYTE PTR [ebx],al
 a68:	0e                   	push   cs
 a69:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 a6b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 a6d:	49                   	dec    ecx
 a6e:	13 00                	adc    eax,DWORD PTR [eax]
 a70:	00 04 24             	add    BYTE PTR [esp],al
 a73:	00 0b                	add    BYTE PTR [ebx],cl
 a75:	0b 3e                	or     edi,DWORD PTR [esi]
 a77:	0b 03                	or     eax,DWORD PTR [ebx]
 a79:	0e                   	push   cs
 a7a:	00 00                	add    BYTE PTR [eax],al
 a7c:	05 2e 01 3f 19       	add    eax,0x193f012e
 a81:	03 0e                	add    ecx,DWORD PTR [esi]
 a83:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 a85:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 a87:	27                   	daa    
 a88:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 a8b:	11 01                	adc    DWORD PTR [ecx],eax
 a8d:	12 06                	adc    al,BYTE PTR [esi]
 a8f:	40                   	inc    eax
 a90:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 a96:	00 00                	add    BYTE PTR [eax],al
 a98:	06                   	push   es
 a99:	05 00 03 08 3a       	add    eax,0x3a080300
 a9e:	0b 3b                	or     edi,DWORD PTR [ebx]
 aa0:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 aa3:	02 18                	add    bl,BYTE PTR [eax]
 aa5:	00 00                	add    BYTE PTR [eax],al
 aa7:	07                   	pop    es
 aa8:	34 00                	xor    al,0x0
 aaa:	03 08                	add    ecx,DWORD PTR [eax]
 aac:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 aae:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 ab0:	49                   	dec    ecx
 ab1:	13 02                	adc    eax,DWORD PTR [edx]
 ab3:	18 00                	sbb    BYTE PTR [eax],al
 ab5:	00 08                	add    BYTE PTR [eax],cl
 ab7:	0f 00 0b             	str    WORD PTR [ebx]
 aba:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 abd:	00 00                	add    BYTE PTR [eax],al
 abf:	09 26                	or     DWORD PTR [esi],esp
 ac1:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 ac4:	00 00                	add    BYTE PTR [eax],al
 ac6:	00 01                	add    BYTE PTR [ecx],al
 ac8:	11 01                	adc    DWORD PTR [ecx],eax
 aca:	25 0e 13 0b 03       	and    eax,0x30b130e
 acf:	0e                   	push   cs
 ad0:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 ad2:	11 01                	adc    DWORD PTR [ecx],eax
 ad4:	12 06                	adc    al,BYTE PTR [esi]
 ad6:	10 17                	adc    BYTE PTR [edi],dl
 ad8:	00 00                	add    BYTE PTR [eax],al
 ada:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 add:	0b 0b                	or     ecx,DWORD PTR [ebx]
 adf:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 ae2:	08 00                	or     BYTE PTR [eax],al
 ae4:	00 03                	add    BYTE PTR [ebx],al
 ae6:	16                   	push   ss
 ae7:	00 03                	add    BYTE PTR [ebx],al
 ae9:	0e                   	push   cs
 aea:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 aec:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 aee:	49                   	dec    ecx
 aef:	13 00                	adc    eax,DWORD PTR [eax]
 af1:	00 04 24             	add    BYTE PTR [esp],al
 af4:	00 0b                	add    BYTE PTR [ebx],cl
 af6:	0b 3e                	or     edi,DWORD PTR [esi]
 af8:	0b 03                	or     eax,DWORD PTR [ebx]
 afa:	0e                   	push   cs
 afb:	00 00                	add    BYTE PTR [eax],al
 afd:	05 2e 01 3f 19       	add    eax,0x193f012e
 b02:	03 0e                	add    ecx,DWORD PTR [esi]
 b04:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 b06:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 b08:	27                   	daa    
 b09:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 b0c:	11 01                	adc    DWORD PTR [ecx],eax
 b0e:	12 06                	adc    al,BYTE PTR [esi]
 b10:	40                   	inc    eax
 b11:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 b17:	00 00                	add    BYTE PTR [eax],al
 b19:	06                   	push   es
 b1a:	05 00 03 08 3a       	add    eax,0x3a080300
 b1f:	0b 3b                	or     edi,DWORD PTR [ebx]
 b21:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 b24:	02 18                	add    bl,BYTE PTR [eax]
 b26:	00 00                	add    BYTE PTR [eax],al
 b28:	07                   	pop    es
 b29:	0f 00 0b             	str    WORD PTR [ebx]
 b2c:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 b2f:	00 00                	add    BYTE PTR [eax],al
 b31:	08 26                	or     BYTE PTR [esi],ah
 b33:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 b36:	00 00                	add    BYTE PTR [eax],al
 b38:	00 01                	add    BYTE PTR [ecx],al
 b3a:	11 01                	adc    DWORD PTR [ecx],eax
 b3c:	25 0e 13 0b 03       	and    eax,0x30b130e
 b41:	0e                   	push   cs
 b42:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 b44:	11 01                	adc    DWORD PTR [ecx],eax
 b46:	12 06                	adc    al,BYTE PTR [esi]
 b48:	10 17                	adc    BYTE PTR [edi],dl
 b4a:	00 00                	add    BYTE PTR [eax],al
 b4c:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 b4f:	0b 0b                	or     ecx,DWORD PTR [ebx]
 b51:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 b54:	08 00                	or     BYTE PTR [eax],al
 b56:	00 03                	add    BYTE PTR [ebx],al
 b58:	16                   	push   ss
 b59:	00 03                	add    BYTE PTR [ebx],al
 b5b:	0e                   	push   cs
 b5c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 b5e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 b60:	49                   	dec    ecx
 b61:	13 00                	adc    eax,DWORD PTR [eax]
 b63:	00 04 24             	add    BYTE PTR [esp],al
 b66:	00 0b                	add    BYTE PTR [ebx],cl
 b68:	0b 3e                	or     edi,DWORD PTR [esi]
 b6a:	0b 03                	or     eax,DWORD PTR [ebx]
 b6c:	0e                   	push   cs
 b6d:	00 00                	add    BYTE PTR [eax],al
 b6f:	05 2e 01 3f 19       	add    eax,0x193f012e
 b74:	03 0e                	add    ecx,DWORD PTR [esi]
 b76:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 b78:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 b7a:	27                   	daa    
 b7b:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 b7e:	11 01                	adc    DWORD PTR [ecx],eax
 b80:	12 06                	adc    al,BYTE PTR [esi]
 b82:	40                   	inc    eax
 b83:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 b89:	00 00                	add    BYTE PTR [eax],al
 b8b:	06                   	push   es
 b8c:	05 00 03 08 3a       	add    eax,0x3a080300
 b91:	0b 3b                	or     edi,DWORD PTR [ebx]
 b93:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 b96:	02 18                	add    bl,BYTE PTR [eax]
 b98:	00 00                	add    BYTE PTR [eax],al
 b9a:	07                   	pop    es
 b9b:	34 00                	xor    al,0x0
 b9d:	03 08                	add    ecx,DWORD PTR [eax]
 b9f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 ba1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 ba3:	49                   	dec    ecx
 ba4:	13 02                	adc    eax,DWORD PTR [edx]
 ba6:	18 00                	sbb    BYTE PTR [eax],al
 ba8:	00 08                	add    BYTE PTR [eax],cl
 baa:	0f 00 0b             	str    WORD PTR [ebx]
 bad:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 bb0:	00 00                	add    BYTE PTR [eax],al
 bb2:	09 26                	or     DWORD PTR [esi],esp
 bb4:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 bb7:	00 00                	add    BYTE PTR [eax],al
 bb9:	00 01                	add    BYTE PTR [ecx],al
 bbb:	11 01                	adc    DWORD PTR [ecx],eax
 bbd:	25 0e 13 0b 03       	and    eax,0x30b130e
 bc2:	0e                   	push   cs
 bc3:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 bc5:	11 01                	adc    DWORD PTR [ecx],eax
 bc7:	12 06                	adc    al,BYTE PTR [esi]
 bc9:	10 17                	adc    BYTE PTR [edi],dl
 bcb:	00 00                	add    BYTE PTR [eax],al
 bcd:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 bd0:	0b 0b                	or     ecx,DWORD PTR [ebx]
 bd2:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 bd5:	0e                   	push   cs
 bd6:	00 00                	add    BYTE PTR [eax],al
 bd8:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 bdb:	0b 0b                	or     ecx,DWORD PTR [ebx]
 bdd:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 be0:	08 00                	or     BYTE PTR [eax],al
 be2:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 be5:	00 03                	add    BYTE PTR [ebx],al
 be7:	0e                   	push   cs
 be8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 bea:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 bec:	49                   	dec    ecx
 bed:	13 00                	adc    eax,DWORD PTR [eax]
 bef:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 bf5:	49                   	dec    ecx
 bf6:	13 00                	adc    eax,DWORD PTR [eax]
 bf8:	00 06                	add    BYTE PTR [esi],al
 bfa:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 bfe:	00 00                	add    BYTE PTR [eax],al
 c00:	07                   	pop    es
 c01:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 c04:	19 03                	sbb    DWORD PTR [ebx],eax
 c06:	0e                   	push   cs
 c07:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 c09:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 c0b:	27                   	daa    
 c0c:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 c0f:	11 01                	adc    DWORD PTR [ecx],eax
 c11:	12 06                	adc    al,BYTE PTR [esi]
 c13:	40                   	inc    eax
 c14:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 c1a:	00 00                	add    BYTE PTR [eax],al
 c1c:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
 c22:	0b 3b                	or     edi,DWORD PTR [ebx]
 c24:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 c27:	02 18                	add    bl,BYTE PTR [eax]
 c29:	00 00                	add    BYTE PTR [eax],al
 c2b:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
 c2e:	03 08                	add    ecx,DWORD PTR [eax]
 c30:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 c32:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 c34:	49                   	dec    ecx
 c35:	13 02                	adc    eax,DWORD PTR [edx]
 c37:	18 00                	sbb    BYTE PTR [eax],al
 c39:	00 0a                	add    BYTE PTR [edx],cl
 c3b:	34 00                	xor    al,0x0
 c3d:	03 0e                	add    ecx,DWORD PTR [esi]
 c3f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 c41:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 c43:	49                   	dec    ecx
 c44:	13 00                	adc    eax,DWORD PTR [eax]
 c46:	00 0b                	add    BYTE PTR [ebx],cl
 c48:	34 00                	xor    al,0x0
 c4a:	03 08                	add    ecx,DWORD PTR [eax]
 c4c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 c4e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 c50:	49                   	dec    ecx
 c51:	13 00                	adc    eax,DWORD PTR [eax]
 c53:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
 c56:	00 03                	add    BYTE PTR [ebx],al
 c58:	0e                   	push   cs
 c59:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 c5b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 c5d:	49                   	dec    ecx
 c5e:	13 02                	adc    eax,DWORD PTR [edx]
 c60:	18 00                	sbb    BYTE PTR [eax],al
 c62:	00 0d 34 00 03 0e    	add    BYTE PTR ds:0xe030034,cl
 c68:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 c6a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 c6c:	49                   	dec    ecx
 c6d:	13 3f                	adc    edi,DWORD PTR [edi]
 c6f:	19 02                	sbb    DWORD PTR [edx],eax
 c71:	18 00                	sbb    BYTE PTR [eax],al
 c73:	00 00                	add    BYTE PTR [eax],al
 c75:	01 11                	add    DWORD PTR [ecx],edx
 c77:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 c7d:	0e                   	push   cs
 c7e:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 c80:	11 01                	adc    DWORD PTR [ecx],eax
 c82:	12 06                	adc    al,BYTE PTR [esi]
 c84:	10 17                	adc    BYTE PTR [edi],dl
 c86:	00 00                	add    BYTE PTR [eax],al
 c88:	02 2e                	add    ch,BYTE PTR [esi]
 c8a:	01 3f                	add    DWORD PTR [edi],edi
 c8c:	19 03                	sbb    DWORD PTR [ebx],eax
 c8e:	0e                   	push   cs
 c8f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 c91:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 c93:	27                   	daa    
 c94:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 c97:	11 01                	adc    DWORD PTR [ecx],eax
 c99:	12 06                	adc    al,BYTE PTR [esi]
 c9b:	40                   	inc    eax
 c9c:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 ca2:	00 00                	add    BYTE PTR [eax],al
 ca4:	03 05 00 03 08 3a    	add    eax,DWORD PTR ds:0x3a080300
 caa:	0b 3b                	or     edi,DWORD PTR [ebx]
 cac:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 caf:	02 18                	add    bl,BYTE PTR [eax]
 cb1:	00 00                	add    BYTE PTR [eax],al
 cb3:	04 0f                	add    al,0xf
 cb5:	00 0b                	add    BYTE PTR [ebx],cl
 cb7:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 cba:	00 00                	add    BYTE PTR [eax],al
 cbc:	05 24 00 0b 0b       	add    eax,0xb0b0024
 cc1:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 cc4:	0e                   	push   cs
 cc5:	00 00                	add    BYTE PTR [eax],al
 cc7:	06                   	push   es
 cc8:	24 00                	and    al,0x0
 cca:	0b 0b                	or     ecx,DWORD PTR [ebx]
 ccc:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 ccf:	08 00                	or     BYTE PTR [eax],al
 cd1:	00 00                	add    BYTE PTR [eax],al
 cd3:	01 11                	add    DWORD PTR [ecx],edx
 cd5:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 cdb:	0e                   	push   cs
 cdc:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 cde:	11 01                	adc    DWORD PTR [ecx],eax
 ce0:	12 06                	adc    al,BYTE PTR [esi]
 ce2:	10 17                	adc    BYTE PTR [edi],dl
 ce4:	00 00                	add    BYTE PTR [eax],al
 ce6:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 ce9:	0b 0b                	or     ecx,DWORD PTR [ebx]
 ceb:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 cee:	0e                   	push   cs
 cef:	00 00                	add    BYTE PTR [eax],al
 cf1:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 cf4:	0b 0b                	or     ecx,DWORD PTR [ebx]
 cf6:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 cf9:	08 00                	or     BYTE PTR [eax],al
 cfb:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 cfe:	00 03                	add    BYTE PTR [ebx],al
 d00:	0e                   	push   cs
 d01:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 d03:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 d05:	49                   	dec    ecx
 d06:	13 00                	adc    eax,DWORD PTR [eax]
 d08:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 d0e:	49                   	dec    ecx
 d0f:	13 00                	adc    eax,DWORD PTR [eax]
 d11:	00 06                	add    BYTE PTR [esi],al
 d13:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 d17:	00 00                	add    BYTE PTR [eax],al
 d19:	07                   	pop    es
 d1a:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 d1d:	19 03                	sbb    DWORD PTR [ebx],eax
 d1f:	0e                   	push   cs
 d20:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 d22:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 d24:	27                   	daa    
 d25:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 d28:	11 01                	adc    DWORD PTR [ecx],eax
 d2a:	12 06                	adc    al,BYTE PTR [esi]
 d2c:	40                   	inc    eax
 d2d:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 d33:	00 00                	add    BYTE PTR [eax],al
 d35:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
 d3b:	0b 3b                	or     edi,DWORD PTR [ebx]
 d3d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 d40:	02 18                	add    bl,BYTE PTR [eax]
 d42:	00 00                	add    BYTE PTR [eax],al
 d44:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
 d47:	03 08                	add    ecx,DWORD PTR [eax]
 d49:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 d4b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 d4d:	49                   	dec    ecx
 d4e:	13 02                	adc    eax,DWORD PTR [edx]
 d50:	18 00                	sbb    BYTE PTR [eax],al
 d52:	00 0a                	add    BYTE PTR [edx],cl
 d54:	34 00                	xor    al,0x0
 d56:	03 0e                	add    ecx,DWORD PTR [esi]
 d58:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 d5a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 d5c:	49                   	dec    ecx
 d5d:	13 00                	adc    eax,DWORD PTR [eax]
 d5f:	00 0b                	add    BYTE PTR [ebx],cl
 d61:	34 00                	xor    al,0x0
 d63:	03 08                	add    ecx,DWORD PTR [eax]
 d65:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 d67:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 d69:	49                   	dec    ecx
 d6a:	13 00                	adc    eax,DWORD PTR [eax]
 d6c:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
 d6f:	00 03                	add    BYTE PTR [ebx],al
 d71:	0e                   	push   cs
 d72:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 d74:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 d76:	49                   	dec    ecx
 d77:	13 3f                	adc    edi,DWORD PTR [edi]
 d79:	19 02                	sbb    DWORD PTR [edx],eax
 d7b:	18 00                	sbb    BYTE PTR [eax],al
 d7d:	00 00                	add    BYTE PTR [eax],al
 d7f:	01 11                	add    DWORD PTR [ecx],edx
 d81:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 d87:	0e                   	push   cs
 d88:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 d8a:	11 01                	adc    DWORD PTR [ecx],eax
 d8c:	12 06                	adc    al,BYTE PTR [esi]
 d8e:	10 17                	adc    BYTE PTR [edi],dl
 d90:	00 00                	add    BYTE PTR [eax],al
 d92:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 d95:	0b 0b                	or     ecx,DWORD PTR [ebx]
 d97:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 d9a:	0e                   	push   cs
 d9b:	00 00                	add    BYTE PTR [eax],al
 d9d:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 da0:	0b 0b                	or     ecx,DWORD PTR [ebx]
 da2:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 da5:	08 00                	or     BYTE PTR [eax],al
 da7:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 daa:	00 03                	add    BYTE PTR [ebx],al
 dac:	0e                   	push   cs
 dad:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 daf:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 db1:	49                   	dec    ecx
 db2:	13 00                	adc    eax,DWORD PTR [eax]
 db4:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 dba:	49                   	dec    ecx
 dbb:	13 00                	adc    eax,DWORD PTR [eax]
 dbd:	00 06                	add    BYTE PTR [esi],al
 dbf:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 dc2:	19 03                	sbb    DWORD PTR [ebx],eax
 dc4:	0e                   	push   cs
 dc5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 dc7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 dc9:	27                   	daa    
 dca:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 dcd:	11 01                	adc    DWORD PTR [ecx],eax
 dcf:	12 06                	adc    al,BYTE PTR [esi]
 dd1:	40                   	inc    eax
 dd2:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 dd8:	00 00                	add    BYTE PTR [eax],al
 dda:	07                   	pop    es
 ddb:	05 00 03 0e 3a       	add    eax,0x3a0e0300
 de0:	0b 3b                	or     edi,DWORD PTR [ebx]
 de2:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 de5:	02 18                	add    bl,BYTE PTR [eax]
 de7:	00 00                	add    BYTE PTR [eax],al
 de9:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
 dec:	03 0e                	add    ecx,DWORD PTR [esi]
 dee:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 df0:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 df2:	49                   	dec    ecx
 df3:	13 02                	adc    eax,DWORD PTR [edx]
 df5:	18 00                	sbb    BYTE PTR [eax],al
 df7:	00 09                	add    BYTE PTR [ecx],cl
 df9:	0b 01                	or     eax,DWORD PTR [ecx]
 dfb:	11 01                	adc    DWORD PTR [ecx],eax
 dfd:	12 06                	adc    al,BYTE PTR [esi]
 dff:	00 00                	add    BYTE PTR [eax],al
 e01:	0a 34 00             	or     dh,BYTE PTR [eax+eax*1]
 e04:	03 08                	add    ecx,DWORD PTR [eax]
 e06:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 e08:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 e0a:	49                   	dec    ecx
 e0b:	13 02                	adc    eax,DWORD PTR [edx]
 e0d:	18 00                	sbb    BYTE PTR [eax],al
 e0f:	00 0b                	add    BYTE PTR [ebx],cl
 e11:	34 00                	xor    al,0x0
 e13:	03 0e                	add    ecx,DWORD PTR [esi]
 e15:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 e17:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 e19:	49                   	dec    ecx
 e1a:	13 3f                	adc    edi,DWORD PTR [edi]
 e1c:	19 02                	sbb    DWORD PTR [edx],eax
 e1e:	18 00                	sbb    BYTE PTR [eax],al
 e20:	00 00                	add    BYTE PTR [eax],al
 e22:	01 11                	add    DWORD PTR [ecx],edx
 e24:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 e2a:	0e                   	push   cs
 e2b:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 e2d:	11 01                	adc    DWORD PTR [ecx],eax
 e2f:	12 06                	adc    al,BYTE PTR [esi]
 e31:	10 17                	adc    BYTE PTR [edi],dl
 e33:	00 00                	add    BYTE PTR [eax],al
 e35:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 e38:	03 0e                	add    ecx,DWORD PTR [esi]
 e3a:	0b 0b                	or     ecx,DWORD PTR [ebx]
 e3c:	49                   	dec    ecx
 e3d:	13 3a                	adc    edi,DWORD PTR [edx]
 e3f:	0b 3b                	or     edi,DWORD PTR [ebx]
 e41:	0b 01                	or     eax,DWORD PTR [ecx]
 e43:	13 00                	adc    eax,DWORD PTR [eax]
 e45:	00 03                	add    BYTE PTR [ebx],al
 e47:	28 00                	sub    BYTE PTR [eax],al
 e49:	03 0e                	add    ecx,DWORD PTR [esi]
 e4b:	1c 0b                	sbb    al,0xb
 e4d:	00 00                	add    BYTE PTR [eax],al
 e4f:	04 28                	add    al,0x28
 e51:	00 03                	add    BYTE PTR [ebx],al
 e53:	0e                   	push   cs
 e54:	1c 05                	sbb    al,0x5
 e56:	00 00                	add    BYTE PTR [eax],al
 e58:	05 24 00 0b 0b       	add    eax,0xb0b0024
 e5d:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 e60:	0e                   	push   cs
 e61:	00 00                	add    BYTE PTR [eax],al
 e63:	06                   	push   es
 e64:	24 00                	and    al,0x0
 e66:	0b 0b                	or     ecx,DWORD PTR [ebx]
 e68:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 e6b:	08 00                	or     BYTE PTR [eax],al
 e6d:	00 07                	add    BYTE PTR [edi],al
 e6f:	16                   	push   ss
 e70:	00 03                	add    BYTE PTR [ebx],al
 e72:	0e                   	push   cs
 e73:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 e75:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 e77:	49                   	dec    ecx
 e78:	13 00                	adc    eax,DWORD PTR [eax]
 e7a:	00 08                	add    BYTE PTR [eax],cl
 e7c:	13 01                	adc    eax,DWORD PTR [ecx]
 e7e:	03 08                	add    ecx,DWORD PTR [eax]
 e80:	0b 0b                	or     ecx,DWORD PTR [ebx]
 e82:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 e84:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 e86:	01 13                	add    DWORD PTR [ebx],edx
 e88:	00 00                	add    BYTE PTR [eax],al
 e8a:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
 e90:	0b 3b                	or     edi,DWORD PTR [ebx]
 e92:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 e95:	38 0b                	cmp    BYTE PTR [ebx],cl
 e97:	00 00                	add    BYTE PTR [eax],al
 e99:	0a 0f                	or     cl,BYTE PTR [edi]
 e9b:	00 0b                	add    BYTE PTR [ebx],cl
 e9d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 ea0:	00 00                	add    BYTE PTR [eax],al
 ea2:	0b 26                	or     esp,DWORD PTR [esi]
 ea4:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 ea7:	00 00                	add    BYTE PTR [eax],al
 ea9:	0c 2e                	or     al,0x2e
 eab:	01 3f                	add    DWORD PTR [edi],edi
 ead:	19 03                	sbb    DWORD PTR [ebx],eax
 eaf:	0e                   	push   cs
 eb0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 eb2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 eb4:	49                   	dec    ecx
 eb5:	13 11                	adc    edx,DWORD PTR [ecx]
 eb7:	01 12                	add    DWORD PTR [edx],edx
 eb9:	06                   	push   es
 eba:	40                   	inc    eax
 ebb:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 ec1:	00 00                	add    BYTE PTR [eax],al
 ec3:	0d 34 00 03 0e       	or     eax,0xe030034
 ec8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 eca:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 ecc:	49                   	dec    ecx
 ecd:	13 02                	adc    eax,DWORD PTR [edx]
 ecf:	18 00                	sbb    BYTE PTR [eax],al
 ed1:	00 0e                	add    BYTE PTR [esi],cl
 ed3:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 ed6:	19 03                	sbb    DWORD PTR [ebx],eax
 ed8:	0e                   	push   cs
 ed9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 edb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 edd:	27                   	daa    
 ede:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 ee1:	11 01                	adc    DWORD PTR [ecx],eax
 ee3:	12 06                	adc    al,BYTE PTR [esi]
 ee5:	40                   	inc    eax
 ee6:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 eec:	00 00                	add    BYTE PTR [eax],al
 eee:	0f 05                	syscall 
 ef0:	00 03                	add    BYTE PTR [ebx],al
 ef2:	0e                   	push   cs
 ef3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 ef5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 ef7:	49                   	dec    ecx
 ef8:	13 02                	adc    eax,DWORD PTR [edx]
 efa:	18 00                	sbb    BYTE PTR [eax],al
 efc:	00 10                	add    BYTE PTR [eax],dl
 efe:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 f01:	19 03                	sbb    DWORD PTR [ebx],eax
 f03:	0e                   	push   cs
 f04:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 f06:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 f08:	27                   	daa    
 f09:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 f0c:	11 01                	adc    DWORD PTR [ecx],eax
 f0e:	12 06                	adc    al,BYTE PTR [esi]
 f10:	40                   	inc    eax
 f11:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 f17:	00 00                	add    BYTE PTR [eax],al
 f19:	11 34 00             	adc    DWORD PTR [eax+eax*1],esi
 f1c:	03 08                	add    ecx,DWORD PTR [eax]
 f1e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 f20:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 f22:	49                   	dec    ecx
 f23:	13 02                	adc    eax,DWORD PTR [edx]
 f25:	18 00                	sbb    BYTE PTR [eax],al
 f27:	00 12                	add    BYTE PTR [edx],dl
 f29:	34 00                	xor    al,0x0
 f2b:	03 0e                	add    ecx,DWORD PTR [esi]
 f2d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 f2f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 f31:	49                   	dec    ecx
 f32:	13 3f                	adc    edi,DWORD PTR [edi]
 f34:	19 02                	sbb    DWORD PTR [edx],eax
 f36:	18 00                	sbb    BYTE PTR [eax],al
 f38:	00 13                	add    BYTE PTR [ebx],dl
 f3a:	01 01                	add    DWORD PTR [ecx],eax
 f3c:	49                   	dec    ecx
 f3d:	13 01                	adc    eax,DWORD PTR [ecx]
 f3f:	13 00                	adc    eax,DWORD PTR [eax]
 f41:	00 14 21             	add    BYTE PTR [ecx+eiz*1],dl
 f44:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 f47:	2f                   	das    
 f48:	0b 00                	or     eax,DWORD PTR [eax]
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
  86:	9f                   	lahf   
  87:	06                   	push   es
  88:	00 00                	add    BYTE PTR [eax],al
  8a:	04 00                	add    al,0x0
  8c:	00 00                	add    BYTE PTR [eax],al
  8e:	00 00                	add    BYTE PTR [eax],al
  90:	20 03                	and    BYTE PTR [ebx],al
  92:	00 30                	add    BYTE PTR [eax],dh
  94:	2a 03                	sub    al,BYTE PTR [ebx]
	...
  9e:	00 00                	add    BYTE PTR [eax],al
  a0:	1c 00                	sbb    al,0x0
  a2:	00 00                	add    BYTE PTR [eax],al
  a4:	02 00                	add    al,BYTE PTR [eax]
  a6:	89 0c 00             	mov    DWORD PTR [eax+eax*1],ecx
  a9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
  ac:	00 00                	add    BYTE PTR [eax],al
  ae:	00 00                	add    BYTE PTR [eax],al
  b0:	4c                   	dec    esp
  b1:	06                   	push   es
  b2:	00 30                	add    BYTE PTR [eax],dh
  b4:	f2 02 00             	repnz add al,BYTE PTR [eax]
	...
  bf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  c2:	00 00                	add    BYTE PTR [eax],al
  c4:	02 00                	add    al,BYTE PTR [eax]
  c6:	df 0e                	fisttp WORD PTR [esi]
  c8:	00 00                	add    BYTE PTR [eax],al
  ca:	04 00                	add    al,0x0
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	00 00                	add    BYTE PTR [eax],al
  d0:	40                   	inc    eax
  d1:	09 00                	or     DWORD PTR [eax],eax
  d3:	30 9b 01 00 00 00    	xor    BYTE PTR [ebx+0x1],bl
  d9:	00 00                	add    BYTE PTR [eax],al
  db:	00 00                	add    BYTE PTR [eax],al
  dd:	00 00                	add    BYTE PTR [eax],al
  df:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  e2:	00 00                	add    BYTE PTR [eax],al
  e4:	02 00                	add    al,BYTE PTR [eax]
  e6:	c1 10 00             	rcl    DWORD PTR [eax],0x0
  e9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
  ec:	00 00                	add    BYTE PTR [eax],al
  ee:	00 00                	add    BYTE PTR [eax],al
  f0:	dc 0a                	fmul   QWORD PTR [edx]
  f2:	00 30                	add    BYTE PTR [eax],dh
  f4:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  fa:	00 00                	add    BYTE PTR [eax],al
  fc:	00 00                	add    BYTE PTR [eax],al
  fe:	00 00                	add    BYTE PTR [eax],al
 100:	1c 00                	sbb    al,0x0
 102:	00 00                	add    BYTE PTR [eax],al
 104:	02 00                	add    al,BYTE PTR [eax]
 106:	5b                   	pop    ebx
 107:	12 00                	adc    al,BYTE PTR [eax]
 109:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 10c:	00 00                	add    BYTE PTR [eax],al
 10e:	00 00                	add    BYTE PTR [eax],al
 110:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 111:	0b 00                	or     eax,DWORD PTR [eax]
 113:	30 10                	xor    BYTE PTR [eax],dl
	...
 11d:	00 00                	add    BYTE PTR [eax],al
 11f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 122:	00 00                	add    BYTE PTR [eax],al
 124:	02 00                	add    al,BYTE PTR [eax]
 126:	c2 13 00             	ret    0x13
 129:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 12c:	00 00                	add    BYTE PTR [eax],al
 12e:	00 00                	add    BYTE PTR [eax],al
 130:	b4 0b                	mov    ah,0xb
 132:	00 30                	add    BYTE PTR [eax],dh
 134:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
	...
 13d:	00 00                	add    BYTE PTR [eax],al
 13f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 142:	00 00                	add    BYTE PTR [eax],al
 144:	02 00                	add    al,BYTE PTR [eax]
 146:	16                   	push   ss
 147:	18 00                	sbb    BYTE PTR [eax],al
 149:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 14c:	00 00                	add    BYTE PTR [eax],al
 14e:	00 00                	add    BYTE PTR [eax],al
 150:	5c                   	pop    esp
 151:	0c 00                	or     al,0x0
 153:	30 ad 00 00 00 00    	xor    BYTE PTR [ebp+0x0],ch
 159:	00 00                	add    BYTE PTR [eax],al
 15b:	00 00                	add    BYTE PTR [eax],al
 15d:	00 00                	add    BYTE PTR [eax],al
 15f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 162:	00 00                	add    BYTE PTR [eax],al
 164:	02 00                	add    al,BYTE PTR [eax]
 166:	85 19                	test   DWORD PTR [ecx],ebx
 168:	00 00                	add    BYTE PTR [eax],al
 16a:	04 00                	add    al,0x0
 16c:	00 00                	add    BYTE PTR [eax],al
 16e:	00 00                	add    BYTE PTR [eax],al
 170:	0c 0d                	or     al,0xd
 172:	00 30                	add    BYTE PTR [eax],dh
 174:	5e                   	pop    esi
	...
 17d:	00 00                	add    BYTE PTR [eax],al
 17f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 182:	00 00                	add    BYTE PTR [eax],al
 184:	02 00                	add    al,BYTE PTR [eax]
 186:	e3 1a                	jecxz  1a2 <sysEnter_Vector-0x12fe5e>
 188:	00 00                	add    BYTE PTR [eax],al
 18a:	04 00                	add    al,0x0
 18c:	00 00                	add    BYTE PTR [eax],al
 18e:	00 00                	add    BYTE PTR [eax],al
 190:	6c                   	ins    BYTE PTR es:[edi],dx
 191:	0d 00 30 87 00       	or     eax,0x873000
	...
 19e:	00 00                	add    BYTE PTR [eax],al
 1a0:	1c 00                	sbb    al,0x0
 1a2:	00 00                	add    BYTE PTR [eax],al
 1a4:	02 00                	add    al,BYTE PTR [eax]
 1a6:	64                   	fs
 1a7:	1c 00                	sbb    al,0x0
 1a9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 1ac:	00 00                	add    BYTE PTR [eax],al
 1ae:	00 00                	add    BYTE PTR [eax],al
 1b0:	f4                   	hlt    
 1b1:	0d 00 30 31 00       	or     eax,0x313000
	...
 1be:	00 00                	add    BYTE PTR [eax],al
 1c0:	1c 00                	sbb    al,0x0
 1c2:	00 00                	add    BYTE PTR [eax],al
 1c4:	02 00                	add    al,BYTE PTR [eax]
 1c6:	00 1d 00 00 04 00    	add    BYTE PTR ds:0x40000,bl
 1cc:	00 00                	add    BYTE PTR [eax],al
 1ce:	00 00                	add    BYTE PTR [eax],al
 1d0:	28 0e                	sub    BYTE PTR [esi],cl
 1d2:	00 30                	add    BYTE PTR [eax],dh
 1d4:	67 00 00             	add    BYTE PTR [bx+si],al
	...
 1df:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 1e2:	00 00                	add    BYTE PTR [eax],al
 1e4:	02 00                	add    al,BYTE PTR [eax]
 1e6:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 1e7:	1d 00 00 04 00       	sbb    eax,0x40000
 1ec:	00 00                	add    BYTE PTR [eax],al
 1ee:	00 00                	add    BYTE PTR [eax],al
 1f0:	90                   	nop
 1f1:	0e                   	push   cs
 1f2:	00 30                	add    BYTE PTR [eax],dh
 1f4:	60                   	pusha  
	...
 1fd:	00 00                	add    BYTE PTR [eax],al
 1ff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 202:	00 00                	add    BYTE PTR [eax],al
 204:	02 00                	add    al,BYTE PTR [eax]
 206:	5e                   	pop    esi
 207:	1e                   	push   ds
 208:	00 00                	add    BYTE PTR [eax],al
 20a:	04 00                	add    al,0x0
 20c:	00 00                	add    BYTE PTR [eax],al
 20e:	00 00                	add    BYTE PTR [eax],al
 210:	f0 0e                	lock push cs
 212:	00 30                	add    BYTE PTR [eax],dh
 214:	7d 01                	jge    217 <sysEnter_Vector-0x12fde9>
	...
 21e:	00 00                	add    BYTE PTR [eax],al
 220:	1c 00                	sbb    al,0x0
 222:	00 00                	add    BYTE PTR [eax],al
 224:	02 00                	add    al,BYTE PTR [eax]
 226:	ee                   	out    dx,al
 227:	1f                   	pop    ds
 228:	00 00                	add    BYTE PTR [eax],al
 22a:	04 00                	add    al,0x0
 22c:	00 00                	add    BYTE PTR [eax],al
 22e:	00 00                	add    BYTE PTR [eax],al
 230:	70 10                	jo     242 <sysEnter_Vector-0x12fdbe>
 232:	00 30                	add    BYTE PTR [eax],dh
 234:	1d 00 00 00 00       	sbb    eax,0x0
 239:	00 00                	add    BYTE PTR [eax],al
 23b:	00 00                	add    BYTE PTR [eax],al
 23d:	00 00                	add    BYTE PTR [eax],al
 23f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 242:	00 00                	add    BYTE PTR [eax],al
 244:	02 00                	add    al,BYTE PTR [eax]
 246:	5e                   	pop    esi
 247:	20 00                	and    BYTE PTR [eax],al
 249:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 24c:	00 00                	add    BYTE PTR [eax],al
 24e:	00 00                	add    BYTE PTR [eax],al
 250:	90                   	nop
 251:	10 00                	adc    BYTE PTR [eax],al
 253:	30 9c 01 00 00 00 00 	xor    BYTE PTR [ecx+eax*1+0x0],bl
 25a:	00 00                	add    BYTE PTR [eax],al
 25c:	00 00                	add    BYTE PTR [eax],al
 25e:	00 00                	add    BYTE PTR [eax],al
 260:	1c 00                	sbb    al,0x0
 262:	00 00                	add    BYTE PTR [eax],al
 264:	02 00                	add    al,BYTE PTR [eax]
 266:	ec                   	in     al,dx
 267:	21 00                	and    DWORD PTR [eax],eax
 269:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 26c:	00 00                	add    BYTE PTR [eax],al
 26e:	00 00                	add    BYTE PTR [eax],al
 270:	2c 12                	sub    al,0x12
 272:	00 30                	add    BYTE PTR [eax],dh
 274:	53                   	push   ebx
 275:	01 00                	add    DWORD PTR [eax],eax
	...
 27f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 282:	00 00                	add    BYTE PTR [eax],al
 284:	02 00                	add    al,BYTE PTR [eax]
 286:	9d                   	popf   
 287:	23 00                	and    eax,DWORD PTR [eax]
 289:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 28c:	00 00                	add    BYTE PTR [eax],al
 28e:	00 00                	add    BYTE PTR [eax],al
 290:	80 13 00             	adc    BYTE PTR [ebx],0x0
 293:	30 16                	xor    BYTE PTR [esi],dl
 295:	0c 00                	or     al,0x0
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
     3fc:	5c                   	pop    esp
     3fd:	01 00                	add    DWORD PTR [eax],eax
     3ff:	00 02                	add    BYTE PTR [edx],al
     401:	00 ea                	add    dl,ch
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
     4af:	73 74                	jae    525 <sysEnter_Vector-0x12fadb>
     4b1:	64                   	fs
     4b2:	64                   	fs
     4b3:	65                   	gs
     4b4:	66                   	data16
     4b5:	2e                   	cs
     4b6:	68 00 02 00 00       	push   0x200
     4bb:	74 69                	je     526 <sysEnter_Vector-0x12fada>
     4bd:	6d                   	ins    DWORD PTR es:[edi],dx
     4be:	65                   	gs
     4bf:	2e                   	cs
     4c0:	68 00 03 00 00       	push   0x300
     4c5:	6d                   	ins    DWORD PTR es:[edi],dx
     4c6:	61                   	popa   
     4c7:	6c                   	ins    BYTE PTR es:[edi],dx
     4c8:	6c                   	ins    BYTE PTR es:[edi],dx
     4c9:	6f                   	outs   dx,DWORD PTR ds:[esi]
     4ca:	63 2e                	arpl   WORD PTR [esi],bp
     4cc:	68 00 03 00 00       	push   0x300
     4d1:	6c                   	ins    BYTE PTR es:[edi],dx
     4d2:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     4d9:	4f                   	dec    edi
     4da:	53                   	push   ebx
     4db:	2e                   	cs
     4dc:	68 00 03 00 00       	push   0x300
     4e1:	73 79                	jae    55c <sysEnter_Vector-0x12faa4>
     4e3:	73 63                	jae    548 <sysEnter_Vector-0x12fab8>
     4e5:	61                   	popa   
     4e6:	6c                   	ins    BYTE PTR es:[edi],dx
     4e7:	6c                   	ins    BYTE PTR es:[edi],dx
     4e8:	73 2e                	jae    518 <sysEnter_Vector-0x12fae8>
     4ea:	68 00 04 00 00       	push   0x400
     4ef:	00 00                	add    BYTE PTR [eax],al
     4f1:	05 02 20 03 00       	add    eax,0x32002
     4f6:	30 03                	xor    BYTE PTR [ebx],al
     4f8:	0f 01 08             	sidtd  [eax]
     4fb:	13 75 08             	adc    esi,DWORD PTR [ebp+0x8]
     4fe:	3d 3d 69 08 13       	cmp    eax,0x1308693d
     503:	75 08                	jne    50d <sysEnter_Vector-0x12faf3>
     505:	2f                   	das    
     506:	3d 69 08 13 75       	cmp    eax,0x75130869
     50b:	f3 3d 69 f3 75 ad    	repz cmp eax,0xad75f369
     511:	3d 31 08 21 08       	cmp    eax,0x8210831
     516:	67 59                	addr16 pop ecx
     518:	bb c9 08 67 69       	mov    ebx,0x696708c9
     51d:	08 13                	or     BYTE PTR [ebx],dl
     51f:	75 77                	jne    598 <sysEnter_Vector-0x12fa68>
     521:	f4                   	hlt    
     522:	67 08 67 59          	or     BYTE PTR [bx+0x59],ah
     526:	31 f4                	xor    esp,esi
     528:	67 08 67 59          	or     BYTE PTR [bx+0x59],ah
     52c:	31 08                	xor    DWORD PTR [eax],ecx
     52e:	14 67                	adc    al,0x67
     530:	08 4b 59             	or     BYTE PTR [ebx+0x59],cl
     533:	69 08 13 02 32 13    	imul   ecx,DWORD PTR [eax],0x13320213
     539:	59                   	pop    ecx
     53a:	69 c9 c9 3f c9 08    	imul   ecx,ecx,0x8c93fc9
     540:	83 3f 08             	cmp    DWORD PTR [edi],0x8
     543:	13 77 08             	adc    esi,DWORD PTR [edi+0x8]
     546:	31 3d 69 c9 c9 3f    	xor    DWORD PTR ds:0x3fc9c969,edi
     54c:	08 21                	or     BYTE PTR [ecx],ah
     54e:	76 08                	jbe    558 <sysEnter_Vector-0x12faa8>
     550:	13 08                	adc    ecx,DWORD PTR [eax]
     552:	2f                   	das    
     553:	5b                   	pop    ebx
     554:	c9                   	leave  
     555:	08 13                	or     BYTE PTR [ebx],dl
     557:	02 02                	add    al,BYTE PTR [edx]
     559:	00 01                	add    BYTE PTR [ecx],al
     55b:	01 14 01             	add    DWORD PTR [ecx+eax*1],edx
     55e:	00 00                	add    BYTE PTR [eax],al
     560:	02 00                	add    al,BYTE PTR [eax]
     562:	aa                   	stos   BYTE PTR es:[edi],al
     563:	00 00                	add    BYTE PTR [eax],al
     565:	00 01                	add    BYTE PTR [ecx],al
     567:	01 fb                	add    ebx,edi
     569:	0e                   	push   cs
     56a:	0d 00 01 01 01       	or     eax,0x1010100
     56f:	01 00                	add    DWORD PTR [eax],eax
     571:	00 00                	add    BYTE PTR [eax],al
     573:	01 00                	add    DWORD PTR [eax],eax
     575:	00 01                	add    BYTE PTR [ecx],al
     577:	73 72                	jae    5eb <sysEnter_Vector-0x12fa15>
     579:	63 00                	arpl   WORD PTR [eax],ax
     57b:	2f                   	das    
     57c:	68 6f 6d 65 2f       	push   0x2f656d6f
     581:	79 6f                	jns    5f2 <sysEnter_Vector-0x12fa0e>
     583:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     58a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     58d:	73 73                	jae    602 <sysEnter_Vector-0x12f9fe>
     58f:	2f                   	das    
     590:	6c                   	ins    BYTE PTR es:[edi],dx
     591:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     598:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     59e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     5a4:	78 2d                	js     5d3 <sysEnter_Vector-0x12fa2d>
     5a6:	67 6e                	outs   dx,BYTE PTR ds:[si]
     5a8:	75 2f                	jne    5d9 <sysEnter_Vector-0x12fa27>
     5aa:	35 2e 33 2e 30       	xor    eax,0x302e332e
     5af:	2f                   	das    
     5b0:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     5b7:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     5ba:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     5be:	65 00 00             	add    BYTE PTR gs:[eax],al
     5c1:	6d                   	ins    DWORD PTR es:[edi],dx
     5c2:	61                   	popa   
     5c3:	6c                   	ins    BYTE PTR es:[edi],dx
     5c4:	6c                   	ins    BYTE PTR es:[edi],dx
     5c5:	6f                   	outs   dx,DWORD PTR ds:[esi]
     5c6:	63 2e                	arpl   WORD PTR [esi],bp
     5c8:	63 00                	arpl   WORD PTR [eax],ax
     5ca:	01 00                	add    DWORD PTR [eax],eax
     5cc:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     5cf:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     5d6:	63 
     5d7:	2e                   	cs
     5d8:	68 00 02 00 00       	push   0x200
     5dd:	73 74                	jae    653 <sysEnter_Vector-0x12f9ad>
     5df:	64                   	fs
     5e0:	64                   	fs
     5e1:	65                   	gs
     5e2:	66                   	data16
     5e3:	2e                   	cs
     5e4:	68 00 02 00 00       	push   0x200
     5e9:	6d                   	ins    DWORD PTR es:[edi],dx
     5ea:	61                   	popa   
     5eb:	6c                   	ins    BYTE PTR es:[edi],dx
     5ec:	6c                   	ins    BYTE PTR es:[edi],dx
     5ed:	6f                   	outs   dx,DWORD PTR ds:[esi]
     5ee:	63 2e                	arpl   WORD PTR [esi],bp
     5f0:	68 00 03 00 00       	push   0x300
     5f5:	74 69                	je     660 <sysEnter_Vector-0x12f9a0>
     5f7:	6d                   	ins    DWORD PTR es:[edi],dx
     5f8:	65                   	gs
     5f9:	2e                   	cs
     5fa:	68 00 03 00 00       	push   0x300
     5ff:	6c                   	ins    BYTE PTR es:[edi],dx
     600:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     607:	4f                   	dec    edi
     608:	53                   	push   ebx
     609:	2e                   	cs
     60a:	68 00 03 00 00       	push   0x300
     60f:	00 00                	add    BYTE PTR [eax],al
     611:	05 02 4c 06 00       	add    eax,0x64c02
     616:	30 03                	xor    BYTE PTR [ebx],al
     618:	0c 01                	or     al,0x1
     61a:	c9                   	leave  
     61b:	bb bb bb 3f f3       	mov    ebx,0xf33fbbbb
     620:	92                   	xchg   edx,eax
     621:	08 85 08 67 00 02    	or     BYTE PTR [ebp+0x2006708],al
     627:	04 01                	add    al,0x1
     629:	06                   	push   es
     62a:	66 06                	pushw  es
     62c:	bc f5 a1 59 31       	mov    esp,0x3159a1f5
     631:	08 35 08 ad 08 13    	or     BYTE PTR ds:0x1308ad08,dh
     637:	08 ad a0 08 22 02    	or     BYTE PTR [ebp+0x22208a0],ch
     63d:	22 13                	and    dl,BYTE PTR [ebx]
     63f:	f3 02 28             	repz add ch,BYTE PTR [eax]
     642:	13 bc ad ad 02 22 15 	adc    edi,DWORD PTR [ebp+ebp*4+0x152202ad]
     649:	02 22                	add    ah,BYTE PTR [edx]
     64b:	13 ad 91 91 75 08    	adc    ebp,DWORD PTR [ebp+0x8759191]
     651:	f3 d7                	repz xlat BYTE PTR ds:[ebx]
     653:	08 13                	or     BYTE PTR [ebx],dl
     655:	91                   	xchg   ecx,eax
     656:	08 75 08             	or     BYTE PTR [ebp+0x8],dh
     659:	ad                   	lods   eax,DWORD PTR ds:[esi]
     65a:	3d 77 f5 68 93       	cmp    eax,0x9368f577
     65f:	00 02                	add    BYTE PTR [edx],al
     661:	04 02                	add    al,0x2
     663:	be 30 03 76 90       	mov    esi,0x90760330
     668:	03 0b                	add    ecx,DWORD PTR [ebx]
     66a:	20 31                	and    BYTE PTR [ecx],dh
     66c:	d7                   	xlat   BYTE PTR ds:[ebx]
     66d:	08 3d 02 04 00 01    	or     BYTE PTR ds:0x1000402,bh
     673:	01 ed                	add    ebp,ebp
     675:	00 00                	add    BYTE PTR [eax],al
     677:	00 02                	add    BYTE PTR [edx],al
     679:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     67f:	01 fb                	add    ebx,edi
     681:	0e                   	push   cs
     682:	0d 00 01 01 01       	or     eax,0x1010100
     687:	01 00                	add    DWORD PTR [eax],eax
     689:	00 00                	add    BYTE PTR [eax],al
     68b:	01 00                	add    DWORD PTR [eax],eax
     68d:	00 01                	add    BYTE PTR [ecx],al
     68f:	73 72                	jae    703 <sysEnter_Vector-0x12f8fd>
     691:	63 00                	arpl   WORD PTR [eax],ax
     693:	2f                   	das    
     694:	68 6f 6d 65 2f       	push   0x2f656d6f
     699:	79 6f                	jns    70a <sysEnter_Vector-0x12f8f6>
     69b:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     6a2:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     6a5:	73 73                	jae    71a <sysEnter_Vector-0x12f8e6>
     6a7:	2f                   	das    
     6a8:	6c                   	ins    BYTE PTR es:[edi],dx
     6a9:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     6b0:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     6b6:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     6bc:	78 2d                	js     6eb <sysEnter_Vector-0x12f915>
     6be:	67 6e                	outs   dx,BYTE PTR ds:[si]
     6c0:	75 2f                	jne    6f1 <sysEnter_Vector-0x12f90f>
     6c2:	35 2e 33 2e 30       	xor    eax,0x302e332e
     6c7:	2f                   	das    
     6c8:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     6cf:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     6d2:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     6d6:	65 00 00             	add    BYTE PTR gs:[eax],al
     6d9:	6d                   	ins    DWORD PTR es:[edi],dx
     6da:	65                   	gs
     6db:	6d                   	ins    DWORD PTR es:[edi],dx
     6dc:	63 70 79             	arpl   WORD PTR [eax+0x79],si
     6df:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     6e2:	01 00                	add    DWORD PTR [eax],eax
     6e4:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     6e7:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     6ee:	63 
     6ef:	2e                   	cs
     6f0:	68 00 02 00 00       	push   0x200
     6f5:	74 69                	je     760 <sysEnter_Vector-0x12f8a0>
     6f7:	6d                   	ins    DWORD PTR es:[edi],dx
     6f8:	65                   	gs
     6f9:	2e                   	cs
     6fa:	68 00 03 00 00       	push   0x300
     6ff:	73 74                	jae    775 <sysEnter_Vector-0x12f88b>
     701:	64                   	fs
     702:	64                   	fs
     703:	65                   	gs
     704:	66                   	data16
     705:	2e                   	cs
     706:	68 00 02 00 00       	push   0x200
     70b:	6d                   	ins    DWORD PTR es:[edi],dx
     70c:	61                   	popa   
     70d:	6c                   	ins    BYTE PTR es:[edi],dx
     70e:	6c                   	ins    BYTE PTR es:[edi],dx
     70f:	6f                   	outs   dx,DWORD PTR ds:[esi]
     710:	63 2e                	arpl   WORD PTR [esi],bp
     712:	68 00 03 00 00       	push   0x300
     717:	6c                   	ins    BYTE PTR es:[edi],dx
     718:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     71f:	4f                   	dec    edi
     720:	53                   	push   ebx
     721:	2e                   	cs
     722:	68 00 03 00 00       	push   0x300
     727:	00 00                	add    BYTE PTR [eax],al
     729:	05 02 40 09 00       	add    eax,0x94002
     72e:	30 03                	xor    BYTE PTR [ebx],al
     730:	0a 01                	or     al,BYTE PTR [ecx]
     732:	f5                   	cmc    
     733:	d7                   	xlat   BYTE PTR ds:[ebx]
     734:	d7                   	xlat   BYTE PTR ds:[ebx]
     735:	68 91 67 68 83       	push   0x83686791
     73a:	91                   	xchg   ecx,eax
     73b:	91                   	xchg   ecx,eax
     73c:	2f                   	das    
     73d:	08 1f                	or     BYTE PTR [edi],bl
     73f:	e8 08 57 ca 84       	call   84ca5e4c <ticksToWait+0x54ca28cc>
     744:	68 83 67 68 83       	push   0x83686783
     749:	91                   	xchg   ecx,eax
     74a:	91                   	xchg   ecx,eax
     74b:	2f                   	das    
     74c:	08 1f                	or     BYTE PTR [edi],bl
     74e:	e8 08 57 ca 5c       	call   5cca5e5b <ticksToWait+0x2cca28db>
     753:	67 68 83 67 67 2f    	addr16 push 0x2f676783
     759:	08 2d e8 08 65 ca    	or     BYTE PTR ds:0xca6508e8,ch
     75f:	3e 02 02             	add    al,BYTE PTR ds:[edx]
     762:	00 01                	add    BYTE PTR [ecx],al
     764:	01 d0                	add    eax,edx
     766:	00 00                	add    BYTE PTR [eax],al
     768:	00 02                	add    BYTE PTR [edx],al
     76a:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     770:	01 fb                	add    ebx,edi
     772:	0e                   	push   cs
     773:	0d 00 01 01 01       	or     eax,0x1010100
     778:	01 00                	add    DWORD PTR [eax],eax
     77a:	00 00                	add    BYTE PTR [eax],al
     77c:	01 00                	add    DWORD PTR [eax],eax
     77e:	00 01                	add    BYTE PTR [ecx],al
     780:	73 72                	jae    7f4 <sysEnter_Vector-0x12f80c>
     782:	63 00                	arpl   WORD PTR [eax],ax
     784:	2f                   	das    
     785:	68 6f 6d 65 2f       	push   0x2f656d6f
     78a:	79 6f                	jns    7fb <sysEnter_Vector-0x12f805>
     78c:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     793:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     796:	73 73                	jae    80b <sysEnter_Vector-0x12f7f5>
     798:	2f                   	das    
     799:	6c                   	ins    BYTE PTR es:[edi],dx
     79a:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     7a1:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     7a7:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     7ad:	78 2d                	js     7dc <sysEnter_Vector-0x12f824>
     7af:	67 6e                	outs   dx,BYTE PTR ds:[si]
     7b1:	75 2f                	jne    7e2 <sysEnter_Vector-0x12f81e>
     7b3:	35 2e 33 2e 30       	xor    eax,0x302e332e
     7b8:	2f                   	das    
     7b9:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     7c0:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     7c3:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     7c7:	65 00 00             	add    BYTE PTR gs:[eax],al
     7ca:	6d                   	ins    DWORD PTR es:[edi],dx
     7cb:	65                   	gs
     7cc:	6d                   	ins    DWORD PTR es:[edi],dx
     7cd:	73 65                	jae    834 <sysEnter_Vector-0x12f7cc>
     7cf:	74 2e                	je     7ff <sysEnter_Vector-0x12f801>
     7d1:	63 00                	arpl   WORD PTR [eax],ax
     7d3:	01 00                	add    DWORD PTR [eax],eax
     7d5:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     7d8:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     7df:	63 
     7e0:	2e                   	cs
     7e1:	68 00 02 00 00       	push   0x200
     7e6:	73 74                	jae    85c <sysEnter_Vector-0x12f7a4>
     7e8:	64                   	fs
     7e9:	64                   	fs
     7ea:	65                   	gs
     7eb:	66                   	data16
     7ec:	2e                   	cs
     7ed:	68 00 02 00 00       	push   0x200
     7f2:	74 69                	je     85d <sysEnter_Vector-0x12f7a3>
     7f4:	6d                   	ins    DWORD PTR es:[edi],dx
     7f5:	65                   	gs
     7f6:	2e                   	cs
     7f7:	68 00 03 00 00       	push   0x300
     7fc:	6d                   	ins    DWORD PTR es:[edi],dx
     7fd:	61                   	popa   
     7fe:	6c                   	ins    BYTE PTR es:[edi],dx
     7ff:	6c                   	ins    BYTE PTR es:[edi],dx
     800:	6f                   	outs   dx,DWORD PTR ds:[esi]
     801:	63 2e                	arpl   WORD PTR [esi],bp
     803:	68 00 03 00 00       	push   0x300
     808:	6c                   	ins    BYTE PTR es:[edi],dx
     809:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     810:	4f                   	dec    edi
     811:	53                   	push   ebx
     812:	2e                   	cs
     813:	68 00 03 00 00       	push   0x300
     818:	00 00                	add    BYTE PTR [eax],al
     81a:	05 02 dc 0a 00       	add    eax,0xadc02
     81f:	30 1a                	xor    BYTE PTR [edx],bl
     821:	f3 67 67 08 83 67 08 	repz addr32 or BYTE PTR [bp+di+0x867],al
     828:	ca 9f 2f             	retf   0x2f9f
     82b:	d5 bd                	aad    0xbd
     82d:	9f                   	lahf   
     82e:	2f                   	das    
     82f:	f1                   	icebp  
     830:	bf d5 cb 3d 02       	mov    edi,0x23dcbd5
     835:	02 00                	add    al,BYTE PTR [eax]
     837:	01 01                	add    DWORD PTR [ecx],eax
     839:	c9                   	leave  
     83a:	00 00                	add    BYTE PTR [eax],al
     83c:	00 02                	add    BYTE PTR [edx],al
     83e:	00 b3 00 00 00 01    	add    BYTE PTR [ebx+0x1000000],dh
     844:	01 fb                	add    ebx,edi
     846:	0e                   	push   cs
     847:	0d 00 01 01 01       	or     eax,0x1010100
     84c:	01 00                	add    DWORD PTR [eax],eax
     84e:	00 00                	add    BYTE PTR [eax],al
     850:	01 00                	add    DWORD PTR [eax],eax
     852:	00 01                	add    BYTE PTR [ecx],al
     854:	73 72                	jae    8c8 <sysEnter_Vector-0x12f738>
     856:	63 00                	arpl   WORD PTR [eax],ax
     858:	2f                   	das    
     859:	68 6f 6d 65 2f       	push   0x2f656d6f
     85e:	79 6f                	jns    8cf <sysEnter_Vector-0x12f731>
     860:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     867:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     86a:	73 73                	jae    8df <sysEnter_Vector-0x12f721>
     86c:	2f                   	das    
     86d:	6c                   	ins    BYTE PTR es:[edi],dx
     86e:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     875:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     87b:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     881:	78 2d                	js     8b0 <sysEnter_Vector-0x12f750>
     883:	67 6e                	outs   dx,BYTE PTR ds:[si]
     885:	75 2f                	jne    8b6 <sysEnter_Vector-0x12f74a>
     887:	35 2e 33 2e 30       	xor    eax,0x302e332e
     88c:	2f                   	das    
     88d:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     894:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     897:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     89b:	65 00 00             	add    BYTE PTR gs:[eax],al
     89e:	6d                   	ins    DWORD PTR es:[edi],dx
     89f:	6d                   	ins    DWORD PTR es:[edi],dx
     8a0:	61                   	popa   
     8a1:	70 2e                	jo     8d1 <sysEnter_Vector-0x12f72f>
     8a3:	63 00                	arpl   WORD PTR [eax],ax
     8a5:	01 00                	add    DWORD PTR [eax],eax
     8a7:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     8aa:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     8b1:	63 
     8b2:	2e                   	cs
     8b3:	68 00 02 00 00       	push   0x200
     8b8:	73 74                	jae    92e <sysEnter_Vector-0x12f6d2>
     8ba:	64                   	fs
     8bb:	64                   	fs
     8bc:	65                   	gs
     8bd:	66                   	data16
     8be:	2e                   	cs
     8bf:	68 00 02 00 00       	push   0x200
     8c4:	74 69                	je     92f <sysEnter_Vector-0x12f6d1>
     8c6:	6d                   	ins    DWORD PTR es:[edi],dx
     8c7:	65                   	gs
     8c8:	2e                   	cs
     8c9:	68 00 03 00 00       	push   0x300
     8ce:	74 79                	je     949 <sysEnter_Vector-0x12f6b7>
     8d0:	70 65                	jo     937 <sysEnter_Vector-0x12f6c9>
     8d2:	73 2e                	jae    902 <sysEnter_Vector-0x12f6fe>
     8d4:	68 00 03 00 00       	push   0x300
     8d9:	6d                   	ins    DWORD PTR es:[edi],dx
     8da:	61                   	popa   
     8db:	6c                   	ins    BYTE PTR es:[edi],dx
     8dc:	6c                   	ins    BYTE PTR es:[edi],dx
     8dd:	6f                   	outs   dx,DWORD PTR ds:[esi]
     8de:	63 2e                	arpl   WORD PTR [esi],bp
     8e0:	68 00 03 00 00       	push   0x300
     8e5:	6c                   	ins    BYTE PTR es:[edi],dx
     8e6:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     8ed:	4f                   	dec    edi
     8ee:	53                   	push   ebx
     8ef:	2e                   	cs
     8f0:	68 00 03 00 00       	push   0x300
     8f5:	00 00                	add    BYTE PTR [eax],al
     8f7:	05 02 a4 0b 00       	add    eax,0xba402
     8fc:	30 03                	xor    BYTE PTR [ebx],al
     8fe:	09 01                	or     DWORD PTR [ecx],eax
     900:	ca 02 03             	retf   0x302
     903:	00 01                	add    BYTE PTR [ecx],al
     905:	01 e0                	add    eax,esp
     907:	00 00                	add    BYTE PTR [eax],al
     909:	00 02                	add    BYTE PTR [edx],al
     90b:	00 bc 00 00 00 01 01 	add    BYTE PTR [eax+eax*1+0x1010000],bh
     912:	fb                   	sti    
     913:	0e                   	push   cs
     914:	0d 00 01 01 01       	or     eax,0x1010100
     919:	01 00                	add    DWORD PTR [eax],eax
     91b:	00 00                	add    BYTE PTR [eax],al
     91d:	01 00                	add    DWORD PTR [eax],eax
     91f:	00 01                	add    BYTE PTR [ecx],al
     921:	73 72                	jae    995 <sysEnter_Vector-0x12f66b>
     923:	63 00                	arpl   WORD PTR [eax],ax
     925:	2e                   	cs
     926:	2e                   	cs
     927:	2f                   	das    
     928:	2e                   	cs
     929:	2e                   	cs
     92a:	2f                   	das    
     92b:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
     92f:	6a 2f                	push   0x2f
     931:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
     934:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
     93b:	6e                   	outs   dx,BYTE PTR ds:[esi]
     93c:	65                   	gs
     93d:	6c                   	ins    BYTE PTR es:[edi],dx
     93e:	2f                   	das    
     93f:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     946:	00 2f                	add    BYTE PTR [edi],ch
     948:	68 6f 6d 65 2f       	push   0x2f656d6f
     94d:	79 6f                	jns    9be <sysEnter_Vector-0x12f642>
     94f:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     956:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     959:	73 73                	jae    9ce <sysEnter_Vector-0x12f632>
     95b:	2f                   	das    
     95c:	6c                   	ins    BYTE PTR es:[edi],dx
     95d:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     964:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     96a:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     970:	78 2d                	js     99f <sysEnter_Vector-0x12f661>
     972:	67 6e                	outs   dx,BYTE PTR ds:[si]
     974:	75 2f                	jne    9a5 <sysEnter_Vector-0x12f65b>
     976:	35 2e 33 2e 30       	xor    eax,0x302e332e
     97b:	2f                   	das    
     97c:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     983:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     986:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     98a:	65 00 00             	add    BYTE PTR gs:[eax],al
     98d:	73 74                	jae    a03 <sysEnter_Vector-0x12f5fd>
     98f:	64 69 6f 2e 63 00 01 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x10063
     996:	00 
     997:	00 64 6c 6c          	add    BYTE PTR [esp+ebp*2+0x6c],ah
     99b:	69 73 74 2e 68 00 02 	imul   esi,DWORD PTR [ebx+0x74],0x200682e
     9a2:	00 00                	add    BYTE PTR [eax],al
     9a4:	73 74                	jae    a1a <sysEnter_Vector-0x12f5e6>
     9a6:	64                   	fs
     9a7:	64                   	fs
     9a8:	65                   	gs
     9a9:	66                   	data16
     9aa:	2e                   	cs
     9ab:	68 00 03 00 00       	push   0x300
     9b0:	73 74                	jae    a26 <sysEnter_Vector-0x12f5da>
     9b2:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     9b9:	63 
     9ba:	2e                   	cs
     9bb:	68 00 03 00 00       	push   0x300
     9c0:	73 74                	jae    a36 <sysEnter_Vector-0x12f5ca>
     9c2:	64 69 6f 2e 68 00 04 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x40068
     9c9:	00 
     9ca:	00 00                	add    BYTE PTR [eax],al
     9cc:	00 05 02 b4 0b 00    	add    BYTE PTR ds:0xbb402,al
     9d2:	30 03                	xor    BYTE PTR [ebx],al
     9d4:	0f 01 08             	sidtd  [eax]
     9d7:	13 08                	adc    ecx,DWORD PTR [eax]
     9d9:	59                   	pop    ecx
     9da:	5b                   	pop    ebx
     9db:	08 13                	or     BYTE PTR [ebx],dl
     9dd:	f3 5b                	repz pop ebx
     9df:	c9                   	leave  
     9e0:	e5 d7                	in     eax,0xd7
     9e2:	e5 08                	in     eax,0x8
     9e4:	67 02 03             	add    al,BYTE PTR [bp+di]
     9e7:	00 01                	add    BYTE PTR [ecx],al
     9e9:	01 cf                	add    edi,ecx
     9eb:	00 00                	add    BYTE PTR [eax],al
     9ed:	00 02                	add    BYTE PTR [edx],al
     9ef:	00 a6 00 00 00 01    	add    BYTE PTR [esi+0x1000000],ah
     9f5:	01 fb                	add    ebx,edi
     9f7:	0e                   	push   cs
     9f8:	0d 00 01 01 01       	or     eax,0x1010100
     9fd:	01 00                	add    DWORD PTR [eax],eax
     9ff:	00 00                	add    BYTE PTR [eax],al
     a01:	01 00                	add    DWORD PTR [eax],eax
     a03:	00 01                	add    BYTE PTR [ecx],al
     a05:	73 72                	jae    a79 <sysEnter_Vector-0x12f587>
     a07:	63 2f                	arpl   WORD PTR [edi],bp
     a09:	73 74                	jae    a7f <sysEnter_Vector-0x12f581>
     a0b:	72 69                	jb     a76 <sysEnter_Vector-0x12f58a>
     a0d:	6e                   	outs   dx,BYTE PTR ds:[esi]
     a0e:	67 73 00             	addr16 jae a11 <sysEnter_Vector-0x12f5ef>
     a11:	2f                   	das    
     a12:	68 6f 6d 65 2f       	push   0x2f656d6f
     a17:	79 6f                	jns    a88 <sysEnter_Vector-0x12f578>
     a19:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     a20:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     a23:	73 73                	jae    a98 <sysEnter_Vector-0x12f568>
     a25:	2f                   	das    
     a26:	6c                   	ins    BYTE PTR es:[edi],dx
     a27:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     a2e:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     a34:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     a3a:	78 2d                	js     a69 <sysEnter_Vector-0x12f597>
     a3c:	67 6e                	outs   dx,BYTE PTR ds:[si]
     a3e:	75 2f                	jne    a6f <sysEnter_Vector-0x12f591>
     a40:	35 2e 33 2e 30       	xor    eax,0x302e332e
     a45:	2f                   	das    
     a46:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     a4d:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     a50:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     a54:	65 00 00             	add    BYTE PTR gs:[eax],al
     a57:	73 74                	jae    acd <sysEnter_Vector-0x12f533>
     a59:	72 63                	jb     abe <sysEnter_Vector-0x12f542>
     a5b:	61                   	popa   
     a5c:	74 2e                	je     a8c <sysEnter_Vector-0x12f574>
     a5e:	63 00                	arpl   WORD PTR [eax],ax
     a60:	01 00                	add    DWORD PTR [eax],eax
     a62:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     a65:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     a6c:	63 
     a6d:	2e                   	cs
     a6e:	68 00 02 00 00       	push   0x200
     a73:	74 69                	je     ade <sysEnter_Vector-0x12f522>
     a75:	6d                   	ins    DWORD PTR es:[edi],dx
     a76:	65                   	gs
     a77:	2e                   	cs
     a78:	68 00 03 00 00       	push   0x300
     a7d:	6d                   	ins    DWORD PTR es:[edi],dx
     a7e:	61                   	popa   
     a7f:	6c                   	ins    BYTE PTR es:[edi],dx
     a80:	6c                   	ins    BYTE PTR es:[edi],dx
     a81:	6f                   	outs   dx,DWORD PTR ds:[esi]
     a82:	63 2e                	arpl   WORD PTR [esi],bp
     a84:	68 00 03 00 00       	push   0x300
     a89:	6c                   	ins    BYTE PTR es:[edi],dx
     a8a:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     a91:	4f                   	dec    edi
     a92:	53                   	push   ebx
     a93:	2e                   	cs
     a94:	68 00 03 00 00       	push   0x300
     a99:	00 00                	add    BYTE PTR [eax],al
     a9b:	05 02 5c 0c 00       	add    eax,0xc5c02
     aa0:	30 03                	xor    BYTE PTR [ebx],al
     aa2:	1d 01 08 21 02       	sbb    eax,0x2210801
     aa7:	24 13                	and    al,0x13
     aa9:	3d 5a f5 76 2f       	cmp    eax,0x2f76f55a
     aae:	49                   	dec    ecx
     aaf:	e8 76 2f 08 4b       	call   4b083a2a <ticksToWait+0x1b0804aa>
     ab4:	4b                   	dec    ebx
     ab5:	47                   	inc    edi
     ab6:	ea ad 02 03 00 01 01 	jmp    0x101:0x302ad
     abd:	c5 00                	lds    eax,FWORD PTR [eax]
     abf:	00 00                	add    BYTE PTR [eax],al
     ac1:	02 00                	add    al,BYTE PTR [eax]
     ac3:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     ac4:	00 00                	add    BYTE PTR [eax],al
     ac6:	00 01                	add    BYTE PTR [ecx],al
     ac8:	01 fb                	add    ebx,edi
     aca:	0e                   	push   cs
     acb:	0d 00 01 01 01       	or     eax,0x1010100
     ad0:	01 00                	add    DWORD PTR [eax],eax
     ad2:	00 00                	add    BYTE PTR [eax],al
     ad4:	01 00                	add    DWORD PTR [eax],eax
     ad6:	00 01                	add    BYTE PTR [ecx],al
     ad8:	73 72                	jae    b4c <sysEnter_Vector-0x12f4b4>
     ada:	63 2f                	arpl   WORD PTR [edi],bp
     adc:	73 74                	jae    b52 <sysEnter_Vector-0x12f4ae>
     ade:	72 69                	jb     b49 <sysEnter_Vector-0x12f4b7>
     ae0:	6e                   	outs   dx,BYTE PTR ds:[esi]
     ae1:	67 73 00             	addr16 jae ae4 <sysEnter_Vector-0x12f51c>
     ae4:	2f                   	das    
     ae5:	68 6f 6d 65 2f       	push   0x2f656d6f
     aea:	79 6f                	jns    b5b <sysEnter_Vector-0x12f4a5>
     aec:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     af3:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     af6:	73 73                	jae    b6b <sysEnter_Vector-0x12f495>
     af8:	2f                   	das    
     af9:	6c                   	ins    BYTE PTR es:[edi],dx
     afa:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     b01:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     b07:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     b0d:	78 2d                	js     b3c <sysEnter_Vector-0x12f4c4>
     b0f:	67 6e                	outs   dx,BYTE PTR ds:[si]
     b11:	75 2f                	jne    b42 <sysEnter_Vector-0x12f4be>
     b13:	35 2e 33 2e 30       	xor    eax,0x302e332e
     b18:	2f                   	das    
     b19:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     b20:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     b23:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     b27:	65 00 00             	add    BYTE PTR gs:[eax],al
     b2a:	73 74                	jae    ba0 <sysEnter_Vector-0x12f460>
     b2c:	72 63                	jb     b91 <sysEnter_Vector-0x12f46f>
     b2e:	6d                   	ins    DWORD PTR es:[edi],dx
     b2f:	70 2e                	jo     b5f <sysEnter_Vector-0x12f4a1>
     b31:	63 00                	arpl   WORD PTR [eax],ax
     b33:	01 00                	add    DWORD PTR [eax],eax
     b35:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     b38:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     b3f:	63 
     b40:	2e                   	cs
     b41:	68 00 02 00 00       	push   0x200
     b46:	74 69                	je     bb1 <sysEnter_Vector-0x12f44f>
     b48:	6d                   	ins    DWORD PTR es:[edi],dx
     b49:	65                   	gs
     b4a:	2e                   	cs
     b4b:	68 00 03 00 00       	push   0x300
     b50:	6d                   	ins    DWORD PTR es:[edi],dx
     b51:	61                   	popa   
     b52:	6c                   	ins    BYTE PTR es:[edi],dx
     b53:	6c                   	ins    BYTE PTR es:[edi],dx
     b54:	6f                   	outs   dx,DWORD PTR ds:[esi]
     b55:	63 2e                	arpl   WORD PTR [esi],bp
     b57:	68 00 03 00 00       	push   0x300
     b5c:	6c                   	ins    BYTE PTR es:[edi],dx
     b5d:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     b64:	4f                   	dec    edi
     b65:	53                   	push   ebx
     b66:	2e                   	cs
     b67:	68 00 03 00 00       	push   0x300
     b6c:	00 00                	add    BYTE PTR [eax],al
     b6e:	05 02 0c 0d 00       	add    eax,0xd0c02
     b73:	30 03                	xor    BYTE PTR [ebx],al
     b75:	18 01                	sbb    BYTE PTR [ecx],al
     b77:	08 21                	or     BYTE PTR [ecx],ah
     b79:	3d 41 ad ad 67       	cmp    eax,0x67adad41
     b7e:	d8 92 bb 02 07 00    	fcom   DWORD PTR [edx+0x702bb]
     b84:	01 01                	add    DWORD PTR [ecx],eax
     b86:	d8 00                	fadd   DWORD PTR [eax]
     b88:	00 00                	add    BYTE PTR [eax],al
     b8a:	02 00                	add    al,BYTE PTR [eax]
     b8c:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     b8d:	00 00                	add    BYTE PTR [eax],al
     b8f:	00 01                	add    BYTE PTR [ecx],al
     b91:	01 fb                	add    ebx,edi
     b93:	0e                   	push   cs
     b94:	0d 00 01 01 01       	or     eax,0x1010100
     b99:	01 00                	add    DWORD PTR [eax],eax
     b9b:	00 00                	add    BYTE PTR [eax],al
     b9d:	01 00                	add    DWORD PTR [eax],eax
     b9f:	00 01                	add    BYTE PTR [ecx],al
     ba1:	73 72                	jae    c15 <sysEnter_Vector-0x12f3eb>
     ba3:	63 2f                	arpl   WORD PTR [edi],bp
     ba5:	73 74                	jae    c1b <sysEnter_Vector-0x12f3e5>
     ba7:	72 69                	jb     c12 <sysEnter_Vector-0x12f3ee>
     ba9:	6e                   	outs   dx,BYTE PTR ds:[esi]
     baa:	67 73 00             	addr16 jae bad <sysEnter_Vector-0x12f453>
     bad:	2f                   	das    
     bae:	68 6f 6d 65 2f       	push   0x2f656d6f
     bb3:	79 6f                	jns    c24 <sysEnter_Vector-0x12f3dc>
     bb5:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     bbc:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     bbf:	73 73                	jae    c34 <sysEnter_Vector-0x12f3cc>
     bc1:	2f                   	das    
     bc2:	6c                   	ins    BYTE PTR es:[edi],dx
     bc3:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     bca:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     bd0:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     bd6:	78 2d                	js     c05 <sysEnter_Vector-0x12f3fb>
     bd8:	67 6e                	outs   dx,BYTE PTR ds:[si]
     bda:	75 2f                	jne    c0b <sysEnter_Vector-0x12f3f5>
     bdc:	35 2e 33 2e 30       	xor    eax,0x302e332e
     be1:	2f                   	das    
     be2:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     be9:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     bec:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     bf0:	65 00 00             	add    BYTE PTR gs:[eax],al
     bf3:	73 74                	jae    c69 <sysEnter_Vector-0x12f397>
     bf5:	72 63                	jb     c5a <sysEnter_Vector-0x12f3a6>
     bf7:	70 79                	jo     c72 <sysEnter_Vector-0x12f38e>
     bf9:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     bfc:	01 00                	add    DWORD PTR [eax],eax
     bfe:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     c01:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     c08:	63 
     c09:	2e                   	cs
     c0a:	68 00 02 00 00       	push   0x200
     c0f:	74 69                	je     c7a <sysEnter_Vector-0x12f386>
     c11:	6d                   	ins    DWORD PTR es:[edi],dx
     c12:	65                   	gs
     c13:	2e                   	cs
     c14:	68 00 03 00 00       	push   0x300
     c19:	6d                   	ins    DWORD PTR es:[edi],dx
     c1a:	61                   	popa   
     c1b:	6c                   	ins    BYTE PTR es:[edi],dx
     c1c:	6c                   	ins    BYTE PTR es:[edi],dx
     c1d:	6f                   	outs   dx,DWORD PTR ds:[esi]
     c1e:	63 2e                	arpl   WORD PTR [esi],bp
     c20:	68 00 03 00 00       	push   0x300
     c25:	6c                   	ins    BYTE PTR es:[edi],dx
     c26:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     c2d:	4f                   	dec    edi
     c2e:	53                   	push   ebx
     c2f:	2e                   	cs
     c30:	68 00 03 00 00       	push   0x300
     c35:	00 00                	add    BYTE PTR [eax],al
     c37:	05 02 6c 0d 00       	add    eax,0xd6c02
     c3c:	30 16                	xor    BYTE PTR [esi],dl
     c3e:	f3 67 00 02          	repz add BYTE PTR [bp+si],al
     c42:	04 01                	add    al,0x1
     c44:	06                   	push   es
     c45:	20 06                	and    BYTE PTR [esi],al
     c47:	08 ca                	or     dl,cl
     c49:	67 3d 32 f3 67 00    	addr16 cmp eax,0x67f332
     c4f:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
     c52:	06                   	push   es
     c53:	20 00                	and    BYTE PTR [eax],al
     c55:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     c58:	08 c8                	or     al,cl
     c5a:	06                   	push   es
     c5b:	ca 3d 02             	retf   0x23d
     c5e:	02 00                	add    al,BYTE PTR [eax]
     c60:	01 01                	add    DWORD PTR [ecx],eax
     c62:	8d 00                	lea    eax,[eax]
     c64:	00 00                	add    BYTE PTR [eax],al
     c66:	02 00                	add    al,BYTE PTR [eax]
     c68:	74 00                	je     c6a <sysEnter_Vector-0x12f396>
     c6a:	00 00                	add    BYTE PTR [eax],al
     c6c:	01 01                	add    DWORD PTR [ecx],eax
     c6e:	fb                   	sti    
     c6f:	0e                   	push   cs
     c70:	0d 00 01 01 01       	or     eax,0x1010100
     c75:	01 00                	add    DWORD PTR [eax],eax
     c77:	00 00                	add    BYTE PTR [eax],al
     c79:	01 00                	add    DWORD PTR [eax],eax
     c7b:	00 01                	add    BYTE PTR [ecx],al
     c7d:	73 72                	jae    cf1 <sysEnter_Vector-0x12f30f>
     c7f:	63 2f                	arpl   WORD PTR [edi],bp
     c81:	73 74                	jae    cf7 <sysEnter_Vector-0x12f309>
     c83:	72 69                	jb     cee <sysEnter_Vector-0x12f312>
     c85:	6e                   	outs   dx,BYTE PTR ds:[esi]
     c86:	67 73 00             	addr16 jae c89 <sysEnter_Vector-0x12f377>
     c89:	2f                   	das    
     c8a:	68 6f 6d 65 2f       	push   0x2f656d6f
     c8f:	79 6f                	jns    d00 <sysEnter_Vector-0x12f300>
     c91:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     c98:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     c9b:	73 73                	jae    d10 <sysEnter_Vector-0x12f2f0>
     c9d:	2f                   	das    
     c9e:	6c                   	ins    BYTE PTR es:[edi],dx
     c9f:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     ca6:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     cac:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     cb2:	78 2d                	js     ce1 <sysEnter_Vector-0x12f31f>
     cb4:	67 6e                	outs   dx,BYTE PTR ds:[si]
     cb6:	75 2f                	jne    ce7 <sysEnter_Vector-0x12f319>
     cb8:	35 2e 33 2e 30       	xor    eax,0x302e332e
     cbd:	2f                   	das    
     cbe:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     cc5:	00 00                	add    BYTE PTR [eax],al
     cc7:	73 74                	jae    d3d <sysEnter_Vector-0x12f2c3>
     cc9:	72 6c                	jb     d37 <sysEnter_Vector-0x12f2c9>
     ccb:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     ccd:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     cd0:	01 00                	add    DWORD PTR [eax],eax
     cd2:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     cd5:	64                   	fs
     cd6:	64                   	fs
     cd7:	65                   	gs
     cd8:	66                   	data16
     cd9:	2e                   	cs
     cda:	68 00 02 00 00       	push   0x200
     cdf:	00 00                	add    BYTE PTR [eax],al
     ce1:	05 02 f4 0d 00       	add    eax,0xdf402
     ce6:	30 14 f3             	xor    BYTE PTR [ebx+esi*8],dl
     ce9:	75 2f                	jne    d1a <sysEnter_Vector-0x12f2e6>
     ceb:	49                   	dec    ecx
     cec:	e6 3d                	out    0x3d,al
     cee:	02 02                	add    al,BYTE PTR [edx]
     cf0:	00 01                	add    BYTE PTR [ecx],al
     cf2:	01 a5 00 00 00 02    	add    DWORD PTR [ebp+0x2000000],esp
     cf8:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
     cfb:	00 00                	add    BYTE PTR [eax],al
     cfd:	01 01                	add    DWORD PTR [ecx],eax
     cff:	fb                   	sti    
     d00:	0e                   	push   cs
     d01:	0d 00 01 01 01       	or     eax,0x1010100
     d06:	01 00                	add    DWORD PTR [eax],eax
     d08:	00 00                	add    BYTE PTR [eax],al
     d0a:	01 00                	add    DWORD PTR [eax],eax
     d0c:	00 01                	add    BYTE PTR [ecx],al
     d0e:	73 72                	jae    d82 <sysEnter_Vector-0x12f27e>
     d10:	63 2f                	arpl   WORD PTR [edi],bp
     d12:	73 74                	jae    d88 <sysEnter_Vector-0x12f278>
     d14:	72 69                	jb     d7f <sysEnter_Vector-0x12f281>
     d16:	6e                   	outs   dx,BYTE PTR ds:[esi]
     d17:	67 73 00             	addr16 jae d1a <sysEnter_Vector-0x12f2e6>
     d1a:	2f                   	das    
     d1b:	68 6f 6d 65 2f       	push   0x2f656d6f
     d20:	79 6f                	jns    d91 <sysEnter_Vector-0x12f26f>
     d22:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     d29:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     d2c:	73 73                	jae    da1 <sysEnter_Vector-0x12f25f>
     d2e:	2f                   	das    
     d2f:	6c                   	ins    BYTE PTR es:[edi],dx
     d30:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     d37:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     d3d:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     d43:	78 2d                	js     d72 <sysEnter_Vector-0x12f28e>
     d45:	67 6e                	outs   dx,BYTE PTR ds:[si]
     d47:	75 2f                	jne    d78 <sysEnter_Vector-0x12f288>
     d49:	35 2e 33 2e 30       	xor    eax,0x302e332e
     d4e:	2f                   	das    
     d4f:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     d56:	00 00                	add    BYTE PTR [eax],al
     d58:	73 74                	jae    dce <sysEnter_Vector-0x12f232>
     d5a:	72 6e                	jb     dca <sysEnter_Vector-0x12f236>
     d5c:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
     d5f:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     d62:	01 00                	add    DWORD PTR [eax],eax
     d64:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     d67:	64                   	fs
     d68:	64                   	fs
     d69:	65                   	gs
     d6a:	66                   	data16
     d6b:	2e                   	cs
     d6c:	68 00 02 00 00       	push   0x200
     d71:	00 00                	add    BYTE PTR [eax],al
     d73:	05 02 28 0e 00       	add    eax,0xe2802
     d78:	30 03                	xor    BYTE PTR [ebx],al
     d7a:	0c 01                	or     al,0x1
     d7c:	c9                   	leave  
     d7d:	2f                   	das    
     d7e:	f3 00 02             	repz add BYTE PTR [edx],al
     d81:	04 01                	add    al,0x1
     d83:	06                   	push   es
     d84:	f2 00 02             	repnz add BYTE PTR [edx],al
     d87:	04 02                	add    al,0x2
     d89:	74 06                	je     d91 <sysEnter_Vector-0x12f26f>
     d8b:	75 9f                	jne    d2c <sysEnter_Vector-0x12f2d4>
     d8d:	70 00                	jo     d8f <sysEnter_Vector-0x12f271>
     d8f:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     d92:	06                   	push   es
     d93:	ba 06 6b 59 02       	mov    edx,0x2596b06
     d98:	02 00                	add    al,BYTE PTR [eax]
     d9a:	01 01                	add    DWORD PTR [ecx],eax
     d9c:	9d                   	popf   
     d9d:	00 00                	add    BYTE PTR [eax],al
     d9f:	00 02                	add    BYTE PTR [edx],al
     da1:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
     da4:	00 00                	add    BYTE PTR [eax],al
     da6:	01 01                	add    DWORD PTR [ecx],eax
     da8:	fb                   	sti    
     da9:	0e                   	push   cs
     daa:	0d 00 01 01 01       	or     eax,0x1010100
     daf:	01 00                	add    DWORD PTR [eax],eax
     db1:	00 00                	add    BYTE PTR [eax],al
     db3:	01 00                	add    DWORD PTR [eax],eax
     db5:	00 01                	add    BYTE PTR [ecx],al
     db7:	73 72                	jae    e2b <sysEnter_Vector-0x12f1d5>
     db9:	63 2f                	arpl   WORD PTR [edi],bp
     dbb:	73 74                	jae    e31 <sysEnter_Vector-0x12f1cf>
     dbd:	72 69                	jb     e28 <sysEnter_Vector-0x12f1d8>
     dbf:	6e                   	outs   dx,BYTE PTR ds:[esi]
     dc0:	67 73 00             	addr16 jae dc3 <sysEnter_Vector-0x12f23d>
     dc3:	2f                   	das    
     dc4:	68 6f 6d 65 2f       	push   0x2f656d6f
     dc9:	79 6f                	jns    e3a <sysEnter_Vector-0x12f1c6>
     dcb:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     dd2:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     dd5:	73 73                	jae    e4a <sysEnter_Vector-0x12f1b6>
     dd7:	2f                   	das    
     dd8:	6c                   	ins    BYTE PTR es:[edi],dx
     dd9:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     de0:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     de6:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     dec:	78 2d                	js     e1b <sysEnter_Vector-0x12f1e5>
     dee:	67 6e                	outs   dx,BYTE PTR ds:[si]
     df0:	75 2f                	jne    e21 <sysEnter_Vector-0x12f1df>
     df2:	35 2e 33 2e 30       	xor    eax,0x302e332e
     df7:	2f                   	das    
     df8:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     dff:	00 00                	add    BYTE PTR [eax],al
     e01:	73 74                	jae    e77 <sysEnter_Vector-0x12f189>
     e03:	72 6e                	jb     e73 <sysEnter_Vector-0x12f18d>
     e05:	63 70 79             	arpl   WORD PTR [eax+0x79],si
     e08:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     e0b:	01 00                	add    DWORD PTR [eax],eax
     e0d:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     e10:	64                   	fs
     e11:	64                   	fs
     e12:	65                   	gs
     e13:	66                   	data16
     e14:	2e                   	cs
     e15:	68 00 02 00 00       	push   0x200
     e1a:	00 00                	add    BYTE PTR [eax],al
     e1c:	05 02 90 0e 00       	add    eax,0xe9002
     e21:	30 03                	xor    BYTE PTR [ebx],al
     e23:	0d 01 f3 67 2f       	or     eax,0x2f67f301
     e28:	08 67 48             	or     BYTE PTR [edi+0x48],ah
     e2b:	00 02                	add    BYTE PTR [edx],al
     e2d:	04 01                	add    al,0x1
     e2f:	06                   	push   es
     e30:	66 06                	pushw  es
     e32:	a2 2f bb 48 6a       	mov    ds:0x6a48bb2f,al
     e37:	3d 02 02 00 01       	cmp    eax,0x1000202
     e3c:	01 53 01             	add    DWORD PTR [ebx+0x1],edx
     e3f:	00 00                	add    BYTE PTR [eax],al
     e41:	02 00                	add    al,BYTE PTR [eax]
     e43:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     e44:	00 00                	add    BYTE PTR [eax],al
     e46:	00 01                	add    BYTE PTR [ecx],al
     e48:	01 fb                	add    ebx,edi
     e4a:	0e                   	push   cs
     e4b:	0d 00 01 01 01       	or     eax,0x1010100
     e50:	01 00                	add    DWORD PTR [eax],eax
     e52:	00 00                	add    BYTE PTR [eax],al
     e54:	01 00                	add    DWORD PTR [eax],eax
     e56:	00 01                	add    BYTE PTR [ecx],al
     e58:	73 72                	jae    ecc <sysEnter_Vector-0x12f134>
     e5a:	63 2f                	arpl   WORD PTR [edi],bp
     e5c:	73 74                	jae    ed2 <sysEnter_Vector-0x12f12e>
     e5e:	72 69                	jb     ec9 <sysEnter_Vector-0x12f137>
     e60:	6e                   	outs   dx,BYTE PTR ds:[esi]
     e61:	67 73 00             	addr16 jae e64 <sysEnter_Vector-0x12f19c>
     e64:	2f                   	das    
     e65:	68 6f 6d 65 2f       	push   0x2f656d6f
     e6a:	79 6f                	jns    edb <sysEnter_Vector-0x12f125>
     e6c:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     e73:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     e76:	73 73                	jae    eeb <sysEnter_Vector-0x12f115>
     e78:	2f                   	das    
     e79:	6c                   	ins    BYTE PTR es:[edi],dx
     e7a:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     e81:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     e87:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     e8d:	78 2d                	js     ebc <sysEnter_Vector-0x12f144>
     e8f:	67 6e                	outs   dx,BYTE PTR ds:[si]
     e91:	75 2f                	jne    ec2 <sysEnter_Vector-0x12f13e>
     e93:	35 2e 33 2e 30       	xor    eax,0x302e332e
     e98:	2f                   	das    
     e99:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     ea0:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     ea3:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     ea7:	65 00 00             	add    BYTE PTR gs:[eax],al
     eaa:	73 74                	jae    f20 <sysEnter_Vector-0x12f0e0>
     eac:	72 6f                	jb     f1d <sysEnter_Vector-0x12f0e3>
     eae:	75 6c                	jne    f1c <sysEnter_Vector-0x12f0e4>
     eb0:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     eb3:	01 00                	add    DWORD PTR [eax],eax
     eb5:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     eb8:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     ebf:	63 
     ec0:	2e                   	cs
     ec1:	68 00 02 00 00       	push   0x200
     ec6:	74 69                	je     f31 <sysEnter_Vector-0x12f0cf>
     ec8:	6d                   	ins    DWORD PTR es:[edi],dx
     ec9:	65                   	gs
     eca:	2e                   	cs
     ecb:	68 00 03 00 00       	push   0x300
     ed0:	6d                   	ins    DWORD PTR es:[edi],dx
     ed1:	61                   	popa   
     ed2:	6c                   	ins    BYTE PTR es:[edi],dx
     ed3:	6c                   	ins    BYTE PTR es:[edi],dx
     ed4:	6f                   	outs   dx,DWORD PTR ds:[esi]
     ed5:	63 2e                	arpl   WORD PTR [esi],bp
     ed7:	68 00 03 00 00       	push   0x300
     edc:	6c                   	ins    BYTE PTR es:[edi],dx
     edd:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     ee4:	4f                   	dec    edi
     ee5:	53                   	push   ebx
     ee6:	2e                   	cs
     ee7:	68 00 03 00 00       	push   0x300
     eec:	00 00                	add    BYTE PTR [eax],al
     eee:	05 02 f0 0e 00       	add    eax,0xef002
     ef3:	30 03                	xor    BYTE PTR [ebx],al
     ef5:	3b 01                	cmp    eax,DWORD PTR [ecx]
     ef7:	08 2f                	or     BYTE PTR [edi],ch
     ef9:	40                   	inc    eax
     efa:	00 02                	add    BYTE PTR [edx],al
     efc:	04 01                	add    al,0x1
     efe:	7a 00                	jp     f00 <sysEnter_Vector-0x12f100>
     f00:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     f03:	ad                   	lods   eax,DWORD PTR ds:[esi]
     f04:	59                   	pop    ecx
     f05:	59                   	pop    ecx
     f06:	75 c9                	jne    ed1 <sysEnter_Vector-0x12f12f>
     f08:	59                   	pop    ecx
     f09:	ad                   	lods   eax,DWORD PTR ds:[esi]
     f0a:	00 02                	add    BYTE PTR [edx],al
     f0c:	04 02                	add    al,0x2
     f0e:	06                   	push   es
     f0f:	66                   	data16
     f10:	00 02                	add    BYTE PTR [edx],al
     f12:	04 03                	add    al,0x3
     f14:	66 06                	pushw  es
     f16:	59                   	pop    ecx
     f17:	00 02                	add    BYTE PTR [edx],al
     f19:	04 01                	add    al,0x1
     f1b:	06                   	push   es
     f1c:	74 06                	je     f24 <sysEnter_Vector-0x12f0dc>
     f1e:	75 91                	jne    eb1 <sysEnter_Vector-0x12f14f>
     f20:	3d 76 67 00 02       	cmp    eax,0x2006776
     f25:	04 01                	add    al,0x1
     f27:	06                   	push   es
     f28:	58                   	pop    eax
     f29:	00 02                	add    BYTE PTR [edx],al
     f2b:	04 02                	add    al,0x2
     f2d:	74 00                	je     f2f <sysEnter_Vector-0x12f0d1>
     f2f:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
     f32:	58                   	pop    eax
     f33:	06                   	push   es
     f34:	3d 08 21 08 2f       	cmp    eax,0x2f082108
     f39:	9f                   	lahf   
     f3a:	83 59 c9 00          	sbb    DWORD PTR [ecx-0x37],0x0
     f3e:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     f41:	06                   	push   es
     f42:	58                   	pop    eax
     f43:	00 02                	add    BYTE PTR [edx],al
     f45:	04 03                	add    al,0x3
     f47:	58                   	pop    eax
     f48:	00 02                	add    BYTE PTR [edx],al
     f4a:	04 04                	add    al,0x4
     f4c:	74 00                	je     f4e <sysEnter_Vector-0x12f0b2>
     f4e:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
     f51:	58                   	pop    eax
     f52:	06                   	push   es
     f53:	31 5a 00             	xor    DWORD PTR [edx+0x0],ebx
     f56:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     f59:	06                   	push   es
     f5a:	66                   	data16
     f5b:	00 02                	add    BYTE PTR [edx],al
     f5d:	04 02                	add    al,0x2
     f5f:	58                   	pop    eax
     f60:	00 02                	add    BYTE PTR [edx],al
     f62:	04 03                	add    al,0x3
     f64:	58                   	pop    eax
     f65:	06                   	push   es
     f66:	67 76 59             	addr16 jbe fc2 <sysEnter_Vector-0x12f03e>
     f69:	67 03 72 4a          	add    esi,DWORD PTR [bp+si+0x4a]
     f6d:	03 10                	add    edx,DWORD PTR [eax]
     f6f:	ac                   	lods   al,BYTE PTR ds:[esi]
     f70:	03 76 2e             	add    esi,DWORD PTR [esi+0x2e]
     f73:	3e 03 09             	add    ecx,DWORD PTR ds:[ecx]
     f76:	20 67 75             	and    BYTE PTR [edi+0x75],ah
     f79:	67 2f                	addr16 das 
     f7b:	67 00 02             	add    BYTE PTR [bp+si],al
     f7e:	04 01                	add    al,0x1
     f80:	06                   	push   es
     f81:	66                   	data16
     f82:	00 02                	add    BYTE PTR [edx],al
     f84:	04 02                	add    al,0x2
     f86:	58                   	pop    eax
     f87:	00 02                	add    BYTE PTR [edx],al
     f89:	04 04                	add    al,0x4
     f8b:	3c 06                	cmp    al,0x6
     f8d:	59                   	pop    ecx
     f8e:	2f                   	das    
     f8f:	02 08                	add    cl,BYTE PTR [eax]
     f91:	00 01                	add    BYTE PTR [ecx],al
     f93:	01 43 00             	add    DWORD PTR [ebx+0x0],eax
     f96:	00 00                	add    BYTE PTR [eax],al
     f98:	02 00                	add    al,BYTE PTR [eax]
     f9a:	2d 00 00 00 01       	sub    eax,0x1000000
     f9f:	01 fb                	add    ebx,edi
     fa1:	0e                   	push   cs
     fa2:	0d 00 01 01 01       	or     eax,0x1010100
     fa7:	01 00                	add    DWORD PTR [eax],eax
     fa9:	00 00                	add    BYTE PTR [eax],al
     fab:	01 00                	add    DWORD PTR [eax],eax
     fad:	00 01                	add    BYTE PTR [ecx],al
     faf:	73 72                	jae    1023 <sysEnter_Vector-0x12efdd>
     fb1:	63 2f                	arpl   WORD PTR [edi],bp
     fb3:	73 74                	jae    1029 <sysEnter_Vector-0x12efd7>
     fb5:	72 69                	jb     1020 <sysEnter_Vector-0x12efe0>
     fb7:	6e                   	outs   dx,BYTE PTR ds:[esi]
     fb8:	67 73 00             	addr16 jae fbb <sysEnter_Vector-0x12f045>
     fbb:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     fbe:	72 70                	jb     1030 <sysEnter_Vector-0x12efd0>
     fc0:	61                   	popa   
     fc1:	72 74                	jb     1037 <sysEnter_Vector-0x12efc9>
     fc3:	73 2e                	jae    ff3 <sysEnter_Vector-0x12f00d>
     fc5:	63 00                	arpl   WORD PTR [eax],ax
     fc7:	01 00                	add    DWORD PTR [eax],eax
     fc9:	00 00                	add    BYTE PTR [eax],al
     fcb:	00 05 02 70 10 00    	add    BYTE PTR ds:0x107002,al
     fd1:	30 13                	xor    BYTE PTR [ebx],dl
     fd3:	c9                   	leave  
     fd4:	ad                   	lods   eax,DWORD PTR ds:[esi]
     fd5:	3d 02 02 00 01       	cmp    eax,0x1000202
     fda:	01 7f 01             	add    DWORD PTR [edi+0x1],edi
     fdd:	00 00                	add    BYTE PTR [eax],al
     fdf:	02 00                	add    al,BYTE PTR [eax]
     fe1:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     fe2:	00 00                	add    BYTE PTR [eax],al
     fe4:	00 01                	add    BYTE PTR [ecx],al
     fe6:	01 fb                	add    ebx,edi
     fe8:	0e                   	push   cs
     fe9:	0d 00 01 01 01       	or     eax,0x1010100
     fee:	01 00                	add    DWORD PTR [eax],eax
     ff0:	00 00                	add    BYTE PTR [eax],al
     ff2:	01 00                	add    DWORD PTR [eax],eax
     ff4:	00 01                	add    BYTE PTR [ecx],al
     ff6:	73 72                	jae    106a <sysEnter_Vector-0x12ef96>
     ff8:	63 2f                	arpl   WORD PTR [edi],bp
     ffa:	73 74                	jae    1070 <sysEnter_Vector-0x12ef90>
     ffc:	72 69                	jb     1067 <sysEnter_Vector-0x12ef99>
     ffe:	6e                   	outs   dx,BYTE PTR ds:[esi]
     fff:	67 73 00             	addr16 jae 1002 <sysEnter_Vector-0x12effe>
    1002:	2f                   	das    
    1003:	68 6f 6d 65 2f       	push   0x2f656d6f
    1008:	79 6f                	jns    1079 <sysEnter_Vector-0x12ef87>
    100a:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    1011:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    1014:	73 73                	jae    1089 <sysEnter_Vector-0x12ef77>
    1016:	2f                   	das    
    1017:	6c                   	ins    BYTE PTR es:[edi],dx
    1018:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    101f:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    1025:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    102b:	78 2d                	js     105a <sysEnter_Vector-0x12efa6>
    102d:	67 6e                	outs   dx,BYTE PTR ds:[si]
    102f:	75 2f                	jne    1060 <sysEnter_Vector-0x12efa0>
    1031:	35 2e 33 2e 30       	xor    eax,0x302e332e
    1036:	2f                   	das    
    1037:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    103e:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    1041:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    1045:	65 00 00             	add    BYTE PTR gs:[eax],al
    1048:	73 74                	jae    10be <sysEnter_Vector-0x12ef42>
    104a:	72 74                	jb     10c0 <sysEnter_Vector-0x12ef40>
    104c:	6f                   	outs   dx,DWORD PTR ds:[esi]
    104d:	6c                   	ins    BYTE PTR es:[edi],dx
    104e:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
    1051:	01 00                	add    DWORD PTR [eax],eax
    1053:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    1056:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    105d:	63 
    105e:	2e                   	cs
    105f:	68 00 02 00 00       	push   0x200
    1064:	74 69                	je     10cf <sysEnter_Vector-0x12ef31>
    1066:	6d                   	ins    DWORD PTR es:[edi],dx
    1067:	65                   	gs
    1068:	2e                   	cs
    1069:	68 00 03 00 00       	push   0x300
    106e:	6d                   	ins    DWORD PTR es:[edi],dx
    106f:	61                   	popa   
    1070:	6c                   	ins    BYTE PTR es:[edi],dx
    1071:	6c                   	ins    BYTE PTR es:[edi],dx
    1072:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1073:	63 2e                	arpl   WORD PTR [esi],bp
    1075:	68 00 03 00 00       	push   0x300
    107a:	6c                   	ins    BYTE PTR es:[edi],dx
    107b:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    1082:	4f                   	dec    edi
    1083:	53                   	push   ebx
    1084:	2e                   	cs
    1085:	68 00 03 00 00       	push   0x300
    108a:	00 00                	add    BYTE PTR [eax],al
    108c:	05 02 90 10 00       	add    eax,0x109002
    1091:	30 03                	xor    BYTE PTR [ebx],al
    1093:	d7                   	xlat   BYTE PTR ds:[ebx]
    1094:	00 01                	add    BYTE PTR [ecx],al
    1096:	08 2f                	or     BYTE PTR [edi],ch
    1098:	40                   	inc    eax
    1099:	00 02                	add    BYTE PTR [edx],al
    109b:	04 01                	add    al,0x1
    109d:	7c 00                	jl     109f <sysEnter_Vector-0x12ef61>
    109f:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    10a2:	ad                   	lods   eax,DWORD PTR ds:[esi]
    10a3:	59                   	pop    ecx
    10a4:	59                   	pop    ecx
    10a5:	75 c9                	jne    1070 <sysEnter_Vector-0x12ef90>
    10a7:	59                   	pop    ecx
    10a8:	ad                   	lods   eax,DWORD PTR ds:[esi]
    10a9:	00 02                	add    BYTE PTR [edx],al
    10ab:	04 02                	add    al,0x2
    10ad:	06                   	push   es
    10ae:	66                   	data16
    10af:	00 02                	add    BYTE PTR [edx],al
    10b1:	04 03                	add    al,0x3
    10b3:	66 06                	pushw  es
    10b5:	59                   	pop    ecx
    10b6:	00 02                	add    BYTE PTR [edx],al
    10b8:	04 01                	add    al,0x1
    10ba:	06                   	push   es
    10bb:	74 06                	je     10c3 <sysEnter_Vector-0x12ef3d>
    10bd:	75 91                	jne    1050 <sysEnter_Vector-0x12efb0>
    10bf:	3d 76 67 00 02       	cmp    eax,0x2006776
    10c4:	04 01                	add    al,0x1
    10c6:	06                   	push   es
    10c7:	58                   	pop    eax
    10c8:	00 02                	add    BYTE PTR [edx],al
    10ca:	04 02                	add    al,0x2
    10cc:	74 00                	je     10ce <sysEnter_Vector-0x12ef32>
    10ce:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    10d1:	58                   	pop    eax
    10d2:	06                   	push   es
    10d3:	03 13                	add    edx,DWORD PTR [ebx]
    10d5:	3c 00                	cmp    al,0x0
    10d7:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    10da:	06                   	push   es
    10db:	66                   	data16
    10dc:	00 02                	add    BYTE PTR [edx],al
    10de:	04 02                	add    al,0x2
    10e0:	74 00                	je     10e2 <sysEnter_Vector-0x12ef1e>
    10e2:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    10e5:	06                   	push   es
    10e6:	59                   	pop    ecx
    10e7:	00 02                	add    BYTE PTR [edx],al
    10e9:	04 04                	add    al,0x4
    10eb:	08 3d 00 02 04 04    	or     BYTE PTR ds:0x4040200,bh
    10f1:	f3 9f                	repz lahf 
    10f3:	83 59 c9 00          	sbb    DWORD PTR [ecx-0x37],0x0
    10f7:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    10fa:	06                   	push   es
    10fb:	58                   	pop    eax
    10fc:	00 02                	add    BYTE PTR [edx],al
    10fe:	04 03                	add    al,0x3
    1100:	58                   	pop    eax
    1101:	00 02                	add    BYTE PTR [edx],al
    1103:	04 04                	add    al,0x4
    1105:	74 00                	je     1107 <sysEnter_Vector-0x12eef9>
    1107:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    110a:	58                   	pop    eax
    110b:	06                   	push   es
    110c:	31 5a 00             	xor    DWORD PTR [edx+0x0],ebx
    110f:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1112:	06                   	push   es
    1113:	66                   	data16
    1114:	00 02                	add    BYTE PTR [edx],al
    1116:	04 02                	add    al,0x2
    1118:	58                   	pop    eax
    1119:	00 02                	add    BYTE PTR [edx],al
    111b:	04 03                	add    al,0x3
    111d:	58                   	pop    eax
    111e:	06                   	push   es
    111f:	59                   	pop    ecx
    1120:	76 59                	jbe    117b <sysEnter_Vector-0x12ee85>
    1122:	67 03 72 4a          	add    esi,DWORD PTR [bp+si+0x4a]
    1126:	03 10                	add    edx,DWORD PTR [eax]
    1128:	ac                   	lods   al,BYTE PTR ds:[esi]
    1129:	03 76 2e             	add    esi,DWORD PTR [esi+0x2e]
    112c:	3e 03 09             	add    ecx,DWORD PTR ds:[ecx]
    112f:	20 67 00             	and    BYTE PTR [edi+0x0],ah
    1132:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1135:	06                   	push   es
    1136:	66                   	data16
    1137:	00 02                	add    BYTE PTR [edx],al
    1139:	04 02                	add    al,0x2
    113b:	74 00                	je     113d <sysEnter_Vector-0x12eec3>
    113d:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1140:	58                   	pop    eax
    1141:	06                   	push   es
    1142:	4b                   	dec    ebx
    1143:	67 2f                	addr16 das 
    1145:	67 00 02             	add    BYTE PTR [bp+si],al
    1148:	04 01                	add    al,0x1
    114a:	06                   	push   es
    114b:	66                   	data16
    114c:	00 02                	add    BYTE PTR [edx],al
    114e:	04 02                	add    al,0x2
    1150:	58                   	pop    eax
    1151:	00 02                	add    BYTE PTR [edx],al
    1153:	04 04                	add    al,0x4
    1155:	3c 06                	cmp    al,0x6
    1157:	59                   	pop    ecx
    1158:	2f                   	das    
    1159:	02 08                	add    cl,BYTE PTR [eax]
    115b:	00 01                	add    BYTE PTR [ecx],al
    115d:	01 08                	add    DWORD PTR [eax],ecx
    115f:	01 00                	add    DWORD PTR [eax],eax
    1161:	00 02                	add    BYTE PTR [edx],al
    1163:	00 a7 00 00 00 01    	add    BYTE PTR [edi+0x1000000],ah
    1169:	01 fb                	add    ebx,edi
    116b:	0e                   	push   cs
    116c:	0d 00 01 01 01       	or     eax,0x1010100
    1171:	01 00                	add    DWORD PTR [eax],eax
    1173:	00 00                	add    BYTE PTR [eax],al
    1175:	01 00                	add    DWORD PTR [eax],eax
    1177:	00 01                	add    BYTE PTR [ecx],al
    1179:	73 72                	jae    11ed <sysEnter_Vector-0x12ee13>
    117b:	63 2f                	arpl   WORD PTR [edi],bp
    117d:	73 74                	jae    11f3 <sysEnter_Vector-0x12ee0d>
    117f:	72 69                	jb     11ea <sysEnter_Vector-0x12ee16>
    1181:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1182:	67 73 00             	addr16 jae 1185 <sysEnter_Vector-0x12ee7b>
    1185:	2f                   	das    
    1186:	68 6f 6d 65 2f       	push   0x2f656d6f
    118b:	79 6f                	jns    11fc <sysEnter_Vector-0x12ee04>
    118d:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    1194:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    1197:	73 73                	jae    120c <sysEnter_Vector-0x12edf4>
    1199:	2f                   	das    
    119a:	6c                   	ins    BYTE PTR es:[edi],dx
    119b:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    11a2:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    11a8:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    11ae:	78 2d                	js     11dd <sysEnter_Vector-0x12ee23>
    11b0:	67 6e                	outs   dx,BYTE PTR ds:[si]
    11b2:	75 2f                	jne    11e3 <sysEnter_Vector-0x12ee1d>
    11b4:	35 2e 33 2e 30       	xor    eax,0x302e332e
    11b9:	2f                   	das    
    11ba:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    11c1:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    11c4:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    11c8:	65 00 00             	add    BYTE PTR gs:[eax],al
    11cb:	73 74                	jae    1241 <sysEnter_Vector-0x12edbf>
    11cd:	72 74                	jb     1243 <sysEnter_Vector-0x12edbd>
    11cf:	72 69                	jb     123a <sysEnter_Vector-0x12edc6>
    11d1:	6d                   	ins    DWORD PTR es:[edi],dx
    11d2:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
    11d5:	01 00                	add    DWORD PTR [eax],eax
    11d7:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    11da:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    11e1:	63 
    11e2:	2e                   	cs
    11e3:	68 00 02 00 00       	push   0x200
    11e8:	74 69                	je     1253 <sysEnter_Vector-0x12edad>
    11ea:	6d                   	ins    DWORD PTR es:[edi],dx
    11eb:	65                   	gs
    11ec:	2e                   	cs
    11ed:	68 00 03 00 00       	push   0x300
    11f2:	6d                   	ins    DWORD PTR es:[edi],dx
    11f3:	61                   	popa   
    11f4:	6c                   	ins    BYTE PTR es:[edi],dx
    11f5:	6c                   	ins    BYTE PTR es:[edi],dx
    11f6:	6f                   	outs   dx,DWORD PTR ds:[esi]
    11f7:	63 2e                	arpl   WORD PTR [esi],bp
    11f9:	68 00 03 00 00       	push   0x300
    11fe:	6c                   	ins    BYTE PTR es:[edi],dx
    11ff:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    1206:	4f                   	dec    edi
    1207:	53                   	push   ebx
    1208:	2e                   	cs
    1209:	68 00 03 00 00       	push   0x300
    120e:	00 00                	add    BYTE PTR [eax],al
    1210:	05 02 2c 12 00       	add    eax,0x122c02
    1215:	30 16                	xor    BYTE PTR [esi],dl
    1217:	08 21                	or     BYTE PTR [ecx],ah
    1219:	85 08                	test   DWORD PTR [eax],ecx
    121b:	3d 00 02 04 02       	cmp    eax,0x2040200
    1220:	06                   	push   es
    1221:	2e 00 02             	add    BYTE PTR cs:[edx],al
    1224:	04 01                	add    al,0x1
    1226:	9e                   	sahf   
    1227:	06                   	push   es
    1228:	08 21                	or     BYTE PTR [ecx],ah
    122a:	f4                   	hlt    
    122b:	93                   	xchg   ebx,eax
    122c:	08 67 00             	or     BYTE PTR [edi+0x0],ah
    122f:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
    1232:	06                   	push   es
    1233:	2e 00 02             	add    BYTE PTR cs:[edx],al
    1236:	04 01                	add    al,0x1
    1238:	9e                   	sahf   
    1239:	06                   	push   es
    123a:	08 21                	or     BYTE PTR [ecx],ah
    123c:	08 15 59 5b 08 21    	or     BYTE PTR ds:0x21085b59,dl
    1242:	85 08                	test   DWORD PTR [eax],ecx
    1244:	13 00                	adc    eax,DWORD PTR [eax]
    1246:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
    1249:	06                   	push   es
    124a:	2e 00 02             	add    BYTE PTR cs:[edx],al
    124d:	04 01                	add    al,0x1
    124f:	9e                   	sahf   
    1250:	06                   	push   es
    1251:	f3 76 93             	repz jbe 11e7 <sysEnter_Vector-0x12ee19>
    1254:	08 3d 00 02 04 02    	or     BYTE PTR ds:0x2040200,bh
    125a:	06                   	push   es
    125b:	2e 00 02             	add    BYTE PTR cs:[edx],al
    125e:	04 01                	add    al,0x1
    1260:	9e                   	sahf   
    1261:	06                   	push   es
    1262:	f3 e7 3d             	repz out 0x3d,eax
    1265:	02 05 00 01 01 27    	add    al,BYTE PTR ds:0x27010100
    126b:	03 00                	add    eax,DWORD PTR [eax]
    126d:	00 02                	add    BYTE PTR [edx],al
    126f:	00 cc                	add    ah,cl
    1271:	00 00                	add    BYTE PTR [eax],al
    1273:	00 01                	add    BYTE PTR [ecx],al
    1275:	01 fb                	add    ebx,edi
    1277:	0e                   	push   cs
    1278:	0d 00 01 01 01       	or     eax,0x1010100
    127d:	01 00                	add    DWORD PTR [eax],eax
    127f:	00 00                	add    BYTE PTR [eax],al
    1281:	01 00                	add    DWORD PTR [eax],eax
    1283:	00 01                	add    BYTE PTR [ecx],al
    1285:	73 72                	jae    12f9 <sysEnter_Vector-0x12ed07>
    1287:	63 00                	arpl   WORD PTR [eax],ax
    1289:	2f                   	das    
    128a:	68 6f 6d 65 2f       	push   0x2f656d6f
    128f:	79 6f                	jns    1300 <sysEnter_Vector-0x12ed00>
    1291:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    1298:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    129b:	73 73                	jae    1310 <sysEnter_Vector-0x12ecf0>
    129d:	2f                   	das    
    129e:	6c                   	ins    BYTE PTR es:[edi],dx
    129f:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    12a6:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    12ac:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    12b2:	78 2d                	js     12e1 <sysEnter_Vector-0x12ed1f>
    12b4:	67 6e                	outs   dx,BYTE PTR ds:[si]
    12b6:	75 2f                	jne    12e7 <sysEnter_Vector-0x12ed19>
    12b8:	35 2e 33 2e 30       	xor    eax,0x302e332e
    12bd:	2f                   	das    
    12be:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    12c5:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    12c8:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    12cc:	65 00 2e             	add    BYTE PTR gs:[esi],ch
    12cf:	2e                   	cs
    12d0:	2f                   	das    
    12d1:	2e                   	cs
    12d2:	2e                   	cs
    12d3:	2f                   	das    
    12d4:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
    12d8:	6a 2f                	push   0x2f
    12da:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
    12dd:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
    12e4:	6e                   	outs   dx,BYTE PTR ds:[esi]
    12e5:	65                   	gs
    12e6:	6c                   	ins    BYTE PTR es:[edi],dx
    12e7:	2f                   	das    
    12e8:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    12ef:	00 00                	add    BYTE PTR [eax],al
    12f1:	74 69                	je     135c <sysEnter_Vector-0x12eca4>
    12f3:	6d                   	ins    DWORD PTR es:[edi],dx
    12f4:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax
    12f8:	01 00                	add    DWORD PTR [eax],eax
    12fa:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    12fd:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    1304:	63 
    1305:	2e                   	cs
    1306:	68 00 02 00 00       	push   0x200
    130b:	74 69                	je     1376 <sysEnter_Vector-0x12ec8a>
    130d:	6d                   	ins    DWORD PTR es:[edi],dx
    130e:	65                   	gs
    130f:	2e                   	cs
    1310:	68 00 03 00 00       	push   0x300
    1315:	6d                   	ins    DWORD PTR es:[edi],dx
    1316:	61                   	popa   
    1317:	6c                   	ins    BYTE PTR es:[edi],dx
    1318:	6c                   	ins    BYTE PTR es:[edi],dx
    1319:	6f                   	outs   dx,DWORD PTR ds:[esi]
    131a:	63 2e                	arpl   WORD PTR [esi],bp
    131c:	68 00 03 00 00       	push   0x300
    1321:	6c                   	ins    BYTE PTR es:[edi],dx
    1322:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    1329:	4f                   	dec    edi
    132a:	53                   	push   ebx
    132b:	2e                   	cs
    132c:	68 00 03 00 00       	push   0x300
    1331:	73 79                	jae    13ac <sysEnter_Vector-0x12ec54>
    1333:	73 63                	jae    1398 <sysEnter_Vector-0x12ec68>
    1335:	61                   	popa   
    1336:	6c                   	ins    BYTE PTR es:[edi],dx
    1337:	6c                   	ins    BYTE PTR es:[edi],dx
    1338:	73 2e                	jae    1368 <sysEnter_Vector-0x12ec98>
    133a:	68 00 04 00 00       	push   0x400
    133f:	00 00                	add    BYTE PTR [eax],al
    1341:	05 02 80 13 00       	add    eax,0x138002
    1346:	30 03                	xor    BYTE PTR [ebx],al
    1348:	2e                   	cs
    1349:	01 f3                	add    ebx,esi
    134b:	75 c9                	jne    1316 <sysEnter_Vector-0x12ecea>
    134d:	3d 31 08 21 84       	cmp    eax,0x84210831
    1352:	76 02                	jbe    1356 <sysEnter_Vector-0x12ecaa>
    1354:	24 13                	and    al,0x13
    1356:	08 22                	or     BYTE PTR [edx],ah
    1358:	02 2e                	add    ch,BYTE PTR [esi]
    135a:	13 02                	adc    eax,DWORD PTR [edx]
    135c:	2f                   	das    
    135d:	13 08                	adc    ecx,DWORD PTR [eax]
    135f:	67 02 2d             	add    ch,BYTE PTR [di]
    1362:	13 2f                	adc    ebp,DWORD PTR [edi]
    1364:	00 02                	add    BYTE PTR [edx],al
    1366:	04 01                	add    al,0x1
    1368:	06                   	push   es
    1369:	9e                   	sahf   
    136a:	00 02                	add    BYTE PTR [edx],al
    136c:	04 04                	add    al,0x4
    136e:	02 23                	add    ah,BYTE PTR [ebx]
    1370:	12 00                	adc    al,BYTE PTR [eax]
    1372:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    1379:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    137c:	74 00                	je     137e <sysEnter_Vector-0x12ec82>
    137e:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1381:	58                   	pop    eax
    1382:	00 02                	add    BYTE PTR [edx],al
    1384:	04 08                	add    al,0x8
    1386:	06                   	push   es
    1387:	3d 48 00 02 04       	cmp    eax,0x4020048
    138c:	01 06                	add    DWORD PTR [esi],eax
    138e:	9e                   	sahf   
    138f:	00 02                	add    BYTE PTR [edx],al
    1391:	04 04                	add    al,0x4
    1393:	02 23                	add    ah,BYTE PTR [ebx]
    1395:	12 00                	adc    al,BYTE PTR [eax]
    1397:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    139e:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    13a1:	74 00                	je     13a3 <sysEnter_Vector-0x12ec5d>
    13a3:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    13a6:	58                   	pop    eax
    13a7:	06                   	push   es
    13a8:	94                   	xchg   esp,eax
    13a9:	e5 91                	in     eax,0x91
    13ab:	9f                   	lahf   
    13ac:	59                   	pop    ecx
    13ad:	00 02                	add    BYTE PTR [edx],al
    13af:	04 01                	add    al,0x1
    13b1:	06                   	push   es
    13b2:	9e                   	sahf   
    13b3:	00 02                	add    BYTE PTR [edx],al
    13b5:	04 04                	add    al,0x4
    13b7:	02 23                	add    ah,BYTE PTR [ebx]
    13b9:	12 00                	adc    al,BYTE PTR [eax]
    13bb:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    13c2:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    13c5:	74 00                	je     13c7 <sysEnter_Vector-0x12ec39>
    13c7:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    13ca:	58                   	pop    eax
    13cb:	00 02                	add    BYTE PTR [edx],al
    13cd:	04 08                	add    al,0x8
    13cf:	06                   	push   es
    13d0:	08 9f e2 00 02 04    	or     BYTE PTR [edi+0x40200e2],bl
    13d6:	01 06                	add    DWORD PTR [esi],eax
    13d8:	9e                   	sahf   
    13d9:	00 02                	add    BYTE PTR [edx],al
    13db:	04 04                	add    al,0x4
    13dd:	02 23                	add    ah,BYTE PTR [ebx]
    13df:	12 00                	adc    al,BYTE PTR [eax]
    13e1:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    13e8:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    13eb:	74 00                	je     13ed <sysEnter_Vector-0x12ec13>
    13ed:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    13f0:	58                   	pop    eax
    13f1:	06                   	push   es
    13f2:	08 f6                	or     dh,dh
    13f4:	d7                   	xlat   BYTE PTR ds:[ebx]
    13f5:	9f                   	lahf   
    13f6:	3d 68 08 16 08       	cmp    eax,0x8160868
    13fb:	3d 08 4b 5a 08       	cmp    eax,0x85a4b08
    1400:	15 08 3d 08 3d       	adc    eax,0x3d083d08
    1405:	5a                   	pop    edx
    1406:	08 44 02 2e          	or     BYTE PTR [edx+eax*1+0x2e],al
    140a:	13 02                	adc    eax,DWORD PTR [edx]
    140c:	3a 13                	cmp    dl,BYTE PTR [ebx]
    140e:	91                   	xchg   ecx,eax
    140f:	c9                   	leave  
    1410:	e6 02                	out    0x2,al
    1412:	2f                   	das    
    1413:	13 02                	adc    eax,DWORD PTR [edx]
    1415:	3c 13                	cmp    al,0x13
    1417:	9f                   	lahf   
    1418:	e5 e6                	in     eax,0xe6
    141a:	08 c9                	or     cl,cl
    141c:	02 2c 13             	add    ch,BYTE PTR [ebx+edx*1]
    141f:	9f                   	lahf   
    1420:	e5 4c                	in     eax,0x4c
    1422:	02 29                	add    ch,BYTE PTR [ecx]
    1424:	13 02                	adc    eax,DWORD PTR [edx]
    1426:	2b 13                	sub    edx,DWORD PTR [ebx]
    1428:	9f                   	lahf   
    1429:	e5 e6                	in     eax,0xe6
    142b:	bb 59 08 83 e5       	mov    ebx,0xe5830859
    1430:	a0 00 02 04 01       	mov    al,ds:0x1040200
    1435:	06                   	push   es
    1436:	c8 00 02 04          	enter  0x200,0x4
    143a:	04 02                	add    al,0x2
    143c:	2c 12                	sub    al,0x12
    143e:	00 02                	add    BYTE PTR [edx],al
    1440:	04 05                	add    al,0x5
    1442:	02 2f                	add    ch,BYTE PTR [edi]
    1444:	12 00                	adc    al,BYTE PTR [eax]
    1446:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1449:	74 00                	je     144b <sysEnter_Vector-0x12ebb5>
    144b:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    144e:	58                   	pop    eax
    144f:	06                   	push   es
    1450:	08 99 a5 59 00 02    	or     BYTE PTR [ecx+0x20059a5],bl
    1456:	04 01                	add    al,0x1
    1458:	06                   	push   es
    1459:	c8 00 02 04          	enter  0x200,0x4
    145d:	04 02                	add    al,0x2
    145f:	2c 12                	sub    al,0x12
    1461:	00 02                	add    BYTE PTR [edx],al
    1463:	04 05                	add    al,0x5
    1465:	02 2f                	add    ch,BYTE PTR [edi]
    1467:	12 00                	adc    al,BYTE PTR [eax]
    1469:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    146c:	74 00                	je     146e <sysEnter_Vector-0x12eb92>
    146e:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1471:	58                   	pop    eax
    1472:	00 02                	add    BYTE PTR [edx],al
    1474:	04 08                	add    al,0x8
    1476:	06                   	push   es
    1477:	08 9f 08 91 9f e0    	or     BYTE PTR [edi-0x1f606ef8],bl
    147d:	00 02                	add    BYTE PTR [edx],al
    147f:	04 01                	add    al,0x1
    1481:	06                   	push   es
    1482:	c8 00 02 04          	enter  0x200,0x4
    1486:	04 02                	add    al,0x2
    1488:	2c 12                	sub    al,0x12
    148a:	00 02                	add    BYTE PTR [edx],al
    148c:	04 05                	add    al,0x5
    148e:	02 2f                	add    ch,BYTE PTR [edi]
    1490:	12 00                	adc    al,BYTE PTR [eax]
    1492:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1495:	74 00                	je     1497 <sysEnter_Vector-0x12eb69>
    1497:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    149a:	58                   	pop    eax
    149b:	06                   	push   es
    149c:	08 f9                	or     cl,bh
    149e:	bb 75 00 02 04       	mov    ebx,0x4020075
    14a3:	01 06                	add    DWORD PTR [esi],eax
    14a5:	08 2e                	or     BYTE PTR [esi],ch
    14a7:	06                   	push   es
    14a8:	9f                   	lahf   
    14a9:	75 75                	jne    1520 <sysEnter_Vector-0x12eae0>
    14ab:	7b d8                	jnp    1485 <sysEnter_Vector-0x12eb7b>
    14ad:	00 02                	add    BYTE PTR [edx],al
    14af:	04 01                	add    al,0x1
    14b1:	06                   	push   es
    14b2:	c8 06 75 e5          	enter  0x7506,0xe5
    14b6:	00 02                	add    BYTE PTR [edx],al
    14b8:	04 01                	add    al,0x1
    14ba:	06                   	push   es
    14bb:	02 22                	add    ah,BYTE PTR [edx]
    14bd:	12 06                	adc    al,BYTE PTR [esi]
    14bf:	4b                   	dec    ebx
    14c0:	00 02                	add    BYTE PTR [edx],al
    14c2:	04 01                	add    al,0x1
    14c4:	06                   	push   es
    14c5:	08 ba 00 02 04 03    	or     BYTE PTR [edx+0x3040200],bh
    14cb:	02 22                	add    ah,BYTE PTR [edx]
    14cd:	12 00                	adc    al,BYTE PTR [eax]
    14cf:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    14d2:	74 00                	je     14d4 <sysEnter_Vector-0x12eb2c>
    14d4:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    14d7:	58                   	pop    eax
    14d8:	00 02                	add    BYTE PTR [edx],al
    14da:	04 06                	add    al,0x6
    14dc:	06                   	push   es
    14dd:	59                   	pop    ecx
    14de:	00 02                	add    BYTE PTR [edx],al
    14e0:	04 01                	add    al,0x1
    14e2:	06                   	push   es
    14e3:	02 40 12             	add    al,BYTE PTR [eax+0x12]
    14e6:	00 02                	add    BYTE PTR [edx],al
    14e8:	04 03                	add    al,0x3
    14ea:	02 42 12             	add    al,BYTE PTR [edx+0x12]
    14ed:	00 02                	add    BYTE PTR [edx],al
    14ef:	04 04                	add    al,0x4
    14f1:	74 00                	je     14f3 <sysEnter_Vector-0x12eb0d>
    14f3:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    14f6:	58                   	pop    eax
    14f7:	00 02                	add    BYTE PTR [edx],al
    14f9:	04 06                	add    al,0x6
    14fb:	06                   	push   es
    14fc:	59                   	pop    ecx
    14fd:	00 02                	add    BYTE PTR [edx],al
    14ff:	04 01                	add    al,0x1
    1501:	06                   	push   es
    1502:	02 43 12             	add    al,BYTE PTR [ebx+0x12]
    1505:	00 02                	add    BYTE PTR [edx],al
    1507:	04 03                	add    al,0x3
    1509:	02 48 12             	add    cl,BYTE PTR [eax+0x12]
    150c:	00 02                	add    BYTE PTR [edx],al
    150e:	04 04                	add    al,0x4
    1510:	74 00                	je     1512 <sysEnter_Vector-0x12eaee>
    1512:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1515:	58                   	pop    eax
    1516:	00 02                	add    BYTE PTR [edx],al
    1518:	04 06                	add    al,0x6
    151a:	06                   	push   es
    151b:	5a                   	pop    edx
    151c:	00 02                	add    BYTE PTR [edx],al
    151e:	04 06                	add    al,0x6
    1520:	c9                   	leave  
    1521:	2f                   	das    
    1522:	00 02                	add    BYTE PTR [edx],al
    1524:	04 01                	add    al,0x1
    1526:	06                   	push   es
    1527:	9e                   	sahf   
    1528:	00 02                	add    BYTE PTR [edx],al
    152a:	04 04                	add    al,0x4
    152c:	02 23                	add    ah,BYTE PTR [ebx]
    152e:	12 00                	adc    al,BYTE PTR [eax]
    1530:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    1537:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    153a:	74 00                	je     153c <sysEnter_Vector-0x12eac4>
    153c:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    153f:	58                   	pop    eax
    1540:	00 02                	add    BYTE PTR [edx],al
    1542:	04 08                	add    al,0x8
    1544:	06                   	push   es
    1545:	08 75 48             	or     BYTE PTR [ebp+0x48],dh
    1548:	e8 bb 00 02 04       	call   4021608 <sysEnter_Vector+0x3ef1608>
    154d:	01 06                	add    DWORD PTR [esi],eax
    154f:	ba 06 4b 68 91       	mov    edx,0x91684b06
    1554:	02 31                	add    dh,BYTE PTR [ecx]
    1556:	14 02                	adc    al,0x2
    1558:	2c 14                	sub    al,0x14
    155a:	00 02                	add    BYTE PTR [edx],al
    155c:	04 01                	add    al,0x1
    155e:	06                   	push   es
    155f:	02 29                	add    ch,BYTE PTR [ecx]
    1561:	12 06                	adc    al,BYTE PTR [esi]
    1563:	4b                   	dec    ebx
    1564:	bd 00 02 04 01       	mov    ebp,0x1040200
    1569:	06                   	push   es
    156a:	ba 00 02 04 03       	mov    edx,0x3040200
    156f:	06                   	push   es
    1570:	08 59 00             	or     BYTE PTR [ecx+0x0],bl
    1573:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
    1576:	81 4b e5 4c ae 9f ae 	or     DWORD PTR [ebx-0x1b],0xae9fae4c
    157d:	77 00                	ja     157f <sysEnter_Vector-0x12ea81>
    157f:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1582:	06                   	push   es
    1583:	82                   	(bad)  
    1584:	06                   	push   es
    1585:	4b                   	dec    ebx
    1586:	68 00 02 04 01       	push   0x1040200
    158b:	06                   	push   es
    158c:	66 06                	pushw  es
    158e:	85 3d 02 08 00 01    	test   DWORD PTR ds:0x1000802,edi
    1594:	01                   	.byte 0x1

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
 217:	53                   	push   ebx
 218:	59                   	pop    ecx
 219:	53                   	push   ebx
 21a:	43                   	inc    ebx
 21b:	41                   	inc    ecx
 21c:	4c                   	dec    esp
 21d:	4c                   	dec    esp
 21e:	5f                   	pop    edi
 21f:	47                   	inc    edi
 220:	45                   	inc    ebp
 221:	54                   	push   esp
 222:	43                   	inc    ebx
 223:	57                   	push   edi
 224:	44                   	inc    esp
 225:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 228:	63 2f                	arpl   WORD PTR [edi],bp
 22a:	69 6e 70 75 74 2f 69 	imul   ebp,DWORD PTR [esi+0x70],0x692f7475
 231:	6e                   	outs   dx,BYTE PTR ds:[esi]
 232:	70 75                	jo     2a9 <sysEnter_Vector-0x12fd57>
 234:	74 2e                	je     264 <sysEnter_Vector-0x12fd9c>
 236:	63 00                	arpl   WORD PTR [eax],ax
 238:	65                   	gs
 239:	73 79                	jae    2b4 <sysEnter_Vector-0x12fd4c>
 23b:	73 63                	jae    2a0 <sysEnter_Vector-0x12fd60>
 23d:	61                   	popa   
 23e:	6c                   	ins    BYTE PTR es:[edi],dx
 23f:	6c                   	ins    BYTE PTR es:[edi],dx
 240:	73 00                	jae    242 <sysEnter_Vector-0x12fdbe>
 242:	53                   	push   ebx
 243:	59                   	pop    ecx
 244:	53                   	push   ebx
 245:	43                   	inc    ebx
 246:	41                   	inc    ecx
 247:	4c                   	dec    esp
 248:	4c                   	dec    esp
 249:	5f                   	pop    edi
 24a:	57                   	push   edi
 24b:	41                   	inc    ecx
 24c:	49                   	dec    ecx
 24d:	54                   	push   esp
 24e:	46                   	inc    esi
 24f:	4f                   	dec    edi
 250:	52                   	push   edx
 251:	50                   	push   eax
 252:	49                   	dec    ecx
 253:	44                   	inc    esp
 254:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 257:	53                   	push   ebx
 258:	43                   	inc    ebx
 259:	41                   	inc    ecx
 25a:	4c                   	dec    esp
 25b:	4c                   	dec    esp
 25c:	5f                   	pop    edi
 25d:	53                   	push   ebx
 25e:	45                   	inc    ebp
 25f:	54                   	push   esp
 260:	53                   	push   ebx
 261:	49                   	dec    ecx
 262:	47                   	inc    edi
 263:	41                   	inc    ecx
 264:	43                   	inc    ebx
 265:	54                   	push   esp
 266:	49                   	dec    ecx
 267:	4f                   	dec    edi
 268:	4e                   	dec    esi
 269:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 26c:	63 68 61             	arpl   WORD PTR [eax+0x61],bp
 26f:	72 00                	jb     271 <sysEnter_Vector-0x12fd8f>
 271:	53                   	push   ebx
 272:	59                   	pop    ecx
 273:	53                   	push   ebx
 274:	43                   	inc    ebx
 275:	41                   	inc    ecx
 276:	4c                   	dec    esp
 277:	4c                   	dec    esp
 278:	5f                   	pop    edi
 279:	53                   	push   ebx
 27a:	4c                   	dec    esp
 27b:	45                   	inc    ebp
 27c:	45                   	inc    ebp
 27d:	50                   	push   eax
 27e:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 281:	74 63                	je     2e6 <sysEnter_Vector-0x12fd1a>
 283:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 286:	78 6c                	js     2f4 <sysEnter_Vector-0x12fd0c>
 288:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 28a:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 28d:	53                   	push   ebx
 28e:	43                   	inc    ebx
 28f:	41                   	inc    ecx
 290:	4c                   	dec    esp
 291:	4c                   	dec    esp
 292:	5f                   	pop    edi
 293:	50                   	push   eax
 294:	52                   	push   edx
 295:	49                   	dec    ecx
 296:	4e                   	dec    esi
 297:	54                   	push   esp
 298:	44                   	inc    esp
 299:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 29c:	53                   	push   ebx
 29d:	43                   	inc    ebx
 29e:	41                   	inc    ecx
 29f:	4c                   	dec    esp
 2a0:	4c                   	dec    esp
 2a1:	5f                   	pop    edi
 2a2:	41                   	inc    ecx
 2a3:	4c                   	dec    esp
 2a4:	4c                   	dec    esp
 2a5:	4f                   	dec    edi
 2a6:	43                   	inc    ebx
 2a7:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 2aa:	74 73                	je     31f <sysEnter_Vector-0x12fce1>
 2ac:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2af:	53                   	push   ebx
 2b0:	43                   	inc    ebx
 2b1:	41                   	inc    ecx
 2b2:	4c                   	dec    esp
 2b3:	4c                   	dec    esp
 2b4:	5f                   	pop    edi
 2b5:	52                   	push   edx
 2b6:	45                   	inc    ebp
 2b7:	41                   	inc    ecx
 2b8:	44                   	inc    esp
 2b9:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2bc:	53                   	push   ebx
 2bd:	43                   	inc    ebx
 2be:	41                   	inc    ecx
 2bf:	4c                   	dec    esp
 2c0:	4c                   	dec    esp
 2c1:	5f                   	pop    edi
 2c2:	45                   	inc    ebp
 2c3:	58                   	pop    eax
 2c4:	45                   	inc    ebp
 2c5:	43                   	inc    ebx
 2c6:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2c9:	53                   	push   ebx
 2ca:	43                   	inc    ebx
 2cb:	41                   	inc    ecx
 2cc:	4c                   	dec    esp
 2cd:	4c                   	dec    esp
 2ce:	5f                   	pop    edi
 2cf:	45                   	inc    ebp
 2d0:	4e                   	dec    esi
 2d1:	44                   	inc    esp
 2d2:	50                   	push   eax
 2d3:	52                   	push   edx
 2d4:	4f                   	dec    edi
 2d5:	43                   	inc    ebx
 2d6:	45                   	inc    ebp
 2d7:	53                   	push   ebx
 2d8:	53                   	push   ebx
 2d9:	00 70 75             	add    BYTE PTR [eax+0x75],dh
 2dc:	74 63                	je     341 <sysEnter_Vector-0x12fcbf>
 2de:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2e1:	53                   	push   ebx
 2e2:	43                   	inc    ebx
 2e3:	41                   	inc    ecx
 2e4:	4c                   	dec    esp
 2e5:	4c                   	dec    esp
 2e6:	5f                   	pop    edi
 2e7:	52                   	push   edx
 2e8:	45                   	inc    ebp
 2e9:	47                   	inc    edi
 2ea:	45                   	inc    ebp
 2eb:	58                   	pop    eax
 2ec:	49                   	dec    ecx
 2ed:	54                   	push   esp
 2ee:	48                   	dec    eax
 2ef:	41                   	inc    ecx
 2f0:	4e                   	dec    esi
 2f1:	44                   	inc    esp
 2f2:	4c                   	dec    esp
 2f3:	45                   	inc    ebp
 2f4:	52                   	push   edx
 2f5:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2f8:	53                   	push   ebx
 2f9:	43                   	inc    ebx
 2fa:	41                   	inc    ecx
 2fb:	4c                   	dec    esp
 2fc:	4c                   	dec    esp
 2fd:	5f                   	pop    edi
 2fe:	46                   	inc    esi
 2ff:	52                   	push   edx
 300:	45                   	inc    ebp
 301:	45                   	inc    ebp
 302:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 305:	53                   	push   ebx
 306:	43                   	inc    ebx
 307:	41                   	inc    ecx
 308:	4c                   	dec    esp
 309:	4c                   	dec    esp
 30a:	5f                   	pop    edi
 30b:	53                   	push   ebx
 30c:	54                   	push   esp
 30d:	4f                   	dec    edi
 30e:	50                   	push   eax
 30f:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 312:	53                   	push   ebx
 313:	43                   	inc    ebx
 314:	41                   	inc    ecx
 315:	4c                   	dec    esp
 316:	4c                   	dec    esp
 317:	5f                   	pop    edi
 318:	57                   	push   edi
 319:	52                   	push   edx
 31a:	49                   	dec    ecx
 31b:	54                   	push   esp
 31c:	45                   	inc    ebp
 31d:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 320:	53                   	push   ebx
 321:	43                   	inc    ebx
 322:	41                   	inc    ecx
 323:	4c                   	dec    esp
 324:	4c                   	dec    esp
 325:	5f                   	pop    edi
 326:	49                   	dec    ecx
 327:	4e                   	dec    esi
 328:	56                   	push   esi
 329:	41                   	inc    ecx
 32a:	4c                   	dec    esp
 32b:	49                   	dec    ecx
 32c:	44                   	inc    esp
 32d:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 330:	53                   	push   ebx
 331:	43                   	inc    ebx
 332:	41                   	inc    ecx
 333:	4c                   	dec    esp
 334:	4c                   	dec    esp
 335:	5f                   	pop    edi
 336:	52                   	push   edx
 337:	45                   	inc    ebp
 338:	42                   	inc    edx
 339:	4f                   	dec    edi
 33a:	4f                   	dec    edi
 33b:	54                   	push   esp
 33c:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 33f:	53                   	push   ebx
 340:	43                   	inc    ebx
 341:	41                   	inc    ecx
 342:	4c                   	dec    esp
 343:	4c                   	dec    esp
 344:	5f                   	pop    edi
 345:	53                   	push   ebx
 346:	45                   	inc    ebp
 347:	54                   	push   esp
 348:	50                   	push   eax
 349:	52                   	push   edx
 34a:	49                   	dec    ecx
 34b:	4f                   	dec    edi
 34c:	52                   	push   edx
 34d:	49                   	dec    ecx
 34e:	54                   	push   esp
 34f:	59                   	pop    ecx
 350:	00 6c 62 75          	add    BYTE PTR [edx+eiz*2+0x75],ch
 354:	66                   	data16
 355:	00 70 75             	add    BYTE PTR [eax+0x75],dh
 358:	74 73                	je     3cd <sysEnter_Vector-0x12fc33>
 35a:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 35d:	53                   	push   ebx
 35e:	43                   	inc    ebx
 35f:	41                   	inc    ecx
 360:	4c                   	dec    esp
 361:	4c                   	dec    esp
 362:	5f                   	pop    edi
 363:	50                   	push   eax
 364:	52                   	push   edx
 365:	49                   	dec    ecx
 366:	4e                   	dec    esi
 367:	54                   	push   esp
 368:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 36b:	74 56                	je     3c3 <sysEnter_Vector-0x12fc3d>
 36d:	61                   	popa   
 36e:	6c                   	ins    BYTE PTR es:[edi],dx
 36f:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 373:	68 6f 75 72 00       	push   0x72756f
 378:	73 69                	jae    3e3 <sysEnter_Vector-0x12fc1d>
 37a:	7a 65                	jp     3e1 <sysEnter_Vector-0x12fc1f>
 37c:	5f                   	pop    edi
 37d:	74 00                	je     37f <sysEnter_Vector-0x12fc81>
 37f:	73 6c                	jae    3ed <sysEnter_Vector-0x12fc13>
 381:	65                   	gs
 382:	65                   	gs
 383:	70 00                	jo     385 <sysEnter_Vector-0x12fc7b>
 385:	73 69                	jae    3f0 <sysEnter_Vector-0x12fc10>
 387:	67 44                	addr16 inc esp
 389:	61                   	popa   
 38a:	74 61                	je     3ed <sysEnter_Vector-0x12fc13>
 38c:	00 74 68 65          	add    BYTE PTR [eax+ebp*2+0x65],dh
 390:	54                   	push   esp
 391:	69 6d 65 00 74 6d 5f 	imul   ebp,DWORD PTR [ebp+0x65],0x5f6d7400
 398:	7a 6f                	jp     409 <sysEnter_Vector-0x12fbf7>
 39a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 39b:	65 00 73 69          	add    BYTE PTR gs:[ebx+0x69],dh
 39f:	7a 65                	jp     406 <sysEnter_Vector-0x12fbfa>
 3a1:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3a5:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
 3a8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3a9:	69 74 00 70 72 69 6e 	imul   esi,DWORD PTR [eax+eax*1+0x70],0x746e6972
 3b0:	74 
 3b1:	00 5f 5f             	add    BYTE PTR [edi+0x5f],bl
 3b4:	62 75 69             	bound  esi,QWORD PTR [ebp+0x69]
 3b7:	6c                   	ins    BYTE PTR es:[edi],dx
 3b8:	74 69                	je     423 <sysEnter_Vector-0x12fbdd>
 3ba:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3bb:	5f                   	pop    edi
 3bc:	76 61                	jbe    41f <sysEnter_Vector-0x12fbe1>
 3be:	5f                   	pop    edi
 3bf:	6c                   	ins    BYTE PTR es:[edi],dx
 3c0:	69 73 74 00 74 6d 5f 	imul   esi,DWORD PTR [ebx+0x74],0x5f6d7400
 3c7:	6d                   	ins    DWORD PTR es:[edi],dx
 3c8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3c9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3ca:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 3ce:	79 65                	jns    435 <sysEnter_Vector-0x12fbcb>
 3d0:	61                   	popa   
 3d1:	72 00                	jb     3d3 <sysEnter_Vector-0x12fc2d>
 3d3:	67                   	addr16
 3d4:	65                   	gs
 3d5:	74 74                	je     44b <sysEnter_Vector-0x12fbb5>
 3d7:	69 6d 65 00 77 61 69 	imul   ebp,DWORD PTR [ebp+0x65],0x69617700
 3de:	74 70                	je     450 <sysEnter_Vector-0x12fbb0>
 3e0:	69 64 00 44 65 62 75 	imul   esp,DWORD PTR [eax+eax*1+0x44],0x67756265
 3e7:	67 
 3e8:	4c                   	dec    esp
 3e9:	65                   	gs
 3ea:	76 65                	jbe    451 <sysEnter_Vector-0x12fbaf>
 3ec:	6c                   	ins    BYTE PTR es:[edi],dx
 3ed:	00 63 61             	add    BYTE PTR [ebx+0x61],ah
 3f0:	6c                   	ins    BYTE PTR es:[edi],dx
 3f1:	6c                   	ins    BYTE PTR es:[edi],dx
 3f2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3f3:	75 6d                	jne    462 <sysEnter_Vector-0x12fb9e>
 3f5:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 3f9:	69 73 64 73 74 00 64 	imul   esi,DWORD PTR [ebx+0x64],0x64007473
 400:	6f                   	outs   dx,DWORD PTR ds:[esi]
 401:	5f                   	pop    edi
 402:	73 79                	jae    47d <sysEnter_Vector-0x12fb83>
 404:	73 63                	jae    469 <sysEnter_Vector-0x12fb97>
 406:	61                   	popa   
 407:	6c                   	ins    BYTE PTR es:[edi],dx
 408:	6c                   	ins    BYTE PTR es:[edi],dx
 409:	31 00                	xor    DWORD PTR [eax],eax
 40b:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 40d:	5f                   	pop    edi
 40e:	73 79                	jae    489 <sysEnter_Vector-0x12fb77>
 410:	73 63                	jae    475 <sysEnter_Vector-0x12fb8b>
 412:	61                   	popa   
 413:	6c                   	ins    BYTE PTR es:[edi],dx
 414:	6c                   	ins    BYTE PTR es:[edi],dx
 415:	32 00                	xor    al,BYTE PTR [eax]
 417:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 419:	5f                   	pop    edi
 41a:	73 79                	jae    495 <sysEnter_Vector-0x12fb6b>
 41c:	73 63                	jae    481 <sysEnter_Vector-0x12fb7f>
 41e:	61                   	popa   
 41f:	6c                   	ins    BYTE PTR es:[edi],dx
 420:	6c                   	ins    BYTE PTR es:[edi],dx
 421:	33 00                	xor    eax,DWORD PTR [eax]
 423:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 425:	5f                   	pop    edi
 426:	73 79                	jae    4a1 <sysEnter_Vector-0x12fb5f>
 428:	73 63                	jae    48d <sysEnter_Vector-0x12fb73>
 42a:	61                   	popa   
 42b:	6c                   	ins    BYTE PTR es:[edi],dx
 42c:	6c                   	ins    BYTE PTR es:[edi],dx
 42d:	34 00                	xor    al,0x0
 42f:	74 6d                	je     49e <sysEnter_Vector-0x12fb62>
 431:	5f                   	pop    edi
 432:	6d                   	ins    DWORD PTR es:[edi],dx
 433:	69 6e 00 74 69 63 6b 	imul   ebp,DWORD PTR [esi+0x0],0x6b636974
 43a:	73 00                	jae    43c <sysEnter_Vector-0x12fbc4>
 43c:	74 6d                	je     4ab <sysEnter_Vector-0x12fb55>
 43e:	5f                   	pop    edi
 43f:	79 64                	jns    4a5 <sysEnter_Vector-0x12fb5b>
 441:	61                   	popa   
 442:	79 00                	jns    444 <sysEnter_Vector-0x12fbbc>
 444:	5f                   	pop    edi
 445:	5f                   	pop    edi
 446:	67 6e                	outs   dx,BYTE PTR ds:[si]
 448:	75 63                	jne    4ad <sysEnter_Vector-0x12fb53>
 44a:	5f                   	pop    edi
 44b:	76 61                	jbe    4ae <sysEnter_Vector-0x12fb52>
 44d:	5f                   	pop    edi
 44e:	6c                   	ins    BYTE PTR es:[edi],dx
 44f:	69 73 74 00 70 72 69 	imul   esi,DWORD PTR [ebx+0x74],0x69727000
 456:	6e                   	outs   dx,BYTE PTR ds:[esi]
 457:	74 64                	je     4bd <sysEnter_Vector-0x12fb43>
 459:	49                   	dec    ecx
 45a:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 45d:	72 61                	jb     4c0 <sysEnter_Vector-0x12fb40>
 45f:	6d                   	ins    DWORD PTR es:[edi],dx
 460:	31 00                	xor    DWORD PTR [eax],eax
 462:	70 61                	jo     4c5 <sysEnter_Vector-0x12fb3b>
 464:	72 61                	jb     4c7 <sysEnter_Vector-0x12fb39>
 466:	6d                   	ins    DWORD PTR es:[edi],dx
 467:	32 00                	xor    al,BYTE PTR [eax]
 469:	70 61                	jo     4cc <sysEnter_Vector-0x12fb34>
 46b:	72 61                	jb     4ce <sysEnter_Vector-0x12fb32>
 46d:	6d                   	ins    DWORD PTR es:[edi],dx
 46e:	33 00                	xor    eax,DWORD PTR [eax]
 470:	66 6f                	outs   dx,WORD PTR ds:[esi]
 472:	72 6d                	jb     4e1 <sysEnter_Vector-0x12fb1f>
 474:	61                   	popa   
 475:	74 00                	je     477 <sysEnter_Vector-0x12fb89>
 477:	74 6d                	je     4e6 <sysEnter_Vector-0x12fb1a>
 479:	5f                   	pop    edi
 47a:	67 6d                	ins    DWORD PTR es:[di],dx
 47c:	74 6f                	je     4ed <sysEnter_Vector-0x12fb13>
 47e:	66                   	data16
 47f:	66                   	data16
 480:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 483:	67 6e                	outs   dx,BYTE PTR ds:[si]
 485:	61                   	popa   
 486:	6c                   	ins    BYTE PTR es:[edi],dx
 487:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 48a:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 48d:	5f                   	pop    edi
 48e:	5f                   	pop    edi
 48f:	73 65                	jae    4f6 <sysEnter_Vector-0x12fb0a>
 491:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 494:	64                   	fs
 495:	73 00                	jae    497 <sysEnter_Vector-0x12fb69>
 497:	73 72                	jae    50b <sysEnter_Vector-0x12faf5>
 499:	63 2f                	arpl   WORD PTR [edi],bp
 49b:	6c                   	ins    BYTE PTR es:[edi],dx
 49c:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 4a3:	4f                   	dec    edi
 4a4:	53                   	push   ebx
 4a5:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 4a8:	61                   	popa   
 4a9:	72 67                	jb     512 <sysEnter_Vector-0x12faee>
 4ab:	63 00                	arpl   WORD PTR [eax],ax
 4ad:	74 6d                	je     51c <sysEnter_Vector-0x12fae4>
 4af:	5f                   	pop    edi
 4b0:	77 64                	ja     516 <sysEnter_Vector-0x12faea>
 4b2:	61                   	popa   
 4b3:	79 00                	jns    4b5 <sysEnter_Vector-0x12fb4b>
 4b5:	74 6d                	je     524 <sysEnter_Vector-0x12fadc>
 4b7:	5f                   	pop    edi
 4b8:	6d                   	ins    DWORD PTR es:[edi],dx
 4b9:	64                   	fs
 4ba:	61                   	popa   
 4bb:	79 00                	jns    4bd <sysEnter_Vector-0x12fb43>
 4bd:	6c                   	ins    BYTE PTR es:[edi],dx
 4be:	69 62 63 5f 63 6c 65 	imul   esp,DWORD PTR [edx+0x63],0x656c635f
 4c5:	61                   	popa   
 4c6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4c7:	75 70                	jne    539 <sysEnter_Vector-0x12fac7>
 4c9:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 4cd:	73 65                	jae    534 <sysEnter_Vector-0x12facc>
 4cf:	63 00                	arpl   WORD PTR [eax],ax
 4d1:	61                   	popa   
 4d2:	72 67                	jb     53b <sysEnter_Vector-0x12fac5>
 4d4:	76 00                	jbe    4d6 <sysEnter_Vector-0x12fb2a>
 4d6:	73 69                	jae    541 <sysEnter_Vector-0x12fabf>
 4d8:	67 48                	addr16 dec eax
 4da:	61                   	popa   
 4db:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4dc:	64                   	fs
 4dd:	6c                   	ins    BYTE PTR es:[edi],dx
 4de:	65                   	gs
 4df:	72 00                	jb     4e1 <sysEnter_Vector-0x12fb1f>
 4e1:	6d                   	ins    DWORD PTR es:[edi],dx
 4e2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4e3:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
 4ea:	6e 
 4eb:	61                   	popa   
 4ec:	6c                   	ins    BYTE PTR es:[edi],dx
 4ed:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 4f0:	67 73 00             	addr16 jae 4f3 <sysEnter_Vector-0x12fb0d>
 4f3:	70 72                	jo     567 <sysEnter_Vector-0x12fa99>
 4f5:	69 6e 74 49 00 73 74 	imul   ebp,DWORD PTR [esi+0x74],0x74730049
 4fc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4fd:	70 00                	jo     4ff <sysEnter_Vector-0x12fb01>
 4ff:	67                   	addr16
 500:	65                   	gs
 501:	74 63                	je     566 <sysEnter_Vector-0x12fa9a>
 503:	77 64                	ja     569 <sysEnter_Vector-0x12fa97>
 505:	00 61 6c             	add    BYTE PTR [ecx+0x6c],ah
 508:	6c                   	ins    BYTE PTR es:[edi],dx
 509:	6f                   	outs   dx,DWORD PTR ds:[esi]
 50a:	63 61 74             	arpl   WORD PTR [ecx+0x74],sp
 50d:	65                   	gs
 50e:	64                   	fs
 50f:	50                   	push   eax
 510:	74 72                	je     584 <sysEnter_Vector-0x12fa7c>
 512:	00 66 70             	add    BYTE PTR [esi+0x70],ah
 515:	6f                   	outs   dx,DWORD PTR ds:[esi]
 516:	69 6e 74 65 72 00 6e 	imul   ebp,DWORD PTR [esi+0x74],0x6e007265
 51d:	65                   	gs
 51e:	77 53                	ja     573 <sysEnter_Vector-0x12fa8d>
 520:	69 7a 65 00 6d 61 6c 	imul   edi,DWORD PTR [edx+0x65],0x6c616d00
 527:	6c                   	ins    BYTE PTR es:[edi],dx
 528:	6f                   	outs   dx,DWORD PTR ds:[esi]
 529:	63 5f 63             	arpl   WORD PTR [edi+0x63],bx
 52c:	6c                   	ins    BYTE PTR es:[edi],dx
 52d:	65                   	gs
 52e:	61                   	popa   
 52f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 530:	75 70                	jne    5a2 <sysEnter_Vector-0x12fa5e>
 532:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 535:	72 6b                	jb     5a2 <sysEnter_Vector-0x12fa5e>
 537:	65                   	gs
 538:	72 00                	jb     53a <sysEnter_Vector-0x12fac6>
 53a:	75 69                	jne    5a5 <sysEnter_Vector-0x12fa5b>
 53c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 53d:	74 38                	je     577 <sysEnter_Vector-0x12fa89>
 53f:	5f                   	pop    edi
 540:	74 00                	je     542 <sysEnter_Vector-0x12fabe>
 542:	66                   	data16
 543:	72 65                	jb     5aa <sysEnter_Vector-0x12fa56>
 545:	65 00 68 65          	add    BYTE PTR gs:[eax+0x65],ch
 549:	61                   	popa   
 54a:	70 50                	jo     59c <sysEnter_Vector-0x12fa64>
 54c:	74 72                	je     5c0 <sysEnter_Vector-0x12fa40>
 54e:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 551:	65 64 65 64 00 73 68 	gs fs gs add BYTE PTR fs:gs:[ebx+0x68],dh
 558:	65                   	gs
 559:	61                   	popa   
 55a:	70 00                	jo     55c <sysEnter_Vector-0x12faa4>
 55c:	69 6e 55 73 65 00 69 	imul   ebp,DWORD PTR [esi+0x55],0x69006573
 563:	6e                   	outs   dx,BYTE PTR ds:[esi]
 564:	69 74 6d 61 6c 6c 6f 	imul   esi,DWORD PTR [ebp+ebp*2+0x61],0x636f6c6c
 56b:	63 
 56c:	00 67 6f             	add    BYTE PTR [edi+0x6f],ah
 56f:	74 6f                	je     5e0 <sysEnter_Vector-0x12fa20>
 571:	48                   	dec    eax
 572:	65                   	gs
 573:	72 65                	jb     5da <sysEnter_Vector-0x12fa26>
 575:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 578:	61                   	popa   
 579:	70 50                	jo     5cb <sysEnter_Vector-0x12fa35>
 57b:	74 72                	je     5ef <sysEnter_Vector-0x12fa11>
 57d:	4e                   	dec    esi
 57e:	65                   	gs
 57f:	78 74                	js     5f5 <sysEnter_Vector-0x12fa0b>
 581:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 584:	77 48                	ja     5ce <sysEnter_Vector-0x12fa32>
 586:	65                   	gs
 587:	61                   	popa   
 588:	70 52                	jo     5dc <sysEnter_Vector-0x12fa24>
 58a:	65                   	gs
 58b:	71 75                	jno    602 <sysEnter_Vector-0x12f9fe>
 58d:	69 72 65 64 54 6f 46 	imul   esi,DWORD PTR [edx+0x65],0x466f5464
 594:	75 6c                	jne    602 <sysEnter_Vector-0x12f9fe>
 596:	66 69 6c 6c 52 65 71 	imul   bp,WORD PTR [esp+ebp*2+0x52],0x7165
 59d:	75 65                	jne    604 <sysEnter_Vector-0x12f9fc>
 59f:	73 74                	jae    615 <sysEnter_Vector-0x12f9eb>
 5a1:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 5a4:	63 2f                	arpl   WORD PTR [edi],bp
 5a6:	6d                   	ins    DWORD PTR es:[edi],dx
 5a7:	61                   	popa   
 5a8:	6c                   	ins    BYTE PTR es:[edi],dx
 5a9:	6c                   	ins    BYTE PTR es:[edi],dx
 5aa:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5ab:	63 2e                	arpl   WORD PTR [esi],bp
 5ad:	63 00                	arpl   WORD PTR [eax],ax
 5af:	70 72                	jo     623 <sysEnter_Vector-0x12f9dd>
 5b1:	65                   	gs
 5b2:	76 00                	jbe    5b4 <sysEnter_Vector-0x12fa4c>
 5b4:	68 65 61 70 72       	push   0x72706165
 5b9:	65 63 5f 74          	arpl   WORD PTR gs:[edi+0x74],bx
 5bd:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 5c0:	63 2f                	arpl   WORD PTR [edi],bp
 5c2:	6d                   	ins    DWORD PTR es:[edi],dx
 5c3:	65                   	gs
 5c4:	6d                   	ins    DWORD PTR es:[edi],dx
 5c5:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 5c8:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 5cb:	64                   	fs
 5cc:	65                   	gs
 5cd:	73 74                	jae    643 <sysEnter_Vector-0x12f9bd>
 5cf:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 5d2:	6d                   	ins    DWORD PTR es:[edi],dx
 5d3:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 5d6:	00 65 56             	add    BYTE PTR [ebp+0x56],ah
 5d9:	61                   	popa   
 5da:	6c                   	ins    BYTE PTR es:[edi],dx
 5db:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 5de:	6d                   	ins    DWORD PTR es:[edi],dx
 5df:	73 65                	jae    646 <sysEnter_Vector-0x12f9ba>
 5e1:	74 00                	je     5e3 <sysEnter_Vector-0x12fa1d>
 5e3:	73 72                	jae    657 <sysEnter_Vector-0x12f9a9>
 5e5:	63 2f                	arpl   WORD PTR [edi],bp
 5e7:	6d                   	ins    DWORD PTR es:[edi],dx
 5e8:	65                   	gs
 5e9:	6d                   	ins    DWORD PTR es:[edi],dx
 5ea:	73 65                	jae    651 <sysEnter_Vector-0x12f9af>
 5ec:	74 2e                	je     61c <sysEnter_Vector-0x12f9e4>
 5ee:	63 00                	arpl   WORD PTR [eax],ax
 5f0:	66 56                	push   si
 5f2:	61                   	popa   
 5f3:	6c                   	ins    BYTE PTR es:[edi],dx
 5f4:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 5f7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5f8:	74 31                	je     62b <sysEnter_Vector-0x12f9d5>
 5fa:	36                   	ss
 5fb:	5f                   	pop    edi
 5fc:	74 00                	je     5fe <sysEnter_Vector-0x12fa02>
 5fe:	61                   	popa   
 5ff:	64                   	fs
 600:	64                   	fs
 601:	72 00                	jb     603 <sysEnter_Vector-0x12f9fd>
 603:	6f                   	outs   dx,DWORD PTR ds:[esi]
 604:	66 66 5f             	data32 pop di
 607:	74 00                	je     609 <sysEnter_Vector-0x12f9f7>
 609:	70 72                	jo     67d <sysEnter_Vector-0x12f983>
 60b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 60c:	74 00                	je     60e <sysEnter_Vector-0x12f9f2>
 60e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 60f:	66                   	data16
 610:	66                   	data16
 611:	73 65                	jae    678 <sysEnter_Vector-0x12f988>
 613:	74 00                	je     615 <sysEnter_Vector-0x12f9eb>
 615:	6d                   	ins    DWORD PTR es:[edi],dx
 616:	6d                   	ins    DWORD PTR es:[edi],dx
 617:	61                   	popa   
 618:	70 00                	jo     61a <sysEnter_Vector-0x12f9e6>
 61a:	73 72                	jae    68e <sysEnter_Vector-0x12f972>
 61c:	63 2f                	arpl   WORD PTR [edi],bp
 61e:	6d                   	ins    DWORD PTR es:[edi],dx
 61f:	6d                   	ins    DWORD PTR es:[edi],dx
 620:	61                   	popa   
 621:	70 2e                	jo     651 <sysEnter_Vector-0x12f9af>
 623:	63 00                	arpl   WORD PTR [eax],ax
 625:	77 72                	ja     699 <sysEnter_Vector-0x12f967>
 627:	69 74 65 00 64 65 6e 	imul   esi,DWORD PTR [ebp+eiz*2+0x0],0x746e6564
 62e:	74 
 62f:	72 79                	jb     6aa <sysEnter_Vector-0x12f956>
 631:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 634:	6c                   	ins    BYTE PTR es:[edi],dx
 635:	65                   	gs
 636:	5f                   	pop    edi
 637:	74 00                	je     639 <sysEnter_Vector-0x12f9c7>
 639:	75 69                	jne    6a4 <sysEnter_Vector-0x12f95c>
 63b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 63c:	74 36                	je     674 <sysEnter_Vector-0x12f98c>
 63e:	34 5f                	xor    al,0x5f
 640:	74 00                	je     642 <sysEnter_Vector-0x12f9be>
 642:	73 75                	jae    6b9 <sysEnter_Vector-0x12f947>
 644:	70 65                	jo     6ab <sysEnter_Vector-0x12f955>
 646:	72 5f                	jb     6a7 <sysEnter_Vector-0x12f959>
 648:	62 6c 6f 63          	bound  ebp,QWORD PTR [edi+ebp*2+0x63]
 64c:	6b 00 6d             	imul   eax,DWORD PTR [eax],0x6d
 64f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 650:	74 5f                	je     6b1 <sysEnter_Vector-0x12f94f>
 652:	72 6f                	jb     6c3 <sysEnter_Vector-0x12f93d>
 654:	6f                   	outs   dx,DWORD PTR ds:[esi]
 655:	74 00                	je     657 <sysEnter_Vector-0x12f9a9>
 657:	69 5f 76 66 73 6d 6f 	imul   ebx,DWORD PTR [edi+0x76],0x6f6d7366
 65e:	75 6e                	jne    6ce <sysEnter_Vector-0x12f932>
 660:	74 00                	je     662 <sysEnter_Vector-0x12f99e>
 662:	66 6f                	outs   dx,WORD PTR ds:[esi]
 664:	70 73                	jo     6d9 <sysEnter_Vector-0x12f927>
 666:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 669:	6e                   	outs   dx,BYTE PTR ds:[esi]
 66a:	61                   	popa   
 66b:	6d                   	ins    DWORD PTR es:[edi],dx
 66c:	65 00 77 72          	add    BYTE PTR gs:[edi+0x72],dh
 670:	69 74 65 43 6f 6e 73 	imul   esi,DWORD PTR [ebp+eiz*2+0x43],0x6f736e6f
 677:	6f 
 678:	6c                   	ins    BYTE PTR es:[edi],dx
 679:	65 00 66 70          	add    BYTE PTR gs:[esi+0x70],ah
 67d:	74 72                	je     6f1 <sysEnter_Vector-0x12f90f>
 67f:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 682:	6f                   	outs   dx,DWORD PTR ds:[esi]
 683:	64                   	fs
 684:	65                   	gs
 685:	5f                   	pop    edi
 686:	6f                   	outs   dx,DWORD PTR ds:[esi]
 687:	70 65                	jo     6ee <sysEnter_Vector-0x12f912>
 689:	72 61                	jb     6ec <sysEnter_Vector-0x12f914>
 68b:	74 69                	je     6f6 <sysEnter_Vector-0x12f90a>
 68d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 68e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 68f:	73 00                	jae    691 <sysEnter_Vector-0x12f96f>
 691:	73 6c                	jae    6ff <sysEnter_Vector-0x12f901>
 693:	69 73 74 68 65 61 64 	imul   esi,DWORD PTR [ebx+0x74],0x64616568
 69a:	00 6d 6b             	add    BYTE PTR [ebp+0x6b],ch
 69d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 69e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 69f:	64 00 6d 6e          	add    BYTE PTR fs:[ebp+0x6e],ch
 6a3:	74 5f                	je     704 <sysEnter_Vector-0x12f8fc>
 6a5:	73 62                	jae    709 <sysEnter_Vector-0x12f8f7>
 6a7:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 6aa:	66                   	data16
 6ab:	6c                   	ins    BYTE PTR es:[edi],dx
 6ac:	61                   	popa   
 6ad:	67 73 00             	addr16 jae 6b0 <sysEnter_Vector-0x12f950>
 6b0:	72 65                	jb     717 <sysEnter_Vector-0x12f8e9>
 6b2:	61                   	popa   
 6b3:	64 00 69 5f          	add    BYTE PTR fs:[ecx+0x5f],ch
 6b7:	64                   	fs
 6b8:	65                   	gs
 6b9:	76 00                	jbe    6bb <sysEnter_Vector-0x12f945>
 6bb:	73 5f                	jae    71c <sysEnter_Vector-0x12f8e4>
 6bd:	64                   	fs
 6be:	65                   	gs
 6bf:	76 00                	jbe    6c1 <sysEnter_Vector-0x12f93f>
 6c1:	69 5f 75 69 64 00 72 	imul   ebx,DWORD PTR [edi+0x75],0x72006469
 6c8:	65                   	gs
 6c9:	61                   	popa   
 6ca:	64                   	fs
 6cb:	43                   	inc    ebx
 6cc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6cd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6ce:	73 6f                	jae    73f <sysEnter_Vector-0x12f8c1>
 6d0:	6c                   	ins    BYTE PTR es:[edi],dx
 6d1:	65 00 63 72          	add    BYTE PTR gs:[ebx+0x72],ah
 6d5:	65                   	gs
 6d6:	61                   	popa   
 6d7:	74 65                	je     73e <sysEnter_Vector-0x12f8c2>
 6d9:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 6dc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6dd:	70 66                	jo     745 <sysEnter_Vector-0x12f8bb>
 6df:	6c                   	ins    BYTE PTR es:[edi],dx
 6e0:	61                   	popa   
 6e1:	67 73 00             	addr16 jae 6e4 <sysEnter_Vector-0x12f91c>
 6e4:	64                   	fs
 6e5:	5f                   	pop    edi
 6e6:	70 61                	jo     749 <sysEnter_Vector-0x12f8b7>
 6e8:	72 65                	jb     74f <sysEnter_Vector-0x12f8b1>
 6ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6eb:	74 00                	je     6ed <sysEnter_Vector-0x12f913>
 6ed:	66 5f                	pop    di
 6ef:	70 61                	jo     752 <sysEnter_Vector-0x12f8ae>
 6f1:	74 68                	je     75b <sysEnter_Vector-0x12f8a5>
 6f3:	00 73 5f             	add    BYTE PTR [ebx+0x5f],dh
 6f6:	72 6f                	jb     767 <sysEnter_Vector-0x12f899>
 6f8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6f9:	74 00                	je     6fb <sysEnter_Vector-0x12f905>
 6fb:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 6fe:	73 6f                	jae    76f <sysEnter_Vector-0x12f891>
 700:	6c                   	ins    BYTE PTR es:[edi],dx
 701:	65                   	gs
 702:	5f                   	pop    edi
 703:	66 69 6c 65 00 72 6d 	imul   bp,WORD PTR [ebp+eiz*2+0x0],0x6d72
 70a:	64 69 72 00 64 5f 69 	imul   esi,DWORD PTR fs:[edx+0x0],0x6e695f64
 711:	6e 
 712:	6f                   	outs   dx,DWORD PTR ds:[esi]
 713:	64 65 00 69 6e       	fs add BYTE PTR fs:gs:[ecx+0x6e],ch
 718:	6f                   	outs   dx,DWORD PTR ds:[esi]
 719:	64                   	fs
 71a:	65                   	gs
 71b:	5f                   	pop    edi
 71c:	74 00                	je     71e <sysEnter_Vector-0x12f8e2>
 71e:	69 6f 49 6e 69 74 00 	imul   ebp,DWORD PTR [edi+0x49],0x74696e
 725:	64                   	fs
 726:	5f                   	pop    edi
 727:	6e                   	outs   dx,BYTE PTR ds:[esi]
 728:	61                   	popa   
 729:	6d                   	ins    DWORD PTR es:[edi],dx
 72a:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 72e:	63 2f                	arpl   WORD PTR [edi],bp
 730:	73 74                	jae    7a6 <sysEnter_Vector-0x12f85a>
 732:	64 69 6f 2e 63 00 66 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x5f660063
 739:	5f 
 73a:	69 6e 6f 64 65 00 73 	imul   ebp,DWORD PTR [esi+0x6f],0x73006564
 741:	5f                   	pop    edi
 742:	6c                   	ins    BYTE PTR es:[edi],dx
 743:	69 73 74 00 6d 6e 74 	imul   esi,DWORD PTR [ebx+0x74],0x746e6d00
 74a:	5f                   	pop    edi
 74b:	66                   	data16
 74c:	6c                   	ins    BYTE PTR es:[edi],dx
 74d:	61                   	popa   
 74e:	67 73 00             	addr16 jae 751 <sysEnter_Vector-0x12f8af>
 751:	66 69 6c 65 5f 6f 70 	imul   bp,WORD PTR [ebp+eiz*2+0x5f],0x706f
 758:	65                   	gs
 759:	72 61                	jb     7bc <sysEnter_Vector-0x12f844>
 75b:	74 69                	je     7c6 <sysEnter_Vector-0x12f83a>
 75d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 75e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 75f:	73 5f                	jae    7c0 <sysEnter_Vector-0x12f840>
 761:	74 00                	je     763 <sysEnter_Vector-0x12f89d>
 763:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 766:	73 6f                	jae    7d7 <sysEnter_Vector-0x12f829>
 768:	6c                   	ins    BYTE PTR es:[edi],dx
 769:	65                   	gs
 76a:	5f                   	pop    edi
 76b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 76c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 76d:	64 65 00 6d 6b       	fs add BYTE PTR fs:gs:[ebp+0x6b],ch
 772:	64 69 72 00 69 5f 6d 	imul   esi,DWORD PTR fs:[edx+0x0],0x6f6d5f69
 779:	6f 
 77a:	64 65 00 64 6c 6c    	fs add BYTE PTR fs:gs:[esp+ebp*2+0x6c],ah
 780:	69 73 74 5f 74 00 66 	imul   esi,DWORD PTR [ebx+0x74],0x6600745f
 787:	69 6c 65 5f 6f 70 65 	imul   ebp,DWORD PTR [ebp+eiz*2+0x5f],0x7265706f
 78e:	72 
 78f:	61                   	popa   
 790:	74 69                	je     7fb <sysEnter_Vector-0x12f805>
 792:	6f                   	outs   dx,DWORD PTR ds:[esi]
 793:	6e                   	outs   dx,BYTE PTR ds:[esi]
 794:	73 00                	jae    796 <sysEnter_Vector-0x12f86a>
 796:	77 68                	ja     800 <sysEnter_Vector-0x12f800>
 798:	61                   	popa   
 799:	74 65                	je     800 <sysEnter_Vector-0x12f800>
 79b:	76 65                	jbe    802 <sysEnter_Vector-0x12f7fe>
 79d:	72 00                	jb     79f <sysEnter_Vector-0x12f861>
 79f:	69 5f 6f 70 00 70 61 	imul   ebx,DWORD PTR [edi+0x6f],0x61700070
 7a6:	79 6c                	jns    814 <sysEnter_Vector-0x12f7ec>
 7a8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 7a9:	61                   	popa   
 7aa:	64 00 6e 65          	add    BYTE PTR fs:[esi+0x65],ch
 7ae:	78 74                	js     824 <sysEnter_Vector-0x12f7dc>
 7b0:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 7b3:	67 69 64 00 73 74 72 	imul   esp,DWORD PTR [si+0x0],0x63727473
 7ba:	63 
 7bb:	61                   	popa   
 7bc:	74 00                	je     7be <sysEnter_Vector-0x12f842>
 7be:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 7c1:	63 61 74             	arpl   WORD PTR [ecx+0x74],sp
 7c4:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 7c6:	61                   	popa   
 7c7:	74 65                	je     82e <sysEnter_Vector-0x12f7d2>
 7c9:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 7cc:	63 2f                	arpl   WORD PTR [edi],bp
 7ce:	73 74                	jae    844 <sysEnter_Vector-0x12f7bc>
 7d0:	72 69                	jb     83b <sysEnter_Vector-0x12f7c5>
 7d2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7d3:	67 73 2f             	addr16 jae 805 <sysEnter_Vector-0x12f7fb>
 7d6:	73 74                	jae    84c <sysEnter_Vector-0x12f7b4>
 7d8:	72 63                	jb     83d <sysEnter_Vector-0x12f7c3>
 7da:	61                   	popa   
 7db:	74 2e                	je     80b <sysEnter_Vector-0x12f7f5>
 7dd:	63 00                	arpl   WORD PTR [eax],ax
 7df:	73 74                	jae    855 <sysEnter_Vector-0x12f7ab>
 7e1:	72 63                	jb     846 <sysEnter_Vector-0x12f7ba>
 7e3:	6d                   	ins    DWORD PTR es:[edi],dx
 7e4:	70 00                	jo     7e6 <sysEnter_Vector-0x12f81a>
 7e6:	73 72                	jae    85a <sysEnter_Vector-0x12f7a6>
 7e8:	63 2f                	arpl   WORD PTR [edi],bp
 7ea:	73 74                	jae    860 <sysEnter_Vector-0x12f7a0>
 7ec:	72 69                	jb     857 <sysEnter_Vector-0x12f7a9>
 7ee:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7ef:	67 73 2f             	addr16 jae 821 <sysEnter_Vector-0x12f7df>
 7f2:	73 74                	jae    868 <sysEnter_Vector-0x12f798>
 7f4:	72 63                	jb     859 <sysEnter_Vector-0x12f7a7>
 7f6:	6d                   	ins    DWORD PTR es:[edi],dx
 7f7:	70 2e                	jo     827 <sysEnter_Vector-0x12f7d9>
 7f9:	63 00                	arpl   WORD PTR [eax],ax
 7fb:	73 74                	jae    871 <sysEnter_Vector-0x12f78f>
 7fd:	72 63                	jb     862 <sysEnter_Vector-0x12f79e>
 7ff:	70 79                	jo     87a <sysEnter_Vector-0x12f786>
 801:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 804:	75 6e                	jne    874 <sysEnter_Vector-0x12f78c>
 806:	74 00                	je     808 <sysEnter_Vector-0x12f7f8>
 808:	73 74                	jae    87e <sysEnter_Vector-0x12f782>
 80a:	72 63                	jb     86f <sysEnter_Vector-0x12f791>
 80c:	70 79                	jo     887 <sysEnter_Vector-0x12f779>
 80e:	63 00                	arpl   WORD PTR [eax],ax
 810:	73 72                	jae    884 <sysEnter_Vector-0x12f77c>
 812:	63 2f                	arpl   WORD PTR [edi],bp
 814:	73 74                	jae    88a <sysEnter_Vector-0x12f776>
 816:	72 69                	jb     881 <sysEnter_Vector-0x12f77f>
 818:	6e                   	outs   dx,BYTE PTR ds:[esi]
 819:	67 73 2f             	addr16 jae 84b <sysEnter_Vector-0x12f7b5>
 81c:	73 74                	jae    892 <sysEnter_Vector-0x12f76e>
 81e:	72 63                	jb     883 <sysEnter_Vector-0x12f77d>
 820:	70 79                	jo     89b <sysEnter_Vector-0x12f765>
 822:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 825:	73 74                	jae    89b <sysEnter_Vector-0x12f765>
 827:	72 6c                	jb     895 <sysEnter_Vector-0x12f76b>
 829:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 82b:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 82e:	63 2f                	arpl   WORD PTR [edi],bp
 830:	73 74                	jae    8a6 <sysEnter_Vector-0x12f75a>
 832:	72 69                	jb     89d <sysEnter_Vector-0x12f763>
 834:	6e                   	outs   dx,BYTE PTR ds:[esi]
 835:	67 73 2f             	addr16 jae 867 <sysEnter_Vector-0x12f799>
 838:	73 74                	jae    8ae <sysEnter_Vector-0x12f752>
 83a:	72 6c                	jb     8a8 <sysEnter_Vector-0x12f758>
 83c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 83e:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 841:	73 74                	jae    8b7 <sysEnter_Vector-0x12f749>
 843:	72 6e                	jb     8b3 <sysEnter_Vector-0x12f74d>
 845:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 848:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 84b:	63 2f                	arpl   WORD PTR [edi],bp
 84d:	73 74                	jae    8c3 <sysEnter_Vector-0x12f73d>
 84f:	72 69                	jb     8ba <sysEnter_Vector-0x12f746>
 851:	6e                   	outs   dx,BYTE PTR ds:[esi]
 852:	67 73 2f             	addr16 jae 884 <sysEnter_Vector-0x12f77c>
 855:	73 74                	jae    8cb <sysEnter_Vector-0x12f735>
 857:	72 6e                	jb     8c7 <sysEnter_Vector-0x12f739>
 859:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 85c:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 85f:	73 72                	jae    8d3 <sysEnter_Vector-0x12f72d>
 861:	63 2f                	arpl   WORD PTR [edi],bp
 863:	73 74                	jae    8d9 <sysEnter_Vector-0x12f727>
 865:	72 69                	jb     8d0 <sysEnter_Vector-0x12f730>
 867:	6e                   	outs   dx,BYTE PTR ds:[esi]
 868:	67 73 2f             	addr16 jae 89a <sysEnter_Vector-0x12f766>
 86b:	73 74                	jae    8e1 <sysEnter_Vector-0x12f71f>
 86d:	72 6e                	jb     8dd <sysEnter_Vector-0x12f723>
 86f:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 872:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 875:	73 74                	jae    8eb <sysEnter_Vector-0x12f715>
 877:	72 6e                	jb     8e7 <sysEnter_Vector-0x12f719>
 879:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 87c:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 87f:	63 2f                	arpl   WORD PTR [edi],bp
 881:	73 74                	jae    8f7 <sysEnter_Vector-0x12f709>
 883:	72 69                	jb     8ee <sysEnter_Vector-0x12f712>
 885:	6e                   	outs   dx,BYTE PTR ds:[esi]
 886:	67 73 2f             	addr16 jae 8b8 <sysEnter_Vector-0x12f748>
 889:	73 74                	jae    8ff <sysEnter_Vector-0x12f701>
 88b:	72 6f                	jb     8fc <sysEnter_Vector-0x12f704>
 88d:	75 6c                	jne    8fb <sysEnter_Vector-0x12f705>
 88f:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 892:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 895:	6f                   	outs   dx,DWORD PTR ds:[esi]
 896:	66                   	data16
 897:	66                   	data16
 898:	00 63 75             	add    BYTE PTR [ebx+0x75],ah
 89b:	74 6c                	je     909 <sysEnter_Vector-0x12f6f7>
 89d:	69 6d 00 73 74 72 74 	imul   ebp,DWORD PTR [ebp+0x0],0x74727473
 8a4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 8a5:	75 6c                	jne    913 <sysEnter_Vector-0x12f6ed>
 8a7:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 8aa:	64                   	fs
 8ab:	70 74                	jo     921 <sysEnter_Vector-0x12f6df>
 8ad:	72 00                	jb     8af <sysEnter_Vector-0x12f751>
 8af:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8b0:	70 74                	jo     926 <sysEnter_Vector-0x12f6da>
 8b2:	72 00                	jb     8b4 <sysEnter_Vector-0x12f74c>
 8b4:	62 61 73             	bound  esp,QWORD PTR [ecx+0x73]
 8b7:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 8bb:	63 2f                	arpl   WORD PTR [edi],bp
 8bd:	73 74                	jae    933 <sysEnter_Vector-0x12f6cd>
 8bf:	72 69                	jb     92a <sysEnter_Vector-0x12f6d6>
 8c1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8c2:	67 73 2f             	addr16 jae 8f4 <sysEnter_Vector-0x12f70c>
 8c5:	73 74                	jae    93b <sysEnter_Vector-0x12f6c5>
 8c7:	72 70                	jb     939 <sysEnter_Vector-0x12f6c7>
 8c9:	61                   	popa   
 8ca:	72 74                	jb     940 <sysEnter_Vector-0x12f6c0>
 8cc:	73 2e                	jae    8fc <sysEnter_Vector-0x12f704>
 8ce:	63 00                	arpl   WORD PTR [eax],ax
 8d0:	73 74                	jae    946 <sysEnter_Vector-0x12f6ba>
 8d2:	72 6c                	jb     940 <sysEnter_Vector-0x12f6c0>
 8d4:	65                   	gs
 8d5:	66                   	data16
 8d6:	74 00                	je     8d8 <sysEnter_Vector-0x12f728>
 8d8:	73 72                	jae    94c <sysEnter_Vector-0x12f6b4>
 8da:	63 2f                	arpl   WORD PTR [edi],bp
 8dc:	73 74                	jae    952 <sysEnter_Vector-0x12f6ae>
 8de:	72 69                	jb     949 <sysEnter_Vector-0x12f6b7>
 8e0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8e1:	67 73 2f             	addr16 jae 913 <sysEnter_Vector-0x12f6ed>
 8e4:	73 74                	jae    95a <sysEnter_Vector-0x12f6a6>
 8e6:	72 74                	jb     95c <sysEnter_Vector-0x12f6a4>
 8e8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 8e9:	6c                   	ins    BYTE PTR es:[edi],dx
 8ea:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8ed:	73 74                	jae    963 <sysEnter_Vector-0x12f69d>
 8ef:	72 74                	jb     965 <sysEnter_Vector-0x12f69b>
 8f1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 8f2:	6c                   	ins    BYTE PTR es:[edi],dx
 8f3:	00 6c 65 6e          	add    BYTE PTR [ebp+eiz*2+0x6e],ch
 8f7:	67 74 68             	addr16 je 962 <sysEnter_Vector-0x12f69e>
 8fa:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 8fd:	61                   	popa   
 8fe:	72 74                	jb     974 <sysEnter_Vector-0x12f68c>
 900:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 903:	63 2f                	arpl   WORD PTR [edi],bp
 905:	73 74                	jae    97b <sysEnter_Vector-0x12f685>
 907:	72 69                	jb     972 <sysEnter_Vector-0x12f68e>
 909:	6e                   	outs   dx,BYTE PTR ds:[esi]
 90a:	67 73 2f             	addr16 jae 93c <sysEnter_Vector-0x12f6c4>
 90d:	73 74                	jae    983 <sysEnter_Vector-0x12f67d>
 90f:	72 74                	jb     985 <sysEnter_Vector-0x12f67b>
 911:	72 69                	jb     97c <sysEnter_Vector-0x12f684>
 913:	6d                   	ins    DWORD PTR es:[edi],dx
 914:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 917:	73 74                	jae    98d <sysEnter_Vector-0x12f673>
 919:	72 74                	jb     98f <sysEnter_Vector-0x12f671>
 91b:	72 69                	jb     986 <sysEnter_Vector-0x12f67a>
 91d:	6d                   	ins    DWORD PTR es:[edi],dx
 91e:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 921:	72 74                	jb     997 <sysEnter_Vector-0x12f669>
 923:	72 69                	jb     98e <sysEnter_Vector-0x12f672>
 925:	6d                   	ins    DWORD PTR es:[edi],dx
 926:	32 00                	xor    al,BYTE PTR [eax]
 928:	70 6f                	jo     999 <sysEnter_Vector-0x12f667>
 92a:	69 6e 74 65 72 54 6f 	imul   ebp,DWORD PTR [esi+0x74],0x6f547265
 931:	53                   	push   ebx
 932:	74 72                	je     9a6 <sysEnter_Vector-0x12f65a>
 934:	69 6e 67 00 6c 6f 63 	imul   ebp,DWORD PTR [esi+0x67],0x636f6c00
 93b:	61                   	popa   
 93c:	6c                   	ins    BYTE PTR es:[edi],dx
 93d:	74 69                	je     9a8 <sysEnter_Vector-0x12f658>
 93f:	6d                   	ins    DWORD PTR es:[edi],dx
 940:	65 00 64 61 79       	add    BYTE PTR gs:[ecx+eiz*2+0x79],ah
 945:	6e                   	outs   dx,BYTE PTR ds:[esi]
 946:	6f                   	outs   dx,DWORD PTR ds:[esi]
 947:	00 5f 64             	add    BYTE PTR [edi+0x64],bl
 94a:	73 74                	jae    9c0 <sysEnter_Vector-0x12f640>
 94c:	62 69 61             	bound  ebp,QWORD PTR [ecx+0x61]
 94f:	73 00                	jae    951 <sysEnter_Vector-0x12f6af>
 951:	67 6d                	ins    DWORD PTR es:[di],dx
 953:	74 69                	je     9be <sysEnter_Vector-0x12f642>
 955:	6d                   	ins    DWORD PTR es:[edi],dx
 956:	65                   	gs
 957:	5f                   	pop    edi
 958:	72 00                	jb     95a <sysEnter_Vector-0x12f6a6>
 95a:	74 69                	je     9c5 <sysEnter_Vector-0x12f63b>
 95c:	6d                   	ins    DWORD PTR es:[edi],dx
 95d:	65                   	gs
 95e:	72 00                	jb     960 <sysEnter_Vector-0x12f6a0>
 960:	6c                   	ins    BYTE PTR es:[edi],dx
 961:	6f                   	outs   dx,DWORD PTR ds:[esi]
 962:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
 965:	74 69                	je     9d0 <sysEnter_Vector-0x12f630>
 967:	6d                   	ins    DWORD PTR es:[edi],dx
 968:	65                   	gs
 969:	5f                   	pop    edi
 96a:	72 00                	jb     96c <sysEnter_Vector-0x12f694>
 96c:	5f                   	pop    edi
 96d:	6d                   	ins    DWORD PTR es:[edi],dx
 96e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 96f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 970:	74 68                	je     9da <sysEnter_Vector-0x12f626>
 972:	73 5f                	jae    9d3 <sysEnter_Vector-0x12f62d>
 974:	61                   	popa   
 975:	62 62 72             	bound  esp,QWORD PTR [edx+0x72]
 978:	65                   	gs
 979:	76 00                	jbe    97b <sysEnter_Vector-0x12f685>
 97b:	5f                   	pop    edi
 97c:	74 7a                	je     9f8 <sysEnter_Vector-0x12f608>
 97e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 97f:	61                   	popa   
 980:	6d                   	ins    DWORD PTR es:[edi],dx
 981:	65 00 5f 6d          	add    BYTE PTR gs:[edi+0x6d],bl
 985:	6f                   	outs   dx,DWORD PTR ds:[esi]
 986:	6e                   	outs   dx,BYTE PTR ds:[esi]
 987:	74 68                	je     9f1 <sysEnter_Vector-0x12f60f>
 989:	73 00                	jae    98b <sysEnter_Vector-0x12f675>
 98b:	5f                   	pop    edi
 98c:	79 74                	jns    a02 <sysEnter_Vector-0x12f5fe>
 98e:	61                   	popa   
 98f:	62 00                	bound  eax,QWORD PTR [eax]
 991:	74 69                	je     9fc <sysEnter_Vector-0x12f604>
 993:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 996:	54                   	push   esp
 997:	6f                   	outs   dx,DWORD PTR ds:[esi]
 998:	57                   	push   edi
 999:	61                   	popa   
 99a:	69 74 00 6d 6b 74 69 	imul   esi,DWORD PTR [eax+eax*1+0x6d],0x6d69746b
 9a1:	6d 
 9a2:	65 00 64 61 79       	add    BYTE PTR gs:[ecx+eiz*2+0x79],ah
 9a7:	63 6c 6f 63          	arpl   WORD PTR [edi+ebp*2+0x63],bp
 9ab:	6b 00 5f             	imul   eax,DWORD PTR [eax],0x5f
 9ae:	64                   	fs
 9af:	61                   	popa   
 9b0:	79 6c                	jns    a1e <sysEnter_Vector-0x12f5e2>
 9b2:	69 67 68 74 00 5f 64 	imul   esp,DWORD PTR [edi+0x68],0x645f0074
 9b9:	61                   	popa   
 9ba:	79 73                	jns    a2f <sysEnter_Vector-0x12f5d1>
 9bc:	5f                   	pop    edi
 9bd:	61                   	popa   
 9be:	62 62 72             	bound  esp,QWORD PTR [edx+0x72]
 9c1:	65                   	gs
 9c2:	76 00                	jbe    9c4 <sysEnter_Vector-0x12f63c>
 9c4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 9c5:	76 65                	jbe    a2c <sysEnter_Vector-0x12f5d4>
 9c7:	72 66                	jb     a2f <sysEnter_Vector-0x12f5d1>
 9c9:	6c                   	ins    BYTE PTR es:[edi],dx
 9ca:	6f                   	outs   dx,DWORD PTR ds:[esi]
 9cb:	77 00                	ja     9cd <sysEnter_Vector-0x12f633>
 9cd:	6d                   	ins    DWORD PTR es:[edi],dx
 9ce:	6f                   	outs   dx,DWORD PTR ds:[esi]
 9cf:	6e                   	outs   dx,BYTE PTR ds:[esi]
 9d0:	74 68                	je     a3a <sysEnter_Vector-0x12f5c6>
 9d2:	00 74 6d 62          	add    BYTE PTR [ebp+ebp*2+0x62],dh
 9d6:	75 66                	jne    a3e <sysEnter_Vector-0x12f5c2>
 9d8:	00 5f 64             	add    BYTE PTR [edi+0x64],bl
 9db:	61                   	popa   
 9dc:	79 73                	jns    a51 <sysEnter_Vector-0x12f5af>
 9de:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 9e1:	63 2f                	arpl   WORD PTR [edi],bp
 9e3:	74 69                	je     a4e <sysEnter_Vector-0x12f5b2>
 9e5:	6d                   	ins    DWORD PTR es:[edi],dx
 9e6:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax

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
