
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
/home/yogi/src/os/aproj/time/testtime.c:24
    struct tm *totalTime;
    time_t startTime, endTime, elapsed;
    int retVal=0;
 320001b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/time/testtime.c:27
    
#ifdef DEBUG
    print("Param count=%u\n",argc);
 3200022:	83 ec 08             	sub    esp,0x8
 3200025:	ff 33                	push   DWORD PTR [ebx]
 3200027:	68 00 10 20 03       	push   0x3201000
 320002c:	e8 5f 02 00 00       	call   3200290 <main+0x290>
 3200031:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:28
    for (int cnt=0;cnt<argc;cnt++)
 3200034:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 320003b:	eb 29                	jmp    3200066 <main+0x66>
/home/yogi/src/os/aproj/time/testtime.c:29 (discriminator 3)
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
 320005a:	e8 31 02 00 00       	call   3200290 <main+0x290>
 320005f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:28 (discriminator 3)
    time_t startTime, endTime, elapsed;
    int retVal=0;
    
#ifdef DEBUG
    print("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
 3200062:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/time/testtime.c:28 (discriminator 1)
 3200066:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3200069:	3b 03                	cmp    eax,DWORD PTR [ebx]
 320006b:	7c d0                	jl     320003d <main+0x3d>
/home/yogi/src/os/aproj/time/testtime.c:31
        print("Param %u=%s\n",cnt,argv[cnt]);
#endif
    if (argc<2)
 320006d:	83 3b 01             	cmp    DWORD PTR [ebx],0x1
 3200070:	7f 17                	jg     3200089 <main+0x89>
/home/yogi/src/os/aproj/time/testtime.c:33
    {
        print("Error: Not enough parameters supplied, must pass path to program to be run\n");
 3200072:	83 ec 0c             	sub    esp,0xc
 3200075:	68 20 10 20 03       	push   0x3201020
 320007a:	e8 11 02 00 00       	call   3200290 <main+0x290>
 320007f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:34
        retVal=-1;
 3200082:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
/home/yogi/src/os/aproj/time/testtime.c:36
    }
    char* execpgm=malloc(512);
 3200089:	83 ec 0c             	sub    esp,0xc
 320008c:	68 00 02 00 00       	push   0x200
 3200091:	e8 0a 02 00 00       	call   32002a0 <main+0x2a0>
 3200096:	83 c4 10             	add    esp,0x10
 3200099:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/time/testtime.c:37
    if (argv[1]==NULL)
 320009c:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 320009f:	83 c0 04             	add    eax,0x4
 32000a2:	8b 00                	mov    eax,DWORD PTR [eax]
 32000a4:	85 c0                	test   eax,eax
 32000a6:	75 19                	jne    32000c1 <main+0xc1>
/home/yogi/src/os/aproj/time/testtime.c:39
    {
        print("Parameter 2 must be a program name to run\n");
 32000a8:	83 ec 0c             	sub    esp,0xc
 32000ab:	68 6c 10 20 03       	push   0x320106c
 32000b0:	e8 db 01 00 00       	call   3200290 <main+0x290>
 32000b5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:40
        retVal=-4;
 32000b8:	c7 45 f4 fc ff ff ff 	mov    DWORD PTR [ebp-0xc],0xfffffffc
 32000bf:	eb 54                	jmp    3200115 <main+0x115>
/home/yogi/src/os/aproj/time/testtime.c:44
    }
    else
    {
        strcpy(execpgm,argv[1]);
 32000c1:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 32000c4:	83 c0 04             	add    eax,0x4
 32000c7:	8b 00                	mov    eax,DWORD PTR [eax]
 32000c9:	83 ec 08             	sub    esp,0x8
 32000cc:	50                   	push   eax
 32000cd:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 32000d0:	e8 9b 01 00 00       	call   3200270 <main+0x270>
 32000d5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:45
        strtrim(execpgm);
 32000d8:	83 ec 0c             	sub    esp,0xc
 32000db:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 32000de:	e8 ed 01 00 00       	call   32002d0 <main+0x2d0>
 32000e3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:46
        if (retVal==0)
 32000e6:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 32000ea:	75 29                	jne    3200115 <main+0x115>
/home/yogi/src/os/aproj/time/testtime.c:48
        {
            if (strlen(execpgm)==0)
 32000ec:	83 ec 0c             	sub    esp,0xc
 32000ef:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 32000f2:	e8 f9 01 00 00       	call   32002f0 <main+0x2f0>
 32000f7:	83 c4 10             	add    esp,0x10
 32000fa:	85 c0                	test   eax,eax
 32000fc:	75 17                	jne    3200115 <main+0x115>
/home/yogi/src/os/aproj/time/testtime.c:50
            {
                print("Parameter 2 must be a program name to run\n");
 32000fe:	83 ec 0c             	sub    esp,0xc
 3200101:	68 6c 10 20 03       	push   0x320106c
 3200106:	e8 85 01 00 00       	call   3200290 <main+0x290>
 320010b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:51
                retVal=-2;
 320010e:	c7 45 f4 fe ff ff ff 	mov    DWORD PTR [ebp-0xc],0xfffffffe
/home/yogi/src/os/aproj/time/testtime.c:55
            }
        }
    }
    if (retVal==0)
 3200115:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3200119:	0f 85 1f 01 00 00    	jne    320023e <main+0x23e>
/home/yogi/src/os/aproj/time/testtime.c:57
    {
        startTime=time();
 320011f:	e8 bc 01 00 00       	call   32002e0 <main+0x2e0>
 3200124:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/time/testtime.c:58
        pid=exec(execpgm,argc-1,argv+1);
 3200127:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 320012a:	8d 50 04             	lea    edx,[eax+0x4]
 320012d:	8b 03                	mov    eax,DWORD PTR [ebx]
 320012f:	83 e8 01             	sub    eax,0x1
 3200132:	83 ec 04             	sub    esp,0x4
 3200135:	52                   	push   edx
 3200136:	50                   	push   eax
 3200137:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 320013a:	e8 81 01 00 00       	call   32002c0 <main+0x2c0>
 320013f:	83 c4 10             	add    esp,0x10
 3200142:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/time/testtime.c:59
        if (pid==0)
 3200145:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3200149:	75 25                	jne    3200170 <main+0x170>
/home/yogi/src/os/aproj/time/testtime.c:61
        {
            print("Error executing %s\n",argv[1]);
 320014b:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 320014e:	83 c0 04             	add    eax,0x4
 3200151:	8b 00                	mov    eax,DWORD PTR [eax]
 3200153:	83 ec 08             	sub    esp,0x8
 3200156:	50                   	push   eax
 3200157:	68 97 10 20 03       	push   0x3201097
 320015c:	e8 2f 01 00 00       	call   3200290 <main+0x290>
 3200161:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:62
            retVal=-3;
 3200164:	c7 45 f4 fd ff ff ff 	mov    DWORD PTR [ebp-0xc],0xfffffffd
 320016b:	e9 ce 00 00 00       	jmp    320023e <main+0x23e>
/home/yogi/src/os/aproj/time/testtime.c:66
        }
        else
        {
            waitpid(pid);
 3200170:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3200173:	83 ec 0c             	sub    esp,0xc
 3200176:	50                   	push   eax
 3200177:	e8 04 01 00 00       	call   3200280 <main+0x280>
 320017c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:67
            endTime=time();
 320017f:	e8 5c 01 00 00       	call   32002e0 <main+0x2e0>
 3200184:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/time/testtime.c:68
            elapsed=(endTime-startTime);
 3200187:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 320018a:	2b 45 e4             	sub    eax,DWORD PTR [ebp-0x1c]
 320018d:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/time/testtime.c:69
            totalTime=malloc(sizeof(struct tm));    
 3200190:	83 ec 0c             	sub    esp,0xc
 3200193:	6a 2c                	push   0x2c
 3200195:	e8 06 01 00 00       	call   32002a0 <main+0x2a0>
 320019a:	83 c4 10             	add    esp,0x10
 320019d:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/aproj/time/testtime.c:70
            print("Elapsed ticks = %u\n",elapsed);
 32001a0:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 32001a3:	83 ec 08             	sub    esp,0x8
 32001a6:	50                   	push   eax
 32001a7:	68 ab 10 20 03       	push   0x32010ab
 32001ac:	e8 df 00 00 00       	call   3200290 <main+0x290>
 32001b1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:71
            int ms=elapsed%TICKS_PER_SECOND;
 32001b4:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
 32001b7:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
 32001bc:	89 c8                	mov    eax,ecx
 32001be:	f7 ea                	imul   edx
 32001c0:	c1 fa 05             	sar    edx,0x5
 32001c3:	89 c8                	mov    eax,ecx
 32001c5:	c1 f8 1f             	sar    eax,0x1f
 32001c8:	29 c2                	sub    edx,eax
 32001ca:	89 d0                	mov    eax,edx
 32001cc:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 32001cf:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 32001d2:	6b c0 64             	imul   eax,eax,0x64
 32001d5:	29 c1                	sub    ecx,eax
 32001d7:	89 c8                	mov    eax,ecx
 32001d9:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/time/testtime.c:72
            elapsed/= TICKS_PER_SECOND;
 32001dc:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
 32001df:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
 32001e4:	89 c8                	mov    eax,ecx
 32001e6:	f7 ea                	imul   edx
 32001e8:	c1 fa 05             	sar    edx,0x5
 32001eb:	89 c8                	mov    eax,ecx
 32001ed:	c1 f8 1f             	sar    eax,0x1f
 32001f0:	29 c2                	sub    edx,eax
 32001f2:	89 d0                	mov    eax,edx
 32001f4:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/time/testtime.c:73
            gmtime_r(&elapsed,totalTime);
 32001f7:	83 ec 08             	sub    esp,0x8
 32001fa:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 32001fd:	8d 45 d4             	lea    eax,[ebp-0x2c]
 3200200:	50                   	push   eax
 3200201:	e8 aa 00 00 00       	call   32002b0 <main+0x2b0>
 3200206:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:74
            print("Elapsed time = %02u:%02u:%02u.%03u\n",totalTime->tm_hour,totalTime->tm_min,totalTime->tm_sec,ms);
 3200209:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 320020c:	8b 08                	mov    ecx,DWORD PTR [eax]
 320020e:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3200211:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 3200214:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3200217:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 320021a:	83 ec 0c             	sub    esp,0xc
 320021d:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 3200220:	51                   	push   ecx
 3200221:	52                   	push   edx
 3200222:	50                   	push   eax
 3200223:	68 c0 10 20 03       	push   0x32010c0
 3200228:	e8 63 00 00 00       	call   3200290 <main+0x290>
 320022d:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/aproj/time/testtime.c:75
            free(totalTime);
 3200230:	83 ec 0c             	sub    esp,0xc
 3200233:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 3200236:	e8 c5 00 00 00       	call   3200300 <main+0x300>
 320023b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:78
        }
    }
    free(execpgm);
 320023e:	83 ec 0c             	sub    esp,0xc
 3200241:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3200244:	e8 b7 00 00 00       	call   3200300 <main+0x300>
 3200249:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/time/testtime.c:79
    return (retVal);
 320024c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
/home/yogi/src/os/aproj/time/testtime.c:80
}
 320024f:	8d 65 f8             	lea    esp,[ebp-0x8]
 3200252:	59                   	pop    ecx
 3200253:	5b                   	pop    ebx
 3200254:	5d                   	pop    ebp
 3200255:	8d 61 fc             	lea    esp,[ecx-0x4]
 3200258:	c3                   	ret    

