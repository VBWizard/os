
Debug/GNU-Linux/kshell:     file format elf32-i386


Disassembly of section .text:

03100000 <cmdClearScreen>:
cmdClearScreen():
/home/yogi/src/os/aproj/kshell/src/commands.c:11


#include "kshell.h"

void cmdClearScreen()
{
 3100000:	55                   	push   ebp
 3100001:	89 e5                	mov    ebp,esp
 3100003:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:12
    printf("\033[2J");
 3100006:	83 ec 0c             	sub    esp,0xc
 3100009:	68 45 14 10 03       	push   0x3101445
 310000e:	e8 6d 11 00 00       	call   3101180 <kShell+0x40c>
 3100013:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:13
}
 3100016:	90                   	nop
 3100017:	c9                   	leave  
 3100018:	c3                   	ret    

03100019 <cmdPrintEnv>:
cmdPrintEnv():
/home/yogi/src/os/aproj/kshell/src/commands.c:16

void cmdPrintEnv()
{
 3100019:	55                   	push   ebp
 310001a:	89 e5                	mov    ebp,esp
 310001c:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:17
    for (int cnt=0;cnt<100;cnt++)
 310001f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100026:	eb 37                	jmp    310005f <cmdPrintEnv+0x46>
/home/yogi/src/os/aproj/kshell/src/commands.c:19
    {
        if (environmentLoc[cnt]!=0)
 3100028:	a1 68 21 10 03       	mov    eax,ds:0x3102168
 310002d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100030:	c1 e2 02             	shl    edx,0x2
 3100033:	01 d0                	add    eax,edx
 3100035:	8b 00                	mov    eax,DWORD PTR [eax]
 3100037:	85 c0                	test   eax,eax
 3100039:	74 20                	je     310005b <cmdPrintEnv+0x42>
/home/yogi/src/os/aproj/kshell/src/commands.c:21
        {
            print("%s\n",environmentLoc[cnt]);
 310003b:	a1 68 21 10 03       	mov    eax,ds:0x3102168
 3100040:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100043:	c1 e2 02             	shl    edx,0x2
 3100046:	01 d0                	add    eax,edx
 3100048:	8b 00                	mov    eax,DWORD PTR [eax]
 310004a:	83 ec 08             	sub    esp,0x8
 310004d:	50                   	push   eax
 310004e:	68 4a 14 10 03       	push   0x310144a
 3100053:	e8 18 11 00 00       	call   3101170 <kShell+0x3fc>
 3100058:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:17 (discriminator 2)
    printf("\033[2J");
}

void cmdPrintEnv()
{
    for (int cnt=0;cnt<100;cnt++)
 310005b:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:17 (discriminator 1)
 310005f:	83 7d f4 63          	cmp    DWORD PTR [ebp-0xc],0x63
 3100063:	7e c3                	jle    3100028 <cmdPrintEnv+0xf>
/home/yogi/src/os/aproj/kshell/src/commands.c:25
        {
            print("%s\n",environmentLoc[cnt]);
        }
    }
   
}
 3100065:	90                   	nop
 3100066:	c9                   	leave  
 3100067:	c3                   	ret    

03100068 <cmdSetEnv>:
cmdSetEnv():
/home/yogi/src/os/aproj/kshell/src/commands.c:28

void cmdSetEnv(char* cmdline)
{
 3100068:	55                   	push   ebp
 3100069:	89 e5                	mov    ebp,esp
 310006b:	81 ec 28 05 00 00    	sub    esp,0x528
/home/yogi/src/os/aproj/kshell/src/commands.c:32
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    char *varName, *varValue;
    
    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 3100071:	83 ec 04             	sub    esp,0x4
 3100074:	68 00 05 00 00       	push   0x500
 3100079:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 310007f:	50                   	push   eax
 3100080:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100083:	e8 96 06 00 00       	call   310071e <parseParamsShell>
 3100088:	83 c4 10             	add    esp,0x10
 310008b:	85 c0                	test   eax,eax
 310008d:	0f 84 2b 01 00 00    	je     31001be <cmdSetEnv+0x156>
/home/yogi/src/os/aproj/kshell/src/commands.c:34
    {
        int nameLen=0, valueLen=0;
 3100093:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310009a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:35
        int found=(uintptr_t)strstr(params[0],"=");
 31000a1:	83 ec 08             	sub    esp,0x8
 31000a4:	68 4e 14 10 03       	push   0x310144e
 31000a9:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000af:	50                   	push   eax
 31000b0:	e8 8b 11 00 00       	call   3101240 <kShell+0x4cc>
 31000b5:	83 c4 10             	add    esp,0x10
 31000b8:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:36
        if (found==0)
 31000bb:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31000bf:	75 15                	jne    31000d6 <cmdSetEnv+0x6e>
/home/yogi/src/os/aproj/kshell/src/commands.c:38
        {
            print("Usage: set variable=value\n");
 31000c1:	83 ec 0c             	sub    esp,0xc
 31000c4:	68 50 14 10 03       	push   0x3101450
 31000c9:	e8 a2 10 00 00       	call   3101170 <kShell+0x3fc>
 31000ce:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:39
            return;
 31000d1:	e9 ed 00 00 00       	jmp    31001c3 <cmdSetEnv+0x15b>
/home/yogi/src/os/aproj/kshell/src/commands.c:41
        }
        nameLen=found-(uintptr_t)params[0];
 31000d6:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 31000d9:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000df:	29 c2                	sub    edx,eax
 31000e1:	89 d0                	mov    eax,edx
 31000e3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:42
        valueLen=strlen(params[0])-nameLen-1;
 31000e6:	83 ec 0c             	sub    esp,0xc
 31000e9:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000ef:	50                   	push   eax
 31000f0:	e8 eb 11 00 00       	call   31012e0 <kShell+0x56c>
 31000f5:	83 c4 10             	add    esp,0x10
 31000f8:	89 c2                	mov    edx,eax
 31000fa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31000fd:	29 c2                	sub    edx,eax
 31000ff:	89 d0                	mov    eax,edx
 3100101:	83 e8 01             	sub    eax,0x1
 3100104:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:43
        varName = malloc(nameLen+1);
 3100107:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310010a:	83 c0 01             	add    eax,0x1
 310010d:	83 ec 0c             	sub    esp,0xc
 3100110:	50                   	push   eax
 3100111:	e8 ba 10 00 00       	call   31011d0 <kShell+0x45c>
 3100116:	83 c4 10             	add    esp,0x10
 3100119:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:44
        varValue = malloc(valueLen);
 310011c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310011f:	83 ec 0c             	sub    esp,0xc
 3100122:	50                   	push   eax
 3100123:	e8 a8 10 00 00       	call   31011d0 <kShell+0x45c>
 3100128:	83 c4 10             	add    esp,0x10
 310012b:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:45
        strncpy(varName,params[0],nameLen);
 310012e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100131:	83 ec 04             	sub    esp,0x4
 3100134:	50                   	push   eax
 3100135:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 310013b:	50                   	push   eax
 310013c:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 310013f:	e8 1c 11 00 00       	call   3101260 <kShell+0x4ec>
 3100144:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:46
        varName[nameLen]=0;
 3100147:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 310014a:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 310014d:	01 d0                	add    eax,edx
 310014f:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:47
        strncpy(varValue,params[0]+nameLen+1,valueLen);
 3100152:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100155:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100158:	8d 4a 01             	lea    ecx,[edx+0x1]
 310015b:	8d 95 e4 fa ff ff    	lea    edx,[ebp-0x51c]
 3100161:	01 ca                	add    edx,ecx
 3100163:	83 ec 04             	sub    esp,0x4
 3100166:	50                   	push   eax
 3100167:	52                   	push   edx
 3100168:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 310016b:	e8 f0 10 00 00       	call   3101260 <kShell+0x4ec>
 3100170:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:48
        strtrim(varName);
 3100173:	83 ec 0c             	sub    esp,0xc
 3100176:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100179:	e8 32 11 00 00       	call   31012b0 <kShell+0x53c>
 310017e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:49
        strtrim(varValue);
 3100181:	83 ec 0c             	sub    esp,0xc
 3100184:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100187:	e8 24 11 00 00       	call   31012b0 <kShell+0x53c>
 310018c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:50
        setenv(varName, varValue);
 310018f:	83 ec 08             	sub    esp,0x8
 3100192:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100195:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100198:	e8 d3 10 00 00       	call   3101270 <kShell+0x4fc>
 310019d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:51
        free(varName);
 31001a0:	83 ec 0c             	sub    esp,0xc
 31001a3:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31001a6:	e8 55 11 00 00       	call   3101300 <kShell+0x58c>
 31001ab:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:52
        free(varValue);
 31001ae:	83 ec 0c             	sub    esp,0xc
 31001b1:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31001b4:	e8 47 11 00 00       	call   3101300 <kShell+0x58c>
 31001b9:	83 c4 10             	add    esp,0x10
 31001bc:	eb 05                	jmp    31001c3 <cmdSetEnv+0x15b>
/home/yogi/src/os/aproj/kshell/src/commands.c:55
    }
    else
        cmdPrintEnv();
 31001be:	e8 56 fe ff ff       	call   3100019 <cmdPrintEnv>
/home/yogi/src/os/aproj/kshell/src/commands.c:56
}
 31001c3:	c9                   	leave  
 31001c4:	c3                   	ret    

031001c5 <kexec>:
kexec():
/home/yogi/src/os/aproj/kshell/src/commands.c:59

int kexec(char* path, int argc, char** argv, bool background)
{
 31001c5:	55                   	push   ebp
 31001c6:	89 e5                	mov    ebp,esp
 31001c8:	83 ec 28             	sub    esp,0x28
 31001cb:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 31001ce:	88 45 e4             	mov    BYTE PTR [ebp-0x1c],al
/home/yogi/src/os/aproj/kshell/src/commands.c:60
    int pid=execa(path,argc,argv);
 31001d1:	83 ec 04             	sub    esp,0x4
 31001d4:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 31001d7:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31001da:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31001dd:	e8 0e 11 00 00       	call   31012f0 <kShell+0x57c>
 31001e2:	83 c4 10             	add    esp,0x10
 31001e5:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:62

    if (pid>0)
 31001e8:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31001ec:	7e 4c                	jle    310023a <kexec+0x75>
/home/yogi/src/os/aproj/kshell/src/commands.c:64
    {
        if (!background)
 31001ee:	0f b6 45 e4          	movzx  eax,BYTE PTR [ebp-0x1c]
 31001f2:	83 f0 01             	xor    eax,0x1
 31001f5:	84 c0                	test   al,al
 31001f7:	74 54                	je     310024d <kexec+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:67
        {
            //print("DEBUG1: waitpid = %08X\n",&waitpid);
            lastExecExitCode = waitpid(pid);
 31001f9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001fc:	83 ec 0c             	sub    esp,0xc
 31001ff:	50                   	push   eax
 3100200:	e8 5b 0f 00 00       	call   3101160 <kShell+0x3ec>
 3100205:	83 c4 10             	add    esp,0x10
 3100208:	a3 98 24 10 03       	mov    ds:0x3102498,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:69
            char ret[10];
            itoa(lastExecExitCode,ret);
 310020d:	a1 98 24 10 03       	mov    eax,ds:0x3102498
 3100212:	89 c2                	mov    edx,eax
 3100214:	83 ec 08             	sub    esp,0x8
 3100217:	8d 45 ea             	lea    eax,[ebp-0x16]
 310021a:	50                   	push   eax
 310021b:	52                   	push   edx
 310021c:	e8 ef 0f 00 00       	call   3101210 <kShell+0x49c>
 3100221:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:70
            setenv("LASTEXIT",ret);
 3100224:	83 ec 08             	sub    esp,0x8
 3100227:	8d 45 ea             	lea    eax,[ebp-0x16]
 310022a:	50                   	push   eax
 310022b:	68 6b 14 10 03       	push   0x310146b
 3100230:	e8 3b 10 00 00       	call   3101270 <kShell+0x4fc>
 3100235:	83 c4 10             	add    esp,0x10
 3100238:	eb 13                	jmp    310024d <kexec+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:74
        }
    }
    else
        print("Error executing %s\n",path);
 310023a:	83 ec 08             	sub    esp,0x8
 310023d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100240:	68 74 14 10 03       	push   0x3101474
 3100245:	e8 26 0f 00 00       	call   3101170 <kShell+0x3fc>
 310024a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:76

}
 310024d:	90                   	nop
 310024e:	c9                   	leave  
 310024f:	c3                   	ret    

03100250 <execTime>:
execTime():
/home/yogi/src/os/aproj/kshell/src/commands.c:79

int execTime(char* cmdline, bool timeIt)
{
 3100250:	55                   	push   ebp
 3100251:	89 e5                	mov    ebp,esp
 3100253:	81 ec 58 05 00 00    	sub    esp,0x558
 3100259:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310025c:	88 85 b4 fa ff ff    	mov    BYTE PTR [ebp-0x54c],al
/home/yogi/src/os/aproj/kshell/src/commands.c:80
    bool background=false;
 3100262:	c6 45 f3 00          	mov    BYTE PTR [ebp-0xd],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:81
    int forkPid=0;
 3100266:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:83
    char* tok;
    char* pgm=NULL;
 310026d:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:86

    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 3100274:	83 ec 04             	sub    esp,0x4
 3100277:	68 00 05 00 00       	push   0x500
 310027c:	8d 85 cc fa ff ff    	lea    eax,[ebp-0x534]
 3100282:	50                   	push   eax
 3100283:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100286:	e8 93 04 00 00       	call   310071e <parseParamsShell>
 310028b:	83 c4 10             	add    esp,0x10
 310028e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:87
    int execParamCount=0;
 3100291:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:88
    int pcount=1;
 3100298:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:92
    struct tm *startTime, *endTime;
    uint32_t startTicks, endTicks;
    
    if (paramCount==0)
 310029f:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 31002a3:	75 0a                	jne    31002af <execTime+0x5f>
/home/yogi/src/os/aproj/kshell/src/commands.c:93
        return -3;
 31002a5:	b8 fd ff ff ff       	mov    eax,0xfffffffd
 31002aa:	e9 53 01 00 00       	jmp    3100402 <execTime+0x1b2>
/home/yogi/src/os/aproj/kshell/src/commands.c:95

    int argc = 0;
 31002af:	c7 85 c8 fa ff ff 00 	mov    DWORD PTR [ebp-0x538],0x0
 31002b6:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:98
    char **argv;
    
    argv = cmdlineToArgv(cmdline, &argc);
 31002b9:	83 ec 08             	sub    esp,0x8
 31002bc:	8d 85 c8 fa ff ff    	lea    eax,[ebp-0x538]
 31002c2:	50                   	push   eax
 31002c3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31002c6:	e8 25 0f 00 00       	call   31011f0 <kShell+0x47c>
 31002cb:	83 c4 10             	add    esp,0x10
 31002ce:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:101
            
//    print ("Executing %s\n",pgm);
    startTicks=getticks();
 31002d1:	e8 4a 0f 00 00       	call   3101220 <kShell+0x4ac>
 31002d6:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:103
    
    forkPid = fork();
 31002d9:	e8 b2 0f 00 00       	call   3101290 <kShell+0x51c>
 31002de:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:105
    
    if (forkPid == 0)
 31002e1:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31002e5:	75 52                	jne    3100339 <execTime+0xe9>
/home/yogi/src/os/aproj/kshell/src/commands.c:108
    {
        int retVal;
        int childPid = exec(argv[0], argc, argv);
 31002e7:	8b 95 c8 fa ff ff    	mov    edx,DWORD PTR [ebp-0x538]
 31002ed:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31002f0:	8b 00                	mov    eax,DWORD PTR [eax]
 31002f2:	83 ec 04             	sub    esp,0x4
 31002f5:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31002f8:	52                   	push   edx
 31002f9:	50                   	push   eax
 31002fa:	e8 31 0f 00 00       	call   3101230 <kShell+0x4bc>
 31002ff:	83 c4 10             	add    esp,0x10
 3100302:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:110
        
        if (childPid > 0)
 3100305:	83 7d d0 00          	cmp    DWORD PTR [ebp-0x30],0x0
 3100309:	7e 14                	jle    310031f <execTime+0xcf>
/home/yogi/src/os/aproj/kshell/src/commands.c:112
        {
            retVal = waitpid(childPid);
 310030b:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 310030e:	83 ec 0c             	sub    esp,0xc
 3100311:	50                   	push   eax
 3100312:	e8 49 0e 00 00       	call   3101160 <kShell+0x3ec>
 3100317:	83 c4 10             	add    esp,0x10
 310031a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 310031d:	eb 07                	jmp    3100326 <execTime+0xd6>
/home/yogi/src/os/aproj/kshell/src/commands.c:115
        }
        else
            retVal = 0xBADBADBA;
 310031f:	c7 45 f4 ba ad db ba 	mov    DWORD PTR [ebp-0xc],0xbadbadba
/home/yogi/src/os/aproj/kshell/src/commands.c:116
        exit(retVal);
 3100326:	83 ec 0c             	sub    esp,0xc
 3100329:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 310032c:	e8 9f 0f 00 00       	call   31012d0 <kShell+0x55c>
 3100331:	83 c4 10             	add    esp,0x10
 3100334:	e9 ad 00 00 00       	jmp    31003e6 <execTime+0x196>
/home/yogi/src/os/aproj/kshell/src/commands.c:118
    }
    else if (forkPid < 0)
 3100339:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310033d:	79 18                	jns    3100357 <execTime+0x107>
/home/yogi/src/os/aproj/kshell/src/commands.c:119
        print("Fork error %u", forkPid);
 310033f:	83 ec 08             	sub    esp,0x8
 3100342:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100345:	68 88 14 10 03       	push   0x3101488
 310034a:	e8 21 0e 00 00       	call   3101170 <kShell+0x3fc>
 310034f:	83 c4 10             	add    esp,0x10
 3100352:	e9 8f 00 00 00       	jmp    31003e6 <execTime+0x196>
/home/yogi/src/os/aproj/kshell/src/commands.c:122
    else
    {
            lastExecExitCode = waitpid(forkPid);
 3100357:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 310035a:	83 ec 0c             	sub    esp,0xc
 310035d:	50                   	push   eax
 310035e:	e8 fd 0d 00 00       	call   3101160 <kShell+0x3ec>
 3100363:	83 c4 10             	add    esp,0x10
 3100366:	a3 98 24 10 03       	mov    ds:0x3102498,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:123
            if (lastExecExitCode == 0xBADBADBA)
 310036b:	a1 98 24 10 03       	mov    eax,ds:0x3102498
 3100370:	3d ba ad db ba       	cmp    eax,0xbadbadba
 3100375:	75 16                	jne    310038d <execTime+0x13d>
/home/yogi/src/os/aproj/kshell/src/commands.c:124
                print("execTime: Cannot execute %s\n",argv[0]);
 3100377:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 310037a:	8b 00                	mov    eax,DWORD PTR [eax]
 310037c:	83 ec 08             	sub    esp,0x8
 310037f:	50                   	push   eax
 3100380:	68 96 14 10 03       	push   0x3101496
 3100385:	e8 e6 0d 00 00       	call   3101170 <kShell+0x3fc>
 310038a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:125
            if (timeIt)
 310038d:	80 bd b4 fa ff ff 00 	cmp    BYTE PTR [ebp-0x54c],0x0
 3100394:	74 1f                	je     31003b5 <execTime+0x165>
/home/yogi/src/os/aproj/kshell/src/commands.c:127
            {
                endTicks=getticks();
 3100396:	e8 85 0e 00 00       	call   3101220 <kShell+0x4ac>
 310039b:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:128
                print("%u ticks\n",endTicks-startTicks);
 310039e:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 31003a1:	2b 45 d4             	sub    eax,DWORD PTR [ebp-0x2c]
 31003a4:	83 ec 08             	sub    esp,0x8
 31003a7:	50                   	push   eax
 31003a8:	68 b3 14 10 03       	push   0x31014b3
 31003ad:	e8 be 0d 00 00       	call   3101170 <kShell+0x3fc>
 31003b2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:131
            }
            char ret[10];
            itoa(lastExecExitCode,ret);
 31003b5:	a1 98 24 10 03       	mov    eax,ds:0x3102498
 31003ba:	89 c2                	mov    edx,eax
 31003bc:	83 ec 08             	sub    esp,0x8
 31003bf:	8d 85 be fa ff ff    	lea    eax,[ebp-0x542]
 31003c5:	50                   	push   eax
 31003c6:	52                   	push   edx
 31003c7:	e8 44 0e 00 00       	call   3101210 <kShell+0x49c>
 31003cc:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:132
            setenv("LASTEXIT",ret);    
 31003cf:	83 ec 08             	sub    esp,0x8
 31003d2:	8d 85 be fa ff ff    	lea    eax,[ebp-0x542]
 31003d8:	50                   	push   eax
 31003d9:	68 6b 14 10 03       	push   0x310146b
 31003de:	e8 8d 0e 00 00       	call   3101270 <kShell+0x4fc>
 31003e3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:135 (discriminator 1)
    }
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    free(argv);
 31003e6:	83 ec 0c             	sub    esp,0xc
 31003e9:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31003ec:	e8 0f 0f 00 00       	call   3101300 <kShell+0x58c>
 31003f1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:136 (discriminator 1)
    free(pgm);
 31003f4:	83 ec 0c             	sub    esp,0xc
 31003f7:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31003fa:	e8 01 0f 00 00       	call   3101300 <kShell+0x58c>
 31003ff:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:138
    
}
 3100402:	c9                   	leave  
 3100403:	c3                   	ret    

03100404 <cmdTime>:
cmdTime():
/home/yogi/src/os/aproj/kshell/src/commands.c:140
void cmdTime(char* cmdline)
{
 3100404:	55                   	push   ebp
 3100405:	89 e5                	mov    ebp,esp
 3100407:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:141
    execTime(cmdline,true);
 310040a:	83 ec 08             	sub    esp,0x8
 310040d:	6a 01                	push   0x1
 310040f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100412:	e8 39 fe ff ff       	call   3100250 <execTime>
 3100417:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:142
}
 310041a:	90                   	nop
 310041b:	c9                   	leave  
 310041c:	c3                   	ret    

0310041d <cmdRepeat>:
cmdRepeat():
/home/yogi/src/os/aproj/kshell/src/commands.c:145

void cmdRepeat(char * cmdline)
{
 310041d:	55                   	push   ebp
 310041e:	89 e5                	mov    ebp,esp
 3100420:	83 ec 28             	sub    esp,0x28
/home/yogi/src/os/aproj/kshell/src/commands.c:146
    int argc = 0;
 3100423:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:148
    char **argv;
    int count = 0;
 310042a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:149
    char *newCmdLine=cmdline+3;
 3100431:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100434:	83 c0 03             	add    eax,0x3
 3100437:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:150
    argv = cmdlineToArgv(cmdline, &argc);
 310043a:	83 ec 08             	sub    esp,0x8
 310043d:	8d 45 e4             	lea    eax,[ebp-0x1c]
 3100440:	50                   	push   eax
 3100441:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100444:	e8 a7 0d 00 00       	call   31011f0 <kShell+0x47c>
 3100449:	83 c4 10             	add    esp,0x10
 310044c:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:152
    
    count = argv[1];
 310044f:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 3100452:	83 c0 04             	add    eax,0x4
 3100455:	8b 00                	mov    eax,DWORD PTR [eax]
 3100457:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:154

    for (int cnt=0;cnt<count;cnt++)
 310045a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100461:	eb 14                	jmp    3100477 <cmdRepeat+0x5a>
/home/yogi/src/os/aproj/kshell/src/commands.c:155 (discriminator 3)
        execTime(newCmdLine,false);
 3100463:	83 ec 08             	sub    esp,0x8
 3100466:	6a 00                	push   0x0
 3100468:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310046b:	e8 e0 fd ff ff       	call   3100250 <execTime>
 3100470:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:154 (discriminator 3)
    char *newCmdLine=cmdline+3;
    argv = cmdlineToArgv(cmdline, &argc);
    
    count = argv[1];

    for (int cnt=0;cnt<count;cnt++)
 3100473:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:154 (discriminator 1)
 3100477:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310047a:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 310047d:	7c e4                	jl     3100463 <cmdRepeat+0x46>
/home/yogi/src/os/aproj/kshell/src/commands.c:157
        execTime(newCmdLine,false);
    
}
 310047f:	90                   	nop
 3100480:	c9                   	leave  
 3100481:	c3                   	ret    

03100482 <cmdExecp>:
cmdExecp():
/home/yogi/src/os/aproj/kshell/src/commands.c:160

void cmdExecp(char* cmdline)
{
 3100482:	55                   	push   ebp
 3100483:	89 e5                	mov    ebp,esp
 3100485:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:161
    execTime(cmdline,false);
 3100488:	83 ec 08             	sub    esp,0x8
 310048b:	6a 00                	push   0x0
 310048d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100490:	e8 bb fd ff ff       	call   3100250 <execTime>
 3100495:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:162
}
 3100498:	90                   	nop
 3100499:	c9                   	leave  
 310049a:	c3                   	ret    

0310049b <cmdExit>:
cmdExit():
/home/yogi/src/os/aproj/kshell/src/commands.c:165

void cmdExit(char *cmdline)
{
 310049b:	55                   	push   ebp
 310049c:	89 e5                	mov    ebp,esp
 310049e:	81 ec 08 05 00 00    	sub    esp,0x508
/home/yogi/src/os/aproj/kshell/src/commands.c:168
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 31004a4:	83 ec 04             	sub    esp,0x4
 31004a7:	68 00 05 00 00       	push   0x500
 31004ac:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 31004b2:	50                   	push   eax
 31004b3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31004b6:	e8 63 02 00 00       	call   310071e <parseParamsShell>
 31004bb:	83 c4 10             	add    esp,0x10
 31004be:	85 c0                	test   eax,eax
 31004c0:	74 1d                	je     31004df <cmdExit+0x44>
/home/yogi/src/os/aproj/kshell/src/commands.c:170
    {
        exitCode = strtoul(params[0],0,10);
 31004c2:	83 ec 04             	sub    esp,0x4
 31004c5:	6a 0a                	push   0xa
 31004c7:	6a 00                	push   0x0
 31004c9:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 31004cf:	50                   	push   eax
 31004d0:	e8 2b 0d 00 00       	call   3101200 <kShell+0x48c>
 31004d5:	83 c4 10             	add    esp,0x10
 31004d8:	a3 9c 24 10 03       	mov    ds:0x310249c,eax
 31004dd:	eb 0a                	jmp    31004e9 <cmdExit+0x4e>
/home/yogi/src/os/aproj/kshell/src/commands.c:173
    }
    else
        exitCode = 0;
 31004df:	c7 05 9c 24 10 03 00 	mov    DWORD PTR ds:0x310249c,0x0
 31004e6:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:174
    timeToExit=true;
 31004e9:	c6 05 a8 24 10 03 01 	mov    BYTE PTR ds:0x31024a8,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:175
}
 31004f0:	90                   	nop
 31004f1:	c9                   	leave  
 31004f2:	c3                   	ret    

031004f3 <cmdHelp>:
cmdHelp():
/home/yogi/src/os/aproj/kshell/src/commands.c:178

void cmdHelp(char *cmdline)
{
 31004f3:	55                   	push   ebp
 31004f4:	89 e5                	mov    ebp,esp
 31004f6:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:181
    char* tok;
    
    tok=strtok(cmdline,delim);
 31004f9:	83 ec 08             	sub    esp,0x8
 31004fc:	68 60 21 10 03       	push   0x3102160
 3100501:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100504:	e8 77 0d 00 00       	call   3101280 <kShell+0x50c>
 3100509:	83 c4 10             	add    esp,0x10
 310050c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:188
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
 310050f:	83 ec 08             	sub    esp,0x8
 3100512:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100515:	68 bd 14 10 03       	push   0x31014bd
 310051a:	e8 51 0c 00 00       	call   3101170 <kShell+0x3fc>
 310051f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:189
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100522:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100529:	e9 86 00 00 00       	jmp    31005b4 <cmdHelp+0xc1>
/home/yogi/src/os/aproj/kshell/src/commands.c:190
        if (tok!=NULL)
 310052e:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100532:	74 50                	je     3100584 <cmdHelp+0x91>
/home/yogi/src/os/aproj/kshell/src/commands.c:192
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
 3100534:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100537:	c1 e0 04             	shl    eax,0x4
 310053a:	05 00 1f 10 03       	add    eax,0x3101f00
 310053f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100541:	83 ec 04             	sub    esp,0x4
 3100544:	6a 64                	push   0x64
 3100546:	50                   	push   eax
 3100547:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310054a:	e8 01 0d 00 00       	call   3101250 <kShell+0x4dc>
 310054f:	83 c4 10             	add    esp,0x10
 3100552:	85 c0                	test   eax,eax
 3100554:	75 5a                	jne    31005b0 <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:193
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100556:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100559:	c1 e0 04             	shl    eax,0x4
 310055c:	05 04 1f 10 03       	add    eax,0x3101f04
 3100561:	8b 10                	mov    edx,DWORD PTR [eax]
 3100563:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100566:	c1 e0 04             	shl    eax,0x4
 3100569:	05 00 1f 10 03       	add    eax,0x3101f00
 310056e:	8b 00                	mov    eax,DWORD PTR [eax]
 3100570:	83 ec 04             	sub    esp,0x4
 3100573:	52                   	push   edx
 3100574:	50                   	push   eax
 3100575:	68 c7 14 10 03       	push   0x31014c7
 310057a:	e8 f1 0b 00 00       	call   3101170 <kShell+0x3fc>
 310057f:	83 c4 10             	add    esp,0x10
 3100582:	eb 2c                	jmp    31005b0 <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:197
        }
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100584:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100587:	c1 e0 04             	shl    eax,0x4
 310058a:	05 04 1f 10 03       	add    eax,0x3101f04
 310058f:	8b 10                	mov    edx,DWORD PTR [eax]
 3100591:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100594:	c1 e0 04             	shl    eax,0x4
 3100597:	05 00 1f 10 03       	add    eax,0x3101f00
 310059c:	8b 00                	mov    eax,DWORD PTR [eax]
 310059e:	83 ec 04             	sub    esp,0x4
 31005a1:	52                   	push   edx
 31005a2:	50                   	push   eax
 31005a3:	68 c7 14 10 03       	push   0x31014c7
 31005a8:	e8 c3 0b 00 00       	call   3101170 <kShell+0x3fc>
 31005ad:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:189 (discriminator 2)
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 31005b0:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:189 (discriminator 1)
 31005b4:	83 7d f4 09          	cmp    DWORD PTR [ebp-0xc],0x9
 31005b8:	0f 86 70 ff ff ff    	jbe    310052e <cmdHelp+0x3b>
/home/yogi/src/os/aproj/kshell/src/commands.c:200
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
    
}
 31005be:	90                   	nop
 31005bf:	c9                   	leave  
 31005c0:	c3                   	ret    

031005c1 <cmdPwd>:
cmdPwd():
/home/yogi/src/os/aproj/kshell/src/commands.c:203

void cmdPwd()
{
 31005c1:	55                   	push   ebp
 31005c2:	89 e5                	mov    ebp,esp
 31005c4:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:204
    char* buf=malloc(512);
 31005c7:	83 ec 0c             	sub    esp,0xc
 31005ca:	68 00 02 00 00       	push   0x200
 31005cf:	e8 fc 0b 00 00       	call   31011d0 <kShell+0x45c>
 31005d4:	83 c4 10             	add    esp,0x10
 31005d7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:205
    print("%s\n",getcwd(buf,512));
 31005da:	83 ec 08             	sub    esp,0x8
 31005dd:	68 00 02 00 00       	push   0x200
 31005e2:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 31005e5:	e8 d6 0c 00 00       	call   31012c0 <kShell+0x54c>
 31005ea:	83 c4 10             	add    esp,0x10
 31005ed:	83 ec 08             	sub    esp,0x8
 31005f0:	50                   	push   eax
 31005f1:	68 4a 14 10 03       	push   0x310144a
 31005f6:	e8 75 0b 00 00       	call   3101170 <kShell+0x3fc>
 31005fb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:206
    free(buf);
 31005fe:	83 ec 0c             	sub    esp,0xc
 3100601:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100604:	e8 f7 0c 00 00       	call   3101300 <kShell+0x58c>
 3100609:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:207
}
 310060c:	90                   	nop
 310060d:	c9                   	leave  
 310060e:	c3                   	ret    

0310060f <cmdSleep>:
cmdSleep():
/home/yogi/src/os/aproj/kshell/src/commands.c:210

void cmdSleep(char *cmdline)
{
 310060f:	55                   	push   ebp
 3100610:	89 e5                	mov    ebp,esp
 3100612:	81 ec 18 05 00 00    	sub    esp,0x518
/home/yogi/src/os/aproj/kshell/src/commands.c:212
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 3100618:	83 ec 04             	sub    esp,0x4
 310061b:	68 00 05 00 00       	push   0x500
 3100620:	8d 85 f4 fa ff ff    	lea    eax,[ebp-0x50c]
 3100626:	50                   	push   eax
 3100627:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310062a:	e8 ef 00 00 00       	call   310071e <parseParamsShell>
 310062f:	83 c4 10             	add    esp,0x10
 3100632:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:214

    if (params[0][0]==0)
 3100635:	0f b6 85 f4 fa ff ff 	movzx  eax,BYTE PTR [ebp-0x50c]
 310063c:	84 c0                	test   al,al
 310063e:	75 12                	jne    3100652 <cmdSleep+0x43>
/home/yogi/src/os/aproj/kshell/src/commands.c:216
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 3100640:	83 ec 0c             	sub    esp,0xc
 3100643:	68 d0 14 10 03       	push   0x31014d0
 3100648:	e8 23 0b 00 00       	call   3101170 <kShell+0x3fc>
 310064d:	83 c4 10             	add    esp,0x10
 3100650:	eb 22                	jmp    3100674 <cmdSleep+0x65>
/home/yogi/src/os/aproj/kshell/src/commands.c:220
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 3100652:	83 ec 04             	sub    esp,0x4
 3100655:	6a 0a                	push   0xa
 3100657:	6a 00                	push   0x0
 3100659:	8d 85 f4 fa ff ff    	lea    eax,[ebp-0x50c]
 310065f:	50                   	push   eax
 3100660:	e8 9b 0b 00 00       	call   3101200 <kShell+0x48c>
 3100665:	83 c4 10             	add    esp,0x10
 3100668:	83 ec 0c             	sub    esp,0xc
 310066b:	50                   	push   eax
 310066c:	e8 6f 0b 00 00       	call   31011e0 <kShell+0x46c>
 3100671:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:221
}
 3100674:	c9                   	leave  
 3100675:	c3                   	ret    
 3100676:	66 90                	xchg   ax,ax

03100678 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:25
void execInternalCommand(char lCommand[256]);
int findCommand(char* command);
char **buildargv (const char *input);

void execInternalCommand(char lCommand[256])
{
 3100678:	55                   	push   ebp
 3100679:	89 e5                	mov    ebp,esp
 310067b:	53                   	push   ebx
 310067c:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:26
    int i = findCommand(lCommand);
 310067f:	83 ec 0c             	sub    esp,0xc
 3100682:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100685:	e8 3d 02 00 00       	call   31008c7 <findCommand>
 310068a:	83 c4 10             	add    esp,0x10
 310068d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:28

    if(i>0)
 3100690:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100694:	7e 74                	jle    310070a <execInternalCommand+0x92>
/home/yogi/src/os/aproj/kshell/src/kshell.c:30
    {
        i--;
 3100696:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:32
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 310069a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310069d:	c1 e0 04             	shl    eax,0x4
 31006a0:	05 a8 1f 10 03       	add    eax,0x3101fa8
 31006a5:	8b 00                	mov    eax,DWORD PTR [eax]
 31006a7:	a3 90 24 10 03       	mov    ds:0x3102490,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:33
        command_function_p = cmds[i].function;
 31006ac:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31006af:	c1 e0 04             	shl    eax,0x4
 31006b2:	05 a8 1f 10 03       	add    eax,0x3101fa8
 31006b7:	8b 00                	mov    eax,DWORD PTR [eax]
 31006b9:	a3 80 24 10 03       	mov    ds:0x3102480,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:34
        if (cmds[i].paramCount==0)
 31006be:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31006c1:	c1 e0 04             	shl    eax,0x4
 31006c4:	05 ac 1f 10 03       	add    eax,0x3101fac
 31006c9:	8b 00                	mov    eax,DWORD PTR [eax]
 31006cb:	85 c0                	test   eax,eax
 31006cd:	75 09                	jne    31006d8 <execInternalCommand+0x60>
/home/yogi/src/os/aproj/kshell/src/kshell.c:35
            command_function();
 31006cf:	a1 90 24 10 03       	mov    eax,ds:0x3102490
 31006d4:	ff d0                	call   eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 31006d6:	eb 40                	jmp    3100718 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:38
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
 31006d8:	8b 1d 80 24 10 03    	mov    ebx,DWORD PTR ds:0x3102480
 31006de:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31006e1:	c1 e0 04             	shl    eax,0x4
 31006e4:	05 a0 1f 10 03       	add    eax,0x3101fa0
 31006e9:	8b 00                	mov    eax,DWORD PTR [eax]
 31006eb:	83 ec 0c             	sub    esp,0xc
 31006ee:	50                   	push   eax
 31006ef:	e8 ec 0b 00 00       	call   31012e0 <kShell+0x56c>
 31006f4:	83 c4 10             	add    esp,0x10
 31006f7:	8d 50 01             	lea    edx,[eax+0x1]
 31006fa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31006fd:	01 d0                	add    eax,edx
 31006ff:	83 ec 0c             	sub    esp,0xc
 3100702:	50                   	push   eax
 3100703:	ff d3                	call   ebx
 3100705:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 3100708:	eb 0e                	jmp    3100718 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:44
        }
    }
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
 310070a:	83 ec 0c             	sub    esp,0xc
 310070d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100710:	e8 6d fd ff ff       	call   3100482 <cmdExecp>
 3100715:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    }
}
 3100718:	90                   	nop
 3100719:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 310071c:	c9                   	leave  
 310071d:	c3                   	ret    

0310071e <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:49

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 310071e:	55                   	push   ebp
 310071f:	89 e5                	mov    ebp,esp
 3100721:	53                   	push   ebx
 3100722:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/aproj/kshell/src/kshell.c:50
    int x=0,y=0;
 3100725:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310072c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:51
    int lRetVal=0,parsedChars=0;
 3100733:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 310073a:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:52
    bool needDoubleQuotetoEndParam=0;
 3100741:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:54
    
    memset(params,0, size);
 3100745:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100748:	83 ec 04             	sub    esp,0x4
 310074b:	50                   	push   eax
 310074c:	6a 00                	push   0x0
 310074e:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100751:	e8 4a 0b 00 00       	call   31012a0 <kShell+0x52c>
 3100756:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:56
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100759:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 3100760:	e9 24 01 00 00       	jmp    3100889 <parseParamsShell+0x16b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:58
    {
        if(cmdLine[cnt]=='"')
 3100765:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100768:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310076b:	01 d0                	add    eax,edx
 310076d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100770:	3c 22                	cmp    al,0x22
 3100772:	75 41                	jne    31007b5 <parseParamsShell+0x97>
/home/yogi/src/os/aproj/kshell/src/kshell.c:60
        {
            if (!needDoubleQuotetoEndParam)
 3100774:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100778:	83 f0 01             	xor    eax,0x1
 310077b:	84 c0                	test   al,al
 310077d:	74 09                	je     3100788 <parseParamsShell+0x6a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:62
            {
                needDoubleQuotetoEndParam=true;
 310077f:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 3100783:	e9 f9 00 00 00       	jmp    3100881 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:66
            }
            else
            {
                params[y][x]='\0';
 3100788:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310078b:	c1 e0 07             	shl    eax,0x7
 310078e:	89 c2                	mov    edx,eax
 3100790:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100793:	01 c2                	add    edx,eax
 3100795:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100798:	01 d0                	add    eax,edx
 310079a:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:67
                {x=0;y++;lRetVal++;}
 310079d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31007a4:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31007a8:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:68
                needDoubleQuotetoEndParam=false;
 31007ac:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 31007b0:	e9 cc 00 00 00       	jmp    3100881 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 31007b5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31007b8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31007bb:	01 d0                	add    eax,edx
 31007bd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31007c0:	3c 20                	cmp    al,0x20
 31007c2:	74 1e                	je     31007e2 <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71 (discriminator 2)
 31007c4:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31007c7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31007ca:	01 d0                	add    eax,edx
 31007cc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31007cf:	3c 2d                	cmp    al,0x2d
 31007d1:	74 0f                	je     31007e2 <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71 (discriminator 4)
 31007d3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31007d6:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31007d9:	01 d0                	add    eax,edx
 31007db:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31007de:	3c 2c                	cmp    al,0x2c
 31007e0:	75 7a                	jne    310085c <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71 (discriminator 5)
 31007e2:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 31007e6:	83 f0 01             	xor    eax,0x1
 31007e9:	84 c0                	test   al,al
 31007eb:	74 6f                	je     310085c <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:74
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 31007ed:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31007f0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31007f3:	01 d0                	add    eax,edx
 31007f5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31007f8:	3c 2d                	cmp    al,0x2d
 31007fa:	74 0f                	je     310080b <parseParamsShell+0xed>
/home/yogi/src/os/aproj/kshell/src/kshell.c:74 (discriminator 1)
 31007fc:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31007ff:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100802:	01 d0                	add    eax,edx
 3100804:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100807:	3c 2f                	cmp    al,0x2f
 3100809:	75 25                	jne    3100830 <parseParamsShell+0x112>
/home/yogi/src/os/aproj/kshell/src/kshell.c:75
                params[y][x++]=cmdLine[cnt];
 310080b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310080e:	c1 e0 07             	shl    eax,0x7
 3100811:	89 c2                	mov    edx,eax
 3100813:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100816:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100819:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310081c:	8d 50 01             	lea    edx,[eax+0x1]
 310081f:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100822:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100825:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 3100828:	01 da                	add    edx,ebx
 310082a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310082d:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:76
            params[y][x]='\0';
 3100830:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100833:	c1 e0 07             	shl    eax,0x7
 3100836:	89 c2                	mov    edx,eax
 3100838:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310083b:	01 c2                	add    edx,eax
 310083d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100840:	01 d0                	add    eax,edx
 3100842:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:77
            if (cnt>0)
 3100845:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 3100849:	74 36                	je     3100881 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:78
                {x=0;y++;lRetVal++;}
 310084b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100852:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100856:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:77
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 310085a:	eb 25                	jmp    3100881 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:83
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 310085c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310085f:	c1 e0 07             	shl    eax,0x7
 3100862:	89 c2                	mov    edx,eax
 3100864:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100867:	8d 0c 02             	lea    ecx,[edx+eax*1]
 310086a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310086d:	8d 50 01             	lea    edx,[eax+0x1]
 3100870:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100873:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100876:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 3100879:	01 da                	add    edx,ebx
 310087b:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310087e:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:85 (discriminator 2)
        }
        parsedChars++;
 3100881:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:56 (discriminator 2)
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100885:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:56 (discriminator 1)
 3100889:	83 ec 0c             	sub    esp,0xc
 310088c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310088f:	e8 4c 0a 00 00       	call   31012e0 <kShell+0x56c>
 3100894:	83 c4 10             	add    esp,0x10
 3100897:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 310089a:	0f 87 c5 fe ff ff    	ja     3100765 <parseParamsShell+0x47>
/home/yogi/src/os/aproj/kshell/src/kshell.c:87
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 31008a0:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31008a4:	74 19                	je     31008bf <parseParamsShell+0x1a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:89
    {
        lRetVal++;
 31008a6:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:90
        params[y][x]='\0';
 31008aa:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31008ad:	c1 e0 07             	shl    eax,0x7
 31008b0:	89 c2                	mov    edx,eax
 31008b2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31008b5:	01 c2                	add    edx,eax
 31008b7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31008ba:	01 d0                	add    eax,edx
 31008bc:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:95
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 31008bf:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/aproj/kshell/src/kshell.c:96
}
 31008c2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31008c5:	c9                   	leave  
 31008c6:	c3                   	ret    

031008c7 <findCommand>:
findCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:99

int findCommand(char* command)
{
 31008c7:	55                   	push   ebp
 31008c8:	89 e5                	mov    ebp,esp
 31008ca:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:103
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 31008cd:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31008d4:	eb 4d                	jmp    3100923 <findCommand+0x5c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:105
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 31008d6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31008d9:	c1 e0 04             	shl    eax,0x4
 31008dc:	05 a0 1f 10 03       	add    eax,0x3101fa0
 31008e1:	8b 00                	mov    eax,DWORD PTR [eax]
 31008e3:	83 ec 0c             	sub    esp,0xc
 31008e6:	50                   	push   eax
 31008e7:	e8 f4 09 00 00       	call   31012e0 <kShell+0x56c>
 31008ec:	83 c4 10             	add    esp,0x10
 31008ef:	89 c2                	mov    edx,eax
 31008f1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31008f4:	c1 e0 04             	shl    eax,0x4
 31008f7:	05 a0 1f 10 03       	add    eax,0x3101fa0
 31008fc:	8b 00                	mov    eax,DWORD PTR [eax]
 31008fe:	83 ec 04             	sub    esp,0x4
 3100901:	52                   	push   edx
 3100902:	50                   	push   eax
 3100903:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100906:	e8 45 09 00 00       	call   3101250 <kShell+0x4dc>
 310090b:	83 c4 10             	add    esp,0x10
 310090e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:107
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 3100911:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100915:	75 08                	jne    310091f <findCommand+0x58>
/home/yogi/src/os/aproj/kshell/src/kshell.c:110
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 3100917:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310091a:	83 c0 01             	add    eax,0x1
 310091d:	eb 0f                	jmp    310092e <findCommand+0x67>
/home/yogi/src/os/aproj/kshell/src/kshell.c:103 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 310091f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:103 (discriminator 1)
 3100923:	83 7d f4 09          	cmp    DWORD PTR [ebp-0xc],0x9
 3100927:	76 ad                	jbe    31008d6 <findCommand+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:114
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 3100929:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:115
}
 310092e:	c9                   	leave  
 310092f:	c3                   	ret    

03100930 <buildargv>:
buildargv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:119

/*parts from http://*/
char **buildargv (const char *input)
{
 3100930:	55                   	push   ebp
 3100931:	89 e5                	mov    ebp,esp
 3100933:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:122
  char *arg;
  char *copybuf;
  int squote = 0;
 3100936:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:123
  int dquote = 0;
 310093d:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:124
  int bsquote = 0;
 3100944:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:125
  int argc = 0;
 310094b:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:126
  int maxargc = 0;
 3100952:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:127
  char **argv = NULL;
 3100959:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:131
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 3100960:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 3100964:	0f 84 33 02 00 00    	je     3100b9d <buildargv+0x26d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:134
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 310096a:	83 ec 0c             	sub    esp,0xc
 310096d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100970:	e8 6b 09 00 00       	call   31012e0 <kShell+0x56c>
 3100975:	83 c4 10             	add    esp,0x10
 3100978:	83 c0 01             	add    eax,0x1
 310097b:	83 ec 0c             	sub    esp,0xc
 310097e:	50                   	push   eax
 310097f:	e8 4c 08 00 00       	call   31011d0 <kShell+0x45c>
 3100984:	83 c4 10             	add    esp,0x10
 3100987:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:142
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 310098a:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 310098e:	74 0b                	je     310099b <buildargv+0x6b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:142 (discriminator 1)
 3100990:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100993:	83 e8 01             	sub    eax,0x1
 3100996:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100999:	7f 3d                	jg     31009d8 <buildargv+0xa8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:145
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 310099b:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 310099f:	75 1c                	jne    31009bd <buildargv+0x8d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:147
		{
		  maxargc = INITIAL_MAXARGC;
 31009a1:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:148
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 31009a8:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31009ab:	c1 e0 02             	shl    eax,0x2
 31009ae:	83 ec 0c             	sub    esp,0xc
 31009b1:	50                   	push   eax
 31009b2:	e8 19 08 00 00       	call   31011d0 <kShell+0x45c>
 31009b7:	83 c4 10             	add    esp,0x10
 31009ba:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:150
		}
	      argv = nargv;
 31009bd:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 31009c0:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:151
	      argv[argc] = NULL;
 31009c3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31009c6:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31009cd:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31009d0:	01 d0                	add    eax,edx
 31009d2:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:154
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 31009d8:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31009db:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:155
	  while (*input != EOS)
 31009de:	e9 ec 00 00 00       	jmp    3100acf <buildargv+0x19f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 31009e3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31009e6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31009e9:	3c 20                	cmp    al,0x20
 31009eb:	75 16                	jne    3100a03 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 1)
 31009ed:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31009f1:	75 10                	jne    3100a03 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 2)
 31009f3:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31009f7:	75 0a                	jne    3100a03 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 3)
 31009f9:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 31009fd:	0f 84 da 00 00 00    	je     3100add <buildargv+0x1ad>
/home/yogi/src/os/aproj/kshell/src/kshell.c:163
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100a03:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100a07:	74 1d                	je     3100a26 <buildargv+0xf6>
/home/yogi/src/os/aproj/kshell/src/kshell.c:165
		    {
		      bsquote = 0;
 3100a09:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:166
		      *arg++ = *input;
 3100a10:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a13:	8d 50 01             	lea    edx,[eax+0x1]
 3100a16:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100a19:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100a1c:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100a1f:	88 10                	mov    BYTE PTR [eax],dl
 3100a21:	e9 a5 00 00 00       	jmp    3100acb <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:168
		    }
		  else if (*input == '\\')
 3100a26:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a29:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a2c:	3c 5c                	cmp    al,0x5c
 3100a2e:	75 0c                	jne    3100a3c <buildargv+0x10c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:170
		    {
		      bsquote = 1;
 3100a30:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 3100a37:	e9 8f 00 00 00       	jmp    3100acb <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:172
		    }
		  else if (squote)
 3100a3c:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100a40:	74 26                	je     3100a68 <buildargv+0x138>
/home/yogi/src/os/aproj/kshell/src/kshell.c:174
		    {
		      if (*input == '\'')
 3100a42:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a45:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a48:	3c 27                	cmp    al,0x27
 3100a4a:	75 09                	jne    3100a55 <buildargv+0x125>
/home/yogi/src/os/aproj/kshell/src/kshell.c:176
			{
			  squote = 0;
 3100a4c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100a53:	eb 76                	jmp    3100acb <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:180
			}
		      else
			{
			  *arg++ = *input;
 3100a55:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a58:	8d 50 01             	lea    edx,[eax+0x1]
 3100a5b:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100a5e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100a61:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100a64:	88 10                	mov    BYTE PTR [eax],dl
 3100a66:	eb 63                	jmp    3100acb <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:183
			}
		    }
		  else if (dquote)
 3100a68:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100a6c:	74 26                	je     3100a94 <buildargv+0x164>
/home/yogi/src/os/aproj/kshell/src/kshell.c:185
		    {
		      if (*input == '"')
 3100a6e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a71:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a74:	3c 22                	cmp    al,0x22
 3100a76:	75 09                	jne    3100a81 <buildargv+0x151>
/home/yogi/src/os/aproj/kshell/src/kshell.c:187
			{
			  dquote = 0;
 3100a78:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 3100a7f:	eb 4a                	jmp    3100acb <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:191
			}
		      else
			{
			  *arg++ = *input;
 3100a81:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a84:	8d 50 01             	lea    edx,[eax+0x1]
 3100a87:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100a8a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100a8d:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100a90:	88 10                	mov    BYTE PTR [eax],dl
 3100a92:	eb 37                	jmp    3100acb <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:196
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100a94:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a97:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a9a:	3c 27                	cmp    al,0x27
 3100a9c:	75 09                	jne    3100aa7 <buildargv+0x177>
/home/yogi/src/os/aproj/kshell/src/kshell.c:198
			{
			  squote = 1;
 3100a9e:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100aa5:	eb 24                	jmp    3100acb <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:200
			}
		      else if (*input == '"')
 3100aa7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100aaa:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100aad:	3c 22                	cmp    al,0x22
 3100aaf:	75 09                	jne    3100aba <buildargv+0x18a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:202
			{
			  dquote = 1;
 3100ab1:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 3100ab8:	eb 11                	jmp    3100acb <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:206
			}
		      else
			{
			  *arg++ = *input;
 3100aba:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100abd:	8d 50 01             	lea    edx,[eax+0x1]
 3100ac0:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100ac3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100ac6:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100ac9:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:210
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 3100acb:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:155
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 3100acf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100ad2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100ad5:	84 c0                	test   al,al
 3100ad7:	0f 85 06 ff ff ff    	jne    31009e3 <buildargv+0xb3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:213
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3100add:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100ae0:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:215
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100ae3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100ae6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100ae9:	84 c0                	test   al,al
 3100aeb:	0f 84 9e 00 00 00    	je     3100b8f <buildargv+0x25f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:217
          {
            char* temp=malloc(strlen(copybuf)+1);
 3100af1:	83 ec 0c             	sub    esp,0xc
 3100af4:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100af7:	e8 e4 07 00 00       	call   31012e0 <kShell+0x56c>
 3100afc:	83 c4 10             	add    esp,0x10
 3100aff:	83 c0 01             	add    eax,0x1
 3100b02:	83 ec 0c             	sub    esp,0xc
 3100b05:	50                   	push   eax
 3100b06:	e8 c5 06 00 00       	call   31011d0 <kShell+0x45c>
 3100b0b:	83 c4 10             	add    esp,0x10
 3100b0e:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:220
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3100b11:	83 ec 08             	sub    esp,0x8
 3100b14:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100b17:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100b1a:	e8 31 06 00 00       	call   3101150 <kShell+0x3dc>
 3100b1f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:221
            free(copybuf);
 3100b22:	83 ec 0c             	sub    esp,0xc
 3100b25:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100b28:	e8 d3 07 00 00       	call   3101300 <kShell+0x58c>
 3100b2d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:222
            copybuf = (char *) malloc (strlen (input) + 1);
 3100b30:	83 ec 0c             	sub    esp,0xc
 3100b33:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100b36:	e8 a5 07 00 00       	call   31012e0 <kShell+0x56c>
 3100b3b:	83 c4 10             	add    esp,0x10
 3100b3e:	83 c0 01             	add    eax,0x1
 3100b41:	83 ec 0c             	sub    esp,0xc
 3100b44:	50                   	push   eax
 3100b45:	e8 86 06 00 00       	call   31011d0 <kShell+0x45c>
 3100b4a:	83 c4 10             	add    esp,0x10
 3100b4d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:223
            argv[argc] = temp;
 3100b50:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100b53:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100b5a:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100b5d:	01 c2                	add    edx,eax
 3100b5f:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100b62:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:225
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 3100b64:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:226
            argv[argc] = NULL;
 3100b68:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100b6b:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100b72:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100b75:	01 d0                	add    eax,edx
 3100b77:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:227
            input++;
 3100b7d:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:228
            free(temp);
 3100b81:	83 ec 0c             	sub    esp,0xc
 3100b84:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100b87:	e8 74 07 00 00       	call   3101300 <kShell+0x58c>
 3100b8c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:231
          }
	}
      while (*input != EOS);
 3100b8f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b92:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b95:	84 c0                	test   al,al
 3100b97:	0f 85 ed fd ff ff    	jne    310098a <buildargv+0x5a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:234
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 3100b9d:	83 ec 0c             	sub    esp,0xc
 3100ba0:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100ba3:	e8 58 07 00 00       	call   3101300 <kShell+0x58c>
 3100ba8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:235
  free(nargv);
 3100bab:	83 ec 0c             	sub    esp,0xc
 3100bae:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100bb1:	e8 4a 07 00 00       	call   3101300 <kShell+0x58c>
 3100bb6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:236
  return (argv);
 3100bb9:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/kshell/src/kshell.c:237
}
 3100bbc:	c9                   	leave  
 3100bbd:	c3                   	ret    

03100bbe <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:240

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
 3100bbe:	55                   	push   ebp
 3100bbf:	89 e5                	mov    ebp,esp
 3100bc1:	53                   	push   ebx
 3100bc2:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:241
    for (int cnt=0;cnt<pcount;cnt++)
 3100bc5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100bcc:	eb 56                	jmp    3100c24 <paramsToArgv+0x66>
/home/yogi/src/os/aproj/kshell/src/kshell.c:243 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 3100bce:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bd1:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100bd8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100bdb:	8d 1c 02             	lea    ebx,[edx+eax*1]
 3100bde:	83 ec 0c             	sub    esp,0xc
 3100be1:	68 80 00 00 00       	push   0x80
 3100be6:	e8 e5 05 00 00       	call   31011d0 <kShell+0x45c>
 3100beb:	83 c4 10             	add    esp,0x10
 3100bee:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:244 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 3100bf0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bf3:	c1 e0 07             	shl    eax,0x7
 3100bf6:	89 c2                	mov    edx,eax
 3100bf8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100bfb:	01 c2                	add    edx,eax
 3100bfd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c00:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 3100c07:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100c0a:	01 c8                	add    eax,ecx
 3100c0c:	8b 00                	mov    eax,DWORD PTR [eax]
 3100c0e:	83 ec 04             	sub    esp,0x4
 3100c11:	68 80 00 00 00       	push   0x80
 3100c16:	52                   	push   edx
 3100c17:	50                   	push   eax
 3100c18:	e8 a3 05 00 00       	call   31011c0 <kShell+0x44c>
 3100c1d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:241 (discriminator 3)
  return (argv);
}

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100c20:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:241 (discriminator 1)
 3100c24:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c27:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100c2a:	7c a2                	jl     3100bce <paramsToArgv+0x10>
/home/yogi/src/os/aproj/kshell/src/kshell.c:246
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 3100c2c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
/home/yogi/src/os/aproj/kshell/src/kshell.c:247
}
 3100c2f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100c32:	c9                   	leave  
 3100c33:	c3                   	ret    

03100c34 <freeArgV>:
freeArgV():
/home/yogi/src/os/aproj/kshell/src/kshell.c:250

void freeArgV(int pcount, char **params)
{
 3100c34:	55                   	push   ebp
 3100c35:	89 e5                	mov    ebp,esp
 3100c37:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:251
    for (int cnt=0;cnt<pcount;cnt++)
 3100c3a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100c41:	eb 15                	jmp    3100c58 <freeArgV+0x24>
/home/yogi/src/os/aproj/kshell/src/kshell.c:252 (discriminator 3)
        free(*params);
 3100c43:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100c46:	8b 00                	mov    eax,DWORD PTR [eax]
 3100c48:	83 ec 0c             	sub    esp,0xc
 3100c4b:	50                   	push   eax
 3100c4c:	e8 af 06 00 00       	call   3101300 <kShell+0x58c>
 3100c51:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:251 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100c54:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:251 (discriminator 1)
 3100c58:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c5b:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100c5e:	7c e3                	jl     3100c43 <freeArgV+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:253
        free(*params);
    free(params);
 3100c60:	83 ec 0c             	sub    esp,0xc
 3100c63:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100c66:	e8 95 06 00 00       	call   3101300 <kShell+0x58c>
 3100c6b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:254
}
 3100c6e:	90                   	nop
 3100c6f:	c9                   	leave  
 3100c70:	c3                   	ret    

03100c71 <getEnvVariableValue>:
getEnvVariableValue():
/home/yogi/src/os/aproj/kshell/src/kshell.c:257

bool getEnvVariableValue(char* evName, char* value)
{
 3100c71:	55                   	push   ebp
 3100c72:	89 e5                	mov    ebp,esp
 3100c74:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:259
    
    for (int cnt=0;cnt<50;cnt++)
 3100c77:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100c7e:	eb 70                	jmp    3100cf0 <getEnvVariableValue+0x7f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:261
    {
        if (environmentLoc[cnt]!=0)
 3100c80:	a1 68 21 10 03       	mov    eax,ds:0x3102168
 3100c85:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100c88:	c1 e2 02             	shl    edx,0x2
 3100c8b:	01 d0                	add    eax,edx
 3100c8d:	8b 00                	mov    eax,DWORD PTR [eax]
 3100c8f:	85 c0                	test   eax,eax
 3100c91:	74 59                	je     3100cec <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:263
        {
            char* idx = strstr((char*)environmentLoc[cnt],evName);
 3100c93:	a1 68 21 10 03       	mov    eax,ds:0x3102168
 3100c98:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100c9b:	c1 e2 02             	shl    edx,0x2
 3100c9e:	01 d0                	add    eax,edx
 3100ca0:	8b 00                	mov    eax,DWORD PTR [eax]
 3100ca2:	83 ec 08             	sub    esp,0x8
 3100ca5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100ca8:	50                   	push   eax
 3100ca9:	e8 92 05 00 00       	call   3101240 <kShell+0x4cc>
 3100cae:	83 c4 10             	add    esp,0x10
 3100cb1:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:264
            if (idx>0)
 3100cb4:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100cb8:	74 32                	je     3100cec <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:266
            {
                idx = strstr(idx,"=");
 3100cba:	83 ec 08             	sub    esp,0x8
 3100cbd:	68 45 16 10 03       	push   0x3101645
 3100cc2:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100cc5:	e8 76 05 00 00       	call   3101240 <kShell+0x4cc>
 3100cca:	83 c4 10             	add    esp,0x10
 3100ccd:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:268
                //++ because we don't want to include the = sign
                strcpy(value, ++idx);
 3100cd0:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100cd4:	83 ec 08             	sub    esp,0x8
 3100cd7:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100cda:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100cdd:	e8 6e 04 00 00       	call   3101150 <kShell+0x3dc>
 3100ce2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:270
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
 3100ce5:	b8 01 00 00 00       	mov    eax,0x1
 3100cea:	eb 0f                	jmp    3100cfb <getEnvVariableValue+0x8a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:259 (discriminator 2)
}

bool getEnvVariableValue(char* evName, char* value)
{
    
    for (int cnt=0;cnt<50;cnt++)
 3100cec:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:259 (discriminator 1)
 3100cf0:	83 7d f4 31          	cmp    DWORD PTR [ebp-0xc],0x31
 3100cf4:	7e 8a                	jle    3100c80 <getEnvVariableValue+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:274
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
            }
        }
    } 
    return false;
 3100cf6:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:275
}
 3100cfb:	c9                   	leave  
 3100cfc:	c3                   	ret    

03100cfd <saveCommand>:
saveCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:288
    
}
*/

void saveCommand(char* command)
{
 3100cfd:	55                   	push   ebp
 3100cfe:	89 e5                	mov    ebp,esp
 3100d00:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:289
    strcpy(commandHistory[commandHistoryMax++],command);
 3100d03:	a1 b0 24 10 03       	mov    eax,ds:0x31024b0
 3100d08:	8d 50 01             	lea    edx,[eax+0x1]
 3100d0b:	89 15 b0 24 10 03    	mov    DWORD PTR ds:0x31024b0,edx
 3100d11:	c1 e0 07             	shl    eax,0x7
 3100d14:	05 c0 24 10 03       	add    eax,0x31024c0
 3100d19:	83 ec 08             	sub    esp,0x8
 3100d1c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100d1f:	50                   	push   eax
 3100d20:	e8 2b 04 00 00       	call   3101150 <kShell+0x3dc>
 3100d25:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:290
}
 3100d28:	90                   	nop
 3100d29:	c9                   	leave  
 3100d2a:	c3                   	ret    

03100d2b <prompt>:
prompt():
/home/yogi/src/os/aproj/kshell/src/kshell.c:293

void prompt()
{
 3100d2b:	55                   	push   ebp
 3100d2c:	89 e5                	mov    ebp,esp
 3100d2e:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:294
    print("%s %s> ",sExecutingProgram, cwd);
 3100d31:	83 ec 04             	sub    esp,0x4
 3100d34:	68 80 21 10 03       	push   0x3102180
 3100d39:	68 80 22 10 03       	push   0x3102280
 3100d3e:	68 47 16 10 03       	push   0x3101647
 3100d43:	e8 28 04 00 00       	call   3101170 <kShell+0x3fc>
 3100d48:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:295
}
 3100d4b:	90                   	nop
 3100d4c:	c9                   	leave  
 3100d4d:	c3                   	ret    

03100d4e <reprintCommand>:
reprintCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:298

int reprintCommand(char* command)
{
 3100d4e:	55                   	push   ebp
 3100d4f:	89 e5                	mov    ebp,esp
 3100d51:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:299
    resetRow();
 3100d54:	e8 37 04 00 00       	call   3101190 <kShell+0x41c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:300
    prompt();
 3100d59:	e8 cd ff ff ff       	call   3100d2b <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:301
    print("%s",command);
 3100d5e:	83 ec 08             	sub    esp,0x8
 3100d61:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100d64:	68 4f 16 10 03       	push   0x310164f
 3100d69:	e8 02 04 00 00       	call   3101170 <kShell+0x3fc>
 3100d6e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:303
 
}
 3100d71:	90                   	nop
 3100d72:	c9                   	leave  
 3100d73:	c3                   	ret    

03100d74 <kShell>:
kShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:307


int kShell(int argc, char** argv, char** envp)
{
 3100d74:	55                   	push   ebp
 3100d75:	89 e5                	mov    ebp,esp
 3100d77:	81 ec 38 01 00 00    	sub    esp,0x138
/home/yogi/src/os/aproj/kshell/src/kshell.c:309
    char lCommand[256];
    uint8_t lCurrKey=0;
 3100d7d:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:310
    int lCurrKeyCount=0;
 3100d84:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:311
    int commandWasFromThisBufferPtr=0;
 3100d8b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:314
    char ansiSeq[20];

    exitCode = 0;
 3100d92:	c7 05 9c 24 10 03 00 	mov    DWORD PTR ds:0x310249c,0x0
 3100d99:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/kshell.c:315
    timeToExit = false;
 3100d9c:	c6 05 a8 24 10 03 00 	mov    BYTE PTR ds:0x31024a8,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:316
    strcpy(delim," \t\n-,");
 3100da3:	83 ec 08             	sub    esp,0x8
 3100da6:	68 52 16 10 03       	push   0x3101652
 3100dab:	68 60 21 10 03       	push   0x3102160
 3100db0:	e8 9b 03 00 00       	call   3101150 <kShell+0x3dc>
 3100db5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:317
    environmentLoc = envp;
 3100db8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100dbb:	a3 68 21 10 03       	mov    ds:0x3102168,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:318
    ansiSeq[0]=0x1b;
 3100dc0:	c6 85 d7 fe ff ff 1b 	mov    BYTE PTR [ebp-0x129],0x1b
/home/yogi/src/os/aproj/kshell/src/kshell.c:319
    sKShellProgramName=malloc(1024);
 3100dc7:	83 ec 0c             	sub    esp,0xc
 3100dca:	68 00 04 00 00       	push   0x400
 3100dcf:	e8 fc 03 00 00       	call   31011d0 <kShell+0x45c>
 3100dd4:	83 c4 10             	add    esp,0x10
 3100dd7:	a3 a0 24 10 03       	mov    ds:0x31024a0,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:320
    strcpy(sKShellProgramName,"kShell");
 3100ddc:	a1 a0 24 10 03       	mov    eax,ds:0x31024a0
 3100de1:	83 ec 08             	sub    esp,0x8
 3100de4:	68 58 16 10 03       	push   0x3101658
 3100de9:	50                   	push   eax
 3100dea:	e8 61 03 00 00       	call   3101150 <kShell+0x3dc>
 3100def:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:321
    strcpy(sExecutingProgram,sKShellProgramName);
 3100df2:	a1 a0 24 10 03       	mov    eax,ds:0x31024a0
 3100df7:	83 ec 08             	sub    esp,0x8
 3100dfa:	50                   	push   eax
 3100dfb:	68 80 22 10 03       	push   0x3102280
 3100e00:	e8 4b 03 00 00       	call   3101150 <kShell+0x3dc>
 3100e05:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:324
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 3100e08:	e9 08 03 00 00       	jmp    3101115 <kShell+0x3a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:327
    {
getACommand:
        commandHistoryPtr = commandHistoryMax;
 3100e0d:	a1 b0 24 10 03       	mov    eax,ds:0x31024b0
 3100e12:	a3 ac 24 10 03       	mov    ds:0x31024ac,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:328
        commandWasFromThisBufferPtr = -1;
 3100e17:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:329
        lCurrKey=0;
 3100e1e:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:330
        lCurrKeyCount=0;
 3100e25:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:331
        memset(lCommand,0,256);
 3100e2c:	83 ec 04             	sub    esp,0x4
 3100e2f:	68 00 01 00 00       	push   0x100
 3100e34:	6a 00                	push   0x0
 3100e36:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100e3c:	50                   	push   eax
 3100e3d:	e8 5e 04 00 00       	call   31012a0 <kShell+0x52c>
 3100e42:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:332
        getenv("CWD",cwd);
 3100e45:	83 ec 08             	sub    esp,0x8
 3100e48:	68 80 21 10 03       	push   0x3102180
 3100e4d:	68 5f 16 10 03       	push   0x310165f
 3100e52:	e8 49 03 00 00       	call   31011a0 <kShell+0x42c>
 3100e57:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:333
        prompt();
 3100e5a:	e8 cc fe ff ff       	call   3100d2b <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:335
getAKey:
        lCurrKey=0;
 3100e5f:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:336
        while(lCurrKey==0)
 3100e66:	eb 16                	jmp    3100e7e <kShell+0x10a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:338
        {
            gets(&lCurrKey,1,1);
 3100e68:	83 ec 04             	sub    esp,0x4
 3100e6b:	6a 01                	push   0x1
 3100e6d:	6a 01                	push   0x1
 3100e6f:	8d 85 eb fe ff ff    	lea    eax,[ebp-0x115]
 3100e75:	50                   	push   eax
 3100e76:	e8 35 03 00 00       	call   31011b0 <kShell+0x43c>
 3100e7b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:336
        memset(lCommand,0,256);
        getenv("CWD",cwd);
        prompt();
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 3100e7e:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100e85:	84 c0                	test   al,al
 3100e87:	74 df                	je     3100e68 <kShell+0xf4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:341
        {
            gets(&lCurrKey,1,1);
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3100e89:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100e90:	3c c8                	cmp    al,0xc8
 3100e92:	0f 85 97 00 00 00    	jne    3100f2f <kShell+0x1bb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:343
        {
            if (commandHistoryPtr>=0)
 3100e98:	a1 ac 24 10 03       	mov    eax,ds:0x31024ac
 3100e9d:	85 c0                	test   eax,eax
 3100e9f:	78 be                	js     3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:346
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
 3100ea1:	a1 ac 24 10 03       	mov    eax,ds:0x31024ac
 3100ea6:	83 e8 01             	sub    eax,0x1
 3100ea9:	85 c0                	test   eax,eax
 3100eab:	78 b2                	js     3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:348
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
 3100ead:	a1 ac 24 10 03       	mov    eax,ds:0x31024ac
 3100eb2:	83 e8 01             	sub    eax,0x1
 3100eb5:	a3 ac 24 10 03       	mov    ds:0x31024ac,eax
 3100eba:	a1 ac 24 10 03       	mov    eax,ds:0x31024ac
 3100ebf:	c1 e0 07             	shl    eax,0x7
 3100ec2:	05 c0 24 10 03       	add    eax,0x31024c0
 3100ec7:	83 ec 08             	sub    esp,0x8
 3100eca:	50                   	push   eax
 3100ecb:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100ed1:	50                   	push   eax
 3100ed2:	e8 79 02 00 00       	call   3101150 <kShell+0x3dc>
 3100ed7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:349
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3100eda:	a1 ac 24 10 03       	mov    eax,ds:0x31024ac
 3100edf:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:350
                    while (lCurrKeyCount>0)
 3100ee2:	eb 14                	jmp    3100ef8 <kShell+0x184>
/home/yogi/src/os/aproj/kshell/src/kshell.c:352
                    {
                        printf(KEY_BACKSPACE);
 3100ee4:	83 ec 0c             	sub    esp,0xc
 3100ee7:	68 63 16 10 03       	push   0x3101663
 3100eec:	e8 8f 02 00 00       	call   3101180 <kShell+0x40c>
 3100ef1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:353
                        lCurrKeyCount--;
 3100ef4:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:350
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 3100ef8:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100efc:	7f e6                	jg     3100ee4 <kShell+0x170>
/home/yogi/src/os/aproj/kshell/src/kshell.c:355
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 3100efe:	83 ec 08             	sub    esp,0x8
 3100f01:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100f07:	50                   	push   eax
 3100f08:	68 4f 16 10 03       	push   0x310164f
 3100f0d:	e8 6e 02 00 00       	call   3101180 <kShell+0x40c>
 3100f12:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:356
                    lCurrKeyCount=strlen(lCommand);
 3100f15:	83 ec 0c             	sub    esp,0xc
 3100f18:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100f1e:	50                   	push   eax
 3100f1f:	e8 bc 03 00 00       	call   31012e0 <kShell+0x56c>
 3100f24:	83 c4 10             	add    esp,0x10
 3100f27:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:358
                }
                goto getAKey;
 3100f2a:	e9 30 ff ff ff       	jmp    3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:363
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 3100f2f:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100f36:	3c d0                	cmp    al,0xd0
 3100f38:	0f 85 a4 00 00 00    	jne    3100fe2 <kShell+0x26e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:365
        {
            if (commandHistoryPtr>=0)
 3100f3e:	a1 ac 24 10 03       	mov    eax,ds:0x31024ac
 3100f43:	85 c0                	test   eax,eax
 3100f45:	0f 88 14 ff ff ff    	js     3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:368
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
 3100f4b:	a1 ac 24 10 03       	mov    eax,ds:0x31024ac
 3100f50:	8d 50 01             	lea    edx,[eax+0x1]
 3100f53:	a1 b0 24 10 03       	mov    eax,ds:0x31024b0
 3100f58:	39 c2                	cmp    edx,eax
 3100f5a:	0f 8d ff fe ff ff    	jge    3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:370
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
 3100f60:	a1 ac 24 10 03       	mov    eax,ds:0x31024ac
 3100f65:	83 c0 01             	add    eax,0x1
 3100f68:	a3 ac 24 10 03       	mov    ds:0x31024ac,eax
 3100f6d:	a1 ac 24 10 03       	mov    eax,ds:0x31024ac
 3100f72:	c1 e0 07             	shl    eax,0x7
 3100f75:	05 c0 24 10 03       	add    eax,0x31024c0
 3100f7a:	83 ec 08             	sub    esp,0x8
 3100f7d:	50                   	push   eax
 3100f7e:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100f84:	50                   	push   eax
 3100f85:	e8 c6 01 00 00       	call   3101150 <kShell+0x3dc>
 3100f8a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:371
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3100f8d:	a1 ac 24 10 03       	mov    eax,ds:0x31024ac
 3100f92:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:372
                    while (lCurrKeyCount>0)
 3100f95:	eb 14                	jmp    3100fab <kShell+0x237>
/home/yogi/src/os/aproj/kshell/src/kshell.c:374
                    {
                        printf(KEY_BACKSPACE);
 3100f97:	83 ec 0c             	sub    esp,0xc
 3100f9a:	68 63 16 10 03       	push   0x3101663
 3100f9f:	e8 dc 01 00 00       	call   3101180 <kShell+0x40c>
 3100fa4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:375
                        lCurrKeyCount--;
 3100fa7:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:372
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 3100fab:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100faf:	7f e6                	jg     3100f97 <kShell+0x223>
/home/yogi/src/os/aproj/kshell/src/kshell.c:377
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 3100fb1:	83 ec 08             	sub    esp,0x8
 3100fb4:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100fba:	50                   	push   eax
 3100fbb:	68 4f 16 10 03       	push   0x310164f
 3100fc0:	e8 bb 01 00 00       	call   3101180 <kShell+0x40c>
 3100fc5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:378
                    lCurrKeyCount=strlen(lCommand);
 3100fc8:	83 ec 0c             	sub    esp,0xc
 3100fcb:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100fd1:	50                   	push   eax
 3100fd2:	e8 09 03 00 00       	call   31012e0 <kShell+0x56c>
 3100fd7:	83 c4 10             	add    esp,0x10
 3100fda:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:380
                }
                goto getAKey;
 3100fdd:	e9 7d fe ff ff       	jmp    3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:385
            }
            else
                goto getAKey;
        }   
        else if (lCurrKey==0xcb) //left
 3100fe2:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100fe9:	3c cb                	cmp    al,0xcb
 3100feb:	75 1f                	jne    310100c <kShell+0x298>
/home/yogi/src/os/aproj/kshell/src/kshell.c:387
        {
            if (lCurrKeyCount>0)
 3100fed:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100ff1:	0f 8e 68 fe ff ff    	jle    3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:389
            {
                print("\033[1D");
 3100ff7:	83 ec 0c             	sub    esp,0xc
 3100ffa:	68 6d 16 10 03       	push   0x310166d
 3100fff:	e8 6c 01 00 00       	call   3101170 <kShell+0x3fc>
 3101004:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:392
            }
             
            goto getAKey;
 3101007:	e9 53 fe ff ff       	jmp    3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:394
        }
        else if (lCurrKey==0xcd) //right
 310100c:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3101013:	3c cd                	cmp    al,0xcd
 3101015:	75 15                	jne    310102c <kShell+0x2b8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:396
        {
            print("\033[1C");
 3101017:	83 ec 0c             	sub    esp,0xc
 310101a:	68 72 16 10 03       	push   0x3101672
 310101f:	e8 4c 01 00 00       	call   3101170 <kShell+0x3fc>
 3101024:	83 c4 10             	add    esp,0x10
 3101027:	e9 33 fe ff ff       	jmp    3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:398
        }
        else if (lCurrKey=='\b') //backspace
 310102c:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3101033:	3c 08                	cmp    al,0x8
 3101035:	75 35                	jne    310106c <kShell+0x2f8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:400
        {
            if (lCurrKeyCount-1 >= 0)
 3101037:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310103a:	83 e8 01             	sub    eax,0x1
 310103d:	85 c0                	test   eax,eax
 310103f:	0f 88 1a fe ff ff    	js     3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:402
            {
                lCurrKeyCount--;
 3101045:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:403
                lCommand[lCurrKeyCount]='\0';
 3101049:	8d 95 ec fe ff ff    	lea    edx,[ebp-0x114]
 310104f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101052:	01 d0                	add    eax,edx
 3101054:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:404
                printf(KEY_BACKSPACE);
 3101057:	83 ec 0c             	sub    esp,0xc
 310105a:	68 63 16 10 03       	push   0x3101663
 310105f:	e8 1c 01 00 00       	call   3101180 <kShell+0x40c>
 3101064:	83 c4 10             	add    esp,0x10
 3101067:	e9 f3 fd ff ff       	jmp    3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:407
            }
        }
        else if (lCurrKey==0xa) //Enter
 310106c:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3101073:	3c 0a                	cmp    al,0xa
 3101075:	75 21                	jne    3101098 <kShell+0x324>
/home/yogi/src/os/aproj/kshell/src/kshell.c:409
        {
            print("\n");
 3101077:	83 ec 0c             	sub    esp,0xc
 310107a:	68 77 16 10 03       	push   0x3101677
 310107f:	e8 ec 00 00 00       	call   3101170 <kShell+0x3fc>
 3101084:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:410
            goto doneGettingKeys;
 3101087:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:423
            commandWasFromThisBufferPtr=-1;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 3101088:	0f b6 85 ec fe ff ff 	movzx  eax,BYTE PTR [ebp-0x114]
 310108f:	84 c0                	test   al,al
 3101091:	75 43                	jne    31010d6 <kShell+0x362>
 3101093:	e9 75 fd ff ff       	jmp    3100e0d <kShell+0x99>
/home/yogi/src/os/aproj/kshell/src/kshell.c:414
            print("\n");
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3101098:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310109b:	8d 50 01             	lea    edx,[eax+0x1]
 310109e:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31010a1:	0f b6 95 eb fe ff ff 	movzx  edx,BYTE PTR [ebp-0x115]
 31010a8:	88 94 05 ec fe ff ff 	mov    BYTE PTR [ebp+eax*1-0x114],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:416
            //reprintCommand(lCommand);
            printf("%c",lCurrKey);
 31010af:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 31010b6:	0f b6 c0             	movzx  eax,al
 31010b9:	83 ec 08             	sub    esp,0x8
 31010bc:	50                   	push   eax
 31010bd:	68 79 16 10 03       	push   0x3101679
 31010c2:	e8 b9 00 00 00       	call   3101180 <kShell+0x40c>
 31010c7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:418
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
 31010ca:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:420
        }
        goto getAKey;
 31010d1:	e9 89 fd ff ff       	jmp    3100e5f <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:425
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
            goto getACommand;
        if (commandWasFromThisBufferPtr == -1)
 31010d6:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
 31010da:	75 12                	jne    31010ee <kShell+0x37a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:426
            saveCommand(lCommand);
 31010dc:	83 ec 0c             	sub    esp,0xc
 31010df:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 31010e5:	50                   	push   eax
 31010e6:	e8 12 fc ff ff       	call   3100cfd <saveCommand>
 31010eb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:427
        int i = findCommand(lCommand);
 31010ee:	83 ec 0c             	sub    esp,0xc
 31010f1:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 31010f7:	50                   	push   eax
 31010f8:	e8 ca f7 ff ff       	call   31008c7 <findCommand>
 31010fd:	83 c4 10             	add    esp,0x10
 3101100:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:428
        execInternalCommand(lCommand);
 3101103:	83 ec 0c             	sub    esp,0xc
 3101106:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 310110c:	50                   	push   eax
 310110d:	e8 66 f5 ff ff       	call   3100678 <execInternalCommand>
 3101112:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:324
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 3101115:	0f b6 05 a8 24 10 03 	movzx  eax,BYTE PTR ds:0x31024a8
 310111c:	83 f0 01             	xor    eax,0x1
 310111f:	84 c0                	test   al,al
 3101121:	0f 85 e6 fc ff ff    	jne    3100e0d <kShell+0x99>
/home/yogi/src/os/aproj/kshell/src/kshell.c:430
        if (commandWasFromThisBufferPtr == -1)
            saveCommand(lCommand);
        int i = findCommand(lCommand);
        execInternalCommand(lCommand);
    }
    free(sKShellProgramName);
 3101127:	a1 a0 24 10 03       	mov    eax,ds:0x31024a0
 310112c:	83 ec 0c             	sub    esp,0xc
 310112f:	50                   	push   eax
 3101130:	e8 cb 01 00 00       	call   3101300 <kShell+0x58c>
 3101135:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:431
    return exitCode;
 3101138:	a1 9c 24 10 03       	mov    eax,ds:0x310249c
/home/yogi/src/os/aproj/kshell/src/kshell.c:432
}
 310113d:	c9                   	leave  
 310113e:	c3                   	ret    

Disassembly of section .plt:

03101140 <.plt>:
 3101140:	ff 35 d4 20 10 03    	push   DWORD PTR ds:0x31020d4
 3101146:	ff 25 d8 20 10 03    	jmp    DWORD PTR ds:0x31020d8
 310114c:	00 00                	add    BYTE PTR [eax],al
 310114e:	00 00                	add    BYTE PTR [eax],al
 3101150:	ff 25 dc 20 10 03    	jmp    DWORD PTR ds:0x31020dc
 3101156:	68 00 00 00 00       	push   0x0
 310115b:	e9 e0 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 3101160:	ff 25 e0 20 10 03    	jmp    DWORD PTR ds:0x31020e0
 3101166:	68 08 00 00 00       	push   0x8
 310116b:	e9 d0 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 3101170:	ff 25 e4 20 10 03    	jmp    DWORD PTR ds:0x31020e4
 3101176:	68 10 00 00 00       	push   0x10
 310117b:	e9 c0 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 3101180:	ff 25 e8 20 10 03    	jmp    DWORD PTR ds:0x31020e8
 3101186:	68 18 00 00 00       	push   0x18
 310118b:	e9 b0 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 3101190:	ff 25 ec 20 10 03    	jmp    DWORD PTR ds:0x31020ec
 3101196:	68 20 00 00 00       	push   0x20
 310119b:	e9 a0 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 31011a0:	ff 25 f0 20 10 03    	jmp    DWORD PTR ds:0x31020f0
 31011a6:	68 28 00 00 00       	push   0x28
 31011ab:	e9 90 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 31011b0:	ff 25 f4 20 10 03    	jmp    DWORD PTR ds:0x31020f4
 31011b6:	68 30 00 00 00       	push   0x30
 31011bb:	e9 80 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 31011c0:	ff 25 f8 20 10 03    	jmp    DWORD PTR ds:0x31020f8
 31011c6:	68 38 00 00 00       	push   0x38
 31011cb:	e9 70 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 31011d0:	ff 25 fc 20 10 03    	jmp    DWORD PTR ds:0x31020fc
 31011d6:	68 40 00 00 00       	push   0x40
 31011db:	e9 60 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 31011e0:	ff 25 00 21 10 03    	jmp    DWORD PTR ds:0x3102100
 31011e6:	68 48 00 00 00       	push   0x48
 31011eb:	e9 50 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 31011f0:	ff 25 04 21 10 03    	jmp    DWORD PTR ds:0x3102104
 31011f6:	68 50 00 00 00       	push   0x50
 31011fb:	e9 40 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 3101200:	ff 25 08 21 10 03    	jmp    DWORD PTR ds:0x3102108
 3101206:	68 58 00 00 00       	push   0x58
 310120b:	e9 30 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 3101210:	ff 25 0c 21 10 03    	jmp    DWORD PTR ds:0x310210c
 3101216:	68 60 00 00 00       	push   0x60
 310121b:	e9 20 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 3101220:	ff 25 10 21 10 03    	jmp    DWORD PTR ds:0x3102110
 3101226:	68 68 00 00 00       	push   0x68
 310122b:	e9 10 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 3101230:	ff 25 14 21 10 03    	jmp    DWORD PTR ds:0x3102114
 3101236:	68 70 00 00 00       	push   0x70
 310123b:	e9 00 ff ff ff       	jmp    3101140 <kShell+0x3cc>
 3101240:	ff 25 18 21 10 03    	jmp    DWORD PTR ds:0x3102118
 3101246:	68 78 00 00 00       	push   0x78
 310124b:	e9 f0 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 3101250:	ff 25 1c 21 10 03    	jmp    DWORD PTR ds:0x310211c
 3101256:	68 80 00 00 00       	push   0x80
 310125b:	e9 e0 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 3101260:	ff 25 20 21 10 03    	jmp    DWORD PTR ds:0x3102120
 3101266:	68 88 00 00 00       	push   0x88
 310126b:	e9 d0 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 3101270:	ff 25 24 21 10 03    	jmp    DWORD PTR ds:0x3102124
 3101276:	68 90 00 00 00       	push   0x90
 310127b:	e9 c0 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 3101280:	ff 25 28 21 10 03    	jmp    DWORD PTR ds:0x3102128
 3101286:	68 98 00 00 00       	push   0x98
 310128b:	e9 b0 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 3101290:	ff 25 2c 21 10 03    	jmp    DWORD PTR ds:0x310212c
 3101296:	68 a0 00 00 00       	push   0xa0
 310129b:	e9 a0 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 31012a0:	ff 25 30 21 10 03    	jmp    DWORD PTR ds:0x3102130
 31012a6:	68 a8 00 00 00       	push   0xa8
 31012ab:	e9 90 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 31012b0:	ff 25 34 21 10 03    	jmp    DWORD PTR ds:0x3102134
 31012b6:	68 b0 00 00 00       	push   0xb0
 31012bb:	e9 80 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 31012c0:	ff 25 38 21 10 03    	jmp    DWORD PTR ds:0x3102138
 31012c6:	68 b8 00 00 00       	push   0xb8
 31012cb:	e9 70 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 31012d0:	ff 25 3c 21 10 03    	jmp    DWORD PTR ds:0x310213c
 31012d6:	68 c0 00 00 00       	push   0xc0
 31012db:	e9 60 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 31012e0:	ff 25 40 21 10 03    	jmp    DWORD PTR ds:0x3102140
 31012e6:	68 c8 00 00 00       	push   0xc8
 31012eb:	e9 50 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 31012f0:	ff 25 44 21 10 03    	jmp    DWORD PTR ds:0x3102144
 31012f6:	68 d0 00 00 00       	push   0xd0
 31012fb:	e9 40 fe ff ff       	jmp    3101140 <kShell+0x3cc>
 3101300:	ff 25 48 21 10 03    	jmp    DWORD PTR ds:0x3102148
 3101306:	68 d8 00 00 00       	push   0xd8
 310130b:	e9 30 fe ff ff       	jmp    3101140 <kShell+0x3cc>

Disassembly of section .rodata:

03101310 <.rodata>:
 3101310:	63 6c 65 61          	arpl   WORD PTR [ebp+eiz*2+0x61],bp
 3101314:	72 00                	jb     3101316 <kShell+0x5a2>
 3101316:	43                   	inc    ebx
 3101317:	6c                   	ins    BYTE PTR es:[edi],dx
 3101318:	65                   	gs
 3101319:	61                   	popa   
 310131a:	72 20                	jb     310133c <kShell+0x5c8>
 310131c:	74 68                	je     3101386 <kShell+0x612>
 310131e:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 3101322:	72 65                	jb     3101389 <kShell+0x615>
 3101324:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101326:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 3101329:	76 00                	jbe    310132b <kShell+0x5b7>
 310132b:	50                   	push   eax
 310132c:	72 69                	jb     3101397 <kShell+0x623>
 310132e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310132f:	74 20                	je     3101351 <kShell+0x5dd>
 3101331:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101333:	76 69                	jbe    310139e <kShell+0x62a>
 3101335:	72 6f                	jb     31013a6 <kShell+0x632>
 3101337:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101338:	6d                   	ins    DWORD PTR es:[edi],dx
 3101339:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 310133b:	74 00                	je     310133d <kShell+0x5c9>
 310133d:	65                   	gs
 310133e:	78 65                	js     31013a5 <kShell+0x631>
 3101340:	63 00                	arpl   WORD PTR [eax],ax
 3101342:	45                   	inc    ebp
 3101343:	78 65                	js     31013aa <kShell+0x636>
 3101345:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101348:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 310134c:	70 72                	jo     31013c0 <kShell+0x64c>
 310134e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310134f:	67 72 61             	addr16 jb 31013b3 <kShell+0x63f>
 3101352:	6d                   	ins    DWORD PTR es:[edi],dx
 3101353:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101356:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 310135d:	20 
 310135e:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3101362:	6c                   	ins    BYTE PTR es:[edi],dx
 3101363:	6c                   	ins    BYTE PTR es:[edi],dx
 3101364:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101367:	6c                   	ins    BYTE PTR es:[edi],dx
 3101368:	70 00                	jo     310136a <kShell+0x5f6>
 310136a:	47                   	inc    edi
 310136b:	65                   	gs
 310136c:	74 20                	je     310138e <kShell+0x61a>
 310136e:	68 65 6c 70 20       	push   0x20706c65
 3101373:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101377:	73 20                	jae    3101399 <kShell+0x625>
 3101379:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3101380:	74 69                	je     31013eb <kShell+0x677>
 3101382:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101383:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101384:	29 00                	sub    DWORD PTR [eax],eax
 3101386:	70 77                	jo     31013ff <kShell+0x68b>
 3101388:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 310138c:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3101393:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3101397:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 310139b:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 31013a0:	79 00                	jns    31013a2 <kShell+0x62e>
 31013a2:	72 65                	jb     3101409 <kShell+0x695>
 31013a4:	70 65                	jo     310140b <kShell+0x697>
 31013a6:	61                   	popa   
 31013a7:	74 00                	je     31013a9 <kShell+0x635>
 31013a9:	52                   	push   edx
 31013aa:	65                   	gs
 31013ab:	70 65                	jo     3101412 <kShell+0x69e>
 31013ad:	61                   	popa   
 31013ae:	74 20                	je     31013d0 <kShell+0x65c>
 31013b0:	61                   	popa   
 31013b1:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 31013b4:	6d                   	ins    DWORD PTR es:[edi],dx
 31013b5:	6d                   	ins    DWORD PTR es:[edi],dx
 31013b6:	61                   	popa   
 31013b7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31013b8:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 31013bc:	74 69                	je     3101427 <kShell+0x6b3>
 31013be:	6d                   	ins    DWORD PTR es:[edi],dx
 31013bf:	65                   	gs
 31013c0:	73 00                	jae    31013c2 <kShell+0x64e>
 31013c2:	73 65                	jae    3101429 <kShell+0x6b5>
 31013c4:	74 00                	je     31013c6 <kShell+0x652>
 31013c6:	53                   	push   ebx
 31013c7:	65                   	gs
 31013c8:	74 20                	je     31013ea <kShell+0x676>
 31013ca:	61                   	popa   
 31013cb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31013cc:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 31013cf:	76 69                	jbe    310143a <kShell+0x6c6>
 31013d1:	72 6f                	jb     3101442 <kShell+0x6ce>
 31013d3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31013d4:	6d                   	ins    DWORD PTR es:[edi],dx
 31013d5:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31013d7:	74 20                	je     31013f9 <kShell+0x685>
 31013d9:	76 61                	jbe    310143c <kShell+0x6c8>
 31013db:	72 69                	jb     3101446 <kShell+0x6d2>
 31013dd:	61                   	popa   
 31013de:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 31013e2:	73 6c                	jae    3101450 <kShell+0x6dc>
 31013e4:	65                   	gs
 31013e5:	65                   	gs
 31013e6:	70 00                	jo     31013e8 <kShell+0x674>
 31013e8:	53                   	push   ebx
 31013e9:	6c                   	ins    BYTE PTR es:[edi],dx
 31013ea:	65                   	gs
 31013eb:	65                   	gs
 31013ec:	70 20                	jo     310140e <kShell+0x69a>
 31013ee:	66 6f                	outs   dx,WORD PTR ds:[esi]
 31013f0:	72 20                	jb     3101412 <kShell+0x69e>
 31013f2:	78 20                	js     3101414 <kShell+0x6a0>
 31013f4:	73 65                	jae    310145b <kShell+0x6e7>
 31013f6:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 31013f9:	64                   	fs
 31013fa:	73 00                	jae    31013fc <kShell+0x688>
 31013fc:	74 69                	je     3101467 <kShell+0x6f3>
 31013fe:	6d                   	ins    DWORD PTR es:[edi],dx
 31013ff:	65 00 00             	add    BYTE PTR gs:[eax],al
 3101402:	00 00                	add    BYTE PTR [eax],al
 3101404:	54                   	push   esp
 3101405:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 310140c:	72 6f                	jb     310147d <kShell+0x709>
 310140e:	67 72 61             	addr16 jb 3101472 <kShell+0x6fe>
 3101411:	6d                   	ins    DWORD PTR es:[edi],dx
 3101412:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3101415:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 310141c:	72 
 310141d:	75 6e                	jne    310148d <kShell+0x719>
 310141f:	73 2e                	jae    310144f <kShell+0x6db>
 3101421:	0a 09                	or     cl,BYTE PTR [ecx]
 3101423:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 3101426:	61                   	popa   
 3101427:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 310142b:	74 69                	je     3101496 <kShell+0x722>
 310142d:	6d                   	ins    DWORD PTR es:[edi],dx
 310142e:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 3101432:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101433:	67 72 61             	addr16 jb 3101497 <kShell+0x723>
 3101436:	6d                   	ins    DWORD PTR es:[edi],dx
 3101437:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 310143a:	61                   	popa   
 310143b:	72 61                	jb     310149e <kShell+0x72a>
 310143d:	6d                   	ins    DWORD PTR es:[edi],dx
 310143e:	65                   	gs
 310143f:	74 65                	je     31014a6 <kShell+0x732>
 3101441:	72 73                	jb     31014b6 <kShell+0x742>
 3101443:	5d                   	pop    ebp
 3101444:	00 1b                	add    BYTE PTR [ebx],bl
 3101446:	5b                   	pop    ebx
 3101447:	32 4a 00             	xor    cl,BYTE PTR [edx+0x0]
 310144a:	25 73 0a 00 3d       	and    eax,0x3d000a73
 310144f:	00 55 73             	add    BYTE PTR [ebp+0x73],dl
 3101452:	61                   	popa   
 3101453:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 3101457:	73 65                	jae    31014be <kShell+0x74a>
 3101459:	74 20                	je     310147b <kShell+0x707>
 310145b:	76 61                	jbe    31014be <kShell+0x74a>
 310145d:	72 69                	jb     31014c8 <kShell+0x754>
 310145f:	61                   	popa   
 3101460:	62 6c 65 3d          	bound  ebp,QWORD PTR [ebp+eiz*2+0x3d]
 3101464:	76 61                	jbe    31014c7 <kShell+0x753>
 3101466:	6c                   	ins    BYTE PTR es:[edi],dx
 3101467:	75 65                	jne    31014ce <kShell+0x75a>
 3101469:	0a 00                	or     al,BYTE PTR [eax]
 310146b:	4c                   	dec    esp
 310146c:	41                   	inc    ecx
 310146d:	53                   	push   ebx
 310146e:	54                   	push   esp
 310146f:	45                   	inc    ebp
 3101470:	58                   	pop    eax
 3101471:	49                   	dec    ecx
 3101472:	54                   	push   esp
 3101473:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3101476:	72 6f                	jb     31014e7 <kShell+0x773>
 3101478:	72 20                	jb     310149a <kShell+0x726>
 310147a:	65                   	gs
 310147b:	78 65                	js     31014e2 <kShell+0x76e>
 310147d:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101480:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3101487:	00 46 6f             	add    BYTE PTR [esi+0x6f],al
 310148a:	72 6b                	jb     31014f7 <kShell+0x783>
 310148c:	20 65 72             	and    BYTE PTR [ebp+0x72],ah
 310148f:	72 6f                	jb     3101500 <kShell+0x78c>
 3101491:	72 20                	jb     31014b3 <kShell+0x73f>
 3101493:	25 75 00 65 78       	and    eax,0x78650075
 3101498:	65 63 54 69 6d       	arpl   WORD PTR gs:[ecx+ebp*2+0x6d],dx
 310149d:	65 3a 20             	cmp    ah,BYTE PTR gs:[eax]
 31014a0:	43                   	inc    ebx
 31014a1:	61                   	popa   
 31014a2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31014a3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31014a4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31014a5:	74 20                	je     31014c7 <kShell+0x753>
 31014a7:	65                   	gs
 31014a8:	78 65                	js     310150f <kShell+0x79b>
 31014aa:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 31014ad:	65 20 25 73 0a 00 25 	and    BYTE PTR gs:0x25000a73,ah
 31014b4:	75 20                	jne    31014d6 <kShell+0x762>
 31014b6:	74 69                	je     3101521 <kShell+0x7ad>
 31014b8:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 31014bb:	0a 00                	or     al,BYTE PTR [eax]
 31014bd:	48                   	dec    eax
 31014be:	65                   	gs
 31014bf:	6c                   	ins    BYTE PTR es:[edi],dx
 31014c0:	70 3a                	jo     31014fc <kShell+0x788>
 31014c2:	20 25 73 0a 00 09    	and    BYTE PTR ds:0x9000a73,ah
 31014c8:	25 73 3a 20 25       	and    eax,0x25203a73
 31014cd:	73 0a                	jae    31014d9 <kShell+0x765>
 31014cf:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 31014d2:	71 75                	jno    3101549 <kShell+0x7d5>
 31014d4:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 31014db:	70 61                	jo     310153e <kShell+0x7ca>
 31014dd:	72 61                	jb     3101540 <kShell+0x7cc>
 31014df:	6d                   	ins    DWORD PTR es:[edi],dx
 31014e0:	65                   	gs
 31014e1:	74 65                	je     3101548 <kShell+0x7d4>
 31014e3:	72 20                	jb     3101505 <kShell+0x791>
 31014e5:	77 68                	ja     310154f <kShell+0x7db>
 31014e7:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 31014ee:	74 68                	je     3101558 <kShell+0x7e4>
 31014f0:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 31014f4:	6d                   	ins    DWORD PTR es:[edi],dx
 31014f5:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 31014f8:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 31014fb:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 31014fe:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101501:	64                   	fs
 3101502:	73 20                	jae    3101524 <kShell+0x7b0>
 3101504:	74 6f                	je     3101575 <kShell+0x801>
 3101506:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3101509:	65                   	gs
 310150a:	65                   	gs
 310150b:	70 0a                	jo     3101517 <kShell+0x7a3>
 310150d:	00 00                	add    BYTE PTR [eax],al
 310150f:	00 63 6c             	add    BYTE PTR [ebx+0x6c],ah
 3101512:	65                   	gs
 3101513:	61                   	popa   
 3101514:	72 00                	jb     3101516 <kShell+0x7a2>
 3101516:	43                   	inc    ebx
 3101517:	6c                   	ins    BYTE PTR es:[edi],dx
 3101518:	65                   	gs
 3101519:	61                   	popa   
 310151a:	72 20                	jb     310153c <kShell+0x7c8>
 310151c:	74 68                	je     3101586 <kShell+0x812>
 310151e:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 3101522:	72 65                	jb     3101589 <kShell+0x815>
 3101524:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101526:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 3101529:	76 00                	jbe    310152b <kShell+0x7b7>
 310152b:	50                   	push   eax
 310152c:	72 69                	jb     3101597 <kShell+0x823>
 310152e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310152f:	74 20                	je     3101551 <kShell+0x7dd>
 3101531:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101533:	76 69                	jbe    310159e <kShell+0x82a>
 3101535:	72 6f                	jb     31015a6 <kShell+0x832>
 3101537:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101538:	6d                   	ins    DWORD PTR es:[edi],dx
 3101539:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 310153b:	74 00                	je     310153d <kShell+0x7c9>
 310153d:	65                   	gs
 310153e:	78 65                	js     31015a5 <kShell+0x831>
 3101540:	63 00                	arpl   WORD PTR [eax],ax
 3101542:	45                   	inc    ebp
 3101543:	78 65                	js     31015aa <kShell+0x836>
 3101545:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101548:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 310154c:	70 72                	jo     31015c0 <kShell+0x84c>
 310154e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310154f:	67 72 61             	addr16 jb 31015b3 <kShell+0x83f>
 3101552:	6d                   	ins    DWORD PTR es:[edi],dx
 3101553:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101556:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 310155d:	20 
 310155e:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3101562:	6c                   	ins    BYTE PTR es:[edi],dx
 3101563:	6c                   	ins    BYTE PTR es:[edi],dx
 3101564:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101567:	6c                   	ins    BYTE PTR es:[edi],dx
 3101568:	70 00                	jo     310156a <kShell+0x7f6>
 310156a:	47                   	inc    edi
 310156b:	65                   	gs
 310156c:	74 20                	je     310158e <kShell+0x81a>
 310156e:	68 65 6c 70 20       	push   0x20706c65
 3101573:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101577:	73 20                	jae    3101599 <kShell+0x825>
 3101579:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3101580:	74 69                	je     31015eb <kShell+0x877>
 3101582:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101583:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101584:	29 00                	sub    DWORD PTR [eax],eax
 3101586:	70 77                	jo     31015ff <kShell+0x88b>
 3101588:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 310158c:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3101593:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3101597:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 310159b:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 31015a0:	79 00                	jns    31015a2 <kShell+0x82e>
 31015a2:	72 65                	jb     3101609 <kShell+0x895>
 31015a4:	70 65                	jo     310160b <kShell+0x897>
 31015a6:	61                   	popa   
 31015a7:	74 00                	je     31015a9 <kShell+0x835>
 31015a9:	52                   	push   edx
 31015aa:	65                   	gs
 31015ab:	70 65                	jo     3101612 <kShell+0x89e>
 31015ad:	61                   	popa   
 31015ae:	74 20                	je     31015d0 <kShell+0x85c>
 31015b0:	61                   	popa   
 31015b1:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 31015b4:	6d                   	ins    DWORD PTR es:[edi],dx
 31015b5:	6d                   	ins    DWORD PTR es:[edi],dx
 31015b6:	61                   	popa   
 31015b7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31015b8:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 31015bc:	74 69                	je     3101627 <kShell+0x8b3>
 31015be:	6d                   	ins    DWORD PTR es:[edi],dx
 31015bf:	65                   	gs
 31015c0:	73 00                	jae    31015c2 <kShell+0x84e>
 31015c2:	73 65                	jae    3101629 <kShell+0x8b5>
 31015c4:	74 00                	je     31015c6 <kShell+0x852>
 31015c6:	53                   	push   ebx
 31015c7:	65                   	gs
 31015c8:	74 20                	je     31015ea <kShell+0x876>
 31015ca:	61                   	popa   
 31015cb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31015cc:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 31015cf:	76 69                	jbe    310163a <kShell+0x8c6>
 31015d1:	72 6f                	jb     3101642 <kShell+0x8ce>
 31015d3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31015d4:	6d                   	ins    DWORD PTR es:[edi],dx
 31015d5:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31015d7:	74 20                	je     31015f9 <kShell+0x885>
 31015d9:	76 61                	jbe    310163c <kShell+0x8c8>
 31015db:	72 69                	jb     3101646 <kShell+0x8d2>
 31015dd:	61                   	popa   
 31015de:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 31015e2:	73 6c                	jae    3101650 <kShell+0x8dc>
 31015e4:	65                   	gs
 31015e5:	65                   	gs
 31015e6:	70 00                	jo     31015e8 <kShell+0x874>
 31015e8:	53                   	push   ebx
 31015e9:	6c                   	ins    BYTE PTR es:[edi],dx
 31015ea:	65                   	gs
 31015eb:	65                   	gs
 31015ec:	70 20                	jo     310160e <kShell+0x89a>
 31015ee:	66 6f                	outs   dx,WORD PTR ds:[esi]
 31015f0:	72 20                	jb     3101612 <kShell+0x89e>
 31015f2:	78 20                	js     3101614 <kShell+0x8a0>
 31015f4:	73 65                	jae    310165b <kShell+0x8e7>
 31015f6:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 31015f9:	64                   	fs
 31015fa:	73 00                	jae    31015fc <kShell+0x888>
 31015fc:	74 69                	je     3101667 <kShell+0x8f3>
 31015fe:	6d                   	ins    DWORD PTR es:[edi],dx
 31015ff:	65 00 00             	add    BYTE PTR gs:[eax],al
 3101602:	00 00                	add    BYTE PTR [eax],al
 3101604:	54                   	push   esp
 3101605:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 310160c:	72 6f                	jb     310167d <kShell+0x909>
 310160e:	67 72 61             	addr16 jb 3101672 <kShell+0x8fe>
 3101611:	6d                   	ins    DWORD PTR es:[edi],dx
 3101612:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3101615:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 310161c:	72 
 310161d:	75 6e                	jne    310168d <kShell+0x919>
 310161f:	73 2e                	jae    310164f <kShell+0x8db>
 3101621:	0a 09                	or     cl,BYTE PTR [ecx]
 3101623:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 3101626:	61                   	popa   
 3101627:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 310162b:	74 69                	je     3101696 <kShell+0x922>
 310162d:	6d                   	ins    DWORD PTR es:[edi],dx
 310162e:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 3101632:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101633:	67 72 61             	addr16 jb 3101697 <kShell+0x923>
 3101636:	6d                   	ins    DWORD PTR es:[edi],dx
 3101637:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 310163a:	61                   	popa   
 310163b:	72 61                	jb     310169e <kShell+0x92a>
 310163d:	6d                   	ins    DWORD PTR es:[edi],dx
 310163e:	65                   	gs
 310163f:	74 65                	je     31016a6 <kShell+0x932>
 3101641:	72 73                	jb     31016b6 <kShell+0x942>
 3101643:	5d                   	pop    ebp
 3101644:	00 3d 00 25 73 20    	add    BYTE PTR ds:0x20732500,bh
 310164a:	25 73 3e 20 00       	and    eax,0x203e73
 310164f:	25 73 00 20 09       	and    eax,0x9200073
 3101654:	0a 2d 2c 00 6b 53    	or     ch,BYTE PTR ds:0x536b002c
 310165a:	68 65 6c 6c 00       	push   0x6c6c65
 310165f:	43                   	inc    ebx
 3101660:	57                   	push   edi
 3101661:	44                   	inc    esp
 3101662:	00 1b                	add    BYTE PTR [ebx],bl
 3101664:	5b                   	pop    ebx
 3101665:	31 44 20 1b          	xor    DWORD PTR [eax+eiz*1+0x1b],eax
 3101669:	5b                   	pop    ebx
 310166a:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 310166e:	5b                   	pop    ebx
 310166f:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 3101673:	5b                   	pop    ebx
 3101674:	31 43 00             	xor    DWORD PTR [ebx+0x0],eax
 3101677:	0a 00                	or     al,BYTE PTR [eax]
 3101679:	25                   	.byte 0x25
 310167a:	63 00                	arpl   WORD PTR [eax],ax

Disassembly of section .eh_frame:

0310167c <.eh_frame>:
 310167c:	14 00                	adc    al,0x0
 310167e:	00 00                	add    BYTE PTR [eax],al
 3101680:	00 00                	add    BYTE PTR [eax],al
 3101682:	00 00                	add    BYTE PTR [eax],al
 3101684:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3101687:	00 01                	add    BYTE PTR [ecx],al
 3101689:	7c 08                	jl     3101693 <kShell+0x91f>
 310168b:	01 1b                	add    DWORD PTR [ebx],ebx
 310168d:	0c 04                	or     al,0x4
 310168f:	04 88                	add    al,0x88
 3101691:	01 00                	add    DWORD PTR [eax],eax
 3101693:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101696:	00 00                	add    BYTE PTR [eax],al
 3101698:	1c 00                	sbb    al,0x0
 310169a:	00 00                	add    BYTE PTR [eax],al
 310169c:	64                   	fs
 310169d:	e9 ff ff 19 00       	jmp    32a16a1 <commandHistory+0x19f1e1>
 31016a2:	00 00                	add    BYTE PTR [eax],al
 31016a4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31016a7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31016ad:	55                   	push   ebp
 31016ae:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31016b1:	04 00                	add    al,0x0
 31016b3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31016b6:	00 00                	add    BYTE PTR [eax],al
 31016b8:	3c 00                	cmp    al,0x0
 31016ba:	00 00                	add    BYTE PTR [eax],al
 31016bc:	5d                   	pop    ebp
 31016bd:	e9 ff ff 4f 00       	jmp    36016c1 <commandHistory+0x4ff201>
 31016c2:	00 00                	add    BYTE PTR [eax],al
 31016c4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31016c7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31016cd:	02 4b c5             	add    cl,BYTE PTR [ebx-0x3b]
 31016d0:	0c 04                	or     al,0x4
 31016d2:	04 00                	add    al,0x0
 31016d4:	1c 00                	sbb    al,0x0
 31016d6:	00 00                	add    BYTE PTR [eax],al
 31016d8:	5c                   	pop    esp
 31016d9:	00 00                	add    BYTE PTR [eax],al
 31016db:	00 8c e9 ff ff 5d 01 	add    BYTE PTR [ecx+ebp*8+0x15dffff],cl
 31016e2:	00 00                	add    BYTE PTR [eax],al
 31016e4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31016e7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31016ed:	03 59 01             	add    ebx,DWORD PTR [ecx+0x1]
 31016f0:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31016f3:	04 1c                	add    al,0x1c
 31016f5:	00 00                	add    BYTE PTR [eax],al
 31016f7:	00 7c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bh
 31016fb:	00 c9                	add    cl,cl
 31016fd:	ea ff ff 8b 00 00 00 	jmp    0x0:0x8bffff
 3101704:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101707:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310170d:	02 87 c5 0c 04 04    	add    al,BYTE PTR [edi+0x4040cc5]
 3101713:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101716:	00 00                	add    BYTE PTR [eax],al
 3101718:	9c                   	pushf  
 3101719:	00 00                	add    BYTE PTR [eax],al
 310171b:	00 34 eb             	add    BYTE PTR [ebx+ebp*8],dh
 310171e:	ff                   	(bad)  
 310171f:	ff b4 01 00 00 00 41 	push   DWORD PTR [ecx+eax*1+0x41000000]
 3101726:	0e                   	push   cs
 3101727:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310172d:	03 b0 01 c5 0c 04    	add    esi,DWORD PTR [eax+0x40cc501]
 3101733:	04 1c                	add    al,0x1c
 3101735:	00 00                	add    BYTE PTR [eax],al
 3101737:	00 bc 00 00 00 c8 ec 	add    BYTE PTR [eax+eax*1-0x13380000],bh
 310173e:	ff                   	(bad)  
 310173f:	ff 19                	call   FWORD PTR [ecx]
 3101741:	00 00                	add    BYTE PTR [eax],al
 3101743:	00 00                	add    BYTE PTR [eax],al
 3101745:	41                   	inc    ecx
 3101746:	0e                   	push   cs
 3101747:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310174d:	55                   	push   ebp
 310174e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101751:	04 00                	add    al,0x0
 3101753:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101756:	00 00                	add    BYTE PTR [eax],al
 3101758:	dc 00                	fadd   QWORD PTR [eax]
 310175a:	00 00                	add    BYTE PTR [eax],al
 310175c:	c1 ec ff             	shr    esp,0xff
 310175f:	ff 65 00             	jmp    DWORD PTR [ebp+0x0]
 3101762:	00 00                	add    BYTE PTR [eax],al
 3101764:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101767:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310176d:	02 61 c5             	add    ah,BYTE PTR [ecx-0x3b]
 3101770:	0c 04                	or     al,0x4
 3101772:	04 00                	add    al,0x0
 3101774:	1c 00                	sbb    al,0x0
 3101776:	00 00                	add    BYTE PTR [eax],al
 3101778:	fc                   	cld    
 3101779:	00 00                	add    BYTE PTR [eax],al
 310177b:	00 06                	add    BYTE PTR [esi],al
 310177d:	ed                   	in     eax,dx
 310177e:	ff                   	(bad)  
 310177f:	ff 19                	call   FWORD PTR [ecx]
 3101781:	00 00                	add    BYTE PTR [eax],al
 3101783:	00 00                	add    BYTE PTR [eax],al
 3101785:	41                   	inc    ecx
 3101786:	0e                   	push   cs
 3101787:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310178d:	55                   	push   ebp
 310178e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101791:	04 00                	add    al,0x0
 3101793:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101796:	00 00                	add    BYTE PTR [eax],al
 3101798:	1c 01                	sbb    al,0x1
 310179a:	00 00                	add    BYTE PTR [eax],al
 310179c:	ff ec                	jmp    <internal disassembler error>
 310179e:	ff                   	(bad)  
 310179f:	ff 58 00             	call   FWORD PTR [eax+0x0]
 31017a2:	00 00                	add    BYTE PTR [eax],al
 31017a4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31017a7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31017ad:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 31017b1:	04 04                	add    al,0x4
 31017b3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31017b6:	00 00                	add    BYTE PTR [eax],al
 31017b8:	3c 01                	cmp    al,0x1
 31017ba:	00 00                	add    BYTE PTR [eax],al
 31017bc:	37                   	aaa    
 31017bd:	ed                   	in     eax,dx
 31017be:	ff                   	(bad)  
 31017bf:	ff ce                	dec    esi
 31017c1:	00 00                	add    BYTE PTR [eax],al
 31017c3:	00 00                	add    BYTE PTR [eax],al
 31017c5:	41                   	inc    ecx
 31017c6:	0e                   	push   cs
 31017c7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31017cd:	02 ca                	add    cl,dl
 31017cf:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31017d2:	04 00                	add    al,0x0
 31017d4:	1c 00                	sbb    al,0x0
 31017d6:	00 00                	add    BYTE PTR [eax],al
 31017d8:	5c                   	pop    esp
 31017d9:	01 00                	add    DWORD PTR [eax],eax
 31017db:	00 e5                	add    ch,ah
 31017dd:	ed                   	in     eax,dx
 31017de:	ff                   	(bad)  
 31017df:	ff 4e 00             	dec    DWORD PTR [esi+0x0]
 31017e2:	00 00                	add    BYTE PTR [eax],al
 31017e4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31017e7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31017ed:	02 4a c5             	add    cl,BYTE PTR [edx-0x3b]
 31017f0:	0c 04                	or     al,0x4
 31017f2:	04 00                	add    al,0x0
 31017f4:	1c 00                	sbb    al,0x0
 31017f6:	00 00                	add    BYTE PTR [eax],al
 31017f8:	7c 01                	jl     31017fb <kShell+0xa87>
 31017fa:	00 00                	add    BYTE PTR [eax],al
 31017fc:	13 ee                	adc    ebp,esi
 31017fe:	ff                   	(bad)  
 31017ff:	ff 67 00             	jmp    DWORD PTR [edi+0x0]
 3101802:	00 00                	add    BYTE PTR [eax],al
 3101804:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101807:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310180d:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
 3101810:	0c 04                	or     al,0x4
 3101812:	04 00                	add    al,0x0
 3101814:	20 00                	and    BYTE PTR [eax],al
 3101816:	00 00                	add    BYTE PTR [eax],al
 3101818:	9c                   	pushf  
 3101819:	01 00                	add    DWORD PTR [eax],eax
 310181b:	00 5c ee ff          	add    BYTE PTR [esi+ebp*8-0x1],bl
 310181f:	ff a6 00 00 00 00    	jmp    DWORD PTR [esi+0x0]
 3101825:	41                   	inc    ecx
 3101826:	0e                   	push   cs
 3101827:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310182d:	44                   	inc    esp
 310182e:	83 03 02             	add    DWORD PTR [ebx],0x2
 3101831:	9e                   	sahf   
 3101832:	c5 c3 0c             	(bad)  
 3101835:	04 04                	add    al,0x4
 3101837:	00 20                	add    BYTE PTR [eax],ah
 3101839:	00 00                	add    BYTE PTR [eax],al
 310183b:	00 c0                	add    al,al
 310183d:	01 00                	add    DWORD PTR [eax],eax
 310183f:	00 de                	add    dh,bl
 3101841:	ee                   	out    dx,al
 3101842:	ff                   	(bad)  
 3101843:	ff a9 01 00 00 00    	jmp    FWORD PTR [ecx+0x1]
 3101849:	41                   	inc    ecx
 310184a:	0e                   	push   cs
 310184b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101851:	44                   	inc    esp
 3101852:	83 03 03             	add    DWORD PTR [ebx],0x3
 3101855:	a1 01 c5 c3 0c       	mov    eax,ds:0xcc3c501
 310185a:	04 04                	add    al,0x4
 310185c:	1c 00                	sbb    al,0x0
 310185e:	00 00                	add    BYTE PTR [eax],al
 3101860:	e4 01                	in     al,0x1
 3101862:	00 00                	add    BYTE PTR [eax],al
 3101864:	63 f0                	arpl   ax,si
 3101866:	ff                   	(bad)  
 3101867:	ff 69 00             	jmp    FWORD PTR [ecx+0x0]
 310186a:	00 00                	add    BYTE PTR [eax],al
 310186c:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310186f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101875:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3101878:	0c 04                	or     al,0x4
 310187a:	04 00                	add    al,0x0
 310187c:	1c 00                	sbb    al,0x0
 310187e:	00 00                	add    BYTE PTR [eax],al
 3101880:	04 02                	add    al,0x2
 3101882:	00 00                	add    BYTE PTR [eax],al
 3101884:	ac                   	lods   al,BYTE PTR ds:[esi]
 3101885:	f0 ff                	lock (bad) 
 3101887:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 310188d:	41                   	inc    ecx
 310188e:	0e                   	push   cs
 310188f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101895:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 310189b:	04 20                	add    al,0x20
 310189d:	00 00                	add    BYTE PTR [eax],al
 310189f:	00 24 02             	add    BYTE PTR [edx+eax*1],ah
 31018a2:	00 00                	add    BYTE PTR [eax],al
 31018a4:	1a f3                	sbb    dh,bl
 31018a6:	ff                   	(bad)  
 31018a7:	ff 76 00             	push   DWORD PTR [esi+0x0]
 31018aa:	00 00                	add    BYTE PTR [eax],al
 31018ac:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31018af:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31018b5:	44                   	inc    esp
 31018b6:	83 03 02             	add    DWORD PTR [ebx],0x2
 31018b9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31018ba:	c5 c3 0c             	(bad)  
 31018bd:	04 04                	add    al,0x4
 31018bf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31018c2:	00 00                	add    BYTE PTR [eax],al
 31018c4:	48                   	dec    eax
 31018c5:	02 00                	add    al,BYTE PTR [eax]
 31018c7:	00 6c f3 ff          	add    BYTE PTR [ebx+esi*8-0x1],ch
 31018cb:	ff                   	(bad)  
 31018cc:	3d 00 00 00 00       	cmp    eax,0x0
 31018d1:	41                   	inc    ecx
 31018d2:	0e                   	push   cs
 31018d3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31018d9:	79 c5                	jns    31018a0 <kShell+0xb2c>
 31018db:	0c 04                	or     al,0x4
 31018dd:	04 00                	add    al,0x0
 31018df:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31018e2:	00 00                	add    BYTE PTR [eax],al
 31018e4:	68 02 00 00 89       	push   0x89000002
 31018e9:	f3 ff                	repz (bad) 
 31018eb:	ff 8c 00 00 00 00 41 	dec    DWORD PTR [eax+eax*1+0x41000000]
 31018f2:	0e                   	push   cs
 31018f3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31018f9:	02 88 c5 0c 04 04    	add    cl,BYTE PTR [eax+0x4040cc5]
 31018ff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101902:	00 00                	add    BYTE PTR [eax],al
 3101904:	88 02                	mov    BYTE PTR [edx],al
 3101906:	00 00                	add    BYTE PTR [eax],al
 3101908:	f5                   	cmc    
 3101909:	f3 ff                	repz (bad) 
 310190b:	ff 2e                	jmp    FWORD PTR [esi]
 310190d:	00 00                	add    BYTE PTR [eax],al
 310190f:	00 00                	add    BYTE PTR [eax],al
 3101911:	41                   	inc    ecx
 3101912:	0e                   	push   cs
 3101913:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101919:	6a c5                	push   0xffffffc5
 310191b:	0c 04                	or     al,0x4
 310191d:	04 00                	add    al,0x0
 310191f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101922:	00 00                	add    BYTE PTR [eax],al
 3101924:	a8 02                	test   al,0x2
 3101926:	00 00                	add    BYTE PTR [eax],al
 3101928:	03 f4                	add    esi,esp
 310192a:	ff                   	(bad)  
 310192b:	ff 23                	jmp    DWORD PTR [ebx]
 310192d:	00 00                	add    BYTE PTR [eax],al
 310192f:	00 00                	add    BYTE PTR [eax],al
 3101931:	41                   	inc    ecx
 3101932:	0e                   	push   cs
 3101933:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101939:	5f                   	pop    edi
 310193a:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 310193d:	04 00                	add    al,0x0
 310193f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101942:	00 00                	add    BYTE PTR [eax],al
 3101944:	c8 02 00 00          	enter  0x2,0x0
 3101948:	06                   	push   es
 3101949:	f4                   	hlt    
 310194a:	ff                   	(bad)  
 310194b:	ff 26                	jmp    DWORD PTR [esi]
 310194d:	00 00                	add    BYTE PTR [eax],al
 310194f:	00 00                	add    BYTE PTR [eax],al
 3101951:	41                   	inc    ecx
 3101952:	0e                   	push   cs
 3101953:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101959:	62                   	(bad)  
 310195a:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 310195d:	04 00                	add    al,0x0
 310195f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101962:	00 00                	add    BYTE PTR [eax],al
 3101964:	e8 02 00 00 0c       	call   f10196b <commandHistory+0xbfff4ab>
 3101969:	f4                   	hlt    
 310196a:	ff                   	(bad)  
 310196b:	ff cb                	dec    ebx
 310196d:	03 00                	add    eax,DWORD PTR [eax]
 310196f:	00 00                	add    BYTE PTR [eax],al
 3101971:	41                   	inc    ecx
 3101972:	0e                   	push   cs
 3101973:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101979:	03 c7                	add    eax,edi
 310197b:	03 c5                	add    eax,ebp
 310197d:	0c 04                	or     al,0x4
 310197f:	04                   	.byte 0x4

Disassembly of section .interp:

03101980 <.interp>:
 3101980:	2f                   	das    
 3101981:	6c                   	ins    BYTE PTR es:[edi],dx
 3101982:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3101989:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3101990:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03101994 <.dynsym>:
	...
 31019a4:	09 00                	or     DWORD PTR [eax],eax
	...
 31019ae:	00 00                	add    BYTE PTR [eax],al
 31019b0:	12 00                	adc    al,BYTE PTR [eax]
 31019b2:	00 00                	add    BYTE PTR [eax],al
 31019b4:	10 00                	adc    BYTE PTR [eax],al
	...
 31019be:	00 00                	add    BYTE PTR [eax],al
 31019c0:	12 00                	adc    al,BYTE PTR [eax]
 31019c2:	00 00                	add    BYTE PTR [eax],al
 31019c4:	18 00                	sbb    BYTE PTR [eax],al
	...
 31019ce:	00 00                	add    BYTE PTR [eax],al
 31019d0:	12 00                	adc    al,BYTE PTR [eax]
 31019d2:	00 00                	add    BYTE PTR [eax],al
 31019d4:	1e                   	push   ds
	...
 31019dd:	00 00                	add    BYTE PTR [eax],al
 31019df:	00 12                	add    BYTE PTR [edx],dl
 31019e1:	00 00                	add    BYTE PTR [eax],al
 31019e3:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
 31019e9:	00 00                	add    BYTE PTR [eax],al
 31019eb:	00 00                	add    BYTE PTR [eax],al
 31019ed:	00 00                	add    BYTE PTR [eax],al
 31019ef:	00 12                	add    BYTE PTR [edx],dl
 31019f1:	00 00                	add    BYTE PTR [eax],al
 31019f3:	00 2e                	add    BYTE PTR [esi],ch
	...
 31019fd:	00 00                	add    BYTE PTR [eax],al
 31019ff:	00 12                	add    BYTE PTR [edx],dl
 3101a01:	00 00                	add    BYTE PTR [eax],al
 3101a03:	00 35 00 00 00 00    	add    BYTE PTR ds:0x0,dh
 3101a09:	00 00                	add    BYTE PTR [eax],al
 3101a0b:	00 00                	add    BYTE PTR [eax],al
 3101a0d:	00 00                	add    BYTE PTR [eax],al
 3101a0f:	00 12                	add    BYTE PTR [edx],dl
 3101a11:	00 00                	add    BYTE PTR [eax],al
 3101a13:	00 3a                	add    BYTE PTR [edx],bh
	...
 3101a1d:	00 00                	add    BYTE PTR [eax],al
 3101a1f:	00 12                	add    BYTE PTR [edx],dl
 3101a21:	00 00                	add    BYTE PTR [eax],al
 3101a23:	00 41 00             	add    BYTE PTR [ecx+0x0],al
	...
 3101a2e:	00 00                	add    BYTE PTR [eax],al
 3101a30:	12 00                	adc    al,BYTE PTR [eax]
 3101a32:	00 00                	add    BYTE PTR [eax],al
 3101a34:	48                   	dec    eax
	...
 3101a3d:	00 00                	add    BYTE PTR [eax],al
 3101a3f:	00 12                	add    BYTE PTR [edx],dl
 3101a41:	00 00                	add    BYTE PTR [eax],al
 3101a43:	00 4e 00             	add    BYTE PTR [esi+0x0],cl
	...
 3101a4e:	00 00                	add    BYTE PTR [eax],al
 3101a50:	12 00                	adc    al,BYTE PTR [eax]
 3101a52:	00 00                	add    BYTE PTR [eax],al
 3101a54:	5c                   	pop    esp
	...
 3101a5d:	00 00                	add    BYTE PTR [eax],al
 3101a5f:	00 12                	add    BYTE PTR [edx],dl
 3101a61:	00 00                	add    BYTE PTR [eax],al
 3101a63:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
	...
 3101a6f:	00 12                	add    BYTE PTR [edx],dl
 3101a71:	00 00                	add    BYTE PTR [eax],al
 3101a73:	00 69 00             	add    BYTE PTR [ecx+0x0],ch
	...
 3101a7e:	00 00                	add    BYTE PTR [eax],al
 3101a80:	12 00                	adc    al,BYTE PTR [eax]
 3101a82:	00 00                	add    BYTE PTR [eax],al
 3101a84:	72 00                	jb     3101a86 <kShell+0xd12>
	...
 3101a8e:	00 00                	add    BYTE PTR [eax],al
 3101a90:	12 00                	adc    al,BYTE PTR [eax]
 3101a92:	00 00                	add    BYTE PTR [eax],al
 3101a94:	77 00                	ja     3101a96 <kShell+0xd22>
	...
 3101a9e:	00 00                	add    BYTE PTR [eax],al
 3101aa0:	12 00                	adc    al,BYTE PTR [eax]
 3101aa2:	00 00                	add    BYTE PTR [eax],al
 3101aa4:	7e 00                	jle    3101aa6 <kShell+0xd32>
	...
 3101aae:	00 00                	add    BYTE PTR [eax],al
 3101ab0:	12 00                	adc    al,BYTE PTR [eax]
 3101ab2:	00 00                	add    BYTE PTR [eax],al
 3101ab4:	86 00                	xchg   BYTE PTR [eax],al
	...
 3101abe:	00 00                	add    BYTE PTR [eax],al
 3101ac0:	12 00                	adc    al,BYTE PTR [eax]
 3101ac2:	00 00                	add    BYTE PTR [eax],al
 3101ac4:	8e 00                	mov    es,WORD PTR [eax]
	...
 3101ace:	00 00                	add    BYTE PTR [eax],al
 3101ad0:	12 00                	adc    al,BYTE PTR [eax]
 3101ad2:	00 00                	add    BYTE PTR [eax],al
 3101ad4:	95                   	xchg   ebp,eax
	...
 3101add:	00 00                	add    BYTE PTR [eax],al
 3101adf:	00 12                	add    BYTE PTR [edx],dl
 3101ae1:	00 00                	add    BYTE PTR [eax],al
 3101ae3:	00 9c 00 00 00 00 00 	add    BYTE PTR [eax+eax*1+0x0],bl
 3101aea:	00 00                	add    BYTE PTR [eax],al
 3101aec:	00 00                	add    BYTE PTR [eax],al
 3101aee:	00 00                	add    BYTE PTR [eax],al
 3101af0:	12 00                	adc    al,BYTE PTR [eax]
 3101af2:	00 00                	add    BYTE PTR [eax],al
 3101af4:	a1 00 00 00 00       	mov    eax,ds:0x0
 3101af9:	00 00                	add    BYTE PTR [eax],al
 3101afb:	00 00                	add    BYTE PTR [eax],al
 3101afd:	00 00                	add    BYTE PTR [eax],al
 3101aff:	00 12                	add    BYTE PTR [edx],dl
 3101b01:	00 00                	add    BYTE PTR [eax],al
 3101b03:	00 a8 00 00 00 00    	add    BYTE PTR [eax+0x0],ch
 3101b09:	00 00                	add    BYTE PTR [eax],al
 3101b0b:	00 00                	add    BYTE PTR [eax],al
 3101b0d:	00 00                	add    BYTE PTR [eax],al
 3101b0f:	00 12                	add    BYTE PTR [edx],dl
 3101b11:	00 00                	add    BYTE PTR [eax],al
 3101b13:	00 b0 00 00 00 00    	add    BYTE PTR [eax+0x0],dh
 3101b19:	00 00                	add    BYTE PTR [eax],al
 3101b1b:	00 00                	add    BYTE PTR [eax],al
 3101b1d:	00 00                	add    BYTE PTR [eax],al
 3101b1f:	00 12                	add    BYTE PTR [edx],dl
 3101b21:	00 00                	add    BYTE PTR [eax],al
 3101b23:	00 b7 00 00 00 00    	add    BYTE PTR [edi+0x0],dh
 3101b29:	00 00                	add    BYTE PTR [eax],al
 3101b2b:	00 00                	add    BYTE PTR [eax],al
 3101b2d:	00 00                	add    BYTE PTR [eax],al
 3101b2f:	00 12                	add    BYTE PTR [edx],dl
 3101b31:	00 00                	add    BYTE PTR [eax],al
 3101b33:	00 bc 00 00 00 00 00 	add    BYTE PTR [eax+eax*1+0x0],bh
 3101b3a:	00 00                	add    BYTE PTR [eax],al
 3101b3c:	00 00                	add    BYTE PTR [eax],al
 3101b3e:	00 00                	add    BYTE PTR [eax],al
 3101b40:	12 00                	adc    al,BYTE PTR [eax]
 3101b42:	00 00                	add    BYTE PTR [eax],al
 3101b44:	c3                   	ret    
	...
 3101b4d:	00 00                	add    BYTE PTR [eax],al
 3101b4f:	00 12                	add    BYTE PTR [edx],dl
 3101b51:	00 00                	add    BYTE PTR [eax],al
 3101b53:	00 c9                	add    cl,cl
	...
 3101b5d:	00 00                	add    BYTE PTR [eax],al
 3101b5f:	00 12                	add    BYTE PTR [edx],dl
 3101b61:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

03101b64 <.dynstr>:
 3101b64:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3101b68:	63 2e                	arpl   WORD PTR [esi],bp
 3101b6a:	73 6f                	jae    3101bdb <kShell+0xe67>
 3101b6c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101b6f:	72 63                	jb     3101bd4 <kShell+0xe60>
 3101b71:	70 79                	jo     3101bec <kShell+0xe78>
 3101b73:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3101b76:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3101b7d:	72 
 3101b7e:	69 6e 74 00 70 72 69 	imul   ebp,DWORD PTR [esi+0x74],0x69727000
 3101b85:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101b86:	74 66                	je     3101bee <kShell+0xe7a>
 3101b88:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 3101b8b:	73 65                	jae    3101bf2 <kShell+0xe7e>
 3101b8d:	74 52                	je     3101be1 <kShell+0xe6d>
 3101b8f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101b90:	77 00                	ja     3101b92 <kShell+0xe1e>
 3101b92:	67                   	addr16
 3101b93:	65                   	gs
 3101b94:	74 65                	je     3101bfb <kShell+0xe87>
 3101b96:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101b97:	76 00                	jbe    3101b99 <kShell+0xe25>
 3101b99:	67                   	addr16
 3101b9a:	65                   	gs
 3101b9b:	74 73                	je     3101c10 <kShell+0xe9c>
 3101b9d:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3101ba0:	6d                   	ins    DWORD PTR es:[edi],dx
 3101ba1:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3101ba4:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 3101ba7:	6c                   	ins    BYTE PTR es:[edi],dx
 3101ba8:	6c                   	ins    BYTE PTR es:[edi],dx
 3101ba9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101baa:	63 00                	arpl   WORD PTR [eax],ax
 3101bac:	73 6c                	jae    3101c1a <kShell+0xea6>
 3101bae:	65                   	gs
 3101baf:	65                   	gs
 3101bb0:	70 00                	jo     3101bb2 <kShell+0xe3e>
 3101bb2:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 3101bb5:	6c                   	ins    BYTE PTR es:[edi],dx
 3101bb6:	69 6e 65 54 6f 41 72 	imul   ebp,DWORD PTR [esi+0x65],0x72416f54
 3101bbd:	67 76 00             	addr16 jbe 3101bc0 <kShell+0xe4c>
 3101bc0:	73 74                	jae    3101c36 <kShell+0xec2>
 3101bc2:	72 74                	jb     3101c38 <kShell+0xec4>
 3101bc4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101bc5:	75 6c                	jne    3101c33 <kShell+0xebf>
 3101bc7:	00 69 74             	add    BYTE PTR [ecx+0x74],ch
 3101bca:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101bcb:	61                   	popa   
 3101bcc:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101bcf:	74 74                	je     3101c45 <kShell+0xed1>
 3101bd1:	69 63 6b 73 00 65 78 	imul   esp,DWORD PTR [ebx+0x6b],0x78650073
 3101bd8:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 3101bdb:	73 74                	jae    3101c51 <kShell+0xedd>
 3101bdd:	72 73                	jb     3101c52 <kShell+0xede>
 3101bdf:	74 72                	je     3101c53 <kShell+0xedf>
 3101be1:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101be4:	72 6e                	jb     3101c54 <kShell+0xee0>
 3101be6:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 3101be9:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101bec:	72 6e                	jb     3101c5c <kShell+0xee8>
 3101bee:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3101bf1:	00 73 65             	add    BYTE PTR [ebx+0x65],dh
 3101bf4:	74 65                	je     3101c5b <kShell+0xee7>
 3101bf6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101bf7:	76 00                	jbe    3101bf9 <kShell+0xe85>
 3101bf9:	73 74                	jae    3101c6f <kShell+0xefb>
 3101bfb:	72 74                	jb     3101c71 <kShell+0xefd>
 3101bfd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101bfe:	6b 00 66             	imul   eax,DWORD PTR [eax],0x66
 3101c01:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101c02:	72 6b                	jb     3101c6f <kShell+0xefb>
 3101c04:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3101c07:	6d                   	ins    DWORD PTR es:[edi],dx
 3101c08:	73 65                	jae    3101c6f <kShell+0xefb>
 3101c0a:	74 00                	je     3101c0c <kShell+0xe98>
 3101c0c:	73 74                	jae    3101c82 <kShell+0xf0e>
 3101c0e:	72 74                	jb     3101c84 <kShell+0xf10>
 3101c10:	72 69                	jb     3101c7b <kShell+0xf07>
 3101c12:	6d                   	ins    DWORD PTR es:[edi],dx
 3101c13:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101c16:	74 63                	je     3101c7b <kShell+0xf07>
 3101c18:	77 64                	ja     3101c7e <kShell+0xf0a>
 3101c1a:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101c1d:	69 74 00 73 74 72 6c 	imul   esi,DWORD PTR [eax+eax*1+0x73],0x656c7274
 3101c24:	65 
 3101c25:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101c26:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101c29:	65 63 61 00          	arpl   WORD PTR gs:[ecx+0x0],sp
 3101c2d:	66                   	data16
 3101c2e:	72 65                	jb     3101c95 <kShell+0xf21>
 3101c30:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 3101c33:	2e                   	cs
 3101c34:	2f                   	das    
 3101c35:	6c                   	ins    BYTE PTR es:[edi],dx
 3101c36:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3101c3d:	4f                   	dec    edi
 3101c3e:	53                   	push   ebx
 3101c3f:	2f                   	das    
 3101c40:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3101c47:	62 
 3101c48:	75 67                	jne    3101cb1 <kShell+0xf3d>
 3101c4a:	2f                   	das    
 3101c4b:	47                   	inc    edi
 3101c4c:	4e                   	dec    esi
 3101c4d:	55                   	push   ebp
 3101c4e:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3101c53:	78 00                	js     3101c55 <kShell+0xee1>

Disassembly of section .hash:

03101c58 <.hash>:
 3101c58:	11 00                	adc    DWORD PTR [eax],eax
 3101c5a:	00 00                	add    BYTE PTR [eax],al
 3101c5c:	1d 00 00 00 10       	sbb    eax,0x10000000
 3101c61:	00 00                	add    BYTE PTR [eax],al
 3101c63:	00 00                	add    BYTE PTR [eax],al
 3101c65:	00 00                	add    BYTE PTR [eax],al
 3101c67:	00 15 00 00 00 0c    	add    BYTE PTR ds:0xc000000,dl
 3101c6d:	00 00                	add    BYTE PTR [eax],al
 3101c6f:	00 1a                	add    BYTE PTR [edx],bl
 3101c71:	00 00                	add    BYTE PTR [eax],al
 3101c73:	00 00                	add    BYTE PTR [eax],al
 3101c75:	00 00                	add    BYTE PTR [eax],al
 3101c77:	00 12                	add    BYTE PTR [edx],dl
 3101c79:	00 00                	add    BYTE PTR [eax],al
 3101c7b:	00 03                	add    BYTE PTR [ebx],al
 3101c7d:	00 00                	add    BYTE PTR [eax],al
 3101c7f:	00 08                	add    BYTE PTR [eax],cl
 3101c81:	00 00                	add    BYTE PTR [eax],al
 3101c83:	00 00                	add    BYTE PTR [eax],al
 3101c85:	00 00                	add    BYTE PTR [eax],al
 3101c87:	00 17                	add    BYTE PTR [edi],dl
 3101c89:	00 00                	add    BYTE PTR [eax],al
 3101c8b:	00 11                	add    BYTE PTR [ecx],dl
 3101c8d:	00 00                	add    BYTE PTR [eax],al
 3101c8f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101c92:	00 00                	add    BYTE PTR [eax],al
 3101c94:	19 00                	sbb    DWORD PTR [eax],eax
 3101c96:	00 00                	add    BYTE PTR [eax],al
 3101c98:	0d 00 00 00 05       	or     eax,0x5000000
 3101c9d:	00 00                	add    BYTE PTR [eax],al
 3101c9f:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
	...
 3101cc2:	00 00                	add    BYTE PTR [eax],al
 3101cc4:	06                   	push   es
 3101cc5:	00 00                	add    BYTE PTR [eax],al
 3101cc7:	00 04 00             	add    BYTE PTR [eax+eax*1],al
	...
 3101cd6:	00 00                	add    BYTE PTR [eax],al
 3101cd8:	07                   	pop    es
 3101cd9:	00 00                	add    BYTE PTR [eax],al
 3101cdb:	00 0a                	add    BYTE PTR [edx],cl
 3101cdd:	00 00                	add    BYTE PTR [eax],al
 3101cdf:	00 0e                	add    BYTE PTR [esi],cl
 3101ce1:	00 00                	add    BYTE PTR [eax],al
 3101ce3:	00 0f                	add    BYTE PTR [edi],cl
 3101ce5:	00 00                	add    BYTE PTR [eax],al
 3101ce7:	00 00                	add    BYTE PTR [eax],al
 3101ce9:	00 00                	add    BYTE PTR [eax],al
 3101ceb:	00 0b                	add    BYTE PTR [ebx],cl
 3101ced:	00 00                	add    BYTE PTR [eax],al
 3101cef:	00 02                	add    BYTE PTR [edx],al
	...
 3101cf9:	00 00                	add    BYTE PTR [eax],al
 3101cfb:	00 13                	add    BYTE PTR [ebx],dl
 3101cfd:	00 00                	add    BYTE PTR [eax],al
 3101cff:	00 09                	add    BYTE PTR [ecx],cl
 3101d01:	00 00                	add    BYTE PTR [eax],al
 3101d03:	00 16                	add    BYTE PTR [esi],dl
 3101d05:	00 00                	add    BYTE PTR [eax],al
 3101d07:	00 18                	add    BYTE PTR [eax],bl
 3101d09:	00 00                	add    BYTE PTR [eax],al
 3101d0b:	00 00                	add    BYTE PTR [eax],al
 3101d0d:	00 00                	add    BYTE PTR [eax],al
 3101d0f:	00 01                	add    BYTE PTR [ecx],al
 3101d11:	00 00                	add    BYTE PTR [eax],al
 3101d13:	00 1b                	add    BYTE PTR [ebx],bl
 3101d15:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03101d18 <.eh_frame>:
 3101d18:	14 00                	adc    al,0x0
 3101d1a:	00 00                	add    BYTE PTR [eax],al
 3101d1c:	00 00                	add    BYTE PTR [eax],al
 3101d1e:	00 00                	add    BYTE PTR [eax],al
 3101d20:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3101d23:	00 01                	add    BYTE PTR [ecx],al
 3101d25:	7c 08                	jl     3101d2f <kShell+0xfbb>
 3101d27:	01 1b                	add    DWORD PTR [ebx],ebx
 3101d29:	0c 04                	or     al,0x4
 3101d2b:	04 88                	add    al,0x88
 3101d2d:	01 00                	add    DWORD PTR [eax],eax
 3101d2f:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3101d32:	00 00                	add    BYTE PTR [eax],al
 3101d34:	1c 00                	sbb    al,0x0
 3101d36:	00 00                	add    BYTE PTR [eax],al
 3101d38:	08 f4                	or     ah,dh
 3101d3a:	ff                   	(bad)  
 3101d3b:	ff d0                	call   eax
 3101d3d:	01 00                	add    DWORD PTR [eax],eax
 3101d3f:	00 00                	add    BYTE PTR [eax],al
 3101d41:	0e                   	push   cs
 3101d42:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3101d45:	0c 4a                	or     al,0x4a
 3101d47:	0f 0b                	ud2    
 3101d49:	74 04                	je     3101d4f <kShell+0xfdb>
 3101d4b:	78 00                	js     3101d4d <kShell+0xfd9>
 3101d4d:	3f                   	aas    
 3101d4e:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3101d50:	2a 32                	sub    dh,BYTE PTR [edx]
 3101d52:	24 22                	and    al,0x22
 3101d54:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03101d58 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3101d58:	01 1b                	add    DWORD PTR [ebx],ebx
 3101d5a:	03 3b                	add    edi,DWORD PTR [ebx]
 3101d5c:	20 f9                	and    cl,bh
 3101d5e:	ff                   	(bad)  
 3101d5f:	ff 17                	call   DWORD PTR [edi]
 3101d61:	00 00                	add    BYTE PTR [eax],al
 3101d63:	00 a8 e2 ff ff 3c    	add    BYTE PTR [eax+0x3cffffe2],ch
 3101d69:	f9                   	stc    
 3101d6a:	ff                   	(bad)  
 3101d6b:	ff c1                	inc    ecx
 3101d6d:	e2 ff                	loop   3101d6e <__GNU_EH_FRAME_HDR+0x16>
 3101d6f:	ff 5c f9 ff          	call   FWORD PTR [ecx+edi*8-0x1]
 3101d73:	ff 10                	call   DWORD PTR [eax]
 3101d75:	e3 ff                	jecxz  3101d76 <__GNU_EH_FRAME_HDR+0x1e>
 3101d77:	ff                   	(bad)  
 3101d78:	7c f9                	jl     3101d73 <__GNU_EH_FRAME_HDR+0x1b>
 3101d7a:	ff                   	(bad)  
 3101d7b:	ff 6d e4             	jmp    FWORD PTR [ebp-0x1c]
 3101d7e:	ff                   	(bad)  
 3101d7f:	ff 9c f9 ff ff f8 e4 	call   FWORD PTR [ecx+edi*8-0x1b070001]
 3101d86:	ff                   	(bad)  
 3101d87:	ff                   	(bad)  
 3101d88:	bc f9 ff ff ac       	mov    esp,0xacfffff9
 3101d8d:	e6 ff                	out    0xff,al
 3101d8f:	ff dc                	call   <internal disassembler error>
 3101d91:	f9                   	stc    
 3101d92:	ff                   	(bad)  
 3101d93:	ff c5                	inc    ebp
 3101d95:	e6 ff                	out    0xff,al
 3101d97:	ff                   	(bad)  
 3101d98:	fc                   	cld    
 3101d99:	f9                   	stc    
 3101d9a:	ff                   	(bad)  
 3101d9b:	ff 2a                	jmp    FWORD PTR [edx]
 3101d9d:	e7 ff                	out    0xff,eax
 3101d9f:	ff 1c fa             	call   FWORD PTR [edx+edi*8]
 3101da2:	ff                   	(bad)  
 3101da3:	ff 43 e7             	inc    DWORD PTR [ebx-0x19]
 3101da6:	ff                   	(bad)  
 3101da7:	ff                   	(bad)  
 3101da8:	3c fa                	cmp    al,0xfa
 3101daa:	ff                   	(bad)  
 3101dab:	ff 9b e7 ff ff 5c    	call   FWORD PTR [ebx+0x5cffffe7]
 3101db1:	fa                   	cli    
 3101db2:	ff                   	(bad)  
 3101db3:	ff 69 e8             	jmp    FWORD PTR [ecx-0x18]
 3101db6:	ff                   	(bad)  
 3101db7:	ff                   	(bad)  
 3101db8:	7c fa                	jl     3101db4 <__GNU_EH_FRAME_HDR+0x5c>
 3101dba:	ff                   	(bad)  
 3101dbb:	ff b7 e8 ff ff 9c    	push   DWORD PTR [edi-0x63000018]
 3101dc1:	fa                   	cli    
 3101dc2:	ff                   	(bad)  
 3101dc3:	ff 20                	jmp    DWORD PTR [eax]
 3101dc5:	e9 ff ff bc fa       	jmp    fdcd1dc9 <commandHistory+0xfabcf909>
 3101dca:	ff                   	(bad)  
 3101dcb:	ff c6                	inc    esi
 3101dcd:	e9 ff ff e0 fa       	jmp    fdf11dd1 <commandHistory+0xfae0f911>
 3101dd2:	ff                   	(bad)  
 3101dd3:	ff 6f eb             	jmp    FWORD PTR [edi-0x15]
 3101dd6:	ff                   	(bad)  
 3101dd7:	ff 04 fb             	inc    DWORD PTR [ebx+edi*8]
 3101dda:	ff                   	(bad)  
 3101ddb:	ff d8                	call   <internal disassembler error>
 3101ddd:	eb ff                	jmp    3101dde <__GNU_EH_FRAME_HDR+0x86>
 3101ddf:	ff 24 fb             	jmp    DWORD PTR [ebx+edi*8]
 3101de2:	ff                   	(bad)  
 3101de3:	ff 66 ee             	jmp    DWORD PTR [esi-0x12]
 3101de6:	ff                   	(bad)  
 3101de7:	ff 44 fb ff          	inc    DWORD PTR [ebx+edi*8-0x1]
 3101deb:	ff dc                	call   <internal disassembler error>
 3101ded:	ee                   	out    dx,al
 3101dee:	ff                   	(bad)  
 3101def:	ff 68 fb             	jmp    FWORD PTR [eax-0x5]
 3101df2:	ff                   	(bad)  
 3101df3:	ff 19                	call   FWORD PTR [ecx]
 3101df5:	ef                   	out    dx,eax
 3101df6:	ff                   	(bad)  
 3101df7:	ff 88 fb ff ff a5    	dec    DWORD PTR [eax-0x5a000005]
 3101dfd:	ef                   	out    dx,eax
 3101dfe:	ff                   	(bad)  
 3101dff:	ff a8 fb ff ff d3    	jmp    FWORD PTR [eax-0x2c000005]
 3101e05:	ef                   	out    dx,eax
 3101e06:	ff                   	(bad)  
 3101e07:	ff c8                	dec    eax
 3101e09:	fb                   	sti    
 3101e0a:	ff                   	(bad)  
 3101e0b:	ff f6                	push   esi
 3101e0d:	ef                   	out    dx,eax
 3101e0e:	ff                   	(bad)  
 3101e0f:	ff e8                	jmp    <internal disassembler error>
 3101e11:	fb                   	sti    
 3101e12:	ff                   	(bad)  
 3101e13:	ff 1c f0             	call   FWORD PTR [eax+esi*8]
 3101e16:	ff                   	(bad)  
 3101e17:	ff 08                	dec    DWORD PTR [eax]
 3101e19:	fc                   	cld    
 3101e1a:	ff                   	(bad)  
 3101e1b:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03101e1c <.rel.dyn>:
 3101e1c:	dc 20                	fsub   QWORD PTR [eax]
 3101e1e:	10 03                	adc    BYTE PTR [ebx],al
 3101e20:	07                   	pop    es
 3101e21:	01 00                	add    DWORD PTR [eax],eax
 3101e23:	00 e0                	add    al,ah
 3101e25:	20 10                	and    BYTE PTR [eax],dl
 3101e27:	03 07                	add    eax,DWORD PTR [edi]
 3101e29:	02 00                	add    al,BYTE PTR [eax]
 3101e2b:	00 e4                	add    ah,ah
 3101e2d:	20 10                	and    BYTE PTR [eax],dl
 3101e2f:	03 07                	add    eax,DWORD PTR [edi]
 3101e31:	03 00                	add    eax,DWORD PTR [eax]
 3101e33:	00 e8                	add    al,ch
 3101e35:	20 10                	and    BYTE PTR [eax],dl
 3101e37:	03 07                	add    eax,DWORD PTR [edi]
 3101e39:	04 00                	add    al,0x0
 3101e3b:	00 ec                	add    ah,ch
 3101e3d:	20 10                	and    BYTE PTR [eax],dl
 3101e3f:	03 07                	add    eax,DWORD PTR [edi]
 3101e41:	05 00 00 f0 20       	add    eax,0x20f00000
 3101e46:	10 03                	adc    BYTE PTR [ebx],al
 3101e48:	07                   	pop    es
 3101e49:	06                   	push   es
 3101e4a:	00 00                	add    BYTE PTR [eax],al
 3101e4c:	f4                   	hlt    
 3101e4d:	20 10                	and    BYTE PTR [eax],dl
 3101e4f:	03 07                	add    eax,DWORD PTR [edi]
 3101e51:	07                   	pop    es
 3101e52:	00 00                	add    BYTE PTR [eax],al
 3101e54:	f8                   	clc    
 3101e55:	20 10                	and    BYTE PTR [eax],dl
 3101e57:	03 07                	add    eax,DWORD PTR [edi]
 3101e59:	08 00                	or     BYTE PTR [eax],al
 3101e5b:	00 fc                	add    ah,bh
 3101e5d:	20 10                	and    BYTE PTR [eax],dl
 3101e5f:	03 07                	add    eax,DWORD PTR [edi]
 3101e61:	09 00                	or     DWORD PTR [eax],eax
 3101e63:	00 00                	add    BYTE PTR [eax],al
 3101e65:	21 10                	and    DWORD PTR [eax],edx
 3101e67:	03 07                	add    eax,DWORD PTR [edi]
 3101e69:	0a 00                	or     al,BYTE PTR [eax]
 3101e6b:	00 04 21             	add    BYTE PTR [ecx+eiz*1],al
 3101e6e:	10 03                	adc    BYTE PTR [ebx],al
 3101e70:	07                   	pop    es
 3101e71:	0b 00                	or     eax,DWORD PTR [eax]
 3101e73:	00 08                	add    BYTE PTR [eax],cl
 3101e75:	21 10                	and    DWORD PTR [eax],edx
 3101e77:	03 07                	add    eax,DWORD PTR [edi]
 3101e79:	0c 00                	or     al,0x0
 3101e7b:	00 0c 21             	add    BYTE PTR [ecx+eiz*1],cl
 3101e7e:	10 03                	adc    BYTE PTR [ebx],al
 3101e80:	07                   	pop    es
 3101e81:	0d 00 00 10 21       	or     eax,0x21100000
 3101e86:	10 03                	adc    BYTE PTR [ebx],al
 3101e88:	07                   	pop    es
 3101e89:	0e                   	push   cs
 3101e8a:	00 00                	add    BYTE PTR [eax],al
 3101e8c:	14 21                	adc    al,0x21
 3101e8e:	10 03                	adc    BYTE PTR [ebx],al
 3101e90:	07                   	pop    es
 3101e91:	0f 00 00             	sldt   WORD PTR [eax]
 3101e94:	18 21                	sbb    BYTE PTR [ecx],ah
 3101e96:	10 03                	adc    BYTE PTR [ebx],al
 3101e98:	07                   	pop    es
 3101e99:	10 00                	adc    BYTE PTR [eax],al
 3101e9b:	00 1c 21             	add    BYTE PTR [ecx+eiz*1],bl
 3101e9e:	10 03                	adc    BYTE PTR [ebx],al
 3101ea0:	07                   	pop    es
 3101ea1:	11 00                	adc    DWORD PTR [eax],eax
 3101ea3:	00 20                	add    BYTE PTR [eax],ah
 3101ea5:	21 10                	and    DWORD PTR [eax],edx
 3101ea7:	03 07                	add    eax,DWORD PTR [edi]
 3101ea9:	12 00                	adc    al,BYTE PTR [eax]
 3101eab:	00 24 21             	add    BYTE PTR [ecx+eiz*1],ah
 3101eae:	10 03                	adc    BYTE PTR [ebx],al
 3101eb0:	07                   	pop    es
 3101eb1:	13 00                	adc    eax,DWORD PTR [eax]
 3101eb3:	00 28                	add    BYTE PTR [eax],ch
 3101eb5:	21 10                	and    DWORD PTR [eax],edx
 3101eb7:	03 07                	add    eax,DWORD PTR [edi]
 3101eb9:	14 00                	adc    al,0x0
 3101ebb:	00 2c 21             	add    BYTE PTR [ecx+eiz*1],ch
 3101ebe:	10 03                	adc    BYTE PTR [ebx],al
 3101ec0:	07                   	pop    es
 3101ec1:	15 00 00 30 21       	adc    eax,0x21300000
 3101ec6:	10 03                	adc    BYTE PTR [ebx],al
 3101ec8:	07                   	pop    es
 3101ec9:	16                   	push   ss
 3101eca:	00 00                	add    BYTE PTR [eax],al
 3101ecc:	34 21                	xor    al,0x21
 3101ece:	10 03                	adc    BYTE PTR [ebx],al
 3101ed0:	07                   	pop    es
 3101ed1:	17                   	pop    ss
 3101ed2:	00 00                	add    BYTE PTR [eax],al
 3101ed4:	38 21                	cmp    BYTE PTR [ecx],ah
 3101ed6:	10 03                	adc    BYTE PTR [ebx],al
 3101ed8:	07                   	pop    es
 3101ed9:	18 00                	sbb    BYTE PTR [eax],al
 3101edb:	00 3c 21             	add    BYTE PTR [ecx+eiz*1],bh
 3101ede:	10 03                	adc    BYTE PTR [ebx],al
 3101ee0:	07                   	pop    es
 3101ee1:	19 00                	sbb    DWORD PTR [eax],eax
 3101ee3:	00 40 21             	add    BYTE PTR [eax+0x21],al
 3101ee6:	10 03                	adc    BYTE PTR [ebx],al
 3101ee8:	07                   	pop    es
 3101ee9:	1a 00                	sbb    al,BYTE PTR [eax]
 3101eeb:	00 44 21 10          	add    BYTE PTR [ecx+eiz*1+0x10],al
 3101eef:	03 07                	add    eax,DWORD PTR [edi]
 3101ef1:	1b 00                	sbb    eax,DWORD PTR [eax]
 3101ef3:	00 48 21             	add    BYTE PTR [eax+0x21],cl
 3101ef6:	10 03                	adc    BYTE PTR [ebx],al
 3101ef8:	07                   	pop    es
 3101ef9:	1c 00                	sbb    al,0x0
	...

Disassembly of section .data:

03101f00 <cmds>:
 3101f00:	10 13                	adc    BYTE PTR [ebx],dl
 3101f02:	10 03                	adc    BYTE PTR [ebx],al
 3101f04:	16                   	push   ss
 3101f05:	13 10                	adc    edx,DWORD PTR [eax]
 3101f07:	03 00                	add    eax,DWORD PTR [eax]
 3101f09:	00 10                	add    BYTE PTR [eax],dl
 3101f0b:	03 00                	add    eax,DWORD PTR [eax]
 3101f0d:	00 00                	add    BYTE PTR [eax],al
 3101f0f:	00 27                	add    BYTE PTR [edi],ah
 3101f11:	13 10                	adc    edx,DWORD PTR [eax]
 3101f13:	03 2b                	add    ebp,DWORD PTR [ebx]
 3101f15:	13 10                	adc    edx,DWORD PTR [eax]
 3101f17:	03 19                	add    ebx,DWORD PTR [ecx]
 3101f19:	00 10                	add    BYTE PTR [eax],dl
 3101f1b:	03 00                	add    eax,DWORD PTR [eax]
 3101f1d:	00 00                	add    BYTE PTR [eax],al
 3101f1f:	00 3d 13 10 03 42    	add    BYTE PTR ds:0x42031013,bh
 3101f25:	13 10                	adc    edx,DWORD PTR [eax]
 3101f27:	03 82 04 10 03 01    	add    eax,DWORD PTR [edx+0x1031004]
 3101f2d:	00 00                	add    BYTE PTR [eax],al
 3101f2f:	00 54 13 10          	add    BYTE PTR [ebx+edx*1+0x10],dl
 3101f33:	03 59 13             	add    ebx,DWORD PTR [ecx+0x13]
 3101f36:	10 03                	adc    BYTE PTR [ebx],al
 3101f38:	9b                   	fwait
 3101f39:	04 10                	add    al,0x10
 3101f3b:	03 01                	add    eax,DWORD PTR [ecx]
 3101f3d:	00 00                	add    BYTE PTR [eax],al
 3101f3f:	00 65 13             	add    BYTE PTR [ebp+0x13],ah
 3101f42:	10 03                	adc    BYTE PTR [ebx],al
 3101f44:	6a 13                	push   0x13
 3101f46:	10 03                	adc    BYTE PTR [ebx],al
 3101f48:	f3 04 10             	repz add al,0x10
 3101f4b:	03 01                	add    eax,DWORD PTR [ecx]
 3101f4d:	00 00                	add    BYTE PTR [eax],al
 3101f4f:	00 86 13 10 03 8a    	add    BYTE PTR [esi-0x75fcefed],al
 3101f55:	13 10                	adc    edx,DWORD PTR [eax]
 3101f57:	03 c1                	add    eax,ecx
 3101f59:	05 10 03 00 00       	add    eax,0x310
 3101f5e:	00 00                	add    BYTE PTR [eax],al
 3101f60:	a2 13 10 03 a9       	mov    ds:0xa9031013,al
 3101f65:	13 10                	adc    edx,DWORD PTR [eax]
 3101f67:	03 1d 04 10 03 01    	add    ebx,DWORD PTR ds:0x1031004
 3101f6d:	00 00                	add    BYTE PTR [eax],al
 3101f6f:	00 c2                	add    dl,al
 3101f71:	13 10                	adc    edx,DWORD PTR [eax]
 3101f73:	03 c6                	add    eax,esi
 3101f75:	13 10                	adc    edx,DWORD PTR [eax]
 3101f77:	03 68 00             	add    ebp,DWORD PTR [eax+0x0]
 3101f7a:	10 03                	adc    BYTE PTR [ebx],al
 3101f7c:	01 00                	add    DWORD PTR [eax],eax
 3101f7e:	00 00                	add    BYTE PTR [eax],al
 3101f80:	e2 13                	loop   3101f95 <cmds+0x95>
 3101f82:	10 03                	adc    BYTE PTR [ebx],al
 3101f84:	e8 13 10 03 0f       	call   12132f9c <commandHistory+0xf030adc>
 3101f89:	06                   	push   es
 3101f8a:	10 03                	adc    BYTE PTR [ebx],al
 3101f8c:	01 00                	add    DWORD PTR [eax],eax
 3101f8e:	00 00                	add    BYTE PTR [eax],al
 3101f90:	fc                   	cld    
 3101f91:	13 10                	adc    edx,DWORD PTR [eax]
 3101f93:	03 04 14             	add    eax,DWORD PTR [esp+edx*1]
 3101f96:	10 03                	adc    BYTE PTR [ebx],al
 3101f98:	04 04                	add    al,0x4
 3101f9a:	10 03                	adc    BYTE PTR [ebx],al
 3101f9c:	01 00                	add    DWORD PTR [eax],eax
	...

03101fa0 <cmds>:
 3101fa0:	10 15 10 03 16 15    	adc    BYTE PTR ds:0x15160310,dl
 3101fa6:	10 03                	adc    BYTE PTR [ebx],al
 3101fa8:	00 00                	add    BYTE PTR [eax],al
 3101faa:	10 03                	adc    BYTE PTR [ebx],al
 3101fac:	00 00                	add    BYTE PTR [eax],al
 3101fae:	00 00                	add    BYTE PTR [eax],al
 3101fb0:	27                   	daa    
 3101fb1:	15 10 03 2b 15       	adc    eax,0x152b0310
 3101fb6:	10 03                	adc    BYTE PTR [ebx],al
 3101fb8:	19 00                	sbb    DWORD PTR [eax],eax
 3101fba:	10 03                	adc    BYTE PTR [ebx],al
 3101fbc:	00 00                	add    BYTE PTR [eax],al
 3101fbe:	00 00                	add    BYTE PTR [eax],al
 3101fc0:	3d 15 10 03 42       	cmp    eax,0x42031015
 3101fc5:	15 10 03 82 04       	adc    eax,0x4820310
 3101fca:	10 03                	adc    BYTE PTR [ebx],al
 3101fcc:	01 00                	add    DWORD PTR [eax],eax
 3101fce:	00 00                	add    BYTE PTR [eax],al
 3101fd0:	54                   	push   esp
 3101fd1:	15 10 03 59 15       	adc    eax,0x15590310
 3101fd6:	10 03                	adc    BYTE PTR [ebx],al
 3101fd8:	9b                   	fwait
 3101fd9:	04 10                	add    al,0x10
 3101fdb:	03 01                	add    eax,DWORD PTR [ecx]
 3101fdd:	00 00                	add    BYTE PTR [eax],al
 3101fdf:	00 65 15             	add    BYTE PTR [ebp+0x15],ah
 3101fe2:	10 03                	adc    BYTE PTR [ebx],al
 3101fe4:	6a 15                	push   0x15
 3101fe6:	10 03                	adc    BYTE PTR [ebx],al
 3101fe8:	f3 04 10             	repz add al,0x10
 3101feb:	03 01                	add    eax,DWORD PTR [ecx]
 3101fed:	00 00                	add    BYTE PTR [eax],al
 3101fef:	00 86 15 10 03 8a    	add    BYTE PTR [esi-0x75fcefeb],al
 3101ff5:	15 10 03 c1 05       	adc    eax,0x5c10310
 3101ffa:	10 03                	adc    BYTE PTR [ebx],al
 3101ffc:	00 00                	add    BYTE PTR [eax],al
 3101ffe:	00 00                	add    BYTE PTR [eax],al
 3102000:	a2 15 10 03 a9       	mov    ds:0xa9031015,al
 3102005:	15 10 03 1d 04       	adc    eax,0x41d0310
 310200a:	10 03                	adc    BYTE PTR [ebx],al
 310200c:	01 00                	add    DWORD PTR [eax],eax
 310200e:	00 00                	add    BYTE PTR [eax],al
 3102010:	c2 15 10             	ret    0x1015
 3102013:	03 c6                	add    eax,esi
 3102015:	15 10 03 68 00       	adc    eax,0x680310
 310201a:	10 03                	adc    BYTE PTR [ebx],al
 310201c:	01 00                	add    DWORD PTR [eax],eax
 310201e:	00 00                	add    BYTE PTR [eax],al
 3102020:	e2 15                	loop   3102037 <cmds+0x97>
 3102022:	10 03                	adc    BYTE PTR [ebx],al
 3102024:	e8 15 10 03 0f       	call   1213303e <commandHistory+0xf030b7e>
 3102029:	06                   	push   es
 310202a:	10 03                	adc    BYTE PTR [ebx],al
 310202c:	01 00                	add    DWORD PTR [eax],eax
 310202e:	00 00                	add    BYTE PTR [eax],al
 3102030:	fc                   	cld    
 3102031:	15 10 03 04 16       	adc    eax,0x16040310
 3102036:	10 03                	adc    BYTE PTR [ebx],al
 3102038:	04 04                	add    al,0x4
 310203a:	10 03                	adc    BYTE PTR [ebx],al
 310203c:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

03102040 <_DYNAMIC>:
 3102040:	01 00                	add    DWORD PTR [eax],eax
 3102042:	00 00                	add    BYTE PTR [eax],al
 3102044:	01 00                	add    DWORD PTR [eax],eax
 3102046:	00 00                	add    BYTE PTR [eax],al
 3102048:	0f 00 00             	sldt   WORD PTR [eax]
 310204b:	00 ce                	add    dh,cl
 310204d:	00 00                	add    BYTE PTR [eax],al
 310204f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3102052:	00 00                	add    BYTE PTR [eax],al
 3102054:	58                   	pop    eax
 3102055:	1c 10                	sbb    al,0x10
 3102057:	03 05 00 00 00 64    	add    eax,DWORD PTR ds:0x64000000
 310205d:	1b 10                	sbb    edx,DWORD PTR [eax]
 310205f:	03 06                	add    eax,DWORD PTR [esi]
 3102061:	00 00                	add    BYTE PTR [eax],al
 3102063:	00 94 19 10 03 0a 00 	add    BYTE PTR [ecx+ebx*1+0xa0310],dl
 310206a:	00 00                	add    BYTE PTR [eax],al
 310206c:	f1                   	icebp  
 310206d:	00 00                	add    BYTE PTR [eax],al
 310206f:	00 0b                	add    BYTE PTR [ebx],cl
 3102071:	00 00                	add    BYTE PTR [eax],al
 3102073:	00 10                	add    BYTE PTR [eax],dl
 3102075:	00 00                	add    BYTE PTR [eax],al
 3102077:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 310207d:	00 00                	add    BYTE PTR [eax],al
 310207f:	00 03                	add    BYTE PTR [ebx],al
 3102081:	00 00                	add    BYTE PTR [eax],al
 3102083:	00 d0                	add    al,dl
 3102085:	20 10                	and    BYTE PTR [eax],dl
 3102087:	03 02                	add    eax,DWORD PTR [edx]
 3102089:	00 00                	add    BYTE PTR [eax],al
 310208b:	00 e0                	add    al,ah
 310208d:	00 00                	add    BYTE PTR [eax],al
 310208f:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
 3102092:	00 00                	add    BYTE PTR [eax],al
 3102094:	11 00                	adc    DWORD PTR [eax],eax
 3102096:	00 00                	add    BYTE PTR [eax],al
 3102098:	17                   	pop    ss
 3102099:	00 00                	add    BYTE PTR [eax],al
 310209b:	00 1c 1e             	add    BYTE PTR [esi+ebx*1],bl
 310209e:	10 03                	adc    BYTE PTR [ebx],al
	...

Disassembly of section .got.plt:

031020d0 <_GLOBAL_OFFSET_TABLE_>:
 31020d0:	40                   	inc    eax
 31020d1:	20 10                	and    BYTE PTR [eax],dl
 31020d3:	03 00                	add    eax,DWORD PTR [eax]
 31020d5:	00 00                	add    BYTE PTR [eax],al
 31020d7:	00 00                	add    BYTE PTR [eax],al
 31020d9:	00 00                	add    BYTE PTR [eax],al
 31020db:	00 56 11             	add    BYTE PTR [esi+0x11],dl
 31020de:	10 03                	adc    BYTE PTR [ebx],al
 31020e0:	66 11 10             	adc    WORD PTR [eax],dx
 31020e3:	03 76 11             	add    esi,DWORD PTR [esi+0x11]
 31020e6:	10 03                	adc    BYTE PTR [ebx],al
 31020e8:	86 11                	xchg   BYTE PTR [ecx],dl
 31020ea:	10 03                	adc    BYTE PTR [ebx],al
 31020ec:	96                   	xchg   esi,eax
 31020ed:	11 10                	adc    DWORD PTR [eax],edx
 31020ef:	03 a6 11 10 03 b6    	add    esp,DWORD PTR [esi-0x49fcefef]
 31020f5:	11 10                	adc    DWORD PTR [eax],edx
 31020f7:	03 c6                	add    eax,esi
 31020f9:	11 10                	adc    DWORD PTR [eax],edx
 31020fb:	03 d6                	add    edx,esi
 31020fd:	11 10                	adc    DWORD PTR [eax],edx
 31020ff:	03 e6                	add    esp,esi
 3102101:	11 10                	adc    DWORD PTR [eax],edx
 3102103:	03 f6                	add    esi,esi
 3102105:	11 10                	adc    DWORD PTR [eax],edx
 3102107:	03 06                	add    eax,DWORD PTR [esi]
 3102109:	12 10                	adc    dl,BYTE PTR [eax]
 310210b:	03 16                	add    edx,DWORD PTR [esi]
 310210d:	12 10                	adc    dl,BYTE PTR [eax]
 310210f:	03 26                	add    esp,DWORD PTR [esi]
 3102111:	12 10                	adc    dl,BYTE PTR [eax]
 3102113:	03 36                	add    esi,DWORD PTR [esi]
 3102115:	12 10                	adc    dl,BYTE PTR [eax]
 3102117:	03 46 12             	add    eax,DWORD PTR [esi+0x12]
 310211a:	10 03                	adc    BYTE PTR [ebx],al
 310211c:	56                   	push   esi
 310211d:	12 10                	adc    dl,BYTE PTR [eax]
 310211f:	03 66 12             	add    esp,DWORD PTR [esi+0x12]
 3102122:	10 03                	adc    BYTE PTR [ebx],al
 3102124:	76 12                	jbe    3102138 <_GLOBAL_OFFSET_TABLE_+0x68>
 3102126:	10 03                	adc    BYTE PTR [ebx],al
 3102128:	86 12                	xchg   BYTE PTR [edx],dl
 310212a:	10 03                	adc    BYTE PTR [ebx],al
 310212c:	96                   	xchg   esi,eax
 310212d:	12 10                	adc    dl,BYTE PTR [eax]
 310212f:	03 a6 12 10 03 b6    	add    esp,DWORD PTR [esi-0x49fcefee]
 3102135:	12 10                	adc    dl,BYTE PTR [eax]
 3102137:	03 c6                	add    eax,esi
 3102139:	12 10                	adc    dl,BYTE PTR [eax]
 310213b:	03 d6                	add    edx,esi
 310213d:	12 10                	adc    dl,BYTE PTR [eax]
 310213f:	03 e6                	add    esp,esi
 3102141:	12 10                	adc    dl,BYTE PTR [eax]
 3102143:	03 f6                	add    esi,esi
 3102145:	12 10                	adc    dl,BYTE PTR [eax]
 3102147:	03 06                	add    eax,DWORD PTR [esi]
 3102149:	13 10                	adc    edx,DWORD PTR [eax]
 310214b:	03                   	.byte 0x3

Disassembly of section .bss:

03102160 <delim>:
	...

03102168 <environmentLoc>:
	...

03102180 <cwd>:
	...

03102280 <sExecutingProgram>:
	...

03102480 <command_function_p>:
 3102480:	00 00                	add    BYTE PTR [eax],al
	...

03102484 <heapEnd>:
 3102484:	00 00                	add    BYTE PTR [eax],al
	...

03102488 <heapBase>:
 3102488:	00 00                	add    BYTE PTR [eax],al
	...

0310248c <heapCurr>:
 310248c:	00 00                	add    BYTE PTR [eax],al
	...

03102490 <command_function>:
 3102490:	00 00                	add    BYTE PTR [eax],al
	...

03102494 <processEnvp>:
 3102494:	00 00                	add    BYTE PTR [eax],al
	...

03102498 <lastExecExitCode>:
 3102498:	00 00                	add    BYTE PTR [eax],al
	...

0310249c <exitCode>:
 310249c:	00 00                	add    BYTE PTR [eax],al
	...

031024a0 <sKShellProgramName>:
 31024a0:	00 00                	add    BYTE PTR [eax],al
	...

031024a4 <libcTZ>:
 31024a4:	00 00                	add    BYTE PTR [eax],al
	...

031024a8 <timeToExit>:
 31024a8:	00 00                	add    BYTE PTR [eax],al
	...

031024ac <commandHistoryPtr>:
 31024ac:	00 00                	add    BYTE PTR [eax],al
	...

031024b0 <commandHistoryMax>:
	...

031024c0 <commandHistory>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	1d 07 00 00 04       	sbb    eax,0x4000007
   5:	00 00                	add    BYTE PTR [eax],al
   7:	00 00                	add    BYTE PTR [eax],al
   9:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
   c:	a2 00 00 00 0c       	mov    ds:0xc000000,al
  11:	79 02                	jns    15 <cmdClearScreen-0x30fffeb>
  13:	00 00                	add    BYTE PTR [eax],al
  15:	37                   	aaa    
  16:	00 00                	add    BYTE PTR [eax],al
  18:	00 00                	add    BYTE PTR [eax],al
  1a:	00 10                	add    BYTE PTR [eax],dl
  1c:	03 76 06             	add    esi,DWORD PTR [esi+0x6]
  1f:	00 00                	add    BYTE PTR [eax],al
  21:	00 00                	add    BYTE PTR [eax],al
  23:	00 00                	add    BYTE PTR [eax],al
  25:	02 01                	add    al,BYTE PTR [ecx]
  27:	06                   	push   es
  28:	0c 02                	or     al,0x2
  2a:	00 00                	add    BYTE PTR [eax],al
  2c:	02 01                	add    al,BYTE PTR [ecx]
  2e:	06                   	push   es
  2f:	05 02 00 00 02       	add    eax,0x2000002
  34:	02 05 7e 00 00 00    	add    al,BYTE PTR ds:0x7e
  3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  41:	02 08                	add    cl,BYTE PTR [eax]
  43:	05 77 01 00 00       	add    eax,0x177
  48:	02 01                	add    al,BYTE PTR [ecx]
  4a:	08 03                	or     BYTE PTR [ebx],al
  4c:	02 00                	add    al,BYTE PTR [eax]
  4e:	00 02                	add    BYTE PTR [edx],al
  50:	02 07                	add    al,BYTE PTR [edi]
  52:	5d                   	pop    ebp
  53:	02 00                	add    al,BYTE PTR [eax]
  55:	00 04 30             	add    BYTE PTR [eax+esi*1],al
  58:	02 00                	add    al,BYTE PTR [eax]
  5a:	00 02                	add    BYTE PTR [edx],al
  5c:	34 61                	xor    al,0x61
  5e:	00 00                	add    BYTE PTR [eax],al
  60:	00 02                	add    BYTE PTR [edx],al
  62:	04 07                	add    al,0x7
  64:	23 02                	and    eax,DWORD PTR [edx]
  66:	00 00                	add    BYTE PTR [eax],al
  68:	02 08                	add    cl,BYTE PTR [eax]
  6a:	07                   	pop    es
  6b:	19 02                	sbb    DWORD PTR [edx],eax
  6d:	00 00                	add    BYTE PTR [eax],al
  6f:	04 33                	add    al,0x33
  71:	01 00                	add    DWORD PTR [eax],eax
  73:	00 02                	add    BYTE PTR [edx],al
  75:	56                   	push   esi
  76:	61                   	popa   
  77:	00 00                	add    BYTE PTR [eax],al
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	04 05                	add    al,0x5
  7d:	7c 01                	jl     80 <cmdClearScreen-0x30fff80>
  7f:	00 00                	add    BYTE PTR [eax],al
  81:	05 74 6d 00 2c       	add    eax,0x2c006d74
  86:	03 2c 11             	add    ebp,DWORD PTR [ecx+edx*1]
  89:	01 00                	add    DWORD PTR [eax],eax
  8b:	00 06                	add    BYTE PTR [esi],al
  8d:	04 03                	add    al,0x3
  8f:	00 00                	add    BYTE PTR [eax],al
  91:	03 2e                	add    ebp,DWORD PTR [esi]
  93:	3a 00                	cmp    al,BYTE PTR [eax]
  95:	00 00                	add    BYTE PTR [eax],al
  97:	00 06                	add    BYTE PTR [esi],al
  99:	9e                   	sahf   
  9a:	02 00                	add    al,BYTE PTR [eax]
  9c:	00 03                	add    BYTE PTR [ebx],al
  9e:	2f                   	das    
  9f:	3a 00                	cmp    al,BYTE PTR [eax]
  a1:	00 00                	add    BYTE PTR [eax],al
  a3:	04 06                	add    al,0x6
  a5:	5d                   	pop    ebp
  a6:	01 00                	add    DWORD PTR [eax],eax
  a8:	00 03                	add    BYTE PTR [ebx],al
  aa:	30 3a                	xor    BYTE PTR [edx],bh
  ac:	00 00                	add    BYTE PTR [eax],al
  ae:	00 08                	add    BYTE PTR [eax],cl
  b0:	06                   	push   es
  b1:	39 02                	cmp    DWORD PTR [edx],eax
  b3:	00 00                	add    BYTE PTR [eax],al
  b5:	03 31                	add    esi,DWORD PTR [ecx]
  b7:	3a 00                	cmp    al,BYTE PTR [eax]
  b9:	00 00                	add    BYTE PTR [eax],al
  bb:	0c 06                	or     al,0x6
  bd:	70 01                	jo     c0 <cmdClearScreen-0x30fff40>
  bf:	00 00                	add    BYTE PTR [eax],al
  c1:	03 32                	add    esi,DWORD PTR [edx]
  c3:	3a 00                	cmp    al,BYTE PTR [eax]
  c5:	00 00                	add    BYTE PTR [eax],al
  c7:	10 06                	adc    BYTE PTR [esi],al
  c9:	11 02                	adc    DWORD PTR [edx],eax
  cb:	00 00                	add    BYTE PTR [eax],al
  cd:	03 33                	add    esi,DWORD PTR [ebx]
  cf:	3a 00                	cmp    al,BYTE PTR [eax]
  d1:	00 00                	add    BYTE PTR [eax],al
  d3:	14 06                	adc    al,0x6
  d5:	fb                   	sti    
  d6:	01 00                	add    DWORD PTR [eax],eax
  d8:	00 03                	add    BYTE PTR [ebx],al
  da:	34 3a                	xor    al,0x3a
  dc:	00 00                	add    BYTE PTR [eax],al
  de:	00 18                	add    BYTE PTR [eax],bl
  e0:	06                   	push   es
  e1:	90                   	nop
  e2:	02 00                	add    al,BYTE PTR [eax]
  e4:	00 03                	add    BYTE PTR [ebx],al
  e6:	35 3a 00 00 00       	xor    eax,0x3a
  eb:	1c 06                	sbb    al,0x6
  ed:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  ee:	02 00                	add    al,BYTE PTR [eax]
  f0:	00 03                	add    BYTE PTR [ebx],al
  f2:	36 3a 00             	cmp    al,BYTE PTR ss:[eax]
  f5:	00 00                	add    BYTE PTR [eax],al
  f7:	20 06                	and    BYTE PTR [esi],al
  f9:	f8                   	clc    
  fa:	00 00                	add    BYTE PTR [eax],al
  fc:	00 03                	add    BYTE PTR [ebx],al
  fe:	37                   	aaa    
  ff:	7a 00                	jp     101 <cmdClearScreen-0x30ffeff>
 101:	00 00                	add    BYTE PTR [eax],al
 103:	24 06                	and    al,0x6
 105:	56                   	push   esi
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
 11f:	98                   	cwde   
 120:	02 00                	add    al,BYTE PTR [eax]
 122:	00 09                	add    BYTE PTR [ecx],cl
 124:	10 04 12             	adc    BYTE PTR [edx+edx*1],al
 127:	5c                   	pop    esp
 128:	01 00                	add    DWORD PTR [eax],eax
 12a:	00 06                	add    BYTE PTR [esi],al
 12c:	ee                   	out    dx,al
 12d:	01 00                	add    DWORD PTR [eax],eax
 12f:	00 04 14             	add    BYTE PTR [esp+edx*1],al
 132:	5c                   	pop    esp
 133:	01 00                	add    DWORD PTR [eax],eax
 135:	00 00                	add    BYTE PTR [eax],al
 137:	06                   	push   es
 138:	72 00                	jb     13a <cmdClearScreen-0x30ffec6>
 13a:	00 00                	add    BYTE PTR [eax],al
 13c:	04 15                	add    al,0x15
 13e:	5c                   	pop    esp
 13f:	01 00                	add    DWORD PTR [eax],eax
 141:	00 04 06             	add    BYTE PTR [esi+eax*1],al
 144:	45                   	inc    ebp
 145:	01 00                	add    DWORD PTR [eax],eax
 147:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 14a:	62 01                	bound  eax,QWORD PTR [ecx]
 14c:	00 00                	add    BYTE PTR [eax],al
 14e:	08 06                	or     BYTE PTR [esi],al
 150:	65 01 00             	add    DWORD PTR gs:[eax],eax
 153:	00 04 17             	add    BYTE PTR [edi+edx*1],al
 156:	3a 00                	cmp    al,BYTE PTR [eax]
 158:	00 00                	add    BYTE PTR [eax],al
 15a:	0c 00                	or     al,0x0
 15c:	07                   	pop    es
 15d:	04 25                	add    al,0x25
 15f:	00 00                	add    BYTE PTR [eax],al
 161:	00 0a                	add    BYTE PTR [edx],cl
 163:	04 04                	add    al,0x4
 165:	3b 03                	cmp    eax,DWORD PTR [ebx]
 167:	00 00                	add    BYTE PTR [eax],al
 169:	04 18                	add    al,0x18
 16b:	23 01                	and    eax,DWORD PTR [ecx]
 16d:	00 00                	add    BYTE PTR [eax],al
 16f:	0b 4e 01             	or     ecx,DWORD PTR [esi+0x1]
 172:	00 00                	add    BYTE PTR [eax],al
 174:	01 0a                	add    DWORD PTR [edx],ecx
 176:	00 00                	add    BYTE PTR [eax],al
 178:	10 03                	adc    BYTE PTR [ebx],al
 17a:	19 00                	sbb    DWORD PTR [eax],eax
 17c:	00 00                	add    BYTE PTR [eax],al
 17e:	01 9c 0c 5e 00 00 00 	add    DWORD PTR [esp+ecx*1+0x5e],ebx
 185:	01 0f                	add    DWORD PTR [edi],ecx
 187:	19 00                	sbb    DWORD PTR [eax],eax
 189:	10 03                	adc    BYTE PTR [ebx],al
 18b:	4f                   	dec    edi
 18c:	00 00                	add    BYTE PTR [eax],al
 18e:	00 01                	add    BYTE PTR [ecx],al
 190:	9c                   	pushf  
 191:	ae                   	scas   al,BYTE PTR es:[edi]
 192:	01 00                	add    DWORD PTR [eax],eax
 194:	00 0d 1f 00 10 03    	add    BYTE PTR ds:0x310001f,cl
 19a:	46                   	inc    esi
 19b:	00 00                	add    BYTE PTR [eax],al
 19d:	00 0e                	add    BYTE PTR [esi],cl
 19f:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 1a2:	00 01                	add    BYTE PTR [ecx],al
 1a4:	11 3a                	adc    DWORD PTR [edx],edi
 1a6:	00 00                	add    BYTE PTR [eax],al
 1a8:	00 02                	add    BYTE PTR [edx],al
 1aa:	91                   	xchg   ecx,eax
 1ab:	6c                   	ins    BYTE PTR es:[edi],dx
 1ac:	00 00                	add    BYTE PTR [eax],al
 1ae:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 1b1:	00 00                	add    BYTE PTR [eax],al
 1b3:	01 1b                	add    DWORD PTR [ebx],ebx
 1b5:	68 00 10 03 5d       	push   0x5d031000
 1ba:	01 00                	add    DWORD PTR [eax],eax
 1bc:	00 01                	add    BYTE PTR [ecx],al
 1be:	9c                   	pushf  
 1bf:	31 02                	xor    DWORD PTR [edx],eax
 1c1:	00 00                	add    BYTE PTR [eax],al
 1c3:	10 9a 00 00 00 01    	adc    BYTE PTR [edx+0x1000000],bl
 1c9:	1b 5c 01 00          	sbb    ebx,DWORD PTR [ecx+eax*1+0x0]
 1cd:	00 02                	add    BYTE PTR [edx],al
 1cf:	91                   	xchg   ecx,eax
 1d0:	00 11                	add    BYTE PTR [ecx],dl
 1d2:	e7 01                	out    0x1,eax
 1d4:	00 00                	add    BYTE PTR [eax],al
 1d6:	01 1d 31 02 00 00    	add    DWORD PTR ds:0x231,ebx
 1dc:	03 91 dc 75 11 85    	add    edx,DWORD PTR [ecx-0x7aee8a24]
 1e2:	01 00                	add    DWORD PTR [eax],eax
 1e4:	00 01                	add    BYTE PTR [ecx],al
 1e6:	1e                   	push   ds
 1e7:	5c                   	pop    esp
 1e8:	01 00                	add    DWORD PTR [eax],eax
 1ea:	00 02                	add    BYTE PTR [edx],al
 1ec:	91                   	xchg   ecx,eax
 1ed:	60                   	pusha  
 1ee:	11 0f                	adc    DWORD PTR [edi],ecx
 1f0:	00 00                	add    BYTE PTR [eax],al
 1f2:	00 01                	add    BYTE PTR [ecx],al
 1f4:	1e                   	push   ds
 1f5:	5c                   	pop    esp
 1f6:	01 00                	add    DWORD PTR [eax],eax
 1f8:	00 02                	add    BYTE PTR [edx],al
 1fa:	91                   	xchg   ecx,eax
 1fb:	5c                   	pop    esp
 1fc:	0d 93 00 10 03       	or     eax,0x3100093
 201:	29 01                	sub    DWORD PTR [ecx],eax
 203:	00 00                	add    BYTE PTR [eax],al
 205:	11 27                	adc    DWORD PTR [edi],esp
 207:	00 00                	add    BYTE PTR [eax],al
 209:	00 01                	add    BYTE PTR [ecx],al
 20b:	22 3a                	and    bh,BYTE PTR [edx]
 20d:	00 00                	add    BYTE PTR [eax],al
 20f:	00 02                	add    BYTE PTR [edx],al
 211:	91                   	xchg   ecx,eax
 212:	6c                   	ins    BYTE PTR es:[edi],dx
 213:	11 16                	adc    DWORD PTR [esi],edx
 215:	03 00                	add    eax,DWORD PTR [eax]
 217:	00 01                	add    BYTE PTR [ecx],al
 219:	22 3a                	and    bh,BYTE PTR [edx]
 21b:	00 00                	add    BYTE PTR [eax],al
 21d:	00 02                	add    BYTE PTR [edx],al
 21f:	91                   	xchg   ecx,eax
 220:	68 11 d2 02 00       	push   0x2d211
 225:	00 01                	add    BYTE PTR [ecx],al
 227:	23 3a                	and    edi,DWORD PTR [edx]
 229:	00 00                	add    BYTE PTR [eax],al
 22b:	00 02                	add    BYTE PTR [edx],al
 22d:	91                   	xchg   ecx,eax
 22e:	64 00 00             	add    BYTE PTR fs:[eax],al
 231:	12 25 00 00 00 47    	adc    ah,BYTE PTR ds:0x47000000
 237:	02 00                	add    al,BYTE PTR [eax]
 239:	00 13                	add    BYTE PTR [ebx],dl
 23b:	47                   	inc    edi
 23c:	02 00                	add    al,BYTE PTR [eax]
 23e:	00 09                	add    BYTE PTR [ecx],cl
 240:	13 47 02             	adc    eax,DWORD PTR [edi+0x2]
 243:	00 00                	add    BYTE PTR [eax],al
 245:	7f 00                	jg     247 <cmdClearScreen-0x30ffdb9>
 247:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
 24a:	88 00                	mov    BYTE PTR [eax],al
 24c:	00 00                	add    BYTE PTR [eax],al
 24e:	14 27                	adc    al,0x27
 250:	01 00                	add    DWORD PTR [eax],eax
 252:	00 01                	add    BYTE PTR [ecx],al
 254:	3a 3a                	cmp    bh,BYTE PTR [edx]
 256:	00 00                	add    BYTE PTR [eax],al
 258:	00 c5                	add    ch,al
 25a:	01 10                	add    DWORD PTR [eax],edx
 25c:	03 8b 00 00 00 01    	add    ecx,DWORD PTR [ebx+0x1000000]
 262:	9c                   	pushf  
 263:	c6 02 00             	mov    BYTE PTR [edx],0x0
 266:	00 10                	add    BYTE PTR [eax],dl
 268:	ec                   	in     al,dx
 269:	02 00                	add    al,BYTE PTR [eax]
 26b:	00 01                	add    BYTE PTR [ecx],al
 26d:	3a 5c 01 00          	cmp    bl,BYTE PTR [ecx+eax*1+0x0]
 271:	00 02                	add    BYTE PTR [edx],al
 273:	91                   	xchg   ecx,eax
 274:	00 10                	add    BYTE PTR [eax],dl
 276:	5b                   	pop    ebx
 277:	04 00                	add    al,0x0
 279:	00 01                	add    BYTE PTR [ecx],al
 27b:	3a 3a                	cmp    bh,BYTE PTR [edx]
 27d:	00 00                	add    BYTE PTR [eax],al
 27f:	00 02                	add    BYTE PTR [edx],al
 281:	91                   	xchg   ecx,eax
 282:	04 10                	add    al,0x10
 284:	78 04                	js     28a <cmdClearScreen-0x30ffd76>
 286:	00 00                	add    BYTE PTR [eax],al
 288:	01 3a                	add    DWORD PTR [edx],edi
 28a:	c6 02 00             	mov    BYTE PTR [edx],0x0
 28d:	00 02                	add    BYTE PTR [edx],al
 28f:	91                   	xchg   ecx,eax
 290:	08 10                	or     BYTE PTR [eax],dl
 292:	0b 03                	or     eax,DWORD PTR [ebx]
 294:	00 00                	add    BYTE PTR [eax],al
 296:	01 3a                	add    DWORD PTR [edx],edi
 298:	1c 01                	sbb    al,0x1
 29a:	00 00                	add    BYTE PTR [eax],al
 29c:	02 91 5c 0e 70 69    	add    dl,BYTE PTR [ecx+0x69700e5c]
 2a2:	64 00 01             	add    BYTE PTR fs:[ecx],al
 2a5:	3c 3a                	cmp    al,0x3a
 2a7:	00 00                	add    BYTE PTR [eax],al
 2a9:	00 02                	add    BYTE PTR [edx],al
 2ab:	91                   	xchg   ecx,eax
 2ac:	6c                   	ins    BYTE PTR es:[edi],dx
 2ad:	0d f9 01 10 03       	or     eax,0x31001f9
 2b2:	41                   	inc    ecx
 2b3:	00 00                	add    BYTE PTR [eax],al
 2b5:	00 0e                	add    BYTE PTR [esi],cl
 2b7:	72 65                	jb     31e <cmdClearScreen-0x30ffce2>
 2b9:	74 00                	je     2bb <cmdClearScreen-0x30ffd45>
 2bb:	01 44 cc 02          	add    DWORD PTR [esp+ecx*8+0x2],eax
 2bf:	00 00                	add    BYTE PTR [eax],al
 2c1:	02 91 62 00 00 07    	add    dl,BYTE PTR [ecx+0x7000062]
 2c7:	04 5c                	add    al,0x5c
 2c9:	01 00                	add    DWORD PTR [eax],eax
 2cb:	00 12                	add    BYTE PTR [edx],dl
 2cd:	25 00 00 00 dc       	and    eax,0xdc000000
 2d2:	02 00                	add    al,BYTE PTR [eax]
 2d4:	00 13                	add    BYTE PTR [ebx],dl
 2d6:	47                   	inc    edi
 2d7:	02 00                	add    al,BYTE PTR [eax]
 2d9:	00 09                	add    BYTE PTR [ecx],cl
 2db:	00 14 70             	add    BYTE PTR [eax+esi*2],dl
 2de:	02 00                	add    al,BYTE PTR [eax]
 2e0:	00 01                	add    BYTE PTR [ecx],al
 2e2:	4e                   	dec    esi
 2e3:	3a 00                	cmp    al,BYTE PTR [eax]
 2e5:	00 00                	add    BYTE PTR [eax],al
 2e7:	50                   	push   eax
 2e8:	02 10                	add    dl,BYTE PTR [eax]
 2ea:	03 b4 01 00 00 01 9c 	add    esi,DWORD PTR [ecx+eax*1-0x63ff0000]
 2f1:	13 04 00             	adc    eax,DWORD PTR [eax+eax*1]
 2f4:	00 10                	add    BYTE PTR [eax],dl
 2f6:	9a 00 00 00 01 4e 5c 	call   0x5c4e:0x1000000
 2fd:	01 00                	add    DWORD PTR [eax],eax
 2ff:	00 02                	add    BYTE PTR [edx],al
 301:	91                   	xchg   ecx,eax
 302:	00 10                	add    BYTE PTR [eax],dl
 304:	8d 01                	lea    eax,[ecx]
 306:	00 00                	add    BYTE PTR [eax],al
 308:	01 4e 1c             	add    DWORD PTR [esi+0x1c],ecx
 30b:	01 00                	add    DWORD PTR [eax],eax
 30d:	00 03                	add    BYTE PTR [ebx],al
 30f:	91                   	xchg   ecx,eax
 310:	ac                   	lods   al,BYTE PTR ds:[esi]
 311:	75 11                	jne    324 <cmdClearScreen-0x30ffcdc>
 313:	0b 03                	or     eax,DWORD PTR [ebx]
 315:	00 00                	add    BYTE PTR [eax],al
 317:	01 50 1c             	add    DWORD PTR [eax+0x1c],edx
 31a:	01 00                	add    DWORD PTR [eax],eax
 31c:	00 02                	add    BYTE PTR [edx],al
 31e:	91                   	xchg   ecx,eax
 31f:	6b 11 f3             	imul   edx,DWORD PTR [ecx],0xfffffff3
 322:	01 00                	add    DWORD PTR [eax],eax
 324:	00 01                	add    BYTE PTR [ecx],al
 326:	51                   	push   ecx
 327:	3a 00                	cmp    al,BYTE PTR [eax]
 329:	00 00                	add    BYTE PTR [eax],al
 32b:	02 91 64 15 74 6f    	add    dl,BYTE PTR [ecx+0x6f741564]
 331:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
 334:	52                   	push   edx
 335:	5c                   	pop    esp
 336:	01 00                	add    DWORD PTR [eax],eax
 338:	00 0e                	add    BYTE PTR [esi],cl
 33a:	70 67                	jo     3a3 <cmdClearScreen-0x30ffc5d>
 33c:	6d                   	ins    DWORD PTR es:[edi],dx
 33d:	00 01                	add    BYTE PTR [ecx],al
 33f:	53                   	push   ebx
 340:	5c                   	pop    esp
 341:	01 00                	add    DWORD PTR [eax],eax
 343:	00 02                	add    BYTE PTR [edx],al
 345:	91                   	xchg   ecx,eax
 346:	60                   	pusha  
 347:	11 e7                	adc    edi,esp
 349:	01 00                	add    DWORD PTR [eax],eax
 34b:	00 01                	add    BYTE PTR [ecx],al
 34d:	55                   	push   ebp
 34e:	31 02                	xor    DWORD PTR [edx],eax
 350:	00 00                	add    BYTE PTR [eax],al
 352:	03 91 c4 75 11 65    	add    edx,DWORD PTR [ecx+0x651175c4]
 358:	01 00                	add    DWORD PTR [eax],eax
 35a:	00 01                	add    BYTE PTR [ecx],al
 35c:	56                   	push   esi
 35d:	3a 00                	cmp    al,BYTE PTR [eax]
 35f:	00 00                	add    BYTE PTR [eax],al
 361:	02 91 5c 11 18 00    	add    dl,BYTE PTR [ecx+0x18115c]
 367:	00 00                	add    BYTE PTR [eax],al
 369:	01 57 3a             	add    DWORD PTR [edi+0x3a],edx
 36c:	00 00                	add    BYTE PTR [eax],al
 36e:	00 02                	add    BYTE PTR [edx],al
 370:	91                   	xchg   ecx,eax
 371:	58                   	pop    eax
 372:	11 56 02             	adc    DWORD PTR [esi+0x2],edx
 375:	00 00                	add    BYTE PTR [eax],al
 377:	01 58 3a             	add    DWORD PTR [eax+0x3a],ebx
 37a:	00 00                	add    BYTE PTR [eax],al
 37c:	00 02                	add    BYTE PTR [edx],al
 37e:	91                   	xchg   ecx,eax
 37f:	54                   	push   esp
 380:	16                   	push   ss
 381:	c0 02 00             	rol    BYTE PTR [edx],0x0
 384:	00 01                	add    BYTE PTR [ecx],al
 386:	59                   	pop    ecx
 387:	13 04 00             	adc    eax,DWORD PTR [eax+eax*1]
 38a:	00 16                	add    BYTE PTR [esi],dl
 38c:	ae                   	scas   al,BYTE PTR es:[edi]
 38d:	02 00                	add    al,BYTE PTR [eax]
 38f:	00 01                	add    BYTE PTR [ecx],al
 391:	59                   	pop    ecx
 392:	13 04 00             	adc    eax,DWORD PTR [eax+eax*1]
 395:	00 11                	add    BYTE PTR [ecx],dl
 397:	1c 01                	sbb    al,0x1
 399:	00 00                	add    BYTE PTR [eax],al
 39b:	01 5a 56             	add    DWORD PTR [edx+0x56],ebx
 39e:	00 00                	add    BYTE PTR [eax],al
 3a0:	00 02                	add    BYTE PTR [edx],al
 3a2:	91                   	xchg   ecx,eax
 3a3:	4c                   	dec    esp
 3a4:	11 91 00 00 00 01    	adc    DWORD PTR [ecx+0x1000000],edx
 3aa:	5a                   	pop    edx
 3ab:	56                   	push   esi
 3ac:	00 00                	add    BYTE PTR [eax],al
 3ae:	00 02                	add    BYTE PTR [edx],al
 3b0:	91                   	xchg   ecx,eax
 3b1:	44                   	inc    esp
 3b2:	11 5b 04             	adc    DWORD PTR [ebx+0x4],ebx
 3b5:	00 00                	add    BYTE PTR [eax],al
 3b7:	01 5f 3a             	add    DWORD PTR [edi+0x3a],ebx
 3ba:	00 00                	add    BYTE PTR [eax],al
 3bc:	00 03                	add    BYTE PTR [ebx],al
 3be:	91                   	xchg   ecx,eax
 3bf:	c0                   	(bad)  
 3c0:	75 11                	jne    3d3 <cmdClearScreen-0x30ffc2d>
 3c2:	78 04                	js     3c8 <cmdClearScreen-0x30ffc38>
 3c4:	00 00                	add    BYTE PTR [eax],al
 3c6:	01 60 c6             	add    DWORD PTR [eax-0x3a],esp
 3c9:	02 00                	add    al,BYTE PTR [eax]
 3cb:	00 02                	add    BYTE PTR [edx],al
 3cd:	91                   	xchg   ecx,eax
 3ce:	50                   	push   eax
 3cf:	17                   	pop    ss
 3d0:	e7 02                	out    0x2,eax
 3d2:	10 03                	adc    BYTE PTR [ebx],al
 3d4:	4d                   	dec    ebp
 3d5:	00 00                	add    BYTE PTR [eax],al
 3d7:	00 f9                	add    cl,bh
 3d9:	03 00                	add    eax,DWORD PTR [eax]
 3db:	00 11                	add    BYTE PTR [ecx],dl
 3dd:	fd                   	std    
 3de:	02 00                	add    al,BYTE PTR [eax]
 3e0:	00 01                	add    BYTE PTR [ecx],al
 3e2:	6b 3a 00             	imul   edi,DWORD PTR [edx],0x0
 3e5:	00 00                	add    BYTE PTR [eax],al
 3e7:	02 91 6c 11 9d 01    	add    dl,BYTE PTR [ecx+0x19d116c]
 3ed:	00 00                	add    BYTE PTR [eax],al
 3ef:	01 6c 3a 00          	add    DWORD PTR [edx+edi*1+0x0],ebp
 3f3:	00 00                	add    BYTE PTR [eax],al
 3f5:	02 91 48 00 0d 57    	add    dl,BYTE PTR [ecx+0x570d0048]
 3fb:	03 10                	add    edx,DWORD PTR [eax]
 3fd:	03 8f 00 00 00 0e    	add    ecx,DWORD PTR [edi+0xe000000]
 403:	72 65                	jb     46a <cmdClearScreen-0x30ffb96>
 405:	74 00                	je     407 <cmdClearScreen-0x30ffbf9>
 407:	01 82 cc 02 00 00    	add    DWORD PTR [edx+0x2cc],eax
 40d:	03 91 b6 75 00 00    	add    edx,DWORD PTR [ecx+0x75b6]
 413:	07                   	pop    es
 414:	04 81                	add    al,0x81
 416:	00 00                	add    BYTE PTR [eax],al
 418:	00 0f                	add    BYTE PTR [edi],cl
 41a:	88 02                	mov    BYTE PTR [edx],al
 41c:	00 00                	add    BYTE PTR [eax],al
 41e:	01 8b 04 04 10 03    	add    DWORD PTR [ebx+0x3100404],ecx
 424:	19 00                	sbb    DWORD PTR [eax],eax
 426:	00 00                	add    BYTE PTR [eax],al
 428:	01 9c 3d 04 00 00 10 	add    DWORD PTR [ebp+edi*1+0x10000004],ebx
 42f:	9a 00 00 00 01 8b 5c 	call   0x5c8b:0x1000000
 436:	01 00                	add    DWORD PTR [eax],eax
 438:	00 02                	add    BYTE PTR [edx],al
 43a:	91                   	xchg   ecx,eax
 43b:	00 00                	add    BYTE PTR [eax],al
 43d:	0f dd 01             	paddusw mm0,QWORD PTR [ecx]
 440:	00 00                	add    BYTE PTR [eax],al
 442:	01 90 1d 04 10 03    	add    DWORD PTR [eax+0x310041d],edx
 448:	65 00 00             	add    BYTE PTR gs:[eax],al
 44b:	00 01                	add    BYTE PTR [ecx],al
 44d:	9c                   	pushf  
 44e:	b1 04                	mov    cl,0x4
 450:	00 00                	add    BYTE PTR [eax],al
 452:	10 9a 00 00 00 01    	adc    BYTE PTR [edx+0x1000000],bl
 458:	90                   	nop
 459:	5c                   	pop    esp
 45a:	01 00                	add    DWORD PTR [eax],eax
 45c:	00 02                	add    BYTE PTR [edx],al
 45e:	91                   	xchg   ecx,eax
 45f:	00 11                	add    BYTE PTR [ecx],dl
 461:	5b                   	pop    ebx
 462:	04 00                	add    al,0x0
 464:	00 01                	add    BYTE PTR [ecx],al
 466:	92                   	xchg   edx,eax
 467:	3a 00                	cmp    al,BYTE PTR [eax]
 469:	00 00                	add    BYTE PTR [eax],al
 46b:	02 91 5c 11 78 04    	add    dl,BYTE PTR [ecx+0x478115c]
 471:	00 00                	add    BYTE PTR [eax],al
 473:	01 93 c6 02 00 00    	add    DWORD PTR [ebx+0x2c6],edx
 479:	02 91 60 11 57 02    	add    dl,BYTE PTR [ecx+0x2571160]
 47f:	00 00                	add    BYTE PTR [eax],al
 481:	01 94 3a 00 00 00 02 	add    DWORD PTR [edx+edi*1+0x2000000],edx
 488:	91                   	xchg   ecx,eax
 489:	68 11 d2 01 00       	push   0x1d211
 48e:	00 01                	add    BYTE PTR [ecx],al
 490:	95                   	xchg   ebp,eax
 491:	5c                   	pop    esp
 492:	01 00                	add    DWORD PTR [eax],eax
 494:	00 02                	add    BYTE PTR [edx],al
 496:	91                   	xchg   ecx,eax
 497:	64                   	fs
 498:	0d 5a 04 10 03       	or     eax,0x310045a
 49d:	25 00 00 00 0e       	and    eax,0xe000000
 4a2:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 4a5:	00 01                	add    BYTE PTR [ecx],al
 4a7:	9a 3a 00 00 00 02 91 	call   0x9102:0x3a
 4ae:	6c                   	ins    BYTE PTR es:[edi],dx
 4af:	00 00                	add    BYTE PTR [eax],al
 4b1:	0f 32                	rdmsr  
 4b3:	03 00                	add    eax,DWORD PTR [eax]
 4b5:	00 01                	add    BYTE PTR [ecx],al
 4b7:	9f                   	lahf   
 4b8:	82                   	(bad)  
 4b9:	04 10                	add    al,0x10
 4bb:	03 19                	add    ebx,DWORD PTR [ecx]
 4bd:	00 00                	add    BYTE PTR [eax],al
 4bf:	00 01                	add    BYTE PTR [ecx],al
 4c1:	9c                   	pushf  
 4c2:	d5 04                	aad    0x4
 4c4:	00 00                	add    BYTE PTR [eax],al
 4c6:	10 9a 00 00 00 01    	adc    BYTE PTR [edx+0x1000000],bl
 4cc:	9f                   	lahf   
 4cd:	5c                   	pop    esp
 4ce:	01 00                	add    DWORD PTR [eax],eax
 4d0:	00 02                	add    BYTE PTR [edx],al
 4d2:	91                   	xchg   ecx,eax
 4d3:	00 00                	add    BYTE PTR [eax],al
 4d5:	0f 2f 00             	comiss xmm0,DWORD PTR [eax]
 4d8:	00 00                	add    BYTE PTR [eax],al
 4da:	01 a4 9b 04 10 03 58 	add    DWORD PTR [ebx+ebx*4+0x58031004],esp
 4e1:	00 00                	add    BYTE PTR [eax],al
 4e3:	00 01                	add    BYTE PTR [ecx],al
 4e5:	9c                   	pushf  
 4e6:	08 05 00 00 10 9a    	or     BYTE PTR ds:0x9a100000,al
 4ec:	00 00                	add    BYTE PTR [eax],al
 4ee:	00 01                	add    BYTE PTR [ecx],al
 4f0:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 4f1:	5c                   	pop    esp
 4f2:	01 00                	add    DWORD PTR [eax],eax
 4f4:	00 02                	add    BYTE PTR [edx],al
 4f6:	91                   	xchg   ecx,eax
 4f7:	00 11                	add    BYTE PTR [ecx],dl
 4f9:	e7 01                	out    0x1,eax
 4fb:	00 00                	add    BYTE PTR [eax],al
 4fd:	01 a6 31 02 00 00    	add    DWORD PTR [esi+0x231],esp
 503:	03 91 f0 75 00 0f    	add    edx,DWORD PTR [ecx+0xf0075f0]
 509:	ca 02 00             	retf   0x2
 50c:	00 01                	add    BYTE PTR [ecx],al
 50e:	b1 f3                	mov    cl,0xf3
 510:	04 10                	add    al,0x10
 512:	03 ce                	add    ecx,esi
 514:	00 00                	add    BYTE PTR [eax],al
 516:	00 01                	add    BYTE PTR [ecx],al
 518:	9c                   	pushf  
 519:	52                   	push   edx
 51a:	05 00 00 10 9a       	add    eax,0x9a100000
 51f:	00 00                	add    BYTE PTR [eax],al
 521:	00 01                	add    BYTE PTR [ecx],al
 523:	b1 5c                	mov    cl,0x5c
 525:	01 00                	add    DWORD PTR [eax],eax
 527:	00 02                	add    BYTE PTR [edx],al
 529:	91                   	xchg   ecx,eax
 52a:	00 0e                	add    BYTE PTR [esi],cl
 52c:	74 6f                	je     59d <cmdClearScreen-0x30ffa63>
 52e:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
 531:	b3 5c                	mov    bl,0x5c
 533:	01 00                	add    DWORD PTR [eax],eax
 535:	00 02                	add    BYTE PTR [edx],al
 537:	91                   	xchg   ecx,eax
 538:	68 0d 22 05 10       	push   0x1005220d
 53d:	03 9c 00 00 00 0e 63 	add    ebx,DWORD PTR [eax+eax*1+0x630e0000]
 544:	6e                   	outs   dx,BYTE PTR ds:[esi]
 545:	74 00                	je     547 <cmdClearScreen-0x30ffab9>
 547:	01 bd 61 00 00 00    	add    DWORD PTR [ebp+0x61],edi
 54d:	02 91 6c 00 00 0c    	add    dl,BYTE PTR [ecx+0xc00006c]
 553:	02 01                	add    al,BYTE PTR [ecx]
 555:	00 00                	add    BYTE PTR [eax],al
 557:	01 ca                	add    edx,ecx
 559:	c1 05 10 03 4e 00 00 	rol    DWORD PTR ds:0x4e0310,0x0
 560:	00 01                	add    BYTE PTR [ecx],al
 562:	9c                   	pushf  
 563:	76 05                	jbe    56a <cmdClearScreen-0x30ffa96>
 565:	00 00                	add    BYTE PTR [eax],al
 567:	0e                   	push   cs
 568:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 56b:	00 01                	add    BYTE PTR [ecx],al
 56d:	cc                   	int3   
 56e:	5c                   	pop    esp
 56f:	01 00                	add    DWORD PTR [eax],eax
 571:	00 02                	add    BYTE PTR [edx],al
 573:	91                   	xchg   ecx,eax
 574:	6c                   	ins    BYTE PTR es:[edi],dx
 575:	00 0f                	add    BYTE PTR [edi],cl
 577:	94                   	xchg   esp,eax
 578:	01 00                	add    DWORD PTR [eax],eax
 57a:	00 01                	add    BYTE PTR [ecx],al
 57c:	d1 0f                	ror    DWORD PTR [edi],1
 57e:	06                   	push   es
 57f:	10 03                	adc    BYTE PTR [ebx],al
 581:	67 00 00             	add    BYTE PTR [bx+si],al
 584:	00 01                	add    BYTE PTR [ecx],al
 586:	9c                   	pushf  
 587:	b7 05                	mov    bh,0x5
 589:	00 00                	add    BYTE PTR [eax],al
 58b:	10 9a 00 00 00 01    	adc    BYTE PTR [edx+0x1000000],bl
 591:	d1 5c 01 00          	rcr    DWORD PTR [ecx+eax*1+0x0],1
 595:	00 02                	add    BYTE PTR [edx],al
 597:	91                   	xchg   ecx,eax
 598:	00 11                	add    BYTE PTR [ecx],dl
 59a:	e7 01                	out    0x1,eax
 59c:	00 00                	add    BYTE PTR [eax],al
 59e:	01 d3                	add    ebx,edx
 5a0:	31 02                	xor    DWORD PTR [edx],eax
 5a2:	00 00                	add    BYTE PTR [eax],al
 5a4:	03 91 ec 75 11 65    	add    edx,DWORD PTR [ecx+0x651175ec]
 5aa:	01 00                	add    DWORD PTR [eax],eax
 5ac:	00 01                	add    BYTE PTR [ecx],al
 5ae:	d4 3a                	aam    0x3a
 5b0:	00 00                	add    BYTE PTR [eax],al
 5b2:	00 02                	add    BYTE PTR [edx],al
 5b4:	91                   	xchg   ecx,eax
 5b5:	6c                   	ins    BYTE PTR es:[edi],dx
 5b6:	00 12                	add    BYTE PTR [edx],dl
 5b8:	64 01 00             	add    DWORD PTR fs:[eax],eax
 5bb:	00 c7                	add    bh,al
 5bd:	05 00 00 13 47       	add    eax,0x47130000
 5c2:	02 00                	add    al,BYTE PTR [eax]
 5c4:	00 09                	add    BYTE PTR [ecx],cl
 5c6:	00 11                	add    BYTE PTR [ecx],dl
 5c8:	f1                   	icebp  
 5c9:	02 00                	add    al,BYTE PTR [eax]
 5cb:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
 5ce:	b7 05                	mov    bh,0x5
 5d0:	00 00                	add    BYTE PTR [eax],al
 5d2:	05 03 00 1f 10       	add    eax,0x101f0003
 5d7:	03 18                	add    ebx,DWORD PTR [eax]
 5d9:	e3 02                	jecxz  5dd <cmdClearScreen-0x30ffa23>
 5db:	00 00                	add    BYTE PTR [eax],al
 5dd:	05 34 56 00 00       	add    eax,0x5634
 5e2:	00 05 03 88 24 10    	add    BYTE PTR ds:0x10248803,al
 5e8:	03 18                	add    ebx,DWORD PTR [eax]
 5ea:	b7 01                	mov    bh,0x1
 5ec:	00 00                	add    BYTE PTR [eax],al
 5ee:	05 35 56 00 00       	add    eax,0x5635
 5f3:	00 05 03 8c 24 10    	add    BYTE PTR ds:0x10248c03,al
 5f9:	03 18                	add    ebx,DWORD PTR [eax]
 5fb:	6a 00                	push   0x0
 5fd:	00 00                	add    BYTE PTR [eax],al
 5ff:	05 36 56 00 00       	add    eax,0x5636
 604:	00 05 03 84 24 10    	add    BYTE PTR ds:0x10248403,al
 60a:	03 18                	add    ebx,DWORD PTR [eax]
 60c:	f6 02 00             	test   BYTE PTR [edx],0x0
 60f:	00 05 37 7a 00 00    	add    BYTE PTR ds:0x7a37,al
 615:	00 05 03 a4 24 10    	add    BYTE PTR ds:0x1024a403,al
 61b:	03 18                	add    ebx,DWORD PTR [eax]
 61d:	41                   	inc    ecx
 61e:	02 00                	add    al,BYTE PTR [eax]
 620:	00 06                	add    BYTE PTR [esi],al
 622:	4c                   	dec    esp
 623:	c6 02 00             	mov    BYTE PTR [edx],0x0
 626:	00 05 03 94 24 10    	add    BYTE PTR ds:0x10249403,al
 62c:	03 19                	add    ebx,DWORD PTR [ecx]
 62e:	18 3d 01 00 00 04    	sbb    BYTE PTR ds:0x4000001,bh
 634:	24 3f                	and    al,0x3f
 636:	06                   	push   es
 637:	00 00                	add    BYTE PTR [eax],al
 639:	05 03 90 24 10       	add    eax,0x10249003
 63e:	03 07                	add    eax,DWORD PTR [edi]
 640:	04 2d                	add    al,0x2d
 642:	06                   	push   es
 643:	00 00                	add    BYTE PTR [eax],al
 645:	1a 50 06             	sbb    dl,BYTE PTR [eax+0x6]
 648:	00 00                	add    BYTE PTR [eax],al
 64a:	1b 5c 01 00          	sbb    ebx,DWORD PTR [ecx+eax*1+0x0]
 64e:	00 00                	add    BYTE PTR [eax],al
 650:	18 09                	sbb    BYTE PTR [ecx],cl
 652:	01 00                	add    DWORD PTR [eax],eax
 654:	00 04 25 61 06 00 00 	add    BYTE PTR [eiz*1+0x661],al
 65b:	05 03 80 24 10       	add    eax,0x10248003
 660:	03 07                	add    eax,DWORD PTR [edi]
 662:	04 45                	add    al,0x45
 664:	06                   	push   es
 665:	00 00                	add    BYTE PTR [eax],al
 667:	12 25 00 00 00 78    	adc    ah,BYTE PTR ds:0x78000000
 66d:	06                   	push   es
 66e:	00 00                	add    BYTE PTR [eax],al
 670:	1c 47                	sbb    al,0x47
 672:	02 00                	add    al,BYTE PTR [eax]
 674:	00 ff                	add    bh,bh
 676:	01 00                	add    DWORD PTR [eax],eax
 678:	18 c0                	sbb    al,al
 67a:	01 00                	add    DWORD PTR [eax],eax
 67c:	00 04 2b             	add    BYTE PTR [ebx+ebp*1],al
 67f:	67 06                	addr16 push es
 681:	00 00                	add    BYTE PTR [eax],al
 683:	05 03 80 22 10       	add    eax,0x10228003
 688:	03 18                	add    ebx,DWORD PTR [eax]
 68a:	1f                   	pop    ds
 68b:	03 00                	add    eax,DWORD PTR [eax]
 68d:	00 04 2c             	add    BYTE PTR [esp+ebp*1],al
 690:	5c                   	pop    esp
 691:	01 00                	add    DWORD PTR [eax],eax
 693:	00 05 03 a0 24 10    	add    BYTE PTR ds:0x1024a003,al
 699:	03 18                	add    ebx,DWORD PTR [eax]
 69b:	00 00                	add    BYTE PTR [eax],al
 69d:	00 00                	add    BYTE PTR [eax],al
 69f:	04 2d                	add    al,0x2d
 6a1:	c6 02 00             	mov    BYTE PTR [edx],0x0
 6a4:	00 05 03 68 21 10    	add    BYTE PTR ds:0x10216803,al
 6aa:	03 12                	add    edx,DWORD PTR [edx]
 6ac:	25 00 00 00 bb       	and    eax,0xbb000000
 6b1:	06                   	push   es
 6b2:	00 00                	add    BYTE PTR [eax],al
 6b4:	13 47 02             	adc    eax,DWORD PTR [edi+0x2]
 6b7:	00 00                	add    BYTE PTR [eax],al
 6b9:	05 00 18 2d 01       	add    eax,0x12d1800
 6be:	00 00                	add    BYTE PTR [eax],al
 6c0:	04 2e                	add    al,0x2e
 6c2:	ab                   	stos   DWORD PTR es:[edi],eax
 6c3:	06                   	push   es
 6c4:	00 00                	add    BYTE PTR [eax],al
 6c6:	05 03 60 21 10       	add    eax,0x10216003
 6cb:	03 18                	add    ebx,DWORD PTR [eax]
 6cd:	4d                   	dec    ebp
 6ce:	02 00                	add    al,BYTE PTR [eax]
 6d0:	00 04 2f             	add    BYTE PTR [edi+ebp*1],al
 6d3:	56                   	push   esi
 6d4:	00 00                	add    BYTE PTR [eax],al
 6d6:	00 05 03 9c 24 10    	add    BYTE PTR ds:0x10249c03,al
 6dc:	03 18                	add    ebx,DWORD PTR [eax]
 6de:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 6df:	01 00                	add    DWORD PTR [eax],eax
 6e1:	00 04 2f             	add    BYTE PTR [edi+ebp*1],al
 6e4:	56                   	push   esi
 6e5:	00 00                	add    BYTE PTR [eax],al
 6e7:	00 05 03 98 24 10    	add    BYTE PTR ds:0x10249803,al
 6ed:	03 18                	add    ebx,DWORD PTR [eax]
 6ef:	d8 02                	fadd   DWORD PTR [edx]
 6f1:	00 00                	add    BYTE PTR [eax],al
 6f3:	04 30                	add    al,0x30
 6f5:	1c 01                	sbb    al,0x1
 6f7:	00 00                	add    BYTE PTR [eax],al
 6f9:	05 03 a8 24 10       	add    eax,0x1024a803
 6fe:	03 12                	add    edx,DWORD PTR [edx]
 700:	25 00 00 00 0f       	and    eax,0xf000000
 705:	07                   	pop    es
 706:	00 00                	add    BYTE PTR [eax],al
 708:	13 47 02             	adc    eax,DWORD PTR [edi+0x2]
 70b:	00 00                	add    BYTE PTR [eax],al
 70d:	ff 00                	inc    DWORD PTR [eax]
 70f:	1d 63 77 64 00       	sbb    eax,0x647763
 714:	04 31                	add    al,0x31
 716:	ff 06                	inc    DWORD PTR [esi]
 718:	00 00                	add    BYTE PTR [eax],al
 71a:	05 03 80 21 10       	add    eax,0x10218003
 71f:	03 00                	add    eax,DWORD PTR [eax]
 721:	e2 06                	loop   729 <cmdClearScreen-0x30ff8d7>
 723:	00 00                	add    BYTE PTR [eax],al
 725:	04 00                	add    al,0x0
 727:	8c 01                	mov    WORD PTR [ecx],es
 729:	00 00                	add    BYTE PTR [eax],al
 72b:	04 01                	add    al,0x1
 72d:	a2 00 00 00 0c       	mov    ds:0xc000000,al
 732:	c3                   	ret    
 733:	03 00                	add    eax,DWORD PTR [eax]
 735:	00 37                	add    BYTE PTR [edi],dh
 737:	00 00                	add    BYTE PTR [eax],al
 739:	00 78 06             	add    BYTE PTR [eax+0x6],bh
 73c:	10 03                	adc    BYTE PTR [ebx],al
 73e:	c7                   	(bad)  
 73f:	0a 00                	or     al,BYTE PTR [eax]
 741:	00 ab 01 00 00 02    	add    BYTE PTR [ebx+0x2000001],ch
 747:	01 06                	add    DWORD PTR [esi],eax
 749:	0c 02                	or     al,0x2
 74b:	00 00                	add    BYTE PTR [eax],al
 74d:	02 01                	add    al,BYTE PTR [ecx]
 74f:	06                   	push   es
 750:	05 02 00 00 02       	add    eax,0x2000002
 755:	02 05 7e 00 00 00    	add    al,BYTE PTR ds:0x7e
 75b:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
 762:	02 08                	add    cl,BYTE PTR [eax]
 764:	05 77 01 00 00       	add    eax,0x177
 769:	04 e9                	add    al,0xe9
 76b:	03 00                	add    eax,DWORD PTR [eax]
 76d:	00 02                	add    BYTE PTR [edx],al
 76f:	2e                   	cs
 770:	53                   	push   ebx
 771:	00 00                	add    BYTE PTR [eax],al
 773:	00 02                	add    BYTE PTR [edx],al
 775:	01 08                	add    DWORD PTR [eax],ecx
 777:	03 02                	add    eax,DWORD PTR [edx]
 779:	00 00                	add    BYTE PTR [eax],al
 77b:	02 02                	add    al,BYTE PTR [edx]
 77d:	07                   	pop    es
 77e:	5d                   	pop    ebp
 77f:	02 00                	add    al,BYTE PTR [eax]
 781:	00 04 30             	add    BYTE PTR [eax+esi*1],al
 784:	02 00                	add    al,BYTE PTR [eax]
 786:	00 02                	add    BYTE PTR [edx],al
 788:	34 6c                	xor    al,0x6c
 78a:	00 00                	add    BYTE PTR [eax],al
 78c:	00 02                	add    BYTE PTR [edx],al
 78e:	04 07                	add    al,0x7
 790:	23 02                	and    eax,DWORD PTR [edx]
 792:	00 00                	add    BYTE PTR [eax],al
 794:	02 08                	add    cl,BYTE PTR [eax]
 796:	07                   	pop    es
 797:	19 02                	sbb    DWORD PTR [edx],eax
 799:	00 00                	add    BYTE PTR [eax],al
 79b:	02 04 05 7c 01 00 00 	add    al,BYTE PTR [eax*1+0x17c]
 7a2:	05 04 87 00 00       	add    eax,0x8704
 7a7:	00 06                	add    BYTE PTR [esi],al
 7a9:	25 00 00 00 02       	and    eax,0x2000000
 7ae:	01 02                	add    DWORD PTR [edx],eax
 7b0:	98                   	cwde   
 7b1:	02 00                	add    al,BYTE PTR [eax]
 7b3:	00 07                	add    BYTE PTR [edi],al
 7b5:	10 03                	adc    BYTE PTR [ebx],al
 7b7:	12 cc                	adc    cl,ah
 7b9:	00 00                	add    BYTE PTR [eax],al
 7bb:	00 08                	add    BYTE PTR [eax],cl
 7bd:	ee                   	out    dx,al
 7be:	01 00                	add    DWORD PTR [eax],eax
 7c0:	00 03                	add    BYTE PTR [ebx],al
 7c2:	14 cc                	adc    al,0xcc
 7c4:	00 00                	add    BYTE PTR [eax],al
 7c6:	00 00                	add    BYTE PTR [eax],al
 7c8:	08 72 00             	or     BYTE PTR [edx+0x0],dh
 7cb:	00 00                	add    BYTE PTR [eax],al
 7cd:	03 15 cc 00 00 00    	add    edx,DWORD PTR ds:0xcc
 7d3:	04 08                	add    al,0x8
 7d5:	45                   	inc    ebp
 7d6:	01 00                	add    DWORD PTR [eax],eax
 7d8:	00 03                	add    BYTE PTR [ebx],al
 7da:	16                   	push   ss
 7db:	d2 00                	rol    BYTE PTR [eax],cl
 7dd:	00 00                	add    BYTE PTR [eax],al
 7df:	08 08                	or     BYTE PTR [eax],cl
 7e1:	65 01 00             	add    DWORD PTR gs:[eax],eax
 7e4:	00 03                	add    BYTE PTR [ebx],al
 7e6:	17                   	pop    ss
 7e7:	3a 00                	cmp    al,BYTE PTR [eax]
 7e9:	00 00                	add    BYTE PTR [eax],al
 7eb:	0c 00                	or     al,0x0
 7ed:	05 04 25 00 00       	add    eax,0x2504
 7f2:	00 09                	add    BYTE PTR [ecx],cl
 7f4:	04 04                	add    al,0x4
 7f6:	3b 03                	cmp    eax,DWORD PTR [ebx]
 7f8:	00 00                	add    BYTE PTR [eax],al
 7fa:	03 18                	add    ebx,DWORD PTR [eax]
 7fc:	93                   	xchg   ebx,eax
 7fd:	00 00                	add    BYTE PTR [eax],al
 7ff:	00 0a                	add    BYTE PTR [edx],cl
 801:	af                   	scas   eax,DWORD PTR es:[edi]
 802:	03 00                	add    eax,DWORD PTR [eax]
 804:	00 01                	add    BYTE PTR [ecx],al
 806:	18 78 06             	sbb    BYTE PTR [eax+0x6],bh
 809:	10 03                	adc    BYTE PTR [ebx],al
 80b:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 80c:	00 00                	add    BYTE PTR [eax],al
 80e:	00 01                	add    BYTE PTR [ecx],al
 810:	9c                   	pushf  
 811:	0f 01 00             	sgdtd  [eax]
 814:	00 0b                	add    BYTE PTR [ebx],cl
 816:	ba 03 00 00 01       	mov    edx,0x1000003
 81b:	18 cc                	sbb    ah,cl
 81d:	00 00                	add    BYTE PTR [eax],al
 81f:	00 02                	add    BYTE PTR [edx],al
 821:	91                   	xchg   ecx,eax
 822:	00 0c 69             	add    BYTE PTR [ecx+ebp*2],cl
 825:	00 01                	add    BYTE PTR [ecx],al
 827:	1a 3a                	sbb    bh,BYTE PTR [edx]
 829:	00 00                	add    BYTE PTR [eax],al
 82b:	00 02                	add    BYTE PTR [edx],al
 82d:	91                   	xchg   ecx,eax
 82e:	6c                   	ins    BYTE PTR es:[edi],dx
 82f:	00 0d 7e 03 00 00    	add    BYTE PTR ds:0x37e,cl
 835:	01 30                	add    DWORD PTR [eax],esi
 837:	3a 00                	cmp    al,BYTE PTR [eax]
 839:	00 00                	add    BYTE PTR [eax],al
 83b:	1e                   	push   ds
 83c:	07                   	pop    es
 83d:	10 03                	adc    BYTE PTR [ebx],al
 83f:	a9 01 00 00 01       	test   eax,0x1000001
 844:	9c                   	pushf  
 845:	ad                   	lods   eax,DWORD PTR ds:[esi]
 846:	01 00                	add    DWORD PTR [eax],eax
 848:	00 0b                	add    BYTE PTR [ebx],cl
 84a:	c6 04 00 00          	mov    BYTE PTR [eax+eax*1],0x0
 84e:	01 30                	add    DWORD PTR [eax],esi
 850:	cc                   	int3   
 851:	00 00                	add    BYTE PTR [eax],al
 853:	00 02                	add    BYTE PTR [edx],al
 855:	91                   	xchg   ecx,eax
 856:	00 0b                	add    BYTE PTR [ebx],cl
 858:	e7 01                	out    0x1,eax
 85a:	00 00                	add    BYTE PTR [eax],al
 85c:	01 30                	add    DWORD PTR [eax],esi
 85e:	c4 01                	les    eax,FWORD PTR [ecx]
 860:	00 00                	add    BYTE PTR [eax],al
 862:	02 91 04 0b bb 04    	add    dl,BYTE PTR [ecx+0x4bb0b04]
 868:	00 00                	add    BYTE PTR [eax],al
 86a:	01 30                	add    DWORD PTR [eax],esi
 86c:	3a 00                	cmp    al,BYTE PTR [eax]
 86e:	00 00                	add    BYTE PTR [eax],al
 870:	02 91 08 0c 78 00    	add    dl,BYTE PTR [ecx+0x780c08]
 876:	01 32                	add    DWORD PTR [edx],esi
 878:	3a 00                	cmp    al,BYTE PTR [eax]
 87a:	00 00                	add    BYTE PTR [eax],al
 87c:	02 91 6c 0c 79 00    	add    dl,BYTE PTR [ecx+0x790c6c]
 882:	01 32                	add    DWORD PTR [edx],esi
 884:	3a 00                	cmp    al,BYTE PTR [eax]
 886:	00 00                	add    BYTE PTR [eax],al
 888:	02 91 68 0e ce 04    	add    dl,BYTE PTR [ecx+0x4ce0e68]
 88e:	00 00                	add    BYTE PTR [eax],al
 890:	01 33                	add    DWORD PTR [ebx],esi
 892:	3a 00                	cmp    al,BYTE PTR [eax]
 894:	00 00                	add    BYTE PTR [eax],al
 896:	02 91 64 0e a3 03    	add    dl,BYTE PTR [ecx+0x3a30e64]
 89c:	00 00                	add    BYTE PTR [eax],al
 89e:	01 33                	add    DWORD PTR [ebx],esi
 8a0:	3a 00                	cmp    al,BYTE PTR [eax]
 8a2:	00 00                	add    BYTE PTR [eax],al
 8a4:	02 91 60 0e 1a 04    	add    dl,BYTE PTR [ecx+0x41a0e60]
 8aa:	00 00                	add    BYTE PTR [eax],al
 8ac:	01 34 8c             	add    DWORD PTR [esp+ecx*4],esi
 8af:	00 00                	add    BYTE PTR [eax],al
 8b1:	00 02                	add    BYTE PTR [edx],al
 8b3:	91                   	xchg   ecx,eax
 8b4:	5f                   	pop    edi
 8b5:	0f 59 07             	mulps  xmm0,XMMWORD PTR [edi]
 8b8:	10 03                	adc    BYTE PTR [ebx],al
 8ba:	47                   	inc    edi
 8bb:	01 00                	add    DWORD PTR [eax],eax
 8bd:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 8c0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 8c1:	74 00                	je     8c3 <cmdClearScreen-0x30ff73d>
 8c3:	01 38                	add    DWORD PTR [eax],edi
 8c5:	6c                   	ins    BYTE PTR es:[edi],dx
 8c6:	00 00                	add    BYTE PTR [eax],al
 8c8:	00 02                	add    BYTE PTR [edx],al
 8ca:	91                   	xchg   ecx,eax
 8cb:	58                   	pop    eax
 8cc:	00 00                	add    BYTE PTR [eax],al
 8ce:	10 25 00 00 00 bd    	adc    BYTE PTR ds:0xbd000000,ah
 8d4:	01 00                	add    DWORD PTR [eax],eax
 8d6:	00 11                	add    BYTE PTR [ecx],dl
 8d8:	bd 01 00 00 7f       	mov    ebp,0x7f000001
 8dd:	00 02                	add    BYTE PTR [edx],al
 8df:	04 07                	add    al,0x7
 8e1:	88 00                	mov    BYTE PTR [eax],al
 8e3:	00 00                	add    BYTE PTR [eax],al
 8e5:	05 04 ad 01 00       	add    eax,0x1ad04
 8ea:	00 0d 05 04 00 00    	add    BYTE PTR ds:0x405,cl
 8f0:	01 62 3a             	add    DWORD PTR [edx+0x3a],esp
 8f3:	00 00                	add    BYTE PTR [eax],al
 8f5:	00 c7                	add    bh,al
 8f7:	08 10                	or     BYTE PTR [eax],dl
 8f9:	03 69 00             	add    ebp,DWORD PTR [ecx+0x0]
 8fc:	00 00                	add    BYTE PTR [eax],al
 8fe:	01 9c 0c 02 00 00 0b 	add    DWORD PTR [esp+ecx*1+0xb000002],ebx
 905:	03 05 00 00 01 62    	add    eax,DWORD PTR ds:0x62010000
 90b:	cc                   	int3   
 90c:	00 00                	add    BYTE PTR [eax],al
 90e:	00 02                	add    BYTE PTR [edx],al
 910:	91                   	xchg   ecx,eax
 911:	00 0c 69             	add    BYTE PTR [ecx+ebp*2],cl
 914:	00 01                	add    BYTE PTR [ecx],al
 916:	64                   	fs
 917:	6c                   	ins    BYTE PTR es:[edi],dx
 918:	00 00                	add    BYTE PTR [eax],al
 91a:	00 02                	add    BYTE PTR [edx],al
 91c:	91                   	xchg   ecx,eax
 91d:	6c                   	ins    BYTE PTR es:[edi],dx
 91e:	0c 72                	or     al,0x72
 920:	65                   	gs
 921:	74 00                	je     923 <cmdClearScreen-0x30ff6dd>
 923:	01 65 3a             	add    DWORD PTR [ebp+0x3a],esp
 926:	00 00                	add    BYTE PTR [eax],al
 928:	00 02                	add    BYTE PTR [edx],al
 92a:	91                   	xchg   ecx,eax
 92b:	68 00 0d 73 04       	push   0x4730d00
 930:	00 00                	add    BYTE PTR [eax],al
 932:	01 76 ca             	add    DWORD PTR [esi-0x36],esi
 935:	02 00                	add    al,BYTE PTR [eax]
 937:	00 30                	add    BYTE PTR [eax],dh
 939:	09 10                	or     DWORD PTR [eax],edx
 93b:	03 8e 02 00 00 01    	add    ecx,DWORD PTR [esi+0x1000002]
 941:	9c                   	pushf  
 942:	ca 02 00             	retf   0x2
 945:	00 0b                	add    BYTE PTR [ebx],cl
 947:	8f 03                	pop    DWORD PTR [ebx]
 949:	00 00                	add    BYTE PTR [eax],al
 94b:	01 76 81             	add    DWORD PTR [esi-0x7f],esi
 94e:	00 00                	add    BYTE PTR [eax],al
 950:	00 02                	add    BYTE PTR [edx],al
 952:	91                   	xchg   ecx,eax
 953:	00 0c 61             	add    BYTE PTR [ecx+eiz*2],cl
 956:	72 67                	jb     9bf <cmdClearScreen-0x30ff641>
 958:	00 01                	add    BYTE PTR [ecx],al
 95a:	78 cc                	js     928 <cmdClearScreen-0x30ff6d8>
 95c:	00 00                	add    BYTE PTR [eax],al
 95e:	00 02                	add    BYTE PTR [edx],al
 960:	91                   	xchg   ecx,eax
 961:	6c                   	ins    BYTE PTR es:[edi],dx
 962:	0e                   	push   cs
 963:	d6                   	(bad)  
 964:	04 00                	add    al,0x0
 966:	00 01                	add    BYTE PTR [ecx],al
 968:	79 cc                	jns    936 <cmdClearScreen-0x30ff6ca>
 96a:	00 00                	add    BYTE PTR [eax],al
 96c:	00 02                	add    BYTE PTR [edx],al
 96e:	91                   	xchg   ecx,eax
 96f:	68 0e 51 04 00       	push   0x4510e
 974:	00 01                	add    BYTE PTR [ecx],al
 976:	7a 3a                	jp     9b2 <cmdClearScreen-0x30ff64e>
 978:	00 00                	add    BYTE PTR [eax],al
 97a:	00 02                	add    BYTE PTR [edx],al
 97c:	91                   	xchg   ecx,eax
 97d:	64                   	fs
 97e:	0e                   	push   cs
 97f:	d0 03                	rol    BYTE PTR [ebx],1
 981:	00 00                	add    BYTE PTR [eax],al
 983:	01 7b 3a             	add    DWORD PTR [ebx+0x3a],edi
 986:	00 00                	add    BYTE PTR [eax],al
 988:	00 02                	add    BYTE PTR [edx],al
 98a:	91                   	xchg   ecx,eax
 98b:	60                   	pusha  
 98c:	0e                   	push   cs
 98d:	50                   	push   eax
 98e:	04 00                	add    al,0x0
 990:	00 01                	add    BYTE PTR [ecx],al
 992:	7c 3a                	jl     9ce <cmdClearScreen-0x30ff632>
 994:	00 00                	add    BYTE PTR [eax],al
 996:	00 02                	add    BYTE PTR [edx],al
 998:	91                   	xchg   ecx,eax
 999:	5c                   	pop    esp
 99a:	0e                   	push   cs
 99b:	5b                   	pop    ebx
 99c:	04 00                	add    al,0x0
 99e:	00 01                	add    BYTE PTR [ecx],al
 9a0:	7d 3a                	jge    9dc <cmdClearScreen-0x30ff624>
 9a2:	00 00                	add    BYTE PTR [eax],al
 9a4:	00 02                	add    BYTE PTR [edx],al
 9a6:	91                   	xchg   ecx,eax
 9a7:	58                   	pop    eax
 9a8:	0e                   	push   cs
 9a9:	58                   	pop    eax
 9aa:	04 00                	add    al,0x0
 9ac:	00 01                	add    BYTE PTR [ecx],al
 9ae:	7e 3a                	jle    9ea <cmdClearScreen-0x30ff616>
 9b0:	00 00                	add    BYTE PTR [eax],al
 9b2:	00 02                	add    BYTE PTR [edx],al
 9b4:	91                   	xchg   ecx,eax
 9b5:	54                   	push   esp
 9b6:	0e                   	push   cs
 9b7:	78 04                	js     9bd <cmdClearScreen-0x30ff643>
 9b9:	00 00                	add    BYTE PTR [eax],al
 9bb:	01 7f ca             	add    DWORD PTR [edi-0x36],edi
 9be:	02 00                	add    al,BYTE PTR [eax]
 9c0:	00 02                	add    BYTE PTR [edx],al
 9c2:	91                   	xchg   ecx,eax
 9c3:	50                   	push   eax
 9c4:	0e                   	push   cs
 9c5:	c0 04 00 00          	rol    BYTE PTR [eax+eax*1],0x0
 9c9:	01 80 ca 02 00 00    	add    DWORD PTR [eax+0x2ca],eax
 9cf:	02 91 4c 0f f1 0a    	add    dl,BYTE PTR [ecx+0xaf10f4c]
 9d5:	10 03                	adc    BYTE PTR [ebx],al
 9d7:	9e                   	sahf   
 9d8:	00 00                	add    BYTE PTR [eax],al
 9da:	00 0e                	add    BYTE PTR [esi],cl
 9dc:	79 03                	jns    9e1 <cmdClearScreen-0x30ff61f>
 9de:	00 00                	add    BYTE PTR [eax],al
 9e0:	01 d9                	add    ecx,ebx
 9e2:	cc                   	int3   
 9e3:	00 00                	add    BYTE PTR [eax],al
 9e5:	00 02                	add    BYTE PTR [edx],al
 9e7:	91                   	xchg   ecx,eax
 9e8:	48                   	dec    eax
 9e9:	00 00                	add    BYTE PTR [eax],al
 9eb:	05 04 cc 00 00       	add    eax,0xcc04
 9f0:	00 0d 34 04 00 00    	add    BYTE PTR ds:0x434,cl
 9f6:	01 ef                	add    edi,ebp
 9f8:	ca 02 00             	retf   0x2
 9fb:	00 be 0b 10 03 76    	add    BYTE PTR [esi+0x7603100b],bh
 a01:	00 00                	add    BYTE PTR [eax],al
 a03:	00 01                	add    BYTE PTR [ecx],al
 a05:	9c                   	pushf  
 a06:	2c 03                	sub    al,0x3
 a08:	00 00                	add    BYTE PTR [eax],al
 a0a:	0b 56 02             	or     edx,DWORD PTR [esi+0x2]
 a0d:	00 00                	add    BYTE PTR [eax],al
 a0f:	01 ef                	add    edi,ebp
 a11:	3a 00                	cmp    al,BYTE PTR [eax]
 a13:	00 00                	add    BYTE PTR [eax],al
 a15:	02 91 00 0b e7 01    	add    dl,BYTE PTR [ecx+0x1e70b00]
 a1b:	00 00                	add    BYTE PTR [eax],al
 a1d:	01 ef                	add    edi,ebp
 a1f:	c4 01                	les    eax,FWORD PTR [ecx]
 a21:	00 00                	add    BYTE PTR [eax],al
 a23:	02 91 04 0b b6 04    	add    dl,BYTE PTR [ecx+0x4b60b04]
 a29:	00 00                	add    BYTE PTR [eax],al
 a2b:	01 ef                	add    edi,ebp
 a2d:	ca 02 00             	retf   0x2
 a30:	00 02                	add    BYTE PTR [edx],al
 a32:	91                   	xchg   ecx,eax
 a33:	08 0f                	or     BYTE PTR [edi],cl
 a35:	c5 0b                	lds    ecx,FWORD PTR [ebx]
 a37:	10 03                	adc    BYTE PTR [ebx],al
 a39:	67 00 00             	add    BYTE PTR [bx+si],al
 a3c:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 a3f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 a40:	74 00                	je     a42 <cmdClearScreen-0x30ff5be>
 a42:	01 f1                	add    ecx,esi
 a44:	3a 00                	cmp    al,BYTE PTR [eax]
 a46:	00 00                	add    BYTE PTR [eax],al
 a48:	02 91 6c 00 00 0a    	add    dl,BYTE PTR [ecx+0xa00006c]
 a4e:	11 04 00             	adc    DWORD PTR [eax+eax*1],eax
 a51:	00 01                	add    BYTE PTR [ecx],al
 a53:	f9                   	stc    
 a54:	34 0c                	xor    al,0xc
 a56:	10 03                	adc    BYTE PTR [ebx],al
 a58:	3d 00 00 00 01       	cmp    eax,0x1000000
 a5d:	9c                   	pushf  
 a5e:	76 03                	jbe    a63 <cmdClearScreen-0x30ff59d>
 a60:	00 00                	add    BYTE PTR [eax],al
 a62:	0b 56 02             	or     edx,DWORD PTR [esi+0x2]
 a65:	00 00                	add    BYTE PTR [eax],al
 a67:	01 f9                	add    ecx,edi
 a69:	3a 00                	cmp    al,BYTE PTR [eax]
 a6b:	00 00                	add    BYTE PTR [eax],al
 a6d:	02 91 00 0b e7 01    	add    dl,BYTE PTR [ecx+0x1e70b00]
 a73:	00 00                	add    BYTE PTR [eax],al
 a75:	01 f9                	add    ecx,edi
 a77:	ca 02 00             	retf   0x2
 a7a:	00 02                	add    BYTE PTR [edx],al
 a7c:	91                   	xchg   ecx,eax
 a7d:	04 0f                	add    al,0xf
 a7f:	3a 0c 10             	cmp    cl,BYTE PTR [eax+edx*1]
 a82:	03 26                	add    esp,DWORD PTR [esi]
 a84:	00 00                	add    BYTE PTR [eax],al
 a86:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 a89:	6e                   	outs   dx,BYTE PTR ds:[esi]
 a8a:	74 00                	je     a8c <cmdClearScreen-0x30ff574>
 a8c:	01 fb                	add    ebx,edi
 a8e:	3a 00                	cmp    al,BYTE PTR [eax]
 a90:	00 00                	add    BYTE PTR [eax],al
 a92:	02 91 6c 00 00 12    	add    dl,BYTE PTR [ecx+0x1200006c]
 a98:	f1                   	icebp  
 a99:	03 00                	add    eax,DWORD PTR [eax]
 a9b:	00 01                	add    BYTE PTR [ecx],al
 a9d:	00 01                	add    BYTE PTR [ecx],al
 a9f:	8c 00                	mov    WORD PTR [eax],es
 aa1:	00 00                	add    BYTE PTR [eax],al
 aa3:	71 0c                	jno    ab1 <cmdClearScreen-0x30ff54f>
 aa5:	10 03                	adc    BYTE PTR [ebx],al
 aa7:	8c 00                	mov    WORD PTR [eax],es
 aa9:	00 00                	add    BYTE PTR [eax],al
 aab:	01 9c e1 03 00 00 13 	add    DWORD PTR [ecx+eiz*8+0x13000003],ebx
 ab2:	60                   	pusha  
 ab3:	04 00                	add    al,0x0
 ab5:	00 01                	add    BYTE PTR [ecx],al
 ab7:	00 01                	add    BYTE PTR [ecx],al
 ab9:	cc                   	int3   
 aba:	00 00                	add    BYTE PTR [eax],al
 abc:	00 02                	add    BYTE PTR [edx],al
 abe:	91                   	xchg   ecx,eax
 abf:	00 13                	add    BYTE PTR [ebx],dl
 ac1:	d7                   	xlat   BYTE PTR ds:[ebx]
 ac2:	03 00                	add    eax,DWORD PTR [eax]
 ac4:	00 01                	add    BYTE PTR [ecx],al
 ac6:	00 01                	add    BYTE PTR [ecx],al
 ac8:	cc                   	int3   
 ac9:	00 00                	add    BYTE PTR [eax],al
 acb:	00 02                	add    BYTE PTR [edx],al
 acd:	91                   	xchg   ecx,eax
 ace:	04 0f                	add    al,0xf
 ad0:	77 0c                	ja     ade <cmdClearScreen-0x30ff522>
 ad2:	10 03                	adc    BYTE PTR [ebx],al
 ad4:	7f 00                	jg     ad6 <cmdClearScreen-0x30ff52a>
 ad6:	00 00                	add    BYTE PTR [eax],al
 ad8:	14 63                	adc    al,0x63
 ada:	6e                   	outs   dx,BYTE PTR ds:[esi]
 adb:	74 00                	je     add <cmdClearScreen-0x30ff523>
 add:	01 03                	add    DWORD PTR [ebx],eax
 adf:	01 3a                	add    DWORD PTR [edx],edi
 ae1:	00 00                	add    BYTE PTR [eax],al
 ae3:	00 02                	add    BYTE PTR [edx],al
 ae5:	91                   	xchg   ecx,eax
 ae6:	6c                   	ins    BYTE PTR es:[edi],dx
 ae7:	0f 93 0c 10          	setae  BYTE PTR [eax+edx*1]
 aeb:	03 59 00             	add    ebx,DWORD PTR [ecx+0x0]
 aee:	00 00                	add    BYTE PTR [eax],al
 af0:	14 69                	adc    al,0x69
 af2:	64                   	fs
 af3:	78 00                	js     af5 <cmdClearScreen-0x30ff50b>
 af5:	01 07                	add    DWORD PTR [edi],eax
 af7:	01 cc                	add    esp,ecx
 af9:	00 00                	add    BYTE PTR [eax],al
 afb:	00 02                	add    BYTE PTR [edx],al
 afd:	91                   	xchg   ecx,eax
 afe:	68 00 00 00 15       	push   0x15000000
 b03:	67 04 00             	addr16 add al,0x0
 b06:	00 01                	add    BYTE PTR [ecx],al
 b08:	1f                   	pop    ds
 b09:	01 fd                	add    ebp,edi
 b0b:	0c 10                	or     al,0x10
 b0d:	03 2e                	add    ebp,DWORD PTR [esi]
 b0f:	00 00                	add    BYTE PTR [eax],al
 b11:	00 01                	add    BYTE PTR [ecx],al
 b13:	9c                   	pushf  
 b14:	07                   	pop    es
 b15:	04 00                	add    al,0x0
 b17:	00 13                	add    BYTE PTR [ebx],dl
 b19:	03 05 00 00 01 1f    	add    eax,DWORD PTR ds:0x1f010000
 b1f:	01 cc                	add    esp,ecx
 b21:	00 00                	add    BYTE PTR [eax],al
 b23:	00 02                	add    BYTE PTR [edx],al
 b25:	91                   	xchg   ecx,eax
 b26:	00 00                	add    BYTE PTR [eax],al
 b28:	16                   	push   ss
 b29:	5b                   	pop    ebx
 b2a:	03 00                	add    eax,DWORD PTR [eax]
 b2c:	00 01                	add    BYTE PTR [ecx],al
 b2e:	24 01                	and    al,0x1
 b30:	2b 0d 10 03 23 00    	sub    ecx,DWORD PTR ds:0x230310
 b36:	00 00                	add    BYTE PTR [eax],al
 b38:	01 9c 12 41 04 00 00 	add    DWORD PTR [edx+edx*1+0x441],ebx
 b3f:	01 29                	add    DWORD PTR [ecx],ebp
 b41:	01 3a                	add    DWORD PTR [edx],edi
 b43:	00 00                	add    BYTE PTR [eax],al
 b45:	00 4e 0d             	add    BYTE PTR [esi+0xd],cl
 b48:	10 03                	adc    BYTE PTR [ebx],al
 b4a:	26 00 00             	add    BYTE PTR es:[eax],al
 b4d:	00 01                	add    BYTE PTR [ecx],al
 b4f:	9c                   	pushf  
 b50:	51                   	push   ecx
 b51:	04 00                	add    al,0x0
 b53:	00 13                	add    BYTE PTR [ebx],dl
 b55:	03 05 00 00 01 29    	add    eax,DWORD PTR ds:0x29010000
 b5b:	01 cc                	add    esp,ecx
 b5d:	00 00                	add    BYTE PTR [eax],al
 b5f:	00 02                	add    BYTE PTR [edx],al
 b61:	91                   	xchg   ecx,eax
 b62:	00 17                	add    BYTE PTR [edi],dl
 b64:	de 04 00             	fiadd  WORD PTR [eax+eax*1]
 b67:	00 01                	add    BYTE PTR [ecx],al
 b69:	2b 01                	sub    eax,DWORD PTR [ecx]
 b6b:	3a 00                	cmp    al,BYTE PTR [eax]
 b6d:	00 00                	add    BYTE PTR [eax],al
 b6f:	18 00                	sbb    BYTE PTR [eax],al
 b71:	00 12                	add    BYTE PTR [edx],dl
 b73:	95                   	xchg   ebp,eax
 b74:	04 00                	add    al,0x0
 b76:	00 01                	add    BYTE PTR [ecx],al
 b78:	32 01                	xor    al,BYTE PTR [ecx]
 b7a:	3a 00                	cmp    al,BYTE PTR [eax]
 b7c:	00 00                	add    BYTE PTR [eax],al
 b7e:	74 0d                	je     b8d <cmdClearScreen-0x30ff473>
 b80:	10 03                	adc    BYTE PTR [ebx],al
 b82:	cb                   	retf   
 b83:	03 00                	add    eax,DWORD PTR [eax]
 b85:	00 01                	add    BYTE PTR [ecx],al
 b87:	9c                   	pushf  
 b88:	22 05 00 00 13 5b    	and    al,BYTE PTR ds:0x5b130000
 b8e:	04 00                	add    al,0x0
 b90:	00 01                	add    BYTE PTR [ecx],al
 b92:	32 01                	xor    al,BYTE PTR [ecx]
 b94:	3a 00                	cmp    al,BYTE PTR [eax]
 b96:	00 00                	add    BYTE PTR [eax],al
 b98:	02 91 00 13 78 04    	add    dl,BYTE PTR [ecx+0x4781300]
 b9e:	00 00                	add    BYTE PTR [eax],al
 ba0:	01 32                	add    DWORD PTR [edx],esi
 ba2:	01 ca                	add    edx,ecx
 ba4:	02 00                	add    al,BYTE PTR [eax]
 ba6:	00 02                	add    BYTE PTR [edx],al
 ba8:	91                   	xchg   ecx,eax
 ba9:	04 13                	add    al,0x13
 bab:	62 03                	bound  eax,QWORD PTR [ebx]
 bad:	00 00                	add    BYTE PTR [eax],al
 baf:	01 32                	add    DWORD PTR [edx],esi
 bb1:	01 ca                	add    edx,ecx
 bb3:	02 00                	add    al,BYTE PTR [eax]
 bb5:	00 02                	add    BYTE PTR [edx],al
 bb7:	91                   	xchg   ecx,eax
 bb8:	08 19                	or     BYTE PTR [ecx],bl
 bba:	ba 03 00 00 01       	mov    edx,0x1000003
 bbf:	34 01                	xor    al,0x1
 bc1:	22 05 00 00 03 91    	and    al,BYTE PTR ds:0x91030000
 bc7:	e4 7d                	in     al,0x7d
 bc9:	19 8c 04 00 00 01 35 	sbb    DWORD PTR [esp+eax*1+0x35010000],ecx
 bd0:	01 48 00             	add    DWORD PTR [eax+0x0],ecx
 bd3:	00 00                	add    BYTE PTR [eax],al
 bd5:	03 91 e3 7d 19 95    	add    edx,DWORD PTR [ecx-0x6ae6821d]
 bdb:	03 00                	add    eax,DWORD PTR [eax]
 bdd:	00 01                	add    BYTE PTR [ecx],al
 bdf:	36 01 3a             	add    DWORD PTR ss:[edx],edi
 be2:	00 00                	add    BYTE PTR [eax],al
 be4:	00 02                	add    BYTE PTR [edx],al
 be6:	91                   	xchg   ecx,eax
 be7:	6c                   	ins    BYTE PTR es:[edi],dx
 be8:	19 e7                	sbb    edi,esp
 bea:	04 00                	add    al,0x0
 bec:	00 01                	add    BYTE PTR [ecx],al
 bee:	37                   	aaa    
 bef:	01 3a                	add    DWORD PTR [edx],edi
 bf1:	00 00                	add    BYTE PTR [eax],al
 bf3:	00 02                	add    BYTE PTR [edx],al
 bf5:	91                   	xchg   ecx,eax
 bf6:	68 19 9c 04 00       	push   0x49c19
 bfb:	00 01                	add    BYTE PTR [ecx],al
 bfd:	38 01                	cmp    BYTE PTR [ecx],al
 bff:	32 05 00 00 03 91    	xor    al,BYTE PTR ds:0x91030000
 c05:	cf                   	iret   
 c06:	7d 1a                	jge    c22 <cmdClearScreen-0x30ff3de>
 c08:	dd 03                	fld    QWORD PTR [ebx]
 c0a:	00 00                	add    BYTE PTR [eax],al
 c0c:	01 46 01             	add    DWORD PTR [esi+0x1],eax
 c0f:	0d 0e 10 03 1a       	or     eax,0x1a03100e
 c14:	0b 05 00 00 01 4e    	or     eax,DWORD PTR ds:0x4e010000
 c1a:	01 5f 0e             	add    DWORD PTR [edi+0xe],ebx
 c1d:	10 03                	adc    BYTE PTR [ebx],al
 c1f:	1a 4b 03             	sbb    cl,BYTE PTR [ebx+0x3]
 c22:	00 00                	add    BYTE PTR [eax],al
 c24:	01 a6 01 88 10 10    	add    DWORD PTR [esi+0x10108801],esp
 c2a:	03 0f                	add    ecx,DWORD PTR [edi]
 c2c:	0d 0e 10 03 08       	or     eax,0x803100e
 c31:	03 00                	add    eax,DWORD PTR [eax]
 c33:	00 14 69             	add    BYTE PTR [ecx+ebp*2],dl
 c36:	00 01                	add    BYTE PTR [ecx],al
 c38:	ab                   	stos   DWORD PTR es:[edi],eax
 c39:	01 3a                	add    DWORD PTR [edx],edi
 c3b:	00 00                	add    BYTE PTR [eax],al
 c3d:	00 02                	add    BYTE PTR [edx],al
 c3f:	91                   	xchg   ecx,eax
 c40:	64 00 00             	add    BYTE PTR fs:[eax],al
 c43:	10 25 00 00 00 32    	adc    BYTE PTR ds:0x32000000,ah
 c49:	05 00 00 11 bd       	add    eax,0xbd110000
 c4e:	01 00                	add    DWORD PTR [eax],eax
 c50:	00 ff                	add    bh,bh
 c52:	00 10                	add    BYTE PTR [eax],dl
 c54:	25 00 00 00 42       	and    eax,0x42000000
 c59:	05 00 00 11 bd       	add    eax,0xbd110000
 c5e:	01 00                	add    DWORD PTR [eax],eax
 c60:	00 13                	add    BYTE PTR [ebx],dl
 c62:	00 10                	add    BYTE PTR [eax],dl
 c64:	d4 00                	aam    0x0
 c66:	00 00                	add    BYTE PTR [eax],al
 c68:	52                   	push   edx
 c69:	05 00 00 11 bd       	add    eax,0xbd110000
 c6e:	01 00                	add    DWORD PTR [eax],eax
 c70:	00 09                	add    BYTE PTR [ecx],cl
 c72:	00 0e                	add    BYTE PTR [esi],cl
 c74:	f1                   	icebp  
 c75:	02 00                	add    al,BYTE PTR [eax]
 c77:	00 03                	add    BYTE PTR [ebx],al
 c79:	33 42 05             	xor    eax,DWORD PTR [edx+0x5]
 c7c:	00 00                	add    BYTE PTR [eax],al
 c7e:	05 03 a0 1f 10       	add    eax,0x101fa003
 c83:	03 1b                	add    ebx,DWORD PTR [ebx]
 c85:	e3 02                	jecxz  c89 <cmdClearScreen-0x30ff377>
 c87:	00 00                	add    BYTE PTR [eax],al
 c89:	04 34                	add    al,0x34
 c8b:	61                   	popa   
 c8c:	00 00                	add    BYTE PTR [eax],al
 c8e:	00 05 03 88 24 10    	add    BYTE PTR ds:0x10248803,al
 c94:	03 1b                	add    ebx,DWORD PTR [ebx]
 c96:	b7 01                	mov    bh,0x1
 c98:	00 00                	add    BYTE PTR [eax],al
 c9a:	04 35                	add    al,0x35
 c9c:	61                   	popa   
 c9d:	00 00                	add    BYTE PTR [eax],al
 c9f:	00 05 03 8c 24 10    	add    BYTE PTR ds:0x10248c03,al
 ca5:	03 1b                	add    ebx,DWORD PTR [ebx]
 ca7:	6a 00                	push   0x0
 ca9:	00 00                	add    BYTE PTR [eax],al
 cab:	04 36                	add    al,0x36
 cad:	61                   	popa   
 cae:	00 00                	add    BYTE PTR [eax],al
 cb0:	00 05 03 84 24 10    	add    BYTE PTR ds:0x10248403,al
 cb6:	03 1b                	add    ebx,DWORD PTR [ebx]
 cb8:	f6 02 00             	test   BYTE PTR [edx],0x0
 cbb:	00 04 37             	add    BYTE PTR [edi+esi*1],al
 cbe:	7a 00                	jp     cc0 <cmdClearScreen-0x30ff340>
 cc0:	00 00                	add    BYTE PTR [eax],al
 cc2:	05 03 a4 24 10       	add    eax,0x1024a403
 cc7:	03 1b                	add    ebx,DWORD PTR [ebx]
 cc9:	41                   	inc    ecx
 cca:	02 00                	add    al,BYTE PTR [eax]
 ccc:	00 05 4c ca 02 00    	add    BYTE PTR ds:0x2ca4c,al
 cd2:	00 05 03 94 24 10    	add    BYTE PTR ds:0x10249403,al
 cd8:	03 1c 1b             	add    ebx,DWORD PTR [ebx+ebx*1]
 cdb:	3d 01 00 00 03       	cmp    eax,0x3000001
 ce0:	24 ca                	and    al,0xca
 ce2:	05 00 00 05 03       	add    eax,0x3050000
 ce7:	90                   	nop
 ce8:	24 10                	and    al,0x10
 cea:	03 05 04 b8 05 00    	add    eax,DWORD PTR ds:0x5b804
 cf0:	00 1d db 05 00 00    	add    BYTE PTR ds:0x5db,bl
 cf6:	1e                   	push   ds
 cf7:	cc                   	int3   
 cf8:	00 00                	add    BYTE PTR [eax],al
 cfa:	00 00                	add    BYTE PTR [eax],al
 cfc:	1b 09                	sbb    ecx,DWORD PTR [ecx]
 cfe:	01 00                	add    DWORD PTR [eax],eax
 d00:	00 03                	add    BYTE PTR [ebx],al
 d02:	25 ec 05 00 00       	and    eax,0x5ec
 d07:	05 03 80 24 10       	add    eax,0x10248003
 d0c:	03 05 04 d0 05 00    	add    eax,DWORD PTR ds:0x5d004
 d12:	00 10                	add    BYTE PTR [eax],dl
 d14:	25 00 00 00 03       	and    eax,0x3000000
 d19:	06                   	push   es
 d1a:	00 00                	add    BYTE PTR [eax],al
 d1c:	1f                   	pop    ds
 d1d:	bd 01 00 00 ff       	mov    ebp,0xff000001
 d22:	01 00                	add    DWORD PTR [eax],eax
 d24:	1b c0                	sbb    eax,eax
 d26:	01 00                	add    DWORD PTR [eax],eax
 d28:	00 03                	add    BYTE PTR [ebx],al
 d2a:	2b f2                	sub    esi,edx
 d2c:	05 00 00 05 03       	add    eax,0x3050000
 d31:	80 22 10             	and    BYTE PTR [edx],0x10
 d34:	03 1b                	add    ebx,DWORD PTR [ebx]
 d36:	1f                   	pop    ds
 d37:	03 00                	add    eax,DWORD PTR [eax]
 d39:	00 03                	add    BYTE PTR [ebx],al
 d3b:	2c cc                	sub    al,0xcc
 d3d:	00 00                	add    BYTE PTR [eax],al
 d3f:	00 05 03 a0 24 10    	add    BYTE PTR ds:0x1024a003,al
 d45:	03 1b                	add    ebx,DWORD PTR [ebx]
 d47:	00 00                	add    BYTE PTR [eax],al
 d49:	00 00                	add    BYTE PTR [eax],al
 d4b:	03 2d ca 02 00 00    	add    ebp,DWORD PTR ds:0x2ca
 d51:	05 03 68 21 10       	add    eax,0x10216803
 d56:	03 10                	add    edx,DWORD PTR [eax]
 d58:	25 00 00 00 46       	and    eax,0x46000000
 d5d:	06                   	push   es
 d5e:	00 00                	add    BYTE PTR [eax],al
 d60:	11 bd 01 00 00 05    	adc    DWORD PTR [ebp+0x5000001],edi
 d66:	00 1b                	add    BYTE PTR [ebx],bl
 d68:	2d 01 00 00 03       	sub    eax,0x3000001
 d6d:	2e                   	cs
 d6e:	36                   	ss
 d6f:	06                   	push   es
 d70:	00 00                	add    BYTE PTR [eax],al
 d72:	05 03 60 21 10       	add    eax,0x10216003
 d77:	03 1b                	add    ebx,DWORD PTR [ebx]
 d79:	4d                   	dec    ebp
 d7a:	02 00                	add    al,BYTE PTR [eax]
 d7c:	00 03                	add    BYTE PTR [ebx],al
 d7e:	2f                   	das    
 d7f:	61                   	popa   
 d80:	00 00                	add    BYTE PTR [eax],al
 d82:	00 05 03 9c 24 10    	add    BYTE PTR ds:0x10249c03,al
 d88:	03 1b                	add    ebx,DWORD PTR [ebx]
 d8a:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 d8b:	01 00                	add    DWORD PTR [eax],eax
 d8d:	00 03                	add    BYTE PTR [ebx],al
 d8f:	2f                   	das    
 d90:	61                   	popa   
 d91:	00 00                	add    BYTE PTR [eax],al
 d93:	00 05 03 98 24 10    	add    BYTE PTR ds:0x10249803,al
 d99:	03 1b                	add    ebx,DWORD PTR [ebx]
 d9b:	d8 02                	fadd   DWORD PTR [edx]
 d9d:	00 00                	add    BYTE PTR [eax],al
 d9f:	03 30                	add    esi,DWORD PTR [eax]
 da1:	8c 00                	mov    WORD PTR [eax],es
 da3:	00 00                	add    BYTE PTR [eax],al
 da5:	05 03 a8 24 10       	add    eax,0x1024a803
 daa:	03 20                	add    esp,DWORD PTR [eax]
 dac:	63 77 64             	arpl   WORD PTR [edi+0x64],si
 daf:	00 03                	add    BYTE PTR [ebx],al
 db1:	31 22                	xor    DWORD PTR [edx],esp
 db3:	05 00 00 05 03       	add    eax,0x3050000
 db8:	80 21 10             	and    BYTE PTR [ecx],0x10
 dbb:	03 10                	add    edx,DWORD PTR [eax]
 dbd:	25 00 00 00 b2       	and    eax,0xb2000000
 dc2:	06                   	push   es
 dc3:	00 00                	add    BYTE PTR [eax],al
 dc5:	1f                   	pop    ds
 dc6:	bd 01 00 00 f3       	mov    ebp,0xf3000001
 dcb:	01 11                	add    DWORD PTR [ecx],edx
 dcd:	bd 01 00 00 7f       	mov    ebp,0x7f000001
 dd2:	00 1b                	add    BYTE PTR [ebx],bl
 dd4:	7d 04                	jge    dda <cmdClearScreen-0x30ff226>
 dd6:	00 00                	add    BYTE PTR [eax],al
 dd8:	01 10                	add    DWORD PTR [eax],edx
 dda:	9b                   	fwait
 ddb:	06                   	push   es
 ddc:	00 00                	add    BYTE PTR [eax],al
 dde:	05 03 c0 24 10       	add    eax,0x1024c003
 de3:	03 1b                	add    ebx,DWORD PTR [ebx]
 de5:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 de6:	04 00                	add    al,0x0
 de8:	00 01                	add    BYTE PTR [ecx],al
 dea:	11 3a                	adc    DWORD PTR [edx],edi
 dec:	00 00                	add    BYTE PTR [eax],al
 dee:	00 05 03 ac 24 10    	add    BYTE PTR ds:0x1024ac03,al
 df4:	03 1b                	add    ebx,DWORD PTR [ebx]
 df6:	67 03 00             	add    eax,DWORD PTR [bx+si]
 df9:	00 01                	add    BYTE PTR [ecx],al
 dfb:	12 3a                	adc    bh,BYTE PTR [edx]
 dfd:	00 00                	add    BYTE PTR [eax],al
 dff:	00 05 03 b0 24 10    	add    BYTE PTR ds:0x1024b003,al
 e05:	03 00                	add    eax,DWORD PTR [eax]

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
  64:	09 13                	or     DWORD PTR [ebx],edx
  66:	01 0b                	add    DWORD PTR [ebx],ecx
  68:	0b 3a                	or     edi,DWORD PTR [edx]
  6a:	0b 3b                	or     edi,DWORD PTR [ebx]
  6c:	0b 01                	or     eax,DWORD PTR [ecx]
  6e:	13 00                	adc    eax,DWORD PTR [eax]
  70:	00 0a                	add    BYTE PTR [edx],cl
  72:	0f 00 0b             	str    WORD PTR [ebx]
  75:	0b 00                	or     eax,DWORD PTR [eax]
  77:	00 0b                	add    BYTE PTR [ebx],cl
  79:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
  7c:	19 03                	sbb    DWORD PTR [ebx],eax
  7e:	0e                   	push   cs
  7f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  81:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  83:	11 01                	adc    DWORD PTR [ecx],eax
  85:	12 06                	adc    al,BYTE PTR [esi]
  87:	40                   	inc    eax
  88:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
  8e:	0c 2e                	or     al,0x2e
  90:	01 3f                	add    DWORD PTR [edi],edi
  92:	19 03                	sbb    DWORD PTR [ebx],eax
  94:	0e                   	push   cs
  95:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  97:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  99:	11 01                	adc    DWORD PTR [ecx],eax
  9b:	12 06                	adc    al,BYTE PTR [esi]
  9d:	40                   	inc    eax
  9e:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  a4:	00 00                	add    BYTE PTR [eax],al
  a6:	0d 0b 01 11 01       	or     eax,0x111010b
  ab:	12 06                	adc    al,BYTE PTR [esi]
  ad:	00 00                	add    BYTE PTR [eax],al
  af:	0e                   	push   cs
  b0:	34 00                	xor    al,0x0
  b2:	03 08                	add    ecx,DWORD PTR [eax]
  b4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  b6:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  b8:	49                   	dec    ecx
  b9:	13 02                	adc    eax,DWORD PTR [edx]
  bb:	18 00                	sbb    BYTE PTR [eax],al
  bd:	00 0f                	add    BYTE PTR [edi],cl
  bf:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  c2:	19 03                	sbb    DWORD PTR [ebx],eax
  c4:	0e                   	push   cs
  c5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  c7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  c9:	27                   	daa    
  ca:	19 11                	sbb    DWORD PTR [ecx],edx
  cc:	01 12                	add    DWORD PTR [edx],edx
  ce:	06                   	push   es
  cf:	40                   	inc    eax
  d0:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  d6:	00 00                	add    BYTE PTR [eax],al
  d8:	10 05 00 03 0e 3a    	adc    BYTE PTR ds:0x3a0e0300,al
  de:	0b 3b                	or     edi,DWORD PTR [ebx]
  e0:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  e3:	02 18                	add    bl,BYTE PTR [eax]
  e5:	00 00                	add    BYTE PTR [eax],al
  e7:	11 34 00             	adc    DWORD PTR [eax+eax*1],esi
  ea:	03 0e                	add    ecx,DWORD PTR [esi]
  ec:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  ee:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  f0:	49                   	dec    ecx
  f1:	13 02                	adc    eax,DWORD PTR [edx]
  f3:	18 00                	sbb    BYTE PTR [eax],al
  f5:	00 12                	add    BYTE PTR [edx],dl
  f7:	01 01                	add    DWORD PTR [ecx],eax
  f9:	49                   	dec    ecx
  fa:	13 01                	adc    eax,DWORD PTR [ecx]
  fc:	13 00                	adc    eax,DWORD PTR [eax]
  fe:	00 13                	add    BYTE PTR [ebx],dl
 100:	21 00                	and    DWORD PTR [eax],eax
 102:	49                   	dec    ecx
 103:	13 2f                	adc    ebp,DWORD PTR [edi]
 105:	0b 00                	or     eax,DWORD PTR [eax]
 107:	00 14 2e             	add    BYTE PTR [esi+ebp*1],dl
 10a:	01 3f                	add    DWORD PTR [edi],edi
 10c:	19 03                	sbb    DWORD PTR [ebx],eax
 10e:	0e                   	push   cs
 10f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 111:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 113:	27                   	daa    
 114:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 117:	11 01                	adc    DWORD PTR [ecx],eax
 119:	12 06                	adc    al,BYTE PTR [esi]
 11b:	40                   	inc    eax
 11c:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 122:	00 00                	add    BYTE PTR [eax],al
 124:	15 34 00 03 08       	adc    eax,0x8030034
 129:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 12b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 12d:	49                   	dec    ecx
 12e:	13 00                	adc    eax,DWORD PTR [eax]
 130:	00 16                	add    BYTE PTR [esi],dl
 132:	34 00                	xor    al,0x0
 134:	03 0e                	add    ecx,DWORD PTR [esi]
 136:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 138:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 13a:	49                   	dec    ecx
 13b:	13 00                	adc    eax,DWORD PTR [eax]
 13d:	00 17                	add    BYTE PTR [edi],dl
 13f:	0b 01                	or     eax,DWORD PTR [ecx]
 141:	11 01                	adc    DWORD PTR [ecx],eax
 143:	12 06                	adc    al,BYTE PTR [esi]
 145:	01 13                	add    DWORD PTR [ebx],edx
 147:	00 00                	add    BYTE PTR [eax],al
 149:	18 34 00             	sbb    BYTE PTR [eax+eax*1],dh
 14c:	03 0e                	add    ecx,DWORD PTR [esi]
 14e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 150:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 152:	49                   	dec    ecx
 153:	13 3f                	adc    edi,DWORD PTR [edi]
 155:	19 02                	sbb    DWORD PTR [edx],eax
 157:	18 00                	sbb    BYTE PTR [eax],al
 159:	00 19                	add    BYTE PTR [ecx],bl
 15b:	15 00 27 19 00       	adc    eax,0x192700
 160:	00 1a                	add    BYTE PTR [edx],bl
 162:	15 01 27 19 01       	adc    eax,0x1192701
 167:	13 00                	adc    eax,DWORD PTR [eax]
 169:	00 1b                	add    BYTE PTR [ebx],bl
 16b:	05 00 49 13 00       	add    eax,0x134900
 170:	00 1c 21             	add    BYTE PTR [ecx+eiz*1],bl
 173:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 176:	2f                   	das    
 177:	05 00 00 1d 34       	add    eax,0x341d0000
 17c:	00 03                	add    BYTE PTR [ebx],al
 17e:	08 3a                	or     BYTE PTR [edx],bh
 180:	0b 3b                	or     edi,DWORD PTR [ebx]
 182:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 185:	3f                   	aas    
 186:	19 02                	sbb    DWORD PTR [edx],eax
 188:	18 00                	sbb    BYTE PTR [eax],al
 18a:	00 00                	add    BYTE PTR [eax],al
 18c:	01 11                	add    DWORD PTR [ecx],edx
 18e:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 194:	0e                   	push   cs
 195:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 197:	11 01                	adc    DWORD PTR [ecx],eax
 199:	12 06                	adc    al,BYTE PTR [esi]
 19b:	10 17                	adc    BYTE PTR [edi],dl
 19d:	00 00                	add    BYTE PTR [eax],al
 19f:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 1a2:	0b 0b                	or     ecx,DWORD PTR [ebx]
 1a4:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 1a7:	0e                   	push   cs
 1a8:	00 00                	add    BYTE PTR [eax],al
 1aa:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 1ad:	0b 0b                	or     ecx,DWORD PTR [ebx]
 1af:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 1b2:	08 00                	or     BYTE PTR [eax],al
 1b4:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 1b7:	00 03                	add    BYTE PTR [ebx],al
 1b9:	0e                   	push   cs
 1ba:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1bc:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1be:	49                   	dec    ecx
 1bf:	13 00                	adc    eax,DWORD PTR [eax]
 1c1:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 1c7:	49                   	dec    ecx
 1c8:	13 00                	adc    eax,DWORD PTR [eax]
 1ca:	00 06                	add    BYTE PTR [esi],al
 1cc:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 1d0:	00 00                	add    BYTE PTR [eax],al
 1d2:	07                   	pop    es
 1d3:	13 01                	adc    eax,DWORD PTR [ecx]
 1d5:	0b 0b                	or     ecx,DWORD PTR [ebx]
 1d7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1d9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1db:	01 13                	add    DWORD PTR [ebx],edx
 1dd:	00 00                	add    BYTE PTR [eax],al
 1df:	08 0d 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,cl
 1e5:	0b 3b                	or     edi,DWORD PTR [ebx]
 1e7:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 1ea:	38 0b                	cmp    BYTE PTR [ebx],cl
 1ec:	00 00                	add    BYTE PTR [eax],al
 1ee:	09 0f                	or     DWORD PTR [edi],ecx
 1f0:	00 0b                	add    BYTE PTR [ebx],cl
 1f2:	0b 00                	or     eax,DWORD PTR [eax]
 1f4:	00 0a                	add    BYTE PTR [edx],cl
 1f6:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 1f9:	19 03                	sbb    DWORD PTR [ebx],eax
 1fb:	0e                   	push   cs
 1fc:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1fe:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 200:	27                   	daa    
 201:	19 11                	sbb    DWORD PTR [ecx],edx
 203:	01 12                	add    DWORD PTR [edx],edx
 205:	06                   	push   es
 206:	40                   	inc    eax
 207:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 20d:	00 00                	add    BYTE PTR [eax],al
 20f:	0b 05 00 03 0e 3a    	or     eax,DWORD PTR ds:0x3a0e0300
 215:	0b 3b                	or     edi,DWORD PTR [ebx]
 217:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 21a:	02 18                	add    bl,BYTE PTR [eax]
 21c:	00 00                	add    BYTE PTR [eax],al
 21e:	0c 34                	or     al,0x34
 220:	00 03                	add    BYTE PTR [ebx],al
 222:	08 3a                	or     BYTE PTR [edx],bh
 224:	0b 3b                	or     edi,DWORD PTR [ebx]
 226:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 229:	02 18                	add    bl,BYTE PTR [eax]
 22b:	00 00                	add    BYTE PTR [eax],al
 22d:	0d 2e 01 3f 19       	or     eax,0x193f012e
 232:	03 0e                	add    ecx,DWORD PTR [esi]
 234:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 236:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 238:	27                   	daa    
 239:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 23c:	11 01                	adc    DWORD PTR [ecx],eax
 23e:	12 06                	adc    al,BYTE PTR [esi]
 240:	40                   	inc    eax
 241:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 247:	00 00                	add    BYTE PTR [eax],al
 249:	0e                   	push   cs
 24a:	34 00                	xor    al,0x0
 24c:	03 0e                	add    ecx,DWORD PTR [esi]
 24e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 250:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 252:	49                   	dec    ecx
 253:	13 02                	adc    eax,DWORD PTR [edx]
 255:	18 00                	sbb    BYTE PTR [eax],al
 257:	00 0f                	add    BYTE PTR [edi],cl
 259:	0b 01                	or     eax,DWORD PTR [ecx]
 25b:	11 01                	adc    DWORD PTR [ecx],eax
 25d:	12 06                	adc    al,BYTE PTR [esi]
 25f:	00 00                	add    BYTE PTR [eax],al
 261:	10 01                	adc    BYTE PTR [ecx],al
 263:	01 49 13             	add    DWORD PTR [ecx+0x13],ecx
 266:	01 13                	add    DWORD PTR [ebx],edx
 268:	00 00                	add    BYTE PTR [eax],al
 26a:	11 21                	adc    DWORD PTR [ecx],esp
 26c:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 26f:	2f                   	das    
 270:	0b 00                	or     eax,DWORD PTR [eax]
 272:	00 12                	add    BYTE PTR [edx],dl
 274:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 277:	19 03                	sbb    DWORD PTR [ebx],eax
 279:	0e                   	push   cs
 27a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 27c:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 282:	11 01                	adc    DWORD PTR [ecx],eax
 284:	12 06                	adc    al,BYTE PTR [esi]
 286:	40                   	inc    eax
 287:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 28d:	00 00                	add    BYTE PTR [eax],al
 28f:	13 05 00 03 0e 3a    	adc    eax,DWORD PTR ds:0x3a0e0300
 295:	0b 3b                	or     edi,DWORD PTR [ebx]
 297:	05 49 13 02 18       	add    eax,0x18021349
 29c:	00 00                	add    BYTE PTR [eax],al
 29e:	14 34                	adc    al,0x34
 2a0:	00 03                	add    BYTE PTR [ebx],al
 2a2:	08 3a                	or     BYTE PTR [edx],bh
 2a4:	0b 3b                	or     edi,DWORD PTR [ebx]
 2a6:	05 49 13 02 18       	add    eax,0x18021349
 2ab:	00 00                	add    BYTE PTR [eax],al
 2ad:	15 2e 01 3f 19       	adc    eax,0x193f012e
 2b2:	03 0e                	add    ecx,DWORD PTR [esi]
 2b4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2b6:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 2bc:	12 06                	adc    al,BYTE PTR [esi]
 2be:	40                   	inc    eax
 2bf:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 2c5:	00 00                	add    BYTE PTR [eax],al
 2c7:	16                   	push   ss
 2c8:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
 2cb:	19 03                	sbb    DWORD PTR [ebx],eax
 2cd:	0e                   	push   cs
 2ce:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2d0:	3b 05 11 01 12 06    	cmp    eax,DWORD PTR ds:0x6120111
 2d6:	40                   	inc    eax
 2d7:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 2dd:	17                   	pop    ss
 2de:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 2e1:	19 03                	sbb    DWORD PTR [ebx],eax
 2e3:	0e                   	push   cs
 2e4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2e6:	3b 05 49 13 3c 19    	cmp    eax,DWORD PTR ds:0x193c1349
 2ec:	00 00                	add    BYTE PTR [eax],al
 2ee:	18 18                	sbb    BYTE PTR [eax],bl
 2f0:	00 00                	add    BYTE PTR [eax],al
 2f2:	00 19                	add    BYTE PTR [ecx],bl
 2f4:	34 00                	xor    al,0x0
 2f6:	03 0e                	add    ecx,DWORD PTR [esi]
 2f8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2fa:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 300:	00 00                	add    BYTE PTR [eax],al
 302:	1a 0a                	sbb    cl,BYTE PTR [edx]
 304:	00 03                	add    BYTE PTR [ebx],al
 306:	0e                   	push   cs
 307:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 309:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 30f:	1b 34 00             	sbb    esi,DWORD PTR [eax+eax*1]
 312:	03 0e                	add    ecx,DWORD PTR [esi]
 314:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 316:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 318:	49                   	dec    ecx
 319:	13 3f                	adc    edi,DWORD PTR [edi]
 31b:	19 02                	sbb    DWORD PTR [edx],eax
 31d:	18 00                	sbb    BYTE PTR [eax],al
 31f:	00 1c 15 00 27 19 00 	add    BYTE PTR [edx*1+0x192700],bl
 326:	00 1d 15 01 27 19    	add    BYTE PTR ds:0x19270115,bl
 32c:	01 13                	add    DWORD PTR [ebx],edx
 32e:	00 00                	add    BYTE PTR [eax],al
 330:	1e                   	push   ds
 331:	05 00 49 13 00       	add    eax,0x134900
 336:	00 1f                	add    BYTE PTR [edi],bl
 338:	21 00                	and    DWORD PTR [eax],eax
 33a:	49                   	dec    ecx
 33b:	13 2f                	adc    ebp,DWORD PTR [edi]
 33d:	05 00 00 20 34       	add    eax,0x34200000
 342:	00 03                	add    BYTE PTR [ebx],al
 344:	08 3a                	or     BYTE PTR [edx],bh
 346:	0b 3b                	or     edi,DWORD PTR [ebx]
 348:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 34b:	3f                   	aas    
 34c:	19 02                	sbb    DWORD PTR [edx],eax
 34e:	18 00                	sbb    BYTE PTR [eax],al
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
  12:	10 03                	adc    BYTE PTR [ebx],al
  14:	76 06                	jbe    1c <cmdClearScreen-0x30fffe4>
	...
  1e:	00 00                	add    BYTE PTR [eax],al
  20:	1c 00                	sbb    al,0x0
  22:	00 00                	add    BYTE PTR [eax],al
  24:	02 00                	add    al,BYTE PTR [eax]
  26:	21 07                	and    DWORD PTR [edi],eax
  28:	00 00                	add    BYTE PTR [eax],al
  2a:	04 00                	add    al,0x0
  2c:	00 00                	add    BYTE PTR [eax],al
  2e:	00 00                	add    BYTE PTR [eax],al
  30:	78 06                	js     38 <cmdClearScreen-0x30fffc8>
  32:	10 03                	adc    BYTE PTR [ebx],al
  34:	c7                   	(bad)  
  35:	0a 00                	or     al,BYTE PTR [eax]
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
   1:	01 00                	add    DWORD PTR [eax],eax
   3:	00 02                	add    BYTE PTR [edx],al
   5:	00 c2                	add    dl,al
   7:	00 00                	add    BYTE PTR [eax],al
   9:	00 01                	add    BYTE PTR [ecx],al
   b:	01 fb                	add    ebx,edi
   d:	0e                   	push   cs
   e:	0d 00 01 01 01       	or     eax,0x1010100
  13:	01 00                	add    DWORD PTR [eax],eax
  15:	00 00                	add    BYTE PTR [eax],al
  17:	01 00                	add    DWORD PTR [eax],eax
  19:	00 01                	add    BYTE PTR [ecx],al
  1b:	73 72                	jae    8f <cmdClearScreen-0x30fff71>
  1d:	63 00                	arpl   WORD PTR [eax],ax
  1f:	2f                   	das    
  20:	68 6f 6d 65 2f       	push   0x2f656d6f
  25:	79 6f                	jns    96 <cmdClearScreen-0x30fff6a>
  27:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
  2e:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
  31:	73 73                	jae    a6 <cmdClearScreen-0x30fff5a>
  33:	2f                   	das    
  34:	6c                   	ins    BYTE PTR es:[edi],dx
  35:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
  3c:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
  42:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
  48:	78 2d                	js     77 <cmdClearScreen-0x30fff89>
  4a:	67 6e                	outs   dx,BYTE PTR ds:[si]
  4c:	75 2f                	jne    7d <cmdClearScreen-0x30fff83>
  4e:	35 2e 33 2e 30       	xor    eax,0x302e332e
  53:	2f                   	das    
  54:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  5b:	00 2e                	add    BYTE PTR [esi],ch
  5d:	2e                   	cs
  5e:	2f                   	das    
  5f:	6c                   	ins    BYTE PTR es:[edi],dx
  60:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  67:	4f                   	dec    edi
  68:	53                   	push   ebx
  69:	2f                   	das    
  6a:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  71:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
  74:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  78:	65 00 00             	add    BYTE PTR gs:[eax],al
  7b:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  7e:	6d                   	ins    DWORD PTR es:[edi],dx
  7f:	61                   	popa   
  80:	6e                   	outs   dx,BYTE PTR ds:[esi]
  81:	64                   	fs
  82:	73 2e                	jae    b2 <cmdClearScreen-0x30fff4e>
  84:	63 00                	arpl   WORD PTR [eax],ax
  86:	01 00                	add    DWORD PTR [eax],eax
  88:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  8b:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
  92:	63 
  93:	2e                   	cs
  94:	68 00 02 00 00       	push   0x200
  99:	74 69                	je     104 <cmdClearScreen-0x30ffefc>
  9b:	6d                   	ins    DWORD PTR es:[edi],dx
  9c:	65                   	gs
  9d:	2e                   	cs
  9e:	68 00 03 00 00       	push   0x300
  a3:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  a7:	6c                   	ins    BYTE PTR es:[edi],dx
  a8:	6c                   	ins    BYTE PTR es:[edi],dx
  a9:	2e                   	cs
  aa:	68 00 04 00 00       	push   0x400
  af:	6d                   	ins    DWORD PTR es:[edi],dx
  b0:	61                   	popa   
  b1:	6c                   	ins    BYTE PTR es:[edi],dx
  b2:	6c                   	ins    BYTE PTR es:[edi],dx
  b3:	6f                   	outs   dx,DWORD PTR ds:[esi]
  b4:	63 2e                	arpl   WORD PTR [esi],bp
  b6:	68 00 03 00 00       	push   0x300
  bb:	6c                   	ins    BYTE PTR es:[edi],dx
  bc:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  c3:	4f                   	dec    edi
  c4:	53                   	push   ebx
  c5:	2e                   	cs
  c6:	68 00 03 00 00       	push   0x300
  cb:	00 00                	add    BYTE PTR [eax],al
  cd:	05 02 00 00 10       	add    eax,0x10000002
  d2:	03 03                	add    eax,DWORD PTR [ebx]
  d4:	0a 01                	or     al,BYTE PTR [ecx]
  d6:	67 f3 3f             	addr16 repz aas 
  d9:	67 92                	addr16 xchg edx,eax
  db:	08 30                	or     BYTE PTR [eax],dh
  dd:	00 02                	add    BYTE PTR [edx],al
  df:	04 02                	add    al,0x2
  e1:	08 e0                	or     al,ah
  e3:	00 02                	add    BYTE PTR [edx],al
  e5:	04 01                	add    al,0x1
  e7:	06                   	push   es
  e8:	4a                   	dec    edx
  e9:	06                   	push   es
  ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
  eb:	3f                   	aas    
  ec:	94                   	xchg   esp,eax
  ed:	02 22                	add    ah,BYTE PTR [edx]
  ef:	14 d7                	adc    al,0xd7
  f1:	08 91 68 f3 5a f3    	or     BYTE PTR [ecx-0xca50c98],dl
  f7:	08 f3                	or     bl,dh
  f9:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
  fc:	21 08                	and    DWORD PTR [eax],ecx
  fe:	83 ad 08 f3 d7 d7 08 	sub    DWORD PTR [ebp-0x28280cf8],0x8
 105:	13 d7                	adc    edx,edi
 107:	f5                   	cmc    
 108:	59                   	pop    ecx
 109:	31 bb 08 68 68 af    	xor    DWORD PTR [ebx-0x509797f8],edi
 10f:	08 3e                	or     BYTE PTR [esi],bh
 111:	08 67 08             	or     BYTE PTR [edi+0x8],ah
 114:	5c                   	pop    esp
 115:	08 30                	or     BYTE PTR [eax],dh
 117:	3f                   	aas    
 118:	08 21                	or     BYTE PTR [ecx],ah
 11a:	4b                   	dec    ebx
 11b:	76 77                	jbe    194 <cmdClearScreen-0x30ffe6c>
 11d:	08 bb 75 78 67 a0    	or     BYTE PTR [ebx-0x5f98878b],bh
 123:	a1 08 77 84 84       	mov    eax,ds:0x84847708
 128:	69 08 ca 68 08 3f    	imul   ecx,DWORD PTR [eax],0x3f0868ca
 12e:	75 08                	jne    138 <cmdClearScreen-0x30ffec8>
 130:	30 67 08             	xor    BYTE PTR [edi+0x8],ah
 133:	77 08                	ja     13d <cmdClearScreen-0x30ffec3>
 135:	3d bb 08 59 92       	cmp    eax,0x925908bb
 13a:	83 08 69             	or     DWORD PTR [eax],0x69
 13d:	08 91 00 02 04 01    	or     BYTE PTR [ecx+0x1040200],dl
 143:	08 69 00             	or     BYTE PTR [ecx+0x0],ch
 146:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 149:	d7                   	xlat   BYTE PTR ds:[ebx]
 14a:	d8 30                	fdiv   DWORD PTR [eax]
 14c:	67 f3 3f             	addr16 repz aas 
 14f:	67 76 75             	addr16 jbe 1c7 <cmdClearScreen-0x30ffe39>
 152:	91                   	xchg   ecx,eax
 153:	08 4c ae 00          	or     BYTE PTR [esi+ebp*4+0x0],cl
 157:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 15a:	91                   	xchg   ecx,eax
 15b:	00 02                	add    BYTE PTR [edx],al
 15d:	04 03                	add    al,0x3
 15f:	f1                   	icebp  
 160:	00 02                	add    BYTE PTR [edx],al
 162:	04 01                	add    al,0x1
 164:	06                   	push   es
 165:	4a                   	dec    edx
 166:	06                   	push   es
 167:	85 3f                	test   DWORD PTR [edi],edi
 169:	67 f3 3f             	addr16 repz aas 
 16c:	93                   	xchg   ebx,eax
 16d:	08 ca                	or     dl,cl
 16f:	08 bd 9f 75 3f 69    	or     BYTE PTR [ebp+0x693f759f],bh
 175:	08 5f 08             	or     BYTE PTR [edi+0x8],bl
 178:	2f                   	das    
 179:	bb 68 02 22 13       	mov    ebx,0x13220268
 17e:	02 2e                	add    ch,BYTE PTR [esi]
 180:	16                   	push   ss
 181:	00 02                	add    BYTE PTR [edx],al
 183:	04 02                	add    al,0x2
 185:	03 78 02             	add    edi,DWORD PTR [eax+0x2]
 188:	2c 01                	sub    al,0x1
 18a:	00 02                	add    BYTE PTR [edx],al
 18c:	04 01                	add    al,0x1
 18e:	06                   	push   es
 18f:	4a                   	dec    edx
 190:	06                   	push   es
 191:	03 0b                	add    ecx,DWORD PTR [ebx]
 193:	9e                   	sahf   
 194:	3f                   	aas    
 195:	67 08 2f             	or     BYTE PTR [bx],ch
 198:	02 24 13             	add    ah,BYTE PTR [ebx+edx*1]
 19b:	d7                   	xlat   BYTE PTR ds:[ebx]
 19c:	3f                   	aas    
 19d:	92                   	xchg   edx,eax
 19e:	08 bc ae 08 24 02 22 	or     BYTE PTR [esi+ebp*4+0x22022408],bh
 1a5:	13 02                	adc    eax,DWORD PTR [edx]
 1a7:	02 00                	add    al,BYTE PTR [eax]
 1a9:	01 01                	add    DWORD PTR [ecx],eax
 1ab:	77 02                	ja     1af <cmdClearScreen-0x30ffe51>
 1ad:	00 00                	add    BYTE PTR [eax],al
 1af:	02 00                	add    al,BYTE PTR [eax]
 1b1:	b6 00                	mov    dh,0x0
 1b3:	00 00                	add    BYTE PTR [eax],al
 1b5:	01 01                	add    DWORD PTR [ecx],eax
 1b7:	fb                   	sti    
 1b8:	0e                   	push   cs
 1b9:	0d 00 01 01 01       	or     eax,0x1010100
 1be:	01 00                	add    DWORD PTR [eax],eax
 1c0:	00 00                	add    BYTE PTR [eax],al
 1c2:	01 00                	add    DWORD PTR [eax],eax
 1c4:	00 01                	add    BYTE PTR [ecx],al
 1c6:	73 72                	jae    23a <cmdClearScreen-0x30ffdc6>
 1c8:	63 00                	arpl   WORD PTR [eax],ax
 1ca:	2f                   	das    
 1cb:	68 6f 6d 65 2f       	push   0x2f656d6f
 1d0:	79 6f                	jns    241 <cmdClearScreen-0x30ffdbf>
 1d2:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
 1d9:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 1dc:	73 73                	jae    251 <cmdClearScreen-0x30ffdaf>
 1de:	2f                   	das    
 1df:	6c                   	ins    BYTE PTR es:[edi],dx
 1e0:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
 1e7:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
 1ed:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
 1f3:	78 2d                	js     222 <cmdClearScreen-0x30ffdde>
 1f5:	67 6e                	outs   dx,BYTE PTR ds:[si]
 1f7:	75 2f                	jne    228 <cmdClearScreen-0x30ffdd8>
 1f9:	35 2e 33 2e 30       	xor    eax,0x302e332e
 1fe:	2f                   	das    
 1ff:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 206:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 209:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 20d:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 210:	2e                   	cs
 211:	2f                   	das    
 212:	6c                   	ins    BYTE PTR es:[edi],dx
 213:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 21a:	4f                   	dec    edi
 21b:	53                   	push   ebx
 21c:	2f                   	das    
 21d:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 224:	00 00                	add    BYTE PTR [eax],al
 226:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 22a:	6c                   	ins    BYTE PTR es:[edi],dx
 22b:	6c                   	ins    BYTE PTR es:[edi],dx
 22c:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 22f:	01 00                	add    DWORD PTR [eax],eax
 231:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 234:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
 23b:	63 
 23c:	2e                   	cs
 23d:	68 00 02 00 00       	push   0x200
 242:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 246:	6c                   	ins    BYTE PTR es:[edi],dx
 247:	6c                   	ins    BYTE PTR es:[edi],dx
 248:	2e                   	cs
 249:	68 00 03 00 00       	push   0x300
 24e:	6d                   	ins    DWORD PTR es:[edi],dx
 24f:	61                   	popa   
 250:	6c                   	ins    BYTE PTR es:[edi],dx
 251:	6c                   	ins    BYTE PTR es:[edi],dx
 252:	6f                   	outs   dx,DWORD PTR ds:[esi]
 253:	63 2e                	arpl   WORD PTR [esi],bp
 255:	68 00 04 00 00       	push   0x400
 25a:	6c                   	ins    BYTE PTR es:[edi],dx
 25b:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 262:	4f                   	dec    edi
 263:	53                   	push   ebx
 264:	2e                   	cs
 265:	68 00 04 00 00       	push   0x400
 26a:	00 00                	add    BYTE PTR [eax],al
 26c:	05 02 78 06 10       	add    eax,0x10067802
 271:	03 03                	add    eax,DWORD PTR [ebx]
 273:	18 01                	sbb    BYTE PTR [ecx],al
 275:	75 08                	jne    27f <cmdClearScreen-0x30ffd81>
 277:	14 68                	adc    al,0x68
 279:	4c                   	dec    esp
 27a:	08 21                	or     BYTE PTR [ecx],ah
 27c:	08 21                	or     BYTE PTR [ecx],ah
 27e:	08 13                	or     BYTE PTR [ebx],dl
 280:	03 0b                	add    ecx,DWORD PTR [ebx]
 282:	74 03                	je     287 <cmdClearScreen-0x30ffd79>
 284:	78 2e                	js     2b4 <cmdClearScreen-0x30ffd4c>
 286:	02 30                	add    dh,BYTE PTR [eax]
 288:	1a 2c d8             	sbb    ch,BYTE PTR [eax+ebx*8]
 28b:	69 75 d7 d7 4c 08 3e 	imul   esi,DWORD PTR [ebp-0x29],0x3e084cd7
 292:	bc e6 ae 94 08       	mov    esp,0x894aee6
 297:	4b                   	dec    ebx
 298:	e5 93                	in     eax,0x93
 29a:	00 02                	add    BYTE PTR [edx],al
 29c:	04 02                	add    al,0x2
 29e:	06                   	push   es
 29f:	e4 00                	in     al,0x0
 2a1:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
 2a4:	e4 00                	in     al,0x0
 2a6:	02 04 05 e4 06 af 00 	add    al,BYTE PTR [eax*1+0xaf06e4]
 2ad:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 2b0:	06                   	push   es
 2b1:	e4 06                	in     al,0x6
 2b3:	e5 02                	in     eax,0x2
 2b5:	25 13 08 4b 67       	and    eax,0x674b0813
 2ba:	e3 34                	jecxz  2f0 <cmdClearScreen-0x30ffd10>
 2bc:	00 02                	add    BYTE PTR [edx],al
 2be:	04 02                	add    al,0x2
 2c0:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 2c6:	02 03                	add    al,BYTE PTR [ebx]
 2c8:	63 4a 00             	arpl   WORD PTR [edx+0x0],cx
 2cb:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 2ce:	06                   	push   es
 2cf:	4a                   	dec    edx
 2d0:	06                   	push   es
 2d1:	03 1f                	add    ebx,DWORD PTR [edi]
 2d3:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 2d6:	4b                   	dec    ebx
 2d7:	08 4f 3d             	or     BYTE PTR [edi+0x3d],cl
 2da:	5b                   	pop    ebx
 2db:	6a 92                	push   0xffffff92
 2dd:	02 3b                	add    bh,BYTE PTR [ebx]
 2df:	14 69                	adc    al,0x69
 2e1:	00 02                	add    BYTE PTR [edx],al
 2e3:	04 02                	add    al,0x2
 2e5:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 2e8:	00 02                	add    BYTE PTR [edx],al
 2ea:	04 01                	add    al,0x1
 2ec:	06                   	push   es
 2ed:	4a                   	dec    edx
 2ee:	06                   	push   es
 2ef:	03 0b                	add    ecx,DWORD PTR [ebx]
 2f1:	66 59                	pop    cx
 2f3:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 2f6:	75 75                	jne    36d <cmdClearScreen-0x30ffc93>
 2f8:	75 75                	jne    36f <cmdClearScreen-0x30ffc91>
 2fa:	78 a1                	js     29d <cmdClearScreen-0x30ffd63>
 2fc:	08 ec                	or     ah,ch
 2fe:	00 02                	add    BYTE PTR [edx],al
 300:	04 01                	add    al,0x1
 302:	06                   	push   es
 303:	66 06                	pushw  es
 305:	af                   	scas   eax,DWORD PTR es:[edi]
 306:	68 75 08 4c 67       	push   0x674c0875
 30b:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 30e:	5a                   	pop    edx
 30f:	00 02                	add    BYTE PTR [edx],al
 311:	04 01                	add    al,0x1
 313:	06                   	push   es
 314:	9e                   	sahf   
 315:	00 02                	add    BYTE PTR [edx],al
 317:	04 02                	add    al,0x2
 319:	66                   	data16
 31a:	00 02                	add    BYTE PTR [edx],al
 31c:	04 03                	add    al,0x3
 31e:	66 06                	pushw  es
 320:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 321:	68 75 08 5a a0       	push   0xa05a0875
 326:	bc 68 a0 94 08       	mov    esp,0x894a068
 32b:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 32e:	94                   	xchg   esp,eax
 32f:	08 33                	or     BYTE PTR [ebx],dh
 331:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 336:	16                   	push   ss
 337:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 33a:	03 3a                	add    edi,DWORD PTR [edx]
 33c:	d6                   	(bad)  
 33d:	68 d8 08 e7 08       	push   0x8e708d8
 342:	13 d7                	adc    edx,edi
 344:	08 e5                	or     ch,ah
 346:	08 3e                	or     BYTE PTR [esi],bh
 348:	4b                   	dec    ebx
 349:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 34c:	d9 d9                	(bad)  
 34e:	d7                   	xlat   BYTE PTR ds:[ebx]
 34f:	d7                   	xlat   BYTE PTR ds:[ebx]
 350:	3d 31 75 00 02       	cmp    eax,0x2007531
 355:	04 03                	add    al,0x3
 357:	92                   	xchg   edx,eax
 358:	00 02                	add    BYTE PTR [edx],al
 35a:	04 03                	add    al,0x3
 35c:	02 22                	add    ah,BYTE PTR [edx]
 35e:	13 00                	adc    eax,DWORD PTR [eax]
 360:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 363:	02 30                	add    dh,BYTE PTR [eax]
 365:	0f 00 02             	sldt   WORD PTR [edx]
 368:	04 01                	add    al,0x1
 36a:	06                   	push   es
 36b:	4a                   	dec    edx
 36c:	06                   	push   es
 36d:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 373:	04 03                	add    al,0x3
 375:	91                   	xchg   ecx,eax
 376:	00 02                	add    BYTE PTR [edx],al
 378:	04 03                	add    al,0x3
 37a:	ff 00                	inc    DWORD PTR [eax]
 37c:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 37f:	06                   	push   es
 380:	4a                   	dec    edx
 381:	06                   	push   es
 382:	84 d7                	test   bh,dl
 384:	3f                   	aas    
 385:	68 92 08 30 08       	push   0x8300892
 38a:	f3 68 08 5a 08 4c    	repz push 0x4c085a08
 390:	00 02                	add    BYTE PTR [edx],al
 392:	04 02                	add    al,0x2
 394:	03 75 74             	add    esi,DWORD PTR [ebp+0x74]
 397:	00 02                	add    BYTE PTR [edx],al
 399:	04 01                	add    al,0x1
 39b:	06                   	push   es
 39c:	4a                   	dec    edx
 39d:	06                   	push   es
 39e:	03 0f                	add    ecx,DWORD PTR [edi]
 3a0:	66 59                	pop    cx
 3a2:	03 0d 2e 67 02 25    	add    ecx,DWORD PTR ds:0x2502672e
 3a8:	13 3f                	adc    edi,DWORD PTR [edi]
 3aa:	67 08 91 3f 67       	or     BYTE PTR [bx+di+0x673f],dl
 3af:	59                   	pop    ecx
 3b0:	59                   	pop    ecx
 3b1:	08 30                	or     BYTE PTR [eax],dh
 3b3:	40                   	inc    eax
 3b4:	92                   	xchg   edx,eax
 3b5:	75 75                	jne    42c <cmdClearScreen-0x30ffbd4>
 3b7:	77 9f                	ja     358 <cmdClearScreen-0x30ffca8>
 3b9:	75 08                	jne    3c3 <cmdClearScreen-0x30ffc3d>
 3bb:	4b                   	dec    ebx
 3bc:	83 75 08 4b          	xor    DWORD PTR [ebp+0x8],0x4b
 3c0:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 3c3:	5b                   	pop    ebx
 3c4:	5b                   	pop    ebx
 3c5:	9f                   	lahf   
 3c6:	75 75                	jne    43d <cmdClearScreen-0x30ffbc3>
 3c8:	75 08                	jne    3d2 <cmdClearScreen-0x30ffc2e>
 3ca:	83 08 4b             	or     DWORD PTR [eax],0x4b
 3cd:	5a                   	pop    edx
 3ce:	75 30                	jne    400 <cmdClearScreen-0x30ffc00>
 3d0:	08 56 b1             	or     BYTE PTR [esi-0x4f],dl
 3d3:	e6 93                	out    0x93,al
 3d5:	bc 02 2d 13 83       	mov    esp,0x83132d02
 3da:	30 f3                	xor    bl,dh
 3dc:	47                   	inc    edi
 3dd:	6b 08 67             	imul   ecx,DWORD PTR [eax],0x67
 3e0:	08 4c 5d e6          	or     BYTE PTR [ebp+ebx*2-0x1a],cl
 3e4:	cb                   	retf   
 3e5:	08 4c 02 2d          	or     BYTE PTR [edx+eax*1+0x2d],cl
 3e9:	13 83 30 f3 47 6b    	adc    eax,DWORD PTR [ebx+0x6b47f330]
 3ef:	08 67 08             	or     BYTE PTR [edi+0x8],ah
 3f2:	4c                   	dec    esp
 3f3:	5d                   	pop    ebp
 3f4:	ae                   	scas   al,BYTE PTR es:[edi]
 3f5:	a0 f5 5a ae 08       	mov    al,ds:0x8ae5af5
 3fa:	4c                   	dec    esp
 3fb:	ae                   	scas   al,BYTE PTR es:[edi]
 3fc:	d8 4b d7             	fmul   DWORD PTR [ebx-0x29]
 3ff:	08 4d ae             	or     BYTE PTR [ebp-0x52],cl
 402:	f3 03 0d 20 03 77 f2 	repz add ecx,DWORD PTR ds:0xf2770320
 409:	08 68 08             	or     BYTE PTR [eax+0x8],ch
 40c:	a0 76 5d 67 08       	mov    al,ds:0x8675d76
 411:	21 08                	and    DWORD PTR [eax],ecx
 413:	4b                   	dec    ebx
 414:	03 98 7f 08 20 03    	add    ebx,DWORD PTR [eax+0x320087f]
 41a:	ea 00 08 20 08 13 59 	jmp    0x5913:0x8200800
 421:	02 02                	add    al,BYTE PTR [edx]
 423:	00 01                	add    BYTE PTR [ecx],al
 425:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	65 6e                	outs   dx,BYTE PTR gs:[esi]
   2:	76 69                	jbe    6d <cmdClearScreen-0x30fff93>
   4:	72 6f                	jb     75 <cmdClearScreen-0x30fff8b>
   6:	6e                   	outs   dx,BYTE PTR ds:[esi]
   7:	6d                   	ins    DWORD PTR es:[edi],dx
   8:	65 6e                	outs   dx,BYTE PTR gs:[esi]
   a:	74 4c                	je     58 <cmdClearScreen-0x30fffa8>
   c:	6f                   	outs   dx,DWORD PTR ds:[esi]
   d:	63 00                	arpl   WORD PTR [eax],ax
   f:	76 61                	jbe    72 <cmdClearScreen-0x30fff8e>
  11:	72 56                	jb     69 <cmdClearScreen-0x30fff97>
  13:	61                   	popa   
  14:	6c                   	ins    BYTE PTR es:[edi],dx
  15:	75 65                	jne    7c <cmdClearScreen-0x30fff84>
  17:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
  1a:	65 63 50 61          	arpl   WORD PTR gs:[eax+0x61],dx
  1e:	72 61                	jb     81 <cmdClearScreen-0x30fff7f>
  20:	6d                   	ins    DWORD PTR es:[edi],dx
  21:	43                   	inc    ebx
  22:	6f                   	outs   dx,DWORD PTR ds:[esi]
  23:	75 6e                	jne    93 <cmdClearScreen-0x30fff6d>
  25:	74 00                	je     27 <cmdClearScreen-0x30fffd9>
  27:	6e                   	outs   dx,BYTE PTR ds:[esi]
  28:	61                   	popa   
  29:	6d                   	ins    DWORD PTR es:[edi],dx
  2a:	65                   	gs
  2b:	4c                   	dec    esp
  2c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
  2e:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  31:	64                   	fs
  32:	45                   	inc    ebp
  33:	78 69                	js     9e <cmdClearScreen-0x30fff62>
  35:	74 00                	je     37 <cmdClearScreen-0x30fffc9>
  37:	2f                   	das    
  38:	68 6f 6d 65 2f       	push   0x2f656d6f
  3d:	79 6f                	jns    ae <cmdClearScreen-0x30fff52>
  3f:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  46:	6f                   	outs   dx,DWORD PTR ds:[esi]
  47:	73 2f                	jae    78 <cmdClearScreen-0x30fff88>
  49:	61                   	popa   
  4a:	70 72                	jo     be <cmdClearScreen-0x30fff42>
  4c:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4d:	6a 2f                	push   0x2f
  4f:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  53:	6c                   	ins    BYTE PTR es:[edi],dx
  54:	6c                   	ins    BYTE PTR es:[edi],dx
  55:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
  59:	7a 6f                	jp     ca <cmdClearScreen-0x30fff36>
  5b:	6e                   	outs   dx,BYTE PTR ds:[esi]
  5c:	65 00 63 6d          	add    BYTE PTR gs:[ebx+0x6d],ah
  60:	64                   	fs
  61:	50                   	push   eax
  62:	72 69                	jb     cd <cmdClearScreen-0x30fff33>
  64:	6e                   	outs   dx,BYTE PTR ds:[esi]
  65:	74 45                	je     ac <cmdClearScreen-0x30fff54>
  67:	6e                   	outs   dx,BYTE PTR ds:[esi]
  68:	76 00                	jbe    6a <cmdClearScreen-0x30fff96>
  6a:	68 65 61 70 45       	push   0x45706165
  6f:	6e                   	outs   dx,BYTE PTR ds:[esi]
  70:	64 00 64 65 73       	add    BYTE PTR fs:[ebp+eiz*2+0x73],ah
  75:	63 72 69             	arpl   WORD PTR [edx+0x69],si
  78:	70 74                	jo     ee <cmdClearScreen-0x30fff12>
  7a:	69 6f 6e 00 73 68 6f 	imul   ebp,DWORD PTR [edi+0x6e],0x6f687300
  81:	72 74                	jb     f7 <cmdClearScreen-0x30fff09>
  83:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
  86:	74 00                	je     88 <cmdClearScreen-0x30fff78>
  88:	73 69                	jae    f3 <cmdClearScreen-0x30fff0d>
  8a:	7a 65                	jp     f1 <cmdClearScreen-0x30fff0f>
  8c:	74 79                	je     107 <cmdClearScreen-0x30ffef9>
  8e:	70 65                	jo     f5 <cmdClearScreen-0x30fff0b>
  90:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
  93:	64                   	fs
  94:	54                   	push   esp
  95:	69 63 6b 73 00 63 6d 	imul   esp,DWORD PTR [ebx+0x6b],0x6d630073
  9c:	64                   	fs
  9d:	6c                   	ins    BYTE PTR es:[edi],dx
  9e:	69 6e 65 00 47 4e 55 	imul   ebp,DWORD PTR [esi+0x65],0x554e4700
  a5:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  a8:	39 20                	cmp    DWORD PTR [eax],esp
  aa:	35 2e 33 2e 30       	xor    eax,0x302e332e
  af:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
  b5:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  ba:	6c                   	ins    BYTE PTR es:[edi],dx
  bb:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  c1:	65                   	gs
  c2:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  c7:	72 69                	jb     132 <cmdClearScreen-0x30ffece>
  c9:	63 20                	arpl   WORD PTR [eax],sp
  cb:	2d 6d 61 72 63       	sub    eax,0x6372616d
  d0:	68 3d 70 65 6e       	push   0x6e65703d
  d5:	74 69                	je     140 <cmdClearScreen-0x30ffec0>
  d7:	75 6d                	jne    146 <cmdClearScreen-0x30ffeba>
  d9:	70 72                	jo     14d <cmdClearScreen-0x30ffeb3>
  db:	6f                   	outs   dx,DWORD PTR ds:[esi]
  dc:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  e2:	74 64                	je     148 <cmdClearScreen-0x30ffeb8>
  e4:	3d 63 39 39 20       	cmp    eax,0x20393963
  e9:	2d 66 66 72 65       	sub    eax,0x65726666
  ee:	65                   	gs
  ef:	73 74                	jae    165 <cmdClearScreen-0x30ffe9b>
  f1:	61                   	popa   
  f2:	6e                   	outs   dx,BYTE PTR ds:[esi]
  f3:	64 69 6e 67 00 74 6d 	imul   ebp,DWORD PTR fs:[esi+0x67],0x5f6d7400
  fa:	5f 
  fb:	67 6d                	ins    DWORD PTR es:[di],dx
  fd:	74 6f                	je     16e <cmdClearScreen-0x30ffe92>
  ff:	66                   	data16
 100:	66                   	data16
 101:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 104:	64                   	fs
 105:	50                   	push   eax
 106:	77 64                	ja     16c <cmdClearScreen-0x30ffe94>
 108:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 10b:	6d                   	ins    DWORD PTR es:[edi],dx
 10c:	6d                   	ins    DWORD PTR es:[edi],dx
 10d:	61                   	popa   
 10e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 10f:	64                   	fs
 110:	5f                   	pop    edi
 111:	66                   	data16
 112:	75 6e                	jne    182 <cmdClearScreen-0x30ffe7e>
 114:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 118:	6e                   	outs   dx,BYTE PTR ds:[esi]
 119:	5f                   	pop    edi
 11a:	70 00                	jo     11c <cmdClearScreen-0x30ffee4>
 11c:	73 74                	jae    192 <cmdClearScreen-0x30ffe6e>
 11e:	61                   	popa   
 11f:	72 74                	jb     195 <cmdClearScreen-0x30ffe6b>
 121:	54                   	push   esp
 122:	69 63 6b 73 00 6b 65 	imul   esp,DWORD PTR [ebx+0x6b],0x656b0073
 129:	78 65                	js     190 <cmdClearScreen-0x30ffe70>
 12b:	63 00                	arpl   WORD PTR [eax],ax
 12d:	64                   	fs
 12e:	65                   	gs
 12f:	6c                   	ins    BYTE PTR es:[edi],dx
 130:	69 6d 00 75 69 6e 74 	imul   ebp,DWORD PTR [ebp+0x0],0x746e6975
 137:	70 74                	jo     1ad <cmdClearScreen-0x30ffe53>
 139:	72 5f                	jb     19a <cmdClearScreen-0x30ffe66>
 13b:	74 00                	je     13d <cmdClearScreen-0x30ffec3>
 13d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 140:	6d                   	ins    DWORD PTR es:[edi],dx
 141:	61                   	popa   
 142:	6e                   	outs   dx,BYTE PTR ds:[esi]
 143:	64                   	fs
 144:	5f                   	pop    edi
 145:	66                   	data16
 146:	75 6e                	jne    1b6 <cmdClearScreen-0x30ffe4a>
 148:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 14c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 14d:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 150:	64                   	fs
 151:	43                   	inc    ebx
 152:	6c                   	ins    BYTE PTR es:[edi],dx
 153:	65                   	gs
 154:	61                   	popa   
 155:	72 53                	jb     1aa <cmdClearScreen-0x30ffe56>
 157:	63 72 65             	arpl   WORD PTR [edx+0x65],si
 15a:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 15c:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 160:	68 6f 75 72 00       	push   0x72756f
 165:	70 61                	jo     1c8 <cmdClearScreen-0x30ffe38>
 167:	72 61                	jb     1ca <cmdClearScreen-0x30ffe36>
 169:	6d                   	ins    DWORD PTR es:[edi],dx
 16a:	43                   	inc    ebx
 16b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 16c:	75 6e                	jne    1dc <cmdClearScreen-0x30ffe24>
 16e:	74 00                	je     170 <cmdClearScreen-0x30ffe90>
 170:	74 6d                	je     1df <cmdClearScreen-0x30ffe21>
 172:	5f                   	pop    edi
 173:	6d                   	ins    DWORD PTR es:[edi],dx
 174:	6f                   	outs   dx,DWORD PTR ds:[esi]
 175:	6e                   	outs   dx,BYTE PTR ds:[esi]
 176:	00 6c 6f 6e          	add    BYTE PTR [edi+ebp*2+0x6e],ch
 17a:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 17e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 17f:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 183:	74 00                	je     185 <cmdClearScreen-0x30ffe7b>
 185:	76 61                	jbe    1e8 <cmdClearScreen-0x30ffe18>
 187:	72 4e                	jb     1d7 <cmdClearScreen-0x30ffe29>
 189:	61                   	popa   
 18a:	6d                   	ins    DWORD PTR es:[edi],dx
 18b:	65 00 74 69 6d       	add    BYTE PTR gs:[ecx+ebp*2+0x6d],dh
 190:	65                   	gs
 191:	49                   	dec    ecx
 192:	74 00                	je     194 <cmdClearScreen-0x30ffe6c>
 194:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 197:	53                   	push   ebx
 198:	6c                   	ins    BYTE PTR es:[edi],dx
 199:	65                   	gs
 19a:	65                   	gs
 19b:	70 00                	jo     19d <cmdClearScreen-0x30ffe63>
 19d:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
 1a0:	6c                   	ins    BYTE PTR es:[edi],dx
 1a1:	64                   	fs
 1a2:	50                   	push   eax
 1a3:	69 64 00 6c 61 73 74 	imul   esp,DWORD PTR [eax+eax*1+0x6c],0x45747361
 1aa:	45 
 1ab:	78 65                	js     212 <cmdClearScreen-0x30ffdee>
 1ad:	63 45 78             	arpl   WORD PTR [ebp+0x78],ax
 1b0:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x68006564
 1b7:	68 
 1b8:	65                   	gs
 1b9:	61                   	popa   
 1ba:	70 43                	jo     1ff <cmdClearScreen-0x30ffe01>
 1bc:	75 72                	jne    230 <cmdClearScreen-0x30ffdd0>
 1be:	72 00                	jb     1c0 <cmdClearScreen-0x30ffe40>
 1c0:	73 45                	jae    207 <cmdClearScreen-0x30ffdf9>
 1c2:	78 65                	js     229 <cmdClearScreen-0x30ffdd7>
 1c4:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 1c7:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 1ce:	72 61                	jb     231 <cmdClearScreen-0x30ffdcf>
 1d0:	6d                   	ins    DWORD PTR es:[edi],dx
 1d1:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 1d4:	77 43                	ja     219 <cmdClearScreen-0x30ffde7>
 1d6:	6d                   	ins    DWORD PTR es:[edi],dx
 1d7:	64                   	fs
 1d8:	4c                   	dec    esp
 1d9:	69 6e 65 00 63 6d 64 	imul   ebp,DWORD PTR [esi+0x65],0x646d6300
 1e0:	52                   	push   edx
 1e1:	65                   	gs
 1e2:	70 65                	jo     249 <cmdClearScreen-0x30ffdb7>
 1e4:	61                   	popa   
 1e5:	74 00                	je     1e7 <cmdClearScreen-0x30ffe19>
 1e7:	70 61                	jo     24a <cmdClearScreen-0x30ffdb6>
 1e9:	72 61                	jb     24c <cmdClearScreen-0x30ffdb4>
 1eb:	6d                   	ins    DWORD PTR es:[edi],dx
 1ec:	73 00                	jae    1ee <cmdClearScreen-0x30ffe12>
 1ee:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1ef:	61                   	popa   
 1f0:	6d                   	ins    DWORD PTR es:[edi],dx
 1f1:	65 00 66 6f          	add    BYTE PTR gs:[esi+0x6f],ah
 1f5:	72 6b                	jb     262 <cmdClearScreen-0x30ffd9e>
 1f7:	50                   	push   eax
 1f8:	69 64 00 74 6d 5f 77 	imul   esp,DWORD PTR [eax+eax*1+0x74],0x64775f6d
 1ff:	64 
 200:	61                   	popa   
 201:	79 00                	jns    203 <cmdClearScreen-0x30ffdfd>
 203:	75 6e                	jne    273 <cmdClearScreen-0x30ffd8d>
 205:	73 69                	jae    270 <cmdClearScreen-0x30ffd90>
 207:	67 6e                	outs   dx,BYTE PTR ds:[si]
 209:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 20e:	61                   	popa   
 20f:	72 00                	jb     211 <cmdClearScreen-0x30ffdef>
 211:	74 6d                	je     280 <cmdClearScreen-0x30ffd80>
 213:	5f                   	pop    edi
 214:	79 65                	jns    27b <cmdClearScreen-0x30ffd85>
 216:	61                   	popa   
 217:	72 00                	jb     219 <cmdClearScreen-0x30ffde7>
 219:	6c                   	ins    BYTE PTR es:[edi],dx
 21a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 21b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 21c:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 220:	6e                   	outs   dx,BYTE PTR ds:[esi]
 221:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 225:	73 69                	jae    290 <cmdClearScreen-0x30ffd70>
 227:	67 6e                	outs   dx,BYTE PTR ds:[si]
 229:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 22e:	74 00                	je     230 <cmdClearScreen-0x30ffdd0>
 230:	75 69                	jne    29b <cmdClearScreen-0x30ffd65>
 232:	6e                   	outs   dx,BYTE PTR ds:[esi]
 233:	74 33                	je     268 <cmdClearScreen-0x30ffd98>
 235:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 238:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 23c:	6d                   	ins    DWORD PTR es:[edi],dx
 23d:	64                   	fs
 23e:	61                   	popa   
 23f:	79 00                	jns    241 <cmdClearScreen-0x30ffdbf>
 241:	70 72                	jo     2b5 <cmdClearScreen-0x30ffd4b>
 243:	6f                   	outs   dx,DWORD PTR ds:[esi]
 244:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 247:	73 45                	jae    28e <cmdClearScreen-0x30ffd72>
 249:	6e                   	outs   dx,BYTE PTR ds:[esi]
 24a:	76 70                	jbe    2bc <cmdClearScreen-0x30ffd44>
 24c:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 24f:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x70006564
 256:	70 
 257:	63 6f 75             	arpl   WORD PTR [edi+0x75],bp
 25a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 25b:	74 00                	je     25d <cmdClearScreen-0x30ffda3>
 25d:	73 68                	jae    2c7 <cmdClearScreen-0x30ffd39>
 25f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 260:	72 74                	jb     2d6 <cmdClearScreen-0x30ffd2a>
 262:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 265:	73 69                	jae    2d0 <cmdClearScreen-0x30ffd30>
 267:	67 6e                	outs   dx,BYTE PTR ds:[si]
 269:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 26e:	74 00                	je     270 <cmdClearScreen-0x30ffd90>
 270:	65                   	gs
 271:	78 65                	js     2d8 <cmdClearScreen-0x30ffd28>
 273:	63 54 69 6d          	arpl   WORD PTR [ecx+ebp*2+0x6d],dx
 277:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 27b:	63 2f                	arpl   WORD PTR [edi],bp
 27d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 280:	6d                   	ins    DWORD PTR es:[edi],dx
 281:	61                   	popa   
 282:	6e                   	outs   dx,BYTE PTR ds:[esi]
 283:	64                   	fs
 284:	73 2e                	jae    2b4 <cmdClearScreen-0x30ffd4c>
 286:	63 00                	arpl   WORD PTR [eax],ax
 288:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 28b:	54                   	push   esp
 28c:	69 6d 65 00 74 6d 5f 	imul   ebp,DWORD PTR [ebp+0x65],0x5f6d7400
 293:	79 64                	jns    2f9 <cmdClearScreen-0x30ffd07>
 295:	61                   	popa   
 296:	79 00                	jns    298 <cmdClearScreen-0x30ffd68>
 298:	5f                   	pop    edi
 299:	42                   	inc    edx
 29a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 29b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 29c:	6c                   	ins    BYTE PTR es:[edi],dx
 29d:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 2a1:	6d                   	ins    DWORD PTR es:[edi],dx
 2a2:	69 6e 00 74 6d 5f 69 	imul   ebp,DWORD PTR [esi+0x0],0x695f6d74
 2a9:	73 64                	jae    30f <cmdClearScreen-0x30ffcf1>
 2ab:	73 74                	jae    321 <cmdClearScreen-0x30ffcdf>
 2ad:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 2b0:	64                   	fs
 2b1:	54                   	push   esp
 2b2:	69 6d 65 00 63 6d 64 	imul   ebp,DWORD PTR [ebp+0x65],0x646d6300
 2b9:	53                   	push   ebx
 2ba:	65                   	gs
 2bb:	74 45                	je     302 <cmdClearScreen-0x30ffcfe>
 2bd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2be:	76 00                	jbe    2c0 <cmdClearScreen-0x30ffd40>
 2c0:	73 74                	jae    336 <cmdClearScreen-0x30ffcca>
 2c2:	61                   	popa   
 2c3:	72 74                	jb     339 <cmdClearScreen-0x30ffcc7>
 2c5:	54                   	push   esp
 2c6:	69 6d 65 00 63 6d 64 	imul   ebp,DWORD PTR [ebp+0x65],0x646d6300
 2cd:	48                   	dec    eax
 2ce:	65                   	gs
 2cf:	6c                   	ins    BYTE PTR es:[edi],dx
 2d0:	70 00                	jo     2d2 <cmdClearScreen-0x30ffd2e>
 2d2:	66 6f                	outs   dx,WORD PTR ds:[esi]
 2d4:	75 6e                	jne    344 <cmdClearScreen-0x30ffcbc>
 2d6:	64 00 74 69 6d       	add    BYTE PTR fs:[ecx+ebp*2+0x6d],dh
 2db:	65                   	gs
 2dc:	54                   	push   esp
 2dd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2de:	45                   	inc    ebp
 2df:	78 69                	js     34a <cmdClearScreen-0x30ffcb6>
 2e1:	74 00                	je     2e3 <cmdClearScreen-0x30ffd1d>
 2e3:	68 65 61 70 42       	push   0x42706165
 2e8:	61                   	popa   
 2e9:	73 65                	jae    350 <cmdClearScreen-0x30ffcb0>
 2eb:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 2ee:	74 68                	je     358 <cmdClearScreen-0x30ffca8>
 2f0:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 2f3:	64                   	fs
 2f4:	73 00                	jae    2f6 <cmdClearScreen-0x30ffd0a>
 2f6:	6c                   	ins    BYTE PTR es:[edi],dx
 2f7:	69 62 63 54 5a 00 72 	imul   esp,DWORD PTR [edx+0x63],0x72005a54
 2fe:	65                   	gs
 2ff:	74 56                	je     357 <cmdClearScreen-0x30ffca9>
 301:	61                   	popa   
 302:	6c                   	ins    BYTE PTR es:[edi],dx
 303:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 307:	73 65                	jae    36e <cmdClearScreen-0x30ffc92>
 309:	63 00                	arpl   WORD PTR [eax],ax
 30b:	62 61 63             	bound  esp,QWORD PTR [ecx+0x63]
 30e:	6b 67 72 6f          	imul   esp,DWORD PTR [edi+0x72],0x6f
 312:	75 6e                	jne    382 <cmdClearScreen-0x30ffc7e>
 314:	64 00 76 61          	add    BYTE PTR fs:[esi+0x61],dh
 318:	6c                   	ins    BYTE PTR es:[edi],dx
 319:	75 65                	jne    380 <cmdClearScreen-0x30ffc80>
 31b:	4c                   	dec    esp
 31c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31e:	00 73 4b             	add    BYTE PTR [ebx+0x4b],dh
 321:	53                   	push   ebx
 322:	68 65 6c 6c 50       	push   0x506c6c65
 327:	72 6f                	jb     398 <cmdClearScreen-0x30ffc68>
 329:	67 72 61             	addr16 jb 38d <cmdClearScreen-0x30ffc73>
 32c:	6d                   	ins    DWORD PTR es:[edi],dx
 32d:	4e                   	dec    esi
 32e:	61                   	popa   
 32f:	6d                   	ins    DWORD PTR es:[edi],dx
 330:	65 00 63 6d          	add    BYTE PTR gs:[ebx+0x6d],ah
 334:	64                   	fs
 335:	45                   	inc    ebp
 336:	78 65                	js     39d <cmdClearScreen-0x30ffc63>
 338:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 33b:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 33e:	6d                   	ins    DWORD PTR es:[edi],dx
 33f:	61                   	popa   
 340:	6e                   	outs   dx,BYTE PTR ds:[esi]
 341:	64                   	fs
 342:	5f                   	pop    edi
 343:	74 61                	je     3a6 <cmdClearScreen-0x30ffc5a>
 345:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 349:	74 00                	je     34b <cmdClearScreen-0x30ffcb5>
 34b:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 34d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 34e:	65                   	gs
 34f:	47                   	inc    edi
 350:	65                   	gs
 351:	74 74                	je     3c7 <cmdClearScreen-0x30ffc39>
 353:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
 35a:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 35d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 35e:	6d                   	ins    DWORD PTR es:[edi],dx
 35f:	70 74                	jo     3d5 <cmdClearScreen-0x30ffc2b>
 361:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 364:	76 70                	jbe    3d6 <cmdClearScreen-0x30ffc2a>
 366:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 369:	6d                   	ins    DWORD PTR es:[edi],dx
 36a:	6d                   	ins    DWORD PTR es:[edi],dx
 36b:	61                   	popa   
 36c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 36d:	64                   	fs
 36e:	48                   	dec    eax
 36f:	69 73 74 6f 72 79 4d 	imul   esi,DWORD PTR [ebx+0x74],0x4d79726f
 376:	61                   	popa   
 377:	78 00                	js     379 <cmdClearScreen-0x30ffc87>
 379:	74 65                	je     3e0 <cmdClearScreen-0x30ffc20>
 37b:	6d                   	ins    DWORD PTR es:[edi],dx
 37c:	70 00                	jo     37e <cmdClearScreen-0x30ffc82>
 37e:	70 61                	jo     3e1 <cmdClearScreen-0x30ffc1f>
 380:	72 73                	jb     3f5 <cmdClearScreen-0x30ffc0b>
 382:	65                   	gs
 383:	50                   	push   eax
 384:	61                   	popa   
 385:	72 61                	jb     3e8 <cmdClearScreen-0x30ffc18>
 387:	6d                   	ins    DWORD PTR es:[edi],dx
 388:	73 53                	jae    3dd <cmdClearScreen-0x30ffc23>
 38a:	68 65 6c 6c 00       	push   0x6c6c65
 38f:	69 6e 70 75 74 00 6c 	imul   ebp,DWORD PTR [esi+0x70],0x6c007475
 396:	43                   	inc    ebx
 397:	75 72                	jne    40b <cmdClearScreen-0x30ffbf5>
 399:	72 4b                	jb     3e6 <cmdClearScreen-0x30ffc1a>
 39b:	65                   	gs
 39c:	79 43                	jns    3e1 <cmdClearScreen-0x30ffc1f>
 39e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 39f:	75 6e                	jne    40f <cmdClearScreen-0x30ffbf1>
 3a1:	74 00                	je     3a3 <cmdClearScreen-0x30ffc5d>
 3a3:	70 61                	jo     406 <cmdClearScreen-0x30ffbfa>
 3a5:	72 73                	jb     41a <cmdClearScreen-0x30ffbe6>
 3a7:	65                   	gs
 3a8:	64                   	fs
 3a9:	43                   	inc    ebx
 3aa:	68 61 72 73 00       	push   0x737261
 3af:	65                   	gs
 3b0:	78 65                	js     417 <cmdClearScreen-0x30ffbe9>
 3b2:	63 49 6e             	arpl   WORD PTR [ecx+0x6e],cx
 3b5:	74 65                	je     41c <cmdClearScreen-0x30ffbe4>
 3b7:	72 6e                	jb     427 <cmdClearScreen-0x30ffbd9>
 3b9:	61                   	popa   
 3ba:	6c                   	ins    BYTE PTR es:[edi],dx
 3bb:	43                   	inc    ebx
 3bc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3bd:	6d                   	ins    DWORD PTR es:[edi],dx
 3be:	6d                   	ins    DWORD PTR es:[edi],dx
 3bf:	61                   	popa   
 3c0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3c1:	64 00 73 72          	add    BYTE PTR fs:[ebx+0x72],dh
 3c5:	63 2f                	arpl   WORD PTR [edi],bp
 3c7:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3cb:	6c                   	ins    BYTE PTR es:[edi],dx
 3cc:	6c                   	ins    BYTE PTR es:[edi],dx
 3cd:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 3d0:	64                   	fs
 3d1:	71 75                	jno    448 <cmdClearScreen-0x30ffbb8>
 3d3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3d4:	74 65                	je     43b <cmdClearScreen-0x30ffbc5>
 3d6:	00 76 61             	add    BYTE PTR [esi+0x61],dh
 3d9:	6c                   	ins    BYTE PTR es:[edi],dx
 3da:	75 65                	jne    441 <cmdClearScreen-0x30ffbbf>
 3dc:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3df:	74 41                	je     422 <cmdClearScreen-0x30ffbde>
 3e1:	43                   	inc    ebx
 3e2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3e3:	6d                   	ins    DWORD PTR es:[edi],dx
 3e4:	6d                   	ins    DWORD PTR es:[edi],dx
 3e5:	61                   	popa   
 3e6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3e7:	64 00 75 69          	add    BYTE PTR fs:[ebp+0x69],dh
 3eb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3ec:	74 38                	je     426 <cmdClearScreen-0x30ffbda>
 3ee:	5f                   	pop    edi
 3ef:	74 00                	je     3f1 <cmdClearScreen-0x30ffc0f>
 3f1:	67                   	addr16
 3f2:	65                   	gs
 3f3:	74 45                	je     43a <cmdClearScreen-0x30ffbc6>
 3f5:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3f6:	76 56                	jbe    44e <cmdClearScreen-0x30ffbb2>
 3f8:	61                   	popa   
 3f9:	72 69                	jb     464 <cmdClearScreen-0x30ffb9c>
 3fb:	61                   	popa   
 3fc:	62 6c 65 56          	bound  ebp,QWORD PTR [ebp+eiz*2+0x56]
 400:	61                   	popa   
 401:	6c                   	ins    BYTE PTR es:[edi],dx
 402:	75 65                	jne    469 <cmdClearScreen-0x30ffb97>
 404:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 407:	6e                   	outs   dx,BYTE PTR ds:[esi]
 408:	64                   	fs
 409:	43                   	inc    ebx
 40a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 40b:	6d                   	ins    DWORD PTR es:[edi],dx
 40c:	6d                   	ins    DWORD PTR es:[edi],dx
 40d:	61                   	popa   
 40e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 40f:	64 00 66 72          	add    BYTE PTR fs:[esi+0x72],ah
 413:	65                   	gs
 414:	65                   	gs
 415:	41                   	inc    ecx
 416:	72 67                	jb     47f <cmdClearScreen-0x30ffb81>
 418:	56                   	push   esi
 419:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 41c:	65                   	gs
 41d:	64                   	fs
 41e:	44                   	inc    esp
 41f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 420:	75 62                	jne    484 <cmdClearScreen-0x30ffb7c>
 422:	6c                   	ins    BYTE PTR es:[edi],dx
 423:	65                   	gs
 424:	51                   	push   ecx
 425:	75 6f                	jne    496 <cmdClearScreen-0x30ffb6a>
 427:	74 65                	je     48e <cmdClearScreen-0x30ffb72>
 429:	74 6f                	je     49a <cmdClearScreen-0x30ffb66>
 42b:	45                   	inc    ebp
 42c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 42d:	64                   	fs
 42e:	50                   	push   eax
 42f:	61                   	popa   
 430:	72 61                	jb     493 <cmdClearScreen-0x30ffb6d>
 432:	6d                   	ins    DWORD PTR es:[edi],dx
 433:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 436:	72 61                	jb     499 <cmdClearScreen-0x30ffb67>
 438:	6d                   	ins    DWORD PTR es:[edi],dx
 439:	73 54                	jae    48f <cmdClearScreen-0x30ffb71>
 43b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 43c:	41                   	inc    ecx
 43d:	72 67                	jb     4a6 <cmdClearScreen-0x30ffb5a>
 43f:	76 00                	jbe    441 <cmdClearScreen-0x30ffbbf>
 441:	72 65                	jb     4a8 <cmdClearScreen-0x30ffb58>
 443:	70 72                	jo     4b7 <cmdClearScreen-0x30ffb49>
 445:	69 6e 74 43 6f 6d 6d 	imul   ebp,DWORD PTR [esi+0x74],0x6d6d6f43
 44c:	61                   	popa   
 44d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 44e:	64 00 62 73          	add    BYTE PTR fs:[edx+0x73],ah
 452:	71 75                	jno    4c9 <cmdClearScreen-0x30ffb37>
 454:	6f                   	outs   dx,DWORD PTR ds:[esi]
 455:	74 65                	je     4bc <cmdClearScreen-0x30ffb44>
 457:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 45a:	78 61                	js     4bd <cmdClearScreen-0x30ffb43>
 45c:	72 67                	jb     4c5 <cmdClearScreen-0x30ffb3b>
 45e:	63 00                	arpl   WORD PTR [eax],ax
 460:	65                   	gs
 461:	76 4e                	jbe    4b1 <cmdClearScreen-0x30ffb4f>
 463:	61                   	popa   
 464:	6d                   	ins    DWORD PTR es:[edi],dx
 465:	65 00 73 61          	add    BYTE PTR gs:[ebx+0x61],dh
 469:	76 65                	jbe    4d0 <cmdClearScreen-0x30ffb30>
 46b:	43                   	inc    ebx
 46c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 46d:	6d                   	ins    DWORD PTR es:[edi],dx
 46e:	6d                   	ins    DWORD PTR es:[edi],dx
 46f:	61                   	popa   
 470:	6e                   	outs   dx,BYTE PTR ds:[esi]
 471:	64 00 62 75          	add    BYTE PTR fs:[edx+0x75],ah
 475:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 47c:	00 
 47d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 480:	6d                   	ins    DWORD PTR es:[edi],dx
 481:	61                   	popa   
 482:	6e                   	outs   dx,BYTE PTR ds:[esi]
 483:	64                   	fs
 484:	48                   	dec    eax
 485:	69 73 74 6f 72 79 00 	imul   esi,DWORD PTR [ebx+0x74],0x79726f
 48c:	6c                   	ins    BYTE PTR es:[edi],dx
 48d:	43                   	inc    ebx
 48e:	75 72                	jne    502 <cmdClearScreen-0x30ffafe>
 490:	72 4b                	jb     4dd <cmdClearScreen-0x30ffb23>
 492:	65                   	gs
 493:	79 00                	jns    495 <cmdClearScreen-0x30ffb6b>
 495:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 499:	6c                   	ins    BYTE PTR es:[edi],dx
 49a:	6c                   	ins    BYTE PTR es:[edi],dx
 49b:	00 61 6e             	add    BYTE PTR [ecx+0x6e],ah
 49e:	73 69                	jae    509 <cmdClearScreen-0x30ffaf7>
 4a0:	53                   	push   ebx
 4a1:	65                   	gs
 4a2:	71 00                	jno    4a4 <cmdClearScreen-0x30ffb5c>
 4a4:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 4a7:	6d                   	ins    DWORD PTR es:[edi],dx
 4a8:	61                   	popa   
 4a9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4aa:	64                   	fs
 4ab:	48                   	dec    eax
 4ac:	69 73 74 6f 72 79 50 	imul   esi,DWORD PTR [ebx+0x74],0x5079726f
 4b3:	74 72                	je     527 <cmdClearScreen-0x30ffad9>
 4b5:	00 70 70             	add    BYTE PTR [eax+0x70],dh
 4b8:	74 72                	je     52c <cmdClearScreen-0x30ffad4>
 4ba:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 4bd:	7a 65                	jp     524 <cmdClearScreen-0x30ffadc>
 4bf:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 4c2:	72 67                	jb     52b <cmdClearScreen-0x30ffad5>
 4c4:	76 00                	jbe    4c6 <cmdClearScreen-0x30ffb3a>
 4c6:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 4c9:	4c                   	dec    esp
 4ca:	69 6e 65 00 6c 52 65 	imul   ebp,DWORD PTR [esi+0x65],0x65526c00
 4d1:	74 56                	je     529 <cmdClearScreen-0x30ffad7>
 4d3:	61                   	popa   
 4d4:	6c                   	ins    BYTE PTR es:[edi],dx
 4d5:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 4d8:	70 79                	jo     553 <cmdClearScreen-0x30ffaad>
 4da:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 4dd:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 4e0:	73 65                	jae    547 <cmdClearScreen-0x30ffab9>
 4e2:	74 52                	je     536 <cmdClearScreen-0x30ffaca>
 4e4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4e5:	77 00                	ja     4e7 <cmdClearScreen-0x30ffb19>
 4e7:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 4ea:	6d                   	ins    DWORD PTR es:[edi],dx
 4eb:	61                   	popa   
 4ec:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4ed:	64                   	fs
 4ee:	57                   	push   edi
 4ef:	61                   	popa   
 4f0:	73 46                	jae    538 <cmdClearScreen-0x30ffac8>
 4f2:	72 6f                	jb     563 <cmdClearScreen-0x30ffa9d>
 4f4:	6d                   	ins    DWORD PTR es:[edi],dx
 4f5:	54                   	push   esp
 4f6:	68 69 73 42 75       	push   0x75427369
 4fb:	66                   	data16
 4fc:	66                   	data16
 4fd:	65                   	gs
 4fe:	72 50                	jb     550 <cmdClearScreen-0x30ffab0>
 500:	74 72                	je     574 <cmdClearScreen-0x30ffa8c>
 502:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 505:	6d                   	ins    DWORD PTR es:[edi],dx
 506:	6d                   	ins    DWORD PTR es:[edi],dx
 507:	61                   	popa   
 508:	6e                   	outs   dx,BYTE PTR ds:[esi]
 509:	64 00 67 65          	add    BYTE PTR fs:[edi+0x65],ah
 50d:	74 41                	je     550 <cmdClearScreen-0x30ffab0>
 50f:	4b                   	dec    ebx
 510:	65                   	gs
 511:	79 00                	jns    513 <cmdClearScreen-0x30ffaed>

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
