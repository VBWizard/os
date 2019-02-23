
Debug/GNU-Linux/testmmap:     file format elf32-i386


Disassembly of section .text:

30400000 <doChild>:
doChild():
/home/yogi/src/os/aproj/testMMap/mmapmain.c:23
 */

int sharedCounter = 10;

int doChild(int childNum)
{
30400000:	55                   	push   ebp
30400001:	89 e5                	mov    ebp,esp
30400003:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/testMMap/mmapmain.c:24
        for (int sharedCounter=10;sharedCounter>=0;sharedCounter--)
30400006:	c7 45 f4 0a 00 00 00 	mov    DWORD PTR [ebp-0xc],0xa
3040000d:	eb 17                	jmp    30400026 <doChild+0x26>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:27
        {
            //print("Child %u counting: Count = %u\n",childNum, sharedCounter);
            if (sharedCounter > 0)
3040000f:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
30400013:	7e 0d                	jle    30400022 <doChild+0x22>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:28
                sleep(1);
30400015:	83 ec 0c             	sub    esp,0xc
30400018:	6a 01                	push   0x1
3040001a:	e8 11 02 00 00       	call   30400230 <main+0x1ff>
3040001f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:24 (discriminator 2)

int sharedCounter = 10;

int doChild(int childNum)
{
        for (int sharedCounter=10;sharedCounter>=0;sharedCounter--)
30400022:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/testMMap/mmapmain.c:24 (discriminator 1)
30400026:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
3040002a:	79 e3                	jns    3040000f <doChild+0xf>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:30
        {
            //print("Child %u counting: Count = %u\n",childNum, sharedCounter);
            if (sharedCounter > 0)
                sleep(1);
        }
        return childNum;
3040002c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/testMMap/mmapmain.c:31
}
3040002f:	c9                   	leave  
30400030:	c3                   	ret    

30400031 <main>:
main():
/home/yogi/src/os/aproj/testMMap/mmapmain.c:33

int main(int argc, char** argv) {
30400031:	8d 4c 24 04          	lea    ecx,[esp+0x4]
30400035:	83 e4 f0             	and    esp,0xfffffff0
30400038:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
3040003b:	55                   	push   ebp
3040003c:	89 e5                	mov    ebp,esp
3040003e:	53                   	push   ebx
3040003f:	51                   	push   ecx
30400040:	83 ec 40             	sub    esp,0x40
30400043:	89 c8                	mov    eax,ecx
30400045:	89 e2                	mov    edx,esp
30400047:	89 d3                	mov    ebx,edx
/home/yogi/src/os/aproj/testMMap/mmapmain.c:35

    int pid=0, pid2=0, pidsToSpawn;
30400049:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
30400050:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/testMMap/mmapmain.c:36
    if (argc == 1)
30400057:	83 38 01             	cmp    DWORD PTR [eax],0x1
3040005a:	75 09                	jne    30400065 <main+0x34>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:37
        pidsToSpawn = 5;
3040005c:	c7 45 f4 05 00 00 00 	mov    DWORD PTR [ebp-0xc],0x5
30400063:	eb 17                	jmp    3040007c <main+0x4b>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:39
    else
        pidsToSpawn = atoi(argv[1]);
30400065:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
30400068:	83 c0 04             	add    eax,0x4
3040006b:	8b 00                	mov    eax,DWORD PTR [eax]
3040006d:	83 ec 0c             	sub    esp,0xc
30400070:	50                   	push   eax
30400071:	e8 da 01 00 00       	call   30400250 <main+0x21f>
30400076:	83 c4 10             	add    esp,0x10
30400079:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:41
        
    int pids[pidsToSpawn];
3040007c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
3040007f:	8d 50 ff             	lea    edx,[eax-0x1]
30400082:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
30400085:	c1 e0 02             	shl    eax,0x2
30400088:	8d 50 03             	lea    edx,[eax+0x3]
3040008b:	b8 10 00 00 00       	mov    eax,0x10
30400090:	83 e8 01             	sub    eax,0x1
30400093:	01 d0                	add    eax,edx
30400095:	b9 10 00 00 00       	mov    ecx,0x10
3040009a:	ba 00 00 00 00       	mov    edx,0x0
3040009f:	f7 f1                	div    ecx
304000a1:	6b c0 10             	imul   eax,eax,0x10
304000a4:	29 c4                	sub    esp,eax
304000a6:	89 e0                	mov    eax,esp
304000a8:	83 c0 03             	add    eax,0x3
304000ab:	c1 e8 02             	shr    eax,0x2
304000ae:	c1 e0 02             	shl    eax,0x2
304000b1:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:42
    int rets[pidsToSpawn];
304000b4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
304000b7:	8d 50 ff             	lea    edx,[eax-0x1]
304000ba:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
304000bd:	c1 e0 02             	shl    eax,0x2
304000c0:	8d 50 03             	lea    edx,[eax+0x3]
304000c3:	b8 10 00 00 00       	mov    eax,0x10
304000c8:	83 e8 01             	sub    eax,0x1
304000cb:	01 d0                	add    eax,edx
304000cd:	b9 10 00 00 00       	mov    ecx,0x10
304000d2:	ba 00 00 00 00       	mov    edx,0x0
304000d7:	f7 f1                	div    ecx
304000d9:	6b c0 10             	imul   eax,eax,0x10
304000dc:	29 c4                	sub    esp,eax
304000de:	89 e0                	mov    eax,esp
304000e0:	83 c0 03             	add    eax,0x3
304000e3:	c1 e8 02             	shr    eax,0x2
304000e6:	c1 e0 02             	shl    eax,0x2
304000e9:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:43
    int pidsP = 0;
304000ec:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/testMMap/mmapmain.c:44
    int childNo = 0;
304000f3:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/testMMap/mmapmain.c:45
    int pidCount = 0;
304000fa:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/testMMap/mmapmain.c:46
    for (int cnt=0;cnt<pidsToSpawn;cnt++)
30400101:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
30400108:	eb 41                	jmp    3040014b <main+0x11a>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:48
    {
         pid=fork();
3040010a:	e8 31 01 00 00       	call   30400240 <main+0x20f>
3040010f:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:49
        childNo+=1;
30400112:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/testMMap/mmapmain.c:50
        if (pid==0)
30400116:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
3040011a:	75 19                	jne    30400135 <main+0x104>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:52
        {
            int cn = doChild(childNo);
3040011c:	83 ec 0c             	sub    esp,0xc
3040011f:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
30400122:	e8 d9 fe ff ff       	call   30400000 <doChild>
30400127:	83 c4 10             	add    esp,0x10
3040012a:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:54
            //print("Child %u quitting\n",cn);
            return cn;
3040012d:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
30400130:	e9 b8 00 00 00       	jmp    304001ed <main+0x1bc>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:57 (discriminator 2)
        }
        else
            pids[pidsP++]=pid;
30400135:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
30400138:	8d 50 01             	lea    edx,[eax+0x1]
3040013b:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
3040013e:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
30400141:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
30400144:	89 0c 82             	mov    DWORD PTR [edx+eax*4],ecx
/home/yogi/src/os/aproj/testMMap/mmapmain.c:46 (discriminator 2)
    int pids[pidsToSpawn];
    int rets[pidsToSpawn];
    int pidsP = 0;
    int childNo = 0;
    int pidCount = 0;
    for (int cnt=0;cnt<pidsToSpawn;cnt++)
30400147:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/testMMap/mmapmain.c:46 (discriminator 1)
3040014b:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
3040014e:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
30400151:	7c b7                	jl     3040010a <main+0xd9>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:60
        }
        else
            pids[pidsP++]=pid;
        //print("Started PID %u\n",pid);
    }
    printf("%u children spawned\n",pidsToSpawn);
30400153:	83 ec 08             	sub    esp,0x8
30400156:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
30400159:	68 60 02 40 30       	push   0x30400260
3040015e:	e8 bd 00 00 00       	call   30400220 <main+0x1ef>
30400163:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:61
    printf("Waiting for all children to quit\n");
30400166:	83 ec 0c             	sub    esp,0xc
30400169:	68 78 02 40 30       	push   0x30400278
3040016e:	e8 ad 00 00 00       	call   30400220 <main+0x1ef>
30400173:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:62
    while (pidCount<pidsToSpawn)
30400176:	eb 58                	jmp    304001d0 <main+0x19f>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:64
    {
        int thePid = pids[pidCount];
30400178:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
3040017b:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
3040017e:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
30400181:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:66
        //print("Waiting for child %u (0x%04X)\n",pidCount+1, thePid);
        rets[pidCount]=waitpid(thePid);
30400184:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
30400187:	83 ec 0c             	sub    esp,0xc
3040018a:	50                   	push   eax
3040018b:	e8 80 00 00 00       	call   30400210 <main+0x1df>
30400190:	83 c4 10             	add    esp,0x10
30400193:	89 c1                	mov    ecx,eax
30400195:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
30400198:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
3040019b:	89 0c 90             	mov    DWORD PTR [eax+edx*4],ecx
/home/yogi/src/os/aproj/testMMap/mmapmain.c:67
        if (rets[pidCount]-1!=pidCount)
3040019e:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
304001a1:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
304001a4:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
304001a7:	83 e8 01             	sub    eax,0x1
304001aa:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
304001ad:	74 1d                	je     304001cc <main+0x19b>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:68
            printf("Wrong return value for child #%u (%u)\n",pidCount,rets[pidCount]);
304001af:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
304001b2:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
304001b5:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
304001b8:	83 ec 04             	sub    esp,0x4
304001bb:	50                   	push   eax
304001bc:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
304001bf:	68 9c 02 40 30       	push   0x3040029c
304001c4:	e8 57 00 00 00       	call   30400220 <main+0x1ef>
304001c9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:69
        pidCount++;
304001cc:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/testMMap/mmapmain.c:62
            pids[pidsP++]=pid;
        //print("Started PID %u\n",pid);
    }
    printf("%u children spawned\n",pidsToSpawn);
    printf("Waiting for all children to quit\n");
    while (pidCount<pidsToSpawn)
304001d0:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
304001d3:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
304001d6:	7c a0                	jl     30400178 <main+0x147>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:71
        rets[pidCount]=waitpid(thePid);
        if (rets[pidCount]-1!=pidCount)
            printf("Wrong return value for child #%u (%u)\n",pidCount,rets[pidCount]);
        pidCount++;
    }
    printf("All children ended\n");
304001d8:	83 ec 0c             	sub    esp,0xc
304001db:	68 c3 02 40 30       	push   0x304002c3
304001e0:	e8 3b 00 00 00       	call   30400220 <main+0x1ef>
304001e5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:72
    return 0;
304001e8:	b8 00 00 00 00       	mov    eax,0x0
304001ed:	89 dc                	mov    esp,ebx
/home/yogi/src/os/aproj/testMMap/mmapmain.c:111
    print("waiting for child 1 (PID=0x%04X)\n", pid);
    uint32_t pid0Return = waitpid(pid);
    print("PID 1 returned %u\n",pid0Return);
    return (0);
*/
}
304001ef:	8d 65 f8             	lea    esp,[ebp-0x8]
304001f2:	59                   	pop    ecx
304001f3:	5b                   	pop    ebx
304001f4:	5d                   	pop    ebp
304001f5:	8d 61 fc             	lea    esp,[ecx-0x4]
304001f8:	c3                   	ret    