Disassembly of section .plt:

03200260 <.plt>:
 3200260:	ff 35 a4 03 20 03    	push   DWORD PTR ds:0x32003a4
 3200266:	ff 25 a8 03 20 03    	jmp    DWORD PTR ds:0x32003a8
 320026c:	00 00                	add    BYTE PTR [eax],al
 320026e:	00 00                	add    BYTE PTR [eax],al
 3200270:	ff 25 ac 03 20 03    	jmp    DWORD PTR ds:0x32003ac
 3200276:	68 00 00 00 00       	push   0x0
 320027b:	e9 e0 ff ff ff       	jmp    3200260 <main+0x260>
 3200280:	ff 25 b0 03 20 03    	jmp    DWORD PTR ds:0x32003b0
 3200286:	68 08 00 00 00       	push   0x8
 320028b:	e9 d0 ff ff ff       	jmp    3200260 <main+0x260>
 3200290:	ff 25 b4 03 20 03    	jmp    DWORD PTR ds:0x32003b4
 3200296:	68 10 00 00 00       	push   0x10
 320029b:	e9 c0 ff ff ff       	jmp    3200260 <main+0x260>
 32002a0:	ff 25 b8 03 20 03    	jmp    DWORD PTR ds:0x32003b8
 32002a6:	68 18 00 00 00       	push   0x18
 32002ab:	e9 b0 ff ff ff       	jmp    3200260 <main+0x260>
 32002b0:	ff 25 bc 03 20 03    	jmp    DWORD PTR ds:0x32003bc
 32002b6:	68 20 00 00 00       	push   0x20
 32002bb:	e9 a0 ff ff ff       	jmp    3200260 <main+0x260>
 32002c0:	ff 25 c0 03 20 03    	jmp    DWORD PTR ds:0x32003c0
 32002c6:	68 28 00 00 00       	push   0x28
 32002cb:	e9 90 ff ff ff       	jmp    3200260 <main+0x260>
 32002d0:	ff 25 c4 03 20 03    	jmp    DWORD PTR ds:0x32003c4
 32002d6:	68 30 00 00 00       	push   0x30
 32002db:	e9 80 ff ff ff       	jmp    3200260 <main+0x260>
 32002e0:	ff 25 c8 03 20 03    	jmp    DWORD PTR ds:0x32003c8
 32002e6:	68 38 00 00 00       	push   0x38
 32002eb:	e9 70 ff ff ff       	jmp    3200260 <main+0x260>
 32002f0:	ff 25 cc 03 20 03    	jmp    DWORD PTR ds:0x32003cc
 32002f6:	68 40 00 00 00       	push   0x40
 32002fb:	e9 60 ff ff ff       	jmp    3200260 <main+0x260>
 3200300:	ff 25 d0 03 20 03    	jmp    DWORD PTR ds:0x32003d0
 3200306:	68 48 00 00 00       	push   0x48
 320030b:	e9 50 ff ff ff       	jmp    3200260 <main+0x260>

Disassembly of section .dynamic:

03200310 <_DYNAMIC>:
 3200310:	01 00                	add    DWORD PTR [eax],eax
 3200312:	00 00                	add    BYTE PTR [eax],al
 3200314:	01 00                	add    DWORD PTR [eax],eax
 3200316:	00 00                	add    BYTE PTR [eax],al
 3200318:	0f 00 00             	sldt   WORD PTR [eax]
 320031b:	00 4c 00 00          	add    BYTE PTR [eax+eax*1+0x0],cl
 320031f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3200322:	00 00                	add    BYTE PTR [eax],al
 3200324:	68 12 20 03 05       	push   0x5032012
 3200329:	00 00                	add    BYTE PTR [eax],al
 320032b:	00 f8                	add    al,bh
 320032d:	11 20                	adc    DWORD PTR [eax],esp
 320032f:	03 06                	add    eax,DWORD PTR [esi]
 3200331:	00 00                	add    BYTE PTR [eax],al
 3200333:	00 48 11             	add    BYTE PTR [eax+0x11],cl
 3200336:	20 03                	and    BYTE PTR [ebx],al
 3200338:	0a 00                	or     al,BYTE PTR [eax]
 320033a:	00 00                	add    BYTE PTR [eax],al
 320033c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320033d:	00 00                	add    BYTE PTR [eax],al
 320033f:	00 0b                	add    BYTE PTR [ebx],cl
 3200341:	00 00                	add    BYTE PTR [eax],al
 3200343:	00 10                	add    BYTE PTR [eax],dl
 3200345:	00 00                	add    BYTE PTR [eax],al
 3200347:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 320034d:	00 00                	add    BYTE PTR [eax],al
 320034f:	00 03                	add    BYTE PTR [ebx],al
 3200351:	00 00                	add    BYTE PTR [eax],al
 3200353:	00 a0 03 20 03 02    	add    BYTE PTR [eax+0x2032003],ah
 3200359:	00 00                	add    BYTE PTR [eax],al
 320035b:	00 50 00             	add    BYTE PTR [eax+0x0],dl
 320035e:	00 00                	add    BYTE PTR [eax],al
 3200360:	14 00                	adc    al,0x0
 3200362:	00 00                	add    BYTE PTR [eax],al
 3200364:	11 00                	adc    DWORD PTR [eax],eax
 3200366:	00 00                	add    BYTE PTR [eax],al
 3200368:	17                   	pop    ss
 3200369:	00 00                	add    BYTE PTR [eax],al
 320036b:	00 fc                	add    ah,bh
 320036d:	12 20                	adc    ah,BYTE PTR [eax]
 320036f:	03 00                	add    eax,DWORD PTR [eax]
	...

