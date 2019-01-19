
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
 3200027:	e8 f4 01 00 00       	call   3200220 <main+0x220>
 320002c:	83 c4 10             	add    esp,0x10
 320002f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/time/testtime.c:30
    endTime = malloc(sizeof(struct tm));
 3200032:	83 ec 0c             	sub    esp,0xc
 3200035:	6a 2c                	push   0x2c
 3200037:	e8 e4 01 00 00       	call   3200220 <main+0x220>
 320003c:	83 c4 10             	add    esp,0x10
 320003f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/time/testtime.c:31
    execpgm = malloc(1024);
 3200042:	83 ec 0c             	sub    esp,0xc
 3200045:	68 00 04 00 00       	push   0x400
 320004a:	e8 d1 01 00 00       	call   3200220 <main+0x220>
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
 3200062:	e8 a9 01 00 00       	call   3200210 <main+0x210>
 3200067:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:39
        retVal=-1;
 320006a:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
/home/yogi/src/os/aproj/time/testtime.c:42
    }

    for (int cnt=2;cnt<argc;cnt++)
 3200071:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [ebp-0x10],0x2
 3200078:	eb 37                	jmp    32000b1 <main+0xb1>
/home/yogi/src/os/aproj/time/testtime.c:44 (discriminator 3)
    {
        strcat(execpgm," ");
 320007a:	83 ec 08             	sub    esp,0x8
 320007d:	68 4c 10 20 03       	push   0x320104c
 3200082:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 3200085:	e8 b6 01 00 00       	call   3200240 <main+0x240>
 320008a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:45 (discriminator 3)
        strcat(execpgm,argv[cnt]);
 320008d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3200090:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3200097:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 320009a:	01 d0                	add    eax,edx
 320009c:	8b 00                	mov    eax,DWORD PTR [eax]
 320009e:	83 ec 08             	sub    esp,0x8
 32000a1:	50                   	push   eax
 32000a2:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 32000a5:	e8 96 01 00 00       	call   3200240 <main+0x240>
 32000aa:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:42 (discriminator 3)
    {
        print("Error: Not enough parameters supplied, must pass path to program to be run\n");
        retVal=-1;
    }

    for (int cnt=2;cnt<argc;cnt++)
 32000ad:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/time/testtime.c:42 (discriminator 1)
 32000b1:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 32000b4:	3b 03                	cmp    eax,DWORD PTR [ebx]
 32000b6:	7c c2                	jl     320007a <main+0x7a>
/home/yogi/src/os/aproj/time/testtime.c:47
    {
        strcat(execpgm," ");
        strcat(execpgm,argv[cnt]);
    }
    if (retVal==0)
 32000b8:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 32000bc:	75 15                	jne    32000d3 <main+0xd3>
/home/yogi/src/os/aproj/time/testtime.c:52
    {
        int argcl;
        char** argvl;
        
        cmdlineToArgv(execpgm, &argcl, argvl);
 32000be:	83 ec 04             	sub    esp,0x4
 32000c1:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 32000c4:	8d 45 c8             	lea    eax,[ebp-0x38]
 32000c7:	50                   	push   eax
 32000c8:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 32000cb:	e8 60 01 00 00       	call   3200230 <main+0x230>
 32000d0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:54
    }
    if (retVal==0)
 32000d3:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 32000d7:	0f 85 d3 00 00 00    	jne    32001b0 <main+0x1b0>
/home/yogi/src/os/aproj/time/testtime.c:57
    {
        //print("executing %s with first parameter at 0x%08X (%u parameters)\n", execpgm, argv[1], argc-1);
        startTicks=getticks();
 32000dd:	e8 6e 01 00 00       	call   3200250 <main+0x250>
 32000e2:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/time/testtime.c:58
        gettime(startTime,true);
 32000e5:	83 ec 08             	sub    esp,0x8
 32000e8:	6a 01                	push   0x1
 32000ea:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 32000ed:	e8 8e 01 00 00       	call   3200280 <main+0x280>
 32000f2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:61
        //pid=execb(execpgm);
        //Execute the program
        pid = fork();
 32000f5:	e8 76 01 00 00       	call   3200270 <main+0x270>
 32000fa:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/time/testtime.c:62
        if (pid==0)
 32000fd:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3200101:	75 4c                	jne    320014f <main+0x14f>
/home/yogi/src/os/aproj/time/testtime.c:64
        {
            int childPid = exec(execpgm, 0, NULL);
 3200103:	83 ec 04             	sub    esp,0x4
 3200106:	6a 00                	push   0x0
 3200108:	6a 00                	push   0x0
 320010a:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 320010d:	e8 4e 01 00 00       	call   3200260 <main+0x260>
 3200112:	83 c4 10             	add    esp,0x10
 3200115:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/time/testtime.c:65
            if (childPid <= 0)
 3200118:	83 7d d4 00          	cmp    DWORD PTR [ebp-0x2c],0x0
 320011c:	7f 1d                	jg     320013b <main+0x13b>
/home/yogi/src/os/aproj/time/testtime.c:67
            {
                print("Error exec'ing %s\n",execpgm);
 320011e:	83 ec 08             	sub    esp,0x8
 3200121:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 3200124:	68 4e 10 20 03       	push   0x320104e
 3200129:	e8 e2 00 00 00       	call   3200210 <main+0x210>
 320012e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:68
                return -1;
 3200131:	b8 ff ff ff ff       	mov    eax,0xffffffff
 3200136:	e9 a2 00 00 00       	jmp    32001dd <main+0x1dd>
/home/yogi/src/os/aproj/time/testtime.c:72
            }
            else
            {
                return waitpid(childPid);
 320013b:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 320013e:	83 ec 0c             	sub    esp,0xc
 3200141:	50                   	push   eax
 3200142:	e8 b9 00 00 00       	call   3200200 <main+0x200>
 3200147:	83 c4 10             	add    esp,0x10
 320014a:	e9 8e 00 00 00       	jmp    32001dd <main+0x1dd>
/home/yogi/src/os/aproj/time/testtime.c:76
                
            }
        }
        if (pid<0)
 320014f:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3200153:	79 1c                	jns    3200171 <main+0x171>
/home/yogi/src/os/aproj/time/testtime.c:78
        {
            print("Error forking: %u\n",pid);
 3200155:	83 ec 08             	sub    esp,0x8
 3200158:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 320015b:	68 61 10 20 03       	push   0x3201061
 3200160:	e8 ab 00 00 00       	call   3200210 <main+0x210>
 3200165:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:79
            retVal=-3;
 3200168:	c7 45 f4 fd ff ff ff 	mov    DWORD PTR [ebp-0xc],0xfffffffd
 320016f:	eb 3f                	jmp    32001b0 <main+0x1b0>
/home/yogi/src/os/aproj/time/testtime.c:83
        }
        else
        {
            retVal = waitpid(pid);
 3200171:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3200174:	83 ec 0c             	sub    esp,0xc
 3200177:	50                   	push   eax
 3200178:	e8 83 00 00 00       	call   3200200 <main+0x200>
 320017d:	83 c4 10             	add    esp,0x10
 3200180:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/time/testtime.c:84
            if (retVal == 0)
 3200183:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3200187:	75 27                	jne    32001b0 <main+0x1b0>
/home/yogi/src/os/aproj/time/testtime.c:86
            {
                endTicks=getticks();
 3200189:	e8 c2 00 00 00       	call   3200250 <main+0x250>
 320018e:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/time/testtime.c:87
                gettime(endTime,true);
 3200191:	83 ec 08             	sub    esp,0x8
 3200194:	6a 01                	push   0x1
 3200196:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3200199:	e8 e2 00 00 00       	call   3200280 <main+0x280>
 320019e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:88
                elapsed=(endTicks-startTicks);
 32001a1:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 32001a4:	2b 45 d8             	sub    eax,DWORD PTR [ebp-0x28]
 32001a7:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/time/testtime.c:89
                retVal=elapsed;
 32001aa:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 32001ad:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/time/testtime.c:102
    */
    //            free(totalTime);
            }
        }
    }
    free(startTime);
 32001b0:	83 ec 0c             	sub    esp,0xc
 32001b3:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 32001b6:	e8 d5 00 00 00       	call   3200290 <main+0x290>
 32001bb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:103
    free(endTime);
 32001be:	83 ec 0c             	sub    esp,0xc
 32001c1:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 32001c4:	e8 c7 00 00 00       	call   3200290 <main+0x290>
 32001c9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:104
    free(execpgm);
 32001cc:	83 ec 0c             	sub    esp,0xc
 32001cf:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 32001d2:	e8 b9 00 00 00       	call   3200290 <main+0x290>
 32001d7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:105
    return (retVal);
 32001da:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/src/os/aproj/time/testtime.c:106
}
 32001dd:	8d 65 f8             	lea    esp,[ebp-0x8]
 32001e0:	59                   	pop    ecx
 32001e1:	5b                   	pop    ebx
 32001e2:	5d                   	pop    ebp
 32001e3:	8d 61 fc             	lea    esp,[ecx-0x4]
 32001e6:	c3                   	ret    

