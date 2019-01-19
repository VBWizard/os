
Debug/GNU-Linux/time:     file format elf32-i386


Disassembly of section .text:

03200000 <main>:
main():
/home/yogi/src/os/aproj/time/testtime.c:19
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
/home/yogi/src/os/aproj/time/testtime.c:21

    int pid=0;
 3200014:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/time/testtime.c:26
    struct tm *totalTime;
    time_t startTicks, endTicks, elapsed;
    struct tm *startTime, *endTime;
    char* execpgm;
    int retVal=0;
 320001b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/time/testtime.c:29
    
#ifdef DEBUG
    startTime = malloc(sizeof(struct tm));
 3200022:	83 ec 0c             	sub    esp,0xc
 3200025:	6a 2c                	push   0x2c
 3200027:	e8 04 02 00 00       	call   3200230 <main+0x230>
 320002c:	83 c4 10             	add    esp,0x10
 320002f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/time/testtime.c:30
    endTime = malloc(sizeof(struct tm));
 3200032:	83 ec 0c             	sub    esp,0xc
 3200035:	6a 2c                	push   0x2c
 3200037:	e8 f4 01 00 00       	call   3200230 <main+0x230>
 320003c:	83 c4 10             	add    esp,0x10
 320003f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/time/testtime.c:31
    execpgm = malloc(512);
 3200042:	83 ec 0c             	sub    esp,0xc
 3200045:	68 00 02 00 00       	push   0x200
 320004a:	e8 e1 01 00 00       	call   3200230 <main+0x230>
 320004f:	83 c4 10             	add    esp,0x10
 3200052:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/time/testtime.c:36
//    print("Param count=%u\n",argc);
//    for (int cnt=0;cnt<argc;cnt++)
//        print("Param %u=%s\n",cnt,argv[cnt]);
#endif
    if (argc<2)
 3200055:	83 3b 01             	cmp    DWORD PTR [ebx],0x1
 3200058:	7f 17                	jg     3200071 <main+0x71>
/home/yogi/src/os/aproj/time/testtime.c:38
    {
        print("Error: Not enough parameters supplied, must pass path to program to be run\n");
 320005a:	83 ec 0c             	sub    esp,0xc
 320005d:	68 00 10 20 03       	push   0x3201000
 3200062:	e8 b9 01 00 00       	call   3200220 <main+0x220>
 3200067:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:39
        retVal=-1;
 320006a:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
/home/yogi/src/os/aproj/time/testtime.c:42
    }

    if (retVal==0)
 3200071:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3200075:	75 4e                	jne    32000c5 <main+0xc5>
/home/yogi/src/os/aproj/time/testtime.c:44
    {
        strcpy(execpgm,argv[1]);
 3200077:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 320007a:	83 c0 04             	add    eax,0x4
 320007d:	8b 00                	mov    eax,DWORD PTR [eax]
 320007f:	83 ec 08             	sub    esp,0x8
 3200082:	50                   	push   eax
 3200083:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 3200086:	e8 75 01 00 00       	call   3200200 <main+0x200>
 320008b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:45
        strtrim(execpgm);
 320008e:	83 ec 0c             	sub    esp,0xc
 3200091:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 3200094:	e8 e7 01 00 00       	call   3200280 <main+0x280>
 3200099:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:46
        if (strlen(execpgm)==0)
 320009c:	83 ec 0c             	sub    esp,0xc
 320009f:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 32000a2:	e8 f9 01 00 00       	call   32002a0 <main+0x2a0>
 32000a7:	83 c4 10             	add    esp,0x10
 32000aa:	85 c0                	test   eax,eax
 32000ac:	75 17                	jne    32000c5 <main+0xc5>
/home/yogi/src/os/aproj/time/testtime.c:48
        {
            print("Parameter 2 must be a program name to run\n");
 32000ae:	83 ec 0c             	sub    esp,0xc
 32000b1:	68 4c 10 20 03       	push   0x320104c
 32000b6:	e8 65 01 00 00       	call   3200220 <main+0x220>
 32000bb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:49
            retVal=-2;
 32000be:	c7 45 f4 fe ff ff ff 	mov    DWORD PTR [ebp-0xc],0xfffffffe
/home/yogi/src/os/aproj/time/testtime.c:52
        }
    }
    if (retVal==0)
 32000c5:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 32000c9:	0f 85 e3 00 00 00    	jne    32001b2 <main+0x1b2>
/home/yogi/src/os/aproj/time/testtime.c:55
    {
        //print("executing %s with first parameter at 0x%08X (%u parameters)\n", execpgm, argv[1], argc-1);
        for (int cnt=2;cnt<argc;cnt++)
 32000cf:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [ebp-0x10],0x2
 32000d6:	eb 37                	jmp    320010f <main+0x10f>
/home/yogi/src/os/aproj/time/testtime.c:57 (discriminator 3)
        {
            strcat(execpgm," ");
 32000d8:	83 ec 08             	sub    esp,0x8
 32000db:	68 77 10 20 03       	push   0x3201077
 32000e0:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 32000e3:	e8 58 01 00 00       	call   3200240 <main+0x240>
 32000e8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:58 (discriminator 3)
            strcat(execpgm,argv[cnt]);
 32000eb:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 32000ee:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 32000f5:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 32000f8:	01 d0                	add    eax,edx
 32000fa:	8b 00                	mov    eax,DWORD PTR [eax]
 32000fc:	83 ec 08             	sub    esp,0x8
 32000ff:	50                   	push   eax
 3200100:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 3200103:	e8 38 01 00 00       	call   3200240 <main+0x240>
 3200108:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:55 (discriminator 3)
        }
    }
    if (retVal==0)
    {
        //print("executing %s with first parameter at 0x%08X (%u parameters)\n", execpgm, argv[1], argc-1);
        for (int cnt=2;cnt<argc;cnt++)
 320010b:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/time/testtime.c:55 (discriminator 1)
 320010f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3200112:	3b 03                	cmp    eax,DWORD PTR [ebx]
 3200114:	7c c2                	jl     32000d8 <main+0xd8>
/home/yogi/src/os/aproj/time/testtime.c:60
        {
            strcat(execpgm," ");
            strcat(execpgm,argv[cnt]);
        }
        startTicks=getticks();
 3200116:	e8 35 01 00 00       	call   3200250 <main+0x250>
 320011b:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/aproj/time/testtime.c:61
        gettime(startTime,true);
 320011e:	83 ec 08             	sub    esp,0x8
 3200121:	6a 01                	push   0x1
 3200123:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3200126:	e8 65 01 00 00       	call   3200290 <main+0x290>
 320012b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:64
        //pid=execb(execpgm);
        //Execute the program
        pid = fork();
 320012e:	e8 3d 01 00 00       	call   3200270 <main+0x270>
 3200133:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/time/testtime.c:65
        if (pid==0)
 3200136:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 320013a:	75 18                	jne    3200154 <main+0x154>
/home/yogi/src/os/aproj/time/testtime.c:67
        {
            exec(execpgm, 0, NULL);
 320013c:	83 ec 04             	sub    esp,0x4
 320013f:	6a 00                	push   0x0
 3200141:	6a 00                	push   0x0
 3200143:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 3200146:	e8 15 01 00 00       	call   3200260 <main+0x260>
 320014b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:68
            return;
 320014e:	90                   	nop
 320014f:	e9 8b 00 00 00       	jmp    32001df <main+0x1df>
/home/yogi/src/os/aproj/time/testtime.c:70
        }
        if (pid<0)
 3200154:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3200158:	79 22                	jns    320017c <main+0x17c>
/home/yogi/src/os/aproj/time/testtime.c:72
        {
            print("Error executing %s\n",argv[1]);
 320015a:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 320015d:	83 c0 04             	add    eax,0x4
 3200160:	8b 00                	mov    eax,DWORD PTR [eax]
 3200162:	83 ec 08             	sub    esp,0x8
 3200165:	50                   	push   eax
 3200166:	68 79 10 20 03       	push   0x3201079
 320016b:	e8 b0 00 00 00       	call   3200220 <main+0x220>
 3200170:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:73
            retVal=-3;
 3200173:	c7 45 f4 fd ff ff ff 	mov    DWORD PTR [ebp-0xc],0xfffffffd
 320017a:	eb 36                	jmp    32001b2 <main+0x1b2>
/home/yogi/src/os/aproj/time/testtime.c:77
        }
        else
        {
            waitpid(pid);
 320017c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 320017f:	83 ec 0c             	sub    esp,0xc
 3200182:	50                   	push   eax
 3200183:	e8 88 00 00 00       	call   3200210 <main+0x210>
 3200188:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:78
            endTicks=getticks();
 320018b:	e8 c0 00 00 00       	call   3200250 <main+0x250>
 3200190:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/time/testtime.c:79
            gettime(endTime,true);
 3200193:	83 ec 08             	sub    esp,0x8
 3200196:	6a 01                	push   0x1
 3200198:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 320019b:	e8 f0 00 00 00       	call   3200290 <main+0x290>
 32001a0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:80
            elapsed=(endTicks-startTicks);
 32001a3:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 32001a6:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
 32001a9:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/time/testtime.c:81
            retVal=elapsed;
 32001ac:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 32001af:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/time/testtime.c:93
            //print("Elapsed time = %02u:%02u:%02u.%03u\n",totalTime->tm_hour,totalTime->tm_min,totalTime->tm_sec,ms);
*/
//            free(totalTime);
        }
    }
    free(startTime);
 32001b2:	83 ec 0c             	sub    esp,0xc
 32001b5:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 32001b8:	e8 f3 00 00 00       	call   32002b0 <main+0x2b0>
 32001bd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:94
    free(endTime);
 32001c0:	83 ec 0c             	sub    esp,0xc
 32001c3:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 32001c6:	e8 e5 00 00 00       	call   32002b0 <main+0x2b0>
 32001cb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:95
    free(execpgm);
 32001ce:	83 ec 0c             	sub    esp,0xc
 32001d1:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 32001d4:	e8 d7 00 00 00       	call   32002b0 <main+0x2b0>
 32001d9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:96
    return (retVal);
 32001dc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/src/os/aproj/time/testtime.c:97
}
 32001df:	8d 65 f8             	lea    esp,[ebp-0x8]
 32001e2:	59                   	pop    ecx
 32001e3:	5b                   	pop    ebx
 32001e4:	5d                   	pop    ebp
 32001e5:	8d 61 fc             	lea    esp,[ecx-0x4]
 32001e8:	c3                   	ret    

