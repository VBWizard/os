
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
3040001a:	e8 31 02 00 00       	call   30400250 <main+0x209>
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
        printf("\tChild %u returning %u\n",childNum,childNum);
3040002c:	83 ec 04             	sub    esp,0x4
3040002f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30400032:	ff 75 08             	push   DWORD PTR [ebp+0x8]
30400035:	68 80 02 40 30       	push   0x30400280
3040003a:	e8 01 02 00 00       	call   30400240 <main+0x1f9>
3040003f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:31
        return childNum;
30400042:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/aproj/testMMap/mmapmain.c:32
}
30400045:	c9                   	leave  
30400046:	c3                   	ret    

30400047 <main>:
main():
/home/yogi/src/os/aproj/testMMap/mmapmain.c:34

int main(int argc, char** argv) {
30400047:	8d 4c 24 04          	lea    ecx,[esp+0x4]
3040004b:	83 e4 f0             	and    esp,0xfffffff0
3040004e:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
30400051:	55                   	push   ebp
30400052:	89 e5                	mov    ebp,esp
30400054:	53                   	push   ebx
30400055:	51                   	push   ecx
30400056:	83 ec 40             	sub    esp,0x40
30400059:	89 c8                	mov    eax,ecx
3040005b:	89 e2                	mov    edx,esp
3040005d:	89 d3                	mov    ebx,edx
/home/yogi/src/os/aproj/testMMap/mmapmain.c:36

    int pid=0, pid2=0, pidsToSpawn;
3040005f:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
30400066:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/testMMap/mmapmain.c:37
    if (argc == 1)
3040006d:	83 38 01             	cmp    DWORD PTR [eax],0x1
30400070:	75 09                	jne    3040007b <main+0x34>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:38
        pidsToSpawn = 5;
30400072:	c7 45 f4 05 00 00 00 	mov    DWORD PTR [ebp-0xc],0x5
30400079:	eb 17                	jmp    30400092 <main+0x4b>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:40
    else
        pidsToSpawn = atoi(argv[1]);
3040007b:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
3040007e:	83 c0 04             	add    eax,0x4
30400081:	8b 00                	mov    eax,DWORD PTR [eax]
30400083:	83 ec 0c             	sub    esp,0xc
30400086:	50                   	push   eax
30400087:	e8 e4 01 00 00       	call   30400270 <main+0x229>
3040008c:	83 c4 10             	add    esp,0x10
3040008f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:42
        
    int pids[pidsToSpawn];
30400092:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
30400095:	8d 50 ff             	lea    edx,[eax-0x1]
30400098:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
3040009b:	c1 e0 02             	shl    eax,0x2
3040009e:	8d 50 03             	lea    edx,[eax+0x3]
304000a1:	b8 10 00 00 00       	mov    eax,0x10
304000a6:	83 e8 01             	sub    eax,0x1
304000a9:	01 d0                	add    eax,edx
304000ab:	b9 10 00 00 00       	mov    ecx,0x10
304000b0:	ba 00 00 00 00       	mov    edx,0x0
304000b5:	f7 f1                	div    ecx
304000b7:	6b c0 10             	imul   eax,eax,0x10
304000ba:	29 c4                	sub    esp,eax
304000bc:	89 e0                	mov    eax,esp
304000be:	83 c0 03             	add    eax,0x3
304000c1:	c1 e8 02             	shr    eax,0x2
304000c4:	c1 e0 02             	shl    eax,0x2
304000c7:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:43
    int rets[pidsToSpawn];
304000ca:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
304000cd:	8d 50 ff             	lea    edx,[eax-0x1]
304000d0:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
304000d3:	c1 e0 02             	shl    eax,0x2
304000d6:	8d 50 03             	lea    edx,[eax+0x3]
304000d9:	b8 10 00 00 00       	mov    eax,0x10
304000de:	83 e8 01             	sub    eax,0x1
304000e1:	01 d0                	add    eax,edx
304000e3:	b9 10 00 00 00       	mov    ecx,0x10
304000e8:	ba 00 00 00 00       	mov    edx,0x0
304000ed:	f7 f1                	div    ecx
304000ef:	6b c0 10             	imul   eax,eax,0x10
304000f2:	29 c4                	sub    esp,eax
304000f4:	89 e0                	mov    eax,esp
304000f6:	83 c0 03             	add    eax,0x3
304000f9:	c1 e8 02             	shr    eax,0x2
304000fc:	c1 e0 02             	shl    eax,0x2
304000ff:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:44
    int pidsP = 0;
30400102:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/testMMap/mmapmain.c:45
    int childNo = 0;
30400109:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/testMMap/mmapmain.c:46
    int pidCount = 0;
30400110:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/testMMap/mmapmain.c:47
    for (int cnt=0;cnt<pidsToSpawn;cnt++)
30400117:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
3040011e:	eb 41                	jmp    30400161 <main+0x11a>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:49
    {
         pid=fork();
30400120:	e8 3b 01 00 00       	call   30400260 <main+0x219>
30400125:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:50
        childNo+=1;
30400128:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/testMMap/mmapmain.c:51
        if (pid==0)
3040012c:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
30400130:	75 19                	jne    3040014b <main+0x104>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:53
        {
            int cn = doChild(childNo);
30400132:	83 ec 0c             	sub    esp,0xc
30400135:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
30400138:	e8 c3 fe ff ff       	call   30400000 <doChild>
3040013d:	83 c4 10             	add    esp,0x10
30400140:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:55
            //print("Child %u quitting\n",cn);
            return cn;
30400143:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
30400146:	e9 bf 00 00 00       	jmp    3040020a <main+0x1c3>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:58 (discriminator 2)
        }
        else
            pids[pidsP++]=pid;
3040014b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
3040014e:	8d 50 01             	lea    edx,[eax+0x1]
30400151:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
30400154:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
30400157:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
3040015a:	89 0c 82             	mov    DWORD PTR [edx+eax*4],ecx
/home/yogi/src/os/aproj/testMMap/mmapmain.c:47 (discriminator 2)
    int pids[pidsToSpawn];
    int rets[pidsToSpawn];
    int pidsP = 0;
    int childNo = 0;
    int pidCount = 0;
    for (int cnt=0;cnt<pidsToSpawn;cnt++)
3040015d:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/testMMap/mmapmain.c:47 (discriminator 1)
30400161:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
30400164:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
30400167:	7c b7                	jl     30400120 <main+0xd9>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:61
        }
        else
            pids[pidsP++]=pid;
        //print("Started PID %u\n",pid);
    }
    printf("%u children spawned\n",pidsToSpawn);
30400169:	83 ec 08             	sub    esp,0x8
3040016c:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
3040016f:	68 98 02 40 30       	push   0x30400298
30400174:	e8 c7 00 00 00       	call   30400240 <main+0x1f9>
30400179:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:62
    printf("Waiting for all children to quit\n");
3040017c:	83 ec 0c             	sub    esp,0xc
3040017f:	68 b0 02 40 30       	push   0x304002b0
30400184:	e8 b7 00 00 00       	call   30400240 <main+0x1f9>
30400189:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:63
    while (pidCount<pidsToSpawn)
