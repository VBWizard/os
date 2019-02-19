
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
        for (int sharedCounter=4;sharedCounter>=0;sharedCounter--)
30400006:	c7 45 f4 04 00 00 00 	mov    DWORD PTR [ebp-0xc],0x4
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
3040001a:	e8 e1 01 00 00       	call   30400200 <main+0x1cf>
3040001f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:24 (discriminator 2)

int sharedCounter = 10;

int doChild(int childNum)
{
        for (int sharedCounter=4;sharedCounter>=0;sharedCounter--)
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
30400071:	e8 aa 01 00 00       	call   30400220 <main+0x1ef>
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
3040010a:	e8 01 01 00 00       	call   30400210 <main+0x1df>
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
30400130:	e9 8a 00 00 00       	jmp    304001bf <main+0x18e>
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
30400159:	68 30 02 40 30       	push   0x30400230
3040015e:	e8 8d 00 00 00       	call   304001f0 <main+0x1bf>
30400163:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:61
    printf("Waiting for all children to quit\n");
30400166:	83 ec 0c             	sub    esp,0xc
30400169:	68 48 02 40 30       	push   0x30400248
3040016e:	e8 7d 00 00 00       	call   304001f0 <main+0x1bf>
30400173:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:62
    while (pidCount<pidsToSpawn)
30400176:	eb 2a                	jmp    304001a2 <main+0x171>
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
3040018b:	e8 50 00 00 00       	call   304001e0 <main+0x1af>
30400190:	83 c4 10             	add    esp,0x10
30400193:	89 c1                	mov    ecx,eax
30400195:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
30400198:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
3040019b:	89 0c 90             	mov    DWORD PTR [eax+edx*4],ecx
/home/yogi/src/os/aproj/testMMap/mmapmain.c:67
        pidCount++;
3040019e:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/testMMap/mmapmain.c:62
            pids[pidsP++]=pid;
        //print("Started PID %u\n",pid);
    }
    printf("%u children spawned\n",pidsToSpawn);
    printf("Waiting for all children to quit\n");
    while (pidCount<pidsToSpawn)
304001a2:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
304001a5:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
304001a8:	7c ce                	jl     30400178 <main+0x147>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:69
        int thePid = pids[pidCount];
        //print("Waiting for child %u (0x%04X)\n",pidCount+1, thePid);
        rets[pidCount]=waitpid(thePid);
        pidCount++;
    }
    printf("All children ended\n");
304001aa:	83 ec 0c             	sub    esp,0xc
304001ad:	68 6a 02 40 30       	push   0x3040026a
304001b2:	e8 39 00 00 00       	call   304001f0 <main+0x1bf>
304001b7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:70
    return 0;
304001ba:	b8 00 00 00 00       	mov    eax,0x0
304001bf:	89 dc                	mov    esp,ebx
/home/yogi/src/os/aproj/testMMap/mmapmain.c:109
    print("waiting for child 1 (PID=0x%04X)\n", pid);
    uint32_t pid0Return = waitpid(pid);
    print("PID 1 returned %u\n",pid0Return);
    return (0);
*/
}
304001c1:	8d 65 f8             	lea    esp,[ebp-0x8]
304001c4:	59                   	pop    ecx
304001c5:	5b                   	pop    ebx
304001c6:	5d                   	pop    ebp
304001c7:	8d 61 fc             	lea    esp,[ecx-0x4]
304001ca:	c3                   	ret    

Disassembly of section .plt:

304001d0 <.plt>:
304001d0:	ff 35 1c 05 40 30    	push   DWORD PTR ds:0x3040051c
304001d6:	ff 25 20 05 40 30    	jmp    DWORD PTR ds:0x30400520
304001dc:	00 00                	add    BYTE PTR [eax],al
304001de:	00 00                	add    BYTE PTR [eax],al
304001e0:	ff 25 24 05 40 30    	jmp    DWORD PTR ds:0x30400524
304001e6:	68 00 00 00 00       	push   0x0
304001eb:	e9 e0 ff ff ff       	jmp    304001d0 <main+0x19f>
304001f0:	ff 25 28 05 40 30    	jmp    DWORD PTR ds:0x30400528
304001f6:	68 08 00 00 00       	push   0x8
304001fb:	e9 d0 ff ff ff       	jmp    304001d0 <main+0x19f>
30400200:	ff 25 2c 05 40 30    	jmp    DWORD PTR ds:0x3040052c
30400206:	68 10 00 00 00       	push   0x10
3040020b:	e9 c0 ff ff ff       	jmp    304001d0 <main+0x19f>
30400210:	ff 25 30 05 40 30    	jmp    DWORD PTR ds:0x30400530
30400216:	68 18 00 00 00       	push   0x18
3040021b:	e9 b0 ff ff ff       	jmp    304001d0 <main+0x19f>
30400220:	ff 25 34 05 40 30    	jmp    DWORD PTR ds:0x30400534
30400226:	68 20 00 00 00       	push   0x20
3040022b:	e9 a0 ff ff ff       	jmp    304001d0 <main+0x19f>

Disassembly of section .rodata:

30400230 <.rodata>:
30400230:	25 75 20 63 68       	and    eax,0x68632075
30400235:	69 6c 64 72 65 6e 20 	imul   ebp,DWORD PTR [esp+eiz*2+0x72],0x73206e65
3040023c:	73 
3040023d:	70 61                	jo     304002a0 <main+0x26f>
3040023f:	77 6e                	ja     304002af <main+0x27e>
30400241:	65 64 0a 00          	gs or  al,BYTE PTR fs:gs:[eax]
30400245:	00 00                	add    BYTE PTR [eax],al
30400247:	00 57 61             	add    BYTE PTR [edi+0x61],dl
3040024a:	69 74 69 6e 67 20 66 	imul   esi,DWORD PTR [ecx+ebp*2+0x6e],0x6f662067
30400251:	6f 
30400252:	72 20                	jb     30400274 <main+0x243>
30400254:	61                   	popa   
30400255:	6c                   	ins    BYTE PTR es:[edi],dx
30400256:	6c                   	ins    BYTE PTR es:[edi],dx
30400257:	20 63 68             	and    BYTE PTR [ebx+0x68],ah
3040025a:	69 6c 64 72 65 6e 20 	imul   ebp,DWORD PTR [esp+eiz*2+0x72],0x74206e65
30400261:	74 
30400262:	6f                   	outs   dx,DWORD PTR ds:[esi]
30400263:	20 71 75             	and    BYTE PTR [ecx+0x75],dh
30400266:	69 74 0a 00 41 6c 6c 	imul   esi,DWORD PTR [edx+ecx*1+0x0],0x206c6c41
3040026d:	20 
3040026e:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
30400271:	6c                   	ins    BYTE PTR es:[edi],dx
30400272:	64                   	fs
30400273:	72 65                	jb     304002da <main+0x2a9>
30400275:	6e                   	outs   dx,BYTE PTR ds:[esi]
30400276:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
30400279:	64 65 64 0a 00       	fs gs or al,BYTE PTR fs:gs:[eax]