Disassembly of section .plt:

032001f0 <.plt>:
 32001f0:	ff 35 54 03 20 03    	push   DWORD PTR ds:0x3200354
 32001f6:	ff 25 58 03 20 03    	jmp    DWORD PTR ds:0x3200358
 32001fc:	00 00                	add    BYTE PTR [eax],al
 32001fe:	00 00                	add    BYTE PTR [eax],al
 3200200:	ff 25 5c 03 20 03    	jmp    DWORD PTR ds:0x320035c
 3200206:	68 00 00 00 00       	push   0x0
 320020b:	e9 e0 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200210:	ff 25 60 03 20 03    	jmp    DWORD PTR ds:0x3200360
 3200216:	68 08 00 00 00       	push   0x8
 320021b:	e9 d0 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200220:	ff 25 64 03 20 03    	jmp    DWORD PTR ds:0x3200364
 3200226:	68 10 00 00 00       	push   0x10
 320022b:	e9 c0 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200230:	ff 25 68 03 20 03    	jmp    DWORD PTR ds:0x3200368
 3200236:	68 18 00 00 00       	push   0x18
 320023b:	e9 b0 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200240:	ff 25 6c 03 20 03    	jmp    DWORD PTR ds:0x320036c
 3200246:	68 20 00 00 00       	push   0x20
 320024b:	e9 a0 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200250:	ff 25 70 03 20 03    	jmp    DWORD PTR ds:0x3200370
 3200256:	68 28 00 00 00       	push   0x28
 320025b:	e9 90 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200260:	ff 25 74 03 20 03    	jmp    DWORD PTR ds:0x3200374
 3200266:	68 30 00 00 00       	push   0x30
 320026b:	e9 80 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200270:	ff 25 78 03 20 03    	jmp    DWORD PTR ds:0x3200378
 3200276:	68 38 00 00 00       	push   0x38
 320027b:	e9 70 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200280:	ff 25 7c 03 20 03    	jmp    DWORD PTR ds:0x320037c
 3200286:	68 40 00 00 00       	push   0x40
 320028b:	e9 60 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200290:	ff 25 80 03 20 03    	jmp    DWORD PTR ds:0x3200380
 3200296:	68 48 00 00 00       	push   0x48
 320029b:	e9 50 ff ff ff       	jmp    32001f0 <main+0x1f0>
 32002a0:	ff 25 84 03 20 03    	jmp    DWORD PTR ds:0x3200384
 32002a6:	68 50 00 00 00       	push   0x50
 32002ab:	e9 40 ff ff ff       	jmp    32001f0 <main+0x1f0>
 32002b0:	ff 25 88 03 20 03    	jmp    DWORD PTR ds:0x3200388
 32002b6:	68 58 00 00 00       	push   0x58
 32002bb:	e9 30 ff ff ff       	jmp    32001f0 <main+0x1f0>

Disassembly of section .dynamic:

032002c0 <_DYNAMIC>:
 32002c0:	01 00                	add    DWORD PTR [eax],eax
 32002c2:	00 00                	add    BYTE PTR [eax],al
 32002c4:	01 00                	add    DWORD PTR [eax],eax
 32002c6:	00 00                	add    BYTE PTR [eax],al
 32002c8:	0f 00 00             	sldt   WORD PTR [eax]
 32002cb:	00 5b 00             	add    BYTE PTR [ebx+0x0],bl
 32002ce:	00 00                	add    BYTE PTR [eax],al
 32002d0:	04 00                	add    al,0x0
 32002d2:	00 00                	add    BYTE PTR [eax],al
 32002d4:	44                   	inc    esp
 32002d5:	12 20                	adc    ah,BYTE PTR [eax]
 32002d7:	03 05 00 00 00 c4    	add    eax,DWORD PTR ds:0xc4000000
 32002dd:	11 20                	adc    DWORD PTR [eax],esp
 32002df:	03 06                	add    eax,DWORD PTR [esi]
 32002e1:	00 00                	add    BYTE PTR [eax],al
 32002e3:	00 f4                	add    ah,dh
 32002e5:	10 20                	adc    BYTE PTR [eax],ah
 32002e7:	03 0a                	add    ecx,DWORD PTR [edx]
 32002e9:	00 00                	add    BYTE PTR [eax],al
 32002eb:	00 7e 00             	add    BYTE PTR [esi+0x0],bh
 32002ee:	00 00                	add    BYTE PTR [eax],al
 32002f0:	0b 00                	or     eax,DWORD PTR [eax]
 32002f2:	00 00                	add    BYTE PTR [eax],al
 32002f4:	10 00                	adc    BYTE PTR [eax],al
 32002f6:	00 00                	add    BYTE PTR [eax],al
 32002f8:	15 00 00 00 00       	adc    eax,0x0
 32002fd:	00 00                	add    BYTE PTR [eax],al
 32002ff:	00 03                	add    BYTE PTR [ebx],al
 3200301:	00 00                	add    BYTE PTR [eax],al
 3200303:	00 50 03             	add    BYTE PTR [eax+0x3],dl
 3200306:	20 03                	and    BYTE PTR [ebx],al
 3200308:	02 00                	add    al,BYTE PTR [eax]
 320030a:	00 00                	add    BYTE PTR [eax],al
 320030c:	60                   	pusha  
 320030d:	00 00                	add    BYTE PTR [eax],al
 320030f:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
 3200312:	00 00                	add    BYTE PTR [eax],al
 3200314:	11 00                	adc    DWORD PTR [eax],eax
 3200316:	00 00                	add    BYTE PTR [eax],al
 3200318:	17                   	pop    ss
 3200319:	00 00                	add    BYTE PTR [eax],al
 320031b:	00 e0                	add    al,ah
 320031d:	12 20                	adc    ah,BYTE PTR [eax]
 320031f:	03 00                	add    eax,DWORD PTR [eax]
	...

Disassembly of section .got.plt:

03200350 <_GLOBAL_OFFSET_TABLE_>:
 3200350:	c0 02 20             	rol    BYTE PTR [edx],0x20
 3200353:	03 00                	add    eax,DWORD PTR [eax]
 3200355:	00 00                	add    BYTE PTR [eax],al
 3200357:	00 00                	add    BYTE PTR [eax],al
 3200359:	00 00                	add    BYTE PTR [eax],al
 320035b:	00 06                	add    BYTE PTR [esi],al
 320035d:	02 20                	add    ah,BYTE PTR [eax]
 320035f:	03 16                	add    edx,DWORD PTR [esi]
 3200361:	02 20                	add    ah,BYTE PTR [eax]
 3200363:	03 26                	add    esp,DWORD PTR [esi]
 3200365:	02 20                	add    ah,BYTE PTR [eax]
 3200367:	03 36                	add    esi,DWORD PTR [esi]
 3200369:	02 20                	add    ah,BYTE PTR [eax]
 320036b:	03 46 02             	add    eax,DWORD PTR [esi+0x2]
 320036e:	20 03                	and    BYTE PTR [ebx],al
 3200370:	56                   	push   esi
 3200371:	02 20                	add    ah,BYTE PTR [eax]
 3200373:	03 66 02             	add    esp,DWORD PTR [esi+0x2]
 3200376:	20 03                	and    BYTE PTR [ebx],al
 3200378:	76 02                	jbe    320037c <_GLOBAL_OFFSET_TABLE_+0x2c>
 320037a:	20 03                	and    BYTE PTR [ebx],al
 320037c:	86 02                	xchg   BYTE PTR [edx],al
 320037e:	20 03                	and    BYTE PTR [ebx],al
 3200380:	96                   	xchg   esi,eax
 3200381:	02 20                	add    ah,BYTE PTR [eax]
 3200383:	03 a6 02 20 03 b6    	add    esp,DWORD PTR [esi-0x49fcdffe]
 3200389:	02 20                	add    ah,BYTE PTR [eax]
 320038b:	03                   	.byte 0x3