Disassembly of section .plt:

30400200 <.plt>:
30400200:	ff 35 74 05 40 30    	push   DWORD PTR ds:0x30400574
30400206:	ff 25 78 05 40 30    	jmp    DWORD PTR ds:0x30400578
3040020c:	00 00                	add    BYTE PTR [eax],al
3040020e:	00 00                	add    BYTE PTR [eax],al
30400210:	ff 25 7c 05 40 30    	jmp    DWORD PTR ds:0x3040057c
30400216:	68 00 00 00 00       	push   0x0
3040021b:	e9 e0 ff ff ff       	jmp    30400200 <main+0x1cf>
30400220:	ff 25 80 05 40 30    	jmp    DWORD PTR ds:0x30400580
30400226:	68 08 00 00 00       	push   0x8
3040022b:	e9 d0 ff ff ff       	jmp    30400200 <main+0x1cf>
30400230:	ff 25 84 05 40 30    	jmp    DWORD PTR ds:0x30400584
30400236:	68 10 00 00 00       	push   0x10
3040023b:	e9 c0 ff ff ff       	jmp    30400200 <main+0x1cf>
30400240:	ff 25 88 05 40 30    	jmp    DWORD PTR ds:0x30400588
30400246:	68 18 00 00 00       	push   0x18
3040024b:	e9 b0 ff ff ff       	jmp    30400200 <main+0x1cf>
30400250:	ff 25 8c 05 40 30    	jmp    DWORD PTR ds:0x3040058c
30400256:	68 20 00 00 00       	push   0x20
3040025b:	e9 a0 ff ff ff       	jmp    30400200 <main+0x1cf>

Disassembly of section .rodata:

30400260 <.rodata>:
30400260:	25 75 20 63 68       	and    eax,0x68632075
30400265:	69 6c 64 72 65 6e 20 	imul   ebp,DWORD PTR [esp+eiz*2+0x72],0x73206e65
3040026c:	73 
3040026d:	70 61                	jo     304002d0 <main+0x29f>
3040026f:	77 6e                	ja     304002df <main+0x2ae>
30400271:	65 64 0a 00          	gs or  al,BYTE PTR fs:gs:[eax]
30400275:	00 00                	add    BYTE PTR [eax],al
30400277:	00 57 61             	add    BYTE PTR [edi+0x61],dl
3040027a:	69 74 69 6e 67 20 66 	imul   esi,DWORD PTR [ecx+ebp*2+0x6e],0x6f662067
30400281:	6f 
30400282:	72 20                	jb     304002a4 <main+0x273>
30400284:	61                   	popa   
30400285:	6c                   	ins    BYTE PTR es:[edi],dx
30400286:	6c                   	ins    BYTE PTR es:[edi],dx
30400287:	20 63 68             	and    BYTE PTR [ebx+0x68],ah
3040028a:	69 6c 64 72 65 6e 20 	imul   ebp,DWORD PTR [esp+eiz*2+0x72],0x74206e65
30400291:	74 
30400292:	6f                   	outs   dx,DWORD PTR ds:[esi]
30400293:	20 71 75             	and    BYTE PTR [ecx+0x75],dh
30400296:	69 74 0a 00 00 00 57 	imul   esi,DWORD PTR [edx+ecx*1+0x0],0x72570000
3040029d:	72 
3040029e:	6f                   	outs   dx,DWORD PTR ds:[esi]
3040029f:	6e                   	outs   dx,BYTE PTR ds:[esi]
304002a0:	67 20 72 65          	and    BYTE PTR [bp+si+0x65],dh
304002a4:	74 75                	je     3040031b <main+0x2ea>
304002a6:	72 6e                	jb     30400316 <main+0x2e5>
304002a8:	20 76 61             	and    BYTE PTR [esi+0x61],dh
304002ab:	6c                   	ins    BYTE PTR es:[edi],dx
304002ac:	75 65                	jne    30400313 <main+0x2e2>
304002ae:	20 66 6f             	and    BYTE PTR [esi+0x6f],ah
304002b1:	72 20                	jb     304002d3 <main+0x2a2>
304002b3:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
304002b6:	6c                   	ins    BYTE PTR es:[edi],dx
304002b7:	64 20 23             	and    BYTE PTR fs:[ebx],ah
304002ba:	25 75 20 28 25       	and    eax,0x25282075
304002bf:	75 29                	jne    304002ea <main+0x2b9>
304002c1:	0a 00                	or     al,BYTE PTR [eax]
304002c3:	41                   	inc    ecx
304002c4:	6c                   	ins    BYTE PTR es:[edi],dx
304002c5:	6c                   	ins    BYTE PTR es:[edi],dx
304002c6:	20 63 68             	and    BYTE PTR [ebx+0x68],ah
304002c9:	69 6c 64 72 65 6e 20 	imul   ebp,DWORD PTR [esp+eiz*2+0x72],0x65206e65
304002d0:	65 
304002d1:	6e                   	outs   dx,BYTE PTR ds:[esi]
304002d2:	64 65 64 0a 00       	fs gs or al,BYTE PTR fs:gs:[eax]

Disassembly of section .eh_frame:

304002d8 <.eh_frame>:
304002d8:	14 00                	adc    al,0x0
304002da:	00 00                	add    BYTE PTR [eax],al
304002dc:	00 00                	add    BYTE PTR [eax],al
304002de:	00 00                	add    BYTE PTR [eax],al
304002e0:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
304002e3:	00 01                	add    BYTE PTR [ecx],al
304002e5:	7c 08                	jl     304002ef <main+0x2be>
304002e7:	01 1b                	add    DWORD PTR [ebx],ebx
304002e9:	0c 04                	or     al,0x4
304002eb:	04 88                	add    al,0x88
304002ed:	01 00                	add    DWORD PTR [eax],eax
304002ef:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
304002f2:	00 00                	add    BYTE PTR [eax],al
304002f4:	1c 00                	sbb    al,0x0
304002f6:	00 00                	add    BYTE PTR [eax],al
304002f8:	08 fd                	or     ch,bh
304002fa:	ff                   	(bad)  
304002fb:	ff 31                	push   DWORD PTR [ecx]
304002fd:	00 00                	add    BYTE PTR [eax],al
304002ff:	00 00                	add    BYTE PTR [eax],al
30400301:	41                   	inc    ecx
30400302:	0e                   	push   cs
30400303:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30400309:	6d                   	ins    DWORD PTR es:[edi],dx
3040030a:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
3040030d:	04 00                	add    al,0x0
3040030f:	00 34 00             	add    BYTE PTR [eax+eax*1],dh
30400312:	00 00                	add    BYTE PTR [eax],al
30400314:	3c 00                	cmp    al,0x0
30400316:	00 00                	add    BYTE PTR [eax],al
30400318:	19 fd                	sbb    ebp,edi
3040031a:	ff                   	(bad)  
3040031b:	ff c8                	dec    eax
3040031d:	01 00                	add    DWORD PTR [eax],eax
3040031f:	00 00                	add    BYTE PTR [eax],al
30400321:	44                   	inc    esp
30400322:	0c 01                	or     al,0x1
30400324:	00 47 10             	add    BYTE PTR [edi+0x10],al
30400327:	05 02 75 00 44       	add    eax,0x44007502
3040032c:	0f 03 75 78          	lsl    esi,WORD PTR [ebp+0x78]
30400330:	06                   	push   es
30400331:	10 03                	adc    BYTE PTR [ebx],al
30400333:	02 75 7c             	add    dh,BYTE PTR [ebp+0x7c]
30400336:	03 b3 01 c1 0c 01    	add    esi,DWORD PTR [ebx+0x10cc101]
3040033c:	00 41 c3             	add    BYTE PTR [ecx-0x3d],al
3040033f:	41                   	inc    ecx
30400340:	c5 43 0c             	lds    eax,FWORD PTR [ebx+0xc]
30400343:	04 04                	add    al,0x4
30400345:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .interp:

30400348 <.interp>:
30400348:	2f                   	das    
30400349:	6c                   	ins    BYTE PTR es:[edi],dx
3040034a:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
30400351:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
30400358:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

3040035c <.dynsym>:
	...
3040036c:	09 00                	or     DWORD PTR [eax],eax
	...
30400376:	00 00                	add    BYTE PTR [eax],al
30400378:	12 00                	adc    al,BYTE PTR [eax]
3040037a:	00 00                	add    BYTE PTR [eax],al
3040037c:	11 00                	adc    DWORD PTR [eax],eax
	...
30400386:	00 00                	add    BYTE PTR [eax],al
30400388:	12 00                	adc    al,BYTE PTR [eax]
3040038a:	00 00                	add    BYTE PTR [eax],al
3040038c:	18 00                	sbb    BYTE PTR [eax],al
	...
30400396:	00 00                	add    BYTE PTR [eax],al
30400398:	12 00                	adc    al,BYTE PTR [eax]
3040039a:	00 00                	add    BYTE PTR [eax],al
3040039c:	1e                   	push   ds
	...
304003a5:	00 00                	add    BYTE PTR [eax],al
304003a7:	00 12                	add    BYTE PTR [edx],dl
304003a9:	00 00                	add    BYTE PTR [eax],al
304003ab:	00 28                	add    BYTE PTR [eax],ch
304003ad:	00 00                	add    BYTE PTR [eax],al
304003af:	00 00                	add    BYTE PTR [eax],al
304003b1:	00 13                	add    BYTE PTR [ebx],dl
304003b3:	00 00                	add    BYTE PTR [eax],al
304003b5:	00 00                	add    BYTE PTR [eax],al
304003b7:	00 10                	add    BYTE PTR [eax],dl
304003b9:	00 01                	add    BYTE PTR [ecx],al
304003bb:	00 23                	add    BYTE PTR [ebx],ah
	...
304003c5:	00 00                	add    BYTE PTR [eax],al
304003c7:	00 12                	add    BYTE PTR [edx],dl
304003c9:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

304003cc <.dynstr>:
304003cc:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
304003d0:	63 2e                	arpl   WORD PTR [esi],bp
304003d2:	73 6f                	jae    30400443 <main+0x412>
304003d4:	00 77 61             	add    BYTE PTR [edi+0x61],dh
304003d7:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
304003de:	72 
304003df:	69 6e 74 66 00 73 6c 	imul   ebp,DWORD PTR [esi+0x74],0x6c730066
304003e6:	65                   	gs
304003e7:	65                   	gs
304003e8:	70 00                	jo     304003ea <main+0x3b9>
304003ea:	66 6f                	outs   dx,WORD PTR ds:[esi]
304003ec:	72 6b                	jb     30400459 <main+0x428>
304003ee:	00 61 74             	add    BYTE PTR [ecx+0x74],ah
304003f1:	6f                   	outs   dx,DWORD PTR ds:[esi]
304003f2:	69 00 73 79 73 45    	imul   eax,DWORD PTR [eax],0x45737973
304003f8:	6e                   	outs   dx,BYTE PTR ds:[esi]
304003f9:	74 65                	je     30400460 <main+0x42f>
304003fb:	72 5f                	jb     3040045c <main+0x42b>
304003fd:	56                   	push   esi
304003fe:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
30400403:	00 2e                	add    BYTE PTR [esi],ch
30400405:	2e                   	cs
30400406:	2f                   	das    
30400407:	6c                   	ins    BYTE PTR es:[edi],dx
30400408:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
3040040f:	4f                   	dec    edi
30400410:	53                   	push   ebx
30400411:	2f                   	das    
30400412:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
30400419:	62 
3040041a:	75 67                	jne    30400483 <main+0x452>
3040041c:	2f                   	das    
3040041d:	47                   	inc    edi
3040041e:	4e                   	dec    esi
3040041f:	55                   	push   ebp
30400420:	2d 4c 69 6e 75       	sub    eax,0x756e694c
30400425:	78 00                	js     30400427 <main+0x3f6>

Disassembly of section .hash:

30400428 <.hash>:
30400428:	03 00                	add    eax,DWORD PTR [eax]
3040042a:	00 00                	add    BYTE PTR [eax],al
3040042c:	07                   	pop    es
3040042d:	00 00                	add    BYTE PTR [eax],al
3040042f:	00 06                	add    BYTE PTR [esi],al
30400431:	00 00                	add    BYTE PTR [eax],al
30400433:	00 00                	add    BYTE PTR [eax],al
30400435:	00 00                	add    BYTE PTR [eax],al
30400437:	00 04 00             	add    BYTE PTR [eax+eax*1],al
	...
30400442:	00 00                	add    BYTE PTR [eax],al
30400444:	01 00                	add    DWORD PTR [eax],eax
30400446:	00 00                	add    BYTE PTR [eax],al
30400448:	00 00                	add    BYTE PTR [eax],al
3040044a:	00 00                	add    BYTE PTR [eax],al
3040044c:	02 00                	add    al,BYTE PTR [eax]
3040044e:	00 00                	add    BYTE PTR [eax],al
30400450:	03 00                	add    eax,DWORD PTR [eax]
30400452:	00 00                	add    BYTE PTR [eax],al
30400454:	05                   	.byte 0x5
30400455:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

30400458 <.eh_frame>:
30400458:	14 00                	adc    al,0x0
3040045a:	00 00                	add    BYTE PTR [eax],al
3040045c:	00 00                	add    BYTE PTR [eax],al
3040045e:	00 00                	add    BYTE PTR [eax],al
30400460:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
30400463:	00 01                	add    BYTE PTR [ecx],al
30400465:	7c 08                	jl     3040046f <main+0x43e>
30400467:	01 1b                	add    DWORD PTR [ebx],ebx
30400469:	0c 04                	or     al,0x4
3040046b:	04 88                	add    al,0x88
3040046d:	01 00                	add    DWORD PTR [eax],eax
3040046f:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
30400472:	00 00                	add    BYTE PTR [eax],al
30400474:	1c 00                	sbb    al,0x0
30400476:	00 00                	add    BYTE PTR [eax],al
30400478:	88 fd                	mov    ch,bh
3040047a:	ff                   	(bad)  
3040047b:	ff 60 00             	jmp    DWORD PTR [eax+0x0]
3040047e:	00 00                	add    BYTE PTR [eax],al
30400480:	00 0e                	add    BYTE PTR [esi],cl
30400482:	08 46 0e             	or     BYTE PTR [esi+0xe],al
30400485:	0c 4a                	or     al,0x4a
30400487:	0f 0b                	ud2    
30400489:	74 04                	je     3040048f <main+0x45e>
3040048b:	78 00                	js     3040048d <main+0x45c>
3040048d:	3f                   	aas    
3040048e:	1a 3b                	sbb    bh,BYTE PTR [ebx]
30400490:	2a 32                	sub    dh,BYTE PTR [edx]
30400492:	24 22                	and    al,0x22
30400494:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

