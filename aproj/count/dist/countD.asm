
Debug/GNU-Linux/count:     file format elf32-i386


Disassembly of section .text:

30e00000 <main>:
main():
/home/yogi/src/os/aproj/count/count.c:19
#include <signal.h>

#include "libChrisOS.h"

int main(int argc, char** argv) 
{
30e00000:	8d 4c 24 04          	lea    ecx,[esp+0x4]
30e00004:	83 e4 f0             	and    esp,0xfffffff0
30e00007:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
30e0000a:	55                   	push   ebp
30e0000b:	89 e5                	mov    ebp,esp
30e0000d:	51                   	push   ecx
30e0000e:	83 ec 14             	sub    esp,0x14
30e00011:	89 c8                	mov    eax,ecx
/home/yogi/src/os/aproj/count/count.c:20
    int iReturnValue = 0;
30e00013:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/count/count.c:21
    unsigned int uCountedValue = 0;
30e0001a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/count/count.c:23

    if (argc<2)
30e00021:	83 38 01             	cmp    DWORD PTR [eax],0x1
30e00024:	7f 19                	jg     30e0003f <main+0x3f>
/home/yogi/src/os/aproj/count/count.c:25
    {
        printf("Two arguments must be supplied, the signal to send and the PID of the process, in that order\n");
30e00026:	83 ec 0c             	sub    esp,0xc
30e00029:	68 d0 00 e0 30       	push   0x30e000d0
30e0002e:	e8 7d 00 00 00       	call   30e000b0 <main+0xb0>
30e00033:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/count/count.c:26
        iReturnValue = -1;
30e00036:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
30e0003d:	eb 43                	jmp    30e00082 <main+0x82>
/home/yogi/src/os/aproj/count/count.c:30
    }
    else
    {
        unsigned int uCountTo = atoi(argv[1]);
30e0003f:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30e00042:	83 c0 04             	add    eax,0x4
30e00045:	8b 00                	mov    eax,DWORD PTR [eax]
30e00047:	83 ec 0c             	sub    esp,0xc
30e0004a:	50                   	push   eax
30e0004b:	e8 70 00 00 00       	call   30e000c0 <main+0xc0>
30e00050:	83 c4 10             	add    esp,0x10
30e00053:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/count/count.c:32
        
        printf("Counting to %i\n",uCountTo);
30e00056:	83 ec 08             	sub    esp,0x8
30e00059:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
30e0005c:	68 2e 01 e0 30       	push   0x30e0012e
30e00061:	e8 4a 00 00 00       	call   30e000b0 <main+0xb0>
30e00066:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/count/count.c:33
        for (int cnt=0;cnt<uCountTo;cnt++)
30e00069:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
30e00070:	eb 08                	jmp    30e0007a <main+0x7a>
/home/yogi/src/os/aproj/count/count.c:34 (discriminator 3)
            uCountedValue++;
30e00072:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/count/count.c:33 (discriminator 3)
    else
    {
        unsigned int uCountTo = atoi(argv[1]);
        
        printf("Counting to %i\n",uCountTo);
        for (int cnt=0;cnt<uCountTo;cnt++)
30e00076:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/count/count.c:33 (discriminator 1)
30e0007a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
30e0007d:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
30e00080:	72 f0                	jb     30e00072 <main+0x72>
/home/yogi/src/os/aproj/count/count.c:36
            uCountedValue++;
    }
    printf("Counted to %i\n ",uCountedValue);
30e00082:	83 ec 08             	sub    esp,0x8
30e00085:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
30e00088:	68 3e 01 e0 30       	push   0x30e0013e
30e0008d:	e8 1e 00 00 00       	call   30e000b0 <main+0xb0>
30e00092:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/count/count.c:37
    return iReturnValue;
30e00095:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/src/os/aproj/count/count.c:38
}
30e00098:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
30e0009b:	c9                   	leave  
30e0009c:	8d 61 fc             	lea    esp,[ecx-0x4]
30e0009f:	c3                   	ret    

Disassembly of section .plt:

30e000a0 <.plt>:
30e000a0:	ff 35 20 03 e0 30    	push   DWORD PTR ds:0x30e00320
30e000a6:	ff 25 24 03 e0 30    	jmp    DWORD PTR ds:0x30e00324
30e000ac:	00 00                	add    BYTE PTR [eax],al
30e000ae:	00 00                	add    BYTE PTR [eax],al
30e000b0:	ff 25 28 03 e0 30    	jmp    DWORD PTR ds:0x30e00328
30e000b6:	68 00 00 00 00       	push   0x0
30e000bb:	e9 e0 ff ff ff       	jmp    30e000a0 <main+0xa0>
30e000c0:	ff 25 2c 03 e0 30    	jmp    DWORD PTR ds:0x30e0032c
30e000c6:	68 08 00 00 00       	push   0x8
30e000cb:	e9 d0 ff ff ff       	jmp    30e000a0 <main+0xa0>

Disassembly of section .rodata:

30e000d0 <.rodata>:
30e000d0:	54                   	push   esp
30e000d1:	77 6f                	ja     30e00142 <main+0x142>
30e000d3:	20 61 72             	and    BYTE PTR [ecx+0x72],ah
30e000d6:	67 75 6d             	addr16 jne 30e00146 <main+0x146>
30e000d9:	65 6e                	outs   dx,BYTE PTR gs:[esi]
30e000db:	74 73                	je     30e00150 <main+0x150>
30e000dd:	20 6d 75             	and    BYTE PTR [ebp+0x75],ch
30e000e0:	73 74                	jae    30e00156 <main+0x156>
30e000e2:	20 62 65             	and    BYTE PTR [edx+0x65],ah
30e000e5:	20 73 75             	and    BYTE PTR [ebx+0x75],dh
30e000e8:	70 70                	jo     30e0015a <main+0x15a>
30e000ea:	6c                   	ins    BYTE PTR es:[edi],dx
30e000eb:	69 65 64 2c 20 74 68 	imul   esp,DWORD PTR [ebp+0x64],0x6874202c
30e000f2:	65 20 73 69          	and    BYTE PTR gs:[ebx+0x69],dh
30e000f6:	67 6e                	outs   dx,BYTE PTR ds:[si]
30e000f8:	61                   	popa   
30e000f9:	6c                   	ins    BYTE PTR es:[edi],dx
30e000fa:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
30e000fe:	73 65                	jae    30e00165 <main+0x165>
30e00100:	6e                   	outs   dx,BYTE PTR ds:[esi]
30e00101:	64 20 61 6e          	and    BYTE PTR fs:[ecx+0x6e],ah
30e00105:	64 20 74 68 65       	and    BYTE PTR fs:[eax+ebp*2+0x65],dh
30e0010a:	20 50 49             	and    BYTE PTR [eax+0x49],dl
30e0010d:	44                   	inc    esp
30e0010e:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
30e00111:	20 74 68 65          	and    BYTE PTR [eax+ebp*2+0x65],dh
30e00115:	20 70 72             	and    BYTE PTR [eax+0x72],dh
30e00118:	6f                   	outs   dx,DWORD PTR ds:[esi]
30e00119:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
30e0011c:	73 2c                	jae    30e0014a <main+0x14a>
30e0011e:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
30e00121:	20 74 68 61          	and    BYTE PTR [eax+ebp*2+0x61],dh
30e00125:	74 20                	je     30e00147 <main+0x147>
30e00127:	6f                   	outs   dx,DWORD PTR ds:[esi]
30e00128:	72 64                	jb     30e0018e <main+0x18e>
30e0012a:	65                   	gs
30e0012b:	72 0a                	jb     30e00137 <main+0x137>
30e0012d:	00 43 6f             	add    BYTE PTR [ebx+0x6f],al
30e00130:	75 6e                	jne    30e001a0 <main+0x1a0>
30e00132:	74 69                	je     30e0019d <main+0x19d>
30e00134:	6e                   	outs   dx,BYTE PTR ds:[esi]
30e00135:	67 20 74 6f          	and    BYTE PTR [si+0x6f],dh
30e00139:	20 25 69 0a 00 43    	and    BYTE PTR ds:0x43000a69,ah
30e0013f:	6f                   	outs   dx,DWORD PTR ds:[esi]
30e00140:	75 6e                	jne    30e001b0 <main+0x1b0>
30e00142:	74 65                	je     30e001a9 <main+0x1a9>
30e00144:	64 20 74 6f 20       	and    BYTE PTR fs:[edi+ebp*2+0x20],dh
30e00149:	25 69 0a 20 00       	and    eax,0x200a69

Disassembly of section .eh_frame:

30e00150 <.eh_frame>:
30e00150:	14 00                	adc    al,0x0
30e00152:	00 00                	add    BYTE PTR [eax],al
30e00154:	00 00                	add    BYTE PTR [eax],al
30e00156:	00 00                	add    BYTE PTR [eax],al
30e00158:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
30e0015b:	00 01                	add    BYTE PTR [ecx],al
30e0015d:	7c 08                	jl     30e00167 <main+0x167>
30e0015f:	01 1b                	add    DWORD PTR [ebx],ebx
30e00161:	0c 04                	or     al,0x4
30e00163:	04 88                	add    al,0x88
30e00165:	01 00                	add    DWORD PTR [eax],eax
30e00167:	00 28                	add    BYTE PTR [eax],ch
30e00169:	00 00                	add    BYTE PTR [eax],al
30e0016b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
30e0016e:	00 00                	add    BYTE PTR [eax],al
30e00170:	90                   	nop
30e00171:	fe                   	(bad)  
30e00172:	ff                   	(bad)  
30e00173:	ff a0 00 00 00 00    	jmp    DWORD PTR [eax+0x0]
30e00179:	44                   	inc    esp
30e0017a:	0c 01                	or     al,0x1
30e0017c:	00 47 10             	add    BYTE PTR [edi+0x10],al
30e0017f:	05 02 75 00 43       	add    eax,0x43007502
30e00184:	0f 03 75 7c          	lsl    esi,WORD PTR [ebp+0x7c]
30e00188:	06                   	push   es
30e00189:	02 8d 0c 01 00 41    	add    cl,BYTE PTR [ebp+0x4100010c]
30e0018f:	c5 43 0c             	lds    eax,FWORD PTR [ebx+0xc]
30e00192:	04 04                	add    al,0x4

Disassembly of section .interp:

30e00194 <.interp>:
30e00194:	2f                   	das    
30e00195:	6c                   	ins    BYTE PTR es:[edi],dx
30e00196:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
30e0019d:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
30e001a4:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

30e001a8 <.dynsym>:
	...
30e001b8:	09 00                	or     DWORD PTR [eax],eax
	...
30e001c2:	00 00                	add    BYTE PTR [eax],al
30e001c4:	12 00                	adc    al,BYTE PTR [eax]
30e001c6:	00 00                	add    BYTE PTR [eax],al
30e001c8:	10 00                	adc    BYTE PTR [eax],al
	...
30e001d2:	00 00                	add    BYTE PTR [eax],al
30e001d4:	12 00                	adc    al,BYTE PTR [eax]
	...

Disassembly of section .dynstr:

30e001d8 <.dynstr>:
30e001d8:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30e001dc:	63 2e                	arpl   WORD PTR [esi],bp
30e001de:	73 6f                	jae    30e0024f <main+0x24f>
30e001e0:	00 70 72             	add    BYTE PTR [eax+0x72],dh
30e001e3:	69 6e 74 66 00 61 74 	imul   ebp,DWORD PTR [esi+0x74],0x74610066
30e001ea:	6f                   	outs   dx,DWORD PTR ds:[esi]
30e001eb:	69 00 2e 2e 2f 6c    	imul   eax,DWORD PTR [eax],0x6c2f2e2e
30e001f1:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
30e001f8:	4f                   	dec    edi
30e001f9:	53                   	push   ebx
30e001fa:	2f                   	das    
30e001fb:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
30e00202:	62 
30e00203:	75 67                	jne    30e0026c <__GNU_EH_FRAME_HDR+0x4>
30e00205:	2f                   	das    
30e00206:	47                   	inc    edi
30e00207:	4e                   	dec    esi
30e00208:	55                   	push   ebp
30e00209:	2d 4c 69 6e 75       	sub    eax,0x756e694c
30e0020e:	78 00                	js     30e00210 <main+0x210>

Disassembly of section .hash:

30e00210 <.hash>:
30e00210:	01 00                	add    DWORD PTR [eax],eax
30e00212:	00 00                	add    BYTE PTR [eax],al
30e00214:	03 00                	add    eax,DWORD PTR [eax]
30e00216:	00 00                	add    BYTE PTR [eax],al
30e00218:	02 00                	add    al,BYTE PTR [eax]
	...
30e00222:	00 00                	add    BYTE PTR [eax],al
30e00224:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .eh_frame:

30e00228 <.eh_frame>:
30e00228:	14 00                	adc    al,0x0
30e0022a:	00 00                	add    BYTE PTR [eax],al
30e0022c:	00 00                	add    BYTE PTR [eax],al
30e0022e:	00 00                	add    BYTE PTR [eax],al
30e00230:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
30e00233:	00 01                	add    BYTE PTR [ecx],al
30e00235:	7c 08                	jl     30e0023f <main+0x23f>
30e00237:	01 1b                	add    DWORD PTR [ebx],ebx
30e00239:	0c 04                	or     al,0x4
30e0023b:	04 88                	add    al,0x88
30e0023d:	01 00                	add    DWORD PTR [eax],eax
30e0023f:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
30e00242:	00 00                	add    BYTE PTR [eax],al
30e00244:	1c 00                	sbb    al,0x0
30e00246:	00 00                	add    BYTE PTR [eax],al
30e00248:	58                   	pop    eax
30e00249:	fe                   	(bad)  
30e0024a:	ff                   	(bad)  
30e0024b:	ff 30                	push   DWORD PTR [eax]
30e0024d:	00 00                	add    BYTE PTR [eax],al
30e0024f:	00 00                	add    BYTE PTR [eax],al
30e00251:	0e                   	push   cs
30e00252:	08 46 0e             	or     BYTE PTR [esi+0xe],al
30e00255:	0c 4a                	or     al,0x4a
30e00257:	0f 0b                	ud2    
30e00259:	74 04                	je     30e0025f <main+0x25f>
30e0025b:	78 00                	js     30e0025d <main+0x25d>
30e0025d:	3f                   	aas    
30e0025e:	1a 3b                	sbb    bh,BYTE PTR [ebx]
30e00260:	2a 32                	sub    dh,BYTE PTR [edx]
30e00262:	24 22                	and    al,0x22
30e00264:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

30e00268 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
30e00268:	01 1b                	add    DWORD PTR [ebx],ebx
30e0026a:	03 3b                	add    edi,DWORD PTR [ebx]
30e0026c:	e4 fe                	in     al,0xfe
30e0026e:	ff                   	(bad)  
30e0026f:	ff 01                	inc    DWORD PTR [ecx]
30e00271:	00 00                	add    BYTE PTR [eax],al
30e00273:	00 98 fd ff ff 00    	add    BYTE PTR [eax+0xfffffd],bl
30e00279:	ff                   	(bad)  
30e0027a:	ff                   	(bad)  
30e0027b:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

30e0027c <.rel.dyn>:
30e0027c:	28 03                	sub    BYTE PTR [ebx],al
30e0027e:	e0 30                	loopne 30e002b0 <_DYNAMIC+0x24>
30e00280:	07                   	pop    es
30e00281:	01 00                	add    DWORD PTR [eax],eax
30e00283:	00 2c 03             	add    BYTE PTR [ebx+eax*1],ch
30e00286:	e0 30                	loopne 30e002b8 <_DYNAMIC+0x2c>
30e00288:	07                   	pop    es
30e00289:	02 00                	add    al,BYTE PTR [eax]
	...

Disassembly of section .dynamic:

30e0028c <_DYNAMIC>:
30e0028c:	01 00                	add    DWORD PTR [eax],eax
30e0028e:	00 00                	add    BYTE PTR [eax],al
30e00290:	01 00                	add    DWORD PTR [eax],eax
30e00292:	00 00                	add    BYTE PTR [eax],al
30e00294:	0f 00 00             	sldt   WORD PTR [eax]
30e00297:	00 15 00 00 00 04    	add    BYTE PTR ds:0x4000000,dl
30e0029d:	00 00                	add    BYTE PTR [eax],al
30e0029f:	00 10                	add    BYTE PTR [eax],dl
30e002a1:	02 e0                	add    ah,al
30e002a3:	30 05 00 00 00 d8    	xor    BYTE PTR ds:0xd8000000,al
30e002a9:	01 e0                	add    eax,esp
30e002ab:	30 06                	xor    BYTE PTR [esi],al
30e002ad:	00 00                	add    BYTE PTR [eax],al
30e002af:	00 a8 01 e0 30 0a    	add    BYTE PTR [eax+0xa30e001],ch
30e002b5:	00 00                	add    BYTE PTR [eax],al
30e002b7:	00 38                	add    BYTE PTR [eax],bh
30e002b9:	00 00                	add    BYTE PTR [eax],al
30e002bb:	00 0b                	add    BYTE PTR [ebx],cl
30e002bd:	00 00                	add    BYTE PTR [eax],al
30e002bf:	00 10                	add    BYTE PTR [eax],dl
30e002c1:	00 00                	add    BYTE PTR [eax],al
30e002c3:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
30e002c9:	00 00                	add    BYTE PTR [eax],al
30e002cb:	00 03                	add    BYTE PTR [ebx],al
30e002cd:	00 00                	add    BYTE PTR [eax],al
30e002cf:	00 1c 03             	add    BYTE PTR [ebx+eax*1],bl
30e002d2:	e0 30                	loopne 30e00304 <_DYNAMIC+0x78>
30e002d4:	02 00                	add    al,BYTE PTR [eax]
30e002d6:	00 00                	add    BYTE PTR [eax],al
30e002d8:	10 00                	adc    BYTE PTR [eax],al
30e002da:	00 00                	add    BYTE PTR [eax],al
30e002dc:	14 00                	adc    al,0x0
30e002de:	00 00                	add    BYTE PTR [eax],al
30e002e0:	11 00                	adc    DWORD PTR [eax],eax
30e002e2:	00 00                	add    BYTE PTR [eax],al
30e002e4:	17                   	pop    ss
30e002e5:	00 00                	add    BYTE PTR [eax],al
30e002e7:	00 7c 02 e0          	add    BYTE PTR [edx+eax*1-0x20],bh
30e002eb:	30 00                	xor    BYTE PTR [eax],al
	...

Disassembly of section .got.plt:

30e0031c <_GLOBAL_OFFSET_TABLE_>:
30e0031c:	8c 02                	mov    WORD PTR [edx],es
30e0031e:	e0 30                	loopne 30e00350 <processEnvp+0x18>
	...
30e00328:	b6 00                	mov    dh,0x0
30e0032a:	e0 30                	loopne 30e0035c <processEnvp+0x24>
30e0032c:	c6 00 e0             	mov    BYTE PTR [eax],0xe0
30e0032f:	30                   	.byte 0x30

Disassembly of section .bss:

30e00330 <filesToCloseCount>:
30e00330:	00 00                	add    BYTE PTR [eax],al
	...

30e00334 <filesToClose>:
30e00334:	00 00                	add    BYTE PTR [eax],al
	...

30e00338 <processEnvp>:
30e00338:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	61                   	popa   
   1:	01 00                	add    DWORD PTR [eax],eax
   3:	00 04 00             	add    BYTE PTR [eax+eax*1],al
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	fd                   	std    
   d:	00 00                	add    BYTE PTR [eax],al
   f:	00 0c 0e             	add    BYTE PTR [esi+ecx*1],cl
  12:	00 00                	add    BYTE PTR [eax],al
  14:	00 78 00             	add    BYTE PTR [eax+0x0],bh
  17:	00 00                	add    BYTE PTR [eax],al
  19:	00 00                	add    BYTE PTR [eax],al
  1b:	e0 30                	loopne 4d <main-0x30dfffb3>
  1d:	a0 00 00 00 00       	mov    al,ds:0x0
  22:	00 00                	add    BYTE PTR [eax],al
  24:	00 02                	add    BYTE PTR [edx],al
  26:	04 05                	add    al,0x5
  28:	69 6e 74 00 03 04 07 	imul   ebp,DWORD PTR [esi+0x74],0x7040300
  2f:	f4                   	hlt    
  30:	00 00                	add    BYTE PTR [eax],al
  32:	00 03                	add    BYTE PTR [ebx],al
  34:	04 07                	add    al,0x7
  36:	53                   	push   ebx
  37:	00 00                	add    BYTE PTR [eax],al
  39:	00 03                	add    BYTE PTR [ebx],al
  3b:	01 08                	add    DWORD PTR [eax],ecx
  3d:	be 00 00 00 03       	mov    esi,0x3000000
  42:	02 07                	add    al,BYTE PTR [edi]
  44:	ab                   	stos   DWORD PTR es:[edi],eax
  45:	00 00                	add    BYTE PTR [eax],al
  47:	00 03                	add    BYTE PTR [ebx],al
  49:	04 07                	add    al,0x7
  4b:	58                   	pop    eax
  4c:	00 00                	add    BYTE PTR [eax],al
  4e:	00 03                	add    BYTE PTR [ebx],al
  50:	01 06                	add    DWORD PTR [esi],eax
  52:	c0 00 00             	rol    BYTE PTR [eax],0x0
  55:	00 03                	add    BYTE PTR [ebx],al
  57:	02 05 d8 00 00 00    	add    al,BYTE PTR ds:0xd8
  5d:	03 08                	add    ecx,DWORD PTR [eax]
  5f:	05 00 00 00 00       	add    eax,0x0
  64:	03 08                	add    ecx,DWORD PTR [eax]
  66:	07                   	pop    es
  67:	4e                   	dec    esi
  68:	00 00                	add    BYTE PTR [eax],al
  6a:	00 03                	add    BYTE PTR [ebx],al
  6c:	04 05                	add    al,0x5
  6e:	05 00 00 00 04       	add    eax,0x4000000
  73:	04 78                	add    al,0x78
  75:	00 00                	add    BYTE PTR [eax],al
  77:	00 03                	add    BYTE PTR [ebx],al
  79:	01 06                	add    DWORD PTR [esi],eax
  7b:	c7 00 00 00 05 96    	mov    DWORD PTR [eax],0x96050000
  81:	00 00                	add    BYTE PTR [eax],al
  83:	00 02                	add    BYTE PTR [edx],al
  85:	34 48                	xor    al,0x48
  87:	00 00                	add    BYTE PTR [eax],al
  89:	00 05 37 00 00 00    	add    BYTE PTR ds:0x37,al
  8f:	02 56 48             	add    dl,BYTE PTR [esi+0x48]
  92:	00 00                	add    BYTE PTR [eax],al
  94:	00 03                	add    BYTE PTR [ebx],al
  96:	01 02                	add    DWORD PTR [edx],eax
  98:	72 00                	jb     9a <main-0x30dfff66>
  9a:	00 00                	add    BYTE PTR [eax],al
  9c:	03 08                	add    ecx,DWORD PTR [eax]
  9e:	04 9f                	add    al,0x9f
  a0:	00 00                	add    BYTE PTR [eax],al
  a2:	00 06                	add    BYTE PTR [esi],al
  a4:	24 00                	and    al,0x0
  a6:	00 00                	add    BYTE PTR [eax],al
  a8:	01 12                	add    DWORD PTR [edx],edx
  aa:	25 00 00 00 00       	and    eax,0x0
  af:	00 e0                	add    al,ah
  b1:	30 a0 00 00 00 01    	xor    BYTE PTR [eax+0x1000000],ah
  b7:	9c                   	pushf  
  b8:	25 01 00 00 07       	and    eax,0x7000001
  bd:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
  be:	00 00                	add    BYTE PTR [eax],al
  c0:	00 01                	add    BYTE PTR [ecx],al
  c2:	12 25 00 00 00 02    	adc    ah,BYTE PTR ds:0x2000000
  c8:	91                   	xchg   ecx,eax
  c9:	00 07                	add    BYTE PTR [edi],al
  cb:	16                   	push   ss
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	00 01                	add    BYTE PTR [ecx],al
  d0:	12 25 01 00 00 02    	adc    ah,BYTE PTR ds:0x2000001
  d6:	91                   	xchg   ecx,eax
  d7:	04 08                	add    al,0x8
  d9:	41                   	inc    ecx
  da:	00 00                	add    BYTE PTR [eax],al
  dc:	00 01                	add    BYTE PTR [ecx],al
  de:	14 25                	adc    al,0x25
  e0:	00 00                	add    BYTE PTR [eax],al
  e2:	00 02                	add    BYTE PTR [edx],al
  e4:	75 74                	jne    15a <main-0x30dffea6>
  e6:	08 29                	or     BYTE PTR [ecx],ch
  e8:	00 00                	add    BYTE PTR [eax],al
  ea:	00 01                	add    BYTE PTR [ecx],al
  ec:	15 48 00 00 00       	adc    eax,0x48
  f1:	02 75 70             	add    dh,BYTE PTR [ebp+0x70]
  f4:	09 3f                	or     DWORD PTR [edi],edi
  f6:	00 e0                	add    al,ah
  f8:	30 43 00             	xor    BYTE PTR [ebx+0x0],al
  fb:	00 00                	add    BYTE PTR [eax],al
  fd:	08 1b                	or     BYTE PTR [ebx],bl
  ff:	00 00                	add    BYTE PTR [eax],al
 101:	00 01                	add    BYTE PTR [ecx],al
 103:	1e                   	push   ds
 104:	48                   	dec    eax
 105:	00 00                	add    BYTE PTR [eax],al
 107:	00 02                	add    BYTE PTR [edx],al
 109:	75 68                	jne    173 <main-0x30dffe8d>
 10b:	09 69 00             	or     DWORD PTR [ecx+0x0],ebp
 10e:	e0 30                	loopne 140 <main-0x30dffec0>
 110:	19 00                	sbb    DWORD PTR [eax],eax
 112:	00 00                	add    BYTE PTR [eax],al
 114:	0a 63 6e             	or     ah,BYTE PTR [ebx+0x6e]
 117:	74 00                	je     119 <main-0x30dffee7>
 119:	01 21                	add    DWORD PTR [ecx],esp
 11b:	25 00 00 00 02       	and    eax,0x2000000
 120:	75 6c                	jne    18e <main-0x30dffe72>
 122:	00 00                	add    BYTE PTR [eax],al
 124:	00 04 04             	add    BYTE PTR [esp+eax*1],al
 127:	72 00                	jb     129 <main-0x30dffed7>
 129:	00 00                	add    BYTE PTR [eax],al
 12b:	0b cc                	or     ecx,esp
 12d:	00 00                	add    BYTE PTR [eax],al
 12f:	00 03                	add    BYTE PTR [ebx],al
 131:	33 25 01 00 00 05    	xor    esp,DWORD PTR ds:0x5000001
 137:	03 38                	add    edi,DWORD PTR [eax]
 139:	03 e0                	add    esp,eax
 13b:	30 0b                	xor    BYTE PTR [ebx],cl
 13d:	65 00 00             	add    BYTE PTR gs:[eax],al
 140:	00 04 35 4d 01 00 00 	add    BYTE PTR [esi*1+0x14d],al
 147:	05 03 34 03 e0       	add    eax,0xe0033403
 14c:	30 04 04             	xor    BYTE PTR [esp+eax*1],al
 14f:	8a 00                	mov    al,BYTE PTR [eax]
 151:	00 00                	add    BYTE PTR [eax],al
 153:	0b e2                	or     esp,edx
 155:	00 00                	add    BYTE PTR [eax],al
 157:	00 04 36             	add    BYTE PTR [esi+esi*1],al
 15a:	7f 00                	jg     15c <main-0x30dffea4>
 15c:	00 00                	add    BYTE PTR [eax],al
 15e:	05 03 30 03 e0       	add    eax,0xe0033003
 163:	30 00                	xor    BYTE PTR [eax],al

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
  1b:	08 00                	or     BYTE PTR [eax],al
  1d:	00 03                	add    BYTE PTR [ebx],al
  1f:	24 00                	and    al,0x0
  21:	0b 0b                	or     ecx,DWORD PTR [ebx]
  23:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
  26:	0e                   	push   cs
  27:	00 00                	add    BYTE PTR [eax],al
  29:	04 0f                	add    al,0xf
  2b:	00 0b                	add    BYTE PTR [ebx],cl
  2d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  30:	00 00                	add    BYTE PTR [eax],al
  32:	05 16 00 03 0e       	add    eax,0xe030016
  37:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  39:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  3b:	49                   	dec    ecx
  3c:	13 00                	adc    eax,DWORD PTR [eax]
  3e:	00 06                	add    BYTE PTR [esi],al
  40:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  43:	19 03                	sbb    DWORD PTR [ebx],eax
  45:	0e                   	push   cs
  46:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  48:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  4a:	27                   	daa    
  4b:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
  4e:	11 01                	adc    DWORD PTR [ecx],eax
  50:	12 06                	adc    al,BYTE PTR [esi]
  52:	40                   	inc    eax
  53:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  59:	00 00                	add    BYTE PTR [eax],al
  5b:	07                   	pop    es
  5c:	05 00 03 0e 3a       	add    eax,0x3a0e0300
  61:	0b 3b                	or     edi,DWORD PTR [ebx]
  63:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  66:	02 18                	add    bl,BYTE PTR [eax]
  68:	00 00                	add    BYTE PTR [eax],al
  6a:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
  6d:	03 0e                	add    ecx,DWORD PTR [esi]
  6f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  71:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  73:	49                   	dec    ecx
  74:	13 02                	adc    eax,DWORD PTR [edx]
  76:	18 00                	sbb    BYTE PTR [eax],al
  78:	00 09                	add    BYTE PTR [ecx],cl
  7a:	0b 01                	or     eax,DWORD PTR [ecx]
  7c:	11 01                	adc    DWORD PTR [ecx],eax
  7e:	12 06                	adc    al,BYTE PTR [esi]
  80:	00 00                	add    BYTE PTR [eax],al
  82:	0a 34 00             	or     dh,BYTE PTR [eax+eax*1]
  85:	03 08                	add    ecx,DWORD PTR [eax]
  87:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  89:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  8b:	49                   	dec    ecx
  8c:	13 02                	adc    eax,DWORD PTR [edx]
  8e:	18 00                	sbb    BYTE PTR [eax],al
  90:	00 0b                	add    BYTE PTR [ebx],cl
  92:	34 00                	xor    al,0x0
  94:	03 0e                	add    ecx,DWORD PTR [esi]
  96:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  98:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  9a:	49                   	dec    ecx
  9b:	13 3f                	adc    edi,DWORD PTR [edi]
  9d:	19 02                	sbb    DWORD PTR [edx],eax
  9f:	18 00                	sbb    BYTE PTR [eax],al
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
  12:	e0 30                	loopne 44 <main-0x30dfffbc>
  14:	a0 00 00 00 00       	mov    al,ds:0x0
  19:	00 00                	add    BYTE PTR [eax],al
  1b:	00 00                	add    BYTE PTR [eax],al
  1d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	cc                   	int3   
   1:	00 00                	add    BYTE PTR [eax],al
   3:	00 02                	add    BYTE PTR [edx],al
   5:	00 97 00 00 00 01    	add    BYTE PTR [edi+0x1000000],dl
   b:	01 fb                	add    ebx,edi
   d:	0e                   	push   cs
   e:	0d 00 01 01 01       	or     eax,0x1010100
  13:	01 00                	add    DWORD PTR [eax],eax
  15:	00 00                	add    BYTE PTR [eax],al
  17:	01 00                	add    DWORD PTR [eax],eax
  19:	00 01                	add    BYTE PTR [ecx],al
  1b:	2f                   	das    
  1c:	68 6f 6d 65 2f       	push   0x2f656d6f
  21:	79 6f                	jns    92 <main-0x30dfff6e>
  23:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
  2a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
  2d:	73 73                	jae    a2 <main-0x30dfff5e>
  2f:	2f                   	das    
  30:	6c                   	ins    BYTE PTR es:[edi],dx
  31:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
  38:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
  3e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
  44:	78 2d                	js     73 <main-0x30dfff8d>
  46:	67 6e                	outs   dx,BYTE PTR ds:[si]
  48:	75 2f                	jne    79 <main-0x30dfff87>
  4a:	35 2e 33 2e 30       	xor    eax,0x302e332e
  4f:	2f                   	das    
  50:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  57:	00 2e                	add    BYTE PTR [esi],ch
  59:	2e                   	cs
  5a:	2f                   	das    
  5b:	6c                   	ins    BYTE PTR es:[edi],dx
  5c:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  63:	4f                   	dec    edi
  64:	53                   	push   ebx
  65:	2f                   	das    
  66:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  6d:	00 00                	add    BYTE PTR [eax],al
  6f:	63 6f 75             	arpl   WORD PTR [edi+0x75],bp
  72:	6e                   	outs   dx,BYTE PTR ds:[esi]
  73:	74 2e                	je     a3 <main-0x30dfff5d>
  75:	63 00                	arpl   WORD PTR [eax],ax
  77:	00 00                	add    BYTE PTR [eax],al
  79:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  7c:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
  83:	63 
  84:	2e                   	cs
  85:	68 00 01 00 00       	push   0x100
  8a:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  8d:	6d                   	ins    DWORD PTR es:[edi],dx
  8e:	6f                   	outs   dx,DWORD PTR ds:[esi]
  8f:	6e                   	outs   dx,BYTE PTR ds:[esi]
  90:	2e                   	cs
  91:	68 00 02 00 00       	push   0x200
  96:	66 69 6c 65 2e 68 00 	imul   bp,WORD PTR [ebp+eiz*2+0x2e],0x68
  9d:	02 00                	add    al,BYTE PTR [eax]
  9f:	00 00                	add    BYTE PTR [eax],al
  a1:	00 05 02 00 00 e0    	add    BYTE PTR ds:0xe0000002,al
  a7:	30 03                	xor    BYTE PTR [ebx],al
  a9:	12 01                	adc    al,BYTE PTR [ecx]
  ab:	08 2f                	or     BYTE PTR [edi],ch
  ad:	75 76                	jne    125 <main-0x30dffedb>
  af:	5a                   	pop    edx
  b0:	f3 94                	repz xchg esp,eax
  b2:	08 68 08             	or     BYTE PTR [eax+0x8],ch
  b5:	2f                   	das    
  b6:	00 02                	add    BYTE PTR [edx],al
  b8:	04 03                	add    al,0x3
  ba:	91                   	xchg   ecx,eax
  bb:	00 02                	add    BYTE PTR [edx],al
  bd:	04 03                	add    al,0x3
  bf:	49                   	dec    ecx
  c0:	00 02                	add    BYTE PTR [edx],al
  c2:	04 01                	add    al,0x1
  c4:	06                   	push   es
  c5:	4a                   	dec    edx
  c6:	06                   	push   es
  c7:	85 08                	test   DWORD PTR [eax],ecx
  c9:	2f                   	das    
  ca:	3d 02 08 00 01       	cmp    eax,0x1000802
  cf:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6c                   	ins    BYTE PTR es:[edi],dx
   1:	6f                   	outs   dx,DWORD PTR ds:[esi]
   2:	6e                   	outs   dx,BYTE PTR ds:[esi]
   3:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
   7:	6e                   	outs   dx,BYTE PTR ds:[esi]
   8:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
   c:	74 00                	je     e <main-0x30dffff2>
   e:	63 6f 75             	arpl   WORD PTR [edi+0x75],bp
  11:	6e                   	outs   dx,BYTE PTR ds:[esi]
  12:	74 2e                	je     42 <main-0x30dfffbe>
  14:	63 00                	arpl   WORD PTR [eax],ax
  16:	61                   	popa   
  17:	72 67                	jb     80 <main-0x30dfff80>
  19:	76 00                	jbe    1b <main-0x30dfffe5>
  1b:	75 43                	jne    60 <main-0x30dfffa0>
  1d:	6f                   	outs   dx,DWORD PTR ds:[esi]
  1e:	75 6e                	jne    8e <main-0x30dfff72>
  20:	74 54                	je     76 <main-0x30dfff8a>
  22:	6f                   	outs   dx,DWORD PTR ds:[esi]
  23:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
  26:	69 6e 00 75 43 6f 75 	imul   ebp,DWORD PTR [esi+0x0],0x756f4375
  2d:	6e                   	outs   dx,BYTE PTR ds:[esi]
  2e:	74 65                	je     95 <main-0x30dfff6b>
  30:	64                   	fs
  31:	56                   	push   esi
  32:	61                   	popa   
  33:	6c                   	ins    BYTE PTR es:[edi],dx
  34:	75 65                	jne    9b <main-0x30dfff65>
  36:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
  39:	6e                   	outs   dx,BYTE PTR ds:[esi]
  3a:	74 70                	je     ac <main-0x30dfff54>
  3c:	74 72                	je     b0 <main-0x30dfff50>
  3e:	5f                   	pop    edi
  3f:	74 00                	je     41 <main-0x30dfffbf>
  41:	69 52 65 74 75 72 6e 	imul   edx,DWORD PTR [edx+0x65],0x6e727574
  48:	56                   	push   esi
  49:	61                   	popa   
  4a:	6c                   	ins    BYTE PTR es:[edi],dx
  4b:	75 65                	jne    b2 <main-0x30dfff4e>
  4d:	00 6c 6f 6e          	add    BYTE PTR [edi+ebp*2+0x6e],ch
  51:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  55:	6e                   	outs   dx,BYTE PTR ds:[esi]
  56:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
  5a:	73 69                	jae    c5 <main-0x30dfff3b>
  5c:	67 6e                	outs   dx,BYTE PTR ds:[si]
  5e:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  63:	74 00                	je     65 <main-0x30dfff9b>
  65:	66 69 6c 65 73 54 6f 	imul   bp,WORD PTR [ebp+eiz*2+0x73],0x6f54
  6c:	43                   	inc    ebx
  6d:	6c                   	ins    BYTE PTR es:[edi],dx
  6e:	6f                   	outs   dx,DWORD PTR ds:[esi]
  6f:	73 65                	jae    d6 <main-0x30dfff2a>
  71:	00 5f 42             	add    BYTE PTR [edi+0x42],bl
  74:	6f                   	outs   dx,DWORD PTR ds:[esi]
  75:	6f                   	outs   dx,DWORD PTR ds:[esi]
  76:	6c                   	ins    BYTE PTR es:[edi],dx
  77:	00 2f                	add    BYTE PTR [edi],ch
  79:	68 6f 6d 65 2f       	push   0x2f656d6f
  7e:	79 6f                	jns    ef <main-0x30dfff11>
  80:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  87:	6f                   	outs   dx,DWORD PTR ds:[esi]
  88:	73 2f                	jae    b9 <main-0x30dfff47>
  8a:	61                   	popa   
  8b:	70 72                	jo     ff <main-0x30dfff01>
  8d:	6f                   	outs   dx,DWORD PTR ds:[esi]
  8e:	6a 2f                	push   0x2f
  90:	63 6f 75             	arpl   WORD PTR [edi+0x75],bp
  93:	6e                   	outs   dx,BYTE PTR ds:[esi]
  94:	74 00                	je     96 <main-0x30dfff6a>
  96:	75 69                	jne    101 <main-0x30dffeff>
  98:	6e                   	outs   dx,BYTE PTR ds:[esi]
  99:	74 33                	je     ce <main-0x30dfff32>
  9b:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
  9e:	00 64 6f 75          	add    BYTE PTR [edi+ebp*2+0x75],ah
  a2:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
  a6:	61                   	popa   
  a7:	72 67                	jb     110 <main-0x30dffef0>
  a9:	63 00                	arpl   WORD PTR [eax],ax
  ab:	73 68                	jae    115 <main-0x30dffeeb>
  ad:	6f                   	outs   dx,DWORD PTR ds:[esi]
  ae:	72 74                	jb     124 <main-0x30dffedc>
  b0:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
  b3:	73 69                	jae    11e <main-0x30dffee2>
  b5:	67 6e                	outs   dx,BYTE PTR ds:[si]
  b7:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  bc:	74 00                	je     be <main-0x30dfff42>
  be:	75 6e                	jne    12e <main-0x30dffed2>
  c0:	73 69                	jae    12b <main-0x30dffed5>
  c2:	67 6e                	outs   dx,BYTE PTR ds:[si]
  c4:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
  c9:	61                   	popa   
  ca:	72 00                	jb     cc <main-0x30dfff34>
  cc:	70 72                	jo     140 <main-0x30dffec0>
  ce:	6f                   	outs   dx,DWORD PTR ds:[esi]
  cf:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
  d2:	73 45                	jae    119 <main-0x30dffee7>
  d4:	6e                   	outs   dx,BYTE PTR ds:[esi]
  d5:	76 70                	jbe    147 <main-0x30dffeb9>
  d7:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
  da:	6f                   	outs   dx,DWORD PTR ds:[esi]
  db:	72 74                	jb     151 <main-0x30dffeaf>
  dd:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
  e0:	74 00                	je     e2 <main-0x30dfff1e>
  e2:	66 69 6c 65 73 54 6f 	imul   bp,WORD PTR [ebp+eiz*2+0x73],0x6f54
  e9:	43                   	inc    ebx
  ea:	6c                   	ins    BYTE PTR es:[edi],dx
  eb:	6f                   	outs   dx,DWORD PTR ds:[esi]
  ec:	73 65                	jae    153 <main-0x30dffead>
  ee:	43                   	inc    ebx
  ef:	6f                   	outs   dx,DWORD PTR ds:[esi]
  f0:	75 6e                	jne    160 <main-0x30dffea0>
  f2:	74 00                	je     f4 <main-0x30dfff0c>
  f4:	73 69                	jae    15f <main-0x30dffea1>
  f6:	7a 65                	jp     15d <main-0x30dffea3>
  f8:	74 79                	je     173 <main-0x30dffe8d>
  fa:	70 65                	jo     161 <main-0x30dffe9f>
  fc:	00 47 4e             	add    BYTE PTR [edi+0x4e],al
  ff:	55                   	push   ebp
 100:	20 43 39             	and    BYTE PTR [ebx+0x39],al
 103:	39 20                	cmp    DWORD PTR [eax],esp
 105:	35 2e 33 2e 30       	xor    eax,0x302e332e
 10a:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
 110:	3d 69 6e 74 65       	cmp    eax,0x65746e69
 115:	6c                   	ins    BYTE PTR es:[edi],dx
 116:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
 11c:	65                   	gs
 11d:	3d 67 65 6e 65       	cmp    eax,0x656e6567
 122:	72 69                	jb     18d <main-0x30dffe73>
 124:	63 20                	arpl   WORD PTR [eax],sp
 126:	2d 6d 61 72 63       	sub    eax,0x6372616d
 12b:	68 3d 70 65 6e       	push   0x6e65703d
 130:	74 69                	je     19b <main-0x30dffe65>
 132:	75 6d                	jne    1a1 <main-0x30dffe5f>
 134:	70 72                	jo     1a8 <main-0x30dffe58>
 136:	6f                   	outs   dx,DWORD PTR ds:[esi]
 137:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
 13d:	74 64                	je     1a3 <main-0x30dffe5d>
 13f:	3d 63 39 39 20       	cmp    eax,0x20393963
 144:	2d 66 66 72 65       	sub    eax,0x65726666
 149:	65                   	gs
 14a:	73 74                	jae    1c0 <main-0x30dffe40>
 14c:	61                   	popa   
 14d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 14e:	64                   	fs
 14f:	69                   	.byte 0x69
 150:	6e                   	outs   dx,BYTE PTR ds:[esi]
 151:	67                   	addr16
	...

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