Disassembly of section .rodata:

03201000 <.rodata>:
 3201000:	45                   	inc    ebp
 3201001:	72 72                	jb     3201075 <_GLOBAL_OFFSET_TABLE_+0xd25>
 3201003:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3201004:	72 3a                	jb     3201040 <_GLOBAL_OFFSET_TABLE_+0xcf0>
 3201006:	20 4e 6f             	and    BYTE PTR [esi+0x6f],cl
 3201009:	74 20                	je     320102b <_GLOBAL_OFFSET_TABLE_+0xcdb>
 320100b:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 320100d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320100e:	75 67                	jne    3201077 <_GLOBAL_OFFSET_TABLE_+0xd27>
 3201010:	68 20 70 61 72       	push   0x72617020
 3201015:	61                   	popa   
 3201016:	6d                   	ins    DWORD PTR es:[edi],dx
 3201017:	65                   	gs
 3201018:	74 65                	je     320107f <_GLOBAL_OFFSET_TABLE_+0xd2f>
 320101a:	72 73                	jb     320108f <_GLOBAL_OFFSET_TABLE_+0xd3f>
 320101c:	20 73 75             	and    BYTE PTR [ebx+0x75],dh
 320101f:	70 70                	jo     3201091 <_GLOBAL_OFFSET_TABLE_+0xd41>
 3201021:	6c                   	ins    BYTE PTR es:[edi],dx
 3201022:	69 65 64 2c 20 6d 75 	imul   esp,DWORD PTR [ebp+0x64],0x756d202c
 3201029:	73 74                	jae    320109f <_GLOBAL_OFFSET_TABLE_+0xd4f>
 320102b:	20 70 61             	and    BYTE PTR [eax+0x61],dh
 320102e:	73 73                	jae    32010a3 <_GLOBAL_OFFSET_TABLE_+0xd53>
 3201030:	20 70 61             	and    BYTE PTR [eax+0x61],dh
 3201033:	74 68                	je     320109d <_GLOBAL_OFFSET_TABLE_+0xd4d>
 3201035:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 3201039:	70 72                	jo     32010ad <_GLOBAL_OFFSET_TABLE_+0xd5d>
 320103b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320103c:	67 72 61             	addr16 jb 32010a0 <_GLOBAL_OFFSET_TABLE_+0xd50>
 320103f:	6d                   	ins    DWORD PTR es:[edi],dx
 3201040:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 3201044:	62 65 20             	bound  esp,QWORD PTR [ebp+0x20]
 3201047:	72 75                	jb     32010be <_GLOBAL_OFFSET_TABLE_+0xd6e>
 3201049:	6e                   	outs   dx,BYTE PTR ds:[esi]
 320104a:	0a 00                	or     al,BYTE PTR [eax]
 320104c:	50                   	push   eax
 320104d:	61                   	popa   
 320104e:	72 61                	jb     32010b1 <_GLOBAL_OFFSET_TABLE_+0xd61>
 3201050:	6d                   	ins    DWORD PTR es:[edi],dx
 3201051:	65                   	gs
 3201052:	74 65                	je     32010b9 <_GLOBAL_OFFSET_TABLE_+0xd69>
 3201054:	72 20                	jb     3201076 <_GLOBAL_OFFSET_TABLE_+0xd26>
 3201056:	32 20                	xor    ah,BYTE PTR [eax]
 3201058:	6d                   	ins    DWORD PTR es:[edi],dx
 3201059:	75 73                	jne    32010ce <_GLOBAL_OFFSET_TABLE_+0xd7e>
 320105b:	74 20                	je     320107d <_GLOBAL_OFFSET_TABLE_+0xd2d>
 320105d:	62 65 20             	bound  esp,QWORD PTR [ebp+0x20]
 3201060:	61                   	popa   
 3201061:	20 70 72             	and    BYTE PTR [eax+0x72],dh
 3201064:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3201065:	67 72 61             	addr16 jb 32010c9 <_GLOBAL_OFFSET_TABLE_+0xd79>
 3201068:	6d                   	ins    DWORD PTR es:[edi],dx
 3201069:	20 6e 61             	and    BYTE PTR [esi+0x61],ch
 320106c:	6d                   	ins    DWORD PTR es:[edi],dx
 320106d:	65 20 74 6f 20       	and    BYTE PTR gs:[edi+ebp*2+0x20],dh
 3201072:	72 75                	jb     32010e9 <_GLOBAL_OFFSET_TABLE_+0xd99>
 3201074:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3201075:	0a 00                	or     al,BYTE PTR [eax]
 3201077:	20 00                	and    BYTE PTR [eax],al
 3201079:	45                   	inc    ebp
 320107a:	72 72                	jb     32010ee <_GLOBAL_OFFSET_TABLE_+0xd9e>
 320107c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320107d:	72 20                	jb     320109f <_GLOBAL_OFFSET_TABLE_+0xd4f>
 320107f:	65                   	gs
 3201080:	78 65                	js     32010e7 <_GLOBAL_OFFSET_TABLE_+0xd97>
 3201082:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3201085:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
	...

Disassembly of section .eh_frame:

03201090 <.eh_frame>:
 3201090:	14 00                	adc    al,0x0
 3201092:	00 00                	add    BYTE PTR [eax],al
 3201094:	00 00                	add    BYTE PTR [eax],al
 3201096:	00 00                	add    BYTE PTR [eax],al
 3201098:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 320109b:	00 01                	add    BYTE PTR [ecx],al
 320109d:	7c 08                	jl     32010a7 <_GLOBAL_OFFSET_TABLE_+0xd57>
 320109f:	01 1b                	add    DWORD PTR [ebx],ebx
 32010a1:	0c 04                	or     al,0x4
 32010a3:	04 88                	add    al,0x88
 32010a5:	01 00                	add    DWORD PTR [eax],eax
 32010a7:	00 34 00             	add    BYTE PTR [eax+eax*1],dh
 32010aa:	00 00                	add    BYTE PTR [eax],al
 32010ac:	1c 00                	sbb    al,0x0
 32010ae:	00 00                	add    BYTE PTR [eax],al
 32010b0:	50                   	push   eax
 32010b1:	ef                   	out    dx,eax
 32010b2:	ff                   	(bad)  
 32010b3:	ff e9                	jmp    <internal disassembler error>
 32010b5:	01 00                	add    DWORD PTR [eax],eax
 32010b7:	00 00                	add    BYTE PTR [eax],al
 32010b9:	44                   	inc    esp
 32010ba:	0c 01                	or     al,0x1
 32010bc:	00 47 10             	add    BYTE PTR [edi+0x10],al
 32010bf:	05 02 75 00 44       	add    eax,0x44007502
 32010c4:	0f 03 75 78          	lsl    esi,WORD PTR [ebp+0x78]
 32010c8:	06                   	push   es
 32010c9:	10 03                	adc    BYTE PTR [ebx],al
 32010cb:	02 75 7c             	add    dh,BYTE PTR [ebp+0x7c]
 32010ce:	03 d4                	add    edx,esp
 32010d0:	01 c1                	add    ecx,eax
 32010d2:	0c 01                	or     al,0x1
 32010d4:	00 41 c3             	add    BYTE PTR [ecx-0x3d],al
 32010d7:	41                   	inc    ecx
 32010d8:	c5 43 0c             	lds    eax,FWORD PTR [ebx+0xc]
 32010db:	04 04                	add    al,0x4
 32010dd:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .interp:

032010e0 <.interp>:
 32010e0:	2f                   	das    
 32010e1:	6c                   	ins    BYTE PTR es:[edi],dx
 32010e2:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 32010e9:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 32010f0:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