Disassembly of section .got.plt:

032003a0 <_GLOBAL_OFFSET_TABLE_>:
 32003a0:	10 03                	adc    BYTE PTR [ebx],al
 32003a2:	20 03                	and    BYTE PTR [ebx],al
	...
 32003ac:	76 02                	jbe    32003b0 <_GLOBAL_OFFSET_TABLE_+0x10>
 32003ae:	20 03                	and    BYTE PTR [ebx],al
 32003b0:	86 02                	xchg   BYTE PTR [edx],al
 32003b2:	20 03                	and    BYTE PTR [ebx],al
 32003b4:	96                   	xchg   esi,eax
 32003b5:	02 20                	add    ah,BYTE PTR [eax]
 32003b7:	03 a6 02 20 03 b6    	add    esp,DWORD PTR [esi-0x49fcdffe]
 32003bd:	02 20                	add    ah,BYTE PTR [eax]
 32003bf:	03 c6                	add    eax,esi
 32003c1:	02 20                	add    ah,BYTE PTR [eax]
 32003c3:	03 d6                	add    edx,esi
 32003c5:	02 20                	add    ah,BYTE PTR [eax]
 32003c7:	03 e6                	add    esp,esi
 32003c9:	02 20                	add    ah,BYTE PTR [eax]
 32003cb:	03 f6                	add    esi,esi
 32003cd:	02 20                	add    ah,BYTE PTR [eax]
 32003cf:	03 06                	add    eax,DWORD PTR [esi]
 32003d1:	03 20                	add    esp,DWORD PTR [eax]
 32003d3:	03                   	.byte 0x3

Disassembly of section .rodata:

03201000 <.rodata>:
 3201000:	50                   	push   eax
 3201001:	61                   	popa   
 3201002:	72 61                	jb     3201065 <_GLOBAL_OFFSET_TABLE_+0xcc5>
 3201004:	6d                   	ins    DWORD PTR es:[edi],dx
 3201005:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 3201008:	75 6e                	jne    3201078 <_GLOBAL_OFFSET_TABLE_+0xcd8>
 320100a:	74 3d                	je     3201049 <_GLOBAL_OFFSET_TABLE_+0xca9>
 320100c:	25 75 0a 00 50       	and    eax,0x50000a75
 3201011:	61                   	popa   
 3201012:	72 61                	jb     3201075 <_GLOBAL_OFFSET_TABLE_+0xcd5>
 3201014:	6d                   	ins    DWORD PTR es:[edi],dx
 3201015:	20 25 75 3d 25 73    	and    BYTE PTR ds:0x73253d75,ah
 320101b:	0a 00                	or     al,BYTE PTR [eax]
 320101d:	00 00                	add    BYTE PTR [eax],al
 320101f:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3201022:	72 6f                	jb     3201093 <_GLOBAL_OFFSET_TABLE_+0xcf3>
 3201024:	72 3a                	jb     3201060 <_GLOBAL_OFFSET_TABLE_+0xcc0>
 3201026:	20 4e 6f             	and    BYTE PTR [esi+0x6f],cl
 3201029:	74 20                	je     320104b <_GLOBAL_OFFSET_TABLE_+0xcab>
 320102b:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 320102d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320102e:	75 67                	jne    3201097 <_GLOBAL_OFFSET_TABLE_+0xcf7>
 3201030:	68 20 70 61 72       	push   0x72617020
 3201035:	61                   	popa   
 3201036:	6d                   	ins    DWORD PTR es:[edi],dx
 3201037:	65                   	gs
 3201038:	74 65                	je     320109f <_GLOBAL_OFFSET_TABLE_+0xcff>
 320103a:	72 73                	jb     32010af <_GLOBAL_OFFSET_TABLE_+0xd0f>
 320103c:	20 73 75             	and    BYTE PTR [ebx+0x75],dh
 320103f:	70 70                	jo     32010b1 <_GLOBAL_OFFSET_TABLE_+0xd11>
 3201041:	6c                   	ins    BYTE PTR es:[edi],dx
 3201042:	69 65 64 2c 20 6d 75 	imul   esp,DWORD PTR [ebp+0x64],0x756d202c
 3201049:	73 74                	jae    32010bf <_GLOBAL_OFFSET_TABLE_+0xd1f>
 320104b:	20 70 61             	and    BYTE PTR [eax+0x61],dh
 320104e:	73 73                	jae    32010c3 <_GLOBAL_OFFSET_TABLE_+0xd23>
 3201050:	20 70 61             	and    BYTE PTR [eax+0x61],dh
 3201053:	74 68                	je     32010bd <_GLOBAL_OFFSET_TABLE_+0xd1d>
 3201055:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 3201059:	70 72                	jo     32010cd <_GLOBAL_OFFSET_TABLE_+0xd2d>
 320105b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320105c:	67 72 61             	addr16 jb 32010c0 <_GLOBAL_OFFSET_TABLE_+0xd20>
 320105f:	6d                   	ins    DWORD PTR es:[edi],dx
 3201060:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 3201064:	62 65 20             	bound  esp,QWORD PTR [ebp+0x20]
 3201067:	72 75                	jb     32010de <_GLOBAL_OFFSET_TABLE_+0xd3e>
 3201069:	6e                   	outs   dx,BYTE PTR ds:[esi]
 320106a:	0a 00                	or     al,BYTE PTR [eax]
 320106c:	50                   	push   eax
 320106d:	61                   	popa   
 320106e:	72 61                	jb     32010d1 <_GLOBAL_OFFSET_TABLE_+0xd31>
 3201070:	6d                   	ins    DWORD PTR es:[edi],dx
 3201071:	65                   	gs
 3201072:	74 65                	je     32010d9 <_GLOBAL_OFFSET_TABLE_+0xd39>
 3201074:	72 20                	jb     3201096 <_GLOBAL_OFFSET_TABLE_+0xcf6>
 3201076:	32 20                	xor    ah,BYTE PTR [eax]
 3201078:	6d                   	ins    DWORD PTR es:[edi],dx
 3201079:	75 73                	jne    32010ee <_GLOBAL_OFFSET_TABLE_+0xd4e>
 320107b:	74 20                	je     320109d <_GLOBAL_OFFSET_TABLE_+0xcfd>
 320107d:	62 65 20             	bound  esp,QWORD PTR [ebp+0x20]
 3201080:	61                   	popa   
 3201081:	20 70 72             	and    BYTE PTR [eax+0x72],dh
 3201084:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3201085:	67 72 61             	addr16 jb 32010e9 <_GLOBAL_OFFSET_TABLE_+0xd49>
 3201088:	6d                   	ins    DWORD PTR es:[edi],dx
 3201089:	20 6e 61             	and    BYTE PTR [esi+0x61],ch
 320108c:	6d                   	ins    DWORD PTR es:[edi],dx
 320108d:	65 20 74 6f 20       	and    BYTE PTR gs:[edi+ebp*2+0x20],dh
 3201092:	72 75                	jb     3201109 <_GLOBAL_OFFSET_TABLE_+0xd69>
 3201094:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3201095:	0a 00                	or     al,BYTE PTR [eax]
 3201097:	45                   	inc    ebp
 3201098:	72 72                	jb     320110c <_GLOBAL_OFFSET_TABLE_+0xd6c>
 320109a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320109b:	72 20                	jb     32010bd <_GLOBAL_OFFSET_TABLE_+0xd1d>
 320109d:	65                   	gs
 320109e:	78 65                	js     3201105 <_GLOBAL_OFFSET_TABLE_+0xd65>
 32010a0:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 32010a3:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 32010aa:	00 45 6c             	add    BYTE PTR [ebp+0x6c],al
 32010ad:	61                   	popa   
 32010ae:	70 73                	jo     3201123 <_GLOBAL_OFFSET_TABLE_+0xd83>
 32010b0:	65 64 20 74 69 63    	gs and BYTE PTR fs:gs:[ecx+ebp*2+0x63],dh
 32010b6:	6b 73 20 3d          	imul   esi,DWORD PTR [ebx+0x20],0x3d
 32010ba:	20 25 75 0a 00 00    	and    BYTE PTR ds:0xa75,ah
 32010c0:	45                   	inc    ebp
 32010c1:	6c                   	ins    BYTE PTR es:[edi],dx
 32010c2:	61                   	popa   
 32010c3:	70 73                	jo     3201138 <_GLOBAL_OFFSET_TABLE_+0xd98>
 32010c5:	65 64 20 74 69 6d    	gs and BYTE PTR fs:gs:[ecx+ebp*2+0x6d],dh
 32010cb:	65 20 3d 20 25 30 32 	and    BYTE PTR gs:0x32302520,bh
 32010d2:	75 3a                	jne    320110e <_GLOBAL_OFFSET_TABLE_+0xd6e>
 32010d4:	25 30 32 75 3a       	and    eax,0x3a753230
 32010d9:	25 30 32 75 2e       	and    eax,0x2e753230
 32010de:	25 30 33 75 0a       	and    eax,0xa753330
	...