3040018c:	eb 5f                	jmp    304001ed <main+0x1a6>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:65
    {
        int thePid = pids[pidCount];
3040018e:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
30400191:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
30400194:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
30400197:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
/home/yogi/src/os/aproj/testMMap/mmapmain.c:67
        //print("Waiting for child %u (0x%04X)\n",pidCount+1, thePid);
        rets[pidCount]=waitpid(thePid);
3040019a:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
3040019d:	83 ec 0c             	sub    esp,0xc
304001a0:	50                   	push   eax
304001a1:	e8 8a 00 00 00       	call   30400230 <main+0x1e9>
304001a6:	83 c4 10             	add    esp,0x10
304001a9:	89 c1                	mov    ecx,eax
304001ab:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
304001ae:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
304001b1:	89 0c 90             	mov    DWORD PTR [eax+edx*4],ecx
/home/yogi/src/os/aproj/testMMap/mmapmain.c:68
        if (rets[pidCount]-1!=pidCount)
304001b4:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
304001b7:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
304001ba:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
304001bd:	83 e8 01             	sub    eax,0x1
304001c0:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
304001c3:	74 24                	je     304001e9 <main+0x1a2>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:69
            printf("Wrong return value for child #%u, value=%u (pid=0x%08x)\n",pidCount,rets[pidCount],pids[pidCount]);
304001c5:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
304001c8:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
304001cb:	8b 14 90             	mov    edx,DWORD PTR [eax+edx*4]
304001ce:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
304001d1:	8b 4d e8             	mov    ecx,DWORD PTR [ebp-0x18]
304001d4:	8b 04 88             	mov    eax,DWORD PTR [eax+ecx*4]
304001d7:	52                   	push   edx
304001d8:	50                   	push   eax
304001d9:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
304001dc:	68 d4 02 40 30       	push   0x304002d4
304001e1:	e8 5a 00 00 00       	call   30400240 <main+0x1f9>
304001e6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:70
        pidCount++;
304001e9:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/testMMap/mmapmain.c:63
            pids[pidsP++]=pid;
        //print("Started PID %u\n",pid);
    }
    printf("%u children spawned\n",pidsToSpawn);
    printf("Waiting for all children to quit\n");
    while (pidCount<pidsToSpawn)
304001ed:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
304001f0:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
304001f3:	7c 99                	jl     3040018e <main+0x147>
/home/yogi/src/os/aproj/testMMap/mmapmain.c:72
        rets[pidCount]=waitpid(thePid);
        if (rets[pidCount]-1!=pidCount)
            printf("Wrong return value for child #%u, value=%u (pid=0x%08x)\n",pidCount,rets[pidCount],pids[pidCount]);
        pidCount++;
    }
    printf("All children ended\n");
304001f5:	83 ec 0c             	sub    esp,0xc
304001f8:	68 0d 03 40 30       	push   0x3040030d
304001fd:	e8 3e 00 00 00       	call   30400240 <main+0x1f9>
30400202:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/testMMap/mmapmain.c:73
    return 0;
30400205:	b8 00 00 00 00       	mov    eax,0x0
3040020a:	89 dc                	mov    esp,ebx
/home/yogi/src/os/aproj/testMMap/mmapmain.c:112
    print("waiting for child 1 (PID=0x%04X)\n", pid);
    uint32_t pid0Return = waitpid(pid);
    print("PID 1 returned %u\n",pid0Return);
    return (0);
*/
}
3040020c:	8d 65 f8             	lea    esp,[ebp-0x8]
3040020f:	59                   	pop    ecx
30400210:	5b                   	pop    ebx
30400211:	5d                   	pop    ebp
30400212:	8d 61 fc             	lea    esp,[ecx-0x4]
30400215:	c3                   	ret    

Disassembly of section .plt:

30400220 <.plt>:
30400220:	ff 35 c0 05 40 30    	push   DWORD PTR ds:0x304005c0
30400226:	ff 25 c4 05 40 30    	jmp    DWORD PTR ds:0x304005c4
3040022c:	00 00                	add    BYTE PTR [eax],al
3040022e:	00 00                	add    BYTE PTR [eax],al
30400230:	ff 25 c8 05 40 30    	jmp    DWORD PTR ds:0x304005c8
30400236:	68 00 00 00 00       	push   0x0
3040023b:	e9 e0 ff ff ff       	jmp    30400220 <main+0x1d9>
30400240:	ff 25 cc 05 40 30    	jmp    DWORD PTR ds:0x304005cc
30400246:	68 08 00 00 00       	push   0x8
3040024b:	e9 d0 ff ff ff       	jmp    30400220 <main+0x1d9>
30400250:	ff 25 d0 05 40 30    	jmp    DWORD PTR ds:0x304005d0
30400256:	68 10 00 00 00       	push   0x10
3040025b:	e9 c0 ff ff ff       	jmp    30400220 <main+0x1d9>
30400260:	ff 25 d4 05 40 30    	jmp    DWORD PTR ds:0x304005d4
30400266:	68 18 00 00 00       	push   0x18
3040026b:	e9 b0 ff ff ff       	jmp    30400220 <main+0x1d9>
30400270:	ff 25 d8 05 40 30    	jmp    DWORD PTR ds:0x304005d8
30400276:	68 20 00 00 00       	push   0x20
3040027b:	e9 a0 ff ff ff       	jmp    30400220 <main+0x1d9>

Disassembly of section .rodata:

30400280 <.rodata>:
30400280:	09 43 68             	or     DWORD PTR [ebx+0x68],eax
30400283:	69 6c 64 20 25 75 20 	imul   ebp,DWORD PTR [esp+eiz*2+0x20],0x72207525
3040028a:	72 
3040028b:	65                   	gs
3040028c:	74 75                	je     30400303 <main+0x2bc>
3040028e:	72 6e                	jb     304002fe <main+0x2b7>
30400290:	69 6e 67 20 25 75 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa752520
30400297:	00 25 75 20 63 68    	add    BYTE PTR ds:0x68632075,ah
3040029d:	69 6c 64 72 65 6e 20 	imul   ebp,DWORD PTR [esp+eiz*2+0x72],0x73206e65
304002a4:	73 
304002a5:	70 61                	jo     30400308 <main+0x2c1>
304002a7:	77 6e                	ja     30400317 <main+0x2d0>
304002a9:	65 64 0a 00          	gs or  al,BYTE PTR fs:gs:[eax]
304002ad:	00 00                	add    BYTE PTR [eax],al
304002af:	00 57 61             	add    BYTE PTR [edi+0x61],dl
304002b2:	69 74 69 6e 67 20 66 	imul   esi,DWORD PTR [ecx+ebp*2+0x6e],0x6f662067
304002b9:	6f 
304002ba:	72 20                	jb     304002dc <main+0x295>
304002bc:	61                   	popa   
304002bd:	6c                   	ins    BYTE PTR es:[edi],dx
304002be:	6c                   	ins    BYTE PTR es:[edi],dx
304002bf:	20 63 68             	and    BYTE PTR [ebx+0x68],ah
304002c2:	69 6c 64 72 65 6e 20 	imul   ebp,DWORD PTR [esp+eiz*2+0x72],0x74206e65
304002c9:	74 
304002ca:	6f                   	outs   dx,DWORD PTR ds:[esi]
304002cb:	20 71 75             	and    BYTE PTR [ecx+0x75],dh
304002ce:	69 74 0a 00 00 00 57 	imul   esi,DWORD PTR [edx+ecx*1+0x0],0x72570000
304002d5:	72 
304002d6:	6f                   	outs   dx,DWORD PTR ds:[esi]
304002d7:	6e                   	outs   dx,BYTE PTR ds:[esi]
304002d8:	67 20 72 65          	and    BYTE PTR [bp+si+0x65],dh
304002dc:	74 75                	je     30400353 <main+0x30c>
304002de:	72 6e                	jb     3040034e <main+0x307>
304002e0:	20 76 61             	and    BYTE PTR [esi+0x61],dh
304002e3:	6c                   	ins    BYTE PTR es:[edi],dx
304002e4:	75 65                	jne    3040034b <main+0x304>
304002e6:	20 66 6f             	and    BYTE PTR [esi+0x6f],ah
304002e9:	72 20                	jb     3040030b <main+0x2c4>
304002eb:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
304002ee:	6c                   	ins    BYTE PTR es:[edi],dx
304002ef:	64 20 23             	and    BYTE PTR fs:[ebx],ah
304002f2:	25 75 2c 20 76       	and    eax,0x76202c75
304002f7:	61                   	popa   
304002f8:	6c                   	ins    BYTE PTR es:[edi],dx
304002f9:	75 65                	jne    30400360 <main+0x319>
304002fb:	3d 25 75 20 28       	cmp    eax,0x28207525
30400300:	70 69                	jo     3040036b <main+0x324>
30400302:	64                   	fs
30400303:	3d 30 78 25 30       	cmp    eax,0x30257830
30400308:	38 78 29             	cmp    BYTE PTR [eax+0x29],bh
3040030b:	0a 00                	or     al,BYTE PTR [eax]
3040030d:	41                   	inc    ecx
3040030e:	6c                   	ins    BYTE PTR es:[edi],dx
3040030f:	6c                   	ins    BYTE PTR es:[edi],dx
30400310:	20 63 68             	and    BYTE PTR [ebx+0x68],ah
30400313:	69 6c 64 72 65 6e 20 	imul   ebp,DWORD PTR [esp+eiz*2+0x72],0x65206e65
3040031a:	65 
3040031b:	6e                   	outs   dx,BYTE PTR ds:[esi]
3040031c:	64 65 64 0a 00       	fs gs or al,BYTE PTR fs:gs:[eax]