032010f4 <.dynsym>:
	...
 3201104:	09 00                	or     DWORD PTR [eax],eax
	...
 320110e:	00 00                	add    BYTE PTR [eax],al
 3201110:	12 00                	adc    al,BYTE PTR [eax]
 3201112:	00 00                	add    BYTE PTR [eax],al
 3201114:	10 00                	adc    BYTE PTR [eax],al
	...
 320111e:	00 00                	add    BYTE PTR [eax],al
 3201120:	12 00                	adc    al,BYTE PTR [eax]
 3201122:	00 00                	add    BYTE PTR [eax],al
 3201124:	18 00                	sbb    BYTE PTR [eax],al
	...
 320112e:	00 00                	add    BYTE PTR [eax],al
 3201130:	12 00                	adc    al,BYTE PTR [eax]
 3201132:	00 00                	add    BYTE PTR [eax],al
 3201134:	1e                   	push   ds
	...
 320113d:	00 00                	add    BYTE PTR [eax],al
 320113f:	00 12                	add    BYTE PTR [edx],dl
 3201141:	00 00                	add    BYTE PTR [eax],al
 3201143:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
 3201149:	00 00                	add    BYTE PTR [eax],al
 320114b:	00 00                	add    BYTE PTR [eax],al
 320114d:	00 00                	add    BYTE PTR [eax],al
 320114f:	00 12                	add    BYTE PTR [edx],dl
 3201151:	00 00                	add    BYTE PTR [eax],al
 3201153:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
	...
 320115e:	00 00                	add    BYTE PTR [eax],al
 3201160:	12 00                	adc    al,BYTE PTR [eax]
 3201162:	00 00                	add    BYTE PTR [eax],al
 3201164:	35 00 00 00 00       	xor    eax,0x0
 3201169:	00 00                	add    BYTE PTR [eax],al
 320116b:	00 00                	add    BYTE PTR [eax],al
 320116d:	00 00                	add    BYTE PTR [eax],al
 320116f:	00 12                	add    BYTE PTR [edx],dl
 3201171:	00 00                	add    BYTE PTR [eax],al
 3201173:	00 3a                	add    BYTE PTR [edx],bh
	...
 320117d:	00 00                	add    BYTE PTR [eax],al
 320117f:	00 12                	add    BYTE PTR [edx],dl
 3201181:	00 00                	add    BYTE PTR [eax],al
 3201183:	00 3f                	add    BYTE PTR [edi],bh
	...
 320118d:	00 00                	add    BYTE PTR [eax],al
 320118f:	00 12                	add    BYTE PTR [edx],dl
 3201191:	00 00                	add    BYTE PTR [eax],al
 3201193:	00 47 00             	add    BYTE PTR [edi+0x0],al
	...
 320119e:	00 00                	add    BYTE PTR [eax],al
 32011a0:	12 00                	adc    al,BYTE PTR [eax]
 32011a2:	00 00                	add    BYTE PTR [eax],al
 32011a4:	4f                   	dec    edi
	...
 32011ad:	00 00                	add    BYTE PTR [eax],al
 32011af:	00 12                	add    BYTE PTR [edx],dl
 32011b1:	00 00                	add    BYTE PTR [eax],al
 32011b3:	00 56 00             	add    BYTE PTR [esi+0x0],dl
	...
 32011be:	00 00                	add    BYTE PTR [eax],al
 32011c0:	12 00                	adc    al,BYTE PTR [eax]
	...

Disassembly of section .dynstr:

032011c4 <.dynstr>:
 32011c4:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 32011c8:	63 2e                	arpl   WORD PTR [esi],bp
 32011ca:	73 6f                	jae    320123b <_GLOBAL_OFFSET_TABLE_+0xeeb>
 32011cc:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 32011cf:	72 63                	jb     3201234 <_GLOBAL_OFFSET_TABLE_+0xee4>
 32011d1:	70 79                	jo     320124c <_GLOBAL_OFFSET_TABLE_+0xefc>
 32011d3:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 32011d6:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 32011dd:	72 
 32011de:	69 6e 74 00 6d 61 6c 	imul   ebp,DWORD PTR [esi+0x74],0x6c616d00
 32011e5:	6c                   	ins    BYTE PTR es:[edi],dx
 32011e6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 32011e7:	63 00                	arpl   WORD PTR [eax],ax
 32011e9:	73 74                	jae    320125f <_GLOBAL_OFFSET_TABLE_+0xf0f>
 32011eb:	72 63                	jb     3201250 <_GLOBAL_OFFSET_TABLE_+0xf00>
 32011ed:	61                   	popa   
 32011ee:	74 00                	je     32011f0 <_GLOBAL_OFFSET_TABLE_+0xea0>
 32011f0:	67                   	addr16
 32011f1:	65                   	gs
 32011f2:	74 74                	je     3201268 <_GLOBAL_OFFSET_TABLE_+0xf18>
 32011f4:	69 63 6b 73 00 65 78 	imul   esp,DWORD PTR [ebx+0x6b],0x78650073
 32011fb:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 32011fe:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3201200:	72 6b                	jb     320126d <_GLOBAL_OFFSET_TABLE_+0xf1d>
 3201202:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3201205:	72 74                	jb     320127b <_GLOBAL_OFFSET_TABLE_+0xf2b>
 3201207:	72 69                	jb     3201272 <_GLOBAL_OFFSET_TABLE_+0xf22>
 3201209:	6d                   	ins    DWORD PTR es:[edi],dx
 320120a:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 320120d:	74 74                	je     3201283 <_GLOBAL_OFFSET_TABLE_+0xf33>
 320120f:	69 6d 65 00 73 74 72 	imul   ebp,DWORD PTR [ebp+0x65],0x72747300
 3201216:	6c                   	ins    BYTE PTR es:[edi],dx
 3201217:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3201219:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 320121c:	65 65 00 2e          	gs add BYTE PTR gs:[esi],ch
 3201220:	2e                   	cs
 3201221:	2f                   	das    
 3201222:	6c                   	ins    BYTE PTR es:[edi],dx
 3201223:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 320122a:	4f                   	dec    edi
 320122b:	53                   	push   ebx
 320122c:	2f                   	das    
 320122d:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3201234:	62 
 3201235:	75 67                	jne    320129e <_GLOBAL_OFFSET_TABLE_+0xf4e>
 3201237:	2f                   	das    
 3201238:	47                   	inc    edi
 3201239:	4e                   	dec    esi
 320123a:	55                   	push   ebp
 320123b:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3201240:	78 00                	js     3201242 <_GLOBAL_OFFSET_TABLE_+0xef2>

Disassembly of section .hash:

03201244 <.hash>:
 3201244:	03 00                	add    eax,DWORD PTR [eax]
 3201246:	00 00                	add    BYTE PTR [eax],al
 3201248:	0d 00 00 00 0a       	or     eax,0xa000000
 320124d:	00 00                	add    BYTE PTR [eax],al
 320124f:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 3201252:	00 00                	add    BYTE PTR [eax],al
 3201254:	08 00                	or     BYTE PTR [eax],al
	...
 320125e:	00 00                	add    BYTE PTR [eax],al
 3201260:	01 00                	add    DWORD PTR [eax],eax
 3201262:	00 00                	add    BYTE PTR [eax],al
 3201264:	02 00                	add    al,BYTE PTR [eax]
 3201266:	00 00                	add    BYTE PTR [eax],al
 3201268:	03 00                	add    eax,DWORD PTR [eax]
	...
 3201272:	00 00                	add    BYTE PTR [eax],al
 3201274:	06                   	push   es
 3201275:	00 00                	add    BYTE PTR [eax],al
 3201277:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 320127a:	00 00                	add    BYTE PTR [eax],al
 320127c:	07                   	pop    es
 320127d:	00 00                	add    BYTE PTR [eax],al
 320127f:	00 05 00 00 00 09    	add    BYTE PTR ds:0x9000000,al
 3201285:	00 00                	add    BYTE PTR [eax],al
 3201287:	00 0b                	add    BYTE PTR [ebx],cl
 3201289:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

