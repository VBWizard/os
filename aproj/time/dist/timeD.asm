
Debug/cross-Linux/time:     file format elf32-i386


Disassembly of section .text:

03200000 <main>:
main():
/home/yogi/src/os/time/testtime.c:19
#include "libChrisOS.h"

/*
 * 
 */
int main(int argc, char** argv) {
 3200000:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 3200004:	83 e4 f0             	and    esp,0xfffffff0
 3200007:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 320000a:	55                   	push   ebp
 320000b:	89 e5                	mov    ebp,esp
 320000d:	53                   	push   ebx
 320000e:	51                   	push   ecx
 320000f:	83 ec 30             	sub    esp,0x30
 3200012:	89 cb                	mov    ebx,ecx
/home/yogi/src/os/time/testtime.c:21

    int pid=0;
 3200014:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/time/testtime.c:24
    struct tm *totalTime;
    time_t startTime, endTime, elapsed;
    int retVal=0;
 320001b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/time/testtime.c:27
    
#ifdef DEBUG
    print("Param count=%u\n",argc);
 3200022:	83 ec 08             	sub    esp,0x8
 3200025:	ff 33                	push   DWORD PTR [ebx]
 3200027:	68 00 10 20 03       	push   0x3201000
 320002c:	e8 df 01 00 00       	call   3200210 <main+0x210>
 3200031:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/time/testtime.c:28
    for (int cnt=0;cnt<argc;cnt++)
 3200034:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 320003b:	eb 29                	jmp    3200066 <main+0x66>
/home/yogi/src/os/time/testtime.c:29 (discriminator 3)
        print("Param %u=%s\n",cnt,argv[cnt]);
 320003d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3200040:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3200047:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 320004a:	01 d0                	add    eax,edx
 320004c:	8b 00                	mov    eax,DWORD PTR [eax]
 320004e:	83 ec 04             	sub    esp,0x4
 3200051:	50                   	push   eax
 3200052:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3200055:	68 10 10 20 03       	push   0x3201010
 320005a:	e8 b1 01 00 00       	call   3200210 <main+0x210>
 320005f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/time/testtime.c:28 (discriminator 3)
    time_t startTime, endTime, elapsed;
    int retVal=0;
    
#ifdef DEBUG
    print("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
 3200062:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/time/testtime.c:28 (discriminator 1)
 3200066:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3200069:	3b 03                	cmp    eax,DWORD PTR [ebx]
 320006b:	7c d0                	jl     320003d <main+0x3d>
/home/yogi/src/os/time/testtime.c:31
        print("Param %u=%s\n",cnt,argv[cnt]);
#endif
    if (argc<2)
 320006d:	83 3b 01             	cmp    DWORD PTR [ebx],0x1
 3200070:	7f 17                	jg     3200089 <main+0x89>
/home/yogi/src/os/time/testtime.c:33
    {
        print("Error: Not enough parameters supplied, must pass path to program to be run\n");
 3200072:	83 ec 0c             	sub    esp,0xc
 3200075:	68 20 10 20 03       	push   0x3201020
 320007a:	e8 91 01 00 00       	call   3200210 <main+0x210>
 320007f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/time/testtime.c:34
        retVal=-1;
 3200082:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
/home/yogi/src/os/time/testtime.c:36
    }
    char* execpgm=malloc(512);
 3200089:	83 ec 0c             	sub    esp,0xc
 320008c:	68 00 02 00 00       	push   0x200
 3200091:	e8 8a 01 00 00       	call   3200220 <main+0x220>
 3200096:	83 c4 10             	add    esp,0x10
 3200099:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/time/testtime.c:37
    strcpy(execpgm,argv[1]);
 320009c:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 320009f:	83 c0 04             	add    eax,0x4
 32000a2:	8b 00                	mov    eax,DWORD PTR [eax]
 32000a4:	83 ec 08             	sub    esp,0x8
 32000a7:	50                   	push   eax
 32000a8:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 32000ab:	e8 40 01 00 00       	call   32001f0 <main+0x1f0>
 32000b0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/time/testtime.c:38
    startTime=time();
 32000b3:	e8 98 01 00 00       	call   3200250 <main+0x250>
 32000b8:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/time/testtime.c:39
    pid=exec(execpgm,0,NULL);
 32000bb:	83 ec 04             	sub    esp,0x4
 32000be:	6a 00                	push   0x0
 32000c0:	6a 00                	push   0x0
 32000c2:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 32000c5:	e8 76 01 00 00       	call   3200240 <main+0x240>
 32000ca:	83 c4 10             	add    esp,0x10
 32000cd:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/time/testtime.c:40
    if (pid==0)
 32000d0:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 32000d4:	75 25                	jne    32000fb <main+0xfb>
/home/yogi/src/os/time/testtime.c:42
    {
        print("Error executing %s\n",argv[1]);
 32000d6:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 32000d9:	83 c0 04             	add    eax,0x4
 32000dc:	8b 00                	mov    eax,DWORD PTR [eax]
 32000de:	83 ec 08             	sub    esp,0x8
 32000e1:	50                   	push   eax
 32000e2:	68 6c 10 20 03       	push   0x320106c
 32000e7:	e8 24 01 00 00       	call   3200210 <main+0x210>
 32000ec:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/time/testtime.c:43
        retVal=-2;
 32000ef:	c7 45 f4 fe ff ff ff 	mov    DWORD PTR [ebp-0xc],0xfffffffe
 32000f6:	e9 c0 00 00 00       	jmp    32001bb <main+0x1bb>
/home/yogi/src/os/time/testtime.c:47
    }
    else
    {
        waitpid(pid);
 32000fb:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 32000fe:	83 ec 0c             	sub    esp,0xc
 3200101:	50                   	push   eax
 3200102:	e8 f9 00 00 00       	call   3200200 <main+0x200>
 3200107:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/time/testtime.c:48
        endTime=time();
 320010a:	e8 41 01 00 00       	call   3200250 <main+0x250>
 320010f:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/time/testtime.c:49
        elapsed=(endTime-startTime);
 3200112:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3200115:	2b 45 e4             	sub    eax,DWORD PTR [ebp-0x1c]
 3200118:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/time/testtime.c:50
        totalTime=malloc(sizeof(totalTime));    
 320011b:	83 ec 0c             	sub    esp,0xc
 320011e:	6a 04                	push   0x4
 3200120:	e8 fb 00 00 00       	call   3200220 <main+0x220>
 3200125:	83 c4 10             	add    esp,0x10
 3200128:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/time/testtime.c:51
        print("Elapsed ticks = %u\n",elapsed);
 320012b:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 320012e:	83 ec 08             	sub    esp,0x8
 3200131:	50                   	push   eax
 3200132:	68 80 10 20 03       	push   0x3201080
 3200137:	e8 d4 00 00 00       	call   3200210 <main+0x210>
 320013c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/time/testtime.c:52
        int ms=elapsed%TICKS_PER_SECOND;
 320013f:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
 3200142:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
 3200147:	89 c8                	mov    eax,ecx
 3200149:	f7 ea                	imul   edx
 320014b:	c1 fa 05             	sar    edx,0x5
 320014e:	89 c8                	mov    eax,ecx
 3200150:	c1 f8 1f             	sar    eax,0x1f
 3200153:	29 c2                	sub    edx,eax
 3200155:	89 d0                	mov    eax,edx
 3200157:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 320015a:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 320015d:	6b c0 64             	imul   eax,eax,0x64
 3200160:	29 c1                	sub    ecx,eax
 3200162:	89 c8                	mov    eax,ecx
 3200164:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/time/testtime.c:53
        elapsed/= TICKS_PER_SECOND;
 3200167:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
 320016a:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
 320016f:	89 c8                	mov    eax,ecx
 3200171:	f7 ea                	imul   edx
 3200173:	c1 fa 05             	sar    edx,0x5
 3200176:	89 c8                	mov    eax,ecx
 3200178:	c1 f8 1f             	sar    eax,0x1f
 320017b:	29 c2                	sub    edx,eax
 320017d:	89 d0                	mov    eax,edx
 320017f:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/time/testtime.c:54
        gmtime_r(&elapsed,totalTime);
 3200182:	83 ec 08             	sub    esp,0x8
 3200185:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 3200188:	8d 45 d4             	lea    eax,[ebp-0x2c]
 320018b:	50                   	push   eax
 320018c:	e8 9f 00 00 00       	call   3200230 <main+0x230>
 3200191:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/time/testtime.c:55
        print("Elapsed time = %02u:%02u:%02u.%03u\n",totalTime->tm_hour,totalTime->tm_min,totalTime->tm_sec,ms);
 3200194:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3200197:	8b 08                	mov    ecx,DWORD PTR [eax]
 3200199:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 320019c:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 320019f:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 32001a2:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 32001a5:	83 ec 0c             	sub    esp,0xc
 32001a8:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 32001ab:	51                   	push   ecx
 32001ac:	52                   	push   edx
 32001ad:	50                   	push   eax
 32001ae:	68 94 10 20 03       	push   0x3201094
 32001b3:	e8 58 00 00 00       	call   3200210 <main+0x210>
 32001b8:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/time/testtime.c:57
    }
    free(execpgm);
 32001bb:	83 ec 0c             	sub    esp,0xc
 32001be:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 32001c1:	e8 9a 00 00 00       	call   3200260 <main+0x260>
 32001c6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/time/testtime.c:59
//    free (execpgm);
    return (retVal);
 32001c9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/src/os/time/testtime.c:60
}
 32001cc:	8d 65 f8             	lea    esp,[ebp-0x8]
 32001cf:	59                   	pop    ecx
 32001d0:	5b                   	pop    ebx
 32001d1:	5d                   	pop    ebp
 32001d2:	8d 61 fc             	lea    esp,[ecx-0x4]
 32001d5:	c3                   	ret    

Disassembly of section .plt:

032001e0 <.plt>:
 32001e0:	ff 35 04 03 20 03    	push   DWORD PTR ds:0x3200304
 32001e6:	ff 25 08 03 20 03    	jmp    DWORD PTR ds:0x3200308
 32001ec:	00 00                	add    BYTE PTR [eax],al
 32001ee:	00 00                	add    BYTE PTR [eax],al
 32001f0:	ff 25 0c 03 20 03    	jmp    DWORD PTR ds:0x320030c
 32001f6:	68 00 00 00 00       	push   0x0
 32001fb:	e9 e0 ff ff ff       	jmp    32001e0 <main+0x1e0>
 3200200:	ff 25 10 03 20 03    	jmp    DWORD PTR ds:0x3200310
 3200206:	68 08 00 00 00       	push   0x8
 320020b:	e9 d0 ff ff ff       	jmp    32001e0 <main+0x1e0>
 3200210:	ff 25 14 03 20 03    	jmp    DWORD PTR ds:0x3200314
 3200216:	68 10 00 00 00       	push   0x10
 320021b:	e9 c0 ff ff ff       	jmp    32001e0 <main+0x1e0>
 3200220:	ff 25 18 03 20 03    	jmp    DWORD PTR ds:0x3200318
 3200226:	68 18 00 00 00       	push   0x18
 320022b:	e9 b0 ff ff ff       	jmp    32001e0 <main+0x1e0>
 3200230:	ff 25 1c 03 20 03    	jmp    DWORD PTR ds:0x320031c
 3200236:	68 20 00 00 00       	push   0x20
 320023b:	e9 a0 ff ff ff       	jmp    32001e0 <main+0x1e0>
 3200240:	ff 25 20 03 20 03    	jmp    DWORD PTR ds:0x3200320
 3200246:	68 28 00 00 00       	push   0x28
 320024b:	e9 90 ff ff ff       	jmp    32001e0 <main+0x1e0>
 3200250:	ff 25 24 03 20 03    	jmp    DWORD PTR ds:0x3200324
 3200256:	68 30 00 00 00       	push   0x30
 320025b:	e9 80 ff ff ff       	jmp    32001e0 <main+0x1e0>
 3200260:	ff 25 28 03 20 03    	jmp    DWORD PTR ds:0x3200328
 3200266:	68 38 00 00 00       	push   0x38
 320026b:	e9 70 ff ff ff       	jmp    32001e0 <main+0x1e0>

Disassembly of section .dynamic:

03200270 <_DYNAMIC>:
 3200270:	01 00                	add    DWORD PTR [eax],eax
 3200272:	00 00                	add    BYTE PTR [eax],al
 3200274:	01 00                	add    DWORD PTR [eax],eax
 3200276:	00 00                	add    BYTE PTR [eax],al
 3200278:	0f 00 00             	sldt   WORD PTR [eax]
 320027b:	00 3d 00 00 00 04    	add    BYTE PTR ds:0x4000000,bh
 3200281:	00 00                	add    BYTE PTR [eax],al
 3200283:	00 10                	add    BYTE PTR [eax],dl
 3200285:	12 20                	adc    ah,BYTE PTR [eax]
 3200287:	03 05 00 00 00 ac    	add    eax,DWORD PTR ds:0xac000000
 320028d:	11 20                	adc    DWORD PTR [eax],esp
 320028f:	03 06                	add    eax,DWORD PTR [esi]
 3200291:	00 00                	add    BYTE PTR [eax],al
 3200293:	00 1c 11             	add    BYTE PTR [ecx+edx*1],bl
 3200296:	20 03                	and    BYTE PTR [ebx],al
 3200298:	0a 00                	or     al,BYTE PTR [eax]
 320029a:	00 00                	add    BYTE PTR [eax],al
 320029c:	62 00                	bound  eax,QWORD PTR [eax]
 320029e:	00 00                	add    BYTE PTR [eax],al
 32002a0:	0b 00                	or     eax,DWORD PTR [eax]
 32002a2:	00 00                	add    BYTE PTR [eax],al
 32002a4:	10 00                	adc    BYTE PTR [eax],al
 32002a6:	00 00                	add    BYTE PTR [eax],al
 32002a8:	15 00 00 00 00       	adc    eax,0x0
 32002ad:	00 00                	add    BYTE PTR [eax],al
 32002af:	00 03                	add    BYTE PTR [ebx],al
 32002b1:	00 00                	add    BYTE PTR [eax],al
 32002b3:	00 00                	add    BYTE PTR [eax],al
 32002b5:	03 20                	add    esp,DWORD PTR [eax]
 32002b7:	03 02                	add    eax,DWORD PTR [edx]
 32002b9:	00 00                	add    BYTE PTR [eax],al
 32002bb:	00 40 00             	add    BYTE PTR [eax+0x0],al
 32002be:	00 00                	add    BYTE PTR [eax],al
 32002c0:	14 00                	adc    al,0x0
 32002c2:	00 00                	add    BYTE PTR [eax],al
 32002c4:	11 00                	adc    DWORD PTR [eax],eax
 32002c6:	00 00                	add    BYTE PTR [eax],al
 32002c8:	17                   	pop    ss
 32002c9:	00 00                	add    BYTE PTR [eax],al
 32002cb:	00 9c 12 20 03 00 00 	add    BYTE PTR [edx+edx*1+0x320],bl
	...

Disassembly of section .got.plt:

03200300 <_GLOBAL_OFFSET_TABLE_>:
 3200300:	70 02                	jo     3200304 <_GLOBAL_OFFSET_TABLE_+0x4>
 3200302:	20 03                	and    BYTE PTR [ebx],al
	...
 320030c:	f6 01 20             	test   BYTE PTR [ecx],0x20
 320030f:	03 06                	add    eax,DWORD PTR [esi]
 3200311:	02 20                	add    ah,BYTE PTR [eax]
 3200313:	03 16                	add    edx,DWORD PTR [esi]
 3200315:	02 20                	add    ah,BYTE PTR [eax]
 3200317:	03 26                	add    esp,DWORD PTR [esi]
 3200319:	02 20                	add    ah,BYTE PTR [eax]
 320031b:	03 36                	add    esi,DWORD PTR [esi]
 320031d:	02 20                	add    ah,BYTE PTR [eax]
 320031f:	03 46 02             	add    eax,DWORD PTR [esi+0x2]
 3200322:	20 03                	and    BYTE PTR [ebx],al
 3200324:	56                   	push   esi
 3200325:	02 20                	add    ah,BYTE PTR [eax]
 3200327:	03 66 02             	add    esp,DWORD PTR [esi+0x2]
 320032a:	20 03                	and    BYTE PTR [ebx],al

Disassembly of section .rodata:

03201000 <.rodata>:
 3201000:	50                   	push   eax
 3201001:	61                   	popa   
 3201002:	72 61                	jb     3201065 <_GLOBAL_OFFSET_TABLE_+0xd65>
 3201004:	6d                   	ins    DWORD PTR es:[edi],dx
 3201005:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 3201008:	75 6e                	jne    3201078 <_GLOBAL_OFFSET_TABLE_+0xd78>
 320100a:	74 3d                	je     3201049 <_GLOBAL_OFFSET_TABLE_+0xd49>
 320100c:	25 75 0a 00 50       	and    eax,0x50000a75
 3201011:	61                   	popa   
 3201012:	72 61                	jb     3201075 <_GLOBAL_OFFSET_TABLE_+0xd75>
 3201014:	6d                   	ins    DWORD PTR es:[edi],dx
 3201015:	20 25 75 3d 25 73    	and    BYTE PTR ds:0x73253d75,ah
 320101b:	0a 00                	or     al,BYTE PTR [eax]
 320101d:	00 00                	add    BYTE PTR [eax],al
 320101f:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3201022:	72 6f                	jb     3201093 <_GLOBAL_OFFSET_TABLE_+0xd93>
 3201024:	72 3a                	jb     3201060 <_GLOBAL_OFFSET_TABLE_+0xd60>
 3201026:	20 4e 6f             	and    BYTE PTR [esi+0x6f],cl
 3201029:	74 20                	je     320104b <_GLOBAL_OFFSET_TABLE_+0xd4b>
 320102b:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 320102d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320102e:	75 67                	jne    3201097 <_GLOBAL_OFFSET_TABLE_+0xd97>
 3201030:	68 20 70 61 72       	push   0x72617020
 3201035:	61                   	popa   
 3201036:	6d                   	ins    DWORD PTR es:[edi],dx
 3201037:	65                   	gs
 3201038:	74 65                	je     320109f <_GLOBAL_OFFSET_TABLE_+0xd9f>
 320103a:	72 73                	jb     32010af <_GLOBAL_OFFSET_TABLE_+0xdaf>
 320103c:	20 73 75             	and    BYTE PTR [ebx+0x75],dh
 320103f:	70 70                	jo     32010b1 <_GLOBAL_OFFSET_TABLE_+0xdb1>
 3201041:	6c                   	ins    BYTE PTR es:[edi],dx
 3201042:	69 65 64 2c 20 6d 75 	imul   esp,DWORD PTR [ebp+0x64],0x756d202c
 3201049:	73 74                	jae    32010bf <_GLOBAL_OFFSET_TABLE_+0xdbf>
 320104b:	20 70 61             	and    BYTE PTR [eax+0x61],dh
 320104e:	73 73                	jae    32010c3 <_GLOBAL_OFFSET_TABLE_+0xdc3>
 3201050:	20 70 61             	and    BYTE PTR [eax+0x61],dh
 3201053:	74 68                	je     32010bd <_GLOBAL_OFFSET_TABLE_+0xdbd>
 3201055:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 3201059:	70 72                	jo     32010cd <_GLOBAL_OFFSET_TABLE_+0xdcd>
 320105b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320105c:	67 72 61             	addr16 jb 32010c0 <_GLOBAL_OFFSET_TABLE_+0xdc0>
 320105f:	6d                   	ins    DWORD PTR es:[edi],dx
 3201060:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 3201064:	62 65 20             	bound  esp,QWORD PTR [ebp+0x20]
 3201067:	72 75                	jb     32010de <_GLOBAL_OFFSET_TABLE_+0xdde>
 3201069:	6e                   	outs   dx,BYTE PTR ds:[esi]
 320106a:	0a 00                	or     al,BYTE PTR [eax]
 320106c:	45                   	inc    ebp
 320106d:	72 72                	jb     32010e1 <_GLOBAL_OFFSET_TABLE_+0xde1>
 320106f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3201070:	72 20                	jb     3201092 <_GLOBAL_OFFSET_TABLE_+0xd92>
 3201072:	65                   	gs
 3201073:	78 65                	js     32010da <_GLOBAL_OFFSET_TABLE_+0xdda>
 3201075:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3201078:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 320107f:	00 45 6c             	add    BYTE PTR [ebp+0x6c],al
 3201082:	61                   	popa   
 3201083:	70 73                	jo     32010f8 <_GLOBAL_OFFSET_TABLE_+0xdf8>
 3201085:	65 64 20 74 69 63    	gs and BYTE PTR fs:gs:[ecx+ebp*2+0x63],dh
 320108b:	6b 73 20 3d          	imul   esi,DWORD PTR [ebx+0x20],0x3d
 320108f:	20 25 75 0a 00 45    	and    BYTE PTR ds:0x45000a75,ah
 3201095:	6c                   	ins    BYTE PTR es:[edi],dx
 3201096:	61                   	popa   
 3201097:	70 73                	jo     320110c <_GLOBAL_OFFSET_TABLE_+0xe0c>
 3201099:	65 64 20 74 69 6d    	gs and BYTE PTR fs:gs:[ecx+ebp*2+0x6d],dh
 320109f:	65 20 3d 20 25 30 32 	and    BYTE PTR gs:0x32302520,bh
 32010a6:	75 3a                	jne    32010e2 <_GLOBAL_OFFSET_TABLE_+0xde2>
 32010a8:	25 30 32 75 3a       	and    eax,0x3a753230
 32010ad:	25 30 32 75 2e       	and    eax,0x2e753230
 32010b2:	25 30 33 75 0a       	and    eax,0xa753330
	...

Disassembly of section .eh_frame:

032010b8 <.eh_frame>:
 32010b8:	14 00                	adc    al,0x0
 32010ba:	00 00                	add    BYTE PTR [eax],al
 32010bc:	00 00                	add    BYTE PTR [eax],al
 32010be:	00 00                	add    BYTE PTR [eax],al
 32010c0:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 32010c3:	00 01                	add    BYTE PTR [ecx],al
 32010c5:	7c 08                	jl     32010cf <_GLOBAL_OFFSET_TABLE_+0xdcf>
 32010c7:	01 1b                	add    DWORD PTR [ebx],ebx
 32010c9:	0c 04                	or     al,0x4
 32010cb:	04 88                	add    al,0x88
 32010cd:	01 00                	add    DWORD PTR [eax],eax
 32010cf:	00 34 00             	add    BYTE PTR [eax+eax*1],dh
 32010d2:	00 00                	add    BYTE PTR [eax],al
 32010d4:	1c 00                	sbb    al,0x0
 32010d6:	00 00                	add    BYTE PTR [eax],al
 32010d8:	28 ef                	sub    bh,ch
 32010da:	ff                   	(bad)  
 32010db:	ff d6                	call   esi
 32010dd:	01 00                	add    DWORD PTR [eax],eax
 32010df:	00 00                	add    BYTE PTR [eax],al
 32010e1:	44                   	inc    esp
 32010e2:	0c 01                	or     al,0x1
 32010e4:	00 47 10             	add    BYTE PTR [edi+0x10],al
 32010e7:	05 02 75 00 44       	add    eax,0x44007502
 32010ec:	0f 03 75 78          	lsl    esi,WORD PTR [ebp+0x78]
 32010f0:	06                   	push   es
 32010f1:	10 03                	adc    BYTE PTR [ebx],al
 32010f3:	02 75 7c             	add    dh,BYTE PTR [ebp+0x7c]
 32010f6:	03 c1                	add    eax,ecx
 32010f8:	01 c1                	add    ecx,eax
 32010fa:	0c 01                	or     al,0x1
 32010fc:	00 41 c3             	add    BYTE PTR [ecx-0x3d],al
 32010ff:	41                   	inc    ecx
 3201100:	c5 43 0c             	lds    eax,FWORD PTR [ebx+0xc]
 3201103:	04 04                	add    al,0x4
 3201105:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .interp:

03201108 <.interp>:
 3201108:	2f                   	das    
 3201109:	6c                   	ins    BYTE PTR es:[edi],dx
 320110a:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3201111:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3201118:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

0320111c <.dynsym>:
	...
 320112c:	09 00                	or     DWORD PTR [eax],eax
	...
 3201136:	00 00                	add    BYTE PTR [eax],al
 3201138:	12 00                	adc    al,BYTE PTR [eax]
 320113a:	00 00                	add    BYTE PTR [eax],al
 320113c:	10 00                	adc    BYTE PTR [eax],al
	...
 3201146:	00 00                	add    BYTE PTR [eax],al
 3201148:	12 00                	adc    al,BYTE PTR [eax]
 320114a:	00 00                	add    BYTE PTR [eax],al
 320114c:	18 00                	sbb    BYTE PTR [eax],al
	...
 3201156:	00 00                	add    BYTE PTR [eax],al
 3201158:	12 00                	adc    al,BYTE PTR [eax]
 320115a:	00 00                	add    BYTE PTR [eax],al
 320115c:	1e                   	push   ds
	...
 3201165:	00 00                	add    BYTE PTR [eax],al
 3201167:	00 12                	add    BYTE PTR [edx],dl
 3201169:	00 00                	add    BYTE PTR [eax],al
 320116b:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
 3201171:	00 00                	add    BYTE PTR [eax],al
 3201173:	00 00                	add    BYTE PTR [eax],al
 3201175:	00 00                	add    BYTE PTR [eax],al
 3201177:	00 12                	add    BYTE PTR [edx],dl
 3201179:	00 00                	add    BYTE PTR [eax],al
 320117b:	00 2e                	add    BYTE PTR [esi],ch
	...
 3201185:	00 00                	add    BYTE PTR [eax],al
 3201187:	00 12                	add    BYTE PTR [edx],dl
 3201189:	00 00                	add    BYTE PTR [eax],al
 320118b:	00 33                	add    BYTE PTR [ebx],dh
	...
 3201195:	00 00                	add    BYTE PTR [eax],al
 3201197:	00 12                	add    BYTE PTR [edx],dl
 3201199:	00 00                	add    BYTE PTR [eax],al
 320119b:	00 38                	add    BYTE PTR [eax],bh
	...
 32011a5:	00 00                	add    BYTE PTR [eax],al
 32011a7:	00 12                	add    BYTE PTR [edx],dl
 32011a9:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

032011ac <.dynstr>:
 32011ac:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 32011b0:	63 2e                	arpl   WORD PTR [esi],bp
 32011b2:	73 6f                	jae    3201223 <_GLOBAL_OFFSET_TABLE_+0xf23>
 32011b4:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 32011b7:	72 63                	jb     320121c <_GLOBAL_OFFSET_TABLE_+0xf1c>
 32011b9:	70 79                	jo     3201234 <_GLOBAL_OFFSET_TABLE_+0xf34>
 32011bb:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 32011be:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 32011c5:	72 
 32011c6:	69 6e 74 00 6d 61 6c 	imul   ebp,DWORD PTR [esi+0x74],0x6c616d00
 32011cd:	6c                   	ins    BYTE PTR es:[edi],dx
 32011ce:	6f                   	outs   dx,DWORD PTR ds:[esi]
 32011cf:	63 00                	arpl   WORD PTR [eax],ax
 32011d1:	67 6d                	ins    DWORD PTR es:[di],dx
 32011d3:	74 69                	je     320123e <_GLOBAL_OFFSET_TABLE_+0xf3e>
 32011d5:	6d                   	ins    DWORD PTR es:[edi],dx
 32011d6:	65                   	gs
 32011d7:	5f                   	pop    edi
 32011d8:	72 00                	jb     32011da <_GLOBAL_OFFSET_TABLE_+0xeda>
 32011da:	65                   	gs
 32011db:	78 65                	js     3201242 <_GLOBAL_OFFSET_TABLE_+0xf42>
 32011dd:	63 00                	arpl   WORD PTR [eax],ax
 32011df:	74 69                	je     320124a <_GLOBAL_OFFSET_TABLE_+0xf4a>
 32011e1:	6d                   	ins    DWORD PTR es:[edi],dx
 32011e2:	65 00 66 72          	add    BYTE PTR gs:[esi+0x72],ah
 32011e6:	65 65 00 2e          	gs add BYTE PTR gs:[esi],ch
 32011ea:	2e                   	cs
 32011eb:	2f                   	das    
 32011ec:	6c                   	ins    BYTE PTR es:[edi],dx
 32011ed:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 32011f4:	4f                   	dec    edi
 32011f5:	53                   	push   ebx
 32011f6:	2f                   	das    
 32011f7:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 32011fe:	62 
 32011ff:	75 67                	jne    3201268 <_GLOBAL_OFFSET_TABLE_+0xf68>
 3201201:	2f                   	das    
 3201202:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 3201205:	73 73                	jae    320127a <_GLOBAL_OFFSET_TABLE_+0xf7a>
 3201207:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 320120c:	78 00                	js     320120e <_GLOBAL_OFFSET_TABLE_+0xf0e>

Disassembly of section .hash:

03201210 <.hash>:
 3201210:	03 00                	add    eax,DWORD PTR [eax]
 3201212:	00 00                	add    BYTE PTR [eax],al
 3201214:	09 00                	or     DWORD PTR [eax],eax
 3201216:	00 00                	add    BYTE PTR [eax],al
 3201218:	00 00                	add    BYTE PTR [eax],al
 320121a:	00 00                	add    BYTE PTR [eax],al
 320121c:	08 00                	or     BYTE PTR [eax],al
 320121e:	00 00                	add    BYTE PTR [eax],al
 3201220:	07                   	pop    es
	...
 3201229:	00 00                	add    BYTE PTR [eax],al
 320122b:	00 01                	add    BYTE PTR [ecx],al
 320122d:	00 00                	add    BYTE PTR [eax],al
 320122f:	00 02                	add    BYTE PTR [edx],al
 3201231:	00 00                	add    BYTE PTR [eax],al
 3201233:	00 03                	add    BYTE PTR [ebx],al
 3201235:	00 00                	add    BYTE PTR [eax],al
 3201237:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 320123a:	00 00                	add    BYTE PTR [eax],al
 320123c:	00 00                	add    BYTE PTR [eax],al
 320123e:	00 00                	add    BYTE PTR [eax],al
 3201240:	05 00 00 00 06       	add    eax,0x6000000
 3201245:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03201248 <.eh_frame>:
 3201248:	14 00                	adc    al,0x0
 320124a:	00 00                	add    BYTE PTR [eax],al
 320124c:	00 00                	add    BYTE PTR [eax],al
 320124e:	00 00                	add    BYTE PTR [eax],al
 3201250:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3201253:	00 01                	add    BYTE PTR [ecx],al
 3201255:	7c 08                	jl     320125f <_GLOBAL_OFFSET_TABLE_+0xf5f>
 3201257:	01 1b                	add    DWORD PTR [ebx],ebx
 3201259:	0c 04                	or     al,0x4
 320125b:	04 88                	add    al,0x88
 320125d:	01 00                	add    DWORD PTR [eax],eax
 320125f:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3201262:	00 00                	add    BYTE PTR [eax],al
 3201264:	1c 00                	sbb    al,0x0
 3201266:	00 00                	add    BYTE PTR [eax],al
 3201268:	78 ef                	js     3201259 <_GLOBAL_OFFSET_TABLE_+0xf59>
 320126a:	ff                   	(bad)  
 320126b:	ff 90 00 00 00 00    	call   DWORD PTR [eax+0x0]
 3201271:	0e                   	push   cs
 3201272:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3201275:	0c 4a                	or     al,0x4a
 3201277:	0f 0b                	ud2    
 3201279:	74 04                	je     320127f <_GLOBAL_OFFSET_TABLE_+0xf7f>
 320127b:	78 00                	js     320127d <_GLOBAL_OFFSET_TABLE_+0xf7d>
 320127d:	3f                   	aas    
 320127e:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3201280:	2a 32                	sub    dh,BYTE PTR [edx]
 3201282:	24 22                	and    al,0x22
 3201284:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03201288 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3201288:	01 1b                	add    DWORD PTR [ebx],ebx
 320128a:	03 3b                	add    edi,DWORD PTR [ebx]
 320128c:	2c fe                	sub    al,0xfe
 320128e:	ff                   	(bad)  
 320128f:	ff 01                	inc    DWORD PTR [ecx]
 3201291:	00 00                	add    BYTE PTR [eax],al
 3201293:	00 78 ed             	add    BYTE PTR [eax-0x13],bh
 3201296:	ff                   	(bad)  
 3201297:	ff 48 fe             	dec    DWORD PTR [eax-0x2]
 320129a:	ff                   	(bad)  
 320129b:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

0320129c <.rel.dyn>:
 320129c:	0c 03                	or     al,0x3
 320129e:	20 03                	and    BYTE PTR [ebx],al
 32012a0:	07                   	pop    es
 32012a1:	01 00                	add    DWORD PTR [eax],eax
 32012a3:	00 10                	add    BYTE PTR [eax],dl
 32012a5:	03 20                	add    esp,DWORD PTR [eax]
 32012a7:	03 07                	add    eax,DWORD PTR [edi]
 32012a9:	02 00                	add    al,BYTE PTR [eax]
 32012ab:	00 14 03             	add    BYTE PTR [ebx+eax*1],dl
 32012ae:	20 03                	and    BYTE PTR [ebx],al
 32012b0:	07                   	pop    es
 32012b1:	03 00                	add    eax,DWORD PTR [eax]
 32012b3:	00 18                	add    BYTE PTR [eax],bl
 32012b5:	03 20                	add    esp,DWORD PTR [eax]
 32012b7:	03 07                	add    eax,DWORD PTR [edi]
 32012b9:	04 00                	add    al,0x0
 32012bb:	00 1c 03             	add    BYTE PTR [ebx+eax*1],bl
 32012be:	20 03                	and    BYTE PTR [ebx],al
 32012c0:	07                   	pop    es
 32012c1:	05 00 00 20 03       	add    eax,0x3200000
 32012c6:	20 03                	and    BYTE PTR [ebx],al
 32012c8:	07                   	pop    es
 32012c9:	06                   	push   es
 32012ca:	00 00                	add    BYTE PTR [eax],al
 32012cc:	24 03                	and    al,0x3
 32012ce:	20 03                	and    BYTE PTR [ebx],al
 32012d0:	07                   	pop    es
 32012d1:	07                   	pop    es
 32012d2:	00 00                	add    BYTE PTR [eax],al
 32012d4:	28 03                	sub    BYTE PTR [ebx],al
 32012d6:	20 03                	and    BYTE PTR [ebx],al
 32012d8:	07                   	pop    es
 32012d9:	08 00                	or     BYTE PTR [eax],al
	...

Disassembly of section .bss:

03202000 <heapEnd>:
 3202000:	00 00                	add    BYTE PTR [eax],al
	...

03202004 <heapBase>:
 3202004:	00 00                	add    BYTE PTR [eax],al
	...

03202008 <heapCurr>:
 3202008:	00 00                	add    BYTE PTR [eax],al
	...

0320200c <libcTZ>:
 320200c:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	41                   	inc    ecx
   1:	02 00                	add    al,BYTE PTR [eax]
   3:	00 04 00             	add    BYTE PTR [eax+eax*1],al
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	ce                   	into   
   d:	00 00                	add    BYTE PTR [eax],al
   f:	00 0c 68             	add    BYTE PTR [eax+ebp*2],cl
  12:	00 00                	add    BYTE PTR [eax],al
  14:	00 6d 01             	add    BYTE PTR [ebp+0x1],ch
  17:	00 00                	add    BYTE PTR [eax],al
  19:	00 00                	add    BYTE PTR [eax],al
  1b:	20 03                	and    BYTE PTR [ebx],al
  1d:	d6                   	(bad)  
  1e:	01 00                	add    DWORD PTR [eax],eax
  20:	00 00                	add    BYTE PTR [eax],al
  22:	00 00                	add    BYTE PTR [eax],al
  24:	00 02                	add    BYTE PTR [edx],al
  26:	01 06                	add    DWORD PTR [esi],eax
  28:	46                   	inc    esi
  29:	00 00                	add    BYTE PTR [eax],al
  2b:	00 02                	add    BYTE PTR [edx],al
  2d:	01 06                	add    DWORD PTR [esi],eax
  2f:	3f                   	aas    
  30:	00 00                	add    BYTE PTR [eax],al
  32:	00 02                	add    BYTE PTR [edx],al
  34:	02 05 3f 01 00 00    	add    al,BYTE PTR ds:0x13f
  3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  41:	02 08                	add    cl,BYTE PTR [eax]
  43:	05 29 01 00 00       	add    eax,0x129
  48:	02 01                	add    al,BYTE PTR [ecx]
  4a:	08 3d 00 00 00 02    	or     BYTE PTR ds:0x2000000,bh
  50:	02 07                	add    al,BYTE PTR [edi]
  52:	55                   	push   ebp
  53:	00 00                	add    BYTE PTR [eax],al
  55:	00 04 64             	add    BYTE PTR [esp+eiz*2],al
  58:	01 00                	add    DWORD PTR [eax],eax
  5a:	00 02                	add    BYTE PTR [edx],al
  5c:	34 61                	xor    al,0x61
  5e:	00 00                	add    BYTE PTR [eax],al
  60:	00 02                	add    BYTE PTR [edx],al
  62:	04 07                	add    al,0x7
  64:	30 00                	xor    BYTE PTR [eax],al
  66:	00 00                	add    BYTE PTR [eax],al
  68:	02 08                	add    cl,BYTE PTR [eax]
  6a:	07                   	pop    es
  6b:	26 00 00             	add    BYTE PTR es:[eax],al
  6e:	00 02                	add    BYTE PTR [edx],al
  70:	04 05                	add    al,0x5
  72:	2e 01 00             	add    DWORD PTR cs:[eax],eax
  75:	00 02                	add    BYTE PTR [edx],al
  77:	01 02                	add    DWORD PTR [edx],eax
  79:	8b 01                	mov    eax,DWORD PTR [ecx]
  7b:	00 00                	add    BYTE PTR [eax],al
  7d:	04 ba                	add    al,0xba
  7f:	00 00                	add    BYTE PTR [eax],al
  81:	00 03                	add    BYTE PTR [ebx],al
  83:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
  86:	00 00                	add    BYTE PTR [eax],al
  88:	05 74 6d 00 2c       	add    eax,0x2c006d74
  8d:	03 2c 18             	add    ebp,DWORD PTR [eax+ebx*1]
  90:	01 00                	add    DWORD PTR [eax],eax
  92:	00 06                	add    BYTE PTR [esi],al
  94:	87 00                	xchg   DWORD PTR [eax],eax
  96:	00 00                	add    BYTE PTR [eax],al
  98:	03 2e                	add    ebp,DWORD PTR [esi]
  9a:	3a 00                	cmp    al,BYTE PTR [eax]
  9c:	00 00                	add    BYTE PTR [eax],al
  9e:	00 06                	add    BYTE PTR [esi],al
  a0:	80 00 00             	add    BYTE PTR [eax],0x0
  a3:	00 03                	add    BYTE PTR [ebx],al
  a5:	2f                   	das    
  a6:	3a 00                	cmp    al,BYTE PTR [eax]
  a8:	00 00                	add    BYTE PTR [eax],al
  aa:	04 06                	add    al,0x6
  ac:	16                   	push   ss
  ad:	00 00                	add    BYTE PTR [eax],al
  af:	00 03                	add    BYTE PTR [ebx],al
  b1:	30 3a                	xor    BYTE PTR [edx],bh
  b3:	00 00                	add    BYTE PTR [eax],al
  b5:	00 08                	add    BYTE PTR [eax],cl
  b7:	06                   	push   es
  b8:	96                   	xchg   esi,eax
  b9:	01 00                	add    DWORD PTR [eax],eax
  bb:	00 03                	add    BYTE PTR [ebx],al
  bd:	31 3a                	xor    DWORD PTR [edx],edi
  bf:	00 00                	add    BYTE PTR [eax],al
  c1:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
  c4:	84 01                	test   BYTE PTR [ecx],al
  c6:	00 00                	add    BYTE PTR [eax],al
  c8:	03 32                	add    esi,DWORD PTR [edx]
  ca:	3a 00                	cmp    al,BYTE PTR [eax]
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	10 06                	adc    BYTE PTR [esi],al
  d0:	5c                   	pop    esp
  d1:	01 00                	add    DWORD PTR [eax],eax
  d3:	00 03                	add    BYTE PTR [ebx],al
  d5:	33 3a                	xor    edi,DWORD PTR [edx]
  d7:	00 00                	add    BYTE PTR [eax],al
  d9:	00 14 06             	add    BYTE PTR [esi+eax*1],dl
  dc:	07                   	pop    es
  dd:	00 00                	add    BYTE PTR [eax],al
  df:	00 03                	add    BYTE PTR [ebx],al
  e1:	34 3a                	xor    al,0x3a
  e3:	00 00                	add    BYTE PTR [eax],al
  e5:	00 18                	add    BYTE PTR [eax],bl
  e7:	06                   	push   es
  e8:	a0 00 00 00 03       	mov    al,ds:0x3000000
  ed:	35 3a 00 00 00       	xor    eax,0x3a
  f2:	1c 06                	sbb    al,0x6
  f4:	8e 00                	mov    es,WORD PTR [eax]
  f6:	00 00                	add    BYTE PTR [eax],al
  f8:	03 36                	add    esi,DWORD PTR [esi]
  fa:	3a 00                	cmp    al,BYTE PTR [eax]
  fc:	00 00                	add    BYTE PTR [eax],al
  fe:	20 06                	and    BYTE PTR [esi],al
 100:	4b                   	dec    ebx
 101:	00 00                	add    BYTE PTR [eax],al
 103:	00 03                	add    BYTE PTR [ebx],al
 105:	37                   	aaa    
 106:	6f                   	outs   dx,DWORD PTR ds:[esi]
 107:	00 00                	add    BYTE PTR [eax],al
 109:	00 24 06             	add    BYTE PTR [esi+eax*1],ah
 10c:	1e                   	push   ds
 10d:	00 00                	add    BYTE PTR [eax],al
 10f:	00 03                	add    BYTE PTR [ebx],al
 111:	38 18                	cmp    BYTE PTR [eax],bl
 113:	01 00                	add    DWORD PTR [eax],eax
 115:	00 28                	add    BYTE PTR [eax],ch
 117:	00 07                	add    BYTE PTR [edi],al
 119:	04 1e                	add    al,0x1e
 11b:	01 00                	add    DWORD PTR [eax],eax
 11d:	00 08                	add    BYTE PTR [eax],cl
 11f:	25 00 00 00 09       	and    eax,0x9000000
 124:	c1 00 00             	rol    DWORD PTR [eax],0x0
 127:	00 01                	add    BYTE PTR [ecx],al
 129:	13 3a                	adc    edi,DWORD PTR [edx]
 12b:	00 00                	add    BYTE PTR [eax],al
 12d:	00 00                	add    BYTE PTR [eax],al
 12f:	00 20                	add    BYTE PTR [eax],ah
 131:	03 d6                	add    edx,esi
 133:	01 00                	add    DWORD PTR [eax],eax
 135:	00 01                	add    BYTE PTR [ecx],al
 137:	9c                   	pushf  
 138:	ee                   	out    dx,al
 139:	01 00                	add    DWORD PTR [eax],eax
 13b:	00 0a                	add    BYTE PTR [edx],cl
 13d:	91                   	xchg   ecx,eax
 13e:	01 00                	add    DWORD PTR [eax],eax
 140:	00 01                	add    BYTE PTR [ecx],al
 142:	13 3a                	adc    edi,DWORD PTR [edx]
 144:	00 00                	add    BYTE PTR [eax],al
 146:	00 02                	add    BYTE PTR [edx],al
 148:	91                   	xchg   ecx,eax
 149:	00 0a                	add    BYTE PTR [edx],cl
 14b:	73 00                	jae    14d <main-0x31ffeb3>
 14d:	00 00                	add    BYTE PTR [eax],al
 14f:	01 13                	add    DWORD PTR [ebx],edx
 151:	ee                   	out    dx,al
 152:	01 00                	add    DWORD PTR [eax],eax
 154:	00 02                	add    BYTE PTR [edx],al
 156:	91                   	xchg   ecx,eax
 157:	04 0b                	add    al,0xb
 159:	70 69                	jo     1c4 <main-0x31ffe3c>
 15b:	64 00 01             	add    BYTE PTR fs:[ecx],al
 15e:	15 3a 00 00 00       	adc    eax,0x3a
 163:	02 75 6c             	add    dh,BYTE PTR [ebp+0x6c]
 166:	0c a8                	or     al,0xa8
 168:	00 00                	add    BYTE PTR [eax],al
 16a:	00 01                	add    BYTE PTR [ecx],al
 16c:	16                   	push   ss
 16d:	fa                   	cli    
 16e:	01 00                	add    DWORD PTR [eax],eax
 170:	00 02                	add    BYTE PTR [edx],al
 172:	75 5c                	jne    1d0 <main-0x31ffe30>
 174:	0c 49                	or     al,0x49
 176:	01 00                	add    DWORD PTR [eax],eax
 178:	00 01                	add    BYTE PTR [ecx],al
 17a:	17                   	pop    ss
 17b:	7d 00                	jge    17d <main-0x31ffe83>
 17d:	00 00                	add    BYTE PTR [eax],al
 17f:	02 75 64             	add    dh,BYTE PTR [ebp+0x64]
 182:	0c 37                	or     al,0x37
 184:	01 00                	add    DWORD PTR [eax],eax
 186:	00 01                	add    BYTE PTR [ecx],al
 188:	17                   	pop    ss
 189:	7d 00                	jge    18b <main-0x31ffe75>
 18b:	00 00                	add    BYTE PTR [eax],al
 18d:	02 75 60             	add    dh,BYTE PTR [ebp+0x60]
 190:	0c b2                	or     al,0xb2
 192:	00 00                	add    BYTE PTR [eax],al
 194:	00 01                	add    BYTE PTR [ecx],al
 196:	17                   	pop    ss
 197:	7d 00                	jge    199 <main-0x31ffe67>
 199:	00 00                	add    BYTE PTR [eax],al
 19b:	02 75 54             	add    dh,BYTE PTR [ebp+0x54]
 19e:	0c 0f                	or     al,0xf
 1a0:	00 00                	add    BYTE PTR [eax],al
 1a2:	00 01                	add    BYTE PTR [ecx],al
 1a4:	18 3a                	sbb    BYTE PTR [edx],bh
 1a6:	00 00                	add    BYTE PTR [eax],al
 1a8:	00 02                	add    BYTE PTR [edx],al
 1aa:	75 74                	jne    220 <main-0x31ffde0>
 1ac:	0c c6                	or     al,0xc6
 1ae:	00 00                	add    BYTE PTR [eax],al
 1b0:	00 01                	add    BYTE PTR [ecx],al
 1b2:	24 f4                	and    al,0xf4
 1b4:	01 00                	add    DWORD PTR [eax],eax
 1b6:	00 02                	add    BYTE PTR [edx],al
 1b8:	75 68                	jne    222 <main-0x31ffdde>
 1ba:	0d 34 00 20 03       	or     eax,0x3200034
 1bf:	39 00                	cmp    DWORD PTR [eax],eax
 1c1:	00 00                	add    BYTE PTR [eax],al
 1c3:	d6                   	(bad)  
 1c4:	01 00                	add    DWORD PTR [eax],eax
 1c6:	00 0b                	add    BYTE PTR [ebx],cl
 1c8:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 1cb:	00 01                	add    BYTE PTR [ecx],al
 1cd:	1c 3a                	sbb    al,0x3a
 1cf:	00 00                	add    BYTE PTR [eax],al
 1d1:	00 02                	add    BYTE PTR [edx],al
 1d3:	75 70                	jne    245 <main-0x31ffdbb>
 1d5:	00 0e                	add    BYTE PTR [esi],cl
 1d7:	fb                   	sti    
 1d8:	00 20                	add    BYTE PTR [eax],ah
 1da:	03 c0                	add    eax,eax
 1dc:	00 00                	add    BYTE PTR [eax],al
 1de:	00 0b                	add    BYTE PTR [ebx],cl
 1e0:	6d                   	ins    DWORD PTR es:[edi],dx
 1e1:	73 00                	jae    1e3 <main-0x31ffe1d>
 1e3:	01 34 3a             	add    DWORD PTR [edx+edi*1],esi
 1e6:	00 00                	add    BYTE PTR [eax],al
 1e8:	00 02                	add    BYTE PTR [edx],al
 1ea:	75 58                	jne    244 <main-0x31ffdbc>
 1ec:	00 00                	add    BYTE PTR [eax],al
 1ee:	07                   	pop    es
 1ef:	04 f4                	add    al,0xf4
 1f1:	01 00                	add    DWORD PTR [eax],eax
 1f3:	00 07                	add    BYTE PTR [edi],al
 1f5:	04 25                	add    al,0x25
 1f7:	00 00                	add    BYTE PTR [eax],al
 1f9:	00 07                	add    BYTE PTR [edi],al
 1fb:	04 88                	add    al,0x88
 1fd:	00 00                	add    BYTE PTR [eax],al
 1ff:	00 0f                	add    BYTE PTR [edi],cl
 201:	53                   	push   ebx
 202:	01 00                	add    DWORD PTR [eax],eax
 204:	00 04 32             	add    BYTE PTR [edx+esi*1],al
 207:	56                   	push   esi
 208:	00 00                	add    BYTE PTR [eax],al
 20a:	00 05 03 04 20 20    	add    BYTE PTR ds:0x20200403,al
 210:	03 0f                	add    ecx,DWORD PTR [edi]
 212:	97                   	xchg   edi,eax
 213:	00 00                	add    BYTE PTR [eax],al
 215:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
 218:	56                   	push   esi
 219:	00 00                	add    BYTE PTR [eax],al
 21b:	00 05 03 08 20 20    	add    BYTE PTR ds:0x20200803,al
 221:	03 0f                	add    ecx,DWORD PTR [edi]
 223:	78 00                	js     225 <main-0x31ffddb>
 225:	00 00                	add    BYTE PTR [eax],al
 227:	04 34                	add    al,0x34
 229:	56                   	push   esi
 22a:	00 00                	add    BYTE PTR [eax],al
 22c:	00 05 03 00 20 20    	add    BYTE PTR ds:0x20200003,al
 232:	03 0f                	add    ecx,DWORD PTR [edi]
 234:	00 00                	add    BYTE PTR [eax],al
 236:	00 00                	add    BYTE PTR [eax],al
 238:	05 35 7d 00 00       	add    eax,0x7d35
 23d:	00 05 03 0c 20 20    	add    BYTE PTR ds:0x20200c03,al
 243:	03 00                	add    eax,DWORD PTR [eax]

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
  35:	00 05 13 01 03 08    	add    BYTE PTR ds:0x8030113,al
  3b:	0b 0b                	or     ecx,DWORD PTR [ebx]
  3d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  3f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  41:	01 13                	add    DWORD PTR [ebx],edx
  43:	00 00                	add    BYTE PTR [eax],al
  45:	06                   	push   es
  46:	0d 00 03 0e 3a       	or     eax,0x3a0e0300
  4b:	0b 3b                	or     edi,DWORD PTR [ebx]
  4d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  50:	38 0b                	cmp    BYTE PTR [ebx],cl
  52:	00 00                	add    BYTE PTR [eax],al
  54:	07                   	pop    es
  55:	0f 00 0b             	str    WORD PTR [ebx]
  58:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  5b:	00 00                	add    BYTE PTR [eax],al
  5d:	08 26                	or     BYTE PTR [esi],ah
  5f:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
  62:	00 00                	add    BYTE PTR [eax],al
  64:	09 2e                	or     DWORD PTR [esi],ebp
  66:	01 3f                	add    DWORD PTR [edi],edi
  68:	19 03                	sbb    DWORD PTR [ebx],eax
  6a:	0e                   	push   cs
  6b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  6d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  6f:	27                   	daa    
  70:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
  73:	11 01                	adc    DWORD PTR [ecx],eax
  75:	12 06                	adc    al,BYTE PTR [esi]
  77:	40                   	inc    eax
  78:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  7e:	00 00                	add    BYTE PTR [eax],al
  80:	0a 05 00 03 0e 3a    	or     al,BYTE PTR ds:0x3a0e0300
  86:	0b 3b                	or     edi,DWORD PTR [ebx]
  88:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  8b:	02 18                	add    bl,BYTE PTR [eax]
  8d:	00 00                	add    BYTE PTR [eax],al
  8f:	0b 34 00             	or     esi,DWORD PTR [eax+eax*1]
  92:	03 08                	add    ecx,DWORD PTR [eax]
  94:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  96:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  98:	49                   	dec    ecx
  99:	13 02                	adc    eax,DWORD PTR [edx]
  9b:	18 00                	sbb    BYTE PTR [eax],al
  9d:	00 0c 34             	add    BYTE PTR [esp+esi*1],cl
  a0:	00 03                	add    BYTE PTR [ebx],al
  a2:	0e                   	push   cs
  a3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  a5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  a7:	49                   	dec    ecx
  a8:	13 02                	adc    eax,DWORD PTR [edx]
  aa:	18 00                	sbb    BYTE PTR [eax],al
  ac:	00 0d 0b 01 11 01    	add    BYTE PTR ds:0x111010b,cl
  b2:	12 06                	adc    al,BYTE PTR [esi]
  b4:	01 13                	add    DWORD PTR [ebx],edx
  b6:	00 00                	add    BYTE PTR [eax],al
  b8:	0e                   	push   cs
  b9:	0b 01                	or     eax,DWORD PTR [ecx]
  bb:	11 01                	adc    DWORD PTR [ecx],eax
  bd:	12 06                	adc    al,BYTE PTR [esi]
  bf:	00 00                	add    BYTE PTR [eax],al
  c1:	0f 34                	sysenter 
  c3:	00 03                	add    BYTE PTR [ebx],al
  c5:	0e                   	push   cs
  c6:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  c8:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  ca:	49                   	dec    ecx
  cb:	13 3f                	adc    edi,DWORD PTR [edi]
  cd:	19 02                	sbb    DWORD PTR [edx],eax
  cf:	18 00                	sbb    BYTE PTR [eax],al
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
  12:	20 03                	and    BYTE PTR [ebx],al
  14:	d6                   	(bad)  
  15:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	f9                   	stc    
   1:	00 00                	add    BYTE PTR [eax],al
   3:	00 02                	add    BYTE PTR [edx],al
   5:	00 aa 00 00 00 01    	add    BYTE PTR [edx+0x1000000],ch
   b:	01 fb                	add    ebx,edi
   d:	0e                   	push   cs
   e:	0d 00 01 01 01       	or     eax,0x1010100
  13:	01 00                	add    DWORD PTR [eax],eax
  15:	00 00                	add    BYTE PTR [eax],al
  17:	01 00                	add    DWORD PTR [eax],eax
  19:	00 01                	add    BYTE PTR [ecx],al
  1b:	2f                   	das    
  1c:	68 6f 6d 65 2f       	push   0x2f656d6f
  21:	79 6f                	jns    92 <main-0x31fff6e>
  23:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
  2a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
  2d:	73 73                	jae    a2 <main-0x31fff5e>
  2f:	2f                   	das    
  30:	6c                   	ins    BYTE PTR es:[edi],dx
  31:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
  38:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
  3e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
  44:	78 2d                	js     73 <main-0x31fff8d>
  46:	67 6e                	outs   dx,BYTE PTR ds:[si]
  48:	75 2f                	jne    79 <main-0x31fff87>
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
  6f:	74 65                	je     d6 <main-0x31fff2a>
  71:	73 74                	jae    e7 <main-0x31fff19>
  73:	74 69                	je     de <main-0x31fff22>
  75:	6d                   	ins    DWORD PTR es:[edi],dx
  76:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax
  7a:	00 00                	add    BYTE PTR [eax],al
  7c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  7f:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
  86:	63 
  87:	2e                   	cs
  88:	68 00 01 00 00       	push   0x100
  8d:	74 69                	je     f8 <main-0x31fff08>
  8f:	6d                   	ins    DWORD PTR es:[edi],dx
  90:	65                   	gs
  91:	2e                   	cs
  92:	68 00 02 00 00       	push   0x200
  97:	6d                   	ins    DWORD PTR es:[edi],dx
  98:	61                   	popa   
  99:	6c                   	ins    BYTE PTR es:[edi],dx
  9a:	6c                   	ins    BYTE PTR es:[edi],dx
  9b:	6f                   	outs   dx,DWORD PTR ds:[esi]
  9c:	63 2e                	arpl   WORD PTR [esi],bp
  9e:	68 00 02 00 00       	push   0x200
  a3:	6c                   	ins    BYTE PTR es:[edi],dx
  a4:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  ab:	4f                   	dec    edi
  ac:	53                   	push   ebx
  ad:	2e                   	cs
  ae:	68 00 02 00 00       	push   0x200
  b3:	00 00                	add    BYTE PTR [eax],al
  b5:	05 02 00 00 20       	add    eax,0x20000002
  ba:	03 03                	add    eax,DWORD PTR [ebx]
  bc:	12 01                	adc    al,BYTE PTR [ecx]
  be:	08 3e                	or     BYTE PTR [esi],bh
  c0:	77 77                	ja     139 <main-0x31ffec7>
  c2:	08 21                	or     BYTE PTR [ecx],ah
  c4:	00 02                	add    BYTE PTR [edx],al
  c6:	04 03                	add    al,0x3
  c8:	91                   	xchg   ecx,eax
  c9:	00 02                	add    BYTE PTR [edx],al
  cb:	04 03                	add    al,0x3
  cd:	02 25 11 00 02 04    	add    ah,BYTE PTR ds:0x4020011
  d3:	01 06                	add    DWORD PTR [esi],eax
  d5:	4a                   	dec    edx
  d6:	06                   	push   es
  d7:	77 5a                	ja     133 <main-0x31ffecd>
  d9:	f3 76 08             	repz jbe e4 <main-0x31fff1c>
  dc:	2f                   	das    
  dd:	08 67 83             	or     BYTE PTR [edi-0x7d],ah
  e0:	08 4b 68             	or     BYTE PTR [ebx+0x68],cl
  e3:	08 83 be e5 83 91    	or     BYTE PTR [ebx-0x6e7c1a42],al
  e9:	f3 08 3d 02 28 13 08 	repz or BYTE PTR ds:0x8132802,bh
  f0:	9f                   	lahf   
  f1:	08 21                	or     BYTE PTR [ecx],ah
  f3:	02 27                	add    ah,BYTE PTR [edi]
  f5:	14 d8                	adc    al,0xd8
  f7:	3d 02 0a 00 01       	cmp    eax,0x1000a02
  fc:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6c                   	ins    BYTE PTR es:[edi],dx
   1:	69 62 63 54 5a 00 74 	imul   esp,DWORD PTR [edx+0x63],0x74005a54
   8:	6d                   	ins    DWORD PTR es:[edi],dx
   9:	5f                   	pop    edi
   a:	77 64                	ja     70 <main-0x31fff90>
   c:	61                   	popa   
   d:	79 00                	jns    f <main-0x31ffff1>
   f:	72 65                	jb     76 <main-0x31fff8a>
  11:	74 56                	je     69 <main-0x31fff97>
  13:	61                   	popa   
  14:	6c                   	ins    BYTE PTR es:[edi],dx
  15:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
  19:	68 6f 75 72 00       	push   0x72756f
  1e:	74 6d                	je     8d <main-0x31fff73>
  20:	5f                   	pop    edi
  21:	7a 6f                	jp     92 <main-0x31fff6e>
  23:	6e                   	outs   dx,BYTE PTR ds:[esi]
  24:	65 00 6c 6f 6e       	add    BYTE PTR gs:[edi+ebp*2+0x6e],ch
  29:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  2d:	6e                   	outs   dx,BYTE PTR ds:[esi]
  2e:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
  32:	73 69                	jae    9d <main-0x31fff63>
  34:	67 6e                	outs   dx,BYTE PTR ds:[si]
  36:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  3b:	74 00                	je     3d <main-0x31fffc3>
  3d:	75 6e                	jne    ad <main-0x31fff53>
  3f:	73 69                	jae    aa <main-0x31fff56>
  41:	67 6e                	outs   dx,BYTE PTR ds:[si]
  43:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
  48:	61                   	popa   
  49:	72 00                	jb     4b <main-0x31fffb5>
  4b:	74 6d                	je     ba <main-0x31fff46>
  4d:	5f                   	pop    edi
  4e:	67 6d                	ins    DWORD PTR es:[di],dx
  50:	74 6f                	je     c1 <main-0x31fff3f>
  52:	66                   	data16
  53:	66                   	data16
  54:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
  57:	6f                   	outs   dx,DWORD PTR ds:[esi]
  58:	72 74                	jb     ce <main-0x31fff32>
  5a:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
  5d:	73 69                	jae    c8 <main-0x31fff38>
  5f:	67 6e                	outs   dx,BYTE PTR ds:[si]
  61:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  66:	74 00                	je     68 <main-0x31fff98>
  68:	74 65                	je     cf <main-0x31fff31>
  6a:	73 74                	jae    e0 <main-0x31fff20>
  6c:	74 69                	je     d7 <main-0x31fff29>
  6e:	6d                   	ins    DWORD PTR es:[edi],dx
  6f:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax
  73:	61                   	popa   
  74:	72 67                	jb     dd <main-0x31fff23>
  76:	76 00                	jbe    78 <main-0x31fff88>
  78:	68 65 61 70 45       	push   0x45706165
  7d:	6e                   	outs   dx,BYTE PTR ds:[esi]
  7e:	64 00 74 6d 5f       	add    BYTE PTR fs:[ebp+ebp*2+0x5f],dh
  83:	6d                   	ins    DWORD PTR es:[edi],dx
  84:	69 6e 00 74 6d 5f 73 	imul   ebp,DWORD PTR [esi+0x0],0x735f6d74
  8b:	65 63 00             	arpl   WORD PTR gs:[eax],ax
  8e:	74 6d                	je     fd <main-0x31fff03>
  90:	5f                   	pop    edi
  91:	69 73 64 73 74 00 68 	imul   esi,DWORD PTR [ebx+0x64],0x68007473
  98:	65                   	gs
  99:	61                   	popa   
  9a:	70 43                	jo     df <main-0x31fff21>
  9c:	75 72                	jne    110 <main-0x31ffef0>
  9e:	72 00                	jb     a0 <main-0x31fff60>
  a0:	74 6d                	je     10f <main-0x31ffef1>
  a2:	5f                   	pop    edi
  a3:	79 64                	jns    109 <main-0x31ffef7>
  a5:	61                   	popa   
  a6:	79 00                	jns    a8 <main-0x31fff58>
  a8:	74 6f                	je     119 <main-0x31ffee7>
  aa:	74 61                	je     10d <main-0x31ffef3>
  ac:	6c                   	ins    BYTE PTR es:[edi],dx
  ad:	54                   	push   esp
  ae:	69 6d 65 00 65 6c 61 	imul   ebp,DWORD PTR [ebp+0x65],0x616c6500
  b5:	70 73                	jo     12a <main-0x31ffed6>
  b7:	65 64 00 74 69 6d    	gs add BYTE PTR fs:gs:[ecx+ebp*2+0x6d],dh
  bd:	65                   	gs
  be:	5f                   	pop    edi
  bf:	74 00                	je     c1 <main-0x31fff3f>
  c1:	6d                   	ins    DWORD PTR es:[edi],dx
  c2:	61                   	popa   
  c3:	69 6e 00 65 78 65 63 	imul   ebp,DWORD PTR [esi+0x0],0x63657865
  ca:	70 67                	jo     133 <main-0x31ffecd>
  cc:	6d                   	ins    DWORD PTR es:[edi],dx
  cd:	00 47 4e             	add    BYTE PTR [edi+0x4e],al
  d0:	55                   	push   ebp
  d1:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  d4:	39 20                	cmp    DWORD PTR [eax],esp
  d6:	35 2e 33 2e 30       	xor    eax,0x302e332e
  db:	20 2d 6d 33 32 20    	and    BYTE PTR ds:0x2032336d,ch
  e1:	2d 6d 61 73 6d       	sub    eax,0x6d73616d
  e6:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  eb:	6c                   	ins    BYTE PTR es:[edi],dx
  ec:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  f2:	65                   	gs
  f3:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  f8:	72 69                	jb     163 <main-0x31ffe9d>
  fa:	63 20                	arpl   WORD PTR [eax],sp
  fc:	2d 6d 61 72 63       	sub    eax,0x6372616d
 101:	68 3d 70 65 6e       	push   0x6e65703d
 106:	74 69                	je     171 <main-0x31ffe8f>
 108:	75 6d                	jne    177 <main-0x31ffe89>
 10a:	70 72                	jo     17e <main-0x31ffe82>
 10c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 10d:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
 113:	74 64                	je     179 <main-0x31ffe87>
 115:	3d 63 39 39 20       	cmp    eax,0x20393963
 11a:	2d 66 66 72 65       	sub    eax,0x65726666
 11f:	65                   	gs
 120:	73 74                	jae    196 <main-0x31ffe6a>
 122:	61                   	popa   
 123:	6e                   	outs   dx,BYTE PTR ds:[esi]
 124:	64 69 6e 67 00 6c 6f 	imul   ebp,DWORD PTR fs:[esi+0x67],0x6e6f6c00
 12b:	6e 
 12c:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 130:	6e                   	outs   dx,BYTE PTR ds:[esi]
 131:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 135:	74 00                	je     137 <main-0x31ffec9>
 137:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 139:	64                   	fs
 13a:	54                   	push   esp
 13b:	69 6d 65 00 73 68 6f 	imul   ebp,DWORD PTR [ebp+0x65],0x6f687300
 142:	72 74                	jb     1b8 <main-0x31ffe48>
 144:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 147:	74 00                	je     149 <main-0x31ffeb7>
 149:	73 74                	jae    1bf <main-0x31ffe41>
 14b:	61                   	popa   
 14c:	72 74                	jb     1c2 <main-0x31ffe3e>
 14e:	54                   	push   esp
 14f:	69 6d 65 00 68 65 61 	imul   ebp,DWORD PTR [ebp+0x65],0x61656800
 156:	70 42                	jo     19a <main-0x31ffe66>
 158:	61                   	popa   
 159:	73 65                	jae    1c0 <main-0x31ffe40>
 15b:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 15f:	79 65                	jns    1c6 <main-0x31ffe3a>
 161:	61                   	popa   
 162:	72 00                	jb     164 <main-0x31ffe9c>
 164:	75 69                	jne    1cf <main-0x31ffe31>
 166:	6e                   	outs   dx,BYTE PTR ds:[esi]
 167:	74 33                	je     19c <main-0x31ffe64>
 169:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 16c:	00 2f                	add    BYTE PTR [edi],ch
 16e:	68 6f 6d 65 2f       	push   0x2f656d6f
 173:	79 6f                	jns    1e4 <main-0x31ffe1c>
 175:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 17c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 17d:	73 2f                	jae    1ae <main-0x31ffe52>
 17f:	74 69                	je     1ea <main-0x31ffe16>
 181:	6d                   	ins    DWORD PTR es:[edi],dx
 182:	65 00 74 6d 5f       	add    BYTE PTR gs:[ebp+ebp*2+0x5f],dh
 187:	6d                   	ins    DWORD PTR es:[edi],dx
 188:	6f                   	outs   dx,DWORD PTR ds:[esi]
 189:	6e                   	outs   dx,BYTE PTR ds:[esi]
 18a:	00 5f 42             	add    BYTE PTR [edi+0x42],bl
 18d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 18e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 18f:	6c                   	ins    BYTE PTR es:[edi],dx
 190:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 193:	67 63 00             	arpl   WORD PTR [bx+si],ax
 196:	74 6d                	je     205 <main-0x31ffdfb>
 198:	5f                   	pop    edi
 199:	6d                   	ins    DWORD PTR es:[edi],dx
 19a:	64                   	fs
 19b:	61                   	popa   
 19c:	79 00                	jns    19e <main-0x31ffe62>

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