Disassembly of section .plt:

032001f0 <.plt>:
 32001f0:	ff 35 34 03 20 03    	push   DWORD PTR ds:0x3200334
 32001f6:	ff 25 38 03 20 03    	jmp    DWORD PTR ds:0x3200338
 32001fc:	00 00                	add    BYTE PTR [eax],al
 32001fe:	00 00                	add    BYTE PTR [eax],al
 3200200:	ff 25 3c 03 20 03    	jmp    DWORD PTR ds:0x320033c
 3200206:	68 00 00 00 00       	push   0x0
 320020b:	e9 e0 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200210:	ff 25 40 03 20 03    	jmp    DWORD PTR ds:0x3200340
 3200216:	68 08 00 00 00       	push   0x8
 320021b:	e9 d0 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200220:	ff 25 44 03 20 03    	jmp    DWORD PTR ds:0x3200344
 3200226:	68 10 00 00 00       	push   0x10
 320022b:	e9 c0 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200230:	ff 25 48 03 20 03    	jmp    DWORD PTR ds:0x3200348
 3200236:	68 18 00 00 00       	push   0x18
 320023b:	e9 b0 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200240:	ff 25 4c 03 20 03    	jmp    DWORD PTR ds:0x320034c
 3200246:	68 20 00 00 00       	push   0x20
 320024b:	e9 a0 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200250:	ff 25 50 03 20 03    	jmp    DWORD PTR ds:0x3200350
 3200256:	68 28 00 00 00       	push   0x28
 320025b:	e9 90 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200260:	ff 25 54 03 20 03    	jmp    DWORD PTR ds:0x3200354
 3200266:	68 30 00 00 00       	push   0x30
 320026b:	e9 80 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200270:	ff 25 58 03 20 03    	jmp    DWORD PTR ds:0x3200358
 3200276:	68 38 00 00 00       	push   0x38
 320027b:	e9 70 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200280:	ff 25 5c 03 20 03    	jmp    DWORD PTR ds:0x320035c
 3200286:	68 40 00 00 00       	push   0x40
 320028b:	e9 60 ff ff ff       	jmp    32001f0 <main+0x1f0>
 3200290:	ff 25 60 03 20 03    	jmp    DWORD PTR ds:0x3200360
 3200296:	68 48 00 00 00       	push   0x48
 320029b:	e9 50 ff ff ff       	jmp    32001f0 <main+0x1f0>

Disassembly of section .dynamic:

032002a0 <_DYNAMIC>:
 32002a0:	01 00                	add    DWORD PTR [eax],eax
 32002a2:	00 00                	add    BYTE PTR [eax],al
 32002a4:	01 00                	add    DWORD PTR [eax],eax
 32002a6:	00 00                	add    BYTE PTR [eax],al
 32002a8:	0f 00 00             	sldt   WORD PTR [eax]
 32002ab:	00 53 00             	add    BYTE PTR [ebx+0x0],dl
 32002ae:	00 00                	add    BYTE PTR [eax],al
 32002b0:	04 00                	add    al,0x0
 32002b2:	00 00                	add    BYTE PTR [eax],al
 32002b4:	00 12                	add    BYTE PTR [edx],dl
 32002b6:	20 03                	and    BYTE PTR [ebx],al
 32002b8:	05 00 00 00 88       	add    eax,0x88000000
 32002bd:	11 20                	adc    DWORD PTR [eax],esp
 32002bf:	03 06                	add    eax,DWORD PTR [esi]
 32002c1:	00 00                	add    BYTE PTR [eax],al
 32002c3:	00 d8                	add    al,bl
 32002c5:	10 20                	adc    BYTE PTR [eax],ah
 32002c7:	03 0a                	add    ecx,DWORD PTR [edx]
 32002c9:	00 00                	add    BYTE PTR [eax],al
 32002cb:	00 76 00             	add    BYTE PTR [esi+0x0],dh
 32002ce:	00 00                	add    BYTE PTR [eax],al
 32002d0:	0b 00                	or     eax,DWORD PTR [eax]
 32002d2:	00 00                	add    BYTE PTR [eax],al
 32002d4:	10 00                	adc    BYTE PTR [eax],al
 32002d6:	00 00                	add    BYTE PTR [eax],al
 32002d8:	15 00 00 00 00       	adc    eax,0x0
 32002dd:	00 00                	add    BYTE PTR [eax],al
 32002df:	00 03                	add    BYTE PTR [ebx],al
 32002e1:	00 00                	add    BYTE PTR [eax],al
 32002e3:	00 30                	add    BYTE PTR [eax],dh
 32002e5:	03 20                	add    esp,DWORD PTR [eax]
 32002e7:	03 02                	add    eax,DWORD PTR [edx]
 32002e9:	00 00                	add    BYTE PTR [eax],al
 32002eb:	00 50 00             	add    BYTE PTR [eax+0x0],dl
 32002ee:	00 00                	add    BYTE PTR [eax],al
 32002f0:	14 00                	adc    al,0x0
 32002f2:	00 00                	add    BYTE PTR [eax],al
 32002f4:	11 00                	adc    DWORD PTR [eax],eax
 32002f6:	00 00                	add    BYTE PTR [eax],al
 32002f8:	17                   	pop    ss
 32002f9:	00 00                	add    BYTE PTR [eax],al
 32002fb:	00 94 12 20 03 00 00 	add    BYTE PTR [edx+edx*1+0x320],dl
	...

Disassembly of section .got.plt:

03200330 <_GLOBAL_OFFSET_TABLE_>:
 3200330:	a0 02 20 03 00       	mov    al,ds:0x32002
 3200335:	00 00                	add    BYTE PTR [eax],al
 3200337:	00 00                	add    BYTE PTR [eax],al
 3200339:	00 00                	add    BYTE PTR [eax],al
 320033b:	00 06                	add    BYTE PTR [esi],al
 320033d:	02 20                	add    ah,BYTE PTR [eax]
 320033f:	03 16                	add    edx,DWORD PTR [esi]
 3200341:	02 20                	add    ah,BYTE PTR [eax]
 3200343:	03 26                	add    esp,DWORD PTR [esi]
 3200345:	02 20                	add    ah,BYTE PTR [eax]
 3200347:	03 36                	add    esi,DWORD PTR [esi]
 3200349:	02 20                	add    ah,BYTE PTR [eax]
 320034b:	03 46 02             	add    eax,DWORD PTR [esi+0x2]
 320034e:	20 03                	and    BYTE PTR [ebx],al
 3200350:	56                   	push   esi
 3200351:	02 20                	add    ah,BYTE PTR [eax]
 3200353:	03 66 02             	add    esp,DWORD PTR [esi+0x2]
 3200356:	20 03                	and    BYTE PTR [ebx],al
 3200358:	76 02                	jbe    320035c <_GLOBAL_OFFSET_TABLE_+0x2c>
 320035a:	20 03                	and    BYTE PTR [ebx],al
 320035c:	86 02                	xchg   BYTE PTR [edx],al
 320035e:	20 03                	and    BYTE PTR [ebx],al
 3200360:	96                   	xchg   esi,eax
 3200361:	02 20                	add    ah,BYTE PTR [eax]
 3200363:	03                   	.byte 0x3

Disassembly of section .rodata:

03201000 <.rodata>:
 3201000:	45                   	inc    ebp
 3201001:	72 72                	jb     3201075 <_GLOBAL_OFFSET_TABLE_+0xd45>
 3201003:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3201004:	72 3a                	jb     3201040 <_GLOBAL_OFFSET_TABLE_+0xd10>
 3201006:	20 4e 6f             	and    BYTE PTR [esi+0x6f],cl
 3201009:	74 20                	je     320102b <_GLOBAL_OFFSET_TABLE_+0xcfb>
 320100b:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 320100d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320100e:	75 67                	jne    3201077 <_GLOBAL_OFFSET_TABLE_+0xd47>
 3201010:	68 20 70 61 72       	push   0x72617020
 3201015:	61                   	popa   
 3201016:	6d                   	ins    DWORD PTR es:[edi],dx
 3201017:	65                   	gs
 3201018:	74 65                	je     320107f <_GLOBAL_OFFSET_TABLE_+0xd4f>
 320101a:	72 73                	jb     320108f <_GLOBAL_OFFSET_TABLE_+0xd5f>
 320101c:	20 73 75             	and    BYTE PTR [ebx+0x75],dh
 320101f:	70 70                	jo     3201091 <_GLOBAL_OFFSET_TABLE_+0xd61>
 3201021:	6c                   	ins    BYTE PTR es:[edi],dx
 3201022:	69 65 64 2c 20 6d 75 	imul   esp,DWORD PTR [ebp+0x64],0x756d202c
 3201029:	73 74                	jae    320109f <_GLOBAL_OFFSET_TABLE_+0xd6f>
 320102b:	20 70 61             	and    BYTE PTR [eax+0x61],dh
 320102e:	73 73                	jae    32010a3 <_GLOBAL_OFFSET_TABLE_+0xd73>
 3201030:	20 70 61             	and    BYTE PTR [eax+0x61],dh
 3201033:	74 68                	je     320109d <_GLOBAL_OFFSET_TABLE_+0xd6d>
 3201035:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 3201039:	70 72                	jo     32010ad <_GLOBAL_OFFSET_TABLE_+0xd7d>
 320103b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320103c:	67 72 61             	addr16 jb 32010a0 <_GLOBAL_OFFSET_TABLE_+0xd70>
 320103f:	6d                   	ins    DWORD PTR es:[edi],dx
 3201040:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 3201044:	62 65 20             	bound  esp,QWORD PTR [ebp+0x20]
 3201047:	72 75                	jb     32010be <_GLOBAL_OFFSET_TABLE_+0xd8e>
 3201049:	6e                   	outs   dx,BYTE PTR ds:[esi]
 320104a:	0a 00                	or     al,BYTE PTR [eax]
 320104c:	20 00                	and    BYTE PTR [eax],al
 320104e:	45                   	inc    ebp
 320104f:	72 72                	jb     32010c3 <_GLOBAL_OFFSET_TABLE_+0xd93>
 3201051:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3201052:	72 20                	jb     3201074 <_GLOBAL_OFFSET_TABLE_+0xd44>
 3201054:	65                   	gs
 3201055:	78 65                	js     32010bc <_GLOBAL_OFFSET_TABLE_+0xd8c>
 3201057:	63 27                	arpl   WORD PTR [edi],sp
 3201059:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3201060:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3201063:	72 6f                	jb     32010d4 <_GLOBAL_OFFSET_TABLE_+0xda4>
 3201065:	72 20                	jb     3201087 <_GLOBAL_OFFSET_TABLE_+0xd57>
 3201067:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3201069:	72 6b                	jb     32010d6 <_GLOBAL_OFFSET_TABLE_+0xda6>
 320106b:	69 6e 67 3a 20 25 75 	imul   ebp,DWORD PTR [esi+0x67],0x7525203a
 3201072:	0a 00                	or     al,BYTE PTR [eax]

Disassembly of section .eh_frame:

03201074 <.eh_frame>:
 3201074:	14 00                	adc    al,0x0
 3201076:	00 00                	add    BYTE PTR [eax],al
 3201078:	00 00                	add    BYTE PTR [eax],al
 320107a:	00 00                	add    BYTE PTR [eax],al
 320107c:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 320107f:	00 01                	add    BYTE PTR [ecx],al
 3201081:	7c 08                	jl     320108b <_GLOBAL_OFFSET_TABLE_+0xd5b>
 3201083:	01 1b                	add    DWORD PTR [ebx],ebx
 3201085:	0c 04                	or     al,0x4
 3201087:	04 88                	add    al,0x88
 3201089:	01 00                	add    DWORD PTR [eax],eax
 320108b:	00 34 00             	add    BYTE PTR [eax+eax*1],dh
 320108e:	00 00                	add    BYTE PTR [eax],al
 3201090:	1c 00                	sbb    al,0x0
 3201092:	00 00                	add    BYTE PTR [eax],al
 3201094:	6c                   	ins    BYTE PTR es:[edi],dx
 3201095:	ef                   	out    dx,eax
 3201096:	ff                   	(bad)  
 3201097:	ff e7                	jmp    edi
 3201099:	01 00                	add    DWORD PTR [eax],eax
 320109b:	00 00                	add    BYTE PTR [eax],al
 320109d:	44                   	inc    esp
 320109e:	0c 01                	or     al,0x1
 32010a0:	00 47 10             	add    BYTE PTR [edi+0x10],al
 32010a3:	05 02 75 00 44       	add    eax,0x44007502
 32010a8:	0f 03 75 78          	lsl    esi,WORD PTR [ebp+0x78]
 32010ac:	06                   	push   es
 32010ad:	10 03                	adc    BYTE PTR [ebx],al
 32010af:	02 75 7c             	add    dh,BYTE PTR [ebp+0x7c]
 32010b2:	03 d2                	add    edx,edx
 32010b4:	01 c1                	add    ecx,eax
 32010b6:	0c 01                	or     al,0x1
 32010b8:	00 41 c3             	add    BYTE PTR [ecx-0x3d],al
 32010bb:	41                   	inc    ecx
 32010bc:	c5 43 0c             	lds    eax,FWORD PTR [ebx+0xc]
 32010bf:	04 04                	add    al,0x4
 32010c1:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .interp:

032010c4 <.interp>:
 32010c4:	2f                   	das    
 32010c5:	6c                   	ins    BYTE PTR es:[edi],dx
 32010c6:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 32010cd:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 32010d4:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

032010d8 <.dynsym>:
	...
 32010e8:	09 00                	or     DWORD PTR [eax],eax
	...
 32010f2:	00 00                	add    BYTE PTR [eax],al
 32010f4:	12 00                	adc    al,BYTE PTR [eax]
 32010f6:	00 00                	add    BYTE PTR [eax],al
 32010f8:	11 00                	adc    DWORD PTR [eax],eax
	...
 3201102:	00 00                	add    BYTE PTR [eax],al
 3201104:	12 00                	adc    al,BYTE PTR [eax]
 3201106:	00 00                	add    BYTE PTR [eax],al
 3201108:	17                   	pop    ss
	...
 3201111:	00 00                	add    BYTE PTR [eax],al
 3201113:	00 12                	add    BYTE PTR [edx],dl
 3201115:	00 00                	add    BYTE PTR [eax],al
 3201117:	00 1e                	add    BYTE PTR [esi],bl
	...
 3201121:	00 00                	add    BYTE PTR [eax],al
 3201123:	00 12                	add    BYTE PTR [edx],dl
 3201125:	00 00                	add    BYTE PTR [eax],al
 3201127:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
	...
 3201132:	00 00                	add    BYTE PTR [eax],al
 3201134:	12 00                	adc    al,BYTE PTR [eax]
 3201136:	00 00                	add    BYTE PTR [eax],al
 3201138:	33 00                	xor    eax,DWORD PTR [eax]
	...
 3201142:	00 00                	add    BYTE PTR [eax],al
 3201144:	12 00                	adc    al,BYTE PTR [eax]
 3201146:	00 00                	add    BYTE PTR [eax],al
 3201148:	3c 00                	cmp    al,0x0
	...
 3201152:	00 00                	add    BYTE PTR [eax],al
 3201154:	12 00                	adc    al,BYTE PTR [eax]
 3201156:	00 00                	add    BYTE PTR [eax],al
 3201158:	41                   	inc    ecx
	...
 3201161:	00 00                	add    BYTE PTR [eax],al
 3201163:	00 12                	add    BYTE PTR [edx],dl
 3201165:	00 00                	add    BYTE PTR [eax],al
 3201167:	00 46 00             	add    BYTE PTR [esi+0x0],al
	...
 3201172:	00 00                	add    BYTE PTR [eax],al
 3201174:	12 00                	adc    al,BYTE PTR [eax]
 3201176:	00 00                	add    BYTE PTR [eax],al
 3201178:	4e                   	dec    esi
	...
 3201181:	00 00                	add    BYTE PTR [eax],al
 3201183:	00 12                	add    BYTE PTR [edx],dl
 3201185:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