Disassembly of section .eh_frame:

032010e4 <.eh_frame>:
 32010e4:	14 00                	adc    al,0x0
 32010e6:	00 00                	add    BYTE PTR [eax],al
 32010e8:	00 00                	add    BYTE PTR [eax],al
 32010ea:	00 00                	add    BYTE PTR [eax],al
 32010ec:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 32010ef:	00 01                	add    BYTE PTR [ecx],al
 32010f1:	7c 08                	jl     32010fb <_GLOBAL_OFFSET_TABLE_+0xd5b>
 32010f3:	01 1b                	add    DWORD PTR [ebx],ebx
 32010f5:	0c 04                	or     al,0x4
 32010f7:	04 88                	add    al,0x88
 32010f9:	01 00                	add    DWORD PTR [eax],eax
 32010fb:	00 34 00             	add    BYTE PTR [eax+eax*1],dh
 32010fe:	00 00                	add    BYTE PTR [eax],al
 3201100:	1c 00                	sbb    al,0x0
 3201102:	00 00                	add    BYTE PTR [eax],al
 3201104:	fc                   	cld    
 3201105:	ee                   	out    dx,al
 3201106:	ff                   	(bad)  
 3201107:	ff 59 02             	call   FWORD PTR [ecx+0x2]
 320110a:	00 00                	add    BYTE PTR [eax],al
 320110c:	00 44 0c 01          	add    BYTE PTR [esp+ecx*1+0x1],al
 3201110:	00 47 10             	add    BYTE PTR [edi+0x10],al
 3201113:	05 02 75 00 44       	add    eax,0x44007502
 3201118:	0f 03 75 78          	lsl    esi,WORD PTR [ebp+0x78]
 320111c:	06                   	push   es
 320111d:	10 03                	adc    BYTE PTR [ebx],al
 320111f:	02 75 7c             	add    dh,BYTE PTR [ebp+0x7c]
 3201122:	03 44 02 c1          	add    eax,DWORD PTR [edx+eax*1-0x3f]
 3201126:	0c 01                	or     al,0x1
 3201128:	00 41 c3             	add    BYTE PTR [ecx-0x3d],al
 320112b:	41                   	inc    ecx
 320112c:	c5 43 0c             	lds    eax,FWORD PTR [ebx+0xc]
 320112f:	04 04                	add    al,0x4
 3201131:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .interp:

03201134 <.interp>:
 3201134:	2f                   	das    
 3201135:	6c                   	ins    BYTE PTR es:[edi],dx
 3201136:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 320113d:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3201144:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03201148 <.dynsym>:
	...
 3201158:	09 00                	or     DWORD PTR [eax],eax
	...
 3201162:	00 00                	add    BYTE PTR [eax],al
 3201164:	12 00                	adc    al,BYTE PTR [eax]
 3201166:	00 00                	add    BYTE PTR [eax],al
 3201168:	10 00                	adc    BYTE PTR [eax],al
	...
 3201172:	00 00                	add    BYTE PTR [eax],al
 3201174:	12 00                	adc    al,BYTE PTR [eax]
 3201176:	00 00                	add    BYTE PTR [eax],al
 3201178:	18 00                	sbb    BYTE PTR [eax],al
	...
 3201182:	00 00                	add    BYTE PTR [eax],al
 3201184:	12 00                	adc    al,BYTE PTR [eax]
 3201186:	00 00                	add    BYTE PTR [eax],al
 3201188:	1e                   	push   ds
	...
 3201191:	00 00                	add    BYTE PTR [eax],al
 3201193:	00 12                	add    BYTE PTR [edx],dl
 3201195:	00 00                	add    BYTE PTR [eax],al
 3201197:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
 320119d:	00 00                	add    BYTE PTR [eax],al
 320119f:	00 00                	add    BYTE PTR [eax],al
 32011a1:	00 00                	add    BYTE PTR [eax],al
 32011a3:	00 12                	add    BYTE PTR [edx],dl
 32011a5:	00 00                	add    BYTE PTR [eax],al
 32011a7:	00 2e                	add    BYTE PTR [esi],ch
	...
 32011b1:	00 00                	add    BYTE PTR [eax],al
 32011b3:	00 12                	add    BYTE PTR [edx],dl
 32011b5:	00 00                	add    BYTE PTR [eax],al
 32011b7:	00 33                	add    BYTE PTR [ebx],dh
	...
 32011c1:	00 00                	add    BYTE PTR [eax],al
 32011c3:	00 12                	add    BYTE PTR [edx],dl
 32011c5:	00 00                	add    BYTE PTR [eax],al
 32011c7:	00 3b                	add    BYTE PTR [ebx],bh
	...
 32011d1:	00 00                	add    BYTE PTR [eax],al
 32011d3:	00 12                	add    BYTE PTR [edx],dl
 32011d5:	00 00                	add    BYTE PTR [eax],al
 32011d7:	00 40 00             	add    BYTE PTR [eax+0x0],al
	...
 32011e2:	00 00                	add    BYTE PTR [eax],al
 32011e4:	12 00                	adc    al,BYTE PTR [eax]
 32011e6:	00 00                	add    BYTE PTR [eax],al
 32011e8:	47                   	inc    edi
	...
 32011f1:	00 00                	add    BYTE PTR [eax],al
 32011f3:	00 12                	add    BYTE PTR [edx],dl
 32011f5:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