Disassembly of section .eh_frame:

30400324 <.eh_frame>:
30400324:	14 00                	adc    al,0x0
30400326:	00 00                	add    BYTE PTR [eax],al
30400328:	00 00                	add    BYTE PTR [eax],al
3040032a:	00 00                	add    BYTE PTR [eax],al
3040032c:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
3040032f:	00 01                	add    BYTE PTR [ecx],al
30400331:	7c 08                	jl     3040033b <main+0x2f4>
30400333:	01 1b                	add    DWORD PTR [ebx],ebx
30400335:	0c 04                	or     al,0x4
30400337:	04 88                	add    al,0x88
30400339:	01 00                	add    DWORD PTR [eax],eax
3040033b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
3040033e:	00 00                	add    BYTE PTR [eax],al
30400340:	1c 00                	sbb    al,0x0
30400342:	00 00                	add    BYTE PTR [eax],al
30400344:	bc fc ff ff 47       	mov    esp,0x47fffffc
30400349:	00 00                	add    BYTE PTR [eax],al
3040034b:	00 00                	add    BYTE PTR [eax],al
3040034d:	41                   	inc    ecx
3040034e:	0e                   	push   cs
3040034f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
30400355:	02 43 c5             	add    al,BYTE PTR [ebx-0x3b]
30400358:	0c 04                	or     al,0x4
3040035a:	04 00                	add    al,0x0
3040035c:	34 00                	xor    al,0x0
3040035e:	00 00                	add    BYTE PTR [eax],al
30400360:	3c 00                	cmp    al,0x0
30400362:	00 00                	add    BYTE PTR [eax],al
30400364:	e3 fc                	jecxz  30400362 <main+0x31b>
30400366:	ff                   	(bad)  
30400367:	ff cf                	dec    edi
30400369:	01 00                	add    DWORD PTR [eax],eax
3040036b:	00 00                	add    BYTE PTR [eax],al
3040036d:	44                   	inc    esp
3040036e:	0c 01                	or     al,0x1
30400370:	00 47 10             	add    BYTE PTR [edi+0x10],al
30400373:	05 02 75 00 44       	add    eax,0x44007502
30400378:	0f 03 75 78          	lsl    esi,WORD PTR [ebp+0x78]
3040037c:	06                   	push   es
3040037d:	10 03                	adc    BYTE PTR [ebx],al
3040037f:	02 75 7c             	add    dh,BYTE PTR [ebp+0x7c]
30400382:	03 ba 01 c1 0c 01    	add    edi,DWORD PTR [edx+0x10cc101]
30400388:	00 41 c3             	add    BYTE PTR [ecx-0x3d],al
3040038b:	41                   	inc    ecx
3040038c:	c5 43 0c             	lds    eax,FWORD PTR [ebx+0xc]
3040038f:	04 04                	add    al,0x4
30400391:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .interp:

30400394 <.interp>:
30400394:	2f                   	das    
30400395:	6c                   	ins    BYTE PTR es:[edi],dx
30400396:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
3040039d:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
304003a4:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

304003a8 <.dynsym>:
	...
304003b8:	09 00                	or     DWORD PTR [eax],eax
	...
304003c2:	00 00                	add    BYTE PTR [eax],al
304003c4:	12 00                	adc    al,BYTE PTR [eax]
304003c6:	00 00                	add    BYTE PTR [eax],al
304003c8:	11 00                	adc    DWORD PTR [eax],eax
	...
304003d2:	00 00                	add    BYTE PTR [eax],al
304003d4:	12 00                	adc    al,BYTE PTR [eax]
304003d6:	00 00                	add    BYTE PTR [eax],al
304003d8:	18 00                	sbb    BYTE PTR [eax],al
	...
304003e2:	00 00                	add    BYTE PTR [eax],al
304003e4:	12 00                	adc    al,BYTE PTR [eax]
304003e6:	00 00                	add    BYTE PTR [eax],al
304003e8:	1e                   	push   ds
	...
304003f1:	00 00                	add    BYTE PTR [eax],al
304003f3:	00 12                	add    BYTE PTR [edx],dl
304003f5:	00 00                	add    BYTE PTR [eax],al
304003f7:	00 28                	add    BYTE PTR [eax],ch
304003f9:	00 00                	add    BYTE PTR [eax],al
304003fb:	00 00                	add    BYTE PTR [eax],al
304003fd:	00 13                	add    BYTE PTR [ebx],dl
304003ff:	00 00                	add    BYTE PTR [eax],al
30400401:	00 00                	add    BYTE PTR [eax],al
30400403:	00 10                	add    BYTE PTR [eax],dl
30400405:	00 01                	add    BYTE PTR [ecx],al
30400407:	00 23                	add    BYTE PTR [ebx],ah
	...
30400411:	00 00                	add    BYTE PTR [eax],al
30400413:	00 12                	add    BYTE PTR [edx],dl
30400415:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

30400418 <.dynstr>:
30400418:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
3040041c:	63 2e                	arpl   WORD PTR [esi],bp
3040041e:	73 6f                	jae    3040048f <main+0x448>
30400420:	00 77 61             	add    BYTE PTR [edi+0x61],dh
30400423:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
3040042a:	72 
3040042b:	69 6e 74 66 00 73 6c 	imul   ebp,DWORD PTR [esi+0x74],0x6c730066
30400432:	65                   	gs
30400433:	65                   	gs
30400434:	70 00                	jo     30400436 <main+0x3ef>
30400436:	66 6f                	outs   dx,WORD PTR ds:[esi]
30400438:	72 6b                	jb     304004a5 <main+0x45e>
3040043a:	00 61 74             	add    BYTE PTR [ecx+0x74],ah
3040043d:	6f                   	outs   dx,DWORD PTR ds:[esi]
3040043e:	69 00 73 79 73 45    	imul   eax,DWORD PTR [eax],0x45737973
30400444:	6e                   	outs   dx,BYTE PTR ds:[esi]
30400445:	74 65                	je     304004ac <main+0x465>
30400447:	72 5f                	jb     304004a8 <main+0x461>
30400449:	56                   	push   esi
3040044a:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
3040044f:	00 2e                	add    BYTE PTR [esi],ch
30400451:	2e                   	cs
30400452:	2f                   	das    
30400453:	6c                   	ins    BYTE PTR es:[edi],dx
30400454:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
3040045b:	4f                   	dec    edi
3040045c:	53                   	push   ebx
3040045d:	2f                   	das    
3040045e:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
30400465:	62 
30400466:	75 67                	jne    304004cf <main+0x488>
30400468:	2f                   	das    
30400469:	47                   	inc    edi
3040046a:	4e                   	dec    esi
3040046b:	55                   	push   ebp
3040046c:	2d 4c 69 6e 75       	sub    eax,0x756e694c
30400471:	78 00                	js     30400473 <main+0x42c>