0320128c <.eh_frame>:
 320128c:	14 00                	adc    al,0x0
 320128e:	00 00                	add    BYTE PTR [eax],al
 3201290:	00 00                	add    BYTE PTR [eax],al
 3201292:	00 00                	add    BYTE PTR [eax],al
 3201294:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3201297:	00 01                	add    BYTE PTR [ecx],al
 3201299:	7c 08                	jl     32012a3 <_GLOBAL_OFFSET_TABLE_+0xf53>
 320129b:	01 1b                	add    DWORD PTR [ebx],ebx
 320129d:	0c 04                	or     al,0x4
 320129f:	04 88                	add    al,0x88
 32012a1:	01 00                	add    DWORD PTR [eax],eax
 32012a3:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 32012a6:	00 00                	add    BYTE PTR [eax],al
 32012a8:	1c 00                	sbb    al,0x0
 32012aa:	00 00                	add    BYTE PTR [eax],al
 32012ac:	44                   	inc    esp
 32012ad:	ef                   	out    dx,eax
 32012ae:	ff                   	(bad)  
 32012af:	ff d0                	call   eax
 32012b1:	00 00                	add    BYTE PTR [eax],al
 32012b3:	00 00                	add    BYTE PTR [eax],al
 32012b5:	0e                   	push   cs
 32012b6:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 32012b9:	0c 4a                	or     al,0x4a
 32012bb:	0f 0b                	ud2    
 32012bd:	74 04                	je     32012c3 <_GLOBAL_OFFSET_TABLE_+0xf73>
 32012bf:	78 00                	js     32012c1 <_GLOBAL_OFFSET_TABLE_+0xf71>
 32012c1:	3f                   	aas    
 32012c2:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 32012c4:	2a 32                	sub    dh,BYTE PTR [edx]
 32012c6:	24 22                	and    al,0x22
 32012c8:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

032012cc <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 32012cc:	01 1b                	add    DWORD PTR [ebx],ebx
 32012ce:	03 3b                	add    edi,DWORD PTR [ebx]
 32012d0:	c0 fd ff             	sar    ch,0xff
 32012d3:	ff 01                	inc    DWORD PTR [ecx]
 32012d5:	00 00                	add    BYTE PTR [eax],al
 32012d7:	00 34 ed ff ff dc fd 	add    BYTE PTR [ebp*8-0x2230001],dh
 32012de:	ff                   	(bad)  
 32012df:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

032012e0 <.rel.dyn>:
 32012e0:	5c                   	pop    esp
 32012e1:	03 20                	add    esp,DWORD PTR [eax]
 32012e3:	03 07                	add    eax,DWORD PTR [edi]
 32012e5:	01 00                	add    DWORD PTR [eax],eax
 32012e7:	00 60 03             	add    BYTE PTR [eax+0x3],ah
 32012ea:	20 03                	and    BYTE PTR [ebx],al
 32012ec:	07                   	pop    es
 32012ed:	02 00                	add    al,BYTE PTR [eax]
 32012ef:	00 64 03 20          	add    BYTE PTR [ebx+eax*1+0x20],ah
 32012f3:	03 07                	add    eax,DWORD PTR [edi]
 32012f5:	03 00                	add    eax,DWORD PTR [eax]
 32012f7:	00 68 03             	add    BYTE PTR [eax+0x3],ch
 32012fa:	20 03                	and    BYTE PTR [ebx],al
 32012fc:	07                   	pop    es
 32012fd:	04 00                	add    al,0x0
 32012ff:	00 6c 03 20          	add    BYTE PTR [ebx+eax*1+0x20],ch
 3201303:	03 07                	add    eax,DWORD PTR [edi]
 3201305:	05 00 00 70 03       	add    eax,0x3700000
 320130a:	20 03                	and    BYTE PTR [ebx],al
 320130c:	07                   	pop    es
 320130d:	06                   	push   es
 320130e:	00 00                	add    BYTE PTR [eax],al
 3201310:	74 03                	je     3201315 <__GNU_EH_FRAME_HDR+0x49>
 3201312:	20 03                	and    BYTE PTR [ebx],al
 3201314:	07                   	pop    es
 3201315:	07                   	pop    es
 3201316:	00 00                	add    BYTE PTR [eax],al
 3201318:	78 03                	js     320131d <__GNU_EH_FRAME_HDR+0x51>
 320131a:	20 03                	and    BYTE PTR [ebx],al
 320131c:	07                   	pop    es
 320131d:	08 00                	or     BYTE PTR [eax],al
 320131f:	00 7c 03 20          	add    BYTE PTR [ebx+eax*1+0x20],bh
 3201323:	03 07                	add    eax,DWORD PTR [edi]
 3201325:	09 00                	or     DWORD PTR [eax],eax
 3201327:	00 80 03 20 03 07    	add    BYTE PTR [eax+0x7032003],al
 320132d:	0a 00                	or     al,BYTE PTR [eax]
 320132f:	00 84 03 20 03 07 0b 	add    BYTE PTR [ebx+eax*1+0xb070320],al
 3201336:	00 00                	add    BYTE PTR [eax],al
 3201338:	88 03                	mov    BYTE PTR [ebx],al
 320133a:	20 03                	and    BYTE PTR [ebx],al
 320133c:	07                   	pop    es
 320133d:	0c 00                	or     al,0x0
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

0320200c <processEnvp>:
 320200c:	00 00                	add    BYTE PTR [eax],al
	...