032011f8 <.dynstr>:
 32011f8:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 32011fc:	63 2e                	arpl   WORD PTR [esi],bp
 32011fe:	73 6f                	jae    320126f <_GLOBAL_OFFSET_TABLE_+0xecf>
 3201200:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3201203:	72 63                	jb     3201268 <_GLOBAL_OFFSET_TABLE_+0xec8>
 3201205:	70 79                	jo     3201280 <_GLOBAL_OFFSET_TABLE_+0xee0>
 3201207:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 320120a:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3201211:	72 
 3201212:	69 6e 74 00 6d 61 6c 	imul   ebp,DWORD PTR [esi+0x74],0x6c616d00
 3201219:	6c                   	ins    BYTE PTR es:[edi],dx
 320121a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 320121b:	63 00                	arpl   WORD PTR [eax],ax
 320121d:	67 6d                	ins    DWORD PTR es:[di],dx
 320121f:	74 69                	je     320128a <_GLOBAL_OFFSET_TABLE_+0xeea>
 3201221:	6d                   	ins    DWORD PTR es:[edi],dx
 3201222:	65                   	gs
 3201223:	5f                   	pop    edi
 3201224:	72 00                	jb     3201226 <_GLOBAL_OFFSET_TABLE_+0xe86>
 3201226:	65                   	gs
 3201227:	78 65                	js     320128e <_GLOBAL_OFFSET_TABLE_+0xeee>
 3201229:	63 00                	arpl   WORD PTR [eax],ax
 320122b:	73 74                	jae    32012a1 <_GLOBAL_OFFSET_TABLE_+0xf01>
 320122d:	72 74                	jb     32012a3 <_GLOBAL_OFFSET_TABLE_+0xf03>
 320122f:	72 69                	jb     320129a <_GLOBAL_OFFSET_TABLE_+0xefa>
 3201231:	6d                   	ins    DWORD PTR es:[edi],dx
 3201232:	00 74 69 6d          	add    BYTE PTR [ecx+ebp*2+0x6d],dh
 3201236:	65 00 73 74          	add    BYTE PTR gs:[ebx+0x74],dh
 320123a:	72 6c                	jb     32012a8 <_GLOBAL_OFFSET_TABLE_+0xf08>
 320123c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 320123e:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 3201241:	65 65 00 2e          	gs add BYTE PTR gs:[esi],ch
 3201245:	2e                   	cs
 3201246:	2f                   	das    
 3201247:	6c                   	ins    BYTE PTR es:[edi],dx
 3201248:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 320124f:	4f                   	dec    edi
 3201250:	53                   	push   ebx
 3201251:	2f                   	das    
 3201252:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3201259:	62 
 320125a:	75 67                	jne    32012c3 <_GLOBAL_OFFSET_TABLE_+0xf23>
 320125c:	2f                   	das    
 320125d:	47                   	inc    edi
 320125e:	4e                   	dec    esi
 320125f:	55                   	push   ebp
 3201260:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3201265:	78 00                	js     3201267 <_GLOBAL_OFFSET_TABLE_+0xec7>

Disassembly of section .hash:

03201268 <.hash>:
 3201268:	03 00                	add    eax,DWORD PTR [eax]
 320126a:	00 00                	add    BYTE PTR [eax],al
 320126c:	0b 00                	or     eax,DWORD PTR [eax]
 320126e:	00 00                	add    BYTE PTR [eax],al
 3201270:	00 00                	add    BYTE PTR [eax],al
 3201272:	00 00                	add    BYTE PTR [eax],al
 3201274:	0a 00                	or     al,BYTE PTR [eax]
 3201276:	00 00                	add    BYTE PTR [eax],al
 3201278:	08 00                	or     BYTE PTR [eax],al
	...
 3201282:	00 00                	add    BYTE PTR [eax],al
 3201284:	01 00                	add    DWORD PTR [eax],eax
 3201286:	00 00                	add    BYTE PTR [eax],al
 3201288:	02 00                	add    al,BYTE PTR [eax]
 320128a:	00 00                	add    BYTE PTR [eax],al
 320128c:	03 00                	add    eax,DWORD PTR [eax]
 320128e:	00 00                	add    BYTE PTR [eax],al
 3201290:	04 00                	add    al,0x0
 3201292:	00 00                	add    BYTE PTR [eax],al
 3201294:	00 00                	add    BYTE PTR [eax],al
 3201296:	00 00                	add    BYTE PTR [eax],al
 3201298:	06                   	push   es
 3201299:	00 00                	add    BYTE PTR [eax],al
 320129b:	00 05 00 00 00 07    	add    BYTE PTR ds:0x7000000,al
 32012a1:	00 00                	add    BYTE PTR [eax],al
 32012a3:	00 09                	add    BYTE PTR [ecx],cl
 32012a5:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

032012a8 <.eh_frame>:
 32012a8:	14 00                	adc    al,0x0
 32012aa:	00 00                	add    BYTE PTR [eax],al
 32012ac:	00 00                	add    BYTE PTR [eax],al
 32012ae:	00 00                	add    BYTE PTR [eax],al
 32012b0:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 32012b3:	00 01                	add    BYTE PTR [ecx],al
 32012b5:	7c 08                	jl     32012bf <_GLOBAL_OFFSET_TABLE_+0xf1f>
 32012b7:	01 1b                	add    DWORD PTR [ebx],ebx
 32012b9:	0c 04                	or     al,0x4
 32012bb:	04 88                	add    al,0x88
 32012bd:	01 00                	add    DWORD PTR [eax],eax
 32012bf:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 32012c2:	00 00                	add    BYTE PTR [eax],al
 32012c4:	1c 00                	sbb    al,0x0
 32012c6:	00 00                	add    BYTE PTR [eax],al
 32012c8:	98                   	cwde   
 32012c9:	ef                   	out    dx,eax
 32012ca:	ff                   	(bad)  
 32012cb:	ff b0 00 00 00 00    	push   DWORD PTR [eax+0x0]
 32012d1:	0e                   	push   cs
 32012d2:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 32012d5:	0c 4a                	or     al,0x4a
 32012d7:	0f 0b                	ud2    
 32012d9:	74 04                	je     32012df <_GLOBAL_OFFSET_TABLE_+0xf3f>
 32012db:	78 00                	js     32012dd <_GLOBAL_OFFSET_TABLE_+0xf3d>
 32012dd:	3f                   	aas    
 32012de:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 32012e0:	2a 32                	sub    dh,BYTE PTR [edx]
 32012e2:	24 22                	and    al,0x22
 32012e4:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

032012e8 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 32012e8:	01 1b                	add    DWORD PTR [ebx],ebx
 32012ea:	03 3b                	add    edi,DWORD PTR [ebx]
 32012ec:	f8                   	clc    
 32012ed:	fd                   	std    
 32012ee:	ff                   	(bad)  
 32012ef:	ff 01                	inc    DWORD PTR [ecx]
 32012f1:	00 00                	add    BYTE PTR [eax],al
 32012f3:	00 18                	add    BYTE PTR [eax],bl
 32012f5:	ed                   	in     eax,dx
 32012f6:	ff                   	(bad)  
 32012f7:	ff 14 fe             	call   DWORD PTR [esi+edi*8]
 32012fa:	ff                   	(bad)  
 32012fb:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