Disassembly of section .hash:

30400474 <.hash>:
30400474:	03 00                	add    eax,DWORD PTR [eax]
30400476:	00 00                	add    BYTE PTR [eax],al
30400478:	07                   	pop    es
30400479:	00 00                	add    BYTE PTR [eax],al
3040047b:	00 06                	add    BYTE PTR [esi],al
3040047d:	00 00                	add    BYTE PTR [eax],al
3040047f:	00 00                	add    BYTE PTR [eax],al
30400481:	00 00                	add    BYTE PTR [eax],al
30400483:	00 04 00             	add    BYTE PTR [eax+eax*1],al
	...
3040048e:	00 00                	add    BYTE PTR [eax],al
30400490:	01 00                	add    DWORD PTR [eax],eax
30400492:	00 00                	add    BYTE PTR [eax],al
30400494:	00 00                	add    BYTE PTR [eax],al
30400496:	00 00                	add    BYTE PTR [eax],al
30400498:	02 00                	add    al,BYTE PTR [eax]
3040049a:	00 00                	add    BYTE PTR [eax],al
3040049c:	03 00                	add    eax,DWORD PTR [eax]
3040049e:	00 00                	add    BYTE PTR [eax],al
304004a0:	05                   	.byte 0x5
304004a1:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

304004a4 <.eh_frame>:
304004a4:	14 00                	adc    al,0x0
304004a6:	00 00                	add    BYTE PTR [eax],al
304004a8:	00 00                	add    BYTE PTR [eax],al
304004aa:	00 00                	add    BYTE PTR [eax],al
304004ac:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
304004af:	00 01                	add    BYTE PTR [ecx],al
304004b1:	7c 08                	jl     304004bb <main+0x474>
304004b3:	01 1b                	add    DWORD PTR [ebx],ebx
304004b5:	0c 04                	or     al,0x4
304004b7:	04 88                	add    al,0x88
304004b9:	01 00                	add    DWORD PTR [eax],eax
304004bb:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
304004be:	00 00                	add    BYTE PTR [eax],al
304004c0:	1c 00                	sbb    al,0x0
304004c2:	00 00                	add    BYTE PTR [eax],al
304004c4:	5c                   	pop    esp
304004c5:	fd                   	std    
304004c6:	ff                   	(bad)  
304004c7:	ff 60 00             	jmp    DWORD PTR [eax+0x0]
304004ca:	00 00                	add    BYTE PTR [eax],al
304004cc:	00 0e                	add    BYTE PTR [esi],cl
304004ce:	08 46 0e             	or     BYTE PTR [esi+0xe],al
304004d1:	0c 4a                	or     al,0x4a
304004d3:	0f 0b                	ud2    
304004d5:	74 04                	je     304004db <main+0x494>
304004d7:	78 00                	js     304004d9 <main+0x492>
304004d9:	3f                   	aas    
304004da:	1a 3b                	sbb    bh,BYTE PTR [ebx]
304004dc:	2a 32                	sub    dh,BYTE PTR [edx]
304004de:	24 22                	and    al,0x22
304004e0:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

304004e4 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
304004e4:	01 1b                	add    DWORD PTR [ebx],ebx
304004e6:	03 3b                	add    edi,DWORD PTR [ebx]
304004e8:	3c fe                	cmp    al,0xfe
304004ea:	ff                   	(bad)  
304004eb:	ff 02                	inc    DWORD PTR [edx]
304004ed:	00 00                	add    BYTE PTR [eax],al
304004ef:	00 1c fb             	add    BYTE PTR [ebx+edi*8],bl
304004f2:	ff                   	(bad)  
304004f3:	ff 58 fe             	call   FWORD PTR [eax-0x2]
304004f6:	ff                   	(bad)  
304004f7:	ff 63 fb             	jmp    DWORD PTR [ebx-0x5]
304004fa:	ff                   	(bad)  
304004fb:	ff                   	(bad)  
304004fc:	78 fe                	js     304004fc <__GNU_EH_FRAME_HDR+0x18>
304004fe:	ff                   	(bad)  
304004ff:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

30400500 <.rel.dyn>:
30400500:	c8 05 40 30          	enter  0x4005,0x30
30400504:	07                   	pop    es
30400505:	01 00                	add    DWORD PTR [eax],eax
30400507:	00 cc                	add    ah,cl
30400509:	05 40 30 07 02       	add    eax,0x2073040
3040050e:	00 00                	add    BYTE PTR [eax],al
30400510:	d0 05 40 30 07 03    	rol    BYTE PTR ds:0x3073040,1
30400516:	00 00                	add    BYTE PTR [eax],al
30400518:	d4 05                	aam    0x5
3040051a:	40                   	inc    eax
3040051b:	30 07                	xor    BYTE PTR [edi],al
3040051d:	04 00                	add    al,0x0
3040051f:	00 d8                	add    al,bl
30400521:	05 40 30 07 06       	add    eax,0x6073040
	...

Disassembly of section .data:

30400528 <sharedCounter>:
30400528:	0a 00                	or     al,BYTE PTR [eax]
	...

Disassembly of section .dynamic:

3040052c <_DYNAMIC>:
3040052c:	01 00                	add    DWORD PTR [eax],eax
3040052e:	00 00                	add    BYTE PTR [eax],al
30400530:	01 00                	add    DWORD PTR [eax],eax
30400532:	00 00                	add    BYTE PTR [eax],al
30400534:	0f 00 00             	sldt   WORD PTR [eax]
30400537:	00 38                	add    BYTE PTR [eax],bh
30400539:	00 00                	add    BYTE PTR [eax],al
3040053b:	00 04 00             	add    BYTE PTR [eax+eax*1],al
3040053e:	00 00                	add    BYTE PTR [eax],al
30400540:	74 04                	je     30400546 <_DYNAMIC+0x1a>
30400542:	40                   	inc    eax
30400543:	30 05 00 00 00 18    	xor    BYTE PTR ds:0x18000000,al
30400549:	04 40                	add    al,0x40
3040054b:	30 06                	xor    BYTE PTR [esi],al
3040054d:	00 00                	add    BYTE PTR [eax],al
3040054f:	00 a8 03 40 30 0a    	add    BYTE PTR [eax+0xa304003],ch
30400555:	00 00                	add    BYTE PTR [eax],al
30400557:	00 5b 00             	add    BYTE PTR [ebx+0x0],bl
3040055a:	00 00                	add    BYTE PTR [eax],al
3040055c:	0b 00                	or     eax,DWORD PTR [eax]
3040055e:	00 00                	add    BYTE PTR [eax],al
30400560:	10 00                	adc    BYTE PTR [eax],al
30400562:	00 00                	add    BYTE PTR [eax],al
30400564:	15 00 00 00 00       	adc    eax,0x0
30400569:	00 00                	add    BYTE PTR [eax],al
3040056b:	00 03                	add    BYTE PTR [ebx],al
3040056d:	00 00                	add    BYTE PTR [eax],al
3040056f:	00 bc 05 40 30 02 00 	add    BYTE PTR [ebp+eax*1+0x23040],bh
30400576:	00 00                	add    BYTE PTR [eax],al
30400578:	28 00                	sub    BYTE PTR [eax],al
3040057a:	00 00                	add    BYTE PTR [eax],al
3040057c:	14 00                	adc    al,0x0
3040057e:	00 00                	add    BYTE PTR [eax],al
30400580:	11 00                	adc    DWORD PTR [eax],eax
30400582:	00 00                	add    BYTE PTR [eax],al
30400584:	17                   	pop    ss
30400585:	00 00                	add    BYTE PTR [eax],al
30400587:	00 00                	add    BYTE PTR [eax],al
30400589:	05 40 30 00 00       	add    eax,0x3040
	...