Disassembly of section .eh_frame:

30400280 <.eh_frame>:
30400280:	14 00                	adc    al,0x0
30400282:	00 00                	add    BYTE PTR [eax],al
30400284:	00 00                	add    BYTE PTR [eax],al
30400286:	00 00                	add    BYTE PTR [eax],al
30400288:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
3040028b:	00 01                	add    BYTE PTR [ecx],al
3040028d:	7c 08                	jl     30400297 <main+0x266>
3040028f:	01 1b                	add    DWORD PTR [ebx],ebx
30400291:	0c 04                	or     al,0x4
30400293:	04 88                	add    al,0x88
30400295:	01 00                	add    DWORD PTR [eax],eax
30400297:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3040029a:	00 00                	add    BYTE PTR [eax],al
3040029c:	1c 00                	sbb    al,0x0
3040029e:	00 00                	add    BYTE PTR [eax],al
304002a0:	60                   	pusha  
304002a1:	fd                   	std    
304002a2:	ff                   	(bad)  
304002a3:	ff 31                	push   DWORD PTR [ecx]
304002a5:	00 00                	add    BYTE PTR [eax],al
304002a7:	00 00                	add    BYTE PTR [eax],al
304002a9:	41                   	inc    ecx
304002aa:	0e                   	push   cs
304002ab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
304002b1:	6d                   	ins    DWORD PTR es:[edi],dx
304002b2:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
304002b5:	04 00                	add    al,0x0
304002b7:	00 34 00             	add    BYTE PTR [eax+eax*1],dh
304002ba:	00 00                	add    BYTE PTR [eax],al
304002bc:	3c 00                	cmp    al,0x0
304002be:	00 00                	add    BYTE PTR [eax],al
304002c0:	71 fd                	jno    304002bf <main+0x28e>
304002c2:	ff                   	(bad)  
304002c3:	ff 9a 01 00 00 00    	call   FWORD PTR [edx+0x1]
304002c9:	44                   	inc    esp
304002ca:	0c 01                	or     al,0x1
304002cc:	00 47 10             	add    BYTE PTR [edi+0x10],al
304002cf:	05 02 75 00 44       	add    eax,0x44007502
304002d4:	0f 03 75 78          	lsl    esi,WORD PTR [ebp+0x78]
304002d8:	06                   	push   es
304002d9:	10 03                	adc    BYTE PTR [ebx],al
304002db:	02 75 7c             	add    dh,BYTE PTR [ebp+0x7c]
304002de:	03 85 01 c1 0c 01    	add    eax,DWORD PTR [ebp+0x10cc101]
304002e4:	00 41 c3             	add    BYTE PTR [ecx-0x3d],al
304002e7:	41                   	inc    ecx
304002e8:	c5 43 0c             	lds    eax,FWORD PTR [ebx+0xc]
304002eb:	04 04                	add    al,0x4
304002ed:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .interp:

304002f0 <.interp>:
304002f0:	2f                   	das    
304002f1:	6c                   	ins    BYTE PTR es:[edi],dx
304002f2:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
304002f9:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
30400300:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

30400304 <.dynsym>:
	...
30400314:	09 00                	or     DWORD PTR [eax],eax
	...
3040031e:	00 00                	add    BYTE PTR [eax],al
30400320:	12 00                	adc    al,BYTE PTR [eax]
30400322:	00 00                	add    BYTE PTR [eax],al
30400324:	11 00                	adc    DWORD PTR [eax],eax
	...
3040032e:	00 00                	add    BYTE PTR [eax],al
30400330:	12 00                	adc    al,BYTE PTR [eax]
30400332:	00 00                	add    BYTE PTR [eax],al
30400334:	18 00                	sbb    BYTE PTR [eax],al
	...
3040033e:	00 00                	add    BYTE PTR [eax],al
30400340:	12 00                	adc    al,BYTE PTR [eax]
30400342:	00 00                	add    BYTE PTR [eax],al
30400344:	1e                   	push   ds
	...
3040034d:	00 00                	add    BYTE PTR [eax],al
3040034f:	00 12                	add    BYTE PTR [edx],dl
30400351:	00 00                	add    BYTE PTR [eax],al
30400353:	00 28                	add    BYTE PTR [eax],ch
30400355:	00 00                	add    BYTE PTR [eax],al
30400357:	00 00                	add    BYTE PTR [eax],al
30400359:	00 13                	add    BYTE PTR [ebx],dl
3040035b:	00 00                	add    BYTE PTR [eax],al
3040035d:	00 00                	add    BYTE PTR [eax],al
3040035f:	00 10                	add    BYTE PTR [eax],dl
30400361:	00 01                	add    BYTE PTR [ecx],al
30400363:	00 23                	add    BYTE PTR [ebx],ah
	...
3040036d:	00 00                	add    BYTE PTR [eax],al
3040036f:	00 12                	add    BYTE PTR [edx],dl
30400371:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

30400374 <.dynstr>:
30400374:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
30400378:	63 2e                	arpl   WORD PTR [esi],bp
3040037a:	73 6f                	jae    304003eb <main+0x3ba>
3040037c:	00 77 61             	add    BYTE PTR [edi+0x61],dh
3040037f:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
30400386:	72 
30400387:	69 6e 74 66 00 73 6c 	imul   ebp,DWORD PTR [esi+0x74],0x6c730066
3040038e:	65                   	gs
3040038f:	65                   	gs
30400390:	70 00                	jo     30400392 <main+0x361>
30400392:	66 6f                	outs   dx,WORD PTR ds:[esi]
30400394:	72 6b                	jb     30400401 <main+0x3d0>
30400396:	00 61 74             	add    BYTE PTR [ecx+0x74],ah
30400399:	6f                   	outs   dx,DWORD PTR ds:[esi]
3040039a:	69 00 73 79 73 45    	imul   eax,DWORD PTR [eax],0x45737973
304003a0:	6e                   	outs   dx,BYTE PTR ds:[esi]
304003a1:	74 65                	je     30400408 <main+0x3d7>
304003a3:	72 5f                	jb     30400404 <main+0x3d3>
304003a5:	56                   	push   esi
304003a6:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
304003ab:	00 2e                	add    BYTE PTR [esi],ch
304003ad:	2e                   	cs
304003ae:	2f                   	das    
304003af:	6c                   	ins    BYTE PTR es:[edi],dx
304003b0:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
304003b7:	4f                   	dec    edi
304003b8:	53                   	push   ebx
304003b9:	2f                   	das    
304003ba:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
304003c1:	62 
304003c2:	75 67                	jne    3040042b <main+0x3fa>
304003c4:	2f                   	das    
304003c5:	47                   	inc    edi
304003c6:	4e                   	dec    esi
304003c7:	55                   	push   ebp
304003c8:	2d 4c 69 6e 75       	sub    eax,0x756e694c
304003cd:	78 00                	js     304003cf <main+0x39e>