30400498 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
30400498:	01 1b                	add    DWORD PTR [ebx],ebx
3040049a:	03 3b                	add    edi,DWORD PTR [ebx]
3040049c:	3c fe                	cmp    al,0xfe
3040049e:	ff                   	(bad)  
3040049f:	ff 02                	inc    DWORD PTR [edx]
304004a1:	00 00                	add    BYTE PTR [eax],al
304004a3:	00 68 fb             	add    BYTE PTR [eax-0x5],ch
304004a6:	ff                   	(bad)  
304004a7:	ff 58 fe             	call   FWORD PTR [eax-0x2]
304004aa:	ff                   	(bad)  
304004ab:	ff 99 fb ff ff 78    	call   FWORD PTR [ecx+0x78fffffb]
304004b1:	fe                   	(bad)  
304004b2:	ff                   	(bad)  
304004b3:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

304004b4 <.rel.dyn>:
304004b4:	7c 05                	jl     304004bb <__GNU_EH_FRAME_HDR+0x23>
304004b6:	40                   	inc    eax
304004b7:	30 07                	xor    BYTE PTR [edi],al
304004b9:	01 00                	add    DWORD PTR [eax],eax
304004bb:	00 80 05 40 30 07    	add    BYTE PTR [eax+0x7304005],al
304004c1:	02 00                	add    al,BYTE PTR [eax]
304004c3:	00 84 05 40 30 07 03 	add    BYTE PTR [ebp+eax*1+0x3073040],al
304004ca:	00 00                	add    BYTE PTR [eax],al
304004cc:	88 05 40 30 07 04    	mov    BYTE PTR ds:0x4073040,al
304004d2:	00 00                	add    BYTE PTR [eax],al
304004d4:	8c 05 40 30 07 06    	mov    WORD PTR ds:0x6073040,es
	...

Disassembly of section .data:

304004dc <sharedCounter>:
304004dc:	0a 00                	or     al,BYTE PTR [eax]
	...

Disassembly of section .dynamic:

304004e0 <_DYNAMIC>:
304004e0:	01 00                	add    DWORD PTR [eax],eax
304004e2:	00 00                	add    BYTE PTR [eax],al
304004e4:	01 00                	add    DWORD PTR [eax],eax
304004e6:	00 00                	add    BYTE PTR [eax],al
304004e8:	0f 00 00             	sldt   WORD PTR [eax]
304004eb:	00 38                	add    BYTE PTR [eax],bh
304004ed:	00 00                	add    BYTE PTR [eax],al
304004ef:	00 04 00             	add    BYTE PTR [eax+eax*1],al
304004f2:	00 00                	add    BYTE PTR [eax],al
304004f4:	28 04 40             	sub    BYTE PTR [eax+eax*2],al
304004f7:	30 05 00 00 00 cc    	xor    BYTE PTR ds:0xcc000000,al
304004fd:	03 40 30             	add    eax,DWORD PTR [eax+0x30]
30400500:	06                   	push   es
30400501:	00 00                	add    BYTE PTR [eax],al
30400503:	00 5c 03 40          	add    BYTE PTR [ebx+eax*1+0x40],bl
30400507:	30 0a                	xor    BYTE PTR [edx],cl
30400509:	00 00                	add    BYTE PTR [eax],al
3040050b:	00 5b 00             	add    BYTE PTR [ebx+0x0],bl
3040050e:	00 00                	add    BYTE PTR [eax],al
30400510:	0b 00                	or     eax,DWORD PTR [eax]
30400512:	00 00                	add    BYTE PTR [eax],al
30400514:	10 00                	adc    BYTE PTR [eax],al
30400516:	00 00                	add    BYTE PTR [eax],al
30400518:	15 00 00 00 00       	adc    eax,0x0
3040051d:	00 00                	add    BYTE PTR [eax],al
3040051f:	00 03                	add    BYTE PTR [ebx],al
30400521:	00 00                	add    BYTE PTR [eax],al
30400523:	00 70 05             	add    BYTE PTR [eax+0x5],dh
30400526:	40                   	inc    eax
30400527:	30 02                	xor    BYTE PTR [edx],al
30400529:	00 00                	add    BYTE PTR [eax],al
3040052b:	00 28                	add    BYTE PTR [eax],ch
3040052d:	00 00                	add    BYTE PTR [eax],al
3040052f:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
30400532:	00 00                	add    BYTE PTR [eax],al
30400534:	11 00                	adc    DWORD PTR [eax],eax
30400536:	00 00                	add    BYTE PTR [eax],al
30400538:	17                   	pop    ss
30400539:	00 00                	add    BYTE PTR [eax],al
3040053b:	00 b4 04 40 30 00 00 	add    BYTE PTR [esp+eax*1+0x3040],dh
	...

Disassembly of section .got.plt:

30400570 <_GLOBAL_OFFSET_TABLE_>:
30400570:	e0 04                	loopne 30400576 <_GLOBAL_OFFSET_TABLE_+0x6>
30400572:	40                   	inc    eax
30400573:	30 00                	xor    BYTE PTR [eax],al
30400575:	00 00                	add    BYTE PTR [eax],al
30400577:	00 00                	add    BYTE PTR [eax],al
30400579:	00 00                	add    BYTE PTR [eax],al
3040057b:	00 16                	add    BYTE PTR [esi],dl
3040057d:	02 40 30             	add    al,BYTE PTR [eax+0x30]
30400580:	26 02 40 30          	add    al,BYTE PTR es:[eax+0x30]
30400584:	36 02 40 30          	add    al,BYTE PTR ss:[eax+0x30]
30400588:	46                   	inc    esi
30400589:	02 40 30             	add    al,BYTE PTR [eax+0x30]
3040058c:	56                   	push   esi
3040058d:	02 40 30             	add    al,BYTE PTR [eax+0x30]

Disassembly of section .bss:

30400590 <filesToCloseCount>:
30400590:	00 00                	add    BYTE PTR [eax],al
	...

30400594 <filesToClose>:
30400594:	00 00                	add    BYTE PTR [eax],al
	...

30400598 <heapEnd>:
30400598:	00 00                	add    BYTE PTR [eax],al
	...

3040059c <heapBase>:
3040059c:	00 00                	add    BYTE PTR [eax],al
	...

304005a0 <heapCurr>:
304005a0:	00 00                	add    BYTE PTR [eax],al
	...

304005a4 <processEnvp>:
304005a4:	00 00                	add    BYTE PTR [eax],al
	...