Disassembly of section .got.plt:

304005bc <_GLOBAL_OFFSET_TABLE_>:
304005bc:	2c 05                	sub    al,0x5
304005be:	40                   	inc    eax
304005bf:	30 00                	xor    BYTE PTR [eax],al
304005c1:	00 00                	add    BYTE PTR [eax],al
304005c3:	00 00                	add    BYTE PTR [eax],al
304005c5:	00 00                	add    BYTE PTR [eax],al
304005c7:	00 36                	add    BYTE PTR [esi],dh
304005c9:	02 40 30             	add    al,BYTE PTR [eax+0x30]
304005cc:	46                   	inc    esi
304005cd:	02 40 30             	add    al,BYTE PTR [eax+0x30]
304005d0:	56                   	push   esi
304005d1:	02 40 30             	add    al,BYTE PTR [eax+0x30]
304005d4:	66                   	data16
304005d5:	02 40 30             	add    al,BYTE PTR [eax+0x30]
304005d8:	76 02                	jbe    304005dc <filesToCloseCount>
304005da:	40                   	inc    eax
304005db:	30                   	.byte 0x30

Disassembly of section .bss:

304005dc <filesToCloseCount>:
304005dc:	00 00                	add    BYTE PTR [eax],al
	...

304005e0 <filesToClose>:
304005e0:	00 00                	add    BYTE PTR [eax],al
	...