Disassembly of section .hash:

304003d0 <.hash>:
304003d0:	03 00                	add    eax,DWORD PTR [eax]
304003d2:	00 00                	add    BYTE PTR [eax],al
304003d4:	07                   	pop    es
304003d5:	00 00                	add    BYTE PTR [eax],al
304003d7:	00 06                	add    BYTE PTR [esi],al
304003d9:	00 00                	add    BYTE PTR [eax],al
304003db:	00 00                	add    BYTE PTR [eax],al
304003dd:	00 00                	add    BYTE PTR [eax],al
304003df:	00 04 00             	add    BYTE PTR [eax+eax*1],al
	...
304003ea:	00 00                	add    BYTE PTR [eax],al
304003ec:	01 00                	add    DWORD PTR [eax],eax
304003ee:	00 00                	add    BYTE PTR [eax],al
304003f0:	00 00                	add    BYTE PTR [eax],al
304003f2:	00 00                	add    BYTE PTR [eax],al
304003f4:	02 00                	add    al,BYTE PTR [eax]
304003f6:	00 00                	add    BYTE PTR [eax],al
304003f8:	03 00                	add    eax,DWORD PTR [eax]
304003fa:	00 00                	add    BYTE PTR [eax],al
304003fc:	05                   	.byte 0x5
304003fd:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

30400400 <.eh_frame>:
30400400:	14 00                	adc    al,0x0
30400402:	00 00                	add    BYTE PTR [eax],al
30400404:	00 00                	add    BYTE PTR [eax],al
30400406:	00 00                	add    BYTE PTR [eax],al
30400408:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
3040040b:	00 01                	add    BYTE PTR [ecx],al
3040040d:	7c 08                	jl     30400417 <main+0x3e6>
3040040f:	01 1b                	add    DWORD PTR [ebx],ebx
30400411:	0c 04                	or     al,0x4
30400413:	04 88                	add    al,0x88
30400415:	01 00                	add    DWORD PTR [eax],eax
30400417:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
3040041a:	00 00                	add    BYTE PTR [eax],al
3040041c:	1c 00                	sbb    al,0x0
3040041e:	00 00                	add    BYTE PTR [eax],al
30400420:	b0 fd                	mov    al,0xfd
30400422:	ff                   	(bad)  
30400423:	ff 60 00             	jmp    DWORD PTR [eax+0x0]
30400426:	00 00                	add    BYTE PTR [eax],al
30400428:	00 0e                	add    BYTE PTR [esi],cl
3040042a:	08 46 0e             	or     BYTE PTR [esi+0xe],al
3040042d:	0c 4a                	or     al,0x4a
3040042f:	0f 0b                	ud2    
30400431:	74 04                	je     30400437 <main+0x406>
30400433:	78 00                	js     30400435 <main+0x404>
30400435:	3f                   	aas    
30400436:	1a 3b                	sbb    bh,BYTE PTR [ebx]
30400438:	2a 32                	sub    dh,BYTE PTR [edx]
3040043a:	24 22                	and    al,0x22
3040043c:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

30400440 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
30400440:	01 1b                	add    DWORD PTR [ebx],ebx
30400442:	03 3b                	add    edi,DWORD PTR [ebx]
30400444:	3c fe                	cmp    al,0xfe
30400446:	ff                   	(bad)  
30400447:	ff 02                	inc    DWORD PTR [edx]
30400449:	00 00                	add    BYTE PTR [eax],al
3040044b:	00 c0                	add    al,al
3040044d:	fb                   	sti    
3040044e:	ff                   	(bad)  
3040044f:	ff 58 fe             	call   FWORD PTR [eax-0x2]
30400452:	ff                   	(bad)  
30400453:	ff f1                	push   ecx
30400455:	fb                   	sti    
30400456:	ff                   	(bad)  
30400457:	ff                   	(bad)  
30400458:	78 fe                	js     30400458 <__GNU_EH_FRAME_HDR+0x18>
3040045a:	ff                   	(bad)  
3040045b:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

3040045c <.rel.dyn>:
3040045c:	24 05                	and    al,0x5
3040045e:	40                   	inc    eax
3040045f:	30 07                	xor    BYTE PTR [edi],al
30400461:	01 00                	add    DWORD PTR [eax],eax
30400463:	00 28                	add    BYTE PTR [eax],ch
30400465:	05 40 30 07 02       	add    eax,0x2073040
3040046a:	00 00                	add    BYTE PTR [eax],al
3040046c:	2c 05                	sub    al,0x5
3040046e:	40                   	inc    eax
3040046f:	30 07                	xor    BYTE PTR [edi],al
30400471:	03 00                	add    eax,DWORD PTR [eax]
30400473:	00 30                	add    BYTE PTR [eax],dh
30400475:	05 40 30 07 04       	add    eax,0x4073040
3040047a:	00 00                	add    BYTE PTR [eax],al
3040047c:	34 05                	xor    al,0x5
3040047e:	40                   	inc    eax
3040047f:	30 07                	xor    BYTE PTR [edi],al
30400481:	06                   	push   es
	...

Disassembly of section .data:

30400484 <sharedCounter>:
30400484:	0a 00                	or     al,BYTE PTR [eax]
	...

Disassembly of section .dynamic:

30400488 <_DYNAMIC>:
30400488:	01 00                	add    DWORD PTR [eax],eax
3040048a:	00 00                	add    BYTE PTR [eax],al
3040048c:	01 00                	add    DWORD PTR [eax],eax
3040048e:	00 00                	add    BYTE PTR [eax],al
30400490:	0f 00 00             	sldt   WORD PTR [eax]
30400493:	00 38                	add    BYTE PTR [eax],bh
30400495:	00 00                	add    BYTE PTR [eax],al
30400497:	00 04 00             	add    BYTE PTR [eax+eax*1],al
3040049a:	00 00                	add    BYTE PTR [eax],al
3040049c:	d0 03                	rol    BYTE PTR [ebx],1
3040049e:	40                   	inc    eax
3040049f:	30 05 00 00 00 74    	xor    BYTE PTR ds:0x74000000,al
304004a5:	03 40 30             	add    eax,DWORD PTR [eax+0x30]
304004a8:	06                   	push   es
304004a9:	00 00                	add    BYTE PTR [eax],al
304004ab:	00 04 03             	add    BYTE PTR [ebx+eax*1],al
304004ae:	40                   	inc    eax
304004af:	30 0a                	xor    BYTE PTR [edx],cl
304004b1:	00 00                	add    BYTE PTR [eax],al
304004b3:	00 5b 00             	add    BYTE PTR [ebx+0x0],bl
304004b6:	00 00                	add    BYTE PTR [eax],al
304004b8:	0b 00                	or     eax,DWORD PTR [eax]
304004ba:	00 00                	add    BYTE PTR [eax],al
304004bc:	10 00                	adc    BYTE PTR [eax],al
304004be:	00 00                	add    BYTE PTR [eax],al
304004c0:	15 00 00 00 00       	adc    eax,0x0
304004c5:	00 00                	add    BYTE PTR [eax],al
304004c7:	00 03                	add    BYTE PTR [ebx],al
304004c9:	00 00                	add    BYTE PTR [eax],al
304004cb:	00 18                	add    BYTE PTR [eax],bl
304004cd:	05 40 30 02 00       	add    eax,0x23040
304004d2:	00 00                	add    BYTE PTR [eax],al
304004d4:	28 00                	sub    BYTE PTR [eax],al
304004d6:	00 00                	add    BYTE PTR [eax],al
304004d8:	14 00                	adc    al,0x0
304004da:	00 00                	add    BYTE PTR [eax],al
304004dc:	11 00                	adc    DWORD PTR [eax],eax
304004de:	00 00                	add    BYTE PTR [eax],al
304004e0:	17                   	pop    ss
304004e1:	00 00                	add    BYTE PTR [eax],al
304004e3:	00 5c 04 40          	add    BYTE PTR [esp+eax*1+0x40],bl
304004e7:	30 00                	xor    BYTE PTR [eax],al
	...

Disassembly of section .got.plt:

30400518 <_GLOBAL_OFFSET_TABLE_>:
30400518:	88 04 40             	mov    BYTE PTR [eax+eax*2],al
3040051b:	30 00                	xor    BYTE PTR [eax],al
3040051d:	00 00                	add    BYTE PTR [eax],al
3040051f:	00 00                	add    BYTE PTR [eax],al
30400521:	00 00                	add    BYTE PTR [eax],al
30400523:	00 e6                	add    dh,ah
30400525:	01 40 30             	add    DWORD PTR [eax+0x30],eax
30400528:	f6 01 40             	test   BYTE PTR [ecx],0x40
3040052b:	30 06                	xor    BYTE PTR [esi],al
3040052d:	02 40 30             	add    al,BYTE PTR [eax+0x30]
30400530:	16                   	push   ss
30400531:	02 40 30             	add    al,BYTE PTR [eax+0x30]
30400534:	26 02 40 30          	add    al,BYTE PTR es:[eax+0x30]

Disassembly of section .bss:

30400538 <filesToCloseCount>:
30400538:	00 00                	add    BYTE PTR [eax],al
	...

3040053c <filesToClose>:
3040053c:	00 00                	add    BYTE PTR [eax],al
	...

30400540 <heapEnd>:
30400540:	00 00                	add    BYTE PTR [eax],al
	...

30400544 <heapBase>:
30400544:	00 00                	add    BYTE PTR [eax],al
	...

30400548 <heapCurr>:
30400548:	00 00                	add    BYTE PTR [eax],al
	...

3040054c <processEnvp>:
3040054c:	00 00                	add    BYTE PTR [eax],al
	...

