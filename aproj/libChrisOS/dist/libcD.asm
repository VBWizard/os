
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
30000003:	e8 62 1f 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000008:	05 90 33 00 00       	add    eax,0x3390
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
3000003b:	e8 2a 1f 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000040:	05 58 33 00 00       	add    eax,0x3358
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
30000075:	e8 f0 1e 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
3000007a:	05 1e 33 00 00       	add    eax,0x331e
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
300000ca:	e8 9b 1e 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
300000cf:	05 c9 32 00 00       	add    eax,0x32c9
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
30000126:	81 c3 72 32 00 00    	add    ebx,0x3272
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
300001b8:	e8 ad 1d 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
300001bd:	05 db 31 00 00       	add    eax,0x31db
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
300001e1:	e8 84 1d 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
300001e6:	05 b2 31 00 00       	add    eax,0x31b2
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
30000224:	e8 41 1d 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000229:	05 6f 31 00 00       	add    eax,0x316f
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
30000253:	e8 12 1d 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000258:	05 40 31 00 00       	add    eax,0x3140
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
30000327:	e8 3e 1c 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
3000032c:	05 6c 30 00 00       	add    eax,0x306c
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
3000035c:	e8 09 1c 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000361:	05 37 30 00 00       	add    eax,0x3037
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
30000390:	e8 d5 1b 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000395:	05 03 30 00 00       	add    eax,0x3003
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
300003c0:	e8 a5 1b 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
300003c5:	05 d3 2f 00 00       	add    eax,0x2fd3
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
300003ed:	81 c3 ab 2f 00 00    	add    ebx,0x2fab
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
30000428:	8d 83 ad d0 ff ff    	lea    eax,[ebx-0x2f53]
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
3000044c:	e8 19 1b 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000451:	05 47 2f 00 00       	add    eax,0x2f47
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:54
    malloc_cleanup();
30000456:	89 c3                	mov    ebx,eax
30000458:	e8 9f 04 00 00       	call   300008fc <malloc_cleanup>
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
3000046a:	e8 fb 1a 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
3000046f:	05 29 2f 00 00       	add    eax,0x2f29
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
3000049e:	e8 c7 1a 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
300004a3:	05 f5 2e 00 00       	add    eax,0x2ef5
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
300004d3:	e8 92 1a 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
300004d8:	05 c0 2e 00 00       	add    eax,0x2ec0
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
3000050a:	e8 5b 1a 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
3000050f:	05 89 2e 00 00       	add    eax,0x2e89
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
30000554:	e8 11 1a 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000559:	05 3f 2e 00 00       	add    eax,0x2e3f
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
30000571:	e8 f4 19 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000576:	05 22 2e 00 00       	add    eax,0x2e22
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
3000059e:	e8 c7 19 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
300005a3:	05 f5 2d 00 00       	add    eax,0x2df5
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
300005ce:	e8 97 19 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
300005d3:	05 c5 2d 00 00       	add    eax,0x2dc5
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
300005f4:	81 c3 a4 2d 00 00    	add    ebx,0x2da4
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
3000061d:	e8 7e 19 00 00       	call   30001fa0 <__x86.get_pc_thunk.ax+0x36>
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
3000062d:	e8 38 19 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000632:	05 66 2d 00 00       	add    eax,0x2d66
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:123
    return (char*)do_syscall3(SYSCALL_GETCWD,(uint32_t)buf,size);
30000637:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000063a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
3000063d:	50                   	push   eax
3000063e:	6a 4f                	push   0x4f
30000640:	e8 10 fd ff ff       	call   30000355 <do_syscall3>
30000645:	83 c4 0c             	add    esp,0xc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:124
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
3000064f:	e8 16 19 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000654:	05 44 2d 00 00       	add    eax,0x2d44
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
30000686:	e8 df 18 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
3000068b:	05 0d 2d 00 00       	add    eax,0x2d0d
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

VISIBLE void*  malloc(size_t size)
{
300006fc:	55                   	push   ebp
300006fd:	89 e5                	mov    ebp,esp
300006ff:	56                   	push   esi
30000700:	53                   	push   ebx
30000701:	83 ec 20             	sub    esp,0x20
30000704:	e8 bb 18 00 00       	call   30001fc4 <__x86.get_pc_thunk.si>
30000709:	81 c6 8f 2c 00 00    	add    esi,0x2c8f
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:46

    uint32_t needed;
    uint32_t allocatedPtr;
    heaprec_t* heapPtr;
    uint8_t* heapPtrNext;
    printdI(DEBUG_MALLOC,"malloc(0x%08X)\n",size);
3000070f:	83 ec 04             	sub    esp,0x4
30000712:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000715:	8d 86 7c fa ff ff    	lea    eax,[esi-0x584]
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
30000742:	8d 86 8c fa ff ff    	lea    eax,[esi-0x574]
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
30000780:	8d 86 a8 fa ff ff    	lea    eax,[esi-0x558]
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
300007b8:	8d 86 c4 fa ff ff    	lea    eax,[esi-0x53c]
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
300007fc:	8d 86 04 fb ff ff    	lea    eax,[esi-0x4fc]
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
3000081e:	8d 86 40 fb ff ff    	lea    eax,[esi-0x4c0]
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
30000863:	8d 86 68 fb ff ff    	lea    eax,[esi-0x498]
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
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:74
    //printDebug(DEBUG_MALLOC,"\n");
    return retVal;
300008b9:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:75
}
300008bc:	8d 65 f8             	lea    esp,[ebp-0x8]
300008bf:	5b                   	pop    ebx
300008c0:	5e                   	pop    esi
300008c1:	5d                   	pop    ebp
300008c2:	c3                   	ret    

300008c3 <free>:
free():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:78

VISIBLE void free(void* fpointer)
{
300008c3:	55                   	push   ebp
300008c4:	89 e5                	mov    ebp,esp
300008c6:	83 ec 10             	sub    esp,0x10
300008c9:	e8 9c 16 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
300008ce:	05 ca 2a 00 00       	add    eax,0x2aca
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:81
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if (fpointer==NULL)
300008d3:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
300008d7:	74 20                	je     300008f9 <free+0x36>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:83
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
    HEAP_CURR(fpointer,mp);
300008d9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300008dc:	83 e8 10             	sub    eax,0x10
300008df:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:86
    
    //printDebug(DEBUG_MALLOC,"libc_free: Freeing heap @ fp=0x%08X (mp=0x%08X)\n",fpointer,mp);
    if (mp->marker!=ALLOC_MARKER_VALUE)
300008e2:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300008e5:	8b 00                	mov    eax,DWORD PTR [eax]
300008e7:	3d d0 00 0f b0       	cmp    eax,0xb00f00d0
300008ec:	74 02                	je     300008f0 <free+0x2d>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:90 (discriminator 2)
    {
        //print("malloc: marker not found error!!!\n");
gotoHere:
        goto gotoHere;
300008ee:	eb fe                	jmp    300008ee <free+0x2b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:92
    }
    mp->inUse=false;
300008f0:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300008f3:	c6 40 08 00          	mov    BYTE PTR [eax+0x8],0x0
300008f7:	eb 01                	jmp    300008fa <free+0x37>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:82
VISIBLE void free(void* fpointer)
{
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if (fpointer==NULL)
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
300008f9:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:93
        //print("malloc: marker not found error!!!\n");
gotoHere:
        goto gotoHere;
    }
    mp->inUse=false;
}
300008fa:	c9                   	leave  
300008fb:	c3                   	ret    

300008fc <malloc_cleanup>:
malloc_cleanup():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:96

void malloc_cleanup()
{
300008fc:	55                   	push   ebp
300008fd:	89 e5                	mov    ebp,esp
300008ff:	53                   	push   ebx
30000900:	e8 65 16 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000905:	05 93 2a 00 00       	add    eax,0x2a93
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:97
    asm("mov eax,0x164\ncall sysEnter_Vector\n"::"b" (heapBase));
3000090a:	8b 80 f4 ff ff ff    	mov    eax,DWORD PTR [eax-0xc]
30000910:	8b 00                	mov    eax,DWORD PTR [eax]
30000912:	89 c3                	mov    ebx,eax
30000914:	b8 64 01 00 00       	mov    eax,0x164
30000919:	e8 fc ff ff ff       	call   3000091a <malloc_cleanup+0x1e>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:98
3000091e:	90                   	nop
3000091f:	5b                   	pop    ebx
30000920:	5d                   	pop    ebp
30000921:	c3                   	ret    
30000922:	66 90                	xchg   ax,ax

30000924 <memcpy>:
memcpy():
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:11
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
VISIBLE void * memcpy(void *dest, const void *src, size_t n)
{
30000924:	55                   	push   ebp
30000925:	89 e5                	mov    ebp,esp
30000927:	83 ec 20             	sub    esp,0x20
3000092a:	e8 3b 16 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
3000092f:	05 69 2a 00 00       	add    eax,0x2a69
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:14
    bool dw,dd;
    
    dd=n%4==0;
30000934:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000937:	83 e0 03             	and    eax,0x3
3000093a:	85 c0                	test   eax,eax
3000093c:	0f 94 c0             	sete   al
3000093f:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:15
    dw=n%2==0;
30000942:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000945:	83 e0 01             	and    eax,0x1
30000948:	85 c0                	test   eax,eax
3000094a:	0f 94 c0             	sete   al
3000094d:	88 45 e6             	mov    BYTE PTR [ebp-0x1a],al
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:16
    if (dd)
30000950:	80 7d e7 00          	cmp    BYTE PTR [ebp-0x19],0x0
30000954:	74 7d                	je     300009d3 <memcpy+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:18
    {
        n /=4;
30000956:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000959:	c1 e8 02             	shr    eax,0x2
3000095c:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:19
        const uint32_t *f = src;
3000095f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000962:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:20
        uint32_t *t = dest;
30000965:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000968:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:22

        if (f < t) {
3000096b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
3000096e:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
30000971:	73 4b                	jae    300009be <memcpy+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:23
                f += n;
30000973:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000976:	c1 e0 02             	shl    eax,0x2
30000979:	01 45 fc             	add    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:24
                t += n;
3000097c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
3000097f:	c1 e0 02             	shl    eax,0x2
30000982:	01 45 f8             	add    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:25
                while ( (n)-- > 0)
30000985:	eb 12                	jmp    30000999 <memcpy+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:26
                        *--t = *--f;
30000987:	83 6d f8 04          	sub    DWORD PTR [ebp-0x8],0x4
3000098b:	83 6d fc 04          	sub    DWORD PTR [ebp-0x4],0x4
3000098f:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000992:	8b 10                	mov    edx,DWORD PTR [eax]
30000994:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000997:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:25
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
30000999:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
3000099c:	8d 50 ff             	lea    edx,[eax-0x1]
3000099f:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
300009a2:	85 c0                	test   eax,eax
300009a4:	75 e1                	jne    30000987 <memcpy+0x63>
300009a6:	eb 23                	jmp    300009cb <memcpy+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:29
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
300009a8:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
300009ab:	8d 50 04             	lea    edx,[eax+0x4]
300009ae:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
300009b1:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
300009b4:	8d 4a 04             	lea    ecx,[edx+0x4]
300009b7:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
300009ba:	8b 12                	mov    edx,DWORD PTR [edx]
300009bc:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:28
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
300009be:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300009c1:	8d 50 ff             	lea    edx,[eax-0x1]
300009c4:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
300009c7:	85 c0                	test   eax,eax
300009c9:	75 dd                	jne    300009a8 <memcpy+0x84>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:30
                        *t++ = *f++;
        return dest;
300009cb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300009ce:	e9 ea 00 00 00       	jmp    30000abd <memcpy+0x199>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:32
    }
    else if (dw)
300009d3:	80 7d e6 00          	cmp    BYTE PTR [ebp-0x1a],0x0
300009d7:	74 79                	je     30000a52 <memcpy+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:34
    {
        n /=2;
300009d9:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300009dc:	d1 e8                	shr    eax,1
300009de:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:35
        const uint32_t *f = src;
300009e1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300009e4:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:36
        uint32_t *t = dest;
300009e7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300009ea:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:38

        if (f < t) {
300009ed:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300009f0:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
300009f3:	73 4b                	jae    30000a40 <memcpy+0x11c>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:39
                f += n;
300009f5:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300009f8:	c1 e0 02             	shl    eax,0x2
300009fb:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:40
                t += n;
300009fe:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a01:	c1 e0 02             	shl    eax,0x2
30000a04:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:41
                while ( (n)-- > 0)
30000a07:	eb 12                	jmp    30000a1b <memcpy+0xf7>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:42
                        *--t = *--f;
30000a09:	83 6d f0 04          	sub    DWORD PTR [ebp-0x10],0x4
30000a0d:	83 6d f4 04          	sub    DWORD PTR [ebp-0xc],0x4
30000a11:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000a14:	8b 10                	mov    edx,DWORD PTR [eax]
30000a16:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000a19:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:41
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
30000a1b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a1e:	8d 50 ff             	lea    edx,[eax-0x1]
30000a21:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000a24:	85 c0                	test   eax,eax
30000a26:	75 e1                	jne    30000a09 <memcpy+0xe5>
30000a28:	eb 23                	jmp    30000a4d <memcpy+0x129>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:45
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
30000a2a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000a2d:	8d 50 04             	lea    edx,[eax+0x4]
30000a30:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
30000a33:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
30000a36:	8d 4a 04             	lea    ecx,[edx+0x4]
30000a39:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
30000a3c:	8b 12                	mov    edx,DWORD PTR [edx]
30000a3e:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:44
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
30000a40:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a43:	8d 50 ff             	lea    edx,[eax-0x1]
30000a46:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000a49:	85 c0                	test   eax,eax
30000a4b:	75 dd                	jne    30000a2a <memcpy+0x106>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:46
                        *t++ = *f++;
        return dest;
30000a4d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000a50:	eb 6b                	jmp    30000abd <memcpy+0x199>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:50
    }
    else
    {
        const char *f = src;
30000a52:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000a55:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:51
        char *t = dest;
30000a58:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000a5b:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:53

        if (f < t) {
30000a5e:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a61:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
30000a64:	73 47                	jae    30000aad <memcpy+0x189>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:54
                f += n;
30000a66:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a69:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:55
                t += n;
30000a6c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a6f:	01 45 e8             	add    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:56
                while (n-- > 0)
30000a72:	eb 13                	jmp    30000a87 <memcpy+0x163>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:57
                        *--t = *--f;
30000a74:	83 6d e8 01          	sub    DWORD PTR [ebp-0x18],0x1
30000a78:	83 6d ec 01          	sub    DWORD PTR [ebp-0x14],0x1
30000a7c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a7f:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30000a82:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30000a85:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:56
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
30000a87:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000a8a:	8d 50 ff             	lea    edx,[eax-0x1]
30000a8d:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000a90:	85 c0                	test   eax,eax
30000a92:	75 e0                	jne    30000a74 <memcpy+0x150>
30000a94:	eb 24                	jmp    30000aba <memcpy+0x196>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:60
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
30000a96:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30000a99:	8d 50 01             	lea    edx,[eax+0x1]
30000a9c:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
30000a9f:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000aa2:	8d 4a 01             	lea    ecx,[edx+0x1]
30000aa5:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
30000aa8:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000aab:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:59
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
30000aad:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000ab0:	8d 50 ff             	lea    edx,[eax-0x1]
30000ab3:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000ab6:	85 c0                	test   eax,eax
30000ab8:	75 dc                	jne    30000a96 <memcpy+0x172>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:61
                        *t++ = *f++;
        return dest;
30000aba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:63
    }
}
30000abd:	c9                   	leave  
30000abe:	c3                   	ret    
30000abf:	90                   	nop

30000ac0 <memset>:
memset():
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:9
 * and open the template in the editor.
 */
#include "libChrisOS.h"

VISIBLE void *memset(void *d1, int val, size_t len)
{
30000ac0:	55                   	push   ebp
30000ac1:	89 e5                	mov    ebp,esp
30000ac3:	83 ec 20             	sub    esp,0x20
30000ac6:	e8 9f 14 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000acb:	05 cd 28 00 00       	add    eax,0x28cd
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:10
    uint8_t *d = d1;
30000ad0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000ad3:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:11
    uint16_t*e = d1;
30000ad6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000ad9:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:12
    uint16_t eVal=(val << 16) | (val << 8) | val;
30000adc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000adf:	c1 e0 10             	shl    eax,0x10
30000ae2:	89 c2                	mov    edx,eax
30000ae4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000ae7:	c1 e0 08             	shl    eax,0x8
30000aea:	09 c2                	or     edx,eax
30000aec:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000aef:	09 d0                	or     eax,edx
30000af1:	66 89 45 f2          	mov    WORD PTR [ebp-0xe],ax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:13
    uint32_t*f = d1;
30000af5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000af8:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:14
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
30000afb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000afe:	c1 e0 18             	shl    eax,0x18
30000b01:	89 c2                	mov    edx,eax
30000b03:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000b06:	c1 e0 10             	shl    eax,0x10
30000b09:	09 c2                	or     edx,eax
30000b0b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000b0e:	c1 e0 08             	shl    eax,0x8
30000b11:	09 d0                	or     eax,edx
30000b13:	0b 45 0c             	or     eax,DWORD PTR [ebp+0xc]
30000b16:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:16
    
    if ((len%4)==0)
30000b19:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b1c:	83 e0 03             	and    eax,0x3
30000b1f:	85 c0                	test   eax,eax
30000b21:	75 1c                	jne    30000b3f <memset+0x7f>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:17
    while (len-=4) {
30000b23:	eb 0e                	jmp    30000b33 <memset+0x73>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:18
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
30000b25:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000b28:	8d 50 04             	lea    edx,[eax+0x4]
30000b2b:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000b2e:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000b31:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:17
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
30000b33:	83 6d 10 04          	sub    DWORD PTR [ebp+0x10],0x4
30000b37:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000b3b:	75 e8                	jne    30000b25 <memset+0x65>
30000b3d:	eb 43                	jmp    30000b82 <memset+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:20
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
30000b3f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b42:	83 e0 01             	and    eax,0x1
30000b45:	85 c0                	test   eax,eax
30000b47:	75 2c                	jne    30000b75 <memset+0xb5>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:21
    while (len-=2) {
30000b49:	eb 10                	jmp    30000b5b <memset+0x9b>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:22
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
30000b4b:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000b4e:	8d 50 02             	lea    edx,[eax+0x2]
30000b51:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
30000b54:	0f b7 55 f2          	movzx  edx,WORD PTR [ebp-0xe]
30000b58:	66 89 10             	mov    WORD PTR [eax],dx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:21
    if ((len%4)==0)
    while (len-=4) {
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
    while (len-=2) {
30000b5b:	83 6d 10 02          	sub    DWORD PTR [ebp+0x10],0x2
30000b5f:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000b63:	75 e6                	jne    30000b4b <memset+0x8b>
30000b65:	eb 1b                	jmp    30000b82 <memset+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:26
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
        *d++ = val;
30000b67:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000b6a:	8d 50 01             	lea    edx,[eax+0x1]
30000b6d:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000b70:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000b73:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:25
    else if (((len%2)==0))
    while (len-=2) {
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
30000b75:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b78:	8d 50 ff             	lea    edx,[eax-0x1]
30000b7b:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000b7e:	85 c0                	test   eax,eax
30000b80:	75 e5                	jne    30000b67 <memset+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:28
        *d++ = val;
    }
    return d1;
30000b82:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:29
30000b85:	c9                   	leave  
30000b86:	c3                   	ret    
30000b87:	90                   	nop

30000b88 <readConsole>:
readConsole():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:16
file_operations_t fops;
inode_t console_node={.i_dev=1,.i_mode=0};
file_t console_file;

size_t readConsole (struct file * fptr, char *buffer, size_t size, uint64_t* whatever) 
{
30000b88:	55                   	push   ebp
30000b89:	89 e5                	mov    ebp,esp
30000b8b:	53                   	push   ebx
30000b8c:	83 ec 04             	sub    esp,0x4
30000b8f:	e8 d6 13 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000b94:	05 04 28 00 00       	add    eax,0x2804
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:17
    return gets(buffer,size,1);
30000b99:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
30000b9c:	83 ec 04             	sub    esp,0x4
30000b9f:	6a 01                	push   0x1
30000ba1:	52                   	push   edx
30000ba2:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000ba5:	89 c3                	mov    ebx,eax
30000ba7:	e8 e4 13 00 00       	call   30001f90 <__x86.get_pc_thunk.ax+0x26>
30000bac:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:18
}
30000baf:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000bb2:	c9                   	leave  
30000bb3:	c3                   	ret    

30000bb4 <writeConsole>:
writeConsole():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:21

size_t writeConsole(struct file * fptr, const char *buffer, size_t size, uint64_t *whatever)
{
30000bb4:	55                   	push   ebp
30000bb5:	89 e5                	mov    ebp,esp
30000bb7:	53                   	push   ebx
30000bb8:	83 ec 04             	sub    esp,0x4
30000bbb:	e8 aa 13 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000bc0:	05 d8 27 00 00       	add    eax,0x27d8
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:22
    return printI(buffer);
30000bc5:	83 ec 0c             	sub    esp,0xc
30000bc8:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000bcb:	89 c3                	mov    ebx,eax
30000bcd:	e8 c6 f8 ff ff       	call   30000498 <printI>
30000bd2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:23
}
30000bd5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000bd8:	c9                   	leave  
30000bd9:	c3                   	ret    

30000bda <ioInit>:
ioInit():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:26

void ioInit()
{
30000bda:	55                   	push   ebp
30000bdb:	89 e5                	mov    ebp,esp
30000bdd:	e8 88 13 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000be2:	05 b6 27 00 00       	add    eax,0x27b6
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:27
    console_file.f_inode=&console_node;
30000be7:	8b 90 ec ff ff ff    	mov    edx,DWORD PTR [eax-0x14]
30000bed:	8d 88 28 ff ff ff    	lea    ecx,[eax-0xd8]
30000bf3:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:28
    fops.read=readConsole;
30000bf6:	8b 90 e8 ff ff ff    	mov    edx,DWORD PTR [eax-0x18]
30000bfc:	8d 88 f0 d7 ff ff    	lea    ecx,[eax-0x2810]
30000c02:	89 0a                	mov    DWORD PTR [edx],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:29
    fops.write=writeConsole;
30000c04:	8b 90 e8 ff ff ff    	mov    edx,DWORD PTR [eax-0x18]
30000c0a:	8d 88 1c d8 ff ff    	lea    ecx,[eax-0x27e4]
30000c10:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:30
    console_file.fops=fops;
30000c13:	8b 88 ec ff ff ff    	mov    ecx,DWORD PTR [eax-0x14]
30000c19:	8b 80 e8 ff ff ff    	mov    eax,DWORD PTR [eax-0x18]
30000c1f:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
30000c22:	8b 00                	mov    eax,DWORD PTR [eax]
30000c24:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
30000c27:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:31
30000c2a:	90                   	nop
30000c2b:	5d                   	pop    ebp
30000c2c:	c3                   	ret    
30000c2d:	66 90                	xchg   ax,ax
30000c2f:	90                   	nop

30000c30 <strcat>:
strcat():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:30
   #endif
   
   /* Append SRC on the end of DEST.  */
   __attribute__((visibility("default"))) char *
   STRCAT (char *dest, const char *src)
   {
30000c30:	55                   	push   ebp
30000c31:	89 e5                	mov    ebp,esp
30000c33:	53                   	push   ebx
30000c34:	83 ec 04             	sub    esp,0x4
30000c37:	e8 84 13 00 00       	call   30001fc0 <__x86.get_pc_thunk.bx>
30000c3c:	81 c3 5c 27 00 00    	add    ebx,0x275c
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:31
     strcpy (dest + strlen (dest), src);
30000c42:	83 ec 0c             	sub    esp,0xc
30000c45:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000c48:	e8 63 13 00 00       	call   30001fb0 <__x86.get_pc_thunk.ax+0x46>
30000c4d:	83 c4 10             	add    esp,0x10
30000c50:	89 c2                	mov    edx,eax
30000c52:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000c55:	01 d0                	add    eax,edx
30000c57:	83 ec 08             	sub    esp,0x8
30000c5a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000c5d:	50                   	push   eax
30000c5e:	e8 1d 13 00 00       	call   30001f80 <__x86.get_pc_thunk.ax+0x16>
30000c63:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:32
     return dest;
30000c66:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:33
   }
30000c69:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000c6c:	c9                   	leave  
30000c6d:	c3                   	ret    

30000c6e <concatenate>:
concatenate():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:35

   void concatenate(char p[], char q[]) {
30000c6e:	55                   	push   ebp
30000c6f:	89 e5                	mov    ebp,esp
30000c71:	83 ec 10             	sub    esp,0x10
30000c74:	e8 f1 12 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000c79:	05 1f 27 00 00       	add    eax,0x271f
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:38
   int c, d;
 
   c = 0;
30000c7e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:40
 
   while (p[c] != '\0') {
30000c85:	eb 04                	jmp    30000c8b <concatenate+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:41
      c++;  	
30000c87:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:40
   void concatenate(char p[], char q[]) {
   int c, d;
 
   c = 0;
 
   while (p[c] != '\0') {
30000c8b:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000c8e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000c91:	01 d0                	add    eax,edx
30000c93:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000c96:	84 c0                	test   al,al
30000c98:	75 ed                	jne    30000c87 <concatenate+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:44
      c++;  	
   }
 
   d = 0;
30000c9a:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:46
 
   while (q[d] != '\0') {
30000ca1:	eb 1d                	jmp    30000cc0 <concatenate+0x52>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:47
      p[c] = q[d];
30000ca3:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000ca6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000ca9:	01 c2                	add    edx,eax
30000cab:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
30000cae:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cb1:	01 c8                	add    eax,ecx
30000cb3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000cb6:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:48
      d++;
30000cb8:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:49
      c++;	
30000cbc:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:46
      c++;  	
   }
 
   d = 0;
 
   while (q[d] != '\0') {
30000cc0:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30000cc3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cc6:	01 d0                	add    eax,edx
30000cc8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000ccb:	84 c0                	test   al,al
30000ccd:	75 d4                	jne    30000ca3 <concatenate+0x35>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:52
      p[c] = q[d];
      d++;
      c++;	
   }
 
   p[c] = '\0';
30000ccf:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000cd2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000cd5:	01 d0                	add    eax,edx
30000cd7:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:53
30000cda:	90                   	nop
30000cdb:	c9                   	leave  
30000cdc:	c3                   	ret    
30000cdd:	66 90                	xchg   ax,ax
30000cdf:	90                   	nop

30000ce0 <strcmp>:
strcmp():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:25

/* Compare S1 and S2, returning less than, equal to or
   greater than zero if S1 is lexicographically less than,
   equal to or greater than S2.  */
VISIBLE int strcmp (const char *p1, const char *p2)
{
30000ce0:	55                   	push   ebp
30000ce1:	89 e5                	mov    ebp,esp
30000ce3:	56                   	push   esi
30000ce4:	53                   	push   ebx
30000ce5:	83 ec 10             	sub    esp,0x10
30000ce8:	e8 7d 12 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000ced:	05 ab 26 00 00       	add    eax,0x26ab
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:26
  register const unsigned char *s1 = (const unsigned char *) p1;
30000cf2:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:27
  register const unsigned char *s2 = (const unsigned char *) p2;
30000cf5:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:32
  unsigned char c1, c2;

  do
    {
      c1 = (unsigned char) *s1++;
30000cf8:	89 d8                	mov    eax,ebx
30000cfa:	8d 58 01             	lea    ebx,[eax+0x1]
30000cfd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000d00:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:33
      c2 = (unsigned char) *s2++;
30000d03:	89 f0                	mov    eax,esi
30000d05:	8d 70 01             	lea    esi,[eax+0x1]
30000d08:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000d0b:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:34
      if (c1 == '\0')
30000d0e:	80 7d f7 00          	cmp    BYTE PTR [ebp-0x9],0x0
30000d12:	75 0e                	jne    30000d22 <strcmp+0x42>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:35
	return c1 - c2;
30000d14:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
30000d18:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30000d1c:	29 c2                	sub    edx,eax
30000d1e:	89 d0                	mov    eax,edx
30000d20:	eb 15                	jmp    30000d37 <strcmp+0x57>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:37
    }
  while (c1 == c2);
30000d22:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30000d26:	3a 45 f6             	cmp    al,BYTE PTR [ebp-0xa]
30000d29:	74 cd                	je     30000cf8 <strcmp+0x18>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:39

  return c1 - c2;
30000d2b:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
30000d2f:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30000d33:	29 c2                	sub    edx,eax
30000d35:	89 d0                	mov    eax,edx
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:40
}
30000d37:	83 c4 10             	add    esp,0x10
30000d3a:	5b                   	pop    ebx
30000d3b:	5e                   	pop    esi
30000d3c:	5d                   	pop    ebp
30000d3d:	c3                   	ret    
30000d3e:	66 90                	xchg   ax,ax

30000d40 <strcpy>:
strcpy():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:5
#include "strings.h"

__attribute__((visibility("default"))) char *
strcpy(char *s1, const char *s2)
{
30000d40:	55                   	push   ebp
30000d41:	89 e5                	mov    ebp,esp
30000d43:	83 ec 10             	sub    esp,0x10
30000d46:	e8 1f 12 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000d4b:	05 4d 26 00 00       	add    eax,0x264d
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:6
    char *s = s1;
30000d50:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000d53:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:7
    while ((*s++ = *s2++) != 0)
30000d56:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:7 (discriminator 1)
30000d57:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000d5a:	8d 50 01             	lea    edx,[eax+0x1]
30000d5d:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000d60:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000d63:	8d 4a 01             	lea    ecx,[edx+0x1]
30000d66:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
30000d69:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000d6c:	88 10                	mov    BYTE PTR [eax],dl
30000d6e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000d71:	84 c0                	test   al,al
30000d73:	75 e2                	jne    30000d57 <strcpy+0x17>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:9
	;
    *s=0;       //CLR 04/20/2017: Added terminating null character to returned string
30000d75:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000d78:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:10
    return (s1);
30000d7b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:11
}
30000d7e:	c9                   	leave  
30000d7f:	c3                   	ret    

30000d80 <strcpyc>:
strcpyc():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:15

__attribute__((visibility("default"))) char *
strcpyc(char *s1, const char *s2, unsigned count)
{
30000d80:	55                   	push   ebp
30000d81:	89 e5                	mov    ebp,esp
30000d83:	83 ec 10             	sub    esp,0x10
30000d86:	e8 df 11 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000d8b:	05 0d 26 00 00       	add    eax,0x260d
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:16
    char *s = s1;
30000d90:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000d93:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17
    while ((*s++ = *s2++) != 0 && count-->0)
30000d96:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17 (discriminator 2)
30000d97:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000d9a:	8d 50 01             	lea    edx,[eax+0x1]
30000d9d:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000da0:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000da3:	8d 4a 01             	lea    ecx,[edx+0x1]
30000da6:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
30000da9:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000dac:	88 10                	mov    BYTE PTR [eax],dl
30000dae:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000db1:	84 c0                	test   al,al
30000db3:	74 0d                	je     30000dc2 <strcpyc+0x42>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17 (discriminator 1)
30000db5:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000db8:	8d 50 ff             	lea    edx,[eax-0x1]
30000dbb:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000dbe:	85 c0                	test   eax,eax
30000dc0:	75 d5                	jne    30000d97 <strcpyc+0x17>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:19
	;
    return (s1);
30000dc2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:20
}
30000dc5:	c9                   	leave  
30000dc6:	c3                   	ret    
30000dc7:	90                   	nop

30000dc8 <strlen>:
strlen():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:3
#include <stddef.h>

__attribute__((visibility("default"))) size_t strlen(const char* str) {
30000dc8:	55                   	push   ebp
30000dc9:	89 e5                	mov    ebp,esp
30000dcb:	83 ec 10             	sub    esp,0x10
30000dce:	e8 97 11 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000dd3:	05 c5 25 00 00       	add    eax,0x25c5
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:4
          size_t ret = 0;
30000dd8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:5
        while ( str[ret] != 0 )
30000ddf:	eb 04                	jmp    30000de5 <strlen+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:6
                ret++;
30000de1:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:5
#include <stddef.h>

__attribute__((visibility("default"))) size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
30000de5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30000de8:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000deb:	01 d0                	add    eax,edx
30000ded:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000df0:	84 c0                	test   al,al
30000df2:	75 ed                	jne    30000de1 <strlen+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:7
                ret++;
        return ret;
30000df4:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:8
}
30000df7:	c9                   	leave  
30000df8:	c3                   	ret    
30000df9:	66 90                	xchg   ax,ax
30000dfb:	90                   	nop

30000dfc <strncmp>:
strncmp():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:13
 *   array pointed to by `s2'.  [4.11.4.4]
 */
#include <stddef.h>

__attribute__((visibility("default"))) int strncmp(const char *s1, const char *s2, size_t n)
{
30000dfc:	55                   	push   ebp
30000dfd:	89 e5                	mov    ebp,esp
30000dff:	e8 66 11 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000e04:	05 94 25 00 00       	add    eax,0x2594
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14
    for ( ; n > 0; s1++, s2++, --n)
30000e09:	eb 4b                	jmp    30000e56 <strncmp+0x5a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:15
	if (*s1 != *s2)
30000e0b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000e0e:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30000e11:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000e14:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000e17:	38 c2                	cmp    dl,al
30000e19:	74 1e                	je     30000e39 <strncmp+0x3d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
30000e1b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000e1e:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30000e21:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000e24:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000e27:	38 c2                	cmp    dl,al
30000e29:	73 07                	jae    30000e32 <strncmp+0x36>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16 (discriminator 1)
30000e2b:	b8 ff ff ff ff       	mov    eax,0xffffffff
30000e30:	eb 2f                	jmp    30000e61 <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16 (discriminator 2)
30000e32:	b8 01 00 00 00       	mov    eax,0x1
30000e37:	eb 28                	jmp    30000e61 <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:17
	else if (*s1 == '\0')
30000e39:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000e3c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000e3f:	84 c0                	test   al,al
30000e41:	75 07                	jne    30000e4a <strncmp+0x4e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:18
	    return 0;
30000e43:	b8 00 00 00 00       	mov    eax,0x0
30000e48:	eb 17                	jmp    30000e61 <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14
 */
#include <stddef.h>

__attribute__((visibility("default"))) int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
30000e4a:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
30000e4e:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
30000e52:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14 (discriminator 1)
30000e56:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000e5a:	75 af                	jne    30000e0b <strncmp+0xf>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:19
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
    return 0;
30000e5c:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:20
}
30000e61:	5d                   	pop    ebp
30000e62:	c3                   	ret    
30000e63:	90                   	nop

30000e64 <strncpy>:
strncpy():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:14
 *   The `strncpy' function returns the value of `s1'.  [4.11.2.4]
 */
#include <stddef.h>

__attribute__((visibility("default"))) char * strncpy(char *s1, const char *s2, size_t n)
{
30000e64:	55                   	push   ebp
30000e65:	89 e5                	mov    ebp,esp
30000e67:	83 ec 10             	sub    esp,0x10
30000e6a:	e8 fb 10 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000e6f:	05 29 25 00 00       	add    eax,0x2529
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:15
    char *s = s1;
30000e74:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000e77:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16
    while (n > 0 && *s2 != '\0') {
30000e7a:	eb 1b                	jmp    30000e97 <strncpy+0x33>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:17
	*s++ = *s2++;
30000e7c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000e7f:	8d 50 01             	lea    edx,[eax+0x1]
30000e82:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000e85:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000e88:	8d 4a 01             	lea    ecx,[edx+0x1]
30000e8b:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
30000e8e:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000e91:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:18
	--n;
30000e93:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16
#include <stddef.h>

__attribute__((visibility("default"))) char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
30000e97:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000e9b:	74 1c                	je     30000eb9 <strncpy+0x55>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16 (discriminator 1)
30000e9d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000ea0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000ea3:	84 c0                	test   al,al
30000ea5:	75 d5                	jne    30000e7c <strncpy+0x18>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:20
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
30000ea7:	eb 10                	jmp    30000eb9 <strncpy+0x55>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:21
	*s++ = '\0';
30000ea9:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000eac:	8d 50 01             	lea    edx,[eax+0x1]
30000eaf:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000eb2:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:22
	--n;
30000eb5:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:20
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
30000eb9:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000ebd:	75 ea                	jne    30000ea9 <strncpy+0x45>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:24
	*s++ = '\0';
	--n;
    }
    return s1;
30000ebf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:25
}
30000ec2:	c9                   	leave  
30000ec3:	c3                   	ret    

30000ec4 <strtoul>:
strtoul():
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:60
 * Ignores `locale' stuff.  Assumes that the upper and lower case
 * alphabets and digits are each contiguous.
 */
unsigned long
__attribute__((visibility("default"))) strtoul(const char *nptr, char **endptr, register int base)
{
30000ec4:	55                   	push   ebp
30000ec5:	89 e5                	mov    ebp,esp
30000ec7:	57                   	push   edi
30000ec8:	56                   	push   esi
30000ec9:	53                   	push   ebx
30000eca:	83 ec 08             	sub    esp,0x8
30000ecd:	e8 98 10 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30000ed2:	05 c6 24 00 00       	add    eax,0x24c6
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:61
	register const char *s = nptr;
30000ed7:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:65
	register unsigned long acc;
	register int c;
	register unsigned long cutoff;
	register int neg = 0, any, cutlim;
30000eda:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:71 (discriminator 1)

	/*
	 * See strtol for comments as to the logic used.
	 */
	do {
		c = *s++;
30000ee1:	89 f0                	mov    eax,esi
30000ee3:	8d 70 01             	lea    esi,[eax+0x1]
30000ee6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000ee9:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:72 (discriminator 1)
	} while (c==' ');
30000eec:	83 fb 20             	cmp    ebx,0x20
30000eef:	74 f0                	je     30000ee1 <strtoul+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:73
	if (c == '-') {
30000ef1:	83 fb 2d             	cmp    ebx,0x2d
30000ef4:	75 14                	jne    30000f0a <strtoul+0x46>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:74
		neg = 1;
30000ef6:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:75
		c = *s++;
30000efd:	89 f0                	mov    eax,esi
30000eff:	8d 70 01             	lea    esi,[eax+0x1]
30000f02:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f05:	0f be d8             	movsx  ebx,al
30000f08:	eb 10                	jmp    30000f1a <strtoul+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:76
	} else if (c == '+')
30000f0a:	83 fb 2b             	cmp    ebx,0x2b
30000f0d:	75 0b                	jne    30000f1a <strtoul+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:77
		c = *s++;
30000f0f:	89 f0                	mov    eax,esi
30000f11:	8d 70 01             	lea    esi,[eax+0x1]
30000f14:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f17:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78
	if ((base == 0 || base == 16) &&
30000f1a:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000f1e:	74 06                	je     30000f26 <strtoul+0x62>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78 (discriminator 2)
30000f20:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
30000f24:	75 26                	jne    30000f4c <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78 (discriminator 3)
30000f26:	83 fb 30             	cmp    ebx,0x30
30000f29:	75 21                	jne    30000f4c <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:79
	    c == '0' && (*s == 'x' || *s == 'X')) {
30000f2b:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30000f2e:	3c 78                	cmp    al,0x78
30000f30:	74 07                	je     30000f39 <strtoul+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:79 (discriminator 1)
30000f32:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30000f35:	3c 58                	cmp    al,0x58
30000f37:	75 13                	jne    30000f4c <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:80
		c = s[1];
30000f39:	8d 46 01             	lea    eax,[esi+0x1]
30000f3c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f3f:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:81
		s += 2;
30000f42:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:82
		base = 16;
30000f45:	c7 45 10 10 00 00 00 	mov    DWORD PTR [ebp+0x10],0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:84
	}
	if (base == 0)
30000f4c:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000f50:	75 14                	jne    30000f66 <strtoul+0xa2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85
		base = c == '0' ? 8 : 10;
30000f52:	83 fb 30             	cmp    ebx,0x30
30000f55:	75 07                	jne    30000f5e <strtoul+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 1)
30000f57:	b8 08 00 00 00       	mov    eax,0x8
30000f5c:	eb 05                	jmp    30000f63 <strtoul+0x9f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 2)
30000f5e:	b8 0a 00 00 00       	mov    eax,0xa
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 4)
30000f63:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:86
	cutoff = (unsigned long)ULONG_MAX / (unsigned long)base;
30000f66:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30000f69:	b8 ff ff ff ff       	mov    eax,0xffffffff
30000f6e:	ba 00 00 00 00       	mov    edx,0x0
30000f73:	f7 f1                	div    ecx
30000f75:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:87
	cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;
30000f78:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30000f7b:	b8 ff ff ff ff       	mov    eax,0xffffffff
30000f80:	ba 00 00 00 00       	mov    edx,0x0
30000f85:	f7 f1                	div    ecx
30000f87:	89 d0                	mov    eax,edx
30000f89:	89 c2                	mov    edx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:88
	for (acc = 0, any = 0;; c = *s++) {
30000f8b:	bf 00 00 00 00       	mov    edi,0x0
30000f90:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:89
		if (ISDIGIT(c))
30000f95:	8d 43 d0             	lea    eax,[ebx-0x30]
30000f98:	83 f8 09             	cmp    eax,0x9
30000f9b:	77 05                	ja     30000fa2 <strtoul+0xde>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:90
			c -= '0';
30000f9d:	83 eb 30             	sub    ebx,0x30
30000fa0:	eb 25                	jmp    30000fc7 <strtoul+0x103>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:91
		else if (ISALPHA(c))
30000fa2:	89 d8                	mov    eax,ebx
30000fa4:	83 c8 20             	or     eax,0x20
30000fa7:	83 e8 61             	sub    eax,0x61
30000faa:	83 f8 19             	cmp    eax,0x19
30000fad:	77 56                	ja     30001005 <strtoul+0x141>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
30000faf:	83 fb 40             	cmp    ebx,0x40
30000fb2:	7e 0c                	jle    30000fc0 <strtoul+0xfc>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 1)
30000fb4:	83 fb 5a             	cmp    ebx,0x5a
30000fb7:	7f 07                	jg     30000fc0 <strtoul+0xfc>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 3)
30000fb9:	b8 37 00 00 00       	mov    eax,0x37
30000fbe:	eb 05                	jmp    30000fc5 <strtoul+0x101>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 4)
30000fc0:	b8 57 00 00 00       	mov    eax,0x57
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 6)
30000fc5:	29 c3                	sub    ebx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:95
		else
			break;
		if (c >= base)
30000fc7:	3b 5d 10             	cmp    ebx,DWORD PTR [ebp+0x10]
30000fca:	7d 3c                	jge    30001008 <strtoul+0x144>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97
			break;
		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
30000fcc:	89 c8                	mov    eax,ecx
30000fce:	85 c0                	test   eax,eax
30000fd0:	78 10                	js     30000fe2 <strtoul+0x11e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 1)
30000fd2:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30000fd5:	77 0b                	ja     30000fe2 <strtoul+0x11e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 2)
30000fd7:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30000fda:	75 0d                	jne    30000fe9 <strtoul+0x125>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 3)
30000fdc:	89 d0                	mov    eax,edx
30000fde:	39 c3                	cmp    ebx,eax
30000fe0:	7e 07                	jle    30000fe9 <strtoul+0x125>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:98
			any = -1;
30000fe2:	b9 ff ff ff ff       	mov    ecx,0xffffffff
30000fe7:	eb 0f                	jmp    30000ff8 <strtoul+0x134>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:100
		else {
			any = 1;
30000fe9:	b9 01 00 00 00       	mov    ecx,0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:101
			acc *= base;
30000fee:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000ff1:	0f af f8             	imul   edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:102
			acc += c;
30000ff4:	89 d8                	mov    eax,ebx
30000ff6:	01 c7                	add    edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:88
	}
	if (base == 0)
		base = c == '0' ? 8 : 10;
	cutoff = (unsigned long)ULONG_MAX / (unsigned long)base;
	cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;
	for (acc = 0, any = 0;; c = *s++) {
30000ff8:	89 f0                	mov    eax,esi
30000ffa:	8d 70 01             	lea    esi,[eax+0x1]
30000ffd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001000:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:104
		else {
			any = 1;
			acc *= base;
			acc += c;
		}
	}
30001003:	eb 90                	jmp    30000f95 <strtoul+0xd1>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:94
		if (ISDIGIT(c))
			c -= '0';
		else if (ISALPHA(c))
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
		else
			break;
30001005:	90                   	nop
30001006:	eb 01                	jmp    30001009 <strtoul+0x145>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:96
		if (c >= base)
			break;
30001008:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:105
			any = 1;
			acc *= base;
			acc += c;
		}
	}
	if (any < 0) {
30001009:	89 c8                	mov    eax,ecx
3000100b:	85 c0                	test   eax,eax
3000100d:	79 07                	jns    30001016 <strtoul+0x152>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:106
		acc = ULONG_MAX;
3000100f:	bf ff ff ff ff       	mov    edi,0xffffffff
30001014:	eb 08                	jmp    3000101e <strtoul+0x15a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:107
	} else if (neg)
30001016:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
3000101a:	74 02                	je     3000101e <strtoul+0x15a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:108
		acc = -acc;
3000101c:	f7 df                	neg    edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:109
	if (endptr != 0)
3000101e:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
30001022:	74 13                	je     30001037 <strtoul+0x173>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110
		*endptr = (char *) (any ? s - 1 : nptr);
30001024:	89 c8                	mov    eax,ecx
30001026:	85 c0                	test   eax,eax
30001028:	74 05                	je     3000102f <strtoul+0x16b>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 1)
3000102a:	8d 46 ff             	lea    eax,[esi-0x1]
3000102d:	eb 03                	jmp    30001032 <strtoul+0x16e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 2)
3000102f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 4)
30001032:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001035:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:111
	return (acc);
30001037:	89 f8                	mov    eax,edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:112
}
30001039:	83 c4 08             	add    esp,0x8
3000103c:	5b                   	pop    ebx
3000103d:	5e                   	pop    esi
3000103e:	5f                   	pop    edi
3000103f:	5d                   	pop    ebp
30001040:	c3                   	ret    
30001041:	66 90                	xchg   ax,ax
30001043:	90                   	nop

30001044 <strleft>:
strleft():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:2
__attribute__((visibility("default"))) char* strleft(char* val, int cnt)
{
30001044:	55                   	push   ebp
30001045:	89 e5                	mov    ebp,esp
30001047:	e8 1e 0f 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
3000104c:	05 4c 23 00 00       	add    eax,0x234c
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:3
    val[cnt]='\0';
30001051:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001054:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001057:	01 d0                	add    eax,edx
30001059:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:4
    return val;
3000105c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:5
}
3000105f:	5d                   	pop    ebp
30001060:	c3                   	ret    
30001061:	66 90                	xchg   ax,ax
30001063:	90                   	nop

30001064 <strtol>:
strtol():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:88
 * Ignores `locale' stuff.  Assumes that the upper and lower case
 * alphabets and digits are each contiguous.
 */
__attribute__((visibility("default"))) long
strtol(const char *nptr, char **endptr, register int base)
{
30001064:	55                   	push   ebp
30001065:	89 e5                	mov    ebp,esp
30001067:	57                   	push   edi
30001068:	56                   	push   esi
30001069:	53                   	push   ebx
3000106a:	83 ec 0c             	sub    esp,0xc
3000106d:	e8 f8 0e 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
30001072:	05 26 23 00 00       	add    eax,0x2326
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:89
	register const char *s = nptr;
30001077:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:93
	register unsigned long acc;
	register int c;
	register unsigned long cutoff;
	register int neg = 0, any, cutlim;
3000107a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:101 (discriminator 1)
	 * Skip white space and pick up leading +/- sign if any.
	 * If base is 0, allow 0x for hex and 0 for octal, else
	 * assume decimal; if base is already 16, allow 0x.
	 */
	do {
		c = *s++;
30001081:	89 f0                	mov    eax,esi
30001083:	8d 70 01             	lea    esi,[eax+0x1]
30001086:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001089:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:102 (discriminator 1)
	} while (c==' ');
3000108c:	83 fb 20             	cmp    ebx,0x20
3000108f:	74 f0                	je     30001081 <strtol+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:103
	if (c == '-') {
30001091:	83 fb 2d             	cmp    ebx,0x2d
30001094:	75 14                	jne    300010aa <strtol+0x46>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:104
		neg = 1;
30001096:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:105
		c = *s++;
3000109d:	89 f0                	mov    eax,esi
3000109f:	8d 70 01             	lea    esi,[eax+0x1]
300010a2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300010a5:	0f be d8             	movsx  ebx,al
300010a8:	eb 10                	jmp    300010ba <strtol+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:106
	} else if (c == '+')
300010aa:	83 fb 2b             	cmp    ebx,0x2b
300010ad:	75 0b                	jne    300010ba <strtol+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:107
		c = *s++;
300010af:	89 f0                	mov    eax,esi
300010b1:	8d 70 01             	lea    esi,[eax+0x1]
300010b4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300010b7:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108
	if ((base == 0 || base == 16) &&
300010ba:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
300010be:	74 06                	je     300010c6 <strtol+0x62>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108 (discriminator 2)
300010c0:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
300010c4:	75 26                	jne    300010ec <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108 (discriminator 3)
300010c6:	83 fb 30             	cmp    ebx,0x30
300010c9:	75 21                	jne    300010ec <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:109
	    c == '0' && (*s == 'x' || *s == 'X')) {
300010cb:	0f b6 06             	movzx  eax,BYTE PTR [esi]
300010ce:	3c 78                	cmp    al,0x78
300010d0:	74 07                	je     300010d9 <strtol+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:109 (discriminator 1)
300010d2:	0f b6 06             	movzx  eax,BYTE PTR [esi]
300010d5:	3c 58                	cmp    al,0x58
300010d7:	75 13                	jne    300010ec <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:110
		c = s[1];
300010d9:	8d 46 01             	lea    eax,[esi+0x1]
300010dc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300010df:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:111
		s += 2;
300010e2:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:112
		base = 16;
300010e5:	c7 45 10 10 00 00 00 	mov    DWORD PTR [ebp+0x10],0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:114
	}
	if (base == 0)
300010ec:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
300010f0:	75 14                	jne    30001106 <strtol+0xa2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115
		base = c == '0' ? 8 : 10;
300010f2:	83 fb 30             	cmp    ebx,0x30
300010f5:	75 07                	jne    300010fe <strtol+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 1)
300010f7:	b8 08 00 00 00       	mov    eax,0x8
300010fc:	eb 05                	jmp    30001103 <strtol+0x9f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 2)
300010fe:	b8 0a 00 00 00       	mov    eax,0xa
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 4)
30001103:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134
	 * the number is too big, and we will return a range error.
	 *
	 * Set any if any `digits' consumed; make it negative to indicate
	 * overflow.
	 */
	cutoff = neg ? -(unsigned long)LONG_MIN : LONG_MAX;
30001106:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
3000110a:	74 07                	je     30001113 <strtol+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134 (discriminator 1)
3000110c:	b8 00 00 00 80       	mov    eax,0x80000000
30001111:	eb 05                	jmp    30001118 <strtol+0xb4>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134 (discriminator 2)
30001113:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:135 (discriminator 4)
	cutlim = cutoff % (unsigned long)base;
30001118:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
3000111b:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
3000111e:	ba 00 00 00 00       	mov    edx,0x0
30001123:	f7 f1                	div    ecx
30001125:	89 d1                	mov    ecx,edx
30001127:	89 c8                	mov    eax,ecx
30001129:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:136 (discriminator 4)
	cutoff /= (unsigned long)base;
3000112c:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
3000112f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001132:	ba 00 00 00 00       	mov    edx,0x0
30001137:	f7 f7                	div    edi
30001139:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:137 (discriminator 4)
	for (acc = 0, any = 0;; c = *s++) {
3000113c:	bf 00 00 00 00       	mov    edi,0x0
30001141:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:138
		if (ISDIGIT(c))
30001146:	8d 43 d0             	lea    eax,[ebx-0x30]
30001149:	83 f8 09             	cmp    eax,0x9
3000114c:	77 05                	ja     30001153 <strtol+0xef>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:139
			c -= '0';
3000114e:	83 eb 30             	sub    ebx,0x30
30001151:	eb 25                	jmp    30001178 <strtol+0x114>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:140
		else if (ISALPHA(c))
30001153:	89 d8                	mov    eax,ebx
30001155:	83 c8 20             	or     eax,0x20
30001158:	83 e8 61             	sub    eax,0x61
3000115b:	83 f8 19             	cmp    eax,0x19
3000115e:	77 55                	ja     300011b5 <strtol+0x151>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
30001160:	83 fb 40             	cmp    ebx,0x40
30001163:	7e 0c                	jle    30001171 <strtol+0x10d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 1)
30001165:	83 fb 5a             	cmp    ebx,0x5a
30001168:	7f 07                	jg     30001171 <strtol+0x10d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 3)
3000116a:	b8 37 00 00 00       	mov    eax,0x37
3000116f:	eb 05                	jmp    30001176 <strtol+0x112>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 4)
30001171:	b8 57 00 00 00       	mov    eax,0x57
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 6)
30001176:	29 c3                	sub    ebx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:144
		else
			break;
		if (c >= base)
30001178:	3b 5d 10             	cmp    ebx,DWORD PTR [ebp+0x10]
3000117b:	7d 3b                	jge    300011b8 <strtol+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146
			break;
		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
3000117d:	89 c8                	mov    eax,ecx
3000117f:	85 c0                	test   eax,eax
30001181:	78 0f                	js     30001192 <strtol+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 1)
30001183:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30001186:	77 0a                	ja     30001192 <strtol+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 2)
30001188:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
3000118b:	75 0c                	jne    30001199 <strtol+0x135>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 3)
3000118d:	3b 5d e8             	cmp    ebx,DWORD PTR [ebp-0x18]
30001190:	7e 07                	jle    30001199 <strtol+0x135>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:147
			any = -1;
30001192:	b9 ff ff ff ff       	mov    ecx,0xffffffff
30001197:	eb 0f                	jmp    300011a8 <strtol+0x144>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:149
		else {
			any = 1;
30001199:	b9 01 00 00 00       	mov    ecx,0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:150
			acc *= base;
3000119e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300011a1:	0f af f8             	imul   edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:151
			acc += c;
300011a4:	89 d8                	mov    eax,ebx
300011a6:	01 c7                	add    edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:137
	 * overflow.
	 */
	cutoff = neg ? -(unsigned long)LONG_MIN : LONG_MAX;
	cutlim = cutoff % (unsigned long)base;
	cutoff /= (unsigned long)base;
	for (acc = 0, any = 0;; c = *s++) {
300011a8:	89 f0                	mov    eax,esi
300011aa:	8d 70 01             	lea    esi,[eax+0x1]
300011ad:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300011b0:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:153
		else {
			any = 1;
			acc *= base;
			acc += c;
		}
	}
300011b3:	eb 91                	jmp    30001146 <strtol+0xe2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:143
		if (ISDIGIT(c))
			c -= '0';
		else if (ISALPHA(c))
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
		else
			break;
300011b5:	90                   	nop
300011b6:	eb 01                	jmp    300011b9 <strtol+0x155>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:145
		if (c >= base)
			break;
300011b8:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:154
			any = 1;
			acc *= base;
			acc += c;
		}
	}
	if (any < 0) {
300011b9:	89 c8                	mov    eax,ecx
300011bb:	85 c0                	test   eax,eax
300011bd:	79 16                	jns    300011d5 <strtol+0x171>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155
		acc = neg ? LONG_MIN : LONG_MAX;
300011bf:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
300011c3:	74 07                	je     300011cc <strtol+0x168>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 1)
300011c5:	b8 00 00 00 80       	mov    eax,0x80000000
300011ca:	eb 05                	jmp    300011d1 <strtol+0x16d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 2)
300011cc:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 4)
300011d1:	89 c7                	mov    edi,eax
300011d3:	eb 08                	jmp    300011dd <strtol+0x179>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:156
	} else if (neg)
300011d5:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
300011d9:	74 02                	je     300011dd <strtol+0x179>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:157
		acc = -acc;
300011db:	f7 df                	neg    edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:158
	if (endptr != 0)
300011dd:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
300011e1:	74 13                	je     300011f6 <strtol+0x192>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159
		*endptr = (char *) (any ? s - 1 : nptr);
300011e3:	89 c8                	mov    eax,ecx
300011e5:	85 c0                	test   eax,eax
300011e7:	74 05                	je     300011ee <strtol+0x18a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 1)
300011e9:	8d 46 ff             	lea    eax,[esi-0x1]
300011ec:	eb 03                	jmp    300011f1 <strtol+0x18d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 2)
300011ee:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 4)
300011f1:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
300011f4:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:160
	return (acc);
300011f6:	89 f8                	mov    eax,edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:161
}
300011f8:	83 c4 0c             	add    esp,0xc
300011fb:	5b                   	pop    ebx
300011fc:	5e                   	pop    esi
300011fd:	5f                   	pop    edi
300011fe:	5d                   	pop    ebp
300011ff:	c3                   	ret    

30001200 <strtrim>:
strtrim():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:5
#include "strings.h"

/*FROM: http://codereview.stackexchange.com/questions/20897/trim-function-in-c*/
__attribute__((visibility("default"))) char * strtrim(char * *pointerToString)
{
30001200:	55                   	push   ebp
30001201:	89 e5                	mov    ebp,esp
30001203:	53                   	push   ebx
30001204:	83 ec 14             	sub    esp,0x14
30001207:	e8 b4 0d 00 00       	call   30001fc0 <__x86.get_pc_thunk.bx>
3000120c:	81 c3 8c 21 00 00    	add    ebx,0x218c
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:6
    uint8_t start=0, length=0;
30001212:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
30001216:	c6 45 f5 00          	mov    BYTE PTR [ebp-0xb],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:9

        // Trim.Start:
        length = strlen(*pointerToString);
3000121a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000121d:	8b 00                	mov    eax,DWORD PTR [eax]
3000121f:	83 ec 0c             	sub    esp,0xc
30001222:	50                   	push   eax
30001223:	e8 88 0d 00 00       	call   30001fb0 <__x86.get_pc_thunk.ax+0x46>
30001228:	83 c4 10             	add    esp,0x10
3000122b:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10
        while ((*pointerToString)[start]==' ') start++;
3000122e:	eb 0a                	jmp    3000123a <strtrim+0x3a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10 (discriminator 2)
30001230:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001234:	83 c0 01             	add    eax,0x1
30001237:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10 (discriminator 1)
3000123a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000123d:	8b 10                	mov    edx,DWORD PTR [eax]
3000123f:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001243:	01 d0                	add    eax,edx
30001245:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001248:	3c 20                	cmp    al,0x20
3000124a:	74 e4                	je     30001230 <strtrim+0x30>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:11
        (*pointerToString) += start;
3000124c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000124f:	8b 10                	mov    edx,DWORD PTR [eax]
30001251:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001255:	01 c2                	add    edx,eax
30001257:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000125a:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:13

        if (start < length) // Required for empty (ex. "    ") input
3000125c:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001260:	3a 45 f5             	cmp    al,BYTE PTR [ebp-0xb]
30001263:	73 46                	jae    300012ab <strtrim+0xab>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:16
        {
            // Trim.End:
            uint8_t end = strlen(*pointerToString)-1; // Get string length again (after Trim.Start)
30001265:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001268:	8b 00                	mov    eax,DWORD PTR [eax]
3000126a:	83 ec 0c             	sub    esp,0xc
3000126d:	50                   	push   eax
3000126e:	e8 3d 0d 00 00       	call   30001fb0 <__x86.get_pc_thunk.ax+0x46>
30001273:	83 c4 10             	add    esp,0x10
30001276:	83 e8 01             	sub    eax,0x1
30001279:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:17
            while ((*pointerToString)[end]==' ') end--;
3000127c:	eb 0a                	jmp    30001288 <strtrim+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:17 (discriminator 2)
3000127e:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30001282:	83 e8 01             	sub    eax,0x1
30001285:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:17 (discriminator 1)
30001288:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000128b:	8b 10                	mov    edx,DWORD PTR [eax]
3000128d:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30001291:	01 d0                	add    eax,edx
30001293:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001296:	3c 20                	cmp    al,0x20
30001298:	74 e4                	je     3000127e <strtrim+0x7e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:18
            (*pointerToString)[end+1] = 0;
3000129a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000129d:	8b 00                	mov    eax,DWORD PTR [eax]
3000129f:	0f b6 55 f6          	movzx  edx,BYTE PTR [ebp-0xa]
300012a3:	83 c2 01             	add    edx,0x1
300012a6:	01 d0                	add    eax,edx
300012a8:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:21
        }

    return *pointerToString;
300012ab:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300012ae:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:22
}
300012b0:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300012b3:	c9                   	leave  
300012b4:	c3                   	ret    

300012b5 <strtrim2>:
strtrim2():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:25

__attribute__((visibility("default"))) char * strtrim2(char* pointerToString)
{
300012b5:	55                   	push   ebp
300012b6:	89 e5                	mov    ebp,esp
300012b8:	53                   	push   ebx
300012b9:	83 ec 14             	sub    esp,0x14
300012bc:	e8 ff 0c 00 00       	call   30001fc0 <__x86.get_pc_thunk.bx>
300012c1:	81 c3 d7 20 00 00    	add    ebx,0x20d7
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:26
    uint8_t start=0, length=0;
300012c7:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
300012cb:	c6 45 f5 00          	mov    BYTE PTR [ebp-0xb],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:29

        // Trim.Start:
        length = strlen(pointerToString);
300012cf:	83 ec 0c             	sub    esp,0xc
300012d2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
300012d5:	e8 d6 0c 00 00       	call   30001fb0 <__x86.get_pc_thunk.ax+0x46>
300012da:	83 c4 10             	add    esp,0x10
300012dd:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:30
        while ((pointerToString)[start]==' ') start++;
300012e0:	eb 0a                	jmp    300012ec <strtrim2+0x37>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:30 (discriminator 2)
300012e2:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
300012e6:	83 c0 01             	add    eax,0x1
300012e9:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:30 (discriminator 1)
300012ec:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
300012f0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300012f3:	01 d0                	add    eax,edx
300012f5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300012f8:	3c 20                	cmp    al,0x20
300012fa:	74 e6                	je     300012e2 <strtrim2+0x2d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:31
        (pointerToString) += start;
300012fc:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001300:	01 45 08             	add    DWORD PTR [ebp+0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:33

        if (start < length) // Required for empty (ex. "    ") input
30001303:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
30001307:	3a 45 f5             	cmp    al,BYTE PTR [ebp-0xb]
3000130a:	73 3f                	jae    3000134b <strtrim2+0x96>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:36
        {
            // Trim.End:
            uint8_t end = strlen(pointerToString)-1; // Get string length again (after Trim.Start)
3000130c:	83 ec 0c             	sub    esp,0xc
3000130f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30001312:	e8 99 0c 00 00       	call   30001fb0 <__x86.get_pc_thunk.ax+0x46>
30001317:	83 c4 10             	add    esp,0x10
3000131a:	83 e8 01             	sub    eax,0x1
3000131d:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:37
            while ((pointerToString)[end]==' ') end--;
30001320:	eb 0a                	jmp    3000132c <strtrim2+0x77>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:37 (discriminator 2)
30001322:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30001326:	83 e8 01             	sub    eax,0x1
30001329:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:37 (discriminator 1)
3000132c:	0f b6 55 f6          	movzx  edx,BYTE PTR [ebp-0xa]
30001330:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001333:	01 d0                	add    eax,edx
30001335:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001338:	3c 20                	cmp    al,0x20
3000133a:	74 e6                	je     30001322 <strtrim2+0x6d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:38
            (pointerToString)[end+1] = 0;
3000133c:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30001340:	8d 50 01             	lea    edx,[eax+0x1]
30001343:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001346:	01 d0                	add    eax,edx
30001348:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:41
        }

    return pointerToString;
3000134b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:42
}
3000134e:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30001351:	c9                   	leave  
30001352:	c3                   	ret    
30001353:	90                   	nop

30001354 <time>:
time():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:47
  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
  {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
};

VISIBLE time_t time(/*time_t* arg*/)
{
30001354:	55                   	push   ebp
30001355:	89 e5                	mov    ebp,esp
30001357:	83 ec 10             	sub    esp,0x10
3000135a:	e8 0b 0c 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
3000135f:	05 39 20 00 00       	add    eax,0x2039
/home/yogi/src/os/aproj/libChrisOS/src/time.c:48
    uint32_t retVal=0;
30001364:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49
    __asm__("call sysEnter_Vector\n":"=a" (retVal):"a" (SYSCALL_GETTICKS));
3000136b:	b8 70 01 00 00       	mov    eax,0x170
30001370:	e8 fc ff ff ff       	call   30001371 <time+0x1d>
30001375:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50
    return (time_t)retVal;
30001378:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:51
}
3000137b:	c9                   	leave  
3000137c:	c3                   	ret    

3000137d <gmtime_r>:
gmtime_r():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:54


VISIBLE struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
3000137d:	55                   	push   ebp
3000137e:	89 e5                	mov    ebp,esp
30001380:	53                   	push   ebx
30001381:	83 ec 10             	sub    esp,0x10
30001384:	e8 37 0c 00 00       	call   30001fc0 <__x86.get_pc_thunk.bx>
30001389:	81 c3 0f 20 00 00    	add    ebx,0x200f
/home/yogi/src/os/aproj/libChrisOS/src/time.c:55
  time_t time = *timer;
3000138f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001392:	8b 00                	mov    eax,DWORD PTR [eax]
30001394:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:57
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;
30001397:	c7 45 f4 b2 07 00 00 	mov    DWORD PTR [ebp-0xc],0x7b2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:59

  dayclock = (unsigned long) time % SECS_DAY;
3000139e:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
300013a1:	ba 07 45 2e c2       	mov    edx,0xc22e4507
300013a6:	89 c8                	mov    eax,ecx
300013a8:	f7 e2                	mul    edx
300013aa:	89 d0                	mov    eax,edx
300013ac:	c1 e8 10             	shr    eax,0x10
300013af:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
300013b2:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
300013b5:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
300013bb:	29 c1                	sub    ecx,eax
300013bd:	89 c8                	mov    eax,ecx
300013bf:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:60
  dayno = (unsigned long) time / SECS_DAY;
300013c2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
300013c5:	ba 07 45 2e c2       	mov    edx,0xc22e4507
300013ca:	f7 e2                	mul    edx
300013cc:	89 d0                	mov    eax,edx
300013ce:	c1 e8 10             	shr    eax,0x10
300013d1:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:62

  tmbuf->tm_sec = dayclock % 60;
300013d4:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
300013d7:	ba 89 88 88 88       	mov    edx,0x88888889
300013dc:	89 c8                	mov    eax,ecx
300013de:	f7 e2                	mul    edx
300013e0:	89 d0                	mov    eax,edx
300013e2:	c1 e8 05             	shr    eax,0x5
300013e5:	89 c2                	mov    edx,eax
300013e7:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
300013ee:	89 c2                	mov    edx,eax
300013f0:	89 d0                	mov    eax,edx
300013f2:	c1 e0 04             	shl    eax,0x4
300013f5:	29 d0                	sub    eax,edx
300013f7:	29 c1                	sub    ecx,eax
300013f9:	89 c8                	mov    eax,ecx
300013fb:	89 c2                	mov    edx,eax
300013fd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001400:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:63
  tmbuf->tm_min = (dayclock % 3600) / 60;
30001402:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
30001405:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
3000140a:	89 c8                	mov    eax,ecx
3000140c:	f7 e2                	mul    edx
3000140e:	89 d0                	mov    eax,edx
30001410:	c1 e8 0b             	shr    eax,0xb
30001413:	69 c0 10 0e 00 00    	imul   eax,eax,0xe10
30001419:	29 c1                	sub    ecx,eax
3000141b:	89 c8                	mov    eax,ecx
3000141d:	ba 89 88 88 88       	mov    edx,0x88888889
30001422:	f7 e2                	mul    edx
30001424:	89 d0                	mov    eax,edx
30001426:	c1 e8 05             	shr    eax,0x5
30001429:	89 c2                	mov    edx,eax
3000142b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000142e:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:64
  tmbuf->tm_hour = dayclock / 3600;
30001431:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001434:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
30001439:	f7 e2                	mul    edx
3000143b:	89 d0                	mov    eax,edx
3000143d:	c1 e8 0b             	shr    eax,0xb
30001440:	89 c2                	mov    edx,eax
30001442:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001445:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:65
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
30001448:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
3000144b:	8d 48 04             	lea    ecx,[eax+0x4]
3000144e:	ba 25 49 92 24       	mov    edx,0x24924925
30001453:	89 c8                	mov    eax,ecx
30001455:	f7 e2                	mul    edx
30001457:	89 c8                	mov    eax,ecx
30001459:	29 d0                	sub    eax,edx
3000145b:	d1 e8                	shr    eax,1
3000145d:	01 d0                	add    eax,edx
3000145f:	c1 e8 02             	shr    eax,0x2
30001462:	89 c2                	mov    edx,eax
30001464:	c1 e2 03             	shl    edx,0x3
30001467:	29 c2                	sub    edx,eax
30001469:	89 c8                	mov    eax,ecx
3000146b:	29 d0                	sub    eax,edx
3000146d:	89 c2                	mov    edx,eax
3000146f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001472:	89 50 18             	mov    DWORD PTR [eax+0x18],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66
  while (dayno >= (unsigned long) YEARSIZE(year)) {
30001475:	eb 66                	jmp    300014dd <gmtime_r+0x160>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67
    dayno -= YEARSIZE(year);
30001477:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000147a:	83 e0 03             	and    eax,0x3
3000147d:	85 c0                	test   eax,eax
3000147f:	75 50                	jne    300014d1 <gmtime_r+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 1)
30001481:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001484:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001489:	89 c8                	mov    eax,ecx
3000148b:	f7 ea                	imul   edx
3000148d:	c1 fa 05             	sar    edx,0x5
30001490:	89 c8                	mov    eax,ecx
30001492:	c1 f8 1f             	sar    eax,0x1f
30001495:	29 c2                	sub    edx,eax
30001497:	89 d0                	mov    eax,edx
30001499:	6b c0 64             	imul   eax,eax,0x64
3000149c:	29 c1                	sub    ecx,eax
3000149e:	89 c8                	mov    eax,ecx
300014a0:	85 c0                	test   eax,eax
300014a2:	75 26                	jne    300014ca <gmtime_r+0x14d>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 4)
300014a4:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300014a7:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300014ac:	89 c8                	mov    eax,ecx
300014ae:	f7 ea                	imul   edx
300014b0:	c1 fa 07             	sar    edx,0x7
300014b3:	89 c8                	mov    eax,ecx
300014b5:	c1 f8 1f             	sar    eax,0x1f
300014b8:	29 c2                	sub    edx,eax
300014ba:	89 d0                	mov    eax,edx
300014bc:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300014c2:	29 c1                	sub    ecx,eax
300014c4:	89 c8                	mov    eax,ecx
300014c6:	85 c0                	test   eax,eax
300014c8:	75 07                	jne    300014d1 <gmtime_r+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 5)
300014ca:	b8 6e 01 00 00       	mov    eax,0x16e
300014cf:	eb 05                	jmp    300014d6 <gmtime_r+0x159>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 6)
300014d1:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/aproj/libChrisOS/src/time.c:67 (discriminator 8)
300014d6:	29 45 f8             	sub    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:68 (discriminator 8)
    year++;
300014d9:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
300014dd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300014e0:	83 e0 03             	and    eax,0x3
300014e3:	85 c0                	test   eax,eax
300014e5:	75 50                	jne    30001537 <gmtime_r+0x1ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 1)
300014e7:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300014ea:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300014ef:	89 c8                	mov    eax,ecx
300014f1:	f7 ea                	imul   edx
300014f3:	c1 fa 05             	sar    edx,0x5
300014f6:	89 c8                	mov    eax,ecx
300014f8:	c1 f8 1f             	sar    eax,0x1f
300014fb:	29 c2                	sub    edx,eax
300014fd:	89 d0                	mov    eax,edx
300014ff:	6b c0 64             	imul   eax,eax,0x64
30001502:	29 c1                	sub    ecx,eax
30001504:	89 c8                	mov    eax,ecx
30001506:	85 c0                	test   eax,eax
30001508:	75 26                	jne    30001530 <gmtime_r+0x1b3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 4)
3000150a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
3000150d:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001512:	89 c8                	mov    eax,ecx
30001514:	f7 ea                	imul   edx
30001516:	c1 fa 07             	sar    edx,0x7
30001519:	89 c8                	mov    eax,ecx
3000151b:	c1 f8 1f             	sar    eax,0x1f
3000151e:	29 c2                	sub    edx,eax
30001520:	89 d0                	mov    eax,edx
30001522:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001528:	29 c1                	sub    ecx,eax
3000152a:	89 c8                	mov    eax,ecx
3000152c:	85 c0                	test   eax,eax
3000152e:	75 07                	jne    30001537 <gmtime_r+0x1ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 5)
30001530:	b8 6e 01 00 00       	mov    eax,0x16e
30001535:	eb 05                	jmp    3000153c <gmtime_r+0x1bf>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 6)
30001537:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66 (discriminator 8)
3000153c:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
3000153f:	0f 86 32 ff ff ff    	jbe    30001477 <gmtime_r+0xfa>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:70
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
30001545:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001548:	8d 90 94 f8 ff ff    	lea    edx,[eax-0x76c]
3000154e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001551:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:71
  tmbuf->tm_yday = dayno;
30001554:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30001557:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000155a:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:72
  tmbuf->tm_mon = 0;
3000155d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001560:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
30001567:	e9 89 00 00 00       	jmp    300015f5 <gmtime_r+0x278>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
3000156c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000156f:	83 e0 03             	and    eax,0x3
30001572:	85 c0                	test   eax,eax
30001574:	75 50                	jne    300015c6 <gmtime_r+0x249>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 1)
30001576:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001579:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000157e:	89 c8                	mov    eax,ecx
30001580:	f7 ea                	imul   edx
30001582:	c1 fa 05             	sar    edx,0x5
30001585:	89 c8                	mov    eax,ecx
30001587:	c1 f8 1f             	sar    eax,0x1f
3000158a:	29 c2                	sub    edx,eax
3000158c:	89 d0                	mov    eax,edx
3000158e:	6b c0 64             	imul   eax,eax,0x64
30001591:	29 c1                	sub    ecx,eax
30001593:	89 c8                	mov    eax,ecx
30001595:	85 c0                	test   eax,eax
30001597:	75 26                	jne    300015bf <gmtime_r+0x242>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 4)
30001599:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
3000159c:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300015a1:	89 c8                	mov    eax,ecx
300015a3:	f7 ea                	imul   edx
300015a5:	c1 fa 07             	sar    edx,0x7
300015a8:	89 c8                	mov    eax,ecx
300015aa:	c1 f8 1f             	sar    eax,0x1f
300015ad:	29 c2                	sub    edx,eax
300015af:	89 d0                	mov    eax,edx
300015b1:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300015b7:	29 c1                	sub    ecx,eax
300015b9:	89 c8                	mov    eax,ecx
300015bb:	85 c0                	test   eax,eax
300015bd:	75 07                	jne    300015c6 <gmtime_r+0x249>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 5)
300015bf:	ba 01 00 00 00       	mov    edx,0x1
300015c4:	eb 05                	jmp    300015cb <gmtime_r+0x24e>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 6)
300015c6:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:74 (discriminator 8)
300015cb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300015ce:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
300015d1:	89 d0                	mov    eax,edx
300015d3:	01 c0                	add    eax,eax
300015d5:	01 d0                	add    eax,edx
300015d7:	c1 e0 02             	shl    eax,0x2
300015da:	01 c8                	add    eax,ecx
300015dc:	8b 84 83 88 fc ff ff 	mov    eax,DWORD PTR [ebx+eax*4-0x378]
300015e3:	29 45 f8             	sub    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:75 (discriminator 8)
    tmbuf->tm_mon++;
300015e6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300015e9:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
300015ec:	8d 50 01             	lea    edx,[eax+0x1]
300015ef:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300015f2:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
300015f5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300015f8:	83 e0 03             	and    eax,0x3
300015fb:	85 c0                	test   eax,eax
300015fd:	75 50                	jne    3000164f <gmtime_r+0x2d2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 1)
300015ff:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001602:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001607:	89 c8                	mov    eax,ecx
30001609:	f7 ea                	imul   edx
3000160b:	c1 fa 05             	sar    edx,0x5
3000160e:	89 c8                	mov    eax,ecx
30001610:	c1 f8 1f             	sar    eax,0x1f
30001613:	29 c2                	sub    edx,eax
30001615:	89 d0                	mov    eax,edx
30001617:	6b c0 64             	imul   eax,eax,0x64
3000161a:	29 c1                	sub    ecx,eax
3000161c:	89 c8                	mov    eax,ecx
3000161e:	85 c0                	test   eax,eax
30001620:	75 26                	jne    30001648 <gmtime_r+0x2cb>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 4)
30001622:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001625:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000162a:	89 c8                	mov    eax,ecx
3000162c:	f7 ea                	imul   edx
3000162e:	c1 fa 07             	sar    edx,0x7
30001631:	89 c8                	mov    eax,ecx
30001633:	c1 f8 1f             	sar    eax,0x1f
30001636:	29 c2                	sub    edx,eax
30001638:	89 d0                	mov    eax,edx
3000163a:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001640:	29 c1                	sub    ecx,eax
30001642:	89 c8                	mov    eax,ecx
30001644:	85 c0                	test   eax,eax
30001646:	75 07                	jne    3000164f <gmtime_r+0x2d2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 5)
30001648:	ba 01 00 00 00       	mov    edx,0x1
3000164d:	eb 05                	jmp    30001654 <gmtime_r+0x2d7>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 6)
3000164f:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73 (discriminator 8)
30001654:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001657:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
3000165a:	89 d0                	mov    eax,edx
3000165c:	01 c0                	add    eax,eax
3000165e:	01 d0                	add    eax,edx
30001660:	c1 e0 02             	shl    eax,0x2
30001663:	01 c8                	add    eax,ecx
30001665:	8b 84 83 88 fc ff ff 	mov    eax,DWORD PTR [ebx+eax*4-0x378]
3000166c:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
3000166f:	0f 86 f7 fe ff ff    	jbe    3000156c <gmtime_r+0x1ef>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:77
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
30001675:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30001678:	83 c0 01             	add    eax,0x1
3000167b:	89 c2                	mov    edx,eax
3000167d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001680:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:78
  tmbuf->tm_isdst = 0;
30001683:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001686:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:79
  return tmbuf;
3000168d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:80
}
30001690:	83 c4 10             	add    esp,0x10
30001693:	5b                   	pop    ebx
30001694:	5d                   	pop    ebp
30001695:	c3                   	ret    

30001696 <localtime>:
localtime():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:82

VISIBLE struct tm *localtime(const time_t *timer) {
30001696:	55                   	push   ebp
30001697:	89 e5                	mov    ebp,esp
30001699:	53                   	push   ebx
3000169a:	83 ec 34             	sub    esp,0x34
3000169d:	e8 c8 08 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
300016a2:	05 f6 1c 00 00       	add    eax,0x1cf6
/home/yogi/src/os/aproj/libChrisOS/src/time.c:86
  time_t t;
  struct tm tmbuf;
  
  t = *timer - libcTZ;
300016a7:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
300016aa:	8b 0a                	mov    ecx,DWORD PTR [edx]
300016ac:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
300016b2:	8b 12                	mov    edx,DWORD PTR [edx]
300016b4:	29 d1                	sub    ecx,edx
300016b6:	89 ca                	mov    edx,ecx
300016b8:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:87
  return gmtime_r(&t, &tmbuf);
300016bb:	83 ec 08             	sub    esp,0x8
300016be:	8d 55 c8             	lea    edx,[ebp-0x38]
300016c1:	52                   	push   edx
300016c2:	8d 55 f4             	lea    edx,[ebp-0xc]
300016c5:	52                   	push   edx
300016c6:	89 c3                	mov    ebx,eax
300016c8:	e8 d3 08 00 00       	call   30001fa0 <__x86.get_pc_thunk.ax+0x36>
300016cd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:88
}
300016d0:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300016d3:	c9                   	leave  
300016d4:	c3                   	ret    

300016d5 <localtime_r>:
localtime_r():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:90

VISIBLE struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
300016d5:	55                   	push   ebp
300016d6:	89 e5                	mov    ebp,esp
300016d8:	53                   	push   ebx
300016d9:	83 ec 14             	sub    esp,0x14
300016dc:	e8 89 08 00 00       	call   30001f6a <__x86.get_pc_thunk.ax>
300016e1:	05 b7 1c 00 00       	add    eax,0x1cb7
/home/yogi/src/os/aproj/libChrisOS/src/time.c:93
  time_t t;

  t = *timer - libcTZ;
300016e6:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
300016e9:	8b 0a                	mov    ecx,DWORD PTR [edx]
300016eb:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
300016f1:	8b 12                	mov    edx,DWORD PTR [edx]
300016f3:	29 d1                	sub    ecx,edx
300016f5:	89 ca                	mov    edx,ecx
300016f7:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:94
  return gmtime_r(&t, tmbuf);
300016fa:	83 ec 08             	sub    esp,0x8
300016fd:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30001700:	8d 55 f4             	lea    edx,[ebp-0xc]
30001703:	52                   	push   edx
30001704:	89 c3                	mov    ebx,eax
30001706:	e8 95 08 00 00       	call   30001fa0 <__x86.get_pc_thunk.ax+0x36>
3000170b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:95
}
3000170e:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30001711:	c9                   	leave  
30001712:	c3                   	ret    

30001713 <mktime>:
mktime():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:97

VISIBLE time_t mktime(struct tm *tmbuf) {
30001713:	55                   	push   ebp
30001714:	89 e5                	mov    ebp,esp
30001716:	57                   	push   edi
30001717:	56                   	push   esi
30001718:	53                   	push   ebx
30001719:	83 ec 20             	sub    esp,0x20
3000171c:	e8 a7 08 00 00       	call   30001fc8 <__x86.get_pc_thunk.cx>
30001721:	81 c1 77 1c 00 00    	add    ecx,0x1c77
/home/yogi/src/os/aproj/libChrisOS/src/time.c:105
  int yday, month;
  long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
30001727:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000172a:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
3000172d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001730:	8b 18                	mov    ebx,DWORD PTR [eax]
30001732:	ba 89 88 88 88       	mov    edx,0x88888889
30001737:	89 d8                	mov    eax,ebx
30001739:	f7 ea                	imul   edx
3000173b:	8d 04 1a             	lea    eax,[edx+ebx*1]
3000173e:	c1 f8 05             	sar    eax,0x5
30001741:	89 c2                	mov    edx,eax
30001743:	89 d8                	mov    eax,ebx
30001745:	c1 f8 1f             	sar    eax,0x1f
30001748:	29 c2                	sub    edx,eax
3000174a:	89 d0                	mov    eax,edx
3000174c:	8d 14 06             	lea    edx,[esi+eax*1]
3000174f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001752:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:106
  tmbuf->tm_sec %= 60;
30001755:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001758:	8b 18                	mov    ebx,DWORD PTR [eax]
3000175a:	ba 89 88 88 88       	mov    edx,0x88888889
3000175f:	89 d8                	mov    eax,ebx
30001761:	f7 ea                	imul   edx
30001763:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001766:	c1 f8 05             	sar    eax,0x5
30001769:	89 c2                	mov    edx,eax
3000176b:	89 d8                	mov    eax,ebx
3000176d:	c1 f8 1f             	sar    eax,0x1f
30001770:	29 c2                	sub    edx,eax
30001772:	89 d0                	mov    eax,edx
30001774:	89 c2                	mov    edx,eax
30001776:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
3000177d:	89 c2                	mov    edx,eax
3000177f:	89 d0                	mov    eax,edx
30001781:	c1 e0 04             	shl    eax,0x4
30001784:	29 d0                	sub    eax,edx
30001786:	29 c3                	sub    ebx,eax
30001788:	89 d8                	mov    eax,ebx
3000178a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
3000178d:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:107
  if (tmbuf->tm_sec < 0) {
3000178f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001792:	8b 00                	mov    eax,DWORD PTR [eax]
30001794:	85 c0                	test   eax,eax
30001796:	79 1c                	jns    300017b4 <mktime+0xa1>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:108
    tmbuf->tm_sec += 60;
30001798:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000179b:	8b 00                	mov    eax,DWORD PTR [eax]
3000179d:	8d 50 3c             	lea    edx,[eax+0x3c]
300017a0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017a3:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:109
    tmbuf->tm_min--;
300017a5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017a8:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
300017ab:	8d 50 ff             	lea    edx,[eax-0x1]
300017ae:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017b1:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
300017b4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017b7:	8b 70 08             	mov    esi,DWORD PTR [eax+0x8]
300017ba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017bd:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
300017c0:	ba 89 88 88 88       	mov    edx,0x88888889
300017c5:	89 d8                	mov    eax,ebx
300017c7:	f7 ea                	imul   edx
300017c9:	8d 04 1a             	lea    eax,[edx+ebx*1]
300017cc:	c1 f8 05             	sar    eax,0x5
300017cf:	89 c2                	mov    edx,eax
300017d1:	89 d8                	mov    eax,ebx
300017d3:	c1 f8 1f             	sar    eax,0x1f
300017d6:	29 c2                	sub    edx,eax
300017d8:	89 d0                	mov    eax,edx
300017da:	8d 14 06             	lea    edx,[esi+eax*1]
300017dd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017e0:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:112
  tmbuf->tm_min = tmbuf->tm_min % 60;
300017e3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017e6:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
300017e9:	ba 89 88 88 88       	mov    edx,0x88888889
300017ee:	89 d8                	mov    eax,ebx
300017f0:	f7 ea                	imul   edx
300017f2:	8d 04 1a             	lea    eax,[edx+ebx*1]
300017f5:	c1 f8 05             	sar    eax,0x5
300017f8:	89 c2                	mov    edx,eax
300017fa:	89 d8                	mov    eax,ebx
300017fc:	c1 f8 1f             	sar    eax,0x1f
300017ff:	29 c2                	sub    edx,eax
30001801:	89 d0                	mov    eax,edx
30001803:	89 c2                	mov    edx,eax
30001805:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
3000180c:	89 c2                	mov    edx,eax
3000180e:	89 d0                	mov    eax,edx
30001810:	c1 e0 04             	shl    eax,0x4
30001813:	29 d0                	sub    eax,edx
30001815:	29 c3                	sub    ebx,eax
30001817:	89 d8                	mov    eax,ebx
30001819:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
3000181c:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113
  if (tmbuf->tm_min < 0) {
3000181f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001822:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001825:	85 c0                	test   eax,eax
30001827:	79 1e                	jns    30001847 <mktime+0x134>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114
    tmbuf->tm_min += 60;
30001829:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000182c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
3000182f:	8d 50 3c             	lea    edx,[eax+0x3c]
30001832:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001835:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:115
    tmbuf->tm_hour--;
30001838:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000183b:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
3000183e:	8d 50 ff             	lea    edx,[eax-0x1]
30001841:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001844:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:117
  }
  day = tmbuf->tm_hour / 24;
30001847:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000184a:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
3000184d:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
30001852:	89 d8                	mov    eax,ebx
30001854:	f7 ea                	imul   edx
30001856:	c1 fa 02             	sar    edx,0x2
30001859:	89 d8                	mov    eax,ebx
3000185b:	c1 f8 1f             	sar    eax,0x1f
3000185e:	29 c2                	sub    edx,eax
30001860:	89 d0                	mov    eax,edx
30001862:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:118
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
30001865:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001868:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
3000186b:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
30001870:	89 d8                	mov    eax,ebx
30001872:	f7 ea                	imul   edx
30001874:	c1 fa 02             	sar    edx,0x2
30001877:	89 d8                	mov    eax,ebx
30001879:	c1 f8 1f             	sar    eax,0x1f
3000187c:	29 c2                	sub    edx,eax
3000187e:	89 d0                	mov    eax,edx
30001880:	01 c0                	add    eax,eax
30001882:	01 d0                	add    eax,edx
30001884:	c1 e0 03             	shl    eax,0x3
30001887:	29 c3                	sub    ebx,eax
30001889:	89 da                	mov    edx,ebx
3000188b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000188e:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:119
  if (tmbuf->tm_hour < 0) {
30001891:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001894:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30001897:	85 c0                	test   eax,eax
30001899:	79 13                	jns    300018ae <mktime+0x19b>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:120
    tmbuf->tm_hour += 24;
3000189b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000189e:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
300018a1:	8d 50 18             	lea    edx,[eax+0x18]
300018a4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018a7:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:121
    day--;
300018aa:	83 6d f0 01          	sub    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:123
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
300018ae:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018b1:	8b 70 14             	mov    esi,DWORD PTR [eax+0x14]
300018b4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018b7:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
300018ba:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
300018bf:	89 d8                	mov    eax,ebx
300018c1:	f7 ea                	imul   edx
300018c3:	d1 fa                	sar    edx,1
300018c5:	89 d8                	mov    eax,ebx
300018c7:	c1 f8 1f             	sar    eax,0x1f
300018ca:	29 c2                	sub    edx,eax
300018cc:	89 d0                	mov    eax,edx
300018ce:	8d 14 06             	lea    edx,[esi+eax*1]
300018d1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018d4:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:124
  tmbuf->tm_mon %= 12;
300018d7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018da:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
300018dd:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
300018e2:	89 d8                	mov    eax,ebx
300018e4:	f7 ea                	imul   edx
300018e6:	d1 fa                	sar    edx,1
300018e8:	89 d8                	mov    eax,ebx
300018ea:	c1 f8 1f             	sar    eax,0x1f
300018ed:	29 c2                	sub    edx,eax
300018ef:	89 d0                	mov    eax,edx
300018f1:	01 c0                	add    eax,eax
300018f3:	01 d0                	add    eax,edx
300018f5:	c1 e0 02             	shl    eax,0x2
300018f8:	29 c3                	sub    ebx,eax
300018fa:	89 da                	mov    edx,ebx
300018fc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300018ff:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:125
  if (tmbuf->tm_mon < 0) {
30001902:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001905:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001908:	85 c0                	test   eax,eax
3000190a:	79 1e                	jns    3000192a <mktime+0x217>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:126
    tmbuf->tm_mon += 12;
3000190c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000190f:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001912:	8d 50 0c             	lea    edx,[eax+0xc]
30001915:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001918:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:127
    tmbuf->tm_year--;
3000191b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000191e:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001921:	8d 50 ff             	lea    edx,[eax-0x1]
30001924:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001927:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:129
  }
  day += (tmbuf->tm_mday - 1);
3000192a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000192d:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
30001930:	83 e8 01             	sub    eax,0x1
30001933:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:130
  while (day < 0) {
30001936:	e9 c1 00 00 00       	jmp    300019fc <mktime+0x2e9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:131
    if(--tmbuf->tm_mon < 0) {
3000193b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000193e:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001941:	8d 50 ff             	lea    edx,[eax-0x1]
30001944:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001947:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
3000194a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000194d:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001950:	85 c0                	test   eax,eax
30001952:	79 19                	jns    3000196d <mktime+0x25a>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:132
      tmbuf->tm_year--;
30001954:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001957:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
3000195a:	8d 50 ff             	lea    edx,[eax-0x1]
3000195d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001960:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:133
      tmbuf->tm_mon = 11;
30001963:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001966:	c7 40 10 0b 00 00 00 	mov    DWORD PTR [eax+0x10],0xb
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
3000196d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001970:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001973:	83 e0 03             	and    eax,0x3
30001976:	85 c0                	test   eax,eax
30001978:	75 62                	jne    300019dc <mktime+0x2c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 1)
3000197a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000197d:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001980:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001986:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000198b:	89 d8                	mov    eax,ebx
3000198d:	f7 ea                	imul   edx
3000198f:	c1 fa 05             	sar    edx,0x5
30001992:	89 d8                	mov    eax,ebx
30001994:	c1 f8 1f             	sar    eax,0x1f
30001997:	29 c2                	sub    edx,eax
30001999:	89 d0                	mov    eax,edx
3000199b:	6b c0 64             	imul   eax,eax,0x64
3000199e:	29 c3                	sub    ebx,eax
300019a0:	89 d8                	mov    eax,ebx
300019a2:	85 c0                	test   eax,eax
300019a4:	75 2f                	jne    300019d5 <mktime+0x2c2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 4)
300019a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300019a9:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
300019ac:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
300019b2:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300019b7:	89 d8                	mov    eax,ebx
300019b9:	f7 ea                	imul   edx
300019bb:	c1 fa 07             	sar    edx,0x7
300019be:	89 d8                	mov    eax,ebx
300019c0:	c1 f8 1f             	sar    eax,0x1f
300019c3:	29 c2                	sub    edx,eax
300019c5:	89 d0                	mov    eax,edx
300019c7:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300019cd:	29 c3                	sub    ebx,eax
300019cf:	89 d8                	mov    eax,ebx
300019d1:	85 c0                	test   eax,eax
300019d3:	75 07                	jne    300019dc <mktime+0x2c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 5)
300019d5:	ba 01 00 00 00       	mov    edx,0x1
300019da:	eb 05                	jmp    300019e1 <mktime+0x2ce>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 6)
300019dc:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135 (discriminator 8)
300019e1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300019e4:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
300019e7:	89 d0                	mov    eax,edx
300019e9:	01 c0                	add    eax,eax
300019eb:	01 d0                	add    eax,edx
300019ed:	c1 e0 02             	shl    eax,0x2
300019f0:	01 d8                	add    eax,ebx
300019f2:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
300019f9:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:130
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
300019fc:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30001a00:	0f 88 35 ff ff ff    	js     3000193b <mktime+0x228>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
30001a06:	e9 c2 00 00 00       	jmp    30001acd <mktime+0x3ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
30001a0b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a0e:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001a11:	83 e0 03             	and    eax,0x3
30001a14:	85 c0                	test   eax,eax
30001a16:	75 62                	jne    30001a7a <mktime+0x367>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 1)
30001a18:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a1b:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001a1e:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001a24:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001a29:	89 d8                	mov    eax,ebx
30001a2b:	f7 ea                	imul   edx
30001a2d:	c1 fa 05             	sar    edx,0x5
30001a30:	89 d8                	mov    eax,ebx
30001a32:	c1 f8 1f             	sar    eax,0x1f
30001a35:	29 c2                	sub    edx,eax
30001a37:	89 d0                	mov    eax,edx
30001a39:	6b c0 64             	imul   eax,eax,0x64
30001a3c:	29 c3                	sub    ebx,eax
30001a3e:	89 d8                	mov    eax,ebx
30001a40:	85 c0                	test   eax,eax
30001a42:	75 2f                	jne    30001a73 <mktime+0x360>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 4)
30001a44:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a47:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001a4a:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001a50:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001a55:	89 d8                	mov    eax,ebx
30001a57:	f7 ea                	imul   edx
30001a59:	c1 fa 07             	sar    edx,0x7
30001a5c:	89 d8                	mov    eax,ebx
30001a5e:	c1 f8 1f             	sar    eax,0x1f
30001a61:	29 c2                	sub    edx,eax
30001a63:	89 d0                	mov    eax,edx
30001a65:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001a6b:	29 c3                	sub    ebx,eax
30001a6d:	89 d8                	mov    eax,ebx
30001a6f:	85 c0                	test   eax,eax
30001a71:	75 07                	jne    30001a7a <mktime+0x367>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 5)
30001a73:	ba 01 00 00 00       	mov    edx,0x1
30001a78:	eb 05                	jmp    30001a7f <mktime+0x36c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 6)
30001a7a:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 8)
30001a7f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a82:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001a85:	89 d0                	mov    eax,edx
30001a87:	01 c0                	add    eax,eax
30001a89:	01 d0                	add    eax,edx
30001a8b:	c1 e0 02             	shl    eax,0x2
30001a8e:	01 d8                	add    eax,ebx
30001a90:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
30001a97:	29 45 f0             	sub    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 8)
    if (++(tmbuf->tm_mon) == 12) {
30001a9a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001a9d:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001aa0:	8d 50 01             	lea    edx,[eax+0x1]
30001aa3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001aa6:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
30001aa9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001aac:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001aaf:	83 f8 0c             	cmp    eax,0xc
30001ab2:	75 19                	jne    30001acd <mktime+0x3ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:140
      tmbuf->tm_mon = 0;
30001ab4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ab7:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:141
      tmbuf->tm_year++;
30001abe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ac1:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001ac4:	8d 50 01             	lea    edx,[eax+0x1]
30001ac7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001aca:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
30001acd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ad0:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001ad3:	83 e0 03             	and    eax,0x3
30001ad6:	85 c0                	test   eax,eax
30001ad8:	75 62                	jne    30001b3c <mktime+0x429>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 1)
30001ada:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001add:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001ae0:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001ae6:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001aeb:	89 d8                	mov    eax,ebx
30001aed:	f7 ea                	imul   edx
30001aef:	c1 fa 05             	sar    edx,0x5
30001af2:	89 d8                	mov    eax,ebx
30001af4:	c1 f8 1f             	sar    eax,0x1f
30001af7:	29 c2                	sub    edx,eax
30001af9:	89 d0                	mov    eax,edx
30001afb:	6b c0 64             	imul   eax,eax,0x64
30001afe:	29 c3                	sub    ebx,eax
30001b00:	89 d8                	mov    eax,ebx
30001b02:	85 c0                	test   eax,eax
30001b04:	75 2f                	jne    30001b35 <mktime+0x422>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 4)
30001b06:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b09:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001b0c:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001b12:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001b17:	89 d8                	mov    eax,ebx
30001b19:	f7 ea                	imul   edx
30001b1b:	c1 fa 07             	sar    edx,0x7
30001b1e:	89 d8                	mov    eax,ebx
30001b20:	c1 f8 1f             	sar    eax,0x1f
30001b23:	29 c2                	sub    edx,eax
30001b25:	89 d0                	mov    eax,edx
30001b27:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001b2d:	29 c3                	sub    ebx,eax
30001b2f:	89 d8                	mov    eax,ebx
30001b31:	85 c0                	test   eax,eax
30001b33:	75 07                	jne    30001b3c <mktime+0x429>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 5)
30001b35:	ba 01 00 00 00       	mov    edx,0x1
30001b3a:	eb 05                	jmp    30001b41 <mktime+0x42e>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 6)
30001b3c:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 8)
30001b41:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b44:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001b47:	89 d0                	mov    eax,edx
30001b49:	01 c0                	add    eax,eax
30001b4b:	01 d0                	add    eax,edx
30001b4d:	c1 e0 02             	shl    eax,0x2
30001b50:	01 d8                	add    eax,ebx
30001b52:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
30001b59:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30001b5c:	0f 8e a9 fe ff ff    	jle    30001a0b <mktime+0x2f8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:144
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
30001b62:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001b65:	8d 50 01             	lea    edx,[eax+0x1]
30001b68:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b6b:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:145
  year = EPOCH_YR;
30001b6e:	c7 45 dc b2 07 00 00 	mov    DWORD PTR [ebp-0x24],0x7b2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:146
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
30001b75:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b78:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001b7b:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
30001b7e:	81 ea 6c 07 00 00    	sub    edx,0x76c
30001b84:	39 d0                	cmp    eax,edx
30001b86:	7d 0a                	jge    30001b92 <mktime+0x47f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:146 (discriminator 1)
30001b88:	b8 19 fc ff ff       	mov    eax,0xfffffc19
30001b8d:	e9 d0 03 00 00       	jmp    30001f62 <mktime+0x84f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:147
  seconds = 0;
30001b92:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:148
  day = 0;                      // Means days since day 0 now
30001b99:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:149
  overflow = 0;
30001ba0:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:156
  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;
30001ba7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001baa:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001bad:	05 6c 07 00 00       	add    eax,0x76c
30001bb2:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:158

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
30001bb5:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001bb8:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001bbb:	3d 7c c6 59 00       	cmp    eax,0x59c67c
30001bc0:	7e 07                	jle    30001bc9 <mktime+0x4b6>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:158 (discriminator 1)
30001bc2:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:159
  day = (tm_year - year) * 365;
30001bc9:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001bcc:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001bcf:	69 c0 6d 01 00 00    	imul   eax,eax,0x16d
30001bd5:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:160
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
30001bd8:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
30001bdd:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
30001be0:	89 c2                	mov    edx,eax
30001be2:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001be5:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001be8:	8d 58 03             	lea    ebx,[eax+0x3]
30001beb:	85 c0                	test   eax,eax
30001bed:	0f 48 c3             	cmovs  eax,ebx
30001bf0:	c1 f8 02             	sar    eax,0x2
30001bf3:	83 c0 01             	add    eax,0x1
30001bf6:	39 c2                	cmp    edx,eax
30001bf8:	7d 04                	jge    30001bfe <mktime+0x4eb>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:160 (discriminator 1)
30001bfa:	83 4d e4 02          	or     DWORD PTR [ebp-0x1c],0x2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
30001bfe:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c01:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001c04:	8d 50 03             	lea    edx,[eax+0x3]
30001c07:	85 c0                	test   eax,eax
30001c09:	0f 48 c2             	cmovs  eax,edx
30001c0c:	c1 f8 02             	sar    eax,0x2
30001c0f:	89 c3                	mov    ebx,eax
30001c11:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c14:	83 e0 03             	and    eax,0x3
30001c17:	85 c0                	test   eax,eax
30001c19:	74 29                	je     30001c44 <mktime+0x531>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 1)
30001c1b:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c1e:	99                   	cdq    
30001c1f:	c1 ea 1e             	shr    edx,0x1e
30001c22:	01 d0                	add    eax,edx
30001c24:	83 e0 03             	and    eax,0x3
30001c27:	29 d0                	sub    eax,edx
30001c29:	89 c6                	mov    esi,eax
30001c2b:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
30001c2e:	99                   	cdq    
30001c2f:	c1 ea 1e             	shr    edx,0x1e
30001c32:	01 d0                	add    eax,edx
30001c34:	83 e0 03             	and    eax,0x3
30001c37:	29 d0                	sub    eax,edx
30001c39:	39 c6                	cmp    esi,eax
30001c3b:	7d 07                	jge    30001c44 <mktime+0x531>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 3)
30001c3d:	b8 01 00 00 00       	mov    eax,0x1
30001c42:	eb 05                	jmp    30001c49 <mktime+0x536>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 4)
30001c44:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161 (discriminator 6)
30001c49:	01 d8                	add    eax,ebx
30001c4b:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 6)
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
30001c4e:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001c51:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001c54:	89 c3                	mov    ebx,eax
30001c56:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001c5b:	89 d8                	mov    eax,ebx
30001c5d:	f7 ea                	imul   edx
30001c5f:	c1 fa 05             	sar    edx,0x5
30001c62:	89 d8                	mov    eax,ebx
30001c64:	c1 f8 1f             	sar    eax,0x1f
30001c67:	89 d7                	mov    edi,edx
30001c69:	29 c7                	sub    edi,eax
30001c6b:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001c6e:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001c73:	89 d8                	mov    eax,ebx
30001c75:	f7 ea                	imul   edx
30001c77:	c1 fa 05             	sar    edx,0x5
30001c7a:	89 d8                	mov    eax,ebx
30001c7c:	c1 f8 1f             	sar    eax,0x1f
30001c7f:	29 c2                	sub    edx,eax
30001c81:	89 d0                	mov    eax,edx
30001c83:	6b c0 64             	imul   eax,eax,0x64
30001c86:	29 c3                	sub    ebx,eax
30001c88:	89 d8                	mov    eax,ebx
30001c8a:	85 c0                	test   eax,eax
30001c8c:	74 49                	je     30001cd7 <mktime+0x5c4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 1)
30001c8e:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001c91:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001c96:	89 d8                	mov    eax,ebx
30001c98:	f7 ea                	imul   edx
30001c9a:	c1 fa 05             	sar    edx,0x5
30001c9d:	89 d8                	mov    eax,ebx
30001c9f:	c1 f8 1f             	sar    eax,0x1f
30001ca2:	89 d6                	mov    esi,edx
30001ca4:	29 c6                	sub    esi,eax
30001ca6:	6b c6 64             	imul   eax,esi,0x64
30001ca9:	89 de                	mov    esi,ebx
30001cab:	29 c6                	sub    esi,eax
30001cad:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
30001cb0:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001cb5:	89 d8                	mov    eax,ebx
30001cb7:	f7 ea                	imul   edx
30001cb9:	c1 fa 05             	sar    edx,0x5
30001cbc:	89 d8                	mov    eax,ebx
30001cbe:	c1 f8 1f             	sar    eax,0x1f
30001cc1:	29 c2                	sub    edx,eax
30001cc3:	89 d0                	mov    eax,edx
30001cc5:	6b c0 64             	imul   eax,eax,0x64
30001cc8:	29 c3                	sub    ebx,eax
30001cca:	89 d8                	mov    eax,ebx
30001ccc:	39 c6                	cmp    esi,eax
30001cce:	7d 07                	jge    30001cd7 <mktime+0x5c4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 3)
30001cd0:	b8 01 00 00 00       	mov    eax,0x1
30001cd5:	eb 05                	jmp    30001cdc <mktime+0x5c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 4)
30001cd7:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:162 (discriminator 6)
30001cdc:	01 f8                	add    eax,edi
30001cde:	29 45 f0             	sub    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 6)
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);
30001ce1:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001ce4:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001ce7:	89 c3                	mov    ebx,eax
30001ce9:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001cee:	89 d8                	mov    eax,ebx
30001cf0:	f7 ea                	imul   edx
30001cf2:	c1 fa 07             	sar    edx,0x7
30001cf5:	89 d8                	mov    eax,ebx
30001cf7:	c1 f8 1f             	sar    eax,0x1f
30001cfa:	89 d7                	mov    edi,edx
30001cfc:	29 c7                	sub    edi,eax
30001cfe:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001d01:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d06:	89 d8                	mov    eax,ebx
30001d08:	f7 ea                	imul   edx
30001d0a:	c1 fa 07             	sar    edx,0x7
30001d0d:	89 d8                	mov    eax,ebx
30001d0f:	c1 f8 1f             	sar    eax,0x1f
30001d12:	29 c2                	sub    edx,eax
30001d14:	89 d0                	mov    eax,edx
30001d16:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001d1c:	29 c3                	sub    ebx,eax
30001d1e:	89 d8                	mov    eax,ebx
30001d20:	85 c0                	test   eax,eax
30001d22:	74 4f                	je     30001d73 <mktime+0x660>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 1)
30001d24:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001d27:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d2c:	89 d8                	mov    eax,ebx
30001d2e:	f7 ea                	imul   edx
30001d30:	c1 fa 07             	sar    edx,0x7
30001d33:	89 d8                	mov    eax,ebx
30001d35:	c1 f8 1f             	sar    eax,0x1f
30001d38:	89 d6                	mov    esi,edx
30001d3a:	29 c6                	sub    esi,eax
30001d3c:	69 c6 90 01 00 00    	imul   eax,esi,0x190
30001d42:	89 de                	mov    esi,ebx
30001d44:	29 c6                	sub    esi,eax
30001d46:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
30001d49:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d4e:	89 d8                	mov    eax,ebx
30001d50:	f7 ea                	imul   edx
30001d52:	c1 fa 07             	sar    edx,0x7
30001d55:	89 d8                	mov    eax,ebx
30001d57:	c1 f8 1f             	sar    eax,0x1f
30001d5a:	29 c2                	sub    edx,eax
30001d5c:	89 d0                	mov    eax,edx
30001d5e:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001d64:	29 c3                	sub    ebx,eax
30001d66:	89 d8                	mov    eax,ebx
30001d68:	39 c6                	cmp    esi,eax
30001d6a:	7d 07                	jge    30001d73 <mktime+0x660>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 3)
30001d6c:	b8 01 00 00 00       	mov    eax,0x1
30001d71:	eb 05                	jmp    30001d78 <mktime+0x665>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 4)
30001d73:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163 (discriminator 6)
30001d78:	01 f8                	add    eax,edi
30001d7a:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:165 (discriminator 6)

  yday = month = 0;
30001d7d:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
30001d84:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30001d87:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:166 (discriminator 6)
  while (month < tmbuf->tm_mon) {
30001d8a:	eb 7b                	jmp    30001e07 <mktime+0x6f4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167
    yday += _ytab[LEAPYEAR(tm_year)][month];
30001d8c:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001d8f:	83 e0 03             	and    eax,0x3
30001d92:	85 c0                	test   eax,eax
30001d94:	75 50                	jne    30001de6 <mktime+0x6d3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 1)
30001d96:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001d99:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d9e:	89 d8                	mov    eax,ebx
30001da0:	f7 ea                	imul   edx
30001da2:	c1 fa 05             	sar    edx,0x5
30001da5:	89 d8                	mov    eax,ebx
30001da7:	c1 f8 1f             	sar    eax,0x1f
30001daa:	29 c2                	sub    edx,eax
30001dac:	89 d0                	mov    eax,edx
30001dae:	6b c0 64             	imul   eax,eax,0x64
30001db1:	29 c3                	sub    ebx,eax
30001db3:	89 d8                	mov    eax,ebx
30001db5:	85 c0                	test   eax,eax
30001db7:	75 26                	jne    30001ddf <mktime+0x6cc>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 4)
30001db9:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30001dbc:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001dc1:	89 d8                	mov    eax,ebx
30001dc3:	f7 ea                	imul   edx
30001dc5:	c1 fa 07             	sar    edx,0x7
30001dc8:	89 d8                	mov    eax,ebx
30001dca:	c1 f8 1f             	sar    eax,0x1f
30001dcd:	29 c2                	sub    edx,eax
30001dcf:	89 d0                	mov    eax,edx
30001dd1:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001dd7:	29 c3                	sub    ebx,eax
30001dd9:	89 d8                	mov    eax,ebx
30001ddb:	85 c0                	test   eax,eax
30001ddd:	75 07                	jne    30001de6 <mktime+0x6d3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 5)
30001ddf:	ba 01 00 00 00       	mov    edx,0x1
30001de4:	eb 05                	jmp    30001deb <mktime+0x6d8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 6)
30001de6:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:167 (discriminator 8)
30001deb:	89 d0                	mov    eax,edx
30001ded:	01 c0                	add    eax,eax
30001def:	01 d0                	add    eax,edx
30001df1:	c1 e0 02             	shl    eax,0x2
30001df4:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
30001df7:	01 d0                	add    eax,edx
30001df9:	8b 84 81 88 fc ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x378]
30001e00:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:168 (discriminator 8)
    month++;
30001e03:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:166
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
30001e07:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e0a:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001e0d:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
30001e10:	0f 8f 76 ff ff ff    	jg     30001d8c <mktime+0x679>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:170
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
30001e16:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e19:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
30001e1c:	83 e8 01             	sub    eax,0x1
30001e1f:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:171
  if (day + yday < 0) overflow|=4;
30001e22:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
30001e25:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001e28:	01 d0                	add    eax,edx
30001e2a:	85 c0                	test   eax,eax
30001e2c:	79 04                	jns    30001e32 <mktime+0x71f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:171 (discriminator 1)
30001e2e:	83 4d e4 04          	or     DWORD PTR [ebp-0x1c],0x4
/home/yogi/src/os/aproj/libChrisOS/src/time.c:172
  day += yday;
30001e32:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001e35:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:174

  tmbuf->tm_yday = yday;
30001e38:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e3b:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30001e3e:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:175
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)
30001e41:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001e44:	8d 58 04             	lea    ebx,[eax+0x4]
30001e47:	ba 93 24 49 92       	mov    edx,0x92492493
30001e4c:	89 d8                	mov    eax,ebx
30001e4e:	f7 ea                	imul   edx
30001e50:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001e53:	c1 f8 02             	sar    eax,0x2
30001e56:	89 c2                	mov    edx,eax
30001e58:	89 d8                	mov    eax,ebx
30001e5a:	c1 f8 1f             	sar    eax,0x1f
30001e5d:	29 c2                	sub    edx,eax
30001e5f:	89 d0                	mov    eax,edx
30001e61:	89 c2                	mov    edx,eax
30001e63:	c1 e2 03             	shl    edx,0x3
30001e66:	29 c2                	sub    edx,eax
30001e68:	89 d8                	mov    eax,ebx
30001e6a:	29 d0                	sub    eax,edx
30001e6c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001e6f:	89 42 18             	mov    DWORD PTR [edx+0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:177

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;
30001e72:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e75:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30001e78:	c1 e0 02             	shl    eax,0x2
30001e7b:	89 c2                	mov    edx,eax
30001e7d:	c1 e2 04             	shl    edx,0x4
30001e80:	29 c2                	sub    edx,eax
30001e82:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e85:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001e88:	01 d0                	add    eax,edx
30001e8a:	c1 e0 02             	shl    eax,0x2
30001e8d:	89 c2                	mov    edx,eax
30001e8f:	c1 e2 04             	shl    edx,0x4
30001e92:	29 c2                	sub    edx,eax
30001e94:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e97:	8b 00                	mov    eax,DWORD PTR [eax]
30001e99:	01 d0                	add    eax,edx
30001e9b:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:179

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
30001e9e:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
30001ea3:	2b 45 d8             	sub    eax,DWORD PTR [ebp-0x28]
30001ea6:	89 c3                	mov    ebx,eax
30001ea8:	ba 07 45 2e c2       	mov    edx,0xc22e4507
30001ead:	89 d8                	mov    eax,ebx
30001eaf:	f7 ea                	imul   edx
30001eb1:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001eb4:	c1 f8 10             	sar    eax,0x10
30001eb7:	89 c2                	mov    edx,eax
30001eb9:	89 d8                	mov    eax,ebx
30001ebb:	c1 f8 1f             	sar    eax,0x1f
30001ebe:	29 c2                	sub    edx,eax
30001ec0:	89 d0                	mov    eax,edx
30001ec2:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30001ec5:	7d 04                	jge    30001ecb <mktime+0x7b8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:179 (discriminator 1)
30001ec7:	83 4d e4 08          	or     DWORD PTR [ebp-0x1c],0x8
/home/yogi/src/os/aproj/libChrisOS/src/time.c:180
  seconds += day * SECS_DAY;
30001ecb:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001ece:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
30001ed4:	01 45 d8             	add    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:183

  // Now adjust according to timezone and daylight saving time
  if (((libcTZ > 0) && (TIME_MAX - libcTZ < seconds)) || 
30001ed7:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001edd:	8b 00                	mov    eax,DWORD PTR [eax]
30001edf:	85 c0                	test   eax,eax
30001ee1:	7e 16                	jle    30001ef9 <mktime+0x7e6>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:183 (discriminator 1)
30001ee3:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001ee9:	8b 00                	mov    eax,DWORD PTR [eax]
30001eeb:	ba ff ff ff 7f       	mov    edx,0x7fffffff
30001ef0:	29 c2                	sub    edx,eax
30001ef2:	89 d0                	mov    eax,edx
30001ef4:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
30001ef7:	7c 1b                	jl     30001f14 <mktime+0x801>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:184 (discriminator 3)
      ((libcTZ < 0) && (seconds < -libcTZ))) {
30001ef9:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001eff:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:183 (discriminator 3)

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
  seconds += day * SECS_DAY;

  // Now adjust according to timezone and daylight saving time
  if (((libcTZ > 0) && (TIME_MAX - libcTZ < seconds)) || 
30001f01:	85 c0                	test   eax,eax
30001f03:	79 13                	jns    30001f18 <mktime+0x805>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:184
      ((libcTZ < 0) && (seconds < -libcTZ))) {
30001f05:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001f0b:	8b 00                	mov    eax,DWORD PTR [eax]
30001f0d:	f7 d8                	neg    eax
30001f0f:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
30001f12:	7e 04                	jle    30001f18 <mktime+0x805>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:185
          overflow|=16;
30001f14:	83 4d e4 10          	or     DWORD PTR [ebp-0x1c],0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:187
  }
  seconds += libcTZ;
30001f18:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30001f1e:	8b 00                	mov    eax,DWORD PTR [eax]
30001f20:	01 45 d8             	add    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:189

  if (tmbuf->tm_isdst) {
30001f23:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f26:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
30001f29:	85 c0                	test   eax,eax
30001f2b:	74 0b                	je     30001f38 <mktime+0x825>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:190
    dst = _dstbias;
30001f2d:	8b 81 04 01 00 00    	mov    eax,DWORD PTR [ecx+0x104]
30001f33:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
30001f36:	eb 07                	jmp    30001f3f <mktime+0x82c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:192
  } else {
    dst = 0;
30001f38:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:195
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
30001f3f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
30001f42:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
30001f45:	7e 04                	jle    30001f4b <mktime+0x838>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:195 (discriminator 1)
30001f47:	83 4d e4 20          	or     DWORD PTR [ebp-0x1c],0x20
/home/yogi/src/os/aproj/libChrisOS/src/time.c:196
  seconds -= dst;
30001f4b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
30001f4e:	29 45 d8             	sub    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:198

  if (overflow) return (time_t) overflow-2;
30001f51:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
30001f55:	74 08                	je     30001f5f <mktime+0x84c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:198 (discriminator 1)
30001f57:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
30001f5a:	83 e8 02             	sub    eax,0x2
30001f5d:	eb 03                	jmp    30001f62 <mktime+0x84f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:201

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
30001f5f:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:202
}
30001f62:	83 c4 20             	add    esp,0x20
30001f65:	5b                   	pop    ebx
30001f66:	5e                   	pop    esi
30001f67:	5f                   	pop    edi
30001f68:	5d                   	pop    ebp
30001f69:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

30001f6a <__x86.get_pc_thunk.ax>:
__x86.get_pc_thunk.ax():
30001f6a:	8b 04 24             	mov    eax,DWORD PTR [esp]
30001f6d:	c3                   	ret    

Disassembly of section .plt:

30001f70 <.plt>:
30001f70:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
30001f76:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
30001f7c:	00 00                	add    BYTE PTR [eax],al
30001f7e:	00 00                	add    BYTE PTR [eax],al
30001f80:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
30001f86:	68 00 00 00 00       	push   0x0
30001f8b:	e9 e0 ff ff ff       	jmp    30001f70 <__x86.get_pc_thunk.ax+0x6>
30001f90:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
30001f96:	68 08 00 00 00       	push   0x8
30001f9b:	e9 d0 ff ff ff       	jmp    30001f70 <__x86.get_pc_thunk.ax+0x6>
30001fa0:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
30001fa6:	68 10 00 00 00       	push   0x10
30001fab:	e9 c0 ff ff ff       	jmp    30001f70 <__x86.get_pc_thunk.ax+0x6>
30001fb0:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
30001fb6:	68 18 00 00 00       	push   0x18
30001fbb:	e9 b0 ff ff ff       	jmp    30001f70 <__x86.get_pc_thunk.ax+0x6>

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
3000202b:	00 3e                	add    BYTE PTR [esi],bh
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
300020b4:	e8 00 00 00 08       	call   380020b9 <ticksToWait+0x7ffec19>
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
3000235f:	00 ca                	add    dl,cl
30002361:	e2 ff                	loop   30002362 <__x86.get_pc_thunk.cx+0x39a>
30002363:	ff 20                	jmp    DWORD PTR [eax]
30002365:	00 00                	add    BYTE PTR [eax],al
30002367:	00 00                	add    BYTE PTR [eax],al
30002369:	41                   	inc    ecx
3000236a:	0e                   	push   cs
3000236b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002371:	5c                   	pop    esp
30002372:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002375:	04 00                	add    al,0x0
30002377:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3000237a:	00 00                	add    BYTE PTR [eax],al
3000237c:	b0 03                	mov    al,0x3
3000237e:	00 00                	add    BYTE PTR [eax],al
30002380:	cc                   	int3   
30002381:	e2 ff                	loop   30002382 <__x86.get_pc_thunk.cx+0x3ba>
30002383:	ff 34 00             	push   DWORD PTR [eax+eax*1]
30002386:	00 00                	add    BYTE PTR [eax],al
30002388:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000238b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002391:	70 c5                	jo     30002358 <__x86.get_pc_thunk.cx+0x390>
30002393:	0c 04                	or     al,0x4
30002395:	04 00                	add    al,0x0
30002397:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3000239a:	00 00                	add    BYTE PTR [eax],al
3000239c:	d0 03                	rol    BYTE PTR [ebx],1
3000239e:	00 00                	add    BYTE PTR [eax],al
300023a0:	e0 e2                	loopne 30002384 <__x86.get_pc_thunk.cx+0x3bc>
300023a2:	ff                   	(bad)  
300023a3:	ff                   	(bad)  
300023a4:	7c 00                	jl     300023a6 <__x86.get_pc_thunk.cx+0x3de>
300023a6:	00 00                	add    BYTE PTR [eax],al
300023a8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300023ab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300023b1:	02 78 c5             	add    bh,BYTE PTR [eax-0x3b]
300023b4:	0c 04                	or     al,0x4
300023b6:	04 00                	add    al,0x0
300023b8:	28 00                	sub    BYTE PTR [eax],al
300023ba:	00 00                	add    BYTE PTR [eax],al
300023bc:	f0 03 00             	lock add eax,DWORD PTR [eax]
300023bf:	00 3c e3             	add    BYTE PTR [ebx+eiz*8],bh
300023c2:	ff                   	(bad)  
300023c3:	ff c7                	inc    edi
300023c5:	01 00                	add    DWORD PTR [eax],eax
300023c7:	00 00                	add    BYTE PTR [eax],al
300023c9:	41                   	inc    ecx
300023ca:	0e                   	push   cs
300023cb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300023d1:	45                   	inc    ebp
300023d2:	86 03                	xchg   BYTE PTR [ebx],al
300023d4:	83 04 03 bc          	add    DWORD PTR [ebx+eax*1],0xffffffbc
300023d8:	01 c3                	add    ebx,eax
300023da:	41                   	inc    ecx
300023db:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
300023df:	04 04                	add    al,0x4
300023e1:	00 00                	add    BYTE PTR [eax],al
300023e3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300023e6:	00 00                	add    BYTE PTR [eax],al
300023e8:	1c 04                	sbb    al,0x4
300023ea:	00 00                	add    BYTE PTR [eax],al
300023ec:	d7                   	xlat   BYTE PTR ds:[ebx]
300023ed:	e4 ff                	in     al,0xff
300023ef:	ff                   	(bad)  
300023f0:	39 00                	cmp    DWORD PTR [eax],eax
300023f2:	00 00                	add    BYTE PTR [eax],al
300023f4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300023f7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300023fd:	75 c5                	jne    300023c4 <__x86.get_pc_thunk.cx+0x3fc>
300023ff:	0c 04                	or     al,0x4
30002401:	04 00                	add    al,0x0
30002403:	00 20                	add    BYTE PTR [eax],ah
30002405:	00 00                	add    BYTE PTR [eax],al
30002407:	00 3c 04             	add    BYTE PTR [esp+eax*1],bh
3000240a:	00 00                	add    BYTE PTR [eax],al
3000240c:	f0 e4 ff             	lock in al,0xff
3000240f:	ff 26                	jmp    DWORD PTR [esi]
30002411:	00 00                	add    BYTE PTR [eax],al
30002413:	00 00                	add    BYTE PTR [eax],al
30002415:	41                   	inc    ecx
30002416:	0e                   	push   cs
30002417:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000241d:	41                   	inc    ecx
3000241e:	83 03 60             	add    DWORD PTR [ebx],0x60
30002421:	c3                   	ret    
30002422:	41                   	inc    ecx
30002423:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002426:	04 00                	add    al,0x0
30002428:	10 00                	adc    BYTE PTR [eax],al
3000242a:	00 00                	add    BYTE PTR [eax],al
3000242c:	60                   	pusha  
3000242d:	04 00                	add    al,0x0
3000242f:	00 94 fb ff ff 04 00 	add    BYTE PTR [ebx+edi*8+0x4ffff],dl
30002436:	00 00                	add    BYTE PTR [eax],al
30002438:	00 00                	add    BYTE PTR [eax],al
3000243a:	00 00                	add    BYTE PTR [eax],al
3000243c:	1c 00                	sbb    al,0x0
3000243e:	00 00                	add    BYTE PTR [eax],al
30002440:	74 04                	je     30002446 <__x86.get_pc_thunk.cx+0x47e>
30002442:	00 00                	add    BYTE PTR [eax],al
30002444:	e0 e4                	loopne 3000242a <__x86.get_pc_thunk.cx+0x462>
30002446:	ff                   	(bad)  
30002447:	ff 9b 01 00 00 00    	call   FWORD PTR [ebx+0x1]
3000244d:	41                   	inc    ecx
3000244e:	0e                   	push   cs
3000244f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002455:	03 97 01 c5 0c 04    	add    edx,DWORD PTR [edi+0x40cc501]
3000245b:	04 1c                	add    al,0x1c
3000245d:	00 00                	add    BYTE PTR [eax],al
3000245f:	00 94 04 00 00 5c e6 	add    BYTE PTR [esp+eax*1-0x19a40000],dl
30002466:	ff                   	(bad)  
30002467:	ff c7                	inc    edi
30002469:	00 00                	add    BYTE PTR [eax],al
3000246b:	00 00                	add    BYTE PTR [eax],al
3000246d:	41                   	inc    ecx
3000246e:	0e                   	push   cs
3000246f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002475:	02 c3                	add    al,bl
30002477:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000247a:	04 00                	add    al,0x0
3000247c:	20 00                	and    BYTE PTR [eax],al
3000247e:	00 00                	add    BYTE PTR [eax],al
30002480:	b4 04                	mov    ah,0x4
30002482:	00 00                	add    BYTE PTR [eax],al
30002484:	04 e7                	add    al,0xe7
30002486:	ff                   	(bad)  
30002487:	ff 2c 00             	jmp    FWORD PTR [eax+eax*1]
3000248a:	00 00                	add    BYTE PTR [eax],al
3000248c:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000248f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002495:	44                   	inc    esp
30002496:	83 03 64             	add    DWORD PTR [ebx],0x64
30002499:	c5 c3 0c             	(bad)  
3000249c:	04 04                	add    al,0x4
3000249e:	00 00                	add    BYTE PTR [eax],al
300024a0:	20 00                	and    BYTE PTR [eax],al
300024a2:	00 00                	add    BYTE PTR [eax],al
300024a4:	d8 04 00             	fadd   DWORD PTR [eax+eax*1]
300024a7:	00 0c e7             	add    BYTE PTR [edi+eiz*8],cl
300024aa:	ff                   	(bad)  
300024ab:	ff 26                	jmp    DWORD PTR [esi]
300024ad:	00 00                	add    BYTE PTR [eax],al
300024af:	00 00                	add    BYTE PTR [eax],al
300024b1:	41                   	inc    ecx
300024b2:	0e                   	push   cs
300024b3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300024b9:	44                   	inc    esp
300024ba:	83 03 5e             	add    DWORD PTR [ebx],0x5e
300024bd:	c5 c3 0c             	(bad)  
300024c0:	04 04                	add    al,0x4
300024c2:	00 00                	add    BYTE PTR [eax],al
300024c4:	1c 00                	sbb    al,0x0
300024c6:	00 00                	add    BYTE PTR [eax],al
300024c8:	fc                   	cld    
300024c9:	04 00                	add    al,0x0
300024cb:	00 0e                	add    BYTE PTR [esi],cl
300024cd:	e7 ff                	out    0xff,eax
300024cf:	ff 53 00             	call   DWORD PTR [ebx+0x0]
300024d2:	00 00                	add    BYTE PTR [eax],al
300024d4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300024d7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300024dd:	02 4f c5             	add    cl,BYTE PTR [edi-0x3b]
300024e0:	0c 04                	or     al,0x4
300024e2:	04 00                	add    al,0x0
300024e4:	20 00                	and    BYTE PTR [eax],al
300024e6:	00 00                	add    BYTE PTR [eax],al
300024e8:	1c 05                	sbb    al,0x5
300024ea:	00 00                	add    BYTE PTR [eax],al
300024ec:	44                   	inc    esp
300024ed:	e7 ff                	out    0xff,eax
300024ef:	ff                   	(bad)  
300024f0:	3e 00 00             	add    BYTE PTR ds:[eax],al
300024f3:	00 00                	add    BYTE PTR [eax],al
300024f5:	41                   	inc    ecx
300024f6:	0e                   	push   cs
300024f7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300024fd:	44                   	inc    esp
300024fe:	83 03 76             	add    DWORD PTR [ebx],0x76
30002501:	c5 c3 0c             	(bad)  
30002504:	04 04                	add    al,0x4
30002506:	00 00                	add    BYTE PTR [eax],al
30002508:	1c 00                	sbb    al,0x0
3000250a:	00 00                	add    BYTE PTR [eax],al
3000250c:	40                   	inc    eax
3000250d:	05 00 00 5e e7       	add    eax,0xe75e0000
30002512:	ff                   	(bad)  
30002513:	ff 6f 00             	jmp    FWORD PTR [edi+0x0]
30002516:	00 00                	add    BYTE PTR [eax],al
30002518:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000251b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002521:	02 6b c5             	add    ch,BYTE PTR [ebx-0x3b]
30002524:	0c 04                	or     al,0x4
30002526:	04 00                	add    al,0x0
30002528:	24 00                	and    al,0x0
3000252a:	00 00                	add    BYTE PTR [eax],al
3000252c:	60                   	pusha  
3000252d:	05 00 00 b0 e7       	add    eax,0xe7b00000
30002532:	ff                   	(bad)  
30002533:	ff 5e 00             	call   FWORD PTR [esi+0x0]
30002536:	00 00                	add    BYTE PTR [eax],al
30002538:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000253b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002541:	45                   	inc    ebp
30002542:	86 03                	xchg   BYTE PTR [ebx],al
30002544:	83 04 02 53          	add    DWORD PTR [edx+eax*1],0x53
30002548:	c3                   	ret    
30002549:	41                   	inc    ecx
3000254a:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
3000254e:	04 04                	add    al,0x4
30002550:	1c 00                	sbb    al,0x0
30002552:	00 00                	add    BYTE PTR [eax],al
30002554:	88 05 00 00 e8 e7    	mov    BYTE PTR ds:0xe7e80000,al
3000255a:	ff                   	(bad)  
3000255b:	ff 40 00             	inc    DWORD PTR [eax+0x0]
3000255e:	00 00                	add    BYTE PTR [eax],al
30002560:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002563:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002569:	7c c5                	jl     30002530 <__x86.get_pc_thunk.cx+0x568>
3000256b:	0c 04                	or     al,0x4
3000256d:	04 00                	add    al,0x0
3000256f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002572:	00 00                	add    BYTE PTR [eax],al
30002574:	a8 05                	test   al,0x5
30002576:	00 00                	add    BYTE PTR [eax],al
30002578:	08 e8                	or     al,ch
3000257a:	ff                   	(bad)  
3000257b:	ff 47 00             	inc    DWORD PTR [edi+0x0]
3000257e:	00 00                	add    BYTE PTR [eax],al
30002580:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002583:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002589:	02 43 c5             	add    al,BYTE PTR [ebx-0x3b]
3000258c:	0c 04                	or     al,0x4
3000258e:	04 00                	add    al,0x0
30002590:	1c 00                	sbb    al,0x0
30002592:	00 00                	add    BYTE PTR [eax],al
30002594:	c8 05 00 00          	enter  0x5,0x0
30002598:	30 e8                	xor    al,ch
3000259a:	ff                   	(bad)  
3000259b:	ff 31                	push   DWORD PTR [ecx]
3000259d:	00 00                	add    BYTE PTR [eax],al
3000259f:	00 00                	add    BYTE PTR [eax],al
300025a1:	41                   	inc    ecx
300025a2:	0e                   	push   cs
300025a3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025a9:	6d                   	ins    DWORD PTR es:[edi],dx
300025aa:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300025ad:	04 00                	add    al,0x0
300025af:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300025b2:	00 00                	add    BYTE PTR [eax],al
300025b4:	e8 05 00 00 44       	call   740025be <ticksToWait+0x43fff11e>
300025b9:	e8 ff ff 67 00       	call   306825bd <ticksToWait+0x67f11d>
300025be:	00 00                	add    BYTE PTR [eax],al
300025c0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300025c3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025c9:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
300025cc:	0c 04                	or     al,0x4
300025ce:	04 00                	add    al,0x0
300025d0:	1c 00                	sbb    al,0x0
300025d2:	00 00                	add    BYTE PTR [eax],al
300025d4:	08 06                	or     BYTE PTR [esi],al
300025d6:	00 00                	add    BYTE PTR [eax],al
300025d8:	8c e8                	mov    eax,gs
300025da:	ff                   	(bad)  
300025db:	ff 60 00             	jmp    DWORD PTR [eax+0x0]
300025de:	00 00                	add    BYTE PTR [eax],al
300025e0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300025e3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025e9:	02 5c c5 0c          	add    bl,BYTE PTR [ebp+eax*8+0xc]
300025ed:	04 04                	add    al,0x4
300025ef:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
300025f2:	00 00                	add    BYTE PTR [eax],al
300025f4:	28 06                	sub    BYTE PTR [esi],al
300025f6:	00 00                	add    BYTE PTR [eax],al
300025f8:	cc                   	int3   
300025f9:	e8 ff ff 7d 01       	call   317e25fd <ticksToWait+0x17df15d>
300025fe:	00 00                	add    BYTE PTR [eax],al
30002600:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002603:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002609:	46                   	inc    esi
3000260a:	87 03                	xchg   DWORD PTR [ebx],eax
3000260c:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
3000260f:	05 03 70 01 c3       	add    eax,0xc3017003
30002614:	41                   	inc    ecx
30002615:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002619:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000261c:	04 00                	add    al,0x0
3000261e:	00 00                	add    BYTE PTR [eax],al
30002620:	1c 00                	sbb    al,0x0
30002622:	00 00                	add    BYTE PTR [eax],al
30002624:	58                   	pop    eax
30002625:	06                   	push   es
30002626:	00 00                	add    BYTE PTR [eax],al
30002628:	1c ea                	sbb    al,0xea
3000262a:	ff                   	(bad)  
3000262b:	ff 1d 00 00 00 00    	call   FWORD PTR ds:0x0
30002631:	41                   	inc    ecx
30002632:	0e                   	push   cs
30002633:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002639:	59                   	pop    ecx
3000263a:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000263d:	04 00                	add    al,0x0
3000263f:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
30002642:	00 00                	add    BYTE PTR [eax],al
30002644:	78 06                	js     3000264c <__x86.get_pc_thunk.cx+0x684>
30002646:	00 00                	add    BYTE PTR [eax],al
30002648:	1c ea                	sbb    al,0xea
3000264a:	ff                   	(bad)  
3000264b:	ff 9c 01 00 00 00 41 	call   FWORD PTR [ecx+eax*1+0x41000000]
30002652:	0e                   	push   cs
30002653:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002659:	46                   	inc    esi
3000265a:	87 03                	xchg   DWORD PTR [ebx],eax
3000265c:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
3000265f:	05 03 8f 01 c3       	add    eax,0xc3018f03
30002664:	41                   	inc    ecx
30002665:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002669:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000266c:	04 00                	add    al,0x0
3000266e:	00 00                	add    BYTE PTR [eax],al
30002670:	20 00                	and    BYTE PTR [eax],al
30002672:	00 00                	add    BYTE PTR [eax],al
30002674:	a8 06                	test   al,0x6
30002676:	00 00                	add    BYTE PTR [eax],al
30002678:	88 eb                	mov    bl,ch
3000267a:	ff                   	(bad)  
3000267b:	ff b5 00 00 00 00    	push   DWORD PTR [ebp+0x0]
30002681:	41                   	inc    ecx
30002682:	0e                   	push   cs
30002683:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002689:	44                   	inc    esp
3000268a:	83 03 02             	add    DWORD PTR [ebx],0x2
3000268d:	ad                   	lods   eax,DWORD PTR ds:[esi]
3000268e:	c5 c3 0c             	(bad)  
30002691:	04 04                	add    al,0x4
30002693:	00 20                	add    BYTE PTR [eax],ah
30002695:	00 00                	add    BYTE PTR [eax],al
30002697:	00 cc                	add    ah,cl
30002699:	06                   	push   es
3000269a:	00 00                	add    BYTE PTR [eax],al
3000269c:	19 ec                	sbb    esp,ebp
3000269e:	ff                   	(bad)  
3000269f:	ff 9e 00 00 00 00    	call   FWORD PTR [esi+0x0]
300026a5:	41                   	inc    ecx
300026a6:	0e                   	push   cs
300026a7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026ad:	44                   	inc    esp
300026ae:	83 03 02             	add    DWORD PTR [ebx],0x2
300026b1:	96                   	xchg   esi,eax
300026b2:	c5 c3 0c             	(bad)  
300026b5:	04 04                	add    al,0x4
300026b7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300026ba:	00 00                	add    BYTE PTR [eax],al
300026bc:	f0 06                	lock push es
300026be:	00 00                	add    BYTE PTR [eax],al
300026c0:	94                   	xchg   esp,eax
300026c1:	ec                   	in     al,dx
300026c2:	ff                   	(bad)  
300026c3:	ff 29                	jmp    FWORD PTR [ecx]
300026c5:	00 00                	add    BYTE PTR [eax],al
300026c7:	00 00                	add    BYTE PTR [eax],al
300026c9:	41                   	inc    ecx
300026ca:	0e                   	push   cs
300026cb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026d1:	65 c5 0c 04          	lds    ecx,FWORD PTR gs:[esp+eax*1]
300026d5:	04 00                	add    al,0x0
300026d7:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
300026da:	00 00                	add    BYTE PTR [eax],al
300026dc:	10 07                	adc    BYTE PTR [edi],al
300026de:	00 00                	add    BYTE PTR [eax],al
300026e0:	9d                   	popf   
300026e1:	ec                   	in     al,dx
300026e2:	ff                   	(bad)  
300026e3:	ff 19                	call   FWORD PTR [ecx]
300026e5:	03 00                	add    eax,DWORD PTR [eax]
300026e7:	00 00                	add    BYTE PTR [eax],al
300026e9:	41                   	inc    ecx
300026ea:	0e                   	push   cs
300026eb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026f1:	44                   	inc    esp
300026f2:	83 03 03             	add    DWORD PTR [ebx],0x3
300026f5:	10 03                	adc    BYTE PTR [ebx],al
300026f7:	c3                   	ret    
300026f8:	41                   	inc    ecx
300026f9:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300026fc:	04 00                	add    al,0x0
300026fe:	00 00                	add    BYTE PTR [eax],al
30002700:	20 00                	and    BYTE PTR [eax],al
30002702:	00 00                	add    BYTE PTR [eax],al
30002704:	38 07                	cmp    BYTE PTR [edi],al
30002706:	00 00                	add    BYTE PTR [eax],al
30002708:	8e ef                	mov    gs,edi
3000270a:	ff                   	(bad)  
3000270b:	ff                   	(bad)  
3000270c:	3f                   	aas    
3000270d:	00 00                	add    BYTE PTR [eax],al
3000270f:	00 00                	add    BYTE PTR [eax],al
30002711:	41                   	inc    ecx
30002712:	0e                   	push   cs
30002713:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002719:	44                   	inc    esp
3000271a:	83 03 77             	add    DWORD PTR [ebx],0x77
3000271d:	c5 c3 0c             	(bad)  
30002720:	04 04                	add    al,0x4
30002722:	00 00                	add    BYTE PTR [eax],al
30002724:	20 00                	and    BYTE PTR [eax],al
30002726:	00 00                	add    BYTE PTR [eax],al
30002728:	5c                   	pop    esp
30002729:	07                   	pop    es
3000272a:	00 00                	add    BYTE PTR [eax],al
3000272c:	a9 ef ff ff 3e       	test   eax,0x3effffef
30002731:	00 00                	add    BYTE PTR [eax],al
30002733:	00 00                	add    BYTE PTR [eax],al
30002735:	41                   	inc    ecx
30002736:	0e                   	push   cs
30002737:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000273d:	44                   	inc    esp
3000273e:	83 03 76             	add    DWORD PTR [ebx],0x76
30002741:	c5 c3 0c             	(bad)  
30002744:	04 04                	add    al,0x4
30002746:	00 00                	add    BYTE PTR [eax],al
30002748:	2c 00                	sub    al,0x0
3000274a:	00 00                	add    BYTE PTR [eax],al
3000274c:	80 07 00             	add    BYTE PTR [edi],0x0
3000274f:	00 c3                	add    bl,al
30002751:	ef                   	out    dx,eax
30002752:	ff                   	(bad)  
30002753:	ff 57 08             	call   DWORD PTR [edi+0x8]
30002756:	00 00                	add    BYTE PTR [eax],al
30002758:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000275b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002761:	46                   	inc    esi
30002762:	87 03                	xchg   DWORD PTR [ebx],eax
30002764:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
30002767:	05 03 4a 08 c3       	add    eax,0xc3084a03
3000276c:	41                   	inc    ecx
3000276d:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002771:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002774:	04 00                	add    al,0x0
30002776:	00 00                	add    BYTE PTR [eax],al
30002778:	10 00                	adc    BYTE PTR [eax],al
3000277a:	00 00                	add    BYTE PTR [eax],al
3000277c:	b0 07                	mov    al,0x7
3000277e:	00 00                	add    BYTE PTR [eax],al
30002780:	48                   	dec    eax
30002781:	f8                   	clc    
30002782:	ff                   	(bad)  
30002783:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
30002786:	00 00                	add    BYTE PTR [eax],al
30002788:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynsym:

3000278c <.dynsym>:
	...
3000279c:	9e                   	sahf   
3000279d:	00 00                	add    BYTE PTR [eax],al
3000279f:	00 40 0d             	add    BYTE PTR [eax+0xd],al
300027a2:	00 30                	add    BYTE PTR [eax],dh
300027a4:	40                   	inc    eax
300027a5:	00 00                	add    BYTE PTR [eax],al
300027a7:	00 12                	add    BYTE PTR [edx],dl
300027a9:	00 01                	add    BYTE PTR [ecx],al
300027ab:	00 56 00             	add    BYTE PTR [esi+0x0],dl
300027ae:	00 00                	add    BYTE PTR [eax],al
300027b0:	cb                   	retf   
300027b1:	05 00 30 1d 00       	add    eax,0x1d3000
300027b6:	00 00                	add    BYTE PTR [eax],al
300027b8:	12 00                	adc    al,BYTE PTR [eax]
300027ba:	01 00                	add    DWORD PTR [eax],eax
300027bc:	45                   	inc    ebp
300027bd:	00 00                	add    BYTE PTR [eax],al
300027bf:	00 64 04 00          	add    BYTE PTR [esp+eax*1+0x0],ah
300027c3:	30 34 00             	xor    BYTE PTR [eax+eax*1],dh
300027c6:	00 00                	add    BYTE PTR [eax],al
300027c8:	12 00                	adc    al,BYTE PTR [eax]
300027ca:	01 00                	add    DWORD PTR [eax],eax
300027cc:	36 00 00             	add    BYTE PTR ss:[eax],al
300027cf:	00 4c 02 00          	add    BYTE PTR [edx+eax*1+0x0],cl
300027d3:	30 d1                	xor    cl,dl
300027d5:	00 00                	add    BYTE PTR [eax],al
300027d7:	00 12                	add    BYTE PTR [edx],dl
300027d9:	00 01                	add    BYTE PTR [ecx],al
300027db:	00 31                	add    BYTE PTR [ecx],dh
300027dd:	00 00                	add    BYTE PTR [eax],al
300027df:	00 1d 02 00 30 2f    	add    BYTE PTR ds:0x2f300002,bl
300027e5:	00 00                	add    BYTE PTR [eax],al
300027e7:	00 12                	add    BYTE PTR [edx],dl
300027e9:	00 01                	add    BYTE PTR [ecx],al
300027eb:	00 82 00 00 00 24    	add    BYTE PTR [edx+0x24000000],al
300027f1:	09 00                	or     DWORD PTR [eax],eax
300027f3:	30 9b 01 00 00 12    	xor    BYTE PTR [ebx+0x12000001],bl
300027f9:	00 01                	add    BYTE PTR [ecx],al
300027fb:	00 17                	add    BYTE PTR [edi],dl
300027fd:	00 00                	add    BYTE PTR [eax],al
300027ff:	00 b4 01 00 30 26 00 	add    BYTE PTR [ecx+eax*1+0x263000],dh
30002806:	00 00                	add    BYTE PTR [eax],al
30002808:	12 00                	adc    al,BYTE PTR [eax]
3000280a:	01 00                	add    DWORD PTR [eax],eax
3000280c:	76 00                	jbe    3000280e <__x86.get_pc_thunk.cx+0x846>
3000280e:	00 00                	add    BYTE PTR [eax],al
30002810:	fc                   	cld    
30002811:	06                   	push   es
30002812:	00 30                	add    BYTE PTR [eax],dh
30002814:	c7 01 00 00 12 00    	mov    DWORD PTR [ecx],0x120000
3000281a:	01 00                	add    DWORD PTR [eax],eax
3000281c:	4b                   	dec    ebx
3000281d:	00 00                	add    BYTE PTR [eax],al
3000281f:	00 03                	add    BYTE PTR [ebx],al
30002821:	05 00 30 4e 00       	add    eax,0x4e3000
30002826:	00 00                	add    BYTE PTR [eax],al
30002828:	12 00                	adc    al,BYTE PTR [eax]
3000282a:	01 00                	add    DWORD PTR [eax],eax
3000282c:	c4 00                	les    eax,FWORD PTR [eax]
3000282e:	00 00                	add    BYTE PTR [eax],al
30002830:	c4 0e                	les    ecx,FWORD PTR [esi]
30002832:	00 30                	add    BYTE PTR [eax],dh
30002834:	7d 01                	jge    30002837 <__x86.get_pc_thunk.cx+0x86f>
30002836:	00 00                	add    BYTE PTR [eax],al
30002838:	12 00                	adc    al,BYTE PTR [eax]
3000283a:	01 00                	add    DWORD PTR [eax],eax
3000283c:	66                   	data16
3000283d:	00 00                	add    BYTE PTR [eax],al
3000283f:	00 7d 13             	add    BYTE PTR [ebp+0x13],bh
30002842:	00 30                	add    BYTE PTR [eax],dh
30002844:	19 03                	sbb    DWORD PTR [ebx],eax
30002846:	00 00                	add    BYTE PTR [eax],al
30002848:	12 00                	adc    al,BYTE PTR [eax]
3000284a:	01 00                	add    DWORD PTR [eax],eax
3000284c:	d4 00                	aam    0x0
3000284e:	00 00                	add    BYTE PTR [eax],al
30002850:	64 10 00             	adc    BYTE PTR fs:[eax],al
30002853:	30 9c 01 00 00 12 00 	xor    BYTE PTR [ecx+eax*1+0x120000],bl
3000285a:	01 00                	add    DWORD PTR [eax],eax
3000285c:	3b 00                	cmp    eax,DWORD PTR [eax]
3000285e:	00 00                	add    BYTE PTR [eax],al
30002860:	e1 03                	loope  30002865 <__x86.get_pc_thunk.cx+0x89d>
30002862:	00 30                	add    BYTE PTR [eax],dh
30002864:	64 00 00             	add    BYTE PTR fs:[eax],al
30002867:	00 12                	add    BYTE PTR [edx],dl
30002869:	00 01                	add    BYTE PTR [ecx],al
3000286b:	00 90 00 00 00 30    	add    BYTE PTR [eax+0x30000000],dl
30002871:	0c 00                	or     al,0x0
30002873:	30 3e                	xor    BYTE PTR [esi],bh
30002875:	00 00                	add    BYTE PTR [eax],al
30002877:	00 12                	add    BYTE PTR [edx],dl
30002879:	00 01                	add    BYTE PTR [ecx],al
3000287b:	00 51 00             	add    BYTE PTR [ecx+0x0],dl
3000287e:	00 00                	add    BYTE PTR [eax],al
30002880:	97                   	xchg   edi,eax
30002881:	05 00 30 34 00       	add    eax,0x343000
30002886:	00 00                	add    BYTE PTR [eax],al
30002888:	12 00                	adc    al,BYTE PTR [eax]
3000288a:	01 00                	add    DWORD PTR [eax],eax
3000288c:	02 01                	add    al,BYTE PTR [ecx]
3000288e:	00 00                	add    BYTE PTR [eax],al
30002890:	13 17                	adc    edx,DWORD PTR [edi]
30002892:	00 30                	add    BYTE PTR [eax],dh
30002894:	57                   	push   edi
30002895:	08 00                	or     BYTE PTR [eax],al
30002897:	00 12                	add    BYTE PTR [edx],dl
30002899:	00 01                	add    BYTE PTR [ecx],al
3000289b:	00 b4 00 00 00 fc 0d 	add    BYTE PTR [eax+eax*1+0xdfc0000],dh
300028a2:	00 30                	add    BYTE PTR [eax],dh
300028a4:	67 00 00             	add    BYTE PTR [bx+si],al
300028a7:	00 12                	add    BYTE PTR [edx],dl
300028a9:	00 01                	add    BYTE PTR [ecx],al
300028ab:	00 bc 00 00 00 64 0e 	add    BYTE PTR [eax+eax*1+0xe640000],bh
300028b2:	00 30                	add    BYTE PTR [eax],dh
300028b4:	60                   	pusha  
300028b5:	00 00                	add    BYTE PTR [eax],al
300028b7:	00 12                	add    BYTE PTR [edx],dl
300028b9:	00 01                	add    BYTE PTR [ecx],al
300028bb:	00 10                	add    BYTE PTR [eax],dl
300028bd:	00 00                	add    BYTE PTR [eax],al
300028bf:	00 1c 01             	add    BYTE PTR [ecx+eax*1],bl
300028c2:	00 30                	add    BYTE PTR [eax],dh
300028c4:	97                   	xchg   edi,eax
300028c5:	00 00                	add    BYTE PTR [eax],al
300028c7:	00 12                	add    BYTE PTR [edx],dl
300028c9:	00 01                	add    BYTE PTR [ecx],al
300028cb:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300028ce:	00 00                	add    BYTE PTR [eax],al
300028d0:	00 00                	add    BYTE PTR [eax],al
300028d2:	13 00                	adc    eax,DWORD PTR [eax]
300028d4:	00 00                	add    BYTE PTR [eax],al
300028d6:	00 00                	add    BYTE PTR [eax],al
300028d8:	10 00                	adc    BYTE PTR [eax],al
300028da:	01 00                	add    DWORD PTR [eax],eax
300028dc:	ec                   	in     al,dx
300028dd:	00 00                	add    BYTE PTR [eax],al
300028df:	00 96 16 00 30 3f    	add    BYTE PTR [esi+0x3f300016],dl
300028e5:	00 00                	add    BYTE PTR [eax],al
300028e7:	00 12                	add    BYTE PTR [edx],dl
300028e9:	00 01                	add    BYTE PTR [ecx],al
300028eb:	00 89 00 00 00 c0    	add    BYTE PTR [ecx-0x40000000],cl
300028f1:	0a 00                	or     al,BYTE PTR [eax]
300028f3:	30 c7                	xor    bh,al
300028f5:	00 00                	add    BYTE PTR [eax],al
300028f7:	00 12                	add    BYTE PTR [edx],dl
300028f9:	00 01                	add    BYTE PTR [ecx],al
300028fb:	00 db                	add    bl,bl
300028fd:	00 00                	add    BYTE PTR [eax],al
300028ff:	00 00                	add    BYTE PTR [eax],al
30002901:	12 00                	adc    al,BYTE PTR [eax]
30002903:	30 b5 00 00 00 12    	xor    BYTE PTR [ebp+0x12000000],dh
30002909:	00 01                	add    BYTE PTR [ecx],al
3000290b:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
3000290e:	00 00                	add    BYTE PTR [eax],al
30002910:	54                   	push   esp
30002911:	13 00                	adc    eax,DWORD PTR [eax]
30002913:	30 29                	xor    BYTE PTR [ecx],ch
30002915:	00 00                	add    BYTE PTR [eax],al
30002917:	00 12                	add    BYTE PTR [edx],dl
30002919:	00 01                	add    BYTE PTR [ecx],al
3000291b:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
3000291e:	00 00                	add    BYTE PTR [eax],al
30002920:	da 01                	fiadd  DWORD PTR [ecx]
30002922:	00 30                	add    BYTE PTR [eax],dh
30002924:	43                   	inc    ebx
30002925:	00 00                	add    BYTE PTR [eax],al
30002927:	00 12                	add    BYTE PTR [edx],dl
30002929:	00 01                	add    BYTE PTR [ecx],al
3000292b:	00 a5 00 00 00 e0    	add    BYTE PTR [ebp-0x20000000],ah
30002931:	0c 00                	or     al,0x0
30002933:	30 5e 00             	xor    BYTE PTR [esi+0x0],bl
30002936:	00 00                	add    BYTE PTR [eax],al
30002938:	12 00                	adc    al,BYTE PTR [eax]
3000293a:	01 00                	add    DWORD PTR [eax],eax
3000293c:	6f                   	outs   dx,DWORD PTR ds:[esi]
3000293d:	00 00                	add    BYTE PTR [eax],al
3000293f:	00 2a                	add    BYTE PTR [edx],ch
30002941:	06                   	push   es
30002942:	00 30                	add    BYTE PTR [eax],dh
30002944:	20 00                	and    BYTE PTR [eax],al
30002946:	00 00                	add    BYTE PTR [eax],al
30002948:	12 00                	adc    al,BYTE PTR [eax]
3000294a:	01 00                	add    DWORD PTR [eax],eax
3000294c:	e3 00                	jecxz  3000294e <__x86.get_pc_thunk.cx+0x986>
3000294e:	00 00                	add    BYTE PTR [eax],al
30002950:	b5 12                	mov    ch,0x12
30002952:	00 30                	add    BYTE PTR [eax],dh
30002954:	9e                   	sahf   
30002955:	00 00                	add    BYTE PTR [eax],al
30002957:	00 12                	add    BYTE PTR [edx],dl
30002959:	00 01                	add    BYTE PTR [ecx],al
3000295b:	00 08                	add    BYTE PTR [eax],cl
3000295d:	00 00                	add    BYTE PTR [eax],al
3000295f:	00 70 00             	add    BYTE PTR [eax+0x0],dh
30002962:	00 30                	add    BYTE PTR [eax],dh
30002964:	55                   	push   ebp
30002965:	00 00                	add    BYTE PTR [eax],al
30002967:	00 12                	add    BYTE PTR [edx],dl
30002969:	00 01                	add    BYTE PTR [ecx],al
3000296b:	00 ac 00 00 00 80 0d 	add    BYTE PTR [eax+eax*1+0xd800000],ch
30002972:	00 30                	add    BYTE PTR [eax],dh
30002974:	47                   	inc    edi
30002975:	00 00                	add    BYTE PTR [eax],al
30002977:	00 12                	add    BYTE PTR [edx],dl
30002979:	00 01                	add    BYTE PTR [ecx],al
3000297b:	00 f6                	add    dh,dh
3000297d:	00 00                	add    BYTE PTR [eax],al
3000297f:	00 d5                	add    ch,dl
30002981:	16                   	push   ss
30002982:	00 30                	add    BYTE PTR [eax],dh
30002984:	3e 00 00             	add    BYTE PTR ds:[eax],al
30002987:	00 12                	add    BYTE PTR [edx],dl
30002989:	00 01                	add    BYTE PTR [ecx],al
3000298b:	00 5e 00             	add    BYTE PTR [esi+0x0],bl
3000298e:	00 00                	add    BYTE PTR [eax],al
30002990:	e8 05 00 30 42       	call   7230299a <ticksToWait+0x422ff4fa>
30002995:	00 00                	add    BYTE PTR [eax],al
30002997:	00 12                	add    BYTE PTR [edx],dl
30002999:	00 01                	add    BYTE PTR [ecx],al
3000299b:	00 97 00 00 00 c8    	add    BYTE PTR [edi-0x38000000],dl
300029a1:	0d 00 30 31 00       	or     eax,0x313000
300029a6:	00 00                	add    BYTE PTR [eax],al
300029a8:	12 00                	adc    al,BYTE PTR [eax]
300029aa:	01 00                	add    DWORD PTR [eax],eax
300029ac:	01 00                	add    DWORD PTR [eax],eax
300029ae:	00 00                	add    BYTE PTR [eax],al
300029b0:	00 00                	add    BYTE PTR [eax],al
300029b2:	00 30                	add    BYTE PTR [eax],dh
300029b4:	38 00                	cmp    BYTE PTR [eax],al
300029b6:	00 00                	add    BYTE PTR [eax],al
300029b8:	12 00                	adc    al,BYTE PTR [eax]
300029ba:	01 00                	add    DWORD PTR [eax],eax
300029bc:	cc                   	int3   
300029bd:	00 00                	add    BYTE PTR [eax],al
300029bf:	00 44 10 00          	add    BYTE PTR [eax+edx*1+0x0],al
300029c3:	30 1d 00 00 00 12    	xor    BYTE PTR ds:0x12000000,bl
300029c9:	00 01                	add    BYTE PTR [ecx],al
300029cb:	00 7d 00             	add    BYTE PTR [ebp+0x0],bh
300029ce:	00 00                	add    BYTE PTR [eax],al
300029d0:	c3                   	ret    
300029d1:	08 00                	or     BYTE PTR [eax],al
300029d3:	30 39                	xor    BYTE PTR [ecx],bh
300029d5:	00 00                	add    BYTE PTR [eax],al
300029d7:	00 12                	add    BYTE PTR [edx],dl
300029d9:	00 01                	add    BYTE PTR [ecx],al
	...

Disassembly of section .dynstr:

300029dc <.dynstr>:
300029dc:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
300029df:	72 63                	jb     30002a44 <__x86.get_pc_thunk.cx+0xa7c>
300029e1:	68 72 00 73 74       	push   0x74730072
300029e6:	72 63                	jb     30002a4b <__x86.get_pc_thunk.cx+0xa83>
300029e8:	73 70                	jae    30002a5a <__x86.get_pc_thunk.cx+0xa92>
300029ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
300029eb:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
300029ee:	72 74                	jb     30002a64 <__x86.get_pc_thunk.cx+0xa9c>
300029f0:	6f                   	outs   dx,DWORD PTR ds:[esi]
300029f1:	6b 00 70             	imul   eax,DWORD PTR [eax],0x70
300029f4:	75 74                	jne    30002a6a <__x86.get_pc_thunk.cx+0xaa2>
300029f6:	73 00                	jae    300029f8 <__x86.get_pc_thunk.cx+0xa30>
300029f8:	73 79                	jae    30002a73 <__x86.get_pc_thunk.cx+0xaab>
300029fa:	73 45                	jae    30002a41 <__x86.get_pc_thunk.cx+0xa79>
300029fc:	6e                   	outs   dx,BYTE PTR ds:[esi]
300029fd:	74 65                	je     30002a64 <__x86.get_pc_thunk.cx+0xa9c>
300029ff:	72 5f                	jb     30002a60 <__x86.get_pc_thunk.cx+0xa98>
30002a01:	56                   	push   esi
30002a02:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
30002a07:	00 70 75             	add    BYTE PTR [eax+0x75],dh
30002a0a:	74 63                	je     30002a6f <__x86.get_pc_thunk.cx+0xaa7>
30002a0c:	00 67 65             	add    BYTE PTR [edi+0x65],ah
30002a0f:	74 63                	je     30002a74 <__x86.get_pc_thunk.cx+0xaac>
30002a11:	00 67 65             	add    BYTE PTR [edi+0x65],ah
30002a14:	74 73                	je     30002a89 <__x86.get_pc_thunk.cx+0xac1>
30002a16:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002a1a:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
30002a1d:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002a1e:	69 74 00 70 72 69 6e 	imul   esi,DWORD PTR [eax+eax*1+0x70],0x746e6972
30002a25:	74 
30002a26:	00 73 6c             	add    BYTE PTR [ebx+0x6c],dh
30002a29:	65                   	gs
30002a2a:	65                   	gs
30002a2b:	70 00                	jo     30002a2d <__x86.get_pc_thunk.cx+0xa65>
30002a2d:	65                   	gs
30002a2e:	78 65                	js     30002a95 <__x86.get_pc_thunk.cx+0xacd>
30002a30:	63 00                	arpl   WORD PTR [eax],ax
30002a32:	77 61                	ja     30002a95 <__x86.get_pc_thunk.cx+0xacd>
30002a34:	69 74 70 69 64 00 67 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x65670064
30002a3b:	65 
30002a3c:	74 74                	je     30002ab2 <__x86.get_pc_thunk.cx+0xaea>
30002a3e:	69 6d 65 00 67 6d 74 	imul   ebp,DWORD PTR [ebp+0x65],0x746d6700
30002a45:	69 6d 65 5f 72 00 67 	imul   ebp,DWORD PTR [ebp+0x65],0x6700725f
30002a4c:	65                   	gs
30002a4d:	74 63                	je     30002ab2 <__x86.get_pc_thunk.cx+0xaea>
30002a4f:	77 64                	ja     30002ab5 <__x86.get_pc_thunk.cx+0xaed>
30002a51:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
30002a54:	6c                   	ins    BYTE PTR es:[edi],dx
30002a55:	6c                   	ins    BYTE PTR es:[edi],dx
30002a56:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002a57:	63 00                	arpl   WORD PTR [eax],ax
30002a59:	66                   	data16
30002a5a:	72 65                	jb     30002ac1 <__x86.get_pc_thunk.cx+0xaf9>
30002a5c:	65 00 6d 65          	add    BYTE PTR gs:[ebp+0x65],ch
30002a60:	6d                   	ins    DWORD PTR es:[edi],dx
30002a61:	63 70 79             	arpl   WORD PTR [eax+0x79],si
30002a64:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
30002a67:	6d                   	ins    DWORD PTR es:[edi],dx
30002a68:	73 65                	jae    30002acf <__x86.get_pc_thunk.cx+0xb07>
30002a6a:	74 00                	je     30002a6c <__x86.get_pc_thunk.cx+0xaa4>
30002a6c:	73 74                	jae    30002ae2 <__x86.get_pc_thunk.cx+0xb1a>
30002a6e:	72 63                	jb     30002ad3 <__x86.get_pc_thunk.cx+0xb0b>
30002a70:	61                   	popa   
30002a71:	74 00                	je     30002a73 <__x86.get_pc_thunk.cx+0xaab>
30002a73:	73 74                	jae    30002ae9 <__x86.get_pc_thunk.cx+0xb21>
30002a75:	72 6c                	jb     30002ae3 <__x86.get_pc_thunk.cx+0xb1b>
30002a77:	65 6e                	outs   dx,BYTE PTR gs:[esi]
30002a79:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a7c:	72 63                	jb     30002ae1 <__x86.get_pc_thunk.cx+0xb19>
30002a7e:	70 79                	jo     30002af9 <__x86.get_pc_thunk.cx+0xb31>
30002a80:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a83:	72 63                	jb     30002ae8 <__x86.get_pc_thunk.cx+0xb20>
30002a85:	6d                   	ins    DWORD PTR es:[edi],dx
30002a86:	70 00                	jo     30002a88 <__x86.get_pc_thunk.cx+0xac0>
30002a88:	73 74                	jae    30002afe <__x86.get_pc_thunk.cx+0xb36>
30002a8a:	72 63                	jb     30002aef <__x86.get_pc_thunk.cx+0xb27>
30002a8c:	70 79                	jo     30002b07 <__x86.get_pc_thunk.cx+0xb3f>
30002a8e:	63 00                	arpl   WORD PTR [eax],ax
30002a90:	73 74                	jae    30002b06 <__x86.get_pc_thunk.cx+0xb3e>
30002a92:	72 6e                	jb     30002b02 <__x86.get_pc_thunk.cx+0xb3a>
30002a94:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
30002a97:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002a9a:	72 6e                	jb     30002b0a <__x86.get_pc_thunk.cx+0xb42>
30002a9c:	63 70 79             	arpl   WORD PTR [eax+0x79],si
30002a9f:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002aa2:	72 74                	jb     30002b18 <__x86.get_pc_thunk.cx+0xb50>
30002aa4:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002aa5:	75 6c                	jne    30002b13 <__x86.get_pc_thunk.cx+0xb4b>
30002aa7:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002aaa:	72 6c                	jb     30002b18 <__x86.get_pc_thunk.cx+0xb50>
30002aac:	65                   	gs
30002aad:	66                   	data16
30002aae:	74 00                	je     30002ab0 <__x86.get_pc_thunk.cx+0xae8>
30002ab0:	73 74                	jae    30002b26 <__x86.get_pc_thunk.cx+0xb5e>
30002ab2:	72 74                	jb     30002b28 <__x86.get_pc_thunk.cx+0xb60>
30002ab4:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002ab5:	6c                   	ins    BYTE PTR es:[edi],dx
30002ab6:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002ab9:	72 74                	jb     30002b2f <__x86.get_pc_thunk.cx+0xb67>
30002abb:	72 69                	jb     30002b26 <__x86.get_pc_thunk.cx+0xb5e>
30002abd:	6d                   	ins    DWORD PTR es:[edi],dx
30002abe:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002ac1:	72 74                	jb     30002b37 <__x86.get_pc_thunk.cx+0xb6f>
30002ac3:	72 69                	jb     30002b2e <__x86.get_pc_thunk.cx+0xb66>
30002ac5:	6d                   	ins    DWORD PTR es:[edi],dx
30002ac6:	32 00                	xor    al,BYTE PTR [eax]
30002ac8:	6c                   	ins    BYTE PTR es:[edi],dx
30002ac9:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002aca:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
30002acd:	74 69                	je     30002b38 <__x86.get_pc_thunk.cx+0xb70>
30002acf:	6d                   	ins    DWORD PTR es:[edi],dx
30002ad0:	65 00 6c 6f 63       	add    BYTE PTR gs:[edi+ebp*2+0x63],ch
30002ad5:	61                   	popa   
30002ad6:	6c                   	ins    BYTE PTR es:[edi],dx
30002ad7:	74 69                	je     30002b42 <__x86.get_pc_thunk.cx+0xb7a>
30002ad9:	6d                   	ins    DWORD PTR es:[edi],dx
30002ada:	65                   	gs
30002adb:	5f                   	pop    edi
30002adc:	72 00                	jb     30002ade <__x86.get_pc_thunk.cx+0xb16>
30002ade:	6d                   	ins    DWORD PTR es:[edi],dx
30002adf:	6b 74 69 6d 65       	imul   esi,DWORD PTR [ecx+ebp*2+0x6d],0x65
	...

Disassembly of section .hash:

30002ae8 <.hash>:
30002ae8:	11 00                	adc    DWORD PTR [eax],eax
30002aea:	00 00                	add    BYTE PTR [eax],al
30002aec:	25 00 00 00 0f       	and    eax,0xf000000
30002af1:	00 00                	add    BYTE PTR [eax],al
30002af3:	00 20                	add    BYTE PTR [eax],ah
30002af5:	00 00                	add    BYTE PTR [eax],al
30002af7:	00 00                	add    BYTE PTR [eax],al
30002af9:	00 00                	add    BYTE PTR [eax],al
30002afb:	00 1d 00 00 00 21    	add    BYTE PTR ds:0x21000000,bl
30002b01:	00 00                	add    BYTE PTR [eax],al
30002b03:	00 19                	add    BYTE PTR [ecx],bl
30002b05:	00 00                	add    BYTE PTR [eax],al
30002b07:	00 1f                	add    BYTE PTR [edi],bl
30002b09:	00 00                	add    BYTE PTR [eax],al
30002b0b:	00 03                	add    BYTE PTR [ebx],al
30002b0d:	00 00                	add    BYTE PTR [eax],al
30002b0f:	00 0d 00 00 00 00    	add    BYTE PTR ds:0x0,cl
30002b15:	00 00                	add    BYTE PTR [eax],al
30002b17:	00 17                	add    BYTE PTR [edi],dl
30002b19:	00 00                	add    BYTE PTR [eax],al
30002b1b:	00 23                	add    BYTE PTR [ebx],ah
30002b1d:	00 00                	add    BYTE PTR [eax],al
30002b1f:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
30002b22:	00 00                	add    BYTE PTR [eax],al
30002b24:	22 00                	and    al,BYTE PTR [eax]
30002b26:	00 00                	add    BYTE PTR [eax],al
30002b28:	0b 00                	or     eax,DWORD PTR [eax]
30002b2a:	00 00                	add    BYTE PTR [eax],al
30002b2c:	18 00                	sbb    BYTE PTR [eax],al
30002b2e:	00 00                	add    BYTE PTR [eax],al
30002b30:	1e                   	push   ds
	...
30002b5d:	00 00                	add    BYTE PTR [eax],al
30002b5f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
30002b62:	00 00                	add    BYTE PTR [eax],al
30002b64:	09 00                	or     DWORD PTR [eax],eax
30002b66:	00 00                	add    BYTE PTR [eax],al
30002b68:	06                   	push   es
30002b69:	00 00                	add    BYTE PTR [eax],al
30002b6b:	00 00                	add    BYTE PTR [eax],al
30002b6d:	00 00                	add    BYTE PTR [eax],al
30002b6f:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
30002b72:	00 00                	add    BYTE PTR [eax],al
30002b74:	02 00                	add    al,BYTE PTR [eax]
	...
30002b82:	00 00                	add    BYTE PTR [eax],al
30002b84:	01 00                	add    DWORD PTR [eax],eax
30002b86:	00 00                	add    BYTE PTR [eax],al
30002b88:	0a 00                	or     al,BYTE PTR [eax]
30002b8a:	00 00                	add    BYTE PTR [eax],al
30002b8c:	10 00                	adc    BYTE PTR [eax],al
30002b8e:	00 00                	add    BYTE PTR [eax],al
30002b90:	08 00                	or     BYTE PTR [eax],al
30002b92:	00 00                	add    BYTE PTR [eax],al
30002b94:	05 00 00 00 0e       	add    eax,0xe000000
30002b99:	00 00                	add    BYTE PTR [eax],al
30002b9b:	00 12                	add    BYTE PTR [edx],dl
30002b9d:	00 00                	add    BYTE PTR [eax],al
30002b9f:	00 16                	add    BYTE PTR [esi],dl
30002ba1:	00 00                	add    BYTE PTR [eax],al
30002ba3:	00 1a                	add    BYTE PTR [edx],bl
30002ba5:	00 00                	add    BYTE PTR [eax],al
30002ba7:	00 15 00 00 00 13    	add    BYTE PTR ds:0x13000000,dl
30002bad:	00 00                	add    BYTE PTR [eax],al
30002baf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002bb2:	00 00                	add    BYTE PTR [eax],al
30002bb4:	00 00                	add    BYTE PTR [eax],al
30002bb6:	00 00                	add    BYTE PTR [eax],al
30002bb8:	07                   	pop    es
30002bb9:	00 00                	add    BYTE PTR [eax],al
30002bbb:	00 1b                	add    BYTE PTR [ebx],bl
30002bbd:	00 00                	add    BYTE PTR [eax],al
30002bbf:	00 11                	add    BYTE PTR [ecx],dl
30002bc1:	00 00                	add    BYTE PTR [eax],al
30002bc3:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
	...

Disassembly of section .eh_frame:

30002bc8 <.eh_frame>:
30002bc8:	14 00                	adc    al,0x0
30002bca:	00 00                	add    BYTE PTR [eax],al
30002bcc:	00 00                	add    BYTE PTR [eax],al
30002bce:	00 00                	add    BYTE PTR [eax],al
30002bd0:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
30002bd3:	00 01                	add    BYTE PTR [ecx],al
30002bd5:	7c 08                	jl     30002bdf <__x86.get_pc_thunk.cx+0xc17>
30002bd7:	01 1b                	add    DWORD PTR [ebx],ebx
30002bd9:	0c 04                	or     al,0x4
30002bdb:	04 88                	add    al,0x88
30002bdd:	01 00                	add    DWORD PTR [eax],eax
30002bdf:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
30002be2:	00 00                	add    BYTE PTR [eax],al
30002be4:	1c 00                	sbb    al,0x0
30002be6:	00 00                	add    BYTE PTR [eax],al
30002be8:	88 f3                	mov    bl,dh
30002bea:	ff                   	(bad)  
30002beb:	ff 50 00             	call   DWORD PTR [eax+0x0]
30002bee:	00 00                	add    BYTE PTR [eax],al
30002bf0:	00 0e                	add    BYTE PTR [esi],cl
30002bf2:	08 46 0e             	or     BYTE PTR [esi+0xe],al
30002bf5:	0c 4a                	or     al,0x4a
30002bf7:	0f 0b                	ud2    
30002bf9:	74 04                	je     30002bff <__x86.get_pc_thunk.cx+0xc37>
30002bfb:	78 00                	js     30002bfd <__x86.get_pc_thunk.cx+0xc35>
30002bfd:	3f                   	aas    
30002bfe:	1a 3b                	sbb    bh,BYTE PTR [ebx]
30002c00:	2a 32                	sub    dh,BYTE PTR [edx]
30002c02:	24 22                	and    al,0x22
30002c04:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

30002c08 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
30002c08:	01 1b                	add    DWORD PTR [ebx],ebx
30002c0a:	03 3b                	add    edi,DWORD PTR [ebx]
30002c0c:	c0                   	(bad)  
30002c0d:	f3 ff                	repz (bad) 
30002c0f:	ff                   	(bad)  
30002c10:	39 00                	cmp    DWORD PTR [eax],eax
30002c12:	00 00                	add    BYTE PTR [eax],al
30002c14:	f8                   	clc    
30002c15:	d3 ff                	sar    edi,cl
30002c17:	ff dc                	call   <internal disassembler error>
30002c19:	f3 ff                	repz (bad) 
30002c1b:	ff 30                	push   DWORD PTR [eax]
30002c1d:	d4 ff                	aam    0xff
30002c1f:	ff                   	(bad)  
30002c20:	fc                   	cld    
30002c21:	f3 ff                	repz (bad) 
30002c23:	ff 68 d4             	jmp    FWORD PTR [eax-0x2c]
30002c26:	ff                   	(bad)  
30002c27:	ff 30                	push   DWORD PTR [eax]
30002c29:	f4                   	hlt    
30002c2a:	ff                   	(bad)  
30002c2b:	ff                   	(bad)  
30002c2c:	bd d4 ff ff 58       	mov    ebp,0x58ffffd4
30002c31:	f4                   	hlt    
30002c32:	ff                   	(bad)  
30002c33:	ff 14 d5 ff ff 80 f4 	call   DWORD PTR [edx*8-0xb7f0001]
30002c3a:	ff                   	(bad)  
30002c3b:	ff ac d5 ff ff bc f4 	jmp    FWORD PTR [ebp+edx*8-0xb430001]
30002c42:	ff                   	(bad)  
30002c43:	ff d2                	call   edx
30002c45:	d5 ff                	aad    0xff
30002c47:	ff e0                	jmp    eax
30002c49:	f4                   	hlt    
30002c4a:	ff                   	(bad)  
30002c4b:	ff 15 d6 ff ff 04    	call   DWORD PTR ds:0x4ffffd6
30002c51:	f5                   	cmc    
30002c52:	ff                   	(bad)  
30002c53:	ff 44 d6 ff          	inc    DWORD PTR [esi+edx*8-0x1]
30002c57:	ff 28                	jmp    FWORD PTR [eax]
30002c59:	f5                   	cmc    
30002c5a:	ff                   	(bad)  
30002c5b:	ff 18                	call   FWORD PTR [eax]
30002c5d:	d7                   	xlat   BYTE PTR ds:[ebx]
30002c5e:	ff                   	(bad)  
30002c5f:	ff 4c f5 ff          	dec    DWORD PTR [ebp+esi*8-0x1]
30002c63:	ff 4d d7             	dec    DWORD PTR [ebp-0x29]
30002c66:	ff                   	(bad)  
30002c67:	ff 70 f5             	push   DWORD PTR [eax-0xb]
30002c6a:	ff                   	(bad)  
30002c6b:	ff 81 d7 ff ff 94    	inc    DWORD PTR [ecx-0x6b000029]
30002c71:	f5                   	cmc    
30002c72:	ff                   	(bad)  
30002c73:	ff b2 d7 ff ff b8    	push   DWORD PTR [edx-0x47000029]
30002c79:	f5                   	cmc    
30002c7a:	ff                   	(bad)  
30002c7b:	ff d9                	call   <internal disassembler error>
30002c7d:	d7                   	xlat   BYTE PTR ds:[ebx]
30002c7e:	ff                   	(bad)  
30002c7f:	ff d8                	call   <internal disassembler error>
30002c81:	f5                   	cmc    
30002c82:	ff                   	(bad)  
30002c83:	ff                   	(bad)  
30002c84:	3d d8 ff ff fc       	cmp    eax,0xfcffffd8
30002c89:	f5                   	cmc    
30002c8a:	ff                   	(bad)  
30002c8b:	ff 5c d8 ff          	call   FWORD PTR [eax+ebx*8-0x1]
30002c8f:	ff 20                	jmp    DWORD PTR [eax]
30002c91:	f6 ff                	idiv   bh
30002c93:	ff 90 d8 ff ff 40    	call   DWORD PTR [eax+0x40ffffd8]
30002c99:	f6 ff                	idiv   bh
30002c9b:	ff c4                	inc    esp
30002c9d:	d8 ff                	fdivr  st,st(7)
30002c9f:	ff 60 f6             	jmp    DWORD PTR [eax-0xa]
30002ca2:	ff                   	(bad)  
30002ca3:	ff                   	(bad)  
30002ca4:	fb                   	sti    
30002ca5:	d8 ff                	fdivr  st,st(7)
30002ca7:	ff 84 f6 ff ff 49 d9 	inc    DWORD PTR [esi+esi*8-0x26b60001]
30002cae:	ff                   	(bad)  
30002caf:	ff a8 f6 ff ff 66    	jmp    FWORD PTR [eax+0x66fffff6]
30002cb5:	d9 ff                	fcos   
30002cb7:	ff c8                	dec    eax
30002cb9:	f6 ff                	idiv   bh
30002cbb:	ff 8f d9 ff ff e8    	dec    DWORD PTR [edi-0x17000027]
30002cc1:	f6 ff                	idiv   bh
30002cc3:	ff c3                	inc    ebx
30002cc5:	d9 ff                	fcos   
30002cc7:	ff 0c f7             	dec    DWORD PTR [edi+esi*8]
30002cca:	ff                   	(bad)  
30002ccb:	ff e0                	jmp    eax
30002ccd:	d9 ff                	fcos   
30002ccf:	ff 2c f7             	jmp    FWORD PTR [edi+esi*8]
30002cd2:	ff                   	(bad)  
30002cd3:	ff 22                	jmp    DWORD PTR [edx]
30002cd5:	da ff                	(bad)  
30002cd7:	ff 50 f7             	call   DWORD PTR [eax-0x9]
30002cda:	ff                   	(bad)  
30002cdb:	ff 44 da ff          	inc    DWORD PTR [edx+ebx*8-0x1]
30002cdf:	ff 70 f7             	push   DWORD PTR [eax-0x9]
30002ce2:	ff                   	(bad)  
30002ce3:	ff                   	(bad)  
30002ce4:	78 da                	js     30002cc0 <__GNU_EH_FRAME_HDR+0xb8>
30002ce6:	ff                   	(bad)  
30002ce7:	ff 90 f7 ff ff f4    	call   DWORD PTR [eax-0xb000009]
30002ced:	da ff                	(bad)  
30002cef:	ff b0 f7 ff ff bb    	push   DWORD PTR [eax-0x44000009]
30002cf5:	dc ff                	fdiv   st(7),st
30002cf7:	ff dc                	call   <internal disassembler error>
30002cf9:	f7 ff                	idiv   edi
30002cfb:	ff f4                	push   esp
30002cfd:	dc ff                	fdiv   st(7),st
30002cff:	ff                   	(bad)  
30002d00:	fc                   	cld    
30002d01:	f7 ff                	idiv   edi
30002d03:	ff 1c dd ff ff 34 f8 	call   FWORD PTR [ebx*8-0x7cb0001]
30002d0a:	ff                   	(bad)  
30002d0b:	ff                   	(bad)  
30002d0c:	b8 de ff ff 54       	mov    eax,0x54ffffde
30002d11:	f8                   	clc    
30002d12:	ff                   	(bad)  
30002d13:	ff 80 df ff ff 74    	inc    DWORD PTR [eax+0x74ffffdf]
30002d19:	f8                   	clc    
30002d1a:	ff                   	(bad)  
30002d1b:	ff ac df ff ff 98 f8 	jmp    FWORD PTR [edi+ebx*8-0x7670001]
30002d22:	ff                   	(bad)  
30002d23:	ff d2                	call   edx
30002d25:	df ff                	(bad)  
30002d27:	ff                   	(bad)  
30002d28:	bc f8 ff ff 28       	mov    esp,0x28fffff8
30002d2d:	e0 ff                	loopne 30002d2e <__GNU_EH_FRAME_HDR+0x126>
30002d2f:	ff dc                	call   <internal disassembler error>
30002d31:	f8                   	clc    
30002d32:	ff                   	(bad)  
30002d33:	ff 66 e0             	jmp    DWORD PTR [esi-0x20]
30002d36:	ff                   	(bad)  
30002d37:	ff 00                	inc    DWORD PTR [eax]
30002d39:	f9                   	stc    
30002d3a:	ff                   	(bad)  
30002d3b:	ff d8                	call   <internal disassembler error>
30002d3d:	e0 ff                	loopne 30002d3e <__GNU_EH_FRAME_HDR+0x136>
30002d3f:	ff 20                	jmp    DWORD PTR [eax]
30002d41:	f9                   	stc    
30002d42:	ff                   	(bad)  
30002d43:	ff                   	(bad)  
30002d44:	38 e1                	cmp    cl,ah
30002d46:	ff                   	(bad)  
30002d47:	ff 48 f9             	dec    DWORD PTR [eax-0x7]
30002d4a:	ff                   	(bad)  
30002d4b:	ff                   	(bad)  
30002d4c:	78 e1                	js     30002d2f <__GNU_EH_FRAME_HDR+0x127>
30002d4e:	ff                   	(bad)  
30002d4f:	ff 68 f9             	jmp    FWORD PTR [eax-0x7]
30002d52:	ff                   	(bad)  
30002d53:	ff c0                	inc    eax
30002d55:	e1 ff                	loope  30002d56 <__GNU_EH_FRAME_HDR+0x14e>
30002d57:	ff 88 f9 ff ff f4    	dec    DWORD PTR [eax-0xb000007]
30002d5d:	e1 ff                	loope  30002d5e <__GNU_EH_FRAME_HDR+0x156>
30002d5f:	ff a8 f9 ff ff 5c    	jmp    FWORD PTR [eax+0x5cfffff9]
30002d65:	e2 ff                	loop   30002d66 <__GNU_EH_FRAME_HDR+0x15e>
30002d67:	ff c8                	dec    eax
30002d69:	f9                   	stc    
30002d6a:	ff                   	(bad)  
30002d6b:	ff                   	(bad)  
30002d6c:	bc e2 ff ff e8       	mov    esp,0xe8ffffe2
30002d71:	f9                   	stc    
30002d72:	ff                   	(bad)  
30002d73:	ff                   	(bad)  
30002d74:	3c e4                	cmp    al,0xe4
30002d76:	ff                   	(bad)  
30002d77:	ff 18                	call   FWORD PTR [eax]
30002d79:	fa                   	cli    
30002d7a:	ff                   	(bad)  
30002d7b:	ff 5c e4 ff          	call   FWORD PTR [esp+eiz*8-0x1]
30002d7f:	ff                   	(bad)  
30002d80:	38 fa                	cmp    dl,bh
30002d82:	ff                   	(bad)  
30002d83:	ff                   	(bad)  
30002d84:	f8                   	clc    
30002d85:	e5 ff                	in     eax,0xff
30002d87:	ff 68 fa             	jmp    FWORD PTR [eax-0x6]
30002d8a:	ff                   	(bad)  
30002d8b:	ff ad e6 ff ff 8c    	jmp    FWORD PTR [ebp-0x7300001a]
30002d91:	fa                   	cli    
30002d92:	ff                   	(bad)  
30002d93:	ff 4c e7 ff          	dec    DWORD PTR [edi+eiz*8-0x1]
30002d97:	ff b0 fa ff ff 75    	push   DWORD PTR [eax+0x75fffffa]
30002d9d:	e7 ff                	out    0xff,eax
30002d9f:	ff d0                	call   eax
30002da1:	fa                   	cli    
30002da2:	ff                   	(bad)  
30002da3:	ff 8e ea ff ff f8    	dec    DWORD PTR [esi-0x7000016]
30002da9:	fa                   	cli    
30002daa:	ff                   	(bad)  
30002dab:	ff cd                	dec    ebp
30002dad:	ea ff ff 1c fb ff ff 	jmp    0xffff:0xfb1cffff
30002db4:	0b eb                	or     ebp,ebx
30002db6:	ff                   	(bad)  
30002db7:	ff 40 fb             	inc    DWORD PTR [eax-0x5]
30002dba:	ff                   	(bad)  
30002dbb:	ff 62 f3             	jmp    DWORD PTR [edx-0xd]
30002dbe:	ff                   	(bad)  
30002dbf:	ff 1c f4             	call   FWORD PTR [esp+esi*8]
30002dc2:	ff                   	(bad)  
30002dc3:	ff                   	(bad)  
30002dc4:	b8 f3 ff ff a8       	mov    eax,0xa8fffff3
30002dc9:	f4                   	hlt    
30002dca:	ff                   	(bad)  
30002dcb:	ff                   	(bad)  
30002dcc:	bc f3 ff ff 20       	mov    esp,0x20fffff3
30002dd1:	f8                   	clc    
30002dd2:	ff                   	(bad)  
30002dd3:	ff c0                	inc    eax
30002dd5:	f3 ff                	repz (bad) 
30002dd7:	ff 70 fb             	push   DWORD PTR [eax-0x5]
30002dda:	ff                   	(bad)  
30002ddb:	ff                   	.byte 0xff

Disassembly of section .rodata:

30002de0 <_ytab-0x240>:
30002de0:	53                   	push   ebx
30002de1:	74 72                	je     30002e55 <__GNU_EH_FRAME_HDR+0x24d>
30002de3:	65                   	gs
30002de4:	61                   	popa   
30002de5:	6d                   	ins    DWORD PTR es:[edi],dx
30002de6:	20 25 75 20 6e 6f    	and    BYTE PTR ds:0x6f6e2075,ah
30002dec:	74 20                	je     30002e0e <__GNU_EH_FRAME_HDR+0x206>
30002dee:	69 6d 70 6c 65 6d 65 	imul   ebp,DWORD PTR [ebp+0x70],0x656d656c
30002df5:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002df6:	74 65                	je     30002e5d <__GNU_EH_FRAME_HDR+0x255>
30002df8:	64 0a 00             	or     al,BYTE PTR fs:[eax]
30002dfb:	2a 2a                	sub    ch,BYTE PTR [edx]
30002dfd:	2a 49 6e             	sub    cl,BYTE PTR [ecx+0x6e]
30002e00:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x697a696c
30002e07:	69 
30002e08:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002e09:	67 20 6c 69          	and    BYTE PTR [si+0x69],ch
30002e0d:	62 63 0a             	bound  esp,QWORD PTR [ebx+0xa]
30002e10:	2a 2a                	sub    ch,BYTE PTR [edx]
30002e12:	2a 00                	sub    al,BYTE PTR [eax]
30002e14:	6d                   	ins    DWORD PTR es:[edi],dx
30002e15:	61                   	popa   
30002e16:	6c                   	ins    BYTE PTR es:[edi],dx
30002e17:	6c                   	ins    BYTE PTR es:[edi],dx
30002e18:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002e19:	63 28                	arpl   WORD PTR [eax],bp
30002e1b:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002e1e:	30 38                	xor    BYTE PTR [eax],bh
30002e20:	58                   	pop    eax
30002e21:	29 0a                	sub    DWORD PTR [edx],ecx
30002e23:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002e27:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30002e2a:	61                   	popa   
30002e2b:	6c                   	ins    BYTE PTR es:[edi],dx
30002e2c:	6c                   	ins    BYTE PTR es:[edi],dx
30002e2d:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002e2e:	63 3a                	arpl   WORD PTR [edx],di
30002e30:	20 6e 65             	and    BYTE PTR [esi+0x65],ch
30002e33:	65                   	gs
30002e34:	64                   	fs
30002e35:	65                   	gs
30002e36:	64                   	fs
30002e37:	3d 30 78 25 30       	cmp    eax,0x30257830
30002e3c:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30002e3f:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002e43:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30002e46:	61                   	popa   
30002e47:	6c                   	ins    BYTE PTR es:[edi],dx
30002e48:	6c                   	ins    BYTE PTR es:[edi],dx
30002e49:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002e4a:	63 3a                	arpl   WORD PTR [edx],di
30002e4c:	20 68 65             	and    BYTE PTR [eax+0x65],ch
30002e4f:	61                   	popa   
30002e50:	45                   	inc    ebp
30002e51:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002e52:	64                   	fs
30002e53:	3d 30 78 25 30       	cmp    eax,0x30257830
30002e58:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30002e5b:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002e5f:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30002e62:	61                   	popa   
30002e63:	6c                   	ins    BYTE PTR es:[edi],dx
30002e64:	6c                   	ins    BYTE PTR es:[edi],dx
30002e65:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002e66:	63 3a                	arpl   WORD PTR [edx],di
30002e68:	20 52 65             	and    BYTE PTR [edx+0x65],dl
30002e6b:	71 20                	jno    30002e8d <__GNU_EH_FRAME_HDR+0x285>
30002e6d:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002e70:	30 38                	xor    BYTE PTR [eax],bh
30002e72:	58                   	pop    eax
30002e73:	20 62 79             	and    BYTE PTR [edx+0x79],ah
30002e76:	74 65                	je     30002edd <__GNU_EH_FRAME_HDR+0x2d5>
30002e78:	73 2c                	jae    30002ea6 <__GNU_EH_FRAME_HDR+0x29e>
30002e7a:	20 72 65             	and    BYTE PTR [edx+0x65],dh
30002e7d:	74 20                	je     30002e9f <__GNU_EH_FRAME_HDR+0x297>
30002e7f:	77 61                	ja     30002ee2 <__GNU_EH_FRAME_HDR+0x2da>
30002e81:	73 20                	jae    30002ea3 <__GNU_EH_FRAME_HDR+0x29b>
30002e83:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002e86:	30 38                	xor    BYTE PTR [eax],bh
30002e88:	58                   	pop    eax
30002e89:	2c 20                	sub    al,0x20
30002e8b:	68 65 61 70 45       	push   0x45706165
30002e90:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002e91:	64                   	fs
30002e92:	3d 30 78 25 30       	cmp    eax,0x30257830
30002e97:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30002e9a:	00 00                	add    BYTE PTR [eax],al
30002e9c:	6c                   	ins    BYTE PTR es:[edi],dx
30002e9d:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
30002ea4:	6c                   	ins    BYTE PTR es:[edi],dx
30002ea5:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002ea6:	63 3a                	arpl   WORD PTR [edx],di
30002ea8:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
30002eab:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x657a696c
30002eb2:	65 
30002eb3:	64 20 68 65          	and    BYTE PTR fs:[eax+0x65],ch
30002eb7:	61                   	popa   
30002eb8:	70 43                	jo     30002efd <__GNU_EH_FRAME_HDR+0x2f5>
30002eba:	75 72                	jne    30002f2e <__GNU_EH_FRAME_HDR+0x326>
30002ebc:	72 20                	jb     30002ede <__GNU_EH_FRAME_HDR+0x2d6>
30002ebe:	61                   	popa   
30002ebf:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002ec0:	64 20 68 65          	and    BYTE PTR fs:[eax+0x65],ch
30002ec4:	61                   	popa   
30002ec5:	70 42                	jo     30002f09 <__GNU_EH_FRAME_HDR+0x301>
30002ec7:	61                   	popa   
30002ec8:	73 65                	jae    30002f2f <__GNU_EH_FRAME_HDR+0x327>
30002eca:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
30002ece:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002ed1:	30 38                	xor    BYTE PTR [eax],bh
30002ed3:	58                   	pop    eax
30002ed4:	0a 00                	or     al,BYTE PTR [eax]
30002ed6:	00 00                	add    BYTE PTR [eax],al
30002ed8:	6c                   	ins    BYTE PTR es:[edi],dx
30002ed9:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
30002ee0:	6c                   	ins    BYTE PTR es:[edi],dx
30002ee1:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002ee2:	63 3a                	arpl   WORD PTR [edx],di
30002ee4:	63 72 65             	arpl   WORD PTR [edx+0x65],si
30002ee7:	61                   	popa   
30002ee8:	74 69                	je     30002f53 <__GNU_EH_FRAME_HDR+0x34b>
30002eea:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002eeb:	67 20 68 65          	and    BYTE PTR [bx+si+0x65],ch
30002eef:	61                   	popa   
30002ef0:	70 20                	jo     30002f12 <__GNU_EH_FRAME_HDR+0x30a>
30002ef2:	72 65                	jb     30002f59 <__GNU_EH_FRAME_HDR+0x351>
30002ef4:	63 20                	arpl   WORD PTR [eax],sp
30002ef6:	40                   	inc    eax
30002ef7:	20 30                	and    BYTE PTR [eax],dh
30002ef9:	78 25                	js     30002f20 <__GNU_EH_FRAME_HDR+0x318>
30002efb:	30 38                	xor    BYTE PTR [eax],bh
30002efd:	58                   	pop    eax
30002efe:	0a 00                	or     al,BYTE PTR [eax]
30002f00:	6c                   	ins    BYTE PTR es:[edi],dx
30002f01:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
30002f08:	6c                   	ins    BYTE PTR es:[edi],dx
30002f09:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002f0a:	63 3a                	arpl   WORD PTR [edx],di
30002f0c:	20 68 65             	and    BYTE PTR [eax+0x65],ch
30002f0f:	61                   	popa   
30002f10:	70 43                	jo     30002f55 <__GNU_EH_FRAME_HDR+0x34d>
30002f12:	75 72                	jne    30002f86 <__GNU_EH_FRAME_HDR+0x37e>
30002f14:	72 3d                	jb     30002f53 <__GNU_EH_FRAME_HDR+0x34b>
30002f16:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30002f19:	30 38                	xor    BYTE PTR [eax],bh
30002f1b:	58                   	pop    eax
30002f1c:	2c 20                	sub    al,0x20
30002f1e:	73 69                	jae    30002f89 <__GNU_EH_FRAME_HDR+0x381>
30002f20:	7a 65                	jp     30002f87 <__GNU_EH_FRAME_HDR+0x37f>
30002f22:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002f23:	66                   	data16
30002f24:	28 68 65             	sub    BYTE PTR [eax+0x65],ch
30002f27:	61                   	popa   
30002f28:	70 72                	jo     30002f9c <__GNU_EH_FRAME_HDR+0x394>
30002f2a:	65 63 5f 74          	arpl   WORD PTR gs:[edi+0x74],bx
30002f2e:	29 3d 30 78 25 30    	sub    DWORD PTR ds:0x30257830,edi
30002f34:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
	...
30002f3f:	00 47 4d             	add    BYTE PTR [edi+0x4d],al
30002f42:	54                   	push   esp
30002f43:	00 53 75             	add    BYTE PTR [ebx+0x75],dl
30002f46:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f47:	64                   	fs
30002f48:	61                   	popa   
30002f49:	79 00                	jns    30002f4b <__GNU_EH_FRAME_HDR+0x343>
30002f4b:	4d                   	dec    ebp
30002f4c:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002f4d:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f4e:	64                   	fs
30002f4f:	61                   	popa   
30002f50:	79 00                	jns    30002f52 <__GNU_EH_FRAME_HDR+0x34a>
30002f52:	54                   	push   esp
30002f53:	75 65                	jne    30002fba <__GNU_EH_FRAME_HDR+0x3b2>
30002f55:	73 64                	jae    30002fbb <__GNU_EH_FRAME_HDR+0x3b3>
30002f57:	61                   	popa   
30002f58:	79 00                	jns    30002f5a <__GNU_EH_FRAME_HDR+0x352>
30002f5a:	57                   	push   edi
30002f5b:	65 64 6e             	gs outs dx,BYTE PTR fs:gs:[esi]
30002f5e:	65                   	gs
30002f5f:	73 64                	jae    30002fc5 <__GNU_EH_FRAME_HDR+0x3bd>
30002f61:	61                   	popa   
30002f62:	79 00                	jns    30002f64 <__GNU_EH_FRAME_HDR+0x35c>
30002f64:	54                   	push   esp
30002f65:	68 75 72 73 64       	push   0x64737275
30002f6a:	61                   	popa   
30002f6b:	79 00                	jns    30002f6d <__GNU_EH_FRAME_HDR+0x365>
30002f6d:	46                   	inc    esi
30002f6e:	72 69                	jb     30002fd9 <__GNU_EH_FRAME_HDR+0x3d1>
30002f70:	64                   	fs
30002f71:	61                   	popa   
30002f72:	79 00                	jns    30002f74 <__GNU_EH_FRAME_HDR+0x36c>
30002f74:	53                   	push   ebx
30002f75:	61                   	popa   
30002f76:	74 75                	je     30002fed <__GNU_EH_FRAME_HDR+0x3e5>
30002f78:	72 64                	jb     30002fde <__GNU_EH_FRAME_HDR+0x3d6>
30002f7a:	61                   	popa   
30002f7b:	79 00                	jns    30002f7d <__GNU_EH_FRAME_HDR+0x375>
30002f7d:	53                   	push   ebx
30002f7e:	75 6e                	jne    30002fee <__GNU_EH_FRAME_HDR+0x3e6>
30002f80:	00 4d 6f             	add    BYTE PTR [ebp+0x6f],cl
30002f83:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f84:	00 54 75 65          	add    BYTE PTR [ebp+esi*2+0x65],dl
30002f88:	00 57 65             	add    BYTE PTR [edi+0x65],dl
30002f8b:	64 00 54 68 75       	add    BYTE PTR fs:[eax+ebp*2+0x75],dl
30002f90:	00 46 72             	add    BYTE PTR [esi+0x72],al
30002f93:	69 00 53 61 74 00    	imul   eax,DWORD PTR [eax],0x746153
30002f99:	4a                   	dec    edx
30002f9a:	61                   	popa   
30002f9b:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f9c:	75 61                	jne    30002fff <__GNU_EH_FRAME_HDR+0x3f7>
30002f9e:	72 79                	jb     30003019 <__GNU_EH_FRAME_HDR+0x411>
30002fa0:	00 46 65             	add    BYTE PTR [esi+0x65],al
30002fa3:	62 72 75             	bound  esi,QWORD PTR [edx+0x75]
30002fa6:	61                   	popa   
30002fa7:	72 79                	jb     30003022 <_ytab+0x2>
30002fa9:	00 4d 61             	add    BYTE PTR [ebp+0x61],cl
30002fac:	72 63                	jb     30003011 <__GNU_EH_FRAME_HDR+0x409>
30002fae:	68 00 41 70 72       	push   0x72704100
30002fb3:	69 6c 00 4d 61 79 00 	imul   ebp,DWORD PTR [eax+eax*1+0x4d],0x4a007961
30002fba:	4a 
30002fbb:	75 6e                	jne    3000302b <_ytab+0xb>
30002fbd:	65 00 4a 75          	add    BYTE PTR gs:[edx+0x75],cl
30002fc1:	6c                   	ins    BYTE PTR es:[edi],dx
30002fc2:	79 00                	jns    30002fc4 <__GNU_EH_FRAME_HDR+0x3bc>
30002fc4:	41                   	inc    ecx
30002fc5:	75 67                	jne    3000302e <_ytab+0xe>
30002fc7:	75 73                	jne    3000303c <_ytab+0x1c>
30002fc9:	74 00                	je     30002fcb <__GNU_EH_FRAME_HDR+0x3c3>
30002fcb:	53                   	push   ebx
30002fcc:	65                   	gs
30002fcd:	70 74                	jo     30003043 <_ytab+0x23>
30002fcf:	65                   	gs
30002fd0:	6d                   	ins    DWORD PTR es:[edi],dx
30002fd1:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
30002fd4:	00 4f 63             	add    BYTE PTR [edi+0x63],cl
30002fd7:	74 6f                	je     30003048 <_ytab+0x28>
30002fd9:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
30002fdc:	00 4e 6f             	add    BYTE PTR [esi+0x6f],cl
30002fdf:	76 65                	jbe    30003046 <_ytab+0x26>
30002fe1:	6d                   	ins    DWORD PTR es:[edi],dx
30002fe2:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
30002fe5:	00 44 65 63          	add    BYTE PTR [ebp+eiz*2+0x63],al
30002fe9:	65                   	gs
30002fea:	6d                   	ins    DWORD PTR es:[edi],dx
30002feb:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
30002fee:	00 4a 61             	add    BYTE PTR [edx+0x61],cl
30002ff1:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002ff2:	00 46 65             	add    BYTE PTR [esi+0x65],al
30002ff5:	62 00                	bound  eax,QWORD PTR [eax]
30002ff7:	4d                   	dec    ebp
30002ff8:	61                   	popa   
30002ff9:	72 00                	jb     30002ffb <__GNU_EH_FRAME_HDR+0x3f3>
30002ffb:	41                   	inc    ecx
30002ffc:	70 72                	jo     30003070 <_ytab+0x50>
30002ffe:	00 4a 75             	add    BYTE PTR [edx+0x75],cl
30003001:	6e                   	outs   dx,BYTE PTR ds:[esi]
30003002:	00 4a 75             	add    BYTE PTR [edx+0x75],cl
30003005:	6c                   	ins    BYTE PTR es:[edi],dx
30003006:	00 41 75             	add    BYTE PTR [ecx+0x75],al
30003009:	67 00 53 65          	add    BYTE PTR [bp+di+0x65],dl
3000300d:	70 00                	jo     3000300f <__GNU_EH_FRAME_HDR+0x407>
3000300f:	4f                   	dec    edi
30003010:	63 74 00 4e          	arpl   WORD PTR [eax+eax*1+0x4e],si
30003014:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003015:	76 00                	jbe    30003017 <__GNU_EH_FRAME_HDR+0x40f>
30003017:	44                   	inc    esp
30003018:	65 63 00             	arpl   WORD PTR gs:[eax],ax
3000301b:	00 00                	add    BYTE PTR [eax],al
3000301d:	00 00                	add    BYTE PTR [eax],al
	...

30003020 <_ytab>:
30003020:	1f                   	pop    ds
30003021:	00 00                	add    BYTE PTR [eax],al
30003023:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30003026:	00 00                	add    BYTE PTR [eax],al
30003028:	1f                   	pop    ds
30003029:	00 00                	add    BYTE PTR [eax],al
3000302b:	00 1e                	add    BYTE PTR [esi],bl
3000302d:	00 00                	add    BYTE PTR [eax],al
3000302f:	00 1f                	add    BYTE PTR [edi],bl
30003031:	00 00                	add    BYTE PTR [eax],al
30003033:	00 1e                	add    BYTE PTR [esi],bl
30003035:	00 00                	add    BYTE PTR [eax],al
30003037:	00 1f                	add    BYTE PTR [edi],bl
30003039:	00 00                	add    BYTE PTR [eax],al
3000303b:	00 1f                	add    BYTE PTR [edi],bl
3000303d:	00 00                	add    BYTE PTR [eax],al
3000303f:	00 1e                	add    BYTE PTR [esi],bl
30003041:	00 00                	add    BYTE PTR [eax],al
30003043:	00 1f                	add    BYTE PTR [edi],bl
30003045:	00 00                	add    BYTE PTR [eax],al
30003047:	00 1e                	add    BYTE PTR [esi],bl
30003049:	00 00                	add    BYTE PTR [eax],al
3000304b:	00 1f                	add    BYTE PTR [edi],bl
3000304d:	00 00                	add    BYTE PTR [eax],al
3000304f:	00 1f                	add    BYTE PTR [edi],bl
30003051:	00 00                	add    BYTE PTR [eax],al
30003053:	00 1d 00 00 00 1f    	add    BYTE PTR ds:0x1f000000,bl
30003059:	00 00                	add    BYTE PTR [eax],al
3000305b:	00 1e                	add    BYTE PTR [esi],bl
3000305d:	00 00                	add    BYTE PTR [eax],al
3000305f:	00 1f                	add    BYTE PTR [edi],bl
30003061:	00 00                	add    BYTE PTR [eax],al
30003063:	00 1e                	add    BYTE PTR [esi],bl
30003065:	00 00                	add    BYTE PTR [eax],al
30003067:	00 1f                	add    BYTE PTR [edi],bl
30003069:	00 00                	add    BYTE PTR [eax],al
3000306b:	00 1f                	add    BYTE PTR [edi],bl
3000306d:	00 00                	add    BYTE PTR [eax],al
3000306f:	00 1e                	add    BYTE PTR [esi],bl
30003071:	00 00                	add    BYTE PTR [eax],al
30003073:	00 1f                	add    BYTE PTR [edi],bl
30003075:	00 00                	add    BYTE PTR [eax],al
30003077:	00 1e                	add    BYTE PTR [esi],bl
30003079:	00 00                	add    BYTE PTR [eax],al
3000307b:	00 1f                	add    BYTE PTR [edi],bl
3000307d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .rel.dyn:

30003080 <.rel.dyn>:
30003080:	80 33 00             	xor    BYTE PTR [ebx],0x0
30003083:	30 08                	xor    BYTE PTR [eax],cl
30003085:	00 00                	add    BYTE PTR [eax],al
30003087:	00 84 33 00 30 08 00 	add    BYTE PTR [ebx+esi*1+0x83000],al
3000308e:	00 00                	add    BYTE PTR [eax],al
30003090:	88 33                	mov    BYTE PTR [ebx],dh
30003092:	00 30                	add    BYTE PTR [eax],dh
30003094:	08 00                	or     BYTE PTR [eax],al
30003096:	00 00                	add    BYTE PTR [eax],al
30003098:	8c 33                	mov    WORD PTR [ebx],?
3000309a:	00 30                	add    BYTE PTR [eax],dh
3000309c:	08 00                	or     BYTE PTR [eax],al
3000309e:	00 00                	add    BYTE PTR [eax],al
300030a0:	90                   	nop
300030a1:	33 00                	xor    eax,DWORD PTR [eax]
300030a3:	30 08                	xor    BYTE PTR [eax],cl
300030a5:	00 00                	add    BYTE PTR [eax],al
300030a7:	00 94 33 00 30 08 00 	add    BYTE PTR [ebx+esi*1+0x83000],dl
300030ae:	00 00                	add    BYTE PTR [eax],al
300030b0:	c0                   	(bad)  
300030b1:	33 00                	xor    eax,DWORD PTR [eax]
300030b3:	30 08                	xor    BYTE PTR [eax],cl
300030b5:	00 00                	add    BYTE PTR [eax],al
300030b7:	00 c4                	add    ah,al
300030b9:	33 00                	xor    eax,DWORD PTR [eax]
300030bb:	30 08                	xor    BYTE PTR [eax],cl
300030bd:	00 00                	add    BYTE PTR [eax],al
300030bf:	00 c8                	add    al,cl
300030c1:	33 00                	xor    eax,DWORD PTR [eax]
300030c3:	30 08                	xor    BYTE PTR [eax],cl
300030c5:	00 00                	add    BYTE PTR [eax],al
300030c7:	00 cc                	add    ah,cl
300030c9:	33 00                	xor    eax,DWORD PTR [eax]
300030cb:	30 08                	xor    BYTE PTR [eax],cl
300030cd:	00 00                	add    BYTE PTR [eax],al
300030cf:	00 d0                	add    al,dl
300030d1:	33 00                	xor    eax,DWORD PTR [eax]
300030d3:	30 08                	xor    BYTE PTR [eax],cl
300030d5:	00 00                	add    BYTE PTR [eax],al
300030d7:	00 d4                	add    ah,dl
300030d9:	33 00                	xor    eax,DWORD PTR [eax]
300030db:	30 08                	xor    BYTE PTR [eax],cl
300030dd:	00 00                	add    BYTE PTR [eax],al
300030df:	00 d8                	add    al,bl
300030e1:	33 00                	xor    eax,DWORD PTR [eax]
300030e3:	30 08                	xor    BYTE PTR [eax],cl
300030e5:	00 00                	add    BYTE PTR [eax],al
300030e7:	00 dc                	add    ah,bl
300030e9:	33 00                	xor    eax,DWORD PTR [eax]
300030eb:	30 08                	xor    BYTE PTR [eax],cl
300030ed:	00 00                	add    BYTE PTR [eax],al
300030ef:	00 e0                	add    al,ah
300030f1:	33 00                	xor    eax,DWORD PTR [eax]
300030f3:	30 08                	xor    BYTE PTR [eax],cl
300030f5:	00 00                	add    BYTE PTR [eax],al
300030f7:	00 e4                	add    ah,ah
300030f9:	33 00                	xor    eax,DWORD PTR [eax]
300030fb:	30 08                	xor    BYTE PTR [eax],cl
300030fd:	00 00                	add    BYTE PTR [eax],al
300030ff:	00 e8                	add    al,ch
30003101:	33 00                	xor    eax,DWORD PTR [eax]
30003103:	30 08                	xor    BYTE PTR [eax],cl
30003105:	00 00                	add    BYTE PTR [eax],al
30003107:	00 ec                	add    ah,ch
30003109:	33 00                	xor    eax,DWORD PTR [eax]
3000310b:	30 08                	xor    BYTE PTR [eax],cl
3000310d:	00 00                	add    BYTE PTR [eax],al
3000310f:	00 f0                	add    al,dh
30003111:	33 00                	xor    eax,DWORD PTR [eax]
30003113:	30 08                	xor    BYTE PTR [eax],cl
30003115:	00 00                	add    BYTE PTR [eax],al
30003117:	00 f4                	add    ah,dh
30003119:	33 00                	xor    eax,DWORD PTR [eax]
3000311b:	30 08                	xor    BYTE PTR [eax],cl
3000311d:	00 00                	add    BYTE PTR [eax],al
3000311f:	00 f8                	add    al,bh
30003121:	33 00                	xor    eax,DWORD PTR [eax]
30003123:	30 08                	xor    BYTE PTR [eax],cl
30003125:	00 00                	add    BYTE PTR [eax],al
30003127:	00 fc                	add    ah,bh
30003129:	33 00                	xor    eax,DWORD PTR [eax]
3000312b:	30 08                	xor    BYTE PTR [eax],cl
3000312d:	00 00                	add    BYTE PTR [eax],al
3000312f:	00 00                	add    BYTE PTR [eax],al
30003131:	34 00                	xor    al,0x0
30003133:	30 08                	xor    BYTE PTR [eax],cl
30003135:	00 00                	add    BYTE PTR [eax],al
30003137:	00 04 34             	add    BYTE PTR [esp+esi*1],al
3000313a:	00 30                	add    BYTE PTR [eax],dh
3000313c:	08 00                	or     BYTE PTR [eax],al
3000313e:	00 00                	add    BYTE PTR [eax],al
30003140:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
30003143:	30 08                	xor    BYTE PTR [eax],cl
30003145:	00 00                	add    BYTE PTR [eax],al
30003147:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
3000314a:	00 30                	add    BYTE PTR [eax],dh
3000314c:	08 00                	or     BYTE PTR [eax],al
3000314e:	00 00                	add    BYTE PTR [eax],al
30003150:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
30003153:	30 08                	xor    BYTE PTR [eax],cl
30003155:	00 00                	add    BYTE PTR [eax],al
30003157:	00 14 34             	add    BYTE PTR [esp+esi*1],dl
3000315a:	00 30                	add    BYTE PTR [eax],dh
3000315c:	08 00                	or     BYTE PTR [eax],al
3000315e:	00 00                	add    BYTE PTR [eax],al
30003160:	18 34 00             	sbb    BYTE PTR [eax+eax*1],dh
30003163:	30 08                	xor    BYTE PTR [eax],cl
30003165:	00 00                	add    BYTE PTR [eax],al
30003167:	00 1c 34             	add    BYTE PTR [esp+esi*1],bl
3000316a:	00 30                	add    BYTE PTR [eax],dh
3000316c:	08 00                	or     BYTE PTR [eax],al
3000316e:	00 00                	add    BYTE PTR [eax],al
30003170:	20 34 00             	and    BYTE PTR [eax+eax*1],dh
30003173:	30 08                	xor    BYTE PTR [eax],cl
30003175:	00 00                	add    BYTE PTR [eax],al
30003177:	00 24 34             	add    BYTE PTR [esp+esi*1],ah
3000317a:	00 30                	add    BYTE PTR [eax],dh
3000317c:	08 00                	or     BYTE PTR [eax],al
3000317e:	00 00                	add    BYTE PTR [eax],al
30003180:	28 34 00             	sub    BYTE PTR [eax+eax*1],dh
30003183:	30 08                	xor    BYTE PTR [eax],cl
30003185:	00 00                	add    BYTE PTR [eax],al
30003187:	00 2c 34             	add    BYTE PTR [esp+esi*1],ch
3000318a:	00 30                	add    BYTE PTR [eax],dh
3000318c:	08 00                	or     BYTE PTR [eax],al
3000318e:	00 00                	add    BYTE PTR [eax],al
30003190:	40                   	inc    eax
30003191:	34 00                	xor    al,0x0
30003193:	30 08                	xor    BYTE PTR [eax],cl
30003195:	00 00                	add    BYTE PTR [eax],al
30003197:	00 44 34 00          	add    BYTE PTR [esp+esi*1+0x0],al
3000319b:	30 08                	xor    BYTE PTR [eax],cl
3000319d:	00 00                	add    BYTE PTR [eax],al
3000319f:	00 48 34             	add    BYTE PTR [eax+0x34],cl
300031a2:	00 30                	add    BYTE PTR [eax],dh
300031a4:	08 00                	or     BYTE PTR [eax],al
300031a6:	00 00                	add    BYTE PTR [eax],al
300031a8:	4c                   	dec    esp
300031a9:	34 00                	xor    al,0x0
300031ab:	30 08                	xor    BYTE PTR [eax],cl
300031ad:	00 00                	add    BYTE PTR [eax],al
300031af:	00 50 34             	add    BYTE PTR [eax+0x34],dl
300031b2:	00 30                	add    BYTE PTR [eax],dh
300031b4:	08 00                	or     BYTE PTR [eax],al
300031b6:	00 00                	add    BYTE PTR [eax],al
300031b8:	54                   	push   esp
300031b9:	34 00                	xor    al,0x0
300031bb:	30 08                	xor    BYTE PTR [eax],cl
300031bd:	00 00                	add    BYTE PTR [eax],al
300031bf:	00 58 34             	add    BYTE PTR [eax+0x34],bl
300031c2:	00 30                	add    BYTE PTR [eax],dh
300031c4:	08 00                	or     BYTE PTR [eax],al
300031c6:	00 00                	add    BYTE PTR [eax],al
300031c8:	5c                   	pop    esp
300031c9:	34 00                	xor    al,0x0
300031cb:	30 08                	xor    BYTE PTR [eax],cl
300031cd:	00 00                	add    BYTE PTR [eax],al
300031cf:	00 60 34             	add    BYTE PTR [eax+0x34],ah
300031d2:	00 30                	add    BYTE PTR [eax],dh
300031d4:	08 00                	or     BYTE PTR [eax],al
300031d6:	00 00                	add    BYTE PTR [eax],al
300031d8:	64                   	fs
300031d9:	34 00                	xor    al,0x0
300031db:	30 08                	xor    BYTE PTR [eax],cl
300031dd:	00 00                	add    BYTE PTR [eax],al
300031df:	00 68 34             	add    BYTE PTR [eax+0x34],ch
300031e2:	00 30                	add    BYTE PTR [eax],dh
300031e4:	08 00                	or     BYTE PTR [eax],al
300031e6:	00 00                	add    BYTE PTR [eax],al
300031e8:	6c                   	ins    BYTE PTR es:[edi],dx
300031e9:	34 00                	xor    al,0x0
300031eb:	30 08                	xor    BYTE PTR [eax],cl
300031ed:	00 00                	add    BYTE PTR [eax],al
300031ef:	00 d2                	add    dl,dl
300031f1:	01 00                	add    DWORD PTR [eax],eax
300031f3:	30 02                	xor    BYTE PTR [edx],al
300031f5:	14 00                	adc    al,0x0
300031f7:	00 12                	add    BYTE PTR [edx],dl
300031f9:	02 00                	add    al,BYTE PTR [eax]
300031fb:	30 02                	xor    BYTE PTR [edx],al
300031fd:	14 00                	adc    al,0x0
300031ff:	00 3b                	add    BYTE PTR [ebx],bh
30003201:	02 00                	add    al,BYTE PTR [eax]
30003203:	30 02                	xor    BYTE PTR [edx],al
30003205:	14 00                	adc    al,0x0
30003207:	00 98 02 00 30 02    	add    BYTE PTR [eax+0x2300002],bl
3000320d:	14 00                	adc    al,0x0
3000320f:	00 d9                	add    cl,bl
30003211:	02 00                	add    al,BYTE PTR [eax]
30003213:	30 02                	xor    BYTE PTR [edx],al
30003215:	14 00                	adc    al,0x0
30003217:	00 0f                	add    BYTE PTR [edi],cl
30003219:	03 00                	add    eax,DWORD PTR [eax]
3000321b:	30 02                	xor    BYTE PTR [edx],al
3000321d:	14 00                	adc    al,0x0
3000321f:	00 45 03             	add    BYTE PTR [ebp+0x3],al
30003222:	00 30                	add    BYTE PTR [eax],dh
30003224:	02 14 00             	add    dl,BYTE PTR [eax+eax*1]
30003227:	00 79 03             	add    BYTE PTR [ecx+0x3],bh
3000322a:	00 30                	add    BYTE PTR [eax],dh
3000322c:	02 14 00             	add    dl,BYTE PTR [eax+eax*1]
3000322f:	00 aa 03 00 30 02    	add    BYTE PTR [edx+0x2300003],ch
30003235:	14 00                	adc    al,0x0
30003237:	00 d5                	add    ch,dl
30003239:	03 00                	add    eax,DWORD PTR [eax]
3000323b:	30 02                	xor    BYTE PTR [edx],al
3000323d:	14 00                	adc    al,0x0
3000323f:	00 f4                	add    ah,dh
30003241:	04 00                	add    al,0x0
30003243:	30 02                	xor    BYTE PTR [edx],al
30003245:	14 00                	adc    al,0x0
30003247:	00 1a                	add    BYTE PTR [edx],bl
30003249:	05 00 30 02 14       	add    eax,0x14023000
3000324e:	00 00                	add    BYTE PTR [eax],al
30003250:	42                   	inc    edx
30003251:	05 00 30 02 14       	add    eax,0x14023000
30003256:	00 00                	add    BYTE PTR [eax],al
30003258:	6d                   	ins    DWORD PTR es:[edi],dx
30003259:	07                   	pop    es
3000325a:	00 30                	add    BYTE PTR [eax],dh
3000325c:	02 14 00             	add    dl,BYTE PTR [eax+eax*1]
3000325f:	00 1a                	add    BYTE PTR [edx],bl
30003261:	09 00                	or     DWORD PTR [eax],eax
30003263:	30 02                	xor    BYTE PTR [edx],al
30003265:	14 00                	adc    al,0x0
30003267:	00 71 13             	add    BYTE PTR [ecx+0x13],dh
3000326a:	00 30                	add    BYTE PTR [eax],dh
3000326c:	02 14 00             	add    dl,BYTE PTR [eax+eax*1]
3000326f:	00 a4 33 00 30 07 01 	add    BYTE PTR [ebx+esi*1+0x1073000],ah
30003276:	00 00                	add    BYTE PTR [eax],al
30003278:	a8 33                	test   al,0x33
3000327a:	00 30                	add    BYTE PTR [eax],dh
3000327c:	07                   	pop    es
3000327d:	04 00                	add    al,0x0
3000327f:	00 ac 33 00 30 07 0b 	add    BYTE PTR [ebx+esi*1+0xb073000],ch
30003286:	00 00                	add    BYTE PTR [eax],al
30003288:	b0 33                	mov    al,0x33
3000328a:	00 30                	add    BYTE PTR [eax],dh
3000328c:	07                   	pop    es
3000328d:	21 00                	and    DWORD PTR [eax],eax
	...

Disassembly of section .data:

300032a0 <a>:
300032a0:	7b 00                	jnp    300032a2 <a+0x2>
	...

300032a4 <b>:
300032a4:	c8 01 00 00          	enter  0x1,0x0

300032a8 <c>:
300032a8:	15 03 00 00 00       	adc    eax,0x3
	...

300032c0 <console_node>:
300032c0:	01 00                	add    DWORD PTR [eax],eax
	...

300032e4 <_daylight>:
300032e4:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

300032e8 <_DYNAMIC>:
300032e8:	04 00                	add    al,0x0
300032ea:	00 00                	add    BYTE PTR [eax],al
300032ec:	e8 2a 00 30 05       	call   3530331b <ticksToWait+0x52ffe7b>
300032f1:	00 00                	add    BYTE PTR [eax],al
300032f3:	00 dc                	add    ah,bl
300032f5:	29 00                	sub    DWORD PTR [eax],eax
300032f7:	30 06                	xor    BYTE PTR [esi],al
300032f9:	00 00                	add    BYTE PTR [eax],al
300032fb:	00 8c 27 00 30 0a 00 	add    BYTE PTR [edi+eiz*1+0xa3000],cl
30003302:	00 00                	add    BYTE PTR [eax],al
30003304:	09 01                	or     DWORD PTR [ecx],eax
30003306:	00 00                	add    BYTE PTR [eax],al
30003308:	0b 00                	or     eax,DWORD PTR [eax]
3000330a:	00 00                	add    BYTE PTR [eax],al
3000330c:	10 00                	adc    BYTE PTR [eax],al
3000330e:	00 00                	add    BYTE PTR [eax],al
30003310:	03 00                	add    eax,DWORD PTR [eax]
30003312:	00 00                	add    BYTE PTR [eax],al
30003314:	98                   	cwde   
30003315:	33 00                	xor    eax,DWORD PTR [eax]
30003317:	30 02                	xor    BYTE PTR [edx],al
30003319:	00 00                	add    BYTE PTR [eax],al
3000331b:	00 20                	add    BYTE PTR [eax],ah
3000331d:	00 00                	add    BYTE PTR [eax],al
3000331f:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
30003322:	00 00                	add    BYTE PTR [eax],al
30003324:	11 00                	adc    DWORD PTR [eax],eax
30003326:	00 00                	add    BYTE PTR [eax],al
30003328:	17                   	pop    ss
30003329:	00 00                	add    BYTE PTR [eax],al
3000332b:	00 70 32             	add    BYTE PTR [eax+0x32],dh
3000332e:	00 30                	add    BYTE PTR [eax],dh
30003330:	11 00                	adc    DWORD PTR [eax],eax
30003332:	00 00                	add    BYTE PTR [eax],al
30003334:	80 30 00             	xor    BYTE PTR [eax],0x0
30003337:	30 12                	xor    BYTE PTR [edx],dl
30003339:	00 00                	add    BYTE PTR [eax],al
3000333b:	00 f0                	add    al,dh
3000333d:	01 00                	add    DWORD PTR [eax],eax
3000333f:	00 13                	add    BYTE PTR [ebx],dl
30003341:	00 00                	add    BYTE PTR [eax],al
30003343:	00 08                	add    BYTE PTR [eax],cl
30003345:	00 00                	add    BYTE PTR [eax],al
30003347:	00 16                	add    BYTE PTR [esi],dl
30003349:	00 00                	add    BYTE PTR [eax],al
3000334b:	00 00                	add    BYTE PTR [eax],al
3000334d:	00 00                	add    BYTE PTR [eax],al
3000334f:	00 fa                	add    dl,bh
30003351:	ff                   	(bad)  
30003352:	ff 6f 2e             	jmp    FWORD PTR [edi+0x2e]
	...

Disassembly of section .got:

30003380 <.got>:
30003380:	84 34 00             	test   BYTE PTR [eax+eax*1],dh
30003383:	30 8c 34 00 30 70 34 	xor    BYTE PTR [esp+esi*1+0x34703000],cl
3000338a:	00 30                	add    BYTE PTR [eax],dh
3000338c:	74 34                	je     300033c2 <_tzname+0x2>
3000338e:	00 30                	add    BYTE PTR [eax],dh
30003390:	78 34                	js     300033c6 <_tzname+0x6>
30003392:	00 30                	add    BYTE PTR [eax],dh
30003394:	7c 34                	jl     300033ca <_days+0x2>
30003396:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .got.plt:

30003398 <_GLOBAL_OFFSET_TABLE_>:
30003398:	e8 32 00 30 00       	call   303033cf <ticksToWait+0x2fff2f>
3000339d:	00 00                	add    BYTE PTR [eax],al
3000339f:	00 00                	add    BYTE PTR [eax],al
300033a1:	00 00                	add    BYTE PTR [eax],al
300033a3:	00 86 1f 00 30 96    	add    BYTE PTR [esi-0x69cfffe1],al
300033a9:	1f                   	pop    ds
300033aa:	00 30                	add    BYTE PTR [eax],dh
300033ac:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
300033ad:	1f                   	pop    ds
300033ae:	00 30                	add    BYTE PTR [eax],dh
300033b0:	b6 1f                	mov    dh,0x1f
300033b2:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .data.rel.local:

300033c0 <_tzname>:
300033c0:	40                   	inc    eax
300033c1:	2f                   	das    
300033c2:	00 30                	add    BYTE PTR [eax],dh
300033c4:	40                   	inc    eax
300033c5:	2f                   	das    
300033c6:	00 30                	add    BYTE PTR [eax],dh

300033c8 <_days>:
300033c8:	44                   	inc    esp
300033c9:	2f                   	das    
300033ca:	00 30                	add    BYTE PTR [eax],dh
300033cc:	4b                   	dec    ebx
300033cd:	2f                   	das    
300033ce:	00 30                	add    BYTE PTR [eax],dh
300033d0:	52                   	push   edx
300033d1:	2f                   	das    
300033d2:	00 30                	add    BYTE PTR [eax],dh
300033d4:	5a                   	pop    edx
300033d5:	2f                   	das    
300033d6:	00 30                	add    BYTE PTR [eax],dh
300033d8:	64                   	fs
300033d9:	2f                   	das    
300033da:	00 30                	add    BYTE PTR [eax],dh
300033dc:	6d                   	ins    DWORD PTR es:[edi],dx
300033dd:	2f                   	das    
300033de:	00 30                	add    BYTE PTR [eax],dh
300033e0:	74 2f                	je     30003411 <_months+0x11>
300033e2:	00 30                	add    BYTE PTR [eax],dh

300033e4 <_days_abbrev>:
300033e4:	7d 2f                	jge    30003415 <_months+0x15>
300033e6:	00 30                	add    BYTE PTR [eax],dh
300033e8:	81 2f 00 30 85 2f    	sub    DWORD PTR [edi],0x2f853000
300033ee:	00 30                	add    BYTE PTR [eax],dh
300033f0:	89 2f                	mov    DWORD PTR [edi],ebp
300033f2:	00 30                	add    BYTE PTR [eax],dh
300033f4:	8d 2f                	lea    ebp,[edi]
300033f6:	00 30                	add    BYTE PTR [eax],dh
300033f8:	91                   	xchg   ecx,eax
300033f9:	2f                   	das    
300033fa:	00 30                	add    BYTE PTR [eax],dh
300033fc:	95                   	xchg   ebp,eax
300033fd:	2f                   	das    
300033fe:	00 30                	add    BYTE PTR [eax],dh

30003400 <_months>:
30003400:	99                   	cdq    
30003401:	2f                   	das    
30003402:	00 30                	add    BYTE PTR [eax],dh
30003404:	a1 2f 00 30 aa       	mov    eax,ds:0xaa30002f
30003409:	2f                   	das    
3000340a:	00 30                	add    BYTE PTR [eax],dh
3000340c:	b0 2f                	mov    al,0x2f
3000340e:	00 30                	add    BYTE PTR [eax],dh
30003410:	b6 2f                	mov    dh,0x2f
30003412:	00 30                	add    BYTE PTR [eax],dh
30003414:	ba 2f 00 30 bf       	mov    edx,0xbf30002f
30003419:	2f                   	das    
3000341a:	00 30                	add    BYTE PTR [eax],dh
3000341c:	c4 2f                	les    ebp,FWORD PTR [edi]
3000341e:	00 30                	add    BYTE PTR [eax],dh
30003420:	cb                   	retf   
30003421:	2f                   	das    
30003422:	00 30                	add    BYTE PTR [eax],dh
30003424:	d5 2f                	aad    0x2f
30003426:	00 30                	add    BYTE PTR [eax],dh
30003428:	dd 2f                	(bad)  [edi]
3000342a:	00 30                	add    BYTE PTR [eax],dh
3000342c:	e6 2f                	out    0x2f,al
3000342e:	00 30                	add    BYTE PTR [eax],dh
	...

30003440 <_months_abbrev>:
30003440:	ef                   	out    dx,eax
30003441:	2f                   	das    
30003442:	00 30                	add    BYTE PTR [eax],dh
30003444:	f3 2f                	repz das 
30003446:	00 30                	add    BYTE PTR [eax],dh
30003448:	f7 2f                	imul   DWORD PTR [edi]
3000344a:	00 30                	add    BYTE PTR [eax],dh
3000344c:	fb                   	sti    
3000344d:	2f                   	das    
3000344e:	00 30                	add    BYTE PTR [eax],dh
30003450:	b6 2f                	mov    dh,0x2f
30003452:	00 30                	add    BYTE PTR [eax],dh
30003454:	ff 2f                	jmp    FWORD PTR [edi]
30003456:	00 30                	add    BYTE PTR [eax],dh
30003458:	03 30                	add    esi,DWORD PTR [eax]
3000345a:	00 30                	add    BYTE PTR [eax],dh
3000345c:	07                   	pop    es
3000345d:	30 00                	xor    BYTE PTR [eax],al
3000345f:	30 0b                	xor    BYTE PTR [ebx],cl
30003461:	30 00                	xor    BYTE PTR [eax],al
30003463:	30 0f                	xor    BYTE PTR [edi],cl
30003465:	30 00                	xor    BYTE PTR [eax],al
30003467:	30 13                	xor    BYTE PTR [ebx],dl
30003469:	30 00                	xor    BYTE PTR [eax],al
3000346b:	30 17                	xor    BYTE PTR [edi],dl
3000346d:	30 00                	xor    BYTE PTR [eax],al
3000346f:	30                   	.byte 0x30

Disassembly of section .bss:

30003470 <heapEnd>:
30003470:	00 00                	add    BYTE PTR [eax],al
	...

30003474 <heapBase>:
30003474:	00 00                	add    BYTE PTR [eax],al
	...

30003478 <heapCurr>:
30003478:	00 00                	add    BYTE PTR [eax],al
	...

3000347c <libcTZ>:
3000347c:	00 00                	add    BYTE PTR [eax],al
	...

30003480 <lasts.1234>:
30003480:	00 00                	add    BYTE PTR [eax],al
	...

30003484 <fops>:
	...

3000348c <console_file>:
	...

3000349c <_dstbias>:
3000349c:	00 00                	add    BYTE PTR [eax],al
	...

300034a0 <ticksToWait>:
300034a0:	00 00                	add    BYTE PTR [eax],al
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
     11c:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
     122:	30 09                	xor    BYTE PTR [ecx],cl
     124:	aa                   	stos   BYTE PTR es:[edi],al
     125:	00 00                	add    BYTE PTR [eax],al
     127:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     12a:	56                   	push   esi
     12b:	00 00                	add    BYTE PTR [eax],al
     12d:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
     133:	30 09                	xor    BYTE PTR [ecx],cl
     135:	56                   	push   esi
     136:	01 00                	add    DWORD PTR [eax],eax
     138:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     13f:	05 03 70 34 00       	add    eax,0x347003
     144:	30 09                	xor    BYTE PTR [ecx],cl
     146:	48                   	dec    eax
     147:	00 00                	add    BYTE PTR [eax],al
     149:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     14f:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
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
     2b2:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
     2b8:	30 09                	xor    BYTE PTR [ecx],cl
     2ba:	aa                   	stos   BYTE PTR es:[edi],al
     2bb:	00 00                	add    BYTE PTR [eax],al
     2bd:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     2c0:	56                   	push   esi
     2c1:	00 00                	add    BYTE PTR [eax],al
     2c3:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
     2c9:	30 09                	xor    BYTE PTR [ecx],cl
     2cb:	56                   	push   esi
     2cc:	01 00                	add    DWORD PTR [eax],eax
     2ce:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     2d5:	05 03 70 34 00       	add    eax,0x347003
     2da:	30 09                	xor    BYTE PTR [ecx],cl
     2dc:	48                   	dec    eax
     2dd:	00 00                	add    BYTE PTR [eax],al
     2df:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     2e5:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
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
     3cd:	00 05 03 80 34 00    	add    BYTE PTR ds:0x348003,al
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
     3eb:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
     3f1:	30 0b                	xor    BYTE PTR [ebx],cl
     3f3:	aa                   	stos   BYTE PTR es:[edi],al
     3f4:	00 00                	add    BYTE PTR [eax],al
     3f6:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     3f9:	56                   	push   esi
     3fa:	00 00                	add    BYTE PTR [eax],al
     3fc:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
     402:	30 0b                	xor    BYTE PTR [ebx],cl
     404:	56                   	push   esi
     405:	01 00                	add    DWORD PTR [eax],eax
     407:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     40e:	05 03 70 34 00       	add    eax,0x347003
     413:	30 0b                	xor    BYTE PTR [ebx],cl
     415:	48                   	dec    eax
     416:	00 00                	add    BYTE PTR [eax],al
     418:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     41e:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
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
     664:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
     66a:	30 13                	xor    BYTE PTR [ebx],dl
     66c:	aa                   	stos   BYTE PTR es:[edi],al
     66d:	00 00                	add    BYTE PTR [eax],al
     66f:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     672:	56                   	push   esi
     673:	00 00                	add    BYTE PTR [eax],al
     675:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
     67b:	30 13                	xor    BYTE PTR [ebx],dl
     67d:	56                   	push   esi
     67e:	01 00                	add    DWORD PTR [eax],eax
     680:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     687:	05 03 70 34 00       	add    eax,0x347003
     68c:	30 13                	xor    BYTE PTR [ebx],dl
     68e:	48                   	dec    eax
     68f:	00 00                	add    BYTE PTR [eax],al
     691:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
     697:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
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
     b43:	c8 06 00 00          	enter  0x6,0x0
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
     c22:	05 03 74 34 00       	add    eax,0x347403
     c27:	30 1a                	xor    BYTE PTR [edx],bl
     c29:	aa                   	stos   BYTE PTR es:[edi],al
     c2a:	00 00                	add    BYTE PTR [eax],al
     c2c:	00 06                	add    BYTE PTR [esi],al
     c2e:	34 76                	xor    al,0x76
     c30:	00 00                	add    BYTE PTR [eax],al
     c32:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
     c38:	30 1a                	xor    BYTE PTR [edx],bl
     c3a:	56                   	push   esi
     c3b:	01 00                	add    DWORD PTR [eax],eax
     c3d:	00 06                	add    BYTE PTR [esi],al
     c3f:	35 76 00 00 00       	xor    eax,0x76
     c44:	05 03 70 34 00       	add    eax,0x347003
     c49:	30 1a                	xor    BYTE PTR [edx],bl
     c4b:	48                   	dec    eax
     c4c:	00 00                	add    BYTE PTR [eax],al
     c4e:	00 07                	add    BYTE PTR [edi],al
     c50:	36                   	ss
     c51:	af                   	scas   eax,DWORD PTR es:[edi]
     c52:	00 00                	add    BYTE PTR [eax],al
     c54:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
     c5a:	30 1b                	xor    BYTE PTR [ebx],bl
     c5c:	61                   	popa   
     c5d:	00 01                	add    BYTE PTR [ecx],al
     c5f:	0d 5a 00 00 00       	or     eax,0x5a
     c64:	05 03 a0 32 00       	add    eax,0x32a003
     c69:	30 1b                	xor    BYTE PTR [ebx],bl
     c6b:	62 00                	bound  eax,QWORD PTR [eax]
     c6d:	01 0d 5a 00 00 00    	add    DWORD PTR ds:0x5a,ecx
     c73:	05 03 a4 32 00       	add    eax,0x32a403
     c78:	30 1b                	xor    BYTE PTR [ebx],bl
     c7a:	63 00                	arpl   WORD PTR [eax],ax
     c7c:	01 0d 5a 00 00 00    	add    DWORD PTR ds:0x5a,ecx
     c82:	05 03 a8 32 00       	add    eax,0x32a803
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
     ca6:	d6                   	(bad)  
     ca7:	02 00                	add    al,BYTE PTR [eax]
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
     de2:	c7 01 00 00 01 9c    	mov    DWORD PTR [ecx],0x9c010000
     de8:	b8 01 00 00 0c       	mov    eax,0xc000001
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
     e54:	c3                   	ret    
     e55:	08 00                	or     BYTE PTR [eax],al
     e57:	30 39                	xor    BYTE PTR [ecx],bh
     e59:	00 00                	add    BYTE PTR [eax],al
     e5b:	00 01                	add    BYTE PTR [ecx],al
     e5d:	9c                   	pushf  
     e5e:	00 02                	add    BYTE PTR [edx],al
     e60:	00 00                	add    BYTE PTR [eax],al
     e62:	0c 13                	or     al,0x13
     e64:	05 00 00 01 4d       	add    eax,0x4d010000
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
     e84:	ee                   	out    dx,al
     e85:	08 00                	or     BYTE PTR [eax],al
     e87:	30 00                	xor    BYTE PTR [eax],al
     e89:	0a 24 05 00 00 01 5f 	or     ah,BYTE PTR [eax*1+0x5f010000]
     e90:	fc                   	cld    
     e91:	08 00                	or     BYTE PTR [eax],al
     e93:	30 26                	xor    BYTE PTR [esi],ah
     e95:	00 00                	add    BYTE PTR [eax],al
     e97:	00 01                	add    BYTE PTR [ecx],al
     e99:	9c                   	pushf  
     e9a:	12 3f                	adc    bh,BYTE PTR [edi]
     e9c:	00 00                	add    BYTE PTR [eax],al
     e9e:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
     ea1:	5a                   	pop    edx
     ea2:	00 00                	add    BYTE PTR [eax],al
     ea4:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
     eaa:	30 12                	xor    BYTE PTR [edx],dl
     eac:	aa                   	stos   BYTE PTR es:[edi],al
     ead:	00 00                	add    BYTE PTR [eax],al
     eaf:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     eb2:	5a                   	pop    edx
     eb3:	00 00                	add    BYTE PTR [eax],al
     eb5:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
     ebb:	30 12                	xor    BYTE PTR [edx],dl
     ebd:	56                   	push   esi
     ebe:	01 00                	add    DWORD PTR [eax],eax
     ec0:	00 04 35 5a 00 00 00 	add    BYTE PTR [esi*1+0x5a],al
     ec7:	05 03 70 34 00       	add    eax,0x347003
     ecc:	30 12                	xor    BYTE PTR [edx],dl
     ece:	48                   	dec    eax
     ecf:	00 00                	add    BYTE PTR [eax],al
     ed1:	00 06                	add    BYTE PTR [esi],al
     ed3:	36                   	ss
     ed4:	e8 00 00 00 05       	call   5000ed9 <sysEnter_Vector+0x4ed0ed9>
     ed9:	03 7c 34 00          	add    edi,DWORD PTR [esp+esi*1+0x0]
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
     ef8:	24 09                	and    al,0x9
     efa:	00 30                	add    BYTE PTR [eax],dh
     efc:	9b                   	fwait
     efd:	01 00                	add    DWORD PTR [eax],eax
     eff:	00 72 06             	add    BYTE PTR [edx+0x6],dh
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
     fa5:	24 09                	and    al,0x9
     fa7:	00 30                	add    BYTE PTR [eax],dh
     fa9:	9b                   	fwait
     faa:	01 00                	add    DWORD PTR [eax],eax
     fac:	00 01                	add    BYTE PTR [ecx],al
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
     ff5:	0c 56                	or     al,0x56
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
    101b:	0c d9                	or     al,0xd9
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
    103f:	68 00 0d 52 0a       	push   0xa520d00
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
    1086:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
    108c:	30 0f                	xor    BYTE PTR [edi],cl
    108e:	aa                   	stos   BYTE PTR es:[edi],al
    108f:	00 00                	add    BYTE PTR [eax],al
    1091:	00 05 34 81 00 00    	add    BYTE PTR ds:0x8134,al
    1097:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
    109d:	30 0f                	xor    BYTE PTR [edi],cl
    109f:	56                   	push   esi
    10a0:	01 00                	add    DWORD PTR [eax],eax
    10a2:	00 05 35 81 00 00    	add    BYTE PTR ds:0x8135,al
    10a8:	00 05 03 70 34 00    	add    BYTE PTR ds:0x347003,al
    10ae:	30 0f                	xor    BYTE PTR [edi],cl
    10b0:	48                   	dec    eax
    10b1:	00 00                	add    BYTE PTR [eax],al
    10b3:	00 06                	add    BYTE PTR [esi],al
    10b5:	36 8c 00             	mov    WORD PTR ss:[eax],es
    10b8:	00 00                	add    BYTE PTR [eax],al
    10ba:	05 03 7c 34 00       	add    eax,0x347c03
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
    10da:	c0 0a 00             	ror    BYTE PTR [edx],0x0
    10dd:	30 c7                	xor    bh,al
    10df:	00 00                	add    BYTE PTR [eax],al
    10e1:	00 63 07             	add    BYTE PTR [ebx+0x7],ah
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
    1188:	be 00 00 00 c0       	mov    esi,0xc0000000
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
    1220:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
    1226:	30 0b                	xor    BYTE PTR [ebx],cl
    1228:	aa                   	stos   BYTE PTR es:[edi],al
    1229:	00 00                	add    BYTE PTR [eax],al
    122b:	00 05 34 6c 00 00    	add    BYTE PTR ds:0x6c34,al
    1231:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
    1237:	30 0b                	xor    BYTE PTR [ebx],cl
    1239:	56                   	push   esi
    123a:	01 00                	add    DWORD PTR [eax],eax
    123c:	00 05 35 6c 00 00    	add    BYTE PTR ds:0x6c35,al
    1242:	00 05 03 70 34 00    	add    BYTE PTR ds:0x347003,al
    1248:	30 0b                	xor    BYTE PTR [ebx],cl
    124a:	48                   	dec    eax
    124b:	00 00                	add    BYTE PTR [eax],al
    124d:	00 06                	add    BYTE PTR [esi],al
    124f:	36 a5                	movs   DWORD PTR es:[edi],DWORD PTR ss:[esi]
    1251:	00 00                	add    BYTE PTR [eax],al
    1253:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
    1259:	30 00                	xor    BYTE PTR [eax],al
    125b:	50                   	push   eax
    125c:	04 00                	add    al,0x0
    125e:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1261:	ff 06                	inc    DWORD PTR [esi]
    1263:	00 00                	add    BYTE PTR [eax],al
    1265:	04 01                	add    al,0x1
    1267:	ef                   	out    dx,eax
    1268:	00 00                	add    BYTE PTR [eax],al
    126a:	00 0c 05 07 00 00 6d 	add    BYTE PTR [eax*1+0x6d000007],cl
    1271:	00 00                	add    BYTE PTR [eax],al
    1273:	00 88 0b 00 30 a5    	add    BYTE PTR [eax-0x5acffff5],cl
    1279:	00 00                	add    BYTE PTR [eax],al
    127b:	00 37                	add    BYTE PTR [edi],dh
    127d:	08 00                	or     BYTE PTR [eax],al
    127f:	00 02                	add    BYTE PTR [edx],al
    1281:	04 05                	add    al,0x5
    1283:	69 6e 74 00 03 78 03 	imul   ebp,DWORD PTR [esi+0x74],0x3780300
    128a:	00 00                	add    BYTE PTR [eax],al
    128c:	03 d8                	add    ebx,eax
    128e:	37                   	aaa    
    128f:	00 00                	add    BYTE PTR [eax],al
    1291:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    1294:	07                   	pop    es
    1295:	32 00                	xor    al,BYTE PTR [eax]
    1297:	00 00                	add    BYTE PTR [eax],al
    1299:	04 04                	add    al,0x4
    129b:	05 05 00 00 00       	add    eax,0x5
    12a0:	04 08                	add    al,0x8
    12a2:	05 00 00 00 00       	add    eax,0x0
    12a7:	04 0c                	add    al,0xc
    12a9:	04 96                	add    al,0x96
    12ab:	00 00                	add    BYTE PTR [eax],al
    12ad:	00 05 6a 06 00 00    	add    BYTE PTR ds:0x66a,al
    12b3:	0c 02                	or     al,0x2
    12b5:	17                   	pop    ss
    12b6:	84 00                	test   BYTE PTR [eax],al
    12b8:	00 00                	add    BYTE PTR [eax],al
    12ba:	06                   	push   es
    12bb:	85 07                	test   DWORD PTR [edi],eax
    12bd:	00 00                	add    BYTE PTR [eax],al
    12bf:	02 19                	add    bl,BYTE PTR [ecx]
    12c1:	84 00                	test   BYTE PTR [eax],al
    12c3:	00 00                	add    BYTE PTR [eax],al
    12c5:	00 06                	add    BYTE PTR [esi],al
    12c7:	af                   	scas   eax,DWORD PTR es:[edi]
    12c8:	05 00 00 02 19       	add    eax,0x19020000
    12cd:	84 00                	test   BYTE PTR [eax],al
    12cf:	00 00                	add    BYTE PTR [eax],al
    12d1:	04 06                	add    al,0x6
    12d3:	7d 07                	jge    12dc <sysEnter_Vector-0x12ed24>
    12d5:	00 00                	add    BYTE PTR [eax],al
    12d7:	02 1a                	add    bl,BYTE PTR [edx]
    12d9:	8a 00                	mov    al,BYTE PTR [eax]
    12db:	00 00                	add    BYTE PTR [eax],al
    12dd:	08 00                	or     BYTE PTR [eax],al
    12df:	07                   	pop    es
    12e0:	04 53                	add    al,0x53
    12e2:	00 00                	add    BYTE PTR [eax],al
    12e4:	00 08                	add    BYTE PTR [eax],cl
    12e6:	04 03                	add    al,0x3
    12e8:	56                   	push   esi
    12e9:	07                   	pop    es
    12ea:	00 00                	add    BYTE PTR [eax],al
    12ec:	02 1b                	add    bl,BYTE PTR [ebx]
    12ee:	53                   	push   ebx
    12ef:	00 00                	add    BYTE PTR [eax],al
    12f1:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    12f4:	06                   	push   es
    12f5:	51                   	push   ecx
    12f6:	00 00                	add    BYTE PTR [eax],al
    12f8:	00 04 02             	add    BYTE PTR [edx+eax*1],al
    12fb:	05 e5 00 00 00       	add    eax,0xe5
    1300:	04 01                	add    al,0x1
    1302:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1305:	00 00                	add    BYTE PTR [eax],al
    1307:	04 02                	add    al,0x2
    1309:	07                   	pop    es
    130a:	0e                   	push   cs
    130b:	00 00                	add    BYTE PTR [eax],al
    130d:	00 03                	add    BYTE PTR [ebx],al
    130f:	12 06                	adc    al,BYTE PTR [esi]
    1311:	00 00                	add    BYTE PTR [eax],al
    1313:	04 37                	add    al,0x37
    1315:	be 00 00 00 04       	mov    esi,0x4000000
    131a:	08 07                	or     BYTE PTR [edi],al
    131c:	28 00                	sub    BYTE PTR [eax],al
    131e:	00 00                	add    BYTE PTR [eax],al
    1320:	05 1b 06 00 00       	add    eax,0x61b
    1325:	14 05                	adc    al,0x5
    1327:	1b f6                	sbb    esi,esi
    1329:	00 00                	add    BYTE PTR [eax],al
    132b:	00 06                	add    BYTE PTR [esi],al
    132d:	19 07                	sbb    DWORD PTR [edi],eax
    132f:	00 00                	add    BYTE PTR [eax],al
    1331:	05 1d 8c 00 00       	add    eax,0x8c1d
    1336:	00 00                	add    BYTE PTR [eax],al
    1338:	06                   	push   es
    1339:	94                   	xchg   esp,eax
    133a:	06                   	push   es
    133b:	00 00                	add    BYTE PTR [eax],al
    133d:	05 1e 37 00 00       	add    eax,0x371e
    1342:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
    1345:	cd 06                	int    0x6
    1347:	00 00                	add    BYTE PTR [eax],al
    1349:	05 1f 27 01 00       	add    eax,0x1271f
    134e:	00 10                	add    BYTE PTR [eax],dl
    1350:	00 05 04 06 00 00    	add    BYTE PTR ds:0x604,al
    1356:	0c 05                	or     al,0x5
    1358:	37                   	aaa    
    1359:	27                   	daa    
    135a:	01 00                	add    DWORD PTR [eax],eax
    135c:	00 06                	add    BYTE PTR [esi],al
    135e:	fe 06                	inc    BYTE PTR [esi]
    1360:	00 00                	add    BYTE PTR [eax],al
    1362:	05 39 30 02 00       	add    eax,0x23039
    1367:	00 00                	add    BYTE PTR [eax],al
    1369:	06                   	push   es
    136a:	e7 06                	out    0x6,eax
    136c:	00 00                	add    BYTE PTR [eax],al
    136e:	05 3a 3d 02 00       	add    eax,0x23d3a
    1373:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    1376:	bd 06 00 00 05       	mov    ebp,0x5000006
    137b:	3b 27                	cmp    esp,DWORD PTR [edi]
    137d:	01 00                	add    DWORD PTR [eax],eax
    137f:	00 08                	add    BYTE PTR [eax],cl
    1381:	00 07                	add    BYTE PTR [edi],al
    1383:	04 f6                	add    al,0xf6
    1385:	00 00                	add    BYTE PTR [eax],al
    1387:	00 05 32 06 00 00    	add    BYTE PTR ds:0x632,al
    138d:	0c 05                	or     al,0x5
    138f:	22 5e 01             	and    bl,BYTE PTR [esi+0x1]
    1392:	00 00                	add    BYTE PTR [eax],al
    1394:	06                   	push   es
    1395:	27                   	daa    
    1396:	06                   	push   es
    1397:	00 00                	add    BYTE PTR [eax],al
    1399:	05 24 27 01 00       	add    eax,0x12724
    139e:	00 00                	add    BYTE PTR [eax],al
    13a0:	06                   	push   es
    13a1:	7a 06                	jp     13a9 <sysEnter_Vector-0x12ec57>
    13a3:	00 00                	add    BYTE PTR [eax],al
    13a5:	05 25 5e 01 00       	add    eax,0x15e25
    13aa:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    13ad:	20 07                	and    BYTE PTR [edi],al
    13af:	00 00                	add    BYTE PTR [eax],al
    13b1:	05 26 25 00 00       	add    eax,0x2526
    13b6:	00 08                	add    BYTE PTR [eax],cl
    13b8:	00 07                	add    BYTE PTR [edi],al
    13ba:	04 c5                	add    al,0xc5
    13bc:	00 00                	add    BYTE PTR [eax],al
    13be:	00 05 e9 06 00 00    	add    BYTE PTR ds:0x6e9,al
    13c4:	24 05                	and    al,0x5
    13c6:	29 d1                	sub    ecx,edx
    13c8:	01 00                	add    DWORD PTR [eax],eax
    13ca:	00 06                	add    BYTE PTR [esi],al
    13cc:	8e 06                	mov    es,WORD PTR [esi]
    13ce:	00 00                	add    BYTE PTR [eax],al
    13d0:	05 2b 37 00 00       	add    eax,0x372b
    13d5:	00 00                	add    BYTE PTR [eax],al
    13d7:	06                   	push   es
    13d8:	4f                   	dec    edi
    13d9:	07                   	pop    es
    13da:	00 00                	add    BYTE PTR [eax],al
    13dc:	05 2c ac 00 00       	add    eax,0xac2c
    13e1:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    13e4:	b3 06                	mov    bl,0x6
    13e6:	00 00                	add    BYTE PTR [eax],al
    13e8:	05 2d ac 00 00       	add    eax,0xac2d
    13ed:	00 06                	add    BYTE PTR [esi],al
    13ef:	06                   	push   es
    13f0:	9a 06 00 00 05 2e 37 	call   0x372e:0x5000006
    13f7:	00 00                	add    BYTE PTR [eax],al
    13f9:	00 08                	add    BYTE PTR [eax],cl
    13fb:	06                   	push   es
    13fc:	8a 07                	mov    al,BYTE PTR [edi]
    13fe:	00 00                	add    BYTE PTR [eax],al
    1400:	05 2f 37 00 00       	add    eax,0x372f
    1405:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
    1408:	81 06 00 00 05 30    	add    DWORD PTR [esi],0x30050000
    140e:	37                   	aaa    
    140f:	00 00                	add    BYTE PTR [eax],al
    1411:	00 10                	add    BYTE PTR [eax],dl
    1413:	06                   	push   es
    1414:	78 07                	js     141d <sysEnter_Vector-0x12ebe3>
    1416:	00 00                	add    BYTE PTR [eax],al
    1418:	05 31 1a 02 00       	add    eax,0x21a31
    141d:	00 14 06             	add    BYTE PTR [esi+eax*1],dl
    1420:	30 06                	xor    BYTE PTR [esi],al
    1422:	00 00                	add    BYTE PTR [eax],al
    1424:	05 32 2d 01 00       	add    eax,0x12d32
    1429:	00 18                	add    BYTE PTR [eax],bl
    142b:	00 05 59 06 00 00    	add    BYTE PTR ds:0x659,al
    1431:	14 05                	adc    al,0x5
    1433:	3e 1a 02             	sbb    al,BYTE PTR ds:[edx]
    1436:	00 00                	add    BYTE PTR [eax],al
    1438:	06                   	push   es
    1439:	ac                   	lods   al,BYTE PTR ds:[esi]
    143a:	06                   	push   es
    143b:	00 00                	add    BYTE PTR [eax],al
    143d:	05 40 57 02 00       	add    eax,0x25740
    1442:	00 00                	add    BYTE PTR [eax],al
    1444:	06                   	push   es
    1445:	49                   	dec    ecx
    1446:	07                   	pop    es
    1447:	00 00                	add    BYTE PTR [eax],al
    1449:	05 41 57 02 00       	add    eax,0x25741
    144e:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    1451:	e1 06                	loope  1459 <sysEnter_Vector-0x12eba7>
    1453:	00 00                	add    BYTE PTR [eax],al
    1455:	05 42 57 02 00       	add    eax,0x25742
    145a:	00 08                	add    BYTE PTR [eax],cl
    145c:	06                   	push   es
    145d:	74 06                	je     1465 <sysEnter_Vector-0x12eb9b>
    145f:	00 00                	add    BYTE PTR [eax],al
    1461:	05 43 71 02 00       	add    eax,0x27143
    1466:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
    1469:	40                   	inc    eax
    146a:	06                   	push   es
    146b:	00 00                	add    BYTE PTR [eax],al
    146d:	05 44 9a 02 00       	add    eax,0x29a44
    1472:	00 10                	add    BYTE PTR [eax],dl
    1474:	00 07                	add    BYTE PTR [edi],al
    1476:	04 20                	add    al,0x20
    1478:	02 00                	add    al,BYTE PTR [eax]
    147a:	00 09                	add    BYTE PTR [ecx],cl
    147c:	d1 01                	rol    DWORD PTR [ecx],1
    147e:	00 00                	add    BYTE PTR [eax],al
    1480:	03 ef                	add    ebp,edi
    1482:	06                   	push   es
    1483:	00 00                	add    BYTE PTR [eax],al
    1485:	05 35 64 01 00       	add    eax,0x16435
    148a:	00 07                	add    BYTE PTR [edi],al
    148c:	04 36                	add    al,0x36
    148e:	02 00                	add    al,BYTE PTR [eax]
    1490:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1493:	06                   	push   es
    1494:	58                   	pop    eax
    1495:	00 00                	add    BYTE PTR [eax],al
    1497:	00 07                	add    BYTE PTR [edi],al
    1499:	04 64                	add    al,0x64
    149b:	01 00                	add    DWORD PTR [eax],eax
    149d:	00 0a                	add    BYTE PTR [edx],cl
    149f:	25 00 00 00 57       	and    eax,0x57000000
    14a4:	02 00                	add    al,BYTE PTR [eax]
    14a6:	00 0b                	add    BYTE PTR [ebx],cl
    14a8:	3d 02 00 00 0b       	cmp    eax,0xb000002
    14ad:	27                   	daa    
    14ae:	01 00                	add    DWORD PTR [eax],eax
    14b0:	00 00                	add    BYTE PTR [eax],al
    14b2:	07                   	pop    es
    14b3:	04 43                	add    al,0x43
    14b5:	02 00                	add    al,BYTE PTR [eax]
    14b7:	00 0a                	add    BYTE PTR [edx],cl
    14b9:	25 00 00 00 71       	and    eax,0x71000000
    14be:	02 00                	add    al,BYTE PTR [eax]
    14c0:	00 0b                	add    BYTE PTR [ebx],cl
    14c2:	3d 02 00 00 0b       	cmp    eax,0xb000002
    14c7:	f6 00 00             	test   BYTE PTR [eax],0x0
    14ca:	00 00                	add    BYTE PTR [eax],al
    14cc:	07                   	pop    es
    14cd:	04 5d                	add    al,0x5d
    14cf:	02 00                	add    al,BYTE PTR [eax]
    14d1:	00 0a                	add    BYTE PTR [edx],cl
    14d3:	25 00 00 00 9a       	and    eax,0x9a000000
    14d8:	02 00                	add    al,BYTE PTR [eax]
    14da:	00 0b                	add    BYTE PTR [ebx],cl
    14dc:	3d 02 00 00 0b       	cmp    eax,0xb000002
    14e1:	27                   	daa    
    14e2:	01 00                	add    DWORD PTR [eax],eax
    14e4:	00 0b                	add    BYTE PTR [ebx],cl
    14e6:	3d 02 00 00 0b       	cmp    eax,0xb000002
    14eb:	27                   	daa    
    14ec:	01 00                	add    DWORD PTR [eax],eax
    14ee:	00 0b                	add    BYTE PTR [ebx],cl
    14f0:	37                   	aaa    
    14f1:	00 00                	add    BYTE PTR [eax],al
    14f3:	00 00                	add    BYTE PTR [eax],al
    14f5:	07                   	pop    es
    14f6:	04 77                	add    al,0x77
    14f8:	02 00                	add    al,BYTE PTR [eax]
    14fa:	00 03                	add    BYTE PTR [ebx],al
    14fc:	0b 06                	or     eax,DWORD PTR [esi]
    14fe:	00 00                	add    BYTE PTR [eax],al
    1500:	05 47 ab 02 00       	add    eax,0x2ab47
    1505:	00 05 dc 06 00 00    	add    BYTE PTR ds:0x6dc,al
    150b:	10 05 4f dc 02 00    	adc    BYTE PTR ds:0x2dc4f,al
    1511:	00 06                	add    BYTE PTR [esi],al
    1513:	c6 06 00             	mov    BYTE PTR [esi],0x0
    1516:	00 05 51 30 02 00    	add    BYTE PTR ds:0x23051,al
    151c:	00 00                	add    BYTE PTR [eax],al
    151e:	06                   	push   es
    151f:	11 07                	adc    DWORD PTR [edi],eax
    1521:	00 00                	add    BYTE PTR [eax],al
    1523:	05 52 3d 02 00       	add    eax,0x23d52
    1528:	00 04 06             	add    BYTE PTR [esi+eax*1],al
    152b:	3b 06                	cmp    eax,DWORD PTR [esi]
    152d:	00 00                	add    BYTE PTR [eax],al
    152f:	05 53 dc 02 00       	add    eax,0x2dc53
    1534:	00 08                	add    BYTE PTR [eax],cl
    1536:	00 05 5f 07 00 00    	add    BYTE PTR ds:0x75f,al
    153c:	08 05 49 01 03 00    	or     BYTE PTR ds:0x30149,al
    1542:	00 06                	add    BYTE PTR [esi],al
    1544:	89 06                	mov    DWORD PTR [esi],eax
    1546:	00 00                	add    BYTE PTR [eax],al
    1548:	05 4b 2b 03 00       	add    eax,0x32b4b
    154d:	00 00                	add    BYTE PTR [eax],al
    154f:	06                   	push   es
    1550:	fe 05 00 00 05 4c    	inc    BYTE PTR ds:0x4c050000
    1556:	5a                   	pop    edx
    1557:	03 00                	add    eax,DWORD PTR [eax]
    1559:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    155c:	0a 2c 00             	or     ch,BYTE PTR [eax+eax*1]
    155f:	00 00                	add    BYTE PTR [eax],al
    1561:	1f                   	pop    ds
    1562:	03 00                	add    eax,DWORD PTR [eax]
    1564:	00 0b                	add    BYTE PTR [ebx],cl
    1566:	1f                   	pop    ds
    1567:	03 00                	add    eax,DWORD PTR [eax]
    1569:	00 0b                	add    BYTE PTR [ebx],cl
    156b:	30 02                	xor    BYTE PTR [edx],al
    156d:	00 00                	add    BYTE PTR [eax],al
    156f:	0b 2c 00             	or     ebp,DWORD PTR [eax+eax*1]
    1572:	00 00                	add    BYTE PTR [eax],al
    1574:	0b 25 03 00 00 00    	or     esp,DWORD PTR ds:0x3
    157a:	07                   	pop    es
    157b:	04 ab                	add    al,0xab
    157d:	02 00                	add    al,BYTE PTR [eax]
    157f:	00 07                	add    BYTE PTR [edi],al
    1581:	04 b3                	add    al,0xb3
    1583:	00 00                	add    BYTE PTR [eax],al
    1585:	00 07                	add    BYTE PTR [edi],al
    1587:	04 01                	add    al,0x1
    1589:	03 00                	add    eax,DWORD PTR [eax]
    158b:	00 0a                	add    BYTE PTR [edx],cl
    158d:	2c 00                	sub    al,0x0
    158f:	00 00                	add    BYTE PTR [eax],al
    1591:	4f                   	dec    edi
    1592:	03 00                	add    eax,DWORD PTR [eax]
    1594:	00 0b                	add    BYTE PTR [ebx],cl
    1596:	1f                   	pop    ds
    1597:	03 00                	add    eax,DWORD PTR [eax]
    1599:	00 0b                	add    BYTE PTR [ebx],cl
    159b:	4f                   	dec    edi
    159c:	03 00                	add    eax,DWORD PTR [eax]
    159e:	00 0b                	add    BYTE PTR [ebx],cl
    15a0:	2c 00                	sub    al,0x0
    15a2:	00 00                	add    BYTE PTR [eax],al
    15a4:	0b 25 03 00 00 00    	or     esp,DWORD PTR ds:0x3
    15aa:	07                   	pop    es
    15ab:	04 55                	add    al,0x55
    15ad:	03 00                	add    eax,DWORD PTR [eax]
    15af:	00 09                	add    BYTE PTR [ecx],cl
    15b1:	36 02 00             	add    al,BYTE PTR ss:[eax]
    15b4:	00 07                	add    BYTE PTR [edi],al
    15b6:	04 31                	add    al,0x31
    15b8:	03 00                	add    eax,DWORD PTR [eax]
    15ba:	00 03                	add    BYTE PTR [ebx],al
    15bc:	2a 07                	sub    al,BYTE PTR [edi]
    15be:	00 00                	add    BYTE PTR [eax],al
    15c0:	05 4d dc 02 00       	add    eax,0x2dc4d
    15c5:	00 0c a0             	add    BYTE PTR [eax+eiz*4],cl
    15c8:	06                   	push   es
    15c9:	00 00                	add    BYTE PTR [eax],al
    15cb:	01 0f                	add    DWORD PTR [edi],ecx
    15cd:	2c 00                	sub    al,0x0
    15cf:	00 00                	add    BYTE PTR [eax],al
    15d1:	88 0b                	mov    BYTE PTR [ebx],cl
    15d3:	00 30                	add    BYTE PTR [eax],dh
    15d5:	2c 00                	sub    al,0x0
    15d7:	00 00                	add    BYTE PTR [eax],al
    15d9:	01 9c bd 03 00 00 0d 	add    DWORD PTR [ebp+edi*4+0xd000003],ebx
    15e0:	54                   	push   esp
    15e1:	06                   	push   es
    15e2:	00 00                	add    BYTE PTR [eax],al
    15e4:	01 0f                	add    DWORD PTR [edi],ecx
    15e6:	1f                   	pop    ds
    15e7:	03 00                	add    eax,DWORD PTR [eax]
    15e9:	00 02                	add    BYTE PTR [edx],al
    15eb:	91                   	xchg   ecx,eax
    15ec:	00 0d 06 02 00 00    	add    BYTE PTR ds:0x206,cl
    15f2:	01 0f                	add    DWORD PTR [edi],ecx
    15f4:	30 02                	xor    BYTE PTR [edx],al
    15f6:	00 00                	add    BYTE PTR [eax],al
    15f8:	02 91 04 0d 9d 03    	add    dl,BYTE PTR [ecx+0x39d0d04]
    15fe:	00 00                	add    BYTE PTR [eax],al
    1600:	01 0f                	add    DWORD PTR [edi],ecx
    1602:	2c 00                	sub    al,0x0
    1604:	00 00                	add    BYTE PTR [eax],al
    1606:	02 91 08 0d 6f 07    	add    dl,BYTE PTR [ecx+0x76f0d08]
    160c:	00 00                	add    BYTE PTR [eax],al
    160e:	01 0f                	add    DWORD PTR [edi],ecx
    1610:	25 03 00 00 02       	and    eax,0x2000003
    1615:	91                   	xchg   ecx,eax
    1616:	0c 00                	or     al,0x0
    1618:	0c 47                	or     al,0x47
    161a:	06                   	push   es
    161b:	00 00                	add    BYTE PTR [eax],al
    161d:	01 14 2c             	add    DWORD PTR [esp+ebp*1],edx
    1620:	00 00                	add    BYTE PTR [eax],al
    1622:	00 b4 0b 00 30 26 00 	add    BYTE PTR [ebx+ecx*1+0x263000],dh
    1629:	00 00                	add    BYTE PTR [eax],al
    162b:	01 9c 0f 04 00 00 0d 	add    DWORD PTR [edi+ecx*1+0xd000004],ebx
    1632:	54                   	push   esp
    1633:	06                   	push   es
    1634:	00 00                	add    BYTE PTR [eax],al
    1636:	01 14 1f             	add    DWORD PTR [edi+ebx*1],edx
    1639:	03 00                	add    eax,DWORD PTR [eax]
    163b:	00 02                	add    BYTE PTR [edx],al
    163d:	91                   	xchg   ecx,eax
    163e:	00 0d 06 02 00 00    	add    BYTE PTR ds:0x206,cl
    1644:	01 14 4f             	add    DWORD PTR [edi+ecx*2],edx
    1647:	03 00                	add    eax,DWORD PTR [eax]
    1649:	00 02                	add    BYTE PTR [edx],al
    164b:	91                   	xchg   ecx,eax
    164c:	04 0d                	add    al,0xd
    164e:	9d                   	popf   
    164f:	03 00                	add    eax,DWORD PTR [eax]
    1651:	00 01                	add    BYTE PTR [ecx],al
    1653:	14 2c                	adc    al,0x2c
    1655:	00 00                	add    BYTE PTR [eax],al
    1657:	00 02                	add    BYTE PTR [edx],al
    1659:	91                   	xchg   ecx,eax
    165a:	08 0d 6f 07 00 00    	or     BYTE PTR ds:0x76f,cl
    1660:	01 14 25 03 00 00 02 	add    DWORD PTR [eiz*1+0x2000003],edx
    1667:	91                   	xchg   ecx,eax
    1668:	0c 00                	or     al,0x0
    166a:	0e                   	push   cs
    166b:	f7 06 00 00 01 19    	test   DWORD PTR [esi],0x19010000
    1671:	da 0b                	fimul  DWORD PTR [ebx]
    1673:	00 30                	add    BYTE PTR [eax],dh
    1675:	53                   	push   ebx
    1676:	00 00                	add    BYTE PTR [eax],al
    1678:	00 01                	add    BYTE PTR [ecx],al
    167a:	9c                   	pushf  
    167b:	0f 3b                	(bad)  
    167d:	06                   	push   es
    167e:	00 00                	add    BYTE PTR [eax],al
    1680:	01 0b                	add    DWORD PTR [ebx],ecx
    1682:	60                   	pusha  
    1683:	03 00                	add    eax,DWORD PTR [eax]
    1685:	00 05 03 84 34 00    	add    BYTE PTR ds:0x348403,al
    168b:	30 0f                	xor    BYTE PTR [edi],cl
    168d:	3c 07                	cmp    al,0x7
    168f:	00 00                	add    BYTE PTR [eax],al
    1691:	01 0c 25 02 00 00 05 	add    DWORD PTR [eiz*1+0x5000002],ecx
    1698:	03 c0                	add    eax,eax
    169a:	32 00                	xor    al,BYTE PTR [eax]
    169c:	30 0f                	xor    BYTE PTR [edi],cl
    169e:	d4 06                	aam    0x6
    16a0:	00 00                	add    BYTE PTR [eax],al
    16a2:	01 0d a0 02 00 00    	add    DWORD PTR ds:0x2a0,ecx
    16a8:	05 03 8c 34 00       	add    eax,0x348c03
    16ad:	30 00                	xor    BYTE PTR [eax],al
    16af:	6b 01 00             	imul   eax,DWORD PTR [ecx],0x0
    16b2:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    16b5:	cf                   	iret   
    16b6:	07                   	pop    es
    16b7:	00 00                	add    BYTE PTR [eax],al
    16b9:	04 01                	add    al,0x1
    16bb:	ef                   	out    dx,eax
    16bc:	00 00                	add    BYTE PTR [eax],al
    16be:	00 0c a3             	add    BYTE PTR [ebx+eiz*4],cl
    16c1:	07                   	pop    es
    16c2:	00 00                	add    BYTE PTR [eax],al
    16c4:	6d                   	ins    DWORD PTR es:[edi],dx
    16c5:	00 00                	add    BYTE PTR [eax],al
    16c7:	00 30                	add    BYTE PTR [eax],dh
    16c9:	0c 00                	or     al,0x0
    16cb:	30 ad 00 00 00 1b    	xor    BYTE PTR [ebp+0x1b000000],ch
    16d1:	09 00                	or     DWORD PTR [eax],eax
    16d3:	00 02                	add    BYTE PTR [edx],al
    16d5:	01 06                	add    DWORD PTR [esi],eax
    16d7:	58                   	pop    eax
    16d8:	00 00                	add    BYTE PTR [eax],al
    16da:	00 02                	add    BYTE PTR [edx],al
    16dc:	01 06                	add    DWORD PTR [esi],eax
    16de:	51                   	push   ecx
    16df:	00 00                	add    BYTE PTR [eax],al
    16e1:	00 02                	add    BYTE PTR [edx],al
    16e3:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    16e9:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    16f0:	02 08                	add    cl,BYTE PTR [eax]
    16f2:	05 00 00 00 00       	add    eax,0x0
    16f7:	02 01                	add    al,BYTE PTR [ecx]
    16f9:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    16fc:	00 00                	add    BYTE PTR [eax],al
    16fe:	02 02                	add    al,BYTE PTR [edx]
    1700:	07                   	pop    es
    1701:	0e                   	push   cs
    1702:	00 00                	add    BYTE PTR [eax],al
    1704:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1707:	00 00                	add    BYTE PTR [eax],al
    1709:	00 02                	add    BYTE PTR [edx],al
    170b:	34 61                	xor    al,0x61
    170d:	00 00                	add    BYTE PTR [eax],al
    170f:	00 02                	add    BYTE PTR [edx],al
    1711:	04 07                	add    al,0x7
    1713:	32 00                	xor    al,BYTE PTR [eax]
    1715:	00 00                	add    BYTE PTR [eax],al
    1717:	02 08                	add    cl,BYTE PTR [eax]
    1719:	07                   	pop    es
    171a:	28 00                	sub    BYTE PTR [eax],al
    171c:	00 00                	add    BYTE PTR [eax],al
    171e:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1725:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1728:	96                   	xchg   esi,eax
    1729:	00 00                	add    BYTE PTR [eax],al
    172b:	00 02                	add    BYTE PTR [edx],al
    172d:	01 02                	add    DWORD PTR [edx],eax
    172f:	90                   	nop
    1730:	00 00                	add    BYTE PTR [eax],al
    1732:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1739:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    173c:	00 00                	add    BYTE PTR [eax],al
    173e:	05 04 95 00 00       	add    eax,0x9504
    1743:	00 06                	add    BYTE PTR [esi],al
    1745:	25 00 00 00 02       	and    eax,0x2000000
    174a:	04 07                	add    al,0x7
    174c:	2d 00 00 00 02       	sub    eax,0x2000000
    1751:	04 07                	add    al,0x7
    1753:	dc 00                	fadd   QWORD PTR [eax]
    1755:	00 00                	add    BYTE PTR [eax],al
    1757:	05 04 25 00 00       	add    eax,0x2504
    175c:	00 07                	add    BYTE PTR [edi],al
    175e:	90                   	nop
    175f:	07                   	pop    es
    1760:	00 00                	add    BYTE PTR [eax],al
    1762:	01 1d a8 00 00 00    	add    DWORD PTR ds:0xa8,ebx
    1768:	30 0c 00             	xor    BYTE PTR [eax+eax*1],cl
    176b:	30 3e                	xor    BYTE PTR [esi],bh
    176d:	00 00                	add    BYTE PTR [eax],al
    176f:	00 01                	add    BYTE PTR [ecx],al
    1771:	9c                   	pushf  
    1772:	e4 00                	in     al,0x0
    1774:	00 00                	add    BYTE PTR [eax],al
    1776:	08 cb                	or     bl,cl
    1778:	05 00 00 01 1d       	add    eax,0x1d010000
    177d:	a8 00                	test   al,0x0
    177f:	00 00                	add    BYTE PTR [eax],al
    1781:	02 91 00 09 73 72    	add    dl,BYTE PTR [ecx+0x72730900]
    1787:	63 00                	arpl   WORD PTR [eax],ax
    1789:	01 1d 8f 00 00 00    	add    DWORD PTR ds:0x8f,ebx
    178f:	02 91 04 00 0a 97    	add    dl,BYTE PTR [ecx-0x68f5fffc]
    1795:	07                   	pop    es
    1796:	00 00                	add    BYTE PTR [eax],al
    1798:	01 23                	add    DWORD PTR [ebx],esp
    179a:	6e                   	outs   dx,BYTE PTR ds:[esi]
    179b:	0c 00                	or     al,0x0
    179d:	30 6f 00             	xor    BYTE PTR [edi+0x0],ch
    17a0:	00 00                	add    BYTE PTR [eax],al
    17a2:	01 9c 2a 01 00 00 09 	add    DWORD PTR [edx+ebp*1+0x9000001],ebx
    17a9:	70 00                	jo     17ab <sysEnter_Vector-0x12e855>
    17ab:	01 23                	add    DWORD PTR [ebx],esp
    17ad:	a8 00                	test   al,0x0
    17af:	00 00                	add    BYTE PTR [eax],al
    17b1:	02 91 00 09 71 00    	add    dl,BYTE PTR [ecx+0x710900]
    17b7:	01 23                	add    DWORD PTR [ebx],esp
    17b9:	a8 00                	test   al,0x0
    17bb:	00 00                	add    BYTE PTR [eax],al
    17bd:	02 91 04 0b 63 00    	add    dl,BYTE PTR [ecx+0x630b04]
    17c3:	01 24 3a             	add    DWORD PTR [edx+edi*1],esp
    17c6:	00 00                	add    BYTE PTR [eax],al
    17c8:	00 02                	add    BYTE PTR [edx],al
    17ca:	91                   	xchg   ecx,eax
    17cb:	74 0b                	je     17d8 <sysEnter_Vector-0x12e828>
    17cd:	64 00 01             	add    BYTE PTR fs:[ecx],al
    17d0:	24 3a                	and    al,0x3a
    17d2:	00 00                	add    BYTE PTR [eax],al
    17d4:	00 02                	add    BYTE PTR [edx],al
    17d6:	91                   	xchg   ecx,eax
    17d7:	70 00                	jo     17d9 <sysEnter_Vector-0x12e827>
    17d9:	0c 3f                	or     al,0x3f
    17db:	00 00                	add    BYTE PTR [eax],al
    17dd:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    17e0:	56                   	push   esi
    17e1:	00 00                	add    BYTE PTR [eax],al
    17e3:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
    17e9:	30 0c aa             	xor    BYTE PTR [edx+ebp*4],cl
    17ec:	00 00                	add    BYTE PTR [eax],al
    17ee:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    17f1:	56                   	push   esi
    17f2:	00 00                	add    BYTE PTR [eax],al
    17f4:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
    17fa:	30 0c 56             	xor    BYTE PTR [esi+edx*2],cl
    17fd:	01 00                	add    DWORD PTR [eax],eax
    17ff:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    1806:	05 03 70 34 00       	add    eax,0x347003
    180b:	30 0c 48             	xor    BYTE PTR [eax+ecx*2],cl
    180e:	00 00                	add    BYTE PTR [eax],al
    1810:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    1816:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
    181c:	30 00                	xor    BYTE PTR [eax],al
    181e:	5a                   	pop    edx
    181f:	01 00                	add    DWORD PTR [eax],eax
    1821:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1824:	8a 08                	mov    cl,BYTE PTR [eax]
    1826:	00 00                	add    BYTE PTR [eax],al
    1828:	04 01                	add    al,0x1
    182a:	ef                   	out    dx,eax
    182b:	00 00                	add    BYTE PTR [eax],al
    182d:	00 0c bf             	add    BYTE PTR [edi+edi*4],cl
    1830:	07                   	pop    es
    1831:	00 00                	add    BYTE PTR [eax],al
    1833:	6d                   	ins    DWORD PTR es:[edi],dx
    1834:	00 00                	add    BYTE PTR [eax],al
    1836:	00 e0                	add    al,ah
    1838:	0c 00                	or     al,0x0
    183a:	30 5e 00             	xor    BYTE PTR [esi+0x0],bl
    183d:	00 00                	add    BYTE PTR [eax],al
    183f:	ee                   	out    dx,al
    1840:	09 00                	or     DWORD PTR [eax],eax
    1842:	00 02                	add    BYTE PTR [edx],al
    1844:	01 06                	add    DWORD PTR [esi],eax
    1846:	58                   	pop    eax
    1847:	00 00                	add    BYTE PTR [eax],al
    1849:	00 02                	add    BYTE PTR [edx],al
    184b:	01 06                	add    DWORD PTR [esi],eax
    184d:	51                   	push   ecx
    184e:	00 00                	add    BYTE PTR [eax],al
    1850:	00 02                	add    BYTE PTR [edx],al
    1852:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1858:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    185f:	02 08                	add    cl,BYTE PTR [eax]
    1861:	05 00 00 00 00       	add    eax,0x0
    1866:	02 01                	add    al,BYTE PTR [ecx]
    1868:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    186b:	00 00                	add    BYTE PTR [eax],al
    186d:	02 02                	add    al,BYTE PTR [edx]
    186f:	07                   	pop    es
    1870:	0e                   	push   cs
    1871:	00 00                	add    BYTE PTR [eax],al
    1873:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1876:	00 00                	add    BYTE PTR [eax],al
    1878:	00 02                	add    BYTE PTR [edx],al
    187a:	34 61                	xor    al,0x61
    187c:	00 00                	add    BYTE PTR [eax],al
    187e:	00 02                	add    BYTE PTR [edx],al
    1880:	04 07                	add    al,0x7
    1882:	32 00                	xor    al,BYTE PTR [eax]
    1884:	00 00                	add    BYTE PTR [eax],al
    1886:	02 08                	add    cl,BYTE PTR [eax]
    1888:	07                   	pop    es
    1889:	28 00                	sub    BYTE PTR [eax],al
    188b:	00 00                	add    BYTE PTR [eax],al
    188d:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1894:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1897:	96                   	xchg   esi,eax
    1898:	00 00                	add    BYTE PTR [eax],al
    189a:	00 02                	add    BYTE PTR [edx],al
    189c:	01 02                	add    DWORD PTR [edx],eax
    189e:	90                   	nop
    189f:	00 00                	add    BYTE PTR [eax],al
    18a1:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    18a8:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    18ab:	00 00                	add    BYTE PTR [eax],al
    18ad:	05 04 95 00 00       	add    eax,0x9504
    18b2:	00 06                	add    BYTE PTR [esi],al
    18b4:	25 00 00 00 02       	and    eax,0x2000000
    18b9:	04 07                	add    al,0x7
    18bb:	2d 00 00 00 02       	sub    eax,0x2000000
    18c0:	04 07                	add    al,0x7
    18c2:	dc 00                	fadd   QWORD PTR [eax]
    18c4:	00 00                	add    BYTE PTR [eax],al
    18c6:	07                   	pop    es
    18c7:	b8 07 00 00 01       	mov    eax,0x1000007
    18cc:	18 3a                	sbb    BYTE PTR [edx],bh
    18ce:	00 00                	add    BYTE PTR [eax],al
    18d0:	00 e0                	add    al,ah
    18d2:	0c 00                	or     al,0x0
    18d4:	30 5e 00             	xor    BYTE PTR [esi+0x0],bl
    18d7:	00 00                	add    BYTE PTR [eax],al
    18d9:	01 9c 0e 01 00 00 08 	add    DWORD PTR [esi+ecx*1+0x8000001],ebx
    18e0:	70 31                	jo     1913 <sysEnter_Vector-0x12e6ed>
    18e2:	00 01                	add    BYTE PTR [ecx],al
    18e4:	18 8f 00 00 00 02    	sbb    BYTE PTR [edi+0x2000000],cl
    18ea:	91                   	xchg   ecx,eax
    18eb:	00 08                	add    BYTE PTR [eax],cl
    18ed:	70 32                	jo     1921 <sysEnter_Vector-0x12e6df>
    18ef:	00 01                	add    BYTE PTR [ecx],al
    18f1:	18 8f 00 00 00 02    	sbb    BYTE PTR [edi+0x2000000],cl
    18f7:	91                   	xchg   ecx,eax
    18f8:	04 09                	add    al,0x9
    18fa:	73 31                	jae    192d <sysEnter_Vector-0x12e6d3>
    18fc:	00 01                	add    BYTE PTR [ecx],al
    18fe:	1a 0e                	sbb    cl,BYTE PTR [esi]
    1900:	01 00                	add    DWORD PTR [eax],eax
    1902:	00 01                	add    BYTE PTR [ecx],al
    1904:	53                   	push   ebx
    1905:	09 73 32             	or     DWORD PTR [ebx+0x32],esi
    1908:	00 01                	add    BYTE PTR [ecx],al
    190a:	1b 0e                	sbb    ecx,DWORD PTR [esi]
    190c:	01 00                	add    DWORD PTR [eax],eax
    190e:	00 01                	add    BYTE PTR [ecx],al
    1910:	56                   	push   esi
    1911:	09 63 31             	or     DWORD PTR [ebx+0x31],esp
    1914:	00 01                	add    BYTE PTR [ecx],al
    1916:	1c 48                	sbb    al,0x48
    1918:	00 00                	add    BYTE PTR [eax],al
    191a:	00 02                	add    BYTE PTR [edx],al
    191c:	91                   	xchg   ecx,eax
    191d:	6f                   	outs   dx,DWORD PTR ds:[esi]
    191e:	09 63 32             	or     DWORD PTR [ebx+0x32],esp
    1921:	00 01                	add    BYTE PTR [ecx],al
    1923:	1c 48                	sbb    al,0x48
    1925:	00 00                	add    BYTE PTR [eax],al
    1927:	00 02                	add    BYTE PTR [edx],al
    1929:	91                   	xchg   ecx,eax
    192a:	6e                   	outs   dx,BYTE PTR ds:[esi]
    192b:	00 05 04 14 01 00    	add    BYTE PTR ds:0x11404,al
    1931:	00 06                	add    BYTE PTR [esi],al
    1933:	48                   	dec    eax
    1934:	00 00                	add    BYTE PTR [eax],al
    1936:	00 0a                	add    BYTE PTR [edx],cl
    1938:	3f                   	aas    
    1939:	00 00                	add    BYTE PTR [eax],al
    193b:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    193e:	56                   	push   esi
    193f:	00 00                	add    BYTE PTR [eax],al
    1941:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
    1947:	30 0a                	xor    BYTE PTR [edx],cl
    1949:	aa                   	stos   BYTE PTR es:[edi],al
    194a:	00 00                	add    BYTE PTR [eax],al
    194c:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    194f:	56                   	push   esi
    1950:	00 00                	add    BYTE PTR [eax],al
    1952:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
    1958:	30 0a                	xor    BYTE PTR [edx],cl
    195a:	56                   	push   esi
    195b:	01 00                	add    DWORD PTR [eax],eax
    195d:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    1964:	05 03 70 34 00       	add    eax,0x347003
    1969:	30 0a                	xor    BYTE PTR [edx],cl
    196b:	48                   	dec    eax
    196c:	00 00                	add    BYTE PTR [eax],al
    196e:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    1974:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
    197a:	30 00                	xor    BYTE PTR [eax],al
    197c:	7d 01                	jge    197f <sysEnter_Vector-0x12e681>
    197e:	00 00                	add    BYTE PTR [eax],al
    1980:	04 00                	add    al,0x0
    1982:	1c 09                	sbb    al,0x9
    1984:	00 00                	add    BYTE PTR [eax],al
    1986:	04 01                	add    al,0x1
    1988:	ef                   	out    dx,eax
    1989:	00 00                	add    BYTE PTR [eax],al
    198b:	00 0c e9             	add    BYTE PTR [ecx+ebp*8],cl
    198e:	07                   	pop    es
    198f:	00 00                	add    BYTE PTR [eax],al
    1991:	6d                   	ins    DWORD PTR es:[edi],dx
    1992:	00 00                	add    BYTE PTR [eax],al
    1994:	00 40 0d             	add    BYTE PTR [eax+0xd],al
    1997:	00 30                	add    BYTE PTR [eax],dh
    1999:	87 00                	xchg   DWORD PTR [eax],eax
    199b:	00 00                	add    BYTE PTR [eax],al
    199d:	b7 0a                	mov    bh,0xa
    199f:	00 00                	add    BYTE PTR [eax],al
    19a1:	02 01                	add    al,BYTE PTR [ecx]
    19a3:	06                   	push   es
    19a4:	58                   	pop    eax
    19a5:	00 00                	add    BYTE PTR [eax],al
    19a7:	00 02                	add    BYTE PTR [edx],al
    19a9:	01 06                	add    DWORD PTR [esi],eax
    19ab:	51                   	push   ecx
    19ac:	00 00                	add    BYTE PTR [eax],al
    19ae:	00 02                	add    BYTE PTR [edx],al
    19b0:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    19b6:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    19bd:	02 08                	add    cl,BYTE PTR [eax]
    19bf:	05 00 00 00 00       	add    eax,0x0
    19c4:	02 01                	add    al,BYTE PTR [ecx]
    19c6:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    19c9:	00 00                	add    BYTE PTR [eax],al
    19cb:	02 02                	add    al,BYTE PTR [edx]
    19cd:	07                   	pop    es
    19ce:	0e                   	push   cs
    19cf:	00 00                	add    BYTE PTR [eax],al
    19d1:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    19d4:	00 00                	add    BYTE PTR [eax],al
    19d6:	00 02                	add    BYTE PTR [edx],al
    19d8:	34 61                	xor    al,0x61
    19da:	00 00                	add    BYTE PTR [eax],al
    19dc:	00 02                	add    BYTE PTR [edx],al
    19de:	04 07                	add    al,0x7
    19e0:	32 00                	xor    al,BYTE PTR [eax]
    19e2:	00 00                	add    BYTE PTR [eax],al
    19e4:	02 08                	add    cl,BYTE PTR [eax]
    19e6:	07                   	pop    es
    19e7:	28 00                	sub    BYTE PTR [eax],al
    19e9:	00 00                	add    BYTE PTR [eax],al
    19eb:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    19f2:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    19f5:	96                   	xchg   esi,eax
    19f6:	00 00                	add    BYTE PTR [eax],al
    19f8:	00 02                	add    BYTE PTR [edx],al
    19fa:	01 02                	add    DWORD PTR [edx],eax
    19fc:	90                   	nop
    19fd:	00 00                	add    BYTE PTR [eax],al
    19ff:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1a06:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1a09:	00 00                	add    BYTE PTR [eax],al
    1a0b:	05 04 95 00 00       	add    eax,0x9504
    1a10:	00 06                	add    BYTE PTR [esi],al
    1a12:	25 00 00 00 02       	and    eax,0x2000000
    1a17:	04 07                	add    al,0x7
    1a19:	2d 00 00 00 02       	sub    eax,0x2000000
    1a1e:	04 07                	add    al,0x7
    1a20:	dc 00                	fadd   QWORD PTR [eax]
    1a22:	00 00                	add    BYTE PTR [eax],al
    1a24:	05 04 25 00 00       	add    eax,0x2504
    1a29:	00 07                	add    BYTE PTR [edi],al
    1a2b:	d4 07                	aam    0x7
    1a2d:	00 00                	add    BYTE PTR [eax],al
    1a2f:	01 04 a8             	add    DWORD PTR [eax+ebp*4],eax
    1a32:	00 00                	add    BYTE PTR [eax],al
    1a34:	00 40 0d             	add    BYTE PTR [eax+0xd],al
    1a37:	00 30                	add    BYTE PTR [eax],dh
    1a39:	40                   	inc    eax
    1a3a:	00 00                	add    BYTE PTR [eax],al
    1a3c:	00 01                	add    BYTE PTR [ecx],al
    1a3e:	9c                   	pushf  
    1a3f:	ee                   	out    dx,al
    1a40:	00 00                	add    BYTE PTR [eax],al
    1a42:	00 08                	add    BYTE PTR [eax],cl
    1a44:	73 31                	jae    1a77 <sysEnter_Vector-0x12e589>
    1a46:	00 01                	add    BYTE PTR [ecx],al
    1a48:	04 a8                	add    al,0xa8
    1a4a:	00 00                	add    BYTE PTR [eax],al
    1a4c:	00 02                	add    BYTE PTR [edx],al
    1a4e:	91                   	xchg   ecx,eax
    1a4f:	00 08                	add    BYTE PTR [eax],cl
    1a51:	73 32                	jae    1a85 <sysEnter_Vector-0x12e57b>
    1a53:	00 01                	add    BYTE PTR [ecx],al
    1a55:	04 8f                	add    al,0x8f
    1a57:	00 00                	add    BYTE PTR [eax],al
    1a59:	00 02                	add    BYTE PTR [edx],al
    1a5b:	91                   	xchg   ecx,eax
    1a5c:	04 09                	add    al,0x9
    1a5e:	73 00                	jae    1a60 <sysEnter_Vector-0x12e5a0>
    1a60:	01 06                	add    DWORD PTR [esi],eax
    1a62:	a8 00                	test   al,0x0
    1a64:	00 00                	add    BYTE PTR [eax],al
    1a66:	02 91 74 00 07 e1    	add    dl,BYTE PTR [ecx-0x1ef8ff8c]
    1a6c:	07                   	pop    es
    1a6d:	00 00                	add    BYTE PTR [eax],al
    1a6f:	01 0e                	add    DWORD PTR [esi],ecx
    1a71:	a8 00                	test   al,0x0
    1a73:	00 00                	add    BYTE PTR [eax],al
    1a75:	80 0d 00 30 47 00 00 	or     BYTE PTR ds:0x473000,0x0
    1a7c:	00 01                	add    BYTE PTR [ecx],al
    1a7e:	9c                   	pushf  
    1a7f:	3c 01                	cmp    al,0x1
    1a81:	00 00                	add    BYTE PTR [eax],al
    1a83:	08 73 31             	or     BYTE PTR [ebx+0x31],dh
    1a86:	00 01                	add    BYTE PTR [ecx],al
    1a88:	0e                   	push   cs
    1a89:	a8 00                	test   al,0x0
    1a8b:	00 00                	add    BYTE PTR [eax],al
    1a8d:	02 91 00 08 73 32    	add    dl,BYTE PTR [ecx+0x32730800]
    1a93:	00 01                	add    BYTE PTR [ecx],al
    1a95:	0e                   	push   cs
    1a96:	8f 00                	pop    DWORD PTR [eax]
    1a98:	00 00                	add    BYTE PTR [eax],al
    1a9a:	02 91 04 0a db 07    	add    dl,BYTE PTR [ecx+0x7db0a04]
    1aa0:	00 00                	add    BYTE PTR [eax],al
    1aa2:	01 0e                	add    DWORD PTR [esi],ecx
    1aa4:	61                   	popa   
    1aa5:	00 00                	add    BYTE PTR [eax],al
    1aa7:	00 02                	add    BYTE PTR [edx],al
    1aa9:	91                   	xchg   ecx,eax
    1aaa:	08 09                	or     BYTE PTR [ecx],cl
    1aac:	73 00                	jae    1aae <sysEnter_Vector-0x12e552>
    1aae:	01 10                	add    DWORD PTR [eax],edx
    1ab0:	a8 00                	test   al,0x0
    1ab2:	00 00                	add    BYTE PTR [eax],al
    1ab4:	02 91 74 00 0b 3f    	add    dl,BYTE PTR [ecx+0x3f0b0074]
    1aba:	00 00                	add    BYTE PTR [eax],al
    1abc:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    1abf:	56                   	push   esi
    1ac0:	00 00                	add    BYTE PTR [eax],al
    1ac2:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
    1ac8:	30 0b                	xor    BYTE PTR [ebx],cl
    1aca:	aa                   	stos   BYTE PTR es:[edi],al
    1acb:	00 00                	add    BYTE PTR [eax],al
    1acd:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1ad0:	56                   	push   esi
    1ad1:	00 00                	add    BYTE PTR [eax],al
    1ad3:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
    1ad9:	30 0b                	xor    BYTE PTR [ebx],cl
    1adb:	56                   	push   esi
    1adc:	01 00                	add    DWORD PTR [eax],eax
    1ade:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    1ae5:	05 03 70 34 00       	add    eax,0x347003
    1aea:	30 0b                	xor    BYTE PTR [ebx],cl
    1aec:	48                   	dec    eax
    1aed:	00 00                	add    BYTE PTR [eax],al
    1aef:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    1af5:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
    1afb:	30 00                	xor    BYTE PTR [eax],al
    1afd:	98                   	cwde   
    1afe:	00 00                	add    BYTE PTR [eax],al
    1b00:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1b03:	bd 09 00 00 04       	mov    ebp,0x4000009
    1b08:	01 ef                	add    edi,ebp
    1b0a:	00 00                	add    BYTE PTR [eax],al
    1b0c:	00 0c 05 08 00 00 6d 	add    BYTE PTR [eax*1+0x6d000008],cl
    1b13:	00 00                	add    BYTE PTR [eax],al
    1b15:	00 c8                	add    al,cl
    1b17:	0d 00 30 31 00       	or     eax,0x313000
    1b1c:	00 00                	add    BYTE PTR [eax],al
    1b1e:	93                   	xchg   ebx,eax
    1b1f:	0b 00                	or     eax,DWORD PTR [eax]
    1b21:	00 02                	add    BYTE PTR [edx],al
    1b23:	04 05                	add    al,0x5
    1b25:	69 6e 74 00 03 78 03 	imul   ebp,DWORD PTR [esi+0x74],0x3780300
    1b2c:	00 00                	add    BYTE PTR [eax],al
    1b2e:	02 d8                	add    bl,al
    1b30:	37                   	aaa    
    1b31:	00 00                	add    BYTE PTR [eax],al
    1b33:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    1b36:	07                   	pop    es
    1b37:	32 00                	xor    al,BYTE PTR [eax]
    1b39:	00 00                	add    BYTE PTR [eax],al
    1b3b:	04 04                	add    al,0x4
    1b3d:	05 05 00 00 00       	add    eax,0x5
    1b42:	04 08                	add    al,0x8
    1b44:	05 00 00 00 00       	add    eax,0x0
    1b49:	04 0c                	add    al,0xc
    1b4b:	04 96                	add    al,0x96
    1b4d:	00 00                	add    BYTE PTR [eax],al
    1b4f:	00 05 fe 07 00 00    	add    BYTE PTR ds:0x7fe,al
    1b55:	01 03                	add    DWORD PTR [ebx],eax
    1b57:	2c 00                	sub    al,0x0
    1b59:	00 00                	add    BYTE PTR [eax],al
    1b5b:	c8 0d 00 30          	enter  0xd,0x30
    1b5f:	31 00                	xor    DWORD PTR [eax],eax
    1b61:	00 00                	add    BYTE PTR [eax],al
    1b63:	01 9c 89 00 00 00 06 	add    DWORD PTR [ecx+ecx*4+0x6000000],ebx
    1b6a:	73 74                	jae    1be0 <sysEnter_Vector-0x12e420>
    1b6c:	72 00                	jb     1b6e <sysEnter_Vector-0x12e492>
    1b6e:	01 03                	add    DWORD PTR [ebx],eax
    1b70:	89 00                	mov    DWORD PTR [eax],eax
    1b72:	00 00                	add    BYTE PTR [eax],al
    1b74:	02 91 00 07 72 65    	add    dl,BYTE PTR [ecx+0x65720700]
    1b7a:	74 00                	je     1b7c <sysEnter_Vector-0x12e484>
    1b7c:	01 04 2c             	add    DWORD PTR [esp+ebp*1],eax
    1b7f:	00 00                	add    BYTE PTR [eax],al
    1b81:	00 02                	add    BYTE PTR [edx],al
    1b83:	91                   	xchg   ecx,eax
    1b84:	74 00                	je     1b86 <sysEnter_Vector-0x12e47a>
    1b86:	08 04 96             	or     BYTE PTR [esi+edx*4],al
    1b89:	00 00                	add    BYTE PTR [eax],al
    1b8b:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1b8e:	06                   	push   es
    1b8f:	58                   	pop    eax
    1b90:	00 00                	add    BYTE PTR [eax],al
    1b92:	00 09                	add    BYTE PTR [ecx],cl
    1b94:	8f 00                	pop    DWORD PTR [eax]
    1b96:	00 00                	add    BYTE PTR [eax],al
    1b98:	00 a2 00 00 00 04    	add    BYTE PTR [edx+0x4000000],ah
    1b9e:	00 3e                	add    BYTE PTR [esi],bh
    1ba0:	0a 00                	or     al,BYTE PTR [eax]
    1ba2:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1ba5:	ef                   	out    dx,eax
    1ba6:	00 00                	add    BYTE PTR [eax],al
    1ba8:	00 0c 22             	add    BYTE PTR [edx+eiz*1],cl
    1bab:	08 00                	or     BYTE PTR [eax],al
    1bad:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1bb0:	00 00                	add    BYTE PTR [eax],al
    1bb2:	fc                   	cld    
    1bb3:	0d 00 30 67 00       	or     eax,0x673000
    1bb8:	00 00                	add    BYTE PTR [eax],al
    1bba:	24 0c                	and    al,0xc
    1bbc:	00 00                	add    BYTE PTR [eax],al
    1bbe:	02 04 05 69 6e 74 00 	add    al,BYTE PTR [eax*1+0x746e69]
    1bc5:	03 78 03             	add    edi,DWORD PTR [eax+0x3]
    1bc8:	00 00                	add    BYTE PTR [eax],al
    1bca:	02 d8                	add    bl,al
    1bcc:	37                   	aaa    
    1bcd:	00 00                	add    BYTE PTR [eax],al
    1bcf:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    1bd2:	07                   	pop    es
    1bd3:	32 00                	xor    al,BYTE PTR [eax]
    1bd5:	00 00                	add    BYTE PTR [eax],al
    1bd7:	04 04                	add    al,0x4
    1bd9:	05 05 00 00 00       	add    eax,0x5
    1bde:	04 08                	add    al,0x8
    1be0:	05 00 00 00 00       	add    eax,0x0
    1be5:	04 0c                	add    al,0xc
    1be7:	04 96                	add    al,0x96
    1be9:	00 00                	add    BYTE PTR [eax],al
    1beb:	00 05 1a 08 00 00    	add    BYTE PTR ds:0x81a,al
    1bf1:	01 0c 25 00 00 00 fc 	add    DWORD PTR [eiz*1-0x4000000],ecx
    1bf8:	0d 00 30 67 00       	or     eax,0x673000
    1bfd:	00 00                	add    BYTE PTR [eax],al
    1bff:	01 9c 93 00 00 00 06 	add    DWORD PTR [ebx+edx*4+0x6000000],ebx
    1c06:	73 31                	jae    1c39 <sysEnter_Vector-0x12e3c7>
    1c08:	00 01                	add    BYTE PTR [ecx],al
    1c0a:	0c 93                	or     al,0x93
    1c0c:	00 00                	add    BYTE PTR [eax],al
    1c0e:	00 02                	add    BYTE PTR [edx],al
    1c10:	91                   	xchg   ecx,eax
    1c11:	00 06                	add    BYTE PTR [esi],al
    1c13:	73 32                	jae    1c47 <sysEnter_Vector-0x12e3b9>
    1c15:	00 01                	add    BYTE PTR [ecx],al
    1c17:	0c 93                	or     al,0x93
    1c19:	00 00                	add    BYTE PTR [eax],al
    1c1b:	00 02                	add    BYTE PTR [edx],al
    1c1d:	91                   	xchg   ecx,eax
    1c1e:	04 06                	add    al,0x6
    1c20:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1c21:	00 01                	add    BYTE PTR [ecx],al
    1c23:	0c 2c                	or     al,0x2c
    1c25:	00 00                	add    BYTE PTR [eax],al
    1c27:	00 02                	add    BYTE PTR [edx],al
    1c29:	91                   	xchg   ecx,eax
    1c2a:	08 00                	or     BYTE PTR [eax],al
    1c2c:	07                   	pop    es
    1c2d:	04 a0                	add    al,0xa0
    1c2f:	00 00                	add    BYTE PTR [eax],al
    1c31:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1c34:	06                   	push   es
    1c35:	58                   	pop    eax
    1c36:	00 00                	add    BYTE PTR [eax],al
    1c38:	00 08                	add    BYTE PTR [eax],cl
    1c3a:	99                   	cdq    
    1c3b:	00 00                	add    BYTE PTR [eax],al
    1c3d:	00 00                	add    BYTE PTR [eax],al
    1c3f:	b4 00                	mov    ah,0x0
    1c41:	00 00                	add    BYTE PTR [eax],al
    1c43:	04 00                	add    al,0x0
    1c45:	b0 0a                	mov    al,0xa
    1c47:	00 00                	add    BYTE PTR [eax],al
    1c49:	04 01                	add    al,0x1
    1c4b:	ef                   	out    dx,eax
    1c4c:	00 00                	add    BYTE PTR [eax],al
    1c4e:	00 0c 38             	add    BYTE PTR [eax+edi*1],cl
    1c51:	08 00                	or     BYTE PTR [eax],al
    1c53:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1c56:	00 00                	add    BYTE PTR [eax],al
    1c58:	64                   	fs
    1c59:	0e                   	push   cs
    1c5a:	00 30                	add    BYTE PTR [eax],dh
    1c5c:	60                   	pusha  
    1c5d:	00 00                	add    BYTE PTR [eax],al
    1c5f:	00 cd                	add    ch,cl
    1c61:	0c 00                	or     al,0x0
    1c63:	00 02                	add    BYTE PTR [edx],al
    1c65:	04 05                	add    al,0x5
    1c67:	69 6e 74 00 03 78 03 	imul   ebp,DWORD PTR [esi+0x74],0x3780300
    1c6e:	00 00                	add    BYTE PTR [eax],al
    1c70:	02 d8                	add    bl,al
    1c72:	37                   	aaa    
    1c73:	00 00                	add    BYTE PTR [eax],al
    1c75:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    1c78:	07                   	pop    es
    1c79:	32 00                	xor    al,BYTE PTR [eax]
    1c7b:	00 00                	add    BYTE PTR [eax],al
    1c7d:	04 04                	add    al,0x4
    1c7f:	05 05 00 00 00       	add    eax,0x5
    1c84:	04 08                	add    al,0x8
    1c86:	05 00 00 00 00       	add    eax,0x0
    1c8b:	04 0c                	add    al,0xc
    1c8d:	04 96                	add    al,0x96
    1c8f:	00 00                	add    BYTE PTR [eax],al
    1c91:	00 05 4e 08 00 00    	add    BYTE PTR ds:0x84e,al
    1c97:	01 0d 9f 00 00 00    	add    DWORD PTR ds:0x9f,ecx
    1c9d:	64                   	fs
    1c9e:	0e                   	push   cs
    1c9f:	00 30                	add    BYTE PTR [eax],dh
    1ca1:	60                   	pusha  
    1ca2:	00 00                	add    BYTE PTR [eax],al
    1ca4:	00 01                	add    BYTE PTR [ecx],al
    1ca6:	9c                   	pushf  
    1ca7:	9f                   	lahf   
    1ca8:	00 00                	add    BYTE PTR [eax],al
    1caa:	00 06                	add    BYTE PTR [esi],al
    1cac:	73 31                	jae    1cdf <sysEnter_Vector-0x12e321>
    1cae:	00 01                	add    BYTE PTR [ecx],al
    1cb0:	0d 9f 00 00 00       	or     eax,0x9f
    1cb5:	02 91 00 06 73 32    	add    dl,BYTE PTR [ecx+0x32730600]
    1cbb:	00 01                	add    BYTE PTR [ecx],al
    1cbd:	0d ac 00 00 00       	or     eax,0xac
    1cc2:	02 91 04 06 6e 00    	add    dl,BYTE PTR [ecx+0x6e0604]
    1cc8:	01 0d 2c 00 00 00    	add    DWORD PTR ds:0x2c,ecx
    1cce:	02 91 08 07 73 00    	add    dl,BYTE PTR [ecx+0x730708]
    1cd4:	01 0f                	add    DWORD PTR [edi],ecx
    1cd6:	9f                   	lahf   
    1cd7:	00 00                	add    BYTE PTR [eax],al
    1cd9:	00 02                	add    BYTE PTR [edx],al
    1cdb:	91                   	xchg   ecx,eax
    1cdc:	74 00                	je     1cde <sysEnter_Vector-0x12e322>
    1cde:	08 04 a5 00 00 00 04 	or     BYTE PTR [eiz*4+0x4000000],al
    1ce5:	01 06                	add    DWORD PTR [esi],eax
    1ce7:	58                   	pop    eax
    1ce8:	00 00                	add    BYTE PTR [eax],al
    1cea:	00 08                	add    BYTE PTR [eax],cl
    1cec:	04 b2                	add    al,0xb2
    1cee:	00 00                	add    BYTE PTR [eax],al
    1cf0:	00 09                	add    BYTE PTR [ecx],cl
    1cf2:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
    1cf3:	00 00                	add    BYTE PTR [eax],al
    1cf5:	00 00                	add    BYTE PTR [eax],al
    1cf7:	8c 01                	mov    WORD PTR [ecx],es
    1cf9:	00 00                	add    BYTE PTR [eax],al
    1cfb:	04 00                	add    al,0x0
    1cfd:	31 0b                	xor    DWORD PTR [ebx],ecx
    1cff:	00 00                	add    BYTE PTR [eax],al
    1d01:	04 01                	add    al,0x1
    1d03:	ef                   	out    dx,eax
    1d04:	00 00                	add    BYTE PTR [eax],al
    1d06:	00 0c 56             	add    BYTE PTR [esi+edx*2],cl
    1d09:	08 00                	or     BYTE PTR [eax],al
    1d0b:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1d0e:	00 00                	add    BYTE PTR [eax],al
    1d10:	c4 0e                	les    ecx,FWORD PTR [esi]
    1d12:	00 30                	add    BYTE PTR [eax],dh
    1d14:	7d 01                	jge    1d17 <sysEnter_Vector-0x12e2e9>
    1d16:	00 00                	add    BYTE PTR [eax],al
    1d18:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1d19:	0d 00 00 02 01       	or     eax,0x1020000
    1d1e:	06                   	push   es
    1d1f:	58                   	pop    eax
    1d20:	00 00                	add    BYTE PTR [eax],al
    1d22:	00 02                	add    BYTE PTR [edx],al
    1d24:	01 06                	add    DWORD PTR [esi],eax
    1d26:	51                   	push   ecx
    1d27:	00 00                	add    BYTE PTR [eax],al
    1d29:	00 02                	add    BYTE PTR [edx],al
    1d2b:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1d31:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1d38:	02 08                	add    cl,BYTE PTR [eax]
    1d3a:	05 00 00 00 00       	add    eax,0x0
    1d3f:	02 01                	add    al,BYTE PTR [ecx]
    1d41:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1d44:	00 00                	add    BYTE PTR [eax],al
    1d46:	02 02                	add    al,BYTE PTR [edx]
    1d48:	07                   	pop    es
    1d49:	0e                   	push   cs
    1d4a:	00 00                	add    BYTE PTR [eax],al
    1d4c:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1d4f:	00 00                	add    BYTE PTR [eax],al
    1d51:	00 02                	add    BYTE PTR [edx],al
    1d53:	34 61                	xor    al,0x61
    1d55:	00 00                	add    BYTE PTR [eax],al
    1d57:	00 02                	add    BYTE PTR [edx],al
    1d59:	04 07                	add    al,0x7
    1d5b:	32 00                	xor    al,BYTE PTR [eax]
    1d5d:	00 00                	add    BYTE PTR [eax],al
    1d5f:	02 08                	add    cl,BYTE PTR [eax]
    1d61:	07                   	pop    es
    1d62:	28 00                	sub    BYTE PTR [eax],al
    1d64:	00 00                	add    BYTE PTR [eax],al
    1d66:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1d6d:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1d70:	96                   	xchg   esi,eax
    1d71:	00 00                	add    BYTE PTR [eax],al
    1d73:	00 02                	add    BYTE PTR [edx],al
    1d75:	01 02                	add    DWORD PTR [edx],eax
    1d77:	90                   	nop
    1d78:	00 00                	add    BYTE PTR [eax],al
    1d7a:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1d81:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1d84:	00 00                	add    BYTE PTR [eax],al
    1d86:	05 04 95 00 00       	add    eax,0x9504
    1d8b:	00 06                	add    BYTE PTR [esi],al
    1d8d:	25 00 00 00 02       	and    eax,0x2000000
    1d92:	04 07                	add    al,0x7
    1d94:	2d 00 00 00 02       	sub    eax,0x2000000
    1d99:	04 07                	add    al,0x7
    1d9b:	dc 00                	fadd   QWORD PTR [eax]
    1d9d:	00 00                	add    BYTE PTR [eax],al
    1d9f:	05 04 25 00 00       	add    eax,0x2504
    1da4:	00 07                	add    BYTE PTR [edi],al
    1da6:	79 08                	jns    1db0 <sysEnter_Vector-0x12e250>
    1da8:	00 00                	add    BYTE PTR [eax],al
    1daa:	01 3b                	add    DWORD PTR [ebx],edi
    1dac:	9a 00 00 00 c4 0e 00 	call   0xe:0xc4000000
    1db3:	30 7d 01             	xor    BYTE PTR [ebp+0x1],bh
    1db6:	00 00                	add    BYTE PTR [eax],al
    1db8:	01 9c 45 01 00 00 08 	add    DWORD PTR [ebp+eax*2+0x8000001],ebx
    1dbf:	88 08                	mov    BYTE PTR [eax],cl
    1dc1:	00 00                	add    BYTE PTR [eax],al
    1dc3:	01 3b                	add    DWORD PTR [ebx],edi
    1dc5:	8f 00                	pop    DWORD PTR [eax]
    1dc7:	00 00                	add    BYTE PTR [eax],al
    1dc9:	02 91 00 08 81 08    	add    dl,BYTE PTR [ecx+0x8810800]
    1dcf:	00 00                	add    BYTE PTR [eax],al
    1dd1:	01 3b                	add    DWORD PTR [ebx],edi
    1dd3:	45                   	inc    ebp
    1dd4:	01 00                	add    DWORD PTR [eax],eax
    1dd6:	00 02                	add    BYTE PTR [edx],al
    1dd8:	91                   	xchg   ecx,eax
    1dd9:	04 08                	add    al,0x8
    1ddb:	8d 08                	lea    ecx,[eax]
    1ddd:	00 00                	add    BYTE PTR [eax],al
    1ddf:	01 3b                	add    DWORD PTR [ebx],edi
    1de1:	3a 00                	cmp    al,BYTE PTR [eax]
    1de3:	00 00                	add    BYTE PTR [eax],al
    1de5:	02 91 08 09 73 00    	add    dl,BYTE PTR [ecx+0x730908]
    1deb:	01 3d 8f 00 00 00    	add    DWORD PTR ds:0x8f,edi
    1df1:	01 56 09             	add    DWORD PTR [esi+0x9],edx
    1df4:	61                   	popa   
    1df5:	63 63 00             	arpl   WORD PTR [ebx+0x0],sp
    1df8:	01 3e                	add    DWORD PTR [esi],edi
    1dfa:	9a 00 00 00 01 57 09 	call   0x957:0x1000000
    1e01:	63 00                	arpl   WORD PTR [eax],ax
    1e03:	01 3f                	add    DWORD PTR [edi],edi
    1e05:	3a 00                	cmp    al,BYTE PTR [eax]
    1e07:	00 00                	add    BYTE PTR [eax],al
    1e09:	01 53 0a             	add    DWORD PTR [ebx+0xa],edx
    1e0c:	6b 08 00             	imul   ecx,DWORD PTR [eax],0x0
    1e0f:	00 01                	add    BYTE PTR [ecx],al
    1e11:	40                   	inc    eax
    1e12:	9a 00 00 00 0b 6e 65 	call   0x656e:0xb000000
    1e19:	67 00 01             	add    BYTE PTR [bx+di],al
    1e1c:	41                   	inc    ecx
    1e1d:	3a 00                	cmp    al,BYTE PTR [eax]
    1e1f:	00 00                	add    BYTE PTR [eax],al
    1e21:	09 61 6e             	or     DWORD PTR [ecx+0x6e],esp
    1e24:	79 00                	jns    1e26 <sysEnter_Vector-0x12e1da>
    1e26:	01 41 3a             	add    DWORD PTR [ecx+0x3a],eax
    1e29:	00 00                	add    BYTE PTR [eax],al
    1e2b:	00 01                	add    BYTE PTR [ecx],al
    1e2d:	51                   	push   ecx
    1e2e:	0c 72                	or     al,0x72
    1e30:	08 00                	or     BYTE PTR [eax],al
    1e32:	00 01                	add    BYTE PTR [ecx],al
    1e34:	41                   	inc    ecx
    1e35:	3a 00                	cmp    al,BYTE PTR [eax]
    1e37:	00 00                	add    BYTE PTR [eax],al
    1e39:	01 52 00             	add    DWORD PTR [edx+0x0],edx
    1e3c:	05 04 a8 00 00       	add    eax,0xa804
    1e41:	00 0d 3f 00 00 00    	add    BYTE PTR ds:0x3f,cl
    1e47:	04 33                	add    al,0x33
    1e49:	56                   	push   esi
    1e4a:	00 00                	add    BYTE PTR [eax],al
    1e4c:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
    1e52:	30 0d aa 00 00 00    	xor    BYTE PTR ds:0xaa,cl
    1e58:	04 34                	add    al,0x34
    1e5a:	56                   	push   esi
    1e5b:	00 00                	add    BYTE PTR [eax],al
    1e5d:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
    1e63:	30 0d 56 01 00 00    	xor    BYTE PTR ds:0x156,cl
    1e69:	04 35                	add    al,0x35
    1e6b:	56                   	push   esi
    1e6c:	00 00                	add    BYTE PTR [eax],al
    1e6e:	00 05 03 70 34 00    	add    BYTE PTR ds:0x347003,al
    1e74:	30 0d 48 00 00 00    	xor    BYTE PTR ds:0x48,cl
    1e7a:	05 36 84 00 00       	add    eax,0x8436
    1e7f:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
    1e85:	30 00                	xor    BYTE PTR [eax],al
    1e87:	6c                   	ins    BYTE PTR es:[edi],dx
    1e88:	00 00                	add    BYTE PTR [eax],al
    1e8a:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1e8d:	ec                   	in     al,dx
    1e8e:	0b 00                	or     eax,DWORD PTR [eax]
    1e90:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1e93:	ef                   	out    dx,eax
    1e94:	00 00                	add    BYTE PTR [eax],al
    1e96:	00 0c 92             	add    BYTE PTR [edx+edx*4],cl
    1e99:	08 00                	or     BYTE PTR [eax],al
    1e9b:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1e9e:	00 00                	add    BYTE PTR [eax],al
    1ea0:	44                   	inc    esp
    1ea1:	10 00                	adc    BYTE PTR [eax],al
    1ea3:	30 1d 00 00 00 c5    	xor    BYTE PTR ds:0xc5000000,bl
    1ea9:	0e                   	push   cs
    1eaa:	00 00                	add    BYTE PTR [eax],al
    1eac:	02 a9 08 00 00 01    	add    ch,BYTE PTR [ecx+0x1000008]
    1eb2:	01 5b 00             	add    DWORD PTR [ebx+0x0],ebx
    1eb5:	00 00                	add    BYTE PTR [eax],al
    1eb7:	44                   	inc    esp
    1eb8:	10 00                	adc    BYTE PTR [eax],al
    1eba:	30 1d 00 00 00 01    	xor    BYTE PTR ds:0x1000000,bl
    1ec0:	9c                   	pushf  
    1ec1:	5b                   	pop    ebx
    1ec2:	00 00                	add    BYTE PTR [eax],al
    1ec4:	00 03                	add    BYTE PTR [ebx],al
    1ec6:	76 61                	jbe    1f29 <sysEnter_Vector-0x12e0d7>
    1ec8:	6c                   	ins    BYTE PTR es:[edi],dx
    1ec9:	00 01                	add    BYTE PTR [ecx],al
    1ecb:	01 5b 00             	add    DWORD PTR [ebx+0x0],ebx
    1ece:	00 00                	add    BYTE PTR [eax],al
    1ed0:	02 91 00 03 63 6e    	add    dl,BYTE PTR [ecx+0x6e630300]
    1ed6:	74 00                	je     1ed8 <sysEnter_Vector-0x12e128>
    1ed8:	01 01                	add    DWORD PTR [ecx],eax
    1eda:	68 00 00 00 02       	push   0x2000000
    1edf:	91                   	xchg   ecx,eax
    1ee0:	04 00                	add    al,0x0
    1ee2:	04 04                	add    al,0x4
    1ee4:	61                   	popa   
    1ee5:	00 00                	add    BYTE PTR [eax],al
    1ee7:	00 05 01 06 58 00    	add    BYTE PTR ds:0x580601,al
    1eed:	00 00                	add    BYTE PTR [eax],al
    1eef:	06                   	push   es
    1ef0:	04 05                	add    al,0x5
    1ef2:	69 6e 74 00 00 8a 01 	imul   ebp,DWORD PTR [esi+0x74],0x18a0000
    1ef9:	00 00                	add    BYTE PTR [eax],al
    1efb:	04 00                	add    al,0x0
    1efd:	4a                   	dec    edx
    1efe:	0c 00                	or     al,0x0
    1f00:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1f03:	ef                   	out    dx,eax
    1f04:	00 00                	add    BYTE PTR [eax],al
    1f06:	00 0c b1             	add    BYTE PTR [ecx+esi*4],cl
    1f09:	08 00                	or     BYTE PTR [eax],al
    1f0b:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1f0e:	00 00                	add    BYTE PTR [eax],al
    1f10:	64 10 00             	adc    BYTE PTR fs:[eax],al
    1f13:	30 9c 01 00 00 0c 0f 	xor    BYTE PTR [ecx+eax*1+0xf0c0000],bl
    1f1a:	00 00                	add    BYTE PTR [eax],al
    1f1c:	02 01                	add    al,BYTE PTR [ecx]
    1f1e:	06                   	push   es
    1f1f:	58                   	pop    eax
    1f20:	00 00                	add    BYTE PTR [eax],al
    1f22:	00 02                	add    BYTE PTR [edx],al
    1f24:	01 06                	add    DWORD PTR [esi],eax
    1f26:	51                   	push   ecx
    1f27:	00 00                	add    BYTE PTR [eax],al
    1f29:	00 02                	add    BYTE PTR [edx],al
    1f2b:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1f31:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1f38:	02 08                	add    cl,BYTE PTR [eax]
    1f3a:	05 00 00 00 00       	add    eax,0x0
    1f3f:	02 01                	add    al,BYTE PTR [ecx]
    1f41:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1f44:	00 00                	add    BYTE PTR [eax],al
    1f46:	02 02                	add    al,BYTE PTR [edx]
    1f48:	07                   	pop    es
    1f49:	0e                   	push   cs
    1f4a:	00 00                	add    BYTE PTR [eax],al
    1f4c:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1f4f:	00 00                	add    BYTE PTR [eax],al
    1f51:	00 02                	add    BYTE PTR [edx],al
    1f53:	34 61                	xor    al,0x61
    1f55:	00 00                	add    BYTE PTR [eax],al
    1f57:	00 02                	add    BYTE PTR [edx],al
    1f59:	04 07                	add    al,0x7
    1f5b:	32 00                	xor    al,BYTE PTR [eax]
    1f5d:	00 00                	add    BYTE PTR [eax],al
    1f5f:	02 08                	add    cl,BYTE PTR [eax]
    1f61:	07                   	pop    es
    1f62:	28 00                	sub    BYTE PTR [eax],al
    1f64:	00 00                	add    BYTE PTR [eax],al
    1f66:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1f6d:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1f70:	96                   	xchg   esi,eax
    1f71:	00 00                	add    BYTE PTR [eax],al
    1f73:	00 02                	add    BYTE PTR [edx],al
    1f75:	01 02                	add    DWORD PTR [edx],eax
    1f77:	90                   	nop
    1f78:	00 00                	add    BYTE PTR [eax],al
    1f7a:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1f81:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1f84:	00 00                	add    BYTE PTR [eax],al
    1f86:	05 04 95 00 00       	add    eax,0x9504
    1f8b:	00 06                	add    BYTE PTR [esi],al
    1f8d:	25 00 00 00 02       	and    eax,0x2000000
    1f92:	04 07                	add    al,0x7
    1f94:	2d 00 00 00 02       	sub    eax,0x2000000
    1f99:	04 07                	add    al,0x7
    1f9b:	dc 00                	fadd   QWORD PTR [eax]
    1f9d:	00 00                	add    BYTE PTR [eax],al
    1f9f:	05 04 25 00 00       	add    eax,0x2504
    1fa4:	00 07                	add    BYTE PTR [edi],al
    1fa6:	c6                   	(bad)  
    1fa7:	08 00                	or     BYTE PTR [eax],al
    1fa9:	00 01                	add    BYTE PTR [ecx],al
    1fab:	57                   	push   edi
    1fac:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1fad:	00 00                	add    BYTE PTR [eax],al
    1faf:	00 64 10 00          	add    BYTE PTR [eax+edx*1+0x0],ah
    1fb3:	30 9c 01 00 00 01 9c 	xor    BYTE PTR [ecx+eax*1-0x63ff0000],bl
    1fba:	43                   	inc    ebx
    1fbb:	01 00                	add    DWORD PTR [eax],eax
    1fbd:	00 08                	add    BYTE PTR [eax],cl
    1fbf:	88 08                	mov    BYTE PTR [eax],cl
    1fc1:	00 00                	add    BYTE PTR [eax],al
    1fc3:	01 57 8f             	add    DWORD PTR [edi-0x71],edx
    1fc6:	00 00                	add    BYTE PTR [eax],al
    1fc8:	00 02                	add    BYTE PTR [edx],al
    1fca:	91                   	xchg   ecx,eax
    1fcb:	00 08                	add    BYTE PTR [eax],cl
    1fcd:	81 08 00 00 01 57    	or     DWORD PTR [eax],0x57010000
    1fd3:	43                   	inc    ebx
    1fd4:	01 00                	add    DWORD PTR [eax],eax
    1fd6:	00 02                	add    BYTE PTR [edx],al
    1fd8:	91                   	xchg   ecx,eax
    1fd9:	04 08                	add    al,0x8
    1fdb:	8d 08                	lea    ecx,[eax]
    1fdd:	00 00                	add    BYTE PTR [eax],al
    1fdf:	01 57 3a             	add    DWORD PTR [edi+0x3a],edx
    1fe2:	00 00                	add    BYTE PTR [eax],al
    1fe4:	00 02                	add    BYTE PTR [edx],al
    1fe6:	91                   	xchg   ecx,eax
    1fe7:	08 09                	or     BYTE PTR [ecx],cl
    1fe9:	73 00                	jae    1feb <sysEnter_Vector-0x12e015>
    1feb:	01 59 8f             	add    DWORD PTR [ecx-0x71],ebx
    1fee:	00 00                	add    BYTE PTR [eax],al
    1ff0:	00 01                	add    BYTE PTR [ecx],al
    1ff2:	56                   	push   esi
    1ff3:	09 61 63             	or     DWORD PTR [ecx+0x63],esp
    1ff6:	63 00                	arpl   WORD PTR [eax],ax
    1ff8:	01 5a 9a             	add    DWORD PTR [edx-0x66],ebx
    1ffb:	00 00                	add    BYTE PTR [eax],al
    1ffd:	00 01                	add    BYTE PTR [ecx],al
    1fff:	57                   	push   edi
    2000:	09 63 00             	or     DWORD PTR [ebx+0x0],esp
    2003:	01 5b 3a             	add    DWORD PTR [ebx+0x3a],ebx
    2006:	00 00                	add    BYTE PTR [eax],al
    2008:	00 01                	add    BYTE PTR [ecx],al
    200a:	53                   	push   ebx
    200b:	0a 6b 08             	or     ch,BYTE PTR [ebx+0x8]
    200e:	00 00                	add    BYTE PTR [eax],al
    2010:	01 5c 9a 00          	add    DWORD PTR [edx+ebx*4+0x0],ebx
    2014:	00 00                	add    BYTE PTR [eax],al
    2016:	0b 6e 65             	or     ebp,DWORD PTR [esi+0x65]
    2019:	67 00 01             	add    BYTE PTR [bx+di],al
    201c:	5d                   	pop    ebp
    201d:	3a 00                	cmp    al,BYTE PTR [eax]
    201f:	00 00                	add    BYTE PTR [eax],al
    2021:	09 61 6e             	or     DWORD PTR [ecx+0x6e],esp
    2024:	79 00                	jns    2026 <sysEnter_Vector-0x12dfda>
    2026:	01 5d 3a             	add    DWORD PTR [ebp+0x3a],ebx
    2029:	00 00                	add    BYTE PTR [eax],al
    202b:	00 01                	add    BYTE PTR [ecx],al
    202d:	51                   	push   ecx
    202e:	0a 72 08             	or     dh,BYTE PTR [edx+0x8]
    2031:	00 00                	add    BYTE PTR [eax],al
    2033:	01 5d 3a             	add    DWORD PTR [ebp+0x3a],ebx
    2036:	00 00                	add    BYTE PTR [eax],al
    2038:	00 00                	add    BYTE PTR [eax],al
    203a:	05 04 a8 00 00       	add    eax,0xa804
    203f:	00 0c 3f             	add    BYTE PTR [edi+edi*1],cl
    2042:	00 00                	add    BYTE PTR [eax],al
    2044:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    2047:	56                   	push   esi
    2048:	00 00                	add    BYTE PTR [eax],al
    204a:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
    2050:	30 0c aa             	xor    BYTE PTR [edx+ebp*4],cl
    2053:	00 00                	add    BYTE PTR [eax],al
    2055:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    2058:	56                   	push   esi
    2059:	00 00                	add    BYTE PTR [eax],al
    205b:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
    2061:	30 0c 56             	xor    BYTE PTR [esi+edx*2],cl
    2064:	01 00                	add    DWORD PTR [eax],eax
    2066:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    206d:	05 03 70 34 00       	add    eax,0x347003
    2072:	30 0c 48             	xor    BYTE PTR [eax+ecx*2],cl
    2075:	00 00                	add    BYTE PTR [eax],al
    2077:	00 05 36 84 00 00    	add    BYTE PTR ds:0x8436,al
    207d:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
    2083:	30 00                	xor    BYTE PTR [eax],al
    2085:	ad                   	lods   eax,DWORD PTR ds:[esi]
    2086:	01 00                	add    DWORD PTR [eax],eax
    2088:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    208b:	f6                   	(bad)  
    208c:	0c 00                	or     al,0x0
    208e:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    2091:	ef                   	out    dx,eax
    2092:	00 00                	add    BYTE PTR [eax],al
    2094:	00 0c da             	add    BYTE PTR [edx+ebx*8],cl
    2097:	08 00                	or     BYTE PTR [eax],al
    2099:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    209c:	00 00                	add    BYTE PTR [eax],al
    209e:	00 12                	add    BYTE PTR [edx],dl
    20a0:	00 30                	add    BYTE PTR [eax],dh
    20a2:	53                   	push   ebx
    20a3:	01 00                	add    DWORD PTR [eax],eax
    20a5:	00 8f 10 00 00 02    	add    BYTE PTR [edi+0x2000010],cl
    20ab:	01 06                	add    DWORD PTR [esi],eax
    20ad:	58                   	pop    eax
    20ae:	00 00                	add    BYTE PTR [eax],al
    20b0:	00 02                	add    BYTE PTR [edx],al
    20b2:	01 06                	add    DWORD PTR [esi],eax
    20b4:	51                   	push   ecx
    20b5:	00 00                	add    BYTE PTR [eax],al
    20b7:	00 02                	add    BYTE PTR [edx],al
    20b9:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    20bf:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    20c6:	02 08                	add    cl,BYTE PTR [eax]
    20c8:	05 00 00 00 00       	add    eax,0x0
    20cd:	04 3a                	add    al,0x3a
    20cf:	05 00 00 02 2e       	add    eax,0x2e020000
    20d4:	53                   	push   ebx
    20d5:	00 00                	add    BYTE PTR [eax],al
    20d7:	00 02                	add    BYTE PTR [edx],al
    20d9:	01 08                	add    DWORD PTR [eax],ecx
    20db:	4f                   	dec    edi
    20dc:	00 00                	add    BYTE PTR [eax],al
    20de:	00 02                	add    BYTE PTR [edx],al
    20e0:	02 07                	add    al,BYTE PTR [edi]
    20e2:	0e                   	push   cs
    20e3:	00 00                	add    BYTE PTR [eax],al
    20e5:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    20e8:	00 00                	add    BYTE PTR [eax],al
    20ea:	00 02                	add    BYTE PTR [edx],al
    20ec:	34 6c                	xor    al,0x6c
    20ee:	00 00                	add    BYTE PTR [eax],al
    20f0:	00 02                	add    BYTE PTR [edx],al
    20f2:	04 07                	add    al,0x7
    20f4:	32 00                	xor    al,BYTE PTR [eax]
    20f6:	00 00                	add    BYTE PTR [eax],al
    20f8:	02 08                	add    cl,BYTE PTR [eax]
    20fa:	07                   	pop    es
    20fb:	28 00                	sub    BYTE PTR [eax],al
    20fd:	00 00                	add    BYTE PTR [eax],al
    20ff:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    2106:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    2109:	96                   	xchg   esi,eax
    210a:	00 00                	add    BYTE PTR [eax],al
    210c:	00 02                	add    BYTE PTR [edx],al
    210e:	01 02                	add    DWORD PTR [edx],eax
    2110:	90                   	nop
    2111:	00 00                	add    BYTE PTR [eax],al
    2113:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    211a:	2a 7a 00             	sub    bh,BYTE PTR [edx+0x0]
    211d:	00 00                	add    BYTE PTR [eax],al
    211f:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
    2122:	2d 00 00 00 02       	sub    eax,0x2000000
    2127:	04 07                	add    al,0x7
    2129:	dc 00                	fadd   QWORD PTR [eax]
    212b:	00 00                	add    BYTE PTR [eax],al
    212d:	05 04 25 00 00       	add    eax,0x2504
    2132:	00 06                	add    BYTE PTR [esi],al
    2134:	f0 08 00             	lock or BYTE PTR [eax],al
    2137:	00 01                	add    BYTE PTR [ecx],al
    2139:	04 a8                	add    al,0xa8
    213b:	00 00                	add    BYTE PTR [eax],al
    213d:	00 00                	add    BYTE PTR [eax],al
    213f:	12 00                	adc    al,BYTE PTR [eax]
    2141:	30 b5 00 00 00 01    	xor    BYTE PTR [ebp+0x1000000],dh
    2147:	9c                   	pushf  
    2148:	0a 01                	or     al,BYTE PTR [ecx]
    214a:	00 00                	add    BYTE PTR [eax],al
    214c:	07                   	pop    es
    214d:	01 09                	add    DWORD PTR [ecx],ecx
    214f:	00 00                	add    BYTE PTR [eax],al
    2151:	01 04 0a             	add    DWORD PTR [edx+ecx*1],eax
    2154:	01 00                	add    DWORD PTR [eax],eax
    2156:	00 02                	add    BYTE PTR [edx],al
    2158:	91                   	xchg   ecx,eax
    2159:	00 08                	add    BYTE PTR [eax],cl
    215b:	d4 08                	aam    0x8
    215d:	00 00                	add    BYTE PTR [eax],al
    215f:	01 06                	add    DWORD PTR [esi],eax
    2161:	48                   	dec    eax
    2162:	00 00                	add    BYTE PTR [eax],al
    2164:	00 02                	add    BYTE PTR [edx],al
    2166:	91                   	xchg   ecx,eax
    2167:	6f                   	outs   dx,DWORD PTR ds:[esi]
    2168:	08 cd                	or     ch,cl
    216a:	08 00                	or     BYTE PTR [eax],al
    216c:	00 01                	add    BYTE PTR [ecx],al
    216e:	06                   	push   es
    216f:	48                   	dec    eax
    2170:	00 00                	add    BYTE PTR [eax],al
    2172:	00 02                	add    BYTE PTR [edx],al
    2174:	91                   	xchg   ecx,eax
    2175:	6d                   	ins    DWORD PTR es:[edi],dx
    2176:	09 65 12             	or     DWORD PTR [ebp+0x12],esp
    2179:	00 30                	add    BYTE PTR [eax],dh
    217b:	46                   	inc    esi
    217c:	00 00                	add    BYTE PTR [eax],al
    217e:	00 0a                	add    BYTE PTR [edx],cl
    2180:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    2182:	64 00 01             	add    BYTE PTR fs:[ecx],al
    2185:	10 48 00             	adc    BYTE PTR [eax+0x0],cl
    2188:	00 00                	add    BYTE PTR [eax],al
    218a:	02 91 6e 00 00 05    	add    dl,BYTE PTR [ecx+0x500006e]
    2190:	04 a8                	add    al,0xa8
    2192:	00 00                	add    BYTE PTR [eax],al
    2194:	00 06                	add    BYTE PTR [esi],al
    2196:	f8                   	clc    
    2197:	08 00                	or     BYTE PTR [eax],al
    2199:	00 01                	add    BYTE PTR [ecx],al
    219b:	18 a8 00 00 00 b5    	sbb    BYTE PTR [eax-0x4b000000],ch
    21a1:	12 00                	adc    al,BYTE PTR [eax]
    21a3:	30 9e 00 00 00 01    	xor    BYTE PTR [esi+0x1000000],bl
    21a9:	9c                   	pushf  
    21aa:	6c                   	ins    BYTE PTR es:[edi],dx
    21ab:	01 00                	add    DWORD PTR [eax],eax
    21ad:	00 07                	add    BYTE PTR [edi],al
    21af:	01 09                	add    DWORD PTR [ecx],ecx
    21b1:	00 00                	add    BYTE PTR [eax],al
    21b3:	01 18                	add    DWORD PTR [eax],ebx
    21b5:	a8 00                	test   al,0x0
    21b7:	00 00                	add    BYTE PTR [eax],al
    21b9:	02 91 00 08 d4 08    	add    dl,BYTE PTR [ecx+0x8d40800]
    21bf:	00 00                	add    BYTE PTR [eax],al
    21c1:	01 1a                	add    DWORD PTR [edx],ebx
    21c3:	48                   	dec    eax
    21c4:	00 00                	add    BYTE PTR [eax],al
    21c6:	00 02                	add    BYTE PTR [edx],al
    21c8:	91                   	xchg   ecx,eax
    21c9:	6f                   	outs   dx,DWORD PTR ds:[esi]
    21ca:	08 cd                	or     ch,cl
    21cc:	08 00                	or     BYTE PTR [eax],al
    21ce:	00 01                	add    BYTE PTR [ecx],al
    21d0:	1a 48 00             	sbb    cl,BYTE PTR [eax+0x0]
    21d3:	00 00                	add    BYTE PTR [eax],al
    21d5:	02 91 6d 09 0c 13    	add    dl,BYTE PTR [ecx+0x130c096d]
    21db:	00 30                	add    BYTE PTR [eax],dh
    21dd:	3f                   	aas    
    21de:	00 00                	add    BYTE PTR [eax],al
    21e0:	00 0a                	add    BYTE PTR [edx],cl
    21e2:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    21e4:	64 00 01             	add    BYTE PTR fs:[ecx],al
    21e7:	24 48                	and    al,0x48
    21e9:	00 00                	add    BYTE PTR [eax],al
    21eb:	00 02                	add    BYTE PTR [edx],al
    21ed:	91                   	xchg   ecx,eax
    21ee:	6e                   	outs   dx,BYTE PTR ds:[esi]
    21ef:	00 00                	add    BYTE PTR [eax],al
    21f1:	0b 3f                	or     edi,DWORD PTR [edi]
    21f3:	00 00                	add    BYTE PTR [eax],al
    21f5:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    21f8:	61                   	popa   
    21f9:	00 00                	add    BYTE PTR [eax],al
    21fb:	00 05 03 74 34 00    	add    BYTE PTR ds:0x347403,al
    2201:	30 0b                	xor    BYTE PTR [ebx],cl
    2203:	aa                   	stos   BYTE PTR es:[edi],al
    2204:	00 00                	add    BYTE PTR [eax],al
    2206:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    2209:	61                   	popa   
    220a:	00 00                	add    BYTE PTR [eax],al
    220c:	00 05 03 78 34 00    	add    BYTE PTR ds:0x347803,al
    2212:	30 0b                	xor    BYTE PTR [ebx],cl
    2214:	56                   	push   esi
    2215:	01 00                	add    DWORD PTR [eax],eax
    2217:	00 04 35 61 00 00 00 	add    BYTE PTR [esi*1+0x61],al
    221e:	05 03 70 34 00       	add    eax,0x347003
    2223:	30 0b                	xor    BYTE PTR [ebx],cl
    2225:	48                   	dec    eax
    2226:	00 00                	add    BYTE PTR [eax],al
    2228:	00 05 36 8f 00 00    	add    BYTE PTR ds:0x8f36,al
    222e:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
    2234:	30 00                	xor    BYTE PTR [eax],al
    2236:	b4 04                	mov    ah,0x4
    2238:	00 00                	add    BYTE PTR [eax],al
    223a:	04 00                	add    al,0x0
    223c:	99                   	cdq    
    223d:	0d 00 00 04 01       	or     eax,0x1040000
    2242:	ef                   	out    dx,eax
    2243:	00 00                	add    BYTE PTR [eax],al
    2245:	00 0c b8             	add    BYTE PTR [eax+edi*4],cl
    2248:	09 00                	or     DWORD PTR [eax],eax
    224a:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    224d:	00 00                	add    BYTE PTR [eax],al
    224f:	54                   	push   esp
    2250:	13 00                	adc    eax,DWORD PTR [eax]
    2252:	30 16                	xor    BYTE PTR [esi],dl
    2254:	0c 00                	or     al,0x0
    2256:	00 9b 11 00 00 02    	add    BYTE PTR [ebx+0x2000011],bl
    225c:	38 02                	cmp    BYTE PTR [edx],al
    225e:	00 00                	add    BYTE PTR [eax],al
    2260:	04 b3                	add    al,0xb3
    2262:	00 00                	add    BYTE PTR [eax],al
    2264:	00 06                	add    BYTE PTR [esi],al
    2266:	15 b3 00 00 00       	adc    eax,0xb3
    226b:	03 1e                	add    ebx,DWORD PTR [esi]
    226d:	03 00                	add    eax,DWORD PTR [eax]
    226f:	00 00                	add    BYTE PTR [eax],al
    2271:	03 c7                	add    eax,edi
    2273:	02 00                	add    al,BYTE PTR [eax]
    2275:	00 01                	add    BYTE PTR [ecx],al
    2277:	03 ad 02 00 00 03    	add    ebp,DWORD PTR [ebp+0x3000002]
    227d:	03 10                	add    edx,DWORD PTR [eax]
    227f:	03 00                	add    eax,DWORD PTR [eax]
    2281:	00 04 03             	add    BYTE PTR [ebx+eax*1],al
    2284:	17                   	pop    ss
    2285:	02 00                	add    al,BYTE PTR [eax]
    2287:	00 4f 03             	add    BYTE PTR [edi+0x3],cl
    228a:	ba 02 00 00 59       	mov    edx,0x59000002
    228f:	03 42 02             	add    eax,DWORD PTR [edx+0x2]
    2292:	00 00                	add    BYTE PTR [eax],al
    2294:	61                   	popa   
    2295:	03 3d 03 00 00 97    	add    edi,DWORD PTR ds:0x97000003
    229b:	04 df                	add    al,0xdf
    229d:	02 00                	add    al,BYTE PTR [eax]
    229f:	00 63 01             	add    BYTE PTR [ebx+0x1],ah
    22a2:	04 f6                	add    al,0xf6
    22a4:	02 00                	add    al,BYTE PTR [eax]
    22a6:	00 64 01 04          	add    BYTE PTR [ecx+eax*1+0x4],ah
    22aa:	9a 02 00 00 65 01 04 	call   0x401:0x65000002
    22b1:	71 02                	jno    22b5 <sysEnter_Vector-0x12dd4b>
    22b3:	00 00                	add    BYTE PTR [eax],al
    22b5:	66 01 04 55 02 00 00 	add    WORD PTR [edx*2+0x67000002],ax
    22bc:	67 
    22bd:	01 04 03             	add    DWORD PTR [ebx+eax*1],eax
    22c0:	03 00                	add    eax,DWORD PTR [eax]
    22c2:	00 68 01             	add    BYTE PTR [eax+0x1],ch
    22c5:	04 2e                	add    al,0x2e
    22c7:	03 00                	add    eax,DWORD PTR [eax]
    22c9:	00 69 01             	add    BYTE PTR [ecx+0x1],ch
    22cc:	04 e9                	add    al,0xe9
    22ce:	01 00                	add    DWORD PTR [eax],eax
    22d0:	00 70 01             	add    BYTE PTR [eax+0x1],dh
    22d3:	04 5b                	add    al,0x5b
    22d5:	03 00                	add    eax,DWORD PTR [eax]
    22d7:	00 00                	add    BYTE PTR [eax],al
    22d9:	03 04 8b             	add    eax,DWORD PTR [ebx+ecx*4]
    22dc:	02 00                	add    al,BYTE PTR [eax]
    22de:	00 01                	add    BYTE PTR [ecx],al
    22e0:	03 04 fa             	add    eax,DWORD PTR [edx+edi*8]
    22e3:	01 00                	add    DWORD PTR [eax],eax
    22e5:	00 02                	add    BYTE PTR [edx],al
    22e7:	03 00                	add    eax,DWORD PTR [eax]
    22e9:	05 04 07 32 00       	add    eax,0x320704
    22ee:	00 00                	add    BYTE PTR [eax],al
    22f0:	05 01 06 58 00       	add    eax,0x580601
    22f5:	00 00                	add    BYTE PTR [eax],al
    22f7:	05 01 06 51 00       	add    eax,0x510601
    22fc:	00 00                	add    BYTE PTR [eax],al
    22fe:	05 02 05 e5 00       	add    eax,0xe50502
    2303:	00 00                	add    BYTE PTR [eax],al
    2305:	06                   	push   es
    2306:	04 05                	add    al,0x5
    2308:	69 6e 74 00 05 08 05 	imul   ebp,DWORD PTR [esi+0x74],0x5080500
    230f:	00 00                	add    BYTE PTR [eax],al
    2311:	00 00                	add    BYTE PTR [eax],al
    2313:	05 01 08 4f 00       	add    eax,0x4f0801
    2318:	00 00                	add    BYTE PTR [eax],al
    231a:	05 02 07 0e 00       	add    eax,0xe0702
    231f:	00 00                	add    BYTE PTR [eax],al
    2321:	07                   	pop    es
    2322:	64 00 00             	add    BYTE PTR fs:[eax],al
    2325:	00 02                	add    BYTE PTR [edx],al
    2327:	34 b3                	xor    al,0xb3
    2329:	00 00                	add    BYTE PTR [eax],al
    232b:	00 05 08 07 28 00    	add    BYTE PTR ds:0x280708,al
    2331:	00 00                	add    BYTE PTR [eax],al
    2333:	05 04 05 05 00       	add    eax,0x50504
    2338:	00 00                	add    BYTE PTR [eax],al
    233a:	05 0c 04 96 00       	add    eax,0x96040c
    233f:	00 00                	add    BYTE PTR [eax],al
    2341:	05 01 02 90 00       	add    eax,0x900201
    2346:	00 00                	add    BYTE PTR [eax],al
    2348:	07                   	pop    es
    2349:	5d                   	pop    ebp
    234a:	00 00                	add    BYTE PTR [eax],al
    234c:	00 03                	add    BYTE PTR [ebx],al
    234e:	2a fd                	sub    bh,ch
    2350:	00 00                	add    BYTE PTR [eax],al
    2352:	00 08                	add    BYTE PTR [eax],cl
    2354:	74 6d                	je     23c3 <sysEnter_Vector-0x12dc3d>
    2356:	00 2c 03             	add    BYTE PTR [ebx+eax*1],ch
    2359:	2c ad                	sub    al,0xad
    235b:	01 00                	add    DWORD PTR [eax],eax
    235d:	00 09                	add    BYTE PTR [ecx],cl
    235f:	ca 04 00             	retf   0x4
    2362:	00 03                	add    BYTE PTR [ebx],al
    2364:	2e                   	cs
    2365:	cf                   	iret   
    2366:	00 00                	add    BYTE PTR [eax],al
    2368:	00 00                	add    BYTE PTR [eax],al
    236a:	09 2f                	or     DWORD PTR [edi],ebp
    236c:	04 00                	add    al,0x0
    236e:	00 03                	add    BYTE PTR [ebx],al
    2370:	2f                   	das    
    2371:	cf                   	iret   
    2372:	00 00                	add    BYTE PTR [eax],al
    2374:	00 04 09             	add    BYTE PTR [ecx+ecx*1],al
    2377:	70 03                	jo     237c <sysEnter_Vector-0x12dc84>
    2379:	00 00                	add    BYTE PTR [eax],al
    237b:	03 30                	add    esi,DWORD PTR [eax]
    237d:	cf                   	iret   
    237e:	00 00                	add    BYTE PTR [eax],al
    2380:	00 08                	add    BYTE PTR [eax],cl
    2382:	09 b5 04 00 00 03    	or     DWORD PTR [ebp+0x3000004],esi
    2388:	31 cf                	xor    edi,ecx
    238a:	00 00                	add    BYTE PTR [eax],al
    238c:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
    238f:	c4 03                	les    eax,FWORD PTR [ebx]
    2391:	00 00                	add    BYTE PTR [eax],al
    2393:	03 32                	add    esi,DWORD PTR [edx]
    2395:	cf                   	iret   
    2396:	00 00                	add    BYTE PTR [eax],al
    2398:	00 10                	add    BYTE PTR [eax],dl
    239a:	09 cb                	or     ebx,ecx
    239c:	03 00                	add    eax,DWORD PTR [eax]
    239e:	00 03                	add    BYTE PTR [ebx],al
    23a0:	33 cf                	xor    ecx,edi
    23a2:	00 00                	add    BYTE PTR [eax],al
    23a4:	00 14 09             	add    BYTE PTR [ecx+ecx*1],dl
    23a7:	ad                   	lods   eax,DWORD PTR ds:[esi]
    23a8:	04 00                	add    al,0x0
    23aa:	00 03                	add    BYTE PTR [ebx],al
    23ac:	34 cf                	xor    al,0xcf
    23ae:	00 00                	add    BYTE PTR [eax],al
    23b0:	00 18                	add    BYTE PTR [eax],bl
    23b2:	09 3c 04             	or     DWORD PTR [esp+eax*1],edi
    23b5:	00 00                	add    BYTE PTR [eax],al
    23b7:	03 35 cf 00 00 00    	add    esi,DWORD PTR ds:0xcf
    23bd:	1c 09                	sbb    al,0x9
    23bf:	f6 03 00             	test   BYTE PTR [ebx],0x0
    23c2:	00 03                	add    BYTE PTR [ebx],al
    23c4:	36                   	ss
    23c5:	cf                   	iret   
    23c6:	00 00                	add    BYTE PTR [eax],al
    23c8:	00 20                	add    BYTE PTR [eax],ah
    23ca:	09 77 04             	or     DWORD PTR [edi+0x4],esi
    23cd:	00 00                	add    BYTE PTR [eax],al
    23cf:	03 37                	add    esi,DWORD PTR [edi]
    23d1:	fd                   	std    
    23d2:	00 00                	add    BYTE PTR [eax],al
    23d4:	00 24 09             	add    BYTE PTR [ecx+ecx*1],ah
    23d7:	95                   	xchg   ebp,eax
    23d8:	03 00                	add    eax,DWORD PTR [eax]
    23da:	00 03                	add    BYTE PTR [ebx],al
    23dc:	38 ad 01 00 00 28    	cmp    BYTE PTR [ebp+0x28000001],ch
    23e2:	00 0a                	add    BYTE PTR [edx],cl
    23e4:	04 b3                	add    al,0xb3
    23e6:	01 00                	add    DWORD PTR [eax],eax
    23e8:	00 0b                	add    BYTE PTR [ebx],cl
    23ea:	ba 00 00 00 05       	mov    edx,0x5000000
    23ef:	04 07                	add    al,0x7
    23f1:	2d 00 00 00 05       	sub    eax,0x5000000
    23f6:	04 07                	add    al,0x7
    23f8:	dc 00                	fadd   QWORD PTR [eax]
    23fa:	00 00                	add    BYTE PTR [eax],al
    23fc:	0a 04 ba             	or     al,BYTE PTR [edx+edi*4]
    23ff:	00 00                	add    BYTE PTR [eax],al
    2401:	00 0c 78             	add    BYTE PTR [eax+edi*2],cl
    2404:	09 00                	or     DWORD PTR [eax],eax
    2406:	00 01                	add    BYTE PTR [ecx],al
    2408:	2e 12 01             	adc    al,BYTE PTR cs:[ecx]
    240b:	00 00                	add    BYTE PTR [eax],al
    240d:	54                   	push   esp
    240e:	13 00                	adc    eax,DWORD PTR [eax]
    2410:	30 29                	xor    BYTE PTR [ecx],ch
    2412:	00 00                	add    BYTE PTR [eax],al
    2414:	00 01                	add    BYTE PTR [ecx],al
    2416:	9c                   	pushf  
    2417:	f4                   	hlt    
    2418:	01 00                	add    DWORD PTR [eax],eax
    241a:	00 0d 69 03 00 00    	add    BYTE PTR ds:0x369,cl
    2420:	01 30                	add    DWORD PTR [eax],esi
    2422:	eb 00                	jmp    2424 <sysEnter_Vector-0x12dbdc>
    2424:	00 00                	add    BYTE PTR [eax],al
    2426:	02 91 74 00 0e 2a    	add    dl,BYTE PTR [ecx+0x2a0e0074]
    242c:	09 00                	or     DWORD PTR [eax],eax
    242e:	00 01                	add    BYTE PTR [ecx],al
    2430:	36 62 02             	bound  eax,QWORD PTR ss:[edx]
    2433:	00 00                	add    BYTE PTR [eax],al
    2435:	7d 13                	jge    244a <sysEnter_Vector-0x12dbb6>
    2437:	00 30                	add    BYTE PTR [eax],dh
    2439:	19 03                	sbb    DWORD PTR [ebx],eax
    243b:	00 00                	add    BYTE PTR [eax],al
    243d:	01 9c 62 02 00 00 0f 	add    DWORD PTR [edx+eiz*2+0xf000002],ebx
    2444:	33 09                	xor    ecx,DWORD PTR [ecx]
    2446:	00 00                	add    BYTE PTR [eax],al
    2448:	01 36                	add    DWORD PTR [esi],esi
    244a:	68 02 00 00 02       	push   0x2000002
    244f:	91                   	xchg   ecx,eax
    2450:	00 0f                	add    BYTE PTR [edi],cl
    2452:	ac                   	lods   al,BYTE PTR ds:[esi]
    2453:	09 00                	or     DWORD PTR [eax],eax
    2455:	00 01                	add    BYTE PTR [ecx],al
    2457:	36 62 02             	bound  eax,QWORD PTR ss:[edx]
    245a:	00 00                	add    BYTE PTR [eax],al
    245c:	02 91 04 0d 78 09    	add    dl,BYTE PTR [ecx+0x9780d04]
    2462:	00 00                	add    BYTE PTR [eax],al
    2464:	01 37                	add    DWORD PTR [edi],esi
    2466:	12 01                	adc    al,BYTE PTR [ecx]
    2468:	00 00                	add    BYTE PTR [eax],al
    246a:	02 91 68 0d 7d 09    	add    dl,BYTE PTR [ecx+0x97d0d68]
    2470:	00 00                	add    BYTE PTR [eax],al
    2472:	01 38                	add    DWORD PTR [eax],edi
    2474:	b8 01 00 00 02       	mov    eax,0x2000001
    2479:	91                   	xchg   ecx,eax
    247a:	64                   	fs
    247b:	0d 1b 09 00 00       	or     eax,0x91b
    2480:	01 38                	add    DWORD PTR [eax],edi
    2482:	b8 01 00 00 02       	mov    eax,0x2000001
    2487:	91                   	xchg   ecx,eax
    2488:	70 0d                	jo     2497 <sysEnter_Vector-0x12db69>
    248a:	ce                   	into   
    248b:	03 00                	add    eax,DWORD PTR [eax]
    248d:	00 01                	add    BYTE PTR [ecx],al
    248f:	39 cf                	cmp    edi,ecx
    2491:	00 00                	add    BYTE PTR [eax],al
    2493:	00 02                	add    BYTE PTR [edx],al
    2495:	91                   	xchg   ecx,eax
    2496:	6c                   	ins    BYTE PTR es:[edi],dx
    2497:	00 0a                	add    BYTE PTR [edx],cl
    2499:	04 1d                	add    al,0x1d
    249b:	01 00                	add    DWORD PTR [eax],eax
    249d:	00 0a                	add    BYTE PTR [edx],cl
    249f:	04 6e                	add    al,0x6e
    24a1:	02 00                	add    al,BYTE PTR [eax]
    24a3:	00 0b                	add    BYTE PTR [ebx],cl
    24a5:	12 01                	adc    al,BYTE PTR [ecx]
    24a7:	00 00                	add    BYTE PTR [eax],al
    24a9:	10 11                	adc    BYTE PTR [ecx],dl
    24ab:	09 00                	or     DWORD PTR [eax],eax
    24ad:	00 01                	add    BYTE PTR [ecx],al
    24af:	52                   	push   edx
    24b0:	62 02                	bound  eax,QWORD PTR [edx]
    24b2:	00 00                	add    BYTE PTR [eax],al
    24b4:	96                   	xchg   esi,eax
    24b5:	16                   	push   ss
    24b6:	00 30                	add    BYTE PTR [eax],dh
    24b8:	3f                   	aas    
    24b9:	00 00                	add    BYTE PTR [eax],al
    24bb:	00 01                	add    BYTE PTR [ecx],al
    24bd:	9c                   	pushf  
    24be:	b5 02                	mov    ch,0x2
    24c0:	00 00                	add    BYTE PTR [eax],al
    24c2:	0f 33                	rdpmc  
    24c4:	09 00                	or     DWORD PTR [eax],eax
    24c6:	00 01                	add    BYTE PTR [ecx],al
    24c8:	52                   	push   edx
    24c9:	68 02 00 00 02       	push   0x2000002
    24ce:	91                   	xchg   ecx,eax
    24cf:	00 11                	add    BYTE PTR [ecx],dl
    24d1:	74 00                	je     24d3 <sysEnter_Vector-0x12db2d>
    24d3:	01 53 12             	add    DWORD PTR [ebx+0x12],edx
    24d6:	01 00                	add    DWORD PTR [eax],eax
    24d8:	00 02                	add    BYTE PTR [edx],al
    24da:	91                   	xchg   ecx,eax
    24db:	6c                   	ins    BYTE PTR es:[edi],dx
    24dc:	0d ac 09 00 00       	or     eax,0x9ac
    24e1:	01 54 1d 01          	add    DWORD PTR [ebp+ebx*1+0x1],edx
    24e5:	00 00                	add    BYTE PTR [eax],al
    24e7:	02 91 40 00 10 39    	add    dl,BYTE PTR [ecx+0x39100040]
    24ed:	09 00                	or     DWORD PTR [eax],eax
    24ef:	00 01                	add    BYTE PTR [ecx],al
    24f1:	5a                   	pop    edx
    24f2:	62 02                	bound  eax,QWORD PTR [edx]
    24f4:	00 00                	add    BYTE PTR [eax],al
    24f6:	d5 16                	aad    0x16
    24f8:	00 30                	add    BYTE PTR [eax],dh
    24fa:	3e 00 00             	add    BYTE PTR ds:[eax],al
    24fd:	00 01                	add    BYTE PTR [ecx],al
    24ff:	9c                   	pushf  
    2500:	f7 02 00 00 0f 33    	test   DWORD PTR [edx],0x330f0000
    2506:	09 00                	or     DWORD PTR [eax],eax
    2508:	00 01                	add    BYTE PTR [ecx],al
    250a:	5a                   	pop    edx
    250b:	68 02 00 00 02       	push   0x2000002
    2510:	91                   	xchg   ecx,eax
    2511:	00 0f                	add    BYTE PTR [edi],cl
    2513:	ac                   	lods   al,BYTE PTR ds:[esi]
    2514:	09 00                	or     DWORD PTR [eax],eax
    2516:	00 01                	add    BYTE PTR [ecx],al
    2518:	5a                   	pop    edx
    2519:	62 02                	bound  eax,QWORD PTR [edx]
    251b:	00 00                	add    BYTE PTR [eax],al
    251d:	02 91 04 11 74 00    	add    dl,BYTE PTR [ecx+0x741104]
    2523:	01 5b 12             	add    DWORD PTR [ebx+0x12],ebx
    2526:	01 00                	add    DWORD PTR [eax],eax
    2528:	00 02                	add    BYTE PTR [edx],al
    252a:	91                   	xchg   ecx,eax
    252b:	6c                   	ins    BYTE PTR es:[edi],dx
    252c:	00 0e                	add    BYTE PTR [esi],cl
    252e:	76 09                	jbe    2539 <sysEnter_Vector-0x12dac7>
    2530:	00 00                	add    BYTE PTR [eax],al
    2532:	01 61 12             	add    DWORD PTR [ecx+0x12],esp
    2535:	01 00                	add    DWORD PTR [eax],eax
    2537:	00 13                	add    BYTE PTR [ebx],dl
    2539:	17                   	pop    ss
    253a:	00 30                	add    BYTE PTR [eax],dh
    253c:	57                   	push   edi
    253d:	08 00                	or     BYTE PTR [eax],al
    253f:	00 01                	add    BYTE PTR [ecx],al
    2541:	9c                   	pushf  
    2542:	8f 03                	pop    DWORD PTR [ebx]
    2544:	00 00                	add    BYTE PTR [eax],al
    2546:	0f ac 09 00          	shrd   DWORD PTR [ecx],ecx,0x0
    254a:	00 01                	add    BYTE PTR [ecx],al
    254c:	61                   	popa   
    254d:	62 02                	bound  eax,QWORD PTR [edx]
    254f:	00 00                	add    BYTE PTR [eax],al
    2551:	02 91 00 11 64 61    	add    dl,BYTE PTR [ecx+0x61641100]
    2557:	79 00                	jns    2559 <sysEnter_Vector-0x12daa7>
    2559:	01 62 fd             	add    DWORD PTR [edx-0x3],esp
    255c:	00 00                	add    BYTE PTR [eax],al
    255e:	00 02                	add    BYTE PTR [edx],al
    2560:	91                   	xchg   ecx,eax
    2561:	68 0d ce 03 00       	push   0x3ce0d
    2566:	00 01                	add    BYTE PTR [ecx],al
    2568:	62                   	(bad)  
    2569:	fd                   	std    
    256a:	00 00                	add    BYTE PTR [eax],al
    256c:	00 02                	add    BYTE PTR [edx],al
    256e:	91                   	xchg   ecx,eax
    256f:	54                   	push   esp
    2570:	0d cb 03 00 00       	or     eax,0x3cb
    2575:	01 63 cf             	add    DWORD PTR [ebx-0x31],esp
    2578:	00 00                	add    BYTE PTR [eax],al
    257a:	00 02                	add    BYTE PTR [edx],al
    257c:	91                   	xchg   ecx,eax
    257d:	4c                   	dec    esp
    257e:	0d 3f 04 00 00       	or     eax,0x43f
    2583:	01 64 cf 00          	add    DWORD PTR [edi+ecx*8+0x0],esp
    2587:	00 00                	add    BYTE PTR [eax],al
    2589:	02 91 64 0d a6 09    	add    dl,BYTE PTR [ecx+0x9a60d64]
    258f:	00 00                	add    BYTE PTR [eax],al
    2591:	01 64 cf 00          	add    DWORD PTR [edi+ecx*8+0x0],esp
    2595:	00 00                	add    BYTE PTR [eax],al
    2597:	02 91 60 0d 8f 04    	add    dl,BYTE PTR [ecx+0x48f0d60]
    259d:	00 00                	add    BYTE PTR [eax],al
    259f:	01 65 fd             	add    DWORD PTR [ebp-0x3],esp
    25a2:	00 00                	add    BYTE PTR [eax],al
    25a4:	00 02                	add    BYTE PTR [edx],al
    25a6:	91                   	xchg   ecx,eax
    25a7:	50                   	push   eax
    25a8:	0d 9d 09 00 00       	or     eax,0x99d
    25ad:	01 66 cf             	add    DWORD PTR [esi-0x31],esp
    25b0:	00 00                	add    BYTE PTR [eax],al
    25b2:	00 02                	add    BYTE PTR [edx],al
    25b4:	91                   	xchg   ecx,eax
    25b5:	5c                   	pop    esp
    25b6:	11 64 73 74          	adc    DWORD PTR [ebx+esi*2+0x74],esp
    25ba:	00 01                	add    BYTE PTR [ecx],al
    25bc:	67 fd                	addr16 std 
    25be:	00 00                	add    BYTE PTR [eax],al
    25c0:	00 02                	add    BYTE PTR [edx],al
    25c2:	91                   	xchg   ecx,eax
    25c3:	58                   	pop    eax
    25c4:	00 12                	add    BYTE PTR [edx],dl
    25c6:	3f                   	aas    
    25c7:	00 00                	add    BYTE PTR [eax],al
    25c9:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    25cc:	eb 00                	jmp    25ce <sysEnter_Vector-0x12da32>
    25ce:	00 00                	add    BYTE PTR [eax],al
    25d0:	05 03 74 34 00       	add    eax,0x347403
    25d5:	30 12                	xor    BYTE PTR [edx],dl
    25d7:	aa                   	stos   BYTE PTR es:[edi],al
    25d8:	00 00                	add    BYTE PTR [eax],al
    25da:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    25dd:	eb 00                	jmp    25df <sysEnter_Vector-0x12da21>
    25df:	00 00                	add    BYTE PTR [eax],al
    25e1:	05 03 78 34 00       	add    eax,0x347803
    25e6:	30 12                	xor    BYTE PTR [edx],dl
    25e8:	56                   	push   esi
    25e9:	01 00                	add    DWORD PTR [eax],eax
    25eb:	00 04 35 eb 00 00 00 	add    BYTE PTR [esi*1+0xeb],al
    25f2:	05 03 70 34 00       	add    eax,0x347003
    25f7:	30 12                	xor    BYTE PTR [edx],dl
    25f9:	48                   	dec    eax
    25fa:	00 00                	add    BYTE PTR [eax],al
    25fc:	00 05 36 12 01 00    	add    BYTE PTR ds:0x11236,al
    2602:	00 05 03 7c 34 00    	add    BYTE PTR ds:0x347c03,al
    2608:	30 12                	xor    BYTE PTR [edx],dl
    260a:	86 09                	xchg   BYTE PTR [ecx],cl
    260c:	00 00                	add    BYTE PTR [eax],al
    260e:	01 0c cf             	add    DWORD PTR [edi+ecx*8],ecx
    2611:	00 00                	add    BYTE PTR [eax],al
    2613:	00 05 03 e4 32 00    	add    BYTE PTR ds:0x32e403,al
    2619:	30 12                	xor    BYTE PTR [edx],dl
    261b:	21 09                	and    DWORD PTR [ecx],ecx
    261d:	00 00                	add    BYTE PTR [eax],al
    261f:	01 0d fd 00 00 00    	add    DWORD PTR ds:0xfd,ecx
    2625:	05 03 9c 34 00       	add    eax,0x349c03
    262a:	30 13                	xor    BYTE PTR [ebx],dl
    262c:	c6 01 00             	mov    BYTE PTR [ecx],0x0
    262f:	00 05 04 00 00 14    	add    BYTE PTR ds:0x14000004,al
    2635:	bf 01 00 00 01       	mov    edi,0x1000001
    263a:	00 12                	add    BYTE PTR [edx],dl
    263c:	54                   	push   esp
    263d:	09 00                	or     DWORD PTR [eax],eax
    263f:	00 01                	add    BYTE PTR [ecx],al
    2641:	0e                   	push   cs
    2642:	f5                   	cmc    
    2643:	03 00                	add    eax,DWORD PTR [eax]
    2645:	00 05 03 c0 33 00    	add    BYTE PTR ds:0x33c003,al
    264b:	30 12                	xor    BYTE PTR [edx],dl
    264d:	6a 09                	push   0x9
    264f:	00 00                	add    BYTE PTR [eax],al
    2651:	01 0f                	add    DWORD PTR [edi],ecx
    2653:	cf                   	iret   
    2654:	00 00                	add    BYTE PTR [eax],al
    2656:	00 05 03 a0 34 00    	add    BYTE PTR ds:0x34a003,al
    265c:	30 13                	xor    BYTE PTR [ebx],dl
    265e:	ad                   	lods   eax,DWORD PTR ds:[esi]
    265f:	01 00                	add    DWORD PTR [eax],eax
    2661:	00 37                	add    BYTE PTR [edi],dh
    2663:	04 00                	add    al,0x0
    2665:	00 14 bf             	add    BYTE PTR [edi+edi*4],dl
    2668:	01 00                	add    DWORD PTR [eax],eax
    266a:	00 06                	add    BYTE PTR [esi],al
    266c:	00 12                	add    BYTE PTR [edx],dl
    266e:	b2 09                	mov    dl,0x9
    2670:	00 00                	add    BYTE PTR [eax],al
    2672:	01 11                	add    DWORD PTR [ecx],edx
    2674:	27                   	daa    
    2675:	04 00                	add    al,0x0
    2677:	00 05 03 c8 33 00    	add    BYTE PTR ds:0x33c803,al
    267d:	30 12                	xor    BYTE PTR [edx],dl
    267f:	90                   	nop
    2680:	09 00                	or     DWORD PTR [eax],eax
    2682:	00 01                	add    BYTE PTR [ecx],al
    2684:	16                   	push   ss
    2685:	27                   	daa    
    2686:	04 00                	add    al,0x0
    2688:	00 05 03 e4 33 00    	add    BYTE PTR ds:0x33e403,al
    268e:	30 13                	xor    BYTE PTR [ebx],dl
    2690:	ad                   	lods   eax,DWORD PTR ds:[esi]
    2691:	01 00                	add    DWORD PTR [eax],eax
    2693:	00 69 04             	add    BYTE PTR [ecx+0x4],ch
    2696:	00 00                	add    BYTE PTR [eax],al
    2698:	14 bf                	adc    al,0xbf
    269a:	01 00                	add    DWORD PTR [eax],eax
    269c:	00 0b                	add    BYTE PTR [ebx],cl
    269e:	00 12                	add    BYTE PTR [edx],dl
    26a0:	5c                   	pop    esp
    26a1:	09 00                	or     DWORD PTR [eax],eax
    26a3:	00 01                	add    BYTE PTR [ecx],al
    26a5:	1b 59 04             	sbb    ebx,DWORD PTR [ecx+0x4]
    26a8:	00 00                	add    BYTE PTR [eax],al
    26aa:	05 03 00 34 00       	add    eax,0x340003
    26af:	30 12                	xor    BYTE PTR [edx],dl
    26b1:	45                   	inc    ebp
    26b2:	09 00                	or     DWORD PTR [eax],eax
    26b4:	00 01                	add    BYTE PTR [ecx],al
    26b6:	22 59 04             	and    bl,BYTE PTR [ecx+0x4]
    26b9:	00 00                	add    BYTE PTR [eax],al
    26bb:	05 03 40 34 00       	add    eax,0x344003
    26c0:	30 13                	xor    BYTE PTR [ebx],dl
    26c2:	cf                   	iret   
    26c3:	00 00                	add    BYTE PTR [eax],al
    26c5:	00 a1 04 00 00 14    	add    BYTE PTR [ecx+0x14000004],ah
    26cb:	bf 01 00 00 01       	mov    edi,0x1000001
    26d0:	14 bf                	adc    al,0xbf
    26d2:	01 00                	add    DWORD PTR [eax],eax
    26d4:	00 0b                	add    BYTE PTR [ebx],cl
    26d6:	00 12                	add    BYTE PTR [edx],dl
    26d8:	64 09 00             	or     DWORD PTR fs:[eax],eax
    26db:	00 01                	add    BYTE PTR [ecx],al
    26dd:	29 b2 04 00 00 05    	sub    DWORD PTR [edx+0x5000004],esi
    26e3:	03 20                	add    esp,DWORD PTR [eax]
    26e5:	30 00                	xor    BYTE PTR [eax],al
    26e7:	30 0b                	xor    BYTE PTR [ebx],cl
    26e9:	8b 04 00             	mov    eax,DWORD PTR [eax+eax*1]
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
  b4:	d6                   	(bad)  
  b5:	02 00                	add    al,BYTE PTR [eax]
	...
  bf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  c2:	00 00                	add    BYTE PTR [eax],al
  c4:	02 00                	add    al,BYTE PTR [eax]
  c6:	df 0e                	fisttp WORD PTR [esi]
  c8:	00 00                	add    BYTE PTR [eax],al
  ca:	04 00                	add    al,0x0
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	00 00                	add    BYTE PTR [eax],al
  d0:	24 09                	and    al,0x9
  d2:	00 30                	add    BYTE PTR [eax],dh
  d4:	9b                   	fwait
  d5:	01 00                	add    DWORD PTR [eax],eax
	...
  df:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  e2:	00 00                	add    BYTE PTR [eax],al
  e4:	02 00                	add    al,BYTE PTR [eax]
  e6:	c1 10 00             	rcl    DWORD PTR [eax],0x0
  e9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
  ec:	00 00                	add    BYTE PTR [eax],al
  ee:	00 00                	add    BYTE PTR [eax],al
  f0:	c0 0a 00             	ror    BYTE PTR [edx],0x0
  f3:	30 c7                	xor    bh,al
	...
  fd:	00 00                	add    BYTE PTR [eax],al
  ff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 102:	00 00                	add    BYTE PTR [eax],al
 104:	02 00                	add    al,BYTE PTR [eax]
 106:	5b                   	pop    ebx
 107:	12 00                	adc    al,BYTE PTR [eax]
 109:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 10c:	00 00                	add    BYTE PTR [eax],al
 10e:	00 00                	add    BYTE PTR [eax],al
 110:	88 0b                	mov    BYTE PTR [ebx],cl
 112:	00 30                	add    BYTE PTR [eax],dh
 114:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
	...
 11d:	00 00                	add    BYTE PTR [eax],al
 11f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 122:	00 00                	add    BYTE PTR [eax],al
 124:	02 00                	add    al,BYTE PTR [eax]
 126:	af                   	scas   eax,DWORD PTR es:[edi]
 127:	16                   	push   ss
 128:	00 00                	add    BYTE PTR [eax],al
 12a:	04 00                	add    al,0x0
 12c:	00 00                	add    BYTE PTR [eax],al
 12e:	00 00                	add    BYTE PTR [eax],al
 130:	30 0c 00             	xor    BYTE PTR [eax+eax*1],cl
 133:	30 ad 00 00 00 00    	xor    BYTE PTR [ebp+0x0],ch
 139:	00 00                	add    BYTE PTR [eax],al
 13b:	00 00                	add    BYTE PTR [eax],al
 13d:	00 00                	add    BYTE PTR [eax],al
 13f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 142:	00 00                	add    BYTE PTR [eax],al
 144:	02 00                	add    al,BYTE PTR [eax]
 146:	1e                   	push   ds
 147:	18 00                	sbb    BYTE PTR [eax],al
 149:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 14c:	00 00                	add    BYTE PTR [eax],al
 14e:	00 00                	add    BYTE PTR [eax],al
 150:	e0 0c                	loopne 15e <sysEnter_Vector-0x12fea2>
 152:	00 30                	add    BYTE PTR [eax],dh
 154:	5e                   	pop    esi
	...
 15d:	00 00                	add    BYTE PTR [eax],al
 15f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 162:	00 00                	add    BYTE PTR [eax],al
 164:	02 00                	add    al,BYTE PTR [eax]
 166:	7c 19                	jl     181 <sysEnter_Vector-0x12fe7f>
 168:	00 00                	add    BYTE PTR [eax],al
 16a:	04 00                	add    al,0x0
 16c:	00 00                	add    BYTE PTR [eax],al
 16e:	00 00                	add    BYTE PTR [eax],al
 170:	40                   	inc    eax
 171:	0d 00 30 87 00       	or     eax,0x873000
	...
 17e:	00 00                	add    BYTE PTR [eax],al
 180:	1c 00                	sbb    al,0x0
 182:	00 00                	add    BYTE PTR [eax],al
 184:	02 00                	add    al,BYTE PTR [eax]
 186:	fd                   	std    
 187:	1a 00                	sbb    al,BYTE PTR [eax]
 189:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 18c:	00 00                	add    BYTE PTR [eax],al
 18e:	00 00                	add    BYTE PTR [eax],al
 190:	c8 0d 00 30          	enter  0xd,0x30
 194:	31 00                	xor    DWORD PTR [eax],eax
	...
 19e:	00 00                	add    BYTE PTR [eax],al
 1a0:	1c 00                	sbb    al,0x0
 1a2:	00 00                	add    BYTE PTR [eax],al
 1a4:	02 00                	add    al,BYTE PTR [eax]
 1a6:	99                   	cdq    
 1a7:	1b 00                	sbb    eax,DWORD PTR [eax]
 1a9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 1ac:	00 00                	add    BYTE PTR [eax],al
 1ae:	00 00                	add    BYTE PTR [eax],al
 1b0:	fc                   	cld    
 1b1:	0d 00 30 67 00       	or     eax,0x673000
	...
 1be:	00 00                	add    BYTE PTR [eax],al
 1c0:	1c 00                	sbb    al,0x0
 1c2:	00 00                	add    BYTE PTR [eax],al
 1c4:	02 00                	add    al,BYTE PTR [eax]
 1c6:	3f                   	aas    
 1c7:	1c 00                	sbb    al,0x0
 1c9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 1cc:	00 00                	add    BYTE PTR [eax],al
 1ce:	00 00                	add    BYTE PTR [eax],al
 1d0:	64                   	fs
 1d1:	0e                   	push   cs
 1d2:	00 30                	add    BYTE PTR [eax],dh
 1d4:	60                   	pusha  
	...
 1dd:	00 00                	add    BYTE PTR [eax],al
 1df:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 1e2:	00 00                	add    BYTE PTR [eax],al
 1e4:	02 00                	add    al,BYTE PTR [eax]
 1e6:	f7 1c 00             	neg    DWORD PTR [eax+eax*1]
 1e9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 1ec:	00 00                	add    BYTE PTR [eax],al
 1ee:	00 00                	add    BYTE PTR [eax],al
 1f0:	c4 0e                	les    ecx,FWORD PTR [esi]
 1f2:	00 30                	add    BYTE PTR [eax],dh
 1f4:	7d 01                	jge    1f7 <sysEnter_Vector-0x12fe09>
	...
 1fe:	00 00                	add    BYTE PTR [eax],al
 200:	1c 00                	sbb    al,0x0
 202:	00 00                	add    BYTE PTR [eax],al
 204:	02 00                	add    al,BYTE PTR [eax]
 206:	87 1e                	xchg   DWORD PTR [esi],ebx
 208:	00 00                	add    BYTE PTR [eax],al
 20a:	04 00                	add    al,0x0
 20c:	00 00                	add    BYTE PTR [eax],al
 20e:	00 00                	add    BYTE PTR [eax],al
 210:	44                   	inc    esp
 211:	10 00                	adc    BYTE PTR [eax],al
 213:	30 1d 00 00 00 00    	xor    BYTE PTR ds:0x0,bl
 219:	00 00                	add    BYTE PTR [eax],al
 21b:	00 00                	add    BYTE PTR [eax],al
 21d:	00 00                	add    BYTE PTR [eax],al
 21f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 222:	00 00                	add    BYTE PTR [eax],al
 224:	02 00                	add    al,BYTE PTR [eax]
 226:	f7 1e                	neg    DWORD PTR [esi]
 228:	00 00                	add    BYTE PTR [eax],al
 22a:	04 00                	add    al,0x0
 22c:	00 00                	add    BYTE PTR [eax],al
 22e:	00 00                	add    BYTE PTR [eax],al
 230:	64 10 00             	adc    BYTE PTR fs:[eax],al
 233:	30 9c 01 00 00 00 00 	xor    BYTE PTR [ecx+eax*1+0x0],bl
 23a:	00 00                	add    BYTE PTR [eax],al
 23c:	00 00                	add    BYTE PTR [eax],al
 23e:	00 00                	add    BYTE PTR [eax],al
 240:	1c 00                	sbb    al,0x0
 242:	00 00                	add    BYTE PTR [eax],al
 244:	02 00                	add    al,BYTE PTR [eax]
 246:	85 20                	test   DWORD PTR [eax],esp
 248:	00 00                	add    BYTE PTR [eax],al
 24a:	04 00                	add    al,0x0
 24c:	00 00                	add    BYTE PTR [eax],al
 24e:	00 00                	add    BYTE PTR [eax],al
 250:	00 12                	add    BYTE PTR [edx],dl
 252:	00 30                	add    BYTE PTR [eax],dh
 254:	53                   	push   ebx
 255:	01 00                	add    DWORD PTR [eax],eax
	...
 25f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 262:	00 00                	add    BYTE PTR [eax],al
 264:	02 00                	add    al,BYTE PTR [eax]
 266:	36 22 00             	and    al,BYTE PTR ss:[eax]
 269:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 26c:	00 00                	add    BYTE PTR [eax],al
 26e:	00 00                	add    BYTE PTR [eax],al
 270:	54                   	push   esp
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
     55b:	01 12                	add    DWORD PTR [edx],edx
     55d:	01 00                	add    DWORD PTR [eax],eax
     55f:	00 02                	add    BYTE PTR [edx],al
     561:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
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
     656:	08 76 3d             	or     BYTE PTR [esi+0x3d],dh
     659:	77 f5                	ja     650 <sysEnter_Vector-0x12f9b0>
     65b:	68 93 00 02 04       	push   0x4020093
     660:	02 be 30 03 76 90    	add    bh,BYTE PTR [esi-0x6f89fcd0]
     666:	03 0b                	add    ecx,DWORD PTR [ebx]
     668:	20 31                	and    BYTE PTR [ecx],dh
     66a:	d7                   	xlat   BYTE PTR ds:[ebx]
     66b:	08 3d 02 04 00 01    	or     BYTE PTR ds:0x1000402,bh
     671:	01 ed                	add    ebp,ebp
     673:	00 00                	add    BYTE PTR [eax],al
     675:	00 02                	add    BYTE PTR [edx],al
     677:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     67d:	01 fb                	add    ebx,edi
     67f:	0e                   	push   cs
     680:	0d 00 01 01 01       	or     eax,0x1010100
     685:	01 00                	add    DWORD PTR [eax],eax
     687:	00 00                	add    BYTE PTR [eax],al
     689:	01 00                	add    DWORD PTR [eax],eax
     68b:	00 01                	add    BYTE PTR [ecx],al
     68d:	73 72                	jae    701 <sysEnter_Vector-0x12f8ff>
     68f:	63 00                	arpl   WORD PTR [eax],ax
     691:	2f                   	das    
     692:	68 6f 6d 65 2f       	push   0x2f656d6f
     697:	79 6f                	jns    708 <sysEnter_Vector-0x12f8f8>
     699:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     6a0:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     6a3:	73 73                	jae    718 <sysEnter_Vector-0x12f8e8>
     6a5:	2f                   	das    
     6a6:	6c                   	ins    BYTE PTR es:[edi],dx
     6a7:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     6ae:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     6b4:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     6ba:	78 2d                	js     6e9 <sysEnter_Vector-0x12f917>
     6bc:	67 6e                	outs   dx,BYTE PTR ds:[si]
     6be:	75 2f                	jne    6ef <sysEnter_Vector-0x12f911>
     6c0:	35 2e 33 2e 30       	xor    eax,0x302e332e
     6c5:	2f                   	das    
     6c6:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     6cd:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     6d0:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     6d4:	65 00 00             	add    BYTE PTR gs:[eax],al
     6d7:	6d                   	ins    DWORD PTR es:[edi],dx
     6d8:	65                   	gs
     6d9:	6d                   	ins    DWORD PTR es:[edi],dx
     6da:	63 70 79             	arpl   WORD PTR [eax+0x79],si
     6dd:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     6e0:	01 00                	add    DWORD PTR [eax],eax
     6e2:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     6e5:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     6ec:	63 
     6ed:	2e                   	cs
     6ee:	68 00 02 00 00       	push   0x200
     6f3:	74 69                	je     75e <sysEnter_Vector-0x12f8a2>
     6f5:	6d                   	ins    DWORD PTR es:[edi],dx
     6f6:	65                   	gs
     6f7:	2e                   	cs
     6f8:	68 00 03 00 00       	push   0x300
     6fd:	73 74                	jae    773 <sysEnter_Vector-0x12f88d>
     6ff:	64                   	fs
     700:	64                   	fs
     701:	65                   	gs
     702:	66                   	data16
     703:	2e                   	cs
     704:	68 00 02 00 00       	push   0x200
     709:	6d                   	ins    DWORD PTR es:[edi],dx
     70a:	61                   	popa   
     70b:	6c                   	ins    BYTE PTR es:[edi],dx
     70c:	6c                   	ins    BYTE PTR es:[edi],dx
     70d:	6f                   	outs   dx,DWORD PTR ds:[esi]
     70e:	63 2e                	arpl   WORD PTR [esi],bp
     710:	68 00 03 00 00       	push   0x300
     715:	6c                   	ins    BYTE PTR es:[edi],dx
     716:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     71d:	4f                   	dec    edi
     71e:	53                   	push   ebx
     71f:	2e                   	cs
     720:	68 00 03 00 00       	push   0x300
     725:	00 00                	add    BYTE PTR [eax],al
     727:	05 02 24 09 00       	add    eax,0x92402
     72c:	30 03                	xor    BYTE PTR [ebx],al
     72e:	0a 01                	or     al,BYTE PTR [ecx]
     730:	f5                   	cmc    
     731:	d7                   	xlat   BYTE PTR ds:[ebx]
     732:	d7                   	xlat   BYTE PTR ds:[ebx]
     733:	68 91 67 68 83       	push   0x83686791
     738:	91                   	xchg   ecx,eax
     739:	91                   	xchg   ecx,eax
     73a:	2f                   	das    
     73b:	08 1f                	or     BYTE PTR [edi],bl
     73d:	e8 08 57 ca 84       	call   84ca5e4a <ticksToWait+0x54ca29aa>
     742:	68 83 67 68 83       	push   0x83686783
     747:	91                   	xchg   ecx,eax
     748:	91                   	xchg   ecx,eax
     749:	2f                   	das    
     74a:	08 1f                	or     BYTE PTR [edi],bl
     74c:	e8 08 57 ca 5c       	call   5cca5e59 <ticksToWait+0x2cca29b9>
     751:	67 68 83 67 67 2f    	addr16 push 0x2f676783
     757:	08 2d e8 08 65 ca    	or     BYTE PTR ds:0xca6508e8,ch
     75d:	3e 02 02             	add    al,BYTE PTR ds:[edx]
     760:	00 01                	add    BYTE PTR [ecx],al
     762:	01 d0                	add    eax,edx
     764:	00 00                	add    BYTE PTR [eax],al
     766:	00 02                	add    BYTE PTR [edx],al
     768:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     76e:	01 fb                	add    ebx,edi
     770:	0e                   	push   cs
     771:	0d 00 01 01 01       	or     eax,0x1010100
     776:	01 00                	add    DWORD PTR [eax],eax
     778:	00 00                	add    BYTE PTR [eax],al
     77a:	01 00                	add    DWORD PTR [eax],eax
     77c:	00 01                	add    BYTE PTR [ecx],al
     77e:	73 72                	jae    7f2 <sysEnter_Vector-0x12f80e>
     780:	63 00                	arpl   WORD PTR [eax],ax
     782:	2f                   	das    
     783:	68 6f 6d 65 2f       	push   0x2f656d6f
     788:	79 6f                	jns    7f9 <sysEnter_Vector-0x12f807>
     78a:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     791:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     794:	73 73                	jae    809 <sysEnter_Vector-0x12f7f7>
     796:	2f                   	das    
     797:	6c                   	ins    BYTE PTR es:[edi],dx
     798:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     79f:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     7a5:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     7ab:	78 2d                	js     7da <sysEnter_Vector-0x12f826>
     7ad:	67 6e                	outs   dx,BYTE PTR ds:[si]
     7af:	75 2f                	jne    7e0 <sysEnter_Vector-0x12f820>
     7b1:	35 2e 33 2e 30       	xor    eax,0x302e332e
     7b6:	2f                   	das    
     7b7:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     7be:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     7c1:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     7c5:	65 00 00             	add    BYTE PTR gs:[eax],al
     7c8:	6d                   	ins    DWORD PTR es:[edi],dx
     7c9:	65                   	gs
     7ca:	6d                   	ins    DWORD PTR es:[edi],dx
     7cb:	73 65                	jae    832 <sysEnter_Vector-0x12f7ce>
     7cd:	74 2e                	je     7fd <sysEnter_Vector-0x12f803>
     7cf:	63 00                	arpl   WORD PTR [eax],ax
     7d1:	01 00                	add    DWORD PTR [eax],eax
     7d3:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     7d6:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     7dd:	63 
     7de:	2e                   	cs
     7df:	68 00 02 00 00       	push   0x200
     7e4:	73 74                	jae    85a <sysEnter_Vector-0x12f7a6>
     7e6:	64                   	fs
     7e7:	64                   	fs
     7e8:	65                   	gs
     7e9:	66                   	data16
     7ea:	2e                   	cs
     7eb:	68 00 02 00 00       	push   0x200
     7f0:	74 69                	je     85b <sysEnter_Vector-0x12f7a5>
     7f2:	6d                   	ins    DWORD PTR es:[edi],dx
     7f3:	65                   	gs
     7f4:	2e                   	cs
     7f5:	68 00 03 00 00       	push   0x300
     7fa:	6d                   	ins    DWORD PTR es:[edi],dx
     7fb:	61                   	popa   
     7fc:	6c                   	ins    BYTE PTR es:[edi],dx
     7fd:	6c                   	ins    BYTE PTR es:[edi],dx
     7fe:	6f                   	outs   dx,DWORD PTR ds:[esi]
     7ff:	63 2e                	arpl   WORD PTR [esi],bp
     801:	68 00 03 00 00       	push   0x300
     806:	6c                   	ins    BYTE PTR es:[edi],dx
     807:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     80e:	4f                   	dec    edi
     80f:	53                   	push   ebx
     810:	2e                   	cs
     811:	68 00 03 00 00       	push   0x300
     816:	00 00                	add    BYTE PTR [eax],al
     818:	05 02 c0 0a 00       	add    eax,0xac002
     81d:	30 1a                	xor    BYTE PTR [edx],bl
     81f:	f3 67 67 08 83 67 08 	repz addr32 or BYTE PTR [bp+di+0x867],al
     826:	ca 9f 2f             	retf   0x2f9f
     829:	d5 bd                	aad    0xbd
     82b:	9f                   	lahf   
     82c:	2f                   	das    
     82d:	f1                   	icebp  
     82e:	bf d5 cb 3d 02       	mov    edi,0x23dcbd5
     833:	02 00                	add    al,BYTE PTR [eax]
     835:	01 01                	add    DWORD PTR [ecx],eax
     837:	e0 00                	loopne 839 <sysEnter_Vector-0x12f7c7>
     839:	00 00                	add    BYTE PTR [eax],al
     83b:	02 00                	add    al,BYTE PTR [eax]
     83d:	bc 00 00 00 01       	mov    esp,0x1000000
     842:	01 fb                	add    ebx,edi
     844:	0e                   	push   cs
     845:	0d 00 01 01 01       	or     eax,0x1010100
     84a:	01 00                	add    DWORD PTR [eax],eax
     84c:	00 00                	add    BYTE PTR [eax],al
     84e:	01 00                	add    DWORD PTR [eax],eax
     850:	00 01                	add    BYTE PTR [ecx],al
     852:	73 72                	jae    8c6 <sysEnter_Vector-0x12f73a>
     854:	63 00                	arpl   WORD PTR [eax],ax
     856:	2e                   	cs
     857:	2e                   	cs
     858:	2f                   	das    
     859:	2e                   	cs
     85a:	2e                   	cs
     85b:	2f                   	das    
     85c:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
     860:	6a 2f                	push   0x2f
     862:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
     865:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
     86c:	6e                   	outs   dx,BYTE PTR ds:[esi]
     86d:	65                   	gs
     86e:	6c                   	ins    BYTE PTR es:[edi],dx
     86f:	2f                   	das    
     870:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     877:	00 2f                	add    BYTE PTR [edi],ch
     879:	68 6f 6d 65 2f       	push   0x2f656d6f
     87e:	79 6f                	jns    8ef <sysEnter_Vector-0x12f711>
     880:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     887:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     88a:	73 73                	jae    8ff <sysEnter_Vector-0x12f701>
     88c:	2f                   	das    
     88d:	6c                   	ins    BYTE PTR es:[edi],dx
     88e:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     895:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     89b:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     8a1:	78 2d                	js     8d0 <sysEnter_Vector-0x12f730>
     8a3:	67 6e                	outs   dx,BYTE PTR ds:[si]
     8a5:	75 2f                	jne    8d6 <sysEnter_Vector-0x12f72a>
     8a7:	35 2e 33 2e 30       	xor    eax,0x302e332e
     8ac:	2f                   	das    
     8ad:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     8b4:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     8b7:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     8bb:	65 00 00             	add    BYTE PTR gs:[eax],al
     8be:	73 74                	jae    934 <sysEnter_Vector-0x12f6cc>
     8c0:	64 69 6f 2e 63 00 01 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x10063
     8c7:	00 
     8c8:	00 64 6c 6c          	add    BYTE PTR [esp+ebp*2+0x6c],ah
     8cc:	69 73 74 2e 68 00 02 	imul   esi,DWORD PTR [ebx+0x74],0x200682e
     8d3:	00 00                	add    BYTE PTR [eax],al
     8d5:	73 74                	jae    94b <sysEnter_Vector-0x12f6b5>
     8d7:	64                   	fs
     8d8:	64                   	fs
     8d9:	65                   	gs
     8da:	66                   	data16
     8db:	2e                   	cs
     8dc:	68 00 03 00 00       	push   0x300
     8e1:	73 74                	jae    957 <sysEnter_Vector-0x12f6a9>
     8e3:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     8ea:	63 
     8eb:	2e                   	cs
     8ec:	68 00 03 00 00       	push   0x300
     8f1:	73 74                	jae    967 <sysEnter_Vector-0x12f699>
     8f3:	64 69 6f 2e 68 00 04 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x40068
     8fa:	00 
     8fb:	00 00                	add    BYTE PTR [eax],al
     8fd:	00 05 02 88 0b 00    	add    BYTE PTR ds:0xb8802,al
     903:	30 03                	xor    BYTE PTR [ebx],al
     905:	0f 01 08             	sidtd  [eax]
     908:	13 08                	adc    ecx,DWORD PTR [eax]
     90a:	59                   	pop    ecx
     90b:	5b                   	pop    ebx
     90c:	08 13                	or     BYTE PTR [ebx],dl
     90e:	f3 5b                	repz pop ebx
     910:	c9                   	leave  
     911:	e5 d7                	in     eax,0xd7
     913:	e5 08                	in     eax,0x8
     915:	67 02 03             	add    al,BYTE PTR [bp+di]
     918:	00 01                	add    BYTE PTR [ecx],al
     91a:	01 cf                	add    edi,ecx
     91c:	00 00                	add    BYTE PTR [eax],al
     91e:	00 02                	add    BYTE PTR [edx],al
     920:	00 a6 00 00 00 01    	add    BYTE PTR [esi+0x1000000],ah
     926:	01 fb                	add    ebx,edi
     928:	0e                   	push   cs
     929:	0d 00 01 01 01       	or     eax,0x1010100
     92e:	01 00                	add    DWORD PTR [eax],eax
     930:	00 00                	add    BYTE PTR [eax],al
     932:	01 00                	add    DWORD PTR [eax],eax
     934:	00 01                	add    BYTE PTR [ecx],al
     936:	73 72                	jae    9aa <sysEnter_Vector-0x12f656>
     938:	63 2f                	arpl   WORD PTR [edi],bp
     93a:	73 74                	jae    9b0 <sysEnter_Vector-0x12f650>
     93c:	72 69                	jb     9a7 <sysEnter_Vector-0x12f659>
     93e:	6e                   	outs   dx,BYTE PTR ds:[esi]
     93f:	67 73 00             	addr16 jae 942 <sysEnter_Vector-0x12f6be>
     942:	2f                   	das    
     943:	68 6f 6d 65 2f       	push   0x2f656d6f
     948:	79 6f                	jns    9b9 <sysEnter_Vector-0x12f647>
     94a:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     951:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     954:	73 73                	jae    9c9 <sysEnter_Vector-0x12f637>
     956:	2f                   	das    
     957:	6c                   	ins    BYTE PTR es:[edi],dx
     958:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     95f:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     965:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     96b:	78 2d                	js     99a <sysEnter_Vector-0x12f666>
     96d:	67 6e                	outs   dx,BYTE PTR ds:[si]
     96f:	75 2f                	jne    9a0 <sysEnter_Vector-0x12f660>
     971:	35 2e 33 2e 30       	xor    eax,0x302e332e
     976:	2f                   	das    
     977:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     97e:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     981:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     985:	65 00 00             	add    BYTE PTR gs:[eax],al
     988:	73 74                	jae    9fe <sysEnter_Vector-0x12f602>
     98a:	72 63                	jb     9ef <sysEnter_Vector-0x12f611>
     98c:	61                   	popa   
     98d:	74 2e                	je     9bd <sysEnter_Vector-0x12f643>
     98f:	63 00                	arpl   WORD PTR [eax],ax
     991:	01 00                	add    DWORD PTR [eax],eax
     993:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     996:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     99d:	63 
     99e:	2e                   	cs
     99f:	68 00 02 00 00       	push   0x200
     9a4:	74 69                	je     a0f <sysEnter_Vector-0x12f5f1>
     9a6:	6d                   	ins    DWORD PTR es:[edi],dx
     9a7:	65                   	gs
     9a8:	2e                   	cs
     9a9:	68 00 03 00 00       	push   0x300
     9ae:	6d                   	ins    DWORD PTR es:[edi],dx
     9af:	61                   	popa   
     9b0:	6c                   	ins    BYTE PTR es:[edi],dx
     9b1:	6c                   	ins    BYTE PTR es:[edi],dx
     9b2:	6f                   	outs   dx,DWORD PTR ds:[esi]
     9b3:	63 2e                	arpl   WORD PTR [esi],bp
     9b5:	68 00 03 00 00       	push   0x300
     9ba:	6c                   	ins    BYTE PTR es:[edi],dx
     9bb:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     9c2:	4f                   	dec    edi
     9c3:	53                   	push   ebx
     9c4:	2e                   	cs
     9c5:	68 00 03 00 00       	push   0x300
     9ca:	00 00                	add    BYTE PTR [eax],al
     9cc:	05 02 30 0c 00       	add    eax,0xc3002
     9d1:	30 03                	xor    BYTE PTR [ebx],al
     9d3:	1d 01 08 21 02       	sbb    eax,0x2210801
     9d8:	24 13                	and    al,0x13
     9da:	3d 5a f5 76 2f       	cmp    eax,0x2f76f55a
     9df:	49                   	dec    ecx
     9e0:	e8 76 2f 08 4b       	call   4b08395b <ticksToWait+0x1b0804bb>
     9e5:	4b                   	dec    ebx
     9e6:	47                   	inc    edi
     9e7:	ea ad 02 03 00 01 01 	jmp    0x101:0x302ad
     9ee:	c5 00                	lds    eax,FWORD PTR [eax]
     9f0:	00 00                	add    BYTE PTR [eax],al
     9f2:	02 00                	add    al,BYTE PTR [eax]
     9f4:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     9f5:	00 00                	add    BYTE PTR [eax],al
     9f7:	00 01                	add    BYTE PTR [ecx],al
     9f9:	01 fb                	add    ebx,edi
     9fb:	0e                   	push   cs
     9fc:	0d 00 01 01 01       	or     eax,0x1010100
     a01:	01 00                	add    DWORD PTR [eax],eax
     a03:	00 00                	add    BYTE PTR [eax],al
     a05:	01 00                	add    DWORD PTR [eax],eax
     a07:	00 01                	add    BYTE PTR [ecx],al
     a09:	73 72                	jae    a7d <sysEnter_Vector-0x12f583>
     a0b:	63 2f                	arpl   WORD PTR [edi],bp
     a0d:	73 74                	jae    a83 <sysEnter_Vector-0x12f57d>
     a0f:	72 69                	jb     a7a <sysEnter_Vector-0x12f586>
     a11:	6e                   	outs   dx,BYTE PTR ds:[esi]
     a12:	67 73 00             	addr16 jae a15 <sysEnter_Vector-0x12f5eb>
     a15:	2f                   	das    
     a16:	68 6f 6d 65 2f       	push   0x2f656d6f
     a1b:	79 6f                	jns    a8c <sysEnter_Vector-0x12f574>
     a1d:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     a24:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     a27:	73 73                	jae    a9c <sysEnter_Vector-0x12f564>
     a29:	2f                   	das    
     a2a:	6c                   	ins    BYTE PTR es:[edi],dx
     a2b:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     a32:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     a38:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     a3e:	78 2d                	js     a6d <sysEnter_Vector-0x12f593>
     a40:	67 6e                	outs   dx,BYTE PTR ds:[si]
     a42:	75 2f                	jne    a73 <sysEnter_Vector-0x12f58d>
     a44:	35 2e 33 2e 30       	xor    eax,0x302e332e
     a49:	2f                   	das    
     a4a:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     a51:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     a54:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     a58:	65 00 00             	add    BYTE PTR gs:[eax],al
     a5b:	73 74                	jae    ad1 <sysEnter_Vector-0x12f52f>
     a5d:	72 63                	jb     ac2 <sysEnter_Vector-0x12f53e>
     a5f:	6d                   	ins    DWORD PTR es:[edi],dx
     a60:	70 2e                	jo     a90 <sysEnter_Vector-0x12f570>
     a62:	63 00                	arpl   WORD PTR [eax],ax
     a64:	01 00                	add    DWORD PTR [eax],eax
     a66:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     a69:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     a70:	63 
     a71:	2e                   	cs
     a72:	68 00 02 00 00       	push   0x200
     a77:	74 69                	je     ae2 <sysEnter_Vector-0x12f51e>
     a79:	6d                   	ins    DWORD PTR es:[edi],dx
     a7a:	65                   	gs
     a7b:	2e                   	cs
     a7c:	68 00 03 00 00       	push   0x300
     a81:	6d                   	ins    DWORD PTR es:[edi],dx
     a82:	61                   	popa   
     a83:	6c                   	ins    BYTE PTR es:[edi],dx
     a84:	6c                   	ins    BYTE PTR es:[edi],dx
     a85:	6f                   	outs   dx,DWORD PTR ds:[esi]
     a86:	63 2e                	arpl   WORD PTR [esi],bp
     a88:	68 00 03 00 00       	push   0x300
     a8d:	6c                   	ins    BYTE PTR es:[edi],dx
     a8e:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     a95:	4f                   	dec    edi
     a96:	53                   	push   ebx
     a97:	2e                   	cs
     a98:	68 00 03 00 00       	push   0x300
     a9d:	00 00                	add    BYTE PTR [eax],al
     a9f:	05 02 e0 0c 00       	add    eax,0xce002
     aa4:	30 03                	xor    BYTE PTR [ebx],al
     aa6:	18 01                	sbb    BYTE PTR [ecx],al
     aa8:	08 21                	or     BYTE PTR [ecx],ah
     aaa:	3d 41 ad ad 67       	cmp    eax,0x67adad41
     aaf:	d8 92 bb 02 07 00    	fcom   DWORD PTR [edx+0x702bb]
     ab5:	01 01                	add    DWORD PTR [ecx],eax
     ab7:	d8 00                	fadd   DWORD PTR [eax]
     ab9:	00 00                	add    BYTE PTR [eax],al
     abb:	02 00                	add    al,BYTE PTR [eax]
     abd:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     abe:	00 00                	add    BYTE PTR [eax],al
     ac0:	00 01                	add    BYTE PTR [ecx],al
     ac2:	01 fb                	add    ebx,edi
     ac4:	0e                   	push   cs
     ac5:	0d 00 01 01 01       	or     eax,0x1010100
     aca:	01 00                	add    DWORD PTR [eax],eax
     acc:	00 00                	add    BYTE PTR [eax],al
     ace:	01 00                	add    DWORD PTR [eax],eax
     ad0:	00 01                	add    BYTE PTR [ecx],al
     ad2:	73 72                	jae    b46 <sysEnter_Vector-0x12f4ba>
     ad4:	63 2f                	arpl   WORD PTR [edi],bp
     ad6:	73 74                	jae    b4c <sysEnter_Vector-0x12f4b4>
     ad8:	72 69                	jb     b43 <sysEnter_Vector-0x12f4bd>
     ada:	6e                   	outs   dx,BYTE PTR ds:[esi]
     adb:	67 73 00             	addr16 jae ade <sysEnter_Vector-0x12f522>
     ade:	2f                   	das    
     adf:	68 6f 6d 65 2f       	push   0x2f656d6f
     ae4:	79 6f                	jns    b55 <sysEnter_Vector-0x12f4ab>
     ae6:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     aed:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     af0:	73 73                	jae    b65 <sysEnter_Vector-0x12f49b>
     af2:	2f                   	das    
     af3:	6c                   	ins    BYTE PTR es:[edi],dx
     af4:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     afb:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     b01:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     b07:	78 2d                	js     b36 <sysEnter_Vector-0x12f4ca>
     b09:	67 6e                	outs   dx,BYTE PTR ds:[si]
     b0b:	75 2f                	jne    b3c <sysEnter_Vector-0x12f4c4>
     b0d:	35 2e 33 2e 30       	xor    eax,0x302e332e
     b12:	2f                   	das    
     b13:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     b1a:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     b1d:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     b21:	65 00 00             	add    BYTE PTR gs:[eax],al
     b24:	73 74                	jae    b9a <sysEnter_Vector-0x12f466>
     b26:	72 63                	jb     b8b <sysEnter_Vector-0x12f475>
     b28:	70 79                	jo     ba3 <sysEnter_Vector-0x12f45d>
     b2a:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     b2d:	01 00                	add    DWORD PTR [eax],eax
     b2f:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     b32:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     b39:	63 
     b3a:	2e                   	cs
     b3b:	68 00 02 00 00       	push   0x200
     b40:	74 69                	je     bab <sysEnter_Vector-0x12f455>
     b42:	6d                   	ins    DWORD PTR es:[edi],dx
     b43:	65                   	gs
     b44:	2e                   	cs
     b45:	68 00 03 00 00       	push   0x300
     b4a:	6d                   	ins    DWORD PTR es:[edi],dx
     b4b:	61                   	popa   
     b4c:	6c                   	ins    BYTE PTR es:[edi],dx
     b4d:	6c                   	ins    BYTE PTR es:[edi],dx
     b4e:	6f                   	outs   dx,DWORD PTR ds:[esi]
     b4f:	63 2e                	arpl   WORD PTR [esi],bp
     b51:	68 00 03 00 00       	push   0x300
     b56:	6c                   	ins    BYTE PTR es:[edi],dx
     b57:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     b5e:	4f                   	dec    edi
     b5f:	53                   	push   ebx
     b60:	2e                   	cs
     b61:	68 00 03 00 00       	push   0x300
     b66:	00 00                	add    BYTE PTR [eax],al
     b68:	05 02 40 0d 00       	add    eax,0xd4002
     b6d:	30 16                	xor    BYTE PTR [esi],dl
     b6f:	f3 67 00 02          	repz add BYTE PTR [bp+si],al
     b73:	04 01                	add    al,0x1
     b75:	06                   	push   es
     b76:	20 06                	and    BYTE PTR [esi],al
     b78:	08 ca                	or     dl,cl
     b7a:	67 3d 32 f3 67 00    	addr16 cmp eax,0x67f332
     b80:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
     b83:	06                   	push   es
     b84:	20 00                	and    BYTE PTR [eax],al
     b86:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     b89:	08 c8                	or     al,cl
     b8b:	06                   	push   es
     b8c:	ca 3d 02             	retf   0x23d
     b8f:	02 00                	add    al,BYTE PTR [eax]
     b91:	01 01                	add    DWORD PTR [ecx],eax
     b93:	8d 00                	lea    eax,[eax]
     b95:	00 00                	add    BYTE PTR [eax],al
     b97:	02 00                	add    al,BYTE PTR [eax]
     b99:	74 00                	je     b9b <sysEnter_Vector-0x12f465>
     b9b:	00 00                	add    BYTE PTR [eax],al
     b9d:	01 01                	add    DWORD PTR [ecx],eax
     b9f:	fb                   	sti    
     ba0:	0e                   	push   cs
     ba1:	0d 00 01 01 01       	or     eax,0x1010100
     ba6:	01 00                	add    DWORD PTR [eax],eax
     ba8:	00 00                	add    BYTE PTR [eax],al
     baa:	01 00                	add    DWORD PTR [eax],eax
     bac:	00 01                	add    BYTE PTR [ecx],al
     bae:	73 72                	jae    c22 <sysEnter_Vector-0x12f3de>
     bb0:	63 2f                	arpl   WORD PTR [edi],bp
     bb2:	73 74                	jae    c28 <sysEnter_Vector-0x12f3d8>
     bb4:	72 69                	jb     c1f <sysEnter_Vector-0x12f3e1>
     bb6:	6e                   	outs   dx,BYTE PTR ds:[esi]
     bb7:	67 73 00             	addr16 jae bba <sysEnter_Vector-0x12f446>
     bba:	2f                   	das    
     bbb:	68 6f 6d 65 2f       	push   0x2f656d6f
     bc0:	79 6f                	jns    c31 <sysEnter_Vector-0x12f3cf>
     bc2:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     bc9:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     bcc:	73 73                	jae    c41 <sysEnter_Vector-0x12f3bf>
     bce:	2f                   	das    
     bcf:	6c                   	ins    BYTE PTR es:[edi],dx
     bd0:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     bd7:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     bdd:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     be3:	78 2d                	js     c12 <sysEnter_Vector-0x12f3ee>
     be5:	67 6e                	outs   dx,BYTE PTR ds:[si]
     be7:	75 2f                	jne    c18 <sysEnter_Vector-0x12f3e8>
     be9:	35 2e 33 2e 30       	xor    eax,0x302e332e
     bee:	2f                   	das    
     bef:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     bf6:	00 00                	add    BYTE PTR [eax],al
     bf8:	73 74                	jae    c6e <sysEnter_Vector-0x12f392>
     bfa:	72 6c                	jb     c68 <sysEnter_Vector-0x12f398>
     bfc:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     bfe:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     c01:	01 00                	add    DWORD PTR [eax],eax
     c03:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     c06:	64                   	fs
     c07:	64                   	fs
     c08:	65                   	gs
     c09:	66                   	data16
     c0a:	2e                   	cs
     c0b:	68 00 02 00 00       	push   0x200
     c10:	00 00                	add    BYTE PTR [eax],al
     c12:	05 02 c8 0d 00       	add    eax,0xdc802
     c17:	30 14 f3             	xor    BYTE PTR [ebx+esi*8],dl
     c1a:	75 2f                	jne    c4b <sysEnter_Vector-0x12f3b5>
     c1c:	49                   	dec    ecx
     c1d:	e6 3d                	out    0x3d,al
     c1f:	02 02                	add    al,BYTE PTR [edx]
     c21:	00 01                	add    BYTE PTR [ecx],al
     c23:	01 a5 00 00 00 02    	add    DWORD PTR [ebp+0x2000000],esp
     c29:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
     c2c:	00 00                	add    BYTE PTR [eax],al
     c2e:	01 01                	add    DWORD PTR [ecx],eax
     c30:	fb                   	sti    
     c31:	0e                   	push   cs
     c32:	0d 00 01 01 01       	or     eax,0x1010100
     c37:	01 00                	add    DWORD PTR [eax],eax
     c39:	00 00                	add    BYTE PTR [eax],al
     c3b:	01 00                	add    DWORD PTR [eax],eax
     c3d:	00 01                	add    BYTE PTR [ecx],al
     c3f:	73 72                	jae    cb3 <sysEnter_Vector-0x12f34d>
     c41:	63 2f                	arpl   WORD PTR [edi],bp
     c43:	73 74                	jae    cb9 <sysEnter_Vector-0x12f347>
     c45:	72 69                	jb     cb0 <sysEnter_Vector-0x12f350>
     c47:	6e                   	outs   dx,BYTE PTR ds:[esi]
     c48:	67 73 00             	addr16 jae c4b <sysEnter_Vector-0x12f3b5>
     c4b:	2f                   	das    
     c4c:	68 6f 6d 65 2f       	push   0x2f656d6f
     c51:	79 6f                	jns    cc2 <sysEnter_Vector-0x12f33e>
     c53:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     c5a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     c5d:	73 73                	jae    cd2 <sysEnter_Vector-0x12f32e>
     c5f:	2f                   	das    
     c60:	6c                   	ins    BYTE PTR es:[edi],dx
     c61:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     c68:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     c6e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     c74:	78 2d                	js     ca3 <sysEnter_Vector-0x12f35d>
     c76:	67 6e                	outs   dx,BYTE PTR ds:[si]
     c78:	75 2f                	jne    ca9 <sysEnter_Vector-0x12f357>
     c7a:	35 2e 33 2e 30       	xor    eax,0x302e332e
     c7f:	2f                   	das    
     c80:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     c87:	00 00                	add    BYTE PTR [eax],al
     c89:	73 74                	jae    cff <sysEnter_Vector-0x12f301>
     c8b:	72 6e                	jb     cfb <sysEnter_Vector-0x12f305>
     c8d:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
     c90:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     c93:	01 00                	add    DWORD PTR [eax],eax
     c95:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     c98:	64                   	fs
     c99:	64                   	fs
     c9a:	65                   	gs
     c9b:	66                   	data16
     c9c:	2e                   	cs
     c9d:	68 00 02 00 00       	push   0x200
     ca2:	00 00                	add    BYTE PTR [eax],al
     ca4:	05 02 fc 0d 00       	add    eax,0xdfc02
     ca9:	30 03                	xor    BYTE PTR [ebx],al
     cab:	0c 01                	or     al,0x1
     cad:	c9                   	leave  
     cae:	2f                   	das    
     caf:	f3 00 02             	repz add BYTE PTR [edx],al
     cb2:	04 01                	add    al,0x1
     cb4:	06                   	push   es
     cb5:	f2 00 02             	repnz add BYTE PTR [edx],al
     cb8:	04 02                	add    al,0x2
     cba:	74 06                	je     cc2 <sysEnter_Vector-0x12f33e>
     cbc:	75 9f                	jne    c5d <sysEnter_Vector-0x12f3a3>
     cbe:	70 00                	jo     cc0 <sysEnter_Vector-0x12f340>
     cc0:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     cc3:	06                   	push   es
     cc4:	ba 06 6b 59 02       	mov    edx,0x2596b06
     cc9:	02 00                	add    al,BYTE PTR [eax]
     ccb:	01 01                	add    DWORD PTR [ecx],eax
     ccd:	9d                   	popf   
     cce:	00 00                	add    BYTE PTR [eax],al
     cd0:	00 02                	add    BYTE PTR [edx],al
     cd2:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
     cd5:	00 00                	add    BYTE PTR [eax],al
     cd7:	01 01                	add    DWORD PTR [ecx],eax
     cd9:	fb                   	sti    
     cda:	0e                   	push   cs
     cdb:	0d 00 01 01 01       	or     eax,0x1010100
     ce0:	01 00                	add    DWORD PTR [eax],eax
     ce2:	00 00                	add    BYTE PTR [eax],al
     ce4:	01 00                	add    DWORD PTR [eax],eax
     ce6:	00 01                	add    BYTE PTR [ecx],al
     ce8:	73 72                	jae    d5c <sysEnter_Vector-0x12f2a4>
     cea:	63 2f                	arpl   WORD PTR [edi],bp
     cec:	73 74                	jae    d62 <sysEnter_Vector-0x12f29e>
     cee:	72 69                	jb     d59 <sysEnter_Vector-0x12f2a7>
     cf0:	6e                   	outs   dx,BYTE PTR ds:[esi]
     cf1:	67 73 00             	addr16 jae cf4 <sysEnter_Vector-0x12f30c>
     cf4:	2f                   	das    
     cf5:	68 6f 6d 65 2f       	push   0x2f656d6f
     cfa:	79 6f                	jns    d6b <sysEnter_Vector-0x12f295>
     cfc:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     d03:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     d06:	73 73                	jae    d7b <sysEnter_Vector-0x12f285>
     d08:	2f                   	das    
     d09:	6c                   	ins    BYTE PTR es:[edi],dx
     d0a:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     d11:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     d17:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     d1d:	78 2d                	js     d4c <sysEnter_Vector-0x12f2b4>
     d1f:	67 6e                	outs   dx,BYTE PTR ds:[si]
     d21:	75 2f                	jne    d52 <sysEnter_Vector-0x12f2ae>
     d23:	35 2e 33 2e 30       	xor    eax,0x302e332e
     d28:	2f                   	das    
     d29:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     d30:	00 00                	add    BYTE PTR [eax],al
     d32:	73 74                	jae    da8 <sysEnter_Vector-0x12f258>
     d34:	72 6e                	jb     da4 <sysEnter_Vector-0x12f25c>
     d36:	63 70 79             	arpl   WORD PTR [eax+0x79],si
     d39:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     d3c:	01 00                	add    DWORD PTR [eax],eax
     d3e:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     d41:	64                   	fs
     d42:	64                   	fs
     d43:	65                   	gs
     d44:	66                   	data16
     d45:	2e                   	cs
     d46:	68 00 02 00 00       	push   0x200
     d4b:	00 00                	add    BYTE PTR [eax],al
     d4d:	05 02 64 0e 00       	add    eax,0xe6402
     d52:	30 03                	xor    BYTE PTR [ebx],al
     d54:	0d 01 f3 67 2f       	or     eax,0x2f67f301
     d59:	08 67 48             	or     BYTE PTR [edi+0x48],ah
     d5c:	00 02                	add    BYTE PTR [edx],al
     d5e:	04 01                	add    al,0x1
     d60:	06                   	push   es
     d61:	66 06                	pushw  es
     d63:	a2 2f bb 48 6a       	mov    ds:0x6a48bb2f,al
     d68:	3d 02 02 00 01       	cmp    eax,0x1000202
     d6d:	01 53 01             	add    DWORD PTR [ebx+0x1],edx
     d70:	00 00                	add    BYTE PTR [eax],al
     d72:	02 00                	add    al,BYTE PTR [eax]
     d74:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     d75:	00 00                	add    BYTE PTR [eax],al
     d77:	00 01                	add    BYTE PTR [ecx],al
     d79:	01 fb                	add    ebx,edi
     d7b:	0e                   	push   cs
     d7c:	0d 00 01 01 01       	or     eax,0x1010100
     d81:	01 00                	add    DWORD PTR [eax],eax
     d83:	00 00                	add    BYTE PTR [eax],al
     d85:	01 00                	add    DWORD PTR [eax],eax
     d87:	00 01                	add    BYTE PTR [ecx],al
     d89:	73 72                	jae    dfd <sysEnter_Vector-0x12f203>
     d8b:	63 2f                	arpl   WORD PTR [edi],bp
     d8d:	73 74                	jae    e03 <sysEnter_Vector-0x12f1fd>
     d8f:	72 69                	jb     dfa <sysEnter_Vector-0x12f206>
     d91:	6e                   	outs   dx,BYTE PTR ds:[esi]
     d92:	67 73 00             	addr16 jae d95 <sysEnter_Vector-0x12f26b>
     d95:	2f                   	das    
     d96:	68 6f 6d 65 2f       	push   0x2f656d6f
     d9b:	79 6f                	jns    e0c <sysEnter_Vector-0x12f1f4>
     d9d:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     da4:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     da7:	73 73                	jae    e1c <sysEnter_Vector-0x12f1e4>
     da9:	2f                   	das    
     daa:	6c                   	ins    BYTE PTR es:[edi],dx
     dab:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     db2:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     db8:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     dbe:	78 2d                	js     ded <sysEnter_Vector-0x12f213>
     dc0:	67 6e                	outs   dx,BYTE PTR ds:[si]
     dc2:	75 2f                	jne    df3 <sysEnter_Vector-0x12f20d>
     dc4:	35 2e 33 2e 30       	xor    eax,0x302e332e
     dc9:	2f                   	das    
     dca:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     dd1:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     dd4:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     dd8:	65 00 00             	add    BYTE PTR gs:[eax],al
     ddb:	73 74                	jae    e51 <sysEnter_Vector-0x12f1af>
     ddd:	72 6f                	jb     e4e <sysEnter_Vector-0x12f1b2>
     ddf:	75 6c                	jne    e4d <sysEnter_Vector-0x12f1b3>
     de1:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     de4:	01 00                	add    DWORD PTR [eax],eax
     de6:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     de9:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     df0:	63 
     df1:	2e                   	cs
     df2:	68 00 02 00 00       	push   0x200
     df7:	74 69                	je     e62 <sysEnter_Vector-0x12f19e>
     df9:	6d                   	ins    DWORD PTR es:[edi],dx
     dfa:	65                   	gs
     dfb:	2e                   	cs
     dfc:	68 00 03 00 00       	push   0x300
     e01:	6d                   	ins    DWORD PTR es:[edi],dx
     e02:	61                   	popa   
     e03:	6c                   	ins    BYTE PTR es:[edi],dx
     e04:	6c                   	ins    BYTE PTR es:[edi],dx
     e05:	6f                   	outs   dx,DWORD PTR ds:[esi]
     e06:	63 2e                	arpl   WORD PTR [esi],bp
     e08:	68 00 03 00 00       	push   0x300
     e0d:	6c                   	ins    BYTE PTR es:[edi],dx
     e0e:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     e15:	4f                   	dec    edi
     e16:	53                   	push   ebx
     e17:	2e                   	cs
     e18:	68 00 03 00 00       	push   0x300
     e1d:	00 00                	add    BYTE PTR [eax],al
     e1f:	05 02 c4 0e 00       	add    eax,0xec402
     e24:	30 03                	xor    BYTE PTR [ebx],al
     e26:	3b 01                	cmp    eax,DWORD PTR [ecx]
     e28:	08 2f                	or     BYTE PTR [edi],ch
     e2a:	40                   	inc    eax
     e2b:	00 02                	add    BYTE PTR [edx],al
     e2d:	04 01                	add    al,0x1
     e2f:	7a 00                	jp     e31 <sysEnter_Vector-0x12f1cf>
     e31:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     e34:	ad                   	lods   eax,DWORD PTR ds:[esi]
     e35:	59                   	pop    ecx
     e36:	59                   	pop    ecx
     e37:	75 c9                	jne    e02 <sysEnter_Vector-0x12f1fe>
     e39:	59                   	pop    ecx
     e3a:	ad                   	lods   eax,DWORD PTR ds:[esi]
     e3b:	00 02                	add    BYTE PTR [edx],al
     e3d:	04 02                	add    al,0x2
     e3f:	06                   	push   es
     e40:	66                   	data16
     e41:	00 02                	add    BYTE PTR [edx],al
     e43:	04 03                	add    al,0x3
     e45:	66 06                	pushw  es
     e47:	59                   	pop    ecx
     e48:	00 02                	add    BYTE PTR [edx],al
     e4a:	04 01                	add    al,0x1
     e4c:	06                   	push   es
     e4d:	74 06                	je     e55 <sysEnter_Vector-0x12f1ab>
     e4f:	75 91                	jne    de2 <sysEnter_Vector-0x12f21e>
     e51:	3d 76 67 00 02       	cmp    eax,0x2006776
     e56:	04 01                	add    al,0x1
     e58:	06                   	push   es
     e59:	58                   	pop    eax
     e5a:	00 02                	add    BYTE PTR [edx],al
     e5c:	04 02                	add    al,0x2
     e5e:	74 00                	je     e60 <sysEnter_Vector-0x12f1a0>
     e60:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
     e63:	58                   	pop    eax
     e64:	06                   	push   es
     e65:	3d 08 21 08 2f       	cmp    eax,0x2f082108
     e6a:	9f                   	lahf   
     e6b:	83 59 c9 00          	sbb    DWORD PTR [ecx-0x37],0x0
     e6f:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     e72:	06                   	push   es
     e73:	58                   	pop    eax
     e74:	00 02                	add    BYTE PTR [edx],al
     e76:	04 03                	add    al,0x3
     e78:	58                   	pop    eax
     e79:	00 02                	add    BYTE PTR [edx],al
     e7b:	04 04                	add    al,0x4
     e7d:	74 00                	je     e7f <sysEnter_Vector-0x12f181>
     e7f:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
     e82:	58                   	pop    eax
     e83:	06                   	push   es
     e84:	31 5a 00             	xor    DWORD PTR [edx+0x0],ebx
     e87:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     e8a:	06                   	push   es
     e8b:	66                   	data16
     e8c:	00 02                	add    BYTE PTR [edx],al
     e8e:	04 02                	add    al,0x2
     e90:	58                   	pop    eax
     e91:	00 02                	add    BYTE PTR [edx],al
     e93:	04 03                	add    al,0x3
     e95:	58                   	pop    eax
     e96:	06                   	push   es
     e97:	67 76 59             	addr16 jbe ef3 <sysEnter_Vector-0x12f10d>
     e9a:	67 03 72 4a          	add    esi,DWORD PTR [bp+si+0x4a]
     e9e:	03 10                	add    edx,DWORD PTR [eax]
     ea0:	ac                   	lods   al,BYTE PTR ds:[esi]
     ea1:	03 76 2e             	add    esi,DWORD PTR [esi+0x2e]
     ea4:	3e 03 09             	add    ecx,DWORD PTR ds:[ecx]
     ea7:	20 67 75             	and    BYTE PTR [edi+0x75],ah
     eaa:	67 2f                	addr16 das 
     eac:	67 00 02             	add    BYTE PTR [bp+si],al
     eaf:	04 01                	add    al,0x1
     eb1:	06                   	push   es
     eb2:	66                   	data16
     eb3:	00 02                	add    BYTE PTR [edx],al
     eb5:	04 02                	add    al,0x2
     eb7:	58                   	pop    eax
     eb8:	00 02                	add    BYTE PTR [edx],al
     eba:	04 04                	add    al,0x4
     ebc:	3c 06                	cmp    al,0x6
     ebe:	59                   	pop    ecx
     ebf:	2f                   	das    
     ec0:	02 08                	add    cl,BYTE PTR [eax]
     ec2:	00 01                	add    BYTE PTR [ecx],al
     ec4:	01 43 00             	add    DWORD PTR [ebx+0x0],eax
     ec7:	00 00                	add    BYTE PTR [eax],al
     ec9:	02 00                	add    al,BYTE PTR [eax]
     ecb:	2d 00 00 00 01       	sub    eax,0x1000000
     ed0:	01 fb                	add    ebx,edi
     ed2:	0e                   	push   cs
     ed3:	0d 00 01 01 01       	or     eax,0x1010100
     ed8:	01 00                	add    DWORD PTR [eax],eax
     eda:	00 00                	add    BYTE PTR [eax],al
     edc:	01 00                	add    DWORD PTR [eax],eax
     ede:	00 01                	add    BYTE PTR [ecx],al
     ee0:	73 72                	jae    f54 <sysEnter_Vector-0x12f0ac>
     ee2:	63 2f                	arpl   WORD PTR [edi],bp
     ee4:	73 74                	jae    f5a <sysEnter_Vector-0x12f0a6>
     ee6:	72 69                	jb     f51 <sysEnter_Vector-0x12f0af>
     ee8:	6e                   	outs   dx,BYTE PTR ds:[esi]
     ee9:	67 73 00             	addr16 jae eec <sysEnter_Vector-0x12f114>
     eec:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     eef:	72 70                	jb     f61 <sysEnter_Vector-0x12f09f>
     ef1:	61                   	popa   
     ef2:	72 74                	jb     f68 <sysEnter_Vector-0x12f098>
     ef4:	73 2e                	jae    f24 <sysEnter_Vector-0x12f0dc>
     ef6:	63 00                	arpl   WORD PTR [eax],ax
     ef8:	01 00                	add    DWORD PTR [eax],eax
     efa:	00 00                	add    BYTE PTR [eax],al
     efc:	00 05 02 44 10 00    	add    BYTE PTR ds:0x104402,al
     f02:	30 13                	xor    BYTE PTR [ebx],dl
     f04:	c9                   	leave  
     f05:	ad                   	lods   eax,DWORD PTR ds:[esi]
     f06:	3d 02 02 00 01       	cmp    eax,0x1000202
     f0b:	01 7f 01             	add    DWORD PTR [edi+0x1],edi
     f0e:	00 00                	add    BYTE PTR [eax],al
     f10:	02 00                	add    al,BYTE PTR [eax]
     f12:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     f13:	00 00                	add    BYTE PTR [eax],al
     f15:	00 01                	add    BYTE PTR [ecx],al
     f17:	01 fb                	add    ebx,edi
     f19:	0e                   	push   cs
     f1a:	0d 00 01 01 01       	or     eax,0x1010100
     f1f:	01 00                	add    DWORD PTR [eax],eax
     f21:	00 00                	add    BYTE PTR [eax],al
     f23:	01 00                	add    DWORD PTR [eax],eax
     f25:	00 01                	add    BYTE PTR [ecx],al
     f27:	73 72                	jae    f9b <sysEnter_Vector-0x12f065>
     f29:	63 2f                	arpl   WORD PTR [edi],bp
     f2b:	73 74                	jae    fa1 <sysEnter_Vector-0x12f05f>
     f2d:	72 69                	jb     f98 <sysEnter_Vector-0x12f068>
     f2f:	6e                   	outs   dx,BYTE PTR ds:[esi]
     f30:	67 73 00             	addr16 jae f33 <sysEnter_Vector-0x12f0cd>
     f33:	2f                   	das    
     f34:	68 6f 6d 65 2f       	push   0x2f656d6f
     f39:	79 6f                	jns    faa <sysEnter_Vector-0x12f056>
     f3b:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     f42:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     f45:	73 73                	jae    fba <sysEnter_Vector-0x12f046>
     f47:	2f                   	das    
     f48:	6c                   	ins    BYTE PTR es:[edi],dx
     f49:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     f50:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     f56:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     f5c:	78 2d                	js     f8b <sysEnter_Vector-0x12f075>
     f5e:	67 6e                	outs   dx,BYTE PTR ds:[si]
     f60:	75 2f                	jne    f91 <sysEnter_Vector-0x12f06f>
     f62:	35 2e 33 2e 30       	xor    eax,0x302e332e
     f67:	2f                   	das    
     f68:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     f6f:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     f72:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     f76:	65 00 00             	add    BYTE PTR gs:[eax],al
     f79:	73 74                	jae    fef <sysEnter_Vector-0x12f011>
     f7b:	72 74                	jb     ff1 <sysEnter_Vector-0x12f00f>
     f7d:	6f                   	outs   dx,DWORD PTR ds:[esi]
     f7e:	6c                   	ins    BYTE PTR es:[edi],dx
     f7f:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     f82:	01 00                	add    DWORD PTR [eax],eax
     f84:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     f87:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     f8e:	63 
     f8f:	2e                   	cs
     f90:	68 00 02 00 00       	push   0x200
     f95:	74 69                	je     1000 <sysEnter_Vector-0x12f000>
     f97:	6d                   	ins    DWORD PTR es:[edi],dx
     f98:	65                   	gs
     f99:	2e                   	cs
     f9a:	68 00 03 00 00       	push   0x300
     f9f:	6d                   	ins    DWORD PTR es:[edi],dx
     fa0:	61                   	popa   
     fa1:	6c                   	ins    BYTE PTR es:[edi],dx
     fa2:	6c                   	ins    BYTE PTR es:[edi],dx
     fa3:	6f                   	outs   dx,DWORD PTR ds:[esi]
     fa4:	63 2e                	arpl   WORD PTR [esi],bp
     fa6:	68 00 03 00 00       	push   0x300
     fab:	6c                   	ins    BYTE PTR es:[edi],dx
     fac:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     fb3:	4f                   	dec    edi
     fb4:	53                   	push   ebx
     fb5:	2e                   	cs
     fb6:	68 00 03 00 00       	push   0x300
     fbb:	00 00                	add    BYTE PTR [eax],al
     fbd:	05 02 64 10 00       	add    eax,0x106402
     fc2:	30 03                	xor    BYTE PTR [ebx],al
     fc4:	d7                   	xlat   BYTE PTR ds:[ebx]
     fc5:	00 01                	add    BYTE PTR [ecx],al
     fc7:	08 2f                	or     BYTE PTR [edi],ch
     fc9:	40                   	inc    eax
     fca:	00 02                	add    BYTE PTR [edx],al
     fcc:	04 01                	add    al,0x1
     fce:	7c 00                	jl     fd0 <sysEnter_Vector-0x12f030>
     fd0:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     fd3:	ad                   	lods   eax,DWORD PTR ds:[esi]
     fd4:	59                   	pop    ecx
     fd5:	59                   	pop    ecx
     fd6:	75 c9                	jne    fa1 <sysEnter_Vector-0x12f05f>
     fd8:	59                   	pop    ecx
     fd9:	ad                   	lods   eax,DWORD PTR ds:[esi]
     fda:	00 02                	add    BYTE PTR [edx],al
     fdc:	04 02                	add    al,0x2
     fde:	06                   	push   es
     fdf:	66                   	data16
     fe0:	00 02                	add    BYTE PTR [edx],al
     fe2:	04 03                	add    al,0x3
     fe4:	66 06                	pushw  es
     fe6:	59                   	pop    ecx
     fe7:	00 02                	add    BYTE PTR [edx],al
     fe9:	04 01                	add    al,0x1
     feb:	06                   	push   es
     fec:	74 06                	je     ff4 <sysEnter_Vector-0x12f00c>
     fee:	75 91                	jne    f81 <sysEnter_Vector-0x12f07f>
     ff0:	3d 76 67 00 02       	cmp    eax,0x2006776
     ff5:	04 01                	add    al,0x1
     ff7:	06                   	push   es
     ff8:	58                   	pop    eax
     ff9:	00 02                	add    BYTE PTR [edx],al
     ffb:	04 02                	add    al,0x2
     ffd:	74 00                	je     fff <sysEnter_Vector-0x12f001>
     fff:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1002:	58                   	pop    eax
    1003:	06                   	push   es
    1004:	03 13                	add    edx,DWORD PTR [ebx]
    1006:	3c 00                	cmp    al,0x0
    1008:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    100b:	06                   	push   es
    100c:	66                   	data16
    100d:	00 02                	add    BYTE PTR [edx],al
    100f:	04 02                	add    al,0x2
    1011:	74 00                	je     1013 <sysEnter_Vector-0x12efed>
    1013:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1016:	06                   	push   es
    1017:	59                   	pop    ecx
    1018:	00 02                	add    BYTE PTR [edx],al
    101a:	04 04                	add    al,0x4
    101c:	08 3d 00 02 04 04    	or     BYTE PTR ds:0x4040200,bh
    1022:	f3 9f                	repz lahf 
    1024:	83 59 c9 00          	sbb    DWORD PTR [ecx-0x37],0x0
    1028:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    102b:	06                   	push   es
    102c:	58                   	pop    eax
    102d:	00 02                	add    BYTE PTR [edx],al
    102f:	04 03                	add    al,0x3
    1031:	58                   	pop    eax
    1032:	00 02                	add    BYTE PTR [edx],al
    1034:	04 04                	add    al,0x4
    1036:	74 00                	je     1038 <sysEnter_Vector-0x12efc8>
    1038:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    103b:	58                   	pop    eax
    103c:	06                   	push   es
    103d:	31 5a 00             	xor    DWORD PTR [edx+0x0],ebx
    1040:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1043:	06                   	push   es
    1044:	66                   	data16
    1045:	00 02                	add    BYTE PTR [edx],al
    1047:	04 02                	add    al,0x2
    1049:	58                   	pop    eax
    104a:	00 02                	add    BYTE PTR [edx],al
    104c:	04 03                	add    al,0x3
    104e:	58                   	pop    eax
    104f:	06                   	push   es
    1050:	59                   	pop    ecx
    1051:	76 59                	jbe    10ac <sysEnter_Vector-0x12ef54>
    1053:	67 03 72 4a          	add    esi,DWORD PTR [bp+si+0x4a]
    1057:	03 10                	add    edx,DWORD PTR [eax]
    1059:	ac                   	lods   al,BYTE PTR ds:[esi]
    105a:	03 76 2e             	add    esi,DWORD PTR [esi+0x2e]
    105d:	3e 03 09             	add    ecx,DWORD PTR ds:[ecx]
    1060:	20 67 00             	and    BYTE PTR [edi+0x0],ah
    1063:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1066:	06                   	push   es
    1067:	66                   	data16
    1068:	00 02                	add    BYTE PTR [edx],al
    106a:	04 02                	add    al,0x2
    106c:	74 00                	je     106e <sysEnter_Vector-0x12ef92>
    106e:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1071:	58                   	pop    eax
    1072:	06                   	push   es
    1073:	4b                   	dec    ebx
    1074:	67 2f                	addr16 das 
    1076:	67 00 02             	add    BYTE PTR [bp+si],al
    1079:	04 01                	add    al,0x1
    107b:	06                   	push   es
    107c:	66                   	data16
    107d:	00 02                	add    BYTE PTR [edx],al
    107f:	04 02                	add    al,0x2
    1081:	58                   	pop    eax
    1082:	00 02                	add    BYTE PTR [edx],al
    1084:	04 04                	add    al,0x4
    1086:	3c 06                	cmp    al,0x6
    1088:	59                   	pop    ecx
    1089:	2f                   	das    
    108a:	02 08                	add    cl,BYTE PTR [eax]
    108c:	00 01                	add    BYTE PTR [ecx],al
    108e:	01 08                	add    DWORD PTR [eax],ecx
    1090:	01 00                	add    DWORD PTR [eax],eax
    1092:	00 02                	add    BYTE PTR [edx],al
    1094:	00 a7 00 00 00 01    	add    BYTE PTR [edi+0x1000000],ah
    109a:	01 fb                	add    ebx,edi
    109c:	0e                   	push   cs
    109d:	0d 00 01 01 01       	or     eax,0x1010100
    10a2:	01 00                	add    DWORD PTR [eax],eax
    10a4:	00 00                	add    BYTE PTR [eax],al
    10a6:	01 00                	add    DWORD PTR [eax],eax
    10a8:	00 01                	add    BYTE PTR [ecx],al
    10aa:	73 72                	jae    111e <sysEnter_Vector-0x12eee2>
    10ac:	63 2f                	arpl   WORD PTR [edi],bp
    10ae:	73 74                	jae    1124 <sysEnter_Vector-0x12eedc>
    10b0:	72 69                	jb     111b <sysEnter_Vector-0x12eee5>
    10b2:	6e                   	outs   dx,BYTE PTR ds:[esi]
    10b3:	67 73 00             	addr16 jae 10b6 <sysEnter_Vector-0x12ef4a>
    10b6:	2f                   	das    
    10b7:	68 6f 6d 65 2f       	push   0x2f656d6f
    10bc:	79 6f                	jns    112d <sysEnter_Vector-0x12eed3>
    10be:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    10c5:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    10c8:	73 73                	jae    113d <sysEnter_Vector-0x12eec3>
    10ca:	2f                   	das    
    10cb:	6c                   	ins    BYTE PTR es:[edi],dx
    10cc:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    10d3:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    10d9:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    10df:	78 2d                	js     110e <sysEnter_Vector-0x12eef2>
    10e1:	67 6e                	outs   dx,BYTE PTR ds:[si]
    10e3:	75 2f                	jne    1114 <sysEnter_Vector-0x12eeec>
    10e5:	35 2e 33 2e 30       	xor    eax,0x302e332e
    10ea:	2f                   	das    
    10eb:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    10f2:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    10f5:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    10f9:	65 00 00             	add    BYTE PTR gs:[eax],al
    10fc:	73 74                	jae    1172 <sysEnter_Vector-0x12ee8e>
    10fe:	72 74                	jb     1174 <sysEnter_Vector-0x12ee8c>
    1100:	72 69                	jb     116b <sysEnter_Vector-0x12ee95>
    1102:	6d                   	ins    DWORD PTR es:[edi],dx
    1103:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
    1106:	01 00                	add    DWORD PTR [eax],eax
    1108:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    110b:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    1112:	63 
    1113:	2e                   	cs
    1114:	68 00 02 00 00       	push   0x200
    1119:	74 69                	je     1184 <sysEnter_Vector-0x12ee7c>
    111b:	6d                   	ins    DWORD PTR es:[edi],dx
    111c:	65                   	gs
    111d:	2e                   	cs
    111e:	68 00 03 00 00       	push   0x300
    1123:	6d                   	ins    DWORD PTR es:[edi],dx
    1124:	61                   	popa   
    1125:	6c                   	ins    BYTE PTR es:[edi],dx
    1126:	6c                   	ins    BYTE PTR es:[edi],dx
    1127:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1128:	63 2e                	arpl   WORD PTR [esi],bp
    112a:	68 00 03 00 00       	push   0x300
    112f:	6c                   	ins    BYTE PTR es:[edi],dx
    1130:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    1137:	4f                   	dec    edi
    1138:	53                   	push   ebx
    1139:	2e                   	cs
    113a:	68 00 03 00 00       	push   0x300
    113f:	00 00                	add    BYTE PTR [eax],al
    1141:	05 02 00 12 00       	add    eax,0x120002
    1146:	30 16                	xor    BYTE PTR [esi],dl
    1148:	08 21                	or     BYTE PTR [ecx],ah
    114a:	85 08                	test   DWORD PTR [eax],ecx
    114c:	3d 00 02 04 02       	cmp    eax,0x2040200
    1151:	06                   	push   es
    1152:	2e 00 02             	add    BYTE PTR cs:[edx],al
    1155:	04 01                	add    al,0x1
    1157:	9e                   	sahf   
    1158:	06                   	push   es
    1159:	08 21                	or     BYTE PTR [ecx],ah
    115b:	f4                   	hlt    
    115c:	93                   	xchg   ebx,eax
    115d:	08 67 00             	or     BYTE PTR [edi+0x0],ah
    1160:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
    1163:	06                   	push   es
    1164:	2e 00 02             	add    BYTE PTR cs:[edx],al
    1167:	04 01                	add    al,0x1
    1169:	9e                   	sahf   
    116a:	06                   	push   es
    116b:	08 21                	or     BYTE PTR [ecx],ah
    116d:	08 15 59 5b 08 21    	or     BYTE PTR ds:0x21085b59,dl
    1173:	85 08                	test   DWORD PTR [eax],ecx
    1175:	13 00                	adc    eax,DWORD PTR [eax]
    1177:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
    117a:	06                   	push   es
    117b:	2e 00 02             	add    BYTE PTR cs:[edx],al
    117e:	04 01                	add    al,0x1
    1180:	9e                   	sahf   
    1181:	06                   	push   es
    1182:	f3 76 93             	repz jbe 1118 <sysEnter_Vector-0x12eee8>
    1185:	08 3d 00 02 04 02    	or     BYTE PTR ds:0x2040200,bh
    118b:	06                   	push   es
    118c:	2e 00 02             	add    BYTE PTR cs:[edx],al
    118f:	04 01                	add    al,0x1
    1191:	9e                   	sahf   
    1192:	06                   	push   es
    1193:	f3 e7 3d             	repz out 0x3d,eax
    1196:	02 05 00 01 01 27    	add    al,BYTE PTR ds:0x27010100
    119c:	03 00                	add    eax,DWORD PTR [eax]
    119e:	00 02                	add    BYTE PTR [edx],al
    11a0:	00 cc                	add    ah,cl
    11a2:	00 00                	add    BYTE PTR [eax],al
    11a4:	00 01                	add    BYTE PTR [ecx],al
    11a6:	01 fb                	add    ebx,edi
    11a8:	0e                   	push   cs
    11a9:	0d 00 01 01 01       	or     eax,0x1010100
    11ae:	01 00                	add    DWORD PTR [eax],eax
    11b0:	00 00                	add    BYTE PTR [eax],al
    11b2:	01 00                	add    DWORD PTR [eax],eax
    11b4:	00 01                	add    BYTE PTR [ecx],al
    11b6:	73 72                	jae    122a <sysEnter_Vector-0x12edd6>
    11b8:	63 00                	arpl   WORD PTR [eax],ax
    11ba:	2f                   	das    
    11bb:	68 6f 6d 65 2f       	push   0x2f656d6f
    11c0:	79 6f                	jns    1231 <sysEnter_Vector-0x12edcf>
    11c2:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    11c9:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    11cc:	73 73                	jae    1241 <sysEnter_Vector-0x12edbf>
    11ce:	2f                   	das    
    11cf:	6c                   	ins    BYTE PTR es:[edi],dx
    11d0:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    11d7:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    11dd:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    11e3:	78 2d                	js     1212 <sysEnter_Vector-0x12edee>
    11e5:	67 6e                	outs   dx,BYTE PTR ds:[si]
    11e7:	75 2f                	jne    1218 <sysEnter_Vector-0x12ede8>
    11e9:	35 2e 33 2e 30       	xor    eax,0x302e332e
    11ee:	2f                   	das    
    11ef:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    11f6:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    11f9:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    11fd:	65 00 2e             	add    BYTE PTR gs:[esi],ch
    1200:	2e                   	cs
    1201:	2f                   	das    
    1202:	2e                   	cs
    1203:	2e                   	cs
    1204:	2f                   	das    
    1205:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
    1209:	6a 2f                	push   0x2f
    120b:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
    120e:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
    1215:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1216:	65                   	gs
    1217:	6c                   	ins    BYTE PTR es:[edi],dx
    1218:	2f                   	das    
    1219:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    1220:	00 00                	add    BYTE PTR [eax],al
    1222:	74 69                	je     128d <sysEnter_Vector-0x12ed73>
    1224:	6d                   	ins    DWORD PTR es:[edi],dx
    1225:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax
    1229:	01 00                	add    DWORD PTR [eax],eax
    122b:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    122e:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    1235:	63 
    1236:	2e                   	cs
    1237:	68 00 02 00 00       	push   0x200
    123c:	74 69                	je     12a7 <sysEnter_Vector-0x12ed59>
    123e:	6d                   	ins    DWORD PTR es:[edi],dx
    123f:	65                   	gs
    1240:	2e                   	cs
    1241:	68 00 03 00 00       	push   0x300
    1246:	6d                   	ins    DWORD PTR es:[edi],dx
    1247:	61                   	popa   
    1248:	6c                   	ins    BYTE PTR es:[edi],dx
    1249:	6c                   	ins    BYTE PTR es:[edi],dx
    124a:	6f                   	outs   dx,DWORD PTR ds:[esi]
    124b:	63 2e                	arpl   WORD PTR [esi],bp
    124d:	68 00 03 00 00       	push   0x300
    1252:	6c                   	ins    BYTE PTR es:[edi],dx
    1253:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    125a:	4f                   	dec    edi
    125b:	53                   	push   ebx
    125c:	2e                   	cs
    125d:	68 00 03 00 00       	push   0x300
    1262:	73 79                	jae    12dd <sysEnter_Vector-0x12ed23>
    1264:	73 63                	jae    12c9 <sysEnter_Vector-0x12ed37>
    1266:	61                   	popa   
    1267:	6c                   	ins    BYTE PTR es:[edi],dx
    1268:	6c                   	ins    BYTE PTR es:[edi],dx
    1269:	73 2e                	jae    1299 <sysEnter_Vector-0x12ed67>
    126b:	68 00 04 00 00       	push   0x400
    1270:	00 00                	add    BYTE PTR [eax],al
    1272:	05 02 54 13 00       	add    eax,0x135402
    1277:	30 03                	xor    BYTE PTR [ebx],al
    1279:	2e                   	cs
    127a:	01 f3                	add    ebx,esi
    127c:	75 c9                	jne    1247 <sysEnter_Vector-0x12edb9>
    127e:	3d 31 08 21 84       	cmp    eax,0x84210831
    1283:	76 02                	jbe    1287 <sysEnter_Vector-0x12ed79>
    1285:	24 13                	and    al,0x13
    1287:	08 22                	or     BYTE PTR [edx],ah
    1289:	02 2e                	add    ch,BYTE PTR [esi]
    128b:	13 02                	adc    eax,DWORD PTR [edx]
    128d:	2f                   	das    
    128e:	13 08                	adc    ecx,DWORD PTR [eax]
    1290:	67 02 2d             	add    ch,BYTE PTR [di]
    1293:	13 2f                	adc    ebp,DWORD PTR [edi]
    1295:	00 02                	add    BYTE PTR [edx],al
    1297:	04 01                	add    al,0x1
    1299:	06                   	push   es
    129a:	9e                   	sahf   
    129b:	00 02                	add    BYTE PTR [edx],al
    129d:	04 04                	add    al,0x4
    129f:	02 23                	add    ah,BYTE PTR [ebx]
    12a1:	12 00                	adc    al,BYTE PTR [eax]
    12a3:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    12aa:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    12ad:	74 00                	je     12af <sysEnter_Vector-0x12ed51>
    12af:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    12b2:	58                   	pop    eax
    12b3:	00 02                	add    BYTE PTR [edx],al
    12b5:	04 08                	add    al,0x8
    12b7:	06                   	push   es
    12b8:	3d 48 00 02 04       	cmp    eax,0x4020048
    12bd:	01 06                	add    DWORD PTR [esi],eax
    12bf:	9e                   	sahf   
    12c0:	00 02                	add    BYTE PTR [edx],al
    12c2:	04 04                	add    al,0x4
    12c4:	02 23                	add    ah,BYTE PTR [ebx]
    12c6:	12 00                	adc    al,BYTE PTR [eax]
    12c8:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    12cf:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    12d2:	74 00                	je     12d4 <sysEnter_Vector-0x12ed2c>
    12d4:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    12d7:	58                   	pop    eax
    12d8:	06                   	push   es
    12d9:	94                   	xchg   esp,eax
    12da:	e5 91                	in     eax,0x91
    12dc:	9f                   	lahf   
    12dd:	59                   	pop    ecx
    12de:	00 02                	add    BYTE PTR [edx],al
    12e0:	04 01                	add    al,0x1
    12e2:	06                   	push   es
    12e3:	9e                   	sahf   
    12e4:	00 02                	add    BYTE PTR [edx],al
    12e6:	04 04                	add    al,0x4
    12e8:	02 23                	add    ah,BYTE PTR [ebx]
    12ea:	12 00                	adc    al,BYTE PTR [eax]
    12ec:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    12f3:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    12f6:	74 00                	je     12f8 <sysEnter_Vector-0x12ed08>
    12f8:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    12fb:	58                   	pop    eax
    12fc:	00 02                	add    BYTE PTR [edx],al
    12fe:	04 08                	add    al,0x8
    1300:	06                   	push   es
    1301:	08 9f e2 00 02 04    	or     BYTE PTR [edi+0x40200e2],bl
    1307:	01 06                	add    DWORD PTR [esi],eax
    1309:	9e                   	sahf   
    130a:	00 02                	add    BYTE PTR [edx],al
    130c:	04 04                	add    al,0x4
    130e:	02 23                	add    ah,BYTE PTR [ebx]
    1310:	12 00                	adc    al,BYTE PTR [eax]
    1312:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    1319:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    131c:	74 00                	je     131e <sysEnter_Vector-0x12ece2>
    131e:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1321:	58                   	pop    eax
    1322:	06                   	push   es
    1323:	08 f6                	or     dh,dh
    1325:	d7                   	xlat   BYTE PTR ds:[ebx]
    1326:	9f                   	lahf   
    1327:	3d 68 08 16 08       	cmp    eax,0x8160868
    132c:	3d 08 4b 5a 08       	cmp    eax,0x85a4b08
    1331:	15 08 3d 08 3d       	adc    eax,0x3d083d08
    1336:	5a                   	pop    edx
    1337:	08 44 02 2e          	or     BYTE PTR [edx+eax*1+0x2e],al
    133b:	13 02                	adc    eax,DWORD PTR [edx]
    133d:	3a 13                	cmp    dl,BYTE PTR [ebx]
    133f:	91                   	xchg   ecx,eax
    1340:	c9                   	leave  
    1341:	e6 02                	out    0x2,al
    1343:	2f                   	das    
    1344:	13 02                	adc    eax,DWORD PTR [edx]
    1346:	3c 13                	cmp    al,0x13
    1348:	9f                   	lahf   
    1349:	e5 e6                	in     eax,0xe6
    134b:	08 c9                	or     cl,cl
    134d:	02 2c 13             	add    ch,BYTE PTR [ebx+edx*1]
    1350:	9f                   	lahf   
    1351:	e5 4c                	in     eax,0x4c
    1353:	02 29                	add    ch,BYTE PTR [ecx]
    1355:	13 02                	adc    eax,DWORD PTR [edx]
    1357:	2b 13                	sub    edx,DWORD PTR [ebx]
    1359:	9f                   	lahf   
    135a:	e5 e6                	in     eax,0xe6
    135c:	bb 59 08 83 e5       	mov    ebx,0xe5830859
    1361:	a0 00 02 04 01       	mov    al,ds:0x1040200
    1366:	06                   	push   es
    1367:	c8 00 02 04          	enter  0x200,0x4
    136b:	04 02                	add    al,0x2
    136d:	2c 12                	sub    al,0x12
    136f:	00 02                	add    BYTE PTR [edx],al
    1371:	04 05                	add    al,0x5
    1373:	02 2f                	add    ch,BYTE PTR [edi]
    1375:	12 00                	adc    al,BYTE PTR [eax]
    1377:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    137a:	74 00                	je     137c <sysEnter_Vector-0x12ec84>
    137c:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    137f:	58                   	pop    eax
    1380:	06                   	push   es
    1381:	08 99 a5 59 00 02    	or     BYTE PTR [ecx+0x20059a5],bl
    1387:	04 01                	add    al,0x1
    1389:	06                   	push   es
    138a:	c8 00 02 04          	enter  0x200,0x4
    138e:	04 02                	add    al,0x2
    1390:	2c 12                	sub    al,0x12
    1392:	00 02                	add    BYTE PTR [edx],al
    1394:	04 05                	add    al,0x5
    1396:	02 2f                	add    ch,BYTE PTR [edi]
    1398:	12 00                	adc    al,BYTE PTR [eax]
    139a:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    139d:	74 00                	je     139f <sysEnter_Vector-0x12ec61>
    139f:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    13a2:	58                   	pop    eax
    13a3:	00 02                	add    BYTE PTR [edx],al
    13a5:	04 08                	add    al,0x8
    13a7:	06                   	push   es
    13a8:	08 9f 08 91 9f e0    	or     BYTE PTR [edi-0x1f606ef8],bl
    13ae:	00 02                	add    BYTE PTR [edx],al
    13b0:	04 01                	add    al,0x1
    13b2:	06                   	push   es
    13b3:	c8 00 02 04          	enter  0x200,0x4
    13b7:	04 02                	add    al,0x2
    13b9:	2c 12                	sub    al,0x12
    13bb:	00 02                	add    BYTE PTR [edx],al
    13bd:	04 05                	add    al,0x5
    13bf:	02 2f                	add    ch,BYTE PTR [edi]
    13c1:	12 00                	adc    al,BYTE PTR [eax]
    13c3:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    13c6:	74 00                	je     13c8 <sysEnter_Vector-0x12ec38>
    13c8:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    13cb:	58                   	pop    eax
    13cc:	06                   	push   es
    13cd:	08 f9                	or     cl,bh
    13cf:	bb 75 00 02 04       	mov    ebx,0x4020075
    13d4:	01 06                	add    DWORD PTR [esi],eax
    13d6:	08 2e                	or     BYTE PTR [esi],ch
    13d8:	06                   	push   es
    13d9:	9f                   	lahf   
    13da:	75 75                	jne    1451 <sysEnter_Vector-0x12ebaf>
    13dc:	7b d8                	jnp    13b6 <sysEnter_Vector-0x12ec4a>
    13de:	00 02                	add    BYTE PTR [edx],al
    13e0:	04 01                	add    al,0x1
    13e2:	06                   	push   es
    13e3:	c8 06 75 e5          	enter  0x7506,0xe5
    13e7:	00 02                	add    BYTE PTR [edx],al
    13e9:	04 01                	add    al,0x1
    13eb:	06                   	push   es
    13ec:	02 22                	add    ah,BYTE PTR [edx]
    13ee:	12 06                	adc    al,BYTE PTR [esi]
    13f0:	4b                   	dec    ebx
    13f1:	00 02                	add    BYTE PTR [edx],al
    13f3:	04 01                	add    al,0x1
    13f5:	06                   	push   es
    13f6:	08 ba 00 02 04 03    	or     BYTE PTR [edx+0x3040200],bh
    13fc:	02 22                	add    ah,BYTE PTR [edx]
    13fe:	12 00                	adc    al,BYTE PTR [eax]
    1400:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1403:	74 00                	je     1405 <sysEnter_Vector-0x12ebfb>
    1405:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1408:	58                   	pop    eax
    1409:	00 02                	add    BYTE PTR [edx],al
    140b:	04 06                	add    al,0x6
    140d:	06                   	push   es
    140e:	59                   	pop    ecx
    140f:	00 02                	add    BYTE PTR [edx],al
    1411:	04 01                	add    al,0x1
    1413:	06                   	push   es
    1414:	02 40 12             	add    al,BYTE PTR [eax+0x12]
    1417:	00 02                	add    BYTE PTR [edx],al
    1419:	04 03                	add    al,0x3
    141b:	02 42 12             	add    al,BYTE PTR [edx+0x12]
    141e:	00 02                	add    BYTE PTR [edx],al
    1420:	04 04                	add    al,0x4
    1422:	74 00                	je     1424 <sysEnter_Vector-0x12ebdc>
    1424:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1427:	58                   	pop    eax
    1428:	00 02                	add    BYTE PTR [edx],al
    142a:	04 06                	add    al,0x6
    142c:	06                   	push   es
    142d:	59                   	pop    ecx
    142e:	00 02                	add    BYTE PTR [edx],al
    1430:	04 01                	add    al,0x1
    1432:	06                   	push   es
    1433:	02 43 12             	add    al,BYTE PTR [ebx+0x12]
    1436:	00 02                	add    BYTE PTR [edx],al
    1438:	04 03                	add    al,0x3
    143a:	02 48 12             	add    cl,BYTE PTR [eax+0x12]
    143d:	00 02                	add    BYTE PTR [edx],al
    143f:	04 04                	add    al,0x4
    1441:	74 00                	je     1443 <sysEnter_Vector-0x12ebbd>
    1443:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1446:	58                   	pop    eax
    1447:	00 02                	add    BYTE PTR [edx],al
    1449:	04 06                	add    al,0x6
    144b:	06                   	push   es
    144c:	5a                   	pop    edx
    144d:	00 02                	add    BYTE PTR [edx],al
    144f:	04 06                	add    al,0x6
    1451:	c9                   	leave  
    1452:	2f                   	das    
    1453:	00 02                	add    BYTE PTR [edx],al
    1455:	04 01                	add    al,0x1
    1457:	06                   	push   es
    1458:	9e                   	sahf   
    1459:	00 02                	add    BYTE PTR [edx],al
    145b:	04 04                	add    al,0x4
    145d:	02 23                	add    ah,BYTE PTR [ebx]
    145f:	12 00                	adc    al,BYTE PTR [eax]
    1461:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    1468:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    146b:	74 00                	je     146d <sysEnter_Vector-0x12eb93>
    146d:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1470:	58                   	pop    eax
    1471:	00 02                	add    BYTE PTR [edx],al
    1473:	04 08                	add    al,0x8
    1475:	06                   	push   es
    1476:	08 75 48             	or     BYTE PTR [ebp+0x48],dh
    1479:	e8 bb 00 02 04       	call   4021539 <sysEnter_Vector+0x3ef1539>
    147e:	01 06                	add    DWORD PTR [esi],eax
    1480:	ba 06 4b 68 91       	mov    edx,0x91684b06
    1485:	02 31                	add    dh,BYTE PTR [ecx]
    1487:	14 02                	adc    al,0x2
    1489:	2c 14                	sub    al,0x14
    148b:	00 02                	add    BYTE PTR [edx],al
    148d:	04 01                	add    al,0x1
    148f:	06                   	push   es
    1490:	02 29                	add    ch,BYTE PTR [ecx]
    1492:	12 06                	adc    al,BYTE PTR [esi]
    1494:	4b                   	dec    ebx
    1495:	bd 00 02 04 01       	mov    ebp,0x1040200
    149a:	06                   	push   es
    149b:	ba 00 02 04 03       	mov    edx,0x3040200
    14a0:	06                   	push   es
    14a1:	08 59 00             	or     BYTE PTR [ecx+0x0],bl
    14a4:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
    14a7:	81 4b e5 4c ae 9f ae 	or     DWORD PTR [ebx-0x1b],0xae9fae4c
    14ae:	77 00                	ja     14b0 <sysEnter_Vector-0x12eb50>
    14b0:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    14b3:	06                   	push   es
    14b4:	82                   	(bad)  
    14b5:	06                   	push   es
    14b6:	4b                   	dec    ebx
    14b7:	68 00 02 04 01       	push   0x1040200
    14bc:	06                   	push   es
    14bd:	66 06                	pushw  es
    14bf:	85 3d 02 08 00 01    	test   DWORD PTR ds:0x1000802,edi
    14c5:	01                   	.byte 0x1

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
 5fe:	77 72                	ja     672 <sysEnter_Vector-0x12f98e>
 600:	69 74 65 00 64 65 6e 	imul   esi,DWORD PTR [ebp+eiz*2+0x0],0x746e6564
 607:	74 
 608:	72 79                	jb     683 <sysEnter_Vector-0x12f97d>
 60a:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 60d:	6c                   	ins    BYTE PTR es:[edi],dx
 60e:	65                   	gs
 60f:	5f                   	pop    edi
 610:	74 00                	je     612 <sysEnter_Vector-0x12f9ee>
 612:	75 69                	jne    67d <sysEnter_Vector-0x12f983>
 614:	6e                   	outs   dx,BYTE PTR ds:[esi]
 615:	74 36                	je     64d <sysEnter_Vector-0x12f9b3>
 617:	34 5f                	xor    al,0x5f
 619:	74 00                	je     61b <sysEnter_Vector-0x12f9e5>
 61b:	73 75                	jae    692 <sysEnter_Vector-0x12f96e>
 61d:	70 65                	jo     684 <sysEnter_Vector-0x12f97c>
 61f:	72 5f                	jb     680 <sysEnter_Vector-0x12f980>
 621:	62 6c 6f 63          	bound  ebp,QWORD PTR [edi+ebp*2+0x63]
 625:	6b 00 6d             	imul   eax,DWORD PTR [eax],0x6d
 628:	6e                   	outs   dx,BYTE PTR ds:[esi]
 629:	74 5f                	je     68a <sysEnter_Vector-0x12f976>
 62b:	72 6f                	jb     69c <sysEnter_Vector-0x12f964>
 62d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 62e:	74 00                	je     630 <sysEnter_Vector-0x12f9d0>
 630:	69 5f 76 66 73 6d 6f 	imul   ebx,DWORD PTR [edi+0x76],0x6f6d7366
 637:	75 6e                	jne    6a7 <sysEnter_Vector-0x12f959>
 639:	74 00                	je     63b <sysEnter_Vector-0x12f9c5>
 63b:	66 6f                	outs   dx,WORD PTR ds:[esi]
 63d:	70 73                	jo     6b2 <sysEnter_Vector-0x12f94e>
 63f:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 642:	6e                   	outs   dx,BYTE PTR ds:[esi]
 643:	61                   	popa   
 644:	6d                   	ins    DWORD PTR es:[edi],dx
 645:	65 00 77 72          	add    BYTE PTR gs:[edi+0x72],dh
 649:	69 74 65 43 6f 6e 73 	imul   esi,DWORD PTR [ebp+eiz*2+0x43],0x6f736e6f
 650:	6f 
 651:	6c                   	ins    BYTE PTR es:[edi],dx
 652:	65 00 66 70          	add    BYTE PTR gs:[esi+0x70],ah
 656:	74 72                	je     6ca <sysEnter_Vector-0x12f936>
 658:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 65b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 65c:	64                   	fs
 65d:	65                   	gs
 65e:	5f                   	pop    edi
 65f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 660:	70 65                	jo     6c7 <sysEnter_Vector-0x12f939>
 662:	72 61                	jb     6c5 <sysEnter_Vector-0x12f93b>
 664:	74 69                	je     6cf <sysEnter_Vector-0x12f931>
 666:	6f                   	outs   dx,DWORD PTR ds:[esi]
 667:	6e                   	outs   dx,BYTE PTR ds:[esi]
 668:	73 00                	jae    66a <sysEnter_Vector-0x12f996>
 66a:	73 6c                	jae    6d8 <sysEnter_Vector-0x12f928>
 66c:	69 73 74 68 65 61 64 	imul   esi,DWORD PTR [ebx+0x74],0x64616568
 673:	00 6d 6b             	add    BYTE PTR [ebp+0x6b],ch
 676:	6e                   	outs   dx,BYTE PTR ds:[esi]
 677:	6f                   	outs   dx,DWORD PTR ds:[esi]
 678:	64 00 6d 6e          	add    BYTE PTR fs:[ebp+0x6e],ch
 67c:	74 5f                	je     6dd <sysEnter_Vector-0x12f923>
 67e:	73 62                	jae    6e2 <sysEnter_Vector-0x12f91e>
 680:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 683:	66                   	data16
 684:	6c                   	ins    BYTE PTR es:[edi],dx
 685:	61                   	popa   
 686:	67 73 00             	addr16 jae 689 <sysEnter_Vector-0x12f977>
 689:	72 65                	jb     6f0 <sysEnter_Vector-0x12f910>
 68b:	61                   	popa   
 68c:	64 00 69 5f          	add    BYTE PTR fs:[ecx+0x5f],ch
 690:	64                   	fs
 691:	65                   	gs
 692:	76 00                	jbe    694 <sysEnter_Vector-0x12f96c>
 694:	73 5f                	jae    6f5 <sysEnter_Vector-0x12f90b>
 696:	64                   	fs
 697:	65                   	gs
 698:	76 00                	jbe    69a <sysEnter_Vector-0x12f966>
 69a:	69 5f 75 69 64 00 72 	imul   ebx,DWORD PTR [edi+0x75],0x72006469
 6a1:	65                   	gs
 6a2:	61                   	popa   
 6a3:	64                   	fs
 6a4:	43                   	inc    ebx
 6a5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6a6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6a7:	73 6f                	jae    718 <sysEnter_Vector-0x12f8e8>
 6a9:	6c                   	ins    BYTE PTR es:[edi],dx
 6aa:	65 00 63 72          	add    BYTE PTR gs:[ebx+0x72],ah
 6ae:	65                   	gs
 6af:	61                   	popa   
 6b0:	74 65                	je     717 <sysEnter_Vector-0x12f8e9>
 6b2:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 6b5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6b6:	70 66                	jo     71e <sysEnter_Vector-0x12f8e2>
 6b8:	6c                   	ins    BYTE PTR es:[edi],dx
 6b9:	61                   	popa   
 6ba:	67 73 00             	addr16 jae 6bd <sysEnter_Vector-0x12f943>
 6bd:	64                   	fs
 6be:	5f                   	pop    edi
 6bf:	70 61                	jo     722 <sysEnter_Vector-0x12f8de>
 6c1:	72 65                	jb     728 <sysEnter_Vector-0x12f8d8>
 6c3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6c4:	74 00                	je     6c6 <sysEnter_Vector-0x12f93a>
 6c6:	66 5f                	pop    di
 6c8:	70 61                	jo     72b <sysEnter_Vector-0x12f8d5>
 6ca:	74 68                	je     734 <sysEnter_Vector-0x12f8cc>
 6cc:	00 73 5f             	add    BYTE PTR [ebx+0x5f],dh
 6cf:	72 6f                	jb     740 <sysEnter_Vector-0x12f8c0>
 6d1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6d2:	74 00                	je     6d4 <sysEnter_Vector-0x12f92c>
 6d4:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 6d7:	73 6f                	jae    748 <sysEnter_Vector-0x12f8b8>
 6d9:	6c                   	ins    BYTE PTR es:[edi],dx
 6da:	65                   	gs
 6db:	5f                   	pop    edi
 6dc:	66 69 6c 65 00 72 6d 	imul   bp,WORD PTR [ebp+eiz*2+0x0],0x6d72
 6e3:	64 69 72 00 64 5f 69 	imul   esi,DWORD PTR fs:[edx+0x0],0x6e695f64
 6ea:	6e 
 6eb:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6ec:	64 65 00 69 6e       	fs add BYTE PTR fs:gs:[ecx+0x6e],ch
 6f1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6f2:	64                   	fs
 6f3:	65                   	gs
 6f4:	5f                   	pop    edi
 6f5:	74 00                	je     6f7 <sysEnter_Vector-0x12f909>
 6f7:	69 6f 49 6e 69 74 00 	imul   ebp,DWORD PTR [edi+0x49],0x74696e
 6fe:	64                   	fs
 6ff:	5f                   	pop    edi
 700:	6e                   	outs   dx,BYTE PTR ds:[esi]
 701:	61                   	popa   
 702:	6d                   	ins    DWORD PTR es:[edi],dx
 703:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 707:	63 2f                	arpl   WORD PTR [edi],bp
 709:	73 74                	jae    77f <sysEnter_Vector-0x12f881>
 70b:	64 69 6f 2e 63 00 66 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x5f660063
 712:	5f 
 713:	69 6e 6f 64 65 00 73 	imul   ebp,DWORD PTR [esi+0x6f],0x73006564
 71a:	5f                   	pop    edi
 71b:	6c                   	ins    BYTE PTR es:[edi],dx
 71c:	69 73 74 00 6d 6e 74 	imul   esi,DWORD PTR [ebx+0x74],0x746e6d00
 723:	5f                   	pop    edi
 724:	66                   	data16
 725:	6c                   	ins    BYTE PTR es:[edi],dx
 726:	61                   	popa   
 727:	67 73 00             	addr16 jae 72a <sysEnter_Vector-0x12f8d6>
 72a:	66 69 6c 65 5f 6f 70 	imul   bp,WORD PTR [ebp+eiz*2+0x5f],0x706f
 731:	65                   	gs
 732:	72 61                	jb     795 <sysEnter_Vector-0x12f86b>
 734:	74 69                	je     79f <sysEnter_Vector-0x12f861>
 736:	6f                   	outs   dx,DWORD PTR ds:[esi]
 737:	6e                   	outs   dx,BYTE PTR ds:[esi]
 738:	73 5f                	jae    799 <sysEnter_Vector-0x12f867>
 73a:	74 00                	je     73c <sysEnter_Vector-0x12f8c4>
 73c:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 73f:	73 6f                	jae    7b0 <sysEnter_Vector-0x12f850>
 741:	6c                   	ins    BYTE PTR es:[edi],dx
 742:	65                   	gs
 743:	5f                   	pop    edi
 744:	6e                   	outs   dx,BYTE PTR ds:[esi]
 745:	6f                   	outs   dx,DWORD PTR ds:[esi]
 746:	64 65 00 6d 6b       	fs add BYTE PTR fs:gs:[ebp+0x6b],ch
 74b:	64 69 72 00 69 5f 6d 	imul   esi,DWORD PTR fs:[edx+0x0],0x6f6d5f69
 752:	6f 
 753:	64 65 00 64 6c 6c    	fs add BYTE PTR fs:gs:[esp+ebp*2+0x6c],ah
 759:	69 73 74 5f 74 00 66 	imul   esi,DWORD PTR [ebx+0x74],0x6600745f
 760:	69 6c 65 5f 6f 70 65 	imul   ebp,DWORD PTR [ebp+eiz*2+0x5f],0x7265706f
 767:	72 
 768:	61                   	popa   
 769:	74 69                	je     7d4 <sysEnter_Vector-0x12f82c>
 76b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 76c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 76d:	73 00                	jae    76f <sysEnter_Vector-0x12f891>
 76f:	77 68                	ja     7d9 <sysEnter_Vector-0x12f827>
 771:	61                   	popa   
 772:	74 65                	je     7d9 <sysEnter_Vector-0x12f827>
 774:	76 65                	jbe    7db <sysEnter_Vector-0x12f825>
 776:	72 00                	jb     778 <sysEnter_Vector-0x12f888>
 778:	69 5f 6f 70 00 70 61 	imul   ebx,DWORD PTR [edi+0x6f],0x61700070
 77f:	79 6c                	jns    7ed <sysEnter_Vector-0x12f813>
 781:	6f                   	outs   dx,DWORD PTR ds:[esi]
 782:	61                   	popa   
 783:	64 00 6e 65          	add    BYTE PTR fs:[esi+0x65],ch
 787:	78 74                	js     7fd <sysEnter_Vector-0x12f803>
 789:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 78c:	67 69 64 00 73 74 72 	imul   esp,DWORD PTR [si+0x0],0x63727473
 793:	63 
 794:	61                   	popa   
 795:	74 00                	je     797 <sysEnter_Vector-0x12f869>
 797:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 79a:	63 61 74             	arpl   WORD PTR [ecx+0x74],sp
 79d:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 79f:	61                   	popa   
 7a0:	74 65                	je     807 <sysEnter_Vector-0x12f7f9>
 7a2:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 7a5:	63 2f                	arpl   WORD PTR [edi],bp
 7a7:	73 74                	jae    81d <sysEnter_Vector-0x12f7e3>
 7a9:	72 69                	jb     814 <sysEnter_Vector-0x12f7ec>
 7ab:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7ac:	67 73 2f             	addr16 jae 7de <sysEnter_Vector-0x12f822>
 7af:	73 74                	jae    825 <sysEnter_Vector-0x12f7db>
 7b1:	72 63                	jb     816 <sysEnter_Vector-0x12f7ea>
 7b3:	61                   	popa   
 7b4:	74 2e                	je     7e4 <sysEnter_Vector-0x12f81c>
 7b6:	63 00                	arpl   WORD PTR [eax],ax
 7b8:	73 74                	jae    82e <sysEnter_Vector-0x12f7d2>
 7ba:	72 63                	jb     81f <sysEnter_Vector-0x12f7e1>
 7bc:	6d                   	ins    DWORD PTR es:[edi],dx
 7bd:	70 00                	jo     7bf <sysEnter_Vector-0x12f841>
 7bf:	73 72                	jae    833 <sysEnter_Vector-0x12f7cd>
 7c1:	63 2f                	arpl   WORD PTR [edi],bp
 7c3:	73 74                	jae    839 <sysEnter_Vector-0x12f7c7>
 7c5:	72 69                	jb     830 <sysEnter_Vector-0x12f7d0>
 7c7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7c8:	67 73 2f             	addr16 jae 7fa <sysEnter_Vector-0x12f806>
 7cb:	73 74                	jae    841 <sysEnter_Vector-0x12f7bf>
 7cd:	72 63                	jb     832 <sysEnter_Vector-0x12f7ce>
 7cf:	6d                   	ins    DWORD PTR es:[edi],dx
 7d0:	70 2e                	jo     800 <sysEnter_Vector-0x12f800>
 7d2:	63 00                	arpl   WORD PTR [eax],ax
 7d4:	73 74                	jae    84a <sysEnter_Vector-0x12f7b6>
 7d6:	72 63                	jb     83b <sysEnter_Vector-0x12f7c5>
 7d8:	70 79                	jo     853 <sysEnter_Vector-0x12f7ad>
 7da:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 7dd:	75 6e                	jne    84d <sysEnter_Vector-0x12f7b3>
 7df:	74 00                	je     7e1 <sysEnter_Vector-0x12f81f>
 7e1:	73 74                	jae    857 <sysEnter_Vector-0x12f7a9>
 7e3:	72 63                	jb     848 <sysEnter_Vector-0x12f7b8>
 7e5:	70 79                	jo     860 <sysEnter_Vector-0x12f7a0>
 7e7:	63 00                	arpl   WORD PTR [eax],ax
 7e9:	73 72                	jae    85d <sysEnter_Vector-0x12f7a3>
 7eb:	63 2f                	arpl   WORD PTR [edi],bp
 7ed:	73 74                	jae    863 <sysEnter_Vector-0x12f79d>
 7ef:	72 69                	jb     85a <sysEnter_Vector-0x12f7a6>
 7f1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7f2:	67 73 2f             	addr16 jae 824 <sysEnter_Vector-0x12f7dc>
 7f5:	73 74                	jae    86b <sysEnter_Vector-0x12f795>
 7f7:	72 63                	jb     85c <sysEnter_Vector-0x12f7a4>
 7f9:	70 79                	jo     874 <sysEnter_Vector-0x12f78c>
 7fb:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 7fe:	73 74                	jae    874 <sysEnter_Vector-0x12f78c>
 800:	72 6c                	jb     86e <sysEnter_Vector-0x12f792>
 802:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 804:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 807:	63 2f                	arpl   WORD PTR [edi],bp
 809:	73 74                	jae    87f <sysEnter_Vector-0x12f781>
 80b:	72 69                	jb     876 <sysEnter_Vector-0x12f78a>
 80d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 80e:	67 73 2f             	addr16 jae 840 <sysEnter_Vector-0x12f7c0>
 811:	73 74                	jae    887 <sysEnter_Vector-0x12f779>
 813:	72 6c                	jb     881 <sysEnter_Vector-0x12f77f>
 815:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 817:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 81a:	73 74                	jae    890 <sysEnter_Vector-0x12f770>
 81c:	72 6e                	jb     88c <sysEnter_Vector-0x12f774>
 81e:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 821:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 824:	63 2f                	arpl   WORD PTR [edi],bp
 826:	73 74                	jae    89c <sysEnter_Vector-0x12f764>
 828:	72 69                	jb     893 <sysEnter_Vector-0x12f76d>
 82a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 82b:	67 73 2f             	addr16 jae 85d <sysEnter_Vector-0x12f7a3>
 82e:	73 74                	jae    8a4 <sysEnter_Vector-0x12f75c>
 830:	72 6e                	jb     8a0 <sysEnter_Vector-0x12f760>
 832:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 835:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 838:	73 72                	jae    8ac <sysEnter_Vector-0x12f754>
 83a:	63 2f                	arpl   WORD PTR [edi],bp
 83c:	73 74                	jae    8b2 <sysEnter_Vector-0x12f74e>
 83e:	72 69                	jb     8a9 <sysEnter_Vector-0x12f757>
 840:	6e                   	outs   dx,BYTE PTR ds:[esi]
 841:	67 73 2f             	addr16 jae 873 <sysEnter_Vector-0x12f78d>
 844:	73 74                	jae    8ba <sysEnter_Vector-0x12f746>
 846:	72 6e                	jb     8b6 <sysEnter_Vector-0x12f74a>
 848:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 84b:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 84e:	73 74                	jae    8c4 <sysEnter_Vector-0x12f73c>
 850:	72 6e                	jb     8c0 <sysEnter_Vector-0x12f740>
 852:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 855:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 858:	63 2f                	arpl   WORD PTR [edi],bp
 85a:	73 74                	jae    8d0 <sysEnter_Vector-0x12f730>
 85c:	72 69                	jb     8c7 <sysEnter_Vector-0x12f739>
 85e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 85f:	67 73 2f             	addr16 jae 891 <sysEnter_Vector-0x12f76f>
 862:	73 74                	jae    8d8 <sysEnter_Vector-0x12f728>
 864:	72 6f                	jb     8d5 <sysEnter_Vector-0x12f72b>
 866:	75 6c                	jne    8d4 <sysEnter_Vector-0x12f72c>
 868:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 86b:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 86e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 86f:	66                   	data16
 870:	66                   	data16
 871:	00 63 75             	add    BYTE PTR [ebx+0x75],ah
 874:	74 6c                	je     8e2 <sysEnter_Vector-0x12f71e>
 876:	69 6d 00 73 74 72 74 	imul   ebp,DWORD PTR [ebp+0x0],0x74727473
 87d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 87e:	75 6c                	jne    8ec <sysEnter_Vector-0x12f714>
 880:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 883:	64                   	fs
 884:	70 74                	jo     8fa <sysEnter_Vector-0x12f706>
 886:	72 00                	jb     888 <sysEnter_Vector-0x12f778>
 888:	6e                   	outs   dx,BYTE PTR ds:[esi]
 889:	70 74                	jo     8ff <sysEnter_Vector-0x12f701>
 88b:	72 00                	jb     88d <sysEnter_Vector-0x12f773>
 88d:	62 61 73             	bound  esp,QWORD PTR [ecx+0x73]
 890:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 894:	63 2f                	arpl   WORD PTR [edi],bp
 896:	73 74                	jae    90c <sysEnter_Vector-0x12f6f4>
 898:	72 69                	jb     903 <sysEnter_Vector-0x12f6fd>
 89a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 89b:	67 73 2f             	addr16 jae 8cd <sysEnter_Vector-0x12f733>
 89e:	73 74                	jae    914 <sysEnter_Vector-0x12f6ec>
 8a0:	72 70                	jb     912 <sysEnter_Vector-0x12f6ee>
 8a2:	61                   	popa   
 8a3:	72 74                	jb     919 <sysEnter_Vector-0x12f6e7>
 8a5:	73 2e                	jae    8d5 <sysEnter_Vector-0x12f72b>
 8a7:	63 00                	arpl   WORD PTR [eax],ax
 8a9:	73 74                	jae    91f <sysEnter_Vector-0x12f6e1>
 8ab:	72 6c                	jb     919 <sysEnter_Vector-0x12f6e7>
 8ad:	65                   	gs
 8ae:	66                   	data16
 8af:	74 00                	je     8b1 <sysEnter_Vector-0x12f74f>
 8b1:	73 72                	jae    925 <sysEnter_Vector-0x12f6db>
 8b3:	63 2f                	arpl   WORD PTR [edi],bp
 8b5:	73 74                	jae    92b <sysEnter_Vector-0x12f6d5>
 8b7:	72 69                	jb     922 <sysEnter_Vector-0x12f6de>
 8b9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8ba:	67 73 2f             	addr16 jae 8ec <sysEnter_Vector-0x12f714>
 8bd:	73 74                	jae    933 <sysEnter_Vector-0x12f6cd>
 8bf:	72 74                	jb     935 <sysEnter_Vector-0x12f6cb>
 8c1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 8c2:	6c                   	ins    BYTE PTR es:[edi],dx
 8c3:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8c6:	73 74                	jae    93c <sysEnter_Vector-0x12f6c4>
 8c8:	72 74                	jb     93e <sysEnter_Vector-0x12f6c2>
 8ca:	6f                   	outs   dx,DWORD PTR ds:[esi]
 8cb:	6c                   	ins    BYTE PTR es:[edi],dx
 8cc:	00 6c 65 6e          	add    BYTE PTR [ebp+eiz*2+0x6e],ch
 8d0:	67 74 68             	addr16 je 93b <sysEnter_Vector-0x12f6c5>
 8d3:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 8d6:	61                   	popa   
 8d7:	72 74                	jb     94d <sysEnter_Vector-0x12f6b3>
 8d9:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 8dc:	63 2f                	arpl   WORD PTR [edi],bp
 8de:	73 74                	jae    954 <sysEnter_Vector-0x12f6ac>
 8e0:	72 69                	jb     94b <sysEnter_Vector-0x12f6b5>
 8e2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8e3:	67 73 2f             	addr16 jae 915 <sysEnter_Vector-0x12f6eb>
 8e6:	73 74                	jae    95c <sysEnter_Vector-0x12f6a4>
 8e8:	72 74                	jb     95e <sysEnter_Vector-0x12f6a2>
 8ea:	72 69                	jb     955 <sysEnter_Vector-0x12f6ab>
 8ec:	6d                   	ins    DWORD PTR es:[edi],dx
 8ed:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8f0:	73 74                	jae    966 <sysEnter_Vector-0x12f69a>
 8f2:	72 74                	jb     968 <sysEnter_Vector-0x12f698>
 8f4:	72 69                	jb     95f <sysEnter_Vector-0x12f6a1>
 8f6:	6d                   	ins    DWORD PTR es:[edi],dx
 8f7:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 8fa:	72 74                	jb     970 <sysEnter_Vector-0x12f690>
 8fc:	72 69                	jb     967 <sysEnter_Vector-0x12f699>
 8fe:	6d                   	ins    DWORD PTR es:[edi],dx
 8ff:	32 00                	xor    al,BYTE PTR [eax]
 901:	70 6f                	jo     972 <sysEnter_Vector-0x12f68e>
 903:	69 6e 74 65 72 54 6f 	imul   ebp,DWORD PTR [esi+0x74],0x6f547265
 90a:	53                   	push   ebx
 90b:	74 72                	je     97f <sysEnter_Vector-0x12f681>
 90d:	69 6e 67 00 6c 6f 63 	imul   ebp,DWORD PTR [esi+0x67],0x636f6c00
 914:	61                   	popa   
 915:	6c                   	ins    BYTE PTR es:[edi],dx
 916:	74 69                	je     981 <sysEnter_Vector-0x12f67f>
 918:	6d                   	ins    DWORD PTR es:[edi],dx
 919:	65 00 64 61 79       	add    BYTE PTR gs:[ecx+eiz*2+0x79],ah
 91e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 91f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 920:	00 5f 64             	add    BYTE PTR [edi+0x64],bl
 923:	73 74                	jae    999 <sysEnter_Vector-0x12f667>
 925:	62 69 61             	bound  ebp,QWORD PTR [ecx+0x61]
 928:	73 00                	jae    92a <sysEnter_Vector-0x12f6d6>
 92a:	67 6d                	ins    DWORD PTR es:[di],dx
 92c:	74 69                	je     997 <sysEnter_Vector-0x12f669>
 92e:	6d                   	ins    DWORD PTR es:[edi],dx
 92f:	65                   	gs
 930:	5f                   	pop    edi
 931:	72 00                	jb     933 <sysEnter_Vector-0x12f6cd>
 933:	74 69                	je     99e <sysEnter_Vector-0x12f662>
 935:	6d                   	ins    DWORD PTR es:[edi],dx
 936:	65                   	gs
 937:	72 00                	jb     939 <sysEnter_Vector-0x12f6c7>
 939:	6c                   	ins    BYTE PTR es:[edi],dx
 93a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 93b:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
 93e:	74 69                	je     9a9 <sysEnter_Vector-0x12f657>
 940:	6d                   	ins    DWORD PTR es:[edi],dx
 941:	65                   	gs
 942:	5f                   	pop    edi
 943:	72 00                	jb     945 <sysEnter_Vector-0x12f6bb>
 945:	5f                   	pop    edi
 946:	6d                   	ins    DWORD PTR es:[edi],dx
 947:	6f                   	outs   dx,DWORD PTR ds:[esi]
 948:	6e                   	outs   dx,BYTE PTR ds:[esi]
 949:	74 68                	je     9b3 <sysEnter_Vector-0x12f64d>
 94b:	73 5f                	jae    9ac <sysEnter_Vector-0x12f654>
 94d:	61                   	popa   
 94e:	62 62 72             	bound  esp,QWORD PTR [edx+0x72]
 951:	65                   	gs
 952:	76 00                	jbe    954 <sysEnter_Vector-0x12f6ac>
 954:	5f                   	pop    edi
 955:	74 7a                	je     9d1 <sysEnter_Vector-0x12f62f>
 957:	6e                   	outs   dx,BYTE PTR ds:[esi]
 958:	61                   	popa   
 959:	6d                   	ins    DWORD PTR es:[edi],dx
 95a:	65 00 5f 6d          	add    BYTE PTR gs:[edi+0x6d],bl
 95e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 95f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 960:	74 68                	je     9ca <sysEnter_Vector-0x12f636>
 962:	73 00                	jae    964 <sysEnter_Vector-0x12f69c>
 964:	5f                   	pop    edi
 965:	79 74                	jns    9db <sysEnter_Vector-0x12f625>
 967:	61                   	popa   
 968:	62 00                	bound  eax,QWORD PTR [eax]
 96a:	74 69                	je     9d5 <sysEnter_Vector-0x12f62b>
 96c:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 96f:	54                   	push   esp
 970:	6f                   	outs   dx,DWORD PTR ds:[esi]
 971:	57                   	push   edi
 972:	61                   	popa   
 973:	69 74 00 6d 6b 74 69 	imul   esi,DWORD PTR [eax+eax*1+0x6d],0x6d69746b
 97a:	6d 
 97b:	65 00 64 61 79       	add    BYTE PTR gs:[ecx+eiz*2+0x79],ah
 980:	63 6c 6f 63          	arpl   WORD PTR [edi+ebp*2+0x63],bp
 984:	6b 00 5f             	imul   eax,DWORD PTR [eax],0x5f
 987:	64                   	fs
 988:	61                   	popa   
 989:	79 6c                	jns    9f7 <sysEnter_Vector-0x12f609>
 98b:	69 67 68 74 00 5f 64 	imul   esp,DWORD PTR [edi+0x68],0x645f0074
 992:	61                   	popa   
 993:	79 73                	jns    a08 <sysEnter_Vector-0x12f5f8>
 995:	5f                   	pop    edi
 996:	61                   	popa   
 997:	62 62 72             	bound  esp,QWORD PTR [edx+0x72]
 99a:	65                   	gs
 99b:	76 00                	jbe    99d <sysEnter_Vector-0x12f663>
 99d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 99e:	76 65                	jbe    a05 <sysEnter_Vector-0x12f5fb>
 9a0:	72 66                	jb     a08 <sysEnter_Vector-0x12f5f8>
 9a2:	6c                   	ins    BYTE PTR es:[edi],dx
 9a3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 9a4:	77 00                	ja     9a6 <sysEnter_Vector-0x12f65a>
 9a6:	6d                   	ins    DWORD PTR es:[edi],dx
 9a7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 9a8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 9a9:	74 68                	je     a13 <sysEnter_Vector-0x12f5ed>
 9ab:	00 74 6d 62          	add    BYTE PTR [ebp+ebp*2+0x62],dh
 9af:	75 66                	jne    a17 <sysEnter_Vector-0x12f5e9>
 9b1:	00 5f 64             	add    BYTE PTR [edi+0x64],bl
 9b4:	61                   	popa   
 9b5:	79 73                	jns    a2a <sysEnter_Vector-0x12f5d6>
 9b7:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 9ba:	63 2f                	arpl   WORD PTR [edi],bp
 9bc:	74 69                	je     a27 <sysEnter_Vector-0x12f5d9>
 9be:	6d                   	ins    DWORD PTR es:[edi],dx
 9bf:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax

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