304005a8 <libcTZ>:
304005a8:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	86 02                	xchg   BYTE PTR [edx],al
   2:	00 00                	add    BYTE PTR [eax],al
   4:	04 00                	add    al,0x0
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	fc                   	cld    
   d:	00 00                	add    BYTE PTR [eax],al
   f:	00 0c b6             	add    BYTE PTR [esi+esi*4],cl
  12:	00 00                	add    BYTE PTR [eax],al
  14:	00 4c 00 00          	add    BYTE PTR [eax+eax*1+0x0],cl
  18:	00 00                	add    BYTE PTR [eax],al
  1a:	00 40 30             	add    BYTE PTR [eax+0x30],al
  1d:	f9                   	stc    
  1e:	01 00                	add    DWORD PTR [eax],eax
  20:	00 00                	add    BYTE PTR [eax],al
  22:	00 00                	add    BYTE PTR [eax],al
  24:	00 02                	add    BYTE PTR [edx],al
  26:	01 06                	add    DWORD PTR [esi],eax
  28:	3e 00 00             	add    BYTE PTR ds:[eax],al
  2b:	00 02                	add    BYTE PTR [edx],al
  2d:	01 06                	add    DWORD PTR [esi],eax
  2f:	37                   	aaa    
  30:	00 00                	add    BYTE PTR [eax],al
  32:	00 02                	add    BYTE PTR [edx],al
  34:	02 05 73 01 00 00    	add    al,BYTE PTR ds:0x173
  3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  41:	02 08                	add    cl,BYTE PTR [eax]
  43:	05 60 01 00 00       	add    eax,0x160
  48:	02 01                	add    al,BYTE PTR [ecx]
  4a:	08 35 00 00 00 02    	or     BYTE PTR ds:0x2000000,dh
  50:	02 07                	add    al,BYTE PTR [edi]
  52:	6d                   	ins    DWORD PTR es:[edi],dx
  53:	00 00                	add    BYTE PTR [eax],al
  55:	00 04 8b             	add    BYTE PTR [ebx+ecx*4],al
  58:	01 00                	add    DWORD PTR [eax],eax
  5a:	00 02                	add    BYTE PTR [edx],al
  5c:	34 61                	xor    al,0x61
  5e:	00 00                	add    BYTE PTR [eax],al
  60:	00 02                	add    BYTE PTR [edx],al
  62:	04 07                	add    al,0x7
  64:	cb                   	retf   
  65:	00 00                	add    BYTE PTR [eax],al
  67:	00 02                	add    BYTE PTR [edx],al
  69:	08 07                	or     BYTE PTR [edi],al
  6b:	c1 00 00             	rol    DWORD PTR [eax],0x0
  6e:	00 04 19             	add    BYTE PTR [ecx+ebx*1],al
  71:	00 00                	add    BYTE PTR [eax],al
  73:	00 02                	add    BYTE PTR [edx],al
  75:	56                   	push   esi
  76:	61                   	popa   
  77:	00 00                	add    BYTE PTR [eax],al
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	04 05                	add    al,0x5
  7d:	65 01 00             	add    DWORD PTR gs:[eax],eax
  80:	00 02                	add    BYTE PTR [edx],al
  82:	01 02                	add    DWORD PTR [edx],eax
  84:	94                   	xchg   esp,eax
  85:	01 00                	add    DWORD PTR [eax],eax
  87:	00 02                	add    BYTE PTR [edx],al
  89:	04 07                	add    al,0x7
  8b:	57                   	push   edi
  8c:	01 00                	add    DWORD PTR [eax],eax
  8e:	00 02                	add    BYTE PTR [edx],al
  90:	08 04 8c             	or     BYTE PTR [esp+ecx*4],al
  93:	00 00                	add    BYTE PTR [eax],al
  95:	00 05 e6 00 00 00    	add    BYTE PTR ds:0xe6,al
  9b:	01 16                	add    DWORD PTR [esi],edx
  9d:	3a 00                	cmp    al,BYTE PTR [eax]
  9f:	00 00                	add    BYTE PTR [eax],al
  a1:	00 00                	add    BYTE PTR [eax],al
  a3:	40                   	inc    eax
  a4:	30 31                	xor    BYTE PTR [ecx],dh
  a6:	00 00                	add    BYTE PTR [eax],al
  a8:	00 01                	add    BYTE PTR [ecx],al
  aa:	9c                   	pushf  
  ab:	d6                   	(bad)  
  ac:	00 00                	add    BYTE PTR [eax],al
  ae:	00 06                	add    BYTE PTR [esi],al
  b0:	43                   	inc    ebx
  b1:	00 00                	add    BYTE PTR [eax],al
  b3:	00 01                	add    BYTE PTR [ecx],al
  b5:	16                   	push   ss
  b6:	3a 00                	cmp    al,BYTE PTR [eax]
  b8:	00 00                	add    BYTE PTR [eax],al
  ba:	02 91 00 07 06 00    	add    dl,BYTE PTR [ecx+0x60700]
  c0:	40                   	inc    eax
  c1:	30 26                	xor    BYTE PTR [esi],ah
  c3:	00 00                	add    BYTE PTR [eax],al
  c5:	00 08                	add    BYTE PTR [eax],cl
  c7:	ee                   	out    dx,al
  c8:	00 00                	add    BYTE PTR [eax],al
  ca:	00 01                	add    BYTE PTR [ecx],al
  cc:	18 3a                	sbb    BYTE PTR [edx],bh
  ce:	00 00                	add    BYTE PTR [eax],al
  d0:	00 02                	add    BYTE PTR [edx],al
  d2:	91                   	xchg   ecx,eax
  d3:	6c                   	ins    BYTE PTR es:[edi],dx
  d4:	00 00                	add    BYTE PTR [eax],al
  d6:	05 a1 00 00 00       	add    eax,0xa1
  db:	01 21                	add    DWORD PTR [ecx],esp
  dd:	3a 00                	cmp    al,BYTE PTR [eax]
  df:	00 00                	add    BYTE PTR [eax],al
  e1:	31 00                	xor    DWORD PTR [eax],eax
  e3:	40                   	inc    eax
  e4:	30 c8                	xor    al,cl
  e6:	01 00                	add    DWORD PTR [eax],eax
  e8:	00 01                	add    BYTE PTR [ecx],al
  ea:	9c                   	pushf  
  eb:	c9                   	leave  
  ec:	01 00                	add    DWORD PTR [eax],eax
  ee:	00 06                	add    BYTE PTR [esi],al
  f0:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
  f1:	01 00                	add    DWORD PTR [eax],eax
  f3:	00 01                	add    BYTE PTR [ecx],al
  f5:	21 3a                	and    DWORD PTR [edx],edi
  f7:	00 00                	add    BYTE PTR [eax],al
  f9:	00 02                	add    BYTE PTR [edx],al
  fb:	91                   	xchg   ecx,eax
  fc:	00 06                	add    BYTE PTR [esi],al
  fe:	86 01                	xchg   BYTE PTR [ecx],al
 100:	00 00                	add    BYTE PTR [eax],al
 102:	01 21                	add    DWORD PTR [ecx],esp
 104:	c9                   	leave  
 105:	01 00                	add    DWORD PTR [eax],eax
 107:	00 02                	add    BYTE PTR [edx],al
 109:	91                   	xchg   ecx,eax
 10a:	04 09                	add    al,0x9
 10c:	70 69                	jo     177 <sysEnter_Vector-0x12fe89>
 10e:	64 00 01             	add    BYTE PTR fs:[ecx],al
 111:	23 3a                	and    edi,DWORD PTR [edx]
 113:	00 00                	add    BYTE PTR [eax],al
 115:	00 02                	add    BYTE PTR [edx],al
 117:	75 60                	jne    179 <sysEnter_Vector-0x12fe87>
 119:	08 6e 01             	or     BYTE PTR [esi+0x1],ch
 11c:	00 00                	add    BYTE PTR [eax],al
 11e:	01 23                	add    DWORD PTR [ebx],esp
 120:	3a 00                	cmp    al,BYTE PTR [eax]
 122:	00 00                	add    BYTE PTR [eax],al
 124:	02 75 5c             	add    dh,BYTE PTR [ebp+0x5c]
 127:	08 9a 01 00 00 01    	or     BYTE PTR [edx+0x1000001],bl
 12d:	23 3a                	and    edi,DWORD PTR [edx]
 12f:	00 00                	add    BYTE PTR [eax],al
 131:	00 02                	add    BYTE PTR [edx],al
 133:	75 74                	jne    1a9 <sysEnter_Vector-0x12fe57>
 135:	08 30                	or     BYTE PTR [eax],dh
 137:	00 00                	add    BYTE PTR [eax],al
 139:	00 01                	add    BYTE PTR [ecx],al
 13b:	29 d5                	sub    ebp,edx
 13d:	01 00                	add    DWORD PTR [eax],eax
 13f:	00 03                	add    BYTE PTR [ebx],al
 141:	75 54                	jne    197 <sysEnter_Vector-0x12fe69>
 143:	06                   	push   es
 144:	08 e1                	or     cl,ah
 146:	00 00                	add    BYTE PTR [eax],al
 148:	00 01                	add    BYTE PTR [ecx],al
 14a:	2a e8                	sub    ch,al
 14c:	01 00                	add    DWORD PTR [eax],eax
 14e:	00 03                	add    BYTE PTR [ebx],al
 150:	75 4c                	jne    19e <sysEnter_Vector-0x12fe62>
 152:	06                   	push   es
 153:	08 93 00 00 00 01    	or     BYTE PTR [ebx+0x1000000],dl
 159:	2b 3a                	sub    edi,DWORD PTR [edx]
 15b:	00 00                	add    BYTE PTR [eax],al
 15d:	00 02                	add    BYTE PTR [edx],al
 15f:	75 70                	jne    1d1 <sysEnter_Vector-0x12fe2f>
 161:	08 ab 01 00 00 01    	or     BYTE PTR [ebx+0x1000001],ch
 167:	2c 3a                	sub    al,0x3a
 169:	00 00                	add    BYTE PTR [eax],al
 16b:	00 02                	add    BYTE PTR [edx],al
 16d:	75 6c                	jne    1db <sysEnter_Vector-0x12fe25>
 16f:	08 d8                	or     al,bl
 171:	00 00                	add    BYTE PTR [eax],al
 173:	00 01                	add    BYTE PTR [ecx],al
 175:	2d 3a 00 00 00       	sub    eax,0x3a
 17a:	02 75 68             	add    dh,BYTE PTR [ebp+0x68]
 17d:	0a 01                	or     al,BYTE PTR [ecx]
 17f:	01 40 30             	add    DWORD PTR [eax+0x30],eax
 182:	52                   	push   edx
 183:	00 00                	add    BYTE PTR [eax],al
 185:	00 b0 01 00 00 09    	add    BYTE PTR [eax+0x9000001],dh
 18b:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 18e:	00 01                	add    BYTE PTR [ecx],al
 190:	2e 3a 00             	cmp    al,BYTE PTR cs:[eax]
 193:	00 00                	add    BYTE PTR [eax],al
 195:	02 75 64             	add    dh,BYTE PTR [ebp+0x64]
 198:	07                   	pop    es
 199:	1c 01                	sbb    al,0x1
 19b:	40                   	inc    eax
 19c:	30 19                	xor    BYTE PTR [ecx],bl
 19e:	00 00                	add    BYTE PTR [eax],al
 1a0:	00 09                	add    BYTE PTR [ecx],cl
 1a2:	63 6e 00             	arpl   WORD PTR [esi+0x0],bp
 1a5:	01 34 3a             	add    DWORD PTR [edx+edi*1],esi
 1a8:	00 00                	add    BYTE PTR [eax],al
 1aa:	00 02                	add    BYTE PTR [edx],al
 1ac:	75 48                	jne    1f6 <sysEnter_Vector-0x12fe0a>
 1ae:	00 00                	add    BYTE PTR [eax],al
 1b0:	07                   	pop    es
 1b1:	78 01                	js     1b4 <sysEnter_Vector-0x12fe4c>
 1b3:	40                   	inc    eax
 1b4:	30 58 00             	xor    BYTE PTR [eax+0x0],bl
 1b7:	00 00                	add    BYTE PTR [eax],al
 1b9:	08 af 00 00 00 01    	or     BYTE PTR [edi+0x1000000],ch
 1bf:	40                   	inc    eax
 1c0:	3a 00                	cmp    al,BYTE PTR [eax]
 1c2:	00 00                	add    BYTE PTR [eax],al
 1c4:	02 75 44             	add    dh,BYTE PTR [ebp+0x44]
 1c7:	00 00                	add    BYTE PTR [eax],al
 1c9:	0b 04 cf             	or     eax,DWORD PTR [edi+ecx*8]
 1cc:	01 00                	add    DWORD PTR [eax],eax
 1ce:	00 0b                	add    BYTE PTR [ebx],cl
 1d0:	04 25                	add    al,0x25
 1d2:	00 00                	add    BYTE PTR [eax],al
 1d4:	00 0c 3a             	add    BYTE PTR [edx+edi*1],cl
 1d7:	00 00                	add    BYTE PTR [eax],al
 1d9:	00 e8                	add    al,ch
 1db:	01 00                	add    DWORD PTR [eax],eax
 1dd:	00 0d 88 00 00 00    	add    BYTE PTR ds:0x88,cl
 1e3:	03 75 58             	add    esi,DWORD PTR [ebp+0x58]
 1e6:	06                   	push   es
 1e7:	00 0c 3a             	add    BYTE PTR [edx+edi*1],cl
 1ea:	00 00                	add    BYTE PTR [eax],al
 1ec:	00 fb                	add    bl,bh
 1ee:	01 00                	add    DWORD PTR [eax],eax
 1f0:	00 0d 88 00 00 00    	add    BYTE PTR ds:0x88,cl
 1f6:	03 75 50             	add    esi,DWORD PTR [ebp+0x50]
 1f9:	06                   	push   es
 1fa:	00 0e                	add    BYTE PTR [esi],cl
 1fc:	7d 01                	jge    1ff <sysEnter_Vector-0x12fe01>
 1fe:	00 00                	add    BYTE PTR [eax],al
 200:	03 39                	add    edi,DWORD PTR [ecx]
 202:	56                   	push   esi
 203:	00 00                	add    BYTE PTR [eax],al
 205:	00 05 03 9c 05 40    	add    BYTE PTR ds:0x40059c03,al
 20b:	30 0e                	xor    BYTE PTR [esi],cl
 20d:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 20e:	00 00                	add    BYTE PTR [eax],al
 210:	00 03                	add    BYTE PTR [ebx],al
 212:	3a 56 00             	cmp    dl,BYTE PTR [esi+0x0]
 215:	00 00                	add    BYTE PTR [eax],al
 217:	05 03 a0 05 40       	add    eax,0x4005a003
 21c:	30 0e                	xor    BYTE PTR [esi],cl
 21e:	99                   	cdq    
 21f:	00 00                	add    BYTE PTR [eax],al
 221:	00 03                	add    BYTE PTR [ebx],al
 223:	3b 56 00             	cmp    edx,DWORD PTR [esi+0x0]
 226:	00 00                	add    BYTE PTR [eax],al
 228:	05 03 98 05 40       	add    eax,0x40059803
 22d:	30 0e                	xor    BYTE PTR [esi],cl
 22f:	00 00                	add    BYTE PTR [eax],al
 231:	00 00                	add    BYTE PTR [eax],al
 233:	03 3c 7a             	add    edi,DWORD PTR [edx+edi*2]
 236:	00 00                	add    BYTE PTR [eax],al
 238:	00 05 03 a8 05 40    	add    BYTE PTR ds:0x4005a803,al
 23e:	30 0e                	xor    BYTE PTR [esi],cl
 240:	23 00                	and    eax,DWORD PTR [eax]
 242:	00 00                	add    BYTE PTR [eax],al
 244:	04 34                	add    al,0x34
 246:	50                   	push   eax
 247:	02 00                	add    al,BYTE PTR [eax]
 249:	00 05 03 94 05 40    	add    BYTE PTR ds:0x40059403,al
 24f:	30 0b                	xor    BYTE PTR [ebx],cl
 251:	04 6f                	add    al,0x6f
 253:	00 00                	add    BYTE PTR [eax],al
 255:	00 0e                	add    BYTE PTR [esi],cl
 257:	07                   	pop    es
 258:	00 00                	add    BYTE PTR [eax],al
 25a:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
 261:	05 03 90 05 40       	add    eax,0x40059003
 266:	30 0e                	xor    BYTE PTR [esi],cl
 268:	80 00 00             	add    BYTE PTR [eax],0x0
 26b:	00 05 58 c9 01 00    	add    BYTE PTR ds:0x1c958,al
 271:	00 05 03 a4 05 40    	add    BYTE PTR ds:0x4005a403,al
 277:	30 0e                	xor    BYTE PTR [esi],cl
 279:	ee                   	out    dx,al
 27a:	00 00                	add    BYTE PTR [eax],al
 27c:	00 01                	add    BYTE PTR [ecx],al
 27e:	14 3a                	adc    al,0x3a
 280:	00 00                	add    BYTE PTR [eax],al
 282:	00 05 03 dc 04 40    	add    BYTE PTR ds:0x4004dc03,al
 288:	30 00                	xor    BYTE PTR [eax],al

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
  35:	00 05 2e 01 3f 19    	add    BYTE PTR ds:0x193f012e,al
  3b:	03 0e                	add    ecx,DWORD PTR [esi]
  3d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  3f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  41:	27                   	daa    
  42:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
  45:	11 01                	adc    DWORD PTR [ecx],eax
  47:	12 06                	adc    al,BYTE PTR [esi]
  49:	40                   	inc    eax
  4a:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  50:	00 00                	add    BYTE PTR [eax],al
  52:	06                   	push   es
  53:	05 00 03 0e 3a       	add    eax,0x3a0e0300
  58:	0b 3b                	or     edi,DWORD PTR [ebx]
  5a:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  5d:	02 18                	add    bl,BYTE PTR [eax]
  5f:	00 00                	add    BYTE PTR [eax],al
  61:	07                   	pop    es
  62:	0b 01                	or     eax,DWORD PTR [ecx]
  64:	11 01                	adc    DWORD PTR [ecx],eax
  66:	12 06                	adc    al,BYTE PTR [esi]
  68:	00 00                	add    BYTE PTR [eax],al
  6a:	08 34 00             	or     BYTE PTR [eax+eax*1],dh
  6d:	03 0e                	add    ecx,DWORD PTR [esi]
  6f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  71:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  73:	49                   	dec    ecx
  74:	13 02                	adc    eax,DWORD PTR [edx]
  76:	18 00                	sbb    BYTE PTR [eax],al
  78:	00 09                	add    BYTE PTR [ecx],cl
  7a:	34 00                	xor    al,0x0
  7c:	03 08                	add    ecx,DWORD PTR [eax]
  7e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  80:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  82:	49                   	dec    ecx
  83:	13 02                	adc    eax,DWORD PTR [edx]
  85:	18 00                	sbb    BYTE PTR [eax],al
  87:	00 0a                	add    BYTE PTR [edx],cl
  89:	0b 01                	or     eax,DWORD PTR [ecx]
  8b:	11 01                	adc    DWORD PTR [ecx],eax
  8d:	12 06                	adc    al,BYTE PTR [esi]
  8f:	01 13                	add    DWORD PTR [ebx],edx
  91:	00 00                	add    BYTE PTR [eax],al
  93:	0b 0f                	or     ecx,DWORD PTR [edi]
  95:	00 0b                	add    BYTE PTR [ebx],cl
  97:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  9a:	00 00                	add    BYTE PTR [eax],al
  9c:	0c 01                	or     al,0x1
  9e:	01 49 13             	add    DWORD PTR [ecx+0x13],ecx
  a1:	01 13                	add    DWORD PTR [ebx],edx
  a3:	00 00                	add    BYTE PTR [eax],al
  a5:	0d 21 00 49 13       	or     eax,0x13490021
  aa:	2f                   	das    
  ab:	18 00                	sbb    BYTE PTR [eax],al
  ad:	00 0e                	add    BYTE PTR [esi],cl
  af:	34 00                	xor    al,0x0
  b1:	03 0e                	add    ecx,DWORD PTR [esi]
  b3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  b5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  b7:	49                   	dec    ecx
  b8:	13 3f                	adc    edi,DWORD PTR [edi]
  ba:	19 02                	sbb    DWORD PTR [edx],eax
  bc:	18 00                	sbb    BYTE PTR [eax],al
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
  12:	40                   	inc    eax
  13:	30 f9                	xor    cl,bh
  15:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	14 01                	adc    al,0x1
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
  21:	79 6f                	jns    92 <sysEnter_Vector-0x12ff6e>
  23:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
  2a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
  2d:	73 73                	jae    a2 <sysEnter_Vector-0x12ff5e>
  2f:	2f                   	das    
  30:	6c                   	ins    BYTE PTR es:[edi],dx
  31:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
  38:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
  3e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
  44:	78 2d                	js     73 <sysEnter_Vector-0x12ff8d>
  46:	67 6e                	outs   dx,BYTE PTR ds:[si]
  48:	75 2f                	jne    79 <sysEnter_Vector-0x12ff87>
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
  6f:	6d                   	ins    DWORD PTR es:[edi],dx
  70:	6d                   	ins    DWORD PTR es:[edi],dx
  71:	61                   	popa   
  72:	70 6d                	jo     e1 <sysEnter_Vector-0x12ff1f>
  74:	61                   	popa   
  75:	69 6e 2e 63 00 00 00 	imul   ebp,DWORD PTR [esi+0x2e],0x63
  7c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  7f:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
  86:	63 
  87:	2e                   	cs
  88:	68 00 01 00 00       	push   0x100
  8d:	6d                   	ins    DWORD PTR es:[edi],dx
  8e:	61                   	popa   
  8f:	6c                   	ins    BYTE PTR es:[edi],dx
  90:	6c                   	ins    BYTE PTR es:[edi],dx
  91:	6f                   	outs   dx,DWORD PTR ds:[esi]
  92:	63 2e                	arpl   WORD PTR [esi],bp
  94:	68 00 02 00 00       	push   0x200
  99:	66 69 6c 65 2e 68 00 	imul   bp,WORD PTR [ebp+eiz*2+0x2e],0x68
  a0:	02 00                	add    al,BYTE PTR [eax]
  a2:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
  a6:	43                   	inc    ebx
  a7:	68 72 69 73 4f       	push   0x4f736972
  ac:	53                   	push   ebx
  ad:	2e                   	cs
  ae:	68 00 02 00 00       	push   0x200
  b3:	00 00                	add    BYTE PTR [eax],al
  b5:	05 02 00 00 40       	add    eax,0x40000002
  ba:	30 03                	xor    BYTE PTR [ebx],al
  bc:	16                   	push   ss
  bd:	01 67 93             	add    DWORD PTR [edi-0x6d],esp
  c0:	67 00 02             	add    BYTE PTR [bp+si],al
  c3:	04 02                	add    al,0x2
  c5:	c4 00                	les    eax,FWORD PTR [eax]
  c7:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
  ca:	06                   	push   es
  cb:	4a                   	dec    edx
  cc:	06                   	push   es
  cd:	6c                   	ins    BYTE PTR es:[edi],dx
  ce:	3d 30 08 3c 4c       	cmp    eax,0x4c3c0830
  d3:	d7                   	xlat   BYTE PTR ds:[ebx]
  d4:	59                   	pop    ecx
  d5:	92                   	xchg   edx,eax
  d6:	08 68 02             	or     BYTE PTR [eax+0x2],ch
  d9:	38 13                	cmp    BYTE PTR [ebx],dl
  db:	02 38                	add    bh,BYTE PTR [eax]
  dd:	13 75 75             	adc    esi,DWORD PTR [ebp+0x75]
  e0:	75 92                	jne    74 <sysEnter_Vector-0x12ff8c>
  e2:	83 4b 68 08          	or     DWORD PTR [ebx+0x68],0x8
  e6:	14 00                	adc    al,0x0
  e8:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
  eb:	85 00                	test   DWORD PTR [eax],eax
  ed:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
  f0:	03 75 08             	add    esi,DWORD PTR [ebp+0x8]
  f3:	20 00                	and    BYTE PTR [eax],al
  f5:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
  f8:	06                   	push   es
  f9:	4a                   	dec    edx
  fa:	06                   	push   es
  fb:	03 0e                	add    ecx,DWORD PTR [esi]
  fd:	82                   	(bad)  
  fe:	08 2f                	or     BYTE PTR [edi],ch
 100:	f3 30 bc 08 91 08 13 	repz xor BYTE PTR [eax+ecx*1+0x8130891],bh
 107:	08 
 108:	bb 03 79 4a 03       	mov    ebx,0x34a7903
 10d:	09 82 f3 03 27 74    	or     DWORD PTR [edx+0x742703f3],eax
 113:	02 0a                	add    cl,BYTE PTR [edx]
 115:	00 01                	add    BYTE PTR [ecx],al
 117:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6c                   	ins    BYTE PTR es:[edi],dx
   1:	69 62 63 54 5a 00 66 	imul   esp,DWORD PTR [edx+0x63],0x66005a54
   8:	69 6c 65 73 54 6f 43 	imul   ebp,DWORD PTR [ebp+eiz*2+0x73],0x6c436f54
   f:	6c 
  10:	6f                   	outs   dx,DWORD PTR ds:[esi]
  11:	73 65                	jae    78 <sysEnter_Vector-0x12ff88>
  13:	43                   	inc    ebx
  14:	6f                   	outs   dx,DWORD PTR ds:[esi]
  15:	75 6e                	jne    85 <sysEnter_Vector-0x12ff7b>
  17:	74 00                	je     19 <sysEnter_Vector-0x12ffe7>
  19:	75 69                	jne    84 <sysEnter_Vector-0x12ff7c>
  1b:	6e                   	outs   dx,BYTE PTR ds:[esi]
  1c:	74 70                	je     8e <sysEnter_Vector-0x12ff72>
  1e:	74 72                	je     92 <sysEnter_Vector-0x12ff6e>
  20:	5f                   	pop    edi
  21:	74 00                	je     23 <sysEnter_Vector-0x12ffdd>
  23:	66 69 6c 65 73 54 6f 	imul   bp,WORD PTR [ebp+eiz*2+0x73],0x6f54
  2a:	43                   	inc    ebx
  2b:	6c                   	ins    BYTE PTR es:[edi],dx
  2c:	6f                   	outs   dx,DWORD PTR ds:[esi]
  2d:	73 65                	jae    94 <sysEnter_Vector-0x12ff6c>
  2f:	00 70 69             	add    BYTE PTR [eax+0x69],dh
  32:	64                   	fs
  33:	73 00                	jae    35 <sysEnter_Vector-0x12ffcb>
  35:	75 6e                	jne    a5 <sysEnter_Vector-0x12ff5b>
  37:	73 69                	jae    a2 <sysEnter_Vector-0x12ff5e>
  39:	67 6e                	outs   dx,BYTE PTR ds:[si]
  3b:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
  40:	61                   	popa   
  41:	72 00                	jb     43 <sysEnter_Vector-0x12ffbd>
  43:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
  46:	6c                   	ins    BYTE PTR es:[edi],dx
  47:	64                   	fs
  48:	4e                   	dec    esi
  49:	75 6d                	jne    b8 <sysEnter_Vector-0x12ff48>
  4b:	00 2f                	add    BYTE PTR [edi],ch
  4d:	68 6f 6d 65 2f       	push   0x2f656d6f
  52:	79 6f                	jns    c3 <sysEnter_Vector-0x12ff3d>
  54:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  5b:	6f                   	outs   dx,DWORD PTR ds:[esi]
  5c:	73 2f                	jae    8d <sysEnter_Vector-0x12ff73>
  5e:	61                   	popa   
  5f:	70 72                	jo     d3 <sysEnter_Vector-0x12ff2d>
  61:	6f                   	outs   dx,DWORD PTR ds:[esi]
  62:	6a 2f                	push   0x2f
  64:	74 65                	je     cb <sysEnter_Vector-0x12ff35>
  66:	73 74                	jae    dc <sysEnter_Vector-0x12ff24>
  68:	4d                   	dec    ebp
  69:	4d                   	dec    ebp
  6a:	61                   	popa   
  6b:	70 00                	jo     6d <sysEnter_Vector-0x12ff93>
  6d:	73 68                	jae    d7 <sysEnter_Vector-0x12ff29>
  6f:	6f                   	outs   dx,DWORD PTR ds:[esi]
  70:	72 74                	jb     e6 <sysEnter_Vector-0x12ff1a>
  72:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
  75:	73 69                	jae    e0 <sysEnter_Vector-0x12ff20>
  77:	67 6e                	outs   dx,BYTE PTR ds:[si]
  79:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  7e:	74 00                	je     80 <sysEnter_Vector-0x12ff80>
  80:	70 72                	jo     f4 <sysEnter_Vector-0x12ff0c>
  82:	6f                   	outs   dx,DWORD PTR ds:[esi]
  83:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
  86:	73 45                	jae    cd <sysEnter_Vector-0x12ff33>
  88:	6e                   	outs   dx,BYTE PTR ds:[esi]
  89:	76 70                	jbe    fb <sysEnter_Vector-0x12ff05>
  8b:	00 64 6f 75          	add    BYTE PTR [edi+ebp*2+0x75],ah
  8f:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
  93:	70 69                	jo     fe <sysEnter_Vector-0x12ff02>
  95:	64                   	fs
  96:	73 50                	jae    e8 <sysEnter_Vector-0x12ff18>
  98:	00 68 65             	add    BYTE PTR [eax+0x65],ch
  9b:	61                   	popa   
  9c:	70 45                	jo     e3 <sysEnter_Vector-0x12ff1d>
  9e:	6e                   	outs   dx,BYTE PTR ds:[esi]
  9f:	64 00 6d 61          	add    BYTE PTR fs:[ebp+0x61],ch
  a3:	69 6e 00 68 65 61 70 	imul   ebp,DWORD PTR [esi+0x0],0x70616568
  aa:	43                   	inc    ebx
  ab:	75 72                	jne    11f <sysEnter_Vector-0x12fee1>
  ad:	72 00                	jb     af <sysEnter_Vector-0x12ff51>
  af:	74 68                	je     119 <sysEnter_Vector-0x12fee7>
  b1:	65                   	gs
  b2:	50                   	push   eax
  b3:	69 64 00 6d 6d 61 70 	imul   esp,DWORD PTR [eax+eax*1+0x6d],0x6d70616d
  ba:	6d 
  bb:	61                   	popa   
  bc:	69 6e 2e 63 00 6c 6f 	imul   ebp,DWORD PTR [esi+0x2e],0x6f6c0063
  c3:	6e                   	outs   dx,BYTE PTR ds:[esi]
  c4:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  c8:	6e                   	outs   dx,BYTE PTR ds:[esi]
  c9:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
  cd:	73 69                	jae    138 <sysEnter_Vector-0x12fec8>
  cf:	67 6e                	outs   dx,BYTE PTR ds:[si]
  d1:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  d6:	74 00                	je     d8 <sysEnter_Vector-0x12ff28>
  d8:	70 69                	jo     143 <sysEnter_Vector-0x12febd>
  da:	64                   	fs
  db:	43                   	inc    ebx
  dc:	6f                   	outs   dx,DWORD PTR ds:[esi]
  dd:	75 6e                	jne    14d <sysEnter_Vector-0x12feb3>
  df:	74 00                	je     e1 <sysEnter_Vector-0x12ff1f>
  e1:	72 65                	jb     148 <sysEnter_Vector-0x12feb8>
  e3:	74 73                	je     158 <sysEnter_Vector-0x12fea8>
  e5:	00 64 6f 43          	add    BYTE PTR [edi+ebp*2+0x43],ah
  e9:	68 69 6c 64 00       	push   0x646c69
  ee:	73 68                	jae    158 <sysEnter_Vector-0x12fea8>
  f0:	61                   	popa   
  f1:	72 65                	jb     158 <sysEnter_Vector-0x12fea8>
  f3:	64                   	fs
  f4:	43                   	inc    ebx
  f5:	6f                   	outs   dx,DWORD PTR ds:[esi]
  f6:	75 6e                	jne    166 <sysEnter_Vector-0x12fe9a>
  f8:	74 65                	je     15f <sysEnter_Vector-0x12fea1>
  fa:	72 00                	jb     fc <sysEnter_Vector-0x12ff04>
  fc:	47                   	inc    edi
  fd:	4e                   	dec    esi
  fe:	55                   	push   ebp
  ff:	20 43 39             	and    BYTE PTR [ebx+0x39],al
 102:	39 20                	cmp    DWORD PTR [eax],esp
 104:	35 2e 33 2e 30       	xor    eax,0x302e332e
 109:	20 2d 6d 33 32 20    	and    BYTE PTR ds:0x2032336d,ch
 10f:	2d 6d 61 73 6d       	sub    eax,0x6d73616d
 114:	3d 69 6e 74 65       	cmp    eax,0x65746e69
 119:	6c                   	ins    BYTE PTR es:[edi],dx
 11a:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
 120:	65                   	gs
 121:	3d 67 65 6e 65       	cmp    eax,0x656e6567
 126:	72 69                	jb     191 <sysEnter_Vector-0x12fe6f>
 128:	63 20                	arpl   WORD PTR [eax],sp
 12a:	2d 6d 61 72 63       	sub    eax,0x6372616d
 12f:	68 3d 70 65 6e       	push   0x6e65703d
 134:	74 69                	je     19f <sysEnter_Vector-0x12fe61>
 136:	75 6d                	jne    1a5 <sysEnter_Vector-0x12fe5b>
 138:	70 72                	jo     1ac <sysEnter_Vector-0x12fe54>
 13a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 13b:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
 141:	74 64                	je     1a7 <sysEnter_Vector-0x12fe59>
 143:	3d 63 39 39 20       	cmp    eax,0x20393963
 148:	2d 66 66 72 65       	sub    eax,0x65726666
 14d:	65                   	gs
 14e:	73 74                	jae    1c4 <sysEnter_Vector-0x12fe3c>
 150:	61                   	popa   
 151:	6e                   	outs   dx,BYTE PTR ds:[esi]
 152:	64 69 6e 67 00 73 69 	imul   ebp,DWORD PTR fs:[esi+0x67],0x7a697300
 159:	7a 
 15a:	65                   	gs
 15b:	74 79                	je     1d6 <sysEnter_Vector-0x12fe2a>
 15d:	70 65                	jo     1c4 <sysEnter_Vector-0x12fe3c>
 15f:	00 6c 6f 6e          	add    BYTE PTR [edi+ebp*2+0x6e],ch
 163:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 167:	6e                   	outs   dx,BYTE PTR ds:[esi]
 168:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 16c:	74 00                	je     16e <sysEnter_Vector-0x12fe92>
 16e:	70 69                	jo     1d9 <sysEnter_Vector-0x12fe27>
 170:	64 32 00             	xor    al,BYTE PTR fs:[eax]
 173:	73 68                	jae    1dd <sysEnter_Vector-0x12fe23>
 175:	6f                   	outs   dx,DWORD PTR ds:[esi]
 176:	72 74                	jb     1ec <sysEnter_Vector-0x12fe14>
 178:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 17b:	74 00                	je     17d <sysEnter_Vector-0x12fe83>
 17d:	68 65 61 70 42       	push   0x42706165
 182:	61                   	popa   
 183:	73 65                	jae    1ea <sysEnter_Vector-0x12fe16>
 185:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 188:	67 76 00             	addr16 jbe 18b <sysEnter_Vector-0x12fe75>
 18b:	75 69                	jne    1f6 <sysEnter_Vector-0x12fe0a>
 18d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 18e:	74 33                	je     1c3 <sysEnter_Vector-0x12fe3d>
 190:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 193:	00 5f 42             	add    BYTE PTR [edi+0x42],bl
 196:	6f                   	outs   dx,DWORD PTR ds:[esi]
 197:	6f                   	outs   dx,DWORD PTR ds:[esi]
 198:	6c                   	ins    BYTE PTR es:[edi],dx
 199:	00 70 69             	add    BYTE PTR [eax+0x69],dh
 19c:	64                   	fs
 19d:	73 54                	jae    1f3 <sysEnter_Vector-0x12fe0d>
 19f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1a0:	53                   	push   ebx
 1a1:	70 61                	jo     204 <sysEnter_Vector-0x12fdfc>
 1a3:	77 6e                	ja     213 <sysEnter_Vector-0x12fded>
 1a5:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 1a8:	67 63 00             	arpl   WORD PTR [bx+si],ax
 1ab:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
 1ae:	6c                   	ins    BYTE PTR es:[edi],dx
 1af:	64                   	fs
 1b0:	4e                   	dec    esi
 1b1:	6f                   	outs   dx,DWORD PTR ds:[esi]
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