30400550 <libcTZ>:
30400550:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	7f 02                	jg     4 <sysEnter_Vector-0x12fffc>
   2:	00 00                	add    BYTE PTR [eax],al
   4:	04 00                	add    al,0x0
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	7e 00                	jle    e <sysEnter_Vector-0x12fff2>
   e:	00 00                	add    BYTE PTR [eax],al
  10:	0c fa                	or     al,0xfa
	...
  1a:	00 40 30             	add    BYTE PTR [eax+0x30],al
  1d:	cb                   	retf   
  1e:	01 00                	add    DWORD PTR [eax],eax
  20:	00 00                	add    BYTE PTR [eax],al
  22:	00 00                	add    BYTE PTR [eax],al
  24:	00 02                	add    BYTE PTR [edx],al
  26:	01 06                	add    DWORD PTR [esi],eax
  28:	0e                   	push   cs
  29:	01 00                	add    DWORD PTR [eax],eax
  2b:	00 02                	add    BYTE PTR [edx],al
  2d:	01 06                	add    DWORD PTR [esi],eax
  2f:	07                   	pop    es
  30:	01 00                	add    DWORD PTR [eax],eax
  32:	00 02                	add    BYTE PTR [edx],al
  34:	02 05 45 00 00 00    	add    al,BYTE PTR ds:0x45
  3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  41:	02 08                	add    cl,BYTE PTR [eax]
  43:	05 70 00 00 00       	add    eax,0x70
  48:	02 01                	add    al,BYTE PTR [ecx]
  4a:	08 05 01 00 00 02    	or     BYTE PTR ds:0x2000001,al
  50:	02 07                	add    al,BYTE PTR [edi]
  52:	49                   	dec    ecx
  53:	01 00                	add    DWORD PTR [eax],eax
  55:	00 04 2f             	add    BYTE PTR [edi+ebp*1],al
  58:	01 00                	add    DWORD PTR [eax],eax
  5a:	00 02                	add    BYTE PTR [edx],al
  5c:	34 61                	xor    al,0x61
  5e:	00 00                	add    BYTE PTR [eax],al
  60:	00 02                	add    BYTE PTR [edx],al
  62:	04 07                	add    al,0x7
  64:	22 01                	and    al,BYTE PTR [ecx]
  66:	00 00                	add    BYTE PTR [eax],al
  68:	02 08                	add    cl,BYTE PTR [eax]
  6a:	07                   	pop    es
  6b:	18 01                	sbb    BYTE PTR [ecx],al
  6d:	00 00                	add    BYTE PTR [eax],al
  6f:	04 66                	add    al,0x66
  71:	00 00                	add    BYTE PTR [eax],al
  73:	00 02                	add    BYTE PTR [edx],al
  75:	56                   	push   esi
  76:	61                   	popa   
  77:	00 00                	add    BYTE PTR [eax],al
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	04 05                	add    al,0x5
  7d:	75 00                	jne    7f <sysEnter_Vector-0x12ff81>
  7f:	00 00                	add    BYTE PTR [eax],al
  81:	02 01                	add    al,BYTE PTR [ecx]
  83:	02 5c 01 00          	add    bl,BYTE PTR [ecx+eax*1+0x0]
  87:	00 02                	add    BYTE PTR [edx],al
  89:	04 07                	add    al,0x7
  8b:	4f                   	dec    edi
  8c:	00 00                	add    BYTE PTR [eax],al
  8e:	00 05 29 00 00 00    	add    BYTE PTR ds:0x29,al
  94:	01 16                	add    DWORD PTR [esi],edx
  96:	3a 00                	cmp    al,BYTE PTR [eax]
  98:	00 00                	add    BYTE PTR [eax],al
  9a:	00 00                	add    BYTE PTR [eax],al
  9c:	40                   	inc    eax
  9d:	30 31                	xor    BYTE PTR [ecx],dh
  9f:	00 00                	add    BYTE PTR [eax],al
  a1:	00 01                	add    BYTE PTR [ecx],al
  a3:	9c                   	pushf  
  a4:	cf                   	iret   
  a5:	00 00                	add    BYTE PTR [eax],al
  a7:	00 06                	add    BYTE PTR [esi],al
  a9:	7d 01                	jge    ac <sysEnter_Vector-0x12ff54>
  ab:	00 00                	add    BYTE PTR [eax],al
  ad:	01 16                	add    DWORD PTR [esi],edx
  af:	3a 00                	cmp    al,BYTE PTR [eax]
  b1:	00 00                	add    BYTE PTR [eax],al
  b3:	02 91 00 07 06 00    	add    dl,BYTE PTR [ecx+0x60700]
  b9:	40                   	inc    eax
  ba:	30 26                	xor    BYTE PTR [esi],ah
  bc:	00 00                	add    BYTE PTR [eax],al
  be:	00 08                	add    BYTE PTR [eax],cl
  c0:	e2 00                	loop   c2 <sysEnter_Vector-0x12ff3e>
  c2:	00 00                	add    BYTE PTR [eax],al
  c4:	01 18                	add    DWORD PTR [eax],ebx
  c6:	3a 00                	cmp    al,BYTE PTR [eax]
  c8:	00 00                	add    BYTE PTR [eax],al
  ca:	02 91 6c 00 00 05    	add    dl,BYTE PTR [ecx+0x500006c]
  d0:	61                   	popa   
  d1:	00 00                	add    BYTE PTR [eax],al
  d3:	00 01                	add    BYTE PTR [ecx],al
  d5:	21 3a                	and    DWORD PTR [edx],edi
  d7:	00 00                	add    BYTE PTR [eax],al
  d9:	00 31                	add    BYTE PTR [ecx],dh
  db:	00 40 30             	add    BYTE PTR [eax+0x30],al
  de:	9a 01 00 00 01 9c c2 	call   0xc29c:0x1000001
  e5:	01 00                	add    DWORD PTR [eax],eax
  e7:	00 06                	add    BYTE PTR [esi],al
  e9:	13 01                	adc    eax,DWORD PTR [ecx]
  eb:	00 00                	add    BYTE PTR [eax],al
  ed:	01 21                	add    DWORD PTR [ecx],esp
  ef:	3a 00                	cmp    al,BYTE PTR [eax]
  f1:	00 00                	add    BYTE PTR [eax],al
  f3:	02 91 00 06 44 01    	add    dl,BYTE PTR [ecx+0x1440600]
  f9:	00 00                	add    BYTE PTR [eax],al
  fb:	01 21                	add    DWORD PTR [ecx],esp
  fd:	c2 01 00             	ret    0x1
 100:	00 02                	add    BYTE PTR [edx],al
 102:	91                   	xchg   ecx,eax
 103:	04 09                	add    al,0x9
 105:	70 69                	jo     170 <sysEnter_Vector-0x12fe90>
 107:	64 00 01             	add    BYTE PTR fs:[ecx],al
 10a:	23 3a                	and    edi,DWORD PTR [edx]
 10c:	00 00                	add    BYTE PTR [eax],al
 10e:	00 02                	add    BYTE PTR [edx],al
 110:	75 60                	jne    172 <sysEnter_Vector-0x12fe8e>
 112:	08 f0                	or     al,dh
 114:	00 00                	add    BYTE PTR [eax],al
 116:	00 01                	add    BYTE PTR [ecx],al
 118:	23 3a                	and    edi,DWORD PTR [edx]
 11a:	00 00                	add    BYTE PTR [eax],al
 11c:	00 02                	add    BYTE PTR [edx],al
 11e:	75 5c                	jne    17c <sysEnter_Vector-0x12fe84>
 120:	08 31                	or     BYTE PTR [ecx],dh
 122:	00 00                	add    BYTE PTR [eax],al
 124:	00 01                	add    BYTE PTR [ecx],al
 126:	23 3a                	and    edi,DWORD PTR [edx]
 128:	00 00                	add    BYTE PTR [eax],al
 12a:	00 02                	add    BYTE PTR [edx],al
 12c:	75 74                	jne    1a2 <sysEnter_Vector-0x12fe5e>
 12e:	08 62 01             	or     BYTE PTR [edx+0x1],ah
 131:	00 00                	add    BYTE PTR [eax],al
 133:	01 29                	add    DWORD PTR [ecx],ebp
 135:	ce                   	into   
 136:	01 00                	add    DWORD PTR [eax],eax
 138:	00 03                	add    BYTE PTR [ebx],al
 13a:	75 54                	jne    190 <sysEnter_Vector-0x12fe70>
 13c:	06                   	push   es
 13d:	08 f5                	or     ch,dh
 13f:	00 00                	add    BYTE PTR [eax],al
 141:	00 01                	add    BYTE PTR [ecx],al
 143:	2a e1                	sub    ah,cl
 145:	01 00                	add    DWORD PTR [eax],eax
 147:	00 03                	add    BYTE PTR [ebx],al
 149:	75 4c                	jne    197 <sysEnter_Vector-0x12fe69>
 14b:	06                   	push   es
 14c:	08 a6 01 00 00 01    	or     BYTE PTR [esi+0x1000001],ah
 152:	2b 3a                	sub    edi,DWORD PTR [edx]
 154:	00 00                	add    BYTE PTR [eax],al
 156:	00 02                	add    BYTE PTR [edx],al
 158:	75 70                	jne    1ca <sysEnter_Vector-0x12fe36>
 15a:	08 21                	or     BYTE PTR [ecx],ah
 15c:	00 00                	add    BYTE PTR [eax],al
 15e:	00 01                	add    BYTE PTR [ecx],al
 160:	2c 3a                	sub    al,0x3a
 162:	00 00                	add    BYTE PTR [eax],al
 164:	00 02                	add    BYTE PTR [edx],al
 166:	75 6c                	jne    1d4 <sysEnter_Vector-0x12fe2c>
 168:	08 58 00             	or     BYTE PTR [eax+0x0],bl
 16b:	00 00                	add    BYTE PTR [eax],al
 16d:	01 2d 3a 00 00 00    	add    DWORD PTR ds:0x3a,ebp
 173:	02 75 68             	add    dh,BYTE PTR [ebp+0x68]
 176:	0a 01                	or     al,BYTE PTR [ecx]
 178:	01 40 30             	add    DWORD PTR [eax+0x30],eax
 17b:	52                   	push   edx
 17c:	00 00                	add    BYTE PTR [eax],al
 17e:	00 a9 01 00 00 09    	add    BYTE PTR [ecx+0x9000001],ch
 184:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 187:	00 01                	add    BYTE PTR [ecx],al
 189:	2e 3a 00             	cmp    al,BYTE PTR cs:[eax]
 18c:	00 00                	add    BYTE PTR [eax],al
 18e:	02 75 64             	add    dh,BYTE PTR [ebp+0x64]
 191:	07                   	pop    es
 192:	1c 01                	sbb    al,0x1
 194:	40                   	inc    eax
 195:	30 19                	xor    BYTE PTR [ecx],bl
 197:	00 00                	add    BYTE PTR [eax],al
 199:	00 09                	add    BYTE PTR [ecx],cl
 19b:	63 6e 00             	arpl   WORD PTR [esi+0x0],bp
 19e:	01 34 3a             	add    DWORD PTR [edx+edi*1],esi
 1a1:	00 00                	add    BYTE PTR [eax],al
 1a3:	00 02                	add    BYTE PTR [edx],al
 1a5:	75 48                	jne    1ef <sysEnter_Vector-0x12fe11>
 1a7:	00 00                	add    BYTE PTR [eax],al
 1a9:	07                   	pop    es
 1aa:	78 01                	js     1ad <sysEnter_Vector-0x12fe53>
 1ac:	40                   	inc    eax
 1ad:	30 2a                	xor    BYTE PTR [edx],ch
 1af:	00 00                	add    BYTE PTR [eax],al
 1b1:	00 08                	add    BYTE PTR [eax],cl
 1b3:	8d 01                	lea    eax,[ecx]
 1b5:	00 00                	add    BYTE PTR [eax],al
 1b7:	01 40 3a             	add    DWORD PTR [eax+0x3a],eax
 1ba:	00 00                	add    BYTE PTR [eax],al
 1bc:	00 02                	add    BYTE PTR [edx],al
 1be:	75 44                	jne    204 <sysEnter_Vector-0x12fdfc>
 1c0:	00 00                	add    BYTE PTR [eax],al
 1c2:	0b 04 c8             	or     eax,DWORD PTR [eax+ecx*8]
 1c5:	01 00                	add    DWORD PTR [eax],eax
 1c7:	00 0b                	add    BYTE PTR [ebx],cl
 1c9:	04 25                	add    al,0x25
 1cb:	00 00                	add    BYTE PTR [eax],al
 1cd:	00 0c 3a             	add    BYTE PTR [edx+edi*1],cl
 1d0:	00 00                	add    BYTE PTR [eax],al
 1d2:	00 e1                	add    cl,ah
 1d4:	01 00                	add    DWORD PTR [eax],eax
 1d6:	00 0d 88 00 00 00    	add    BYTE PTR ds:0x88,cl
 1dc:	03 75 58             	add    esi,DWORD PTR [ebp+0x58]
 1df:	06                   	push   es
 1e0:	00 0c 3a             	add    BYTE PTR [edx+edi*1],cl
 1e3:	00 00                	add    BYTE PTR [eax],al
 1e5:	00 f4                	add    ah,dh
 1e7:	01 00                	add    DWORD PTR [eax],eax
 1e9:	00 0d 88 00 00 00    	add    BYTE PTR ds:0x88,cl
 1ef:	03 75 50             	add    esi,DWORD PTR [ebp+0x50]
 1f2:	06                   	push   es
 1f3:	00 0e                	add    BYTE PTR [esi],cl
 1f5:	74 01                	je     1f8 <sysEnter_Vector-0x12fe08>
 1f7:	00 00                	add    BYTE PTR [eax],al
 1f9:	03 37                	add    esi,DWORD PTR [edi]
 1fb:	56                   	push   esi
 1fc:	00 00                	add    BYTE PTR [eax],al
 1fe:	00 05 03 44 05 40    	add    BYTE PTR ds:0x40054403,al
 204:	30 0e                	xor    BYTE PTR [esi],cl
 206:	d9 00                	fld    DWORD PTR [eax]
 208:	00 00                	add    BYTE PTR [eax],al
 20a:	03 38                	add    edi,DWORD PTR [eax]
 20c:	56                   	push   esi
 20d:	00 00                	add    BYTE PTR [eax],al
 20f:	00 05 03 48 05 40    	add    BYTE PTR ds:0x40054803,al
 215:	30 0e                	xor    BYTE PTR [esi],cl
 217:	3d 00 00 00 03       	cmp    eax,0x3000000
 21c:	39 56 00             	cmp    DWORD PTR [esi+0x0],edx
 21f:	00 00                	add    BYTE PTR [eax],al
 221:	05 03 40 05 40       	add    eax,0x40054003
 226:	30 0e                	xor    BYTE PTR [esi],cl
 228:	86 01                	xchg   BYTE PTR [ecx],al
 22a:	00 00                	add    BYTE PTR [eax],al
 22c:	03 3a                	add    edi,DWORD PTR [edx]
 22e:	7a 00                	jp     230 <sysEnter_Vector-0x12fdd0>
 230:	00 00                	add    BYTE PTR [eax],al
 232:	05 03 50 05 40       	add    eax,0x40055003
 237:	30 0e                	xor    BYTE PTR [esi],cl
 239:	67 01 00             	add    DWORD PTR [bx+si],eax
 23c:	00 04 34             	add    BYTE PTR [esp+esi*1],al
 23f:	49                   	dec    ecx
 240:	02 00                	add    al,BYTE PTR [eax]
 242:	00 05 03 3c 05 40    	add    BYTE PTR ds:0x40053c03,al
 248:	30 0b                	xor    BYTE PTR [ebx],cl
 24a:	04 6f                	add    al,0x6f
 24c:	00 00                	add    BYTE PTR [eax],al
 24e:	00 0e                	add    BYTE PTR [esi],cl
 250:	94                   	xchg   esp,eax
 251:	01 00                	add    DWORD PTR [eax],eax
 253:	00 04 35 56 00 00 00 	add    BYTE PTR [esi*1+0x56],al
 25a:	05 03 38 05 40       	add    eax,0x40053803
 25f:	30 0e                	xor    BYTE PTR [esi],cl
 261:	38 01                	cmp    BYTE PTR [ecx],al
 263:	00 00                	add    BYTE PTR [eax],al
 265:	05 58 c2 01 00       	add    eax,0x1c258
 26a:	00 05 03 4c 05 40    	add    BYTE PTR ds:0x40054c03,al
 270:	30 0e                	xor    BYTE PTR [esi],cl
 272:	e2 00                	loop   274 <sysEnter_Vector-0x12fd8c>
 274:	00 00                	add    BYTE PTR [eax],al
 276:	01 14 3a             	add    DWORD PTR [edx+edi*1],edx
 279:	00 00                	add    BYTE PTR [eax],al
 27b:	00 05 03 84 04 40    	add    BYTE PTR ds:0x40048403,al
 281:	30 00                	xor    BYTE PTR [eax],al

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
  13:	30 cb                	xor    bl,cl
  15:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0c 01                	or     al,0x1
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
 100:	f3 30 bc 08 91 45 89 	repz xor BYTE PTR [eax+ecx*1-0xc76ba6f],bh
 107:	f3 
 108:	03 27                	add    esp,DWORD PTR [edi]
 10a:	74 02                	je     10e <sysEnter_Vector-0x12fef2>
 10c:	0a 00                	or     al,BYTE PTR [eax]
 10e:	01 01                	add    DWORD PTR [ecx],eax

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	2f                   	das    
   1:	68 6f 6d 65 2f       	push   0x2f656d6f
   6:	79 6f                	jns    77 <sysEnter_Vector-0x12ff89>
   8:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
   f:	6f                   	outs   dx,DWORD PTR ds:[esi]
  10:	73 2f                	jae    41 <sysEnter_Vector-0x12ffbf>
  12:	61                   	popa   
  13:	70 72                	jo     87 <sysEnter_Vector-0x12ff79>
  15:	6f                   	outs   dx,DWORD PTR ds:[esi]
  16:	6a 2f                	push   0x2f
  18:	74 65                	je     7f <sysEnter_Vector-0x12ff81>
  1a:	73 74                	jae    90 <sysEnter_Vector-0x12ff70>
  1c:	4d                   	dec    ebp
  1d:	4d                   	dec    ebp
  1e:	61                   	popa   
  1f:	70 00                	jo     21 <sysEnter_Vector-0x12ffdf>
  21:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
  24:	6c                   	ins    BYTE PTR es:[edi],dx
  25:	64                   	fs
  26:	4e                   	dec    esi
  27:	6f                   	outs   dx,DWORD PTR ds:[esi]
  28:	00 64 6f 43          	add    BYTE PTR [edi+ebp*2+0x43],ah
  2c:	68 69 6c 64 00       	push   0x646c69
  31:	70 69                	jo     9c <sysEnter_Vector-0x12ff64>
  33:	64                   	fs
  34:	73 54                	jae    8a <sysEnter_Vector-0x12ff76>
  36:	6f                   	outs   dx,DWORD PTR ds:[esi]
  37:	53                   	push   ebx
  38:	70 61                	jo     9b <sysEnter_Vector-0x12ff65>
  3a:	77 6e                	ja     aa <sysEnter_Vector-0x12ff56>
  3c:	00 68 65             	add    BYTE PTR [eax+0x65],ch
  3f:	61                   	popa   
  40:	70 45                	jo     87 <sysEnter_Vector-0x12ff79>
  42:	6e                   	outs   dx,BYTE PTR ds:[esi]
  43:	64 00 73 68          	add    BYTE PTR fs:[ebx+0x68],dh
  47:	6f                   	outs   dx,DWORD PTR ds:[esi]
  48:	72 74                	jb     be <sysEnter_Vector-0x12ff42>
  4a:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
  4d:	74 00                	je     4f <sysEnter_Vector-0x12ffb1>
  4f:	73 69                	jae    ba <sysEnter_Vector-0x12ff46>
  51:	7a 65                	jp     b8 <sysEnter_Vector-0x12ff48>
  53:	74 79                	je     ce <sysEnter_Vector-0x12ff32>
  55:	70 65                	jo     bc <sysEnter_Vector-0x12ff44>
  57:	00 70 69             	add    BYTE PTR [eax+0x69],dh
  5a:	64                   	fs
  5b:	43                   	inc    ebx
  5c:	6f                   	outs   dx,DWORD PTR ds:[esi]
  5d:	75 6e                	jne    cd <sysEnter_Vector-0x12ff33>
  5f:	74 00                	je     61 <sysEnter_Vector-0x12ff9f>
  61:	6d                   	ins    DWORD PTR es:[edi],dx
  62:	61                   	popa   
  63:	69 6e 00 75 69 6e 74 	imul   ebp,DWORD PTR [esi+0x0],0x746e6975
  6a:	70 74                	jo     e0 <sysEnter_Vector-0x12ff20>
  6c:	72 5f                	jb     cd <sysEnter_Vector-0x12ff33>
  6e:	74 00                	je     70 <sysEnter_Vector-0x12ff90>
  70:	6c                   	ins    BYTE PTR es:[edi],dx
  71:	6f                   	outs   dx,DWORD PTR ds:[esi]
  72:	6e                   	outs   dx,BYTE PTR ds:[esi]
  73:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  77:	6e                   	outs   dx,BYTE PTR ds:[esi]
  78:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
  7c:	74 00                	je     7e <sysEnter_Vector-0x12ff82>
  7e:	47                   	inc    edi
  7f:	4e                   	dec    esi
  80:	55                   	push   ebp
  81:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  84:	39 20                	cmp    DWORD PTR [eax],esp
  86:	35 2e 33 2e 30       	xor    eax,0x302e332e
  8b:	20 2d 6d 33 32 20    	and    BYTE PTR ds:0x2032336d,ch
  91:	2d 6d 61 73 6d       	sub    eax,0x6d73616d
  96:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  9b:	6c                   	ins    BYTE PTR es:[edi],dx
  9c:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  a2:	65                   	gs
  a3:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  a8:	72 69                	jb     113 <sysEnter_Vector-0x12feed>
  aa:	63 20                	arpl   WORD PTR [eax],sp
  ac:	2d 6d 61 72 63       	sub    eax,0x6372616d
  b1:	68 3d 70 65 6e       	push   0x6e65703d
  b6:	74 69                	je     121 <sysEnter_Vector-0x12fedf>
  b8:	75 6d                	jne    127 <sysEnter_Vector-0x12fed9>
  ba:	70 72                	jo     12e <sysEnter_Vector-0x12fed2>
  bc:	6f                   	outs   dx,DWORD PTR ds:[esi]
  bd:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  c3:	74 64                	je     129 <sysEnter_Vector-0x12fed7>
  c5:	3d 63 39 39 20       	cmp    eax,0x20393963
  ca:	2d 66 66 72 65       	sub    eax,0x65726666
  cf:	65                   	gs
  d0:	73 74                	jae    146 <sysEnter_Vector-0x12feba>
  d2:	61                   	popa   
  d3:	6e                   	outs   dx,BYTE PTR ds:[esi]
  d4:	64 69 6e 67 00 68 65 	imul   ebp,DWORD PTR fs:[esi+0x67],0x61656800
  db:	61 
  dc:	70 43                	jo     121 <sysEnter_Vector-0x12fedf>
  de:	75 72                	jne    152 <sysEnter_Vector-0x12feae>
  e0:	72 00                	jb     e2 <sysEnter_Vector-0x12ff1e>
  e2:	73 68                	jae    14c <sysEnter_Vector-0x12feb4>
  e4:	61                   	popa   
  e5:	72 65                	jb     14c <sysEnter_Vector-0x12feb4>
  e7:	64                   	fs
  e8:	43                   	inc    ebx
  e9:	6f                   	outs   dx,DWORD PTR ds:[esi]
  ea:	75 6e                	jne    15a <sysEnter_Vector-0x12fea6>
  ec:	74 65                	je     153 <sysEnter_Vector-0x12fead>
  ee:	72 00                	jb     f0 <sysEnter_Vector-0x12ff10>
  f0:	70 69                	jo     15b <sysEnter_Vector-0x12fea5>
  f2:	64 32 00             	xor    al,BYTE PTR fs:[eax]
  f5:	72 65                	jb     15c <sysEnter_Vector-0x12fea4>
  f7:	74 73                	je     16c <sysEnter_Vector-0x12fe94>
  f9:	00 6d 6d             	add    BYTE PTR [ebp+0x6d],ch
  fc:	61                   	popa   
  fd:	70 6d                	jo     16c <sysEnter_Vector-0x12fe94>
  ff:	61                   	popa   
 100:	69 6e 2e 63 00 75 6e 	imul   ebp,DWORD PTR [esi+0x2e],0x6e750063
 107:	73 69                	jae    172 <sysEnter_Vector-0x12fe8e>
 109:	67 6e                	outs   dx,BYTE PTR ds:[si]
 10b:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 110:	61                   	popa   
 111:	72 00                	jb     113 <sysEnter_Vector-0x12feed>
 113:	61                   	popa   
 114:	72 67                	jb     17d <sysEnter_Vector-0x12fe83>
 116:	63 00                	arpl   WORD PTR [eax],ax
 118:	6c                   	ins    BYTE PTR es:[edi],dx
 119:	6f                   	outs   dx,DWORD PTR ds:[esi]
 11a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 11b:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 11f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 120:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 124:	73 69                	jae    18f <sysEnter_Vector-0x12fe71>
 126:	67 6e                	outs   dx,BYTE PTR ds:[si]
 128:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 12d:	74 00                	je     12f <sysEnter_Vector-0x12fed1>
 12f:	75 69                	jne    19a <sysEnter_Vector-0x12fe66>
 131:	6e                   	outs   dx,BYTE PTR ds:[esi]
 132:	74 33                	je     167 <sysEnter_Vector-0x12fe99>
 134:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 137:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 13a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 13b:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 13e:	73 45                	jae    185 <sysEnter_Vector-0x12fe7b>
 140:	6e                   	outs   dx,BYTE PTR ds:[esi]
 141:	76 70                	jbe    1b3 <sysEnter_Vector-0x12fe4d>
 143:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 146:	67 76 00             	addr16 jbe 149 <sysEnter_Vector-0x12feb7>
 149:	73 68                	jae    1b3 <sysEnter_Vector-0x12fe4d>
 14b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 14c:	72 74                	jb     1c2 <sysEnter_Vector-0x12fe3e>
 14e:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 151:	73 69                	jae    1bc <sysEnter_Vector-0x12fe44>
 153:	67 6e                	outs   dx,BYTE PTR ds:[si]
 155:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 15a:	74 00                	je     15c <sysEnter_Vector-0x12fea4>
 15c:	5f                   	pop    edi
 15d:	42                   	inc    edx
 15e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 15f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 160:	6c                   	ins    BYTE PTR es:[edi],dx
 161:	00 70 69             	add    BYTE PTR [eax+0x69],dh
 164:	64                   	fs
 165:	73 00                	jae    167 <sysEnter_Vector-0x12fe99>
 167:	66 69 6c 65 73 54 6f 	imul   bp,WORD PTR [ebp+eiz*2+0x73],0x6f54
 16e:	43                   	inc    ebx
 16f:	6c                   	ins    BYTE PTR es:[edi],dx
 170:	6f                   	outs   dx,DWORD PTR ds:[esi]
 171:	73 65                	jae    1d8 <sysEnter_Vector-0x12fe28>
 173:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 176:	61                   	popa   
 177:	70 42                	jo     1bb <sysEnter_Vector-0x12fe45>
 179:	61                   	popa   
 17a:	73 65                	jae    1e1 <sysEnter_Vector-0x12fe1f>
 17c:	00 63 68             	add    BYTE PTR [ebx+0x68],ah
 17f:	69 6c 64 4e 75 6d 00 	imul   ebp,DWORD PTR [esp+eiz*2+0x4e],0x6c006d75
 186:	6c 
 187:	69 62 63 54 5a 00 74 	imul   esp,DWORD PTR [edx+0x63],0x74005a54
 18e:	68 65 50 69 64       	push   0x64695065
 193:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 196:	6c                   	ins    BYTE PTR es:[edi],dx
 197:	65                   	gs
 198:	73 54                	jae    1ee <sysEnter_Vector-0x12fe12>
 19a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 19b:	43                   	inc    ebx
 19c:	6c                   	ins    BYTE PTR es:[edi],dx
 19d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 19e:	73 65                	jae    205 <sysEnter_Vector-0x12fdfb>
 1a0:	43                   	inc    ebx
 1a1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1a2:	75 6e                	jne    212 <sysEnter_Vector-0x12fdee>
 1a4:	74 00                	je     1a6 <sysEnter_Vector-0x12fe5a>
 1a6:	70 69                	jo     211 <sysEnter_Vector-0x12fdef>
 1a8:	64                   	fs
 1a9:	73 50                	jae    1fb <sysEnter_Vector-0x12fe05>
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
