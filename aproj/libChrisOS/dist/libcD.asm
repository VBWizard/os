
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
30000003:	e8 5e 23 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000008:	05 10 38 00 00       	add    eax,0x3810
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
3000003b:	e8 26 23 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000040:	05 d8 37 00 00       	add    eax,0x37d8
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
30000075:	e8 ec 22 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000007a:	05 9e 37 00 00       	add    eax,0x379e
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
300000ca:	e8 97 22 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300000cf:	05 49 37 00 00       	add    eax,0x3749
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
30000121:	e8 9a 22 00 00       	call   300023c0 <__x86.get_pc_thunk.bx>
30000126:	81 c3 f2 36 00 00    	add    ebx,0x36f2
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
300001bb:	e8 a6 21 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300001c0:	05 58 36 00 00       	add    eax,0x3658
/home/yogi/src/os/aproj/libChrisOS/src/ascii.c:15
     int i, j;
     char c;

     for (i = 0, j = strlenI(s)-1; i<j; i++, j--) {
300001c5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
300001cc:	83 ec 0c             	sub    esp,0xc
300001cf:	ff 75 08             	push   DWORD PTR [ebp+0x8]
300001d2:	89 c3                	mov    ebx,eax
300001d4:	e8 a8 10 00 00       	call   30001281 <strlenI>
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
30000232:	e8 2f 21 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000237:	05 e1 35 00 00       	add    eax,0x35e1
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
300002ec:	e8 75 20 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300002f1:	05 27 35 00 00       	add    eax,0x3527
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
30000348:	e8 19 20 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000034d:	05 cb 34 00 00       	add    eax,0x34cb
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
30000371:	e8 f0 1f 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000376:	05 a2 34 00 00       	add    eax,0x34a2
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
300003b4:	e8 ad 1f 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300003b9:	05 5f 34 00 00       	add    eax,0x345f
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
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:37

VISIBLE int gets(char* buffer, int maxlen, int stream)
{
300003dc:	55                   	push   ebp
300003dd:	89 e5                	mov    ebp,esp
300003df:	53                   	push   ebx
300003e0:	83 ec 14             	sub    esp,0x14
300003e3:	e8 7e 1f 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300003e8:	05 30 34 00 00       	add    eax,0x3430
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:39
    char inchar;
    int len=0;
300003ed:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:40
    char lbuf[2]={0,0};
300003f4:	c6 45 f1 00          	mov    BYTE PTR [ebp-0xf],0x0
300003f8:	c6 45 f2 00          	mov    BYTE PTR [ebp-0xe],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:42
    
    if (stream!=1)
300003fc:	83 7d 10 01          	cmp    DWORD PTR [ebp+0x10],0x1
30000400:	74 19                	je     3000041b <gets+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:44
    {
        printI("Stream %u not implemented\n",stream);
30000402:	83 ec 08             	sub    esp,0x8
30000405:	ff 75 10             	push   DWORD PTR [ebp+0x10]
30000408:	8d 90 a8 fb ff ff    	lea    edx,[eax-0x458]
3000040e:	52                   	push   edx
3000040f:	89 c3                	mov    ebx,eax
30000411:	e8 35 02 00 00       	call   3000064b <printI>
30000416:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:45 (discriminator 1)
        getsError: goto getsError;
30000419:	eb fe                	jmp    30000419 <gets+0x3d>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:50
    }
    
    while (1==1)
    {
        READCHAR(inchar)
3000041b:	b8 03 00 00 00       	mov    eax,0x3
30000420:	ba 00 00 00 00       	mov    edx,0x0
30000425:	89 d3                	mov    ebx,edx
30000427:	e8 fc ff ff ff       	call   30000428 <gets+0x4c>
3000042c:	88 45 f3             	mov    BYTE PTR [ebp-0xd],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:51
        if (inchar=='\b' && len>0)
3000042f:	80 7d f3 08          	cmp    BYTE PTR [ebp-0xd],0x8
30000433:	75 17                	jne    3000044c <gets+0x70>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:51 (discriminator 1)
30000435:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
30000439:	7e 11                	jle    3000044c <gets+0x70>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:53
        {
            buffer[len]=0;
3000043b:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
3000043e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000441:	01 d0                	add    eax,edx
30000443:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:54
            len--;
30000446:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
3000044a:	eb 43                	jmp    3000048f <gets+0xb3>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:56
        }
        else if (inchar!=0)
3000044c:	80 7d f3 00          	cmp    BYTE PTR [ebp-0xd],0x0
30000450:	74 33                	je     30000485 <gets+0xa9>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:58
        {
            lbuf[0]=inchar;
30000452:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
30000456:	88 45 f1             	mov    BYTE PTR [ebp-0xf],al
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:60
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
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:62
            //Note: Written this way so that gets an be used as a getc which waits for the key
            if ((len+1>=maxlen) || (inchar==0x0a)) //-1 because we need to leave the terminator (0x0) at the end of the string
3000046f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000472:	83 c0 01             	add    eax,0x1
30000475:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
30000478:	7d 06                	jge    30000480 <gets+0xa4>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:62 (discriminator 1)
3000047a:	80 7d f3 0a          	cmp    BYTE PTR [ebp-0xd],0xa
3000047e:	75 9b                	jne    3000041b <gets+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:64
            
                return len;
30000480:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000483:	eb 0c                	jmp    30000491 <gets+0xb5>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:67
        }
        else
            asm("call sysEnter_Vector\n"::"a" (0x302)); //hlt
30000485:	b8 02 03 00 00       	mov    eax,0x302
3000048a:	e8 fc ff ff ff       	call   3000048b <gets+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:69 (discriminator 2)

    }
3000048f:	eb 8a                	jmp    3000041b <gets+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/input/input.c:70
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
3000049f:	e8 c2 1e 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300004a4:	05 74 33 00 00       	add    eax,0x3374
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
300004d4:	e8 8d 1e 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300004d9:	05 3f 33 00 00       	add    eax,0x333f
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
30000508:	e8 59 1e 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000050d:	05 0b 33 00 00       	add    eax,0x330b
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
30000538:	e8 29 1e 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000053d:	05 db 32 00 00       	add    eax,0x32db
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
30000560:	e8 5b 1e 00 00       	call   300023c0 <__x86.get_pc_thunk.bx>
30000565:	81 c3 b3 32 00 00    	add    ebx,0x32b3
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:45
    printdI(DEBUG_LIBC,"***libc_init called\n***");
3000056b:	83 ec 08             	sub    esp,0x8
3000056e:	8d 83 c4 fb ff ff    	lea    eax,[ebx-0x43c]
30000574:	50                   	push   eax
30000575:	68 00 00 00 02       	push   0x2000000
3000057a:	e8 00 01 00 00       	call   3000067f <printdI>
3000057f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:46
    if (!libcInitialized)
30000582:	0f b6 83 40 00 00 00 	movzx  eax,BYTE PTR [ebx+0x40]
30000589:	83 f0 01             	xor    eax,0x1
3000058c:	84 c0                	test   al,al
3000058e:	74 50                	je     300005e0 <libc_init+0x87>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:48
    {
        initmalloc();
30000590:	e8 6b 02 00 00       	call   30000800 <initmalloc>
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
300005ae:	8d 83 e0 cd ff ff    	lea    eax,[ebx-0x3220]
300005b4:	83 ec 08             	sub    esp,0x8
300005b7:	50                   	push   eax
300005b8:	68 63 01 00 00       	push   0x163
300005bd:	e8 3f ff ff ff       	call   30000501 <do_syscall2>
300005c2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:52
        libcInitialized = true;
300005c5:	c6 83 40 00 00 00 01 	mov    BYTE PTR [ebx+0x40],0x1
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:53
        printI("***libc_init completed\n");
300005cc:	83 ec 0c             	sub    esp,0xc
300005cf:	8d 83 dc fb ff ff    	lea    eax,[ebx-0x424]
300005d5:	50                   	push   eax
300005d6:	e8 70 00 00 00       	call   3000064b <printI>
300005db:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:57
    }
    else
        printI("libc_init called previously, exiting\n");
}
300005de:	eb 12                	jmp    300005f2 <libc_init+0x99>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:56
        do_syscall2(SYSCALL_REGEXITHANDLER,(uint32_t)&libc_cleanup);
        libcInitialized = true;
        printI("***libc_init completed\n");
    }
    else
        printI("libc_init called previously, exiting\n");
300005e0:	83 ec 0c             	sub    esp,0xc
300005e3:	8d 83 f4 fb ff ff    	lea    eax,[ebx-0x40c]
300005e9:	50                   	push   eax
300005ea:	e8 5c 00 00 00       	call   3000064b <printI>
300005ef:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:57
}
300005f2:	90                   	nop
300005f3:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300005f6:	c9                   	leave  
300005f7:	c3                   	ret    

300005f8 <libc_cleanup>:
libc_cleanup():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:60

void __attribute__((destructor)) libc_cleanup(void)
{
300005f8:	55                   	push   ebp
300005f9:	89 e5                	mov    ebp,esp
300005fb:	53                   	push   ebx
300005fc:	83 ec 04             	sub    esp,0x4
300005ff:	e8 62 1d 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000604:	05 14 32 00 00       	add    eax,0x3214
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:61
    malloc_cleanup();
30000609:	89 c3                	mov    ebx,eax
3000060b:	e8 e4 04 00 00       	call   30000af4 <malloc_cleanup>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:62
}
30000610:	90                   	nop
30000611:	83 c4 04             	add    esp,0x4
30000614:	5b                   	pop    ebx
30000615:	5d                   	pop    ebp
30000616:	c3                   	ret    

30000617 <print>:
print():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:65

VISIBLE int print(const char *format, ...)
{
30000617:	55                   	push   ebp
30000618:	89 e5                	mov    ebp,esp
3000061a:	83 ec 10             	sub    esp,0x10
3000061d:	e8 44 1d 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000622:	05 f6 31 00 00       	add    eax,0x31f6
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:67
    va_list args;
    va_start( args, format );
30000627:	8d 45 0c             	lea    eax,[ebp+0xc]
3000062a:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:68
    do_syscall3(SYSCALL_PRINT,(uint32_t)format,(uint32_t)args);
3000062d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000630:	89 c2                	mov    edx,eax
30000632:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000635:	52                   	push   edx
30000636:	50                   	push   eax
30000637:	68 00 03 00 00       	push   0x300
3000063c:	e8 8c fe ff ff       	call   300004cd <do_syscall3>
30000641:	83 c4 0c             	add    esp,0xc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:69
    return 0;
30000644:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:70
}
30000649:	c9                   	leave  
3000064a:	c3                   	ret    

3000064b <printI>:
printI():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:73

int printI(const char *format, ...)
{
3000064b:	55                   	push   ebp
3000064c:	89 e5                	mov    ebp,esp
3000064e:	83 ec 10             	sub    esp,0x10
30000651:	e8 10 1d 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000656:	05 c2 31 00 00       	add    eax,0x31c2
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:75
    va_list args;
    va_start( args, format );
3000065b:	8d 45 0c             	lea    eax,[ebp+0xc]
3000065e:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:76
    do_syscall3(SYSCALL_PRINT,(uint32_t)format,(uint32_t)args);
30000661:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000664:	89 c2                	mov    edx,eax
30000666:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000669:	52                   	push   edx
3000066a:	50                   	push   eax
3000066b:	68 00 03 00 00       	push   0x300
30000670:	e8 58 fe ff ff       	call   300004cd <do_syscall3>
30000675:	83 c4 0c             	add    esp,0xc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:77
    return 0;
30000678:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:78
}
3000067d:	c9                   	leave  
3000067e:	c3                   	ret    

3000067f <printdI>:
printdI():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:81

int printdI(uint32_t DebugLevel, const char *format, ...)
{
3000067f:	55                   	push   ebp
30000680:	89 e5                	mov    ebp,esp
30000682:	53                   	push   ebx
30000683:	83 ec 10             	sub    esp,0x10
30000686:	e8 db 1c 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000068b:	05 8d 31 00 00       	add    eax,0x318d
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:83
    va_list args;
    va_start( args, format );
30000690:	8d 45 10             	lea    eax,[ebp+0x10]
30000693:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:84
    asm("mov eax,0x301\ncall sysEnter_Vector\n"::"b" (DebugLevel), "c" (format), "d" (args));
30000696:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30000699:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000069c:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
3000069f:	89 c3                	mov    ebx,eax
300006a1:	b8 01 03 00 00       	mov    eax,0x301
300006a6:	e8 fc ff ff ff       	call   300006a7 <printdI+0x28>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:85
    return 0;
300006ab:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:86
}
300006b0:	83 c4 10             	add    esp,0x10
300006b3:	5b                   	pop    ebx
300006b4:	5d                   	pop    ebp
300006b5:	c3                   	ret    

300006b6 <sleep>:
sleep():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:89

VISIBLE unsigned int sleep (unsigned int __seconds)
{
300006b6:	55                   	push   ebp
300006b7:	89 e5                	mov    ebp,esp
300006b9:	53                   	push   ebx
300006ba:	83 ec 10             	sub    esp,0x10
300006bd:	e8 a4 1c 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300006c2:	05 56 31 00 00       	add    eax,0x3156
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:90
    SLEEP_SECONDS(__seconds)
300006c7:	b8 70 01 00 00       	mov    eax,0x170
300006cc:	e8 fc ff ff ff       	call   300006cd <sleep+0x17>
300006d1:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
300006d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300006d7:	6b d0 64             	imul   edx,eax,0x64
300006da:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
300006dd:	01 d0                	add    eax,edx
300006df:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
300006e2:	b8 66 01 00 00       	mov    eax,0x166
300006e7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
300006ea:	b9 00 00 00 00       	mov    ecx,0x0
300006ef:	ba 00 00 00 00       	mov    edx,0x0
300006f4:	e8 fc ff ff ff       	call   300006f5 <sleep+0x3f>
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:91
    return 0;
300006f9:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:92
}
300006fe:	83 c4 10             	add    esp,0x10
30000701:	5b                   	pop    ebx
30000702:	5d                   	pop    ebp
30000703:	c3                   	ret    

30000704 <stop>:
stop():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:95

void stop()
{
30000704:	55                   	push   ebp
30000705:	89 e5                	mov    ebp,esp
30000707:	e8 5a 1c 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000070c:	05 0c 31 00 00       	add    eax,0x310c
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:96
    do_syscall1(SYSCALL_STOP);
30000711:	68 68 01 00 00       	push   0x168
30000716:	e8 17 fe ff ff       	call   30000532 <do_syscall1>
3000071b:	83 c4 04             	add    esp,0x4
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:97
}
3000071e:	90                   	nop
3000071f:	c9                   	leave  
30000720:	c3                   	ret    

30000721 <modifySignal>:
modifySignal():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:100

VISIBLE void modifySignal(int signal, void* sigHandler, int sigData)
{
30000721:	55                   	push   ebp
30000722:	89 e5                	mov    ebp,esp
30000724:	e8 3d 1c 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000729:	05 ef 30 00 00       	add    eax,0x30ef
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:101
    do_syscall4(SYSCALL_SETSIGACTION,signal,(uint32_t)sigHandler,sigData);
3000072e:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30000731:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000734:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000737:	51                   	push   ecx
30000738:	52                   	push   edx
30000739:	50                   	push   eax
3000073a:	68 67 01 00 00       	push   0x167
3000073f:	e8 54 fd ff ff       	call   30000498 <do_syscall4>
30000744:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:102
}
30000747:	90                   	nop
30000748:	c9                   	leave  
30000749:	c3                   	ret    

3000074a <exec>:
exec():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:105

VISIBLE int exec(char* path, int argc, char** argv)
{
3000074a:	55                   	push   ebp
3000074b:	89 e5                	mov    ebp,esp
3000074d:	53                   	push   ebx
3000074e:	83 ec 10             	sub    esp,0x10
30000751:	e8 10 1c 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000756:	05 c2 30 00 00       	add    eax,0x30c2
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:106
    int pid=0;
3000075b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:109
    //Using the syscall is breaking the stack
//    SYSCALL4(SYSCALL_EXEC,path,argc,argv);
    __asm__("push ds\nint 0x80\npop ds\n"
30000762:	b8 59 00 00 00       	mov    eax,0x59
30000767:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
3000076a:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
3000076d:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
30000770:	1e                   	push   ds
30000771:	cd 80                	int    0x80
30000773:	1f                   	pop    ds
30000774:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:112
            :"=a" (pid)
            :"a" (0x59),"b" (path),"c" (argc),"d" (argv));
    return pid;
30000777:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:113
}
3000077a:	83 c4 10             	add    esp,0x10
3000077d:	5b                   	pop    ebx
3000077e:	5d                   	pop    ebp
3000077f:	c3                   	ret    

30000780 <waitpid>:
waitpid():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:116

VISIBLE void waitpid(uint32_t pid)
{
30000780:	55                   	push   ebp
30000781:	89 e5                	mov    ebp,esp
30000783:	e8 de 1b 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000788:	05 90 30 00 00       	add    eax,0x3090
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:117
    do_syscall2(SYSCALL_WAITFORPID,pid);
3000078d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000790:	6a 61                	push   0x61
30000792:	e8 6a fd ff ff       	call   30000501 <do_syscall2>
30000797:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:118
}
3000079a:	90                   	nop
3000079b:	c9                   	leave  
3000079c:	c3                   	ret    

3000079d <gettime>:
gettime():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:121

VISIBLE struct tm* gettime()
{
3000079d:	55                   	push   ebp
3000079e:	89 e5                	mov    ebp,esp
300007a0:	53                   	push   ebx
300007a1:	83 ec 34             	sub    esp,0x34
300007a4:	e8 17 1c 00 00       	call   300023c0 <__x86.get_pc_thunk.bx>
300007a9:	81 c3 6f 30 00 00    	add    ebx,0x306f
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:122
    uint32_t ticks=0;
300007af:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:124
    struct tm theTime;
    do_syscall2(SYSCALL_GETTICKS,ticks);
300007b6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300007b9:	50                   	push   eax
300007ba:	68 70 01 00 00       	push   0x170
300007bf:	e8 3d fd ff ff       	call   30000501 <do_syscall2>
300007c4:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:125
    return gmtime_r((time_t*)&ticks,&theTime);
300007c7:	83 ec 08             	sub    esp,0x8
300007ca:	8d 45 c8             	lea    eax,[ebp-0x38]
300007cd:	50                   	push   eax
300007ce:	8d 45 f4             	lea    eax,[ebp-0xc]
300007d1:	50                   	push   eax
300007d2:	e8 c9 1b 00 00       	call   300023a0 <__x86.get_pc_thunk.ax+0x3a>
300007d7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:126
}
300007da:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300007dd:	c9                   	leave  
300007de:	c3                   	ret    

300007df <getcwd>:
getcwd():
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:129

VISIBLE char* getcwd(char* buf, size_t size)
{
300007df:	55                   	push   ebp
300007e0:	89 e5                	mov    ebp,esp
300007e2:	e8 7f 1b 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300007e7:	05 31 30 00 00       	add    eax,0x3031
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:130
    return (char*)do_syscall3(SYSCALL_GETCWD,(uint32_t)buf,size);
300007ec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300007ef:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
300007f2:	50                   	push   eax
300007f3:	6a 4f                	push   0x4f
300007f5:	e8 d3 fc ff ff       	call   300004cd <do_syscall3>
300007fa:	83 c4 0c             	add    esp,0xc
/home/yogi/src/os/aproj/libChrisOS/src/libChrisOS.c:131
}
300007fd:	c9                   	leave  
300007fe:	c3                   	ret    
300007ff:	90                   	nop

30000800 <initmalloc>:
initmalloc():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:13
#include "libChrisOS.h"

#define HEAP_GET_NEXT(s,t) {t=(uint8_t*)s+s->len+sizeof(heaprec_t);}
#define HEAP_CURR(s,t) {t=((heaprec_t*)s)-1;}
void initmalloc()
{
30000800:	55                   	push   ebp
30000801:	89 e5                	mov    ebp,esp
30000803:	53                   	push   ebx
30000804:	83 ec 04             	sub    esp,0x4
30000807:	e8 b4 1b 00 00       	call   300023c0 <__x86.get_pc_thunk.bx>
3000080c:	81 c3 0c 30 00 00    	add    ebx,0x300c
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:14
    printdI(DEBUG_MALLOC,"heapBase = 0x%08X before\n", heapBase);
30000812:	8b 83 f4 ff ff ff    	mov    eax,DWORD PTR [ebx-0xc]
30000818:	8b 00                	mov    eax,DWORD PTR [eax]
3000081a:	83 ec 04             	sub    esp,0x4
3000081d:	50                   	push   eax
3000081e:	8d 83 1c fc ff ff    	lea    eax,[ebx-0x3e4]
30000824:	50                   	push   eax
30000825:	68 00 00 00 01       	push   0x1000000
3000082a:	e8 50 fe ff ff       	call   3000067f <printdI>
3000082f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:15
    heapBase=0;
30000832:	8b 83 f4 ff ff ff    	mov    eax,DWORD PTR [ebx-0xc]
30000838:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:16
    heapCurr=0;
3000083e:	8b 83 f8 ff ff ff    	mov    eax,DWORD PTR [ebx-0x8]
30000844:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:17
    heapEnd=0;
3000084a:	8b 83 f0 ff ff ff    	mov    eax,DWORD PTR [ebx-0x10]
30000850:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:18
}
30000856:	90                   	nop
30000857:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
3000085a:	c9                   	leave  
3000085b:	c3                   	ret    

3000085c <newHeapRequiredToFulfillRequest>:
newHeapRequiredToFulfillRequest():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:21

uint32_t newHeapRequiredToFulfillRequest(size_t size)
{
3000085c:	55                   	push   ebp
3000085d:	89 e5                	mov    ebp,esp
3000085f:	83 ec 10             	sub    esp,0x10
30000862:	e8 ff 1a 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000867:	05 b1 2f 00 00       	add    eax,0x2fb1
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:22
    uint32_t newSize=size+sizeof(heaprec_t);
3000086c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
3000086f:	83 c2 10             	add    edx,0x10
30000872:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:24
    //printDebug(DEBUG_MALLOC,"size=0x%08X, heapEnd=0x%08X, heapCurr=0x%08X\n",newSize, heapEnd, heapCurr);
    if (heapCurr+newSize > heapEnd)
30000875:	8b 90 f8 ff ff ff    	mov    edx,DWORD PTR [eax-0x8]
3000087b:	8b 0a                	mov    ecx,DWORD PTR [edx]
3000087d:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000880:	01 d1                	add    ecx,edx
30000882:	8b 90 f0 ff ff ff    	mov    edx,DWORD PTR [eax-0x10]
30000888:	8b 12                	mov    edx,DWORD PTR [edx]
3000088a:	39 d1                	cmp    ecx,edx
3000088c:	76 43                	jbe    300008d1 <newHeapRequiredToFulfillRequest+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:27
    {
        //printDebug(DEBUG_MALLOC,"Heap requested 0x%08X, heap available 0x%08X\n",newSize, heapEnd-heapCurr);
        newSize =(heapEnd-heapCurr);
3000088e:	8b 90 f0 ff ff ff    	mov    edx,DWORD PTR [eax-0x10]
30000894:	8b 12                	mov    edx,DWORD PTR [edx]
30000896:	8b 80 f8 ff ff ff    	mov    eax,DWORD PTR [eax-0x8]
3000089c:	8b 00                	mov    eax,DWORD PTR [eax]
3000089e:	29 c2                	sub    edx,eax
300008a0:	89 d0                	mov    eax,edx
300008a2:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:28
        if (newSize== 0 || newSize%PAGE_SIZE)
300008a5:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
300008a9:	74 0c                	je     300008b7 <newHeapRequiredToFulfillRequest+0x5b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:28 (discriminator 1)
300008ab:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300008ae:	25 ff 0f 00 00       	and    eax,0xfff
300008b3:	85 c0                	test   eax,eax
300008b5:	74 10                	je     300008c7 <newHeapRequiredToFulfillRequest+0x6b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:30
       {
           newSize+=(PAGE_SIZE-(newSize % PAGE_SIZE));
300008b7:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300008ba:	25 00 f0 ff ff       	and    eax,0xfffff000
300008bf:	05 00 10 00 00       	add    eax,0x1000
300008c4:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:33
           //printDebug(DEBUG_MALLOC,"libcnewHeapRequiredToFulfillRequest: Size adjusted from %u to %u\n",size,newSize);
       }
        return newSize+ALLOC_REQUEST_SIZE;
300008c7:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300008ca:	05 00 20 03 00       	add    eax,0x32000
300008cf:	eb 05                	jmp    300008d6 <newHeapRequiredToFulfillRequest+0x7a>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:36
    }
    else
        return 0;
300008d1:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:37
}
300008d6:	c9                   	leave  
300008d7:	c3                   	ret    

300008d8 <malloc>:
malloc():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:40

__attribute__((visibility("default"))) void*  malloc(size_t size)
{
300008d8:	55                   	push   ebp
300008d9:	89 e5                	mov    ebp,esp
300008db:	56                   	push   esi
300008dc:	53                   	push   ebx
300008dd:	83 ec 20             	sub    esp,0x20
300008e0:	e8 df 1a 00 00       	call   300023c4 <__x86.get_pc_thunk.si>
300008e5:	81 c6 33 2f 00 00    	add    esi,0x2f33
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:47

    uint32_t needed;
    uint32_t allocatedPtr;
    heaprec_t* heapPtr;
    uint8_t* heapPtrNext;
    printdI(DEBUG_MALLOC,"malloc(0x%08X)\n",size);
300008eb:	83 ec 04             	sub    esp,0x4
300008ee:	ff 75 08             	push   DWORD PTR [ebp+0x8]
300008f1:	8d 86 36 fc ff ff    	lea    eax,[esi-0x3ca]
300008f7:	50                   	push   eax
300008f8:	68 00 00 00 01       	push   0x1000000
300008fd:	89 f3                	mov    ebx,esi
300008ff:	e8 7b fd ff ff       	call   3000067f <printdI>
30000904:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:48
    needed = newHeapRequiredToFulfillRequest(size);
30000907:	83 ec 0c             	sub    esp,0xc
3000090a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
3000090d:	e8 4a ff ff ff       	call   3000085c <newHeapRequiredToFulfillRequest>
30000912:	83 c4 10             	add    esp,0x10
30000915:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:49
    printdI(DEBUG_MALLOC,"libc_malloc: needed=0x%08X\n",needed);
30000918:	83 ec 04             	sub    esp,0x4
3000091b:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
3000091e:	8d 86 46 fc ff ff    	lea    eax,[esi-0x3ba]
30000924:	50                   	push   eax
30000925:	68 00 00 00 01       	push   0x1000000
3000092a:	89 f3                	mov    ebx,esi
3000092c:	e8 4e fd ff ff       	call   3000067f <printdI>
30000931:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:50
    if (needed!=0)      //No new heap required
30000934:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
30000938:	0f 84 b0 00 00 00    	je     300009ee <malloc+0x116>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:52
    {
        asm("mov eax,0x165\ncall sysEnter_Vector\n":"=a" (allocatedPtr):"b" (needed));
3000093e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000941:	89 c3                	mov    ebx,eax
30000943:	b8 65 01 00 00       	mov    eax,0x165
30000948:	e8 fc ff ff ff       	call   30000949 <malloc+0x71>
3000094d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:54
        //This is needed to keep in sync with what the kernel thinks
        printdI(DEBUG_MALLOC,"libc_malloc: heaEnd=0x%08X\n",heapEnd);
30000950:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
30000956:	8b 00                	mov    eax,DWORD PTR [eax]
30000958:	83 ec 04             	sub    esp,0x4
3000095b:	50                   	push   eax
3000095c:	8d 86 62 fc ff ff    	lea    eax,[esi-0x39e]
30000962:	50                   	push   eax
30000963:	68 00 00 00 01       	push   0x1000000
30000968:	89 f3                	mov    ebx,esi
3000096a:	e8 10 fd ff ff       	call   3000067f <printdI>
3000096f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:55
        heapEnd=allocatedPtr+needed;
30000972:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
30000975:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000978:	01 c2                	add    edx,eax
3000097a:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
30000980:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:56
        printdI(DEBUG_MALLOC,"libc_malloc: Req 0x%08X bytes, ret was 0x%08X, heapEnd=0x%08X\n",needed,allocatedPtr,heapEnd);
30000982:	8b 86 f0 ff ff ff    	mov    eax,DWORD PTR [esi-0x10]
30000988:	8b 00                	mov    eax,DWORD PTR [eax]
3000098a:	83 ec 0c             	sub    esp,0xc
3000098d:	50                   	push   eax
3000098e:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
30000991:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
30000994:	8d 86 80 fc ff ff    	lea    eax,[esi-0x380]
3000099a:	50                   	push   eax
3000099b:	68 00 00 00 01       	push   0x1000000
300009a0:	89 f3                	mov    ebx,esi
300009a2:	e8 d8 fc ff ff       	call   3000067f <printdI>
300009a7:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:57
        if (heapBase==0)    //Hasn't been initialized yet!
300009aa:	8b 86 f4 ff ff ff    	mov    eax,DWORD PTR [esi-0xc]
300009b0:	8b 00                	mov    eax,DWORD PTR [eax]
300009b2:	85 c0                	test   eax,eax
300009b4:	75 38                	jne    300009ee <malloc+0x116>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:59
        {
            heapCurr=allocatedPtr;
300009b6:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300009bc:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
300009bf:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:60
            heapBase=allocatedPtr;
300009c1:	8b 86 f4 ff ff ff    	mov    eax,DWORD PTR [esi-0xc]
300009c7:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
300009ca:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:61
            printdI(DEBUG_MALLOC,"libc_malloc: Initialized heapCurr and heapBase to 0x%08X\n",heapCurr);
300009cc:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300009d2:	8b 00                	mov    eax,DWORD PTR [eax]
300009d4:	83 ec 04             	sub    esp,0x4
300009d7:	50                   	push   eax
300009d8:	8d 86 c0 fc ff ff    	lea    eax,[esi-0x340]
300009de:	50                   	push   eax
300009df:	68 00 00 00 01       	push   0x1000000
300009e4:	89 f3                	mov    ebx,esi
300009e6:	e8 94 fc ff ff       	call   3000067f <printdI>
300009eb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:64
        }
    }
    printdI(DEBUG_MALLOC,"libc_malloc:creating heap rec @ 0x%08X\n",heapCurr);
300009ee:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
300009f4:	8b 00                	mov    eax,DWORD PTR [eax]
300009f6:	83 ec 04             	sub    esp,0x4
300009f9:	50                   	push   eax
300009fa:	8d 86 fc fc ff ff    	lea    eax,[esi-0x304]
30000a00:	50                   	push   eax
30000a01:	68 00 00 00 01       	push   0x1000000
30000a06:	89 f3                	mov    ebx,esi
30000a08:	e8 72 fc ff ff       	call   3000067f <printdI>
30000a0d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:65
    heapPtr = (heaprec_t*)heapCurr;
30000a10:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000a16:	8b 00                	mov    eax,DWORD PTR [eax]
30000a18:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:66
    heapPtr->marker=ALLOC_MARKER_VALUE;
30000a1b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a1e:	c7 00 d0 00 0f b0    	mov    DWORD PTR [eax],0xb00f00d0
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:67
    heapPtr->len=size;
30000a24:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a27:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30000a2a:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:68
    heapPtr->inUse=true;
30000a2d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a30:	c6 40 08 01          	mov    BYTE PTR [eax+0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:69
    printdI(DEBUG_MALLOC,"libc_malloc: heapCurr=0x%08X, sizeof(heaprec_t)=0x%08X\n",heapCurr,sizeof(heaprec_t));
30000a34:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000a3a:	8b 00                	mov    eax,DWORD PTR [eax]
30000a3c:	6a 10                	push   0x10
30000a3e:	50                   	push   eax
30000a3f:	8d 86 24 fd ff ff    	lea    eax,[esi-0x2dc]
30000a45:	50                   	push   eax
30000a46:	68 00 00 00 01       	push   0x1000000
30000a4b:	89 f3                	mov    ebx,esi
30000a4d:	e8 2d fc ff ff       	call   3000067f <printdI>
30000a52:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:70
    retVal=(void*)(heapCurr+sizeof(heaprec_t));
30000a55:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000a5b:	8b 00                	mov    eax,DWORD PTR [eax]
30000a5d:	83 c0 10             	add    eax,0x10
30000a60:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:71
    HEAP_GET_NEXT(heapPtr,heapPtrNext);
30000a63:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a66:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30000a69:	8d 50 10             	lea    edx,[eax+0x10]
30000a6c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000a6f:	01 d0                	add    eax,edx
30000a71:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:72
    ((heaprec_t*)heapPtrNext)->prev=heapPtr;
30000a74:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
30000a77:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000a7a:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:73
    heapCurr+=size+(sizeof(heaprec_t));
30000a7d:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000a83:	8b 10                	mov    edx,DWORD PTR [eax]
30000a85:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000a88:	01 d0                	add    eax,edx
30000a8a:	8d 50 10             	lea    edx,[eax+0x10]
30000a8d:	8b 86 f8 ff ff ff    	mov    eax,DWORD PTR [esi-0x8]
30000a93:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:74
    printdI(DEBUG_MALLOC,"malloc: returning 0x%08X\n",retVal);
30000a95:	83 ec 04             	sub    esp,0x4
30000a98:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
30000a9b:	8d 86 5c fd ff ff    	lea    eax,[esi-0x2a4]
30000aa1:	50                   	push   eax
30000aa2:	68 00 00 00 01       	push   0x1000000
30000aa7:	89 f3                	mov    ebx,esi
30000aa9:	e8 d1 fb ff ff       	call   3000067f <printdI>
30000aae:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:75
    return retVal;
30000ab1:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:76
}
30000ab4:	8d 65 f8             	lea    esp,[ebp-0x8]
30000ab7:	5b                   	pop    ebx
30000ab8:	5e                   	pop    esi
30000ab9:	5d                   	pop    ebp
30000aba:	c3                   	ret    

30000abb <free>:
free():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:79

__attribute__((visibility("default"))) void free(void* fpointer)
{
30000abb:	55                   	push   ebp
30000abc:	89 e5                	mov    ebp,esp
30000abe:	83 ec 10             	sub    esp,0x10
30000ac1:	e8 a0 18 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000ac6:	05 52 2d 00 00       	add    eax,0x2d52
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:82
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if (fpointer==NULL)
30000acb:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
30000acf:	74 20                	je     30000af1 <free+0x36>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:84
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
    HEAP_CURR(fpointer,mp);
30000ad1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000ad4:	83 e8 10             	sub    eax,0x10
30000ad7:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:87
    
    //printDebug(DEBUG_MALLOC,"libc_free: Freeing heap @ fp=0x%08X (mp=0x%08X)\n",fpointer,mp);
    if (mp->marker!=ALLOC_MARKER_VALUE)
30000ada:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000add:	8b 00                	mov    eax,DWORD PTR [eax]
30000adf:	3d d0 00 0f b0       	cmp    eax,0xb00f00d0
30000ae4:	74 02                	je     30000ae8 <free+0x2d>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:91 (discriminator 2)
    {
        //print("malloc: marker not found error!!!\n");
gotoHere:
        goto gotoHere;
30000ae6:	eb fe                	jmp    30000ae6 <free+0x2b>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:93
    }
    mp->inUse=false;
30000ae8:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000aeb:	c6 40 08 00          	mov    BYTE PTR [eax+0x8],0x0
30000aef:	eb 01                	jmp    30000af2 <free+0x37>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:83
__attribute__((visibility("default"))) void free(void* fpointer)
{
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if (fpointer==NULL)
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
30000af1:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:94
        //print("malloc: marker not found error!!!\n");
gotoHere:
        goto gotoHere;
    }
    mp->inUse=false;
}
30000af2:	c9                   	leave  
30000af3:	c3                   	ret    

30000af4 <malloc_cleanup>:
malloc_cleanup():
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:97

void malloc_cleanup()
{
30000af4:	55                   	push   ebp
30000af5:	89 e5                	mov    ebp,esp
30000af7:	53                   	push   ebx
30000af8:	e8 69 18 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000afd:	05 1b 2d 00 00       	add    eax,0x2d1b
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:98
    asm("mov eax,0x164\ncall sysEnter_Vector\n"::"b" (heapBase));
30000b02:	8b 80 f4 ff ff ff    	mov    eax,DWORD PTR [eax-0xc]
30000b08:	8b 00                	mov    eax,DWORD PTR [eax]
30000b0a:	89 c3                	mov    ebx,eax
30000b0c:	b8 64 01 00 00       	mov    eax,0x164
30000b11:	e8 fc ff ff ff       	call   30000b12 <malloc_cleanup+0x1e>
/home/yogi/src/os/aproj/libChrisOS/src/malloc.c:99
30000b16:	90                   	nop
30000b17:	5b                   	pop    ebx
30000b18:	5d                   	pop    ebp
30000b19:	c3                   	ret    
30000b1a:	66 90                	xchg   ax,ax

30000b1c <memcpy>:
memcpy():
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:11
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
VISIBLE void * memcpy(void *dest, const void *src, size_t n)
{
30000b1c:	55                   	push   ebp
30000b1d:	89 e5                	mov    ebp,esp
30000b1f:	83 ec 20             	sub    esp,0x20
30000b22:	e8 3f 18 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000b27:	05 f1 2c 00 00       	add    eax,0x2cf1
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:14
    bool dw,dd;
    
    dd=n%4==0;
30000b2c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b2f:	83 e0 03             	and    eax,0x3
30000b32:	85 c0                	test   eax,eax
30000b34:	0f 94 c0             	sete   al
30000b37:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:15
    dw=n%2==0;
30000b3a:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b3d:	83 e0 01             	and    eax,0x1
30000b40:	85 c0                	test   eax,eax
30000b42:	0f 94 c0             	sete   al
30000b45:	88 45 e6             	mov    BYTE PTR [ebp-0x1a],al
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:16
    if (dd)
30000b48:	80 7d e7 00          	cmp    BYTE PTR [ebp-0x19],0x0
30000b4c:	74 7d                	je     30000bcb <memcpy+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:18
    {
        n /=4;
30000b4e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b51:	c1 e8 02             	shr    eax,0x2
30000b54:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:19
        const uint32_t *f = src;
30000b57:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000b5a:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:20
        uint32_t *t = dest;
30000b5d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000b60:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:22

        if (f < t) {
30000b63:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000b66:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
30000b69:	73 4b                	jae    30000bb6 <memcpy+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:23
                f += n;
30000b6b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b6e:	c1 e0 02             	shl    eax,0x2
30000b71:	01 45 fc             	add    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:24
                t += n;
30000b74:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b77:	c1 e0 02             	shl    eax,0x2
30000b7a:	01 45 f8             	add    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:25
                while ( (n)-- > 0)
30000b7d:	eb 12                	jmp    30000b91 <memcpy+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:26
                        *--t = *--f;
30000b7f:	83 6d f8 04          	sub    DWORD PTR [ebp-0x8],0x4
30000b83:	83 6d fc 04          	sub    DWORD PTR [ebp-0x4],0x4
30000b87:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000b8a:	8b 10                	mov    edx,DWORD PTR [eax]
30000b8c:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000b8f:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:25
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
30000b91:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000b94:	8d 50 ff             	lea    edx,[eax-0x1]
30000b97:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000b9a:	85 c0                	test   eax,eax
30000b9c:	75 e1                	jne    30000b7f <memcpy+0x63>
30000b9e:	eb 23                	jmp    30000bc3 <memcpy+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:29
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
30000ba0:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000ba3:	8d 50 04             	lea    edx,[eax+0x4]
30000ba6:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
30000ba9:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30000bac:	8d 4a 04             	lea    ecx,[edx+0x4]
30000baf:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
30000bb2:	8b 12                	mov    edx,DWORD PTR [edx]
30000bb4:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:28
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
30000bb6:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000bb9:	8d 50 ff             	lea    edx,[eax-0x1]
30000bbc:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000bbf:	85 c0                	test   eax,eax
30000bc1:	75 dd                	jne    30000ba0 <memcpy+0x84>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:30
                        *t++ = *f++;
        return dest;
30000bc3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000bc6:	e9 ea 00 00 00       	jmp    30000cb5 <memcpy+0x199>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:32
    }
    else if (dw)
30000bcb:	80 7d e6 00          	cmp    BYTE PTR [ebp-0x1a],0x0
30000bcf:	74 79                	je     30000c4a <memcpy+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:34
    {
        n /=2;
30000bd1:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000bd4:	d1 e8                	shr    eax,1
30000bd6:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:35
        const uint32_t *f = src;
30000bd9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000bdc:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:36
        uint32_t *t = dest;
30000bdf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000be2:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:38

        if (f < t) {
30000be5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000be8:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30000beb:	73 4b                	jae    30000c38 <memcpy+0x11c>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:39
                f += n;
30000bed:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000bf0:	c1 e0 02             	shl    eax,0x2
30000bf3:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:40
                t += n;
30000bf6:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000bf9:	c1 e0 02             	shl    eax,0x2
30000bfc:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:41
                while ( (n)-- > 0)
30000bff:	eb 12                	jmp    30000c13 <memcpy+0xf7>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:42
                        *--t = *--f;
30000c01:	83 6d f0 04          	sub    DWORD PTR [ebp-0x10],0x4
30000c05:	83 6d f4 04          	sub    DWORD PTR [ebp-0xc],0x4
30000c09:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000c0c:	8b 10                	mov    edx,DWORD PTR [eax]
30000c0e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000c11:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:41
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
30000c13:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c16:	8d 50 ff             	lea    edx,[eax-0x1]
30000c19:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000c1c:	85 c0                	test   eax,eax
30000c1e:	75 e1                	jne    30000c01 <memcpy+0xe5>
30000c20:	eb 23                	jmp    30000c45 <memcpy+0x129>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:45
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
30000c22:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000c25:	8d 50 04             	lea    edx,[eax+0x4]
30000c28:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
30000c2b:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
30000c2e:	8d 4a 04             	lea    ecx,[edx+0x4]
30000c31:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
30000c34:	8b 12                	mov    edx,DWORD PTR [edx]
30000c36:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:44
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
30000c38:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c3b:	8d 50 ff             	lea    edx,[eax-0x1]
30000c3e:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000c41:	85 c0                	test   eax,eax
30000c43:	75 dd                	jne    30000c22 <memcpy+0x106>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:46
                        *t++ = *f++;
        return dest;
30000c45:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000c48:	eb 6b                	jmp    30000cb5 <memcpy+0x199>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:50
    }
    else
    {
        const char *f = src;
30000c4a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000c4d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:51
        char *t = dest;
30000c50:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000c53:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:53

        if (f < t) {
30000c56:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000c59:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
30000c5c:	73 47                	jae    30000ca5 <memcpy+0x189>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:54
                f += n;
30000c5e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c61:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:55
                t += n;
30000c64:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c67:	01 45 e8             	add    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:56
                while (n-- > 0)
30000c6a:	eb 13                	jmp    30000c7f <memcpy+0x163>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:57
                        *--t = *--f;
30000c6c:	83 6d e8 01          	sub    DWORD PTR [ebp-0x18],0x1
30000c70:	83 6d ec 01          	sub    DWORD PTR [ebp-0x14],0x1
30000c74:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000c77:	0f b6 10             	movzx  edx,BYTE PTR [eax]
30000c7a:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30000c7d:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:56
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
30000c7f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000c82:	8d 50 ff             	lea    edx,[eax-0x1]
30000c85:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000c88:	85 c0                	test   eax,eax
30000c8a:	75 e0                	jne    30000c6c <memcpy+0x150>
30000c8c:	eb 24                	jmp    30000cb2 <memcpy+0x196>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:60
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
30000c8e:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30000c91:	8d 50 01             	lea    edx,[eax+0x1]
30000c94:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
30000c97:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000c9a:	8d 4a 01             	lea    ecx,[edx+0x1]
30000c9d:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
30000ca0:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000ca3:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:59
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
30000ca5:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000ca8:	8d 50 ff             	lea    edx,[eax-0x1]
30000cab:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000cae:	85 c0                	test   eax,eax
30000cb0:	75 dc                	jne    30000c8e <memcpy+0x172>
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:61
                        *t++ = *f++;
        return dest;
30000cb2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memcpy.c:63
    }
}
30000cb5:	c9                   	leave  
30000cb6:	c3                   	ret    
30000cb7:	90                   	nop

30000cb8 <memset>:
memset():
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:9
 * and open the template in the editor.
 */
#include "libChrisOS.h"

VISIBLE void *memset(void *d1, int val, size_t len)
{
30000cb8:	55                   	push   ebp
30000cb9:	89 e5                	mov    ebp,esp
30000cbb:	83 ec 20             	sub    esp,0x20
30000cbe:	e8 a3 16 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000cc3:	05 55 2b 00 00       	add    eax,0x2b55
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:10
    uint8_t *d = d1;
30000cc8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000ccb:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:11
    uint16_t*e = d1;
30000cce:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000cd1:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:12
    uint16_t eVal=(val << 16) | (val << 8) | val;
30000cd4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cd7:	c1 e0 10             	shl    eax,0x10
30000cda:	89 c2                	mov    edx,eax
30000cdc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cdf:	c1 e0 08             	shl    eax,0x8
30000ce2:	09 c2                	or     edx,eax
30000ce4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000ce7:	09 d0                	or     eax,edx
30000ce9:	66 89 45 f2          	mov    WORD PTR [ebp-0xe],ax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:13
    uint32_t*f = d1;
30000ced:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000cf0:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:14
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
30000cf3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cf6:	c1 e0 18             	shl    eax,0x18
30000cf9:	89 c2                	mov    edx,eax
30000cfb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000cfe:	c1 e0 10             	shl    eax,0x10
30000d01:	09 c2                	or     edx,eax
30000d03:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000d06:	c1 e0 08             	shl    eax,0x8
30000d09:	09 d0                	or     eax,edx
30000d0b:	0b 45 0c             	or     eax,DWORD PTR [ebp+0xc]
30000d0e:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:16
    
    if ((len%4)==0)
30000d11:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000d14:	83 e0 03             	and    eax,0x3
30000d17:	85 c0                	test   eax,eax
30000d19:	75 1c                	jne    30000d37 <memset+0x7f>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:17
    while (len-=4) {
30000d1b:	eb 0e                	jmp    30000d2b <memset+0x73>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:18
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
30000d1d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000d20:	8d 50 04             	lea    edx,[eax+0x4]
30000d23:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000d26:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000d29:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:17
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
30000d2b:	83 6d 10 04          	sub    DWORD PTR [ebp+0x10],0x4
30000d2f:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000d33:	75 e8                	jne    30000d1d <memset+0x65>
30000d35:	eb 43                	jmp    30000d7a <memset+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:20
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
30000d37:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000d3a:	83 e0 01             	and    eax,0x1
30000d3d:	85 c0                	test   eax,eax
30000d3f:	75 2c                	jne    30000d6d <memset+0xb5>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:21
    while (len-=2) {
30000d41:	eb 10                	jmp    30000d53 <memset+0x9b>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:22
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
30000d43:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000d46:	8d 50 02             	lea    edx,[eax+0x2]
30000d49:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
30000d4c:	0f b7 55 f2          	movzx  edx,WORD PTR [ebp-0xe]
30000d50:	66 89 10             	mov    WORD PTR [eax],dx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:21
    if ((len%4)==0)
    while (len-=4) {
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
    while (len-=2) {
30000d53:	83 6d 10 02          	sub    DWORD PTR [ebp+0x10],0x2
30000d57:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000d5b:	75 e6                	jne    30000d43 <memset+0x8b>
30000d5d:	eb 1b                	jmp    30000d7a <memset+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:26
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
        *d++ = val;
30000d5f:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000d62:	8d 50 01             	lea    edx,[eax+0x1]
30000d65:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000d68:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000d6b:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:25
    else if (((len%2)==0))
    while (len-=2) {
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
30000d6d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000d70:	8d 50 ff             	lea    edx,[eax-0x1]
30000d73:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000d76:	85 c0                	test   eax,eax
30000d78:	75 e5                	jne    30000d5f <memset+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:28
        *d++ = val;
    }
    return d1;
30000d7a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:29
}
30000d7d:	c9                   	leave  
30000d7e:	c3                   	ret    

30000d7f <memsetI>:
memsetI():
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:32

void *memsetI(void *d1, int val, size_t len)
{
30000d7f:	55                   	push   ebp
30000d80:	89 e5                	mov    ebp,esp
30000d82:	83 ec 20             	sub    esp,0x20
30000d85:	e8 dc 15 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000d8a:	05 8e 2a 00 00       	add    eax,0x2a8e
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:33
    uint8_t *d = d1;
30000d8f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000d92:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:34
    uint16_t*e = d1;
30000d95:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000d98:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:35
    uint16_t eVal=(val << 16) | (val << 8) | val;
30000d9b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000d9e:	c1 e0 10             	shl    eax,0x10
30000da1:	89 c2                	mov    edx,eax
30000da3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000da6:	c1 e0 08             	shl    eax,0x8
30000da9:	09 c2                	or     edx,eax
30000dab:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000dae:	09 d0                	or     eax,edx
30000db0:	66 89 45 f2          	mov    WORD PTR [ebp-0xe],ax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:36
    uint32_t*f = d1;
30000db4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30000db7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:37
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
30000dba:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000dbd:	c1 e0 18             	shl    eax,0x18
30000dc0:	89 c2                	mov    edx,eax
30000dc2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000dc5:	c1 e0 10             	shl    eax,0x10
30000dc8:	09 c2                	or     edx,eax
30000dca:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30000dcd:	c1 e0 08             	shl    eax,0x8
30000dd0:	09 d0                	or     eax,edx
30000dd2:	0b 45 0c             	or     eax,DWORD PTR [ebp+0xc]
30000dd5:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:39
    
    if ((len%4)==0)
30000dd8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000ddb:	83 e0 03             	and    eax,0x3
30000dde:	85 c0                	test   eax,eax
30000de0:	75 1c                	jne    30000dfe <memsetI+0x7f>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:40
    while (len-=4) {
30000de2:	eb 0e                	jmp    30000df2 <memsetI+0x73>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:41
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
30000de4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000de7:	8d 50 04             	lea    edx,[eax+0x4]
30000dea:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000ded:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000df0:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:40
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
30000df2:	83 6d 10 04          	sub    DWORD PTR [ebp+0x10],0x4
30000df6:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000dfa:	75 e8                	jne    30000de4 <memsetI+0x65>
30000dfc:	eb 43                	jmp    30000e41 <memsetI+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:43
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
30000dfe:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000e01:	83 e0 01             	and    eax,0x1
30000e04:	85 c0                	test   eax,eax
30000e06:	75 2c                	jne    30000e34 <memsetI+0xb5>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:44
    while (len-=2) {
30000e08:	eb 10                	jmp    30000e1a <memsetI+0x9b>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:45
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
30000e0a:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30000e0d:	8d 50 02             	lea    edx,[eax+0x2]
30000e10:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
30000e13:	0f b7 55 f2          	movzx  edx,WORD PTR [ebp-0xe]
30000e17:	66 89 10             	mov    WORD PTR [eax],dx
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:44
    if ((len%4)==0)
    while (len-=4) {
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
    while (len-=2) {
30000e1a:	83 6d 10 02          	sub    DWORD PTR [ebp+0x10],0x2
30000e1e:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30000e22:	75 e6                	jne    30000e0a <memsetI+0x8b>
30000e24:	eb 1b                	jmp    30000e41 <memsetI+0xc2>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:49
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
        *d++ = val;
30000e26:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30000e29:	8d 50 01             	lea    edx,[eax+0x1]
30000e2c:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30000e2f:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30000e32:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:48
    else if (((len%2)==0))
    while (len-=2) {
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
30000e34:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30000e37:	8d 50 ff             	lea    edx,[eax-0x1]
30000e3a:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30000e3d:	85 c0                	test   eax,eax
30000e3f:	75 e5                	jne    30000e26 <memsetI+0xa7>
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:51
        *d++ = val;
    }
    return d1;
30000e41:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/memset.c:52
}
30000e44:	c9                   	leave  
30000e45:	c3                   	ret    
30000e46:	66 90                	xchg   ax,ax

30000e48 <mmap>:
mmap():
/home/yogi/src/os/aproj/libChrisOS/src/mmap.c:10
 */
#include "libChrisOS.h"
#include "types.h"

VISIBLE void* mmap (void *addr,size_t len,int prot,int flags,int fd,off_t offset) //memory map pages either to a file or anonymously
{
30000e48:	55                   	push   ebp
30000e49:	89 e5                	mov    ebp,esp
30000e4b:	e8 16 15 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000e50:	05 c8 29 00 00       	add    eax,0x29c8
/home/yogi/src/os/aproj/libChrisOS/src/mmap.c:12
    
}
30000e55:	90                   	nop
30000e56:	5d                   	pop    ebp
30000e57:	c3                   	ret    

30000e58 <readConsole>:
readConsole():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:19
file_operations_t fops;
inode_t console_node={.i_dev=1,.i_mode=0};
file_t console_file;

size_t readConsole (struct file * fptr, char *buffer, size_t size, uint64_t* whatever) 
{
30000e58:	55                   	push   ebp
30000e59:	89 e5                	mov    ebp,esp
30000e5b:	53                   	push   ebx
30000e5c:	83 ec 04             	sub    esp,0x4
30000e5f:	e8 02 15 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000e64:	05 b4 29 00 00       	add    eax,0x29b4
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:20
    return gets(buffer,size,1);
30000e69:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
30000e6c:	83 ec 04             	sub    esp,0x4
30000e6f:	6a 01                	push   0x1
30000e71:	52                   	push   edx
30000e72:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000e75:	89 c3                	mov    ebx,eax
30000e77:	e8 14 15 00 00       	call   30002390 <__x86.get_pc_thunk.ax+0x2a>
30000e7c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:21
}
30000e7f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000e82:	c9                   	leave  
30000e83:	c3                   	ret    

30000e84 <writeConsole>:
writeConsole():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:24

size_t writeConsole(struct file * fptr, const char *buffer, size_t size, uint64_t *whatever)
{
30000e84:	55                   	push   ebp
30000e85:	89 e5                	mov    ebp,esp
30000e87:	53                   	push   ebx
30000e88:	83 ec 04             	sub    esp,0x4
30000e8b:	e8 d6 14 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30000e90:	05 88 29 00 00       	add    eax,0x2988
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:25
    return printI(buffer);
30000e95:	83 ec 0c             	sub    esp,0xc
30000e98:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000e9b:	89 c3                	mov    ebx,eax
30000e9d:	e8 a9 f7 ff ff       	call   3000064b <printI>
30000ea2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:26
}
30000ea5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000ea8:	c9                   	leave  
30000ea9:	c3                   	ret    

30000eaa <moveTo>:
moveTo():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:29

VISIBLE void moveTo(int row, int col)
{
30000eaa:	55                   	push   ebp
30000eab:	89 e5                	mov    ebp,esp
30000ead:	53                   	push   ebx
30000eae:	83 ec 24             	sub    esp,0x24
30000eb1:	e8 0a 15 00 00       	call   300023c0 <__x86.get_pc_thunk.bx>
30000eb6:	81 c3 62 29 00 00    	add    ebx,0x2962
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:32
    char buff[10];
    char rowString[3], colString[3];
    int buffPtr=0;
30000ebc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:35
    

    memsetI(buff,0,10);
30000ec3:	83 ec 04             	sub    esp,0x4
30000ec6:	6a 0a                	push   0xa
30000ec8:	6a 00                	push   0x0
30000eca:	8d 45 de             	lea    eax,[ebp-0x22]
30000ecd:	50                   	push   eax
30000ece:	e8 ac fe ff ff       	call   30000d7f <memsetI>
30000ed3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:37
    //Convert row and column values to strings
    itoaI(row, rowString);
30000ed6:	83 ec 08             	sub    esp,0x8
30000ed9:	8d 45 db             	lea    eax,[ebp-0x25]
30000edc:	50                   	push   eax
30000edd:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30000ee0:	e8 46 f3 ff ff       	call   3000022b <itoaI>
30000ee5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:38
    itoaI(col, colString);
30000ee8:	83 ec 08             	sub    esp,0x8
30000eeb:	8d 45 d8             	lea    eax,[ebp-0x28]
30000eee:	50                   	push   eax
30000eef:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30000ef2:	e8 34 f3 ff ff       	call   3000022b <itoaI>
30000ef7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:41
    
    //Send the ansi escape sequence CSI characters
    buff[buffPtr++] = '\033';
30000efa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000efd:	8d 50 01             	lea    edx,[eax+0x1]
30000f00:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000f03:	c6 44 05 de 1b       	mov    BYTE PTR [ebp+eax*1-0x22],0x1b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:42
    buff[buffPtr++] = '[';
30000f08:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000f0b:	8d 50 01             	lea    edx,[eax+0x1]
30000f0e:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000f11:	c6 44 05 de 5b       	mov    BYTE PTR [ebp+eax*1-0x22],0x5b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:45

    
    for (int cnt=0;cnt<3;cnt++)
30000f16:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
30000f1d:	eb 2b                	jmp    30000f4a <moveTo+0xa0>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:46
        if (rowString[cnt]!=0)
30000f1f:	8d 55 db             	lea    edx,[ebp-0x25]
30000f22:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30000f25:	01 d0                	add    eax,edx
30000f27:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f2a:	84 c0                	test   al,al
30000f2c:	74 24                	je     30000f52 <moveTo+0xa8>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:47
            buff[buffPtr++]=rowString[cnt];
30000f2e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000f31:	8d 50 01             	lea    edx,[eax+0x1]
30000f34:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000f37:	8d 4d db             	lea    ecx,[ebp-0x25]
30000f3a:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
30000f3d:	01 ca                	add    edx,ecx
30000f3f:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000f42:	88 54 05 de          	mov    BYTE PTR [ebp+eax*1-0x22],dl
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:45
    //Send the ansi escape sequence CSI characters
    buff[buffPtr++] = '\033';
    buff[buffPtr++] = '[';

    
    for (int cnt=0;cnt<3;cnt++)
30000f46:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:45 (discriminator 1)
30000f4a:	83 7d f0 02          	cmp    DWORD PTR [ebp-0x10],0x2
30000f4e:	7e cf                	jle    30000f1f <moveTo+0x75>
30000f50:	eb 01                	jmp    30000f53 <moveTo+0xa9>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:49
        if (rowString[cnt]!=0)
            buff[buffPtr++]=rowString[cnt];
        else
            break;
30000f52:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:50
    buff[buffPtr++] = ';';
30000f53:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000f56:	8d 50 01             	lea    edx,[eax+0x1]
30000f59:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000f5c:	c6 44 05 de 3b       	mov    BYTE PTR [ebp+eax*1-0x22],0x3b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:51
    for (int cnt=0;cnt<3;cnt++)
30000f61:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
30000f68:	eb 2b                	jmp    30000f95 <moveTo+0xeb>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:52
        if (colString[cnt]!=0)
30000f6a:	8d 55 d8             	lea    edx,[ebp-0x28]
30000f6d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30000f70:	01 d0                	add    eax,edx
30000f72:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30000f75:	84 c0                	test   al,al
30000f77:	74 24                	je     30000f9d <moveTo+0xf3>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:53
            buff[buffPtr++]=colString[cnt];
30000f79:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000f7c:	8d 50 01             	lea    edx,[eax+0x1]
30000f7f:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000f82:	8d 4d d8             	lea    ecx,[ebp-0x28]
30000f85:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
30000f88:	01 ca                	add    edx,ecx
30000f8a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30000f8d:	88 54 05 de          	mov    BYTE PTR [ebp+eax*1-0x22],dl
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:51
        if (rowString[cnt]!=0)
            buff[buffPtr++]=rowString[cnt];
        else
            break;
    buff[buffPtr++] = ';';
    for (int cnt=0;cnt<3;cnt++)
30000f91:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:51 (discriminator 1)
30000f95:	83 7d ec 02          	cmp    DWORD PTR [ebp-0x14],0x2
30000f99:	7e cf                	jle    30000f6a <moveTo+0xc0>
30000f9b:	eb 01                	jmp    30000f9e <moveTo+0xf4>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:55
        if (colString[cnt]!=0)
            buff[buffPtr++]=colString[cnt];
        else
            break;
30000f9d:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:56
    buff[buffPtr++] = 'H';
30000f9e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000fa1:	8d 50 01             	lea    edx,[eax+0x1]
30000fa4:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000fa7:	c6 44 05 de 48       	mov    BYTE PTR [ebp+eax*1-0x22],0x48
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:57
    for (int cnt=buffPtr;cnt<10;cnt++)
30000fac:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000faf:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
30000fb2:	eb 12                	jmp    30000fc6 <moveTo+0x11c>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:58 (discriminator 3)
        buff[buffPtr++]=0;
30000fb4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30000fb7:	8d 50 01             	lea    edx,[eax+0x1]
30000fba:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30000fbd:	c6 44 05 de 00       	mov    BYTE PTR [ebp+eax*1-0x22],0x0
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:57 (discriminator 3)
        if (colString[cnt]!=0)
            buff[buffPtr++]=colString[cnt];
        else
            break;
    buff[buffPtr++] = 'H';
    for (int cnt=buffPtr;cnt<10;cnt++)
30000fc2:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:57 (discriminator 1)
30000fc6:	83 7d e8 09          	cmp    DWORD PTR [ebp-0x18],0x9
30000fca:	7e e8                	jle    30000fb4 <moveTo+0x10a>
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:60
        buff[buffPtr++]=0;
    
    printI(buff);
30000fcc:	83 ec 0c             	sub    esp,0xc
30000fcf:	8d 45 de             	lea    eax,[ebp-0x22]
30000fd2:	50                   	push   eax
30000fd3:	e8 73 f6 ff ff       	call   3000064b <printI>
30000fd8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:62
    
    return;
30000fdb:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:63
}
30000fdc:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30000fdf:	c9                   	leave  
30000fe0:	c3                   	ret    

30000fe1 <resetRow>:
resetRow():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:67

//Clears the current console row, setting the cursor to column 0
VISIBLE void resetRow()
{
30000fe1:	55                   	push   ebp
30000fe2:	89 e5                	mov    ebp,esp
30000fe4:	53                   	push   ebx
30000fe5:	83 ec 14             	sub    esp,0x14
30000fe8:	e8 d3 13 00 00       	call   300023c0 <__x86.get_pc_thunk.bx>
30000fed:	81 c3 2b 28 00 00    	add    ebx,0x282b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:69
    char buff[5];
    int buffPtr=0;
30000ff3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:71

    memsetI(buff,0,10);
30000ffa:	83 ec 04             	sub    esp,0x4
30000ffd:	6a 0a                	push   0xa
30000fff:	6a 00                	push   0x0
30001001:	8d 45 ef             	lea    eax,[ebp-0x11]
30001004:	50                   	push   eax
30001005:	e8 75 fd ff ff       	call   30000d7f <memsetI>
3000100a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:74
    
    //Send the ansi escape sequence CSI characters
    buff[buffPtr++] = '\033';
3000100d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001010:	8d 50 01             	lea    edx,[eax+0x1]
30001013:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30001016:	c6 44 05 ef 1b       	mov    BYTE PTR [ebp+eax*1-0x11],0x1b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:75
    buff[buffPtr++] = '[';
3000101b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000101e:	8d 50 01             	lea    edx,[eax+0x1]
30001021:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30001024:	c6 44 05 ef 5b       	mov    BYTE PTR [ebp+eax*1-0x11],0x5b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:76
    buff[buffPtr++] = '0';
30001029:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000102c:	8d 50 01             	lea    edx,[eax+0x1]
3000102f:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30001032:	c6 44 05 ef 30       	mov    BYTE PTR [ebp+eax*1-0x11],0x30
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:77
    buff[buffPtr++] = 'K';
30001037:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000103a:	8d 50 01             	lea    edx,[eax+0x1]
3000103d:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30001040:	c6 44 05 ef 4b       	mov    BYTE PTR [ebp+eax*1-0x11],0x4b
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:78
    buff[buffPtr] = '\0';
30001045:	8d 55 ef             	lea    edx,[ebp-0x11]
30001048:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000104b:	01 d0                	add    eax,edx
3000104d:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:79
    printI(buff);
30001050:	83 ec 0c             	sub    esp,0xc
30001053:	8d 45 ef             	lea    eax,[ebp-0x11]
30001056:	50                   	push   eax
30001057:	e8 ef f5 ff ff       	call   3000064b <printI>
3000105c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:81
    
    return;
3000105f:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:82
}
30001060:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30001063:	c9                   	leave  
30001064:	c3                   	ret    

30001065 <ioInit>:
ioInit():
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:85

void ioInit()
{
30001065:	55                   	push   ebp
30001066:	89 e5                	mov    ebp,esp
30001068:	e8 f9 12 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000106d:	05 ab 27 00 00       	add    eax,0x27ab
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:86
    console_file.f_inode=&console_node;
30001072:	8b 90 ec ff ff ff    	mov    edx,DWORD PTR [eax-0x14]
30001078:	8d 88 08 ff ff ff    	lea    ecx,[eax-0xf8]
3000107e:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:87
    fops.read=readConsole;
30001081:	8b 90 e8 ff ff ff    	mov    edx,DWORD PTR [eax-0x18]
30001087:	8d 88 40 d6 ff ff    	lea    ecx,[eax-0x29c0]
3000108d:	89 0a                	mov    DWORD PTR [edx],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:88
    fops.write=writeConsole;
3000108f:	8b 90 e8 ff ff ff    	mov    edx,DWORD PTR [eax-0x18]
30001095:	8d 88 6c d6 ff ff    	lea    ecx,[eax-0x2994]
3000109b:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:89
    console_file.fops=fops;
3000109e:	8b 88 ec ff ff ff    	mov    ecx,DWORD PTR [eax-0x14]
300010a4:	8b 80 e8 ff ff ff    	mov    eax,DWORD PTR [eax-0x18]
300010aa:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
300010ad:	8b 00                	mov    eax,DWORD PTR [eax]
300010af:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
300010b2:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/stdio.c:90
300010b5:	90                   	nop
300010b6:	5d                   	pop    ebp
300010b7:	c3                   	ret    

300010b8 <strcat>:
strcat():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:30
   #endif
   
   /* Append SRC on the end of DEST.  */
   __attribute__((visibility("default"))) char *
   STRCAT (char *dest, const char *src)
   {
300010b8:	55                   	push   ebp
300010b9:	89 e5                	mov    ebp,esp
300010bb:	53                   	push   ebx
300010bc:	83 ec 04             	sub    esp,0x4
300010bf:	e8 fc 12 00 00       	call   300023c0 <__x86.get_pc_thunk.bx>
300010c4:	81 c3 54 27 00 00    	add    ebx,0x2754
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:31
     strcpy (dest + strlen (dest), src);
300010ca:	83 ec 0c             	sub    esp,0xc
300010cd:	ff 75 08             	push   DWORD PTR [ebp+0x8]
300010d0:	e8 db 12 00 00       	call   300023b0 <__x86.get_pc_thunk.ax+0x4a>
300010d5:	83 c4 10             	add    esp,0x10
300010d8:	89 c2                	mov    edx,eax
300010da:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300010dd:	01 d0                	add    eax,edx
300010df:	83 ec 08             	sub    esp,0x8
300010e2:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
300010e5:	50                   	push   eax
300010e6:	e8 95 12 00 00       	call   30002380 <__x86.get_pc_thunk.ax+0x1a>
300010eb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:32
     return dest;
300010ee:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:33
   }
300010f1:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
300010f4:	c9                   	leave  
300010f5:	c3                   	ret    

300010f6 <concatenate>:
concatenate():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:35

   void concatenate(char p[], char q[]) {
300010f6:	55                   	push   ebp
300010f7:	89 e5                	mov    ebp,esp
300010f9:	83 ec 10             	sub    esp,0x10
300010fc:	e8 65 12 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30001101:	05 17 27 00 00       	add    eax,0x2717
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:38
   int c, d;
 
   c = 0;
30001106:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:40
 
   while (p[c] != '\0') {
3000110d:	eb 04                	jmp    30001113 <concatenate+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:41
      c++;  	
3000110f:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:40
   void concatenate(char p[], char q[]) {
   int c, d;
 
   c = 0;
 
   while (p[c] != '\0') {
30001113:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
30001116:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001119:	01 d0                	add    eax,edx
3000111b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000111e:	84 c0                	test   al,al
30001120:	75 ed                	jne    3000110f <concatenate+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:44
      c++;  	
   }
 
   d = 0;
30001122:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:46
 
   while (q[d] != '\0') {
30001129:	eb 1d                	jmp    30001148 <concatenate+0x52>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:47
      p[c] = q[d];
3000112b:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
3000112e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001131:	01 c2                	add    edx,eax
30001133:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
30001136:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001139:	01 c8                	add    eax,ecx
3000113b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000113e:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:48
      d++;
30001140:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:49
      c++;	
30001144:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:46
      c++;  	
   }
 
   d = 0;
 
   while (q[d] != '\0') {
30001148:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
3000114b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000114e:	01 d0                	add    eax,edx
30001150:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001153:	84 c0                	test   al,al
30001155:	75 d4                	jne    3000112b <concatenate+0x35>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:52
      p[c] = q[d];
      d++;
      c++;	
   }
 
   p[c] = '\0';
30001157:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
3000115a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000115d:	01 d0                	add    eax,edx
3000115f:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcat.c:53
30001162:	90                   	nop
30001163:	c9                   	leave  
30001164:	c3                   	ret    
30001165:	66 90                	xchg   ax,ax
30001167:	90                   	nop

30001168 <strcmp>:
strcmp():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:25

/* Compare S1 and S2, returning less than, equal to or
   greater than zero if S1 is lexicographically less than,
   equal to or greater than S2.  */
VISIBLE int strcmp (const char *p1, const char *p2)
{
30001168:	55                   	push   ebp
30001169:	89 e5                	mov    ebp,esp
3000116b:	56                   	push   esi
3000116c:	53                   	push   ebx
3000116d:	83 ec 10             	sub    esp,0x10
30001170:	e8 f1 11 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30001175:	05 a3 26 00 00       	add    eax,0x26a3
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:26
  register const unsigned char *s1 = (const unsigned char *) p1;
3000117a:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:27
  register const unsigned char *s2 = (const unsigned char *) p2;
3000117d:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:32
  unsigned char c1, c2;

  do
    {
      c1 = (unsigned char) *s1++;
30001180:	89 d8                	mov    eax,ebx
30001182:	8d 58 01             	lea    ebx,[eax+0x1]
30001185:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001188:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:33
      c2 = (unsigned char) *s2++;
3000118b:	89 f0                	mov    eax,esi
3000118d:	8d 70 01             	lea    esi,[eax+0x1]
30001190:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001193:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:34
      if (c1 == '\0')
30001196:	80 7d f7 00          	cmp    BYTE PTR [ebp-0x9],0x0
3000119a:	75 0e                	jne    300011aa <strcmp+0x42>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:35
	return c1 - c2;
3000119c:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
300011a0:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
300011a4:	29 c2                	sub    edx,eax
300011a6:	89 d0                	mov    eax,edx
300011a8:	eb 15                	jmp    300011bf <strcmp+0x57>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:37
    }
  while (c1 == c2);
300011aa:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
300011ae:	3a 45 f6             	cmp    al,BYTE PTR [ebp-0xa]
300011b1:	74 cd                	je     30001180 <strcmp+0x18>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:39

  return c1 - c2;
300011b3:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
300011b7:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
300011bb:	29 c2                	sub    edx,eax
300011bd:	89 d0                	mov    eax,edx
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcmp.c:40
}
300011bf:	83 c4 10             	add    esp,0x10
300011c2:	5b                   	pop    ebx
300011c3:	5e                   	pop    esi
300011c4:	5d                   	pop    ebp
300011c5:	c3                   	ret    
300011c6:	66 90                	xchg   ax,ax

300011c8 <strcpy>:
strcpy():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:5
#include "strings.h"

__attribute__((visibility("default"))) char *
strcpy(char *s1, const char *s2)
{
300011c8:	55                   	push   ebp
300011c9:	89 e5                	mov    ebp,esp
300011cb:	83 ec 10             	sub    esp,0x10
300011ce:	e8 93 11 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300011d3:	05 45 26 00 00       	add    eax,0x2645
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:6
    char *s = s1;
300011d8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300011db:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:7
    while ((*s++ = *s2++) != 0)
300011de:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:7 (discriminator 1)
300011df:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300011e2:	8d 50 01             	lea    edx,[eax+0x1]
300011e5:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
300011e8:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
300011eb:	8d 4a 01             	lea    ecx,[edx+0x1]
300011ee:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
300011f1:	0f b6 12             	movzx  edx,BYTE PTR [edx]
300011f4:	88 10                	mov    BYTE PTR [eax],dl
300011f6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300011f9:	84 c0                	test   al,al
300011fb:	75 e2                	jne    300011df <strcpy+0x17>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:9
	;
    *s=0;       //CLR 04/20/2017: Added terminating null character to returned string
300011fd:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30001200:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:10
    return (s1);
30001203:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:11
}
30001206:	c9                   	leave  
30001207:	c3                   	ret    

30001208 <strcpyc>:
strcpyc():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:15

__attribute__((visibility("default"))) char *
strcpyc(char *s1, const char *s2, unsigned count)
{
30001208:	55                   	push   ebp
30001209:	89 e5                	mov    ebp,esp
3000120b:	83 ec 10             	sub    esp,0x10
3000120e:	e8 53 11 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30001213:	05 05 26 00 00       	add    eax,0x2605
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:16
    char *s = s1;
30001218:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000121b:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17
    while ((*s++ = *s2++) != 0 && count-->0)
3000121e:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17 (discriminator 2)
3000121f:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30001222:	8d 50 01             	lea    edx,[eax+0x1]
30001225:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
30001228:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
3000122b:	8d 4a 01             	lea    ecx,[edx+0x1]
3000122e:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
30001231:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30001234:	88 10                	mov    BYTE PTR [eax],dl
30001236:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001239:	84 c0                	test   al,al
3000123b:	74 0d                	je     3000124a <strcpyc+0x42>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:17 (discriminator 1)
3000123d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30001240:	8d 50 ff             	lea    edx,[eax-0x1]
30001243:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
30001246:	85 c0                	test   eax,eax
30001248:	75 d5                	jne    3000121f <strcpyc+0x17>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:19
	;
    return (s1);
3000124a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strcpy.c:20
}
3000124d:	c9                   	leave  
3000124e:	c3                   	ret    
3000124f:	90                   	nop

30001250 <strlen>:
strlen():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:3
#include <stddef.h>

__attribute__((visibility("default"))) size_t strlen(const char* str) {
30001250:	55                   	push   ebp
30001251:	89 e5                	mov    ebp,esp
30001253:	83 ec 10             	sub    esp,0x10
30001256:	e8 0b 11 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000125b:	05 bd 25 00 00       	add    eax,0x25bd
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:4
          size_t ret = 0;
30001260:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:5
        while ( str[ret] != 0 )
30001267:	eb 04                	jmp    3000126d <strlen+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:6
                ret++;
30001269:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:5
#include <stddef.h>

__attribute__((visibility("default"))) size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
3000126d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001270:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30001273:	01 d0                	add    eax,edx
30001275:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001278:	84 c0                	test   al,al
3000127a:	75 ed                	jne    30001269 <strlen+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:7
                ret++;
        return ret;
3000127c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:8
}
3000127f:	c9                   	leave  
30001280:	c3                   	ret    

30001281 <strlenI>:
strlenI():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:10

size_t strlenI(const char* str) {
30001281:	55                   	push   ebp
30001282:	89 e5                	mov    ebp,esp
30001284:	83 ec 10             	sub    esp,0x10
30001287:	e8 da 10 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000128c:	05 8c 25 00 00       	add    eax,0x258c
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:11
          size_t ret = 0;
30001291:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:12
        while ( str[ret] != 0 )
30001298:	eb 04                	jmp    3000129e <strlenI+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:13
                ret++;
3000129a:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:12
        return ret;
}

size_t strlenI(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
3000129e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
300012a1:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
300012a4:	01 d0                	add    eax,edx
300012a6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300012a9:	84 c0                	test   al,al
300012ab:	75 ed                	jne    3000129a <strlenI+0x19>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:14
                ret++;
        return ret;
300012ad:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strlen.c:15
}
300012b0:	c9                   	leave  
300012b1:	c3                   	ret    
300012b2:	66 90                	xchg   ax,ax

300012b4 <strncmp>:
strncmp():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:13
 *   array pointed to by `s2'.  [4.11.4.4]
 */
#include <stddef.h>

__attribute__((visibility("default"))) int strncmp(const char *s1, const char *s2, size_t n)
{
300012b4:	55                   	push   ebp
300012b5:	89 e5                	mov    ebp,esp
300012b7:	e8 aa 10 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300012bc:	05 5c 25 00 00       	add    eax,0x255c
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14
    for ( ; n > 0; s1++, s2++, --n)
300012c1:	eb 4b                	jmp    3000130e <strncmp+0x5a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:15
	if (*s1 != *s2)
300012c3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300012c6:	0f b6 10             	movzx  edx,BYTE PTR [eax]
300012c9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300012cc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300012cf:	38 c2                	cmp    dl,al
300012d1:	74 1e                	je     300012f1 <strncmp+0x3d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
300012d3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300012d6:	0f b6 10             	movzx  edx,BYTE PTR [eax]
300012d9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300012dc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300012df:	38 c2                	cmp    dl,al
300012e1:	73 07                	jae    300012ea <strncmp+0x36>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16 (discriminator 1)
300012e3:	b8 ff ff ff ff       	mov    eax,0xffffffff
300012e8:	eb 2f                	jmp    30001319 <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:16 (discriminator 2)
300012ea:	b8 01 00 00 00       	mov    eax,0x1
300012ef:	eb 28                	jmp    30001319 <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:17
	else if (*s1 == '\0')
300012f1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
300012f4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300012f7:	84 c0                	test   al,al
300012f9:	75 07                	jne    30001302 <strncmp+0x4e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:18
	    return 0;
300012fb:	b8 00 00 00 00       	mov    eax,0x0
30001300:	eb 17                	jmp    30001319 <strncmp+0x65>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14
 */
#include <stddef.h>

__attribute__((visibility("default"))) int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
30001302:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
30001306:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
3000130a:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:14 (discriminator 1)
3000130e:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30001312:	75 af                	jne    300012c3 <strncmp+0xf>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:19
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
    return 0;
30001314:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncmp.c:20
}
30001319:	5d                   	pop    ebp
3000131a:	c3                   	ret    
3000131b:	90                   	nop

3000131c <strncpy>:
strncpy():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:14
 *   The `strncpy' function returns the value of `s1'.  [4.11.2.4]
 */
#include <stddef.h>

__attribute__((visibility("default"))) char * strncpy(char *s1, const char *s2, size_t n)
{
3000131c:	55                   	push   ebp
3000131d:	89 e5                	mov    ebp,esp
3000131f:	83 ec 10             	sub    esp,0x10
30001322:	e8 3f 10 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30001327:	05 f1 24 00 00       	add    eax,0x24f1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:15
    char *s = s1;
3000132c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000132f:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16
    while (n > 0 && *s2 != '\0') {
30001332:	eb 1b                	jmp    3000134f <strncpy+0x33>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:17
	*s++ = *s2++;
30001334:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30001337:	8d 50 01             	lea    edx,[eax+0x1]
3000133a:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
3000133d:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
30001340:	8d 4a 01             	lea    ecx,[edx+0x1]
30001343:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
30001346:	0f b6 12             	movzx  edx,BYTE PTR [edx]
30001349:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:18
	--n;
3000134b:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16
#include <stddef.h>

__attribute__((visibility("default"))) char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
3000134f:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30001353:	74 1c                	je     30001371 <strncpy+0x55>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:16 (discriminator 1)
30001355:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001358:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000135b:	84 c0                	test   al,al
3000135d:	75 d5                	jne    30001334 <strncpy+0x18>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:20
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
3000135f:	eb 10                	jmp    30001371 <strncpy+0x55>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:21
	*s++ = '\0';
30001361:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
30001364:	8d 50 01             	lea    edx,[eax+0x1]
30001367:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
3000136a:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:22
	--n;
3000136d:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:20
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
30001371:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30001375:	75 ea                	jne    30001361 <strncpy+0x45>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:24
	*s++ = '\0';
	--n;
    }
    return s1;
30001377:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strncpy.c:25
}
3000137a:	c9                   	leave  
3000137b:	c3                   	ret    

3000137c <strtoul>:
strtoul():
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:60
 * Ignores `locale' stuff.  Assumes that the upper and lower case
 * alphabets and digits are each contiguous.
 */
unsigned long
__attribute__((visibility("default"))) strtoul(const char *nptr, char **endptr, register int base)
{
3000137c:	55                   	push   ebp
3000137d:	89 e5                	mov    ebp,esp
3000137f:	57                   	push   edi
30001380:	56                   	push   esi
30001381:	53                   	push   ebx
30001382:	83 ec 08             	sub    esp,0x8
30001385:	e8 dc 0f 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000138a:	05 8e 24 00 00       	add    eax,0x248e
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:61
	register const char *s = nptr;
3000138f:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:65
	register unsigned long acc;
	register int c;
	register unsigned long cutoff;
	register int neg = 0, any, cutlim;
30001392:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:71 (discriminator 1)

	/*
	 * See strtol for comments as to the logic used.
	 */
	do {
		c = *s++;
30001399:	89 f0                	mov    eax,esi
3000139b:	8d 70 01             	lea    esi,[eax+0x1]
3000139e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300013a1:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:72 (discriminator 1)
	} while (c==' ');
300013a4:	83 fb 20             	cmp    ebx,0x20
300013a7:	74 f0                	je     30001399 <strtoul+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:73
	if (c == '-') {
300013a9:	83 fb 2d             	cmp    ebx,0x2d
300013ac:	75 14                	jne    300013c2 <strtoul+0x46>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:74
		neg = 1;
300013ae:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:75
		c = *s++;
300013b5:	89 f0                	mov    eax,esi
300013b7:	8d 70 01             	lea    esi,[eax+0x1]
300013ba:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300013bd:	0f be d8             	movsx  ebx,al
300013c0:	eb 10                	jmp    300013d2 <strtoul+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:76
	} else if (c == '+')
300013c2:	83 fb 2b             	cmp    ebx,0x2b
300013c5:	75 0b                	jne    300013d2 <strtoul+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:77
		c = *s++;
300013c7:	89 f0                	mov    eax,esi
300013c9:	8d 70 01             	lea    esi,[eax+0x1]
300013cc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300013cf:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78
	if ((base == 0 || base == 16) &&
300013d2:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
300013d6:	74 06                	je     300013de <strtoul+0x62>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78 (discriminator 2)
300013d8:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
300013dc:	75 26                	jne    30001404 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:78 (discriminator 3)
300013de:	83 fb 30             	cmp    ebx,0x30
300013e1:	75 21                	jne    30001404 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:79
	    c == '0' && (*s == 'x' || *s == 'X')) {
300013e3:	0f b6 06             	movzx  eax,BYTE PTR [esi]
300013e6:	3c 78                	cmp    al,0x78
300013e8:	74 07                	je     300013f1 <strtoul+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:79 (discriminator 1)
300013ea:	0f b6 06             	movzx  eax,BYTE PTR [esi]
300013ed:	3c 58                	cmp    al,0x58
300013ef:	75 13                	jne    30001404 <strtoul+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:80
		c = s[1];
300013f1:	8d 46 01             	lea    eax,[esi+0x1]
300013f4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300013f7:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:81
		s += 2;
300013fa:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:82
		base = 16;
300013fd:	c7 45 10 10 00 00 00 	mov    DWORD PTR [ebp+0x10],0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:84
	}
	if (base == 0)
30001404:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30001408:	75 14                	jne    3000141e <strtoul+0xa2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85
		base = c == '0' ? 8 : 10;
3000140a:	83 fb 30             	cmp    ebx,0x30
3000140d:	75 07                	jne    30001416 <strtoul+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 1)
3000140f:	b8 08 00 00 00       	mov    eax,0x8
30001414:	eb 05                	jmp    3000141b <strtoul+0x9f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 2)
30001416:	b8 0a 00 00 00       	mov    eax,0xa
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:85 (discriminator 4)
3000141b:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:86
	cutoff = (unsigned long)ULONG_MAX / (unsigned long)base;
3000141e:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30001421:	b8 ff ff ff ff       	mov    eax,0xffffffff
30001426:	ba 00 00 00 00       	mov    edx,0x0
3000142b:	f7 f1                	div    ecx
3000142d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:87
	cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;
30001430:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
30001433:	b8 ff ff ff ff       	mov    eax,0xffffffff
30001438:	ba 00 00 00 00       	mov    edx,0x0
3000143d:	f7 f1                	div    ecx
3000143f:	89 d0                	mov    eax,edx
30001441:	89 c2                	mov    edx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:88
	for (acc = 0, any = 0;; c = *s++) {
30001443:	bf 00 00 00 00       	mov    edi,0x0
30001448:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:89
		if (ISDIGIT(c))
3000144d:	8d 43 d0             	lea    eax,[ebx-0x30]
30001450:	83 f8 09             	cmp    eax,0x9
30001453:	77 05                	ja     3000145a <strtoul+0xde>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:90
			c -= '0';
30001455:	83 eb 30             	sub    ebx,0x30
30001458:	eb 25                	jmp    3000147f <strtoul+0x103>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:91
		else if (ISALPHA(c))
3000145a:	89 d8                	mov    eax,ebx
3000145c:	83 c8 20             	or     eax,0x20
3000145f:	83 e8 61             	sub    eax,0x61
30001462:	83 f8 19             	cmp    eax,0x19
30001465:	77 56                	ja     300014bd <strtoul+0x141>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
30001467:	83 fb 40             	cmp    ebx,0x40
3000146a:	7e 0c                	jle    30001478 <strtoul+0xfc>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 1)
3000146c:	83 fb 5a             	cmp    ebx,0x5a
3000146f:	7f 07                	jg     30001478 <strtoul+0xfc>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 3)
30001471:	b8 37 00 00 00       	mov    eax,0x37
30001476:	eb 05                	jmp    3000147d <strtoul+0x101>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 4)
30001478:	b8 57 00 00 00       	mov    eax,0x57
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:92 (discriminator 6)
3000147d:	29 c3                	sub    ebx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:95
		else
			break;
		if (c >= base)
3000147f:	3b 5d 10             	cmp    ebx,DWORD PTR [ebp+0x10]
30001482:	7d 3c                	jge    300014c0 <strtoul+0x144>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97
			break;
		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
30001484:	89 c8                	mov    eax,ecx
30001486:	85 c0                	test   eax,eax
30001488:	78 10                	js     3000149a <strtoul+0x11e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 1)
3000148a:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
3000148d:	77 0b                	ja     3000149a <strtoul+0x11e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 2)
3000148f:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30001492:	75 0d                	jne    300014a1 <strtoul+0x125>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:97 (discriminator 3)
30001494:	89 d0                	mov    eax,edx
30001496:	39 c3                	cmp    ebx,eax
30001498:	7e 07                	jle    300014a1 <strtoul+0x125>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:98
			any = -1;
3000149a:	b9 ff ff ff ff       	mov    ecx,0xffffffff
3000149f:	eb 0f                	jmp    300014b0 <strtoul+0x134>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:100
		else {
			any = 1;
300014a1:	b9 01 00 00 00       	mov    ecx,0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:101
			acc *= base;
300014a6:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
300014a9:	0f af f8             	imul   edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:102
			acc += c;
300014ac:	89 d8                	mov    eax,ebx
300014ae:	01 c7                	add    edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:88
	}
	if (base == 0)
		base = c == '0' ? 8 : 10;
	cutoff = (unsigned long)ULONG_MAX / (unsigned long)base;
	cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;
	for (acc = 0, any = 0;; c = *s++) {
300014b0:	89 f0                	mov    eax,esi
300014b2:	8d 70 01             	lea    esi,[eax+0x1]
300014b5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
300014b8:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:104
		else {
			any = 1;
			acc *= base;
			acc += c;
		}
	}
300014bb:	eb 90                	jmp    3000144d <strtoul+0xd1>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:94
		if (ISDIGIT(c))
			c -= '0';
		else if (ISALPHA(c))
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
		else
			break;
300014bd:	90                   	nop
300014be:	eb 01                	jmp    300014c1 <strtoul+0x145>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:96
		if (c >= base)
			break;
300014c0:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:105
			any = 1;
			acc *= base;
			acc += c;
		}
	}
	if (any < 0) {
300014c1:	89 c8                	mov    eax,ecx
300014c3:	85 c0                	test   eax,eax
300014c5:	79 07                	jns    300014ce <strtoul+0x152>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:106
		acc = ULONG_MAX;
300014c7:	bf ff ff ff ff       	mov    edi,0xffffffff
300014cc:	eb 08                	jmp    300014d6 <strtoul+0x15a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:107
	} else if (neg)
300014ce:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
300014d2:	74 02                	je     300014d6 <strtoul+0x15a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:108
		acc = -acc;
300014d4:	f7 df                	neg    edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:109
	if (endptr != 0)
300014d6:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
300014da:	74 13                	je     300014ef <strtoul+0x173>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110
		*endptr = (char *) (any ? s - 1 : nptr);
300014dc:	89 c8                	mov    eax,ecx
300014de:	85 c0                	test   eax,eax
300014e0:	74 05                	je     300014e7 <strtoul+0x16b>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 1)
300014e2:	8d 46 ff             	lea    eax,[esi-0x1]
300014e5:	eb 03                	jmp    300014ea <strtoul+0x16e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 2)
300014e7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:110 (discriminator 4)
300014ea:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
300014ed:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:111
	return (acc);
300014ef:	89 f8                	mov    eax,edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/stroul.c:112
}
300014f1:	83 c4 08             	add    esp,0x8
300014f4:	5b                   	pop    ebx
300014f5:	5e                   	pop    esi
300014f6:	5f                   	pop    edi
300014f7:	5d                   	pop    ebp
300014f8:	c3                   	ret    
300014f9:	66 90                	xchg   ax,ax
300014fb:	90                   	nop

300014fc <strleft>:
strleft():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:2
__attribute__((visibility("default"))) char* strleft(char* val, int cnt)
{
300014fc:	55                   	push   ebp
300014fd:	89 e5                	mov    ebp,esp
300014ff:	e8 62 0e 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30001504:	05 14 23 00 00       	add    eax,0x2314
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:3
    val[cnt]='\0';
30001509:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
3000150c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000150f:	01 d0                	add    eax,edx
30001511:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:4
    return val;
30001514:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strparts.c:5
}
30001517:	5d                   	pop    ebp
30001518:	c3                   	ret    
30001519:	66 90                	xchg   ax,ax
3000151b:	90                   	nop

3000151c <strtol>:
strtol():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:88
 * Ignores `locale' stuff.  Assumes that the upper and lower case
 * alphabets and digits are each contiguous.
 */
__attribute__((visibility("default"))) long
strtol(const char *nptr, char **endptr, register int base)
{
3000151c:	55                   	push   ebp
3000151d:	89 e5                	mov    ebp,esp
3000151f:	57                   	push   edi
30001520:	56                   	push   esi
30001521:	53                   	push   ebx
30001522:	83 ec 0c             	sub    esp,0xc
30001525:	e8 3c 0e 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000152a:	05 ee 22 00 00       	add    eax,0x22ee
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:89
	register const char *s = nptr;
3000152f:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:93
	register unsigned long acc;
	register int c;
	register unsigned long cutoff;
	register int neg = 0, any, cutlim;
30001532:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:101 (discriminator 1)
	 * Skip white space and pick up leading +/- sign if any.
	 * If base is 0, allow 0x for hex and 0 for octal, else
	 * assume decimal; if base is already 16, allow 0x.
	 */
	do {
		c = *s++;
30001539:	89 f0                	mov    eax,esi
3000153b:	8d 70 01             	lea    esi,[eax+0x1]
3000153e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001541:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:102 (discriminator 1)
	} while (c==' ');
30001544:	83 fb 20             	cmp    ebx,0x20
30001547:	74 f0                	je     30001539 <strtol+0x1d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:103
	if (c == '-') {
30001549:	83 fb 2d             	cmp    ebx,0x2d
3000154c:	75 14                	jne    30001562 <strtol+0x46>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:104
		neg = 1;
3000154e:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:105
		c = *s++;
30001555:	89 f0                	mov    eax,esi
30001557:	8d 70 01             	lea    esi,[eax+0x1]
3000155a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000155d:	0f be d8             	movsx  ebx,al
30001560:	eb 10                	jmp    30001572 <strtol+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:106
	} else if (c == '+')
30001562:	83 fb 2b             	cmp    ebx,0x2b
30001565:	75 0b                	jne    30001572 <strtol+0x56>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:107
		c = *s++;
30001567:	89 f0                	mov    eax,esi
30001569:	8d 70 01             	lea    esi,[eax+0x1]
3000156c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000156f:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108
	if ((base == 0 || base == 16) &&
30001572:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
30001576:	74 06                	je     3000157e <strtol+0x62>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108 (discriminator 2)
30001578:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
3000157c:	75 26                	jne    300015a4 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:108 (discriminator 3)
3000157e:	83 fb 30             	cmp    ebx,0x30
30001581:	75 21                	jne    300015a4 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:109
	    c == '0' && (*s == 'x' || *s == 'X')) {
30001583:	0f b6 06             	movzx  eax,BYTE PTR [esi]
30001586:	3c 78                	cmp    al,0x78
30001588:	74 07                	je     30001591 <strtol+0x75>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:109 (discriminator 1)
3000158a:	0f b6 06             	movzx  eax,BYTE PTR [esi]
3000158d:	3c 58                	cmp    al,0x58
3000158f:	75 13                	jne    300015a4 <strtol+0x88>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:110
		c = s[1];
30001591:	8d 46 01             	lea    eax,[esi+0x1]
30001594:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001597:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:111
		s += 2;
3000159a:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:112
		base = 16;
3000159d:	c7 45 10 10 00 00 00 	mov    DWORD PTR [ebp+0x10],0x10
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:114
	}
	if (base == 0)
300015a4:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
300015a8:	75 14                	jne    300015be <strtol+0xa2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115
		base = c == '0' ? 8 : 10;
300015aa:	83 fb 30             	cmp    ebx,0x30
300015ad:	75 07                	jne    300015b6 <strtol+0x9a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 1)
300015af:	b8 08 00 00 00       	mov    eax,0x8
300015b4:	eb 05                	jmp    300015bb <strtol+0x9f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 2)
300015b6:	b8 0a 00 00 00       	mov    eax,0xa
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:115 (discriminator 4)
300015bb:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134
	 * the number is too big, and we will return a range error.
	 *
	 * Set any if any `digits' consumed; make it negative to indicate
	 * overflow.
	 */
	cutoff = neg ? -(unsigned long)LONG_MIN : LONG_MAX;
300015be:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
300015c2:	74 07                	je     300015cb <strtol+0xaf>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134 (discriminator 1)
300015c4:	b8 00 00 00 80       	mov    eax,0x80000000
300015c9:	eb 05                	jmp    300015d0 <strtol+0xb4>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:134 (discriminator 2)
300015cb:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:135 (discriminator 4)
	cutlim = cutoff % (unsigned long)base;
300015d0:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
300015d3:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
300015d6:	ba 00 00 00 00       	mov    edx,0x0
300015db:	f7 f1                	div    ecx
300015dd:	89 d1                	mov    ecx,edx
300015df:	89 c8                	mov    eax,ecx
300015e1:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:136 (discriminator 4)
	cutoff /= (unsigned long)base;
300015e4:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
300015e7:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
300015ea:	ba 00 00 00 00       	mov    edx,0x0
300015ef:	f7 f7                	div    edi
300015f1:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:137 (discriminator 4)
	for (acc = 0, any = 0;; c = *s++) {
300015f4:	bf 00 00 00 00       	mov    edi,0x0
300015f9:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:138
		if (ISDIGIT(c))
300015fe:	8d 43 d0             	lea    eax,[ebx-0x30]
30001601:	83 f8 09             	cmp    eax,0x9
30001604:	77 05                	ja     3000160b <strtol+0xef>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:139
			c -= '0';
30001606:	83 eb 30             	sub    ebx,0x30
30001609:	eb 25                	jmp    30001630 <strtol+0x114>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:140
		else if (ISALPHA(c))
3000160b:	89 d8                	mov    eax,ebx
3000160d:	83 c8 20             	or     eax,0x20
30001610:	83 e8 61             	sub    eax,0x61
30001613:	83 f8 19             	cmp    eax,0x19
30001616:	77 55                	ja     3000166d <strtol+0x151>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
30001618:	83 fb 40             	cmp    ebx,0x40
3000161b:	7e 0c                	jle    30001629 <strtol+0x10d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 1)
3000161d:	83 fb 5a             	cmp    ebx,0x5a
30001620:	7f 07                	jg     30001629 <strtol+0x10d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 3)
30001622:	b8 37 00 00 00       	mov    eax,0x37
30001627:	eb 05                	jmp    3000162e <strtol+0x112>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 4)
30001629:	b8 57 00 00 00       	mov    eax,0x57
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:141 (discriminator 6)
3000162e:	29 c3                	sub    ebx,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:144
		else
			break;
		if (c >= base)
30001630:	3b 5d 10             	cmp    ebx,DWORD PTR [ebp+0x10]
30001633:	7d 3b                	jge    30001670 <strtol+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146
			break;
		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
30001635:	89 c8                	mov    eax,ecx
30001637:	85 c0                	test   eax,eax
30001639:	78 0f                	js     3000164a <strtol+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 1)
3000163b:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
3000163e:	77 0a                	ja     3000164a <strtol+0x12e>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 2)
30001640:	3b 7d ec             	cmp    edi,DWORD PTR [ebp-0x14]
30001643:	75 0c                	jne    30001651 <strtol+0x135>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:146 (discriminator 3)
30001645:	3b 5d e8             	cmp    ebx,DWORD PTR [ebp-0x18]
30001648:	7e 07                	jle    30001651 <strtol+0x135>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:147
			any = -1;
3000164a:	b9 ff ff ff ff       	mov    ecx,0xffffffff
3000164f:	eb 0f                	jmp    30001660 <strtol+0x144>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:149
		else {
			any = 1;
30001651:	b9 01 00 00 00       	mov    ecx,0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:150
			acc *= base;
30001656:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
30001659:	0f af f8             	imul   edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:151
			acc += c;
3000165c:	89 d8                	mov    eax,ebx
3000165e:	01 c7                	add    edi,eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:137
	 * overflow.
	 */
	cutoff = neg ? -(unsigned long)LONG_MIN : LONG_MAX;
	cutlim = cutoff % (unsigned long)base;
	cutoff /= (unsigned long)base;
	for (acc = 0, any = 0;; c = *s++) {
30001660:	89 f0                	mov    eax,esi
30001662:	8d 70 01             	lea    esi,[eax+0x1]
30001665:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001668:	0f be d8             	movsx  ebx,al
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:153
		else {
			any = 1;
			acc *= base;
			acc += c;
		}
	}
3000166b:	eb 91                	jmp    300015fe <strtol+0xe2>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:143
		if (ISDIGIT(c))
			c -= '0';
		else if (ISALPHA(c))
			c -= ISUPPER(c) ? 'A' - 10 : 'a' - 10;
		else
			break;
3000166d:	90                   	nop
3000166e:	eb 01                	jmp    30001671 <strtol+0x155>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:145
		if (c >= base)
			break;
30001670:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:154
			any = 1;
			acc *= base;
			acc += c;
		}
	}
	if (any < 0) {
30001671:	89 c8                	mov    eax,ecx
30001673:	85 c0                	test   eax,eax
30001675:	79 16                	jns    3000168d <strtol+0x171>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155
		acc = neg ? LONG_MIN : LONG_MAX;
30001677:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
3000167b:	74 07                	je     30001684 <strtol+0x168>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 1)
3000167d:	b8 00 00 00 80       	mov    eax,0x80000000
30001682:	eb 05                	jmp    30001689 <strtol+0x16d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 2)
30001684:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:155 (discriminator 4)
30001689:	89 c7                	mov    edi,eax
3000168b:	eb 08                	jmp    30001695 <strtol+0x179>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:156
	} else if (neg)
3000168d:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30001691:	74 02                	je     30001695 <strtol+0x179>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:157
		acc = -acc;
30001693:	f7 df                	neg    edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:158
	if (endptr != 0)
30001695:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
30001699:	74 13                	je     300016ae <strtol+0x192>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159
		*endptr = (char *) (any ? s - 1 : nptr);
3000169b:	89 c8                	mov    eax,ecx
3000169d:	85 c0                	test   eax,eax
3000169f:	74 05                	je     300016a6 <strtol+0x18a>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 1)
300016a1:	8d 46 ff             	lea    eax,[esi-0x1]
300016a4:	eb 03                	jmp    300016a9 <strtol+0x18d>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 2)
300016a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:159 (discriminator 4)
300016a9:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
300016ac:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:160
	return (acc);
300016ae:	89 f8                	mov    eax,edi
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtol.c:161
}
300016b0:	83 c4 0c             	add    esp,0xc
300016b3:	5b                   	pop    ebx
300016b4:	5e                   	pop    esi
300016b5:	5f                   	pop    edi
300016b6:	5d                   	pop    ebp
300016b7:	c3                   	ret    

300016b8 <strtrim>:
strtrim():
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:4
#include "strings.h"

__attribute__((visibility("default"))) void strtrim(char *input)
{
300016b8:	55                   	push   ebp
300016b9:	89 e5                	mov    ebp,esp
300016bb:	53                   	push   ebx
300016bc:	83 ec 14             	sub    esp,0x14
300016bf:	e8 a2 0c 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
300016c4:	05 54 21 00 00       	add    eax,0x2154
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:5
   char *dst = input, *src = input;
300016c9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
300016cc:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
300016cf:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
300016d2:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10
   char *end;

   // Skip whitespace at front...
   //
   while (*src==' ')
300016d5:	eb 04                	jmp    300016db <strtrim+0x23>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:12
   {
      ++src;
300016d7:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:10
   char *dst = input, *src = input;
   char *end;

   // Skip whitespace at front...
   //
   while (*src==' ')
300016db:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
300016de:	0f b6 12             	movzx  edx,BYTE PTR [edx]
300016e1:	80 fa 20             	cmp    dl,0x20
300016e4:	74 f1                	je     300016d7 <strtrim+0x1f>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:17
      ++src;
   }

   // Trim at end...
   //
   end = src + strlenI(src) - 1;
300016e6:	83 ec 0c             	sub    esp,0xc
300016e9:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
300016ec:	89 c3                	mov    ebx,eax
300016ee:	e8 8e fb ff ff       	call   30001281 <strlenI>
300016f3:	83 c4 10             	add    esp,0x10
300016f6:	8d 50 ff             	lea    edx,[eax-0x1]
300016f9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
300016fc:	01 d0                	add    eax,edx
300016fe:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:18
   while (end > src && *end==' ')
30001701:	eb 0c                	jmp    3000170f <strtrim+0x57>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:20
   {
      *end-- = 0;
30001703:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001706:	8d 50 ff             	lea    edx,[eax-0x1]
30001709:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
3000170c:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:18
   }

   // Trim at end...
   //
   end = src + strlenI(src) - 1;
   while (end > src && *end==' ')
3000170f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001712:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30001715:	76 0a                	jbe    30001721 <strtrim+0x69>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:18 (discriminator 1)
30001717:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
3000171a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
3000171d:	3c 20                	cmp    al,0x20
3000171f:	74 e2                	je     30001703 <strtrim+0x4b>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:25
      *end-- = 0;
   }

   // Move if needed.
   //
   if (src != dst)
30001721:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001724:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
30001727:	74 1f                	je     30001748 <strtrim+0x90>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:27
   {
      while ((*dst++ = *src++));
30001729:	90                   	nop
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:27 (discriminator 1)
3000172a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000172d:	8d 50 01             	lea    edx,[eax+0x1]
30001730:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
30001733:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
30001736:	8d 4a 01             	lea    ecx,[edx+0x1]
30001739:	89 4d f0             	mov    DWORD PTR [ebp-0x10],ecx
3000173c:	0f b6 12             	movzx  edx,BYTE PTR [edx]
3000173f:	88 10                	mov    BYTE PTR [eax],dl
30001741:	0f b6 00             	movzx  eax,BYTE PTR [eax]
30001744:	84 c0                	test   al,al
30001746:	75 e2                	jne    3000172a <strtrim+0x72>
/home/yogi/src/os/aproj/libChrisOS/src/strings/strtrim.c:29
   }
}
30001748:	90                   	nop
30001749:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
3000174c:	c9                   	leave  
3000174d:	c3                   	ret    
3000174e:	66 90                	xchg   ax,ax

30001750 <time>:
time():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:23
  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
  {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
};

VISIBLE time_t time(/*time_t* arg*/)
{
30001750:	55                   	push   ebp
30001751:	89 e5                	mov    ebp,esp
30001753:	83 ec 10             	sub    esp,0x10
30001756:	e8 0b 0c 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
3000175b:	05 bd 20 00 00       	add    eax,0x20bd
/home/yogi/src/os/aproj/libChrisOS/src/time.c:24
    uint32_t retVal=0;
30001760:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:25
    __asm__("call sysEnter_Vector\n":"=a" (retVal):"a" (SYSCALL_GETTICKS));
30001767:	b8 70 01 00 00       	mov    eax,0x170
3000176c:	e8 fc ff ff ff       	call   3000176d <time+0x1d>
30001771:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:26
    return (time_t)retVal;
30001774:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:27
}
30001777:	c9                   	leave  
30001778:	c3                   	ret    

30001779 <gmtime_r>:
gmtime_r():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:30


VISIBLE struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
30001779:	55                   	push   ebp
3000177a:	89 e5                	mov    ebp,esp
3000177c:	53                   	push   ebx
3000177d:	83 ec 10             	sub    esp,0x10
30001780:	e8 3b 0c 00 00       	call   300023c0 <__x86.get_pc_thunk.bx>
30001785:	81 c3 93 20 00 00    	add    ebx,0x2093
/home/yogi/src/os/aproj/libChrisOS/src/time.c:31
  time_t time = *timer;
3000178b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
3000178e:	8b 00                	mov    eax,DWORD PTR [eax]
30001790:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:33
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;
30001793:	c7 45 f4 b2 07 00 00 	mov    DWORD PTR [ebp-0xc],0x7b2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:35

  dayclock = (unsigned long) time % SECS_DAY;
3000179a:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
3000179d:	ba 07 45 2e c2       	mov    edx,0xc22e4507
300017a2:	89 c8                	mov    eax,ecx
300017a4:	f7 e2                	mul    edx
300017a6:	89 d0                	mov    eax,edx
300017a8:	c1 e8 10             	shr    eax,0x10
300017ab:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
300017ae:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
300017b1:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
300017b7:	29 c1                	sub    ecx,eax
300017b9:	89 c8                	mov    eax,ecx
300017bb:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:36
  dayno = (unsigned long) time / SECS_DAY;
300017be:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
300017c1:	ba 07 45 2e c2       	mov    edx,0xc22e4507
300017c6:	f7 e2                	mul    edx
300017c8:	89 d0                	mov    eax,edx
300017ca:	c1 e8 10             	shr    eax,0x10
300017cd:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:38

  tmbuf->tm_sec = dayclock % 60;
300017d0:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
300017d3:	ba 89 88 88 88       	mov    edx,0x88888889
300017d8:	89 c8                	mov    eax,ecx
300017da:	f7 e2                	mul    edx
300017dc:	89 d0                	mov    eax,edx
300017de:	c1 e8 05             	shr    eax,0x5
300017e1:	89 c2                	mov    edx,eax
300017e3:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
300017ea:	89 c2                	mov    edx,eax
300017ec:	89 d0                	mov    eax,edx
300017ee:	c1 e0 04             	shl    eax,0x4
300017f1:	29 d0                	sub    eax,edx
300017f3:	29 c1                	sub    ecx,eax
300017f5:	89 c8                	mov    eax,ecx
300017f7:	89 c2                	mov    edx,eax
300017f9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300017fc:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:39
  tmbuf->tm_min = (dayclock % 3600) / 60;
300017fe:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
30001801:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
30001806:	89 c8                	mov    eax,ecx
30001808:	f7 e2                	mul    edx
3000180a:	89 d0                	mov    eax,edx
3000180c:	c1 e8 0b             	shr    eax,0xb
3000180f:	69 c0 10 0e 00 00    	imul   eax,eax,0xe10
30001815:	29 c1                	sub    ecx,eax
30001817:	89 c8                	mov    eax,ecx
30001819:	ba 89 88 88 88       	mov    edx,0x88888889
3000181e:	f7 e2                	mul    edx
30001820:	89 d0                	mov    eax,edx
30001822:	c1 e8 05             	shr    eax,0x5
30001825:	89 c2                	mov    edx,eax
30001827:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000182a:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:40
  tmbuf->tm_hour = dayclock / 3600;
3000182d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30001830:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
30001835:	f7 e2                	mul    edx
30001837:	89 d0                	mov    eax,edx
30001839:	c1 e8 0b             	shr    eax,0xb
3000183c:	89 c2                	mov    edx,eax
3000183e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001841:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:41
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
30001844:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30001847:	8d 48 04             	lea    ecx,[eax+0x4]
3000184a:	ba 25 49 92 24       	mov    edx,0x24924925
3000184f:	89 c8                	mov    eax,ecx
30001851:	f7 e2                	mul    edx
30001853:	89 c8                	mov    eax,ecx
30001855:	29 d0                	sub    eax,edx
30001857:	d1 e8                	shr    eax,1
30001859:	01 d0                	add    eax,edx
3000185b:	c1 e8 02             	shr    eax,0x2
3000185e:	89 c2                	mov    edx,eax
30001860:	c1 e2 03             	shl    edx,0x3
30001863:	29 c2                	sub    edx,eax
30001865:	89 c8                	mov    eax,ecx
30001867:	29 d0                	sub    eax,edx
30001869:	89 c2                	mov    edx,eax
3000186b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000186e:	89 50 18             	mov    DWORD PTR [eax+0x18],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42
  while (dayno >= (unsigned long) YEARSIZE(year)) {
30001871:	eb 66                	jmp    300018d9 <gmtime_r+0x160>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43
    dayno -= YEARSIZE(year);
30001873:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001876:	83 e0 03             	and    eax,0x3
30001879:	85 c0                	test   eax,eax
3000187b:	75 50                	jne    300018cd <gmtime_r+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43 (discriminator 1)
3000187d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001880:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001885:	89 c8                	mov    eax,ecx
30001887:	f7 ea                	imul   edx
30001889:	c1 fa 05             	sar    edx,0x5
3000188c:	89 c8                	mov    eax,ecx
3000188e:	c1 f8 1f             	sar    eax,0x1f
30001891:	29 c2                	sub    edx,eax
30001893:	89 d0                	mov    eax,edx
30001895:	6b c0 64             	imul   eax,eax,0x64
30001898:	29 c1                	sub    ecx,eax
3000189a:	89 c8                	mov    eax,ecx
3000189c:	85 c0                	test   eax,eax
3000189e:	75 26                	jne    300018c6 <gmtime_r+0x14d>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43 (discriminator 4)
300018a0:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300018a3:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300018a8:	89 c8                	mov    eax,ecx
300018aa:	f7 ea                	imul   edx
300018ac:	c1 fa 07             	sar    edx,0x7
300018af:	89 c8                	mov    eax,ecx
300018b1:	c1 f8 1f             	sar    eax,0x1f
300018b4:	29 c2                	sub    edx,eax
300018b6:	89 d0                	mov    eax,edx
300018b8:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300018be:	29 c1                	sub    ecx,eax
300018c0:	89 c8                	mov    eax,ecx
300018c2:	85 c0                	test   eax,eax
300018c4:	75 07                	jne    300018cd <gmtime_r+0x154>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43 (discriminator 5)
300018c6:	b8 6e 01 00 00       	mov    eax,0x16e
300018cb:	eb 05                	jmp    300018d2 <gmtime_r+0x159>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43 (discriminator 6)
300018cd:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/aproj/libChrisOS/src/time.c:43 (discriminator 8)
300018d2:	29 45 f8             	sub    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:44 (discriminator 8)
    year++;
300018d5:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
300018d9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300018dc:	83 e0 03             	and    eax,0x3
300018df:	85 c0                	test   eax,eax
300018e1:	75 50                	jne    30001933 <gmtime_r+0x1ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42 (discriminator 1)
300018e3:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300018e6:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300018eb:	89 c8                	mov    eax,ecx
300018ed:	f7 ea                	imul   edx
300018ef:	c1 fa 05             	sar    edx,0x5
300018f2:	89 c8                	mov    eax,ecx
300018f4:	c1 f8 1f             	sar    eax,0x1f
300018f7:	29 c2                	sub    edx,eax
300018f9:	89 d0                	mov    eax,edx
300018fb:	6b c0 64             	imul   eax,eax,0x64
300018fe:	29 c1                	sub    ecx,eax
30001900:	89 c8                	mov    eax,ecx
30001902:	85 c0                	test   eax,eax
30001904:	75 26                	jne    3000192c <gmtime_r+0x1b3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42 (discriminator 4)
30001906:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001909:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000190e:	89 c8                	mov    eax,ecx
30001910:	f7 ea                	imul   edx
30001912:	c1 fa 07             	sar    edx,0x7
30001915:	89 c8                	mov    eax,ecx
30001917:	c1 f8 1f             	sar    eax,0x1f
3000191a:	29 c2                	sub    edx,eax
3000191c:	89 d0                	mov    eax,edx
3000191e:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001924:	29 c1                	sub    ecx,eax
30001926:	89 c8                	mov    eax,ecx
30001928:	85 c0                	test   eax,eax
3000192a:	75 07                	jne    30001933 <gmtime_r+0x1ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42 (discriminator 5)
3000192c:	b8 6e 01 00 00       	mov    eax,0x16e
30001931:	eb 05                	jmp    30001938 <gmtime_r+0x1bf>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42 (discriminator 6)
30001933:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/aproj/libChrisOS/src/time.c:42 (discriminator 8)
30001938:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
3000193b:	0f 86 32 ff ff ff    	jbe    30001873 <gmtime_r+0xfa>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:46
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
30001941:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30001944:	8d 90 94 f8 ff ff    	lea    edx,[eax-0x76c]
3000194a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000194d:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:47
  tmbuf->tm_yday = dayno;
30001950:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
30001953:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001956:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:48
  tmbuf->tm_mon = 0;
30001959:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
3000195c:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
30001963:	e9 89 00 00 00       	jmp    300019f1 <gmtime_r+0x278>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
30001968:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3000196b:	83 e0 03             	and    eax,0x3
3000196e:	85 c0                	test   eax,eax
30001970:	75 50                	jne    300019c2 <gmtime_r+0x249>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50 (discriminator 1)
30001972:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001975:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000197a:	89 c8                	mov    eax,ecx
3000197c:	f7 ea                	imul   edx
3000197e:	c1 fa 05             	sar    edx,0x5
30001981:	89 c8                	mov    eax,ecx
30001983:	c1 f8 1f             	sar    eax,0x1f
30001986:	29 c2                	sub    edx,eax
30001988:	89 d0                	mov    eax,edx
3000198a:	6b c0 64             	imul   eax,eax,0x64
3000198d:	29 c1                	sub    ecx,eax
3000198f:	89 c8                	mov    eax,ecx
30001991:	85 c0                	test   eax,eax
30001993:	75 26                	jne    300019bb <gmtime_r+0x242>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50 (discriminator 4)
30001995:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001998:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000199d:	89 c8                	mov    eax,ecx
3000199f:	f7 ea                	imul   edx
300019a1:	c1 fa 07             	sar    edx,0x7
300019a4:	89 c8                	mov    eax,ecx
300019a6:	c1 f8 1f             	sar    eax,0x1f
300019a9:	29 c2                	sub    edx,eax
300019ab:	89 d0                	mov    eax,edx
300019ad:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300019b3:	29 c1                	sub    ecx,eax
300019b5:	89 c8                	mov    eax,ecx
300019b7:	85 c0                	test   eax,eax
300019b9:	75 07                	jne    300019c2 <gmtime_r+0x249>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50 (discriminator 5)
300019bb:	ba 01 00 00 00       	mov    edx,0x1
300019c0:	eb 05                	jmp    300019c7 <gmtime_r+0x24e>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50 (discriminator 6)
300019c2:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:50 (discriminator 8)
300019c7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300019ca:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
300019cd:	89 d0                	mov    eax,edx
300019cf:	01 c0                	add    eax,eax
300019d1:	01 d0                	add    eax,edx
300019d3:	c1 e0 02             	shl    eax,0x2
300019d6:	01 c8                	add    eax,ecx
300019d8:	8b 84 83 a8 fd ff ff 	mov    eax,DWORD PTR [ebx+eax*4-0x258]
300019df:	29 45 f8             	sub    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:51 (discriminator 8)
    tmbuf->tm_mon++;
300019e2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300019e5:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
300019e8:	8d 50 01             	lea    edx,[eax+0x1]
300019eb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
300019ee:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
300019f1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
300019f4:	83 e0 03             	and    eax,0x3
300019f7:	85 c0                	test   eax,eax
300019f9:	75 50                	jne    30001a4b <gmtime_r+0x2d2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49 (discriminator 1)
300019fb:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
300019fe:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001a03:	89 c8                	mov    eax,ecx
30001a05:	f7 ea                	imul   edx
30001a07:	c1 fa 05             	sar    edx,0x5
30001a0a:	89 c8                	mov    eax,ecx
30001a0c:	c1 f8 1f             	sar    eax,0x1f
30001a0f:	29 c2                	sub    edx,eax
30001a11:	89 d0                	mov    eax,edx
30001a13:	6b c0 64             	imul   eax,eax,0x64
30001a16:	29 c1                	sub    ecx,eax
30001a18:	89 c8                	mov    eax,ecx
30001a1a:	85 c0                	test   eax,eax
30001a1c:	75 26                	jne    30001a44 <gmtime_r+0x2cb>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49 (discriminator 4)
30001a1e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
30001a21:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001a26:	89 c8                	mov    eax,ecx
30001a28:	f7 ea                	imul   edx
30001a2a:	c1 fa 07             	sar    edx,0x7
30001a2d:	89 c8                	mov    eax,ecx
30001a2f:	c1 f8 1f             	sar    eax,0x1f
30001a32:	29 c2                	sub    edx,eax
30001a34:	89 d0                	mov    eax,edx
30001a36:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001a3c:	29 c1                	sub    ecx,eax
30001a3e:	89 c8                	mov    eax,ecx
30001a40:	85 c0                	test   eax,eax
30001a42:	75 07                	jne    30001a4b <gmtime_r+0x2d2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49 (discriminator 5)
30001a44:	ba 01 00 00 00       	mov    edx,0x1
30001a49:	eb 05                	jmp    30001a50 <gmtime_r+0x2d7>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49 (discriminator 6)
30001a4b:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:49 (discriminator 8)
30001a50:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001a53:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
30001a56:	89 d0                	mov    eax,edx
30001a58:	01 c0                	add    eax,eax
30001a5a:	01 d0                	add    eax,edx
30001a5c:	c1 e0 02             	shl    eax,0x2
30001a5f:	01 c8                	add    eax,ecx
30001a61:	8b 84 83 a8 fd ff ff 	mov    eax,DWORD PTR [ebx+eax*4-0x258]
30001a68:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
30001a6b:	0f 86 f7 fe ff ff    	jbe    30001968 <gmtime_r+0x1ef>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:53
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
30001a71:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
30001a74:	83 c0 01             	add    eax,0x1
30001a77:	89 c2                	mov    edx,eax
30001a79:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001a7c:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:54
  tmbuf->tm_isdst = 0;
30001a7f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
30001a82:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:55
  return tmbuf;
30001a89:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:56
}
30001a8c:	83 c4 10             	add    esp,0x10
30001a8f:	5b                   	pop    ebx
30001a90:	5d                   	pop    ebp
30001a91:	c3                   	ret    

30001a92 <localtime>:
localtime():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:58

VISIBLE struct tm *localtime(const time_t *timer) {
30001a92:	55                   	push   ebp
30001a93:	89 e5                	mov    ebp,esp
30001a95:	53                   	push   ebx
30001a96:	83 ec 34             	sub    esp,0x34
30001a99:	e8 c8 08 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30001a9e:	05 7a 1d 00 00       	add    eax,0x1d7a
/home/yogi/src/os/aproj/libChrisOS/src/time.c:62
  time_t t;
  struct tm tmbuf;
  
  t = *timer - libcTZ;
30001aa3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001aa6:	8b 0a                	mov    ecx,DWORD PTR [edx]
30001aa8:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
30001aae:	8b 12                	mov    edx,DWORD PTR [edx]
30001ab0:	29 d1                	sub    ecx,edx
30001ab2:	89 ca                	mov    edx,ecx
30001ab4:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:63
  return gmtime_r(&t, &tmbuf);
30001ab7:	83 ec 08             	sub    esp,0x8
30001aba:	8d 55 c8             	lea    edx,[ebp-0x38]
30001abd:	52                   	push   edx
30001abe:	8d 55 f4             	lea    edx,[ebp-0xc]
30001ac1:	52                   	push   edx
30001ac2:	89 c3                	mov    ebx,eax
30001ac4:	e8 d7 08 00 00       	call   300023a0 <__x86.get_pc_thunk.ax+0x3a>
30001ac9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:64
}
30001acc:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30001acf:	c9                   	leave  
30001ad0:	c3                   	ret    

30001ad1 <localtime_r>:
localtime_r():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:66

VISIBLE struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
30001ad1:	55                   	push   ebp
30001ad2:	89 e5                	mov    ebp,esp
30001ad4:	53                   	push   ebx
30001ad5:	83 ec 14             	sub    esp,0x14
30001ad8:	e8 89 08 00 00       	call   30002366 <__x86.get_pc_thunk.ax>
30001add:	05 3b 1d 00 00       	add    eax,0x1d3b
/home/yogi/src/os/aproj/libChrisOS/src/time.c:69
  time_t t;

  t = *timer - libcTZ;
30001ae2:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001ae5:	8b 0a                	mov    ecx,DWORD PTR [edx]
30001ae7:	8b 90 fc ff ff ff    	mov    edx,DWORD PTR [eax-0x4]
30001aed:	8b 12                	mov    edx,DWORD PTR [edx]
30001aef:	29 d1                	sub    ecx,edx
30001af1:	89 ca                	mov    edx,ecx
30001af3:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:70
  return gmtime_r(&t, tmbuf);
30001af6:	83 ec 08             	sub    esp,0x8
30001af9:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
30001afc:	8d 55 f4             	lea    edx,[ebp-0xc]
30001aff:	52                   	push   edx
30001b00:	89 c3                	mov    ebx,eax
30001b02:	e8 99 08 00 00       	call   300023a0 <__x86.get_pc_thunk.ax+0x3a>
30001b07:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:71
}
30001b0a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
30001b0d:	c9                   	leave  
30001b0e:	c3                   	ret    

30001b0f <mktime>:
mktime():
/home/yogi/src/os/aproj/libChrisOS/src/time.c:73

VISIBLE time_t mktime(struct tm *tmbuf) {
30001b0f:	55                   	push   ebp
30001b10:	89 e5                	mov    ebp,esp
30001b12:	57                   	push   edi
30001b13:	56                   	push   esi
30001b14:	53                   	push   ebx
30001b15:	83 ec 20             	sub    esp,0x20
30001b18:	e8 ab 08 00 00       	call   300023c8 <__x86.get_pc_thunk.cx>
30001b1d:	81 c1 fb 1c 00 00    	add    ecx,0x1cfb
/home/yogi/src/os/aproj/libChrisOS/src/time.c:81
  int yday, month;
  long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
30001b23:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b26:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
30001b29:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b2c:	8b 18                	mov    ebx,DWORD PTR [eax]
30001b2e:	ba 89 88 88 88       	mov    edx,0x88888889
30001b33:	89 d8                	mov    eax,ebx
30001b35:	f7 ea                	imul   edx
30001b37:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001b3a:	c1 f8 05             	sar    eax,0x5
30001b3d:	89 c2                	mov    edx,eax
30001b3f:	89 d8                	mov    eax,ebx
30001b41:	c1 f8 1f             	sar    eax,0x1f
30001b44:	29 c2                	sub    edx,eax
30001b46:	89 d0                	mov    eax,edx
30001b48:	8d 14 06             	lea    edx,[esi+eax*1]
30001b4b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b4e:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:82
  tmbuf->tm_sec %= 60;
30001b51:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b54:	8b 18                	mov    ebx,DWORD PTR [eax]
30001b56:	ba 89 88 88 88       	mov    edx,0x88888889
30001b5b:	89 d8                	mov    eax,ebx
30001b5d:	f7 ea                	imul   edx
30001b5f:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001b62:	c1 f8 05             	sar    eax,0x5
30001b65:	89 c2                	mov    edx,eax
30001b67:	89 d8                	mov    eax,ebx
30001b69:	c1 f8 1f             	sar    eax,0x1f
30001b6c:	29 c2                	sub    edx,eax
30001b6e:	89 d0                	mov    eax,edx
30001b70:	89 c2                	mov    edx,eax
30001b72:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
30001b79:	89 c2                	mov    edx,eax
30001b7b:	89 d0                	mov    eax,edx
30001b7d:	c1 e0 04             	shl    eax,0x4
30001b80:	29 d0                	sub    eax,edx
30001b82:	29 c3                	sub    ebx,eax
30001b84:	89 d8                	mov    eax,ebx
30001b86:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001b89:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:83
  if (tmbuf->tm_sec < 0) {
30001b8b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b8e:	8b 00                	mov    eax,DWORD PTR [eax]
30001b90:	85 c0                	test   eax,eax
30001b92:	79 1c                	jns    30001bb0 <mktime+0xa1>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:84
    tmbuf->tm_sec += 60;
30001b94:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b97:	8b 00                	mov    eax,DWORD PTR [eax]
30001b99:	8d 50 3c             	lea    edx,[eax+0x3c]
30001b9c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001b9f:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:85
    tmbuf->tm_min--;
30001ba1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ba4:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001ba7:	8d 50 ff             	lea    edx,[eax-0x1]
30001baa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001bad:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:87
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
30001bb0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001bb3:	8b 70 08             	mov    esi,DWORD PTR [eax+0x8]
30001bb6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001bb9:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
30001bbc:	ba 89 88 88 88       	mov    edx,0x88888889
30001bc1:	89 d8                	mov    eax,ebx
30001bc3:	f7 ea                	imul   edx
30001bc5:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001bc8:	c1 f8 05             	sar    eax,0x5
30001bcb:	89 c2                	mov    edx,eax
30001bcd:	89 d8                	mov    eax,ebx
30001bcf:	c1 f8 1f             	sar    eax,0x1f
30001bd2:	29 c2                	sub    edx,eax
30001bd4:	89 d0                	mov    eax,edx
30001bd6:	8d 14 06             	lea    edx,[esi+eax*1]
30001bd9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001bdc:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:88
  tmbuf->tm_min = tmbuf->tm_min % 60;
30001bdf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001be2:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
30001be5:	ba 89 88 88 88       	mov    edx,0x88888889
30001bea:	89 d8                	mov    eax,ebx
30001bec:	f7 ea                	imul   edx
30001bee:	8d 04 1a             	lea    eax,[edx+ebx*1]
30001bf1:	c1 f8 05             	sar    eax,0x5
30001bf4:	89 c2                	mov    edx,eax
30001bf6:	89 d8                	mov    eax,ebx
30001bf8:	c1 f8 1f             	sar    eax,0x1f
30001bfb:	29 c2                	sub    edx,eax
30001bfd:	89 d0                	mov    eax,edx
30001bff:	89 c2                	mov    edx,eax
30001c01:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
30001c08:	89 c2                	mov    edx,eax
30001c0a:	89 d0                	mov    eax,edx
30001c0c:	c1 e0 04             	shl    eax,0x4
30001c0f:	29 d0                	sub    eax,edx
30001c11:	29 c3                	sub    ebx,eax
30001c13:	89 d8                	mov    eax,ebx
30001c15:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
30001c18:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:89
  if (tmbuf->tm_min < 0) {
30001c1b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c1e:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001c21:	85 c0                	test   eax,eax
30001c23:	79 1e                	jns    30001c43 <mktime+0x134>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:90
    tmbuf->tm_min += 60;
30001c25:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c28:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30001c2b:	8d 50 3c             	lea    edx,[eax+0x3c]
30001c2e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c31:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:91
    tmbuf->tm_hour--;
30001c34:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c37:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30001c3a:	8d 50 ff             	lea    edx,[eax-0x1]
30001c3d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c40:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:93
  }
  day = tmbuf->tm_hour / 24;
30001c43:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c46:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
30001c49:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
30001c4e:	89 d8                	mov    eax,ebx
30001c50:	f7 ea                	imul   edx
30001c52:	c1 fa 02             	sar    edx,0x2
30001c55:	89 d8                	mov    eax,ebx
30001c57:	c1 f8 1f             	sar    eax,0x1f
30001c5a:	29 c2                	sub    edx,eax
30001c5c:	89 d0                	mov    eax,edx
30001c5e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:94
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
30001c61:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c64:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
30001c67:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
30001c6c:	89 d8                	mov    eax,ebx
30001c6e:	f7 ea                	imul   edx
30001c70:	c1 fa 02             	sar    edx,0x2
30001c73:	89 d8                	mov    eax,ebx
30001c75:	c1 f8 1f             	sar    eax,0x1f
30001c78:	29 c2                	sub    edx,eax
30001c7a:	89 d0                	mov    eax,edx
30001c7c:	01 c0                	add    eax,eax
30001c7e:	01 d0                	add    eax,edx
30001c80:	c1 e0 03             	shl    eax,0x3
30001c83:	29 c3                	sub    ebx,eax
30001c85:	89 da                	mov    edx,ebx
30001c87:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c8a:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:95
  if (tmbuf->tm_hour < 0) {
30001c8d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c90:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30001c93:	85 c0                	test   eax,eax
30001c95:	79 13                	jns    30001caa <mktime+0x19b>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:96
    tmbuf->tm_hour += 24;
30001c97:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001c9a:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30001c9d:	8d 50 18             	lea    edx,[eax+0x18]
30001ca0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ca3:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:97
    day--;
30001ca6:	83 6d f0 01          	sub    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:99
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
30001caa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001cad:	8b 70 14             	mov    esi,DWORD PTR [eax+0x14]
30001cb0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001cb3:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001cb6:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
30001cbb:	89 d8                	mov    eax,ebx
30001cbd:	f7 ea                	imul   edx
30001cbf:	d1 fa                	sar    edx,1
30001cc1:	89 d8                	mov    eax,ebx
30001cc3:	c1 f8 1f             	sar    eax,0x1f
30001cc6:	29 c2                	sub    edx,eax
30001cc8:	89 d0                	mov    eax,edx
30001cca:	8d 14 06             	lea    edx,[esi+eax*1]
30001ccd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001cd0:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:100
  tmbuf->tm_mon %= 12;
30001cd3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001cd6:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001cd9:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
30001cde:	89 d8                	mov    eax,ebx
30001ce0:	f7 ea                	imul   edx
30001ce2:	d1 fa                	sar    edx,1
30001ce4:	89 d8                	mov    eax,ebx
30001ce6:	c1 f8 1f             	sar    eax,0x1f
30001ce9:	29 c2                	sub    edx,eax
30001ceb:	89 d0                	mov    eax,edx
30001ced:	01 c0                	add    eax,eax
30001cef:	01 d0                	add    eax,edx
30001cf1:	c1 e0 02             	shl    eax,0x2
30001cf4:	29 c3                	sub    ebx,eax
30001cf6:	89 da                	mov    edx,ebx
30001cf8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001cfb:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:101
  if (tmbuf->tm_mon < 0) {
30001cfe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d01:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001d04:	85 c0                	test   eax,eax
30001d06:	79 1e                	jns    30001d26 <mktime+0x217>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:102
    tmbuf->tm_mon += 12;
30001d08:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d0b:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001d0e:	8d 50 0c             	lea    edx,[eax+0xc]
30001d11:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d14:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:103
    tmbuf->tm_year--;
30001d17:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d1a:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001d1d:	8d 50 ff             	lea    edx,[eax-0x1]
30001d20:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d23:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:105
  }
  day += (tmbuf->tm_mday - 1);
30001d26:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d29:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
30001d2c:	83 e8 01             	sub    eax,0x1
30001d2f:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:106
  while (day < 0) {
30001d32:	e9 c1 00 00 00       	jmp    30001df8 <mktime+0x2e9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:107
    if(--tmbuf->tm_mon < 0) {
30001d37:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d3a:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001d3d:	8d 50 ff             	lea    edx,[eax-0x1]
30001d40:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d43:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
30001d46:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d49:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001d4c:	85 c0                	test   eax,eax
30001d4e:	79 19                	jns    30001d69 <mktime+0x25a>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:108
      tmbuf->tm_year--;
30001d50:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d53:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001d56:	8d 50 ff             	lea    edx,[eax-0x1]
30001d59:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d5c:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:109
      tmbuf->tm_mon = 11;
30001d5f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d62:	c7 40 10 0b 00 00 00 	mov    DWORD PTR [eax+0x10],0xb
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
30001d69:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d6c:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001d6f:	83 e0 03             	and    eax,0x3
30001d72:	85 c0                	test   eax,eax
30001d74:	75 62                	jne    30001dd8 <mktime+0x2c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111 (discriminator 1)
30001d76:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001d79:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001d7c:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001d82:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001d87:	89 d8                	mov    eax,ebx
30001d89:	f7 ea                	imul   edx
30001d8b:	c1 fa 05             	sar    edx,0x5
30001d8e:	89 d8                	mov    eax,ebx
30001d90:	c1 f8 1f             	sar    eax,0x1f
30001d93:	29 c2                	sub    edx,eax
30001d95:	89 d0                	mov    eax,edx
30001d97:	6b c0 64             	imul   eax,eax,0x64
30001d9a:	29 c3                	sub    ebx,eax
30001d9c:	89 d8                	mov    eax,ebx
30001d9e:	85 c0                	test   eax,eax
30001da0:	75 2f                	jne    30001dd1 <mktime+0x2c2>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111 (discriminator 4)
30001da2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001da5:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001da8:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001dae:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001db3:	89 d8                	mov    eax,ebx
30001db5:	f7 ea                	imul   edx
30001db7:	c1 fa 07             	sar    edx,0x7
30001dba:	89 d8                	mov    eax,ebx
30001dbc:	c1 f8 1f             	sar    eax,0x1f
30001dbf:	29 c2                	sub    edx,eax
30001dc1:	89 d0                	mov    eax,edx
30001dc3:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001dc9:	29 c3                	sub    ebx,eax
30001dcb:	89 d8                	mov    eax,ebx
30001dcd:	85 c0                	test   eax,eax
30001dcf:	75 07                	jne    30001dd8 <mktime+0x2c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111 (discriminator 5)
30001dd1:	ba 01 00 00 00       	mov    edx,0x1
30001dd6:	eb 05                	jmp    30001ddd <mktime+0x2ce>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111 (discriminator 6)
30001dd8:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:111 (discriminator 8)
30001ddd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001de0:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001de3:	89 d0                	mov    eax,edx
30001de5:	01 c0                	add    eax,eax
30001de7:	01 d0                	add    eax,edx
30001de9:	c1 e0 02             	shl    eax,0x2
30001dec:	01 d8                	add    eax,ebx
30001dee:	8b 84 81 a8 fd ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x258]
30001df5:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:106
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
30001df8:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
30001dfc:	0f 88 35 ff ff ff    	js     30001d37 <mktime+0x228>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
30001e02:	e9 c2 00 00 00       	jmp    30001ec9 <mktime+0x3ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
30001e07:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e0a:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001e0d:	83 e0 03             	and    eax,0x3
30001e10:	85 c0                	test   eax,eax
30001e12:	75 62                	jne    30001e76 <mktime+0x367>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114 (discriminator 1)
30001e14:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e17:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001e1a:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001e20:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001e25:	89 d8                	mov    eax,ebx
30001e27:	f7 ea                	imul   edx
30001e29:	c1 fa 05             	sar    edx,0x5
30001e2c:	89 d8                	mov    eax,ebx
30001e2e:	c1 f8 1f             	sar    eax,0x1f
30001e31:	29 c2                	sub    edx,eax
30001e33:	89 d0                	mov    eax,edx
30001e35:	6b c0 64             	imul   eax,eax,0x64
30001e38:	29 c3                	sub    ebx,eax
30001e3a:	89 d8                	mov    eax,ebx
30001e3c:	85 c0                	test   eax,eax
30001e3e:	75 2f                	jne    30001e6f <mktime+0x360>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114 (discriminator 4)
30001e40:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e43:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001e46:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001e4c:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001e51:	89 d8                	mov    eax,ebx
30001e53:	f7 ea                	imul   edx
30001e55:	c1 fa 07             	sar    edx,0x7
30001e58:	89 d8                	mov    eax,ebx
30001e5a:	c1 f8 1f             	sar    eax,0x1f
30001e5d:	29 c2                	sub    edx,eax
30001e5f:	89 d0                	mov    eax,edx
30001e61:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001e67:	29 c3                	sub    ebx,eax
30001e69:	89 d8                	mov    eax,ebx
30001e6b:	85 c0                	test   eax,eax
30001e6d:	75 07                	jne    30001e76 <mktime+0x367>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114 (discriminator 5)
30001e6f:	ba 01 00 00 00       	mov    edx,0x1
30001e74:	eb 05                	jmp    30001e7b <mktime+0x36c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114 (discriminator 6)
30001e76:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:114 (discriminator 8)
30001e7b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e7e:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001e81:	89 d0                	mov    eax,edx
30001e83:	01 c0                	add    eax,eax
30001e85:	01 d0                	add    eax,edx
30001e87:	c1 e0 02             	shl    eax,0x2
30001e8a:	01 d8                	add    eax,ebx
30001e8c:	8b 84 81 a8 fd ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x258]
30001e93:	29 45 f0             	sub    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:115 (discriminator 8)
    if (++(tmbuf->tm_mon) == 12) {
30001e96:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001e99:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001e9c:	8d 50 01             	lea    edx,[eax+0x1]
30001e9f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ea2:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
30001ea5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ea8:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30001eab:	83 f8 0c             	cmp    eax,0xc
30001eae:	75 19                	jne    30001ec9 <mktime+0x3ba>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:116
      tmbuf->tm_mon = 0;
30001eb0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001eb3:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:117
      tmbuf->tm_year++;
30001eba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ebd:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001ec0:	8d 50 01             	lea    edx,[eax+0x1]
30001ec3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ec6:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
30001ec9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ecc:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001ecf:	83 e0 03             	and    eax,0x3
30001ed2:	85 c0                	test   eax,eax
30001ed4:	75 62                	jne    30001f38 <mktime+0x429>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113 (discriminator 1)
30001ed6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001ed9:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001edc:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001ee2:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001ee7:	89 d8                	mov    eax,ebx
30001ee9:	f7 ea                	imul   edx
30001eeb:	c1 fa 05             	sar    edx,0x5
30001eee:	89 d8                	mov    eax,ebx
30001ef0:	c1 f8 1f             	sar    eax,0x1f
30001ef3:	29 c2                	sub    edx,eax
30001ef5:	89 d0                	mov    eax,edx
30001ef7:	6b c0 64             	imul   eax,eax,0x64
30001efa:	29 c3                	sub    ebx,eax
30001efc:	89 d8                	mov    eax,ebx
30001efe:	85 c0                	test   eax,eax
30001f00:	75 2f                	jne    30001f31 <mktime+0x422>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113 (discriminator 4)
30001f02:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f05:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001f08:	8d 98 6c 07 00 00    	lea    ebx,[eax+0x76c]
30001f0e:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30001f13:	89 d8                	mov    eax,ebx
30001f15:	f7 ea                	imul   edx
30001f17:	c1 fa 07             	sar    edx,0x7
30001f1a:	89 d8                	mov    eax,ebx
30001f1c:	c1 f8 1f             	sar    eax,0x1f
30001f1f:	29 c2                	sub    edx,eax
30001f21:	89 d0                	mov    eax,edx
30001f23:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30001f29:	29 c3                	sub    ebx,eax
30001f2b:	89 d8                	mov    eax,ebx
30001f2d:	85 c0                	test   eax,eax
30001f2f:	75 07                	jne    30001f38 <mktime+0x429>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113 (discriminator 5)
30001f31:	ba 01 00 00 00       	mov    edx,0x1
30001f36:	eb 05                	jmp    30001f3d <mktime+0x42e>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113 (discriminator 6)
30001f38:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:113 (discriminator 8)
30001f3d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f40:	8b 58 10             	mov    ebx,DWORD PTR [eax+0x10]
30001f43:	89 d0                	mov    eax,edx
30001f45:	01 c0                	add    eax,eax
30001f47:	01 d0                	add    eax,edx
30001f49:	c1 e0 02             	shl    eax,0x2
30001f4c:	01 d8                	add    eax,ebx
30001f4e:	8b 84 81 a8 fd ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x258]
30001f55:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
30001f58:	0f 8e a9 fe ff ff    	jle    30001e07 <mktime+0x2f8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:120
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
30001f5e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30001f61:	8d 50 01             	lea    edx,[eax+0x1]
30001f64:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f67:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:121
  year = EPOCH_YR;
30001f6a:	c7 45 dc b2 07 00 00 	mov    DWORD PTR [ebp-0x24],0x7b2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:122
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
30001f71:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001f74:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001f77:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
30001f7a:	81 ea 6c 07 00 00    	sub    edx,0x76c
30001f80:	39 d0                	cmp    eax,edx
30001f82:	7d 0a                	jge    30001f8e <mktime+0x47f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:122 (discriminator 1)
30001f84:	b8 19 fc ff ff       	mov    eax,0xfffffc19
30001f89:	e9 d0 03 00 00       	jmp    3000235e <mktime+0x84f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:123
  seconds = 0;
30001f8e:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:124
  day = 0;                      // Means days since day 0 now
30001f95:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:125
  overflow = 0;
30001f9c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:132
  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;
30001fa3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30001fa6:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
30001fa9:	05 6c 07 00 00       	add    eax,0x76c
30001fae:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:134

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
30001fb1:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001fb4:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001fb7:	3d 7c c6 59 00       	cmp    eax,0x59c67c
30001fbc:	7e 07                	jle    30001fc5 <mktime+0x4b6>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:134 (discriminator 1)
30001fbe:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:135
  day = (tm_year - year) * 365;
30001fc5:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001fc8:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001fcb:	69 c0 6d 01 00 00    	imul   eax,eax,0x16d
30001fd1:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:136
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
30001fd4:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
30001fd9:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
30001fdc:	89 c2                	mov    edx,eax
30001fde:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001fe1:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30001fe4:	8d 58 03             	lea    ebx,[eax+0x3]
30001fe7:	85 c0                	test   eax,eax
30001fe9:	0f 48 c3             	cmovs  eax,ebx
30001fec:	c1 f8 02             	sar    eax,0x2
30001fef:	83 c0 01             	add    eax,0x1
30001ff2:	39 c2                	cmp    edx,eax
30001ff4:	7d 04                	jge    30001ffa <mktime+0x4eb>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:136 (discriminator 1)
30001ff6:	83 4d e4 02          	or     DWORD PTR [ebp-0x1c],0x2
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
30001ffa:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30001ffd:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30002000:	8d 50 03             	lea    edx,[eax+0x3]
30002003:	85 c0                	test   eax,eax
30002005:	0f 48 c2             	cmovs  eax,edx
30002008:	c1 f8 02             	sar    eax,0x2
3000200b:	89 c3                	mov    ebx,eax
3000200d:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30002010:	83 e0 03             	and    eax,0x3
30002013:	85 c0                	test   eax,eax
30002015:	74 29                	je     30002040 <mktime+0x531>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 1)
30002017:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
3000201a:	99                   	cdq    
3000201b:	c1 ea 1e             	shr    edx,0x1e
3000201e:	01 d0                	add    eax,edx
30002020:	83 e0 03             	and    eax,0x3
30002023:	29 d0                	sub    eax,edx
30002025:	89 c6                	mov    esi,eax
30002027:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
3000202a:	99                   	cdq    
3000202b:	c1 ea 1e             	shr    edx,0x1e
3000202e:	01 d0                	add    eax,edx
30002030:	83 e0 03             	and    eax,0x3
30002033:	29 d0                	sub    eax,edx
30002035:	39 c6                	cmp    esi,eax
30002037:	7d 07                	jge    30002040 <mktime+0x531>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 3)
30002039:	b8 01 00 00 00       	mov    eax,0x1
3000203e:	eb 05                	jmp    30002045 <mktime+0x536>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 4)
30002040:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:137 (discriminator 6)
30002045:	01 d8                	add    eax,ebx
30002047:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 6)
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
3000204a:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
3000204d:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
30002050:	89 c3                	mov    ebx,eax
30002052:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30002057:	89 d8                	mov    eax,ebx
30002059:	f7 ea                	imul   edx
3000205b:	c1 fa 05             	sar    edx,0x5
3000205e:	89 d8                	mov    eax,ebx
30002060:	c1 f8 1f             	sar    eax,0x1f
30002063:	89 d7                	mov    edi,edx
30002065:	29 c7                	sub    edi,eax
30002067:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
3000206a:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000206f:	89 d8                	mov    eax,ebx
30002071:	f7 ea                	imul   edx
30002073:	c1 fa 05             	sar    edx,0x5
30002076:	89 d8                	mov    eax,ebx
30002078:	c1 f8 1f             	sar    eax,0x1f
3000207b:	29 c2                	sub    edx,eax
3000207d:	89 d0                	mov    eax,edx
3000207f:	6b c0 64             	imul   eax,eax,0x64
30002082:	29 c3                	sub    ebx,eax
30002084:	89 d8                	mov    eax,ebx
30002086:	85 c0                	test   eax,eax
30002088:	74 49                	je     300020d3 <mktime+0x5c4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 1)
3000208a:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
3000208d:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30002092:	89 d8                	mov    eax,ebx
30002094:	f7 ea                	imul   edx
30002096:	c1 fa 05             	sar    edx,0x5
30002099:	89 d8                	mov    eax,ebx
3000209b:	c1 f8 1f             	sar    eax,0x1f
3000209e:	89 d6                	mov    esi,edx
300020a0:	29 c6                	sub    esi,eax
300020a2:	6b c6 64             	imul   eax,esi,0x64
300020a5:	89 de                	mov    esi,ebx
300020a7:	29 c6                	sub    esi,eax
300020a9:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
300020ac:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300020b1:	89 d8                	mov    eax,ebx
300020b3:	f7 ea                	imul   edx
300020b5:	c1 fa 05             	sar    edx,0x5
300020b8:	89 d8                	mov    eax,ebx
300020ba:	c1 f8 1f             	sar    eax,0x1f
300020bd:	29 c2                	sub    edx,eax
300020bf:	89 d0                	mov    eax,edx
300020c1:	6b c0 64             	imul   eax,eax,0x64
300020c4:	29 c3                	sub    ebx,eax
300020c6:	89 d8                	mov    eax,ebx
300020c8:	39 c6                	cmp    esi,eax
300020ca:	7d 07                	jge    300020d3 <mktime+0x5c4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 3)
300020cc:	b8 01 00 00 00       	mov    eax,0x1
300020d1:	eb 05                	jmp    300020d8 <mktime+0x5c9>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 4)
300020d3:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:138 (discriminator 6)
300020d8:	01 f8                	add    eax,edi
300020da:	29 45 f0             	sub    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 6)
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);
300020dd:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
300020e0:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
300020e3:	89 c3                	mov    ebx,eax
300020e5:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300020ea:	89 d8                	mov    eax,ebx
300020ec:	f7 ea                	imul   edx
300020ee:	c1 fa 07             	sar    edx,0x7
300020f1:	89 d8                	mov    eax,ebx
300020f3:	c1 f8 1f             	sar    eax,0x1f
300020f6:	89 d7                	mov    edi,edx
300020f8:	29 c7                	sub    edi,eax
300020fa:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
300020fd:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30002102:	89 d8                	mov    eax,ebx
30002104:	f7 ea                	imul   edx
30002106:	c1 fa 07             	sar    edx,0x7
30002109:	89 d8                	mov    eax,ebx
3000210b:	c1 f8 1f             	sar    eax,0x1f
3000210e:	29 c2                	sub    edx,eax
30002110:	89 d0                	mov    eax,edx
30002112:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30002118:	29 c3                	sub    ebx,eax
3000211a:	89 d8                	mov    eax,ebx
3000211c:	85 c0                	test   eax,eax
3000211e:	74 4f                	je     3000216f <mktime+0x660>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 1)
30002120:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30002123:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
30002128:	89 d8                	mov    eax,ebx
3000212a:	f7 ea                	imul   edx
3000212c:	c1 fa 07             	sar    edx,0x7
3000212f:	89 d8                	mov    eax,ebx
30002131:	c1 f8 1f             	sar    eax,0x1f
30002134:	89 d6                	mov    esi,edx
30002136:	29 c6                	sub    esi,eax
30002138:	69 c6 90 01 00 00    	imul   eax,esi,0x190
3000213e:	89 de                	mov    esi,ebx
30002140:	29 c6                	sub    esi,eax
30002142:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
30002145:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000214a:	89 d8                	mov    eax,ebx
3000214c:	f7 ea                	imul   edx
3000214e:	c1 fa 07             	sar    edx,0x7
30002151:	89 d8                	mov    eax,ebx
30002153:	c1 f8 1f             	sar    eax,0x1f
30002156:	29 c2                	sub    edx,eax
30002158:	89 d0                	mov    eax,edx
3000215a:	69 c0 90 01 00 00    	imul   eax,eax,0x190
30002160:	29 c3                	sub    ebx,eax
30002162:	89 d8                	mov    eax,ebx
30002164:	39 c6                	cmp    esi,eax
30002166:	7d 07                	jge    3000216f <mktime+0x660>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 3)
30002168:	b8 01 00 00 00       	mov    eax,0x1
3000216d:	eb 05                	jmp    30002174 <mktime+0x665>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 4)
3000216f:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:139 (discriminator 6)
30002174:	01 f8                	add    eax,edi
30002176:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:141 (discriminator 6)

  yday = month = 0;
30002179:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
30002180:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
30002183:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:142 (discriminator 6)
  while (month < tmbuf->tm_mon) {
30002186:	eb 7b                	jmp    30002203 <mktime+0x6f4>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143
    yday += _ytab[LEAPYEAR(tm_year)][month];
30002188:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
3000218b:	83 e0 03             	and    eax,0x3
3000218e:	85 c0                	test   eax,eax
30002190:	75 50                	jne    300021e2 <mktime+0x6d3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143 (discriminator 1)
30002192:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
30002195:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
3000219a:	89 d8                	mov    eax,ebx
3000219c:	f7 ea                	imul   edx
3000219e:	c1 fa 05             	sar    edx,0x5
300021a1:	89 d8                	mov    eax,ebx
300021a3:	c1 f8 1f             	sar    eax,0x1f
300021a6:	29 c2                	sub    edx,eax
300021a8:	89 d0                	mov    eax,edx
300021aa:	6b c0 64             	imul   eax,eax,0x64
300021ad:	29 c3                	sub    ebx,eax
300021af:	89 d8                	mov    eax,ebx
300021b1:	85 c0                	test   eax,eax
300021b3:	75 26                	jne    300021db <mktime+0x6cc>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143 (discriminator 4)
300021b5:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
300021b8:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
300021bd:	89 d8                	mov    eax,ebx
300021bf:	f7 ea                	imul   edx
300021c1:	c1 fa 07             	sar    edx,0x7
300021c4:	89 d8                	mov    eax,ebx
300021c6:	c1 f8 1f             	sar    eax,0x1f
300021c9:	29 c2                	sub    edx,eax
300021cb:	89 d0                	mov    eax,edx
300021cd:	69 c0 90 01 00 00    	imul   eax,eax,0x190
300021d3:	29 c3                	sub    ebx,eax
300021d5:	89 d8                	mov    eax,ebx
300021d7:	85 c0                	test   eax,eax
300021d9:	75 07                	jne    300021e2 <mktime+0x6d3>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143 (discriminator 5)
300021db:	ba 01 00 00 00       	mov    edx,0x1
300021e0:	eb 05                	jmp    300021e7 <mktime+0x6d8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143 (discriminator 6)
300021e2:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:143 (discriminator 8)
300021e7:	89 d0                	mov    eax,edx
300021e9:	01 c0                	add    eax,eax
300021eb:	01 d0                	add    eax,edx
300021ed:	c1 e0 02             	shl    eax,0x2
300021f0:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
300021f3:	01 d0                	add    eax,edx
300021f5:	8b 84 81 a8 fd ff ff 	mov    eax,DWORD PTR [ecx+eax*4-0x258]
300021fc:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:144 (discriminator 8)
    month++;
300021ff:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/libChrisOS/src/time.c:142
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
30002203:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002206:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
30002209:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
3000220c:	0f 8f 76 ff ff ff    	jg     30002188 <mktime+0x679>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:146
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
30002212:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002215:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
30002218:	83 e8 01             	sub    eax,0x1
3000221b:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:147
  if (day + yday < 0) overflow|=4;
3000221e:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
30002221:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30002224:	01 d0                	add    eax,edx
30002226:	85 c0                	test   eax,eax
30002228:	79 04                	jns    3000222e <mktime+0x71f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:147 (discriminator 1)
3000222a:	83 4d e4 04          	or     DWORD PTR [ebp-0x1c],0x4
/home/yogi/src/os/aproj/libChrisOS/src/time.c:148
  day += yday;
3000222e:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30002231:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:150

  tmbuf->tm_yday = yday;
30002234:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002237:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
3000223a:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/aproj/libChrisOS/src/time.c:151
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)
3000223d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30002240:	8d 58 04             	lea    ebx,[eax+0x4]
30002243:	ba 93 24 49 92       	mov    edx,0x92492493
30002248:	89 d8                	mov    eax,ebx
3000224a:	f7 ea                	imul   edx
3000224c:	8d 04 1a             	lea    eax,[edx+ebx*1]
3000224f:	c1 f8 02             	sar    eax,0x2
30002252:	89 c2                	mov    edx,eax
30002254:	89 d8                	mov    eax,ebx
30002256:	c1 f8 1f             	sar    eax,0x1f
30002259:	29 c2                	sub    edx,eax
3000225b:	89 d0                	mov    eax,edx
3000225d:	89 c2                	mov    edx,eax
3000225f:	c1 e2 03             	shl    edx,0x3
30002262:	29 c2                	sub    edx,eax
30002264:	89 d8                	mov    eax,ebx
30002266:	29 d0                	sub    eax,edx
30002268:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
3000226b:	89 42 18             	mov    DWORD PTR [edx+0x18],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:153

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;
3000226e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002271:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
30002274:	c1 e0 02             	shl    eax,0x2
30002277:	89 c2                	mov    edx,eax
30002279:	c1 e2 04             	shl    edx,0x4
3000227c:	29 c2                	sub    edx,eax
3000227e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002281:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30002284:	01 d0                	add    eax,edx
30002286:	c1 e0 02             	shl    eax,0x2
30002289:	89 c2                	mov    edx,eax
3000228b:	c1 e2 04             	shl    edx,0x4
3000228e:	29 c2                	sub    edx,eax
30002290:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002293:	8b 00                	mov    eax,DWORD PTR [eax]
30002295:	01 d0                	add    eax,edx
30002297:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:155

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
3000229a:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
3000229f:	2b 45 d8             	sub    eax,DWORD PTR [ebp-0x28]
300022a2:	89 c3                	mov    ebx,eax
300022a4:	ba 07 45 2e c2       	mov    edx,0xc22e4507
300022a9:	89 d8                	mov    eax,ebx
300022ab:	f7 ea                	imul   edx
300022ad:	8d 04 1a             	lea    eax,[edx+ebx*1]
300022b0:	c1 f8 10             	sar    eax,0x10
300022b3:	89 c2                	mov    edx,eax
300022b5:	89 d8                	mov    eax,ebx
300022b7:	c1 f8 1f             	sar    eax,0x1f
300022ba:	29 c2                	sub    edx,eax
300022bc:	89 d0                	mov    eax,edx
300022be:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
300022c1:	7d 04                	jge    300022c7 <mktime+0x7b8>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:155 (discriminator 1)
300022c3:	83 4d e4 08          	or     DWORD PTR [ebp-0x1c],0x8
/home/yogi/src/os/aproj/libChrisOS/src/time.c:156
  seconds += day * SECS_DAY;
300022c7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
300022ca:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
300022d0:	01 45 d8             	add    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:159

  // Now adjust according to timezone and daylight saving time
  if (((libcTZ > 0) && (TIME_MAX - libcTZ < seconds)) || 
300022d3:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
300022d9:	8b 00                	mov    eax,DWORD PTR [eax]
300022db:	85 c0                	test   eax,eax
300022dd:	7e 16                	jle    300022f5 <mktime+0x7e6>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:159 (discriminator 1)
300022df:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
300022e5:	8b 00                	mov    eax,DWORD PTR [eax]
300022e7:	ba ff ff ff 7f       	mov    edx,0x7fffffff
300022ec:	29 c2                	sub    edx,eax
300022ee:	89 d0                	mov    eax,edx
300022f0:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
300022f3:	7c 1b                	jl     30002310 <mktime+0x801>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:160 (discriminator 3)
      ((libcTZ < 0) && (seconds < -libcTZ))) {
300022f5:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
300022fb:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:159 (discriminator 3)

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
  seconds += day * SECS_DAY;

  // Now adjust according to timezone and daylight saving time
  if (((libcTZ > 0) && (TIME_MAX - libcTZ < seconds)) || 
300022fd:	85 c0                	test   eax,eax
300022ff:	79 13                	jns    30002314 <mktime+0x805>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:160
      ((libcTZ < 0) && (seconds < -libcTZ))) {
30002301:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
30002307:	8b 00                	mov    eax,DWORD PTR [eax]
30002309:	f7 d8                	neg    eax
3000230b:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
3000230e:	7e 04                	jle    30002314 <mktime+0x805>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:161
          overflow|=16;
30002310:	83 4d e4 10          	or     DWORD PTR [ebp-0x1c],0x10
/home/yogi/src/os/aproj/libChrisOS/src/time.c:163
  }
  seconds += libcTZ;
30002314:	8b 81 fc ff ff ff    	mov    eax,DWORD PTR [ecx-0x4]
3000231a:	8b 00                	mov    eax,DWORD PTR [eax]
3000231c:	01 45 d8             	add    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:165

  if (tmbuf->tm_isdst) {
3000231f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
30002322:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
30002325:	85 c0                	test   eax,eax
30002327:	74 0b                	je     30002334 <mktime+0x825>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:166
    dst = _dstbias;
30002329:	8b 81 5c 00 00 00    	mov    eax,DWORD PTR [ecx+0x5c]
3000232f:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
30002332:	eb 07                	jmp    3000233b <mktime+0x82c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:168
  } else {
    dst = 0;
30002334:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/libChrisOS/src/time.c:171
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
3000233b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
3000233e:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
30002341:	7e 04                	jle    30002347 <mktime+0x838>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:171 (discriminator 1)
30002343:	83 4d e4 20          	or     DWORD PTR [ebp-0x1c],0x20
/home/yogi/src/os/aproj/libChrisOS/src/time.c:172
  seconds -= dst;
30002347:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
3000234a:	29 45 d8             	sub    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/libChrisOS/src/time.c:174

  if (overflow) return (time_t) overflow-2;
3000234d:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
30002351:	74 08                	je     3000235b <mktime+0x84c>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:174 (discriminator 1)
30002353:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
30002356:	83 e8 02             	sub    eax,0x2
30002359:	eb 03                	jmp    3000235e <mktime+0x84f>
/home/yogi/src/os/aproj/libChrisOS/src/time.c:177

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
3000235b:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/libChrisOS/src/time.c:178
}
3000235e:	83 c4 20             	add    esp,0x20
30002361:	5b                   	pop    ebx
30002362:	5e                   	pop    esi
30002363:	5f                   	pop    edi
30002364:	5d                   	pop    ebp
30002365:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

30002366 <__x86.get_pc_thunk.ax>:
__x86.get_pc_thunk.ax():
30002366:	8b 04 24             	mov    eax,DWORD PTR [esp]
30002369:	c3                   	ret    

Disassembly of section .plt:

30002370 <.plt>:
30002370:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
30002376:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
3000237c:	00 00                	add    BYTE PTR [eax],al
3000237e:	00 00                	add    BYTE PTR [eax],al
30002380:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
30002386:	68 00 00 00 00       	push   0x0
3000238b:	e9 e0 ff ff ff       	jmp    30002370 <__x86.get_pc_thunk.ax+0xa>
30002390:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
30002396:	68 08 00 00 00       	push   0x8
3000239b:	e9 d0 ff ff ff       	jmp    30002370 <__x86.get_pc_thunk.ax+0xa>
300023a0:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
300023a6:	68 10 00 00 00       	push   0x10
300023ab:	e9 c0 ff ff ff       	jmp    30002370 <__x86.get_pc_thunk.ax+0xa>
300023b0:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
300023b6:	68 18 00 00 00       	push   0x18
300023bb:	e9 b0 ff ff ff       	jmp    30002370 <__x86.get_pc_thunk.ax+0xa>

Disassembly of section .text.__x86.get_pc_thunk.bx:

300023c0 <__x86.get_pc_thunk.bx>:
__x86.get_pc_thunk.bx():
300023c0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
300023c3:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.si:

300023c4 <__x86.get_pc_thunk.si>:
__x86.get_pc_thunk.si():
300023c4:	8b 34 24             	mov    esi,DWORD PTR [esp]
300023c7:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.cx:

300023c8 <__x86.get_pc_thunk.cx>:
__x86.get_pc_thunk.cx():
300023c8:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
300023cb:	c3                   	ret    

Disassembly of section .eh_frame:

300023cc <.eh_frame>:
300023cc:	14 00                	adc    al,0x0
300023ce:	00 00                	add    BYTE PTR [eax],al
300023d0:	00 00                	add    BYTE PTR [eax],al
300023d2:	00 00                	add    BYTE PTR [eax],al
300023d4:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
300023d7:	00 01                	add    BYTE PTR [ecx],al
300023d9:	7c 08                	jl     300023e3 <__x86.get_pc_thunk.cx+0x1b>
300023db:	01 1b                	add    DWORD PTR [ebx],ebx
300023dd:	0c 04                	or     al,0x4
300023df:	04 88                	add    al,0x88
300023e1:	01 00                	add    DWORD PTR [eax],eax
300023e3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300023e6:	00 00                	add    BYTE PTR [eax],al
300023e8:	1c 00                	sbb    al,0x0
300023ea:	00 00                	add    BYTE PTR [eax],al
300023ec:	14 dc                	adc    al,0xdc
300023ee:	ff                   	(bad)  
300023ef:	ff                   	(bad)  
300023f0:	38 00                	cmp    BYTE PTR [eax],al
300023f2:	00 00                	add    BYTE PTR [eax],al
300023f4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300023f7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300023fd:	74 c5                	je     300023c4 <__x86.get_pc_thunk.si>
300023ff:	0c 04                	or     al,0x4
30002401:	04 00                	add    al,0x0
30002403:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002406:	00 00                	add    BYTE PTR [eax],al
30002408:	3c 00                	cmp    al,0x0
3000240a:	00 00                	add    BYTE PTR [eax],al
3000240c:	2c dc                	sub    al,0xdc
3000240e:	ff                   	(bad)  
3000240f:	ff                   	(bad)  
30002410:	38 00                	cmp    BYTE PTR [eax],al
30002412:	00 00                	add    BYTE PTR [eax],al
30002414:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002417:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000241d:	74 c5                	je     300023e4 <__x86.get_pc_thunk.cx+0x1c>
3000241f:	0c 04                	or     al,0x4
30002421:	04 00                	add    al,0x0
30002423:	00 10                	add    BYTE PTR [eax],dl
30002425:	00 00                	add    BYTE PTR [eax],al
30002427:	00 5c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bl
3000242b:	00 3a                	add    BYTE PTR [edx],bh
3000242d:	ff                   	(bad)  
3000242e:	ff                   	(bad)  
3000242f:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
30002432:	00 00                	add    BYTE PTR [eax],al
30002434:	00 00                	add    BYTE PTR [eax],al
30002436:	00 00                	add    BYTE PTR [eax],al
30002438:	24 00                	and    al,0x0
3000243a:	00 00                	add    BYTE PTR [eax],al
3000243c:	70 00                	jo     3000243e <__x86.get_pc_thunk.cx+0x76>
3000243e:	00 00                	add    BYTE PTR [eax],al
30002440:	30 dc                	xor    ah,bl
30002442:	ff                   	(bad)  
30002443:	ff 55 00             	call   DWORD PTR [ebp+0x0]
30002446:	00 00                	add    BYTE PTR [eax],al
30002448:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000244b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002451:	42                   	inc    edx
30002452:	86 03                	xchg   BYTE PTR [ebx],al
30002454:	83 04 02 4d          	add    DWORD PTR [edx+eax*1],0x4d
30002458:	c3                   	ret    
30002459:	41                   	inc    ecx
3000245a:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
3000245e:	04 04                	add    al,0x4
30002460:	24 00                	and    al,0x0
30002462:	00 00                	add    BYTE PTR [eax],al
30002464:	98                   	cwde   
30002465:	00 00                	add    BYTE PTR [eax],al
30002467:	00 5d dc             	add    BYTE PTR [ebp-0x24],bl
3000246a:	ff                   	(bad)  
3000246b:	ff 55 00             	call   DWORD PTR [ebp+0x0]
3000246e:	00 00                	add    BYTE PTR [eax],al
30002470:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002473:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002479:	42                   	inc    edx
3000247a:	86 03                	xchg   BYTE PTR [ebx],al
3000247c:	83 04 02 4d          	add    DWORD PTR [edx+eax*1],0x4d
30002480:	c3                   	ret    
30002481:	41                   	inc    ecx
30002482:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
30002486:	04 04                	add    al,0x4
30002488:	24 00                	and    al,0x0
3000248a:	00 00                	add    BYTE PTR [eax],al
3000248c:	c0 00 00             	rol    BYTE PTR [eax],0x0
3000248f:	00 8c dc ff ff 97 00 	add    BYTE PTR [esp+ebx*8+0x97ffff],cl
30002496:	00 00                	add    BYTE PTR [eax],al
30002498:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000249b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300024a1:	42                   	inc    edx
300024a2:	86 03                	xchg   BYTE PTR [ebx],al
300024a4:	83 04 02 8f          	add    DWORD PTR [edx+eax*1],0xffffff8f
300024a8:	c3                   	ret    
300024a9:	41                   	inc    ecx
300024aa:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
300024ae:	04 04                	add    al,0x4
300024b0:	10 00                	adc    BYTE PTR [eax],al
300024b2:	00 00                	add    BYTE PTR [eax],al
300024b4:	e8 00 00 00 08       	call   380024b9 <ticksToWait+0x7ffec41>
300024b9:	ff                   	(bad)  
300024ba:	ff                   	(bad)  
300024bb:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
300024be:	00 00                	add    BYTE PTR [eax],al
300024c0:	00 00                	add    BYTE PTR [eax],al
300024c2:	00 00                	add    BYTE PTR [eax],al
300024c4:	20 00                	and    BYTE PTR [eax],al
300024c6:	00 00                	add    BYTE PTR [eax],al
300024c8:	fc                   	cld    
300024c9:	00 00                	add    BYTE PTR [eax],al
300024cb:	00 e8                	add    al,ch
300024cd:	dc ff                	fdiv   st(7),st
300024cf:	ff 77 00             	push   DWORD PTR [edi+0x0]
300024d2:	00 00                	add    BYTE PTR [eax],al
300024d4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300024d7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300024dd:	44                   	inc    esp
300024de:	83 03 02             	add    DWORD PTR [ebx],0x2
300024e1:	6f                   	outs   dx,DWORD PTR ds:[esi]
300024e2:	c5 c3 0c             	(bad)  
300024e5:	04 04                	add    al,0x4
300024e7:	00 20                	add    BYTE PTR [eax],ah
300024e9:	00 00                	add    BYTE PTR [eax],al
300024eb:	00 20                	add    BYTE PTR [eax],ah
300024ed:	01 00                	add    DWORD PTR [eax],eax
300024ef:	00 3b                	add    BYTE PTR [ebx],bh
300024f1:	dd ff                	(bad)  
300024f3:	ff                   	(bad)  
300024f4:	bb 00 00 00 00       	mov    ebx,0x0
300024f9:	41                   	inc    ecx
300024fa:	0e                   	push   cs
300024fb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002501:	44                   	inc    esp
30002502:	83 03 02             	add    DWORD PTR [ebx],0x2
30002505:	b3 c5                	mov    bl,0xc5
30002507:	c3                   	ret    
30002508:	0c 04                	or     al,0x4
3000250a:	04 00                	add    al,0x0
3000250c:	1c 00                	sbb    al,0x0
3000250e:	00 00                	add    BYTE PTR [eax],al
30002510:	44                   	inc    esp
30002511:	01 00                	add    DWORD PTR [eax],eax
30002513:	00 d2                	add    dl,dl
30002515:	dd ff                	(bad)  
30002517:	ff 5c 00 00          	call   FWORD PTR [eax+eax*1+0x0]
3000251b:	00 00                	add    BYTE PTR [eax],al
3000251d:	41                   	inc    ecx
3000251e:	0e                   	push   cs
3000251f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002525:	02 58 c5             	add    bl,BYTE PTR [eax-0x3b]
30002528:	0c 04                	or     al,0x4
3000252a:	04 00                	add    al,0x0
3000252c:	20 00                	and    BYTE PTR [eax],al
3000252e:	00 00                	add    BYTE PTR [eax],al
30002530:	64 01 00             	add    DWORD PTR fs:[eax],eax
30002533:	00 10                	add    BYTE PTR [eax],dl
30002535:	de ff                	fdivp  st(7),st
30002537:	ff 26                	jmp    DWORD PTR [esi]
30002539:	00 00                	add    BYTE PTR [eax],al
3000253b:	00 00                	add    BYTE PTR [eax],al
3000253d:	41                   	inc    ecx
3000253e:	0e                   	push   cs
3000253f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002545:	41                   	inc    ecx
30002546:	83 03 60             	add    DWORD PTR [ebx],0x60
30002549:	c3                   	ret    
3000254a:	41                   	inc    ecx
3000254b:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000254e:	04 00                	add    al,0x0
30002550:	20 00                	and    BYTE PTR [eax],al
30002552:	00 00                	add    BYTE PTR [eax],al
30002554:	88 01                	mov    BYTE PTR [ecx],al
30002556:	00 00                	add    BYTE PTR [eax],al
30002558:	12 de                	adc    bl,dh
3000255a:	ff                   	(bad)  
3000255b:	ff 43 00             	inc    DWORD PTR [ebx+0x0]
3000255e:	00 00                	add    BYTE PTR [eax],al
30002560:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002563:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002569:	44                   	inc    esp
3000256a:	83 03 7a             	add    DWORD PTR [ebx],0x7a
3000256d:	c3                   	ret    
3000256e:	41                   	inc    ecx
3000256f:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002572:	04 00                	add    al,0x0
30002574:	20 00                	and    BYTE PTR [eax],al
30002576:	00 00                	add    BYTE PTR [eax],al
30002578:	ac                   	lods   al,BYTE PTR ds:[esi]
30002579:	01 00                	add    DWORD PTR [eax],eax
3000257b:	00 31                	add    BYTE PTR [ecx],dh
3000257d:	de ff                	fdivp  st(7),st
3000257f:	ff 2f                	jmp    FWORD PTR [edi]
30002581:	00 00                	add    BYTE PTR [eax],al
30002583:	00 00                	add    BYTE PTR [eax],al
30002585:	41                   	inc    ecx
30002586:	0e                   	push   cs
30002587:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000258d:	44                   	inc    esp
3000258e:	83 03 66             	add    DWORD PTR [ebx],0x66
30002591:	c3                   	ret    
30002592:	41                   	inc    ecx
30002593:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002596:	04 00                	add    al,0x0
30002598:	20 00                	and    BYTE PTR [eax],al
3000259a:	00 00                	add    BYTE PTR [eax],al
3000259c:	d0 01                	rol    BYTE PTR [ecx],1
3000259e:	00 00                	add    BYTE PTR [eax],al
300025a0:	3c de                	cmp    al,0xde
300025a2:	ff                   	(bad)  
300025a3:	ff                   	(bad)  
300025a4:	ba 00 00 00 00       	mov    edx,0x0
300025a9:	41                   	inc    ecx
300025aa:	0e                   	push   cs
300025ab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025b1:	44                   	inc    esp
300025b2:	83 03 02             	add    DWORD PTR [ebx],0x2
300025b5:	b2 c5                	mov    dl,0xc5
300025b7:	c3                   	ret    
300025b8:	0c 04                	or     al,0x4
300025ba:	04 00                	add    al,0x0
300025bc:	20 00                	and    BYTE PTR [eax],al
300025be:	00 00                	add    BYTE PTR [eax],al
300025c0:	f4                   	hlt    
300025c1:	01 00                	add    DWORD PTR [eax],eax
300025c3:	00 d4                	add    ah,dl
300025c5:	de ff                	fdivp  st(7),st
300025c7:	ff 35 00 00 00 00    	push   DWORD PTR ds:0x0
300025cd:	41                   	inc    ecx
300025ce:	0e                   	push   cs
300025cf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025d5:	44                   	inc    esp
300025d6:	83 03 6c             	add    DWORD PTR [ebx],0x6c
300025d9:	c3                   	ret    
300025da:	41                   	inc    ecx
300025db:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300025de:	04 00                	add    al,0x0
300025e0:	20 00                	and    BYTE PTR [eax],al
300025e2:	00 00                	add    BYTE PTR [eax],al
300025e4:	18 02                	sbb    BYTE PTR [edx],al
300025e6:	00 00                	add    BYTE PTR [eax],al
300025e8:	e5 de                	in     eax,0xde
300025ea:	ff                   	(bad)  
300025eb:	ff 34 00             	push   DWORD PTR [eax+eax*1]
300025ee:	00 00                	add    BYTE PTR [eax],al
300025f0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300025f3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300025f9:	44                   	inc    esp
300025fa:	83 03 6b             	add    DWORD PTR [ebx],0x6b
300025fd:	c3                   	ret    
300025fe:	41                   	inc    ecx
300025ff:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002602:	04 00                	add    al,0x0
30002604:	20 00                	and    BYTE PTR [eax],al
30002606:	00 00                	add    BYTE PTR [eax],al
30002608:	3c 02                	cmp    al,0x2
3000260a:	00 00                	add    BYTE PTR [eax],al
3000260c:	f5                   	cmc    
3000260d:	de ff                	fdivp  st(7),st
3000260f:	ff 31                	push   DWORD PTR [ecx]
30002611:	00 00                	add    BYTE PTR [eax],al
30002613:	00 00                	add    BYTE PTR [eax],al
30002615:	41                   	inc    ecx
30002616:	0e                   	push   cs
30002617:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000261d:	44                   	inc    esp
3000261e:	83 03 68             	add    DWORD PTR [ebx],0x68
30002621:	c3                   	ret    
30002622:	41                   	inc    ecx
30002623:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002626:	04 00                	add    al,0x0
30002628:	1c 00                	sbb    al,0x0
3000262a:	00 00                	add    BYTE PTR [eax],al
3000262c:	60                   	pusha  
3000262d:	02 00                	add    al,BYTE PTR [eax]
3000262f:	00 02                	add    BYTE PTR [edx],al
30002631:	df ff                	(bad)  
30002633:	ff 27                	jmp    DWORD PTR [edi]
30002635:	00 00                	add    BYTE PTR [eax],al
30002637:	00 00                	add    BYTE PTR [eax],al
30002639:	41                   	inc    ecx
3000263a:	0e                   	push   cs
3000263b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002641:	63 c5                	arpl   bp,ax
30002643:	0c 04                	or     al,0x4
30002645:	04 00                	add    al,0x0
30002647:	00 20                	add    BYTE PTR [eax],ah
30002649:	00 00                	add    BYTE PTR [eax],al
3000264b:	00 80 02 00 00 09    	add    BYTE PTR [eax+0x9000002],al
30002651:	df ff                	(bad)  
30002653:	ff 9f 00 00 00 00    	call   FWORD PTR [edi+0x0]
30002659:	41                   	inc    ecx
3000265a:	0e                   	push   cs
3000265b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002661:	44                   	inc    esp
30002662:	83 03 02             	add    DWORD PTR [ebx],0x2
30002665:	97                   	xchg   edi,eax
30002666:	c5 c3 0c             	(bad)  
30002669:	04 04                	add    al,0x4
3000266b:	00 20                	add    BYTE PTR [eax],ah
3000266d:	00 00                	add    BYTE PTR [eax],al
3000266f:	00 a4 02 00 00 84 df 	add    BYTE PTR [edx+eax*1-0x207c0000],ah
30002676:	ff                   	(bad)  
30002677:	ff 1f                	call   FWORD PTR [edi]
30002679:	00 00                	add    BYTE PTR [eax],al
3000267b:	00 00                	add    BYTE PTR [eax],al
3000267d:	41                   	inc    ecx
3000267e:	0e                   	push   cs
3000267f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002685:	44                   	inc    esp
30002686:	83 03 56             	add    DWORD PTR [ebx],0x56
30002689:	c3                   	ret    
3000268a:	41                   	inc    ecx
3000268b:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000268e:	04 00                	add    al,0x0
30002690:	1c 00                	sbb    al,0x0
30002692:	00 00                	add    BYTE PTR [eax],al
30002694:	c8 02 00 00          	enter  0x2,0x0
30002698:	7f df                	jg     30002679 <__x86.get_pc_thunk.cx+0x2b1>
3000269a:	ff                   	(bad)  
3000269b:	ff 34 00             	push   DWORD PTR [eax+eax*1]
3000269e:	00 00                	add    BYTE PTR [eax],al
300026a0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300026a3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026a9:	70 c5                	jo     30002670 <__x86.get_pc_thunk.cx+0x2a8>
300026ab:	0c 04                	or     al,0x4
300026ad:	04 00                	add    al,0x0
300026af:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300026b2:	00 00                	add    BYTE PTR [eax],al
300026b4:	e8 02 00 00 93       	call   c30026bb <ticksToWait+0x92ffee43>
300026b9:	df ff                	(bad)  
300026bb:	ff 34 00             	push   DWORD PTR [eax+eax*1]
300026be:	00 00                	add    BYTE PTR [eax],al
300026c0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300026c3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026c9:	70 c5                	jo     30002690 <__x86.get_pc_thunk.cx+0x2c8>
300026cb:	0c 04                	or     al,0x4
300026cd:	04 00                	add    al,0x0
300026cf:	00 20                	add    BYTE PTR [eax],ah
300026d1:	00 00                	add    BYTE PTR [eax],al
300026d3:	00 08                	add    BYTE PTR [eax],cl
300026d5:	03 00                	add    eax,DWORD PTR [eax]
300026d7:	00 a7 df ff ff 37    	add    BYTE PTR [edi+0x37ffffdf],ah
300026dd:	00 00                	add    BYTE PTR [eax],al
300026df:	00 00                	add    BYTE PTR [eax],al
300026e1:	41                   	inc    ecx
300026e2:	0e                   	push   cs
300026e3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300026e9:	44                   	inc    esp
300026ea:	83 03 6e             	add    DWORD PTR [ebx],0x6e
300026ed:	c3                   	ret    
300026ee:	41                   	inc    ecx
300026ef:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300026f2:	04 00                	add    al,0x0
300026f4:	20 00                	and    BYTE PTR [eax],al
300026f6:	00 00                	add    BYTE PTR [eax],al
300026f8:	2c 03                	sub    al,0x3
300026fa:	00 00                	add    BYTE PTR [eax],al
300026fc:	ba df ff ff 4e       	mov    edx,0x4effffdf
30002701:	00 00                	add    BYTE PTR [eax],al
30002703:	00 00                	add    BYTE PTR [eax],al
30002705:	41                   	inc    ecx
30002706:	0e                   	push   cs
30002707:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000270d:	44                   	inc    esp
3000270e:	83 03 02             	add    DWORD PTR [ebx],0x2
30002711:	45                   	inc    ebp
30002712:	c3                   	ret    
30002713:	41                   	inc    ecx
30002714:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002717:	04 1c                	add    al,0x1c
30002719:	00 00                	add    BYTE PTR [eax],al
3000271b:	00 50 03             	add    BYTE PTR [eax+0x3],dl
3000271e:	00 00                	add    BYTE PTR [eax],al
30002720:	e4 df                	in     al,0xdf
30002722:	ff                   	(bad)  
30002723:	ff 1d 00 00 00 00    	call   FWORD PTR ds:0x0
30002729:	41                   	inc    ecx
3000272a:	0e                   	push   cs
3000272b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002731:	59                   	pop    ecx
30002732:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002735:	04 00                	add    al,0x0
30002737:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3000273a:	00 00                	add    BYTE PTR [eax],al
3000273c:	70 03                	jo     30002741 <__x86.get_pc_thunk.cx+0x379>
3000273e:	00 00                	add    BYTE PTR [eax],al
30002740:	e1 df                	loope  30002721 <__x86.get_pc_thunk.cx+0x359>
30002742:	ff                   	(bad)  
30002743:	ff 29                	jmp    FWORD PTR [ecx]
30002745:	00 00                	add    BYTE PTR [eax],al
30002747:	00 00                	add    BYTE PTR [eax],al
30002749:	41                   	inc    ecx
3000274a:	0e                   	push   cs
3000274b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002751:	65 c5 0c 04          	lds    ecx,FWORD PTR gs:[esp+eax*1]
30002755:	04 00                	add    al,0x0
30002757:	00 20                	add    BYTE PTR [eax],ah
30002759:	00 00                	add    BYTE PTR [eax],al
3000275b:	00 90 03 00 00 ea    	add    BYTE PTR [eax-0x15fffffd],dl
30002761:	df ff                	(bad)  
30002763:	ff 36                	push   DWORD PTR [esi]
30002765:	00 00                	add    BYTE PTR [eax],al
30002767:	00 00                	add    BYTE PTR [eax],al
30002769:	41                   	inc    ecx
3000276a:	0e                   	push   cs
3000276b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002771:	44                   	inc    esp
30002772:	83 03 6d             	add    DWORD PTR [ebx],0x6d
30002775:	c3                   	ret    
30002776:	41                   	inc    ecx
30002777:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3000277a:	04 00                	add    al,0x0
3000277c:	1c 00                	sbb    al,0x0
3000277e:	00 00                	add    BYTE PTR [eax],al
30002780:	b4 03                	mov    ah,0x3
30002782:	00 00                	add    BYTE PTR [eax],al
30002784:	fc                   	cld    
30002785:	df ff                	(bad)  
30002787:	ff 1d 00 00 00 00    	call   FWORD PTR ds:0x0
3000278d:	41                   	inc    ecx
3000278e:	0e                   	push   cs
3000278f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002795:	59                   	pop    ecx
30002796:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002799:	04 00                	add    al,0x0
3000279b:	00 20                	add    BYTE PTR [eax],ah
3000279d:	00 00                	add    BYTE PTR [eax],al
3000279f:	00 d4                	add    ah,dl
300027a1:	03 00                	add    eax,DWORD PTR [eax]
300027a3:	00 f9                	add    cl,bh
300027a5:	df ff                	(bad)  
300027a7:	ff 42 00             	inc    DWORD PTR [edx+0x0]
300027aa:	00 00                	add    BYTE PTR [eax],al
300027ac:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300027af:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300027b5:	44                   	inc    esp
300027b6:	83 03 7a             	add    DWORD PTR [ebx],0x7a
300027b9:	c5 c3 0c             	(bad)  
300027bc:	04 04                	add    al,0x4
300027be:	00 00                	add    BYTE PTR [eax],al
300027c0:	1c 00                	sbb    al,0x0
300027c2:	00 00                	add    BYTE PTR [eax],al
300027c4:	f8                   	clc    
300027c5:	03 00                	add    eax,DWORD PTR [eax]
300027c7:	00 17                	add    BYTE PTR [edi],dl
300027c9:	e0 ff                	loopne 300027ca <__x86.get_pc_thunk.cx+0x402>
300027cb:	ff 20                	jmp    DWORD PTR [eax]
300027cd:	00 00                	add    BYTE PTR [eax],al
300027cf:	00 00                	add    BYTE PTR [eax],al
300027d1:	41                   	inc    ecx
300027d2:	0e                   	push   cs
300027d3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300027d9:	5c                   	pop    esp
300027da:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300027dd:	04 00                	add    al,0x0
300027df:	00 20                	add    BYTE PTR [eax],ah
300027e1:	00 00                	add    BYTE PTR [eax],al
300027e3:	00 18                	add    BYTE PTR [eax],bl
300027e5:	04 00                	add    al,0x0
300027e7:	00 18                	add    BYTE PTR [eax],bl
300027e9:	e0 ff                	loopne 300027ea <__x86.get_pc_thunk.cx+0x422>
300027eb:	ff 5c 00 00          	call   FWORD PTR [eax+eax*1+0x0]
300027ef:	00 00                	add    BYTE PTR [eax],al
300027f1:	41                   	inc    ecx
300027f2:	0e                   	push   cs
300027f3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300027f9:	44                   	inc    esp
300027fa:	83 03 02             	add    DWORD PTR [ebx],0x2
300027fd:	54                   	push   esp
300027fe:	c5 c3 0c             	(bad)  
30002801:	04 04                	add    al,0x4
30002803:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002806:	00 00                	add    BYTE PTR [eax],al
30002808:	3c 04                	cmp    al,0x4
3000280a:	00 00                	add    BYTE PTR [eax],al
3000280c:	50                   	push   eax
3000280d:	e0 ff                	loopne 3000280e <__x86.get_pc_thunk.cx+0x446>
3000280f:	ff                   	(bad)  
30002810:	7c 00                	jl     30002812 <__x86.get_pc_thunk.cx+0x44a>
30002812:	00 00                	add    BYTE PTR [eax],al
30002814:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002817:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000281d:	02 78 c5             	add    bh,BYTE PTR [eax-0x3b]
30002820:	0c 04                	or     al,0x4
30002822:	04 00                	add    al,0x0
30002824:	28 00                	sub    BYTE PTR [eax],al
30002826:	00 00                	add    BYTE PTR [eax],al
30002828:	5c                   	pop    esp
30002829:	04 00                	add    al,0x0
3000282b:	00 ac e0 ff ff e3 01 	add    BYTE PTR [eax+eiz*8+0x1e3ffff],ch
30002832:	00 00                	add    BYTE PTR [eax],al
30002834:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002837:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
3000283d:	45                   	inc    ebp
3000283e:	86 03                	xchg   BYTE PTR [ebx],al
30002840:	83 04 03 d8          	add    DWORD PTR [ebx+eax*1],0xffffffd8
30002844:	01 c3                	add    ebx,eax
30002846:	41                   	inc    ecx
30002847:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
3000284b:	04 04                	add    al,0x4
3000284d:	00 00                	add    BYTE PTR [eax],al
3000284f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002852:	00 00                	add    BYTE PTR [eax],al
30002854:	88 04 00             	mov    BYTE PTR [eax+eax*1],al
30002857:	00 63 e2             	add    BYTE PTR [ebx-0x1e],ah
3000285a:	ff                   	(bad)  
3000285b:	ff                   	(bad)  
3000285c:	39 00                	cmp    DWORD PTR [eax],eax
3000285e:	00 00                	add    BYTE PTR [eax],al
30002860:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002863:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002869:	75 c5                	jne    30002830 <__x86.get_pc_thunk.cx+0x468>
3000286b:	0c 04                	or     al,0x4
3000286d:	04 00                	add    al,0x0
3000286f:	00 20                	add    BYTE PTR [eax],ah
30002871:	00 00                	add    BYTE PTR [eax],al
30002873:	00 a8 04 00 00 7c    	add    BYTE PTR [eax+0x7c000004],ch
30002879:	e2 ff                	loop   3000287a <__x86.get_pc_thunk.cx+0x4b2>
3000287b:	ff 26                	jmp    DWORD PTR [esi]
3000287d:	00 00                	add    BYTE PTR [eax],al
3000287f:	00 00                	add    BYTE PTR [eax],al
30002881:	41                   	inc    ecx
30002882:	0e                   	push   cs
30002883:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002889:	41                   	inc    ecx
3000288a:	83 03 60             	add    DWORD PTR [ebx],0x60
3000288d:	c3                   	ret    
3000288e:	41                   	inc    ecx
3000288f:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002892:	04 00                	add    al,0x0
30002894:	10 00                	adc    BYTE PTR [eax],al
30002896:	00 00                	add    BYTE PTR [eax],al
30002898:	cc                   	int3   
30002899:	04 00                	add    al,0x0
3000289b:	00 28                	add    BYTE PTR [eax],ch
3000289d:	fb                   	sti    
3000289e:	ff                   	(bad)  
3000289f:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
300028a2:	00 00                	add    BYTE PTR [eax],al
300028a4:	00 00                	add    BYTE PTR [eax],al
300028a6:	00 00                	add    BYTE PTR [eax],al
300028a8:	1c 00                	sbb    al,0x0
300028aa:	00 00                	add    BYTE PTR [eax],al
300028ac:	e0 04                	loopne 300028b2 <__x86.get_pc_thunk.cx+0x4ea>
300028ae:	00 00                	add    BYTE PTR [eax],al
300028b0:	6c                   	ins    BYTE PTR es:[edi],dx
300028b1:	e2 ff                	loop   300028b2 <__x86.get_pc_thunk.cx+0x4ea>
300028b3:	ff 9b 01 00 00 00    	call   FWORD PTR [ebx+0x1]
300028b9:	41                   	inc    ecx
300028ba:	0e                   	push   cs
300028bb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300028c1:	03 97 01 c5 0c 04    	add    edx,DWORD PTR [edi+0x40cc501]
300028c7:	04 1c                	add    al,0x1c
300028c9:	00 00                	add    BYTE PTR [eax],al
300028cb:	00 00                	add    BYTE PTR [eax],al
300028cd:	05 00 00 e8 e3       	add    eax,0xe3e80000
300028d2:	ff                   	(bad)  
300028d3:	ff c7                	inc    edi
300028d5:	00 00                	add    BYTE PTR [eax],al
300028d7:	00 00                	add    BYTE PTR [eax],al
300028d9:	41                   	inc    ecx
300028da:	0e                   	push   cs
300028db:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300028e1:	02 c3                	add    al,bl
300028e3:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
300028e6:	04 00                	add    al,0x0
300028e8:	1c 00                	sbb    al,0x0
300028ea:	00 00                	add    BYTE PTR [eax],al
300028ec:	20 05 00 00 8f e4    	and    BYTE PTR ds:0xe48f0000,al
300028f2:	ff                   	(bad)  
300028f3:	ff c7                	inc    edi
300028f5:	00 00                	add    BYTE PTR [eax],al
300028f7:	00 00                	add    BYTE PTR [eax],al
300028f9:	41                   	inc    ecx
300028fa:	0e                   	push   cs
300028fb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002901:	02 c3                	add    al,bl
30002903:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002906:	04 00                	add    al,0x0
30002908:	1c 00                	sbb    al,0x0
3000290a:	00 00                	add    BYTE PTR [eax],al
3000290c:	40                   	inc    eax
3000290d:	05 00 00 38 e5       	add    eax,0xe5380000
30002912:	ff                   	(bad)  
30002913:	ff 10                	call   DWORD PTR [eax]
30002915:	00 00                	add    BYTE PTR [eax],al
30002917:	00 00                	add    BYTE PTR [eax],al
30002919:	41                   	inc    ecx
3000291a:	0e                   	push   cs
3000291b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002921:	4c                   	dec    esp
30002922:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002925:	04 00                	add    al,0x0
30002927:	00 20                	add    BYTE PTR [eax],ah
30002929:	00 00                	add    BYTE PTR [eax],al
3000292b:	00 60 05             	add    BYTE PTR [eax+0x5],ah
3000292e:	00 00                	add    BYTE PTR [eax],al
30002930:	28 e5                	sub    ch,ah
30002932:	ff                   	(bad)  
30002933:	ff 2c 00             	jmp    FWORD PTR [eax+eax*1]
30002936:	00 00                	add    BYTE PTR [eax],al
30002938:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
3000293b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002941:	44                   	inc    esp
30002942:	83 03 64             	add    DWORD PTR [ebx],0x64
30002945:	c5 c3 0c             	(bad)  
30002948:	04 04                	add    al,0x4
3000294a:	00 00                	add    BYTE PTR [eax],al
3000294c:	20 00                	and    BYTE PTR [eax],al
3000294e:	00 00                	add    BYTE PTR [eax],al
30002950:	84 05 00 00 30 e5    	test   BYTE PTR ds:0xe5300000,al
30002956:	ff                   	(bad)  
30002957:	ff 26                	jmp    DWORD PTR [esi]
30002959:	00 00                	add    BYTE PTR [eax],al
3000295b:	00 00                	add    BYTE PTR [eax],al
3000295d:	41                   	inc    ecx
3000295e:	0e                   	push   cs
3000295f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002965:	44                   	inc    esp
30002966:	83 03 5e             	add    DWORD PTR [ebx],0x5e
30002969:	c5 c3 0c             	(bad)  
3000296c:	04 04                	add    al,0x4
3000296e:	00 00                	add    BYTE PTR [eax],al
30002970:	20 00                	and    BYTE PTR [eax],al
30002972:	00 00                	add    BYTE PTR [eax],al
30002974:	a8 05                	test   al,0x5
30002976:	00 00                	add    BYTE PTR [eax],al
30002978:	32 e5                	xor    ah,ch
3000297a:	ff                   	(bad)  
3000297b:	ff 37                	push   DWORD PTR [edi]
3000297d:	01 00                	add    DWORD PTR [eax],eax
3000297f:	00 00                	add    BYTE PTR [eax],al
30002981:	41                   	inc    ecx
30002982:	0e                   	push   cs
30002983:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002989:	44                   	inc    esp
3000298a:	83 03 03             	add    DWORD PTR [ebx],0x3
3000298d:	2f                   	das    
3000298e:	01 c5                	add    ebp,eax
30002990:	c3                   	ret    
30002991:	0c 04                	or     al,0x4
30002993:	04 20                	add    al,0x20
30002995:	00 00                	add    BYTE PTR [eax],al
30002997:	00 cc                	add    ah,cl
30002999:	05 00 00 45 e6       	add    eax,0xe6450000
3000299e:	ff                   	(bad)  
3000299f:	ff 84 00 00 00 00 41 	inc    DWORD PTR [eax+eax*1+0x41000000]
300029a6:	0e                   	push   cs
300029a7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300029ad:	44                   	inc    esp
300029ae:	83 03 02             	add    DWORD PTR [ebx],0x2
300029b1:	7c c5                	jl     30002978 <__x86.get_pc_thunk.cx+0x5b0>
300029b3:	c3                   	ret    
300029b4:	0c 04                	or     al,0x4
300029b6:	04 00                	add    al,0x0
300029b8:	1c 00                	sbb    al,0x0
300029ba:	00 00                	add    BYTE PTR [eax],al
300029bc:	f0 05 00 00 a5 e6    	lock add eax,0xe6a50000
300029c2:	ff                   	(bad)  
300029c3:	ff 53 00             	call   DWORD PTR [ebx+0x0]
300029c6:	00 00                	add    BYTE PTR [eax],al
300029c8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
300029cb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300029d1:	02 4f c5             	add    cl,BYTE PTR [edi-0x3b]
300029d4:	0c 04                	or     al,0x4
300029d6:	04 00                	add    al,0x0
300029d8:	20 00                	and    BYTE PTR [eax],al
300029da:	00 00                	add    BYTE PTR [eax],al
300029dc:	10 06                	adc    BYTE PTR [esi],al
300029de:	00 00                	add    BYTE PTR [eax],al
300029e0:	d8 e6                	fsub   st,st(6)
300029e2:	ff                   	(bad)  
300029e3:	ff                   	(bad)  
300029e4:	3e 00 00             	add    BYTE PTR ds:[eax],al
300029e7:	00 00                	add    BYTE PTR [eax],al
300029e9:	41                   	inc    ecx
300029ea:	0e                   	push   cs
300029eb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
300029f1:	44                   	inc    esp
300029f2:	83 03 76             	add    DWORD PTR [ebx],0x76
300029f5:	c5 c3 0c             	(bad)  
300029f8:	04 04                	add    al,0x4
300029fa:	00 00                	add    BYTE PTR [eax],al
300029fc:	1c 00                	sbb    al,0x0
300029fe:	00 00                	add    BYTE PTR [eax],al
30002a00:	34 06                	xor    al,0x6
30002a02:	00 00                	add    BYTE PTR [eax],al
30002a04:	f2 e6 ff             	repnz out 0xff,al
30002a07:	ff 6f 00             	jmp    FWORD PTR [edi+0x0]
30002a0a:	00 00                	add    BYTE PTR [eax],al
30002a0c:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002a0f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002a15:	02 6b c5             	add    ch,BYTE PTR [ebx-0x3b]
30002a18:	0c 04                	or     al,0x4
30002a1a:	04 00                	add    al,0x0
30002a1c:	24 00                	and    al,0x0
30002a1e:	00 00                	add    BYTE PTR [eax],al
30002a20:	54                   	push   esp
30002a21:	06                   	push   es
30002a22:	00 00                	add    BYTE PTR [eax],al
30002a24:	44                   	inc    esp
30002a25:	e7 ff                	out    0xff,eax
30002a27:	ff 5e 00             	call   FWORD PTR [esi+0x0]
30002a2a:	00 00                	add    BYTE PTR [eax],al
30002a2c:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002a2f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002a35:	45                   	inc    ebp
30002a36:	86 03                	xchg   BYTE PTR [ebx],al
30002a38:	83 04 02 53          	add    DWORD PTR [edx+eax*1],0x53
30002a3c:	c3                   	ret    
30002a3d:	41                   	inc    ecx
30002a3e:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
30002a42:	04 04                	add    al,0x4
30002a44:	1c 00                	sbb    al,0x0
30002a46:	00 00                	add    BYTE PTR [eax],al
30002a48:	7c 06                	jl     30002a50 <__x86.get_pc_thunk.cx+0x688>
30002a4a:	00 00                	add    BYTE PTR [eax],al
30002a4c:	7c e7                	jl     30002a35 <__x86.get_pc_thunk.cx+0x66d>
30002a4e:	ff                   	(bad)  
30002a4f:	ff 40 00             	inc    DWORD PTR [eax+0x0]
30002a52:	00 00                	add    BYTE PTR [eax],al
30002a54:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002a57:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002a5d:	7c c5                	jl     30002a24 <__x86.get_pc_thunk.cx+0x65c>
30002a5f:	0c 04                	or     al,0x4
30002a61:	04 00                	add    al,0x0
30002a63:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002a66:	00 00                	add    BYTE PTR [eax],al
30002a68:	9c                   	pushf  
30002a69:	06                   	push   es
30002a6a:	00 00                	add    BYTE PTR [eax],al
30002a6c:	9c                   	pushf  
30002a6d:	e7 ff                	out    0xff,eax
30002a6f:	ff 47 00             	inc    DWORD PTR [edi+0x0]
30002a72:	00 00                	add    BYTE PTR [eax],al
30002a74:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002a77:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002a7d:	02 43 c5             	add    al,BYTE PTR [ebx-0x3b]
30002a80:	0c 04                	or     al,0x4
30002a82:	04 00                	add    al,0x0
30002a84:	1c 00                	sbb    al,0x0
30002a86:	00 00                	add    BYTE PTR [eax],al
30002a88:	bc 06 00 00 c4       	mov    esp,0xc4000006
30002a8d:	e7 ff                	out    0xff,eax
30002a8f:	ff 31                	push   DWORD PTR [ecx]
30002a91:	00 00                	add    BYTE PTR [eax],al
30002a93:	00 00                	add    BYTE PTR [eax],al
30002a95:	41                   	inc    ecx
30002a96:	0e                   	push   cs
30002a97:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002a9d:	6d                   	ins    DWORD PTR es:[edi],dx
30002a9e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002aa1:	04 00                	add    al,0x0
30002aa3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002aa6:	00 00                	add    BYTE PTR [eax],al
30002aa8:	dc 06                	fadd   QWORD PTR [esi]
30002aaa:	00 00                	add    BYTE PTR [eax],al
30002aac:	d5 e7                	aad    0xe7
30002aae:	ff                   	(bad)  
30002aaf:	ff 31                	push   DWORD PTR [ecx]
30002ab1:	00 00                	add    BYTE PTR [eax],al
30002ab3:	00 00                	add    BYTE PTR [eax],al
30002ab5:	41                   	inc    ecx
30002ab6:	0e                   	push   cs
30002ab7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002abd:	6d                   	ins    DWORD PTR es:[edi],dx
30002abe:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002ac1:	04 00                	add    al,0x0
30002ac3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002ac6:	00 00                	add    BYTE PTR [eax],al
30002ac8:	fc                   	cld    
30002ac9:	06                   	push   es
30002aca:	00 00                	add    BYTE PTR [eax],al
30002acc:	e8 e7 ff ff 67       	call   98002ab8 <ticksToWait+0x67fff240>
30002ad1:	00 00                	add    BYTE PTR [eax],al
30002ad3:	00 00                	add    BYTE PTR [eax],al
30002ad5:	41                   	inc    ecx
30002ad6:	0e                   	push   cs
30002ad7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002add:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
30002ae0:	0c 04                	or     al,0x4
30002ae2:	04 00                	add    al,0x0
30002ae4:	1c 00                	sbb    al,0x0
30002ae6:	00 00                	add    BYTE PTR [eax],al
30002ae8:	1c 07                	sbb    al,0x7
30002aea:	00 00                	add    BYTE PTR [eax],al
30002aec:	30 e8                	xor    al,ch
30002aee:	ff                   	(bad)  
30002aef:	ff 60 00             	jmp    DWORD PTR [eax+0x0]
30002af2:	00 00                	add    BYTE PTR [eax],al
30002af4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002af7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002afd:	02 5c c5 0c          	add    bl,BYTE PTR [ebp+eax*8+0xc]
30002b01:	04 04                	add    al,0x4
30002b03:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
30002b06:	00 00                	add    BYTE PTR [eax],al
30002b08:	3c 07                	cmp    al,0x7
30002b0a:	00 00                	add    BYTE PTR [eax],al
30002b0c:	70 e8                	jo     30002af6 <__x86.get_pc_thunk.cx+0x72e>
30002b0e:	ff                   	(bad)  
30002b0f:	ff                   	(bad)  
30002b10:	7d 01                	jge    30002b13 <__x86.get_pc_thunk.cx+0x74b>
30002b12:	00 00                	add    BYTE PTR [eax],al
30002b14:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002b17:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002b1d:	46                   	inc    esi
30002b1e:	87 03                	xchg   DWORD PTR [ebx],eax
30002b20:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
30002b23:	05 03 70 01 c3       	add    eax,0xc3017003
30002b28:	41                   	inc    ecx
30002b29:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002b2d:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002b30:	04 00                	add    al,0x0
30002b32:	00 00                	add    BYTE PTR [eax],al
30002b34:	1c 00                	sbb    al,0x0
30002b36:	00 00                	add    BYTE PTR [eax],al
30002b38:	6c                   	ins    BYTE PTR es:[edi],dx
30002b39:	07                   	pop    es
30002b3a:	00 00                	add    BYTE PTR [eax],al
30002b3c:	c0 e9 ff             	shr    cl,0xff
30002b3f:	ff 1d 00 00 00 00    	call   FWORD PTR ds:0x0
30002b45:	41                   	inc    ecx
30002b46:	0e                   	push   cs
30002b47:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002b4d:	59                   	pop    ecx
30002b4e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002b51:	04 00                	add    al,0x0
30002b53:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
30002b56:	00 00                	add    BYTE PTR [eax],al
30002b58:	8c 07                	mov    WORD PTR [edi],es
30002b5a:	00 00                	add    BYTE PTR [eax],al
30002b5c:	c0 e9 ff             	shr    cl,0xff
30002b5f:	ff 9c 01 00 00 00 41 	call   FWORD PTR [ecx+eax*1+0x41000000]
30002b66:	0e                   	push   cs
30002b67:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002b6d:	46                   	inc    esi
30002b6e:	87 03                	xchg   DWORD PTR [ebx],eax
30002b70:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
30002b73:	05 03 8f 01 c3       	add    eax,0xc3018f03
30002b78:	41                   	inc    ecx
30002b79:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002b7d:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002b80:	04 00                	add    al,0x0
30002b82:	00 00                	add    BYTE PTR [eax],al
30002b84:	20 00                	and    BYTE PTR [eax],al
30002b86:	00 00                	add    BYTE PTR [eax],al
30002b88:	bc 07 00 00 2c       	mov    esp,0x2c000007
30002b8d:	eb ff                	jmp    30002b8e <__x86.get_pc_thunk.cx+0x7c6>
30002b8f:	ff 96 00 00 00 00    	call   DWORD PTR [esi+0x0]
30002b95:	41                   	inc    ecx
30002b96:	0e                   	push   cs
30002b97:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002b9d:	44                   	inc    esp
30002b9e:	83 03 02             	add    DWORD PTR [ebx],0x2
30002ba1:	8e c5                	mov    es,ebp
30002ba3:	c3                   	ret    
30002ba4:	0c 04                	or     al,0x4
30002ba6:	04 00                	add    al,0x0
30002ba8:	1c 00                	sbb    al,0x0
30002baa:	00 00                	add    BYTE PTR [eax],al
30002bac:	e0 07                	loopne 30002bb5 <__x86.get_pc_thunk.cx+0x7ed>
30002bae:	00 00                	add    BYTE PTR [eax],al
30002bb0:	a0 eb ff ff 29       	mov    al,ds:0x29ffffeb
30002bb5:	00 00                	add    BYTE PTR [eax],al
30002bb7:	00 00                	add    BYTE PTR [eax],al
30002bb9:	41                   	inc    ecx
30002bba:	0e                   	push   cs
30002bbb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002bc1:	65 c5 0c 04          	lds    ecx,FWORD PTR gs:[esp+eax*1]
30002bc5:	04 00                	add    al,0x0
30002bc7:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
30002bca:	00 00                	add    BYTE PTR [eax],al
30002bcc:	00 08                	add    BYTE PTR [eax],cl
30002bce:	00 00                	add    BYTE PTR [eax],al
30002bd0:	a9 eb ff ff 19       	test   eax,0x19ffffeb
30002bd5:	03 00                	add    eax,DWORD PTR [eax]
30002bd7:	00 00                	add    BYTE PTR [eax],al
30002bd9:	41                   	inc    ecx
30002bda:	0e                   	push   cs
30002bdb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002be1:	44                   	inc    esp
30002be2:	83 03 03             	add    DWORD PTR [ebx],0x3
30002be5:	10 03                	adc    BYTE PTR [ebx],al
30002be7:	c3                   	ret    
30002be8:	41                   	inc    ecx
30002be9:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002bec:	04 00                	add    al,0x0
30002bee:	00 00                	add    BYTE PTR [eax],al
30002bf0:	20 00                	and    BYTE PTR [eax],al
30002bf2:	00 00                	add    BYTE PTR [eax],al
30002bf4:	28 08                	sub    BYTE PTR [eax],cl
30002bf6:	00 00                	add    BYTE PTR [eax],al
30002bf8:	9a ee ff ff 3f 00 00 	call   0x0:0x3fffffee
30002bff:	00 00                	add    BYTE PTR [eax],al
30002c01:	41                   	inc    ecx
30002c02:	0e                   	push   cs
30002c03:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002c09:	44                   	inc    esp
30002c0a:	83 03 77             	add    DWORD PTR [ebx],0x77
30002c0d:	c5 c3 0c             	(bad)  
30002c10:	04 04                	add    al,0x4
30002c12:	00 00                	add    BYTE PTR [eax],al
30002c14:	20 00                	and    BYTE PTR [eax],al
30002c16:	00 00                	add    BYTE PTR [eax],al
30002c18:	4c                   	dec    esp
30002c19:	08 00                	or     BYTE PTR [eax],al
30002c1b:	00 b5 ee ff ff 3e    	add    BYTE PTR [ebp+0x3effffee],dh
30002c21:	00 00                	add    BYTE PTR [eax],al
30002c23:	00 00                	add    BYTE PTR [eax],al
30002c25:	41                   	inc    ecx
30002c26:	0e                   	push   cs
30002c27:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002c2d:	44                   	inc    esp
30002c2e:	83 03 76             	add    DWORD PTR [ebx],0x76
30002c31:	c5 c3 0c             	(bad)  
30002c34:	04 04                	add    al,0x4
30002c36:	00 00                	add    BYTE PTR [eax],al
30002c38:	2c 00                	sub    al,0x0
30002c3a:	00 00                	add    BYTE PTR [eax],al
30002c3c:	70 08                	jo     30002c46 <__x86.get_pc_thunk.cx+0x87e>
30002c3e:	00 00                	add    BYTE PTR [eax],al
30002c40:	cf                   	iret   
30002c41:	ee                   	out    dx,al
30002c42:	ff                   	(bad)  
30002c43:	ff 57 08             	call   DWORD PTR [edi+0x8]
30002c46:	00 00                	add    BYTE PTR [eax],al
30002c48:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
30002c4b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30002c51:	46                   	inc    esi
30002c52:	87 03                	xchg   DWORD PTR [ebx],eax
30002c54:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
30002c57:	05 03 4a 08 c3       	add    eax,0xc3084a03
30002c5c:	41                   	inc    ecx
30002c5d:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
30002c61:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
30002c64:	04 00                	add    al,0x0
30002c66:	00 00                	add    BYTE PTR [eax],al
30002c68:	10 00                	adc    BYTE PTR [eax],al
30002c6a:	00 00                	add    BYTE PTR [eax],al
30002c6c:	a0 08 00 00 58       	mov    al,ds:0x58000008
30002c71:	f7 ff                	idiv   edi
30002c73:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
30002c76:	00 00                	add    BYTE PTR [eax],al
30002c78:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynsym:

30002c7c <.dynsym>:
	...
30002c8c:	c5 00                	lds    eax,FWORD PTR [eax]
30002c8e:	00 00                	add    BYTE PTR [eax],al
30002c90:	c8 11 00 30          	enter  0x11,0x30
30002c94:	40                   	inc    eax
30002c95:	00 00                	add    BYTE PTR [eax],al
30002c97:	00 12                	add    BYTE PTR [edx],dl
30002c99:	00 01                	add    BYTE PTR [ecx],al
30002c9b:	00 68 00             	add    BYTE PTR [eax+0x0],ch
30002c9e:	00 00                	add    BYTE PTR [eax],al
30002ca0:	80 07 00             	add    BYTE PTR [edi],0x0
30002ca3:	30 1d 00 00 00 12    	xor    BYTE PTR ds:0x12000000,bl
30002ca9:	00 01                	add    BYTE PTR [ecx],al
30002cab:	00 4a 00             	add    BYTE PTR [edx+0x0],cl
30002cae:	00 00                	add    BYTE PTR [eax],al
30002cb0:	17                   	pop    ss
30002cb1:	06                   	push   es
30002cb2:	00 30                	add    BYTE PTR [eax],dh
30002cb4:	34 00                	xor    al,0x0
30002cb6:	00 00                	add    BYTE PTR [eax],al
30002cb8:	12 00                	adc    al,BYTE PTR [eax]
30002cba:	01 00                	add    DWORD PTR [eax],eax
30002cbc:	ae                   	scas   al,BYTE PTR es:[edi]
30002cbd:	00 00                	add    BYTE PTR [eax],al
30002cbf:	00 e1                	add    cl,ah
30002cc1:	0f 00                	(bad)  
30002cc3:	30 84 00 00 00 12 00 	xor    BYTE PTR [eax+eax*1+0x120000],al
30002cca:	01 00                	add    DWORD PTR [eax],eax
30002ccc:	3b 00                	cmp    eax,DWORD PTR [eax]
30002cce:	00 00                	add    BYTE PTR [eax],al
30002cd0:	dc 03                	fadd   QWORD PTR [ebx]
30002cd2:	00 30                	add    BYTE PTR [eax],dh
30002cd4:	ba 00 00 00 12       	mov    edx,0x12000000
30002cd9:	00 01                	add    BYTE PTR [ecx],al
30002cdb:	00 36                	add    BYTE PTR [esi],dh
30002cdd:	00 00                	add    BYTE PTR [eax],al
30002cdf:	00 ad 03 00 30 2f    	add    BYTE PTR [ebp+0x2f300003],ch
30002ce5:	00 00                	add    BYTE PTR [eax],al
30002ce7:	00 12                	add    BYTE PTR [edx],dl
30002ce9:	00 01                	add    BYTE PTR [ecx],al
30002ceb:	00 94 00 00 00 1c 0b 	add    BYTE PTR [eax+eax*1+0xb1c0000],dl
30002cf2:	00 30                	add    BYTE PTR [eax],dh
30002cf4:	9b                   	fwait
30002cf5:	01 00                	add    DWORD PTR [eax],eax
30002cf7:	00 12                	add    BYTE PTR [edx],dl
30002cf9:	00 01                	add    BYTE PTR [ecx],al
30002cfb:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30002cfe:	00 00                	add    BYTE PTR [eax],al
30002d00:	44                   	inc    esp
30002d01:	03 00                	add    eax,DWORD PTR [eax]
30002d03:	30 26                	xor    BYTE PTR [esi],ah
30002d05:	00 00                	add    BYTE PTR [eax],al
30002d07:	00 12                	add    BYTE PTR [edx],dl
30002d09:	00 01                	add    BYTE PTR [ecx],al
30002d0b:	00 88 00 00 00 d8    	add    BYTE PTR [eax-0x28000000],cl
30002d11:	08 00                	or     BYTE PTR [eax],al
30002d13:	30 e3                	xor    bl,ah
30002d15:	01 00                	add    DWORD PTR [eax],eax
30002d17:	00 12                	add    BYTE PTR [edx],dl
30002d19:	00 01                	add    BYTE PTR [ecx],al
30002d1b:	00 50 00             	add    BYTE PTR [eax+0x0],dl
30002d1e:	00 00                	add    BYTE PTR [eax],al
30002d20:	b6 06                	mov    dh,0x6
30002d22:	00 30                	add    BYTE PTR [eax],dh
30002d24:	4e                   	dec    esi
30002d25:	00 00                	add    BYTE PTR [eax],al
30002d27:	00 12                	add    BYTE PTR [edx],dl
30002d29:	00 01                	add    BYTE PTR [ecx],al
30002d2b:	00 eb                	add    bl,ch
30002d2d:	00 00                	add    BYTE PTR [eax],al
30002d2f:	00 7c 13 00          	add    BYTE PTR [ebx+edx*1+0x0],bh
30002d33:	30 7d 01             	xor    BYTE PTR [ebp+0x1],bh
30002d36:	00 00                	add    BYTE PTR [eax],al
30002d38:	12 00                	adc    al,BYTE PTR [eax]
30002d3a:	01 00                	add    DWORD PTR [eax],eax
30002d3c:	a2 00 00 00 48       	mov    ds:0x48000000,al
30002d41:	0e                   	push   cs
30002d42:	00 30                	add    BYTE PTR [eax],dh
30002d44:	10 00                	adc    BYTE PTR [eax],al
30002d46:	00 00                	add    BYTE PTR [eax],al
30002d48:	12 00                	adc    al,BYTE PTR [eax]
30002d4a:	01 00                	add    DWORD PTR [eax],eax
30002d4c:	78 00                	js     30002d4e <__x86.get_pc_thunk.cx+0x986>
30002d4e:	00 00                	add    BYTE PTR [eax],al
30002d50:	79 17                	jns    30002d69 <__x86.get_pc_thunk.cx+0x9a1>
30002d52:	00 30                	add    BYTE PTR [eax],dh
30002d54:	19 03                	sbb    DWORD PTR [ebx],eax
30002d56:	00 00                	add    BYTE PTR [eax],al
30002d58:	12 00                	adc    al,BYTE PTR [eax]
30002d5a:	01 00                	add    DWORD PTR [eax],eax
30002d5c:	fb                   	sti    
30002d5d:	00 00                	add    BYTE PTR [eax],al
30002d5f:	00 1c 15 00 30 9c 01 	add    BYTE PTR [edx*1+0x19c3000],bl
30002d66:	00 00                	add    BYTE PTR [eax],al
30002d68:	12 00                	adc    al,BYTE PTR [eax]
30002d6a:	01 00                	add    DWORD PTR [eax],eax
30002d6c:	40                   	inc    eax
30002d6d:	00 00                	add    BYTE PTR [eax],al
30002d6f:	00 59 05             	add    BYTE PTR [ecx+0x5],bl
30002d72:	00 30                	add    BYTE PTR [eax],dh
30002d74:	9f                   	lahf   
30002d75:	00 00                	add    BYTE PTR [eax],al
30002d77:	00 12                	add    BYTE PTR [edx],dl
30002d79:	00 01                	add    BYTE PTR [ecx],al
30002d7b:	00 b7 00 00 00 b8    	add    BYTE PTR [edi-0x48000000],dh
30002d81:	10 00                	adc    BYTE PTR [eax],al
30002d83:	30 3e                	xor    BYTE PTR [esi],bh
30002d85:	00 00                	add    BYTE PTR [eax],al
30002d87:	00 12                	add    BYTE PTR [edx],dl
30002d89:	00 01                	add    BYTE PTR [ecx],al
30002d8b:	00 63 00             	add    BYTE PTR [ebx+0x0],ah
30002d8e:	00 00                	add    BYTE PTR [eax],al
30002d90:	4a                   	dec    edx
30002d91:	07                   	pop    es
30002d92:	00 30                	add    BYTE PTR [eax],dh
30002d94:	36 00 00             	add    BYTE PTR ss:[eax],al
30002d97:	00 12                	add    BYTE PTR [edx],dl
30002d99:	00 01                	add    BYTE PTR [ecx],al
30002d9b:	00 20                	add    BYTE PTR [eax],ah
30002d9d:	01 00                	add    DWORD PTR [eax],eax
30002d9f:	00 0f                	add    BYTE PTR [edi],cl
30002da1:	1b 00                	sbb    eax,DWORD PTR [eax]
30002da3:	30 57 08             	xor    BYTE PTR [edi+0x8],dl
30002da6:	00 00                	add    BYTE PTR [eax],al
30002da8:	12 00                	adc    al,BYTE PTR [eax]
30002daa:	01 00                	add    DWORD PTR [eax],eax
30002dac:	db 00                	fild   DWORD PTR [eax]
30002dae:	00 00                	add    BYTE PTR [eax],al
30002db0:	b4 12                	mov    ah,0x12
30002db2:	00 30                	add    BYTE PTR [eax],dh
30002db4:	67 00 00             	add    BYTE PTR [bx+si],al
30002db7:	00 12                	add    BYTE PTR [edx],dl
30002db9:	00 01                	add    BYTE PTR [ecx],al
30002dbb:	00 e3                	add    bl,ah
30002dbd:	00 00                	add    BYTE PTR [eax],al
30002dbf:	00 1c 13             	add    BYTE PTR [ebx+edx*1],bl
30002dc2:	00 30                	add    BYTE PTR [eax],dh
30002dc4:	60                   	pusha  
30002dc5:	00 00                	add    BYTE PTR [eax],al
30002dc7:	00 12                	add    BYTE PTR [edx],dl
30002dc9:	00 01                	add    BYTE PTR [ecx],al
30002dcb:	00 10                	add    BYTE PTR [eax],dl
30002dcd:	00 00                	add    BYTE PTR [eax],al
30002dcf:	00 1c 01             	add    BYTE PTR [ecx+eax*1],bl
30002dd2:	00 30                	add    BYTE PTR [eax],dh
30002dd4:	97                   	xchg   edi,eax
30002dd5:	00 00                	add    BYTE PTR [eax],al
30002dd7:	00 12                	add    BYTE PTR [edx],dl
30002dd9:	00 01                	add    BYTE PTR [ecx],al
30002ddb:	00 21                	add    BYTE PTR [ecx],ah
30002ddd:	00 00                	add    BYTE PTR [eax],al
30002ddf:	00 00                	add    BYTE PTR [eax],al
30002de1:	00 13                	add    BYTE PTR [ebx],dl
30002de3:	00 00                	add    BYTE PTR [eax],al
30002de5:	00 00                	add    BYTE PTR [eax],al
30002de7:	00 10                	add    BYTE PTR [eax],dl
30002de9:	00 01                	add    BYTE PTR [ecx],al
30002deb:	00 0a                	add    BYTE PTR [edx],cl
30002ded:	01 00                	add    DWORD PTR [eax],eax
30002def:	00 92 1a 00 30 3f    	add    BYTE PTR [edx+0x3f30001a],dl
30002df5:	00 00                	add    BYTE PTR [eax],al
30002df7:	00 12                	add    BYTE PTR [edx],dl
30002df9:	00 01                	add    BYTE PTR [ecx],al
30002dfb:	00 9b 00 00 00 b8    	add    BYTE PTR [ebx-0x48000000],bl
30002e01:	0c 00                	or     al,0x0
30002e03:	30 c7                	xor    bh,al
30002e05:	00 00                	add    BYTE PTR [eax],al
30002e07:	00 12                	add    BYTE PTR [edx],dl
30002e09:	00 01                	add    BYTE PTR [ecx],al
30002e0b:	00 02                	add    BYTE PTR [edx],al
30002e0d:	01 00                	add    DWORD PTR [eax],eax
30002e0f:	00 b8 16 00 30 96    	add    BYTE PTR [eax-0x69cfffea],bh
30002e15:	00 00                	add    BYTE PTR [eax],al
30002e17:	00 12                	add    BYTE PTR [edx],dl
30002e19:	00 01                	add    BYTE PTR [ecx],al
30002e1b:	00 22                	add    BYTE PTR [edx],ah
30002e1d:	01 00                	add    DWORD PTR [eax],eax
30002e1f:	00 50 17             	add    BYTE PTR [eax+0x17],dl
30002e22:	00 30                	add    BYTE PTR [eax],dh
30002e24:	29 00                	sub    DWORD PTR [eax],eax
30002e26:	00 00                	add    BYTE PTR [eax],al
30002e28:	12 00                	adc    al,BYTE PTR [eax]
30002e2a:	01 00                	add    DWORD PTR [eax],eax
30002e2c:	31 00                	xor    DWORD PTR [eax],eax
30002e2e:	00 00                	add    BYTE PTR [eax],al
30002e30:	6a 03                	push   0x3
30002e32:	00 30                	add    BYTE PTR [eax],dh
30002e34:	43                   	inc    ebx
30002e35:	00 00                	add    BYTE PTR [eax],al
30002e37:	00 12                	add    BYTE PTR [edx],dl
30002e39:	00 01                	add    BYTE PTR [ecx],al
30002e3b:	00 cc                	add    ah,cl
30002e3d:	00 00                	add    BYTE PTR [eax],al
30002e3f:	00 68 11             	add    BYTE PTR [eax+0x11],ch
30002e42:	00 30                	add    BYTE PTR [eax],dh
30002e44:	5e                   	pop    esi
30002e45:	00 00                	add    BYTE PTR [eax],al
30002e47:	00 12                	add    BYTE PTR [edx],dl
30002e49:	00 01                	add    BYTE PTR [ecx],al
30002e4b:	00 81 00 00 00 df    	add    BYTE PTR [ecx-0x21000000],al
30002e51:	07                   	pop    es
30002e52:	00 30                	add    BYTE PTR [eax],dh
30002e54:	20 00                	and    BYTE PTR [eax],al
30002e56:	00 00                	add    BYTE PTR [eax],al
30002e58:	12 00                	adc    al,BYTE PTR [eax]
30002e5a:	01 00                	add    DWORD PTR [eax],eax
30002e5c:	08 00                	or     BYTE PTR [eax],al
30002e5e:	00 00                	add    BYTE PTR [eax],al
30002e60:	70 00                	jo     30002e62 <__x86.get_pc_thunk.cx+0xa9a>
30002e62:	00 30                	add    BYTE PTR [eax],dh
30002e64:	55                   	push   ebp
30002e65:	00 00                	add    BYTE PTR [eax],al
30002e67:	00 12                	add    BYTE PTR [edx],dl
30002e69:	00 01                	add    BYTE PTR [ecx],al
30002e6b:	00 d3                	add    bl,dl
30002e6d:	00 00                	add    BYTE PTR [eax],al
30002e6f:	00 08                	add    BYTE PTR [eax],cl
30002e71:	12 00                	adc    al,BYTE PTR [eax]
30002e73:	30 47 00             	xor    BYTE PTR [edi+0x0],al
30002e76:	00 00                	add    BYTE PTR [eax],al
30002e78:	12 00                	adc    al,BYTE PTR [eax]
30002e7a:	01 00                	add    DWORD PTR [eax],eax
30002e7c:	56                   	push   esi
30002e7d:	00 00                	add    BYTE PTR [eax],al
30002e7f:	00 21                	add    BYTE PTR [ecx],ah
30002e81:	07                   	pop    es
30002e82:	00 30                	add    BYTE PTR [eax],dh
30002e84:	29 00                	sub    DWORD PTR [eax],eax
30002e86:	00 00                	add    BYTE PTR [eax],al
30002e88:	12 00                	adc    al,BYTE PTR [eax]
30002e8a:	01 00                	add    DWORD PTR [eax],eax
30002e8c:	14 01                	adc    al,0x1
30002e8e:	00 00                	add    BYTE PTR [eax],al
30002e90:	d1 1a                	rcr    DWORD PTR [edx],1
30002e92:	00 30                	add    BYTE PTR [eax],dh
30002e94:	3e 00 00             	add    BYTE PTR ds:[eax],al
30002e97:	00 12                	add    BYTE PTR [edx],dl
30002e99:	00 01                	add    BYTE PTR [ecx],al
30002e9b:	00 70 00             	add    BYTE PTR [eax+0x0],dh
30002e9e:	00 00                	add    BYTE PTR [eax],al
30002ea0:	9d                   	popf   
30002ea1:	07                   	pop    es
30002ea2:	00 30                	add    BYTE PTR [eax],dh
30002ea4:	42                   	inc    edx
30002ea5:	00 00                	add    BYTE PTR [eax],al
30002ea7:	00 12                	add    BYTE PTR [edx],dl
30002ea9:	00 01                	add    BYTE PTR [ecx],al
30002eab:	00 17                	add    BYTE PTR [edi],dl
30002ead:	00 00                	add    BYTE PTR [eax],al
30002eaf:	00 e6                	add    dh,ah
30002eb1:	02 00                	add    al,BYTE PTR [eax]
30002eb3:	30 5c 00 00          	xor    BYTE PTR [eax+eax*1+0x0],bl
30002eb7:	00 12                	add    BYTE PTR [edx],dl
30002eb9:	00 01                	add    BYTE PTR [ecx],al
30002ebb:	00 a7 00 00 00 aa    	add    BYTE PTR [edi-0x56000000],ah
30002ec1:	0e                   	push   cs
30002ec2:	00 30                	add    BYTE PTR [eax],dh
30002ec4:	37                   	aaa    
30002ec5:	01 00                	add    DWORD PTR [eax],eax
30002ec7:	00 12                	add    BYTE PTR [edx],dl
30002ec9:	00 01                	add    BYTE PTR [ecx],al
30002ecb:	00 be 00 00 00 50    	add    BYTE PTR [esi+0x50000000],bh
30002ed1:	12 00                	adc    al,BYTE PTR [eax]
30002ed3:	30 31                	xor    BYTE PTR [ecx],dh
30002ed5:	00 00                	add    BYTE PTR [eax],al
30002ed7:	00 12                	add    BYTE PTR [edx],dl
30002ed9:	00 01                	add    BYTE PTR [ecx],al
30002edb:	00 01                	add    BYTE PTR [ecx],al
30002edd:	00 00                	add    BYTE PTR [eax],al
30002edf:	00 00                	add    BYTE PTR [eax],al
30002ee1:	00 00                	add    BYTE PTR [eax],al
30002ee3:	30 38                	xor    BYTE PTR [eax],bh
30002ee5:	00 00                	add    BYTE PTR [eax],al
30002ee7:	00 12                	add    BYTE PTR [edx],dl
30002ee9:	00 01                	add    BYTE PTR [ecx],al
30002eeb:	00 f3                	add    bl,dh
30002eed:	00 00                	add    BYTE PTR [eax],al
30002eef:	00 fc                	add    ah,bh
30002ef1:	14 00                	adc    al,0x0
30002ef3:	30 1d 00 00 00 12    	xor    BYTE PTR ds:0x12000000,bl
30002ef9:	00 01                	add    BYTE PTR [ecx],al
30002efb:	00 8f 00 00 00 bb    	add    BYTE PTR [edi-0x45000000],cl
30002f01:	0a 00                	or     al,BYTE PTR [eax]
30002f03:	30 39                	xor    BYTE PTR [ecx],bh
30002f05:	00 00                	add    BYTE PTR [eax],al
30002f07:	00 12                	add    BYTE PTR [edx],dl
30002f09:	00 01                	add    BYTE PTR [ecx],al
	...

Disassembly of section .dynstr:

30002f0c <.dynstr>:
30002f0c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002f0f:	72 63                	jb     30002f74 <__x86.get_pc_thunk.cx+0xbac>
30002f11:	68 72 00 73 74       	push   0x74730072
30002f16:	72 63                	jb     30002f7b <__x86.get_pc_thunk.cx+0xbb3>
30002f18:	73 70                	jae    30002f8a <__x86.get_pc_thunk.cx+0xbc2>
30002f1a:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f1b:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002f1e:	72 74                	jb     30002f94 <__x86.get_pc_thunk.cx+0xbcc>
30002f20:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002f21:	6b 00 61             	imul   eax,DWORD PTR [eax],0x61
30002f24:	74 6f                	je     30002f95 <__x86.get_pc_thunk.cx+0xbcd>
30002f26:	69 00 70 75 74 73    	imul   eax,DWORD PTR [eax],0x73747570
30002f2c:	00 73 79             	add    BYTE PTR [ebx+0x79],dh
30002f2f:	73 45                	jae    30002f76 <__x86.get_pc_thunk.cx+0xbae>
30002f31:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f32:	74 65                	je     30002f99 <__x86.get_pc_thunk.cx+0xbd1>
30002f34:	72 5f                	jb     30002f95 <__x86.get_pc_thunk.cx+0xbcd>
30002f36:	56                   	push   esi
30002f37:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
30002f3c:	00 70 75             	add    BYTE PTR [eax+0x75],dh
30002f3f:	74 63                	je     30002fa4 <__x86.get_pc_thunk.cx+0xbdc>
30002f41:	00 67 65             	add    BYTE PTR [edi+0x65],ah
30002f44:	74 63                	je     30002fa9 <__x86.get_pc_thunk.cx+0xbe1>
30002f46:	00 67 65             	add    BYTE PTR [edi+0x65],ah
30002f49:	74 73                	je     30002fbe <__x86.get_pc_thunk.cx+0xbf6>
30002f4b:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30002f4f:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
30002f52:	6e                   	outs   dx,BYTE PTR ds:[esi]
30002f53:	69 74 00 70 72 69 6e 	imul   esi,DWORD PTR [eax+eax*1+0x70],0x746e6972
30002f5a:	74 
30002f5b:	00 73 6c             	add    BYTE PTR [ebx+0x6c],dh
30002f5e:	65                   	gs
30002f5f:	65                   	gs
30002f60:	70 00                	jo     30002f62 <__x86.get_pc_thunk.cx+0xb9a>
30002f62:	6d                   	ins    DWORD PTR es:[edi],dx
30002f63:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002f64:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
30002f6b:	6e 
30002f6c:	61                   	popa   
30002f6d:	6c                   	ins    BYTE PTR es:[edi],dx
30002f6e:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
30002f71:	65 63 00             	arpl   WORD PTR gs:[eax],ax
30002f74:	77 61                	ja     30002fd7 <__x86.get_pc_thunk.cx+0xc0f>
30002f76:	69 74 70 69 64 00 67 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x65670064
30002f7d:	65 
30002f7e:	74 74                	je     30002ff4 <__x86.get_pc_thunk.cx+0xc2c>
30002f80:	69 6d 65 00 67 6d 74 	imul   ebp,DWORD PTR [ebp+0x65],0x746d6700
30002f87:	69 6d 65 5f 72 00 67 	imul   ebp,DWORD PTR [ebp+0x65],0x6700725f
30002f8e:	65                   	gs
30002f8f:	74 63                	je     30002ff4 <__x86.get_pc_thunk.cx+0xc2c>
30002f91:	77 64                	ja     30002ff7 <__x86.get_pc_thunk.cx+0xc2f>
30002f93:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
30002f96:	6c                   	ins    BYTE PTR es:[edi],dx
30002f97:	6c                   	ins    BYTE PTR es:[edi],dx
30002f98:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002f99:	63 00                	arpl   WORD PTR [eax],ax
30002f9b:	66                   	data16
30002f9c:	72 65                	jb     30003003 <__x86.get_pc_thunk.cx+0xc3b>
30002f9e:	65 00 6d 65          	add    BYTE PTR gs:[ebp+0x65],ch
30002fa2:	6d                   	ins    DWORD PTR es:[edi],dx
30002fa3:	63 70 79             	arpl   WORD PTR [eax+0x79],si
30002fa6:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
30002fa9:	6d                   	ins    DWORD PTR es:[edi],dx
30002faa:	73 65                	jae    30003011 <__x86.get_pc_thunk.cx+0xc49>
30002fac:	74 00                	je     30002fae <__x86.get_pc_thunk.cx+0xbe6>
30002fae:	6d                   	ins    DWORD PTR es:[edi],dx
30002faf:	6d                   	ins    DWORD PTR es:[edi],dx
30002fb0:	61                   	popa   
30002fb1:	70 00                	jo     30002fb3 <__x86.get_pc_thunk.cx+0xbeb>
30002fb3:	6d                   	ins    DWORD PTR es:[edi],dx
30002fb4:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002fb5:	76 65                	jbe    3000301c <__x86.get_pc_thunk.cx+0xc54>
30002fb7:	54                   	push   esp
30002fb8:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002fb9:	00 72 65             	add    BYTE PTR [edx+0x65],dh
30002fbc:	73 65                	jae    30003023 <__x86.get_pc_thunk.cx+0xc5b>
30002fbe:	74 52                	je     30003012 <__x86.get_pc_thunk.cx+0xc4a>
30002fc0:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002fc1:	77 00                	ja     30002fc3 <__x86.get_pc_thunk.cx+0xbfb>
30002fc3:	73 74                	jae    30003039 <__x86.get_pc_thunk.cx+0xc71>
30002fc5:	72 63                	jb     3000302a <__x86.get_pc_thunk.cx+0xc62>
30002fc7:	61                   	popa   
30002fc8:	74 00                	je     30002fca <__x86.get_pc_thunk.cx+0xc02>
30002fca:	73 74                	jae    30003040 <__x86.get_pc_thunk.cx+0xc78>
30002fcc:	72 6c                	jb     3000303a <__x86.get_pc_thunk.cx+0xc72>
30002fce:	65 6e                	outs   dx,BYTE PTR gs:[esi]
30002fd0:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002fd3:	72 63                	jb     30003038 <__x86.get_pc_thunk.cx+0xc70>
30002fd5:	70 79                	jo     30003050 <__x86.get_pc_thunk.cx+0xc88>
30002fd7:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002fda:	72 63                	jb     3000303f <__x86.get_pc_thunk.cx+0xc77>
30002fdc:	6d                   	ins    DWORD PTR es:[edi],dx
30002fdd:	70 00                	jo     30002fdf <__x86.get_pc_thunk.cx+0xc17>
30002fdf:	73 74                	jae    30003055 <__x86.get_pc_thunk.cx+0xc8d>
30002fe1:	72 63                	jb     30003046 <__x86.get_pc_thunk.cx+0xc7e>
30002fe3:	70 79                	jo     3000305e <__x86.get_pc_thunk.cx+0xc96>
30002fe5:	63 00                	arpl   WORD PTR [eax],ax
30002fe7:	73 74                	jae    3000305d <__x86.get_pc_thunk.cx+0xc95>
30002fe9:	72 6e                	jb     30003059 <__x86.get_pc_thunk.cx+0xc91>
30002feb:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
30002fee:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002ff1:	72 6e                	jb     30003061 <__x86.get_pc_thunk.cx+0xc99>
30002ff3:	63 70 79             	arpl   WORD PTR [eax+0x79],si
30002ff6:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30002ff9:	72 74                	jb     3000306f <__x86.get_pc_thunk.cx+0xca7>
30002ffb:	6f                   	outs   dx,DWORD PTR ds:[esi]
30002ffc:	75 6c                	jne    3000306a <__x86.get_pc_thunk.cx+0xca2>
30002ffe:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30003001:	72 6c                	jb     3000306f <__x86.get_pc_thunk.cx+0xca7>
30003003:	65                   	gs
30003004:	66                   	data16
30003005:	74 00                	je     30003007 <__x86.get_pc_thunk.cx+0xc3f>
30003007:	73 74                	jae    3000307d <__x86.get_pc_thunk.cx+0xcb5>
30003009:	72 74                	jb     3000307f <__x86.get_pc_thunk.cx+0xcb7>
3000300b:	6f                   	outs   dx,DWORD PTR ds:[esi]
3000300c:	6c                   	ins    BYTE PTR es:[edi],dx
3000300d:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
30003010:	72 74                	jb     30003086 <__x86.get_pc_thunk.cx+0xcbe>
30003012:	72 69                	jb     3000307d <__x86.get_pc_thunk.cx+0xcb5>
30003014:	6d                   	ins    DWORD PTR es:[edi],dx
30003015:	00 6c 6f 63          	add    BYTE PTR [edi+ebp*2+0x63],ch
30003019:	61                   	popa   
3000301a:	6c                   	ins    BYTE PTR es:[edi],dx
3000301b:	74 69                	je     30003086 <__x86.get_pc_thunk.cx+0xcbe>
3000301d:	6d                   	ins    DWORD PTR es:[edi],dx
3000301e:	65 00 6c 6f 63       	add    BYTE PTR gs:[edi+ebp*2+0x63],ch
30003023:	61                   	popa   
30003024:	6c                   	ins    BYTE PTR es:[edi],dx
30003025:	74 69                	je     30003090 <__x86.get_pc_thunk.cx+0xcc8>
30003027:	6d                   	ins    DWORD PTR es:[edi],dx
30003028:	65                   	gs
30003029:	5f                   	pop    edi
3000302a:	72 00                	jb     3000302c <__x86.get_pc_thunk.cx+0xc64>
3000302c:	6d                   	ins    DWORD PTR es:[edi],dx
3000302d:	6b 74 69 6d 65       	imul   esi,DWORD PTR [ecx+ebp*2+0x6d],0x65
	...

Disassembly of section .hash:

30003034 <.hash>:
30003034:	25 00 00 00 29       	and    eax,0x29000000
30003039:	00 00                	add    BYTE PTR [eax],al
3000303b:	00 13                	add    BYTE PTR [ebx],dl
3000303d:	00 00                	add    BYTE PTR [eax],al
3000303f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30003042:	00 00                	add    BYTE PTR [eax],al
30003044:	1b 00                	sbb    eax,DWORD PTR [eax]
30003046:	00 00                	add    BYTE PTR [eax],al
30003048:	1d 00 00 00 17       	sbb    eax,0x17000000
	...
30003061:	00 00                	add    BYTE PTR [eax],al
30003063:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
	...
30003072:	00 00                	add    BYTE PTR [eax],al
30003074:	15 00 00 00 0e       	adc    eax,0xe000000
30003079:	00 00                	add    BYTE PTR [eax],al
3000307b:	00 00                	add    BYTE PTR [eax],al
3000307d:	00 00                	add    BYTE PTR [eax],al
3000307f:	00 1f                	add    BYTE PTR [edi],bl
30003081:	00 00                	add    BYTE PTR [eax],al
30003083:	00 1e                	add    BYTE PTR [esi],bl
30003085:	00 00                	add    BYTE PTR [eax],al
30003087:	00 00                	add    BYTE PTR [eax],al
30003089:	00 00                	add    BYTE PTR [eax],al
3000308b:	00 03                	add    BYTE PTR [ebx],al
3000308d:	00 00                	add    BYTE PTR [eax],al
3000308f:	00 21                	add    BYTE PTR [ecx],ah
30003091:	00 00                	add    BYTE PTR [eax],al
30003093:	00 23                	add    BYTE PTR [ebx],ah
30003095:	00 00                	add    BYTE PTR [eax],al
30003097:	00 09                	add    BYTE PTR [ecx],cl
30003099:	00 00                	add    BYTE PTR [eax],al
3000309b:	00 27                	add    BYTE PTR [edi],ah
	...
300030a5:	00 00                	add    BYTE PTR [eax],al
300030a7:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
300030aa:	00 00                	add    BYTE PTR [eax],al
300030ac:	0f 00 00             	sldt   WORD PTR [eax]
300030af:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
300030b5:	00 00                	add    BYTE PTR [eax],al
300030b7:	00 28                	add    BYTE PTR [eax],ch
300030b9:	00 00                	add    BYTE PTR [eax],al
300030bb:	00 1a                	add    BYTE PTR [edx],bl
300030bd:	00 00                	add    BYTE PTR [eax],al
300030bf:	00 00                	add    BYTE PTR [eax],al
300030c1:	00 00                	add    BYTE PTR [eax],al
300030c3:	00 26                	add    BYTE PTR [esi],ah
300030c5:	00 00                	add    BYTE PTR [eax],al
300030c7:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
	...
300030de:	00 00                	add    BYTE PTR [eax],al
300030e0:	02 00                	add    al,BYTE PTR [eax]
300030e2:	00 00                	add    BYTE PTR [eax],al
300030e4:	04 00                	add    al,0x0
	...
300030fa:	00 00                	add    BYTE PTR [eax],al
300030fc:	05 00 00 00 00       	add    eax,0x0
30003101:	00 00                	add    BYTE PTR [eax],al
30003103:	00 0b                	add    BYTE PTR [ebx],cl
	...
3000311d:	00 00                	add    BYTE PTR [eax],al
3000311f:	00 10                	add    BYTE PTR [eax],dl
30003121:	00 00                	add    BYTE PTR [eax],al
30003123:	00 0a                	add    BYTE PTR [edx],cl
30003125:	00 00                	add    BYTE PTR [eax],al
30003127:	00 12                	add    BYTE PTR [edx],dl
30003129:	00 00                	add    BYTE PTR [eax],al
3000312b:	00 16                	add    BYTE PTR [esi],dl
3000312d:	00 00                	add    BYTE PTR [eax],al
3000312f:	00 00                	add    BYTE PTR [eax],al
30003131:	00 00                	add    BYTE PTR [eax],al
30003133:	00 11                	add    BYTE PTR [ecx],dl
30003135:	00 00                	add    BYTE PTR [eax],al
30003137:	00 18                	add    BYTE PTR [eax],bl
30003139:	00 00                	add    BYTE PTR [eax],al
3000313b:	00 07                	add    BYTE PTR [edi],al
3000313d:	00 00                	add    BYTE PTR [eax],al
3000313f:	00 06                	add    BYTE PTR [esi],al
30003141:	00 00                	add    BYTE PTR [eax],al
30003143:	00 00                	add    BYTE PTR [eax],al
30003145:	00 00                	add    BYTE PTR [eax],al
30003147:	00 08                	add    BYTE PTR [eax],cl
30003149:	00 00                	add    BYTE PTR [eax],al
3000314b:	00 0d 00 00 00 00    	add    BYTE PTR ds:0x0,cl
30003151:	00 00                	add    BYTE PTR [eax],al
30003153:	00 01                	add    BYTE PTR [ecx],al
30003155:	00 00                	add    BYTE PTR [eax],al
30003157:	00 00                	add    BYTE PTR [eax],al
30003159:	00 00                	add    BYTE PTR [eax],al
3000315b:	00 19                	add    BYTE PTR [ecx],bl
	...
30003165:	00 00                	add    BYTE PTR [eax],al
30003167:	00 22                	add    BYTE PTR [edx],ah
30003169:	00 00                	add    BYTE PTR [eax],al
3000316b:	00 00                	add    BYTE PTR [eax],al
3000316d:	00 00                	add    BYTE PTR [eax],al
3000316f:	00 20                	add    BYTE PTR [eax],ah
30003171:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

30003174 <.eh_frame>:
30003174:	14 00                	adc    al,0x0
30003176:	00 00                	add    BYTE PTR [eax],al
30003178:	00 00                	add    BYTE PTR [eax],al
3000317a:	00 00                	add    BYTE PTR [eax],al
3000317c:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
3000317f:	00 01                	add    BYTE PTR [ecx],al
30003181:	7c 08                	jl     3000318b <__x86.get_pc_thunk.cx+0xdc3>
30003183:	01 1b                	add    DWORD PTR [ebx],ebx
30003185:	0c 04                	or     al,0x4
30003187:	04 88                	add    al,0x88
30003189:	01 00                	add    DWORD PTR [eax],eax
3000318b:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
3000318e:	00 00                	add    BYTE PTR [eax],al
30003190:	1c 00                	sbb    al,0x0
30003192:	00 00                	add    BYTE PTR [eax],al
30003194:	dc f1                	fdivr  st(1),st
30003196:	ff                   	(bad)  
30003197:	ff 50 00             	call   DWORD PTR [eax+0x0]
3000319a:	00 00                	add    BYTE PTR [eax],al
3000319c:	00 0e                	add    BYTE PTR [esi],cl
3000319e:	08 46 0e             	or     BYTE PTR [esi+0xe],al
300031a1:	0c 4a                	or     al,0x4a
300031a3:	0f 0b                	ud2    
300031a5:	74 04                	je     300031ab <__x86.get_pc_thunk.cx+0xde3>
300031a7:	78 00                	js     300031a9 <__x86.get_pc_thunk.cx+0xde1>
300031a9:	3f                   	aas    
300031aa:	1a 3b                	sbb    bh,BYTE PTR [ebx]
300031ac:	2a 32                	sub    dh,BYTE PTR [edx]
300031ae:	24 22                	and    al,0x22
300031b0:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

300031b4 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
300031b4:	01 1b                	add    DWORD PTR [ebx],ebx
300031b6:	03 3b                	add    edi,DWORD PTR [ebx]
300031b8:	14 f2                	adc    al,0xf2
300031ba:	ff                   	(bad)  
300031bb:	ff 40 00             	inc    DWORD PTR [eax+0x0]
300031be:	00 00                	add    BYTE PTR [eax],al
300031c0:	4c                   	dec    esp
300031c1:	ce                   	into   
300031c2:	ff                   	(bad)  
300031c3:	ff 30                	push   DWORD PTR [eax]
300031c5:	f2 ff                	repnz (bad) 
300031c7:	ff 84 ce ff ff 50 f2 	inc    DWORD PTR [esi+ecx*8-0xdaf0001]
300031ce:	ff                   	(bad)  
300031cf:	ff                   	(bad)  
300031d0:	bc ce ff ff 84       	mov    esp,0x84ffffce
300031d5:	f2 ff                	repnz (bad) 
300031d7:	ff 11                	call   DWORD PTR [ecx]
300031d9:	cf                   	iret   
300031da:	ff                   	(bad)  
300031db:	ff ac f2 ff ff 68 cf 	jmp    FWORD PTR [edx+esi*8-0x30970001]
300031e2:	ff                   	(bad)  
300031e3:	ff d4                	call   esp
300031e5:	f2 ff                	repnz (bad) 
300031e7:	ff 00                	inc    DWORD PTR [eax]
300031e9:	d0 ff                	sar    bh,1
300031eb:	ff 10                	call   DWORD PTR [eax]
300031ed:	f3 ff                	repz (bad) 
300031ef:	ff 77 d0             	push   DWORD PTR [edi-0x30]
300031f2:	ff                   	(bad)  
300031f3:	ff 34 f3             	push   DWORD PTR [ebx+esi*8]
300031f6:	ff                   	(bad)  
300031f7:	ff 32                	push   DWORD PTR [edx]
300031f9:	d1 ff                	sar    edi,1
300031fb:	ff 58 f3             	call   FWORD PTR [eax-0xd]
300031fe:	ff                   	(bad)  
300031ff:	ff 90 d1 ff ff 78    	call   DWORD PTR [eax+0x78ffffd1]
30003205:	f3 ff                	repz (bad) 
30003207:	ff b6 d1 ff ff 9c    	push   DWORD PTR [esi-0x6300002f]
3000320d:	f3 ff                	repz (bad) 
3000320f:	ff                   	(bad)  
30003210:	f9                   	stc    
30003211:	d1 ff                	sar    edi,1
30003213:	ff c0                	inc    eax
30003215:	f3 ff                	repz (bad) 
30003217:	ff 28                	jmp    FWORD PTR [eax]
30003219:	d2 ff                	sar    bh,cl
3000321b:	ff e4                	jmp    esp
3000321d:	f3 ff                	repz (bad) 
3000321f:	ff e4                	jmp    esp
30003221:	d2 ff                	sar    bh,cl
30003223:	ff 08                	dec    DWORD PTR [eax]
30003225:	f4                   	hlt    
30003226:	ff                   	(bad)  
30003227:	ff 19                	call   FWORD PTR [ecx]
30003229:	d3 ff                	sar    edi,cl
3000322b:	ff 2c f4             	jmp    FWORD PTR [esp+esi*8]
3000322e:	ff                   	(bad)  
3000322f:	ff 4d d3             	dec    DWORD PTR [ebp-0x2d]
30003232:	ff                   	(bad)  
30003233:	ff 50 f4             	call   DWORD PTR [eax-0xc]
30003236:	ff                   	(bad)  
30003237:	ff                   	(bad)  
30003238:	7e d3                	jle    3000320d <__GNU_EH_FRAME_HDR+0x59>
3000323a:	ff                   	(bad)  
3000323b:	ff 74 f4 ff          	push   DWORD PTR [esp+esi*8-0x1]
3000323f:	ff a5 d3 ff ff 94    	jmp    DWORD PTR [ebp-0x6b00002d]
30003245:	f4                   	hlt    
30003246:	ff                   	(bad)  
30003247:	ff 44 d4 ff          	inc    DWORD PTR [esp+edx*8-0x1]
3000324b:	ff                   	(bad)  
3000324c:	b8 f4 ff ff 63       	mov    eax,0x63fffff4
30003251:	d4 ff                	aam    0xff
30003253:	ff dc                	call   <internal disassembler error>
30003255:	f4                   	hlt    
30003256:	ff                   	(bad)  
30003257:	ff 97 d4 ff ff fc    	call   DWORD PTR [edi-0x300002c]
3000325d:	f4                   	hlt    
3000325e:	ff                   	(bad)  
3000325f:	ff cb                	dec    ebx
30003261:	d4 ff                	aam    0xff
30003263:	ff 1c f5 ff ff 02 d5 	call   FWORD PTR [esi*8-0x2afd0001]
3000326a:	ff                   	(bad)  
3000326b:	ff 40 f5             	inc    DWORD PTR [eax-0xb]
3000326e:	ff                   	(bad)  
3000326f:	ff 50 d5             	call   DWORD PTR [eax-0x2b]
30003272:	ff                   	(bad)  
30003273:	ff 64 f5 ff          	jmp    DWORD PTR [ebp+esi*8-0x1]
30003277:	ff 6d d5             	jmp    FWORD PTR [ebp-0x2b]
3000327a:	ff                   	(bad)  
3000327b:	ff 84 f5 ff ff 96 d5 	inc    DWORD PTR [ebp+esi*8-0x2a690001]
30003282:	ff                   	(bad)  
30003283:	ff a4 f5 ff ff cc d5 	jmp    DWORD PTR [ebp+esi*8-0x2a330001]
3000328a:	ff                   	(bad)  
3000328b:	ff c8                	dec    eax
3000328d:	f5                   	cmc    
3000328e:	ff                   	(bad)  
3000328f:	ff e9                	jmp    <internal disassembler error>
30003291:	d5 ff                	aad    0xff
30003293:	ff e8                	jmp    <internal disassembler error>
30003295:	f5                   	cmc    
30003296:	ff                   	(bad)  
30003297:	ff 2b                	jmp    FWORD PTR [ebx]
30003299:	d6                   	(bad)  
3000329a:	ff                   	(bad)  
3000329b:	ff 0c f6             	dec    DWORD PTR [esi+esi*8]
3000329e:	ff                   	(bad)  
3000329f:	ff 4c d6 ff          	dec    DWORD PTR [esi+edx*8-0x1]
300032a3:	ff 2c f6             	jmp    FWORD PTR [esi+esi*8]
300032a6:	ff                   	(bad)  
300032a7:	ff a8 d6 ff ff 50    	jmp    FWORD PTR [eax+0x50ffffd6]
300032ad:	f6 ff                	idiv   bh
300032af:	ff 24 d7             	jmp    DWORD PTR [edi+edx*8]
300032b2:	ff                   	(bad)  
300032b3:	ff 70 f6             	push   DWORD PTR [eax-0xa]
300032b6:	ff                   	(bad)  
300032b7:	ff 07                	inc    DWORD PTR [edi]
300032b9:	d9 ff                	fcos   
300032bb:	ff 9c f6 ff ff 40 d9 	call   FWORD PTR [esi+esi*8-0x26bf0001]
300032c2:	ff                   	(bad)  
300032c3:	ff                   	(bad)  
300032c4:	bc f6 ff ff 68       	mov    esp,0x68fffff6
300032c9:	d9 ff                	fcos   
300032cb:	ff f4                	push   esp
300032cd:	f6 ff                	idiv   bh
300032cf:	ff 04 db             	inc    DWORD PTR [ebx+ebx*8]
300032d2:	ff                   	(bad)  
300032d3:	ff 14 f7             	call   DWORD PTR [edi+esi*8]
300032d6:	ff                   	(bad)  
300032d7:	ff cb                	dec    ebx
300032d9:	db ff                	(bad)  
300032db:	ff 34 f7             	push   DWORD PTR [edi+esi*8]
300032de:	ff                   	(bad)  
300032df:	ff 94 dc ff ff 54 f7 	call   DWORD PTR [esp+ebx*8-0x8ab0001]
300032e6:	ff                   	(bad)  
300032e7:	ff a4 dc ff ff 74 f7 	jmp    DWORD PTR [esp+ebx*8-0x88b0001]
300032ee:	ff                   	(bad)  
300032ef:	ff d0                	call   eax
300032f1:	dc ff                	fdiv   st(7),st
300032f3:	ff 98 f7 ff ff f6    	call   FWORD PTR [eax-0x9000009]
300032f9:	dc ff                	fdiv   st(7),st
300032fb:	ff                   	(bad)  
300032fc:	bc f7 ff ff 2d       	mov    esp,0x2dfffff7
30003301:	de ff                	fdivp  st(7),st
30003303:	ff e0                	jmp    eax
30003305:	f7 ff                	idiv   edi
30003307:	ff b1 de ff ff 04    	push   DWORD PTR [ecx+0x4ffffde]
3000330d:	f8                   	clc    
3000330e:	ff                   	(bad)  
3000330f:	ff 04 df             	inc    DWORD PTR [edi+ebx*8]
30003312:	ff                   	(bad)  
30003313:	ff 24 f8             	jmp    DWORD PTR [eax+edi*8]
30003316:	ff                   	(bad)  
30003317:	ff 42 df             	inc    DWORD PTR [edx-0x21]
3000331a:	ff                   	(bad)  
3000331b:	ff 48 f8             	dec    DWORD PTR [eax-0x8]
3000331e:	ff                   	(bad)  
3000331f:	ff b4 df ff ff 68 f8 	push   DWORD PTR [edi+ebx*8-0x7970001]
30003326:	ff                   	(bad)  
30003327:	ff 14 e0             	call   DWORD PTR [eax+eiz*8]
3000332a:	ff                   	(bad)  
3000332b:	ff 90 f8 ff ff 54    	call   DWORD PTR [eax+0x54fffff8]
30003331:	e0 ff                	loopne 30003332 <__GNU_EH_FRAME_HDR+0x17e>
30003333:	ff b0 f8 ff ff 9c    	push   DWORD PTR [eax-0x63000008]
30003339:	e0 ff                	loopne 3000333a <__GNU_EH_FRAME_HDR+0x186>
3000333b:	ff d0                	call   eax
3000333d:	f8                   	clc    
3000333e:	ff                   	(bad)  
3000333f:	ff cd                	dec    ebp
30003341:	e0 ff                	loopne 30003342 <__GNU_EH_FRAME_HDR+0x18e>
30003343:	ff f0                	push   eax
30003345:	f8                   	clc    
30003346:	ff                   	(bad)  
30003347:	ff 00                	inc    DWORD PTR [eax]
30003349:	e1 ff                	loope  3000334a <__GNU_EH_FRAME_HDR+0x196>
3000334b:	ff 10                	call   DWORD PTR [eax]
3000334d:	f9                   	stc    
3000334e:	ff                   	(bad)  
3000334f:	ff 68 e1             	jmp    FWORD PTR [eax-0x1f]
30003352:	ff                   	(bad)  
30003353:	ff 30                	push   DWORD PTR [eax]
30003355:	f9                   	stc    
30003356:	ff                   	(bad)  
30003357:	ff c8                	dec    eax
30003359:	e1 ff                	loope  3000335a <__GNU_EH_FRAME_HDR+0x1a6>
3000335b:	ff 50 f9             	call   DWORD PTR [eax-0x7]
3000335e:	ff                   	(bad)  
3000335f:	ff 48 e3             	dec    DWORD PTR [eax-0x1d]
30003362:	ff                   	(bad)  
30003363:	ff 80 f9 ff ff 68    	inc    DWORD PTR [eax+0x68fffff9]
30003369:	e3 ff                	jecxz  3000336a <__GNU_EH_FRAME_HDR+0x1b6>
3000336b:	ff a0 f9 ff ff 04    	jmp    DWORD PTR [eax+0x4fffff9]
30003371:	e5 ff                	in     eax,0xff
30003373:	ff d0                	call   eax
30003375:	f9                   	stc    
30003376:	ff                   	(bad)  
30003377:	ff 9c e5 ff ff f4 f9 	call   FWORD PTR [ebp+eiz*8-0x60b0001]
3000337e:	ff                   	(bad)  
3000337f:	ff c5                	inc    ebp
30003381:	e5 ff                	in     eax,0xff
30003383:	ff 14 fa             	call   DWORD PTR [edx+edi*8]
30003386:	ff                   	(bad)  
30003387:	ff de                	call   <internal disassembler error>
30003389:	e8 ff ff 3c fa       	call   2a3d338d <sysEnter_Vector+0x2a2a338d>
3000338e:	ff                   	(bad)  
3000338f:	ff 1d e9 ff ff 60    	call   FWORD PTR ds:0x60ffffe9
30003395:	fa                   	cli    
30003396:	ff                   	(bad)  
30003397:	ff 5b e9             	call   FWORD PTR [ebx-0x17]
3000339a:	ff                   	(bad)  
3000339b:	ff 84 fa ff ff b2 f1 	inc    DWORD PTR [edx+edi*8-0xe4d0001]
300033a2:	ff                   	(bad)  
300033a3:	ff 70 f2             	push   DWORD PTR [eax-0xe]
300033a6:	ff                   	(bad)  
300033a7:	ff 0c f2             	dec    DWORD PTR [edx+esi*8]
300033aa:	ff                   	(bad)  
300033ab:	ff                   	(bad)  
300033ac:	fc                   	cld    
300033ad:	f2 ff                	repnz (bad) 
300033af:	ff 10                	call   DWORD PTR [eax]
300033b1:	f2 ff                	repnz (bad) 
300033b3:	ff e0                	jmp    eax
300033b5:	f6 ff                	idiv   bh
300033b7:	ff 14 f2             	call   DWORD PTR [edx+esi*8]
300033ba:	ff                   	(bad)  
300033bb:	ff                   	.byte 0xff
300033bc:	b4 fa                	mov    ah,0xfa
300033be:	ff                   	(bad)  
300033bf:	ff                   	.byte 0xff

Disassembly of section .rodata:

300033c0 <_ytab-0x200>:
300033c0:	53                   	push   ebx
300033c1:	74 72                	je     30003435 <__GNU_EH_FRAME_HDR+0x281>
300033c3:	65                   	gs
300033c4:	61                   	popa   
300033c5:	6d                   	ins    DWORD PTR es:[edi],dx
300033c6:	20 25 75 20 6e 6f    	and    BYTE PTR ds:0x6f6e2075,ah
300033cc:	74 20                	je     300033ee <__GNU_EH_FRAME_HDR+0x23a>
300033ce:	69 6d 70 6c 65 6d 65 	imul   ebp,DWORD PTR [ebp+0x70],0x656d656c
300033d5:	6e                   	outs   dx,BYTE PTR ds:[esi]
300033d6:	74 65                	je     3000343d <__GNU_EH_FRAME_HDR+0x289>
300033d8:	64 0a 00             	or     al,BYTE PTR fs:[eax]
300033db:	00 2a                	add    BYTE PTR [edx],ch
300033dd:	2a 2a                	sub    ch,BYTE PTR [edx]
300033df:	6c                   	ins    BYTE PTR es:[edi],dx
300033e0:	69 62 63 5f 69 6e 69 	imul   esp,DWORD PTR [edx+0x63],0x696e695f
300033e7:	74 20                	je     30003409 <__GNU_EH_FRAME_HDR+0x255>
300033e9:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
300033ec:	6c                   	ins    BYTE PTR es:[edi],dx
300033ed:	65 64 0a 2a          	gs or  ch,BYTE PTR fs:gs:[edx]
300033f1:	2a 2a                	sub    ch,BYTE PTR [edx]
300033f3:	00 2a                	add    BYTE PTR [edx],ch
300033f5:	2a 2a                	sub    ch,BYTE PTR [edx]
300033f7:	6c                   	ins    BYTE PTR es:[edi],dx
300033f8:	69 62 63 5f 69 6e 69 	imul   esp,DWORD PTR [edx+0x63],0x696e695f
300033ff:	74 20                	je     30003421 <__GNU_EH_FRAME_HDR+0x26d>
30003401:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
30003404:	70 6c                	jo     30003472 <__GNU_EH_FRAME_HDR+0x2be>
30003406:	65                   	gs
30003407:	74 65                	je     3000346e <__GNU_EH_FRAME_HDR+0x2ba>
30003409:	64 0a 00             	or     al,BYTE PTR fs:[eax]
3000340c:	6c                   	ins    BYTE PTR es:[edi],dx
3000340d:	69 62 63 5f 69 6e 69 	imul   esp,DWORD PTR [edx+0x63],0x696e695f
30003414:	74 20                	je     30003436 <__GNU_EH_FRAME_HDR+0x282>
30003416:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
30003419:	6c                   	ins    BYTE PTR es:[edi],dx
3000341a:	65 64 20 70 72       	gs and BYTE PTR fs:gs:[eax+0x72],dh
3000341f:	65                   	gs
30003420:	76 69                	jbe    3000348b <__GNU_EH_FRAME_HDR+0x2d7>
30003422:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003423:	75 73                	jne    30003498 <__GNU_EH_FRAME_HDR+0x2e4>
30003425:	6c                   	ins    BYTE PTR es:[edi],dx
30003426:	79 2c                	jns    30003454 <__GNU_EH_FRAME_HDR+0x2a0>
30003428:	20 65 78             	and    BYTE PTR [ebp+0x78],ah
3000342b:	69 74 69 6e 67 0a 00 	imul   esi,DWORD PTR [ecx+ebp*2+0x6e],0xa67
30003432:	00 
30003433:	00 68 65             	add    BYTE PTR [eax+0x65],ch
30003436:	61                   	popa   
30003437:	70 42                	jo     3000347b <__GNU_EH_FRAME_HDR+0x2c7>
30003439:	61                   	popa   
3000343a:	73 65                	jae    300034a1 <__GNU_EH_FRAME_HDR+0x2ed>
3000343c:	20 3d 20 30 78 25    	and    BYTE PTR ds:0x25783020,bh
30003442:	30 38                	xor    BYTE PTR [eax],bh
30003444:	58                   	pop    eax
30003445:	20 62 65             	and    BYTE PTR [edx+0x65],ah
30003448:	66 6f                	outs   dx,WORD PTR ds:[esi]
3000344a:	72 65                	jb     300034b1 <__GNU_EH_FRAME_HDR+0x2fd>
3000344c:	0a 00                	or     al,BYTE PTR [eax]
3000344e:	6d                   	ins    DWORD PTR es:[edi],dx
3000344f:	61                   	popa   
30003450:	6c                   	ins    BYTE PTR es:[edi],dx
30003451:	6c                   	ins    BYTE PTR es:[edi],dx
30003452:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003453:	63 28                	arpl   WORD PTR [eax],bp
30003455:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30003458:	30 38                	xor    BYTE PTR [eax],bh
3000345a:	58                   	pop    eax
3000345b:	29 0a                	sub    DWORD PTR [edx],ecx
3000345d:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30003461:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30003464:	61                   	popa   
30003465:	6c                   	ins    BYTE PTR es:[edi],dx
30003466:	6c                   	ins    BYTE PTR es:[edi],dx
30003467:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003468:	63 3a                	arpl   WORD PTR [edx],di
3000346a:	20 6e 65             	and    BYTE PTR [esi+0x65],ch
3000346d:	65                   	gs
3000346e:	64                   	fs
3000346f:	65                   	gs
30003470:	64                   	fs
30003471:	3d 30 78 25 30       	cmp    eax,0x30257830
30003476:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30003479:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
3000347d:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
30003480:	61                   	popa   
30003481:	6c                   	ins    BYTE PTR es:[edi],dx
30003482:	6c                   	ins    BYTE PTR es:[edi],dx
30003483:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003484:	63 3a                	arpl   WORD PTR [edx],di
30003486:	20 68 65             	and    BYTE PTR [eax+0x65],ch
30003489:	61                   	popa   
3000348a:	45                   	inc    ebp
3000348b:	6e                   	outs   dx,BYTE PTR ds:[esi]
3000348c:	64                   	fs
3000348d:	3d 30 78 25 30       	cmp    eax,0x30257830
30003492:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30003495:	00 00                	add    BYTE PTR [eax],al
30003497:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
3000349b:	63 5f 6d             	arpl   WORD PTR [edi+0x6d],bx
3000349e:	61                   	popa   
3000349f:	6c                   	ins    BYTE PTR es:[edi],dx
300034a0:	6c                   	ins    BYTE PTR es:[edi],dx
300034a1:	6f                   	outs   dx,DWORD PTR ds:[esi]
300034a2:	63 3a                	arpl   WORD PTR [edx],di
300034a4:	20 52 65             	and    BYTE PTR [edx+0x65],dl
300034a7:	71 20                	jno    300034c9 <__GNU_EH_FRAME_HDR+0x315>
300034a9:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
300034ac:	30 38                	xor    BYTE PTR [eax],bh
300034ae:	58                   	pop    eax
300034af:	20 62 79             	and    BYTE PTR [edx+0x79],ah
300034b2:	74 65                	je     30003519 <__GNU_EH_FRAME_HDR+0x365>
300034b4:	73 2c                	jae    300034e2 <__GNU_EH_FRAME_HDR+0x32e>
300034b6:	20 72 65             	and    BYTE PTR [edx+0x65],dh
300034b9:	74 20                	je     300034db <__GNU_EH_FRAME_HDR+0x327>
300034bb:	77 61                	ja     3000351e <__GNU_EH_FRAME_HDR+0x36a>
300034bd:	73 20                	jae    300034df <__GNU_EH_FRAME_HDR+0x32b>
300034bf:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
300034c2:	30 38                	xor    BYTE PTR [eax],bh
300034c4:	58                   	pop    eax
300034c5:	2c 20                	sub    al,0x20
300034c7:	68 65 61 70 45       	push   0x45706165
300034cc:	6e                   	outs   dx,BYTE PTR ds:[esi]
300034cd:	64                   	fs
300034ce:	3d 30 78 25 30       	cmp    eax,0x30257830
300034d3:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
300034d6:	00 00                	add    BYTE PTR [eax],al
300034d8:	6c                   	ins    BYTE PTR es:[edi],dx
300034d9:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
300034e0:	6c                   	ins    BYTE PTR es:[edi],dx
300034e1:	6f                   	outs   dx,DWORD PTR ds:[esi]
300034e2:	63 3a                	arpl   WORD PTR [edx],di
300034e4:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
300034e7:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x657a696c
300034ee:	65 
300034ef:	64 20 68 65          	and    BYTE PTR fs:[eax+0x65],ch
300034f3:	61                   	popa   
300034f4:	70 43                	jo     30003539 <__GNU_EH_FRAME_HDR+0x385>
300034f6:	75 72                	jne    3000356a <__GNU_EH_FRAME_HDR+0x3b6>
300034f8:	72 20                	jb     3000351a <__GNU_EH_FRAME_HDR+0x366>
300034fa:	61                   	popa   
300034fb:	6e                   	outs   dx,BYTE PTR ds:[esi]
300034fc:	64 20 68 65          	and    BYTE PTR fs:[eax+0x65],ch
30003500:	61                   	popa   
30003501:	70 42                	jo     30003545 <__GNU_EH_FRAME_HDR+0x391>
30003503:	61                   	popa   
30003504:	73 65                	jae    3000356b <__GNU_EH_FRAME_HDR+0x3b7>
30003506:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
3000350a:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
3000350d:	30 38                	xor    BYTE PTR [eax],bh
3000350f:	58                   	pop    eax
30003510:	0a 00                	or     al,BYTE PTR [eax]
30003512:	00 00                	add    BYTE PTR [eax],al
30003514:	6c                   	ins    BYTE PTR es:[edi],dx
30003515:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
3000351c:	6c                   	ins    BYTE PTR es:[edi],dx
3000351d:	6f                   	outs   dx,DWORD PTR ds:[esi]
3000351e:	63 3a                	arpl   WORD PTR [edx],di
30003520:	63 72 65             	arpl   WORD PTR [edx+0x65],si
30003523:	61                   	popa   
30003524:	74 69                	je     3000358f <__GNU_EH_FRAME_HDR+0x3db>
30003526:	6e                   	outs   dx,BYTE PTR ds:[esi]
30003527:	67 20 68 65          	and    BYTE PTR [bx+si+0x65],ch
3000352b:	61                   	popa   
3000352c:	70 20                	jo     3000354e <__GNU_EH_FRAME_HDR+0x39a>
3000352e:	72 65                	jb     30003595 <__GNU_EH_FRAME_HDR+0x3e1>
30003530:	63 20                	arpl   WORD PTR [eax],sp
30003532:	40                   	inc    eax
30003533:	20 30                	and    BYTE PTR [eax],dh
30003535:	78 25                	js     3000355c <__GNU_EH_FRAME_HDR+0x3a8>
30003537:	30 38                	xor    BYTE PTR [eax],bh
30003539:	58                   	pop    eax
3000353a:	0a 00                	or     al,BYTE PTR [eax]
3000353c:	6c                   	ins    BYTE PTR es:[edi],dx
3000353d:	69 62 63 5f 6d 61 6c 	imul   esp,DWORD PTR [edx+0x63],0x6c616d5f
30003544:	6c                   	ins    BYTE PTR es:[edi],dx
30003545:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003546:	63 3a                	arpl   WORD PTR [edx],di
30003548:	20 68 65             	and    BYTE PTR [eax+0x65],ch
3000354b:	61                   	popa   
3000354c:	70 43                	jo     30003591 <__GNU_EH_FRAME_HDR+0x3dd>
3000354e:	75 72                	jne    300035c2 <_ytab+0x2>
30003550:	72 3d                	jb     3000358f <__GNU_EH_FRAME_HDR+0x3db>
30003552:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
30003555:	30 38                	xor    BYTE PTR [eax],bh
30003557:	58                   	pop    eax
30003558:	2c 20                	sub    al,0x20
3000355a:	73 69                	jae    300035c5 <_ytab+0x5>
3000355c:	7a 65                	jp     300035c3 <_ytab+0x3>
3000355e:	6f                   	outs   dx,DWORD PTR ds:[esi]
3000355f:	66                   	data16
30003560:	28 68 65             	sub    BYTE PTR [eax+0x65],ch
30003563:	61                   	popa   
30003564:	70 72                	jo     300035d8 <_ytab+0x18>
30003566:	65 63 5f 74          	arpl   WORD PTR gs:[edi+0x74],bx
3000356a:	29 3d 30 78 25 30    	sub    DWORD PTR ds:0x30257830,edi
30003570:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
30003573:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
30003576:	6c                   	ins    BYTE PTR es:[edi],dx
30003577:	6c                   	ins    BYTE PTR es:[edi],dx
30003578:	6f                   	outs   dx,DWORD PTR ds:[esi]
30003579:	63 3a                	arpl   WORD PTR [edx],di
3000357b:	20 72 65             	and    BYTE PTR [edx+0x65],dh
3000357e:	74 75                	je     300035f5 <_ytab+0x35>
30003580:	72 6e                	jb     300035f0 <_ytab+0x30>
30003582:	69 6e 67 20 30 78 25 	imul   ebp,DWORD PTR [esi+0x67],0x25783020
30003589:	30 38                	xor    BYTE PTR [eax],bh
3000358b:	58                   	pop    eax
3000358c:	0a 00                	or     al,BYTE PTR [eax]
	...
3000359e:	00 00                	add    BYTE PTR [eax],al
300035a0:	47                   	inc    edi
300035a1:	4d                   	dec    ebp
300035a2:	54                   	push   esp
	...

300035c0 <_ytab>:
300035c0:	1f                   	pop    ds
300035c1:	00 00                	add    BYTE PTR [eax],al
300035c3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
300035c6:	00 00                	add    BYTE PTR [eax],al
300035c8:	1f                   	pop    ds
300035c9:	00 00                	add    BYTE PTR [eax],al
300035cb:	00 1e                	add    BYTE PTR [esi],bl
300035cd:	00 00                	add    BYTE PTR [eax],al
300035cf:	00 1f                	add    BYTE PTR [edi],bl
300035d1:	00 00                	add    BYTE PTR [eax],al
300035d3:	00 1e                	add    BYTE PTR [esi],bl
300035d5:	00 00                	add    BYTE PTR [eax],al
300035d7:	00 1f                	add    BYTE PTR [edi],bl
300035d9:	00 00                	add    BYTE PTR [eax],al
300035db:	00 1f                	add    BYTE PTR [edi],bl
300035dd:	00 00                	add    BYTE PTR [eax],al
300035df:	00 1e                	add    BYTE PTR [esi],bl
300035e1:	00 00                	add    BYTE PTR [eax],al
300035e3:	00 1f                	add    BYTE PTR [edi],bl
300035e5:	00 00                	add    BYTE PTR [eax],al
300035e7:	00 1e                	add    BYTE PTR [esi],bl
300035e9:	00 00                	add    BYTE PTR [eax],al
300035eb:	00 1f                	add    BYTE PTR [edi],bl
300035ed:	00 00                	add    BYTE PTR [eax],al
300035ef:	00 1f                	add    BYTE PTR [edi],bl
300035f1:	00 00                	add    BYTE PTR [eax],al
300035f3:	00 1d 00 00 00 1f    	add    BYTE PTR ds:0x1f000000,bl
300035f9:	00 00                	add    BYTE PTR [eax],al
300035fb:	00 1e                	add    BYTE PTR [esi],bl
300035fd:	00 00                	add    BYTE PTR [eax],al
300035ff:	00 1f                	add    BYTE PTR [edi],bl
30003601:	00 00                	add    BYTE PTR [eax],al
30003603:	00 1e                	add    BYTE PTR [esi],bl
30003605:	00 00                	add    BYTE PTR [eax],al
30003607:	00 1f                	add    BYTE PTR [edi],bl
30003609:	00 00                	add    BYTE PTR [eax],al
3000360b:	00 1f                	add    BYTE PTR [edi],bl
3000360d:	00 00                	add    BYTE PTR [eax],al
3000360f:	00 1e                	add    BYTE PTR [esi],bl
30003611:	00 00                	add    BYTE PTR [eax],al
30003613:	00 1f                	add    BYTE PTR [edi],bl
30003615:	00 00                	add    BYTE PTR [eax],al
30003617:	00 1e                	add    BYTE PTR [esi],bl
30003619:	00 00                	add    BYTE PTR [eax],al
3000361b:	00 1f                	add    BYTE PTR [edi],bl
3000361d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .rel.dyn:

30003620 <.rel.dyn>:
30003620:	00 38                	add    BYTE PTR [eax],bh
30003622:	00 30                	add    BYTE PTR [eax],dh
30003624:	08 00                	or     BYTE PTR [eax],al
30003626:	00 00                	add    BYTE PTR [eax],al
30003628:	04 38                	add    al,0x38
3000362a:	00 30                	add    BYTE PTR [eax],dh
3000362c:	08 00                	or     BYTE PTR [eax],al
3000362e:	00 00                	add    BYTE PTR [eax],al
30003630:	08 38                	or     BYTE PTR [eax],bh
30003632:	00 30                	add    BYTE PTR [eax],dh
30003634:	08 00                	or     BYTE PTR [eax],al
30003636:	00 00                	add    BYTE PTR [eax],al
30003638:	0c 38                	or     al,0x38
3000363a:	00 30                	add    BYTE PTR [eax],dh
3000363c:	08 00                	or     BYTE PTR [eax],al
3000363e:	00 00                	add    BYTE PTR [eax],al
30003640:	10 38                	adc    BYTE PTR [eax],bh
30003642:	00 30                	add    BYTE PTR [eax],dh
30003644:	08 00                	or     BYTE PTR [eax],al
30003646:	00 00                	add    BYTE PTR [eax],al
30003648:	14 38                	adc    al,0x38
3000364a:	00 30                	add    BYTE PTR [eax],dh
3000364c:	08 00                	or     BYTE PTR [eax],al
3000364e:	00 00                	add    BYTE PTR [eax],al
30003650:	38 38                	cmp    BYTE PTR [eax],bh
30003652:	00 30                	add    BYTE PTR [eax],dh
30003654:	08 00                	or     BYTE PTR [eax],al
30003656:	00 00                	add    BYTE PTR [eax],al
30003658:	3c 38                	cmp    al,0x38
3000365a:	00 30                	add    BYTE PTR [eax],dh
3000365c:	08 00                	or     BYTE PTR [eax],al
3000365e:	00 00                	add    BYTE PTR [eax],al
30003660:	40                   	inc    eax
30003661:	38 00                	cmp    BYTE PTR [eax],al
30003663:	30 08                	xor    BYTE PTR [eax],cl
30003665:	00 00                	add    BYTE PTR [eax],al
30003667:	00 62 03             	add    BYTE PTR [edx+0x3],ah
3000366a:	00 30                	add    BYTE PTR [eax],dh
3000366c:	02 16                	add    dl,BYTE PTR [esi]
3000366e:	00 00                	add    BYTE PTR [eax],al
30003670:	a2 03 00 30 02       	mov    ds:0x2300003,al
30003675:	16                   	push   ss
30003676:	00 00                	add    BYTE PTR [eax],al
30003678:	cb                   	retf   
30003679:	03 00                	add    eax,DWORD PTR [eax]
3000367b:	30 02                	xor    BYTE PTR [edx],al
3000367d:	16                   	push   ss
3000367e:	00 00                	add    BYTE PTR [eax],al
30003680:	28 04 00             	sub    BYTE PTR [eax+eax*1],al
30003683:	30 02                	xor    BYTE PTR [edx],al
30003685:	16                   	push   ss
30003686:	00 00                	add    BYTE PTR [eax],al
30003688:	8b 04 00             	mov    eax,DWORD PTR [eax+eax*1]
3000368b:	30 02                	xor    BYTE PTR [edx],al
3000368d:	16                   	push   ss
3000368e:	00 00                	add    BYTE PTR [eax],al
30003690:	bd 04 00 30 02       	mov    ebp,0x2300004
30003695:	16                   	push   ss
30003696:	00 00                	add    BYTE PTR [eax],al
30003698:	f1                   	icebp  
30003699:	04 00                	add    al,0x0
3000369b:	30 02                	xor    BYTE PTR [edx],al
3000369d:	16                   	push   ss
3000369e:	00 00                	add    BYTE PTR [eax],al
300036a0:	22 05 00 30 02 16    	and    al,BYTE PTR ds:0x16023000
300036a6:	00 00                	add    BYTE PTR [eax],al
300036a8:	4d                   	dec    ebp
300036a9:	05 00 30 02 16       	add    eax,0x16023000
300036ae:	00 00                	add    BYTE PTR [eax],al
300036b0:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
300036b1:	06                   	push   es
300036b2:	00 30                	add    BYTE PTR [eax],dh
300036b4:	02 16                	add    dl,BYTE PTR [esi]
300036b6:	00 00                	add    BYTE PTR [eax],al
300036b8:	cd 06                	int    0x6
300036ba:	00 30                	add    BYTE PTR [eax],dh
300036bc:	02 16                	add    dl,BYTE PTR [esi]
300036be:	00 00                	add    BYTE PTR [eax],al
300036c0:	f5                   	cmc    
300036c1:	06                   	push   es
300036c2:	00 30                	add    BYTE PTR [eax],dh
300036c4:	02 16                	add    dl,BYTE PTR [esi]
300036c6:	00 00                	add    BYTE PTR [eax],al
300036c8:	49                   	dec    ecx
300036c9:	09 00                	or     DWORD PTR [eax],eax
300036cb:	30 02                	xor    BYTE PTR [edx],al
300036cd:	16                   	push   ss
300036ce:	00 00                	add    BYTE PTR [eax],al
300036d0:	12 0b                	adc    cl,BYTE PTR [ebx]
300036d2:	00 30                	add    BYTE PTR [eax],dh
300036d4:	02 16                	add    dl,BYTE PTR [esi]
300036d6:	00 00                	add    BYTE PTR [eax],al
300036d8:	6d                   	ins    DWORD PTR es:[edi],dx
300036d9:	17                   	pop    ss
300036da:	00 30                	add    BYTE PTR [eax],dh
300036dc:	02 16                	add    dl,BYTE PTR [esi]
300036de:	00 00                	add    BYTE PTR [eax],al
300036e0:	34 38                	xor    al,0x38
300036e2:	00 30                	add    BYTE PTR [eax],dh
300036e4:	01 0f                	add    DWORD PTR [edi],ecx
300036e6:	00 00                	add    BYTE PTR [eax],al
300036e8:	24 38                	and    al,0x38
300036ea:	00 30                	add    BYTE PTR [eax],dh
300036ec:	07                   	pop    es
300036ed:	01 00                	add    DWORD PTR [eax],eax
300036ef:	00 28                	add    BYTE PTR [eax],ch
300036f1:	38 00                	cmp    BYTE PTR [eax],al
300036f3:	30 07                	xor    BYTE PTR [edi],al
300036f5:	05 00 00 2c 38       	add    eax,0x382c0000
300036fa:	00 30                	add    BYTE PTR [eax],dh
300036fc:	07                   	pop    es
300036fd:	0d 00 00 30 38       	or     eax,0x38300000
30003702:	00 30                	add    BYTE PTR [eax],dh
30003704:	07                   	pop    es
30003705:	25                   	.byte 0x25
	...

Disassembly of section .data:

30003720 <console_node>:
30003720:	01 00                	add    DWORD PTR [eax],eax
	...

30003744 <_daylight>:
30003744:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

30003748 <_DYNAMIC>:
30003748:	19 00                	sbb    DWORD PTR [eax],eax
3000374a:	00 00                	add    BYTE PTR [eax],al
3000374c:	34 38                	xor    al,0x38
3000374e:	00 30                	add    BYTE PTR [eax],dh
30003750:	1b 00                	sbb    eax,DWORD PTR [eax]
30003752:	00 00                	add    BYTE PTR [eax],al
30003754:	04 00                	add    al,0x0
30003756:	00 00                	add    BYTE PTR [eax],al
30003758:	1a 00                	sbb    al,BYTE PTR [eax]
3000375a:	00 00                	add    BYTE PTR [eax],al
3000375c:	38 38                	cmp    BYTE PTR [eax],bh
3000375e:	00 30                	add    BYTE PTR [eax],dh
30003760:	1c 00                	sbb    al,0x0
30003762:	00 00                	add    BYTE PTR [eax],al
30003764:	04 00                	add    al,0x0
30003766:	00 00                	add    BYTE PTR [eax],al
30003768:	04 00                	add    al,0x0
3000376a:	00 00                	add    BYTE PTR [eax],al
3000376c:	34 30                	xor    al,0x30
3000376e:	00 30                	add    BYTE PTR [eax],dh
30003770:	05 00 00 00 0c       	add    eax,0xc000000
30003775:	2f                   	das    
30003776:	00 30                	add    BYTE PTR [eax],dh
30003778:	06                   	push   es
30003779:	00 00                	add    BYTE PTR [eax],al
3000377b:	00 7c 2c 00          	add    BYTE PTR [esp+ebp*1+0x0],bh
3000377f:	30 0a                	xor    BYTE PTR [edx],cl
30003781:	00 00                	add    BYTE PTR [eax],al
30003783:	00 27                	add    BYTE PTR [edi],ah
30003785:	01 00                	add    DWORD PTR [eax],eax
30003787:	00 0b                	add    BYTE PTR [ebx],cl
30003789:	00 00                	add    BYTE PTR [eax],al
3000378b:	00 10                	add    BYTE PTR [eax],dl
3000378d:	00 00                	add    BYTE PTR [eax],al
3000378f:	00 03                	add    BYTE PTR [ebx],al
30003791:	00 00                	add    BYTE PTR [eax],al
30003793:	00 18                	add    BYTE PTR [eax],bl
30003795:	38 00                	cmp    BYTE PTR [eax],al
30003797:	30 02                	xor    BYTE PTR [edx],al
30003799:	00 00                	add    BYTE PTR [eax],al
3000379b:	00 20                	add    BYTE PTR [eax],ah
3000379d:	00 00                	add    BYTE PTR [eax],al
3000379f:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
300037a2:	00 00                	add    BYTE PTR [eax],al
300037a4:	11 00                	adc    DWORD PTR [eax],eax
300037a6:	00 00                	add    BYTE PTR [eax],al
300037a8:	17                   	pop    ss
300037a9:	00 00                	add    BYTE PTR [eax],al
300037ab:	00 e8                	add    al,ch
300037ad:	36 00 30             	add    BYTE PTR ss:[eax],dh
300037b0:	11 00                	adc    DWORD PTR [eax],eax
300037b2:	00 00                	add    BYTE PTR [eax],al
300037b4:	20 36                	and    BYTE PTR [esi],dh
300037b6:	00 30                	add    BYTE PTR [eax],dh
300037b8:	12 00                	adc    al,BYTE PTR [eax]
300037ba:	00 00                	add    BYTE PTR [eax],al
300037bc:	c8 00 00 00          	enter  0x0,0x0
300037c0:	13 00                	adc    eax,DWORD PTR [eax]
300037c2:	00 00                	add    BYTE PTR [eax],al
300037c4:	08 00                	or     BYTE PTR [eax],al
300037c6:	00 00                	add    BYTE PTR [eax],al
300037c8:	16                   	push   ss
300037c9:	00 00                	add    BYTE PTR [eax],al
300037cb:	00 00                	add    BYTE PTR [eax],al
300037cd:	00 00                	add    BYTE PTR [eax],al
300037cf:	00 fa                	add    dl,bh
300037d1:	ff                   	(bad)  
300037d2:	ff 6f 09             	jmp    FWORD PTR [edi+0x9]
	...

Disassembly of section .got:

30003800 <.got>:
30003800:	5c                   	pop    esp
30003801:	38 00                	cmp    BYTE PTR [eax],al
30003803:	30 64 38 00          	xor    BYTE PTR [eax+edi*1+0x0],ah
30003807:	30 44 38 00          	xor    BYTE PTR [eax+edi*1+0x0],al
3000380b:	30 48 38             	xor    BYTE PTR [eax+0x38],cl
3000380e:	00 30                	add    BYTE PTR [eax],dh
30003810:	4c                   	dec    esp
30003811:	38 00                	cmp    BYTE PTR [eax],al
30003813:	30 50 38             	xor    BYTE PTR [eax+0x38],dl
30003816:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .got.plt:

30003818 <_GLOBAL_OFFSET_TABLE_>:
30003818:	48                   	dec    eax
30003819:	37                   	aaa    
3000381a:	00 30                	add    BYTE PTR [eax],dh
	...
30003824:	86 23                	xchg   BYTE PTR [ebx],ah
30003826:	00 30                	add    BYTE PTR [eax],dh
30003828:	96                   	xchg   esi,eax
30003829:	23 00                	and    eax,DWORD PTR [eax]
3000382b:	30 a6 23 00 30 b6    	xor    BYTE PTR [esi-0x49cfffdd],ah
30003831:	23 00                	and    eax,DWORD PTR [eax]
30003833:	30                   	.byte 0x30

Disassembly of section .init_array:

30003834 <.init_array>:
30003834:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .fini_array:

30003838 <.fini_array>:
30003838:	f8                   	clc    
30003839:	05                   	.byte 0x5
3000383a:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .data.rel.local:

3000383c <_tzname>:
3000383c:	a0 35 00 30 a0       	mov    al,ds:0xa0300035
30003841:	35                   	.byte 0x35
30003842:	00 30                	add    BYTE PTR [eax],dh

Disassembly of section .bss:

30003844 <heapEnd>:
30003844:	00 00                	add    BYTE PTR [eax],al
	...

30003848 <heapBase>:
30003848:	00 00                	add    BYTE PTR [eax],al
	...

3000384c <heapCurr>:
3000384c:	00 00                	add    BYTE PTR [eax],al
	...

30003850 <libcTZ>:
30003850:	00 00                	add    BYTE PTR [eax],al
	...

30003854 <lasts.1241>:
30003854:	00 00                	add    BYTE PTR [eax],al
	...

30003858 <libcInitialized>:
30003858:	00 00                	add    BYTE PTR [eax],al
	...

3000385c <fops>:
	...

30003864 <console_file>:
	...

30003874 <_dstbias>:
30003874:	00 00                	add    BYTE PTR [eax],al
	...

30003878 <ticksToWait>:
30003878:	00 00                	add    BYTE PTR [eax],al
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
     11c:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
     122:	30 09                	xor    BYTE PTR [ecx],cl
     124:	aa                   	stos   BYTE PTR es:[edi],al
     125:	00 00                	add    BYTE PTR [eax],al
     127:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     12a:	56                   	push   esi
     12b:	00 00                	add    BYTE PTR [eax],al
     12d:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
     133:	30 09                	xor    BYTE PTR [ecx],cl
     135:	56                   	push   esi
     136:	01 00                	add    DWORD PTR [eax],eax
     138:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     13f:	05 03 44 38 00       	add    eax,0x384403
     144:	30 09                	xor    BYTE PTR [ecx],cl
     146:	48                   	dec    eax
     147:	00 00                	add    BYTE PTR [eax],al
     149:	00 05 37 84 00 00    	add    BYTE PTR ds:0x8437,al
     14f:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
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
     2b2:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
     2b8:	30 09                	xor    BYTE PTR [ecx],cl
     2ba:	aa                   	stos   BYTE PTR es:[edi],al
     2bb:	00 00                	add    BYTE PTR [eax],al
     2bd:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     2c0:	56                   	push   esi
     2c1:	00 00                	add    BYTE PTR [eax],al
     2c3:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
     2c9:	30 09                	xor    BYTE PTR [ecx],cl
     2cb:	56                   	push   esi
     2cc:	01 00                	add    DWORD PTR [eax],eax
     2ce:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     2d5:	05 03 44 38 00       	add    eax,0x384403
     2da:	30 09                	xor    BYTE PTR [ecx],cl
     2dc:	48                   	dec    eax
     2dd:	00 00                	add    BYTE PTR [eax],al
     2df:	00 05 37 84 00 00    	add    BYTE PTR ds:0x8437,al
     2e5:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
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
     3cd:	00 05 03 54 38 00    	add    BYTE PTR ds:0x385403,al
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
     3eb:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
     3f1:	30 0b                	xor    BYTE PTR [ebx],cl
     3f3:	aa                   	stos   BYTE PTR es:[edi],al
     3f4:	00 00                	add    BYTE PTR [eax],al
     3f6:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     3f9:	56                   	push   esi
     3fa:	00 00                	add    BYTE PTR [eax],al
     3fc:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
     402:	30 0b                	xor    BYTE PTR [ebx],cl
     404:	56                   	push   esi
     405:	01 00                	add    DWORD PTR [eax],eax
     407:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     40e:	05 03 44 38 00       	add    eax,0x384403
     413:	30 0b                	xor    BYTE PTR [ebx],cl
     415:	48                   	dec    eax
     416:	00 00                	add    BYTE PTR [eax],al
     418:	00 05 37 84 00 00    	add    BYTE PTR ds:0x8437,al
     41e:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
     424:	30 00                	xor    BYTE PTR [eax],al
     426:	d5 01                	aad    0x1
     428:	00 00                	add    BYTE PTR [eax],al
     42a:	04 00                	add    al,0x0
     42c:	b7 01                	mov    bh,0x1
     42e:	00 00                	add    BYTE PTR [eax],al
     430:	04 01                	add    al,0x1
     432:	ef                   	out    dx,eax
     433:	00 00                	add    BYTE PTR [eax],al
     435:	00 0c e8             	add    BYTE PTR [eax+ebp*8],cl
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
     4ca:	01 02                	add    DWORD PTR [edx],eax
     4cc:	00 00                	add    BYTE PTR [eax],al
     4ce:	01 0a                	add    DWORD PTR [edx],ecx
     4d0:	b4 01                	mov    ah,0x1
     4d2:	00 30                	add    BYTE PTR [eax],dh
     4d4:	77 00                	ja     4d6 <sysEnter_Vector-0x12fb2a>
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
     518:	f9                   	stc    
     519:	01 00                	add    DWORD PTR [eax],eax
     51b:	00 01                	add    BYTE PTR [ecx],al
     51d:	0f 3a 00             	(bad)  
     520:	00 00                	add    BYTE PTR [eax],al
     522:	0b 00                	or     eax,DWORD PTR [eax]
     524:	00 00                	add    BYTE PTR [eax],al
     526:	06                   	push   es
     527:	e2 01                	loop   52a <sysEnter_Vector-0x12fad6>
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
     55c:	02 91 6c 0c 0a 02    	add    dl,BYTE PTR [ecx+0x20a0c6c]
     562:	00 00                	add    BYTE PTR [eax],al
     564:	01 18                	add    DWORD PTR [eax],ebx
     566:	3a 00                	cmp    al,BYTE PTR [eax]
     568:	00 00                	add    BYTE PTR [eax],al
     56a:	02 91 68 00 0d f4    	add    dl,BYTE PTR [ecx-0xbf2ff98]
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
     5be:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
     5c1:	56                   	push   esi
     5c2:	00 00                	add    BYTE PTR [eax],al
     5c4:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
     5ca:	30 0e                	xor    BYTE PTR [esi],cl
     5cc:	aa                   	stos   BYTE PTR es:[edi],al
     5cd:	00 00                	add    BYTE PTR [eax],al
     5cf:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     5d2:	56                   	push   esi
     5d3:	00 00                	add    BYTE PTR [eax],al
     5d5:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
     5db:	30 0e                	xor    BYTE PTR [esi],cl
     5dd:	56                   	push   esi
     5de:	01 00                	add    DWORD PTR [eax],eax
     5e0:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     5e7:	05 03 44 38 00       	add    eax,0x384403
     5ec:	30 0e                	xor    BYTE PTR [esi],cl
     5ee:	48                   	dec    eax
     5ef:	00 00                	add    BYTE PTR [eax],al
     5f1:	00 05 37 84 00 00    	add    BYTE PTR ds:0x8437,al
     5f7:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
     5fd:	30 00                	xor    BYTE PTR [eax],al
     5ff:	75 02                	jne    603 <sysEnter_Vector-0x12f9fd>
     601:	00 00                	add    BYTE PTR [eax],al
     603:	04 00                	add    al,0x0
     605:	8a 02                	mov    al,BYTE PTR [edx]
     607:	00 00                	add    BYTE PTR [eax],al
     609:	04 01                	add    al,0x1
     60b:	ef                   	out    dx,eax
     60c:	00 00                	add    BYTE PTR [eax],al
     60e:	00 0c 53             	add    BYTE PTR [ebx+edx*2],cl
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
     6a3:	65 02 00             	add    al,BYTE PTR gs:[eax]
     6a6:	00 04 61             	add    BYTE PTR [ecx+eiz*2],al
     6a9:	00 00                	add    BYTE PTR [eax],al
     6ab:	00 06                	add    BYTE PTR [esi],al
     6ad:	15 31 01 00 00       	adc    eax,0x131
     6b2:	07                   	pop    es
     6b3:	4b                   	dec    ebx
     6b4:	03 00                	add    eax,DWORD PTR [eax]
     6b6:	00 00                	add    BYTE PTR [eax],al
     6b8:	07                   	pop    es
     6b9:	f4                   	hlt    
     6ba:	02 00                	add    al,BYTE PTR [eax]
     6bc:	00 01                	add    BYTE PTR [ecx],al
     6be:	07                   	pop    es
     6bf:	da 02                	fiadd  DWORD PTR [edx]
     6c1:	00 00                	add    BYTE PTR [eax],al
     6c3:	03 07                	add    eax,DWORD PTR [edi]
     6c5:	3d 03 00 00 04       	cmp    eax,0x4000003
     6ca:	07                   	pop    es
     6cb:	44                   	inc    esp
     6cc:	02 00                	add    al,BYTE PTR [eax]
     6ce:	00 4f 07             	add    BYTE PTR [edi+0x7],cl
     6d1:	e7 02                	out    0x2,eax
     6d3:	00 00                	add    BYTE PTR [eax],al
     6d5:	59                   	pop    ecx
     6d6:	07                   	pop    es
     6d7:	6f                   	outs   dx,DWORD PTR ds:[esi]
     6d8:	02 00                	add    al,BYTE PTR [eax]
     6da:	00 61 07             	add    BYTE PTR [ecx+0x7],ah
     6dd:	6a 03                	push   0x3
     6df:	00 00                	add    BYTE PTR [eax],al
     6e1:	97                   	xchg   edi,eax
     6e2:	08 0c 03             	or     BYTE PTR [ebx+eax*1],cl
     6e5:	00 00                	add    BYTE PTR [eax],al
     6e7:	63 01                	arpl   WORD PTR [ecx],ax
     6e9:	08 23                	or     BYTE PTR [ebx],ah
     6eb:	03 00                	add    eax,DWORD PTR [eax]
     6ed:	00 64 01 08          	add    BYTE PTR [ecx+eax*1+0x8],ah
     6f1:	c7 02 00 00 65 01    	mov    DWORD PTR [edx],0x1650000
     6f7:	08 9e 02 00 00 66    	or     BYTE PTR [esi+0x66000002],bl
     6fd:	01 08                	add    DWORD PTR [eax],ecx
     6ff:	82                   	(bad)  
     700:	02 00                	add    al,BYTE PTR [eax]
     702:	00 67 01             	add    BYTE PTR [edi+0x1],ah
     705:	08 30                	or     BYTE PTR [eax],dh
     707:	03 00                	add    eax,DWORD PTR [eax]
     709:	00 68 01             	add    BYTE PTR [eax+0x1],ch
     70c:	08 5b 03             	or     BYTE PTR [ebx+0x3],bl
     70f:	00 00                	add    BYTE PTR [eax],al
     711:	69 01 08 16 02 00    	imul   eax,DWORD PTR [ecx],0x21608
     717:	00 70 01             	add    BYTE PTR [eax+0x1],dh
     71a:	08 88 03 00 00 00    	or     BYTE PTR [eax+0x3],cl
     720:	03 08                	add    ecx,DWORD PTR [eax]
     722:	b8 02 00 00 01       	mov    eax,0x1000002
     727:	03 08                	add    ecx,DWORD PTR [eax]
     729:	27                   	daa    
     72a:	02 00                	add    al,BYTE PTR [eax]
     72c:	00 02                	add    BYTE PTR [edx],al
     72e:	03 00                	add    eax,DWORD PTR [eax]
     730:	09 83 03 00 00 01    	or     DWORD PTR [ebx+0x1000003],eax
     736:	0f 44 03             	cmove  eax,DWORD PTR [ebx]
     739:	00 30                	add    BYTE PTR [eax],dh
     73b:	26 00 00             	add    BYTE PTR es:[eax],al
     73e:	00 01                	add    BYTE PTR [ecx],al
     740:	9c                   	pushf  
     741:	55                   	push   ebp
     742:	01 00                	add    DWORD PTR [eax],eax
     744:	00 0a                	add    BYTE PTR [edx],cl
     746:	33 02                	xor    eax,DWORD PTR [edx]
     748:	00 00                	add    BYTE PTR [eax],al
     74a:	01 0f                	add    DWORD PTR [edi],ecx
     74c:	9d                   	popf   
     74d:	00 00                	add    BYTE PTR [eax],al
     74f:	00 02                	add    BYTE PTR [edx],al
     751:	91                   	xchg   ecx,eax
     752:	00 00                	add    BYTE PTR [eax],al
     754:	09 07                	or     DWORD PTR [edi],eax
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
     775:	0c 33                	or     al,0x33
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
     795:	ac                   	lods   al,BYTE PTR ds:[esi]
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
     7ba:	11 d5                	adc    ebp,edx
     7bc:	02 00                	add    al,BYTE PTR [eax]
     7be:	00 01                	add    BYTE PTR [ecx],al
     7c0:	24 3a                	and    al,0x3a
     7c2:	00 00                	add    BYTE PTR [eax],al
     7c4:	00 dc                	add    ah,bl
     7c6:	03 00                	add    eax,DWORD PTR [eax]
     7c8:	30 ba 00 00 00 01    	xor    BYTE PTR [edx+0x1000000],bh
     7ce:	9c                   	pushf  
     7cf:	34 02                	xor    al,0x2
     7d1:	00 00                	add    BYTE PTR [eax],al
     7d3:	0a 33                	or     dh,BYTE PTR [ebx]
     7d5:	02 00                	add    al,BYTE PTR [eax]
     7d7:	00 01                	add    BYTE PTR [ecx],al
     7d9:	24 9d                	and    al,0x9d
     7db:	00 00                	add    BYTE PTR [eax],al
     7dd:	00 02                	add    BYTE PTR [edx],al
     7df:	91                   	xchg   ecx,eax
     7e0:	00 0a                	add    BYTE PTR [edx],cl
     7e2:	b1 02                	mov    cl,0x2
     7e4:	00 00                	add    BYTE PTR [eax],al
     7e6:	01 24 3a             	add    DWORD PTR [edx+edi*1],esp
     7e9:	00 00                	add    BYTE PTR [eax],al
     7eb:	00 02                	add    BYTE PTR [edx],al
     7ed:	91                   	xchg   ecx,eax
     7ee:	04 0a                	add    al,0xa
     7f0:	0f 02 00             	lar    eax,WORD PTR [eax]
     7f3:	00 01                	add    BYTE PTR [ecx],al
     7f5:	24 3a                	and    al,0x3a
     7f7:	00 00                	add    BYTE PTR [eax],al
     7f9:	00 02                	add    BYTE PTR [edx],al
     7fb:	91                   	xchg   ecx,eax
     7fc:	08 0c 97             	or     BYTE PTR [edi+edx*4],cl
     7ff:	02 00                	add    al,BYTE PTR [eax]
     801:	00 01                	add    BYTE PTR [ecx],al
     803:	26                   	es
     804:	25 00 00 00 02       	and    eax,0x2000000
     809:	91                   	xchg   ecx,eax
     80a:	6b 10 6c             	imul   edx,DWORD PTR [eax],0x6c
     80d:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     80f:	00 01                	add    BYTE PTR [ecx],al
     811:	27                   	daa    
     812:	3a 00                	cmp    al,BYTE PTR [eax]
     814:	00 00                	add    BYTE PTR [eax],al
     816:	02 91 6c 0c 7e 03    	add    dl,BYTE PTR [ecx+0x37e0c6c]
     81c:	00 00                	add    BYTE PTR [eax],al
     81e:	01 28                	add    DWORD PTR [eax],ebp
     820:	85 01                	test   DWORD PTR [ecx],eax
     822:	00 00                	add    BYTE PTR [eax],al
     824:	02 91 69 12 3a 02    	add    dl,BYTE PTR [ecx+0x23a1269]
     82a:	00 00                	add    BYTE PTR [eax],al
     82c:	01 2d 19 04 00 30    	add    DWORD PTR ds:0x30000419,ebp
     832:	00 13                	add    BYTE PTR [ebx],dl
     834:	3f                   	aas    
     835:	00 00                	add    BYTE PTR [eax],al
     837:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
     83a:	56                   	push   esi
     83b:	00 00                	add    BYTE PTR [eax],al
     83d:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
     843:	30 13                	xor    BYTE PTR [ebx],dl
     845:	aa                   	stos   BYTE PTR es:[edi],al
     846:	00 00                	add    BYTE PTR [eax],al
     848:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     84b:	56                   	push   esi
     84c:	00 00                	add    BYTE PTR [eax],al
     84e:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
     854:	30 13                	xor    BYTE PTR [ebx],dl
     856:	56                   	push   esi
     857:	01 00                	add    DWORD PTR [eax],eax
     859:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
     860:	05 03 44 38 00       	add    eax,0x384403
     865:	30 13                	xor    BYTE PTR [ebx],dl
     867:	48                   	dec    eax
     868:	00 00                	add    BYTE PTR [eax],al
     86a:	00 05 37 84 00 00    	add    BYTE PTR ds:0x8437,al
     870:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
     876:	30 00                	xor    BYTE PTR [eax],al
     878:	ca 05 00             	retf   0x5
     87b:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     87e:	a9 03 00 00 04       	test   eax,0x4000003
     883:	01 ef                	add    edi,ebp
     885:	00 00                	add    BYTE PTR [eax],al
     887:	00 0c d4             	add    BYTE PTR [esp+edx*8],cl
     88a:	04 00                	add    al,0x0
     88c:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
     88f:	00 00                	add    BYTE PTR [eax],al
     891:	98                   	cwde   
     892:	04 00                	add    al,0x0
     894:	30 67 03             	xor    BYTE PTR [edi+0x3],ah
     897:	00 00                	add    BYTE PTR [eax],al
     899:	00 05 00 00 02 81    	add    BYTE PTR ds:0x81020000,al
     89f:	04 00                	add    al,0x0
     8a1:	00 02                	add    BYTE PTR [edx],al
     8a3:	28 30                	sub    BYTE PTR [eax],dh
     8a5:	00 00                	add    BYTE PTR [eax],al
     8a7:	00 03                	add    BYTE PTR [ebx],al
     8a9:	04 df                	add    al,0xdf
     8ab:	03 00                	add    eax,DWORD PTR [eax]
     8ad:	00 3a                	add    BYTE PTR [edx],bh
     8af:	00 00                	add    BYTE PTR [eax],al
     8b1:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     8b4:	06                   	push   es
     8b5:	58                   	pop    eax
     8b6:	00 00                	add    BYTE PTR [eax],al
     8b8:	00 02                	add    BYTE PTR [edx],al
     8ba:	88 04 00             	mov    BYTE PTR [eax+eax*1],al
     8bd:	00 02                	add    BYTE PTR [edx],al
     8bf:	62 25 00 00 00 04    	bound  esp,QWORD PTR ds:0x4000000
     8c5:	01 06                	add    DWORD PTR [esi],eax
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
     907:	02 a5 03 00 00 04    	add    ah,BYTE PTR [ebp+0x4000003]
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
     93e:	07                   	pop    es
     93f:	05 00 00 05 2e       	add    eax,0x2e050000
     944:	5a                   	pop    edx
     945:	00 00                	add    BYTE PTR [eax],al
     947:	00 00                	add    BYTE PTR [eax],al
     949:	07                   	pop    es
     94a:	6c                   	ins    BYTE PTR es:[edi],dx
     94b:	04 00                	add    al,0x0
     94d:	00 05 2f 5a 00 00    	add    BYTE PTR ds:0x5a2f,al
     953:	00 04 07             	add    BYTE PTR [edi+eax*1],al
     956:	9d                   	popf   
     957:	03 00                	add    eax,DWORD PTR [eax]
     959:	00 05 30 5a 00 00    	add    BYTE PTR ds:0x5a30,al
     95f:	00 08                	add    BYTE PTR [eax],cl
     961:	07                   	pop    es
     962:	f2 04 00             	repnz add al,0x0
     965:	00 05 31 5a 00 00    	add    BYTE PTR ds:0x5a31,al
     96b:	00 0c 07             	add    BYTE PTR [edi+eax*1],cl
     96e:	f1                   	icebp  
     96f:	03 00                	add    eax,DWORD PTR [eax]
     971:	00 05 32 5a 00 00    	add    BYTE PTR ds:0x5a32,al
     977:	00 10                	add    BYTE PTR [eax],dl
     979:	07                   	pop    es
     97a:	f8                   	clc    
     97b:	03 00                	add    eax,DWORD PTR [eax]
     97d:	00 05 33 5a 00 00    	add    BYTE PTR ds:0x5a33,al
     983:	00 14 07             	add    BYTE PTR [edi+eax*1],dl
     986:	ea 04 00 00 05 34 5a 	jmp    0x5a34:0x5000004
     98d:	00 00                	add    BYTE PTR [eax],al
     98f:	00 18                	add    BYTE PTR [eax],bl
     991:	07                   	pop    es
     992:	79 04                	jns    998 <sysEnter_Vector-0x12f668>
     994:	00 00                	add    BYTE PTR [eax],al
     996:	05 35 5a 00 00       	add    eax,0x5a35
     99b:	00 1c 07             	add    BYTE PTR [edi+eax*1],bl
     99e:	23 04 00             	and    eax,DWORD PTR [eax+eax*1]
     9a1:	00 05 36 5a 00 00    	add    BYTE PTR ds:0x5a36,al
     9a7:	00 20                	add    BYTE PTR [eax],ah
     9a9:	07                   	pop    es
     9aa:	b4 04                	mov    ah,0x4
     9ac:	00 00                	add    BYTE PTR [eax],al
     9ae:	05 37 9a 00 00       	add    eax,0x9a37
     9b3:	00 24 07             	add    BYTE PTR [edi+eax*1],ah
     9b6:	c2 03 00             	ret    0x3
     9b9:	00 05 38 4a 01 00    	add    BYTE PTR ds:0x14a38,al
     9bf:	00 28                	add    BYTE PTR [eax],ch
     9c1:	00 08                	add    BYTE PTR [eax],cl
     9c3:	04 50                	add    al,0x50
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
     9e4:	65 02 00             	add    al,BYTE PTR gs:[eax]
     9e7:	00 04 81             	add    BYTE PTR [ecx+eax*4],al
     9ea:	00 00                	add    BYTE PTR [eax],al
     9ec:	00 08                	add    BYTE PTR [eax],cl
     9ee:	15 f9 01 00 00       	adc    eax,0x1f9
     9f3:	0c 4b                	or     al,0x4b
     9f5:	03 00                	add    eax,DWORD PTR [eax]
     9f7:	00 00                	add    BYTE PTR [eax],al
     9f9:	0c f4                	or     al,0xf4
     9fb:	02 00                	add    al,BYTE PTR [eax]
     9fd:	00 01                	add    BYTE PTR [ecx],al
     9ff:	0c da                	or     al,0xda
     a01:	02 00                	add    al,BYTE PTR [eax]
     a03:	00 03                	add    BYTE PTR [ebx],al
     a05:	0c 3d                	or     al,0x3d
     a07:	03 00                	add    eax,DWORD PTR [eax]
     a09:	00 04 0c             	add    BYTE PTR [esp+ecx*1],al
     a0c:	44                   	inc    esp
     a0d:	02 00                	add    al,BYTE PTR [eax]
     a0f:	00 4f 0c             	add    BYTE PTR [edi+0xc],cl
     a12:	e7 02                	out    0x2,eax
     a14:	00 00                	add    BYTE PTR [eax],al
     a16:	59                   	pop    ecx
     a17:	0c 6f                	or     al,0x6f
     a19:	02 00                	add    al,BYTE PTR [eax]
     a1b:	00 61 0c             	add    BYTE PTR [ecx+0xc],ah
     a1e:	6a 03                	push   0x3
     a20:	00 00                	add    BYTE PTR [eax],al
     a22:	97                   	xchg   edi,eax
     a23:	0d 0c 03 00 00       	or     eax,0x30c
     a28:	63 01                	arpl   WORD PTR [ecx],ax
     a2a:	0d 23 03 00 00       	or     eax,0x323
     a2f:	64 01 0d c7 02 00 00 	add    DWORD PTR fs:0x2c7,ecx
     a36:	65 01 0d 9e 02 00 00 	add    DWORD PTR gs:0x29e,ecx
     a3d:	66 01 0d 82 02 00 00 	add    WORD PTR ds:0x282,cx
     a44:	67 01 0d             	add    DWORD PTR [di],ecx
     a47:	30 03                	xor    BYTE PTR [ebx],al
     a49:	00 00                	add    BYTE PTR [eax],al
     a4b:	68 01 0d 5b 03       	push   0x35b0d01
     a50:	00 00                	add    BYTE PTR [eax],al
     a52:	69 01 0d 16 02 00    	imul   eax,DWORD PTR [ecx],0x2160d
     a58:	00 70 01             	add    BYTE PTR [eax+0x1],dh
     a5b:	0d 88 03 00 00       	or     eax,0x388
     a60:	00 03                	add    BYTE PTR [ebx],al
     a62:	0d b8 02 00 00       	or     eax,0x2b8
     a67:	01 03                	add    DWORD PTR [ebx],eax
     a69:	0d 27 02 00 00       	or     eax,0x227
     a6e:	02 03                	add    al,BYTE PTR [ebx]
     a70:	00 0e                	add    BYTE PTR [esi],cl
     a72:	50                   	push   eax
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
     a8b:	1b 04 00             	sbb    eax,DWORD PTR [eax+eax*1]
     a8e:	00 01                	add    BYTE PTR [ecx],al
     a90:	0f 5a 00             	cvtps2pd xmm0,QWORD PTR [eax]
     a93:	00 00                	add    BYTE PTR [eax],al
     a95:	02 91 00 0f 98 04    	add    dl,BYTE PTR [ecx+0x4980f00]
     a9b:	00 00                	add    BYTE PTR [eax],al
     a9d:	01 0f                	add    DWORD PTR [edi],ecx
     a9f:	76 00                	jbe    aa1 <sysEnter_Vector-0x12f55f>
     aa1:	00 00                	add    BYTE PTR [eax],al
     aa3:	02 91 04 0f 9f 04    	add    dl,BYTE PTR [ecx+0x49f0f04]
     aa9:	00 00                	add    BYTE PTR [eax],al
     aab:	01 0f                	add    DWORD PTR [edi],ecx
     aad:	76 00                	jbe    aaf <sysEnter_Vector-0x12f551>
     aaf:	00 00                	add    BYTE PTR [eax],al
     ab1:	02 91 08 0f a6 04    	add    dl,BYTE PTR [ecx+0x4a60f08]
     ab7:	00 00                	add    BYTE PTR [eax],al
     ab9:	01 0f                	add    DWORD PTR [edi],ecx
     abb:	76 00                	jbe    abd <sysEnter_Vector-0x12f543>
     abd:	00 00                	add    BYTE PTR [eax],al
     abf:	02 91 0c 10 96 03    	add    dl,BYTE PTR [ecx+0x396100c]
     ac5:	00 00                	add    BYTE PTR [eax],al
     ac7:	01 11                	add    DWORD PTR [ecx],edx
     ac9:	5a                   	pop    edx
     aca:	00 00                	add    BYTE PTR [eax],al
     acc:	00 02                	add    BYTE PTR [edx],al
     ace:	91                   	xchg   ecx,eax
     acf:	70 00                	jo     ad1 <sysEnter_Vector-0x12f52f>
     ad1:	0e                   	push   cs
     ad2:	44                   	inc    esp
     ad3:	04 00                	add    al,0x0
     ad5:	00 01                	add    BYTE PTR [ecx],al
     ad7:	16                   	push   ss
     ad8:	5a                   	pop    edx
     ad9:	00 00                	add    BYTE PTR [eax],al
     adb:	00 cd                	add    ch,cl
     add:	04 00                	add    al,0x0
     adf:	30 34 00             	xor    BYTE PTR [eax+eax*1],dh
     ae2:	00 00                	add    BYTE PTR [eax],al
     ae4:	01 9c ab 02 00 00 0f 	add    DWORD PTR [ebx+ebp*4+0xf000002],ebx
     aeb:	1b 04 00             	sbb    eax,DWORD PTR [eax+eax*1]
     aee:	00 01                	add    BYTE PTR [ecx],al
     af0:	16                   	push   ss
     af1:	5a                   	pop    edx
     af2:	00 00                	add    BYTE PTR [eax],al
     af4:	00 02                	add    BYTE PTR [edx],al
     af6:	91                   	xchg   ecx,eax
     af7:	00 0f                	add    BYTE PTR [edi],cl
     af9:	98                   	cwde   
     afa:	04 00                	add    al,0x0
     afc:	00 01                	add    BYTE PTR [ecx],al
     afe:	16                   	push   ss
     aff:	76 00                	jbe    b01 <sysEnter_Vector-0x12f4ff>
     b01:	00 00                	add    BYTE PTR [eax],al
     b03:	02 91 04 0f 9f 04    	add    dl,BYTE PTR [ecx+0x49f0f04]
     b09:	00 00                	add    BYTE PTR [eax],al
     b0b:	01 16                	add    DWORD PTR [esi],edx
     b0d:	76 00                	jbe    b0f <sysEnter_Vector-0x12f4f1>
     b0f:	00 00                	add    BYTE PTR [eax],al
     b11:	02 91 08 10 96 03    	add    dl,BYTE PTR [ecx+0x3961008]
     b17:	00 00                	add    BYTE PTR [eax],al
     b19:	01 18                	add    DWORD PTR [eax],ebx
     b1b:	5a                   	pop    edx
     b1c:	00 00                	add    BYTE PTR [eax],al
     b1e:	00 02                	add    BYTE PTR [edx],al
     b20:	91                   	xchg   ecx,eax
     b21:	70 00                	jo     b23 <sysEnter_Vector-0x12f4dd>
     b23:	0e                   	push   cs
     b24:	38 04 00             	cmp    BYTE PTR [eax+eax*1],al
     b27:	00 01                	add    BYTE PTR [ecx],al
     b29:	1d 5a 00 00 00       	sbb    eax,0x5a
     b2e:	01 05 00 30 31 00    	add    DWORD PTR ds:0x313000,eax
     b34:	00 00                	add    BYTE PTR [eax],al
     b36:	01 9c ef 02 00 00 0f 	add    DWORD PTR [edi+ebp*8+0xf000002],ebx
     b3d:	1b 04 00             	sbb    eax,DWORD PTR [eax+eax*1]
     b40:	00 01                	add    BYTE PTR [ecx],al
     b42:	1d 5a 00 00 00       	sbb    eax,0x5a
     b47:	02 91 00 0f 98 04    	add    dl,BYTE PTR [ecx+0x4980f00]
     b4d:	00 00                	add    BYTE PTR [eax],al
     b4f:	01 1d 76 00 00 00    	add    DWORD PTR ds:0x76,ebx
     b55:	02 91 04 10 96 03    	add    dl,BYTE PTR [ecx+0x3961004]
     b5b:	00 00                	add    BYTE PTR [eax],al
     b5d:	01 1f                	add    DWORD PTR [edi],ebx
     b5f:	5a                   	pop    edx
     b60:	00 00                	add    BYTE PTR [eax],al
     b62:	00 02                	add    BYTE PTR [edx],al
     b64:	91                   	xchg   ecx,eax
     b65:	70 00                	jo     b67 <sysEnter_Vector-0x12f499>
     b67:	0e                   	push   cs
     b68:	2c 04                	sub    al,0x4
     b6a:	00 00                	add    BYTE PTR [eax],al
     b6c:	01 24 5a             	add    DWORD PTR [edx+ebx*2],esp
     b6f:	00 00                	add    BYTE PTR [eax],al
     b71:	00 32                	add    BYTE PTR [edx],dh
     b73:	05 00 30 27 00       	add    eax,0x273000
     b78:	00 00                	add    BYTE PTR [eax],al
     b7a:	01 9c 25 03 00 00 0f 	add    DWORD PTR [ebp+eiz*1+0xf000003],ebx
     b81:	1b 04 00             	sbb    eax,DWORD PTR [eax+eax*1]
     b84:	00 01                	add    BYTE PTR [ecx],al
     b86:	24 5a                	and    al,0x5a
     b88:	00 00                	add    BYTE PTR [eax],al
     b8a:	00 02                	add    BYTE PTR [edx],al
     b8c:	91                   	xchg   ecx,eax
     b8d:	00 10                	add    BYTE PTR [eax],dl
     b8f:	96                   	xchg   esi,eax
     b90:	03 00                	add    eax,DWORD PTR [eax]
     b92:	00 01                	add    BYTE PTR [ecx],al
     b94:	26                   	es
     b95:	5a                   	pop    edx
     b96:	00 00                	add    BYTE PTR [eax],al
     b98:	00 02                	add    BYTE PTR [edx],al
     b9a:	91                   	xchg   ecx,eax
     b9b:	74 00                	je     b9d <sysEnter_Vector-0x12f463>
     b9d:	11 cf                	adc    edi,ecx
     b9f:	03 00                	add    eax,DWORD PTR [eax]
     ba1:	00 01                	add    BYTE PTR [ecx],al
     ba3:	2b 59 05             	sub    ebx,DWORD PTR [ecx+0x5]
     ba6:	00 30                	add    BYTE PTR [eax],dh
     ba8:	9f                   	lahf   
     ba9:	00 00                	add    BYTE PTR [eax],al
     bab:	00 01                	add    BYTE PTR [ecx],al
     bad:	9c                   	pushf  
     bae:	11 fa                	adc    edx,edi
     bb0:	04 00                	add    al,0x0
     bb2:	00 01                	add    BYTE PTR [ecx],al
     bb4:	3b f8                	cmp    edi,eax
     bb6:	05 00 30 1f 00       	add    eax,0x1f3000
     bbb:	00 00                	add    BYTE PTR [eax],al
     bbd:	01 9c 12 d9 03 00 00 	add    DWORD PTR [edx+edx*1+0x3d9],ebx
     bc4:	01 40 5a             	add    DWORD PTR [eax+0x5a],eax
     bc7:	00 00                	add    BYTE PTR [eax],al
     bc9:	00 17                	add    BYTE PTR [edi],dl
     bcb:	06                   	push   es
     bcc:	00 30                	add    BYTE PTR [eax],dh
     bce:	34 00                	xor    al,0x0
     bd0:	00 00                	add    BYTE PTR [eax],al
     bd2:	01 9c 7e 03 00 00 0f 	add    DWORD PTR [esi+edi*2+0xf000003],ebx
     bd9:	ad                   	lods   eax,DWORD PTR ds:[esi]
     bda:	04 00                	add    al,0x0
     bdc:	00 01                	add    BYTE PTR [ecx],al
     bde:	40                   	inc    eax
     bdf:	4a                   	dec    edx
     be0:	01 00                	add    DWORD PTR [eax],eax
     be2:	00 02                	add    BYTE PTR [edx],al
     be4:	91                   	xchg   ecx,eax
     be5:	00 13                	add    BYTE PTR [ebx],dl
     be7:	10 2b                	adc    BYTE PTR [ebx],ch
     be9:	05 00 00 01 42       	add    eax,0x42010000
     bee:	41                   	inc    ecx
     bef:	00 00                	add    BYTE PTR [eax],al
     bf1:	00 02                	add    BYTE PTR [edx],al
     bf3:	91                   	xchg   ecx,eax
     bf4:	74 00                	je     bf6 <sysEnter_Vector-0x12f40a>
     bf6:	12 30                	adc    dh,BYTE PTR [eax]
     bf8:	05 00 00 01 48       	add    eax,0x48010000
     bfd:	5a                   	pop    edx
     bfe:	00 00                	add    BYTE PTR [eax],al
     c00:	00 4b 06             	add    BYTE PTR [ebx+0x6],cl
     c03:	00 30                	add    BYTE PTR [eax],dh
     c05:	34 00                	xor    al,0x0
     c07:	00 00                	add    BYTE PTR [eax],al
     c09:	01 9c b5 03 00 00 0f 	add    DWORD PTR [ebp+esi*4+0xf000003],ebx
     c10:	ad                   	lods   eax,DWORD PTR ds:[esi]
     c11:	04 00                	add    al,0x0
     c13:	00 01                	add    BYTE PTR [ecx],al
     c15:	48                   	dec    eax
     c16:	4a                   	dec    edx
     c17:	01 00                	add    DWORD PTR [eax],eax
     c19:	00 02                	add    BYTE PTR [edx],al
     c1b:	91                   	xchg   ecx,eax
     c1c:	00 13                	add    BYTE PTR [ebx],dl
     c1e:	10 2b                	adc    BYTE PTR [ebx],ch
     c20:	05 00 00 01 4a       	add    eax,0x4a010000
     c25:	41                   	inc    ecx
     c26:	00 00                	add    BYTE PTR [eax],al
     c28:	00 02                	add    BYTE PTR [edx],al
     c2a:	91                   	xchg   ecx,eax
     c2b:	74 00                	je     c2d <sysEnter_Vector-0x12f3d3>
     c2d:	0e                   	push   cs
     c2e:	90                   	nop
     c2f:	04 00                	add    al,0x0
     c31:	00 01                	add    BYTE PTR [ecx],al
     c33:	50                   	push   eax
     c34:	5a                   	pop    edx
     c35:	00 00                	add    BYTE PTR [eax],al
     c37:	00 7f 06             	add    BYTE PTR [edi+0x6],bh
     c3a:	00 30                	add    BYTE PTR [eax],dh
     c3c:	37                   	aaa    
     c3d:	00 00                	add    BYTE PTR [eax],al
     c3f:	00 01                	add    BYTE PTR [ecx],al
     c41:	9c                   	pushf  
     c42:	fa                   	cli    
     c43:	03 00                	add    eax,DWORD PTR [eax]
     c45:	00 0f                	add    BYTE PTR [edi],cl
     c47:	10 04 00             	adc    BYTE PTR [eax+eax*1],al
     c4a:	00 01                	add    BYTE PTR [ecx],al
     c4c:	50                   	push   eax
     c4d:	76 00                	jbe    c4f <sysEnter_Vector-0x12f3b1>
     c4f:	00 00                	add    BYTE PTR [eax],al
     c51:	02 91 00 0f ad 04    	add    dl,BYTE PTR [ecx+0x4ad0f00]
     c57:	00 00                	add    BYTE PTR [eax],al
     c59:	01 50 4a             	add    DWORD PTR [eax+0x4a],edx
     c5c:	01 00                	add    DWORD PTR [eax],eax
     c5e:	00 02                	add    BYTE PTR [edx],al
     c60:	91                   	xchg   ecx,eax
     c61:	04 13                	add    al,0x13
     c63:	10 2b                	adc    BYTE PTR [ebx],ch
     c65:	05 00 00 01 52       	add    eax,0x52010000
     c6a:	41                   	inc    ecx
     c6b:	00 00                	add    BYTE PTR [eax],al
     c6d:	00 02                	add    BYTE PTR [edx],al
     c6f:	91                   	xchg   ecx,eax
     c70:	70 00                	jo     c72 <sysEnter_Vector-0x12f38e>
     c72:	0e                   	push   cs
     c73:	ac                   	lods   al,BYTE PTR ds:[esi]
     c74:	03 00                	add    eax,DWORD PTR [eax]
     c76:	00 01                	add    BYTE PTR [ecx],al
     c78:	58                   	pop    eax
     c79:	81 00 00 00 b6 06    	add    DWORD PTR [eax],0x6b60000
     c7f:	00 30                	add    BYTE PTR [eax],dh
     c81:	4e                   	dec    esi
     c82:	00 00                	add    BYTE PTR [eax],al
     c84:	00 01                	add    BYTE PTR [ecx],al
     c86:	9c                   	pushf  
     c87:	39 04 00             	cmp    DWORD PTR [eax+eax*1],eax
     c8a:	00 0f                	add    BYTE PTR [edi],cl
     c8c:	ca 04 00             	retf   0x4
     c8f:	00 01                	add    BYTE PTR [ecx],al
     c91:	58                   	pop    eax
     c92:	81 00 00 00 02 91    	add    DWORD PTR [eax],0x91020000
     c98:	00 14 c7             	add    BYTE PTR [edi+eax*8],dl
     c9b:	06                   	push   es
     c9c:	00 30                	add    BYTE PTR [eax],dh
     c9e:	32 00                	xor    al,BYTE PTR [eax]
     ca0:	00 00                	add    BYTE PTR [eax],al
     ca2:	15 63 74 00 01       	adc    eax,0x1007463
     ca7:	5a                   	pop    edx
     ca8:	76 00                	jbe    caa <sysEnter_Vector-0x12f356>
     caa:	00 00                	add    BYTE PTR [eax],al
     cac:	02 91 70 00 00 16    	add    dl,BYTE PTR [ecx+0x16000070]
     cb2:	37                   	aaa    
     cb3:	05 00 00 01 5e       	add    eax,0x5e010000
     cb8:	04 07                	add    al,0x7
     cba:	00 30                	add    BYTE PTR [eax],dh
     cbc:	1d 00 00 00 01       	sbb    eax,0x1000000
     cc1:	9c                   	pushf  
     cc2:	17                   	pop    ss
     cc3:	1e                   	push   ds
     cc4:	05 00 00 01 63       	add    eax,0x63010000
     cc9:	21 07                	and    DWORD PTR [edi],eax
     ccb:	00 30                	add    BYTE PTR [eax],dh
     ccd:	29 00                	sub    DWORD PTR [eax],eax
     ccf:	00 00                	add    BYTE PTR [eax],al
     cd1:	01 9c 8a 04 00 00 0f 	add    DWORD PTR [edx+ecx*4+0xf000004],ebx
     cd8:	be 04 00 00 01       	mov    esi,0x1000004
     cdd:	63 5a 00             	arpl   WORD PTR [edx+0x0],bx
     ce0:	00 00                	add    BYTE PTR [eax],al
     ce2:	02 91 00 0f 13 05    	add    dl,BYTE PTR [ecx+0x5130f00]
     ce8:	00 00                	add    BYTE PTR [eax],al
     cea:	01 63 63             	add    DWORD PTR [ebx+0x63],esp
     ced:	01 00                	add    DWORD PTR [eax],eax
     cef:	00 02                	add    BYTE PTR [edx],al
     cf1:	91                   	xchg   ecx,eax
     cf2:	04 0f                	add    al,0xf
     cf4:	b2 03                	mov    dl,0x3
     cf6:	00 00                	add    BYTE PTR [eax],al
     cf8:	01 63 5a             	add    DWORD PTR [ebx+0x5a],esp
     cfb:	00 00                	add    BYTE PTR [eax],al
     cfd:	00 02                	add    BYTE PTR [edx],al
     cff:	91                   	xchg   ecx,eax
     d00:	08 00                	or     BYTE PTR [eax],al
     d02:	0e                   	push   cs
     d03:	c5 04 00             	lds    eax,FWORD PTR [eax+eax*1]
     d06:	00 01                	add    BYTE PTR [ecx],al
     d08:	68 5a 00 00 00       	push   0x5a
     d0d:	4a                   	dec    edx
     d0e:	07                   	pop    es
     d0f:	00 30                	add    BYTE PTR [eax],dh
     d11:	36 00 00             	add    BYTE PTR ss:[eax],al
     d14:	00 01                	add    BYTE PTR [ecx],al
     d16:	9c                   	pushf  
     d17:	dc 04 00             	fadd   QWORD PTR [eax+eax*1]
     d1a:	00 0f                	add    BYTE PTR [edi],cl
     d1c:	17                   	pop    ss
     d1d:	08 00                	or     BYTE PTR [eax],al
     d1f:	00 01                	add    BYTE PTR [ecx],al
     d21:	68 65 01 00 00       	push   0x165
     d26:	02 91 00 0f e5 04    	add    dl,BYTE PTR [ecx+0x4e50f00]
     d2c:	00 00                	add    BYTE PTR [eax],al
     d2e:	01 68 5a             	add    DWORD PTR [eax+0x5a],ebp
     d31:	00 00                	add    BYTE PTR [eax],al
     d33:	00 02                	add    BYTE PTR [edx],al
     d35:	91                   	xchg   ecx,eax
     d36:	04 0f                	add    al,0xf
     d38:	0e                   	push   cs
     d39:	05 00 00 01 68       	add    eax,0x68010000
     d3e:	dc 04 00             	fadd   QWORD PTR [eax+eax*1]
     d41:	00 02                	add    BYTE PTR [edx],al
     d43:	91                   	xchg   ecx,eax
     d44:	08 15 70 69 64 00    	or     BYTE PTR ds:0x646970,dl
     d4a:	01 6a 5a             	add    DWORD PTR [edx+0x5a],ebp
     d4d:	00 00                	add    BYTE PTR [eax],al
     d4f:	00 02                	add    BYTE PTR [edx],al
     d51:	91                   	xchg   ecx,eax
     d52:	70 00                	jo     d54 <sysEnter_Vector-0x12f2ac>
     d54:	08 04 65 01 00 00 17 	or     BYTE PTR [eiz*2+0x17000001],al
     d5b:	08 04 00             	or     BYTE PTR [eax+eax*1],al
     d5e:	00 01                	add    BYTE PTR [ecx],al
     d60:	73 80                	jae    ce2 <sysEnter_Vector-0x12f31e>
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
     d7e:	19 00                	sbb    DWORD PTR [eax],eax
     d80:	04 00                	add    al,0x0
     d82:	00 01                	add    BYTE PTR [ecx],al
     d84:	78 3c                	js     dc2 <sysEnter_Vector-0x12f23e>
     d86:	05 00 00 9d 07       	add    eax,0x79d0000
     d8b:	00 30                	add    BYTE PTR [eax],dh
     d8d:	42                   	inc    edx
     d8e:	00 00                	add    BYTE PTR [eax],al
     d90:	00 01                	add    BYTE PTR [ecx],al
     d92:	9c                   	pushf  
     d93:	3c 05                	cmp    al,0x5
     d95:	00 00                	add    BYTE PTR [eax],al
     d97:	10 73 04             	adc    BYTE PTR [ebx+0x4],dh
     d9a:	00 00                	add    BYTE PTR [eax],al
     d9c:	01 7a 76             	add    DWORD PTR [edx+0x76],edi
     d9f:	00 00                	add    BYTE PTR [eax],al
     da1:	00 02                	add    BYTE PTR [edx],al
     da3:	91                   	xchg   ecx,eax
     da4:	6c                   	ins    BYTE PTR es:[edi],dx
     da5:	10 ba 03 00 00 01    	adc    BYTE PTR [edx+0x1000003],bh
     dab:	7b ba                	jnp    d67 <sysEnter_Vector-0x12f299>
     dad:	00 00                	add    BYTE PTR [eax],al
     daf:	00 02                	add    BYTE PTR [edx],al
     db1:	91                   	xchg   ecx,eax
     db2:	40                   	inc    eax
     db3:	00 08                	add    BYTE PTR [eax],cl
     db5:	04 ba                	add    al,0xba
     db7:	00 00                	add    BYTE PTR [eax],al
     db9:	00 12                	add    BYTE PTR [edx],dl
     dbb:	3c 05                	cmp    al,0x5
     dbd:	00 00                	add    BYTE PTR [eax],al
     dbf:	01 80 65 01 00 00    	add    DWORD PTR [eax+0x165],eax
     dc5:	df 07                	fild   WORD PTR [edi]
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
     de2:	ca 03 00             	retf   0x3
     de5:	00 01                	add    BYTE PTR [ecx],al
     de7:	80 8f 00 00 00 02 91 	or     BYTE PTR [edi+0x2000000],0x91
     dee:	04 00                	add    al,0x0
     df0:	1a 3f                	sbb    bh,BYTE PTR [edi]
     df2:	00 00                	add    BYTE PTR [eax],al
     df4:	00 06                	add    BYTE PTR [esi],al
     df6:	33 76 00             	xor    esi,DWORD PTR [esi+0x0]
     df9:	00 00                	add    BYTE PTR [eax],al
     dfb:	05 03 48 38 00       	add    eax,0x384803
     e00:	30 1a                	xor    BYTE PTR [edx],bl
     e02:	aa                   	stos   BYTE PTR es:[edi],al
     e03:	00 00                	add    BYTE PTR [eax],al
     e05:	00 06                	add    BYTE PTR [esi],al
     e07:	34 76                	xor    al,0x76
     e09:	00 00                	add    BYTE PTR [eax],al
     e0b:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
     e11:	30 1a                	xor    BYTE PTR [edx],bl
     e13:	56                   	push   esi
     e14:	01 00                	add    DWORD PTR [eax],eax
     e16:	00 06                	add    BYTE PTR [esi],al
     e18:	35 76 00 00 00       	xor    eax,0x76
     e1d:	05 03 44 38 00       	add    eax,0x384403
     e22:	30 1a                	xor    BYTE PTR [edx],bl
     e24:	48                   	dec    eax
     e25:	00 00                	add    BYTE PTR [eax],al
     e27:	00 07                	add    BYTE PTR [edi],al
     e29:	37                   	aaa    
     e2a:	af                   	scas   eax,DWORD PTR es:[edi]
     e2b:	00 00                	add    BYTE PTR [eax],al
     e2d:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
     e33:	30 1a                	xor    BYTE PTR [edx],bl
     e35:	5c                   	pop    esp
     e36:	04 00                	add    al,0x0
     e38:	00 01                	add    BYTE PTR [ecx],al
     e3a:	0d a8 00 00 00       	or     eax,0xa8
     e3f:	05 03 58 38 00       	add    eax,0x385803
     e44:	30 00                	xor    BYTE PTR [eax],al
     e46:	52                   	push   edx
     e47:	02 00                	add    al,BYTE PTR [eax]
     e49:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     e4c:	38 05 00 00 04 01    	cmp    BYTE PTR ds:0x1040000,al
     e52:	ef                   	out    dx,eax
     e53:	00 00                	add    BYTE PTR [eax],al
     e55:	00 0c df             	add    BYTE PTR [edi+ebx*8],cl
     e58:	05 00 00 6d 00       	add    eax,0x6d0000
     e5d:	00 00                	add    BYTE PTR [eax],al
     e5f:	00 08                	add    BYTE PTR [eax],cl
     e61:	00 30                	add    BYTE PTR [eax],dh
     e63:	1a 03                	sbb    al,BYTE PTR [ebx]
     e65:	00 00                	add    BYTE PTR [eax],al
     e67:	67 06                	addr16 push es
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
     e87:	04 77                	add    al,0x77
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
     eb9:	04 a5                	add    al,0xa5
     ebb:	03 00                	add    eax,DWORD PTR [eax]
     ebd:	00 03                	add    BYTE PTR [ebx],al
     ebf:	d8 65 00             	fsub   DWORD PTR [ebp+0x0]
     ec2:	00 00                	add    BYTE PTR [eax],al
     ec4:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
     ecb:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
     ece:	96                   	xchg   esi,eax
     ecf:	00 00                	add    BYTE PTR [eax],al
     ed1:	00 05 93 05 00 00    	add    BYTE PTR ds:0x593,al
     ed7:	10 04 2b             	adc    BYTE PTR [ebx+ebp*1],al
     eda:	c9                   	leave  
     edb:	00 00                	add    BYTE PTR [eax],al
     edd:	00 06                	add    BYTE PTR [esi],al
     edf:	70 05                	jo     ee6 <sysEnter_Vector-0x12f11a>
     ee1:	00 00                	add    BYTE PTR [eax],al
     ee3:	04 2d                	add    al,0x2d
     ee5:	5a                   	pop    edx
     ee6:	00 00                	add    BYTE PTR [eax],al
     ee8:	00 00                	add    BYTE PTR [eax],al
     eea:	07                   	pop    es
     eeb:	6c                   	ins    BYTE PTR es:[edi],dx
     eec:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     eee:	00 04 2e             	add    BYTE PTR [esi+ebp*1],al
     ef1:	5a                   	pop    edx
     ef2:	00 00                	add    BYTE PTR [eax],al
     ef4:	00 04 06             	add    BYTE PTR [esi+eax*1],al
     ef7:	99                   	cdq    
     ef8:	05 00 00 04 2f       	add    eax,0x2f040000
     efd:	c9                   	leave  
     efe:	00 00                	add    BYTE PTR [eax],al
     f00:	00 08                	add    BYTE PTR [eax],cl
     f02:	06                   	push   es
     f03:	ec                   	in     al,dx
     f04:	05 00 00 04 30       	add    eax,0x30040000
     f09:	d0 00                	rol    BYTE PTR [eax],1
     f0b:	00 00                	add    BYTE PTR [eax],al
     f0d:	0c 00                	or     al,0x0
     f0f:	02 01                	add    al,BYTE PTR [ecx]
     f11:	02 90 00 00 00 08    	add    dl,BYTE PTR [eax+0x8000000]
     f17:	04 8c                	add    al,0x8c
     f19:	00 00                	add    BYTE PTR [eax],al
     f1b:	00 04 f1             	add    BYTE PTR [ecx+esi*8],al
     f1e:	05 00 00 04 31       	add    eax,0x31040000
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
     f4a:	9f                   	lahf   
     f4b:	05 00 00 01 0c       	add    eax,0xc010000
     f50:	00 08                	add    BYTE PTR [eax],cl
     f52:	00 30                	add    BYTE PTR [eax],dh
     f54:	5c                   	pop    esp
     f55:	00 00                	add    BYTE PTR [eax],al
     f57:	00 01                	add    BYTE PTR [ecx],al
     f59:	9c                   	pushf  
     f5a:	0b bf 05 00 00 01    	or     edi,DWORD PTR [edi+0x1000005]
     f60:	14 5a                	adc    al,0x5a
     f62:	00 00                	add    BYTE PTR [eax],al
     f64:	00 5c 08 00          	add    BYTE PTR [eax+ecx*1+0x0],bl
     f68:	30 7c 00 00          	xor    BYTE PTR [eax+eax*1+0x0],bh
     f6c:	00 01                	add    BYTE PTR [ecx],al
     f6e:	9c                   	pushf  
     f6f:	4a                   	dec    edx
     f70:	01 00                	add    DWORD PTR [eax],eax
     f72:	00 0c ca             	add    BYTE PTR [edx+ecx*8],cl
     f75:	03 00                	add    eax,DWORD PTR [eax]
     f77:	00 01                	add    BYTE PTR [ecx],al
     f79:	14 73                	adc    al,0x73
     f7b:	00 00                	add    BYTE PTR [eax],al
     f7d:	00 02                	add    BYTE PTR [edx],al
     f7f:	91                   	xchg   ecx,eax
     f80:	00 0d 59 05 00 00    	add    BYTE PTR ds:0x559,cl
     f86:	01 16                	add    DWORD PTR [esi],edx
     f88:	5a                   	pop    edx
     f89:	00 00                	add    BYTE PTR [eax],al
     f8b:	00 02                	add    BYTE PTR [edx],al
     f8d:	91                   	xchg   ecx,eax
     f8e:	74 00                	je     f90 <sysEnter_Vector-0x12f070>
     f90:	0e                   	push   cs
     f91:	a3 05 00 00 01       	mov    ds:0x1000005,eax
     f96:	27                   	daa    
     f97:	01 01                	add    DWORD PTR [ecx],eax
     f99:	00 00                	add    BYTE PTR [eax],al
     f9b:	d8 08                	fmul   DWORD PTR [eax]
     f9d:	00 30                	add    BYTE PTR [eax],dh
     f9f:	e3 01                	jecxz  fa2 <sysEnter_Vector-0x12f05e>
     fa1:	00 00                	add    BYTE PTR [eax],al
     fa3:	01 9c b8 01 00 00 0c 	add    DWORD PTR [eax+edi*4+0xc000001],ebx
     faa:	ca 03 00             	retf   0x3
     fad:	00 01                	add    BYTE PTR [ecx],al
     faf:	27                   	daa    
     fb0:	73 00                	jae    fb2 <sysEnter_Vector-0x12f04e>
     fb2:	00 00                	add    BYTE PTR [eax],al
     fb4:	02 91 00 0d 96 03    	add    dl,BYTE PTR [ecx+0x3960d00]
     fba:	00 00                	add    BYTE PTR [eax],al
     fbc:	01 29                	add    DWORD PTR [ecx],ebp
     fbe:	01 01                	add    DWORD PTR [ecx],eax
     fc0:	00 00                	add    BYTE PTR [eax],al
     fc2:	02 91 60 0d 8c 05    	add    dl,BYTE PTR [ecx+0x58c0d60]
     fc8:	00 00                	add    BYTE PTR [eax],al
     fca:	01 2b                	add    DWORD PTR [ebx],ebp
     fcc:	5a                   	pop    edx
     fcd:	00 00                	add    BYTE PTR [eax],al
     fcf:	00 02                	add    BYTE PTR [edx],al
     fd1:	91                   	xchg   ecx,eax
     fd2:	6c                   	ins    BYTE PTR es:[edi],dx
     fd3:	0d 43 05 00 00       	or     eax,0x543
     fd8:	01 2c 5a             	add    DWORD PTR [edx+ebx*2],ebp
     fdb:	00 00                	add    BYTE PTR [eax],al
     fdd:	00 02                	add    BYTE PTR [edx],al
     fdf:	91                   	xchg   ecx,eax
     fe0:	68 0d 84 05 00       	push   0x5840d
     fe5:	00 01                	add    BYTE PTR [ecx],al
     fe7:	2d b8 01 00 00       	sub    eax,0x1b8
     fec:	02 91 64 0d b3 05    	add    dl,BYTE PTR [ecx+0x5b30d64]
     ff2:	00 00                	add    BYTE PTR [eax],al
     ff4:	01 2e                	add    DWORD PTR [esi],ebp
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
    100b:	7f 05                	jg     1012 <sysEnter_Vector-0x12efee>
    100d:	00 00                	add    BYTE PTR [eax],al
    100f:	01 4e bb             	add    DWORD PTR [esi-0x45],ecx
    1012:	0a 00                	or     al,BYTE PTR [eax]
    1014:	30 39                	xor    BYTE PTR [ecx],bh
    1016:	00 00                	add    BYTE PTR [eax],al
    1018:	00 01                	add    BYTE PTR [ecx],al
    101a:	9c                   	pushf  
    101b:	00 02                	add    BYTE PTR [edx],al
    101d:	00 00                	add    BYTE PTR [eax],al
    101f:	0c 50                	or     al,0x50
    1021:	05 00 00 01 4e       	add    eax,0x4e010000
    1026:	01 01                	add    DWORD PTR [ecx],eax
    1028:	00 00                	add    BYTE PTR [eax],al
    102a:	02 91 00 10 6d 70    	add    dl,BYTE PTR [ecx+0x706d1000]
    1030:	00 01                	add    BYTE PTR [ecx],al
    1032:	50                   	push   eax
    1033:	b8 01 00 00 02       	mov    eax,0x2000001
    1038:	91                   	xchg   ecx,eax
    1039:	74 11                	je     104c <sysEnter_Vector-0x12efb4>
    103b:	aa                   	stos   BYTE PTR es:[edi],al
    103c:	05 00 00 01 5a       	add    eax,0x5a010000
    1041:	e6 0a                	out    0xa,al
    1043:	00 30                	add    BYTE PTR [eax],dh
    1045:	00 12                	add    BYTE PTR [edx],dl
    1047:	61                   	popa   
    1048:	05 00 00 01 60       	add    eax,0x60010000
    104d:	f4                   	hlt    
    104e:	0a 00                	or     al,BYTE PTR [eax]
    1050:	30 26                	xor    BYTE PTR [esi],ah
    1052:	00 00                	add    BYTE PTR [eax],al
    1054:	00 01                	add    BYTE PTR [ecx],al
    1056:	9c                   	pushf  
    1057:	13 3f                	adc    edi,DWORD PTR [edi]
    1059:	00 00                	add    BYTE PTR [eax],al
    105b:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    105e:	5a                   	pop    edx
    105f:	00 00                	add    BYTE PTR [eax],al
    1061:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
    1067:	30 13                	xor    BYTE PTR [ebx],dl
    1069:	aa                   	stos   BYTE PTR es:[edi],al
    106a:	00 00                	add    BYTE PTR [eax],al
    106c:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    106f:	5a                   	pop    edx
    1070:	00 00                	add    BYTE PTR [eax],al
    1072:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
    1078:	30 13                	xor    BYTE PTR [ebx],dl
    107a:	56                   	push   esi
    107b:	01 00                	add    DWORD PTR [eax],eax
    107d:	00 04 35 5a 00 00 00 	add    BYTE PTR [esi*1+0x5a],al
    1084:	05 03 44 38 00       	add    eax,0x384403
    1089:	30 13                	xor    BYTE PTR [ebx],dl
    108b:	48                   	dec    eax
    108c:	00 00                	add    BYTE PTR [eax],al
    108e:	00 06                	add    BYTE PTR [esi],al
    1090:	37                   	aaa    
    1091:	e8 00 00 00 05       	call   5001096 <sysEnter_Vector+0x4ed1096>
    1096:	03 50 38             	add    edx,DWORD PTR [eax+0x38]
    1099:	00 30                	add    BYTE PTR [eax],dh
    109b:	00 de                	add    dh,bl
    109d:	01 00                	add    DWORD PTR [eax],eax
    109f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    10a2:	75 06                	jne    10aa <sysEnter_Vector-0x12ef56>
    10a4:	00 00                	add    BYTE PTR [eax],al
    10a6:	04 01                	add    al,0x1
    10a8:	ef                   	out    dx,eax
    10a9:	00 00                	add    BYTE PTR [eax],al
    10ab:	00 0c fb             	add    BYTE PTR [ebx+edi*8],cl
    10ae:	05 00 00 6d 00       	add    eax,0x6d0000
    10b3:	00 00                	add    BYTE PTR [eax],al
    10b5:	1c 0b                	sbb    al,0xb
    10b7:	00 30                	add    BYTE PTR [eax],dh
    10b9:	9b                   	fwait
    10ba:	01 00                	add    DWORD PTR [eax],eax
    10bc:	00 82 07 00 00 02    	add    BYTE PTR [edx+0x2000007],al
    10c2:	01 08                	add    DWORD PTR [eax],ecx
    10c4:	4f                   	dec    edi
    10c5:	00 00                	add    BYTE PTR [eax],al
    10c7:	00 02                	add    BYTE PTR [edx],al
    10c9:	02 07                	add    al,BYTE PTR [edi]
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
    113f:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
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
    1158:	0d 06 00 00 01       	or     eax,0x1000006
    115d:	0a 72 00             	or     dh,BYTE PTR [edx+0x0]
    1160:	00 00                	add    BYTE PTR [eax],al
    1162:	1c 0b                	sbb    al,0xb
    1164:	00 30                	add    BYTE PTR [eax],dh
    1166:	9b                   	fwait
    1167:	01 00                	add    DWORD PTR [eax],eax
    1169:	00 01                	add    BYTE PTR [ecx],al
    116b:	9c                   	pushf  
    116c:	85 01                	test   DWORD PTR [ecx],eax
    116e:	00 00                	add    BYTE PTR [eax],al
    1170:	09 08                	or     DWORD PTR [eax],ecx
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
    11b2:	0c 4e                	or     al,0x4e
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
    11d8:	0c d1                	or     al,0xd1
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
    11fc:	68 00 0d 4a 0c       	push   0xc4a0d00
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
    123d:	00 05 33 81 00 00    	add    BYTE PTR ds:0x8133,al
    1243:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
    1249:	30 0f                	xor    BYTE PTR [edi],cl
    124b:	aa                   	stos   BYTE PTR es:[edi],al
    124c:	00 00                	add    BYTE PTR [eax],al
    124e:	00 05 34 81 00 00    	add    BYTE PTR ds:0x8134,al
    1254:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
    125a:	30 0f                	xor    BYTE PTR [edi],cl
    125c:	56                   	push   esi
    125d:	01 00                	add    DWORD PTR [eax],eax
    125f:	00 05 35 81 00 00    	add    BYTE PTR ds:0x8135,al
    1265:	00 05 03 44 38 00    	add    BYTE PTR ds:0x384403,al
    126b:	30 0f                	xor    BYTE PTR [edi],cl
    126d:	48                   	dec    eax
    126e:	00 00                	add    BYTE PTR [eax],al
    1270:	00 06                	add    BYTE PTR [esi],al
    1272:	37                   	aaa    
    1273:	8c 00                	mov    WORD PTR [eax],es
    1275:	00 00                	add    BYTE PTR [eax],al
    1277:	05 03 50 38 00       	add    eax,0x385003
    127c:	30 00                	xor    BYTE PTR [eax],al
    127e:	19 02                	sbb    DWORD PTR [edx],eax
    1280:	00 00                	add    BYTE PTR [eax],al
    1282:	04 00                	add    al,0x0
    1284:	36                   	ss
    1285:	07                   	pop    es
    1286:	00 00                	add    BYTE PTR [eax],al
    1288:	04 01                	add    al,0x1
    128a:	ef                   	out    dx,eax
    128b:	00 00                	add    BYTE PTR [eax],al
    128d:	00 0c 20             	add    BYTE PTR [eax+eiz*1],cl
    1290:	06                   	push   es
    1291:	00 00                	add    BYTE PTR [eax],al
    1293:	6d                   	ins    DWORD PTR es:[edi],dx
    1294:	00 00                	add    BYTE PTR [eax],al
    1296:	00 b8 0c 00 30 8e    	add    BYTE PTR [eax-0x71cffff4],bh
    129c:	01 00                	add    DWORD PTR [eax],eax
    129e:	00 73 08             	add    BYTE PTR [ebx+0x8],dh
    12a1:	00 00                	add    BYTE PTR [eax],al
    12a3:	02 01                	add    al,BYTE PTR [ecx]
    12a5:	06                   	push   es
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
    12c6:	04 77                	add    al,0x77
    12c8:	05 00 00 02 2e       	add    eax,0x2e020000
    12cd:	53                   	push   ebx
    12ce:	00 00                	add    BYTE PTR [eax],al
    12d0:	00 02                	add    BYTE PTR [edx],al
    12d2:	01 08                	add    DWORD PTR [eax],ecx
    12d4:	4f                   	dec    edi
    12d5:	00 00                	add    BYTE PTR [eax],al
    12d7:	00 04 3a             	add    BYTE PTR [edx+edi*1],al
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
    1303:	04 a5                	add    al,0xa5
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
    133c:	05 04 06 19 06       	add    eax,0x6190604
    1341:	00 00                	add    BYTE PTR [eax],al
    1343:	01 08                	add    DWORD PTR [eax],ecx
    1345:	be 00 00 00 b8       	mov    esi,0xb8000000
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
    1399:	14 06                	adc    al,0x6
    139b:	00 00                	add    BYTE PTR [eax],al
    139d:	01 0c 5a             	add    DWORD PTR [edx+ebx*2],ecx
    13a0:	00 00                	add    BYTE PTR [eax],al
    13a2:	00 02                	add    BYTE PTR [edx],al
    13a4:	91                   	xchg   ecx,eax
    13a5:	6a 08                	push   0x8
    13a7:	66                   	data16
    13a8:	00 01                	add    BYTE PTR [ecx],al
    13aa:	0d 4f 01 00 00       	or     eax,0x14f
    13af:	02 91 6c 09 2d 06    	add    dl,BYTE PTR [ecx+0x62d096c]
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
    13d4:	32 06                	xor    al,BYTE PTR [esi]
    13d6:	00 00                	add    BYTE PTR [eax],al
    13d8:	01 1f                	add    DWORD PTR [edi],ebx
    13da:	be 00 00 00 7f       	mov    esi,0x7f000000
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
    142a:	02 91 70 09 14 06    	add    dl,BYTE PTR [ecx+0x6140970]
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
    1447:	09 2d 06 00 00 01    	or     DWORD PTR ds:0x1000006,ebp
    144d:	25 6c 00 00 00       	and    eax,0x6c
    1452:	02 91 64 00 0b 3f    	add    dl,BYTE PTR [ecx+0x3f0b0064]
    1458:	00 00                	add    BYTE PTR [eax],al
    145a:	00 05 33 6c 00 00    	add    BYTE PTR ds:0x6c33,al
    1460:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
    1466:	30 0b                	xor    BYTE PTR [ebx],cl
    1468:	aa                   	stos   BYTE PTR es:[edi],al
    1469:	00 00                	add    BYTE PTR [eax],al
    146b:	00 05 34 6c 00 00    	add    BYTE PTR ds:0x6c34,al
    1471:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
    1477:	30 0b                	xor    BYTE PTR [ebx],cl
    1479:	56                   	push   esi
    147a:	01 00                	add    DWORD PTR [eax],eax
    147c:	00 05 35 6c 00 00    	add    BYTE PTR ds:0x6c35,al
    1482:	00 05 03 44 38 00    	add    BYTE PTR ds:0x384403,al
    1488:	30 0b                	xor    BYTE PTR [ebx],cl
    148a:	48                   	dec    eax
    148b:	00 00                	add    BYTE PTR [eax],al
    148d:	00 06                	add    BYTE PTR [esi],al
    148f:	37                   	aaa    
    1490:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
    1491:	00 00                	add    BYTE PTR [eax],al
    1493:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
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
    14aa:	00 0c 5f             	add    BYTE PTR [edi+ebx*2],cl
    14ad:	06                   	push   es
    14ae:	00 00                	add    BYTE PTR [eax],al
    14b0:	6d                   	ins    DWORD PTR es:[edi],dx
    14b1:	00 00                	add    BYTE PTR [eax],al
    14b3:	00 48 0e             	add    BYTE PTR [eax+0xe],cl
    14b6:	00 30                	add    BYTE PTR [eax],dh
    14b8:	10 00                	adc    BYTE PTR [eax],al
    14ba:	00 00                	add    BYTE PTR [eax],al
    14bc:	5b                   	pop    ebx
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
    150a:	04 a5                	add    al,0xa5
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
    1543:	05 04 04 48 06       	add    eax,0x6480404
    1548:	00 00                	add    BYTE PTR [eax],al
    154a:	05 15 7a 00 00       	add    eax,0x7a15
    154f:	00 06                	add    BYTE PTR [esi],al
    1551:	5a                   	pop    edx
    1552:	06                   	push   es
    1553:	00 00                	add    BYTE PTR [eax],al
    1555:	01 09                	add    DWORD PTR [ecx],ecx
    1557:	a8 00                	test   al,0x0
    1559:	00 00                	add    BYTE PTR [eax],al
    155b:	48                   	dec    eax
    155c:	0e                   	push   cs
    155d:	00 30                	add    BYTE PTR [eax],dh
    155f:	10 00                	adc    BYTE PTR [eax],al
    1561:	00 00                	add    BYTE PTR [eax],al
    1563:	01 9c 22 01 00 00 07 	add    DWORD PTR [edx+eiz*1+0x7000001],ebx
    156a:	43                   	inc    ebx
    156b:	06                   	push   es
    156c:	00 00                	add    BYTE PTR [eax],al
    156e:	01 09                	add    DWORD PTR [ecx],ecx
    1570:	a8 00                	test   al,0x0
    1572:	00 00                	add    BYTE PTR [eax],al
    1574:	02 91 00 08 6c 65    	add    dl,BYTE PTR [ecx+0x656c0800]
    157a:	6e                   	outs   dx,BYTE PTR ds:[esi]
    157b:	00 01                	add    BYTE PTR [ecx],al
    157d:	09 6f 00             	or     DWORD PTR [edi+0x0],ebp
    1580:	00 00                	add    BYTE PTR [eax],al
    1582:	02 91 04 07 4e 06    	add    dl,BYTE PTR [ecx+0x64e0704]
    1588:	00 00                	add    BYTE PTR [eax],al
    158a:	01 09                	add    DWORD PTR [ecx],ecx
    158c:	3a 00                	cmp    al,BYTE PTR [eax]
    158e:	00 00                	add    BYTE PTR [eax],al
    1590:	02 91 08 07 a9 07    	add    dl,BYTE PTR [ecx+0x7a90708]
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
    15af:	53                   	push   ebx
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
    15c3:	33 56 00             	xor    edx,DWORD PTR [esi+0x0]
    15c6:	00 00                	add    BYTE PTR [eax],al
    15c8:	05 03 48 38 00       	add    eax,0x384803
    15cd:	30 09                	xor    BYTE PTR [ecx],cl
    15cf:	aa                   	stos   BYTE PTR es:[edi],al
    15d0:	00 00                	add    BYTE PTR [eax],al
    15d2:	00 06                	add    BYTE PTR [esi],al
    15d4:	34 56                	xor    al,0x56
    15d6:	00 00                	add    BYTE PTR [eax],al
    15d8:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
    15de:	30 09                	xor    BYTE PTR [ecx],cl
    15e0:	56                   	push   esi
    15e1:	01 00                	add    DWORD PTR [eax],eax
    15e3:	00 06                	add    BYTE PTR [esi],al
    15e5:	35 56 00 00 00       	xor    eax,0x56
    15ea:	05 03 44 38 00       	add    eax,0x384403
    15ef:	30 09                	xor    BYTE PTR [ecx],cl
    15f1:	48                   	dec    eax
    15f2:	00 00                	add    BYTE PTR [eax],al
    15f4:	00 07                	add    BYTE PTR [edi],al
    15f6:	37                   	aaa    
    15f7:	8f 00                	pop    DWORD PTR [eax]
    15f9:	00 00                	add    BYTE PTR [eax],al
    15fb:	05 03 50 38 00       	add    eax,0x385003
    1600:	30 00                	xor    BYTE PTR [eax],al
    1602:	f9                   	stc    
    1603:	05 00 00 04 00       	add    eax,0x40000
    1608:	60                   	pusha  
    1609:	08 00                	or     BYTE PTR [eax],al
    160b:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    160e:	ef                   	out    dx,eax
    160f:	00 00                	add    BYTE PTR [eax],al
    1611:	00 0c d6             	add    BYTE PTR [esi+edx*8],cl
    1614:	06                   	push   es
    1615:	00 00                	add    BYTE PTR [eax],al
    1617:	6d                   	ins    DWORD PTR es:[edi],dx
    1618:	00 00                	add    BYTE PTR [eax],al
    161a:	00 58 0e             	add    BYTE PTR [eax+0xe],bl
    161d:	00 30                	add    BYTE PTR [eax],dh
    161f:	60                   	pusha  
    1620:	02 00                	add    al,BYTE PTR [eax]
    1622:	00 28                	add    BYTE PTR [eax],ch
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
    166a:	04 70                	add    al,0x70
    166c:	06                   	push   es
    166d:	00 00                	add    BYTE PTR [eax],al
    166f:	02 37                	add    dh,BYTE PTR [edi]
    1671:	73 00                	jae    1673 <sysEnter_Vector-0x12e98d>
    1673:	00 00                	add    BYTE PTR [eax],al
    1675:	02 08                	add    cl,BYTE PTR [eax]
    1677:	07                   	pop    es
    1678:	28 00                	sub    BYTE PTR [eax],al
    167a:	00 00                	add    BYTE PTR [eax],al
    167c:	04 a5                	add    al,0xa5
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
    16c9:	7c 07                	jl     16d2 <sysEnter_Vector-0x12e92e>
    16cb:	00 00                	add    BYTE PTR [eax],al
    16cd:	0c 05                	or     al,0x5
    16cf:	17                   	pop    ss
    16d0:	f7 00 00 00 09 93    	test   DWORD PTR [eax],0x93090000
    16d6:	06                   	push   es
    16d7:	00 00                	add    BYTE PTR [eax],al
    16d9:	05 19 f7 00 00       	add    eax,0xf719
    16de:	00 00                	add    BYTE PTR [eax],al
    16e0:	09 ec                	or     esp,ebp
    16e2:	05 00 00 05 19       	add    eax,0x19050000
    16e7:	f7 00 00 00 04 09    	test   DWORD PTR [eax],0x9040000
    16ed:	74 07                	je     16f6 <sysEnter_Vector-0x12e90a>
    16ef:	00 00                	add    BYTE PTR [eax],al
    16f1:	05 1a be 00 00       	add    eax,0xbe1a
    16f6:	00 08                	add    BYTE PTR [eax],cl
    16f8:	00 05 04 c6 00 00    	add    BYTE PTR ds:0xc604,al
    16fe:	00 04 05 07 00 00 05 	add    BYTE PTR [eax*1+0x5000007],al
    1705:	1b c6                	sbb    eax,esi
    1707:	00 00                	add    BYTE PTR [eax],al
    1709:	00 08                	add    BYTE PTR [eax],cl
    170b:	b1 06                	mov    cl,0x6
    170d:	00 00                	add    BYTE PTR [eax],al
    170f:	14 06                	adc    al,0x6
    1711:	1b 39                	sbb    edi,DWORD PTR [ecx]
    1713:	01 00                	add    DWORD PTR [eax],eax
    1715:	00 09                	add    BYTE PTR [ecx],cl
    1717:	aa                   	stos   BYTE PTR es:[edi],al
    1718:	06                   	push   es
    1719:	00 00                	add    BYTE PTR [eax],al
    171b:	06                   	push   es
    171c:	1d fd 00 00 00       	sbb    eax,0xfd
    1721:	00 09                	add    BYTE PTR [ecx],cl
    1723:	6a 06                	push   0x6
    1725:	00 00                	add    BYTE PTR [eax],al
    1727:	06                   	push   es
    1728:	1e                   	push   ds
    1729:	61                   	popa   
    172a:	00 00                	add    BYTE PTR [eax],al
    172c:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
    172f:	e7 07                	out    0x7,eax
    1731:	00 00                	add    BYTE PTR [eax],al
    1733:	06                   	push   es
    1734:	1f                   	pop    ds
    1735:	6a 01                	push   0x1
    1737:	00 00                	add    BYTE PTR [eax],al
    1739:	10 00                	adc    BYTE PTR [eax],al
    173b:	08 e2                	or     dl,ah
    173d:	06                   	push   es
    173e:	00 00                	add    BYTE PTR [eax],al
    1740:	0c 06                	or     al,0x6
    1742:	37                   	aaa    
    1743:	6a 01                	push   0x1
    1745:	00 00                	add    BYTE PTR [eax],al
    1747:	09 cf                	or     edi,ecx
    1749:	06                   	push   es
    174a:	00 00                	add    BYTE PTR [eax],al
    174c:	06                   	push   es
    174d:	39 c0                	cmp    eax,eax
    174f:	00 00                	add    BYTE PTR [eax],al
    1751:	00 00                	add    BYTE PTR [eax],al
    1753:	09 ee                	or     esi,ebp
    1755:	07                   	pop    es
    1756:	00 00                	add    BYTE PTR [eax],al
    1758:	06                   	push   es
    1759:	3a 73 02             	cmp    dh,BYTE PTR [ebx+0x2]
    175c:	00 00                	add    BYTE PTR [eax],al
    175e:	04 09                	add    al,0x9
    1760:	04 08                	add    al,0x8
    1762:	00 00                	add    BYTE PTR [eax],al
    1764:	06                   	push   es
    1765:	3b 6a 01             	cmp    ebp,DWORD PTR [edx+0x1]
    1768:	00 00                	add    BYTE PTR [eax],al
    176a:	08 00                	or     BYTE PTR [eax],al
    176c:	05 04 39 01 00       	add    eax,0x13904
    1771:	00 08                	add    BYTE PTR [eax],cl
    1773:	bf 06 00 00 0c       	mov    edi,0xc000006
    1778:	06                   	push   es
    1779:	22 a1 01 00 00 09    	and    ah,BYTE PTR [ecx+0x9000001]
    177f:	8b 07                	mov    eax,DWORD PTR [edi]
    1781:	00 00                	add    BYTE PTR [eax],al
    1783:	06                   	push   es
    1784:	24 6a                	and    al,0x6a
    1786:	01 00                	add    DWORD PTR [eax],eax
    1788:	00 00                	add    BYTE PTR [eax],al
    178a:	09 a3 06 00 00 06    	or     DWORD PTR [ebx+0x6000006],esp
    1790:	25 a1 01 00 00       	and    eax,0x1a1
    1795:	04 09                	add    al,0x9
    1797:	79 06                	jns    179f <sysEnter_Vector-0x12e861>
    1799:	00 00                	add    BYTE PTR [eax],al
    179b:	06                   	push   es
    179c:	26 3a 00             	cmp    al,BYTE PTR es:[eax]
    179f:	00 00                	add    BYTE PTR [eax],al
    17a1:	08 00                	or     BYTE PTR [eax],al
    17a3:	05 04 08 01 00       	add    eax,0x10804
    17a8:	00 08                	add    BYTE PTR [eax],cl
    17aa:	f0 07                	lock pop es
    17ac:	00 00                	add    BYTE PTR [eax],al
    17ae:	24 06                	and    al,0x6
    17b0:	29 14 02             	sub    DWORD PTR [edx+eax*1],edx
    17b3:	00 00                	add    BYTE PTR [eax],al
    17b5:	09 4f 07             	or     DWORD PTR [edi+0x7],ecx
    17b8:	00 00                	add    BYTE PTR [eax],al
    17ba:	06                   	push   es
    17bb:	2b 61 00             	sub    esp,DWORD PTR [ecx+0x0]
    17be:	00 00                	add    BYTE PTR [eax],al
    17c0:	00 09                	add    BYTE PTR [ecx],cl
    17c2:	be 07 00 00 06       	mov    esi,0x6000007
    17c7:	2c 4f                	sub    al,0x4f
    17c9:	00 00                	add    BYTE PTR [eax],al
    17cb:	00 04 09             	add    BYTE PTR [ecx+ecx*1],al
    17ce:	2b 07                	sub    eax,DWORD PTR [edi]
    17d0:	00 00                	add    BYTE PTR [eax],al
    17d2:	06                   	push   es
    17d3:	2d 4f 00 00 00       	sub    eax,0x4f
    17d8:	06                   	push   es
    17d9:	09 b8 07 00 00 06    	or     DWORD PTR [eax+0x6000007],edi
    17df:	2e                   	cs
    17e0:	61                   	popa   
    17e1:	00 00                	add    BYTE PTR [eax],al
    17e3:	00 08                	add    BYTE PTR [eax],cl
    17e5:	09 ff                	or     edi,edi
    17e7:	06                   	push   es
    17e8:	00 00                	add    BYTE PTR [eax],al
    17ea:	06                   	push   es
    17eb:	2f                   	das    
    17ec:	61                   	popa   
    17ed:	00 00                	add    BYTE PTR [eax],al
    17ef:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
    17f2:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
    17f3:	07                   	pop    es
    17f4:	00 00                	add    BYTE PTR [eax],al
    17f6:	06                   	push   es
    17f7:	30 61 00             	xor    BYTE PTR [ecx+0x0],ah
    17fa:	00 00                	add    BYTE PTR [eax],al
    17fc:	10 09                	adc    BYTE PTR [ecx],cl
    17fe:	86 07                	xchg   BYTE PTR [edi],al
    1800:	00 00                	add    BYTE PTR [eax],al
    1802:	06                   	push   es
    1803:	31 5d 02             	xor    DWORD PTR [ebp+0x2],ebx
    1806:	00 00                	add    BYTE PTR [eax],al
    1808:	14 09                	adc    al,0x9
    180a:	bd 06 00 00 06       	mov    ebp,0x6000006
    180f:	32 70 01             	xor    dh,BYTE PTR [eax+0x1]
    1812:	00 00                	add    BYTE PTR [eax],al
    1814:	18 00                	sbb    BYTE PTR [eax],al
    1816:	08 1a                	or     BYTE PTR [edx],bl
    1818:	07                   	pop    es
    1819:	00 00                	add    BYTE PTR [eax],al
    181b:	14 06                	adc    al,0x6
    181d:	3e                   	ds
    181e:	5d                   	pop    ebp
    181f:	02 00                	add    al,BYTE PTR [eax]
    1821:	00 09                	add    BYTE PTR [ecx],cl
    1823:	26 08 00             	or     BYTE PTR es:[eax],al
    1826:	00 06                	add    BYTE PTR [esi],al
    1828:	40                   	inc    eax
    1829:	8d 02                	lea    eax,[edx]
    182b:	00 00                	add    BYTE PTR [eax],al
    182d:	00 09                	add    BYTE PTR [ecx],cl
    182f:	98                   	cwde   
    1830:	06                   	push   es
    1831:	00 00                	add    BYTE PTR [eax],al
    1833:	06                   	push   es
    1834:	41                   	inc    ecx
    1835:	8d 02                	lea    eax,[edx]
    1837:	00 00                	add    BYTE PTR [eax],al
    1839:	04 09                	add    al,0x9
    183b:	f9                   	stc    
    183c:	06                   	push   es
    183d:	00 00                	add    BYTE PTR [eax],al
    183f:	06                   	push   es
    1840:	42                   	inc    edx
    1841:	8d 02                	lea    eax,[edx]
    1843:	00 00                	add    BYTE PTR [eax],al
    1845:	08 09                	or     BYTE PTR [ecx],cl
    1847:	8d 06                	lea    eax,[esi]
    1849:	00 00                	add    BYTE PTR [eax],al
    184b:	06                   	push   es
    184c:	43                   	inc    ebx
    184d:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
    184e:	02 00                	add    al,BYTE PTR [eax]
    1850:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
    1853:	c8 06 00 00          	enter  0x6,0x0
    1857:	06                   	push   es
    1858:	44                   	inc    esp
    1859:	d0 02                	rol    BYTE PTR [edx],1
    185b:	00 00                	add    BYTE PTR [eax],al
    185d:	10 00                	adc    BYTE PTR [eax],al
    185f:	05 04 63 02 00       	add    eax,0x26304
    1864:	00 06                	add    BYTE PTR [esi],al
    1866:	14 02                	adc    al,0x2
    1868:	00 00                	add    BYTE PTR [eax],al
    186a:	04 d2                	add    al,0xd2
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
    18d7:	00 04 a0             	add    BYTE PTR [eax+eiz*4],al
    18da:	07                   	pop    es
    18db:	00 00                	add    BYTE PTR [eax],al
    18dd:	06                   	push   es
    18de:	47                   	inc    edi
    18df:	e1 02                	loope  18e3 <sysEnter_Vector-0x12e71d>
    18e1:	00 00                	add    BYTE PTR [eax],al
    18e3:	08 e2                	or     dl,ah
    18e5:	07                   	pop    es
    18e6:	00 00                	add    BYTE PTR [eax],al
    18e8:	10 06                	adc    BYTE PTR [esi],al
    18ea:	4f                   	dec    edi
    18eb:	12 03                	adc    al,BYTE PTR [ebx]
    18ed:	00 00                	add    BYTE PTR [eax],al
    18ef:	09 15 08 00 00 06    	or     DWORD PTR ds:0x6000008,edx
    18f5:	51                   	push   ecx
    18f6:	c0 00 00             	rol    BYTE PTR [eax],0x0
    18f9:	00 00                	add    BYTE PTR [eax],al
    18fb:	09 0d 08 00 00 06    	or     DWORD PTR ds:0x6000008,ecx
    1901:	52                   	push   edx
    1902:	73 02                	jae    1906 <sysEnter_Vector-0x12e6fa>
    1904:	00 00                	add    BYTE PTR [eax],al
    1906:	04 09                	add    al,0x9
    1908:	9b                   	fwait
    1909:	07                   	pop    es
    190a:	00 00                	add    BYTE PTR [eax],al
    190c:	06                   	push   es
    190d:	53                   	push   ebx
    190e:	12 03                	adc    al,BYTE PTR [ebx]
    1910:	00 00                	add    BYTE PTR [eax],al
    1912:	08 00                	or     BYTE PTR [eax],al
    1914:	08 e9                	or     cl,ch
    1916:	06                   	push   es
    1917:	00 00                	add    BYTE PTR [eax],al
    1919:	08 06                	or     BYTE PTR [esi],al
    191b:	49                   	dec    ecx
    191c:	37                   	aaa    
    191d:	03 00                	add    eax,DWORD PTR [eax]
    191f:	00 09                	add    BYTE PTR [ecx],cl
    1921:	f6 07 00             	test   BYTE PTR [edi],0x0
    1924:	00 06                	add    BYTE PTR [esi],al
    1926:	4b                   	dec    ebx
    1927:	61                   	popa   
    1928:	03 00                	add    eax,DWORD PTR [eax]
    192a:	00 00                	add    BYTE PTR [eax],al
    192c:	09 5c 07 00          	or     DWORD PTR [edi+eax*1+0x0],ebx
    1930:	00 06                	add    BYTE PTR [esi],al
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
    198c:	00 04 35 07 00 00 06 	add    BYTE PTR [esi*1+0x6000007],al
    1993:	4d                   	dec    ebp
    1994:	12 03                	adc    al,BYTE PTR [ebx]
    1996:	00 00                	add    BYTE PTR [eax],al
    1998:	0c 0e                	or     al,0xe
    199a:	07                   	pop    es
    199b:	00 00                	add    BYTE PTR [eax],al
    199d:	01 12                	add    DWORD PTR [edx],edx
    199f:	7a 00                	jp     19a1 <sysEnter_Vector-0x12e65f>
    19a1:	00 00                	add    BYTE PTR [eax],al
    19a3:	58                   	pop    eax
    19a4:	0e                   	push   cs
    19a5:	00 30                	add    BYTE PTR [eax],dh
    19a7:	2c 00                	sub    al,0x0
    19a9:	00 00                	add    BYTE PTR [eax],al
    19ab:	01 9c e8 03 00 00 0d 	add    DWORD PTR [eax+ebp*8+0xd000003],ebx
    19b2:	62 07                	bound  eax,QWORD PTR [edi]
    19b4:	00 00                	add    BYTE PTR [eax],al
    19b6:	01 12                	add    DWORD PTR [edx],edx
    19b8:	55                   	push   ebp
    19b9:	03 00                	add    eax,DWORD PTR [eax]
    19bb:	00 02                	add    BYTE PTR [edx],al
    19bd:	91                   	xchg   ecx,eax
    19be:	00 0d 33 02 00 00    	add    BYTE PTR ds:0x233,cl
    19c4:	01 12                	add    DWORD PTR [edx],edx
    19c6:	c0 00 00             	rol    BYTE PTR [eax],0x0
    19c9:	00 02                	add    BYTE PTR [edx],al
    19cb:	91                   	xchg   ecx,eax
    19cc:	04 0d                	add    al,0xd
    19ce:	ca 03 00             	retf   0x3
    19d1:	00 01                	add    BYTE PTR [ecx],al
    19d3:	12 7a 00             	adc    bh,BYTE PTR [edx+0x0]
    19d6:	00 00                	add    BYTE PTR [eax],al
    19d8:	02 91 08 0d af 07    	add    dl,BYTE PTR [ecx+0x7af0d08]
    19de:	00 00                	add    BYTE PTR [eax],al
    19e0:	01 12                	add    DWORD PTR [edx],edx
    19e2:	5b                   	pop    ebx
    19e3:	03 00                	add    eax,DWORD PTR [eax]
    19e5:	00 02                	add    BYTE PTR [edx],al
    19e7:	91                   	xchg   ecx,eax
    19e8:	0c 00                	or     al,0x0
    19ea:	0c 67                	or     al,0x67
    19ec:	07                   	pop    es
    19ed:	00 00                	add    BYTE PTR [eax],al
    19ef:	01 17                	add    DWORD PTR [edi],edx
    19f1:	7a 00                	jp     19f3 <sysEnter_Vector-0x12e60d>
    19f3:	00 00                	add    BYTE PTR [eax],al
    19f5:	84 0e                	test   BYTE PTR [esi],cl
    19f7:	00 30                	add    BYTE PTR [eax],dh
    19f9:	26 00 00             	add    BYTE PTR es:[eax],al
    19fc:	00 01                	add    BYTE PTR [ecx],al
    19fe:	9c                   	pushf  
    19ff:	3a 04 00             	cmp    al,BYTE PTR [eax+eax*1]
    1a02:	00 0d 62 07 00 00    	add    BYTE PTR ds:0x762,cl
    1a08:	01 17                	add    DWORD PTR [edi],edx
    1a0a:	55                   	push   ebp
    1a0b:	03 00                	add    eax,DWORD PTR [eax]
    1a0d:	00 02                	add    BYTE PTR [edx],al
    1a0f:	91                   	xchg   ecx,eax
    1a10:	00 0d 33 02 00 00    	add    BYTE PTR ds:0x233,cl
    1a16:	01 17                	add    DWORD PTR [edi],edx
    1a18:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
    1a19:	00 00                	add    BYTE PTR [eax],al
    1a1b:	00 02                	add    BYTE PTR [edx],al
    1a1d:	91                   	xchg   ecx,eax
    1a1e:	04 0d                	add    al,0xd
    1a20:	ca 03 00             	retf   0x3
    1a23:	00 01                	add    BYTE PTR [ecx],al
    1a25:	17                   	pop    ss
    1a26:	7a 00                	jp     1a28 <sysEnter_Vector-0x12e5d8>
    1a28:	00 00                	add    BYTE PTR [eax],al
    1a2a:	02 91 08 0d af 07    	add    dl,BYTE PTR [ecx+0x7af0d08]
    1a30:	00 00                	add    BYTE PTR [eax],al
    1a32:	01 17                	add    DWORD PTR [edi],edx
    1a34:	5b                   	pop    ebx
    1a35:	03 00                	add    eax,DWORD PTR [eax]
    1a37:	00 02                	add    BYTE PTR [edx],al
    1a39:	91                   	xchg   ecx,eax
    1a3a:	0c 00                	or     al,0x0
    1a3c:	0e                   	push   cs
    1a3d:	55                   	push   ebp
    1a3e:	07                   	pop    es
    1a3f:	00 00                	add    BYTE PTR [eax],al
    1a41:	01 1c aa             	add    DWORD PTR [edx+ebp*4],ebx
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
    1a6e:	9e                   	sahf   
    1a6f:	06                   	push   es
    1a70:	00 00                	add    BYTE PTR [eax],al
    1a72:	01 1e                	add    DWORD PTR [esi],ebx
    1a74:	05 05 00 00 02       	add    eax,0x2000005
    1a79:	91                   	xchg   ecx,eax
    1a7a:	56                   	push   esi
    1a7b:	10 1c 08             	adc    BYTE PTR [eax+ecx*1],bl
    1a7e:	00 00                	add    BYTE PTR [eax],al
    1a80:	01 1f                	add    DWORD PTR [edi],ebx
    1a82:	15 05 00 00 02       	adc    eax,0x2000005
    1a87:	91                   	xchg   ecx,eax
    1a88:	53                   	push   ebx
    1a89:	10 83 06 00 00 01    	adc    BYTE PTR [ebx+0x1000006],al
    1a8f:	1f                   	pop    ds
    1a90:	15 05 00 00 02       	adc    eax,0x2000005
    1a95:	91                   	xchg   ecx,eax
    1a96:	50                   	push   eax
    1a97:	10 47 07             	adc    BYTE PTR [edi+0x7],al
    1a9a:	00 00                	add    BYTE PTR [eax],al
    1a9c:	01 20                	add    DWORD PTR [eax],esp
    1a9e:	3a 00                	cmp    al,BYTE PTR [eax]
    1aa0:	00 00                	add    BYTE PTR [eax],al
    1aa2:	02 91 6c 11 32 06    	add    dl,BYTE PTR [ecx+0x632116c]
    1aa8:	00 00                	add    BYTE PTR [eax],al
    1aaa:	01 23                	add    DWORD PTR [ebx],esp
    1aac:	3a 00                	cmp    al,BYTE PTR [eax]
    1aae:	00 00                	add    BYTE PTR [eax],al
    1ab0:	b4 04                	mov    ah,0x4
    1ab2:	00 00                	add    BYTE PTR [eax],al
    1ab4:	12 00                	adc    al,BYTE PTR [eax]
    1ab6:	13 16                	adc    edx,DWORD PTR [esi]
    1ab8:	0f 00                	(bad)  
    1aba:	30 3d 00 00 00 d0    	xor    BYTE PTR ds:0xd0000000,bh
    1ac0:	04 00                	add    al,0x0
    1ac2:	00 14 63             	add    BYTE PTR [ebx+eiz*2],dl
    1ac5:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1ac6:	74 00                	je     1ac8 <sysEnter_Vector-0x12e538>
    1ac8:	01 2d 3a 00 00 00    	add    DWORD PTR ds:0x3a,ebp
    1ace:	02 91 68 00 13 61    	add    dl,BYTE PTR [ecx+0x61130068]
    1ad4:	0f 00                	(bad)  
    1ad6:	30 3d 00 00 00 ec    	xor    BYTE PTR ds:0xec000000,bh
    1adc:	04 00                	add    al,0x0
    1ade:	00 14 63             	add    BYTE PTR [ebx+eiz*2],dl
    1ae1:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1ae2:	74 00                	je     1ae4 <sysEnter_Vector-0x12e51c>
    1ae4:	01 33                	add    DWORD PTR [ebx],esi
    1ae6:	3a 00                	cmp    al,BYTE PTR [eax]
    1ae8:	00 00                	add    BYTE PTR [eax],al
    1aea:	02 91 64 00 15 ac    	add    dl,BYTE PTR [ecx-0x53eaff9c]
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
    1b28:	fb                   	sti    
    1b29:	07                   	pop    es
    1b2a:	00 00                	add    BYTE PTR [eax],al
    1b2c:	01 42 e1             	add    DWORD PTR [edx-0x1f],eax
    1b2f:	0f 00                	(bad)  
    1b31:	30 84 00 00 00 01 9c 	xor    BYTE PTR [eax+eax*1-0x63ff0000],al
    1b38:	64                   	fs
    1b39:	05 00 00 10 9e       	add    eax,0x9e100000
    1b3e:	06                   	push   es
    1b3f:	00 00                	add    BYTE PTR [eax],al
    1b41:	01 44 64 05          	add    DWORD PTR [esp+eiz*2+0x5],eax
    1b45:	00 00                	add    BYTE PTR [eax],al
    1b47:	02 91 67 10 47 07    	add    dl,BYTE PTR [ecx+0x7471067]
    1b4d:	00 00                	add    BYTE PTR [eax],al
    1b4f:	01 45 3a             	add    DWORD PTR [ebp+0x3a],eax
    1b52:	00 00                	add    BYTE PTR [eax],al
    1b54:	00 02                	add    BYTE PTR [edx],al
    1b56:	91                   	xchg   ecx,eax
    1b57:	6c                   	ins    BYTE PTR es:[edi],dx
    1b58:	19 32                	sbb    DWORD PTR [edx],esi
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
    1b76:	1a 94 07 00 00 01 54 	sbb    dl,BYTE PTR [edi+eax*1+0x54010000]
    1b7d:	65 10 00             	adc    BYTE PTR gs:[eax],al
    1b80:	30 53 00             	xor    BYTE PTR [ebx+0x0],dl
    1b83:	00 00                	add    BYTE PTR [eax],al
    1b85:	01 9c 1b 3f 00 00 00 	add    DWORD PTR [ebx+ebx*1+0x3f],ebx
    1b8c:	07                   	pop    es
    1b8d:	33 56 00             	xor    edx,DWORD PTR [esi+0x0]
    1b90:	00 00                	add    BYTE PTR [eax],al
    1b92:	05 03 48 38 00       	add    eax,0x384803
    1b97:	30 1b                	xor    BYTE PTR [ebx],bl
    1b99:	aa                   	stos   BYTE PTR es:[edi],al
    1b9a:	00 00                	add    BYTE PTR [eax],al
    1b9c:	00 07                	add    BYTE PTR [edi],al
    1b9e:	34 56                	xor    al,0x56
    1ba0:	00 00                	add    BYTE PTR [eax],al
    1ba2:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
    1ba8:	30 1b                	xor    BYTE PTR [ebx],bl
    1baa:	56                   	push   esi
    1bab:	01 00                	add    DWORD PTR [eax],eax
    1bad:	00 07                	add    BYTE PTR [edi],al
    1baf:	35 56 00 00 00       	xor    eax,0x56
    1bb4:	05 03 44 38 00       	add    eax,0x384403
    1bb9:	30 1b                	xor    BYTE PTR [ebx],bl
    1bbb:	48                   	dec    eax
    1bbc:	00 00                	add    BYTE PTR [eax],al
    1bbe:	00 08                	add    BYTE PTR [eax],cl
    1bc0:	37                   	aaa    
    1bc1:	9a 00 00 00 05 03 50 	call   0x5003:0x5000000
    1bc8:	38 00                	cmp    BYTE PTR [eax],al
    1bca:	30 1b                	xor    BYTE PTR [ebx],bl
    1bcc:	9b                   	fwait
    1bcd:	07                   	pop    es
    1bce:	00 00                	add    BYTE PTR [eax],al
    1bd0:	01 0e                	add    DWORD PTR [esi],ecx
    1bd2:	8b 03                	mov    eax,DWORD PTR [ebx]
    1bd4:	00 00                	add    BYTE PTR [eax],al
    1bd6:	05 03 5c 38 00       	add    eax,0x385c03
    1bdb:	30 1b                	xor    BYTE PTR [ebx],bl
    1bdd:	c5 07                	lds    eax,FWORD PTR [edi]
    1bdf:	00 00                	add    BYTE PTR [eax],al
    1be1:	01 0f                	add    DWORD PTR [edi],ecx
    1be3:	68 02 00 00 05       	push   0x5000002
    1be8:	03 20                	add    esp,DWORD PTR [eax]
    1bea:	37                   	aaa    
    1beb:	00 30                	add    BYTE PTR [eax],dh
    1bed:	1b da                	sbb    ebx,edx
    1bef:	07                   	pop    es
    1bf0:	00 00                	add    BYTE PTR [eax],al
    1bf2:	01 10                	add    DWORD PTR [eax],edx
    1bf4:	d6                   	(bad)  
    1bf5:	02 00                	add    al,BYTE PTR [eax]
    1bf7:	00 05 03 64 38 00    	add    BYTE PTR ds:0x386403,al
    1bfd:	30 00                	xor    BYTE PTR [eax],al
    1bff:	6b 01 00             	imul   eax,DWORD PTR [ecx],0x0
    1c02:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1c05:	de 09                	fimul  WORD PTR [ecx]
    1c07:	00 00                	add    BYTE PTR [eax],al
    1c09:	04 01                	add    al,0x1
    1c0b:	ef                   	out    dx,eax
    1c0c:	00 00                	add    BYTE PTR [eax],al
    1c0e:	00 0c 40             	add    BYTE PTR [eax+eax*2],cl
    1c11:	08 00                	or     BYTE PTR [eax],al
    1c13:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1c16:	00 00                	add    BYTE PTR [eax],al
    1c18:	b8 10 00 30 ad       	mov    eax,0xad300010
    1c1d:	00 00                	add    BYTE PTR [eax],al
    1c1f:	00 7b 0b             	add    BYTE PTR [ebx+0xb],bh
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
    1cae:	2d 08 00 00 01       	sub    eax,0x1000008
    1cb3:	1d a8 00 00 00       	sbb    eax,0xa8
    1cb8:	b8 10 00 30 3e       	mov    eax,0x3e300010
    1cbd:	00 00                	add    BYTE PTR [eax],al
    1cbf:	00 01                	add    BYTE PTR [ecx],al
    1cc1:	9c                   	pushf  
    1cc2:	e4 00                	in     al,0x0
    1cc4:	00 00                	add    BYTE PTR [eax],al
    1cc6:	08 08                	or     BYTE PTR [eax],cl
    1cc8:	06                   	push   es
    1cc9:	00 00                	add    BYTE PTR [eax],al
    1ccb:	01 1d a8 00 00 00    	add    DWORD PTR ds:0xa8,ebx
    1cd1:	02 91 00 09 73 72    	add    dl,BYTE PTR [ecx+0x72730900]
    1cd7:	63 00                	arpl   WORD PTR [eax],ax
    1cd9:	01 1d 8f 00 00 00    	add    DWORD PTR ds:0x8f,ebx
    1cdf:	02 91 04 00 0a 34    	add    dl,BYTE PTR [ecx+0x340a0004]
    1ce5:	08 00                	or     BYTE PTR [eax],al
    1ce7:	00 01                	add    BYTE PTR [ecx],al
    1ce9:	23 f6                	and    esi,esi
    1ceb:	10 00                	adc    BYTE PTR [eax],al
    1ced:	30 6f 00             	xor    BYTE PTR [edi+0x0],ch
    1cf0:	00 00                	add    BYTE PTR [eax],al
    1cf2:	01 9c 2a 01 00 00 09 	add    DWORD PTR [edx+ebp*1+0x9000001],ebx
    1cf9:	70 00                	jo     1cfb <sysEnter_Vector-0x12e305>
    1cfb:	01 23                	add    DWORD PTR [ebx],esp
    1cfd:	a8 00                	test   al,0x0
    1cff:	00 00                	add    BYTE PTR [eax],al
    1d01:	02 91 00 09 71 00    	add    dl,BYTE PTR [ecx+0x710900]
    1d07:	01 23                	add    DWORD PTR [ebx],esp
    1d09:	a8 00                	test   al,0x0
    1d0b:	00 00                	add    BYTE PTR [eax],al
    1d0d:	02 91 04 0b 63 00    	add    dl,BYTE PTR [ecx+0x630b04]
    1d13:	01 24 3a             	add    DWORD PTR [edx+edi*1],esp
    1d16:	00 00                	add    BYTE PTR [eax],al
    1d18:	00 02                	add    BYTE PTR [edx],al
    1d1a:	91                   	xchg   ecx,eax
    1d1b:	74 0b                	je     1d28 <sysEnter_Vector-0x12e2d8>
    1d1d:	64 00 01             	add    BYTE PTR fs:[ecx],al
    1d20:	24 3a                	and    al,0x3a
    1d22:	00 00                	add    BYTE PTR [eax],al
    1d24:	00 02                	add    BYTE PTR [edx],al
    1d26:	91                   	xchg   ecx,eax
    1d27:	70 00                	jo     1d29 <sysEnter_Vector-0x12e2d7>
    1d29:	0c 3f                	or     al,0x3f
    1d2b:	00 00                	add    BYTE PTR [eax],al
    1d2d:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    1d30:	56                   	push   esi
    1d31:	00 00                	add    BYTE PTR [eax],al
    1d33:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
    1d39:	30 0c aa             	xor    BYTE PTR [edx+ebp*4],cl
    1d3c:	00 00                	add    BYTE PTR [eax],al
    1d3e:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1d41:	56                   	push   esi
    1d42:	00 00                	add    BYTE PTR [eax],al
    1d44:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
    1d4a:	30 0c 56             	xor    BYTE PTR [esi+edx*2],cl
    1d4d:	01 00                	add    DWORD PTR [eax],eax
    1d4f:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    1d56:	05 03 44 38 00       	add    eax,0x384403
    1d5b:	30 0c 48             	xor    BYTE PTR [eax+ecx*2],cl
    1d5e:	00 00                	add    BYTE PTR [eax],al
    1d60:	00 05 37 84 00 00    	add    BYTE PTR ds:0x8437,al
    1d66:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
    1d6c:	30 00                	xor    BYTE PTR [eax],al
    1d6e:	5a                   	pop    edx
    1d6f:	01 00                	add    DWORD PTR [eax],eax
    1d71:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    1d74:	99                   	cdq    
    1d75:	0a 00                	or     al,BYTE PTR [eax]
    1d77:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    1d7a:	ef                   	out    dx,eax
    1d7b:	00 00                	add    BYTE PTR [eax],al
    1d7d:	00 0c 5c             	add    BYTE PTR [esp+ebx*2],cl
    1d80:	08 00                	or     BYTE PTR [eax],al
    1d82:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1d85:	00 00                	add    BYTE PTR [eax],al
    1d87:	68 11 00 30 5e       	push   0x5e300011
    1d8c:	00 00                	add    BYTE PTR [eax],al
    1d8e:	00 4e 0c             	add    BYTE PTR [esi+0xc],cl
    1d91:	00 00                	add    BYTE PTR [eax],al
    1d93:	02 01                	add    al,BYTE PTR [ecx]
    1d95:	06                   	push   es
    1d96:	58                   	pop    eax
    1d97:	00 00                	add    BYTE PTR [eax],al
    1d99:	00 02                	add    BYTE PTR [edx],al
    1d9b:	01 06                	add    DWORD PTR [esi],eax
    1d9d:	51                   	push   ecx
    1d9e:	00 00                	add    BYTE PTR [eax],al
    1da0:	00 02                	add    BYTE PTR [edx],al
    1da2:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1da8:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1daf:	02 08                	add    cl,BYTE PTR [eax]
    1db1:	05 00 00 00 00       	add    eax,0x0
    1db6:	02 01                	add    al,BYTE PTR [ecx]
    1db8:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1dbb:	00 00                	add    BYTE PTR [eax],al
    1dbd:	02 02                	add    al,BYTE PTR [edx]
    1dbf:	07                   	pop    es
    1dc0:	0e                   	push   cs
    1dc1:	00 00                	add    BYTE PTR [eax],al
    1dc3:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1dc6:	00 00                	add    BYTE PTR [eax],al
    1dc8:	00 02                	add    BYTE PTR [edx],al
    1dca:	34 61                	xor    al,0x61
    1dcc:	00 00                	add    BYTE PTR [eax],al
    1dce:	00 02                	add    BYTE PTR [edx],al
    1dd0:	04 07                	add    al,0x7
    1dd2:	32 00                	xor    al,BYTE PTR [eax]
    1dd4:	00 00                	add    BYTE PTR [eax],al
    1dd6:	02 08                	add    cl,BYTE PTR [eax]
    1dd8:	07                   	pop    es
    1dd9:	28 00                	sub    BYTE PTR [eax],al
    1ddb:	00 00                	add    BYTE PTR [eax],al
    1ddd:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1de4:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1de7:	96                   	xchg   esi,eax
    1de8:	00 00                	add    BYTE PTR [eax],al
    1dea:	00 02                	add    BYTE PTR [edx],al
    1dec:	01 02                	add    DWORD PTR [edx],eax
    1dee:	90                   	nop
    1def:	00 00                	add    BYTE PTR [eax],al
    1df1:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1df8:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1dfb:	00 00                	add    BYTE PTR [eax],al
    1dfd:	05 04 95 00 00       	add    eax,0x9504
    1e02:	00 06                	add    BYTE PTR [esi],al
    1e04:	25 00 00 00 02       	and    eax,0x2000000
    1e09:	04 07                	add    al,0x7
    1e0b:	2d 00 00 00 02       	sub    eax,0x2000000
    1e10:	04 07                	add    al,0x7
    1e12:	dc 00                	fadd   QWORD PTR [eax]
    1e14:	00 00                	add    BYTE PTR [eax],al
    1e16:	07                   	pop    es
    1e17:	55                   	push   ebp
    1e18:	08 00                	or     BYTE PTR [eax],al
    1e1a:	00 01                	add    BYTE PTR [ecx],al
    1e1c:	18 3a                	sbb    BYTE PTR [edx],bh
    1e1e:	00 00                	add    BYTE PTR [eax],al
    1e20:	00 68 11             	add    BYTE PTR [eax+0x11],ch
    1e23:	00 30                	add    BYTE PTR [eax],dh
    1e25:	5e                   	pop    esi
    1e26:	00 00                	add    BYTE PTR [eax],al
    1e28:	00 01                	add    BYTE PTR [ecx],al
    1e2a:	9c                   	pushf  
    1e2b:	0e                   	push   cs
    1e2c:	01 00                	add    DWORD PTR [eax],eax
    1e2e:	00 08                	add    BYTE PTR [eax],cl
    1e30:	70 31                	jo     1e63 <sysEnter_Vector-0x12e19d>
    1e32:	00 01                	add    BYTE PTR [ecx],al
    1e34:	18 8f 00 00 00 02    	sbb    BYTE PTR [edi+0x2000000],cl
    1e3a:	91                   	xchg   ecx,eax
    1e3b:	00 08                	add    BYTE PTR [eax],cl
    1e3d:	70 32                	jo     1e71 <sysEnter_Vector-0x12e18f>
    1e3f:	00 01                	add    BYTE PTR [ecx],al
    1e41:	18 8f 00 00 00 02    	sbb    BYTE PTR [edi+0x2000000],cl
    1e47:	91                   	xchg   ecx,eax
    1e48:	04 09                	add    al,0x9
    1e4a:	73 31                	jae    1e7d <sysEnter_Vector-0x12e183>
    1e4c:	00 01                	add    BYTE PTR [ecx],al
    1e4e:	1a 0e                	sbb    cl,BYTE PTR [esi]
    1e50:	01 00                	add    DWORD PTR [eax],eax
    1e52:	00 01                	add    BYTE PTR [ecx],al
    1e54:	53                   	push   ebx
    1e55:	09 73 32             	or     DWORD PTR [ebx+0x32],esi
    1e58:	00 01                	add    BYTE PTR [ecx],al
    1e5a:	1b 0e                	sbb    ecx,DWORD PTR [esi]
    1e5c:	01 00                	add    DWORD PTR [eax],eax
    1e5e:	00 01                	add    BYTE PTR [ecx],al
    1e60:	56                   	push   esi
    1e61:	09 63 31             	or     DWORD PTR [ebx+0x31],esp
    1e64:	00 01                	add    BYTE PTR [ecx],al
    1e66:	1c 48                	sbb    al,0x48
    1e68:	00 00                	add    BYTE PTR [eax],al
    1e6a:	00 02                	add    BYTE PTR [edx],al
    1e6c:	91                   	xchg   ecx,eax
    1e6d:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1e6e:	09 63 32             	or     DWORD PTR [ebx+0x32],esp
    1e71:	00 01                	add    BYTE PTR [ecx],al
    1e73:	1c 48                	sbb    al,0x48
    1e75:	00 00                	add    BYTE PTR [eax],al
    1e77:	00 02                	add    BYTE PTR [edx],al
    1e79:	91                   	xchg   ecx,eax
    1e7a:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1e7b:	00 05 04 14 01 00    	add    BYTE PTR ds:0x11404,al
    1e81:	00 06                	add    BYTE PTR [esi],al
    1e83:	48                   	dec    eax
    1e84:	00 00                	add    BYTE PTR [eax],al
    1e86:	00 0a                	add    BYTE PTR [edx],cl
    1e88:	3f                   	aas    
    1e89:	00 00                	add    BYTE PTR [eax],al
    1e8b:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    1e8e:	56                   	push   esi
    1e8f:	00 00                	add    BYTE PTR [eax],al
    1e91:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
    1e97:	30 0a                	xor    BYTE PTR [edx],cl
    1e99:	aa                   	stos   BYTE PTR es:[edi],al
    1e9a:	00 00                	add    BYTE PTR [eax],al
    1e9c:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1e9f:	56                   	push   esi
    1ea0:	00 00                	add    BYTE PTR [eax],al
    1ea2:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
    1ea8:	30 0a                	xor    BYTE PTR [edx],cl
    1eaa:	56                   	push   esi
    1eab:	01 00                	add    DWORD PTR [eax],eax
    1ead:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    1eb4:	05 03 44 38 00       	add    eax,0x384403
    1eb9:	30 0a                	xor    BYTE PTR [edx],cl
    1ebb:	48                   	dec    eax
    1ebc:	00 00                	add    BYTE PTR [eax],al
    1ebe:	00 05 37 84 00 00    	add    BYTE PTR ds:0x8437,al
    1ec4:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
    1eca:	30 00                	xor    BYTE PTR [eax],al
    1ecc:	7d 01                	jge    1ecf <sysEnter_Vector-0x12e131>
    1ece:	00 00                	add    BYTE PTR [eax],al
    1ed0:	04 00                	add    al,0x0
    1ed2:	2b 0b                	sub    ecx,DWORD PTR [ebx]
    1ed4:	00 00                	add    BYTE PTR [eax],al
    1ed6:	04 01                	add    al,0x1
    1ed8:	ef                   	out    dx,eax
    1ed9:	00 00                	add    BYTE PTR [eax],al
    1edb:	00 0c 86             	add    BYTE PTR [esi+eax*4],cl
    1ede:	08 00                	or     BYTE PTR [eax],al
    1ee0:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    1ee3:	00 00                	add    BYTE PTR [eax],al
    1ee5:	c8 11 00 30          	enter  0x11,0x30
    1ee9:	87 00                	xchg   DWORD PTR [eax],eax
    1eeb:	00 00                	add    BYTE PTR [eax],al
    1eed:	17                   	pop    ss
    1eee:	0d 00 00 02 01       	or     eax,0x1020000
    1ef3:	06                   	push   es
    1ef4:	58                   	pop    eax
    1ef5:	00 00                	add    BYTE PTR [eax],al
    1ef7:	00 02                	add    BYTE PTR [edx],al
    1ef9:	01 06                	add    DWORD PTR [esi],eax
    1efb:	51                   	push   ecx
    1efc:	00 00                	add    BYTE PTR [eax],al
    1efe:	00 02                	add    BYTE PTR [edx],al
    1f00:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    1f06:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    1f0d:	02 08                	add    cl,BYTE PTR [eax]
    1f0f:	05 00 00 00 00       	add    eax,0x0
    1f14:	02 01                	add    al,BYTE PTR [ecx]
    1f16:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    1f19:	00 00                	add    BYTE PTR [eax],al
    1f1b:	02 02                	add    al,BYTE PTR [edx]
    1f1d:	07                   	pop    es
    1f1e:	0e                   	push   cs
    1f1f:	00 00                	add    BYTE PTR [eax],al
    1f21:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    1f24:	00 00                	add    BYTE PTR [eax],al
    1f26:	00 02                	add    BYTE PTR [edx],al
    1f28:	34 61                	xor    al,0x61
    1f2a:	00 00                	add    BYTE PTR [eax],al
    1f2c:	00 02                	add    BYTE PTR [edx],al
    1f2e:	04 07                	add    al,0x7
    1f30:	32 00                	xor    al,BYTE PTR [eax]
    1f32:	00 00                	add    BYTE PTR [eax],al
    1f34:	02 08                	add    cl,BYTE PTR [eax]
    1f36:	07                   	pop    es
    1f37:	28 00                	sub    BYTE PTR [eax],al
    1f39:	00 00                	add    BYTE PTR [eax],al
    1f3b:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    1f42:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    1f45:	96                   	xchg   esi,eax
    1f46:	00 00                	add    BYTE PTR [eax],al
    1f48:	00 02                	add    BYTE PTR [edx],al
    1f4a:	01 02                	add    DWORD PTR [edx],eax
    1f4c:	90                   	nop
    1f4d:	00 00                	add    BYTE PTR [eax],al
    1f4f:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    1f56:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    1f59:	00 00                	add    BYTE PTR [eax],al
    1f5b:	05 04 95 00 00       	add    eax,0x9504
    1f60:	00 06                	add    BYTE PTR [esi],al
    1f62:	25 00 00 00 02       	and    eax,0x2000000
    1f67:	04 07                	add    al,0x7
    1f69:	2d 00 00 00 02       	sub    eax,0x2000000
    1f6e:	04 07                	add    al,0x7
    1f70:	dc 00                	fadd   QWORD PTR [eax]
    1f72:	00 00                	add    BYTE PTR [eax],al
    1f74:	05 04 25 00 00       	add    eax,0x2504
    1f79:	00 07                	add    BYTE PTR [edi],al
    1f7b:	71 08                	jno    1f85 <sysEnter_Vector-0x12e07b>
    1f7d:	00 00                	add    BYTE PTR [eax],al
    1f7f:	01 04 a8             	add    DWORD PTR [eax+ebp*4],eax
    1f82:	00 00                	add    BYTE PTR [eax],al
    1f84:	00 c8                	add    al,cl
    1f86:	11 00                	adc    DWORD PTR [eax],eax
    1f88:	30 40 00             	xor    BYTE PTR [eax+0x0],al
    1f8b:	00 00                	add    BYTE PTR [eax],al
    1f8d:	01 9c ee 00 00 00 08 	add    DWORD PTR [esi+ebp*8+0x8000000],ebx
    1f94:	73 31                	jae    1fc7 <sysEnter_Vector-0x12e039>
    1f96:	00 01                	add    BYTE PTR [ecx],al
    1f98:	04 a8                	add    al,0xa8
    1f9a:	00 00                	add    BYTE PTR [eax],al
    1f9c:	00 02                	add    BYTE PTR [edx],al
    1f9e:	91                   	xchg   ecx,eax
    1f9f:	00 08                	add    BYTE PTR [eax],cl
    1fa1:	73 32                	jae    1fd5 <sysEnter_Vector-0x12e02b>
    1fa3:	00 01                	add    BYTE PTR [ecx],al
    1fa5:	04 8f                	add    al,0x8f
    1fa7:	00 00                	add    BYTE PTR [eax],al
    1fa9:	00 02                	add    BYTE PTR [edx],al
    1fab:	91                   	xchg   ecx,eax
    1fac:	04 09                	add    al,0x9
    1fae:	73 00                	jae    1fb0 <sysEnter_Vector-0x12e050>
    1fb0:	01 06                	add    DWORD PTR [esi],eax
    1fb2:	a8 00                	test   al,0x0
    1fb4:	00 00                	add    BYTE PTR [eax],al
    1fb6:	02 91 74 00 07 7e    	add    dl,BYTE PTR [ecx+0x7e070074]
    1fbc:	08 00                	or     BYTE PTR [eax],al
    1fbe:	00 01                	add    BYTE PTR [ecx],al
    1fc0:	0e                   	push   cs
    1fc1:	a8 00                	test   al,0x0
    1fc3:	00 00                	add    BYTE PTR [eax],al
    1fc5:	08 12                	or     BYTE PTR [edx],dl
    1fc7:	00 30                	add    BYTE PTR [eax],dh
    1fc9:	47                   	inc    edi
    1fca:	00 00                	add    BYTE PTR [eax],al
    1fcc:	00 01                	add    BYTE PTR [ecx],al
    1fce:	9c                   	pushf  
    1fcf:	3c 01                	cmp    al,0x1
    1fd1:	00 00                	add    BYTE PTR [eax],al
    1fd3:	08 73 31             	or     BYTE PTR [ebx+0x31],dh
    1fd6:	00 01                	add    BYTE PTR [ecx],al
    1fd8:	0e                   	push   cs
    1fd9:	a8 00                	test   al,0x0
    1fdb:	00 00                	add    BYTE PTR [eax],al
    1fdd:	02 91 00 08 73 32    	add    dl,BYTE PTR [ecx+0x32730800]
    1fe3:	00 01                	add    BYTE PTR [ecx],al
    1fe5:	0e                   	push   cs
    1fe6:	8f 00                	pop    DWORD PTR [eax]
    1fe8:	00 00                	add    BYTE PTR [eax],al
    1fea:	02 91 04 0a 78 08    	add    dl,BYTE PTR [ecx+0x8780a04]
    1ff0:	00 00                	add    BYTE PTR [eax],al
    1ff2:	01 0e                	add    DWORD PTR [esi],ecx
    1ff4:	61                   	popa   
    1ff5:	00 00                	add    BYTE PTR [eax],al
    1ff7:	00 02                	add    BYTE PTR [edx],al
    1ff9:	91                   	xchg   ecx,eax
    1ffa:	08 09                	or     BYTE PTR [ecx],cl
    1ffc:	73 00                	jae    1ffe <sysEnter_Vector-0x12e002>
    1ffe:	01 10                	add    DWORD PTR [eax],edx
    2000:	a8 00                	test   al,0x0
    2002:	00 00                	add    BYTE PTR [eax],al
    2004:	02 91 74 00 0b 3f    	add    dl,BYTE PTR [ecx+0x3f0b0074]
    200a:	00 00                	add    BYTE PTR [eax],al
    200c:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    200f:	56                   	push   esi
    2010:	00 00                	add    BYTE PTR [eax],al
    2012:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
    2018:	30 0b                	xor    BYTE PTR [ebx],cl
    201a:	aa                   	stos   BYTE PTR es:[edi],al
    201b:	00 00                	add    BYTE PTR [eax],al
    201d:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    2020:	56                   	push   esi
    2021:	00 00                	add    BYTE PTR [eax],al
    2023:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
    2029:	30 0b                	xor    BYTE PTR [ebx],cl
    202b:	56                   	push   esi
    202c:	01 00                	add    DWORD PTR [eax],eax
    202e:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    2035:	05 03 44 38 00       	add    eax,0x384403
    203a:	30 0b                	xor    BYTE PTR [ebx],cl
    203c:	48                   	dec    eax
    203d:	00 00                	add    BYTE PTR [eax],al
    203f:	00 05 37 84 00 00    	add    BYTE PTR ds:0x8437,al
    2045:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
    204b:	30 00                	xor    BYTE PTR [eax],al
    204d:	ca 00 00             	retf   0x0
    2050:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    2053:	cc                   	int3   
    2054:	0b 00                	or     eax,DWORD PTR [eax]
    2056:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    2059:	ef                   	out    dx,eax
    205a:	00 00                	add    BYTE PTR [eax],al
    205c:	00 0c a2             	add    BYTE PTR [edx+eiz*4],cl
    205f:	08 00                	or     BYTE PTR [eax],al
    2061:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2064:	00 00                	add    BYTE PTR [eax],al
    2066:	50                   	push   eax
    2067:	12 00                	adc    al,BYTE PTR [eax]
    2069:	30 62 00             	xor    BYTE PTR [edx+0x0],ah
    206c:	00 00                	add    BYTE PTR [eax],al
    206e:	f3 0d 00 00 02 04    	repz or eax,0x4020000
    2074:	05 69 6e 74 00       	add    eax,0x746e69
    2079:	03 a5 03 00 00 02    	add    esp,DWORD PTR [ebp+0x2000003]
    207f:	d8 37                	fdiv   DWORD PTR [edi]
    2081:	00 00                	add    BYTE PTR [eax],al
    2083:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    2086:	07                   	pop    es
    2087:	32 00                	xor    al,BYTE PTR [eax]
    2089:	00 00                	add    BYTE PTR [eax],al
    208b:	04 04                	add    al,0x4
    208d:	05 05 00 00 00       	add    eax,0x5
    2092:	04 08                	add    al,0x8
    2094:	05 00 00 00 00       	add    eax,0x0
    2099:	04 0c                	add    al,0xc
    209b:	04 96                	add    al,0x96
    209d:	00 00                	add    BYTE PTR [eax],al
    209f:	00 05 9b 08 00 00    	add    BYTE PTR ds:0x89b,al
    20a5:	01 03                	add    DWORD PTR [ebx],eax
    20a7:	2c 00                	sub    al,0x0
    20a9:	00 00                	add    BYTE PTR [eax],al
    20ab:	50                   	push   eax
    20ac:	12 00                	adc    al,BYTE PTR [eax]
    20ae:	30 31                	xor    BYTE PTR [ecx],dh
    20b0:	00 00                	add    BYTE PTR [eax],al
    20b2:	00 01                	add    BYTE PTR [ecx],al
    20b4:	9c                   	pushf  
    20b5:	89 00                	mov    DWORD PTR [eax],eax
    20b7:	00 00                	add    BYTE PTR [eax],al
    20b9:	06                   	push   es
    20ba:	73 74                	jae    2130 <sysEnter_Vector-0x12ded0>
    20bc:	72 00                	jb     20be <sysEnter_Vector-0x12df42>
    20be:	01 03                	add    DWORD PTR [ebx],eax
    20c0:	89 00                	mov    DWORD PTR [eax],eax
    20c2:	00 00                	add    BYTE PTR [eax],al
    20c4:	02 91 00 07 72 65    	add    dl,BYTE PTR [ecx+0x65720700]
    20ca:	74 00                	je     20cc <sysEnter_Vector-0x12df34>
    20cc:	01 04 2c             	add    DWORD PTR [esp+ebp*1],eax
    20cf:	00 00                	add    BYTE PTR [eax],al
    20d1:	00 02                	add    BYTE PTR [edx],al
    20d3:	91                   	xchg   ecx,eax
    20d4:	74 00                	je     20d6 <sysEnter_Vector-0x12df2a>
    20d6:	08 04 96             	or     BYTE PTR [esi+edx*4],al
    20d9:	00 00                	add    BYTE PTR [eax],al
    20db:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    20de:	06                   	push   es
    20df:	58                   	pop    eax
    20e0:	00 00                	add    BYTE PTR [eax],al
    20e2:	00 09                	add    BYTE PTR [ecx],cl
    20e4:	8f 00                	pop    DWORD PTR [eax]
    20e6:	00 00                	add    BYTE PTR [eax],al
    20e8:	0a f9                	or     bh,cl
    20ea:	01 00                	add    DWORD PTR [eax],eax
    20ec:	00 01                	add    BYTE PTR [ecx],al
    20ee:	0a 2c 00             	or     ch,BYTE PTR [eax+eax*1]
    20f1:	00 00                	add    BYTE PTR [eax],al
    20f3:	81 12 00 30 31 00    	adc    DWORD PTR [edx],0x313000
    20f9:	00 00                	add    BYTE PTR [eax],al
    20fb:	01 9c 06 73 74 72 00 	add    DWORD PTR [esi+eax*1+0x727473],ebx
    2102:	01 0a                	add    DWORD PTR [edx],ecx
    2104:	89 00                	mov    DWORD PTR [eax],eax
    2106:	00 00                	add    BYTE PTR [eax],al
    2108:	02 91 00 07 72 65    	add    dl,BYTE PTR [ecx+0x65720700]
    210e:	74 00                	je     2110 <sysEnter_Vector-0x12def0>
    2110:	01 0b                	add    DWORD PTR [ebx],ecx
    2112:	2c 00                	sub    al,0x0
    2114:	00 00                	add    BYTE PTR [eax],al
    2116:	02 91 74 00 00 a2    	add    dl,BYTE PTR [ecx-0x5dffff8c]
    211c:	00 00                	add    BYTE PTR [eax],al
    211e:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    2121:	67 0c 00             	addr16 or al,0x0
    2124:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    2127:	ef                   	out    dx,eax
    2128:	00 00                	add    BYTE PTR [eax],al
    212a:	00 0c bf             	add    BYTE PTR [edi+edi*4],cl
    212d:	08 00                	or     BYTE PTR [eax],al
    212f:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2132:	00 00                	add    BYTE PTR [eax],al
    2134:	b4 12                	mov    ah,0x12
    2136:	00 30                	add    BYTE PTR [eax],dh
    2138:	67 00 00             	add    BYTE PTR [bx+si],al
    213b:	00 8b 0e 00 00 02    	add    BYTE PTR [ebx+0x200000e],cl
    2141:	04 05                	add    al,0x5
    2143:	69 6e 74 00 03 a5 03 	imul   ebp,DWORD PTR [esi+0x74],0x3a50300
    214a:	00 00                	add    BYTE PTR [eax],al
    214c:	02 d8                	add    bl,al
    214e:	37                   	aaa    
    214f:	00 00                	add    BYTE PTR [eax],al
    2151:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    2154:	07                   	pop    es
    2155:	32 00                	xor    al,BYTE PTR [eax]
    2157:	00 00                	add    BYTE PTR [eax],al
    2159:	04 04                	add    al,0x4
    215b:	05 05 00 00 00       	add    eax,0x5
    2160:	04 08                	add    al,0x8
    2162:	05 00 00 00 00       	add    eax,0x0
    2167:	04 0c                	add    al,0xc
    2169:	04 96                	add    al,0x96
    216b:	00 00                	add    BYTE PTR [eax],al
    216d:	00 05 b7 08 00 00    	add    BYTE PTR ds:0x8b7,al
    2173:	01 0c 25 00 00 00 b4 	add    DWORD PTR [eiz*1-0x4c000000],ecx
    217a:	12 00                	adc    al,BYTE PTR [eax]
    217c:	30 67 00             	xor    BYTE PTR [edi+0x0],ah
    217f:	00 00                	add    BYTE PTR [eax],al
    2181:	01 9c 93 00 00 00 06 	add    DWORD PTR [ebx+edx*4+0x6000000],ebx
    2188:	73 31                	jae    21bb <sysEnter_Vector-0x12de45>
    218a:	00 01                	add    BYTE PTR [ecx],al
    218c:	0c 93                	or     al,0x93
    218e:	00 00                	add    BYTE PTR [eax],al
    2190:	00 02                	add    BYTE PTR [edx],al
    2192:	91                   	xchg   ecx,eax
    2193:	00 06                	add    BYTE PTR [esi],al
    2195:	73 32                	jae    21c9 <sysEnter_Vector-0x12de37>
    2197:	00 01                	add    BYTE PTR [ecx],al
    2199:	0c 93                	or     al,0x93
    219b:	00 00                	add    BYTE PTR [eax],al
    219d:	00 02                	add    BYTE PTR [edx],al
    219f:	91                   	xchg   ecx,eax
    21a0:	04 06                	add    al,0x6
    21a2:	6e                   	outs   dx,BYTE PTR ds:[esi]
    21a3:	00 01                	add    BYTE PTR [ecx],al
    21a5:	0c 2c                	or     al,0x2c
    21a7:	00 00                	add    BYTE PTR [eax],al
    21a9:	00 02                	add    BYTE PTR [edx],al
    21ab:	91                   	xchg   ecx,eax
    21ac:	08 00                	or     BYTE PTR [eax],al
    21ae:	07                   	pop    es
    21af:	04 a0                	add    al,0xa0
    21b1:	00 00                	add    BYTE PTR [eax],al
    21b3:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    21b6:	06                   	push   es
    21b7:	58                   	pop    eax
    21b8:	00 00                	add    BYTE PTR [eax],al
    21ba:	00 08                	add    BYTE PTR [eax],cl
    21bc:	99                   	cdq    
    21bd:	00 00                	add    BYTE PTR [eax],al
    21bf:	00 00                	add    BYTE PTR [eax],al
    21c1:	b4 00                	mov    ah,0x0
    21c3:	00 00                	add    BYTE PTR [eax],al
    21c5:	04 00                	add    al,0x0
    21c7:	d9 0c 00             	(bad)  [eax+eax*1]
    21ca:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
    21cd:	ef                   	out    dx,eax
    21ce:	00 00                	add    BYTE PTR [eax],al
    21d0:	00 0c d5 08 00 00 6d 	add    BYTE PTR [edx*8+0x6d000008],cl
    21d7:	00 00                	add    BYTE PTR [eax],al
    21d9:	00 1c 13             	add    BYTE PTR [ebx+edx*1],bl
    21dc:	00 30                	add    BYTE PTR [eax],dh
    21de:	60                   	pusha  
    21df:	00 00                	add    BYTE PTR [eax],al
    21e1:	00 34 0f             	add    BYTE PTR [edi+ecx*1],dh
    21e4:	00 00                	add    BYTE PTR [eax],al
    21e6:	02 04 05 69 6e 74 00 	add    al,BYTE PTR [eax*1+0x746e69]
    21ed:	03 a5 03 00 00 02    	add    esp,DWORD PTR [ebp+0x2000003]
    21f3:	d8 37                	fdiv   DWORD PTR [edi]
    21f5:	00 00                	add    BYTE PTR [eax],al
    21f7:	00 04 04             	add    BYTE PTR [esp+eax*1],al
    21fa:	07                   	pop    es
    21fb:	32 00                	xor    al,BYTE PTR [eax]
    21fd:	00 00                	add    BYTE PTR [eax],al
    21ff:	04 04                	add    al,0x4
    2201:	05 05 00 00 00       	add    eax,0x5
    2206:	04 08                	add    al,0x8
    2208:	05 00 00 00 00       	add    eax,0x0
    220d:	04 0c                	add    al,0xc
    220f:	04 96                	add    al,0x96
    2211:	00 00                	add    BYTE PTR [eax],al
    2213:	00 05 eb 08 00 00    	add    BYTE PTR ds:0x8eb,al
    2219:	01 0d 9f 00 00 00    	add    DWORD PTR ds:0x9f,ecx
    221f:	1c 13                	sbb    al,0x13
    2221:	00 30                	add    BYTE PTR [eax],dh
    2223:	60                   	pusha  
    2224:	00 00                	add    BYTE PTR [eax],al
    2226:	00 01                	add    BYTE PTR [ecx],al
    2228:	9c                   	pushf  
    2229:	9f                   	lahf   
    222a:	00 00                	add    BYTE PTR [eax],al
    222c:	00 06                	add    BYTE PTR [esi],al
    222e:	73 31                	jae    2261 <sysEnter_Vector-0x12dd9f>
    2230:	00 01                	add    BYTE PTR [ecx],al
    2232:	0d 9f 00 00 00       	or     eax,0x9f
    2237:	02 91 00 06 73 32    	add    dl,BYTE PTR [ecx+0x32730600]
    223d:	00 01                	add    BYTE PTR [ecx],al
    223f:	0d ac 00 00 00       	or     eax,0xac
    2244:	02 91 04 06 6e 00    	add    dl,BYTE PTR [ecx+0x6e0604]
    224a:	01 0d 2c 00 00 00    	add    DWORD PTR ds:0x2c,ecx
    2250:	02 91 08 07 73 00    	add    dl,BYTE PTR [ecx+0x730708]
    2256:	01 0f                	add    DWORD PTR [edi],ecx
    2258:	9f                   	lahf   
    2259:	00 00                	add    BYTE PTR [eax],al
    225b:	00 02                	add    BYTE PTR [edx],al
    225d:	91                   	xchg   ecx,eax
    225e:	74 00                	je     2260 <sysEnter_Vector-0x12dda0>
    2260:	08 04 a5 00 00 00 04 	or     BYTE PTR [eiz*4+0x4000000],al
    2267:	01 06                	add    DWORD PTR [esi],eax
    2269:	58                   	pop    eax
    226a:	00 00                	add    BYTE PTR [eax],al
    226c:	00 08                	add    BYTE PTR [eax],cl
    226e:	04 b2                	add    al,0xb2
    2270:	00 00                	add    BYTE PTR [eax],al
    2272:	00 09                	add    BYTE PTR [ecx],cl
    2274:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
    2275:	00 00                	add    BYTE PTR [eax],al
    2277:	00 00                	add    BYTE PTR [eax],al
    2279:	8c 01                	mov    WORD PTR [ecx],es
    227b:	00 00                	add    BYTE PTR [eax],al
    227d:	04 00                	add    al,0x0
    227f:	5a                   	pop    edx
    2280:	0d 00 00 04 01       	or     eax,0x1040000
    2285:	ef                   	out    dx,eax
    2286:	00 00                	add    BYTE PTR [eax],al
    2288:	00 0c f3             	add    BYTE PTR [ebx+esi*8],cl
    228b:	08 00                	or     BYTE PTR [eax],al
    228d:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2290:	00 00                	add    BYTE PTR [eax],al
    2292:	7c 13                	jl     22a7 <sysEnter_Vector-0x12dd59>
    2294:	00 30                	add    BYTE PTR [eax],dh
    2296:	7d 01                	jge    2299 <sysEnter_Vector-0x12dd67>
    2298:	00 00                	add    BYTE PTR [eax],al
    229a:	d5 0f                	aad    0xf
    229c:	00 00                	add    BYTE PTR [eax],al
    229e:	02 01                	add    al,BYTE PTR [ecx]
    22a0:	06                   	push   es
    22a1:	58                   	pop    eax
    22a2:	00 00                	add    BYTE PTR [eax],al
    22a4:	00 02                	add    BYTE PTR [edx],al
    22a6:	01 06                	add    DWORD PTR [esi],eax
    22a8:	51                   	push   ecx
    22a9:	00 00                	add    BYTE PTR [eax],al
    22ab:	00 02                	add    BYTE PTR [edx],al
    22ad:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    22b3:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    22ba:	02 08                	add    cl,BYTE PTR [eax]
    22bc:	05 00 00 00 00       	add    eax,0x0
    22c1:	02 01                	add    al,BYTE PTR [ecx]
    22c3:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    22c6:	00 00                	add    BYTE PTR [eax],al
    22c8:	02 02                	add    al,BYTE PTR [edx]
    22ca:	07                   	pop    es
    22cb:	0e                   	push   cs
    22cc:	00 00                	add    BYTE PTR [eax],al
    22ce:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    22d1:	00 00                	add    BYTE PTR [eax],al
    22d3:	00 02                	add    BYTE PTR [edx],al
    22d5:	34 61                	xor    al,0x61
    22d7:	00 00                	add    BYTE PTR [eax],al
    22d9:	00 02                	add    BYTE PTR [edx],al
    22db:	04 07                	add    al,0x7
    22dd:	32 00                	xor    al,BYTE PTR [eax]
    22df:	00 00                	add    BYTE PTR [eax],al
    22e1:	02 08                	add    cl,BYTE PTR [eax]
    22e3:	07                   	pop    es
    22e4:	28 00                	sub    BYTE PTR [eax],al
    22e6:	00 00                	add    BYTE PTR [eax],al
    22e8:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    22ef:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    22f2:	96                   	xchg   esi,eax
    22f3:	00 00                	add    BYTE PTR [eax],al
    22f5:	00 02                	add    BYTE PTR [edx],al
    22f7:	01 02                	add    DWORD PTR [edx],eax
    22f9:	90                   	nop
    22fa:	00 00                	add    BYTE PTR [eax],al
    22fc:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    2303:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    2306:	00 00                	add    BYTE PTR [eax],al
    2308:	05 04 95 00 00       	add    eax,0x9504
    230d:	00 06                	add    BYTE PTR [esi],al
    230f:	25 00 00 00 02       	and    eax,0x2000000
    2314:	04 07                	add    al,0x7
    2316:	2d 00 00 00 02       	sub    eax,0x2000000
    231b:	04 07                	add    al,0x7
    231d:	dc 00                	fadd   QWORD PTR [eax]
    231f:	00 00                	add    BYTE PTR [eax],al
    2321:	05 04 25 00 00       	add    eax,0x2504
    2326:	00 07                	add    BYTE PTR [edi],al
    2328:	16                   	push   ss
    2329:	09 00                	or     DWORD PTR [eax],eax
    232b:	00 01                	add    BYTE PTR [ecx],al
    232d:	3b 9a 00 00 00 7c    	cmp    ebx,DWORD PTR [edx+0x7c000000]
    2333:	13 00                	adc    eax,DWORD PTR [eax]
    2335:	30 7d 01             	xor    BYTE PTR [ebp+0x1],bh
    2338:	00 00                	add    BYTE PTR [eax],al
    233a:	01 9c 45 01 00 00 08 	add    DWORD PTR [ebp+eax*2+0x8000001],ebx
    2341:	25 09 00 00 01       	and    eax,0x1000009
    2346:	3b 8f 00 00 00 02    	cmp    ecx,DWORD PTR [edi+0x2000000]
    234c:	91                   	xchg   ecx,eax
    234d:	00 08                	add    BYTE PTR [eax],cl
    234f:	1e                   	push   ds
    2350:	09 00                	or     DWORD PTR [eax],eax
    2352:	00 01                	add    BYTE PTR [ecx],al
    2354:	3b 45 01             	cmp    eax,DWORD PTR [ebp+0x1]
    2357:	00 00                	add    BYTE PTR [eax],al
    2359:	02 91 04 08 2a 09    	add    dl,BYTE PTR [ecx+0x92a0804]
    235f:	00 00                	add    BYTE PTR [eax],al
    2361:	01 3b                	add    DWORD PTR [ebx],edi
    2363:	3a 00                	cmp    al,BYTE PTR [eax]
    2365:	00 00                	add    BYTE PTR [eax],al
    2367:	02 91 08 09 73 00    	add    dl,BYTE PTR [ecx+0x730908]
    236d:	01 3d 8f 00 00 00    	add    DWORD PTR ds:0x8f,edi
    2373:	01 56 09             	add    DWORD PTR [esi+0x9],edx
    2376:	61                   	popa   
    2377:	63 63 00             	arpl   WORD PTR [ebx+0x0],sp
    237a:	01 3e                	add    DWORD PTR [esi],edi
    237c:	9a 00 00 00 01 57 09 	call   0x957:0x1000000
    2383:	63 00                	arpl   WORD PTR [eax],ax
    2385:	01 3f                	add    DWORD PTR [edi],edi
    2387:	3a 00                	cmp    al,BYTE PTR [eax]
    2389:	00 00                	add    BYTE PTR [eax],al
    238b:	01 53 0a             	add    DWORD PTR [ebx+0xa],edx
    238e:	08 09                	or     BYTE PTR [ecx],cl
    2390:	00 00                	add    BYTE PTR [eax],al
    2392:	01 40 9a             	add    DWORD PTR [eax-0x66],eax
    2395:	00 00                	add    BYTE PTR [eax],al
    2397:	00 0b                	add    BYTE PTR [ebx],cl
    2399:	6e                   	outs   dx,BYTE PTR ds:[esi]
    239a:	65 67 00 01          	add    BYTE PTR gs:[bx+di],al
    239e:	41                   	inc    ecx
    239f:	3a 00                	cmp    al,BYTE PTR [eax]
    23a1:	00 00                	add    BYTE PTR [eax],al
    23a3:	09 61 6e             	or     DWORD PTR [ecx+0x6e],esp
    23a6:	79 00                	jns    23a8 <sysEnter_Vector-0x12dc58>
    23a8:	01 41 3a             	add    DWORD PTR [ecx+0x3a],eax
    23ab:	00 00                	add    BYTE PTR [eax],al
    23ad:	00 01                	add    BYTE PTR [ecx],al
    23af:	51                   	push   ecx
    23b0:	0c 0f                	or     al,0xf
    23b2:	09 00                	or     DWORD PTR [eax],eax
    23b4:	00 01                	add    BYTE PTR [ecx],al
    23b6:	41                   	inc    ecx
    23b7:	3a 00                	cmp    al,BYTE PTR [eax]
    23b9:	00 00                	add    BYTE PTR [eax],al
    23bb:	01 52 00             	add    DWORD PTR [edx+0x0],edx
    23be:	05 04 a8 00 00       	add    eax,0xa804
    23c3:	00 0d 3f 00 00 00    	add    BYTE PTR ds:0x3f,cl
    23c9:	04 33                	add    al,0x33
    23cb:	56                   	push   esi
    23cc:	00 00                	add    BYTE PTR [eax],al
    23ce:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
    23d4:	30 0d aa 00 00 00    	xor    BYTE PTR ds:0xaa,cl
    23da:	04 34                	add    al,0x34
    23dc:	56                   	push   esi
    23dd:	00 00                	add    BYTE PTR [eax],al
    23df:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
    23e5:	30 0d 56 01 00 00    	xor    BYTE PTR ds:0x156,cl
    23eb:	04 35                	add    al,0x35
    23ed:	56                   	push   esi
    23ee:	00 00                	add    BYTE PTR [eax],al
    23f0:	00 05 03 44 38 00    	add    BYTE PTR ds:0x384403,al
    23f6:	30 0d 48 00 00 00    	xor    BYTE PTR ds:0x48,cl
    23fc:	05 37 84 00 00       	add    eax,0x8437
    2401:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
    2407:	30 00                	xor    BYTE PTR [eax],al
    2409:	6c                   	ins    BYTE PTR es:[edi],dx
    240a:	00 00                	add    BYTE PTR [eax],al
    240c:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    240f:	15 0e 00 00 04       	adc    eax,0x400000e
    2414:	01 ef                	add    edi,ebp
    2416:	00 00                	add    BYTE PTR [eax],al
    2418:	00 0c 2f             	add    BYTE PTR [edi+ebp*1],cl
    241b:	09 00                	or     DWORD PTR [eax],eax
    241d:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2420:	00 00                	add    BYTE PTR [eax],al
    2422:	fc                   	cld    
    2423:	14 00                	adc    al,0x0
    2425:	30 1d 00 00 00 2c    	xor    BYTE PTR ds:0x2c000000,bl
    242b:	11 00                	adc    DWORD PTR [eax],eax
    242d:	00 02                	add    BYTE PTR [edx],al
    242f:	46                   	inc    esi
    2430:	09 00                	or     DWORD PTR [eax],eax
    2432:	00 01                	add    BYTE PTR [ecx],al
    2434:	01 5b 00             	add    DWORD PTR [ebx+0x0],ebx
    2437:	00 00                	add    BYTE PTR [eax],al
    2439:	fc                   	cld    
    243a:	14 00                	adc    al,0x0
    243c:	30 1d 00 00 00 01    	xor    BYTE PTR ds:0x1000000,bl
    2442:	9c                   	pushf  
    2443:	5b                   	pop    ebx
    2444:	00 00                	add    BYTE PTR [eax],al
    2446:	00 03                	add    BYTE PTR [ebx],al
    2448:	76 61                	jbe    24ab <sysEnter_Vector-0x12db55>
    244a:	6c                   	ins    BYTE PTR es:[edi],dx
    244b:	00 01                	add    BYTE PTR [ecx],al
    244d:	01 5b 00             	add    DWORD PTR [ebx+0x0],ebx
    2450:	00 00                	add    BYTE PTR [eax],al
    2452:	02 91 00 03 63 6e    	add    dl,BYTE PTR [ecx+0x6e630300]
    2458:	74 00                	je     245a <sysEnter_Vector-0x12dba6>
    245a:	01 01                	add    DWORD PTR [ecx],eax
    245c:	68 00 00 00 02       	push   0x2000000
    2461:	91                   	xchg   ecx,eax
    2462:	04 00                	add    al,0x0
    2464:	04 04                	add    al,0x4
    2466:	61                   	popa   
    2467:	00 00                	add    BYTE PTR [eax],al
    2469:	00 05 01 06 58 00    	add    BYTE PTR ds:0x580601,al
    246f:	00 00                	add    BYTE PTR [eax],al
    2471:	06                   	push   es
    2472:	04 05                	add    al,0x5
    2474:	69 6e 74 00 00 8a 01 	imul   ebp,DWORD PTR [esi+0x74],0x18a0000
    247b:	00 00                	add    BYTE PTR [eax],al
    247d:	04 00                	add    al,0x0
    247f:	73 0e                	jae    248f <sysEnter_Vector-0x12db71>
    2481:	00 00                	add    BYTE PTR [eax],al
    2483:	04 01                	add    al,0x1
    2485:	ef                   	out    dx,eax
    2486:	00 00                	add    BYTE PTR [eax],al
    2488:	00 0c 4e             	add    BYTE PTR [esi+ecx*2],cl
    248b:	09 00                	or     DWORD PTR [eax],eax
    248d:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2490:	00 00                	add    BYTE PTR [eax],al
    2492:	1c 15                	sbb    al,0x15
    2494:	00 30                	add    BYTE PTR [eax],dh
    2496:	9c                   	pushf  
    2497:	01 00                	add    DWORD PTR [eax],eax
    2499:	00 73 11             	add    BYTE PTR [ebx+0x11],dh
    249c:	00 00                	add    BYTE PTR [eax],al
    249e:	02 01                	add    al,BYTE PTR [ecx]
    24a0:	06                   	push   es
    24a1:	58                   	pop    eax
    24a2:	00 00                	add    BYTE PTR [eax],al
    24a4:	00 02                	add    BYTE PTR [edx],al
    24a6:	01 06                	add    DWORD PTR [esi],eax
    24a8:	51                   	push   ecx
    24a9:	00 00                	add    BYTE PTR [eax],al
    24ab:	00 02                	add    BYTE PTR [edx],al
    24ad:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    24b3:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    24ba:	02 08                	add    cl,BYTE PTR [eax]
    24bc:	05 00 00 00 00       	add    eax,0x0
    24c1:	02 01                	add    al,BYTE PTR [ecx]
    24c3:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    24c6:	00 00                	add    BYTE PTR [eax],al
    24c8:	02 02                	add    al,BYTE PTR [edx]
    24ca:	07                   	pop    es
    24cb:	0e                   	push   cs
    24cc:	00 00                	add    BYTE PTR [eax],al
    24ce:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    24d1:	00 00                	add    BYTE PTR [eax],al
    24d3:	00 02                	add    BYTE PTR [edx],al
    24d5:	34 61                	xor    al,0x61
    24d7:	00 00                	add    BYTE PTR [eax],al
    24d9:	00 02                	add    BYTE PTR [edx],al
    24db:	04 07                	add    al,0x7
    24dd:	32 00                	xor    al,BYTE PTR [eax]
    24df:	00 00                	add    BYTE PTR [eax],al
    24e1:	02 08                	add    cl,BYTE PTR [eax]
    24e3:	07                   	pop    es
    24e4:	28 00                	sub    BYTE PTR [eax],al
    24e6:	00 00                	add    BYTE PTR [eax],al
    24e8:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    24ef:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    24f2:	96                   	xchg   esi,eax
    24f3:	00 00                	add    BYTE PTR [eax],al
    24f5:	00 02                	add    BYTE PTR [edx],al
    24f7:	01 02                	add    DWORD PTR [edx],eax
    24f9:	90                   	nop
    24fa:	00 00                	add    BYTE PTR [eax],al
    24fc:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    2503:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    2506:	00 00                	add    BYTE PTR [eax],al
    2508:	05 04 95 00 00       	add    eax,0x9504
    250d:	00 06                	add    BYTE PTR [esi],al
    250f:	25 00 00 00 02       	and    eax,0x2000000
    2514:	04 07                	add    al,0x7
    2516:	2d 00 00 00 02       	sub    eax,0x2000000
    251b:	04 07                	add    al,0x7
    251d:	dc 00                	fadd   QWORD PTR [eax]
    251f:	00 00                	add    BYTE PTR [eax],al
    2521:	05 04 25 00 00       	add    eax,0x2504
    2526:	00 07                	add    BYTE PTR [edi],al
    2528:	63 09                	arpl   WORD PTR [ecx],cx
    252a:	00 00                	add    BYTE PTR [eax],al
    252c:	01 57 6f             	add    DWORD PTR [edi+0x6f],edx
    252f:	00 00                	add    BYTE PTR [eax],al
    2531:	00 1c 15 00 30 9c 01 	add    BYTE PTR [edx*1+0x19c3000],bl
    2538:	00 00                	add    BYTE PTR [eax],al
    253a:	01 9c 43 01 00 00 08 	add    DWORD PTR [ebx+eax*2+0x8000001],ebx
    2541:	25 09 00 00 01       	and    eax,0x1000009
    2546:	57                   	push   edi
    2547:	8f 00                	pop    DWORD PTR [eax]
    2549:	00 00                	add    BYTE PTR [eax],al
    254b:	02 91 00 08 1e 09    	add    dl,BYTE PTR [ecx+0x91e0800]
    2551:	00 00                	add    BYTE PTR [eax],al
    2553:	01 57 43             	add    DWORD PTR [edi+0x43],edx
    2556:	01 00                	add    DWORD PTR [eax],eax
    2558:	00 02                	add    BYTE PTR [edx],al
    255a:	91                   	xchg   ecx,eax
    255b:	04 08                	add    al,0x8
    255d:	2a 09                	sub    cl,BYTE PTR [ecx]
    255f:	00 00                	add    BYTE PTR [eax],al
    2561:	01 57 3a             	add    DWORD PTR [edi+0x3a],edx
    2564:	00 00                	add    BYTE PTR [eax],al
    2566:	00 02                	add    BYTE PTR [edx],al
    2568:	91                   	xchg   ecx,eax
    2569:	08 09                	or     BYTE PTR [ecx],cl
    256b:	73 00                	jae    256d <sysEnter_Vector-0x12da93>
    256d:	01 59 8f             	add    DWORD PTR [ecx-0x71],ebx
    2570:	00 00                	add    BYTE PTR [eax],al
    2572:	00 01                	add    BYTE PTR [ecx],al
    2574:	56                   	push   esi
    2575:	09 61 63             	or     DWORD PTR [ecx+0x63],esp
    2578:	63 00                	arpl   WORD PTR [eax],ax
    257a:	01 5a 9a             	add    DWORD PTR [edx-0x66],ebx
    257d:	00 00                	add    BYTE PTR [eax],al
    257f:	00 01                	add    BYTE PTR [ecx],al
    2581:	57                   	push   edi
    2582:	09 63 00             	or     DWORD PTR [ebx+0x0],esp
    2585:	01 5b 3a             	add    DWORD PTR [ebx+0x3a],ebx
    2588:	00 00                	add    BYTE PTR [eax],al
    258a:	00 01                	add    BYTE PTR [ecx],al
    258c:	53                   	push   ebx
    258d:	0a 08                	or     cl,BYTE PTR [eax]
    258f:	09 00                	or     DWORD PTR [eax],eax
    2591:	00 01                	add    BYTE PTR [ecx],al
    2593:	5c                   	pop    esp
    2594:	9a 00 00 00 0b 6e 65 	call   0x656e:0xb000000
    259b:	67 00 01             	add    BYTE PTR [bx+di],al
    259e:	5d                   	pop    ebp
    259f:	3a 00                	cmp    al,BYTE PTR [eax]
    25a1:	00 00                	add    BYTE PTR [eax],al
    25a3:	09 61 6e             	or     DWORD PTR [ecx+0x6e],esp
    25a6:	79 00                	jns    25a8 <sysEnter_Vector-0x12da58>
    25a8:	01 5d 3a             	add    DWORD PTR [ebp+0x3a],ebx
    25ab:	00 00                	add    BYTE PTR [eax],al
    25ad:	00 01                	add    BYTE PTR [ecx],al
    25af:	51                   	push   ecx
    25b0:	0a 0f                	or     cl,BYTE PTR [edi]
    25b2:	09 00                	or     DWORD PTR [eax],eax
    25b4:	00 01                	add    BYTE PTR [ecx],al
    25b6:	5d                   	pop    ebp
    25b7:	3a 00                	cmp    al,BYTE PTR [eax]
    25b9:	00 00                	add    BYTE PTR [eax],al
    25bb:	00 05 04 a8 00 00    	add    BYTE PTR ds:0xa804,al
    25c1:	00 0c 3f             	add    BYTE PTR [edi+edi*1],cl
    25c4:	00 00                	add    BYTE PTR [eax],al
    25c6:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    25c9:	56                   	push   esi
    25ca:	00 00                	add    BYTE PTR [eax],al
    25cc:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
    25d2:	30 0c aa             	xor    BYTE PTR [edx+ebp*4],cl
    25d5:	00 00                	add    BYTE PTR [eax],al
    25d7:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    25da:	56                   	push   esi
    25db:	00 00                	add    BYTE PTR [eax],al
    25dd:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
    25e3:	30 0c 56             	xor    BYTE PTR [esi+edx*2],cl
    25e6:	01 00                	add    DWORD PTR [eax],eax
    25e8:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    25ef:	05 03 44 38 00       	add    eax,0x384403
    25f4:	30 0c 48             	xor    BYTE PTR [eax+ecx*2],cl
    25f7:	00 00                	add    BYTE PTR [eax],al
    25f9:	00 05 37 84 00 00    	add    BYTE PTR ds:0x8437,al
    25ff:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
    2605:	30 00                	xor    BYTE PTR [eax],al
    2607:	3f                   	aas    
    2608:	01 00                	add    DWORD PTR [eax],eax
    260a:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    260d:	1f                   	pop    ds
    260e:	0f 00 00             	sldt   WORD PTR [eax]
    2611:	04 01                	add    al,0x1
    2613:	ef                   	out    dx,eax
    2614:	00 00                	add    BYTE PTR [eax],al
    2616:	00 0c 70             	add    BYTE PTR [eax+esi*2],cl
    2619:	09 00                	or     DWORD PTR [eax],eax
    261b:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    261e:	00 00                	add    BYTE PTR [eax],al
    2620:	b8 16 00 30 96       	mov    eax,0x96300016
    2625:	00 00                	add    BYTE PTR [eax],al
    2627:	00 f6                	add    dh,dh
    2629:	12 00                	adc    al,BYTE PTR [eax]
    262b:	00 02                	add    BYTE PTR [edx],al
    262d:	01 06                	add    DWORD PTR [esi],eax
    262f:	58                   	pop    eax
    2630:	00 00                	add    BYTE PTR [eax],al
    2632:	00 02                	add    BYTE PTR [edx],al
    2634:	01 06                	add    DWORD PTR [esi],eax
    2636:	51                   	push   ecx
    2637:	00 00                	add    BYTE PTR [eax],al
    2639:	00 02                	add    BYTE PTR [edx],al
    263b:	02 05 e5 00 00 00    	add    al,BYTE PTR ds:0xe5
    2641:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
    2648:	02 08                	add    cl,BYTE PTR [eax]
    264a:	05 00 00 00 00       	add    eax,0x0
    264f:	02 01                	add    al,BYTE PTR [ecx]
    2651:	08 4f 00             	or     BYTE PTR [edi+0x0],cl
    2654:	00 00                	add    BYTE PTR [eax],al
    2656:	02 02                	add    al,BYTE PTR [edx]
    2658:	07                   	pop    es
    2659:	0e                   	push   cs
    265a:	00 00                	add    BYTE PTR [eax],al
    265c:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
    265f:	00 00                	add    BYTE PTR [eax],al
    2661:	00 02                	add    BYTE PTR [edx],al
    2663:	34 61                	xor    al,0x61
    2665:	00 00                	add    BYTE PTR [eax],al
    2667:	00 02                	add    BYTE PTR [edx],al
    2669:	04 07                	add    al,0x7
    266b:	32 00                	xor    al,BYTE PTR [eax]
    266d:	00 00                	add    BYTE PTR [eax],al
    266f:	02 08                	add    cl,BYTE PTR [eax]
    2671:	07                   	pop    es
    2672:	28 00                	sub    BYTE PTR [eax],al
    2674:	00 00                	add    BYTE PTR [eax],al
    2676:	02 04 05 05 00 00 00 	add    al,BYTE PTR [eax*1+0x5]
    267d:	02 0c 04             	add    cl,BYTE PTR [esp+eax*1]
    2680:	96                   	xchg   esi,eax
    2681:	00 00                	add    BYTE PTR [eax],al
    2683:	00 02                	add    BYTE PTR [edx],al
    2685:	01 02                	add    DWORD PTR [edx],eax
    2687:	90                   	nop
    2688:	00 00                	add    BYTE PTR [eax],al
    268a:	00 04 5d 00 00 00 03 	add    BYTE PTR [ebx*2+0x3000000],al
    2691:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
    2694:	00 00                	add    BYTE PTR [eax],al
    2696:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
    2699:	2d 00 00 00 02       	sub    eax,0x2000000
    269e:	04 07                	add    al,0x7
    26a0:	dc 00                	fadd   QWORD PTR [eax]
    26a2:	00 00                	add    BYTE PTR [eax],al
    26a4:	05 04 25 00 00       	add    eax,0x2504
    26a9:	00 06                	add    BYTE PTR [esi],al
    26ab:	86 09                	xchg   BYTE PTR [ecx],cl
    26ad:	00 00                	add    BYTE PTR [eax],al
    26af:	01 03                	add    DWORD PTR [ebx],eax
    26b1:	b8 16 00 30 96       	mov    eax,0x96300016
    26b6:	00 00                	add    BYTE PTR [eax],al
    26b8:	00 01                	add    BYTE PTR [ecx],al
    26ba:	9c                   	pushf  
    26bb:	fe 00                	inc    BYTE PTR [eax]
    26bd:	00 00                	add    BYTE PTR [eax],al
    26bf:	07                   	pop    es
    26c0:	6a 09                	push   0x9
    26c2:	00 00                	add    BYTE PTR [eax],al
    26c4:	01 03                	add    DWORD PTR [ebx],eax
    26c6:	9d                   	popf   
    26c7:	00 00                	add    BYTE PTR [eax],al
    26c9:	00 02                	add    BYTE PTR [edx],al
    26cb:	91                   	xchg   ecx,eax
    26cc:	00 08                	add    BYTE PTR [eax],cl
    26ce:	64                   	fs
    26cf:	73 74                	jae    2745 <sysEnter_Vector-0x12d8bb>
    26d1:	00 01                	add    BYTE PTR [ecx],al
    26d3:	05 9d 00 00 00       	add    eax,0x9d
    26d8:	02 91 6c 08 73 72    	add    dl,BYTE PTR [ecx+0x7273086c]
    26de:	63 00                	arpl   WORD PTR [eax],ax
    26e0:	01 05 9d 00 00 00    	add    DWORD PTR ds:0x9d,eax
    26e6:	02 91 68 08 65 6e    	add    dl,BYTE PTR [ecx+0x6e650868]
    26ec:	64 00 01             	add    BYTE PTR fs:[ecx],al
    26ef:	06                   	push   es
    26f0:	9d                   	popf   
    26f1:	00 00                	add    BYTE PTR [eax],al
    26f3:	00 02                	add    BYTE PTR [edx],al
    26f5:	91                   	xchg   ecx,eax
    26f6:	64                   	fs
    26f7:	09 f9                	or     ecx,edi
    26f9:	01 00                	add    DWORD PTR [eax],eax
    26fb:	00 01                	add    BYTE PTR [ecx],al
    26fd:	11 3a                	adc    DWORD PTR [edx],edi
    26ff:	00 00                	add    BYTE PTR [eax],al
    2701:	00 0a                	add    BYTE PTR [edx],cl
    2703:	00 00                	add    BYTE PTR [eax],al
    2705:	0b 3f                	or     edi,DWORD PTR [edi]
    2707:	00 00                	add    BYTE PTR [eax],al
    2709:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    270c:	56                   	push   esi
    270d:	00 00                	add    BYTE PTR [eax],al
    270f:	00 05 03 48 38 00    	add    BYTE PTR ds:0x384803,al
    2715:	30 0b                	xor    BYTE PTR [ebx],cl
    2717:	aa                   	stos   BYTE PTR es:[edi],al
    2718:	00 00                	add    BYTE PTR [eax],al
    271a:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    271d:	56                   	push   esi
    271e:	00 00                	add    BYTE PTR [eax],al
    2720:	00 05 03 4c 38 00    	add    BYTE PTR ds:0x384c03,al
    2726:	30 0b                	xor    BYTE PTR [ebx],cl
    2728:	56                   	push   esi
    2729:	01 00                	add    DWORD PTR [eax],eax
    272b:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
    2732:	05 03 44 38 00       	add    eax,0x384403
    2737:	30 0b                	xor    BYTE PTR [ebx],cl
    2739:	48                   	dec    eax
    273a:	00 00                	add    BYTE PTR [eax],al
    273c:	00 05 37 84 00 00    	add    BYTE PTR ds:0x8437,al
    2742:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
    2748:	30 00                	xor    BYTE PTR [eax],al
    274a:	50                   	push   eax
    274b:	04 00                	add    al,0x0
    274d:	00 04 00             	add    BYTE PTR [eax+eax*1],al
    2750:	be 0f 00 00 04       	mov    esi,0x400000f
    2755:	01 ef                	add    edi,ebp
    2757:	00 00                	add    BYTE PTR [eax],al
    2759:	00 0c 0b             	add    BYTE PTR [ebx+ecx*1],cl
    275c:	0a 00                	or     al,BYTE PTR [eax]
    275e:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
    2761:	00 00                	add    BYTE PTR [eax],al
    2763:	50                   	push   eax
    2764:	17                   	pop    ss
    2765:	00 30                	add    BYTE PTR [eax],dh
    2767:	16                   	push   ss
    2768:	0c 00                	or     al,0x0
    276a:	00 d0                	add    al,dl
    276c:	13 00                	adc    eax,DWORD PTR [eax]
    276e:	00 02                	add    BYTE PTR [edx],al
    2770:	65 02 00             	add    al,BYTE PTR gs:[eax]
    2773:	00 04 b3             	add    BYTE PTR [ebx+esi*4],al
    2776:	00 00                	add    BYTE PTR [eax],al
    2778:	00 06                	add    BYTE PTR [esi],al
    277a:	15 b3 00 00 00       	adc    eax,0xb3
    277f:	03 4b 03             	add    ecx,DWORD PTR [ebx+0x3]
    2782:	00 00                	add    BYTE PTR [eax],al
    2784:	00 03                	add    BYTE PTR [ebx],al
    2786:	f4                   	hlt    
    2787:	02 00                	add    al,BYTE PTR [eax]
    2789:	00 01                	add    BYTE PTR [ecx],al
    278b:	03 da                	add    ebx,edx
    278d:	02 00                	add    al,BYTE PTR [eax]
    278f:	00 03                	add    BYTE PTR [ebx],al
    2791:	03 3d 03 00 00 04    	add    edi,DWORD PTR ds:0x4000003
    2797:	03 44 02 00          	add    eax,DWORD PTR [edx+eax*1+0x0]
    279b:	00 4f 03             	add    BYTE PTR [edi+0x3],cl
    279e:	e7 02                	out    0x2,eax
    27a0:	00 00                	add    BYTE PTR [eax],al
    27a2:	59                   	pop    ecx
    27a3:	03 6f 02             	add    ebp,DWORD PTR [edi+0x2]
    27a6:	00 00                	add    BYTE PTR [eax],al
    27a8:	61                   	popa   
    27a9:	03 6a 03             	add    ebp,DWORD PTR [edx+0x3]
    27ac:	00 00                	add    BYTE PTR [eax],al
    27ae:	97                   	xchg   edi,eax
    27af:	04 0c                	add    al,0xc
    27b1:	03 00                	add    eax,DWORD PTR [eax]
    27b3:	00 63 01             	add    BYTE PTR [ebx+0x1],ah
    27b6:	04 23                	add    al,0x23
    27b8:	03 00                	add    eax,DWORD PTR [eax]
    27ba:	00 64 01 04          	add    BYTE PTR [ecx+eax*1+0x4],ah
    27be:	c7 02 00 00 65 01    	mov    DWORD PTR [edx],0x1650000
    27c4:	04 9e                	add    al,0x9e
    27c6:	02 00                	add    al,BYTE PTR [eax]
    27c8:	00 66 01             	add    BYTE PTR [esi+0x1],ah
    27cb:	04 82                	add    al,0x82
    27cd:	02 00                	add    al,BYTE PTR [eax]
    27cf:	00 67 01             	add    BYTE PTR [edi+0x1],ah
    27d2:	04 30                	add    al,0x30
    27d4:	03 00                	add    eax,DWORD PTR [eax]
    27d6:	00 68 01             	add    BYTE PTR [eax+0x1],ch
    27d9:	04 5b                	add    al,0x5b
    27db:	03 00                	add    eax,DWORD PTR [eax]
    27dd:	00 69 01             	add    BYTE PTR [ecx+0x1],ch
    27e0:	04 16                	add    al,0x16
    27e2:	02 00                	add    al,BYTE PTR [eax]
    27e4:	00 70 01             	add    BYTE PTR [eax+0x1],dh
    27e7:	04 88                	add    al,0x88
    27e9:	03 00                	add    eax,DWORD PTR [eax]
    27eb:	00 00                	add    BYTE PTR [eax],al
    27ed:	03 04 b8             	add    eax,DWORD PTR [eax+edi*4]
    27f0:	02 00                	add    al,BYTE PTR [eax]
    27f2:	00 01                	add    BYTE PTR [ecx],al
    27f4:	03 04 27             	add    eax,DWORD PTR [edi+eiz*1]
    27f7:	02 00                	add    al,BYTE PTR [eax]
    27f9:	00 02                	add    BYTE PTR [edx],al
    27fb:	03 00                	add    eax,DWORD PTR [eax]
    27fd:	05 04 07 32 00       	add    eax,0x320704
    2802:	00 00                	add    BYTE PTR [eax],al
    2804:	05 01 06 58 00       	add    eax,0x580601
    2809:	00 00                	add    BYTE PTR [eax],al
    280b:	05 01 06 51 00       	add    eax,0x510601
    2810:	00 00                	add    BYTE PTR [eax],al
    2812:	05 02 05 e5 00       	add    eax,0xe50502
    2817:	00 00                	add    BYTE PTR [eax],al
    2819:	06                   	push   es
    281a:	04 05                	add    al,0x5
    281c:	69 6e 74 00 05 08 05 	imul   ebp,DWORD PTR [esi+0x74],0x5080500
    2823:	00 00                	add    BYTE PTR [eax],al
    2825:	00 00                	add    BYTE PTR [eax],al
    2827:	05 01 08 4f 00       	add    eax,0x4f0801
    282c:	00 00                	add    BYTE PTR [eax],al
    282e:	05 02 07 0e 00       	add    eax,0xe0702
    2833:	00 00                	add    BYTE PTR [eax],al
    2835:	07                   	pop    es
    2836:	64 00 00             	add    BYTE PTR fs:[eax],al
    2839:	00 02                	add    BYTE PTR [edx],al
    283b:	34 b3                	xor    al,0xb3
    283d:	00 00                	add    BYTE PTR [eax],al
    283f:	00 05 08 07 28 00    	add    BYTE PTR ds:0x280708,al
    2845:	00 00                	add    BYTE PTR [eax],al
    2847:	05 04 05 05 00       	add    eax,0x50504
    284c:	00 00                	add    BYTE PTR [eax],al
    284e:	05 0c 04 96 00       	add    eax,0x96040c
    2853:	00 00                	add    BYTE PTR [eax],al
    2855:	05 01 02 90 00       	add    eax,0x900201
    285a:	00 00                	add    BYTE PTR [eax],al
    285c:	07                   	pop    es
    285d:	5d                   	pop    ebp
    285e:	00 00                	add    BYTE PTR [eax],al
    2860:	00 03                	add    BYTE PTR [ebx],al
    2862:	2a fd                	sub    bh,ch
    2864:	00 00                	add    BYTE PTR [eax],al
    2866:	00 08                	add    BYTE PTR [eax],cl
    2868:	74 6d                	je     28d7 <sysEnter_Vector-0x12d729>
    286a:	00 2c 03             	add    BYTE PTR [ebx+eax*1],ch
    286d:	2c ad                	sub    al,0xad
    286f:	01 00                	add    DWORD PTR [eax],eax
    2871:	00 09                	add    BYTE PTR [ecx],cl
    2873:	07                   	pop    es
    2874:	05 00 00 03 2e       	add    eax,0x2e030000
    2879:	cf                   	iret   
    287a:	00 00                	add    BYTE PTR [eax],al
    287c:	00 00                	add    BYTE PTR [eax],al
    287e:	09 6c 04 00          	or     DWORD PTR [esp+eax*1+0x0],ebp
    2882:	00 03                	add    BYTE PTR [ebx],al
    2884:	2f                   	das    
    2885:	cf                   	iret   
    2886:	00 00                	add    BYTE PTR [eax],al
    2888:	00 04 09             	add    BYTE PTR [ecx+ecx*1],al
    288b:	9d                   	popf   
    288c:	03 00                	add    eax,DWORD PTR [eax]
    288e:	00 03                	add    BYTE PTR [ebx],al
    2890:	30 cf                	xor    bh,cl
    2892:	00 00                	add    BYTE PTR [eax],al
    2894:	00 08                	add    BYTE PTR [eax],cl
    2896:	09 f2                	or     edx,esi
    2898:	04 00                	add    al,0x0
    289a:	00 03                	add    BYTE PTR [ebx],al
    289c:	31 cf                	xor    edi,ecx
    289e:	00 00                	add    BYTE PTR [eax],al
    28a0:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
    28a3:	f1                   	icebp  
    28a4:	03 00                	add    eax,DWORD PTR [eax]
    28a6:	00 03                	add    BYTE PTR [ebx],al
    28a8:	32 cf                	xor    cl,bh
    28aa:	00 00                	add    BYTE PTR [eax],al
    28ac:	00 10                	add    BYTE PTR [eax],dl
    28ae:	09 f8                	or     eax,edi
    28b0:	03 00                	add    eax,DWORD PTR [eax]
    28b2:	00 03                	add    BYTE PTR [ebx],al
    28b4:	33 cf                	xor    ecx,edi
    28b6:	00 00                	add    BYTE PTR [eax],al
    28b8:	00 14 09             	add    BYTE PTR [ecx+ecx*1],dl
    28bb:	ea 04 00 00 03 34 cf 	jmp    0xcf34:0x3000004
    28c2:	00 00                	add    BYTE PTR [eax],al
    28c4:	00 18                	add    BYTE PTR [eax],bl
    28c6:	09 79 04             	or     DWORD PTR [ecx+0x4],edi
    28c9:	00 00                	add    BYTE PTR [eax],al
    28cb:	03 35 cf 00 00 00    	add    esi,DWORD PTR ds:0xcf
    28d1:	1c 09                	sbb    al,0x9
    28d3:	23 04 00             	and    eax,DWORD PTR [eax+eax*1]
    28d6:	00 03                	add    BYTE PTR [ebx],al
    28d8:	36                   	ss
    28d9:	cf                   	iret   
    28da:	00 00                	add    BYTE PTR [eax],al
    28dc:	00 20                	add    BYTE PTR [eax],ah
    28de:	09 b4 04 00 00 03 37 	or     DWORD PTR [esp+eax*1+0x37030000],esi
    28e5:	fd                   	std    
    28e6:	00 00                	add    BYTE PTR [eax],al
    28e8:	00 24 09             	add    BYTE PTR [ecx+ecx*1],ah
    28eb:	c2 03 00             	ret    0x3
    28ee:	00 03                	add    BYTE PTR [ebx],al
    28f0:	38 ad 01 00 00 28    	cmp    BYTE PTR [ebp+0x28000001],ch
    28f6:	00 0a                	add    BYTE PTR [edx],cl
    28f8:	04 b3                	add    al,0xb3
    28fa:	01 00                	add    DWORD PTR [eax],eax
    28fc:	00 0b                	add    BYTE PTR [ebx],cl
    28fe:	ba 00 00 00 05       	mov    edx,0x5000000
    2903:	04 07                	add    al,0x7
    2905:	2d 00 00 00 05       	sub    eax,0x5000000
    290a:	04 07                	add    al,0x7
    290c:	dc 00                	fadd   QWORD PTR [eax]
    290e:	00 00                	add    BYTE PTR [eax],al
    2910:	0a 04 ba             	or     al,BYTE PTR [edx+edi*4]
    2913:	00 00                	add    BYTE PTR [eax],al
    2915:	00 0c de             	add    BYTE PTR [esi+ebx*8],cl
    2918:	09 00                	or     DWORD PTR [eax],eax
    291a:	00 01                	add    BYTE PTR [ecx],al
    291c:	16                   	push   ss
    291d:	12 01                	adc    al,BYTE PTR [ecx]
    291f:	00 00                	add    BYTE PTR [eax],al
    2921:	50                   	push   eax
    2922:	17                   	pop    ss
    2923:	00 30                	add    BYTE PTR [eax],dh
    2925:	29 00                	sub    DWORD PTR [eax],eax
    2927:	00 00                	add    BYTE PTR [eax],al
    2929:	01 9c f4 01 00 00 0d 	add    DWORD PTR [esp+esi*8+0xd000001],ebx
    2930:	96                   	xchg   esi,eax
    2931:	03 00                	add    eax,DWORD PTR [eax]
    2933:	00 01                	add    BYTE PTR [ecx],al
    2935:	18 eb                	sbb    bl,ch
    2937:	00 00                	add    BYTE PTR [eax],al
    2939:	00 02                	add    BYTE PTR [edx],al
    293b:	91                   	xchg   ecx,eax
    293c:	74 00                	je     293e <sysEnter_Vector-0x12d6c2>
    293e:	0e                   	push   cs
    293f:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
    2940:	09 00                	or     DWORD PTR [eax],eax
    2942:	00 01                	add    BYTE PTR [ecx],al
    2944:	1e                   	push   ds
    2945:	62 02                	bound  eax,QWORD PTR [edx]
    2947:	00 00                	add    BYTE PTR [eax],al
    2949:	79 17                	jns    2962 <sysEnter_Vector-0x12d69e>
    294b:	00 30                	add    BYTE PTR [eax],dh
    294d:	19 03                	sbb    DWORD PTR [ebx],eax
    294f:	00 00                	add    BYTE PTR [eax],al
    2951:	01 9c 62 02 00 00 0f 	add    DWORD PTR [edx+eiz*2+0xf000002],ebx
    2958:	b0 09                	mov    al,0x9
    295a:	00 00                	add    BYTE PTR [eax],al
    295c:	01 1e                	add    DWORD PTR [esi],ebx
    295e:	68 02 00 00 02       	push   0x2000002
    2963:	91                   	xchg   ecx,eax
    2964:	00 0f                	add    BYTE PTR [edi],cl
    2966:	05 0a 00 00 01       	add    eax,0x100000a
    296b:	1e                   	push   ds
    296c:	62 02                	bound  eax,QWORD PTR [edx]
    296e:	00 00                	add    BYTE PTR [eax],al
    2970:	02 91 04 0d de 09    	add    dl,BYTE PTR [ecx+0x9de0d04]
    2976:	00 00                	add    BYTE PTR [eax],al
    2978:	01 1f                	add    DWORD PTR [edi],ebx
    297a:	12 01                	adc    al,BYTE PTR [ecx]
    297c:	00 00                	add    BYTE PTR [eax],al
    297e:	02 91 68 0d e3 09    	add    dl,BYTE PTR [ecx+0x9e30d68]
    2984:	00 00                	add    BYTE PTR [eax],al
    2986:	01 20                	add    DWORD PTR [eax],esp
    2988:	b8 01 00 00 02       	mov    eax,0x2000001
    298d:	91                   	xchg   ecx,eax
    298e:	64                   	fs
    298f:	0d 98 09 00 00       	or     eax,0x998
    2994:	01 20                	add    DWORD PTR [eax],esp
    2996:	b8 01 00 00 02       	mov    eax,0x2000001
    299b:	91                   	xchg   ecx,eax
    299c:	70 0d                	jo     29ab <sysEnter_Vector-0x12d655>
    299e:	fb                   	sti    
    299f:	03 00                	add    eax,DWORD PTR [eax]
    29a1:	00 01                	add    BYTE PTR [ecx],al
    29a3:	21 cf                	and    edi,ecx
    29a5:	00 00                	add    BYTE PTR [eax],al
    29a7:	00 02                	add    BYTE PTR [edx],al
    29a9:	91                   	xchg   ecx,eax
    29aa:	6c                   	ins    BYTE PTR es:[edi],dx
    29ab:	00 0a                	add    BYTE PTR [edx],cl
    29ad:	04 1d                	add    al,0x1d
    29af:	01 00                	add    DWORD PTR [eax],eax
    29b1:	00 0a                	add    BYTE PTR [edx],cl
    29b3:	04 6e                	add    al,0x6e
    29b5:	02 00                	add    al,BYTE PTR [eax]
    29b7:	00 0b                	add    BYTE PTR [ebx],cl
    29b9:	12 01                	adc    al,BYTE PTR [ecx]
    29bb:	00 00                	add    BYTE PTR [eax],al
    29bd:	10 8e 09 00 00 01    	adc    BYTE PTR [esi+0x1000009],cl
    29c3:	3a 62 02             	cmp    ah,BYTE PTR [edx+0x2]
    29c6:	00 00                	add    BYTE PTR [eax],al
    29c8:	92                   	xchg   edx,eax
    29c9:	1a 00                	sbb    al,BYTE PTR [eax]
    29cb:	30 3f                	xor    BYTE PTR [edi],bh
    29cd:	00 00                	add    BYTE PTR [eax],al
    29cf:	00 01                	add    BYTE PTR [ecx],al
    29d1:	9c                   	pushf  
    29d2:	b5 02                	mov    ch,0x2
    29d4:	00 00                	add    BYTE PTR [eax],al
    29d6:	0f b0 09             	cmpxchg BYTE PTR [ecx],cl
    29d9:	00 00                	add    BYTE PTR [eax],al
    29db:	01 3a                	add    DWORD PTR [edx],edi
    29dd:	68 02 00 00 02       	push   0x2000002
    29e2:	91                   	xchg   ecx,eax
    29e3:	00 11                	add    BYTE PTR [ecx],dl
    29e5:	74 00                	je     29e7 <sysEnter_Vector-0x12d619>
    29e7:	01 3b                	add    DWORD PTR [ebx],edi
    29e9:	12 01                	adc    al,BYTE PTR [ecx]
    29eb:	00 00                	add    BYTE PTR [eax],al
    29ed:	02 91 6c 0d 05 0a    	add    dl,BYTE PTR [ecx+0xa050d6c]
    29f3:	00 00                	add    BYTE PTR [eax],al
    29f5:	01 3c 1d 01 00 00 02 	add    DWORD PTR [ebx*1+0x2000001],edi
    29fc:	91                   	xchg   ecx,eax
    29fd:	40                   	inc    eax
    29fe:	00 10                	add    BYTE PTR [eax],dl
    2a00:	b6 09                	mov    dh,0x9
    2a02:	00 00                	add    BYTE PTR [eax],al
    2a04:	01 42 62             	add    DWORD PTR [edx+0x62],eax
    2a07:	02 00                	add    al,BYTE PTR [eax]
    2a09:	00 d1                	add    cl,dl
    2a0b:	1a 00                	sbb    al,BYTE PTR [eax]
    2a0d:	30 3e                	xor    BYTE PTR [esi],bh
    2a0f:	00 00                	add    BYTE PTR [eax],al
    2a11:	00 01                	add    BYTE PTR [ecx],al
    2a13:	9c                   	pushf  
    2a14:	f7 02 00 00 0f b0    	test   DWORD PTR [edx],0xb00f0000
    2a1a:	09 00                	or     DWORD PTR [eax],eax
    2a1c:	00 01                	add    BYTE PTR [ecx],al
    2a1e:	42                   	inc    edx
    2a1f:	68 02 00 00 02       	push   0x2000002
    2a24:	91                   	xchg   ecx,eax
    2a25:	00 0f                	add    BYTE PTR [edi],cl
    2a27:	05 0a 00 00 01       	add    eax,0x100000a
    2a2c:	42                   	inc    edx
    2a2d:	62 02                	bound  eax,QWORD PTR [edx]
    2a2f:	00 00                	add    BYTE PTR [eax],al
    2a31:	02 91 04 11 74 00    	add    dl,BYTE PTR [ecx+0x741104]
    2a37:	01 43 12             	add    DWORD PTR [ebx+0x12],eax
    2a3a:	01 00                	add    DWORD PTR [eax],eax
    2a3c:	00 02                	add    BYTE PTR [edx],al
    2a3e:	91                   	xchg   ecx,eax
    2a3f:	6c                   	ins    BYTE PTR es:[edi],dx
    2a40:	00 0e                	add    BYTE PTR [esi],cl
    2a42:	dc 09                	fmul   QWORD PTR [ecx]
    2a44:	00 00                	add    BYTE PTR [eax],al
    2a46:	01 49 12             	add    DWORD PTR [ecx+0x12],ecx
    2a49:	01 00                	add    DWORD PTR [eax],eax
    2a4b:	00 0f                	add    BYTE PTR [edi],cl
    2a4d:	1b 00                	sbb    eax,DWORD PTR [eax]
    2a4f:	30 57 08             	xor    BYTE PTR [edi+0x8],dl
    2a52:	00 00                	add    BYTE PTR [eax],al
    2a54:	01 9c 8f 03 00 00 0f 	add    DWORD PTR [edi+ecx*4+0xf000003],ebx
    2a5b:	05 0a 00 00 01       	add    eax,0x100000a
    2a60:	49                   	dec    ecx
    2a61:	62 02                	bound  eax,QWORD PTR [edx]
    2a63:	00 00                	add    BYTE PTR [eax],al
    2a65:	02 91 00 11 64 61    	add    dl,BYTE PTR [ecx+0x61641100]
    2a6b:	79 00                	jns    2a6d <sysEnter_Vector-0x12d593>
    2a6d:	01 4a fd             	add    DWORD PTR [edx-0x3],ecx
    2a70:	00 00                	add    BYTE PTR [eax],al
    2a72:	00 02                	add    BYTE PTR [edx],al
    2a74:	91                   	xchg   ecx,eax
    2a75:	68 0d fb 03 00       	push   0x3fb0d
    2a7a:	00 01                	add    BYTE PTR [ecx],al
    2a7c:	4a                   	dec    edx
    2a7d:	fd                   	std    
    2a7e:	00 00                	add    BYTE PTR [eax],al
    2a80:	00 02                	add    BYTE PTR [edx],al
    2a82:	91                   	xchg   ecx,eax
    2a83:	54                   	push   esp
    2a84:	0d f8 03 00 00       	or     eax,0x3f8
    2a89:	01 4b cf             	add    DWORD PTR [ebx-0x31],ecx
    2a8c:	00 00                	add    BYTE PTR [eax],al
    2a8e:	00 02                	add    BYTE PTR [edx],al
    2a90:	91                   	xchg   ecx,eax
    2a91:	4c                   	dec    esp
    2a92:	0d 7c 04 00 00       	or     eax,0x47c
    2a97:	01 4c cf 00          	add    DWORD PTR [edi+ecx*8+0x0],ecx
    2a9b:	00 00                	add    BYTE PTR [eax],al
    2a9d:	02 91 64 0d ff 09    	add    dl,BYTE PTR [ecx+0x9ff0d64]
    2aa3:	00 00                	add    BYTE PTR [eax],al
    2aa5:	01 4c cf 00          	add    DWORD PTR [edi+ecx*8+0x0],ecx
    2aa9:	00 00                	add    BYTE PTR [eax],al
    2aab:	02 91 60 0d cc 04    	add    dl,BYTE PTR [ecx+0x4cc0d60]
    2ab1:	00 00                	add    BYTE PTR [eax],al
    2ab3:	01 4d fd             	add    DWORD PTR [ebp-0x3],ecx
    2ab6:	00 00                	add    BYTE PTR [eax],al
    2ab8:	00 02                	add    BYTE PTR [edx],al
    2aba:	91                   	xchg   ecx,eax
    2abb:	50                   	push   eax
    2abc:	0d f6 09 00 00       	or     eax,0x9f6
    2ac1:	01 4e cf             	add    DWORD PTR [esi-0x31],ecx
    2ac4:	00 00                	add    BYTE PTR [eax],al
    2ac6:	00 02                	add    BYTE PTR [edx],al
    2ac8:	91                   	xchg   ecx,eax
    2ac9:	5c                   	pop    esp
    2aca:	11 64 73 74          	adc    DWORD PTR [ebx+esi*2+0x74],esp
    2ace:	00 01                	add    BYTE PTR [ecx],al
    2ad0:	4f                   	dec    edi
    2ad1:	fd                   	std    
    2ad2:	00 00                	add    BYTE PTR [eax],al
    2ad4:	00 02                	add    BYTE PTR [edx],al
    2ad6:	91                   	xchg   ecx,eax
    2ad7:	58                   	pop    eax
    2ad8:	00 12                	add    BYTE PTR [edx],dl
    2ada:	3f                   	aas    
    2adb:	00 00                	add    BYTE PTR [eax],al
    2add:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    2ae0:	eb 00                	jmp    2ae2 <sysEnter_Vector-0x12d51e>
    2ae2:	00 00                	add    BYTE PTR [eax],al
    2ae4:	05 03 48 38 00       	add    eax,0x384803
    2ae9:	30 12                	xor    BYTE PTR [edx],dl
    2aeb:	aa                   	stos   BYTE PTR es:[edi],al
    2aec:	00 00                	add    BYTE PTR [eax],al
    2aee:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    2af1:	eb 00                	jmp    2af3 <sysEnter_Vector-0x12d50d>
    2af3:	00 00                	add    BYTE PTR [eax],al
    2af5:	05 03 4c 38 00       	add    eax,0x384c03
    2afa:	30 12                	xor    BYTE PTR [edx],dl
    2afc:	56                   	push   esi
    2afd:	01 00                	add    DWORD PTR [eax],eax
    2aff:	00 04 35 eb 00 00 00 	add    BYTE PTR [esi*1+0xeb],al
    2b06:	05 03 44 38 00       	add    eax,0x384403
    2b0b:	30 12                	xor    BYTE PTR [edx],dl
    2b0d:	48                   	dec    eax
    2b0e:	00 00                	add    BYTE PTR [eax],al
    2b10:	00 05 37 12 01 00    	add    BYTE PTR ds:0x11237,al
    2b16:	00 05 03 50 38 00    	add    BYTE PTR ds:0x385003,al
    2b1c:	30 12                	xor    BYTE PTR [edx],dl
    2b1e:	ec                   	in     al,dx
    2b1f:	09 00                	or     DWORD PTR [eax],eax
    2b21:	00 01                	add    BYTE PTR [ecx],al
    2b23:	0c cf                	or     al,0xcf
    2b25:	00 00                	add    BYTE PTR [eax],al
    2b27:	00 05 03 44 37 00    	add    BYTE PTR ds:0x374403,al
    2b2d:	30 12                	xor    BYTE PTR [edx],dl
    2b2f:	9e                   	sahf   
    2b30:	09 00                	or     DWORD PTR [eax],eax
    2b32:	00 01                	add    BYTE PTR [ecx],al
    2b34:	0d fd 00 00 00       	or     eax,0xfd
    2b39:	05 03 74 38 00       	add    eax,0x387403
    2b3e:	30 13                	xor    BYTE PTR [ebx],dl
    2b40:	c6 01 00             	mov    BYTE PTR [ecx],0x0
    2b43:	00 05 04 00 00 14    	add    BYTE PTR ds:0x14000004,al
    2b49:	bf 01 00 00 01       	mov    edi,0x1000001
    2b4e:	00 12                	add    BYTE PTR [edx],dl
    2b50:	c2 09 00             	ret    0x9
    2b53:	00 01                	add    BYTE PTR [ecx],al
    2b55:	0e                   	push   cs
    2b56:	f5                   	cmc    
    2b57:	03 00                	add    eax,DWORD PTR [eax]
    2b59:	00 05 03 3c 38 00    	add    BYTE PTR ds:0x383c03,al
    2b5f:	30 12                	xor    BYTE PTR [edx],dl
    2b61:	d0 09                	ror    BYTE PTR [ecx],1
    2b63:	00 00                	add    BYTE PTR [eax],al
    2b65:	01 0f                	add    DWORD PTR [edi],ecx
    2b67:	cf                   	iret   
    2b68:	00 00                	add    BYTE PTR [eax],al
    2b6a:	00 05 03 78 38 00    	add    BYTE PTR ds:0x387803,al
    2b70:	30 13                	xor    BYTE PTR [ebx],dl
    2b72:	cf                   	iret   
    2b73:	00 00                	add    BYTE PTR [eax],al
    2b75:	00 3d 04 00 00 14    	add    BYTE PTR ds:0x14000004,bh
    2b7b:	bf 01 00 00 01       	mov    edi,0x1000001
    2b80:	14 bf                	adc    al,0xbf
    2b82:	01 00                	add    DWORD PTR [eax],eax
    2b84:	00 0b                	add    BYTE PTR [ebx],cl
    2b86:	00 12                	add    BYTE PTR [edx],dl
    2b88:	ca 09 00             	retf   0x9
    2b8b:	00 01                	add    BYTE PTR [ecx],al
    2b8d:	11 4e 04             	adc    DWORD PTR [esi+0x4],ecx
    2b90:	00 00                	add    BYTE PTR [eax],al
    2b92:	05 03 c0 35 00       	add    eax,0x35c003
    2b97:	30 0b                	xor    BYTE PTR [ebx],cl
    2b99:	27                   	daa    
    2b9a:	04 00                	add    al,0x0
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
     a69:	27                   	daa    
     a6a:	19 11                	sbb    DWORD PTR [ecx],edx
     a6c:	01 12                	add    DWORD PTR [edx],edx
     a6e:	06                   	push   es
     a6f:	40                   	inc    eax
     a70:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     a76:	00 00                	add    BYTE PTR [eax],al
     a78:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
     a7b:	03 08                	add    ecx,DWORD PTR [eax]
     a7d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     a7f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     a81:	49                   	dec    ecx
     a82:	13 02                	adc    eax,DWORD PTR [edx]
     a84:	18 00                	sbb    BYTE PTR [eax],al
     a86:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
     a89:	00 03                	add    BYTE PTR [ebx],al
     a8b:	0e                   	push   cs
     a8c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     a8e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     a90:	49                   	dec    ecx
     a91:	13 3f                	adc    edi,DWORD PTR [edi]
     a93:	19 02                	sbb    DWORD PTR [edx],eax
     a95:	18 00                	sbb    BYTE PTR [eax],al
     a97:	00 00                	add    BYTE PTR [eax],al
     a99:	01 11                	add    DWORD PTR [ecx],edx
     a9b:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     aa1:	0e                   	push   cs
     aa2:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     aa4:	11 01                	adc    DWORD PTR [ecx],eax
     aa6:	12 06                	adc    al,BYTE PTR [esi]
     aa8:	10 17                	adc    BYTE PTR [edi],dl
     aaa:	00 00                	add    BYTE PTR [eax],al
     aac:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     aaf:	0b 0b                	or     ecx,DWORD PTR [ebx]
     ab1:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     ab4:	0e                   	push   cs
     ab5:	00 00                	add    BYTE PTR [eax],al
     ab7:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     aba:	0b 0b                	or     ecx,DWORD PTR [ebx]
     abc:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     abf:	08 00                	or     BYTE PTR [eax],al
     ac1:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     ac4:	00 03                	add    BYTE PTR [ebx],al
     ac6:	0e                   	push   cs
     ac7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     ac9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     acb:	49                   	dec    ecx
     acc:	13 00                	adc    eax,DWORD PTR [eax]
     ace:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     ad4:	49                   	dec    ecx
     ad5:	13 00                	adc    eax,DWORD PTR [eax]
     ad7:	00 06                	add    BYTE PTR [esi],al
     ad9:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
     add:	00 00                	add    BYTE PTR [eax],al
     adf:	07                   	pop    es
     ae0:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     ae3:	19 03                	sbb    DWORD PTR [ebx],eax
     ae5:	0e                   	push   cs
     ae6:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     ae8:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     aea:	27                   	daa    
     aeb:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     aee:	11 01                	adc    DWORD PTR [ecx],eax
     af0:	12 06                	adc    al,BYTE PTR [esi]
     af2:	40                   	inc    eax
     af3:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     af9:	00 00                	add    BYTE PTR [eax],al
     afb:	08 05 00 03 08 3a    	or     BYTE PTR ds:0x3a080300,al
     b01:	0b 3b                	or     edi,DWORD PTR [ebx]
     b03:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     b06:	02 18                	add    bl,BYTE PTR [eax]
     b08:	00 00                	add    BYTE PTR [eax],al
     b0a:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
     b0d:	03 08                	add    ecx,DWORD PTR [eax]
     b0f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     b11:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     b13:	49                   	dec    ecx
     b14:	13 02                	adc    eax,DWORD PTR [edx]
     b16:	18 00                	sbb    BYTE PTR [eax],al
     b18:	00 0a                	add    BYTE PTR [edx],cl
     b1a:	34 00                	xor    al,0x0
     b1c:	03 0e                	add    ecx,DWORD PTR [esi]
     b1e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     b20:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     b22:	49                   	dec    ecx
     b23:	13 3f                	adc    edi,DWORD PTR [edi]
     b25:	19 02                	sbb    DWORD PTR [edx],eax
     b27:	18 00                	sbb    BYTE PTR [eax],al
     b29:	00 00                	add    BYTE PTR [eax],al
     b2b:	01 11                	add    DWORD PTR [ecx],edx
     b2d:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     b33:	0e                   	push   cs
     b34:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     b36:	11 01                	adc    DWORD PTR [ecx],eax
     b38:	12 06                	adc    al,BYTE PTR [esi]
     b3a:	10 17                	adc    BYTE PTR [edi],dl
     b3c:	00 00                	add    BYTE PTR [eax],al
     b3e:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     b41:	0b 0b                	or     ecx,DWORD PTR [ebx]
     b43:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     b46:	0e                   	push   cs
     b47:	00 00                	add    BYTE PTR [eax],al
     b49:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     b4c:	0b 0b                	or     ecx,DWORD PTR [ebx]
     b4e:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     b51:	08 00                	or     BYTE PTR [eax],al
     b53:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     b56:	00 03                	add    BYTE PTR [ebx],al
     b58:	0e                   	push   cs
     b59:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     b5b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     b5d:	49                   	dec    ecx
     b5e:	13 00                	adc    eax,DWORD PTR [eax]
     b60:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     b66:	49                   	dec    ecx
     b67:	13 00                	adc    eax,DWORD PTR [eax]
     b69:	00 06                	add    BYTE PTR [esi],al
     b6b:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
     b6f:	00 00                	add    BYTE PTR [eax],al
     b71:	07                   	pop    es
     b72:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     b75:	19 03                	sbb    DWORD PTR [ebx],eax
     b77:	0e                   	push   cs
     b78:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     b7a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     b7c:	27                   	daa    
     b7d:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     b80:	11 01                	adc    DWORD PTR [ecx],eax
     b82:	12 06                	adc    al,BYTE PTR [esi]
     b84:	40                   	inc    eax
     b85:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     b8b:	00 00                	add    BYTE PTR [eax],al
     b8d:	08 05 00 03 08 3a    	or     BYTE PTR ds:0x3a080300,al
     b93:	0b 3b                	or     edi,DWORD PTR [ebx]
     b95:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     b98:	02 18                	add    bl,BYTE PTR [eax]
     b9a:	00 00                	add    BYTE PTR [eax],al
     b9c:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
     b9f:	03 08                	add    ecx,DWORD PTR [eax]
     ba1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     ba3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     ba5:	49                   	dec    ecx
     ba6:	13 02                	adc    eax,DWORD PTR [edx]
     ba8:	18 00                	sbb    BYTE PTR [eax],al
     baa:	00 0a                	add    BYTE PTR [edx],cl
     bac:	05 00 03 0e 3a       	add    eax,0x3a0e0300
     bb1:	0b 3b                	or     edi,DWORD PTR [ebx]
     bb3:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     bb6:	02 18                	add    bl,BYTE PTR [eax]
     bb8:	00 00                	add    BYTE PTR [eax],al
     bba:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
     bbd:	03 0e                	add    ecx,DWORD PTR [esi]
     bbf:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     bc1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     bc3:	49                   	dec    ecx
     bc4:	13 3f                	adc    edi,DWORD PTR [edi]
     bc6:	19 02                	sbb    DWORD PTR [edx],eax
     bc8:	18 00                	sbb    BYTE PTR [eax],al
     bca:	00 00                	add    BYTE PTR [eax],al
     bcc:	01 11                	add    DWORD PTR [ecx],edx
     bce:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     bd4:	0e                   	push   cs
     bd5:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     bd7:	11 01                	adc    DWORD PTR [ecx],eax
     bd9:	12 06                	adc    al,BYTE PTR [esi]
     bdb:	10 17                	adc    BYTE PTR [edi],dl
     bdd:	00 00                	add    BYTE PTR [eax],al
     bdf:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     be2:	0b 0b                	or     ecx,DWORD PTR [ebx]
     be4:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     be7:	08 00                	or     BYTE PTR [eax],al
     be9:	00 03                	add    BYTE PTR [ebx],al
     beb:	16                   	push   ss
     bec:	00 03                	add    BYTE PTR [ebx],al
     bee:	0e                   	push   cs
     bef:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     bf1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     bf3:	49                   	dec    ecx
     bf4:	13 00                	adc    eax,DWORD PTR [eax]
     bf6:	00 04 24             	add    BYTE PTR [esp],al
     bf9:	00 0b                	add    BYTE PTR [ebx],cl
     bfb:	0b 3e                	or     edi,DWORD PTR [esi]
     bfd:	0b 03                	or     eax,DWORD PTR [ebx]
     bff:	0e                   	push   cs
     c00:	00 00                	add    BYTE PTR [eax],al
     c02:	05 2e 01 3f 19       	add    eax,0x193f012e
     c07:	03 0e                	add    ecx,DWORD PTR [esi]
     c09:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     c0b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     c0d:	27                   	daa    
     c0e:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     c11:	11 01                	adc    DWORD PTR [ecx],eax
     c13:	12 06                	adc    al,BYTE PTR [esi]
     c15:	40                   	inc    eax
     c16:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     c1c:	00 00                	add    BYTE PTR [eax],al
     c1e:	06                   	push   es
     c1f:	05 00 03 08 3a       	add    eax,0x3a080300
     c24:	0b 3b                	or     edi,DWORD PTR [ebx]
     c26:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     c29:	02 18                	add    bl,BYTE PTR [eax]
     c2b:	00 00                	add    BYTE PTR [eax],al
     c2d:	07                   	pop    es
     c2e:	34 00                	xor    al,0x0
     c30:	03 08                	add    ecx,DWORD PTR [eax]
     c32:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     c34:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     c36:	49                   	dec    ecx
     c37:	13 02                	adc    eax,DWORD PTR [edx]
     c39:	18 00                	sbb    BYTE PTR [eax],al
     c3b:	00 08                	add    BYTE PTR [eax],cl
     c3d:	0f 00 0b             	str    WORD PTR [ebx]
     c40:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     c43:	00 00                	add    BYTE PTR [eax],al
     c45:	09 26                	or     DWORD PTR [esi],esp
     c47:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
     c4a:	00 00                	add    BYTE PTR [eax],al
     c4c:	0a 2e                	or     ch,BYTE PTR [esi]
     c4e:	01 3f                	add    DWORD PTR [edi],edi
     c50:	19 03                	sbb    DWORD PTR [ebx],eax
     c52:	0e                   	push   cs
     c53:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     c55:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     c57:	27                   	daa    
     c58:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     c5b:	11 01                	adc    DWORD PTR [ecx],eax
     c5d:	12 06                	adc    al,BYTE PTR [esi]
     c5f:	40                   	inc    eax
     c60:	18 97 42 19 00 00    	sbb    BYTE PTR [edi+0x1942],dl
     c66:	00 01                	add    BYTE PTR [ecx],al
     c68:	11 01                	adc    DWORD PTR [ecx],eax
     c6a:	25 0e 13 0b 03       	and    eax,0x30b130e
     c6f:	0e                   	push   cs
     c70:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     c72:	11 01                	adc    DWORD PTR [ecx],eax
     c74:	12 06                	adc    al,BYTE PTR [esi]
     c76:	10 17                	adc    BYTE PTR [edi],dl
     c78:	00 00                	add    BYTE PTR [eax],al
     c7a:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     c7d:	0b 0b                	or     ecx,DWORD PTR [ebx]
     c7f:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     c82:	08 00                	or     BYTE PTR [eax],al
     c84:	00 03                	add    BYTE PTR [ebx],al
     c86:	16                   	push   ss
     c87:	00 03                	add    BYTE PTR [ebx],al
     c89:	0e                   	push   cs
     c8a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     c8c:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     c8e:	49                   	dec    ecx
     c8f:	13 00                	adc    eax,DWORD PTR [eax]
     c91:	00 04 24             	add    BYTE PTR [esp],al
     c94:	00 0b                	add    BYTE PTR [ebx],cl
     c96:	0b 3e                	or     edi,DWORD PTR [esi]
     c98:	0b 03                	or     eax,DWORD PTR [ebx]
     c9a:	0e                   	push   cs
     c9b:	00 00                	add    BYTE PTR [eax],al
     c9d:	05 2e 01 3f 19       	add    eax,0x193f012e
     ca2:	03 0e                	add    ecx,DWORD PTR [esi]
     ca4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     ca6:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     ca8:	27                   	daa    
     ca9:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     cac:	11 01                	adc    DWORD PTR [ecx],eax
     cae:	12 06                	adc    al,BYTE PTR [esi]
     cb0:	40                   	inc    eax
     cb1:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     cb7:	00 00                	add    BYTE PTR [eax],al
     cb9:	06                   	push   es
     cba:	05 00 03 08 3a       	add    eax,0x3a080300
     cbf:	0b 3b                	or     edi,DWORD PTR [ebx]
     cc1:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     cc4:	02 18                	add    bl,BYTE PTR [eax]
     cc6:	00 00                	add    BYTE PTR [eax],al
     cc8:	07                   	pop    es
     cc9:	0f 00 0b             	str    WORD PTR [ebx]
     ccc:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     ccf:	00 00                	add    BYTE PTR [eax],al
     cd1:	08 26                	or     BYTE PTR [esi],ah
     cd3:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
     cd6:	00 00                	add    BYTE PTR [eax],al
     cd8:	00 01                	add    BYTE PTR [ecx],al
     cda:	11 01                	adc    DWORD PTR [ecx],eax
     cdc:	25 0e 13 0b 03       	and    eax,0x30b130e
     ce1:	0e                   	push   cs
     ce2:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     ce4:	11 01                	adc    DWORD PTR [ecx],eax
     ce6:	12 06                	adc    al,BYTE PTR [esi]
     ce8:	10 17                	adc    BYTE PTR [edi],dl
     cea:	00 00                	add    BYTE PTR [eax],al
     cec:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     cef:	0b 0b                	or     ecx,DWORD PTR [ebx]
     cf1:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     cf4:	08 00                	or     BYTE PTR [eax],al
     cf6:	00 03                	add    BYTE PTR [ebx],al
     cf8:	16                   	push   ss
     cf9:	00 03                	add    BYTE PTR [ebx],al
     cfb:	0e                   	push   cs
     cfc:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     cfe:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     d00:	49                   	dec    ecx
     d01:	13 00                	adc    eax,DWORD PTR [eax]
     d03:	00 04 24             	add    BYTE PTR [esp],al
     d06:	00 0b                	add    BYTE PTR [ebx],cl
     d08:	0b 3e                	or     edi,DWORD PTR [esi]
     d0a:	0b 03                	or     eax,DWORD PTR [ebx]
     d0c:	0e                   	push   cs
     d0d:	00 00                	add    BYTE PTR [eax],al
     d0f:	05 2e 01 3f 19       	add    eax,0x193f012e
     d14:	03 0e                	add    ecx,DWORD PTR [esi]
     d16:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     d18:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     d1a:	27                   	daa    
     d1b:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     d1e:	11 01                	adc    DWORD PTR [ecx],eax
     d20:	12 06                	adc    al,BYTE PTR [esi]
     d22:	40                   	inc    eax
     d23:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     d29:	00 00                	add    BYTE PTR [eax],al
     d2b:	06                   	push   es
     d2c:	05 00 03 08 3a       	add    eax,0x3a080300
     d31:	0b 3b                	or     edi,DWORD PTR [ebx]
     d33:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     d36:	02 18                	add    bl,BYTE PTR [eax]
     d38:	00 00                	add    BYTE PTR [eax],al
     d3a:	07                   	pop    es
     d3b:	34 00                	xor    al,0x0
     d3d:	03 08                	add    ecx,DWORD PTR [eax]
     d3f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     d41:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     d43:	49                   	dec    ecx
     d44:	13 02                	adc    eax,DWORD PTR [edx]
     d46:	18 00                	sbb    BYTE PTR [eax],al
     d48:	00 08                	add    BYTE PTR [eax],cl
     d4a:	0f 00 0b             	str    WORD PTR [ebx]
     d4d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     d50:	00 00                	add    BYTE PTR [eax],al
     d52:	09 26                	or     DWORD PTR [esi],esp
     d54:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
     d57:	00 00                	add    BYTE PTR [eax],al
     d59:	00 01                	add    BYTE PTR [ecx],al
     d5b:	11 01                	adc    DWORD PTR [ecx],eax
     d5d:	25 0e 13 0b 03       	and    eax,0x30b130e
     d62:	0e                   	push   cs
     d63:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     d65:	11 01                	adc    DWORD PTR [ecx],eax
     d67:	12 06                	adc    al,BYTE PTR [esi]
     d69:	10 17                	adc    BYTE PTR [edi],dl
     d6b:	00 00                	add    BYTE PTR [eax],al
     d6d:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     d70:	0b 0b                	or     ecx,DWORD PTR [ebx]
     d72:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     d75:	0e                   	push   cs
     d76:	00 00                	add    BYTE PTR [eax],al
     d78:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     d7b:	0b 0b                	or     ecx,DWORD PTR [ebx]
     d7d:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     d80:	08 00                	or     BYTE PTR [eax],al
     d82:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     d85:	00 03                	add    BYTE PTR [ebx],al
     d87:	0e                   	push   cs
     d88:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     d8a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     d8c:	49                   	dec    ecx
     d8d:	13 00                	adc    eax,DWORD PTR [eax]
     d8f:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     d95:	49                   	dec    ecx
     d96:	13 00                	adc    eax,DWORD PTR [eax]
     d98:	00 06                	add    BYTE PTR [esi],al
     d9a:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
     d9e:	00 00                	add    BYTE PTR [eax],al
     da0:	07                   	pop    es
     da1:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     da4:	19 03                	sbb    DWORD PTR [ebx],eax
     da6:	0e                   	push   cs
     da7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     da9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     dab:	27                   	daa    
     dac:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     daf:	11 01                	adc    DWORD PTR [ecx],eax
     db1:	12 06                	adc    al,BYTE PTR [esi]
     db3:	40                   	inc    eax
     db4:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     dba:	00 00                	add    BYTE PTR [eax],al
     dbc:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
     dc2:	0b 3b                	or     edi,DWORD PTR [ebx]
     dc4:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     dc7:	02 18                	add    bl,BYTE PTR [eax]
     dc9:	00 00                	add    BYTE PTR [eax],al
     dcb:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
     dce:	03 08                	add    ecx,DWORD PTR [eax]
     dd0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     dd2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     dd4:	49                   	dec    ecx
     dd5:	13 02                	adc    eax,DWORD PTR [edx]
     dd7:	18 00                	sbb    BYTE PTR [eax],al
     dd9:	00 0a                	add    BYTE PTR [edx],cl
     ddb:	34 00                	xor    al,0x0
     ddd:	03 0e                	add    ecx,DWORD PTR [esi]
     ddf:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     de1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     de3:	49                   	dec    ecx
     de4:	13 00                	adc    eax,DWORD PTR [eax]
     de6:	00 0b                	add    BYTE PTR [ebx],cl
     de8:	34 00                	xor    al,0x0
     dea:	03 08                	add    ecx,DWORD PTR [eax]
     dec:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     dee:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     df0:	49                   	dec    ecx
     df1:	13 00                	adc    eax,DWORD PTR [eax]
     df3:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
     df6:	00 03                	add    BYTE PTR [ebx],al
     df8:	0e                   	push   cs
     df9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     dfb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     dfd:	49                   	dec    ecx
     dfe:	13 02                	adc    eax,DWORD PTR [edx]
     e00:	18 00                	sbb    BYTE PTR [eax],al
     e02:	00 0d 34 00 03 0e    	add    BYTE PTR ds:0xe030034,cl
     e08:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     e0a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     e0c:	49                   	dec    ecx
     e0d:	13 3f                	adc    edi,DWORD PTR [edi]
     e0f:	19 02                	sbb    DWORD PTR [edx],eax
     e11:	18 00                	sbb    BYTE PTR [eax],al
     e13:	00 00                	add    BYTE PTR [eax],al
     e15:	01 11                	add    DWORD PTR [ecx],edx
     e17:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     e1d:	0e                   	push   cs
     e1e:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     e20:	11 01                	adc    DWORD PTR [ecx],eax
     e22:	12 06                	adc    al,BYTE PTR [esi]
     e24:	10 17                	adc    BYTE PTR [edi],dl
     e26:	00 00                	add    BYTE PTR [eax],al
     e28:	02 2e                	add    ch,BYTE PTR [esi]
     e2a:	01 3f                	add    DWORD PTR [edi],edi
     e2c:	19 03                	sbb    DWORD PTR [ebx],eax
     e2e:	0e                   	push   cs
     e2f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     e31:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     e33:	27                   	daa    
     e34:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     e37:	11 01                	adc    DWORD PTR [ecx],eax
     e39:	12 06                	adc    al,BYTE PTR [esi]
     e3b:	40                   	inc    eax
     e3c:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     e42:	00 00                	add    BYTE PTR [eax],al
     e44:	03 05 00 03 08 3a    	add    eax,DWORD PTR ds:0x3a080300
     e4a:	0b 3b                	or     edi,DWORD PTR [ebx]
     e4c:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     e4f:	02 18                	add    bl,BYTE PTR [eax]
     e51:	00 00                	add    BYTE PTR [eax],al
     e53:	04 0f                	add    al,0xf
     e55:	00 0b                	add    BYTE PTR [ebx],cl
     e57:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     e5a:	00 00                	add    BYTE PTR [eax],al
     e5c:	05 24 00 0b 0b       	add    eax,0xb0b0024
     e61:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     e64:	0e                   	push   cs
     e65:	00 00                	add    BYTE PTR [eax],al
     e67:	06                   	push   es
     e68:	24 00                	and    al,0x0
     e6a:	0b 0b                	or     ecx,DWORD PTR [ebx]
     e6c:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     e6f:	08 00                	or     BYTE PTR [eax],al
     e71:	00 00                	add    BYTE PTR [eax],al
     e73:	01 11                	add    DWORD PTR [ecx],edx
     e75:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     e7b:	0e                   	push   cs
     e7c:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     e7e:	11 01                	adc    DWORD PTR [ecx],eax
     e80:	12 06                	adc    al,BYTE PTR [esi]
     e82:	10 17                	adc    BYTE PTR [edi],dl
     e84:	00 00                	add    BYTE PTR [eax],al
     e86:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     e89:	0b 0b                	or     ecx,DWORD PTR [ebx]
     e8b:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     e8e:	0e                   	push   cs
     e8f:	00 00                	add    BYTE PTR [eax],al
     e91:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     e94:	0b 0b                	or     ecx,DWORD PTR [ebx]
     e96:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     e99:	08 00                	or     BYTE PTR [eax],al
     e9b:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     e9e:	00 03                	add    BYTE PTR [ebx],al
     ea0:	0e                   	push   cs
     ea1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     ea3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     ea5:	49                   	dec    ecx
     ea6:	13 00                	adc    eax,DWORD PTR [eax]
     ea8:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     eae:	49                   	dec    ecx
     eaf:	13 00                	adc    eax,DWORD PTR [eax]
     eb1:	00 06                	add    BYTE PTR [esi],al
     eb3:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
     eb7:	00 00                	add    BYTE PTR [eax],al
     eb9:	07                   	pop    es
     eba:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     ebd:	19 03                	sbb    DWORD PTR [ebx],eax
     ebf:	0e                   	push   cs
     ec0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     ec2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     ec4:	27                   	daa    
     ec5:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
     ec8:	11 01                	adc    DWORD PTR [ecx],eax
     eca:	12 06                	adc    al,BYTE PTR [esi]
     ecc:	40                   	inc    eax
     ecd:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
     ed3:	00 00                	add    BYTE PTR [eax],al
     ed5:	08 05 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,al
     edb:	0b 3b                	or     edi,DWORD PTR [ebx]
     edd:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     ee0:	02 18                	add    bl,BYTE PTR [eax]
     ee2:	00 00                	add    BYTE PTR [eax],al
     ee4:	09 34 00             	or     DWORD PTR [eax+eax*1],esi
     ee7:	03 08                	add    ecx,DWORD PTR [eax]
     ee9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     eeb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     eed:	49                   	dec    ecx
     eee:	13 02                	adc    eax,DWORD PTR [edx]
     ef0:	18 00                	sbb    BYTE PTR [eax],al
     ef2:	00 0a                	add    BYTE PTR [edx],cl
     ef4:	34 00                	xor    al,0x0
     ef6:	03 0e                	add    ecx,DWORD PTR [esi]
     ef8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     efa:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     efc:	49                   	dec    ecx
     efd:	13 00                	adc    eax,DWORD PTR [eax]
     eff:	00 0b                	add    BYTE PTR [ebx],cl
     f01:	34 00                	xor    al,0x0
     f03:	03 08                	add    ecx,DWORD PTR [eax]
     f05:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f07:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     f09:	49                   	dec    ecx
     f0a:	13 00                	adc    eax,DWORD PTR [eax]
     f0c:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
     f0f:	00 03                	add    BYTE PTR [ebx],al
     f11:	0e                   	push   cs
     f12:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f14:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     f16:	49                   	dec    ecx
     f17:	13 3f                	adc    edi,DWORD PTR [edi]
     f19:	19 02                	sbb    DWORD PTR [edx],eax
     f1b:	18 00                	sbb    BYTE PTR [eax],al
     f1d:	00 00                	add    BYTE PTR [eax],al
     f1f:	01 11                	add    DWORD PTR [ecx],edx
     f21:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     f27:	0e                   	push   cs
     f28:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     f2a:	11 01                	adc    DWORD PTR [ecx],eax
     f2c:	12 06                	adc    al,BYTE PTR [esi]
     f2e:	10 17                	adc    BYTE PTR [edi],dl
     f30:	00 00                	add    BYTE PTR [eax],al
     f32:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
     f35:	0b 0b                	or     ecx,DWORD PTR [ebx]
     f37:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     f3a:	0e                   	push   cs
     f3b:	00 00                	add    BYTE PTR [eax],al
     f3d:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     f40:	0b 0b                	or     ecx,DWORD PTR [ebx]
     f42:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     f45:	08 00                	or     BYTE PTR [eax],al
     f47:	00 04 16             	add    BYTE PTR [esi+edx*1],al
     f4a:	00 03                	add    BYTE PTR [ebx],al
     f4c:	0e                   	push   cs
     f4d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f4f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     f51:	49                   	dec    ecx
     f52:	13 00                	adc    eax,DWORD PTR [eax]
     f54:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
     f5a:	49                   	dec    ecx
     f5b:	13 00                	adc    eax,DWORD PTR [eax]
     f5d:	00 06                	add    BYTE PTR [esi],al
     f5f:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     f62:	19 03                	sbb    DWORD PTR [ebx],eax
     f64:	0e                   	push   cs
     f65:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f67:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     f69:	27                   	daa    
     f6a:	19 11                	sbb    DWORD PTR [ecx],edx
     f6c:	01 12                	add    DWORD PTR [edx],edx
     f6e:	06                   	push   es
     f6f:	40                   	inc    eax
     f70:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
     f76:	00 00                	add    BYTE PTR [eax],al
     f78:	07                   	pop    es
     f79:	05 00 03 0e 3a       	add    eax,0x3a0e0300
     f7e:	0b 3b                	or     edi,DWORD PTR [ebx]
     f80:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
     f83:	02 18                	add    bl,BYTE PTR [eax]
     f85:	00 00                	add    BYTE PTR [eax],al
     f87:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
     f8a:	03 08                	add    ecx,DWORD PTR [eax]
     f8c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f8e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     f90:	49                   	dec    ecx
     f91:	13 02                	adc    eax,DWORD PTR [edx]
     f93:	18 00                	sbb    BYTE PTR [eax],al
     f95:	00 09                	add    BYTE PTR [ecx],cl
     f97:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
     f9a:	19 03                	sbb    DWORD PTR [ebx],eax
     f9c:	0e                   	push   cs
     f9d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     f9f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     fa1:	49                   	dec    ecx
     fa2:	13 3c 19             	adc    edi,DWORD PTR [ecx+ebx*1]
     fa5:	00 00                	add    BYTE PTR [eax],al
     fa7:	0a 18                	or     bl,BYTE PTR [eax]
     fa9:	00 00                	add    BYTE PTR [eax],al
     fab:	00 0b                	add    BYTE PTR [ebx],cl
     fad:	34 00                	xor    al,0x0
     faf:	03 0e                	add    ecx,DWORD PTR [esi]
     fb1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     fb3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
     fb5:	49                   	dec    ecx
     fb6:	13 3f                	adc    edi,DWORD PTR [edi]
     fb8:	19 02                	sbb    DWORD PTR [edx],eax
     fba:	18 00                	sbb    BYTE PTR [eax],al
     fbc:	00 00                	add    BYTE PTR [eax],al
     fbe:	01 11                	add    DWORD PTR [ecx],edx
     fc0:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
     fc6:	0e                   	push   cs
     fc7:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     fc9:	11 01                	adc    DWORD PTR [ecx],eax
     fcb:	12 06                	adc    al,BYTE PTR [esi]
     fcd:	10 17                	adc    BYTE PTR [edi],dl
     fcf:	00 00                	add    BYTE PTR [eax],al
     fd1:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     fd4:	03 0e                	add    ecx,DWORD PTR [esi]
     fd6:	0b 0b                	or     ecx,DWORD PTR [ebx]
     fd8:	49                   	dec    ecx
     fd9:	13 3a                	adc    edi,DWORD PTR [edx]
     fdb:	0b 3b                	or     edi,DWORD PTR [ebx]
     fdd:	0b 01                	or     eax,DWORD PTR [ecx]
     fdf:	13 00                	adc    eax,DWORD PTR [eax]
     fe1:	00 03                	add    BYTE PTR [ebx],al
     fe3:	28 00                	sub    BYTE PTR [eax],al
     fe5:	03 0e                	add    ecx,DWORD PTR [esi]
     fe7:	1c 0b                	sbb    al,0xb
     fe9:	00 00                	add    BYTE PTR [eax],al
     feb:	04 28                	add    al,0x28
     fed:	00 03                	add    BYTE PTR [ebx],al
     fef:	0e                   	push   cs
     ff0:	1c 05                	sbb    al,0x5
     ff2:	00 00                	add    BYTE PTR [eax],al
     ff4:	05 24 00 0b 0b       	add    eax,0xb0b0024
     ff9:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
     ffc:	0e                   	push   cs
     ffd:	00 00                	add    BYTE PTR [eax],al
     fff:	06                   	push   es
    1000:	24 00                	and    al,0x0
    1002:	0b 0b                	or     ecx,DWORD PTR [ebx]
    1004:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
    1007:	08 00                	or     BYTE PTR [eax],al
    1009:	00 07                	add    BYTE PTR [edi],al
    100b:	16                   	push   ss
    100c:	00 03                	add    BYTE PTR [ebx],al
    100e:	0e                   	push   cs
    100f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1011:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1013:	49                   	dec    ecx
    1014:	13 00                	adc    eax,DWORD PTR [eax]
    1016:	00 08                	add    BYTE PTR [eax],cl
    1018:	13 01                	adc    eax,DWORD PTR [ecx]
    101a:	03 08                	add    ecx,DWORD PTR [eax]
    101c:	0b 0b                	or     ecx,DWORD PTR [ebx]
    101e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1020:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1022:	01 13                	add    DWORD PTR [ebx],edx
    1024:	00 00                	add    BYTE PTR [eax],al
    1026:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
    102c:	0b 3b                	or     edi,DWORD PTR [ebx]
    102e:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
    1031:	38 0b                	cmp    BYTE PTR [ebx],cl
    1033:	00 00                	add    BYTE PTR [eax],al
    1035:	0a 0f                	or     cl,BYTE PTR [edi]
    1037:	00 0b                	add    BYTE PTR [ebx],cl
    1039:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
    103c:	00 00                	add    BYTE PTR [eax],al
    103e:	0b 26                	or     esp,DWORD PTR [esi]
    1040:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
    1043:	00 00                	add    BYTE PTR [eax],al
    1045:	0c 2e                	or     al,0x2e
    1047:	01 3f                	add    DWORD PTR [edi],edi
    1049:	19 03                	sbb    DWORD PTR [ebx],eax
    104b:	0e                   	push   cs
    104c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    104e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1050:	49                   	dec    ecx
    1051:	13 11                	adc    edx,DWORD PTR [ecx]
    1053:	01 12                	add    DWORD PTR [edx],edx
    1055:	06                   	push   es
    1056:	40                   	inc    eax
    1057:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
    105d:	00 00                	add    BYTE PTR [eax],al
    105f:	0d 34 00 03 0e       	or     eax,0xe030034
    1064:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1066:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1068:	49                   	dec    ecx
    1069:	13 02                	adc    eax,DWORD PTR [edx]
    106b:	18 00                	sbb    BYTE PTR [eax],al
    106d:	00 0e                	add    BYTE PTR [esi],cl
    106f:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
    1072:	19 03                	sbb    DWORD PTR [ebx],eax
    1074:	0e                   	push   cs
    1075:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1077:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1079:	27                   	daa    
    107a:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
    107d:	11 01                	adc    DWORD PTR [ecx],eax
    107f:	12 06                	adc    al,BYTE PTR [esi]
    1081:	40                   	inc    eax
    1082:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
    1088:	00 00                	add    BYTE PTR [eax],al
    108a:	0f 05                	syscall 
    108c:	00 03                	add    BYTE PTR [ebx],al
    108e:	0e                   	push   cs
    108f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    1091:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    1093:	49                   	dec    ecx
    1094:	13 02                	adc    eax,DWORD PTR [edx]
    1096:	18 00                	sbb    BYTE PTR [eax],al
    1098:	00 10                	add    BYTE PTR [eax],dl
    109a:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
    109d:	19 03                	sbb    DWORD PTR [ebx],eax
    109f:	0e                   	push   cs
    10a0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    10a2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    10a4:	27                   	daa    
    10a5:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
    10a8:	11 01                	adc    DWORD PTR [ecx],eax
    10aa:	12 06                	adc    al,BYTE PTR [esi]
    10ac:	40                   	inc    eax
    10ad:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
    10b3:	00 00                	add    BYTE PTR [eax],al
    10b5:	11 34 00             	adc    DWORD PTR [eax+eax*1],esi
    10b8:	03 08                	add    ecx,DWORD PTR [eax]
    10ba:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    10bc:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    10be:	49                   	dec    ecx
    10bf:	13 02                	adc    eax,DWORD PTR [edx]
    10c1:	18 00                	sbb    BYTE PTR [eax],al
    10c3:	00 12                	add    BYTE PTR [edx],dl
    10c5:	34 00                	xor    al,0x0
    10c7:	03 0e                	add    ecx,DWORD PTR [esi]
    10c9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
    10cb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
    10cd:	49                   	dec    ecx
    10ce:	13 3f                	adc    edi,DWORD PTR [edi]
    10d0:	19 02                	sbb    DWORD PTR [edx],eax
    10d2:	18 00                	sbb    BYTE PTR [eax],al
    10d4:	00 13                	add    BYTE PTR [ebx],dl
    10d6:	01 01                	add    DWORD PTR [ecx],eax
    10d8:	49                   	dec    ecx
    10d9:	13 01                	adc    eax,DWORD PTR [ecx]
    10db:	13 00                	adc    eax,DWORD PTR [eax]
    10dd:	00 14 21             	add    BYTE PTR [ecx+eiz*1],dl
    10e0:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
    10e3:	2f                   	das    
    10e4:	0b 00                	or     eax,DWORD PTR [eax]
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
  b3:	30 67 03             	xor    BYTE PTR [edi+0x3],ah
	...
  be:	00 00                	add    BYTE PTR [eax],al
  c0:	1c 00                	sbb    al,0x0
  c2:	00 00                	add    BYTE PTR [eax],al
  c4:	02 00                	add    al,BYTE PTR [eax]
  c6:	46                   	inc    esi
  c7:	0e                   	push   cs
  c8:	00 00                	add    BYTE PTR [eax],al
  ca:	04 00                	add    al,0x0
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	00 00                	add    BYTE PTR [eax],al
  d0:	00 08                	add    BYTE PTR [eax],cl
  d2:	00 30                	add    BYTE PTR [eax],dh
  d4:	1a 03                	sbb    al,BYTE PTR [ebx]
	...
  de:	00 00                	add    BYTE PTR [eax],al
  e0:	1c 00                	sbb    al,0x0
  e2:	00 00                	add    BYTE PTR [eax],al
  e4:	02 00                	add    al,BYTE PTR [eax]
  e6:	9c                   	pushf  
  e7:	10 00                	adc    BYTE PTR [eax],al
  e9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
  ec:	00 00                	add    BYTE PTR [eax],al
  ee:	00 00                	add    BYTE PTR [eax],al
  f0:	1c 0b                	sbb    al,0xb
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
 110:	b8 0c 00 30 8e       	mov    eax,0x8e30000c
 115:	01 00                	add    DWORD PTR [eax],eax
	...
 11f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 122:	00 00                	add    BYTE PTR [eax],al
 124:	02 00                	add    al,BYTE PTR [eax]
 126:	9b                   	fwait
 127:	14 00                	adc    al,0x0
 129:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 12c:	00 00                	add    BYTE PTR [eax],al
 12e:	00 00                	add    BYTE PTR [eax],al
 130:	48                   	dec    eax
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
 150:	58                   	pop    eax
 151:	0e                   	push   cs
 152:	00 30                	add    BYTE PTR [eax],dh
 154:	60                   	pusha  
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
 170:	b8 10 00 30 ad       	mov    eax,0xad300010
	...
 17d:	00 00                	add    BYTE PTR [eax],al
 17f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 182:	00 00                	add    BYTE PTR [eax],al
 184:	02 00                	add    al,BYTE PTR [eax]
 186:	6e                   	outs   dx,BYTE PTR ds:[esi]
 187:	1d 00 00 04 00       	sbb    eax,0x40000
 18c:	00 00                	add    BYTE PTR [eax],al
 18e:	00 00                	add    BYTE PTR [eax],al
 190:	68 11 00 30 5e       	push   0x5e300011
	...
 19d:	00 00                	add    BYTE PTR [eax],al
 19f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 1a2:	00 00                	add    BYTE PTR [eax],al
 1a4:	02 00                	add    al,BYTE PTR [eax]
 1a6:	cc                   	int3   
 1a7:	1e                   	push   ds
 1a8:	00 00                	add    BYTE PTR [eax],al
 1aa:	04 00                	add    al,0x0
 1ac:	00 00                	add    BYTE PTR [eax],al
 1ae:	00 00                	add    BYTE PTR [eax],al
 1b0:	c8 11 00 30          	enter  0x11,0x30
 1b4:	87 00                	xchg   DWORD PTR [eax],eax
	...
 1be:	00 00                	add    BYTE PTR [eax],al
 1c0:	1c 00                	sbb    al,0x0
 1c2:	00 00                	add    BYTE PTR [eax],al
 1c4:	02 00                	add    al,BYTE PTR [eax]
 1c6:	4d                   	dec    ebp
 1c7:	20 00                	and    BYTE PTR [eax],al
 1c9:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 1cc:	00 00                	add    BYTE PTR [eax],al
 1ce:	00 00                	add    BYTE PTR [eax],al
 1d0:	50                   	push   eax
 1d1:	12 00                	adc    al,BYTE PTR [eax]
 1d3:	30 62 00             	xor    BYTE PTR [edx+0x0],ah
	...
 1de:	00 00                	add    BYTE PTR [eax],al
 1e0:	1c 00                	sbb    al,0x0
 1e2:	00 00                	add    BYTE PTR [eax],al
 1e4:	02 00                	add    al,BYTE PTR [eax]
 1e6:	1b 21                	sbb    esp,DWORD PTR [ecx]
 1e8:	00 00                	add    BYTE PTR [eax],al
 1ea:	04 00                	add    al,0x0
 1ec:	00 00                	add    BYTE PTR [eax],al
 1ee:	00 00                	add    BYTE PTR [eax],al
 1f0:	b4 12                	mov    ah,0x12
 1f2:	00 30                	add    BYTE PTR [eax],dh
 1f4:	67 00 00             	add    BYTE PTR [bx+si],al
	...
 1ff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 202:	00 00                	add    BYTE PTR [eax],al
 204:	02 00                	add    al,BYTE PTR [eax]
 206:	c1 21 00             	shl    DWORD PTR [ecx],0x0
 209:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 20c:	00 00                	add    BYTE PTR [eax],al
 20e:	00 00                	add    BYTE PTR [eax],al
 210:	1c 13                	sbb    al,0x13
 212:	00 30                	add    BYTE PTR [eax],dh
 214:	60                   	pusha  
	...
 21d:	00 00                	add    BYTE PTR [eax],al
 21f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 222:	00 00                	add    BYTE PTR [eax],al
 224:	02 00                	add    al,BYTE PTR [eax]
 226:	79 22                	jns    24a <sysEnter_Vector-0x12fdb6>
 228:	00 00                	add    BYTE PTR [eax],al
 22a:	04 00                	add    al,0x0
 22c:	00 00                	add    BYTE PTR [eax],al
 22e:	00 00                	add    BYTE PTR [eax],al
 230:	7c 13                	jl     245 <sysEnter_Vector-0x12fdbb>
 232:	00 30                	add    BYTE PTR [eax],dh
 234:	7d 01                	jge    237 <sysEnter_Vector-0x12fdc9>
	...
 23e:	00 00                	add    BYTE PTR [eax],al
 240:	1c 00                	sbb    al,0x0
 242:	00 00                	add    BYTE PTR [eax],al
 244:	02 00                	add    al,BYTE PTR [eax]
 246:	09 24 00             	or     DWORD PTR [eax+eax*1],esp
 249:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 24c:	00 00                	add    BYTE PTR [eax],al
 24e:	00 00                	add    BYTE PTR [eax],al
 250:	fc                   	cld    
 251:	14 00                	adc    al,0x0
 253:	30 1d 00 00 00 00    	xor    BYTE PTR ds:0x0,bl
 259:	00 00                	add    BYTE PTR [eax],al
 25b:	00 00                	add    BYTE PTR [eax],al
 25d:	00 00                	add    BYTE PTR [eax],al
 25f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 262:	00 00                	add    BYTE PTR [eax],al
 264:	02 00                	add    al,BYTE PTR [eax]
 266:	79 24                	jns    28c <sysEnter_Vector-0x12fd74>
 268:	00 00                	add    BYTE PTR [eax],al
 26a:	04 00                	add    al,0x0
 26c:	00 00                	add    BYTE PTR [eax],al
 26e:	00 00                	add    BYTE PTR [eax],al
 270:	1c 15                	sbb    al,0x15
 272:	00 30                	add    BYTE PTR [eax],dh
 274:	9c                   	pushf  
 275:	01 00                	add    DWORD PTR [eax],eax
	...
 27f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 282:	00 00                	add    BYTE PTR [eax],al
 284:	02 00                	add    al,BYTE PTR [eax]
 286:	07                   	pop    es
 287:	26 00 00             	add    BYTE PTR es:[eax],al
 28a:	04 00                	add    al,0x0
 28c:	00 00                	add    BYTE PTR [eax],al
 28e:	00 00                	add    BYTE PTR [eax],al
 290:	b8 16 00 30 96       	mov    eax,0x96300016
	...
 29d:	00 00                	add    BYTE PTR [eax],al
 29f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 2a2:	00 00                	add    BYTE PTR [eax],al
 2a4:	02 00                	add    al,BYTE PTR [eax]
 2a6:	4a                   	dec    edx
 2a7:	27                   	daa    
 2a8:	00 00                	add    BYTE PTR [eax],al
 2aa:	04 00                	add    al,0x0
 2ac:	00 00                	add    BYTE PTR [eax],al
 2ae:	00 00                	add    BYTE PTR [eax],al
 2b0:	50                   	push   eax
 2b1:	17                   	pop    ss
 2b2:	00 30                	add    BYTE PTR [eax],dh
 2b4:	16                   	push   ss
 2b5:	0c 00                	or     al,0x0
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
     4cd:	3d 4b 69 08 14       	cmp    eax,0x1408694b
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
     622:	08 24 2d 08 21 69 08 	or     BYTE PTR [ebp*1+0x8692108],ah
     629:	13 75 77             	adc    esi,DWORD PTR [ebp+0x77]
     62c:	f4                   	hlt    
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
     666:	01 17                	add    DWORD PTR [edi],edx
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
     71c:	05 02 00 08 00       	add    eax,0x80002
     721:	30 03                	xor    BYTE PTR [ebx],al
     723:	0c 01                	or     al,0x1
     725:	08 21                	or     BYTE PTR [ecx],ah
     727:	08 e5                	or     ch,ah
     729:	bb bb bb 69 f3       	mov    ebx,0xf369bbbb
     72e:	92                   	xchg   edx,eax
     72f:	08 85 08 67 00 02    	or     BYTE PTR [ebp+0x2006708],al
     735:	04 01                	add    al,0x1
     737:	06                   	push   es
     738:	66 06                	pushw  es
     73a:	bc f5 a1 59 31       	mov    esp,0x3159a1f5
     73f:	08 35 08 ad 08 13    	or     BYTE PTR ds:0x1308ad08,dh
     745:	08 ad a0 08 22 02    	or     BYTE PTR [ebp+0x22208a0],ch
     74b:	22 13                	and    dl,BYTE PTR [ebx]
     74d:	f3 02 28             	repz add ch,BYTE PTR [eax]
     750:	13 bc ad ad 02 22 15 	adc    edi,DWORD PTR [ebp+ebp*4+0x152202ad]
     757:	02 22                	add    ah,BYTE PTR [edx]
     759:	13 ad 91 91 75 08    	adc    ebp,DWORD PTR [ebp+0x8759191]
     75f:	f3 d7                	repz xlat BYTE PTR ds:[ebx]
     761:	08 13                	or     BYTE PTR [ebx],dl
     763:	91                   	xchg   ecx,eax
     764:	08 75 08             	or     BYTE PTR [ebp+0x8],dh
     767:	ad                   	lods   eax,DWORD PTR ds:[esi]
     768:	3d 77 f5 68 93       	cmp    eax,0x9368f577
     76d:	00 02                	add    BYTE PTR [edx],al
     76f:	04 02                	add    al,0x2
     771:	be 30 03 76 90       	mov    esi,0x90760330
     776:	03 0b                	add    ecx,DWORD PTR [ebx]
     778:	20 31                	and    BYTE PTR [ecx],dh
     77a:	d7                   	xlat   BYTE PTR ds:[ebx]
     77b:	08 3d 02 04 00 01    	or     BYTE PTR ds:0x1000402,bh
     781:	01 ed                	add    ebp,ebp
     783:	00 00                	add    BYTE PTR [eax],al
     785:	00 02                	add    BYTE PTR [edx],al
     787:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     78d:	01 fb                	add    ebx,edi
     78f:	0e                   	push   cs
     790:	0d 00 01 01 01       	or     eax,0x1010100
     795:	01 00                	add    DWORD PTR [eax],eax
     797:	00 00                	add    BYTE PTR [eax],al
     799:	01 00                	add    DWORD PTR [eax],eax
     79b:	00 01                	add    BYTE PTR [ecx],al
     79d:	73 72                	jae    811 <sysEnter_Vector-0x12f7ef>
     79f:	63 00                	arpl   WORD PTR [eax],ax
     7a1:	2f                   	das    
     7a2:	68 6f 6d 65 2f       	push   0x2f656d6f
     7a7:	79 6f                	jns    818 <sysEnter_Vector-0x12f7e8>
     7a9:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     7b0:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     7b3:	73 73                	jae    828 <sysEnter_Vector-0x12f7d8>
     7b5:	2f                   	das    
     7b6:	6c                   	ins    BYTE PTR es:[edi],dx
     7b7:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     7be:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     7c4:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     7ca:	78 2d                	js     7f9 <sysEnter_Vector-0x12f807>
     7cc:	67 6e                	outs   dx,BYTE PTR ds:[si]
     7ce:	75 2f                	jne    7ff <sysEnter_Vector-0x12f801>
     7d0:	35 2e 33 2e 30       	xor    eax,0x302e332e
     7d5:	2f                   	das    
     7d6:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     7dd:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     7e0:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     7e4:	65 00 00             	add    BYTE PTR gs:[eax],al
     7e7:	6d                   	ins    DWORD PTR es:[edi],dx
     7e8:	65                   	gs
     7e9:	6d                   	ins    DWORD PTR es:[edi],dx
     7ea:	63 70 79             	arpl   WORD PTR [eax+0x79],si
     7ed:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     7f0:	01 00                	add    DWORD PTR [eax],eax
     7f2:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     7f5:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     7fc:	63 
     7fd:	2e                   	cs
     7fe:	68 00 02 00 00       	push   0x200
     803:	74 69                	je     86e <sysEnter_Vector-0x12f792>
     805:	6d                   	ins    DWORD PTR es:[edi],dx
     806:	65                   	gs
     807:	2e                   	cs
     808:	68 00 03 00 00       	push   0x300
     80d:	73 74                	jae    883 <sysEnter_Vector-0x12f77d>
     80f:	64                   	fs
     810:	64                   	fs
     811:	65                   	gs
     812:	66                   	data16
     813:	2e                   	cs
     814:	68 00 02 00 00       	push   0x200
     819:	6d                   	ins    DWORD PTR es:[edi],dx
     81a:	61                   	popa   
     81b:	6c                   	ins    BYTE PTR es:[edi],dx
     81c:	6c                   	ins    BYTE PTR es:[edi],dx
     81d:	6f                   	outs   dx,DWORD PTR ds:[esi]
     81e:	63 2e                	arpl   WORD PTR [esi],bp
     820:	68 00 03 00 00       	push   0x300
     825:	6c                   	ins    BYTE PTR es:[edi],dx
     826:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     82d:	4f                   	dec    edi
     82e:	53                   	push   ebx
     82f:	2e                   	cs
     830:	68 00 03 00 00       	push   0x300
     835:	00 00                	add    BYTE PTR [eax],al
     837:	05 02 1c 0b 00       	add    eax,0xb1c02
     83c:	30 03                	xor    BYTE PTR [ebx],al
     83e:	0a 01                	or     al,BYTE PTR [ecx]
     840:	f5                   	cmc    
     841:	d7                   	xlat   BYTE PTR ds:[ebx]
     842:	d7                   	xlat   BYTE PTR ds:[ebx]
     843:	68 91 67 68 83       	push   0x83686791
     848:	91                   	xchg   ecx,eax
     849:	91                   	xchg   ecx,eax
     84a:	2f                   	das    
     84b:	08 1f                	or     BYTE PTR [edi],bl
     84d:	e8 08 57 ca 84       	call   84ca5f5a <ticksToWait+0x54ca26e2>
     852:	68 83 67 68 83       	push   0x83686783
     857:	91                   	xchg   ecx,eax
     858:	91                   	xchg   ecx,eax
     859:	2f                   	das    
     85a:	08 1f                	or     BYTE PTR [edi],bl
     85c:	e8 08 57 ca 5c       	call   5cca5f69 <ticksToWait+0x2cca26f1>
     861:	67 68 83 67 67 2f    	addr16 push 0x2f676783
     867:	08 2d e8 08 65 ca    	or     BYTE PTR ds:0xca6508e8,ch
     86d:	3e 02 02             	add    al,BYTE PTR ds:[edx]
     870:	00 01                	add    BYTE PTR [ecx],al
     872:	01 e4                	add    esp,esp
     874:	00 00                	add    BYTE PTR [eax],al
     876:	00 02                	add    BYTE PTR [edx],al
     878:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
     87e:	01 fb                	add    ebx,edi
     880:	0e                   	push   cs
     881:	0d 00 01 01 01       	or     eax,0x1010100
     886:	01 00                	add    DWORD PTR [eax],eax
     888:	00 00                	add    BYTE PTR [eax],al
     88a:	01 00                	add    DWORD PTR [eax],eax
     88c:	00 01                	add    BYTE PTR [ecx],al
     88e:	73 72                	jae    902 <sysEnter_Vector-0x12f6fe>
     890:	63 00                	arpl   WORD PTR [eax],ax
     892:	2f                   	das    
     893:	68 6f 6d 65 2f       	push   0x2f656d6f
     898:	79 6f                	jns    909 <sysEnter_Vector-0x12f6f7>
     89a:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     8a1:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     8a4:	73 73                	jae    919 <sysEnter_Vector-0x12f6e7>
     8a6:	2f                   	das    
     8a7:	6c                   	ins    BYTE PTR es:[edi],dx
     8a8:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     8af:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     8b5:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     8bb:	78 2d                	js     8ea <sysEnter_Vector-0x12f716>
     8bd:	67 6e                	outs   dx,BYTE PTR ds:[si]
     8bf:	75 2f                	jne    8f0 <sysEnter_Vector-0x12f710>
     8c1:	35 2e 33 2e 30       	xor    eax,0x302e332e
     8c6:	2f                   	das    
     8c7:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     8ce:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     8d1:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     8d5:	65 00 00             	add    BYTE PTR gs:[eax],al
     8d8:	6d                   	ins    DWORD PTR es:[edi],dx
     8d9:	65                   	gs
     8da:	6d                   	ins    DWORD PTR es:[edi],dx
     8db:	73 65                	jae    942 <sysEnter_Vector-0x12f6be>
     8dd:	74 2e                	je     90d <sysEnter_Vector-0x12f6f3>
     8df:	63 00                	arpl   WORD PTR [eax],ax
     8e1:	01 00                	add    DWORD PTR [eax],eax
     8e3:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     8e6:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     8ed:	63 
     8ee:	2e                   	cs
     8ef:	68 00 02 00 00       	push   0x200
     8f4:	73 74                	jae    96a <sysEnter_Vector-0x12f696>
     8f6:	64                   	fs
     8f7:	64                   	fs
     8f8:	65                   	gs
     8f9:	66                   	data16
     8fa:	2e                   	cs
     8fb:	68 00 02 00 00       	push   0x200
     900:	74 69                	je     96b <sysEnter_Vector-0x12f695>
     902:	6d                   	ins    DWORD PTR es:[edi],dx
     903:	65                   	gs
     904:	2e                   	cs
     905:	68 00 03 00 00       	push   0x300
     90a:	6d                   	ins    DWORD PTR es:[edi],dx
     90b:	61                   	popa   
     90c:	6c                   	ins    BYTE PTR es:[edi],dx
     90d:	6c                   	ins    BYTE PTR es:[edi],dx
     90e:	6f                   	outs   dx,DWORD PTR ds:[esi]
     90f:	63 2e                	arpl   WORD PTR [esi],bp
     911:	68 00 03 00 00       	push   0x300
     916:	6c                   	ins    BYTE PTR es:[edi],dx
     917:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     91e:	4f                   	dec    edi
     91f:	53                   	push   ebx
     920:	2e                   	cs
     921:	68 00 03 00 00       	push   0x300
     926:	00 00                	add    BYTE PTR [eax],al
     928:	05 02 b8 0c 00       	add    eax,0xcb802
     92d:	30 1a                	xor    BYTE PTR [edx],bl
     92f:	f3 67 67 08 83 67 08 	repz addr32 or BYTE PTR [bp+di+0x867],al
     936:	ca 9f 2f             	retf   0x2f9f
     939:	d5 bd                	aad    0xbd
     93b:	9f                   	lahf   
     93c:	2f                   	das    
     93d:	f1                   	icebp  
     93e:	bf d5 cb 3d 31       	mov    edi,0x313dcbd5
     943:	f3 67 67 08 83 67 08 	repz addr32 or BYTE PTR [bp+di+0x867],al
     94a:	ca 9f 2f             	retf   0x2f9f
     94d:	d5 bd                	aad    0xbd
     94f:	9f                   	lahf   
     950:	2f                   	das    
     951:	f1                   	icebp  
     952:	bf d5 cb 3d 02       	mov    edi,0x23dcbd5
     957:	02 00                	add    al,BYTE PTR [eax]
     959:	01 01                	add    DWORD PTR [ecx],eax
     95b:	c9                   	leave  
     95c:	00 00                	add    BYTE PTR [eax],al
     95e:	00 02                	add    BYTE PTR [edx],al
     960:	00 b3 00 00 00 01    	add    BYTE PTR [ebx+0x1000000],dh
     966:	01 fb                	add    ebx,edi
     968:	0e                   	push   cs
     969:	0d 00 01 01 01       	or     eax,0x1010100
     96e:	01 00                	add    DWORD PTR [eax],eax
     970:	00 00                	add    BYTE PTR [eax],al
     972:	01 00                	add    DWORD PTR [eax],eax
     974:	00 01                	add    BYTE PTR [ecx],al
     976:	73 72                	jae    9ea <sysEnter_Vector-0x12f616>
     978:	63 00                	arpl   WORD PTR [eax],ax
     97a:	2f                   	das    
     97b:	68 6f 6d 65 2f       	push   0x2f656d6f
     980:	79 6f                	jns    9f1 <sysEnter_Vector-0x12f60f>
     982:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     989:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     98c:	73 73                	jae    a01 <sysEnter_Vector-0x12f5ff>
     98e:	2f                   	das    
     98f:	6c                   	ins    BYTE PTR es:[edi],dx
     990:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     997:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     99d:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     9a3:	78 2d                	js     9d2 <sysEnter_Vector-0x12f62e>
     9a5:	67 6e                	outs   dx,BYTE PTR ds:[si]
     9a7:	75 2f                	jne    9d8 <sysEnter_Vector-0x12f628>
     9a9:	35 2e 33 2e 30       	xor    eax,0x302e332e
     9ae:	2f                   	das    
     9af:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     9b6:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     9b9:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     9bd:	65 00 00             	add    BYTE PTR gs:[eax],al
     9c0:	6d                   	ins    DWORD PTR es:[edi],dx
     9c1:	6d                   	ins    DWORD PTR es:[edi],dx
     9c2:	61                   	popa   
     9c3:	70 2e                	jo     9f3 <sysEnter_Vector-0x12f60d>
     9c5:	63 00                	arpl   WORD PTR [eax],ax
     9c7:	01 00                	add    DWORD PTR [eax],eax
     9c9:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     9cc:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     9d3:	63 
     9d4:	2e                   	cs
     9d5:	68 00 02 00 00       	push   0x200
     9da:	73 74                	jae    a50 <sysEnter_Vector-0x12f5b0>
     9dc:	64                   	fs
     9dd:	64                   	fs
     9de:	65                   	gs
     9df:	66                   	data16
     9e0:	2e                   	cs
     9e1:	68 00 02 00 00       	push   0x200
     9e6:	74 69                	je     a51 <sysEnter_Vector-0x12f5af>
     9e8:	6d                   	ins    DWORD PTR es:[edi],dx
     9e9:	65                   	gs
     9ea:	2e                   	cs
     9eb:	68 00 03 00 00       	push   0x300
     9f0:	74 79                	je     a6b <sysEnter_Vector-0x12f595>
     9f2:	70 65                	jo     a59 <sysEnter_Vector-0x12f5a7>
     9f4:	73 2e                	jae    a24 <sysEnter_Vector-0x12f5dc>
     9f6:	68 00 03 00 00       	push   0x300
     9fb:	6d                   	ins    DWORD PTR es:[edi],dx
     9fc:	61                   	popa   
     9fd:	6c                   	ins    BYTE PTR es:[edi],dx
     9fe:	6c                   	ins    BYTE PTR es:[edi],dx
     9ff:	6f                   	outs   dx,DWORD PTR ds:[esi]
     a00:	63 2e                	arpl   WORD PTR [esi],bp
     a02:	68 00 03 00 00       	push   0x300
     a07:	6c                   	ins    BYTE PTR es:[edi],dx
     a08:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     a0f:	4f                   	dec    edi
     a10:	53                   	push   ebx
     a11:	2e                   	cs
     a12:	68 00 03 00 00       	push   0x300
     a17:	00 00                	add    BYTE PTR [eax],al
     a19:	05 02 48 0e 00       	add    eax,0xe4802
     a1e:	30 03                	xor    BYTE PTR [ebx],al
     a20:	09 01                	or     DWORD PTR [ecx],eax
     a22:	ca 02 03             	retf   0x302
     a25:	00 01                	add    BYTE PTR [ecx],al
     a27:	01 4f 01             	add    DWORD PTR [edi+0x1],ecx
     a2a:	00 00                	add    BYTE PTR [eax],al
     a2c:	02 00                	add    al,BYTE PTR [eax]
     a2e:	e2 00                	loop   a30 <sysEnter_Vector-0x12f5d0>
     a30:	00 00                	add    BYTE PTR [eax],al
     a32:	01 01                	add    DWORD PTR [ecx],eax
     a34:	fb                   	sti    
     a35:	0e                   	push   cs
     a36:	0d 00 01 01 01       	or     eax,0x1010100
     a3b:	01 00                	add    DWORD PTR [eax],eax
     a3d:	00 00                	add    BYTE PTR [eax],al
     a3f:	01 00                	add    DWORD PTR [eax],eax
     a41:	00 01                	add    BYTE PTR [ecx],al
     a43:	73 72                	jae    ab7 <sysEnter_Vector-0x12f549>
     a45:	63 00                	arpl   WORD PTR [eax],ax
     a47:	2f                   	das    
     a48:	68 6f 6d 65 2f       	push   0x2f656d6f
     a4d:	79 6f                	jns    abe <sysEnter_Vector-0x12f542>
     a4f:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     a56:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     a59:	73 73                	jae    ace <sysEnter_Vector-0x12f532>
     a5b:	2f                   	das    
     a5c:	6c                   	ins    BYTE PTR es:[edi],dx
     a5d:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     a64:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     a6a:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     a70:	78 2d                	js     a9f <sysEnter_Vector-0x12f561>
     a72:	67 6e                	outs   dx,BYTE PTR ds:[si]
     a74:	75 2f                	jne    aa5 <sysEnter_Vector-0x12f55b>
     a76:	35 2e 33 2e 30       	xor    eax,0x302e332e
     a7b:	2f                   	das    
     a7c:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     a83:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     a86:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     a8a:	65 00 2e             	add    BYTE PTR gs:[esi],ch
     a8d:	2e                   	cs
     a8e:	2f                   	das    
     a8f:	2e                   	cs
     a90:	2e                   	cs
     a91:	2f                   	das    
     a92:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
     a96:	6a 2f                	push   0x2f
     a98:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
     a9b:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
     aa2:	6e                   	outs   dx,BYTE PTR ds:[esi]
     aa3:	65                   	gs
     aa4:	6c                   	ins    BYTE PTR es:[edi],dx
     aa5:	2f                   	das    
     aa6:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     aad:	00 00                	add    BYTE PTR [eax],al
     aaf:	73 74                	jae    b25 <sysEnter_Vector-0x12f4db>
     ab1:	64 69 6f 2e 63 00 01 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x10063
     ab8:	00 
     ab9:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     abc:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     ac3:	63 
     ac4:	2e                   	cs
     ac5:	68 00 02 00 00       	push   0x200
     aca:	73 74                	jae    b40 <sysEnter_Vector-0x12f4c0>
     acc:	64                   	fs
     acd:	64                   	fs
     ace:	65                   	gs
     acf:	66                   	data16
     ad0:	2e                   	cs
     ad1:	68 00 02 00 00       	push   0x200
     ad6:	74 69                	je     b41 <sysEnter_Vector-0x12f4bf>
     ad8:	6d                   	ins    DWORD PTR es:[edi],dx
     ad9:	65                   	gs
     ada:	2e                   	cs
     adb:	68 00 03 00 00       	push   0x300
     ae0:	64                   	fs
     ae1:	6c                   	ins    BYTE PTR es:[edi],dx
     ae2:	6c                   	ins    BYTE PTR es:[edi],dx
     ae3:	69 73 74 2e 68 00 04 	imul   esi,DWORD PTR [ebx+0x74],0x400682e
     aea:	00 00                	add    BYTE PTR [eax],al
     aec:	73 74                	jae    b62 <sysEnter_Vector-0x12f49e>
     aee:	64 69 6f 2e 68 00 03 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x30068
     af5:	00 
     af6:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
     af9:	6c                   	ins    BYTE PTR es:[edi],dx
     afa:	6c                   	ins    BYTE PTR es:[edi],dx
     afb:	6f                   	outs   dx,DWORD PTR ds:[esi]
     afc:	63 2e                	arpl   WORD PTR [esi],bp
     afe:	68 00 03 00 00       	push   0x300
     b03:	6c                   	ins    BYTE PTR es:[edi],dx
     b04:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     b0b:	4f                   	dec    edi
     b0c:	53                   	push   ebx
     b0d:	2e                   	cs
     b0e:	68 00 03 00 00       	push   0x300
     b13:	00 00                	add    BYTE PTR [eax],al
     b15:	05 02 58 0e 00       	add    eax,0xe5802
     b1a:	30 03                	xor    BYTE PTR [ebx],al
     b1c:	12 01                	adc    al,BYTE PTR [ecx]
     b1e:	08 13                	or     BYTE PTR [ebx],dl
     b20:	08 59 5b             	or     BYTE PTR [ecx+0x5b],bl
     b23:	08 13                	or     BYTE PTR [ebx],dl
     b25:	f3 5b                	repz pop ebx
     b27:	08 23                	or     BYTE PTR [ebx],ah
     b29:	77 08                	ja     b33 <sysEnter_Vector-0x12f4cd>
     b2b:	30 08                	xor    BYTE PTR [eax],cl
     b2d:	21 08                	and    DWORD PTR [eax],ecx
     b2f:	23 d7                	and    edx,edi
     b31:	d9 91 e5 08 72 00    	fst    DWORD PTR [ecx+0x7208e5]
     b37:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     b3a:	06                   	push   es
     b3b:	4a                   	dec    edx
     b3c:	06                   	push   es
     b3d:	86 21                	xchg   BYTE PTR [ecx],ah
     b3f:	d7                   	xlat   BYTE PTR ds:[ebx]
     b40:	91                   	xchg   ecx,eax
     b41:	e5 08                	in     eax,0x8
     b43:	72 00                	jb     b45 <sysEnter_Vector-0x12f4bb>
     b45:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     b48:	06                   	push   es
     b49:	4a                   	dec    edx
     b4a:	06                   	push   es
     b4b:	86 21                	xchg   BYTE PTR [ecx],ah
     b4d:	d7                   	xlat   BYTE PTR ds:[ebx]
     b4e:	00 02                	add    BYTE PTR [edx],al
     b50:	04 03                	add    al,0x3
     b52:	83 00 02             	add    DWORD PTR [eax],0x2
     b55:	04 03                	add    al,0x3
     b57:	d5 00                	aad    0x0
     b59:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     b5c:	06                   	push   es
     b5d:	4a                   	dec    edx
     b5e:	06                   	push   es
     b5f:	69 e6 21 5c 08 22    	imul   esp,esi,0x22085c21
     b65:	76 08                	jbe    b6f <sysEnter_Vector-0x12f491>
     b67:	31 d7                	xor    edi,edx
     b69:	d7                   	xlat   BYTE PTR ds:[ebx]
     b6a:	d7                   	xlat   BYTE PTR ds:[ebx]
     b6b:	d7                   	xlat   BYTE PTR ds:[ebx]
     b6c:	ad                   	lods   eax,DWORD PTR ds:[esi]
     b6d:	e6 21                	out    0x21,al
     b6f:	5b                   	pop    ebx
     b70:	c9                   	leave  
     b71:	e5 d7                	in     eax,0xd7
     b73:	e5 08                	in     eax,0x8
     b75:	67 02 03             	add    al,BYTE PTR [bp+di]
     b78:	00 01                	add    BYTE PTR [ecx],al
     b7a:	01 cf                	add    edi,ecx
     b7c:	00 00                	add    BYTE PTR [eax],al
     b7e:	00 02                	add    BYTE PTR [edx],al
     b80:	00 a6 00 00 00 01    	add    BYTE PTR [esi+0x1000000],ah
     b86:	01 fb                	add    ebx,edi
     b88:	0e                   	push   cs
     b89:	0d 00 01 01 01       	or     eax,0x1010100
     b8e:	01 00                	add    DWORD PTR [eax],eax
     b90:	00 00                	add    BYTE PTR [eax],al
     b92:	01 00                	add    DWORD PTR [eax],eax
     b94:	00 01                	add    BYTE PTR [ecx],al
     b96:	73 72                	jae    c0a <sysEnter_Vector-0x12f3f6>
     b98:	63 2f                	arpl   WORD PTR [edi],bp
     b9a:	73 74                	jae    c10 <sysEnter_Vector-0x12f3f0>
     b9c:	72 69                	jb     c07 <sysEnter_Vector-0x12f3f9>
     b9e:	6e                   	outs   dx,BYTE PTR ds:[esi]
     b9f:	67 73 00             	addr16 jae ba2 <sysEnter_Vector-0x12f45e>
     ba2:	2f                   	das    
     ba3:	68 6f 6d 65 2f       	push   0x2f656d6f
     ba8:	79 6f                	jns    c19 <sysEnter_Vector-0x12f3e7>
     baa:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     bb1:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     bb4:	73 73                	jae    c29 <sysEnter_Vector-0x12f3d7>
     bb6:	2f                   	das    
     bb7:	6c                   	ins    BYTE PTR es:[edi],dx
     bb8:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     bbf:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     bc5:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     bcb:	78 2d                	js     bfa <sysEnter_Vector-0x12f406>
     bcd:	67 6e                	outs   dx,BYTE PTR ds:[si]
     bcf:	75 2f                	jne    c00 <sysEnter_Vector-0x12f400>
     bd1:	35 2e 33 2e 30       	xor    eax,0x302e332e
     bd6:	2f                   	das    
     bd7:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     bde:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     be1:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     be5:	65 00 00             	add    BYTE PTR gs:[eax],al
     be8:	73 74                	jae    c5e <sysEnter_Vector-0x12f3a2>
     bea:	72 63                	jb     c4f <sysEnter_Vector-0x12f3b1>
     bec:	61                   	popa   
     bed:	74 2e                	je     c1d <sysEnter_Vector-0x12f3e3>
     bef:	63 00                	arpl   WORD PTR [eax],ax
     bf1:	01 00                	add    DWORD PTR [eax],eax
     bf3:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     bf6:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     bfd:	63 
     bfe:	2e                   	cs
     bff:	68 00 02 00 00       	push   0x200
     c04:	74 69                	je     c6f <sysEnter_Vector-0x12f391>
     c06:	6d                   	ins    DWORD PTR es:[edi],dx
     c07:	65                   	gs
     c08:	2e                   	cs
     c09:	68 00 03 00 00       	push   0x300
     c0e:	6d                   	ins    DWORD PTR es:[edi],dx
     c0f:	61                   	popa   
     c10:	6c                   	ins    BYTE PTR es:[edi],dx
     c11:	6c                   	ins    BYTE PTR es:[edi],dx
     c12:	6f                   	outs   dx,DWORD PTR ds:[esi]
     c13:	63 2e                	arpl   WORD PTR [esi],bp
     c15:	68 00 03 00 00       	push   0x300
     c1a:	6c                   	ins    BYTE PTR es:[edi],dx
     c1b:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     c22:	4f                   	dec    edi
     c23:	53                   	push   ebx
     c24:	2e                   	cs
     c25:	68 00 03 00 00       	push   0x300
     c2a:	00 00                	add    BYTE PTR [eax],al
     c2c:	05 02 b8 10 00       	add    eax,0x10b802
     c31:	30 03                	xor    BYTE PTR [ebx],al
     c33:	1d 01 08 21 02       	sbb    eax,0x2210801
     c38:	24 13                	and    al,0x13
     c3a:	3d 5a f5 76 2f       	cmp    eax,0x2f76f55a
     c3f:	49                   	dec    ecx
     c40:	e8 76 2f 08 4b       	call   4b083bbb <ticksToWait+0x1b080343>
     c45:	4b                   	dec    ebx
     c46:	47                   	inc    edi
     c47:	ea ad 02 03 00 01 01 	jmp    0x101:0x302ad
     c4e:	c5 00                	lds    eax,FWORD PTR [eax]
     c50:	00 00                	add    BYTE PTR [eax],al
     c52:	02 00                	add    al,BYTE PTR [eax]
     c54:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     c55:	00 00                	add    BYTE PTR [eax],al
     c57:	00 01                	add    BYTE PTR [ecx],al
     c59:	01 fb                	add    ebx,edi
     c5b:	0e                   	push   cs
     c5c:	0d 00 01 01 01       	or     eax,0x1010100
     c61:	01 00                	add    DWORD PTR [eax],eax
     c63:	00 00                	add    BYTE PTR [eax],al
     c65:	01 00                	add    DWORD PTR [eax],eax
     c67:	00 01                	add    BYTE PTR [ecx],al
     c69:	73 72                	jae    cdd <sysEnter_Vector-0x12f323>
     c6b:	63 2f                	arpl   WORD PTR [edi],bp
     c6d:	73 74                	jae    ce3 <sysEnter_Vector-0x12f31d>
     c6f:	72 69                	jb     cda <sysEnter_Vector-0x12f326>
     c71:	6e                   	outs   dx,BYTE PTR ds:[esi]
     c72:	67 73 00             	addr16 jae c75 <sysEnter_Vector-0x12f38b>
     c75:	2f                   	das    
     c76:	68 6f 6d 65 2f       	push   0x2f656d6f
     c7b:	79 6f                	jns    cec <sysEnter_Vector-0x12f314>
     c7d:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     c84:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     c87:	73 73                	jae    cfc <sysEnter_Vector-0x12f304>
     c89:	2f                   	das    
     c8a:	6c                   	ins    BYTE PTR es:[edi],dx
     c8b:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     c92:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     c98:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     c9e:	78 2d                	js     ccd <sysEnter_Vector-0x12f333>
     ca0:	67 6e                	outs   dx,BYTE PTR ds:[si]
     ca2:	75 2f                	jne    cd3 <sysEnter_Vector-0x12f32d>
     ca4:	35 2e 33 2e 30       	xor    eax,0x302e332e
     ca9:	2f                   	das    
     caa:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     cb1:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     cb4:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     cb8:	65 00 00             	add    BYTE PTR gs:[eax],al
     cbb:	73 74                	jae    d31 <sysEnter_Vector-0x12f2cf>
     cbd:	72 63                	jb     d22 <sysEnter_Vector-0x12f2de>
     cbf:	6d                   	ins    DWORD PTR es:[edi],dx
     cc0:	70 2e                	jo     cf0 <sysEnter_Vector-0x12f310>
     cc2:	63 00                	arpl   WORD PTR [eax],ax
     cc4:	01 00                	add    DWORD PTR [eax],eax
     cc6:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     cc9:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     cd0:	63 
     cd1:	2e                   	cs
     cd2:	68 00 02 00 00       	push   0x200
     cd7:	74 69                	je     d42 <sysEnter_Vector-0x12f2be>
     cd9:	6d                   	ins    DWORD PTR es:[edi],dx
     cda:	65                   	gs
     cdb:	2e                   	cs
     cdc:	68 00 03 00 00       	push   0x300
     ce1:	6d                   	ins    DWORD PTR es:[edi],dx
     ce2:	61                   	popa   
     ce3:	6c                   	ins    BYTE PTR es:[edi],dx
     ce4:	6c                   	ins    BYTE PTR es:[edi],dx
     ce5:	6f                   	outs   dx,DWORD PTR ds:[esi]
     ce6:	63 2e                	arpl   WORD PTR [esi],bp
     ce8:	68 00 03 00 00       	push   0x300
     ced:	6c                   	ins    BYTE PTR es:[edi],dx
     cee:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     cf5:	4f                   	dec    edi
     cf6:	53                   	push   ebx
     cf7:	2e                   	cs
     cf8:	68 00 03 00 00       	push   0x300
     cfd:	00 00                	add    BYTE PTR [eax],al
     cff:	05 02 68 11 00       	add    eax,0x116802
     d04:	30 03                	xor    BYTE PTR [ebx],al
     d06:	18 01                	sbb    BYTE PTR [ecx],al
     d08:	08 21                	or     BYTE PTR [ecx],ah
     d0a:	3d 41 ad ad 67       	cmp    eax,0x67adad41
     d0f:	d8 92 bb 02 07 00    	fcom   DWORD PTR [edx+0x702bb]
     d15:	01 01                	add    DWORD PTR [ecx],eax
     d17:	d8 00                	fadd   DWORD PTR [eax]
     d19:	00 00                	add    BYTE PTR [eax],al
     d1b:	02 00                	add    al,BYTE PTR [eax]
     d1d:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     d1e:	00 00                	add    BYTE PTR [eax],al
     d20:	00 01                	add    BYTE PTR [ecx],al
     d22:	01 fb                	add    ebx,edi
     d24:	0e                   	push   cs
     d25:	0d 00 01 01 01       	or     eax,0x1010100
     d2a:	01 00                	add    DWORD PTR [eax],eax
     d2c:	00 00                	add    BYTE PTR [eax],al
     d2e:	01 00                	add    DWORD PTR [eax],eax
     d30:	00 01                	add    BYTE PTR [ecx],al
     d32:	73 72                	jae    da6 <sysEnter_Vector-0x12f25a>
     d34:	63 2f                	arpl   WORD PTR [edi],bp
     d36:	73 74                	jae    dac <sysEnter_Vector-0x12f254>
     d38:	72 69                	jb     da3 <sysEnter_Vector-0x12f25d>
     d3a:	6e                   	outs   dx,BYTE PTR ds:[esi]
     d3b:	67 73 00             	addr16 jae d3e <sysEnter_Vector-0x12f2c2>
     d3e:	2f                   	das    
     d3f:	68 6f 6d 65 2f       	push   0x2f656d6f
     d44:	79 6f                	jns    db5 <sysEnter_Vector-0x12f24b>
     d46:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     d4d:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     d50:	73 73                	jae    dc5 <sysEnter_Vector-0x12f23b>
     d52:	2f                   	das    
     d53:	6c                   	ins    BYTE PTR es:[edi],dx
     d54:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     d5b:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     d61:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     d67:	78 2d                	js     d96 <sysEnter_Vector-0x12f26a>
     d69:	67 6e                	outs   dx,BYTE PTR ds:[si]
     d6b:	75 2f                	jne    d9c <sysEnter_Vector-0x12f264>
     d6d:	35 2e 33 2e 30       	xor    eax,0x302e332e
     d72:	2f                   	das    
     d73:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     d7a:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
     d7d:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
     d81:	65 00 00             	add    BYTE PTR gs:[eax],al
     d84:	73 74                	jae    dfa <sysEnter_Vector-0x12f206>
     d86:	72 63                	jb     deb <sysEnter_Vector-0x12f215>
     d88:	70 79                	jo     e03 <sysEnter_Vector-0x12f1fd>
     d8a:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     d8d:	01 00                	add    DWORD PTR [eax],eax
     d8f:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     d92:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
     d99:	63 
     d9a:	2e                   	cs
     d9b:	68 00 02 00 00       	push   0x200
     da0:	74 69                	je     e0b <sysEnter_Vector-0x12f1f5>
     da2:	6d                   	ins    DWORD PTR es:[edi],dx
     da3:	65                   	gs
     da4:	2e                   	cs
     da5:	68 00 03 00 00       	push   0x300
     daa:	6d                   	ins    DWORD PTR es:[edi],dx
     dab:	61                   	popa   
     dac:	6c                   	ins    BYTE PTR es:[edi],dx
     dad:	6c                   	ins    BYTE PTR es:[edi],dx
     dae:	6f                   	outs   dx,DWORD PTR ds:[esi]
     daf:	63 2e                	arpl   WORD PTR [esi],bp
     db1:	68 00 03 00 00       	push   0x300
     db6:	6c                   	ins    BYTE PTR es:[edi],dx
     db7:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
     dbe:	4f                   	dec    edi
     dbf:	53                   	push   ebx
     dc0:	2e                   	cs
     dc1:	68 00 03 00 00       	push   0x300
     dc6:	00 00                	add    BYTE PTR [eax],al
     dc8:	05 02 c8 11 00       	add    eax,0x11c802
     dcd:	30 16                	xor    BYTE PTR [esi],dl
     dcf:	f3 67 00 02          	repz add BYTE PTR [bp+si],al
     dd3:	04 01                	add    al,0x1
     dd5:	06                   	push   es
     dd6:	20 06                	and    BYTE PTR [esi],al
     dd8:	08 ca                	or     dl,cl
     dda:	67 3d 32 f3 67 00    	addr16 cmp eax,0x67f332
     de0:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
     de3:	06                   	push   es
     de4:	20 00                	and    BYTE PTR [eax],al
     de6:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     de9:	08 c8                	or     al,cl
     deb:	06                   	push   es
     dec:	ca 3d 02             	retf   0x23d
     def:	02 00                	add    al,BYTE PTR [eax]
     df1:	01 01                	add    DWORD PTR [ecx],eax
     df3:	94                   	xchg   esp,eax
     df4:	00 00                	add    BYTE PTR [eax],al
     df6:	00 02                	add    BYTE PTR [edx],al
     df8:	00 74 00 00          	add    BYTE PTR [eax+eax*1+0x0],dh
     dfc:	00 01                	add    BYTE PTR [ecx],al
     dfe:	01 fb                	add    ebx,edi
     e00:	0e                   	push   cs
     e01:	0d 00 01 01 01       	or     eax,0x1010100
     e06:	01 00                	add    DWORD PTR [eax],eax
     e08:	00 00                	add    BYTE PTR [eax],al
     e0a:	01 00                	add    DWORD PTR [eax],eax
     e0c:	00 01                	add    BYTE PTR [ecx],al
     e0e:	73 72                	jae    e82 <sysEnter_Vector-0x12f17e>
     e10:	63 2f                	arpl   WORD PTR [edi],bp
     e12:	73 74                	jae    e88 <sysEnter_Vector-0x12f178>
     e14:	72 69                	jb     e7f <sysEnter_Vector-0x12f181>
     e16:	6e                   	outs   dx,BYTE PTR ds:[esi]
     e17:	67 73 00             	addr16 jae e1a <sysEnter_Vector-0x12f1e6>
     e1a:	2f                   	das    
     e1b:	68 6f 6d 65 2f       	push   0x2f656d6f
     e20:	79 6f                	jns    e91 <sysEnter_Vector-0x12f16f>
     e22:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     e29:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     e2c:	73 73                	jae    ea1 <sysEnter_Vector-0x12f15f>
     e2e:	2f                   	das    
     e2f:	6c                   	ins    BYTE PTR es:[edi],dx
     e30:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     e37:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     e3d:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     e43:	78 2d                	js     e72 <sysEnter_Vector-0x12f18e>
     e45:	67 6e                	outs   dx,BYTE PTR ds:[si]
     e47:	75 2f                	jne    e78 <sysEnter_Vector-0x12f188>
     e49:	35 2e 33 2e 30       	xor    eax,0x302e332e
     e4e:	2f                   	das    
     e4f:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     e56:	00 00                	add    BYTE PTR [eax],al
     e58:	73 74                	jae    ece <sysEnter_Vector-0x12f132>
     e5a:	72 6c                	jb     ec8 <sysEnter_Vector-0x12f138>
     e5c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
     e5e:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     e61:	01 00                	add    DWORD PTR [eax],eax
     e63:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     e66:	64                   	fs
     e67:	64                   	fs
     e68:	65                   	gs
     e69:	66                   	data16
     e6a:	2e                   	cs
     e6b:	68 00 02 00 00       	push   0x200
     e70:	00 00                	add    BYTE PTR [eax],al
     e72:	05 02 50 12 00       	add    eax,0x125002
     e77:	30 14 f3             	xor    BYTE PTR [ebx+esi*8],dl
     e7a:	75 2f                	jne    eab <sysEnter_Vector-0x12f155>
     e7c:	49                   	dec    ecx
     e7d:	e6 3d                	out    0x3d,al
     e7f:	30 f3                	xor    bl,dh
     e81:	75 2f                	jne    eb2 <sysEnter_Vector-0x12f14e>
     e83:	49                   	dec    ecx
     e84:	e6 3d                	out    0x3d,al
     e86:	02 02                	add    al,BYTE PTR [edx]
     e88:	00 01                	add    BYTE PTR [ecx],al
     e8a:	01 a5 00 00 00 02    	add    DWORD PTR [ebp+0x2000000],esp
     e90:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
     e93:	00 00                	add    BYTE PTR [eax],al
     e95:	01 01                	add    DWORD PTR [ecx],eax
     e97:	fb                   	sti    
     e98:	0e                   	push   cs
     e99:	0d 00 01 01 01       	or     eax,0x1010100
     e9e:	01 00                	add    DWORD PTR [eax],eax
     ea0:	00 00                	add    BYTE PTR [eax],al
     ea2:	01 00                	add    DWORD PTR [eax],eax
     ea4:	00 01                	add    BYTE PTR [ecx],al
     ea6:	73 72                	jae    f1a <sysEnter_Vector-0x12f0e6>
     ea8:	63 2f                	arpl   WORD PTR [edi],bp
     eaa:	73 74                	jae    f20 <sysEnter_Vector-0x12f0e0>
     eac:	72 69                	jb     f17 <sysEnter_Vector-0x12f0e9>
     eae:	6e                   	outs   dx,BYTE PTR ds:[esi]
     eaf:	67 73 00             	addr16 jae eb2 <sysEnter_Vector-0x12f14e>
     eb2:	2f                   	das    
     eb3:	68 6f 6d 65 2f       	push   0x2f656d6f
     eb8:	79 6f                	jns    f29 <sysEnter_Vector-0x12f0d7>
     eba:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     ec1:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     ec4:	73 73                	jae    f39 <sysEnter_Vector-0x12f0c7>
     ec6:	2f                   	das    
     ec7:	6c                   	ins    BYTE PTR es:[edi],dx
     ec8:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     ecf:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     ed5:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     edb:	78 2d                	js     f0a <sysEnter_Vector-0x12f0f6>
     edd:	67 6e                	outs   dx,BYTE PTR ds:[si]
     edf:	75 2f                	jne    f10 <sysEnter_Vector-0x12f0f0>
     ee1:	35 2e 33 2e 30       	xor    eax,0x302e332e
     ee6:	2f                   	das    
     ee7:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     eee:	00 00                	add    BYTE PTR [eax],al
     ef0:	73 74                	jae    f66 <sysEnter_Vector-0x12f09a>
     ef2:	72 6e                	jb     f62 <sysEnter_Vector-0x12f09e>
     ef4:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
     ef7:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     efa:	01 00                	add    DWORD PTR [eax],eax
     efc:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     eff:	64                   	fs
     f00:	64                   	fs
     f01:	65                   	gs
     f02:	66                   	data16
     f03:	2e                   	cs
     f04:	68 00 02 00 00       	push   0x200
     f09:	00 00                	add    BYTE PTR [eax],al
     f0b:	05 02 b4 12 00       	add    eax,0x12b402
     f10:	30 03                	xor    BYTE PTR [ebx],al
     f12:	0c 01                	or     al,0x1
     f14:	c9                   	leave  
     f15:	2f                   	das    
     f16:	f3 00 02             	repz add BYTE PTR [edx],al
     f19:	04 01                	add    al,0x1
     f1b:	06                   	push   es
     f1c:	f2 00 02             	repnz add BYTE PTR [edx],al
     f1f:	04 02                	add    al,0x2
     f21:	74 06                	je     f29 <sysEnter_Vector-0x12f0d7>
     f23:	75 9f                	jne    ec4 <sysEnter_Vector-0x12f13c>
     f25:	70 00                	jo     f27 <sysEnter_Vector-0x12f0d9>
     f27:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
     f2a:	06                   	push   es
     f2b:	ba 06 6b 59 02       	mov    edx,0x2596b06
     f30:	02 00                	add    al,BYTE PTR [eax]
     f32:	01 01                	add    DWORD PTR [ecx],eax
     f34:	9d                   	popf   
     f35:	00 00                	add    BYTE PTR [eax],al
     f37:	00 02                	add    BYTE PTR [edx],al
     f39:	00 75 00             	add    BYTE PTR [ebp+0x0],dh
     f3c:	00 00                	add    BYTE PTR [eax],al
     f3e:	01 01                	add    DWORD PTR [ecx],eax
     f40:	fb                   	sti    
     f41:	0e                   	push   cs
     f42:	0d 00 01 01 01       	or     eax,0x1010100
     f47:	01 00                	add    DWORD PTR [eax],eax
     f49:	00 00                	add    BYTE PTR [eax],al
     f4b:	01 00                	add    DWORD PTR [eax],eax
     f4d:	00 01                	add    BYTE PTR [ecx],al
     f4f:	73 72                	jae    fc3 <sysEnter_Vector-0x12f03d>
     f51:	63 2f                	arpl   WORD PTR [edi],bp
     f53:	73 74                	jae    fc9 <sysEnter_Vector-0x12f037>
     f55:	72 69                	jb     fc0 <sysEnter_Vector-0x12f040>
     f57:	6e                   	outs   dx,BYTE PTR ds:[esi]
     f58:	67 73 00             	addr16 jae f5b <sysEnter_Vector-0x12f0a5>
     f5b:	2f                   	das    
     f5c:	68 6f 6d 65 2f       	push   0x2f656d6f
     f61:	79 6f                	jns    fd2 <sysEnter_Vector-0x12f02e>
     f63:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
     f6a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
     f6d:	73 73                	jae    fe2 <sysEnter_Vector-0x12f01e>
     f6f:	2f                   	das    
     f70:	6c                   	ins    BYTE PTR es:[edi],dx
     f71:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
     f78:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
     f7e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
     f84:	78 2d                	js     fb3 <sysEnter_Vector-0x12f04d>
     f86:	67 6e                	outs   dx,BYTE PTR ds:[si]
     f88:	75 2f                	jne    fb9 <sysEnter_Vector-0x12f047>
     f8a:	35 2e 33 2e 30       	xor    eax,0x302e332e
     f8f:	2f                   	das    
     f90:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
     f97:	00 00                	add    BYTE PTR [eax],al
     f99:	73 74                	jae    100f <sysEnter_Vector-0x12eff1>
     f9b:	72 6e                	jb     100b <sysEnter_Vector-0x12eff5>
     f9d:	63 70 79             	arpl   WORD PTR [eax+0x79],si
     fa0:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
     fa3:	01 00                	add    DWORD PTR [eax],eax
     fa5:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
     fa8:	64                   	fs
     fa9:	64                   	fs
     faa:	65                   	gs
     fab:	66                   	data16
     fac:	2e                   	cs
     fad:	68 00 02 00 00       	push   0x200
     fb2:	00 00                	add    BYTE PTR [eax],al
     fb4:	05 02 1c 13 00       	add    eax,0x131c02
     fb9:	30 03                	xor    BYTE PTR [ebx],al
     fbb:	0d 01 f3 67 2f       	or     eax,0x2f67f301
     fc0:	08 67 48             	or     BYTE PTR [edi+0x48],ah
     fc3:	00 02                	add    BYTE PTR [edx],al
     fc5:	04 01                	add    al,0x1
     fc7:	06                   	push   es
     fc8:	66 06                	pushw  es
     fca:	a2 2f bb 48 6a       	mov    ds:0x6a48bb2f,al
     fcf:	3d 02 02 00 01       	cmp    eax,0x1000202
     fd4:	01 53 01             	add    DWORD PTR [ebx+0x1],edx
     fd7:	00 00                	add    BYTE PTR [eax],al
     fd9:	02 00                	add    al,BYTE PTR [eax]
     fdb:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     fdc:	00 00                	add    BYTE PTR [eax],al
     fde:	00 01                	add    BYTE PTR [ecx],al
     fe0:	01 fb                	add    ebx,edi
     fe2:	0e                   	push   cs
     fe3:	0d 00 01 01 01       	or     eax,0x1010100
     fe8:	01 00                	add    DWORD PTR [eax],eax
     fea:	00 00                	add    BYTE PTR [eax],al
     fec:	01 00                	add    DWORD PTR [eax],eax
     fee:	00 01                	add    BYTE PTR [ecx],al
     ff0:	73 72                	jae    1064 <sysEnter_Vector-0x12ef9c>
     ff2:	63 2f                	arpl   WORD PTR [edi],bp
     ff4:	73 74                	jae    106a <sysEnter_Vector-0x12ef96>
     ff6:	72 69                	jb     1061 <sysEnter_Vector-0x12ef9f>
     ff8:	6e                   	outs   dx,BYTE PTR ds:[esi]
     ff9:	67 73 00             	addr16 jae ffc <sysEnter_Vector-0x12f004>
     ffc:	2f                   	das    
     ffd:	68 6f 6d 65 2f       	push   0x2f656d6f
    1002:	79 6f                	jns    1073 <sysEnter_Vector-0x12ef8d>
    1004:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    100b:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    100e:	73 73                	jae    1083 <sysEnter_Vector-0x12ef7d>
    1010:	2f                   	das    
    1011:	6c                   	ins    BYTE PTR es:[edi],dx
    1012:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    1019:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    101f:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    1025:	78 2d                	js     1054 <sysEnter_Vector-0x12efac>
    1027:	67 6e                	outs   dx,BYTE PTR ds:[si]
    1029:	75 2f                	jne    105a <sysEnter_Vector-0x12efa6>
    102b:	35 2e 33 2e 30       	xor    eax,0x302e332e
    1030:	2f                   	das    
    1031:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    1038:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    103b:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    103f:	65 00 00             	add    BYTE PTR gs:[eax],al
    1042:	73 74                	jae    10b8 <sysEnter_Vector-0x12ef48>
    1044:	72 6f                	jb     10b5 <sysEnter_Vector-0x12ef4b>
    1046:	75 6c                	jne    10b4 <sysEnter_Vector-0x12ef4c>
    1048:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
    104b:	01 00                	add    DWORD PTR [eax],eax
    104d:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    1050:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    1057:	63 
    1058:	2e                   	cs
    1059:	68 00 02 00 00       	push   0x200
    105e:	74 69                	je     10c9 <sysEnter_Vector-0x12ef37>
    1060:	6d                   	ins    DWORD PTR es:[edi],dx
    1061:	65                   	gs
    1062:	2e                   	cs
    1063:	68 00 03 00 00       	push   0x300
    1068:	6d                   	ins    DWORD PTR es:[edi],dx
    1069:	61                   	popa   
    106a:	6c                   	ins    BYTE PTR es:[edi],dx
    106b:	6c                   	ins    BYTE PTR es:[edi],dx
    106c:	6f                   	outs   dx,DWORD PTR ds:[esi]
    106d:	63 2e                	arpl   WORD PTR [esi],bp
    106f:	68 00 03 00 00       	push   0x300
    1074:	6c                   	ins    BYTE PTR es:[edi],dx
    1075:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    107c:	4f                   	dec    edi
    107d:	53                   	push   ebx
    107e:	2e                   	cs
    107f:	68 00 03 00 00       	push   0x300
    1084:	00 00                	add    BYTE PTR [eax],al
    1086:	05 02 7c 13 00       	add    eax,0x137c02
    108b:	30 03                	xor    BYTE PTR [ebx],al
    108d:	3b 01                	cmp    eax,DWORD PTR [ecx]
    108f:	08 2f                	or     BYTE PTR [edi],ch
    1091:	40                   	inc    eax
    1092:	00 02                	add    BYTE PTR [edx],al
    1094:	04 01                	add    al,0x1
    1096:	7a 00                	jp     1098 <sysEnter_Vector-0x12ef68>
    1098:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    109b:	ad                   	lods   eax,DWORD PTR ds:[esi]
    109c:	59                   	pop    ecx
    109d:	59                   	pop    ecx
    109e:	75 c9                	jne    1069 <sysEnter_Vector-0x12ef97>
    10a0:	59                   	pop    ecx
    10a1:	ad                   	lods   eax,DWORD PTR ds:[esi]
    10a2:	00 02                	add    BYTE PTR [edx],al
    10a4:	04 02                	add    al,0x2
    10a6:	06                   	push   es
    10a7:	66                   	data16
    10a8:	00 02                	add    BYTE PTR [edx],al
    10aa:	04 03                	add    al,0x3
    10ac:	66 06                	pushw  es
    10ae:	59                   	pop    ecx
    10af:	00 02                	add    BYTE PTR [edx],al
    10b1:	04 01                	add    al,0x1
    10b3:	06                   	push   es
    10b4:	74 06                	je     10bc <sysEnter_Vector-0x12ef44>
    10b6:	75 91                	jne    1049 <sysEnter_Vector-0x12efb7>
    10b8:	3d 76 67 00 02       	cmp    eax,0x2006776
    10bd:	04 01                	add    al,0x1
    10bf:	06                   	push   es
    10c0:	58                   	pop    eax
    10c1:	00 02                	add    BYTE PTR [edx],al
    10c3:	04 02                	add    al,0x2
    10c5:	74 00                	je     10c7 <sysEnter_Vector-0x12ef39>
    10c7:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    10ca:	58                   	pop    eax
    10cb:	06                   	push   es
    10cc:	3d 08 21 08 2f       	cmp    eax,0x2f082108
    10d1:	9f                   	lahf   
    10d2:	83 59 c9 00          	sbb    DWORD PTR [ecx-0x37],0x0
    10d6:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    10d9:	06                   	push   es
    10da:	58                   	pop    eax
    10db:	00 02                	add    BYTE PTR [edx],al
    10dd:	04 03                	add    al,0x3
    10df:	58                   	pop    eax
    10e0:	00 02                	add    BYTE PTR [edx],al
    10e2:	04 04                	add    al,0x4
    10e4:	74 00                	je     10e6 <sysEnter_Vector-0x12ef1a>
    10e6:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    10e9:	58                   	pop    eax
    10ea:	06                   	push   es
    10eb:	31 5a 00             	xor    DWORD PTR [edx+0x0],ebx
    10ee:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    10f1:	06                   	push   es
    10f2:	66                   	data16
    10f3:	00 02                	add    BYTE PTR [edx],al
    10f5:	04 02                	add    al,0x2
    10f7:	58                   	pop    eax
    10f8:	00 02                	add    BYTE PTR [edx],al
    10fa:	04 03                	add    al,0x3
    10fc:	58                   	pop    eax
    10fd:	06                   	push   es
    10fe:	67 76 59             	addr16 jbe 115a <sysEnter_Vector-0x12eea6>
    1101:	67 03 72 4a          	add    esi,DWORD PTR [bp+si+0x4a]
    1105:	03 10                	add    edx,DWORD PTR [eax]
    1107:	ac                   	lods   al,BYTE PTR ds:[esi]
    1108:	03 76 2e             	add    esi,DWORD PTR [esi+0x2e]
    110b:	3e 03 09             	add    ecx,DWORD PTR ds:[ecx]
    110e:	20 67 75             	and    BYTE PTR [edi+0x75],ah
    1111:	67 2f                	addr16 das 
    1113:	67 00 02             	add    BYTE PTR [bp+si],al
    1116:	04 01                	add    al,0x1
    1118:	06                   	push   es
    1119:	66                   	data16
    111a:	00 02                	add    BYTE PTR [edx],al
    111c:	04 02                	add    al,0x2
    111e:	58                   	pop    eax
    111f:	00 02                	add    BYTE PTR [edx],al
    1121:	04 04                	add    al,0x4
    1123:	3c 06                	cmp    al,0x6
    1125:	59                   	pop    ecx
    1126:	2f                   	das    
    1127:	02 08                	add    cl,BYTE PTR [eax]
    1129:	00 01                	add    BYTE PTR [ecx],al
    112b:	01 43 00             	add    DWORD PTR [ebx+0x0],eax
    112e:	00 00                	add    BYTE PTR [eax],al
    1130:	02 00                	add    al,BYTE PTR [eax]
    1132:	2d 00 00 00 01       	sub    eax,0x1000000
    1137:	01 fb                	add    ebx,edi
    1139:	0e                   	push   cs
    113a:	0d 00 01 01 01       	or     eax,0x1010100
    113f:	01 00                	add    DWORD PTR [eax],eax
    1141:	00 00                	add    BYTE PTR [eax],al
    1143:	01 00                	add    DWORD PTR [eax],eax
    1145:	00 01                	add    BYTE PTR [ecx],al
    1147:	73 72                	jae    11bb <sysEnter_Vector-0x12ee45>
    1149:	63 2f                	arpl   WORD PTR [edi],bp
    114b:	73 74                	jae    11c1 <sysEnter_Vector-0x12ee3f>
    114d:	72 69                	jb     11b8 <sysEnter_Vector-0x12ee48>
    114f:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1150:	67 73 00             	addr16 jae 1153 <sysEnter_Vector-0x12eead>
    1153:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    1156:	72 70                	jb     11c8 <sysEnter_Vector-0x12ee38>
    1158:	61                   	popa   
    1159:	72 74                	jb     11cf <sysEnter_Vector-0x12ee31>
    115b:	73 2e                	jae    118b <sysEnter_Vector-0x12ee75>
    115d:	63 00                	arpl   WORD PTR [eax],ax
    115f:	01 00                	add    DWORD PTR [eax],eax
    1161:	00 00                	add    BYTE PTR [eax],al
    1163:	00 05 02 fc 14 00    	add    BYTE PTR ds:0x14fc02,al
    1169:	30 13                	xor    BYTE PTR [ebx],dl
    116b:	c9                   	leave  
    116c:	ad                   	lods   eax,DWORD PTR ds:[esi]
    116d:	3d 02 02 00 01       	cmp    eax,0x1000202
    1172:	01 7f 01             	add    DWORD PTR [edi+0x1],edi
    1175:	00 00                	add    BYTE PTR [eax],al
    1177:	02 00                	add    al,BYTE PTR [eax]
    1179:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
    117a:	00 00                	add    BYTE PTR [eax],al
    117c:	00 01                	add    BYTE PTR [ecx],al
    117e:	01 fb                	add    ebx,edi
    1180:	0e                   	push   cs
    1181:	0d 00 01 01 01       	or     eax,0x1010100
    1186:	01 00                	add    DWORD PTR [eax],eax
    1188:	00 00                	add    BYTE PTR [eax],al
    118a:	01 00                	add    DWORD PTR [eax],eax
    118c:	00 01                	add    BYTE PTR [ecx],al
    118e:	73 72                	jae    1202 <sysEnter_Vector-0x12edfe>
    1190:	63 2f                	arpl   WORD PTR [edi],bp
    1192:	73 74                	jae    1208 <sysEnter_Vector-0x12edf8>
    1194:	72 69                	jb     11ff <sysEnter_Vector-0x12ee01>
    1196:	6e                   	outs   dx,BYTE PTR ds:[esi]
    1197:	67 73 00             	addr16 jae 119a <sysEnter_Vector-0x12ee66>
    119a:	2f                   	das    
    119b:	68 6f 6d 65 2f       	push   0x2f656d6f
    11a0:	79 6f                	jns    1211 <sysEnter_Vector-0x12edef>
    11a2:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    11a9:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    11ac:	73 73                	jae    1221 <sysEnter_Vector-0x12eddf>
    11ae:	2f                   	das    
    11af:	6c                   	ins    BYTE PTR es:[edi],dx
    11b0:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    11b7:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    11bd:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    11c3:	78 2d                	js     11f2 <sysEnter_Vector-0x12ee0e>
    11c5:	67 6e                	outs   dx,BYTE PTR ds:[si]
    11c7:	75 2f                	jne    11f8 <sysEnter_Vector-0x12ee08>
    11c9:	35 2e 33 2e 30       	xor    eax,0x302e332e
    11ce:	2f                   	das    
    11cf:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    11d6:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    11d9:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    11dd:	65 00 00             	add    BYTE PTR gs:[eax],al
    11e0:	73 74                	jae    1256 <sysEnter_Vector-0x12edaa>
    11e2:	72 74                	jb     1258 <sysEnter_Vector-0x12eda8>
    11e4:	6f                   	outs   dx,DWORD PTR ds:[esi]
    11e5:	6c                   	ins    BYTE PTR es:[edi],dx
    11e6:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
    11e9:	01 00                	add    DWORD PTR [eax],eax
    11eb:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    11ee:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    11f5:	63 
    11f6:	2e                   	cs
    11f7:	68 00 02 00 00       	push   0x200
    11fc:	74 69                	je     1267 <sysEnter_Vector-0x12ed99>
    11fe:	6d                   	ins    DWORD PTR es:[edi],dx
    11ff:	65                   	gs
    1200:	2e                   	cs
    1201:	68 00 03 00 00       	push   0x300
    1206:	6d                   	ins    DWORD PTR es:[edi],dx
    1207:	61                   	popa   
    1208:	6c                   	ins    BYTE PTR es:[edi],dx
    1209:	6c                   	ins    BYTE PTR es:[edi],dx
    120a:	6f                   	outs   dx,DWORD PTR ds:[esi]
    120b:	63 2e                	arpl   WORD PTR [esi],bp
    120d:	68 00 03 00 00       	push   0x300
    1212:	6c                   	ins    BYTE PTR es:[edi],dx
    1213:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    121a:	4f                   	dec    edi
    121b:	53                   	push   ebx
    121c:	2e                   	cs
    121d:	68 00 03 00 00       	push   0x300
    1222:	00 00                	add    BYTE PTR [eax],al
    1224:	05 02 1c 15 00       	add    eax,0x151c02
    1229:	30 03                	xor    BYTE PTR [ebx],al
    122b:	d7                   	xlat   BYTE PTR ds:[ebx]
    122c:	00 01                	add    BYTE PTR [ecx],al
    122e:	08 2f                	or     BYTE PTR [edi],ch
    1230:	40                   	inc    eax
    1231:	00 02                	add    BYTE PTR [edx],al
    1233:	04 01                	add    al,0x1
    1235:	7c 00                	jl     1237 <sysEnter_Vector-0x12edc9>
    1237:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    123a:	ad                   	lods   eax,DWORD PTR ds:[esi]
    123b:	59                   	pop    ecx
    123c:	59                   	pop    ecx
    123d:	75 c9                	jne    1208 <sysEnter_Vector-0x12edf8>
    123f:	59                   	pop    ecx
    1240:	ad                   	lods   eax,DWORD PTR ds:[esi]
    1241:	00 02                	add    BYTE PTR [edx],al
    1243:	04 02                	add    al,0x2
    1245:	06                   	push   es
    1246:	66                   	data16
    1247:	00 02                	add    BYTE PTR [edx],al
    1249:	04 03                	add    al,0x3
    124b:	66 06                	pushw  es
    124d:	59                   	pop    ecx
    124e:	00 02                	add    BYTE PTR [edx],al
    1250:	04 01                	add    al,0x1
    1252:	06                   	push   es
    1253:	74 06                	je     125b <sysEnter_Vector-0x12eda5>
    1255:	75 91                	jne    11e8 <sysEnter_Vector-0x12ee18>
    1257:	3d 76 67 00 02       	cmp    eax,0x2006776
    125c:	04 01                	add    al,0x1
    125e:	06                   	push   es
    125f:	58                   	pop    eax
    1260:	00 02                	add    BYTE PTR [edx],al
    1262:	04 02                	add    al,0x2
    1264:	74 00                	je     1266 <sysEnter_Vector-0x12ed9a>
    1266:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1269:	58                   	pop    eax
    126a:	06                   	push   es
    126b:	03 13                	add    edx,DWORD PTR [ebx]
    126d:	3c 00                	cmp    al,0x0
    126f:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1272:	06                   	push   es
    1273:	66                   	data16
    1274:	00 02                	add    BYTE PTR [edx],al
    1276:	04 02                	add    al,0x2
    1278:	74 00                	je     127a <sysEnter_Vector-0x12ed86>
    127a:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    127d:	06                   	push   es
    127e:	59                   	pop    ecx
    127f:	00 02                	add    BYTE PTR [edx],al
    1281:	04 04                	add    al,0x4
    1283:	08 3d 00 02 04 04    	or     BYTE PTR ds:0x4040200,bh
    1289:	f3 9f                	repz lahf 
    128b:	83 59 c9 00          	sbb    DWORD PTR [ecx-0x37],0x0
    128f:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    1292:	06                   	push   es
    1293:	58                   	pop    eax
    1294:	00 02                	add    BYTE PTR [edx],al
    1296:	04 03                	add    al,0x3
    1298:	58                   	pop    eax
    1299:	00 02                	add    BYTE PTR [edx],al
    129b:	04 04                	add    al,0x4
    129d:	74 00                	je     129f <sysEnter_Vector-0x12ed61>
    129f:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    12a2:	58                   	pop    eax
    12a3:	06                   	push   es
    12a4:	31 5a 00             	xor    DWORD PTR [edx+0x0],ebx
    12a7:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    12aa:	06                   	push   es
    12ab:	66                   	data16
    12ac:	00 02                	add    BYTE PTR [edx],al
    12ae:	04 02                	add    al,0x2
    12b0:	58                   	pop    eax
    12b1:	00 02                	add    BYTE PTR [edx],al
    12b3:	04 03                	add    al,0x3
    12b5:	58                   	pop    eax
    12b6:	06                   	push   es
    12b7:	59                   	pop    ecx
    12b8:	76 59                	jbe    1313 <sysEnter_Vector-0x12eced>
    12ba:	67 03 72 4a          	add    esi,DWORD PTR [bp+si+0x4a]
    12be:	03 10                	add    edx,DWORD PTR [eax]
    12c0:	ac                   	lods   al,BYTE PTR ds:[esi]
    12c1:	03 76 2e             	add    esi,DWORD PTR [esi+0x2e]
    12c4:	3e 03 09             	add    ecx,DWORD PTR ds:[ecx]
    12c7:	20 67 00             	and    BYTE PTR [edi+0x0],ah
    12ca:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    12cd:	06                   	push   es
    12ce:	66                   	data16
    12cf:	00 02                	add    BYTE PTR [edx],al
    12d1:	04 02                	add    al,0x2
    12d3:	74 00                	je     12d5 <sysEnter_Vector-0x12ed2b>
    12d5:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    12d8:	58                   	pop    eax
    12d9:	06                   	push   es
    12da:	4b                   	dec    ebx
    12db:	67 2f                	addr16 das 
    12dd:	67 00 02             	add    BYTE PTR [bp+si],al
    12e0:	04 01                	add    al,0x1
    12e2:	06                   	push   es
    12e3:	66                   	data16
    12e4:	00 02                	add    BYTE PTR [edx],al
    12e6:	04 02                	add    al,0x2
    12e8:	58                   	pop    eax
    12e9:	00 02                	add    BYTE PTR [edx],al
    12eb:	04 04                	add    al,0x4
    12ed:	3c 06                	cmp    al,0x6
    12ef:	59                   	pop    ecx
    12f0:	2f                   	das    
    12f1:	02 08                	add    cl,BYTE PTR [eax]
    12f3:	00 01                	add    BYTE PTR [ecx],al
    12f5:	01 d6                	add    esi,edx
    12f7:	00 00                	add    BYTE PTR [eax],al
    12f9:	00 02                	add    BYTE PTR [edx],al
    12fb:	00 a7 00 00 00 01    	add    BYTE PTR [edi+0x1000000],ah
    1301:	01 fb                	add    ebx,edi
    1303:	0e                   	push   cs
    1304:	0d 00 01 01 01       	or     eax,0x1010100
    1309:	01 00                	add    DWORD PTR [eax],eax
    130b:	00 00                	add    BYTE PTR [eax],al
    130d:	01 00                	add    DWORD PTR [eax],eax
    130f:	00 01                	add    BYTE PTR [ecx],al
    1311:	73 72                	jae    1385 <sysEnter_Vector-0x12ec7b>
    1313:	63 2f                	arpl   WORD PTR [edi],bp
    1315:	73 74                	jae    138b <sysEnter_Vector-0x12ec75>
    1317:	72 69                	jb     1382 <sysEnter_Vector-0x12ec7e>
    1319:	6e                   	outs   dx,BYTE PTR ds:[esi]
    131a:	67 73 00             	addr16 jae 131d <sysEnter_Vector-0x12ece3>
    131d:	2f                   	das    
    131e:	68 6f 6d 65 2f       	push   0x2f656d6f
    1323:	79 6f                	jns    1394 <sysEnter_Vector-0x12ec6c>
    1325:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    132c:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    132f:	73 73                	jae    13a4 <sysEnter_Vector-0x12ec5c>
    1331:	2f                   	das    
    1332:	6c                   	ins    BYTE PTR es:[edi],dx
    1333:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    133a:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    1340:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    1346:	78 2d                	js     1375 <sysEnter_Vector-0x12ec8b>
    1348:	67 6e                	outs   dx,BYTE PTR ds:[si]
    134a:	75 2f                	jne    137b <sysEnter_Vector-0x12ec85>
    134c:	35 2e 33 2e 30       	xor    eax,0x302e332e
    1351:	2f                   	das    
    1352:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    1359:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    135c:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    1360:	65 00 00             	add    BYTE PTR gs:[eax],al
    1363:	73 74                	jae    13d9 <sysEnter_Vector-0x12ec27>
    1365:	72 74                	jb     13db <sysEnter_Vector-0x12ec25>
    1367:	72 69                	jb     13d2 <sysEnter_Vector-0x12ec2e>
    1369:	6d                   	ins    DWORD PTR es:[edi],dx
    136a:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
    136d:	01 00                	add    DWORD PTR [eax],eax
    136f:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    1372:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    1379:	63 
    137a:	2e                   	cs
    137b:	68 00 02 00 00       	push   0x200
    1380:	74 69                	je     13eb <sysEnter_Vector-0x12ec15>
    1382:	6d                   	ins    DWORD PTR es:[edi],dx
    1383:	65                   	gs
    1384:	2e                   	cs
    1385:	68 00 03 00 00       	push   0x300
    138a:	6d                   	ins    DWORD PTR es:[edi],dx
    138b:	61                   	popa   
    138c:	6c                   	ins    BYTE PTR es:[edi],dx
    138d:	6c                   	ins    BYTE PTR es:[edi],dx
    138e:	6f                   	outs   dx,DWORD PTR ds:[esi]
    138f:	63 2e                	arpl   WORD PTR [esi],bp
    1391:	68 00 03 00 00       	push   0x300
    1396:	6c                   	ins    BYTE PTR es:[edi],dx
    1397:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    139e:	4f                   	dec    edi
    139f:	53                   	push   ebx
    13a0:	2e                   	cs
    13a1:	68 00 03 00 00       	push   0x300
    13a6:	00 00                	add    BYTE PTR [eax],al
    13a8:	05 02 b8 16 00       	add    eax,0x16b802
    13ad:	30 15 08 13 bf 30    	xor    BYTE PTR ds:0x30bf1308,dl
    13b3:	48                   	dec    eax
    13b4:	b3 08                	mov    bl,0x8
    13b6:	9f                   	lahf   
    13b7:	30 b8 00 02 04 01    	xor    BYTE PTR [eax+0x1040200],bh
    13bd:	06                   	push   es
    13be:	82                   	(bad)  
    13bf:	06                   	push   es
    13c0:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
    13c1:	84 00                	test   BYTE PTR [eax],al
    13c3:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    13c6:	06                   	push   es
    13c7:	20 06                	and    BYTE PTR [esi],al
    13c9:	08 ca                	or     dl,cl
    13cb:	02 06                	add    al,BYTE PTR [esi]
    13cd:	00 01                	add    BYTE PTR [ecx],al
    13cf:	01 27                	add    DWORD PTR [edi],esp
    13d1:	03 00                	add    eax,DWORD PTR [eax]
    13d3:	00 02                	add    BYTE PTR [edx],al
    13d5:	00 cc                	add    ah,cl
    13d7:	00 00                	add    BYTE PTR [eax],al
    13d9:	00 01                	add    BYTE PTR [ecx],al
    13db:	01 fb                	add    ebx,edi
    13dd:	0e                   	push   cs
    13de:	0d 00 01 01 01       	or     eax,0x1010100
    13e3:	01 00                	add    DWORD PTR [eax],eax
    13e5:	00 00                	add    BYTE PTR [eax],al
    13e7:	01 00                	add    DWORD PTR [eax],eax
    13e9:	00 01                	add    BYTE PTR [ecx],al
    13eb:	73 72                	jae    145f <sysEnter_Vector-0x12eba1>
    13ed:	63 00                	arpl   WORD PTR [eax],ax
    13ef:	2f                   	das    
    13f0:	68 6f 6d 65 2f       	push   0x2f656d6f
    13f5:	79 6f                	jns    1466 <sysEnter_Vector-0x12eb9a>
    13f7:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
    13fe:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
    1401:	73 73                	jae    1476 <sysEnter_Vector-0x12eb8a>
    1403:	2f                   	das    
    1404:	6c                   	ins    BYTE PTR es:[edi],dx
    1405:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
    140c:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
    1412:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
    1418:	78 2d                	js     1447 <sysEnter_Vector-0x12ebb9>
    141a:	67 6e                	outs   dx,BYTE PTR ds:[si]
    141c:	75 2f                	jne    144d <sysEnter_Vector-0x12ebb3>
    141e:	35 2e 33 2e 30       	xor    eax,0x302e332e
    1423:	2f                   	das    
    1424:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    142b:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
    142e:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
    1432:	65 00 2e             	add    BYTE PTR gs:[esi],ch
    1435:	2e                   	cs
    1436:	2f                   	das    
    1437:	2e                   	cs
    1438:	2e                   	cs
    1439:	2f                   	das    
    143a:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
    143e:	6a 2f                	push   0x2f
    1440:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
    1443:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
    144a:	6e                   	outs   dx,BYTE PTR ds:[esi]
    144b:	65                   	gs
    144c:	6c                   	ins    BYTE PTR es:[edi],dx
    144d:	2f                   	das    
    144e:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
    1455:	00 00                	add    BYTE PTR [eax],al
    1457:	74 69                	je     14c2 <sysEnter_Vector-0x12eb3e>
    1459:	6d                   	ins    DWORD PTR es:[edi],dx
    145a:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax
    145e:	01 00                	add    DWORD PTR [eax],eax
    1460:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
    1463:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
    146a:	63 
    146b:	2e                   	cs
    146c:	68 00 02 00 00       	push   0x200
    1471:	74 69                	je     14dc <sysEnter_Vector-0x12eb24>
    1473:	6d                   	ins    DWORD PTR es:[edi],dx
    1474:	65                   	gs
    1475:	2e                   	cs
    1476:	68 00 03 00 00       	push   0x300
    147b:	6d                   	ins    DWORD PTR es:[edi],dx
    147c:	61                   	popa   
    147d:	6c                   	ins    BYTE PTR es:[edi],dx
    147e:	6c                   	ins    BYTE PTR es:[edi],dx
    147f:	6f                   	outs   dx,DWORD PTR ds:[esi]
    1480:	63 2e                	arpl   WORD PTR [esi],bp
    1482:	68 00 03 00 00       	push   0x300
    1487:	6c                   	ins    BYTE PTR es:[edi],dx
    1488:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
    148f:	4f                   	dec    edi
    1490:	53                   	push   ebx
    1491:	2e                   	cs
    1492:	68 00 03 00 00       	push   0x300
    1497:	73 79                	jae    1512 <sysEnter_Vector-0x12eaee>
    1499:	73 63                	jae    14fe <sysEnter_Vector-0x12eb02>
    149b:	61                   	popa   
    149c:	6c                   	ins    BYTE PTR es:[edi],dx
    149d:	6c                   	ins    BYTE PTR es:[edi],dx
    149e:	73 2e                	jae    14ce <sysEnter_Vector-0x12eb32>
    14a0:	68 00 04 00 00       	push   0x400
    14a5:	00 00                	add    BYTE PTR [eax],al
    14a7:	05 02 50 17 00       	add    eax,0x175002
    14ac:	30 03                	xor    BYTE PTR [ebx],al
    14ae:	16                   	push   ss
    14af:	01 f3                	add    ebx,esi
    14b1:	75 c9                	jne    147c <sysEnter_Vector-0x12eb84>
    14b3:	3d 31 08 21 84       	cmp    eax,0x84210831
    14b8:	76 02                	jbe    14bc <sysEnter_Vector-0x12eb44>
    14ba:	24 13                	and    al,0x13
    14bc:	08 22                	or     BYTE PTR [edx],ah
    14be:	02 2e                	add    ch,BYTE PTR [esi]
    14c0:	13 02                	adc    eax,DWORD PTR [edx]
    14c2:	2f                   	das    
    14c3:	13 08                	adc    ecx,DWORD PTR [eax]
    14c5:	67 02 2d             	add    ch,BYTE PTR [di]
    14c8:	13 2f                	adc    ebp,DWORD PTR [edi]
    14ca:	00 02                	add    BYTE PTR [edx],al
    14cc:	04 01                	add    al,0x1
    14ce:	06                   	push   es
    14cf:	9e                   	sahf   
    14d0:	00 02                	add    BYTE PTR [edx],al
    14d2:	04 04                	add    al,0x4
    14d4:	02 23                	add    ah,BYTE PTR [ebx]
    14d6:	12 00                	adc    al,BYTE PTR [eax]
    14d8:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    14df:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    14e2:	74 00                	je     14e4 <sysEnter_Vector-0x12eb1c>
    14e4:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    14e7:	58                   	pop    eax
    14e8:	00 02                	add    BYTE PTR [edx],al
    14ea:	04 08                	add    al,0x8
    14ec:	06                   	push   es
    14ed:	3d 48 00 02 04       	cmp    eax,0x4020048
    14f2:	01 06                	add    DWORD PTR [esi],eax
    14f4:	9e                   	sahf   
    14f5:	00 02                	add    BYTE PTR [edx],al
    14f7:	04 04                	add    al,0x4
    14f9:	02 23                	add    ah,BYTE PTR [ebx]
    14fb:	12 00                	adc    al,BYTE PTR [eax]
    14fd:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    1504:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1507:	74 00                	je     1509 <sysEnter_Vector-0x12eaf7>
    1509:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    150c:	58                   	pop    eax
    150d:	06                   	push   es
    150e:	94                   	xchg   esp,eax
    150f:	e5 91                	in     eax,0x91
    1511:	9f                   	lahf   
    1512:	59                   	pop    ecx
    1513:	00 02                	add    BYTE PTR [edx],al
    1515:	04 01                	add    al,0x1
    1517:	06                   	push   es
    1518:	9e                   	sahf   
    1519:	00 02                	add    BYTE PTR [edx],al
    151b:	04 04                	add    al,0x4
    151d:	02 23                	add    ah,BYTE PTR [ebx]
    151f:	12 00                	adc    al,BYTE PTR [eax]
    1521:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    1528:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    152b:	74 00                	je     152d <sysEnter_Vector-0x12ead3>
    152d:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1530:	58                   	pop    eax
    1531:	00 02                	add    BYTE PTR [edx],al
    1533:	04 08                	add    al,0x8
    1535:	06                   	push   es
    1536:	08 9f e2 00 02 04    	or     BYTE PTR [edi+0x40200e2],bl
    153c:	01 06                	add    DWORD PTR [esi],eax
    153e:	9e                   	sahf   
    153f:	00 02                	add    BYTE PTR [edx],al
    1541:	04 04                	add    al,0x4
    1543:	02 23                	add    ah,BYTE PTR [ebx]
    1545:	12 00                	adc    al,BYTE PTR [eax]
    1547:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    154e:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    1551:	74 00                	je     1553 <sysEnter_Vector-0x12eaad>
    1553:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1556:	58                   	pop    eax
    1557:	06                   	push   es
    1558:	08 f6                	or     dh,dh
    155a:	d7                   	xlat   BYTE PTR ds:[ebx]
    155b:	9f                   	lahf   
    155c:	3d 68 08 16 08       	cmp    eax,0x8160868
    1561:	3d 08 4b 5a 08       	cmp    eax,0x85a4b08
    1566:	15 08 3d 08 3d       	adc    eax,0x3d083d08
    156b:	5a                   	pop    edx
    156c:	08 44 02 2e          	or     BYTE PTR [edx+eax*1+0x2e],al
    1570:	13 02                	adc    eax,DWORD PTR [edx]
    1572:	3a 13                	cmp    dl,BYTE PTR [ebx]
    1574:	91                   	xchg   ecx,eax
    1575:	c9                   	leave  
    1576:	e6 02                	out    0x2,al
    1578:	2f                   	das    
    1579:	13 02                	adc    eax,DWORD PTR [edx]
    157b:	3c 13                	cmp    al,0x13
    157d:	9f                   	lahf   
    157e:	e5 e6                	in     eax,0xe6
    1580:	08 c9                	or     cl,cl
    1582:	02 2c 13             	add    ch,BYTE PTR [ebx+edx*1]
    1585:	9f                   	lahf   
    1586:	e5 4c                	in     eax,0x4c
    1588:	02 29                	add    ch,BYTE PTR [ecx]
    158a:	13 02                	adc    eax,DWORD PTR [edx]
    158c:	2b 13                	sub    edx,DWORD PTR [ebx]
    158e:	9f                   	lahf   
    158f:	e5 e6                	in     eax,0xe6
    1591:	bb 59 08 83 e5       	mov    ebx,0xe5830859
    1596:	a0 00 02 04 01       	mov    al,ds:0x1040200
    159b:	06                   	push   es
    159c:	c8 00 02 04          	enter  0x200,0x4
    15a0:	04 02                	add    al,0x2
    15a2:	2c 12                	sub    al,0x12
    15a4:	00 02                	add    BYTE PTR [edx],al
    15a6:	04 05                	add    al,0x5
    15a8:	02 2f                	add    ch,BYTE PTR [edi]
    15aa:	12 00                	adc    al,BYTE PTR [eax]
    15ac:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    15af:	74 00                	je     15b1 <sysEnter_Vector-0x12ea4f>
    15b1:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    15b4:	58                   	pop    eax
    15b5:	06                   	push   es
    15b6:	08 99 a5 59 00 02    	or     BYTE PTR [ecx+0x20059a5],bl
    15bc:	04 01                	add    al,0x1
    15be:	06                   	push   es
    15bf:	c8 00 02 04          	enter  0x200,0x4
    15c3:	04 02                	add    al,0x2
    15c5:	2c 12                	sub    al,0x12
    15c7:	00 02                	add    BYTE PTR [edx],al
    15c9:	04 05                	add    al,0x5
    15cb:	02 2f                	add    ch,BYTE PTR [edi]
    15cd:	12 00                	adc    al,BYTE PTR [eax]
    15cf:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    15d2:	74 00                	je     15d4 <sysEnter_Vector-0x12ea2c>
    15d4:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    15d7:	58                   	pop    eax
    15d8:	00 02                	add    BYTE PTR [edx],al
    15da:	04 08                	add    al,0x8
    15dc:	06                   	push   es
    15dd:	08 9f 08 91 9f e0    	or     BYTE PTR [edi-0x1f606ef8],bl
    15e3:	00 02                	add    BYTE PTR [edx],al
    15e5:	04 01                	add    al,0x1
    15e7:	06                   	push   es
    15e8:	c8 00 02 04          	enter  0x200,0x4
    15ec:	04 02                	add    al,0x2
    15ee:	2c 12                	sub    al,0x12
    15f0:	00 02                	add    BYTE PTR [edx],al
    15f2:	04 05                	add    al,0x5
    15f4:	02 2f                	add    ch,BYTE PTR [edi]
    15f6:	12 00                	adc    al,BYTE PTR [eax]
    15f8:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    15fb:	74 00                	je     15fd <sysEnter_Vector-0x12ea03>
    15fd:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    1600:	58                   	pop    eax
    1601:	06                   	push   es
    1602:	08 f9                	or     cl,bh
    1604:	bb 75 00 02 04       	mov    ebx,0x4020075
    1609:	01 06                	add    DWORD PTR [esi],eax
    160b:	08 2e                	or     BYTE PTR [esi],ch
    160d:	06                   	push   es
    160e:	9f                   	lahf   
    160f:	75 75                	jne    1686 <sysEnter_Vector-0x12e97a>
    1611:	7b d8                	jnp    15eb <sysEnter_Vector-0x12ea15>
    1613:	00 02                	add    BYTE PTR [edx],al
    1615:	04 01                	add    al,0x1
    1617:	06                   	push   es
    1618:	c8 06 75 e5          	enter  0x7506,0xe5
    161c:	00 02                	add    BYTE PTR [edx],al
    161e:	04 01                	add    al,0x1
    1620:	06                   	push   es
    1621:	02 22                	add    ah,BYTE PTR [edx]
    1623:	12 06                	adc    al,BYTE PTR [esi]
    1625:	4b                   	dec    ebx
    1626:	00 02                	add    BYTE PTR [edx],al
    1628:	04 01                	add    al,0x1
    162a:	06                   	push   es
    162b:	08 ba 00 02 04 03    	or     BYTE PTR [edx+0x3040200],bh
    1631:	02 22                	add    ah,BYTE PTR [edx]
    1633:	12 00                	adc    al,BYTE PTR [eax]
    1635:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
    1638:	74 00                	je     163a <sysEnter_Vector-0x12e9c6>
    163a:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    163d:	58                   	pop    eax
    163e:	00 02                	add    BYTE PTR [edx],al
    1640:	04 06                	add    al,0x6
    1642:	06                   	push   es
    1643:	59                   	pop    ecx
    1644:	00 02                	add    BYTE PTR [edx],al
    1646:	04 01                	add    al,0x1
    1648:	06                   	push   es
    1649:	02 40 12             	add    al,BYTE PTR [eax+0x12]
    164c:	00 02                	add    BYTE PTR [edx],al
    164e:	04 03                	add    al,0x3
    1650:	02 42 12             	add    al,BYTE PTR [edx+0x12]
    1653:	00 02                	add    BYTE PTR [edx],al
    1655:	04 04                	add    al,0x4
    1657:	74 00                	je     1659 <sysEnter_Vector-0x12e9a7>
    1659:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    165c:	58                   	pop    eax
    165d:	00 02                	add    BYTE PTR [edx],al
    165f:	04 06                	add    al,0x6
    1661:	06                   	push   es
    1662:	59                   	pop    ecx
    1663:	00 02                	add    BYTE PTR [edx],al
    1665:	04 01                	add    al,0x1
    1667:	06                   	push   es
    1668:	02 43 12             	add    al,BYTE PTR [ebx+0x12]
    166b:	00 02                	add    BYTE PTR [edx],al
    166d:	04 03                	add    al,0x3
    166f:	02 48 12             	add    cl,BYTE PTR [eax+0x12]
    1672:	00 02                	add    BYTE PTR [edx],al
    1674:	04 04                	add    al,0x4
    1676:	74 00                	je     1678 <sysEnter_Vector-0x12e988>
    1678:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    167b:	58                   	pop    eax
    167c:	00 02                	add    BYTE PTR [edx],al
    167e:	04 06                	add    al,0x6
    1680:	06                   	push   es
    1681:	5a                   	pop    edx
    1682:	00 02                	add    BYTE PTR [edx],al
    1684:	04 06                	add    al,0x6
    1686:	c9                   	leave  
    1687:	2f                   	das    
    1688:	00 02                	add    BYTE PTR [edx],al
    168a:	04 01                	add    al,0x1
    168c:	06                   	push   es
    168d:	9e                   	sahf   
    168e:	00 02                	add    BYTE PTR [edx],al
    1690:	04 04                	add    al,0x4
    1692:	02 23                	add    ah,BYTE PTR [ebx]
    1694:	12 00                	adc    al,BYTE PTR [eax]
    1696:	02 04 05 02 26 12 00 	add    al,BYTE PTR [eax*1+0x122602]
    169d:	02 04 06             	add    al,BYTE PTR [esi+eax*1]
    16a0:	74 00                	je     16a2 <sysEnter_Vector-0x12e95e>
    16a2:	02 04 08             	add    al,BYTE PTR [eax+ecx*1]
    16a5:	58                   	pop    eax
    16a6:	00 02                	add    BYTE PTR [edx],al
    16a8:	04 08                	add    al,0x8
    16aa:	06                   	push   es
    16ab:	08 75 48             	or     BYTE PTR [ebp+0x48],dh
    16ae:	e8 bb 00 02 04       	call   402176e <sysEnter_Vector+0x3ef176e>
    16b3:	01 06                	add    DWORD PTR [esi],eax
    16b5:	ba 06 4b 68 91       	mov    edx,0x91684b06
    16ba:	02 31                	add    dh,BYTE PTR [ecx]
    16bc:	14 02                	adc    al,0x2
    16be:	2c 14                	sub    al,0x14
    16c0:	00 02                	add    BYTE PTR [edx],al
    16c2:	04 01                	add    al,0x1
    16c4:	06                   	push   es
    16c5:	02 29                	add    ch,BYTE PTR [ecx]
    16c7:	12 06                	adc    al,BYTE PTR [esi]
    16c9:	4b                   	dec    ebx
    16ca:	bd 00 02 04 01       	mov    ebp,0x1040200
    16cf:	06                   	push   es
    16d0:	ba 00 02 04 03       	mov    edx,0x3040200
    16d5:	06                   	push   es
    16d6:	08 59 00             	or     BYTE PTR [ecx+0x0],bl
    16d9:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
    16dc:	81 4b e5 4c ae 9f ae 	or     DWORD PTR [ebx-0x1b],0xae9fae4c
    16e3:	77 00                	ja     16e5 <sysEnter_Vector-0x12e91b>
    16e5:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
    16e8:	06                   	push   es
    16e9:	82                   	(bad)  
    16ea:	06                   	push   es
    16eb:	4b                   	dec    ebx
    16ec:	68 00 02 04 01       	push   0x1040200
    16f1:	06                   	push   es
    16f2:	66 06                	pushw  es
    16f4:	85 3d 02 08 00 01    	test   DWORD PTR ds:0x1000802,edi
    16fa:	01                   	.byte 0x1

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
 1e0:	6b 00 69             	imul   eax,DWORD PTR [eax],0x69
 1e3:	74 6f                	je     254 <sysEnter_Vector-0x12fdac>
 1e5:	61                   	popa   
 1e6:	49                   	dec    ecx
 1e7:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 1ea:	63 2f                	arpl   WORD PTR [edi],bp
 1ec:	61                   	popa   
 1ed:	73 63                	jae    252 <sysEnter_Vector-0x12fdae>
 1ef:	69 69 2e 63 00 61 74 	imul   ebp,DWORD PTR [ecx+0x2e],0x74610063
 1f6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1f7:	69 00 73 74 72 6c    	imul   eax,DWORD PTR [eax],0x6c727473
 1fd:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 1ff:	49                   	dec    ecx
 200:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 203:	76 65                	jbe    26a <sysEnter_Vector-0x12fd96>
 205:	72 73                	jb     27a <sysEnter_Vector-0x12fd86>
 207:	65                   	gs
 208:	49                   	dec    ecx
 209:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 20c:	67 6e                	outs   dx,BYTE PTR ds:[si]
 20e:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 211:	72 65                	jb     278 <sysEnter_Vector-0x12fd88>
 213:	61                   	popa   
 214:	6d                   	ins    DWORD PTR es:[edi],dx
 215:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 218:	53                   	push   ebx
 219:	43                   	inc    ebx
 21a:	41                   	inc    ecx
 21b:	4c                   	dec    esp
 21c:	4c                   	dec    esp
 21d:	5f                   	pop    edi
 21e:	47                   	inc    edi
 21f:	45                   	inc    ebp
 220:	54                   	push   esp
 221:	54                   	push   esp
 222:	49                   	dec    ecx
 223:	43                   	inc    ebx
 224:	4b                   	dec    ebx
 225:	53                   	push   ebx
 226:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 229:	53                   	push   ebx
 22a:	43                   	inc    ebx
 22b:	41                   	inc    ecx
 22c:	4c                   	dec    esp
 22d:	4c                   	dec    esp
 22e:	5f                   	pop    edi
 22f:	48                   	dec    eax
 230:	4c                   	dec    esp
 231:	54                   	push   esp
 232:	00 62 75             	add    BYTE PTR [edx+0x75],ah
 235:	66                   	data16
 236:	66                   	data16
 237:	65                   	gs
 238:	72 00                	jb     23a <sysEnter_Vector-0x12fdc6>
 23a:	67                   	addr16
 23b:	65                   	gs
 23c:	74 73                	je     2b1 <sysEnter_Vector-0x12fd4f>
 23e:	45                   	inc    ebp
 23f:	72 72                	jb     2b3 <sysEnter_Vector-0x12fd4d>
 241:	6f                   	outs   dx,DWORD PTR ds:[esi]
 242:	72 00                	jb     244 <sysEnter_Vector-0x12fdbc>
 244:	53                   	push   ebx
 245:	59                   	pop    ecx
 246:	53                   	push   ebx
 247:	43                   	inc    ebx
 248:	41                   	inc    ecx
 249:	4c                   	dec    esp
 24a:	4c                   	dec    esp
 24b:	5f                   	pop    edi
 24c:	47                   	inc    edi
 24d:	45                   	inc    ebp
 24e:	54                   	push   esp
 24f:	43                   	inc    ebx
 250:	57                   	push   edi
 251:	44                   	inc    esp
 252:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 255:	63 2f                	arpl   WORD PTR [edi],bp
 257:	69 6e 70 75 74 2f 69 	imul   ebp,DWORD PTR [esi+0x70],0x692f7475
 25e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 25f:	70 75                	jo     2d6 <sysEnter_Vector-0x12fd2a>
 261:	74 2e                	je     291 <sysEnter_Vector-0x12fd6f>
 263:	63 00                	arpl   WORD PTR [eax],ax
 265:	65                   	gs
 266:	73 79                	jae    2e1 <sysEnter_Vector-0x12fd1f>
 268:	73 63                	jae    2cd <sysEnter_Vector-0x12fd33>
 26a:	61                   	popa   
 26b:	6c                   	ins    BYTE PTR es:[edi],dx
 26c:	6c                   	ins    BYTE PTR es:[edi],dx
 26d:	73 00                	jae    26f <sysEnter_Vector-0x12fd91>
 26f:	53                   	push   ebx
 270:	59                   	pop    ecx
 271:	53                   	push   ebx
 272:	43                   	inc    ebx
 273:	41                   	inc    ecx
 274:	4c                   	dec    esp
 275:	4c                   	dec    esp
 276:	5f                   	pop    edi
 277:	57                   	push   edi
 278:	41                   	inc    ecx
 279:	49                   	dec    ecx
 27a:	54                   	push   esp
 27b:	46                   	inc    esi
 27c:	4f                   	dec    edi
 27d:	52                   	push   edx
 27e:	50                   	push   eax
 27f:	49                   	dec    ecx
 280:	44                   	inc    esp
 281:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 284:	53                   	push   ebx
 285:	43                   	inc    ebx
 286:	41                   	inc    ecx
 287:	4c                   	dec    esp
 288:	4c                   	dec    esp
 289:	5f                   	pop    edi
 28a:	53                   	push   ebx
 28b:	45                   	inc    ebp
 28c:	54                   	push   esp
 28d:	53                   	push   ebx
 28e:	49                   	dec    ecx
 28f:	47                   	inc    edi
 290:	41                   	inc    ecx
 291:	43                   	inc    ebx
 292:	54                   	push   esp
 293:	49                   	dec    ecx
 294:	4f                   	dec    edi
 295:	4e                   	dec    esi
 296:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 299:	63 68 61             	arpl   WORD PTR [eax+0x61],bp
 29c:	72 00                	jb     29e <sysEnter_Vector-0x12fd62>
 29e:	53                   	push   ebx
 29f:	59                   	pop    ecx
 2a0:	53                   	push   ebx
 2a1:	43                   	inc    ebx
 2a2:	41                   	inc    ecx
 2a3:	4c                   	dec    esp
 2a4:	4c                   	dec    esp
 2a5:	5f                   	pop    edi
 2a6:	53                   	push   ebx
 2a7:	4c                   	dec    esp
 2a8:	45                   	inc    ebp
 2a9:	45                   	inc    ebp
 2aa:	50                   	push   eax
 2ab:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 2ae:	74 63                	je     313 <sysEnter_Vector-0x12fced>
 2b0:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 2b3:	78 6c                	js     321 <sysEnter_Vector-0x12fcdf>
 2b5:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2b7:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2ba:	53                   	push   ebx
 2bb:	43                   	inc    ebx
 2bc:	41                   	inc    ecx
 2bd:	4c                   	dec    esp
 2be:	4c                   	dec    esp
 2bf:	5f                   	pop    edi
 2c0:	50                   	push   eax
 2c1:	52                   	push   edx
 2c2:	49                   	dec    ecx
 2c3:	4e                   	dec    esi
 2c4:	54                   	push   esp
 2c5:	44                   	inc    esp
 2c6:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2c9:	53                   	push   ebx
 2ca:	43                   	inc    ebx
 2cb:	41                   	inc    ecx
 2cc:	4c                   	dec    esp
 2cd:	4c                   	dec    esp
 2ce:	5f                   	pop    edi
 2cf:	41                   	inc    ecx
 2d0:	4c                   	dec    esp
 2d1:	4c                   	dec    esp
 2d2:	4f                   	dec    edi
 2d3:	43                   	inc    ebx
 2d4:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 2d7:	74 73                	je     34c <sysEnter_Vector-0x12fcb4>
 2d9:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2dc:	53                   	push   ebx
 2dd:	43                   	inc    ebx
 2de:	41                   	inc    ecx
 2df:	4c                   	dec    esp
 2e0:	4c                   	dec    esp
 2e1:	5f                   	pop    edi
 2e2:	52                   	push   edx
 2e3:	45                   	inc    ebp
 2e4:	41                   	inc    ecx
 2e5:	44                   	inc    esp
 2e6:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2e9:	53                   	push   ebx
 2ea:	43                   	inc    ebx
 2eb:	41                   	inc    ecx
 2ec:	4c                   	dec    esp
 2ed:	4c                   	dec    esp
 2ee:	5f                   	pop    edi
 2ef:	45                   	inc    ebp
 2f0:	58                   	pop    eax
 2f1:	45                   	inc    ebp
 2f2:	43                   	inc    ebx
 2f3:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 2f6:	53                   	push   ebx
 2f7:	43                   	inc    ebx
 2f8:	41                   	inc    ecx
 2f9:	4c                   	dec    esp
 2fa:	4c                   	dec    esp
 2fb:	5f                   	pop    edi
 2fc:	45                   	inc    ebp
 2fd:	4e                   	dec    esi
 2fe:	44                   	inc    esp
 2ff:	50                   	push   eax
 300:	52                   	push   edx
 301:	4f                   	dec    edi
 302:	43                   	inc    ebx
 303:	45                   	inc    ebp
 304:	53                   	push   ebx
 305:	53                   	push   ebx
 306:	00 70 75             	add    BYTE PTR [eax+0x75],dh
 309:	74 63                	je     36e <sysEnter_Vector-0x12fc92>
 30b:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 30e:	53                   	push   ebx
 30f:	43                   	inc    ebx
 310:	41                   	inc    ecx
 311:	4c                   	dec    esp
 312:	4c                   	dec    esp
 313:	5f                   	pop    edi
 314:	52                   	push   edx
 315:	45                   	inc    ebp
 316:	47                   	inc    edi
 317:	45                   	inc    ebp
 318:	58                   	pop    eax
 319:	49                   	dec    ecx
 31a:	54                   	push   esp
 31b:	48                   	dec    eax
 31c:	41                   	inc    ecx
 31d:	4e                   	dec    esi
 31e:	44                   	inc    esp
 31f:	4c                   	dec    esp
 320:	45                   	inc    ebp
 321:	52                   	push   edx
 322:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 325:	53                   	push   ebx
 326:	43                   	inc    ebx
 327:	41                   	inc    ecx
 328:	4c                   	dec    esp
 329:	4c                   	dec    esp
 32a:	5f                   	pop    edi
 32b:	46                   	inc    esi
 32c:	52                   	push   edx
 32d:	45                   	inc    ebp
 32e:	45                   	inc    ebp
 32f:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 332:	53                   	push   ebx
 333:	43                   	inc    ebx
 334:	41                   	inc    ecx
 335:	4c                   	dec    esp
 336:	4c                   	dec    esp
 337:	5f                   	pop    edi
 338:	53                   	push   ebx
 339:	54                   	push   esp
 33a:	4f                   	dec    edi
 33b:	50                   	push   eax
 33c:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 33f:	53                   	push   ebx
 340:	43                   	inc    ebx
 341:	41                   	inc    ecx
 342:	4c                   	dec    esp
 343:	4c                   	dec    esp
 344:	5f                   	pop    edi
 345:	57                   	push   edi
 346:	52                   	push   edx
 347:	49                   	dec    ecx
 348:	54                   	push   esp
 349:	45                   	inc    ebp
 34a:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 34d:	53                   	push   ebx
 34e:	43                   	inc    ebx
 34f:	41                   	inc    ecx
 350:	4c                   	dec    esp
 351:	4c                   	dec    esp
 352:	5f                   	pop    edi
 353:	49                   	dec    ecx
 354:	4e                   	dec    esi
 355:	56                   	push   esi
 356:	41                   	inc    ecx
 357:	4c                   	dec    esp
 358:	49                   	dec    ecx
 359:	44                   	inc    esp
 35a:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 35d:	53                   	push   ebx
 35e:	43                   	inc    ebx
 35f:	41                   	inc    ecx
 360:	4c                   	dec    esp
 361:	4c                   	dec    esp
 362:	5f                   	pop    edi
 363:	52                   	push   edx
 364:	45                   	inc    ebp
 365:	42                   	inc    edx
 366:	4f                   	dec    edi
 367:	4f                   	dec    edi
 368:	54                   	push   esp
 369:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 36c:	53                   	push   ebx
 36d:	43                   	inc    ebx
 36e:	41                   	inc    ecx
 36f:	4c                   	dec    esp
 370:	4c                   	dec    esp
 371:	5f                   	pop    edi
 372:	53                   	push   ebx
 373:	45                   	inc    ebp
 374:	54                   	push   esp
 375:	50                   	push   eax
 376:	52                   	push   edx
 377:	49                   	dec    ecx
 378:	4f                   	dec    edi
 379:	52                   	push   edx
 37a:	49                   	dec    ecx
 37b:	54                   	push   esp
 37c:	59                   	pop    ecx
 37d:	00 6c 62 75          	add    BYTE PTR [edx+eiz*2+0x75],ch
 381:	66                   	data16
 382:	00 70 75             	add    BYTE PTR [eax+0x75],dh
 385:	74 73                	je     3fa <sysEnter_Vector-0x12fc06>
 387:	00 53 59             	add    BYTE PTR [ebx+0x59],dl
 38a:	53                   	push   ebx
 38b:	43                   	inc    ebx
 38c:	41                   	inc    ecx
 38d:	4c                   	dec    esp
 38e:	4c                   	dec    esp
 38f:	5f                   	pop    edi
 390:	50                   	push   eax
 391:	52                   	push   edx
 392:	49                   	dec    ecx
 393:	4e                   	dec    esi
 394:	54                   	push   esp
 395:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 398:	74 56                	je     3f0 <sysEnter_Vector-0x12fc10>
 39a:	61                   	popa   
 39b:	6c                   	ins    BYTE PTR es:[edi],dx
 39c:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 3a0:	68 6f 75 72 00       	push   0x72756f
 3a5:	73 69                	jae    410 <sysEnter_Vector-0x12fbf0>
 3a7:	7a 65                	jp     40e <sysEnter_Vector-0x12fbf2>
 3a9:	5f                   	pop    edi
 3aa:	74 00                	je     3ac <sysEnter_Vector-0x12fc54>
 3ac:	73 6c                	jae    41a <sysEnter_Vector-0x12fbe6>
 3ae:	65                   	gs
 3af:	65                   	gs
 3b0:	70 00                	jo     3b2 <sysEnter_Vector-0x12fc4e>
 3b2:	73 69                	jae    41d <sysEnter_Vector-0x12fbe3>
 3b4:	67 44                	addr16 inc esp
 3b6:	61                   	popa   
 3b7:	74 61                	je     41a <sysEnter_Vector-0x12fbe6>
 3b9:	00 74 68 65          	add    BYTE PTR [eax+ebp*2+0x65],dh
 3bd:	54                   	push   esp
 3be:	69 6d 65 00 74 6d 5f 	imul   ebp,DWORD PTR [ebp+0x65],0x5f6d7400
 3c5:	7a 6f                	jp     436 <sysEnter_Vector-0x12fbca>
 3c7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3c8:	65 00 73 69          	add    BYTE PTR gs:[ebx+0x69],dh
 3cc:	7a 65                	jp     433 <sysEnter_Vector-0x12fbcd>
 3ce:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3d2:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
 3d5:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3d6:	69 74 00 70 72 69 6e 	imul   esi,DWORD PTR [eax+eax*1+0x70],0x746e6972
 3dd:	74 
 3de:	00 5f 5f             	add    BYTE PTR [edi+0x5f],bl
 3e1:	62 75 69             	bound  esi,QWORD PTR [ebp+0x69]
 3e4:	6c                   	ins    BYTE PTR es:[edi],dx
 3e5:	74 69                	je     450 <sysEnter_Vector-0x12fbb0>
 3e7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3e8:	5f                   	pop    edi
 3e9:	76 61                	jbe    44c <sysEnter_Vector-0x12fbb4>
 3eb:	5f                   	pop    edi
 3ec:	6c                   	ins    BYTE PTR es:[edi],dx
 3ed:	69 73 74 00 74 6d 5f 	imul   esi,DWORD PTR [ebx+0x74],0x5f6d7400
 3f4:	6d                   	ins    DWORD PTR es:[edi],dx
 3f5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3f6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3f7:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 3fb:	79 65                	jns    462 <sysEnter_Vector-0x12fb9e>
 3fd:	61                   	popa   
 3fe:	72 00                	jb     400 <sysEnter_Vector-0x12fc00>
 400:	67                   	addr16
 401:	65                   	gs
 402:	74 74                	je     478 <sysEnter_Vector-0x12fb88>
 404:	69 6d 65 00 77 61 69 	imul   ebp,DWORD PTR [ebp+0x65],0x69617700
 40b:	74 70                	je     47d <sysEnter_Vector-0x12fb83>
 40d:	69 64 00 44 65 62 75 	imul   esp,DWORD PTR [eax+eax*1+0x44],0x67756265
 414:	67 
 415:	4c                   	dec    esp
 416:	65                   	gs
 417:	76 65                	jbe    47e <sysEnter_Vector-0x12fb82>
 419:	6c                   	ins    BYTE PTR es:[edi],dx
 41a:	00 63 61             	add    BYTE PTR [ebx+0x61],ah
 41d:	6c                   	ins    BYTE PTR es:[edi],dx
 41e:	6c                   	ins    BYTE PTR es:[edi],dx
 41f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 420:	75 6d                	jne    48f <sysEnter_Vector-0x12fb71>
 422:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 426:	69 73 64 73 74 00 64 	imul   esi,DWORD PTR [ebx+0x64],0x64007473
 42d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 42e:	5f                   	pop    edi
 42f:	73 79                	jae    4aa <sysEnter_Vector-0x12fb56>
 431:	73 63                	jae    496 <sysEnter_Vector-0x12fb6a>
 433:	61                   	popa   
 434:	6c                   	ins    BYTE PTR es:[edi],dx
 435:	6c                   	ins    BYTE PTR es:[edi],dx
 436:	31 00                	xor    DWORD PTR [eax],eax
 438:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 43a:	5f                   	pop    edi
 43b:	73 79                	jae    4b6 <sysEnter_Vector-0x12fb4a>
 43d:	73 63                	jae    4a2 <sysEnter_Vector-0x12fb5e>
 43f:	61                   	popa   
 440:	6c                   	ins    BYTE PTR es:[edi],dx
 441:	6c                   	ins    BYTE PTR es:[edi],dx
 442:	32 00                	xor    al,BYTE PTR [eax]
 444:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 446:	5f                   	pop    edi
 447:	73 79                	jae    4c2 <sysEnter_Vector-0x12fb3e>
 449:	73 63                	jae    4ae <sysEnter_Vector-0x12fb52>
 44b:	61                   	popa   
 44c:	6c                   	ins    BYTE PTR es:[edi],dx
 44d:	6c                   	ins    BYTE PTR es:[edi],dx
 44e:	33 00                	xor    eax,DWORD PTR [eax]
 450:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 452:	5f                   	pop    edi
 453:	73 79                	jae    4ce <sysEnter_Vector-0x12fb32>
 455:	73 63                	jae    4ba <sysEnter_Vector-0x12fb46>
 457:	61                   	popa   
 458:	6c                   	ins    BYTE PTR es:[edi],dx
 459:	6c                   	ins    BYTE PTR es:[edi],dx
 45a:	34 00                	xor    al,0x0
 45c:	6c                   	ins    BYTE PTR es:[edi],dx
 45d:	69 62 63 49 6e 69 74 	imul   esp,DWORD PTR [edx+0x63],0x74696e49
 464:	69 61 6c 69 7a 65 64 	imul   esp,DWORD PTR [ecx+0x6c],0x64657a69
 46b:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 46f:	6d                   	ins    DWORD PTR es:[edi],dx
 470:	69 6e 00 74 69 63 6b 	imul   ebp,DWORD PTR [esi+0x0],0x6b636974
 477:	73 00                	jae    479 <sysEnter_Vector-0x12fb87>
 479:	74 6d                	je     4e8 <sysEnter_Vector-0x12fb18>
 47b:	5f                   	pop    edi
 47c:	79 64                	jns    4e2 <sysEnter_Vector-0x12fb1e>
 47e:	61                   	popa   
 47f:	79 00                	jns    481 <sysEnter_Vector-0x12fb7f>
 481:	5f                   	pop    edi
 482:	5f                   	pop    edi
 483:	67 6e                	outs   dx,BYTE PTR ds:[si]
 485:	75 63                	jne    4ea <sysEnter_Vector-0x12fb16>
 487:	5f                   	pop    edi
 488:	76 61                	jbe    4eb <sysEnter_Vector-0x12fb15>
 48a:	5f                   	pop    edi
 48b:	6c                   	ins    BYTE PTR es:[edi],dx
 48c:	69 73 74 00 70 72 69 	imul   esi,DWORD PTR [ebx+0x74],0x69727000
 493:	6e                   	outs   dx,BYTE PTR ds:[esi]
 494:	74 64                	je     4fa <sysEnter_Vector-0x12fb06>
 496:	49                   	dec    ecx
 497:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 49a:	72 61                	jb     4fd <sysEnter_Vector-0x12fb03>
 49c:	6d                   	ins    DWORD PTR es:[edi],dx
 49d:	31 00                	xor    DWORD PTR [eax],eax
 49f:	70 61                	jo     502 <sysEnter_Vector-0x12fafe>
 4a1:	72 61                	jb     504 <sysEnter_Vector-0x12fafc>
 4a3:	6d                   	ins    DWORD PTR es:[edi],dx
 4a4:	32 00                	xor    al,BYTE PTR [eax]
 4a6:	70 61                	jo     509 <sysEnter_Vector-0x12faf7>
 4a8:	72 61                	jb     50b <sysEnter_Vector-0x12faf5>
 4aa:	6d                   	ins    DWORD PTR es:[edi],dx
 4ab:	33 00                	xor    eax,DWORD PTR [eax]
 4ad:	66 6f                	outs   dx,WORD PTR ds:[esi]
 4af:	72 6d                	jb     51e <sysEnter_Vector-0x12fae2>
 4b1:	61                   	popa   
 4b2:	74 00                	je     4b4 <sysEnter_Vector-0x12fb4c>
 4b4:	74 6d                	je     523 <sysEnter_Vector-0x12fadd>
 4b6:	5f                   	pop    edi
 4b7:	67 6d                	ins    DWORD PTR es:[di],dx
 4b9:	74 6f                	je     52a <sysEnter_Vector-0x12fad6>
 4bb:	66                   	data16
 4bc:	66                   	data16
 4bd:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 4c0:	67 6e                	outs   dx,BYTE PTR ds:[si]
 4c2:	61                   	popa   
 4c3:	6c                   	ins    BYTE PTR es:[edi],dx
 4c4:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 4c7:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 4ca:	5f                   	pop    edi
 4cb:	5f                   	pop    edi
 4cc:	73 65                	jae    533 <sysEnter_Vector-0x12facd>
 4ce:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 4d1:	64                   	fs
 4d2:	73 00                	jae    4d4 <sysEnter_Vector-0x12fb2c>
 4d4:	73 72                	jae    548 <sysEnter_Vector-0x12fab8>
 4d6:	63 2f                	arpl   WORD PTR [edi],bp
 4d8:	6c                   	ins    BYTE PTR es:[edi],dx
 4d9:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 4e0:	4f                   	dec    edi
 4e1:	53                   	push   ebx
 4e2:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 4e5:	61                   	popa   
 4e6:	72 67                	jb     54f <sysEnter_Vector-0x12fab1>
 4e8:	63 00                	arpl   WORD PTR [eax],ax
 4ea:	74 6d                	je     559 <sysEnter_Vector-0x12faa7>
 4ec:	5f                   	pop    edi
 4ed:	77 64                	ja     553 <sysEnter_Vector-0x12faad>
 4ef:	61                   	popa   
 4f0:	79 00                	jns    4f2 <sysEnter_Vector-0x12fb0e>
 4f2:	74 6d                	je     561 <sysEnter_Vector-0x12fa9f>
 4f4:	5f                   	pop    edi
 4f5:	6d                   	ins    DWORD PTR es:[edi],dx
 4f6:	64                   	fs
 4f7:	61                   	popa   
 4f8:	79 00                	jns    4fa <sysEnter_Vector-0x12fb06>
 4fa:	6c                   	ins    BYTE PTR es:[edi],dx
 4fb:	69 62 63 5f 63 6c 65 	imul   esp,DWORD PTR [edx+0x63],0x656c635f
 502:	61                   	popa   
 503:	6e                   	outs   dx,BYTE PTR ds:[esi]
 504:	75 70                	jne    576 <sysEnter_Vector-0x12fa8a>
 506:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 50a:	73 65                	jae    571 <sysEnter_Vector-0x12fa8f>
 50c:	63 00                	arpl   WORD PTR [eax],ax
 50e:	61                   	popa   
 50f:	72 67                	jb     578 <sysEnter_Vector-0x12fa88>
 511:	76 00                	jbe    513 <sysEnter_Vector-0x12faed>
 513:	73 69                	jae    57e <sysEnter_Vector-0x12fa82>
 515:	67 48                	addr16 dec eax
 517:	61                   	popa   
 518:	6e                   	outs   dx,BYTE PTR ds:[esi]
 519:	64                   	fs
 51a:	6c                   	ins    BYTE PTR es:[edi],dx
 51b:	65                   	gs
 51c:	72 00                	jb     51e <sysEnter_Vector-0x12fae2>
 51e:	6d                   	ins    DWORD PTR es:[edi],dx
 51f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 520:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
 527:	6e 
 528:	61                   	popa   
 529:	6c                   	ins    BYTE PTR es:[edi],dx
 52a:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 52d:	67 73 00             	addr16 jae 530 <sysEnter_Vector-0x12fad0>
 530:	70 72                	jo     5a4 <sysEnter_Vector-0x12fa5c>
 532:	69 6e 74 49 00 73 74 	imul   ebp,DWORD PTR [esi+0x74],0x74730049
 539:	6f                   	outs   dx,DWORD PTR ds:[esi]
 53a:	70 00                	jo     53c <sysEnter_Vector-0x12fac4>
 53c:	67                   	addr16
 53d:	65                   	gs
 53e:	74 63                	je     5a3 <sysEnter_Vector-0x12fa5d>
 540:	77 64                	ja     5a6 <sysEnter_Vector-0x12fa5a>
 542:	00 61 6c             	add    BYTE PTR [ecx+0x6c],ah
 545:	6c                   	ins    BYTE PTR es:[edi],dx
 546:	6f                   	outs   dx,DWORD PTR ds:[esi]
 547:	63 61 74             	arpl   WORD PTR [ecx+0x74],sp
 54a:	65                   	gs
 54b:	64                   	fs
 54c:	50                   	push   eax
 54d:	74 72                	je     5c1 <sysEnter_Vector-0x12fa3f>
 54f:	00 66 70             	add    BYTE PTR [esi+0x70],ah
 552:	6f                   	outs   dx,DWORD PTR ds:[esi]
 553:	69 6e 74 65 72 00 6e 	imul   ebp,DWORD PTR [esi+0x74],0x6e007265
 55a:	65                   	gs
 55b:	77 53                	ja     5b0 <sysEnter_Vector-0x12fa50>
 55d:	69 7a 65 00 6d 61 6c 	imul   edi,DWORD PTR [edx+0x65],0x6c616d00
 564:	6c                   	ins    BYTE PTR es:[edi],dx
 565:	6f                   	outs   dx,DWORD PTR ds:[esi]
 566:	63 5f 63             	arpl   WORD PTR [edi+0x63],bx
 569:	6c                   	ins    BYTE PTR es:[edi],dx
 56a:	65                   	gs
 56b:	61                   	popa   
 56c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 56d:	75 70                	jne    5df <sysEnter_Vector-0x12fa21>
 56f:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 572:	72 6b                	jb     5df <sysEnter_Vector-0x12fa21>
 574:	65                   	gs
 575:	72 00                	jb     577 <sysEnter_Vector-0x12fa89>
 577:	75 69                	jne    5e2 <sysEnter_Vector-0x12fa1e>
 579:	6e                   	outs   dx,BYTE PTR ds:[esi]
 57a:	74 38                	je     5b4 <sysEnter_Vector-0x12fa4c>
 57c:	5f                   	pop    edi
 57d:	74 00                	je     57f <sysEnter_Vector-0x12fa81>
 57f:	66                   	data16
 580:	72 65                	jb     5e7 <sysEnter_Vector-0x12fa19>
 582:	65 00 68 65          	add    BYTE PTR gs:[eax+0x65],ch
 586:	61                   	popa   
 587:	70 50                	jo     5d9 <sysEnter_Vector-0x12fa27>
 589:	74 72                	je     5fd <sysEnter_Vector-0x12fa03>
 58b:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 58e:	65 64 65 64 00 73 68 	gs fs gs add BYTE PTR fs:gs:[ebx+0x68],dh
 595:	65                   	gs
 596:	61                   	popa   
 597:	70 00                	jo     599 <sysEnter_Vector-0x12fa67>
 599:	69 6e 55 73 65 00 69 	imul   ebp,DWORD PTR [esi+0x55],0x69006573
 5a0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5a1:	69 74 6d 61 6c 6c 6f 	imul   esi,DWORD PTR [ebp+ebp*2+0x61],0x636f6c6c
 5a8:	63 
 5a9:	00 67 6f             	add    BYTE PTR [edi+0x6f],ah
 5ac:	74 6f                	je     61d <sysEnter_Vector-0x12f9e3>
 5ae:	48                   	dec    eax
 5af:	65                   	gs
 5b0:	72 65                	jb     617 <sysEnter_Vector-0x12f9e9>
 5b2:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 5b5:	61                   	popa   
 5b6:	70 50                	jo     608 <sysEnter_Vector-0x12f9f8>
 5b8:	74 72                	je     62c <sysEnter_Vector-0x12f9d4>
 5ba:	4e                   	dec    esi
 5bb:	65                   	gs
 5bc:	78 74                	js     632 <sysEnter_Vector-0x12f9ce>
 5be:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 5c1:	77 48                	ja     60b <sysEnter_Vector-0x12f9f5>
 5c3:	65                   	gs
 5c4:	61                   	popa   
 5c5:	70 52                	jo     619 <sysEnter_Vector-0x12f9e7>
 5c7:	65                   	gs
 5c8:	71 75                	jno    63f <sysEnter_Vector-0x12f9c1>
 5ca:	69 72 65 64 54 6f 46 	imul   esi,DWORD PTR [edx+0x65],0x466f5464
 5d1:	75 6c                	jne    63f <sysEnter_Vector-0x12f9c1>
 5d3:	66 69 6c 6c 52 65 71 	imul   bp,WORD PTR [esp+ebp*2+0x52],0x7165
 5da:	75 65                	jne    641 <sysEnter_Vector-0x12f9bf>
 5dc:	73 74                	jae    652 <sysEnter_Vector-0x12f9ae>
 5de:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 5e1:	63 2f                	arpl   WORD PTR [edi],bp
 5e3:	6d                   	ins    DWORD PTR es:[edi],dx
 5e4:	61                   	popa   
 5e5:	6c                   	ins    BYTE PTR es:[edi],dx
 5e6:	6c                   	ins    BYTE PTR es:[edi],dx
 5e7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5e8:	63 2e                	arpl   WORD PTR [esi],bp
 5ea:	63 00                	arpl   WORD PTR [eax],ax
 5ec:	70 72                	jo     660 <sysEnter_Vector-0x12f9a0>
 5ee:	65                   	gs
 5ef:	76 00                	jbe    5f1 <sysEnter_Vector-0x12fa0f>
 5f1:	68 65 61 70 72       	push   0x72706165
 5f6:	65 63 5f 74          	arpl   WORD PTR gs:[edi+0x74],bx
 5fa:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 5fd:	63 2f                	arpl   WORD PTR [edi],bp
 5ff:	6d                   	ins    DWORD PTR es:[edi],dx
 600:	65                   	gs
 601:	6d                   	ins    DWORD PTR es:[edi],dx
 602:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 605:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 608:	64                   	fs
 609:	65                   	gs
 60a:	73 74                	jae    680 <sysEnter_Vector-0x12f980>
 60c:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 60f:	6d                   	ins    DWORD PTR es:[edi],dx
 610:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 613:	00 65 56             	add    BYTE PTR [ebp+0x56],ah
 616:	61                   	popa   
 617:	6c                   	ins    BYTE PTR es:[edi],dx
 618:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 61b:	6d                   	ins    DWORD PTR es:[edi],dx
 61c:	73 65                	jae    683 <sysEnter_Vector-0x12f97d>
 61e:	74 00                	je     620 <sysEnter_Vector-0x12f9e0>
 620:	73 72                	jae    694 <sysEnter_Vector-0x12f96c>
 622:	63 2f                	arpl   WORD PTR [edi],bp
 624:	6d                   	ins    DWORD PTR es:[edi],dx
 625:	65                   	gs
 626:	6d                   	ins    DWORD PTR es:[edi],dx
 627:	73 65                	jae    68e <sysEnter_Vector-0x12f972>
 629:	74 2e                	je     659 <sysEnter_Vector-0x12f9a7>
 62b:	63 00                	arpl   WORD PTR [eax],ax
 62d:	66 56                	push   si
 62f:	61                   	popa   
 630:	6c                   	ins    BYTE PTR es:[edi],dx
 631:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 634:	6d                   	ins    DWORD PTR es:[edi],dx
 635:	73 65                	jae    69c <sysEnter_Vector-0x12f964>
 637:	74 49                	je     682 <sysEnter_Vector-0x12f97e>
 639:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 63c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 63d:	74 31                	je     670 <sysEnter_Vector-0x12f990>
 63f:	36                   	ss
 640:	5f                   	pop    edi
 641:	74 00                	je     643 <sysEnter_Vector-0x12f9bd>
 643:	61                   	popa   
 644:	64                   	fs
 645:	64                   	fs
 646:	72 00                	jb     648 <sysEnter_Vector-0x12f9b8>
 648:	6f                   	outs   dx,DWORD PTR ds:[esi]
 649:	66 66 5f             	data32 pop di
 64c:	74 00                	je     64e <sysEnter_Vector-0x12f9b2>
 64e:	70 72                	jo     6c2 <sysEnter_Vector-0x12f93e>
 650:	6f                   	outs   dx,DWORD PTR ds:[esi]
 651:	74 00                	je     653 <sysEnter_Vector-0x12f9ad>
 653:	6f                   	outs   dx,DWORD PTR ds:[esi]
 654:	66                   	data16
 655:	66                   	data16
 656:	73 65                	jae    6bd <sysEnter_Vector-0x12f943>
 658:	74 00                	je     65a <sysEnter_Vector-0x12f9a6>
 65a:	6d                   	ins    DWORD PTR es:[edi],dx
 65b:	6d                   	ins    DWORD PTR es:[edi],dx
 65c:	61                   	popa   
 65d:	70 00                	jo     65f <sysEnter_Vector-0x12f9a1>
 65f:	73 72                	jae    6d3 <sysEnter_Vector-0x12f92d>
 661:	63 2f                	arpl   WORD PTR [edi],bp
 663:	6d                   	ins    DWORD PTR es:[edi],dx
 664:	6d                   	ins    DWORD PTR es:[edi],dx
 665:	61                   	popa   
 666:	70 2e                	jo     696 <sysEnter_Vector-0x12f96a>
 668:	63 00                	arpl   WORD PTR [eax],ax
 66a:	73 5f                	jae    6cb <sysEnter_Vector-0x12f935>
 66c:	64                   	fs
 66d:	65                   	gs
 66e:	76 00                	jbe    670 <sysEnter_Vector-0x12f990>
 670:	75 69                	jne    6db <sysEnter_Vector-0x12f925>
 672:	6e                   	outs   dx,BYTE PTR ds:[esi]
 673:	74 36                	je     6ab <sysEnter_Vector-0x12f955>
 675:	34 5f                	xor    al,0x5f
 677:	74 00                	je     679 <sysEnter_Vector-0x12f987>
 679:	6d                   	ins    DWORD PTR es:[edi],dx
 67a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 67b:	74 5f                	je     6dc <sysEnter_Vector-0x12f924>
 67d:	66                   	data16
 67e:	6c                   	ins    BYTE PTR es:[edi],dx
 67f:	61                   	popa   
 680:	67 73 00             	addr16 jae 683 <sysEnter_Vector-0x12f97d>
 683:	63 6f 6c             	arpl   WORD PTR [edi+0x6c],bp
 686:	53                   	push   ebx
 687:	74 72                	je     6fb <sysEnter_Vector-0x12f905>
 689:	69 6e 67 00 6d 6b 6e 	imul   ebp,DWORD PTR [esi+0x67],0x6e6b6d00
 690:	6f                   	outs   dx,DWORD PTR ds:[esi]
 691:	64 00 6e 65          	add    BYTE PTR fs:[esi+0x65],ch
 695:	78 74                	js     70b <sysEnter_Vector-0x12f8f5>
 697:	00 6d 6b             	add    BYTE PTR [ebp+0x6b],ch
 69a:	64 69 72 00 62 75 66 	imul   esi,DWORD PTR fs:[edx+0x0],0x66667562
 6a1:	66 
 6a2:	00 6d 6e             	add    BYTE PTR [ebp+0x6e],ch
 6a5:	74 5f                	je     706 <sysEnter_Vector-0x12f8fa>
 6a7:	73 62                	jae    70b <sysEnter_Vector-0x12f8f5>
 6a9:	00 73 5f             	add    BYTE PTR [ebx+0x5f],dh
 6ac:	6c                   	ins    BYTE PTR es:[edi],dx
 6ad:	69 73 74 00 73 75 70 	imul   esi,DWORD PTR [ebx+0x74],0x70757300
 6b4:	65                   	gs
 6b5:	72 5f                	jb     716 <sysEnter_Vector-0x12f8ea>
 6b7:	62 6c 6f 63          	bound  ebp,QWORD PTR [edi+ebp*2+0x63]
 6bb:	6b 00 69             	imul   eax,DWORD PTR [eax],0x69
 6be:	5f                   	pop    edi
 6bf:	76 66                	jbe    727 <sysEnter_Vector-0x12f8d9>
 6c1:	73 6d                	jae    730 <sysEnter_Vector-0x12f8d0>
 6c3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6c4:	75 6e                	jne    734 <sysEnter_Vector-0x12f8cc>
 6c6:	74 00                	je     6c8 <sysEnter_Vector-0x12f938>
 6c8:	72 65                	jb     72f <sysEnter_Vector-0x12f8d1>
 6ca:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6cb:	61                   	popa   
 6cc:	6d                   	ins    DWORD PTR es:[edi],dx
 6cd:	65 00 64 5f 6e       	add    BYTE PTR gs:[edi+ebx*2+0x6e],ah
 6d2:	61                   	popa   
 6d3:	6d                   	ins    DWORD PTR es:[edi],dx
 6d4:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 6d8:	63 2f                	arpl   WORD PTR [edi],bp
 6da:	73 74                	jae    750 <sysEnter_Vector-0x12f8b0>
 6dc:	64 69 6f 2e 63 00 64 	imul   ebp,DWORD PTR fs:[edi+0x2e],0x65640063
 6e3:	65 
 6e4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6e5:	74 72                	je     759 <sysEnter_Vector-0x12f8a7>
 6e7:	79 00                	jns    6e9 <sysEnter_Vector-0x12f917>
 6e9:	66 69 6c 65 5f 6f 70 	imul   bp,WORD PTR [ebp+eiz*2+0x5f],0x706f
 6f0:	65                   	gs
 6f1:	72 61                	jb     754 <sysEnter_Vector-0x12f8ac>
 6f3:	74 69                	je     75e <sysEnter_Vector-0x12f8a2>
 6f5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 6f6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6f7:	73 00                	jae    6f9 <sysEnter_Vector-0x12f907>
 6f9:	72 6d                	jb     768 <sysEnter_Vector-0x12f898>
 6fb:	64 69 72 00 69 5f 67 	imul   esi,DWORD PTR fs:[edx+0x0],0x69675f69
 702:	69 
 703:	64 00 64 6c 6c       	add    BYTE PTR fs:[esp+ebp*2+0x6c],ah
 708:	69 73 74 5f 74 00 72 	imul   esi,DWORD PTR [ebx+0x74],0x7200745f
 70f:	65                   	gs
 710:	61                   	popa   
 711:	64                   	fs
 712:	43                   	inc    ebx
 713:	6f                   	outs   dx,DWORD PTR ds:[esi]
 714:	6e                   	outs   dx,BYTE PTR ds:[esi]
 715:	73 6f                	jae    786 <sysEnter_Vector-0x12f87a>
 717:	6c                   	ins    BYTE PTR es:[edi],dx
 718:	65 00 69 6e          	add    BYTE PTR gs:[ecx+0x6e],ch
 71c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 71d:	64                   	fs
 71e:	65                   	gs
 71f:	5f                   	pop    edi
 720:	6f                   	outs   dx,DWORD PTR ds:[esi]
 721:	70 65                	jo     788 <sysEnter_Vector-0x12f878>
 723:	72 61                	jb     786 <sysEnter_Vector-0x12f87a>
 725:	74 69                	je     790 <sysEnter_Vector-0x12f870>
 727:	6f                   	outs   dx,DWORD PTR ds:[esi]
 728:	6e                   	outs   dx,BYTE PTR ds:[esi]
 729:	73 00                	jae    72b <sysEnter_Vector-0x12f8d5>
 72b:	69 5f 6f 70 66 6c 61 	imul   ebx,DWORD PTR [edi+0x6f],0x616c6670
 732:	67 73 00             	addr16 jae 735 <sysEnter_Vector-0x12f8cb>
 735:	66 69 6c 65 5f 6f 70 	imul   bp,WORD PTR [ebp+eiz*2+0x5f],0x706f
 73c:	65                   	gs
 73d:	72 61                	jb     7a0 <sysEnter_Vector-0x12f860>
 73f:	74 69                	je     7aa <sysEnter_Vector-0x12f856>
 741:	6f                   	outs   dx,DWORD PTR ds:[esi]
 742:	6e                   	outs   dx,BYTE PTR ds:[esi]
 743:	73 5f                	jae    7a4 <sysEnter_Vector-0x12f85c>
 745:	74 00                	je     747 <sysEnter_Vector-0x12f8b9>
 747:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 74a:	66 50                	push   ax
 74c:	74 72                	je     7c0 <sysEnter_Vector-0x12f840>
 74e:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 751:	64                   	fs
 752:	65                   	gs
 753:	76 00                	jbe    755 <sysEnter_Vector-0x12f8ab>
 755:	6d                   	ins    DWORD PTR es:[edi],dx
 756:	6f                   	outs   dx,DWORD PTR ds:[esi]
 757:	76 65                	jbe    7be <sysEnter_Vector-0x12f842>
 759:	54                   	push   esp
 75a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 75b:	00 77 72             	add    BYTE PTR [edi+0x72],dh
 75e:	69 74 65 00 66 70 74 	imul   esi,DWORD PTR [ebp+eiz*2+0x0],0x72747066
 765:	72 
 766:	00 77 72             	add    BYTE PTR [edi+0x72],dh
 769:	69 74 65 43 6f 6e 73 	imul   esi,DWORD PTR [ebp+eiz*2+0x43],0x6f736e6f
 770:	6f 
 771:	6c                   	ins    BYTE PTR es:[edi],dx
 772:	65 00 70 61          	add    BYTE PTR gs:[eax+0x61],dh
 776:	79 6c                	jns    7e4 <sysEnter_Vector-0x12f81c>
 778:	6f                   	outs   dx,DWORD PTR ds:[esi]
 779:	61                   	popa   
 77a:	64 00 73 6c          	add    BYTE PTR fs:[ebx+0x6c],dh
 77e:	69 73 74 68 65 61 64 	imul   esi,DWORD PTR [ebx+0x74],0x64616568
 785:	00 69 5f             	add    BYTE PTR [ecx+0x5f],ch
 788:	6f                   	outs   dx,DWORD PTR ds:[esi]
 789:	70 00                	jo     78b <sysEnter_Vector-0x12f875>
 78b:	6d                   	ins    DWORD PTR es:[edi],dx
 78c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 78d:	74 5f                	je     7ee <sysEnter_Vector-0x12f812>
 78f:	72 6f                	jb     800 <sysEnter_Vector-0x12f800>
 791:	6f                   	outs   dx,DWORD PTR ds:[esi]
 792:	74 00                	je     794 <sysEnter_Vector-0x12f86c>
 794:	69 6f 49 6e 69 74 00 	imul   ebp,DWORD PTR [edi+0x49],0x74696e
 79b:	66 6f                	outs   dx,WORD PTR ds:[esi]
 79d:	70 73                	jo     812 <sysEnter_Vector-0x12f7ee>
 79f:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 7a2:	6c                   	ins    BYTE PTR es:[edi],dx
 7a3:	65                   	gs
 7a4:	5f                   	pop    edi
 7a5:	74 00                	je     7a7 <sysEnter_Vector-0x12f859>
 7a7:	69 5f 66 6c 61 67 73 	imul   ebx,DWORD PTR [edi+0x66],0x7367616c
 7ae:	00 77 68             	add    BYTE PTR [edi+0x68],dh
 7b1:	61                   	popa   
 7b2:	74 65                	je     819 <sysEnter_Vector-0x12f7e7>
 7b4:	76 65                	jbe    81b <sysEnter_Vector-0x12f7e5>
 7b6:	72 00                	jb     7b8 <sysEnter_Vector-0x12f848>
 7b8:	69 5f 75 69 64 00 69 	imul   ebx,DWORD PTR [edi+0x75],0x69006469
 7bf:	5f                   	pop    edi
 7c0:	6d                   	ins    DWORD PTR es:[edi],dx
 7c1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 7c2:	64 65 00 63 6f       	fs add BYTE PTR fs:gs:[ebx+0x6f],ah
 7c7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7c8:	73 6f                	jae    839 <sysEnter_Vector-0x12f7c7>
 7ca:	6c                   	ins    BYTE PTR es:[edi],dx
 7cb:	65                   	gs
 7cc:	5f                   	pop    edi
 7cd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 7ce:	6f                   	outs   dx,DWORD PTR ds:[esi]
 7cf:	64 65 00 69 6e       	fs add BYTE PTR fs:gs:[ecx+0x6e],ch
 7d4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 7d5:	64                   	fs
 7d6:	65                   	gs
 7d7:	5f                   	pop    edi
 7d8:	74 00                	je     7da <sysEnter_Vector-0x12f826>
 7da:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 7dd:	73 6f                	jae    84e <sysEnter_Vector-0x12f7b2>
 7df:	6c                   	ins    BYTE PTR es:[edi],dx
 7e0:	65                   	gs
 7e1:	5f                   	pop    edi
 7e2:	66 69 6c 65 00 73 5f 	imul   bp,WORD PTR [ebp+eiz*2+0x0],0x5f73
 7e9:	72 6f                	jb     85a <sysEnter_Vector-0x12f7a6>
 7eb:	6f                   	outs   dx,DWORD PTR ds:[esi]
 7ec:	74 00                	je     7ee <sysEnter_Vector-0x12f812>
 7ee:	64                   	fs
 7ef:	5f                   	pop    edi
 7f0:	69 6e 6f 64 65 00 72 	imul   ebp,DWORD PTR [esi+0x6f],0x72006564
 7f7:	65                   	gs
 7f8:	61                   	popa   
 7f9:	64 00 72 65          	add    BYTE PTR fs:[edx+0x65],dh
 7fd:	73 65                	jae    864 <sysEnter_Vector-0x12f79c>
 7ff:	74 52                	je     853 <sysEnter_Vector-0x12f7ad>
 801:	6f                   	outs   dx,DWORD PTR ds:[esi]
 802:	77 00                	ja     804 <sysEnter_Vector-0x12f7fc>
 804:	64                   	fs
 805:	5f                   	pop    edi
 806:	70 61                	jo     869 <sysEnter_Vector-0x12f797>
 808:	72 65                	jb     86f <sysEnter_Vector-0x12f791>
 80a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 80b:	74 00                	je     80d <sysEnter_Vector-0x12f7f3>
 80d:	66 5f                	pop    di
 80f:	69 6e 6f 64 65 00 66 	imul   ebp,DWORD PTR [esi+0x6f],0x66006564
 816:	5f                   	pop    edi
 817:	70 61                	jo     87a <sysEnter_Vector-0x12f786>
 819:	74 68                	je     883 <sysEnter_Vector-0x12f77d>
 81b:	00 72 6f             	add    BYTE PTR [edx+0x6f],dh
 81e:	77 53                	ja     873 <sysEnter_Vector-0x12f78d>
 820:	74 72                	je     894 <sysEnter_Vector-0x12f76c>
 822:	69 6e 67 00 63 72 65 	imul   ebp,DWORD PTR [esi+0x67],0x65726300
 829:	61                   	popa   
 82a:	74 65                	je     891 <sysEnter_Vector-0x12f76f>
 82c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 82f:	72 63                	jb     894 <sysEnter_Vector-0x12f76c>
 831:	61                   	popa   
 832:	74 00                	je     834 <sysEnter_Vector-0x12f7cc>
 834:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 837:	63 61 74             	arpl   WORD PTR [ecx+0x74],sp
 83a:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 83c:	61                   	popa   
 83d:	74 65                	je     8a4 <sysEnter_Vector-0x12f75c>
 83f:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 842:	63 2f                	arpl   WORD PTR [edi],bp
 844:	73 74                	jae    8ba <sysEnter_Vector-0x12f746>
 846:	72 69                	jb     8b1 <sysEnter_Vector-0x12f74f>
 848:	6e                   	outs   dx,BYTE PTR ds:[esi]
 849:	67 73 2f             	addr16 jae 87b <sysEnter_Vector-0x12f785>
 84c:	73 74                	jae    8c2 <sysEnter_Vector-0x12f73e>
 84e:	72 63                	jb     8b3 <sysEnter_Vector-0x12f74d>
 850:	61                   	popa   
 851:	74 2e                	je     881 <sysEnter_Vector-0x12f77f>
 853:	63 00                	arpl   WORD PTR [eax],ax
 855:	73 74                	jae    8cb <sysEnter_Vector-0x12f735>
 857:	72 63                	jb     8bc <sysEnter_Vector-0x12f744>
 859:	6d                   	ins    DWORD PTR es:[edi],dx
 85a:	70 00                	jo     85c <sysEnter_Vector-0x12f7a4>
 85c:	73 72                	jae    8d0 <sysEnter_Vector-0x12f730>
 85e:	63 2f                	arpl   WORD PTR [edi],bp
 860:	73 74                	jae    8d6 <sysEnter_Vector-0x12f72a>
 862:	72 69                	jb     8cd <sysEnter_Vector-0x12f733>
 864:	6e                   	outs   dx,BYTE PTR ds:[esi]
 865:	67 73 2f             	addr16 jae 897 <sysEnter_Vector-0x12f769>
 868:	73 74                	jae    8de <sysEnter_Vector-0x12f722>
 86a:	72 63                	jb     8cf <sysEnter_Vector-0x12f731>
 86c:	6d                   	ins    DWORD PTR es:[edi],dx
 86d:	70 2e                	jo     89d <sysEnter_Vector-0x12f763>
 86f:	63 00                	arpl   WORD PTR [eax],ax
 871:	73 74                	jae    8e7 <sysEnter_Vector-0x12f719>
 873:	72 63                	jb     8d8 <sysEnter_Vector-0x12f728>
 875:	70 79                	jo     8f0 <sysEnter_Vector-0x12f710>
 877:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 87a:	75 6e                	jne    8ea <sysEnter_Vector-0x12f716>
 87c:	74 00                	je     87e <sysEnter_Vector-0x12f782>
 87e:	73 74                	jae    8f4 <sysEnter_Vector-0x12f70c>
 880:	72 63                	jb     8e5 <sysEnter_Vector-0x12f71b>
 882:	70 79                	jo     8fd <sysEnter_Vector-0x12f703>
 884:	63 00                	arpl   WORD PTR [eax],ax
 886:	73 72                	jae    8fa <sysEnter_Vector-0x12f706>
 888:	63 2f                	arpl   WORD PTR [edi],bp
 88a:	73 74                	jae    900 <sysEnter_Vector-0x12f700>
 88c:	72 69                	jb     8f7 <sysEnter_Vector-0x12f709>
 88e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 88f:	67 73 2f             	addr16 jae 8c1 <sysEnter_Vector-0x12f73f>
 892:	73 74                	jae    908 <sysEnter_Vector-0x12f6f8>
 894:	72 63                	jb     8f9 <sysEnter_Vector-0x12f707>
 896:	70 79                	jo     911 <sysEnter_Vector-0x12f6ef>
 898:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 89b:	73 74                	jae    911 <sysEnter_Vector-0x12f6ef>
 89d:	72 6c                	jb     90b <sysEnter_Vector-0x12f6f5>
 89f:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 8a1:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 8a4:	63 2f                	arpl   WORD PTR [edi],bp
 8a6:	73 74                	jae    91c <sysEnter_Vector-0x12f6e4>
 8a8:	72 69                	jb     913 <sysEnter_Vector-0x12f6ed>
 8aa:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8ab:	67 73 2f             	addr16 jae 8dd <sysEnter_Vector-0x12f723>
 8ae:	73 74                	jae    924 <sysEnter_Vector-0x12f6dc>
 8b0:	72 6c                	jb     91e <sysEnter_Vector-0x12f6e2>
 8b2:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 8b4:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8b7:	73 74                	jae    92d <sysEnter_Vector-0x12f6d3>
 8b9:	72 6e                	jb     929 <sysEnter_Vector-0x12f6d7>
 8bb:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 8be:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 8c1:	63 2f                	arpl   WORD PTR [edi],bp
 8c3:	73 74                	jae    939 <sysEnter_Vector-0x12f6c7>
 8c5:	72 69                	jb     930 <sysEnter_Vector-0x12f6d0>
 8c7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8c8:	67 73 2f             	addr16 jae 8fa <sysEnter_Vector-0x12f706>
 8cb:	73 74                	jae    941 <sysEnter_Vector-0x12f6bf>
 8cd:	72 6e                	jb     93d <sysEnter_Vector-0x12f6c3>
 8cf:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 8d2:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8d5:	73 72                	jae    949 <sysEnter_Vector-0x12f6b7>
 8d7:	63 2f                	arpl   WORD PTR [edi],bp
 8d9:	73 74                	jae    94f <sysEnter_Vector-0x12f6b1>
 8db:	72 69                	jb     946 <sysEnter_Vector-0x12f6ba>
 8dd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8de:	67 73 2f             	addr16 jae 910 <sysEnter_Vector-0x12f6f0>
 8e1:	73 74                	jae    957 <sysEnter_Vector-0x12f6a9>
 8e3:	72 6e                	jb     953 <sysEnter_Vector-0x12f6ad>
 8e5:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 8e8:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 8eb:	73 74                	jae    961 <sysEnter_Vector-0x12f69f>
 8ed:	72 6e                	jb     95d <sysEnter_Vector-0x12f6a3>
 8ef:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 8f2:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 8f5:	63 2f                	arpl   WORD PTR [edi],bp
 8f7:	73 74                	jae    96d <sysEnter_Vector-0x12f693>
 8f9:	72 69                	jb     964 <sysEnter_Vector-0x12f69c>
 8fb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8fc:	67 73 2f             	addr16 jae 92e <sysEnter_Vector-0x12f6d2>
 8ff:	73 74                	jae    975 <sysEnter_Vector-0x12f68b>
 901:	72 6f                	jb     972 <sysEnter_Vector-0x12f68e>
 903:	75 6c                	jne    971 <sysEnter_Vector-0x12f68f>
 905:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 908:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 90b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 90c:	66                   	data16
 90d:	66                   	data16
 90e:	00 63 75             	add    BYTE PTR [ebx+0x75],ah
 911:	74 6c                	je     97f <sysEnter_Vector-0x12f681>
 913:	69 6d 00 73 74 72 74 	imul   ebp,DWORD PTR [ebp+0x0],0x74727473
 91a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 91b:	75 6c                	jne    989 <sysEnter_Vector-0x12f677>
 91d:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 920:	64                   	fs
 921:	70 74                	jo     997 <sysEnter_Vector-0x12f669>
 923:	72 00                	jb     925 <sysEnter_Vector-0x12f6db>
 925:	6e                   	outs   dx,BYTE PTR ds:[esi]
 926:	70 74                	jo     99c <sysEnter_Vector-0x12f664>
 928:	72 00                	jb     92a <sysEnter_Vector-0x12f6d6>
 92a:	62 61 73             	bound  esp,QWORD PTR [ecx+0x73]
 92d:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 931:	63 2f                	arpl   WORD PTR [edi],bp
 933:	73 74                	jae    9a9 <sysEnter_Vector-0x12f657>
 935:	72 69                	jb     9a0 <sysEnter_Vector-0x12f660>
 937:	6e                   	outs   dx,BYTE PTR ds:[esi]
 938:	67 73 2f             	addr16 jae 96a <sysEnter_Vector-0x12f696>
 93b:	73 74                	jae    9b1 <sysEnter_Vector-0x12f64f>
 93d:	72 70                	jb     9af <sysEnter_Vector-0x12f651>
 93f:	61                   	popa   
 940:	72 74                	jb     9b6 <sysEnter_Vector-0x12f64a>
 942:	73 2e                	jae    972 <sysEnter_Vector-0x12f68e>
 944:	63 00                	arpl   WORD PTR [eax],ax
 946:	73 74                	jae    9bc <sysEnter_Vector-0x12f644>
 948:	72 6c                	jb     9b6 <sysEnter_Vector-0x12f64a>
 94a:	65                   	gs
 94b:	66                   	data16
 94c:	74 00                	je     94e <sysEnter_Vector-0x12f6b2>
 94e:	73 72                	jae    9c2 <sysEnter_Vector-0x12f63e>
 950:	63 2f                	arpl   WORD PTR [edi],bp
 952:	73 74                	jae    9c8 <sysEnter_Vector-0x12f638>
 954:	72 69                	jb     9bf <sysEnter_Vector-0x12f641>
 956:	6e                   	outs   dx,BYTE PTR ds:[esi]
 957:	67 73 2f             	addr16 jae 989 <sysEnter_Vector-0x12f677>
 95a:	73 74                	jae    9d0 <sysEnter_Vector-0x12f630>
 95c:	72 74                	jb     9d2 <sysEnter_Vector-0x12f62e>
 95e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 95f:	6c                   	ins    BYTE PTR es:[edi],dx
 960:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 963:	73 74                	jae    9d9 <sysEnter_Vector-0x12f627>
 965:	72 74                	jb     9db <sysEnter_Vector-0x12f625>
 967:	6f                   	outs   dx,DWORD PTR ds:[esi]
 968:	6c                   	ins    BYTE PTR es:[edi],dx
 969:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 96c:	70 75                	jo     9e3 <sysEnter_Vector-0x12f61d>
 96e:	74 00                	je     970 <sysEnter_Vector-0x12f690>
 970:	73 72                	jae    9e4 <sysEnter_Vector-0x12f61c>
 972:	63 2f                	arpl   WORD PTR [edi],bp
 974:	73 74                	jae    9ea <sysEnter_Vector-0x12f616>
 976:	72 69                	jb     9e1 <sysEnter_Vector-0x12f61f>
 978:	6e                   	outs   dx,BYTE PTR ds:[esi]
 979:	67 73 2f             	addr16 jae 9ab <sysEnter_Vector-0x12f655>
 97c:	73 74                	jae    9f2 <sysEnter_Vector-0x12f60e>
 97e:	72 74                	jb     9f4 <sysEnter_Vector-0x12f60c>
 980:	72 69                	jb     9eb <sysEnter_Vector-0x12f615>
 982:	6d                   	ins    DWORD PTR es:[edi],dx
 983:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 986:	73 74                	jae    9fc <sysEnter_Vector-0x12f604>
 988:	72 74                	jb     9fe <sysEnter_Vector-0x12f602>
 98a:	72 69                	jb     9f5 <sysEnter_Vector-0x12f60b>
 98c:	6d                   	ins    DWORD PTR es:[edi],dx
 98d:	00 6c 6f 63          	add    BYTE PTR [edi+ebp*2+0x63],ch
 991:	61                   	popa   
 992:	6c                   	ins    BYTE PTR es:[edi],dx
 993:	74 69                	je     9fe <sysEnter_Vector-0x12f602>
 995:	6d                   	ins    DWORD PTR es:[edi],dx
 996:	65 00 64 61 79       	add    BYTE PTR gs:[ecx+eiz*2+0x79],ah
 99b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 99c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 99d:	00 5f 64             	add    BYTE PTR [edi+0x64],bl
 9a0:	73 74                	jae    a16 <sysEnter_Vector-0x12f5ea>
 9a2:	62 69 61             	bound  ebp,QWORD PTR [ecx+0x61]
 9a5:	73 00                	jae    9a7 <sysEnter_Vector-0x12f659>
 9a7:	67 6d                	ins    DWORD PTR es:[di],dx
 9a9:	74 69                	je     a14 <sysEnter_Vector-0x12f5ec>
 9ab:	6d                   	ins    DWORD PTR es:[edi],dx
 9ac:	65                   	gs
 9ad:	5f                   	pop    edi
 9ae:	72 00                	jb     9b0 <sysEnter_Vector-0x12f650>
 9b0:	74 69                	je     a1b <sysEnter_Vector-0x12f5e5>
 9b2:	6d                   	ins    DWORD PTR es:[edi],dx
 9b3:	65                   	gs
 9b4:	72 00                	jb     9b6 <sysEnter_Vector-0x12f64a>
 9b6:	6c                   	ins    BYTE PTR es:[edi],dx
 9b7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 9b8:	63 61 6c             	arpl   WORD PTR [ecx+0x6c],sp
 9bb:	74 69                	je     a26 <sysEnter_Vector-0x12f5da>
 9bd:	6d                   	ins    DWORD PTR es:[edi],dx
 9be:	65                   	gs
 9bf:	5f                   	pop    edi
 9c0:	72 00                	jb     9c2 <sysEnter_Vector-0x12f63e>
 9c2:	5f                   	pop    edi
 9c3:	74 7a                	je     a3f <sysEnter_Vector-0x12f5c1>
 9c5:	6e                   	outs   dx,BYTE PTR ds:[esi]
 9c6:	61                   	popa   
 9c7:	6d                   	ins    DWORD PTR es:[edi],dx
 9c8:	65 00 5f 79          	add    BYTE PTR gs:[edi+0x79],bl
 9cc:	74 61                	je     a2f <sysEnter_Vector-0x12f5d1>
 9ce:	62 00                	bound  eax,QWORD PTR [eax]
 9d0:	74 69                	je     a3b <sysEnter_Vector-0x12f5c5>
 9d2:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 9d5:	54                   	push   esp
 9d6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 9d7:	57                   	push   edi
 9d8:	61                   	popa   
 9d9:	69 74 00 6d 6b 74 69 	imul   esi,DWORD PTR [eax+eax*1+0x6d],0x6d69746b
 9e0:	6d 
 9e1:	65 00 64 61 79       	add    BYTE PTR gs:[ecx+eiz*2+0x79],ah
 9e6:	63 6c 6f 63          	arpl   WORD PTR [edi+ebp*2+0x63],bp
 9ea:	6b 00 5f             	imul   eax,DWORD PTR [eax],0x5f
 9ed:	64                   	fs
 9ee:	61                   	popa   
 9ef:	79 6c                	jns    a5d <sysEnter_Vector-0x12f5a3>
 9f1:	69 67 68 74 00 6f 76 	imul   esp,DWORD PTR [edi+0x68],0x766f0074
 9f8:	65                   	gs
 9f9:	72 66                	jb     a61 <sysEnter_Vector-0x12f59f>
 9fb:	6c                   	ins    BYTE PTR es:[edi],dx
 9fc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 9fd:	77 00                	ja     9ff <sysEnter_Vector-0x12f601>
 9ff:	6d                   	ins    DWORD PTR es:[edi],dx
 a00:	6f                   	outs   dx,DWORD PTR ds:[esi]
 a01:	6e                   	outs   dx,BYTE PTR ds:[esi]
 a02:	74 68                	je     a6c <sysEnter_Vector-0x12f594>
 a04:	00 74 6d 62          	add    BYTE PTR [ebp+ebp*2+0x62],dh
 a08:	75 66                	jne    a70 <sysEnter_Vector-0x12f590>
 a0a:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 a0d:	63 2f                	arpl   WORD PTR [edi],bp
 a0f:	74 69                	je     a7a <sysEnter_Vector-0x12f586>
 a11:	6d                   	ins    DWORD PTR es:[edi],dx
 a12:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax

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