304005e4 <processEnvp>:
304005e4:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	42                   	inc    edx
   1:	02 00                	add    al,BYTE PTR [eax]
   3:	00 04 00             	add    BYTE PTR [eax+eax*1],al
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	76 00                	jbe    e <sysEnter_Vector-0x12fff2>
   e:	00 00                	add    BYTE PTR [eax],al
  10:	0c e9                	or     al,0xe9
	...
  1a:	00 40 30             	add    BYTE PTR [eax+0x30],al
  1d:	16                   	push   ss
  1e:	02 00                	add    al,BYTE PTR [eax]
  20:	00 00                	add    BYTE PTR [eax],al
  22:	00 00                	add    BYTE PTR [eax],al
  24:	00 02                	add    BYTE PTR [edx],al
  26:	01 06                	add    DWORD PTR [esi],eax
  28:	fd                   	std    
  29:	00 00                	add    BYTE PTR [eax],al
  2b:	00 02                	add    BYTE PTR [edx],al
  2d:	01 06                	add    DWORD PTR [esi],eax
  2f:	f6 00 00             	test   BYTE PTR [eax],0x0
  32:	00 02                	add    BYTE PTR [edx],al
  34:	02 05 3d 00 00 00    	add    al,BYTE PTR ds:0x3d
  3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  41:	02 08                	add    cl,BYTE PTR [eax]
  43:	05 68 00 00 00       	add    eax,0x68
  48:	02 01                	add    al,BYTE PTR [ecx]
  4a:	08 f4                	or     ah,dh
  4c:	00 00                	add    BYTE PTR [eax],al
  4e:	00 02                	add    BYTE PTR [edx],al
  50:	02 07                	add    al,BYTE PTR [edi]
  52:	38 01                	cmp    BYTE PTR [ecx],al
  54:	00 00                	add    BYTE PTR [eax],al
  56:	04 1e                	add    al,0x1e
  58:	01 00                	add    DWORD PTR [eax],eax
  5a:	00 02                	add    BYTE PTR [edx],al
  5c:	34 61                	xor    al,0x61
  5e:	00 00                	add    BYTE PTR [eax],al
  60:	00 02                	add    BYTE PTR [edx],al
  62:	04 07                	add    al,0x7
  64:	11 01                	adc    DWORD PTR [ecx],eax
  66:	00 00                	add    BYTE PTR [eax],al
  68:	02 08                	add    cl,BYTE PTR [eax]
  6a:	07                   	pop    es
  6b:	07                   	pop    es
  6c:	01 00                	add    DWORD PTR [eax],eax
  6e:	00 04 5e             	add    BYTE PTR [esi+ebx*2],al
  71:	00 00                	add    BYTE PTR [eax],al
  73:	00 02                	add    BYTE PTR [edx],al
  75:	56                   	push   esi
  76:	61                   	popa   
  77:	00 00                	add    BYTE PTR [eax],al
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	04 05                	add    al,0x5
  7d:	6d                   	ins    DWORD PTR es:[edi],dx
  7e:	00 00                	add    BYTE PTR [eax],al
  80:	00 02                	add    BYTE PTR [edx],al
  82:	04 07                	add    al,0x7
  84:	47                   	inc    edi
  85:	00 00                	add    BYTE PTR [eax],al
  87:	00 02                	add    BYTE PTR [edx],al
  89:	01 02                	add    DWORD PTR [edx],eax
  8b:	4b                   	dec    ebx
  8c:	01 00                	add    DWORD PTR [eax],eax
  8e:	00 02                	add    BYTE PTR [edx],al
  90:	08 04 63             	or     BYTE PTR [ebx+eiz*2],al
  93:	01 00                	add    DWORD PTR [eax],eax
  95:	00 05 29 00 00 00    	add    BYTE PTR ds:0x29,al
  9b:	01 16                	add    DWORD PTR [esi],edx
  9d:	3a 00                	cmp    al,BYTE PTR [eax]
  9f:	00 00                	add    BYTE PTR [eax],al
  a1:	00 00                	add    BYTE PTR [eax],al
  a3:	40                   	inc    eax
  a4:	30 47 00             	xor    BYTE PTR [edi+0x0],al
  a7:	00 00                	add    BYTE PTR [eax],al
  a9:	01 9c d6 00 00 00 06 	add    DWORD PTR [esi+edx*8+0x6000000],ebx
  b0:	6a 01                	push   0x1
  b2:	00 00                	add    BYTE PTR [eax],al
  b4:	01 16                	add    DWORD PTR [esi],edx
  b6:	3a 00                	cmp    al,BYTE PTR [eax]
  b8:	00 00                	add    BYTE PTR [eax],al
  ba:	02 91 00 07 06 00    	add    dl,BYTE PTR [ecx+0x60700]
  c0:	40                   	inc    eax
  c1:	30 26                	xor    BYTE PTR [esi],ah
  c3:	00 00                	add    BYTE PTR [eax],al
  c5:	00 08                	add    BYTE PTR [eax],cl
  c7:	d1 00                	rol    DWORD PTR [eax],1
  c9:	00 00                	add    BYTE PTR [eax],al
  cb:	01 18                	add    DWORD PTR [eax],ebx
  cd:	3a 00                	cmp    al,BYTE PTR [eax]
  cf:	00 00                	add    BYTE PTR [eax],al
  d1:	02 91 6c 00 00 05    	add    dl,BYTE PTR [ecx+0x500006c]
  d7:	59                   	pop    ecx
  d8:	00 00                	add    BYTE PTR [eax],al
  da:	00 01                	add    BYTE PTR [ecx],al
  dc:	22 3a                	and    bh,BYTE PTR [edx]
  de:	00 00                	add    BYTE PTR [eax],al
  e0:	00 47 00             	add    BYTE PTR [edi+0x0],al
  e3:	40                   	inc    eax
  e4:	30 cf                	xor    bh,cl
  e6:	01 00                	add    DWORD PTR [eax],eax
  e8:	00 01                	add    BYTE PTR [ecx],al
  ea:	9c                   	pushf  
  eb:	c9                   	leave  
  ec:	01 00                	add    DWORD PTR [eax],eax
  ee:	00 06                	add    BYTE PTR [esi],al
  f0:	02 01                	add    al,BYTE PTR [ecx]
  f2:	00 00                	add    BYTE PTR [eax],al
  f4:	01 22                	add    DWORD PTR [edx],esp
  f6:	3a 00                	cmp    al,BYTE PTR [eax]
  f8:	00 00                	add    BYTE PTR [eax],al
  fa:	02 91 00 06 33 01    	add    dl,BYTE PTR [ecx+0x1330600]
 100:	00 00                	add    BYTE PTR [eax],al
 102:	01 22                	add    DWORD PTR [edx],esp
 104:	c9                   	leave  
 105:	01 00                	add    DWORD PTR [eax],eax
 107:	00 02                	add    BYTE PTR [edx],al
 109:	91                   	xchg   ecx,eax
 10a:	04 09                	add    al,0x9
 10c:	70 69                	jo     177 <sysEnter_Vector-0x12fe89>
 10e:	64 00 01             	add    BYTE PTR fs:[ecx],al
 111:	24 3a                	and    al,0x3a
 113:	00 00                	add    BYTE PTR [eax],al
 115:	00 02                	add    BYTE PTR [edx],al
 117:	75 60                	jne    179 <sysEnter_Vector-0x12fe87>
 119:	08 df                	or     bh,bl
 11b:	00 00                	add    BYTE PTR [eax],al
 11d:	00 01                	add    BYTE PTR [ecx],al
 11f:	24 3a                	and    al,0x3a
 121:	00 00                	add    BYTE PTR [eax],al
 123:	00 02                	add    BYTE PTR [edx],al
 125:	75 5c                	jne    183 <sysEnter_Vector-0x12fe7d>
 127:	08 31                	or     BYTE PTR [ecx],dh
 129:	00 00                	add    BYTE PTR [eax],al
 12b:	00 01                	add    BYTE PTR [ecx],al
 12d:	24 3a                	and    al,0x3a
 12f:	00 00                	add    BYTE PTR [eax],al
 131:	00 02                	add    BYTE PTR [edx],al
 133:	75 74                	jne    1a9 <sysEnter_Vector-0x12fe57>
 135:	08 51 01             	or     BYTE PTR [ecx+0x1],dl
 138:	00 00                	add    BYTE PTR [eax],al
 13a:	01 2a                	add    DWORD PTR [edx],ebp
 13c:	d5 01                	aad    0x1
 13e:	00 00                	add    BYTE PTR [eax],al
 140:	03 75 54             	add    esi,DWORD PTR [ebp+0x54]
 143:	06                   	push   es
 144:	08 e4                	or     ah,ah
 146:	00 00                	add    BYTE PTR [eax],al
 148:	00 01                	add    BYTE PTR [ecx],al
 14a:	2b e8                	sub    ebp,eax
 14c:	01 00                	add    DWORD PTR [eax],eax
 14e:	00 03                	add    BYTE PTR [ebx],al
 150:	75 4c                	jne    19e <sysEnter_Vector-0x12fe62>
 152:	06                   	push   es
 153:	08 8c 01 00 00 01 2c 	or     BYTE PTR [ecx+eax*1+0x2c010000],cl
 15a:	3a 00                	cmp    al,BYTE PTR [eax]
 15c:	00 00                	add    BYTE PTR [eax],al
 15e:	02 75 70             	add    dh,BYTE PTR [ebp+0x70]
 161:	08 21                	or     BYTE PTR [ecx],ah
 163:	00 00                	add    BYTE PTR [eax],al
 165:	00 01                	add    BYTE PTR [ecx],al
 167:	2d 3a 00 00 00       	sub    eax,0x3a
 16c:	02 75 6c             	add    dh,BYTE PTR [ebp+0x6c]
 16f:	08 50 00             	or     BYTE PTR [eax+0x0],dl
 172:	00 00                	add    BYTE PTR [eax],al
 174:	01 2e                	add    DWORD PTR [esi],ebp
 176:	3a 00                	cmp    al,BYTE PTR [eax]
 178:	00 00                	add    BYTE PTR [eax],al
 17a:	02 75 68             	add    dh,BYTE PTR [ebp+0x68]
 17d:	0a 17                	or     dl,BYTE PTR [edi]
 17f:	01 40 30             	add    DWORD PTR [eax+0x30],eax
 182:	52                   	push   edx
 183:	00 00                	add    BYTE PTR [eax],al
 185:	00 b0 01 00 00 09    	add    BYTE PTR [eax+0x9000001],dh
 18b:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 18e:	00 01                	add    BYTE PTR [ecx],al
 190:	2f                   	das    
 191:	3a 00                	cmp    al,BYTE PTR [eax]
 193:	00 00                	add    BYTE PTR [eax],al
 195:	02 75 64             	add    dh,BYTE PTR [ebp+0x64]
 198:	07                   	pop    es
 199:	32 01                	xor    al,BYTE PTR [ecx]
 19b:	40                   	inc    eax
 19c:	30 19                	xor    BYTE PTR [ecx],bl
 19e:	00 00                	add    BYTE PTR [eax],al
 1a0:	00 09                	add    BYTE PTR [ecx],cl
 1a2:	63 6e 00             	arpl   WORD PTR [esi+0x0],bp
 1a5:	01 35 3a 00 00 00    	add    DWORD PTR ds:0x3a,esi
 1ab:	02 75 48             	add    dh,BYTE PTR [ebp+0x48]
 1ae:	00 00                	add    BYTE PTR [eax],al
 1b0:	07                   	pop    es
 1b1:	8e 01                	mov    es,WORD PTR [ecx]
 1b3:	40                   	inc    eax
 1b4:	30 5f 00             	xor    BYTE PTR [edi+0x0],bl
 1b7:	00 00                	add    BYTE PTR [eax],al
 1b9:	08 73 01             	or     BYTE PTR [ebx+0x1],dh
 1bc:	00 00                	add    BYTE PTR [eax],al
 1be:	01 41 3a             	add    DWORD PTR [ecx+0x3a],eax
 1c1:	00 00                	add    BYTE PTR [eax],al
 1c3:	00 02                	add    BYTE PTR [edx],al
 1c5:	75 44                	jne    20b <sysEnter_Vector-0x12fdf5>
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
 1dd:	00 0d 81 00 00 00    	add    BYTE PTR ds:0x81,cl
 1e3:	03 75 58             	add    esi,DWORD PTR [ebp+0x58]
 1e6:	06                   	push   es
 1e7:	00 0c 3a             	add    BYTE PTR [edx+edi*1],cl
 1ea:	00 00                	add    BYTE PTR [eax],al
 1ec:	00 fb                	add    bl,bh
 1ee:	01 00                	add    DWORD PTR [eax],eax
 1f0:	00 0d 81 00 00 00    	add    BYTE PTR ds:0x81,cl
 1f6:	03 75 50             	add    esi,DWORD PTR [ebp+0x50]
 1f9:	06                   	push   es
 1fa:	00 0e                	add    BYTE PTR [esi],cl
 1fc:	27                   	daa    
 1fd:	01 00                	add    DWORD PTR [eax],eax
 1ff:	00 03                	add    BYTE PTR [ebx],al
 201:	33 c9                	xor    ecx,ecx
 203:	01 00                	add    DWORD PTR [eax],eax
 205:	00 05 03 e4 05 40    	add    BYTE PTR ds:0x4005e403,al
 20b:	30 0e                	xor    BYTE PTR [esi],cl
 20d:	56                   	push   esi
 20e:	01 00                	add    DWORD PTR [eax],eax
 210:	00 04 35 1d 02 00 00 	add    BYTE PTR [esi*1+0x21d],al
 217:	05 03 e0 05 40       	add    eax,0x4005e003
 21c:	30 0b                	xor    BYTE PTR [ebx],cl
 21e:	04 6f                	add    al,0x6f
 220:	00 00                	add    BYTE PTR [eax],al
 222:	00 0e                	add    BYTE PTR [esi],cl
 224:	7a 01                	jp     227 <sysEnter_Vector-0x12fdd9>
 226:	00 00                	add    BYTE PTR [eax],al
 228:	04 36                	add    al,0x36
 22a:	56                   	push   esi
 22b:	00 00                	add    BYTE PTR [eax],al
 22d:	00 05 03 dc 05 40    	add    BYTE PTR ds:0x4005dc03,al
 233:	30 0e                	xor    BYTE PTR [esi],cl
 235:	d1 00                	rol    DWORD PTR [eax],1
 237:	00 00                	add    BYTE PTR [eax],al
 239:	01 14 3a             	add    DWORD PTR [edx+edi*1],edx
 23c:	00 00                	add    BYTE PTR [eax],al
 23e:	00 05 03 28 05 40    	add    BYTE PTR ds:0x40052803,al
 244:	30 00                	xor    BYTE PTR [eax],al

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
  13:	30 16                	xor    BYTE PTR [esi],dl
  15:	02 00                	add    al,BYTE PTR [eax]
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	07                   	pop    es
   1:	01 00                	add    DWORD PTR [eax],eax
   3:	00 02                	add    BYTE PTR [edx],al
   5:	00 9a 00 00 00 01    	add    BYTE PTR [edx+0x1000000],bl
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
  8d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  90:	6d                   	ins    DWORD PTR es:[edi],dx
  91:	6f                   	outs   dx,DWORD PTR ds:[esi]
  92:	6e                   	outs   dx,BYTE PTR ds:[esi]
  93:	2e                   	cs
  94:	68 00 02 00 00       	push   0x200
  99:	66 69 6c 65 2e 68 00 	imul   bp,WORD PTR [ebp+eiz*2+0x2e],0x68
  a0:	02 00                	add    al,BYTE PTR [eax]
  a2:	00 00                	add    BYTE PTR [eax],al
  a4:	00 05 02 00 00 40    	add    BYTE PTR ds:0x40000002,al
  aa:	30 03                	xor    BYTE PTR [ebx],al
  ac:	16                   	push   ss
  ad:	01 67 93             	add    DWORD PTR [edi-0x6d],esp
  b0:	67 00 02             	add    BYTE PTR [bp+si],al
  b3:	04 02                	add    al,0x2
  b5:	c4 00                	les    eax,FWORD PTR [eax]
  b7:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
  ba:	06                   	push   es
  bb:	4a                   	dec    edx
  bc:	06                   	push   es
  bd:	6c                   	ins    BYTE PTR es:[edi],dx
  be:	08 59 3d             	or     BYTE PTR [ecx+0x3d],bl
  c1:	30 08                	xor    BYTE PTR [eax],cl
  c3:	3c 4c                	cmp    al,0x4c
  c5:	d7                   	xlat   BYTE PTR ds:[ebx]
  c6:	59                   	pop    ecx
  c7:	92                   	xchg   edx,eax
  c8:	08 68 02             	or     BYTE PTR [eax+0x2],ch
  cb:	38 13                	cmp    BYTE PTR [ebx],dl
  cd:	02 38                	add    bh,BYTE PTR [eax]
  cf:	13 75 75             	adc    esi,DWORD PTR [ebp+0x75]
  d2:	75 92                	jne    66 <sysEnter_Vector-0x12ff9a>
  d4:	83 4b 68 08          	or     DWORD PTR [ebx+0x68],0x8
  d8:	14 00                	adc    al,0x0
  da:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
  dd:	85 00                	test   DWORD PTR [eax],eax
  df:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
  e2:	03 75 08             	add    esi,DWORD PTR [ebp+0x8]
  e5:	20 00                	and    BYTE PTR [eax],al
  e7:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
  ea:	06                   	push   es
  eb:	4a                   	dec    edx
  ec:	06                   	push   es
  ed:	03 0e                	add    ecx,DWORD PTR [esi]
  ef:	82                   	(bad)  
  f0:	08 2f                	or     BYTE PTR [edi],ch
  f2:	f3 30 bc 08 91 08 13 	repz xor BYTE PTR [eax+ecx*1+0x2130891],bh
  f9:	02 
  fa:	24 13                	and    al,0x13
  fc:	03 79 4a             	add    edi,DWORD PTR [ecx+0x4a]
  ff:	03 09                	add    ecx,DWORD PTR [ecx]
 101:	82                   	(bad)  
 102:	f3 03 27             	repz add esp,DWORD PTR [edi]
 105:	74 02                	je     109 <sysEnter_Vector-0x12fef7>
 107:	0a 00                	or     al,BYTE PTR [eax]
 109:	01 01                	add    DWORD PTR [ecx],eax

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
  3c:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
  3f:	6f                   	outs   dx,DWORD PTR ds:[esi]
  40:	72 74                	jb     b6 <sysEnter_Vector-0x12ff4a>
  42:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
  45:	74 00                	je     47 <sysEnter_Vector-0x12ffb9>
  47:	73 69                	jae    b2 <sysEnter_Vector-0x12ff4e>
  49:	7a 65                	jp     b0 <sysEnter_Vector-0x12ff50>
  4b:	74 79                	je     c6 <sysEnter_Vector-0x12ff3a>
  4d:	70 65                	jo     b4 <sysEnter_Vector-0x12ff4c>
  4f:	00 70 69             	add    BYTE PTR [eax+0x69],dh
  52:	64                   	fs
  53:	43                   	inc    ebx
  54:	6f                   	outs   dx,DWORD PTR ds:[esi]
  55:	75 6e                	jne    c5 <sysEnter_Vector-0x12ff3b>
  57:	74 00                	je     59 <sysEnter_Vector-0x12ffa7>
  59:	6d                   	ins    DWORD PTR es:[edi],dx
  5a:	61                   	popa   
  5b:	69 6e 00 75 69 6e 74 	imul   ebp,DWORD PTR [esi+0x0],0x746e6975
  62:	70 74                	jo     d8 <sysEnter_Vector-0x12ff28>
  64:	72 5f                	jb     c5 <sysEnter_Vector-0x12ff3b>
  66:	74 00                	je     68 <sysEnter_Vector-0x12ff98>
  68:	6c                   	ins    BYTE PTR es:[edi],dx
  69:	6f                   	outs   dx,DWORD PTR ds:[esi]
  6a:	6e                   	outs   dx,BYTE PTR ds:[esi]
  6b:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  6f:	6e                   	outs   dx,BYTE PTR ds:[esi]
  70:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
  74:	74 00                	je     76 <sysEnter_Vector-0x12ff8a>
  76:	47                   	inc    edi
  77:	4e                   	dec    esi
  78:	55                   	push   ebp
  79:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  7c:	39 20                	cmp    DWORD PTR [eax],esp
  7e:	35 2e 33 2e 30       	xor    eax,0x302e332e
  83:	20 2d 6d 33 32 20    	and    BYTE PTR ds:0x2032336d,ch
  89:	2d 6d 61 73 6d       	sub    eax,0x6d73616d
  8e:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  93:	6c                   	ins    BYTE PTR es:[edi],dx
  94:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  9a:	65                   	gs
  9b:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  a0:	72 69                	jb     10b <sysEnter_Vector-0x12fef5>
  a2:	63 20                	arpl   WORD PTR [eax],sp
  a4:	2d 6d 61 72 63       	sub    eax,0x6372616d
  a9:	68 3d 70 65 6e       	push   0x6e65703d
  ae:	74 69                	je     119 <sysEnter_Vector-0x12fee7>
  b0:	75 6d                	jne    11f <sysEnter_Vector-0x12fee1>
  b2:	70 72                	jo     126 <sysEnter_Vector-0x12feda>
  b4:	6f                   	outs   dx,DWORD PTR ds:[esi]
  b5:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  bb:	74 64                	je     121 <sysEnter_Vector-0x12fedf>
  bd:	3d 63 39 39 20       	cmp    eax,0x20393963
  c2:	2d 66 66 72 65       	sub    eax,0x65726666
  c7:	65                   	gs
  c8:	73 74                	jae    13e <sysEnter_Vector-0x12fec2>
  ca:	61                   	popa   
  cb:	6e                   	outs   dx,BYTE PTR ds:[esi]
  cc:	64 69 6e 67 00 73 68 	imul   ebp,DWORD PTR fs:[esi+0x67],0x61687300
  d3:	61 
  d4:	72 65                	jb     13b <sysEnter_Vector-0x12fec5>
  d6:	64                   	fs
  d7:	43                   	inc    ebx
  d8:	6f                   	outs   dx,DWORD PTR ds:[esi]
  d9:	75 6e                	jne    149 <sysEnter_Vector-0x12feb7>
  db:	74 65                	je     142 <sysEnter_Vector-0x12febe>
  dd:	72 00                	jb     df <sysEnter_Vector-0x12ff21>
  df:	70 69                	jo     14a <sysEnter_Vector-0x12feb6>
  e1:	64 32 00             	xor    al,BYTE PTR fs:[eax]
  e4:	72 65                	jb     14b <sysEnter_Vector-0x12feb5>
  e6:	74 73                	je     15b <sysEnter_Vector-0x12fea5>
  e8:	00 6d 6d             	add    BYTE PTR [ebp+0x6d],ch
  eb:	61                   	popa   
  ec:	70 6d                	jo     15b <sysEnter_Vector-0x12fea5>
  ee:	61                   	popa   
  ef:	69 6e 2e 63 00 75 6e 	imul   ebp,DWORD PTR [esi+0x2e],0x6e750063
  f6:	73 69                	jae    161 <sysEnter_Vector-0x12fe9f>
  f8:	67 6e                	outs   dx,BYTE PTR ds:[si]
  fa:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
  ff:	61                   	popa   
 100:	72 00                	jb     102 <sysEnter_Vector-0x12fefe>
 102:	61                   	popa   
 103:	72 67                	jb     16c <sysEnter_Vector-0x12fe94>
 105:	63 00                	arpl   WORD PTR [eax],ax
 107:	6c                   	ins    BYTE PTR es:[edi],dx
 108:	6f                   	outs   dx,DWORD PTR ds:[esi]
 109:	6e                   	outs   dx,BYTE PTR ds:[esi]
 10a:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 10e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 10f:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 113:	73 69                	jae    17e <sysEnter_Vector-0x12fe82>
 115:	67 6e                	outs   dx,BYTE PTR ds:[si]
 117:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 11c:	74 00                	je     11e <sysEnter_Vector-0x12fee2>
 11e:	75 69                	jne    189 <sysEnter_Vector-0x12fe77>
 120:	6e                   	outs   dx,BYTE PTR ds:[esi]
 121:	74 33                	je     156 <sysEnter_Vector-0x12feaa>
 123:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 126:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 129:	6f                   	outs   dx,DWORD PTR ds:[esi]
 12a:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 12d:	73 45                	jae    174 <sysEnter_Vector-0x12fe8c>
 12f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 130:	76 70                	jbe    1a2 <sysEnter_Vector-0x12fe5e>
 132:	00 61 72             	add    BYTE PTR [ecx+0x72],ah
 135:	67 76 00             	addr16 jbe 138 <sysEnter_Vector-0x12fec8>
 138:	73 68                	jae    1a2 <sysEnter_Vector-0x12fe5e>
 13a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 13b:	72 74                	jb     1b1 <sysEnter_Vector-0x12fe4f>
 13d:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 140:	73 69                	jae    1ab <sysEnter_Vector-0x12fe55>
 142:	67 6e                	outs   dx,BYTE PTR ds:[si]
 144:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 149:	74 00                	je     14b <sysEnter_Vector-0x12feb5>
 14b:	5f                   	pop    edi
 14c:	42                   	inc    edx
 14d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 14e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 14f:	6c                   	ins    BYTE PTR es:[edi],dx
 150:	00 70 69             	add    BYTE PTR [eax+0x69],dh
 153:	64                   	fs
 154:	73 00                	jae    156 <sysEnter_Vector-0x12feaa>
 156:	66 69 6c 65 73 54 6f 	imul   bp,WORD PTR [ebp+eiz*2+0x73],0x6f54
 15d:	43                   	inc    ebx
 15e:	6c                   	ins    BYTE PTR es:[edi],dx
 15f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 160:	73 65                	jae    1c7 <sysEnter_Vector-0x12fe39>
 162:	00 64 6f 75          	add    BYTE PTR [edi+ebp*2+0x75],ah
 166:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 16a:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
 16d:	6c                   	ins    BYTE PTR es:[edi],dx
 16e:	64                   	fs
 16f:	4e                   	dec    esi
 170:	75 6d                	jne    1df <sysEnter_Vector-0x12fe21>
 172:	00 74 68 65          	add    BYTE PTR [eax+ebp*2+0x65],dh
 176:	50                   	push   eax
 177:	69 64 00 66 69 6c 65 	imul   esp,DWORD PTR [eax+eax*1+0x66],0x73656c69
 17e:	73 
 17f:	54                   	push   esp
 180:	6f                   	outs   dx,DWORD PTR ds:[esi]
 181:	43                   	inc    ebx
 182:	6c                   	ins    BYTE PTR es:[edi],dx
 183:	6f                   	outs   dx,DWORD PTR ds:[esi]
 184:	73 65                	jae    1eb <sysEnter_Vector-0x12fe15>
 186:	43                   	inc    ebx
 187:	6f                   	outs   dx,DWORD PTR ds:[esi]
 188:	75 6e                	jne    1f8 <sysEnter_Vector-0x12fe08>
 18a:	74 00                	je     18c <sysEnter_Vector-0x12fe74>
 18c:	70 69                	jo     1f7 <sysEnter_Vector-0x12fe09>
 18e:	64                   	fs
 18f:	73 50                	jae    1e1 <sysEnter_Vector-0x12fe1f>
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
