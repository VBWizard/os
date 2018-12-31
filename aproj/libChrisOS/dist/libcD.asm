
Debug/GNU-Linux/libc.so:     file format elf32-i386


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
30000003:	e8 5a 24 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000008:	05 34 3a 00 00       	add    eax,0x3a34
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
3000003b:	e8 22 24 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000040:	05 fc 39 00 00       	add    eax,0x39fc
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
30000075:	e8 e8 23 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000007a:	05 c2 39 00 00       	add    eax,0x39c2
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
300000ca:	e8 93 23 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300000cf:	05 6d 39 00 00       	add    eax,0x396d
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
30000121:	e8 9a 23 00 00       	call   300024c0 <__x86.get_pc_thunk.bx>
30000126:	81 c3 16 39 00 00    	add    ebx,0x3916
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:45
    static char *lasts;
    register int ch;

    if (s == 0)
3000012c:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
30000130:	75 09                	jne    3000013b <strtok+0x1f>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:46
	s = lasts;
30000132:	8b 83 3c 00 00 00    	mov    eax,DWORD PTR [ebx+0x3c]
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
30000184:	89 83 3c 00 00 00    	mov    DWORD PTR [ebx+0x3c],eax
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:53
    if (*lasts != 0)
3000018a:	8b 83 3c 00 00 00    	mov    eax,DWORD PTR [ebx+0x3c]
30000190:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000193:	84 c0                	test   al,al
30000195:	74 12                	je     300001a9 <strtok+0x8d>
/home/yogi/src/os/aproj/libChrisOS/../../kproj/chrisOS/src/strings/strtok.c:54
	*lasts++ = 0;
30000197:	8b 83 3c 00 00 00    	mov    eax,DWORD PTR [ebx+0x3c]
3000019d:	8d 50 01             	lea    edx,[eax+0x1]
300001a0:	89 93 3c 00 00 00    	mov    DWORD PTR [ebx+0x3c],edx
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

300001b4 <reverseI>:
reverseI():
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:11

#include "ascii.h"
#include "libChrisOS.h"

void reverseI(char s[])
 {
300001b4:	55                   	push   ebp
300001b5:	89 e5                	mov    ebp,esp
300001b7:	53                   	push   ebx
300001b8:	83 ec 14             	sub    esp,0x14
300001bb:	e8 a2 22 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300001c0:	05 7c 38 00 00       	add    eax,0x387c
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:15
     int i, j;
     char c;

     for (i = 0, j = strlenI(s)-1; i<j; i++, j--) {
300001c5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
300001cc:	83 ec 0c             	sub    esp,0xc
300001cf:	ff 75 08             	push   DWORD PTR [ebp+0x8]
300001d2:	89 c3                	mov    ebx,eax
300001d4:	e8 34 11 00 00       	call   3000130d <strlenI>
300001d9:	83 c4 10             	add    esp,0x10
300001dc:	83 e8 01             	sub    eax,0x1
300001df:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
300001e2:	eb 39                	jmp    3000021d <reverseI+0x69>
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:16 (discriminator 3)
         c = s[i];
300001e4:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
300001e7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300001ea:	01 d0                	add    eax,edx
300001ec:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300001ef:	88 45 ef             	mov    BYTE PTR [ebp-0x11],al
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:17 (discriminator 3)
         s[i] = s[j];
300001f2:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
300001f5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300001f8:	01 c2                	add    edx,eax
300001fa:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
300001fd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000200:	01 c8                	add    eax,ecx
30000202:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000205:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:18 (discriminator 3)
         s[j] = c;
30000207:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
3000020a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000020d:	01 c2                	add    edx,eax
3000020f:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
30000213:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:15 (discriminator 3)
void reverseI(char s[])
 {
     int i, j;
     char c;

     for (i = 0, j = strlenI(s)-1; i<j; i++, j--) {
30000215:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
30000219:	83 6d f0 01          	sub    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:15 (discriminator 1)
3000021d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000220:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30000223:	7c bf                	jl     300001e4 <reverseI+0x30>
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:20
         c = s[i];
         s[i] = s[j];
         s[j] = c;
     }
 }
30000225:	90                   	nop
30000226:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000229:	c9                   	leave  
3000022a:	c3                   	ret    

3000022b <itoaI>:
itoaI():
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:23

 void itoaI(int n, char s[])
 {
3000022b:	55                   	push   ebp
3000022c:	89 e5                	mov    ebp,esp
3000022e:	53                   	push   ebx
3000022f:	83 ec 14             	sub    esp,0x14
30000232:	e8 2b 22 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000237:	05 05 38 00 00       	add    eax,0x3805
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:26
     int i, sign;

     if ((sign = n) < 0)  /* record sign */
3000023c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000023f:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
30000242:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30000246:	79 03                	jns    3000024b <itoaI+0x20>
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:27
         n = -n;          /* make n positive */
30000248:	f7 5d 08             	neg    DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:28
     i = 0;
3000024b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:30 (discriminator 1)
     do {       /* generate digits in reverse order */
         s[i++] = n % 10 + '0';   /* get next digit */
30000252:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000255:	8d 50 01             	lea    edx,[eax+0x1]
30000258:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
3000025b:	89 c2                	mov    edx,eax
3000025d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000260:	8d 1c 02             	lea    ebx,[edx+eax*1]
30000263:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
30000266:	ba 67 66 66 66       	mov    edx,0x66666667
3000026b:	89 c8                	mov    eax,ecx
3000026d:	f7 ea                	imul   edx
3000026f:	c1 fa 02             	sar    edx,0x2
30000272:	89 c8                	mov    eax,ecx
30000274:	c1 f8 1f             	sar    eax,0x1f
30000277:	29 c2                	sub    edx,eax
30000279:	89 d0                	mov    eax,edx
3000027b:	c1 e0 02             	shl    eax,0x2
3000027e:	01 d0                	add    eax,edx
30000280:	01 c0                	add    eax,eax
30000282:	29 c1                	sub    ecx,eax
30000284:	89 ca                	mov    edx,ecx
30000286:	89 d0                	mov    eax,edx
30000288:	83 c0 30             	add    eax,0x30
3000028b:	88 03                	mov    BYTE PTR [ebx],al
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:31 (discriminator 1)
     } while ((n /= 10) > 0);     /* delete it */
3000028d:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
30000290:	ba 67 66 66 66       	mov    edx,0x66666667
30000295:	89 c8                	mov    eax,ecx
30000297:	f7 ea                	imul   edx
30000299:	c1 fa 02             	sar    edx,0x2
3000029c:	89 c8                	mov    eax,ecx
3000029e:	c1 f8 1f             	sar    eax,0x1f
300002a1:	29 c2                	sub    edx,eax
300002a3:	89 d0                	mov    eax,edx
300002a5:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
300002a8:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
300002ac:	7f a4                	jg     30000252 <itoaI+0x27>
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:32
     if (sign < 0)
300002ae:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
300002b2:	79 13                	jns    300002c7 <itoaI+0x9c>
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:33
         s[i++] = '-';
300002b4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300002b7:	8d 50 01             	lea    edx,[eax+0x1]
300002ba:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
300002bd:	89 c2                	mov    edx,eax
300002bf:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300002c2:	01 d0                	add    eax,edx
300002c4:	c6 00 2d             	mov    BYTE PTR [eax],0x2d
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:34
     s[i] = '\0';
300002c7:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
300002ca:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300002cd:	01 d0                	add    eax,edx
300002cf:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:35
     reverseI(s);
300002d2:	83 ec 0c             	sub    esp,0xc
300002d5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
300002d8:	e8 d7 fe ff ff       	call   300001b4 <reverseI>
300002dd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:36
 }
300002e0:	90                   	nop
300002e1:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300002e4:	c9                   	leave  
300002e5:	c3                   	ret    

300002e6 <atoi>:
atoi():
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:40

  // A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
VISIBLE int atoi(char *str)
{
300002e6:	55                   	push   ebp
300002e7:	89 e5                	mov    ebp,esp
300002e9:	83 ec 10             	sub    esp,0x10
300002ec:	e8 71 21 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300002f1:	05 4b 37 00 00       	add    eax,0x374b
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:41
    int res = 0; // Initialize result
300002f6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:45
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
300002fd:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
30000304:	eb 28                	jmp    3000032e <atoi+0x48>
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:46 (discriminator 3)
        res = res*10 + str[i] - '0';
30000306:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000309:	89 d0                	mov    eax,edx
3000030b:	c1 e0 02             	shl    eax,0x2
3000030e:	01 d0                	add    eax,edx
30000310:	01 c0                	add    eax,eax
30000312:	89 c1                	mov    ecx,eax
30000314:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30000317:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000031a:	01 d0                	add    eax,edx
3000031c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000031f:	0f be c0             	movsx  eax,al
30000322:	01 c8                	add    eax,ecx
30000324:	83 e8 30             	sub    eax,0x30
30000327:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:45 (discriminator 3)
{
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
3000032a:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:45 (discriminator 1)
3000032e:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30000331:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000334:	01 d0                	add    eax,edx
30000336:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000339:	84 c0                	test   al,al
3000033b:	75 c9                	jne    30000306 <atoi+0x20>
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:49
        res = res*10 + str[i] - '0';
  
    // return result.
    return res;
3000033d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:50
30000340:	c9                   	leave  
30000341:	c3                   	ret    
30000342:	66 90                	xchg   ax,ax

30000344 <puts>:
puts():
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:16
#define PUTSTRING(c) {asm("call sysEnter_Vector\n"::"a" (SYSCALL_WRITE), "b" (STDOUT_FILE), "c" (c));}

extern int printI(const char *format, ...);

VISIBLE void puts(char* buffer)
{
30000344:	55                   	push   ebp
30000345:	89 e5                	mov    ebp,esp
30000347:	53                   	push   ebx
30000348:	e8 15 21 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000034d:	05 ef 36 00 00       	add    eax,0x36ef
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:17
    PUTSTRING(buffer)
30000352:	b8 04 00 00 00       	mov    eax,0x4
30000357:	bb 01 00 00 00       	mov    ebx,0x1
3000035c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
3000035f:	89 d1                	mov    ecx,edx
30000361:	e8 fc ff ff ff       	call   30000362 <puts+0x1e>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:18
}
30000366:	90                   	nop
30000367:	5b                   	pop    ebx
30000368:	5d                   	pop    ebp
30000369:	c3                   	ret    

3000036a <putc>:
putc():
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:21

VISIBLE void putc(char c)
{
3000036a:	55                   	push   ebp
3000036b:	89 e5                	mov    ebp,esp
3000036d:	53                   	push   ebx
3000036e:	83 ec 14             	sub    esp,0x14
30000371:	e8 ec 20 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000376:	05 c6 36 00 00       	add    eax,0x36c6
3000037b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000037e:	88 45 e8             	mov    BYTE PTR [ebp-0x18],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:22
    char buffer[2]={0};
30000381:	66 c7 45 fa 00 00    	mov    WORD PTR [ebp-0x6],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:24
    
    buffer[0]=c;
30000387:	0f b6 45 e8          	movzx  eax,BYTE PTR [ebp-0x18]
3000038b:	88 45 fa             	mov    BYTE PTR [ebp-0x6],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:25
    buffer[1]=0;
3000038e:	c6 45 fb 00          	mov    BYTE PTR [ebp-0x5],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:26
    PUTSTRING(&buffer);
30000392:	b8 04 00 00 00       	mov    eax,0x4
30000397:	bb 01 00 00 00       	mov    ebx,0x1
3000039c:	8d 55 fa             	lea    edx,[ebp-0x6]
3000039f:	89 d1                	mov    ecx,edx
300003a1:	e8 fc ff ff ff       	call   300003a2 <putc+0x38>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:27
}
300003a6:	90                   	nop
300003a7:	83 c4 14             	add    esp,0x14
300003aa:	5b                   	pop    ebx
300003ab:	5d                   	pop    ebp
300003ac:	c3                   	ret    

300003ad <getc>:
getc():
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:30

VISIBLE char getc()
{
300003ad:	55                   	push   ebp
300003ae:	89 e5                	mov    ebp,esp
300003b0:	53                   	push   ebx
300003b1:	83 ec 10             	sub    esp,0x10
300003b4:	e8 a9 20 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300003b9:	05 83 36 00 00       	add    eax,0x3683
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:32
    char c;
    READCHAR(c)
300003be:	b8 03 00 00 00       	mov    eax,0x3
300003c3:	ba 00 00 00 00       	mov    edx,0x0
300003c8:	89 d3                	mov    ebx,edx
300003ca:	e8 fc ff ff ff       	call   300003cb <getc+0x1e>
300003cf:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:33
    return c;
300003d2:	0f b6 45 fb          	movzx  eax,BYTE PTR [ebp-0x5]
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:34
}
300003d6:	83 c4 10             	add    esp,0x10
300003d9:	5b                   	pop    ebx
300003da:	5d                   	pop    ebp
300003db:	c3                   	ret    

300003dc <gets>:
gets():
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:38

//Get a string of {maxlen} characters, returning when the # of characters is reached or enter is pressed
VISIBLE int gets(char* buffer, int maxlen, int stream)
{
300003dc:	55                   	push   ebp
300003dd:	89 e5                	mov    ebp,esp
300003df:	53                   	push   ebx
300003e0:	83 ec 14             	sub    esp,0x14
300003e3:	e8 7a 20 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300003e8:	05 54 36 00 00       	add    eax,0x3654
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:40
    char inchar;
    int len=0;
300003ed:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:41
    char lbuf[2]={0,0};
300003f4:	c6 45 f1 00          	mov    BYTE PTR [ebp-0xf],0x0
300003f8:	c6 45 f2 00          	mov    BYTE PTR [ebp-0xe],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:43
    
    if (stream!=1)
300003fc:	83 7d 10 01          	cmp    DWORD PTR [ebp+0x10],0x1
30000400:	74 19                	je     3000041b <gets+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:45
    {
        printI("Stream %u not implemented\n",stream);
30000402:	83 ec 08             	sub    esp,0x8
30000405:	ff 75 10             	push   DWORD PTR [ebp+0x10]
30000408:	8d 90 24 fb ff ff    	lea    edx,[eax-0x4dc]
3000040e:	52                   	push   edx
3000040f:	89 c3                	mov    ebx,eax
30000411:	e8 3a 02 00 00       	call   30000650 <printI>
30000416:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:46 (discriminator 1)
        getsError: goto getsError;
30000419:	eb fe                	jmp    30000419 <gets+0x3d>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:51
    }
    
    while (1==1)
    {
        READCHAR(inchar)
3000041b:	b8 03 00 00 00       	mov    eax,0x3
30000420:	ba 00 00 00 00       	mov    edx,0x0
30000425:	89 d3                	mov    ebx,edx
30000427:	e8 fc ff ff ff       	call   30000428 <gets+0x4c>
3000042c:	88 45 f3             	mov    BYTE PTR [ebp-0xd],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:52
        if (inchar=='\b' && len>0)
3000042f:	80 7d f3 08          	cmp    BYTE PTR [ebp-0xd],0x8
30000433:	75 17                	jne    3000044c <gets+0x70>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:52 (discriminator 1)
30000435:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
30000439:	7e 11                	jle    3000044c <gets+0x70>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:54
        {
            buffer[len]=0;
3000043b:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
3000043e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000441:	01 d0                	add    eax,edx
30000443:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:55
            len--;
30000446:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
3000044a:	eb 43                	jmp    3000048f <gets+0xb3>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:57
        }
        else if (inchar!=0)
3000044c:	80 7d f3 00          	cmp    BYTE PTR [ebp-0xd],0x0
30000450:	74 33                	je     30000485 <gets+0xa9>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:59
        {
            lbuf[0]=inchar;
30000452:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
30000456:	88 45 f1             	mov    BYTE PTR [ebp-0xf],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:61
            //PUTSTRING(&lbuf);
            buffer[len++]=inchar;
30000459:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000045c:	8d 50 01             	lea    edx,[eax+0x1]
3000045f:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000462:	89 c2                	mov    edx,eax
30000464:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000467:	01 c2                	add    edx,eax
30000469:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
3000046d:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:63
            //Note: Written this way so that gets an be used as a getc which waits for the key
            if ((len+1>=maxlen) || (inchar==0x0a)) //-1 because we need to leave the terminator (0x0) at the end of the string
3000046f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000472:	83 c0 01             	add    eax,0x1
30000475:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
30000478:	7d 06                	jge    30000480 <gets+0xa4>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:63 (discriminator 1)
3000047a:	80 7d f3 0a          	cmp    BYTE PTR [ebp-0xd],0xa
3000047e:	75 9b                	jne    3000041b <gets+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:65
            
                return len;
30000480:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000483:	eb 0c                	jmp    30000491 <gets+0xb5>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:68
        }
        else
            asm("call sysEnter_Vector\n"::"a" (0x302)); //hlt
30000485:	b8 02 03 00 00       	mov    eax,0x302
3000048a:	e8 fc ff ff ff       	call   3000048b <gets+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:70 (discriminator 2)

    }
3000048f:	eb 8a                	jmp    3000041b <gets+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:71
}
30000491:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000494:	c9                   	leave  
30000495:	c3                   	ret    
30000496:	66 90                	xchg   ax,ax

30000498 <do_syscall4>:
do_syscall4():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:16

extern void sysEnter_Vector();
bool libcInitialized = false;

int do_syscall4(int callnum, uint32_t param1, uint32_t param2, uint32_t param3)
{
30000498:	55                   	push   ebp
30000499:	89 e5                	mov    ebp,esp
3000049b:	53                   	push   ebx
3000049c:	83 ec 10             	sub    esp,0x10
3000049f:	e8 be 1f 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300004a4:	05 98 35 00 00       	add    eax,0x3598
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:17
    int retVal=0;
300004a9:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:18
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum), "b" (param1), "c" (param2), "d" (param3));
300004b0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300004b3:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
300004b6:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
300004b9:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
300004bc:	e8 fc ff ff ff       	call   300004bd <do_syscall4+0x25>
300004c1:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:19
    return retVal;
300004c4:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:20
}
300004c7:	83 c4 10             	add    esp,0x10
300004ca:	5b                   	pop    ebx
300004cb:	5d                   	pop    ebp
300004cc:	c3                   	ret    

300004cd <do_syscall3>:
do_syscall3():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:23

int do_syscall3(int callnum, uint32_t param1, uint32_t param2)
{
300004cd:	55                   	push   ebp
300004ce:	89 e5                	mov    ebp,esp
300004d0:	53                   	push   ebx
300004d1:	83 ec 10             	sub    esp,0x10
300004d4:	e8 89 1f 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300004d9:	05 63 35 00 00       	add    eax,0x3563
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:24
    int retVal=0;
300004de:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:25
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum), "b" (param1), "c" (param2));
300004e5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300004e8:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
300004eb:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
300004ee:	89 d3                	mov    ebx,edx
300004f0:	e8 fc ff ff ff       	call   300004f1 <do_syscall3+0x24>
300004f5:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:26
    return retVal;
300004f8:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:27
}
300004fb:	83 c4 10             	add    esp,0x10
300004fe:	5b                   	pop    ebx
300004ff:	5d                   	pop    ebp
30000500:	c3                   	ret    

30000501 <do_syscall2>:
do_syscall2():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:30

int do_syscall2(int callnum, uint32_t param1)
{
30000501:	55                   	push   ebp
30000502:	89 e5                	mov    ebp,esp
30000504:	53                   	push   ebx
30000505:	83 ec 10             	sub    esp,0x10
30000508:	e8 55 1f 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000050d:	05 2f 35 00 00       	add    eax,0x352f
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:31
    int retVal=0;
30000512:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:32
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum), "b" (param1));
30000519:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000051c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
3000051f:	89 d3                	mov    ebx,edx
30000521:	e8 fc ff ff ff       	call   30000522 <do_syscall2+0x21>
30000526:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:33
    return retVal;
30000529:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:34
}
3000052c:	83 c4 10             	add    esp,0x10
3000052f:	5b                   	pop    ebx
30000530:	5d                   	pop    ebp
30000531:	c3                   	ret    

30000532 <do_syscall1>:
do_syscall1():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:37

int do_syscall1(int callnum)
{
30000532:	55                   	push   ebp
30000533:	89 e5                	mov    ebp,esp
30000535:	83 ec 10             	sub    esp,0x10
30000538:	e8 25 1f 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000053d:	05 ff 34 00 00       	add    eax,0x34ff
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:38
    int retVal=0;
30000542:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:39
    asm("call sysEnter_Vector\n":"=a" (retVal):"a" (callnum));
30000549:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000054c:	e8 fc ff ff ff       	call   3000054d <do_syscall1+0x1b>
30000551:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:40
    return retVal;
30000554:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:41
}
30000557:	c9                   	leave  
30000558:	c3                   	ret    

30000559 <libc_init>:
libc_init():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:44

VISIBLE void __attribute__((constructor)) libc_init(void)
{
30000559:	55                   	push   ebp
3000055a:	89 e5                	mov    ebp,esp
3000055c:	53                   	push   ebx
3000055d:	83 ec 04             	sub    esp,0x4
30000560:	e8 5b 1f 00 00       	call   300024c0 <__x86.get_pc_thunk.bx>
30000565:	81 c3 d7 34 00 00    	add    ebx,0x34d7
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:45
    printdI(DEBUG_LIBC,"***libc_init called\n***");
3000056b:	83 ec 08             	sub    esp,0x8
3000056e:	8d 83 40 fb ff ff    	lea    eax,[ebx-0x4c0]
30000574:	50                   	push   eax
30000575:	68 00 00 00 02       	push   0x2000000
3000057a:	e8 05 01 00 00       	call   30000684 <printdI>
3000057f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:46
    if (!libcInitialized)
30000582:	0f b6 83 40 00 00 00 	movzx  eax,BYTE PTR [ebx+0x40]
30000589:	83 f0 01             	xor    eax,0x1
3000058c:	84 c0                	test   al,al
3000058e:	74 55                	je     300005e5 <libc_init+0x8c>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:48
    {
        initmalloc();
30000590:	e8 6f 02 00 00       	call   30000804 <initmalloc>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:49
        libcTZ=-4;
30000595:	8b 83 fc ff ff ff    	mov    eax,DWORD PTR [ebx-0x4]
3000059b:	c7 00 fc ff ff ff    	mov    DWORD PTR [eax],0xfffffffc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:50
        do_syscall1(SYSCALL_INVALID);
300005a1:	83 ec 0c             	sub    esp,0xc
300005a4:	6a 00                	push   0x0
300005a6:	e8 87 ff ff ff       	call   30000532 <do_syscall1>
300005ab:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:51
        do_syscall2(SYSCALL_REGEXITHANDLER,(uint32_t)&libc_cleanup);
300005ae:	8d 83 c1 cb ff ff    	lea    eax,[ebx-0x343f]
300005b4:	83 ec 08             	sub    esp,0x8
300005b7:	50                   	push   eax
300005b8:	68 63 01 00 00       	push   0x163
300005bd:	e8 3f ff ff ff       	call   30000501 <do_syscall2>
300005c2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:52
        libcInitialized = true;
300005c5:	c6 83 40 00 00 00 01 	mov    BYTE PTR [ebx+0x40],0x1
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:53
        printdI(DEBUG_LIBC,"***libc_init completed\n");
300005cc:	83 ec 08             	sub    esp,0x8
300005cf:	8d 83 58 fb ff ff    	lea    eax,[ebx-0x4a8]
300005d5:	50                   	push   eax
300005d6:	68 00 00 00 02       	push   0x2000000
300005db:	e8 a4 00 00 00       	call   30000684 <printdI>
300005e0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:57
    }
    else
        printI("libc_init called previously, exiting\n");
}
300005e3:	eb 12                	jmp    300005f7 <libc_init+0x9e>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:56
        do_syscall2(SYSCALL_REGEXITHANDLER,(uint32_t)&libc_cleanup);
        libcInitialized = true;
        printdI(DEBUG_LIBC,"***libc_init completed\n");
    }
    else
        printI("libc_init called previously, exiting\n");
300005e5:	83 ec 0c             	sub    esp,0xc
300005e8:	8d 83 70 fb ff ff    	lea    eax,[ebx-0x490]
300005ee:	50                   	push   eax
300005ef:	e8 5c 00 00 00       	call   30000650 <printI>
300005f4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:57
}
300005f7:	90                   	nop
300005f8:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300005fb:	c9                   	leave  
300005fc:	c3                   	ret    

300005fd <libc_cleanup>:
libc_cleanup():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:60

void __attribute__((destructor)) libc_cleanup(void)
{
300005fd:	55                   	push   ebp
300005fe:	89 e5                	mov    ebp,esp
30000600:	53                   	push   ebx
30000601:	83 ec 04             	sub    esp,0x4
30000604:	e8 59 1e 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000609:	05 33 34 00 00       	add    eax,0x3433
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:61
    malloc_cleanup();
3000060e:	89 c3                	mov    ebx,eax
30000610:	e8 ee 04 00 00       	call   30000b03 <malloc_cleanup>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:62
}
30000615:	90                   	nop
30000616:	83 c4 04             	add    esp,0x4
30000619:	5b                   	pop    ebx
3000061a:	5d                   	pop    ebp
3000061b:	c3                   	ret    

3000061c <print>:
print():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:65

VISIBLE int print(const char *format, ...)
{
3000061c:	55                   	push   ebp
3000061d:	89 e5                	mov    ebp,esp
3000061f:	83 ec 10             	sub    esp,0x10
30000622:	e8 3b 1e 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000627:	05 15 34 00 00       	add    eax,0x3415
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:67
    va_list args;
    va_start( args, format );
3000062c:	8d 45 0c             	lea    eax,[ebp+0xc]
3000062f:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:68
    do_syscall3(SYSCALL_PRINT,(uint32_t)format,(uint32_t)args);
30000632:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000635:	89 c2                	mov    edx,eax
30000637:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000063a:	52                   	push   edx
3000063b:	50                   	push   eax
3000063c:	68 00 03 00 00       	push   0x300
30000641:	e8 87 fe ff ff       	call   300004cd <do_syscall3>
30000646:	83 c4 0c             	add    esp,0xc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:69
    return 0;
30000649:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:70
}
3000064e:	c9                   	leave  
3000064f:	c3                   	ret    

30000650 <printI>:
printI():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:73

int printI(const char *format, ...)
{
30000650:	55                   	push   ebp
30000651:	89 e5                	mov    ebp,esp
30000653:	83 ec 10             	sub    esp,0x10
30000656:	e8 07 1e 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000065b:	05 e1 33 00 00       	add    eax,0x33e1
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:75
    va_list args;
    va_start( args, format );
30000660:	8d 45 0c             	lea    eax,[ebp+0xc]
30000663:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:76
    do_syscall3(SYSCALL_PRINT,(uint32_t)format,(uint32_t)args);
30000666:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000669:	89 c2                	mov    edx,eax
3000066b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000066e:	52                   	push   edx
3000066f:	50                   	push   eax
30000670:	68 00 03 00 00       	push   0x300
30000675:	e8 53 fe ff ff       	call   300004cd <do_syscall3>
3000067a:	83 c4 0c             	add    esp,0xc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:77
    return 0;
3000067d:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:78
}
30000682:	c9                   	leave  
30000683:	c3                   	ret    

30000684 <printdI>:
printdI():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:81

int printdI(uint32_t DebugLevel, const char *format, ...)
{
30000684:	55                   	push   ebp
30000685:	89 e5                	mov    ebp,esp
30000687:	53                   	push   ebx
30000688:	83 ec 10             	sub    esp,0x10
3000068b:	e8 d2 1d 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000690:	05 ac 33 00 00       	add    eax,0x33ac
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:83
    va_list args;
    va_start( args, format );
30000695:	8d 45 10             	lea    eax,[ebp+0x10]
30000698:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:84
    asm("mov eax,0x301\ncall sysEnter_Vector\n"::"b" (DebugLevel), "c" (format), "d" (args));
3000069b:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
3000069e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300006a1:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
300006a4:	89 c3                	mov    ebx,eax
300006a6:	b8 01 03 00 00       	mov    eax,0x301
300006ab:	e8 fc ff ff ff       	call   300006ac <printdI+0x28>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:85
    return 0;
300006b0:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:86
}
300006b5:	83 c4 10             	add    esp,0x10
300006b8:	5b                   	pop    ebx
300006b9:	5d                   	pop    ebp
300006ba:	c3                   	ret    

300006bb <sleep>:
sleep():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:89

VISIBLE unsigned int sleep (unsigned int __seconds)
{
300006bb:	55                   	push   ebp
300006bc:	89 e5                	mov    ebp,esp
300006be:	53                   	push   ebx
300006bf:	83 ec 10             	sub    esp,0x10
300006c2:	e8 9b 1d 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300006c7:	05 75 33 00 00       	add    eax,0x3375
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:90
    SLEEP_SECONDS(__seconds)
300006cc:	b8 70 01 00 00       	mov    eax,0x170
300006d1:	e8 fc ff ff ff       	call   300006d2 <sleep+0x17>
300006d6:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
300006d9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300006dc:	6b d0 64             	imul   edx,eax,0x64
300006df:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
300006e2:	01 d0                	add    eax,edx
300006e4:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
300006e7:	b8 66 01 00 00       	mov    eax,0x166
300006ec:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
300006ef:	b9 00 00 00 00       	mov    ecx,0x0
300006f4:	ba 00 00 00 00       	mov    edx,0x0
300006f9:	e8 fc ff ff ff       	call   300006fa <sleep+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:91
    return 0;
300006fe:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:92
}
30000703:	83 c4 10             	add    esp,0x10
30000706:	5b                   	pop    ebx
30000707:	5d                   	pop    ebp
30000708:	c3                   	ret    

30000709 <stop>:
stop():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:95

void stop()
{
30000709:	55                   	push   ebp
3000070a:	89 e5                	mov    ebp,esp
3000070c:	e8 51 1d 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000711:	05 2b 33 00 00       	add    eax,0x332b
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:96
    do_syscall1(SYSCALL_STOP);
30000716:	68 68 01 00 00       	push   0x168
3000071b:	e8 12 fe ff ff       	call   30000532 <do_syscall1>
30000720:	83 c4 04             	add    esp,0x4
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:97
}
30000723:	90                   	nop
30000724:	c9                   	leave  
30000725:	c3                   	ret    

30000726 <modifySignal>:
modifySignal():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:100

VISIBLE void modifySignal(int signal, void* sigHandler, int sigData)
{
30000726:	55                   	push   ebp
30000727:	89 e5                	mov    ebp,esp
30000729:	e8 34 1d 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000072e:	05 0e 33 00 00       	add    eax,0x330e
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:101
    do_syscall4(SYSCALL_SETSIGACTION,signal,(uint32_t)sigHandler,sigData);
30000733:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30000736:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000739:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000073c:	51                   	push   ecx
3000073d:	52                   	push   edx
3000073e:	50                   	push   eax
3000073f:	68 67 01 00 00       	push   0x167
30000744:	e8 4f fd ff ff       	call   30000498 <do_syscall4>
30000749:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:102
}
3000074c:	90                   	nop
3000074d:	c9                   	leave  
3000074e:	c3                   	ret    

3000074f <exec>:
exec():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:105

VISIBLE int exec(char* path, int argc, char** argv)
{
3000074f:	55                   	push   ebp
30000750:	89 e5                	mov    ebp,esp
30000752:	53                   	push   ebx
30000753:	83 ec 10             	sub    esp,0x10
30000756:	e8 07 1d 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000075b:	05 e1 32 00 00       	add    eax,0x32e1
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:106
    int pid=0;
30000760:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:109
    //Using the syscall is breaking the stack
//    SYSCALL4(SYSCALL_EXEC,path,argc,argv);
    __asm__("push ds\nint 0x80\npop ds\n"
30000767:	b8 59 00 00 00       	mov    eax,0x59
3000076c:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
3000076f:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
30000772:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
30000775:	1e                   	push   ds
30000776:	cd 80                	int    0x80
30000778:	1f                   	pop    ds
30000779:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:112
            :"=a" (pid)
            :"a" (0x59),"b" (path),"c" (argc),"d" (argv));
    return pid;
3000077c:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:113
}
3000077f:	83 c4 10             	add    esp,0x10
30000782:	5b                   	pop    ebx
30000783:	5d                   	pop    ebp
30000784:	c3                   	ret    

30000785 <waitpid>:
waitpid():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:116

VISIBLE void waitpid(uint32_t pid)
{
30000785:	55                   	push   ebp
30000786:	89 e5                	mov    ebp,esp
30000788:	e8 d5 1c 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000078d:	05 af 32 00 00       	add    eax,0x32af
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:117
    do_syscall2(SYSCALL_WAITFORPID,pid);
30000792:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000795:	6a 61                	push   0x61
30000797:	e8 65 fd ff ff       	call   30000501 <do_syscall2>
3000079c:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:118
}
3000079f:	90                   	nop
300007a0:	c9                   	leave  
300007a1:	c3                   	ret    

300007a2 <gettime>:
gettime():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:121

VISIBLE struct tm* gettime()
{
300007a2:	55                   	push   ebp
300007a3:	89 e5                	mov    ebp,esp
300007a5:	53                   	push   ebx
300007a6:	83 ec 34             	sub    esp,0x34
300007a9:	e8 12 1d 00 00       	call   300024c0 <__x86.get_pc_thunk.bx>
300007ae:	81 c3 8e 32 00 00    	add    ebx,0x328e
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:122
    uint32_t ticks=0;
300007b4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:124
    struct tm theTime;
    do_syscall2(SYSCALL_GETTICKS,ticks);
300007bb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300007be:	50                   	push   eax
300007bf:	68 70 01 00 00       	push   0x170
300007c4:	e8 38 fd ff ff       	call   30000501 <do_syscall2>
300007c9:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:125
    return gmtime_r((time_t*)&ticks,&theTime);
300007cc:	83 ec 08             	sub    esp,0x8
300007cf:	8d 45 c8             	lea    eax,[ebp-0x38]
300007d2:	50                   	push   eax
300007d3:	8d 45 f4             	lea    eax,[ebp-0xc]
300007d6:	50                   	push   eax
300007d7:	e8 c4 1c 00 00       	call   300024a0 <__x86.get_pc_thunk.ax+0x3e>
300007dc:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:126
}
300007df:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300007e2:	c9                   	leave  
300007e3:	c3                   	ret    

300007e4 <getcwd>:
getcwd():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:129

VISIBLE char* getcwd(char* buf, size_t size)
{
300007e4:	55                   	push   ebp
300007e5:	89 e5                	mov    ebp,esp
300007e7:	e8 76 1c 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300007ec:	05 50 32 00 00       	add    eax,0x3250
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:130
    return (char*)do_syscall3(SYSCALL_GETCWD,(uint32_t)buf,size);
300007f1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300007f4:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
300007f7:	50                   	push   eax
300007f8:	6a 4f                	push   0x4f
300007fa:	e8 ce fc ff ff       	call   300004cd <do_syscall3>
300007ff:	83 c4 0c             	add    esp,0xc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:131
}
30000802:	c9                   	leave  
30000803:	c3                   	ret    

30000804 <initmalloc>:
initmalloc():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:13
#include "libChrisOS.h"

#define HEAP_GET_NEXT(s,t) {t=(uint8_t*)s+s->len+sizeof(heaprec_t);}
#define HEAP_CURR(s,t) {t=((heaprec_t*)s)-1;}
void initmalloc()
{
30000804:	55                   	push   ebp
30000805:	89 e5                	mov    ebp,esp
30000807:	53                   	push   ebx
30000808:	83 ec 04             	sub    esp,0x4
3000080b:	e8 b0 1c 00 00       	call   300024c0 <__x86.get_pc_thunk.bx>
30000810:	81 c3 2c 32 00 00    	add    ebx,0x322c
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:14
    printdI(DEBUG_MALLOC,"heapBase = 0x%08X before\n", heapBase);
30000816:	8b 83 f4 ff ff ff    	mov    eax,DWORD PTR [ebx-0xc]
3000081c:	8b 00                	mov    eax,DWORD PTR [eax]
3000081e:	83 ec 04             	sub    esp,0x4
30000821:	50                   	push   eax
30000822:	8d 83 98 fb ff ff    	lea    eax,[ebx-0x468]
30000828:	50                   	push   eax
30000829:	68 00 00 00 01       	push   0x1000000
3000082e:	e8 51 fe ff ff       	call   30000684 <printdI>
30000833:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:15
    heapBase=0;
30000836:	8b 83 f4 ff ff ff    	mov    eax,DWORD PTR [ebx-0xc]
3000083c:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:16
    heapCurr=0;
30000842:	8b 83 f8 ff ff ff    	mov    eax,DWORD PTR [ebx-0x8]
30000848:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:17
    heapEnd=0;
3000084e:	8b 83 f0 ff ff ff    	mov    eax,DWORD PTR [ebx-0x10]
30000854:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:18
}
3000085a:	90                   	nop
3000085b:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
3000085e:	c9                   	leave  
3000085f:	c3                   	ret    

30000860 <newHeapRequiredToFulfillRequest>:
newHeapRequiredToFulfillRequest():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:21

uint32_t newHeapRequiredToFulfillRequest(size_t size)
{
30000860:	55                   	push   ebp
30000861:	89 e5                	mov    ebp,esp
30000863:	83 ec 10             	sub    esp,0x10
30000866:	e8 f7 1b 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000086b:	05 d1 31 00 00       	add    eax,0x31d1
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:24
    //CLR 12/28/2018: Need to add 2 heap records instead of just 1, because in malloc we'll set the ->prev 
    //value of the heap record following ours before returning
    uint32_t newSize=size+(sizeof(heaprec_t)*2);
30000870:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30000873:	83 c2 20             	add    edx,0x20
30000876:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:26
    //printDebug(DEBUG_MALLOC,"size=0x%08X, heapEnd=0x%08X, heapCurr=0x%08X\n",newSize, heapEnd, heapCurr);
    if (heapCurr+newSize > heapEnd)
30000879:	8b 90 f8 ff ff ff    	mov    edx,DWORD PTR [eax-0x8]
3000087f:	8b 0a                	mov    ecx,DWORD PTR [edx]
30000881:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000884:	01 d1                	add    ecx,edx
30000886:	8b 90 f0 ff ff ff    	mov    edx,DWORD PTR [eax-0x10]
3000088c:	8b 12                	mov    edx,DWORD PTR [edx]
3000088e:	39 d1                	cmp    ecx,edx
30000890:	76 4e                	jbe    300008e0 <newHeapRequiredToFulfillRequest+0x80>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:29
    {
        //printDebug(DEBUG_MALLOC,"Heap requested 0x%08X, heap available 0x%08X\n",newSize, heapEnd-heapCurr);
        newSize -=(heapEnd-heapCurr);
30000892:	8b 90 f8 ff ff ff    	mov    edx,DWORD PTR [eax-0x8]
30000898:	8b 12                	mov    edx,DWORD PTR [edx]
3000089a:	8b 80 f0 ff ff ff    	mov    eax,DWORD PTR [eax-0x10]
300008a0:	8b 00                	mov    eax,DWORD PTR [eax]
300008a2:	29 c2                	sub    edx,eax
300008a4:	89 d0                	mov    eax,edx
300008a6:	01 45 fc             	add    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:30
        if (newSize== 0 || newSize%PAGE_SIZE)
300008a9:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
300008ad:	74 0c                	je     300008bb <newHeapRequiredToFulfillRequest+0x5b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:30 (discriminator 1)
300008af:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300008b2:	25 ff 0f 00 00       	and    eax,0xfff
300008b7:	85 c0                	test   eax,eax
300008b9:	74 10                	je     300008cb <newHeapRequiredToFulfillRequest+0x6b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:32
       {
           newSize+=(PAGE_SIZE-(newSize % PAGE_SIZE));
300008bb:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300008be:	25 00 f0 ff ff       	and    eax,0xfffff000
300008c3:	05 00 10 00 00       	add    eax,0x1000
300008c8:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:35
           //printDebug(DEBUG_MALLOC,"libcnewHeapRequiredToFulfillRequest: Size adjusted from %u to %u\n",size,newSize);
       }
        if (newSize < ALLOC_REQUEST_SIZE)
300008cb:	81 7d fc ff 1f 03 00 	cmp    DWORD PTR [ebp-0x4],0x31fff
300008d2:	77 07                	ja     300008db <newHeapRequiredToFulfillRequest+0x7b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:36
            return ALLOC_REQUEST_SIZE;
300008d4:	b8 00 20 03 00       	mov    eax,0x32000
300008d9:	eb 0a                	jmp    300008e5 <newHeapRequiredToFulfillRequest+0x85>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:38
        else
            return newSize;
300008db:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300008de:	eb 05                	jmp    300008e5 <newHeapRequiredToFulfillRequest+0x85>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:41
    }
    else
        return 0;
300008e0:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:42
}
300008e5:	c9                   	leave  
300008e6:	c3                   	ret    

300008e7 <malloc>:
malloc():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:45

__attribute__((visibility("default"))) void*  malloc(size_t size)
{
300008e7:	55                   	push   ebp
300008e8:	89 e5                	mov    ebp,esp
300008ea:	56                   	push   esi
300008eb:	53                   	push   ebx
300008ec:	83 ec 20             	sub    esp,0x20
300008ef:	e8 d0 1b 00 00       	call   300024c4 <__x86.get_pc_thunk.si>
300008f4:	81 c6 48 31 00 00    	add    esi,0x3148
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:52

    uint32_t needed;
    uint32_t allocatedPtr;
    heaprec_t* heapPtr;
    uint8_t* heapPtrNext;
    printdI(DEBUG_MALLOC,"malloc(0x%08X)\n",size);
300008fa:	83 ec 04             	sub    esp,0x4
300008fd:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000900:	8d 86 b2 fb ff ff    	lea    eax,[esi-0x44e]
30000906:	50                   	push   eax
30000907:	68 00 00 00 01       	push   0x1000000
3000090c:	89 f3                	mov    ebx,esi
3000090e:	e8 71 fd ff ff       	call   30000684 <printdI>
30000913:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:53
    needed = newHeapRequiredToFulfillRequest(size);
30000916:	83 ec 0c             	sub    esp,0xc
30000919:	ff 75 08             	push   DWORD PTR [ebp+0x8]
3000091c:	e8 3f ff ff ff       	call   30000860 <newHeapRequiredToFulfillRequest>
30000921:	83 c4 10             	add    esp,0x10
30000924:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:54
    printdI(DEBUG_MALLOC,"libc_malloc: needed=0x%08X\n",needed);
30000927:	83 ec 04             	sub    esp,0x4
3000092a:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
3000092d:	8d 86 c2 fb ff ff    	lea    eax,[esi-0x43e]
30000933:	50                   	push   eax
30000934:	68 00 00 00 01       	push   0x1000000
30000939:	89 f3                	mov    ebx,esi
3000093b:	e8 44 fd ff ff       	call   30000684 <printdI>
30000940:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:55
    if (needed!=0)      //New heap required
30000943:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
30000947:	0f 84 b0 00 00 00    	je     300009fd <malloc+0x116>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:57
    {
        asm("mov eax,0x165\ncall sysEnter_Vector\n":"=a" (allocatedPtr):"b" (needed));
3000094d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000950:	89 c3                	mov    ebx,eax
30000952:	b8 65 01 00 00       	mov    eax,0x165
30000957:	e8 fc ff ff ff       	call   30000958 <malloc+0x71>
3000095c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:59
        //This is needed to keep in sync with what the kernel thinks
        printdI(DEBUG_MALLOC,"libc_malloc: heaEnd=0x%08X\n",heapEnd);
3000095f:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
30000965:	8b 00                	mov    eax,DWORD PTR [eax]
30000967:	83 ec 04             	sub    esp,0x4
3000096a:	50                   	push   eax
3000096b:	8d 86 de fb ff ff    	lea    eax,[esi-0x422]
30000971:	50                   	push   eax
30000972:	68 00 00 00 01       	push   0x1000000
30000977:	89 f3                	mov    ebx,esi
30000979:	e8 06 fd ff ff       	call   30000684 <printdI>
3000097e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:60
        heapEnd=allocatedPtr+needed;
30000981:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
30000984:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000987:	01 c2                	add    edx,eax
30000989:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
3000098f:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:61
        printdI(DEBUG_MALLOC,"libc_malloc: Req 0x%08X bytes, ret was 0x%08X, heapEnd=0x%08X\n",needed,allocatedPtr,heapEnd);
30000991:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
30000997:	8b 00                	mov    eax,DWORD PTR [eax]
30000999:	83 ec 0c             	sub    esp,0xc
3000099c:	50                   	push   eax
3000099d:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
300009a0:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
300009a3:	8d 86 fc fb ff ff    	lea    eax,[esi-0x404]
300009a9:	50                   	push   eax
300009aa:	68 00 00 00 01       	push   0x1000000
300009af:	89 f3                	mov    ebx,esi
300009b1:	e8 ce fc ff ff       	call   30000684 <printdI>
300009b6:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:62
        if (heapBase==0)    //Hasn't been initialized yet!
300009b9:	8b 86 f4 ff ff ff    	mov    eax,DWORD PTR [esi-0xc]
300009bf:	8b 00                	mov    eax,DWORD PTR [eax]
300009c1:	85 c0                	test   eax,eax
300009c3:	75 38                	jne    300009fd <malloc+0x116>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:64
        {
            heapCurr=allocatedPtr;
300009c5:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300009cb:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
300009ce:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:65
            heapBase=allocatedPtr;
300009d0:	8b 86 f4 ff ff ff    	mov    eax,DWORD PTR [esi-0xc]
300009d6:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
300009d9:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:66
            printdI(DEBUG_MALLOC,"libc_malloc: Initialized heapCurr and heapBase to 0x%08X\n",heapCurr);
300009db:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300009e1:	8b 00                	mov    eax,DWORD PTR [eax]
300009e3:	83 ec 04             	sub    esp,0x4
300009e6:	50                   	push   eax
300009e7:	8d 86 3c fc ff ff    	lea    eax,[esi-0x3c4]
300009ed:	50                   	push   eax
300009ee:	68 00 00 00 01       	push   0x1000000
300009f3:	89 f3                	mov    ebx,esi
300009f5:	e8 8a fc ff ff       	call   30000684 <printdI>
300009fa:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:69
        }
    }
    printdI(DEBUG_MALLOC,"libc_malloc:creating heap rec @ 0x%08X\n",heapCurr);
300009fd:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000a03:	8b 00                	mov    eax,DWORD PTR [eax]
30000a05:	83 ec 04             	sub    esp,0x4
30000a08:	50                   	push   eax
30000a09:	8d 86 78 fc ff ff    	lea    eax,[esi-0x388]
30000a0f:	50                   	push   eax
30000a10:	68 00 00 00 01       	push   0x1000000
30000a15:	89 f3                	mov    ebx,esi
30000a17:	e8 68 fc ff ff       	call   30000684 <printdI>
30000a1c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:70
    heapPtr = (heaprec_t*)heapCurr;
30000a1f:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000a25:	8b 00                	mov    eax,DWORD PTR [eax]
30000a27:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:71
    heapPtr->marker=ALLOC_MARKER_VALUE;
30000a2a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a2d:	c7 00 d0 00 0f b0    	mov    DWORD PTR [eax],0xb00f00d0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:72
    heapPtr->len=size;
30000a33:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a36:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30000a39:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:73
    heapPtr->inUse=true;
30000a3c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a3f:	c6 40 08 01          	mov    BYTE PTR [eax+0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:74
    printdI(DEBUG_MALLOC,"libc_malloc: heapCurr=0x%08X, sizeof(heaprec_t)=0x%08X\n",heapCurr,sizeof(heaprec_t));
30000a43:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000a49:	8b 00                	mov    eax,DWORD PTR [eax]
30000a4b:	6a 10                	push   0x10
30000a4d:	50                   	push   eax
30000a4e:	8d 86 a0 fc ff ff    	lea    eax,[esi-0x360]
30000a54:	50                   	push   eax
30000a55:	68 00 00 00 01       	push   0x1000000
30000a5a:	89 f3                	mov    ebx,esi
30000a5c:	e8 23 fc ff ff       	call   30000684 <printdI>
30000a61:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:75
    retVal=(void*)(heapCurr+sizeof(heaprec_t));
30000a64:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000a6a:	8b 00                	mov    eax,DWORD PTR [eax]
30000a6c:	83 c0 10             	add    eax,0x10
30000a6f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:76
    HEAP_GET_NEXT(heapPtr,heapPtrNext);
30000a72:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a75:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30000a78:	8d 50 10             	lea    edx,[eax+0x10]
30000a7b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a7e:	01 d0                	add    eax,edx
30000a80:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:77
    ((heaprec_t*)heapPtrNext)->prev=heapPtr;
30000a83:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
30000a86:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000a89:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:78
    heapCurr+=size+(sizeof(heaprec_t));
30000a8c:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000a92:	8b 10                	mov    edx,DWORD PTR [eax]
30000a94:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000a97:	01 d0                	add    eax,edx
30000a99:	8d 50 10             	lea    edx,[eax+0x10]
30000a9c:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000aa2:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:79
    printdI(DEBUG_MALLOC,"malloc: returning 0x%08X\n",retVal);
30000aa4:	83 ec 04             	sub    esp,0x4
30000aa7:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
30000aaa:	8d 86 d8 fc ff ff    	lea    eax,[esi-0x328]
30000ab0:	50                   	push   eax
30000ab1:	68 00 00 00 01       	push   0x1000000
30000ab6:	89 f3                	mov    ebx,esi
30000ab8:	e8 c7 fb ff ff       	call   30000684 <printdI>
30000abd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:80
    return retVal;
30000ac0:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:81
}
30000ac3:	8d 65 f8             	lea    esp,[ebp-0x8]
30000ac6:	5b                   	pop    ebx
30000ac7:	5e                   	pop    esi
30000ac8:	5d                   	pop    ebp
30000ac9:	c3                   	ret    

30000aca <free>:
free():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:84

__attribute__((visibility("default"))) void free(void* fpointer)
{
30000aca:	55                   	push   ebp
30000acb:	89 e5                	mov    ebp,esp
30000acd:	83 ec 10             	sub    esp,0x10
30000ad0:	e8 8d 19 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000ad5:	05 67 2f 00 00       	add    eax,0x2f67
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:87
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if (fpointer==NULL)
30000ada:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
30000ade:	74 20                	je     30000b00 <free+0x36>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:89
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
    HEAP_CURR(fpointer,mp);
30000ae0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000ae3:	83 e8 10             	sub    eax,0x10
30000ae6:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:92
    
    //printDebug(DEBUG_MALLOC,"libc_free: Freeing heap @ fp=0x%08X (mp=0x%08X)\n",fpointer,mp);
    if (mp->marker!=ALLOC_MARKER_VALUE)
30000ae9:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000aec:	8b 00                	mov    eax,DWORD PTR [eax]
30000aee:	3d d0 00 0f b0       	cmp    eax,0xb00f00d0
30000af3:	74 02                	je     30000af7 <free+0x2d>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:96 (discriminator 2)
    {
        //print("malloc: marker not found error!!!\n");
gotoHere:
        goto gotoHere;
30000af5:	eb fe                	jmp    30000af5 <free+0x2b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:98
    }
    mp->inUse=false;
30000af7:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000afa:	c6 40 08 00          	mov    BYTE PTR [eax+0x8],0x0
30000afe:	eb 01                	jmp    30000b01 <free+0x37>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:88
__attribute__((visibility("default"))) void free(void* fpointer)
{
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if (fpointer==NULL)
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
30000b00:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:99
        //print("malloc: marker not found error!!!\n");
gotoHere:
        goto gotoHere;
    }
    mp->inUse=false;
}
30000b01:	c9                   	leave  
30000b02:	c3                   	ret    

30000b03 <malloc_cleanup>:
malloc_cleanup():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:102

void malloc_cleanup()
{
30000b03:	55                   	push   ebp
30000b04:	89 e5                	mov    ebp,esp
30000b06:	53                   	push   ebx
30000b07:	e8 56 19 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000b0c:	05 30 2f 00 00       	add    eax,0x2f30
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:103
    asm("mov eax,0x164\ncall sysEnter_Vector\n"::"b" (heapBase));
30000b11:	8b 80 f4 ff ff ff    	mov    eax,DWORD PTR [eax-0xc]
30000b17:	8b 00                	mov    eax,DWORD PTR [eax]
30000b19:	89 c3                	mov    ebx,eax
30000b1b:	b8 64 01 00 00       	mov    eax,0x164
30000b20:	e8 fc ff ff ff       	call   30000b21 <malloc_cleanup+0x1e>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:104
30000b25:	90                   	nop
30000b26:	5b                   	pop    ebx
30000b27:	5d                   	pop    ebp
30000b28:	c3                   	ret    
30000b29:	66 90                	xchg   ax,ax
30000b2b:	90                   	nop

30000b2c <memcpy>:
memcpy():
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:11
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
VISIBLE void * memcpy(void *dest, const void *src, size_t n)
{
30000b2c:	55                   	push   ebp
30000b2d:	89 e5                	mov    ebp,esp
30000b2f:	83 ec 20             	sub    esp,0x20
30000b32:	e8 2b 19 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000b37:	05 05 2f 00 00       	add    eax,0x2f05
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:14
    bool dw,dd;
    
    dd=n%4==0;
30000b3c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b3f:	83 e0 03             	and    eax,0x3
30000b42:	85 c0                	test   eax,eax
30000b44:	0f 94 c0             	sete   al
30000b47:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:15
    dw=n%2==0;
30000b4a:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b4d:	83 e0 01             	and    eax,0x1
30000b50:	85 c0                	test   eax,eax
30000b52:	0f 94 c0             	sete   al
30000b55:	88 45 e6             	mov    BYTE PTR [ebp-0x1a],al
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:16
    if (dd)
30000b58:	80 7d e7 00          	cmp    BYTE PTR [ebp-0x19],0x0
30000b5c:	74 7d                	je     30000bdb <memcpy+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:18
    {
        n /=4;
30000b5e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b61:	c1 e8 02             	shr    eax,0x2
30000b64:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:19
        const uint32_t *f = src;
30000b67:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000b6a:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:20
        uint32_t *t = dest;
30000b6d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000b70:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:22

        if (f < t) {
30000b73:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000b76:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
30000b79:	73 4b                	jae    30000bc6 <memcpy+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:23
                f += n;
30000b7b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b7e:	c1 e0 02             	shl    eax,0x2
30000b81:	01 45 fc             	add    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:24
                t += n;
30000b84:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b87:	c1 e0 02             	shl    eax,0x2
30000b8a:	01 45 f8             	add    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:25
                while ( (n)-- > 0)
30000b8d:	eb 12                	jmp    30000ba1 <memcpy+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:26
                        *--t = *--f;
30000b8f:	83 6d f8 04          	sub    DWORD PTR [ebp-0x8],0x4
30000b93:	83 6d fc 04          	sub    DWORD PTR [ebp-0x4],0x4
30000b97:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000b9a:	8b 10                	mov    edx,DWORD PTR [eax]
30000b9c:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000b9f:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:25
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
30000ba1:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000ba4:	8d 50 ff             	lea    edx,[eax-0x1]
30000ba7:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000baa:	85 c0                	test   eax,eax
30000bac:	75 e1                	jne    30000b8f <memcpy+0x63>
30000bae:	eb 23                	jmp    30000bd3 <memcpy+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:29
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
30000bb0:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000bb3:	8d 50 04             	lea    edx,[eax+0x4]
30000bb6:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
30000bb9:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000bbc:	8d 4a 04             	lea    ecx,[edx+0x4]
30000bbf:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
30000bc2:	8b 12                	mov    edx,DWORD PTR [edx]
30000bc4:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:28
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
30000bc6:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000bc9:	8d 50 ff             	lea    edx,[eax-0x1]
30000bcc:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000bcf:	85 c0                	test   eax,eax
30000bd1:	75 dd                	jne    30000bb0 <memcpy+0x84>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:30
                        *t++ = *f++;
        return dest;
30000bd3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000bd6:	e9 ea 00 00 00       	jmp    30000cc5 <memcpy+0x199>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:32
    }
    else if (dw)
30000bdb:	80 7d e6 00          	cmp    BYTE PTR [ebp-0x1a],0x0
30000bdf:	74 79                	je     30000c5a <memcpy+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:34
    {
        n /=2;
30000be1:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000be4:	d1 e8                	shr    eax,1
30000be6:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:35
        const uint32_t *f = src;
30000be9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000bec:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:36
        uint32_t *t = dest;
30000bef:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000bf2:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:38

        if (f < t) {
30000bf5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000bf8:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30000bfb:	73 4b                	jae    30000c48 <memcpy+0x11c>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:39
                f += n;
30000bfd:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c00:	c1 e0 02             	shl    eax,0x2
30000c03:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:40
                t += n;
30000c06:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c09:	c1 e0 02             	shl    eax,0x2
30000c0c:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:41
                while ( (n)-- > 0)
30000c0f:	eb 12                	jmp    30000c23 <memcpy+0xf7>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:42
                        *--t = *--f;
30000c11:	83 6d f0 04          	sub    DWORD PTR [ebp-0x10],0x4
30000c15:	83 6d f4 04          	sub    DWORD PTR [ebp-0xc],0x4
30000c19:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000c1c:	8b 10                	mov    edx,DWORD PTR [eax]
30000c1e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000c21:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:41
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
30000c23:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c26:	8d 50 ff             	lea    edx,[eax-0x1]
30000c29:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000c2c:	85 c0                	test   eax,eax
30000c2e:	75 e1                	jne    30000c11 <memcpy+0xe5>
30000c30:	eb 23                	jmp    30000c55 <memcpy+0x129>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:45
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
30000c32:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000c35:	8d 50 04             	lea    edx,[eax+0x4]
30000c38:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
30000c3b:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
30000c3e:	8d 4a 04             	lea    ecx,[edx+0x4]
30000c41:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
30000c44:	8b 12                	mov    edx,DWORD PTR [edx]
30000c46:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:44
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
30000c48:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c4b:	8d 50 ff             	lea    edx,[eax-0x1]
30000c4e:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000c51:	85 c0                	test   eax,eax
30000c53:	75 dd                	jne    30000c32 <memcpy+0x106>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:46
                        *t++ = *f++;
        return dest;
30000c55:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000c58:	eb 6b                	jmp    30000cc5 <memcpy+0x199>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:50
    }
    else
    {
        const char *f = src;
30000c5a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000c5d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:51
        char *t = dest;
30000c60:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000c63:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:53

        if (f < t) {
30000c66:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000c69:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
30000c6c:	73 47                	jae    30000cb5 <memcpy+0x189>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:54
                f += n;
30000c6e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c71:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:55
                t += n;
30000c74:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c77:	01 45 e8             	add    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:56
                while (n-- > 0)
30000c7a:	eb 13                	jmp    30000c8f <memcpy+0x163>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:57
                        *--t = *--f;
30000c7c:	83 6d e8 01          	sub    DWORD PTR [ebp-0x18],0x1
30000c80:	83 6d ec 01          	sub    DWORD PTR [ebp-0x14],0x1
30000c84:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000c87:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30000c8a:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30000c8d:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:56
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
30000c8f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c92:	8d 50 ff             	lea    edx,[eax-0x1]
30000c95:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000c98:	85 c0                	test   eax,eax
30000c9a:	75 e0                	jne    30000c7c <memcpy+0x150>
30000c9c:	eb 24                	jmp    30000cc2 <memcpy+0x196>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:60
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
30000c9e:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30000ca1:	8d 50 01             	lea    edx,[eax+0x1]
30000ca4:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
30000ca7:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000caa:	8d 4a 01             	lea    ecx,[edx+0x1]
30000cad:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
30000cb0:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000cb3:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:59
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
30000cb5:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000cb8:	8d 50 ff             	lea    edx,[eax-0x1]
30000cbb:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000cbe:	85 c0                	test   eax,eax
30000cc0:	75 dc                	jne    30000c9e <memcpy+0x172>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:61
                        *t++ = *f++;
        return dest;
30000cc2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:63
    }
}
30000cc5:	c9                   	leave  
30000cc6:	c3                   	ret    
30000cc7:	90                   	nop

30000cc8 <memset>:
memset():
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:9
 * and open the template in the editor.
 */
#include "libChrisOS.h"

VISIBLE void *memset(void *d1, int val, size_t len)
{
30000cc8:	55                   	push   ebp
30000cc9:	89 e5                	mov    ebp,esp
30000ccb:	83 ec 20             	sub    esp,0x20
30000cce:	e8 8f 17 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000cd3:	05 69 2d 00 00       	add    eax,0x2d69
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:10
    uint8_t *d = d1;
30000cd8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000cdb:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:11
    uint16_t*e = d1;
30000cde:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000ce1:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:12
    uint16_t eVal=(val << 16) | (val << 8) | val;
30000ce4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000ce7:	c1 e0 10             	shl    eax,0x10
30000cea:	89 c2                	mov    edx,eax
30000cec:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cef:	c1 e0 08             	shl    eax,0x8
30000cf2:	09 c2                	or     edx,eax
30000cf4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cf7:	09 d0                	or     eax,edx
30000cf9:	66 89 45 f2          	mov    WORD PTR [ebp-0xe],ax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:13
    uint32_t*f = d1;
30000cfd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000d00:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:14
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
30000d03:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000d06:	c1 e0 18             	shl    eax,0x18
30000d09:	89 c2                	mov    edx,eax
30000d0b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000d0e:	c1 e0 10             	shl    eax,0x10
30000d11:	09 c2                	or     edx,eax
30000d13:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000d16:	c1 e0 08             	shl    eax,0x8
30000d19:	09 d0                	or     eax,edx
30000d1b:	0b 45 0c             	or     eax,DWORD PTR [ebp+0xc]
30000d1e:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:16
    
    if ((len%4)==0)
30000d21:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000d24:	83 e0 03             	and    eax,0x3
30000d27:	85 c0                	test   eax,eax
30000d29:	75 1c                	jne    30000d47 <memset+0x7f>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:17
    while (len-=4) {
30000d2b:	eb 0e                	jmp    30000d3b <memset+0x73>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:18
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
30000d2d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000d30:	8d 50 04             	lea    edx,[eax+0x4]
30000d33:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000d36:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000d39:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:17
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
30000d3b:	83 6d 10 04          	sub    DWORD PTR [ebp+0x10],0x4
30000d3f:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000d43:	75 e8                	jne    30000d2d <memset+0x65>
30000d45:	eb 43                	jmp    30000d8a <memset+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:20
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
30000d47:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000d4a:	83 e0 01             	and    eax,0x1
30000d4d:	85 c0                	test   eax,eax
30000d4f:	75 2c                	jne    30000d7d <memset+0xb5>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:21
    while (len-=2) {
30000d51:	eb 10                	jmp    30000d63 <memset+0x9b>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:22
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
30000d53:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000d56:	8d 50 02             	lea    edx,[eax+0x2]
30000d59:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
30000d5c:	0f b7 55 f2          	movzx  edx,WORD PTR [ebp-0xe]
30000d60:	66 89 10             	mov    WORD PTR [eax],dx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:21
    if ((len%4)==0)
    while (len-=4) {
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
    while (len-=2) {
30000d63:	83 6d 10 02          	sub    DWORD PTR [ebp+0x10],0x2
30000d67:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000d6b:	75 e6                	jne    30000d53 <memset+0x8b>
30000d6d:	eb 1b                	jmp    30000d8a <memset+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:26
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
        *d++ = val;
30000d6f:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000d72:	8d 50 01             	lea    edx,[eax+0x1]
30000d75:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000d78:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000d7b:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:25
    else if (((len%2)==0))
    while (len-=2) {
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
30000d7d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000d80:	8d 50 ff             	lea    edx,[eax-0x1]
30000d83:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000d86:	85 c0                	test   eax,eax
30000d88:	75 e5                	jne    30000d6f <memset+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:28
        *d++ = val;
    }
    return d1;
30000d8a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:29
}
30000d8d:	c9                   	leave  
30000d8e:	c3                   	ret    

30000d8f <memsetI>:
memsetI():
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:32

void *memsetI(void *d1, int val, size_t len)
{
30000d8f:	55                   	push   ebp
30000d90:	89 e5                	mov    ebp,esp
30000d92:	83 ec 20             	sub    esp,0x20
30000d95:	e8 c8 16 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000d9a:	05 a2 2c 00 00       	add    eax,0x2ca2
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:33
    uint8_t *d = d1;
30000d9f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000da2:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:34
    uint16_t*e = d1;
30000da5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000da8:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:35
    uint16_t eVal=(val << 16) | (val << 8) | val;
30000dab:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000dae:	c1 e0 10             	shl    eax,0x10
30000db1:	89 c2                	mov    edx,eax
30000db3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000db6:	c1 e0 08             	shl    eax,0x8
30000db9:	09 c2                	or     edx,eax
30000dbb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000dbe:	09 d0                	or     eax,edx
30000dc0:	66 89 45 f2          	mov    WORD PTR [ebp-0xe],ax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:36
    uint32_t*f = d1;
30000dc4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000dc7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:37
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
30000dca:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000dcd:	c1 e0 18             	shl    eax,0x18
30000dd0:	89 c2                	mov    edx,eax
30000dd2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000dd5:	c1 e0 10             	shl    eax,0x10
30000dd8:	09 c2                	or     edx,eax
30000dda:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000ddd:	c1 e0 08             	shl    eax,0x8
30000de0:	09 d0                	or     eax,edx
30000de2:	0b 45 0c             	or     eax,DWORD PTR [ebp+0xc]
30000de5:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:39
    
    if ((len%4)==0)
30000de8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000deb:	83 e0 03             	and    eax,0x3
30000dee:	85 c0                	test   eax,eax
30000df0:	75 1c                	jne    30000e0e <memsetI+0x7f>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:40
    while (len-=4) {
30000df2:	eb 0e                	jmp    30000e02 <memsetI+0x73>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:41
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
30000df4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000df7:	8d 50 04             	lea    edx,[eax+0x4]
30000dfa:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000dfd:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000e00:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:40
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
30000e02:	83 6d 10 04          	sub    DWORD PTR [ebp+0x10],0x4
30000e06:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000e0a:	75 e8                	jne    30000df4 <memsetI+0x65>
30000e0c:	eb 43                	jmp    30000e51 <memsetI+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:43
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
30000e0e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000e11:	83 e0 01             	and    eax,0x1
30000e14:	85 c0                	test   eax,eax
30000e16:	75 2c                	jne    30000e44 <memsetI+0xb5>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:44
    while (len-=2) {
30000e18:	eb 10                	jmp    30000e2a <memsetI+0x9b>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:45
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
30000e1a:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000e1d:	8d 50 02             	lea    edx,[eax+0x2]
30000e20:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
30000e23:	0f b7 55 f2          	movzx  edx,WORD PTR [ebp-0xe]
30000e27:	66 89 10             	mov    WORD PTR [eax],dx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:44
    if ((len%4)==0)
    while (len-=4) {
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
    while (len-=2) {
30000e2a:	83 6d 10 02          	sub    DWORD PTR [ebp+0x10],0x2
30000e2e:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000e32:	75 e6                	jne    30000e1a <memsetI+0x8b>
30000e34:	eb 1b                	jmp    30000e51 <memsetI+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:49
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
        *d++ = val;
30000e36:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000e39:	8d 50 01             	lea    edx,[eax+0x1]
30000e3c:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000e3f:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000e42:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:48
    else if (((len%2)==0))
    while (len-=2) {
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
30000e44:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000e47:	8d 50 ff             	lea    edx,[eax-0x1]
30000e4a:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000e4d:	85 c0                	test   eax,eax
30000e4f:	75 e5                	jne    30000e36 <memsetI+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:51
        *d++ = val;
    }
    return d1;
30000e51:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:52
}
30000e54:	c9                   	leave  
30000e55:	c3                   	ret    
30000e56:	66 90                	xchg   ax,ax

30000e58 <mmap>:
mmap():
/home/yogi/src/os/aproj/libChrisOS/src/mmap.c:10
 */
#include "libChrisOS.h"
#include "types.h"

VISIBLE void* mmap (void *addr,size_t len,int prot,int flags,int fd,off_t offset) //memory map pages either to a file or anonymously
{
30000e58:	55                   	push   ebp
30000e59:	89 e5                	mov    ebp,esp
30000e5b:	e8 02 16 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000e60:	05 dc 2b 00 00       	add    eax,0x2bdc
/home/yogi/src/os/aproj/libChrisOS/src/mmap.c:12
    
}
30000e65:	90                   	nop
30000e66:	5d                   	pop    ebp
30000e67:	c3                   	ret    

30000e68 <readConsole>:
readConsole():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:19
file_operations_t fops;
inode_t console_node={.i_dev=1,.i_mode=0};
file_t console_file;

size_t readConsole (struct file * fptr, char *buffer, size_t size, uint64_t* whatever) 
{
30000e68:	55                   	push   ebp
30000e69:	89 e5                	mov    ebp,esp
30000e6b:	53                   	push   ebx
30000e6c:	83 ec 04             	sub    esp,0x4
30000e6f:	e8 ee 15 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000e74:	05 c8 2b 00 00       	add    eax,0x2bc8
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:20
    return gets(buffer,size,1);
30000e79:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
30000e7c:	83 ec 04             	sub    esp,0x4
30000e7f:	6a 01                	push   0x1
30000e81:	52                   	push   edx
30000e82:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000e85:	89 c3                	mov    ebx,eax
30000e87:	e8 04 16 00 00       	call   30002490 <__x86.get_pc_thunk.ax+0x2e>
30000e8c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:21
}
30000e8f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000e92:	c9                   	leave  
30000e93:	c3                   	ret    

30000e94 <writeConsole>:
writeConsole():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:24

size_t writeConsole(struct file * fptr, const char *buffer, size_t size, uint64_t *whatever)
{
30000e94:	55                   	push   ebp
30000e95:	89 e5                	mov    ebp,esp
30000e97:	53                   	push   ebx
30000e98:	83 ec 04             	sub    esp,0x4
30000e9b:	e8 c2 15 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30000ea0:	05 9c 2b 00 00       	add    eax,0x2b9c
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:25
    return printI(buffer);
30000ea5:	83 ec 0c             	sub    esp,0xc
30000ea8:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000eab:	89 c3                	mov    ebx,eax
30000ead:	e8 9e f7 ff ff       	call   30000650 <printI>
30000eb2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:26
}
30000eb5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000eb8:	c9                   	leave  
30000eb9:	c3                   	ret    

30000eba <moveTo>:
moveTo():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:29

VISIBLE void moveTo(int row, int col)
{
30000eba:	55                   	push   ebp
30000ebb:	89 e5                	mov    ebp,esp
30000ebd:	53                   	push   ebx
30000ebe:	83 ec 24             	sub    esp,0x24
30000ec1:	e8 fa 15 00 00       	call   300024c0 <__x86.get_pc_thunk.bx>
30000ec6:	81 c3 76 2b 00 00    	add    ebx,0x2b76
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:32
    char buff[10];
    char rowString[3], colString[3];
    int buffPtr=0;
30000ecc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:35
    

    memsetI(buff,0,10);
30000ed3:	83 ec 04             	sub    esp,0x4
30000ed6:	6a 0a                	push   0xa
30000ed8:	6a 00                	push   0x0
30000eda:	8d 45 de             	lea    eax,[ebp-0x22]
30000edd:	50                   	push   eax
30000ede:	e8 ac fe ff ff       	call   30000d8f <memsetI>
30000ee3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:37
    //Convert row and column values to strings
    itoaI(row, rowString);
30000ee6:	83 ec 08             	sub    esp,0x8
30000ee9:	8d 45 db             	lea    eax,[ebp-0x25]
30000eec:	50                   	push   eax
30000eed:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000ef0:	e8 36 f3 ff ff       	call   3000022b <itoaI>
30000ef5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:38
    itoaI(col, colString);
30000ef8:	83 ec 08             	sub    esp,0x8
30000efb:	8d 45 d8             	lea    eax,[ebp-0x28]
30000efe:	50                   	push   eax
30000eff:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000f02:	e8 24 f3 ff ff       	call   3000022b <itoaI>
30000f07:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:41
    
    //Send the ansi escape sequence CSI characters
    buff[buffPtr++] = '\033';
30000f0a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000f0d:	8d 50 01             	lea    edx,[eax+0x1]
30000f10:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000f13:	c6 44 05 de 1b       	mov    BYTE PTR [ebp+eax*1-0x22],0x1b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:42
    buff[buffPtr++] = '[';
30000f18:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000f1b:	8d 50 01             	lea    edx,[eax+0x1]
30000f1e:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000f21:	c6 44 05 de 5b       	mov    BYTE PTR [ebp+eax*1-0x22],0x5b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:45

    
    for (int cnt=0;cnt<3;cnt++)
30000f26:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
30000f2d:	eb 2b                	jmp    30000f5a <moveTo+0xa0>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:46
        if (rowString[cnt]!=0)
30000f2f:	8d 55 db             	lea    edx,[ebp-0x25]
30000f32:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000f35:	01 d0                	add    eax,edx
30000f37:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f3a:	84 c0                	test   al,al
30000f3c:	74 24                	je     30000f62 <moveTo+0xa8>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:47
            buff[buffPtr++]=rowString[cnt];
30000f3e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000f41:	8d 50 01             	lea    edx,[eax+0x1]
30000f44:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000f47:	8d 4d db             	lea    ecx,[ebp-0x25]
30000f4a:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
30000f4d:	01 ca                	add    edx,ecx
30000f4f:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000f52:	88 54 05 de          	mov    BYTE PTR [ebp+eax*1-0x22],dl
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:45
    //Send the ansi escape sequence CSI characters
    buff[buffPtr++] = '\033';
    buff[buffPtr++] = '[';

    
    for (int cnt=0;cnt<3;cnt++)
30000f56:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:45 (discriminator 1)
30000f5a:	83 7d f0 02          	cmp    DWORD PTR [ebp-0x10],0x2
30000f5e:	7e cf                	jle    30000f2f <moveTo+0x75>
30000f60:	eb 01                	jmp    30000f63 <moveTo+0xa9>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:49
        if (rowString[cnt]!=0)
            buff[buffPtr++]=rowString[cnt];
        else
            break;
30000f62:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:50
    buff[buffPtr++] = ';';
30000f63:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000f66:	8d 50 01             	lea    edx,[eax+0x1]
30000f69:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000f6c:	c6 44 05 de 3b       	mov    BYTE PTR [ebp+eax*1-0x22],0x3b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:51
    for (int cnt=0;cnt<3;cnt++)
30000f71:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
30000f78:	eb 2b                	jmp    30000fa5 <moveTo+0xeb>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:52
        if (colString[cnt]!=0)
30000f7a:	8d 55 d8             	lea    edx,[ebp-0x28]
30000f7d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000f80:	01 d0                	add    eax,edx
30000f82:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f85:	84 c0                	test   al,al
30000f87:	74 24                	je     30000fad <moveTo+0xf3>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:53
            buff[buffPtr++]=colString[cnt];
30000f89:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000f8c:	8d 50 01             	lea    edx,[eax+0x1]
30000f8f:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000f92:	8d 4d d8             	lea    ecx,[ebp-0x28]
30000f95:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000f98:	01 ca                	add    edx,ecx
30000f9a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000f9d:	88 54 05 de          	mov    BYTE PTR [ebp+eax*1-0x22],dl
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:51
        if (rowString[cnt]!=0)
            buff[buffPtr++]=rowString[cnt];
        else
            break;
    buff[buffPtr++] = ';';
    for (int cnt=0;cnt<3;cnt++)
30000fa1:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:51 (discriminator 1)
30000fa5:	83 7d ec 02          	cmp    DWORD PTR [ebp-0x14],0x2
30000fa9:	7e cf                	jle    30000f7a <moveTo+0xc0>
30000fab:	eb 01                	jmp    30000fae <moveTo+0xf4>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:55
        if (colString[cnt]!=0)
            buff[buffPtr++]=colString[cnt];
        else
            break;
30000fad:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:56
    buff[buffPtr++] = 'H';
30000fae:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000fb1:	8d 50 01             	lea    edx,[eax+0x1]
30000fb4:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000fb7:	c6 44 05 de 48       	mov    BYTE PTR [ebp+eax*1-0x22],0x48
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:57
    for (int cnt=buffPtr;cnt<10;cnt++)
30000fbc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000fbf:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
30000fc2:	eb 12                	jmp    30000fd6 <moveTo+0x11c>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:58 (discriminator 3)
        buff[buffPtr++]=0;
30000fc4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000fc7:	8d 50 01             	lea    edx,[eax+0x1]
30000fca:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000fcd:	c6 44 05 de 00       	mov    BYTE PTR [ebp+eax*1-0x22],0x0
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:57 (discriminator 3)
        if (colString[cnt]!=0)
            buff[buffPtr++]=colString[cnt];
        else
            break;
    buff[buffPtr++] = 'H';
    for (int cnt=buffPtr;cnt<10;cnt++)
30000fd2:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:57 (discriminator 1)
30000fd6:	83 7d e8 09          	cmp    DWORD PTR [ebp-0x18],0x9
30000fda:	7e e8                	jle    30000fc4 <moveTo+0x10a>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:60
        buff[buffPtr++]=0;
    
    printI(buff);
30000fdc:	83 ec 0c             	sub    esp,0xc
30000fdf:	8d 45 de             	lea    eax,[ebp-0x22]
30000fe2:	50                   	push   eax
30000fe3:	e8 68 f6 ff ff       	call   30000650 <printI>
30000fe8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:62
    
    return;
30000feb:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:63
}
30000fec:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000fef:	c9                   	leave  
30000ff0:	c3                   	ret    

30000ff1 <resetRow>:
resetRow():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:67

//Clears the current console row, setting the cursor to column 0
VISIBLE void resetRow()
{
30000ff1:	55                   	push   ebp
30000ff2:	89 e5                	mov    ebp,esp
30000ff4:	53                   	push   ebx
30000ff5:	83 ec 14             	sub    esp,0x14
30000ff8:	e8 c3 14 00 00       	call   300024c0 <__x86.get_pc_thunk.bx>
30000ffd:	81 c3 3f 2a 00 00    	add    ebx,0x2a3f
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:69
    char buff[5];
    int buffPtr=0;
30001003:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:71

    memsetI(buff,0,10);
3000100a:	83 ec 04             	sub    esp,0x4
3000100d:	6a 0a                	push   0xa
3000100f:	6a 00                	push   0x0
30001011:	8d 45 ef             	lea    eax,[ebp-0x11]
30001014:	50                   	push   eax
30001015:	e8 75 fd ff ff       	call   30000d8f <memsetI>
3000101a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:74
    
    //Send the ansi escape sequence CSI characters
    buff[buffPtr++] = '\033';
3000101d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001020:	8d 50 01             	lea    edx,[eax+0x1]
30001023:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30001026:	c6 44 05 ef 1b       	mov    BYTE PTR [ebp+eax*1-0x11],0x1b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:75
    buff[buffPtr++] = '[';
3000102b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000102e:	8d 50 01             	lea    edx,[eax+0x1]
30001031:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30001034:	c6 44 05 ef 5b       	mov    BYTE PTR [ebp+eax*1-0x11],0x5b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:76
    buff[buffPtr++] = '0';
30001039:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000103c:	8d 50 01             	lea    edx,[eax+0x1]
3000103f:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30001042:	c6 44 05 ef 30       	mov    BYTE PTR [ebp+eax*1-0x11],0x30
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:77
    buff[buffPtr++] = 'K';
30001047:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000104a:	8d 50 01             	lea    edx,[eax+0x1]
3000104d:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30001050:	c6 44 05 ef 4b       	mov    BYTE PTR [ebp+eax*1-0x11],0x4b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:78
    buff[buffPtr] = '\0';
30001055:	8d 55 ef             	lea    edx,[ebp-0x11]
30001058:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000105b:	01 d0                	add    eax,edx
3000105d:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:79
    printI(buff);
30001060:	83 ec 0c             	sub    esp,0xc
30001063:	8d 45 ef             	lea    eax,[ebp-0x11]
30001066:	50                   	push   eax
30001067:	e8 e4 f5 ff ff       	call   30000650 <printI>
3000106c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:81
    
    return;
3000106f:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:82
}
30001070:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30001073:	c9                   	leave  
30001074:	c3                   	ret    

30001075 <ioInit>:
ioInit():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:85

void ioInit()
{
30001075:	55                   	push   ebp
30001076:	89 e5                	mov    ebp,esp
30001078:	e8 e5 13 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000107d:	05 bf 29 00 00       	add    eax,0x29bf
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:86
    console_file.f_inode=&console_node;
30001082:	8b 90 ec ff ff ff    	mov    edx,DWORD PTR [eax-0x14]
30001088:	8d 88 84 fe ff ff    	lea    ecx,[eax-0x17c]
3000108e:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:87
    fops.read=readConsole;
30001091:	8b 90 e8 ff ff ff    	mov    edx,DWORD PTR [eax-0x18]
30001097:	8d 88 2c d4 ff ff    	lea    ecx,[eax-0x2bd4]
3000109d:	89 0a                	mov    DWORD PTR [edx],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:88
    fops.write=writeConsole;
3000109f:	8b 90 e8 ff ff ff    	mov    edx,DWORD PTR [eax-0x18]
300010a5:	8d 88 58 d4 ff ff    	lea    ecx,[eax-0x2ba8]
300010ab:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:89
    console_file.fops=fops;
300010ae:	8b 88 ec ff ff ff    	mov    ecx,DWORD PTR [eax-0x14]
300010b4:	8b 80 e8 ff ff ff    	mov    eax,DWORD PTR [eax-0x18]
300010ba:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
300010bd:	8b 00                	mov    eax,DWORD PTR [eax]
300010bf:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
300010c2:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:90
300010c5:	90                   	nop
300010c6:	5d                   	pop    ebp
300010c7:	c3                   	ret    

300010c8 <strcat>:
strcat():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:30
   #endif
   
   /* Append SRC on the end of DEST.  */
   __attribute__((visibility("default"))) char *
   STRCAT (char *dest, const char *src)
   {
300010c8:	55                   	push   ebp
300010c9:	89 e5                	mov    ebp,esp
300010cb:	53                   	push   ebx
300010cc:	83 ec 04             	sub    esp,0x4
300010cf:	e8 ec 13 00 00       	call   300024c0 <__x86.get_pc_thunk.bx>
300010d4:	81 c3 68 29 00 00    	add    ebx,0x2968
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:31
     strcpyI (dest + strlenI (dest), src);
300010da:	83 ec 0c             	sub    esp,0xc
300010dd:	ff 75 08             	push   DWORD PTR [ebp+0x8]
300010e0:	e8 28 02 00 00       	call   3000130d <strlenI>
300010e5:	83 c4 10             	add    esp,0x10
300010e8:	89 c2                	mov    edx,eax
300010ea:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300010ed:	01 d0                	add    eax,edx
300010ef:	83 ec 08             	sub    esp,0x8
300010f2:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
300010f5:	50                   	push   eax
300010f6:	e8 59 01 00 00       	call   30001254 <strcpyI>
300010fb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:32
     return dest;
300010fe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:33
   }
30001101:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30001104:	c9                   	leave  
30001105:	c3                   	ret    

30001106 <strcatI>:
strcatI():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:36

   char* strcatI (char *dest, const char *src)
   {
30001106:	55                   	push   ebp
30001107:	89 e5                	mov    ebp,esp
30001109:	53                   	push   ebx
3000110a:	83 ec 04             	sub    esp,0x4
3000110d:	e8 ae 13 00 00       	call   300024c0 <__x86.get_pc_thunk.bx>
30001112:	81 c3 2a 29 00 00    	add    ebx,0x292a
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:37
     strcpy (dest + strlen (dest), src);
30001118:	83 ec 0c             	sub    esp,0xc
3000111b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
3000111e:	e8 8d 13 00 00       	call   300024b0 <__x86.get_pc_thunk.ax+0x4e>
30001123:	83 c4 10             	add    esp,0x10
30001126:	89 c2                	mov    edx,eax
30001128:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000112b:	01 d0                	add    eax,edx
3000112d:	83 ec 08             	sub    esp,0x8
30001130:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30001133:	50                   	push   eax
30001134:	e8 47 13 00 00       	call   30002480 <__x86.get_pc_thunk.ax+0x1e>
30001139:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:38
     return dest;
3000113c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:39
   }
3000113f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30001142:	c9                   	leave  
30001143:	c3                   	ret    

30001144 <concatenate>:
concatenate():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:41
   
   void concatenate(char p[], char q[]) {
30001144:	55                   	push   ebp
30001145:	89 e5                	mov    ebp,esp
30001147:	83 ec 10             	sub    esp,0x10
3000114a:	e8 13 13 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000114f:	05 ed 28 00 00       	add    eax,0x28ed
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:44
   int c, d;
 
   c = 0;
30001154:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:46
 
   while (p[c] != '\0') {
3000115b:	eb 04                	jmp    30001161 <concatenate+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:47
      c++;  	
3000115d:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:46
   void concatenate(char p[], char q[]) {
   int c, d;
 
   c = 0;
 
   while (p[c] != '\0') {
30001161:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30001164:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001167:	01 d0                	add    eax,edx
30001169:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000116c:	84 c0                	test   al,al
3000116e:	75 ed                	jne    3000115d <concatenate+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:50
      c++;  	
   }
 
   d = 0;
30001170:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:52
 
   while (q[d] != '\0') {
30001177:	eb 1d                	jmp    30001196 <concatenate+0x52>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:53
      p[c] = q[d];
30001179:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
3000117c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000117f:	01 c2                	add    edx,eax
30001181:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
30001184:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001187:	01 c8                	add    eax,ecx
30001189:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000118c:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:54
      d++;
3000118e:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:55
      c++;	
30001192:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:52
      c++;  	
   }
 
   d = 0;
 
   while (q[d] != '\0') {
30001196:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30001199:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000119c:	01 d0                	add    eax,edx
3000119e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300011a1:	84 c0                	test   al,al
300011a3:	75 d4                	jne    30001179 <concatenate+0x35>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:58
      p[c] = q[d];
      d++;
      c++;	
   }
 
   p[c] = '\0';
300011a5:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
300011a8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300011ab:	01 d0                	add    eax,edx
300011ad:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:59
300011b0:	90                   	nop
300011b1:	c9                   	leave  
300011b2:	c3                   	ret    
300011b3:	90                   	nop

300011b4 <strcmp>:
strcmp():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:25

/* Compare S1 and S2, returning less than, equal to or
   greater than zero if S1 is lexicographically less than,
   equal to or greater than S2.  */
VISIBLE int strcmp (const char *p1, const char *p2)
{
300011b4:	55                   	push   ebp
300011b5:	89 e5                	mov    ebp,esp
300011b7:	56                   	push   esi
300011b8:	53                   	push   ebx
300011b9:	83 ec 10             	sub    esp,0x10
300011bc:	e8 a1 12 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300011c1:	05 7b 28 00 00       	add    eax,0x287b
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:26
  register const unsigned char *s1 = (const unsigned char *) p1;
300011c6:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:27
  register const unsigned char *s2 = (const unsigned char *) p2;
300011c9:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:32
  unsigned char c1, c2;

  do
    {
      c1 = (unsigned char) *s1++;
300011cc:	89 d8                	mov    eax,ebx
300011ce:	8d 58 01             	lea    ebx,[eax+0x1]
300011d1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300011d4:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:33
      c2 = (unsigned char) *s2++;
300011d7:	89 f0                	mov    eax,esi
300011d9:	8d 70 01             	lea    esi,[eax+0x1]
300011dc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300011df:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:34
      if (c1 == '\0')
300011e2:	80 7d f7 00          	cmp    BYTE PTR [ebp-0x9],0x0
300011e6:	75 0e                	jne    300011f6 <strcmp+0x42>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:35
	return c1 - c2;
300011e8:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
300011ec:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
300011f0:	29 c2                	sub    edx,eax
300011f2:	89 d0                	mov    eax,edx
300011f4:	eb 15                	jmp    3000120b <strcmp+0x57>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:37
    }
  while (c1 == c2);
300011f6:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
300011fa:	3a 45 f6             	cmp    al,BYTE PTR [ebp-0xa]
300011fd:	74 cd                	je     300011cc <strcmp+0x18>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:39

  return c1 - c2;
300011ff:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
30001203:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
30001207:	29 c2                	sub    edx,eax
30001209:	89 d0                	mov    eax,edx
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:40
}
3000120b:	83 c4 10             	add    esp,0x10
3000120e:	5b                   	pop    ebx
3000120f:	5e                   	pop    esi
30001210:	5d                   	pop    ebp
30001211:	c3                   	ret    
30001212:	66 90                	xchg   ax,ax

30001214 <strcpy>:
strcpy():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:5
#include "strings.h"

__attribute__((visibility("default"))) char *
strcpy(char *s1, const char *s2)
{
30001214:	55                   	push   ebp
30001215:	89 e5                	mov    ebp,esp
30001217:	83 ec 10             	sub    esp,0x10
3000121a:	e8 43 12 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000121f:	05 1d 28 00 00       	add    eax,0x281d
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:6
    char *s = s1;
30001224:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001227:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:7
    while ((*s++ = *s2++) != 0)
3000122a:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:7 (discriminator 1)
3000122b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
3000122e:	8d 50 01             	lea    edx,[eax+0x1]
30001231:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30001234:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001237:	8d 4a 01             	lea    ecx,[edx+0x1]
3000123a:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
3000123d:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30001240:	88 10                	mov    BYTE PTR [eax],dl
30001242:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001245:	84 c0                	test   al,al
30001247:	75 e2                	jne    3000122b <strcpy+0x17>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:9
	;
    *s=0;       //CLR 04/20/2017: Added terminating null character to returned string
30001249:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
3000124c:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:10
    return (s1);
3000124f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:11
}
30001252:	c9                   	leave  
30001253:	c3                   	ret    

30001254 <strcpyI>:
strcpyI():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:15

char *
strcpyI(char *s1, const char *s2)
{
30001254:	55                   	push   ebp
30001255:	89 e5                	mov    ebp,esp
30001257:	83 ec 10             	sub    esp,0x10
3000125a:	e8 03 12 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000125f:	05 dd 27 00 00       	add    eax,0x27dd
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:16
    char *s = s1;
30001264:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001267:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17
    while ((*s++ = *s2++) != 0)
3000126a:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17 (discriminator 1)
3000126b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
3000126e:	8d 50 01             	lea    edx,[eax+0x1]
30001271:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30001274:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001277:	8d 4a 01             	lea    ecx,[edx+0x1]
3000127a:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
3000127d:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30001280:	88 10                	mov    BYTE PTR [eax],dl
30001282:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001285:	84 c0                	test   al,al
30001287:	75 e2                	jne    3000126b <strcpyI+0x17>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:19
	;
    *s=0;       //CLR 04/20/2017: Added terminating null character to returned string
30001289:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
3000128c:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:20
    return (s1);
3000128f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:21
}
30001292:	c9                   	leave  
30001293:	c3                   	ret    

30001294 <strcpyc>:
strcpyc():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:25

__attribute__((visibility("default"))) char *
strcpyc(char *s1, const char *s2, unsigned count)
{
30001294:	55                   	push   ebp
30001295:	89 e5                	mov    ebp,esp
30001297:	83 ec 10             	sub    esp,0x10
3000129a:	e8 c3 11 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
3000129f:	05 9d 27 00 00       	add    eax,0x279d
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:26
    char *s = s1;
300012a4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300012a7:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:27
    while ((*s++ = *s2++) != 0 && count-->0)
300012aa:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:27 (discriminator 2)
300012ab:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300012ae:	8d 50 01             	lea    edx,[eax+0x1]
300012b1:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
300012b4:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
300012b7:	8d 4a 01             	lea    ecx,[edx+0x1]
300012ba:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
300012bd:	0f b6 12             	movzx  edx,BYTE PTR [edx]
300012c0:	88 10                	mov    BYTE PTR [eax],dl
300012c2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300012c5:	84 c0                	test   al,al
300012c7:	74 0d                	je     300012d6 <strcpyc+0x42>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:27 (discriminator 1)
300012c9:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300012cc:	8d 50 ff             	lea    edx,[eax-0x1]
300012cf:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
300012d2:	85 c0                	test   eax,eax
300012d4:	75 d5                	jne    300012ab <strcpyc+0x17>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:29
	;
    return (s1);
300012d6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:30
}
300012d9:	c9                   	leave  
300012da:	c3                   	ret    
300012db:	90                   	nop

300012dc <strlen>:
strlen():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:3
#include <stddef.h>

__attribute__((visibility("default"))) size_t strlen(const char* str) {
300012dc:	55                   	push   ebp
300012dd:	89 e5                	mov    ebp,esp
300012df:	83 ec 10             	sub    esp,0x10
300012e2:	e8 7b 11 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300012e7:	05 55 27 00 00       	add    eax,0x2755
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:4
          size_t ret = 0;
300012ec:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:5
        while ( str[ret] != 0 )
300012f3:	eb 04                	jmp    300012f9 <strlen+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:6
                ret++;
300012f5:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:5
#include <stddef.h>

__attribute__((visibility("default"))) size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
300012f9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
300012fc:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300012ff:	01 d0                	add    eax,edx
30001301:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001304:	84 c0                	test   al,al
30001306:	75 ed                	jne    300012f5 <strlen+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:7
                ret++;
        return ret;
30001308:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:8
}
3000130b:	c9                   	leave  
3000130c:	c3                   	ret    

3000130d <strlenI>:
strlenI():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:10

size_t strlenI(const char* str) {
3000130d:	55                   	push   ebp
3000130e:	89 e5                	mov    ebp,esp
30001310:	83 ec 10             	sub    esp,0x10
30001313:	e8 4a 11 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30001318:	05 24 27 00 00       	add    eax,0x2724
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:11
          size_t ret = 0;
3000131d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:12
        while ( str[ret] != 0 )
30001324:	eb 04                	jmp    3000132a <strlenI+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:13
                ret++;
30001326:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:12
        return ret;
}

size_t strlenI(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
3000132a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
3000132d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30001330:	01 d0                	add    eax,edx
30001332:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001335:	84 c0                	test   al,al
30001337:	75 ed                	jne    30001326 <strlenI+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:14
                ret++;
        return ret;
30001339:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:15
}
3000133c:	c9                   	leave  
3000133d:	c3                   	ret    
3000133e:	66 90                	xchg   ax,ax

30001340 <strncmp>:
strncmp():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:13
 *   array pointed to by `s2'.  [4.11.4.4]
 */
#include <stddef.h>

__attribute__((visibility("default"))) int strncmp(const char *s1, const char *s2, size_t n)
{
30001340:	55                   	push   ebp
30001341:	89 e5                	mov    ebp,esp
30001343:	e8 1a 11 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30001348:	05 f4 26 00 00       	add    eax,0x26f4
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14
    for ( ; n > 0; s1++, s2++, --n)
3000134d:	eb 4b                	jmp    3000139a <strncmp+0x5a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:15
	if (*s1 != *s2)
3000134f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001352:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30001355:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001358:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000135b:	38 c2                	cmp    dl,al
3000135d:	74 1e                	je     3000137d <strncmp+0x3d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
3000135f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001362:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30001365:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001368:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000136b:	38 c2                	cmp    dl,al
3000136d:	73 07                	jae    30001376 <strncmp+0x36>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16 (discriminator 1)
3000136f:	b8 ff ff ff ff       	mov    eax,0xffffffff
30001374:	eb 2f                	jmp    300013a5 <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16 (discriminator 2)
30001376:	b8 01 00 00 00       	mov    eax,0x1
3000137b:	eb 28                	jmp    300013a5 <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:17
	else if (*s1 == '\0')
3000137d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001380:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001383:	84 c0                	test   al,al
30001385:	75 07                	jne    3000138e <strncmp+0x4e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:18
	    return 0;
30001387:	b8 00 00 00 00       	mov    eax,0x0
3000138c:	eb 17                	jmp    300013a5 <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14
 */
#include <stddef.h>

__attribute__((visibility("default"))) int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
3000138e:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
30001392:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
30001396:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14 (discriminator 1)
3000139a:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
3000139e:	75 af                	jne    3000134f <strncmp+0xf>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:19
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
    return 0;
300013a0:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:20
}
300013a5:	5d                   	pop    ebp
300013a6:	c3                   	ret    
300013a7:	90                   	nop

300013a8 <strncpy>:
strncpy():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:14
 *   The `strncpy' function returns the value of `s1'.  [4.11.2.4]
 */
#include <stddef.h>

__attribute__((visibility("default"))) char * strncpy(char *s1, const char *s2, size_t n)
{
300013a8:	55                   	push   ebp
300013a9:	89 e5                	mov    ebp,esp
300013ab:	83 ec 10             	sub    esp,0x10
300013ae:	e8 af 10 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300013b3:	05 89 26 00 00       	add    eax,0x2689
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:15
    char *s = s1;
300013b8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300013bb:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16
    while (n > 0 && *s2 != '\0') {
300013be:	eb 1b                	jmp    300013db <strncpy+0x33>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:17
	*s++ = *s2++;
300013c0:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300013c3:	8d 50 01             	lea    edx,[eax+0x1]
300013c6:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
300013c9:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
300013cc:	8d 4a 01             	lea    ecx,[edx+0x1]
300013cf:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
300013d2:	0f b6 12             	movzx  edx,BYTE PTR [edx]
300013d5:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:18
	--n;
300013d7:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16
#include <stddef.h>

__attribute__((visibility("default"))) char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
300013db:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
300013df:	74 1c                	je     300013fd <strncpy+0x55>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16 (discriminator 1)
300013e1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300013e4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300013e7:	84 c0                	test   al,al
300013e9:	75 d5                	jne    300013c0 <strncpy+0x18>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:20
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
300013eb:	eb 10                	jmp    300013fd <strncpy+0x55>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:21
	*s++ = '\0';
300013ed:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300013f0:	8d 50 01             	lea    edx,[eax+0x1]
300013f3:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
300013f6:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:22
	--n;
300013f9:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:20
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
300013fd:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30001401:	75 ea                	jne    300013ed <strncpy+0x45>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:24
	*s++ = '\0';
	--n;
    }
    return s1;
30001403:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:25
}
30001406:	c9                   	leave  
30001407:	c3                   	ret    

30001408 <strtoul>:
strtoul():
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:60
 * Ignores `locale' stuff.  Assumes that the upper and lower case
 * alphabets and digits are each contiguous.
 */
unsigned long
__attribute__((visibility("default"))) strtoul(const char *nptr, char **endptr, register int base)
{
30001408:	55                   	push   ebp
30001409:	89 e5                	mov    ebp,esp
3000140b:	57                   	push   edi
3000140c:	56                   	push   esi
3000140d:	53                   	push   ebx
3000140e:	83 ec 08             	sub    esp,0x8
30001411:	e8 4c 10 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30001416:	05 26 26 00 00       	add    eax,0x2626
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:61
	register const char *s = nptr;
3000141b:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:65
	register unsigned long acc;
	register int c;
	register unsigned long cutoff;
	register int neg = 0, any, cutlim;
3000141e:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:71 (discriminator 1)

	/*
	 * See strtol for comments as to the logic used.
	 */
	do {
		c = *s++;
30001425:	89 f0                	mov    eax,esi
30001427:	8d 70 01             	lea    esi,[eax+0x1]
3000142a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000142d:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:72 (discriminator 1)
	} while (c==' ');
30001430:	83 fb 20             	cmp    ebx,0x20
30001433:	74 f0                	je     30001425 <strtoul+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:73
	if (c == '-') {
30001435:	83 fb 2d             	cmp    ebx,0x2d
30001438:	75 14                	jne    3000144e <strtoul+0x46>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:74
		neg = 1;
3000143a:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:75
		c = *s++;
30001441:	89 f0                	mov    eax,esi
30001443:	8d 70 01             	lea    esi,[eax+0x1]
30001446:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001449:	0f be d8             	movsx  ebx,al
3000144c:	eb 10                	jmp    3000145e <strtoul+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:76
	} else if (c == '+')
3000144e:	83 fb 2b             	cmp    ebx,0x2b
30001451:	75 0b                	jne    3000145e <strtoul+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:77
		c = *s++;
30001453:	89 f0                	mov    eax,esi
30001455:	8d 70 01             	lea    esi,[eax+0x1]
30001458:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000145b:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78
	if ((base == 0 || base == 16) &&
3000145e:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30001462:	74 06                	je     3000146a <strtoul+0x62>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78 (discriminator 2)
30001464:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
30001468:	75 26                	jne    30001490 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78 (discriminator 3)
3000146a:	83 fb 30             	cmp    ebx,0x30
3000146d:	75 21                	jne    30001490 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:79
	    c == '0' && (*s == 'x' || *s == 'X')) {
3000146f:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30001472:	3c 78                	cmp    al,0x78
30001474:	74 07                	je     3000147d <strtoul+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:79 (discriminator 1)
30001476:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30001479:	3c 58                	cmp    al,0x58
3000147b:	75 13                	jne    30001490 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:80
		c = s[1];
3000147d:	8d 46 01             	lea    eax,[esi+0x1]
30001480:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001483:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:81
		s += 2;
30001486:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:82
		base = 16;
30001489:	c7 45 10 10 00 00 00 	mov    DWORD PTR [ebp+0x10],0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:84
	}
	if (base == 0)
30001490:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30001494:	75 14                	jne    300014aa <strtoul+0xa2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85
		base = c == '0' ? 8 : 10;
30001496:	83 fb 30             	cmp    ebx,0x30
30001499:	75 07                	jne    300014a2 <strtoul+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 1)
3000149b:	b8 08 00 00 00       	mov    eax,0x8
300014a0:	eb 05                	jmp    300014a7 <strtoul+0x9f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 2)
300014a2:	b8 0a 00 00 00       	mov    eax,0xa
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 4)
300014a7:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:86
	cutoff = (unsigned long)ULONG_MAX / (unsigned long)base;
300014aa:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
300014ad:	b8 ff ff ff ff       	mov    eax,0xffffffff
300014b2:	ba 00 00 00 00       	mov    edx,0x0
300014b7:	f7 f1                	div    ecx
300014b9:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:87
	cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;
300014bc:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
300014bf:	b8 ff ff ff ff       	mov    eax,0xffffffff
300014c4:	ba 00 00 00 00       	mov    edx,0x0
300014c9:	f7 f1                	div    ecx
300014cb:	89 d0                	mov    eax,edx
300014cd:	89 c2                	mov    edx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:88
	for (acc = 0, any = 0;; c = *s++) {
300014cf:	bf 00 00 00 00       	mov    edi,0x0
300014d4:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:89
		if (ISDIGIT(c))
300014d9:	8d 43 d0             	lea    eax,[ebx-0x30]
300014dc:	83 f8 09             	cmp    eax,0x9
300014df:	77 05                	ja     300014e6 <strtoul+0xde>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:90
			c -= '0';
300014e1:	83 eb 30             	sub    ebx,0x30
300014e4:	eb 25                	jmp    3000150b <strtoul+0x103>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:91
		else if (ISALPHA(c))
300014e6:	89 d8                	mov    eax,ebx
300014e8:	83 c8 20             	or     eax,0x20
300014eb:	83 e8 61             	sub    eax,0x61
300014ee:	83 f8 19             	cmp    eax,0x19
300014f1:	77 56                	ja     30001549 <strtoul+0x141>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
300014f3:	83 fb 40             	cmp    ebx,0x40
300014f6:	7e 0c                	jle    30001504 <strtoul+0xfc>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 1)
300014f8:	83 fb 5a             	cmp    ebx,0x5a
300014fb:	7f 07                	jg     30001504 <strtoul+0xfc>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 3)
300014fd:	b8 37 00 00 00       	mov    eax,0x37
30001502:	eb 05                	jmp    30001509 <strtoul+0x101>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 4)
30001504:	b8 57 00 00 00       	mov    eax,0x57
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 6)
30001509:	29 c3                	sub    ebx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:95
		else
			break;
		if (c >= base)
3000150b:	3b 5d 10             	cmp    ebx,DWORD PTR [ebp+0x10]
3000150e:	7d 3c                	jge    3000154c <strtoul+0x144>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97
			break;
		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
30001510:	89 c8                	mov    eax,ecx
30001512:	85 c0                	test   eax,eax
30001514:	78 10                	js     30001526 <strtoul+0x11e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 1)
30001516:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30001519:	77 0b                	ja     30001526 <strtoul+0x11e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 2)
3000151b:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
3000151e:	75 0d                	jne    3000152d <strtoul+0x125>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 3)
30001520:	89 d0                	mov    eax,edx
30001522:	39 c3                	cmp    ebx,eax
30001524:	7e 07                	jle    3000152d <strtoul+0x125>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:98
			any = -1;
30001526:	b9 ff ff ff ff       	mov    ecx,0xffffffff
3000152b:	eb 0f                	jmp    3000153c <strtoul+0x134>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:100
		else {
			any = 1;
3000152d:	b9 01 00 00 00       	mov    ecx,0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:101
			acc *= base;
30001532:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30001535:	0f af f8             	imul   edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:102
			acc += c;
30001538:	89 d8                	mov    eax,ebx
3000153a:	01 c7                	add    edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:88
	}
	if (base == 0)
		base = c == '0' ? 8 : 10;
	cutoff = (unsigned long)ULONG_MAX / (unsigned long)base;
	cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;
	for (acc = 0, any = 0;; c = *s++) {
3000153c:	89 f0                	mov    eax,esi
3000153e:	8d 70 01             	lea    esi,[eax+0x1]
30001541:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001544:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:104
		else {
			any = 1;
			acc *= base;
			acc += c;
		}
	}
30001547:	eb 90                	jmp    300014d9 <strtoul+0xd1>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:94
		if (ISDIGIT(c))
			c -= '0';
		else if (ISALPHA(c))
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
		else
			break;
30001549:	90                   	nop
3000154a:	eb 01                	jmp    3000154d <strtoul+0x145>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:96
		if (c >= base)
			break;
3000154c:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:105
			any = 1;
			acc *= base;
			acc += c;
		}
	}
	if (any < 0) {
3000154d:	89 c8                	mov    eax,ecx
3000154f:	85 c0                	test   eax,eax
30001551:	79 07                	jns    3000155a <strtoul+0x152>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:106
		acc = ULONG_MAX;
30001553:	bf ff ff ff ff       	mov    edi,0xffffffff
30001558:	eb 08                	jmp    30001562 <strtoul+0x15a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:107
	} else if (neg)
3000155a:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
3000155e:	74 02                	je     30001562 <strtoul+0x15a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:108
		acc = -acc;
30001560:	f7 df                	neg    edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:109
	if (endptr != 0)
30001562:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
30001566:	74 13                	je     3000157b <strtoul+0x173>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110
		*endptr = (char *) (any ? s - 1 : nptr);
30001568:	89 c8                	mov    eax,ecx
3000156a:	85 c0                	test   eax,eax
3000156c:	74 05                	je     30001573 <strtoul+0x16b>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 1)
3000156e:	8d 46 ff             	lea    eax,[esi-0x1]
30001571:	eb 03                	jmp    30001576 <strtoul+0x16e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 2)
30001573:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 4)
30001576:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001579:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:111
	return (acc);
3000157b:	89 f8                	mov    eax,edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:112
}
3000157d:	83 c4 08             	add    esp,0x8
30001580:	5b                   	pop    ebx
30001581:	5e                   	pop    esi
30001582:	5f                   	pop    edi
30001583:	5d                   	pop    ebp
30001584:	c3                   	ret    
30001585:	66 90                	xchg   ax,ax
30001587:	90                   	nop

30001588 <strleft>:
strleft():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:2
__attribute__((visibility("default"))) char* strleft(char* val, int cnt)
{
30001588:	55                   	push   ebp
30001589:	89 e5                	mov    ebp,esp
3000158b:	e8 d2 0e 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30001590:	05 ac 24 00 00       	add    eax,0x24ac
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:3
    val[cnt]='\0';
30001595:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001598:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000159b:	01 d0                	add    eax,edx
3000159d:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:4
    return val;
300015a0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:5
}
300015a3:	5d                   	pop    ebp
300015a4:	c3                   	ret    
300015a5:	66 90                	xchg   ax,ax
300015a7:	90                   	nop

300015a8 <strtol>:
strtol():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:88
 * Ignores `locale' stuff.  Assumes that the upper and lower case
 * alphabets and digits are each contiguous.
 */
__attribute__((visibility("default"))) long
strtol(const char *nptr, char **endptr, register int base)
{
300015a8:	55                   	push   ebp
300015a9:	89 e5                	mov    ebp,esp
300015ab:	57                   	push   edi
300015ac:	56                   	push   esi
300015ad:	53                   	push   ebx
300015ae:	83 ec 0c             	sub    esp,0xc
300015b1:	e8 ac 0e 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300015b6:	05 86 24 00 00       	add    eax,0x2486
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:89
	register const char *s = nptr;
300015bb:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:93
	register unsigned long acc;
	register int c;
	register unsigned long cutoff;
	register int neg = 0, any, cutlim;
300015be:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:101 (discriminator 1)
	 * Skip white space and pick up leading +/- sign if any.
	 * If base is 0, allow 0x for hex and 0 for octal, else
	 * assume decimal; if base is already 16, allow 0x.
	 */
	do {
		c = *s++;
300015c5:	89 f0                	mov    eax,esi
300015c7:	8d 70 01             	lea    esi,[eax+0x1]
300015ca:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300015cd:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:102 (discriminator 1)
	} while (c==' ');
300015d0:	83 fb 20             	cmp    ebx,0x20
300015d3:	74 f0                	je     300015c5 <strtol+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:103
	if (c == '-') {
300015d5:	83 fb 2d             	cmp    ebx,0x2d
300015d8:	75 14                	jne    300015ee <strtol+0x46>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:104
		neg = 1;
300015da:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:105
		c = *s++;
300015e1:	89 f0                	mov    eax,esi
300015e3:	8d 70 01             	lea    esi,[eax+0x1]
300015e6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300015e9:	0f be d8             	movsx  ebx,al
300015ec:	eb 10                	jmp    300015fe <strtol+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:106
	} else if (c == '+')
300015ee:	83 fb 2b             	cmp    ebx,0x2b
300015f1:	75 0b                	jne    300015fe <strtol+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:107
		c = *s++;
300015f3:	89 f0                	mov    eax,esi
300015f5:	8d 70 01             	lea    esi,[eax+0x1]
300015f8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300015fb:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108
	if ((base == 0 || base == 16) &&
300015fe:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30001602:	74 06                	je     3000160a <strtol+0x62>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108 (discriminator 2)
30001604:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
30001608:	75 26                	jne    30001630 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108 (discriminator 3)
3000160a:	83 fb 30             	cmp    ebx,0x30
3000160d:	75 21                	jne    30001630 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:109
	    c == '0' && (*s == 'x' || *s == 'X')) {
3000160f:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30001612:	3c 78                	cmp    al,0x78
30001614:	74 07                	je     3000161d <strtol+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:109 (discriminator 1)
30001616:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30001619:	3c 58                	cmp    al,0x58
3000161b:	75 13                	jne    30001630 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:110
		c = s[1];
3000161d:	8d 46 01             	lea    eax,[esi+0x1]
30001620:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001623:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:111
		s += 2;
30001626:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:112
		base = 16;
30001629:	c7 45 10 10 00 00 00 	mov    DWORD PTR [ebp+0x10],0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:114
	}
	if (base == 0)
30001630:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30001634:	75 14                	jne    3000164a <strtol+0xa2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115
		base = c == '0' ? 8 : 10;
30001636:	83 fb 30             	cmp    ebx,0x30
30001639:	75 07                	jne    30001642 <strtol+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 1)
3000163b:	b8 08 00 00 00       	mov    eax,0x8
30001640:	eb 05                	jmp    30001647 <strtol+0x9f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 2)
30001642:	b8 0a 00 00 00       	mov    eax,0xa
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 4)
30001647:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134
	 * the number is too big, and we will return a range error.
	 *
	 * Set any if any `digits' consumed; make it negative to indicate
	 * overflow.
	 */
	cutoff = neg ? -(unsigned long)LONG_MIN : LONG_MAX;
3000164a:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
3000164e:	74 07                	je     30001657 <strtol+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134 (discriminator 1)
30001650:	b8 00 00 00 80       	mov    eax,0x80000000
30001655:	eb 05                	jmp    3000165c <strtol+0xb4>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134 (discriminator 2)
30001657:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:135 (discriminator 4)
	cutlim = cutoff % (unsigned long)base;
3000165c:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
3000165f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
30001662:	ba 00 00 00 00       	mov    edx,0x0
30001667:	f7 f1                	div    ecx
30001669:	89 d1                	mov    ecx,edx
3000166b:	89 c8                	mov    eax,ecx
3000166d:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:136 (discriminator 4)
	cutoff /= (unsigned long)base;
30001670:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
30001673:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001676:	ba 00 00 00 00       	mov    edx,0x0
3000167b:	f7 f7                	div    edi
3000167d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:137 (discriminator 4)
	for (acc = 0, any = 0;; c = *s++) {
30001680:	bf 00 00 00 00       	mov    edi,0x0
30001685:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:138
		if (ISDIGIT(c))
3000168a:	8d 43 d0             	lea    eax,[ebx-0x30]
3000168d:	83 f8 09             	cmp    eax,0x9
30001690:	77 05                	ja     30001697 <strtol+0xef>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:139
			c -= '0';
30001692:	83 eb 30             	sub    ebx,0x30
30001695:	eb 25                	jmp    300016bc <strtol+0x114>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:140
		else if (ISALPHA(c))
30001697:	89 d8                	mov    eax,ebx
30001699:	83 c8 20             	or     eax,0x20
3000169c:	83 e8 61             	sub    eax,0x61
3000169f:	83 f8 19             	cmp    eax,0x19
300016a2:	77 55                	ja     300016f9 <strtol+0x151>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
300016a4:	83 fb 40             	cmp    ebx,0x40
300016a7:	7e 0c                	jle    300016b5 <strtol+0x10d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 1)
300016a9:	83 fb 5a             	cmp    ebx,0x5a
300016ac:	7f 07                	jg     300016b5 <strtol+0x10d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 3)
300016ae:	b8 37 00 00 00       	mov    eax,0x37
300016b3:	eb 05                	jmp    300016ba <strtol+0x112>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 4)
300016b5:	b8 57 00 00 00       	mov    eax,0x57
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 6)
300016ba:	29 c3                	sub    ebx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:144
		else
			break;
		if (c >= base)
300016bc:	3b 5d 10             	cmp    ebx,DWORD PTR [ebp+0x10]
300016bf:	7d 3b                	jge    300016fc <strtol+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146
			break;
		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
300016c1:	89 c8                	mov    eax,ecx
300016c3:	85 c0                	test   eax,eax
300016c5:	78 0f                	js     300016d6 <strtol+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 1)
300016c7:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
300016ca:	77 0a                	ja     300016d6 <strtol+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 2)
300016cc:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
300016cf:	75 0c                	jne    300016dd <strtol+0x135>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 3)
300016d1:	3b 5d e8             	cmp    ebx,DWORD PTR [ebp-0x18]
300016d4:	7e 07                	jle    300016dd <strtol+0x135>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:147
			any = -1;
300016d6:	b9 ff ff ff ff       	mov    ecx,0xffffffff
300016db:	eb 0f                	jmp    300016ec <strtol+0x144>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:149
		else {
			any = 1;
300016dd:	b9 01 00 00 00       	mov    ecx,0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:150
			acc *= base;
300016e2:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300016e5:	0f af f8             	imul   edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:151
			acc += c;
300016e8:	89 d8                	mov    eax,ebx
300016ea:	01 c7                	add    edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:137
	 * overflow.
	 */
	cutoff = neg ? -(unsigned long)LONG_MIN : LONG_MAX;
	cutlim = cutoff % (unsigned long)base;
	cutoff /= (unsigned long)base;
	for (acc = 0, any = 0;; c = *s++) {
300016ec:	89 f0                	mov    eax,esi
300016ee:	8d 70 01             	lea    esi,[eax+0x1]
300016f1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300016f4:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:153
		else {
			any = 1;
			acc *= base;
			acc += c;
		}
	}
300016f7:	eb 91                	jmp    3000168a <strtol+0xe2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:143
		if (ISDIGIT(c))
			c -= '0';
		else if (ISALPHA(c))
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
		else
			break;
300016f9:	90                   	nop
300016fa:	eb 01                	jmp    300016fd <strtol+0x155>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:145
		if (c >= base)
			break;
300016fc:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:154
			any = 1;
			acc *= base;
			acc += c;
		}
	}
	if (any < 0) {
300016fd:	89 c8                	mov    eax,ecx
300016ff:	85 c0                	test   eax,eax
30001701:	79 16                	jns    30001719 <strtol+0x171>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155
		acc = neg ? LONG_MIN : LONG_MAX;
30001703:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30001707:	74 07                	je     30001710 <strtol+0x168>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 1)
30001709:	b8 00 00 00 80       	mov    eax,0x80000000
3000170e:	eb 05                	jmp    30001715 <strtol+0x16d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 2)
30001710:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 4)
30001715:	89 c7                	mov    edi,eax
30001717:	eb 08                	jmp    30001721 <strtol+0x179>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:156
	} else if (neg)
30001719:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
3000171d:	74 02                	je     30001721 <strtol+0x179>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:157
		acc = -acc;
3000171f:	f7 df                	neg    edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:158
	if (endptr != 0)
30001721:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
30001725:	74 13                	je     3000173a <strtol+0x192>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159
		*endptr = (char *) (any ? s - 1 : nptr);
30001727:	89 c8                	mov    eax,ecx
30001729:	85 c0                	test   eax,eax
3000172b:	74 05                	je     30001732 <strtol+0x18a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 1)
3000172d:	8d 46 ff             	lea    eax,[esi-0x1]
30001730:	eb 03                	jmp    30001735 <strtol+0x18d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 2)
30001732:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 4)
30001735:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001738:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:160
	return (acc);
3000173a:	89 f8                	mov    eax,edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:161
}
3000173c:	83 c4 0c             	add    esp,0xc
3000173f:	5b                   	pop    ebx
30001740:	5e                   	pop    esi
30001741:	5f                   	pop    edi
30001742:	5d                   	pop    ebp
30001743:	c3                   	ret    

30001744 <strtrim>:
strtrim():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:4
#include "strings.h"

__attribute__((visibility("default"))) void strtrim(char *input)
{
30001744:	55                   	push   ebp
30001745:	89 e5                	mov    ebp,esp
30001747:	53                   	push   ebx
30001748:	83 ec 14             	sub    esp,0x14
3000174b:	e8 12 0d 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30001750:	05 ec 22 00 00       	add    eax,0x22ec
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:5
   char *dst = input, *src = input;
30001755:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001758:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
3000175b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
3000175e:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10
   char *end;

   // Skip whitespace at front...
   //
   while (*src==' ')
30001761:	eb 04                	jmp    30001767 <strtrim+0x23>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:12
   {
      ++src;
30001763:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10
   char *dst = input, *src = input;
   char *end;

   // Skip whitespace at front...
   //
   while (*src==' ')
30001767:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
3000176a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
3000176d:	80 fa 20             	cmp    dl,0x20
30001770:	74 f1                	je     30001763 <strtrim+0x1f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:17
      ++src;
   }

   // Trim at end...
   //
   end = src + strlenI(src) - 1;
30001772:	83 ec 0c             	sub    esp,0xc
30001775:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
30001778:	89 c3                	mov    ebx,eax
3000177a:	e8 8e fb ff ff       	call   3000130d <strlenI>
3000177f:	83 c4 10             	add    esp,0x10
30001782:	8d 50 ff             	lea    edx,[eax-0x1]
30001785:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001788:	01 d0                	add    eax,edx
3000178a:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:18
   while (end > src && *end==' ')
3000178d:	eb 0c                	jmp    3000179b <strtrim+0x57>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:20
   {
      *end-- = 0;
3000178f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001792:	8d 50 ff             	lea    edx,[eax-0x1]
30001795:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
30001798:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:18
   }

   // Trim at end...
   //
   end = src + strlenI(src) - 1;
   while (end > src && *end==' ')
3000179b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
3000179e:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
300017a1:	76 0a                	jbe    300017ad <strtrim+0x69>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:18 (discriminator 1)
300017a3:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
300017a6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300017a9:	3c 20                	cmp    al,0x20
300017ab:	74 e2                	je     3000178f <strtrim+0x4b>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:25
      *end-- = 0;
   }

   // Move if needed.
   //
   if (src != dst)
300017ad:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
300017b0:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
300017b3:	74 1f                	je     300017d4 <strtrim+0x90>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:27
   {
      while ((*dst++ = *src++));
300017b5:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:27 (discriminator 1)
300017b6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300017b9:	8d 50 01             	lea    edx,[eax+0x1]
300017bc:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
300017bf:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
300017c2:	8d 4a 01             	lea    ecx,[edx+0x1]
300017c5:	89 4d f0             	mov    DWORD PTR [ebp-0x10],ecx
300017c8:	0f b6 12             	movzx  edx,BYTE PTR [edx]
300017cb:	88 10                	mov    BYTE PTR [eax],dl
300017cd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300017d0:	84 c0                	test   al,al
300017d2:	75 e2                	jne    300017b6 <strtrim+0x72>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:29
   }
}
300017d4:	90                   	nop
300017d5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300017d8:	c9                   	leave  
300017d9:	c3                   	ret    
300017da:	66 90                	xchg   ax,ax

300017dc <strstr>:
strstr():
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:52
 */

#include "strings.h"

VISIBLE char* strstr(char* string, char* substring)
{
300017dc:	55                   	push   ebp
300017dd:	89 e5                	mov    ebp,esp
300017df:	56                   	push   esi
300017e0:	53                   	push   ebx
300017e1:	e8 7c 0c 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
300017e6:	05 56 22 00 00       	add    eax,0x2256
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:60
    /* First scan quickly through the two strings looking for a
     * single-character match.  When it's found, then compare the
     * rest of the substring.
     */

    b = substring;
300017eb:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:61
    if (*b == 0) {
300017ee:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
300017f1:	84 c0                	test   al,al
300017f3:	75 42                	jne    30001837 <strstr+0x5b>
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:62
	return string;
300017f5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017f8:	eb 4c                	jmp    30001846 <strstr+0x6a>
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:65
    }
    for ( ; *string != 0; string += 1) {
	if (*string != *b) {
300017fa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300017fd:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30001800:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
30001803:	38 c2                	cmp    dl,al
30001805:	75 2b                	jne    30001832 <strstr+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:68
	    continue;
	}
	a = string;
30001807:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:70
	while (1) {
	    if (*b == 0) {
3000180a:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
3000180d:	84 c0                	test   al,al
3000180f:	75 05                	jne    30001816 <strstr+0x3a>
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:71
		return string;
30001811:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001814:	eb 30                	jmp    30001846 <strstr+0x6a>
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:73
	    }
	    if (*a++ != *b++) {
30001816:	89 f0                	mov    eax,esi
30001818:	8d 70 01             	lea    esi,[eax+0x1]
3000181b:	0f b6 10             	movzx  edx,BYTE PTR [eax]
3000181e:	89 d8                	mov    eax,ebx
30001820:	8d 58 01             	lea    ebx,[eax+0x1]
30001823:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001826:	38 c2                	cmp    dl,al
30001828:	75 02                	jne    3000182c <strstr+0x50>
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:76
		break;
	    }
	}
3000182a:	eb de                	jmp    3000180a <strstr+0x2e>
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:74
	while (1) {
	    if (*b == 0) {
		return string;
	    }
	    if (*a++ != *b++) {
		break;
3000182c:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:77
	    }
	}
	b = substring;
3000182d:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
30001830:	eb 01                	jmp    30001833 <strstr+0x57>
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:66
    if (*b == 0) {
	return string;
    }
    for ( ; *string != 0; string += 1) {
	if (*string != *b) {
	    continue;
30001832:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:64

    b = substring;
    if (*b == 0) {
	return string;
    }
    for ( ; *string != 0; string += 1) {
30001833:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:64 (discriminator 1)
30001837:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000183a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000183d:	84 c0                	test   al,al
3000183f:	75 b9                	jne    300017fa <strstr+0x1e>
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:79
		break;
	    }
	}
	b = substring;
    }
    return (char *) 0;
30001841:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strstr.c:80
30001846:	5b                   	pop    ebx
30001847:	5e                   	pop    esi
30001848:	5d                   	pop    ebp
30001849:	c3                   	ret    
3000184a:	66 90                	xchg   ax,ax

3000184c <time>:
time():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:23
  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
  {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
};

VISIBLE time_t time(/*time_t* arg*/)
{
3000184c:	55                   	push   ebp
3000184d:	89 e5                	mov    ebp,esp
3000184f:	83 ec 10             	sub    esp,0x10
30001852:	e8 0b 0c 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30001857:	05 e5 21 00 00       	add    eax,0x21e5
/home/yogi/src/os/aproj/libChrisOS/src/time.c:24
    uint32_t retVal=0;
3000185c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:25
    __asm__("call sysEnter_Vector\n":"=a" (retVal):"a" (SYSCALL_GETTICKS));
30001863:	b8 70 01 00 00       	mov    eax,0x170
30001868:	e8 fc ff ff ff       	call   30001869 <time+0x1d>
3000186d:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:26
    return (time_t)retVal;
30001870:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:27
}
30001873:	c9                   	leave  
30001874:	c3                   	ret    

30001875 <gmtime_r>:
gmtime_r():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:30


VISIBLE struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
30001875:	55                   	push   ebp
30001876:	89 e5                	mov    ebp,esp
30001878:	53                   	push   ebx
30001879:	83 ec 10             	sub    esp,0x10
3000187c:	e8 3f 0c 00 00       	call   300024c0 <__x86.get_pc_thunk.bx>
30001881:	81 c3 bb 21 00 00    	add    ebx,0x21bb
/home/yogi/src/os/aproj/libChrisOS/src/time.c:31
  time_t time = *timer;
30001887:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000188a:	8b 00                	mov    eax,DWORD PTR [eax]
3000188c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:33
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;
3000188f:	c7 45 f4 b2 07 00 00 	mov    DWORD PTR [ebp-0xc],0x7b2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:35

  dayclock = (unsigned long) time % SECS_DAY;
30001896:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
30001899:	ba 07 45 2e c2       	mov    edx,0xc22e4507
3000189e:	89 c8                	mov    eax,ecx
300018a0:	f7 e2                	mul    edx
300018a2:	89 d0                	mov    eax,edx
300018a4:	c1 e8 10             	shr    eax,0x10
300018a7:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
300018aa:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
300018ad:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
300018b3:	29 c1                	sub    ecx,eax
300018b5:	89 c8                	mov    eax,ecx
300018b7:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:36
  dayno = (unsigned long) time / SECS_DAY;
300018ba:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
300018bd:	ba 07 45 2e c2       	mov    edx,0xc22e4507
300018c2:	f7 e2                	mul    edx
300018c4:	89 d0                	mov    eax,edx
300018c6:	c1 e8 10             	shr    eax,0x10
300018c9:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:38

  tmbuf->tm_sec = dayclock % 60;
300018cc:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
300018cf:	ba 89 88 88 88       	mov    edx,0x88888889
300018d4:	89 c8                	mov    eax,ecx
300018d6:	f7 e2                	mul    edx
300018d8:	89 d0                	mov    eax,edx
300018da:	c1 e8 05             	shr    eax,0x5
300018dd:	89 c2                	mov    edx,eax
300018df:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
300018e6:	89 c2                	mov    edx,eax
300018e8:	89 d0                	mov    eax,edx
300018ea:	c1 e0 04             	shl    eax,0x4
300018ed:	29 d0                	sub    eax,edx
300018ef:	29 c1                	sub    ecx,eax
300018f1:	89 c8                	mov    eax,ecx
300018f3:	89 c2                	mov    edx,eax
300018f5:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300018f8:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:39
  tmbuf->tm_min = (dayclock % 3600) / 60;
300018fa:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
300018fd:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
30001902:	89 c8                	mov    eax,ecx
30001904:	f7 e2                	mul    edx
30001906:	89 d0                	mov    eax,edx
30001908:	c1 e8 0b             	shr    eax,0xb
3000190b:	69 c0 10 0e 00 00    	imul   eax,eax,0xe10
30001911:	29 c1                	sub    ecx,eax
30001913:	89 c8                	mov    eax,ecx
30001915:	ba 89 88 88 88       	mov    edx,0x88888889
3000191a:	f7 e2                	mul    edx
3000191c:	89 d0                	mov    eax,edx
3000191e:	c1 e8 05             	shr    eax,0x5
30001921:	89 c2                	mov    edx,eax
30001923:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001926:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:40
  tmbuf->tm_hour = dayclock / 3600;
30001929:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
3000192c:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
30001931:	f7 e2                	mul    edx
30001933:	89 d0                	mov    eax,edx
30001935:	c1 e8 0b             	shr    eax,0xb
30001938:	89 c2                	mov    edx,eax
3000193a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000193d:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:41
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
30001940:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30001943:	8d 48 04             	lea    ecx,[eax+0x4]
30001946:	ba 25 49 92 24       	mov    edx,0x24924925
3000194b:	89 c8                	mov    eax,ecx
3000194d:	f7 e2                	mul    edx
3000194f:	89 c8                	mov    eax,ecx
30001951:	29 d0                	sub    eax,edx
30001953:	d1 e8                	shr    eax,1
30001955:	01 d0                	add    eax,edx
30001957:	c1 e8 02             	shr    eax,0x2
3000195a:	89 c2                	mov    edx,eax
3000195c:	c1 e2 03             	shl    edx,0x3
3000195f:	29 c2                	sub    edx,eax
30001961:	89 c8                	mov    eax,ecx
30001963:	29 d0                	sub    eax,edx
30001965:	89 c2                	mov    edx,eax
30001967:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000196a:	89 50 18             	mov    DWORD PTR [eax+0x18],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42
  while (dayno >= (unsigned long) YEARSIZE(year)) {
3000196d:	eb 66                	jmp    300019d5 <gmtime_r+0x160>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43
    dayno -= YEARSIZE(year);
3000196f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001972:	83 e0 03             	and    eax,0x3
30001975:	85 c0                	test   eax,eax
30001977:	75 50                	jne    300019c9 <gmtime_r+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43 (discriminator 1)
30001979:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
3000197c:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001981:	89 c8                	mov    eax,ecx
30001983:	f7 ea                	imul   edx
30001985:	c1 fa 05             	sar    edx,0x5
30001988:	89 c8                	mov    eax,ecx
3000198a:	c1 f8 1f             	sar    eax,0x1f
3000198d:	29 c2                	sub    edx,eax
3000198f:	89 d0                	mov    eax,edx
30001991:	6b c0 64             	imul   eax,eax,0x64
30001994:	29 c1                	sub    ecx,eax
30001996:	89 c8                	mov    eax,ecx
30001998:	85 c0                	test   eax,eax
3000199a:	75 26                	jne    300019c2 <gmtime_r+0x14d>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43 (discriminator 4)
3000199c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
3000199f:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300019a4:	89 c8                	mov    eax,ecx
300019a6:	f7 ea                	imul   edx
300019a8:	c1 fa 07             	sar    edx,0x7
300019ab:	89 c8                	mov    eax,ecx
300019ad:	c1 f8 1f             	sar    eax,0x1f
300019b0:	29 c2                	sub    edx,eax
300019b2:	89 d0                	mov    eax,edx
300019b4:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300019ba:	29 c1                	sub    ecx,eax
300019bc:	89 c8                	mov    eax,ecx
300019be:	85 c0                	test   eax,eax
300019c0:	75 07                	jne    300019c9 <gmtime_r+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43 (discriminator 5)
300019c2:	b8 6e 01 00 00       	mov    eax,0x16e
300019c7:	eb 05                	jmp    300019ce <gmtime_r+0x159>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43 (discriminator 6)
300019c9:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43 (discriminator 8)
300019ce:	29 45 f8             	sub    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:44 (discriminator 8)
    year++;
300019d1:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
300019d5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300019d8:	83 e0 03             	and    eax,0x3
300019db:	85 c0                	test   eax,eax
300019dd:	75 50                	jne    30001a2f <gmtime_r+0x1ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42 (discriminator 1)
300019df:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300019e2:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300019e7:	89 c8                	mov    eax,ecx
300019e9:	f7 ea                	imul   edx
300019eb:	c1 fa 05             	sar    edx,0x5
300019ee:	89 c8                	mov    eax,ecx
300019f0:	c1 f8 1f             	sar    eax,0x1f
300019f3:	29 c2                	sub    edx,eax
300019f5:	89 d0                	mov    eax,edx
300019f7:	6b c0 64             	imul   eax,eax,0x64
300019fa:	29 c1                	sub    ecx,eax
300019fc:	89 c8                	mov    eax,ecx
300019fe:	85 c0                	test   eax,eax
30001a00:	75 26                	jne    30001a28 <gmtime_r+0x1b3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42 (discriminator 4)
30001a02:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001a05:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001a0a:	89 c8                	mov    eax,ecx
30001a0c:	f7 ea                	imul   edx
30001a0e:	c1 fa 07             	sar    edx,0x7
30001a11:	89 c8                	mov    eax,ecx
30001a13:	c1 f8 1f             	sar    eax,0x1f
30001a16:	29 c2                	sub    edx,eax
30001a18:	89 d0                	mov    eax,edx
30001a1a:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001a20:	29 c1                	sub    ecx,eax
30001a22:	89 c8                	mov    eax,ecx
30001a24:	85 c0                	test   eax,eax
30001a26:	75 07                	jne    30001a2f <gmtime_r+0x1ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42 (discriminator 5)
30001a28:	b8 6e 01 00 00       	mov    eax,0x16e
30001a2d:	eb 05                	jmp    30001a34 <gmtime_r+0x1bf>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42 (discriminator 6)
30001a2f:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42 (discriminator 8)
30001a34:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
30001a37:	0f 86 32 ff ff ff    	jbe    3000196f <gmtime_r+0xfa>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:46
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
30001a3d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001a40:	8d 90 94 f8 ff ff    	lea    edx,[eax-0x76c]
30001a46:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001a49:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:47
  tmbuf->tm_yday = dayno;
30001a4c:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30001a4f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001a52:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:48
  tmbuf->tm_mon = 0;
30001a55:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001a58:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
30001a5f:	e9 89 00 00 00       	jmp    30001aed <gmtime_r+0x278>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
30001a64:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001a67:	83 e0 03             	and    eax,0x3
30001a6a:	85 c0                	test   eax,eax
30001a6c:	75 50                	jne    30001abe <gmtime_r+0x249>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50 (discriminator 1)
30001a6e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001a71:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001a76:	89 c8                	mov    eax,ecx
30001a78:	f7 ea                	imul   edx
30001a7a:	c1 fa 05             	sar    edx,0x5
30001a7d:	89 c8                	mov    eax,ecx
30001a7f:	c1 f8 1f             	sar    eax,0x1f
30001a82:	29 c2                	sub    edx,eax
30001a84:	89 d0                	mov    eax,edx
30001a86:	6b c0 64             	imul   eax,eax,0x64
30001a89:	29 c1                	sub    ecx,eax
30001a8b:	89 c8                	mov    eax,ecx
30001a8d:	85 c0                	test   eax,eax
30001a8f:	75 26                	jne    30001ab7 <gmtime_r+0x242>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50 (discriminator 4)
30001a91:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001a94:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001a99:	89 c8                	mov    eax,ecx
30001a9b:	f7 ea                	imul   edx
30001a9d:	c1 fa 07             	sar    edx,0x7
30001aa0:	89 c8                	mov    eax,ecx
30001aa2:	c1 f8 1f             	sar    eax,0x1f
30001aa5:	29 c2                	sub    edx,eax
30001aa7:	89 d0                	mov    eax,edx
30001aa9:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001aaf:	29 c1                	sub    ecx,eax
30001ab1:	89 c8                	mov    eax,ecx
30001ab3:	85 c0                	test   eax,eax
30001ab5:	75 07                	jne    30001abe <gmtime_r+0x249>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50 (discriminator 5)
30001ab7:	ba 01 00 00 00       	mov    edx,0x1
30001abc:	eb 05                	jmp    30001ac3 <gmtime_r+0x24e>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50 (discriminator 6)
30001abe:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50 (discriminator 8)
30001ac3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001ac6:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
30001ac9:	89 d0                	mov    eax,edx
30001acb:	01 c0                	add    eax,eax
30001acd:	01 d0                	add    eax,edx
30001acf:	c1 e0 02             	shl    eax,0x2
30001ad2:	01 c8                	add    eax,ecx
30001ad4:	8b 84 83 24 fd ff ff 	mov    eax,DWORD PTR [ebx+eax*4-0x2dc]
30001adb:	29 45 f8             	sub    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:51 (discriminator 8)
    tmbuf->tm_mon++;
30001ade:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001ae1:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001ae4:	8d 50 01             	lea    edx,[eax+0x1]
30001ae7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001aea:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
30001aed:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001af0:	83 e0 03             	and    eax,0x3
30001af3:	85 c0                	test   eax,eax
30001af5:	75 50                	jne    30001b47 <gmtime_r+0x2d2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49 (discriminator 1)
30001af7:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001afa:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001aff:	89 c8                	mov    eax,ecx
30001b01:	f7 ea                	imul   edx
30001b03:	c1 fa 05             	sar    edx,0x5
30001b06:	89 c8                	mov    eax,ecx
30001b08:	c1 f8 1f             	sar    eax,0x1f
30001b0b:	29 c2                	sub    edx,eax
30001b0d:	89 d0                	mov    eax,edx
30001b0f:	6b c0 64             	imul   eax,eax,0x64
30001b12:	29 c1                	sub    ecx,eax
30001b14:	89 c8                	mov    eax,ecx
30001b16:	85 c0                	test   eax,eax
30001b18:	75 26                	jne    30001b40 <gmtime_r+0x2cb>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49 (discriminator 4)
30001b1a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001b1d:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001b22:	89 c8                	mov    eax,ecx
30001b24:	f7 ea                	imul   edx
30001b26:	c1 fa 07             	sar    edx,0x7
30001b29:	89 c8                	mov    eax,ecx
30001b2b:	c1 f8 1f             	sar    eax,0x1f
30001b2e:	29 c2                	sub    edx,eax
30001b30:	89 d0                	mov    eax,edx
30001b32:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001b38:	29 c1                	sub    ecx,eax
30001b3a:	89 c8                	mov    eax,ecx
30001b3c:	85 c0                	test   eax,eax
30001b3e:	75 07                	jne    30001b47 <gmtime_r+0x2d2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49 (discriminator 5)
30001b40:	ba 01 00 00 00       	mov    edx,0x1
30001b45:	eb 05                	jmp    30001b4c <gmtime_r+0x2d7>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49 (discriminator 6)
30001b47:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49 (discriminator 8)
30001b4c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001b4f:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
30001b52:	89 d0                	mov    eax,edx
30001b54:	01 c0                	add    eax,eax
30001b56:	01 d0                	add    eax,edx
30001b58:	c1 e0 02             	shl    eax,0x2
30001b5b:	01 c8                	add    eax,ecx
30001b5d:	8b 84 83 24 fd ff ff 	mov    eax,DWORD PTR [ebx+eax*4-0x2dc]
30001b64:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
30001b67:	0f 86 f7 fe ff ff    	jbe    30001a64 <gmtime_r+0x1ef>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:53
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
30001b6d:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30001b70:	83 c0 01             	add    eax,0x1
30001b73:	89 c2                	mov    edx,eax
30001b75:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001b78:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:54
  tmbuf->tm_isdst = 0;
30001b7b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001b7e:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:55
  return tmbuf;
30001b85:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:56
}
30001b88:	83 c4 10             	add    esp,0x10
30001b8b:	5b                   	pop    ebx
30001b8c:	5d                   	pop    ebp
30001b8d:	c3                   	ret    

30001b8e <localtime>:
localtime():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:58

VISIBLE struct tm *localtime(const time_t *timer) {
30001b8e:	55                   	push   ebp
30001b8f:	89 e5                	mov    ebp,esp
30001b91:	53                   	push   ebx
30001b92:	83 ec 34             	sub    esp,0x34
30001b95:	e8 c8 08 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30001b9a:	05 a2 1e 00 00       	add    eax,0x1ea2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:62
  time_t t;
  struct tm tmbuf;
  
  t = *timer - libcTZ;
30001b9f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001ba2:	8b 0a                	mov    ecx,DWORD PTR [edx]
30001ba4:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
30001baa:	8b 12                	mov    edx,DWORD PTR [edx]
30001bac:	29 d1                	sub    ecx,edx
30001bae:	89 ca                	mov    edx,ecx
30001bb0:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:63
  return gmtime_r(&t, &tmbuf);
30001bb3:	83 ec 08             	sub    esp,0x8
30001bb6:	8d 55 c8             	lea    edx,[ebp-0x38]
30001bb9:	52                   	push   edx
30001bba:	8d 55 f4             	lea    edx,[ebp-0xc]
30001bbd:	52                   	push   edx
30001bbe:	89 c3                	mov    ebx,eax
30001bc0:	e8 db 08 00 00       	call   300024a0 <__x86.get_pc_thunk.ax+0x3e>
30001bc5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:64
}
30001bc8:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30001bcb:	c9                   	leave  
30001bcc:	c3                   	ret    

30001bcd <localtime_r>:
localtime_r():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66

VISIBLE struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
30001bcd:	55                   	push   ebp
30001bce:	89 e5                	mov    ebp,esp
30001bd0:	53                   	push   ebx
30001bd1:	83 ec 14             	sub    esp,0x14
30001bd4:	e8 89 08 00 00       	call   30002462 <__x86.get_pc_thunk.ax>
30001bd9:	05 63 1e 00 00       	add    eax,0x1e63
/home/yogi/src/os/aproj/libChrisOS/src/time.c:69
  time_t t;

  t = *timer - libcTZ;
30001bde:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001be1:	8b 0a                	mov    ecx,DWORD PTR [edx]
30001be3:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
30001be9:	8b 12                	mov    edx,DWORD PTR [edx]
30001beb:	29 d1                	sub    ecx,edx
30001bed:	89 ca                	mov    edx,ecx
30001bef:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:70
  return gmtime_r(&t, tmbuf);
30001bf2:	83 ec 08             	sub    esp,0x8
30001bf5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30001bf8:	8d 55 f4             	lea    edx,[ebp-0xc]
30001bfb:	52                   	push   edx
30001bfc:	89 c3                	mov    ebx,eax
30001bfe:	e8 9d 08 00 00       	call   300024a0 <__x86.get_pc_thunk.ax+0x3e>
30001c03:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:71
}
30001c06:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30001c09:	c9                   	leave  
30001c0a:	c3                   	ret    

30001c0b <mktime>:
mktime():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73

VISIBLE time_t mktime(struct tm *tmbuf) {
30001c0b:	55                   	push   ebp
30001c0c:	89 e5                	mov    ebp,esp
30001c0e:	57                   	push   edi
30001c0f:	56                   	push   esi
30001c10:	53                   	push   ebx
30001c11:	83 ec 20             	sub    esp,0x20
30001c14:	e8 af 08 00 00       	call   300024c8 <__x86.get_pc_thunk.cx>
30001c19:	81 c1 23 1e 00 00    	add    ecx,0x1e23
/home/yogi/src/os/aproj/libChrisOS/src/time.c:81
  int yday, month;
  long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
30001c1f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c22:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
30001c25:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c28:	8b 18                	mov    ebx,DWORD PTR [eax]
30001c2a:	ba 89 88 88 88       	mov    edx,0x88888889
30001c2f:	89 d8                	mov    eax,ebx
30001c31:	f7 ea                	imul   edx
30001c33:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001c36:	c1 f8 05             	sar    eax,0x5
30001c39:	89 c2                	mov    edx,eax
30001c3b:	89 d8                	mov    eax,ebx
30001c3d:	c1 f8 1f             	sar    eax,0x1f
30001c40:	29 c2                	sub    edx,eax
30001c42:	89 d0                	mov    eax,edx
30001c44:	8d 14 06             	lea    edx,[esi+eax*1]
30001c47:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c4a:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:82
  tmbuf->tm_sec %= 60;
30001c4d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c50:	8b 18                	mov    ebx,DWORD PTR [eax]
30001c52:	ba 89 88 88 88       	mov    edx,0x88888889
30001c57:	89 d8                	mov    eax,ebx
30001c59:	f7 ea                	imul   edx
30001c5b:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001c5e:	c1 f8 05             	sar    eax,0x5
30001c61:	89 c2                	mov    edx,eax
30001c63:	89 d8                	mov    eax,ebx
30001c65:	c1 f8 1f             	sar    eax,0x1f
30001c68:	29 c2                	sub    edx,eax
30001c6a:	89 d0                	mov    eax,edx
30001c6c:	89 c2                	mov    edx,eax
30001c6e:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
30001c75:	89 c2                	mov    edx,eax
30001c77:	89 d0                	mov    eax,edx
30001c79:	c1 e0 04             	shl    eax,0x4
30001c7c:	29 d0                	sub    eax,edx
30001c7e:	29 c3                	sub    ebx,eax
30001c80:	89 d8                	mov    eax,ebx
30001c82:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001c85:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:83
  if (tmbuf->tm_sec < 0) {
30001c87:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c8a:	8b 00                	mov    eax,DWORD PTR [eax]
30001c8c:	85 c0                	test   eax,eax
30001c8e:	79 1c                	jns    30001cac <mktime+0xa1>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:84
    tmbuf->tm_sec += 60;
30001c90:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c93:	8b 00                	mov    eax,DWORD PTR [eax]
30001c95:	8d 50 3c             	lea    edx,[eax+0x3c]
30001c98:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c9b:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:85
    tmbuf->tm_min--;
30001c9d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ca0:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001ca3:	8d 50 ff             	lea    edx,[eax-0x1]
30001ca6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ca9:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:87
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
30001cac:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001caf:	8b 70 08             	mov    esi,DWORD PTR [eax+0x8]
30001cb2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001cb5:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
30001cb8:	ba 89 88 88 88       	mov    edx,0x88888889
30001cbd:	89 d8                	mov    eax,ebx
30001cbf:	f7 ea                	imul   edx
30001cc1:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001cc4:	c1 f8 05             	sar    eax,0x5
30001cc7:	89 c2                	mov    edx,eax
30001cc9:	89 d8                	mov    eax,ebx
30001ccb:	c1 f8 1f             	sar    eax,0x1f
30001cce:	29 c2                	sub    edx,eax
30001cd0:	89 d0                	mov    eax,edx
30001cd2:	8d 14 06             	lea    edx,[esi+eax*1]
30001cd5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001cd8:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:88
  tmbuf->tm_min = tmbuf->tm_min % 60;
30001cdb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001cde:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
30001ce1:	ba 89 88 88 88       	mov    edx,0x88888889
30001ce6:	89 d8                	mov    eax,ebx
30001ce8:	f7 ea                	imul   edx
30001cea:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001ced:	c1 f8 05             	sar    eax,0x5
30001cf0:	89 c2                	mov    edx,eax
30001cf2:	89 d8                	mov    eax,ebx
30001cf4:	c1 f8 1f             	sar    eax,0x1f
30001cf7:	29 c2                	sub    edx,eax
30001cf9:	89 d0                	mov    eax,edx
30001cfb:	89 c2                	mov    edx,eax
30001cfd:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
30001d04:	89 c2                	mov    edx,eax
30001d06:	89 d0                	mov    eax,edx
30001d08:	c1 e0 04             	shl    eax,0x4
30001d0b:	29 d0                	sub    eax,edx
30001d0d:	29 c3                	sub    ebx,eax
30001d0f:	89 d8                	mov    eax,ebx
30001d11:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001d14:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:89
  if (tmbuf->tm_min < 0) {
30001d17:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d1a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001d1d:	85 c0                	test   eax,eax
30001d1f:	79 1e                	jns    30001d3f <mktime+0x134>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:90
    tmbuf->tm_min += 60;
30001d21:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d24:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001d27:	8d 50 3c             	lea    edx,[eax+0x3c]
30001d2a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d2d:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:91
    tmbuf->tm_hour--;
30001d30:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d33:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30001d36:	8d 50 ff             	lea    edx,[eax-0x1]
30001d39:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d3c:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:93
  }
  day = tmbuf->tm_hour / 24;
30001d3f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d42:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
30001d45:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
30001d4a:	89 d8                	mov    eax,ebx
30001d4c:	f7 ea                	imul   edx
30001d4e:	c1 fa 02             	sar    edx,0x2
30001d51:	89 d8                	mov    eax,ebx
30001d53:	c1 f8 1f             	sar    eax,0x1f
30001d56:	29 c2                	sub    edx,eax
30001d58:	89 d0                	mov    eax,edx
30001d5a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:94
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
30001d5d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d60:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
30001d63:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
30001d68:	89 d8                	mov    eax,ebx
30001d6a:	f7 ea                	imul   edx
30001d6c:	c1 fa 02             	sar    edx,0x2
30001d6f:	89 d8                	mov    eax,ebx
30001d71:	c1 f8 1f             	sar    eax,0x1f
30001d74:	29 c2                	sub    edx,eax
30001d76:	89 d0                	mov    eax,edx
30001d78:	01 c0                	add    eax,eax
30001d7a:	01 d0                	add    eax,edx
30001d7c:	c1 e0 03             	shl    eax,0x3
30001d7f:	29 c3                	sub    ebx,eax
30001d81:	89 da                	mov    edx,ebx
30001d83:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d86:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:95
  if (tmbuf->tm_hour < 0) {
30001d89:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d8c:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30001d8f:	85 c0                	test   eax,eax
30001d91:	79 13                	jns    30001da6 <mktime+0x19b>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:96
    tmbuf->tm_hour += 24;
30001d93:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d96:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30001d99:	8d 50 18             	lea    edx,[eax+0x18]
30001d9c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d9f:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:97
    day--;
30001da2:	83 6d f0 01          	sub    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:99
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
30001da6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001da9:	8b 70 14             	mov    esi,DWORD PTR [eax+0x14]
30001dac:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001daf:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001db2:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
30001db7:	89 d8                	mov    eax,ebx
30001db9:	f7 ea                	imul   edx
30001dbb:	d1 fa                	sar    edx,1
30001dbd:	89 d8                	mov    eax,ebx
30001dbf:	c1 f8 1f             	sar    eax,0x1f
30001dc2:	29 c2                	sub    edx,eax
30001dc4:	89 d0                	mov    eax,edx
30001dc6:	8d 14 06             	lea    edx,[esi+eax*1]
30001dc9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001dcc:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:100
  tmbuf->tm_mon %= 12;
30001dcf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001dd2:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001dd5:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
30001dda:	89 d8                	mov    eax,ebx
30001ddc:	f7 ea                	imul   edx
30001dde:	d1 fa                	sar    edx,1
30001de0:	89 d8                	mov    eax,ebx
30001de2:	c1 f8 1f             	sar    eax,0x1f
30001de5:	29 c2                	sub    edx,eax
30001de7:	89 d0                	mov    eax,edx
30001de9:	01 c0                	add    eax,eax
30001deb:	01 d0                	add    eax,edx
30001ded:	c1 e0 02             	shl    eax,0x2
30001df0:	29 c3                	sub    ebx,eax
30001df2:	89 da                	mov    edx,ebx
30001df4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001df7:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:101
  if (tmbuf->tm_mon < 0) {
30001dfa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001dfd:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001e00:	85 c0                	test   eax,eax
30001e02:	79 1e                	jns    30001e22 <mktime+0x217>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:102
    tmbuf->tm_mon += 12;
30001e04:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e07:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001e0a:	8d 50 0c             	lea    edx,[eax+0xc]
30001e0d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e10:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:103
    tmbuf->tm_year--;
30001e13:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e16:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001e19:	8d 50 ff             	lea    edx,[eax-0x1]
30001e1c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e1f:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:105
  }
  day += (tmbuf->tm_mday - 1);
30001e22:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e25:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
30001e28:	83 e8 01             	sub    eax,0x1
30001e2b:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:106
  while (day < 0) {
30001e2e:	e9 c1 00 00 00       	jmp    30001ef4 <mktime+0x2e9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:107
    if(--tmbuf->tm_mon < 0) {
30001e33:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e36:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001e39:	8d 50 ff             	lea    edx,[eax-0x1]
30001e3c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e3f:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
30001e42:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e45:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001e48:	85 c0                	test   eax,eax
30001e4a:	79 19                	jns    30001e65 <mktime+0x25a>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:108
      tmbuf->tm_year--;
30001e4c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e4f:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001e52:	8d 50 ff             	lea    edx,[eax-0x1]
30001e55:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e58:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:109
      tmbuf->tm_mon = 11;
30001e5b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e5e:	c7 40 10 0b 00 00 00 	mov    DWORD PTR [eax+0x10],0xb
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
30001e65:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e68:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001e6b:	83 e0 03             	and    eax,0x3
30001e6e:	85 c0                	test   eax,eax
30001e70:	75 62                	jne    30001ed4 <mktime+0x2c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111 (discriminator 1)
30001e72:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e75:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001e78:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001e7e:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001e83:	89 d8                	mov    eax,ebx
30001e85:	f7 ea                	imul   edx
30001e87:	c1 fa 05             	sar    edx,0x5
30001e8a:	89 d8                	mov    eax,ebx
30001e8c:	c1 f8 1f             	sar    eax,0x1f
30001e8f:	29 c2                	sub    edx,eax
30001e91:	89 d0                	mov    eax,edx
30001e93:	6b c0 64             	imul   eax,eax,0x64
30001e96:	29 c3                	sub    ebx,eax
30001e98:	89 d8                	mov    eax,ebx
30001e9a:	85 c0                	test   eax,eax
30001e9c:	75 2f                	jne    30001ecd <mktime+0x2c2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111 (discriminator 4)
30001e9e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ea1:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001ea4:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001eaa:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001eaf:	89 d8                	mov    eax,ebx
30001eb1:	f7 ea                	imul   edx
30001eb3:	c1 fa 07             	sar    edx,0x7
30001eb6:	89 d8                	mov    eax,ebx
30001eb8:	c1 f8 1f             	sar    eax,0x1f
30001ebb:	29 c2                	sub    edx,eax
30001ebd:	89 d0                	mov    eax,edx
30001ebf:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001ec5:	29 c3                	sub    ebx,eax
30001ec7:	89 d8                	mov    eax,ebx
30001ec9:	85 c0                	test   eax,eax
30001ecb:	75 07                	jne    30001ed4 <mktime+0x2c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111 (discriminator 5)
30001ecd:	ba 01 00 00 00       	mov    edx,0x1
30001ed2:	eb 05                	jmp    30001ed9 <mktime+0x2ce>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111 (discriminator 6)
30001ed4:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111 (discriminator 8)
30001ed9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001edc:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001edf:	89 d0                	mov    eax,edx
30001ee1:	01 c0                	add    eax,eax
30001ee3:	01 d0                	add    eax,edx
30001ee5:	c1 e0 02             	shl    eax,0x2
30001ee8:	01 d8                	add    eax,ebx
30001eea:	8b 84 81 24 fd ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x2dc]
30001ef1:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:106
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
30001ef4:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30001ef8:	0f 88 35 ff ff ff    	js     30001e33 <mktime+0x228>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
30001efe:	e9 c2 00 00 00       	jmp    30001fc5 <mktime+0x3ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
30001f03:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f06:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001f09:	83 e0 03             	and    eax,0x3
30001f0c:	85 c0                	test   eax,eax
30001f0e:	75 62                	jne    30001f72 <mktime+0x367>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114 (discriminator 1)
30001f10:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f13:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001f16:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001f1c:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001f21:	89 d8                	mov    eax,ebx
30001f23:	f7 ea                	imul   edx
30001f25:	c1 fa 05             	sar    edx,0x5
30001f28:	89 d8                	mov    eax,ebx
30001f2a:	c1 f8 1f             	sar    eax,0x1f
30001f2d:	29 c2                	sub    edx,eax
30001f2f:	89 d0                	mov    eax,edx
30001f31:	6b c0 64             	imul   eax,eax,0x64
30001f34:	29 c3                	sub    ebx,eax
30001f36:	89 d8                	mov    eax,ebx
30001f38:	85 c0                	test   eax,eax
30001f3a:	75 2f                	jne    30001f6b <mktime+0x360>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114 (discriminator 4)
30001f3c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f3f:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001f42:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001f48:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001f4d:	89 d8                	mov    eax,ebx
30001f4f:	f7 ea                	imul   edx
30001f51:	c1 fa 07             	sar    edx,0x7
30001f54:	89 d8                	mov    eax,ebx
30001f56:	c1 f8 1f             	sar    eax,0x1f
30001f59:	29 c2                	sub    edx,eax
30001f5b:	89 d0                	mov    eax,edx
30001f5d:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001f63:	29 c3                	sub    ebx,eax
30001f65:	89 d8                	mov    eax,ebx
30001f67:	85 c0                	test   eax,eax
30001f69:	75 07                	jne    30001f72 <mktime+0x367>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114 (discriminator 5)
30001f6b:	ba 01 00 00 00       	mov    edx,0x1
30001f70:	eb 05                	jmp    30001f77 <mktime+0x36c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114 (discriminator 6)
30001f72:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114 (discriminator 8)
30001f77:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f7a:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001f7d:	89 d0                	mov    eax,edx
30001f7f:	01 c0                	add    eax,eax
30001f81:	01 d0                	add    eax,edx
30001f83:	c1 e0 02             	shl    eax,0x2
30001f86:	01 d8                	add    eax,ebx
30001f88:	8b 84 81 24 fd ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x2dc]
30001f8f:	29 45 f0             	sub    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:115 (discriminator 8)
    if (++(tmbuf->tm_mon) == 12) {
30001f92:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f95:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001f98:	8d 50 01             	lea    edx,[eax+0x1]
30001f9b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f9e:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
30001fa1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001fa4:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001fa7:	83 f8 0c             	cmp    eax,0xc
30001faa:	75 19                	jne    30001fc5 <mktime+0x3ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:116
      tmbuf->tm_mon = 0;
30001fac:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001faf:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:117
      tmbuf->tm_year++;
30001fb6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001fb9:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001fbc:	8d 50 01             	lea    edx,[eax+0x1]
30001fbf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001fc2:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
30001fc5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001fc8:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001fcb:	83 e0 03             	and    eax,0x3
30001fce:	85 c0                	test   eax,eax
30001fd0:	75 62                	jne    30002034 <mktime+0x429>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113 (discriminator 1)
30001fd2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001fd5:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001fd8:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001fde:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001fe3:	89 d8                	mov    eax,ebx
30001fe5:	f7 ea                	imul   edx
30001fe7:	c1 fa 05             	sar    edx,0x5
30001fea:	89 d8                	mov    eax,ebx
30001fec:	c1 f8 1f             	sar    eax,0x1f
30001fef:	29 c2                	sub    edx,eax
30001ff1:	89 d0                	mov    eax,edx
30001ff3:	6b c0 64             	imul   eax,eax,0x64
30001ff6:	29 c3                	sub    ebx,eax
30001ff8:	89 d8                	mov    eax,ebx
30001ffa:	85 c0                	test   eax,eax
30001ffc:	75 2f                	jne    3000202d <mktime+0x422>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113 (discriminator 4)
30001ffe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002001:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30002004:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
3000200a:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000200f:	89 d8                	mov    eax,ebx
30002011:	f7 ea                	imul   edx
30002013:	c1 fa 07             	sar    edx,0x7
30002016:	89 d8                	mov    eax,ebx
30002018:	c1 f8 1f             	sar    eax,0x1f
3000201b:	29 c2                	sub    edx,eax
3000201d:	89 d0                	mov    eax,edx
3000201f:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30002025:	29 c3                	sub    ebx,eax
30002027:	89 d8                	mov    eax,ebx
30002029:	85 c0                	test   eax,eax
3000202b:	75 07                	jne    30002034 <mktime+0x429>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113 (discriminator 5)
3000202d:	ba 01 00 00 00       	mov    edx,0x1
30002032:	eb 05                	jmp    30002039 <mktime+0x42e>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113 (discriminator 6)
30002034:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113 (discriminator 8)
30002039:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000203c:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
3000203f:	89 d0                	mov    eax,edx
30002041:	01 c0                	add    eax,eax
30002043:	01 d0                	add    eax,edx
30002045:	c1 e0 02             	shl    eax,0x2
30002048:	01 d8                	add    eax,ebx
3000204a:	8b 84 81 24 fd ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x2dc]
30002051:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30002054:	0f 8e a9 fe ff ff    	jle    30001f03 <mktime+0x2f8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:120
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
3000205a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
3000205d:	8d 50 01             	lea    edx,[eax+0x1]
30002060:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002063:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:121
  year = EPOCH_YR;
30002066:	c7 45 dc b2 07 00 00 	mov    DWORD PTR [ebp-0x24],0x7b2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:122
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
3000206d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002070:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30002073:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
30002076:	81 ea 6c 07 00 00    	sub    edx,0x76c
3000207c:	39 d0                	cmp    eax,edx
3000207e:	7d 0a                	jge    3000208a <mktime+0x47f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:122 (discriminator 1)
30002080:	b8 19 fc ff ff       	mov    eax,0xfffffc19
30002085:	e9 d0 03 00 00       	jmp    3000245a <mktime+0x84f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:123
  seconds = 0;
3000208a:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:124
  day = 0;                      // Means days since day 0 now
30002091:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:125
  overflow = 0;
30002098:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:132
  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;
3000209f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300020a2:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
300020a5:	05 6c 07 00 00       	add    eax,0x76c
300020aa:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:134

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
300020ad:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
300020b0:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
300020b3:	3d 7c c6 59 00       	cmp    eax,0x59c67c
300020b8:	7e 07                	jle    300020c1 <mktime+0x4b6>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:134 (discriminator 1)
300020ba:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135
  day = (tm_year - year) * 365;
300020c1:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
300020c4:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
300020c7:	69 c0 6d 01 00 00    	imul   eax,eax,0x16d
300020cd:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:136
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
300020d0:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
300020d5:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
300020d8:	89 c2                	mov    edx,eax
300020da:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
300020dd:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
300020e0:	8d 58 03             	lea    ebx,[eax+0x3]
300020e3:	85 c0                	test   eax,eax
300020e5:	0f 48 c3             	cmovs  eax,ebx
300020e8:	c1 f8 02             	sar    eax,0x2
300020eb:	83 c0 01             	add    eax,0x1
300020ee:	39 c2                	cmp    edx,eax
300020f0:	7d 04                	jge    300020f6 <mktime+0x4eb>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:136 (discriminator 1)
300020f2:	83 4d e4 02          	or     DWORD PTR [ebp-0x1c],0x2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
300020f6:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
300020f9:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
300020fc:	8d 50 03             	lea    edx,[eax+0x3]
300020ff:	85 c0                	test   eax,eax
30002101:	0f 48 c2             	cmovs  eax,edx
30002104:	c1 f8 02             	sar    eax,0x2
30002107:	89 c3                	mov    ebx,eax
30002109:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
3000210c:	83 e0 03             	and    eax,0x3
3000210f:	85 c0                	test   eax,eax
30002111:	74 29                	je     3000213c <mktime+0x531>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 1)
30002113:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30002116:	99                   	cdq    
30002117:	c1 ea 1e             	shr    edx,0x1e
3000211a:	01 d0                	add    eax,edx
3000211c:	83 e0 03             	and    eax,0x3
3000211f:	29 d0                	sub    eax,edx
30002121:	89 c6                	mov    esi,eax
30002123:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
30002126:	99                   	cdq    
30002127:	c1 ea 1e             	shr    edx,0x1e
3000212a:	01 d0                	add    eax,edx
3000212c:	83 e0 03             	and    eax,0x3
3000212f:	29 d0                	sub    eax,edx
30002131:	39 c6                	cmp    esi,eax
30002133:	7d 07                	jge    3000213c <mktime+0x531>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 3)
30002135:	b8 01 00 00 00       	mov    eax,0x1
3000213a:	eb 05                	jmp    30002141 <mktime+0x536>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 4)
3000213c:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 6)
30002141:	01 d8                	add    eax,ebx
30002143:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 6)
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
30002146:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30002149:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
3000214c:	89 c3                	mov    ebx,eax
3000214e:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30002153:	89 d8                	mov    eax,ebx
30002155:	f7 ea                	imul   edx
30002157:	c1 fa 05             	sar    edx,0x5
3000215a:	89 d8                	mov    eax,ebx
3000215c:	c1 f8 1f             	sar    eax,0x1f
3000215f:	89 d7                	mov    edi,edx
30002161:	29 c7                	sub    edi,eax
30002163:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30002166:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000216b:	89 d8                	mov    eax,ebx
3000216d:	f7 ea                	imul   edx
3000216f:	c1 fa 05             	sar    edx,0x5
30002172:	89 d8                	mov    eax,ebx
30002174:	c1 f8 1f             	sar    eax,0x1f
30002177:	29 c2                	sub    edx,eax
30002179:	89 d0                	mov    eax,edx
3000217b:	6b c0 64             	imul   eax,eax,0x64
3000217e:	29 c3                	sub    ebx,eax
30002180:	89 d8                	mov    eax,ebx
30002182:	85 c0                	test   eax,eax
30002184:	74 49                	je     300021cf <mktime+0x5c4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 1)
30002186:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30002189:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000218e:	89 d8                	mov    eax,ebx
30002190:	f7 ea                	imul   edx
30002192:	c1 fa 05             	sar    edx,0x5
30002195:	89 d8                	mov    eax,ebx
30002197:	c1 f8 1f             	sar    eax,0x1f
3000219a:	89 d6                	mov    esi,edx
3000219c:	29 c6                	sub    esi,eax
3000219e:	6b c6 64             	imul   eax,esi,0x64
300021a1:	89 de                	mov    esi,ebx
300021a3:	29 c6                	sub    esi,eax
300021a5:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
300021a8:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300021ad:	89 d8                	mov    eax,ebx
300021af:	f7 ea                	imul   edx
300021b1:	c1 fa 05             	sar    edx,0x5
300021b4:	89 d8                	mov    eax,ebx
300021b6:	c1 f8 1f             	sar    eax,0x1f
300021b9:	29 c2                	sub    edx,eax
300021bb:	89 d0                	mov    eax,edx
300021bd:	6b c0 64             	imul   eax,eax,0x64
300021c0:	29 c3                	sub    ebx,eax
300021c2:	89 d8                	mov    eax,ebx
300021c4:	39 c6                	cmp    esi,eax
300021c6:	7d 07                	jge    300021cf <mktime+0x5c4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 3)
300021c8:	b8 01 00 00 00       	mov    eax,0x1
300021cd:	eb 05                	jmp    300021d4 <mktime+0x5c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 4)
300021cf:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 6)
300021d4:	01 f8                	add    eax,edi
300021d6:	29 45 f0             	sub    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 6)
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);
300021d9:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
300021dc:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
300021df:	89 c3                	mov    ebx,eax
300021e1:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300021e6:	89 d8                	mov    eax,ebx
300021e8:	f7 ea                	imul   edx
300021ea:	c1 fa 07             	sar    edx,0x7
300021ed:	89 d8                	mov    eax,ebx
300021ef:	c1 f8 1f             	sar    eax,0x1f
300021f2:	89 d7                	mov    edi,edx
300021f4:	29 c7                	sub    edi,eax
300021f6:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
300021f9:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300021fe:	89 d8                	mov    eax,ebx
30002200:	f7 ea                	imul   edx
30002202:	c1 fa 07             	sar    edx,0x7
30002205:	89 d8                	mov    eax,ebx
30002207:	c1 f8 1f             	sar    eax,0x1f
3000220a:	29 c2                	sub    edx,eax
3000220c:	89 d0                	mov    eax,edx
3000220e:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30002214:	29 c3                	sub    ebx,eax
30002216:	89 d8                	mov    eax,ebx
30002218:	85 c0                	test   eax,eax
3000221a:	74 4f                	je     3000226b <mktime+0x660>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 1)
3000221c:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
3000221f:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30002224:	89 d8                	mov    eax,ebx
30002226:	f7 ea                	imul   edx
30002228:	c1 fa 07             	sar    edx,0x7
3000222b:	89 d8                	mov    eax,ebx
3000222d:	c1 f8 1f             	sar    eax,0x1f
30002230:	89 d6                	mov    esi,edx
30002232:	29 c6                	sub    esi,eax
30002234:	69 c6 90 01 00 00    	imul   eax,esi,0x190
3000223a:	89 de                	mov    esi,ebx
3000223c:	29 c6                	sub    esi,eax
3000223e:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
30002241:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30002246:	89 d8                	mov    eax,ebx
30002248:	f7 ea                	imul   edx
3000224a:	c1 fa 07             	sar    edx,0x7
3000224d:	89 d8                	mov    eax,ebx
3000224f:	c1 f8 1f             	sar    eax,0x1f
30002252:	29 c2                	sub    edx,eax
30002254:	89 d0                	mov    eax,edx
30002256:	69 c0 90 01 00 00    	imul   eax,eax,0x190
3000225c:	29 c3                	sub    ebx,eax
3000225e:	89 d8                	mov    eax,ebx
30002260:	39 c6                	cmp    esi,eax
30002262:	7d 07                	jge    3000226b <mktime+0x660>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 3)
30002264:	b8 01 00 00 00       	mov    eax,0x1
30002269:	eb 05                	jmp    30002270 <mktime+0x665>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 4)
3000226b:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 6)
30002270:	01 f8                	add    eax,edi
30002272:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:141 (discriminator 6)

  yday = month = 0;
30002275:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
3000227c:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
3000227f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:142 (discriminator 6)
  while (month < tmbuf->tm_mon) {
30002282:	eb 7b                	jmp    300022ff <mktime+0x6f4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143
    yday += _ytab[LEAPYEAR(tm_year)][month];
30002284:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30002287:	83 e0 03             	and    eax,0x3
3000228a:	85 c0                	test   eax,eax
3000228c:	75 50                	jne    300022de <mktime+0x6d3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143 (discriminator 1)
3000228e:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30002291:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30002296:	89 d8                	mov    eax,ebx
30002298:	f7 ea                	imul   edx
3000229a:	c1 fa 05             	sar    edx,0x5
3000229d:	89 d8                	mov    eax,ebx
3000229f:	c1 f8 1f             	sar    eax,0x1f
300022a2:	29 c2                	sub    edx,eax
300022a4:	89 d0                	mov    eax,edx
300022a6:	6b c0 64             	imul   eax,eax,0x64
300022a9:	29 c3                	sub    ebx,eax
300022ab:	89 d8                	mov    eax,ebx
300022ad:	85 c0                	test   eax,eax
300022af:	75 26                	jne    300022d7 <mktime+0x6cc>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143 (discriminator 4)
300022b1:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
300022b4:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300022b9:	89 d8                	mov    eax,ebx
300022bb:	f7 ea                	imul   edx
300022bd:	c1 fa 07             	sar    edx,0x7
300022c0:	89 d8                	mov    eax,ebx
300022c2:	c1 f8 1f             	sar    eax,0x1f
300022c5:	29 c2                	sub    edx,eax
300022c7:	89 d0                	mov    eax,edx
300022c9:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300022cf:	29 c3                	sub    ebx,eax
300022d1:	89 d8                	mov    eax,ebx
300022d3:	85 c0                	test   eax,eax
300022d5:	75 07                	jne    300022de <mktime+0x6d3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143 (discriminator 5)
300022d7:	ba 01 00 00 00       	mov    edx,0x1
300022dc:	eb 05                	jmp    300022e3 <mktime+0x6d8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143 (discriminator 6)
300022de:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143 (discriminator 8)
300022e3:	89 d0                	mov    eax,edx
300022e5:	01 c0                	add    eax,eax
300022e7:	01 d0                	add    eax,edx
300022e9:	c1 e0 02             	shl    eax,0x2
300022ec:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
300022ef:	01 d0                	add    eax,edx
300022f1:	8b 84 81 24 fd ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x2dc]
300022f8:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:144 (discriminator 8)
    month++;
300022fb:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:142
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
300022ff:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002302:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30002305:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
30002308:	0f 8f 76 ff ff ff    	jg     30002284 <mktime+0x679>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:146
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
3000230e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002311:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
30002314:	83 e8 01             	sub    eax,0x1
30002317:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:147
  if (day + yday < 0) overflow|=4;
3000231a:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
3000231d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30002320:	01 d0                	add    eax,edx
30002322:	85 c0                	test   eax,eax
30002324:	79 04                	jns    3000232a <mktime+0x71f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:147 (discriminator 1)
30002326:	83 4d e4 04          	or     DWORD PTR [ebp-0x1c],0x4
/home/yogi/src/os/aproj/libChrisOS/src/time.c:148
  day += yday;
3000232a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
3000232d:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:150

  tmbuf->tm_yday = yday;
30002330:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002333:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30002336:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:151
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)
30002339:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
3000233c:	8d 58 04             	lea    ebx,[eax+0x4]
3000233f:	ba 93 24 49 92       	mov    edx,0x92492493
30002344:	89 d8                	mov    eax,ebx
30002346:	f7 ea                	imul   edx
30002348:	8d 04 1a             	lea    eax,[edx+ebx*1]
3000234b:	c1 f8 02             	sar    eax,0x2
3000234e:	89 c2                	mov    edx,eax
30002350:	89 d8                	mov    eax,ebx
30002352:	c1 f8 1f             	sar    eax,0x1f
30002355:	29 c2                	sub    edx,eax
30002357:	89 d0                	mov    eax,edx
30002359:	89 c2                	mov    edx,eax
3000235b:	c1 e2 03             	shl    edx,0x3
3000235e:	29 c2                	sub    edx,eax
30002360:	89 d8                	mov    eax,ebx
30002362:	29 d0                	sub    eax,edx
30002364:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30002367:	89 42 18             	mov    DWORD PTR [edx+0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:153

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;
3000236a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000236d:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30002370:	c1 e0 02             	shl    eax,0x2
30002373:	89 c2                	mov    edx,eax
30002375:	c1 e2 04             	shl    edx,0x4
30002378:	29 c2                	sub    edx,eax
3000237a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000237d:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30002380:	01 d0                	add    eax,edx
30002382:	c1 e0 02             	shl    eax,0x2
30002385:	89 c2                	mov    edx,eax
30002387:	c1 e2 04             	shl    edx,0x4
3000238a:	29 c2                	sub    edx,eax
3000238c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000238f:	8b 00                	mov    eax,DWORD PTR [eax]
30002391:	01 d0                	add    eax,edx
30002393:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:155

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
30002396:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
3000239b:	2b 45 d8             	sub    eax,DWORD PTR [ebp-0x28]
3000239e:	89 c3                	mov    ebx,eax
300023a0:	ba 07 45 2e c2       	mov    edx,0xc22e4507
300023a5:	89 d8                	mov    eax,ebx
300023a7:	f7 ea                	imul   edx
300023a9:	8d 04 1a             	lea    eax,[edx+ebx*1]
300023ac:	c1 f8 10             	sar    eax,0x10
300023af:	89 c2                	mov    edx,eax
300023b1:	89 d8                	mov    eax,ebx
300023b3:	c1 f8 1f             	sar    eax,0x1f
300023b6:	29 c2                	sub    edx,eax
300023b8:	89 d0                	mov    eax,edx
300023ba:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
300023bd:	7d 04                	jge    300023c3 <mktime+0x7b8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:155 (discriminator 1)
300023bf:	83 4d e4 08          	or     DWORD PTR [ebp-0x1c],0x8
/home/yogi/src/os/aproj/libChrisOS/src/time.c:156
  seconds += day * SECS_DAY;
300023c3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
300023c6:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
300023cc:	01 45 d8             	add    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:159

  // Now adjust according to timezone and daylight saving time
  if (((libcTZ > 0) && (TIME_MAX - libcTZ < seconds)) || 
300023cf:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
300023d5:	8b 00                	mov    eax,DWORD PTR [eax]
300023d7:	85 c0                	test   eax,eax
300023d9:	7e 16                	jle    300023f1 <mktime+0x7e6>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:159 (discriminator 1)
300023db:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
300023e1:	8b 00                	mov    eax,DWORD PTR [eax]
300023e3:	ba ff ff ff 7f       	mov    edx,0x7fffffff
300023e8:	29 c2                	sub    edx,eax
300023ea:	89 d0                	mov    eax,edx
300023ec:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
300023ef:	7c 1b                	jl     3000240c <mktime+0x801>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:160 (discriminator 3)
      ((libcTZ < 0) && (seconds < -libcTZ))) {
300023f1:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
300023f7:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:159 (discriminator 3)

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
  seconds += day * SECS_DAY;

  // Now adjust according to timezone and daylight saving time
  if (((libcTZ > 0) && (TIME_MAX - libcTZ < seconds)) || 
300023f9:	85 c0                	test   eax,eax
300023fb:	79 13                	jns    30002410 <mktime+0x805>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:160
      ((libcTZ < 0) && (seconds < -libcTZ))) {
300023fd:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30002403:	8b 00                	mov    eax,DWORD PTR [eax]
30002405:	f7 d8                	neg    eax
30002407:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
3000240a:	7e 04                	jle    30002410 <mktime+0x805>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161
          overflow|=16;
3000240c:	83 4d e4 10          	or     DWORD PTR [ebp-0x1c],0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163
  }
  seconds += libcTZ;
30002410:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30002416:	8b 00                	mov    eax,DWORD PTR [eax]
30002418:	01 45 d8             	add    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:165

  if (tmbuf->tm_isdst) {
3000241b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000241e:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
30002421:	85 c0                	test   eax,eax
30002423:	74 0b                	je     30002430 <mktime+0x825>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:166
    dst = _dstbias;
30002425:	8b 81 5c 00 00 00    	mov    eax,DWORD PTR [ecx+0x5c]
3000242b:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
3000242e:	eb 07                	jmp    30002437 <mktime+0x82c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:168
  } else {
    dst = 0;
30002430:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:171
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
30002437:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
3000243a:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
3000243d:	7e 04                	jle    30002443 <mktime+0x838>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:171 (discriminator 1)
3000243f:	83 4d e4 20          	or     DWORD PTR [ebp-0x1c],0x20
/home/yogi/src/os/aproj/libChrisOS/src/time.c:172
  seconds -= dst;
30002443:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
30002446:	29 45 d8             	sub    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:174

  if (overflow) return (time_t) overflow-2;
30002449:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
3000244d:	74 08                	je     30002457 <mktime+0x84c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:174 (discriminator 1)
3000244f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
30002452:	83 e8 02             	sub    eax,0x2
30002455:	eb 03                	jmp    3000245a <mktime+0x84f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:177

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
30002457:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:178
}
3000245a:	83 c4 20             	add    esp,0x20
3000245d:	5b                   	pop    ebx
3000245e:	5e                   	pop    esi
3000245f:	5f                   	pop    edi
30002460:	5d                   	pop    ebp
30002461:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

30002462 <__x86.get_pc_thunk.ax>:
__x86.get_pc_thunk.ax():
30002462:	8b 04 24             	mov    eax,DWORD PTR [esp]
30002465:	c3                   	ret    

Disassembly of section .plt:

30002470 <.plt>:
30002470:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
30002476:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
3000247c:	00 00                	add    BYTE PTR [eax],al
3000247e:	00 00                	add    BYTE PTR [eax],al
30002480:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
30002486:	68 00 00 00 00       	push   0x0
3000248b:	e9 e0 ff ff ff       	jmp    30002470 <__x86.get_pc_thunk.ax+0xe>
30002490:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
30002496:	68 08 00 00 00       	push   0x8
3000249b:	e9 d0 ff ff ff       	jmp    30002470 <__x86.get_pc_thunk.ax+0xe>
300024a0:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
300024a6:	68 10 00 00 00       	push   0x10
300024ab:	e9 c0 ff ff ff       	jmp    30002470 <__x86.get_pc_thunk.ax+0xe>
300024b0:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
300024b6:	68 18 00 00 00       	push   0x18
300024bb:	e9 b0 ff ff ff       	jmp    30002470 <__x86.get_pc_thunk.ax+0xe>

Disassembly of section .text.__x86.get_pc_thunk.bx:

300024c0 <__x86.get_pc_thunk.bx>:
__x86.get_pc_thunk.bx():
300024c0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
300024c3:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.si:

300024c4 <__x86.get_pc_thunk.si>:
__x86.get_pc_thunk.si():
300024c4:	8b 34 24             	mov    esi,DWORD PTR [esp]
300024c7:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.cx:

300024c8 <__x86.get_pc_thunk.cx>:
__x86.get_pc_thunk.cx():
300024c8:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
300024cb:	c3                   	ret    

Disassembly of section .eh_frame:

300024cc <.eh_frame>:
300024cc:	14 00                	adc    al,0x0
300024ce:	00 00                	add    BYTE PTR [eax],al
300024d0:	00 00                	add    BYTE PTR [eax],al
300024d2:	00 00                	add    BYTE PTR [eax],al
300024d4:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
300024d7:	00 01                	add    BYTE PTR [ecx],al
300024d9:	7c 08                	jl     300024e3 <__x86.get_pc_thunk.cx+0x1b>
300024db:	01 1b                	add    DWORD PTR [ebx],ebx
300024dd:	0c 04                	or     al,0x4
300024df:	04 88                	add    al,0x88
300024e1:	01 00                	add    DWORD PTR [eax],eax
300024e3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300024e6:	00 00                	add    BYTE PTR [eax],al
300024e8:	1c 00                	sbb    al,0x0
300024ea:	00 00                	add    BYTE PTR [eax],al
300024ec:	14 db                	adc    al,0xdb
300024ee:	ff                   	(bad)  
300024ef:	ff                   	(bad)  
300024f0:	38 00                	cmp    BYTE PTR [eax],al
300024f2:	00 00                	add    BYTE PTR [eax],al
300024f4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300024f7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300024fd:	74 c5                	je     300024c4 <__x86.get_pc_thunk.si>
300024ff:	0c 04                	or     al,0x4
30002501:	04 00                	add    al,0x0
30002503:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002506:	00 00                	add    BYTE PTR [eax],al
30002508:	3c 00                	cmp    al,0x0
3000250a:	00 00                	add    BYTE PTR [eax],al
3000250c:	2c db                	sub    al,0xdb
3000250e:	ff                   	(bad)  
3000250f:	ff                   	(bad)  
30002510:	38 00                	cmp    BYTE PTR [eax],al
30002512:	00 00                	add    BYTE PTR [eax],al
30002514:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002517:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000251d:	74 c5                	je     300024e4 <__x86.get_pc_thunk.cx+0x1c>
3000251f:	0c 04                	or     al,0x4
30002521:	04 00                	add    al,0x0
30002523:	00 10                	add    BYTE PTR [eax],dl
30002525:	00 00                	add    BYTE PTR [eax],al
30002527:	00 5c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bl
3000252b:	00 36                	add    BYTE PTR [esi],dh
3000252d:	ff                   	(bad)  
3000252e:	ff                   	(bad)  
3000252f:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
30002532:	00 00                	add    BYTE PTR [eax],al
30002534:	00 00                	add    BYTE PTR [eax],al
30002536:	00 00                	add    BYTE PTR [eax],al
30002538:	24 00                	and    al,0x0
3000253a:	00 00                	add    BYTE PTR [eax],al
3000253c:	70 00                	jo     3000253e <__x86.get_pc_thunk.cx+0x76>
3000253e:	00 00                	add    BYTE PTR [eax],al
30002540:	30 db                	xor    bl,bl
30002542:	ff                   	(bad)  
30002543:	ff 55 00             	call   DWORD PTR [ebp+0x0]
30002546:	00 00                	add    BYTE PTR [eax],al
30002548:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000254b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002551:	42                   	inc    edx
30002552:	86 03                	xchg   BYTE PTR [ebx],al
30002554:	83 04 02 4d          	add    DWORD PTR [edx+eax*1],0x4d
30002558:	c3                   	ret    
30002559:	41                   	inc    ecx
3000255a:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
3000255e:	04 04                	add    al,0x4
30002560:	24 00                	and    al,0x0
30002562:	00 00                	add    BYTE PTR [eax],al
30002564:	98                   	cwde   
30002565:	00 00                	add    BYTE PTR [eax],al
30002567:	00 5d db             	add    BYTE PTR [ebp-0x25],bl
3000256a:	ff                   	(bad)  
3000256b:	ff 55 00             	call   DWORD PTR [ebp+0x0]
3000256e:	00 00                	add    BYTE PTR [eax],al
30002570:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002573:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002579:	42                   	inc    edx
3000257a:	86 03                	xchg   BYTE PTR [ebx],al
3000257c:	83 04 02 4d          	add    DWORD PTR [edx+eax*1],0x4d
30002580:	c3                   	ret    
30002581:	41                   	inc    ecx
30002582:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
30002586:	04 04                	add    al,0x4
30002588:	24 00                	and    al,0x0
3000258a:	00 00                	add    BYTE PTR [eax],al
3000258c:	c0 00 00             	rol    BYTE PTR [eax],0x0
3000258f:	00 8c db ff ff 97 00 	add    BYTE PTR [ebx+ebx*8+0x97ffff],cl
30002596:	00 00                	add    BYTE PTR [eax],al
30002598:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000259b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025a1:	42                   	inc    edx
300025a2:	86 03                	xchg   BYTE PTR [ebx],al
300025a4:	83 04 02 8f          	add    DWORD PTR [edx+eax*1],0xffffff8f
300025a8:	c3                   	ret    
300025a9:	41                   	inc    ecx
300025aa:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
300025ae:	04 04                	add    al,0x4
300025b0:	10 00                	adc    BYTE PTR [eax],al
300025b2:	00 00                	add    BYTE PTR [eax],al
300025b4:	e8 00 00 00 08       	call   380025b9 <ticksToWait+0x7ffeb1d>
300025b9:	ff                   	(bad)  
300025ba:	ff                   	(bad)  
300025bb:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
300025be:	00 00                	add    BYTE PTR [eax],al
300025c0:	00 00                	add    BYTE PTR [eax],al
300025c2:	00 00                	add    BYTE PTR [eax],al
300025c4:	20 00                	and    BYTE PTR [eax],al
300025c6:	00 00                	add    BYTE PTR [eax],al
300025c8:	fc                   	cld    
300025c9:	00 00                	add    BYTE PTR [eax],al
300025cb:	00 e8                	add    al,ch
300025cd:	db ff                	(bad)  
300025cf:	ff 77 00             	push   DWORD PTR [edi+0x0]
300025d2:	00 00                	add    BYTE PTR [eax],al
300025d4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300025d7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025dd:	44                   	inc    esp
300025de:	83 03 02             	add    DWORD PTR [ebx],0x2
300025e1:	6f                   	outs   dx,DWORD PTR ds:[esi]
300025e2:	c5 c3 0c             	(bad)  
300025e5:	04 04                	add    al,0x4
300025e7:	00 20                	add    BYTE PTR [eax],ah
300025e9:	00 00                	add    BYTE PTR [eax],al
300025eb:	00 20                	add    BYTE PTR [eax],ah
300025ed:	01 00                	add    DWORD PTR [eax],eax
300025ef:	00 3b                	add    BYTE PTR [ebx],bh
300025f1:	dc ff                	fdiv   st(7),st
300025f3:	ff                   	(bad)  
300025f4:	bb 00 00 00 00       	mov    ebx,0x0
300025f9:	41                   	inc    ecx
300025fa:	0e                   	push   cs
300025fb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002601:	44                   	inc    esp
30002602:	83 03 02             	add    DWORD PTR [ebx],0x2
30002605:	b3 c5                	mov    bl,0xc5
30002607:	c3                   	ret    
30002608:	0c 04                	or     al,0x4
3000260a:	04 00                	add    al,0x0
3000260c:	1c 00                	sbb    al,0x0
3000260e:	00 00                	add    BYTE PTR [eax],al
30002610:	44                   	inc    esp
30002611:	01 00                	add    DWORD PTR [eax],eax
30002613:	00 d2                	add    dl,dl
30002615:	dc ff                	fdiv   st(7),st
30002617:	ff 5c 00 00          	call   FWORD PTR [eax+eax*1+0x0]
3000261b:	00 00                	add    BYTE PTR [eax],al
3000261d:	41                   	inc    ecx
3000261e:	0e                   	push   cs
3000261f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002625:	02 58 c5             	add    bl,BYTE PTR [eax-0x3b]
30002628:	0c 04                	or     al,0x4
3000262a:	04 00                	add    al,0x0
3000262c:	20 00                	and    BYTE PTR [eax],al
3000262e:	00 00                	add    BYTE PTR [eax],al
30002630:	64 01 00             	add    DWORD PTR fs:[eax],eax
30002633:	00 10                	add    BYTE PTR [eax],dl
30002635:	dd ff                	(bad)  
30002637:	ff 26                	jmp    DWORD PTR [esi]
30002639:	00 00                	add    BYTE PTR [eax],al
3000263b:	00 00                	add    BYTE PTR [eax],al
3000263d:	41                   	inc    ecx
3000263e:	0e                   	push   cs
3000263f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002645:	41                   	inc    ecx
30002646:	83 03 60             	add    DWORD PTR [ebx],0x60
30002649:	c3                   	ret    
3000264a:	41                   	inc    ecx
3000264b:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000264e:	04 00                	add    al,0x0
30002650:	20 00                	and    BYTE PTR [eax],al
30002652:	00 00                	add    BYTE PTR [eax],al
30002654:	88 01                	mov    BYTE PTR [ecx],al
30002656:	00 00                	add    BYTE PTR [eax],al
30002658:	12 dd                	adc    bl,ch
3000265a:	ff                   	(bad)  
3000265b:	ff 43 00             	inc    DWORD PTR [ebx+0x0]
3000265e:	00 00                	add    BYTE PTR [eax],al
30002660:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002663:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002669:	44                   	inc    esp
3000266a:	83 03 7a             	add    DWORD PTR [ebx],0x7a
3000266d:	c3                   	ret    
3000266e:	41                   	inc    ecx
3000266f:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002672:	04 00                	add    al,0x0
30002674:	20 00                	and    BYTE PTR [eax],al
30002676:	00 00                	add    BYTE PTR [eax],al
30002678:	ac                   	lods   al,BYTE PTR ds:[esi]
30002679:	01 00                	add    DWORD PTR [eax],eax
3000267b:	00 31                	add    BYTE PTR [ecx],dh
3000267d:	dd ff                	(bad)  
3000267f:	ff 2f                	jmp    FWORD PTR [edi]
30002681:	00 00                	add    BYTE PTR [eax],al
30002683:	00 00                	add    BYTE PTR [eax],al
30002685:	41                   	inc    ecx
30002686:	0e                   	push   cs
30002687:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000268d:	44                   	inc    esp
3000268e:	83 03 66             	add    DWORD PTR [ebx],0x66
30002691:	c3                   	ret    
30002692:	41                   	inc    ecx
30002693:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002696:	04 00                	add    al,0x0
30002698:	20 00                	and    BYTE PTR [eax],al
3000269a:	00 00                	add    BYTE PTR [eax],al
3000269c:	d0 01                	rol    BYTE PTR [ecx],1
3000269e:	00 00                	add    BYTE PTR [eax],al
300026a0:	3c dd                	cmp    al,0xdd
300026a2:	ff                   	(bad)  
300026a3:	ff                   	(bad)  
300026a4:	ba 00 00 00 00       	mov    edx,0x0
300026a9:	41                   	inc    ecx
300026aa:	0e                   	push   cs
300026ab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026b1:	44                   	inc    esp
300026b2:	83 03 02             	add    DWORD PTR [ebx],0x2
300026b5:	b2 c5                	mov    dl,0xc5
300026b7:	c3                   	ret    
300026b8:	0c 04                	or     al,0x4
300026ba:	04 00                	add    al,0x0
300026bc:	20 00                	and    BYTE PTR [eax],al
300026be:	00 00                	add    BYTE PTR [eax],al
300026c0:	f4                   	hlt    
300026c1:	01 00                	add    DWORD PTR [eax],eax
300026c3:	00 d4                	add    ah,dl
300026c5:	dd ff                	(bad)  
300026c7:	ff 35 00 00 00 00    	push   DWORD PTR ds:0x0
300026cd:	41                   	inc    ecx
300026ce:	0e                   	push   cs
300026cf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026d5:	44                   	inc    esp
300026d6:	83 03 6c             	add    DWORD PTR [ebx],0x6c
300026d9:	c3                   	ret    
300026da:	41                   	inc    ecx
300026db:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300026de:	04 00                	add    al,0x0
300026e0:	20 00                	and    BYTE PTR [eax],al
300026e2:	00 00                	add    BYTE PTR [eax],al
300026e4:	18 02                	sbb    BYTE PTR [edx],al
300026e6:	00 00                	add    BYTE PTR [eax],al
300026e8:	e5 dd                	in     eax,0xdd
300026ea:	ff                   	(bad)  
300026eb:	ff 34 00             	push   DWORD PTR [eax+eax*1]
300026ee:	00 00                	add    BYTE PTR [eax],al
300026f0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300026f3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026f9:	44                   	inc    esp
300026fa:	83 03 6b             	add    DWORD PTR [ebx],0x6b
300026fd:	c3                   	ret    
300026fe:	41                   	inc    ecx
300026ff:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002702:	04 00                	add    al,0x0
30002704:	20 00                	and    BYTE PTR [eax],al
30002706:	00 00                	add    BYTE PTR [eax],al
30002708:	3c 02                	cmp    al,0x2
3000270a:	00 00                	add    BYTE PTR [eax],al
3000270c:	f5                   	cmc    
3000270d:	dd ff                	(bad)  
3000270f:	ff 31                	push   DWORD PTR [ecx]
30002711:	00 00                	add    BYTE PTR [eax],al
30002713:	00 00                	add    BYTE PTR [eax],al
30002715:	41                   	inc    ecx
30002716:	0e                   	push   cs
30002717:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000271d:	44                   	inc    esp
3000271e:	83 03 68             	add    DWORD PTR [ebx],0x68
30002721:	c3                   	ret    
30002722:	41                   	inc    ecx
30002723:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002726:	04 00                	add    al,0x0
30002728:	1c 00                	sbb    al,0x0
3000272a:	00 00                	add    BYTE PTR [eax],al
3000272c:	60                   	pusha  
3000272d:	02 00                	add    al,BYTE PTR [eax]
3000272f:	00 02                	add    BYTE PTR [edx],al
30002731:	de ff                	fdivp  st(7),st
30002733:	ff 27                	jmp    DWORD PTR [edi]
30002735:	00 00                	add    BYTE PTR [eax],al
30002737:	00 00                	add    BYTE PTR [eax],al
30002739:	41                   	inc    ecx
3000273a:	0e                   	push   cs
3000273b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002741:	63 c5                	arpl   bp,ax
30002743:	0c 04                	or     al,0x4
30002745:	04 00                	add    al,0x0
30002747:	00 20                	add    BYTE PTR [eax],ah
30002749:	00 00                	add    BYTE PTR [eax],al
3000274b:	00 80 02 00 00 09    	add    BYTE PTR [eax+0x9000002],al
30002751:	de ff                	fdivp  st(7),st
30002753:	ff a4 00 00 00 00 41 	jmp    DWORD PTR [eax+eax*1+0x41000000]
3000275a:	0e                   	push   cs
3000275b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002761:	44                   	inc    esp
30002762:	83 03 02             	add    DWORD PTR [ebx],0x2
30002765:	9c                   	pushf  
30002766:	c5 c3 0c             	(bad)  
30002769:	04 04                	add    al,0x4
3000276b:	00 20                	add    BYTE PTR [eax],ah
3000276d:	00 00                	add    BYTE PTR [eax],al
3000276f:	00 a4 02 00 00 89 de 	add    BYTE PTR [edx+eax*1-0x21770000],ah
30002776:	ff                   	(bad)  
30002777:	ff 1f                	call   FWORD PTR [edi]
30002779:	00 00                	add    BYTE PTR [eax],al
3000277b:	00 00                	add    BYTE PTR [eax],al
3000277d:	41                   	inc    ecx
3000277e:	0e                   	push   cs
3000277f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002785:	44                   	inc    esp
30002786:	83 03 56             	add    DWORD PTR [ebx],0x56
30002789:	c3                   	ret    
3000278a:	41                   	inc    ecx
3000278b:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000278e:	04 00                	add    al,0x0
30002790:	1c 00                	sbb    al,0x0
30002792:	00 00                	add    BYTE PTR [eax],al
30002794:	c8 02 00 00          	enter  0x2,0x0
30002798:	84 de                	test   dh,bl
3000279a:	ff                   	(bad)  
3000279b:	ff 34 00             	push   DWORD PTR [eax+eax*1]
3000279e:	00 00                	add    BYTE PTR [eax],al
300027a0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300027a3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300027a9:	70 c5                	jo     30002770 <__x86.get_pc_thunk.cx+0x2a8>
300027ab:	0c 04                	or     al,0x4
300027ad:	04 00                	add    al,0x0
300027af:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300027b2:	00 00                	add    BYTE PTR [eax],al
300027b4:	e8 02 00 00 98       	call   c80027bb <ticksToWait+0x97ffed1f>
300027b9:	de ff                	fdivp  st(7),st
300027bb:	ff 34 00             	push   DWORD PTR [eax+eax*1]
300027be:	00 00                	add    BYTE PTR [eax],al
300027c0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300027c3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300027c9:	70 c5                	jo     30002790 <__x86.get_pc_thunk.cx+0x2c8>
300027cb:	0c 04                	or     al,0x4
300027cd:	04 00                	add    al,0x0
300027cf:	00 20                	add    BYTE PTR [eax],ah
300027d1:	00 00                	add    BYTE PTR [eax],al
300027d3:	00 08                	add    BYTE PTR [eax],cl
300027d5:	03 00                	add    eax,DWORD PTR [eax]
300027d7:	00 ac de ff ff 37 00 	add    BYTE PTR [esi+ebx*8+0x37ffff],ch
300027de:	00 00                	add    BYTE PTR [eax],al
300027e0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300027e3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300027e9:	44                   	inc    esp
300027ea:	83 03 6e             	add    DWORD PTR [ebx],0x6e
300027ed:	c3                   	ret    
300027ee:	41                   	inc    ecx
300027ef:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300027f2:	04 00                	add    al,0x0
300027f4:	20 00                	and    BYTE PTR [eax],al
300027f6:	00 00                	add    BYTE PTR [eax],al
300027f8:	2c 03                	sub    al,0x3
300027fa:	00 00                	add    BYTE PTR [eax],al
300027fc:	bf de ff ff 4e       	mov    edi,0x4effffde
30002801:	00 00                	add    BYTE PTR [eax],al
30002803:	00 00                	add    BYTE PTR [eax],al
30002805:	41                   	inc    ecx
30002806:	0e                   	push   cs
30002807:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000280d:	44                   	inc    esp
3000280e:	83 03 02             	add    DWORD PTR [ebx],0x2
30002811:	45                   	inc    ebp
30002812:	c3                   	ret    
30002813:	41                   	inc    ecx
30002814:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002817:	04 1c                	add    al,0x1c
30002819:	00 00                	add    BYTE PTR [eax],al
3000281b:	00 50 03             	add    BYTE PTR [eax+0x3],dl
3000281e:	00 00                	add    BYTE PTR [eax],al
30002820:	e9 de ff ff 1d       	jmp    4e002803 <ticksToWait+0x1dffed67>
30002825:	00 00                	add    BYTE PTR [eax],al
30002827:	00 00                	add    BYTE PTR [eax],al
30002829:	41                   	inc    ecx
3000282a:	0e                   	push   cs
3000282b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002831:	59                   	pop    ecx
30002832:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002835:	04 00                	add    al,0x0
30002837:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3000283a:	00 00                	add    BYTE PTR [eax],al
3000283c:	70 03                	jo     30002841 <__x86.get_pc_thunk.cx+0x379>
3000283e:	00 00                	add    BYTE PTR [eax],al
30002840:	e6 de                	out    0xde,al
30002842:	ff                   	(bad)  
30002843:	ff 29                	jmp    FWORD PTR [ecx]
30002845:	00 00                	add    BYTE PTR [eax],al
30002847:	00 00                	add    BYTE PTR [eax],al
30002849:	41                   	inc    ecx
3000284a:	0e                   	push   cs
3000284b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002851:	65 c5 0c 04          	lds    ecx,FWORD PTR gs:[esp+eax*1]
30002855:	04 00                	add    al,0x0
30002857:	00 20                	add    BYTE PTR [eax],ah
30002859:	00 00                	add    BYTE PTR [eax],al
3000285b:	00 90 03 00 00 ef    	add    BYTE PTR [eax-0x10fffffd],dl
30002861:	de ff                	fdivp  st(7),st
30002863:	ff 36                	push   DWORD PTR [esi]
30002865:	00 00                	add    BYTE PTR [eax],al
30002867:	00 00                	add    BYTE PTR [eax],al
30002869:	41                   	inc    ecx
3000286a:	0e                   	push   cs
3000286b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002871:	44                   	inc    esp
30002872:	83 03 6d             	add    DWORD PTR [ebx],0x6d
30002875:	c3                   	ret    
30002876:	41                   	inc    ecx
30002877:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000287a:	04 00                	add    al,0x0
3000287c:	1c 00                	sbb    al,0x0
3000287e:	00 00                	add    BYTE PTR [eax],al
30002880:	b4 03                	mov    ah,0x3
30002882:	00 00                	add    BYTE PTR [eax],al
30002884:	01 df                	add    edi,ebx
30002886:	ff                   	(bad)  
30002887:	ff 1d 00 00 00 00    	call   FWORD PTR ds:0x0
3000288d:	41                   	inc    ecx
3000288e:	0e                   	push   cs
3000288f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002895:	59                   	pop    ecx
30002896:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002899:	04 00                	add    al,0x0
3000289b:	00 20                	add    BYTE PTR [eax],ah
3000289d:	00 00                	add    BYTE PTR [eax],al
3000289f:	00 d4                	add    ah,dl
300028a1:	03 00                	add    eax,DWORD PTR [eax]
300028a3:	00 fe                	add    dh,bh
300028a5:	de ff                	fdivp  st(7),st
300028a7:	ff 42 00             	inc    DWORD PTR [edx+0x0]
300028aa:	00 00                	add    BYTE PTR [eax],al
300028ac:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300028af:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300028b5:	44                   	inc    esp
300028b6:	83 03 7a             	add    DWORD PTR [ebx],0x7a
300028b9:	c5 c3 0c             	(bad)  
300028bc:	04 04                	add    al,0x4
300028be:	00 00                	add    BYTE PTR [eax],al
300028c0:	1c 00                	sbb    al,0x0
300028c2:	00 00                	add    BYTE PTR [eax],al
300028c4:	f8                   	clc    
300028c5:	03 00                	add    eax,DWORD PTR [eax]
300028c7:	00 1c df             	add    BYTE PTR [edi+ebx*8],bl
300028ca:	ff                   	(bad)  
300028cb:	ff 20                	jmp    DWORD PTR [eax]
300028cd:	00 00                	add    BYTE PTR [eax],al
300028cf:	00 00                	add    BYTE PTR [eax],al
300028d1:	41                   	inc    ecx
300028d2:	0e                   	push   cs
300028d3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300028d9:	5c                   	pop    esp
300028da:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300028dd:	04 00                	add    al,0x0
300028df:	00 20                	add    BYTE PTR [eax],ah
300028e1:	00 00                	add    BYTE PTR [eax],al
300028e3:	00 18                	add    BYTE PTR [eax],bl
300028e5:	04 00                	add    al,0x0
300028e7:	00 1c df             	add    BYTE PTR [edi+ebx*8],bl
300028ea:	ff                   	(bad)  
300028eb:	ff 5c 00 00          	call   FWORD PTR [eax+eax*1+0x0]
300028ef:	00 00                	add    BYTE PTR [eax],al
300028f1:	41                   	inc    ecx
300028f2:	0e                   	push   cs
300028f3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300028f9:	44                   	inc    esp
300028fa:	83 03 02             	add    DWORD PTR [ebx],0x2
300028fd:	54                   	push   esp
300028fe:	c5 c3 0c             	(bad)  
30002901:	04 04                	add    al,0x4
30002903:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002906:	00 00                	add    BYTE PTR [eax],al
30002908:	3c 04                	cmp    al,0x4
3000290a:	00 00                	add    BYTE PTR [eax],al
3000290c:	54                   	push   esp
3000290d:	df ff                	(bad)  
3000290f:	ff 87 00 00 00 00    	inc    DWORD PTR [edi+0x0]
30002915:	41                   	inc    ecx
30002916:	0e                   	push   cs
30002917:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000291d:	02 83 c5 0c 04 04    	add    al,BYTE PTR [ebx+0x4040cc5]
30002923:	00 28                	add    BYTE PTR [eax],ch
30002925:	00 00                	add    BYTE PTR [eax],al
30002927:	00 5c 04 00          	add    BYTE PTR [esp+eax*1+0x0],bl
3000292b:	00 bb df ff ff e3    	add    BYTE PTR [ebx-0x1c000021],bh
30002931:	01 00                	add    DWORD PTR [eax],eax
30002933:	00 00                	add    BYTE PTR [eax],al
30002935:	41                   	inc    ecx
30002936:	0e                   	push   cs
30002937:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000293d:	45                   	inc    ebp
3000293e:	86 03                	xchg   BYTE PTR [ebx],al
30002940:	83 04 03 d8          	add    DWORD PTR [ebx+eax*1],0xffffffd8
30002944:	01 c3                	add    ebx,eax
30002946:	41                   	inc    ecx
30002947:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
3000294b:	04 04                	add    al,0x4
3000294d:	00 00                	add    BYTE PTR [eax],al
3000294f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002952:	00 00                	add    BYTE PTR [eax],al
30002954:	88 04 00             	mov    BYTE PTR [eax+eax*1],al
30002957:	00 72 e1             	add    BYTE PTR [edx-0x1f],dh
3000295a:	ff                   	(bad)  
3000295b:	ff                   	(bad)  
3000295c:	39 00                	cmp    DWORD PTR [eax],eax
3000295e:	00 00                	add    BYTE PTR [eax],al
30002960:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002963:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002969:	75 c5                	jne    30002930 <__x86.get_pc_thunk.cx+0x468>
3000296b:	0c 04                	or     al,0x4
3000296d:	04 00                	add    al,0x0
3000296f:	00 20                	add    BYTE PTR [eax],ah
30002971:	00 00                	add    BYTE PTR [eax],al
30002973:	00 a8 04 00 00 8b    	add    BYTE PTR [eax-0x74fffffc],ch
30002979:	e1 ff                	loope  3000297a <__x86.get_pc_thunk.cx+0x4b2>
3000297b:	ff 26                	jmp    DWORD PTR [esi]
3000297d:	00 00                	add    BYTE PTR [eax],al
3000297f:	00 00                	add    BYTE PTR [eax],al
30002981:	41                   	inc    ecx
30002982:	0e                   	push   cs
30002983:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002989:	41                   	inc    ecx
3000298a:	83 03 60             	add    DWORD PTR [ebx],0x60
3000298d:	c3                   	ret    
3000298e:	41                   	inc    ecx
3000298f:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002992:	04 00                	add    al,0x0
30002994:	10 00                	adc    BYTE PTR [eax],al
30002996:	00 00                	add    BYTE PTR [eax],al
30002998:	cc                   	int3   
30002999:	04 00                	add    al,0x0
3000299b:	00 28                	add    BYTE PTR [eax],ch
3000299d:	fb                   	sti    
3000299e:	ff                   	(bad)  
3000299f:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
300029a2:	00 00                	add    BYTE PTR [eax],al
300029a4:	00 00                	add    BYTE PTR [eax],al
300029a6:	00 00                	add    BYTE PTR [eax],al
300029a8:	1c 00                	sbb    al,0x0
300029aa:	00 00                	add    BYTE PTR [eax],al
300029ac:	e0 04                	loopne 300029b2 <__x86.get_pc_thunk.cx+0x4ea>
300029ae:	00 00                	add    BYTE PTR [eax],al
300029b0:	7c e1                	jl     30002993 <__x86.get_pc_thunk.cx+0x4cb>
300029b2:	ff                   	(bad)  
300029b3:	ff 9b 01 00 00 00    	call   FWORD PTR [ebx+0x1]
300029b9:	41                   	inc    ecx
300029ba:	0e                   	push   cs
300029bb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300029c1:	03 97 01 c5 0c 04    	add    edx,DWORD PTR [edi+0x40cc501]
300029c7:	04 1c                	add    al,0x1c
300029c9:	00 00                	add    BYTE PTR [eax],al
300029cb:	00 00                	add    BYTE PTR [eax],al
300029cd:	05 00 00 f8 e2       	add    eax,0xe2f80000
300029d2:	ff                   	(bad)  
300029d3:	ff c7                	inc    edi
300029d5:	00 00                	add    BYTE PTR [eax],al
300029d7:	00 00                	add    BYTE PTR [eax],al
300029d9:	41                   	inc    ecx
300029da:	0e                   	push   cs
300029db:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300029e1:	02 c3                	add    al,bl
300029e3:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300029e6:	04 00                	add    al,0x0
300029e8:	1c 00                	sbb    al,0x0
300029ea:	00 00                	add    BYTE PTR [eax],al
300029ec:	20 05 00 00 9f e3    	and    BYTE PTR ds:0xe39f0000,al
300029f2:	ff                   	(bad)  
300029f3:	ff c7                	inc    edi
300029f5:	00 00                	add    BYTE PTR [eax],al
300029f7:	00 00                	add    BYTE PTR [eax],al
300029f9:	41                   	inc    ecx
300029fa:	0e                   	push   cs
300029fb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002a01:	02 c3                	add    al,bl
30002a03:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002a06:	04 00                	add    al,0x0
30002a08:	1c 00                	sbb    al,0x0
30002a0a:	00 00                	add    BYTE PTR [eax],al
30002a0c:	40                   	inc    eax
30002a0d:	05 00 00 48 e4       	add    eax,0xe4480000
30002a12:	ff                   	(bad)  
30002a13:	ff 10                	call   DWORD PTR [eax]
30002a15:	00 00                	add    BYTE PTR [eax],al
30002a17:	00 00                	add    BYTE PTR [eax],al
30002a19:	41                   	inc    ecx
30002a1a:	0e                   	push   cs
30002a1b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002a21:	4c                   	dec    esp
30002a22:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002a25:	04 00                	add    al,0x0
30002a27:	00 20                	add    BYTE PTR [eax],ah
30002a29:	00 00                	add    BYTE PTR [eax],al
30002a2b:	00 60 05             	add    BYTE PTR [eax+0x5],ah
30002a2e:	00 00                	add    BYTE PTR [eax],al
30002a30:	38 e4                	cmp    ah,ah
30002a32:	ff                   	(bad)  
30002a33:	ff 2c 00             	jmp    FWORD PTR [eax+eax*1]
30002a36:	00 00                	add    BYTE PTR [eax],al
30002a38:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002a3b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002a41:	44                   	inc    esp
30002a42:	83 03 64             	add    DWORD PTR [ebx],0x64
30002a45:	c5 c3 0c             	(bad)  
30002a48:	04 04                	add    al,0x4
30002a4a:	00 00                	add    BYTE PTR [eax],al
30002a4c:	20 00                	and    BYTE PTR [eax],al
30002a4e:	00 00                	add    BYTE PTR [eax],al
30002a50:	84 05 00 00 40 e4    	test   BYTE PTR ds:0xe4400000,al
30002a56:	ff                   	(bad)  
30002a57:	ff 26                	jmp    DWORD PTR [esi]
30002a59:	00 00                	add    BYTE PTR [eax],al
30002a5b:	00 00                	add    BYTE PTR [eax],al
30002a5d:	41                   	inc    ecx
30002a5e:	0e                   	push   cs
30002a5f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002a65:	44                   	inc    esp
30002a66:	83 03 5e             	add    DWORD PTR [ebx],0x5e
30002a69:	c5 c3 0c             	(bad)  
30002a6c:	04 04                	add    al,0x4
30002a6e:	00 00                	add    BYTE PTR [eax],al
30002a70:	20 00                	and    BYTE PTR [eax],al
30002a72:	00 00                	add    BYTE PTR [eax],al
30002a74:	a8 05                	test   al,0x5
30002a76:	00 00                	add    BYTE PTR [eax],al
30002a78:	42                   	inc    edx
30002a79:	e4 ff                	in     al,0xff
30002a7b:	ff 37                	push   DWORD PTR [edi]
30002a7d:	01 00                	add    DWORD PTR [eax],eax
30002a7f:	00 00                	add    BYTE PTR [eax],al
30002a81:	41                   	inc    ecx
30002a82:	0e                   	push   cs
30002a83:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002a89:	44                   	inc    esp
30002a8a:	83 03 03             	add    DWORD PTR [ebx],0x3
30002a8d:	2f                   	das    
30002a8e:	01 c5                	add    ebp,eax
30002a90:	c3                   	ret    
30002a91:	0c 04                	or     al,0x4
30002a93:	04 20                	add    al,0x20
30002a95:	00 00                	add    BYTE PTR [eax],al
30002a97:	00 cc                	add    ah,cl
30002a99:	05 00 00 55 e5       	add    eax,0xe5550000
30002a9e:	ff                   	(bad)  
30002a9f:	ff 84 00 00 00 00 41 	inc    DWORD PTR [eax+eax*1+0x41000000]
30002aa6:	0e                   	push   cs
30002aa7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002aad:	44                   	inc    esp
30002aae:	83 03 02             	add    DWORD PTR [ebx],0x2
30002ab1:	7c c5                	jl     30002a78 <__x86.get_pc_thunk.cx+0x5b0>
30002ab3:	c3                   	ret    
30002ab4:	0c 04                	or     al,0x4
30002ab6:	04 00                	add    al,0x0
30002ab8:	1c 00                	sbb    al,0x0
30002aba:	00 00                	add    BYTE PTR [eax],al
30002abc:	f0 05 00 00 b5 e5    	lock add eax,0xe5b50000
30002ac2:	ff                   	(bad)  
30002ac3:	ff 53 00             	call   DWORD PTR [ebx+0x0]
30002ac6:	00 00                	add    BYTE PTR [eax],al
30002ac8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002acb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002ad1:	02 4f c5             	add    cl,BYTE PTR [edi-0x3b]
30002ad4:	0c 04                	or     al,0x4
30002ad6:	04 00                	add    al,0x0
30002ad8:	20 00                	and    BYTE PTR [eax],al
30002ada:	00 00                	add    BYTE PTR [eax],al
30002adc:	10 06                	adc    BYTE PTR [esi],al
30002ade:	00 00                	add    BYTE PTR [eax],al
30002ae0:	e8 e5 ff ff 3e       	call   6f002aca <ticksToWait+0x3efff02e>
30002ae5:	00 00                	add    BYTE PTR [eax],al
30002ae7:	00 00                	add    BYTE PTR [eax],al
30002ae9:	41                   	inc    ecx
30002aea:	0e                   	push   cs
30002aeb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002af1:	44                   	inc    esp
30002af2:	83 03 76             	add    DWORD PTR [ebx],0x76
30002af5:	c5 c3 0c             	(bad)  
30002af8:	04 04                	add    al,0x4
30002afa:	00 00                	add    BYTE PTR [eax],al
30002afc:	20 00                	and    BYTE PTR [eax],al
30002afe:	00 00                	add    BYTE PTR [eax],al
30002b00:	34 06                	xor    al,0x6
30002b02:	00 00                	add    BYTE PTR [eax],al
30002b04:	02 e6                	add    ah,dh
30002b06:	ff                   	(bad)  
30002b07:	ff                   	(bad)  
30002b08:	3e 00 00             	add    BYTE PTR ds:[eax],al
30002b0b:	00 00                	add    BYTE PTR [eax],al
30002b0d:	41                   	inc    ecx
30002b0e:	0e                   	push   cs
30002b0f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002b15:	44                   	inc    esp
30002b16:	83 03 76             	add    DWORD PTR [ebx],0x76
30002b19:	c5 c3 0c             	(bad)  
30002b1c:	04 04                	add    al,0x4
30002b1e:	00 00                	add    BYTE PTR [eax],al
30002b20:	1c 00                	sbb    al,0x0
30002b22:	00 00                	add    BYTE PTR [eax],al
30002b24:	58                   	pop    eax
30002b25:	06                   	push   es
30002b26:	00 00                	add    BYTE PTR [eax],al
30002b28:	1c e6                	sbb    al,0xe6
30002b2a:	ff                   	(bad)  
30002b2b:	ff 6f 00             	jmp    FWORD PTR [edi+0x0]
30002b2e:	00 00                	add    BYTE PTR [eax],al
30002b30:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002b33:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002b39:	02 6b c5             	add    ch,BYTE PTR [ebx-0x3b]
30002b3c:	0c 04                	or     al,0x4
30002b3e:	04 00                	add    al,0x0
30002b40:	24 00                	and    al,0x0
30002b42:	00 00                	add    BYTE PTR [eax],al
30002b44:	78 06                	js     30002b4c <__x86.get_pc_thunk.cx+0x684>
30002b46:	00 00                	add    BYTE PTR [eax],al
30002b48:	6c                   	ins    BYTE PTR es:[edi],dx
30002b49:	e6 ff                	out    0xff,al
30002b4b:	ff 5e 00             	call   FWORD PTR [esi+0x0]
30002b4e:	00 00                	add    BYTE PTR [eax],al
30002b50:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002b53:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002b59:	45                   	inc    ebp
30002b5a:	86 03                	xchg   BYTE PTR [ebx],al
30002b5c:	83 04 02 53          	add    DWORD PTR [edx+eax*1],0x53
30002b60:	c3                   	ret    
30002b61:	41                   	inc    ecx
30002b62:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
30002b66:	04 04                	add    al,0x4
30002b68:	1c 00                	sbb    al,0x0
30002b6a:	00 00                	add    BYTE PTR [eax],al
30002b6c:	a0 06 00 00 a4       	mov    al,ds:0xa4000006
30002b71:	e6 ff                	out    0xff,al
30002b73:	ff 40 00             	inc    DWORD PTR [eax+0x0]
30002b76:	00 00                	add    BYTE PTR [eax],al
30002b78:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002b7b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002b81:	7c c5                	jl     30002b48 <__x86.get_pc_thunk.cx+0x680>
30002b83:	0c 04                	or     al,0x4
30002b85:	04 00                	add    al,0x0
30002b87:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002b8a:	00 00                	add    BYTE PTR [eax],al
30002b8c:	c0 06 00             	rol    BYTE PTR [esi],0x0
30002b8f:	00 c4                	add    ah,al
30002b91:	e6 ff                	out    0xff,al
30002b93:	ff 40 00             	inc    DWORD PTR [eax+0x0]
30002b96:	00 00                	add    BYTE PTR [eax],al
30002b98:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002b9b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002ba1:	7c c5                	jl     30002b68 <__x86.get_pc_thunk.cx+0x6a0>
30002ba3:	0c 04                	or     al,0x4
30002ba5:	04 00                	add    al,0x0
30002ba7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002baa:	00 00                	add    BYTE PTR [eax],al
30002bac:	e0 06                	loopne 30002bb4 <__x86.get_pc_thunk.cx+0x6ec>
30002bae:	00 00                	add    BYTE PTR [eax],al
30002bb0:	e4 e6                	in     al,0xe6
30002bb2:	ff                   	(bad)  
30002bb3:	ff 47 00             	inc    DWORD PTR [edi+0x0]
30002bb6:	00 00                	add    BYTE PTR [eax],al
30002bb8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002bbb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002bc1:	02 43 c5             	add    al,BYTE PTR [ebx-0x3b]
30002bc4:	0c 04                	or     al,0x4
30002bc6:	04 00                	add    al,0x0
30002bc8:	1c 00                	sbb    al,0x0
30002bca:	00 00                	add    BYTE PTR [eax],al
30002bcc:	00 07                	add    BYTE PTR [edi],al
30002bce:	00 00                	add    BYTE PTR [eax],al
30002bd0:	0c e7                	or     al,0xe7
30002bd2:	ff                   	(bad)  
30002bd3:	ff 31                	push   DWORD PTR [ecx]
30002bd5:	00 00                	add    BYTE PTR [eax],al
30002bd7:	00 00                	add    BYTE PTR [eax],al
30002bd9:	41                   	inc    ecx
30002bda:	0e                   	push   cs
30002bdb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002be1:	6d                   	ins    DWORD PTR es:[edi],dx
30002be2:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002be5:	04 00                	add    al,0x0
30002be7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002bea:	00 00                	add    BYTE PTR [eax],al
30002bec:	20 07                	and    BYTE PTR [edi],al
30002bee:	00 00                	add    BYTE PTR [eax],al
30002bf0:	1d e7 ff ff 31       	sbb    eax,0x31ffffe7
30002bf5:	00 00                	add    BYTE PTR [eax],al
30002bf7:	00 00                	add    BYTE PTR [eax],al
30002bf9:	41                   	inc    ecx
30002bfa:	0e                   	push   cs
30002bfb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002c01:	6d                   	ins    DWORD PTR es:[edi],dx
30002c02:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002c05:	04 00                	add    al,0x0
30002c07:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002c0a:	00 00                	add    BYTE PTR [eax],al
30002c0c:	40                   	inc    eax
30002c0d:	07                   	pop    es
30002c0e:	00 00                	add    BYTE PTR [eax],al
30002c10:	30 e7                	xor    bh,ah
30002c12:	ff                   	(bad)  
30002c13:	ff 67 00             	jmp    DWORD PTR [edi+0x0]
30002c16:	00 00                	add    BYTE PTR [eax],al
30002c18:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002c1b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002c21:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
30002c24:	0c 04                	or     al,0x4
30002c26:	04 00                	add    al,0x0
30002c28:	1c 00                	sbb    al,0x0
30002c2a:	00 00                	add    BYTE PTR [eax],al
30002c2c:	60                   	pusha  
30002c2d:	07                   	pop    es
30002c2e:	00 00                	add    BYTE PTR [eax],al
30002c30:	78 e7                	js     30002c19 <__x86.get_pc_thunk.cx+0x751>
30002c32:	ff                   	(bad)  
30002c33:	ff 60 00             	jmp    DWORD PTR [eax+0x0]
30002c36:	00 00                	add    BYTE PTR [eax],al
30002c38:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002c3b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002c41:	02 5c c5 0c          	add    bl,BYTE PTR [ebp+eax*8+0xc]
30002c45:	04 04                	add    al,0x4
30002c47:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
30002c4a:	00 00                	add    BYTE PTR [eax],al
30002c4c:	80 07 00             	add    BYTE PTR [edi],0x0
30002c4f:	00 b8 e7 ff ff 7d    	add    BYTE PTR [eax+0x7dffffe7],bh
30002c55:	01 00                	add    DWORD PTR [eax],eax
30002c57:	00 00                	add    BYTE PTR [eax],al
30002c59:	41                   	inc    ecx
30002c5a:	0e                   	push   cs
30002c5b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002c61:	46                   	inc    esi
30002c62:	87 03                	xchg   DWORD PTR [ebx],eax
30002c64:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
30002c67:	05 03 70 01 c3       	add    eax,0xc3017003
30002c6c:	41                   	inc    ecx
30002c6d:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002c71:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002c74:	04 00                	add    al,0x0
30002c76:	00 00                	add    BYTE PTR [eax],al
30002c78:	1c 00                	sbb    al,0x0
30002c7a:	00 00                	add    BYTE PTR [eax],al
30002c7c:	b0 07                	mov    al,0x7
30002c7e:	00 00                	add    BYTE PTR [eax],al
30002c80:	08 e9                	or     cl,ch
30002c82:	ff                   	(bad)  
30002c83:	ff 1d 00 00 00 00    	call   FWORD PTR ds:0x0
30002c89:	41                   	inc    ecx
30002c8a:	0e                   	push   cs
30002c8b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002c91:	59                   	pop    ecx
30002c92:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002c95:	04 00                	add    al,0x0
30002c97:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
30002c9a:	00 00                	add    BYTE PTR [eax],al
30002c9c:	d0 07                	rol    BYTE PTR [edi],1
30002c9e:	00 00                	add    BYTE PTR [eax],al
30002ca0:	08 e9                	or     cl,ch
30002ca2:	ff                   	(bad)  
30002ca3:	ff 9c 01 00 00 00 41 	call   FWORD PTR [ecx+eax*1+0x41000000]
30002caa:	0e                   	push   cs
30002cab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002cb1:	46                   	inc    esi
30002cb2:	87 03                	xchg   DWORD PTR [ebx],eax
30002cb4:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
30002cb7:	05 03 8f 01 c3       	add    eax,0xc3018f03
30002cbc:	41                   	inc    ecx
30002cbd:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002cc1:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002cc4:	04 00                	add    al,0x0
30002cc6:	00 00                	add    BYTE PTR [eax],al
30002cc8:	20 00                	and    BYTE PTR [eax],al
30002cca:	00 00                	add    BYTE PTR [eax],al
30002ccc:	00 08                	add    BYTE PTR [eax],cl
30002cce:	00 00                	add    BYTE PTR [eax],al
30002cd0:	74 ea                	je     30002cbc <__x86.get_pc_thunk.cx+0x7f4>
30002cd2:	ff                   	(bad)  
30002cd3:	ff 96 00 00 00 00    	call   DWORD PTR [esi+0x0]
30002cd9:	41                   	inc    ecx
30002cda:	0e                   	push   cs
30002cdb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002ce1:	44                   	inc    esp
30002ce2:	83 03 02             	add    DWORD PTR [ebx],0x2
30002ce5:	8e c5                	mov    es,ebp
30002ce7:	c3                   	ret    
30002ce8:	0c 04                	or     al,0x4
30002cea:	04 00                	add    al,0x0
30002cec:	24 00                	and    al,0x0
30002cee:	00 00                	add    BYTE PTR [eax],al
30002cf0:	24 08                	and    al,0x8
30002cf2:	00 00                	add    BYTE PTR [eax],al
30002cf4:	e8 ea ff ff 6e       	call   9f002ce3 <ticksToWait+0x6efff247>
30002cf9:	00 00                	add    BYTE PTR [eax],al
30002cfb:	00 00                	add    BYTE PTR [eax],al
30002cfd:	41                   	inc    ecx
30002cfe:	0e                   	push   cs
30002cff:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002d05:	42                   	inc    edx
30002d06:	86 03                	xchg   BYTE PTR [ebx],al
30002d08:	83 04 02 66          	add    DWORD PTR [edx+eax*1],0x66
30002d0c:	c3                   	ret    
30002d0d:	41                   	inc    ecx
30002d0e:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
30002d12:	04 04                	add    al,0x4
30002d14:	1c 00                	sbb    al,0x0
30002d16:	00 00                	add    BYTE PTR [eax],al
30002d18:	4c                   	dec    esp
30002d19:	08 00                	or     BYTE PTR [eax],al
30002d1b:	00 30                	add    BYTE PTR [eax],dh
30002d1d:	eb ff                	jmp    30002d1e <__x86.get_pc_thunk.cx+0x856>
30002d1f:	ff 29                	jmp    FWORD PTR [ecx]
30002d21:	00 00                	add    BYTE PTR [eax],al
30002d23:	00 00                	add    BYTE PTR [eax],al
30002d25:	41                   	inc    ecx
30002d26:	0e                   	push   cs
30002d27:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002d2d:	65 c5 0c 04          	lds    ecx,FWORD PTR gs:[esp+eax*1]
30002d31:	04 00                	add    al,0x0
30002d33:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
30002d36:	00 00                	add    BYTE PTR [eax],al
30002d38:	6c                   	ins    BYTE PTR es:[edi],dx
30002d39:	08 00                	or     BYTE PTR [eax],al
30002d3b:	00 39                	add    BYTE PTR [ecx],bh
30002d3d:	eb ff                	jmp    30002d3e <__x86.get_pc_thunk.cx+0x876>
30002d3f:	ff 19                	call   FWORD PTR [ecx]
30002d41:	03 00                	add    eax,DWORD PTR [eax]
30002d43:	00 00                	add    BYTE PTR [eax],al
30002d45:	41                   	inc    ecx
30002d46:	0e                   	push   cs
30002d47:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002d4d:	44                   	inc    esp
30002d4e:	83 03 03             	add    DWORD PTR [ebx],0x3
30002d51:	10 03                	adc    BYTE PTR [ebx],al
30002d53:	c3                   	ret    
30002d54:	41                   	inc    ecx
30002d55:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002d58:	04 00                	add    al,0x0
30002d5a:	00 00                	add    BYTE PTR [eax],al
30002d5c:	20 00                	and    BYTE PTR [eax],al
30002d5e:	00 00                	add    BYTE PTR [eax],al
30002d60:	94                   	xchg   esp,eax
30002d61:	08 00                	or     BYTE PTR [eax],al
30002d63:	00 2a                	add    BYTE PTR [edx],ch
30002d65:	ee                   	out    dx,al
30002d66:	ff                   	(bad)  
30002d67:	ff                   	(bad)  
30002d68:	3f                   	aas    
30002d69:	00 00                	add    BYTE PTR [eax],al
30002d6b:	00 00                	add    BYTE PTR [eax],al
30002d6d:	41                   	inc    ecx
30002d6e:	0e                   	push   cs
30002d6f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002d75:	44                   	inc    esp
30002d76:	83 03 77             	add    DWORD PTR [ebx],0x77
30002d79:	c5 c3 0c             	(bad)  
30002d7c:	04 04                	add    al,0x4
30002d7e:	00 00                	add    BYTE PTR [eax],al
30002d80:	20 00                	and    BYTE PTR [eax],al
30002d82:	00 00                	add    BYTE PTR [eax],al
30002d84:	b8 08 00 00 45       	mov    eax,0x45000008
30002d89:	ee                   	out    dx,al
30002d8a:	ff                   	(bad)  
30002d8b:	ff                   	(bad)  
30002d8c:	3e 00 00             	add    BYTE PTR ds:[eax],al
30002d8f:	00 00                	add    BYTE PTR [eax],al
30002d91:	41                   	inc    ecx
30002d92:	0e                   	push   cs
30002d93:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002d99:	44                   	inc    esp
30002d9a:	83 03 76             	add    DWORD PTR [ebx],0x76
30002d9d:	c5 c3 0c             	(bad)  
30002da0:	04 04                	add    al,0x4
30002da2:	00 00                	add    BYTE PTR [eax],al
30002da4:	2c 00                	sub    al,0x0
30002da6:	00 00                	add    BYTE PTR [eax],al
30002da8:	dc 08                	fmul   QWORD PTR [eax]
30002daa:	00 00                	add    BYTE PTR [eax],al
30002dac:	5f                   	pop    edi
30002dad:	ee                   	out    dx,al
30002dae:	ff                   	(bad)  
30002daf:	ff 57 08             	call   DWORD PTR [edi+0x8]
30002db2:	00 00                	add    BYTE PTR [eax],al
30002db4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002db7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002dbd:	46                   	inc    esi
30002dbe:	87 03                	xchg   DWORD PTR [ebx],eax
30002dc0:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
30002dc3:	05 03 4a 08 c3       	add    eax,0xc3084a03
30002dc8:	41                   	inc    ecx
30002dc9:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002dcd:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002dd0:	04 00                	add    al,0x0
30002dd2:	00 00                	add    BYTE PTR [eax],al
30002dd4:	10 00                	adc    BYTE PTR [eax],al
30002dd6:	00 00                	add    BYTE PTR [eax],al
30002dd8:	0c 09                	or     al,0x9
30002dda:	00 00                	add    BYTE PTR [eax],al
30002ddc:	ec                   	in     al,dx
30002ddd:	f6 ff                	idiv   bh
30002ddf:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
30002de2:	00 00                	add    BYTE PTR [eax],al
30002de4:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynsym:

30002de8 <.dynsym>:
	...
30002df8:	c5 00                	lds    eax,FWORD PTR [eax]
30002dfa:	00 00                	add    BYTE PTR [eax],al
30002dfc:	14 12                	adc    al,0x12
30002dfe:	00 30                	add    BYTE PTR [eax],dh
30002e00:	40                   	inc    eax
30002e01:	00 00                	add    BYTE PTR [eax],al
30002e03:	00 12                	add    BYTE PTR [edx],dl
30002e05:	00 01                	add    BYTE PTR [ecx],al
30002e07:	00 68 00             	add    BYTE PTR [eax+0x0],ch
30002e0a:	00 00                	add    BYTE PTR [eax],al
30002e0c:	85 07                	test   DWORD PTR [edi],eax
30002e0e:	00 30                	add    BYTE PTR [eax],dh
30002e10:	1d 00 00 00 12       	sbb    eax,0x12000000
30002e15:	00 01                	add    BYTE PTR [ecx],al
30002e17:	00 4a 00             	add    BYTE PTR [edx+0x0],cl
30002e1a:	00 00                	add    BYTE PTR [eax],al
30002e1c:	1c 06                	sbb    al,0x6
30002e1e:	00 30                	add    BYTE PTR [eax],dh
30002e20:	34 00                	xor    al,0x0
30002e22:	00 00                	add    BYTE PTR [eax],al
30002e24:	12 00                	adc    al,BYTE PTR [eax]
30002e26:	01 00                	add    DWORD PTR [eax],eax
30002e28:	ae                   	scas   al,BYTE PTR es:[edi]
30002e29:	00 00                	add    BYTE PTR [eax],al
30002e2b:	00 f1                	add    cl,dh
30002e2d:	0f 00                	(bad)  
30002e2f:	30 84 00 00 00 12 00 	xor    BYTE PTR [eax+eax*1+0x120000],al
30002e36:	01 00                	add    DWORD PTR [eax],eax
30002e38:	3b 00                	cmp    eax,DWORD PTR [eax]
30002e3a:	00 00                	add    BYTE PTR [eax],al
30002e3c:	dc 03                	fadd   QWORD PTR [ebx]
30002e3e:	00 30                	add    BYTE PTR [eax],dh
30002e40:	ba 00 00 00 12       	mov    edx,0x12000000
30002e45:	00 01                	add    BYTE PTR [ecx],al
30002e47:	00 36                	add    BYTE PTR [esi],dh
30002e49:	00 00                	add    BYTE PTR [eax],al
30002e4b:	00 ad 03 00 30 2f    	add    BYTE PTR [ebp+0x2f300003],ch
30002e51:	00 00                	add    BYTE PTR [eax],al
30002e53:	00 12                	add    BYTE PTR [edx],dl
30002e55:	00 01                	add    BYTE PTR [ecx],al
30002e57:	00 94 00 00 00 2c 0b 	add    BYTE PTR [eax+eax*1+0xb2c0000],dl
30002e5e:	00 30                	add    BYTE PTR [eax],dh
30002e60:	9b                   	fwait
30002e61:	01 00                	add    DWORD PTR [eax],eax
30002e63:	00 12                	add    BYTE PTR [edx],dl
30002e65:	00 01                	add    BYTE PTR [ecx],al
30002e67:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002e6a:	00 00                	add    BYTE PTR [eax],al
30002e6c:	44                   	inc    esp
30002e6d:	03 00                	add    eax,DWORD PTR [eax]
30002e6f:	30 26                	xor    BYTE PTR [esi],ah
30002e71:	00 00                	add    BYTE PTR [eax],al
30002e73:	00 12                	add    BYTE PTR [edx],dl
30002e75:	00 01                	add    BYTE PTR [ecx],al
30002e77:	00 88 00 00 00 e7    	add    BYTE PTR [eax-0x19000000],cl
30002e7d:	08 00                	or     BYTE PTR [eax],al
30002e7f:	30 e3                	xor    bl,ah
30002e81:	01 00                	add    DWORD PTR [eax],eax
30002e83:	00 12                	add    BYTE PTR [edx],dl
30002e85:	00 01                	add    BYTE PTR [ecx],al
30002e87:	00 50 00             	add    BYTE PTR [eax+0x0],dl
30002e8a:	00 00                	add    BYTE PTR [eax],al
30002e8c:	bb 06 00 30 4e       	mov    ebx,0x4e300006
30002e91:	00 00                	add    BYTE PTR [eax],al
30002e93:	00 12                	add    BYTE PTR [edx],dl
30002e95:	00 01                	add    BYTE PTR [ecx],al
30002e97:	00 eb                	add    bl,ch
30002e99:	00 00                	add    BYTE PTR [eax],al
30002e9b:	00 08                	add    BYTE PTR [eax],cl
30002e9d:	14 00                	adc    al,0x0
30002e9f:	30 7d 01             	xor    BYTE PTR [ebp+0x1],bh
30002ea2:	00 00                	add    BYTE PTR [eax],al
30002ea4:	12 00                	adc    al,BYTE PTR [eax]
30002ea6:	01 00                	add    DWORD PTR [eax],eax
30002ea8:	a2 00 00 00 58       	mov    ds:0x58000000,al
30002ead:	0e                   	push   cs
30002eae:	00 30                	add    BYTE PTR [eax],dh
30002eb0:	10 00                	adc    BYTE PTR [eax],al
30002eb2:	00 00                	add    BYTE PTR [eax],al
30002eb4:	12 00                	adc    al,BYTE PTR [eax]
30002eb6:	01 00                	add    DWORD PTR [eax],eax
30002eb8:	78 00                	js     30002eba <__x86.get_pc_thunk.cx+0x9f2>
30002eba:	00 00                	add    BYTE PTR [eax],al
30002ebc:	75 18                	jne    30002ed6 <__x86.get_pc_thunk.cx+0xa0e>
30002ebe:	00 30                	add    BYTE PTR [eax],dh
30002ec0:	19 03                	sbb    DWORD PTR [ebx],eax
30002ec2:	00 00                	add    BYTE PTR [eax],al
30002ec4:	12 00                	adc    al,BYTE PTR [eax]
30002ec6:	01 00                	add    DWORD PTR [eax],eax
30002ec8:	fb                   	sti    
30002ec9:	00 00                	add    BYTE PTR [eax],al
30002ecb:	00 a8 15 00 30 9c    	add    BYTE PTR [eax-0x63cfffeb],ch
30002ed1:	01 00                	add    DWORD PTR [eax],eax
30002ed3:	00 12                	add    BYTE PTR [edx],dl
30002ed5:	00 01                	add    BYTE PTR [ecx],al
30002ed7:	00 40 00             	add    BYTE PTR [eax+0x0],al
30002eda:	00 00                	add    BYTE PTR [eax],al
30002edc:	59                   	pop    ecx
30002edd:	05 00 30 a4 00       	add    eax,0xa43000
30002ee2:	00 00                	add    BYTE PTR [eax],al
30002ee4:	12 00                	adc    al,BYTE PTR [eax]
30002ee6:	01 00                	add    DWORD PTR [eax],eax
30002ee8:	b7 00                	mov    bh,0x0
30002eea:	00 00                	add    BYTE PTR [eax],al
30002eec:	c8 10 00 30          	enter  0x10,0x30
30002ef0:	3e 00 00             	add    BYTE PTR ds:[eax],al
30002ef3:	00 12                	add    BYTE PTR [edx],dl
30002ef5:	00 01                	add    BYTE PTR [ecx],al
30002ef7:	00 63 00             	add    BYTE PTR [ebx+0x0],ah
30002efa:	00 00                	add    BYTE PTR [eax],al
30002efc:	4f                   	dec    edi
30002efd:	07                   	pop    es
30002efe:	00 30                	add    BYTE PTR [eax],dh
30002f00:	36 00 00             	add    BYTE PTR ss:[eax],al
30002f03:	00 12                	add    BYTE PTR [edx],dl
30002f05:	00 01                	add    BYTE PTR [ecx],al
30002f07:	00 27                	add    BYTE PTR [edi],ah
30002f09:	01 00                	add    DWORD PTR [eax],eax
30002f0b:	00 0b                	add    BYTE PTR [ebx],cl
30002f0d:	1c 00                	sbb    al,0x0
30002f0f:	30 57 08             	xor    BYTE PTR [edi+0x8],dl
30002f12:	00 00                	add    BYTE PTR [eax],al
30002f14:	12 00                	adc    al,BYTE PTR [eax]
30002f16:	01 00                	add    DWORD PTR [eax],eax
30002f18:	0a 01                	or     al,BYTE PTR [ecx]
30002f1a:	00 00                	add    BYTE PTR [eax],al
30002f1c:	dc 17                	fcom   QWORD PTR [edi]
30002f1e:	00 30                	add    BYTE PTR [eax],dh
30002f20:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f21:	00 00                	add    BYTE PTR [eax],al
30002f23:	00 12                	add    BYTE PTR [edx],dl
30002f25:	00 01                	add    BYTE PTR [ecx],al
30002f27:	00 db                	add    bl,bl
30002f29:	00 00                	add    BYTE PTR [eax],al
30002f2b:	00 40 13             	add    BYTE PTR [eax+0x13],al
30002f2e:	00 30                	add    BYTE PTR [eax],dh
30002f30:	67 00 00             	add    BYTE PTR [bx+si],al
30002f33:	00 12                	add    BYTE PTR [edx],dl
30002f35:	00 01                	add    BYTE PTR [ecx],al
30002f37:	00 e3                	add    bl,ah
30002f39:	00 00                	add    BYTE PTR [eax],al
30002f3b:	00 a8 13 00 30 60    	add    BYTE PTR [eax+0x60300013],ch
30002f41:	00 00                	add    BYTE PTR [eax],al
30002f43:	00 12                	add    BYTE PTR [edx],dl
30002f45:	00 01                	add    BYTE PTR [ecx],al
30002f47:	00 10                	add    BYTE PTR [eax],dl
30002f49:	00 00                	add    BYTE PTR [eax],al
30002f4b:	00 1c 01             	add    BYTE PTR [ecx+eax*1],bl
30002f4e:	00 30                	add    BYTE PTR [eax],dh
30002f50:	97                   	xchg   edi,eax
30002f51:	00 00                	add    BYTE PTR [eax],al
30002f53:	00 12                	add    BYTE PTR [edx],dl
30002f55:	00 01                	add    BYTE PTR [ecx],al
30002f57:	00 21                	add    BYTE PTR [ecx],ah
30002f59:	00 00                	add    BYTE PTR [eax],al
30002f5b:	00 00                	add    BYTE PTR [eax],al
30002f5d:	00 13                	add    BYTE PTR [ebx],dl
30002f5f:	00 00                	add    BYTE PTR [eax],al
30002f61:	00 00                	add    BYTE PTR [eax],al
30002f63:	00 10                	add    BYTE PTR [eax],dl
30002f65:	00 01                	add    BYTE PTR [ecx],al
30002f67:	00 11                	add    BYTE PTR [ecx],dl
30002f69:	01 00                	add    DWORD PTR [eax],eax
30002f6b:	00 8e 1b 00 30 3f    	add    BYTE PTR [esi+0x3f30001b],cl
30002f71:	00 00                	add    BYTE PTR [eax],al
30002f73:	00 12                	add    BYTE PTR [edx],dl
30002f75:	00 01                	add    BYTE PTR [ecx],al
30002f77:	00 9b 00 00 00 c8    	add    BYTE PTR [ebx-0x38000000],bl
30002f7d:	0c 00                	or     al,0x0
30002f7f:	30 c7                	xor    bh,al
30002f81:	00 00                	add    BYTE PTR [eax],al
30002f83:	00 12                	add    BYTE PTR [edx],dl
30002f85:	00 01                	add    BYTE PTR [ecx],al
30002f87:	00 02                	add    BYTE PTR [edx],al
30002f89:	01 00                	add    DWORD PTR [eax],eax
30002f8b:	00 44 17 00          	add    BYTE PTR [edi+edx*1+0x0],al
30002f8f:	30 96 00 00 00 12    	xor    BYTE PTR [esi+0x12000000],dl
30002f95:	00 01                	add    BYTE PTR [ecx],al
30002f97:	00 29                	add    BYTE PTR [ecx],ch
30002f99:	01 00                	add    DWORD PTR [eax],eax
30002f9b:	00 4c 18 00          	add    BYTE PTR [eax+ebx*1+0x0],cl
30002f9f:	30 29                	xor    BYTE PTR [ecx],ch
30002fa1:	00 00                	add    BYTE PTR [eax],al
30002fa3:	00 12                	add    BYTE PTR [edx],dl
30002fa5:	00 01                	add    BYTE PTR [ecx],al
30002fa7:	00 31                	add    BYTE PTR [ecx],dh
30002fa9:	00 00                	add    BYTE PTR [eax],al
30002fab:	00 6a 03             	add    BYTE PTR [edx+0x3],ch
30002fae:	00 30                	add    BYTE PTR [eax],dh
30002fb0:	43                   	inc    ebx
30002fb1:	00 00                	add    BYTE PTR [eax],al
30002fb3:	00 12                	add    BYTE PTR [edx],dl
30002fb5:	00 01                	add    BYTE PTR [ecx],al
30002fb7:	00 cc                	add    ah,cl
30002fb9:	00 00                	add    BYTE PTR [eax],al
30002fbb:	00 b4 11 00 30 5e 00 	add    BYTE PTR [ecx+edx*1+0x5e3000],dh
30002fc2:	00 00                	add    BYTE PTR [eax],al
30002fc4:	12 00                	adc    al,BYTE PTR [eax]
30002fc6:	01 00                	add    DWORD PTR [eax],eax
30002fc8:	81 00 00 00 e4 07    	add    DWORD PTR [eax],0x7e40000
30002fce:	00 30                	add    BYTE PTR [eax],dh
30002fd0:	20 00                	and    BYTE PTR [eax],al
30002fd2:	00 00                	add    BYTE PTR [eax],al
30002fd4:	12 00                	adc    al,BYTE PTR [eax]
30002fd6:	01 00                	add    DWORD PTR [eax],eax
30002fd8:	08 00                	or     BYTE PTR [eax],al
30002fda:	00 00                	add    BYTE PTR [eax],al
30002fdc:	70 00                	jo     30002fde <__x86.get_pc_thunk.cx+0xb16>
30002fde:	00 30                	add    BYTE PTR [eax],dh
30002fe0:	55                   	push   ebp
30002fe1:	00 00                	add    BYTE PTR [eax],al
30002fe3:	00 12                	add    BYTE PTR [edx],dl
30002fe5:	00 01                	add    BYTE PTR [ecx],al
30002fe7:	00 d3                	add    bl,dl
30002fe9:	00 00                	add    BYTE PTR [eax],al
30002feb:	00 94 12 00 30 47 00 	add    BYTE PTR [edx+edx*1+0x473000],dl
30002ff2:	00 00                	add    BYTE PTR [eax],al
30002ff4:	12 00                	adc    al,BYTE PTR [eax]
30002ff6:	01 00                	add    DWORD PTR [eax],eax
30002ff8:	56                   	push   esi
30002ff9:	00 00                	add    BYTE PTR [eax],al
30002ffb:	00 26                	add    BYTE PTR [esi],ah
30002ffd:	07                   	pop    es
30002ffe:	00 30                	add    BYTE PTR [eax],dh
30003000:	29 00                	sub    DWORD PTR [eax],eax
30003002:	00 00                	add    BYTE PTR [eax],al
30003004:	12 00                	adc    al,BYTE PTR [eax]
30003006:	01 00                	add    DWORD PTR [eax],eax
30003008:	1b 01                	sbb    eax,DWORD PTR [ecx]
3000300a:	00 00                	add    BYTE PTR [eax],al
3000300c:	cd 1b                	int    0x1b
3000300e:	00 30                	add    BYTE PTR [eax],dh
30003010:	3e 00 00             	add    BYTE PTR ds:[eax],al
30003013:	00 12                	add    BYTE PTR [edx],dl
30003015:	00 01                	add    BYTE PTR [ecx],al
30003017:	00 70 00             	add    BYTE PTR [eax+0x0],dh
3000301a:	00 00                	add    BYTE PTR [eax],al
3000301c:	a2 07 00 30 42       	mov    ds:0x42300007,al
30003021:	00 00                	add    BYTE PTR [eax],al
30003023:	00 12                	add    BYTE PTR [edx],dl
30003025:	00 01                	add    BYTE PTR [ecx],al
30003027:	00 17                	add    BYTE PTR [edi],dl
30003029:	00 00                	add    BYTE PTR [eax],al
3000302b:	00 e6                	add    dh,ah
3000302d:	02 00                	add    al,BYTE PTR [eax]
3000302f:	30 5c 00 00          	xor    BYTE PTR [eax+eax*1+0x0],bl
30003033:	00 12                	add    BYTE PTR [edx],dl
30003035:	00 01                	add    BYTE PTR [ecx],al
30003037:	00 a7 00 00 00 ba    	add    BYTE PTR [edi-0x46000000],ah
3000303d:	0e                   	push   cs
3000303e:	00 30                	add    BYTE PTR [eax],dh
30003040:	37                   	aaa    
30003041:	01 00                	add    DWORD PTR [eax],eax
30003043:	00 12                	add    BYTE PTR [edx],dl
30003045:	00 01                	add    BYTE PTR [ecx],al
30003047:	00 be 00 00 00 dc    	add    BYTE PTR [esi-0x24000000],bh
3000304d:	12 00                	adc    al,BYTE PTR [eax]
3000304f:	30 31                	xor    BYTE PTR [ecx],dh
30003051:	00 00                	add    BYTE PTR [eax],al
30003053:	00 12                	add    BYTE PTR [edx],dl
30003055:	00 01                	add    BYTE PTR [ecx],al
30003057:	00 01                	add    BYTE PTR [ecx],al
30003059:	00 00                	add    BYTE PTR [eax],al
3000305b:	00 00                	add    BYTE PTR [eax],al
3000305d:	00 00                	add    BYTE PTR [eax],al
3000305f:	30 38                	xor    BYTE PTR [eax],bh
30003061:	00 00                	add    BYTE PTR [eax],al
30003063:	00 12                	add    BYTE PTR [edx],dl
30003065:	00 01                	add    BYTE PTR [ecx],al
30003067:	00 f3                	add    bl,dh
30003069:	00 00                	add    BYTE PTR [eax],al
3000306b:	00 88 15 00 30 1d    	add    BYTE PTR [eax+0x1d300015],cl
30003071:	00 00                	add    BYTE PTR [eax],al
30003073:	00 12                	add    BYTE PTR [edx],dl
30003075:	00 01                	add    BYTE PTR [ecx],al
30003077:	00 8f 00 00 00 ca    	add    BYTE PTR [edi-0x36000000],cl
3000307d:	0a 00                	or     al,BYTE PTR [eax]
3000307f:	30 39                	xor    BYTE PTR [ecx],bh
30003081:	00 00                	add    BYTE PTR [eax],al
30003083:	00 12                	add    BYTE PTR [edx],dl
30003085:	00 01                	add    BYTE PTR [ecx],al
	...

Disassembly of section .dynstr:

30003088 <.dynstr>:
30003088:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
3000308b:	72 63                	jb     300030f0 <__x86.get_pc_thunk.cx+0xc28>
3000308d:	68 72 00 73 74       	push   0x74730072
30003092:	72 63                	jb     300030f7 <__x86.get_pc_thunk.cx+0xc2f>
30003094:	73 70                	jae    30003106 <__x86.get_pc_thunk.cx+0xc3e>
30003096:	6e                   	outs   dx,BYTE PTR ds:[esi]
30003097:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
3000309a:	72 74                	jb     30003110 <__x86.get_pc_thunk.cx+0xc48>
3000309c:	6f                   	outs   dx,DWORD PTR ds:[esi]
3000309d:	6b 00 61             	imul   eax,DWORD PTR [eax],0x61
300030a0:	74 6f                	je     30003111 <__x86.get_pc_thunk.cx+0xc49>
300030a2:	69 00 70 75 74 73    	imul   eax,DWORD PTR [eax],0x73747570
300030a8:	00 73 79             	add    BYTE PTR [ebx+0x79],dh
300030ab:	73 45                	jae    300030f2 <__x86.get_pc_thunk.cx+0xc2a>
300030ad:	6e                   	outs   dx,BYTE PTR ds:[esi]
300030ae:	74 65                	je     30003115 <__x86.get_pc_thunk.cx+0xc4d>
300030b0:	72 5f                	jb     30003111 <__x86.get_pc_thunk.cx+0xc49>
300030b2:	56                   	push   esi
300030b3:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
300030b8:	00 70 75             	add    BYTE PTR [eax+0x75],dh
300030bb:	74 63                	je     30003120 <__x86.get_pc_thunk.cx+0xc58>
300030bd:	00 67 65             	add    BYTE PTR [edi+0x65],ah
300030c0:	74 63                	je     30003125 <__x86.get_pc_thunk.cx+0xc5d>
300030c2:	00 67 65             	add    BYTE PTR [edi+0x65],ah
300030c5:	74 73                	je     3000313a <__x86.get_pc_thunk.cx+0xc72>
300030c7:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
300030cb:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
300030ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
300030cf:	69 74 00 70 72 69 6e 	imul   esi,DWORD PTR [eax+eax*1+0x70],0x746e6972
300030d6:	74 
300030d7:	00 73 6c             	add    BYTE PTR [ebx+0x6c],dh
300030da:	65                   	gs
300030db:	65                   	gs
300030dc:	70 00                	jo     300030de <__x86.get_pc_thunk.cx+0xc16>
300030de:	6d                   	ins    DWORD PTR es:[edi],dx
300030df:	6f                   	outs   dx,DWORD PTR ds:[esi]
300030e0:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
300030e7:	6e 
300030e8:	61                   	popa   
300030e9:	6c                   	ins    BYTE PTR es:[edi],dx
300030ea:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
300030ed:	65 63 00             	arpl   WORD PTR gs:[eax],ax
300030f0:	77 61                	ja     30003153 <__x86.get_pc_thunk.cx+0xc8b>
300030f2:	69 74 70 69 64 00 67 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x65670064
300030f9:	65 
300030fa:	74 74                	je     30003170 <__x86.get_pc_thunk.cx+0xca8>
300030fc:	69 6d 65 00 67 6d 74 	imul   ebp,DWORD PTR [ebp+0x65],0x746d6700
30003103:	69 6d 65 5f 72 00 67 	imul   ebp,DWORD PTR [ebp+0x65],0x6700725f
3000310a:	65                   	gs
3000310b:	74 63                	je     30003170 <__x86.get_pc_thunk.cx+0xca8>
3000310d:	77 64                	ja     30003173 <__x86.get_pc_thunk.cx+0xcab>
3000310f:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
30003112:	6c                   	ins    BYTE PTR es:[edi],dx
30003113:	6c                   	ins    BYTE PTR es:[edi],dx
30003114:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003115:	63 00                	arpl   WORD PTR [eax],ax
30003117:	66                   	data16
30003118:	72 65                	jb     3000317f <__x86.get_pc_thunk.cx+0xcb7>
3000311a:	65 00 6d 65          	add    BYTE PTR gs:[ebp+0x65],ch
3000311e:	6d                   	ins    DWORD PTR es:[edi],dx
3000311f:	63 70 79             	arpl   WORD PTR [eax+0x79],si
30003122:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
30003125:	6d                   	ins    DWORD PTR es:[edi],dx
30003126:	73 65                	jae    3000318d <__x86.get_pc_thunk.cx+0xcc5>
30003128:	74 00                	je     3000312a <__x86.get_pc_thunk.cx+0xc62>
3000312a:	6d                   	ins    DWORD PTR es:[edi],dx
3000312b:	6d                   	ins    DWORD PTR es:[edi],dx
3000312c:	61                   	popa   
3000312d:	70 00                	jo     3000312f <__x86.get_pc_thunk.cx+0xc67>
3000312f:	6d                   	ins    DWORD PTR es:[edi],dx
30003130:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003131:	76 65                	jbe    30003198 <__x86.get_pc_thunk.cx+0xcd0>
30003133:	54                   	push   esp
30003134:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003135:	00 72 65             	add    BYTE PTR [edx+0x65],dh
30003138:	73 65                	jae    3000319f <__x86.get_pc_thunk.cx+0xcd7>
3000313a:	74 52                	je     3000318e <__x86.get_pc_thunk.cx+0xcc6>
3000313c:	6f                   	outs   dx,DWORD PTR ds:[esi]
3000313d:	77 00                	ja     3000313f <__x86.get_pc_thunk.cx+0xc77>
3000313f:	73 74                	jae    300031b5 <__x86.get_pc_thunk.cx+0xced>
30003141:	72 63                	jb     300031a6 <__x86.get_pc_thunk.cx+0xcde>
30003143:	61                   	popa   
30003144:	74 00                	je     30003146 <__x86.get_pc_thunk.cx+0xc7e>
30003146:	73 74                	jae    300031bc <__x86.get_pc_thunk.cx+0xcf4>
30003148:	72 6c                	jb     300031b6 <__x86.get_pc_thunk.cx+0xcee>
3000314a:	65 6e                	outs   dx,BYTE PTR gs:[esi]
3000314c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
3000314f:	72 63                	jb     300031b4 <__x86.get_pc_thunk.cx+0xcec>
30003151:	70 79                	jo     300031cc <__x86.get_pc_thunk.cx+0xd04>
30003153:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30003156:	72 63                	jb     300031bb <__x86.get_pc_thunk.cx+0xcf3>
30003158:	6d                   	ins    DWORD PTR es:[edi],dx
30003159:	70 00                	jo     3000315b <__x86.get_pc_thunk.cx+0xc93>
3000315b:	73 74                	jae    300031d1 <__x86.get_pc_thunk.cx+0xd09>
3000315d:	72 63                	jb     300031c2 <__x86.get_pc_thunk.cx+0xcfa>
3000315f:	70 79                	jo     300031da <__x86.get_pc_thunk.cx+0xd12>
30003161:	63 00                	arpl   WORD PTR [eax],ax
30003163:	73 74                	jae    300031d9 <__x86.get_pc_thunk.cx+0xd11>
30003165:	72 6e                	jb     300031d5 <__x86.get_pc_thunk.cx+0xd0d>
30003167:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
3000316a:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
3000316d:	72 6e                	jb     300031dd <__x86.get_pc_thunk.cx+0xd15>
3000316f:	63 70 79             	arpl   WORD PTR [eax+0x79],si
30003172:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30003175:	72 74                	jb     300031eb <__x86.get_pc_thunk.cx+0xd23>
30003177:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003178:	75 6c                	jne    300031e6 <__x86.get_pc_thunk.cx+0xd1e>
3000317a:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
3000317d:	72 6c                	jb     300031eb <__x86.get_pc_thunk.cx+0xd23>
3000317f:	65                   	gs
30003180:	66                   	data16
30003181:	74 00                	je     30003183 <__x86.get_pc_thunk.cx+0xcbb>
30003183:	73 74                	jae    300031f9 <__x86.get_pc_thunk.cx+0xd31>
30003185:	72 74                	jb     300031fb <__x86.get_pc_thunk.cx+0xd33>
30003187:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003188:	6c                   	ins    BYTE PTR es:[edi],dx
30003189:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
3000318c:	72 74                	jb     30003202 <__x86.get_pc_thunk.cx+0xd3a>
3000318e:	72 69                	jb     300031f9 <__x86.get_pc_thunk.cx+0xd31>
30003190:	6d                   	ins    DWORD PTR es:[edi],dx
30003191:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30003194:	72 73                	jb     30003209 <__x86.get_pc_thunk.cx+0xd41>
30003196:	74 72                	je     3000320a <__x86.get_pc_thunk.cx+0xd42>
30003198:	00 6c 6f 63          	add    BYTE PTR [edi+ebp*2+0x63],ch
3000319c:	61                   	popa   
3000319d:	6c                   	ins    BYTE PTR es:[edi],dx
3000319e:	74 69                	je     30003209 <__x86.get_pc_thunk.cx+0xd41>
300031a0:	6d                   	ins    DWORD PTR es:[edi],dx
300031a1:	65 00 6c 6f 63       	add    BYTE PTR gs:[edi+ebp*2+0x63],ch
300031a6:	61                   	popa   
300031a7:	6c                   	ins    BYTE PTR es:[edi],dx
300031a8:	74 69                	je     30003213 <__x86.get_pc_thunk.cx+0xd4b>
300031aa:	6d                   	ins    DWORD PTR es:[edi],dx
300031ab:	65                   	gs
300031ac:	5f                   	pop    edi
300031ad:	72 00                	jb     300031af <__x86.get_pc_thunk.cx+0xce7>
300031af:	6d                   	ins    DWORD PTR es:[edi],dx
300031b0:	6b 74 69 6d 65       	imul   esi,DWORD PTR [ecx+ebp*2+0x6d],0x65
	...

Disassembly of section .hash:

300031b8 <.hash>:
300031b8:	25 00 00 00 2a       	and    eax,0x2a000000
300031bd:	00 00                	add    BYTE PTR [eax],al
300031bf:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
300031c2:	00 00                	add    BYTE PTR [eax],al
300031c4:	1d 00 00 00 1c       	sbb    eax,0x1c000000
300031c9:	00 00                	add    BYTE PTR [eax],al
300031cb:	00 1e                	add    BYTE PTR [esi],bl
300031cd:	00 00                	add    BYTE PTR [eax],al
300031cf:	00 18                	add    BYTE PTR [eax],bl
	...
300031e5:	00 00                	add    BYTE PTR [eax],al
300031e7:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
	...
300031f5:	00 00                	add    BYTE PTR [eax],al
300031f7:	00 16                	add    BYTE PTR [esi],dl
300031f9:	00 00                	add    BYTE PTR [eax],al
300031fb:	00 0e                	add    BYTE PTR [esi],cl
300031fd:	00 00                	add    BYTE PTR [eax],al
300031ff:	00 00                	add    BYTE PTR [eax],al
30003201:	00 00                	add    BYTE PTR [eax],al
30003203:	00 20                	add    BYTE PTR [eax],ah
30003205:	00 00                	add    BYTE PTR [eax],al
30003207:	00 1f                	add    BYTE PTR [edi],bl
30003209:	00 00                	add    BYTE PTR [eax],al
3000320b:	00 00                	add    BYTE PTR [eax],al
3000320d:	00 00                	add    BYTE PTR [eax],al
3000320f:	00 03                	add    BYTE PTR [ebx],al
30003211:	00 00                	add    BYTE PTR [eax],al
30003213:	00 22                	add    BYTE PTR [edx],ah
30003215:	00 00                	add    BYTE PTR [eax],al
30003217:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
3000321a:	00 00                	add    BYTE PTR [eax],al
3000321c:	09 00                	or     DWORD PTR [eax],eax
3000321e:	00 00                	add    BYTE PTR [eax],al
30003220:	28 00                	sub    BYTE PTR [eax],al
	...
3000322a:	00 00                	add    BYTE PTR [eax],al
3000322c:	0c 00                	or     al,0x0
3000322e:	00 00                	add    BYTE PTR [eax],al
30003230:	0f 00 00             	sldt   WORD PTR [eax]
30003233:	00 26                	add    BYTE PTR [esi],ah
30003235:	00 00                	add    BYTE PTR [eax],al
30003237:	00 13                	add    BYTE PTR [ebx],dl
30003239:	00 00                	add    BYTE PTR [eax],al
3000323b:	00 29                	add    BYTE PTR [ecx],ch
3000323d:	00 00                	add    BYTE PTR [eax],al
3000323f:	00 1b                	add    BYTE PTR [ebx],bl
30003241:	00 00                	add    BYTE PTR [eax],al
30003243:	00 00                	add    BYTE PTR [eax],al
30003245:	00 00                	add    BYTE PTR [eax],al
30003247:	00 27                	add    BYTE PTR [edi],ah
30003249:	00 00                	add    BYTE PTR [eax],al
3000324b:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
	...
30003261:	00 00                	add    BYTE PTR [eax],al
30003263:	00 02                	add    BYTE PTR [edx],al
30003265:	00 00                	add    BYTE PTR [eax],al
30003267:	00 04 00             	add    BYTE PTR [eax+eax*1],al
	...
3000327e:	00 00                	add    BYTE PTR [eax],al
30003280:	05 00 00 00 00       	add    eax,0x0
30003285:	00 00                	add    BYTE PTR [eax],al
30003287:	00 0b                	add    BYTE PTR [ebx],cl
	...
300032a5:	00 00                	add    BYTE PTR [eax],al
300032a7:	00 10                	add    BYTE PTR [eax],dl
300032a9:	00 00                	add    BYTE PTR [eax],al
300032ab:	00 0a                	add    BYTE PTR [edx],cl
300032ad:	00 00                	add    BYTE PTR [eax],al
300032af:	00 12                	add    BYTE PTR [edx],dl
300032b1:	00 00                	add    BYTE PTR [eax],al
300032b3:	00 17                	add    BYTE PTR [edi],dl
300032b5:	00 00                	add    BYTE PTR [eax],al
300032b7:	00 00                	add    BYTE PTR [eax],al
300032b9:	00 00                	add    BYTE PTR [eax],al
300032bb:	00 11                	add    BYTE PTR [ecx],dl
300032bd:	00 00                	add    BYTE PTR [eax],al
300032bf:	00 19                	add    BYTE PTR [ecx],bl
300032c1:	00 00                	add    BYTE PTR [eax],al
300032c3:	00 07                	add    BYTE PTR [edi],al
300032c5:	00 00                	add    BYTE PTR [eax],al
300032c7:	00 06                	add    BYTE PTR [esi],al
300032c9:	00 00                	add    BYTE PTR [eax],al
300032cb:	00 00                	add    BYTE PTR [eax],al
300032cd:	00 00                	add    BYTE PTR [eax],al
300032cf:	00 08                	add    BYTE PTR [eax],cl
300032d1:	00 00                	add    BYTE PTR [eax],al
300032d3:	00 0d 00 00 00 00    	add    BYTE PTR ds:0x0,cl
300032d9:	00 00                	add    BYTE PTR [eax],al
300032db:	00 01                	add    BYTE PTR [ecx],al
300032dd:	00 00                	add    BYTE PTR [eax],al
300032df:	00 00                	add    BYTE PTR [eax],al
300032e1:	00 00                	add    BYTE PTR [eax],al
300032e3:	00 1a                	add    BYTE PTR [edx],bl
	...
300032ed:	00 00                	add    BYTE PTR [eax],al
300032ef:	00 23                	add    BYTE PTR [ebx],ah
300032f1:	00 00                	add    BYTE PTR [eax],al
300032f3:	00 00                	add    BYTE PTR [eax],al
300032f5:	00 00                	add    BYTE PTR [eax],al
300032f7:	00 21                	add    BYTE PTR [ecx],ah
300032f9:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

300032fc <.eh_frame>:
300032fc:	14 00                	adc    al,0x0
300032fe:	00 00                	add    BYTE PTR [eax],al
30003300:	00 00                	add    BYTE PTR [eax],al
30003302:	00 00                	add    BYTE PTR [eax],al
30003304:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
30003307:	00 01                	add    BYTE PTR [ecx],al
30003309:	7c 08                	jl     30003313 <__x86.get_pc_thunk.cx+0xe4b>
3000330b:	01 1b                	add    DWORD PTR [ebx],ebx
3000330d:	0c 04                	or     al,0x4
3000330f:	04 88                	add    al,0x88
30003311:	01 00                	add    DWORD PTR [eax],eax
30003313:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
30003316:	00 00                	add    BYTE PTR [eax],al
30003318:	1c 00                	sbb    al,0x0
3000331a:	00 00                	add    BYTE PTR [eax],al
3000331c:	54                   	push   esp
3000331d:	f1                   	icebp  
3000331e:	ff                   	(bad)  
3000331f:	ff 50 00             	call   DWORD PTR [eax+0x0]
30003322:	00 00                	add    BYTE PTR [eax],al
30003324:	00 0e                	add    BYTE PTR [esi],cl
30003326:	08 46 0e             	or     BYTE PTR [esi+0xe],al
30003329:	0c 4a                	or     al,0x4a
3000332b:	0f 0b                	ud2    
3000332d:	74 04                	je     30003333 <__x86.get_pc_thunk.cx+0xe6b>
3000332f:	78 00                	js     30003331 <__x86.get_pc_thunk.cx+0xe69>
30003331:	3f                   	aas    
30003332:	1a 3b                	sbb    bh,BYTE PTR [ebx]
30003334:	2a 32                	sub    dh,BYTE PTR [edx]
30003336:	24 22                	and    al,0x22
30003338:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

3000333c <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
3000333c:	01 1b                	add    DWORD PTR [ebx],ebx
3000333e:	03 3b                	add    edi,DWORD PTR [ebx]
30003340:	8c f1                	mov    ecx,?
30003342:	ff                   	(bad)  
30003343:	ff 43 00             	inc    DWORD PTR [ebx+0x0]
30003346:	00 00                	add    BYTE PTR [eax],al
30003348:	c4                   	(bad)  
30003349:	cc                   	int3   
3000334a:	ff                   	(bad)  
3000334b:	ff a8 f1 ff ff fc    	jmp    FWORD PTR [eax-0x300000f]
30003351:	cc                   	int3   
30003352:	ff                   	(bad)  
30003353:	ff c8                	dec    eax
30003355:	f1                   	icebp  
30003356:	ff                   	(bad)  
30003357:	ff 34 cd ff ff fc f1 	push   DWORD PTR [ecx*8-0xe030001]
3000335e:	ff                   	(bad)  
3000335f:	ff 89 cd ff ff 24    	dec    DWORD PTR [ecx+0x24ffffcd]
30003365:	f2 ff                	repnz (bad) 
30003367:	ff e0                	jmp    eax
30003369:	cd ff                	int    0xff
3000336b:	ff 4c f2 ff          	dec    DWORD PTR [edx+esi*8-0x1]
3000336f:	ff                   	(bad)  
30003370:	78 ce                	js     30003340 <__GNU_EH_FRAME_HDR+0x4>
30003372:	ff                   	(bad)  
30003373:	ff 88 f2 ff ff ef    	dec    DWORD PTR [eax-0x1000000e]
30003379:	ce                   	into   
3000337a:	ff                   	(bad)  
3000337b:	ff ac f2 ff ff aa cf 	jmp    FWORD PTR [edx+esi*8-0x30550001]
30003382:	ff                   	(bad)  
30003383:	ff d0                	call   eax
30003385:	f2 ff                	repnz (bad) 
30003387:	ff 08                	dec    DWORD PTR [eax]
30003389:	d0 ff                	sar    bh,1
3000338b:	ff f0                	push   eax
3000338d:	f2 ff                	repnz (bad) 
3000338f:	ff 2e                	jmp    FWORD PTR [esi]
30003391:	d0 ff                	sar    bh,1
30003393:	ff 14 f3             	call   DWORD PTR [ebx+esi*8]
30003396:	ff                   	(bad)  
30003397:	ff 71 d0             	push   DWORD PTR [ecx-0x30]
3000339a:	ff                   	(bad)  
3000339b:	ff                   	(bad)  
3000339c:	38 f3                	cmp    bl,dh
3000339e:	ff                   	(bad)  
3000339f:	ff a0 d0 ff ff 5c    	jmp    DWORD PTR [eax+0x5cffffd0]
300033a5:	f3 ff                	repz (bad) 
300033a7:	ff 5c d1 ff          	call   FWORD PTR [ecx+edx*8-0x1]
300033ab:	ff 80 f3 ff ff 91    	inc    DWORD PTR [eax-0x6e00000d]
300033b1:	d1 ff                	sar    edi,1
300033b3:	ff a4 f3 ff ff c5 d1 	jmp    DWORD PTR [ebx+esi*8-0x2e3a0001]
300033ba:	ff                   	(bad)  
300033bb:	ff c8                	dec    eax
300033bd:	f3 ff                	repz (bad) 
300033bf:	ff f6                	push   esi
300033c1:	d1 ff                	sar    edi,1
300033c3:	ff ec                	jmp    <internal disassembler error>
300033c5:	f3 ff                	repz (bad) 
300033c7:	ff 1d d2 ff ff 0c    	call   FWORD PTR ds:0xcffffd2
300033cd:	f4                   	hlt    
300033ce:	ff                   	(bad)  
300033cf:	ff c1                	inc    ecx
300033d1:	d2 ff                	sar    bh,cl
300033d3:	ff 30                	push   DWORD PTR [eax]
300033d5:	f4                   	hlt    
300033d6:	ff                   	(bad)  
300033d7:	ff e0                	jmp    eax
300033d9:	d2 ff                	sar    bh,cl
300033db:	ff 54 f4 ff          	call   DWORD PTR [esp+esi*8-0x1]
300033df:	ff 14 d3             	call   DWORD PTR [ebx+edx*8]
300033e2:	ff                   	(bad)  
300033e3:	ff 74 f4 ff          	push   DWORD PTR [esp+esi*8-0x1]
300033e7:	ff 48 d3             	dec    DWORD PTR [eax-0x2d]
300033ea:	ff                   	(bad)  
300033eb:	ff 94 f4 ff ff 7f d3 	call   DWORD PTR [esp+esi*8-0x2c800001]
300033f2:	ff                   	(bad)  
300033f3:	ff                   	(bad)  
300033f4:	b8 f4 ff ff cd       	mov    eax,0xcdfffff4
300033f9:	d3 ff                	sar    edi,cl
300033fb:	ff dc                	call   <internal disassembler error>
300033fd:	f4                   	hlt    
300033fe:	ff                   	(bad)  
300033ff:	ff ea                	jmp    <internal disassembler error>
30003401:	d3 ff                	sar    edi,cl
30003403:	ff                   	(bad)  
30003404:	fc                   	cld    
30003405:	f4                   	hlt    
30003406:	ff                   	(bad)  
30003407:	ff 13                	call   DWORD PTR [ebx]
30003409:	d4 ff                	aam    0xff
3000340b:	ff 1c f5 ff ff 49 d4 	call   FWORD PTR [esi*8-0x2bb60001]
30003412:	ff                   	(bad)  
30003413:	ff 40 f5             	inc    DWORD PTR [eax-0xb]
30003416:	ff                   	(bad)  
30003417:	ff 66 d4             	jmp    DWORD PTR [esi-0x2c]
3000341a:	ff                   	(bad)  
3000341b:	ff 60 f5             	jmp    DWORD PTR [eax-0xb]
3000341e:	ff                   	(bad)  
3000341f:	ff a8 d4 ff ff 84    	jmp    FWORD PTR [eax-0x7b00002c]
30003425:	f5                   	cmc    
30003426:	ff                   	(bad)  
30003427:	ff c8                	dec    eax
30003429:	d4 ff                	aam    0xff
3000342b:	ff a4 f5 ff ff 24 d5 	jmp    DWORD PTR [ebp+esi*8-0x2adb0001]
30003432:	ff                   	(bad)  
30003433:	ff c8                	dec    eax
30003435:	f5                   	cmc    
30003436:	ff                   	(bad)  
30003437:	ff ab d5 ff ff e8    	jmp    FWORD PTR [ebx-0x1700002b]
3000343d:	f5                   	cmc    
3000343e:	ff                   	(bad)  
3000343f:	ff 8e d7 ff ff 14    	dec    DWORD PTR [esi+0x14ffffd7]
30003445:	f6 ff                	idiv   bh
30003447:	ff c7                	inc    edi
30003449:	d7                   	xlat   BYTE PTR ds:[ebx]
3000344a:	ff                   	(bad)  
3000344b:	ff 34 f6             	push   DWORD PTR [esi+esi*8]
3000344e:	ff                   	(bad)  
3000344f:	ff f0                	push   eax
30003451:	d7                   	xlat   BYTE PTR ds:[ebx]
30003452:	ff                   	(bad)  
30003453:	ff 6c f6 ff          	jmp    FWORD PTR [esi+esi*8-0x1]
30003457:	ff 8c d9 ff ff 8c f6 	dec    DWORD PTR [ecx+ebx*8-0x9730001]
3000345e:	ff                   	(bad)  
3000345f:	ff 53 da             	call   DWORD PTR [ebx-0x26]
30003462:	ff                   	(bad)  
30003463:	ff ac f6 ff ff 1c db 	jmp    FWORD PTR [esi+esi*8-0x24e30001]
3000346a:	ff                   	(bad)  
3000346b:	ff cc                	dec    esp
3000346d:	f6 ff                	idiv   bh
3000346f:	ff 2c db             	jmp    FWORD PTR [ebx+ebx*8]
30003472:	ff                   	(bad)  
30003473:	ff ec                	jmp    <internal disassembler error>
30003475:	f6 ff                	idiv   bh
30003477:	ff 58 db             	call   FWORD PTR [eax-0x25]
3000347a:	ff                   	(bad)  
3000347b:	ff 10                	call   DWORD PTR [eax]
3000347d:	f7 ff                	idiv   edi
3000347f:	ff                   	(bad)  
30003480:	7e db                	jle    3000345d <__GNU_EH_FRAME_HDR+0x121>
30003482:	ff                   	(bad)  
30003483:	ff 34 f7             	push   DWORD PTR [edi+esi*8]
30003486:	ff                   	(bad)  
30003487:	ff b5 dc ff ff 58    	push   DWORD PTR [ebp+0x58ffffdc]
3000348d:	f7 ff                	idiv   edi
3000348f:	ff                   	(bad)  
30003490:	39 dd                	cmp    ebp,ebx
30003492:	ff                   	(bad)  
30003493:	ff                   	(bad)  
30003494:	7c f7                	jl     3000348d <__GNU_EH_FRAME_HDR+0x151>
30003496:	ff                   	(bad)  
30003497:	ff 8c dd ff ff 9c f7 	dec    DWORD PTR [ebp+ebx*8-0x8630001]
3000349e:	ff                   	(bad)  
3000349f:	ff ca                	dec    edx
300034a1:	dd ff                	(bad)  
300034a3:	ff c0                	inc    eax
300034a5:	f7 ff                	idiv   edi
300034a7:	ff 08                	dec    DWORD PTR [eax]
300034a9:	de ff                	fdivp  st(7),st
300034ab:	ff e4                	jmp    esp
300034ad:	f7 ff                	idiv   edi
300034af:	ff                   	(bad)  
300034b0:	78 de                	js     30003490 <__GNU_EH_FRAME_HDR+0x154>
300034b2:	ff                   	(bad)  
300034b3:	ff 04 f8             	inc    DWORD PTR [eax+edi*8]
300034b6:	ff                   	(bad)  
300034b7:	ff d8                	call   <internal disassembler error>
300034b9:	de ff                	fdivp  st(7),st
300034bb:	ff 2c f8             	jmp    FWORD PTR [eax+edi*8]
300034be:	ff                   	(bad)  
300034bf:	ff 18                	call   FWORD PTR [eax]
300034c1:	df ff                	(bad)  
300034c3:	ff 4c f8 ff          	dec    DWORD PTR [eax+edi*8-0x1]
300034c7:	ff 58 df             	call   FWORD PTR [eax-0x21]
300034ca:	ff                   	(bad)  
300034cb:	ff 6c f8 ff          	jmp    FWORD PTR [eax+edi*8-0x1]
300034cf:	ff a0 df ff ff 8c    	jmp    DWORD PTR [eax-0x73000021]
300034d5:	f8                   	clc    
300034d6:	ff                   	(bad)  
300034d7:	ff d1                	call   ecx
300034d9:	df ff                	(bad)  
300034db:	ff ac f8 ff ff 04 e0 	jmp    FWORD PTR [eax+edi*8-0x1ffb0001]
300034e2:	ff                   	(bad)  
300034e3:	ff cc                	dec    esp
300034e5:	f8                   	clc    
300034e6:	ff                   	(bad)  
300034e7:	ff 6c e0 ff          	jmp    FWORD PTR [eax+eiz*8-0x1]
300034eb:	ff ec                	jmp    <internal disassembler error>
300034ed:	f8                   	clc    
300034ee:	ff                   	(bad)  
300034ef:	ff cc                	dec    esp
300034f1:	e0 ff                	loopne 300034f2 <__GNU_EH_FRAME_HDR+0x1b6>
300034f3:	ff 0c f9             	dec    DWORD PTR [ecx+edi*8]
300034f6:	ff                   	(bad)  
300034f7:	ff 4c e2 ff          	dec    DWORD PTR [edx+eiz*8-0x1]
300034fb:	ff                   	(bad)  
300034fc:	3c f9                	cmp    al,0xf9
300034fe:	ff                   	(bad)  
300034ff:	ff 6c e2 ff          	jmp    FWORD PTR [edx+eiz*8-0x1]
30003503:	ff 5c f9 ff          	call   FWORD PTR [ecx+edi*8-0x1]
30003507:	ff 08                	dec    DWORD PTR [eax]
30003509:	e4 ff                	in     al,0xff
3000350b:	ff 8c f9 ff ff a0 e4 	dec    DWORD PTR [ecx+edi*8-0x1b5f0001]
30003512:	ff                   	(bad)  
30003513:	ff b0 f9 ff ff 10    	push   DWORD PTR [eax+0x10fffff9]
30003519:	e5 ff                	in     eax,0xff
3000351b:	ff d8                	call   <internal disassembler error>
3000351d:	f9                   	stc    
3000351e:	ff                   	(bad)  
3000351f:	ff                   	(bad)  
30003520:	39 e5                	cmp    ebp,esp
30003522:	ff                   	(bad)  
30003523:	ff                   	(bad)  
30003524:	f8                   	clc    
30003525:	f9                   	stc    
30003526:	ff                   	(bad)  
30003527:	ff 52 e8             	call   DWORD PTR [edx-0x18]
3000352a:	ff                   	(bad)  
3000352b:	ff 20                	jmp    DWORD PTR [eax]
3000352d:	fa                   	cli    
3000352e:	ff                   	(bad)  
3000352f:	ff 91 e8 ff ff 44    	call   DWORD PTR [ecx+0x44ffffe8]
30003535:	fa                   	cli    
30003536:	ff                   	(bad)  
30003537:	ff cf                	dec    edi
30003539:	e8 ff ff 68 fa       	call   2a69353d <sysEnter_Vector+0x2a56353d>
3000353e:	ff                   	(bad)  
3000353f:	ff 26                	jmp    DWORD PTR [esi]
30003541:	f1                   	icebp  
30003542:	ff                   	(bad)  
30003543:	ff e8                	jmp    <internal disassembler error>
30003545:	f1                   	icebp  
30003546:	ff                   	(bad)  
30003547:	ff 84 f1 ff ff 74 f2 	inc    DWORD PTR [ecx+esi*8-0xd8b0001]
3000354e:	ff                   	(bad)  
3000354f:	ff 88 f1 ff ff 58    	dec    DWORD PTR [eax+0x58fffff1]
30003555:	f6 ff                	idiv   bh
30003557:	ff 8c f1 ff ff 98 fa 	dec    DWORD PTR [ecx+esi*8-0x5670001]
3000355e:	ff                   	(bad)  
3000355f:	ff                   	.byte 0xff

Disassembly of section .rodata:

30003560 <_ytab-0x200>:
30003560:	53                   	push   ebx
30003561:	74 72                	je     300035d5 <__GNU_EH_FRAME_HDR+0x299>
30003563:	65                   	gs
30003564:	61                   	popa   
30003565:	6d                   	ins    DWORD PTR es:[edi],dx
30003566:	20 25 75 20 6e 6f    	and    BYTE PTR ds:0x6f6e2075,ah
3000356c:	74 20                	je     3000358e <__GNU_EH_FRAME_HDR+0x252>
3000356e:	69 6d 70 6c 65 6d 65 	imul   ebp,DWORD PTR [ebp+0x70],0x656d656c
30003575:	6e                   	outs   dx,BYTE PTR ds:[esi]
30003576:	74 65                	je     300035dd <__GNU_EH_FRAME_HDR+0x2a1>
30003578:	64 0a 00             	or     al,BYTE PTR fs:[eax]
3000357b:	00 2a                	add    BYTE PTR [edx],ch
3000357d:	2a 2a                	sub    ch,BYTE PTR [edx]
3000357f:	6c                   	ins    BYTE PTR es:[edi],dx
30003580:	69 62 63 5f 69 6e 69 	imul   esp,DWORD PTR [edx+0x63],0x696e695f
30003587:	74 20                	je     300035a9 <__GNU_EH_FRAME_HDR+0x26d>
30003589:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
3000358c:	6c                   	ins    BYTE PTR es:[edi],dx
3000358d:	65 64 0a 2a          	gs or  ch,BYTE PTR fs:gs:[edx]
30003591:	2a 2a                	sub    ch,BYTE PTR [edx]
30003593:	00 2a                	add    BYTE PTR [edx],ch
30003595:	2a 2a                	sub    ch,BYTE PTR [edx]
30003597:	6c                   	ins    BYTE PTR es:[edi],dx
30003598:	69 62 63 5f 69 6e 69 	imul   esp,DWORD PTR [edx+0x63],0x696e695f
3000359f:	74 20                	je     300035c1 <__GNU_EH_FRAME_HDR+0x285>
300035a1:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
300035a4:	70 6c                	jo     30003612 <__GNU_EH_FRAME_HDR+0x2d6>
300035a6:	65                   	gs
300035a7:	74 65                	je     3000360e <__GNU_EH_FRAME_HDR+0x2d2>
300035a9:	64 0a 00             	or     al,BYTE PTR fs:[eax]
300035ac:	6c                   	ins    BYTE PTR es:[edi],dx
300035ad:	69 62 63 5f 69 6e 69 	imul   esp,DWORD PTR [edx+0x63],0x696e695f
300035b4:	74 20                	je     300035d6 <__GNU_EH_FRAME_HDR+0x29a>
300035b6:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
300035b9:	6c                   	ins    BYTE PTR es:[edi],dx
300035ba:	65 64 20 70 72       	gs and BYTE PTR fs:gs:[eax+0x72],dh
300035bf:	65                   	gs
300035c0:	76 69                	jbe    3000362b <__GNU_EH_FRAME_HDR+0x2ef>
300035c2:	6f                   	outs   dx,DWORD PTR ds:[esi]
300035c3:	75 73                	jne    30003638 <__GNU_EH_FRAME_HDR+0x2fc>
300035c5:	6c                   	ins    BYTE PTR es:[edi],dx
300035c6:	79 2c                	jns    300035f4 <__GNU_EH_FRAME_HDR+0x2b8>
300035c8:	20 65 78             	and    BYTE PTR [ebp+0x78],ah
300035cb:	69 74 69 6e 67 0a 00 	imul   esi,DWORD PTR [ecx+ebp*2+0x6e],0xa67
300035d2:	00 
300035d3:	00 68 65             	add    BYTE PTR [eax+0x65],ch
300035d6:	61                   	popa   
300035d7:	70 42                	jo     3000361b <__GNU_EH_FRAME_HDR+0x2df>
300035d9:	61                   	popa   
300035da:	73 65                	jae    30003641 <__GNU_EH_FRAME_HDR+0x305>
300035dc:	20 3d 20 30 78 25    	and    BYTE PTR ds:0x25783020,bh
300035e2:	30 38                	xor    BYTE PTR [eax],bh
300035e4:	58                   	pop    eax
300035e5:	20 62 65             	and    BYTE PTR [edx+0x65],ah
300035e8:	66 6f                	outs   dx,WORD PTR ds:[esi]
300035ea:	72 65                	jb     30003651 <__GNU_EH_FRAME_HDR+0x315>
300035ec:	0a 00                	or     al,BYTE PTR [eax]
300035ee:	6d                   	ins    DWORD PTR es:[edi],dx
300035ef:	61                   	popa   
300035f0:	6c                   	ins    BYTE PTR es:[edi],dx
300035f1:	6c                   	ins    BYTE PTR es:[edi],dx
300035f2:	6f                   	outs   dx,DWORD PTR ds:[esi]
300035f3:	63 28                	arpl   WORD PTR [eax],bp
300035f5:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
300035f8:	30 38                	xor    BYTE PTR [eax],bh
300035fa:	58                   	pop    eax
300035fb:	29 0a                	sub    DWORD PTR [edx],ecx
300035fd:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30003601:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30003604:	61                   	popa   
30003605:	6c                   	ins    BYTE PTR es:[edi],dx
30003606:	6c                   	ins    BYTE PTR es:[edi],dx
30003607:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003608:	63 3a                	arpl   WORD PTR [edx],di
3000360a:	20 6e 65             	and    BYTE PTR [esi+0x65],ch
3000360d:	65                   	gs
3000360e:	64                   	fs
3000360f:	65                   	gs
30003610:	64                   	fs
30003611:	3d 30 78 25 30       	cmp    eax,0x30257830
30003616:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30003619:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
3000361d:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30003620:	61                   	popa   
30003621:	6c                   	ins    BYTE PTR es:[edi],dx
30003622:	6c                   	ins    BYTE PTR es:[edi],dx
30003623:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003624:	63 3a                	arpl   WORD PTR [edx],di
30003626:	20 68 65             	and    BYTE PTR [eax+0x65],ch
30003629:	61                   	popa   
3000362a:	45                   	inc    ebp
3000362b:	6e                   	outs   dx,BYTE PTR ds:[esi]
3000362c:	64                   	fs
3000362d:	3d 30 78 25 30       	cmp    eax,0x30257830
30003632:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30003635:	00 00                	add    BYTE PTR [eax],al
30003637:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
3000363b:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
3000363e:	61                   	popa   
3000363f:	6c                   	ins    BYTE PTR es:[edi],dx
30003640:	6c                   	ins    BYTE PTR es:[edi],dx
30003641:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003642:	63 3a                	arpl   WORD PTR [edx],di
30003644:	20 52 65             	and    BYTE PTR [edx+0x65],dl
30003647:	71 20                	jno    30003669 <__GNU_EH_FRAME_HDR+0x32d>
30003649:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
3000364c:	30 38                	xor    BYTE PTR [eax],bh
3000364e:	58                   	pop    eax
3000364f:	20 62 79             	and    BYTE PTR [edx+0x79],ah
30003652:	74 65                	je     300036b9 <__GNU_EH_FRAME_HDR+0x37d>
30003654:	73 2c                	jae    30003682 <__GNU_EH_FRAME_HDR+0x346>
30003656:	20 72 65             	and    BYTE PTR [edx+0x65],dh
30003659:	74 20                	je     3000367b <__GNU_EH_FRAME_HDR+0x33f>
3000365b:	77 61                	ja     300036be <__GNU_EH_FRAME_HDR+0x382>
3000365d:	73 20                	jae    3000367f <__GNU_EH_FRAME_HDR+0x343>
3000365f:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30003662:	30 38                	xor    BYTE PTR [eax],bh
30003664:	58                   	pop    eax
30003665:	2c 20                	sub    al,0x20
30003667:	68 65 61 70 45       	push   0x45706165
3000366c:	6e                   	outs   dx,BYTE PTR ds:[esi]
3000366d:	64                   	fs
3000366e:	3d 30 78 25 30       	cmp    eax,0x30257830
30003673:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30003676:	00 00                	add    BYTE PTR [eax],al
30003678:	6c                   	ins    BYTE PTR es:[edi],dx
30003679:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
30003680:	6c                   	ins    BYTE PTR es:[edi],dx
30003681:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003682:	63 3a                	arpl   WORD PTR [edx],di
30003684:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
30003687:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x657a696c
3000368e:	65 
3000368f:	64 20 68 65          	and    BYTE PTR fs:[eax+0x65],ch
30003693:	61                   	popa   
30003694:	70 43                	jo     300036d9 <__GNU_EH_FRAME_HDR+0x39d>
30003696:	75 72                	jne    3000370a <__GNU_EH_FRAME_HDR+0x3ce>
30003698:	72 20                	jb     300036ba <__GNU_EH_FRAME_HDR+0x37e>
3000369a:	61                   	popa   
3000369b:	6e                   	outs   dx,BYTE PTR ds:[esi]
3000369c:	64 20 68 65          	and    BYTE PTR fs:[eax+0x65],ch
300036a0:	61                   	popa   
300036a1:	70 42                	jo     300036e5 <__GNU_EH_FRAME_HDR+0x3a9>
300036a3:	61                   	popa   
300036a4:	73 65                	jae    3000370b <__GNU_EH_FRAME_HDR+0x3cf>
300036a6:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
300036aa:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
300036ad:	30 38                	xor    BYTE PTR [eax],bh
300036af:	58                   	pop    eax
300036b0:	0a 00                	or     al,BYTE PTR [eax]
300036b2:	00 00                	add    BYTE PTR [eax],al
300036b4:	6c                   	ins    BYTE PTR es:[edi],dx
300036b5:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
300036bc:	6c                   	ins    BYTE PTR es:[edi],dx
300036bd:	6f                   	outs   dx,DWORD PTR ds:[esi]
300036be:	63 3a                	arpl   WORD PTR [edx],di
300036c0:	63 72 65             	arpl   WORD PTR [edx+0x65],si
300036c3:	61                   	popa   
300036c4:	74 69                	je     3000372f <__GNU_EH_FRAME_HDR+0x3f3>
300036c6:	6e                   	outs   dx,BYTE PTR ds:[esi]
300036c7:	67 20 68 65          	and    BYTE PTR [bx+si+0x65],ch
300036cb:	61                   	popa   
300036cc:	70 20                	jo     300036ee <__GNU_EH_FRAME_HDR+0x3b2>
300036ce:	72 65                	jb     30003735 <__GNU_EH_FRAME_HDR+0x3f9>
300036d0:	63 20                	arpl   WORD PTR [eax],sp
300036d2:	40                   	inc    eax
300036d3:	20 30                	and    BYTE PTR [eax],dh
300036d5:	78 25                	js     300036fc <__GNU_EH_FRAME_HDR+0x3c0>
300036d7:	30 38                	xor    BYTE PTR [eax],bh
300036d9:	58                   	pop    eax
300036da:	0a 00                	or     al,BYTE PTR [eax]
300036dc:	6c                   	ins    BYTE PTR es:[edi],dx
300036dd:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
300036e4:	6c                   	ins    BYTE PTR es:[edi],dx
300036e5:	6f                   	outs   dx,DWORD PTR ds:[esi]
300036e6:	63 3a                	arpl   WORD PTR [edx],di
300036e8:	20 68 65             	and    BYTE PTR [eax+0x65],ch
300036eb:	61                   	popa   
300036ec:	70 43                	jo     30003731 <__GNU_EH_FRAME_HDR+0x3f5>
300036ee:	75 72                	jne    30003762 <_ytab+0x2>
300036f0:	72 3d                	jb     3000372f <__GNU_EH_FRAME_HDR+0x3f3>
300036f2:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
300036f5:	30 38                	xor    BYTE PTR [eax],bh
300036f7:	58                   	pop    eax
300036f8:	2c 20                	sub    al,0x20
300036fa:	73 69                	jae    30003765 <_ytab+0x5>
300036fc:	7a 65                	jp     30003763 <_ytab+0x3>
300036fe:	6f                   	outs   dx,DWORD PTR ds:[esi]
300036ff:	66                   	data16
30003700:	28 68 65             	sub    BYTE PTR [eax+0x65],ch
30003703:	61                   	popa   
30003704:	70 72                	jo     30003778 <_ytab+0x18>
30003706:	65 63 5f 74          	arpl   WORD PTR gs:[edi+0x74],bx
3000370a:	29 3d 30 78 25 30    	sub    DWORD PTR ds:0x30257830,edi
30003710:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30003713:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
30003716:	6c                   	ins    BYTE PTR es:[edi],dx
30003717:	6c                   	ins    BYTE PTR es:[edi],dx
30003718:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003719:	63 3a                	arpl   WORD PTR [edx],di
3000371b:	20 72 65             	and    BYTE PTR [edx+0x65],dh
3000371e:	74 75                	je     30003795 <_ytab+0x35>
30003720:	72 6e                	jb     30003790 <_ytab+0x30>
30003722:	69 6e 67 20 30 78 25 	imul   ebp,DWORD PTR [esi+0x67],0x25783020
30003729:	30 38                	xor    BYTE PTR [eax],bh
3000372b:	58                   	pop    eax
3000372c:	0a 00                	or     al,BYTE PTR [eax]
	...
3000373e:	00 00                	add    BYTE PTR [eax],al
30003740:	47                   	inc    edi
30003741:	4d                   	dec    ebp
30003742:	54                   	push   esp
	...

30003760 <_ytab>:
30003760:	1f                   	pop    ds
30003761:	00 00                	add    BYTE PTR [eax],al
30003763:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30003766:	00 00                	add    BYTE PTR [eax],al
30003768:	1f                   	pop    ds
30003769:	00 00                	add    BYTE PTR [eax],al
3000376b:	00 1e                	add    BYTE PTR [esi],bl
3000376d:	00 00                	add    BYTE PTR [eax],al
3000376f:	00 1f                	add    BYTE PTR [edi],bl
30003771:	00 00                	add    BYTE PTR [eax],al
30003773:	00 1e                	add    BYTE PTR [esi],bl
30003775:	00 00                	add    BYTE PTR [eax],al
30003777:	00 1f                	add    BYTE PTR [edi],bl
30003779:	00 00                	add    BYTE PTR [eax],al
3000377b:	00 1f                	add    BYTE PTR [edi],bl
3000377d:	00 00                	add    BYTE PTR [eax],al
3000377f:	00 1e                	add    BYTE PTR [esi],bl
30003781:	00 00                	add    BYTE PTR [eax],al
30003783:	00 1f                	add    BYTE PTR [edi],bl
30003785:	00 00                	add    BYTE PTR [eax],al
30003787:	00 1e                	add    BYTE PTR [esi],bl
30003789:	00 00                	add    BYTE PTR [eax],al
3000378b:	00 1f                	add    BYTE PTR [edi],bl
3000378d:	00 00                	add    BYTE PTR [eax],al
3000378f:	00 1f                	add    BYTE PTR [edi],bl
30003791:	00 00                	add    BYTE PTR [eax],al
30003793:	00 1d 00 00 00 1f    	add    BYTE PTR ds:0x1f000000,bl
30003799:	00 00                	add    BYTE PTR [eax],al
3000379b:	00 1e                	add    BYTE PTR [esi],bl
3000379d:	00 00                	add    BYTE PTR [eax],al
3000379f:	00 1f                	add    BYTE PTR [edi],bl
300037a1:	00 00                	add    BYTE PTR [eax],al
300037a3:	00 1e                	add    BYTE PTR [esi],bl
300037a5:	00 00                	add    BYTE PTR [eax],al
300037a7:	00 1f                	add    BYTE PTR [edi],bl
300037a9:	00 00                	add    BYTE PTR [eax],al
300037ab:	00 1f                	add    BYTE PTR [edi],bl
300037ad:	00 00                	add    BYTE PTR [eax],al
300037af:	00 1e                	add    BYTE PTR [esi],bl
300037b1:	00 00                	add    BYTE PTR [eax],al
300037b3:	00 1f                	add    BYTE PTR [edi],bl
300037b5:	00 00                	add    BYTE PTR [eax],al
300037b7:	00 1e                	add    BYTE PTR [esi],bl
300037b9:	00 00                	add    BYTE PTR [eax],al
300037bb:	00 1f                	add    BYTE PTR [edi],bl
300037bd:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .rel.dyn:

300037c0 <.rel.dyn>:
300037c0:	24 3a                	and    al,0x3a
300037c2:	00 30                	add    BYTE PTR [eax],dh
300037c4:	08 00                	or     BYTE PTR [eax],al
300037c6:	00 00                	add    BYTE PTR [eax],al
300037c8:	28 3a                	sub    BYTE PTR [edx],bh
300037ca:	00 30                	add    BYTE PTR [eax],dh
300037cc:	08 00                	or     BYTE PTR [eax],al
300037ce:	00 00                	add    BYTE PTR [eax],al
300037d0:	2c 3a                	sub    al,0x3a
300037d2:	00 30                	add    BYTE PTR [eax],dh
300037d4:	08 00                	or     BYTE PTR [eax],al
300037d6:	00 00                	add    BYTE PTR [eax],al
300037d8:	30 3a                	xor    BYTE PTR [edx],bh
300037da:	00 30                	add    BYTE PTR [eax],dh
300037dc:	08 00                	or     BYTE PTR [eax],al
300037de:	00 00                	add    BYTE PTR [eax],al
300037e0:	34 3a                	xor    al,0x3a
300037e2:	00 30                	add    BYTE PTR [eax],dh
300037e4:	08 00                	or     BYTE PTR [eax],al
300037e6:	00 00                	add    BYTE PTR [eax],al
300037e8:	38 3a                	cmp    BYTE PTR [edx],bh
300037ea:	00 30                	add    BYTE PTR [eax],dh
300037ec:	08 00                	or     BYTE PTR [eax],al
300037ee:	00 00                	add    BYTE PTR [eax],al
300037f0:	5c                   	pop    esp
300037f1:	3a 00                	cmp    al,BYTE PTR [eax]
300037f3:	30 08                	xor    BYTE PTR [eax],cl
300037f5:	00 00                	add    BYTE PTR [eax],al
300037f7:	00 60 3a             	add    BYTE PTR [eax+0x3a],ah
300037fa:	00 30                	add    BYTE PTR [eax],dh
300037fc:	08 00                	or     BYTE PTR [eax],al
300037fe:	00 00                	add    BYTE PTR [eax],al
30003800:	64 3a 00             	cmp    al,BYTE PTR fs:[eax]
30003803:	30 08                	xor    BYTE PTR [eax],cl
30003805:	00 00                	add    BYTE PTR [eax],al
30003807:	00 62 03             	add    BYTE PTR [edx+0x3],ah
3000380a:	00 30                	add    BYTE PTR [eax],dh
3000380c:	02 17                	add    dl,BYTE PTR [edi]
3000380e:	00 00                	add    BYTE PTR [eax],al
30003810:	a2 03 00 30 02       	mov    ds:0x2300003,al
30003815:	17                   	pop    ss
30003816:	00 00                	add    BYTE PTR [eax],al
30003818:	cb                   	retf   
30003819:	03 00                	add    eax,DWORD PTR [eax]
3000381b:	30 02                	xor    BYTE PTR [edx],al
3000381d:	17                   	pop    ss
3000381e:	00 00                	add    BYTE PTR [eax],al
30003820:	28 04 00             	sub    BYTE PTR [eax+eax*1],al
30003823:	30 02                	xor    BYTE PTR [edx],al
30003825:	17                   	pop    ss
30003826:	00 00                	add    BYTE PTR [eax],al
30003828:	8b 04 00             	mov    eax,DWORD PTR [eax+eax*1]
3000382b:	30 02                	xor    BYTE PTR [edx],al
3000382d:	17                   	pop    ss
3000382e:	00 00                	add    BYTE PTR [eax],al
30003830:	bd 04 00 30 02       	mov    ebp,0x2300004
30003835:	17                   	pop    ss
30003836:	00 00                	add    BYTE PTR [eax],al
30003838:	f1                   	icebp  
30003839:	04 00                	add    al,0x0
3000383b:	30 02                	xor    BYTE PTR [edx],al
3000383d:	17                   	pop    ss
3000383e:	00 00                	add    BYTE PTR [eax],al
30003840:	22 05 00 30 02 17    	and    al,BYTE PTR ds:0x17023000
30003846:	00 00                	add    BYTE PTR [eax],al
30003848:	4d                   	dec    ebp
30003849:	05 00 30 02 17       	add    eax,0x17023000
3000384e:	00 00                	add    BYTE PTR [eax],al
30003850:	ac                   	lods   al,BYTE PTR ds:[esi]
30003851:	06                   	push   es
30003852:	00 30                	add    BYTE PTR [eax],dh
30003854:	02 17                	add    dl,BYTE PTR [edi]
30003856:	00 00                	add    BYTE PTR [eax],al
30003858:	d2 06                	rol    BYTE PTR [esi],cl
3000385a:	00 30                	add    BYTE PTR [eax],dh
3000385c:	02 17                	add    dl,BYTE PTR [edi]
3000385e:	00 00                	add    BYTE PTR [eax],al
30003860:	fa                   	cli    
30003861:	06                   	push   es
30003862:	00 30                	add    BYTE PTR [eax],dh
30003864:	02 17                	add    dl,BYTE PTR [edi]
30003866:	00 00                	add    BYTE PTR [eax],al
30003868:	58                   	pop    eax
30003869:	09 00                	or     DWORD PTR [eax],eax
3000386b:	30 02                	xor    BYTE PTR [edx],al
3000386d:	17                   	pop    ss
3000386e:	00 00                	add    BYTE PTR [eax],al
30003870:	21 0b                	and    DWORD PTR [ebx],ecx
30003872:	00 30                	add    BYTE PTR [eax],dh
30003874:	02 17                	add    dl,BYTE PTR [edi]
30003876:	00 00                	add    BYTE PTR [eax],al
30003878:	69 18 00 30 02 17    	imul   ebx,DWORD PTR [eax],0x17023000
3000387e:	00 00                	add    BYTE PTR [eax],al
30003880:	58                   	pop    eax
30003881:	3a 00                	cmp    al,BYTE PTR [eax]
30003883:	30 01                	xor    BYTE PTR [ecx],al
30003885:	0f 00 00             	sldt   WORD PTR [eax]
30003888:	48                   	dec    eax
30003889:	3a 00                	cmp    al,BYTE PTR [eax]
3000388b:	30 07                	xor    BYTE PTR [edi],al
3000388d:	01 00                	add    DWORD PTR [eax],eax
3000388f:	00 4c 3a 00          	add    BYTE PTR [edx+edi*1+0x0],cl
30003893:	30 07                	xor    BYTE PTR [edi],al
30003895:	05 00 00 50 3a       	add    eax,0x3a500000
3000389a:	00 30                	add    BYTE PTR [eax],dh
3000389c:	07                   	pop    es
3000389d:	0d 00 00 54 3a       	or     eax,0x3a540000
300038a2:	00 30                	add    BYTE PTR [eax],dh
300038a4:	07                   	pop    es
300038a5:	26 00 00             	add    BYTE PTR es:[eax],al

Disassembly of section .data:

300038c0 <console_node>:
300038c0:	01 00                	add    DWORD PTR [eax],eax
	...

30003900 <rcsid>:
30003900:	24 48                	and    al,0x48
30003902:	65                   	gs
30003903:	61                   	popa   
30003904:	64                   	fs
30003905:	65                   	gs
30003906:	72 3a                	jb     30003942 <rcsid+0x42>
30003908:	20 2f                	and    BYTE PTR [edi],ch
3000390a:	75 73                	jne    3000397f <_DYNAMIC+0x13>
3000390c:	65                   	gs
3000390d:	72 36                	jb     30003945 <rcsid+0x45>
3000390f:	2f                   	das    
30003910:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003911:	75 73                	jne    30003986 <_DYNAMIC+0x1a>
30003913:	74 65                	je     3000397a <_DYNAMIC+0xe>
30003915:	72 2f                	jb     30003946 <rcsid+0x46>
30003917:	74 63                	je     3000397c <_DYNAMIC+0x10>
30003919:	6c                   	ins    BYTE PTR es:[edi],dx
3000391a:	2f                   	das    
3000391b:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
3000391e:	70 61                	jo     30003981 <_DYNAMIC+0x15>
30003920:	74 2f                	je     30003951 <rcsid+0x51>
30003922:	52                   	push   edx
30003923:	43                   	inc    ebx
30003924:	53                   	push   ebx
30003925:	2f                   	das    
30003926:	73 74                	jae    3000399c <_DYNAMIC+0x30>
30003928:	72 73                	jb     3000399d <_DYNAMIC+0x31>
3000392a:	74 72                	je     3000399e <_DYNAMIC+0x32>
3000392c:	2e 63 2c 76          	arpl   WORD PTR cs:[esi+esi*2],bp
30003930:	20 31                	and    BYTE PTR [ecx],dh
30003932:	2e 32 20             	xor    ah,BYTE PTR cs:[eax]
30003935:	39 33                	cmp    DWORD PTR [ebx],esi
30003937:	2f                   	das    
30003938:	30 33                	xor    BYTE PTR [ebx],dh
3000393a:	2f                   	das    
3000393b:	31 39                	xor    DWORD PTR [ecx],edi
3000393d:	20 31                	and    BYTE PTR [ecx],dh
3000393f:	35 3a 32 35 3a       	xor    eax,0x3a35323a
30003944:	34 30                	xor    al,0x30
30003946:	20 6f 75             	and    BYTE PTR [edi+0x75],ch
30003949:	73 74                	jae    300039bf <_DYNAMIC+0x53>
3000394b:	65                   	gs
3000394c:	72 20                	jb     3000396e <_DYNAMIC+0x2>
3000394e:	45                   	inc    ebp
3000394f:	78 70                	js     300039c1 <_DYNAMIC+0x55>
30003951:	20 24 20             	and    BYTE PTR [eax+eiz*1],ah
30003954:	53                   	push   ebx
30003955:	50                   	push   eax
30003956:	52                   	push   edx
30003957:	49                   	dec    ecx
30003958:	54                   	push   esp
30003959:	45                   	inc    ebp
3000395a:	20 28                	and    BYTE PTR [eax],ch
3000395c:	42                   	inc    edx
3000395d:	65                   	gs
3000395e:	72 6b                	jb     300039cb <_DYNAMIC+0x5f>
30003960:	65                   	gs
30003961:	6c                   	ins    BYTE PTR es:[edi],dx
30003962:	65                   	gs
30003963:	79 29                	jns    3000398e <_DYNAMIC+0x22>
30003965:	00 00                	add    BYTE PTR [eax],al
	...

30003968 <_daylight>:
30003968:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

3000396c <_DYNAMIC>:
3000396c:	19 00                	sbb    DWORD PTR [eax],eax
3000396e:	00 00                	add    BYTE PTR [eax],al
30003970:	58                   	pop    eax
30003971:	3a 00                	cmp    al,BYTE PTR [eax]
30003973:	30 1b                	xor    BYTE PTR [ebx],bl
30003975:	00 00                	add    BYTE PTR [eax],al
30003977:	00 04 00             	add    BYTE PTR [eax+eax*1],al
3000397a:	00 00                	add    BYTE PTR [eax],al
3000397c:	1a 00                	sbb    al,BYTE PTR [eax]
3000397e:	00 00                	add    BYTE PTR [eax],al
30003980:	5c                   	pop    esp
30003981:	3a 00                	cmp    al,BYTE PTR [eax]
30003983:	30 1c 00             	xor    BYTE PTR [eax+eax*1],bl
30003986:	00 00                	add    BYTE PTR [eax],al
30003988:	04 00                	add    al,0x0
3000398a:	00 00                	add    BYTE PTR [eax],al
3000398c:	04 00                	add    al,0x0
3000398e:	00 00                	add    BYTE PTR [eax],al
30003990:	b8 31 00 30 05       	mov    eax,0x5300031
30003995:	00 00                	add    BYTE PTR [eax],al
30003997:	00 88 30 00 30 06    	add    BYTE PTR [eax+0x6300030],cl
3000399d:	00 00                	add    BYTE PTR [eax],al
3000399f:	00 e8                	add    al,ch
300039a1:	2d 00 30 0a 00       	sub    eax,0xa3000
300039a6:	00 00                	add    BYTE PTR [eax],al
300039a8:	2e 01 00             	add    DWORD PTR cs:[eax],eax
300039ab:	00 0b                	add    BYTE PTR [ebx],cl
300039ad:	00 00                	add    BYTE PTR [eax],al
300039af:	00 10                	add    BYTE PTR [eax],dl
300039b1:	00 00                	add    BYTE PTR [eax],al
300039b3:	00 03                	add    BYTE PTR [ebx],al
300039b5:	00 00                	add    BYTE PTR [eax],al
300039b7:	00 3c 3a             	add    BYTE PTR [edx+edi*1],bh
300039ba:	00 30                	add    BYTE PTR [eax],dh
300039bc:	02 00                	add    al,BYTE PTR [eax]
300039be:	00 00                	add    BYTE PTR [eax],al
300039c0:	20 00                	and    BYTE PTR [eax],al
300039c2:	00 00                	add    BYTE PTR [eax],al
300039c4:	14 00                	adc    al,0x0
300039c6:	00 00                	add    BYTE PTR [eax],al
300039c8:	11 00                	adc    DWORD PTR [eax],eax
300039ca:	00 00                	add    BYTE PTR [eax],al
300039cc:	17                   	pop    ss
300039cd:	00 00                	add    BYTE PTR [eax],al
300039cf:	00 88 38 00 30 11    	add    BYTE PTR [eax+0x11300038],cl
300039d5:	00 00                	add    BYTE PTR [eax],al
300039d7:	00 c0                	add    al,al
300039d9:	37                   	aaa    
300039da:	00 30                	add    BYTE PTR [eax],dh
300039dc:	12 00                	adc    al,BYTE PTR [eax]
300039de:	00 00                	add    BYTE PTR [eax],al
300039e0:	c8 00 00 00          	enter  0x0,0x0
300039e4:	13 00                	adc    eax,DWORD PTR [eax]
300039e6:	00 00                	add    BYTE PTR [eax],al
300039e8:	08 00                	or     BYTE PTR [eax],al
300039ea:	00 00                	add    BYTE PTR [eax],al
300039ec:	16                   	push   ss
300039ed:	00 00                	add    BYTE PTR [eax],al
300039ef:	00 00                	add    BYTE PTR [eax],al
300039f1:	00 00                	add    BYTE PTR [eax],al
300039f3:	00 fa                	add    dl,bh
300039f5:	ff                   	(bad)  
300039f6:	ff 6f 09             	jmp    FWORD PTR [edi+0x9]
	...

Disassembly of section .got:

30003a24 <.got>:
30003a24:	80 3a 00             	cmp    BYTE PTR [edx],0x0
30003a27:	30 88 3a 00 30 68    	xor    BYTE PTR [eax+0x6830003a],cl
30003a2d:	3a 00                	cmp    al,BYTE PTR [eax]
30003a2f:	30 6c 3a 00          	xor    BYTE PTR [edx+edi*1+0x0],ch
30003a33:	30 70 3a             	xor    BYTE PTR [eax+0x3a],dh
30003a36:	00 30                	add    BYTE PTR [eax],dh
30003a38:	74 3a                	je     30003a74 <libcTZ>
30003a3a:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .got.plt:

30003a3c <_GLOBAL_OFFSET_TABLE_>:
30003a3c:	6c                   	ins    BYTE PTR es:[edi],dx
30003a3d:	39 00                	cmp    DWORD PTR [eax],eax
30003a3f:	30 00                	xor    BYTE PTR [eax],al
30003a41:	00 00                	add    BYTE PTR [eax],al
30003a43:	00 00                	add    BYTE PTR [eax],al
30003a45:	00 00                	add    BYTE PTR [eax],al
30003a47:	00 86 24 00 30 96    	add    BYTE PTR [esi-0x69cfffdc],al
30003a4d:	24 00                	and    al,0x0
30003a4f:	30 a6 24 00 30 b6    	xor    BYTE PTR [esi-0x49cfffdc],ah
30003a55:	24 00                	and    al,0x0
30003a57:	30                   	.byte 0x30

Disassembly of section .init_array:

30003a58 <.init_array>:
30003a58:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .fini_array:

30003a5c <.fini_array>:
30003a5c:	fd                   	std    
30003a5d:	05                   	.byte 0x5
30003a5e:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .data.rel.local:

30003a60 <_tzname>:
30003a60:	40                   	inc    eax
30003a61:	37                   	aaa    
30003a62:	00 30                	add    BYTE PTR [eax],dh
30003a64:	40                   	inc    eax
30003a65:	37                   	aaa    
30003a66:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .bss:

30003a68 <heapEnd>:
30003a68:	00 00                	add    BYTE PTR [eax],al
	...

30003a6c <heapBase>:
30003a6c:	00 00                	add    BYTE PTR [eax],al
	...

30003a70 <heapCurr>:
30003a70:	00 00                	add    BYTE PTR [eax],al
	...

30003a74 <libcTZ>:
30003a74:	00 00                	add    BYTE PTR [eax],al
	...

30003a78 <lasts.1253>:
30003a78:	00 00                	add    BYTE PTR [eax],al
	...

30003a7c <libcInitialized>:
30003a7c:	00 00                	add    BYTE PTR [eax],al
	...

30003a80 <fops>:
	...

30003a88 <console_file>:
	...

30003a98 <_dstbias>:
30003a98:	00 00                	add    BYTE PTR [eax],al
	...

30003a9c <ticksToWait>:
30003a9c:	00 00                	add    BYTE PTR [eax],al
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
     116:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     119:	56                   	push   esi
     11a:	00 00                	add    BYTE PTR [eax],al
     11c:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
     122:	30 09                	xor    BYTE PTR [ecx],cl
     124:	aa                   	stos   BYTE PTR es:[edi],al
     125:	00 00                	add    BYTE PTR [eax],al
     127:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     12e:	05 03 70 3a 00       	add    eax,0x3a7003
     133:	30 09                	xor    BYTE PTR [ecx],cl
     135:	56                   	push   esi
     136:	01 00                	add    DWORD PTR [eax],eax
     138:	00 04 36             	add    BYTE PTR [esi+esi*1],al
     13b:	56                   	push   esi
     13c:	00 00                	add    BYTE PTR [eax],al
     13e:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
     144:	30 09                	xor    BYTE PTR [ecx],cl
     146:	48                   	dec    eax
     147:	00 00                	add    BYTE PTR [eax],al
     149:	00 05 38 84 00 00    	add    BYTE PTR ds:0x8438,al
     14f:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
     155:	30 00                	xor    BYTE PTR [eax],al
     157:	92                   	xchg   edx,eax
     158:	01 00                	add    DWORD PTR [eax],eax
     15a:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     15d:	83 00 00             	add    DWORD PTR [eax],0x0
     160:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     163:	ef                   	out    dx,eax
     164:	00 00                	add    BYTE PTR [eax],al
     166:	00 0c 64             	add    BYTE PTR [esp+eiz*2],cl
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
     1fb:	8e 01                	mov    es,WORD PTR [ecx]
     1fd:	00 00                	add    BYTE PTR [eax],al
     1ff:	01 25 3a 00 00 00    	add    DWORD PTR ds:0x3a,esp
     205:	70 00                	jo     207 <sysEnter_Vector-0x12fdf9>
     207:	00 30                	add    BYTE PTR [eax],dh
     209:	55                   	push   ebp
     20a:	00 00                	add    BYTE PTR [eax],al
     20c:	00 01                	add    BYTE PTR [ecx],al
     20e:	9c                   	pushf  
     20f:	fa                   	cli    
     210:	00 00                	add    BYTE PTR [eax],al
     212:	00 07                	add    BYTE PTR [edi],al
     214:	b4 09                	mov    ah,0x9
     216:	00 00                	add    BYTE PTR [eax],al
     218:	01 25 9d 00 00 00    	add    DWORD PTR ds:0x9d,esp
     21e:	02 91 00 07 5e 01    	add    dl,BYTE PTR [ecx+0x15e0700]
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
     252:	96                   	xchg   esi,eax
     253:	01 00                	add    DWORD PTR [eax],eax
     255:	00 01                	add    BYTE PTR [ecx],al
     257:	33 3a                	xor    edi,DWORD PTR [edx]
     259:	00 00                	add    BYTE PTR [eax],al
     25b:	00 c5                	add    ch,al
     25d:	00 00                	add    BYTE PTR [eax],al
     25f:	30 55 00             	xor    BYTE PTR [ebp+0x0],dl
     262:	00 00                	add    BYTE PTR [eax],al
     264:	01 9c 51 01 00 00 07 	add    DWORD PTR [ecx+edx*2+0x7000001],ebx
     26b:	b4 09                	mov    ah,0x9
     26d:	00 00                	add    BYTE PTR [eax],al
     26f:	01 33                	add    DWORD PTR [ebx],esi
     271:	9d                   	popf   
     272:	00 00                	add    BYTE PTR [eax],al
     274:	00 02                	add    BYTE PTR [edx],al
     276:	91                   	xchg   ecx,eax
     277:	00 07                	add    BYTE PTR [edi],al
     279:	5e                   	pop    esi
     27a:	01 00                	add    DWORD PTR [eax],eax
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
     2ac:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     2af:	56                   	push   esi
     2b0:	00 00                	add    BYTE PTR [eax],al
     2b2:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
     2b8:	30 09                	xor    BYTE PTR [ecx],cl
     2ba:	aa                   	stos   BYTE PTR es:[edi],al
     2bb:	00 00                	add    BYTE PTR [eax],al
     2bd:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     2c4:	05 03 70 3a 00       	add    eax,0x3a7003
     2c9:	30 09                	xor    BYTE PTR [ecx],cl
     2cb:	56                   	push   esi
     2cc:	01 00                	add    DWORD PTR [eax],eax
     2ce:	00 04 36             	add    BYTE PTR [esi+esi*1],al
     2d1:	56                   	push   esi
     2d2:	00 00                	add    BYTE PTR [eax],al
     2d4:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
     2da:	30 09                	xor    BYTE PTR [ecx],cl
     2dc:	48                   	dec    eax
     2dd:	00 00                	add    BYTE PTR [eax],al
     2df:	00 05 38 84 00 00    	add    BYTE PTR ds:0x8438,al
     2e5:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
     2eb:	30 00                	xor    BYTE PTR [eax],al
     2ed:	35 01 00 00 04       	xor    eax,0x4000001
     2f2:	00 0e                	add    BYTE PTR [esi],cl
     2f4:	01 00                	add    DWORD PTR [eax],eax
     2f6:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     2f9:	ef                   	out    dx,eax
     2fa:	00 00                	add    BYTE PTR [eax],al
     2fc:	00 0c 9f             	add    BYTE PTR [edi+ebx*4],cl
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
     391:	d4 01                	aam    0x1
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
     3b6:	c8 01 00 00          	enter  0x1,0x0
     3ba:	01 28                	add    DWORD PTR [eax],ebp
     3bc:	9d                   	popf   
     3bd:	00 00                	add    BYTE PTR [eax],al
     3bf:	00 02                	add    BYTE PTR [edx],al
     3c1:	91                   	xchg   ecx,eax
     3c2:	04 09                	add    al,0x9
     3c4:	ce                   	into   
     3c5:	01 00                	add    DWORD PTR [eax],eax
     3c7:	00 01                	add    BYTE PTR [ecx],al
     3c9:	2a 9d 00 00 00 05    	sub    bl,BYTE PTR [ebp+0x5000000]
     3cf:	03 78 3a             	add    edi,DWORD PTR [eax+0x3a]
     3d2:	00 30                	add    BYTE PTR [eax],dh
     3d4:	0a 63 68             	or     ah,BYTE PTR [ebx+0x68]
     3d7:	00 01                	add    BYTE PTR [ecx],al
     3d9:	2b 3a                	sub    edi,DWORD PTR [edx]
     3db:	00 00                	add    BYTE PTR [eax],al
     3dd:	00 01                	add    BYTE PTR [ecx],al
     3df:	56                   	push   esi
     3e0:	00 0b                	add    BYTE PTR [ebx],cl
     3e2:	3f                   	aas    
     3e3:	00 00                	add    BYTE PTR [eax],al
     3e5:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     3e8:	56                   	push   esi
     3e9:	00 00                	add    BYTE PTR [eax],al
     3eb:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
     3f1:	30 0b                	xor    BYTE PTR [ebx],cl
     3f3:	aa                   	stos   BYTE PTR es:[edi],al
     3f4:	00 00                	add    BYTE PTR [eax],al
     3f6:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     3fd:	05 03 70 3a 00       	add    eax,0x3a7003
     402:	30 0b                	xor    BYTE PTR [ebx],cl
     404:	56                   	push   esi
     405:	01 00                	add    DWORD PTR [eax],eax
     407:	00 04 36             	add    BYTE PTR [esi+esi*1],al
     40a:	56                   	push   esi
     40b:	00 00                	add    BYTE PTR [eax],al
     40d:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
     413:	30 0b                	xor    BYTE PTR [ebx],cl
     415:	48                   	dec    eax
     416:	00 00                	add    BYTE PTR [eax],al
     418:	00 05 38 84 00 00    	add    BYTE PTR ds:0x8438,al
     41e:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
     424:	30 00                	xor    BYTE PTR [eax],al
     426:	d5 01                	aad    0x1
     428:	00 00                	add    BYTE PTR [eax],al
     42a:	04 00                	add    al,0x0
     42c:	b7 01                	mov    bh,0x1
     42e:	00 00                	add    BYTE PTR [eax],al
     430:	04 01                	add    al,0x1
     432:	ef                   	out    dx,eax
     433:	00 00                	add    BYTE PTR [eax],al
     435:	00 0c e1             	add    BYTE PTR [ecx+eiz*8],cl
     438:	01 00                	add    DWORD PTR [eax],eax
     43a:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
     43d:	00 00                	add    BYTE PTR [eax],al
     43f:	b4 01                	mov    ah,0x1
     441:	00 30                	add    BYTE PTR [eax],dh
     443:	8e 01                	mov    es,WORD PTR [ecx]
     445:	00 00                	add    BYTE PTR [eax],al
     447:	d1 02                	rol    DWORD PTR [edx],1
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
     4ca:	fa                   	cli    
     4cb:	01 00                	add    DWORD PTR [eax],eax
     4cd:	00 01                	add    BYTE PTR [ecx],al
     4cf:	0a b4 01 00 30 77 00 	or     dh,BYTE PTR [ecx+eax*1+0x773000]
     4d6:	00 00                	add    BYTE PTR [eax],al
     4d8:	01 9c 00 01 00 00 07 	add    DWORD PTR [eax+eax*1+0x7000001],ebx
     4df:	73 00                	jae    4e1 <sysEnter_Vector-0x12fb1f>
     4e1:	01 0a                	add    DWORD PTR [edx],ecx
     4e3:	9d                   	popf   
     4e4:	00 00                	add    BYTE PTR [eax],al
     4e6:	00 02                	add    BYTE PTR [edx],al
     4e8:	91                   	xchg   ecx,eax
     4e9:	00 08                	add    BYTE PTR [eax],cl
     4eb:	69 00 01 0c 3a 00    	imul   eax,DWORD PTR [eax],0x3a0c01
     4f1:	00 00                	add    BYTE PTR [eax],al
     4f3:	02 91 6c 08 6a 00    	add    dl,BYTE PTR [ecx+0x6a086c]
     4f9:	01 0c 3a             	add    DWORD PTR [edx+edi*1],ecx
     4fc:	00 00                	add    BYTE PTR [eax],al
     4fe:	00 02                	add    BYTE PTR [edx],al
     500:	91                   	xchg   ecx,eax
     501:	68 08 63 00 01       	push   0x1006308
     506:	0d 25 00 00 00       	or     eax,0x25
     50b:	02 91 67 09 c5 01    	add    dl,BYTE PTR [ecx+0x1c50967]
     511:	00 30                	add    BYTE PTR [eax],dh
     513:	60                   	pusha  
     514:	00 00                	add    BYTE PTR [eax],al
     516:	00 0a                	add    BYTE PTR [edx],cl
     518:	f2 01 00             	repnz add DWORD PTR [eax],eax
     51b:	00 01                	add    BYTE PTR [ecx],al
     51d:	0f 3a 00             	(bad)  
     520:	00 00                	add    BYTE PTR [eax],al
     522:	0b 00                	or     eax,DWORD PTR [eax]
     524:	00 00                	add    BYTE PTR [eax],al
     526:	06                   	push   es
     527:	db 01                	fild   DWORD PTR [ecx]
     529:	00 00                	add    BYTE PTR [eax],al
     52b:	01 16                	add    DWORD PTR [esi],edx
     52d:	2b 02                	sub    eax,DWORD PTR [edx]
     52f:	00 30                	add    BYTE PTR [eax],dh
     531:	bb 00 00 00 01       	mov    ebx,0x1000000
     536:	9c                   	pushf  
     537:	48                   	dec    eax
     538:	01 00                	add    DWORD PTR [eax],eax
     53a:	00 07                	add    BYTE PTR [edi],al
     53c:	6e                   	outs   dx,BYTE PTR ds:[esi]
     53d:	00 01                	add    BYTE PTR [ecx],al
     53f:	16                   	push   ss
     540:	3a 00                	cmp    al,BYTE PTR [eax]
     542:	00 00                	add    BYTE PTR [eax],al
     544:	02 91 00 07 73 00    	add    dl,BYTE PTR [ecx+0x730700]
     54a:	01 16                	add    DWORD PTR [esi],edx
     54c:	9d                   	popf   
     54d:	00 00                	add    BYTE PTR [eax],al
     54f:	00 02                	add    BYTE PTR [edx],al
     551:	91                   	xchg   ecx,eax
     552:	04 08                	add    al,0x8
     554:	69 00 01 18 3a 00    	imul   eax,DWORD PTR [eax],0x3a1801
     55a:	00 00                	add    BYTE PTR [eax],al
     55c:	02 91 6c 0c 03 02    	add    dl,BYTE PTR [ecx+0x2030c6c]
     562:	00 00                	add    BYTE PTR [eax],al
     564:	01 18                	add    DWORD PTR [eax],ebx
     566:	3a 00                	cmp    al,BYTE PTR [eax]
     568:	00 00                	add    BYTE PTR [eax],al
     56a:	02 91 68 00 0d ed    	add    dl,BYTE PTR [ecx-0x12f2ff98]
     570:	01 00                	add    DWORD PTR [eax],eax
     572:	00 01                	add    BYTE PTR [ecx],al
     574:	27                   	daa    
     575:	3a 00                	cmp    al,BYTE PTR [eax]
     577:	00 00                	add    BYTE PTR [eax],al
     579:	e6 02                	out    0x2,al
     57b:	00 30                	add    BYTE PTR [eax],dh
     57d:	5c                   	pop    esp
     57e:	00 00                	add    BYTE PTR [eax],al
     580:	00 01                	add    BYTE PTR [ecx],al
     582:	9c                   	pushf  
     583:	94                   	xchg   esp,eax
     584:	01 00                	add    DWORD PTR [eax],eax
     586:	00 07                	add    BYTE PTR [edi],al
     588:	73 74                	jae    5fe <sysEnter_Vector-0x12fa02>
     58a:	72 00                	jb     58c <sysEnter_Vector-0x12fa74>
     58c:	01 27                	add    DWORD PTR [edi],esp
     58e:	9d                   	popf   
     58f:	00 00                	add    BYTE PTR [eax],al
     591:	00 02                	add    BYTE PTR [edx],al
     593:	91                   	xchg   ecx,eax
     594:	00 08                	add    BYTE PTR [eax],cl
     596:	72 65                	jb     5fd <sysEnter_Vector-0x12fa03>
     598:	73 00                	jae    59a <sysEnter_Vector-0x12fa66>
     59a:	01 29                	add    DWORD PTR [ecx],ebp
     59c:	3a 00                	cmp    al,BYTE PTR [eax]
     59e:	00 00                	add    BYTE PTR [eax],al
     5a0:	02 91 74 09 fd 02    	add    dl,BYTE PTR [ecx+0x2fd0974]
     5a6:	00 30                	add    BYTE PTR [eax],dh
     5a8:	40                   	inc    eax
     5a9:	00 00                	add    BYTE PTR [eax],al
     5ab:	00 08                	add    BYTE PTR [eax],cl
     5ad:	69 00 01 2d 3a 00    	imul   eax,DWORD PTR [eax],0x3a2d01
     5b3:	00 00                	add    BYTE PTR [eax],al
     5b5:	02 91 70 00 00 0e    	add    dl,BYTE PTR [ecx+0xe000070]
     5bb:	3f                   	aas    
     5bc:	00 00                	add    BYTE PTR [eax],al
     5be:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     5c1:	56                   	push   esi
     5c2:	00 00                	add    BYTE PTR [eax],al
     5c4:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
     5ca:	30 0e                	xor    BYTE PTR [esi],cl
     5cc:	aa                   	stos   BYTE PTR es:[edi],al
     5cd:	00 00                	add    BYTE PTR [eax],al
     5cf:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     5d6:	05 03 70 3a 00       	add    eax,0x3a7003
     5db:	30 0e                	xor    BYTE PTR [esi],cl
     5dd:	56                   	push   esi
     5de:	01 00                	add    DWORD PTR [eax],eax
     5e0:	00 04 36             	add    BYTE PTR [esi+esi*1],al
     5e3:	56                   	push   esi
     5e4:	00 00                	add    BYTE PTR [eax],al
     5e6:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
     5ec:	30 0e                	xor    BYTE PTR [esi],cl
     5ee:	48                   	dec    eax
     5ef:	00 00                	add    BYTE PTR [eax],al
     5f1:	00 05 38 84 00 00    	add    BYTE PTR ds:0x8438,al
     5f7:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
     5fd:	30 00                	xor    BYTE PTR [eax],al
     5ff:	75 02                	jne    603 <sysEnter_Vector-0x12f9fd>
     601:	00 00                	add    BYTE PTR [eax],al
     603:	04 00                	add    al,0x0
     605:	8a 02                	mov    al,BYTE PTR [edx]
     607:	00 00                	add    BYTE PTR [eax],al
     609:	04 01                	add    al,0x1
     60b:	ef                   	out    dx,eax
     60c:	00 00                	add    BYTE PTR [eax],al
     60e:	00 0c 4c             	add    BYTE PTR [esp+ecx*2],cl
     611:	02 00                	add    al,BYTE PTR [eax]
     613:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
     616:	00 00                	add    BYTE PTR [eax],al
     618:	44                   	inc    esp
     619:	03 00                	add    eax,DWORD PTR [eax]
     61b:	30 52 01             	xor    BYTE PTR [edx+0x1],dl
     61e:	00 00                	add    BYTE PTR [eax],al
     620:	d7                   	xlat   BYTE PTR ds:[ebx]
     621:	03 00                	add    eax,DWORD PTR [eax]
     623:	00 02                	add    BYTE PTR [edx],al
     625:	01 06                	add    DWORD PTR [esi],eax
     627:	58                   	pop    eax
     628:	00 00                	add    BYTE PTR [eax],al
     62a:	00 02                	add    BYTE PTR [edx],al
     62c:	01 06                	add    DWORD PTR [esi],eax
     62e:	51                   	push   ecx
     62f:	00 00                	add    BYTE PTR [eax],al
     631:	00 02                	add    BYTE PTR [edx],al
     633:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
     639:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     640:	02 08                	add    cl,BYTE PTR [eax]
     642:	05 00 00 00 00       	add    eax,0x0
     647:	02 01                	add    al,BYTE PTR [ecx]
     649:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
     64c:	00 00                	add    BYTE PTR [eax],al
     64e:	02 02                	add    al,BYTE PTR [edx]
     650:	07                   	pop    es
     651:	0e                   	push   cs
     652:	00 00                	add    BYTE PTR [eax],al
     654:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
     657:	00 00                	add    BYTE PTR [eax],al
     659:	00 02                	add    BYTE PTR [edx],al
     65b:	34 61                	xor    al,0x61
     65d:	00 00                	add    BYTE PTR [eax],al
     65f:	00 02                	add    BYTE PTR [edx],al
     661:	04 07                	add    al,0x7
     663:	32 00                	xor    al,BYTE PTR [eax]
     665:	00 00                	add    BYTE PTR [eax],al
     667:	02 08                	add    cl,BYTE PTR [eax]
     669:	07                   	pop    es
     66a:	28 00                	sub    BYTE PTR [eax],al
     66c:	00 00                	add    BYTE PTR [eax],al
     66e:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
     675:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
     678:	96                   	xchg   esi,eax
     679:	00 00                	add    BYTE PTR [eax],al
     67b:	00 02                	add    BYTE PTR [edx],al
     67d:	01 02                	add    DWORD PTR [edx],eax
     67f:	90                   	nop
     680:	00 00                	add    BYTE PTR [eax],al
     682:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
     689:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
     68c:	00 00                	add    BYTE PTR [eax],al
     68e:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     691:	2d 00 00 00 02       	sub    eax,0x2000000
     696:	04 07                	add    al,0x7
     698:	dc 00                	fadd   QWORD PTR [eax]
     69a:	00 00                	add    BYTE PTR [eax],al
     69c:	05 04 25 00 00       	add    eax,0x2504
     6a1:	00 06                	add    BYTE PTR [esi],al
     6a3:	5e                   	pop    esi
     6a4:	02 00                	add    al,BYTE PTR [eax]
     6a6:	00 04 61             	add    BYTE PTR [ecx+eiz*2],al
     6a9:	00 00                	add    BYTE PTR [eax],al
     6ab:	00 06                	add    BYTE PTR [esi],al
     6ad:	15 31 01 00 00       	adc    eax,0x131
     6b2:	07                   	pop    es
     6b3:	44                   	inc    esp
     6b4:	03 00                	add    eax,DWORD PTR [eax]
     6b6:	00 00                	add    BYTE PTR [eax],al
     6b8:	07                   	pop    es
     6b9:	ed                   	in     eax,dx
     6ba:	02 00                	add    al,BYTE PTR [eax]
     6bc:	00 01                	add    BYTE PTR [ecx],al
     6be:	07                   	pop    es
     6bf:	d3 02                	rol    DWORD PTR [edx],cl
     6c1:	00 00                	add    BYTE PTR [eax],al
     6c3:	03 07                	add    eax,DWORD PTR [edi]
     6c5:	36 03 00             	add    eax,DWORD PTR ss:[eax]
     6c8:	00 04 07             	add    BYTE PTR [edi+eax*1],al
     6cb:	3d 02 00 00 4f       	cmp    eax,0x4f000002
     6d0:	07                   	pop    es
     6d1:	e0 02                	loopne 6d5 <sysEnter_Vector-0x12f92b>
     6d3:	00 00                	add    BYTE PTR [eax],al
     6d5:	59                   	pop    ecx
     6d6:	07                   	pop    es
     6d7:	68 02 00 00 61       	push   0x61000002
     6dc:	07                   	pop    es
     6dd:	63 03                	arpl   WORD PTR [ebx],ax
     6df:	00 00                	add    BYTE PTR [eax],al
     6e1:	97                   	xchg   edi,eax
     6e2:	08 05 03 00 00 63    	or     BYTE PTR ds:0x63000003,al
     6e8:	01 08                	add    DWORD PTR [eax],ecx
     6ea:	1c 03                	sbb    al,0x3
     6ec:	00 00                	add    BYTE PTR [eax],al
     6ee:	64 01 08             	add    DWORD PTR fs:[eax],ecx
     6f1:	c0 02 00             	rol    BYTE PTR [edx],0x0
     6f4:	00 65 01             	add    BYTE PTR [ebp+0x1],ah
     6f7:	08 97 02 00 00 66    	or     BYTE PTR [edi+0x66000002],dl
     6fd:	01 08                	add    DWORD PTR [eax],ecx
     6ff:	7b 02                	jnp    703 <sysEnter_Vector-0x12f8fd>
     701:	00 00                	add    BYTE PTR [eax],al
     703:	67 01 08             	add    DWORD PTR [bx+si],ecx
     706:	29 03                	sub    DWORD PTR [ebx],eax
     708:	00 00                	add    BYTE PTR [eax],al
     70a:	68 01 08 54 03       	push   0x3540801
     70f:	00 00                	add    BYTE PTR [eax],al
     711:	69 01 08 0f 02 00    	imul   eax,DWORD PTR [ecx],0x20f08
     717:	00 70 01             	add    BYTE PTR [eax+0x1],dh
     71a:	08 81 03 00 00 00    	or     BYTE PTR [ecx+0x3],al
     720:	03 08                	add    ecx,DWORD PTR [eax]
     722:	b1 02                	mov    cl,0x2
     724:	00 00                	add    BYTE PTR [eax],al
     726:	01 03                	add    DWORD PTR [ebx],eax
     728:	08 20                	or     BYTE PTR [eax],ah
     72a:	02 00                	add    al,BYTE PTR [eax]
     72c:	00 02                	add    BYTE PTR [edx],al
     72e:	03 00                	add    eax,DWORD PTR [eax]
     730:	09 7c 03 00          	or     DWORD PTR [ebx+eax*1+0x0],edi
     734:	00 01                	add    BYTE PTR [ecx],al
     736:	0f 44 03             	cmove  eax,DWORD PTR [ebx]
     739:	00 30                	add    BYTE PTR [eax],dh
     73b:	26 00 00             	add    BYTE PTR es:[eax],al
     73e:	00 01                	add    BYTE PTR [ecx],al
     740:	9c                   	pushf  
     741:	55                   	push   ebp
     742:	01 00                	add    DWORD PTR [eax],eax
     744:	00 0a                	add    BYTE PTR [edx],cl
     746:	2c 02                	sub    al,0x2
     748:	00 00                	add    BYTE PTR [eax],al
     74a:	01 0f                	add    DWORD PTR [edi],ecx
     74c:	9d                   	popf   
     74d:	00 00                	add    BYTE PTR [eax],al
     74f:	00 02                	add    BYTE PTR [edx],al
     751:	91                   	xchg   ecx,eax
     752:	00 00                	add    BYTE PTR [eax],al
     754:	09 00                	or     DWORD PTR [eax],eax
     756:	03 00                	add    eax,DWORD PTR [eax]
     758:	00 01                	add    BYTE PTR [ecx],al
     75a:	14 6a                	adc    al,0x6a
     75c:	03 00                	add    eax,DWORD PTR [eax]
     75e:	30 43 00             	xor    BYTE PTR [ebx+0x0],al
     761:	00 00                	add    BYTE PTR [eax],al
     763:	01 9c 85 01 00 00 0b 	add    DWORD PTR [ebp+eax*4+0xb000001],ebx
     76a:	63 00                	arpl   WORD PTR [eax],ax
     76c:	01 14 25 00 00 00 02 	add    DWORD PTR [eiz*1+0x2000000],edx
     773:	91                   	xchg   ecx,eax
     774:	60                   	pusha  
     775:	0c 2c                	or     al,0x2c
     777:	02 00                	add    al,BYTE PTR [eax]
     779:	00 01                	add    BYTE PTR [ecx],al
     77b:	16                   	push   ss
     77c:	85 01                	test   DWORD PTR [ecx],eax
     77e:	00 00                	add    BYTE PTR [eax],al
     780:	02 91 72 00 0d 25    	add    dl,BYTE PTR [ecx+0x250d0072]
     786:	00 00                	add    BYTE PTR [eax],al
     788:	00 95 01 00 00 0e    	add    BYTE PTR [ebp+0xe000001],dl
     78e:	96                   	xchg   esi,eax
     78f:	00 00                	add    BYTE PTR [eax],al
     791:	00 01                	add    BYTE PTR [ecx],al
     793:	00 0f                	add    BYTE PTR [edi],cl
     795:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
     796:	02 00                	add    al,BYTE PTR [eax]
     798:	00 01                	add    BYTE PTR [ecx],al
     79a:	1d 25 00 00 00       	sbb    eax,0x25
     79f:	ad                   	lods   eax,DWORD PTR ds:[esi]
     7a0:	03 00                	add    eax,DWORD PTR [eax]
     7a2:	30 2f                	xor    BYTE PTR [edi],ch
     7a4:	00 00                	add    BYTE PTR [eax],al
     7a6:	00 01                	add    BYTE PTR [ecx],al
     7a8:	9c                   	pushf  
     7a9:	bb 01 00 00 10       	mov    ebx,0x10000001
     7ae:	63 00                	arpl   WORD PTR [eax],ax
     7b0:	01 1f                	add    DWORD PTR [edi],ebx
     7b2:	25 00 00 00 02       	and    eax,0x2000000
     7b7:	91                   	xchg   ecx,eax
     7b8:	73 00                	jae    7ba <sysEnter_Vector-0x12f846>
     7ba:	11 ce                	adc    esi,ecx
     7bc:	02 00                	add    al,BYTE PTR [eax]
     7be:	00 01                	add    BYTE PTR [ecx],al
     7c0:	25 3a 00 00 00       	and    eax,0x3a
     7c5:	dc 03                	fadd   QWORD PTR [ebx]
     7c7:	00 30                	add    BYTE PTR [eax],dh
     7c9:	ba 00 00 00 01       	mov    edx,0x1000000
     7ce:	9c                   	pushf  
     7cf:	34 02                	xor    al,0x2
     7d1:	00 00                	add    BYTE PTR [eax],al
     7d3:	0a 2c 02             	or     ch,BYTE PTR [edx+eax*1]
     7d6:	00 00                	add    BYTE PTR [eax],al
     7d8:	01 25 9d 00 00 00    	add    DWORD PTR ds:0x9d,esp
     7de:	02 91 00 0a aa 02    	add    dl,BYTE PTR [ecx+0x2aa0a00]
     7e4:	00 00                	add    BYTE PTR [eax],al
     7e6:	01 25 3a 00 00 00    	add    DWORD PTR ds:0x3a,esp
     7ec:	02 91 04 0a 08 02    	add    dl,BYTE PTR [ecx+0x2080a04]
     7f2:	00 00                	add    BYTE PTR [eax],al
     7f4:	01 25 3a 00 00 00    	add    DWORD PTR ds:0x3a,esp
     7fa:	02 91 08 0c 90 02    	add    dl,BYTE PTR [ecx+0x2900c08]
     800:	00 00                	add    BYTE PTR [eax],al
     802:	01 27                	add    DWORD PTR [edi],esp
     804:	25 00 00 00 02       	and    eax,0x2000000
     809:	91                   	xchg   ecx,eax
     80a:	6b 10 6c             	imul   edx,DWORD PTR [eax],0x6c
     80d:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     80f:	00 01                	add    BYTE PTR [ecx],al
     811:	28 3a                	sub    BYTE PTR [edx],bh
     813:	00 00                	add    BYTE PTR [eax],al
     815:	00 02                	add    BYTE PTR [edx],al
     817:	91                   	xchg   ecx,eax
     818:	6c                   	ins    BYTE PTR es:[edi],dx
     819:	0c 77                	or     al,0x77
     81b:	03 00                	add    eax,DWORD PTR [eax]
     81d:	00 01                	add    BYTE PTR [ecx],al
     81f:	29 85 01 00 00 02    	sub    DWORD PTR [ebp+0x2000001],eax
     825:	91                   	xchg   ecx,eax
     826:	69 12 33 02 00 00    	imul   edx,DWORD PTR [edx],0x233
     82c:	01 2e                	add    DWORD PTR [esi],ebp
     82e:	19 04 00             	sbb    DWORD PTR [eax+eax*1],eax
     831:	30 00                	xor    BYTE PTR [eax],al
     833:	13 3f                	adc    edi,DWORD PTR [edi]
     835:	00 00                	add    BYTE PTR [eax],al
     837:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     83a:	56                   	push   esi
     83b:	00 00                	add    BYTE PTR [eax],al
     83d:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
     843:	30 13                	xor    BYTE PTR [ebx],dl
     845:	aa                   	stos   BYTE PTR es:[edi],al
     846:	00 00                	add    BYTE PTR [eax],al
     848:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     84f:	05 03 70 3a 00       	add    eax,0x3a7003
     854:	30 13                	xor    BYTE PTR [ebx],dl
     856:	56                   	push   esi
     857:	01 00                	add    DWORD PTR [eax],eax
     859:	00 04 36             	add    BYTE PTR [esi+esi*1],al
     85c:	56                   	push   esi
     85d:	00 00                	add    BYTE PTR [eax],al
     85f:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
     865:	30 13                	xor    BYTE PTR [ebx],dl
     867:	48                   	dec    eax
     868:	00 00                	add    BYTE PTR [eax],al
     86a:	00 05 38 84 00 00    	add    BYTE PTR ds:0x8438,al
     870:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
     876:	30 00                	xor    BYTE PTR [eax],al
     878:	ca 05 00             	retf   0x5
     87b:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     87e:	a9 03 00 00 04       	test   eax,0x4000003
     883:	01 ef                	add    edi,ebp
     885:	00 00                	add    BYTE PTR [eax],al
     887:	00 0c cd 04 00 00 6d 	add    BYTE PTR [ecx*8+0x6d000004],cl
     88e:	00 00                	add    BYTE PTR [eax],al
     890:	00 98 04 00 30 6c    	add    BYTE PTR [eax+0x6c300004],bl
     896:	03 00                	add    eax,DWORD PTR [eax]
     898:	00 00                	add    BYTE PTR [eax],al
     89a:	05 00 00 02 7a       	add    eax,0x7a020000
     89f:	04 00                	add    al,0x0
     8a1:	00 02                	add    BYTE PTR [edx],al
     8a3:	28 30                	sub    BYTE PTR [eax],dh
     8a5:	00 00                	add    BYTE PTR [eax],al
     8a7:	00 03                	add    BYTE PTR [ebx],al
     8a9:	04 d8                	add    al,0xd8
     8ab:	03 00                	add    eax,DWORD PTR [eax]
     8ad:	00 3a                	add    BYTE PTR [edx],bh
     8af:	00 00                	add    BYTE PTR [eax],al
     8b1:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     8b4:	06                   	push   es
     8b5:	58                   	pop    eax
     8b6:	00 00                	add    BYTE PTR [eax],al
     8b8:	00 02                	add    BYTE PTR [edx],al
     8ba:	81 04 00 00 02 62 25 	add    DWORD PTR [eax+eax*1],0x25620200
     8c1:	00 00                	add    BYTE PTR [eax],al
     8c3:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     8c6:	06                   	push   es
     8c7:	51                   	push   ecx
     8c8:	00 00                	add    BYTE PTR [eax],al
     8ca:	00 04 02             	add    BYTE PTR [edx+eax*1],al
     8cd:	05 e5 00 00 00       	add    eax,0xe5
     8d2:	05 04 05 69 6e       	add    eax,0x6e690504
     8d7:	74 00                	je     8d9 <sysEnter_Vector-0x12f727>
     8d9:	04 08                	add    al,0x8
     8db:	05 00 00 00 00       	add    eax,0x0
     8e0:	04 01                	add    al,0x1
     8e2:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
     8e5:	00 00                	add    BYTE PTR [eax],al
     8e7:	04 02                	add    al,0x2
     8e9:	07                   	pop    es
     8ea:	0e                   	push   cs
     8eb:	00 00                	add    BYTE PTR [eax],al
     8ed:	00 02                	add    BYTE PTR [edx],al
     8ef:	64 00 00             	add    BYTE PTR fs:[eax],al
     8f2:	00 03                	add    BYTE PTR [ebx],al
     8f4:	34 81                	xor    al,0x81
     8f6:	00 00                	add    BYTE PTR [eax],al
     8f8:	00 04 04             	add    BYTE PTR [esp+eax*1],al
     8fb:	07                   	pop    es
     8fc:	32 00                	xor    al,BYTE PTR [eax]
     8fe:	00 00                	add    BYTE PTR [eax],al
     900:	04 08                	add    al,0x8
     902:	07                   	pop    es
     903:	28 00                	sub    BYTE PTR [eax],al
     905:	00 00                	add    BYTE PTR [eax],al
     907:	02 9e 03 00 00 04    	add    bl,BYTE PTR [esi+0x4000003]
     90d:	d8 81 00 00 00 04    	fadd   DWORD PTR [ecx+0x4000000]
     913:	04 05                	add    al,0x5
     915:	05 00 00 00 04       	add    eax,0x4000000
     91a:	0c 04                	or     al,0x4
     91c:	96                   	xchg   esi,eax
     91d:	00 00                	add    BYTE PTR [eax],al
     91f:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     922:	02 90 00 00 00 02    	add    dl,BYTE PTR [eax+0x2000000]
     928:	5d                   	pop    ebp
     929:	00 00                	add    BYTE PTR [eax],al
     92b:	00 05 2a 9a 00 00    	add    BYTE PTR ds:0x9a2a,al
     931:	00 06                	add    BYTE PTR [esi],al
     933:	74 6d                	je     9a2 <sysEnter_Vector-0x12f65e>
     935:	00 2c 05 2c 4a 01 00 	add    BYTE PTR [eax*1+0x14a2c],ch
     93c:	00 07                	add    BYTE PTR [edi],al
     93e:	00 05 00 00 05 2e    	add    BYTE PTR ds:0x2e050000,al
     944:	5a                   	pop    edx
     945:	00 00                	add    BYTE PTR [eax],al
     947:	00 00                	add    BYTE PTR [eax],al
     949:	07                   	pop    es
     94a:	65                   	gs
     94b:	04 00                	add    al,0x0
     94d:	00 05 2f 5a 00 00    	add    BYTE PTR ds:0x5a2f,al
     953:	00 04 07             	add    BYTE PTR [edi+eax*1],al
     956:	96                   	xchg   esi,eax
     957:	03 00                	add    eax,DWORD PTR [eax]
     959:	00 05 30 5a 00 00    	add    BYTE PTR ds:0x5a30,al
     95f:	00 08                	add    BYTE PTR [eax],cl
     961:	07                   	pop    es
     962:	eb 04                	jmp    968 <sysEnter_Vector-0x12f698>
     964:	00 00                	add    BYTE PTR [eax],al
     966:	05 31 5a 00 00       	add    eax,0x5a31
     96b:	00 0c 07             	add    BYTE PTR [edi+eax*1],cl
     96e:	ea 03 00 00 05 32 5a 	jmp    0x5a32:0x5000003
     975:	00 00                	add    BYTE PTR [eax],al
     977:	00 10                	add    BYTE PTR [eax],dl
     979:	07                   	pop    es
     97a:	f1                   	icebp  
     97b:	03 00                	add    eax,DWORD PTR [eax]
     97d:	00 05 33 5a 00 00    	add    BYTE PTR ds:0x5a33,al
     983:	00 14 07             	add    BYTE PTR [edi+eax*1],dl
     986:	e3 04                	jecxz  98c <sysEnter_Vector-0x12f674>
     988:	00 00                	add    BYTE PTR [eax],al
     98a:	05 34 5a 00 00       	add    eax,0x5a34
     98f:	00 18                	add    BYTE PTR [eax],bl
     991:	07                   	pop    es
     992:	72 04                	jb     998 <sysEnter_Vector-0x12f668>
     994:	00 00                	add    BYTE PTR [eax],al
     996:	05 35 5a 00 00       	add    eax,0x5a35
     99b:	00 1c 07             	add    BYTE PTR [edi+eax*1],bl
     99e:	1c 04                	sbb    al,0x4
     9a0:	00 00                	add    BYTE PTR [eax],al
     9a2:	05 36 5a 00 00       	add    eax,0x5a36
     9a7:	00 20                	add    BYTE PTR [eax],ah
     9a9:	07                   	pop    es
     9aa:	ad                   	lods   eax,DWORD PTR ds:[esi]
     9ab:	04 00                	add    al,0x0
     9ad:	00 05 37 9a 00 00    	add    BYTE PTR ds:0x9a37,al
     9b3:	00 24 07             	add    BYTE PTR [edi+eax*1],ah
     9b6:	bb 03 00 00 05       	mov    ebx,0x5000003
     9bb:	38 4a 01             	cmp    BYTE PTR [edx+0x1],cl
     9be:	00 00                	add    BYTE PTR [eax],al
     9c0:	28 00                	sub    BYTE PTR [eax],al
     9c2:	08 04 50             	or     BYTE PTR [eax+edx*2],al
     9c5:	01 00                	add    DWORD PTR [eax],eax
     9c7:	00 09                	add    BYTE PTR [ecx],cl
     9c9:	3a 00                	cmp    al,BYTE PTR [eax]
     9cb:	00 00                	add    BYTE PTR [eax],al
     9cd:	04 04                	add    al,0x4
     9cf:	07                   	pop    es
     9d0:	2d 00 00 00 04       	sub    eax,0x4000000
     9d5:	04 07                	add    al,0x7
     9d7:	dc 00                	fadd   QWORD PTR [eax]
     9d9:	00 00                	add    BYTE PTR [eax],al
     9db:	0a 04 08             	or     al,BYTE PTR [eax+ecx*1]
     9de:	04 3a                	add    al,0x3a
     9e0:	00 00                	add    BYTE PTR [eax],al
     9e2:	00 0b                	add    BYTE PTR [ebx],cl
     9e4:	5e                   	pop    esi
     9e5:	02 00                	add    al,BYTE PTR [eax]
     9e7:	00 04 81             	add    BYTE PTR [ecx+eax*4],al
     9ea:	00 00                	add    BYTE PTR [eax],al
     9ec:	00 08                	add    BYTE PTR [eax],cl
     9ee:	15 f9 01 00 00       	adc    eax,0x1f9
     9f3:	0c 44                	or     al,0x44
     9f5:	03 00                	add    eax,DWORD PTR [eax]
     9f7:	00 00                	add    BYTE PTR [eax],al
     9f9:	0c ed                	or     al,0xed
     9fb:	02 00                	add    al,BYTE PTR [eax]
     9fd:	00 01                	add    BYTE PTR [ecx],al
     9ff:	0c d3                	or     al,0xd3
     a01:	02 00                	add    al,BYTE PTR [eax]
     a03:	00 03                	add    BYTE PTR [ebx],al
     a05:	0c 36                	or     al,0x36
     a07:	03 00                	add    eax,DWORD PTR [eax]
     a09:	00 04 0c             	add    BYTE PTR [esp+ecx*1],al
     a0c:	3d 02 00 00 4f       	cmp    eax,0x4f000002
     a11:	0c e0                	or     al,0xe0
     a13:	02 00                	add    al,BYTE PTR [eax]
     a15:	00 59 0c             	add    BYTE PTR [ecx+0xc],bl
     a18:	68 02 00 00 61       	push   0x61000002
     a1d:	0c 63                	or     al,0x63
     a1f:	03 00                	add    eax,DWORD PTR [eax]
     a21:	00 97 0d 05 03 00    	add    BYTE PTR [edi+0x3050d],dl
     a27:	00 63 01             	add    BYTE PTR [ebx+0x1],ah
     a2a:	0d 1c 03 00 00       	or     eax,0x31c
     a2f:	64 01 0d c0 02 00 00 	add    DWORD PTR fs:0x2c0,ecx
     a36:	65 01 0d 97 02 00 00 	add    DWORD PTR gs:0x297,ecx
     a3d:	66 01 0d 7b 02 00 00 	add    WORD PTR ds:0x27b,cx
     a44:	67 01 0d             	add    DWORD PTR [di],ecx
     a47:	29 03                	sub    DWORD PTR [ebx],eax
     a49:	00 00                	add    BYTE PTR [eax],al
     a4b:	68 01 0d 54 03       	push   0x3540d01
     a50:	00 00                	add    BYTE PTR [eax],al
     a52:	69 01 0d 0f 02 00    	imul   eax,DWORD PTR [ecx],0x20f0d
     a58:	00 70 01             	add    BYTE PTR [eax+0x1],dh
     a5b:	0d 81 03 00 00       	or     eax,0x381
     a60:	00 03                	add    BYTE PTR [ebx],al
     a62:	0d b1 02 00 00       	or     eax,0x2b1
     a67:	01 03                	add    DWORD PTR [ebx],eax
     a69:	0d 20 02 00 00       	or     eax,0x220
     a6e:	02 03                	add    al,BYTE PTR [ebx]
     a70:	00 0e                	add    BYTE PTR [esi],cl
     a72:	49                   	dec    ecx
     a73:	04 00                	add    al,0x0
     a75:	00 01                	add    BYTE PTR [ecx],al
     a77:	0f 5a 00             	cvtps2pd xmm0,QWORD PTR [eax]
     a7a:	00 00                	add    BYTE PTR [eax],al
     a7c:	98                   	cwde   
     a7d:	04 00                	add    al,0x0
     a7f:	30 35 00 00 00 01    	xor    BYTE PTR ds:0x1000000,dh
     a85:	9c                   	pushf  
     a86:	59                   	pop    ecx
     a87:	02 00                	add    al,BYTE PTR [eax]
     a89:	00 0f                	add    BYTE PTR [edi],cl
     a8b:	14 04                	adc    al,0x4
     a8d:	00 00                	add    BYTE PTR [eax],al
     a8f:	01 0f                	add    DWORD PTR [edi],ecx
     a91:	5a                   	pop    edx
     a92:	00 00                	add    BYTE PTR [eax],al
     a94:	00 02                	add    BYTE PTR [edx],al
     a96:	91                   	xchg   ecx,eax
     a97:	00 0f                	add    BYTE PTR [edi],cl
     a99:	91                   	xchg   ecx,eax
     a9a:	04 00                	add    al,0x0
     a9c:	00 01                	add    BYTE PTR [ecx],al
     a9e:	0f 76 00             	pcmpeqd mm0,QWORD PTR [eax]
     aa1:	00 00                	add    BYTE PTR [eax],al
     aa3:	02 91 04 0f 98 04    	add    dl,BYTE PTR [ecx+0x4980f04]
     aa9:	00 00                	add    BYTE PTR [eax],al
     aab:	01 0f                	add    DWORD PTR [edi],ecx
     aad:	76 00                	jbe    aaf <sysEnter_Vector-0x12f551>
     aaf:	00 00                	add    BYTE PTR [eax],al
     ab1:	02 91 08 0f 9f 04    	add    dl,BYTE PTR [ecx+0x49f0f08]
     ab7:	00 00                	add    BYTE PTR [eax],al
     ab9:	01 0f                	add    DWORD PTR [edi],ecx
     abb:	76 00                	jbe    abd <sysEnter_Vector-0x12f543>
     abd:	00 00                	add    BYTE PTR [eax],al
     abf:	02 91 0c 10 8f 03    	add    dl,BYTE PTR [ecx+0x38f100c]
     ac5:	00 00                	add    BYTE PTR [eax],al
     ac7:	01 11                	add    DWORD PTR [ecx],edx
     ac9:	5a                   	pop    edx
     aca:	00 00                	add    BYTE PTR [eax],al
     acc:	00 02                	add    BYTE PTR [edx],al
     ace:	91                   	xchg   ecx,eax
     acf:	70 00                	jo     ad1 <sysEnter_Vector-0x12f52f>
     ad1:	0e                   	push   cs
     ad2:	3d 04 00 00 01       	cmp    eax,0x1000004
     ad7:	16                   	push   ss
     ad8:	5a                   	pop    edx
     ad9:	00 00                	add    BYTE PTR [eax],al
     adb:	00 cd                	add    ch,cl
     add:	04 00                	add    al,0x0
     adf:	30 34 00             	xor    BYTE PTR [eax+eax*1],dh
     ae2:	00 00                	add    BYTE PTR [eax],al
     ae4:	01 9c ab 02 00 00 0f 	add    DWORD PTR [ebx+ebp*4+0xf000002],ebx
     aeb:	14 04                	adc    al,0x4
     aed:	00 00                	add    BYTE PTR [eax],al
     aef:	01 16                	add    DWORD PTR [esi],edx
     af1:	5a                   	pop    edx
     af2:	00 00                	add    BYTE PTR [eax],al
     af4:	00 02                	add    BYTE PTR [edx],al
     af6:	91                   	xchg   ecx,eax
     af7:	00 0f                	add    BYTE PTR [edi],cl
     af9:	91                   	xchg   ecx,eax
     afa:	04 00                	add    al,0x0
     afc:	00 01                	add    BYTE PTR [ecx],al
     afe:	16                   	push   ss
     aff:	76 00                	jbe    b01 <sysEnter_Vector-0x12f4ff>
     b01:	00 00                	add    BYTE PTR [eax],al
     b03:	02 91 04 0f 98 04    	add    dl,BYTE PTR [ecx+0x4980f04]
     b09:	00 00                	add    BYTE PTR [eax],al
     b0b:	01 16                	add    DWORD PTR [esi],edx
     b0d:	76 00                	jbe    b0f <sysEnter_Vector-0x12f4f1>
     b0f:	00 00                	add    BYTE PTR [eax],al
     b11:	02 91 08 10 8f 03    	add    dl,BYTE PTR [ecx+0x38f1008]
     b17:	00 00                	add    BYTE PTR [eax],al
     b19:	01 18                	add    DWORD PTR [eax],ebx
     b1b:	5a                   	pop    edx
     b1c:	00 00                	add    BYTE PTR [eax],al
     b1e:	00 02                	add    BYTE PTR [edx],al
     b20:	91                   	xchg   ecx,eax
     b21:	70 00                	jo     b23 <sysEnter_Vector-0x12f4dd>
     b23:	0e                   	push   cs
     b24:	31 04 00             	xor    DWORD PTR [eax+eax*1],eax
     b27:	00 01                	add    BYTE PTR [ecx],al
     b29:	1d 5a 00 00 00       	sbb    eax,0x5a
     b2e:	01 05 00 30 31 00    	add    DWORD PTR ds:0x313000,eax
     b34:	00 00                	add    BYTE PTR [eax],al
     b36:	01 9c ef 02 00 00 0f 	add    DWORD PTR [edi+ebp*8+0xf000002],ebx
     b3d:	14 04                	adc    al,0x4
     b3f:	00 00                	add    BYTE PTR [eax],al
     b41:	01 1d 5a 00 00 00    	add    DWORD PTR ds:0x5a,ebx
     b47:	02 91 00 0f 91 04    	add    dl,BYTE PTR [ecx+0x4910f00]
     b4d:	00 00                	add    BYTE PTR [eax],al
     b4f:	01 1d 76 00 00 00    	add    DWORD PTR ds:0x76,ebx
     b55:	02 91 04 10 8f 03    	add    dl,BYTE PTR [ecx+0x38f1004]
     b5b:	00 00                	add    BYTE PTR [eax],al
     b5d:	01 1f                	add    DWORD PTR [edi],ebx
     b5f:	5a                   	pop    edx
     b60:	00 00                	add    BYTE PTR [eax],al
     b62:	00 02                	add    BYTE PTR [edx],al
     b64:	91                   	xchg   ecx,eax
     b65:	70 00                	jo     b67 <sysEnter_Vector-0x12f499>
     b67:	0e                   	push   cs
     b68:	25 04 00 00 01       	and    eax,0x1000004
     b6d:	24 5a                	and    al,0x5a
     b6f:	00 00                	add    BYTE PTR [eax],al
     b71:	00 32                	add    BYTE PTR [edx],dh
     b73:	05 00 30 27 00       	add    eax,0x273000
     b78:	00 00                	add    BYTE PTR [eax],al
     b7a:	01 9c 25 03 00 00 0f 	add    DWORD PTR [ebp+eiz*1+0xf000003],ebx
     b81:	14 04                	adc    al,0x4
     b83:	00 00                	add    BYTE PTR [eax],al
     b85:	01 24 5a             	add    DWORD PTR [edx+ebx*2],esp
     b88:	00 00                	add    BYTE PTR [eax],al
     b8a:	00 02                	add    BYTE PTR [edx],al
     b8c:	91                   	xchg   ecx,eax
     b8d:	00 10                	add    BYTE PTR [eax],dl
     b8f:	8f 03                	pop    DWORD PTR [ebx]
     b91:	00 00                	add    BYTE PTR [eax],al
     b93:	01 26                	add    DWORD PTR [esi],esp
     b95:	5a                   	pop    edx
     b96:	00 00                	add    BYTE PTR [eax],al
     b98:	00 02                	add    BYTE PTR [edx],al
     b9a:	91                   	xchg   ecx,eax
     b9b:	74 00                	je     b9d <sysEnter_Vector-0x12f463>
     b9d:	11 c8                	adc    eax,ecx
     b9f:	03 00                	add    eax,DWORD PTR [eax]
     ba1:	00 01                	add    BYTE PTR [ecx],al
     ba3:	2b 59 05             	sub    ebx,DWORD PTR [ecx+0x5]
     ba6:	00 30                	add    BYTE PTR [eax],dh
     ba8:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
     ba9:	00 00                	add    BYTE PTR [eax],al
     bab:	00 01                	add    BYTE PTR [ecx],al
     bad:	9c                   	pushf  
     bae:	11 f3                	adc    ebx,esi
     bb0:	04 00                	add    al,0x0
     bb2:	00 01                	add    BYTE PTR [ecx],al
     bb4:	3b fd                	cmp    edi,ebp
     bb6:	05 00 30 1f 00       	add    eax,0x1f3000
     bbb:	00 00                	add    BYTE PTR [eax],al
     bbd:	01 9c 12 d2 03 00 00 	add    DWORD PTR [edx+edx*1+0x3d2],ebx
     bc4:	01 40 5a             	add    DWORD PTR [eax+0x5a],eax
     bc7:	00 00                	add    BYTE PTR [eax],al
     bc9:	00 1c 06             	add    BYTE PTR [esi+eax*1],bl
     bcc:	00 30                	add    BYTE PTR [eax],dh
     bce:	34 00                	xor    al,0x0
     bd0:	00 00                	add    BYTE PTR [eax],al
     bd2:	01 9c 7e 03 00 00 0f 	add    DWORD PTR [esi+edi*2+0xf000003],ebx
     bd9:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     bda:	04 00                	add    al,0x0
     bdc:	00 01                	add    BYTE PTR [ecx],al
     bde:	40                   	inc    eax
     bdf:	4a                   	dec    edx
     be0:	01 00                	add    DWORD PTR [eax],eax
     be2:	00 02                	add    BYTE PTR [edx],al
     be4:	91                   	xchg   ecx,eax
     be5:	00 13                	add    BYTE PTR [ebx],dl
     be7:	10 24 05 00 00 01 42 	adc    BYTE PTR [eax*1+0x42010000],ah
     bee:	41                   	inc    ecx
     bef:	00 00                	add    BYTE PTR [eax],al
     bf1:	00 02                	add    BYTE PTR [edx],al
     bf3:	91                   	xchg   ecx,eax
     bf4:	74 00                	je     bf6 <sysEnter_Vector-0x12f40a>
     bf6:	12 29                	adc    ch,BYTE PTR [ecx]
     bf8:	05 00 00 01 48       	add    eax,0x48010000
     bfd:	5a                   	pop    edx
     bfe:	00 00                	add    BYTE PTR [eax],al
     c00:	00 50 06             	add    BYTE PTR [eax+0x6],dl
     c03:	00 30                	add    BYTE PTR [eax],dh
     c05:	34 00                	xor    al,0x0
     c07:	00 00                	add    BYTE PTR [eax],al
     c09:	01 9c b5 03 00 00 0f 	add    DWORD PTR [ebp+esi*4+0xf000003],ebx
     c10:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     c11:	04 00                	add    al,0x0
     c13:	00 01                	add    BYTE PTR [ecx],al
     c15:	48                   	dec    eax
     c16:	4a                   	dec    edx
     c17:	01 00                	add    DWORD PTR [eax],eax
     c19:	00 02                	add    BYTE PTR [edx],al
     c1b:	91                   	xchg   ecx,eax
     c1c:	00 13                	add    BYTE PTR [ebx],dl
     c1e:	10 24 05 00 00 01 4a 	adc    BYTE PTR [eax*1+0x4a010000],ah
     c25:	41                   	inc    ecx
     c26:	00 00                	add    BYTE PTR [eax],al
     c28:	00 02                	add    BYTE PTR [edx],al
     c2a:	91                   	xchg   ecx,eax
     c2b:	74 00                	je     c2d <sysEnter_Vector-0x12f3d3>
     c2d:	0e                   	push   cs
     c2e:	89 04 00             	mov    DWORD PTR [eax+eax*1],eax
     c31:	00 01                	add    BYTE PTR [ecx],al
     c33:	50                   	push   eax
     c34:	5a                   	pop    edx
     c35:	00 00                	add    BYTE PTR [eax],al
     c37:	00 84 06 00 30 37 00 	add    BYTE PTR [esi+eax*1+0x373000],al
     c3e:	00 00                	add    BYTE PTR [eax],al
     c40:	01 9c fa 03 00 00 0f 	add    DWORD PTR [edx+edi*8+0xf000003],ebx
     c47:	09 04 00             	or     DWORD PTR [eax+eax*1],eax
     c4a:	00 01                	add    BYTE PTR [ecx],al
     c4c:	50                   	push   eax
     c4d:	76 00                	jbe    c4f <sysEnter_Vector-0x12f3b1>
     c4f:	00 00                	add    BYTE PTR [eax],al
     c51:	02 91 00 0f a6 04    	add    dl,BYTE PTR [ecx+0x4a60f00]
     c57:	00 00                	add    BYTE PTR [eax],al
     c59:	01 50 4a             	add    DWORD PTR [eax+0x4a],edx
     c5c:	01 00                	add    DWORD PTR [eax],eax
     c5e:	00 02                	add    BYTE PTR [edx],al
     c60:	91                   	xchg   ecx,eax
     c61:	04 13                	add    al,0x13
     c63:	10 24 05 00 00 01 52 	adc    BYTE PTR [eax*1+0x52010000],ah
     c6a:	41                   	inc    ecx
     c6b:	00 00                	add    BYTE PTR [eax],al
     c6d:	00 02                	add    BYTE PTR [edx],al
     c6f:	91                   	xchg   ecx,eax
     c70:	70 00                	jo     c72 <sysEnter_Vector-0x12f38e>
     c72:	0e                   	push   cs
     c73:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
     c74:	03 00                	add    eax,DWORD PTR [eax]
     c76:	00 01                	add    BYTE PTR [ecx],al
     c78:	58                   	pop    eax
     c79:	81 00 00 00 bb 06    	add    DWORD PTR [eax],0x6bb0000
     c7f:	00 30                	add    BYTE PTR [eax],dh
     c81:	4e                   	dec    esi
     c82:	00 00                	add    BYTE PTR [eax],al
     c84:	00 01                	add    BYTE PTR [ecx],al
     c86:	9c                   	pushf  
     c87:	39 04 00             	cmp    DWORD PTR [eax+eax*1],eax
     c8a:	00 0f                	add    BYTE PTR [edi],cl
     c8c:	c3                   	ret    
     c8d:	04 00                	add    al,0x0
     c8f:	00 01                	add    BYTE PTR [ecx],al
     c91:	58                   	pop    eax
     c92:	81 00 00 00 02 91    	add    DWORD PTR [eax],0x91020000
     c98:	00 14 cc             	add    BYTE PTR [esp+ecx*8],dl
     c9b:	06                   	push   es
     c9c:	00 30                	add    BYTE PTR [eax],dh
     c9e:	32 00                	xor    al,BYTE PTR [eax]
     ca0:	00 00                	add    BYTE PTR [eax],al
     ca2:	15 63 74 00 01       	adc    eax,0x1007463
     ca7:	5a                   	pop    edx
     ca8:	76 00                	jbe    caa <sysEnter_Vector-0x12f356>
     caa:	00 00                	add    BYTE PTR [eax],al
     cac:	02 91 70 00 00 16    	add    dl,BYTE PTR [ecx+0x16000070]
     cb2:	30 05 00 00 01 5e    	xor    BYTE PTR ds:0x5e010000,al
     cb8:	09 07                	or     DWORD PTR [edi],eax
     cba:	00 30                	add    BYTE PTR [eax],dh
     cbc:	1d 00 00 00 01       	sbb    eax,0x1000000
     cc1:	9c                   	pushf  
     cc2:	17                   	pop    ss
     cc3:	17                   	pop    ss
     cc4:	05 00 00 01 63       	add    eax,0x63010000
     cc9:	26                   	es
     cca:	07                   	pop    es
     ccb:	00 30                	add    BYTE PTR [eax],dh
     ccd:	29 00                	sub    DWORD PTR [eax],eax
     ccf:	00 00                	add    BYTE PTR [eax],al
     cd1:	01 9c 8a 04 00 00 0f 	add    DWORD PTR [edx+ecx*4+0xf000004],ebx
     cd8:	b7 04                	mov    bh,0x4
     cda:	00 00                	add    BYTE PTR [eax],al
     cdc:	01 63 5a             	add    DWORD PTR [ebx+0x5a],esp
     cdf:	00 00                	add    BYTE PTR [eax],al
     ce1:	00 02                	add    BYTE PTR [edx],al
     ce3:	91                   	xchg   ecx,eax
     ce4:	00 0f                	add    BYTE PTR [edi],cl
     ce6:	0c 05                	or     al,0x5
     ce8:	00 00                	add    BYTE PTR [eax],al
     cea:	01 63 63             	add    DWORD PTR [ebx+0x63],esp
     ced:	01 00                	add    DWORD PTR [eax],eax
     cef:	00 02                	add    BYTE PTR [edx],al
     cf1:	91                   	xchg   ecx,eax
     cf2:	04 0f                	add    al,0xf
     cf4:	ab                   	stos   DWORD PTR es:[edi],eax
     cf5:	03 00                	add    eax,DWORD PTR [eax]
     cf7:	00 01                	add    BYTE PTR [ecx],al
     cf9:	63 5a 00             	arpl   WORD PTR [edx+0x0],bx
     cfc:	00 00                	add    BYTE PTR [eax],al
     cfe:	02 91 08 00 0e be    	add    dl,BYTE PTR [ecx-0x41f1fff8]
     d04:	04 00                	add    al,0x0
     d06:	00 01                	add    BYTE PTR [ecx],al
     d08:	68 5a 00 00 00       	push   0x5a
     d0d:	4f                   	dec    edi
     d0e:	07                   	pop    es
     d0f:	00 30                	add    BYTE PTR [eax],dh
     d11:	36 00 00             	add    BYTE PTR ss:[eax],al
     d14:	00 01                	add    BYTE PTR [ecx],al
     d16:	9c                   	pushf  
     d17:	dc 04 00             	fadd   QWORD PTR [eax+eax*1]
     d1a:	00 0f                	add    BYTE PTR [edi],cl
     d1c:	10 08                	adc    BYTE PTR [eax],cl
     d1e:	00 00                	add    BYTE PTR [eax],al
     d20:	01 68 65             	add    DWORD PTR [eax+0x65],ebp
     d23:	01 00                	add    DWORD PTR [eax],eax
     d25:	00 02                	add    BYTE PTR [edx],al
     d27:	91                   	xchg   ecx,eax
     d28:	00 0f                	add    BYTE PTR [edi],cl
     d2a:	de 04 00             	fiadd  WORD PTR [eax+eax*1]
     d2d:	00 01                	add    BYTE PTR [ecx],al
     d2f:	68 5a 00 00 00       	push   0x5a
     d34:	02 91 04 0f 07 05    	add    dl,BYTE PTR [ecx+0x5070f04]
     d3a:	00 00                	add    BYTE PTR [eax],al
     d3c:	01 68 dc             	add    DWORD PTR [eax-0x24],ebp
     d3f:	04 00                	add    al,0x0
     d41:	00 02                	add    BYTE PTR [edx],al
     d43:	91                   	xchg   ecx,eax
     d44:	08 15 70 69 64 00    	or     BYTE PTR ds:0x646970,dl
     d4a:	01 6a 5a             	add    DWORD PTR [edx+0x5a],ebp
     d4d:	00 00                	add    BYTE PTR [eax],al
     d4f:	00 02                	add    BYTE PTR [edx],al
     d51:	91                   	xchg   ecx,eax
     d52:	70 00                	jo     d54 <sysEnter_Vector-0x12f2ac>
     d54:	08 04 65 01 00 00 17 	or     BYTE PTR [eiz*2+0x17000001],al
     d5b:	01 04 00             	add    DWORD PTR [eax+eax*1],eax
     d5e:	00 01                	add    BYTE PTR [ecx],al
     d60:	73 85                	jae    ce7 <sysEnter_Vector-0x12f319>
     d62:	07                   	pop    es
     d63:	00 30                	add    BYTE PTR [eax],dh
     d65:	1d 00 00 00 01       	sbb    eax,0x1000000
     d6a:	9c                   	pushf  
     d6b:	06                   	push   es
     d6c:	05 00 00 18 70       	add    eax,0x70180000
     d71:	69 64 00 01 73 76 00 	imul   esp,DWORD PTR [eax+eax*1+0x1],0x7673
     d78:	00 
     d79:	00 02                	add    BYTE PTR [edx],al
     d7b:	91                   	xchg   ecx,eax
     d7c:	00 00                	add    BYTE PTR [eax],al
     d7e:	19 f9                	sbb    ecx,edi
     d80:	03 00                	add    eax,DWORD PTR [eax]
     d82:	00 01                	add    BYTE PTR [ecx],al
     d84:	78 3c                	js     dc2 <sysEnter_Vector-0x12f23e>
     d86:	05 00 00 a2 07       	add    eax,0x7a20000
     d8b:	00 30                	add    BYTE PTR [eax],dh
     d8d:	42                   	inc    edx
     d8e:	00 00                	add    BYTE PTR [eax],al
     d90:	00 01                	add    BYTE PTR [ecx],al
     d92:	9c                   	pushf  
     d93:	3c 05                	cmp    al,0x5
     d95:	00 00                	add    BYTE PTR [eax],al
     d97:	10 6c 04 00          	adc    BYTE PTR [esp+eax*1+0x0],ch
     d9b:	00 01                	add    BYTE PTR [ecx],al
     d9d:	7a 76                	jp     e15 <sysEnter_Vector-0x12f1eb>
     d9f:	00 00                	add    BYTE PTR [eax],al
     da1:	00 02                	add    BYTE PTR [edx],al
     da3:	91                   	xchg   ecx,eax
     da4:	6c                   	ins    BYTE PTR es:[edi],dx
     da5:	10 b3 03 00 00 01    	adc    BYTE PTR [ebx+0x1000003],dh
     dab:	7b ba                	jnp    d67 <sysEnter_Vector-0x12f299>
     dad:	00 00                	add    BYTE PTR [eax],al
     daf:	00 02                	add    BYTE PTR [edx],al
     db1:	91                   	xchg   ecx,eax
     db2:	40                   	inc    eax
     db3:	00 08                	add    BYTE PTR [eax],cl
     db5:	04 ba                	add    al,0xba
     db7:	00 00                	add    BYTE PTR [eax],al
     db9:	00 12                	add    BYTE PTR [edx],dl
     dbb:	35 05 00 00 01       	xor    eax,0x1000005
     dc0:	80 65 01 00          	and    BYTE PTR [ebp+0x1],0x0
     dc4:	00 e4                	add    ah,ah
     dc6:	07                   	pop    es
     dc7:	00 30                	add    BYTE PTR [eax],dh
     dc9:	20 00                	and    BYTE PTR [eax],al
     dcb:	00 00                	add    BYTE PTR [eax],al
     dcd:	01 9c 78 05 00 00 18 	add    DWORD PTR [eax+edi*2+0x18000005],ebx
     dd4:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
     dd7:	00 01                	add    BYTE PTR [ecx],al
     dd9:	80 65 01 00          	and    BYTE PTR [ebp+0x1],0x0
     ddd:	00 02                	add    BYTE PTR [edx],al
     ddf:	91                   	xchg   ecx,eax
     de0:	00 0f                	add    BYTE PTR [edi],cl
     de2:	c3                   	ret    
     de3:	03 00                	add    eax,DWORD PTR [eax]
     de5:	00 01                	add    BYTE PTR [ecx],al
     de7:	80 8f 00 00 00 02 91 	or     BYTE PTR [edi+0x2000000],0x91
     dee:	04 00                	add    al,0x0
     df0:	1a 3f                	sbb    bh,BYTE PTR [edi]
     df2:	00 00                	add    BYTE PTR [eax],al
     df4:	00 06                	add    BYTE PTR [esi],al
     df6:	34 76                	xor    al,0x76
     df8:	00 00                	add    BYTE PTR [eax],al
     dfa:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
     e00:	30 1a                	xor    BYTE PTR [edx],bl
     e02:	aa                   	stos   BYTE PTR es:[edi],al
     e03:	00 00                	add    BYTE PTR [eax],al
     e05:	00 06                	add    BYTE PTR [esi],al
     e07:	35 76 00 00 00       	xor    eax,0x76
     e0c:	05 03 70 3a 00       	add    eax,0x3a7003
     e11:	30 1a                	xor    BYTE PTR [edx],bl
     e13:	56                   	push   esi
     e14:	01 00                	add    DWORD PTR [eax],eax
     e16:	00 06                	add    BYTE PTR [esi],al
     e18:	36                   	ss
     e19:	76 00                	jbe    e1b <sysEnter_Vector-0x12f1e5>
     e1b:	00 00                	add    BYTE PTR [eax],al
     e1d:	05 03 68 3a 00       	add    eax,0x3a6803
     e22:	30 1a                	xor    BYTE PTR [edx],bl
     e24:	48                   	dec    eax
     e25:	00 00                	add    BYTE PTR [eax],al
     e27:	00 07                	add    BYTE PTR [edi],al
     e29:	38 af 00 00 00 05    	cmp    BYTE PTR [edi+0x5000000],ch
     e2f:	03 74 3a 00          	add    esi,DWORD PTR [edx+edi*1+0x0]
     e33:	30 1a                	xor    BYTE PTR [edx],bl
     e35:	55                   	push   ebp
     e36:	04 00                	add    al,0x0
     e38:	00 01                	add    BYTE PTR [ecx],al
     e3a:	0d a8 00 00 00       	or     eax,0xa8
     e3f:	05 03 7c 3a 00       	add    eax,0x3a7c03
     e44:	30 00                	xor    BYTE PTR [eax],al
     e46:	52                   	push   edx
     e47:	02 00                	add    al,BYTE PTR [eax]
     e49:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     e4c:	38 05 00 00 04 01    	cmp    BYTE PTR ds:0x1040000,al
     e52:	ef                   	out    dx,eax
     e53:	00 00                	add    BYTE PTR [eax],al
     e55:	00 0c d8             	add    BYTE PTR [eax+ebx*8],cl
     e58:	05 00 00 6d 00       	add    eax,0x6d0000
     e5d:	00 00                	add    BYTE PTR [eax],al
     e5f:	04 08                	add    al,0x8
     e61:	00 30                	add    BYTE PTR [eax],dh
     e63:	25 03 00 00 67       	and    eax,0x67000003
     e68:	06                   	push   es
     e69:	00 00                	add    BYTE PTR [eax],al
     e6b:	02 01                	add    al,BYTE PTR [ecx]
     e6d:	06                   	push   es
     e6e:	51                   	push   ecx
     e6f:	00 00                	add    BYTE PTR [eax],al
     e71:	00 02                	add    BYTE PTR [edx],al
     e73:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
     e79:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     e80:	02 08                	add    cl,BYTE PTR [eax]
     e82:	05 00 00 00 00       	add    eax,0x0
     e87:	04 70                	add    al,0x70
     e89:	05 00 00 02 2e       	add    eax,0x2e020000
     e8e:	4c                   	dec    esp
     e8f:	00 00                	add    BYTE PTR [eax],al
     e91:	00 02                	add    BYTE PTR [edx],al
     e93:	01 08                	add    DWORD PTR [eax],ecx
     e95:	4f                   	dec    edi
     e96:	00 00                	add    BYTE PTR [eax],al
     e98:	00 02                	add    BYTE PTR [edx],al
     e9a:	02 07                	add    al,BYTE PTR [edi]
     e9c:	0e                   	push   cs
     e9d:	00 00                	add    BYTE PTR [eax],al
     e9f:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
     ea2:	00 00                	add    BYTE PTR [eax],al
     ea4:	00 02                	add    BYTE PTR [edx],al
     ea6:	34 65                	xor    al,0x65
     ea8:	00 00                	add    BYTE PTR [eax],al
     eaa:	00 02                	add    BYTE PTR [edx],al
     eac:	04 07                	add    al,0x7
     eae:	32 00                	xor    al,BYTE PTR [eax]
     eb0:	00 00                	add    BYTE PTR [eax],al
     eb2:	02 08                	add    cl,BYTE PTR [eax]
     eb4:	07                   	pop    es
     eb5:	28 00                	sub    BYTE PTR [eax],al
     eb7:	00 00                	add    BYTE PTR [eax],al
     eb9:	04 9e                	add    al,0x9e
     ebb:	03 00                	add    eax,DWORD PTR [eax]
     ebd:	00 03                	add    BYTE PTR [ebx],al
     ebf:	d8 65 00             	fsub   DWORD PTR [ebp+0x0]
     ec2:	00 00                	add    BYTE PTR [eax],al
     ec4:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
     ecb:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
     ece:	96                   	xchg   esi,eax
     ecf:	00 00                	add    BYTE PTR [eax],al
     ed1:	00 05 8c 05 00 00    	add    BYTE PTR ds:0x58c,al
     ed7:	10 04 2c             	adc    BYTE PTR [esp+ebp*1],al
     eda:	c9                   	leave  
     edb:	00 00                	add    BYTE PTR [eax],al
     edd:	00 06                	add    BYTE PTR [esi],al
     edf:	69 05 00 00 04 2e 5a 	imul   eax,DWORD PTR ds:0x2e040000,0x5a
     ee6:	00 00 00 
     ee9:	00 07                	add    BYTE PTR [edi],al
     eeb:	6c                   	ins    BYTE PTR es:[edi],dx
     eec:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     eee:	00 04 2f             	add    BYTE PTR [edi+ebp*1],al
     ef1:	5a                   	pop    edx
     ef2:	00 00                	add    BYTE PTR [eax],al
     ef4:	00 04 06             	add    BYTE PTR [esi+eax*1],al
     ef7:	92                   	xchg   edx,eax
     ef8:	05 00 00 04 30       	add    eax,0x30040000
     efd:	c9                   	leave  
     efe:	00 00                	add    BYTE PTR [eax],al
     f00:	00 08                	add    BYTE PTR [eax],cl
     f02:	06                   	push   es
     f03:	e5 05                	in     eax,0x5
     f05:	00 00                	add    BYTE PTR [eax],al
     f07:	04 31                	add    al,0x31
     f09:	d0 00                	rol    BYTE PTR [eax],1
     f0b:	00 00                	add    BYTE PTR [eax],al
     f0d:	0c 00                	or     al,0x0
     f0f:	02 01                	add    al,BYTE PTR [ecx]
     f11:	02 90 00 00 00 08    	add    dl,BYTE PTR [eax+0x8000000]
     f17:	04 8c                	add    al,0x8c
     f19:	00 00                	add    BYTE PTR [eax],al
     f1b:	00 04 ea             	add    BYTE PTR [edx+ebp*8],al
     f1e:	05 00 00 04 32       	add    eax,0x32040000
     f23:	8c 00                	mov    WORD PTR [eax],es
     f25:	00 00                	add    BYTE PTR [eax],al
     f27:	02 01                	add    al,BYTE PTR [ecx]
     f29:	06                   	push   es
     f2a:	58                   	pop    eax
     f2b:	00 00                	add    BYTE PTR [eax],al
     f2d:	00 04 5d 00 00 00 05 	add    BYTE PTR [ebx*2+0x5000000],al
     f34:	2a 7e 00             	sub    bh,BYTE PTR [esi+0x0]
     f37:	00 00                	add    BYTE PTR [eax],al
     f39:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     f3c:	2d 00 00 00 02       	sub    eax,0x2000000
     f41:	04 07                	add    al,0x7
     f43:	dc 00                	fadd   QWORD PTR [eax]
     f45:	00 00                	add    BYTE PTR [eax],al
     f47:	09 04 0a             	or     DWORD PTR [edx+ecx*1],eax
     f4a:	98                   	cwde   
     f4b:	05 00 00 01 0c       	add    eax,0xc010000
     f50:	04 08                	add    al,0x8
     f52:	00 30                	add    BYTE PTR [eax],dh
     f54:	5c                   	pop    esp
     f55:	00 00                	add    BYTE PTR [eax],al
     f57:	00 01                	add    BYTE PTR [ecx],al
     f59:	9c                   	pushf  
     f5a:	0b b8 05 00 00 01    	or     edi,DWORD PTR [eax+0x1000005]
     f60:	14 5a                	adc    al,0x5a
     f62:	00 00                	add    BYTE PTR [eax],al
     f64:	00 60 08             	add    BYTE PTR [eax+0x8],ah
     f67:	00 30                	add    BYTE PTR [eax],dh
     f69:	87 00                	xchg   DWORD PTR [eax],eax
     f6b:	00 00                	add    BYTE PTR [eax],al
     f6d:	01 9c 4a 01 00 00 0c 	add    DWORD PTR [edx+ecx*2+0xc000001],ebx
     f74:	c3                   	ret    
     f75:	03 00                	add    eax,DWORD PTR [eax]
     f77:	00 01                	add    BYTE PTR [ecx],al
     f79:	14 73                	adc    al,0x73
     f7b:	00 00                	add    BYTE PTR [eax],al
     f7d:	00 02                	add    BYTE PTR [edx],al
     f7f:	91                   	xchg   ecx,eax
     f80:	00 0d 52 05 00 00    	add    BYTE PTR ds:0x552,cl
     f86:	01 18                	add    DWORD PTR [eax],ebx
     f88:	5a                   	pop    edx
     f89:	00 00                	add    BYTE PTR [eax],al
     f8b:	00 02                	add    BYTE PTR [edx],al
     f8d:	91                   	xchg   ecx,eax
     f8e:	74 00                	je     f90 <sysEnter_Vector-0x12f070>
     f90:	0e                   	push   cs
     f91:	9c                   	pushf  
     f92:	05 00 00 01 2c       	add    eax,0x2c010000
     f97:	01 01                	add    DWORD PTR [ecx],eax
     f99:	00 00                	add    BYTE PTR [eax],al
     f9b:	e7 08                	out    0x8,eax
     f9d:	00 30                	add    BYTE PTR [eax],dh
     f9f:	e3 01                	jecxz  fa2 <sysEnter_Vector-0x12f05e>
     fa1:	00 00                	add    BYTE PTR [eax],al
     fa3:	01 9c b8 01 00 00 0c 	add    DWORD PTR [eax+edi*4+0xc000001],ebx
     faa:	c3                   	ret    
     fab:	03 00                	add    eax,DWORD PTR [eax]
     fad:	00 01                	add    BYTE PTR [ecx],al
     faf:	2c 73                	sub    al,0x73
     fb1:	00 00                	add    BYTE PTR [eax],al
     fb3:	00 02                	add    BYTE PTR [edx],al
     fb5:	91                   	xchg   ecx,eax
     fb6:	00 0d 8f 03 00 00    	add    BYTE PTR ds:0x38f,cl
     fbc:	01 2e                	add    DWORD PTR [esi],ebp
     fbe:	01 01                	add    DWORD PTR [ecx],eax
     fc0:	00 00                	add    BYTE PTR [eax],al
     fc2:	02 91 60 0d 85 05    	add    dl,BYTE PTR [ecx+0x5850d60]
     fc8:	00 00                	add    BYTE PTR [eax],al
     fca:	01 30                	add    DWORD PTR [eax],esi
     fcc:	5a                   	pop    edx
     fcd:	00 00                	add    BYTE PTR [eax],al
     fcf:	00 02                	add    BYTE PTR [edx],al
     fd1:	91                   	xchg   ecx,eax
     fd2:	6c                   	ins    BYTE PTR es:[edi],dx
     fd3:	0d 3c 05 00 00       	or     eax,0x53c
     fd8:	01 31                	add    DWORD PTR [ecx],esi
     fda:	5a                   	pop    edx
     fdb:	00 00                	add    BYTE PTR [eax],al
     fdd:	00 02                	add    BYTE PTR [edx],al
     fdf:	91                   	xchg   ecx,eax
     fe0:	68 0d 7d 05 00       	push   0x57d0d
     fe5:	00 01                	add    BYTE PTR [ecx],al
     fe7:	32 b8 01 00 00 02    	xor    bh,BYTE PTR [eax+0x2000001]
     fed:	91                   	xchg   ecx,eax
     fee:	64                   	fs
     fef:	0d ac 05 00 00       	or     eax,0x5ac
     ff4:	01 33                	add    DWORD PTR [ebx],esi
     ff6:	be 01 00 00 02       	mov    esi,0x2000001
     ffb:	91                   	xchg   ecx,eax
     ffc:	5c                   	pop    esp
     ffd:	00 08                	add    BYTE PTR [eax],cl
     fff:	04 d6                	add    al,0xd6
    1001:	00 00                	add    BYTE PTR [eax],al
    1003:	00 08                	add    BYTE PTR [eax],cl
    1005:	04 41                	add    al,0x41
    1007:	00 00                	add    BYTE PTR [eax],al
    1009:	00 0f                	add    BYTE PTR [edi],cl
    100b:	78 05                	js     1012 <sysEnter_Vector-0x12efee>
    100d:	00 00                	add    BYTE PTR [eax],al
    100f:	01 53 ca             	add    DWORD PTR [ebx-0x36],edx
    1012:	0a 00                	or     al,BYTE PTR [eax]
    1014:	30 39                	xor    BYTE PTR [ecx],bh
    1016:	00 00                	add    BYTE PTR [eax],al
    1018:	00 01                	add    BYTE PTR [ecx],al
    101a:	9c                   	pushf  
    101b:	00 02                	add    BYTE PTR [edx],al
    101d:	00 00                	add    BYTE PTR [eax],al
    101f:	0c 49                	or     al,0x49
    1021:	05 00 00 01 53       	add    eax,0x53010000
    1026:	01 01                	add    DWORD PTR [ecx],eax
    1028:	00 00                	add    BYTE PTR [eax],al
    102a:	02 91 00 10 6d 70    	add    dl,BYTE PTR [ecx+0x706d1000]
    1030:	00 01                	add    BYTE PTR [ecx],al
    1032:	55                   	push   ebp
    1033:	b8 01 00 00 02       	mov    eax,0x2000001
    1038:	91                   	xchg   ecx,eax
    1039:	74 11                	je     104c <sysEnter_Vector-0x12efb4>
    103b:	a3 05 00 00 01       	mov    ds:0x1000005,eax
    1040:	5f                   	pop    edi
    1041:	f5                   	cmc    
    1042:	0a 00                	or     al,BYTE PTR [eax]
    1044:	30 00                	xor    BYTE PTR [eax],al
    1046:	12 5a 05             	adc    bl,BYTE PTR [edx+0x5]
    1049:	00 00                	add    BYTE PTR [eax],al
    104b:	01 65 03             	add    DWORD PTR [ebp+0x3],esp
    104e:	0b 00                	or     eax,DWORD PTR [eax]
    1050:	30 26                	xor    BYTE PTR [esi],ah
    1052:	00 00                	add    BYTE PTR [eax],al
    1054:	00 01                	add    BYTE PTR [ecx],al
    1056:	9c                   	pushf  
    1057:	13 3f                	adc    edi,DWORD PTR [edi]
    1059:	00 00                	add    BYTE PTR [eax],al
    105b:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    105e:	5a                   	pop    edx
    105f:	00 00                	add    BYTE PTR [eax],al
    1061:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    1067:	30 13                	xor    BYTE PTR [ebx],dl
    1069:	aa                   	stos   BYTE PTR es:[edi],al
    106a:	00 00                	add    BYTE PTR [eax],al
    106c:	00 04 35 5a 00 00 00 	add    BYTE PTR [esi*1+0x5a],al
    1073:	05 03 70 3a 00       	add    eax,0x3a7003
    1078:	30 13                	xor    BYTE PTR [ebx],dl
    107a:	56                   	push   esi
    107b:	01 00                	add    DWORD PTR [eax],eax
    107d:	00 04 36             	add    BYTE PTR [esi+esi*1],al
    1080:	5a                   	pop    edx
    1081:	00 00                	add    BYTE PTR [eax],al
    1083:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    1089:	30 13                	xor    BYTE PTR [ebx],dl
    108b:	48                   	dec    eax
    108c:	00 00                	add    BYTE PTR [eax],al
    108e:	00 06                	add    BYTE PTR [esi],al
    1090:	38 e8                	cmp    al,ch
    1092:	00 00                	add    BYTE PTR [eax],al
    1094:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
    109a:	30 00                	xor    BYTE PTR [eax],al
    109c:	de 01                	fiadd  WORD PTR [ecx]
    109e:	00 00                	add    BYTE PTR [eax],al
    10a0:	04 00                	add    al,0x0
    10a2:	75 06                	jne    10aa <sysEnter_Vector-0x12ef56>
    10a4:	00 00                	add    BYTE PTR [eax],al
    10a6:	04 01                	add    al,0x1
    10a8:	ef                   	out    dx,eax
    10a9:	00 00                	add    BYTE PTR [eax],al
    10ab:	00 0c f4             	add    BYTE PTR [esp+esi*8],cl
    10ae:	05 00 00 6d 00       	add    eax,0x6d0000
    10b3:	00 00                	add    BYTE PTR [eax],al
    10b5:	2c 0b                	sub    al,0xb
    10b7:	00 30                	add    BYTE PTR [eax],dh
    10b9:	9b                   	fwait
    10ba:	01 00                	add    DWORD PTR [eax],eax
    10bc:	00 84 07 00 00 02 01 	add    BYTE PTR [edi+eax*1+0x1020000],al
    10c3:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    10c6:	00 00                	add    BYTE PTR [eax],al
    10c8:	02 02                	add    al,BYTE PTR [edx]
    10ca:	07                   	pop    es
    10cb:	0e                   	push   cs
    10cc:	00 00                	add    BYTE PTR [eax],al
    10ce:	00 02                	add    BYTE PTR [edx],al
    10d0:	04 07                	add    al,0x7
    10d2:	32 00                	xor    al,BYTE PTR [eax]
    10d4:	00 00                	add    BYTE PTR [eax],al
    10d6:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
    10d9:	2d 00 00 00 02       	sub    eax,0x2000000
    10de:	01 06                	add    DWORD PTR [esi],eax
    10e0:	51                   	push   ecx
    10e1:	00 00                	add    BYTE PTR [eax],al
    10e3:	00 02                	add    BYTE PTR [edx],al
    10e5:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    10eb:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    10f2:	02 08                	add    cl,BYTE PTR [eax]
    10f4:	05 00 00 00 00       	add    eax,0x0
    10f9:	02 08                	add    cl,BYTE PTR [eax]
    10fb:	07                   	pop    es
    10fc:	28 00                	sub    BYTE PTR [eax],al
    10fe:	00 00                	add    BYTE PTR [eax],al
    1100:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1107:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
    110a:	dc 00                	fadd   QWORD PTR [eax]
    110c:	00 00                	add    BYTE PTR [eax],al
    110e:	04 04                	add    al,0x4
    1110:	05 04 7a 00 00       	add    eax,0x7a04
    1115:	00 02                	add    BYTE PTR [edx],al
    1117:	01 06                	add    DWORD PTR [esi],eax
    1119:	58                   	pop    eax
    111a:	00 00                	add    BYTE PTR [eax],al
    111c:	00 06                	add    BYTE PTR [esi],al
    111e:	64 00 00             	add    BYTE PTR fs:[eax],al
    1121:	00 02                	add    BYTE PTR [edx],al
    1123:	34 33                	xor    al,0x33
    1125:	00 00                	add    BYTE PTR [eax],al
    1127:	00 06                	add    BYTE PTR [esi],al
    1129:	5d                   	pop    ebp
    112a:	00 00                	add    BYTE PTR [eax],al
    112c:	00 03                	add    BYTE PTR [ebx],al
    112e:	2a 64 00 00          	sub    ah,BYTE PTR [eax+eax*1+0x0]
    1132:	00 05 04 9d 00 00    	add    BYTE PTR ds:0x9d04,al
    1138:	00 07                	add    BYTE PTR [edi],al
    113a:	7a 00                	jp     113c <sysEnter_Vector-0x12eec4>
    113c:	00 00                	add    BYTE PTR [eax],al
    113e:	06                   	push   es
    113f:	9e                   	sahf   
    1140:	03 00                	add    eax,DWORD PTR [eax]
    1142:	00 04 d8             	add    BYTE PTR [eax+ebx*8],al
    1145:	33 00                	xor    eax,DWORD PTR [eax]
    1147:	00 00                	add    BYTE PTR [eax],al
    1149:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    114c:	96                   	xchg   esi,eax
    114d:	00 00                	add    BYTE PTR [eax],al
    114f:	00 02                	add    BYTE PTR [edx],al
    1151:	01 02                	add    DWORD PTR [edx],eax
    1153:	90                   	nop
    1154:	00 00                	add    BYTE PTR [eax],al
    1156:	00 08                	add    BYTE PTR [eax],cl
    1158:	06                   	push   es
    1159:	06                   	push   es
    115a:	00 00                	add    BYTE PTR [eax],al
    115c:	01 0a                	add    DWORD PTR [edx],ecx
    115e:	72 00                	jb     1160 <sysEnter_Vector-0x12eea0>
    1160:	00 00                	add    BYTE PTR [eax],al
    1162:	2c 0b                	sub    al,0xb
    1164:	00 30                	add    BYTE PTR [eax],dh
    1166:	9b                   	fwait
    1167:	01 00                	add    DWORD PTR [eax],eax
    1169:	00 01                	add    BYTE PTR [ecx],al
    116b:	9c                   	pushf  
    116c:	85 01                	test   DWORD PTR [ecx],eax
    116e:	00 00                	add    BYTE PTR [eax],al
    1170:	09 01                	or     DWORD PTR [ecx],eax
    1172:	06                   	push   es
    1173:	00 00                	add    BYTE PTR [eax],al
    1175:	01 0a                	add    DWORD PTR [edx],ecx
    1177:	72 00                	jb     1179 <sysEnter_Vector-0x12ee87>
    1179:	00 00                	add    BYTE PTR [eax],al
    117b:	02 91 00 0a 73 72    	add    dl,BYTE PTR [ecx+0x72730a00]
    1181:	63 00                	arpl   WORD PTR [eax],ax
    1183:	01 0a                	add    DWORD PTR [edx],ecx
    1185:	85 01                	test   DWORD PTR [ecx],eax
    1187:	00 00                	add    BYTE PTR [eax],al
    1189:	02 91 04 0a 6e 00    	add    dl,BYTE PTR [ecx+0x6e0a04]
    118f:	01 0a                	add    DWORD PTR [edx],ecx
    1191:	a2 00 00 00 02       	mov    ds:0x2000000,al
    1196:	91                   	xchg   ecx,eax
    1197:	08 0b                	or     BYTE PTR [ebx],cl
    1199:	64                   	fs
    119a:	77 00                	ja     119c <sysEnter_Vector-0x12ee64>
    119c:	01 0c b4             	add    DWORD PTR [esp+esi*4],ecx
    119f:	00 00                	add    BYTE PTR [eax],al
    11a1:	00 02                	add    BYTE PTR [edx],al
    11a3:	91                   	xchg   ecx,eax
    11a4:	5e                   	pop    esi
    11a5:	0b 64 64 00          	or     esp,DWORD PTR [esp+eiz*2+0x0]
    11a9:	01 0c b4             	add    DWORD PTR [esp+esi*4],ecx
    11ac:	00 00                	add    BYTE PTR [eax],al
    11ae:	00 02                	add    BYTE PTR [edx],al
    11b0:	91                   	xchg   ecx,eax
    11b1:	5f                   	pop    edi
    11b2:	0c 5e                	or     al,0x5e
    11b4:	0b 00                	or     eax,DWORD PTR [eax]
    11b6:	30 7d 00             	xor    BYTE PTR [ebp+0x0],bh
    11b9:	00 00                	add    BYTE PTR [eax],al
    11bb:	3c 01                	cmp    al,0x1
    11bd:	00 00                	add    BYTE PTR [eax],al
    11bf:	0b 66 00             	or     esp,DWORD PTR [esi+0x0]
    11c2:	01 13                	add    DWORD PTR [ebx],edx
    11c4:	8c 01                	mov    WORD PTR [ecx],es
    11c6:	00 00                	add    BYTE PTR [eax],al
    11c8:	02 91 74 0b 74 00    	add    dl,BYTE PTR [ecx+0x740b74]
    11ce:	01 14 97             	add    DWORD PTR [edi+edx*4],edx
    11d1:	01 00                	add    DWORD PTR [eax],eax
    11d3:	00 02                	add    BYTE PTR [edx],al
    11d5:	91                   	xchg   ecx,eax
    11d6:	70 00                	jo     11d8 <sysEnter_Vector-0x12ee28>
    11d8:	0c e1                	or     al,0xe1
    11da:	0b 00                	or     eax,DWORD PTR [eax]
    11dc:	30 79 00             	xor    BYTE PTR [ecx+0x0],bh
    11df:	00 00                	add    BYTE PTR [eax],al
    11e1:	62 01                	bound  eax,QWORD PTR [ecx]
    11e3:	00 00                	add    BYTE PTR [eax],al
    11e5:	0b 66 00             	or     esp,DWORD PTR [esi+0x0]
    11e8:	01 23                	add    DWORD PTR [ebx],esp
    11ea:	8c 01                	mov    WORD PTR [ecx],es
    11ec:	00 00                	add    BYTE PTR [eax],al
    11ee:	02 91 6c 0b 74 00    	add    dl,BYTE PTR [ecx+0x740b6c]
    11f4:	01 24 97             	add    DWORD PTR [edi+edx*4],esp
    11f7:	01 00                	add    DWORD PTR [eax],eax
    11f9:	00 02                	add    BYTE PTR [edx],al
    11fb:	91                   	xchg   ecx,eax
    11fc:	68 00 0d 5a 0c       	push   0xc5a0d00
    1201:	00 30                	add    BYTE PTR [eax],dh
    1203:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
    1206:	00 0b                	add    BYTE PTR [ebx],cl
    1208:	66                   	data16
    1209:	00 01                	add    BYTE PTR [ecx],al
    120b:	32 97 00 00 00 02    	xor    dl,BYTE PTR [edi+0x2000000]
    1211:	91                   	xchg   ecx,eax
    1212:	64 0b 74 00 01       	or     esi,DWORD PTR fs:[eax+eax*1+0x1]
    1217:	33 74 00 00          	xor    esi,DWORD PTR [eax+eax*1+0x0]
    121b:	00 02                	add    BYTE PTR [edx],al
    121d:	91                   	xchg   ecx,eax
    121e:	60                   	pusha  
    121f:	00 00                	add    BYTE PTR [eax],al
    1221:	05 04 8b 01 00       	add    eax,0x18b04
    1226:	00 0e                	add    BYTE PTR [esi],cl
    1228:	05 04 92 01 00       	add    eax,0x19204
    122d:	00 07                	add    BYTE PTR [edi],al
    122f:	81 00 00 00 05 04    	add    DWORD PTR [eax],0x4050000
    1235:	81 00 00 00 0f 3f    	add    DWORD PTR [eax],0x3f0f0000
    123b:	00 00                	add    BYTE PTR [eax],al
    123d:	00 05 34 81 00 00    	add    BYTE PTR ds:0x8134,al
    1243:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    1249:	30 0f                	xor    BYTE PTR [edi],cl
    124b:	aa                   	stos   BYTE PTR es:[edi],al
    124c:	00 00                	add    BYTE PTR [eax],al
    124e:	00 05 35 81 00 00    	add    BYTE PTR ds:0x8135,al
    1254:	00 05 03 70 3a 00    	add    BYTE PTR ds:0x3a7003,al
    125a:	30 0f                	xor    BYTE PTR [edi],cl
    125c:	56                   	push   esi
    125d:	01 00                	add    DWORD PTR [eax],eax
    125f:	00 05 36 81 00 00    	add    BYTE PTR ds:0x8136,al
    1265:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    126b:	30 0f                	xor    BYTE PTR [edi],cl
    126d:	48                   	dec    eax
    126e:	00 00                	add    BYTE PTR [eax],al
    1270:	00 06                	add    BYTE PTR [esi],al
    1272:	38 8c 00 00 00 05 03 	cmp    BYTE PTR [eax+eax*1+0x3050000],cl
    1279:	74 3a                	je     12b5 <sysEnter_Vector-0x12ed4b>
    127b:	00 30                	add    BYTE PTR [eax],dh
    127d:	00 19                	add    BYTE PTR [ecx],bl
    127f:	02 00                	add    al,BYTE PTR [eax]
    1281:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1284:	36                   	ss
    1285:	07                   	pop    es
    1286:	00 00                	add    BYTE PTR [eax],al
    1288:	04 01                	add    al,0x1
    128a:	ef                   	out    dx,eax
    128b:	00 00                	add    BYTE PTR [eax],al
    128d:	00 0c 19             	add    BYTE PTR [ecx+ebx*1],cl
    1290:	06                   	push   es
    1291:	00 00                	add    BYTE PTR [eax],al
    1293:	6d                   	ins    DWORD PTR es:[edi],dx
    1294:	00 00                	add    BYTE PTR [eax],al
    1296:	00 c8                	add    al,cl
    1298:	0c 00                	or     al,0x0
    129a:	30 8e 01 00 00 75    	xor    BYTE PTR [esi+0x75000001],cl
    12a0:	08 00                	or     BYTE PTR [eax],al
    12a2:	00 02                	add    BYTE PTR [edx],al
    12a4:	01 06                	add    DWORD PTR [esi],eax
    12a6:	58                   	pop    eax
    12a7:	00 00                	add    BYTE PTR [eax],al
    12a9:	00 02                	add    BYTE PTR [edx],al
    12ab:	01 06                	add    DWORD PTR [esi],eax
    12ad:	51                   	push   ecx
    12ae:	00 00                	add    BYTE PTR [eax],al
    12b0:	00 02                	add    BYTE PTR [edx],al
    12b2:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    12b8:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    12bf:	02 08                	add    cl,BYTE PTR [eax]
    12c1:	05 00 00 00 00       	add    eax,0x0
    12c6:	04 70                	add    al,0x70
    12c8:	05 00 00 02 2e       	add    eax,0x2e020000
    12cd:	53                   	push   ebx
    12ce:	00 00                	add    BYTE PTR [eax],al
    12d0:	00 02                	add    BYTE PTR [edx],al
    12d2:	01 08                	add    DWORD PTR [eax],ecx
    12d4:	4f                   	dec    edi
    12d5:	00 00                	add    BYTE PTR [eax],al
    12d7:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    12da:	06                   	push   es
    12db:	00 00                	add    BYTE PTR [eax],al
    12dd:	02 31                	add    dh,BYTE PTR [ecx]
    12df:	65 00 00             	add    BYTE PTR gs:[eax],al
    12e2:	00 02                	add    BYTE PTR [edx],al
    12e4:	02 07                	add    al,BYTE PTR [edi]
    12e6:	0e                   	push   cs
    12e7:	00 00                	add    BYTE PTR [eax],al
    12e9:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    12ec:	00 00                	add    BYTE PTR [eax],al
    12ee:	00 02                	add    BYTE PTR [edx],al
    12f0:	34 77                	xor    al,0x77
    12f2:	00 00                	add    BYTE PTR [eax],al
    12f4:	00 02                	add    BYTE PTR [edx],al
    12f6:	04 07                	add    al,0x7
    12f8:	32 00                	xor    al,BYTE PTR [eax]
    12fa:	00 00                	add    BYTE PTR [eax],al
    12fc:	02 08                	add    cl,BYTE PTR [eax]
    12fe:	07                   	pop    es
    12ff:	28 00                	sub    BYTE PTR [eax],al
    1301:	00 00                	add    BYTE PTR [eax],al
    1303:	04 9e                	add    al,0x9e
    1305:	03 00                	add    eax,DWORD PTR [eax]
    1307:	00 03                	add    BYTE PTR [ebx],al
    1309:	d8 77 00             	fdiv   DWORD PTR [edi+0x0]
    130c:	00 00                	add    BYTE PTR [eax],al
    130e:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1315:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1318:	96                   	xchg   esi,eax
    1319:	00 00                	add    BYTE PTR [eax],al
    131b:	00 02                	add    BYTE PTR [edx],al
    131d:	01 02                	add    DWORD PTR [edx],eax
    131f:	90                   	nop
    1320:	00 00                	add    BYTE PTR [eax],al
    1322:	00 04 5d 00 00 00 04 	add    BYTE PTR [ebx*2+0x4000000],al
    1329:	2a 90 00 00 00 02    	sub    dl,BYTE PTR [eax+0x2000000]
    132f:	04 07                	add    al,0x7
    1331:	2d 00 00 00 02       	sub    eax,0x2000000
    1336:	04 07                	add    al,0x7
    1338:	dc 00                	fadd   QWORD PTR [eax]
    133a:	00 00                	add    BYTE PTR [eax],al
    133c:	05 04 06 12 06       	add    eax,0x6120604
    1341:	00 00                	add    BYTE PTR [eax],al
    1343:	01 08                	add    DWORD PTR [eax],ecx
    1345:	be 00 00 00 c8       	mov    esi,0xc8000000
    134a:	0c 00                	or     al,0x0
    134c:	30 c7                	xor    bh,al
    134e:	00 00                	add    BYTE PTR [eax],al
    1350:	00 01                	add    BYTE PTR [ecx],al
    1352:	9c                   	pushf  
    1353:	43                   	inc    ebx
    1354:	01 00                	add    DWORD PTR [eax],eax
    1356:	00 07                	add    BYTE PTR [edi],al
    1358:	64 31 00             	xor    DWORD PTR fs:[eax],eax
    135b:	01 08                	add    DWORD PTR [eax],ecx
    135d:	be 00 00 00 02       	mov    esi,0x2000000
    1362:	91                   	xchg   ecx,eax
    1363:	00 07                	add    BYTE PTR [edi],al
    1365:	76 61                	jbe    13c8 <sysEnter_Vector-0x12ec38>
    1367:	6c                   	ins    BYTE PTR es:[edi],dx
    1368:	00 01                	add    BYTE PTR [ecx],al
    136a:	08 3a                	or     BYTE PTR [edx],bh
    136c:	00 00                	add    BYTE PTR [eax],al
    136e:	00 02                	add    BYTE PTR [edx],al
    1370:	91                   	xchg   ecx,eax
    1371:	04 07                	add    al,0x7
    1373:	6c                   	ins    BYTE PTR es:[edi],dx
    1374:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    1376:	00 01                	add    BYTE PTR [ecx],al
    1378:	08 85 00 00 00 02    	or     BYTE PTR [ebp+0x2000000],al
    137e:	91                   	xchg   ecx,eax
    137f:	08 08                	or     BYTE PTR [eax],cl
    1381:	64 00 01             	add    BYTE PTR fs:[ecx],al
    1384:	0a 43 01             	or     al,BYTE PTR [ebx+0x1]
    1387:	00 00                	add    BYTE PTR [eax],al
    1389:	02 91 74 08 65 00    	add    dl,BYTE PTR [ecx+0x650874]
    138f:	01 0b                	add    DWORD PTR [ebx],ecx
    1391:	49                   	dec    ecx
    1392:	01 00                	add    DWORD PTR [eax],eax
    1394:	00 02                	add    BYTE PTR [edx],al
    1396:	91                   	xchg   ecx,eax
    1397:	70 09                	jo     13a2 <sysEnter_Vector-0x12ec5e>
    1399:	0d 06 00 00 01       	or     eax,0x1000006
    139e:	0c 5a                	or     al,0x5a
    13a0:	00 00                	add    BYTE PTR [eax],al
    13a2:	00 02                	add    BYTE PTR [edx],al
    13a4:	91                   	xchg   ecx,eax
    13a5:	6a 08                	push   0x8
    13a7:	66                   	data16
    13a8:	00 01                	add    BYTE PTR [ecx],al
    13aa:	0d 4f 01 00 00       	or     eax,0x14f
    13af:	02 91 6c 09 26 06    	add    dl,BYTE PTR [ecx+0x626096c]
    13b5:	00 00                	add    BYTE PTR [eax],al
    13b7:	01 0e                	add    DWORD PTR [esi],ecx
    13b9:	6c                   	ins    BYTE PTR es:[edi],dx
    13ba:	00 00                	add    BYTE PTR [eax],al
    13bc:	00 02                	add    BYTE PTR [edx],al
    13be:	91                   	xchg   ecx,eax
    13bf:	64 00 0a             	add    BYTE PTR fs:[edx],cl
    13c2:	04 48                	add    al,0x48
    13c4:	00 00                	add    BYTE PTR [eax],al
    13c6:	00 0a                	add    BYTE PTR [edx],cl
    13c8:	04 5a                	add    al,0x5a
    13ca:	00 00                	add    BYTE PTR [eax],al
    13cc:	00 0a                	add    BYTE PTR [edx],cl
    13ce:	04 6c                	add    al,0x6c
    13d0:	00 00                	add    BYTE PTR [eax],al
    13d2:	00 06                	add    BYTE PTR [esi],al
    13d4:	2b 06                	sub    eax,DWORD PTR [esi]
    13d6:	00 00                	add    BYTE PTR [eax],al
    13d8:	01 1f                	add    DWORD PTR [edi],ebx
    13da:	be 00 00 00 8f       	mov    esi,0x8f000000
    13df:	0d 00 30 c7 00       	or     eax,0xc73000
    13e4:	00 00                	add    BYTE PTR [eax],al
    13e6:	01 9c d8 01 00 00 07 	add    DWORD PTR [eax+ebx*8+0x7000001],ebx
    13ed:	64 31 00             	xor    DWORD PTR fs:[eax],eax
    13f0:	01 1f                	add    DWORD PTR [edi],ebx
    13f2:	be 00 00 00 02       	mov    esi,0x2000000
    13f7:	91                   	xchg   ecx,eax
    13f8:	00 07                	add    BYTE PTR [edi],al
    13fa:	76 61                	jbe    145d <sysEnter_Vector-0x12eba3>
    13fc:	6c                   	ins    BYTE PTR es:[edi],dx
    13fd:	00 01                	add    BYTE PTR [ecx],al
    13ff:	1f                   	pop    ds
    1400:	3a 00                	cmp    al,BYTE PTR [eax]
    1402:	00 00                	add    BYTE PTR [eax],al
    1404:	02 91 04 07 6c 65    	add    dl,BYTE PTR [ecx+0x656c0704]
    140a:	6e                   	outs   dx,BYTE PTR ds:[esi]
    140b:	00 01                	add    BYTE PTR [ecx],al
    140d:	1f                   	pop    ds
    140e:	85 00                	test   DWORD PTR [eax],eax
    1410:	00 00                	add    BYTE PTR [eax],al
    1412:	02 91 08 08 64 00    	add    dl,BYTE PTR [ecx+0x640808]
    1418:	01 21                	add    DWORD PTR [ecx],esp
    141a:	43                   	inc    ebx
    141b:	01 00                	add    DWORD PTR [eax],eax
    141d:	00 02                	add    BYTE PTR [edx],al
    141f:	91                   	xchg   ecx,eax
    1420:	74 08                	je     142a <sysEnter_Vector-0x12ebd6>
    1422:	65 00 01             	add    BYTE PTR gs:[ecx],al
    1425:	22 49 01             	and    cl,BYTE PTR [ecx+0x1]
    1428:	00 00                	add    BYTE PTR [eax],al
    142a:	02 91 70 09 0d 06    	add    dl,BYTE PTR [ecx+0x60d0970]
    1430:	00 00                	add    BYTE PTR [eax],al
    1432:	01 23                	add    DWORD PTR [ebx],esp
    1434:	5a                   	pop    edx
    1435:	00 00                	add    BYTE PTR [eax],al
    1437:	00 02                	add    BYTE PTR [edx],al
    1439:	91                   	xchg   ecx,eax
    143a:	6a 08                	push   0x8
    143c:	66                   	data16
    143d:	00 01                	add    BYTE PTR [ecx],al
    143f:	24 4f                	and    al,0x4f
    1441:	01 00                	add    DWORD PTR [eax],eax
    1443:	00 02                	add    BYTE PTR [edx],al
    1445:	91                   	xchg   ecx,eax
    1446:	6c                   	ins    BYTE PTR es:[edi],dx
    1447:	09 26                	or     DWORD PTR [esi],esp
    1449:	06                   	push   es
    144a:	00 00                	add    BYTE PTR [eax],al
    144c:	01 25 6c 00 00 00    	add    DWORD PTR ds:0x6c,esp
    1452:	02 91 64 00 0b 3f    	add    dl,BYTE PTR [ecx+0x3f0b0064]
    1458:	00 00                	add    BYTE PTR [eax],al
    145a:	00 05 34 6c 00 00    	add    BYTE PTR ds:0x6c34,al
    1460:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    1466:	30 0b                	xor    BYTE PTR [ebx],cl
    1468:	aa                   	stos   BYTE PTR es:[edi],al
    1469:	00 00                	add    BYTE PTR [eax],al
    146b:	00 05 35 6c 00 00    	add    BYTE PTR ds:0x6c35,al
    1471:	00 05 03 70 3a 00    	add    BYTE PTR ds:0x3a7003,al
    1477:	30 0b                	xor    BYTE PTR [ebx],cl
    1479:	56                   	push   esi
    147a:	01 00                	add    DWORD PTR [eax],eax
    147c:	00 05 36 6c 00 00    	add    BYTE PTR ds:0x6c36,al
    1482:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    1488:	30 0b                	xor    BYTE PTR [ebx],cl
    148a:	48                   	dec    eax
    148b:	00 00                	add    BYTE PTR [eax],al
    148d:	00 06                	add    BYTE PTR [esi],al
    148f:	38 a5 00 00 00 05    	cmp    BYTE PTR [ebp+0x5000000],ah
    1495:	03 74 3a 00          	add    esi,DWORD PTR [edx+edi*1+0x0]
    1499:	30 00                	xor    BYTE PTR [eax],al
    149b:	63 01                	arpl   WORD PTR [ecx],ax
    149d:	00 00                	add    BYTE PTR [eax],al
    149f:	04 00                	add    al,0x0
    14a1:	d7                   	xlat   BYTE PTR ds:[ebx]
    14a2:	07                   	pop    es
    14a3:	00 00                	add    BYTE PTR [eax],al
    14a5:	04 01                	add    al,0x1
    14a7:	ef                   	out    dx,eax
    14a8:	00 00                	add    BYTE PTR [eax],al
    14aa:	00 0c 58             	add    BYTE PTR [eax+ebx*2],cl
    14ad:	06                   	push   es
    14ae:	00 00                	add    BYTE PTR [eax],al
    14b0:	6d                   	ins    DWORD PTR es:[edi],dx
    14b1:	00 00                	add    BYTE PTR [eax],al
    14b3:	00 58 0e             	add    BYTE PTR [eax+0xe],bl
    14b6:	00 30                	add    BYTE PTR [eax],dh
    14b8:	10 00                	adc    BYTE PTR [eax],al
    14ba:	00 00                	add    BYTE PTR [eax],al
    14bc:	5d                   	pop    ebp
    14bd:	09 00                	or     DWORD PTR [eax],eax
    14bf:	00 02                	add    BYTE PTR [edx],al
    14c1:	01 06                	add    DWORD PTR [esi],eax
    14c3:	58                   	pop    eax
    14c4:	00 00                	add    BYTE PTR [eax],al
    14c6:	00 02                	add    BYTE PTR [edx],al
    14c8:	01 06                	add    DWORD PTR [esi],eax
    14ca:	51                   	push   ecx
    14cb:	00 00                	add    BYTE PTR [eax],al
    14cd:	00 02                	add    BYTE PTR [edx],al
    14cf:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    14d5:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    14dc:	02 08                	add    cl,BYTE PTR [eax]
    14de:	05 00 00 00 00       	add    eax,0x0
    14e3:	02 01                	add    al,BYTE PTR [ecx]
    14e5:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    14e8:	00 00                	add    BYTE PTR [eax],al
    14ea:	02 02                	add    al,BYTE PTR [edx]
    14ec:	07                   	pop    es
    14ed:	0e                   	push   cs
    14ee:	00 00                	add    BYTE PTR [eax],al
    14f0:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    14f3:	00 00                	add    BYTE PTR [eax],al
    14f5:	00 02                	add    BYTE PTR [edx],al
    14f7:	34 61                	xor    al,0x61
    14f9:	00 00                	add    BYTE PTR [eax],al
    14fb:	00 02                	add    BYTE PTR [edx],al
    14fd:	04 07                	add    al,0x7
    14ff:	32 00                	xor    al,BYTE PTR [eax]
    1501:	00 00                	add    BYTE PTR [eax],al
    1503:	02 08                	add    cl,BYTE PTR [eax]
    1505:	07                   	pop    es
    1506:	28 00                	sub    BYTE PTR [eax],al
    1508:	00 00                	add    BYTE PTR [eax],al
    150a:	04 9e                	add    al,0x9e
    150c:	03 00                	add    eax,DWORD PTR [eax]
    150e:	00 03                	add    BYTE PTR [ebx],al
    1510:	d8 61 00             	fsub   DWORD PTR [ecx+0x0]
    1513:	00 00                	add    BYTE PTR [eax],al
    1515:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    151c:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    151f:	96                   	xchg   esi,eax
    1520:	00 00                	add    BYTE PTR [eax],al
    1522:	00 02                	add    BYTE PTR [edx],al
    1524:	01 02                	add    DWORD PTR [edx],eax
    1526:	90                   	nop
    1527:	00 00                	add    BYTE PTR [eax],al
    1529:	00 04 5d 00 00 00 04 	add    BYTE PTR [ebx*2+0x4000000],al
    1530:	2a 7a 00             	sub    bh,BYTE PTR [edx+0x0]
    1533:	00 00                	add    BYTE PTR [eax],al
    1535:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
    1538:	2d 00 00 00 02       	sub    eax,0x2000000
    153d:	04 07                	add    al,0x7
    153f:	dc 00                	fadd   QWORD PTR [eax]
    1541:	00 00                	add    BYTE PTR [eax],al
    1543:	05 04 04 41 06       	add    eax,0x6410404
    1548:	00 00                	add    BYTE PTR [eax],al
    154a:	05 15 7a 00 00       	add    eax,0x7a15
    154f:	00 06                	add    BYTE PTR [esi],al
    1551:	53                   	push   ebx
    1552:	06                   	push   es
    1553:	00 00                	add    BYTE PTR [eax],al
    1555:	01 09                	add    DWORD PTR [ecx],ecx
    1557:	a8 00                	test   al,0x0
    1559:	00 00                	add    BYTE PTR [eax],al
    155b:	58                   	pop    eax
    155c:	0e                   	push   cs
    155d:	00 30                	add    BYTE PTR [eax],dh
    155f:	10 00                	adc    BYTE PTR [eax],al
    1561:	00 00                	add    BYTE PTR [eax],al
    1563:	01 9c 22 01 00 00 07 	add    DWORD PTR [edx+eiz*1+0x7000001],ebx
    156a:	3c 06                	cmp    al,0x6
    156c:	00 00                	add    BYTE PTR [eax],al
    156e:	01 09                	add    DWORD PTR [ecx],ecx
    1570:	a8 00                	test   al,0x0
    1572:	00 00                	add    BYTE PTR [eax],al
    1574:	02 91 00 08 6c 65    	add    dl,BYTE PTR [ecx+0x656c0800]
    157a:	6e                   	outs   dx,BYTE PTR ds:[esi]
    157b:	00 01                	add    BYTE PTR [ecx],al
    157d:	09 6f 00             	or     DWORD PTR [edi+0x0],ebp
    1580:	00 00                	add    BYTE PTR [eax],al
    1582:	02 91 04 07 47 06    	add    dl,BYTE PTR [ecx+0x6470704]
    1588:	00 00                	add    BYTE PTR [eax],al
    158a:	01 09                	add    DWORD PTR [ecx],ecx
    158c:	3a 00                	cmp    al,BYTE PTR [eax]
    158e:	00 00                	add    BYTE PTR [eax],al
    1590:	02 91 08 07 a2 07    	add    dl,BYTE PTR [ecx+0x7a20708]
    1596:	00 00                	add    BYTE PTR [eax],al
    1598:	01 09                	add    DWORD PTR [ecx],ecx
    159a:	3a 00                	cmp    al,BYTE PTR [eax]
    159c:	00 00                	add    BYTE PTR [eax],al
    159e:	02 91 0c 08 66 64    	add    dl,BYTE PTR [ecx+0x6466080c]
    15a4:	00 01                	add    BYTE PTR [ecx],al
    15a6:	09 3a                	or     DWORD PTR [edx],edi
    15a8:	00 00                	add    BYTE PTR [eax],al
    15aa:	00 02                	add    BYTE PTR [edx],al
    15ac:	91                   	xchg   ecx,eax
    15ad:	10 07                	adc    BYTE PTR [edi],al
    15af:	4c                   	dec    esp
    15b0:	06                   	push   es
    15b1:	00 00                	add    BYTE PTR [eax],al
    15b3:	01 09                	add    DWORD PTR [ecx],ecx
    15b5:	aa                   	stos   BYTE PTR es:[edi],al
    15b6:	00 00                	add    BYTE PTR [eax],al
    15b8:	00 02                	add    BYTE PTR [edx],al
    15ba:	91                   	xchg   ecx,eax
    15bb:	14 00                	adc    al,0x0
    15bd:	09 3f                	or     DWORD PTR [edi],edi
    15bf:	00 00                	add    BYTE PTR [eax],al
    15c1:	00 06                	add    BYTE PTR [esi],al
    15c3:	34 56                	xor    al,0x56
    15c5:	00 00                	add    BYTE PTR [eax],al
    15c7:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    15cd:	30 09                	xor    BYTE PTR [ecx],cl
    15cf:	aa                   	stos   BYTE PTR es:[edi],al
    15d0:	00 00                	add    BYTE PTR [eax],al
    15d2:	00 06                	add    BYTE PTR [esi],al
    15d4:	35 56 00 00 00       	xor    eax,0x56
    15d9:	05 03 70 3a 00       	add    eax,0x3a7003
    15de:	30 09                	xor    BYTE PTR [ecx],cl
    15e0:	56                   	push   esi
    15e1:	01 00                	add    DWORD PTR [eax],eax
    15e3:	00 06                	add    BYTE PTR [esi],al
    15e5:	36                   	ss
    15e6:	56                   	push   esi
    15e7:	00 00                	add    BYTE PTR [eax],al
    15e9:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    15ef:	30 09                	xor    BYTE PTR [ecx],cl
    15f1:	48                   	dec    eax
    15f2:	00 00                	add    BYTE PTR [eax],al
    15f4:	00 07                	add    BYTE PTR [edi],al
    15f6:	38 8f 00 00 00 05    	cmp    BYTE PTR [edi+0x5000000],cl
    15fc:	03 74 3a 00          	add    esi,DWORD PTR [edx+edi*1+0x0]
    1600:	30 00                	xor    BYTE PTR [eax],al
    1602:	f9                   	stc    
    1603:	05 00 00 04 00       	add    eax,0x40000
    1608:	60                   	pusha  
    1609:	08 00                	or     BYTE PTR [eax],al
    160b:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    160e:	ef                   	out    dx,eax
    160f:	00 00                	add    BYTE PTR [eax],al
    1611:	00 0c cf             	add    BYTE PTR [edi+ecx*8],cl
    1614:	06                   	push   es
    1615:	00 00                	add    BYTE PTR [eax],al
    1617:	6d                   	ins    DWORD PTR es:[edi],dx
    1618:	00 00                	add    BYTE PTR [eax],al
    161a:	00 68 0e             	add    BYTE PTR [eax+0xe],ch
    161d:	00 30                	add    BYTE PTR [eax],dh
    161f:	60                   	pusha  
    1620:	02 00                	add    al,BYTE PTR [eax]
    1622:	00 2a                	add    BYTE PTR [edx],ch
    1624:	0a 00                	or     al,BYTE PTR [eax]
    1626:	00 02                	add    BYTE PTR [edx],al
    1628:	01 06                	add    DWORD PTR [esi],eax
    162a:	58                   	pop    eax
    162b:	00 00                	add    BYTE PTR [eax],al
    162d:	00 02                	add    BYTE PTR [edx],al
    162f:	01 06                	add    DWORD PTR [esi],eax
    1631:	51                   	push   ecx
    1632:	00 00                	add    BYTE PTR [eax],al
    1634:	00 02                	add    BYTE PTR [edx],al
    1636:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    163c:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1643:	02 08                	add    cl,BYTE PTR [eax]
    1645:	05 00 00 00 00       	add    eax,0x0
    164a:	02 01                	add    al,BYTE PTR [ecx]
    164c:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    164f:	00 00                	add    BYTE PTR [eax],al
    1651:	02 02                	add    al,BYTE PTR [edx]
    1653:	07                   	pop    es
    1654:	0e                   	push   cs
    1655:	00 00                	add    BYTE PTR [eax],al
    1657:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    165a:	00 00                	add    BYTE PTR [eax],al
    165c:	00 02                	add    BYTE PTR [edx],al
    165e:	34 61                	xor    al,0x61
    1660:	00 00                	add    BYTE PTR [eax],al
    1662:	00 02                	add    BYTE PTR [edx],al
    1664:	04 07                	add    al,0x7
    1666:	32 00                	xor    al,BYTE PTR [eax]
    1668:	00 00                	add    BYTE PTR [eax],al
    166a:	04 69                	add    al,0x69
    166c:	06                   	push   es
    166d:	00 00                	add    BYTE PTR [eax],al
    166f:	02 37                	add    dh,BYTE PTR [edi]
    1671:	73 00                	jae    1673 <sysEnter_Vector-0x12e98d>
    1673:	00 00                	add    BYTE PTR [eax],al
    1675:	02 08                	add    cl,BYTE PTR [eax]
    1677:	07                   	pop    es
    1678:	28 00                	sub    BYTE PTR [eax],al
    167a:	00 00                	add    BYTE PTR [eax],al
    167c:	04 9e                	add    al,0x9e
    167e:	03 00                	add    eax,DWORD PTR [eax]
    1680:	00 03                	add    BYTE PTR [ebx],al
    1682:	d8 61 00             	fsub   DWORD PTR [ecx+0x0]
    1685:	00 00                	add    BYTE PTR [eax],al
    1687:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    168e:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1691:	96                   	xchg   esi,eax
    1692:	00 00                	add    BYTE PTR [eax],al
    1694:	00 02                	add    BYTE PTR [edx],al
    1696:	01 02                	add    DWORD PTR [edx],eax
    1698:	90                   	nop
    1699:	00 00                	add    BYTE PTR [eax],al
    169b:	00 04 5d 00 00 00 04 	add    BYTE PTR [ebx*2+0x4000000],al
    16a2:	2a 85 00 00 00 05    	sub    al,BYTE PTR [ebp+0x5000000]
    16a8:	04 ab                	add    al,0xab
    16aa:	00 00                	add    BYTE PTR [eax],al
    16ac:	00 06                	add    BYTE PTR [esi],al
    16ae:	25 00 00 00 02       	and    eax,0x2000000
    16b3:	04 07                	add    al,0x7
    16b5:	2d 00 00 00 02       	sub    eax,0x2000000
    16ba:	04 07                	add    al,0x7
    16bc:	dc 00                	fadd   QWORD PTR [eax]
    16be:	00 00                	add    BYTE PTR [eax],al
    16c0:	07                   	pop    es
    16c1:	04 05                	add    al,0x5
    16c3:	04 25                	add    al,0x25
    16c5:	00 00                	add    BYTE PTR [eax],al
    16c7:	00 08                	add    BYTE PTR [eax],cl
    16c9:	75 07                	jne    16d2 <sysEnter_Vector-0x12e92e>
    16cb:	00 00                	add    BYTE PTR [eax],al
    16cd:	0c 05                	or     al,0x5
    16cf:	17                   	pop    ss
    16d0:	f7 00 00 00 09 8c    	test   DWORD PTR [eax],0x8c090000
    16d6:	06                   	push   es
    16d7:	00 00                	add    BYTE PTR [eax],al
    16d9:	05 19 f7 00 00       	add    eax,0xf719
    16de:	00 00                	add    BYTE PTR [eax],al
    16e0:	09 e5                	or     ebp,esp
    16e2:	05 00 00 05 19       	add    eax,0x19050000
    16e7:	f7 00 00 00 04 09    	test   DWORD PTR [eax],0x9040000
    16ed:	6d                   	ins    DWORD PTR es:[edi],dx
    16ee:	07                   	pop    es
    16ef:	00 00                	add    BYTE PTR [eax],al
    16f1:	05 1a be 00 00       	add    eax,0xbe1a
    16f6:	00 08                	add    BYTE PTR [eax],cl
    16f8:	00 05 04 c6 00 00    	add    BYTE PTR ds:0xc604,al
    16fe:	00 04 fe             	add    BYTE PTR [esi+edi*8],al
    1701:	06                   	push   es
    1702:	00 00                	add    BYTE PTR [eax],al
    1704:	05 1b c6 00 00       	add    eax,0xc61b
    1709:	00 08                	add    BYTE PTR [eax],cl
    170b:	aa                   	stos   BYTE PTR es:[edi],al
    170c:	06                   	push   es
    170d:	00 00                	add    BYTE PTR [eax],al
    170f:	14 06                	adc    al,0x6
    1711:	1b 39                	sbb    edi,DWORD PTR [ecx]
    1713:	01 00                	add    DWORD PTR [eax],eax
    1715:	00 09                	add    BYTE PTR [ecx],cl
    1717:	a3 06 00 00 06       	mov    ds:0x6000006,eax
    171c:	1d fd 00 00 00       	sbb    eax,0xfd
    1721:	00 09                	add    BYTE PTR [ecx],cl
    1723:	63 06                	arpl   WORD PTR [esi],ax
    1725:	00 00                	add    BYTE PTR [eax],al
    1727:	06                   	push   es
    1728:	1e                   	push   ds
    1729:	61                   	popa   
    172a:	00 00                	add    BYTE PTR [eax],al
    172c:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
    172f:	e0 07                	loopne 1738 <sysEnter_Vector-0x12e8c8>
    1731:	00 00                	add    BYTE PTR [eax],al
    1733:	06                   	push   es
    1734:	1f                   	pop    ds
    1735:	6a 01                	push   0x1
    1737:	00 00                	add    BYTE PTR [eax],al
    1739:	10 00                	adc    BYTE PTR [eax],al
    173b:	08 db                	or     bl,bl
    173d:	06                   	push   es
    173e:	00 00                	add    BYTE PTR [eax],al
    1740:	0c 06                	or     al,0x6
    1742:	37                   	aaa    
    1743:	6a 01                	push   0x1
    1745:	00 00                	add    BYTE PTR [eax],al
    1747:	09 c8                	or     eax,ecx
    1749:	06                   	push   es
    174a:	00 00                	add    BYTE PTR [eax],al
    174c:	06                   	push   es
    174d:	39 c0                	cmp    eax,eax
    174f:	00 00                	add    BYTE PTR [eax],al
    1751:	00 00                	add    BYTE PTR [eax],al
    1753:	09 e7                	or     edi,esp
    1755:	07                   	pop    es
    1756:	00 00                	add    BYTE PTR [eax],al
    1758:	06                   	push   es
    1759:	3a 73 02             	cmp    dh,BYTE PTR [ebx+0x2]
    175c:	00 00                	add    BYTE PTR [eax],al
    175e:	04 09                	add    al,0x9
    1760:	fd                   	std    
    1761:	07                   	pop    es
    1762:	00 00                	add    BYTE PTR [eax],al
    1764:	06                   	push   es
    1765:	3b 6a 01             	cmp    ebp,DWORD PTR [edx+0x1]
    1768:	00 00                	add    BYTE PTR [eax],al
    176a:	08 00                	or     BYTE PTR [eax],al
    176c:	05 04 39 01 00       	add    eax,0x13904
    1771:	00 08                	add    BYTE PTR [eax],cl
    1773:	b8 06 00 00 0c       	mov    eax,0xc000006
    1778:	06                   	push   es
    1779:	22 a1 01 00 00 09    	and    ah,BYTE PTR [ecx+0x9000001]
    177f:	84 07                	test   BYTE PTR [edi],al
    1781:	00 00                	add    BYTE PTR [eax],al
    1783:	06                   	push   es
    1784:	24 6a                	and    al,0x6a
    1786:	01 00                	add    DWORD PTR [eax],eax
    1788:	00 00                	add    BYTE PTR [eax],al
    178a:	09 9c 06 00 00 06 25 	or     DWORD PTR [esi+eax*1+0x25060000],ebx
    1791:	a1 01 00 00 04       	mov    eax,ds:0x4000001
    1796:	09 72 06             	or     DWORD PTR [edx+0x6],esi
    1799:	00 00                	add    BYTE PTR [eax],al
    179b:	06                   	push   es
    179c:	26 3a 00             	cmp    al,BYTE PTR es:[eax]
    179f:	00 00                	add    BYTE PTR [eax],al
    17a1:	08 00                	or     BYTE PTR [eax],al
    17a3:	05 04 08 01 00       	add    eax,0x10804
    17a8:	00 08                	add    BYTE PTR [eax],cl
    17aa:	e9 07 00 00 24       	jmp    240017b6 <sysEnter_Vector+0x23ed17b6>
    17af:	06                   	push   es
    17b0:	29 14 02             	sub    DWORD PTR [edx+eax*1],edx
    17b3:	00 00                	add    BYTE PTR [eax],al
    17b5:	09 48 07             	or     DWORD PTR [eax+0x7],ecx
    17b8:	00 00                	add    BYTE PTR [eax],al
    17ba:	06                   	push   es
    17bb:	2b 61 00             	sub    esp,DWORD PTR [ecx+0x0]
    17be:	00 00                	add    BYTE PTR [eax],al
    17c0:	00 09                	add    BYTE PTR [ecx],cl
    17c2:	b7 07                	mov    bh,0x7
    17c4:	00 00                	add    BYTE PTR [eax],al
    17c6:	06                   	push   es
    17c7:	2c 4f                	sub    al,0x4f
    17c9:	00 00                	add    BYTE PTR [eax],al
    17cb:	00 04 09             	add    BYTE PTR [ecx+ecx*1],al
    17ce:	24 07                	and    al,0x7
    17d0:	00 00                	add    BYTE PTR [eax],al
    17d2:	06                   	push   es
    17d3:	2d 4f 00 00 00       	sub    eax,0x4f
    17d8:	06                   	push   es
    17d9:	09 b1 07 00 00 06    	or     DWORD PTR [ecx+0x6000007],esi
    17df:	2e                   	cs
    17e0:	61                   	popa   
    17e1:	00 00                	add    BYTE PTR [eax],al
    17e3:	00 08                	add    BYTE PTR [eax],cl
    17e5:	09 f8                	or     eax,edi
    17e7:	06                   	push   es
    17e8:	00 00                	add    BYTE PTR [eax],al
    17ea:	06                   	push   es
    17eb:	2f                   	das    
    17ec:	61                   	popa   
    17ed:	00 00                	add    BYTE PTR [eax],al
    17ef:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
    17f2:	a0 07 00 00 06       	mov    al,ds:0x6000007
    17f7:	30 61 00             	xor    BYTE PTR [ecx+0x0],ah
    17fa:	00 00                	add    BYTE PTR [eax],al
    17fc:	10 09                	adc    BYTE PTR [ecx],cl
    17fe:	7f 07                	jg     1807 <sysEnter_Vector-0x12e7f9>
    1800:	00 00                	add    BYTE PTR [eax],al
    1802:	06                   	push   es
    1803:	31 5d 02             	xor    DWORD PTR [ebp+0x2],ebx
    1806:	00 00                	add    BYTE PTR [eax],al
    1808:	14 09                	adc    al,0x9
    180a:	b6 06                	mov    dh,0x6
    180c:	00 00                	add    BYTE PTR [eax],al
    180e:	06                   	push   es
    180f:	32 70 01             	xor    dh,BYTE PTR [eax+0x1]
    1812:	00 00                	add    BYTE PTR [eax],al
    1814:	18 00                	sbb    BYTE PTR [eax],al
    1816:	08 13                	or     BYTE PTR [ebx],dl
    1818:	07                   	pop    es
    1819:	00 00                	add    BYTE PTR [eax],al
    181b:	14 06                	adc    al,0x6
    181d:	3e                   	ds
    181e:	5d                   	pop    ebp
    181f:	02 00                	add    al,BYTE PTR [eax]
    1821:	00 09                	add    BYTE PTR [ecx],cl
    1823:	1f                   	pop    ds
    1824:	08 00                	or     BYTE PTR [eax],al
    1826:	00 06                	add    BYTE PTR [esi],al
    1828:	40                   	inc    eax
    1829:	8d 02                	lea    eax,[edx]
    182b:	00 00                	add    BYTE PTR [eax],al
    182d:	00 09                	add    BYTE PTR [ecx],cl
    182f:	91                   	xchg   ecx,eax
    1830:	06                   	push   es
    1831:	00 00                	add    BYTE PTR [eax],al
    1833:	06                   	push   es
    1834:	41                   	inc    ecx
    1835:	8d 02                	lea    eax,[edx]
    1837:	00 00                	add    BYTE PTR [eax],al
    1839:	04 09                	add    al,0x9
    183b:	f2 06                	repnz push es
    183d:	00 00                	add    BYTE PTR [eax],al
    183f:	06                   	push   es
    1840:	42                   	inc    edx
    1841:	8d 02                	lea    eax,[edx]
    1843:	00 00                	add    BYTE PTR [eax],al
    1845:	08 09                	or     BYTE PTR [ecx],cl
    1847:	86 06                	xchg   BYTE PTR [esi],al
    1849:	00 00                	add    BYTE PTR [eax],al
    184b:	06                   	push   es
    184c:	43                   	inc    ebx
    184d:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
    184e:	02 00                	add    al,BYTE PTR [eax]
    1850:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
    1853:	c1 06 00             	rol    DWORD PTR [esi],0x0
    1856:	00 06                	add    BYTE PTR [esi],al
    1858:	44                   	inc    esp
    1859:	d0 02                	rol    BYTE PTR [edx],1
    185b:	00 00                	add    BYTE PTR [eax],al
    185d:	10 00                	adc    BYTE PTR [eax],al
    185f:	05 04 63 02 00       	add    eax,0x26304
    1864:	00 06                	add    BYTE PTR [esi],al
    1866:	14 02                	adc    al,0x2
    1868:	00 00                	add    BYTE PTR [eax],al
    186a:	04 cb                	add    al,0xcb
    186c:	07                   	pop    es
    186d:	00 00                	add    BYTE PTR [eax],al
    186f:	06                   	push   es
    1870:	35 a7 01 00 00       	xor    eax,0x1a7
    1875:	05 04 a7 01 00       	add    eax,0x1a704
    187a:	00 0a                	add    BYTE PTR [edx],cl
    187c:	3a 00                	cmp    al,BYTE PTR [eax]
    187e:	00 00                	add    BYTE PTR [eax],al
    1880:	8d 02                	lea    eax,[edx]
    1882:	00 00                	add    BYTE PTR [eax],al
    1884:	0b 73 02             	or     esi,DWORD PTR [ebx+0x2]
    1887:	00 00                	add    BYTE PTR [eax],al
    1889:	0b 6a 01             	or     ebp,DWORD PTR [edx+0x1]
    188c:	00 00                	add    BYTE PTR [eax],al
    188e:	00 05 04 79 02 00    	add    BYTE PTR ds:0x27904,al
    1894:	00 0a                	add    BYTE PTR [edx],cl
    1896:	3a 00                	cmp    al,BYTE PTR [eax]
    1898:	00 00                	add    BYTE PTR [eax],al
    189a:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
    189b:	02 00                	add    al,BYTE PTR [eax]
    189d:	00 0b                	add    BYTE PTR [ebx],cl
    189f:	73 02                	jae    18a3 <sysEnter_Vector-0x12e75d>
    18a1:	00 00                	add    BYTE PTR [eax],al
    18a3:	0b 39                	or     edi,DWORD PTR [ecx]
    18a5:	01 00                	add    DWORD PTR [eax],eax
    18a7:	00 00                	add    BYTE PTR [eax],al
    18a9:	05 04 93 02 00       	add    eax,0x29304
    18ae:	00 0a                	add    BYTE PTR [edx],cl
    18b0:	3a 00                	cmp    al,BYTE PTR [eax]
    18b2:	00 00                	add    BYTE PTR [eax],al
    18b4:	d0 02                	rol    BYTE PTR [edx],1
    18b6:	00 00                	add    BYTE PTR [eax],al
    18b8:	0b 73 02             	or     esi,DWORD PTR [ebx+0x2]
    18bb:	00 00                	add    BYTE PTR [eax],al
    18bd:	0b 6a 01             	or     ebp,DWORD PTR [edx+0x1]
    18c0:	00 00                	add    BYTE PTR [eax],al
    18c2:	0b 73 02             	or     esi,DWORD PTR [ebx+0x2]
    18c5:	00 00                	add    BYTE PTR [eax],al
    18c7:	0b 6a 01             	or     ebp,DWORD PTR [edx+0x1]
    18ca:	00 00                	add    BYTE PTR [eax],al
    18cc:	0b 61 00             	or     esp,DWORD PTR [ecx+0x0]
    18cf:	00 00                	add    BYTE PTR [eax],al
    18d1:	00 05 04 ad 02 00    	add    BYTE PTR ds:0x2ad04,al
    18d7:	00 04 99             	add    BYTE PTR [ecx+ebx*4],al
    18da:	07                   	pop    es
    18db:	00 00                	add    BYTE PTR [eax],al
    18dd:	06                   	push   es
    18de:	47                   	inc    edi
    18df:	e1 02                	loope  18e3 <sysEnter_Vector-0x12e71d>
    18e1:	00 00                	add    BYTE PTR [eax],al
    18e3:	08 db                	or     bl,bl
    18e5:	07                   	pop    es
    18e6:	00 00                	add    BYTE PTR [eax],al
    18e8:	10 06                	adc    BYTE PTR [esi],al
    18ea:	4f                   	dec    edi
    18eb:	12 03                	adc    al,BYTE PTR [ebx]
    18ed:	00 00                	add    BYTE PTR [eax],al
    18ef:	09 0e                	or     DWORD PTR [esi],ecx
    18f1:	08 00                	or     BYTE PTR [eax],al
    18f3:	00 06                	add    BYTE PTR [esi],al
    18f5:	51                   	push   ecx
    18f6:	c0 00 00             	rol    BYTE PTR [eax],0x0
    18f9:	00 00                	add    BYTE PTR [eax],al
    18fb:	09 06                	or     DWORD PTR [esi],eax
    18fd:	08 00                	or     BYTE PTR [eax],al
    18ff:	00 06                	add    BYTE PTR [esi],al
    1901:	52                   	push   edx
    1902:	73 02                	jae    1906 <sysEnter_Vector-0x12e6fa>
    1904:	00 00                	add    BYTE PTR [eax],al
    1906:	04 09                	add    al,0x9
    1908:	94                   	xchg   esp,eax
    1909:	07                   	pop    es
    190a:	00 00                	add    BYTE PTR [eax],al
    190c:	06                   	push   es
    190d:	53                   	push   ebx
    190e:	12 03                	adc    al,BYTE PTR [ebx]
    1910:	00 00                	add    BYTE PTR [eax],al
    1912:	08 00                	or     BYTE PTR [eax],al
    1914:	08 e2                	or     dl,ah
    1916:	06                   	push   es
    1917:	00 00                	add    BYTE PTR [eax],al
    1919:	08 06                	or     BYTE PTR [esi],al
    191b:	49                   	dec    ecx
    191c:	37                   	aaa    
    191d:	03 00                	add    eax,DWORD PTR [eax]
    191f:	00 09                	add    BYTE PTR [ecx],cl
    1921:	ef                   	out    dx,eax
    1922:	07                   	pop    es
    1923:	00 00                	add    BYTE PTR [eax],al
    1925:	06                   	push   es
    1926:	4b                   	dec    ebx
    1927:	61                   	popa   
    1928:	03 00                	add    eax,DWORD PTR [eax]
    192a:	00 00                	add    BYTE PTR [eax],al
    192c:	09 55 07             	or     DWORD PTR [ebp+0x7],edx
    192f:	00 00                	add    BYTE PTR [eax],al
    1931:	06                   	push   es
    1932:	4c                   	dec    esp
    1933:	85 03                	test   DWORD PTR [ebx],eax
    1935:	00 00                	add    BYTE PTR [eax],al
    1937:	04 00                	add    al,0x0
    1939:	0a 7a 00             	or     bh,BYTE PTR [edx+0x0]
    193c:	00 00                	add    BYTE PTR [eax],al
    193e:	55                   	push   ebp
    193f:	03 00                	add    eax,DWORD PTR [eax]
    1941:	00 0b                	add    BYTE PTR [ebx],cl
    1943:	55                   	push   ebp
    1944:	03 00                	add    eax,DWORD PTR [eax]
    1946:	00 0b                	add    BYTE PTR [ebx],cl
    1948:	c0 00 00             	rol    BYTE PTR [eax],0x0
    194b:	00 0b                	add    BYTE PTR [ebx],cl
    194d:	7a 00                	jp     194f <sysEnter_Vector-0x12e6b1>
    194f:	00 00                	add    BYTE PTR [eax],al
    1951:	0b 5b 03             	or     ebx,DWORD PTR [ebx+0x3]
    1954:	00 00                	add    BYTE PTR [eax],al
    1956:	00 05 04 e1 02 00    	add    BYTE PTR ds:0x2e104,al
    195c:	00 05 04 68 00 00    	add    BYTE PTR ds:0x6804,al
    1962:	00 05 04 37 03 00    	add    BYTE PTR ds:0x33704,al
    1968:	00 0a                	add    BYTE PTR [edx],cl
    196a:	7a 00                	jp     196c <sysEnter_Vector-0x12e694>
    196c:	00 00                	add    BYTE PTR [eax],al
    196e:	85 03                	test   DWORD PTR [ebx],eax
    1970:	00 00                	add    BYTE PTR [eax],al
    1972:	0b 55 03             	or     edx,DWORD PTR [ebp+0x3]
    1975:	00 00                	add    BYTE PTR [eax],al
    1977:	0b a5 00 00 00 0b    	or     esp,DWORD PTR [ebp+0xb000000]
    197d:	7a 00                	jp     197f <sysEnter_Vector-0x12e681>
    197f:	00 00                	add    BYTE PTR [eax],al
    1981:	0b 5b 03             	or     ebx,DWORD PTR [ebx+0x3]
    1984:	00 00                	add    BYTE PTR [eax],al
    1986:	00 05 04 67 03 00    	add    BYTE PTR ds:0x36704,al
    198c:	00 04 2e             	add    BYTE PTR [esi+ebp*1],al
    198f:	07                   	pop    es
    1990:	00 00                	add    BYTE PTR [eax],al
    1992:	06                   	push   es
    1993:	4d                   	dec    ebp
    1994:	12 03                	adc    al,BYTE PTR [ebx]
    1996:	00 00                	add    BYTE PTR [eax],al
    1998:	0c 07                	or     al,0x7
    199a:	07                   	pop    es
    199b:	00 00                	add    BYTE PTR [eax],al
    199d:	01 12                	add    DWORD PTR [edx],edx
    199f:	7a 00                	jp     19a1 <sysEnter_Vector-0x12e65f>
    19a1:	00 00                	add    BYTE PTR [eax],al
    19a3:	68 0e 00 30 2c       	push   0x2c30000e
    19a8:	00 00                	add    BYTE PTR [eax],al
    19aa:	00 01                	add    BYTE PTR [ecx],al
    19ac:	9c                   	pushf  
    19ad:	e8 03 00 00 0d       	call   d0019b5 <sysEnter_Vector+0xced19b5>
    19b2:	5b                   	pop    ebx
    19b3:	07                   	pop    es
    19b4:	00 00                	add    BYTE PTR [eax],al
    19b6:	01 12                	add    DWORD PTR [edx],edx
    19b8:	55                   	push   ebp
    19b9:	03 00                	add    eax,DWORD PTR [eax]
    19bb:	00 02                	add    BYTE PTR [edx],al
    19bd:	91                   	xchg   ecx,eax
    19be:	00 0d 2c 02 00 00    	add    BYTE PTR ds:0x22c,cl
    19c4:	01 12                	add    DWORD PTR [edx],edx
    19c6:	c0 00 00             	rol    BYTE PTR [eax],0x0
    19c9:	00 02                	add    BYTE PTR [edx],al
    19cb:	91                   	xchg   ecx,eax
    19cc:	04 0d                	add    al,0xd
    19ce:	c3                   	ret    
    19cf:	03 00                	add    eax,DWORD PTR [eax]
    19d1:	00 01                	add    BYTE PTR [ecx],al
    19d3:	12 7a 00             	adc    bh,BYTE PTR [edx+0x0]
    19d6:	00 00                	add    BYTE PTR [eax],al
    19d8:	02 91 08 0d a8 07    	add    dl,BYTE PTR [ecx+0x7a80d08]
    19de:	00 00                	add    BYTE PTR [eax],al
    19e0:	01 12                	add    DWORD PTR [edx],edx
    19e2:	5b                   	pop    ebx
    19e3:	03 00                	add    eax,DWORD PTR [eax]
    19e5:	00 02                	add    BYTE PTR [edx],al
    19e7:	91                   	xchg   ecx,eax
    19e8:	0c 00                	or     al,0x0
    19ea:	0c 60                	or     al,0x60
    19ec:	07                   	pop    es
    19ed:	00 00                	add    BYTE PTR [eax],al
    19ef:	01 17                	add    DWORD PTR [edi],edx
    19f1:	7a 00                	jp     19f3 <sysEnter_Vector-0x12e60d>
    19f3:	00 00                	add    BYTE PTR [eax],al
    19f5:	94                   	xchg   esp,eax
    19f6:	0e                   	push   cs
    19f7:	00 30                	add    BYTE PTR [eax],dh
    19f9:	26 00 00             	add    BYTE PTR es:[eax],al
    19fc:	00 01                	add    BYTE PTR [ecx],al
    19fe:	9c                   	pushf  
    19ff:	3a 04 00             	cmp    al,BYTE PTR [eax+eax*1]
    1a02:	00 0d 5b 07 00 00    	add    BYTE PTR ds:0x75b,cl
    1a08:	01 17                	add    DWORD PTR [edi],edx
    1a0a:	55                   	push   ebp
    1a0b:	03 00                	add    eax,DWORD PTR [eax]
    1a0d:	00 02                	add    BYTE PTR [edx],al
    1a0f:	91                   	xchg   ecx,eax
    1a10:	00 0d 2c 02 00 00    	add    BYTE PTR ds:0x22c,cl
    1a16:	01 17                	add    DWORD PTR [edi],edx
    1a18:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
    1a19:	00 00                	add    BYTE PTR [eax],al
    1a1b:	00 02                	add    BYTE PTR [edx],al
    1a1d:	91                   	xchg   ecx,eax
    1a1e:	04 0d                	add    al,0xd
    1a20:	c3                   	ret    
    1a21:	03 00                	add    eax,DWORD PTR [eax]
    1a23:	00 01                	add    BYTE PTR [ecx],al
    1a25:	17                   	pop    ss
    1a26:	7a 00                	jp     1a28 <sysEnter_Vector-0x12e5d8>
    1a28:	00 00                	add    BYTE PTR [eax],al
    1a2a:	02 91 08 0d a8 07    	add    dl,BYTE PTR [ecx+0x7a80d08]
    1a30:	00 00                	add    BYTE PTR [eax],al
    1a32:	01 17                	add    DWORD PTR [edi],edx
    1a34:	5b                   	pop    ebx
    1a35:	03 00                	add    eax,DWORD PTR [eax]
    1a37:	00 02                	add    BYTE PTR [edx],al
    1a39:	91                   	xchg   ecx,eax
    1a3a:	0c 00                	or     al,0x0
    1a3c:	0e                   	push   cs
    1a3d:	4e                   	dec    esi
    1a3e:	07                   	pop    es
    1a3f:	00 00                	add    BYTE PTR [eax],al
    1a41:	01 1c ba             	add    DWORD PTR [edx+edi*4],ebx
    1a44:	0e                   	push   cs
    1a45:	00 30                	add    BYTE PTR [eax],dh
    1a47:	37                   	aaa    
    1a48:	01 00                	add    DWORD PTR [eax],eax
    1a4a:	00 01                	add    BYTE PTR [ecx],al
    1a4c:	9c                   	pushf  
    1a4d:	05 05 00 00 0f       	add    eax,0xf000005
    1a52:	72 6f                	jb     1ac3 <sysEnter_Vector-0x12e53d>
    1a54:	77 00                	ja     1a56 <sysEnter_Vector-0x12e5aa>
    1a56:	01 1c 3a             	add    DWORD PTR [edx+edi*1],ebx
    1a59:	00 00                	add    BYTE PTR [eax],al
    1a5b:	00 02                	add    BYTE PTR [edx],al
    1a5d:	91                   	xchg   ecx,eax
    1a5e:	00 0f                	add    BYTE PTR [edi],cl
    1a60:	63 6f 6c             	arpl   WORD PTR [edi+0x6c],bp
    1a63:	00 01                	add    BYTE PTR [ecx],al
    1a65:	1c 3a                	sbb    al,0x3a
    1a67:	00 00                	add    BYTE PTR [eax],al
    1a69:	00 02                	add    BYTE PTR [edx],al
    1a6b:	91                   	xchg   ecx,eax
    1a6c:	04 10                	add    al,0x10
    1a6e:	97                   	xchg   edi,eax
    1a6f:	06                   	push   es
    1a70:	00 00                	add    BYTE PTR [eax],al
    1a72:	01 1e                	add    DWORD PTR [esi],ebx
    1a74:	05 05 00 00 02       	add    eax,0x2000005
    1a79:	91                   	xchg   ecx,eax
    1a7a:	56                   	push   esi
    1a7b:	10 15 08 00 00 01    	adc    BYTE PTR ds:0x1000008,dl
    1a81:	1f                   	pop    ds
    1a82:	15 05 00 00 02       	adc    eax,0x2000005
    1a87:	91                   	xchg   ecx,eax
    1a88:	53                   	push   ebx
    1a89:	10 7c 06 00          	adc    BYTE PTR [esi+eax*1+0x0],bh
    1a8d:	00 01                	add    BYTE PTR [ecx],al
    1a8f:	1f                   	pop    ds
    1a90:	15 05 00 00 02       	adc    eax,0x2000005
    1a95:	91                   	xchg   ecx,eax
    1a96:	50                   	push   eax
    1a97:	10 40 07             	adc    BYTE PTR [eax+0x7],al
    1a9a:	00 00                	add    BYTE PTR [eax],al
    1a9c:	01 20                	add    DWORD PTR [eax],esp
    1a9e:	3a 00                	cmp    al,BYTE PTR [eax]
    1aa0:	00 00                	add    BYTE PTR [eax],al
    1aa2:	02 91 6c 11 2b 06    	add    dl,BYTE PTR [ecx+0x62b116c]
    1aa8:	00 00                	add    BYTE PTR [eax],al
    1aaa:	01 23                	add    DWORD PTR [ebx],esp
    1aac:	3a 00                	cmp    al,BYTE PTR [eax]
    1aae:	00 00                	add    BYTE PTR [eax],al
    1ab0:	b4 04                	mov    ah,0x4
    1ab2:	00 00                	add    BYTE PTR [eax],al
    1ab4:	12 00                	adc    al,BYTE PTR [eax]
    1ab6:	13 26                	adc    esp,DWORD PTR [esi]
    1ab8:	0f 00                	(bad)  
    1aba:	30 3d 00 00 00 d0    	xor    BYTE PTR ds:0xd0000000,bh
    1ac0:	04 00                	add    al,0x0
    1ac2:	00 14 63             	add    BYTE PTR [ebx+eiz*2],dl
    1ac5:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1ac6:	74 00                	je     1ac8 <sysEnter_Vector-0x12e538>
    1ac8:	01 2d 3a 00 00 00    	add    DWORD PTR ds:0x3a,ebp
    1ace:	02 91 68 00 13 71    	add    dl,BYTE PTR [ecx+0x71130068]
    1ad4:	0f 00                	(bad)  
    1ad6:	30 3d 00 00 00 ec    	xor    BYTE PTR ds:0xec000000,bh
    1adc:	04 00                	add    al,0x0
    1ade:	00 14 63             	add    BYTE PTR [ebx+eiz*2],dl
    1ae1:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1ae2:	74 00                	je     1ae4 <sysEnter_Vector-0x12e51c>
    1ae4:	01 33                	add    DWORD PTR [ebx],esi
    1ae6:	3a 00                	cmp    al,BYTE PTR [eax]
    1ae8:	00 00                	add    BYTE PTR [eax],al
    1aea:	02 91 64 00 15 bc    	add    dl,BYTE PTR [ecx-0x43eaff9c]
    1af0:	0f 00                	(bad)  
    1af2:	30 20                	xor    BYTE PTR [eax],ah
    1af4:	00 00                	add    BYTE PTR [eax],al
    1af6:	00 14 63             	add    BYTE PTR [ebx+eiz*2],dl
    1af9:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1afa:	74 00                	je     1afc <sysEnter_Vector-0x12e504>
    1afc:	01 39                	add    DWORD PTR [ecx],edi
    1afe:	3a 00                	cmp    al,BYTE PTR [eax]
    1b00:	00 00                	add    BYTE PTR [eax],al
    1b02:	02 91 60 00 00 16    	add    dl,BYTE PTR [ecx+0x16000060]
    1b08:	25 00 00 00 15       	and    eax,0x15000000
    1b0d:	05 00 00 17 b7       	add    eax,0xb7170000
    1b12:	00 00                	add    BYTE PTR [eax],al
    1b14:	00 09                	add    BYTE PTR [ecx],cl
    1b16:	00 16                	add    BYTE PTR [esi],dl
    1b18:	25 00 00 00 25       	and    eax,0x25000000
    1b1d:	05 00 00 17 b7       	add    eax,0xb7170000
    1b22:	00 00                	add    BYTE PTR [eax],al
    1b24:	00 02                	add    BYTE PTR [edx],al
    1b26:	00 18                	add    BYTE PTR [eax],bl
    1b28:	f4                   	hlt    
    1b29:	07                   	pop    es
    1b2a:	00 00                	add    BYTE PTR [eax],al
    1b2c:	01 42 f1             	add    DWORD PTR [edx-0xf],eax
    1b2f:	0f 00                	(bad)  
    1b31:	30 84 00 00 00 01 9c 	xor    BYTE PTR [eax+eax*1-0x63ff0000],al
    1b38:	64                   	fs
    1b39:	05 00 00 10 97       	add    eax,0x97100000
    1b3e:	06                   	push   es
    1b3f:	00 00                	add    BYTE PTR [eax],al
    1b41:	01 44 64 05          	add    DWORD PTR [esp+eiz*2+0x5],eax
    1b45:	00 00                	add    BYTE PTR [eax],al
    1b47:	02 91 67 10 40 07    	add    dl,BYTE PTR [ecx+0x7401067]
    1b4d:	00 00                	add    BYTE PTR [eax],al
    1b4f:	01 45 3a             	add    DWORD PTR [ebp+0x3a],eax
    1b52:	00 00                	add    BYTE PTR [eax],al
    1b54:	00 02                	add    BYTE PTR [edx],al
    1b56:	91                   	xchg   ecx,eax
    1b57:	6c                   	ins    BYTE PTR es:[edi],dx
    1b58:	19 2b                	sbb    DWORD PTR [ebx],ebp
    1b5a:	06                   	push   es
    1b5b:	00 00                	add    BYTE PTR [eax],al
    1b5d:	01 23                	add    DWORD PTR [ebx],esp
    1b5f:	3a 00                	cmp    al,BYTE PTR [eax]
    1b61:	00 00                	add    BYTE PTR [eax],al
    1b63:	12 00                	adc    al,BYTE PTR [eax]
    1b65:	00 16                	add    BYTE PTR [esi],dl
    1b67:	25 00 00 00 74       	and    eax,0x74000000
    1b6c:	05 00 00 17 b7       	add    eax,0xb7170000
    1b71:	00 00                	add    BYTE PTR [eax],al
    1b73:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1b76:	1a 8d 07 00 00 01    	sbb    cl,BYTE PTR [ebp+0x1000007]
    1b7c:	54                   	push   esp
    1b7d:	75 10                	jne    1b8f <sysEnter_Vector-0x12e471>
    1b7f:	00 30                	add    BYTE PTR [eax],dh
    1b81:	53                   	push   ebx
    1b82:	00 00                	add    BYTE PTR [eax],al
    1b84:	00 01                	add    BYTE PTR [ecx],al
    1b86:	9c                   	pushf  
    1b87:	1b 3f                	sbb    edi,DWORD PTR [edi]
    1b89:	00 00                	add    BYTE PTR [eax],al
    1b8b:	00 07                	add    BYTE PTR [edi],al
    1b8d:	34 56                	xor    al,0x56
    1b8f:	00 00                	add    BYTE PTR [eax],al
    1b91:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    1b97:	30 1b                	xor    BYTE PTR [ebx],bl
    1b99:	aa                   	stos   BYTE PTR es:[edi],al
    1b9a:	00 00                	add    BYTE PTR [eax],al
    1b9c:	00 07                	add    BYTE PTR [edi],al
    1b9e:	35 56 00 00 00       	xor    eax,0x56
    1ba3:	05 03 70 3a 00       	add    eax,0x3a7003
    1ba8:	30 1b                	xor    BYTE PTR [ebx],bl
    1baa:	56                   	push   esi
    1bab:	01 00                	add    DWORD PTR [eax],eax
    1bad:	00 07                	add    BYTE PTR [edi],al
    1baf:	36                   	ss
    1bb0:	56                   	push   esi
    1bb1:	00 00                	add    BYTE PTR [eax],al
    1bb3:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    1bb9:	30 1b                	xor    BYTE PTR [ebx],bl
    1bbb:	48                   	dec    eax
    1bbc:	00 00                	add    BYTE PTR [eax],al
    1bbe:	00 08                	add    BYTE PTR [eax],cl
    1bc0:	38 9a 00 00 00 05    	cmp    BYTE PTR [edx+0x5000000],bl
    1bc6:	03 74 3a 00          	add    esi,DWORD PTR [edx+edi*1+0x0]
    1bca:	30 1b                	xor    BYTE PTR [ebx],bl
    1bcc:	94                   	xchg   esp,eax
    1bcd:	07                   	pop    es
    1bce:	00 00                	add    BYTE PTR [eax],al
    1bd0:	01 0e                	add    DWORD PTR [esi],ecx
    1bd2:	8b 03                	mov    eax,DWORD PTR [ebx]
    1bd4:	00 00                	add    BYTE PTR [eax],al
    1bd6:	05 03 80 3a 00       	add    eax,0x3a8003
    1bdb:	30 1b                	xor    BYTE PTR [ebx],bl
    1bdd:	be 07 00 00 01       	mov    esi,0x1000007
    1be2:	0f 68 02             	punpckhbw mm0,QWORD PTR [edx]
    1be5:	00 00                	add    BYTE PTR [eax],al
    1be7:	05 03 c0 38 00       	add    eax,0x38c003
    1bec:	30 1b                	xor    BYTE PTR [ebx],bl
    1bee:	d3 07                	rol    DWORD PTR [edi],cl
    1bf0:	00 00                	add    BYTE PTR [eax],al
    1bf2:	01 10                	add    DWORD PTR [eax],edx
    1bf4:	d6                   	(bad)  
    1bf5:	02 00                	add    al,BYTE PTR [eax]
    1bf7:	00 05 03 88 3a 00    	add    BYTE PTR ds:0x3a8803,al
    1bfd:	30 00                	xor    BYTE PTR [eax],al
    1bff:	ae                   	scas   al,BYTE PTR es:[edi]
    1c00:	01 00                	add    DWORD PTR [eax],eax
    1c02:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1c05:	de 09                	fimul  WORD PTR [ecx]
    1c07:	00 00                	add    BYTE PTR [eax],al
    1c09:	04 01                	add    al,0x1
    1c0b:	ef                   	out    dx,eax
    1c0c:	00 00                	add    BYTE PTR [eax],al
    1c0e:	00 0c 41             	add    BYTE PTR [ecx+eax*2],cl
    1c11:	08 00                	or     BYTE PTR [eax],al
    1c13:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1c16:	00 00                	add    BYTE PTR [eax],al
    1c18:	c8 10 00 30          	enter  0x10,0x30
    1c1c:	eb 00                	jmp    1c1e <sysEnter_Vector-0x12e3e2>
    1c1e:	00 00                	add    BYTE PTR [eax],al
    1c20:	7d 0b                	jge    1c2d <sysEnter_Vector-0x12e3d3>
    1c22:	00 00                	add    BYTE PTR [eax],al
    1c24:	02 01                	add    al,BYTE PTR [ecx]
    1c26:	06                   	push   es
    1c27:	58                   	pop    eax
    1c28:	00 00                	add    BYTE PTR [eax],al
    1c2a:	00 02                	add    BYTE PTR [edx],al
    1c2c:	01 06                	add    DWORD PTR [esi],eax
    1c2e:	51                   	push   ecx
    1c2f:	00 00                	add    BYTE PTR [eax],al
    1c31:	00 02                	add    BYTE PTR [edx],al
    1c33:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1c39:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1c40:	02 08                	add    cl,BYTE PTR [eax]
    1c42:	05 00 00 00 00       	add    eax,0x0
    1c47:	02 01                	add    al,BYTE PTR [ecx]
    1c49:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1c4c:	00 00                	add    BYTE PTR [eax],al
    1c4e:	02 02                	add    al,BYTE PTR [edx]
    1c50:	07                   	pop    es
    1c51:	0e                   	push   cs
    1c52:	00 00                	add    BYTE PTR [eax],al
    1c54:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1c57:	00 00                	add    BYTE PTR [eax],al
    1c59:	00 02                	add    BYTE PTR [edx],al
    1c5b:	34 61                	xor    al,0x61
    1c5d:	00 00                	add    BYTE PTR [eax],al
    1c5f:	00 02                	add    BYTE PTR [edx],al
    1c61:	04 07                	add    al,0x7
    1c63:	32 00                	xor    al,BYTE PTR [eax]
    1c65:	00 00                	add    BYTE PTR [eax],al
    1c67:	02 08                	add    cl,BYTE PTR [eax]
    1c69:	07                   	pop    es
    1c6a:	28 00                	sub    BYTE PTR [eax],al
    1c6c:	00 00                	add    BYTE PTR [eax],al
    1c6e:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1c75:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1c78:	96                   	xchg   esi,eax
    1c79:	00 00                	add    BYTE PTR [eax],al
    1c7b:	00 02                	add    BYTE PTR [edx],al
    1c7d:	01 02                	add    DWORD PTR [edx],eax
    1c7f:	90                   	nop
    1c80:	00 00                	add    BYTE PTR [eax],al
    1c82:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1c89:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1c8c:	00 00                	add    BYTE PTR [eax],al
    1c8e:	05 04 95 00 00       	add    eax,0x9504
    1c93:	00 06                	add    BYTE PTR [esi],al
    1c95:	25 00 00 00 02       	and    eax,0x2000000
    1c9a:	04 07                	add    al,0x7
    1c9c:	2d 00 00 00 02       	sub    eax,0x2000000
    1ca1:	04 07                	add    al,0x7
    1ca3:	dc 00                	fadd   QWORD PTR [eax]
    1ca5:	00 00                	add    BYTE PTR [eax],al
    1ca7:	05 04 25 00 00       	add    eax,0x2504
    1cac:	00 07                	add    BYTE PTR [edi],al
    1cae:	3a 08                	cmp    cl,BYTE PTR [eax]
    1cb0:	00 00                	add    BYTE PTR [eax],al
    1cb2:	01 1d a8 00 00 00    	add    DWORD PTR ds:0xa8,ebx
    1cb8:	c8 10 00 30          	enter  0x10,0x30
    1cbc:	3e 00 00             	add    BYTE PTR ds:[eax],al
    1cbf:	00 01                	add    BYTE PTR [ecx],al
    1cc1:	9c                   	pushf  
    1cc2:	f1                   	icebp  
    1cc3:	00 00                	add    BYTE PTR [eax],al
    1cc5:	00 08                	add    BYTE PTR [eax],cl
    1cc7:	01 06                	add    DWORD PTR [esi],eax
    1cc9:	00 00                	add    BYTE PTR [eax],al
    1ccb:	01 1d a8 00 00 00    	add    DWORD PTR ds:0xa8,ebx
    1cd1:	02 91 00 09 73 72    	add    dl,BYTE PTR [ecx+0x72730900]
    1cd7:	63 00                	arpl   WORD PTR [eax],ax
    1cd9:	01 1d 8f 00 00 00    	add    DWORD PTR ds:0x8f,ebx
    1cdf:	02 91 04 0a f2 01    	add    dl,BYTE PTR [ecx+0x1f20a04]
    1ce5:	00 00                	add    BYTE PTR [eax],al
    1ce7:	01 1f                	add    DWORD PTR [edi],ebx
    1ce9:	3a 00                	cmp    al,BYTE PTR [eax]
    1ceb:	00 00                	add    BYTE PTR [eax],al
    1ced:	0b 00                	or     eax,DWORD PTR [eax]
    1cef:	00 07                	add    BYTE PTR [edi],al
    1cf1:	32 08                	xor    cl,BYTE PTR [eax]
    1cf3:	00 00                	add    BYTE PTR [eax],al
    1cf5:	01 23                	add    DWORD PTR [ebx],esp
    1cf7:	a8 00                	test   al,0x0
    1cf9:	00 00                	add    BYTE PTR [eax],al
    1cfb:	06                   	push   es
    1cfc:	11 00                	adc    DWORD PTR [eax],eax
    1cfe:	30 3e                	xor    BYTE PTR [esi],bh
    1d00:	00 00                	add    BYTE PTR [eax],al
    1d02:	00 01                	add    BYTE PTR [ecx],al
    1d04:	9c                   	pushf  
    1d05:	27                   	daa    
    1d06:	01 00                	add    DWORD PTR [eax],eax
    1d08:	00 08                	add    BYTE PTR [eax],cl
    1d0a:	01 06                	add    DWORD PTR [esi],eax
    1d0c:	00 00                	add    BYTE PTR [eax],al
    1d0e:	01 23                	add    DWORD PTR [ebx],esp
    1d10:	a8 00                	test   al,0x0
    1d12:	00 00                	add    BYTE PTR [eax],al
    1d14:	02 91 00 09 73 72    	add    dl,BYTE PTR [ecx+0x72730900]
    1d1a:	63 00                	arpl   WORD PTR [eax],ax
    1d1c:	01 23                	add    DWORD PTR [ebx],esp
    1d1e:	8f 00                	pop    DWORD PTR [eax]
    1d20:	00 00                	add    BYTE PTR [eax],al
    1d22:	02 91 04 00 0c 26    	add    dl,BYTE PTR [ecx+0x260c0004]
    1d28:	08 00                	or     BYTE PTR [eax],al
    1d2a:	00 01                	add    BYTE PTR [ecx],al
    1d2c:	29 44 11 00          	sub    DWORD PTR [ecx+edx*1+0x0],eax
    1d30:	30 6f 00             	xor    BYTE PTR [edi+0x0],ch
    1d33:	00 00                	add    BYTE PTR [eax],al
    1d35:	01 9c 6d 01 00 00 09 	add    DWORD PTR [ebp+ebp*2+0x9000001],ebx
    1d3c:	70 00                	jo     1d3e <sysEnter_Vector-0x12e2c2>
    1d3e:	01 29                	add    DWORD PTR [ecx],ebp
    1d40:	a8 00                	test   al,0x0
    1d42:	00 00                	add    BYTE PTR [eax],al
    1d44:	02 91 00 09 71 00    	add    dl,BYTE PTR [ecx+0x710900]
    1d4a:	01 29                	add    DWORD PTR [ecx],ebp
    1d4c:	a8 00                	test   al,0x0
    1d4e:	00 00                	add    BYTE PTR [eax],al
    1d50:	02 91 04 0d 63 00    	add    dl,BYTE PTR [ecx+0x630d04]
    1d56:	01 2a                	add    DWORD PTR [edx],ebp
    1d58:	3a 00                	cmp    al,BYTE PTR [eax]
    1d5a:	00 00                	add    BYTE PTR [eax],al
    1d5c:	02 91 74 0d 64 00    	add    dl,BYTE PTR [ecx+0x640d74]
    1d62:	01 2a                	add    DWORD PTR [edx],ebp
    1d64:	3a 00                	cmp    al,BYTE PTR [eax]
    1d66:	00 00                	add    BYTE PTR [eax],al
    1d68:	02 91 70 00 0e 3f    	add    dl,BYTE PTR [ecx+0x3f0e0070]
    1d6e:	00 00                	add    BYTE PTR [eax],al
    1d70:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1d73:	56                   	push   esi
    1d74:	00 00                	add    BYTE PTR [eax],al
    1d76:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    1d7c:	30 0e                	xor    BYTE PTR [esi],cl
    1d7e:	aa                   	stos   BYTE PTR es:[edi],al
    1d7f:	00 00                	add    BYTE PTR [eax],al
    1d81:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    1d88:	05 03 70 3a 00       	add    eax,0x3a7003
    1d8d:	30 0e                	xor    BYTE PTR [esi],cl
    1d8f:	56                   	push   esi
    1d90:	01 00                	add    DWORD PTR [eax],eax
    1d92:	00 04 36             	add    BYTE PTR [esi+esi*1],al
    1d95:	56                   	push   esi
    1d96:	00 00                	add    BYTE PTR [eax],al
    1d98:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    1d9e:	30 0e                	xor    BYTE PTR [esi],cl
    1da0:	48                   	dec    eax
    1da1:	00 00                	add    BYTE PTR [eax],al
    1da3:	00 05 38 84 00 00    	add    BYTE PTR ds:0x8438,al
    1da9:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
    1daf:	30 00                	xor    BYTE PTR [eax],al
    1db1:	5a                   	pop    edx
    1db2:	01 00                	add    DWORD PTR [eax],eax
    1db4:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1db7:	af                   	scas   eax,DWORD PTR es:[edi]
    1db8:	0a 00                	or     al,BYTE PTR [eax]
    1dba:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1dbd:	ef                   	out    dx,eax
    1dbe:	00 00                	add    BYTE PTR [eax],al
    1dc0:	00 0c 5d 08 00 00 6d 	add    BYTE PTR [ebx*2+0x6d000008],cl
    1dc7:	00 00                	add    BYTE PTR [eax],al
    1dc9:	00 b4 11 00 30 5e 00 	add    BYTE PTR [ecx+edx*1+0x5e3000],dh
    1dd0:	00 00                	add    BYTE PTR [eax],al
    1dd2:	57                   	push   edi
    1dd3:	0c 00                	or     al,0x0
    1dd5:	00 02                	add    BYTE PTR [edx],al
    1dd7:	01 06                	add    DWORD PTR [esi],eax
    1dd9:	58                   	pop    eax
    1dda:	00 00                	add    BYTE PTR [eax],al
    1ddc:	00 02                	add    BYTE PTR [edx],al
    1dde:	01 06                	add    DWORD PTR [esi],eax
    1de0:	51                   	push   ecx
    1de1:	00 00                	add    BYTE PTR [eax],al
    1de3:	00 02                	add    BYTE PTR [edx],al
    1de5:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1deb:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1df2:	02 08                	add    cl,BYTE PTR [eax]
    1df4:	05 00 00 00 00       	add    eax,0x0
    1df9:	02 01                	add    al,BYTE PTR [ecx]
    1dfb:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1dfe:	00 00                	add    BYTE PTR [eax],al
    1e00:	02 02                	add    al,BYTE PTR [edx]
    1e02:	07                   	pop    es
    1e03:	0e                   	push   cs
    1e04:	00 00                	add    BYTE PTR [eax],al
    1e06:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1e09:	00 00                	add    BYTE PTR [eax],al
    1e0b:	00 02                	add    BYTE PTR [edx],al
    1e0d:	34 61                	xor    al,0x61
    1e0f:	00 00                	add    BYTE PTR [eax],al
    1e11:	00 02                	add    BYTE PTR [edx],al
    1e13:	04 07                	add    al,0x7
    1e15:	32 00                	xor    al,BYTE PTR [eax]
    1e17:	00 00                	add    BYTE PTR [eax],al
    1e19:	02 08                	add    cl,BYTE PTR [eax]
    1e1b:	07                   	pop    es
    1e1c:	28 00                	sub    BYTE PTR [eax],al
    1e1e:	00 00                	add    BYTE PTR [eax],al
    1e20:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1e27:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1e2a:	96                   	xchg   esi,eax
    1e2b:	00 00                	add    BYTE PTR [eax],al
    1e2d:	00 02                	add    BYTE PTR [edx],al
    1e2f:	01 02                	add    DWORD PTR [edx],eax
    1e31:	90                   	nop
    1e32:	00 00                	add    BYTE PTR [eax],al
    1e34:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1e3b:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1e3e:	00 00                	add    BYTE PTR [eax],al
    1e40:	05 04 95 00 00       	add    eax,0x9504
    1e45:	00 06                	add    BYTE PTR [esi],al
    1e47:	25 00 00 00 02       	and    eax,0x2000000
    1e4c:	04 07                	add    al,0x7
    1e4e:	2d 00 00 00 02       	sub    eax,0x2000000
    1e53:	04 07                	add    al,0x7
    1e55:	dc 00                	fadd   QWORD PTR [eax]
    1e57:	00 00                	add    BYTE PTR [eax],al
    1e59:	07                   	pop    es
    1e5a:	56                   	push   esi
    1e5b:	08 00                	or     BYTE PTR [eax],al
    1e5d:	00 01                	add    BYTE PTR [ecx],al
    1e5f:	18 3a                	sbb    BYTE PTR [edx],bh
    1e61:	00 00                	add    BYTE PTR [eax],al
    1e63:	00 b4 11 00 30 5e 00 	add    BYTE PTR [ecx+edx*1+0x5e3000],dh
    1e6a:	00 00                	add    BYTE PTR [eax],al
    1e6c:	01 9c 0e 01 00 00 08 	add    DWORD PTR [esi+ecx*1+0x8000001],ebx
    1e73:	70 31                	jo     1ea6 <sysEnter_Vector-0x12e15a>
    1e75:	00 01                	add    BYTE PTR [ecx],al
    1e77:	18 8f 00 00 00 02    	sbb    BYTE PTR [edi+0x2000000],cl
    1e7d:	91                   	xchg   ecx,eax
    1e7e:	00 08                	add    BYTE PTR [eax],cl
    1e80:	70 32                	jo     1eb4 <sysEnter_Vector-0x12e14c>
    1e82:	00 01                	add    BYTE PTR [ecx],al
    1e84:	18 8f 00 00 00 02    	sbb    BYTE PTR [edi+0x2000000],cl
    1e8a:	91                   	xchg   ecx,eax
    1e8b:	04 09                	add    al,0x9
    1e8d:	73 31                	jae    1ec0 <sysEnter_Vector-0x12e140>
    1e8f:	00 01                	add    BYTE PTR [ecx],al
    1e91:	1a 0e                	sbb    cl,BYTE PTR [esi]
    1e93:	01 00                	add    DWORD PTR [eax],eax
    1e95:	00 01                	add    BYTE PTR [ecx],al
    1e97:	53                   	push   ebx
    1e98:	09 73 32             	or     DWORD PTR [ebx+0x32],esi
    1e9b:	00 01                	add    BYTE PTR [ecx],al
    1e9d:	1b 0e                	sbb    ecx,DWORD PTR [esi]
    1e9f:	01 00                	add    DWORD PTR [eax],eax
    1ea1:	00 01                	add    BYTE PTR [ecx],al
    1ea3:	56                   	push   esi
    1ea4:	09 63 31             	or     DWORD PTR [ebx+0x31],esp
    1ea7:	00 01                	add    BYTE PTR [ecx],al
    1ea9:	1c 48                	sbb    al,0x48
    1eab:	00 00                	add    BYTE PTR [eax],al
    1ead:	00 02                	add    BYTE PTR [edx],al
    1eaf:	91                   	xchg   ecx,eax
    1eb0:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1eb1:	09 63 32             	or     DWORD PTR [ebx+0x32],esp
    1eb4:	00 01                	add    BYTE PTR [ecx],al
    1eb6:	1c 48                	sbb    al,0x48
    1eb8:	00 00                	add    BYTE PTR [eax],al
    1eba:	00 02                	add    BYTE PTR [edx],al
    1ebc:	91                   	xchg   ecx,eax
    1ebd:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1ebe:	00 05 04 14 01 00    	add    BYTE PTR ds:0x11404,al
    1ec4:	00 06                	add    BYTE PTR [esi],al
    1ec6:	48                   	dec    eax
    1ec7:	00 00                	add    BYTE PTR [eax],al
    1ec9:	00 0a                	add    BYTE PTR [edx],cl
    1ecb:	3f                   	aas    
    1ecc:	00 00                	add    BYTE PTR [eax],al
    1ece:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1ed1:	56                   	push   esi
    1ed2:	00 00                	add    BYTE PTR [eax],al
    1ed4:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    1eda:	30 0a                	xor    BYTE PTR [edx],cl
    1edc:	aa                   	stos   BYTE PTR es:[edi],al
    1edd:	00 00                	add    BYTE PTR [eax],al
    1edf:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    1ee6:	05 03 70 3a 00       	add    eax,0x3a7003
    1eeb:	30 0a                	xor    BYTE PTR [edx],cl
    1eed:	56                   	push   esi
    1eee:	01 00                	add    DWORD PTR [eax],eax
    1ef0:	00 04 36             	add    BYTE PTR [esi+esi*1],al
    1ef3:	56                   	push   esi
    1ef4:	00 00                	add    BYTE PTR [eax],al
    1ef6:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    1efc:	30 0a                	xor    BYTE PTR [edx],cl
    1efe:	48                   	dec    eax
    1eff:	00 00                	add    BYTE PTR [eax],al
    1f01:	00 05 38 84 00 00    	add    BYTE PTR ds:0x8438,al
    1f07:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
    1f0d:	30 00                	xor    BYTE PTR [eax],al
    1f0f:	bd 01 00 00 04       	mov    ebp,0x4000001
    1f14:	00 41 0b             	add    BYTE PTR [ecx+0xb],al
    1f17:	00 00                	add    BYTE PTR [eax],al
    1f19:	04 01                	add    al,0x1
    1f1b:	ef                   	out    dx,eax
    1f1c:	00 00                	add    BYTE PTR [eax],al
    1f1e:	00 0c 8f             	add    BYTE PTR [edi+ecx*4],cl
    1f21:	08 00                	or     BYTE PTR [eax],al
    1f23:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1f26:	00 00                	add    BYTE PTR [eax],al
    1f28:	14 12                	adc    al,0x12
    1f2a:	00 30                	add    BYTE PTR [eax],dh
    1f2c:	c7 00 00 00 20 0d    	mov    DWORD PTR [eax],0xd200000
    1f32:	00 00                	add    BYTE PTR [eax],al
    1f34:	02 01                	add    al,BYTE PTR [ecx]
    1f36:	06                   	push   es
    1f37:	58                   	pop    eax
    1f38:	00 00                	add    BYTE PTR [eax],al
    1f3a:	00 02                	add    BYTE PTR [edx],al
    1f3c:	01 06                	add    DWORD PTR [esi],eax
    1f3e:	51                   	push   ecx
    1f3f:	00 00                	add    BYTE PTR [eax],al
    1f41:	00 02                	add    BYTE PTR [edx],al
    1f43:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1f49:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1f50:	02 08                	add    cl,BYTE PTR [eax]
    1f52:	05 00 00 00 00       	add    eax,0x0
    1f57:	02 01                	add    al,BYTE PTR [ecx]
    1f59:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1f5c:	00 00                	add    BYTE PTR [eax],al
    1f5e:	02 02                	add    al,BYTE PTR [edx]
    1f60:	07                   	pop    es
    1f61:	0e                   	push   cs
    1f62:	00 00                	add    BYTE PTR [eax],al
    1f64:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1f67:	00 00                	add    BYTE PTR [eax],al
    1f69:	00 02                	add    BYTE PTR [edx],al
    1f6b:	34 61                	xor    al,0x61
    1f6d:	00 00                	add    BYTE PTR [eax],al
    1f6f:	00 02                	add    BYTE PTR [edx],al
    1f71:	04 07                	add    al,0x7
    1f73:	32 00                	xor    al,BYTE PTR [eax]
    1f75:	00 00                	add    BYTE PTR [eax],al
    1f77:	02 08                	add    cl,BYTE PTR [eax]
    1f79:	07                   	pop    es
    1f7a:	28 00                	sub    BYTE PTR [eax],al
    1f7c:	00 00                	add    BYTE PTR [eax],al
    1f7e:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1f85:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1f88:	96                   	xchg   esi,eax
    1f89:	00 00                	add    BYTE PTR [eax],al
    1f8b:	00 02                	add    BYTE PTR [edx],al
    1f8d:	01 02                	add    DWORD PTR [edx],eax
    1f8f:	90                   	nop
    1f90:	00 00                	add    BYTE PTR [eax],al
    1f92:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1f99:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1f9c:	00 00                	add    BYTE PTR [eax],al
    1f9e:	05 04 95 00 00       	add    eax,0x9504
    1fa3:	00 06                	add    BYTE PTR [esi],al
    1fa5:	25 00 00 00 02       	and    eax,0x2000000
    1faa:	04 07                	add    al,0x7
    1fac:	2d 00 00 00 02       	sub    eax,0x2000000
    1fb1:	04 07                	add    al,0x7
    1fb3:	dc 00                	fadd   QWORD PTR [eax]
    1fb5:	00 00                	add    BYTE PTR [eax],al
    1fb7:	05 04 25 00 00       	add    eax,0x2504
    1fbc:	00 07                	add    BYTE PTR [edi],al
    1fbe:	72 08                	jb     1fc8 <sysEnter_Vector-0x12e038>
    1fc0:	00 00                	add    BYTE PTR [eax],al
    1fc2:	01 04 a8             	add    DWORD PTR [eax+ebp*4],eax
    1fc5:	00 00                	add    BYTE PTR [eax],al
    1fc7:	00 14 12             	add    BYTE PTR [edx+edx*1],dl
    1fca:	00 30                	add    BYTE PTR [eax],dh
    1fcc:	40                   	inc    eax
    1fcd:	00 00                	add    BYTE PTR [eax],al
    1fcf:	00 01                	add    BYTE PTR [ecx],al
    1fd1:	9c                   	pushf  
    1fd2:	ee                   	out    dx,al
    1fd3:	00 00                	add    BYTE PTR [eax],al
    1fd5:	00 08                	add    BYTE PTR [eax],cl
    1fd7:	73 31                	jae    200a <sysEnter_Vector-0x12dff6>
    1fd9:	00 01                	add    BYTE PTR [ecx],al
    1fdb:	04 a8                	add    al,0xa8
    1fdd:	00 00                	add    BYTE PTR [eax],al
    1fdf:	00 02                	add    BYTE PTR [edx],al
    1fe1:	91                   	xchg   ecx,eax
    1fe2:	00 08                	add    BYTE PTR [eax],cl
    1fe4:	73 32                	jae    2018 <sysEnter_Vector-0x12dfe8>
    1fe6:	00 01                	add    BYTE PTR [ecx],al
    1fe8:	04 8f                	add    al,0x8f
    1fea:	00 00                	add    BYTE PTR [eax],al
    1fec:	00 02                	add    BYTE PTR [edx],al
    1fee:	91                   	xchg   ecx,eax
    1fef:	04 09                	add    al,0x9
    1ff1:	73 00                	jae    1ff3 <sysEnter_Vector-0x12e00d>
    1ff3:	01 06                	add    DWORD PTR [esi],eax
    1ff5:	a8 00                	test   al,0x0
    1ff7:	00 00                	add    BYTE PTR [eax],al
    1ff9:	02 91 74 00 07 87    	add    dl,BYTE PTR [ecx-0x78f8ff8c]
    1fff:	08 00                	or     BYTE PTR [eax],al
    2001:	00 01                	add    BYTE PTR [ecx],al
    2003:	0e                   	push   cs
    2004:	a8 00                	test   al,0x0
    2006:	00 00                	add    BYTE PTR [eax],al
    2008:	54                   	push   esp
    2009:	12 00                	adc    al,BYTE PTR [eax]
    200b:	30 40 00             	xor    BYTE PTR [eax+0x0],al
    200e:	00 00                	add    BYTE PTR [eax],al
    2010:	01 9c 2e 01 00 00 08 	add    DWORD PTR [esi+ebp*1+0x8000001],ebx
    2017:	73 31                	jae    204a <sysEnter_Vector-0x12dfb6>
    2019:	00 01                	add    BYTE PTR [ecx],al
    201b:	0e                   	push   cs
    201c:	a8 00                	test   al,0x0
    201e:	00 00                	add    BYTE PTR [eax],al
    2020:	02 91 00 08 73 32    	add    dl,BYTE PTR [ecx+0x32730800]
    2026:	00 01                	add    BYTE PTR [ecx],al
    2028:	0e                   	push   cs
    2029:	8f 00                	pop    DWORD PTR [eax]
    202b:	00 00                	add    BYTE PTR [eax],al
    202d:	02 91 04 09 73 00    	add    dl,BYTE PTR [ecx+0x730904]
    2033:	01 10                	add    DWORD PTR [eax],edx
    2035:	a8 00                	test   al,0x0
    2037:	00 00                	add    BYTE PTR [eax],al
    2039:	02 91 74 00 07 7f    	add    dl,BYTE PTR [ecx+0x7f070074]
    203f:	08 00                	or     BYTE PTR [eax],al
    2041:	00 01                	add    BYTE PTR [ecx],al
    2043:	18 a8 00 00 00 94    	sbb    BYTE PTR [eax-0x6c000000],ch
    2049:	12 00                	adc    al,BYTE PTR [eax]
    204b:	30 47 00             	xor    BYTE PTR [edi+0x0],al
    204e:	00 00                	add    BYTE PTR [eax],al
    2050:	01 9c 7c 01 00 00 08 	add    DWORD PTR [esp+edi*2+0x8000001],ebx
    2057:	73 31                	jae    208a <sysEnter_Vector-0x12df76>
    2059:	00 01                	add    BYTE PTR [ecx],al
    205b:	18 a8 00 00 00 02    	sbb    BYTE PTR [eax+0x2000000],ch
    2061:	91                   	xchg   ecx,eax
    2062:	00 08                	add    BYTE PTR [eax],cl
    2064:	73 32                	jae    2098 <sysEnter_Vector-0x12df68>
    2066:	00 01                	add    BYTE PTR [ecx],al
    2068:	18 8f 00 00 00 02    	sbb    BYTE PTR [edi+0x2000000],cl
    206e:	91                   	xchg   ecx,eax
    206f:	04 0a                	add    al,0xa
    2071:	79 08                	jns    207b <sysEnter_Vector-0x12df85>
    2073:	00 00                	add    BYTE PTR [eax],al
    2075:	01 18                	add    DWORD PTR [eax],ebx
    2077:	61                   	popa   
    2078:	00 00                	add    BYTE PTR [eax],al
    207a:	00 02                	add    BYTE PTR [edx],al
    207c:	91                   	xchg   ecx,eax
    207d:	08 09                	or     BYTE PTR [ecx],cl
    207f:	73 00                	jae    2081 <sysEnter_Vector-0x12df7f>
    2081:	01 1a                	add    DWORD PTR [edx],ebx
    2083:	a8 00                	test   al,0x0
    2085:	00 00                	add    BYTE PTR [eax],al
    2087:	02 91 74 00 0b 3f    	add    dl,BYTE PTR [ecx+0x3f0b0074]
    208d:	00 00                	add    BYTE PTR [eax],al
    208f:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    2092:	56                   	push   esi
    2093:	00 00                	add    BYTE PTR [eax],al
    2095:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    209b:	30 0b                	xor    BYTE PTR [ebx],cl
    209d:	aa                   	stos   BYTE PTR es:[edi],al
    209e:	00 00                	add    BYTE PTR [eax],al
    20a0:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    20a7:	05 03 70 3a 00       	add    eax,0x3a7003
    20ac:	30 0b                	xor    BYTE PTR [ebx],cl
    20ae:	56                   	push   esi
    20af:	01 00                	add    DWORD PTR [eax],eax
    20b1:	00 04 36             	add    BYTE PTR [esi+esi*1],al
    20b4:	56                   	push   esi
    20b5:	00 00                	add    BYTE PTR [eax],al
    20b7:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    20bd:	30 0b                	xor    BYTE PTR [ebx],cl
    20bf:	48                   	dec    eax
    20c0:	00 00                	add    BYTE PTR [eax],al
    20c2:	00 05 38 84 00 00    	add    BYTE PTR ds:0x8438,al
    20c8:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
    20ce:	30 00                	xor    BYTE PTR [eax],al
    20d0:	ca 00 00             	retf   0x0
    20d3:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    20d6:	e2 0b                	loop   20e3 <sysEnter_Vector-0x12df1d>
    20d8:	00 00                	add    BYTE PTR [eax],al
    20da:	04 01                	add    al,0x1
    20dc:	ef                   	out    dx,eax
    20dd:	00 00                	add    BYTE PTR [eax],al
    20df:	00 0c ab             	add    BYTE PTR [ebx+ebp*4],cl
    20e2:	08 00                	or     BYTE PTR [eax],al
    20e4:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    20e7:	00 00                	add    BYTE PTR [eax],al
    20e9:	dc 12                	fcom   QWORD PTR [edx]
    20eb:	00 30                	add    BYTE PTR [eax],dh
    20ed:	62 00                	bound  eax,QWORD PTR [eax]
    20ef:	00 00                	add    BYTE PTR [eax],al
    20f1:	0a 0e                	or     cl,BYTE PTR [esi]
    20f3:	00 00                	add    BYTE PTR [eax],al
    20f5:	02 04 05 69 6e 74 00 	add    al,BYTE PTR [eax*1+0x746e69]
    20fc:	03 9e 03 00 00 02    	add    ebx,DWORD PTR [esi+0x2000003]
    2102:	d8 37                	fdiv   DWORD PTR [edi]
    2104:	00 00                	add    BYTE PTR [eax],al
    2106:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    2109:	07                   	pop    es
    210a:	32 00                	xor    al,BYTE PTR [eax]
    210c:	00 00                	add    BYTE PTR [eax],al
    210e:	04 04                	add    al,0x4
    2110:	05 05 00 00 00       	add    eax,0x5
    2115:	04 08                	add    al,0x8
    2117:	05 00 00 00 00       	add    eax,0x0
    211c:	04 0c                	add    al,0xc
    211e:	04 96                	add    al,0x96
    2120:	00 00                	add    BYTE PTR [eax],al
    2122:	00 05 a4 08 00 00    	add    BYTE PTR ds:0x8a4,al
    2128:	01 03                	add    DWORD PTR [ebx],eax
    212a:	2c 00                	sub    al,0x0
    212c:	00 00                	add    BYTE PTR [eax],al
    212e:	dc 12                	fcom   QWORD PTR [edx]
    2130:	00 30                	add    BYTE PTR [eax],dh
    2132:	31 00                	xor    DWORD PTR [eax],eax
    2134:	00 00                	add    BYTE PTR [eax],al
    2136:	01 9c 89 00 00 00 06 	add    DWORD PTR [ecx+ecx*4+0x6000000],ebx
    213d:	73 74                	jae    21b3 <sysEnter_Vector-0x12de4d>
    213f:	72 00                	jb     2141 <sysEnter_Vector-0x12debf>
    2141:	01 03                	add    DWORD PTR [ebx],eax
    2143:	89 00                	mov    DWORD PTR [eax],eax
    2145:	00 00                	add    BYTE PTR [eax],al
    2147:	02 91 00 07 72 65    	add    dl,BYTE PTR [ecx+0x65720700]
    214d:	74 00                	je     214f <sysEnter_Vector-0x12deb1>
    214f:	01 04 2c             	add    DWORD PTR [esp+ebp*1],eax
    2152:	00 00                	add    BYTE PTR [eax],al
    2154:	00 02                	add    BYTE PTR [edx],al
    2156:	91                   	xchg   ecx,eax
    2157:	74 00                	je     2159 <sysEnter_Vector-0x12dea7>
    2159:	08 04 96             	or     BYTE PTR [esi+edx*4],al
    215c:	00 00                	add    BYTE PTR [eax],al
    215e:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    2161:	06                   	push   es
    2162:	58                   	pop    eax
    2163:	00 00                	add    BYTE PTR [eax],al
    2165:	00 09                	add    BYTE PTR [ecx],cl
    2167:	8f 00                	pop    DWORD PTR [eax]
    2169:	00 00                	add    BYTE PTR [eax],al
    216b:	0a f2                	or     dh,dl
    216d:	01 00                	add    DWORD PTR [eax],eax
    216f:	00 01                	add    BYTE PTR [ecx],al
    2171:	0a 2c 00             	or     ch,BYTE PTR [eax+eax*1]
    2174:	00 00                	add    BYTE PTR [eax],al
    2176:	0d 13 00 30 31       	or     eax,0x31300013
    217b:	00 00                	add    BYTE PTR [eax],al
    217d:	00 01                	add    BYTE PTR [ecx],al
    217f:	9c                   	pushf  
    2180:	06                   	push   es
    2181:	73 74                	jae    21f7 <sysEnter_Vector-0x12de09>
    2183:	72 00                	jb     2185 <sysEnter_Vector-0x12de7b>
    2185:	01 0a                	add    DWORD PTR [edx],ecx
    2187:	89 00                	mov    DWORD PTR [eax],eax
    2189:	00 00                	add    BYTE PTR [eax],al
    218b:	02 91 00 07 72 65    	add    dl,BYTE PTR [ecx+0x65720700]
    2191:	74 00                	je     2193 <sysEnter_Vector-0x12de6d>
    2193:	01 0b                	add    DWORD PTR [ebx],ecx
    2195:	2c 00                	sub    al,0x0
    2197:	00 00                	add    BYTE PTR [eax],al
    2199:	02 91 74 00 00 a2    	add    dl,BYTE PTR [ecx-0x5dffff8c]
    219f:	00 00                	add    BYTE PTR [eax],al
    21a1:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    21a4:	7d 0c                	jge    21b2 <sysEnter_Vector-0x12de4e>
    21a6:	00 00                	add    BYTE PTR [eax],al
    21a8:	04 01                	add    al,0x1
    21aa:	ef                   	out    dx,eax
    21ab:	00 00                	add    BYTE PTR [eax],al
    21ad:	00 0c c8             	add    BYTE PTR [eax+ecx*8],cl
    21b0:	08 00                	or     BYTE PTR [eax],al
    21b2:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    21b5:	00 00                	add    BYTE PTR [eax],al
    21b7:	40                   	inc    eax
    21b8:	13 00                	adc    eax,DWORD PTR [eax]
    21ba:	30 67 00             	xor    BYTE PTR [edi+0x0],ah
    21bd:	00 00                	add    BYTE PTR [eax],al
    21bf:	a2 0e 00 00 02       	mov    ds:0x200000e,al
    21c4:	04 05                	add    al,0x5
    21c6:	69 6e 74 00 03 9e 03 	imul   ebp,DWORD PTR [esi+0x74],0x39e0300
    21cd:	00 00                	add    BYTE PTR [eax],al
    21cf:	02 d8                	add    bl,al
    21d1:	37                   	aaa    
    21d2:	00 00                	add    BYTE PTR [eax],al
    21d4:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    21d7:	07                   	pop    es
    21d8:	32 00                	xor    al,BYTE PTR [eax]
    21da:	00 00                	add    BYTE PTR [eax],al
    21dc:	04 04                	add    al,0x4
    21de:	05 05 00 00 00       	add    eax,0x5
    21e3:	04 08                	add    al,0x8
    21e5:	05 00 00 00 00       	add    eax,0x0
    21ea:	04 0c                	add    al,0xc
    21ec:	04 96                	add    al,0x96
    21ee:	00 00                	add    BYTE PTR [eax],al
    21f0:	00 05 c0 08 00 00    	add    BYTE PTR ds:0x8c0,al
    21f6:	01 0c 25 00 00 00 40 	add    DWORD PTR [eiz*1+0x40000000],ecx
    21fd:	13 00                	adc    eax,DWORD PTR [eax]
    21ff:	30 67 00             	xor    BYTE PTR [edi+0x0],ah
    2202:	00 00                	add    BYTE PTR [eax],al
    2204:	01 9c 93 00 00 00 06 	add    DWORD PTR [ebx+edx*4+0x6000000],ebx
    220b:	73 31                	jae    223e <sysEnter_Vector-0x12ddc2>
    220d:	00 01                	add    BYTE PTR [ecx],al
    220f:	0c 93                	or     al,0x93
    2211:	00 00                	add    BYTE PTR [eax],al
    2213:	00 02                	add    BYTE PTR [edx],al
    2215:	91                   	xchg   ecx,eax
    2216:	00 06                	add    BYTE PTR [esi],al
    2218:	73 32                	jae    224c <sysEnter_Vector-0x12ddb4>
    221a:	00 01                	add    BYTE PTR [ecx],al
    221c:	0c 93                	or     al,0x93
    221e:	00 00                	add    BYTE PTR [eax],al
    2220:	00 02                	add    BYTE PTR [edx],al
    2222:	91                   	xchg   ecx,eax
    2223:	04 06                	add    al,0x6
    2225:	6e                   	outs   dx,BYTE PTR ds:[esi]
    2226:	00 01                	add    BYTE PTR [ecx],al
    2228:	0c 2c                	or     al,0x2c
    222a:	00 00                	add    BYTE PTR [eax],al
    222c:	00 02                	add    BYTE PTR [edx],al
    222e:	91                   	xchg   ecx,eax
    222f:	08 00                	or     BYTE PTR [eax],al
    2231:	07                   	pop    es
    2232:	04 a0                	add    al,0xa0
    2234:	00 00                	add    BYTE PTR [eax],al
    2236:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    2239:	06                   	push   es
    223a:	58                   	pop    eax
    223b:	00 00                	add    BYTE PTR [eax],al
    223d:	00 08                	add    BYTE PTR [eax],cl
    223f:	99                   	cdq    
    2240:	00 00                	add    BYTE PTR [eax],al
    2242:	00 00                	add    BYTE PTR [eax],al
    2244:	b4 00                	mov    ah,0x0
    2246:	00 00                	add    BYTE PTR [eax],al
    2248:	04 00                	add    al,0x0
    224a:	ef                   	out    dx,eax
    224b:	0c 00                	or     al,0x0
    224d:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    2250:	ef                   	out    dx,eax
    2251:	00 00                	add    BYTE PTR [eax],al
    2253:	00 0c de             	add    BYTE PTR [esi+ebx*8],cl
    2256:	08 00                	or     BYTE PTR [eax],al
    2258:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    225b:	00 00                	add    BYTE PTR [eax],al
    225d:	a8 13                	test   al,0x13
    225f:	00 30                	add    BYTE PTR [eax],dh
    2261:	60                   	pusha  
    2262:	00 00                	add    BYTE PTR [eax],al
    2264:	00 4b 0f             	add    BYTE PTR [ebx+0xf],cl
    2267:	00 00                	add    BYTE PTR [eax],al
    2269:	02 04 05 69 6e 74 00 	add    al,BYTE PTR [eax*1+0x746e69]
    2270:	03 9e 03 00 00 02    	add    ebx,DWORD PTR [esi+0x2000003]
    2276:	d8 37                	fdiv   DWORD PTR [edi]
    2278:	00 00                	add    BYTE PTR [eax],al
    227a:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    227d:	07                   	pop    es
    227e:	32 00                	xor    al,BYTE PTR [eax]
    2280:	00 00                	add    BYTE PTR [eax],al
    2282:	04 04                	add    al,0x4
    2284:	05 05 00 00 00       	add    eax,0x5
    2289:	04 08                	add    al,0x8
    228b:	05 00 00 00 00       	add    eax,0x0
    2290:	04 0c                	add    al,0xc
    2292:	04 96                	add    al,0x96
    2294:	00 00                	add    BYTE PTR [eax],al
    2296:	00 05 f4 08 00 00    	add    BYTE PTR ds:0x8f4,al
    229c:	01 0d 9f 00 00 00    	add    DWORD PTR ds:0x9f,ecx
    22a2:	a8 13                	test   al,0x13
    22a4:	00 30                	add    BYTE PTR [eax],dh
    22a6:	60                   	pusha  
    22a7:	00 00                	add    BYTE PTR [eax],al
    22a9:	00 01                	add    BYTE PTR [ecx],al
    22ab:	9c                   	pushf  
    22ac:	9f                   	lahf   
    22ad:	00 00                	add    BYTE PTR [eax],al
    22af:	00 06                	add    BYTE PTR [esi],al
    22b1:	73 31                	jae    22e4 <sysEnter_Vector-0x12dd1c>
    22b3:	00 01                	add    BYTE PTR [ecx],al
    22b5:	0d 9f 00 00 00       	or     eax,0x9f
    22ba:	02 91 00 06 73 32    	add    dl,BYTE PTR [ecx+0x32730600]
    22c0:	00 01                	add    BYTE PTR [ecx],al
    22c2:	0d ac 00 00 00       	or     eax,0xac
    22c7:	02 91 04 06 6e 00    	add    dl,BYTE PTR [ecx+0x6e0604]
    22cd:	01 0d 2c 00 00 00    	add    DWORD PTR ds:0x2c,ecx
    22d3:	02 91 08 07 73 00    	add    dl,BYTE PTR [ecx+0x730708]
    22d9:	01 0f                	add    DWORD PTR [edi],ecx
    22db:	9f                   	lahf   
    22dc:	00 00                	add    BYTE PTR [eax],al
    22de:	00 02                	add    BYTE PTR [edx],al
    22e0:	91                   	xchg   ecx,eax
    22e1:	74 00                	je     22e3 <sysEnter_Vector-0x12dd1d>
    22e3:	08 04 a5 00 00 00 04 	or     BYTE PTR [eiz*4+0x4000000],al
    22ea:	01 06                	add    DWORD PTR [esi],eax
    22ec:	58                   	pop    eax
    22ed:	00 00                	add    BYTE PTR [eax],al
    22ef:	00 08                	add    BYTE PTR [eax],cl
    22f1:	04 b2                	add    al,0xb2
    22f3:	00 00                	add    BYTE PTR [eax],al
    22f5:	00 09                	add    BYTE PTR [ecx],cl
    22f7:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
    22f8:	00 00                	add    BYTE PTR [eax],al
    22fa:	00 00                	add    BYTE PTR [eax],al
    22fc:	8c 01                	mov    WORD PTR [ecx],es
    22fe:	00 00                	add    BYTE PTR [eax],al
    2300:	04 00                	add    al,0x0
    2302:	70 0d                	jo     2311 <sysEnter_Vector-0x12dcef>
    2304:	00 00                	add    BYTE PTR [eax],al
    2306:	04 01                	add    al,0x1
    2308:	ef                   	out    dx,eax
    2309:	00 00                	add    BYTE PTR [eax],al
    230b:	00 0c fc             	add    BYTE PTR [esp+edi*8],cl
    230e:	08 00                	or     BYTE PTR [eax],al
    2310:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2313:	00 00                	add    BYTE PTR [eax],al
    2315:	08 14 00             	or     BYTE PTR [eax+eax*1],dl
    2318:	30 7d 01             	xor    BYTE PTR [ebp+0x1],bh
    231b:	00 00                	add    BYTE PTR [eax],al
    231d:	ec                   	in     al,dx
    231e:	0f 00 00             	sldt   WORD PTR [eax]
    2321:	02 01                	add    al,BYTE PTR [ecx]
    2323:	06                   	push   es
    2324:	58                   	pop    eax
    2325:	00 00                	add    BYTE PTR [eax],al
    2327:	00 02                	add    BYTE PTR [edx],al
    2329:	01 06                	add    DWORD PTR [esi],eax
    232b:	51                   	push   ecx
    232c:	00 00                	add    BYTE PTR [eax],al
    232e:	00 02                	add    BYTE PTR [edx],al
    2330:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    2336:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    233d:	02 08                	add    cl,BYTE PTR [eax]
    233f:	05 00 00 00 00       	add    eax,0x0
    2344:	02 01                	add    al,BYTE PTR [ecx]
    2346:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    2349:	00 00                	add    BYTE PTR [eax],al
    234b:	02 02                	add    al,BYTE PTR [edx]
    234d:	07                   	pop    es
    234e:	0e                   	push   cs
    234f:	00 00                	add    BYTE PTR [eax],al
    2351:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    2354:	00 00                	add    BYTE PTR [eax],al
    2356:	00 02                	add    BYTE PTR [edx],al
    2358:	34 61                	xor    al,0x61
    235a:	00 00                	add    BYTE PTR [eax],al
    235c:	00 02                	add    BYTE PTR [edx],al
    235e:	04 07                	add    al,0x7
    2360:	32 00                	xor    al,BYTE PTR [eax]
    2362:	00 00                	add    BYTE PTR [eax],al
    2364:	02 08                	add    cl,BYTE PTR [eax]
    2366:	07                   	pop    es
    2367:	28 00                	sub    BYTE PTR [eax],al
    2369:	00 00                	add    BYTE PTR [eax],al
    236b:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    2372:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    2375:	96                   	xchg   esi,eax
    2376:	00 00                	add    BYTE PTR [eax],al
    2378:	00 02                	add    BYTE PTR [edx],al
    237a:	01 02                	add    DWORD PTR [edx],eax
    237c:	90                   	nop
    237d:	00 00                	add    BYTE PTR [eax],al
    237f:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    2386:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    2389:	00 00                	add    BYTE PTR [eax],al
    238b:	05 04 95 00 00       	add    eax,0x9504
    2390:	00 06                	add    BYTE PTR [esi],al
    2392:	25 00 00 00 02       	and    eax,0x2000000
    2397:	04 07                	add    al,0x7
    2399:	2d 00 00 00 02       	sub    eax,0x2000000
    239e:	04 07                	add    al,0x7
    23a0:	dc 00                	fadd   QWORD PTR [eax]
    23a2:	00 00                	add    BYTE PTR [eax],al
    23a4:	05 04 25 00 00       	add    eax,0x2504
    23a9:	00 07                	add    BYTE PTR [edi],al
    23ab:	1f                   	pop    ds
    23ac:	09 00                	or     DWORD PTR [eax],eax
    23ae:	00 01                	add    BYTE PTR [ecx],al
    23b0:	3b 9a 00 00 00 08    	cmp    ebx,DWORD PTR [edx+0x8000000]
    23b6:	14 00                	adc    al,0x0
    23b8:	30 7d 01             	xor    BYTE PTR [ebp+0x1],bh
    23bb:	00 00                	add    BYTE PTR [eax],al
    23bd:	01 9c 45 01 00 00 08 	add    DWORD PTR [ebp+eax*2+0x8000001],ebx
    23c4:	2e 09 00             	or     DWORD PTR cs:[eax],eax
    23c7:	00 01                	add    BYTE PTR [ecx],al
    23c9:	3b 8f 00 00 00 02    	cmp    ecx,DWORD PTR [edi+0x2000000]
    23cf:	91                   	xchg   ecx,eax
    23d0:	00 08                	add    BYTE PTR [eax],cl
    23d2:	27                   	daa    
    23d3:	09 00                	or     DWORD PTR [eax],eax
    23d5:	00 01                	add    BYTE PTR [ecx],al
    23d7:	3b 45 01             	cmp    eax,DWORD PTR [ebp+0x1]
    23da:	00 00                	add    BYTE PTR [eax],al
    23dc:	02 91 04 08 33 09    	add    dl,BYTE PTR [ecx+0x9330804]
    23e2:	00 00                	add    BYTE PTR [eax],al
    23e4:	01 3b                	add    DWORD PTR [ebx],edi
    23e6:	3a 00                	cmp    al,BYTE PTR [eax]
    23e8:	00 00                	add    BYTE PTR [eax],al
    23ea:	02 91 08 09 73 00    	add    dl,BYTE PTR [ecx+0x730908]
    23f0:	01 3d 8f 00 00 00    	add    DWORD PTR ds:0x8f,edi
    23f6:	01 56 09             	add    DWORD PTR [esi+0x9],edx
    23f9:	61                   	popa   
    23fa:	63 63 00             	arpl   WORD PTR [ebx+0x0],sp
    23fd:	01 3e                	add    DWORD PTR [esi],edi
    23ff:	9a 00 00 00 01 57 09 	call   0x957:0x1000000
    2406:	63 00                	arpl   WORD PTR [eax],ax
    2408:	01 3f                	add    DWORD PTR [edi],edi
    240a:	3a 00                	cmp    al,BYTE PTR [eax]
    240c:	00 00                	add    BYTE PTR [eax],al
    240e:	01 53 0a             	add    DWORD PTR [ebx+0xa],edx
    2411:	11 09                	adc    DWORD PTR [ecx],ecx
    2413:	00 00                	add    BYTE PTR [eax],al
    2415:	01 40 9a             	add    DWORD PTR [eax-0x66],eax
    2418:	00 00                	add    BYTE PTR [eax],al
    241a:	00 0b                	add    BYTE PTR [ebx],cl
    241c:	6e                   	outs   dx,BYTE PTR ds:[esi]
    241d:	65 67 00 01          	add    BYTE PTR gs:[bx+di],al
    2421:	41                   	inc    ecx
    2422:	3a 00                	cmp    al,BYTE PTR [eax]
    2424:	00 00                	add    BYTE PTR [eax],al
    2426:	09 61 6e             	or     DWORD PTR [ecx+0x6e],esp
    2429:	79 00                	jns    242b <sysEnter_Vector-0x12dbd5>
    242b:	01 41 3a             	add    DWORD PTR [ecx+0x3a],eax
    242e:	00 00                	add    BYTE PTR [eax],al
    2430:	00 01                	add    BYTE PTR [ecx],al
    2432:	51                   	push   ecx
    2433:	0c 18                	or     al,0x18
    2435:	09 00                	or     DWORD PTR [eax],eax
    2437:	00 01                	add    BYTE PTR [ecx],al
    2439:	41                   	inc    ecx
    243a:	3a 00                	cmp    al,BYTE PTR [eax]
    243c:	00 00                	add    BYTE PTR [eax],al
    243e:	01 52 00             	add    DWORD PTR [edx+0x0],edx
    2441:	05 04 a8 00 00       	add    eax,0xa804
    2446:	00 0d 3f 00 00 00    	add    BYTE PTR ds:0x3f,cl
    244c:	04 34                	add    al,0x34
    244e:	56                   	push   esi
    244f:	00 00                	add    BYTE PTR [eax],al
    2451:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    2457:	30 0d aa 00 00 00    	xor    BYTE PTR ds:0xaa,cl
    245d:	04 35                	add    al,0x35
    245f:	56                   	push   esi
    2460:	00 00                	add    BYTE PTR [eax],al
    2462:	00 05 03 70 3a 00    	add    BYTE PTR ds:0x3a7003,al
    2468:	30 0d 56 01 00 00    	xor    BYTE PTR ds:0x156,cl
    246e:	04 36                	add    al,0x36
    2470:	56                   	push   esi
    2471:	00 00                	add    BYTE PTR [eax],al
    2473:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    2479:	30 0d 48 00 00 00    	xor    BYTE PTR ds:0x48,cl
    247f:	05 38 84 00 00       	add    eax,0x8438
    2484:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
    248a:	30 00                	xor    BYTE PTR [eax],al
    248c:	6c                   	ins    BYTE PTR es:[edi],dx
    248d:	00 00                	add    BYTE PTR [eax],al
    248f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    2492:	2b 0e                	sub    ecx,DWORD PTR [esi]
    2494:	00 00                	add    BYTE PTR [eax],al
    2496:	04 01                	add    al,0x1
    2498:	ef                   	out    dx,eax
    2499:	00 00                	add    BYTE PTR [eax],al
    249b:	00 0c 38             	add    BYTE PTR [eax+edi*1],cl
    249e:	09 00                	or     DWORD PTR [eax],eax
    24a0:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    24a3:	00 00                	add    BYTE PTR [eax],al
    24a5:	88 15 00 30 1d 00    	mov    BYTE PTR ds:0x1d3000,dl
    24ab:	00 00                	add    BYTE PTR [eax],al
    24ad:	43                   	inc    ebx
    24ae:	11 00                	adc    DWORD PTR [eax],eax
    24b0:	00 02                	add    BYTE PTR [edx],al
    24b2:	4f                   	dec    edi
    24b3:	09 00                	or     DWORD PTR [eax],eax
    24b5:	00 01                	add    BYTE PTR [ecx],al
    24b7:	01 5b 00             	add    DWORD PTR [ebx+0x0],ebx
    24ba:	00 00                	add    BYTE PTR [eax],al
    24bc:	88 15 00 30 1d 00    	mov    BYTE PTR ds:0x1d3000,dl
    24c2:	00 00                	add    BYTE PTR [eax],al
    24c4:	01 9c 5b 00 00 00 03 	add    DWORD PTR [ebx+ebx*2+0x3000000],ebx
    24cb:	76 61                	jbe    252e <sysEnter_Vector-0x12dad2>
    24cd:	6c                   	ins    BYTE PTR es:[edi],dx
    24ce:	00 01                	add    BYTE PTR [ecx],al
    24d0:	01 5b 00             	add    DWORD PTR [ebx+0x0],ebx
    24d3:	00 00                	add    BYTE PTR [eax],al
    24d5:	02 91 00 03 63 6e    	add    dl,BYTE PTR [ecx+0x6e630300]
    24db:	74 00                	je     24dd <sysEnter_Vector-0x12db23>
    24dd:	01 01                	add    DWORD PTR [ecx],eax
    24df:	68 00 00 00 02       	push   0x2000000
    24e4:	91                   	xchg   ecx,eax
    24e5:	04 00                	add    al,0x0
    24e7:	04 04                	add    al,0x4
    24e9:	61                   	popa   
    24ea:	00 00                	add    BYTE PTR [eax],al
    24ec:	00 05 01 06 58 00    	add    BYTE PTR ds:0x580601,al
    24f2:	00 00                	add    BYTE PTR [eax],al
    24f4:	06                   	push   es
    24f5:	04 05                	add    al,0x5
    24f7:	69 6e 74 00 00 8a 01 	imul   ebp,DWORD PTR [esi+0x74],0x18a0000
    24fe:	00 00                	add    BYTE PTR [eax],al
    2500:	04 00                	add    al,0x0
    2502:	89 0e                	mov    DWORD PTR [esi],ecx
    2504:	00 00                	add    BYTE PTR [eax],al
    2506:	04 01                	add    al,0x1
    2508:	ef                   	out    dx,eax
    2509:	00 00                	add    BYTE PTR [eax],al
    250b:	00 0c 57             	add    BYTE PTR [edi+edx*2],cl
    250e:	09 00                	or     DWORD PTR [eax],eax
    2510:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2513:	00 00                	add    BYTE PTR [eax],al
    2515:	a8 15                	test   al,0x15
    2517:	00 30                	add    BYTE PTR [eax],dh
    2519:	9c                   	pushf  
    251a:	01 00                	add    DWORD PTR [eax],eax
    251c:	00 8a 11 00 00 02    	add    BYTE PTR [edx+0x2000011],cl
    2522:	01 06                	add    DWORD PTR [esi],eax
    2524:	58                   	pop    eax
    2525:	00 00                	add    BYTE PTR [eax],al
    2527:	00 02                	add    BYTE PTR [edx],al
    2529:	01 06                	add    DWORD PTR [esi],eax
    252b:	51                   	push   ecx
    252c:	00 00                	add    BYTE PTR [eax],al
    252e:	00 02                	add    BYTE PTR [edx],al
    2530:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    2536:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    253d:	02 08                	add    cl,BYTE PTR [eax]
    253f:	05 00 00 00 00       	add    eax,0x0
    2544:	02 01                	add    al,BYTE PTR [ecx]
    2546:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    2549:	00 00                	add    BYTE PTR [eax],al
    254b:	02 02                	add    al,BYTE PTR [edx]
    254d:	07                   	pop    es
    254e:	0e                   	push   cs
    254f:	00 00                	add    BYTE PTR [eax],al
    2551:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    2554:	00 00                	add    BYTE PTR [eax],al
    2556:	00 02                	add    BYTE PTR [edx],al
    2558:	34 61                	xor    al,0x61
    255a:	00 00                	add    BYTE PTR [eax],al
    255c:	00 02                	add    BYTE PTR [edx],al
    255e:	04 07                	add    al,0x7
    2560:	32 00                	xor    al,BYTE PTR [eax]
    2562:	00 00                	add    BYTE PTR [eax],al
    2564:	02 08                	add    cl,BYTE PTR [eax]
    2566:	07                   	pop    es
    2567:	28 00                	sub    BYTE PTR [eax],al
    2569:	00 00                	add    BYTE PTR [eax],al
    256b:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    2572:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    2575:	96                   	xchg   esi,eax
    2576:	00 00                	add    BYTE PTR [eax],al
    2578:	00 02                	add    BYTE PTR [edx],al
    257a:	01 02                	add    DWORD PTR [edx],eax
    257c:	90                   	nop
    257d:	00 00                	add    BYTE PTR [eax],al
    257f:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    2586:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    2589:	00 00                	add    BYTE PTR [eax],al
    258b:	05 04 95 00 00       	add    eax,0x9504
    2590:	00 06                	add    BYTE PTR [esi],al
    2592:	25 00 00 00 02       	and    eax,0x2000000
    2597:	04 07                	add    al,0x7
    2599:	2d 00 00 00 02       	sub    eax,0x2000000
    259e:	04 07                	add    al,0x7
    25a0:	dc 00                	fadd   QWORD PTR [eax]
    25a2:	00 00                	add    BYTE PTR [eax],al
    25a4:	05 04 25 00 00       	add    eax,0x2504
    25a9:	00 07                	add    BYTE PTR [edi],al
    25ab:	6c                   	ins    BYTE PTR es:[edi],dx
    25ac:	09 00                	or     DWORD PTR [eax],eax
    25ae:	00 01                	add    BYTE PTR [ecx],al
    25b0:	57                   	push   edi
    25b1:	6f                   	outs   dx,DWORD PTR ds:[esi]
    25b2:	00 00                	add    BYTE PTR [eax],al
    25b4:	00 a8 15 00 30 9c    	add    BYTE PTR [eax-0x63cfffeb],ch
    25ba:	01 00                	add    DWORD PTR [eax],eax
    25bc:	00 01                	add    BYTE PTR [ecx],al
    25be:	9c                   	pushf  
    25bf:	43                   	inc    ebx
    25c0:	01 00                	add    DWORD PTR [eax],eax
    25c2:	00 08                	add    BYTE PTR [eax],cl
    25c4:	2e 09 00             	or     DWORD PTR cs:[eax],eax
    25c7:	00 01                	add    BYTE PTR [ecx],al
    25c9:	57                   	push   edi
    25ca:	8f 00                	pop    DWORD PTR [eax]
    25cc:	00 00                	add    BYTE PTR [eax],al
    25ce:	02 91 00 08 27 09    	add    dl,BYTE PTR [ecx+0x9270800]
    25d4:	00 00                	add    BYTE PTR [eax],al
    25d6:	01 57 43             	add    DWORD PTR [edi+0x43],edx
    25d9:	01 00                	add    DWORD PTR [eax],eax
    25db:	00 02                	add    BYTE PTR [edx],al
    25dd:	91                   	xchg   ecx,eax
    25de:	04 08                	add    al,0x8
    25e0:	33 09                	xor    ecx,DWORD PTR [ecx]
    25e2:	00 00                	add    BYTE PTR [eax],al
    25e4:	01 57 3a             	add    DWORD PTR [edi+0x3a],edx
    25e7:	00 00                	add    BYTE PTR [eax],al
    25e9:	00 02                	add    BYTE PTR [edx],al
    25eb:	91                   	xchg   ecx,eax
    25ec:	08 09                	or     BYTE PTR [ecx],cl
    25ee:	73 00                	jae    25f0 <sysEnter_Vector-0x12da10>
    25f0:	01 59 8f             	add    DWORD PTR [ecx-0x71],ebx
    25f3:	00 00                	add    BYTE PTR [eax],al
    25f5:	00 01                	add    BYTE PTR [ecx],al
    25f7:	56                   	push   esi
    25f8:	09 61 63             	or     DWORD PTR [ecx+0x63],esp
    25fb:	63 00                	arpl   WORD PTR [eax],ax
    25fd:	01 5a 9a             	add    DWORD PTR [edx-0x66],ebx
    2600:	00 00                	add    BYTE PTR [eax],al
    2602:	00 01                	add    BYTE PTR [ecx],al
    2604:	57                   	push   edi
    2605:	09 63 00             	or     DWORD PTR [ebx+0x0],esp
    2608:	01 5b 3a             	add    DWORD PTR [ebx+0x3a],ebx
    260b:	00 00                	add    BYTE PTR [eax],al
    260d:	00 01                	add    BYTE PTR [ecx],al
    260f:	53                   	push   ebx
    2610:	0a 11                	or     dl,BYTE PTR [ecx]
    2612:	09 00                	or     DWORD PTR [eax],eax
    2614:	00 01                	add    BYTE PTR [ecx],al
    2616:	5c                   	pop    esp
    2617:	9a 00 00 00 0b 6e 65 	call   0x656e:0xb000000
    261e:	67 00 01             	add    BYTE PTR [bx+di],al
    2621:	5d                   	pop    ebp
    2622:	3a 00                	cmp    al,BYTE PTR [eax]
    2624:	00 00                	add    BYTE PTR [eax],al
    2626:	09 61 6e             	or     DWORD PTR [ecx+0x6e],esp
    2629:	79 00                	jns    262b <sysEnter_Vector-0x12d9d5>
    262b:	01 5d 3a             	add    DWORD PTR [ebp+0x3a],ebx
    262e:	00 00                	add    BYTE PTR [eax],al
    2630:	00 01                	add    BYTE PTR [ecx],al
    2632:	51                   	push   ecx
    2633:	0a 18                	or     bl,BYTE PTR [eax]
    2635:	09 00                	or     DWORD PTR [eax],eax
    2637:	00 01                	add    BYTE PTR [ecx],al
    2639:	5d                   	pop    ebp
    263a:	3a 00                	cmp    al,BYTE PTR [eax]
    263c:	00 00                	add    BYTE PTR [eax],al
    263e:	00 05 04 a8 00 00    	add    BYTE PTR ds:0xa804,al
    2644:	00 0c 3f             	add    BYTE PTR [edi+edi*1],cl
    2647:	00 00                	add    BYTE PTR [eax],al
    2649:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    264c:	56                   	push   esi
    264d:	00 00                	add    BYTE PTR [eax],al
    264f:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    2655:	30 0c aa             	xor    BYTE PTR [edx+ebp*4],cl
    2658:	00 00                	add    BYTE PTR [eax],al
    265a:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    2661:	05 03 70 3a 00       	add    eax,0x3a7003
    2666:	30 0c 56             	xor    BYTE PTR [esi+edx*2],cl
    2669:	01 00                	add    DWORD PTR [eax],eax
    266b:	00 04 36             	add    BYTE PTR [esi+esi*1],al
    266e:	56                   	push   esi
    266f:	00 00                	add    BYTE PTR [eax],al
    2671:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    2677:	30 0c 48             	xor    BYTE PTR [eax+ecx*2],cl
    267a:	00 00                	add    BYTE PTR [eax],al
    267c:	00 05 38 84 00 00    	add    BYTE PTR ds:0x8438,al
    2682:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
    2688:	30 00                	xor    BYTE PTR [eax],al
    268a:	3f                   	aas    
    268b:	01 00                	add    DWORD PTR [eax],eax
    268d:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    2690:	35 0f 00 00 04       	xor    eax,0x400000f
    2695:	01 ef                	add    edi,ebp
    2697:	00 00                	add    BYTE PTR [eax],al
    2699:	00 0c 79             	add    BYTE PTR [ecx+edi*2],cl
    269c:	09 00                	or     DWORD PTR [eax],eax
    269e:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    26a1:	00 00                	add    BYTE PTR [eax],al
    26a3:	44                   	inc    esp
    26a4:	17                   	pop    ss
    26a5:	00 30                	add    BYTE PTR [eax],dh
    26a7:	96                   	xchg   esi,eax
    26a8:	00 00                	add    BYTE PTR [eax],al
    26aa:	00 0d 13 00 00 02    	add    BYTE PTR ds:0x2000013,cl
    26b0:	01 06                	add    DWORD PTR [esi],eax
    26b2:	58                   	pop    eax
    26b3:	00 00                	add    BYTE PTR [eax],al
    26b5:	00 02                	add    BYTE PTR [edx],al
    26b7:	01 06                	add    DWORD PTR [esi],eax
    26b9:	51                   	push   ecx
    26ba:	00 00                	add    BYTE PTR [eax],al
    26bc:	00 02                	add    BYTE PTR [edx],al
    26be:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    26c4:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    26cb:	02 08                	add    cl,BYTE PTR [eax]
    26cd:	05 00 00 00 00       	add    eax,0x0
    26d2:	02 01                	add    al,BYTE PTR [ecx]
    26d4:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    26d7:	00 00                	add    BYTE PTR [eax],al
    26d9:	02 02                	add    al,BYTE PTR [edx]
    26db:	07                   	pop    es
    26dc:	0e                   	push   cs
    26dd:	00 00                	add    BYTE PTR [eax],al
    26df:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    26e2:	00 00                	add    BYTE PTR [eax],al
    26e4:	00 02                	add    BYTE PTR [edx],al
    26e6:	34 61                	xor    al,0x61
    26e8:	00 00                	add    BYTE PTR [eax],al
    26ea:	00 02                	add    BYTE PTR [edx],al
    26ec:	04 07                	add    al,0x7
    26ee:	32 00                	xor    al,BYTE PTR [eax]
    26f0:	00 00                	add    BYTE PTR [eax],al
    26f2:	02 08                	add    cl,BYTE PTR [eax]
    26f4:	07                   	pop    es
    26f5:	28 00                	sub    BYTE PTR [eax],al
    26f7:	00 00                	add    BYTE PTR [eax],al
    26f9:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    2700:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    2703:	96                   	xchg   esi,eax
    2704:	00 00                	add    BYTE PTR [eax],al
    2706:	00 02                	add    BYTE PTR [edx],al
    2708:	01 02                	add    DWORD PTR [edx],eax
    270a:	90                   	nop
    270b:	00 00                	add    BYTE PTR [eax],al
    270d:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    2714:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    2717:	00 00                	add    BYTE PTR [eax],al
    2719:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
    271c:	2d 00 00 00 02       	sub    eax,0x2000000
    2721:	04 07                	add    al,0x7
    2723:	dc 00                	fadd   QWORD PTR [eax]
    2725:	00 00                	add    BYTE PTR [eax],al
    2727:	05 04 25 00 00       	add    eax,0x2504
    272c:	00 06                	add    BYTE PTR [esi],al
    272e:	8f 09                	(bad)  
    2730:	00 00                	add    BYTE PTR [eax],al
    2732:	01 03                	add    DWORD PTR [ebx],eax
    2734:	44                   	inc    esp
    2735:	17                   	pop    ss
    2736:	00 30                	add    BYTE PTR [eax],dh
    2738:	96                   	xchg   esi,eax
    2739:	00 00                	add    BYTE PTR [eax],al
    273b:	00 01                	add    BYTE PTR [ecx],al
    273d:	9c                   	pushf  
    273e:	fe 00                	inc    BYTE PTR [eax]
    2740:	00 00                	add    BYTE PTR [eax],al
    2742:	07                   	pop    es
    2743:	73 09                	jae    274e <sysEnter_Vector-0x12d8b2>
    2745:	00 00                	add    BYTE PTR [eax],al
    2747:	01 03                	add    DWORD PTR [ebx],eax
    2749:	9d                   	popf   
    274a:	00 00                	add    BYTE PTR [eax],al
    274c:	00 02                	add    BYTE PTR [edx],al
    274e:	91                   	xchg   ecx,eax
    274f:	00 08                	add    BYTE PTR [eax],cl
    2751:	64                   	fs
    2752:	73 74                	jae    27c8 <sysEnter_Vector-0x12d838>
    2754:	00 01                	add    BYTE PTR [ecx],al
    2756:	05 9d 00 00 00       	add    eax,0x9d
    275b:	02 91 6c 08 73 72    	add    dl,BYTE PTR [ecx+0x7273086c]
    2761:	63 00                	arpl   WORD PTR [eax],ax
    2763:	01 05 9d 00 00 00    	add    DWORD PTR ds:0x9d,eax
    2769:	02 91 68 08 65 6e    	add    dl,BYTE PTR [ecx+0x6e650868]
    276f:	64 00 01             	add    BYTE PTR fs:[ecx],al
    2772:	06                   	push   es
    2773:	9d                   	popf   
    2774:	00 00                	add    BYTE PTR [eax],al
    2776:	00 02                	add    BYTE PTR [edx],al
    2778:	91                   	xchg   ecx,eax
    2779:	64                   	fs
    277a:	09 f2                	or     edx,esi
    277c:	01 00                	add    DWORD PTR [eax],eax
    277e:	00 01                	add    BYTE PTR [ecx],al
    2780:	11 3a                	adc    DWORD PTR [edx],edi
    2782:	00 00                	add    BYTE PTR [eax],al
    2784:	00 0a                	add    BYTE PTR [edx],cl
    2786:	00 00                	add    BYTE PTR [eax],al
    2788:	0b 3f                	or     edi,DWORD PTR [edi]
    278a:	00 00                	add    BYTE PTR [eax],al
    278c:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    278f:	56                   	push   esi
    2790:	00 00                	add    BYTE PTR [eax],al
    2792:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    2798:	30 0b                	xor    BYTE PTR [ebx],cl
    279a:	aa                   	stos   BYTE PTR es:[edi],al
    279b:	00 00                	add    BYTE PTR [eax],al
    279d:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    27a4:	05 03 70 3a 00       	add    eax,0x3a7003
    27a9:	30 0b                	xor    BYTE PTR [ebx],cl
    27ab:	56                   	push   esi
    27ac:	01 00                	add    DWORD PTR [eax],eax
    27ae:	00 04 36             	add    BYTE PTR [esi+esi*1],al
    27b1:	56                   	push   esi
    27b2:	00 00                	add    BYTE PTR [eax],al
    27b4:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    27ba:	30 0b                	xor    BYTE PTR [ebx],cl
    27bc:	48                   	dec    eax
    27bd:	00 00                	add    BYTE PTR [eax],al
    27bf:	00 05 38 84 00 00    	add    BYTE PTR ds:0x8438,al
    27c5:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
    27cb:	30 00                	xor    BYTE PTR [eax],al
    27cd:	51                   	push   ecx
    27ce:	01 00                	add    DWORD PTR [eax],eax
    27d0:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    27d3:	d4 0f                	aam    0xf
    27d5:	00 00                	add    BYTE PTR [eax],al
    27d7:	04 01                	add    al,0x1
    27d9:	ef                   	out    dx,eax
    27da:	00 00                	add    BYTE PTR [eax],al
    27dc:	00 0c 97             	add    BYTE PTR [edi+edx*4],cl
    27df:	09 00                	or     DWORD PTR [eax],eax
    27e1:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    27e4:	00 00                	add    BYTE PTR [eax],al
    27e6:	dc 17                	fcom   QWORD PTR [edi]
    27e8:	00 30                	add    BYTE PTR [eax],dh
    27ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
    27eb:	00 00                	add    BYTE PTR [eax],al
    27ed:	00 e7                	add    bh,ah
    27ef:	13 00                	adc    eax,DWORD PTR [eax]
    27f1:	00 02                	add    BYTE PTR [edx],al
    27f3:	01 06                	add    DWORD PTR [esi],eax
    27f5:	58                   	pop    eax
    27f6:	00 00                	add    BYTE PTR [eax],al
    27f8:	00 02                	add    BYTE PTR [edx],al
    27fa:	01 06                	add    DWORD PTR [esi],eax
    27fc:	51                   	push   ecx
    27fd:	00 00                	add    BYTE PTR [eax],al
    27ff:	00 02                	add    BYTE PTR [edx],al
    2801:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    2807:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    280e:	02 08                	add    cl,BYTE PTR [eax]
    2810:	05 00 00 00 00       	add    eax,0x0
    2815:	02 01                	add    al,BYTE PTR [ecx]
    2817:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    281a:	00 00                	add    BYTE PTR [eax],al
    281c:	02 02                	add    al,BYTE PTR [edx]
    281e:	07                   	pop    es
    281f:	0e                   	push   cs
    2820:	00 00                	add    BYTE PTR [eax],al
    2822:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    2825:	00 00                	add    BYTE PTR [eax],al
    2827:	00 02                	add    BYTE PTR [edx],al
    2829:	34 61                	xor    al,0x61
    282b:	00 00                	add    BYTE PTR [eax],al
    282d:	00 02                	add    BYTE PTR [edx],al
    282f:	04 07                	add    al,0x7
    2831:	32 00                	xor    al,BYTE PTR [eax]
    2833:	00 00                	add    BYTE PTR [eax],al
    2835:	02 08                	add    cl,BYTE PTR [eax]
    2837:	07                   	pop    es
    2838:	28 00                	sub    BYTE PTR [eax],al
    283a:	00 00                	add    BYTE PTR [eax],al
    283c:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    2843:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    2846:	96                   	xchg   esi,eax
    2847:	00 00                	add    BYTE PTR [eax],al
    2849:	00 02                	add    BYTE PTR [edx],al
    284b:	01 02                	add    DWORD PTR [edx],eax
    284d:	90                   	nop
    284e:	00 00                	add    BYTE PTR [eax],al
    2850:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    2857:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    285a:	00 00                	add    BYTE PTR [eax],al
    285c:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
    285f:	2d 00 00 00 02       	sub    eax,0x2000000
    2864:	04 07                	add    al,0x7
    2866:	dc 00                	fadd   QWORD PTR [eax]
    2868:	00 00                	add    BYTE PTR [eax],al
    286a:	05 04 25 00 00       	add    eax,0x2504
    286f:	00 06                	add    BYTE PTR [esi],al
    2871:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
    2872:	09 00                	or     DWORD PTR [eax],eax
    2874:	00 01                	add    BYTE PTR [ecx],al
    2876:	33 9d 00 00 00 dc    	xor    ebx,DWORD PTR [ebp-0x24000000]
    287c:	17                   	pop    ss
    287d:	00 30                	add    BYTE PTR [eax],dh
    287f:	6e                   	outs   dx,BYTE PTR ds:[esi]
    2880:	00 00                	add    BYTE PTR [eax],al
    2882:	00 01                	add    BYTE PTR [ecx],al
    2884:	9c                   	pushf  
    2885:	ef                   	out    dx,eax
    2886:	00 00                	add    BYTE PTR [eax],al
    2888:	00 07                	add    BYTE PTR [edi],al
    288a:	b4 09                	mov    ah,0x9
    288c:	00 00                	add    BYTE PTR [eax],al
    288e:	01 33                	add    DWORD PTR [ebx],esi
    2890:	9d                   	popf   
    2891:	00 00                	add    BYTE PTR [eax],al
    2893:	00 02                	add    BYTE PTR [edx],al
    2895:	91                   	xchg   ecx,eax
    2896:	00 07                	add    BYTE PTR [edi],al
    2898:	b1 09                	mov    cl,0x9
    289a:	00 00                	add    BYTE PTR [eax],al
    289c:	01 33                	add    DWORD PTR [ebx],esi
    289e:	9d                   	popf   
    289f:	00 00                	add    BYTE PTR [eax],al
    28a1:	00 02                	add    BYTE PTR [edx],al
    28a3:	91                   	xchg   ecx,eax
    28a4:	04 08                	add    al,0x8
    28a6:	61                   	popa   
    28a7:	00 01                	add    BYTE PTR [ecx],al
    28a9:	35 9d 00 00 00       	xor    eax,0x9d
    28ae:	01 56 08             	add    DWORD PTR [esi+0x8],edx
    28b1:	62 00                	bound  eax,QWORD PTR [eax]
    28b3:	01 35 9d 00 00 00    	add    DWORD PTR ds:0x9d,esi
    28b9:	01 53 00             	add    DWORD PTR [ebx+0x0],edx
    28bc:	09 25 00 00 00 ff    	or     DWORD PTR ds:0xff000000,esp
    28c2:	00 00                	add    BYTE PTR [eax],al
    28c4:	00 0a                	add    BYTE PTR [edx],cl
    28c6:	96                   	xchg   esi,eax
    28c7:	00 00                	add    BYTE PTR [eax],al
    28c9:	00 65 00             	add    BYTE PTR [ebp+0x0],ah
    28cc:	0b ab 09 00 00 01    	or     ebp,DWORD PTR [ebx+0x1000009]
    28d2:	19 ef                	sbb    edi,ebp
    28d4:	00 00                	add    BYTE PTR [eax],al
    28d6:	00 05 03 00 39 00    	add    BYTE PTR ds:0x390003,al
    28dc:	30 0c 3f             	xor    BYTE PTR [edi+edi*1],cl
    28df:	00 00                	add    BYTE PTR [eax],al
    28e1:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    28e4:	56                   	push   esi
    28e5:	00 00                	add    BYTE PTR [eax],al
    28e7:	00 05 03 6c 3a 00    	add    BYTE PTR ds:0x3a6c03,al
    28ed:	30 0c aa             	xor    BYTE PTR [edx+ebp*4],cl
    28f0:	00 00                	add    BYTE PTR [eax],al
    28f2:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    28f9:	05 03 70 3a 00       	add    eax,0x3a7003
    28fe:	30 0c 56             	xor    BYTE PTR [esi+edx*2],cl
    2901:	01 00                	add    DWORD PTR [eax],eax
    2903:	00 04 36             	add    BYTE PTR [esi+esi*1],al
    2906:	56                   	push   esi
    2907:	00 00                	add    BYTE PTR [eax],al
    2909:	00 05 03 68 3a 00    	add    BYTE PTR ds:0x3a6803,al
    290f:	30 0c 48             	xor    BYTE PTR [eax+ecx*2],cl
    2912:	00 00                	add    BYTE PTR [eax],al
    2914:	00 05 38 84 00 00    	add    BYTE PTR ds:0x8438,al
    291a:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
    2920:	30 00                	xor    BYTE PTR [eax],al
    2922:	50                   	push   eax
    2923:	04 00                	add    al,0x0
    2925:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    2928:	80 10 00             	adc    BYTE PTR [eax],0x0
    292b:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    292e:	ef                   	out    dx,eax
    292f:	00 00                	add    BYTE PTR [eax],al
    2931:	00 0c 38             	add    BYTE PTR [eax+edi*1],cl
    2934:	0a 00                	or     al,BYTE PTR [eax]
    2936:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2939:	00 00                	add    BYTE PTR [eax],al
    293b:	4c                   	dec    esp
    293c:	18 00                	sbb    BYTE PTR [eax],al
    293e:	30 16                	xor    BYTE PTR [esi],dl
    2940:	0c 00                	or     al,0x0
    2942:	00 b9 14 00 00 02    	add    BYTE PTR [ecx+0x2000014],bh
    2948:	5e                   	pop    esi
    2949:	02 00                	add    al,BYTE PTR [eax]
    294b:	00 04 b3             	add    BYTE PTR [ebx+esi*4],al
    294e:	00 00                	add    BYTE PTR [eax],al
    2950:	00 06                	add    BYTE PTR [esi],al
    2952:	15 b3 00 00 00       	adc    eax,0xb3
    2957:	03 44 03 00          	add    eax,DWORD PTR [ebx+eax*1+0x0]
    295b:	00 00                	add    BYTE PTR [eax],al
    295d:	03 ed                	add    ebp,ebp
    295f:	02 00                	add    al,BYTE PTR [eax]
    2961:	00 01                	add    BYTE PTR [ecx],al
    2963:	03 d3                	add    edx,ebx
    2965:	02 00                	add    al,BYTE PTR [eax]
    2967:	00 03                	add    BYTE PTR [ebx],al
    2969:	03 36                	add    esi,DWORD PTR [esi]
    296b:	03 00                	add    eax,DWORD PTR [eax]
    296d:	00 04 03             	add    BYTE PTR [ebx+eax*1],al
    2970:	3d 02 00 00 4f       	cmp    eax,0x4f000002
    2975:	03 e0                	add    esp,eax
    2977:	02 00                	add    al,BYTE PTR [eax]
    2979:	00 59 03             	add    BYTE PTR [ecx+0x3],bl
    297c:	68 02 00 00 61       	push   0x61000002
    2981:	03 63 03             	add    esp,DWORD PTR [ebx+0x3]
    2984:	00 00                	add    BYTE PTR [eax],al
    2986:	97                   	xchg   edi,eax
    2987:	04 05                	add    al,0x5
    2989:	03 00                	add    eax,DWORD PTR [eax]
    298b:	00 63 01             	add    BYTE PTR [ebx+0x1],ah
    298e:	04 1c                	add    al,0x1c
    2990:	03 00                	add    eax,DWORD PTR [eax]
    2992:	00 64 01 04          	add    BYTE PTR [ecx+eax*1+0x4],ah
    2996:	c0 02 00             	rol    BYTE PTR [edx],0x0
    2999:	00 65 01             	add    BYTE PTR [ebp+0x1],ah
    299c:	04 97                	add    al,0x97
    299e:	02 00                	add    al,BYTE PTR [eax]
    29a0:	00 66 01             	add    BYTE PTR [esi+0x1],ah
    29a3:	04 7b                	add    al,0x7b
    29a5:	02 00                	add    al,BYTE PTR [eax]
    29a7:	00 67 01             	add    BYTE PTR [edi+0x1],ah
    29aa:	04 29                	add    al,0x29
    29ac:	03 00                	add    eax,DWORD PTR [eax]
    29ae:	00 68 01             	add    BYTE PTR [eax+0x1],ch
    29b1:	04 54                	add    al,0x54
    29b3:	03 00                	add    eax,DWORD PTR [eax]
    29b5:	00 69 01             	add    BYTE PTR [ecx+0x1],ch
    29b8:	04 0f                	add    al,0xf
    29ba:	02 00                	add    al,BYTE PTR [eax]
    29bc:	00 70 01             	add    BYTE PTR [eax+0x1],dh
    29bf:	04 81                	add    al,0x81
    29c1:	03 00                	add    eax,DWORD PTR [eax]
    29c3:	00 00                	add    BYTE PTR [eax],al
    29c5:	03 04 b1             	add    eax,DWORD PTR [ecx+esi*4]
    29c8:	02 00                	add    al,BYTE PTR [eax]
    29ca:	00 01                	add    BYTE PTR [ecx],al
    29cc:	03 04 20             	add    eax,DWORD PTR [eax+eiz*1]
    29cf:	02 00                	add    al,BYTE PTR [eax]
    29d1:	00 02                	add    BYTE PTR [edx],al
    29d3:	03 00                	add    eax,DWORD PTR [eax]
    29d5:	05 04 07 32 00       	add    eax,0x320704
    29da:	00 00                	add    BYTE PTR [eax],al
    29dc:	05 01 06 58 00       	add    eax,0x580601
    29e1:	00 00                	add    BYTE PTR [eax],al
    29e3:	05 01 06 51 00       	add    eax,0x510601
    29e8:	00 00                	add    BYTE PTR [eax],al
    29ea:	05 02 05 e5 00       	add    eax,0xe50502
    29ef:	00 00                	add    BYTE PTR [eax],al
    29f1:	06                   	push   es
    29f2:	04 05                	add    al,0x5
    29f4:	69 6e 74 00 05 08 05 	imul   ebp,DWORD PTR [esi+0x74],0x5080500
    29fb:	00 00                	add    BYTE PTR [eax],al
    29fd:	00 00                	add    BYTE PTR [eax],al
    29ff:	05 01 08 4f 00       	add    eax,0x4f0801
    2a04:	00 00                	add    BYTE PTR [eax],al
    2a06:	05 02 07 0e 00       	add    eax,0xe0702
    2a0b:	00 00                	add    BYTE PTR [eax],al
    2a0d:	07                   	pop    es
    2a0e:	64 00 00             	add    BYTE PTR fs:[eax],al
    2a11:	00 02                	add    BYTE PTR [edx],al
    2a13:	34 b3                	xor    al,0xb3
    2a15:	00 00                	add    BYTE PTR [eax],al
    2a17:	00 05 08 07 28 00    	add    BYTE PTR ds:0x280708,al
    2a1d:	00 00                	add    BYTE PTR [eax],al
    2a1f:	05 04 05 05 00       	add    eax,0x50504
    2a24:	00 00                	add    BYTE PTR [eax],al
    2a26:	05 0c 04 96 00       	add    eax,0x96040c
    2a2b:	00 00                	add    BYTE PTR [eax],al
    2a2d:	05 01 02 90 00       	add    eax,0x900201
    2a32:	00 00                	add    BYTE PTR [eax],al
    2a34:	07                   	pop    es
    2a35:	5d                   	pop    ebp
    2a36:	00 00                	add    BYTE PTR [eax],al
    2a38:	00 03                	add    BYTE PTR [ebx],al
    2a3a:	2a fd                	sub    bh,ch
    2a3c:	00 00                	add    BYTE PTR [eax],al
    2a3e:	00 08                	add    BYTE PTR [eax],cl
    2a40:	74 6d                	je     2aaf <sysEnter_Vector-0x12d551>
    2a42:	00 2c 03             	add    BYTE PTR [ebx+eax*1],ch
    2a45:	2c ad                	sub    al,0xad
    2a47:	01 00                	add    DWORD PTR [eax],eax
    2a49:	00 09                	add    BYTE PTR [ecx],cl
    2a4b:	00 05 00 00 03 2e    	add    BYTE PTR ds:0x2e030000,al
    2a51:	cf                   	iret   
    2a52:	00 00                	add    BYTE PTR [eax],al
    2a54:	00 00                	add    BYTE PTR [eax],al
    2a56:	09 65 04             	or     DWORD PTR [ebp+0x4],esp
    2a59:	00 00                	add    BYTE PTR [eax],al
    2a5b:	03 2f                	add    ebp,DWORD PTR [edi]
    2a5d:	cf                   	iret   
    2a5e:	00 00                	add    BYTE PTR [eax],al
    2a60:	00 04 09             	add    BYTE PTR [ecx+ecx*1],al
    2a63:	96                   	xchg   esi,eax
    2a64:	03 00                	add    eax,DWORD PTR [eax]
    2a66:	00 03                	add    BYTE PTR [ebx],al
    2a68:	30 cf                	xor    bh,cl
    2a6a:	00 00                	add    BYTE PTR [eax],al
    2a6c:	00 08                	add    BYTE PTR [eax],cl
    2a6e:	09 eb                	or     ebx,ebp
    2a70:	04 00                	add    al,0x0
    2a72:	00 03                	add    BYTE PTR [ebx],al
    2a74:	31 cf                	xor    edi,ecx
    2a76:	00 00                	add    BYTE PTR [eax],al
    2a78:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
    2a7b:	ea 03 00 00 03 32 cf 	jmp    0xcf32:0x3000003
    2a82:	00 00                	add    BYTE PTR [eax],al
    2a84:	00 10                	add    BYTE PTR [eax],dl
    2a86:	09 f1                	or     ecx,esi
    2a88:	03 00                	add    eax,DWORD PTR [eax]
    2a8a:	00 03                	add    BYTE PTR [ebx],al
    2a8c:	33 cf                	xor    ecx,edi
    2a8e:	00 00                	add    BYTE PTR [eax],al
    2a90:	00 14 09             	add    BYTE PTR [ecx+ecx*1],dl
    2a93:	e3 04                	jecxz  2a99 <sysEnter_Vector-0x12d567>
    2a95:	00 00                	add    BYTE PTR [eax],al
    2a97:	03 34 cf             	add    esi,DWORD PTR [edi+ecx*8]
    2a9a:	00 00                	add    BYTE PTR [eax],al
    2a9c:	00 18                	add    BYTE PTR [eax],bl
    2a9e:	09 72 04             	or     DWORD PTR [edx+0x4],esi
    2aa1:	00 00                	add    BYTE PTR [eax],al
    2aa3:	03 35 cf 00 00 00    	add    esi,DWORD PTR ds:0xcf
    2aa9:	1c 09                	sbb    al,0x9
    2aab:	1c 04                	sbb    al,0x4
    2aad:	00 00                	add    BYTE PTR [eax],al
    2aaf:	03 36                	add    esi,DWORD PTR [esi]
    2ab1:	cf                   	iret   
    2ab2:	00 00                	add    BYTE PTR [eax],al
    2ab4:	00 20                	add    BYTE PTR [eax],ah
    2ab6:	09 ad 04 00 00 03    	or     DWORD PTR [ebp+0x3000004],ebp
    2abc:	37                   	aaa    
    2abd:	fd                   	std    
    2abe:	00 00                	add    BYTE PTR [eax],al
    2ac0:	00 24 09             	add    BYTE PTR [ecx+ecx*1],ah
    2ac3:	bb 03 00 00 03       	mov    ebx,0x3000003
    2ac8:	38 ad 01 00 00 28    	cmp    BYTE PTR [ebp+0x28000001],ch
    2ace:	00 0a                	add    BYTE PTR [edx],cl
    2ad0:	04 b3                	add    al,0xb3
    2ad2:	01 00                	add    DWORD PTR [eax],eax
    2ad4:	00 0b                	add    BYTE PTR [ebx],cl
    2ad6:	ba 00 00 00 05       	mov    edx,0x5000000
    2adb:	04 07                	add    al,0x7
    2add:	2d 00 00 00 05       	sub    eax,0x5000000
    2ae2:	04 07                	add    al,0x7
    2ae4:	dc 00                	fadd   QWORD PTR [eax]
    2ae6:	00 00                	add    BYTE PTR [eax],al
    2ae8:	0a 04 ba             	or     al,BYTE PTR [edx+edi*4]
    2aeb:	00 00                	add    BYTE PTR [eax],al
    2aed:	00 0c 0b             	add    BYTE PTR [ebx+ecx*1],cl
    2af0:	0a 00                	or     al,BYTE PTR [eax]
    2af2:	00 01                	add    BYTE PTR [ecx],al
    2af4:	16                   	push   ss
    2af5:	12 01                	adc    al,BYTE PTR [ecx]
    2af7:	00 00                	add    BYTE PTR [eax],al
    2af9:	4c                   	dec    esp
    2afa:	18 00                	sbb    BYTE PTR [eax],al
    2afc:	30 29                	xor    BYTE PTR [ecx],ch
    2afe:	00 00                	add    BYTE PTR [eax],al
    2b00:	00 01                	add    BYTE PTR [ecx],al
    2b02:	9c                   	pushf  
    2b03:	f4                   	hlt    
    2b04:	01 00                	add    DWORD PTR [eax],eax
    2b06:	00 0d 8f 03 00 00    	add    BYTE PTR ds:0x38f,cl
    2b0c:	01 18                	add    DWORD PTR [eax],ebx
    2b0e:	eb 00                	jmp    2b10 <sysEnter_Vector-0x12d4f0>
    2b10:	00 00                	add    BYTE PTR [eax],al
    2b12:	02 91 74 00 0e d4    	add    dl,BYTE PTR [ecx-0x2bf1ff8c]
    2b18:	09 00                	or     DWORD PTR [eax],eax
    2b1a:	00 01                	add    BYTE PTR [ecx],al
    2b1c:	1e                   	push   ds
    2b1d:	62 02                	bound  eax,QWORD PTR [edx]
    2b1f:	00 00                	add    BYTE PTR [eax],al
    2b21:	75 18                	jne    2b3b <sysEnter_Vector-0x12d4c5>
    2b23:	00 30                	add    BYTE PTR [eax],dh
    2b25:	19 03                	sbb    DWORD PTR [ebx],eax
    2b27:	00 00                	add    BYTE PTR [eax],al
    2b29:	01 9c 62 02 00 00 0f 	add    DWORD PTR [edx+eiz*2+0xf000002],ebx
    2b30:	dd 09                	fisttp QWORD PTR [ecx]
    2b32:	00 00                	add    BYTE PTR [eax],al
    2b34:	01 1e                	add    DWORD PTR [esi],ebx
    2b36:	68 02 00 00 02       	push   0x2000002
    2b3b:	91                   	xchg   ecx,eax
    2b3c:	00 0f                	add    BYTE PTR [edi],cl
    2b3e:	32 0a                	xor    cl,BYTE PTR [edx]
    2b40:	00 00                	add    BYTE PTR [eax],al
    2b42:	01 1e                	add    DWORD PTR [esi],ebx
    2b44:	62 02                	bound  eax,QWORD PTR [edx]
    2b46:	00 00                	add    BYTE PTR [eax],al
    2b48:	02 91 04 0d 0b 0a    	add    dl,BYTE PTR [ecx+0xa0b0d04]
    2b4e:	00 00                	add    BYTE PTR [eax],al
    2b50:	01 1f                	add    DWORD PTR [edi],ebx
    2b52:	12 01                	adc    al,BYTE PTR [ecx]
    2b54:	00 00                	add    BYTE PTR [eax],al
    2b56:	02 91 68 0d 10 0a    	add    dl,BYTE PTR [ecx+0xa100d68]
    2b5c:	00 00                	add    BYTE PTR [eax],al
    2b5e:	01 20                	add    DWORD PTR [eax],esp
    2b60:	b8 01 00 00 02       	mov    eax,0x2000001
    2b65:	91                   	xchg   ecx,eax
    2b66:	64                   	fs
    2b67:	0d c5 09 00 00       	or     eax,0x9c5
    2b6c:	01 20                	add    DWORD PTR [eax],esp
    2b6e:	b8 01 00 00 02       	mov    eax,0x2000001
    2b73:	91                   	xchg   ecx,eax
    2b74:	70 0d                	jo     2b83 <sysEnter_Vector-0x12d47d>
    2b76:	f4                   	hlt    
    2b77:	03 00                	add    eax,DWORD PTR [eax]
    2b79:	00 01                	add    BYTE PTR [ecx],al
    2b7b:	21 cf                	and    edi,ecx
    2b7d:	00 00                	add    BYTE PTR [eax],al
    2b7f:	00 02                	add    BYTE PTR [edx],al
    2b81:	91                   	xchg   ecx,eax
    2b82:	6c                   	ins    BYTE PTR es:[edi],dx
    2b83:	00 0a                	add    BYTE PTR [edx],cl
    2b85:	04 1d                	add    al,0x1d
    2b87:	01 00                	add    DWORD PTR [eax],eax
    2b89:	00 0a                	add    BYTE PTR [edx],cl
    2b8b:	04 6e                	add    al,0x6e
    2b8d:	02 00                	add    al,BYTE PTR [eax]
    2b8f:	00 0b                	add    BYTE PTR [ebx],cl
    2b91:	12 01                	adc    al,BYTE PTR [ecx]
    2b93:	00 00                	add    BYTE PTR [eax],al
    2b95:	10 bb 09 00 00 01    	adc    BYTE PTR [ebx+0x1000009],bh
    2b9b:	3a 62 02             	cmp    ah,BYTE PTR [edx+0x2]
    2b9e:	00 00                	add    BYTE PTR [eax],al
    2ba0:	8e 1b                	mov    ds,WORD PTR [ebx]
    2ba2:	00 30                	add    BYTE PTR [eax],dh
    2ba4:	3f                   	aas    
    2ba5:	00 00                	add    BYTE PTR [eax],al
    2ba7:	00 01                	add    BYTE PTR [ecx],al
    2ba9:	9c                   	pushf  
    2baa:	b5 02                	mov    ch,0x2
    2bac:	00 00                	add    BYTE PTR [eax],al
    2bae:	0f dd 09             	paddusw mm1,QWORD PTR [ecx]
    2bb1:	00 00                	add    BYTE PTR [eax],al
    2bb3:	01 3a                	add    DWORD PTR [edx],edi
    2bb5:	68 02 00 00 02       	push   0x2000002
    2bba:	91                   	xchg   ecx,eax
    2bbb:	00 11                	add    BYTE PTR [ecx],dl
    2bbd:	74 00                	je     2bbf <sysEnter_Vector-0x12d441>
    2bbf:	01 3b                	add    DWORD PTR [ebx],edi
    2bc1:	12 01                	adc    al,BYTE PTR [ecx]
    2bc3:	00 00                	add    BYTE PTR [eax],al
    2bc5:	02 91 6c 0d 32 0a    	add    dl,BYTE PTR [ecx+0xa320d6c]
    2bcb:	00 00                	add    BYTE PTR [eax],al
    2bcd:	01 3c 1d 01 00 00 02 	add    DWORD PTR [ebx*1+0x2000001],edi
    2bd4:	91                   	xchg   ecx,eax
    2bd5:	40                   	inc    eax
    2bd6:	00 10                	add    BYTE PTR [eax],dl
    2bd8:	e3 09                	jecxz  2be3 <sysEnter_Vector-0x12d41d>
    2bda:	00 00                	add    BYTE PTR [eax],al
    2bdc:	01 42 62             	add    DWORD PTR [edx+0x62],eax
    2bdf:	02 00                	add    al,BYTE PTR [eax]
    2be1:	00 cd                	add    ch,cl
    2be3:	1b 00                	sbb    eax,DWORD PTR [eax]
    2be5:	30 3e                	xor    BYTE PTR [esi],bh
    2be7:	00 00                	add    BYTE PTR [eax],al
    2be9:	00 01                	add    BYTE PTR [ecx],al
    2beb:	9c                   	pushf  
    2bec:	f7 02 00 00 0f dd    	test   DWORD PTR [edx],0xdd0f0000
    2bf2:	09 00                	or     DWORD PTR [eax],eax
    2bf4:	00 01                	add    BYTE PTR [ecx],al
    2bf6:	42                   	inc    edx
    2bf7:	68 02 00 00 02       	push   0x2000002
    2bfc:	91                   	xchg   ecx,eax
    2bfd:	00 0f                	add    BYTE PTR [edi],cl
    2bff:	32 0a                	xor    cl,BYTE PTR [edx]
    2c01:	00 00                	add    BYTE PTR [eax],al
    2c03:	01 42 62             	add    DWORD PTR [edx+0x62],eax
    2c06:	02 00                	add    al,BYTE PTR [eax]
    2c08:	00 02                	add    BYTE PTR [edx],al
    2c0a:	91                   	xchg   ecx,eax
    2c0b:	04 11                	add    al,0x11
    2c0d:	74 00                	je     2c0f <sysEnter_Vector-0x12d3f1>
    2c0f:	01 43 12             	add    DWORD PTR [ebx+0x12],eax
    2c12:	01 00                	add    DWORD PTR [eax],eax
    2c14:	00 02                	add    BYTE PTR [edx],al
    2c16:	91                   	xchg   ecx,eax
    2c17:	6c                   	ins    BYTE PTR es:[edi],dx
    2c18:	00 0e                	add    BYTE PTR [esi],cl
    2c1a:	09 0a                	or     DWORD PTR [edx],ecx
    2c1c:	00 00                	add    BYTE PTR [eax],al
    2c1e:	01 49 12             	add    DWORD PTR [ecx+0x12],ecx
    2c21:	01 00                	add    DWORD PTR [eax],eax
    2c23:	00 0b                	add    BYTE PTR [ebx],cl
    2c25:	1c 00                	sbb    al,0x0
    2c27:	30 57 08             	xor    BYTE PTR [edi+0x8],dl
    2c2a:	00 00                	add    BYTE PTR [eax],al
    2c2c:	01 9c 8f 03 00 00 0f 	add    DWORD PTR [edi+ecx*4+0xf000003],ebx
    2c33:	32 0a                	xor    cl,BYTE PTR [edx]
    2c35:	00 00                	add    BYTE PTR [eax],al
    2c37:	01 49 62             	add    DWORD PTR [ecx+0x62],ecx
    2c3a:	02 00                	add    al,BYTE PTR [eax]
    2c3c:	00 02                	add    BYTE PTR [edx],al
    2c3e:	91                   	xchg   ecx,eax
    2c3f:	00 11                	add    BYTE PTR [ecx],dl
    2c41:	64                   	fs
    2c42:	61                   	popa   
    2c43:	79 00                	jns    2c45 <sysEnter_Vector-0x12d3bb>
    2c45:	01 4a fd             	add    DWORD PTR [edx-0x3],ecx
    2c48:	00 00                	add    BYTE PTR [eax],al
    2c4a:	00 02                	add    BYTE PTR [edx],al
    2c4c:	91                   	xchg   ecx,eax
    2c4d:	68 0d f4 03 00       	push   0x3f40d
    2c52:	00 01                	add    BYTE PTR [ecx],al
    2c54:	4a                   	dec    edx
    2c55:	fd                   	std    
    2c56:	00 00                	add    BYTE PTR [eax],al
    2c58:	00 02                	add    BYTE PTR [edx],al
    2c5a:	91                   	xchg   ecx,eax
    2c5b:	54                   	push   esp
    2c5c:	0d f1 03 00 00       	or     eax,0x3f1
    2c61:	01 4b cf             	add    DWORD PTR [ebx-0x31],ecx
    2c64:	00 00                	add    BYTE PTR [eax],al
    2c66:	00 02                	add    BYTE PTR [edx],al
    2c68:	91                   	xchg   ecx,eax
    2c69:	4c                   	dec    esp
    2c6a:	0d 75 04 00 00       	or     eax,0x475
    2c6f:	01 4c cf 00          	add    DWORD PTR [edi+ecx*8+0x0],ecx
    2c73:	00 00                	add    BYTE PTR [eax],al
    2c75:	02 91 64 0d 2c 0a    	add    dl,BYTE PTR [ecx+0xa2c0d64]
    2c7b:	00 00                	add    BYTE PTR [eax],al
    2c7d:	01 4c cf 00          	add    DWORD PTR [edi+ecx*8+0x0],ecx
    2c81:	00 00                	add    BYTE PTR [eax],al
    2c83:	02 91 60 0d c5 04    	add    dl,BYTE PTR [ecx+0x4c50d60]
    2c89:	00 00                	add    BYTE PTR [eax],al
    2c8b:	01 4d fd             	add    DWORD PTR [ebp-0x3],ecx
    2c8e:	00 00                	add    BYTE PTR [eax],al
    2c90:	00 02                	add    BYTE PTR [edx],al
    2c92:	91                   	xchg   ecx,eax
    2c93:	50                   	push   eax
    2c94:	0d 23 0a 00 00       	or     eax,0xa23
    2c99:	01 4e cf             	add    DWORD PTR [esi-0x31],ecx
    2c9c:	00 00                	add    BYTE PTR [eax],al
    2c9e:	00 02                	add    BYTE PTR [edx],al
    2ca0:	91                   	xchg   ecx,eax
    2ca1:	5c                   	pop    esp
    2ca2:	11 64 73 74          	adc    DWORD PTR [ebx+esi*2+0x74],esp
    2ca6:	00 01                	add    BYTE PTR [ecx],al
    2ca8:	4f                   	dec    edi
    2ca9:	fd                   	std    
    2caa:	00 00                	add    BYTE PTR [eax],al
    2cac:	00 02                	add    BYTE PTR [edx],al
    2cae:	91                   	xchg   ecx,eax
    2caf:	58                   	pop    eax
    2cb0:	00 12                	add    BYTE PTR [edx],dl
    2cb2:	3f                   	aas    
    2cb3:	00 00                	add    BYTE PTR [eax],al
    2cb5:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    2cb8:	eb 00                	jmp    2cba <sysEnter_Vector-0x12d346>
    2cba:	00 00                	add    BYTE PTR [eax],al
    2cbc:	05 03 6c 3a 00       	add    eax,0x3a6c03
    2cc1:	30 12                	xor    BYTE PTR [edx],dl
    2cc3:	aa                   	stos   BYTE PTR es:[edi],al
    2cc4:	00 00                	add    BYTE PTR [eax],al
    2cc6:	00 04 35 eb 00 00 00 	add    BYTE PTR [esi*1+0xeb],al
    2ccd:	05 03 70 3a 00       	add    eax,0x3a7003
    2cd2:	30 12                	xor    BYTE PTR [edx],dl
    2cd4:	56                   	push   esi
    2cd5:	01 00                	add    DWORD PTR [eax],eax
    2cd7:	00 04 36             	add    BYTE PTR [esi+esi*1],al
    2cda:	eb 00                	jmp    2cdc <sysEnter_Vector-0x12d324>
    2cdc:	00 00                	add    BYTE PTR [eax],al
    2cde:	05 03 68 3a 00       	add    eax,0x3a6803
    2ce3:	30 12                	xor    BYTE PTR [edx],dl
    2ce5:	48                   	dec    eax
    2ce6:	00 00                	add    BYTE PTR [eax],al
    2ce8:	00 05 38 12 01 00    	add    BYTE PTR ds:0x11238,al
    2cee:	00 05 03 74 3a 00    	add    BYTE PTR ds:0x3a7403,al
    2cf4:	30 12                	xor    BYTE PTR [edx],dl
    2cf6:	19 0a                	sbb    DWORD PTR [edx],ecx
    2cf8:	00 00                	add    BYTE PTR [eax],al
    2cfa:	01 0c cf             	add    DWORD PTR [edi+ecx*8],ecx
    2cfd:	00 00                	add    BYTE PTR [eax],al
    2cff:	00 05 03 68 39 00    	add    BYTE PTR ds:0x396803,al
    2d05:	30 12                	xor    BYTE PTR [edx],dl
    2d07:	cb                   	retf   
    2d08:	09 00                	or     DWORD PTR [eax],eax
    2d0a:	00 01                	add    BYTE PTR [ecx],al
    2d0c:	0d fd 00 00 00       	or     eax,0xfd
    2d11:	05 03 98 3a 00       	add    eax,0x3a9803
    2d16:	30 13                	xor    BYTE PTR [ebx],dl
    2d18:	c6 01 00             	mov    BYTE PTR [ecx],0x0
    2d1b:	00 05 04 00 00 14    	add    BYTE PTR ds:0x14000004,al
    2d21:	bf 01 00 00 01       	mov    edi,0x1000001
    2d26:	00 12                	add    BYTE PTR [edx],dl
    2d28:	ef                   	out    dx,eax
    2d29:	09 00                	or     DWORD PTR [eax],eax
    2d2b:	00 01                	add    BYTE PTR [ecx],al
    2d2d:	0e                   	push   cs
    2d2e:	f5                   	cmc    
    2d2f:	03 00                	add    eax,DWORD PTR [eax]
    2d31:	00 05 03 60 3a 00    	add    BYTE PTR ds:0x3a6003,al
    2d37:	30 12                	xor    BYTE PTR [edx],dl
    2d39:	fd                   	std    
    2d3a:	09 00                	or     DWORD PTR [eax],eax
    2d3c:	00 01                	add    BYTE PTR [ecx],al
    2d3e:	0f cf                	bswap  edi
    2d40:	00 00                	add    BYTE PTR [eax],al
    2d42:	00 05 03 9c 3a 00    	add    BYTE PTR ds:0x3a9c03,al
    2d48:	30 13                	xor    BYTE PTR [ebx],dl
    2d4a:	cf                   	iret   
    2d4b:	00 00                	add    BYTE PTR [eax],al
    2d4d:	00 3d 04 00 00 14    	add    BYTE PTR ds:0x14000004,bh
    2d53:	bf 01 00 00 01       	mov    edi,0x1000001
    2d58:	14 bf                	adc    al,0xbf
    2d5a:	01 00                	add    DWORD PTR [eax],eax
    2d5c:	00 0b                	add    BYTE PTR [ebx],cl
    2d5e:	00 12                	add    BYTE PTR [edx],dl
    2d60:	f7                   	(bad)  
    2d61:	09 00                	or     DWORD PTR [eax],eax
    2d63:	00 01                	add    BYTE PTR [ecx],al
    2d65:	11 4e 04             	adc    DWORD PTR [esi+0x4],ecx
    2d68:	00 00                	add    BYTE PTR [eax],al
    2d6a:	05 03 60 37 00       	add    eax,0x376003
    2d6f:	30 0b                	xor    BYTE PTR [ebx],cl
    2d71:	27                   	daa    
    2d72:	04 00                	add    al,0x0
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
     1f7:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     1fa:	19 03                	sbb    DWORD PTR [ebx],eax
     1fc:	0e                   	push   cs
     1fd:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     1ff:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     201:	27                   	daa    
     202:	19 11                	sbb    DWORD PTR [ecx],edx
     204:	01 12                	add    DWORD PTR [edx],edx
     206:	06                   	push   es
     207:	40                   	inc    eax
     208:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     20e:	00 00                	add    BYTE PTR [eax],al
     210:	07                   	pop    es
     211:	05 00 03 08 3a       	add    eax,0x3a080300
     216:	0b 3b                	or     edi,DWORD PTR [ebx]
     218:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     21b:	02 18                	add    bl,BYTE PTR [eax]
     21d:	00 00                	add    BYTE PTR [eax],al
     21f:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
     222:	03 08                	add    ecx,DWORD PTR [eax]
     224:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     226:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     228:	49                   	dec    ecx
     229:	13 02                	adc    eax,DWORD PTR [edx]
     22b:	18 00                	sbb    BYTE PTR [eax],al
     22d:	00 09                	add    BYTE PTR [ecx],cl
     22f:	0b 01                	or     eax,DWORD PTR [ecx]
     231:	11 01                	adc    DWORD PTR [ecx],eax
     233:	12 06                	adc    al,BYTE PTR [esi]
     235:	00 00                	add    BYTE PTR [eax],al
     237:	0a 2e                	or     ch,BYTE PTR [esi]
     239:	01 3f                	add    DWORD PTR [edi],edi
     23b:	19 03                	sbb    DWORD PTR [ebx],eax
     23d:	0e                   	push   cs
     23e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     240:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     242:	49                   	dec    ecx
     243:	13 3c 19             	adc    edi,DWORD PTR [ecx+ebx*1]
     246:	00 00                	add    BYTE PTR [eax],al
     248:	0b 18                	or     ebx,DWORD PTR [eax]
     24a:	00 00                	add    BYTE PTR [eax],al
     24c:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
     24f:	00 03                	add    BYTE PTR [ebx],al
     251:	0e                   	push   cs
     252:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     254:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     256:	49                   	dec    ecx
     257:	13 02                	adc    eax,DWORD PTR [edx]
     259:	18 00                	sbb    BYTE PTR [eax],al
     25b:	00 0d 2e 01 3f 19    	add    BYTE PTR ds:0x193f012e,cl
     261:	03 0e                	add    ecx,DWORD PTR [esi]
     263:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     265:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     267:	27                   	daa    
     268:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     26b:	11 01                	adc    DWORD PTR [ecx],eax
     26d:	12 06                	adc    al,BYTE PTR [esi]
     26f:	40                   	inc    eax
     270:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     276:	00 00                	add    BYTE PTR [eax],al
     278:	0e                   	push   cs
     279:	34 00                	xor    al,0x0
     27b:	03 0e                	add    ecx,DWORD PTR [esi]
     27d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     27f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     281:	49                   	dec    ecx
     282:	13 3f                	adc    edi,DWORD PTR [edi]
     284:	19 02                	sbb    DWORD PTR [edx],eax
     286:	18 00                	sbb    BYTE PTR [eax],al
     288:	00 00                	add    BYTE PTR [eax],al
     28a:	01 11                	add    DWORD PTR [ecx],edx
     28c:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     292:	0e                   	push   cs
     293:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     295:	11 01                	adc    DWORD PTR [ecx],eax
     297:	12 06                	adc    al,BYTE PTR [esi]
     299:	10 17                	adc    BYTE PTR [edi],dl
     29b:	00 00                	add    BYTE PTR [eax],al
     29d:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     2a0:	0b 0b                	or     ecx,DWORD PTR [ebx]
     2a2:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     2a5:	0e                   	push   cs
     2a6:	00 00                	add    BYTE PTR [eax],al
     2a8:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     2ab:	0b 0b                	or     ecx,DWORD PTR [ebx]
     2ad:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     2b0:	08 00                	or     BYTE PTR [eax],al
     2b2:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     2b5:	00 03                	add    BYTE PTR [ebx],al
     2b7:	0e                   	push   cs
     2b8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     2ba:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     2bc:	49                   	dec    ecx
     2bd:	13 00                	adc    eax,DWORD PTR [eax]
     2bf:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     2c5:	49                   	dec    ecx
     2c6:	13 00                	adc    eax,DWORD PTR [eax]
     2c8:	00 06                	add    BYTE PTR [esi],al
     2ca:	04 01                	add    al,0x1
     2cc:	03 0e                	add    ecx,DWORD PTR [esi]
     2ce:	0b 0b                	or     ecx,DWORD PTR [ebx]
     2d0:	49                   	dec    ecx
     2d1:	13 3a                	adc    edi,DWORD PTR [edx]
     2d3:	0b 3b                	or     edi,DWORD PTR [ebx]
     2d5:	0b 01                	or     eax,DWORD PTR [ecx]
     2d7:	13 00                	adc    eax,DWORD PTR [eax]
     2d9:	00 07                	add    BYTE PTR [edi],al
     2db:	28 00                	sub    BYTE PTR [eax],al
     2dd:	03 0e                	add    ecx,DWORD PTR [esi]
     2df:	1c 0b                	sbb    al,0xb
     2e1:	00 00                	add    BYTE PTR [eax],al
     2e3:	08 28                	or     BYTE PTR [eax],ch
     2e5:	00 03                	add    BYTE PTR [ebx],al
     2e7:	0e                   	push   cs
     2e8:	1c 05                	sbb    al,0x5
     2ea:	00 00                	add    BYTE PTR [eax],al
     2ec:	09 2e                	or     DWORD PTR [esi],ebp
     2ee:	01 3f                	add    DWORD PTR [edi],edi
     2f0:	19 03                	sbb    DWORD PTR [ebx],eax
     2f2:	0e                   	push   cs
     2f3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     2f5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     2f7:	27                   	daa    
     2f8:	19 11                	sbb    DWORD PTR [ecx],edx
     2fa:	01 12                	add    DWORD PTR [edx],edx
     2fc:	06                   	push   es
     2fd:	40                   	inc    eax
     2fe:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     304:	00 00                	add    BYTE PTR [eax],al
     306:	0a 05 00 03 0e 3a    	or     al,BYTE PTR ds:0x3a0e0300
     30c:	0b 3b                	or     edi,DWORD PTR [ebx]
     30e:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     311:	02 18                	add    bl,BYTE PTR [eax]
     313:	00 00                	add    BYTE PTR [eax],al
     315:	0b 05 00 03 08 3a    	or     eax,DWORD PTR ds:0x3a080300
     31b:	0b 3b                	or     edi,DWORD PTR [ebx]
     31d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     320:	02 18                	add    bl,BYTE PTR [eax]
     322:	00 00                	add    BYTE PTR [eax],al
     324:	0c 34                	or     al,0x34
     326:	00 03                	add    BYTE PTR [ebx],al
     328:	0e                   	push   cs
     329:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     32b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     32d:	49                   	dec    ecx
     32e:	13 02                	adc    eax,DWORD PTR [edx]
     330:	18 00                	sbb    BYTE PTR [eax],al
     332:	00 0d 01 01 49 13    	add    BYTE PTR ds:0x13490101,cl
     338:	01 13                	add    DWORD PTR [ebx],edx
     33a:	00 00                	add    BYTE PTR [eax],al
     33c:	0e                   	push   cs
     33d:	21 00                	and    DWORD PTR [eax],eax
     33f:	49                   	dec    ecx
     340:	13 2f                	adc    ebp,DWORD PTR [edi]
     342:	0b 00                	or     eax,DWORD PTR [eax]
     344:	00 0f                	add    BYTE PTR [edi],cl
     346:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     349:	19 03                	sbb    DWORD PTR [ebx],eax
     34b:	0e                   	push   cs
     34c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     34e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     350:	49                   	dec    ecx
     351:	13 11                	adc    edx,DWORD PTR [ecx]
     353:	01 12                	add    DWORD PTR [edx],edx
     355:	06                   	push   es
     356:	40                   	inc    eax
     357:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     35d:	00 00                	add    BYTE PTR [eax],al
     35f:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
     362:	03 08                	add    ecx,DWORD PTR [eax]
     364:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     366:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     368:	49                   	dec    ecx
     369:	13 02                	adc    eax,DWORD PTR [edx]
     36b:	18 00                	sbb    BYTE PTR [eax],al
     36d:	00 11                	add    BYTE PTR [ecx],dl
     36f:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     372:	19 03                	sbb    DWORD PTR [ebx],eax
     374:	0e                   	push   cs
     375:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     377:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     379:	27                   	daa    
     37a:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     37d:	11 01                	adc    DWORD PTR [ecx],eax
     37f:	12 06                	adc    al,BYTE PTR [esi]
     381:	40                   	inc    eax
     382:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     388:	00 00                	add    BYTE PTR [eax],al
     38a:	12 0a                	adc    cl,BYTE PTR [edx]
     38c:	00 03                	add    BYTE PTR [ebx],al
     38e:	0e                   	push   cs
     38f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     391:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     393:	11 01                	adc    DWORD PTR [ecx],eax
     395:	00 00                	add    BYTE PTR [eax],al
     397:	13 34 00             	adc    esi,DWORD PTR [eax+eax*1]
     39a:	03 0e                	add    ecx,DWORD PTR [esi]
     39c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     39e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     3a0:	49                   	dec    ecx
     3a1:	13 3f                	adc    edi,DWORD PTR [edi]
     3a3:	19 02                	sbb    DWORD PTR [edx],eax
     3a5:	18 00                	sbb    BYTE PTR [eax],al
     3a7:	00 00                	add    BYTE PTR [eax],al
     3a9:	01 11                	add    DWORD PTR [ecx],edx
     3ab:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     3b1:	0e                   	push   cs
     3b2:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     3b4:	11 01                	adc    DWORD PTR [ecx],eax
     3b6:	12 06                	adc    al,BYTE PTR [esi]
     3b8:	10 17                	adc    BYTE PTR [edi],dl
     3ba:	00 00                	add    BYTE PTR [eax],al
     3bc:	02 16                	add    dl,BYTE PTR [esi]
     3be:	00 03                	add    BYTE PTR [ebx],al
     3c0:	0e                   	push   cs
     3c1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     3c3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     3c5:	49                   	dec    ecx
     3c6:	13 00                	adc    eax,DWORD PTR [eax]
     3c8:	00 03                	add    BYTE PTR [ebx],al
     3ca:	0f 00 0b             	str    WORD PTR [ebx]
     3cd:	0b 03                	or     eax,DWORD PTR [ebx]
     3cf:	0e                   	push   cs
     3d0:	49                   	dec    ecx
     3d1:	13 00                	adc    eax,DWORD PTR [eax]
     3d3:	00 04 24             	add    BYTE PTR [esp],al
     3d6:	00 0b                	add    BYTE PTR [ebx],cl
     3d8:	0b 3e                	or     edi,DWORD PTR [esi]
     3da:	0b 03                	or     eax,DWORD PTR [ebx]
     3dc:	0e                   	push   cs
     3dd:	00 00                	add    BYTE PTR [eax],al
     3df:	05 24 00 0b 0b       	add    eax,0xb0b0024
     3e4:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     3e7:	08 00                	or     BYTE PTR [eax],al
     3e9:	00 06                	add    BYTE PTR [esi],al
     3eb:	13 01                	adc    eax,DWORD PTR [ecx]
     3ed:	03 08                	add    ecx,DWORD PTR [eax]
     3ef:	0b 0b                	or     ecx,DWORD PTR [ebx]
     3f1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     3f3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     3f5:	01 13                	add    DWORD PTR [ebx],edx
     3f7:	00 00                	add    BYTE PTR [eax],al
     3f9:	07                   	pop    es
     3fa:	0d 00 03 0e 3a       	or     eax,0x3a0e0300
     3ff:	0b 3b                	or     edi,DWORD PTR [ebx]
     401:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     404:	38 0b                	cmp    BYTE PTR [ebx],cl
     406:	00 00                	add    BYTE PTR [eax],al
     408:	08 0f                	or     BYTE PTR [edi],cl
     40a:	00 0b                	add    BYTE PTR [ebx],cl
     40c:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     40f:	00 00                	add    BYTE PTR [eax],al
     411:	09 26                	or     DWORD PTR [esi],esp
     413:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
     416:	00 00                	add    BYTE PTR [eax],al
     418:	0a 0f                	or     cl,BYTE PTR [edi]
     41a:	00 0b                	add    BYTE PTR [ebx],cl
     41c:	0b 00                	or     eax,DWORD PTR [eax]
     41e:	00 0b                	add    BYTE PTR [ebx],cl
     420:	04 01                	add    al,0x1
     422:	03 0e                	add    ecx,DWORD PTR [esi]
     424:	0b 0b                	or     ecx,DWORD PTR [ebx]
     426:	49                   	dec    ecx
     427:	13 3a                	adc    edi,DWORD PTR [edx]
     429:	0b 3b                	or     edi,DWORD PTR [ebx]
     42b:	0b 01                	or     eax,DWORD PTR [ecx]
     42d:	13 00                	adc    eax,DWORD PTR [eax]
     42f:	00 0c 28             	add    BYTE PTR [eax+ebp*1],cl
     432:	00 03                	add    BYTE PTR [ebx],al
     434:	0e                   	push   cs
     435:	1c 0b                	sbb    al,0xb
     437:	00 00                	add    BYTE PTR [eax],al
     439:	0d 28 00 03 0e       	or     eax,0xe030028
     43e:	1c 05                	sbb    al,0x5
     440:	00 00                	add    BYTE PTR [eax],al
     442:	0e                   	push   cs
     443:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     446:	19 03                	sbb    DWORD PTR [ebx],eax
     448:	0e                   	push   cs
     449:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     44b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     44d:	27                   	daa    
     44e:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     451:	11 01                	adc    DWORD PTR [ecx],eax
     453:	12 06                	adc    al,BYTE PTR [esi]
     455:	40                   	inc    eax
     456:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     45c:	00 00                	add    BYTE PTR [eax],al
     45e:	0f 05                	syscall 
     460:	00 03                	add    BYTE PTR [ebx],al
     462:	0e                   	push   cs
     463:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     465:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     467:	49                   	dec    ecx
     468:	13 02                	adc    eax,DWORD PTR [edx]
     46a:	18 00                	sbb    BYTE PTR [eax],al
     46c:	00 10                	add    BYTE PTR [eax],dl
     46e:	34 00                	xor    al,0x0
     470:	03 0e                	add    ecx,DWORD PTR [esi]
     472:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     474:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     476:	49                   	dec    ecx
     477:	13 02                	adc    eax,DWORD PTR [edx]
     479:	18 00                	sbb    BYTE PTR [eax],al
     47b:	00 11                	add    BYTE PTR [ecx],dl
     47d:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
     480:	19 03                	sbb    DWORD PTR [ebx],eax
     482:	0e                   	push   cs
     483:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     485:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     487:	27                   	daa    
     488:	19 11                	sbb    DWORD PTR [ecx],edx
     48a:	01 12                	add    DWORD PTR [edx],edx
     48c:	06                   	push   es
     48d:	40                   	inc    eax
     48e:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
     494:	12 2e                	adc    ch,BYTE PTR [esi]
     496:	01 3f                	add    DWORD PTR [edi],edi
     498:	19 03                	sbb    DWORD PTR [ebx],eax
     49a:	0e                   	push   cs
     49b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     49d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     49f:	27                   	daa    
     4a0:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     4a3:	11 01                	adc    DWORD PTR [ecx],eax
     4a5:	12 06                	adc    al,BYTE PTR [esi]
     4a7:	40                   	inc    eax
     4a8:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     4ae:	00 00                	add    BYTE PTR [eax],al
     4b0:	13 18                	adc    ebx,DWORD PTR [eax]
     4b2:	00 00                	add    BYTE PTR [eax],al
     4b4:	00 14 0b             	add    BYTE PTR [ebx+ecx*1],dl
     4b7:	01 11                	add    DWORD PTR [ecx],edx
     4b9:	01 12                	add    DWORD PTR [edx],edx
     4bb:	06                   	push   es
     4bc:	00 00                	add    BYTE PTR [eax],al
     4be:	15 34 00 03 08       	adc    eax,0x8030034
     4c3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     4c5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     4c7:	49                   	dec    ecx
     4c8:	13 02                	adc    eax,DWORD PTR [edx]
     4ca:	18 00                	sbb    BYTE PTR [eax],al
     4cc:	00 16                	add    BYTE PTR [esi],dl
     4ce:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
     4d1:	19 03                	sbb    DWORD PTR [ebx],eax
     4d3:	0e                   	push   cs
     4d4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     4d6:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     4d8:	11 01                	adc    DWORD PTR [ecx],eax
     4da:	12 06                	adc    al,BYTE PTR [esi]
     4dc:	40                   	inc    eax
     4dd:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
     4e3:	17                   	pop    ss
     4e4:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     4e7:	19 03                	sbb    DWORD PTR [ebx],eax
     4e9:	0e                   	push   cs
     4ea:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     4ec:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     4ee:	27                   	daa    
     4ef:	19 11                	sbb    DWORD PTR [ecx],edx
     4f1:	01 12                	add    DWORD PTR [edx],edx
     4f3:	06                   	push   es
     4f4:	40                   	inc    eax
     4f5:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     4fb:	00 00                	add    BYTE PTR [eax],al
     4fd:	18 05 00 03 08 3a    	sbb    BYTE PTR ds:0x3a080300,al
     503:	0b 3b                	or     edi,DWORD PTR [ebx]
     505:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     508:	02 18                	add    bl,BYTE PTR [eax]
     50a:	00 00                	add    BYTE PTR [eax],al
     50c:	19 2e                	sbb    DWORD PTR [esi],ebp
     50e:	01 3f                	add    DWORD PTR [edi],edi
     510:	19 03                	sbb    DWORD PTR [ebx],eax
     512:	0e                   	push   cs
     513:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     515:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     517:	49                   	dec    ecx
     518:	13 11                	adc    edx,DWORD PTR [ecx]
     51a:	01 12                	add    DWORD PTR [edx],edx
     51c:	06                   	push   es
     51d:	40                   	inc    eax
     51e:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     524:	00 00                	add    BYTE PTR [eax],al
     526:	1a 34 00             	sbb    dh,BYTE PTR [eax+eax*1]
     529:	03 0e                	add    ecx,DWORD PTR [esi]
     52b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     52d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     52f:	49                   	dec    ecx
     530:	13 3f                	adc    edi,DWORD PTR [edi]
     532:	19 02                	sbb    DWORD PTR [edx],eax
     534:	18 00                	sbb    BYTE PTR [eax],al
     536:	00 00                	add    BYTE PTR [eax],al
     538:	01 11                	add    DWORD PTR [ecx],edx
     53a:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     540:	0e                   	push   cs
     541:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     543:	11 01                	adc    DWORD PTR [ecx],eax
     545:	12 06                	adc    al,BYTE PTR [esi]
     547:	10 17                	adc    BYTE PTR [edi],dl
     549:	00 00                	add    BYTE PTR [eax],al
     54b:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     54e:	0b 0b                	or     ecx,DWORD PTR [ebx]
     550:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     553:	0e                   	push   cs
     554:	00 00                	add    BYTE PTR [eax],al
     556:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     559:	0b 0b                	or     ecx,DWORD PTR [ebx]
     55b:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     55e:	08 00                	or     BYTE PTR [eax],al
     560:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     563:	00 03                	add    BYTE PTR [ebx],al
     565:	0e                   	push   cs
     566:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     568:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     56a:	49                   	dec    ecx
     56b:	13 00                	adc    eax,DWORD PTR [eax]
     56d:	00 05 13 01 03 0e    	add    BYTE PTR ds:0xe030113,al
     573:	0b 0b                	or     ecx,DWORD PTR [ebx]
     575:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     577:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     579:	01 13                	add    DWORD PTR [ebx],edx
     57b:	00 00                	add    BYTE PTR [eax],al
     57d:	06                   	push   es
     57e:	0d 00 03 0e 3a       	or     eax,0x3a0e0300
     583:	0b 3b                	or     edi,DWORD PTR [ebx]
     585:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     588:	38 0b                	cmp    BYTE PTR [ebx],cl
     58a:	00 00                	add    BYTE PTR [eax],al
     58c:	07                   	pop    es
     58d:	0d 00 03 08 3a       	or     eax,0x3a080300
     592:	0b 3b                	or     edi,DWORD PTR [ebx]
     594:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     597:	38 0b                	cmp    BYTE PTR [ebx],cl
     599:	00 00                	add    BYTE PTR [eax],al
     59b:	08 0f                	or     BYTE PTR [edi],cl
     59d:	00 0b                	add    BYTE PTR [ebx],cl
     59f:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     5a2:	00 00                	add    BYTE PTR [eax],al
     5a4:	09 0f                	or     DWORD PTR [edi],ecx
     5a6:	00 0b                	add    BYTE PTR [ebx],cl
     5a8:	0b 00                	or     eax,DWORD PTR [eax]
     5aa:	00 0a                	add    BYTE PTR [edx],cl
     5ac:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
     5af:	19 03                	sbb    DWORD PTR [ebx],eax
     5b1:	0e                   	push   cs
     5b2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     5b4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     5b6:	11 01                	adc    DWORD PTR [ecx],eax
     5b8:	12 06                	adc    al,BYTE PTR [esi]
     5ba:	40                   	inc    eax
     5bb:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
     5c1:	0b 2e                	or     ebp,DWORD PTR [esi]
     5c3:	01 3f                	add    DWORD PTR [edi],edi
     5c5:	19 03                	sbb    DWORD PTR [ebx],eax
     5c7:	0e                   	push   cs
     5c8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     5ca:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     5cc:	27                   	daa    
     5cd:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     5d0:	11 01                	adc    DWORD PTR [ecx],eax
     5d2:	12 06                	adc    al,BYTE PTR [esi]
     5d4:	40                   	inc    eax
     5d5:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     5db:	00 00                	add    BYTE PTR [eax],al
     5dd:	0c 05                	or     al,0x5
     5df:	00 03                	add    BYTE PTR [ebx],al
     5e1:	0e                   	push   cs
     5e2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     5e4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     5e6:	49                   	dec    ecx
     5e7:	13 02                	adc    eax,DWORD PTR [edx]
     5e9:	18 00                	sbb    BYTE PTR [eax],al
     5eb:	00 0d 34 00 03 0e    	add    BYTE PTR ds:0xe030034,cl
     5f1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     5f3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     5f5:	49                   	dec    ecx
     5f6:	13 02                	adc    eax,DWORD PTR [edx]
     5f8:	18 00                	sbb    BYTE PTR [eax],al
     5fa:	00 0e                	add    BYTE PTR [esi],cl
     5fc:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     5ff:	19 03                	sbb    DWORD PTR [ebx],eax
     601:	0e                   	push   cs
     602:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     604:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     606:	27                   	daa    
     607:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     60a:	11 01                	adc    DWORD PTR [ecx],eax
     60c:	12 06                	adc    al,BYTE PTR [esi]
     60e:	40                   	inc    eax
     60f:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     615:	00 00                	add    BYTE PTR [eax],al
     617:	0f 2e 01             	ucomiss xmm0,DWORD PTR [ecx]
     61a:	3f                   	aas    
     61b:	19 03                	sbb    DWORD PTR [ebx],eax
     61d:	0e                   	push   cs
     61e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     620:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     622:	27                   	daa    
     623:	19 11                	sbb    DWORD PTR [ecx],edx
     625:	01 12                	add    DWORD PTR [edx],edx
     627:	06                   	push   es
     628:	40                   	inc    eax
     629:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     62f:	00 00                	add    BYTE PTR [eax],al
     631:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
     634:	03 08                	add    ecx,DWORD PTR [eax]
     636:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     638:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     63a:	49                   	dec    ecx
     63b:	13 02                	adc    eax,DWORD PTR [edx]
     63d:	18 00                	sbb    BYTE PTR [eax],al
     63f:	00 11                	add    BYTE PTR [ecx],dl
     641:	0a 00                	or     al,BYTE PTR [eax]
     643:	03 0e                	add    ecx,DWORD PTR [esi]
     645:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     647:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     649:	11 01                	adc    DWORD PTR [ecx],eax
     64b:	00 00                	add    BYTE PTR [eax],al
     64d:	12 2e                	adc    ch,BYTE PTR [esi]
     64f:	00 3f                	add    BYTE PTR [edi],bh
     651:	19 03                	sbb    DWORD PTR [ebx],eax
     653:	0e                   	push   cs
     654:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     656:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     658:	11 01                	adc    DWORD PTR [ecx],eax
     65a:	12 06                	adc    al,BYTE PTR [esi]
     65c:	40                   	inc    eax
     65d:	18 97 42 19 00 00    	sbb    BYTE PTR [edi+0x1942],dl
     663:	13 34 00             	adc    esi,DWORD PTR [eax+eax*1]
     666:	03 0e                	add    ecx,DWORD PTR [esi]
     668:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     66a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     66c:	49                   	dec    ecx
     66d:	13 3f                	adc    edi,DWORD PTR [edi]
     66f:	19 02                	sbb    DWORD PTR [edx],eax
     671:	18 00                	sbb    BYTE PTR [eax],al
     673:	00 00                	add    BYTE PTR [eax],al
     675:	01 11                	add    DWORD PTR [ecx],edx
     677:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     67d:	0e                   	push   cs
     67e:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     680:	11 01                	adc    DWORD PTR [ecx],eax
     682:	12 06                	adc    al,BYTE PTR [esi]
     684:	10 17                	adc    BYTE PTR [edi],dl
     686:	00 00                	add    BYTE PTR [eax],al
     688:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     68b:	0b 0b                	or     ecx,DWORD PTR [ebx]
     68d:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     690:	0e                   	push   cs
     691:	00 00                	add    BYTE PTR [eax],al
     693:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     696:	0b 0b                	or     ecx,DWORD PTR [ebx]
     698:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     69b:	08 00                	or     BYTE PTR [eax],al
     69d:	00 04 0f             	add    BYTE PTR [edi+ecx*1],al
     6a0:	00 0b                	add    BYTE PTR [ebx],cl
     6a2:	0b 00                	or     eax,DWORD PTR [eax]
     6a4:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     6aa:	49                   	dec    ecx
     6ab:	13 00                	adc    eax,DWORD PTR [eax]
     6ad:	00 06                	add    BYTE PTR [esi],al
     6af:	16                   	push   ss
     6b0:	00 03                	add    BYTE PTR [ebx],al
     6b2:	0e                   	push   cs
     6b3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     6b5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     6b7:	49                   	dec    ecx
     6b8:	13 00                	adc    eax,DWORD PTR [eax]
     6ba:	00 07                	add    BYTE PTR [edi],al
     6bc:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
     6c0:	00 00                	add    BYTE PTR [eax],al
     6c2:	08 2e                	or     BYTE PTR [esi],ch
     6c4:	01 3f                	add    DWORD PTR [edi],edi
     6c6:	19 03                	sbb    DWORD PTR [ebx],eax
     6c8:	0e                   	push   cs
     6c9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     6cb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     6cd:	27                   	daa    
     6ce:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     6d1:	11 01                	adc    DWORD PTR [ecx],eax
     6d3:	12 06                	adc    al,BYTE PTR [esi]
     6d5:	40                   	inc    eax
     6d6:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     6dc:	00 00                	add    BYTE PTR [eax],al
     6de:	09 05 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,eax
     6e4:	0b 3b                	or     edi,DWORD PTR [ebx]
     6e6:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     6e9:	02 18                	add    bl,BYTE PTR [eax]
     6eb:	00 00                	add    BYTE PTR [eax],al
     6ed:	0a 05 00 03 08 3a    	or     al,BYTE PTR ds:0x3a080300
     6f3:	0b 3b                	or     edi,DWORD PTR [ebx]
     6f5:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     6f8:	02 18                	add    bl,BYTE PTR [eax]
     6fa:	00 00                	add    BYTE PTR [eax],al
     6fc:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
     6ff:	03 08                	add    ecx,DWORD PTR [eax]
     701:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     703:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     705:	49                   	dec    ecx
     706:	13 02                	adc    eax,DWORD PTR [edx]
     708:	18 00                	sbb    BYTE PTR [eax],al
     70a:	00 0c 0b             	add    BYTE PTR [ebx+ecx*1],cl
     70d:	01 11                	add    DWORD PTR [ecx],edx
     70f:	01 12                	add    DWORD PTR [edx],edx
     711:	06                   	push   es
     712:	01 13                	add    DWORD PTR [ebx],edx
     714:	00 00                	add    BYTE PTR [eax],al
     716:	0d 0b 01 11 01       	or     eax,0x111010b
     71b:	12 06                	adc    al,BYTE PTR [esi]
     71d:	00 00                	add    BYTE PTR [eax],al
     71f:	0e                   	push   cs
     720:	26 00 00             	add    BYTE PTR es:[eax],al
     723:	00 0f                	add    BYTE PTR [edi],cl
     725:	34 00                	xor    al,0x0
     727:	03 0e                	add    ecx,DWORD PTR [esi]
     729:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     72b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     72d:	49                   	dec    ecx
     72e:	13 3f                	adc    edi,DWORD PTR [edi]
     730:	19 02                	sbb    DWORD PTR [edx],eax
     732:	18 00                	sbb    BYTE PTR [eax],al
     734:	00 00                	add    BYTE PTR [eax],al
     736:	01 11                	add    DWORD PTR [ecx],edx
     738:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     73e:	0e                   	push   cs
     73f:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     741:	11 01                	adc    DWORD PTR [ecx],eax
     743:	12 06                	adc    al,BYTE PTR [esi]
     745:	10 17                	adc    BYTE PTR [edi],dl
     747:	00 00                	add    BYTE PTR [eax],al
     749:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     74c:	0b 0b                	or     ecx,DWORD PTR [ebx]
     74e:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     751:	0e                   	push   cs
     752:	00 00                	add    BYTE PTR [eax],al
     754:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     757:	0b 0b                	or     ecx,DWORD PTR [ebx]
     759:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     75c:	08 00                	or     BYTE PTR [eax],al
     75e:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     761:	00 03                	add    BYTE PTR [ebx],al
     763:	0e                   	push   cs
     764:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     766:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     768:	49                   	dec    ecx
     769:	13 00                	adc    eax,DWORD PTR [eax]
     76b:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     771:	00 00                	add    BYTE PTR [eax],al
     773:	06                   	push   es
     774:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     777:	19 03                	sbb    DWORD PTR [ebx],eax
     779:	0e                   	push   cs
     77a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     77c:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     77e:	27                   	daa    
     77f:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     782:	11 01                	adc    DWORD PTR [ecx],eax
     784:	12 06                	adc    al,BYTE PTR [esi]
     786:	40                   	inc    eax
     787:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     78d:	00 00                	add    BYTE PTR [eax],al
     78f:	07                   	pop    es
     790:	05 00 03 08 3a       	add    eax,0x3a080300
     795:	0b 3b                	or     edi,DWORD PTR [ebx]
     797:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     79a:	02 18                	add    bl,BYTE PTR [eax]
     79c:	00 00                	add    BYTE PTR [eax],al
     79e:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
     7a1:	03 08                	add    ecx,DWORD PTR [eax]
     7a3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     7a5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     7a7:	49                   	dec    ecx
     7a8:	13 02                	adc    eax,DWORD PTR [edx]
     7aa:	18 00                	sbb    BYTE PTR [eax],al
     7ac:	00 09                	add    BYTE PTR [ecx],cl
     7ae:	34 00                	xor    al,0x0
     7b0:	03 0e                	add    ecx,DWORD PTR [esi]
     7b2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     7b4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     7b6:	49                   	dec    ecx
     7b7:	13 02                	adc    eax,DWORD PTR [edx]
     7b9:	18 00                	sbb    BYTE PTR [eax],al
     7bb:	00 0a                	add    BYTE PTR [edx],cl
     7bd:	0f 00 0b             	str    WORD PTR [ebx]
     7c0:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     7c3:	00 00                	add    BYTE PTR [eax],al
     7c5:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
     7c8:	03 0e                	add    ecx,DWORD PTR [esi]
     7ca:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     7cc:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     7ce:	49                   	dec    ecx
     7cf:	13 3f                	adc    edi,DWORD PTR [edi]
     7d1:	19 02                	sbb    DWORD PTR [edx],eax
     7d3:	18 00                	sbb    BYTE PTR [eax],al
     7d5:	00 00                	add    BYTE PTR [eax],al
     7d7:	01 11                	add    DWORD PTR [ecx],edx
     7d9:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     7df:	0e                   	push   cs
     7e0:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     7e2:	11 01                	adc    DWORD PTR [ecx],eax
     7e4:	12 06                	adc    al,BYTE PTR [esi]
     7e6:	10 17                	adc    BYTE PTR [edi],dl
     7e8:	00 00                	add    BYTE PTR [eax],al
     7ea:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     7ed:	0b 0b                	or     ecx,DWORD PTR [ebx]
     7ef:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     7f2:	0e                   	push   cs
     7f3:	00 00                	add    BYTE PTR [eax],al
     7f5:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     7f8:	0b 0b                	or     ecx,DWORD PTR [ebx]
     7fa:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     7fd:	08 00                	or     BYTE PTR [eax],al
     7ff:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     802:	00 03                	add    BYTE PTR [ebx],al
     804:	0e                   	push   cs
     805:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     807:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     809:	49                   	dec    ecx
     80a:	13 00                	adc    eax,DWORD PTR [eax]
     80c:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     812:	00 00                	add    BYTE PTR [eax],al
     814:	06                   	push   es
     815:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     818:	19 03                	sbb    DWORD PTR [ebx],eax
     81a:	0e                   	push   cs
     81b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     81d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     81f:	27                   	daa    
     820:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     823:	11 01                	adc    DWORD PTR [ecx],eax
     825:	12 06                	adc    al,BYTE PTR [esi]
     827:	40                   	inc    eax
     828:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     82e:	00 00                	add    BYTE PTR [eax],al
     830:	07                   	pop    es
     831:	05 00 03 0e 3a       	add    eax,0x3a0e0300
     836:	0b 3b                	or     edi,DWORD PTR [ebx]
     838:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     83b:	02 18                	add    bl,BYTE PTR [eax]
     83d:	00 00                	add    BYTE PTR [eax],al
     83f:	08 05 00 03 08 3a    	or     BYTE PTR ds:0x3a080300,al
     845:	0b 3b                	or     edi,DWORD PTR [ebx]
     847:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     84a:	02 18                	add    bl,BYTE PTR [eax]
     84c:	00 00                	add    BYTE PTR [eax],al
     84e:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
     851:	03 0e                	add    ecx,DWORD PTR [esi]
     853:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     855:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     857:	49                   	dec    ecx
     858:	13 3f                	adc    edi,DWORD PTR [edi]
     85a:	19 02                	sbb    DWORD PTR [edx],eax
     85c:	18 00                	sbb    BYTE PTR [eax],al
     85e:	00 00                	add    BYTE PTR [eax],al
     860:	01 11                	add    DWORD PTR [ecx],edx
     862:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     868:	0e                   	push   cs
     869:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     86b:	11 01                	adc    DWORD PTR [ecx],eax
     86d:	12 06                	adc    al,BYTE PTR [esi]
     86f:	10 17                	adc    BYTE PTR [edi],dl
     871:	00 00                	add    BYTE PTR [eax],al
     873:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     876:	0b 0b                	or     ecx,DWORD PTR [ebx]
     878:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     87b:	0e                   	push   cs
     87c:	00 00                	add    BYTE PTR [eax],al
     87e:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     881:	0b 0b                	or     ecx,DWORD PTR [ebx]
     883:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     886:	08 00                	or     BYTE PTR [eax],al
     888:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     88b:	00 03                	add    BYTE PTR [ebx],al
     88d:	0e                   	push   cs
     88e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     890:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     892:	49                   	dec    ecx
     893:	13 00                	adc    eax,DWORD PTR [eax]
     895:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     89b:	49                   	dec    ecx
     89c:	13 00                	adc    eax,DWORD PTR [eax]
     89e:	00 06                	add    BYTE PTR [esi],al
     8a0:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
     8a4:	00 00                	add    BYTE PTR [eax],al
     8a6:	07                   	pop    es
     8a7:	0f 00 0b             	str    WORD PTR [ebx]
     8aa:	0b 00                	or     eax,DWORD PTR [eax]
     8ac:	00 08                	add    BYTE PTR [eax],cl
     8ae:	13 01                	adc    eax,DWORD PTR [ecx]
     8b0:	03 0e                	add    ecx,DWORD PTR [esi]
     8b2:	0b 0b                	or     ecx,DWORD PTR [ebx]
     8b4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     8b6:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     8b8:	01 13                	add    DWORD PTR [ebx],edx
     8ba:	00 00                	add    BYTE PTR [eax],al
     8bc:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
     8c2:	0b 3b                	or     edi,DWORD PTR [ebx]
     8c4:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     8c7:	38 0b                	cmp    BYTE PTR [ebx],cl
     8c9:	00 00                	add    BYTE PTR [eax],al
     8cb:	0a 15 01 27 19 49    	or     dl,BYTE PTR ds:0x49192701
     8d1:	13 01                	adc    eax,DWORD PTR [ecx]
     8d3:	13 00                	adc    eax,DWORD PTR [eax]
     8d5:	00 0b                	add    BYTE PTR [ebx],cl
     8d7:	05 00 49 13 00       	add    eax,0x134900
     8dc:	00 0c 2e             	add    BYTE PTR [esi+ebp*1],cl
     8df:	01 3f                	add    DWORD PTR [edi],edi
     8e1:	19 03                	sbb    DWORD PTR [ebx],eax
     8e3:	0e                   	push   cs
     8e4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     8e6:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     8e8:	27                   	daa    
     8e9:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     8ec:	11 01                	adc    DWORD PTR [ecx],eax
     8ee:	12 06                	adc    al,BYTE PTR [esi]
     8f0:	40                   	inc    eax
     8f1:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     8f7:	00 00                	add    BYTE PTR [eax],al
     8f9:	0d 05 00 03 0e       	or     eax,0xe030005
     8fe:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     900:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     902:	49                   	dec    ecx
     903:	13 02                	adc    eax,DWORD PTR [edx]
     905:	18 00                	sbb    BYTE PTR [eax],al
     907:	00 0e                	add    BYTE PTR [esi],cl
     909:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     90c:	19 03                	sbb    DWORD PTR [ebx],eax
     90e:	0e                   	push   cs
     90f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     911:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     913:	27                   	daa    
     914:	19 11                	sbb    DWORD PTR [ecx],edx
     916:	01 12                	add    DWORD PTR [edx],edx
     918:	06                   	push   es
     919:	40                   	inc    eax
     91a:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     920:	00 00                	add    BYTE PTR [eax],al
     922:	0f 05                	syscall 
     924:	00 03                	add    BYTE PTR [ebx],al
     926:	08 3a                	or     BYTE PTR [edx],bh
     928:	0b 3b                	or     edi,DWORD PTR [ebx]
     92a:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     92d:	02 18                	add    bl,BYTE PTR [eax]
     92f:	00 00                	add    BYTE PTR [eax],al
     931:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
     934:	03 0e                	add    ecx,DWORD PTR [esi]
     936:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     938:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     93a:	49                   	dec    ecx
     93b:	13 02                	adc    eax,DWORD PTR [edx]
     93d:	18 00                	sbb    BYTE PTR [eax],al
     93f:	00 11                	add    BYTE PTR [ecx],dl
     941:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     944:	19 03                	sbb    DWORD PTR [ebx],eax
     946:	0e                   	push   cs
     947:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     949:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     94b:	49                   	dec    ecx
     94c:	13 3c 19             	adc    edi,DWORD PTR [ecx+ebx*1]
     94f:	01 13                	add    DWORD PTR [ebx],edx
     951:	00 00                	add    BYTE PTR [eax],al
     953:	12 18                	adc    bl,BYTE PTR [eax]
     955:	00 00                	add    BYTE PTR [eax],al
     957:	00 13                	add    BYTE PTR [ebx],dl
     959:	0b 01                	or     eax,DWORD PTR [ecx]
     95b:	11 01                	adc    DWORD PTR [ecx],eax
     95d:	12 06                	adc    al,BYTE PTR [esi]
     95f:	01 13                	add    DWORD PTR [ebx],edx
     961:	00 00                	add    BYTE PTR [eax],al
     963:	14 34                	adc    al,0x34
     965:	00 03                	add    BYTE PTR [ebx],al
     967:	08 3a                	or     BYTE PTR [edx],bh
     969:	0b 3b                	or     edi,DWORD PTR [ebx]
     96b:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     96e:	02 18                	add    bl,BYTE PTR [eax]
     970:	00 00                	add    BYTE PTR [eax],al
     972:	15 0b 01 11 01       	adc    eax,0x111010b
     977:	12 06                	adc    al,BYTE PTR [esi]
     979:	00 00                	add    BYTE PTR [eax],al
     97b:	16                   	push   ss
     97c:	01 01                	add    DWORD PTR [ecx],eax
     97e:	49                   	dec    ecx
     97f:	13 01                	adc    eax,DWORD PTR [ecx]
     981:	13 00                	adc    eax,DWORD PTR [eax]
     983:	00 17                	add    BYTE PTR [edi],dl
     985:	21 00                	and    DWORD PTR [eax],eax
     987:	49                   	dec    ecx
     988:	13 2f                	adc    ebp,DWORD PTR [edi]
     98a:	0b 00                	or     eax,DWORD PTR [eax]
     98c:	00 18                	add    BYTE PTR [eax],bl
     98e:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     991:	19 03                	sbb    DWORD PTR [ebx],eax
     993:	0e                   	push   cs
     994:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     996:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     998:	11 01                	adc    DWORD PTR [ecx],eax
     99a:	12 06                	adc    al,BYTE PTR [esi]
     99c:	40                   	inc    eax
     99d:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     9a3:	00 00                	add    BYTE PTR [eax],al
     9a5:	19 2e                	sbb    DWORD PTR [esi],ebp
     9a7:	01 3f                	add    DWORD PTR [edi],edi
     9a9:	19 03                	sbb    DWORD PTR [ebx],eax
     9ab:	0e                   	push   cs
     9ac:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     9ae:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     9b0:	49                   	dec    ecx
     9b1:	13 3c 19             	adc    edi,DWORD PTR [ecx+ebx*1]
     9b4:	00 00                	add    BYTE PTR [eax],al
     9b6:	1a 2e                	sbb    ch,BYTE PTR [esi]
     9b8:	00 3f                	add    BYTE PTR [edi],bh
     9ba:	19 03                	sbb    DWORD PTR [ebx],eax
     9bc:	0e                   	push   cs
     9bd:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     9bf:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     9c1:	11 01                	adc    DWORD PTR [ecx],eax
     9c3:	12 06                	adc    al,BYTE PTR [esi]
     9c5:	40                   	inc    eax
     9c6:	18 97 42 19 00 00    	sbb    BYTE PTR [edi+0x1942],dl
     9cc:	1b 34 00             	sbb    esi,DWORD PTR [eax+eax*1]
     9cf:	03 0e                	add    ecx,DWORD PTR [esi]
     9d1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     9d3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     9d5:	49                   	dec    ecx
     9d6:	13 3f                	adc    edi,DWORD PTR [edi]
     9d8:	19 02                	sbb    DWORD PTR [edx],eax
     9da:	18 00                	sbb    BYTE PTR [eax],al
     9dc:	00 00                	add    BYTE PTR [eax],al
     9de:	01 11                	add    DWORD PTR [ecx],edx
     9e0:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     9e6:	0e                   	push   cs
     9e7:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     9e9:	11 01                	adc    DWORD PTR [ecx],eax
     9eb:	12 06                	adc    al,BYTE PTR [esi]
     9ed:	10 17                	adc    BYTE PTR [edi],dl
     9ef:	00 00                	add    BYTE PTR [eax],al
     9f1:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     9f4:	0b 0b                	or     ecx,DWORD PTR [ebx]
     9f6:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     9f9:	0e                   	push   cs
     9fa:	00 00                	add    BYTE PTR [eax],al
     9fc:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     9ff:	0b 0b                	or     ecx,DWORD PTR [ebx]
     a01:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     a04:	08 00                	or     BYTE PTR [eax],al
     a06:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     a09:	00 03                	add    BYTE PTR [ebx],al
     a0b:	0e                   	push   cs
     a0c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     a0e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     a10:	49                   	dec    ecx
     a11:	13 00                	adc    eax,DWORD PTR [eax]
     a13:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     a19:	49                   	dec    ecx
     a1a:	13 00                	adc    eax,DWORD PTR [eax]
     a1c:	00 06                	add    BYTE PTR [esi],al
     a1e:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
     a22:	00 00                	add    BYTE PTR [eax],al
     a24:	07                   	pop    es
     a25:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     a28:	19 03                	sbb    DWORD PTR [ebx],eax
     a2a:	0e                   	push   cs
     a2b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     a2d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     a2f:	27                   	daa    
     a30:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     a33:	11 01                	adc    DWORD PTR [ecx],eax
     a35:	12 06                	adc    al,BYTE PTR [esi]
     a37:	40                   	inc    eax
     a38:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     a3e:	00 00                	add    BYTE PTR [eax],al
     a40:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
     a46:	0b 3b                	or     edi,DWORD PTR [ebx]
     a48:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     a4b:	02 18                	add    bl,BYTE PTR [eax]
     a4d:	00 00                	add    BYTE PTR [eax],al
     a4f:	09 05 00 03 08 3a    	or     DWORD PTR ds:0x3a080300,eax
     a55:	0b 3b                	or     edi,DWORD PTR [ebx]
     a57:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     a5a:	02 18                	add    bl,BYTE PTR [eax]
     a5c:	00 00                	add    BYTE PTR [eax],al
     a5e:	0a 2e                	or     ch,BYTE PTR [esi]
     a60:	01 3f                	add    DWORD PTR [edi],edi
     a62:	19 03                	sbb    DWORD PTR [ebx],eax
     a64:	0e                   	push   cs
     a65:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     a67:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     a69:	49                   	dec    ecx
     a6a:	13 3c 19             	adc    edi,DWORD PTR [ecx+ebx*1]
     a6d:	00 00                	add    BYTE PTR [eax],al
     a6f:	0b 18                	or     ebx,DWORD PTR [eax]
     a71:	00 00                	add    BYTE PTR [eax],al
     a73:	00 0c 2e             	add    BYTE PTR [esi+ebp*1],cl
     a76:	01 3f                	add    DWORD PTR [edi],edi
     a78:	19 03                	sbb    DWORD PTR [ebx],eax
     a7a:	0e                   	push   cs
     a7b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     a7d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     a7f:	27                   	daa    
     a80:	19 11                	sbb    DWORD PTR [ecx],edx
     a82:	01 12                	add    DWORD PTR [edx],edx
     a84:	06                   	push   es
     a85:	40                   	inc    eax
     a86:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     a8c:	00 00                	add    BYTE PTR [eax],al
     a8e:	0d 34 00 03 08       	or     eax,0x8030034
     a93:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     a95:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     a97:	49                   	dec    ecx
     a98:	13 02                	adc    eax,DWORD PTR [edx]
     a9a:	18 00                	sbb    BYTE PTR [eax],al
     a9c:	00 0e                	add    BYTE PTR [esi],cl
     a9e:	34 00                	xor    al,0x0
     aa0:	03 0e                	add    ecx,DWORD PTR [esi]
     aa2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     aa4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     aa6:	49                   	dec    ecx
     aa7:	13 3f                	adc    edi,DWORD PTR [edi]
     aa9:	19 02                	sbb    DWORD PTR [edx],eax
     aab:	18 00                	sbb    BYTE PTR [eax],al
     aad:	00 00                	add    BYTE PTR [eax],al
     aaf:	01 11                	add    DWORD PTR [ecx],edx
     ab1:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     ab7:	0e                   	push   cs
     ab8:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     aba:	11 01                	adc    DWORD PTR [ecx],eax
     abc:	12 06                	adc    al,BYTE PTR [esi]
     abe:	10 17                	adc    BYTE PTR [edi],dl
     ac0:	00 00                	add    BYTE PTR [eax],al
     ac2:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     ac5:	0b 0b                	or     ecx,DWORD PTR [ebx]
     ac7:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     aca:	0e                   	push   cs
     acb:	00 00                	add    BYTE PTR [eax],al
     acd:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     ad0:	0b 0b                	or     ecx,DWORD PTR [ebx]
     ad2:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     ad5:	08 00                	or     BYTE PTR [eax],al
     ad7:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     ada:	00 03                	add    BYTE PTR [ebx],al
     adc:	0e                   	push   cs
     add:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     adf:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     ae1:	49                   	dec    ecx
     ae2:	13 00                	adc    eax,DWORD PTR [eax]
     ae4:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     aea:	49                   	dec    ecx
     aeb:	13 00                	adc    eax,DWORD PTR [eax]
     aed:	00 06                	add    BYTE PTR [esi],al
     aef:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
     af3:	00 00                	add    BYTE PTR [eax],al
     af5:	07                   	pop    es
     af6:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     af9:	19 03                	sbb    DWORD PTR [ebx],eax
     afb:	0e                   	push   cs
     afc:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     afe:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     b00:	27                   	daa    
     b01:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     b04:	11 01                	adc    DWORD PTR [ecx],eax
     b06:	12 06                	adc    al,BYTE PTR [esi]
     b08:	40                   	inc    eax
     b09:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     b0f:	00 00                	add    BYTE PTR [eax],al
     b11:	08 05 00 03 08 3a    	or     BYTE PTR ds:0x3a080300,al
     b17:	0b 3b                	or     edi,DWORD PTR [ebx]
     b19:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     b1c:	02 18                	add    bl,BYTE PTR [eax]
     b1e:	00 00                	add    BYTE PTR [eax],al
     b20:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
     b23:	03 08                	add    ecx,DWORD PTR [eax]
     b25:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     b27:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     b29:	49                   	dec    ecx
     b2a:	13 02                	adc    eax,DWORD PTR [edx]
     b2c:	18 00                	sbb    BYTE PTR [eax],al
     b2e:	00 0a                	add    BYTE PTR [edx],cl
     b30:	34 00                	xor    al,0x0
     b32:	03 0e                	add    ecx,DWORD PTR [esi]
     b34:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     b36:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     b38:	49                   	dec    ecx
     b39:	13 3f                	adc    edi,DWORD PTR [edi]
     b3b:	19 02                	sbb    DWORD PTR [edx],eax
     b3d:	18 00                	sbb    BYTE PTR [eax],al
     b3f:	00 00                	add    BYTE PTR [eax],al
     b41:	01 11                	add    DWORD PTR [ecx],edx
     b43:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     b49:	0e                   	push   cs
     b4a:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     b4c:	11 01                	adc    DWORD PTR [ecx],eax
     b4e:	12 06                	adc    al,BYTE PTR [esi]
     b50:	10 17                	adc    BYTE PTR [edi],dl
     b52:	00 00                	add    BYTE PTR [eax],al
     b54:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     b57:	0b 0b                	or     ecx,DWORD PTR [ebx]
     b59:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     b5c:	0e                   	push   cs
     b5d:	00 00                	add    BYTE PTR [eax],al
     b5f:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     b62:	0b 0b                	or     ecx,DWORD PTR [ebx]
     b64:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     b67:	08 00                	or     BYTE PTR [eax],al
     b69:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     b6c:	00 03                	add    BYTE PTR [ebx],al
     b6e:	0e                   	push   cs
     b6f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     b71:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     b73:	49                   	dec    ecx
     b74:	13 00                	adc    eax,DWORD PTR [eax]
     b76:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     b7c:	49                   	dec    ecx
     b7d:	13 00                	adc    eax,DWORD PTR [eax]
     b7f:	00 06                	add    BYTE PTR [esi],al
     b81:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
     b85:	00 00                	add    BYTE PTR [eax],al
     b87:	07                   	pop    es
     b88:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     b8b:	19 03                	sbb    DWORD PTR [ebx],eax
     b8d:	0e                   	push   cs
     b8e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     b90:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     b92:	27                   	daa    
     b93:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     b96:	11 01                	adc    DWORD PTR [ecx],eax
     b98:	12 06                	adc    al,BYTE PTR [esi]
     b9a:	40                   	inc    eax
     b9b:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     ba1:	00 00                	add    BYTE PTR [eax],al
     ba3:	08 05 00 03 08 3a    	or     BYTE PTR ds:0x3a080300,al
     ba9:	0b 3b                	or     edi,DWORD PTR [ebx]
     bab:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     bae:	02 18                	add    bl,BYTE PTR [eax]
     bb0:	00 00                	add    BYTE PTR [eax],al
     bb2:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
     bb5:	03 08                	add    ecx,DWORD PTR [eax]
     bb7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     bb9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     bbb:	49                   	dec    ecx
     bbc:	13 02                	adc    eax,DWORD PTR [edx]
     bbe:	18 00                	sbb    BYTE PTR [eax],al
     bc0:	00 0a                	add    BYTE PTR [edx],cl
     bc2:	05 00 03 0e 3a       	add    eax,0x3a0e0300
     bc7:	0b 3b                	or     edi,DWORD PTR [ebx]
     bc9:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     bcc:	02 18                	add    bl,BYTE PTR [eax]
     bce:	00 00                	add    BYTE PTR [eax],al
     bd0:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
     bd3:	03 0e                	add    ecx,DWORD PTR [esi]
     bd5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     bd7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     bd9:	49                   	dec    ecx
     bda:	13 3f                	adc    edi,DWORD PTR [edi]
     bdc:	19 02                	sbb    DWORD PTR [edx],eax
     bde:	18 00                	sbb    BYTE PTR [eax],al
     be0:	00 00                	add    BYTE PTR [eax],al
     be2:	01 11                	add    DWORD PTR [ecx],edx
     be4:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     bea:	0e                   	push   cs
     beb:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     bed:	11 01                	adc    DWORD PTR [ecx],eax
     bef:	12 06                	adc    al,BYTE PTR [esi]
     bf1:	10 17                	adc    BYTE PTR [edi],dl
     bf3:	00 00                	add    BYTE PTR [eax],al
     bf5:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     bf8:	0b 0b                	or     ecx,DWORD PTR [ebx]
     bfa:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     bfd:	08 00                	or     BYTE PTR [eax],al
     bff:	00 03                	add    BYTE PTR [ebx],al
     c01:	16                   	push   ss
     c02:	00 03                	add    BYTE PTR [ebx],al
     c04:	0e                   	push   cs
     c05:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     c07:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     c09:	49                   	dec    ecx
     c0a:	13 00                	adc    eax,DWORD PTR [eax]
     c0c:	00 04 24             	add    BYTE PTR [esp],al
     c0f:	00 0b                	add    BYTE PTR [ebx],cl
     c11:	0b 3e                	or     edi,DWORD PTR [esi]
     c13:	0b 03                	or     eax,DWORD PTR [ebx]
     c15:	0e                   	push   cs
     c16:	00 00                	add    BYTE PTR [eax],al
     c18:	05 2e 01 3f 19       	add    eax,0x193f012e
     c1d:	03 0e                	add    ecx,DWORD PTR [esi]
     c1f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     c21:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     c23:	27                   	daa    
     c24:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     c27:	11 01                	adc    DWORD PTR [ecx],eax
     c29:	12 06                	adc    al,BYTE PTR [esi]
     c2b:	40                   	inc    eax
     c2c:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     c32:	00 00                	add    BYTE PTR [eax],al
     c34:	06                   	push   es
     c35:	05 00 03 08 3a       	add    eax,0x3a080300
     c3a:	0b 3b                	or     edi,DWORD PTR [ebx]
     c3c:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     c3f:	02 18                	add    bl,BYTE PTR [eax]
     c41:	00 00                	add    BYTE PTR [eax],al
     c43:	07                   	pop    es
     c44:	34 00                	xor    al,0x0
     c46:	03 08                	add    ecx,DWORD PTR [eax]
     c48:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     c4a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     c4c:	49                   	dec    ecx
     c4d:	13 02                	adc    eax,DWORD PTR [edx]
     c4f:	18 00                	sbb    BYTE PTR [eax],al
     c51:	00 08                	add    BYTE PTR [eax],cl
     c53:	0f 00 0b             	str    WORD PTR [ebx]
     c56:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     c59:	00 00                	add    BYTE PTR [eax],al
     c5b:	09 26                	or     DWORD PTR [esi],esp
     c5d:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
     c60:	00 00                	add    BYTE PTR [eax],al
     c62:	0a 2e                	or     ch,BYTE PTR [esi]
     c64:	01 3f                	add    DWORD PTR [edi],edi
     c66:	19 03                	sbb    DWORD PTR [ebx],eax
     c68:	0e                   	push   cs
     c69:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     c6b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     c6d:	27                   	daa    
     c6e:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     c71:	11 01                	adc    DWORD PTR [ecx],eax
     c73:	12 06                	adc    al,BYTE PTR [esi]
     c75:	40                   	inc    eax
     c76:	18 97 42 19 00 00    	sbb    BYTE PTR [edi+0x1942],dl
     c7c:	00 01                	add    BYTE PTR [ecx],al
     c7e:	11 01                	adc    DWORD PTR [ecx],eax
     c80:	25 0e 13 0b 03       	and    eax,0x30b130e
     c85:	0e                   	push   cs
     c86:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     c88:	11 01                	adc    DWORD PTR [ecx],eax
     c8a:	12 06                	adc    al,BYTE PTR [esi]
     c8c:	10 17                	adc    BYTE PTR [edi],dl
     c8e:	00 00                	add    BYTE PTR [eax],al
     c90:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     c93:	0b 0b                	or     ecx,DWORD PTR [ebx]
     c95:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     c98:	08 00                	or     BYTE PTR [eax],al
     c9a:	00 03                	add    BYTE PTR [ebx],al
     c9c:	16                   	push   ss
     c9d:	00 03                	add    BYTE PTR [ebx],al
     c9f:	0e                   	push   cs
     ca0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     ca2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     ca4:	49                   	dec    ecx
     ca5:	13 00                	adc    eax,DWORD PTR [eax]
     ca7:	00 04 24             	add    BYTE PTR [esp],al
     caa:	00 0b                	add    BYTE PTR [ebx],cl
     cac:	0b 3e                	or     edi,DWORD PTR [esi]
     cae:	0b 03                	or     eax,DWORD PTR [ebx]
     cb0:	0e                   	push   cs
     cb1:	00 00                	add    BYTE PTR [eax],al
     cb3:	05 2e 01 3f 19       	add    eax,0x193f012e
     cb8:	03 0e                	add    ecx,DWORD PTR [esi]
     cba:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     cbc:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     cbe:	27                   	daa    
     cbf:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     cc2:	11 01                	adc    DWORD PTR [ecx],eax
     cc4:	12 06                	adc    al,BYTE PTR [esi]
     cc6:	40                   	inc    eax
     cc7:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     ccd:	00 00                	add    BYTE PTR [eax],al
     ccf:	06                   	push   es
     cd0:	05 00 03 08 3a       	add    eax,0x3a080300
     cd5:	0b 3b                	or     edi,DWORD PTR [ebx]
     cd7:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     cda:	02 18                	add    bl,BYTE PTR [eax]
     cdc:	00 00                	add    BYTE PTR [eax],al
     cde:	07                   	pop    es
     cdf:	0f 00 0b             	str    WORD PTR [ebx]
     ce2:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     ce5:	00 00                	add    BYTE PTR [eax],al
     ce7:	08 26                	or     BYTE PTR [esi],ah
     ce9:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
     cec:	00 00                	add    BYTE PTR [eax],al
     cee:	00 01                	add    BYTE PTR [ecx],al
     cf0:	11 01                	adc    DWORD PTR [ecx],eax
     cf2:	25 0e 13 0b 03       	and    eax,0x30b130e
     cf7:	0e                   	push   cs
     cf8:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     cfa:	11 01                	adc    DWORD PTR [ecx],eax
     cfc:	12 06                	adc    al,BYTE PTR [esi]
     cfe:	10 17                	adc    BYTE PTR [edi],dl
     d00:	00 00                	add    BYTE PTR [eax],al
     d02:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     d05:	0b 0b                	or     ecx,DWORD PTR [ebx]
     d07:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     d0a:	08 00                	or     BYTE PTR [eax],al
     d0c:	00 03                	add    BYTE PTR [ebx],al
     d0e:	16                   	push   ss
     d0f:	00 03                	add    BYTE PTR [ebx],al
     d11:	0e                   	push   cs
     d12:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     d14:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     d16:	49                   	dec    ecx
     d17:	13 00                	adc    eax,DWORD PTR [eax]
     d19:	00 04 24             	add    BYTE PTR [esp],al
     d1c:	00 0b                	add    BYTE PTR [ebx],cl
     d1e:	0b 3e                	or     edi,DWORD PTR [esi]
     d20:	0b 03                	or     eax,DWORD PTR [ebx]
     d22:	0e                   	push   cs
     d23:	00 00                	add    BYTE PTR [eax],al
     d25:	05 2e 01 3f 19       	add    eax,0x193f012e
     d2a:	03 0e                	add    ecx,DWORD PTR [esi]
     d2c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     d2e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     d30:	27                   	daa    
     d31:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     d34:	11 01                	adc    DWORD PTR [ecx],eax
     d36:	12 06                	adc    al,BYTE PTR [esi]
     d38:	40                   	inc    eax
     d39:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     d3f:	00 00                	add    BYTE PTR [eax],al
     d41:	06                   	push   es
     d42:	05 00 03 08 3a       	add    eax,0x3a080300
     d47:	0b 3b                	or     edi,DWORD PTR [ebx]
     d49:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     d4c:	02 18                	add    bl,BYTE PTR [eax]
     d4e:	00 00                	add    BYTE PTR [eax],al
     d50:	07                   	pop    es
     d51:	34 00                	xor    al,0x0
     d53:	03 08                	add    ecx,DWORD PTR [eax]
     d55:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     d57:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     d59:	49                   	dec    ecx
     d5a:	13 02                	adc    eax,DWORD PTR [edx]
     d5c:	18 00                	sbb    BYTE PTR [eax],al
     d5e:	00 08                	add    BYTE PTR [eax],cl
     d60:	0f 00 0b             	str    WORD PTR [ebx]
     d63:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     d66:	00 00                	add    BYTE PTR [eax],al
     d68:	09 26                	or     DWORD PTR [esi],esp
     d6a:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
     d6d:	00 00                	add    BYTE PTR [eax],al
     d6f:	00 01                	add    BYTE PTR [ecx],al
     d71:	11 01                	adc    DWORD PTR [ecx],eax
     d73:	25 0e 13 0b 03       	and    eax,0x30b130e
     d78:	0e                   	push   cs
     d79:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     d7b:	11 01                	adc    DWORD PTR [ecx],eax
     d7d:	12 06                	adc    al,BYTE PTR [esi]
     d7f:	10 17                	adc    BYTE PTR [edi],dl
     d81:	00 00                	add    BYTE PTR [eax],al
     d83:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     d86:	0b 0b                	or     ecx,DWORD PTR [ebx]
     d88:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     d8b:	0e                   	push   cs
     d8c:	00 00                	add    BYTE PTR [eax],al
     d8e:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     d91:	0b 0b                	or     ecx,DWORD PTR [ebx]
     d93:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     d96:	08 00                	or     BYTE PTR [eax],al
     d98:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     d9b:	00 03                	add    BYTE PTR [ebx],al
     d9d:	0e                   	push   cs
     d9e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     da0:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     da2:	49                   	dec    ecx
     da3:	13 00                	adc    eax,DWORD PTR [eax]
     da5:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     dab:	49                   	dec    ecx
     dac:	13 00                	adc    eax,DWORD PTR [eax]
     dae:	00 06                	add    BYTE PTR [esi],al
     db0:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
     db4:	00 00                	add    BYTE PTR [eax],al
     db6:	07                   	pop    es
     db7:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     dba:	19 03                	sbb    DWORD PTR [ebx],eax
     dbc:	0e                   	push   cs
     dbd:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     dbf:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     dc1:	27                   	daa    
     dc2:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     dc5:	11 01                	adc    DWORD PTR [ecx],eax
     dc7:	12 06                	adc    al,BYTE PTR [esi]
     dc9:	40                   	inc    eax
     dca:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     dd0:	00 00                	add    BYTE PTR [eax],al
     dd2:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
     dd8:	0b 3b                	or     edi,DWORD PTR [ebx]
     dda:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     ddd:	02 18                	add    bl,BYTE PTR [eax]
     ddf:	00 00                	add    BYTE PTR [eax],al
     de1:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
     de4:	03 08                	add    ecx,DWORD PTR [eax]
     de6:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     de8:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     dea:	49                   	dec    ecx
     deb:	13 02                	adc    eax,DWORD PTR [edx]
     ded:	18 00                	sbb    BYTE PTR [eax],al
     def:	00 0a                	add    BYTE PTR [edx],cl
     df1:	34 00                	xor    al,0x0
     df3:	03 0e                	add    ecx,DWORD PTR [esi]
     df5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     df7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     df9:	49                   	dec    ecx
     dfa:	13 00                	adc    eax,DWORD PTR [eax]
     dfc:	00 0b                	add    BYTE PTR [ebx],cl
     dfe:	34 00                	xor    al,0x0
     e00:	03 08                	add    ecx,DWORD PTR [eax]
     e02:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     e04:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     e06:	49                   	dec    ecx
     e07:	13 00                	adc    eax,DWORD PTR [eax]
     e09:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
     e0c:	00 03                	add    BYTE PTR [ebx],al
     e0e:	0e                   	push   cs
     e0f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     e11:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     e13:	49                   	dec    ecx
     e14:	13 02                	adc    eax,DWORD PTR [edx]
     e16:	18 00                	sbb    BYTE PTR [eax],al
     e18:	00 0d 34 00 03 0e    	add    BYTE PTR ds:0xe030034,cl
     e1e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     e20:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     e22:	49                   	dec    ecx
     e23:	13 3f                	adc    edi,DWORD PTR [edi]
     e25:	19 02                	sbb    DWORD PTR [edx],eax
     e27:	18 00                	sbb    BYTE PTR [eax],al
     e29:	00 00                	add    BYTE PTR [eax],al
     e2b:	01 11                	add    DWORD PTR [ecx],edx
     e2d:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     e33:	0e                   	push   cs
     e34:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     e36:	11 01                	adc    DWORD PTR [ecx],eax
     e38:	12 06                	adc    al,BYTE PTR [esi]
     e3a:	10 17                	adc    BYTE PTR [edi],dl
     e3c:	00 00                	add    BYTE PTR [eax],al
     e3e:	02 2e                	add    ch,BYTE PTR [esi]
     e40:	01 3f                	add    DWORD PTR [edi],edi
     e42:	19 03                	sbb    DWORD PTR [ebx],eax
     e44:	0e                   	push   cs
     e45:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     e47:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     e49:	27                   	daa    
     e4a:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     e4d:	11 01                	adc    DWORD PTR [ecx],eax
     e4f:	12 06                	adc    al,BYTE PTR [esi]
     e51:	40                   	inc    eax
     e52:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     e58:	00 00                	add    BYTE PTR [eax],al
     e5a:	03 05 00 03 08 3a    	add    eax,DWORD PTR ds:0x3a080300
     e60:	0b 3b                	or     edi,DWORD PTR [ebx]
     e62:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     e65:	02 18                	add    bl,BYTE PTR [eax]
     e67:	00 00                	add    BYTE PTR [eax],al
     e69:	04 0f                	add    al,0xf
     e6b:	00 0b                	add    BYTE PTR [ebx],cl
     e6d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     e70:	00 00                	add    BYTE PTR [eax],al
     e72:	05 24 00 0b 0b       	add    eax,0xb0b0024
     e77:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     e7a:	0e                   	push   cs
     e7b:	00 00                	add    BYTE PTR [eax],al
     e7d:	06                   	push   es
     e7e:	24 00                	and    al,0x0
     e80:	0b 0b                	or     ecx,DWORD PTR [ebx]
     e82:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     e85:	08 00                	or     BYTE PTR [eax],al
     e87:	00 00                	add    BYTE PTR [eax],al
     e89:	01 11                	add    DWORD PTR [ecx],edx
     e8b:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     e91:	0e                   	push   cs
     e92:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     e94:	11 01                	adc    DWORD PTR [ecx],eax
     e96:	12 06                	adc    al,BYTE PTR [esi]
     e98:	10 17                	adc    BYTE PTR [edi],dl
     e9a:	00 00                	add    BYTE PTR [eax],al
     e9c:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     e9f:	0b 0b                	or     ecx,DWORD PTR [ebx]
     ea1:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     ea4:	0e                   	push   cs
     ea5:	00 00                	add    BYTE PTR [eax],al
     ea7:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     eaa:	0b 0b                	or     ecx,DWORD PTR [ebx]
     eac:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     eaf:	08 00                	or     BYTE PTR [eax],al
     eb1:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     eb4:	00 03                	add    BYTE PTR [ebx],al
     eb6:	0e                   	push   cs
     eb7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     eb9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     ebb:	49                   	dec    ecx
     ebc:	13 00                	adc    eax,DWORD PTR [eax]
     ebe:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     ec4:	49                   	dec    ecx
     ec5:	13 00                	adc    eax,DWORD PTR [eax]
     ec7:	00 06                	add    BYTE PTR [esi],al
     ec9:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
     ecd:	00 00                	add    BYTE PTR [eax],al
     ecf:	07                   	pop    es
     ed0:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     ed3:	19 03                	sbb    DWORD PTR [ebx],eax
     ed5:	0e                   	push   cs
     ed6:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     ed8:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     eda:	27                   	daa    
     edb:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     ede:	11 01                	adc    DWORD PTR [ecx],eax
     ee0:	12 06                	adc    al,BYTE PTR [esi]
     ee2:	40                   	inc    eax
     ee3:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     ee9:	00 00                	add    BYTE PTR [eax],al
     eeb:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
     ef1:	0b 3b                	or     edi,DWORD PTR [ebx]
     ef3:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     ef6:	02 18                	add    bl,BYTE PTR [eax]
     ef8:	00 00                	add    BYTE PTR [eax],al
     efa:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
     efd:	03 08                	add    ecx,DWORD PTR [eax]
     eff:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f01:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     f03:	49                   	dec    ecx
     f04:	13 02                	adc    eax,DWORD PTR [edx]
     f06:	18 00                	sbb    BYTE PTR [eax],al
     f08:	00 0a                	add    BYTE PTR [edx],cl
     f0a:	34 00                	xor    al,0x0
     f0c:	03 0e                	add    ecx,DWORD PTR [esi]
     f0e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f10:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     f12:	49                   	dec    ecx
     f13:	13 00                	adc    eax,DWORD PTR [eax]
     f15:	00 0b                	add    BYTE PTR [ebx],cl
     f17:	34 00                	xor    al,0x0
     f19:	03 08                	add    ecx,DWORD PTR [eax]
     f1b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f1d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     f1f:	49                   	dec    ecx
     f20:	13 00                	adc    eax,DWORD PTR [eax]
     f22:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
     f25:	00 03                	add    BYTE PTR [ebx],al
     f27:	0e                   	push   cs
     f28:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f2a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     f2c:	49                   	dec    ecx
     f2d:	13 3f                	adc    edi,DWORD PTR [edi]
     f2f:	19 02                	sbb    DWORD PTR [edx],eax
     f31:	18 00                	sbb    BYTE PTR [eax],al
     f33:	00 00                	add    BYTE PTR [eax],al
     f35:	01 11                	add    DWORD PTR [ecx],edx
     f37:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     f3d:	0e                   	push   cs
     f3e:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     f40:	11 01                	adc    DWORD PTR [ecx],eax
     f42:	12 06                	adc    al,BYTE PTR [esi]
     f44:	10 17                	adc    BYTE PTR [edi],dl
     f46:	00 00                	add    BYTE PTR [eax],al
     f48:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     f4b:	0b 0b                	or     ecx,DWORD PTR [ebx]
     f4d:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     f50:	0e                   	push   cs
     f51:	00 00                	add    BYTE PTR [eax],al
     f53:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     f56:	0b 0b                	or     ecx,DWORD PTR [ebx]
     f58:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     f5b:	08 00                	or     BYTE PTR [eax],al
     f5d:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     f60:	00 03                	add    BYTE PTR [ebx],al
     f62:	0e                   	push   cs
     f63:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f65:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     f67:	49                   	dec    ecx
     f68:	13 00                	adc    eax,DWORD PTR [eax]
     f6a:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     f70:	49                   	dec    ecx
     f71:	13 00                	adc    eax,DWORD PTR [eax]
     f73:	00 06                	add    BYTE PTR [esi],al
     f75:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     f78:	19 03                	sbb    DWORD PTR [ebx],eax
     f7a:	0e                   	push   cs
     f7b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f7d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     f7f:	27                   	daa    
     f80:	19 11                	sbb    DWORD PTR [ecx],edx
     f82:	01 12                	add    DWORD PTR [edx],edx
     f84:	06                   	push   es
     f85:	40                   	inc    eax
     f86:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     f8c:	00 00                	add    BYTE PTR [eax],al
     f8e:	07                   	pop    es
     f8f:	05 00 03 0e 3a       	add    eax,0x3a0e0300
     f94:	0b 3b                	or     edi,DWORD PTR [ebx]
     f96:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     f99:	02 18                	add    bl,BYTE PTR [eax]
     f9b:	00 00                	add    BYTE PTR [eax],al
     f9d:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
     fa0:	03 08                	add    ecx,DWORD PTR [eax]
     fa2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     fa4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     fa6:	49                   	dec    ecx
     fa7:	13 02                	adc    eax,DWORD PTR [edx]
     fa9:	18 00                	sbb    BYTE PTR [eax],al
     fab:	00 09                	add    BYTE PTR [ecx],cl
     fad:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     fb0:	19 03                	sbb    DWORD PTR [ebx],eax
     fb2:	0e                   	push   cs
     fb3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     fb5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     fb7:	49                   	dec    ecx
     fb8:	13 3c 19             	adc    edi,DWORD PTR [ecx+ebx*1]
     fbb:	00 00                	add    BYTE PTR [eax],al
     fbd:	0a 18                	or     bl,BYTE PTR [eax]
     fbf:	00 00                	add    BYTE PTR [eax],al
     fc1:	00 0b                	add    BYTE PTR [ebx],cl
     fc3:	34 00                	xor    al,0x0
     fc5:	03 0e                	add    ecx,DWORD PTR [esi]
     fc7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     fc9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     fcb:	49                   	dec    ecx
     fcc:	13 3f                	adc    edi,DWORD PTR [edi]
     fce:	19 02                	sbb    DWORD PTR [edx],eax
     fd0:	18 00                	sbb    BYTE PTR [eax],al
     fd2:	00 00                	add    BYTE PTR [eax],al
     fd4:	01 11                	add    DWORD PTR [ecx],edx
     fd6:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     fdc:	0e                   	push   cs
     fdd:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     fdf:	11 01                	adc    DWORD PTR [ecx],eax
     fe1:	12 06                	adc    al,BYTE PTR [esi]
     fe3:	10 17                	adc    BYTE PTR [edi],dl
     fe5:	00 00                	add    BYTE PTR [eax],al
     fe7:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     fea:	0b 0b                	or     ecx,DWORD PTR [ebx]
     fec:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     fef:	0e                   	push   cs
     ff0:	00 00                	add    BYTE PTR [eax],al
     ff2:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     ff5:	0b 0b                	or     ecx,DWORD PTR [ebx]
     ff7:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     ffa:	08 00                	or     BYTE PTR [eax],al
     ffc:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     fff:	00 03                	add    BYTE PTR [ebx],al
    1001:	0e                   	push   cs
    1002:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1004:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1006:	49                   	dec    ecx
    1007:	13 00                	adc    eax,DWORD PTR [eax]
    1009:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
    100f:	49                   	dec    ecx
    1010:	13 00                	adc    eax,DWORD PTR [eax]
    1012:	00 06                	add    BYTE PTR [esi],al
    1014:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
    1017:	19 03                	sbb    DWORD PTR [ebx],eax
    1019:	0e                   	push   cs
    101a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    101c:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    101e:	27                   	daa    
    101f:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
    1022:	11 01                	adc    DWORD PTR [ecx],eax
    1024:	12 06                	adc    al,BYTE PTR [esi]
    1026:	40                   	inc    eax
    1027:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
    102d:	00 00                	add    BYTE PTR [eax],al
    102f:	07                   	pop    es
    1030:	05 00 03 0e 3a       	add    eax,0x3a0e0300
    1035:	0b 3b                	or     edi,DWORD PTR [ebx]
    1037:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
    103a:	02 18                	add    bl,BYTE PTR [eax]
    103c:	00 00                	add    BYTE PTR [eax],al
    103e:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
    1041:	03 08                	add    ecx,DWORD PTR [eax]
    1043:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1045:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1047:	49                   	dec    ecx
    1048:	13 02                	adc    eax,DWORD PTR [edx]
    104a:	18 00                	sbb    BYTE PTR [eax],al
    104c:	00 09                	add    BYTE PTR [ecx],cl
    104e:	01 01                	add    DWORD PTR [ecx],eax
    1050:	49                   	dec    ecx
    1051:	13 01                	adc    eax,DWORD PTR [ecx]
    1053:	13 00                	adc    eax,DWORD PTR [eax]
    1055:	00 0a                	add    BYTE PTR [edx],cl
    1057:	21 00                	and    DWORD PTR [eax],eax
    1059:	49                   	dec    ecx
    105a:	13 2f                	adc    ebp,DWORD PTR [edi]
    105c:	0b 00                	or     eax,DWORD PTR [eax]
    105e:	00 0b                	add    BYTE PTR [ebx],cl
    1060:	34 00                	xor    al,0x0
    1062:	03 0e                	add    ecx,DWORD PTR [esi]
    1064:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1066:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1068:	49                   	dec    ecx
    1069:	13 02                	adc    eax,DWORD PTR [edx]
    106b:	18 00                	sbb    BYTE PTR [eax],al
    106d:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
    1070:	00 03                	add    BYTE PTR [ebx],al
    1072:	0e                   	push   cs
    1073:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1075:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1077:	49                   	dec    ecx
    1078:	13 3f                	adc    edi,DWORD PTR [edi]
    107a:	19 02                	sbb    DWORD PTR [edx],eax
    107c:	18 00                	sbb    BYTE PTR [eax],al
    107e:	00 00                	add    BYTE PTR [eax],al
    1080:	01 11                	add    DWORD PTR [ecx],edx
    1082:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
    1088:	0e                   	push   cs
    1089:	1b 0e                	sbb    ecx,DWORD PTR [esi]
    108b:	11 01                	adc    DWORD PTR [ecx],eax
    108d:	12 06                	adc    al,BYTE PTR [esi]
    108f:	10 17                	adc    BYTE PTR [edi],dl
    1091:	00 00                	add    BYTE PTR [eax],al
    1093:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1096:	03 0e                	add    ecx,DWORD PTR [esi]
    1098:	0b 0b                	or     ecx,DWORD PTR [ebx]
    109a:	49                   	dec    ecx
    109b:	13 3a                	adc    edi,DWORD PTR [edx]
    109d:	0b 3b                	or     edi,DWORD PTR [ebx]
    109f:	0b 01                	or     eax,DWORD PTR [ecx]
    10a1:	13 00                	adc    eax,DWORD PTR [eax]
    10a3:	00 03                	add    BYTE PTR [ebx],al
    10a5:	28 00                	sub    BYTE PTR [eax],al
    10a7:	03 0e                	add    ecx,DWORD PTR [esi]
    10a9:	1c 0b                	sbb    al,0xb
    10ab:	00 00                	add    BYTE PTR [eax],al
    10ad:	04 28                	add    al,0x28
    10af:	00 03                	add    BYTE PTR [ebx],al
    10b1:	0e                   	push   cs
    10b2:	1c 05                	sbb    al,0x5
    10b4:	00 00                	add    BYTE PTR [eax],al
    10b6:	05 24 00 0b 0b       	add    eax,0xb0b0024
    10bb:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
    10be:	0e                   	push   cs
    10bf:	00 00                	add    BYTE PTR [eax],al
    10c1:	06                   	push   es
    10c2:	24 00                	and    al,0x0
    10c4:	0b 0b                	or     ecx,DWORD PTR [ebx]
    10c6:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
    10c9:	08 00                	or     BYTE PTR [eax],al
    10cb:	00 07                	add    BYTE PTR [edi],al
    10cd:	16                   	push   ss
    10ce:	00 03                	add    BYTE PTR [ebx],al
    10d0:	0e                   	push   cs
    10d1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    10d3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    10d5:	49                   	dec    ecx
    10d6:	13 00                	adc    eax,DWORD PTR [eax]
    10d8:	00 08                	add    BYTE PTR [eax],cl
    10da:	13 01                	adc    eax,DWORD PTR [ecx]
    10dc:	03 08                	add    ecx,DWORD PTR [eax]
    10de:	0b 0b                	or     ecx,DWORD PTR [ebx]
    10e0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    10e2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    10e4:	01 13                	add    DWORD PTR [ebx],edx
    10e6:	00 00                	add    BYTE PTR [eax],al
    10e8:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
    10ee:	0b 3b                	or     edi,DWORD PTR [ebx]
    10f0:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
    10f3:	38 0b                	cmp    BYTE PTR [ebx],cl
    10f5:	00 00                	add    BYTE PTR [eax],al
    10f7:	0a 0f                	or     cl,BYTE PTR [edi]
    10f9:	00 0b                	add    BYTE PTR [ebx],cl
    10fb:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
    10fe:	00 00                	add    BYTE PTR [eax],al
    1100:	0b 26                	or     esp,DWORD PTR [esi]
    1102:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
    1105:	00 00                	add    BYTE PTR [eax],al
    1107:	0c 2e                	or     al,0x2e
    1109:	01 3f                	add    DWORD PTR [edi],edi
    110b:	19 03                	sbb    DWORD PTR [ebx],eax
    110d:	0e                   	push   cs
    110e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1110:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1112:	49                   	dec    ecx
    1113:	13 11                	adc    edx,DWORD PTR [ecx]
    1115:	01 12                	add    DWORD PTR [edx],edx
    1117:	06                   	push   es
    1118:	40                   	inc    eax
    1119:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
    111f:	00 00                	add    BYTE PTR [eax],al
    1121:	0d 34 00 03 0e       	or     eax,0xe030034
    1126:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1128:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    112a:	49                   	dec    ecx
    112b:	13 02                	adc    eax,DWORD PTR [edx]
    112d:	18 00                	sbb    BYTE PTR [eax],al
    112f:	00 0e                	add    BYTE PTR [esi],cl
    1131:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
    1134:	19 03                	sbb    DWORD PTR [ebx],eax
    1136:	0e                   	push   cs
    1137:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1139:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    113b:	27                   	daa    
    113c:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
    113f:	11 01                	adc    DWORD PTR [ecx],eax
    1141:	12 06                	adc    al,BYTE PTR [esi]
    1143:	40                   	inc    eax
    1144:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
    114a:	00 00                	add    BYTE PTR [eax],al
    114c:	0f 05                	syscall 
    114e:	00 03                	add    BYTE PTR [ebx],al
    1150:	0e                   	push   cs
    1151:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1153:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1155:	49                   	dec    ecx
    1156:	13 02                	adc    eax,DWORD PTR [edx]
    1158:	18 00                	sbb    BYTE PTR [eax],al
    115a:	00 10                	add    BYTE PTR [eax],dl
    115c:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
    115f:	19 03                	sbb    DWORD PTR [ebx],eax
    1161:	0e                   	push   cs
    1162:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1164:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1166:	27                   	daa    
    1167:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
    116a:	11 01                	adc    DWORD PTR [ecx],eax
    116c:	12 06                	adc    al,BYTE PTR [esi]
    116e:	40                   	inc    eax
    116f:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
    1175:	00 00                	add    BYTE PTR [eax],al
    1177:	11 34 00             	adc    DWORD PTR [eax+eax*1],esi
    117a:	03 08                	add    ecx,DWORD PTR [eax]
    117c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    117e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1180:	49                   	dec    ecx
    1181:	13 02                	adc    eax,DWORD PTR [edx]
    1183:	18 00                	sbb    BYTE PTR [eax],al
    1185:	00 12                	add    BYTE PTR [edx],dl
    1187:	34 00                	xor    al,0x0
    1189:	03 0e                	add    ecx,DWORD PTR [esi]
    118b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    118d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    118f:	49                   	dec    ecx
    1190:	13 3f                	adc    edi,DWORD PTR [edi]
    1192:	19 02                	sbb    DWORD PTR [edx],eax
    1194:	18 00                	sbb    BYTE PTR [eax],al
    1196:	00 13                	add    BYTE PTR [ebx],dl
    1198:	01 01                	add    DWORD PTR [ecx],eax
    119a:	49                   	dec    ecx
    119b:	13 01                	adc    eax,DWORD PTR [ecx]
    119d:	13 00                	adc    eax,DWORD PTR [eax]
    119f:	00 14 21             	add    BYTE PTR [ecx+eiz*1],dl
    11a2:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
    11a5:	2f                   	das    
    11a6:	0b 00                	or     eax,DWORD PTR [eax]
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
  74:	8e 01                	mov    es,WORD PTR [ecx]
	...
  7e:	00 00                	add    BYTE PTR [eax],al
  80:	1c 00                	sbb    al,0x0
  82:	00 00                	add    BYTE PTR [eax],al
  84:	02 00                	add    al,BYTE PTR [eax]
  86:	ff 05 00 00 04 00    	inc    DWORD PTR ds:0x40000
  8c:	00 00                	add    BYTE PTR [eax],al
  8e:	00 00                	add    BYTE PTR [eax],al
  90:	44                   	inc    esp
  91:	03 00                	add    eax,DWORD PTR [eax]
  93:	30 52 01             	xor    BYTE PTR [edx+0x1],dl
	...
  9e:	00 00                	add    BYTE PTR [eax],al
  a0:	1c 00                	sbb    al,0x0
  a2:	00 00                	add    BYTE PTR [eax],al
  a4:	02 00                	add    al,BYTE PTR [eax]
  a6:	78 08                	js     b0 <sysEnter_Vector-0x12ff50>
  a8:	00 00                	add    BYTE PTR [eax],al
  aa:	04 00                	add    al,0x0
  ac:	00 00                	add    BYTE PTR [eax],al
  ae:	00 00                	add    BYTE PTR [eax],al
  b0:	98                   	cwde   
  b1:	04 00                	add    al,0x0
  b3:	30 6c 03 00          	xor    BYTE PTR [ebx+eax*1+0x0],ch
	...
  bf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  c2:	00 00                	add    BYTE PTR [eax],al
  c4:	02 00                	add    al,BYTE PTR [eax]
  c6:	46                   	inc    esi
  c7:	0e                   	push   cs
  c8:	00 00                	add    BYTE PTR [eax],al
  ca:	04 00                	add    al,0x0
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	00 00                	add    BYTE PTR [eax],al
  d0:	04 08                	add    al,0x8
  d2:	00 30                	add    BYTE PTR [eax],dh
  d4:	25 03 00 00 00       	and    eax,0x3
  d9:	00 00                	add    BYTE PTR [eax],al
  db:	00 00                	add    BYTE PTR [eax],al
  dd:	00 00                	add    BYTE PTR [eax],al
  df:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  e2:	00 00                	add    BYTE PTR [eax],al
  e4:	02 00                	add    al,BYTE PTR [eax]
  e6:	9c                   	pushf  
  e7:	10 00                	adc    BYTE PTR [eax],al
  e9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
  ec:	00 00                	add    BYTE PTR [eax],al
  ee:	00 00                	add    BYTE PTR [eax],al
  f0:	2c 0b                	sub    al,0xb
  f2:	00 30                	add    BYTE PTR [eax],dh
  f4:	9b                   	fwait
  f5:	01 00                	add    DWORD PTR [eax],eax
	...
  ff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 102:	00 00                	add    BYTE PTR [eax],al
 104:	02 00                	add    al,BYTE PTR [eax]
 106:	7e 12                	jle    11a <sysEnter_Vector-0x12fee6>
 108:	00 00                	add    BYTE PTR [eax],al
 10a:	04 00                	add    al,0x0
 10c:	00 00                	add    BYTE PTR [eax],al
 10e:	00 00                	add    BYTE PTR [eax],al
 110:	c8 0c 00 30          	enter  0xc,0x30
 114:	8e 01                	mov    es,WORD PTR [ecx]
	...
 11e:	00 00                	add    BYTE PTR [eax],al
 120:	1c 00                	sbb    al,0x0
 122:	00 00                	add    BYTE PTR [eax],al
 124:	02 00                	add    al,BYTE PTR [eax]
 126:	9b                   	fwait
 127:	14 00                	adc    al,0x0
 129:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 12c:	00 00                	add    BYTE PTR [eax],al
 12e:	00 00                	add    BYTE PTR [eax],al
 130:	58                   	pop    eax
 131:	0e                   	push   cs
 132:	00 30                	add    BYTE PTR [eax],dh
 134:	10 00                	adc    BYTE PTR [eax],al
	...
 13e:	00 00                	add    BYTE PTR [eax],al
 140:	1c 00                	sbb    al,0x0
 142:	00 00                	add    BYTE PTR [eax],al
 144:	02 00                	add    al,BYTE PTR [eax]
 146:	02 16                	add    dl,BYTE PTR [esi]
 148:	00 00                	add    BYTE PTR [eax],al
 14a:	04 00                	add    al,0x0
 14c:	00 00                	add    BYTE PTR [eax],al
 14e:	00 00                	add    BYTE PTR [eax],al
 150:	68 0e 00 30 60       	push   0x6030000e
 155:	02 00                	add    al,BYTE PTR [eax]
	...
 15f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 162:	00 00                	add    BYTE PTR [eax],al
 164:	02 00                	add    al,BYTE PTR [eax]
 166:	ff 1b                	call   FWORD PTR [ebx]
 168:	00 00                	add    BYTE PTR [eax],al
 16a:	04 00                	add    al,0x0
 16c:	00 00                	add    BYTE PTR [eax],al
 16e:	00 00                	add    BYTE PTR [eax],al
 170:	c8 10 00 30          	enter  0x10,0x30
 174:	eb 00                	jmp    176 <sysEnter_Vector-0x12fe8a>
	...
 17e:	00 00                	add    BYTE PTR [eax],al
 180:	1c 00                	sbb    al,0x0
 182:	00 00                	add    BYTE PTR [eax],al
 184:	02 00                	add    al,BYTE PTR [eax]
 186:	b1 1d                	mov    cl,0x1d
 188:	00 00                	add    BYTE PTR [eax],al
 18a:	04 00                	add    al,0x0
 18c:	00 00                	add    BYTE PTR [eax],al
 18e:	00 00                	add    BYTE PTR [eax],al
 190:	b4 11                	mov    ah,0x11
 192:	00 30                	add    BYTE PTR [eax],dh
 194:	5e                   	pop    esi
	...
 19d:	00 00                	add    BYTE PTR [eax],al
 19f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 1a2:	00 00                	add    BYTE PTR [eax],al
 1a4:	02 00                	add    al,BYTE PTR [eax]
 1a6:	0f 1f 00             	nop    DWORD PTR [eax]
 1a9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 1ac:	00 00                	add    BYTE PTR [eax],al
 1ae:	00 00                	add    BYTE PTR [eax],al
 1b0:	14 12                	adc    al,0x12
 1b2:	00 30                	add    BYTE PTR [eax],dh
 1b4:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1ba:	00 00                	add    BYTE PTR [eax],al
 1bc:	00 00                	add    BYTE PTR [eax],al
 1be:	00 00                	add    BYTE PTR [eax],al
 1c0:	1c 00                	sbb    al,0x0
 1c2:	00 00                	add    BYTE PTR [eax],al
 1c4:	02 00                	add    al,BYTE PTR [eax]
 1c6:	d0 20                	shl    BYTE PTR [eax],1
 1c8:	00 00                	add    BYTE PTR [eax],al
 1ca:	04 00                	add    al,0x0
 1cc:	00 00                	add    BYTE PTR [eax],al
 1ce:	00 00                	add    BYTE PTR [eax],al
 1d0:	dc 12                	fcom   QWORD PTR [edx]
 1d2:	00 30                	add    BYTE PTR [eax],dh
 1d4:	62 00                	bound  eax,QWORD PTR [eax]
	...
 1de:	00 00                	add    BYTE PTR [eax],al
 1e0:	1c 00                	sbb    al,0x0
 1e2:	00 00                	add    BYTE PTR [eax],al
 1e4:	02 00                	add    al,BYTE PTR [eax]
 1e6:	9e                   	sahf   
 1e7:	21 00                	and    DWORD PTR [eax],eax
 1e9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 1ec:	00 00                	add    BYTE PTR [eax],al
 1ee:	00 00                	add    BYTE PTR [eax],al
 1f0:	40                   	inc    eax
 1f1:	13 00                	adc    eax,DWORD PTR [eax]
 1f3:	30 67 00             	xor    BYTE PTR [edi+0x0],ah
	...
 1fe:	00 00                	add    BYTE PTR [eax],al
 200:	1c 00                	sbb    al,0x0
 202:	00 00                	add    BYTE PTR [eax],al
 204:	02 00                	add    al,BYTE PTR [eax]
 206:	44                   	inc    esp
 207:	22 00                	and    al,BYTE PTR [eax]
 209:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 20c:	00 00                	add    BYTE PTR [eax],al
 20e:	00 00                	add    BYTE PTR [eax],al
 210:	a8 13                	test   al,0x13
 212:	00 30                	add    BYTE PTR [eax],dh
 214:	60                   	pusha  
	...
 21d:	00 00                	add    BYTE PTR [eax],al
 21f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 222:	00 00                	add    BYTE PTR [eax],al
 224:	02 00                	add    al,BYTE PTR [eax]
 226:	fc                   	cld    
 227:	22 00                	and    al,BYTE PTR [eax]
 229:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 22c:	00 00                	add    BYTE PTR [eax],al
 22e:	00 00                	add    BYTE PTR [eax],al
 230:	08 14 00             	or     BYTE PTR [eax+eax*1],dl
 233:	30 7d 01             	xor    BYTE PTR [ebp+0x1],bh
	...
 23e:	00 00                	add    BYTE PTR [eax],al
 240:	1c 00                	sbb    al,0x0
 242:	00 00                	add    BYTE PTR [eax],al
 244:	02 00                	add    al,BYTE PTR [eax]
 246:	8c 24 00             	mov    WORD PTR [eax+eax*1],fs
 249:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 24c:	00 00                	add    BYTE PTR [eax],al
 24e:	00 00                	add    BYTE PTR [eax],al
 250:	88 15 00 30 1d 00    	mov    BYTE PTR ds:0x1d3000,dl
	...
 25e:	00 00                	add    BYTE PTR [eax],al
 260:	1c 00                	sbb    al,0x0
 262:	00 00                	add    BYTE PTR [eax],al
 264:	02 00                	add    al,BYTE PTR [eax]
 266:	fc                   	cld    
 267:	24 00                	and    al,0x0
 269:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 26c:	00 00                	add    BYTE PTR [eax],al
 26e:	00 00                	add    BYTE PTR [eax],al
 270:	a8 15                	test   al,0x15
 272:	00 30                	add    BYTE PTR [eax],dh
 274:	9c                   	pushf  
 275:	01 00                	add    DWORD PTR [eax],eax
	...
 27f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 282:	00 00                	add    BYTE PTR [eax],al
 284:	02 00                	add    al,BYTE PTR [eax]
 286:	8a 26                	mov    ah,BYTE PTR [esi]
 288:	00 00                	add    BYTE PTR [eax],al
 28a:	04 00                	add    al,0x0
 28c:	00 00                	add    BYTE PTR [eax],al
 28e:	00 00                	add    BYTE PTR [eax],al
 290:	44                   	inc    esp
 291:	17                   	pop    ss
 292:	00 30                	add    BYTE PTR [eax],dh
 294:	96                   	xchg   esi,eax
	...
 29d:	00 00                	add    BYTE PTR [eax],al
 29f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 2a2:	00 00                	add    BYTE PTR [eax],al
 2a4:	02 00                	add    al,BYTE PTR [eax]
 2a6:	cd 27                	int    0x27
 2a8:	00 00                	add    BYTE PTR [eax],al
 2aa:	04 00                	add    al,0x0
 2ac:	00 00                	add    BYTE PTR [eax],al
 2ae:	00 00                	add    BYTE PTR [eax],al
 2b0:	dc 17                	fcom   QWORD PTR [edi]
 2b2:	00 30                	add    BYTE PTR [eax],dh
 2b4:	6e                   	outs   dx,BYTE PTR ds:[esi]
	...
 2bd:	00 00                	add    BYTE PTR [eax],al
 2bf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 2c2:	00 00                	add    BYTE PTR [eax],al
 2c4:	02 00                	add    al,BYTE PTR [eax]
 2c6:	22 29                	and    ch,BYTE PTR [ecx]
 2c8:	00 00                	add    BYTE PTR [eax],al
 2ca:	04 00                	add    al,0x0
 2cc:	00 00                	add    BYTE PTR [eax],al
 2ce:	00 00                	add    BYTE PTR [eax],al
 2d0:	4c                   	dec    esp
 2d1:	18 00                	sbb    BYTE PTR [eax],al
 2d3:	30 16                	xor    BYTE PTR [esi],dl
 2d5:	0c 00                	or     al,0x0
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
     2d0:	01 02                	add    DWORD PTR [edx],eax
     2d2:	01 00                	add    DWORD PTR [eax],eax
     2d4:	00 02                	add    BYTE PTR [edx],al
     2d6:	00 9d 00 00 00 01    	add    BYTE PTR [ebp+0x1000000],bl
     2dc:	01 fb                	add    ebx,edi
     2de:	0e                   	push   cs
     2df:	0d 00 01 01 01       	or     eax,0x1010100
     2e4:	01 00                	add    DWORD PTR [eax],eax
     2e6:	00 00                	add    BYTE PTR [eax],al
     2e8:	01 00                	add    DWORD PTR [eax],eax
     2ea:	00 01                	add    BYTE PTR [ecx],al
     2ec:	73 72                	jae    360 <sysEnter_Vector-0x12fca0>
     2ee:	63 00                	arpl   WORD PTR [eax],ax
     2f0:	2f                   	das    
     2f1:	68 6f 6d 65 2f       	push   0x2f656d6f
     2f6:	79 6f                	jns    367 <sysEnter_Vector-0x12fc99>
     2f8:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     2ff:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     302:	73 73                	jae    377 <sysEnter_Vector-0x12fc89>
     304:	2f                   	das    
     305:	6c                   	ins    BYTE PTR es:[edi],dx
     306:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     30d:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     313:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     319:	78 2d                	js     348 <sysEnter_Vector-0x12fcb8>
     31b:	67 6e                	outs   dx,BYTE PTR ds:[si]
     31d:	75 2f                	jne    34e <sysEnter_Vector-0x12fcb2>
     31f:	35 2e 33 2e 30       	xor    eax,0x302e332e
     324:	2f                   	das    
     325:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     32c:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     32f:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     333:	65 00 00             	add    BYTE PTR gs:[eax],al
     336:	61                   	popa   
     337:	73 63                	jae    39c <sysEnter_Vector-0x12fc64>
     339:	69 69 2e 63 00 01 00 	imul   ebp,DWORD PTR [ecx+0x2e],0x10063
     340:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     343:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     34a:	63 
     34b:	2e                   	cs
     34c:	68 00 02 00 00       	push   0x200
     351:	74 69                	je     3bc <sysEnter_Vector-0x12fc44>
     353:	6d                   	ins    DWORD PTR es:[edi],dx
     354:	65                   	gs
     355:	2e                   	cs
     356:	68 00 03 00 00       	push   0x300
     35b:	6d                   	ins    DWORD PTR es:[edi],dx
     35c:	61                   	popa   
     35d:	6c                   	ins    BYTE PTR es:[edi],dx
     35e:	6c                   	ins    BYTE PTR es:[edi],dx
     35f:	6f                   	outs   dx,DWORD PTR ds:[esi]
     360:	63 2e                	arpl   WORD PTR [esi],bp
     362:	68 00 03 00 00       	push   0x300
     367:	6c                   	ins    BYTE PTR es:[edi],dx
     368:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     36f:	4f                   	dec    edi
     370:	53                   	push   ebx
     371:	2e                   	cs
     372:	68 00 03 00 00       	push   0x300
     377:	00 00                	add    BYTE PTR [eax],al
     379:	05 02 b4 01 00       	add    eax,0x1b402
     37e:	30 03                	xor    BYTE PTR [ebx],al
     380:	0a 01                	or     al,BYTE PTR [ecx]
     382:	08 16                	or     BYTE PTR [esi],dl
     384:	00 02                	add    BYTE PTR [edx],al
     386:	04 03                	add    al,0x3
     388:	08 d7                	or     bh,dl
     38a:	00 02                	add    BYTE PTR [edx],al
     38c:	04 03                	add    al,0x3
     38e:	d7                   	xlat   BYTE PTR ds:[ebx]
     38f:	00 02                	add    BYTE PTR [edx],al
     391:	04 03                	add    al,0x3
     393:	08 4b 00             	or     BYTE PTR [ebx+0x0],cl
     396:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
     399:	d3 00                	rol    DWORD PTR [eax],cl
     39b:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     39e:	06                   	push   es
     39f:	82                   	(bad)  
     3a0:	06                   	push   es
     3a1:	87 69 08             	xchg   DWORD PTR [ecx+0x8],ebp
     3a4:	15 bb 3d 00 02       	adc    eax,0x2003dbb
     3a9:	04 01                	add    al,0x1
     3ab:	76 00                	jbe    3ad <sysEnter_Vector-0x12fc53>
     3ad:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     3b0:	02 3b                	add    bh,BYTE PTR [ebx]
     3b2:	13 08                	adc    ecx,DWORD PTR [eax]
     3b4:	f3 67 08 2f          	repz or BYTE PTR [bx],ch
     3b8:	ad                   	lods   eax,DWORD PTR ds:[esi]
     3b9:	d7                   	xlat   BYTE PTR ds:[ebx]
     3ba:	6a f3                	push   0xfffffff3
     3bc:	78 00                	js     3be <sysEnter_Vector-0x12fc42>
     3be:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
     3c1:	91                   	xchg   ecx,eax
     3c2:	00 02                	add    BYTE PTR [edx],al
     3c4:	04 03                	add    al,0x3
     3c6:	02 24 11             	add    ah,BYTE PTR [ecx+edx*1]
     3c9:	00 02                	add    BYTE PTR [edx],al
     3cb:	04 01                	add    al,0x1
     3cd:	06                   	push   es
     3ce:	4a                   	dec    edx
     3cf:	06                   	push   es
     3d0:	e8 3d 02 02 00       	call   20612 <sysEnter_Vector-0x10f9ee>
     3d5:	01 01                	add    DWORD PTR [ecx],eax
     3d7:	25 01 00 00 02       	and    eax,0x2000001
     3dc:	00 d3                	add    bl,dl
     3de:	00 00                	add    BYTE PTR [eax],al
     3e0:	00 01                	add    BYTE PTR [ecx],al
     3e2:	01 fb                	add    ebx,edi
     3e4:	0e                   	push   cs
     3e5:	0d 00 01 01 01       	or     eax,0x1010100
     3ea:	01 00                	add    DWORD PTR [eax],eax
     3ec:	00 00                	add    BYTE PTR [eax],al
     3ee:	01 00                	add    DWORD PTR [eax],eax
     3f0:	00 01                	add    BYTE PTR [ecx],al
     3f2:	73 72                	jae    466 <sysEnter_Vector-0x12fb9a>
     3f4:	63 2f                	arpl   WORD PTR [edi],bp
     3f6:	69 6e 70 75 74 00 2f 	imul   ebp,DWORD PTR [esi+0x70],0x2f007475
     3fd:	68 6f 6d 65 2f       	push   0x2f656d6f
     402:	79 6f                	jns    473 <sysEnter_Vector-0x12fb8d>
     404:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     40b:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     40e:	73 73                	jae    483 <sysEnter_Vector-0x12fb7d>
     410:	2f                   	das    
     411:	6c                   	ins    BYTE PTR es:[edi],dx
     412:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     419:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     41f:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     425:	78 2d                	js     454 <sysEnter_Vector-0x12fbac>
     427:	67 6e                	outs   dx,BYTE PTR ds:[si]
     429:	75 2f                	jne    45a <sysEnter_Vector-0x12fba6>
     42b:	35 2e 33 2e 30       	xor    eax,0x302e332e
     430:	2f                   	das    
     431:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     438:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     43b:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     43f:	65 00 2e             	add    BYTE PTR gs:[esi],ch
     442:	2e                   	cs
     443:	2f                   	das    
     444:	2e                   	cs
     445:	2e                   	cs
     446:	2f                   	das    
     447:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
     44b:	6a 2f                	push   0x2f
     44d:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
     450:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
     457:	6e                   	outs   dx,BYTE PTR ds:[esi]
     458:	65                   	gs
     459:	6c                   	ins    BYTE PTR es:[edi],dx
     45a:	2f                   	das    
     45b:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     462:	00 00                	add    BYTE PTR [eax],al
     464:	69 6e 70 75 74 2e 63 	imul   ebp,DWORD PTR [esi+0x70],0x632e7475
     46b:	00 01                	add    BYTE PTR [ecx],al
     46d:	00 00                	add    BYTE PTR [eax],al
     46f:	73 74                	jae    4e5 <sysEnter_Vector-0x12fb1b>
     471:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     478:	63 
     479:	2e                   	cs
     47a:	68 00 02 00 00       	push   0x200
     47f:	74 69                	je     4ea <sysEnter_Vector-0x12fb16>
     481:	6d                   	ins    DWORD PTR es:[edi],dx
     482:	65                   	gs
     483:	2e                   	cs
     484:	68 00 03 00 00       	push   0x300
     489:	6d                   	ins    DWORD PTR es:[edi],dx
     48a:	61                   	popa   
     48b:	6c                   	ins    BYTE PTR es:[edi],dx
     48c:	6c                   	ins    BYTE PTR es:[edi],dx
     48d:	6f                   	outs   dx,DWORD PTR ds:[esi]
     48e:	63 2e                	arpl   WORD PTR [esi],bp
     490:	68 00 03 00 00       	push   0x300
     495:	6c                   	ins    BYTE PTR es:[edi],dx
     496:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     49d:	4f                   	dec    edi
     49e:	53                   	push   ebx
     49f:	2e                   	cs
     4a0:	68 00 03 00 00       	push   0x300
     4a5:	73 79                	jae    520 <sysEnter_Vector-0x12fae0>
     4a7:	73 63                	jae    50c <sysEnter_Vector-0x12faf4>
     4a9:	61                   	popa   
     4aa:	6c                   	ins    BYTE PTR es:[edi],dx
     4ab:	6c                   	ins    BYTE PTR es:[edi],dx
     4ac:	73 2e                	jae    4dc <sysEnter_Vector-0x12fb24>
     4ae:	68 00 04 00 00       	push   0x400
     4b3:	00 00                	add    BYTE PTR [eax],al
     4b5:	05 02 44 03 00       	add    eax,0x34402
     4ba:	30 03                	xor    BYTE PTR [ebx],al
     4bc:	0f 01                	(bad)  
     4be:	d7                   	xlat   BYTE PTR ds:[ebx]
     4bf:	08 3d 4d 08 67 68    	or     BYTE PTR ds:0x6867084d,bh
     4c5:	75 4b                	jne    512 <sysEnter_Vector-0x12faee>
     4c7:	08 3d 77 08 14 08    	or     BYTE PTR ds:0x8140877,bh
     4cd:	3d 4b 6a 08 14       	cmp    eax,0x14086a4b
     4d2:	75 84                	jne    458 <sysEnter_Vector-0x12fba8>
     4d4:	68 00 02 04 01       	push   0x1040200
     4d9:	08 67 33             	or     BYTE PTR [edi+0x33],ah
     4dc:	08 3d 00 02 04 01    	or     BYTE PTR ds:0x1040200,bh
     4e2:	06                   	push   es
     4e3:	66 06                	pushw  es
     4e5:	68 ad 68 68 76       	push   0x766868ad
     4ea:	08 5a 00             	or     BYTE PTR [edx+0x0],bl
     4ed:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     4f0:	06                   	push   es
     4f1:	ac                   	lods   al,BYTE PTR ds:[esi]
     4f2:	06                   	push   es
     4f3:	68 5b 00 02 04       	push   0x402005b
     4f8:	02 a0 2f 02 05 00    	add    ah,BYTE PTR [eax+0x5022f]
     4fe:	01 01                	add    DWORD PTR [ecx],eax
     500:	63 01                	arpl   WORD PTR [ecx],ax
     502:	00 00                	add    BYTE PTR [eax],al
     504:	02 00                	add    al,BYTE PTR [eax]
     506:	ea 00 00 00 01 01 fb 	jmp    0xfb01:0x1000000
     50d:	0e                   	push   cs
     50e:	0d 00 01 01 01       	or     eax,0x1010100
     513:	01 00                	add    DWORD PTR [eax],eax
     515:	00 00                	add    BYTE PTR [eax],al
     517:	01 00                	add    DWORD PTR [eax],eax
     519:	00 01                	add    BYTE PTR [ecx],al
     51b:	73 72                	jae    58f <sysEnter_Vector-0x12fa71>
     51d:	63 00                	arpl   WORD PTR [eax],ax
     51f:	2f                   	das    
     520:	68 6f 6d 65 2f       	push   0x2f656d6f
     525:	79 6f                	jns    596 <sysEnter_Vector-0x12fa6a>
     527:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     52e:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     531:	73 73                	jae    5a6 <sysEnter_Vector-0x12fa5a>
     533:	2f                   	das    
     534:	6c                   	ins    BYTE PTR es:[edi],dx
     535:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     53c:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     542:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     548:	78 2d                	js     577 <sysEnter_Vector-0x12fa89>
     54a:	67 6e                	outs   dx,BYTE PTR ds:[si]
     54c:	75 2f                	jne    57d <sysEnter_Vector-0x12fa83>
     54e:	35 2e 33 2e 30       	xor    eax,0x302e332e
     553:	2f                   	das    
     554:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     55b:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     55e:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     562:	65 00 2e             	add    BYTE PTR gs:[esi],ch
     565:	2e                   	cs
     566:	2f                   	das    
     567:	2e                   	cs
     568:	2e                   	cs
     569:	2f                   	das    
     56a:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
     56e:	6a 2f                	push   0x2f
     570:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
     573:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
     57a:	6e                   	outs   dx,BYTE PTR ds:[esi]
     57b:	65                   	gs
     57c:	6c                   	ins    BYTE PTR es:[edi],dx
     57d:	2f                   	das    
     57e:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     585:	00 00                	add    BYTE PTR [eax],al
     587:	6c                   	ins    BYTE PTR es:[edi],dx
     588:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     58f:	4f                   	dec    edi
     590:	53                   	push   ebx
     591:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     594:	01 00                	add    DWORD PTR [eax],eax
     596:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     599:	64                   	fs
     59a:	61                   	popa   
     59b:	72 67                	jb     604 <sysEnter_Vector-0x12f9fc>
     59d:	2e                   	cs
     59e:	68 00 02 00 00       	push   0x200
     5a3:	73 74                	jae    619 <sysEnter_Vector-0x12f9e7>
     5a5:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     5ac:	63 
     5ad:	2e                   	cs
     5ae:	68 00 02 00 00       	push   0x200
     5b3:	73 74                	jae    629 <sysEnter_Vector-0x12f9d7>
     5b5:	64                   	fs
     5b6:	64                   	fs
     5b7:	65                   	gs
     5b8:	66                   	data16
     5b9:	2e                   	cs
     5ba:	68 00 02 00 00       	push   0x200
     5bf:	74 69                	je     62a <sysEnter_Vector-0x12f9d6>
     5c1:	6d                   	ins    DWORD PTR es:[edi],dx
     5c2:	65                   	gs
     5c3:	2e                   	cs
     5c4:	68 00 03 00 00       	push   0x300
     5c9:	6d                   	ins    DWORD PTR es:[edi],dx
     5ca:	61                   	popa   
     5cb:	6c                   	ins    BYTE PTR es:[edi],dx
     5cc:	6c                   	ins    BYTE PTR es:[edi],dx
     5cd:	6f                   	outs   dx,DWORD PTR ds:[esi]
     5ce:	63 2e                	arpl   WORD PTR [esi],bp
     5d0:	68 00 03 00 00       	push   0x300
     5d5:	6c                   	ins    BYTE PTR es:[edi],dx
     5d6:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     5dd:	4f                   	dec    edi
     5de:	53                   	push   ebx
     5df:	2e                   	cs
     5e0:	68 00 03 00 00       	push   0x300
     5e5:	73 79                	jae    660 <sysEnter_Vector-0x12f9a0>
     5e7:	73 63                	jae    64c <sysEnter_Vector-0x12f9b4>
     5e9:	61                   	popa   
     5ea:	6c                   	ins    BYTE PTR es:[edi],dx
     5eb:	6c                   	ins    BYTE PTR es:[edi],dx
     5ec:	73 2e                	jae    61c <sysEnter_Vector-0x12f9e4>
     5ee:	68 00 04 00 00       	push   0x400
     5f3:	00 00                	add    BYTE PTR [eax],al
     5f5:	05 02 98 04 00       	add    eax,0x49802
     5fa:	30 03                	xor    BYTE PTR [ebx],al
     5fc:	0f 01 08             	sidtd  [eax]
     5ff:	13 75 08             	adc    esi,DWORD PTR [ebp+0x8]
     602:	3d 3d 69 08 13       	cmp    eax,0x1308693d
     607:	75 08                	jne    611 <sysEnter_Vector-0x12f9ef>
     609:	2f                   	das    
     60a:	3d 69 08 13 75       	cmp    eax,0x75130869
     60f:	f3 3d 69 f3 75 ad    	repz cmp eax,0xad75f369
     615:	3d 31 08 21 08       	cmp    eax,0x8210831
     61a:	67 d8 59 bb          	fcomp  DWORD PTR [bx+di-0x45]
     61e:	c9                   	leave  
     61f:	08 67 75             	or     BYTE PTR [edi+0x75],ah
     622:	08 6a 2d             	or     BYTE PTR [edx+0x2d],ch
     625:	08 21                	or     BYTE PTR [ecx],ah
     627:	69 08 13 75 77 f4    	imul   ecx,DWORD PTR [eax],0xf4777513
     62d:	67 08 67 59          	or     BYTE PTR [bx+0x59],ah
     631:	31 f4                	xor    esp,esi
     633:	67 08 67 59          	or     BYTE PTR [bx+0x59],ah
     637:	31 08                	xor    DWORD PTR [eax],ecx
     639:	14 67                	adc    al,0x67
     63b:	08 4b 59             	or     BYTE PTR [ebx+0x59],cl
     63e:	69 08 13 02 32 13    	imul   ecx,DWORD PTR [eax],0x13320213
     644:	59                   	pop    ecx
     645:	69 c9 c9 3f c9 08    	imul   ecx,ecx,0x8c93fc9
     64b:	83 3f 08             	cmp    DWORD PTR [edi],0x8
     64e:	13 77 08             	adc    esi,DWORD PTR [edi+0x8]
     651:	4d                   	dec    ebp
     652:	3d 69 c9 c9 3f       	cmp    eax,0x3fc9c969
     657:	08 21                	or     BYTE PTR [ecx],ah
     659:	76 08                	jbe    663 <sysEnter_Vector-0x12f99d>
     65b:	13 08                	adc    ecx,DWORD PTR [eax]
     65d:	2f                   	das    
     65e:	5b                   	pop    ebx
     65f:	c9                   	leave  
     660:	08 13                	or     BYTE PTR [ebx],dl
     662:	02 02                	add    al,BYTE PTR [edx]
     664:	00 01                	add    BYTE PTR [ecx],al
     666:	01 19                	add    DWORD PTR [ecx],ebx
     668:	01 00                	add    DWORD PTR [eax],eax
     66a:	00 02                	add    BYTE PTR [edx],al
     66c:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     672:	01 fb                	add    ebx,edi
     674:	0e                   	push   cs
     675:	0d 00 01 01 01       	or     eax,0x1010100
     67a:	01 00                	add    DWORD PTR [eax],eax
     67c:	00 00                	add    BYTE PTR [eax],al
     67e:	01 00                	add    DWORD PTR [eax],eax
     680:	00 01                	add    BYTE PTR [ecx],al
     682:	73 72                	jae    6f6 <sysEnter_Vector-0x12f90a>
     684:	63 00                	arpl   WORD PTR [eax],ax
     686:	2f                   	das    
     687:	68 6f 6d 65 2f       	push   0x2f656d6f
     68c:	79 6f                	jns    6fd <sysEnter_Vector-0x12f903>
     68e:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     695:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     698:	73 73                	jae    70d <sysEnter_Vector-0x12f8f3>
     69a:	2f                   	das    
     69b:	6c                   	ins    BYTE PTR es:[edi],dx
     69c:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     6a3:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     6a9:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     6af:	78 2d                	js     6de <sysEnter_Vector-0x12f922>
     6b1:	67 6e                	outs   dx,BYTE PTR ds:[si]
     6b3:	75 2f                	jne    6e4 <sysEnter_Vector-0x12f91c>
     6b5:	35 2e 33 2e 30       	xor    eax,0x302e332e
     6ba:	2f                   	das    
     6bb:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     6c2:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     6c5:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     6c9:	65 00 00             	add    BYTE PTR gs:[eax],al
     6cc:	6d                   	ins    DWORD PTR es:[edi],dx
     6cd:	61                   	popa   
     6ce:	6c                   	ins    BYTE PTR es:[edi],dx
     6cf:	6c                   	ins    BYTE PTR es:[edi],dx
     6d0:	6f                   	outs   dx,DWORD PTR ds:[esi]
     6d1:	63 2e                	arpl   WORD PTR [esi],bp
     6d3:	63 00                	arpl   WORD PTR [eax],ax
     6d5:	01 00                	add    DWORD PTR [eax],eax
     6d7:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     6da:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     6e1:	63 
     6e2:	2e                   	cs
     6e3:	68 00 02 00 00       	push   0x200
     6e8:	73 74                	jae    75e <sysEnter_Vector-0x12f8a2>
     6ea:	64                   	fs
     6eb:	64                   	fs
     6ec:	65                   	gs
     6ed:	66                   	data16
     6ee:	2e                   	cs
     6ef:	68 00 02 00 00       	push   0x200
     6f4:	6d                   	ins    DWORD PTR es:[edi],dx
     6f5:	61                   	popa   
     6f6:	6c                   	ins    BYTE PTR es:[edi],dx
     6f7:	6c                   	ins    BYTE PTR es:[edi],dx
     6f8:	6f                   	outs   dx,DWORD PTR ds:[esi]
     6f9:	63 2e                	arpl   WORD PTR [esi],bp
     6fb:	68 00 03 00 00       	push   0x300
     700:	74 69                	je     76b <sysEnter_Vector-0x12f895>
     702:	6d                   	ins    DWORD PTR es:[edi],dx
     703:	65                   	gs
     704:	2e                   	cs
     705:	68 00 03 00 00       	push   0x300
     70a:	6c                   	ins    BYTE PTR es:[edi],dx
     70b:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     712:	4f                   	dec    edi
     713:	53                   	push   ebx
     714:	2e                   	cs
     715:	68 00 03 00 00       	push   0x300
     71a:	00 00                	add    BYTE PTR [eax],al
     71c:	05 02 04 08 00       	add    eax,0x80402
     721:	30 03                	xor    BYTE PTR [ebx],al
     723:	0c 01                	or     al,0x1
     725:	08 21                	or     BYTE PTR [ecx],ah
     727:	08 e5                	or     ch,ah
     729:	bb bb bb 69 f5       	mov    ebx,0xf569bbbb
     72e:	92                   	xchg   edx,eax
     72f:	08 85 08 67 00 02    	or     BYTE PTR [ebp+0x2006708],al
     735:	04 01                	add    al,0x1
     737:	06                   	push   es
     738:	66 06                	pushw  es
     73a:	bc f5 91 76 5b       	mov    esp,0x5b7691f5
     73f:	59                   	pop    ecx
     740:	31 08                	xor    DWORD PTR [eax],ecx
     742:	35 08 ad 08 13       	xor    eax,0x1308ad08
     747:	08 ad a0 08 22 02    	or     BYTE PTR [ebp+0x22208a0],ch
     74d:	22 13                	and    dl,BYTE PTR [ebx]
     74f:	f3 02 28             	repz add ch,BYTE PTR [eax]
     752:	13 bc ad ad 02 22 15 	adc    edi,DWORD PTR [ebp+ebp*4+0x152202ad]
     759:	02 22                	add    ah,BYTE PTR [edx]
     75b:	13 ad 91 91 75 08    	adc    ebp,DWORD PTR [ebp+0x8759191]
     761:	f3 d7                	repz xlat BYTE PTR ds:[ebx]
     763:	08 13                	or     BYTE PTR [ebx],dl
     765:	91                   	xchg   ecx,eax
     766:	08 75 08             	or     BYTE PTR [ebp+0x8],dh
     769:	ad                   	lods   eax,DWORD PTR ds:[esi]
     76a:	3d 77 f5 68 93       	cmp    eax,0x9368f577
     76f:	00 02                	add    BYTE PTR [edx],al
     771:	04 02                	add    al,0x2
     773:	be 30 03 76 90       	mov    esi,0x90760330
     778:	03 0b                	add    ecx,DWORD PTR [ebx]
     77a:	20 31                	and    BYTE PTR [ecx],dh
     77c:	d7                   	xlat   BYTE PTR ds:[ebx]
     77d:	08 3d 02 04 00 01    	or     BYTE PTR ds:0x1000402,bh
     783:	01 ed                	add    ebp,ebp
     785:	00 00                	add    BYTE PTR [eax],al
     787:	00 02                	add    BYTE PTR [edx],al
     789:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     78f:	01 fb                	add    ebx,edi
     791:	0e                   	push   cs
     792:	0d 00 01 01 01       	or     eax,0x1010100
     797:	01 00                	add    DWORD PTR [eax],eax
     799:	00 00                	add    BYTE PTR [eax],al
     79b:	01 00                	add    DWORD PTR [eax],eax
     79d:	00 01                	add    BYTE PTR [ecx],al
     79f:	73 72                	jae    813 <sysEnter_Vector-0x12f7ed>
     7a1:	63 00                	arpl   WORD PTR [eax],ax
     7a3:	2f                   	das    
     7a4:	68 6f 6d 65 2f       	push   0x2f656d6f
     7a9:	79 6f                	jns    81a <sysEnter_Vector-0x12f7e6>
     7ab:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     7b2:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     7b5:	73 73                	jae    82a <sysEnter_Vector-0x12f7d6>
     7b7:	2f                   	das    
     7b8:	6c                   	ins    BYTE PTR es:[edi],dx
     7b9:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     7c0:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     7c6:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     7cc:	78 2d                	js     7fb <sysEnter_Vector-0x12f805>
     7ce:	67 6e                	outs   dx,BYTE PTR ds:[si]
     7d0:	75 2f                	jne    801 <sysEnter_Vector-0x12f7ff>
     7d2:	35 2e 33 2e 30       	xor    eax,0x302e332e
     7d7:	2f                   	das    
     7d8:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     7df:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     7e2:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     7e6:	65 00 00             	add    BYTE PTR gs:[eax],al
     7e9:	6d                   	ins    DWORD PTR es:[edi],dx
     7ea:	65                   	gs
     7eb:	6d                   	ins    DWORD PTR es:[edi],dx
     7ec:	63 70 79             	arpl   WORD PTR [eax+0x79],si
     7ef:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     7f2:	01 00                	add    DWORD PTR [eax],eax
     7f4:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     7f7:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     7fe:	63 
     7ff:	2e                   	cs
     800:	68 00 02 00 00       	push   0x200
     805:	74 69                	je     870 <sysEnter_Vector-0x12f790>
     807:	6d                   	ins    DWORD PTR es:[edi],dx
     808:	65                   	gs
     809:	2e                   	cs
     80a:	68 00 03 00 00       	push   0x300
     80f:	73 74                	jae    885 <sysEnter_Vector-0x12f77b>
     811:	64                   	fs
     812:	64                   	fs
     813:	65                   	gs
     814:	66                   	data16
     815:	2e                   	cs
     816:	68 00 02 00 00       	push   0x200
     81b:	6d                   	ins    DWORD PTR es:[edi],dx
     81c:	61                   	popa   
     81d:	6c                   	ins    BYTE PTR es:[edi],dx
     81e:	6c                   	ins    BYTE PTR es:[edi],dx
     81f:	6f                   	outs   dx,DWORD PTR ds:[esi]
     820:	63 2e                	arpl   WORD PTR [esi],bp
     822:	68 00 03 00 00       	push   0x300
     827:	6c                   	ins    BYTE PTR es:[edi],dx
     828:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     82f:	4f                   	dec    edi
     830:	53                   	push   ebx
     831:	2e                   	cs
     832:	68 00 03 00 00       	push   0x300
     837:	00 00                	add    BYTE PTR [eax],al
     839:	05 02 2c 0b 00       	add    eax,0xb2c02
     83e:	30 03                	xor    BYTE PTR [ebx],al
     840:	0a 01                	or     al,BYTE PTR [ecx]
     842:	f5                   	cmc    
     843:	d7                   	xlat   BYTE PTR ds:[ebx]
     844:	d7                   	xlat   BYTE PTR ds:[ebx]
     845:	68 91 67 68 83       	push   0x83686791
     84a:	91                   	xchg   ecx,eax
     84b:	91                   	xchg   ecx,eax
     84c:	2f                   	das    
     84d:	08 1f                	or     BYTE PTR [edi],bl
     84f:	e8 08 57 ca 84       	call   84ca5f5c <ticksToWait+0x54ca24c0>
     854:	68 83 67 68 83       	push   0x83686783
     859:	91                   	xchg   ecx,eax
     85a:	91                   	xchg   ecx,eax
     85b:	2f                   	das    
     85c:	08 1f                	or     BYTE PTR [edi],bl
     85e:	e8 08 57 ca 5c       	call   5cca5f6b <ticksToWait+0x2cca24cf>
     863:	67 68 83 67 67 2f    	addr16 push 0x2f676783
     869:	08 2d e8 08 65 ca    	or     BYTE PTR ds:0xca6508e8,ch
     86f:	3e 02 02             	add    al,BYTE PTR ds:[edx]
     872:	00 01                	add    BYTE PTR [ecx],al
     874:	01 e4                	add    esp,esp
     876:	00 00                	add    BYTE PTR [eax],al
     878:	00 02                	add    BYTE PTR [edx],al
     87a:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     880:	01 fb                	add    ebx,edi
     882:	0e                   	push   cs
     883:	0d 00 01 01 01       	or     eax,0x1010100
     888:	01 00                	add    DWORD PTR [eax],eax
     88a:	00 00                	add    BYTE PTR [eax],al
     88c:	01 00                	add    DWORD PTR [eax],eax
     88e:	00 01                	add    BYTE PTR [ecx],al
     890:	73 72                	jae    904 <sysEnter_Vector-0x12f6fc>
     892:	63 00                	arpl   WORD PTR [eax],ax
     894:	2f                   	das    
     895:	68 6f 6d 65 2f       	push   0x2f656d6f
     89a:	79 6f                	jns    90b <sysEnter_Vector-0x12f6f5>
     89c:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     8a3:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     8a6:	73 73                	jae    91b <sysEnter_Vector-0x12f6e5>
     8a8:	2f                   	das    
     8a9:	6c                   	ins    BYTE PTR es:[edi],dx
     8aa:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     8b1:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     8b7:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     8bd:	78 2d                	js     8ec <sysEnter_Vector-0x12f714>
     8bf:	67 6e                	outs   dx,BYTE PTR ds:[si]
     8c1:	75 2f                	jne    8f2 <sysEnter_Vector-0x12f70e>
     8c3:	35 2e 33 2e 30       	xor    eax,0x302e332e
     8c8:	2f                   	das    
     8c9:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     8d0:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     8d3:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     8d7:	65 00 00             	add    BYTE PTR gs:[eax],al
     8da:	6d                   	ins    DWORD PTR es:[edi],dx
     8db:	65                   	gs
     8dc:	6d                   	ins    DWORD PTR es:[edi],dx
     8dd:	73 65                	jae    944 <sysEnter_Vector-0x12f6bc>
     8df:	74 2e                	je     90f <sysEnter_Vector-0x12f6f1>
     8e1:	63 00                	arpl   WORD PTR [eax],ax
     8e3:	01 00                	add    DWORD PTR [eax],eax
     8e5:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     8e8:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     8ef:	63 
     8f0:	2e                   	cs
     8f1:	68 00 02 00 00       	push   0x200
     8f6:	73 74                	jae    96c <sysEnter_Vector-0x12f694>
     8f8:	64                   	fs
     8f9:	64                   	fs
     8fa:	65                   	gs
     8fb:	66                   	data16
     8fc:	2e                   	cs
     8fd:	68 00 02 00 00       	push   0x200
     902:	74 69                	je     96d <sysEnter_Vector-0x12f693>
     904:	6d                   	ins    DWORD PTR es:[edi],dx
     905:	65                   	gs
     906:	2e                   	cs
     907:	68 00 03 00 00       	push   0x300
     90c:	6d                   	ins    DWORD PTR es:[edi],dx
     90d:	61                   	popa   
     90e:	6c                   	ins    BYTE PTR es:[edi],dx
     90f:	6c                   	ins    BYTE PTR es:[edi],dx
     910:	6f                   	outs   dx,DWORD PTR ds:[esi]
     911:	63 2e                	arpl   WORD PTR [esi],bp
     913:	68 00 03 00 00       	push   0x300
     918:	6c                   	ins    BYTE PTR es:[edi],dx
     919:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     920:	4f                   	dec    edi
     921:	53                   	push   ebx
     922:	2e                   	cs
     923:	68 00 03 00 00       	push   0x300
     928:	00 00                	add    BYTE PTR [eax],al
     92a:	05 02 c8 0c 00       	add    eax,0xcc802
     92f:	30 1a                	xor    BYTE PTR [edx],bl
     931:	f3 67 67 08 83 67 08 	repz addr32 or BYTE PTR [bp+di+0x867],al
     938:	ca 9f 2f             	retf   0x2f9f
     93b:	d5 bd                	aad    0xbd
     93d:	9f                   	lahf   
     93e:	2f                   	das    
     93f:	f1                   	icebp  
     940:	bf d5 cb 3d 31       	mov    edi,0x313dcbd5
     945:	f3 67 67 08 83 67 08 	repz addr32 or BYTE PTR [bp+di+0x867],al
     94c:	ca 9f 2f             	retf   0x2f9f
     94f:	d5 bd                	aad    0xbd
     951:	9f                   	lahf   
     952:	2f                   	das    
     953:	f1                   	icebp  
     954:	bf d5 cb 3d 02       	mov    edi,0x23dcbd5
     959:	02 00                	add    al,BYTE PTR [eax]
     95b:	01 01                	add    DWORD PTR [ecx],eax
     95d:	c9                   	leave  
     95e:	00 00                	add    BYTE PTR [eax],al
     960:	00 02                	add    BYTE PTR [edx],al
     962:	00 b3 00 00 00 01    	add    BYTE PTR [ebx+0x1000000],dh
     968:	01 fb                	add    ebx,edi
     96a:	0e                   	push   cs
     96b:	0d 00 01 01 01       	or     eax,0x1010100
     970:	01 00                	add    DWORD PTR [eax],eax
     972:	00 00                	add    BYTE PTR [eax],al
     974:	01 00                	add    DWORD PTR [eax],eax
     976:	00 01                	add    BYTE PTR [ecx],al
     978:	73 72                	jae    9ec <sysEnter_Vector-0x12f614>
     97a:	63 00                	arpl   WORD PTR [eax],ax
     97c:	2f                   	das    
     97d:	68 6f 6d 65 2f       	push   0x2f656d6f
     982:	79 6f                	jns    9f3 <sysEnter_Vector-0x12f60d>
     984:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     98b:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     98e:	73 73                	jae    a03 <sysEnter_Vector-0x12f5fd>
     990:	2f                   	das    
     991:	6c                   	ins    BYTE PTR es:[edi],dx
     992:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     999:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     99f:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     9a5:	78 2d                	js     9d4 <sysEnter_Vector-0x12f62c>
     9a7:	67 6e                	outs   dx,BYTE PTR ds:[si]
     9a9:	75 2f                	jne    9da <sysEnter_Vector-0x12f626>
     9ab:	35 2e 33 2e 30       	xor    eax,0x302e332e
     9b0:	2f                   	das    
     9b1:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     9b8:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     9bb:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     9bf:	65 00 00             	add    BYTE PTR gs:[eax],al
     9c2:	6d                   	ins    DWORD PTR es:[edi],dx
     9c3:	6d                   	ins    DWORD PTR es:[edi],dx
     9c4:	61                   	popa   
     9c5:	70 2e                	jo     9f5 <sysEnter_Vector-0x12f60b>
     9c7:	63 00                	arpl   WORD PTR [eax],ax
     9c9:	01 00                	add    DWORD PTR [eax],eax
     9cb:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     9ce:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     9d5:	63 
     9d6:	2e                   	cs
     9d7:	68 00 02 00 00       	push   0x200
     9dc:	73 74                	jae    a52 <sysEnter_Vector-0x12f5ae>
     9de:	64                   	fs
     9df:	64                   	fs
     9e0:	65                   	gs
     9e1:	66                   	data16
     9e2:	2e                   	cs
     9e3:	68 00 02 00 00       	push   0x200
     9e8:	74 69                	je     a53 <sysEnter_Vector-0x12f5ad>
     9ea:	6d                   	ins    DWORD PTR es:[edi],dx
     9eb:	65                   	gs
     9ec:	2e                   	cs
     9ed:	68 00 03 00 00       	push   0x300
     9f2:	74 79                	je     a6d <sysEnter_Vector-0x12f593>
     9f4:	70 65                	jo     a5b <sysEnter_Vector-0x12f5a5>
     9f6:	73 2e                	jae    a26 <sysEnter_Vector-0x12f5da>
     9f8:	68 00 03 00 00       	push   0x300
     9fd:	6d                   	ins    DWORD PTR es:[edi],dx
     9fe:	61                   	popa   
     9ff:	6c                   	ins    BYTE PTR es:[edi],dx
     a00:	6c                   	ins    BYTE PTR es:[edi],dx
     a01:	6f                   	outs   dx,DWORD PTR ds:[esi]
     a02:	63 2e                	arpl   WORD PTR [esi],bp
     a04:	68 00 03 00 00       	push   0x300
     a09:	6c                   	ins    BYTE PTR es:[edi],dx
     a0a:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     a11:	4f                   	dec    edi
     a12:	53                   	push   ebx
     a13:	2e                   	cs
     a14:	68 00 03 00 00       	push   0x300
     a19:	00 00                	add    BYTE PTR [eax],al
     a1b:	05 02 58 0e 00       	add    eax,0xe5802
     a20:	30 03                	xor    BYTE PTR [ebx],al
     a22:	09 01                	or     DWORD PTR [ecx],eax
     a24:	ca 02 03             	retf   0x302
     a27:	00 01                	add    BYTE PTR [ecx],al
     a29:	01 4f 01             	add    DWORD PTR [edi+0x1],ecx
     a2c:	00 00                	add    BYTE PTR [eax],al
     a2e:	02 00                	add    al,BYTE PTR [eax]
     a30:	e2 00                	loop   a32 <sysEnter_Vector-0x12f5ce>
     a32:	00 00                	add    BYTE PTR [eax],al
     a34:	01 01                	add    DWORD PTR [ecx],eax
     a36:	fb                   	sti    
     a37:	0e                   	push   cs
     a38:	0d 00 01 01 01       	or     eax,0x1010100
     a3d:	01 00                	add    DWORD PTR [eax],eax
     a3f:	00 00                	add    BYTE PTR [eax],al
     a41:	01 00                	add    DWORD PTR [eax],eax
     a43:	00 01                	add    BYTE PTR [ecx],al
     a45:	73 72                	jae    ab9 <sysEnter_Vector-0x12f547>
     a47:	63 00                	arpl   WORD PTR [eax],ax
     a49:	2f                   	das    
     a4a:	68 6f 6d 65 2f       	push   0x2f656d6f
     a4f:	79 6f                	jns    ac0 <sysEnter_Vector-0x12f540>
     a51:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     a58:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     a5b:	73 73                	jae    ad0 <sysEnter_Vector-0x12f530>
     a5d:	2f                   	das    
     a5e:	6c                   	ins    BYTE PTR es:[edi],dx
     a5f:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     a66:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     a6c:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     a72:	78 2d                	js     aa1 <sysEnter_Vector-0x12f55f>
     a74:	67 6e                	outs   dx,BYTE PTR ds:[si]
     a76:	75 2f                	jne    aa7 <sysEnter_Vector-0x12f559>
     a78:	35 2e 33 2e 30       	xor    eax,0x302e332e
     a7d:	2f                   	das    
     a7e:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     a85:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     a88:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     a8c:	65 00 2e             	add    BYTE PTR gs:[esi],ch
     a8f:	2e                   	cs
     a90:	2f                   	das    
     a91:	2e                   	cs
     a92:	2e                   	cs
     a93:	2f                   	das    
     a94:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
     a98:	6a 2f                	push   0x2f
     a9a:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
     a9d:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
     aa4:	6e                   	outs   dx,BYTE PTR ds:[esi]
     aa5:	65                   	gs
     aa6:	6c                   	ins    BYTE PTR es:[edi],dx
     aa7:	2f                   	das    
     aa8:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     aaf:	00 00                	add    BYTE PTR [eax],al
     ab1:	73 74                	jae    b27 <sysEnter_Vector-0x12f4d9>
     ab3:	64 69 6f 2e 63 00 01 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x10063
     aba:	00 
     abb:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     abe:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     ac5:	63 
     ac6:	2e                   	cs
     ac7:	68 00 02 00 00       	push   0x200
     acc:	73 74                	jae    b42 <sysEnter_Vector-0x12f4be>
     ace:	64                   	fs
     acf:	64                   	fs
     ad0:	65                   	gs
     ad1:	66                   	data16
     ad2:	2e                   	cs
     ad3:	68 00 02 00 00       	push   0x200
     ad8:	74 69                	je     b43 <sysEnter_Vector-0x12f4bd>
     ada:	6d                   	ins    DWORD PTR es:[edi],dx
     adb:	65                   	gs
     adc:	2e                   	cs
     add:	68 00 03 00 00       	push   0x300
     ae2:	64                   	fs
     ae3:	6c                   	ins    BYTE PTR es:[edi],dx
     ae4:	6c                   	ins    BYTE PTR es:[edi],dx
     ae5:	69 73 74 2e 68 00 04 	imul   esi,DWORD PTR [ebx+0x74],0x400682e
     aec:	00 00                	add    BYTE PTR [eax],al
     aee:	73 74                	jae    b64 <sysEnter_Vector-0x12f49c>
     af0:	64 69 6f 2e 68 00 03 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x30068
     af7:	00 
     af8:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
     afb:	6c                   	ins    BYTE PTR es:[edi],dx
     afc:	6c                   	ins    BYTE PTR es:[edi],dx
     afd:	6f                   	outs   dx,DWORD PTR ds:[esi]
     afe:	63 2e                	arpl   WORD PTR [esi],bp
     b00:	68 00 03 00 00       	push   0x300
     b05:	6c                   	ins    BYTE PTR es:[edi],dx
     b06:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     b0d:	4f                   	dec    edi
     b0e:	53                   	push   ebx
     b0f:	2e                   	cs
     b10:	68 00 03 00 00       	push   0x300
     b15:	00 00                	add    BYTE PTR [eax],al
     b17:	05 02 68 0e 00       	add    eax,0xe6802
     b1c:	30 03                	xor    BYTE PTR [ebx],al
     b1e:	12 01                	adc    al,BYTE PTR [ecx]
     b20:	08 13                	or     BYTE PTR [ebx],dl
     b22:	08 59 5b             	or     BYTE PTR [ecx+0x5b],bl
     b25:	08 13                	or     BYTE PTR [ebx],dl
     b27:	f3 5b                	repz pop ebx
     b29:	08 23                	or     BYTE PTR [ebx],ah
     b2b:	77 08                	ja     b35 <sysEnter_Vector-0x12f4cb>
     b2d:	30 08                	xor    BYTE PTR [eax],cl
     b2f:	21 08                	and    DWORD PTR [eax],ecx
     b31:	23 d7                	and    edx,edi
     b33:	d9 91 e5 08 72 00    	fst    DWORD PTR [ecx+0x7208e5]
     b39:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     b3c:	06                   	push   es
     b3d:	4a                   	dec    edx
     b3e:	06                   	push   es
     b3f:	86 21                	xchg   BYTE PTR [ecx],ah
     b41:	d7                   	xlat   BYTE PTR ds:[ebx]
     b42:	91                   	xchg   ecx,eax
     b43:	e5 08                	in     eax,0x8
     b45:	72 00                	jb     b47 <sysEnter_Vector-0x12f4b9>
     b47:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     b4a:	06                   	push   es
     b4b:	4a                   	dec    edx
     b4c:	06                   	push   es
     b4d:	86 21                	xchg   BYTE PTR [ecx],ah
     b4f:	d7                   	xlat   BYTE PTR ds:[ebx]
     b50:	00 02                	add    BYTE PTR [edx],al
     b52:	04 03                	add    al,0x3
     b54:	83 00 02             	add    DWORD PTR [eax],0x2
     b57:	04 03                	add    al,0x3
     b59:	d5 00                	aad    0x0
     b5b:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     b5e:	06                   	push   es
     b5f:	4a                   	dec    edx
     b60:	06                   	push   es
     b61:	69 e6 21 5c 08 22    	imul   esp,esi,0x22085c21
     b67:	76 08                	jbe    b71 <sysEnter_Vector-0x12f48f>
     b69:	31 d7                	xor    edi,edx
     b6b:	d7                   	xlat   BYTE PTR ds:[ebx]
     b6c:	d7                   	xlat   BYTE PTR ds:[ebx]
     b6d:	d7                   	xlat   BYTE PTR ds:[ebx]
     b6e:	ad                   	lods   eax,DWORD PTR ds:[esi]
     b6f:	e6 21                	out    0x21,al
     b71:	5b                   	pop    ebx
     b72:	c9                   	leave  
     b73:	e5 d7                	in     eax,0xd7
     b75:	e5 08                	in     eax,0x8
     b77:	67 02 03             	add    al,BYTE PTR [bp+di]
     b7a:	00 01                	add    BYTE PTR [ecx],al
     b7c:	01 d6                	add    esi,edx
     b7e:	00 00                	add    BYTE PTR [eax],al
     b80:	00 02                	add    BYTE PTR [edx],al
     b82:	00 a6 00 00 00 01    	add    BYTE PTR [esi+0x1000000],ah
     b88:	01 fb                	add    ebx,edi
     b8a:	0e                   	push   cs
     b8b:	0d 00 01 01 01       	or     eax,0x1010100
     b90:	01 00                	add    DWORD PTR [eax],eax
     b92:	00 00                	add    BYTE PTR [eax],al
     b94:	01 00                	add    DWORD PTR [eax],eax
     b96:	00 01                	add    BYTE PTR [ecx],al
     b98:	73 72                	jae    c0c <sysEnter_Vector-0x12f3f4>
     b9a:	63 2f                	arpl   WORD PTR [edi],bp
     b9c:	73 74                	jae    c12 <sysEnter_Vector-0x12f3ee>
     b9e:	72 69                	jb     c09 <sysEnter_Vector-0x12f3f7>
     ba0:	6e                   	outs   dx,BYTE PTR ds:[esi]
     ba1:	67 73 00             	addr16 jae ba4 <sysEnter_Vector-0x12f45c>
     ba4:	2f                   	das    
     ba5:	68 6f 6d 65 2f       	push   0x2f656d6f
     baa:	79 6f                	jns    c1b <sysEnter_Vector-0x12f3e5>
     bac:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     bb3:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     bb6:	73 73                	jae    c2b <sysEnter_Vector-0x12f3d5>
     bb8:	2f                   	das    
     bb9:	6c                   	ins    BYTE PTR es:[edi],dx
     bba:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     bc1:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     bc7:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     bcd:	78 2d                	js     bfc <sysEnter_Vector-0x12f404>
     bcf:	67 6e                	outs   dx,BYTE PTR ds:[si]
     bd1:	75 2f                	jne    c02 <sysEnter_Vector-0x12f3fe>
     bd3:	35 2e 33 2e 30       	xor    eax,0x302e332e
     bd8:	2f                   	das    
     bd9:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     be0:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     be3:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     be7:	65 00 00             	add    BYTE PTR gs:[eax],al
     bea:	73 74                	jae    c60 <sysEnter_Vector-0x12f3a0>
     bec:	72 63                	jb     c51 <sysEnter_Vector-0x12f3af>
     bee:	61                   	popa   
     bef:	74 2e                	je     c1f <sysEnter_Vector-0x12f3e1>
     bf1:	63 00                	arpl   WORD PTR [eax],ax
     bf3:	01 00                	add    DWORD PTR [eax],eax
     bf5:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     bf8:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     bff:	63 
     c00:	2e                   	cs
     c01:	68 00 02 00 00       	push   0x200
     c06:	74 69                	je     c71 <sysEnter_Vector-0x12f38f>
     c08:	6d                   	ins    DWORD PTR es:[edi],dx
     c09:	65                   	gs
     c0a:	2e                   	cs
     c0b:	68 00 03 00 00       	push   0x300
     c10:	6d                   	ins    DWORD PTR es:[edi],dx
     c11:	61                   	popa   
     c12:	6c                   	ins    BYTE PTR es:[edi],dx
     c13:	6c                   	ins    BYTE PTR es:[edi],dx
     c14:	6f                   	outs   dx,DWORD PTR ds:[esi]
     c15:	63 2e                	arpl   WORD PTR [esi],bp
     c17:	68 00 03 00 00       	push   0x300
     c1c:	6c                   	ins    BYTE PTR es:[edi],dx
     c1d:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     c24:	4f                   	dec    edi
     c25:	53                   	push   ebx
     c26:	2e                   	cs
     c27:	68 00 03 00 00       	push   0x300
     c2c:	00 00                	add    BYTE PTR [eax],al
     c2e:	05 02 c8 10 00       	add    eax,0x10c802
     c33:	30 03                	xor    BYTE PTR [ebx],al
     c35:	1d 01 08 21 02       	sbb    eax,0x2210801
     c3a:	24 13                	and    al,0x13
     c3c:	3d 5b 08 21 02       	cmp    eax,0x221085b
     c41:	24 13                	and    al,0x13
     c43:	3d 5a f5 76 2f       	cmp    eax,0x2f76f55a
     c48:	49                   	dec    ecx
     c49:	e8 76 2f 08 4b       	call   4b083bc4 <ticksToWait+0x1b080128>
     c4e:	4b                   	dec    ebx
     c4f:	47                   	inc    edi
     c50:	ea ad 02 03 00 01 01 	jmp    0x101:0x302ad
     c57:	c5 00                	lds    eax,FWORD PTR [eax]
     c59:	00 00                	add    BYTE PTR [eax],al
     c5b:	02 00                	add    al,BYTE PTR [eax]
     c5d:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     c5e:	00 00                	add    BYTE PTR [eax],al
     c60:	00 01                	add    BYTE PTR [ecx],al
     c62:	01 fb                	add    ebx,edi
     c64:	0e                   	push   cs
     c65:	0d 00 01 01 01       	or     eax,0x1010100
     c6a:	01 00                	add    DWORD PTR [eax],eax
     c6c:	00 00                	add    BYTE PTR [eax],al
     c6e:	01 00                	add    DWORD PTR [eax],eax
     c70:	00 01                	add    BYTE PTR [ecx],al
     c72:	73 72                	jae    ce6 <sysEnter_Vector-0x12f31a>
     c74:	63 2f                	arpl   WORD PTR [edi],bp
     c76:	73 74                	jae    cec <sysEnter_Vector-0x12f314>
     c78:	72 69                	jb     ce3 <sysEnter_Vector-0x12f31d>
     c7a:	6e                   	outs   dx,BYTE PTR ds:[esi]
     c7b:	67 73 00             	addr16 jae c7e <sysEnter_Vector-0x12f382>
     c7e:	2f                   	das    
     c7f:	68 6f 6d 65 2f       	push   0x2f656d6f
     c84:	79 6f                	jns    cf5 <sysEnter_Vector-0x12f30b>
     c86:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     c8d:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     c90:	73 73                	jae    d05 <sysEnter_Vector-0x12f2fb>
     c92:	2f                   	das    
     c93:	6c                   	ins    BYTE PTR es:[edi],dx
     c94:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     c9b:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     ca1:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     ca7:	78 2d                	js     cd6 <sysEnter_Vector-0x12f32a>
     ca9:	67 6e                	outs   dx,BYTE PTR ds:[si]
     cab:	75 2f                	jne    cdc <sysEnter_Vector-0x12f324>
     cad:	35 2e 33 2e 30       	xor    eax,0x302e332e
     cb2:	2f                   	das    
     cb3:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     cba:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     cbd:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     cc1:	65 00 00             	add    BYTE PTR gs:[eax],al
     cc4:	73 74                	jae    d3a <sysEnter_Vector-0x12f2c6>
     cc6:	72 63                	jb     d2b <sysEnter_Vector-0x12f2d5>
     cc8:	6d                   	ins    DWORD PTR es:[edi],dx
     cc9:	70 2e                	jo     cf9 <sysEnter_Vector-0x12f307>
     ccb:	63 00                	arpl   WORD PTR [eax],ax
     ccd:	01 00                	add    DWORD PTR [eax],eax
     ccf:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     cd2:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     cd9:	63 
     cda:	2e                   	cs
     cdb:	68 00 02 00 00       	push   0x200
     ce0:	74 69                	je     d4b <sysEnter_Vector-0x12f2b5>
     ce2:	6d                   	ins    DWORD PTR es:[edi],dx
     ce3:	65                   	gs
     ce4:	2e                   	cs
     ce5:	68 00 03 00 00       	push   0x300
     cea:	6d                   	ins    DWORD PTR es:[edi],dx
     ceb:	61                   	popa   
     cec:	6c                   	ins    BYTE PTR es:[edi],dx
     ced:	6c                   	ins    BYTE PTR es:[edi],dx
     cee:	6f                   	outs   dx,DWORD PTR ds:[esi]
     cef:	63 2e                	arpl   WORD PTR [esi],bp
     cf1:	68 00 03 00 00       	push   0x300
     cf6:	6c                   	ins    BYTE PTR es:[edi],dx
     cf7:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     cfe:	4f                   	dec    edi
     cff:	53                   	push   ebx
     d00:	2e                   	cs
     d01:	68 00 03 00 00       	push   0x300
     d06:	00 00                	add    BYTE PTR [eax],al
     d08:	05 02 b4 11 00       	add    eax,0x11b402
     d0d:	30 03                	xor    BYTE PTR [ebx],al
     d0f:	18 01                	sbb    BYTE PTR [ecx],al
     d11:	08 21                	or     BYTE PTR [ecx],ah
     d13:	3d 41 ad ad 67       	cmp    eax,0x67adad41
     d18:	d8 92 bb 02 07 00    	fcom   DWORD PTR [edx+0x702bb]
     d1e:	01 01                	add    DWORD PTR [ecx],eax
     d20:	e6 00                	out    0x0,al
     d22:	00 00                	add    BYTE PTR [eax],al
     d24:	02 00                	add    al,BYTE PTR [eax]
     d26:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     d27:	00 00                	add    BYTE PTR [eax],al
     d29:	00 01                	add    BYTE PTR [ecx],al
     d2b:	01 fb                	add    ebx,edi
     d2d:	0e                   	push   cs
     d2e:	0d 00 01 01 01       	or     eax,0x1010100
     d33:	01 00                	add    DWORD PTR [eax],eax
     d35:	00 00                	add    BYTE PTR [eax],al
     d37:	01 00                	add    DWORD PTR [eax],eax
     d39:	00 01                	add    BYTE PTR [ecx],al
     d3b:	73 72                	jae    daf <sysEnter_Vector-0x12f251>
     d3d:	63 2f                	arpl   WORD PTR [edi],bp
     d3f:	73 74                	jae    db5 <sysEnter_Vector-0x12f24b>
     d41:	72 69                	jb     dac <sysEnter_Vector-0x12f254>
     d43:	6e                   	outs   dx,BYTE PTR ds:[esi]
     d44:	67 73 00             	addr16 jae d47 <sysEnter_Vector-0x12f2b9>
     d47:	2f                   	das    
     d48:	68 6f 6d 65 2f       	push   0x2f656d6f
     d4d:	79 6f                	jns    dbe <sysEnter_Vector-0x12f242>
     d4f:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     d56:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     d59:	73 73                	jae    dce <sysEnter_Vector-0x12f232>
     d5b:	2f                   	das    
     d5c:	6c                   	ins    BYTE PTR es:[edi],dx
     d5d:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     d64:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     d6a:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     d70:	78 2d                	js     d9f <sysEnter_Vector-0x12f261>
     d72:	67 6e                	outs   dx,BYTE PTR ds:[si]
     d74:	75 2f                	jne    da5 <sysEnter_Vector-0x12f25b>
     d76:	35 2e 33 2e 30       	xor    eax,0x302e332e
     d7b:	2f                   	das    
     d7c:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     d83:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     d86:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     d8a:	65 00 00             	add    BYTE PTR gs:[eax],al
     d8d:	73 74                	jae    e03 <sysEnter_Vector-0x12f1fd>
     d8f:	72 63                	jb     df4 <sysEnter_Vector-0x12f20c>
     d91:	70 79                	jo     e0c <sysEnter_Vector-0x12f1f4>
     d93:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     d96:	01 00                	add    DWORD PTR [eax],eax
     d98:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     d9b:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     da2:	63 
     da3:	2e                   	cs
     da4:	68 00 02 00 00       	push   0x200
     da9:	74 69                	je     e14 <sysEnter_Vector-0x12f1ec>
     dab:	6d                   	ins    DWORD PTR es:[edi],dx
     dac:	65                   	gs
     dad:	2e                   	cs
     dae:	68 00 03 00 00       	push   0x300
     db3:	6d                   	ins    DWORD PTR es:[edi],dx
     db4:	61                   	popa   
     db5:	6c                   	ins    BYTE PTR es:[edi],dx
     db6:	6c                   	ins    BYTE PTR es:[edi],dx
     db7:	6f                   	outs   dx,DWORD PTR ds:[esi]
     db8:	63 2e                	arpl   WORD PTR [esi],bp
     dba:	68 00 03 00 00       	push   0x300
     dbf:	6c                   	ins    BYTE PTR es:[edi],dx
     dc0:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     dc7:	4f                   	dec    edi
     dc8:	53                   	push   ebx
     dc9:	2e                   	cs
     dca:	68 00 03 00 00       	push   0x300
     dcf:	00 00                	add    BYTE PTR [eax],al
     dd1:	05 02 14 12 00       	add    eax,0x121402
     dd6:	30 16                	xor    BYTE PTR [esi],dl
     dd8:	f3 67 00 02          	repz add BYTE PTR [bp+si],al
     ddc:	04 01                	add    al,0x1
     dde:	06                   	push   es
     ddf:	20 06                	and    BYTE PTR [esi],al
     de1:	08 ca                	or     dl,cl
     de3:	67 3d 32 f3 67 00    	addr16 cmp eax,0x67f332
     de9:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     dec:	06                   	push   es
     ded:	20 06                	and    BYTE PTR [esi],al
     def:	08 ca                	or     dl,cl
     df1:	67 3d 32 f3 67 00    	addr16 cmp eax,0x67f332
     df7:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
     dfa:	06                   	push   es
     dfb:	20 00                	and    BYTE PTR [eax],al
     dfd:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     e00:	08 c8                	or     al,cl
     e02:	06                   	push   es
     e03:	ca 3d 02             	retf   0x23d
     e06:	02 00                	add    al,BYTE PTR [eax]
     e08:	01 01                	add    DWORD PTR [ecx],eax
     e0a:	94                   	xchg   esp,eax
     e0b:	00 00                	add    BYTE PTR [eax],al
     e0d:	00 02                	add    BYTE PTR [edx],al
     e0f:	00 74 00 00          	add    BYTE PTR [eax+eax*1+0x0],dh
     e13:	00 01                	add    BYTE PTR [ecx],al
     e15:	01 fb                	add    ebx,edi
     e17:	0e                   	push   cs
     e18:	0d 00 01 01 01       	or     eax,0x1010100
     e1d:	01 00                	add    DWORD PTR [eax],eax
     e1f:	00 00                	add    BYTE PTR [eax],al
     e21:	01 00                	add    DWORD PTR [eax],eax
     e23:	00 01                	add    BYTE PTR [ecx],al
     e25:	73 72                	jae    e99 <sysEnter_Vector-0x12f167>
     e27:	63 2f                	arpl   WORD PTR [edi],bp
     e29:	73 74                	jae    e9f <sysEnter_Vector-0x12f161>
     e2b:	72 69                	jb     e96 <sysEnter_Vector-0x12f16a>
     e2d:	6e                   	outs   dx,BYTE PTR ds:[esi]
     e2e:	67 73 00             	addr16 jae e31 <sysEnter_Vector-0x12f1cf>
     e31:	2f                   	das    
     e32:	68 6f 6d 65 2f       	push   0x2f656d6f
     e37:	79 6f                	jns    ea8 <sysEnter_Vector-0x12f158>
     e39:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     e40:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     e43:	73 73                	jae    eb8 <sysEnter_Vector-0x12f148>
     e45:	2f                   	das    
     e46:	6c                   	ins    BYTE PTR es:[edi],dx
     e47:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     e4e:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     e54:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     e5a:	78 2d                	js     e89 <sysEnter_Vector-0x12f177>
     e5c:	67 6e                	outs   dx,BYTE PTR ds:[si]
     e5e:	75 2f                	jne    e8f <sysEnter_Vector-0x12f171>
     e60:	35 2e 33 2e 30       	xor    eax,0x302e332e
     e65:	2f                   	das    
     e66:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     e6d:	00 00                	add    BYTE PTR [eax],al
     e6f:	73 74                	jae    ee5 <sysEnter_Vector-0x12f11b>
     e71:	72 6c                	jb     edf <sysEnter_Vector-0x12f121>
     e73:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     e75:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     e78:	01 00                	add    DWORD PTR [eax],eax
     e7a:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     e7d:	64                   	fs
     e7e:	64                   	fs
     e7f:	65                   	gs
     e80:	66                   	data16
     e81:	2e                   	cs
     e82:	68 00 02 00 00       	push   0x200
     e87:	00 00                	add    BYTE PTR [eax],al
     e89:	05 02 dc 12 00       	add    eax,0x12dc02
     e8e:	30 14 f3             	xor    BYTE PTR [ebx+esi*8],dl
     e91:	75 2f                	jne    ec2 <sysEnter_Vector-0x12f13e>
     e93:	49                   	dec    ecx
     e94:	e6 3d                	out    0x3d,al
     e96:	30 f3                	xor    bl,dh
     e98:	75 2f                	jne    ec9 <sysEnter_Vector-0x12f137>
     e9a:	49                   	dec    ecx
     e9b:	e6 3d                	out    0x3d,al
     e9d:	02 02                	add    al,BYTE PTR [edx]
     e9f:	00 01                	add    BYTE PTR [ecx],al
     ea1:	01 a5 00 00 00 02    	add    DWORD PTR [ebp+0x2000000],esp
     ea7:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
     eaa:	00 00                	add    BYTE PTR [eax],al
     eac:	01 01                	add    DWORD PTR [ecx],eax
     eae:	fb                   	sti    
     eaf:	0e                   	push   cs
     eb0:	0d 00 01 01 01       	or     eax,0x1010100
     eb5:	01 00                	add    DWORD PTR [eax],eax
     eb7:	00 00                	add    BYTE PTR [eax],al
     eb9:	01 00                	add    DWORD PTR [eax],eax
     ebb:	00 01                	add    BYTE PTR [ecx],al
     ebd:	73 72                	jae    f31 <sysEnter_Vector-0x12f0cf>
     ebf:	63 2f                	arpl   WORD PTR [edi],bp
     ec1:	73 74                	jae    f37 <sysEnter_Vector-0x12f0c9>
     ec3:	72 69                	jb     f2e <sysEnter_Vector-0x12f0d2>
     ec5:	6e                   	outs   dx,BYTE PTR ds:[esi]
     ec6:	67 73 00             	addr16 jae ec9 <sysEnter_Vector-0x12f137>
     ec9:	2f                   	das    
     eca:	68 6f 6d 65 2f       	push   0x2f656d6f
     ecf:	79 6f                	jns    f40 <sysEnter_Vector-0x12f0c0>
     ed1:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     ed8:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     edb:	73 73                	jae    f50 <sysEnter_Vector-0x12f0b0>
     edd:	2f                   	das    
     ede:	6c                   	ins    BYTE PTR es:[edi],dx
     edf:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     ee6:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     eec:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     ef2:	78 2d                	js     f21 <sysEnter_Vector-0x12f0df>
     ef4:	67 6e                	outs   dx,BYTE PTR ds:[si]
     ef6:	75 2f                	jne    f27 <sysEnter_Vector-0x12f0d9>
     ef8:	35 2e 33 2e 30       	xor    eax,0x302e332e
     efd:	2f                   	das    
     efe:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     f05:	00 00                	add    BYTE PTR [eax],al
     f07:	73 74                	jae    f7d <sysEnter_Vector-0x12f083>
     f09:	72 6e                	jb     f79 <sysEnter_Vector-0x12f087>
     f0b:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
     f0e:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     f11:	01 00                	add    DWORD PTR [eax],eax
     f13:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     f16:	64                   	fs
     f17:	64                   	fs
     f18:	65                   	gs
     f19:	66                   	data16
     f1a:	2e                   	cs
     f1b:	68 00 02 00 00       	push   0x200
     f20:	00 00                	add    BYTE PTR [eax],al
     f22:	05 02 40 13 00       	add    eax,0x134002
     f27:	30 03                	xor    BYTE PTR [ebx],al
     f29:	0c 01                	or     al,0x1
     f2b:	c9                   	leave  
     f2c:	2f                   	das    
     f2d:	f3 00 02             	repz add BYTE PTR [edx],al
     f30:	04 01                	add    al,0x1
     f32:	06                   	push   es
     f33:	f2 00 02             	repnz add BYTE PTR [edx],al
     f36:	04 02                	add    al,0x2
     f38:	74 06                	je     f40 <sysEnter_Vector-0x12f0c0>
     f3a:	75 9f                	jne    edb <sysEnter_Vector-0x12f125>
     f3c:	70 00                	jo     f3e <sysEnter_Vector-0x12f0c2>
     f3e:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     f41:	06                   	push   es
     f42:	ba 06 6b 59 02       	mov    edx,0x2596b06
     f47:	02 00                	add    al,BYTE PTR [eax]
     f49:	01 01                	add    DWORD PTR [ecx],eax
     f4b:	9d                   	popf   
     f4c:	00 00                	add    BYTE PTR [eax],al
     f4e:	00 02                	add    BYTE PTR [edx],al
     f50:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
     f53:	00 00                	add    BYTE PTR [eax],al
     f55:	01 01                	add    DWORD PTR [ecx],eax
     f57:	fb                   	sti    
     f58:	0e                   	push   cs
     f59:	0d 00 01 01 01       	or     eax,0x1010100
     f5e:	01 00                	add    DWORD PTR [eax],eax
     f60:	00 00                	add    BYTE PTR [eax],al
     f62:	01 00                	add    DWORD PTR [eax],eax
     f64:	00 01                	add    BYTE PTR [ecx],al
     f66:	73 72                	jae    fda <sysEnter_Vector-0x12f026>
     f68:	63 2f                	arpl   WORD PTR [edi],bp
     f6a:	73 74                	jae    fe0 <sysEnter_Vector-0x12f020>
     f6c:	72 69                	jb     fd7 <sysEnter_Vector-0x12f029>
     f6e:	6e                   	outs   dx,BYTE PTR ds:[esi]
     f6f:	67 73 00             	addr16 jae f72 <sysEnter_Vector-0x12f08e>
     f72:	2f                   	das    
     f73:	68 6f 6d 65 2f       	push   0x2f656d6f
     f78:	79 6f                	jns    fe9 <sysEnter_Vector-0x12f017>
     f7a:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     f81:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     f84:	73 73                	jae    ff9 <sysEnter_Vector-0x12f007>
     f86:	2f                   	das    
     f87:	6c                   	ins    BYTE PTR es:[edi],dx
     f88:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     f8f:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     f95:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     f9b:	78 2d                	js     fca <sysEnter_Vector-0x12f036>
     f9d:	67 6e                	outs   dx,BYTE PTR ds:[si]
     f9f:	75 2f                	jne    fd0 <sysEnter_Vector-0x12f030>
     fa1:	35 2e 33 2e 30       	xor    eax,0x302e332e
     fa6:	2f                   	das    
     fa7:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     fae:	00 00                	add    BYTE PTR [eax],al
     fb0:	73 74                	jae    1026 <sysEnter_Vector-0x12efda>
     fb2:	72 6e                	jb     1022 <sysEnter_Vector-0x12efde>
     fb4:	63 70 79             	arpl   WORD PTR [eax+0x79],si
     fb7:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     fba:	01 00                	add    DWORD PTR [eax],eax
     fbc:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     fbf:	64                   	fs
     fc0:	64                   	fs
     fc1:	65                   	gs
     fc2:	66                   	data16
     fc3:	2e                   	cs
     fc4:	68 00 02 00 00       	push   0x200
     fc9:	00 00                	add    BYTE PTR [eax],al
     fcb:	05 02 a8 13 00       	add    eax,0x13a802
     fd0:	30 03                	xor    BYTE PTR [ebx],al
     fd2:	0d 01 f3 67 2f       	or     eax,0x2f67f301
     fd7:	08 67 48             	or     BYTE PTR [edi+0x48],ah
     fda:	00 02                	add    BYTE PTR [edx],al
     fdc:	04 01                	add    al,0x1
     fde:	06                   	push   es
     fdf:	66 06                	pushw  es
     fe1:	a2 2f bb 48 6a       	mov    ds:0x6a48bb2f,al
     fe6:	3d 02 02 00 01       	cmp    eax,0x1000202
     feb:	01 53 01             	add    DWORD PTR [ebx+0x1],edx
     fee:	00 00                	add    BYTE PTR [eax],al
     ff0:	02 00                	add    al,BYTE PTR [eax]
     ff2:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     ff3:	00 00                	add    BYTE PTR [eax],al
     ff5:	00 01                	add    BYTE PTR [ecx],al
     ff7:	01 fb                	add    ebx,edi
     ff9:	0e                   	push   cs
     ffa:	0d 00 01 01 01       	or     eax,0x1010100
     fff:	01 00                	add    DWORD PTR [eax],eax
    1001:	00 00                	add    BYTE PTR [eax],al
    1003:	01 00                	add    DWORD PTR [eax],eax
    1005:	00 01                	add    BYTE PTR [ecx],al
    1007:	73 72                	jae    107b <sysEnter_Vector-0x12ef85>
    1009:	63 2f                	arpl   WORD PTR [edi],bp
    100b:	73 74                	jae    1081 <sysEnter_Vector-0x12ef7f>
    100d:	72 69                	jb     1078 <sysEnter_Vector-0x12ef88>
    100f:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1010:	67 73 00             	addr16 jae 1013 <sysEnter_Vector-0x12efed>
    1013:	2f                   	das    
    1014:	68 6f 6d 65 2f       	push   0x2f656d6f
    1019:	79 6f                	jns    108a <sysEnter_Vector-0x12ef76>
    101b:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    1022:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    1025:	73 73                	jae    109a <sysEnter_Vector-0x12ef66>
    1027:	2f                   	das    
    1028:	6c                   	ins    BYTE PTR es:[edi],dx
    1029:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    1030:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    1036:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    103c:	78 2d                	js     106b <sysEnter_Vector-0x12ef95>
    103e:	67 6e                	outs   dx,BYTE PTR ds:[si]
    1040:	75 2f                	jne    1071 <sysEnter_Vector-0x12ef8f>
    1042:	35 2e 33 2e 30       	xor    eax,0x302e332e
    1047:	2f                   	das    
    1048:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    104f:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    1052:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    1056:	65 00 00             	add    BYTE PTR gs:[eax],al
    1059:	73 74                	jae    10cf <sysEnter_Vector-0x12ef31>
    105b:	72 6f                	jb     10cc <sysEnter_Vector-0x12ef34>
    105d:	75 6c                	jne    10cb <sysEnter_Vector-0x12ef35>
    105f:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
    1062:	01 00                	add    DWORD PTR [eax],eax
    1064:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    1067:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    106e:	63 
    106f:	2e                   	cs
    1070:	68 00 02 00 00       	push   0x200
    1075:	74 69                	je     10e0 <sysEnter_Vector-0x12ef20>
    1077:	6d                   	ins    DWORD PTR es:[edi],dx
    1078:	65                   	gs
    1079:	2e                   	cs
    107a:	68 00 03 00 00       	push   0x300
    107f:	6d                   	ins    DWORD PTR es:[edi],dx
    1080:	61                   	popa   
    1081:	6c                   	ins    BYTE PTR es:[edi],dx
    1082:	6c                   	ins    BYTE PTR es:[edi],dx
    1083:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1084:	63 2e                	arpl   WORD PTR [esi],bp
    1086:	68 00 03 00 00       	push   0x300
    108b:	6c                   	ins    BYTE PTR es:[edi],dx
    108c:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    1093:	4f                   	dec    edi
    1094:	53                   	push   ebx
    1095:	2e                   	cs
    1096:	68 00 03 00 00       	push   0x300
    109b:	00 00                	add    BYTE PTR [eax],al
    109d:	05 02 08 14 00       	add    eax,0x140802
    10a2:	30 03                	xor    BYTE PTR [ebx],al
    10a4:	3b 01                	cmp    eax,DWORD PTR [ecx]
    10a6:	08 2f                	or     BYTE PTR [edi],ch
    10a8:	40                   	inc    eax
    10a9:	00 02                	add    BYTE PTR [edx],al
    10ab:	04 01                	add    al,0x1
    10ad:	7a 00                	jp     10af <sysEnter_Vector-0x12ef51>
    10af:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    10b2:	ad                   	lods   eax,DWORD PTR ds:[esi]
    10b3:	59                   	pop    ecx
    10b4:	59                   	pop    ecx
    10b5:	75 c9                	jne    1080 <sysEnter_Vector-0x12ef80>
    10b7:	59                   	pop    ecx
    10b8:	ad                   	lods   eax,DWORD PTR ds:[esi]
    10b9:	00 02                	add    BYTE PTR [edx],al
    10bb:	04 02                	add    al,0x2
    10bd:	06                   	push   es
    10be:	66                   	data16
    10bf:	00 02                	add    BYTE PTR [edx],al
    10c1:	04 03                	add    al,0x3
    10c3:	66 06                	pushw  es
    10c5:	59                   	pop    ecx
    10c6:	00 02                	add    BYTE PTR [edx],al
    10c8:	04 01                	add    al,0x1
    10ca:	06                   	push   es
    10cb:	74 06                	je     10d3 <sysEnter_Vector-0x12ef2d>
    10cd:	75 91                	jne    1060 <sysEnter_Vector-0x12efa0>
    10cf:	3d 76 67 00 02       	cmp    eax,0x2006776
    10d4:	04 01                	add    al,0x1
    10d6:	06                   	push   es
    10d7:	58                   	pop    eax
    10d8:	00 02                	add    BYTE PTR [edx],al
    10da:	04 02                	add    al,0x2
    10dc:	74 00                	je     10de <sysEnter_Vector-0x12ef22>
    10de:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    10e1:	58                   	pop    eax
    10e2:	06                   	push   es
    10e3:	3d 08 21 08 2f       	cmp    eax,0x2f082108
    10e8:	9f                   	lahf   
    10e9:	83 59 c9 00          	sbb    DWORD PTR [ecx-0x37],0x0
    10ed:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    10f0:	06                   	push   es
    10f1:	58                   	pop    eax
    10f2:	00 02                	add    BYTE PTR [edx],al
    10f4:	04 03                	add    al,0x3
    10f6:	58                   	pop    eax
    10f7:	00 02                	add    BYTE PTR [edx],al
    10f9:	04 04                	add    al,0x4
    10fb:	74 00                	je     10fd <sysEnter_Vector-0x12ef03>
    10fd:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1100:	58                   	pop    eax
    1101:	06                   	push   es
    1102:	31 5a 00             	xor    DWORD PTR [edx+0x0],ebx
    1105:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1108:	06                   	push   es
    1109:	66                   	data16
    110a:	00 02                	add    BYTE PTR [edx],al
    110c:	04 02                	add    al,0x2
    110e:	58                   	pop    eax
    110f:	00 02                	add    BYTE PTR [edx],al
    1111:	04 03                	add    al,0x3
    1113:	58                   	pop    eax
    1114:	06                   	push   es
    1115:	67 76 59             	addr16 jbe 1171 <sysEnter_Vector-0x12ee8f>
    1118:	67 03 72 4a          	add    esi,DWORD PTR [bp+si+0x4a]
    111c:	03 10                	add    edx,DWORD PTR [eax]
    111e:	ac                   	lods   al,BYTE PTR ds:[esi]
    111f:	03 76 2e             	add    esi,DWORD PTR [esi+0x2e]
    1122:	3e 03 09             	add    ecx,DWORD PTR ds:[ecx]
    1125:	20 67 75             	and    BYTE PTR [edi+0x75],ah
    1128:	67 2f                	addr16 das 
    112a:	67 00 02             	add    BYTE PTR [bp+si],al
    112d:	04 01                	add    al,0x1
    112f:	06                   	push   es
    1130:	66                   	data16
    1131:	00 02                	add    BYTE PTR [edx],al
    1133:	04 02                	add    al,0x2
    1135:	58                   	pop    eax
    1136:	00 02                	add    BYTE PTR [edx],al
    1138:	04 04                	add    al,0x4
    113a:	3c 06                	cmp    al,0x6
    113c:	59                   	pop    ecx
    113d:	2f                   	das    
    113e:	02 08                	add    cl,BYTE PTR [eax]
    1140:	00 01                	add    BYTE PTR [ecx],al
    1142:	01 43 00             	add    DWORD PTR [ebx+0x0],eax
    1145:	00 00                	add    BYTE PTR [eax],al
    1147:	02 00                	add    al,BYTE PTR [eax]
    1149:	2d 00 00 00 01       	sub    eax,0x1000000
    114e:	01 fb                	add    ebx,edi
    1150:	0e                   	push   cs
    1151:	0d 00 01 01 01       	or     eax,0x1010100
    1156:	01 00                	add    DWORD PTR [eax],eax
    1158:	00 00                	add    BYTE PTR [eax],al
    115a:	01 00                	add    DWORD PTR [eax],eax
    115c:	00 01                	add    BYTE PTR [ecx],al
    115e:	73 72                	jae    11d2 <sysEnter_Vector-0x12ee2e>
    1160:	63 2f                	arpl   WORD PTR [edi],bp
    1162:	73 74                	jae    11d8 <sysEnter_Vector-0x12ee28>
    1164:	72 69                	jb     11cf <sysEnter_Vector-0x12ee31>
    1166:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1167:	67 73 00             	addr16 jae 116a <sysEnter_Vector-0x12ee96>
    116a:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    116d:	72 70                	jb     11df <sysEnter_Vector-0x12ee21>
    116f:	61                   	popa   
    1170:	72 74                	jb     11e6 <sysEnter_Vector-0x12ee1a>
    1172:	73 2e                	jae    11a2 <sysEnter_Vector-0x12ee5e>
    1174:	63 00                	arpl   WORD PTR [eax],ax
    1176:	01 00                	add    DWORD PTR [eax],eax
    1178:	00 00                	add    BYTE PTR [eax],al
    117a:	00 05 02 88 15 00    	add    BYTE PTR ds:0x158802,al
    1180:	30 13                	xor    BYTE PTR [ebx],dl
    1182:	c9                   	leave  
    1183:	ad                   	lods   eax,DWORD PTR ds:[esi]
    1184:	3d 02 02 00 01       	cmp    eax,0x1000202
    1189:	01 7f 01             	add    DWORD PTR [edi+0x1],edi
    118c:	00 00                	add    BYTE PTR [eax],al
    118e:	02 00                	add    al,BYTE PTR [eax]
    1190:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
    1191:	00 00                	add    BYTE PTR [eax],al
    1193:	00 01                	add    BYTE PTR [ecx],al
    1195:	01 fb                	add    ebx,edi
    1197:	0e                   	push   cs
    1198:	0d 00 01 01 01       	or     eax,0x1010100
    119d:	01 00                	add    DWORD PTR [eax],eax
    119f:	00 00                	add    BYTE PTR [eax],al
    11a1:	01 00                	add    DWORD PTR [eax],eax
    11a3:	00 01                	add    BYTE PTR [ecx],al
    11a5:	73 72                	jae    1219 <sysEnter_Vector-0x12ede7>
    11a7:	63 2f                	arpl   WORD PTR [edi],bp
    11a9:	73 74                	jae    121f <sysEnter_Vector-0x12ede1>
    11ab:	72 69                	jb     1216 <sysEnter_Vector-0x12edea>
    11ad:	6e                   	outs   dx,BYTE PTR ds:[esi]
    11ae:	67 73 00             	addr16 jae 11b1 <sysEnter_Vector-0x12ee4f>
    11b1:	2f                   	das    
    11b2:	68 6f 6d 65 2f       	push   0x2f656d6f
    11b7:	79 6f                	jns    1228 <sysEnter_Vector-0x12edd8>
    11b9:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    11c0:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    11c3:	73 73                	jae    1238 <sysEnter_Vector-0x12edc8>
    11c5:	2f                   	das    
    11c6:	6c                   	ins    BYTE PTR es:[edi],dx
    11c7:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    11ce:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    11d4:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    11da:	78 2d                	js     1209 <sysEnter_Vector-0x12edf7>
    11dc:	67 6e                	outs   dx,BYTE PTR ds:[si]
    11de:	75 2f                	jne    120f <sysEnter_Vector-0x12edf1>
    11e0:	35 2e 33 2e 30       	xor    eax,0x302e332e
    11e5:	2f                   	das    
    11e6:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    11ed:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    11f0:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    11f4:	65 00 00             	add    BYTE PTR gs:[eax],al
    11f7:	73 74                	jae    126d <sysEnter_Vector-0x12ed93>
    11f9:	72 74                	jb     126f <sysEnter_Vector-0x12ed91>
    11fb:	6f                   	outs   dx,DWORD PTR ds:[esi]
    11fc:	6c                   	ins    BYTE PTR es:[edi],dx
    11fd:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
    1200:	01 00                	add    DWORD PTR [eax],eax
    1202:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    1205:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    120c:	63 
    120d:	2e                   	cs
    120e:	68 00 02 00 00       	push   0x200
    1213:	74 69                	je     127e <sysEnter_Vector-0x12ed82>
    1215:	6d                   	ins    DWORD PTR es:[edi],dx
    1216:	65                   	gs
    1217:	2e                   	cs
    1218:	68 00 03 00 00       	push   0x300
    121d:	6d                   	ins    DWORD PTR es:[edi],dx
    121e:	61                   	popa   
    121f:	6c                   	ins    BYTE PTR es:[edi],dx
    1220:	6c                   	ins    BYTE PTR es:[edi],dx
    1221:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1222:	63 2e                	arpl   WORD PTR [esi],bp
    1224:	68 00 03 00 00       	push   0x300
    1229:	6c                   	ins    BYTE PTR es:[edi],dx
    122a:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    1231:	4f                   	dec    edi
    1232:	53                   	push   ebx
    1233:	2e                   	cs
    1234:	68 00 03 00 00       	push   0x300
    1239:	00 00                	add    BYTE PTR [eax],al
    123b:	05 02 a8 15 00       	add    eax,0x15a802
    1240:	30 03                	xor    BYTE PTR [ebx],al
    1242:	d7                   	xlat   BYTE PTR ds:[ebx]
    1243:	00 01                	add    BYTE PTR [ecx],al
    1245:	08 2f                	or     BYTE PTR [edi],ch
    1247:	40                   	inc    eax
    1248:	00 02                	add    BYTE PTR [edx],al
    124a:	04 01                	add    al,0x1
    124c:	7c 00                	jl     124e <sysEnter_Vector-0x12edb2>
    124e:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1251:	ad                   	lods   eax,DWORD PTR ds:[esi]
    1252:	59                   	pop    ecx
    1253:	59                   	pop    ecx
    1254:	75 c9                	jne    121f <sysEnter_Vector-0x12ede1>
    1256:	59                   	pop    ecx
    1257:	ad                   	lods   eax,DWORD PTR ds:[esi]
    1258:	00 02                	add    BYTE PTR [edx],al
    125a:	04 02                	add    al,0x2
    125c:	06                   	push   es
    125d:	66                   	data16
    125e:	00 02                	add    BYTE PTR [edx],al
    1260:	04 03                	add    al,0x3
    1262:	66 06                	pushw  es
    1264:	59                   	pop    ecx
    1265:	00 02                	add    BYTE PTR [edx],al
    1267:	04 01                	add    al,0x1
    1269:	06                   	push   es
    126a:	74 06                	je     1272 <sysEnter_Vector-0x12ed8e>
    126c:	75 91                	jne    11ff <sysEnter_Vector-0x12ee01>
    126e:	3d 76 67 00 02       	cmp    eax,0x2006776
    1273:	04 01                	add    al,0x1
    1275:	06                   	push   es
    1276:	58                   	pop    eax
    1277:	00 02                	add    BYTE PTR [edx],al
    1279:	04 02                	add    al,0x2
    127b:	74 00                	je     127d <sysEnter_Vector-0x12ed83>
    127d:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1280:	58                   	pop    eax
    1281:	06                   	push   es
    1282:	03 13                	add    edx,DWORD PTR [ebx]
    1284:	3c 00                	cmp    al,0x0
    1286:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1289:	06                   	push   es
    128a:	66                   	data16
    128b:	00 02                	add    BYTE PTR [edx],al
    128d:	04 02                	add    al,0x2
    128f:	74 00                	je     1291 <sysEnter_Vector-0x12ed6f>
    1291:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1294:	06                   	push   es
    1295:	59                   	pop    ecx
    1296:	00 02                	add    BYTE PTR [edx],al
    1298:	04 04                	add    al,0x4
    129a:	08 3d 00 02 04 04    	or     BYTE PTR ds:0x4040200,bh
    12a0:	f3 9f                	repz lahf 
    12a2:	83 59 c9 00          	sbb    DWORD PTR [ecx-0x37],0x0
    12a6:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    12a9:	06                   	push   es
    12aa:	58                   	pop    eax
    12ab:	00 02                	add    BYTE PTR [edx],al
    12ad:	04 03                	add    al,0x3
    12af:	58                   	pop    eax
    12b0:	00 02                	add    BYTE PTR [edx],al
    12b2:	04 04                	add    al,0x4
    12b4:	74 00                	je     12b6 <sysEnter_Vector-0x12ed4a>
    12b6:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    12b9:	58                   	pop    eax
    12ba:	06                   	push   es
    12bb:	31 5a 00             	xor    DWORD PTR [edx+0x0],ebx
    12be:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    12c1:	06                   	push   es
    12c2:	66                   	data16
    12c3:	00 02                	add    BYTE PTR [edx],al
    12c5:	04 02                	add    al,0x2
    12c7:	58                   	pop    eax
    12c8:	00 02                	add    BYTE PTR [edx],al
    12ca:	04 03                	add    al,0x3
    12cc:	58                   	pop    eax
    12cd:	06                   	push   es
    12ce:	59                   	pop    ecx
    12cf:	76 59                	jbe    132a <sysEnter_Vector-0x12ecd6>
    12d1:	67 03 72 4a          	add    esi,DWORD PTR [bp+si+0x4a]
    12d5:	03 10                	add    edx,DWORD PTR [eax]
    12d7:	ac                   	lods   al,BYTE PTR ds:[esi]
    12d8:	03 76 2e             	add    esi,DWORD PTR [esi+0x2e]
    12db:	3e 03 09             	add    ecx,DWORD PTR ds:[ecx]
    12de:	20 67 00             	and    BYTE PTR [edi+0x0],ah
    12e1:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    12e4:	06                   	push   es
    12e5:	66                   	data16
    12e6:	00 02                	add    BYTE PTR [edx],al
    12e8:	04 02                	add    al,0x2
    12ea:	74 00                	je     12ec <sysEnter_Vector-0x12ed14>
    12ec:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    12ef:	58                   	pop    eax
    12f0:	06                   	push   es
    12f1:	4b                   	dec    ebx
    12f2:	67 2f                	addr16 das 
    12f4:	67 00 02             	add    BYTE PTR [bp+si],al
    12f7:	04 01                	add    al,0x1
    12f9:	06                   	push   es
    12fa:	66                   	data16
    12fb:	00 02                	add    BYTE PTR [edx],al
    12fd:	04 02                	add    al,0x2
    12ff:	58                   	pop    eax
    1300:	00 02                	add    BYTE PTR [edx],al
    1302:	04 04                	add    al,0x4
    1304:	3c 06                	cmp    al,0x6
    1306:	59                   	pop    ecx
    1307:	2f                   	das    
    1308:	02 08                	add    cl,BYTE PTR [eax]
    130a:	00 01                	add    BYTE PTR [ecx],al
    130c:	01 d6                	add    esi,edx
    130e:	00 00                	add    BYTE PTR [eax],al
    1310:	00 02                	add    BYTE PTR [edx],al
    1312:	00 a7 00 00 00 01    	add    BYTE PTR [edi+0x1000000],ah
    1318:	01 fb                	add    ebx,edi
    131a:	0e                   	push   cs
    131b:	0d 00 01 01 01       	or     eax,0x1010100
    1320:	01 00                	add    DWORD PTR [eax],eax
    1322:	00 00                	add    BYTE PTR [eax],al
    1324:	01 00                	add    DWORD PTR [eax],eax
    1326:	00 01                	add    BYTE PTR [ecx],al
    1328:	73 72                	jae    139c <sysEnter_Vector-0x12ec64>
    132a:	63 2f                	arpl   WORD PTR [edi],bp
    132c:	73 74                	jae    13a2 <sysEnter_Vector-0x12ec5e>
    132e:	72 69                	jb     1399 <sysEnter_Vector-0x12ec67>
    1330:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1331:	67 73 00             	addr16 jae 1334 <sysEnter_Vector-0x12eccc>
    1334:	2f                   	das    
    1335:	68 6f 6d 65 2f       	push   0x2f656d6f
    133a:	79 6f                	jns    13ab <sysEnter_Vector-0x12ec55>
    133c:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    1343:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    1346:	73 73                	jae    13bb <sysEnter_Vector-0x12ec45>
    1348:	2f                   	das    
    1349:	6c                   	ins    BYTE PTR es:[edi],dx
    134a:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    1351:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    1357:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    135d:	78 2d                	js     138c <sysEnter_Vector-0x12ec74>
    135f:	67 6e                	outs   dx,BYTE PTR ds:[si]
    1361:	75 2f                	jne    1392 <sysEnter_Vector-0x12ec6e>
    1363:	35 2e 33 2e 30       	xor    eax,0x302e332e
    1368:	2f                   	das    
    1369:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    1370:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    1373:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    1377:	65 00 00             	add    BYTE PTR gs:[eax],al
    137a:	73 74                	jae    13f0 <sysEnter_Vector-0x12ec10>
    137c:	72 74                	jb     13f2 <sysEnter_Vector-0x12ec0e>
    137e:	72 69                	jb     13e9 <sysEnter_Vector-0x12ec17>
    1380:	6d                   	ins    DWORD PTR es:[edi],dx
    1381:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
    1384:	01 00                	add    DWORD PTR [eax],eax
    1386:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    1389:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    1390:	63 
    1391:	2e                   	cs
    1392:	68 00 02 00 00       	push   0x200
    1397:	74 69                	je     1402 <sysEnter_Vector-0x12ebfe>
    1399:	6d                   	ins    DWORD PTR es:[edi],dx
    139a:	65                   	gs
    139b:	2e                   	cs
    139c:	68 00 03 00 00       	push   0x300
    13a1:	6d                   	ins    DWORD PTR es:[edi],dx
    13a2:	61                   	popa   
    13a3:	6c                   	ins    BYTE PTR es:[edi],dx
    13a4:	6c                   	ins    BYTE PTR es:[edi],dx
    13a5:	6f                   	outs   dx,DWORD PTR ds:[esi]
    13a6:	63 2e                	arpl   WORD PTR [esi],bp
    13a8:	68 00 03 00 00       	push   0x300
    13ad:	6c                   	ins    BYTE PTR es:[edi],dx
    13ae:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    13b5:	4f                   	dec    edi
    13b6:	53                   	push   ebx
    13b7:	2e                   	cs
    13b8:	68 00 03 00 00       	push   0x300
    13bd:	00 00                	add    BYTE PTR [eax],al
    13bf:	05 02 44 17 00       	add    eax,0x174402
    13c4:	30 15 08 13 bf 30    	xor    BYTE PTR ds:0x30bf1308,dl
    13ca:	48                   	dec    eax
    13cb:	b3 08                	mov    bl,0x8
    13cd:	9f                   	lahf   
    13ce:	30 b8 00 02 04 01    	xor    BYTE PTR [eax+0x1040200],bh
    13d4:	06                   	push   es
    13d5:	82                   	(bad)  
    13d6:	06                   	push   es
    13d7:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
    13d8:	84 00                	test   BYTE PTR [eax],al
    13da:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    13dd:	06                   	push   es
    13de:	20 06                	and    BYTE PTR [esi],al
    13e0:	08 ca                	or     dl,cl
    13e2:	02 06                	add    al,BYTE PTR [esi]
    13e4:	00 01                	add    BYTE PTR [ecx],al
    13e6:	01 ce                	add    esi,ecx
    13e8:	00 00                	add    BYTE PTR [eax],al
    13ea:	00 02                	add    BYTE PTR [edx],al
    13ec:	00 9e 00 00 00 01    	add    BYTE PTR [esi+0x1000000],bl
    13f2:	01 fb                	add    ebx,edi
    13f4:	0e                   	push   cs
    13f5:	0d 00 01 01 01       	or     eax,0x1010100
    13fa:	01 00                	add    DWORD PTR [eax],eax
    13fc:	00 00                	add    BYTE PTR [eax],al
    13fe:	01 00                	add    DWORD PTR [eax],eax
    1400:	00 01                	add    BYTE PTR [ecx],al
    1402:	73 72                	jae    1476 <sysEnter_Vector-0x12eb8a>
    1404:	63 00                	arpl   WORD PTR [eax],ax
    1406:	2f                   	das    
    1407:	68 6f 6d 65 2f       	push   0x2f656d6f
    140c:	79 6f                	jns    147d <sysEnter_Vector-0x12eb83>
    140e:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    1415:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    1418:	73 73                	jae    148d <sysEnter_Vector-0x12eb73>
    141a:	2f                   	das    
    141b:	6c                   	ins    BYTE PTR es:[edi],dx
    141c:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    1423:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    1429:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    142f:	78 2d                	js     145e <sysEnter_Vector-0x12eba2>
    1431:	67 6e                	outs   dx,BYTE PTR ds:[si]
    1433:	75 2f                	jne    1464 <sysEnter_Vector-0x12eb9c>
    1435:	35 2e 33 2e 30       	xor    eax,0x302e332e
    143a:	2f                   	das    
    143b:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    1442:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    1445:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    1449:	65 00 00             	add    BYTE PTR gs:[eax],al
    144c:	73 74                	jae    14c2 <sysEnter_Vector-0x12eb3e>
    144e:	72 73                	jb     14c3 <sysEnter_Vector-0x12eb3d>
    1450:	74 72                	je     14c4 <sysEnter_Vector-0x12eb3c>
    1452:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
    1455:	01 00                	add    DWORD PTR [eax],eax
    1457:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    145a:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    1461:	63 
    1462:	2e                   	cs
    1463:	68 00 02 00 00       	push   0x200
    1468:	74 69                	je     14d3 <sysEnter_Vector-0x12eb2d>
    146a:	6d                   	ins    DWORD PTR es:[edi],dx
    146b:	65                   	gs
    146c:	2e                   	cs
    146d:	68 00 03 00 00       	push   0x300
    1472:	6d                   	ins    DWORD PTR es:[edi],dx
    1473:	61                   	popa   
    1474:	6c                   	ins    BYTE PTR es:[edi],dx
    1475:	6c                   	ins    BYTE PTR es:[edi],dx
    1476:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1477:	63 2e                	arpl   WORD PTR [esi],bp
    1479:	68 00 03 00 00       	push   0x300
    147e:	6c                   	ins    BYTE PTR es:[edi],dx
    147f:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    1486:	4f                   	dec    edi
    1487:	53                   	push   ebx
    1488:	2e                   	cs
    1489:	68 00 03 00 00       	push   0x300
    148e:	00 00                	add    BYTE PTR [eax],al
    1490:	05 02 dc 17 00       	add    eax,0x17dc02
    1495:	30 03                	xor    BYTE PTR [ebx],al
    1497:	33 01                	xor    eax,DWORD PTR [ecx]
    1499:	ec                   	in     al,dx
    149a:	3d 75 5b cb 3e       	cmp    eax,0x3ecb5b75
    149f:	75 5a                	jne    14fb <sysEnter_Vector-0x12eb05>
    14a1:	08 3f                	or     BYTE PTR [edi],bh
    14a3:	2c 23                	sub    al,0x23
    14a5:	03 75 58             	add    esi,DWORD PTR [ebp+0x58]
    14a8:	1e                   	push   ds
    14a9:	00 02                	add    BYTE PTR [edx],al
    14ab:	04 01                	add    al,0x1
    14ad:	06                   	push   es
    14ae:	4a                   	dec    edx
    14af:	06                   	push   es
    14b0:	03 0f                	add    ecx,DWORD PTR [edi]
    14b2:	9e                   	sahf   
    14b3:	59                   	pop    ecx
    14b4:	02 04 00             	add    al,BYTE PTR [eax+eax*1]
    14b7:	01 01                	add    DWORD PTR [ecx],eax
    14b9:	27                   	daa    
    14ba:	03 00                	add    eax,DWORD PTR [eax]
    14bc:	00 02                	add    BYTE PTR [edx],al
    14be:	00 cc                	add    ah,cl
    14c0:	00 00                	add    BYTE PTR [eax],al
    14c2:	00 01                	add    BYTE PTR [ecx],al
    14c4:	01 fb                	add    ebx,edi
    14c6:	0e                   	push   cs
    14c7:	0d 00 01 01 01       	or     eax,0x1010100
    14cc:	01 00                	add    DWORD PTR [eax],eax
    14ce:	00 00                	add    BYTE PTR [eax],al
    14d0:	01 00                	add    DWORD PTR [eax],eax
    14d2:	00 01                	add    BYTE PTR [ecx],al
    14d4:	73 72                	jae    1548 <sysEnter_Vector-0x12eab8>
    14d6:	63 00                	arpl   WORD PTR [eax],ax
    14d8:	2f                   	das    
    14d9:	68 6f 6d 65 2f       	push   0x2f656d6f
    14de:	79 6f                	jns    154f <sysEnter_Vector-0x12eab1>
    14e0:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    14e7:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    14ea:	73 73                	jae    155f <sysEnter_Vector-0x12eaa1>
    14ec:	2f                   	das    
    14ed:	6c                   	ins    BYTE PTR es:[edi],dx
    14ee:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    14f5:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    14fb:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    1501:	78 2d                	js     1530 <sysEnter_Vector-0x12ead0>
    1503:	67 6e                	outs   dx,BYTE PTR ds:[si]
    1505:	75 2f                	jne    1536 <sysEnter_Vector-0x12eaca>
    1507:	35 2e 33 2e 30       	xor    eax,0x302e332e
    150c:	2f                   	das    
    150d:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    1514:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    1517:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    151b:	65 00 2e             	add    BYTE PTR gs:[esi],ch
    151e:	2e                   	cs
    151f:	2f                   	das    
    1520:	2e                   	cs
    1521:	2e                   	cs
    1522:	2f                   	das    
    1523:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
    1527:	6a 2f                	push   0x2f
    1529:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
    152c:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
    1533:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1534:	65                   	gs
    1535:	6c                   	ins    BYTE PTR es:[edi],dx
    1536:	2f                   	das    
    1537:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    153e:	00 00                	add    BYTE PTR [eax],al
    1540:	74 69                	je     15ab <sysEnter_Vector-0x12ea55>
    1542:	6d                   	ins    DWORD PTR es:[edi],dx
    1543:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax
    1547:	01 00                	add    DWORD PTR [eax],eax
    1549:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    154c:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    1553:	63 
    1554:	2e                   	cs
    1555:	68 00 02 00 00       	push   0x200
    155a:	74 69                	je     15c5 <sysEnter_Vector-0x12ea3b>
    155c:	6d                   	ins    DWORD PTR es:[edi],dx
    155d:	65                   	gs
    155e:	2e                   	cs
    155f:	68 00 03 00 00       	push   0x300
    1564:	6d                   	ins    DWORD PTR es:[edi],dx
    1565:	61                   	popa   
    1566:	6c                   	ins    BYTE PTR es:[edi],dx
    1567:	6c                   	ins    BYTE PTR es:[edi],dx
    1568:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1569:	63 2e                	arpl   WORD PTR [esi],bp
    156b:	68 00 03 00 00       	push   0x300
    1570:	6c                   	ins    BYTE PTR es:[edi],dx
    1571:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    1578:	4f                   	dec    edi
    1579:	53                   	push   ebx
    157a:	2e                   	cs
    157b:	68 00 03 00 00       	push   0x300
    1580:	73 79                	jae    15fb <sysEnter_Vector-0x12ea05>
    1582:	73 63                	jae    15e7 <sysEnter_Vector-0x12ea19>
    1584:	61                   	popa   
    1585:	6c                   	ins    BYTE PTR es:[edi],dx
    1586:	6c                   	ins    BYTE PTR es:[edi],dx
    1587:	73 2e                	jae    15b7 <sysEnter_Vector-0x12ea49>
    1589:	68 00 04 00 00       	push   0x400
    158e:	00 00                	add    BYTE PTR [eax],al
    1590:	05 02 4c 18 00       	add    eax,0x184c02
    1595:	30 03                	xor    BYTE PTR [ebx],al
    1597:	16                   	push   ss
    1598:	01 f3                	add    ebx,esi
    159a:	75 c9                	jne    1565 <sysEnter_Vector-0x12ea9b>
    159c:	3d 31 08 21 84       	cmp    eax,0x84210831
    15a1:	76 02                	jbe    15a5 <sysEnter_Vector-0x12ea5b>
    15a3:	24 13                	and    al,0x13
    15a5:	08 22                	or     BYTE PTR [edx],ah
    15a7:	02 2e                	add    ch,BYTE PTR [esi]
    15a9:	13 02                	adc    eax,DWORD PTR [edx]
    15ab:	2f                   	das    
    15ac:	13 08                	adc    ecx,DWORD PTR [eax]
    15ae:	67 02 2d             	add    ch,BYTE PTR [di]
    15b1:	13 2f                	adc    ebp,DWORD PTR [edi]
    15b3:	00 02                	add    BYTE PTR [edx],al
    15b5:	04 01                	add    al,0x1
    15b7:	06                   	push   es
    15b8:	9e                   	sahf   
    15b9:	00 02                	add    BYTE PTR [edx],al
    15bb:	04 04                	add    al,0x4
    15bd:	02 23                	add    ah,BYTE PTR [ebx]
    15bf:	12 00                	adc    al,BYTE PTR [eax]
    15c1:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    15c8:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    15cb:	74 00                	je     15cd <sysEnter_Vector-0x12ea33>
    15cd:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    15d0:	58                   	pop    eax
    15d1:	00 02                	add    BYTE PTR [edx],al
    15d3:	04 08                	add    al,0x8
    15d5:	06                   	push   es
    15d6:	3d 48 00 02 04       	cmp    eax,0x4020048
    15db:	01 06                	add    DWORD PTR [esi],eax
    15dd:	9e                   	sahf   
    15de:	00 02                	add    BYTE PTR [edx],al
    15e0:	04 04                	add    al,0x4
    15e2:	02 23                	add    ah,BYTE PTR [ebx]
    15e4:	12 00                	adc    al,BYTE PTR [eax]
    15e6:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    15ed:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    15f0:	74 00                	je     15f2 <sysEnter_Vector-0x12ea0e>
    15f2:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    15f5:	58                   	pop    eax
    15f6:	06                   	push   es
    15f7:	94                   	xchg   esp,eax
    15f8:	e5 91                	in     eax,0x91
    15fa:	9f                   	lahf   
    15fb:	59                   	pop    ecx
    15fc:	00 02                	add    BYTE PTR [edx],al
    15fe:	04 01                	add    al,0x1
    1600:	06                   	push   es
    1601:	9e                   	sahf   
    1602:	00 02                	add    BYTE PTR [edx],al
    1604:	04 04                	add    al,0x4
    1606:	02 23                	add    ah,BYTE PTR [ebx]
    1608:	12 00                	adc    al,BYTE PTR [eax]
    160a:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    1611:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1614:	74 00                	je     1616 <sysEnter_Vector-0x12e9ea>
    1616:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1619:	58                   	pop    eax
    161a:	00 02                	add    BYTE PTR [edx],al
    161c:	04 08                	add    al,0x8
    161e:	06                   	push   es
    161f:	08 9f e2 00 02 04    	or     BYTE PTR [edi+0x40200e2],bl
    1625:	01 06                	add    DWORD PTR [esi],eax
    1627:	9e                   	sahf   
    1628:	00 02                	add    BYTE PTR [edx],al
    162a:	04 04                	add    al,0x4
    162c:	02 23                	add    ah,BYTE PTR [ebx]
    162e:	12 00                	adc    al,BYTE PTR [eax]
    1630:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    1637:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    163a:	74 00                	je     163c <sysEnter_Vector-0x12e9c4>
    163c:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    163f:	58                   	pop    eax
    1640:	06                   	push   es
    1641:	08 f6                	or     dh,dh
    1643:	d7                   	xlat   BYTE PTR ds:[ebx]
    1644:	9f                   	lahf   
    1645:	3d 68 08 16 08       	cmp    eax,0x8160868
    164a:	3d 08 4b 5a 08       	cmp    eax,0x85a4b08
    164f:	15 08 3d 08 3d       	adc    eax,0x3d083d08
    1654:	5a                   	pop    edx
    1655:	08 44 02 2e          	or     BYTE PTR [edx+eax*1+0x2e],al
    1659:	13 02                	adc    eax,DWORD PTR [edx]
    165b:	3a 13                	cmp    dl,BYTE PTR [ebx]
    165d:	91                   	xchg   ecx,eax
    165e:	c9                   	leave  
    165f:	e6 02                	out    0x2,al
    1661:	2f                   	das    
    1662:	13 02                	adc    eax,DWORD PTR [edx]
    1664:	3c 13                	cmp    al,0x13
    1666:	9f                   	lahf   
    1667:	e5 e6                	in     eax,0xe6
    1669:	08 c9                	or     cl,cl
    166b:	02 2c 13             	add    ch,BYTE PTR [ebx+edx*1]
    166e:	9f                   	lahf   
    166f:	e5 4c                	in     eax,0x4c
    1671:	02 29                	add    ch,BYTE PTR [ecx]
    1673:	13 02                	adc    eax,DWORD PTR [edx]
    1675:	2b 13                	sub    edx,DWORD PTR [ebx]
    1677:	9f                   	lahf   
    1678:	e5 e6                	in     eax,0xe6
    167a:	bb 59 08 83 e5       	mov    ebx,0xe5830859
    167f:	a0 00 02 04 01       	mov    al,ds:0x1040200
    1684:	06                   	push   es
    1685:	c8 00 02 04          	enter  0x200,0x4
    1689:	04 02                	add    al,0x2
    168b:	2c 12                	sub    al,0x12
    168d:	00 02                	add    BYTE PTR [edx],al
    168f:	04 05                	add    al,0x5
    1691:	02 2f                	add    ch,BYTE PTR [edi]
    1693:	12 00                	adc    al,BYTE PTR [eax]
    1695:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1698:	74 00                	je     169a <sysEnter_Vector-0x12e966>
    169a:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    169d:	58                   	pop    eax
    169e:	06                   	push   es
    169f:	08 99 a5 59 00 02    	or     BYTE PTR [ecx+0x20059a5],bl
    16a5:	04 01                	add    al,0x1
    16a7:	06                   	push   es
    16a8:	c8 00 02 04          	enter  0x200,0x4
    16ac:	04 02                	add    al,0x2
    16ae:	2c 12                	sub    al,0x12
    16b0:	00 02                	add    BYTE PTR [edx],al
    16b2:	04 05                	add    al,0x5
    16b4:	02 2f                	add    ch,BYTE PTR [edi]
    16b6:	12 00                	adc    al,BYTE PTR [eax]
    16b8:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    16bb:	74 00                	je     16bd <sysEnter_Vector-0x12e943>
    16bd:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    16c0:	58                   	pop    eax
    16c1:	00 02                	add    BYTE PTR [edx],al
    16c3:	04 08                	add    al,0x8
    16c5:	06                   	push   es
    16c6:	08 9f 08 91 9f e0    	or     BYTE PTR [edi-0x1f606ef8],bl
    16cc:	00 02                	add    BYTE PTR [edx],al
    16ce:	04 01                	add    al,0x1
    16d0:	06                   	push   es
    16d1:	c8 00 02 04          	enter  0x200,0x4
    16d5:	04 02                	add    al,0x2
    16d7:	2c 12                	sub    al,0x12
    16d9:	00 02                	add    BYTE PTR [edx],al
    16db:	04 05                	add    al,0x5
    16dd:	02 2f                	add    ch,BYTE PTR [edi]
    16df:	12 00                	adc    al,BYTE PTR [eax]
    16e1:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    16e4:	74 00                	je     16e6 <sysEnter_Vector-0x12e91a>
    16e6:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    16e9:	58                   	pop    eax
    16ea:	06                   	push   es
    16eb:	08 f9                	or     cl,bh
    16ed:	bb 75 00 02 04       	mov    ebx,0x4020075
    16f2:	01 06                	add    DWORD PTR [esi],eax
    16f4:	08 2e                	or     BYTE PTR [esi],ch
    16f6:	06                   	push   es
    16f7:	9f                   	lahf   
    16f8:	75 75                	jne    176f <sysEnter_Vector-0x12e891>
    16fa:	7b d8                	jnp    16d4 <sysEnter_Vector-0x12e92c>
    16fc:	00 02                	add    BYTE PTR [edx],al
    16fe:	04 01                	add    al,0x1
    1700:	06                   	push   es
    1701:	c8 06 75 e5          	enter  0x7506,0xe5
    1705:	00 02                	add    BYTE PTR [edx],al
    1707:	04 01                	add    al,0x1
    1709:	06                   	push   es
    170a:	02 22                	add    ah,BYTE PTR [edx]
    170c:	12 06                	adc    al,BYTE PTR [esi]
    170e:	4b                   	dec    ebx
    170f:	00 02                	add    BYTE PTR [edx],al
    1711:	04 01                	add    al,0x1
    1713:	06                   	push   es
    1714:	08 ba 00 02 04 03    	or     BYTE PTR [edx+0x3040200],bh
    171a:	02 22                	add    ah,BYTE PTR [edx]
    171c:	12 00                	adc    al,BYTE PTR [eax]
    171e:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1721:	74 00                	je     1723 <sysEnter_Vector-0x12e8dd>
    1723:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1726:	58                   	pop    eax
    1727:	00 02                	add    BYTE PTR [edx],al
    1729:	04 06                	add    al,0x6
    172b:	06                   	push   es
    172c:	59                   	pop    ecx
    172d:	00 02                	add    BYTE PTR [edx],al
    172f:	04 01                	add    al,0x1
    1731:	06                   	push   es
    1732:	02 40 12             	add    al,BYTE PTR [eax+0x12]
    1735:	00 02                	add    BYTE PTR [edx],al
    1737:	04 03                	add    al,0x3
    1739:	02 42 12             	add    al,BYTE PTR [edx+0x12]
    173c:	00 02                	add    BYTE PTR [edx],al
    173e:	04 04                	add    al,0x4
    1740:	74 00                	je     1742 <sysEnter_Vector-0x12e8be>
    1742:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1745:	58                   	pop    eax
    1746:	00 02                	add    BYTE PTR [edx],al
    1748:	04 06                	add    al,0x6
    174a:	06                   	push   es
    174b:	59                   	pop    ecx
    174c:	00 02                	add    BYTE PTR [edx],al
    174e:	04 01                	add    al,0x1
    1750:	06                   	push   es
    1751:	02 43 12             	add    al,BYTE PTR [ebx+0x12]
    1754:	00 02                	add    BYTE PTR [edx],al
    1756:	04 03                	add    al,0x3
    1758:	02 48 12             	add    cl,BYTE PTR [eax+0x12]
    175b:	00 02                	add    BYTE PTR [edx],al
    175d:	04 04                	add    al,0x4
    175f:	74 00                	je     1761 <sysEnter_Vector-0x12e89f>
    1761:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1764:	58                   	pop    eax
    1765:	00 02                	add    BYTE PTR [edx],al
    1767:	04 06                	add    al,0x6
    1769:	06                   	push   es
    176a:	5a                   	pop    edx
    176b:	00 02                	add    BYTE PTR [edx],al
    176d:	04 06                	add    al,0x6
    176f:	c9                   	leave  
    1770:	2f                   	das    
    1771:	00 02                	add    BYTE PTR [edx],al
    1773:	04 01                	add    al,0x1
    1775:	06                   	push   es
    1776:	9e                   	sahf   
    1777:	00 02                	add    BYTE PTR [edx],al
    1779:	04 04                	add    al,0x4
    177b:	02 23                	add    ah,BYTE PTR [ebx]
    177d:	12 00                	adc    al,BYTE PTR [eax]
    177f:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    1786:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1789:	74 00                	je     178b <sysEnter_Vector-0x12e875>
    178b:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    178e:	58                   	pop    eax
    178f:	00 02                	add    BYTE PTR [edx],al
    1791:	04 08                	add    al,0x8
    1793:	06                   	push   es
    1794:	08 75 48             	or     BYTE PTR [ebp+0x48],dh
    1797:	e8 bb 00 02 04       	call   4021857 <sysEnter_Vector+0x3ef1857>
    179c:	01 06                	add    DWORD PTR [esi],eax
    179e:	ba 06 4b 68 91       	mov    edx,0x91684b06
    17a3:	02 31                	add    dh,BYTE PTR [ecx]
    17a5:	14 02                	adc    al,0x2
    17a7:	2c 14                	sub    al,0x14
    17a9:	00 02                	add    BYTE PTR [edx],al
    17ab:	04 01                	add    al,0x1
    17ad:	06                   	push   es
    17ae:	02 29                	add    ch,BYTE PTR [ecx]
    17b0:	12 06                	adc    al,BYTE PTR [esi]
    17b2:	4b                   	dec    ebx
    17b3:	bd 00 02 04 01       	mov    ebp,0x1040200
    17b8:	06                   	push   es
    17b9:	ba 00 02 04 03       	mov    edx,0x3040200
    17be:	06                   	push   es
    17bf:	08 59 00             	or     BYTE PTR [ecx+0x0],bl
    17c2:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
    17c5:	81 4b e5 4c ae 9f ae 	or     DWORD PTR [ebx-0x1b],0xae9fae4c
    17cc:	77 00                	ja     17ce <sysEnter_Vector-0x12e832>
    17ce:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    17d1:	06                   	push   es
    17d2:	82                   	(bad)  
    17d3:	06                   	push   es
    17d4:	4b                   	dec    ebx
    17d5:	68 00 02 04 01       	push   0x1040200
    17da:	06                   	push   es
    17db:	66 06                	pushw  es
    17dd:	85 3d 02 08 00 01    	test   DWORD PTR ds:0x1000802,edi
    17e3:	01                   	.byte 0x1

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
 15c:	64 00 63 68          	add    BYTE PTR fs:[ebx+0x68],ah
 160:	61                   	popa   
 161:	72 73                	jb     1d6 <sysEnter_Vector-0x12fe2a>
 163:	00 2e                	add    BYTE PTR [esi],ch
 165:	2e                   	cs
 166:	2f                   	das    
 167:	2e                   	cs
 168:	2e                   	cs
 169:	2f                   	das    
 16a:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 16e:	6a 2f                	push   0x2f
 170:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 173:	69 73 4f 53 2f 73 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72732f53
 17a:	63 2f                	arpl   WORD PTR [edi],bp
 17c:	73 74                	jae    1f2 <sysEnter_Vector-0x12fe0e>
 17e:	72 69                	jb     1e9 <sysEnter_Vector-0x12fe17>
 180:	6e                   	outs   dx,BYTE PTR ds:[esi]
 181:	67 73 2f             	addr16 jae 1b3 <sysEnter_Vector-0x12fe4d>
 184:	73 74                	jae    1fa <sysEnter_Vector-0x12fe06>
 186:	72 63                	jb     1eb <sysEnter_Vector-0x12fe15>
 188:	73 70                	jae    1fa <sysEnter_Vector-0x12fe06>
 18a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 18b:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 18e:	73 74                	jae    204 <sysEnter_Vector-0x12fdfc>
 190:	72 63                	jb     1f5 <sysEnter_Vector-0x12fe0b>
 192:	73 70                	jae    204 <sysEnter_Vector-0x12fdfc>
 194:	6e                   	outs   dx,BYTE PTR ds:[esi]
 195:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 198:	72 63                	jb     1fd <sysEnter_Vector-0x12fe03>
 19a:	73 70                	jae    20c <sysEnter_Vector-0x12fdf4>
 19c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 19d:	49                   	dec    ecx
 19e:	00 2e                	add    BYTE PTR [esi],ch
 1a0:	2e                   	cs
 1a1:	2f                   	das    
 1a2:	2e                   	cs
 1a3:	2e                   	cs
 1a4:	2f                   	das    
 1a5:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 1a9:	6a 2f                	push   0x2f
 1ab:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 1ae:	69 73 4f 53 2f 73 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72732f53
 1b5:	63 2f                	arpl   WORD PTR [edi],bp
 1b7:	73 74                	jae    22d <sysEnter_Vector-0x12fdd3>
 1b9:	72 69                	jb     224 <sysEnter_Vector-0x12fddc>
 1bb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1bc:	67 73 2f             	addr16 jae 1ee <sysEnter_Vector-0x12fe12>
 1bf:	73 74                	jae    235 <sysEnter_Vector-0x12fdcb>
 1c1:	72 74                	jb     237 <sysEnter_Vector-0x12fdc9>
 1c3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1c4:	6b 2e 63             	imul   ebp,DWORD PTR [esi],0x63
 1c7:	00 64 65 6c          	add    BYTE PTR [ebp+eiz*2+0x6c],ah
 1cb:	69 6d 00 6c 61 73 74 	imul   ebp,DWORD PTR [ebp+0x0],0x7473616c
 1d2:	73 00                	jae    1d4 <sysEnter_Vector-0x12fe2c>
 1d4:	73 74                	jae    24a <sysEnter_Vector-0x12fdb6>
 1d6:	72 74                	jb     24c <sysEnter_Vector-0x12fdb4>
 1d8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1d9:	6b 00 69             	imul   eax,DWORD PTR [eax],0x69
 1dc:	74 6f                	je     24d <sysEnter_Vector-0x12fdb3>
 1de:	61                   	popa   
 1df:	49                   	dec    ecx
 1e0:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 1e3:	63 2f                	arpl   WORD PTR [edi],bp
 1e5:	61                   	popa   
 1e6:	73 63                	jae    24b <sysEnter_Vector-0x12fdb5>
 1e8:	69 69 2e 63 00 61 74 	imul   ebp,DWORD PTR [ecx+0x2e],0x74610063
 1ef:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1f0:	69 00 73 74 72 6c    	imul   eax,DWORD PTR [eax],0x6c727473
 1f6:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 1f8:	49                   	dec    ecx
 1f9:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 1fc:	76 65                	jbe    263 <sysEnter_Vector-0x12fd9d>
 1fe:	72 73                	jb     273 <sysEnter_Vector-0x12fd8d>
 200:	65                   	gs
 201:	49                   	dec    ecx
 202:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 205:	67 6e                	outs   dx,BYTE PTR ds:[si]
 207:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 20a:	72 65                	jb     271 <sysEnter_Vector-0x12fd8f>
 20c:	61                   	popa   
 20d:	6d                   	ins    DWORD PTR es:[edi],dx
 20e:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 211:	53                   	push   ebx
 212:	43                   	inc    ebx
 213:	41                   	inc    ecx
 214:	4c                   	dec    esp
 215:	4c                   	dec    esp
 216:	5f                   	pop    edi
 217:	47                   	inc    edi
 218:	45                   	inc    ebp
 219:	54                   	push   esp
 21a:	54                   	push   esp
 21b:	49                   	dec    ecx
 21c:	43                   	inc    ebx
 21d:	4b                   	dec    ebx
 21e:	53                   	push   ebx
 21f:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 222:	53                   	push   ebx
 223:	43                   	inc    ebx
 224:	41                   	inc    ecx
 225:	4c                   	dec    esp
 226:	4c                   	dec    esp
 227:	5f                   	pop    edi
 228:	48                   	dec    eax
 229:	4c                   	dec    esp
 22a:	54                   	push   esp
 22b:	00 62 75             	add    BYTE PTR [edx+0x75],ah
 22e:	66                   	data16
 22f:	66                   	data16
 230:	65                   	gs
 231:	72 00                	jb     233 <sysEnter_Vector-0x12fdcd>
 233:	67                   	addr16
 234:	65                   	gs
 235:	74 73                	je     2aa <sysEnter_Vector-0x12fd56>
 237:	45                   	inc    ebp
 238:	72 72                	jb     2ac <sysEnter_Vector-0x12fd54>
 23a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 23b:	72 00                	jb     23d <sysEnter_Vector-0x12fdc3>
 23d:	53                   	push   ebx
 23e:	59                   	pop    ecx
 23f:	53                   	push   ebx
 240:	43                   	inc    ebx
 241:	41                   	inc    ecx
 242:	4c                   	dec    esp
 243:	4c                   	dec    esp
 244:	5f                   	pop    edi
 245:	47                   	inc    edi
 246:	45                   	inc    ebp
 247:	54                   	push   esp
 248:	43                   	inc    ebx
 249:	57                   	push   edi
 24a:	44                   	inc    esp
 24b:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 24e:	63 2f                	arpl   WORD PTR [edi],bp
 250:	69 6e 70 75 74 2f 69 	imul   ebp,DWORD PTR [esi+0x70],0x692f7475
 257:	6e                   	outs   dx,BYTE PTR ds:[esi]
 258:	70 75                	jo     2cf <sysEnter_Vector-0x12fd31>
 25a:	74 2e                	je     28a <sysEnter_Vector-0x12fd76>
 25c:	63 00                	arpl   WORD PTR [eax],ax
 25e:	65                   	gs
 25f:	73 79                	jae    2da <sysEnter_Vector-0x12fd26>
 261:	73 63                	jae    2c6 <sysEnter_Vector-0x12fd3a>
 263:	61                   	popa   
 264:	6c                   	ins    BYTE PTR es:[edi],dx
 265:	6c                   	ins    BYTE PTR es:[edi],dx
 266:	73 00                	jae    268 <sysEnter_Vector-0x12fd98>
 268:	53                   	push   ebx
 269:	59                   	pop    ecx
 26a:	53                   	push   ebx
 26b:	43                   	inc    ebx
 26c:	41                   	inc    ecx
 26d:	4c                   	dec    esp
 26e:	4c                   	dec    esp
 26f:	5f                   	pop    edi
 270:	57                   	push   edi
 271:	41                   	inc    ecx
 272:	49                   	dec    ecx
 273:	54                   	push   esp
 274:	46                   	inc    esi
 275:	4f                   	dec    edi
 276:	52                   	push   edx
 277:	50                   	push   eax
 278:	49                   	dec    ecx
 279:	44                   	inc    esp
 27a:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 27d:	53                   	push   ebx
 27e:	43                   	inc    ebx
 27f:	41                   	inc    ecx
 280:	4c                   	dec    esp
 281:	4c                   	dec    esp
 282:	5f                   	pop    edi
 283:	53                   	push   ebx
 284:	45                   	inc    ebp
 285:	54                   	push   esp
 286:	53                   	push   ebx
 287:	49                   	dec    ecx
 288:	47                   	inc    edi
 289:	41                   	inc    ecx
 28a:	43                   	inc    ebx
 28b:	54                   	push   esp
 28c:	49                   	dec    ecx
 28d:	4f                   	dec    edi
 28e:	4e                   	dec    esi
 28f:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 292:	63 68 61             	arpl   WORD PTR [eax+0x61],bp
 295:	72 00                	jb     297 <sysEnter_Vector-0x12fd69>
 297:	53                   	push   ebx
 298:	59                   	pop    ecx
 299:	53                   	push   ebx
 29a:	43                   	inc    ebx
 29b:	41                   	inc    ecx
 29c:	4c                   	dec    esp
 29d:	4c                   	dec    esp
 29e:	5f                   	pop    edi
 29f:	53                   	push   ebx
 2a0:	4c                   	dec    esp
 2a1:	45                   	inc    ebp
 2a2:	45                   	inc    ebp
 2a3:	50                   	push   eax
 2a4:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 2a7:	74 63                	je     30c <sysEnter_Vector-0x12fcf4>
 2a9:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 2ac:	78 6c                	js     31a <sysEnter_Vector-0x12fce6>
 2ae:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2b0:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2b3:	53                   	push   ebx
 2b4:	43                   	inc    ebx
 2b5:	41                   	inc    ecx
 2b6:	4c                   	dec    esp
 2b7:	4c                   	dec    esp
 2b8:	5f                   	pop    edi
 2b9:	50                   	push   eax
 2ba:	52                   	push   edx
 2bb:	49                   	dec    ecx
 2bc:	4e                   	dec    esi
 2bd:	54                   	push   esp
 2be:	44                   	inc    esp
 2bf:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2c2:	53                   	push   ebx
 2c3:	43                   	inc    ebx
 2c4:	41                   	inc    ecx
 2c5:	4c                   	dec    esp
 2c6:	4c                   	dec    esp
 2c7:	5f                   	pop    edi
 2c8:	41                   	inc    ecx
 2c9:	4c                   	dec    esp
 2ca:	4c                   	dec    esp
 2cb:	4f                   	dec    edi
 2cc:	43                   	inc    ebx
 2cd:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 2d0:	74 73                	je     345 <sysEnter_Vector-0x12fcbb>
 2d2:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2d5:	53                   	push   ebx
 2d6:	43                   	inc    ebx
 2d7:	41                   	inc    ecx
 2d8:	4c                   	dec    esp
 2d9:	4c                   	dec    esp
 2da:	5f                   	pop    edi
 2db:	52                   	push   edx
 2dc:	45                   	inc    ebp
 2dd:	41                   	inc    ecx
 2de:	44                   	inc    esp
 2df:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2e2:	53                   	push   ebx
 2e3:	43                   	inc    ebx
 2e4:	41                   	inc    ecx
 2e5:	4c                   	dec    esp
 2e6:	4c                   	dec    esp
 2e7:	5f                   	pop    edi
 2e8:	45                   	inc    ebp
 2e9:	58                   	pop    eax
 2ea:	45                   	inc    ebp
 2eb:	43                   	inc    ebx
 2ec:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2ef:	53                   	push   ebx
 2f0:	43                   	inc    ebx
 2f1:	41                   	inc    ecx
 2f2:	4c                   	dec    esp
 2f3:	4c                   	dec    esp
 2f4:	5f                   	pop    edi
 2f5:	45                   	inc    ebp
 2f6:	4e                   	dec    esi
 2f7:	44                   	inc    esp
 2f8:	50                   	push   eax
 2f9:	52                   	push   edx
 2fa:	4f                   	dec    edi
 2fb:	43                   	inc    ebx
 2fc:	45                   	inc    ebp
 2fd:	53                   	push   ebx
 2fe:	53                   	push   ebx
 2ff:	00 70 75             	add    BYTE PTR [eax+0x75],dh
 302:	74 63                	je     367 <sysEnter_Vector-0x12fc99>
 304:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 307:	53                   	push   ebx
 308:	43                   	inc    ebx
 309:	41                   	inc    ecx
 30a:	4c                   	dec    esp
 30b:	4c                   	dec    esp
 30c:	5f                   	pop    edi
 30d:	52                   	push   edx
 30e:	45                   	inc    ebp
 30f:	47                   	inc    edi
 310:	45                   	inc    ebp
 311:	58                   	pop    eax
 312:	49                   	dec    ecx
 313:	54                   	push   esp
 314:	48                   	dec    eax
 315:	41                   	inc    ecx
 316:	4e                   	dec    esi
 317:	44                   	inc    esp
 318:	4c                   	dec    esp
 319:	45                   	inc    ebp
 31a:	52                   	push   edx
 31b:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 31e:	53                   	push   ebx
 31f:	43                   	inc    ebx
 320:	41                   	inc    ecx
 321:	4c                   	dec    esp
 322:	4c                   	dec    esp
 323:	5f                   	pop    edi
 324:	46                   	inc    esi
 325:	52                   	push   edx
 326:	45                   	inc    ebp
 327:	45                   	inc    ebp
 328:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 32b:	53                   	push   ebx
 32c:	43                   	inc    ebx
 32d:	41                   	inc    ecx
 32e:	4c                   	dec    esp
 32f:	4c                   	dec    esp
 330:	5f                   	pop    edi
 331:	53                   	push   ebx
 332:	54                   	push   esp
 333:	4f                   	dec    edi
 334:	50                   	push   eax
 335:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 338:	53                   	push   ebx
 339:	43                   	inc    ebx
 33a:	41                   	inc    ecx
 33b:	4c                   	dec    esp
 33c:	4c                   	dec    esp
 33d:	5f                   	pop    edi
 33e:	57                   	push   edi
 33f:	52                   	push   edx
 340:	49                   	dec    ecx
 341:	54                   	push   esp
 342:	45                   	inc    ebp
 343:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 346:	53                   	push   ebx
 347:	43                   	inc    ebx
 348:	41                   	inc    ecx
 349:	4c                   	dec    esp
 34a:	4c                   	dec    esp
 34b:	5f                   	pop    edi
 34c:	49                   	dec    ecx
 34d:	4e                   	dec    esi
 34e:	56                   	push   esi
 34f:	41                   	inc    ecx
 350:	4c                   	dec    esp
 351:	49                   	dec    ecx
 352:	44                   	inc    esp
 353:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 356:	53                   	push   ebx
 357:	43                   	inc    ebx
 358:	41                   	inc    ecx
 359:	4c                   	dec    esp
 35a:	4c                   	dec    esp
 35b:	5f                   	pop    edi
 35c:	52                   	push   edx
 35d:	45                   	inc    ebp
 35e:	42                   	inc    edx
 35f:	4f                   	dec    edi
 360:	4f                   	dec    edi
 361:	54                   	push   esp
 362:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 365:	53                   	push   ebx
 366:	43                   	inc    ebx
 367:	41                   	inc    ecx
 368:	4c                   	dec    esp
 369:	4c                   	dec    esp
 36a:	5f                   	pop    edi
 36b:	53                   	push   ebx
 36c:	45                   	inc    ebp
 36d:	54                   	push   esp
 36e:	50                   	push   eax
 36f:	52                   	push   edx
 370:	49                   	dec    ecx
 371:	4f                   	dec    edi
 372:	52                   	push   edx
 373:	49                   	dec    ecx
 374:	54                   	push   esp
 375:	59                   	pop    ecx
 376:	00 6c 62 75          	add    BYTE PTR [edx+eiz*2+0x75],ch
 37a:	66                   	data16
 37b:	00 70 75             	add    BYTE PTR [eax+0x75],dh
 37e:	74 73                	je     3f3 <sysEnter_Vector-0x12fc0d>
 380:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 383:	53                   	push   ebx
 384:	43                   	inc    ebx
 385:	41                   	inc    ecx
 386:	4c                   	dec    esp
 387:	4c                   	dec    esp
 388:	5f                   	pop    edi
 389:	50                   	push   eax
 38a:	52                   	push   edx
 38b:	49                   	dec    ecx
 38c:	4e                   	dec    esi
 38d:	54                   	push   esp
 38e:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 391:	74 56                	je     3e9 <sysEnter_Vector-0x12fc17>
 393:	61                   	popa   
 394:	6c                   	ins    BYTE PTR es:[edi],dx
 395:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 399:	68 6f 75 72 00       	push   0x72756f
 39e:	73 69                	jae    409 <sysEnter_Vector-0x12fbf7>
 3a0:	7a 65                	jp     407 <sysEnter_Vector-0x12fbf9>
 3a2:	5f                   	pop    edi
 3a3:	74 00                	je     3a5 <sysEnter_Vector-0x12fc5b>
 3a5:	73 6c                	jae    413 <sysEnter_Vector-0x12fbed>
 3a7:	65                   	gs
 3a8:	65                   	gs
 3a9:	70 00                	jo     3ab <sysEnter_Vector-0x12fc55>
 3ab:	73 69                	jae    416 <sysEnter_Vector-0x12fbea>
 3ad:	67 44                	addr16 inc esp
 3af:	61                   	popa   
 3b0:	74 61                	je     413 <sysEnter_Vector-0x12fbed>
 3b2:	00 74 68 65          	add    BYTE PTR [eax+ebp*2+0x65],dh
 3b6:	54                   	push   esp
 3b7:	69 6d 65 00 74 6d 5f 	imul   ebp,DWORD PTR [ebp+0x65],0x5f6d7400
 3be:	7a 6f                	jp     42f <sysEnter_Vector-0x12fbd1>
 3c0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3c1:	65 00 73 69          	add    BYTE PTR gs:[ebx+0x69],dh
 3c5:	7a 65                	jp     42c <sysEnter_Vector-0x12fbd4>
 3c7:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3cb:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
 3ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3cf:	69 74 00 70 72 69 6e 	imul   esi,DWORD PTR [eax+eax*1+0x70],0x746e6972
 3d6:	74 
 3d7:	00 5f 5f             	add    BYTE PTR [edi+0x5f],bl
 3da:	62 75 69             	bound  esi,QWORD PTR [ebp+0x69]
 3dd:	6c                   	ins    BYTE PTR es:[edi],dx
 3de:	74 69                	je     449 <sysEnter_Vector-0x12fbb7>
 3e0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3e1:	5f                   	pop    edi
 3e2:	76 61                	jbe    445 <sysEnter_Vector-0x12fbbb>
 3e4:	5f                   	pop    edi
 3e5:	6c                   	ins    BYTE PTR es:[edi],dx
 3e6:	69 73 74 00 74 6d 5f 	imul   esi,DWORD PTR [ebx+0x74],0x5f6d7400
 3ed:	6d                   	ins    DWORD PTR es:[edi],dx
 3ee:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3ef:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3f0:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 3f4:	79 65                	jns    45b <sysEnter_Vector-0x12fba5>
 3f6:	61                   	popa   
 3f7:	72 00                	jb     3f9 <sysEnter_Vector-0x12fc07>
 3f9:	67                   	addr16
 3fa:	65                   	gs
 3fb:	74 74                	je     471 <sysEnter_Vector-0x12fb8f>
 3fd:	69 6d 65 00 77 61 69 	imul   ebp,DWORD PTR [ebp+0x65],0x69617700
 404:	74 70                	je     476 <sysEnter_Vector-0x12fb8a>
 406:	69 64 00 44 65 62 75 	imul   esp,DWORD PTR [eax+eax*1+0x44],0x67756265
 40d:	67 
 40e:	4c                   	dec    esp
 40f:	65                   	gs
 410:	76 65                	jbe    477 <sysEnter_Vector-0x12fb89>
 412:	6c                   	ins    BYTE PTR es:[edi],dx
 413:	00 63 61             	add    BYTE PTR [ebx+0x61],ah
 416:	6c                   	ins    BYTE PTR es:[edi],dx
 417:	6c                   	ins    BYTE PTR es:[edi],dx
 418:	6e                   	outs   dx,BYTE PTR ds:[esi]
 419:	75 6d                	jne    488 <sysEnter_Vector-0x12fb78>
 41b:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 41f:	69 73 64 73 74 00 64 	imul   esi,DWORD PTR [ebx+0x64],0x64007473
 426:	6f                   	outs   dx,DWORD PTR ds:[esi]
 427:	5f                   	pop    edi
 428:	73 79                	jae    4a3 <sysEnter_Vector-0x12fb5d>
 42a:	73 63                	jae    48f <sysEnter_Vector-0x12fb71>
 42c:	61                   	popa   
 42d:	6c                   	ins    BYTE PTR es:[edi],dx
 42e:	6c                   	ins    BYTE PTR es:[edi],dx
 42f:	31 00                	xor    DWORD PTR [eax],eax
 431:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 433:	5f                   	pop    edi
 434:	73 79                	jae    4af <sysEnter_Vector-0x12fb51>
 436:	73 63                	jae    49b <sysEnter_Vector-0x12fb65>
 438:	61                   	popa   
 439:	6c                   	ins    BYTE PTR es:[edi],dx
 43a:	6c                   	ins    BYTE PTR es:[edi],dx
 43b:	32 00                	xor    al,BYTE PTR [eax]
 43d:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 43f:	5f                   	pop    edi
 440:	73 79                	jae    4bb <sysEnter_Vector-0x12fb45>
 442:	73 63                	jae    4a7 <sysEnter_Vector-0x12fb59>
 444:	61                   	popa   
 445:	6c                   	ins    BYTE PTR es:[edi],dx
 446:	6c                   	ins    BYTE PTR es:[edi],dx
 447:	33 00                	xor    eax,DWORD PTR [eax]
 449:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 44b:	5f                   	pop    edi
 44c:	73 79                	jae    4c7 <sysEnter_Vector-0x12fb39>
 44e:	73 63                	jae    4b3 <sysEnter_Vector-0x12fb4d>
 450:	61                   	popa   
 451:	6c                   	ins    BYTE PTR es:[edi],dx
 452:	6c                   	ins    BYTE PTR es:[edi],dx
 453:	34 00                	xor    al,0x0
 455:	6c                   	ins    BYTE PTR es:[edi],dx
 456:	69 62 63 49 6e 69 74 	imul   esp,DWORD PTR [edx+0x63],0x74696e49
 45d:	69 61 6c 69 7a 65 64 	imul   esp,DWORD PTR [ecx+0x6c],0x64657a69
 464:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 468:	6d                   	ins    DWORD PTR es:[edi],dx
 469:	69 6e 00 74 69 63 6b 	imul   ebp,DWORD PTR [esi+0x0],0x6b636974
 470:	73 00                	jae    472 <sysEnter_Vector-0x12fb8e>
 472:	74 6d                	je     4e1 <sysEnter_Vector-0x12fb1f>
 474:	5f                   	pop    edi
 475:	79 64                	jns    4db <sysEnter_Vector-0x12fb25>
 477:	61                   	popa   
 478:	79 00                	jns    47a <sysEnter_Vector-0x12fb86>
 47a:	5f                   	pop    edi
 47b:	5f                   	pop    edi
 47c:	67 6e                	outs   dx,BYTE PTR ds:[si]
 47e:	75 63                	jne    4e3 <sysEnter_Vector-0x12fb1d>
 480:	5f                   	pop    edi
 481:	76 61                	jbe    4e4 <sysEnter_Vector-0x12fb1c>
 483:	5f                   	pop    edi
 484:	6c                   	ins    BYTE PTR es:[edi],dx
 485:	69 73 74 00 70 72 69 	imul   esi,DWORD PTR [ebx+0x74],0x69727000
 48c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 48d:	74 64                	je     4f3 <sysEnter_Vector-0x12fb0d>
 48f:	49                   	dec    ecx
 490:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 493:	72 61                	jb     4f6 <sysEnter_Vector-0x12fb0a>
 495:	6d                   	ins    DWORD PTR es:[edi],dx
 496:	31 00                	xor    DWORD PTR [eax],eax
 498:	70 61                	jo     4fb <sysEnter_Vector-0x12fb05>
 49a:	72 61                	jb     4fd <sysEnter_Vector-0x12fb03>
 49c:	6d                   	ins    DWORD PTR es:[edi],dx
 49d:	32 00                	xor    al,BYTE PTR [eax]
 49f:	70 61                	jo     502 <sysEnter_Vector-0x12fafe>
 4a1:	72 61                	jb     504 <sysEnter_Vector-0x12fafc>
 4a3:	6d                   	ins    DWORD PTR es:[edi],dx
 4a4:	33 00                	xor    eax,DWORD PTR [eax]
 4a6:	66 6f                	outs   dx,WORD PTR ds:[esi]
 4a8:	72 6d                	jb     517 <sysEnter_Vector-0x12fae9>
 4aa:	61                   	popa   
 4ab:	74 00                	je     4ad <sysEnter_Vector-0x12fb53>
 4ad:	74 6d                	je     51c <sysEnter_Vector-0x12fae4>
 4af:	5f                   	pop    edi
 4b0:	67 6d                	ins    DWORD PTR es:[di],dx
 4b2:	74 6f                	je     523 <sysEnter_Vector-0x12fadd>
 4b4:	66                   	data16
 4b5:	66                   	data16
 4b6:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 4b9:	67 6e                	outs   dx,BYTE PTR ds:[si]
 4bb:	61                   	popa   
 4bc:	6c                   	ins    BYTE PTR es:[edi],dx
 4bd:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 4c0:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 4c3:	5f                   	pop    edi
 4c4:	5f                   	pop    edi
 4c5:	73 65                	jae    52c <sysEnter_Vector-0x12fad4>
 4c7:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 4ca:	64                   	fs
 4cb:	73 00                	jae    4cd <sysEnter_Vector-0x12fb33>
 4cd:	73 72                	jae    541 <sysEnter_Vector-0x12fabf>
 4cf:	63 2f                	arpl   WORD PTR [edi],bp
 4d1:	6c                   	ins    BYTE PTR es:[edi],dx
 4d2:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 4d9:	4f                   	dec    edi
 4da:	53                   	push   ebx
 4db:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 4de:	61                   	popa   
 4df:	72 67                	jb     548 <sysEnter_Vector-0x12fab8>
 4e1:	63 00                	arpl   WORD PTR [eax],ax
 4e3:	74 6d                	je     552 <sysEnter_Vector-0x12faae>
 4e5:	5f                   	pop    edi
 4e6:	77 64                	ja     54c <sysEnter_Vector-0x12fab4>
 4e8:	61                   	popa   
 4e9:	79 00                	jns    4eb <sysEnter_Vector-0x12fb15>
 4eb:	74 6d                	je     55a <sysEnter_Vector-0x12faa6>
 4ed:	5f                   	pop    edi
 4ee:	6d                   	ins    DWORD PTR es:[edi],dx
 4ef:	64                   	fs
 4f0:	61                   	popa   
 4f1:	79 00                	jns    4f3 <sysEnter_Vector-0x12fb0d>
 4f3:	6c                   	ins    BYTE PTR es:[edi],dx
 4f4:	69 62 63 5f 63 6c 65 	imul   esp,DWORD PTR [edx+0x63],0x656c635f
 4fb:	61                   	popa   
 4fc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4fd:	75 70                	jne    56f <sysEnter_Vector-0x12fa91>
 4ff:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 503:	73 65                	jae    56a <sysEnter_Vector-0x12fa96>
 505:	63 00                	arpl   WORD PTR [eax],ax
 507:	61                   	popa   
 508:	72 67                	jb     571 <sysEnter_Vector-0x12fa8f>
 50a:	76 00                	jbe    50c <sysEnter_Vector-0x12faf4>
 50c:	73 69                	jae    577 <sysEnter_Vector-0x12fa89>
 50e:	67 48                	addr16 dec eax
 510:	61                   	popa   
 511:	6e                   	outs   dx,BYTE PTR ds:[esi]
 512:	64                   	fs
 513:	6c                   	ins    BYTE PTR es:[edi],dx
 514:	65                   	gs
 515:	72 00                	jb     517 <sysEnter_Vector-0x12fae9>
 517:	6d                   	ins    DWORD PTR es:[edi],dx
 518:	6f                   	outs   dx,DWORD PTR ds:[esi]
 519:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
 520:	6e 
 521:	61                   	popa   
 522:	6c                   	ins    BYTE PTR es:[edi],dx
 523:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 526:	67 73 00             	addr16 jae 529 <sysEnter_Vector-0x12fad7>
 529:	70 72                	jo     59d <sysEnter_Vector-0x12fa63>
 52b:	69 6e 74 49 00 73 74 	imul   ebp,DWORD PTR [esi+0x74],0x74730049
 532:	6f                   	outs   dx,DWORD PTR ds:[esi]
 533:	70 00                	jo     535 <sysEnter_Vector-0x12facb>
 535:	67                   	addr16
 536:	65                   	gs
 537:	74 63                	je     59c <sysEnter_Vector-0x12fa64>
 539:	77 64                	ja     59f <sysEnter_Vector-0x12fa61>
 53b:	00 61 6c             	add    BYTE PTR [ecx+0x6c],ah
 53e:	6c                   	ins    BYTE PTR es:[edi],dx
 53f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 540:	63 61 74             	arpl   WORD PTR [ecx+0x74],sp
 543:	65                   	gs
 544:	64                   	fs
 545:	50                   	push   eax
 546:	74 72                	je     5ba <sysEnter_Vector-0x12fa46>
 548:	00 66 70             	add    BYTE PTR [esi+0x70],ah
 54b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 54c:	69 6e 74 65 72 00 6e 	imul   ebp,DWORD PTR [esi+0x74],0x6e007265
 553:	65                   	gs
 554:	77 53                	ja     5a9 <sysEnter_Vector-0x12fa57>
 556:	69 7a 65 00 6d 61 6c 	imul   edi,DWORD PTR [edx+0x65],0x6c616d00
 55d:	6c                   	ins    BYTE PTR es:[edi],dx
 55e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 55f:	63 5f 63             	arpl   WORD PTR [edi+0x63],bx
 562:	6c                   	ins    BYTE PTR es:[edi],dx
 563:	65                   	gs
 564:	61                   	popa   
 565:	6e                   	outs   dx,BYTE PTR ds:[esi]
 566:	75 70                	jne    5d8 <sysEnter_Vector-0x12fa28>
 568:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 56b:	72 6b                	jb     5d8 <sysEnter_Vector-0x12fa28>
 56d:	65                   	gs
 56e:	72 00                	jb     570 <sysEnter_Vector-0x12fa90>
 570:	75 69                	jne    5db <sysEnter_Vector-0x12fa25>
 572:	6e                   	outs   dx,BYTE PTR ds:[esi]
 573:	74 38                	je     5ad <sysEnter_Vector-0x12fa53>
 575:	5f                   	pop    edi
 576:	74 00                	je     578 <sysEnter_Vector-0x12fa88>
 578:	66                   	data16
 579:	72 65                	jb     5e0 <sysEnter_Vector-0x12fa20>
 57b:	65 00 68 65          	add    BYTE PTR gs:[eax+0x65],ch
 57f:	61                   	popa   
 580:	70 50                	jo     5d2 <sysEnter_Vector-0x12fa2e>
 582:	74 72                	je     5f6 <sysEnter_Vector-0x12fa0a>
 584:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 587:	65 64 65 64 00 73 68 	gs fs gs add BYTE PTR fs:gs:[ebx+0x68],dh
 58e:	65                   	gs
 58f:	61                   	popa   
 590:	70 00                	jo     592 <sysEnter_Vector-0x12fa6e>
 592:	69 6e 55 73 65 00 69 	imul   ebp,DWORD PTR [esi+0x55],0x69006573
 599:	6e                   	outs   dx,BYTE PTR ds:[esi]
 59a:	69 74 6d 61 6c 6c 6f 	imul   esi,DWORD PTR [ebp+ebp*2+0x61],0x636f6c6c
 5a1:	63 
 5a2:	00 67 6f             	add    BYTE PTR [edi+0x6f],ah
 5a5:	74 6f                	je     616 <sysEnter_Vector-0x12f9ea>
 5a7:	48                   	dec    eax
 5a8:	65                   	gs
 5a9:	72 65                	jb     610 <sysEnter_Vector-0x12f9f0>
 5ab:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 5ae:	61                   	popa   
 5af:	70 50                	jo     601 <sysEnter_Vector-0x12f9ff>
 5b1:	74 72                	je     625 <sysEnter_Vector-0x12f9db>
 5b3:	4e                   	dec    esi
 5b4:	65                   	gs
 5b5:	78 74                	js     62b <sysEnter_Vector-0x12f9d5>
 5b7:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 5ba:	77 48                	ja     604 <sysEnter_Vector-0x12f9fc>
 5bc:	65                   	gs
 5bd:	61                   	popa   
 5be:	70 52                	jo     612 <sysEnter_Vector-0x12f9ee>
 5c0:	65                   	gs
 5c1:	71 75                	jno    638 <sysEnter_Vector-0x12f9c8>
 5c3:	69 72 65 64 54 6f 46 	imul   esi,DWORD PTR [edx+0x65],0x466f5464
 5ca:	75 6c                	jne    638 <sysEnter_Vector-0x12f9c8>
 5cc:	66 69 6c 6c 52 65 71 	imul   bp,WORD PTR [esp+ebp*2+0x52],0x7165
 5d3:	75 65                	jne    63a <sysEnter_Vector-0x12f9c6>
 5d5:	73 74                	jae    64b <sysEnter_Vector-0x12f9b5>
 5d7:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 5da:	63 2f                	arpl   WORD PTR [edi],bp
 5dc:	6d                   	ins    DWORD PTR es:[edi],dx
 5dd:	61                   	popa   
 5de:	6c                   	ins    BYTE PTR es:[edi],dx
 5df:	6c                   	ins    BYTE PTR es:[edi],dx
 5e0:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5e1:	63 2e                	arpl   WORD PTR [esi],bp
 5e3:	63 00                	arpl   WORD PTR [eax],ax
 5e5:	70 72                	jo     659 <sysEnter_Vector-0x12f9a7>
 5e7:	65                   	gs
 5e8:	76 00                	jbe    5ea <sysEnter_Vector-0x12fa16>
 5ea:	68 65 61 70 72       	push   0x72706165
 5ef:	65 63 5f 74          	arpl   WORD PTR gs:[edi+0x74],bx
 5f3:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 5f6:	63 2f                	arpl   WORD PTR [edi],bp
 5f8:	6d                   	ins    DWORD PTR es:[edi],dx
 5f9:	65                   	gs
 5fa:	6d                   	ins    DWORD PTR es:[edi],dx
 5fb:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 5fe:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 601:	64                   	fs
 602:	65                   	gs
 603:	73 74                	jae    679 <sysEnter_Vector-0x12f987>
 605:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 608:	6d                   	ins    DWORD PTR es:[edi],dx
 609:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 60c:	00 65 56             	add    BYTE PTR [ebp+0x56],ah
 60f:	61                   	popa   
 610:	6c                   	ins    BYTE PTR es:[edi],dx
 611:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 614:	6d                   	ins    DWORD PTR es:[edi],dx
 615:	73 65                	jae    67c <sysEnter_Vector-0x12f984>
 617:	74 00                	je     619 <sysEnter_Vector-0x12f9e7>
 619:	73 72                	jae    68d <sysEnter_Vector-0x12f973>
 61b:	63 2f                	arpl   WORD PTR [edi],bp
 61d:	6d                   	ins    DWORD PTR es:[edi],dx
 61e:	65                   	gs
 61f:	6d                   	ins    DWORD PTR es:[edi],dx
 620:	73 65                	jae    687 <sysEnter_Vector-0x12f979>
 622:	74 2e                	je     652 <sysEnter_Vector-0x12f9ae>
 624:	63 00                	arpl   WORD PTR [eax],ax
 626:	66 56                	push   si
 628:	61                   	popa   
 629:	6c                   	ins    BYTE PTR es:[edi],dx
 62a:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 62d:	6d                   	ins    DWORD PTR es:[edi],dx
 62e:	73 65                	jae    695 <sysEnter_Vector-0x12f96b>
 630:	74 49                	je     67b <sysEnter_Vector-0x12f985>
 632:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 635:	6e                   	outs   dx,BYTE PTR ds:[esi]
 636:	74 31                	je     669 <sysEnter_Vector-0x12f997>
 638:	36                   	ss
 639:	5f                   	pop    edi
 63a:	74 00                	je     63c <sysEnter_Vector-0x12f9c4>
 63c:	61                   	popa   
 63d:	64                   	fs
 63e:	64                   	fs
 63f:	72 00                	jb     641 <sysEnter_Vector-0x12f9bf>
 641:	6f                   	outs   dx,DWORD PTR ds:[esi]
 642:	66 66 5f             	data32 pop di
 645:	74 00                	je     647 <sysEnter_Vector-0x12f9b9>
 647:	70 72                	jo     6bb <sysEnter_Vector-0x12f945>
 649:	6f                   	outs   dx,DWORD PTR ds:[esi]
 64a:	74 00                	je     64c <sysEnter_Vector-0x12f9b4>
 64c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 64d:	66                   	data16
 64e:	66                   	data16
 64f:	73 65                	jae    6b6 <sysEnter_Vector-0x12f94a>
 651:	74 00                	je     653 <sysEnter_Vector-0x12f9ad>
 653:	6d                   	ins    DWORD PTR es:[edi],dx
 654:	6d                   	ins    DWORD PTR es:[edi],dx
 655:	61                   	popa   
 656:	70 00                	jo     658 <sysEnter_Vector-0x12f9a8>
 658:	73 72                	jae    6cc <sysEnter_Vector-0x12f934>
 65a:	63 2f                	arpl   WORD PTR [edi],bp
 65c:	6d                   	ins    DWORD PTR es:[edi],dx
 65d:	6d                   	ins    DWORD PTR es:[edi],dx
 65e:	61                   	popa   
 65f:	70 2e                	jo     68f <sysEnter_Vector-0x12f971>
 661:	63 00                	arpl   WORD PTR [eax],ax
 663:	73 5f                	jae    6c4 <sysEnter_Vector-0x12f93c>
 665:	64                   	fs
 666:	65                   	gs
 667:	76 00                	jbe    669 <sysEnter_Vector-0x12f997>
 669:	75 69                	jne    6d4 <sysEnter_Vector-0x12f92c>
 66b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 66c:	74 36                	je     6a4 <sysEnter_Vector-0x12f95c>
 66e:	34 5f                	xor    al,0x5f
 670:	74 00                	je     672 <sysEnter_Vector-0x12f98e>
 672:	6d                   	ins    DWORD PTR es:[edi],dx
 673:	6e                   	outs   dx,BYTE PTR ds:[esi]
 674:	74 5f                	je     6d5 <sysEnter_Vector-0x12f92b>
 676:	66                   	data16
 677:	6c                   	ins    BYTE PTR es:[edi],dx
 678:	61                   	popa   
 679:	67 73 00             	addr16 jae 67c <sysEnter_Vector-0x12f984>
 67c:	63 6f 6c             	arpl   WORD PTR [edi+0x6c],bp
 67f:	53                   	push   ebx
 680:	74 72                	je     6f4 <sysEnter_Vector-0x12f90c>
 682:	69 6e 67 00 6d 6b 6e 	imul   ebp,DWORD PTR [esi+0x67],0x6e6b6d00
 689:	6f                   	outs   dx,DWORD PTR ds:[esi]
 68a:	64 00 6e 65          	add    BYTE PTR fs:[esi+0x65],ch
 68e:	78 74                	js     704 <sysEnter_Vector-0x12f8fc>
 690:	00 6d 6b             	add    BYTE PTR [ebp+0x6b],ch
 693:	64 69 72 00 62 75 66 	imul   esi,DWORD PTR fs:[edx+0x0],0x66667562
 69a:	66 
 69b:	00 6d 6e             	add    BYTE PTR [ebp+0x6e],ch
 69e:	74 5f                	je     6ff <sysEnter_Vector-0x12f901>
 6a0:	73 62                	jae    704 <sysEnter_Vector-0x12f8fc>
 6a2:	00 73 5f             	add    BYTE PTR [ebx+0x5f],dh
 6a5:	6c                   	ins    BYTE PTR es:[edi],dx
 6a6:	69 73 74 00 73 75 70 	imul   esi,DWORD PTR [ebx+0x74],0x70757300
 6ad:	65                   	gs
 6ae:	72 5f                	jb     70f <sysEnter_Vector-0x12f8f1>
 6b0:	62 6c 6f 63          	bound  ebp,QWORD PTR [edi+ebp*2+0x63]
 6b4:	6b 00 69             	imul   eax,DWORD PTR [eax],0x69
 6b7:	5f                   	pop    edi
 6b8:	76 66                	jbe    720 <sysEnter_Vector-0x12f8e0>
 6ba:	73 6d                	jae    729 <sysEnter_Vector-0x12f8d7>
 6bc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6bd:	75 6e                	jne    72d <sysEnter_Vector-0x12f8d3>
 6bf:	74 00                	je     6c1 <sysEnter_Vector-0x12f93f>
 6c1:	72 65                	jb     728 <sysEnter_Vector-0x12f8d8>
 6c3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6c4:	61                   	popa   
 6c5:	6d                   	ins    DWORD PTR es:[edi],dx
 6c6:	65 00 64 5f 6e       	add    BYTE PTR gs:[edi+ebx*2+0x6e],ah
 6cb:	61                   	popa   
 6cc:	6d                   	ins    DWORD PTR es:[edi],dx
 6cd:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 6d1:	63 2f                	arpl   WORD PTR [edi],bp
 6d3:	73 74                	jae    749 <sysEnter_Vector-0x12f8b7>
 6d5:	64 69 6f 2e 63 00 64 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x65640063
 6dc:	65 
 6dd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6de:	74 72                	je     752 <sysEnter_Vector-0x12f8ae>
 6e0:	79 00                	jns    6e2 <sysEnter_Vector-0x12f91e>
 6e2:	66 69 6c 65 5f 6f 70 	imul   bp,WORD PTR [ebp+eiz*2+0x5f],0x706f
 6e9:	65                   	gs
 6ea:	72 61                	jb     74d <sysEnter_Vector-0x12f8b3>
 6ec:	74 69                	je     757 <sysEnter_Vector-0x12f8a9>
 6ee:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6ef:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6f0:	73 00                	jae    6f2 <sysEnter_Vector-0x12f90e>
 6f2:	72 6d                	jb     761 <sysEnter_Vector-0x12f89f>
 6f4:	64 69 72 00 69 5f 67 	imul   esi,DWORD PTR fs:[edx+0x0],0x69675f69
 6fb:	69 
 6fc:	64 00 64 6c 6c       	add    BYTE PTR fs:[esp+ebp*2+0x6c],ah
 701:	69 73 74 5f 74 00 72 	imul   esi,DWORD PTR [ebx+0x74],0x7200745f
 708:	65                   	gs
 709:	61                   	popa   
 70a:	64                   	fs
 70b:	43                   	inc    ebx
 70c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 70d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 70e:	73 6f                	jae    77f <sysEnter_Vector-0x12f881>
 710:	6c                   	ins    BYTE PTR es:[edi],dx
 711:	65 00 69 6e          	add    BYTE PTR gs:[ecx+0x6e],ch
 715:	6f                   	outs   dx,DWORD PTR ds:[esi]
 716:	64                   	fs
 717:	65                   	gs
 718:	5f                   	pop    edi
 719:	6f                   	outs   dx,DWORD PTR ds:[esi]
 71a:	70 65                	jo     781 <sysEnter_Vector-0x12f87f>
 71c:	72 61                	jb     77f <sysEnter_Vector-0x12f881>
 71e:	74 69                	je     789 <sysEnter_Vector-0x12f877>
 720:	6f                   	outs   dx,DWORD PTR ds:[esi]
 721:	6e                   	outs   dx,BYTE PTR ds:[esi]
 722:	73 00                	jae    724 <sysEnter_Vector-0x12f8dc>
 724:	69 5f 6f 70 66 6c 61 	imul   ebx,DWORD PTR [edi+0x6f],0x616c6670
 72b:	67 73 00             	addr16 jae 72e <sysEnter_Vector-0x12f8d2>
 72e:	66 69 6c 65 5f 6f 70 	imul   bp,WORD PTR [ebp+eiz*2+0x5f],0x706f
 735:	65                   	gs
 736:	72 61                	jb     799 <sysEnter_Vector-0x12f867>
 738:	74 69                	je     7a3 <sysEnter_Vector-0x12f85d>
 73a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 73b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 73c:	73 5f                	jae    79d <sysEnter_Vector-0x12f863>
 73e:	74 00                	je     740 <sysEnter_Vector-0x12f8c0>
 740:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 743:	66 50                	push   ax
 745:	74 72                	je     7b9 <sysEnter_Vector-0x12f847>
 747:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 74a:	64                   	fs
 74b:	65                   	gs
 74c:	76 00                	jbe    74e <sysEnter_Vector-0x12f8b2>
 74e:	6d                   	ins    DWORD PTR es:[edi],dx
 74f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 750:	76 65                	jbe    7b7 <sysEnter_Vector-0x12f849>
 752:	54                   	push   esp
 753:	6f                   	outs   dx,DWORD PTR ds:[esi]
 754:	00 77 72             	add    BYTE PTR [edi+0x72],dh
 757:	69 74 65 00 66 70 74 	imul   esi,DWORD PTR [ebp+eiz*2+0x0],0x72747066
 75e:	72 
 75f:	00 77 72             	add    BYTE PTR [edi+0x72],dh
 762:	69 74 65 43 6f 6e 73 	imul   esi,DWORD PTR [ebp+eiz*2+0x43],0x6f736e6f
 769:	6f 
 76a:	6c                   	ins    BYTE PTR es:[edi],dx
 76b:	65 00 70 61          	add    BYTE PTR gs:[eax+0x61],dh
 76f:	79 6c                	jns    7dd <sysEnter_Vector-0x12f823>
 771:	6f                   	outs   dx,DWORD PTR ds:[esi]
 772:	61                   	popa   
 773:	64 00 73 6c          	add    BYTE PTR fs:[ebx+0x6c],dh
 777:	69 73 74 68 65 61 64 	imul   esi,DWORD PTR [ebx+0x74],0x64616568
 77e:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 781:	6f                   	outs   dx,DWORD PTR ds:[esi]
 782:	70 00                	jo     784 <sysEnter_Vector-0x12f87c>
 784:	6d                   	ins    DWORD PTR es:[edi],dx
 785:	6e                   	outs   dx,BYTE PTR ds:[esi]
 786:	74 5f                	je     7e7 <sysEnter_Vector-0x12f819>
 788:	72 6f                	jb     7f9 <sysEnter_Vector-0x12f807>
 78a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 78b:	74 00                	je     78d <sysEnter_Vector-0x12f873>
 78d:	69 6f 49 6e 69 74 00 	imul   ebp,DWORD PTR [edi+0x49],0x74696e
 794:	66 6f                	outs   dx,WORD PTR ds:[esi]
 796:	70 73                	jo     80b <sysEnter_Vector-0x12f7f5>
 798:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 79b:	6c                   	ins    BYTE PTR es:[edi],dx
 79c:	65                   	gs
 79d:	5f                   	pop    edi
 79e:	74 00                	je     7a0 <sysEnter_Vector-0x12f860>
 7a0:	69 5f 66 6c 61 67 73 	imul   ebx,DWORD PTR [edi+0x66],0x7367616c
 7a7:	00 77 68             	add    BYTE PTR [edi+0x68],dh
 7aa:	61                   	popa   
 7ab:	74 65                	je     812 <sysEnter_Vector-0x12f7ee>
 7ad:	76 65                	jbe    814 <sysEnter_Vector-0x12f7ec>
 7af:	72 00                	jb     7b1 <sysEnter_Vector-0x12f84f>
 7b1:	69 5f 75 69 64 00 69 	imul   ebx,DWORD PTR [edi+0x75],0x69006469
 7b8:	5f                   	pop    edi
 7b9:	6d                   	ins    DWORD PTR es:[edi],dx
 7ba:	6f                   	outs   dx,DWORD PTR ds:[esi]
 7bb:	64 65 00 63 6f       	fs add BYTE PTR fs:gs:[ebx+0x6f],ah
 7c0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7c1:	73 6f                	jae    832 <sysEnter_Vector-0x12f7ce>
 7c3:	6c                   	ins    BYTE PTR es:[edi],dx
 7c4:	65                   	gs
 7c5:	5f                   	pop    edi
 7c6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7c7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 7c8:	64 65 00 69 6e       	fs add BYTE PTR fs:gs:[ecx+0x6e],ch
 7cd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 7ce:	64                   	fs
 7cf:	65                   	gs
 7d0:	5f                   	pop    edi
 7d1:	74 00                	je     7d3 <sysEnter_Vector-0x12f82d>
 7d3:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 7d6:	73 6f                	jae    847 <sysEnter_Vector-0x12f7b9>
 7d8:	6c                   	ins    BYTE PTR es:[edi],dx
 7d9:	65                   	gs
 7da:	5f                   	pop    edi
 7db:	66 69 6c 65 00 73 5f 	imul   bp,WORD PTR [ebp+eiz*2+0x0],0x5f73
 7e2:	72 6f                	jb     853 <sysEnter_Vector-0x12f7ad>
 7e4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 7e5:	74 00                	je     7e7 <sysEnter_Vector-0x12f819>
 7e7:	64                   	fs
 7e8:	5f                   	pop    edi
 7e9:	69 6e 6f 64 65 00 72 	imul   ebp,DWORD PTR [esi+0x6f],0x72006564
 7f0:	65                   	gs
 7f1:	61                   	popa   
 7f2:	64 00 72 65          	add    BYTE PTR fs:[edx+0x65],dh
 7f6:	73 65                	jae    85d <sysEnter_Vector-0x12f7a3>
 7f8:	74 52                	je     84c <sysEnter_Vector-0x12f7b4>
 7fa:	6f                   	outs   dx,DWORD PTR ds:[esi]
 7fb:	77 00                	ja     7fd <sysEnter_Vector-0x12f803>
 7fd:	64                   	fs
 7fe:	5f                   	pop    edi
 7ff:	70 61                	jo     862 <sysEnter_Vector-0x12f79e>
 801:	72 65                	jb     868 <sysEnter_Vector-0x12f798>
 803:	6e                   	outs   dx,BYTE PTR ds:[esi]
 804:	74 00                	je     806 <sysEnter_Vector-0x12f7fa>
 806:	66 5f                	pop    di
 808:	69 6e 6f 64 65 00 66 	imul   ebp,DWORD PTR [esi+0x6f],0x66006564
 80f:	5f                   	pop    edi
 810:	70 61                	jo     873 <sysEnter_Vector-0x12f78d>
 812:	74 68                	je     87c <sysEnter_Vector-0x12f784>
 814:	00 72 6f             	add    BYTE PTR [edx+0x6f],dh
 817:	77 53                	ja     86c <sysEnter_Vector-0x12f794>
 819:	74 72                	je     88d <sysEnter_Vector-0x12f773>
 81b:	69 6e 67 00 63 72 65 	imul   ebp,DWORD PTR [esi+0x67],0x65726300
 822:	61                   	popa   
 823:	74 65                	je     88a <sysEnter_Vector-0x12f776>
 825:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 828:	6e                   	outs   dx,BYTE PTR ds:[esi]
 829:	63 61 74             	arpl   WORD PTR [ecx+0x74],sp
 82c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 82e:	61                   	popa   
 82f:	74 65                	je     896 <sysEnter_Vector-0x12f76a>
 831:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 834:	72 63                	jb     899 <sysEnter_Vector-0x12f767>
 836:	61                   	popa   
 837:	74 49                	je     882 <sysEnter_Vector-0x12f77e>
 839:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 83c:	72 63                	jb     8a1 <sysEnter_Vector-0x12f75f>
 83e:	61                   	popa   
 83f:	74 00                	je     841 <sysEnter_Vector-0x12f7bf>
 841:	73 72                	jae    8b5 <sysEnter_Vector-0x12f74b>
 843:	63 2f                	arpl   WORD PTR [edi],bp
 845:	73 74                	jae    8bb <sysEnter_Vector-0x12f745>
 847:	72 69                	jb     8b2 <sysEnter_Vector-0x12f74e>
 849:	6e                   	outs   dx,BYTE PTR ds:[esi]
 84a:	67 73 2f             	addr16 jae 87c <sysEnter_Vector-0x12f784>
 84d:	73 74                	jae    8c3 <sysEnter_Vector-0x12f73d>
 84f:	72 63                	jb     8b4 <sysEnter_Vector-0x12f74c>
 851:	61                   	popa   
 852:	74 2e                	je     882 <sysEnter_Vector-0x12f77e>
 854:	63 00                	arpl   WORD PTR [eax],ax
 856:	73 74                	jae    8cc <sysEnter_Vector-0x12f734>
 858:	72 63                	jb     8bd <sysEnter_Vector-0x12f743>
 85a:	6d                   	ins    DWORD PTR es:[edi],dx
 85b:	70 00                	jo     85d <sysEnter_Vector-0x12f7a3>
 85d:	73 72                	jae    8d1 <sysEnter_Vector-0x12f72f>
 85f:	63 2f                	arpl   WORD PTR [edi],bp
 861:	73 74                	jae    8d7 <sysEnter_Vector-0x12f729>
 863:	72 69                	jb     8ce <sysEnter_Vector-0x12f732>
 865:	6e                   	outs   dx,BYTE PTR ds:[esi]
 866:	67 73 2f             	addr16 jae 898 <sysEnter_Vector-0x12f768>
 869:	73 74                	jae    8df <sysEnter_Vector-0x12f721>
 86b:	72 63                	jb     8d0 <sysEnter_Vector-0x12f730>
 86d:	6d                   	ins    DWORD PTR es:[edi],dx
 86e:	70 2e                	jo     89e <sysEnter_Vector-0x12f762>
 870:	63 00                	arpl   WORD PTR [eax],ax
 872:	73 74                	jae    8e8 <sysEnter_Vector-0x12f718>
 874:	72 63                	jb     8d9 <sysEnter_Vector-0x12f727>
 876:	70 79                	jo     8f1 <sysEnter_Vector-0x12f70f>
 878:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 87b:	75 6e                	jne    8eb <sysEnter_Vector-0x12f715>
 87d:	74 00                	je     87f <sysEnter_Vector-0x12f781>
 87f:	73 74                	jae    8f5 <sysEnter_Vector-0x12f70b>
 881:	72 63                	jb     8e6 <sysEnter_Vector-0x12f71a>
 883:	70 79                	jo     8fe <sysEnter_Vector-0x12f702>
 885:	63 00                	arpl   WORD PTR [eax],ax
 887:	73 74                	jae    8fd <sysEnter_Vector-0x12f703>
 889:	72 63                	jb     8ee <sysEnter_Vector-0x12f712>
 88b:	70 79                	jo     906 <sysEnter_Vector-0x12f6fa>
 88d:	49                   	dec    ecx
 88e:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 891:	63 2f                	arpl   WORD PTR [edi],bp
 893:	73 74                	jae    909 <sysEnter_Vector-0x12f6f7>
 895:	72 69                	jb     900 <sysEnter_Vector-0x12f700>
 897:	6e                   	outs   dx,BYTE PTR ds:[esi]
 898:	67 73 2f             	addr16 jae 8ca <sysEnter_Vector-0x12f736>
 89b:	73 74                	jae    911 <sysEnter_Vector-0x12f6ef>
 89d:	72 63                	jb     902 <sysEnter_Vector-0x12f6fe>
 89f:	70 79                	jo     91a <sysEnter_Vector-0x12f6e6>
 8a1:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8a4:	73 74                	jae    91a <sysEnter_Vector-0x12f6e6>
 8a6:	72 6c                	jb     914 <sysEnter_Vector-0x12f6ec>
 8a8:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 8aa:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 8ad:	63 2f                	arpl   WORD PTR [edi],bp
 8af:	73 74                	jae    925 <sysEnter_Vector-0x12f6db>
 8b1:	72 69                	jb     91c <sysEnter_Vector-0x12f6e4>
 8b3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8b4:	67 73 2f             	addr16 jae 8e6 <sysEnter_Vector-0x12f71a>
 8b7:	73 74                	jae    92d <sysEnter_Vector-0x12f6d3>
 8b9:	72 6c                	jb     927 <sysEnter_Vector-0x12f6d9>
 8bb:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 8bd:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8c0:	73 74                	jae    936 <sysEnter_Vector-0x12f6ca>
 8c2:	72 6e                	jb     932 <sysEnter_Vector-0x12f6ce>
 8c4:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 8c7:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 8ca:	63 2f                	arpl   WORD PTR [edi],bp
 8cc:	73 74                	jae    942 <sysEnter_Vector-0x12f6be>
 8ce:	72 69                	jb     939 <sysEnter_Vector-0x12f6c7>
 8d0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8d1:	67 73 2f             	addr16 jae 903 <sysEnter_Vector-0x12f6fd>
 8d4:	73 74                	jae    94a <sysEnter_Vector-0x12f6b6>
 8d6:	72 6e                	jb     946 <sysEnter_Vector-0x12f6ba>
 8d8:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 8db:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8de:	73 72                	jae    952 <sysEnter_Vector-0x12f6ae>
 8e0:	63 2f                	arpl   WORD PTR [edi],bp
 8e2:	73 74                	jae    958 <sysEnter_Vector-0x12f6a8>
 8e4:	72 69                	jb     94f <sysEnter_Vector-0x12f6b1>
 8e6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8e7:	67 73 2f             	addr16 jae 919 <sysEnter_Vector-0x12f6e7>
 8ea:	73 74                	jae    960 <sysEnter_Vector-0x12f6a0>
 8ec:	72 6e                	jb     95c <sysEnter_Vector-0x12f6a4>
 8ee:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 8f1:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8f4:	73 74                	jae    96a <sysEnter_Vector-0x12f696>
 8f6:	72 6e                	jb     966 <sysEnter_Vector-0x12f69a>
 8f8:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 8fb:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 8fe:	63 2f                	arpl   WORD PTR [edi],bp
 900:	73 74                	jae    976 <sysEnter_Vector-0x12f68a>
 902:	72 69                	jb     96d <sysEnter_Vector-0x12f693>
 904:	6e                   	outs   dx,BYTE PTR ds:[esi]
 905:	67 73 2f             	addr16 jae 937 <sysEnter_Vector-0x12f6c9>
 908:	73 74                	jae    97e <sysEnter_Vector-0x12f682>
 90a:	72 6f                	jb     97b <sysEnter_Vector-0x12f685>
 90c:	75 6c                	jne    97a <sysEnter_Vector-0x12f686>
 90e:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 911:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 914:	6f                   	outs   dx,DWORD PTR ds:[esi]
 915:	66                   	data16
 916:	66                   	data16
 917:	00 63 75             	add    BYTE PTR [ebx+0x75],ah
 91a:	74 6c                	je     988 <sysEnter_Vector-0x12f678>
 91c:	69 6d 00 73 74 72 74 	imul   ebp,DWORD PTR [ebp+0x0],0x74727473
 923:	6f                   	outs   dx,DWORD PTR ds:[esi]
 924:	75 6c                	jne    992 <sysEnter_Vector-0x12f66e>
 926:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 929:	64                   	fs
 92a:	70 74                	jo     9a0 <sysEnter_Vector-0x12f660>
 92c:	72 00                	jb     92e <sysEnter_Vector-0x12f6d2>
 92e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 92f:	70 74                	jo     9a5 <sysEnter_Vector-0x12f65b>
 931:	72 00                	jb     933 <sysEnter_Vector-0x12f6cd>
 933:	62 61 73             	bound  esp,QWORD PTR [ecx+0x73]
 936:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 93a:	63 2f                	arpl   WORD PTR [edi],bp
 93c:	73 74                	jae    9b2 <sysEnter_Vector-0x12f64e>
 93e:	72 69                	jb     9a9 <sysEnter_Vector-0x12f657>
 940:	6e                   	outs   dx,BYTE PTR ds:[esi]
 941:	67 73 2f             	addr16 jae 973 <sysEnter_Vector-0x12f68d>
 944:	73 74                	jae    9ba <sysEnter_Vector-0x12f646>
 946:	72 70                	jb     9b8 <sysEnter_Vector-0x12f648>
 948:	61                   	popa   
 949:	72 74                	jb     9bf <sysEnter_Vector-0x12f641>
 94b:	73 2e                	jae    97b <sysEnter_Vector-0x12f685>
 94d:	63 00                	arpl   WORD PTR [eax],ax
 94f:	73 74                	jae    9c5 <sysEnter_Vector-0x12f63b>
 951:	72 6c                	jb     9bf <sysEnter_Vector-0x12f641>
 953:	65                   	gs
 954:	66                   	data16
 955:	74 00                	je     957 <sysEnter_Vector-0x12f6a9>
 957:	73 72                	jae    9cb <sysEnter_Vector-0x12f635>
 959:	63 2f                	arpl   WORD PTR [edi],bp
 95b:	73 74                	jae    9d1 <sysEnter_Vector-0x12f62f>
 95d:	72 69                	jb     9c8 <sysEnter_Vector-0x12f638>
 95f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 960:	67 73 2f             	addr16 jae 992 <sysEnter_Vector-0x12f66e>
 963:	73 74                	jae    9d9 <sysEnter_Vector-0x12f627>
 965:	72 74                	jb     9db <sysEnter_Vector-0x12f625>
 967:	6f                   	outs   dx,DWORD PTR ds:[esi]
 968:	6c                   	ins    BYTE PTR es:[edi],dx
 969:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 96c:	73 74                	jae    9e2 <sysEnter_Vector-0x12f61e>
 96e:	72 74                	jb     9e4 <sysEnter_Vector-0x12f61c>
 970:	6f                   	outs   dx,DWORD PTR ds:[esi]
 971:	6c                   	ins    BYTE PTR es:[edi],dx
 972:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 975:	70 75                	jo     9ec <sysEnter_Vector-0x12f614>
 977:	74 00                	je     979 <sysEnter_Vector-0x12f687>
 979:	73 72                	jae    9ed <sysEnter_Vector-0x12f613>
 97b:	63 2f                	arpl   WORD PTR [edi],bp
 97d:	73 74                	jae    9f3 <sysEnter_Vector-0x12f60d>
 97f:	72 69                	jb     9ea <sysEnter_Vector-0x12f616>
 981:	6e                   	outs   dx,BYTE PTR ds:[esi]
 982:	67 73 2f             	addr16 jae 9b4 <sysEnter_Vector-0x12f64c>
 985:	73 74                	jae    9fb <sysEnter_Vector-0x12f605>
 987:	72 74                	jb     9fd <sysEnter_Vector-0x12f603>
 989:	72 69                	jb     9f4 <sysEnter_Vector-0x12f60c>
 98b:	6d                   	ins    DWORD PTR es:[edi],dx
 98c:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 98f:	73 74                	jae    a05 <sysEnter_Vector-0x12f5fb>
 991:	72 74                	jb     a07 <sysEnter_Vector-0x12f5f9>
 993:	72 69                	jb     9fe <sysEnter_Vector-0x12f602>
 995:	6d                   	ins    DWORD PTR es:[edi],dx
 996:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 999:	63 2f                	arpl   WORD PTR [edi],bp
 99b:	73 74                	jae    a11 <sysEnter_Vector-0x12f5ef>
 99d:	72 73                	jb     a12 <sysEnter_Vector-0x12f5ee>
 99f:	74 72                	je     a13 <sysEnter_Vector-0x12f5ed>
 9a1:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 9a4:	73 74                	jae    a1a <sysEnter_Vector-0x12f5e6>
 9a6:	72 73                	jb     a1b <sysEnter_Vector-0x12f5e5>
 9a8:	74 72                	je     a1c <sysEnter_Vector-0x12f5e4>
 9aa:	00 72 63             	add    BYTE PTR [edx+0x63],dh
 9ad:	73 69                	jae    a18 <sysEnter_Vector-0x12f5e8>
 9af:	64 00 73 75          	add    BYTE PTR fs:[ebx+0x75],dh
 9b3:	62 73 74             	bound  esi,QWORD PTR [ebx+0x74]
 9b6:	72 69                	jb     a21 <sysEnter_Vector-0x12f5df>
 9b8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 9b9:	67 00 6c 6f          	add    BYTE PTR [si+0x6f],ch
 9bd:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
 9c0:	74 69                	je     a2b <sysEnter_Vector-0x12f5d5>
 9c2:	6d                   	ins    DWORD PTR es:[edi],dx
 9c3:	65 00 64 61 79       	add    BYTE PTR gs:[ecx+eiz*2+0x79],ah
 9c8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 9c9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 9ca:	00 5f 64             	add    BYTE PTR [edi+0x64],bl
 9cd:	73 74                	jae    a43 <sysEnter_Vector-0x12f5bd>
 9cf:	62 69 61             	bound  ebp,QWORD PTR [ecx+0x61]
 9d2:	73 00                	jae    9d4 <sysEnter_Vector-0x12f62c>
 9d4:	67 6d                	ins    DWORD PTR es:[di],dx
 9d6:	74 69                	je     a41 <sysEnter_Vector-0x12f5bf>
 9d8:	6d                   	ins    DWORD PTR es:[edi],dx
 9d9:	65                   	gs
 9da:	5f                   	pop    edi
 9db:	72 00                	jb     9dd <sysEnter_Vector-0x12f623>
 9dd:	74 69                	je     a48 <sysEnter_Vector-0x12f5b8>
 9df:	6d                   	ins    DWORD PTR es:[edi],dx
 9e0:	65                   	gs
 9e1:	72 00                	jb     9e3 <sysEnter_Vector-0x12f61d>
 9e3:	6c                   	ins    BYTE PTR es:[edi],dx
 9e4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 9e5:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
 9e8:	74 69                	je     a53 <sysEnter_Vector-0x12f5ad>
 9ea:	6d                   	ins    DWORD PTR es:[edi],dx
 9eb:	65                   	gs
 9ec:	5f                   	pop    edi
 9ed:	72 00                	jb     9ef <sysEnter_Vector-0x12f611>
 9ef:	5f                   	pop    edi
 9f0:	74 7a                	je     a6c <sysEnter_Vector-0x12f594>
 9f2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 9f3:	61                   	popa   
 9f4:	6d                   	ins    DWORD PTR es:[edi],dx
 9f5:	65 00 5f 79          	add    BYTE PTR gs:[edi+0x79],bl
 9f9:	74 61                	je     a5c <sysEnter_Vector-0x12f5a4>
 9fb:	62 00                	bound  eax,QWORD PTR [eax]
 9fd:	74 69                	je     a68 <sysEnter_Vector-0x12f598>
 9ff:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 a02:	54                   	push   esp
 a03:	6f                   	outs   dx,DWORD PTR ds:[esi]
 a04:	57                   	push   edi
 a05:	61                   	popa   
 a06:	69 74 00 6d 6b 74 69 	imul   esi,DWORD PTR [eax+eax*1+0x6d],0x6d69746b
 a0d:	6d 
 a0e:	65 00 64 61 79       	add    BYTE PTR gs:[ecx+eiz*2+0x79],ah
 a13:	63 6c 6f 63          	arpl   WORD PTR [edi+ebp*2+0x63],bp
 a17:	6b 00 5f             	imul   eax,DWORD PTR [eax],0x5f
 a1a:	64                   	fs
 a1b:	61                   	popa   
 a1c:	79 6c                	jns    a8a <sysEnter_Vector-0x12f576>
 a1e:	69 67 68 74 00 6f 76 	imul   esp,DWORD PTR [edi+0x68],0x766f0074
 a25:	65                   	gs
 a26:	72 66                	jb     a8e <sysEnter_Vector-0x12f572>
 a28:	6c                   	ins    BYTE PTR es:[edi],dx
 a29:	6f                   	outs   dx,DWORD PTR ds:[esi]
 a2a:	77 00                	ja     a2c <sysEnter_Vector-0x12f5d4>
 a2c:	6d                   	ins    DWORD PTR es:[edi],dx
 a2d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 a2e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 a2f:	74 68                	je     a99 <sysEnter_Vector-0x12f567>
 a31:	00 74 6d 62          	add    BYTE PTR [ebp+ebp*2+0x62],dh
 a35:	75 66                	jne    a9d <sysEnter_Vector-0x12f563>
 a37:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 a3a:	63 2f                	arpl   WORD PTR [edi],bp
 a3c:	74 69                	je     aa7 <sysEnter_Vector-0x12f559>
 a3e:	6d                   	ins    DWORD PTR es:[edi],dx
 a3f:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax

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