03201188 <.dynstr>:
 3201188:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 320118c:	63 2e                	arpl   WORD PTR [esi],bp
 320118e:	73 6f                	jae    32011ff <_GLOBAL_OFFSET_TABLE_+0xecf>
 3201190:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3201193:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 320119a:	72 
 320119b:	69 6e 74 00 6d 61 6c 	imul   ebp,DWORD PTR [esi+0x74],0x6c616d00
 32011a2:	6c                   	ins    BYTE PTR es:[edi],dx
 32011a3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 32011a4:	63 00                	arpl   WORD PTR [eax],ax
 32011a6:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 32011a9:	6c                   	ins    BYTE PTR es:[edi],dx
 32011aa:	69 6e 65 54 6f 41 72 	imul   ebp,DWORD PTR [esi+0x65],0x72416f54
 32011b1:	67 76 00             	addr16 jbe 32011b4 <_GLOBAL_OFFSET_TABLE_+0xe84>
 32011b4:	73 74                	jae    320122a <_GLOBAL_OFFSET_TABLE_+0xefa>
 32011b6:	72 63                	jb     320121b <_GLOBAL_OFFSET_TABLE_+0xeeb>
 32011b8:	61                   	popa   
 32011b9:	74 00                	je     32011bb <_GLOBAL_OFFSET_TABLE_+0xe8b>
 32011bb:	67                   	addr16
 32011bc:	65                   	gs
 32011bd:	74 74                	je     3201233 <_GLOBAL_OFFSET_TABLE_+0xf03>
 32011bf:	69 63 6b 73 00 65 78 	imul   esp,DWORD PTR [ebx+0x6b],0x78650073
 32011c6:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 32011c9:	66 6f                	outs   dx,WORD PTR ds:[esi]
 32011cb:	72 6b                	jb     3201238 <_GLOBAL_OFFSET_TABLE_+0xf08>
 32011cd:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 32011d0:	74 74                	je     3201246 <_GLOBAL_OFFSET_TABLE_+0xf16>
 32011d2:	69 6d 65 00 66 72 65 	imul   ebp,DWORD PTR [ebp+0x65],0x65726600
 32011d9:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 32011dc:	2e                   	cs
 32011dd:	2f                   	das    
 32011de:	6c                   	ins    BYTE PTR es:[edi],dx
 32011df:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 32011e6:	4f                   	dec    edi
 32011e7:	53                   	push   ebx
 32011e8:	2f                   	das    
 32011e9:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 32011f0:	62 
 32011f1:	75 67                	jne    320125a <_GLOBAL_OFFSET_TABLE_+0xf2a>
 32011f3:	2f                   	das    
 32011f4:	47                   	inc    edi
 32011f5:	4e                   	dec    esi
 32011f6:	55                   	push   ebp
 32011f7:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 32011fc:	78 00                	js     32011fe <_GLOBAL_OFFSET_TABLE_+0xece>

Disassembly of section .hash:

03201200 <.hash>:
 3201200:	03 00                	add    eax,DWORD PTR [eax]
 3201202:	00 00                	add    BYTE PTR [eax],al
 3201204:	0b 00                	or     eax,DWORD PTR [eax]
 3201206:	00 00                	add    BYTE PTR [eax],al
 3201208:	09 00                	or     DWORD PTR [eax],eax
 320120a:	00 00                	add    BYTE PTR [eax],al
 320120c:	0a 00                	or     al,BYTE PTR [eax]
 320120e:	00 00                	add    BYTE PTR [eax],al
 3201210:	08 00                	or     BYTE PTR [eax],al
	...
 320121a:	00 00                	add    BYTE PTR [eax],al
 320121c:	01 00                	add    DWORD PTR [eax],eax
 320121e:	00 00                	add    BYTE PTR [eax],al
 3201220:	02 00                	add    al,BYTE PTR [eax]
	...
 320122a:	00 00                	add    BYTE PTR [eax],al
 320122c:	04 00                	add    al,0x0
 320122e:	00 00                	add    BYTE PTR [eax],al
 3201230:	06                   	push   es
 3201231:	00 00                	add    BYTE PTR [eax],al
 3201233:	00 03                	add    BYTE PTR [ebx],al
 3201235:	00 00                	add    BYTE PTR [eax],al
 3201237:	00 05 00 00 00 07    	add    BYTE PTR ds:0x7000000,al
 320123d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03201240 <.eh_frame>:
 3201240:	14 00                	adc    al,0x0
 3201242:	00 00                	add    BYTE PTR [eax],al
 3201244:	00 00                	add    BYTE PTR [eax],al
 3201246:	00 00                	add    BYTE PTR [eax],al
 3201248:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 320124b:	00 01                	add    BYTE PTR [ecx],al
 320124d:	7c 08                	jl     3201257 <_GLOBAL_OFFSET_TABLE_+0xf27>
 320124f:	01 1b                	add    DWORD PTR [ebx],ebx
 3201251:	0c 04                	or     al,0x4
 3201253:	04 88                	add    al,0x88
 3201255:	01 00                	add    DWORD PTR [eax],eax
 3201257:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 320125a:	00 00                	add    BYTE PTR [eax],al
 320125c:	1c 00                	sbb    al,0x0
 320125e:	00 00                	add    BYTE PTR [eax],al
 3201260:	90                   	nop
 3201261:	ef                   	out    dx,eax
 3201262:	ff                   	(bad)  
 3201263:	ff b0 00 00 00 00    	push   DWORD PTR [eax+0x0]
 3201269:	0e                   	push   cs
 320126a:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 320126d:	0c 4a                	or     al,0x4a
 320126f:	0f 0b                	ud2    
 3201271:	74 04                	je     3201277 <_GLOBAL_OFFSET_TABLE_+0xf47>
 3201273:	78 00                	js     3201275 <_GLOBAL_OFFSET_TABLE_+0xf45>
 3201275:	3f                   	aas    
 3201276:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3201278:	2a 32                	sub    dh,BYTE PTR [edx]
 320127a:	24 22                	and    al,0x22
 320127c:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03201280 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3201280:	01 1b                	add    DWORD PTR [ebx],ebx
 3201282:	03 3b                	add    edi,DWORD PTR [ebx]
 3201284:	f0 fd                	lock std 
 3201286:	ff                   	(bad)  
 3201287:	ff 01                	inc    DWORD PTR [ecx]
 3201289:	00 00                	add    BYTE PTR [eax],al
 320128b:	00 80 ed ff ff 0c    	add    BYTE PTR [eax+0xcffffed],al
 3201291:	fe                   	(bad)  
 3201292:	ff                   	(bad)  
 3201293:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03201294 <.rel.dyn>:
 3201294:	3c 03                	cmp    al,0x3
 3201296:	20 03                	and    BYTE PTR [ebx],al
 3201298:	07                   	pop    es
 3201299:	01 00                	add    DWORD PTR [eax],eax
 320129b:	00 40 03             	add    BYTE PTR [eax+0x3],al
 320129e:	20 03                	and    BYTE PTR [ebx],al
 32012a0:	07                   	pop    es
 32012a1:	02 00                	add    al,BYTE PTR [eax]
 32012a3:	00 44 03 20          	add    BYTE PTR [ebx+eax*1+0x20],al
 32012a7:	03 07                	add    eax,DWORD PTR [edi]
 32012a9:	03 00                	add    eax,DWORD PTR [eax]
 32012ab:	00 48 03             	add    BYTE PTR [eax+0x3],cl
 32012ae:	20 03                	and    BYTE PTR [ebx],al
 32012b0:	07                   	pop    es
 32012b1:	04 00                	add    al,0x0
 32012b3:	00 4c 03 20          	add    BYTE PTR [ebx+eax*1+0x20],cl
 32012b7:	03 07                	add    eax,DWORD PTR [edi]
 32012b9:	05 00 00 50 03       	add    eax,0x3500000
 32012be:	20 03                	and    BYTE PTR [ebx],al
 32012c0:	07                   	pop    es
 32012c1:	06                   	push   es
 32012c2:	00 00                	add    BYTE PTR [eax],al
 32012c4:	54                   	push   esp
 32012c5:	03 20                	add    esp,DWORD PTR [eax]
 32012c7:	03 07                	add    eax,DWORD PTR [edi]
 32012c9:	07                   	pop    es
 32012ca:	00 00                	add    BYTE PTR [eax],al
 32012cc:	58                   	pop    eax
 32012cd:	03 20                	add    esp,DWORD PTR [eax]
 32012cf:	03 07                	add    eax,DWORD PTR [edi]
 32012d1:	08 00                	or     BYTE PTR [eax],al
 32012d3:	00 5c 03 20          	add    BYTE PTR [ebx+eax*1+0x20],bl
 32012d7:	03 07                	add    eax,DWORD PTR [edi]
 32012d9:	09 00                	or     DWORD PTR [eax],eax
 32012db:	00 60 03             	add    BYTE PTR [eax+0x3],ah
 32012de:	20 03                	and    BYTE PTR [ebx],al
 32012e0:	07                   	pop    es
 32012e1:	0a 00                	or     al,BYTE PTR [eax]
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
   0:	96                   	xchg   esi,eax
   1:	02 00                	add    al,BYTE PTR [eax]
   3:	00 04 00             	add    BYTE PTR [eax+eax*1],al
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	7f 00                	jg     e <main-0x31ffff2>
   e:	00 00                	add    BYTE PTR [eax],al
  10:	0c 5b                	or     al,0x5b
  12:	01 00                	add    DWORD PTR [eax],eax
  14:	00 bc 01 00 00 00 00 	add    BYTE PTR [ecx+eax*1+0x0],bh
  1b:	20 03                	and    BYTE PTR [ebx],al
  1d:	e7 01                	out    0x1,eax
  1f:	00 00                	add    BYTE PTR [eax],al
  21:	00 00                	add    BYTE PTR [eax],al
  23:	00 00                	add    BYTE PTR [eax],al
  25:	02 01                	add    al,BYTE PTR [ecx]
  27:	06                   	push   es
  28:	ec                   	in     al,dx
  29:	00 00                	add    BYTE PTR [eax],al
  2b:	00 02                	add    BYTE PTR [edx],al
  2d:	01 06                	add    DWORD PTR [esi],eax
  2f:	e5 00                	in     eax,0x0
  31:	00 00                	add    BYTE PTR [eax],al
  33:	02 02                	add    al,BYTE PTR [edx]
  35:	05 1e 00 00 00       	add    eax,0x1e
  3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  41:	02 08                	add    cl,BYTE PTR [eax]
  43:	05 68 00 00 00       	add    eax,0x68
  48:	02 01                	add    al,BYTE PTR [ecx]
  4a:	08 e3                	or     bl,ah
  4c:	00 00                	add    BYTE PTR [eax],al
  4e:	00 02                	add    BYTE PTR [edx],al
  50:	02 07                	add    al,BYTE PTR [edi]
  52:	37                   	aaa    
  53:	01 00                	add    DWORD PTR [eax],eax
  55:	00 04 15 01 00 00 02 	add    BYTE PTR [edx*1+0x2000001],al
  5c:	34 61                	xor    al,0x61
  5e:	00 00                	add    BYTE PTR [eax],al
  60:	00 02                	add    BYTE PTR [edx],al
  62:	04 07                	add    al,0x7
  64:	08 01                	or     BYTE PTR [ecx],al
  66:	00 00                	add    BYTE PTR [eax],al
  68:	02 08                	add    cl,BYTE PTR [eax]
  6a:	07                   	pop    es
  6b:	fe 00                	inc    BYTE PTR [eax]
  6d:	00 00                	add    BYTE PTR [eax],al
  6f:	02 04 05 6d 00 00 00 	add    al,BYTE PTR [eax*1+0x6d]
  76:	04 52                	add    al,0x52
  78:	00 00                	add    BYTE PTR [eax],al
  7a:	00 03                	add    BYTE PTR [ebx],al
  7c:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
  7f:	00 00                	add    BYTE PTR [eax],al
  81:	05 74 6d 00 2c       	add    eax,0x2c006d74
  86:	03 2c 11             	add    ebp,DWORD PTR [ecx+edx*1]
  89:	01 00                	add    DWORD PTR [eax],eax
  8b:	00 06                	add    BYTE PTR [esi],al
  8d:	b5 01                	mov    ch,0x1
  8f:	00 00                	add    BYTE PTR [eax],al
  91:	03 2e                	add    ebp,DWORD PTR [esi]
  93:	3a 00                	cmp    al,BYTE PTR [eax]
  95:	00 00                	add    BYTE PTR [eax],al
  97:	00 06                	add    BYTE PTR [esi],al
  99:	76 01                	jbe    9c <main-0x31fff64>
  9b:	00 00                	add    BYTE PTR [eax],al
  9d:	03 2f                	add    ebp,DWORD PTR [edi]
  9f:	3a 00                	cmp    al,BYTE PTR [eax]
  a1:	00 00                	add    BYTE PTR [eax],al
  a3:	04 06                	add    al,0x6
  a5:	59                   	pop    ecx
  a6:	00 00                	add    BYTE PTR [eax],al
  a8:	00 03                	add    BYTE PTR [ebx],al
  aa:	30 3a                	xor    BYTE PTR [edx],bh
  ac:	00 00                	add    BYTE PTR [eax],al
  ae:	00 08                	add    BYTE PTR [eax],cl
  b0:	06                   	push   es
  b1:	1e                   	push   ds
  b2:	01 00                	add    DWORD PTR [eax],eax
  b4:	00 03                	add    BYTE PTR [ebx],al
  b6:	31 3a                	xor    DWORD PTR [edx],edi
  b8:	00 00                	add    BYTE PTR [eax],al
  ba:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
  bd:	61                   	popa   
  be:	00 00                	add    BYTE PTR [eax],al
  c0:	00 03                	add    BYTE PTR [ebx],al
  c2:	32 3a                	xor    bh,BYTE PTR [edx]
  c4:	00 00                	add    BYTE PTR [eax],al
  c6:	00 10                	add    BYTE PTR [eax],dl
  c8:	06                   	push   es
  c9:	f6 00 00             	test   BYTE PTR [eax],0x0
  cc:	00 03                	add    BYTE PTR [ebx],al
  ce:	33 3a                	xor    edi,DWORD PTR [edx]
  d0:	00 00                	add    BYTE PTR [eax],al
  d2:	00 14 06             	add    BYTE PTR [esi+eax*1],dl
  d5:	28 00                	sub    BYTE PTR [eax],al
  d7:	00 00                	add    BYTE PTR [eax],al
  d9:	03 34 3a             	add    esi,DWORD PTR [edx+edi*1]
  dc:	00 00                	add    BYTE PTR [eax],al
  de:	00 18                	add    BYTE PTR [eax],bl
  e0:	06                   	push   es
  e1:	53                   	push   ebx
  e2:	01 00                	add    DWORD PTR [eax],eax
  e4:	00 03                	add    BYTE PTR [ebx],al
  e6:	35 3a 00 00 00       	xor    eax,0x3a
  eb:	1c 06                	sbb    al,0x6
  ed:	7d 01                	jge    f0 <main-0x31fff10>
  ef:	00 00                	add    BYTE PTR [eax],al
  f1:	03 36                	add    esi,DWORD PTR [esi]
  f3:	3a 00                	cmp    al,BYTE PTR [eax]
  f5:	00 00                	add    BYTE PTR [eax],al
  f7:	20 06                	and    BYTE PTR [esi],al
  f9:	35 00 00 00 03       	xor    eax,0x3000000
  fe:	37                   	aaa    
  ff:	6f                   	outs   dx,DWORD PTR ds:[esi]
 100:	00 00                	add    BYTE PTR [eax],al
 102:	00 24 06             	add    BYTE PTR [esi+eax*1],ah
 105:	0e                   	push   cs
 106:	00 00                	add    BYTE PTR [eax],al
 108:	00 03                	add    BYTE PTR [ebx],al
 10a:	38 11                	cmp    BYTE PTR [ecx],dl
 10c:	01 00                	add    DWORD PTR [eax],eax
 10e:	00 28                	add    BYTE PTR [eax],ch
 110:	00 07                	add    BYTE PTR [edi],al
 112:	04 17                	add    al,0x17
 114:	01 00                	add    DWORD PTR [eax],eax
 116:	00 08                	add    BYTE PTR [eax],cl
 118:	25 00 00 00 02       	and    eax,0x2000000
 11d:	01 02                	add    DWORD PTR [edx],eax
 11f:	66 01 00             	add    WORD PTR [eax],ax
 122:	00 09                	add    BYTE PTR [ecx],cl
 124:	30 00                	xor    BYTE PTR [eax],al
 126:	00 00                	add    BYTE PTR [eax],al
 128:	01 13                	add    DWORD PTR [ebx],edx
 12a:	3a 00                	cmp    al,BYTE PTR [eax]
 12c:	00 00                	add    BYTE PTR [eax],al
 12e:	00 00                	add    BYTE PTR [eax],al
 130:	20 03                	and    BYTE PTR [ebx],al
 132:	e7 01                	out    0x1,eax
 134:	00 00                	add    BYTE PTR [eax],al
 136:	01 9c 32 02 00 00 0a 	add    DWORD PTR [edx+esi*1+0xa000002],ebx
 13d:	f1                   	icebp  
 13e:	00 00                	add    BYTE PTR [eax],al
 140:	00 01                	add    BYTE PTR [ecx],al
 142:	13 3a                	adc    edi,DWORD PTR [edx]
 144:	00 00                	add    BYTE PTR [eax],al
 146:	00 02                	add    BYTE PTR [edx],al
 148:	91                   	xchg   ecx,eax
 149:	00 0a                	add    BYTE PTR [edx],cl
 14b:	32 01                	xor    al,BYTE PTR [ecx]
 14d:	00 00                	add    BYTE PTR [eax],al
 14f:	01 13                	add    DWORD PTR [ebx],edx
 151:	32 02                	xor    al,BYTE PTR [edx]
 153:	00 00                	add    BYTE PTR [eax],al
 155:	02 91 04 0b 70 69    	add    dl,BYTE PTR [ecx+0x69700b04]
 15b:	64 00 01             	add    BYTE PTR fs:[ecx],al
 15e:	15 3a 00 00 00       	adc    eax,0x3a
 163:	02 75 6c             	add    dh,BYTE PTR [ebp+0x6c]
 166:	0c 6c                	or     al,0x6c
 168:	01 00                	add    DWORD PTR [eax],eax
 16a:	00 01                	add    BYTE PTR [ecx],al
 16c:	16                   	push   ss
 16d:	3e 02 00             	add    al,BYTE PTR ds:[eax]
 170:	00 0d 47 00 00 00    	add    BYTE PTR ds:0x47,cl
 176:	01 17                	add    DWORD PTR [edi],edx
 178:	76 00                	jbe    17a <main-0x31ffe86>
 17a:	00 00                	add    BYTE PTR [eax],al
 17c:	02 75 58             	add    dh,BYTE PTR [ebp+0x58]
 17f:	0d 4a 01 00 00       	or     eax,0x14a
 184:	01 17                	add    DWORD PTR [edi],edx
 186:	76 00                	jbe    188 <main-0x31ffe78>
 188:	00 00                	add    BYTE PTR [eax],al
 18a:	02 75 50             	add    dh,BYTE PTR [ebp+0x50]
 18d:	0d 3f 00 00 00       	or     eax,0x3f
 192:	01 17                	add    DWORD PTR [edi],edx
 194:	76 00                	jbe    196 <main-0x31ffe6a>
 196:	00 00                	add    BYTE PTR [eax],al
 198:	02 75 4c             	add    dh,BYTE PTR [ebp+0x4c]
 19b:	0d 8e 01 00 00       	or     eax,0x18e
 1a0:	01 18                	add    DWORD PTR [eax],ebx
 1a2:	3e 02 00             	add    al,BYTE PTR ds:[eax]
 1a5:	00 02                	add    BYTE PTR [edx],al
 1a7:	75 68                	jne    211 <main-0x31ffdef>
 1a9:	0d 86 01 00 00       	or     eax,0x186
 1ae:	01 18                	add    DWORD PTR [eax],ebx
 1b0:	3e 02 00             	add    al,BYTE PTR ds:[eax]
 1b3:	00 02                	add    BYTE PTR [edx],al
 1b5:	75 64                	jne    21b <main-0x31ffde5>
 1b7:	0d 06 00 00 00       	or     eax,0x6
 1bc:	01 19                	add    DWORD PTR [ecx],ebx
 1be:	38 02                	cmp    BYTE PTR [edx],al
 1c0:	00 00                	add    BYTE PTR [eax],al
 1c2:	02 75 60             	add    dh,BYTE PTR [ebp+0x60]
 1c5:	0d ae 01 00 00       	or     eax,0x1ae
 1ca:	01 1a                	add    DWORD PTR [edx],ebx
 1cc:	3a 00                	cmp    al,BYTE PTR [eax]
 1ce:	00 00                	add    BYTE PTR [eax],al
 1d0:	02 75 74             	add    dh,BYTE PTR [ebp+0x74]
 1d3:	0e                   	push   cs
 1d4:	71 00                	jno    1d6 <main-0x31ffe2a>
 1d6:	20 03                	and    BYTE PTR [ebx],al
 1d8:	47                   	inc    edi
 1d9:	00 00                	add    BYTE PTR [eax],al
 1db:	00 ef                	add    bh,ch
 1dd:	01 00                	add    DWORD PTR [eax],eax
 1df:	00 0b                	add    BYTE PTR [ebx],cl
 1e1:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 1e4:	00 01                	add    BYTE PTR [ecx],al
 1e6:	2a 3a                	sub    bh,BYTE PTR [edx]
 1e8:	00 00                	add    BYTE PTR [eax],al
 1ea:	00 02                	add    BYTE PTR [edx],al
 1ec:	75 70                	jne    25e <main-0x31ffda2>
 1ee:	00 0e                	add    BYTE PTR [esi],cl
 1f0:	be 00 20 03 15       	mov    esi,0x15032000
 1f5:	00 00                	add    BYTE PTR [eax],al
 1f7:	00 19                	add    BYTE PTR [ecx],bl
 1f9:	02 00                	add    al,BYTE PTR [eax]
 1fb:	00 0d a1 01 00 00    	add    BYTE PTR ds:0x1a1,cl
 201:	01 31                	add    DWORD PTR [ecx],esi
 203:	3a 00                	cmp    al,BYTE PTR [eax]
 205:	00 00                	add    BYTE PTR [eax],al
 207:	02 75 48             	add    dh,BYTE PTR [ebp+0x48]
 20a:	0d 00 00 00 00       	or     eax,0x0
 20f:	01 32                	add    DWORD PTR [edx],esi
 211:	32 02                	xor    al,BYTE PTR [edx]
 213:	00 00                	add    BYTE PTR [eax],al
 215:	02 75 5c             	add    dh,BYTE PTR [ebp+0x5c]
 218:	00 0f                	add    BYTE PTR [edi],cl
 21a:	03 01                	add    eax,DWORD PTR [ecx]
 21c:	20 03                	and    BYTE PTR [ebx],al
 21e:	4c                   	dec    esp
 21f:	00 00                	add    BYTE PTR [eax],al
 221:	00 0d 76 00 00 00    	add    BYTE PTR ds:0x76,cl
 227:	01 40 3a             	add    DWORD PTR [eax+0x3a],eax
 22a:	00 00                	add    BYTE PTR [eax],al
 22c:	00 02                	add    BYTE PTR [edx],al
 22e:	75 54                	jne    284 <main-0x31ffd7c>
 230:	00 00                	add    BYTE PTR [eax],al
 232:	07                   	pop    es
 233:	04 38                	add    al,0x38
 235:	02 00                	add    al,BYTE PTR [eax]
 237:	00 07                	add    BYTE PTR [edi],al
 239:	04 25                	add    al,0x25
 23b:	00 00                	add    BYTE PTR [eax],al
 23d:	00 07                	add    BYTE PTR [edi],al
 23f:	04 81                	add    al,0x81
 241:	00 00                	add    BYTE PTR [eax],al
 243:	00 10                	add    BYTE PTR [eax],dl
 245:	98                   	cwde   
 246:	01 00                	add    DWORD PTR [eax],eax
 248:	00 04 34             	add    BYTE PTR [esp+esi*1],al
 24b:	56                   	push   esi
 24c:	00 00                	add    BYTE PTR [eax],al
 24e:	00 05 03 04 20 20    	add    BYTE PTR ds:0x20200403,al
 254:	03 10                	add    edx,DWORD PTR [eax]
 256:	da 00                	fiadd  DWORD PTR [eax]
 258:	00 00                	add    BYTE PTR [eax],al
 25a:	04 35                	add    al,0x35
 25c:	56                   	push   esi
 25d:	00 00                	add    BYTE PTR [eax],al
 25f:	00 05 03 08 20 20    	add    BYTE PTR ds:0x20200803,al
 265:	03 10                	add    edx,DWORD PTR [eax]
 267:	16                   	push   ss
 268:	00 00                	add    BYTE PTR [eax],al
 26a:	00 04 36             	add    BYTE PTR [esi+esi*1],al
 26d:	56                   	push   esi
 26e:	00 00                	add    BYTE PTR [eax],al
 270:	00 05 03 00 20 20    	add    BYTE PTR ds:0x20200003,al
 276:	03 10                	add    edx,DWORD PTR [eax]
 278:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 279:	01 00                	add    DWORD PTR [eax],eax
 27b:	00 04 37             	add    BYTE PTR [edi+esi*1],al
 27e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 27f:	00 00                	add    BYTE PTR [eax],al
 281:	00 05 03 10 20 20    	add    BYTE PTR ds:0x20201003,al
 287:	03 10                	add    edx,DWORD PTR [eax]
 289:	26 01 00             	add    DWORD PTR es:[eax],eax
 28c:	00 05 4b 32 02 00    	add    BYTE PTR ds:0x2324b,al
 292:	00 05 03 0c 20 20    	add    BYTE PTR ds:0x20200c03,al
 298:	03 00                	add    eax,DWORD PTR [eax]

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
  c1:	01 13                	add    DWORD PTR [ebx],edx
  c3:	00 00                	add    BYTE PTR [eax],al
  c5:	0f 0b                	ud2    
  c7:	01 11                	add    DWORD PTR [ecx],edx
  c9:	01 12                	add    DWORD PTR [edx],edx
  cb:	06                   	push   es
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
  d1:	03 0e                	add    ecx,DWORD PTR [esi]
  d3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  d5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  d7:	49                   	dec    ecx
  d8:	13 3f                	adc    edi,DWORD PTR [edi]
  da:	19 02                	sbb    DWORD PTR [edx],eax
  dc:	18 00                	sbb    BYTE PTR [eax],al
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
  14:	e7 01                	out    0x1,eax
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	04 01                	add    al,0x1
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
  c7:	f3 77 00             	repz ja ca <main-0x31fff36>
  ca:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
  cd:	92                   	xchg   edx,eax
  ce:	00 02                	add    BYTE PTR [edx],al
  d0:	04 03                	add    al,0x3
  d2:	08 2f                	or     BYTE PTR [edi],ch
  d4:	00 02                	add    BYTE PTR [edx],al
  d6:	04 03                	add    al,0x3
  d8:	08 e1                	or     cl,ah
  da:	00 02                	add    BYTE PTR [edx],al
  dc:	04 01                	add    al,0x1
  de:	06                   	push   es
  df:	4a                   	dec    edx
  e0:	06                   	push   es
  e1:	79 6b                	jns    14e <main-0x31ffeb2>
  e3:	08 4c a1 83          	or     BYTE PTR [ecx+eiz*4-0x7d],cl
  e7:	f5                   	cmc    
  e8:	83 68 08 4b          	sub    DWORD PTR [eax+0x8],0x4b
  ec:	68 08 2f a2 08       	push   0x8a22f08
  f1:	40                   	inc    eax
  f2:	68 08 2f 94 08       	push   0x8942f08
  f7:	21 68 83             	and    DWORD PTR [eax-0x7d],ebp
  fa:	f3 91                	repz xchg ecx,eax
  fc:	03 0d 66 d7 d7 d7    	add    ecx,DWORD PTR ds:0xd7d7d766
 102:	3d 02 0a 00 01       	cmp    eax,0x1000a02
 107:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	61                   	popa   
   1:	72 67                	jb     6a <main-0x31fff96>
   3:	76 6c                	jbe    71 <main-0x31fff8f>
   5:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
   8:	65 63 70 67          	arpl   WORD PTR gs:[eax+0x67],si
   c:	6d                   	ins    DWORD PTR es:[edi],dx
   d:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
  11:	7a 6f                	jp     82 <main-0x31fff7e>
  13:	6e                   	outs   dx,BYTE PTR ds:[esi]
  14:	65 00 68 65          	add    BYTE PTR gs:[eax+0x65],ch
  18:	61                   	popa   
  19:	70 45                	jo     60 <main-0x31fffa0>
  1b:	6e                   	outs   dx,BYTE PTR ds:[esi]
  1c:	64 00 73 68          	add    BYTE PTR fs:[ebx+0x68],dh
  20:	6f                   	outs   dx,DWORD PTR ds:[esi]
  21:	72 74                	jb     97 <main-0x31fff69>
  23:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
  26:	74 00                	je     28 <main-0x31fffd8>
  28:	74 6d                	je     97 <main-0x31fff69>
  2a:	5f                   	pop    edi
  2b:	77 64                	ja     91 <main-0x31fff6f>
  2d:	61                   	popa   
  2e:	79 00                	jns    30 <main-0x31fffd0>
  30:	6d                   	ins    DWORD PTR es:[edi],dx
  31:	61                   	popa   
  32:	69 6e 00 74 6d 5f 67 	imul   ebp,DWORD PTR [esi+0x0],0x675f6d74
  39:	6d                   	ins    DWORD PTR es:[edi],dx
  3a:	74 6f                	je     ab <main-0x31fff55>
  3c:	66                   	data16
  3d:	66                   	data16
  3e:	00 65 6c             	add    BYTE PTR [ebp+0x6c],ah
  41:	61                   	popa   
  42:	70 73                	jo     b7 <main-0x31fff49>
  44:	65 64 00 73 74       	gs add BYTE PTR fs:gs:[ebx+0x74],dh
  49:	61                   	popa   
  4a:	72 74                	jb     c0 <main-0x31fff40>
  4c:	54                   	push   esp
  4d:	69 63 6b 73 00 74 69 	imul   esp,DWORD PTR [ebx+0x6b],0x69740073
  54:	6d                   	ins    DWORD PTR es:[edi],dx
  55:	65                   	gs
  56:	5f                   	pop    edi
  57:	74 00                	je     59 <main-0x31fffa7>
  59:	74 6d                	je     c8 <main-0x31fff38>
  5b:	5f                   	pop    edi
  5c:	68 6f 75 72 00       	push   0x72756f
  61:	74 6d                	je     d0 <main-0x31fff30>
  63:	5f                   	pop    edi
  64:	6d                   	ins    DWORD PTR es:[edi],dx
  65:	6f                   	outs   dx,DWORD PTR ds:[esi]
  66:	6e                   	outs   dx,BYTE PTR ds:[esi]
  67:	00 6c 6f 6e          	add    BYTE PTR [edi+ebp*2+0x6e],ch
  6b:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  6f:	6e                   	outs   dx,BYTE PTR ds:[esi]
  70:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
  74:	74 00                	je     76 <main-0x31fff8a>
  76:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
  79:	6c                   	ins    BYTE PTR es:[edi],dx
  7a:	64                   	fs
  7b:	50                   	push   eax
  7c:	69 64 00 47 4e 55 20 	imul   esp,DWORD PTR [eax+eax*1+0x47],0x4320554e
  83:	43 
  84:	39 39                	cmp    DWORD PTR [ecx],edi
  86:	20 35 2e 33 2e 30    	and    BYTE PTR ds:0x302e332e,dh
  8c:	20 2d 6d 33 32 20    	and    BYTE PTR ds:0x2032336d,ch
  92:	2d 6d 61 73 6d       	sub    eax,0x6d73616d
  97:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  9c:	6c                   	ins    BYTE PTR es:[edi],dx
  9d:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  a3:	65                   	gs
  a4:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  a9:	72 69                	jb     114 <main-0x31ffeec>
  ab:	63 20                	arpl   WORD PTR [eax],sp
  ad:	2d 6d 61 72 63       	sub    eax,0x6372616d
  b2:	68 3d 70 65 6e       	push   0x6e65703d
  b7:	74 69                	je     122 <main-0x31ffede>
  b9:	75 6d                	jne    128 <main-0x31ffed8>
  bb:	70 72                	jo     12f <main-0x31ffed1>
  bd:	6f                   	outs   dx,DWORD PTR ds:[esi]
  be:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  c4:	74 64                	je     12a <main-0x31ffed6>
  c6:	3d 63 39 39 20       	cmp    eax,0x20393963
  cb:	2d 66 66 72 65       	sub    eax,0x65726666
  d0:	65                   	gs
  d1:	73 74                	jae    147 <main-0x31ffeb9>
  d3:	61                   	popa   
  d4:	6e                   	outs   dx,BYTE PTR ds:[esi]
  d5:	64 69 6e 67 00 68 65 	imul   ebp,DWORD PTR fs:[esi+0x67],0x61656800
  dc:	61 
  dd:	70 43                	jo     122 <main-0x31ffede>
  df:	75 72                	jne    153 <main-0x31ffead>
  e1:	72 00                	jb     e3 <main-0x31fff1d>
  e3:	75 6e                	jne    153 <main-0x31ffead>
  e5:	73 69                	jae    150 <main-0x31ffeb0>
  e7:	67 6e                	outs   dx,BYTE PTR ds:[si]
  e9:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
  ee:	61                   	popa   
  ef:	72 00                	jb     f1 <main-0x31fff0f>
  f1:	61                   	popa   
  f2:	72 67                	jb     15b <main-0x31ffea5>
  f4:	63 00                	arpl   WORD PTR [eax],ax
  f6:	74 6d                	je     165 <main-0x31ffe9b>
  f8:	5f                   	pop    edi
  f9:	79 65                	jns    160 <main-0x31ffea0>
  fb:	61                   	popa   
  fc:	72 00                	jb     fe <main-0x31fff02>
  fe:	6c                   	ins    BYTE PTR es:[edi],dx
  ff:	6f                   	outs   dx,DWORD PTR ds:[esi]
 100:	6e                   	outs   dx,BYTE PTR ds:[esi]
 101:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 105:	6e                   	outs   dx,BYTE PTR ds:[esi]
 106:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 10a:	73 69                	jae    175 <main-0x31ffe8b>
 10c:	67 6e                	outs   dx,BYTE PTR ds:[si]
 10e:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 113:	74 00                	je     115 <main-0x31ffeeb>
 115:	75 69                	jne    180 <main-0x31ffe80>
 117:	6e                   	outs   dx,BYTE PTR ds:[esi]
 118:	74 33                	je     14d <main-0x31ffeb3>
 11a:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 11d:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 121:	6d                   	ins    DWORD PTR es:[edi],dx
 122:	64                   	fs
 123:	61                   	popa   
 124:	79 00                	jns    126 <main-0x31ffeda>
 126:	70 72                	jo     19a <main-0x31ffe66>
 128:	6f                   	outs   dx,DWORD PTR ds:[esi]
 129:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 12c:	73 45                	jae    173 <main-0x31ffe8d>
 12e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 12f:	76 70                	jbe    1a1 <main-0x31ffe5f>
 131:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 134:	67 76 00             	addr16 jbe 137 <main-0x31ffec9>
 137:	73 68                	jae    1a1 <main-0x31ffe5f>
 139:	6f                   	outs   dx,DWORD PTR ds:[esi]
 13a:	72 74                	jb     1b0 <main-0x31ffe50>
 13c:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 13f:	73 69                	jae    1aa <main-0x31ffe56>
 141:	67 6e                	outs   dx,BYTE PTR ds:[si]
 143:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 148:	74 00                	je     14a <main-0x31ffeb6>
 14a:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 14c:	64                   	fs
 14d:	54                   	push   esp
 14e:	69 63 6b 73 00 74 6d 	imul   esp,DWORD PTR [ebx+0x6b],0x6d740073
 155:	5f                   	pop    edi
 156:	79 64                	jns    1bc <main-0x31ffe44>
 158:	61                   	popa   
 159:	79 00                	jns    15b <main-0x31ffea5>
 15b:	74 65                	je     1c2 <main-0x31ffe3e>
 15d:	73 74                	jae    1d3 <main-0x31ffe2d>
 15f:	74 69                	je     1ca <main-0x31ffe36>
 161:	6d                   	ins    DWORD PTR es:[edi],dx
 162:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax
 166:	5f                   	pop    edi
 167:	42                   	inc    edx
 168:	6f                   	outs   dx,DWORD PTR ds:[esi]
 169:	6f                   	outs   dx,DWORD PTR ds:[esi]
 16a:	6c                   	ins    BYTE PTR es:[edi],dx
 16b:	00 74 6f 74          	add    BYTE PTR [edi+ebp*2+0x74],dh
 16f:	61                   	popa   
 170:	6c                   	ins    BYTE PTR es:[edi],dx
 171:	54                   	push   esp
 172:	69 6d 65 00 74 6d 5f 	imul   ebp,DWORD PTR [ebp+0x65],0x5f6d7400
 179:	6d                   	ins    DWORD PTR es:[edi],dx
 17a:	69 6e 00 74 6d 5f 69 	imul   ebp,DWORD PTR [esi+0x0],0x695f6d74
 181:	73 64                	jae    1e7 <main-0x31ffe19>
 183:	73 74                	jae    1f9 <main-0x31ffe07>
 185:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 188:	64                   	fs
 189:	54                   	push   esp
 18a:	69 6d 65 00 73 74 61 	imul   ebp,DWORD PTR [ebp+0x65],0x61747300
 191:	72 74                	jb     207 <main-0x31ffdf9>
 193:	54                   	push   esp
 194:	69 6d 65 00 68 65 61 	imul   ebp,DWORD PTR [ebp+0x65],0x61656800
 19b:	70 42                	jo     1df <main-0x31ffe21>
 19d:	61                   	popa   
 19e:	73 65                	jae    205 <main-0x31ffdfb>
 1a0:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 1a3:	67 63 6c 00          	arpl   WORD PTR [si+0x0],bp
 1a7:	6c                   	ins    BYTE PTR es:[edi],dx
 1a8:	69 62 63 54 5a 00 72 	imul   esp,DWORD PTR [edx+0x63],0x72005a54
 1af:	65                   	gs
 1b0:	74 56                	je     208 <main-0x31ffdf8>
 1b2:	61                   	popa   
 1b3:	6c                   	ins    BYTE PTR es:[edi],dx
 1b4:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 1b8:	73 65                	jae    21f <main-0x31ffde1>
 1ba:	63 00                	arpl   WORD PTR [eax],ax
 1bc:	2f                   	das    
 1bd:	68 6f 6d 65 2f       	push   0x2f656d6f
 1c2:	79 6f                	jns    233 <main-0x31ffdcd>
 1c4:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 1cb:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1cc:	73 2f                	jae    1fd <main-0x31ffe03>
 1ce:	61                   	popa   
 1cf:	70 72                	jo     243 <main-0x31ffdbd>
 1d1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1d2:	6a 2f                	push   0x2f
 1d4:	74 69                	je     23f <main-0x31ffdc1>
 1d6:	6d                   	ins    DWORD PTR es:[edi],dx
 1d7:	65                   	gs
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