032012fc <.rel.dyn>:
 32012fc:	ac                   	lods   al,BYTE PTR ds:[esi]
 32012fd:	03 20                	add    esp,DWORD PTR [eax]
 32012ff:	03 07                	add    eax,DWORD PTR [edi]
 3201301:	01 00                	add    DWORD PTR [eax],eax
 3201303:	00 b0 03 20 03 07    	add    BYTE PTR [eax+0x7032003],dh
 3201309:	02 00                	add    al,BYTE PTR [eax]
 320130b:	00 b4 03 20 03 07 03 	add    BYTE PTR [ebx+eax*1+0x3070320],dh
 3201312:	00 00                	add    BYTE PTR [eax],al
 3201314:	b8 03 20 03 07       	mov    eax,0x7032003
 3201319:	04 00                	add    al,0x0
 320131b:	00 bc 03 20 03 07 05 	add    BYTE PTR [ebx+eax*1+0x5070320],bh
 3201322:	00 00                	add    BYTE PTR [eax],al
 3201324:	c0 03 20             	rol    BYTE PTR [ebx],0x20
 3201327:	03 07                	add    eax,DWORD PTR [edi]
 3201329:	06                   	push   es
 320132a:	00 00                	add    BYTE PTR [eax],al
 320132c:	c4 03                	les    eax,FWORD PTR [ebx]
 320132e:	20 03                	and    BYTE PTR [ebx],al
 3201330:	07                   	pop    es
 3201331:	07                   	pop    es
 3201332:	00 00                	add    BYTE PTR [eax],al
 3201334:	c8 03 20 03          	enter  0x2003,0x3
 3201338:	07                   	pop    es
 3201339:	08 00                	or     BYTE PTR [eax],al
 320133b:	00 cc                	add    ah,cl
 320133d:	03 20                	add    esp,DWORD PTR [eax]
 320133f:	03 07                	add    eax,DWORD PTR [edi]
 3201341:	09 00                	or     DWORD PTR [eax],eax
 3201343:	00 d0                	add    al,dl
 3201345:	03 20                	add    esp,DWORD PTR [eax]
 3201347:	03 07                	add    eax,DWORD PTR [edi]
 3201349:	0a 00                	or     al,BYTE PTR [eax]
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
   c:	e4 00                	in     al,0x0
   e:	00 00                	add    BYTE PTR [eax],al
  10:	0c 83                	or     al,0x83
  12:	00 00                	add    BYTE PTR [eax],al
  14:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
  17:	00 00                	add    BYTE PTR [eax],al
  19:	00 00                	add    BYTE PTR [eax],al
  1b:	20 03                	and    BYTE PTR [ebx],al
  1d:	59                   	pop    ecx
  1e:	02 00                	add    al,BYTE PTR [eax]
  20:	00 00                	add    BYTE PTR [eax],al
  22:	00 00                	add    BYTE PTR [eax],al
  24:	00 02                	add    BYTE PTR [edx],al
  26:	01 06                	add    DWORD PTR [esi],eax
  28:	61                   	popa   
  29:	00 00                	add    BYTE PTR [eax],al
  2b:	00 02                	add    BYTE PTR [edx],al
  2d:	01 06                	add    DWORD PTR [esi],eax
  2f:	5a                   	pop    edx
  30:	00 00                	add    BYTE PTR [eax],al
  32:	00 02                	add    BYTE PTR [edx],al
  34:	02 05 55 01 00 00    	add    al,BYTE PTR ds:0x155
  3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  41:	02 08                	add    cl,BYTE PTR [eax]
  43:	05 3f 01 00 00       	add    eax,0x13f
  48:	02 01                	add    al,BYTE PTR [ecx]
  4a:	08 58 00             	or     BYTE PTR [eax+0x0],bl
  4d:	00 00                	add    BYTE PTR [eax],al
  4f:	02 02                	add    al,BYTE PTR [edx]
  51:	07                   	pop    es
  52:	70 00                	jo     54 <main-0x31fffac>
  54:	00 00                	add    BYTE PTR [eax],al
  56:	04 81                	add    al,0x81
  58:	01 00                	add    DWORD PTR [eax],eax
  5a:	00 02                	add    BYTE PTR [edx],al
  5c:	34 61                	xor    al,0x61
  5e:	00 00                	add    BYTE PTR [eax],al
  60:	00 02                	add    BYTE PTR [edx],al
  62:	04 07                	add    al,0x7
  64:	4b                   	dec    ebx
  65:	00 00                	add    BYTE PTR [eax],al
  67:	00 02                	add    BYTE PTR [edx],al
  69:	08 07                	or     BYTE PTR [edi],al
  6b:	41                   	inc    ecx
  6c:	00 00                	add    BYTE PTR [eax],al
  6e:	00 02                	add    BYTE PTR [edx],al
  70:	04 05                	add    al,0x5
  72:	44                   	inc    esp
  73:	01 00                	add    DWORD PTR [eax],eax
  75:	00 02                	add    BYTE PTR [edx],al
  77:	01 02                	add    DWORD PTR [edx],eax
  79:	91                   	xchg   ecx,eax
  7a:	01 00                	add    DWORD PTR [eax],eax
  7c:	00 04 d0             	add    BYTE PTR [eax+edx*8],al
  7f:	00 00                	add    BYTE PTR [eax],al
  81:	00 03                	add    BYTE PTR [ebx],al
  83:	2a 6f 00             	sub    ch,BYTE PTR [edi+0x0]
  86:	00 00                	add    BYTE PTR [eax],al
  88:	05 74 6d 00 2c       	add    eax,0x2c006d74
  8d:	03 2c 18             	add    ebp,DWORD PTR [eax+ebx*1]
  90:	01 00                	add    DWORD PTR [eax],eax
  92:	00 06                	add    BYTE PTR [esi],al
  94:	9d                   	popf   
  95:	00 00                	add    BYTE PTR [eax],al
  97:	00 03                	add    BYTE PTR [ebx],al
  99:	2e 3a 00             	cmp    al,BYTE PTR cs:[eax]
  9c:	00 00                	add    BYTE PTR [eax],al
  9e:	00 06                	add    BYTE PTR [esi],al
  a0:	96                   	xchg   esi,eax
  a1:	00 00                	add    BYTE PTR [eax],al
  a3:	00 03                	add    BYTE PTR [ebx],al
  a5:	2f                   	das    
  a6:	3a 00                	cmp    al,BYTE PTR [eax]
  a8:	00 00                	add    BYTE PTR [eax],al
  aa:	04 06                	add    al,0x6
  ac:	31 00                	xor    DWORD PTR [eax],eax
  ae:	00 00                	add    BYTE PTR [eax],al
  b0:	03 30                	add    esi,DWORD PTR [eax]
  b2:	3a 00                	cmp    al,BYTE PTR [eax]
  b4:	00 00                	add    BYTE PTR [eax],al
  b6:	08 06                	or     BYTE PTR [esi],al
  b8:	9c                   	pushf  
  b9:	01 00                	add    DWORD PTR [eax],eax
  bb:	00 03                	add    BYTE PTR [ebx],al
  bd:	31 3a                	xor    DWORD PTR [edx],edi
  bf:	00 00                	add    BYTE PTR [eax],al
  c1:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
  c4:	8a 01                	mov    al,BYTE PTR [ecx]
  c6:	00 00                	add    BYTE PTR [eax],al
  c8:	03 32                	add    esi,DWORD PTR [edx]
  ca:	3a 00                	cmp    al,BYTE PTR [eax]
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	10 06                	adc    BYTE PTR [esi],al
  d0:	72 01                	jb     d3 <main-0x31fff2d>
  d2:	00 00                	add    BYTE PTR [eax],al
  d4:	03 33                	add    esi,DWORD PTR [ebx]
  d6:	3a 00                	cmp    al,BYTE PTR [eax]
  d8:	00 00                	add    BYTE PTR [eax],al
  da:	14 06                	adc    al,0x6
  dc:	07                   	pop    es
  dd:	00 00                	add    BYTE PTR [eax],al
  df:	00 03                	add    BYTE PTR [ebx],al
  e1:	34 3a                	xor    al,0x3a
  e3:	00 00                	add    BYTE PTR [eax],al
  e5:	00 18                	add    BYTE PTR [eax],bl
  e7:	06                   	push   es
  e8:	b6 00                	mov    dh,0x0
  ea:	00 00                	add    BYTE PTR [eax],al
  ec:	03 35 3a 00 00 00    	add    esi,DWORD PTR ds:0x3a
  f2:	1c 06                	sbb    al,0x6
  f4:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
  f5:	00 00                	add    BYTE PTR [eax],al
  f7:	00 03                	add    BYTE PTR [ebx],al
  f9:	36 3a 00             	cmp    al,BYTE PTR ss:[eax]
  fc:	00 00                	add    BYTE PTR [eax],al
  fe:	20 06                	and    BYTE PTR [esi],al
 100:	66                   	data16
 101:	00 00                	add    BYTE PTR [eax],al
 103:	00 03                	add    BYTE PTR [ebx],al
 105:	37                   	aaa    
 106:	6f                   	outs   dx,DWORD PTR ds:[esi]
 107:	00 00                	add    BYTE PTR [eax],al
 109:	00 24 06             	add    BYTE PTR [esi+eax*1],ah
 10c:	39 00                	cmp    DWORD PTR [eax],eax
 10e:	00 00                	add    BYTE PTR [eax],al
 110:	03 38                	add    edi,DWORD PTR [eax]
 112:	18 01                	sbb    BYTE PTR [ecx],al
 114:	00 00                	add    BYTE PTR [eax],al
 116:	28 00                	sub    BYTE PTR [eax],al
 118:	07                   	pop    es
 119:	04 1e                	add    al,0x1e
 11b:	01 00                	add    DWORD PTR [eax],eax
 11d:	00 08                	add    BYTE PTR [eax],cl
 11f:	25 00 00 00 09       	and    eax,0x9000000
 124:	d7                   	xlat   BYTE PTR ds:[ebx]
 125:	00 00                	add    BYTE PTR [eax],al
 127:	00 01                	add    BYTE PTR [ecx],al
 129:	13 3a                	adc    edi,DWORD PTR [edx]
 12b:	00 00                	add    BYTE PTR [eax],al
 12d:	00 00                	add    BYTE PTR [eax],al
 12f:	00 20                	add    BYTE PTR [eax],ah
 131:	03 59 02             	add    ebx,DWORD PTR [ecx+0x2]
 134:	00 00                	add    BYTE PTR [eax],al
 136:	01 9c ee 01 00 00 0a 	add    DWORD PTR [esi+ebp*8+0xa000001],ebx
 13d:	97                   	xchg   edi,eax
 13e:	01 00                	add    DWORD PTR [eax],eax
 140:	00 01                	add    BYTE PTR [ecx],al
 142:	13 3a                	adc    edi,DWORD PTR [edx]
 144:	00 00                	add    BYTE PTR [eax],al
 146:	00 02                	add    BYTE PTR [edx],al
 148:	91                   	xchg   ecx,eax
 149:	00 0a                	add    BYTE PTR [edx],cl
 14b:	0f 00 00             	sldt   WORD PTR [eax]
 14e:	00 01                	add    BYTE PTR [ecx],al
 150:	13 ee                	adc    ebp,esi
 152:	01 00                	add    DWORD PTR [eax],eax
 154:	00 02                	add    BYTE PTR [edx],al
 156:	91                   	xchg   ecx,eax
 157:	04 0b                	add    al,0xb
 159:	70 69                	jo     1c4 <main-0x31ffe3c>
 15b:	64 00 01             	add    BYTE PTR fs:[ecx],al
 15e:	15 3a 00 00 00       	adc    eax,0x3a
 163:	02 75 6c             	add    dh,BYTE PTR [ebp+0x6c]
 166:	0c be                	or     al,0xbe
 168:	00 00                	add    BYTE PTR [eax],al
 16a:	00 01                	add    BYTE PTR [ecx],al
 16c:	16                   	push   ss
 16d:	fa                   	cli    
 16e:	01 00                	add    DWORD PTR [eax],eax
 170:	00 02                	add    BYTE PTR [edx],al
 172:	75 5c                	jne    1d0 <main-0x31ffe30>
 174:	0c 5f                	or     al,0x5f
 176:	01 00                	add    DWORD PTR [eax],eax
 178:	00 01                	add    BYTE PTR [ecx],al
 17a:	17                   	pop    ss
 17b:	7d 00                	jge    17d <main-0x31ffe83>
 17d:	00 00                	add    BYTE PTR [eax],al
 17f:	02 75 64             	add    dh,BYTE PTR [ebp+0x64]
 182:	0c 4d                	or     al,0x4d
 184:	01 00                	add    DWORD PTR [eax],eax
 186:	00 01                	add    BYTE PTR [ecx],al
 188:	17                   	pop    ss
 189:	7d 00                	jge    18b <main-0x31ffe75>
 18b:	00 00                	add    BYTE PTR [eax],al
 18d:	02 75 60             	add    dh,BYTE PTR [ebp+0x60]
 190:	0c c8                	or     al,0xc8
 192:	00 00                	add    BYTE PTR [eax],al
 194:	00 01                	add    BYTE PTR [ecx],al
 196:	17                   	pop    ss
 197:	7d 00                	jge    199 <main-0x31ffe67>
 199:	00 00                	add    BYTE PTR [eax],al
 19b:	02 75 54             	add    dh,BYTE PTR [ebp+0x54]
 19e:	0c 7a                	or     al,0x7a
 1a0:	01 00                	add    DWORD PTR [eax],eax
 1a2:	00 01                	add    BYTE PTR [ecx],al
 1a4:	18 3a                	sbb    BYTE PTR [edx],bh
 1a6:	00 00                	add    BYTE PTR [eax],al
 1a8:	00 02                	add    BYTE PTR [edx],al
 1aa:	75 74                	jne    220 <main-0x31ffde0>
 1ac:	0c dc                	or     al,0xdc
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
 1d7:	70 01                	jo     1da <main-0x31ffe26>
 1d9:	20 03                	and    BYTE PTR [ebx],al
 1db:	ce                   	into   
 1dc:	00 00                	add    BYTE PTR [eax],al
 1de:	00 0b                	add    BYTE PTR [ebx],cl
 1e0:	6d                   	ins    DWORD PTR es:[edi],dx
 1e1:	73 00                	jae    1e3 <main-0x31ffe1d>
 1e3:	01 47 3a             	add    DWORD PTR [edi+0x3a],eax
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
 201:	69 01 00 00 04 34    	imul   eax,DWORD PTR [ecx],0x34040000
 207:	56                   	push   esi
 208:	00 00                	add    BYTE PTR [eax],al
 20a:	00 05 03 04 20 20    	add    BYTE PTR ds:0x20200403,al
 210:	03 0f                	add    ecx,DWORD PTR [edi]
 212:	ad                   	lods   eax,DWORD PTR ds:[esi]
 213:	00 00                	add    BYTE PTR [eax],al
 215:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
 21c:	05 03 08 20 20       	add    eax,0x20200803
 221:	03 0f                	add    ecx,DWORD PTR [edi]
 223:	8e 00                	mov    es,WORD PTR [eax]
 225:	00 00                	add    BYTE PTR [eax],al
 227:	04 36                	add    al,0x36
 229:	56                   	push   esi
 22a:	00 00                	add    BYTE PTR [eax],al
 22c:	00 05 03 00 20 20    	add    BYTE PTR ds:0x20200003,al
 232:	03 0f                	add    ecx,DWORD PTR [edi]
 234:	00 00                	add    BYTE PTR [eax],al
 236:	00 00                	add    BYTE PTR [eax],al
 238:	05 38 7d 00 00       	add    eax,0x7d38
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
  14:	59                   	pop    ecx
  15:	02 00                	add    al,BYTE PTR [eax]
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
  dd:	bc f3 94 08 67       	mov    esp,0x670894f3
  e2:	d7                   	xlat   BYTE PTR ds:[ebx]
  e3:	68 08 22 f3 78       	push   0x78f32208
  e8:	a0 83 08 c9 68       	mov    al,ds:0x68c90883
  ed:	08 83 be e5 83 91    	or     BYTE PTR [ebx-0x6e7c1a42],al
  f3:	f3 08 3d 02 28 13 08 	repz or BYTE PTR ds:0x8132802,bh
  fa:	9f                   	lahf   
  fb:	08 21                	or     BYTE PTR [ecx],ah
  fd:	02 27                	add    ah,BYTE PTR [edi]
  ff:	13 d9                	adc    ebx,ecx
 101:	d7                   	xlat   BYTE PTR ds:[ebx]
 102:	3d 02 0a 00 01       	cmp    eax,0x1000a02
 107:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6c                   	ins    BYTE PTR es:[edi],dx
   1:	69 62 63 54 5a 00 74 	imul   esp,DWORD PTR [edx+0x63],0x74005a54
   8:	6d                   	ins    DWORD PTR es:[edi],dx
   9:	5f                   	pop    edi
   a:	77 64                	ja     70 <main-0x31fff90>
   c:	61                   	popa   
   d:	79 00                	jns    f <main-0x31ffff1>
   f:	61                   	popa   
  10:	72 67                	jb     79 <main-0x31fff87>
  12:	76 00                	jbe    14 <main-0x31fffec>
  14:	2f                   	das    
  15:	68 6f 6d 65 2f       	push   0x2f656d6f
  1a:	79 6f                	jns    8b <main-0x31fff75>
  1c:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  23:	6f                   	outs   dx,DWORD PTR ds:[esi]
  24:	73 2f                	jae    55 <main-0x31fffab>
  26:	61                   	popa   
  27:	70 72                	jo     9b <main-0x31fff65>
  29:	6f                   	outs   dx,DWORD PTR ds:[esi]
  2a:	6a 2f                	push   0x2f
  2c:	74 69                	je     97 <main-0x31fff69>
  2e:	6d                   	ins    DWORD PTR es:[edi],dx
  2f:	65 00 74 6d 5f       	add    BYTE PTR gs:[ebp+ebp*2+0x5f],dh
  34:	68 6f 75 72 00       	push   0x72756f
  39:	74 6d                	je     a8 <main-0x31fff58>
  3b:	5f                   	pop    edi
  3c:	7a 6f                	jp     ad <main-0x31fff53>
  3e:	6e                   	outs   dx,BYTE PTR ds:[esi]
  3f:	65 00 6c 6f 6e       	add    BYTE PTR gs:[edi+ebp*2+0x6e],ch
  44:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  48:	6e                   	outs   dx,BYTE PTR ds:[esi]
  49:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
  4d:	73 69                	jae    b8 <main-0x31fff48>
  4f:	67 6e                	outs   dx,BYTE PTR ds:[si]
  51:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  56:	74 00                	je     58 <main-0x31fffa8>
  58:	75 6e                	jne    c8 <main-0x31fff38>
  5a:	73 69                	jae    c5 <main-0x31fff3b>
  5c:	67 6e                	outs   dx,BYTE PTR ds:[si]
  5e:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
  63:	61                   	popa   
  64:	72 00                	jb     66 <main-0x31fff9a>
  66:	74 6d                	je     d5 <main-0x31fff2b>
  68:	5f                   	pop    edi
  69:	67 6d                	ins    DWORD PTR es:[di],dx
  6b:	74 6f                	je     dc <main-0x31fff24>
  6d:	66                   	data16
  6e:	66                   	data16
  6f:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
  72:	6f                   	outs   dx,DWORD PTR ds:[esi]
  73:	72 74                	jb     e9 <main-0x31fff17>
  75:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
  78:	73 69                	jae    e3 <main-0x31fff1d>
  7a:	67 6e                	outs   dx,BYTE PTR ds:[si]
  7c:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  81:	74 00                	je     83 <main-0x31fff7d>
  83:	74 65                	je     ea <main-0x31fff16>
  85:	73 74                	jae    fb <main-0x31fff05>
  87:	74 69                	je     f2 <main-0x31fff0e>
  89:	6d                   	ins    DWORD PTR es:[edi],dx
  8a:	65 2e 63 00          	gs arpl WORD PTR cs:gs:[eax],ax
  8e:	68 65 61 70 45       	push   0x45706165
  93:	6e                   	outs   dx,BYTE PTR ds:[esi]
  94:	64 00 74 6d 5f       	add    BYTE PTR fs:[ebp+ebp*2+0x5f],dh
  99:	6d                   	ins    DWORD PTR es:[edi],dx
  9a:	69 6e 00 74 6d 5f 73 	imul   ebp,DWORD PTR [esi+0x0],0x735f6d74
  a1:	65 63 00             	arpl   WORD PTR gs:[eax],ax
  a4:	74 6d                	je     113 <main-0x31ffeed>
  a6:	5f                   	pop    edi
  a7:	69 73 64 73 74 00 68 	imul   esi,DWORD PTR [ebx+0x64],0x68007473
  ae:	65                   	gs
  af:	61                   	popa   
  b0:	70 43                	jo     f5 <main-0x31fff0b>
  b2:	75 72                	jne    126 <main-0x31ffeda>
  b4:	72 00                	jb     b6 <main-0x31fff4a>
  b6:	74 6d                	je     125 <main-0x31ffedb>
  b8:	5f                   	pop    edi
  b9:	79 64                	jns    11f <main-0x31ffee1>
  bb:	61                   	popa   
  bc:	79 00                	jns    be <main-0x31fff42>
  be:	74 6f                	je     12f <main-0x31ffed1>
  c0:	74 61                	je     123 <main-0x31ffedd>
  c2:	6c                   	ins    BYTE PTR es:[edi],dx
  c3:	54                   	push   esp
  c4:	69 6d 65 00 65 6c 61 	imul   ebp,DWORD PTR [ebp+0x65],0x616c6500
  cb:	70 73                	jo     140 <main-0x31ffec0>
  cd:	65 64 00 74 69 6d    	gs add BYTE PTR fs:gs:[ecx+ebp*2+0x6d],dh
  d3:	65                   	gs
  d4:	5f                   	pop    edi
  d5:	74 00                	je     d7 <main-0x31fff29>
  d7:	6d                   	ins    DWORD PTR es:[edi],dx
  d8:	61                   	popa   
  d9:	69 6e 00 65 78 65 63 	imul   ebp,DWORD PTR [esi+0x0],0x63657865
  e0:	70 67                	jo     149 <main-0x31ffeb7>
  e2:	6d                   	ins    DWORD PTR es:[edi],dx
  e3:	00 47 4e             	add    BYTE PTR [edi+0x4e],al
  e6:	55                   	push   ebp
  e7:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  ea:	39 20                	cmp    DWORD PTR [eax],esp
  ec:	35 2e 33 2e 30       	xor    eax,0x302e332e
  f1:	20 2d 6d 33 32 20    	and    BYTE PTR ds:0x2032336d,ch
  f7:	2d 6d 61 73 6d       	sub    eax,0x6d73616d
  fc:	3d 69 6e 74 65       	cmp    eax,0x65746e69
 101:	6c                   	ins    BYTE PTR es:[edi],dx
 102:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
 108:	65                   	gs
 109:	3d 67 65 6e 65       	cmp    eax,0x656e6567
 10e:	72 69                	jb     179 <main-0x31ffe87>
 110:	63 20                	arpl   WORD PTR [eax],sp
 112:	2d 6d 61 72 63       	sub    eax,0x6372616d
 117:	68 3d 70 65 6e       	push   0x6e65703d
 11c:	74 69                	je     187 <main-0x31ffe79>
 11e:	75 6d                	jne    18d <main-0x31ffe73>
 120:	70 72                	jo     194 <main-0x31ffe6c>
 122:	6f                   	outs   dx,DWORD PTR ds:[esi]
 123:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
 129:	74 64                	je     18f <main-0x31ffe71>
 12b:	3d 63 39 39 20       	cmp    eax,0x20393963
 130:	2d 66 66 72 65       	sub    eax,0x65726666
 135:	65                   	gs
 136:	73 74                	jae    1ac <main-0x31ffe54>
 138:	61                   	popa   
 139:	6e                   	outs   dx,BYTE PTR ds:[esi]
 13a:	64 69 6e 67 00 6c 6f 	imul   ebp,DWORD PTR fs:[esi+0x67],0x6e6f6c00
 141:	6e 
 142:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 146:	6e                   	outs   dx,BYTE PTR ds:[esi]
 147:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 14b:	74 00                	je     14d <main-0x31ffeb3>
 14d:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 14f:	64                   	fs
 150:	54                   	push   esp
 151:	69 6d 65 00 73 68 6f 	imul   ebp,DWORD PTR [ebp+0x65],0x6f687300
 158:	72 74                	jb     1ce <main-0x31ffe32>
 15a:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 15d:	74 00                	je     15f <main-0x31ffea1>
 15f:	73 74                	jae    1d5 <main-0x31ffe2b>
 161:	61                   	popa   
 162:	72 74                	jb     1d8 <main-0x31ffe28>
 164:	54                   	push   esp
 165:	69 6d 65 00 68 65 61 	imul   ebp,DWORD PTR [ebp+0x65],0x61656800
 16c:	70 42                	jo     1b0 <main-0x31ffe50>
 16e:	61                   	popa   
 16f:	73 65                	jae    1d6 <main-0x31ffe2a>
 171:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 175:	79 65                	jns    1dc <main-0x31ffe24>
 177:	61                   	popa   
 178:	72 00                	jb     17a <main-0x31ffe86>
 17a:	72 65                	jb     1e1 <main-0x31ffe1f>
 17c:	74 56                	je     1d4 <main-0x31ffe2c>
 17e:	61                   	popa   
 17f:	6c                   	ins    BYTE PTR es:[edi],dx
 180:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 183:	6e                   	outs   dx,BYTE PTR ds:[esi]
 184:	74 33                	je     1b9 <main-0x31ffe47>
 186:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 189:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 18d:	6d                   	ins    DWORD PTR es:[edi],dx
 18e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 18f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 190:	00 5f 42             	add    BYTE PTR [edi+0x42],bl
 193:	6f                   	outs   dx,DWORD PTR ds:[esi]
 194:	6f                   	outs   dx,DWORD PTR ds:[esi]
 195:	6c                   	ins    BYTE PTR es:[edi],dx
 196:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 199:	67 63 00             	arpl   WORD PTR [bx+si],ax
 19c:	74 6d                	je     20b <main-0x31ffdf5>
 19e:	5f                   	pop    edi
 19f:	6d                   	ins    DWORD PTR es:[edi],dx
 1a0:	64                   	fs
 1a1:	61                   	popa   
 1a2:	79 00                	jns    1a4 <main-0x31ffe5c>

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
