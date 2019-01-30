
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
 3100009:	68 15 16 10 03       	push   0x3101615
 310000e:	e8 1d 13 00 00       	call   3101330 <kShell+0x426>
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
 3100028:	a1 4c 24 10 03       	mov    eax,ds:0x310244c
 310002d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100030:	c1 e2 02             	shl    edx,0x2
 3100033:	01 d0                	add    eax,edx
 3100035:	8b 00                	mov    eax,DWORD PTR [eax]
 3100037:	85 c0                	test   eax,eax
 3100039:	74 20                	je     310005b <cmdPrintEnv+0x42>
/home/yogi/src/os/aproj/kshell/src/commands.c:21
        {
            print("%s\n",environmentLoc[cnt]);
 310003b:	a1 4c 24 10 03       	mov    eax,ds:0x310244c
 3100040:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100043:	c1 e2 02             	shl    edx,0x2
 3100046:	01 d0                	add    eax,edx
 3100048:	8b 00                	mov    eax,DWORD PTR [eax]
 310004a:	83 ec 08             	sub    esp,0x8
 310004d:	50                   	push   eax
 310004e:	68 1a 16 10 03       	push   0x310161a
 3100053:	e8 c8 12 00 00       	call   3101320 <kShell+0x416>
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
 3100083:	e8 f6 07 00 00       	call   310087e <parseParamsShell>
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
 31000a4:	68 1e 16 10 03       	push   0x310161e
 31000a9:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000af:	50                   	push   eax
 31000b0:	e8 2b 13 00 00       	call   31013e0 <kShell+0x4d6>
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
 31000c4:	68 20 16 10 03       	push   0x3101620
 31000c9:	e8 52 12 00 00       	call   3101320 <kShell+0x416>
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
 31000f0:	e8 bb 13 00 00       	call   31014b0 <kShell+0x5a6>
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
 3100111:	e8 5a 12 00 00       	call   3101370 <kShell+0x466>
 3100116:	83 c4 10             	add    esp,0x10
 3100119:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:44
        varValue = malloc(valueLen);
 310011c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310011f:	83 ec 0c             	sub    esp,0xc
 3100122:	50                   	push   eax
 3100123:	e8 48 12 00 00       	call   3101370 <kShell+0x466>
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
 310013f:	e8 cc 12 00 00       	call   3101410 <kShell+0x506>
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
 310016b:	e8 a0 12 00 00       	call   3101410 <kShell+0x506>
 3100170:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:48
        strtrim(varName);
 3100173:	83 ec 0c             	sub    esp,0xc
 3100176:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100179:	e8 e2 12 00 00       	call   3101460 <kShell+0x556>
 310017e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:49
        strtrim(varValue);
 3100181:	83 ec 0c             	sub    esp,0xc
 3100184:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100187:	e8 d4 12 00 00       	call   3101460 <kShell+0x556>
 310018c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:50
        setenv(varName, varValue);
 310018f:	83 ec 08             	sub    esp,0x8
 3100192:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100195:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100198:	e8 83 12 00 00       	call   3101420 <kShell+0x516>
 310019d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:51
        free(varName);
 31001a0:	83 ec 0c             	sub    esp,0xc
 31001a3:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31001a6:	e8 25 13 00 00       	call   31014d0 <kShell+0x5c6>
 31001ab:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:52
        free(varValue);
 31001ae:	83 ec 0c             	sub    esp,0xc
 31001b1:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31001b4:	e8 17 13 00 00       	call   31014d0 <kShell+0x5c6>
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

031001c5 <kexec2>:
kexec2():
/home/yogi/src/os/aproj/kshell/src/commands.c:59

int kexec2(char* path, int argc, char** argv, bool background)
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
 31001dd:	e8 de 12 00 00       	call   31014c0 <kShell+0x5b6>
 31001e2:	83 c4 10             	add    esp,0x10
 31001e5:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:62

    if (pid>0)
 31001e8:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31001ec:	7e 4c                	jle    310023a <kexec2+0x75>
/home/yogi/src/os/aproj/kshell/src/commands.c:64
    {
        if (!background)
 31001ee:	0f b6 45 e4          	movzx  eax,BYTE PTR [ebp-0x1c]
 31001f2:	83 f0 01             	xor    eax,0x1
 31001f5:	84 c0                	test   al,al
 31001f7:	74 54                	je     310024d <kexec2+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:67
        {
            //print("DEBUG1: waitpid = %08X\n",&waitpid);
            lastExecExitCode = waitpid(pid);
 31001f9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001fc:	83 ec 0c             	sub    esp,0xc
 31001ff:	50                   	push   eax
 3100200:	e8 0b 11 00 00       	call   3101310 <kShell+0x406>
 3100205:	83 c4 10             	add    esp,0x10
 3100208:	a3 84 27 10 03       	mov    ds:0x3102784,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:69
            char ret[10];
            itoa(lastExecExitCode,ret);
 310020d:	a1 84 27 10 03       	mov    eax,ds:0x3102784
 3100212:	89 c2                	mov    edx,eax
 3100214:	83 ec 08             	sub    esp,0x8
 3100217:	8d 45 ea             	lea    eax,[ebp-0x16]
 310021a:	50                   	push   eax
 310021b:	52                   	push   edx
 310021c:	e8 8f 11 00 00       	call   31013b0 <kShell+0x4a6>
 3100221:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:70
            setenv("LASTEXIT",ret);
 3100224:	83 ec 08             	sub    esp,0x8
 3100227:	8d 45 ea             	lea    eax,[ebp-0x16]
 310022a:	50                   	push   eax
 310022b:	68 3b 16 10 03       	push   0x310163b
 3100230:	e8 eb 11 00 00       	call   3101420 <kShell+0x516>
 3100235:	83 c4 10             	add    esp,0x10
 3100238:	eb 13                	jmp    310024d <kexec2+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:74
        }
    }
    else
        print("Error executing %s\n",path);
 310023a:	83 ec 08             	sub    esp,0x8
 310023d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100240:	68 44 16 10 03       	push   0x3101644
 3100245:	e8 d6 10 00 00       	call   3101320 <kShell+0x416>
 310024a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:76

}
 310024d:	90                   	nop
 310024e:	c9                   	leave  
 310024f:	c3                   	ret    

03100250 <kexec>:
kexec():
/home/yogi/src/os/aproj/kshell/src/commands.c:79

int kexec(char* cmdline, bool timeIt)
{
 3100250:	55                   	push   ebp
 3100251:	89 e5                	mov    ebp,esp
 3100253:	81 ec 58 05 00 00    	sub    esp,0x558
 3100259:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310025c:	88 85 b4 fa ff ff    	mov    BYTE PTR [ebp-0x54c],al
/home/yogi/src/os/aproj/kshell/src/commands.c:80
    bool background=false;
 3100262:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
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
 3100286:	e8 f3 05 00 00       	call   310087e <parseParamsShell>
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
 31002a3:	75 0a                	jne    31002af <kexec+0x5f>
/home/yogi/src/os/aproj/kshell/src/commands.c:93
        return -3;
 31002a5:	b8 fd ff ff ff       	mov    eax,0xfffffffd
 31002aa:	e9 a6 01 00 00       	jmp    3100455 <kexec+0x205>
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
 31002c6:	e8 c5 10 00 00       	call   3101390 <kShell+0x486>
 31002cb:	83 c4 10             	add    esp,0x10
 31002ce:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:100

    if (argc<1)
 31002d1:	8b 85 c8 fa ff ff    	mov    eax,DWORD PTR [ebp-0x538]
 31002d7:	85 c0                	test   eax,eax
 31002d9:	7f 1a                	jg     31002f5 <kexec+0xa5>
/home/yogi/src/os/aproj/kshell/src/commands.c:102
    {
        printf("kexec: Invalid command\n");
 31002db:	83 ec 0c             	sub    esp,0xc
 31002de:	68 58 16 10 03       	push   0x3101658
 31002e3:	e8 48 10 00 00       	call   3101330 <kShell+0x426>
 31002e8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:103
        return -5;
 31002eb:	b8 fb ff ff ff       	mov    eax,0xfffffffb
 31002f0:	e9 60 01 00 00       	jmp    3100455 <kexec+0x205>
/home/yogi/src/os/aproj/kshell/src/commands.c:106
    }
    
    if (*argv[argc-1]=='&')
 31002f5:	8b 85 c8 fa ff ff    	mov    eax,DWORD PTR [ebp-0x538]
 31002fb:	05 ff ff ff 3f       	add    eax,0x3fffffff
 3100300:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100307:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 310030a:	01 d0                	add    eax,edx
 310030c:	8b 00                	mov    eax,DWORD PTR [eax]
 310030e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100311:	3c 26                	cmp    al,0x26
 3100313:	75 04                	jne    3100319 <kexec+0xc9>
/home/yogi/src/os/aproj/kshell/src/commands.c:107
        background=true;
 3100315:	c6 45 f7 01          	mov    BYTE PTR [ebp-0x9],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:110

    
    startTicks=getticks();
 3100319:	e8 a2 10 00 00       	call   31013c0 <kShell+0x4b6>
 310031e:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:112
    
    forkPid = fork();
 3100321:	e8 1a 11 00 00       	call   3101440 <kShell+0x536>
 3100326:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:114
    
    if (forkPid == 0)
 3100329:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310032d:	75 52                	jne    3100381 <kexec+0x131>
/home/yogi/src/os/aproj/kshell/src/commands.c:117
    {
        int retVal;
        int childPid = exec(argv[0], argc, argv);
 310032f:	8b 95 c8 fa ff ff    	mov    edx,DWORD PTR [ebp-0x538]
 3100335:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100338:	8b 00                	mov    eax,DWORD PTR [eax]
 310033a:	83 ec 04             	sub    esp,0x4
 310033d:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 3100340:	52                   	push   edx
 3100341:	50                   	push   eax
 3100342:	e8 89 10 00 00       	call   31013d0 <kShell+0x4c6>
 3100347:	83 c4 10             	add    esp,0x10
 310034a:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:119
        
        if (childPid > 0)
 310034d:	83 7d d0 00          	cmp    DWORD PTR [ebp-0x30],0x0
 3100351:	7e 14                	jle    3100367 <kexec+0x117>
/home/yogi/src/os/aproj/kshell/src/commands.c:121
        {
            retVal = waitpid(childPid);
 3100353:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100356:	83 ec 0c             	sub    esp,0xc
 3100359:	50                   	push   eax
 310035a:	e8 b1 0f 00 00       	call   3101310 <kShell+0x406>
 310035f:	83 c4 10             	add    esp,0x10
 3100362:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 3100365:	eb 07                	jmp    310036e <kexec+0x11e>
/home/yogi/src/os/aproj/kshell/src/commands.c:124
        }
        else
            retVal = 0xBADBADBA;
 3100367:	c7 45 f0 ba ad db ba 	mov    DWORD PTR [ebp-0x10],0xbadbadba
/home/yogi/src/os/aproj/kshell/src/commands.c:125
        exit(retVal);
 310036e:	83 ec 0c             	sub    esp,0xc
 3100371:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100374:	e8 17 11 00 00       	call   3101490 <kShell+0x586>
 3100379:	83 c4 10             	add    esp,0x10
 310037c:	e9 b8 00 00 00       	jmp    3100439 <kexec+0x1e9>
/home/yogi/src/os/aproj/kshell/src/commands.c:127
    }
    else if (forkPid < 0)
 3100381:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100385:	79 18                	jns    310039f <kexec+0x14f>
/home/yogi/src/os/aproj/kshell/src/commands.c:128
        print("Fork error %u", forkPid);
 3100387:	83 ec 08             	sub    esp,0x8
 310038a:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310038d:	68 70 16 10 03       	push   0x3101670
 3100392:	e8 89 0f 00 00       	call   3101320 <kShell+0x416>
 3100397:	83 c4 10             	add    esp,0x10
 310039a:	e9 9a 00 00 00       	jmp    3100439 <kexec+0x1e9>
/home/yogi/src/os/aproj/kshell/src/commands.c:131
    else
    {
        if (!background)
 310039f:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 31003a3:	83 f0 01             	xor    eax,0x1
 31003a6:	84 c0                	test   al,al
 31003a8:	74 36                	je     31003e0 <kexec+0x190>
/home/yogi/src/os/aproj/kshell/src/commands.c:133
        {
            lastExecExitCode = waitpid(forkPid);
 31003aa:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 31003ad:	83 ec 0c             	sub    esp,0xc
 31003b0:	50                   	push   eax
 31003b1:	e8 5a 0f 00 00       	call   3101310 <kShell+0x406>
 31003b6:	83 c4 10             	add    esp,0x10
 31003b9:	a3 84 27 10 03       	mov    ds:0x3102784,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:134
            if (lastExecExitCode == 0xBADBADBA)
 31003be:	a1 84 27 10 03       	mov    eax,ds:0x3102784
 31003c3:	3d ba ad db ba       	cmp    eax,0xbadbadba
 31003c8:	75 16                	jne    31003e0 <kexec+0x190>
/home/yogi/src/os/aproj/kshell/src/commands.c:135
                print("execTime: Cannot execute %s\n",argv[0]);
 31003ca:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31003cd:	8b 00                	mov    eax,DWORD PTR [eax]
 31003cf:	83 ec 08             	sub    esp,0x8
 31003d2:	50                   	push   eax
 31003d3:	68 7e 16 10 03       	push   0x310167e
 31003d8:	e8 43 0f 00 00       	call   3101320 <kShell+0x416>
 31003dd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:137
        }
        if (timeIt)
 31003e0:	80 bd b4 fa ff ff 00 	cmp    BYTE PTR [ebp-0x54c],0x0
 31003e7:	74 1f                	je     3100408 <kexec+0x1b8>
/home/yogi/src/os/aproj/kshell/src/commands.c:139
        {
            endTicks=getticks();
 31003e9:	e8 d2 0f 00 00       	call   31013c0 <kShell+0x4b6>
 31003ee:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:140
            print("\n%u ticks\n",endTicks-startTicks);
 31003f1:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 31003f4:	2b 45 d4             	sub    eax,DWORD PTR [ebp-0x2c]
 31003f7:	83 ec 08             	sub    esp,0x8
 31003fa:	50                   	push   eax
 31003fb:	68 9b 16 10 03       	push   0x310169b
 3100400:	e8 1b 0f 00 00       	call   3101320 <kShell+0x416>
 3100405:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:143
        }
        char ret[10];
        itoa(lastExecExitCode,ret);
 3100408:	a1 84 27 10 03       	mov    eax,ds:0x3102784
 310040d:	89 c2                	mov    edx,eax
 310040f:	83 ec 08             	sub    esp,0x8
 3100412:	8d 85 be fa ff ff    	lea    eax,[ebp-0x542]
 3100418:	50                   	push   eax
 3100419:	52                   	push   edx
 310041a:	e8 91 0f 00 00       	call   31013b0 <kShell+0x4a6>
 310041f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:144
        setenv("LASTEXIT",ret);    
 3100422:	83 ec 08             	sub    esp,0x8
 3100425:	8d 85 be fa ff ff    	lea    eax,[ebp-0x542]
 310042b:	50                   	push   eax
 310042c:	68 3b 16 10 03       	push   0x310163b
 3100431:	e8 ea 0f 00 00       	call   3101420 <kShell+0x516>
 3100436:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:147 (discriminator 1)
    }
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    free(argv);
 3100439:	83 ec 0c             	sub    esp,0xc
 310043c:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 310043f:	e8 8c 10 00 00       	call   31014d0 <kShell+0x5c6>
 3100444:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:148 (discriminator 1)
    free(pgm);
 3100447:	83 ec 0c             	sub    esp,0xc
 310044a:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 310044d:	e8 7e 10 00 00       	call   31014d0 <kShell+0x5c6>
 3100452:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:150
    
}
 3100455:	c9                   	leave  
 3100456:	c3                   	ret    

03100457 <cmdTime>:
cmdTime():
/home/yogi/src/os/aproj/kshell/src/commands.c:153

void cmdTime(char* cmdline)
{
 3100457:	55                   	push   ebp
 3100458:	89 e5                	mov    ebp,esp
 310045a:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:154
    kexec(cmdline,true);
 310045d:	83 ec 08             	sub    esp,0x8
 3100460:	6a 01                	push   0x1
 3100462:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100465:	e8 e6 fd ff ff       	call   3100250 <kexec>
 310046a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:155
}
 310046d:	90                   	nop
 310046e:	c9                   	leave  
 310046f:	c3                   	ret    

03100470 <cmdRepeat>:
cmdRepeat():
/home/yogi/src/os/aproj/kshell/src/commands.c:158

void cmdRepeat(char * cmdline)
{
 3100470:	55                   	push   ebp
 3100471:	89 e5                	mov    ebp,esp
 3100473:	83 ec 28             	sub    esp,0x28
/home/yogi/src/os/aproj/kshell/src/commands.c:159
    int argc = 0;
 3100476:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:161
    char **argv;
    int count = 0;
 310047d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:162
    char *newCmdLine=cmdline;
 3100484:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100487:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:163
    argv = cmdlineToArgv(cmdline, &argc);
 310048a:	83 ec 08             	sub    esp,0x8
 310048d:	8d 45 e4             	lea    eax,[ebp-0x1c]
 3100490:	50                   	push   eax
 3100491:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100494:	e8 f7 0e 00 00       	call   3101390 <kShell+0x486>
 3100499:	83 c4 10             	add    esp,0x10
 310049c:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:165
    
    count = atoi(argv[0]);
 310049f:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 31004a2:	8b 00                	mov    eax,DWORD PTR [eax]
 31004a4:	83 ec 0c             	sub    esp,0xc
 31004a7:	50                   	push   eax
 31004a8:	e8 f3 0f 00 00       	call   31014a0 <kShell+0x596>
 31004ad:	83 c4 10             	add    esp,0x10
 31004b0:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:167

    if (count >= 100)
 31004b3:	83 7d ec 63          	cmp    DWORD PTR [ebp-0x14],0x63
 31004b7:	7e 06                	jle    31004bf <cmdRepeat+0x4f>
/home/yogi/src/os/aproj/kshell/src/commands.c:168
        newCmdLine+=3;
 31004b9:	83 45 f4 03          	add    DWORD PTR [ebp-0xc],0x3
 31004bd:	eb 10                	jmp    31004cf <cmdRepeat+0x5f>
/home/yogi/src/os/aproj/kshell/src/commands.c:169
    else if (count >= 10)
 31004bf:	83 7d ec 09          	cmp    DWORD PTR [ebp-0x14],0x9
 31004c3:	7e 06                	jle    31004cb <cmdRepeat+0x5b>
/home/yogi/src/os/aproj/kshell/src/commands.c:170
        newCmdLine+=2;
 31004c5:	83 45 f4 02          	add    DWORD PTR [ebp-0xc],0x2
 31004c9:	eb 04                	jmp    31004cf <cmdRepeat+0x5f>
/home/yogi/src/os/aproj/kshell/src/commands.c:172
    else 
        newCmdLine+=1;
 31004cb:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:174
    
    for (int cnt=0;cnt<count;cnt++)
 31004cf:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 31004d6:	eb 53                	jmp    310052b <cmdRepeat+0xbb>
/home/yogi/src/os/aproj/kshell/src/commands.c:176
    {
        printf("\n*************** REPEAT EXECUTION #%u of %u ***************\n",cnt+1,count);
 31004d8:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31004db:	83 c0 01             	add    eax,0x1
 31004de:	83 ec 04             	sub    esp,0x4
 31004e1:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 31004e4:	50                   	push   eax
 31004e5:	68 a8 16 10 03       	push   0x31016a8
 31004ea:	e8 41 0e 00 00       	call   3101330 <kShell+0x426>
 31004ef:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:177
        kexec(newCmdLine,false);
 31004f2:	83 ec 08             	sub    esp,0x8
 31004f5:	6a 00                	push   0x0
 31004f7:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 31004fa:	e8 51 fd ff ff       	call   3100250 <kexec>
 31004ff:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:178
        if (bSigIntReceived)
 3100502:	0f b6 05 40 24 10 03 	movzx  eax,BYTE PTR ds:0x3102440
 3100509:	84 c0                	test   al,al
 310050b:	74 1a                	je     3100527 <cmdRepeat+0xb7>
/home/yogi/src/os/aproj/kshell/src/commands.c:180
        {
            if (processSignal(SIGINT)==SIGINT)
 310050d:	83 ec 0c             	sub    esp,0xc
 3100510:	6a 08                	push   0x8
 3100512:	e8 d3 09 00 00       	call   3100eea <processSignal>
 3100517:	83 c4 10             	add    esp,0x10
 310051a:	83 f8 08             	cmp    eax,0x8
 310051d:	75 16                	jne    3100535 <cmdRepeat+0xc5>
/home/yogi/src/os/aproj/kshell/src/commands.c:181
                cnt=count;
 310051f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100522:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:182
            break;
 3100525:	eb 0e                	jmp    3100535 <cmdRepeat+0xc5>
/home/yogi/src/os/aproj/kshell/src/commands.c:174 (discriminator 2)
    else if (count >= 10)
        newCmdLine+=2;
    else 
        newCmdLine+=1;
    
    for (int cnt=0;cnt<count;cnt++)
 3100527:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:174 (discriminator 1)
 310052b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310052e:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 3100531:	7c a5                	jl     31004d8 <cmdRepeat+0x68>
/home/yogi/src/os/aproj/kshell/src/commands.c:186
                cnt=count;
            break;
        }
    }
    
}
 3100533:	eb 01                	jmp    3100536 <cmdRepeat+0xc6>
/home/yogi/src/os/aproj/kshell/src/commands.c:182
        kexec(newCmdLine,false);
        if (bSigIntReceived)
        {
            if (processSignal(SIGINT)==SIGINT)
                cnt=count;
            break;
 3100535:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/commands.c:186 (discriminator 1)
        }
    }
    
}
 3100536:	90                   	nop
 3100537:	c9                   	leave  
 3100538:	c3                   	ret    

03100539 <cmdExecp>:
cmdExecp():
/home/yogi/src/os/aproj/kshell/src/commands.c:189

void cmdExecp(char* cmdline)
{
 3100539:	55                   	push   ebp
 310053a:	89 e5                	mov    ebp,esp
 310053c:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:190
    kexec(cmdline,false);
 310053f:	83 ec 08             	sub    esp,0x8
 3100542:	6a 00                	push   0x0
 3100544:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100547:	e8 04 fd ff ff       	call   3100250 <kexec>
 310054c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:191
}
 310054f:	90                   	nop
 3100550:	c9                   	leave  
 3100551:	c3                   	ret    

03100552 <cmdExit>:
cmdExit():
/home/yogi/src/os/aproj/kshell/src/commands.c:194

void cmdExit(char *cmdline)
{
 3100552:	55                   	push   ebp
 3100553:	89 e5                	mov    ebp,esp
 3100555:	81 ec 08 05 00 00    	sub    esp,0x508
/home/yogi/src/os/aproj/kshell/src/commands.c:197
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 310055b:	83 ec 04             	sub    esp,0x4
 310055e:	68 00 05 00 00       	push   0x500
 3100563:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 3100569:	50                   	push   eax
 310056a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310056d:	e8 0c 03 00 00       	call   310087e <parseParamsShell>
 3100572:	83 c4 10             	add    esp,0x10
 3100575:	85 c0                	test   eax,eax
 3100577:	74 1d                	je     3100596 <cmdExit+0x44>
/home/yogi/src/os/aproj/kshell/src/commands.c:199
    {
        exitCode = strtoul(params[0],0,10);
 3100579:	83 ec 04             	sub    esp,0x4
 310057c:	6a 0a                	push   0xa
 310057e:	6a 00                	push   0x0
 3100580:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 3100586:	50                   	push   eax
 3100587:	e8 14 0e 00 00       	call   31013a0 <kShell+0x496>
 310058c:	83 c4 10             	add    esp,0x10
 310058f:	a3 88 27 10 03       	mov    ds:0x3102788,eax
 3100594:	eb 0a                	jmp    31005a0 <cmdExit+0x4e>
/home/yogi/src/os/aproj/kshell/src/commands.c:202
    }
    else
        exitCode = 0;
 3100596:	c7 05 88 27 10 03 00 	mov    DWORD PTR ds:0x3102788,0x0
 310059d:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:203
    timeToExit=true;
 31005a0:	c6 05 94 27 10 03 01 	mov    BYTE PTR ds:0x3102794,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:204
}
 31005a7:	90                   	nop
 31005a8:	c9                   	leave  
 31005a9:	c3                   	ret    

031005aa <cmdHelp>:
cmdHelp():
/home/yogi/src/os/aproj/kshell/src/commands.c:207

void cmdHelp(char *cmdline)
{
 31005aa:	55                   	push   ebp
 31005ab:	89 e5                	mov    ebp,esp
 31005ad:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:210
    char* tok;
    
    tok=strtok(cmdline,delim);
 31005b0:	83 ec 08             	sub    esp,0x8
 31005b3:	68 44 24 10 03       	push   0x3102444
 31005b8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31005bb:	e8 70 0e 00 00       	call   3101430 <kShell+0x526>
 31005c0:	83 c4 10             	add    esp,0x10
 31005c3:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:217
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
 31005c6:	83 ec 08             	sub    esp,0x8
 31005c9:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005cc:	68 e5 16 10 03       	push   0x31016e5
 31005d1:	e8 4a 0d 00 00       	call   3101320 <kShell+0x416>
 31005d6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:218
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 31005d9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31005e0:	e9 86 00 00 00       	jmp    310066b <cmdHelp+0xc1>
/home/yogi/src/os/aproj/kshell/src/commands.c:219
        if (tok!=NULL)
 31005e5:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31005e9:	74 50                	je     310063b <cmdHelp+0x91>
/home/yogi/src/os/aproj/kshell/src/commands.c:221
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
 31005eb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005ee:	c1 e0 04             	shl    eax,0x4
 31005f1:	05 e0 21 10 03       	add    eax,0x31021e0
 31005f6:	8b 00                	mov    eax,DWORD PTR [eax]
 31005f8:	83 ec 04             	sub    esp,0x4
 31005fb:	6a 64                	push   0x64
 31005fd:	50                   	push   eax
 31005fe:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100601:	e8 fa 0d 00 00       	call   3101400 <kShell+0x4f6>
 3100606:	83 c4 10             	add    esp,0x10
 3100609:	85 c0                	test   eax,eax
 310060b:	75 5a                	jne    3100667 <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:222
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 310060d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100610:	c1 e0 04             	shl    eax,0x4
 3100613:	05 e4 21 10 03       	add    eax,0x31021e4
 3100618:	8b 10                	mov    edx,DWORD PTR [eax]
 310061a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310061d:	c1 e0 04             	shl    eax,0x4
 3100620:	05 e0 21 10 03       	add    eax,0x31021e0
 3100625:	8b 00                	mov    eax,DWORD PTR [eax]
 3100627:	83 ec 04             	sub    esp,0x4
 310062a:	52                   	push   edx
 310062b:	50                   	push   eax
 310062c:	68 ef 16 10 03       	push   0x31016ef
 3100631:	e8 ea 0c 00 00       	call   3101320 <kShell+0x416>
 3100636:	83 c4 10             	add    esp,0x10
 3100639:	eb 2c                	jmp    3100667 <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:226
        }
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 310063b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310063e:	c1 e0 04             	shl    eax,0x4
 3100641:	05 e4 21 10 03       	add    eax,0x31021e4
 3100646:	8b 10                	mov    edx,DWORD PTR [eax]
 3100648:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310064b:	c1 e0 04             	shl    eax,0x4
 310064e:	05 e0 21 10 03       	add    eax,0x31021e0
 3100653:	8b 00                	mov    eax,DWORD PTR [eax]
 3100655:	83 ec 04             	sub    esp,0x4
 3100658:	52                   	push   edx
 3100659:	50                   	push   eax
 310065a:	68 ef 16 10 03       	push   0x31016ef
 310065f:	e8 bc 0c 00 00       	call   3101320 <kShell+0x416>
 3100664:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:218 (discriminator 2)
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100667:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:218 (discriminator 1)
 310066b:	83 7d f4 09          	cmp    DWORD PTR [ebp-0xc],0x9
 310066f:	0f 86 70 ff ff ff    	jbe    31005e5 <cmdHelp+0x3b>
/home/yogi/src/os/aproj/kshell/src/commands.c:229
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
    
}
 3100675:	90                   	nop
 3100676:	c9                   	leave  
 3100677:	c3                   	ret    

03100678 <cmdPwd>:
cmdPwd():
/home/yogi/src/os/aproj/kshell/src/commands.c:232

void cmdPwd()
{
 3100678:	55                   	push   ebp
 3100679:	89 e5                	mov    ebp,esp
 310067b:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:233
    char* buf=malloc(512);
 310067e:	83 ec 0c             	sub    esp,0xc
 3100681:	68 00 02 00 00       	push   0x200
 3100686:	e8 e5 0c 00 00       	call   3101370 <kShell+0x466>
 310068b:	83 c4 10             	add    esp,0x10
 310068e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:234
    print("%s\n",getcwd(buf,512));
 3100691:	83 ec 08             	sub    esp,0x8
 3100694:	68 00 02 00 00       	push   0x200
 3100699:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 310069c:	e8 cf 0d 00 00       	call   3101470 <kShell+0x566>
 31006a1:	83 c4 10             	add    esp,0x10
 31006a4:	83 ec 08             	sub    esp,0x8
 31006a7:	50                   	push   eax
 31006a8:	68 1a 16 10 03       	push   0x310161a
 31006ad:	e8 6e 0c 00 00       	call   3101320 <kShell+0x416>
 31006b2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:235
    free(buf);
 31006b5:	83 ec 0c             	sub    esp,0xc
 31006b8:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 31006bb:	e8 10 0e 00 00       	call   31014d0 <kShell+0x5c6>
 31006c0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:236
}
 31006c3:	90                   	nop
 31006c4:	c9                   	leave  
 31006c5:	c3                   	ret    

031006c6 <cmdSleep>:
cmdSleep():
/home/yogi/src/os/aproj/kshell/src/commands.c:239

void cmdSleep(char *cmdline)
{
 31006c6:	55                   	push   ebp
 31006c7:	89 e5                	mov    ebp,esp
 31006c9:	53                   	push   ebx
 31006ca:	81 ec 24 05 00 00    	sub    esp,0x524
 31006d0:	89 e0                	mov    eax,esp
 31006d2:	89 c3                	mov    ebx,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:241
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 31006d4:	83 ec 04             	sub    esp,0x4
 31006d7:	68 00 05 00 00       	push   0x500
 31006dc:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 31006e2:	50                   	push   eax
 31006e3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31006e6:	e8 93 01 00 00       	call   310087e <parseParamsShell>
 31006eb:	83 c4 10             	add    esp,0x10
 31006ee:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:244

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
 31006f1:	c7 45 e8 a8 61 00 00 	mov    DWORD PTR [ebp-0x18],0x61a8
/home/yogi/src/os/aproj/kshell/src/commands.c:245
    int test[size];
 31006f8:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 31006fb:	8d 50 ff             	lea    edx,[eax-0x1]
 31006fe:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 3100701:	c1 e0 02             	shl    eax,0x2
 3100704:	8d 50 03             	lea    edx,[eax+0x3]
 3100707:	b8 10 00 00 00       	mov    eax,0x10
 310070c:	83 e8 01             	sub    eax,0x1
 310070f:	01 d0                	add    eax,edx
 3100711:	b9 10 00 00 00       	mov    ecx,0x10
 3100716:	ba 00 00 00 00       	mov    edx,0x0
 310071b:	f7 f1                	div    ecx
 310071d:	6b c0 10             	imul   eax,eax,0x10
 3100720:	29 c4                	sub    esp,eax
 3100722:	89 e0                	mov    eax,esp
 3100724:	83 c0 03             	add    eax,0x3
 3100727:	c1 e8 02             	shr    eax,0x2
 310072a:	c1 e0 02             	shl    eax,0x2
 310072d:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:247
    
    for (int cnt=0;cnt<size;cnt++)
 3100730:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100737:	eb 10                	jmp    3100749 <cmdSleep+0x83>
/home/yogi/src/os/aproj/kshell/src/commands.c:248 (discriminator 3)
        test[cnt]=cnt;
 3100739:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310073c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 310073f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 3100742:	89 0c 90             	mov    DWORD PTR [eax+edx*4],ecx
/home/yogi/src/os/aproj/kshell/src/commands.c:247 (discriminator 3)

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
 3100745:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:247 (discriminator 1)
 3100749:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310074c:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 310074f:	7c e8                	jl     3100739 <cmdSleep+0x73>
/home/yogi/src/os/aproj/kshell/src/commands.c:250
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
 3100751:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 3100758:	eb 22                	jmp    310077c <cmdSleep+0xb6>
/home/yogi/src/os/aproj/kshell/src/commands.c:251
        if (test[cnt]!=cnt)
 310075a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310075d:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 3100760:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
 3100763:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 3100766:	74 10                	je     3100778 <cmdSleep+0xb2>
/home/yogi/src/os/aproj/kshell/src/commands.c:252
            printf("uh oh!");
 3100768:	83 ec 0c             	sub    esp,0xc
 310076b:	68 f8 16 10 03       	push   0x31016f8
 3100770:	e8 bb 0b 00 00       	call   3101330 <kShell+0x426>
 3100775:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:250 (discriminator 2)
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
 3100778:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:250 (discriminator 1)
 310077c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310077f:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 3100782:	7c d6                	jl     310075a <cmdSleep+0x94>
/home/yogi/src/os/aproj/kshell/src/commands.c:254
        if (test[cnt]!=cnt)
            printf("uh oh!");
    
    if (params[0][0]==0)
 3100784:	0f b6 85 e0 fa ff ff 	movzx  eax,BYTE PTR [ebp-0x520]
 310078b:	84 c0                	test   al,al
 310078d:	75 17                	jne    31007a6 <cmdSleep+0xe0>
/home/yogi/src/os/aproj/kshell/src/commands.c:256
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 310078f:	83 ec 0c             	sub    esp,0xc
 3100792:	68 00 17 10 03       	push   0x3101700
 3100797:	e8 84 0b 00 00       	call   3101320 <kShell+0x416>
 310079c:	83 c4 10             	add    esp,0x10
 310079f:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:257
        return;
 31007a4:	eb 27                	jmp    31007cd <cmdSleep+0x107>
/home/yogi/src/os/aproj/kshell/src/commands.c:260
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 31007a6:	83 ec 04             	sub    esp,0x4
 31007a9:	6a 0a                	push   0xa
 31007ab:	6a 00                	push   0x0
 31007ad:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 31007b3:	50                   	push   eax
 31007b4:	e8 e7 0b 00 00       	call   31013a0 <kShell+0x496>
 31007b9:	83 c4 10             	add    esp,0x10
 31007bc:	83 ec 0c             	sub    esp,0xc
 31007bf:	50                   	push   eax
 31007c0:	e8 bb 0b 00 00       	call   3101380 <kShell+0x476>
 31007c5:	83 c4 10             	add    esp,0x10
 31007c8:	b8 01 00 00 00       	mov    eax,0x1
 31007cd:	89 dc                	mov    esp,ebx
 31007cf:	83 f8 01             	cmp    eax,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:261
}
 31007d2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31007d5:	c9                   	leave  
 31007d6:	c3                   	ret    
 31007d7:	90                   	nop

031007d8 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:26
void execInternalCommand(char lCommand[256]);
int findCommand(char* command);
char **buildargv (const char *input);

void execInternalCommand(char lCommand[256])
{
 31007d8:	55                   	push   ebp
 31007d9:	89 e5                	mov    ebp,esp
 31007db:	53                   	push   ebx
 31007dc:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:27
    int i = findCommand(lCommand);
 31007df:	83 ec 0c             	sub    esp,0xc
 31007e2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31007e5:	e8 3d 02 00 00       	call   3100a27 <findCommand>
 31007ea:	83 c4 10             	add    esp,0x10
 31007ed:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:29

    if(i>0)
 31007f0:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31007f4:	7e 74                	jle    310086a <execInternalCommand+0x92>
/home/yogi/src/os/aproj/kshell/src/kshell.c:31
    {
        i--;
 31007f6:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:33
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 31007fa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31007fd:	c1 e0 04             	shl    eax,0x4
 3100800:	05 88 22 10 03       	add    eax,0x3102288
 3100805:	8b 00                	mov    eax,DWORD PTR [eax]
 3100807:	a3 74 27 10 03       	mov    ds:0x3102774,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:34
        command_function_p = cmds[i].function;
 310080c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310080f:	c1 e0 04             	shl    eax,0x4
 3100812:	05 88 22 10 03       	add    eax,0x3102288
 3100817:	8b 00                	mov    eax,DWORD PTR [eax]
 3100819:	a3 60 27 10 03       	mov    ds:0x3102760,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:35
        if (cmds[i].paramCount==0)
 310081e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100821:	c1 e0 04             	shl    eax,0x4
 3100824:	05 8c 22 10 03       	add    eax,0x310228c
 3100829:	8b 00                	mov    eax,DWORD PTR [eax]
 310082b:	85 c0                	test   eax,eax
 310082d:	75 09                	jne    3100838 <execInternalCommand+0x60>
/home/yogi/src/os/aproj/kshell/src/kshell.c:36
            command_function();
 310082f:	a1 74 27 10 03       	mov    eax,ds:0x3102774
 3100834:	ff d0                	call   eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:47
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 3100836:	eb 40                	jmp    3100878 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:39
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
 3100838:	8b 1d 60 27 10 03    	mov    ebx,DWORD PTR ds:0x3102760
 310083e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100841:	c1 e0 04             	shl    eax,0x4
 3100844:	05 80 22 10 03       	add    eax,0x3102280
 3100849:	8b 00                	mov    eax,DWORD PTR [eax]
 310084b:	83 ec 0c             	sub    esp,0xc
 310084e:	50                   	push   eax
 310084f:	e8 5c 0c 00 00       	call   31014b0 <kShell+0x5a6>
 3100854:	83 c4 10             	add    esp,0x10
 3100857:	8d 50 01             	lea    edx,[eax+0x1]
 310085a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310085d:	01 d0                	add    eax,edx
 310085f:	83 ec 0c             	sub    esp,0xc
 3100862:	50                   	push   eax
 3100863:	ff d3                	call   ebx
 3100865:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:47
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 3100868:	eb 0e                	jmp    3100878 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:45
        }
    }
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
 310086a:	83 ec 0c             	sub    esp,0xc
 310086d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100870:	e8 c4 fc ff ff       	call   3100539 <cmdExecp>
 3100875:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:47
    }
}
 3100878:	90                   	nop
 3100879:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 310087c:	c9                   	leave  
 310087d:	c3                   	ret    

0310087e <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:50

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 310087e:	55                   	push   ebp
 310087f:	89 e5                	mov    ebp,esp
 3100881:	53                   	push   ebx
 3100882:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/aproj/kshell/src/kshell.c:51
    int x=0,y=0;
 3100885:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310088c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:52
    int lRetVal=0,parsedChars=0;
 3100893:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 310089a:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:53
    bool needDoubleQuotetoEndParam=0;
 31008a1:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:55
    
    memset(params,0, size);
 31008a5:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 31008a8:	83 ec 04             	sub    esp,0x4
 31008ab:	50                   	push   eax
 31008ac:	6a 00                	push   0x0
 31008ae:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31008b1:	e8 9a 0b 00 00       	call   3101450 <kShell+0x546>
 31008b6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:57
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31008b9:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 31008c0:	e9 24 01 00 00       	jmp    31009e9 <parseParamsShell+0x16b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:59
    {
        if(cmdLine[cnt]=='"')
 31008c5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31008c8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31008cb:	01 d0                	add    eax,edx
 31008cd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31008d0:	3c 22                	cmp    al,0x22
 31008d2:	75 41                	jne    3100915 <parseParamsShell+0x97>
/home/yogi/src/os/aproj/kshell/src/kshell.c:61
        {
            if (!needDoubleQuotetoEndParam)
 31008d4:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 31008d8:	83 f0 01             	xor    eax,0x1
 31008db:	84 c0                	test   al,al
 31008dd:	74 09                	je     31008e8 <parseParamsShell+0x6a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:63
            {
                needDoubleQuotetoEndParam=true;
 31008df:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 31008e3:	e9 f9 00 00 00       	jmp    31009e1 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:67
            }
            else
            {
                params[y][x]='\0';
 31008e8:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31008eb:	c1 e0 07             	shl    eax,0x7
 31008ee:	89 c2                	mov    edx,eax
 31008f0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31008f3:	01 c2                	add    edx,eax
 31008f5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31008f8:	01 d0                	add    eax,edx
 31008fa:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:68
                {x=0;y++;lRetVal++;}
 31008fd:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100904:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100908:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:69
                needDoubleQuotetoEndParam=false;
 310090c:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 3100910:	e9 cc 00 00 00       	jmp    31009e1 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 3100915:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100918:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310091b:	01 d0                	add    eax,edx
 310091d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100920:	3c 20                	cmp    al,0x20
 3100922:	74 1e                	je     3100942 <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72 (discriminator 2)
 3100924:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100927:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310092a:	01 d0                	add    eax,edx
 310092c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310092f:	3c 2d                	cmp    al,0x2d
 3100931:	74 0f                	je     3100942 <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72 (discriminator 4)
 3100933:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100936:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100939:	01 d0                	add    eax,edx
 310093b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310093e:	3c 2c                	cmp    al,0x2c
 3100940:	75 7a                	jne    31009bc <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72 (discriminator 5)
 3100942:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100946:	83 f0 01             	xor    eax,0x1
 3100949:	84 c0                	test   al,al
 310094b:	74 6f                	je     31009bc <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:75
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 310094d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100950:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100953:	01 d0                	add    eax,edx
 3100955:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100958:	3c 2d                	cmp    al,0x2d
 310095a:	74 0f                	je     310096b <parseParamsShell+0xed>
/home/yogi/src/os/aproj/kshell/src/kshell.c:75 (discriminator 1)
 310095c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310095f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100962:	01 d0                	add    eax,edx
 3100964:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100967:	3c 2f                	cmp    al,0x2f
 3100969:	75 25                	jne    3100990 <parseParamsShell+0x112>
/home/yogi/src/os/aproj/kshell/src/kshell.c:76
                params[y][x++]=cmdLine[cnt];
 310096b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310096e:	c1 e0 07             	shl    eax,0x7
 3100971:	89 c2                	mov    edx,eax
 3100973:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100976:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100979:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310097c:	8d 50 01             	lea    edx,[eax+0x1]
 310097f:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100982:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100985:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 3100988:	01 da                	add    edx,ebx
 310098a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310098d:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:77
            params[y][x]='\0';
 3100990:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100993:	c1 e0 07             	shl    eax,0x7
 3100996:	89 c2                	mov    edx,eax
 3100998:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310099b:	01 c2                	add    edx,eax
 310099d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31009a0:	01 d0                	add    eax,edx
 31009a2:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:78
            if (cnt>0)
 31009a5:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 31009a9:	74 36                	je     31009e1 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:79
                {x=0;y++;lRetVal++;}
 31009ab:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31009b2:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31009b6:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:78
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 31009ba:	eb 25                	jmp    31009e1 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:84
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 31009bc:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31009bf:	c1 e0 07             	shl    eax,0x7
 31009c2:	89 c2                	mov    edx,eax
 31009c4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31009c7:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31009ca:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31009cd:	8d 50 01             	lea    edx,[eax+0x1]
 31009d0:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31009d3:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31009d6:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 31009d9:	01 da                	add    edx,ebx
 31009db:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31009de:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:86 (discriminator 2)
        }
        parsedChars++;
 31009e1:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:57 (discriminator 2)
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31009e5:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:57 (discriminator 1)
 31009e9:	83 ec 0c             	sub    esp,0xc
 31009ec:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31009ef:	e8 bc 0a 00 00       	call   31014b0 <kShell+0x5a6>
 31009f4:	83 c4 10             	add    esp,0x10
 31009f7:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 31009fa:	0f 87 c5 fe ff ff    	ja     31008c5 <parseParamsShell+0x47>
/home/yogi/src/os/aproj/kshell/src/kshell.c:88
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 3100a00:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100a04:	74 19                	je     3100a1f <parseParamsShell+0x1a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:90
    {
        lRetVal++;
 3100a06:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:91
        params[y][x]='\0';
 3100a0a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100a0d:	c1 e0 07             	shl    eax,0x7
 3100a10:	89 c2                	mov    edx,eax
 3100a12:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100a15:	01 c2                	add    edx,eax
 3100a17:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a1a:	01 d0                	add    eax,edx
 3100a1c:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:96
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 3100a1f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/aproj/kshell/src/kshell.c:97
}
 3100a22:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100a25:	c9                   	leave  
 3100a26:	c3                   	ret    

03100a27 <findCommand>:
findCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:100

int findCommand(char* command)
{
 3100a27:	55                   	push   ebp
 3100a28:	89 e5                	mov    ebp,esp
 3100a2a:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:104
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100a2d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100a34:	eb 4d                	jmp    3100a83 <findCommand+0x5c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:106
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3100a36:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a39:	c1 e0 04             	shl    eax,0x4
 3100a3c:	05 80 22 10 03       	add    eax,0x3102280
 3100a41:	8b 00                	mov    eax,DWORD PTR [eax]
 3100a43:	83 ec 0c             	sub    esp,0xc
 3100a46:	50                   	push   eax
 3100a47:	e8 64 0a 00 00       	call   31014b0 <kShell+0x5a6>
 3100a4c:	83 c4 10             	add    esp,0x10
 3100a4f:	89 c2                	mov    edx,eax
 3100a51:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a54:	c1 e0 04             	shl    eax,0x4
 3100a57:	05 80 22 10 03       	add    eax,0x3102280
 3100a5c:	8b 00                	mov    eax,DWORD PTR [eax]
 3100a5e:	83 ec 04             	sub    esp,0x4
 3100a61:	52                   	push   edx
 3100a62:	50                   	push   eax
 3100a63:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100a66:	e8 95 09 00 00       	call   3101400 <kShell+0x4f6>
 3100a6b:	83 c4 10             	add    esp,0x10
 3100a6e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:108
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 3100a71:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100a75:	75 08                	jne    3100a7f <findCommand+0x58>
/home/yogi/src/os/aproj/kshell/src/kshell.c:111
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 3100a77:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a7a:	83 c0 01             	add    eax,0x1
 3100a7d:	eb 0f                	jmp    3100a8e <findCommand+0x67>
/home/yogi/src/os/aproj/kshell/src/kshell.c:104 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100a7f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:104 (discriminator 1)
 3100a83:	83 7d f4 09          	cmp    DWORD PTR [ebp-0xc],0x9
 3100a87:	76 ad                	jbe    3100a36 <findCommand+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:115
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 3100a89:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:116
}
 3100a8e:	c9                   	leave  
 3100a8f:	c3                   	ret    

03100a90 <buildargv>:
buildargv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:120

/*parts from http://*/
char **buildargv (const char *input)
{
 3100a90:	55                   	push   ebp
 3100a91:	89 e5                	mov    ebp,esp
 3100a93:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:123
  char *arg;
  char *copybuf;
  int squote = 0;
 3100a96:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:124
  int dquote = 0;
 3100a9d:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:125
  int bsquote = 0;
 3100aa4:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:126
  int argc = 0;
 3100aab:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:127
  int maxargc = 0;
 3100ab2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:128
  char **argv = NULL;
 3100ab9:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:132
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 3100ac0:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 3100ac4:	0f 84 33 02 00 00    	je     3100cfd <buildargv+0x26d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:135
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 3100aca:	83 ec 0c             	sub    esp,0xc
 3100acd:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100ad0:	e8 db 09 00 00       	call   31014b0 <kShell+0x5a6>
 3100ad5:	83 c4 10             	add    esp,0x10
 3100ad8:	83 c0 01             	add    eax,0x1
 3100adb:	83 ec 0c             	sub    esp,0xc
 3100ade:	50                   	push   eax
 3100adf:	e8 8c 08 00 00       	call   3101370 <kShell+0x466>
 3100ae4:	83 c4 10             	add    esp,0x10
 3100ae7:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:143
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 3100aea:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 3100aee:	74 0b                	je     3100afb <buildargv+0x6b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:143 (discriminator 1)
 3100af0:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100af3:	83 e8 01             	sub    eax,0x1
 3100af6:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100af9:	7f 3d                	jg     3100b38 <buildargv+0xa8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:146
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 3100afb:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 3100aff:	75 1c                	jne    3100b1d <buildargv+0x8d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:148
		{
		  maxargc = INITIAL_MAXARGC;
 3100b01:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:149
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 3100b08:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100b0b:	c1 e0 02             	shl    eax,0x2
 3100b0e:	83 ec 0c             	sub    esp,0xc
 3100b11:	50                   	push   eax
 3100b12:	e8 59 08 00 00       	call   3101370 <kShell+0x466>
 3100b17:	83 c4 10             	add    esp,0x10
 3100b1a:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:151
		}
	      argv = nargv;
 3100b1d:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 3100b20:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:152
	      argv[argc] = NULL;
 3100b23:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100b26:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100b2d:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100b30:	01 d0                	add    eax,edx
 3100b32:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:155
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 3100b38:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100b3b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:156
	  while (*input != EOS)
 3100b3e:	e9 ec 00 00 00       	jmp    3100c2f <buildargv+0x19f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100b43:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b46:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b49:	3c 20                	cmp    al,0x20
 3100b4b:	75 16                	jne    3100b63 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158 (discriminator 1)
 3100b4d:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100b51:	75 10                	jne    3100b63 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158 (discriminator 2)
 3100b53:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100b57:	75 0a                	jne    3100b63 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158 (discriminator 3)
 3100b59:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100b5d:	0f 84 da 00 00 00    	je     3100c3d <buildargv+0x1ad>
/home/yogi/src/os/aproj/kshell/src/kshell.c:164
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100b63:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100b67:	74 1d                	je     3100b86 <buildargv+0xf6>
/home/yogi/src/os/aproj/kshell/src/kshell.c:166
		    {
		      bsquote = 0;
 3100b69:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:167
		      *arg++ = *input;
 3100b70:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100b73:	8d 50 01             	lea    edx,[eax+0x1]
 3100b76:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100b79:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100b7c:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100b7f:	88 10                	mov    BYTE PTR [eax],dl
 3100b81:	e9 a5 00 00 00       	jmp    3100c2b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:169
		    }
		  else if (*input == '\\')
 3100b86:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b89:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b8c:	3c 5c                	cmp    al,0x5c
 3100b8e:	75 0c                	jne    3100b9c <buildargv+0x10c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:171
		    {
		      bsquote = 1;
 3100b90:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 3100b97:	e9 8f 00 00 00       	jmp    3100c2b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:173
		    }
		  else if (squote)
 3100b9c:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100ba0:	74 26                	je     3100bc8 <buildargv+0x138>
/home/yogi/src/os/aproj/kshell/src/kshell.c:175
		    {
		      if (*input == '\'')
 3100ba2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100ba5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100ba8:	3c 27                	cmp    al,0x27
 3100baa:	75 09                	jne    3100bb5 <buildargv+0x125>
/home/yogi/src/os/aproj/kshell/src/kshell.c:177
			{
			  squote = 0;
 3100bac:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100bb3:	eb 76                	jmp    3100c2b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:181
			}
		      else
			{
			  *arg++ = *input;
 3100bb5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bb8:	8d 50 01             	lea    edx,[eax+0x1]
 3100bbb:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100bbe:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100bc1:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100bc4:	88 10                	mov    BYTE PTR [eax],dl
 3100bc6:	eb 63                	jmp    3100c2b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:184
			}
		    }
		  else if (dquote)
 3100bc8:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100bcc:	74 26                	je     3100bf4 <buildargv+0x164>
/home/yogi/src/os/aproj/kshell/src/kshell.c:186
		    {
		      if (*input == '"')
 3100bce:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100bd1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100bd4:	3c 22                	cmp    al,0x22
 3100bd6:	75 09                	jne    3100be1 <buildargv+0x151>
/home/yogi/src/os/aproj/kshell/src/kshell.c:188
			{
			  dquote = 0;
 3100bd8:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 3100bdf:	eb 4a                	jmp    3100c2b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:192
			}
		      else
			{
			  *arg++ = *input;
 3100be1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100be4:	8d 50 01             	lea    edx,[eax+0x1]
 3100be7:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100bea:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100bed:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100bf0:	88 10                	mov    BYTE PTR [eax],dl
 3100bf2:	eb 37                	jmp    3100c2b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:197
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100bf4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100bf7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100bfa:	3c 27                	cmp    al,0x27
 3100bfc:	75 09                	jne    3100c07 <buildargv+0x177>
/home/yogi/src/os/aproj/kshell/src/kshell.c:199
			{
			  squote = 1;
 3100bfe:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100c05:	eb 24                	jmp    3100c2b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:201
			}
		      else if (*input == '"')
 3100c07:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100c0a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c0d:	3c 22                	cmp    al,0x22
 3100c0f:	75 09                	jne    3100c1a <buildargv+0x18a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:203
			{
			  dquote = 1;
 3100c11:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 3100c18:	eb 11                	jmp    3100c2b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:207
			}
		      else
			{
			  *arg++ = *input;
 3100c1a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c1d:	8d 50 01             	lea    edx,[eax+0x1]
 3100c20:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100c23:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100c26:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100c29:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:211
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 3100c2b:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:156
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 3100c2f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100c32:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c35:	84 c0                	test   al,al
 3100c37:	0f 85 06 ff ff ff    	jne    3100b43 <buildargv+0xb3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:214
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3100c3d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c40:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:216
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100c43:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100c46:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c49:	84 c0                	test   al,al
 3100c4b:	0f 84 9e 00 00 00    	je     3100cef <buildargv+0x25f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:218
          {
            char* temp=malloc(strlen(copybuf)+1);
 3100c51:	83 ec 0c             	sub    esp,0xc
 3100c54:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c57:	e8 54 08 00 00       	call   31014b0 <kShell+0x5a6>
 3100c5c:	83 c4 10             	add    esp,0x10
 3100c5f:	83 c0 01             	add    eax,0x1
 3100c62:	83 ec 0c             	sub    esp,0xc
 3100c65:	50                   	push   eax
 3100c66:	e8 05 07 00 00       	call   3101370 <kShell+0x466>
 3100c6b:	83 c4 10             	add    esp,0x10
 3100c6e:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:221
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3100c71:	83 ec 08             	sub    esp,0x8
 3100c74:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c77:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100c7a:	e8 81 06 00 00       	call   3101300 <kShell+0x3f6>
 3100c7f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:222
            free(copybuf);
 3100c82:	83 ec 0c             	sub    esp,0xc
 3100c85:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c88:	e8 43 08 00 00       	call   31014d0 <kShell+0x5c6>
 3100c8d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:223
            copybuf = (char *) malloc (strlen (input) + 1);
 3100c90:	83 ec 0c             	sub    esp,0xc
 3100c93:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100c96:	e8 15 08 00 00       	call   31014b0 <kShell+0x5a6>
 3100c9b:	83 c4 10             	add    esp,0x10
 3100c9e:	83 c0 01             	add    eax,0x1
 3100ca1:	83 ec 0c             	sub    esp,0xc
 3100ca4:	50                   	push   eax
 3100ca5:	e8 c6 06 00 00       	call   3101370 <kShell+0x466>
 3100caa:	83 c4 10             	add    esp,0x10
 3100cad:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:224
            argv[argc] = temp;
 3100cb0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100cb3:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100cba:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100cbd:	01 c2                	add    edx,eax
 3100cbf:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100cc2:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:226
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 3100cc4:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:227
            argv[argc] = NULL;
 3100cc8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100ccb:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100cd2:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100cd5:	01 d0                	add    eax,edx
 3100cd7:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:228
            input++;
 3100cdd:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:229
            free(temp);
 3100ce1:	83 ec 0c             	sub    esp,0xc
 3100ce4:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100ce7:	e8 e4 07 00 00       	call   31014d0 <kShell+0x5c6>
 3100cec:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:232
          }
	}
      while (*input != EOS);
 3100cef:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100cf2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100cf5:	84 c0                	test   al,al
 3100cf7:	0f 85 ed fd ff ff    	jne    3100aea <buildargv+0x5a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:235
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 3100cfd:	83 ec 0c             	sub    esp,0xc
 3100d00:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100d03:	e8 c8 07 00 00       	call   31014d0 <kShell+0x5c6>
 3100d08:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:236
  free(nargv);
 3100d0b:	83 ec 0c             	sub    esp,0xc
 3100d0e:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100d11:	e8 ba 07 00 00       	call   31014d0 <kShell+0x5c6>
 3100d16:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:237
  return (argv);
 3100d19:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/kshell/src/kshell.c:238
}
 3100d1c:	c9                   	leave  
 3100d1d:	c3                   	ret    

03100d1e <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:241

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
 3100d1e:	55                   	push   ebp
 3100d1f:	89 e5                	mov    ebp,esp
 3100d21:	53                   	push   ebx
 3100d22:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:242
    for (int cnt=0;cnt<pcount;cnt++)
 3100d25:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100d2c:	eb 56                	jmp    3100d84 <paramsToArgv+0x66>
/home/yogi/src/os/aproj/kshell/src/kshell.c:244 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 3100d2e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d31:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100d38:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100d3b:	8d 1c 02             	lea    ebx,[edx+eax*1]
 3100d3e:	83 ec 0c             	sub    esp,0xc
 3100d41:	68 80 00 00 00       	push   0x80
 3100d46:	e8 25 06 00 00       	call   3101370 <kShell+0x466>
 3100d4b:	83 c4 10             	add    esp,0x10
 3100d4e:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:245 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 3100d50:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d53:	c1 e0 07             	shl    eax,0x7
 3100d56:	89 c2                	mov    edx,eax
 3100d58:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100d5b:	01 c2                	add    edx,eax
 3100d5d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d60:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 3100d67:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100d6a:	01 c8                	add    eax,ecx
 3100d6c:	8b 00                	mov    eax,DWORD PTR [eax]
 3100d6e:	83 ec 04             	sub    esp,0x4
 3100d71:	68 80 00 00 00       	push   0x80
 3100d76:	52                   	push   edx
 3100d77:	50                   	push   eax
 3100d78:	e8 e3 05 00 00       	call   3101360 <kShell+0x456>
 3100d7d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:242 (discriminator 3)
  return (argv);
}

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100d80:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:242 (discriminator 1)
 3100d84:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d87:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100d8a:	7c a2                	jl     3100d2e <paramsToArgv+0x10>
/home/yogi/src/os/aproj/kshell/src/kshell.c:247
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 3100d8c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
/home/yogi/src/os/aproj/kshell/src/kshell.c:248
}
 3100d8f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100d92:	c9                   	leave  
 3100d93:	c3                   	ret    

03100d94 <freeArgV>:
freeArgV():
/home/yogi/src/os/aproj/kshell/src/kshell.c:251

void freeArgV(int pcount, char **params)
{
 3100d94:	55                   	push   ebp
 3100d95:	89 e5                	mov    ebp,esp
 3100d97:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:252
    for (int cnt=0;cnt<pcount;cnt++)
 3100d9a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100da1:	eb 15                	jmp    3100db8 <freeArgV+0x24>
/home/yogi/src/os/aproj/kshell/src/kshell.c:253 (discriminator 3)
        free(*params);
 3100da3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100da6:	8b 00                	mov    eax,DWORD PTR [eax]
 3100da8:	83 ec 0c             	sub    esp,0xc
 3100dab:	50                   	push   eax
 3100dac:	e8 1f 07 00 00       	call   31014d0 <kShell+0x5c6>
 3100db1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:252 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100db4:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:252 (discriminator 1)
 3100db8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100dbb:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100dbe:	7c e3                	jl     3100da3 <freeArgV+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:254
        free(*params);
    free(params);
 3100dc0:	83 ec 0c             	sub    esp,0xc
 3100dc3:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100dc6:	e8 05 07 00 00       	call   31014d0 <kShell+0x5c6>
 3100dcb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:255
}
 3100dce:	90                   	nop
 3100dcf:	c9                   	leave  
 3100dd0:	c3                   	ret    

03100dd1 <getEnvVariableValue>:
getEnvVariableValue():
/home/yogi/src/os/aproj/kshell/src/kshell.c:258

bool getEnvVariableValue(char* evName, char* value)
{
 3100dd1:	55                   	push   ebp
 3100dd2:	89 e5                	mov    ebp,esp
 3100dd4:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:260
    
    for (int cnt=0;cnt<50;cnt++)
 3100dd7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100dde:	eb 70                	jmp    3100e50 <getEnvVariableValue+0x7f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:262
    {
        if (environmentLoc[cnt]!=0)
 3100de0:	a1 4c 24 10 03       	mov    eax,ds:0x310244c
 3100de5:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100de8:	c1 e2 02             	shl    edx,0x2
 3100deb:	01 d0                	add    eax,edx
 3100ded:	8b 00                	mov    eax,DWORD PTR [eax]
 3100def:	85 c0                	test   eax,eax
 3100df1:	74 59                	je     3100e4c <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:264
        {
            char* idx = strstr((char*)environmentLoc[cnt],evName);
 3100df3:	a1 4c 24 10 03       	mov    eax,ds:0x310244c
 3100df8:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100dfb:	c1 e2 02             	shl    edx,0x2
 3100dfe:	01 d0                	add    eax,edx
 3100e00:	8b 00                	mov    eax,DWORD PTR [eax]
 3100e02:	83 ec 08             	sub    esp,0x8
 3100e05:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100e08:	50                   	push   eax
 3100e09:	e8 d2 05 00 00       	call   31013e0 <kShell+0x4d6>
 3100e0e:	83 c4 10             	add    esp,0x10
 3100e11:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:265
            if (idx>0)
 3100e14:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100e18:	74 32                	je     3100e4c <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:267
            {
                idx = strstr(idx,"=");
 3100e1a:	83 ec 08             	sub    esp,0x8
 3100e1d:	68 75 18 10 03       	push   0x3101875
 3100e22:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100e25:	e8 b6 05 00 00       	call   31013e0 <kShell+0x4d6>
 3100e2a:	83 c4 10             	add    esp,0x10
 3100e2d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:269
                //++ because we don't want to include the = sign
                strcpy(value, ++idx);
 3100e30:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100e34:	83 ec 08             	sub    esp,0x8
 3100e37:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100e3a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100e3d:	e8 be 04 00 00       	call   3101300 <kShell+0x3f6>
 3100e42:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:271
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
 3100e45:	b8 01 00 00 00       	mov    eax,0x1
 3100e4a:	eb 0f                	jmp    3100e5b <getEnvVariableValue+0x8a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:260 (discriminator 2)
}

bool getEnvVariableValue(char* evName, char* value)
{
    
    for (int cnt=0;cnt<50;cnt++)
 3100e4c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:260 (discriminator 1)
 3100e50:	83 7d f4 31          	cmp    DWORD PTR [ebp-0xc],0x31
 3100e54:	7e 8a                	jle    3100de0 <getEnvVariableValue+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:275
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
            }
        }
    } 
    return false;
 3100e56:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:276
}
 3100e5b:	c9                   	leave  
 3100e5c:	c3                   	ret    

03100e5d <saveCommand>:
saveCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:289
    
}
*/

void saveCommand(char* command)
{
 3100e5d:	55                   	push   ebp
 3100e5e:	89 e5                	mov    ebp,esp
 3100e60:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:290
    strcpy(commandHistory[commandHistoryMax++],command);
 3100e63:	a1 9c 27 10 03       	mov    eax,ds:0x310279c
 3100e68:	8d 50 01             	lea    edx,[eax+0x1]
 3100e6b:	89 15 9c 27 10 03    	mov    DWORD PTR ds:0x310279c,edx
 3100e71:	c1 e0 07             	shl    eax,0x7
 3100e74:	05 a0 27 10 03       	add    eax,0x31027a0
 3100e79:	83 ec 08             	sub    esp,0x8
 3100e7c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100e7f:	50                   	push   eax
 3100e80:	e8 7b 04 00 00       	call   3101300 <kShell+0x3f6>
 3100e85:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:291
}
 3100e88:	90                   	nop
 3100e89:	c9                   	leave  
 3100e8a:	c3                   	ret    

03100e8b <prompt>:
prompt():
/home/yogi/src/os/aproj/kshell/src/kshell.c:294

void prompt()
{
 3100e8b:	55                   	push   ebp
 3100e8c:	89 e5                	mov    ebp,esp
 3100e8e:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:295
    print("%s %s> ",sExecutingProgram, cwd);
 3100e91:	83 ec 04             	sub    esp,0x4
 3100e94:	68 60 24 10 03       	push   0x3102460
 3100e99:	68 60 25 10 03       	push   0x3102560
 3100e9e:	68 77 18 10 03       	push   0x3101877
 3100ea3:	e8 78 04 00 00       	call   3101320 <kShell+0x416>
 3100ea8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:296
}
 3100eab:	90                   	nop
 3100eac:	c9                   	leave  
 3100ead:	c3                   	ret    

03100eae <reprintCommand>:
reprintCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:299

int reprintCommand(char* command)
{
 3100eae:	55                   	push   ebp
 3100eaf:	89 e5                	mov    ebp,esp
 3100eb1:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:300
    resetRow();
 3100eb4:	e8 87 04 00 00       	call   3101340 <kShell+0x436>
/home/yogi/src/os/aproj/kshell/src/kshell.c:301
    prompt();
 3100eb9:	e8 cd ff ff ff       	call   3100e8b <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:302
    print("%s",command);
 3100ebe:	83 ec 08             	sub    esp,0x8
 3100ec1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100ec4:	68 7f 18 10 03       	push   0x310187f
 3100ec9:	e8 52 04 00 00       	call   3101320 <kShell+0x416>
 3100ece:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:304
 
}
 3100ed1:	90                   	nop
 3100ed2:	c9                   	leave  
 3100ed3:	c3                   	ret    

03100ed4 <handleSignals>:
handleSignals():
/home/yogi/src/os/aproj/kshell/src/kshell.c:307

int handleSignals(int signal)
{
 3100ed4:	55                   	push   ebp
 3100ed5:	89 e5                	mov    ebp,esp
/home/yogi/src/os/aproj/kshell/src/kshell.c:308
    switch (signal)
 3100ed7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100eda:	83 f8 08             	cmp    eax,0x8
 3100edd:	75 08                	jne    3100ee7 <handleSignals+0x13>
/home/yogi/src/os/aproj/kshell/src/kshell.c:311
    {
        case SIGINT:
            bSigIntReceived = true;
 3100edf:	c6 05 40 24 10 03 01 	mov    BYTE PTR ds:0x3102440,0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:312
            break;
 3100ee6:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:314
    }
}
 3100ee7:	90                   	nop
 3100ee8:	5d                   	pop    ebp
 3100ee9:	c3                   	ret    

03100eea <processSignal>:
processSignal():
/home/yogi/src/os/aproj/kshell/src/kshell.c:317

int processSignal(int signal)
{
 3100eea:	55                   	push   ebp
 3100eeb:	89 e5                	mov    ebp,esp
/home/yogi/src/os/aproj/kshell/src/kshell.c:318
    switch (signal)
 3100eed:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100ef0:	83 f8 08             	cmp    eax,0x8
 3100ef3:	75 0e                	jne    3100f03 <processSignal+0x19>
/home/yogi/src/os/aproj/kshell/src/kshell.c:322
    {
        case SIGINT:
            //printf("^C\n");
            bSigIntReceived = false;
 3100ef5:	c6 05 40 24 10 03 00 	mov    BYTE PTR ds:0x3102440,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:323
            return SIGINT;
 3100efc:	b8 08 00 00 00       	mov    eax,0x8
 3100f01:	eb 05                	jmp    3100f08 <processSignal+0x1e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:326
            break;
    }
    return 0;
 3100f03:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:327
}
 3100f08:	5d                   	pop    ebp
 3100f09:	c3                   	ret    

03100f0a <kShell>:
kShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:330

int kShell(int argc, char** argv, char** envp)
{
 3100f0a:	55                   	push   ebp
 3100f0b:	89 e5                	mov    ebp,esp
 3100f0d:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:331
    uint8_t lCurrKey=0;
 3100f10:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:332
    int lCurrKeyCount=0;
 3100f14:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:333
    int commandWasFromThisBufferPtr=0;
 3100f1b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:336
    char ansiSeq[20];

    bSigIntReceived = false;
 3100f22:	c6 05 40 24 10 03 00 	mov    BYTE PTR ds:0x3102440,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:337
    exitCode = 0;
 3100f29:	c7 05 88 27 10 03 00 	mov    DWORD PTR ds:0x3102788,0x0
 3100f30:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/kshell.c:338
    timeToExit = false;
 3100f33:	c6 05 94 27 10 03 00 	mov    BYTE PTR ds:0x3102794,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:339
    strcpy(delim," \t\n-,");
 3100f3a:	83 ec 08             	sub    esp,0x8
 3100f3d:	68 82 18 10 03       	push   0x3101882
 3100f42:	68 44 24 10 03       	push   0x3102444
 3100f47:	e8 b4 03 00 00       	call   3101300 <kShell+0x3f6>
 3100f4c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:340
    environmentLoc = envp;
 3100f4f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100f52:	a3 4c 24 10 03       	mov    ds:0x310244c,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:341
    ansiSeq[0]=0x1b;
 3100f57:	c6 45 d7 1b          	mov    BYTE PTR [ebp-0x29],0x1b
/home/yogi/src/os/aproj/kshell/src/kshell.c:342
    sKShellProgramName=malloc(1024);
 3100f5b:	83 ec 0c             	sub    esp,0xc
 3100f5e:	68 00 04 00 00       	push   0x400
 3100f63:	e8 08 04 00 00       	call   3101370 <kShell+0x466>
 3100f68:	83 c4 10             	add    esp,0x10
 3100f6b:	a3 8c 27 10 03       	mov    ds:0x310278c,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:343
    strcpy(sKShellProgramName,"kShell");
 3100f70:	a1 8c 27 10 03       	mov    eax,ds:0x310278c
 3100f75:	83 ec 08             	sub    esp,0x8
 3100f78:	68 88 18 10 03       	push   0x3101888
 3100f7d:	50                   	push   eax
 3100f7e:	e8 7d 03 00 00       	call   3101300 <kShell+0x3f6>
 3100f83:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:344
    strcpy(sExecutingProgram,sKShellProgramName);
 3100f86:	a1 8c 27 10 03       	mov    eax,ds:0x310278c
 3100f8b:	83 ec 08             	sub    esp,0x8
 3100f8e:	50                   	push   eax
 3100f8f:	68 60 25 10 03       	push   0x3102560
 3100f94:	e8 67 03 00 00       	call   3101300 <kShell+0x3f6>
 3100f99:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:347
    //puts("\nWelcome to kShell ... hang a while!\n");

    modifySignal(SIGINT, handleSignals, 0);
 3100f9c:	83 ec 04             	sub    esp,0x4
 3100f9f:	6a 00                	push   0x0
 3100fa1:	68 d4 0e 10 03       	push   0x3100ed4
 3100fa6:	6a 08                	push   0x8
 3100fa8:	e8 d3 04 00 00       	call   3101480 <kShell+0x576>
 3100fad:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:349
    
    while (!timeToExit)
 3100fb0:	e9 0f 03 00 00       	jmp    31012c4 <kShell+0x3ba>
/home/yogi/src/os/aproj/kshell/src/kshell.c:352
    {
getACommand:
        commandHistoryPtr = commandHistoryMax;
 3100fb5:	a1 9c 27 10 03       	mov    eax,ds:0x310279c
 3100fba:	a3 98 27 10 03       	mov    ds:0x3102798,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:353
        commandWasFromThisBufferPtr = -1;
 3100fbf:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:354
        lCurrKey=0;
 3100fc6:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:355
        lCurrKeyCount=0;
 3100fca:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:356
        memset(lCommand,0,256);
 3100fd1:	83 ec 04             	sub    esp,0x4
 3100fd4:	68 00 01 00 00       	push   0x100
 3100fd9:	6a 00                	push   0x0
 3100fdb:	68 a0 21 11 03       	push   0x31121a0
 3100fe0:	e8 6b 04 00 00       	call   3101450 <kShell+0x546>
 3100fe5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:357
        getenv("CWD",cwd);
 3100fe8:	83 ec 08             	sub    esp,0x8
 3100feb:	68 60 24 10 03       	push   0x3102460
 3100ff0:	68 8f 18 10 03       	push   0x310188f
 3100ff5:	e8 56 03 00 00       	call   3101350 <kShell+0x446>
 3100ffa:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:358
        prompt();
 3100ffd:	e8 89 fe ff ff       	call   3100e8b <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:360
getAKey:
        lCurrKey=0;
 3101002:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:361
        while(lCurrKey==0)
 3101006:	eb 52                	jmp    310105a <kShell+0x150>
/home/yogi/src/os/aproj/kshell/src/kshell.c:363
        {
            read(STDIN, &lCurrKey, 1, 1); //Reading from STDIN blocks until a key is available
 3101008:	6a 01                	push   0x1
 310100a:	6a 01                	push   0x1
 310100c:	8d 45 eb             	lea    eax,[ebp-0x15]
 310100f:	50                   	push   eax
 3101010:	6a 00                	push   0x0
 3101012:	e8 d9 03 00 00       	call   31013f0 <kShell+0x4e6>
 3101017:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:365
//            gets(&lCurrKey,1,1);
            if (bSigIntReceived)
 310101a:	0f b6 05 40 24 10 03 	movzx  eax,BYTE PTR ds:0x3102440
 3101021:	84 c0                	test   al,al
 3101023:	74 35                	je     310105a <kShell+0x150>
/home/yogi/src/os/aproj/kshell/src/kshell.c:367
            {
                if (processSignal(SIGINT)==SIGINT)
 3101025:	83 ec 0c             	sub    esp,0xc
 3101028:	6a 08                	push   0x8
 310102a:	e8 bb fe ff ff       	call   3100eea <processSignal>
 310102f:	83 c4 10             	add    esp,0x10
 3101032:	83 f8 08             	cmp    eax,0x8
 3101035:	75 23                	jne    310105a <kShell+0x150>
/home/yogi/src/os/aproj/kshell/src/kshell.c:369
                {
                    lCommand[0] = 0x0;
 3101037:	c6 05 a0 21 11 03 00 	mov    BYTE PTR ds:0x31121a0,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:370
                    lCurrKeyCount = 0;
 310103e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:371
                    printf("\n");
 3101045:	83 ec 0c             	sub    esp,0xc
 3101048:	68 93 18 10 03       	push   0x3101893
 310104d:	e8 de 02 00 00       	call   3101330 <kShell+0x426>
 3101052:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:372
                    prompt();
 3101055:	e8 31 fe ff ff       	call   3100e8b <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:361
        memset(lCommand,0,256);
        getenv("CWD",cwd);
        prompt();
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 310105a:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 310105e:	84 c0                	test   al,al
 3101060:	74 a6                	je     3101008 <kShell+0xfe>
/home/yogi/src/os/aproj/kshell/src/kshell.c:377
                    prompt();
                }
            }
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3101062:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 3101066:	3c c8                	cmp    al,0xc8
 3101068:	0f 85 95 00 00 00    	jne    3101103 <kShell+0x1f9>
/home/yogi/src/os/aproj/kshell/src/kshell.c:379
        {
            if (commandHistoryPtr>=0)
 310106e:	a1 98 27 10 03       	mov    eax,ds:0x3102798
 3101073:	85 c0                	test   eax,eax
 3101075:	78 8b                	js     3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:382
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
 3101077:	a1 98 27 10 03       	mov    eax,ds:0x3102798
 310107c:	83 e8 01             	sub    eax,0x1
 310107f:	85 c0                	test   eax,eax
 3101081:	0f 88 7b ff ff ff    	js     3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:384
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
 3101087:	a1 98 27 10 03       	mov    eax,ds:0x3102798
 310108c:	83 e8 01             	sub    eax,0x1
 310108f:	a3 98 27 10 03       	mov    ds:0x3102798,eax
 3101094:	a1 98 27 10 03       	mov    eax,ds:0x3102798
 3101099:	c1 e0 07             	shl    eax,0x7
 310109c:	05 a0 27 10 03       	add    eax,0x31027a0
 31010a1:	83 ec 08             	sub    esp,0x8
 31010a4:	50                   	push   eax
 31010a5:	68 a0 21 11 03       	push   0x31121a0
 31010aa:	e8 51 02 00 00       	call   3101300 <kShell+0x3f6>
 31010af:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:385
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 31010b2:	a1 98 27 10 03       	mov    eax,ds:0x3102798
 31010b7:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:386
                    while (lCurrKeyCount>0)
 31010ba:	eb 14                	jmp    31010d0 <kShell+0x1c6>
/home/yogi/src/os/aproj/kshell/src/kshell.c:388
                    {
                        printf(KEY_BACKSPACE);
 31010bc:	83 ec 0c             	sub    esp,0xc
 31010bf:	68 95 18 10 03       	push   0x3101895
 31010c4:	e8 67 02 00 00       	call   3101330 <kShell+0x426>
 31010c9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:389
                        lCurrKeyCount--;
 31010cc:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:386
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 31010d0:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31010d4:	7f e6                	jg     31010bc <kShell+0x1b2>
/home/yogi/src/os/aproj/kshell/src/kshell.c:391
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 31010d6:	83 ec 08             	sub    esp,0x8
 31010d9:	68 a0 21 11 03       	push   0x31121a0
 31010de:	68 7f 18 10 03       	push   0x310187f
 31010e3:	e8 48 02 00 00       	call   3101330 <kShell+0x426>
 31010e8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:392
                    lCurrKeyCount=strlen(lCommand);
 31010eb:	83 ec 0c             	sub    esp,0xc
 31010ee:	68 a0 21 11 03       	push   0x31121a0
 31010f3:	e8 b8 03 00 00       	call   31014b0 <kShell+0x5a6>
 31010f8:	83 c4 10             	add    esp,0x10
 31010fb:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:394
                }
                goto getAKey;
 31010fe:	e9 ff fe ff ff       	jmp    3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:399
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 3101103:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 3101107:	3c d0                	cmp    al,0xd0
 3101109:	0f 85 9e 00 00 00    	jne    31011ad <kShell+0x2a3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:401
        {
            if (commandHistoryPtr>=0)
 310110f:	a1 98 27 10 03       	mov    eax,ds:0x3102798
 3101114:	85 c0                	test   eax,eax
 3101116:	0f 88 e6 fe ff ff    	js     3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:404
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
 310111c:	a1 98 27 10 03       	mov    eax,ds:0x3102798
 3101121:	8d 50 01             	lea    edx,[eax+0x1]
 3101124:	a1 9c 27 10 03       	mov    eax,ds:0x310279c
 3101129:	39 c2                	cmp    edx,eax
 310112b:	0f 8d d1 fe ff ff    	jge    3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:406
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
 3101131:	a1 98 27 10 03       	mov    eax,ds:0x3102798
 3101136:	83 c0 01             	add    eax,0x1
 3101139:	a3 98 27 10 03       	mov    ds:0x3102798,eax
 310113e:	a1 98 27 10 03       	mov    eax,ds:0x3102798
 3101143:	c1 e0 07             	shl    eax,0x7
 3101146:	05 a0 27 10 03       	add    eax,0x31027a0
 310114b:	83 ec 08             	sub    esp,0x8
 310114e:	50                   	push   eax
 310114f:	68 a0 21 11 03       	push   0x31121a0
 3101154:	e8 a7 01 00 00       	call   3101300 <kShell+0x3f6>
 3101159:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:407
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 310115c:	a1 98 27 10 03       	mov    eax,ds:0x3102798
 3101161:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:408
                    while (lCurrKeyCount>0)
 3101164:	eb 14                	jmp    310117a <kShell+0x270>
/home/yogi/src/os/aproj/kshell/src/kshell.c:410
                    {
                        printf(KEY_BACKSPACE);
 3101166:	83 ec 0c             	sub    esp,0xc
 3101169:	68 95 18 10 03       	push   0x3101895
 310116e:	e8 bd 01 00 00       	call   3101330 <kShell+0x426>
 3101173:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:411
                        lCurrKeyCount--;
 3101176:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:408
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 310117a:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 310117e:	7f e6                	jg     3101166 <kShell+0x25c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:413
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 3101180:	83 ec 08             	sub    esp,0x8
 3101183:	68 a0 21 11 03       	push   0x31121a0
 3101188:	68 7f 18 10 03       	push   0x310187f
 310118d:	e8 9e 01 00 00       	call   3101330 <kShell+0x426>
 3101192:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:414
                    lCurrKeyCount=strlen(lCommand);
 3101195:	83 ec 0c             	sub    esp,0xc
 3101198:	68 a0 21 11 03       	push   0x31121a0
 310119d:	e8 0e 03 00 00       	call   31014b0 <kShell+0x5a6>
 31011a2:	83 c4 10             	add    esp,0x10
 31011a5:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:416
                }
                goto getAKey;
 31011a8:	e9 55 fe ff ff       	jmp    3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:421
            }
            else
                goto getAKey;
        }   
        else if (lCurrKey==0xcb) //left
 31011ad:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31011b1:	3c cb                	cmp    al,0xcb
 31011b3:	75 1f                	jne    31011d4 <kShell+0x2ca>
/home/yogi/src/os/aproj/kshell/src/kshell.c:423
        {
            if (lCurrKeyCount>0)
 31011b5:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31011b9:	0f 8e 43 fe ff ff    	jle    3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:425
            {
                print("\033[1D");
 31011bf:	83 ec 0c             	sub    esp,0xc
 31011c2:	68 9f 18 10 03       	push   0x310189f
 31011c7:	e8 54 01 00 00       	call   3101320 <kShell+0x416>
 31011cc:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:428
            }
             
            goto getAKey;
 31011cf:	e9 2e fe ff ff       	jmp    3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:430
        }
        else if (lCurrKey==0xcd) //right
 31011d4:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31011d8:	3c cd                	cmp    al,0xcd
 31011da:	75 15                	jne    31011f1 <kShell+0x2e7>
/home/yogi/src/os/aproj/kshell/src/kshell.c:432
        {
            print("\033[1C");
 31011dc:	83 ec 0c             	sub    esp,0xc
 31011df:	68 a4 18 10 03       	push   0x31018a4
 31011e4:	e8 37 01 00 00       	call   3101320 <kShell+0x416>
 31011e9:	83 c4 10             	add    esp,0x10
 31011ec:	e9 11 fe ff ff       	jmp    3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:434
        }
        else if (lCurrKey=='\b') //backspace
 31011f1:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31011f5:	3c 08                	cmp    al,0x8
 31011f7:	75 32                	jne    310122b <kShell+0x321>
/home/yogi/src/os/aproj/kshell/src/kshell.c:436
        {
            if (lCurrKeyCount-1 >= 0)
 31011f9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31011fc:	83 e8 01             	sub    eax,0x1
 31011ff:	85 c0                	test   eax,eax
 3101201:	0f 88 fb fd ff ff    	js     3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:438
            {
                lCurrKeyCount--;
 3101207:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:439
                lCommand[lCurrKeyCount]='\0';
 310120b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310120e:	05 a0 21 11 03       	add    eax,0x31121a0
 3101213:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:440
                printf(KEY_BACKSPACE);
 3101216:	83 ec 0c             	sub    esp,0xc
 3101219:	68 95 18 10 03       	push   0x3101895
 310121e:	e8 0d 01 00 00       	call   3101330 <kShell+0x426>
 3101223:	83 c4 10             	add    esp,0x10
 3101226:	e9 d7 fd ff ff       	jmp    3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:443
            }
        }
        else if (lCurrKey==0xa) //Enter
 310122b:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 310122f:	3c 0a                	cmp    al,0xa
 3101231:	75 21                	jne    3101254 <kShell+0x34a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:445
        {
            print("\n");
 3101233:	83 ec 0c             	sub    esp,0xc
 3101236:	68 93 18 10 03       	push   0x3101893
 310123b:	e8 e0 00 00 00       	call   3101320 <kShell+0x416>
 3101240:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:446
            goto doneGettingKeys;
 3101243:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:459
            commandWasFromThisBufferPtr=-1;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 3101244:	0f b6 05 a0 21 11 03 	movzx  eax,BYTE PTR ds:0x31121a0
 310124b:	84 c0                	test   al,al
 310124d:	75 3c                	jne    310128b <kShell+0x381>
 310124f:	e9 61 fd ff ff       	jmp    3100fb5 <kShell+0xab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:450
            print("\n");
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3101254:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101257:	8d 50 01             	lea    edx,[eax+0x1]
 310125a:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310125d:	0f b6 55 eb          	movzx  edx,BYTE PTR [ebp-0x15]
 3101261:	88 90 a0 21 11 03    	mov    BYTE PTR [eax+0x31121a0],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:452
            //reprintCommand(lCommand);
            printf("%c",lCurrKey);
 3101267:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 310126b:	0f b6 c0             	movzx  eax,al
 310126e:	83 ec 08             	sub    esp,0x8
 3101271:	50                   	push   eax
 3101272:	68 a9 18 10 03       	push   0x31018a9
 3101277:	e8 b4 00 00 00       	call   3101330 <kShell+0x426>
 310127c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:454
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
 310127f:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:456
        }
        goto getAKey;
 3101286:	e9 77 fd ff ff       	jmp    3101002 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:461
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
            goto getACommand;
        if (commandWasFromThisBufferPtr == -1)
 310128b:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
 310128f:	75 10                	jne    31012a1 <kShell+0x397>
/home/yogi/src/os/aproj/kshell/src/kshell.c:462
            saveCommand(lCommand);
 3101291:	83 ec 0c             	sub    esp,0xc
 3101294:	68 a0 21 11 03       	push   0x31121a0
 3101299:	e8 bf fb ff ff       	call   3100e5d <saveCommand>
 310129e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:463
        int i = findCommand(lCommand);
 31012a1:	83 ec 0c             	sub    esp,0xc
 31012a4:	68 a0 21 11 03       	push   0x31121a0
 31012a9:	e8 79 f7 ff ff       	call   3100a27 <findCommand>
 31012ae:	83 c4 10             	add    esp,0x10
 31012b1:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:464
        execInternalCommand(lCommand);
 31012b4:	83 ec 0c             	sub    esp,0xc
 31012b7:	68 a0 21 11 03       	push   0x31121a0
 31012bc:	e8 17 f5 ff ff       	call   31007d8 <execInternalCommand>
 31012c1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:349
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    modifySignal(SIGINT, handleSignals, 0);
    
    while (!timeToExit)
 31012c4:	0f b6 05 94 27 10 03 	movzx  eax,BYTE PTR ds:0x3102794
 31012cb:	83 f0 01             	xor    eax,0x1
 31012ce:	84 c0                	test   al,al
 31012d0:	0f 85 df fc ff ff    	jne    3100fb5 <kShell+0xab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:466
        if (commandWasFromThisBufferPtr == -1)
            saveCommand(lCommand);
        int i = findCommand(lCommand);
        execInternalCommand(lCommand);
    }
    free(sKShellProgramName);
 31012d6:	a1 8c 27 10 03       	mov    eax,ds:0x310278c
 31012db:	83 ec 0c             	sub    esp,0xc
 31012de:	50                   	push   eax
 31012df:	e8 ec 01 00 00       	call   31014d0 <kShell+0x5c6>
 31012e4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:467
    return exitCode;
 31012e7:	a1 88 27 10 03       	mov    eax,ds:0x3102788
/home/yogi/src/os/aproj/kshell/src/kshell.c:468
}
 31012ec:	c9                   	leave  
 31012ed:	c3                   	ret    

Disassembly of section .plt:

031012f0 <.plt>:
 31012f0:	ff 35 b4 23 10 03    	push   DWORD PTR ds:0x31023b4
 31012f6:	ff 25 b8 23 10 03    	jmp    DWORD PTR ds:0x31023b8
 31012fc:	00 00                	add    BYTE PTR [eax],al
 31012fe:	00 00                	add    BYTE PTR [eax],al
 3101300:	ff 25 bc 23 10 03    	jmp    DWORD PTR ds:0x31023bc
 3101306:	68 00 00 00 00       	push   0x0
 310130b:	e9 e0 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101310:	ff 25 c0 23 10 03    	jmp    DWORD PTR ds:0x31023c0
 3101316:	68 08 00 00 00       	push   0x8
 310131b:	e9 d0 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101320:	ff 25 c4 23 10 03    	jmp    DWORD PTR ds:0x31023c4
 3101326:	68 10 00 00 00       	push   0x10
 310132b:	e9 c0 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101330:	ff 25 c8 23 10 03    	jmp    DWORD PTR ds:0x31023c8
 3101336:	68 18 00 00 00       	push   0x18
 310133b:	e9 b0 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101340:	ff 25 cc 23 10 03    	jmp    DWORD PTR ds:0x31023cc
 3101346:	68 20 00 00 00       	push   0x20
 310134b:	e9 a0 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101350:	ff 25 d0 23 10 03    	jmp    DWORD PTR ds:0x31023d0
 3101356:	68 28 00 00 00       	push   0x28
 310135b:	e9 90 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101360:	ff 25 d4 23 10 03    	jmp    DWORD PTR ds:0x31023d4
 3101366:	68 30 00 00 00       	push   0x30
 310136b:	e9 80 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101370:	ff 25 d8 23 10 03    	jmp    DWORD PTR ds:0x31023d8
 3101376:	68 38 00 00 00       	push   0x38
 310137b:	e9 70 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101380:	ff 25 dc 23 10 03    	jmp    DWORD PTR ds:0x31023dc
 3101386:	68 40 00 00 00       	push   0x40
 310138b:	e9 60 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101390:	ff 25 e0 23 10 03    	jmp    DWORD PTR ds:0x31023e0
 3101396:	68 48 00 00 00       	push   0x48
 310139b:	e9 50 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 31013a0:	ff 25 e4 23 10 03    	jmp    DWORD PTR ds:0x31023e4
 31013a6:	68 50 00 00 00       	push   0x50
 31013ab:	e9 40 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 31013b0:	ff 25 e8 23 10 03    	jmp    DWORD PTR ds:0x31023e8
 31013b6:	68 58 00 00 00       	push   0x58
 31013bb:	e9 30 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 31013c0:	ff 25 ec 23 10 03    	jmp    DWORD PTR ds:0x31023ec
 31013c6:	68 60 00 00 00       	push   0x60
 31013cb:	e9 20 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 31013d0:	ff 25 f0 23 10 03    	jmp    DWORD PTR ds:0x31023f0
 31013d6:	68 68 00 00 00       	push   0x68
 31013db:	e9 10 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 31013e0:	ff 25 f4 23 10 03    	jmp    DWORD PTR ds:0x31023f4
 31013e6:	68 70 00 00 00       	push   0x70
 31013eb:	e9 00 ff ff ff       	jmp    31012f0 <kShell+0x3e6>
 31013f0:	ff 25 f8 23 10 03    	jmp    DWORD PTR ds:0x31023f8
 31013f6:	68 78 00 00 00       	push   0x78
 31013fb:	e9 f0 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101400:	ff 25 fc 23 10 03    	jmp    DWORD PTR ds:0x31023fc
 3101406:	68 80 00 00 00       	push   0x80
 310140b:	e9 e0 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101410:	ff 25 00 24 10 03    	jmp    DWORD PTR ds:0x3102400
 3101416:	68 88 00 00 00       	push   0x88
 310141b:	e9 d0 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101420:	ff 25 04 24 10 03    	jmp    DWORD PTR ds:0x3102404
 3101426:	68 90 00 00 00       	push   0x90
 310142b:	e9 c0 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101430:	ff 25 08 24 10 03    	jmp    DWORD PTR ds:0x3102408
 3101436:	68 98 00 00 00       	push   0x98
 310143b:	e9 b0 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101440:	ff 25 0c 24 10 03    	jmp    DWORD PTR ds:0x310240c
 3101446:	68 a0 00 00 00       	push   0xa0
 310144b:	e9 a0 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101450:	ff 25 10 24 10 03    	jmp    DWORD PTR ds:0x3102410
 3101456:	68 a8 00 00 00       	push   0xa8
 310145b:	e9 90 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101460:	ff 25 14 24 10 03    	jmp    DWORD PTR ds:0x3102414
 3101466:	68 b0 00 00 00       	push   0xb0
 310146b:	e9 80 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101470:	ff 25 18 24 10 03    	jmp    DWORD PTR ds:0x3102418
 3101476:	68 b8 00 00 00       	push   0xb8
 310147b:	e9 70 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101480:	ff 25 1c 24 10 03    	jmp    DWORD PTR ds:0x310241c
 3101486:	68 c0 00 00 00       	push   0xc0
 310148b:	e9 60 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 3101490:	ff 25 20 24 10 03    	jmp    DWORD PTR ds:0x3102420
 3101496:	68 c8 00 00 00       	push   0xc8
 310149b:	e9 50 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 31014a0:	ff 25 24 24 10 03    	jmp    DWORD PTR ds:0x3102424
 31014a6:	68 d0 00 00 00       	push   0xd0
 31014ab:	e9 40 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 31014b0:	ff 25 28 24 10 03    	jmp    DWORD PTR ds:0x3102428
 31014b6:	68 d8 00 00 00       	push   0xd8
 31014bb:	e9 30 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 31014c0:	ff 25 2c 24 10 03    	jmp    DWORD PTR ds:0x310242c
 31014c6:	68 e0 00 00 00       	push   0xe0
 31014cb:	e9 20 fe ff ff       	jmp    31012f0 <kShell+0x3e6>
 31014d0:	ff 25 30 24 10 03    	jmp    DWORD PTR ds:0x3102430
 31014d6:	68 e8 00 00 00       	push   0xe8
 31014db:	e9 10 fe ff ff       	jmp    31012f0 <kShell+0x3e6>

Disassembly of section .rodata:

031014e0 <.rodata>:
 31014e0:	63 6c 65 61          	arpl   WORD PTR [ebp+eiz*2+0x61],bp
 31014e4:	72 00                	jb     31014e6 <kShell+0x5dc>
 31014e6:	43                   	inc    ebx
 31014e7:	6c                   	ins    BYTE PTR es:[edi],dx
 31014e8:	65                   	gs
 31014e9:	61                   	popa   
 31014ea:	72 20                	jb     310150c <kShell+0x602>
 31014ec:	74 68                	je     3101556 <kShell+0x64c>
 31014ee:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 31014f2:	72 65                	jb     3101559 <kShell+0x64f>
 31014f4:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31014f6:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 31014f9:	76 00                	jbe    31014fb <kShell+0x5f1>
 31014fb:	50                   	push   eax
 31014fc:	72 69                	jb     3101567 <kShell+0x65d>
 31014fe:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31014ff:	74 20                	je     3101521 <kShell+0x617>
 3101501:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101503:	76 69                	jbe    310156e <kShell+0x664>
 3101505:	72 6f                	jb     3101576 <kShell+0x66c>
 3101507:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101508:	6d                   	ins    DWORD PTR es:[edi],dx
 3101509:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 310150b:	74 00                	je     310150d <kShell+0x603>
 310150d:	65                   	gs
 310150e:	78 65                	js     3101575 <kShell+0x66b>
 3101510:	63 00                	arpl   WORD PTR [eax],ax
 3101512:	45                   	inc    ebp
 3101513:	78 65                	js     310157a <kShell+0x670>
 3101515:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101518:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 310151c:	70 72                	jo     3101590 <kShell+0x686>
 310151e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310151f:	67 72 61             	addr16 jb 3101583 <kShell+0x679>
 3101522:	6d                   	ins    DWORD PTR es:[edi],dx
 3101523:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101526:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 310152d:	20 
 310152e:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3101532:	6c                   	ins    BYTE PTR es:[edi],dx
 3101533:	6c                   	ins    BYTE PTR es:[edi],dx
 3101534:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101537:	6c                   	ins    BYTE PTR es:[edi],dx
 3101538:	70 00                	jo     310153a <kShell+0x630>
 310153a:	47                   	inc    edi
 310153b:	65                   	gs
 310153c:	74 20                	je     310155e <kShell+0x654>
 310153e:	68 65 6c 70 20       	push   0x20706c65
 3101543:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101547:	73 20                	jae    3101569 <kShell+0x65f>
 3101549:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3101550:	74 69                	je     31015bb <kShell+0x6b1>
 3101552:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101553:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101554:	29 00                	sub    DWORD PTR [eax],eax
 3101556:	70 77                	jo     31015cf <kShell+0x6c5>
 3101558:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 310155c:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3101563:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3101567:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 310156b:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3101570:	79 00                	jns    3101572 <kShell+0x668>
 3101572:	72 65                	jb     31015d9 <kShell+0x6cf>
 3101574:	70 65                	jo     31015db <kShell+0x6d1>
 3101576:	61                   	popa   
 3101577:	74 00                	je     3101579 <kShell+0x66f>
 3101579:	52                   	push   edx
 310157a:	65                   	gs
 310157b:	70 65                	jo     31015e2 <kShell+0x6d8>
 310157d:	61                   	popa   
 310157e:	74 20                	je     31015a0 <kShell+0x696>
 3101580:	61                   	popa   
 3101581:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 3101584:	6d                   	ins    DWORD PTR es:[edi],dx
 3101585:	6d                   	ins    DWORD PTR es:[edi],dx
 3101586:	61                   	popa   
 3101587:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101588:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 310158c:	74 69                	je     31015f7 <kShell+0x6ed>
 310158e:	6d                   	ins    DWORD PTR es:[edi],dx
 310158f:	65                   	gs
 3101590:	73 00                	jae    3101592 <kShell+0x688>
 3101592:	73 65                	jae    31015f9 <kShell+0x6ef>
 3101594:	74 00                	je     3101596 <kShell+0x68c>
 3101596:	53                   	push   ebx
 3101597:	65                   	gs
 3101598:	74 20                	je     31015ba <kShell+0x6b0>
 310159a:	61                   	popa   
 310159b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310159c:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 310159f:	76 69                	jbe    310160a <kShell+0x700>
 31015a1:	72 6f                	jb     3101612 <kShell+0x708>
 31015a3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31015a4:	6d                   	ins    DWORD PTR es:[edi],dx
 31015a5:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31015a7:	74 20                	je     31015c9 <kShell+0x6bf>
 31015a9:	76 61                	jbe    310160c <kShell+0x702>
 31015ab:	72 69                	jb     3101616 <kShell+0x70c>
 31015ad:	61                   	popa   
 31015ae:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 31015b2:	73 6c                	jae    3101620 <kShell+0x716>
 31015b4:	65                   	gs
 31015b5:	65                   	gs
 31015b6:	70 00                	jo     31015b8 <kShell+0x6ae>
 31015b8:	53                   	push   ebx
 31015b9:	6c                   	ins    BYTE PTR es:[edi],dx
 31015ba:	65                   	gs
 31015bb:	65                   	gs
 31015bc:	70 20                	jo     31015de <kShell+0x6d4>
 31015be:	66 6f                	outs   dx,WORD PTR ds:[esi]
 31015c0:	72 20                	jb     31015e2 <kShell+0x6d8>
 31015c2:	78 20                	js     31015e4 <kShell+0x6da>
 31015c4:	73 65                	jae    310162b <kShell+0x721>
 31015c6:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 31015c9:	64                   	fs
 31015ca:	73 00                	jae    31015cc <kShell+0x6c2>
 31015cc:	74 69                	je     3101637 <kShell+0x72d>
 31015ce:	6d                   	ins    DWORD PTR es:[edi],dx
 31015cf:	65 00 00             	add    BYTE PTR gs:[eax],al
 31015d2:	00 00                	add    BYTE PTR [eax],al
 31015d4:	54                   	push   esp
 31015d5:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 31015dc:	72 6f                	jb     310164d <kShell+0x743>
 31015de:	67 72 61             	addr16 jb 3101642 <kShell+0x738>
 31015e1:	6d                   	ins    DWORD PTR es:[edi],dx
 31015e2:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 31015e5:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 31015ec:	72 
 31015ed:	75 6e                	jne    310165d <kShell+0x753>
 31015ef:	73 2e                	jae    310161f <kShell+0x715>
 31015f1:	0a 09                	or     cl,BYTE PTR [ecx]
 31015f3:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 31015f6:	61                   	popa   
 31015f7:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 31015fb:	74 69                	je     3101666 <kShell+0x75c>
 31015fd:	6d                   	ins    DWORD PTR es:[edi],dx
 31015fe:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 3101602:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101603:	67 72 61             	addr16 jb 3101667 <kShell+0x75d>
 3101606:	6d                   	ins    DWORD PTR es:[edi],dx
 3101607:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 310160a:	61                   	popa   
 310160b:	72 61                	jb     310166e <kShell+0x764>
 310160d:	6d                   	ins    DWORD PTR es:[edi],dx
 310160e:	65                   	gs
 310160f:	74 65                	je     3101676 <kShell+0x76c>
 3101611:	72 73                	jb     3101686 <kShell+0x77c>
 3101613:	5d                   	pop    ebp
 3101614:	00 1b                	add    BYTE PTR [ebx],bl
 3101616:	5b                   	pop    ebx
 3101617:	32 4a 00             	xor    cl,BYTE PTR [edx+0x0]
 310161a:	25 73 0a 00 3d       	and    eax,0x3d000a73
 310161f:	00 55 73             	add    BYTE PTR [ebp+0x73],dl
 3101622:	61                   	popa   
 3101623:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 3101627:	73 65                	jae    310168e <kShell+0x784>
 3101629:	74 20                	je     310164b <kShell+0x741>
 310162b:	76 61                	jbe    310168e <kShell+0x784>
 310162d:	72 69                	jb     3101698 <kShell+0x78e>
 310162f:	61                   	popa   
 3101630:	62 6c 65 3d          	bound  ebp,QWORD PTR [ebp+eiz*2+0x3d]
 3101634:	76 61                	jbe    3101697 <kShell+0x78d>
 3101636:	6c                   	ins    BYTE PTR es:[edi],dx
 3101637:	75 65                	jne    310169e <kShell+0x794>
 3101639:	0a 00                	or     al,BYTE PTR [eax]
 310163b:	4c                   	dec    esp
 310163c:	41                   	inc    ecx
 310163d:	53                   	push   ebx
 310163e:	54                   	push   esp
 310163f:	45                   	inc    ebp
 3101640:	58                   	pop    eax
 3101641:	49                   	dec    ecx
 3101642:	54                   	push   esp
 3101643:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3101646:	72 6f                	jb     31016b7 <kShell+0x7ad>
 3101648:	72 20                	jb     310166a <kShell+0x760>
 310164a:	65                   	gs
 310164b:	78 65                	js     31016b2 <kShell+0x7a8>
 310164d:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101650:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3101657:	00 6b 65             	add    BYTE PTR [ebx+0x65],ch
 310165a:	78 65                	js     31016c1 <kShell+0x7b7>
 310165c:	63 3a                	arpl   WORD PTR [edx],di
 310165e:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
 3101661:	76 61                	jbe    31016c4 <kShell+0x7ba>
 3101663:	6c                   	ins    BYTE PTR es:[edi],dx
 3101664:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 310166b:	61 
 310166c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310166d:	64 0a 00             	or     al,BYTE PTR fs:[eax]
 3101670:	46                   	inc    esi
 3101671:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101672:	72 6b                	jb     31016df <kShell+0x7d5>
 3101674:	20 65 72             	and    BYTE PTR [ebp+0x72],ah
 3101677:	72 6f                	jb     31016e8 <kShell+0x7de>
 3101679:	72 20                	jb     310169b <kShell+0x791>
 310167b:	25 75 00 65 78       	and    eax,0x78650075
 3101680:	65 63 54 69 6d       	arpl   WORD PTR gs:[ecx+ebp*2+0x6d],dx
 3101685:	65 3a 20             	cmp    ah,BYTE PTR gs:[eax]
 3101688:	43                   	inc    ebx
 3101689:	61                   	popa   
 310168a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310168b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310168c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310168d:	74 20                	je     31016af <kShell+0x7a5>
 310168f:	65                   	gs
 3101690:	78 65                	js     31016f7 <kShell+0x7ed>
 3101692:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101695:	65 20 25 73 0a 00 0a 	and    BYTE PTR gs:0xa000a73,ah
 310169c:	25 75 20 74 69       	and    eax,0x69742075
 31016a1:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 31016a4:	0a 00                	or     al,BYTE PTR [eax]
 31016a6:	00 00                	add    BYTE PTR [eax],al
 31016a8:	0a 2a                	or     ch,BYTE PTR [edx]
 31016aa:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016ac:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016ae:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016b0:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016b2:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016b4:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016b6:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016b8:	20 52 45             	and    BYTE PTR [edx+0x45],dl
 31016bb:	50                   	push   eax
 31016bc:	45                   	inc    ebp
 31016bd:	41                   	inc    ecx
 31016be:	54                   	push   esp
 31016bf:	20 45 58             	and    BYTE PTR [ebp+0x58],al
 31016c2:	45                   	inc    ebp
 31016c3:	43                   	inc    ebx
 31016c4:	55                   	push   ebp
 31016c5:	54                   	push   esp
 31016c6:	49                   	dec    ecx
 31016c7:	4f                   	dec    edi
 31016c8:	4e                   	dec    esi
 31016c9:	20 23                	and    BYTE PTR [ebx],ah
 31016cb:	25 75 20 6f 66       	and    eax,0x666f2075
 31016d0:	20 25 75 20 2a 2a    	and    BYTE PTR ds:0x2a2a2075,ah
 31016d6:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016d8:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016da:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016dc:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016de:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016e0:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016e2:	2a 0a                	sub    cl,BYTE PTR [edx]
 31016e4:	00 48 65             	add    BYTE PTR [eax+0x65],cl
 31016e7:	6c                   	ins    BYTE PTR es:[edi],dx
 31016e8:	70 3a                	jo     3101724 <kShell+0x81a>
 31016ea:	20 25 73 0a 00 09    	and    BYTE PTR ds:0x9000a73,ah
 31016f0:	25 73 3a 20 25       	and    eax,0x25203a73
 31016f5:	73 0a                	jae    3101701 <kShell+0x7f7>
 31016f7:	00 75 68             	add    BYTE PTR [ebp+0x68],dh
 31016fa:	20 6f 68             	and    BYTE PTR [edi+0x68],ch
 31016fd:	21 00                	and    DWORD PTR [eax],eax
 31016ff:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 3101702:	71 75                	jno    3101779 <kShell+0x86f>
 3101704:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 310170b:	70 61                	jo     310176e <kShell+0x864>
 310170d:	72 61                	jb     3101770 <kShell+0x866>
 310170f:	6d                   	ins    DWORD PTR es:[edi],dx
 3101710:	65                   	gs
 3101711:	74 65                	je     3101778 <kShell+0x86e>
 3101713:	72 20                	jb     3101735 <kShell+0x82b>
 3101715:	77 68                	ja     310177f <kShell+0x875>
 3101717:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 310171e:	74 68                	je     3101788 <kShell+0x87e>
 3101720:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 3101724:	6d                   	ins    DWORD PTR es:[edi],dx
 3101725:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 3101728:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 310172b:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 310172e:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101731:	64                   	fs
 3101732:	73 20                	jae    3101754 <kShell+0x84a>
 3101734:	74 6f                	je     31017a5 <kShell+0x89b>
 3101736:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3101739:	65                   	gs
 310173a:	65                   	gs
 310173b:	70 0a                	jo     3101747 <kShell+0x83d>
 310173d:	00 00                	add    BYTE PTR [eax],al
 310173f:	00 63 6c             	add    BYTE PTR [ebx+0x6c],ah
 3101742:	65                   	gs
 3101743:	61                   	popa   
 3101744:	72 00                	jb     3101746 <kShell+0x83c>
 3101746:	43                   	inc    ebx
 3101747:	6c                   	ins    BYTE PTR es:[edi],dx
 3101748:	65                   	gs
 3101749:	61                   	popa   
 310174a:	72 20                	jb     310176c <kShell+0x862>
 310174c:	74 68                	je     31017b6 <kShell+0x8ac>
 310174e:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 3101752:	72 65                	jb     31017b9 <kShell+0x8af>
 3101754:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101756:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 3101759:	76 00                	jbe    310175b <kShell+0x851>
 310175b:	50                   	push   eax
 310175c:	72 69                	jb     31017c7 <kShell+0x8bd>
 310175e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310175f:	74 20                	je     3101781 <kShell+0x877>
 3101761:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101763:	76 69                	jbe    31017ce <kShell+0x8c4>
 3101765:	72 6f                	jb     31017d6 <kShell+0x8cc>
 3101767:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101768:	6d                   	ins    DWORD PTR es:[edi],dx
 3101769:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 310176b:	74 00                	je     310176d <kShell+0x863>
 310176d:	65                   	gs
 310176e:	78 65                	js     31017d5 <kShell+0x8cb>
 3101770:	63 00                	arpl   WORD PTR [eax],ax
 3101772:	45                   	inc    ebp
 3101773:	78 65                	js     31017da <kShell+0x8d0>
 3101775:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101778:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 310177c:	70 72                	jo     31017f0 <kShell+0x8e6>
 310177e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310177f:	67 72 61             	addr16 jb 31017e3 <kShell+0x8d9>
 3101782:	6d                   	ins    DWORD PTR es:[edi],dx
 3101783:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101786:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 310178d:	20 
 310178e:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3101792:	6c                   	ins    BYTE PTR es:[edi],dx
 3101793:	6c                   	ins    BYTE PTR es:[edi],dx
 3101794:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101797:	6c                   	ins    BYTE PTR es:[edi],dx
 3101798:	70 00                	jo     310179a <kShell+0x890>
 310179a:	47                   	inc    edi
 310179b:	65                   	gs
 310179c:	74 20                	je     31017be <kShell+0x8b4>
 310179e:	68 65 6c 70 20       	push   0x20706c65
 31017a3:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 31017a7:	73 20                	jae    31017c9 <kShell+0x8bf>
 31017a9:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 31017b0:	74 69                	je     310181b <kShell+0x911>
 31017b2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31017b3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31017b4:	29 00                	sub    DWORD PTR [eax],eax
 31017b6:	70 77                	jo     310182f <kShell+0x925>
 31017b8:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 31017bc:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 31017c3:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 31017c7:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 31017cb:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 31017d0:	79 00                	jns    31017d2 <kShell+0x8c8>
 31017d2:	72 65                	jb     3101839 <kShell+0x92f>
 31017d4:	70 65                	jo     310183b <kShell+0x931>
 31017d6:	61                   	popa   
 31017d7:	74 00                	je     31017d9 <kShell+0x8cf>
 31017d9:	52                   	push   edx
 31017da:	65                   	gs
 31017db:	70 65                	jo     3101842 <kShell+0x938>
 31017dd:	61                   	popa   
 31017de:	74 20                	je     3101800 <kShell+0x8f6>
 31017e0:	61                   	popa   
 31017e1:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 31017e4:	6d                   	ins    DWORD PTR es:[edi],dx
 31017e5:	6d                   	ins    DWORD PTR es:[edi],dx
 31017e6:	61                   	popa   
 31017e7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31017e8:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 31017ec:	74 69                	je     3101857 <kShell+0x94d>
 31017ee:	6d                   	ins    DWORD PTR es:[edi],dx
 31017ef:	65                   	gs
 31017f0:	73 00                	jae    31017f2 <kShell+0x8e8>
 31017f2:	73 65                	jae    3101859 <kShell+0x94f>
 31017f4:	74 00                	je     31017f6 <kShell+0x8ec>
 31017f6:	53                   	push   ebx
 31017f7:	65                   	gs
 31017f8:	74 20                	je     310181a <kShell+0x910>
 31017fa:	61                   	popa   
 31017fb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31017fc:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 31017ff:	76 69                	jbe    310186a <kShell+0x960>
 3101801:	72 6f                	jb     3101872 <kShell+0x968>
 3101803:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101804:	6d                   	ins    DWORD PTR es:[edi],dx
 3101805:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101807:	74 20                	je     3101829 <kShell+0x91f>
 3101809:	76 61                	jbe    310186c <kShell+0x962>
 310180b:	72 69                	jb     3101876 <kShell+0x96c>
 310180d:	61                   	popa   
 310180e:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 3101812:	73 6c                	jae    3101880 <kShell+0x976>
 3101814:	65                   	gs
 3101815:	65                   	gs
 3101816:	70 00                	jo     3101818 <kShell+0x90e>
 3101818:	53                   	push   ebx
 3101819:	6c                   	ins    BYTE PTR es:[edi],dx
 310181a:	65                   	gs
 310181b:	65                   	gs
 310181c:	70 20                	jo     310183e <kShell+0x934>
 310181e:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3101820:	72 20                	jb     3101842 <kShell+0x938>
 3101822:	78 20                	js     3101844 <kShell+0x93a>
 3101824:	73 65                	jae    310188b <kShell+0x981>
 3101826:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101829:	64                   	fs
 310182a:	73 00                	jae    310182c <kShell+0x922>
 310182c:	74 69                	je     3101897 <kShell+0x98d>
 310182e:	6d                   	ins    DWORD PTR es:[edi],dx
 310182f:	65 00 00             	add    BYTE PTR gs:[eax],al
 3101832:	00 00                	add    BYTE PTR [eax],al
 3101834:	54                   	push   esp
 3101835:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 310183c:	72 6f                	jb     31018ad <kShell+0x9a3>
 310183e:	67 72 61             	addr16 jb 31018a2 <kShell+0x998>
 3101841:	6d                   	ins    DWORD PTR es:[edi],dx
 3101842:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3101845:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 310184c:	72 
 310184d:	75 6e                	jne    31018bd <kShell+0x9b3>
 310184f:	73 2e                	jae    310187f <kShell+0x975>
 3101851:	0a 09                	or     cl,BYTE PTR [ecx]
 3101853:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 3101856:	61                   	popa   
 3101857:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 310185b:	74 69                	je     31018c6 <kShell+0x9bc>
 310185d:	6d                   	ins    DWORD PTR es:[edi],dx
 310185e:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 3101862:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101863:	67 72 61             	addr16 jb 31018c7 <kShell+0x9bd>
 3101866:	6d                   	ins    DWORD PTR es:[edi],dx
 3101867:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 310186a:	61                   	popa   
 310186b:	72 61                	jb     31018ce <kShell+0x9c4>
 310186d:	6d                   	ins    DWORD PTR es:[edi],dx
 310186e:	65                   	gs
 310186f:	74 65                	je     31018d6 <kShell+0x9cc>
 3101871:	72 73                	jb     31018e6 <kShell+0x9dc>
 3101873:	5d                   	pop    ebp
 3101874:	00 3d 00 25 73 20    	add    BYTE PTR ds:0x20732500,bh
 310187a:	25 73 3e 20 00       	and    eax,0x203e73
 310187f:	25 73 00 20 09       	and    eax,0x9200073
 3101884:	0a 2d 2c 00 6b 53    	or     ch,BYTE PTR ds:0x536b002c
 310188a:	68 65 6c 6c 00       	push   0x6c6c65
 310188f:	43                   	inc    ebx
 3101890:	57                   	push   edi
 3101891:	44                   	inc    esp
 3101892:	00 0a                	add    BYTE PTR [edx],cl
 3101894:	00 1b                	add    BYTE PTR [ebx],bl
 3101896:	5b                   	pop    ebx
 3101897:	31 44 20 1b          	xor    DWORD PTR [eax+eiz*1+0x1b],eax
 310189b:	5b                   	pop    ebx
 310189c:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 31018a0:	5b                   	pop    ebx
 31018a1:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 31018a5:	5b                   	pop    ebx
 31018a6:	31 43 00             	xor    DWORD PTR [ebx+0x0],eax
 31018a9:	25                   	.byte 0x25
 31018aa:	63 00                	arpl   WORD PTR [eax],ax

Disassembly of section .eh_frame:

031018ac <.eh_frame>:
 31018ac:	14 00                	adc    al,0x0
 31018ae:	00 00                	add    BYTE PTR [eax],al
 31018b0:	00 00                	add    BYTE PTR [eax],al
 31018b2:	00 00                	add    BYTE PTR [eax],al
 31018b4:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 31018b7:	00 01                	add    BYTE PTR [ecx],al
 31018b9:	7c 08                	jl     31018c3 <kShell+0x9b9>
 31018bb:	01 1b                	add    DWORD PTR [ebx],ebx
 31018bd:	0c 04                	or     al,0x4
 31018bf:	04 88                	add    al,0x88
 31018c1:	01 00                	add    DWORD PTR [eax],eax
 31018c3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31018c6:	00 00                	add    BYTE PTR [eax],al
 31018c8:	1c 00                	sbb    al,0x0
 31018ca:	00 00                	add    BYTE PTR [eax],al
 31018cc:	34 e7                	xor    al,0xe7
 31018ce:	ff                   	(bad)  
 31018cf:	ff 19                	call   FWORD PTR [ecx]
 31018d1:	00 00                	add    BYTE PTR [eax],al
 31018d3:	00 00                	add    BYTE PTR [eax],al
 31018d5:	41                   	inc    ecx
 31018d6:	0e                   	push   cs
 31018d7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31018dd:	55                   	push   ebp
 31018de:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31018e1:	04 00                	add    al,0x0
 31018e3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31018e6:	00 00                	add    BYTE PTR [eax],al
 31018e8:	3c 00                	cmp    al,0x0
 31018ea:	00 00                	add    BYTE PTR [eax],al
 31018ec:	2d e7 ff ff 4f       	sub    eax,0x4fffffe7
 31018f1:	00 00                	add    BYTE PTR [eax],al
 31018f3:	00 00                	add    BYTE PTR [eax],al
 31018f5:	41                   	inc    ecx
 31018f6:	0e                   	push   cs
 31018f7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31018fd:	02 4b c5             	add    cl,BYTE PTR [ebx-0x3b]
 3101900:	0c 04                	or     al,0x4
 3101902:	04 00                	add    al,0x0
 3101904:	1c 00                	sbb    al,0x0
 3101906:	00 00                	add    BYTE PTR [eax],al
 3101908:	5c                   	pop    esp
 3101909:	00 00                	add    BYTE PTR [eax],al
 310190b:	00 5c e7 ff          	add    BYTE PTR [edi+eiz*8-0x1],bl
 310190f:	ff 5d 01             	call   FWORD PTR [ebp+0x1]
 3101912:	00 00                	add    BYTE PTR [eax],al
 3101914:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101917:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310191d:	03 59 01             	add    ebx,DWORD PTR [ecx+0x1]
 3101920:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101923:	04 1c                	add    al,0x1c
 3101925:	00 00                	add    BYTE PTR [eax],al
 3101927:	00 7c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bh
 310192b:	00 99 e8 ff ff 8b    	add    BYTE PTR [ecx-0x74000018],bl
 3101931:	00 00                	add    BYTE PTR [eax],al
 3101933:	00 00                	add    BYTE PTR [eax],al
 3101935:	41                   	inc    ecx
 3101936:	0e                   	push   cs
 3101937:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310193d:	02 87 c5 0c 04 04    	add    al,BYTE PTR [edi+0x4040cc5]
 3101943:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101946:	00 00                	add    BYTE PTR [eax],al
 3101948:	9c                   	pushf  
 3101949:	00 00                	add    BYTE PTR [eax],al
 310194b:	00 04 e9             	add    BYTE PTR [ecx+ebp*8],al
 310194e:	ff                   	(bad)  
 310194f:	ff 07                	inc    DWORD PTR [edi]
 3101951:	02 00                	add    al,BYTE PTR [eax]
 3101953:	00 00                	add    BYTE PTR [eax],al
 3101955:	41                   	inc    ecx
 3101956:	0e                   	push   cs
 3101957:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310195d:	03 03                	add    eax,DWORD PTR [ebx]
 310195f:	02 c5                	add    al,ch
 3101961:	0c 04                	or     al,0x4
 3101963:	04 1c                	add    al,0x1c
 3101965:	00 00                	add    BYTE PTR [eax],al
 3101967:	00 bc 00 00 00 eb ea 	add    BYTE PTR [eax+eax*1-0x15150000],bh
 310196e:	ff                   	(bad)  
 310196f:	ff 19                	call   FWORD PTR [ecx]
 3101971:	00 00                	add    BYTE PTR [eax],al
 3101973:	00 00                	add    BYTE PTR [eax],al
 3101975:	41                   	inc    ecx
 3101976:	0e                   	push   cs
 3101977:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310197d:	55                   	push   ebp
 310197e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101981:	04 00                	add    al,0x0
 3101983:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101986:	00 00                	add    BYTE PTR [eax],al
 3101988:	dc 00                	fadd   QWORD PTR [eax]
 310198a:	00 00                	add    BYTE PTR [eax],al
 310198c:	e4 ea                	in     al,0xea
 310198e:	ff                   	(bad)  
 310198f:	ff c9                	dec    ecx
 3101991:	00 00                	add    BYTE PTR [eax],al
 3101993:	00 00                	add    BYTE PTR [eax],al
 3101995:	41                   	inc    ecx
 3101996:	0e                   	push   cs
 3101997:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310199d:	02 c5                	add    al,ch
 310199f:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31019a2:	04 00                	add    al,0x0
 31019a4:	1c 00                	sbb    al,0x0
 31019a6:	00 00                	add    BYTE PTR [eax],al
 31019a8:	fc                   	cld    
 31019a9:	00 00                	add    BYTE PTR [eax],al
 31019ab:	00 8d eb ff ff 19    	add    BYTE PTR [ebp+0x19ffffeb],cl
 31019b1:	00 00                	add    BYTE PTR [eax],al
 31019b3:	00 00                	add    BYTE PTR [eax],al
 31019b5:	41                   	inc    ecx
 31019b6:	0e                   	push   cs
 31019b7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31019bd:	55                   	push   ebp
 31019be:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31019c1:	04 00                	add    al,0x0
 31019c3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31019c6:	00 00                	add    BYTE PTR [eax],al
 31019c8:	1c 01                	sbb    al,0x1
 31019ca:	00 00                	add    BYTE PTR [eax],al
 31019cc:	86 eb                	xchg   bl,ch
 31019ce:	ff                   	(bad)  
 31019cf:	ff 58 00             	call   FWORD PTR [eax+0x0]
 31019d2:	00 00                	add    BYTE PTR [eax],al
 31019d4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31019d7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31019dd:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 31019e1:	04 04                	add    al,0x4
 31019e3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31019e6:	00 00                	add    BYTE PTR [eax],al
 31019e8:	3c 01                	cmp    al,0x1
 31019ea:	00 00                	add    BYTE PTR [eax],al
 31019ec:	be eb ff ff ce       	mov    esi,0xceffffeb
 31019f1:	00 00                	add    BYTE PTR [eax],al
 31019f3:	00 00                	add    BYTE PTR [eax],al
 31019f5:	41                   	inc    ecx
 31019f6:	0e                   	push   cs
 31019f7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31019fd:	02 ca                	add    cl,dl
 31019ff:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101a02:	04 00                	add    al,0x0
 3101a04:	1c 00                	sbb    al,0x0
 3101a06:	00 00                	add    BYTE PTR [eax],al
 3101a08:	5c                   	pop    esp
 3101a09:	01 00                	add    DWORD PTR [eax],eax
 3101a0b:	00 6c ec ff          	add    BYTE PTR [esp+ebp*8-0x1],ch
 3101a0f:	ff 4e 00             	dec    DWORD PTR [esi+0x0]
 3101a12:	00 00                	add    BYTE PTR [eax],al
 3101a14:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101a17:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a1d:	02 4a c5             	add    cl,BYTE PTR [edx-0x3b]
 3101a20:	0c 04                	or     al,0x4
 3101a22:	04 00                	add    al,0x0
 3101a24:	20 00                	and    BYTE PTR [eax],al
 3101a26:	00 00                	add    BYTE PTR [eax],al
 3101a28:	7c 01                	jl     3101a2b <kShell+0xb21>
 3101a2a:	00 00                	add    BYTE PTR [eax],al
 3101a2c:	9a ec ff ff 11 01 00 	call   0x1:0x11ffffec
 3101a33:	00 00                	add    BYTE PTR [eax],al
 3101a35:	41                   	inc    ecx
 3101a36:	0e                   	push   cs
 3101a37:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a3d:	47                   	inc    edi
 3101a3e:	83 03 03             	add    DWORD PTR [ebx],0x3
 3101a41:	06                   	push   es
 3101a42:	01 c5                	add    ebp,eax
 3101a44:	c3                   	ret    
 3101a45:	0c 04                	or     al,0x4
 3101a47:	04 20                	add    al,0x20
 3101a49:	00 00                	add    BYTE PTR [eax],al
 3101a4b:	00 a0 01 00 00 88    	add    BYTE PTR [eax-0x77ffffff],ah
 3101a51:	ed                   	in     eax,dx
 3101a52:	ff                   	(bad)  
 3101a53:	ff a6 00 00 00 00    	jmp    DWORD PTR [esi+0x0]
 3101a59:	41                   	inc    ecx
 3101a5a:	0e                   	push   cs
 3101a5b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a61:	44                   	inc    esp
 3101a62:	83 03 02             	add    DWORD PTR [ebx],0x2
 3101a65:	9e                   	sahf   
 3101a66:	c5 c3 0c             	(bad)  
 3101a69:	04 04                	add    al,0x4
 3101a6b:	00 20                	add    BYTE PTR [eax],ah
 3101a6d:	00 00                	add    BYTE PTR [eax],al
 3101a6f:	00 c4                	add    ah,al
 3101a71:	01 00                	add    DWORD PTR [eax],eax
 3101a73:	00 0a                	add    BYTE PTR [edx],cl
 3101a75:	ee                   	out    dx,al
 3101a76:	ff                   	(bad)  
 3101a77:	ff a9 01 00 00 00    	jmp    FWORD PTR [ecx+0x1]
 3101a7d:	41                   	inc    ecx
 3101a7e:	0e                   	push   cs
 3101a7f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a85:	44                   	inc    esp
 3101a86:	83 03 03             	add    DWORD PTR [ebx],0x3
 3101a89:	a1 01 c5 c3 0c       	mov    eax,ds:0xcc3c501
 3101a8e:	04 04                	add    al,0x4
 3101a90:	1c 00                	sbb    al,0x0
 3101a92:	00 00                	add    BYTE PTR [eax],al
 3101a94:	e8 01 00 00 8f       	call   92101a9a <lCommand+0x8efef8fa>
 3101a99:	ef                   	out    dx,eax
 3101a9a:	ff                   	(bad)  
 3101a9b:	ff 69 00             	jmp    FWORD PTR [ecx+0x0]
 3101a9e:	00 00                	add    BYTE PTR [eax],al
 3101aa0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101aa3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101aa9:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3101aac:	0c 04                	or     al,0x4
 3101aae:	04 00                	add    al,0x0
 3101ab0:	1c 00                	sbb    al,0x0
 3101ab2:	00 00                	add    BYTE PTR [eax],al
 3101ab4:	08 02                	or     BYTE PTR [edx],al
 3101ab6:	00 00                	add    BYTE PTR [eax],al
 3101ab8:	d8 ef                	fsubr  st,st(7)
 3101aba:	ff                   	(bad)  
 3101abb:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3101ac1:	41                   	inc    ecx
 3101ac2:	0e                   	push   cs
 3101ac3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101ac9:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 3101acf:	04 20                	add    al,0x20
 3101ad1:	00 00                	add    BYTE PTR [eax],al
 3101ad3:	00 28                	add    BYTE PTR [eax],ch
 3101ad5:	02 00                	add    al,BYTE PTR [eax]
 3101ad7:	00 46 f2             	add    BYTE PTR [esi-0xe],al
 3101ada:	ff                   	(bad)  
 3101adb:	ff 76 00             	push   DWORD PTR [esi+0x0]
 3101ade:	00 00                	add    BYTE PTR [eax],al
 3101ae0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101ae3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101ae9:	44                   	inc    esp
 3101aea:	83 03 02             	add    DWORD PTR [ebx],0x2
 3101aed:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101aee:	c5 c3 0c             	(bad)  
 3101af1:	04 04                	add    al,0x4
 3101af3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101af6:	00 00                	add    BYTE PTR [eax],al
 3101af8:	4c                   	dec    esp
 3101af9:	02 00                	add    al,BYTE PTR [eax]
 3101afb:	00 98 f2 ff ff 3d    	add    BYTE PTR [eax+0x3dfffff2],bl
 3101b01:	00 00                	add    BYTE PTR [eax],al
 3101b03:	00 00                	add    BYTE PTR [eax],al
 3101b05:	41                   	inc    ecx
 3101b06:	0e                   	push   cs
 3101b07:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b0d:	79 c5                	jns    3101ad4 <kShell+0xbca>
 3101b0f:	0c 04                	or     al,0x4
 3101b11:	04 00                	add    al,0x0
 3101b13:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b16:	00 00                	add    BYTE PTR [eax],al
 3101b18:	6c                   	ins    BYTE PTR es:[edi],dx
 3101b19:	02 00                	add    al,BYTE PTR [eax]
 3101b1b:	00 b5 f2 ff ff 8c    	add    BYTE PTR [ebp-0x7300000e],dh
 3101b21:	00 00                	add    BYTE PTR [eax],al
 3101b23:	00 00                	add    BYTE PTR [eax],al
 3101b25:	41                   	inc    ecx
 3101b26:	0e                   	push   cs
 3101b27:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b2d:	02 88 c5 0c 04 04    	add    cl,BYTE PTR [eax+0x4040cc5]
 3101b33:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b36:	00 00                	add    BYTE PTR [eax],al
 3101b38:	8c 02                	mov    WORD PTR [edx],es
 3101b3a:	00 00                	add    BYTE PTR [eax],al
 3101b3c:	21 f3                	and    ebx,esi
 3101b3e:	ff                   	(bad)  
 3101b3f:	ff 2e                	jmp    FWORD PTR [esi]
 3101b41:	00 00                	add    BYTE PTR [eax],al
 3101b43:	00 00                	add    BYTE PTR [eax],al
 3101b45:	41                   	inc    ecx
 3101b46:	0e                   	push   cs
 3101b47:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b4d:	6a c5                	push   0xffffffc5
 3101b4f:	0c 04                	or     al,0x4
 3101b51:	04 00                	add    al,0x0
 3101b53:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b56:	00 00                	add    BYTE PTR [eax],al
 3101b58:	ac                   	lods   al,BYTE PTR ds:[esi]
 3101b59:	02 00                	add    al,BYTE PTR [eax]
 3101b5b:	00 2f                	add    BYTE PTR [edi],ch
 3101b5d:	f3 ff                	repz (bad) 
 3101b5f:	ff 23                	jmp    DWORD PTR [ebx]
 3101b61:	00 00                	add    BYTE PTR [eax],al
 3101b63:	00 00                	add    BYTE PTR [eax],al
 3101b65:	41                   	inc    ecx
 3101b66:	0e                   	push   cs
 3101b67:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b6d:	5f                   	pop    edi
 3101b6e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101b71:	04 00                	add    al,0x0
 3101b73:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b76:	00 00                	add    BYTE PTR [eax],al
 3101b78:	cc                   	int3   
 3101b79:	02 00                	add    al,BYTE PTR [eax]
 3101b7b:	00 32                	add    BYTE PTR [edx],dh
 3101b7d:	f3 ff                	repz (bad) 
 3101b7f:	ff 26                	jmp    DWORD PTR [esi]
 3101b81:	00 00                	add    BYTE PTR [eax],al
 3101b83:	00 00                	add    BYTE PTR [eax],al
 3101b85:	41                   	inc    ecx
 3101b86:	0e                   	push   cs
 3101b87:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b8d:	62                   	(bad)  
 3101b8e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101b91:	04 00                	add    al,0x0
 3101b93:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b96:	00 00                	add    BYTE PTR [eax],al
 3101b98:	ec                   	in     al,dx
 3101b99:	02 00                	add    al,BYTE PTR [eax]
 3101b9b:	00 38                	add    BYTE PTR [eax],bh
 3101b9d:	f3 ff                	repz (bad) 
 3101b9f:	ff 16                	call   DWORD PTR [esi]
 3101ba1:	00 00                	add    BYTE PTR [eax],al
 3101ba3:	00 00                	add    BYTE PTR [eax],al
 3101ba5:	41                   	inc    ecx
 3101ba6:	0e                   	push   cs
 3101ba7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101bad:	52                   	push   edx
 3101bae:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101bb1:	04 00                	add    al,0x0
 3101bb3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101bb6:	00 00                	add    BYTE PTR [eax],al
 3101bb8:	0c 03                	or     al,0x3
 3101bba:	00 00                	add    BYTE PTR [eax],al
 3101bbc:	2e                   	cs
 3101bbd:	f3 ff                	repz (bad) 
 3101bbf:	ff 20                	jmp    DWORD PTR [eax]
 3101bc1:	00 00                	add    BYTE PTR [eax],al
 3101bc3:	00 00                	add    BYTE PTR [eax],al
 3101bc5:	41                   	inc    ecx
 3101bc6:	0e                   	push   cs
 3101bc7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101bcd:	5c                   	pop    esp
 3101bce:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101bd1:	04 00                	add    al,0x0
 3101bd3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101bd6:	00 00                	add    BYTE PTR [eax],al
 3101bd8:	2c 03                	sub    al,0x3
 3101bda:	00 00                	add    BYTE PTR [eax],al
 3101bdc:	2e                   	cs
 3101bdd:	f3 ff                	repz (bad) 
 3101bdf:	ff e4                	jmp    esp
 3101be1:	03 00                	add    eax,DWORD PTR [eax]
 3101be3:	00 00                	add    BYTE PTR [eax],al
 3101be5:	41                   	inc    ecx
 3101be6:	0e                   	push   cs
 3101be7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101bed:	03 e0                	add    esp,eax
 3101bef:	03 c5                	add    eax,ebp
 3101bf1:	0c 04                	or     al,0x4
 3101bf3:	04                   	.byte 0x4

Disassembly of section .interp:

03101bf4 <.interp>:
 3101bf4:	2f                   	das    
 3101bf5:	6c                   	ins    BYTE PTR es:[edi],dx
 3101bf6:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3101bfd:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3101c04:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03101c08 <.dynsym>:
	...
 3101c18:	09 00                	or     DWORD PTR [eax],eax
	...
 3101c22:	00 00                	add    BYTE PTR [eax],al
 3101c24:	12 00                	adc    al,BYTE PTR [eax]
 3101c26:	00 00                	add    BYTE PTR [eax],al
 3101c28:	10 00                	adc    BYTE PTR [eax],al
	...
 3101c32:	00 00                	add    BYTE PTR [eax],al
 3101c34:	12 00                	adc    al,BYTE PTR [eax]
 3101c36:	00 00                	add    BYTE PTR [eax],al
 3101c38:	18 00                	sbb    BYTE PTR [eax],al
	...
 3101c42:	00 00                	add    BYTE PTR [eax],al
 3101c44:	12 00                	adc    al,BYTE PTR [eax]
 3101c46:	00 00                	add    BYTE PTR [eax],al
 3101c48:	1e                   	push   ds
	...
 3101c51:	00 00                	add    BYTE PTR [eax],al
 3101c53:	00 12                	add    BYTE PTR [edx],dl
 3101c55:	00 00                	add    BYTE PTR [eax],al
 3101c57:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
 3101c5d:	00 00                	add    BYTE PTR [eax],al
 3101c5f:	00 00                	add    BYTE PTR [eax],al
 3101c61:	00 00                	add    BYTE PTR [eax],al
 3101c63:	00 12                	add    BYTE PTR [edx],dl
 3101c65:	00 00                	add    BYTE PTR [eax],al
 3101c67:	00 2e                	add    BYTE PTR [esi],ch
	...
 3101c71:	00 00                	add    BYTE PTR [eax],al
 3101c73:	00 12                	add    BYTE PTR [edx],dl
 3101c75:	00 00                	add    BYTE PTR [eax],al
 3101c77:	00 35 00 00 00 00    	add    BYTE PTR ds:0x0,dh
 3101c7d:	00 00                	add    BYTE PTR [eax],al
 3101c7f:	00 00                	add    BYTE PTR [eax],al
 3101c81:	00 00                	add    BYTE PTR [eax],al
 3101c83:	00 12                	add    BYTE PTR [edx],dl
 3101c85:	00 00                	add    BYTE PTR [eax],al
 3101c87:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
	...
 3101c92:	00 00                	add    BYTE PTR [eax],al
 3101c94:	12 00                	adc    al,BYTE PTR [eax]
 3101c96:	00 00                	add    BYTE PTR [eax],al
 3101c98:	43                   	inc    ebx
	...
 3101ca1:	00 00                	add    BYTE PTR [eax],al
 3101ca3:	00 12                	add    BYTE PTR [edx],dl
 3101ca5:	00 00                	add    BYTE PTR [eax],al
 3101ca7:	00 49 00             	add    BYTE PTR [ecx+0x0],cl
	...
 3101cb2:	00 00                	add    BYTE PTR [eax],al
 3101cb4:	12 00                	adc    al,BYTE PTR [eax]
 3101cb6:	00 00                	add    BYTE PTR [eax],al
 3101cb8:	57                   	push   edi
	...
 3101cc1:	00 00                	add    BYTE PTR [eax],al
 3101cc3:	00 12                	add    BYTE PTR [edx],dl
 3101cc5:	00 00                	add    BYTE PTR [eax],al
 3101cc7:	00 5f 00             	add    BYTE PTR [edi+0x0],bl
	...
 3101cd2:	00 00                	add    BYTE PTR [eax],al
 3101cd4:	12 00                	adc    al,BYTE PTR [eax]
 3101cd6:	00 00                	add    BYTE PTR [eax],al
 3101cd8:	64 00 00             	add    BYTE PTR fs:[eax],al
	...
 3101ce3:	00 12                	add    BYTE PTR [edx],dl
 3101ce5:	00 00                	add    BYTE PTR [eax],al
 3101ce7:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
	...
 3101cf2:	00 00                	add    BYTE PTR [eax],al
 3101cf4:	12 00                	adc    al,BYTE PTR [eax]
 3101cf6:	00 00                	add    BYTE PTR [eax],al
 3101cf8:	72 00                	jb     3101cfa <kShell+0xdf0>
	...
 3101d02:	00 00                	add    BYTE PTR [eax],al
 3101d04:	12 00                	adc    al,BYTE PTR [eax]
 3101d06:	00 00                	add    BYTE PTR [eax],al
 3101d08:	79 00                	jns    3101d0a <kShell+0xe00>
	...
 3101d12:	00 00                	add    BYTE PTR [eax],al
 3101d14:	12 00                	adc    al,BYTE PTR [eax]
 3101d16:	00 00                	add    BYTE PTR [eax],al
 3101d18:	7e 00                	jle    3101d1a <kShell+0xe10>
	...
 3101d22:	00 00                	add    BYTE PTR [eax],al
 3101d24:	12 00                	adc    al,BYTE PTR [eax]
 3101d26:	00 00                	add    BYTE PTR [eax],al
 3101d28:	86 00                	xchg   BYTE PTR [eax],al
	...
 3101d32:	00 00                	add    BYTE PTR [eax],al
 3101d34:	12 00                	adc    al,BYTE PTR [eax]
 3101d36:	00 00                	add    BYTE PTR [eax],al
 3101d38:	8e 00                	mov    es,WORD PTR [eax]
	...
 3101d42:	00 00                	add    BYTE PTR [eax],al
 3101d44:	12 00                	adc    al,BYTE PTR [eax]
 3101d46:	00 00                	add    BYTE PTR [eax],al
 3101d48:	95                   	xchg   ebp,eax
	...
 3101d51:	00 00                	add    BYTE PTR [eax],al
 3101d53:	00 12                	add    BYTE PTR [edx],dl
 3101d55:	00 00                	add    BYTE PTR [eax],al
 3101d57:	00 9c 00 00 00 00 00 	add    BYTE PTR [eax+eax*1+0x0],bl
 3101d5e:	00 00                	add    BYTE PTR [eax],al
 3101d60:	00 00                	add    BYTE PTR [eax],al
 3101d62:	00 00                	add    BYTE PTR [eax],al
 3101d64:	12 00                	adc    al,BYTE PTR [eax]
 3101d66:	00 00                	add    BYTE PTR [eax],al
 3101d68:	a1 00 00 00 00       	mov    eax,ds:0x0
 3101d6d:	00 00                	add    BYTE PTR [eax],al
 3101d6f:	00 00                	add    BYTE PTR [eax],al
 3101d71:	00 00                	add    BYTE PTR [eax],al
 3101d73:	00 12                	add    BYTE PTR [edx],dl
 3101d75:	00 00                	add    BYTE PTR [eax],al
 3101d77:	00 a8 00 00 00 00    	add    BYTE PTR [eax+0x0],ch
 3101d7d:	00 00                	add    BYTE PTR [eax],al
 3101d7f:	00 00                	add    BYTE PTR [eax],al
 3101d81:	00 00                	add    BYTE PTR [eax],al
 3101d83:	00 12                	add    BYTE PTR [edx],dl
 3101d85:	00 00                	add    BYTE PTR [eax],al
 3101d87:	00 b0 00 00 00 00    	add    BYTE PTR [eax+0x0],dh
 3101d8d:	00 00                	add    BYTE PTR [eax],al
 3101d8f:	00 00                	add    BYTE PTR [eax],al
 3101d91:	00 00                	add    BYTE PTR [eax],al
 3101d93:	00 12                	add    BYTE PTR [edx],dl
 3101d95:	00 00                	add    BYTE PTR [eax],al
 3101d97:	00 b7 00 00 00 00    	add    BYTE PTR [edi+0x0],dh
 3101d9d:	00 00                	add    BYTE PTR [eax],al
 3101d9f:	00 00                	add    BYTE PTR [eax],al
 3101da1:	00 00                	add    BYTE PTR [eax],al
 3101da3:	00 12                	add    BYTE PTR [edx],dl
 3101da5:	00 00                	add    BYTE PTR [eax],al
 3101da7:	00 c4                	add    ah,al
	...
 3101db1:	00 00                	add    BYTE PTR [eax],al
 3101db3:	00 12                	add    BYTE PTR [edx],dl
 3101db5:	00 00                	add    BYTE PTR [eax],al
 3101db7:	00 c9                	add    cl,cl
	...
 3101dc1:	00 00                	add    BYTE PTR [eax],al
 3101dc3:	00 12                	add    BYTE PTR [edx],dl
 3101dc5:	00 00                	add    BYTE PTR [eax],al
 3101dc7:	00 ce                	add    dh,cl
	...
 3101dd1:	00 00                	add    BYTE PTR [eax],al
 3101dd3:	00 12                	add    BYTE PTR [edx],dl
 3101dd5:	00 00                	add    BYTE PTR [eax],al
 3101dd7:	00 d5                	add    ch,dl
	...
 3101de1:	00 00                	add    BYTE PTR [eax],al
 3101de3:	00 12                	add    BYTE PTR [edx],dl
 3101de5:	00 00                	add    BYTE PTR [eax],al
 3101de7:	00 db                	add    bl,bl
	...
 3101df1:	00 00                	add    BYTE PTR [eax],al
 3101df3:	00 12                	add    BYTE PTR [edx],dl
 3101df5:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

03101df8 <.dynstr>:
 3101df8:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3101dfc:	63 2e                	arpl   WORD PTR [esi],bp
 3101dfe:	73 6f                	jae    3101e6f <kShell+0xf65>
 3101e00:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101e03:	72 63                	jb     3101e68 <kShell+0xf5e>
 3101e05:	70 79                	jo     3101e80 <kShell+0xf76>
 3101e07:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3101e0a:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3101e11:	72 
 3101e12:	69 6e 74 00 70 72 69 	imul   ebp,DWORD PTR [esi+0x74],0x69727000
 3101e19:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101e1a:	74 66                	je     3101e82 <kShell+0xf78>
 3101e1c:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 3101e1f:	73 65                	jae    3101e86 <kShell+0xf7c>
 3101e21:	74 52                	je     3101e75 <kShell+0xf6b>
 3101e23:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e24:	77 00                	ja     3101e26 <kShell+0xf1c>
 3101e26:	67                   	addr16
 3101e27:	65                   	gs
 3101e28:	74 65                	je     3101e8f <kShell+0xf85>
 3101e2a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101e2b:	76 00                	jbe    3101e2d <kShell+0xf23>
 3101e2d:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e2e:	65                   	gs
 3101e2f:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e30:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3101e33:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 3101e36:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e37:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e38:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e39:	63 00                	arpl   WORD PTR [eax],ax
 3101e3b:	73 6c                	jae    3101ea9 <kShell+0xf9f>
 3101e3d:	65                   	gs
 3101e3e:	65                   	gs
 3101e3f:	70 00                	jo     3101e41 <kShell+0xf37>
 3101e41:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 3101e44:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e45:	69 6e 65 54 6f 41 72 	imul   ebp,DWORD PTR [esi+0x65],0x72416f54
 3101e4c:	67 76 00             	addr16 jbe 3101e4f <kShell+0xf45>
 3101e4f:	73 74                	jae    3101ec5 <kShell+0xfbb>
 3101e51:	72 74                	jb     3101ec7 <kShell+0xfbd>
 3101e53:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e54:	75 6c                	jne    3101ec2 <kShell+0xfb8>
 3101e56:	00 69 74             	add    BYTE PTR [ecx+0x74],ch
 3101e59:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e5a:	61                   	popa   
 3101e5b:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101e5e:	74 74                	je     3101ed4 <kShell+0xfca>
 3101e60:	69 63 6b 73 00 65 78 	imul   esp,DWORD PTR [ebx+0x6b],0x78650073
 3101e67:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 3101e6a:	73 74                	jae    3101ee0 <kShell+0xfd6>
 3101e6c:	72 73                	jb     3101ee1 <kShell+0xfd7>
 3101e6e:	74 72                	je     3101ee2 <kShell+0xfd8>
 3101e70:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 3101e73:	61                   	popa   
 3101e74:	64 00 73 74          	add    BYTE PTR fs:[ebx+0x74],dh
 3101e78:	72 6e                	jb     3101ee8 <kShell+0xfde>
 3101e7a:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 3101e7d:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101e80:	72 6e                	jb     3101ef0 <kShell+0xfe6>
 3101e82:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3101e85:	00 73 65             	add    BYTE PTR [ebx+0x65],dh
 3101e88:	74 65                	je     3101eef <kShell+0xfe5>
 3101e8a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101e8b:	76 00                	jbe    3101e8d <kShell+0xf83>
 3101e8d:	73 74                	jae    3101f03 <kShell+0xff9>
 3101e8f:	72 74                	jb     3101f05 <kShell+0xffb>
 3101e91:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e92:	6b 00 66             	imul   eax,DWORD PTR [eax],0x66
 3101e95:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e96:	72 6b                	jb     3101f03 <kShell+0xff9>
 3101e98:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3101e9b:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e9c:	73 65                	jae    3101f03 <kShell+0xff9>
 3101e9e:	74 00                	je     3101ea0 <kShell+0xf96>
 3101ea0:	73 74                	jae    3101f16 <kShell+0x100c>
 3101ea2:	72 74                	jb     3101f18 <kShell+0x100e>
 3101ea4:	72 69                	jb     3101f0f <kShell+0x1005>
 3101ea6:	6d                   	ins    DWORD PTR es:[edi],dx
 3101ea7:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101eaa:	74 63                	je     3101f0f <kShell+0x1005>
 3101eac:	77 64                	ja     3101f12 <kShell+0x1008>
 3101eae:	00 6d 6f             	add    BYTE PTR [ebp+0x6f],ch
 3101eb1:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
 3101eb8:	6e 
 3101eb9:	61                   	popa   
 3101eba:	6c                   	ins    BYTE PTR es:[edi],dx
 3101ebb:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101ebe:	69 74 00 61 74 6f 69 	imul   esi,DWORD PTR [eax+eax*1+0x61],0x696f74
 3101ec5:	00 
 3101ec6:	73 74                	jae    3101f3c <kShell+0x1032>
 3101ec8:	72 6c                	jb     3101f36 <kShell+0x102c>
 3101eca:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101ecc:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101ecf:	65 63 61 00          	arpl   WORD PTR gs:[ecx+0x0],sp
 3101ed3:	66                   	data16
 3101ed4:	72 65                	jb     3101f3b <kShell+0x1031>
 3101ed6:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 3101ed9:	2e                   	cs
 3101eda:	2f                   	das    
 3101edb:	6c                   	ins    BYTE PTR es:[edi],dx
 3101edc:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3101ee3:	4f                   	dec    edi
 3101ee4:	53                   	push   ebx
 3101ee5:	2f                   	das    
 3101ee6:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3101eed:	62 
 3101eee:	75 67                	jne    3101f57 <kShell+0x104d>
 3101ef0:	2f                   	das    
 3101ef1:	47                   	inc    edi
 3101ef2:	4e                   	dec    esi
 3101ef3:	55                   	push   ebp
 3101ef4:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3101ef9:	78 00                	js     3101efb <kShell+0xff1>

Disassembly of section .hash:

03101efc <.hash>:
 3101efc:	11 00                	adc    DWORD PTR [eax],eax
 3101efe:	00 00                	add    BYTE PTR [eax],al
 3101f00:	1f                   	pop    ds
 3101f01:	00 00                	add    BYTE PTR [eax],al
 3101f03:	00 0f                	add    BYTE PTR [edi],cl
 3101f05:	00 00                	add    BYTE PTR [eax],al
 3101f07:	00 00                	add    BYTE PTR [eax],al
 3101f09:	00 00                	add    BYTE PTR [eax],al
 3101f0b:	00 15 00 00 00 0b    	add    BYTE PTR ds:0xb000000,dl
 3101f11:	00 00                	add    BYTE PTR [eax],al
 3101f13:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101f16:	00 00                	add    BYTE PTR [eax],al
 3101f18:	00 00                	add    BYTE PTR [eax],al
 3101f1a:	00 00                	add    BYTE PTR [eax],al
 3101f1c:	12 00                	adc    al,BYTE PTR [eax]
 3101f1e:	00 00                	add    BYTE PTR [eax],al
 3101f20:	10 00                	adc    BYTE PTR [eax],al
 3101f22:	00 00                	add    BYTE PTR [eax],al
 3101f24:	07                   	pop    es
 3101f25:	00 00                	add    BYTE PTR [eax],al
 3101f27:	00 00                	add    BYTE PTR [eax],al
 3101f29:	00 00                	add    BYTE PTR [eax],al
 3101f2b:	00 17                	add    BYTE PTR [edi],dl
 3101f2d:	00 00                	add    BYTE PTR [eax],al
 3101f2f:	00 19                	add    BYTE PTR [ecx],bl
 3101f31:	00 00                	add    BYTE PTR [eax],al
 3101f33:	00 1e                	add    BYTE PTR [esi],bl
 3101f35:	00 00                	add    BYTE PTR [eax],al
 3101f37:	00 1b                	add    BYTE PTR [ebx],bl
 3101f39:	00 00                	add    BYTE PTR [eax],al
 3101f3b:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 3101f3e:	00 00                	add    BYTE PTR [eax],al
 3101f40:	05 00 00 00 14       	add    eax,0x14000000
	...
 3101f61:	00 00                	add    BYTE PTR [eax],al
 3101f63:	00 06                	add    BYTE PTR [esi],al
 3101f65:	00 00                	add    BYTE PTR [eax],al
 3101f67:	00 04 00             	add    BYTE PTR [eax+eax*1],al
	...
 3101f7a:	00 00                	add    BYTE PTR [eax],al
 3101f7c:	09 00                	or     DWORD PTR [eax],eax
 3101f7e:	00 00                	add    BYTE PTR [eax],al
 3101f80:	0d 00 00 00 0e       	or     eax,0xe000000
 3101f85:	00 00                	add    BYTE PTR [eax],al
 3101f87:	00 03                	add    BYTE PTR [ebx],al
 3101f89:	00 00                	add    BYTE PTR [eax],al
 3101f8b:	00 00                	add    BYTE PTR [eax],al
 3101f8d:	00 00                	add    BYTE PTR [eax],al
 3101f8f:	00 0a                	add    BYTE PTR [edx],cl
 3101f91:	00 00                	add    BYTE PTR [eax],al
 3101f93:	00 02                	add    BYTE PTR [edx],al
	...
 3101f9d:	00 00                	add    BYTE PTR [eax],al
 3101f9f:	00 13                	add    BYTE PTR [ebx],dl
 3101fa1:	00 00                	add    BYTE PTR [eax],al
 3101fa3:	00 08                	add    BYTE PTR [eax],cl
 3101fa5:	00 00                	add    BYTE PTR [eax],al
 3101fa7:	00 16                	add    BYTE PTR [esi],dl
 3101fa9:	00 00                	add    BYTE PTR [eax],al
 3101fab:	00 11                	add    BYTE PTR [ecx],dl
 3101fad:	00 00                	add    BYTE PTR [eax],al
 3101faf:	00 18                	add    BYTE PTR [eax],bl
 3101fb1:	00 00                	add    BYTE PTR [eax],al
 3101fb3:	00 1a                	add    BYTE PTR [edx],bl
 3101fb5:	00 00                	add    BYTE PTR [eax],al
 3101fb7:	00 00                	add    BYTE PTR [eax],al
 3101fb9:	00 00                	add    BYTE PTR [eax],al
 3101fbb:	00 01                	add    BYTE PTR [ecx],al
 3101fbd:	00 00                	add    BYTE PTR [eax],al
 3101fbf:	00                   	.byte 0x0
 3101fc0:	1d                   	.byte 0x1d
 3101fc1:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03101fc4 <.eh_frame>:
 3101fc4:	14 00                	adc    al,0x0
 3101fc6:	00 00                	add    BYTE PTR [eax],al
 3101fc8:	00 00                	add    BYTE PTR [eax],al
 3101fca:	00 00                	add    BYTE PTR [eax],al
 3101fcc:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3101fcf:	00 01                	add    BYTE PTR [ecx],al
 3101fd1:	7c 08                	jl     3101fdb <kShell+0x10d1>
 3101fd3:	01 1b                	add    DWORD PTR [ebx],ebx
 3101fd5:	0c 04                	or     al,0x4
 3101fd7:	04 88                	add    al,0x88
 3101fd9:	01 00                	add    DWORD PTR [eax],eax
 3101fdb:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3101fde:	00 00                	add    BYTE PTR [eax],al
 3101fe0:	1c 00                	sbb    al,0x0
 3101fe2:	00 00                	add    BYTE PTR [eax],al
 3101fe4:	0c f3                	or     al,0xf3
 3101fe6:	ff                   	(bad)  
 3101fe7:	ff f0                	push   eax
 3101fe9:	01 00                	add    DWORD PTR [eax],eax
 3101feb:	00 00                	add    BYTE PTR [eax],al
 3101fed:	0e                   	push   cs
 3101fee:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3101ff1:	0c 4a                	or     al,0x4a
 3101ff3:	0f 0b                	ud2    
 3101ff5:	74 04                	je     3101ffb <kShell+0x10f1>
 3101ff7:	78 00                	js     3101ff9 <kShell+0x10ef>
 3101ff9:	3f                   	aas    
 3101ffa:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3101ffc:	2a 32                	sub    dh,BYTE PTR [edx]
 3101ffe:	24 22                	and    al,0x22
 3102000:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03102004 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3102004:	01 1b                	add    DWORD PTR [ebx],ebx
 3102006:	03 3b                	add    edi,DWORD PTR [ebx]
 3102008:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 3102009:	f8                   	clc    
 310200a:	ff                   	(bad)  
 310200b:	ff 19                	call   FWORD PTR [ecx]
 310200d:	00 00                	add    BYTE PTR [eax],al
 310200f:	00 fc                	add    ah,bh
 3102011:	df ff                	(bad)  
 3102013:	ff c0                	inc    eax
 3102015:	f8                   	clc    
 3102016:	ff                   	(bad)  
 3102017:	ff 15 e0 ff ff e0    	call   DWORD PTR ds:0xe0ffffe0
 310201d:	f8                   	clc    
 310201e:	ff                   	(bad)  
 310201f:	ff 64 e0 ff          	jmp    DWORD PTR [eax+eiz*8-0x1]
 3102023:	ff 00                	inc    DWORD PTR [eax]
 3102025:	f9                   	stc    
 3102026:	ff                   	(bad)  
 3102027:	ff c1                	inc    ecx
 3102029:	e1 ff                	loope  310202a <__GNU_EH_FRAME_HDR+0x26>
 310202b:	ff 20                	jmp    DWORD PTR [eax]
 310202d:	f9                   	stc    
 310202e:	ff                   	(bad)  
 310202f:	ff 4c e2 ff          	dec    DWORD PTR [edx+eiz*8-0x1]
 3102033:	ff 40 f9             	inc    DWORD PTR [eax-0x7]
 3102036:	ff                   	(bad)  
 3102037:	ff 53 e4             	call   DWORD PTR [ebx-0x1c]
 310203a:	ff                   	(bad)  
 310203b:	ff 60 f9             	jmp    DWORD PTR [eax-0x7]
 310203e:	ff                   	(bad)  
 310203f:	ff 6c e4 ff          	jmp    FWORD PTR [esp+eiz*8-0x1]
 3102043:	ff 80 f9 ff ff 35    	inc    DWORD PTR [eax+0x35fffff9]
 3102049:	e5 ff                	in     eax,0xff
 310204b:	ff a0 f9 ff ff 4e    	jmp    DWORD PTR [eax+0x4efffff9]
 3102051:	e5 ff                	in     eax,0xff
 3102053:	ff c0                	inc    eax
 3102055:	f9                   	stc    
 3102056:	ff                   	(bad)  
 3102057:	ff a6 e5 ff ff e0    	jmp    DWORD PTR [esi-0x1f00001b]
 310205d:	f9                   	stc    
 310205e:	ff                   	(bad)  
 310205f:	ff 74 e6 ff          	push   DWORD PTR [esi+eiz*8-0x1]
 3102063:	ff 00                	inc    DWORD PTR [eax]
 3102065:	fa                   	cli    
 3102066:	ff                   	(bad)  
 3102067:	ff c2                	inc    edx
 3102069:	e6 ff                	out    0xff,al
 310206b:	ff 20                	jmp    DWORD PTR [eax]
 310206d:	fa                   	cli    
 310206e:	ff                   	(bad)  
 310206f:	ff d4                	call   esp
 3102071:	e7 ff                	out    0xff,eax
 3102073:	ff 44 fa ff          	inc    DWORD PTR [edx+edi*8-0x1]
 3102077:	ff                   	(bad)  
 3102078:	7a e8                	jp     3102062 <__GNU_EH_FRAME_HDR+0x5e>
 310207a:	ff                   	(bad)  
 310207b:	ff 68 fa             	jmp    FWORD PTR [eax-0x6]
 310207e:	ff                   	(bad)  
 310207f:	ff 23                	jmp    DWORD PTR [ebx]
 3102081:	ea ff ff 8c fa ff ff 	jmp    0xffff:0xfa8cffff
 3102088:	8c ea                	mov    edx,gs
 310208a:	ff                   	(bad)  
 310208b:	ff ac fa ff ff 1a ed 	jmp    FWORD PTR [edx+edi*8-0x12e50001]
 3102092:	ff                   	(bad)  
 3102093:	ff cc                	dec    esp
 3102095:	fa                   	cli    
 3102096:	ff                   	(bad)  
 3102097:	ff 90 ed ff ff f0    	call   DWORD PTR [eax-0xf000013]
 310209d:	fa                   	cli    
 310209e:	ff                   	(bad)  
 310209f:	ff cd                	dec    ebp
 31020a1:	ed                   	in     eax,dx
 31020a2:	ff                   	(bad)  
 31020a3:	ff 10                	call   DWORD PTR [eax]
 31020a5:	fb                   	sti    
 31020a6:	ff                   	(bad)  
 31020a7:	ff 59 ee             	call   FWORD PTR [ecx-0x12]
 31020aa:	ff                   	(bad)  
 31020ab:	ff 30                	push   DWORD PTR [eax]
 31020ad:	fb                   	sti    
 31020ae:	ff                   	(bad)  
 31020af:	ff 87 ee ff ff 50    	inc    DWORD PTR [edi+0x50ffffee]
 31020b5:	fb                   	sti    
 31020b6:	ff                   	(bad)  
 31020b7:	ff aa ee ff ff 70    	jmp    FWORD PTR [edx+0x70ffffee]
 31020bd:	fb                   	sti    
 31020be:	ff                   	(bad)  
 31020bf:	ff d0                	call   eax
 31020c1:	ee                   	out    dx,al
 31020c2:	ff                   	(bad)  
 31020c3:	ff 90 fb ff ff e6    	call   DWORD PTR [eax-0x19000005]
 31020c9:	ee                   	out    dx,al
 31020ca:	ff                   	(bad)  
 31020cb:	ff b0 fb ff ff 06    	push   DWORD PTR [eax+0x6fffffb]
 31020d1:	ef                   	out    dx,eax
 31020d2:	ff                   	(bad)  
 31020d3:	ff d0                	call   eax
 31020d5:	fb                   	sti    
 31020d6:	ff                   	(bad)  
 31020d7:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

031020d8 <.rel.dyn>:
 31020d8:	bc 23 10 03 07       	mov    esp,0x7031023
 31020dd:	01 00                	add    DWORD PTR [eax],eax
 31020df:	00 c0                	add    al,al
 31020e1:	23 10                	and    edx,DWORD PTR [eax]
 31020e3:	03 07                	add    eax,DWORD PTR [edi]
 31020e5:	02 00                	add    al,BYTE PTR [eax]
 31020e7:	00 c4                	add    ah,al
 31020e9:	23 10                	and    edx,DWORD PTR [eax]
 31020eb:	03 07                	add    eax,DWORD PTR [edi]
 31020ed:	03 00                	add    eax,DWORD PTR [eax]
 31020ef:	00 c8                	add    al,cl
 31020f1:	23 10                	and    edx,DWORD PTR [eax]
 31020f3:	03 07                	add    eax,DWORD PTR [edi]
 31020f5:	04 00                	add    al,0x0
 31020f7:	00 cc                	add    ah,cl
 31020f9:	23 10                	and    edx,DWORD PTR [eax]
 31020fb:	03 07                	add    eax,DWORD PTR [edi]
 31020fd:	05 00 00 d0 23       	add    eax,0x23d00000
 3102102:	10 03                	adc    BYTE PTR [ebx],al
 3102104:	07                   	pop    es
 3102105:	06                   	push   es
 3102106:	00 00                	add    BYTE PTR [eax],al
 3102108:	d4 23                	aam    0x23
 310210a:	10 03                	adc    BYTE PTR [ebx],al
 310210c:	07                   	pop    es
 310210d:	07                   	pop    es
 310210e:	00 00                	add    BYTE PTR [eax],al
 3102110:	d8 23                	fsub   DWORD PTR [ebx]
 3102112:	10 03                	adc    BYTE PTR [ebx],al
 3102114:	07                   	pop    es
 3102115:	08 00                	or     BYTE PTR [eax],al
 3102117:	00 dc                	add    ah,bl
 3102119:	23 10                	and    edx,DWORD PTR [eax]
 310211b:	03 07                	add    eax,DWORD PTR [edi]
 310211d:	09 00                	or     DWORD PTR [eax],eax
 310211f:	00 e0                	add    al,ah
 3102121:	23 10                	and    edx,DWORD PTR [eax]
 3102123:	03 07                	add    eax,DWORD PTR [edi]
 3102125:	0a 00                	or     al,BYTE PTR [eax]
 3102127:	00 e4                	add    ah,ah
 3102129:	23 10                	and    edx,DWORD PTR [eax]
 310212b:	03 07                	add    eax,DWORD PTR [edi]
 310212d:	0b 00                	or     eax,DWORD PTR [eax]
 310212f:	00 e8                	add    al,ch
 3102131:	23 10                	and    edx,DWORD PTR [eax]
 3102133:	03 07                	add    eax,DWORD PTR [edi]
 3102135:	0c 00                	or     al,0x0
 3102137:	00 ec                	add    ah,ch
 3102139:	23 10                	and    edx,DWORD PTR [eax]
 310213b:	03 07                	add    eax,DWORD PTR [edi]
 310213d:	0d 00 00 f0 23       	or     eax,0x23f00000
 3102142:	10 03                	adc    BYTE PTR [ebx],al
 3102144:	07                   	pop    es
 3102145:	0e                   	push   cs
 3102146:	00 00                	add    BYTE PTR [eax],al
 3102148:	f4                   	hlt    
 3102149:	23 10                	and    edx,DWORD PTR [eax]
 310214b:	03 07                	add    eax,DWORD PTR [edi]
 310214d:	0f 00 00             	sldt   WORD PTR [eax]
 3102150:	f8                   	clc    
 3102151:	23 10                	and    edx,DWORD PTR [eax]
 3102153:	03 07                	add    eax,DWORD PTR [edi]
 3102155:	10 00                	adc    BYTE PTR [eax],al
 3102157:	00 fc                	add    ah,bh
 3102159:	23 10                	and    edx,DWORD PTR [eax]
 310215b:	03 07                	add    eax,DWORD PTR [edi]
 310215d:	11 00                	adc    DWORD PTR [eax],eax
 310215f:	00 00                	add    BYTE PTR [eax],al
 3102161:	24 10                	and    al,0x10
 3102163:	03 07                	add    eax,DWORD PTR [edi]
 3102165:	12 00                	adc    al,BYTE PTR [eax]
 3102167:	00 04 24             	add    BYTE PTR [esp],al
 310216a:	10 03                	adc    BYTE PTR [ebx],al
 310216c:	07                   	pop    es
 310216d:	13 00                	adc    eax,DWORD PTR [eax]
 310216f:	00 08                	add    BYTE PTR [eax],cl
 3102171:	24 10                	and    al,0x10
 3102173:	03 07                	add    eax,DWORD PTR [edi]
 3102175:	14 00                	adc    al,0x0
 3102177:	00 0c 24             	add    BYTE PTR [esp],cl
 310217a:	10 03                	adc    BYTE PTR [ebx],al
 310217c:	07                   	pop    es
 310217d:	15 00 00 10 24       	adc    eax,0x24100000
 3102182:	10 03                	adc    BYTE PTR [ebx],al
 3102184:	07                   	pop    es
 3102185:	16                   	push   ss
 3102186:	00 00                	add    BYTE PTR [eax],al
 3102188:	14 24                	adc    al,0x24
 310218a:	10 03                	adc    BYTE PTR [ebx],al
 310218c:	07                   	pop    es
 310218d:	17                   	pop    ss
 310218e:	00 00                	add    BYTE PTR [eax],al
 3102190:	18 24 10             	sbb    BYTE PTR [eax+edx*1],ah
 3102193:	03 07                	add    eax,DWORD PTR [edi]
 3102195:	18 00                	sbb    BYTE PTR [eax],al
 3102197:	00 1c 24             	add    BYTE PTR [esp],bl
 310219a:	10 03                	adc    BYTE PTR [ebx],al
 310219c:	07                   	pop    es
 310219d:	19 00                	sbb    DWORD PTR [eax],eax
 310219f:	00 20                	add    BYTE PTR [eax],ah
 31021a1:	24 10                	and    al,0x10
 31021a3:	03 07                	add    eax,DWORD PTR [edi]
 31021a5:	1a 00                	sbb    al,BYTE PTR [eax]
 31021a7:	00 24 24             	add    BYTE PTR [esp],ah
 31021aa:	10 03                	adc    BYTE PTR [ebx],al
 31021ac:	07                   	pop    es
 31021ad:	1b 00                	sbb    eax,DWORD PTR [eax]
 31021af:	00 28                	add    BYTE PTR [eax],ch
 31021b1:	24 10                	and    al,0x10
 31021b3:	03 07                	add    eax,DWORD PTR [edi]
 31021b5:	1c 00                	sbb    al,0x0
 31021b7:	00 2c 24             	add    BYTE PTR [esp],ch
 31021ba:	10 03                	adc    BYTE PTR [ebx],al
 31021bc:	07                   	pop    es
 31021bd:	1d 00 00 30 24       	sbb    eax,0x24300000
 31021c2:	10 03                	adc    BYTE PTR [ebx],al
 31021c4:	07                   	pop    es
 31021c5:	1e                   	push   ds
	...

Disassembly of section .data:

031021e0 <cmds>:
 31021e0:	e0 14                	loopne 31021f6 <cmds+0x16>
 31021e2:	10 03                	adc    BYTE PTR [ebx],al
 31021e4:	e6 14                	out    0x14,al
 31021e6:	10 03                	adc    BYTE PTR [ebx],al
 31021e8:	00 00                	add    BYTE PTR [eax],al
 31021ea:	10 03                	adc    BYTE PTR [ebx],al
 31021ec:	00 00                	add    BYTE PTR [eax],al
 31021ee:	00 00                	add    BYTE PTR [eax],al
 31021f0:	f7 14 10             	not    DWORD PTR [eax+edx*1]
 31021f3:	03 fb                	add    edi,ebx
 31021f5:	14 10                	adc    al,0x10
 31021f7:	03 19                	add    ebx,DWORD PTR [ecx]
 31021f9:	00 10                	add    BYTE PTR [eax],dl
 31021fb:	03 00                	add    eax,DWORD PTR [eax]
 31021fd:	00 00                	add    BYTE PTR [eax],al
 31021ff:	00 0d 15 10 03 12    	add    BYTE PTR ds:0x12031015,cl
 3102205:	15 10 03 39 05       	adc    eax,0x5390310
 310220a:	10 03                	adc    BYTE PTR [ebx],al
 310220c:	01 00                	add    DWORD PTR [eax],eax
 310220e:	00 00                	add    BYTE PTR [eax],al
 3102210:	24 15                	and    al,0x15
 3102212:	10 03                	adc    BYTE PTR [ebx],al
 3102214:	29 15 10 03 52 05    	sub    DWORD PTR ds:0x5520310,edx
 310221a:	10 03                	adc    BYTE PTR [ebx],al
 310221c:	01 00                	add    DWORD PTR [eax],eax
 310221e:	00 00                	add    BYTE PTR [eax],al
 3102220:	35 15 10 03 3a       	xor    eax,0x3a031015
 3102225:	15 10 03 aa 05       	adc    eax,0x5aa0310
 310222a:	10 03                	adc    BYTE PTR [ebx],al
 310222c:	01 00                	add    DWORD PTR [eax],eax
 310222e:	00 00                	add    BYTE PTR [eax],al
 3102230:	56                   	push   esi
 3102231:	15 10 03 5a 15       	adc    eax,0x155a0310
 3102236:	10 03                	adc    BYTE PTR [ebx],al
 3102238:	78 06                	js     3102240 <cmds+0x60>
 310223a:	10 03                	adc    BYTE PTR [ebx],al
 310223c:	00 00                	add    BYTE PTR [eax],al
 310223e:	00 00                	add    BYTE PTR [eax],al
 3102240:	72 15                	jb     3102257 <cmds+0x77>
 3102242:	10 03                	adc    BYTE PTR [ebx],al
 3102244:	79 15                	jns    310225b <cmds+0x7b>
 3102246:	10 03                	adc    BYTE PTR [ebx],al
 3102248:	70 04                	jo     310224e <cmds+0x6e>
 310224a:	10 03                	adc    BYTE PTR [ebx],al
 310224c:	01 00                	add    DWORD PTR [eax],eax
 310224e:	00 00                	add    BYTE PTR [eax],al
 3102250:	92                   	xchg   edx,eax
 3102251:	15 10 03 96 15       	adc    eax,0x15960310
 3102256:	10 03                	adc    BYTE PTR [ebx],al
 3102258:	68 00 10 03 01       	push   0x1031000
 310225d:	00 00                	add    BYTE PTR [eax],al
 310225f:	00 b2 15 10 03 b8    	add    BYTE PTR [edx-0x47fcefeb],dh
 3102265:	15 10 03 c6 06       	adc    eax,0x6c60310
 310226a:	10 03                	adc    BYTE PTR [ebx],al
 310226c:	01 00                	add    DWORD PTR [eax],eax
 310226e:	00 00                	add    BYTE PTR [eax],al
 3102270:	cc                   	int3   
 3102271:	15 10 03 d4 15       	adc    eax,0x15d40310
 3102276:	10 03                	adc    BYTE PTR [ebx],al
 3102278:	57                   	push   edi
 3102279:	04 10                	add    al,0x10
 310227b:	03 01                	add    eax,DWORD PTR [ecx]
 310227d:	00 00                	add    BYTE PTR [eax],al
	...

03102280 <cmds>:
 3102280:	40                   	inc    eax
 3102281:	17                   	pop    ss
 3102282:	10 03                	adc    BYTE PTR [ebx],al
 3102284:	46                   	inc    esi
 3102285:	17                   	pop    ss
 3102286:	10 03                	adc    BYTE PTR [ebx],al
 3102288:	00 00                	add    BYTE PTR [eax],al
 310228a:	10 03                	adc    BYTE PTR [ebx],al
 310228c:	00 00                	add    BYTE PTR [eax],al
 310228e:	00 00                	add    BYTE PTR [eax],al
 3102290:	57                   	push   edi
 3102291:	17                   	pop    ss
 3102292:	10 03                	adc    BYTE PTR [ebx],al
 3102294:	5b                   	pop    ebx
 3102295:	17                   	pop    ss
 3102296:	10 03                	adc    BYTE PTR [ebx],al
 3102298:	19 00                	sbb    DWORD PTR [eax],eax
 310229a:	10 03                	adc    BYTE PTR [ebx],al
 310229c:	00 00                	add    BYTE PTR [eax],al
 310229e:	00 00                	add    BYTE PTR [eax],al
 31022a0:	6d                   	ins    DWORD PTR es:[edi],dx
 31022a1:	17                   	pop    ss
 31022a2:	10 03                	adc    BYTE PTR [ebx],al
 31022a4:	72 17                	jb     31022bd <cmds+0x3d>
 31022a6:	10 03                	adc    BYTE PTR [ebx],al
 31022a8:	39 05 10 03 01 00    	cmp    DWORD PTR ds:0x10310,eax
 31022ae:	00 00                	add    BYTE PTR [eax],al
 31022b0:	84 17                	test   BYTE PTR [edi],dl
 31022b2:	10 03                	adc    BYTE PTR [ebx],al
 31022b4:	89 17                	mov    DWORD PTR [edi],edx
 31022b6:	10 03                	adc    BYTE PTR [ebx],al
 31022b8:	52                   	push   edx
 31022b9:	05 10 03 01 00       	add    eax,0x10310
 31022be:	00 00                	add    BYTE PTR [eax],al
 31022c0:	95                   	xchg   ebp,eax
 31022c1:	17                   	pop    ss
 31022c2:	10 03                	adc    BYTE PTR [ebx],al
 31022c4:	9a 17 10 03 aa 05 10 	call   0x1005:0xaa031017
 31022cb:	03 01                	add    eax,DWORD PTR [ecx]
 31022cd:	00 00                	add    BYTE PTR [eax],al
 31022cf:	00 b6 17 10 03 ba    	add    BYTE PTR [esi-0x45fcefe9],dh
 31022d5:	17                   	pop    ss
 31022d6:	10 03                	adc    BYTE PTR [ebx],al
 31022d8:	78 06                	js     31022e0 <cmds+0x60>
 31022da:	10 03                	adc    BYTE PTR [ebx],al
 31022dc:	00 00                	add    BYTE PTR [eax],al
 31022de:	00 00                	add    BYTE PTR [eax],al
 31022e0:	d2 17                	rcl    BYTE PTR [edi],cl
 31022e2:	10 03                	adc    BYTE PTR [ebx],al
 31022e4:	d9 17                	fst    DWORD PTR [edi]
 31022e6:	10 03                	adc    BYTE PTR [ebx],al
 31022e8:	70 04                	jo     31022ee <cmds+0x6e>
 31022ea:	10 03                	adc    BYTE PTR [ebx],al
 31022ec:	01 00                	add    DWORD PTR [eax],eax
 31022ee:	00 00                	add    BYTE PTR [eax],al
 31022f0:	f2 17                	repnz pop ss
 31022f2:	10 03                	adc    BYTE PTR [ebx],al
 31022f4:	f6 17                	not    BYTE PTR [edi]
 31022f6:	10 03                	adc    BYTE PTR [ebx],al
 31022f8:	68 00 10 03 01       	push   0x1031000
 31022fd:	00 00                	add    BYTE PTR [eax],al
 31022ff:	00 12                	add    BYTE PTR [edx],dl
 3102301:	18 10                	sbb    BYTE PTR [eax],dl
 3102303:	03 18                	add    ebx,DWORD PTR [eax]
 3102305:	18 10                	sbb    BYTE PTR [eax],dl
 3102307:	03 c6                	add    eax,esi
 3102309:	06                   	push   es
 310230a:	10 03                	adc    BYTE PTR [ebx],al
 310230c:	01 00                	add    DWORD PTR [eax],eax
 310230e:	00 00                	add    BYTE PTR [eax],al
 3102310:	2c 18                	sub    al,0x18
 3102312:	10 03                	adc    BYTE PTR [ebx],al
 3102314:	34 18                	xor    al,0x18
 3102316:	10 03                	adc    BYTE PTR [ebx],al
 3102318:	57                   	push   edi
 3102319:	04 10                	add    al,0x10
 310231b:	03 01                	add    eax,DWORD PTR [ecx]
 310231d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynamic:

03102320 <_DYNAMIC>:
 3102320:	01 00                	add    DWORD PTR [eax],eax
 3102322:	00 00                	add    BYTE PTR [eax],al
 3102324:	01 00                	add    DWORD PTR [eax],eax
 3102326:	00 00                	add    BYTE PTR [eax],al
 3102328:	0f 00 00             	sldt   WORD PTR [eax]
 310232b:	00 e0                	add    al,ah
 310232d:	00 00                	add    BYTE PTR [eax],al
 310232f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3102332:	00 00                	add    BYTE PTR [eax],al
 3102334:	fc                   	cld    
 3102335:	1e                   	push   ds
 3102336:	10 03                	adc    BYTE PTR [ebx],al
 3102338:	05 00 00 00 f8       	add    eax,0xf8000000
 310233d:	1d 10 03 06 00       	sbb    eax,0x60310
 3102342:	00 00                	add    BYTE PTR [eax],al
 3102344:	08 1c 10             	or     BYTE PTR [eax+edx*1],bl
 3102347:	03 0a                	add    ecx,DWORD PTR [edx]
 3102349:	00 00                	add    BYTE PTR [eax],al
 310234b:	00 03                	add    BYTE PTR [ebx],al
 310234d:	01 00                	add    DWORD PTR [eax],eax
 310234f:	00 0b                	add    BYTE PTR [ebx],cl
 3102351:	00 00                	add    BYTE PTR [eax],al
 3102353:	00 10                	add    BYTE PTR [eax],dl
 3102355:	00 00                	add    BYTE PTR [eax],al
 3102357:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 310235d:	00 00                	add    BYTE PTR [eax],al
 310235f:	00 03                	add    BYTE PTR [ebx],al
 3102361:	00 00                	add    BYTE PTR [eax],al
 3102363:	00 b0 23 10 03 02    	add    BYTE PTR [eax+0x2031023],dh
 3102369:	00 00                	add    BYTE PTR [eax],al
 310236b:	00 f0                	add    al,dh
 310236d:	00 00                	add    BYTE PTR [eax],al
 310236f:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
 3102372:	00 00                	add    BYTE PTR [eax],al
 3102374:	11 00                	adc    DWORD PTR [eax],eax
 3102376:	00 00                	add    BYTE PTR [eax],al
 3102378:	17                   	pop    ss
 3102379:	00 00                	add    BYTE PTR [eax],al
 310237b:	00 d8                	add    al,bl
 310237d:	20 10                	and    BYTE PTR [eax],dl
 310237f:	03 00                	add    eax,DWORD PTR [eax]
	...

Disassembly of section .got.plt:

031023b0 <_GLOBAL_OFFSET_TABLE_>:
 31023b0:	20 23                	and    BYTE PTR [ebx],ah
 31023b2:	10 03                	adc    BYTE PTR [ebx],al
	...
 31023bc:	06                   	push   es
 31023bd:	13 10                	adc    edx,DWORD PTR [eax]
 31023bf:	03 16                	add    edx,DWORD PTR [esi]
 31023c1:	13 10                	adc    edx,DWORD PTR [eax]
 31023c3:	03 26                	add    esp,DWORD PTR [esi]
 31023c5:	13 10                	adc    edx,DWORD PTR [eax]
 31023c7:	03 36                	add    esi,DWORD PTR [esi]
 31023c9:	13 10                	adc    edx,DWORD PTR [eax]
 31023cb:	03 46 13             	add    eax,DWORD PTR [esi+0x13]
 31023ce:	10 03                	adc    BYTE PTR [ebx],al
 31023d0:	56                   	push   esi
 31023d1:	13 10                	adc    edx,DWORD PTR [eax]
 31023d3:	03 66 13             	add    esp,DWORD PTR [esi+0x13]
 31023d6:	10 03                	adc    BYTE PTR [ebx],al
 31023d8:	76 13                	jbe    31023ed <_GLOBAL_OFFSET_TABLE_+0x3d>
 31023da:	10 03                	adc    BYTE PTR [ebx],al
 31023dc:	86 13                	xchg   BYTE PTR [ebx],dl
 31023de:	10 03                	adc    BYTE PTR [ebx],al
 31023e0:	96                   	xchg   esi,eax
 31023e1:	13 10                	adc    edx,DWORD PTR [eax]
 31023e3:	03 a6 13 10 03 b6    	add    esp,DWORD PTR [esi-0x49fcefed]
 31023e9:	13 10                	adc    edx,DWORD PTR [eax]
 31023eb:	03 c6                	add    eax,esi
 31023ed:	13 10                	adc    edx,DWORD PTR [eax]
 31023ef:	03 d6                	add    edx,esi
 31023f1:	13 10                	adc    edx,DWORD PTR [eax]
 31023f3:	03 e6                	add    esp,esi
 31023f5:	13 10                	adc    edx,DWORD PTR [eax]
 31023f7:	03 f6                	add    esi,esi
 31023f9:	13 10                	adc    edx,DWORD PTR [eax]
 31023fb:	03 06                	add    eax,DWORD PTR [esi]
 31023fd:	14 10                	adc    al,0x10
 31023ff:	03 16                	add    edx,DWORD PTR [esi]
 3102401:	14 10                	adc    al,0x10
 3102403:	03 26                	add    esp,DWORD PTR [esi]
 3102405:	14 10                	adc    al,0x10
 3102407:	03 36                	add    esi,DWORD PTR [esi]
 3102409:	14 10                	adc    al,0x10
 310240b:	03 46 14             	add    eax,DWORD PTR [esi+0x14]
 310240e:	10 03                	adc    BYTE PTR [ebx],al
 3102410:	56                   	push   esi
 3102411:	14 10                	adc    al,0x10
 3102413:	03 66 14             	add    esp,DWORD PTR [esi+0x14]
 3102416:	10 03                	adc    BYTE PTR [ebx],al
 3102418:	76 14                	jbe    310242e <_GLOBAL_OFFSET_TABLE_+0x7e>
 310241a:	10 03                	adc    BYTE PTR [ebx],al
 310241c:	86 14 10             	xchg   BYTE PTR [eax+edx*1],dl
 310241f:	03 96 14 10 03 a6    	add    edx,DWORD PTR [esi-0x59fcefec]
 3102425:	14 10                	adc    al,0x10
 3102427:	03 b6 14 10 03 c6    	add    esi,DWORD PTR [esi-0x39fcefec]
 310242d:	14 10                	adc    al,0x10
 310242f:	03 d6                	add    edx,esi
 3102431:	14 10                	adc    al,0x10
 3102433:	03                   	.byte 0x3

Disassembly of section .bss:

03102440 <bSigIntReceived>:
 3102440:	00 00                	add    BYTE PTR [eax],al
	...

03102444 <delim>:
	...

0310244c <environmentLoc>:
	...

03102460 <cwd>:
	...

03102560 <sExecutingProgram>:
	...

03102760 <command_function_p>:
 3102760:	00 00                	add    BYTE PTR [eax],al
	...

03102764 <cpuid_extended_feature_bits>:
 3102764:	00 00                	add    BYTE PTR [eax],al
	...

03102768 <heapEnd>:
 3102768:	00 00                	add    BYTE PTR [eax],al
	...

0310276c <heapBase>:
 310276c:	00 00                	add    BYTE PTR [eax],al
	...

03102770 <heapCurr>:
 3102770:	00 00                	add    BYTE PTR [eax],al
	...

03102774 <command_function>:
 3102774:	00 00                	add    BYTE PTR [eax],al
	...

03102778 <cpuid_procinfo>:
	...

03102780 <processEnvp>:
 3102780:	00 00                	add    BYTE PTR [eax],al
	...

03102784 <lastExecExitCode>:
 3102784:	00 00                	add    BYTE PTR [eax],al
	...

03102788 <exitCode>:
 3102788:	00 00                	add    BYTE PTR [eax],al
	...

0310278c <sKShellProgramName>:
 310278c:	00 00                	add    BYTE PTR [eax],al
	...

03102790 <libcTZ>:
 3102790:	00 00                	add    BYTE PTR [eax],al
	...

03102794 <timeToExit>:
 3102794:	00 00                	add    BYTE PTR [eax],al
	...

03102798 <commandHistoryPtr>:
 3102798:	00 00                	add    BYTE PTR [eax],al
	...

0310279c <commandHistoryMax>:
 310279c:	00 00                	add    BYTE PTR [eax],al
	...

031027a0 <commandHistory>:
	...

031121a0 <lCommand>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	df 08                	fisttp WORD PTR [eax]
       2:	00 00                	add    BYTE PTR [eax],al
       4:	04 00                	add    al,0x0
       6:	00 00                	add    BYTE PTR [eax],al
       8:	00 00                	add    BYTE PTR [eax],al
       a:	04 01                	add    al,0x1
       c:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
       d:	00 00                	add    BYTE PTR [eax],al
       f:	00 0c fd 00 00 00 37 	add    BYTE PTR [edi*8+0x37000000],cl
      16:	00 00                	add    BYTE PTR [eax],al
      18:	00 00                	add    BYTE PTR [eax],al
      1a:	00 10                	add    BYTE PTR [eax],dl
      1c:	03 d7                	add    edx,edi
      1e:	07                   	pop    es
      1f:	00 00                	add    BYTE PTR [eax],al
      21:	00 00                	add    BYTE PTR [eax],al
      23:	00 00                	add    BYTE PTR [eax],al
      25:	02 01                	add    al,BYTE PTR [ecx]
      27:	06                   	push   es
      28:	72 02                	jb     2c <cmdClearScreen-0x30fffd4>
      2a:	00 00                	add    BYTE PTR [eax],al
      2c:	02 01                	add    al,BYTE PTR [ecx]
      2e:	06                   	push   es
      2f:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
      32:	00 02                	add    BYTE PTR [edx],al
      34:	02 05 27 01 00 00    	add    al,BYTE PTR ds:0x127
      3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
      41:	02 08                	add    cl,BYTE PTR [eax]
      43:	05 be 01 00 00       	add    eax,0x1be
      48:	04 52                	add    al,0x52
      4a:	01 00                	add    DWORD PTR [eax],eax
      4c:	00 02                	add    BYTE PTR [edx],al
      4e:	2e                   	cs
      4f:	53                   	push   ebx
      50:	00 00                	add    BYTE PTR [eax],al
      52:	00 02                	add    BYTE PTR [edx],al
      54:	01 08                	add    DWORD PTR [eax],ecx
      56:	69 02 00 00 02 02    	imul   eax,DWORD PTR [edx],0x2020000
      5c:	07                   	pop    es
      5d:	d3 02                	rol    DWORD PTR [edx],cl
      5f:	00 00                	add    BYTE PTR [eax],al
      61:	04 a6                	add    al,0xa6
      63:	02 00                	add    al,BYTE PTR [eax]
      65:	00 02                	add    BYTE PTR [edx],al
      67:	34 6c                	xor    al,0x6c
      69:	00 00                	add    BYTE PTR [eax],al
      6b:	00 02                	add    BYTE PTR [edx],al
      6d:	04 07                	add    al,0x7
      6f:	91                   	xchg   ecx,eax
      70:	02 00                	add    al,BYTE PTR [eax]
      72:	00 02                	add    BYTE PTR [edx],al
      74:	08 07                	or     BYTE PTR [edi],al
      76:	87 02                	xchg   DWORD PTR [edx],eax
      78:	00 00                	add    BYTE PTR [eax],al
      7a:	04 63                	add    al,0x63
      7c:	01 00                	add    DWORD PTR [eax],eax
      7e:	00 02                	add    BYTE PTR [edx],al
      80:	56                   	push   esi
      81:	6c                   	ins    BYTE PTR es:[edi],dx
      82:	00 00                	add    BYTE PTR [eax],al
      84:	00 02                	add    BYTE PTR [edx],al
      86:	04 05                	add    al,0x5
      88:	c3                   	ret    
      89:	01 00                	add    DWORD PTR [eax],eax
      8b:	00 05 74 6d 00 2c    	add    BYTE PTR ds:0x2c006d74,al
      91:	03 2c 1c             	add    ebp,DWORD PTR [esp+ebx*1]
      94:	01 00                	add    DWORD PTR [eax],eax
      96:	00 06                	add    BYTE PTR [esi],al
      98:	ae                   	scas   al,BYTE PTR es:[edi]
      99:	03 00                	add    eax,DWORD PTR [eax]
      9b:	00 03                	add    BYTE PTR [ebx],al
      9d:	2e 3a 00             	cmp    al,BYTE PTR cs:[eax]
      a0:	00 00                	add    BYTE PTR [eax],al
      a2:	00 06                	add    BYTE PTR [esi],al
      a4:	29 03                	sub    DWORD PTR [ebx],eax
      a6:	00 00                	add    BYTE PTR [eax],al
      a8:	03 2f                	add    ebp,DWORD PTR [edi]
      aa:	3a 00                	cmp    al,BYTE PTR [eax]
      ac:	00 00                	add    BYTE PTR [eax],al
      ae:	04 06                	add    al,0x6
      b0:	94                   	xchg   esp,eax
      b1:	01 00                	add    DWORD PTR [eax],eax
      b3:	00 03                	add    BYTE PTR [ebx],al
      b5:	30 3a                	xor    BYTE PTR [edx],bh
      b7:	00 00                	add    BYTE PTR [eax],al
      b9:	00 08                	add    BYTE PTR [eax],cl
      bb:	06                   	push   es
      bc:	af                   	scas   eax,DWORD PTR es:[edi]
      bd:	02 00                	add    al,BYTE PTR [eax]
      bf:	00 03                	add    BYTE PTR [ebx],al
      c1:	31 3a                	xor    DWORD PTR [edx],edi
      c3:	00 00                	add    BYTE PTR [eax],al
      c5:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
      c8:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
      c9:	01 00                	add    DWORD PTR [eax],eax
      cb:	00 03                	add    BYTE PTR [ebx],al
      cd:	32 3a                	xor    bh,BYTE PTR [edx]
      cf:	00 00                	add    BYTE PTR [eax],al
      d1:	00 10                	add    BYTE PTR [eax],dl
      d3:	06                   	push   es
      d4:	7f 02                	jg     d8 <cmdClearScreen-0x30fff28>
      d6:	00 00                	add    BYTE PTR [eax],al
      d8:	03 33                	add    esi,DWORD PTR [ebx]
      da:	3a 00                	cmp    al,BYTE PTR [eax]
      dc:	00 00                	add    BYTE PTR [eax],al
      de:	14 06                	adc    al,0x6
      e0:	53                   	push   ebx
      e1:	03 00                	add    eax,DWORD PTR [eax]
      e3:	00 03                	add    BYTE PTR [ebx],al
      e5:	34 3a                	xor    al,0x3a
      e7:	00 00                	add    BYTE PTR [eax],al
      e9:	00 18                	add    BYTE PTR [eax],bl
      eb:	06                   	push   es
      ec:	0e                   	push   cs
      ed:	03 00                	add    eax,DWORD PTR [eax]
      ef:	00 03                	add    BYTE PTR [ebx],al
      f1:	35 3a 00 00 00       	xor    eax,0x3a
      f6:	1c 06                	sbb    al,0x6
      f8:	30 03                	xor    BYTE PTR [ebx],al
      fa:	00 00                	add    BYTE PTR [eax],al
      fc:	03 36                	add    esi,DWORD PTR [esi]
      fe:	3a 00                	cmp    al,BYTE PTR [eax]
     100:	00 00                	add    BYTE PTR [eax],al
     102:	20 06                	and    BYTE PTR [esi],al
     104:	0c 01                	or     al,0x1
     106:	00 00                	add    BYTE PTR [eax],al
     108:	03 37                	add    esi,DWORD PTR [edi]
     10a:	85 00                	test   DWORD PTR [eax],eax
     10c:	00 00                	add    BYTE PTR [eax],al
     10e:	24 06                	and    al,0x6
     110:	56                   	push   esi
     111:	00 00                	add    BYTE PTR [eax],al
     113:	00 03                	add    BYTE PTR [ebx],al
     115:	38 1c 01             	cmp    BYTE PTR [ecx+eax*1],bl
     118:	00 00                	add    BYTE PTR [eax],al
     11a:	28 00                	sub    BYTE PTR [eax],al
     11c:	07                   	pop    es
     11d:	04 22                	add    al,0x22
     11f:	01 00                	add    DWORD PTR [eax],eax
     121:	00 08                	add    BYTE PTR [eax],cl
     123:	25 00 00 00 02       	and    eax,0x2000000
     128:	01 02                	add    DWORD PTR [edx],eax
     12a:	16                   	push   ss
     12b:	03 00                	add    eax,DWORD PTR [eax]
     12d:	00 09                	add    BYTE PTR [ecx],cl
     12f:	04 02                	add    al,0x2
     131:	04 07                	add    al,0x7
     133:	85 00                	test   DWORD PTR [eax],eax
     135:	00 00                	add    BYTE PTR [eax],al
     137:	0a 05 04 58 b8 01    	or     al,BYTE PTR ds:0x1b85804
     13d:	00 00                	add    BYTE PTR [eax],al
     13f:	0b f9                	or     edi,ecx
     141:	03 00                	add    eax,DWORD PTR [eax]
     143:	00 04 59             	add    BYTE PTR [ecx+ebx*2],al
     146:	48                   	dec    eax
     147:	00 00                	add    BYTE PTR [eax],al
     149:	00 01                	add    BYTE PTR [ecx],al
     14b:	04 04                	add    al,0x4
     14d:	00 0b                	add    BYTE PTR [ebx],cl
     14f:	f0 02 00             	lock add al,BYTE PTR [eax]
     152:	00 04 5a             	add    BYTE PTR [edx+ebx*2],al
     155:	48                   	dec    eax
     156:	00 00                	add    BYTE PTR [eax],al
     158:	00 01                	add    BYTE PTR [ecx],al
     15a:	04 00                	add    al,0x0
     15c:	00 0b                	add    BYTE PTR [ebx],cl
     15e:	9f                   	lahf   
     15f:	02 00                	add    al,BYTE PTR [eax]
     161:	00 04 5b             	add    BYTE PTR [ebx+ebx*2],al
     164:	48                   	dec    eax
     165:	00 00                	add    BYTE PTR [eax],al
     167:	00 01                	add    BYTE PTR [ecx],al
     169:	04 04                	add    al,0x4
     16b:	01 0b                	add    DWORD PTR [ebx],ecx
     16d:	89 00                	mov    DWORD PTR [eax],eax
     16f:	00 00                	add    BYTE PTR [eax],al
     171:	04 5c                	add    al,0x5c
     173:	48                   	dec    eax
     174:	00 00                	add    BYTE PTR [eax],al
     176:	00 01                	add    BYTE PTR [ecx],al
     178:	02 02                	add    al,BYTE PTR [edx]
     17a:	01 0b                	add    DWORD PTR [ebx],ecx
     17c:	e7 01                	out    0x1,eax
     17e:	00 00                	add    BYTE PTR [eax],al
     180:	04 5d                	add    al,0x5d
     182:	48                   	dec    eax
     183:	00 00                	add    BYTE PTR [eax],al
     185:	00 01                	add    BYTE PTR [ecx],al
     187:	02 00                	add    al,BYTE PTR [eax]
     189:	01 0b                	add    DWORD PTR [ebx],ecx
     18b:	ef                   	out    dx,eax
     18c:	02 00                	add    al,BYTE PTR [eax]
     18e:	00 04 5e             	add    BYTE PTR [esi+ebx*2],al
     191:	48                   	dec    eax
     192:	00 00                	add    BYTE PTR [eax],al
     194:	00 01                	add    BYTE PTR [ecx],al
     196:	04 04                	add    al,0x4
     198:	02 0b                	add    cl,BYTE PTR [ebx]
     19a:	9e                   	sahf   
     19b:	02 00                	add    al,BYTE PTR [eax]
     19d:	00 04 5f             	add    BYTE PTR [edi+ebx*2],al
     1a0:	48                   	dec    eax
     1a1:	00 00                	add    BYTE PTR [eax],al
     1a3:	00 01                	add    BYTE PTR [ecx],al
     1a5:	08 00                	or     BYTE PTR [eax],al
     1a7:	03 0b                	add    ecx,DWORD PTR [ebx]
     1a9:	ec                   	in     al,dx
     1aa:	01 00                	add    DWORD PTR [eax],eax
     1ac:	00 04 60             	add    BYTE PTR [eax+eiz*2],al
     1af:	48                   	dec    eax
     1b0:	00 00                	add    BYTE PTR [eax],al
     1b2:	00 01                	add    BYTE PTR [ecx],al
     1b4:	04 04                	add    al,0x4
     1b6:	04 00                	add    al,0x0
     1b8:	0c 08                	or     al,0x8
     1ba:	04 56                	add    al,0x56
     1bc:	d1 01                	rol    DWORD PTR [ecx],1
     1be:	00 00                	add    BYTE PTR [eax],al
     1c0:	0d 37 01 00 00       	or     eax,0x137
     1c5:	0e                   	push   cs
     1c6:	72 65                	jb     22d <cmdClearScreen-0x30ffdd3>
     1c8:	67 00 04             	add    BYTE PTR [si],al
     1cb:	62 61 00             	bound  esp,QWORD PTR [ecx+0x0]
     1ce:	00 00                	add    BYTE PTR [eax],al
     1d0:	00 0a                	add    BYTE PTR [edx],cl
     1d2:	04 04                	add    al,0x4
     1d4:	db 07                	fild   DWORD PTR [edi]
     1d6:	02 00                	add    al,BYTE PTR [eax]
     1d8:	00 0b                	add    BYTE PTR [ebx],cl
     1da:	90                   	nop
     1db:	03 00                	add    eax,DWORD PTR [eax]
     1dd:	00 04 dc             	add    BYTE PTR [esp+ebx*8],al
     1e0:	48                   	dec    eax
     1e1:	00 00                	add    BYTE PTR [eax],al
     1e3:	00 01                	add    BYTE PTR [ecx],al
     1e5:	01 07                	add    DWORD PTR [edi],eax
     1e7:	00 0b                	add    BYTE PTR [ebx],cl
     1e9:	a3 03 00 00 04       	mov    ds:0x4000003,eax
     1ee:	dd 48 00             	fisttp QWORD PTR [eax+0x0]
     1f1:	00 00                	add    BYTE PTR [eax],al
     1f3:	01 01                	add    DWORD PTR [ecx],eax
     1f5:	06                   	push   es
     1f6:	00 0b                	add    BYTE PTR [ebx],cl
     1f8:	d6                   	(bad)  
     1f9:	03 00                	add    eax,DWORD PTR [eax]
     1fb:	00 04 de             	add    BYTE PTR [esi+ebx*8],al
     1fe:	61                   	popa   
     1ff:	00 00                	add    BYTE PTR [eax],al
     201:	00 04 1e             	add    BYTE PTR [esi+ebx*1],al
     204:	00 00                	add    BYTE PTR [eax],al
     206:	00 0c 04             	add    BYTE PTR [esp+eax*1],cl
     209:	04 da                	add    al,0xda
     20b:	20 02                	and    BYTE PTR [edx],al
     20d:	00 00                	add    BYTE PTR [eax],al
     20f:	0d d1 01 00 00       	or     eax,0x1d1
     214:	0e                   	push   cs
     215:	72 65                	jb     27c <cmdClearScreen-0x30ffd84>
     217:	67 00 04             	add    BYTE PTR [si],al
     21a:	e0 61                	loopne 27d <cmdClearScreen-0x30ffd83>
     21c:	00 00                	add    BYTE PTR [eax],al
     21e:	00 00                	add    BYTE PTR [eax],al
     220:	0f 5a 01             	cvtps2pd xmm0,QWORD PTR [ecx]
     223:	00 00                	add    BYTE PTR [eax],al
     225:	04 6c                	add    al,0x6c
     227:	00 00                	add    BYTE PTR [eax],al
     229:	00 08                	add    BYTE PTR [eax],cl
     22b:	15 5b 02 00 00       	adc    eax,0x25b
     230:	10 1c 03             	adc    BYTE PTR [ebx+eax*1],bl
     233:	00 00                	add    BYTE PTR [eax],al
     235:	01 10                	add    DWORD PTR [eax],edx
     237:	05 02 00 00 02       	add    eax,0x2000002
     23c:	10 16                	adc    BYTE PTR [esi],dl
     23e:	01 00                	add    DWORD PTR [eax],eax
     240:	00 04 10             	add    BYTE PTR [eax+edx*1],al
     243:	df 03                	fild   WORD PTR [ebx]
     245:	00 00                	add    BYTE PTR [eax],al
     247:	08 10                	or     BYTE PTR [eax],dl
     249:	4b                   	dec    ebx
     24a:	03 00                	add    eax,DWORD PTR [eax]
     24c:	00 10                	add    BYTE PTR [eax],dl
     24e:	10 97 00 00 00 20    	adc    BYTE PTR [edi+0x20000000],dl
     254:	10 00                	adc    BYTE PTR [eax],al
     256:	03 00                	add    eax,DWORD PTR [eax]
     258:	00 40 00             	add    BYTE PTR [eax+0x0],al
     25b:	0a 10                	or     dl,BYTE PTR [eax]
     25d:	05 13 94 02 00       	add    eax,0x29413
     262:	00 06                	add    BYTE PTR [esi],al
     264:	4b                   	dec    ebx
     265:	02 00                	add    al,BYTE PTR [eax]
     267:	00 05 15 94 02 00    	add    BYTE PTR ds:0x29415,al
     26d:	00 00                	add    BYTE PTR [eax],al
     26f:	06                   	push   es
     270:	79 00                	jns    272 <cmdClearScreen-0x30ffd8e>
     272:	00 00                	add    BYTE PTR [eax],al
     274:	05 16 94 02 00       	add    eax,0x29416
     279:	00 04 06             	add    BYTE PTR [esi+eax*1],al
     27c:	75 01                	jne    27f <cmdClearScreen-0x30ffd81>
     27e:	00 00                	add    BYTE PTR [eax],al
     280:	05 17 2e 01 00       	add    eax,0x12e17
     285:	00 08                	add    BYTE PTR [eax],cl
     287:	06                   	push   es
     288:	9c                   	pushf  
     289:	01 00                	add    DWORD PTR [eax],eax
     28b:	00 05 18 3a 00 00    	add    BYTE PTR ds:0x3a18,al
     291:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
     294:	07                   	pop    es
     295:	04 25                	add    al,0x25
     297:	00 00                	add    BYTE PTR [eax],al
     299:	00 04 05 04 00 00 05 	add    BYTE PTR [eax*1+0x5000004],al
     2a0:	19 5b 02             	sbb    DWORD PTR [ebx+0x2],ebx
     2a3:	00 00                	add    BYTE PTR [eax],al
     2a5:	11 85 01 00 00 01    	adc    DWORD PTR [ebp+0x1000001],eax
     2ab:	0a 00                	or     al,BYTE PTR [eax]
     2ad:	00 10                	add    BYTE PTR [eax],dl
     2af:	03 19                	add    ebx,DWORD PTR [ecx]
     2b1:	00 00                	add    BYTE PTR [eax],al
     2b3:	00 01                	add    BYTE PTR [ecx],al
     2b5:	9c                   	pushf  
     2b6:	12 5e 00             	adc    bl,BYTE PTR [esi+0x0]
     2b9:	00 00                	add    BYTE PTR [eax],al
     2bb:	01 0f                	add    DWORD PTR [edi],ecx
     2bd:	19 00                	sbb    DWORD PTR [eax],eax
     2bf:	10 03                	adc    BYTE PTR [ebx],al
     2c1:	4f                   	dec    edi
     2c2:	00 00                	add    BYTE PTR [eax],al
     2c4:	00 01                	add    BYTE PTR [ecx],al
     2c6:	9c                   	pushf  
     2c7:	e4 02                	in     al,0x2
     2c9:	00 00                	add    BYTE PTR [eax],al
     2cb:	13 1f                	adc    ebx,DWORD PTR [edi]
     2cd:	00 10                	add    BYTE PTR [eax],dl
     2cf:	03 46 00             	add    eax,DWORD PTR [esi+0x0]
     2d2:	00 00                	add    BYTE PTR [eax],al
     2d4:	14 63                	adc    al,0x63
     2d6:	6e                   	outs   dx,BYTE PTR ds:[esi]
     2d7:	74 00                	je     2d9 <cmdClearScreen-0x30ffd27>
     2d9:	01 11                	add    DWORD PTR [ecx],edx
     2db:	3a 00                	cmp    al,BYTE PTR [eax]
     2dd:	00 00                	add    BYTE PTR [eax],al
     2df:	02 91 6c 00 00 15    	add    dl,BYTE PTR [ecx+0x1500006c]
     2e5:	f6 02 00             	test   BYTE PTR [edx],0x0
     2e8:	00 01                	add    BYTE PTR [ecx],al
     2ea:	1b 68 00             	sbb    ebp,DWORD PTR [eax+0x0]
     2ed:	10 03                	adc    BYTE PTR [ebx],al
     2ef:	5d                   	pop    ebp
     2f0:	01 00                	add    DWORD PTR [eax],eax
     2f2:	00 01                	add    BYTE PTR [ecx],al
     2f4:	9c                   	pushf  
     2f5:	67 03 00             	add    eax,DWORD PTR [bx+si]
     2f8:	00 16                	add    BYTE PTR [esi],dl
     2fa:	9f                   	lahf   
     2fb:	00 00                	add    BYTE PTR [eax],al
     2fd:	00 01                	add    BYTE PTR [ecx],al
     2ff:	1b 94 02 00 00 02 91 	sbb    edx,DWORD PTR [edx+eax*1-0x6efe0000]
     306:	00 17                	add    BYTE PTR [edi],dl
     308:	44                   	inc    esp
     309:	02 00                	add    al,BYTE PTR [eax]
     30b:	00 01                	add    BYTE PTR [ecx],al
     30d:	1d 67 03 00 00       	sbb    eax,0x367
     312:	03 91 dc 75 17 cc    	add    edx,DWORD PTR [ecx-0x33e88a24]
     318:	01 00                	add    DWORD PTR [eax],eax
     31a:	00 01                	add    BYTE PTR [ecx],al
     31c:	1e                   	push   ds
     31d:	94                   	xchg   esp,eax
     31e:	02 00                	add    al,BYTE PTR [eax]
     320:	00 02                	add    BYTE PTR [edx],al
     322:	91                   	xchg   ecx,eax
     323:	60                   	pusha  
     324:	17                   	pop    ss
     325:	0f 00 00             	sldt   WORD PTR [eax]
     328:	00 01                	add    BYTE PTR [ecx],al
     32a:	1e                   	push   ds
     32b:	94                   	xchg   esp,eax
     32c:	02 00                	add    al,BYTE PTR [eax]
     32e:	00 02                	add    BYTE PTR [edx],al
     330:	91                   	xchg   ecx,eax
     331:	5c                   	pop    esp
     332:	13 93 00 10 03 29    	adc    edx,DWORD PTR [ebx+0x29031000]
     338:	01 00                	add    DWORD PTR [eax],eax
     33a:	00 17                	add    BYTE PTR [edi],dl
     33c:	27                   	daa    
     33d:	00 00                	add    BYTE PTR [eax],al
     33f:	00 01                	add    BYTE PTR [ecx],al
     341:	22 3a                	and    bh,BYTE PTR [edx]
     343:	00 00                	add    BYTE PTR [eax],al
     345:	00 02                	add    BYTE PTR [edx],al
     347:	91                   	xchg   ecx,eax
     348:	6c                   	ins    BYTE PTR es:[edi],dx
     349:	17                   	pop    ss
     34a:	b5 03                	mov    ch,0x3
     34c:	00 00                	add    BYTE PTR [eax],al
     34e:	01 22                	add    DWORD PTR [edx],esp
     350:	3a 00                	cmp    al,BYTE PTR [eax]
     352:	00 00                	add    BYTE PTR [eax],al
     354:	02 91 68 17 60 03    	add    dl,BYTE PTR [ecx+0x3601768]
     35a:	00 00                	add    BYTE PTR [eax],al
     35c:	01 23                	add    DWORD PTR [ebx],esp
     35e:	3a 00                	cmp    al,BYTE PTR [eax]
     360:	00 00                	add    BYTE PTR [eax],al
     362:	02 91 64 00 00 18    	add    dl,BYTE PTR [ecx+0x18000064]
     368:	25 00 00 00 7d       	and    eax,0x7d000000
     36d:	03 00                	add    eax,DWORD PTR [eax]
     36f:	00 19                	add    BYTE PTR [ecx],bl
     371:	30 01                	xor    BYTE PTR [ecx],al
     373:	00 00                	add    BYTE PTR [eax],al
     375:	09 19                	or     DWORD PTR [ecx],ebx
     377:	30 01                	xor    BYTE PTR [ecx],al
     379:	00 00                	add    BYTE PTR [eax],al
     37b:	7f 00                	jg     37d <cmdClearScreen-0x30ffc83>
     37d:	1a fe                	sbb    bh,dh
     37f:	03 00                	add    eax,DWORD PTR [eax]
     381:	00 01                	add    BYTE PTR [ecx],al
     383:	3a 3a                	cmp    bh,BYTE PTR [edx]
     385:	00 00                	add    BYTE PTR [eax],al
     387:	00 c5                	add    ch,al
     389:	01 10                	add    DWORD PTR [eax],edx
     38b:	03 8b 00 00 00 01    	add    ecx,DWORD PTR [ebx+0x1000000]
     391:	9c                   	pushf  
     392:	f5                   	cmc    
     393:	03 00                	add    eax,DWORD PTR [eax]
     395:	00 16                	add    BYTE PTR [esi],dl
     397:	6f                   	outs   dx,DWORD PTR ds:[esi]
     398:	03 00                	add    eax,DWORD PTR [eax]
     39a:	00 01                	add    BYTE PTR [ecx],al
     39c:	3a 94 02 00 00 02 91 	cmp    dl,BYTE PTR [edx+eax*1-0x6efe0000]
     3a3:	00 16                	add    BYTE PTR [esi],dl
     3a5:	00 05 00 00 01 3a    	add    BYTE PTR ds:0x3a010000,al
     3ab:	3a 00                	cmp    al,BYTE PTR [eax]
     3ad:	00 00                	add    BYTE PTR [eax],al
     3af:	02 91 04 16 45 05    	add    dl,BYTE PTR [ecx+0x5451604]
     3b5:	00 00                	add    BYTE PTR [eax],al
     3b7:	01 3a                	add    DWORD PTR [edx],edi
     3b9:	f5                   	cmc    
     3ba:	03 00                	add    eax,DWORD PTR [eax]
     3bc:	00 02                	add    BYTE PTR [edx],al
     3be:	91                   	xchg   ecx,eax
     3bf:	08 16                	or     BYTE PTR [esi],dl
     3c1:	fa                   	cli    
     3c2:	01 00                	add    DWORD PTR [eax],eax
     3c4:	00 01                	add    BYTE PTR [ecx],al
     3c6:	3a 27                	cmp    ah,BYTE PTR [edi]
     3c8:	01 00                	add    DWORD PTR [eax],eax
     3ca:	00 02                	add    BYTE PTR [edx],al
     3cc:	91                   	xchg   ecx,eax
     3cd:	5c                   	pop    esp
     3ce:	14 70                	adc    al,0x70
     3d0:	69 64 00 01 3c 3a 00 	imul   esp,DWORD PTR [eax+eax*1+0x1],0x3a3c
     3d7:	00 
     3d8:	00 02                	add    BYTE PTR [edx],al
     3da:	91                   	xchg   ecx,eax
     3db:	6c                   	ins    BYTE PTR es:[edi],dx
     3dc:	13 f9                	adc    edi,ecx
     3de:	01 10                	add    DWORD PTR [eax],edx
     3e0:	03 41 00             	add    eax,DWORD PTR [ecx+0x0]
     3e3:	00 00                	add    BYTE PTR [eax],al
     3e5:	14 72                	adc    al,0x72
     3e7:	65                   	gs
     3e8:	74 00                	je     3ea <cmdClearScreen-0x30ffc16>
     3ea:	01 44 fb 03          	add    DWORD PTR [ebx+edi*8+0x3],eax
     3ee:	00 00                	add    BYTE PTR [eax],al
     3f0:	02 91 62 00 00 07    	add    dl,BYTE PTR [ecx+0x7000062]
     3f6:	04 94                	add    al,0x94
     3f8:	02 00                	add    al,BYTE PTR [eax]
     3fa:	00 18                	add    BYTE PTR [eax],bl
     3fc:	25 00 00 00 0b       	and    eax,0xb000000
     401:	04 00                	add    al,0x0
     403:	00 19                	add    BYTE PTR [ecx],bl
     405:	30 01                	xor    BYTE PTR [ecx],al
     407:	00 00                	add    BYTE PTR [eax],al
     409:	09 00                	or     DWORD PTR [eax],eax
     40b:	1a 4c 01 00          	sbb    cl,BYTE PTR [ecx+eax*1+0x0]
     40f:	00 01                	add    BYTE PTR [ecx],al
     411:	4e                   	dec    esi
     412:	3a 00                	cmp    al,BYTE PTR [eax]
     414:	00 00                	add    BYTE PTR [eax],al
     416:	50                   	push   eax
     417:	02 10                	add    dl,BYTE PTR [eax]
     419:	03 07                	add    eax,DWORD PTR [edi]
     41b:	02 00                	add    al,BYTE PTR [eax]
     41d:	00 01                	add    BYTE PTR [ecx],al
     41f:	9c                   	pushf  
     420:	42                   	inc    edx
     421:	05 00 00 16 9f       	add    eax,0x9f160000
     426:	00 00                	add    BYTE PTR [eax],al
     428:	00 01                	add    BYTE PTR [ecx],al
     42a:	4e                   	dec    esi
     42b:	94                   	xchg   esp,eax
     42c:	02 00                	add    al,BYTE PTR [eax]
     42e:	00 02                	add    BYTE PTR [edx],al
     430:	91                   	xchg   ecx,eax
     431:	00 16                	add    BYTE PTR [esi],dl
     433:	72 00                	jb     435 <cmdClearScreen-0x30ffbcb>
     435:	00 00                	add    BYTE PTR [eax],al
     437:	01 4e 27             	add    DWORD PTR [esi+0x27],ecx
     43a:	01 00                	add    DWORD PTR [eax],eax
     43c:	00 03                	add    BYTE PTR [ebx],al
     43e:	91                   	xchg   ecx,eax
     43f:	ac                   	lods   al,BYTE PTR ds:[esi]
     440:	75 17                	jne    459 <cmdClearScreen-0x30ffba7>
     442:	fa                   	cli    
     443:	01 00                	add    DWORD PTR [eax],eax
     445:	00 01                	add    BYTE PTR [ecx],al
     447:	50                   	push   eax
     448:	27                   	daa    
     449:	01 00                	add    DWORD PTR [eax],eax
     44b:	00 02                	add    BYTE PTR [edx],al
     44d:	91                   	xchg   ecx,eax
     44e:	6f                   	outs   dx,DWORD PTR ds:[esi]
     44f:	17                   	pop    ss
     450:	50                   	push   eax
     451:	02 00                	add    al,BYTE PTR [eax]
     453:	00 01                	add    BYTE PTR [ecx],al
     455:	51                   	push   ecx
     456:	3a 00                	cmp    al,BYTE PTR [eax]
     458:	00 00                	add    BYTE PTR [eax],al
     45a:	02 91 64 1b 74 6f    	add    dl,BYTE PTR [ecx+0x6f741b64]
     460:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
     463:	52                   	push   edx
     464:	94                   	xchg   esp,eax
     465:	02 00                	add    al,BYTE PTR [eax]
     467:	00 14 70             	add    BYTE PTR [eax+esi*2],dl
     46a:	67 6d                	ins    DWORD PTR es:[di],dx
     46c:	00 01                	add    BYTE PTR [ecx],al
     46e:	53                   	push   ebx
     46f:	94                   	xchg   esp,eax
     470:	02 00                	add    al,BYTE PTR [eax]
     472:	00 02                	add    BYTE PTR [edx],al
     474:	91                   	xchg   ecx,eax
     475:	60                   	pusha  
     476:	17                   	pop    ss
     477:	44                   	inc    esp
     478:	02 00                	add    al,BYTE PTR [eax]
     47a:	00 01                	add    BYTE PTR [ecx],al
     47c:	55                   	push   ebp
     47d:	67 03 00             	add    eax,DWORD PTR [bx+si]
     480:	00 03                	add    BYTE PTR [ebx],al
     482:	91                   	xchg   ecx,eax
     483:	c4 75 17             	les    esi,FWORD PTR [ebp+0x17]
     486:	9c                   	pushf  
     487:	01 00                	add    DWORD PTR [eax],eax
     489:	00 01                	add    BYTE PTR [ecx],al
     48b:	56                   	push   esi
     48c:	3a 00                	cmp    al,BYTE PTR [eax]
     48e:	00 00                	add    BYTE PTR [eax],al
     490:	02 91 5c 17 18 00    	add    dl,BYTE PTR [ecx+0x18175c]
     496:	00 00                	add    BYTE PTR [eax],al
     498:	01 57 3a             	add    DWORD PTR [edi+0x3a],edx
     49b:	00 00                	add    BYTE PTR [eax],al
     49d:	00 02                	add    BYTE PTR [edx],al
     49f:	91                   	xchg   ecx,eax
     4a0:	58                   	pop    eax
     4a1:	17                   	pop    ss
     4a2:	cc                   	int3   
     4a3:	02 00                	add    al,BYTE PTR [eax]
     4a5:	00 01                	add    BYTE PTR [ecx],al
     4a7:	58                   	pop    eax
     4a8:	3a 00                	cmp    al,BYTE PTR [eax]
     4aa:	00 00                	add    BYTE PTR [eax],al
     4ac:	02 91 54 1c 41 03    	add    dl,BYTE PTR [ecx+0x3411c54]
     4b2:	00 00                	add    BYTE PTR [eax],al
     4b4:	01 59 42             	add    DWORD PTR [ecx+0x42],ebx
     4b7:	05 00 00 1c 39       	add    eax,0x391c0000
     4bc:	03 00                	add    eax,DWORD PTR [eax]
     4be:	00 01                	add    BYTE PTR [ecx],al
     4c0:	59                   	pop    ecx
     4c1:	42                   	inc    edx
     4c2:	05 00 00 17 41       	add    eax,0x41170000
     4c7:	01 00                	add    DWORD PTR [eax],eax
     4c9:	00 01                	add    BYTE PTR [ecx],al
     4cb:	5a                   	pop    edx
     4cc:	61                   	popa   
     4cd:	00 00                	add    BYTE PTR [eax],al
     4cf:	00 02                	add    BYTE PTR [edx],al
     4d1:	91                   	xchg   ecx,eax
     4d2:	4c                   	dec    esp
     4d3:	17                   	pop    ss
     4d4:	e6 02                	out    0x2,al
     4d6:	00 00                	add    BYTE PTR [eax],al
     4d8:	01 5a 61             	add    DWORD PTR [edx+0x61],ebx
     4db:	00 00                	add    BYTE PTR [eax],al
     4dd:	00 02                	add    BYTE PTR [edx],al
     4df:	91                   	xchg   ecx,eax
     4e0:	44                   	inc    esp
     4e1:	17                   	pop    ss
     4e2:	00 05 00 00 01 5f    	add    BYTE PTR ds:0x5f010000,al
     4e8:	3a 00                	cmp    al,BYTE PTR [eax]
     4ea:	00 00                	add    BYTE PTR [eax],al
     4ec:	03 91 c0 75 17 45    	add    edx,DWORD PTR [ecx+0x451775c0]
     4f2:	05 00 00 01 60       	add    eax,0x60010000
     4f7:	f5                   	cmc    
     4f8:	03 00                	add    eax,DWORD PTR [eax]
     4fa:	00 02                	add    BYTE PTR [edx],al
     4fc:	91                   	xchg   ecx,eax
     4fd:	50                   	push   eax
     4fe:	1d 2f 03 10 03       	sbb    eax,0x310032f
     503:	4d                   	dec    ebp
     504:	00 00                	add    BYTE PTR [eax],al
     506:	00 28                	add    BYTE PTR [eax],ch
     508:	05 00 00 17 7e       	add    eax,0x7e170000
     50d:	01 00                	add    DWORD PTR [eax],eax
     50f:	00 01                	add    BYTE PTR [ecx],al
     511:	74 3a                	je     54d <cmdClearScreen-0x30ffab3>
     513:	00 00                	add    BYTE PTR [eax],al
     515:	00 02                	add    BYTE PTR [edx],al
     517:	91                   	xchg   ecx,eax
     518:	68 17 f1 01 00       	push   0x1f117
     51d:	00 01                	add    BYTE PTR [ecx],al
     51f:	75 3a                	jne    55b <cmdClearScreen-0x30ffaa5>
     521:	00 00                	add    BYTE PTR [eax],al
     523:	00 02                	add    BYTE PTR [edx],al
     525:	91                   	xchg   ecx,eax
     526:	48                   	dec    eax
     527:	00 13                	add    BYTE PTR [ebx],dl
     529:	9f                   	lahf   
     52a:	03 10                	add    edx,DWORD PTR [eax]
     52c:	03 9a 00 00 00 14    	add    ebx,DWORD PTR [edx+0x14000000]
     532:	72 65                	jb     599 <cmdClearScreen-0x30ffa67>
     534:	74 00                	je     536 <cmdClearScreen-0x30ffaca>
     536:	01 8e fb 03 00 00    	add    DWORD PTR [esi+0x3fb],ecx
     53c:	03 91 b6 75 00 00    	add    edx,DWORD PTR [ecx+0x75b6]
     542:	07                   	pop    es
     543:	04 8c                	add    al,0x8c
     545:	00 00                	add    BYTE PTR [eax],al
     547:	00 15 06 03 00 00    	add    BYTE PTR ds:0x306,dl
     54d:	01 98 57 04 10 03    	add    DWORD PTR [eax+0x3100457],ebx
     553:	19 00                	sbb    DWORD PTR [eax],eax
     555:	00 00                	add    BYTE PTR [eax],al
     557:	01 9c 6c 05 00 00 16 	add    DWORD PTR [esp+ebp*2+0x16000005],ebx
     55e:	9f                   	lahf   
     55f:	00 00                	add    BYTE PTR [eax],al
     561:	00 01                	add    BYTE PTR [ecx],al
     563:	98                   	cwde   
     564:	94                   	xchg   esp,eax
     565:	02 00                	add    al,BYTE PTR [eax]
     567:	00 02                	add    BYTE PTR [edx],al
     569:	91                   	xchg   ecx,eax
     56a:	00 00                	add    BYTE PTR [eax],al
     56c:	15 3a 02 00 00       	adc    eax,0x23a
     571:	01 9d 70 04 10 03    	add    DWORD PTR [ebp+0x3100470],ebx
     577:	c9                   	leave  
     578:	00 00                	add    BYTE PTR [eax],al
     57a:	00 01                	add    BYTE PTR [ecx],al
     57c:	9c                   	pushf  
     57d:	dc 05 00 00 16 9f    	fadd   QWORD PTR ds:0x9f160000
     583:	00 00                	add    BYTE PTR [eax],al
     585:	00 01                	add    BYTE PTR [ecx],al
     587:	9d                   	popf   
     588:	94                   	xchg   esp,eax
     589:	02 00                	add    al,BYTE PTR [eax]
     58b:	00 02                	add    BYTE PTR [edx],al
     58d:	91                   	xchg   ecx,eax
     58e:	00 17                	add    BYTE PTR [edi],dl
     590:	00 05 00 00 01 9f    	add    BYTE PTR ds:0x9f010000,al
     596:	3a 00                	cmp    al,BYTE PTR [eax]
     598:	00 00                	add    BYTE PTR [eax],al
     59a:	02 91 5c 17 45 05    	add    dl,BYTE PTR [ecx+0x545175c]
     5a0:	00 00                	add    BYTE PTR [eax],al
     5a2:	01 a0 f5 03 00 00    	add    DWORD PTR [eax+0x3f5],esp
     5a8:	02 91 60 17 cd 02    	add    dl,BYTE PTR [ecx+0x2cd1760]
     5ae:	00 00                	add    BYTE PTR [eax],al
     5b0:	01 a1 3a 00 00 00    	add    DWORD PTR [ecx+0x3a],esp
     5b6:	02 91 64 17 2f 02    	add    dl,BYTE PTR [ecx+0x22f1764]
     5bc:	00 00                	add    BYTE PTR [eax],al
     5be:	01 a2 94 02 00 00    	add    DWORD PTR [edx+0x294],esp
     5c4:	02 91 6c 1e 00 00    	add    dl,BYTE PTR [ecx+0x1e6c]
     5ca:	00 00                	add    BYTE PTR [eax],al
     5cc:	14 63                	adc    al,0x63
     5ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
     5cf:	74 00                	je     5d1 <cmdClearScreen-0x30ffa2f>
     5d1:	01 ae 3a 00 00 00    	add    DWORD PTR [esi+0x3a],ebp
     5d7:	02 91 68 00 00 15    	add    dl,BYTE PTR [ecx+0x15000068]
     5dd:	8e 00                	mov    es,WORD PTR [eax]
     5df:	00 00                	add    BYTE PTR [eax],al
     5e1:	01 bc 39 05 10 03 19 	add    DWORD PTR [ecx+edi*1+0x19031005],edi
     5e8:	00 00                	add    BYTE PTR [eax],al
     5ea:	00 01                	add    BYTE PTR [ecx],al
     5ec:	9c                   	pushf  
     5ed:	00 06                	add    BYTE PTR [esi],al
     5ef:	00 00                	add    BYTE PTR [eax],al
     5f1:	16                   	push   ss
     5f2:	9f                   	lahf   
     5f3:	00 00                	add    BYTE PTR [eax],al
     5f5:	00 01                	add    BYTE PTR [ecx],al
     5f7:	bc 94 02 00 00       	mov    esp,0x294
     5fc:	02 91 00 00 15 2f    	add    dl,BYTE PTR [ecx+0x2f150000]
     602:	00 00                	add    BYTE PTR [eax],al
     604:	00 01                	add    BYTE PTR [ecx],al
     606:	c1 52 05 10          	rcl    DWORD PTR [edx+0x5],0x10
     60a:	03 58 00             	add    ebx,DWORD PTR [eax+0x0]
     60d:	00 00                	add    BYTE PTR [eax],al
     60f:	01 9c 33 06 00 00 16 	add    DWORD PTR [ebx+esi*1+0x16000006],ebx
     616:	9f                   	lahf   
     617:	00 00                	add    BYTE PTR [eax],al
     619:	00 01                	add    BYTE PTR [ecx],al
     61b:	c1 94 02 00 00 02 91 	rcl    DWORD PTR [edx+eax*1-0x6efe0000],0x0
     622:	00 
     623:	17                   	pop    ss
     624:	44                   	inc    esp
     625:	02 00                	add    al,BYTE PTR [eax]
     627:	00 01                	add    BYTE PTR [ecx],al
     629:	c3                   	ret    
     62a:	67 03 00             	add    eax,DWORD PTR [bx+si]
     62d:	00 03                	add    BYTE PTR [ebx],al
     62f:	91                   	xchg   ecx,eax
     630:	f0 75 00             	lock jne 633 <cmdClearScreen-0x30ff9cd>
     633:	15 77 02 00 00       	adc    eax,0x277
     638:	01 ce                	add    esi,ecx
     63a:	aa                   	stos   BYTE PTR es:[edi],al
     63b:	05 10 03 ce 00       	add    eax,0xce0310
     640:	00 00                	add    BYTE PTR [eax],al
     642:	01 9c 7d 06 00 00 16 	add    DWORD PTR [ebp+edi*2+0x16000006],ebx
     649:	9f                   	lahf   
     64a:	00 00                	add    BYTE PTR [eax],al
     64c:	00 01                	add    BYTE PTR [ecx],al
     64e:	ce                   	into   
     64f:	94                   	xchg   esp,eax
     650:	02 00                	add    al,BYTE PTR [eax]
     652:	00 02                	add    BYTE PTR [edx],al
     654:	91                   	xchg   ecx,eax
     655:	00 14 74             	add    BYTE PTR [esp+esi*2],dl
     658:	6f                   	outs   dx,DWORD PTR ds:[esi]
     659:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
     65c:	d0 94 02 00 00 02 91 	rcl    BYTE PTR [edx+eax*1-0x6efe0000],1
     663:	68 13 d9 05 10       	push   0x1005d913
     668:	03 9c 00 00 00 14 63 	add    ebx,DWORD PTR [eax+eax*1+0x63140000]
     66f:	6e                   	outs   dx,BYTE PTR ds:[esi]
     670:	74 00                	je     672 <cmdClearScreen-0x30ff98e>
     672:	01 da                	add    edx,ebx
     674:	6c                   	ins    BYTE PTR es:[edi],dx
     675:	00 00                	add    BYTE PTR [eax],al
     677:	00 02                	add    BYTE PTR [edx],al
     679:	91                   	xchg   ecx,eax
     67a:	6c                   	ins    BYTE PTR es:[edi],dx
     67b:	00 00                	add    BYTE PTR [eax],al
     67d:	12 20                	adc    ah,BYTE PTR [eax]
     67f:	01 00                	add    DWORD PTR [eax],eax
     681:	00 01                	add    BYTE PTR [ecx],al
     683:	e7 78                	out    0x78,eax
     685:	06                   	push   es
     686:	10 03                	adc    BYTE PTR [ebx],al
     688:	4e                   	dec    esi
     689:	00 00                	add    BYTE PTR [eax],al
     68b:	00 01                	add    BYTE PTR [ecx],al
     68d:	9c                   	pushf  
     68e:	a1 06 00 00 14       	mov    eax,ds:0x14000006
     693:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
     696:	00 01                	add    BYTE PTR [ecx],al
     698:	e9 94 02 00 00       	jmp    931 <cmdClearScreen-0x30ff6cf>
     69d:	02 91 6c 00 15 cd    	add    dl,BYTE PTR [ecx-0x32eaff94]
     6a3:	03 00                	add    eax,DWORD PTR [eax]
     6a5:	00 01                	add    BYTE PTR [ecx],al
     6a7:	ee                   	out    dx,al
     6a8:	c6 06 10             	mov    BYTE PTR [esi],0x10
     6ab:	03 11                	add    edx,DWORD PTR [ecx]
     6ad:	01 00                	add    DWORD PTR [eax],eax
     6af:	00 01                	add    BYTE PTR [ecx],al
     6b1:	9c                   	pushf  
     6b2:	33 07                	xor    eax,DWORD PTR [edi]
     6b4:	00 00                	add    BYTE PTR [eax],al
     6b6:	16                   	push   ss
     6b7:	9f                   	lahf   
     6b8:	00 00                	add    BYTE PTR [eax],al
     6ba:	00 01                	add    BYTE PTR [ecx],al
     6bc:	ee                   	out    dx,al
     6bd:	94                   	xchg   esp,eax
     6be:	02 00                	add    al,BYTE PTR [eax]
     6c0:	00 02                	add    BYTE PTR [edx],al
     6c2:	91                   	xchg   ecx,eax
     6c3:	00 17                	add    BYTE PTR [edi],dl
     6c5:	44                   	inc    esp
     6c6:	02 00                	add    al,BYTE PTR [eax]
     6c8:	00 01                	add    BYTE PTR [ecx],al
     6ca:	f0 67 03 00          	lock add eax,DWORD PTR [bx+si]
     6ce:	00 03                	add    BYTE PTR [ebx],al
     6d0:	91                   	xchg   ecx,eax
     6d1:	d8 75 17             	fdiv   DWORD PTR [ebp+0x17]
     6d4:	9c                   	pushf  
     6d5:	01 00                	add    DWORD PTR [eax],eax
     6d7:	00 01                	add    BYTE PTR [ecx],al
     6d9:	f1                   	icebp  
     6da:	3a 00                	cmp    al,BYTE PTR [eax]
     6dc:	00 00                	add    BYTE PTR [eax],al
     6de:	02 91 64 17 5b 03    	add    dl,BYTE PTR [ecx+0x35b1764]
     6e4:	00 00                	add    BYTE PTR [eax],al
     6e6:	01 f4                	add    esp,esi
     6e8:	3a 00                	cmp    al,BYTE PTR [eax]
     6ea:	00 00                	add    BYTE PTR [eax],al
     6ec:	02 91 60 17 24 03    	add    dl,BYTE PTR [ecx+0x3241760]
     6f2:	00 00                	add    BYTE PTR [eax],al
     6f4:	01 f5                	add    ebp,esi
     6f6:	33 07                	xor    eax,DWORD PTR [edi]
     6f8:	00 00                	add    BYTE PTR [eax],al
     6fa:	03 91 58 06 1d 30    	add    edx,DWORD PTR [ecx+0x301d0658]
     700:	07                   	pop    es
     701:	10 03                	adc    BYTE PTR [ebx],al
     703:	21 00                	and    DWORD PTR [eax],eax
     705:	00 00                	add    BYTE PTR [eax],al
     707:	1a 07                	sbb    al,BYTE PTR [edi]
     709:	00 00                	add    BYTE PTR [eax],al
     70b:	14 63                	adc    al,0x63
     70d:	6e                   	outs   dx,BYTE PTR ds:[esi]
     70e:	74 00                	je     710 <cmdClearScreen-0x30ff8f0>
     710:	01 f7                	add    edi,esi
     712:	3a 00                	cmp    al,BYTE PTR [eax]
     714:	00 00                	add    BYTE PTR [eax],al
     716:	02 91 6c 00 13 51    	add    dl,BYTE PTR [ecx+0x5113006c]
     71c:	07                   	pop    es
     71d:	10 03                	adc    BYTE PTR [ebx],al
     71f:	33 00                	xor    eax,DWORD PTR [eax]
     721:	00 00                	add    BYTE PTR [eax],al
     723:	14 63                	adc    al,0x63
     725:	6e                   	outs   dx,BYTE PTR ds:[esi]
     726:	74 00                	je     728 <cmdClearScreen-0x30ff8d8>
     728:	01 fa                	add    edx,edi
     72a:	3a 00                	cmp    al,BYTE PTR [eax]
     72c:	00 00                	add    BYTE PTR [eax],al
     72e:	02 91 68 00 00 18    	add    dl,BYTE PTR [ecx+0x18000068]
     734:	3a 00                	cmp    al,BYTE PTR [eax]
     736:	00 00                	add    BYTE PTR [eax],al
     738:	46                   	inc    esi
     739:	07                   	pop    es
     73a:	00 00                	add    BYTE PTR [eax],al
     73c:	1f                   	pop    ds
     73d:	30 01                	xor    BYTE PTR [ecx],al
     73f:	00 00                	add    BYTE PTR [eax],al
     741:	03 91 5c 06 00 18    	add    edx,DWORD PTR [ecx+0x1800065c]
     747:	9a 02 00 00 56 07 00 	call   0x7:0x56000002
     74e:	00 19                	add    BYTE PTR [ecx],bl
     750:	30 01                	xor    BYTE PTR [ecx],al
     752:	00 00                	add    BYTE PTR [eax],al
     754:	09 00                	or     DWORD PTR [eax],eax
     756:	17                   	pop    ss
     757:	3c 01                	cmp    al,0x1
     759:	00 00                	add    BYTE PTR [eax],al
     75b:	05 36 46 07 00       	add    eax,0x74636
     760:	00 05 03 e0 21 10    	add    BYTE PTR ds:0x1021e003,al
     766:	03 20                	add    esp,DWORD PTR [eax]
     768:	66 03 00             	add    ax,WORD PTR [eax]
     76b:	00 06                	add    BYTE PTR [esi],al
     76d:	34 61                	xor    al,0x61
     76f:	00 00                	add    BYTE PTR [eax],al
     771:	00 05 03 6c 27 10    	add    BYTE PTR ds:0x10276c03,al
     777:	03 20                	add    esp,DWORD PTR [eax]
     779:	0e                   	push   cs
     77a:	02 00                	add    al,BYTE PTR [eax]
     77c:	00 06                	add    BYTE PTR [esi],al
     77e:	35 61 00 00 00       	xor    eax,0x61
     783:	05 03 70 27 10       	add    eax,0x10277003
     788:	03 20                	add    esp,DWORD PTR [eax]
     78a:	6a 00                	push   0x0
     78c:	00 00                	add    BYTE PTR [eax],al
     78e:	06                   	push   es
     78f:	36                   	ss
     790:	61                   	popa   
     791:	00 00                	add    BYTE PTR [eax],al
     793:	00 05 03 68 27 10    	add    BYTE PTR ds:0x10276803,al
     799:	03 20                	add    esp,DWORD PTR [eax]
     79b:	9c                   	pushf  
     79c:	03 00                	add    eax,DWORD PTR [eax]
     79e:	00 06                	add    BYTE PTR [esi],al
     7a0:	37                   	aaa    
     7a1:	85 00                	test   DWORD PTR [eax],eax
     7a3:	00 00                	add    BYTE PTR [eax],al
     7a5:	05 03 90 27 10       	add    eax,0x10279003
     7aa:	03 20                	add    esp,DWORD PTR [eax]
     7ac:	b7 02                	mov    bh,0x2
     7ae:	00 00                	add    BYTE PTR [eax],al
     7b0:	07                   	pop    es
     7b1:	50                   	push   eax
     7b2:	f5                   	cmc    
     7b3:	03 00                	add    eax,DWORD PTR [eax]
     7b5:	00 05 03 80 27 10    	add    BYTE PTR ds:0x10278003,al
     7bb:	03 20                	add    esp,DWORD PTR [eax]
     7bd:	be 03 00 00 04       	mov    esi,0x4000003
     7c2:	63 b8 01 00 00 05    	arpl   WORD PTR [eax+0x5000001],di
     7c8:	03 78 27             	add    edi,DWORD PTR [eax+0x27]
     7cb:	10 03                	adc    BYTE PTR [ebx],al
     7cd:	20 74 03 00          	and    BYTE PTR [ebx+eax*1+0x0],dh
     7d1:	00 04 e1             	add    BYTE PTR [ecx+eiz*8],al
     7d4:	07                   	pop    es
     7d5:	02 00                	add    al,BYTE PTR [eax]
     7d7:	00 05 03 64 27 10    	add    BYTE PTR ds:0x10276403,al
     7dd:	03 21                	add    esp,DWORD PTR [ecx]
     7df:	20 6d 01             	and    BYTE PTR [ebp+0x1],ch
     7e2:	00 00                	add    BYTE PTR [eax],al
     7e4:	05 25 f0 07 00       	add    eax,0x7f025
     7e9:	00 05 03 74 27 10    	add    BYTE PTR ds:0x10277403,al
     7ef:	03 07                	add    eax,DWORD PTR [edi]
     7f1:	04 de                	add    al,0xde
     7f3:	07                   	pop    es
     7f4:	00 00                	add    BYTE PTR [eax],al
     7f6:	22 01                	and    al,BYTE PTR [ecx]
     7f8:	08 00                	or     BYTE PTR [eax],al
     7fa:	00 23                	add    BYTE PTR [ebx],ah
     7fc:	94                   	xchg   esp,eax
     7fd:	02 00                	add    al,BYTE PTR [eax]
     7ff:	00 00                	add    BYTE PTR [eax],al
     801:	20 d4                	and    ah,dl
     803:	01 00                	add    DWORD PTR [eax],eax
     805:	00 05 26 12 08 00    	add    BYTE PTR ds:0x81226,al
     80b:	00 05 03 60 27 10    	add    BYTE PTR ds:0x10276003,al
     811:	03 07                	add    eax,DWORD PTR [edi]
     813:	04 f6                	add    al,0xf6
     815:	07                   	pop    es
     816:	00 00                	add    BYTE PTR [eax],al
     818:	18 25 00 00 00 29    	sbb    BYTE PTR ds:0x29000000,ah
     81e:	08 00                	or     BYTE PTR [eax],al
     820:	00 24 30             	add    BYTE PTR [eax+esi*1],ah
     823:	01 00                	add    DWORD PTR [eax],eax
     825:	00 ff                	add    bh,bh
     827:	01 00                	add    DWORD PTR [eax],eax
     829:	20 17                	and    BYTE PTR [edi],dl
     82b:	02 00                	add    al,BYTE PTR [eax]
     82d:	00 05 2d 18 08 00    	add    BYTE PTR ds:0x8182d,al
     833:	00 05 03 60 25 10    	add    BYTE PTR ds:0x10256003,al
     839:	03 20                	add    esp,DWORD PTR [eax]
     83b:	e6 03                	out    0x3,al
     83d:	00 00                	add    BYTE PTR [eax],al
     83f:	05 2e 94 02 00       	add    eax,0x2942e
     844:	00 05 03 8c 27 10    	add    BYTE PTR ds:0x10278c03,al
     84a:	03 20                	add    esp,DWORD PTR [eax]
     84c:	00 00                	add    BYTE PTR [eax],al
     84e:	00 00                	add    BYTE PTR [eax],al
     850:	05 2f f5 03 00       	add    eax,0x3f52f
     855:	00 05 03 4c 24 10    	add    BYTE PTR ds:0x10244c03,al
     85b:	03 18                	add    ebx,DWORD PTR [eax]
     85d:	25 00 00 00 6c       	and    eax,0x6c000000
     862:	08 00                	or     BYTE PTR [eax],al
     864:	00 19                	add    BYTE PTR [ecx],bl
     866:	30 01                	xor    BYTE PTR [ecx],al
     868:	00 00                	add    BYTE PTR [eax],al
     86a:	05 00 20 29 02       	add    eax,0x2292000
     86f:	00 00                	add    BYTE PTR [eax],al
     871:	05 30 5c 08 00       	add    eax,0x85c30
     876:	00 05 03 44 24 10    	add    BYTE PTR ds:0x10244403,al
     87c:	03 20                	add    esp,DWORD PTR [eax]
     87e:	c3                   	ret    
     87f:	02 00                	add    al,BYTE PTR [eax]
     881:	00 05 31 61 00 00    	add    BYTE PTR ds:0x6131,al
     887:	00 05 03 88 27 10    	add    BYTE PTR ds:0x10278803,al
     88d:	03 20                	add    esp,DWORD PTR [eax]
     88f:	58                   	pop    eax
     890:	02 00                	add    al,BYTE PTR [eax]
     892:	00 05 31 61 00 00    	add    BYTE PTR ds:0x6131,al
     898:	00 05 03 84 27 10    	add    BYTE PTR ds:0x10278403,al
     89e:	03 20                	add    esp,DWORD PTR [eax]
     8a0:	31 01                	xor    DWORD PTR [ecx],eax
     8a2:	00 00                	add    BYTE PTR [eax],al
     8a4:	05 32 27 01 00       	add    eax,0x12732
     8a9:	00 05 03 94 27 10    	add    BYTE PTR ds:0x10279403,al
     8af:	03 18                	add    ebx,DWORD PTR [eax]
     8b1:	25 00 00 00 c0       	and    eax,0xc0000000
     8b6:	08 00                	or     BYTE PTR [eax],al
     8b8:	00 19                	add    BYTE PTR [ecx],bl
     8ba:	30 01                	xor    BYTE PTR [ecx],al
     8bc:	00 00                	add    BYTE PTR [eax],al
     8be:	ff 00                	inc    DWORD PTR [eax]
     8c0:	25 63 77 64 00       	and    eax,0x647763
     8c5:	05 33 b0 08 00       	add    eax,0x8b033
     8ca:	00 05 03 60 24 10    	add    BYTE PTR ds:0x10246003,al
     8d0:	03 20                	add    esp,DWORD PTR [eax]
     8d2:	ae                   	scas   al,BYTE PTR es:[edi]
     8d3:	01 00                	add    DWORD PTR [eax],eax
     8d5:	00 05 34 27 01 00    	add    BYTE PTR ds:0x12734,al
     8db:	00 05 03 40 24 10    	add    BYTE PTR ds:0x10244003,al
     8e1:	03 00                	add    eax,DWORD PTR [eax]
     8e3:	8c 08                	mov    WORD PTR [eax],cs
     8e5:	00 00                	add    BYTE PTR [eax],al
     8e7:	04 00                	add    al,0x0
     8e9:	ec                   	in     al,dx
     8ea:	01 00                	add    DWORD PTR [eax],eax
     8ec:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     8ef:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
     8f0:	00 00                	add    BYTE PTR [eax],al
     8f2:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     8f5:	05 00 00 37 00       	add    eax,0x370000
     8fa:	00 00                	add    BYTE PTR [eax],al
     8fc:	d8 07                	fadd   DWORD PTR [edi]
     8fe:	10 03                	adc    BYTE PTR [ebx],al
     900:	16                   	push   ss
     901:	0b 00                	or     eax,DWORD PTR [eax]
     903:	00 53 02             	add    BYTE PTR [ebx+0x2],dl
     906:	00 00                	add    BYTE PTR [eax],al
     908:	02 01                	add    al,BYTE PTR [ecx]
     90a:	06                   	push   es
     90b:	72 02                	jb     90f <cmdClearScreen-0x30ff6f1>
     90d:	00 00                	add    BYTE PTR [eax],al
     90f:	02 01                	add    al,BYTE PTR [ecx]
     911:	06                   	push   es
     912:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
     915:	00 02                	add    BYTE PTR [edx],al
     917:	02 05 27 01 00 00    	add    al,BYTE PTR ds:0x127
     91d:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     924:	02 08                	add    cl,BYTE PTR [eax]
     926:	05 be 01 00 00       	add    eax,0x1be
     92b:	04 52                	add    al,0x52
     92d:	01 00                	add    DWORD PTR [eax],eax
     92f:	00 02                	add    BYTE PTR [edx],al
     931:	2e                   	cs
     932:	53                   	push   ebx
     933:	00 00                	add    BYTE PTR [eax],al
     935:	00 02                	add    BYTE PTR [edx],al
     937:	01 08                	add    DWORD PTR [eax],ecx
     939:	69 02 00 00 02 02    	imul   eax,DWORD PTR [edx],0x2020000
     93f:	07                   	pop    es
     940:	d3 02                	rol    DWORD PTR [edx],cl
     942:	00 00                	add    BYTE PTR [eax],al
     944:	04 a6                	add    al,0xa6
     946:	02 00                	add    al,BYTE PTR [eax]
     948:	00 02                	add    BYTE PTR [edx],al
     94a:	34 6c                	xor    al,0x6c
     94c:	00 00                	add    BYTE PTR [eax],al
     94e:	00 02                	add    BYTE PTR [edx],al
     950:	04 07                	add    al,0x7
     952:	91                   	xchg   ecx,eax
     953:	02 00                	add    al,BYTE PTR [eax]
     955:	00 02                	add    BYTE PTR [edx],al
     957:	08 07                	or     BYTE PTR [edi],al
     959:	87 02                	xchg   DWORD PTR [edx],eax
     95b:	00 00                	add    BYTE PTR [eax],al
     95d:	02 04 05 c3 01 00 00 	add    al,BYTE PTR [eax*1+0x1c3]
     964:	05 04 87 00 00       	add    eax,0x8704
     969:	00 06                	add    BYTE PTR [esi],al
     96b:	25 00 00 00 02       	and    eax,0x2000000
     970:	01 02                	add    DWORD PTR [edx],eax
     972:	16                   	push   ss
     973:	03 00                	add    eax,DWORD PTR [eax]
     975:	00 07                	add    BYTE PTR [edi],al
     977:	04 02                	add    al,0x2
     979:	04 07                	add    al,0x7
     97b:	85 00                	test   DWORD PTR [eax],eax
     97d:	00 00                	add    BYTE PTR [eax],al
     97f:	08 05 03 58 1d 01    	or     BYTE PTR ds:0x11d5803,al
     985:	00 00                	add    BYTE PTR [eax],al
     987:	09 f9                	or     ecx,edi
     989:	03 00                	add    eax,DWORD PTR [eax]
     98b:	00 03                	add    BYTE PTR [ebx],al
     98d:	59                   	pop    ecx
     98e:	48                   	dec    eax
     98f:	00 00                	add    BYTE PTR [eax],al
     991:	00 01                	add    BYTE PTR [ecx],al
     993:	04 04                	add    al,0x4
     995:	00 09                	add    BYTE PTR [ecx],cl
     997:	f0 02 00             	lock add al,BYTE PTR [eax]
     99a:	00 03                	add    BYTE PTR [ebx],al
     99c:	5a                   	pop    edx
     99d:	48                   	dec    eax
     99e:	00 00                	add    BYTE PTR [eax],al
     9a0:	00 01                	add    BYTE PTR [ecx],al
     9a2:	04 00                	add    al,0x0
     9a4:	00 09                	add    BYTE PTR [ecx],cl
     9a6:	9f                   	lahf   
     9a7:	02 00                	add    al,BYTE PTR [eax]
     9a9:	00 03                	add    BYTE PTR [ebx],al
     9ab:	5b                   	pop    ebx
     9ac:	48                   	dec    eax
     9ad:	00 00                	add    BYTE PTR [eax],al
     9af:	00 01                	add    BYTE PTR [ecx],al
     9b1:	04 04                	add    al,0x4
     9b3:	01 09                	add    DWORD PTR [ecx],ecx
     9b5:	89 00                	mov    DWORD PTR [eax],eax
     9b7:	00 00                	add    BYTE PTR [eax],al
     9b9:	03 5c 48 00          	add    ebx,DWORD PTR [eax+ecx*2+0x0]
     9bd:	00 00                	add    BYTE PTR [eax],al
     9bf:	01 02                	add    DWORD PTR [edx],eax
     9c1:	02 01                	add    al,BYTE PTR [ecx]
     9c3:	09 e7                	or     edi,esp
     9c5:	01 00                	add    DWORD PTR [eax],eax
     9c7:	00 03                	add    BYTE PTR [ebx],al
     9c9:	5d                   	pop    ebp
     9ca:	48                   	dec    eax
     9cb:	00 00                	add    BYTE PTR [eax],al
     9cd:	00 01                	add    BYTE PTR [ecx],al
     9cf:	02 00                	add    al,BYTE PTR [eax]
     9d1:	01 09                	add    DWORD PTR [ecx],ecx
     9d3:	ef                   	out    dx,eax
     9d4:	02 00                	add    al,BYTE PTR [eax]
     9d6:	00 03                	add    BYTE PTR [ebx],al
     9d8:	5e                   	pop    esi
     9d9:	48                   	dec    eax
     9da:	00 00                	add    BYTE PTR [eax],al
     9dc:	00 01                	add    BYTE PTR [ecx],al
     9de:	04 04                	add    al,0x4
     9e0:	02 09                	add    cl,BYTE PTR [ecx]
     9e2:	9e                   	sahf   
     9e3:	02 00                	add    al,BYTE PTR [eax]
     9e5:	00 03                	add    BYTE PTR [ebx],al
     9e7:	5f                   	pop    edi
     9e8:	48                   	dec    eax
     9e9:	00 00                	add    BYTE PTR [eax],al
     9eb:	00 01                	add    BYTE PTR [ecx],al
     9ed:	08 00                	or     BYTE PTR [eax],al
     9ef:	03 09                	add    ecx,DWORD PTR [ecx]
     9f1:	ec                   	in     al,dx
     9f2:	01 00                	add    DWORD PTR [eax],eax
     9f4:	00 03                	add    BYTE PTR [ebx],al
     9f6:	60                   	pusha  
     9f7:	48                   	dec    eax
     9f8:	00 00                	add    BYTE PTR [eax],al
     9fa:	00 01                	add    BYTE PTR [ecx],al
     9fc:	04 04                	add    al,0x4
     9fe:	04 00                	add    al,0x0
     a00:	0a 08                	or     cl,BYTE PTR [eax]
     a02:	03 56 36             	add    edx,DWORD PTR [esi+0x36]
     a05:	01 00                	add    DWORD PTR [eax],eax
     a07:	00 0b                	add    BYTE PTR [ebx],cl
     a09:	9c                   	pushf  
     a0a:	00 00                	add    BYTE PTR [eax],al
     a0c:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     a0f:	65 67 00 03          	add    BYTE PTR gs:[bp+di],al
     a13:	62 61 00             	bound  esp,QWORD PTR [ecx+0x0]
     a16:	00 00                	add    BYTE PTR [eax],al
     a18:	00 08                	add    BYTE PTR [eax],cl
     a1a:	04 03                	add    al,0x3
     a1c:	db 6c 01 00          	fld    TBYTE PTR [ecx+eax*1+0x0]
     a20:	00 09                	add    BYTE PTR [ecx],cl
     a22:	90                   	nop
     a23:	03 00                	add    eax,DWORD PTR [eax]
     a25:	00 03                	add    BYTE PTR [ebx],al
     a27:	dc 48 00             	fmul   QWORD PTR [eax+0x0]
     a2a:	00 00                	add    BYTE PTR [eax],al
     a2c:	01 01                	add    DWORD PTR [ecx],eax
     a2e:	07                   	pop    es
     a2f:	00 09                	add    BYTE PTR [ecx],cl
     a31:	a3 03 00 00 03       	mov    ds:0x3000003,eax
     a36:	dd 48 00             	fisttp QWORD PTR [eax+0x0]
     a39:	00 00                	add    BYTE PTR [eax],al
     a3b:	01 01                	add    DWORD PTR [ecx],eax
     a3d:	06                   	push   es
     a3e:	00 09                	add    BYTE PTR [ecx],cl
     a40:	d6                   	(bad)  
     a41:	03 00                	add    eax,DWORD PTR [eax]
     a43:	00 03                	add    BYTE PTR [ebx],al
     a45:	de 61 00             	fisub  WORD PTR [ecx+0x0]
     a48:	00 00                	add    BYTE PTR [eax],al
     a4a:	04 1e                	add    al,0x1e
     a4c:	00 00                	add    BYTE PTR [eax],al
     a4e:	00 0a                	add    BYTE PTR [edx],cl
     a50:	04 03                	add    al,0x3
     a52:	da 85 01 00 00 0b    	fiadd  DWORD PTR [ebp+0xb000001]
     a58:	36 01 00             	add    DWORD PTR ss:[eax],eax
     a5b:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     a5e:	65 67 00 03          	add    BYTE PTR gs:[bp+di],al
     a62:	e0 61                	loopne ac5 <cmdClearScreen-0x30ff53b>
     a64:	00 00                	add    BYTE PTR [eax],al
     a66:	00 00                	add    BYTE PTR [eax],al
     a68:	0d 5a 01 00 00       	or     eax,0x15a
     a6d:	04 6c                	add    al,0x6c
     a6f:	00 00                	add    BYTE PTR [eax],al
     a71:	00 07                	add    BYTE PTR [edi],al
     a73:	15 c0 01 00 00       	adc    eax,0x1c0
     a78:	0e                   	push   cs
     a79:	1c 03                	sbb    al,0x3
     a7b:	00 00                	add    BYTE PTR [eax],al
     a7d:	01 0e                	add    DWORD PTR [esi],ecx
     a7f:	05 02 00 00 02       	add    eax,0x2000002
     a84:	0e                   	push   cs
     a85:	16                   	push   ss
     a86:	01 00                	add    DWORD PTR [eax],eax
     a88:	00 04 0e             	add    BYTE PTR [esi+ecx*1],al
     a8b:	df 03                	fild   WORD PTR [ebx]
     a8d:	00 00                	add    BYTE PTR [eax],al
     a8f:	08 0e                	or     BYTE PTR [esi],cl
     a91:	4b                   	dec    ebx
     a92:	03 00                	add    eax,DWORD PTR [eax]
     a94:	00 10                	add    BYTE PTR [eax],dl
     a96:	0e                   	push   cs
     a97:	97                   	xchg   edi,eax
     a98:	00 00                	add    BYTE PTR [eax],al
     a9a:	00 20                	add    BYTE PTR [eax],ah
     a9c:	0e                   	push   cs
     a9d:	00 03                	add    BYTE PTR [ebx],al
     a9f:	00 00                	add    BYTE PTR [eax],al
     aa1:	40                   	inc    eax
     aa2:	00 08                	add    BYTE PTR [eax],cl
     aa4:	10 04 13             	adc    BYTE PTR [ebx+edx*1],al
     aa7:	f9                   	stc    
     aa8:	01 00                	add    DWORD PTR [eax],eax
     aaa:	00 0f                	add    BYTE PTR [edi],cl
     aac:	4b                   	dec    ebx
     aad:	02 00                	add    al,BYTE PTR [eax]
     aaf:	00 04 15 f9 01 00 00 	add    BYTE PTR [edx*1+0x1f9],al
     ab6:	00 0f                	add    BYTE PTR [edi],cl
     ab8:	79 00                	jns    aba <cmdClearScreen-0x30ff546>
     aba:	00 00                	add    BYTE PTR [eax],al
     abc:	04 16                	add    al,0x16
     abe:	f9                   	stc    
     abf:	01 00                	add    DWORD PTR [eax],eax
     ac1:	00 04 0f             	add    BYTE PTR [edi+ecx*1],al
     ac4:	75 01                	jne    ac7 <cmdClearScreen-0x30ff539>
     ac6:	00 00                	add    BYTE PTR [eax],al
     ac8:	04 17                	add    al,0x17
     aca:	93                   	xchg   ebx,eax
     acb:	00 00                	add    BYTE PTR [eax],al
     acd:	00 08                	add    BYTE PTR [eax],cl
     acf:	0f 9c 01             	setl   BYTE PTR [ecx]
     ad2:	00 00                	add    BYTE PTR [eax],al
     ad4:	04 18                	add    al,0x18
     ad6:	3a 00                	cmp    al,BYTE PTR [eax]
     ad8:	00 00                	add    BYTE PTR [eax],al
     ada:	0c 00                	or     al,0x0
     adc:	05 04 25 00 00       	add    eax,0x2504
     ae1:	00 04 05 04 00 00 04 	add    BYTE PTR [eax*1+0x4000004],al
     ae8:	19 c0                	sbb    eax,eax
     aea:	01 00                	add    DWORD PTR [eax],eax
     aec:	00 10                	add    BYTE PTR [eax],dl
     aee:	86 04 00             	xchg   BYTE PTR [eax+eax*1],al
     af1:	00 01                	add    BYTE PTR [ecx],al
     af3:	19 d8                	sbb    eax,ebx
     af5:	07                   	pop    es
     af6:	10 03                	adc    BYTE PTR [ebx],al
     af8:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     af9:	00 00                	add    BYTE PTR [eax],al
     afb:	00 01                	add    BYTE PTR [ecx],al
     afd:	9c                   	pushf  
     afe:	3a 02                	cmp    al,BYTE PTR [edx]
     b00:	00 00                	add    BYTE PTR [eax],al
     b02:	11 91 04 00 00 01    	adc    DWORD PTR [ecx+0x1000004],edx
     b08:	19 f9                	sbb    ecx,edi
     b0a:	01 00                	add    DWORD PTR [eax],eax
     b0c:	00 02                	add    BYTE PTR [edx],al
     b0e:	91                   	xchg   ecx,eax
     b0f:	00 12                	add    BYTE PTR [edx],dl
     b11:	69 00 01 1b 3a 00    	imul   eax,DWORD PTR [eax],0x3a1b01
     b17:	00 00                	add    BYTE PTR [eax],al
     b19:	02 91 6c 00 13 50    	add    dl,BYTE PTR [ecx+0x5013006c]
     b1f:	04 00                	add    al,0x0
     b21:	00 01                	add    BYTE PTR [ecx],al
     b23:	31 3a                	xor    DWORD PTR [edx],edi
     b25:	00 00                	add    BYTE PTR [eax],al
     b27:	00 7e 08             	add    BYTE PTR [esi+0x8],bh
     b2a:	10 03                	adc    BYTE PTR [ebx],al
     b2c:	a9 01 00 00 01       	test   eax,0x1000001
     b31:	9c                   	pushf  
     b32:	d8 02                	fadd   DWORD PTR [edx]
     b34:	00 00                	add    BYTE PTR [eax],al
     b36:	11 a2 05 00 00 01    	adc    DWORD PTR [edx+0x1000005],esp
     b3c:	31 f9                	xor    ecx,edi
     b3e:	01 00                	add    DWORD PTR [eax],eax
     b40:	00 02                	add    BYTE PTR [edx],al
     b42:	91                   	xchg   ecx,eax
     b43:	00 11                	add    BYTE PTR [ecx],dl
     b45:	44                   	inc    esp
     b46:	02 00                	add    al,BYTE PTR [eax]
     b48:	00 01                	add    BYTE PTR [ecx],al
     b4a:	31 e8                	xor    eax,ebp
     b4c:	02 00                	add    al,BYTE PTR [eax]
     b4e:	00 02                	add    BYTE PTR [edx],al
     b50:	91                   	xchg   ecx,eax
     b51:	04 11                	add    al,0x11
     b53:	5b                   	pop    ebx
     b54:	03 00                	add    eax,DWORD PTR [eax]
     b56:	00 01                	add    BYTE PTR [ecx],al
     b58:	31 3a                	xor    DWORD PTR [edx],edi
     b5a:	00 00                	add    BYTE PTR [eax],al
     b5c:	00 02                	add    BYTE PTR [edx],al
     b5e:	91                   	xchg   ecx,eax
     b5f:	08 12                	or     BYTE PTR [edx],dl
     b61:	78 00                	js     b63 <cmdClearScreen-0x30ff49d>
     b63:	01 33                	add    DWORD PTR [ebx],esi
     b65:	3a 00                	cmp    al,BYTE PTR [eax]
     b67:	00 00                	add    BYTE PTR [eax],al
     b69:	02 91 6c 12 79 00    	add    dl,BYTE PTR [ecx+0x79126c]
     b6f:	01 33                	add    DWORD PTR [ebx],esi
     b71:	3a 00                	cmp    al,BYTE PTR [eax]
     b73:	00 00                	add    BYTE PTR [eax],al
     b75:	02 91 68 14 25 04    	add    dl,BYTE PTR [ecx+0x4251468]
     b7b:	00 00                	add    BYTE PTR [eax],al
     b7d:	01 34 3a             	add    DWORD PTR [edx+edi*1],esi
     b80:	00 00                	add    BYTE PTR [eax],al
     b82:	00 02                	add    BYTE PTR [edx],al
     b84:	91                   	xchg   ecx,eax
     b85:	64                   	fs
     b86:	14 75                	adc    al,0x75
     b88:	04 00                	add    al,0x0
     b8a:	00 01                	add    BYTE PTR [ecx],al
     b8c:	34 3a                	xor    al,0x3a
     b8e:	00 00                	add    BYTE PTR [eax],al
     b90:	00 02                	add    BYTE PTR [edx],al
     b92:	91                   	xchg   ecx,eax
     b93:	60                   	pusha  
     b94:	14 13                	adc    al,0x13
     b96:	05 00 00 01 35       	add    eax,0x35010000
     b9b:	8c 00                	mov    WORD PTR [eax],es
     b9d:	00 00                	add    BYTE PTR [eax],al
     b9f:	02 91 5f 15 b9 08    	add    dl,BYTE PTR [ecx+0x8b9155f]
     ba5:	10 03                	adc    BYTE PTR [ebx],al
     ba7:	47                   	inc    edi
     ba8:	01 00                	add    DWORD PTR [eax],eax
     baa:	00 12                	add    BYTE PTR [edx],dl
     bac:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     baf:	00 01                	add    BYTE PTR [ecx],al
     bb1:	39 6c 00 00          	cmp    DWORD PTR [eax+eax*1+0x0],ebp
     bb5:	00 02                	add    BYTE PTR [edx],al
     bb7:	91                   	xchg   ecx,eax
     bb8:	58                   	pop    eax
     bb9:	00 00                	add    BYTE PTR [eax],al
     bbb:	16                   	push   ss
     bbc:	25 00 00 00 e8       	and    eax,0xe8000000
     bc1:	02 00                	add    al,BYTE PTR [eax]
     bc3:	00 17                	add    BYTE PTR [edi],dl
     bc5:	95                   	xchg   ebp,eax
     bc6:	00 00                	add    BYTE PTR [eax],al
     bc8:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
     bcb:	05 04 d8 02 00       	add    eax,0x2d804
     bd0:	00 13                	add    BYTE PTR [ebx],dl
     bd2:	b2 05                	mov    dl,0x5
     bd4:	00 00                	add    BYTE PTR [eax],al
     bd6:	01 63 3a             	add    DWORD PTR [ebx+0x3a],esp
     bd9:	00 00                	add    BYTE PTR [eax],al
     bdb:	00 27                	add    BYTE PTR [edi],ah
     bdd:	0a 10                	or     dl,BYTE PTR [eax]
     bdf:	03 69 00             	add    ebp,DWORD PTR [ecx+0x0]
     be2:	00 00                	add    BYTE PTR [eax],al
     be4:	01 9c 30 03 00 00 11 	add    DWORD PTR [eax+esi*1+0x11000003],ebx
     beb:	aa                   	stos   BYTE PTR es:[edi],al
     bec:	05 00 00 01 63       	add    eax,0x63010000
     bf1:	f9                   	stc    
     bf2:	01 00                	add    DWORD PTR [eax],eax
     bf4:	00 02                	add    BYTE PTR [edx],al
     bf6:	91                   	xchg   ecx,eax
     bf7:	00 12                	add    BYTE PTR [edx],dl
     bf9:	69 00 01 65 6c 00    	imul   eax,DWORD PTR [eax],0x6c6501
     bff:	00 00                	add    BYTE PTR [eax],al
     c01:	02 91 6c 12 72 65    	add    dl,BYTE PTR [ecx+0x6572126c]
     c07:	74 00                	je     c09 <cmdClearScreen-0x30ff3f7>
     c09:	01 66 3a             	add    DWORD PTR [esi+0x3a],esp
     c0c:	00 00                	add    BYTE PTR [eax],al
     c0e:	00 02                	add    BYTE PTR [edx],al
     c10:	91                   	xchg   ecx,eax
     c11:	68 00 13 40 05       	push   0x5401300
     c16:	00 00                	add    BYTE PTR [eax],al
     c18:	01 77 ee             	add    DWORD PTR [edi-0x12],esi
     c1b:	03 00                	add    eax,DWORD PTR [eax]
     c1d:	00 90 0a 10 03 8e    	add    BYTE PTR [eax-0x71fceff6],dl
     c23:	02 00                	add    al,BYTE PTR [eax]
     c25:	00 01                	add    BYTE PTR [ecx],al
     c27:	9c                   	pushf  
     c28:	ee                   	out    dx,al
     c29:	03 00                	add    eax,DWORD PTR [eax]
     c2b:	00 11                	add    BYTE PTR [ecx],dl
     c2d:	61                   	popa   
     c2e:	04 00                	add    al,0x0
     c30:	00 01                	add    BYTE PTR [ecx],al
     c32:	77 81                	ja     bb5 <cmdClearScreen-0x30ff44b>
     c34:	00 00                	add    BYTE PTR [eax],al
     c36:	00 02                	add    BYTE PTR [edx],al
     c38:	91                   	xchg   ecx,eax
     c39:	00 12                	add    BYTE PTR [edx],dl
     c3b:	61                   	popa   
     c3c:	72 67                	jb     ca5 <cmdClearScreen-0x30ff35b>
     c3e:	00 01                	add    BYTE PTR [ecx],al
     c40:	79 f9                	jns    c3b <cmdClearScreen-0x30ff3c5>
     c42:	01 00                	add    DWORD PTR [eax],eax
     c44:	00 02                	add    BYTE PTR [edx],al
     c46:	91                   	xchg   ecx,eax
     c47:	6c                   	ins    BYTE PTR es:[edi],dx
     c48:	14 be                	adc    al,0xbe
     c4a:	05 00 00 01 7a       	add    eax,0x7a010000
     c4f:	f9                   	stc    
     c50:	01 00                	add    DWORD PTR [eax],eax
     c52:	00 02                	add    BYTE PTR [edx],al
     c54:	91                   	xchg   ecx,eax
     c55:	68 14 db 04 00       	push   0x4db14
     c5a:	00 01                	add    BYTE PTR [ecx],al
     c5c:	7b 3a                	jnp    c98 <cmdClearScreen-0x30ff368>
     c5e:	00 00                	add    BYTE PTR [eax],al
     c60:	00 02                	add    BYTE PTR [edx],al
     c62:	91                   	xchg   ecx,eax
     c63:	64                   	fs
     c64:	14 b4                	adc    al,0xb4
     c66:	04 00                	add    al,0x0
     c68:	00 01                	add    BYTE PTR [ecx],al
     c6a:	7c 3a                	jl     ca6 <cmdClearScreen-0x30ff35a>
     c6c:	00 00                	add    BYTE PTR [eax],al
     c6e:	00 02                	add    BYTE PTR [edx],al
     c70:	91                   	xchg   ecx,eax
     c71:	60                   	pusha  
     c72:	14 da                	adc    al,0xda
     c74:	04 00                	add    al,0x0
     c76:	00 01                	add    BYTE PTR [ecx],al
     c78:	7d 3a                	jge    cb4 <cmdClearScreen-0x30ff34c>
     c7a:	00 00                	add    BYTE PTR [eax],al
     c7c:	00 02                	add    BYTE PTR [edx],al
     c7e:	91                   	xchg   ecx,eax
     c7f:	5c                   	pop    esp
     c80:	14 00                	adc    al,0x0
     c82:	05 00 00 01 7e       	add    eax,0x7e010000
     c87:	3a 00                	cmp    al,BYTE PTR [eax]
     c89:	00 00                	add    BYTE PTR [eax],al
     c8b:	02 91 58 14 fd 04    	add    dl,BYTE PTR [ecx+0x4fd1458]
     c91:	00 00                	add    BYTE PTR [eax],al
     c93:	01 7f 3a             	add    DWORD PTR [edi+0x3a],edi
     c96:	00 00                	add    BYTE PTR [eax],al
     c98:	00 02                	add    BYTE PTR [edx],al
     c9a:	91                   	xchg   ecx,eax
     c9b:	54                   	push   esp
     c9c:	14 45                	adc    al,0x45
     c9e:	05 00 00 01 80       	add    eax,0x80010000
     ca3:	ee                   	out    dx,al
     ca4:	03 00                	add    eax,DWORD PTR [eax]
     ca6:	00 02                	add    BYTE PTR [edx],al
     ca8:	91                   	xchg   ecx,eax
     ca9:	50                   	push   eax
     caa:	14 8e                	adc    al,0x8e
     cac:	05 00 00 01 81       	add    eax,0x81010000
     cb1:	ee                   	out    dx,al
     cb2:	03 00                	add    eax,DWORD PTR [eax]
     cb4:	00 02                	add    BYTE PTR [edx],al
     cb6:	91                   	xchg   ecx,eax
     cb7:	4c                   	dec    esp
     cb8:	15 51 0c 10 03       	adc    eax,0x3100c51
     cbd:	9e                   	sahf   
     cbe:	00 00                	add    BYTE PTR [eax],al
     cc0:	00 14 4b             	add    BYTE PTR [ebx+ecx*2],dl
     cc3:	04 00                	add    al,0x0
     cc5:	00 01                	add    BYTE PTR [ecx],al
     cc7:	da f9                	(bad)  
     cc9:	01 00                	add    DWORD PTR [eax],eax
     ccb:	00 02                	add    BYTE PTR [edx],al
     ccd:	91                   	xchg   ecx,eax
     cce:	48                   	dec    eax
     ccf:	00 00                	add    BYTE PTR [eax],al
     cd1:	05 04 f9 01 00       	add    eax,0x1f904
     cd6:	00 13                	add    BYTE PTR [ebx],dl
     cd8:	cd 04                	int    0x4
     cda:	00 00                	add    BYTE PTR [eax],al
     cdc:	01 f0                	add    eax,esi
     cde:	ee                   	out    dx,al
     cdf:	03 00                	add    eax,DWORD PTR [eax]
     ce1:	00 1e                	add    BYTE PTR [esi],bl
     ce3:	0d 10 03 76 00       	or     eax,0x760310
     ce8:	00 00                	add    BYTE PTR [eax],al
     cea:	01 9c 50 04 00 00 11 	add    DWORD PTR [eax+edx*2+0x11000004],ebx
     cf1:	cc                   	int3   
     cf2:	02 00                	add    al,BYTE PTR [eax]
     cf4:	00 01                	add    BYTE PTR [ecx],al
     cf6:	f0 3a 00             	lock cmp al,BYTE PTR [eax]
     cf9:	00 00                	add    BYTE PTR [eax],al
     cfb:	02 91 00 11 44 02    	add    dl,BYTE PTR [ecx+0x2441100]
     d01:	00 00                	add    BYTE PTR [eax],al
     d03:	01 f0                	add    eax,esi
     d05:	e8 02 00 00 02       	call   2000d0c <cmdClearScreen-0x10ff2f4>
     d0a:	91                   	xchg   ecx,eax
     d0b:	04 11                	add    al,0x11
     d0d:	81 04 00 00 01 f0 ee 	add    DWORD PTR [eax+eax*1],0xeef00100
     d14:	03 00                	add    eax,DWORD PTR [eax]
     d16:	00 02                	add    BYTE PTR [edx],al
     d18:	91                   	xchg   ecx,eax
     d19:	08 15 25 0d 10 03    	or     BYTE PTR ds:0x3100d25,dl
     d1f:	67 00 00             	add    BYTE PTR [bx+si],al
     d22:	00 12                	add    BYTE PTR [edx],dl
     d24:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     d27:	00 01                	add    BYTE PTR [ecx],al
     d29:	f2 3a 00             	repnz cmp al,BYTE PTR [eax]
     d2c:	00 00                	add    BYTE PTR [eax],al
     d2e:	02 91 6c 00 00 10    	add    dl,BYTE PTR [ecx+0x1000006c]
     d34:	bb 04 00 00 01       	mov    ebx,0x1000004
     d39:	fa                   	cli    
     d3a:	94                   	xchg   esp,eax
     d3b:	0d 10 03 3d 00       	or     eax,0x3d0310
     d40:	00 00                	add    BYTE PTR [eax],al
     d42:	01 9c 9a 04 00 00 11 	add    DWORD PTR [edx+ebx*4+0x11000004],ebx
     d49:	cc                   	int3   
     d4a:	02 00                	add    al,BYTE PTR [eax]
     d4c:	00 01                	add    BYTE PTR [ecx],al
     d4e:	fa                   	cli    
     d4f:	3a 00                	cmp    al,BYTE PTR [eax]
     d51:	00 00                	add    BYTE PTR [eax],al
     d53:	02 91 00 11 44 02    	add    dl,BYTE PTR [ecx+0x2441100]
     d59:	00 00                	add    BYTE PTR [eax],al
     d5b:	01 fa                	add    edx,edi
     d5d:	ee                   	out    dx,al
     d5e:	03 00                	add    eax,DWORD PTR [eax]
     d60:	00 02                	add    BYTE PTR [edx],al
     d62:	91                   	xchg   ecx,eax
     d63:	04 15                	add    al,0x15
     d65:	9a 0d 10 03 26 00 00 	call   0x0:0x2603100d
     d6c:	00 12                	add    BYTE PTR [edx],dl
     d6e:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     d71:	00 01                	add    BYTE PTR [ecx],al
     d73:	fc                   	cld    
     d74:	3a 00                	cmp    al,BYTE PTR [eax]
     d76:	00 00                	add    BYTE PTR [eax],al
     d78:	02 91 6c 00 00 18    	add    dl,BYTE PTR [ecx+0x1800006c]
     d7e:	a0 04 00 00 01       	mov    al,ds:0x1000004
     d83:	01 01                	add    DWORD PTR [ecx],eax
     d85:	8c 00                	mov    WORD PTR [eax],es
     d87:	00 00                	add    BYTE PTR [eax],al
     d89:	d1 0d 10 03 8c 00    	ror    DWORD PTR ds:0x8c0310,1
     d8f:	00 00                	add    BYTE PTR [eax],al
     d91:	01 9c 05 05 00 00 19 	add    DWORD PTR [ebp+eax*1+0x19000005],ebx
     d98:	2d 05 00 00 01       	sub    eax,0x1000005
     d9d:	01 01                	add    DWORD PTR [ecx],eax
     d9f:	f9                   	stc    
     da0:	01 00                	add    DWORD PTR [eax],eax
     da2:	00 02                	add    BYTE PTR [edx],al
     da4:	91                   	xchg   ecx,eax
     da5:	00 19                	add    BYTE PTR [ecx],bl
     da7:	9a 04 00 00 01 01 01 	call   0x101:0x1000004
     dae:	f9                   	stc    
     daf:	01 00                	add    DWORD PTR [eax],eax
     db1:	00 02                	add    BYTE PTR [edx],al
     db3:	91                   	xchg   ecx,eax
     db4:	04 15                	add    al,0x15
     db6:	d7                   	xlat   BYTE PTR ds:[ebx]
     db7:	0d 10 03 7f 00       	or     eax,0x7f0310
     dbc:	00 00                	add    BYTE PTR [eax],al
     dbe:	1a 63 6e             	sbb    ah,BYTE PTR [ebx+0x6e]
     dc1:	74 00                	je     dc3 <cmdClearScreen-0x30ff23d>
     dc3:	01 04 01             	add    DWORD PTR [ecx+eax*1],eax
     dc6:	3a 00                	cmp    al,BYTE PTR [eax]
     dc8:	00 00                	add    BYTE PTR [eax],al
     dca:	02 91 6c 15 f3 0d    	add    dl,BYTE PTR [ecx+0xdf3156c]
     dd0:	10 03                	adc    BYTE PTR [ebx],al
     dd2:	59                   	pop    ecx
     dd3:	00 00                	add    BYTE PTR [eax],al
     dd5:	00 1a                	add    BYTE PTR [edx],bl
     dd7:	69 64 78 00 01 08 01 	imul   esp,DWORD PTR [eax+edi*2+0x0],0xf9010801
     dde:	f9 
     ddf:	01 00                	add    DWORD PTR [eax],eax
     de1:	00 02                	add    BYTE PTR [edx],al
     de3:	91                   	xchg   ecx,eax
     de4:	68 00 00 00 1b       	push   0x1b000000
     de9:	34 05                	xor    al,0x5
     deb:	00 00                	add    BYTE PTR [eax],al
     ded:	01 20                	add    DWORD PTR [eax],esp
     def:	01 5d 0e             	add    DWORD PTR [ebp+0xe],ebx
     df2:	10 03                	adc    BYTE PTR [ebx],al
     df4:	2e 00 00             	add    BYTE PTR cs:[eax],al
     df7:	00 01                	add    BYTE PTR [ecx],al
     df9:	9c                   	pushf  
     dfa:	2b 05 00 00 19 aa    	sub    eax,DWORD PTR ds:0xaa190000
     e00:	05 00 00 01 20       	add    eax,0x20010000
     e05:	01 f9                	add    ecx,edi
     e07:	01 00                	add    DWORD PTR [eax],eax
     e09:	00 02                	add    BYTE PTR [edx],al
     e0b:	91                   	xchg   ecx,eax
     e0c:	00 00                	add    BYTE PTR [eax],al
     e0e:	1c 2d                	sbb    al,0x2d
     e10:	04 00                	add    al,0x0
     e12:	00 01                	add    BYTE PTR [ecx],al
     e14:	25 01 8b 0e 10       	and    eax,0x100e8b01
     e19:	03 23                	add    esp,DWORD PTR [ebx]
     e1b:	00 00                	add    BYTE PTR [eax],al
     e1d:	00 01                	add    BYTE PTR [ecx],al
     e1f:	9c                   	pushf  
     e20:	18 e2                	sbb    dl,ah
     e22:	04 00                	add    al,0x0
     e24:	00 01                	add    BYTE PTR [ecx],al
     e26:	2a 01                	sub    al,BYTE PTR [ecx]
     e28:	3a 00                	cmp    al,BYTE PTR [eax]
     e2a:	00 00                	add    BYTE PTR [eax],al
     e2c:	ae                   	scas   al,BYTE PTR es:[edi]
     e2d:	0e                   	push   cs
     e2e:	10 03                	adc    BYTE PTR [ebx],al
     e30:	26 00 00             	add    BYTE PTR es:[eax],al
     e33:	00 01                	add    BYTE PTR [ecx],al
     e35:	9c                   	pushf  
     e36:	75 05                	jne    e3d <cmdClearScreen-0x30ff1c3>
     e38:	00 00                	add    BYTE PTR [eax],al
     e3a:	19 aa 05 00 00 01    	sbb    DWORD PTR [edx+0x1000005],ebp
     e40:	2a 01                	sub    al,BYTE PTR [ecx]
     e42:	f9                   	stc    
     e43:	01 00                	add    DWORD PTR [eax],eax
     e45:	00 02                	add    BYTE PTR [edx],al
     e47:	91                   	xchg   ecx,eax
     e48:	00 1d c6 05 00 00    	add    BYTE PTR ds:0x5c6,bl
     e4e:	01 2c 01             	add    DWORD PTR [ecx+eax*1],ebp
     e51:	3a 00                	cmp    al,BYTE PTR [eax]
     e53:	00 00                	add    BYTE PTR [eax],al
     e55:	1e                   	push   ds
     e56:	00 00                	add    BYTE PTR [eax],al
     e58:	1f                   	pop    ds
     e59:	94                   	xchg   esp,eax
     e5a:	05 00 00 01 32       	add    eax,0x32010000
     e5f:	01 3a                	add    DWORD PTR [edx],edi
     e61:	00 00                	add    BYTE PTR [eax],al
     e63:	00 d4                	add    ah,dl
     e65:	0e                   	push   cs
     e66:	10 03                	adc    BYTE PTR [ebx],al
     e68:	16                   	push   ss
     e69:	00 00                	add    BYTE PTR [eax],al
     e6b:	00 01                	add    BYTE PTR [ecx],al
     e6d:	9c                   	pushf  
     e6e:	9f                   	lahf   
     e6f:	05 00 00 19 6b       	add    eax,0x6b190000
     e74:	05 00 00 01 32       	add    eax,0x32010000
     e79:	01 3a                	add    DWORD PTR [edx],edi
     e7b:	00 00                	add    BYTE PTR [eax],al
     e7d:	00 02                	add    BYTE PTR [edx],al
     e7f:	91                   	xchg   ecx,eax
     e80:	00 00                	add    BYTE PTR [eax],al
     e82:	1f                   	pop    ds
     e83:	05 05 00 00 01       	add    eax,0x1000005
     e88:	3c 01                	cmp    al,0x1
     e8a:	3a 00                	cmp    al,BYTE PTR [eax]
     e8c:	00 00                	add    BYTE PTR [eax],al
     e8e:	ea 0e 10 03 20 00 00 	jmp    0x0:0x2003100e
     e95:	00 01                	add    BYTE PTR [ecx],al
     e97:	9c                   	pushf  
     e98:	c9                   	leave  
     e99:	05 00 00 19 6b       	add    eax,0x6b190000
     e9e:	05 00 00 01 3c       	add    eax,0x3c010000
     ea3:	01 3a                	add    DWORD PTR [edx],edi
     ea5:	00 00                	add    BYTE PTR [eax],al
     ea7:	00 02                	add    BYTE PTR [edx],al
     ea9:	91                   	xchg   ecx,eax
     eaa:	00 00                	add    BYTE PTR [eax],al
     eac:	18 7f 05             	sbb    BYTE PTR [edi+0x5],bh
     eaf:	00 00                	add    BYTE PTR [eax],al
     eb1:	01 49 01             	add    DWORD PTR [ecx+0x1],ecx
     eb4:	3a 00                	cmp    al,BYTE PTR [eax]
     eb6:	00 00                	add    BYTE PTR [eax],al
     eb8:	0a 0f                	or     cl,BYTE PTR [edi]
     eba:	10 03                	adc    BYTE PTR [ebx],al
     ebc:	e4 03                	in     al,0x3
     ebe:	00 00                	add    BYTE PTR [eax],al
     ec0:	01 9c 88 06 00 00 19 	add    DWORD PTR [eax+ecx*4+0x19000006],ebx
     ec7:	00 05 00 00 01 49    	add    BYTE PTR ds:0x49010000,al
     ecd:	01 3a                	add    DWORD PTR [edx],edi
     ecf:	00 00                	add    BYTE PTR [eax],al
     ed1:	00 02                	add    BYTE PTR [edx],al
     ed3:	91                   	xchg   ecx,eax
     ed4:	00 19                	add    BYTE PTR [ecx],bl
     ed6:	45                   	inc    ebp
     ed7:	05 00 00 01 49       	add    eax,0x49010000
     edc:	01 ee                	add    esi,ebp
     ede:	03 00                	add    eax,DWORD PTR [eax]
     ee0:	00 02                	add    BYTE PTR [edx],al
     ee2:	91                   	xchg   ecx,eax
     ee3:	04 19                	add    al,0x19
     ee5:	34 04                	xor    al,0x4
     ee7:	00 00                	add    BYTE PTR [eax],al
     ee9:	01 49 01             	add    DWORD PTR [ecx+0x1],ecx
     eec:	ee                   	out    dx,al
     eed:	03 00                	add    eax,DWORD PTR [eax]
     eef:	00 02                	add    BYTE PTR [edx],al
     ef1:	91                   	xchg   ecx,eax
     ef2:	08 20                	or     BYTE PTR [eax],ah
     ef4:	c4 04 00             	les    eax,FWORD PTR [eax+eax*1]
     ef7:	00 01                	add    BYTE PTR [ecx],al
     ef9:	4b                   	dec    ebx
     efa:	01 48 00             	add    DWORD PTR [eax+0x0],ecx
     efd:	00 00                	add    BYTE PTR [eax],al
     eff:	02 91 63 20 67 04    	add    dl,BYTE PTR [ecx+0x4672063]
     f05:	00 00                	add    BYTE PTR [eax],al
     f07:	01 4c 01 3a          	add    DWORD PTR [ecx+eax*1+0x3a],ecx
     f0b:	00 00                	add    BYTE PTR [eax],al
     f0d:	00 02                	add    BYTE PTR [edx],al
     f0f:	91                   	xchg   ecx,eax
     f10:	6c                   	ins    BYTE PTR es:[edi],dx
     f11:	20 cf                	and    bh,cl
     f13:	05 00 00 01 4d       	add    eax,0x4d010000
     f18:	01 3a                	add    DWORD PTR [edx],edi
     f1a:	00 00                	add    BYTE PTR [eax],al
     f1c:	00 02                	add    BYTE PTR [edx],al
     f1e:	91                   	xchg   ecx,eax
     f1f:	68 20 86 05 00       	push   0x58620
     f24:	00 01                	add    BYTE PTR [ecx],al
     f26:	4e                   	dec    esi
     f27:	01 88 06 00 00 02    	add    DWORD PTR [eax+0x2000006],ecx
     f2d:	91                   	xchg   ecx,eax
     f2e:	4f                   	dec    edi
     f2f:	21 f1                	and    ecx,esi
     f31:	04 00                	add    al,0x0
     f33:	00 01                	add    BYTE PTR [ecx],al
     f35:	5f                   	pop    edi
     f36:	01 b5 0f 10 03 21    	add    DWORD PTR [ebp+0x2103100f],esi
     f3c:	eb 05                	jmp    f43 <cmdClearScreen-0x30ff0bd>
     f3e:	00 00                	add    BYTE PTR [eax],al
     f40:	01 67 01             	add    DWORD PTR [edi+0x1],esp
     f43:	02 10                	add    dl,BYTE PTR [eax]
     f45:	10 03                	adc    BYTE PTR [ebx],al
     f47:	21 15 04 00 00 01    	and    DWORD PTR ds:0x1000004,edx
     f4d:	ca 01 44             	retf   0x4401
     f50:	12 10                	adc    dl,BYTE PTR [eax]
     f52:	03 15 b5 0f 10 03    	add    edx,DWORD PTR ds:0x3100fb5
     f58:	0f 03 00             	lsl    eax,WORD PTR [eax]
     f5b:	00 1a                	add    BYTE PTR [edx],bl
     f5d:	69 00 01 cf 01 3a    	imul   eax,DWORD PTR [eax],0x3a01cf01
     f63:	00 00                	add    BYTE PTR [eax],al
     f65:	00 02                	add    BYTE PTR [edx],al
     f67:	91                   	xchg   ecx,eax
     f68:	64 00 00             	add    BYTE PTR fs:[eax],al
     f6b:	16                   	push   ss
     f6c:	25 00 00 00 98       	and    eax,0x98000000
     f71:	06                   	push   es
     f72:	00 00                	add    BYTE PTR [eax],al
     f74:	17                   	pop    ss
     f75:	95                   	xchg   ebp,eax
     f76:	00 00                	add    BYTE PTR [eax],al
     f78:	00 13                	add    BYTE PTR [ebx],dl
     f7a:	00 16                	add    BYTE PTR [esi],dl
     f7c:	ff 01                	inc    DWORD PTR [ecx]
     f7e:	00 00                	add    BYTE PTR [eax],al
     f80:	a8 06                	test   al,0x6
     f82:	00 00                	add    BYTE PTR [eax],al
     f84:	17                   	pop    ss
     f85:	95                   	xchg   ebp,eax
     f86:	00 00                	add    BYTE PTR [eax],al
     f88:	00 09                	add    BYTE PTR [ecx],cl
     f8a:	00 14 3c             	add    BYTE PTR [esp+edi*1],dl
     f8d:	01 00                	add    DWORD PTR [eax],eax
     f8f:	00 04 36             	add    BYTE PTR [esi+esi*1],al
     f92:	98                   	cwde   
     f93:	06                   	push   es
     f94:	00 00                	add    BYTE PTR [eax],al
     f96:	05 03 80 22 10       	add    eax,0x10228003
     f9b:	03 22                	add    esp,DWORD PTR [edx]
     f9d:	66 03 00             	add    ax,WORD PTR [eax]
     fa0:	00 05 34 61 00 00    	add    BYTE PTR ds:0x6134,al
     fa6:	00 05 03 6c 27 10    	add    BYTE PTR ds:0x10276c03,al
     fac:	03 22                	add    esp,DWORD PTR [edx]
     fae:	0e                   	push   cs
     faf:	02 00                	add    al,BYTE PTR [eax]
     fb1:	00 05 35 61 00 00    	add    BYTE PTR ds:0x6135,al
     fb7:	00 05 03 70 27 10    	add    BYTE PTR ds:0x10277003,al
     fbd:	03 22                	add    esp,DWORD PTR [edx]
     fbf:	6a 00                	push   0x0
     fc1:	00 00                	add    BYTE PTR [eax],al
     fc3:	05 36 61 00 00       	add    eax,0x6136
     fc8:	00 05 03 68 27 10    	add    BYTE PTR ds:0x10276803,al
     fce:	03 22                	add    esp,DWORD PTR [edx]
     fd0:	9c                   	pushf  
     fd1:	03 00                	add    eax,DWORD PTR [eax]
     fd3:	00 05 37 7a 00 00    	add    BYTE PTR ds:0x7a37,al
     fd9:	00 05 03 90 27 10    	add    BYTE PTR ds:0x10279003,al
     fdf:	03 22                	add    esp,DWORD PTR [edx]
     fe1:	b7 02                	mov    bh,0x2
     fe3:	00 00                	add    BYTE PTR [eax],al
     fe5:	06                   	push   es
     fe6:	50                   	push   eax
     fe7:	ee                   	out    dx,al
     fe8:	03 00                	add    eax,DWORD PTR [eax]
     fea:	00 05 03 80 27 10    	add    BYTE PTR ds:0x10278003,al
     ff0:	03 22                	add    esp,DWORD PTR [edx]
     ff2:	be 03 00 00 03       	mov    esi,0x3000003
     ff7:	63 1d 01 00 00 05    	arpl   WORD PTR ds:0x5000001,bx
     ffd:	03 78 27             	add    edi,DWORD PTR [eax+0x27]
    1000:	10 03                	adc    BYTE PTR [ebx],al
    1002:	22 74 03 00          	and    dh,BYTE PTR [ebx+eax*1+0x0]
    1006:	00 03                	add    BYTE PTR [ebx],al
    1008:	e1 6c                	loope  1076 <cmdClearScreen-0x30fef8a>
    100a:	01 00                	add    DWORD PTR [eax],eax
    100c:	00 05 03 64 27 10    	add    BYTE PTR ds:0x10276403,al
    1012:	03 23                	add    esp,DWORD PTR [ebx]
    1014:	22 6d 01             	and    ch,BYTE PTR [ebp+0x1]
    1017:	00 00                	add    BYTE PTR [eax],al
    1019:	04 25                	add    al,0x25
    101b:	42                   	inc    edx
    101c:	07                   	pop    es
    101d:	00 00                	add    BYTE PTR [eax],al
    101f:	05 03 74 27 10       	add    eax,0x10277403
    1024:	03 05 04 30 07 00    	add    eax,DWORD PTR ds:0x73004
    102a:	00 24 53             	add    BYTE PTR [ebx+edx*2],ah
    102d:	07                   	pop    es
    102e:	00 00                	add    BYTE PTR [eax],al
    1030:	25 f9 01 00 00       	and    eax,0x1f9
    1035:	00 22                	add    BYTE PTR [edx],ah
    1037:	d4 01                	aam    0x1
    1039:	00 00                	add    BYTE PTR [eax],al
    103b:	04 26                	add    al,0x26
    103d:	64                   	fs
    103e:	07                   	pop    es
    103f:	00 00                	add    BYTE PTR [eax],al
    1041:	05 03 60 27 10       	add    eax,0x10276003
    1046:	03 05 04 48 07 00    	add    eax,DWORD PTR ds:0x74804
    104c:	00 16                	add    BYTE PTR [esi],dl
    104e:	25 00 00 00 7b       	and    eax,0x7b000000
    1053:	07                   	pop    es
    1054:	00 00                	add    BYTE PTR [eax],al
    1056:	26                   	es
    1057:	95                   	xchg   ebp,eax
    1058:	00 00                	add    BYTE PTR [eax],al
    105a:	00 ff                	add    bh,bh
    105c:	01 00                	add    DWORD PTR [eax],eax
    105e:	22 17                	and    dl,BYTE PTR [edi]
    1060:	02 00                	add    al,BYTE PTR [eax]
    1062:	00 04 2d 6a 07 00 00 	add    BYTE PTR [ebp*1+0x76a],al
    1069:	05 03 60 25 10       	add    eax,0x10256003
    106e:	03 22                	add    esp,DWORD PTR [edx]
    1070:	e6 03                	out    0x3,al
    1072:	00 00                	add    BYTE PTR [eax],al
    1074:	04 2e                	add    al,0x2e
    1076:	f9                   	stc    
    1077:	01 00                	add    DWORD PTR [eax],eax
    1079:	00 05 03 8c 27 10    	add    BYTE PTR ds:0x10278c03,al
    107f:	03 22                	add    esp,DWORD PTR [edx]
    1081:	00 00                	add    BYTE PTR [eax],al
    1083:	00 00                	add    BYTE PTR [eax],al
    1085:	04 2f                	add    al,0x2f
    1087:	ee                   	out    dx,al
    1088:	03 00                	add    eax,DWORD PTR [eax]
    108a:	00 05 03 4c 24 10    	add    BYTE PTR ds:0x10244c03,al
    1090:	03 16                	add    edx,DWORD PTR [esi]
    1092:	25 00 00 00 be       	and    eax,0xbe000000
    1097:	07                   	pop    es
    1098:	00 00                	add    BYTE PTR [eax],al
    109a:	17                   	pop    ss
    109b:	95                   	xchg   ebp,eax
    109c:	00 00                	add    BYTE PTR [eax],al
    109e:	00 05 00 22 29 02    	add    BYTE PTR ds:0x2292200,al
    10a4:	00 00                	add    BYTE PTR [eax],al
    10a6:	04 30                	add    al,0x30
    10a8:	ae                   	scas   al,BYTE PTR es:[edi]
    10a9:	07                   	pop    es
    10aa:	00 00                	add    BYTE PTR [eax],al
    10ac:	05 03 44 24 10       	add    eax,0x10244403
    10b1:	03 22                	add    esp,DWORD PTR [edx]
    10b3:	c3                   	ret    
    10b4:	02 00                	add    al,BYTE PTR [eax]
    10b6:	00 04 31             	add    BYTE PTR [ecx+esi*1],al
    10b9:	61                   	popa   
    10ba:	00 00                	add    BYTE PTR [eax],al
    10bc:	00 05 03 88 27 10    	add    BYTE PTR ds:0x10278803,al
    10c2:	03 22                	add    esp,DWORD PTR [edx]
    10c4:	58                   	pop    eax
    10c5:	02 00                	add    al,BYTE PTR [eax]
    10c7:	00 04 31             	add    BYTE PTR [ecx+esi*1],al
    10ca:	61                   	popa   
    10cb:	00 00                	add    BYTE PTR [eax],al
    10cd:	00 05 03 84 27 10    	add    BYTE PTR ds:0x10278403,al
    10d3:	03 22                	add    esp,DWORD PTR [edx]
    10d5:	31 01                	xor    DWORD PTR [ecx],eax
    10d7:	00 00                	add    BYTE PTR [eax],al
    10d9:	04 32                	add    al,0x32
    10db:	8c 00                	mov    WORD PTR [eax],es
    10dd:	00 00                	add    BYTE PTR [eax],al
    10df:	05 03 94 27 10       	add    eax,0x10279403
    10e4:	03 16                	add    edx,DWORD PTR [esi]
    10e6:	25 00 00 00 12       	and    eax,0x12000000
    10eb:	08 00                	or     BYTE PTR [eax],al
    10ed:	00 17                	add    BYTE PTR [edi],dl
    10ef:	95                   	xchg   ebp,eax
    10f0:	00 00                	add    BYTE PTR [eax],al
    10f2:	00 ff                	add    bh,bh
    10f4:	00 27                	add    BYTE PTR [edi],ah
    10f6:	63 77 64             	arpl   WORD PTR [edi+0x64],si
    10f9:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    10fc:	02 08                	add    cl,BYTE PTR [eax]
    10fe:	00 00                	add    BYTE PTR [eax],al
    1100:	05 03 60 24 10       	add    eax,0x10246003
    1105:	03 22                	add    esp,DWORD PTR [edx]
    1107:	ae                   	scas   al,BYTE PTR es:[edi]
    1108:	01 00                	add    DWORD PTR [eax],eax
    110a:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    110d:	8c 00                	mov    WORD PTR [eax],es
    110f:	00 00                	add    BYTE PTR [eax],al
    1111:	05 03 40 24 10       	add    eax,0x10244003
    1116:	03 16                	add    edx,DWORD PTR [esi]
    1118:	25 00 00 00 4b       	and    eax,0x4b000000
    111d:	08 00                	or     BYTE PTR [eax],al
    111f:	00 26                	add    BYTE PTR [esi],ah
    1121:	95                   	xchg   ebp,eax
    1122:	00 00                	add    BYTE PTR [eax],al
    1124:	00 f3                	add    bl,dh
    1126:	01 17                	add    DWORD PTR [edi],edx
    1128:	95                   	xchg   ebp,eax
    1129:	00 00                	add    BYTE PTR [eax],al
    112b:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
    112e:	22 4a 05             	and    cl,BYTE PTR [edx+0x5]
    1131:	00 00                	add    BYTE PTR [eax],al
    1133:	01 10                	add    DWORD PTR [eax],edx
    1135:	34 08                	xor    al,0x8
    1137:	00 00                	add    BYTE PTR [eax],al
    1139:	05 03 a0 27 10       	add    eax,0x1027a003
    113e:	03 22                	add    esp,DWORD PTR [edx]
    1140:	59                   	pop    ecx
    1141:	05 00 00 01 11       	add    eax,0x11010000
    1146:	3a 00                	cmp    al,BYTE PTR [eax]
    1148:	00 00                	add    BYTE PTR [eax],al
    114a:	05 03 98 27 10       	add    eax,0x10279803
    114f:	03 22                	add    esp,DWORD PTR [edx]
    1151:	39 04 00             	cmp    DWORD PTR [eax+eax*1],eax
    1154:	00 01                	add    BYTE PTR [ecx],al
    1156:	12 3a                	adc    bh,BYTE PTR [edx]
    1158:	00 00                	add    BYTE PTR [eax],al
    115a:	00 05 03 9c 27 10    	add    BYTE PTR ds:0x10279c03,al
    1160:	03 22                	add    esp,DWORD PTR [edx]
    1162:	91                   	xchg   ecx,eax
    1163:	04 00                	add    al,0x0
    1165:	00 01                	add    BYTE PTR [ecx],al
    1167:	13 02                	adc    eax,DWORD PTR [edx]
    1169:	08 00                	or     BYTE PTR [eax],al
    116b:	00 05 03 a0 21 11    	add    BYTE PTR ds:0x1121a003,al
    1171:	03 00                	add    eax,DWORD PTR [eax]

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
  64:	09 0f                	or     DWORD PTR [edi],ecx
  66:	00 0b                	add    BYTE PTR [ebx],cl
  68:	0b 00                	or     eax,DWORD PTR [eax]
  6a:	00 0a                	add    BYTE PTR [edx],cl
  6c:	13 01                	adc    eax,DWORD PTR [ecx]
  6e:	0b 0b                	or     ecx,DWORD PTR [ebx]
  70:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  72:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  74:	01 13                	add    DWORD PTR [ebx],edx
  76:	00 00                	add    BYTE PTR [eax],al
  78:	0b 0d 00 03 0e 3a    	or     ecx,DWORD PTR ds:0x3a0e0300
  7e:	0b 3b                	or     edi,DWORD PTR [ebx]
  80:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  83:	0b 0b                	or     ecx,DWORD PTR [ebx]
  85:	0d 0b 0c 0b 38       	or     eax,0x380b0c0b
  8a:	0b 00                	or     eax,DWORD PTR [eax]
  8c:	00 0c 17             	add    BYTE PTR [edi+edx*1],cl
  8f:	01 0b                	add    DWORD PTR [ebx],ecx
  91:	0b 3a                	or     edi,DWORD PTR [edx]
  93:	0b 3b                	or     edi,DWORD PTR [ebx]
  95:	0b 01                	or     eax,DWORD PTR [ecx]
  97:	13 00                	adc    eax,DWORD PTR [eax]
  99:	00 0d 0d 00 49 13    	add    BYTE PTR ds:0x1349000d,cl
  9f:	00 00                	add    BYTE PTR [eax],al
  a1:	0e                   	push   cs
  a2:	0d 00 03 08 3a       	or     eax,0x3a080300
  a7:	0b 3b                	or     edi,DWORD PTR [ebx]
  a9:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  ac:	00 00                	add    BYTE PTR [eax],al
  ae:	0f 04                	(bad)  
  b0:	01 03                	add    DWORD PTR [ebx],eax
  b2:	0e                   	push   cs
  b3:	0b 0b                	or     ecx,DWORD PTR [ebx]
  b5:	49                   	dec    ecx
  b6:	13 3a                	adc    edi,DWORD PTR [edx]
  b8:	0b 3b                	or     edi,DWORD PTR [ebx]
  ba:	0b 01                	or     eax,DWORD PTR [ecx]
  bc:	13 00                	adc    eax,DWORD PTR [eax]
  be:	00 10                	add    BYTE PTR [eax],dl
  c0:	28 00                	sub    BYTE PTR [eax],al
  c2:	03 0e                	add    ecx,DWORD PTR [esi]
  c4:	1c 0b                	sbb    al,0xb
  c6:	00 00                	add    BYTE PTR [eax],al
  c8:	11 2e                	adc    DWORD PTR [esi],ebp
  ca:	00 3f                	add    BYTE PTR [edi],bh
  cc:	19 03                	sbb    DWORD PTR [ebx],eax
  ce:	0e                   	push   cs
  cf:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  d1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  d3:	11 01                	adc    DWORD PTR [ecx],eax
  d5:	12 06                	adc    al,BYTE PTR [esi]
  d7:	40                   	inc    eax
  d8:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
  de:	12 2e                	adc    ch,BYTE PTR [esi]
  e0:	01 3f                	add    DWORD PTR [edi],edi
  e2:	19 03                	sbb    DWORD PTR [ebx],eax
  e4:	0e                   	push   cs
  e5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  e7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  e9:	11 01                	adc    DWORD PTR [ecx],eax
  eb:	12 06                	adc    al,BYTE PTR [esi]
  ed:	40                   	inc    eax
  ee:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  f4:	00 00                	add    BYTE PTR [eax],al
  f6:	13 0b                	adc    ecx,DWORD PTR [ebx]
  f8:	01 11                	add    DWORD PTR [ecx],edx
  fa:	01 12                	add    DWORD PTR [edx],edx
  fc:	06                   	push   es
  fd:	00 00                	add    BYTE PTR [eax],al
  ff:	14 34                	adc    al,0x34
 101:	00 03                	add    BYTE PTR [ebx],al
 103:	08 3a                	or     BYTE PTR [edx],bh
 105:	0b 3b                	or     edi,DWORD PTR [ebx]
 107:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 10a:	02 18                	add    bl,BYTE PTR [eax]
 10c:	00 00                	add    BYTE PTR [eax],al
 10e:	15 2e 01 3f 19       	adc    eax,0x193f012e
 113:	03 0e                	add    ecx,DWORD PTR [esi]
 115:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 117:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 119:	27                   	daa    
 11a:	19 11                	sbb    DWORD PTR [ecx],edx
 11c:	01 12                	add    DWORD PTR [edx],edx
 11e:	06                   	push   es
 11f:	40                   	inc    eax
 120:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 126:	00 00                	add    BYTE PTR [eax],al
 128:	16                   	push   ss
 129:	05 00 03 0e 3a       	add    eax,0x3a0e0300
 12e:	0b 3b                	or     edi,DWORD PTR [ebx]
 130:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 133:	02 18                	add    bl,BYTE PTR [eax]
 135:	00 00                	add    BYTE PTR [eax],al
 137:	17                   	pop    ss
 138:	34 00                	xor    al,0x0
 13a:	03 0e                	add    ecx,DWORD PTR [esi]
 13c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 13e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 140:	49                   	dec    ecx
 141:	13 02                	adc    eax,DWORD PTR [edx]
 143:	18 00                	sbb    BYTE PTR [eax],al
 145:	00 18                	add    BYTE PTR [eax],bl
 147:	01 01                	add    DWORD PTR [ecx],eax
 149:	49                   	dec    ecx
 14a:	13 01                	adc    eax,DWORD PTR [ecx]
 14c:	13 00                	adc    eax,DWORD PTR [eax]
 14e:	00 19                	add    BYTE PTR [ecx],bl
 150:	21 00                	and    DWORD PTR [eax],eax
 152:	49                   	dec    ecx
 153:	13 2f                	adc    ebp,DWORD PTR [edi]
 155:	0b 00                	or     eax,DWORD PTR [eax]
 157:	00 1a                	add    BYTE PTR [edx],bl
 159:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 15c:	19 03                	sbb    DWORD PTR [ebx],eax
 15e:	0e                   	push   cs
 15f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 161:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 163:	27                   	daa    
 164:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 167:	11 01                	adc    DWORD PTR [ecx],eax
 169:	12 06                	adc    al,BYTE PTR [esi]
 16b:	40                   	inc    eax
 16c:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 172:	00 00                	add    BYTE PTR [eax],al
 174:	1b 34 00             	sbb    esi,DWORD PTR [eax+eax*1]
 177:	03 08                	add    ecx,DWORD PTR [eax]
 179:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 17b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 17d:	49                   	dec    ecx
 17e:	13 00                	adc    eax,DWORD PTR [eax]
 180:	00 1c 34             	add    BYTE PTR [esp+esi*1],bl
 183:	00 03                	add    BYTE PTR [ebx],al
 185:	0e                   	push   cs
 186:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 188:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 18a:	49                   	dec    ecx
 18b:	13 00                	adc    eax,DWORD PTR [eax]
 18d:	00 1d 0b 01 11 01    	add    BYTE PTR ds:0x111010b,bl
 193:	12 06                	adc    al,BYTE PTR [esi]
 195:	01 13                	add    DWORD PTR [ebx],edx
 197:	00 00                	add    BYTE PTR [eax],al
 199:	1e                   	push   ds
 19a:	0b 01                	or     eax,DWORD PTR [ecx]
 19c:	55                   	push   ebp
 19d:	17                   	pop    ss
 19e:	00 00                	add    BYTE PTR [eax],al
 1a0:	1f                   	pop    ds
 1a1:	21 00                	and    DWORD PTR [eax],eax
 1a3:	49                   	dec    ecx
 1a4:	13 2f                	adc    ebp,DWORD PTR [edi]
 1a6:	18 00                	sbb    BYTE PTR [eax],al
 1a8:	00 20                	add    BYTE PTR [eax],ah
 1aa:	34 00                	xor    al,0x0
 1ac:	03 0e                	add    ecx,DWORD PTR [esi]
 1ae:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1b0:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1b2:	49                   	dec    ecx
 1b3:	13 3f                	adc    edi,DWORD PTR [edi]
 1b5:	19 02                	sbb    DWORD PTR [edx],eax
 1b7:	18 00                	sbb    BYTE PTR [eax],al
 1b9:	00 21                	add    BYTE PTR [ecx],ah
 1bb:	15 00 27 19 00       	adc    eax,0x192700
 1c0:	00 22                	add    BYTE PTR [edx],ah
 1c2:	15 01 27 19 01       	adc    eax,0x1192701
 1c7:	13 00                	adc    eax,DWORD PTR [eax]
 1c9:	00 23                	add    BYTE PTR [ebx],ah
 1cb:	05 00 49 13 00       	add    eax,0x134900
 1d0:	00 24 21             	add    BYTE PTR [ecx+eiz*1],ah
 1d3:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 1d6:	2f                   	das    
 1d7:	05 00 00 25 34       	add    eax,0x34250000
 1dc:	00 03                	add    BYTE PTR [ebx],al
 1de:	08 3a                	or     BYTE PTR [edx],bh
 1e0:	0b 3b                	or     edi,DWORD PTR [ebx]
 1e2:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 1e5:	3f                   	aas    
 1e6:	19 02                	sbb    DWORD PTR [edx],eax
 1e8:	18 00                	sbb    BYTE PTR [eax],al
 1ea:	00 00                	add    BYTE PTR [eax],al
 1ec:	01 11                	add    DWORD PTR [ecx],edx
 1ee:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 1f4:	0e                   	push   cs
 1f5:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 1f7:	11 01                	adc    DWORD PTR [ecx],eax
 1f9:	12 06                	adc    al,BYTE PTR [esi]
 1fb:	10 17                	adc    BYTE PTR [edi],dl
 1fd:	00 00                	add    BYTE PTR [eax],al
 1ff:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 202:	0b 0b                	or     ecx,DWORD PTR [ebx]
 204:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 207:	0e                   	push   cs
 208:	00 00                	add    BYTE PTR [eax],al
 20a:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 20d:	0b 0b                	or     ecx,DWORD PTR [ebx]
 20f:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 212:	08 00                	or     BYTE PTR [eax],al
 214:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 217:	00 03                	add    BYTE PTR [ebx],al
 219:	0e                   	push   cs
 21a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 21c:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 21e:	49                   	dec    ecx
 21f:	13 00                	adc    eax,DWORD PTR [eax]
 221:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 227:	49                   	dec    ecx
 228:	13 00                	adc    eax,DWORD PTR [eax]
 22a:	00 06                	add    BYTE PTR [esi],al
 22c:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 230:	00 00                	add    BYTE PTR [eax],al
 232:	07                   	pop    es
 233:	0f 00 0b             	str    WORD PTR [ebx]
 236:	0b 00                	or     eax,DWORD PTR [eax]
 238:	00 08                	add    BYTE PTR [eax],cl
 23a:	13 01                	adc    eax,DWORD PTR [ecx]
 23c:	0b 0b                	or     ecx,DWORD PTR [ebx]
 23e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 240:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 242:	01 13                	add    DWORD PTR [ebx],edx
 244:	00 00                	add    BYTE PTR [eax],al
 246:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
 24c:	0b 3b                	or     edi,DWORD PTR [ebx]
 24e:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 251:	0b 0b                	or     ecx,DWORD PTR [ebx]
 253:	0d 0b 0c 0b 38       	or     eax,0x380b0c0b
 258:	0b 00                	or     eax,DWORD PTR [eax]
 25a:	00 0a                	add    BYTE PTR [edx],cl
 25c:	17                   	pop    ss
 25d:	01 0b                	add    DWORD PTR [ebx],ecx
 25f:	0b 3a                	or     edi,DWORD PTR [edx]
 261:	0b 3b                	or     edi,DWORD PTR [ebx]
 263:	0b 01                	or     eax,DWORD PTR [ecx]
 265:	13 00                	adc    eax,DWORD PTR [eax]
 267:	00 0b                	add    BYTE PTR [ebx],cl
 269:	0d 00 49 13 00       	or     eax,0x134900
 26e:	00 0c 0d 00 03 08 3a 	add    BYTE PTR [ecx*1+0x3a080300],cl
 275:	0b 3b                	or     edi,DWORD PTR [ebx]
 277:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 27a:	00 00                	add    BYTE PTR [eax],al
 27c:	0d 04 01 03 0e       	or     eax,0xe030104
 281:	0b 0b                	or     ecx,DWORD PTR [ebx]
 283:	49                   	dec    ecx
 284:	13 3a                	adc    edi,DWORD PTR [edx]
 286:	0b 3b                	or     edi,DWORD PTR [ebx]
 288:	0b 01                	or     eax,DWORD PTR [ecx]
 28a:	13 00                	adc    eax,DWORD PTR [eax]
 28c:	00 0e                	add    BYTE PTR [esi],cl
 28e:	28 00                	sub    BYTE PTR [eax],al
 290:	03 0e                	add    ecx,DWORD PTR [esi]
 292:	1c 0b                	sbb    al,0xb
 294:	00 00                	add    BYTE PTR [eax],al
 296:	0f 0d 00             	prefetch BYTE PTR [eax]
 299:	03 0e                	add    ecx,DWORD PTR [esi]
 29b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 29d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 29f:	49                   	dec    ecx
 2a0:	13 38                	adc    edi,DWORD PTR [eax]
 2a2:	0b 00                	or     eax,DWORD PTR [eax]
 2a4:	00 10                	add    BYTE PTR [eax],dl
 2a6:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 2a9:	19 03                	sbb    DWORD PTR [ebx],eax
 2ab:	0e                   	push   cs
 2ac:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2ae:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2b0:	27                   	daa    
 2b1:	19 11                	sbb    DWORD PTR [ecx],edx
 2b3:	01 12                	add    DWORD PTR [edx],edx
 2b5:	06                   	push   es
 2b6:	40                   	inc    eax
 2b7:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 2bd:	00 00                	add    BYTE PTR [eax],al
 2bf:	11 05 00 03 0e 3a    	adc    DWORD PTR ds:0x3a0e0300,eax
 2c5:	0b 3b                	or     edi,DWORD PTR [ebx]
 2c7:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 2ca:	02 18                	add    bl,BYTE PTR [eax]
 2cc:	00 00                	add    BYTE PTR [eax],al
 2ce:	12 34 00             	adc    dh,BYTE PTR [eax+eax*1]
 2d1:	03 08                	add    ecx,DWORD PTR [eax]
 2d3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2d5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2d7:	49                   	dec    ecx
 2d8:	13 02                	adc    eax,DWORD PTR [edx]
 2da:	18 00                	sbb    BYTE PTR [eax],al
 2dc:	00 13                	add    BYTE PTR [ebx],dl
 2de:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 2e1:	19 03                	sbb    DWORD PTR [ebx],eax
 2e3:	0e                   	push   cs
 2e4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2e6:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2e8:	27                   	daa    
 2e9:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 2ec:	11 01                	adc    DWORD PTR [ecx],eax
 2ee:	12 06                	adc    al,BYTE PTR [esi]
 2f0:	40                   	inc    eax
 2f1:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 2f7:	00 00                	add    BYTE PTR [eax],al
 2f9:	14 34                	adc    al,0x34
 2fb:	00 03                	add    BYTE PTR [ebx],al
 2fd:	0e                   	push   cs
 2fe:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 300:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 302:	49                   	dec    ecx
 303:	13 02                	adc    eax,DWORD PTR [edx]
 305:	18 00                	sbb    BYTE PTR [eax],al
 307:	00 15 0b 01 11 01    	add    BYTE PTR ds:0x111010b,dl
 30d:	12 06                	adc    al,BYTE PTR [esi]
 30f:	00 00                	add    BYTE PTR [eax],al
 311:	16                   	push   ss
 312:	01 01                	add    DWORD PTR [ecx],eax
 314:	49                   	dec    ecx
 315:	13 01                	adc    eax,DWORD PTR [ecx]
 317:	13 00                	adc    eax,DWORD PTR [eax]
 319:	00 17                	add    BYTE PTR [edi],dl
 31b:	21 00                	and    DWORD PTR [eax],eax
 31d:	49                   	dec    ecx
 31e:	13 2f                	adc    ebp,DWORD PTR [edi]
 320:	0b 00                	or     eax,DWORD PTR [eax]
 322:	00 18                	add    BYTE PTR [eax],bl
 324:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 327:	19 03                	sbb    DWORD PTR [ebx],eax
 329:	0e                   	push   cs
 32a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 32c:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 332:	11 01                	adc    DWORD PTR [ecx],eax
 334:	12 06                	adc    al,BYTE PTR [esi]
 336:	40                   	inc    eax
 337:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 33d:	00 00                	add    BYTE PTR [eax],al
 33f:	19 05 00 03 0e 3a    	sbb    DWORD PTR ds:0x3a0e0300,eax
 345:	0b 3b                	or     edi,DWORD PTR [ebx]
 347:	05 49 13 02 18       	add    eax,0x18021349
 34c:	00 00                	add    BYTE PTR [eax],al
 34e:	1a 34 00             	sbb    dh,BYTE PTR [eax+eax*1]
 351:	03 08                	add    ecx,DWORD PTR [eax]
 353:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 355:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 35b:	00 00                	add    BYTE PTR [eax],al
 35d:	1b 2e                	sbb    ebp,DWORD PTR [esi]
 35f:	01 3f                	add    DWORD PTR [edi],edi
 361:	19 03                	sbb    DWORD PTR [ebx],eax
 363:	0e                   	push   cs
 364:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 366:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 36c:	12 06                	adc    al,BYTE PTR [esi]
 36e:	40                   	inc    eax
 36f:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 375:	00 00                	add    BYTE PTR [eax],al
 377:	1c 2e                	sbb    al,0x2e
 379:	00 3f                	add    BYTE PTR [edi],bh
 37b:	19 03                	sbb    DWORD PTR [ebx],eax
 37d:	0e                   	push   cs
 37e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 380:	3b 05 11 01 12 06    	cmp    eax,DWORD PTR ds:0x6120111
 386:	40                   	inc    eax
 387:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 38d:	1d 2e 01 3f 19       	sbb    eax,0x193f012e
 392:	03 0e                	add    ecx,DWORD PTR [esi]
 394:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 396:	3b 05 49 13 3c 19    	cmp    eax,DWORD PTR ds:0x193c1349
 39c:	00 00                	add    BYTE PTR [eax],al
 39e:	1e                   	push   ds
 39f:	18 00                	sbb    BYTE PTR [eax],al
 3a1:	00 00                	add    BYTE PTR [eax],al
 3a3:	1f                   	pop    ds
 3a4:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 3a7:	19 03                	sbb    DWORD PTR [ebx],eax
 3a9:	0e                   	push   cs
 3aa:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3ac:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 3b2:	11 01                	adc    DWORD PTR [ecx],eax
 3b4:	12 06                	adc    al,BYTE PTR [esi]
 3b6:	40                   	inc    eax
 3b7:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 3bd:	00 00                	add    BYTE PTR [eax],al
 3bf:	20 34 00             	and    BYTE PTR [eax+eax*1],dh
 3c2:	03 0e                	add    ecx,DWORD PTR [esi]
 3c4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3c6:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 3cc:	00 00                	add    BYTE PTR [eax],al
 3ce:	21 0a                	and    DWORD PTR [edx],ecx
 3d0:	00 03                	add    BYTE PTR [ebx],al
 3d2:	0e                   	push   cs
 3d3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3d5:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 3db:	22 34 00             	and    dh,BYTE PTR [eax+eax*1]
 3de:	03 0e                	add    ecx,DWORD PTR [esi]
 3e0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3e2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 3e4:	49                   	dec    ecx
 3e5:	13 3f                	adc    edi,DWORD PTR [edi]
 3e7:	19 02                	sbb    DWORD PTR [edx],eax
 3e9:	18 00                	sbb    BYTE PTR [eax],al
 3eb:	00 23                	add    BYTE PTR [ebx],ah
 3ed:	15 00 27 19 00       	adc    eax,0x192700
 3f2:	00 24 15 01 27 19 01 	add    BYTE PTR [edx*1+0x1192701],ah
 3f9:	13 00                	adc    eax,DWORD PTR [eax]
 3fb:	00 25 05 00 49 13    	add    BYTE PTR ds:0x13490005,ah
 401:	00 00                	add    BYTE PTR [eax],al
 403:	26 21 00             	and    DWORD PTR es:[eax],eax
 406:	49                   	dec    ecx
 407:	13 2f                	adc    ebp,DWORD PTR [edi]
 409:	05 00 00 27 34       	add    eax,0x34270000
 40e:	00 03                	add    BYTE PTR [ebx],al
 410:	08 3a                	or     BYTE PTR [edx],bh
 412:	0b 3b                	or     edi,DWORD PTR [ebx]
 414:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 417:	3f                   	aas    
 418:	19 02                	sbb    DWORD PTR [edx],eax
 41a:	18 00                	sbb    BYTE PTR [eax],al
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
  14:	d7                   	xlat   BYTE PTR ds:[ebx]
  15:	07                   	pop    es
	...
  1e:	00 00                	add    BYTE PTR [eax],al
  20:	1c 00                	sbb    al,0x0
  22:	00 00                	add    BYTE PTR [eax],al
  24:	02 00                	add    al,BYTE PTR [eax]
  26:	e3 08                	jecxz  30 <cmdClearScreen-0x30fffd0>
  28:	00 00                	add    BYTE PTR [eax],al
  2a:	04 00                	add    al,0x0
  2c:	00 00                	add    BYTE PTR [eax],al
  2e:	00 00                	add    BYTE PTR [eax],al
  30:	d8 07                	fadd   DWORD PTR [edi]
  32:	10 03                	adc    BYTE PTR [ebx],al
  34:	16                   	push   ss
  35:	0b 00                	or     eax,DWORD PTR [eax]
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	cf                   	iret   
   1:	04 00                	add    al,0x0
   3:	00 33                	add    BYTE PTR [ebx],dh
   5:	05 00 00 35 05       	add    eax,0x5350000
   a:	00 00                	add    BYTE PTR [eax],al
   c:	36                   	ss
   d:	05 00 00 00 00       	add    eax,0x0
  12:	00 00                	add    BYTE PTR [eax],al
  14:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	4f                   	dec    edi
   1:	02 00                	add    al,BYTE PTR [eax]
   3:	00 02                	add    BYTE PTR [edx],al
   5:	00 29                	add    BYTE PTR [ecx],ch
   7:	01 00                	add    DWORD PTR [eax],eax
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
  71:	00 2e                	add    BYTE PTR [esi],ch
  73:	2e                   	cs
  74:	2f                   	das    
  75:	2e                   	cs
  76:	2e                   	cs
  77:	2f                   	das    
  78:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
  7c:	6a 2f                	push   0x2f
  7e:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
  81:	69 73 4f 53 2f 69 6e 	imul   esi,DWORD PTR [ebx+0x4f],0x6e692f53
  88:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  8c:	65                   	gs
  8d:	2f                   	das    
  8e:	69 33 38 36 00 69    	imul   esi,DWORD PTR [ebx],0x69003638
  94:	6e                   	outs   dx,BYTE PTR ds:[esi]
  95:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  99:	65 00 69 6e          	add    BYTE PTR gs:[ecx+0x6e],ch
  9d:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  a1:	65                   	gs
  a2:	2f                   	das    
  a3:	2e                   	cs
  a4:	2e                   	cs
  a5:	2f                   	das    
  a6:	2e                   	cs
  a7:	2e                   	cs
  a8:	2f                   	das    
  a9:	2e                   	cs
  aa:	2e                   	cs
  ab:	2f                   	das    
  ac:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
  b0:	6a 2f                	push   0x2f
  b2:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
  b5:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
  bc:	6e                   	outs   dx,BYTE PTR ds:[esi]
  bd:	65                   	gs
  be:	6c                   	ins    BYTE PTR es:[edi],dx
  bf:	2f                   	das    
  c0:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  c7:	00 00                	add    BYTE PTR [eax],al
  c9:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  cc:	6d                   	ins    DWORD PTR es:[edi],dx
  cd:	61                   	popa   
  ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
  cf:	64                   	fs
  d0:	73 2e                	jae    100 <cmdClearScreen-0x30fff00>
  d2:	63 00                	arpl   WORD PTR [eax],ax
  d4:	01 00                	add    DWORD PTR [eax],eax
  d6:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  d9:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
  e0:	63 
  e1:	2e                   	cs
  e2:	68 00 02 00 00       	push   0x200
  e7:	74 69                	je     152 <cmdClearScreen-0x30ffeae>
  e9:	6d                   	ins    DWORD PTR es:[edi],dx
  ea:	65                   	gs
  eb:	2e                   	cs
  ec:	68 00 03 00 00       	push   0x300
  f1:	63 70 75             	arpl   WORD PTR [eax+0x75],si
  f4:	2e                   	cs
  f5:	68 00 04 00 00       	push   0x400
  fa:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  fe:	6c                   	ins    BYTE PTR es:[edi],dx
  ff:	6c                   	ins    BYTE PTR es:[edi],dx
 100:	2e                   	cs
 101:	68 00 05 00 00       	push   0x500
 106:	6d                   	ins    DWORD PTR es:[edi],dx
 107:	61                   	popa   
 108:	6c                   	ins    BYTE PTR es:[edi],dx
 109:	6c                   	ins    BYTE PTR es:[edi],dx
 10a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 10b:	63 2e                	arpl   WORD PTR [esi],bp
 10d:	68 00 03 00 00       	push   0x300
 112:	6c                   	ins    BYTE PTR es:[edi],dx
 113:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 11a:	4f                   	dec    edi
 11b:	53                   	push   ebx
 11c:	2e                   	cs
 11d:	68 00 03 00 00       	push   0x300
 122:	74 68                	je     18c <cmdClearScreen-0x30ffe74>
 124:	65                   	gs
 125:	73 69                	jae    190 <cmdClearScreen-0x30ffe70>
 127:	67 6e                	outs   dx,BYTE PTR ds:[si]
 129:	61                   	popa   
 12a:	6c                   	ins    BYTE PTR es:[edi],dx
 12b:	73 2e                	jae    15b <cmdClearScreen-0x30ffea5>
 12d:	68 00 06 00 00       	push   0x600
 132:	00 00                	add    BYTE PTR [eax],al
 134:	05 02 00 00 10       	add    eax,0x10000002
 139:	03 03                	add    eax,DWORD PTR [ebx]
 13b:	0a 01                	or     al,BYTE PTR [ecx]
 13d:	67 f3 3f             	addr16 repz aas 
 140:	67 92                	addr16 xchg edx,eax
 142:	08 30                	or     BYTE PTR [eax],dh
 144:	00 02                	add    BYTE PTR [edx],al
 146:	04 02                	add    al,0x2
 148:	08 e0                	or     al,ah
 14a:	00 02                	add    BYTE PTR [edx],al
 14c:	04 01                	add    al,0x1
 14e:	06                   	push   es
 14f:	4a                   	dec    edx
 150:	06                   	push   es
 151:	6e                   	outs   dx,BYTE PTR ds:[esi]
 152:	3f                   	aas    
 153:	94                   	xchg   esp,eax
 154:	02 22                	add    ah,BYTE PTR [edx]
 156:	14 d7                	adc    al,0xd7
 158:	08 91 68 f3 5a f3    	or     BYTE PTR [ecx-0xca50c98],dl
 15e:	08 f3                	or     bl,dh
 160:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 163:	21 08                	and    DWORD PTR [eax],ecx
 165:	83 ad 08 f3 d7 d7 08 	sub    DWORD PTR [ebp-0x28280cf8],0x8
 16c:	13 d7                	adc    edx,edi
 16e:	f5                   	cmc    
 16f:	59                   	pop    ecx
 170:	31 bb 08 68 68 af    	xor    DWORD PTR [ebx-0x509797f8],edi
 176:	08 3e                	or     BYTE PTR [esi],bh
 178:	08 67 08             	or     BYTE PTR [edi+0x8],ah
 17b:	5c                   	pop    esp
 17c:	08 30                	or     BYTE PTR [eax],dh
 17e:	3f                   	aas    
 17f:	08 21                	or     BYTE PTR [ecx],ah
 181:	4b                   	dec    ebx
 182:	76 77                	jbe    1fb <cmdClearScreen-0x30ffe05>
 184:	08 bb 75 78 67 a0    	or     BYTE PTR [ebx-0x5f98878b],bh
 18a:	a1 08 76 a0 f3       	mov    eax,ds:0xf3a07608
 18f:	a1 08 e5 4d 84       	mov    eax,ds:0x844de508
 194:	84 69 08             	test   BYTE PTR [ecx+0x8],ch
 197:	ca 68 08             	retf   0x868
 19a:	3f                   	aas    
 19b:	75 08                	jne    1a5 <cmdClearScreen-0x30ffe5b>
 19d:	30 67 08             	xor    BYTE PTR [edi+0x8],ah
 1a0:	77 ae                	ja     150 <cmdClearScreen-0x30ffeb0>
 1a2:	08 3d bb 08 5a 92    	or     BYTE PTR ds:0x925a08bb,bh
 1a8:	83 08 69             	or     DWORD PTR [eax],0x69
 1ab:	08 91 00 02 04 01    	or     BYTE PTR [ecx+0x1040200],dl
 1b1:	08 69 00             	or     BYTE PTR [ecx+0x0],ch
 1b4:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 1b7:	d7                   	xlat   BYTE PTR ds:[ebx]
 1b8:	d8 31                	fdiv   DWORD PTR [ecx]
 1ba:	67 f3 3f             	addr16 repz aas 
 1bd:	67 76 75             	addr16 jbe 235 <cmdClearScreen-0x30ffdcb>
 1c0:	67 08 4c 08          	or     BYTE PTR [si+0x8],cl
 1c4:	3e                   	ds
 1c5:	67 67 67 68 4c 92 08 	addr32 addr32 addr16 push 0x9108924c
 1cc:	91 
 1cd:	f3 ae                	repz scas al,BYTE PTR es:[edi]
 1cf:	08 21                	or     BYTE PTR [ecx],ah
 1d1:	67 00 02             	add    BYTE PTR [bp+si],al
 1d4:	04 02                	add    al,0x2
 1d6:	03 78 2e             	add    edi,DWORD PTR [eax+0x2e]
 1d9:	00 02                	add    BYTE PTR [edx],al
 1db:	04 01                	add    al,0x1
 1dd:	06                   	push   es
 1de:	4a                   	dec    edx
 1df:	06                   	push   es
 1e0:	03 0c 82             	add    ecx,DWORD PTR [edx+eax*4]
 1e3:	2a 00                	sub    al,BYTE PTR [eax]
 1e5:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 1e8:	24 3f                	and    al,0x3f
 1ea:	67 f3 3f             	addr16 repz aas 
 1ed:	93                   	xchg   ebx,eax
 1ee:	08 ca                	or     dl,cl
 1f0:	08 bd 9f 75 3f 69    	or     BYTE PTR [ebp+0x693f759f],bh
 1f6:	08 5f 08             	or     BYTE PTR [edi+0x8],bl
 1f9:	2f                   	das    
 1fa:	bb 68 02 22 13       	mov    ebx,0x13220268
 1ff:	02 2e                	add    ch,BYTE PTR [esi]
 201:	16                   	push   ss
 202:	00 02                	add    BYTE PTR [edx],al
 204:	04 02                	add    al,0x2
 206:	03 78 02             	add    edi,DWORD PTR [eax+0x2]
 209:	2c 01                	sub    al,0x1
 20b:	00 02                	add    BYTE PTR [edx],al
 20d:	04 01                	add    al,0x1
 20f:	06                   	push   es
 210:	4a                   	dec    edx
 211:	06                   	push   es
 212:	03 0b                	add    ecx,DWORD PTR [ebx]
 214:	9e                   	sahf   
 215:	3f                   	aas    
 216:	67 08 2f             	or     BYTE PTR [bx],ch
 219:	02 24 13             	add    ah,BYTE PTR [ebx+edx*1]
 21c:	d7                   	xlat   BYTE PTR ds:[ebx]
 21d:	3f                   	aas    
 21e:	9e                   	sahf   
 21f:	4c                   	dec    esp
 220:	08 bd 75 02 38 14    	or     BYTE PTR [ebp+0x14380275],bh
 226:	00 02                	add    BYTE PTR [edx],al
 228:	04 03                	add    al,0x3
 22a:	91                   	xchg   ecx,eax
 22b:	00 02                	add    BYTE PTR [edx],al
 22d:	04 03                	add    al,0x3
 22f:	b9 00 02 04 01       	mov    ecx,0x1040200
 234:	06                   	push   es
 235:	4a                   	dec    edx
 236:	06                   	push   es
 237:	85 91 d7 00 02 04    	test   DWORD PTR [ecx+0x40200d7],edx
 23d:	02 f0                	add    dh,al
 23f:	00 02                	add    BYTE PTR [edx],al
 241:	04 01                	add    al,0x1
 243:	06                   	push   es
 244:	4a                   	dec    edx
 245:	06                   	push   es
 246:	86 ae 08 4b 31 02    	xchg   BYTE PTR [esi+0x2314b08],ch
 24c:	2c 13                	sub    al,0x13
 24e:	02 05 00 01 01 f5    	add    al,BYTE PTR ds:0xf5010100
 254:	02 00                	add    al,BYTE PTR [eax]
 256:	00 02                	add    BYTE PTR [edx],al
 258:	00 1d 01 00 00 01    	add    BYTE PTR ds:0x1000001,bl
 25e:	01 fb                	add    ebx,edi
 260:	0e                   	push   cs
 261:	0d 00 01 01 01       	or     eax,0x1010100
 266:	01 00                	add    DWORD PTR [eax],eax
 268:	00 00                	add    BYTE PTR [eax],al
 26a:	01 00                	add    DWORD PTR [eax],eax
 26c:	00 01                	add    BYTE PTR [ecx],al
 26e:	73 72                	jae    2e2 <cmdClearScreen-0x30ffd1e>
 270:	63 00                	arpl   WORD PTR [eax],ax
 272:	2f                   	das    
 273:	68 6f 6d 65 2f       	push   0x2f656d6f
 278:	79 6f                	jns    2e9 <cmdClearScreen-0x30ffd17>
 27a:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
 281:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 284:	73 73                	jae    2f9 <cmdClearScreen-0x30ffd07>
 286:	2f                   	das    
 287:	6c                   	ins    BYTE PTR es:[edi],dx
 288:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
 28f:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
 295:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
 29b:	78 2d                	js     2ca <cmdClearScreen-0x30ffd36>
 29d:	67 6e                	outs   dx,BYTE PTR ds:[si]
 29f:	75 2f                	jne    2d0 <cmdClearScreen-0x30ffd30>
 2a1:	35 2e 33 2e 30       	xor    eax,0x302e332e
 2a6:	2f                   	das    
 2a7:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 2ae:	00 2e                	add    BYTE PTR [esi],ch
 2b0:	2e                   	cs
 2b1:	2f                   	das    
 2b2:	2e                   	cs
 2b3:	2e                   	cs
 2b4:	2f                   	das    
 2b5:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 2b9:	6a 2f                	push   0x2f
 2bb:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 2be:	69 73 4f 53 2f 69 6e 	imul   esi,DWORD PTR [ebx+0x4f],0x6e692f53
 2c5:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 2c9:	65                   	gs
 2ca:	2f                   	das    
 2cb:	69 33 38 36 00 69    	imul   esi,DWORD PTR [ebx],0x69003638
 2d1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2d2:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 2d6:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 2d9:	2e                   	cs
 2da:	2f                   	das    
 2db:	6c                   	ins    BYTE PTR es:[edi],dx
 2dc:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 2e3:	4f                   	dec    edi
 2e4:	53                   	push   ebx
 2e5:	2f                   	das    
 2e6:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 2ed:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 2f0:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 2f4:	65                   	gs
 2f5:	2f                   	das    
 2f6:	2e                   	cs
 2f7:	2e                   	cs
 2f8:	2f                   	das    
 2f9:	2e                   	cs
 2fa:	2e                   	cs
 2fb:	2f                   	das    
 2fc:	2e                   	cs
 2fd:	2e                   	cs
 2fe:	2f                   	das    
 2ff:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 303:	6a 2f                	push   0x2f
 305:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 308:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
 30f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310:	65                   	gs
 311:	6c                   	ins    BYTE PTR es:[edi],dx
 312:	2f                   	das    
 313:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 31a:	00 00                	add    BYTE PTR [eax],al
 31c:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 320:	6c                   	ins    BYTE PTR es:[edi],dx
 321:	6c                   	ins    BYTE PTR es:[edi],dx
 322:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 325:	01 00                	add    DWORD PTR [eax],eax
 327:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 32a:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
 331:	63 
 332:	2e                   	cs
 333:	68 00 02 00 00       	push   0x200
 338:	63 70 75             	arpl   WORD PTR [eax+0x75],si
 33b:	2e                   	cs
 33c:	68 00 03 00 00       	push   0x300
 341:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 345:	6c                   	ins    BYTE PTR es:[edi],dx
 346:	6c                   	ins    BYTE PTR es:[edi],dx
 347:	2e                   	cs
 348:	68 00 04 00 00       	push   0x400
 34d:	6d                   	ins    DWORD PTR es:[edi],dx
 34e:	61                   	popa   
 34f:	6c                   	ins    BYTE PTR es:[edi],dx
 350:	6c                   	ins    BYTE PTR es:[edi],dx
 351:	6f                   	outs   dx,DWORD PTR ds:[esi]
 352:	63 2e                	arpl   WORD PTR [esi],bp
 354:	68 00 05 00 00       	push   0x500
 359:	6c                   	ins    BYTE PTR es:[edi],dx
 35a:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 361:	4f                   	dec    edi
 362:	53                   	push   ebx
 363:	2e                   	cs
 364:	68 00 05 00 00       	push   0x500
 369:	74 68                	je     3d3 <cmdClearScreen-0x30ffc2d>
 36b:	65                   	gs
 36c:	73 69                	jae    3d7 <cmdClearScreen-0x30ffc29>
 36e:	67 6e                	outs   dx,BYTE PTR ds:[si]
 370:	61                   	popa   
 371:	6c                   	ins    BYTE PTR es:[edi],dx
 372:	73 2e                	jae    3a2 <cmdClearScreen-0x30ffc5e>
 374:	68 00 06 00 00       	push   0x600
 379:	00 00                	add    BYTE PTR [eax],al
 37b:	05 02 d8 07 10       	add    eax,0x1007d802
 380:	03 03                	add    eax,DWORD PTR [ebx]
 382:	19 01                	sbb    DWORD PTR [ecx],eax
 384:	75 08                	jne    38e <cmdClearScreen-0x30ffc72>
 386:	14 68                	adc    al,0x68
 388:	4c                   	dec    esp
 389:	08 21                	or     BYTE PTR [ecx],ah
 38b:	08 21                	or     BYTE PTR [ecx],ah
 38d:	08 13                	or     BYTE PTR [ebx],dl
 38f:	03 0b                	add    ecx,DWORD PTR [ebx]
 391:	74 03                	je     396 <cmdClearScreen-0x30ffc6a>
 393:	78 2e                	js     3c3 <cmdClearScreen-0x30ffc3d>
 395:	02 30                	add    dh,BYTE PTR [eax]
 397:	1a 2c d8             	sbb    ch,BYTE PTR [eax+ebx*8]
 39a:	69 75 d7 d7 4c 08 3e 	imul   esi,DWORD PTR [ebp-0x29],0x3e084cd7
 3a1:	bc e6 ae 94 08       	mov    esp,0x894aee6
 3a6:	4b                   	dec    ebx
 3a7:	e5 93                	in     eax,0x93
 3a9:	00 02                	add    BYTE PTR [edx],al
 3ab:	04 02                	add    al,0x2
 3ad:	06                   	push   es
 3ae:	e4 00                	in     al,0x0
 3b0:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
 3b3:	e4 00                	in     al,0x0
 3b5:	02 04 05 e4 06 af 00 	add    al,BYTE PTR [eax*1+0xaf06e4]
 3bc:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 3bf:	06                   	push   es
 3c0:	e4 06                	in     al,0x6
 3c2:	e5 02                	in     eax,0x2
 3c4:	25 13 08 4b 67       	and    eax,0x674b0813
 3c9:	e3 34                	jecxz  3ff <cmdClearScreen-0x30ffc01>
 3cb:	00 02                	add    BYTE PTR [edx],al
 3cd:	04 02                	add    al,0x2
 3cf:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 3d5:	02 03                	add    al,BYTE PTR [ebx]
 3d7:	63 4a 00             	arpl   WORD PTR [edx+0x0],cx
 3da:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 3dd:	06                   	push   es
 3de:	4a                   	dec    edx
 3df:	06                   	push   es
 3e0:	03 1f                	add    ebx,DWORD PTR [edi]
 3e2:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 3e5:	4b                   	dec    ebx
 3e6:	08 4f 3d             	or     BYTE PTR [edi+0x3d],cl
 3e9:	5b                   	pop    ebx
 3ea:	6a 92                	push   0xffffff92
 3ec:	02 3b                	add    bh,BYTE PTR [ebx]
 3ee:	14 69                	adc    al,0x69
 3f0:	00 02                	add    BYTE PTR [edx],al
 3f2:	04 02                	add    al,0x2
 3f4:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 3f7:	00 02                	add    BYTE PTR [edx],al
 3f9:	04 01                	add    al,0x1
 3fb:	06                   	push   es
 3fc:	4a                   	dec    edx
 3fd:	06                   	push   es
 3fe:	03 0b                	add    ecx,DWORD PTR [ebx]
 400:	66 59                	pop    cx
 402:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 405:	75 75                	jne    47c <cmdClearScreen-0x30ffb84>
 407:	75 75                	jne    47e <cmdClearScreen-0x30ffb82>
 409:	78 a1                	js     3ac <cmdClearScreen-0x30ffc54>
 40b:	08 ec                	or     ah,ch
 40d:	00 02                	add    BYTE PTR [edx],al
 40f:	04 01                	add    al,0x1
 411:	06                   	push   es
 412:	66 06                	pushw  es
 414:	af                   	scas   eax,DWORD PTR es:[edi]
 415:	68 75 08 4c 67       	push   0x674c0875
 41a:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 41d:	5a                   	pop    edx
 41e:	00 02                	add    BYTE PTR [edx],al
 420:	04 01                	add    al,0x1
 422:	06                   	push   es
 423:	9e                   	sahf   
 424:	00 02                	add    BYTE PTR [edx],al
 426:	04 02                	add    al,0x2
 428:	66                   	data16
 429:	00 02                	add    BYTE PTR [edx],al
 42b:	04 03                	add    al,0x3
 42d:	66 06                	pushw  es
 42f:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 430:	68 75 08 5a a0       	push   0xa05a0875
 435:	bc 68 a0 94 08       	mov    esp,0x894a068
 43a:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 43d:	94                   	xchg   esp,eax
 43e:	08 33                	or     BYTE PTR [ebx],dh
 440:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 445:	16                   	push   ss
 446:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 449:	03 3a                	add    edi,DWORD PTR [edx]
 44b:	d6                   	(bad)  
 44c:	68 d8 08 e7 08       	push   0x8e708d8
 451:	13 d7                	adc    edx,edi
 453:	08 e5                	or     ch,ah
 455:	08 3e                	or     BYTE PTR [esi],bh
 457:	4b                   	dec    ebx
 458:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 45b:	d9 d9                	(bad)  
 45d:	d7                   	xlat   BYTE PTR ds:[ebx]
 45e:	d7                   	xlat   BYTE PTR ds:[ebx]
 45f:	3d 31 75 00 02       	cmp    eax,0x2007531
 464:	04 03                	add    al,0x3
 466:	92                   	xchg   edx,eax
 467:	00 02                	add    BYTE PTR [edx],al
 469:	04 03                	add    al,0x3
 46b:	02 22                	add    ah,BYTE PTR [edx]
 46d:	13 00                	adc    eax,DWORD PTR [eax]
 46f:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 472:	02 30                	add    dh,BYTE PTR [eax]
 474:	0f 00 02             	sldt   WORD PTR [edx]
 477:	04 01                	add    al,0x1
 479:	06                   	push   es
 47a:	4a                   	dec    edx
 47b:	06                   	push   es
 47c:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 482:	04 03                	add    al,0x3
 484:	91                   	xchg   ecx,eax
 485:	00 02                	add    BYTE PTR [edx],al
 487:	04 03                	add    al,0x3
 489:	ff 00                	inc    DWORD PTR [eax]
 48b:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 48e:	06                   	push   es
 48f:	4a                   	dec    edx
 490:	06                   	push   es
 491:	84 d7                	test   bh,dl
 493:	3f                   	aas    
 494:	68 92 08 30 08       	push   0x8300892
 499:	f3 68 08 5a 08 4c    	repz push 0x4c085a08
 49f:	00 02                	add    BYTE PTR [edx],al
 4a1:	04 02                	add    al,0x2
 4a3:	03 75 74             	add    esi,DWORD PTR [ebp+0x74]
 4a6:	00 02                	add    BYTE PTR [edx],al
 4a8:	04 01                	add    al,0x1
 4aa:	06                   	push   es
 4ab:	4a                   	dec    edx
 4ac:	06                   	push   es
 4ad:	03 0f                	add    ecx,DWORD PTR [edi]
 4af:	66 59                	pop    cx
 4b1:	03 0d 2e 67 02 25    	add    ecx,DWORD PTR ds:0x2502672e
 4b7:	13 3f                	adc    edi,DWORD PTR [edi]
 4b9:	67 08 91 3f 67       	or     BYTE PTR [bx+di+0x673f],dl
 4be:	59                   	pop    ecx
 4bf:	59                   	pop    ecx
 4c0:	08 30                	or     BYTE PTR [eax],dh
 4c2:	3f                   	aas    
 4c3:	3d 85 75 22 3f       	cmp    eax,0x3f227585
 4c8:	3d 86 75 77 59       	cmp    eax,0x59777586
 4cd:	31 67 4b             	xor    DWORD PTR [edi+0x4b],esp
 4d0:	75 77                	jne    549 <cmdClearScreen-0x30ffab7>
 4d2:	75 9f                	jne    473 <cmdClearScreen-0x30ffb8d>
 4d4:	75 08                	jne    4de <cmdClearScreen-0x30ffb22>
 4d6:	4b                   	dec    ebx
 4d7:	83 4b 08 4b          	or     DWORD PTR [ebx+0x8],0x4b
 4db:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 4de:	5b                   	pop    ebx
 4df:	08 3e                	or     BYTE PTR [esi],bh
 4e1:	5b                   	pop    ebx
 4e2:	9f                   	lahf   
 4e3:	75 4b                	jne    530 <cmdClearScreen-0x30ffad0>
 4e5:	75 08                	jne    4ef <cmdClearScreen-0x30ffb11>
 4e7:	67 08 4b 5a          	or     BYTE PTR [bp+di+0x5a],cl
 4eb:	4b                   	dec    ebx
 4ec:	30 08                	xor    BYTE PTR [eax],cl
 4ee:	22 ae 08 22 75 75    	and    ch,BYTE PTR [esi+0x75752208]
 4f4:	f3 03 75 58          	repz add esi,DWORD PTR [ebp+0x58]
 4f8:	03 10                	add    edx,DWORD PTR [eax]
 4fa:	82                   	(bad)  
 4fb:	bc 93 f4 02 2b       	mov    esp,0x2b02f493
 500:	13 83 30 f3 47 6b    	adc    eax,DWORD PTR [ebx+0x6b47f330]
 506:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 509:	30 5d bc             	xor    BYTE PTR [ebp-0x44],bl
 50c:	cb                   	retf   
 50d:	08 4c 02 2b          	or     BYTE PTR [edx+eax*1+0x2b],cl
 511:	13 83 30 f3 47 6b    	adc    eax,DWORD PTR [ebx+0x6b47f330]
 517:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 51a:	30 5d 84             	xor    BYTE PTR [ebp-0x7c],bl
 51d:	a0 f5 5a 84 08       	mov    al,ds:0x8845af5
 522:	4c                   	dec    esp
 523:	84 d8                	test   al,bl
 525:	4b                   	dec    ebx
 526:	ad                   	lods   eax,DWORD PTR ds:[esi]
 527:	08 4d 84             	or     BYTE PTR [ebp-0x7c],cl
 52a:	f3 03 0d 20 03 77 f2 	repz add ecx,DWORD PTR ds:0xf2770320
 531:	08 30                	or     BYTE PTR [eax],dh
 533:	08 76 76             	or     BYTE PTR [esi+0x76],dh
 536:	5d                   	pop    ebp
 537:	67 f3 08 2f          	repz or BYTE PTR [bx],ch
 53b:	03 8d 7f f2 03 f5    	add    ecx,DWORD PTR [ebp-0xafc0d81]
 541:	00 08                	add    BYTE PTR [eax],cl
 543:	20 08                	and    BYTE PTR [eax],cl
 545:	13 59 02             	adc    ebx,DWORD PTR [ecx+0x2]
 548:	02 00                	add    al,BYTE PTR [eax]
 54a:	01 01                	add    DWORD PTR [ecx],eax

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
  70:	64 00 74 69 6d       	add    BYTE PTR fs:[ecx+ebp*2+0x6d],dh
  75:	65                   	gs
  76:	49                   	dec    ecx
  77:	74 00                	je     79 <cmdClearScreen-0x30fff87>
  79:	64                   	fs
  7a:	65                   	gs
  7b:	73 63                	jae    e0 <cmdClearScreen-0x30fff20>
  7d:	72 69                	jb     e8 <cmdClearScreen-0x30fff18>
  7f:	70 74                	jo     f5 <cmdClearScreen-0x30fff0b>
  81:	69 6f 6e 00 73 69 7a 	imul   ebp,DWORD PTR [edi+0x6e],0x7a697300
  88:	65                   	gs
  89:	74 79                	je     104 <cmdClearScreen-0x30ffefc>
  8b:	70 65                	jo     f2 <cmdClearScreen-0x30fff0e>
  8d:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  90:	64                   	fs
  91:	45                   	inc    ebp
  92:	78 65                	js     f9 <cmdClearScreen-0x30fff07>
  94:	63 70 00             	arpl   WORD PTR [eax+0x0],si
  97:	53                   	push   ebx
  98:	49                   	dec    ecx
  99:	47                   	inc    edi
  9a:	53                   	push   ebx
  9b:	54                   	push   esp
  9c:	4f                   	dec    edi
  9d:	50                   	push   eax
  9e:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  a1:	64                   	fs
  a2:	6c                   	ins    BYTE PTR es:[edi],dx
  a3:	69 6e 65 00 47 4e 55 	imul   ebp,DWORD PTR [esi+0x65],0x554e4700
  aa:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  ad:	39 20                	cmp    DWORD PTR [eax],esp
  af:	35 2e 33 2e 30       	xor    eax,0x302e332e
  b4:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
  ba:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  bf:	6c                   	ins    BYTE PTR es:[edi],dx
  c0:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  c6:	65                   	gs
  c7:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  cc:	72 69                	jb     137 <cmdClearScreen-0x30ffec9>
  ce:	63 20                	arpl   WORD PTR [eax],sp
  d0:	2d 6d 61 72 63       	sub    eax,0x6372616d
  d5:	68 3d 70 65 6e       	push   0x6e65703d
  da:	74 69                	je     145 <cmdClearScreen-0x30ffebb>
  dc:	75 6d                	jne    14b <cmdClearScreen-0x30ffeb5>
  de:	70 72                	jo     152 <cmdClearScreen-0x30ffeae>
  e0:	6f                   	outs   dx,DWORD PTR ds:[esi]
  e1:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  e7:	74 64                	je     14d <cmdClearScreen-0x30ffeb3>
  e9:	3d 63 39 39 20       	cmp    eax,0x20393963
  ee:	2d 66 66 72 65       	sub    eax,0x65726666
  f3:	65                   	gs
  f4:	73 74                	jae    16a <cmdClearScreen-0x30ffe96>
  f6:	61                   	popa   
  f7:	6e                   	outs   dx,BYTE PTR ds:[esi]
  f8:	64 69 6e 67 00 73 72 	imul   ebp,DWORD PTR fs:[esi+0x67],0x63727300
  ff:	63 
 100:	2f                   	das    
 101:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 104:	6d                   	ins    DWORD PTR es:[edi],dx
 105:	61                   	popa   
 106:	6e                   	outs   dx,BYTE PTR ds:[esi]
 107:	64                   	fs
 108:	73 2e                	jae    138 <cmdClearScreen-0x30ffec8>
 10a:	63 00                	arpl   WORD PTR [eax],ax
 10c:	74 6d                	je     17b <cmdClearScreen-0x30ffe85>
 10e:	5f                   	pop    edi
 10f:	67 6d                	ins    DWORD PTR es:[di],dx
 111:	74 6f                	je     182 <cmdClearScreen-0x30ffe7e>
 113:	66                   	data16
 114:	66                   	data16
 115:	00 53 49             	add    BYTE PTR [ebx+0x49],dl
 118:	47                   	inc    edi
 119:	55                   	push   ebp
 11a:	53                   	push   ebx
 11b:	4c                   	dec    esp
 11c:	45                   	inc    ebp
 11d:	45                   	inc    ebp
 11e:	50                   	push   eax
 11f:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 122:	64                   	fs
 123:	50                   	push   eax
 124:	77 64                	ja     18a <cmdClearScreen-0x30ffe76>
 126:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
 129:	6f                   	outs   dx,DWORD PTR ds:[esi]
 12a:	72 74                	jb     1a0 <cmdClearScreen-0x30ffe60>
 12c:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 12f:	74 00                	je     131 <cmdClearScreen-0x30ffecf>
 131:	74 69                	je     19c <cmdClearScreen-0x30ffe64>
 133:	6d                   	ins    DWORD PTR es:[edi],dx
 134:	65                   	gs
 135:	54                   	push   esp
 136:	6f                   	outs   dx,DWORD PTR ds:[esi]
 137:	45                   	inc    ebp
 138:	78 69                	js     1a3 <cmdClearScreen-0x30ffe5d>
 13a:	74 00                	je     13c <cmdClearScreen-0x30ffec4>
 13c:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 13f:	73 00                	jae    141 <cmdClearScreen-0x30ffebf>
 141:	73 74                	jae    1b7 <cmdClearScreen-0x30ffe49>
 143:	61                   	popa   
 144:	72 74                	jb     1ba <cmdClearScreen-0x30ffe46>
 146:	54                   	push   esp
 147:	69 63 6b 73 00 6b 65 	imul   esp,DWORD PTR [ebx+0x6b],0x656b0073
 14e:	78 65                	js     1b5 <cmdClearScreen-0x30ffe4b>
 150:	63 00                	arpl   WORD PTR [eax],ax
 152:	75 69                	jne    1bd <cmdClearScreen-0x30ffe43>
 154:	6e                   	outs   dx,BYTE PTR ds:[esi]
 155:	74 38                	je     18f <cmdClearScreen-0x30ffe71>
 157:	5f                   	pop    edi
 158:	74 00                	je     15a <cmdClearScreen-0x30ffea6>
 15a:	65                   	gs
 15b:	73 69                	jae    1c6 <cmdClearScreen-0x30ffe3a>
 15d:	67 6e                	outs   dx,BYTE PTR ds:[si]
 15f:	61                   	popa   
 160:	6c                   	ins    BYTE PTR es:[edi],dx
 161:	73 00                	jae    163 <cmdClearScreen-0x30ffe9d>
 163:	75 69                	jne    1ce <cmdClearScreen-0x30ffe32>
 165:	6e                   	outs   dx,BYTE PTR ds:[esi]
 166:	74 70                	je     1d8 <cmdClearScreen-0x30ffe28>
 168:	74 72                	je     1dc <cmdClearScreen-0x30ffe24>
 16a:	5f                   	pop    edi
 16b:	74 00                	je     16d <cmdClearScreen-0x30ffe93>
 16d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 170:	6d                   	ins    DWORD PTR es:[edi],dx
 171:	61                   	popa   
 172:	6e                   	outs   dx,BYTE PTR ds:[esi]
 173:	64                   	fs
 174:	5f                   	pop    edi
 175:	66                   	data16
 176:	75 6e                	jne    1e6 <cmdClearScreen-0x30ffe1a>
 178:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 17c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 17d:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 180:	74 56                	je     1d8 <cmdClearScreen-0x30ffe28>
 182:	61                   	popa   
 183:	6c                   	ins    BYTE PTR es:[edi],dx
 184:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 187:	64                   	fs
 188:	43                   	inc    ebx
 189:	6c                   	ins    BYTE PTR es:[edi],dx
 18a:	65                   	gs
 18b:	61                   	popa   
 18c:	72 53                	jb     1e1 <cmdClearScreen-0x30ffe1f>
 18e:	63 72 65             	arpl   WORD PTR [edx+0x65],si
 191:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 193:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 197:	68 6f 75 72 00       	push   0x72756f
 19c:	70 61                	jo     1ff <cmdClearScreen-0x30ffe01>
 19e:	72 61                	jb     201 <cmdClearScreen-0x30ffdff>
 1a0:	6d                   	ins    DWORD PTR es:[edi],dx
 1a1:	43                   	inc    ebx
 1a2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1a3:	75 6e                	jne    213 <cmdClearScreen-0x30ffded>
 1a5:	74 00                	je     1a7 <cmdClearScreen-0x30ffe59>
 1a7:	74 6d                	je     216 <cmdClearScreen-0x30ffdea>
 1a9:	5f                   	pop    edi
 1aa:	6d                   	ins    DWORD PTR es:[edi],dx
 1ab:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1ac:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1ad:	00 62 53             	add    BYTE PTR [edx+0x53],ah
 1b0:	69 67 49 6e 74 52 65 	imul   esp,DWORD PTR [edi+0x49],0x6552746e
 1b7:	63 65 69             	arpl   WORD PTR [ebp+0x69],sp
 1ba:	76 65                	jbe    221 <cmdClearScreen-0x30ffddf>
 1bc:	64 00 6c 6f 6e       	add    BYTE PTR fs:[edi+ebp*2+0x6e],ch
 1c1:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 1c5:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1c6:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 1ca:	74 00                	je     1cc <cmdClearScreen-0x30ffe34>
 1cc:	76 61                	jbe    22f <cmdClearScreen-0x30ffdd1>
 1ce:	72 4e                	jb     21e <cmdClearScreen-0x30ffde2>
 1d0:	61                   	popa   
 1d1:	6d                   	ins    DWORD PTR es:[edi],dx
 1d2:	65 00 63 6f          	add    BYTE PTR gs:[ebx+0x6f],ah
 1d6:	6d                   	ins    DWORD PTR es:[edi],dx
 1d7:	6d                   	ins    DWORD PTR es:[edi],dx
 1d8:	61                   	popa   
 1d9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1da:	64                   	fs
 1db:	5f                   	pop    edi
 1dc:	66                   	data16
 1dd:	75 6e                	jne    24d <cmdClearScreen-0x30ffdb3>
 1df:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 1e3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1e4:	5f                   	pop    edi
 1e5:	70 00                	jo     1e7 <cmdClearScreen-0x30ffe19>
 1e7:	70 61                	jo     24a <cmdClearScreen-0x30ffdb6>
 1e9:	64 31 00             	xor    DWORD PTR fs:[eax],eax
 1ec:	70 61                	jo     24f <cmdClearScreen-0x30ffdb1>
 1ee:	64 32 00             	xor    al,BYTE PTR fs:[eax]
 1f1:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
 1f4:	6c                   	ins    BYTE PTR es:[edi],dx
 1f5:	64                   	fs
 1f6:	50                   	push   eax
 1f7:	69 64 00 62 61 63 6b 	imul   esp,DWORD PTR [eax+eax*1+0x62],0x676b6361
 1fe:	67 
 1ff:	72 6f                	jb     270 <cmdClearScreen-0x30ffd90>
 201:	75 6e                	jne    271 <cmdClearScreen-0x30ffd8f>
 203:	64 00 53 49          	add    BYTE PTR fs:[ebx+0x49],dl
 207:	47                   	inc    edi
 208:	53                   	push   ebx
 209:	4c                   	dec    esp
 20a:	45                   	inc    ebp
 20b:	45                   	inc    ebp
 20c:	50                   	push   eax
 20d:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 210:	61                   	popa   
 211:	70 43                	jo     256 <cmdClearScreen-0x30ffdaa>
 213:	75 72                	jne    287 <cmdClearScreen-0x30ffd79>
 215:	72 00                	jb     217 <cmdClearScreen-0x30ffde9>
 217:	73 45                	jae    25e <cmdClearScreen-0x30ffda2>
 219:	78 65                	js     280 <cmdClearScreen-0x30ffd80>
 21b:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 21e:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 225:	72 61                	jb     288 <cmdClearScreen-0x30ffd78>
 227:	6d                   	ins    DWORD PTR es:[edi],dx
 228:	00 64 65 6c          	add    BYTE PTR [ebp+eiz*2+0x6c],ah
 22c:	69 6d 00 6e 65 77 43 	imul   ebp,DWORD PTR [ebp+0x0],0x4377656e
 233:	6d                   	ins    DWORD PTR es:[edi],dx
 234:	64                   	fs
 235:	4c                   	dec    esp
 236:	69 6e 65 00 63 6d 64 	imul   ebp,DWORD PTR [esi+0x65],0x646d6300
 23d:	52                   	push   edx
 23e:	65                   	gs
 23f:	70 65                	jo     2a6 <cmdClearScreen-0x30ffd5a>
 241:	61                   	popa   
 242:	74 00                	je     244 <cmdClearScreen-0x30ffdbc>
 244:	70 61                	jo     2a7 <cmdClearScreen-0x30ffd59>
 246:	72 61                	jb     2a9 <cmdClearScreen-0x30ffd57>
 248:	6d                   	ins    DWORD PTR es:[edi],dx
 249:	73 00                	jae    24b <cmdClearScreen-0x30ffdb5>
 24b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 24c:	61                   	popa   
 24d:	6d                   	ins    DWORD PTR es:[edi],dx
 24e:	65 00 66 6f          	add    BYTE PTR gs:[esi+0x6f],ah
 252:	72 6b                	jb     2bf <cmdClearScreen-0x30ffd41>
 254:	50                   	push   eax
 255:	69 64 00 6c 61 73 74 	imul   esp,DWORD PTR [eax+eax*1+0x6c],0x45747361
 25c:	45 
 25d:	78 65                	js     2c4 <cmdClearScreen-0x30ffd3c>
 25f:	63 45 78             	arpl   WORD PTR [ebp+0x78],ax
 262:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x75006564
 269:	75 
 26a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 26b:	73 69                	jae    2d6 <cmdClearScreen-0x30ffd2a>
 26d:	67 6e                	outs   dx,BYTE PTR ds:[si]
 26f:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 274:	61                   	popa   
 275:	72 00                	jb     277 <cmdClearScreen-0x30ffd89>
 277:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 27a:	48                   	dec    eax
 27b:	65                   	gs
 27c:	6c                   	ins    BYTE PTR es:[edi],dx
 27d:	70 00                	jo     27f <cmdClearScreen-0x30ffd81>
 27f:	74 6d                	je     2ee <cmdClearScreen-0x30ffd12>
 281:	5f                   	pop    edi
 282:	79 65                	jns    2e9 <cmdClearScreen-0x30ffd17>
 284:	61                   	popa   
 285:	72 00                	jb     287 <cmdClearScreen-0x30ffd79>
 287:	6c                   	ins    BYTE PTR es:[edi],dx
 288:	6f                   	outs   dx,DWORD PTR ds:[esi]
 289:	6e                   	outs   dx,BYTE PTR ds:[esi]
 28a:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 28e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 28f:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 293:	73 69                	jae    2fe <cmdClearScreen-0x30ffd02>
 295:	67 6e                	outs   dx,BYTE PTR ds:[si]
 297:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 29c:	74 00                	je     29e <cmdClearScreen-0x30ffd62>
 29e:	65                   	gs
 29f:	66 61                	popaw  
 2a1:	6d                   	ins    DWORD PTR es:[edi],dx
 2a2:	69 6c 79 00 75 69 6e 	imul   ebp,DWORD PTR [ecx+edi*2+0x0],0x746e6975
 2a9:	74 
 2aa:	33 32                	xor    esi,DWORD PTR [edx]
 2ac:	5f                   	pop    edi
 2ad:	74 00                	je     2af <cmdClearScreen-0x30ffd51>
 2af:	74 6d                	je     31e <cmdClearScreen-0x30ffce2>
 2b1:	5f                   	pop    edi
 2b2:	6d                   	ins    DWORD PTR es:[edi],dx
 2b3:	64                   	fs
 2b4:	61                   	popa   
 2b5:	79 00                	jns    2b7 <cmdClearScreen-0x30ffd49>
 2b7:	70 72                	jo     32b <cmdClearScreen-0x30ffcd5>
 2b9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2ba:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 2bd:	73 45                	jae    304 <cmdClearScreen-0x30ffcfc>
 2bf:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2c0:	76 70                	jbe    332 <cmdClearScreen-0x30ffcce>
 2c2:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 2c5:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x70006564
 2cc:	70 
 2cd:	63 6f 75             	arpl   WORD PTR [edi+0x75],bp
 2d0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2d1:	74 00                	je     2d3 <cmdClearScreen-0x30ffd2d>
 2d3:	73 68                	jae    33d <cmdClearScreen-0x30ffcc3>
 2d5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2d6:	72 74                	jb     34c <cmdClearScreen-0x30ffcb4>
 2d8:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 2db:	73 69                	jae    346 <cmdClearScreen-0x30ffcba>
 2dd:	67 6e                	outs   dx,BYTE PTR ds:[si]
 2df:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 2e4:	74 00                	je     2e6 <cmdClearScreen-0x30ffd1a>
 2e6:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2e8:	64                   	fs
 2e9:	54                   	push   esp
 2ea:	69 63 6b 73 00 65 6d 	imul   esp,DWORD PTR [ebx+0x6b],0x6d650073
 2f1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2f2:	64                   	fs
 2f3:	65                   	gs
 2f4:	6c                   	ins    BYTE PTR es:[edi],dx
 2f5:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 2f8:	64                   	fs
 2f9:	53                   	push   ebx
 2fa:	65                   	gs
 2fb:	74 45                	je     342 <cmdClearScreen-0x30ffcbe>
 2fd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2fe:	76 00                	jbe    300 <cmdClearScreen-0x30ffd00>
 300:	53                   	push   ebx
 301:	49                   	dec    ecx
 302:	47                   	inc    edi
 303:	49                   	dec    ecx
 304:	4f                   	dec    edi
 305:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 308:	64                   	fs
 309:	54                   	push   esp
 30a:	69 6d 65 00 74 6d 5f 	imul   ebp,DWORD PTR [ebp+0x65],0x5f6d7400
 311:	79 64                	jns    377 <cmdClearScreen-0x30ffc89>
 313:	61                   	popa   
 314:	79 00                	jns    316 <cmdClearScreen-0x30ffcea>
 316:	5f                   	pop    edi
 317:	42                   	inc    edx
 318:	6f                   	outs   dx,DWORD PTR ds:[esi]
 319:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31a:	6c                   	ins    BYTE PTR es:[edi],dx
 31b:	00 53 49             	add    BYTE PTR [ebx+0x49],dl
 31e:	47                   	inc    edi
 31f:	48                   	dec    eax
 320:	41                   	inc    ecx
 321:	4c                   	dec    esp
 322:	54                   	push   esp
 323:	00 74 65 73          	add    BYTE PTR [ebp+eiz*2+0x73],dh
 327:	74 00                	je     329 <cmdClearScreen-0x30ffcd7>
 329:	74 6d                	je     398 <cmdClearScreen-0x30ffc68>
 32b:	5f                   	pop    edi
 32c:	6d                   	ins    DWORD PTR es:[edi],dx
 32d:	69 6e 00 74 6d 5f 69 	imul   ebp,DWORD PTR [esi+0x0],0x695f6d74
 334:	73 64                	jae    39a <cmdClearScreen-0x30ffc66>
 336:	73 74                	jae    3ac <cmdClearScreen-0x30ffc54>
 338:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 33b:	64                   	fs
 33c:	54                   	push   esp
 33d:	69 6d 65 00 73 74 61 	imul   ebp,DWORD PTR [ebp+0x65],0x61747300
 344:	72 74                	jb     3ba <cmdClearScreen-0x30ffc46>
 346:	54                   	push   esp
 347:	69 6d 65 00 53 49 47 	imul   ebp,DWORD PTR [ebp+0x65],0x47495300
 34e:	53                   	push   ebx
 34f:	45                   	inc    ebp
 350:	47                   	inc    edi
 351:	56                   	push   esi
 352:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 356:	77 64                	ja     3bc <cmdClearScreen-0x30ffc44>
 358:	61                   	popa   
 359:	79 00                	jns    35b <cmdClearScreen-0x30ffca5>
 35b:	73 69                	jae    3c6 <cmdClearScreen-0x30ffc3a>
 35d:	7a 65                	jp     3c4 <cmdClearScreen-0x30ffc3c>
 35f:	00 66 6f             	add    BYTE PTR [esi+0x6f],ah
 362:	75 6e                	jne    3d2 <cmdClearScreen-0x30ffc2e>
 364:	64 00 68 65          	add    BYTE PTR fs:[eax+0x65],ch
 368:	61                   	popa   
 369:	70 42                	jo     3ad <cmdClearScreen-0x30ffc53>
 36b:	61                   	popa   
 36c:	73 65                	jae    3d3 <cmdClearScreen-0x30ffc2d>
 36e:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 371:	74 68                	je     3db <cmdClearScreen-0x30ffc25>
 373:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 376:	75 69                	jne    3e1 <cmdClearScreen-0x30ffc1f>
 378:	64                   	fs
 379:	5f                   	pop    edi
 37a:	65                   	gs
 37b:	78 74                	js     3f1 <cmdClearScreen-0x30ffc0f>
 37d:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 37f:	64                   	fs
 380:	65                   	gs
 381:	64                   	fs
 382:	5f                   	pop    edi
 383:	66                   	data16
 384:	65                   	gs
 385:	61                   	popa   
 386:	74 75                	je     3fd <cmdClearScreen-0x30ffc03>
 388:	72 65                	jb     3ef <cmdClearScreen-0x30ffc11>
 38a:	5f                   	pop    edi
 38b:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
 38e:	73 00                	jae    390 <cmdClearScreen-0x30ffc70>
 390:	70 72                	jo     404 <cmdClearScreen-0x30ffbfc>
 392:	65                   	gs
 393:	66                   	data16
 394:	65                   	gs
 395:	74 63                	je     3fa <cmdClearScreen-0x30ffc06>
 397:	68 77 74 31 00       	push   0x317477
 39c:	6c                   	ins    BYTE PTR es:[edi],dx
 39d:	69 62 63 54 5a 00 61 	imul   esp,DWORD PTR [edx+0x63],0x61005a54
 3a4:	76 78                	jbe    41e <cmdClearScreen-0x30ffbe2>
 3a6:	35 31 32 76 62       	xor    eax,0x62763231
 3ab:	6d                   	ins    DWORD PTR es:[edi],dx
 3ac:	69 00 74 6d 5f 73    	imul   eax,DWORD PTR [eax],0x735f6d74
 3b2:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 3b5:	76 61                	jbe    418 <cmdClearScreen-0x30ffbe8>
 3b7:	6c                   	ins    BYTE PTR es:[edi],dx
 3b8:	75 65                	jne    41f <cmdClearScreen-0x30ffbe1>
 3ba:	4c                   	dec    esp
 3bb:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3bd:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 3c0:	75 69                	jne    42b <cmdClearScreen-0x30ffbd5>
 3c2:	64                   	fs
 3c3:	5f                   	pop    edi
 3c4:	70 72                	jo     438 <cmdClearScreen-0x30ffbc8>
 3c6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3c7:	63 69 6e             	arpl   WORD PTR [ecx+0x6e],bp
 3ca:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3cc:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 3cf:	64                   	fs
 3d0:	53                   	push   ebx
 3d1:	6c                   	ins    BYTE PTR es:[edi],dx
 3d2:	65                   	gs
 3d3:	65                   	gs
 3d4:	70 00                	jo     3d6 <cmdClearScreen-0x30ffc2a>
 3d6:	72 65                	jb     43d <cmdClearScreen-0x30ffbc3>
 3d8:	73 65                	jae    43f <cmdClearScreen-0x30ffbc1>
 3da:	72 76                	jb     452 <cmdClearScreen-0x30ffbae>
 3dc:	65 64 00 53 49       	gs add BYTE PTR fs:gs:[ebx+0x49],dl
 3e1:	47                   	inc    edi
 3e2:	49                   	dec    ecx
 3e3:	4e                   	dec    esi
 3e4:	54                   	push   esp
 3e5:	00 73 4b             	add    BYTE PTR [ebx+0x4b],dh
 3e8:	53                   	push   ebx
 3e9:	68 65 6c 6c 50       	push   0x506c6c65
 3ee:	72 6f                	jb     45f <cmdClearScreen-0x30ffba1>
 3f0:	67 72 61             	addr16 jb 454 <cmdClearScreen-0x30ffbac>
 3f3:	6d                   	ins    DWORD PTR es:[edi],dx
 3f4:	4e                   	dec    esi
 3f5:	61                   	popa   
 3f6:	6d                   	ins    DWORD PTR es:[edi],dx
 3f7:	65 00 73 74          	add    BYTE PTR gs:[ebx+0x74],dh
 3fb:	65                   	gs
 3fc:	70 00                	jo     3fe <cmdClearScreen-0x30ffc02>
 3fe:	6b 65 78 65          	imul   esp,DWORD PTR [ebp+0x78],0x65
 402:	63 32                	arpl   WORD PTR [edx],si
 404:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 407:	6d                   	ins    DWORD PTR es:[edi],dx
 408:	6d                   	ins    DWORD PTR es:[edi],dx
 409:	61                   	popa   
 40a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 40b:	64                   	fs
 40c:	5f                   	pop    edi
 40d:	74 61                	je     470 <cmdClearScreen-0x30ffb90>
 40f:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 413:	74 00                	je     415 <cmdClearScreen-0x30ffbeb>
 415:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 417:	6e                   	outs   dx,BYTE PTR ds:[esi]
 418:	65                   	gs
 419:	47                   	inc    edi
 41a:	65                   	gs
 41b:	74 74                	je     491 <cmdClearScreen-0x30ffb6f>
 41d:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
 424:	00 6c 52 65          	add    BYTE PTR [edx+edx*2+0x65],ch
 428:	74 56                	je     480 <cmdClearScreen-0x30ffb80>
 42a:	61                   	popa   
 42b:	6c                   	ins    BYTE PTR es:[edi],dx
 42c:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 42f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 430:	6d                   	ins    DWORD PTR es:[edi],dx
 431:	70 74                	jo     4a7 <cmdClearScreen-0x30ffb59>
 433:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 436:	76 70                	jbe    4a8 <cmdClearScreen-0x30ffb58>
 438:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 43b:	6d                   	ins    DWORD PTR es:[edi],dx
 43c:	6d                   	ins    DWORD PTR es:[edi],dx
 43d:	61                   	popa   
 43e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 43f:	64                   	fs
 440:	48                   	dec    eax
 441:	69 73 74 6f 72 79 4d 	imul   esi,DWORD PTR [ebx+0x74],0x4d79726f
 448:	61                   	popa   
 449:	78 00                	js     44b <cmdClearScreen-0x30ffbb5>
 44b:	74 65                	je     4b2 <cmdClearScreen-0x30ffb4e>
 44d:	6d                   	ins    DWORD PTR es:[edi],dx
 44e:	70 00                	jo     450 <cmdClearScreen-0x30ffbb0>
 450:	70 61                	jo     4b3 <cmdClearScreen-0x30ffb4d>
 452:	72 73                	jb     4c7 <cmdClearScreen-0x30ffb39>
 454:	65                   	gs
 455:	50                   	push   eax
 456:	61                   	popa   
 457:	72 61                	jb     4ba <cmdClearScreen-0x30ffb46>
 459:	6d                   	ins    DWORD PTR es:[edi],dx
 45a:	73 53                	jae    4af <cmdClearScreen-0x30ffb51>
 45c:	68 65 6c 6c 00       	push   0x6c6c65
 461:	69 6e 70 75 74 00 6c 	imul   ebp,DWORD PTR [esi+0x70],0x6c007475
 468:	43                   	inc    ebx
 469:	75 72                	jne    4dd <cmdClearScreen-0x30ffb23>
 46b:	72 4b                	jb     4b8 <cmdClearScreen-0x30ffb48>
 46d:	65                   	gs
 46e:	79 43                	jns    4b3 <cmdClearScreen-0x30ffb4d>
 470:	6f                   	outs   dx,DWORD PTR ds:[esi]
 471:	75 6e                	jne    4e1 <cmdClearScreen-0x30ffb1f>
 473:	74 00                	je     475 <cmdClearScreen-0x30ffb8b>
 475:	70 61                	jo     4d8 <cmdClearScreen-0x30ffb28>
 477:	72 73                	jb     4ec <cmdClearScreen-0x30ffb14>
 479:	65                   	gs
 47a:	64                   	fs
 47b:	43                   	inc    ebx
 47c:	68 61 72 73 00       	push   0x737261
 481:	70 70                	jo     4f3 <cmdClearScreen-0x30ffb0d>
 483:	74 72                	je     4f7 <cmdClearScreen-0x30ffb09>
 485:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 488:	65 63 49 6e          	arpl   WORD PTR gs:[ecx+0x6e],cx
 48c:	74 65                	je     4f3 <cmdClearScreen-0x30ffb0d>
 48e:	72 6e                	jb     4fe <cmdClearScreen-0x30ffb02>
 490:	61                   	popa   
 491:	6c                   	ins    BYTE PTR es:[edi],dx
 492:	43                   	inc    ebx
 493:	6f                   	outs   dx,DWORD PTR ds:[esi]
 494:	6d                   	ins    DWORD PTR es:[edi],dx
 495:	6d                   	ins    DWORD PTR es:[edi],dx
 496:	61                   	popa   
 497:	6e                   	outs   dx,BYTE PTR ds:[esi]
 498:	64 00 76 61          	add    BYTE PTR fs:[esi+0x61],dh
 49c:	6c                   	ins    BYTE PTR es:[edi],dx
 49d:	75 65                	jne    504 <cmdClearScreen-0x30ffafc>
 49f:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 4a2:	74 45                	je     4e9 <cmdClearScreen-0x30ffb17>
 4a4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4a5:	76 56                	jbe    4fd <cmdClearScreen-0x30ffb03>
 4a7:	61                   	popa   
 4a8:	72 69                	jb     513 <cmdClearScreen-0x30ffaed>
 4aa:	61                   	popa   
 4ab:	62 6c 65 56          	bound  ebp,QWORD PTR [ebp+eiz*2+0x56]
 4af:	61                   	popa   
 4b0:	6c                   	ins    BYTE PTR es:[edi],dx
 4b1:	75 65                	jne    518 <cmdClearScreen-0x30ffae8>
 4b3:	00 64 71 75          	add    BYTE PTR [ecx+esi*2+0x75],ah
 4b7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4b8:	74 65                	je     51f <cmdClearScreen-0x30ffae1>
 4ba:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 4bd:	65                   	gs
 4be:	65                   	gs
 4bf:	41                   	inc    ecx
 4c0:	72 67                	jb     529 <cmdClearScreen-0x30ffad7>
 4c2:	56                   	push   esi
 4c3:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
 4c7:	72 72                	jb     53b <cmdClearScreen-0x30ffac5>
 4c9:	4b                   	dec    ebx
 4ca:	65                   	gs
 4cb:	79 00                	jns    4cd <cmdClearScreen-0x30ffb33>
 4cd:	70 61                	jo     530 <cmdClearScreen-0x30ffad0>
 4cf:	72 61                	jb     532 <cmdClearScreen-0x30fface>
 4d1:	6d                   	ins    DWORD PTR es:[edi],dx
 4d2:	73 54                	jae    528 <cmdClearScreen-0x30ffad8>
 4d4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4d5:	41                   	inc    ecx
 4d6:	72 67                	jb     53f <cmdClearScreen-0x30ffac1>
 4d8:	76 00                	jbe    4da <cmdClearScreen-0x30ffb26>
 4da:	62 73 71             	bound  esi,QWORD PTR [ebx+0x71]
 4dd:	75 6f                	jne    54e <cmdClearScreen-0x30ffab2>
 4df:	74 65                	je     546 <cmdClearScreen-0x30ffaba>
 4e1:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 4e4:	70 72                	jo     558 <cmdClearScreen-0x30ffaa8>
 4e6:	69 6e 74 43 6f 6d 6d 	imul   ebp,DWORD PTR [esi+0x74],0x6d6d6f43
 4ed:	61                   	popa   
 4ee:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4ef:	64 00 67 65          	add    BYTE PTR fs:[edi+0x65],ah
 4f3:	74 41                	je     536 <cmdClearScreen-0x30ffaca>
 4f5:	43                   	inc    ebx
 4f6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4f7:	6d                   	ins    DWORD PTR es:[edi],dx
 4f8:	6d                   	ins    DWORD PTR es:[edi],dx
 4f9:	61                   	popa   
 4fa:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4fb:	64 00 6d 61          	add    BYTE PTR fs:[ebp+0x61],ch
 4ff:	78 61                	js     562 <cmdClearScreen-0x30ffa9e>
 501:	72 67                	jb     56a <cmdClearScreen-0x30ffa96>
 503:	63 00                	arpl   WORD PTR [eax],ax
 505:	70 72                	jo     579 <cmdClearScreen-0x30ffa87>
 507:	6f                   	outs   dx,DWORD PTR ds:[esi]
 508:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 50b:	73 53                	jae    560 <cmdClearScreen-0x30ffaa0>
 50d:	69 67 6e 61 6c 00 6e 	imul   esp,DWORD PTR [edi+0x6e],0x6e006c61
 514:	65                   	gs
 515:	65                   	gs
 516:	64                   	fs
 517:	44                   	inc    esp
 518:	6f                   	outs   dx,DWORD PTR ds:[esi]
 519:	75 62                	jne    57d <cmdClearScreen-0x30ffa83>
 51b:	6c                   	ins    BYTE PTR es:[edi],dx
 51c:	65                   	gs
 51d:	51                   	push   ecx
 51e:	75 6f                	jne    58f <cmdClearScreen-0x30ffa71>
 520:	74 65                	je     587 <cmdClearScreen-0x30ffa79>
 522:	74 6f                	je     593 <cmdClearScreen-0x30ffa6d>
 524:	45                   	inc    ebp
 525:	6e                   	outs   dx,BYTE PTR ds:[esi]
 526:	64                   	fs
 527:	50                   	push   eax
 528:	61                   	popa   
 529:	72 61                	jb     58c <cmdClearScreen-0x30ffa74>
 52b:	6d                   	ins    DWORD PTR es:[edi],dx
 52c:	00 65 76             	add    BYTE PTR [ebp+0x76],ah
 52f:	4e                   	dec    esi
 530:	61                   	popa   
 531:	6d                   	ins    DWORD PTR es:[edi],dx
 532:	65 00 73 61          	add    BYTE PTR gs:[ebx+0x61],dh
 536:	76 65                	jbe    59d <cmdClearScreen-0x30ffa63>
 538:	43                   	inc    ebx
 539:	6f                   	outs   dx,DWORD PTR ds:[esi]
 53a:	6d                   	ins    DWORD PTR es:[edi],dx
 53b:	6d                   	ins    DWORD PTR es:[edi],dx
 53c:	61                   	popa   
 53d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 53e:	64 00 62 75          	add    BYTE PTR fs:[edx+0x75],ah
 542:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 549:	00 
 54a:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 54d:	6d                   	ins    DWORD PTR es:[edi],dx
 54e:	61                   	popa   
 54f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 550:	64                   	fs
 551:	48                   	dec    eax
 552:	69 73 74 6f 72 79 00 	imul   esi,DWORD PTR [ebx+0x74],0x79726f
 559:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 55c:	6d                   	ins    DWORD PTR es:[edi],dx
 55d:	61                   	popa   
 55e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 55f:	64                   	fs
 560:	48                   	dec    eax
 561:	69 73 74 6f 72 79 50 	imul   esi,DWORD PTR [ebx+0x74],0x5079726f
 568:	74 72                	je     5dc <cmdClearScreen-0x30ffa24>
 56a:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 56d:	67 6e                	outs   dx,BYTE PTR ds:[si]
 56f:	61                   	popa   
 570:	6c                   	ins    BYTE PTR es:[edi],dx
 571:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 574:	63 2f                	arpl   WORD PTR [edi],bp
 576:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 57a:	6c                   	ins    BYTE PTR es:[edi],dx
 57b:	6c                   	ins    BYTE PTR es:[edi],dx
 57c:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 57f:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 583:	6c                   	ins    BYTE PTR es:[edi],dx
 584:	6c                   	ins    BYTE PTR es:[edi],dx
 585:	00 61 6e             	add    BYTE PTR [ecx+0x6e],ah
 588:	73 69                	jae    5f3 <cmdClearScreen-0x30ffa0d>
 58a:	53                   	push   ebx
 58b:	65                   	gs
 58c:	71 00                	jno    58e <cmdClearScreen-0x30ffa72>
 58e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 58f:	61                   	popa   
 590:	72 67                	jb     5f9 <cmdClearScreen-0x30ffa07>
 592:	76 00                	jbe    594 <cmdClearScreen-0x30ffa6c>
 594:	68 61 6e 64 6c       	push   0x6c646e61
 599:	65                   	gs
 59a:	53                   	push   ebx
 59b:	69 67 6e 61 6c 73 00 	imul   esp,DWORD PTR [edi+0x6e],0x736c61
 5a2:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 5a5:	4c                   	dec    esp
 5a6:	69 6e 65 00 63 6f 6d 	imul   ebp,DWORD PTR [esi+0x65],0x6d6f6300
 5ad:	6d                   	ins    DWORD PTR es:[edi],dx
 5ae:	61                   	popa   
 5af:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5b0:	64 00 66 69          	add    BYTE PTR fs:[esi+0x69],ah
 5b4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5b5:	64                   	fs
 5b6:	43                   	inc    ebx
 5b7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5b8:	6d                   	ins    DWORD PTR es:[edi],dx
 5b9:	6d                   	ins    DWORD PTR es:[edi],dx
 5ba:	61                   	popa   
 5bb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5bc:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 5c0:	70 79                	jo     63b <cmdClearScreen-0x30ff9c5>
 5c2:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 5c5:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 5c8:	73 65                	jae    62f <cmdClearScreen-0x30ff9d1>
 5ca:	74 52                	je     61e <cmdClearScreen-0x30ff9e2>
 5cc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5cd:	77 00                	ja     5cf <cmdClearScreen-0x30ffa31>
 5cf:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 5d2:	6d                   	ins    DWORD PTR es:[edi],dx
 5d3:	61                   	popa   
 5d4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5d5:	64                   	fs
 5d6:	57                   	push   edi
 5d7:	61                   	popa   
 5d8:	73 46                	jae    620 <cmdClearScreen-0x30ff9e0>
 5da:	72 6f                	jb     64b <cmdClearScreen-0x30ff9b5>
 5dc:	6d                   	ins    DWORD PTR es:[edi],dx
 5dd:	54                   	push   esp
 5de:	68 69 73 42 75       	push   0x75427369
 5e3:	66                   	data16
 5e4:	66                   	data16
 5e5:	65                   	gs
 5e6:	72 50                	jb     638 <cmdClearScreen-0x30ff9c8>
 5e8:	74 72                	je     65c <cmdClearScreen-0x30ff9a4>
 5ea:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 5ed:	74 41                	je     630 <cmdClearScreen-0x30ff9d0>
 5ef:	4b                   	dec    ebx
 5f0:	65                   	gs
 5f1:	79 00                	jns    5f3 <cmdClearScreen-0x30ffa0d>

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