03202010 <libcTZ>:
 3202010:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	50                   	push   eax
   1:	02 00                	add    al,BYTE PTR [eax]
   3:	00 04 00             	add    BYTE PTR [eax+eax*1],al
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	70 00                	jo     e <main-0x31ffff2>
   e:	00 00                	add    BYTE PTR [eax],al
  10:	0c 4c                	or     al,0x4c
  12:	01 00                	add    DWORD PTR [eax],eax
  14:	00 a7 01 00 00 00    	add    BYTE PTR [edi+0x1],ah
  1a:	00 20                	add    BYTE PTR [eax],ah
  1c:	03 e9                	add    ebp,ecx
  1e:	01 00                	add    DWORD PTR [eax],eax
  20:	00 00                	add    BYTE PTR [eax],al
  22:	00 00                	add    BYTE PTR [eax],al
  24:	00 02                	add    BYTE PTR [edx],al
  26:	01 06                	add    DWORD PTR [esi],eax
  28:	dd 00                	fld    QWORD PTR [eax]
  2a:	00 00                	add    BYTE PTR [eax],al
  2c:	02 01                	add    al,BYTE PTR [ecx]
  2e:	06                   	push   es
  2f:	d6                   	(bad)  
  30:	00 00                	add    BYTE PTR [eax],al
  32:	00 02                	add    BYTE PTR [edx],al
  34:	02 05 18 00 00 00    	add    al,BYTE PTR ds:0x18
  3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  41:	02 08                	add    cl,BYTE PTR [eax]
  43:	05 62 00 00 00       	add    eax,0x62
  48:	02 01                	add    al,BYTE PTR [ecx]
  4a:	08 d4                	or     ah,dl
  4c:	00 00                	add    BYTE PTR [eax],al
  4e:	00 02                	add    BYTE PTR [edx],al
  50:	02 07                	add    al,BYTE PTR [edi]
  52:	28 01                	sub    BYTE PTR [ecx],al
  54:	00 00                	add    BYTE PTR [eax],al
  56:	04 06                	add    al,0x6
  58:	01 00                	add    DWORD PTR [eax],eax
  5a:	00 02                	add    BYTE PTR [edx],al
  5c:	34 61                	xor    al,0x61
  5e:	00 00                	add    BYTE PTR [eax],al
  60:	00 02                	add    BYTE PTR [edx],al
  62:	04 07                	add    al,0x7
  64:	f9                   	stc    
  65:	00 00                	add    BYTE PTR [eax],al
  67:	00 02                	add    BYTE PTR [edx],al
  69:	08 07                	or     BYTE PTR [edi],al
  6b:	ef                   	out    dx,eax
  6c:	00 00                	add    BYTE PTR [eax],al
  6e:	00 02                	add    BYTE PTR [edx],al
  70:	04 05                	add    al,0x5
  72:	67 00 00             	add    BYTE PTR [bx+si],al
  75:	00 04 4c             	add    BYTE PTR [esp+ecx*2],al
  78:	00 00                	add    BYTE PTR [eax],al
  7a:	00 03                	add    BYTE PTR [ebx],al
  7c:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
  7f:	00 00                	add    BYTE PTR [eax],al
  81:	05 74 6d 00 2c       	add    eax,0x2c006d74
  86:	03 2c 11             	add    ebp,DWORD PTR [ecx+edx*1]
  89:	01 00                	add    DWORD PTR [eax],eax
  8b:	00 06                	add    BYTE PTR [esi],al
  8d:	a0 01 00 00 03       	mov    al,ds:0x3000001
  92:	2e 3a 00             	cmp    al,BYTE PTR cs:[eax]
  95:	00 00                	add    BYTE PTR [eax],al
  97:	00 06                	add    BYTE PTR [esi],al
  99:	67 01 00             	add    DWORD PTR [bx+si],eax
  9c:	00 03                	add    BYTE PTR [ebx],al
  9e:	2f                   	das    
  9f:	3a 00                	cmp    al,BYTE PTR [eax]
  a1:	00 00                	add    BYTE PTR [eax],al
  a3:	04 06                	add    al,0x6
  a5:	53                   	push   ebx
  a6:	00 00                	add    BYTE PTR [eax],al
  a8:	00 03                	add    BYTE PTR [ebx],al
  aa:	30 3a                	xor    BYTE PTR [edx],bh
  ac:	00 00                	add    BYTE PTR [eax],al
  ae:	00 08                	add    BYTE PTR [eax],cl
  b0:	06                   	push   es
  b1:	0f 01 00             	sgdtd  [eax]
  b4:	00 03                	add    BYTE PTR [ebx],al
  b6:	31 3a                	xor    DWORD PTR [edx],edi
  b8:	00 00                	add    BYTE PTR [eax],al
  ba:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
  bd:	5b                   	pop    ebx
  be:	00 00                	add    BYTE PTR [eax],al
  c0:	00 03                	add    BYTE PTR [ebx],al
  c2:	32 3a                	xor    bh,BYTE PTR [edx]
  c4:	00 00                	add    BYTE PTR [eax],al
  c6:	00 10                	add    BYTE PTR [eax],dl
  c8:	06                   	push   es
  c9:	e7 00                	out    0x0,eax
  cb:	00 00                	add    BYTE PTR [eax],al
  cd:	03 33                	add    esi,DWORD PTR [ebx]
  cf:	3a 00                	cmp    al,BYTE PTR [eax]
  d1:	00 00                	add    BYTE PTR [eax],al
  d3:	14 06                	adc    al,0x6
  d5:	22 00                	and    al,BYTE PTR [eax]
  d7:	00 00                	add    BYTE PTR [eax],al
  d9:	03 34 3a             	add    esi,DWORD PTR [edx+edi*1]
  dc:	00 00                	add    BYTE PTR [eax],al
  de:	00 18                	add    BYTE PTR [eax],bl
  e0:	06                   	push   es
  e1:	44                   	inc    esp
  e2:	01 00                	add    DWORD PTR [eax],eax
  e4:	00 03                	add    BYTE PTR [ebx],al
  e6:	35 3a 00 00 00       	xor    eax,0x3a
  eb:	1c 06                	sbb    al,0x6
  ed:	6e                   	outs   dx,BYTE PTR ds:[esi]
  ee:	01 00                	add    DWORD PTR [eax],eax
  f0:	00 03                	add    BYTE PTR [ebx],al
  f2:	36 3a 00             	cmp    al,BYTE PTR ss:[eax]
  f5:	00 00                	add    BYTE PTR [eax],al
  f7:	20 06                	and    BYTE PTR [esi],al
  f9:	2f                   	das    
  fa:	00 00                	add    BYTE PTR [eax],al
  fc:	00 03                	add    BYTE PTR [ebx],al
  fe:	37                   	aaa    
  ff:	6f                   	outs   dx,DWORD PTR ds:[esi]
 100:	00 00                	add    BYTE PTR [eax],al
 102:	00 24 06             	add    BYTE PTR [esi+eax*1],ah
 105:	08 00                	or     BYTE PTR [eax],al
 107:	00 00                	add    BYTE PTR [eax],al
 109:	03 38                	add    edi,DWORD PTR [eax]
 10b:	11 01                	adc    DWORD PTR [ecx],eax
 10d:	00 00                	add    BYTE PTR [eax],al
 10f:	28 00                	sub    BYTE PTR [eax],al
 111:	07                   	pop    es
 112:	04 17                	add    al,0x17
 114:	01 00                	add    DWORD PTR [eax],eax
 116:	00 08                	add    BYTE PTR [eax],cl
 118:	25 00 00 00 02       	and    eax,0x2000000
 11d:	01 02                	add    DWORD PTR [edx],eax
 11f:	57                   	push   edi
 120:	01 00                	add    DWORD PTR [eax],eax
 122:	00 09                	add    BYTE PTR [ecx],cl
 124:	2a 00                	sub    al,BYTE PTR [eax]
 126:	00 00                	add    BYTE PTR [eax],al
 128:	01 13                	add    DWORD PTR [ebx],edx
 12a:	3a 00                	cmp    al,BYTE PTR [eax]
 12c:	00 00                	add    BYTE PTR [eax],al
 12e:	00 00                	add    BYTE PTR [eax],al
 130:	20 03                	and    BYTE PTR [ebx],al
 132:	e9 01 00 00 01       	jmp    1000138 <main-0x21ffec8>
 137:	9c                   	pushf  
 138:	ec                   	in     al,dx
 139:	01 00                	add    DWORD PTR [eax],eax
 13b:	00 0a                	add    BYTE PTR [edx],cl
 13d:	e2 00                	loop   13f <main-0x31ffec1>
 13f:	00 00                	add    BYTE PTR [eax],al
 141:	01 13                	add    DWORD PTR [ebx],edx
 143:	3a 00                	cmp    al,BYTE PTR [eax]
 145:	00 00                	add    BYTE PTR [eax],al
 147:	02 91 00 0a 23 01    	add    dl,BYTE PTR [ecx+0x1230a00]
 14d:	00 00                	add    BYTE PTR [eax],al
 14f:	01 13                	add    DWORD PTR [ebx],edx
 151:	ec                   	in     al,dx
 152:	01 00                	add    DWORD PTR [eax],eax
 154:	00 02                	add    BYTE PTR [edx],al
 156:	91                   	xchg   ecx,eax
 157:	04 0b                	add    al,0xb
 159:	70 69                	jo     1c4 <main-0x31ffe3c>
 15b:	64 00 01             	add    BYTE PTR fs:[ecx],al
 15e:	15 3a 00 00 00       	adc    eax,0x3a
 163:	02 75 6c             	add    dh,BYTE PTR [ebp+0x6c]
 166:	0c 5d                	or     al,0x5d
 168:	01 00                	add    DWORD PTR [eax],eax
 16a:	00 01                	add    BYTE PTR [ecx],al
 16c:	16                   	push   ss
 16d:	f8                   	clc    
 16e:	01 00                	add    DWORD PTR [eax],eax
 170:	00 0d 41 00 00 00    	add    BYTE PTR ds:0x41,cl
 176:	01 17                	add    DWORD PTR [edi],edx
 178:	76 00                	jbe    17a <main-0x31ffe86>
 17a:	00 00                	add    BYTE PTR [eax],al
 17c:	02 75 5c             	add    dh,BYTE PTR [ebp+0x5c]
 17f:	0d 3b 01 00 00       	or     eax,0x13b
 184:	01 17                	add    DWORD PTR [edi],edx
 186:	76 00                	jbe    188 <main-0x31ffe78>
 188:	00 00                	add    BYTE PTR [eax],al
 18a:	02 75 58             	add    dh,BYTE PTR [ebp+0x58]
 18d:	0d 39 00 00 00       	or     eax,0x39
 192:	01 17                	add    DWORD PTR [edi],edx
 194:	76 00                	jbe    196 <main-0x31ffe6a>
 196:	00 00                	add    BYTE PTR [eax],al
 198:	02 75 54             	add    dh,BYTE PTR [ebp+0x54]
 19b:	0d 7f 01 00 00       	or     eax,0x17f
 1a0:	01 18                	add    DWORD PTR [eax],ebx
 1a2:	f8                   	clc    
 1a3:	01 00                	add    DWORD PTR [eax],eax
 1a5:	00 02                	add    BYTE PTR [edx],al
 1a7:	75 68                	jne    211 <main-0x31ffdef>
 1a9:	0d 77 01 00 00       	or     eax,0x177
 1ae:	01 18                	add    DWORD PTR [eax],ebx
 1b0:	f8                   	clc    
 1b1:	01 00                	add    DWORD PTR [eax],eax
 1b3:	00 02                	add    BYTE PTR [edx],al
 1b5:	75 64                	jne    21b <main-0x31ffde5>
 1b7:	0d 00 00 00 00       	or     eax,0x0
 1bc:	01 19                	add    DWORD PTR [ecx],ebx
 1be:	f2 01 00             	repnz add DWORD PTR [eax],eax
 1c1:	00 02                	add    BYTE PTR [edx],al
 1c3:	75 60                	jne    225 <main-0x31ffddb>
 1c5:	0d 99 01 00 00       	or     eax,0x199
 1ca:	01 1a                	add    DWORD PTR [edx],ebx
 1cc:	3a 00                	cmp    al,BYTE PTR [eax]
 1ce:	00 00                	add    BYTE PTR [eax],al
 1d0:	02 75 74             	add    dh,BYTE PTR [ebp+0x74]
 1d3:	0e                   	push   cs
 1d4:	cf                   	iret   
 1d5:	00 20                	add    BYTE PTR [eax],ah
 1d7:	03 47 00             	add    eax,DWORD PTR [edi+0x0]
 1da:	00 00                	add    BYTE PTR [eax],al
 1dc:	0b 63 6e             	or     esp,DWORD PTR [ebx+0x6e]
 1df:	74 00                	je     1e1 <main-0x31ffe1f>
 1e1:	01 37                	add    DWORD PTR [edi],esi
 1e3:	3a 00                	cmp    al,BYTE PTR [eax]
 1e5:	00 00                	add    BYTE PTR [eax],al
 1e7:	02 75 70             	add    dh,BYTE PTR [ebp+0x70]
 1ea:	00 00                	add    BYTE PTR [eax],al
 1ec:	07                   	pop    es
 1ed:	04 f2                	add    al,0xf2
 1ef:	01 00                	add    DWORD PTR [eax],eax
 1f1:	00 07                	add    BYTE PTR [edi],al
 1f3:	04 25                	add    al,0x25
 1f5:	00 00                	add    BYTE PTR [eax],al
 1f7:	00 07                	add    BYTE PTR [edi],al
 1f9:	04 81                	add    al,0x81
 1fb:	00 00                	add    BYTE PTR [eax],al
 1fd:	00 0f                	add    BYTE PTR [edi],cl
 1ff:	89 01                	mov    DWORD PTR [ecx],eax
 201:	00 00                	add    BYTE PTR [eax],al
 203:	04 34                	add    al,0x34
 205:	56                   	push   esi
 206:	00 00                	add    BYTE PTR [eax],al
 208:	00 05 03 04 20 20    	add    BYTE PTR ds:0x20200403,al
 20e:	03 0f                	add    ecx,DWORD PTR [edi]
 210:	cb                   	retf   
 211:	00 00                	add    BYTE PTR [eax],al
 213:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
 21a:	05 03 08 20 20       	add    eax,0x20200803
 21f:	03 0f                	add    ecx,DWORD PTR [edi]
 221:	10 00                	adc    BYTE PTR [eax],al
 223:	00 00                	add    BYTE PTR [eax],al
 225:	04 36                	add    al,0x36
 227:	56                   	push   esi
 228:	00 00                	add    BYTE PTR [eax],al
 22a:	00 05 03 00 20 20    	add    BYTE PTR ds:0x20200003,al
 230:	03 0f                	add    ecx,DWORD PTR [edi]
 232:	92                   	xchg   edx,eax
 233:	01 00                	add    DWORD PTR [eax],eax
 235:	00 04 37             	add    BYTE PTR [edi+esi*1],al
 238:	56                   	push   esi
 239:	00 00                	add    BYTE PTR [eax],al
 23b:	00 05 03 10 20 20    	add    BYTE PTR ds:0x20201003,al
 241:	03 0f                	add    ecx,DWORD PTR [edi]
 243:	17                   	pop    ss
 244:	01 00                	add    DWORD PTR [eax],eax
 246:	00 05 49 ec 01 00    	add    BYTE PTR ds:0x1ec49,al
 24c:	00 05 03 0c 20 20    	add    BYTE PTR ds:0x20200c03,al
 252:	03 00                	add    eax,DWORD PTR [eax]

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
  a8:	13 00                	adc    eax,DWORD PTR [eax]
  aa:	00 0d 34 00 03 0e    	add    BYTE PTR ds:0xe030034,cl
  b0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  b2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  b4:	49                   	dec    ecx
  b5:	13 02                	adc    eax,DWORD PTR [edx]
  b7:	18 00                	sbb    BYTE PTR [eax],al
  b9:	00 0e                	add    BYTE PTR [esi],cl
  bb:	0b 01                	or     eax,DWORD PTR [ecx]
  bd:	11 01                	adc    DWORD PTR [ecx],eax
  bf:	12 06                	adc    al,BYTE PTR [esi]
  c1:	00 00                	add    BYTE PTR [eax],al
  c3:	0f 34                	sysenter 
  c5:	00 03                	add    BYTE PTR [ebx],al
  c7:	0e                   	push   cs
  c8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  ca:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  cc:	49                   	dec    ecx
  cd:	13 3f                	adc    edi,DWORD PTR [edi]
  cf:	19 02                	sbb    DWORD PTR [edx],eax
  d1:	18 00                	sbb    BYTE PTR [eax],al
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
  14:	e9 01 00 00 00       	jmp    1a <main-0x31fffe6>
  19:	00 00                	add    BYTE PTR [eax],al
  1b:	00 00                	add    BYTE PTR [eax],al
  1d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	02 01                	add    al,BYTE PTR [ecx]
   2:	00 00                	add    BYTE PTR [eax],al
   4:	02 00                	add    al,BYTE PTR [eax]
   6:	aa                   	stos   BYTE PTR es:[edi],al
   7:	00 00                	add    BYTE PTR [eax],al
   9:	00 01                	add    BYTE PTR [ecx],al
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
  c0:	79 77                	jns    139 <main-0x31ffec7>
  c2:	f3 f3 08 33          	repz repz or BYTE PTR [ebx],dh
  c6:	5a                   	pop    edx
  c7:	f3 77 68             	repz ja 132 <main-0x31ffece>
  ca:	08 67 d7             	or     BYTE PTR [edi-0x29],ah
  cd:	08 22                	or     BYTE PTR [edx],ah
  cf:	f3 77 a1             	repz ja 73 <main-0x31fff8d>
  d2:	00 02                	add    BYTE PTR [edx],al
  d4:	04 03                	add    al,0x3
  d6:	92                   	xchg   edx,eax
  d7:	00 02                	add    BYTE PTR [edx],al
  d9:	04 03                	add    al,0x3
  db:	08 2f                	or     BYTE PTR [edi],ch
  dd:	00 02                	add    BYTE PTR [edx],al
  df:	04 03                	add    al,0x3
  e1:	08 e1                	or     cl,ah
  e3:	00 02                	add    BYTE PTR [edx],al
  e5:	04 01                	add    al,0x1
  e7:	06                   	push   es
  e8:	4a                   	dec    edx
  e9:	06                   	push   es
  ea:	79 83                	jns    6f <main-0x31fff91>
  ec:	f5                   	cmc    
  ed:	83 68 08 21          	sub    DWORD PTR [eax+0x8],0x21
  f1:	68 68 08 83 94       	push   0x94830868
  f6:	e5 83                	in     eax,0x83
  f8:	f3 91                	repz xchg ecx,eax
  fa:	03 0c 66             	add    ecx,DWORD PTR [esi+eiz*2]
  fd:	d7                   	xlat   BYTE PTR ds:[ebx]
  fe:	d7                   	xlat   BYTE PTR ds:[ebx]
  ff:	d7                   	xlat   BYTE PTR ds:[ebx]
 100:	3d 02 0a 00 01       	cmp    eax,0x1000a02
 105:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	65                   	gs
   1:	78 65                	js     68 <main-0x31fff98>
   3:	63 70 67             	arpl   WORD PTR [eax+0x67],si
   6:	6d                   	ins    DWORD PTR es:[edi],dx
   7:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
   b:	7a 6f                	jp     7c <main-0x31fff84>
   d:	6e                   	outs   dx,BYTE PTR ds:[esi]
   e:	65 00 68 65          	add    BYTE PTR gs:[eax+0x65],ch
  12:	61                   	popa   
  13:	70 45                	jo     5a <main-0x31fffa6>
  15:	6e                   	outs   dx,BYTE PTR ds:[esi]
  16:	64 00 73 68          	add    BYTE PTR fs:[ebx+0x68],dh
  1a:	6f                   	outs   dx,DWORD PTR ds:[esi]
  1b:	72 74                	jb     91 <main-0x31fff6f>
  1d:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
  20:	74 00                	je     22 <main-0x31fffde>
  22:	74 6d                	je     91 <main-0x31fff6f>
  24:	5f                   	pop    edi
  25:	77 64                	ja     8b <main-0x31fff75>
  27:	61                   	popa   
  28:	79 00                	jns    2a <main-0x31fffd6>
  2a:	6d                   	ins    DWORD PTR es:[edi],dx
  2b:	61                   	popa   
  2c:	69 6e 00 74 6d 5f 67 	imul   ebp,DWORD PTR [esi+0x0],0x675f6d74
  33:	6d                   	ins    DWORD PTR es:[edi],dx
  34:	74 6f                	je     a5 <main-0x31fff5b>
  36:	66                   	data16
  37:	66                   	data16
  38:	00 65 6c             	add    BYTE PTR [ebp+0x6c],ah
  3b:	61                   	popa   
  3c:	70 73                	jo     b1 <main-0x31fff4f>
  3e:	65 64 00 73 74       	gs add BYTE PTR fs:gs:[ebx+0x74],dh
  43:	61                   	popa   
  44:	72 74                	jb     ba <main-0x31fff46>
  46:	54                   	push   esp
  47:	69 63 6b 73 00 74 69 	imul   esp,DWORD PTR [ebx+0x6b],0x69740073
  4e:	6d                   	ins    DWORD PTR es:[edi],dx
  4f:	65                   	gs
  50:	5f                   	pop    edi
  51:	74 00                	je     53 <main-0x31fffad>
  53:	74 6d                	je     c2 <main-0x31fff3e>
  55:	5f                   	pop    edi
  56:	68 6f 75 72 00       	push   0x72756f
  5b:	74 6d                	je     ca <main-0x31fff36>
  5d:	5f                   	pop    edi
  5e:	6d                   	ins    DWORD PTR es:[edi],dx
  5f:	6f                   	outs   dx,DWORD PTR ds:[esi]
  60:	6e                   	outs   dx,BYTE PTR ds:[esi]
  61:	00 6c 6f 6e          	add    BYTE PTR [edi+ebp*2+0x6e],ch
  65:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  69:	6e                   	outs   dx,BYTE PTR ds:[esi]
  6a:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
  6e:	74 00                	je     70 <main-0x31fff90>
  70:	47                   	inc    edi
  71:	4e                   	dec    esi
  72:	55                   	push   ebp
  73:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  76:	39 20                	cmp    DWORD PTR [eax],esp
  78:	35 2e 33 2e 30       	xor    eax,0x302e332e
  7d:	20 2d 6d 33 32 20    	and    BYTE PTR ds:0x2032336d,ch
  83:	2d 6d 61 73 6d       	sub    eax,0x6d73616d
  88:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  8d:	6c                   	ins    BYTE PTR es:[edi],dx
  8e:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  94:	65                   	gs
  95:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  9a:	72 69                	jb     105 <main-0x31ffefb>
  9c:	63 20                	arpl   WORD PTR [eax],sp
  9e:	2d 6d 61 72 63       	sub    eax,0x6372616d
  a3:	68 3d 70 65 6e       	push   0x6e65703d
  a8:	74 69                	je     113 <main-0x31ffeed>
  aa:	75 6d                	jne    119 <main-0x31ffee7>
  ac:	70 72                	jo     120 <main-0x31ffee0>
  ae:	6f                   	outs   dx,DWORD PTR ds:[esi]
  af:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  b5:	74 64                	je     11b <main-0x31ffee5>
  b7:	3d 63 39 39 20       	cmp    eax,0x20393963
  bc:	2d 66 66 72 65       	sub    eax,0x65726666
  c1:	65                   	gs
  c2:	73 74                	jae    138 <main-0x31ffec8>
  c4:	61                   	popa   
  c5:	6e                   	outs   dx,BYTE PTR ds:[esi]
  c6:	64 69 6e 67 00 68 65 	imul   ebp,DWORD PTR fs:[esi+0x67],0x61656800
  cd:	61 
  ce:	70 43                	jo     113 <main-0x31ffeed>
  d0:	75 72                	jne    144 <main-0x31ffebc>
  d2:	72 00                	jb     d4 <main-0x31fff2c>
  d4:	75 6e                	jne    144 <main-0x31ffebc>
  d6:	73 69                	jae    141 <main-0x31ffebf>
  d8:	67 6e                	outs   dx,BYTE PTR ds:[si]
  da:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
  df:	61                   	popa   
  e0:	72 00                	jb     e2 <main-0x31fff1e>
  e2:	61                   	popa   
  e3:	72 67                	jb     14c <main-0x31ffeb4>
  e5:	63 00                	arpl   WORD PTR [eax],ax
  e7:	74 6d                	je     156 <main-0x31ffeaa>
  e9:	5f                   	pop    edi
  ea:	79 65                	jns    151 <main-0x31ffeaf>
  ec:	61                   	popa   
  ed:	72 00                	jb     ef <main-0x31fff11>
  ef:	6c                   	ins    BYTE PTR es:[edi],dx
  f0:	6f                   	outs   dx,DWORD PTR ds:[esi]
  f1:	6e                   	outs   dx,BYTE PTR ds:[esi]
  f2:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  f6:	6e                   	outs   dx,BYTE PTR ds:[esi]
  f7:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
  fb:	73 69                	jae    166 <main-0x31ffe9a>
  fd:	67 6e                	outs   dx,BYTE PTR ds:[si]
  ff:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 104:	74 00                	je     106 <main-0x31ffefa>
 106:	75 69                	jne    171 <main-0x31ffe8f>
 108:	6e                   	outs   dx,BYTE PTR ds:[esi]
 109:	74 33                	je     13e <main-0x31ffec2>
 10b:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 10e:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 112:	6d                   	ins    DWORD PTR es:[edi],dx
 113:	64                   	fs
 114:	61                   	popa   
 115:	79 00                	jns    117 <main-0x31ffee9>
 117:	70 72                	jo     18b <main-0x31ffe75>
 119:	6f                   	outs   dx,DWORD PTR ds:[esi]
 11a:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 11d:	73 45                	jae    164 <main-0x31ffe9c>
 11f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 120:	76 70                	jbe    192 <main-0x31ffe6e>
 122:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 125:	67 76 00             	addr16 jbe 128 <main-0x31ffed8>
 128:	73 68                	jae    192 <main-0x31ffe6e>
 12a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 12b:	72 74                	jb     1a1 <main-0x31ffe5f>
 12d:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 130:	73 69                	jae    19b <main-0x31ffe65>
 132:	67 6e                	outs   dx,BYTE PTR ds:[si]
 134:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 139:	74 00                	je     13b <main-0x31ffec5>
 13b:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 13d:	64                   	fs
 13e:	54                   	push   esp
 13f:	69 63 6b 73 00 74 6d 	imul   esp,DWORD PTR [ebx+0x6b],0x6d740073
 146:	5f                   	pop    edi
 147:	79 64                	jns    1ad <main-0x31ffe53>
 149:	61                   	popa   
 14a:	79 00                	jns    14c <main-0x31ffeb4>
 14c:	74 65                	je     1b3 <main-0x31ffe4d>
 14e:	73 74                	jae    1c4 <main-0x31ffe3c>
 150:	74 69                	je     1bb <main-0x31ffe45>
 152:	6d                   	ins    DWORD PTR es:[edi],dx
 153:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax
 157:	5f                   	pop    edi
 158:	42                   	inc    edx
 159:	6f                   	outs   dx,DWORD PTR ds:[esi]
 15a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 15b:	6c                   	ins    BYTE PTR es:[edi],dx
 15c:	00 74 6f 74          	add    BYTE PTR [edi+ebp*2+0x74],dh
 160:	61                   	popa   
 161:	6c                   	ins    BYTE PTR es:[edi],dx
 162:	54                   	push   esp
 163:	69 6d 65 00 74 6d 5f 	imul   ebp,DWORD PTR [ebp+0x65],0x5f6d7400
 16a:	6d                   	ins    DWORD PTR es:[edi],dx
 16b:	69 6e 00 74 6d 5f 69 	imul   ebp,DWORD PTR [esi+0x0],0x695f6d74
 172:	73 64                	jae    1d8 <main-0x31ffe28>
 174:	73 74                	jae    1ea <main-0x31ffe16>
 176:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 179:	64                   	fs
 17a:	54                   	push   esp
 17b:	69 6d 65 00 73 74 61 	imul   ebp,DWORD PTR [ebp+0x65],0x61747300
 182:	72 74                	jb     1f8 <main-0x31ffe08>
 184:	54                   	push   esp
 185:	69 6d 65 00 68 65 61 	imul   ebp,DWORD PTR [ebp+0x65],0x61656800
 18c:	70 42                	jo     1d0 <main-0x31ffe30>
 18e:	61                   	popa   
 18f:	73 65                	jae    1f6 <main-0x31ffe0a>
 191:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 195:	63 54 5a 00          	arpl   WORD PTR [edx+ebx*2+0x0],dx
 199:	72 65                	jb     200 <main-0x31ffe00>
 19b:	74 56                	je     1f3 <main-0x31ffe0d>
 19d:	61                   	popa   
 19e:	6c                   	ins    BYTE PTR es:[edi],dx
 19f:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 1a3:	73 65                	jae    20a <main-0x31ffdf6>
 1a5:	63 00                	arpl   WORD PTR [eax],ax
 1a7:	2f                   	das    
 1a8:	68 6f 6d 65 2f       	push   0x2f656d6f
 1ad:	79 6f                	jns    21e <main-0x31ffde2>
 1af:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 1b6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1b7:	73 2f                	jae    1e8 <main-0x31ffe18>
 1b9:	61                   	popa   
 1ba:	70 72                	jo     22e <main-0x31ffdd2>
 1bc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1bd:	6a 2f                	push   0x2f
 1bf:	74 69                	je     22a <main-0x31ffdd6>
 1c1:	6d                   	ins    DWORD PTR es:[edi],dx
 1c2:	65                   	gs
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
