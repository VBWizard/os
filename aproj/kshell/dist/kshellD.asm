
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
 3100009:	68 e5 15 10 03       	push   0x31015e5
 310000e:	e8 ed 12 00 00       	call   3101300 <kShell+0x413>
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
 3100028:	a1 0c 24 10 03       	mov    eax,ds:0x310240c
 310002d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100030:	c1 e2 02             	shl    edx,0x2
 3100033:	01 d0                	add    eax,edx
 3100035:	8b 00                	mov    eax,DWORD PTR [eax]
 3100037:	85 c0                	test   eax,eax
 3100039:	74 20                	je     310005b <cmdPrintEnv+0x42>
/home/yogi/src/os/aproj/kshell/src/commands.c:21
        {
            print("%s\n",environmentLoc[cnt]);
 310003b:	a1 0c 24 10 03       	mov    eax,ds:0x310240c
 3100040:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100043:	c1 e2 02             	shl    edx,0x2
 3100046:	01 d0                	add    eax,edx
 3100048:	8b 00                	mov    eax,DWORD PTR [eax]
 310004a:	83 ec 08             	sub    esp,0x8
 310004d:	50                   	push   eax
 310004e:	68 ea 15 10 03       	push   0x31015ea
 3100053:	e8 98 12 00 00       	call   31012f0 <kShell+0x403>
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
 3100083:	e8 ce 07 00 00       	call   3100856 <parseParamsShell>
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
 31000a4:	68 ee 15 10 03       	push   0x31015ee
 31000a9:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000af:	50                   	push   eax
 31000b0:	e8 fb 12 00 00       	call   31013b0 <kShell+0x4c3>
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
 31000c4:	68 f0 15 10 03       	push   0x31015f0
 31000c9:	e8 22 12 00 00       	call   31012f0 <kShell+0x403>
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
 31000f0:	e8 8b 13 00 00       	call   3101480 <kShell+0x593>
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
 3100111:	e8 2a 12 00 00       	call   3101340 <kShell+0x453>
 3100116:	83 c4 10             	add    esp,0x10
 3100119:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:44
        varValue = malloc(valueLen);
 310011c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310011f:	83 ec 0c             	sub    esp,0xc
 3100122:	50                   	push   eax
 3100123:	e8 18 12 00 00       	call   3101340 <kShell+0x453>
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
 310013f:	e8 9c 12 00 00       	call   31013e0 <kShell+0x4f3>
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
 310016b:	e8 70 12 00 00       	call   31013e0 <kShell+0x4f3>
 3100170:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:48
        strtrim(varName);
 3100173:	83 ec 0c             	sub    esp,0xc
 3100176:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100179:	e8 b2 12 00 00       	call   3101430 <kShell+0x543>
 310017e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:49
        strtrim(varValue);
 3100181:	83 ec 0c             	sub    esp,0xc
 3100184:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100187:	e8 a4 12 00 00       	call   3101430 <kShell+0x543>
 310018c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:50
        setenv(varName, varValue);
 310018f:	83 ec 08             	sub    esp,0x8
 3100192:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100195:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100198:	e8 53 12 00 00       	call   31013f0 <kShell+0x503>
 310019d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:51
        free(varName);
 31001a0:	83 ec 0c             	sub    esp,0xc
 31001a3:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31001a6:	e8 f5 12 00 00       	call   31014a0 <kShell+0x5b3>
 31001ab:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:52
        free(varValue);
 31001ae:	83 ec 0c             	sub    esp,0xc
 31001b1:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31001b4:	e8 e7 12 00 00       	call   31014a0 <kShell+0x5b3>
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
 31001dd:	e8 ae 12 00 00       	call   3101490 <kShell+0x5a3>
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
 3100200:	e8 db 10 00 00       	call   31012e0 <kShell+0x3f3>
 3100205:	83 c4 10             	add    esp,0x10
 3100208:	a3 44 27 10 03       	mov    ds:0x3102744,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:69
            char ret[10];
            itoa(lastExecExitCode,ret);
 310020d:	a1 44 27 10 03       	mov    eax,ds:0x3102744
 3100212:	89 c2                	mov    edx,eax
 3100214:	83 ec 08             	sub    esp,0x8
 3100217:	8d 45 ea             	lea    eax,[ebp-0x16]
 310021a:	50                   	push   eax
 310021b:	52                   	push   edx
 310021c:	e8 5f 11 00 00       	call   3101380 <kShell+0x493>
 3100221:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:70
            setenv("LASTEXIT",ret);
 3100224:	83 ec 08             	sub    esp,0x8
 3100227:	8d 45 ea             	lea    eax,[ebp-0x16]
 310022a:	50                   	push   eax
 310022b:	68 0b 16 10 03       	push   0x310160b
 3100230:	e8 bb 11 00 00       	call   31013f0 <kShell+0x503>
 3100235:	83 c4 10             	add    esp,0x10
 3100238:	eb 13                	jmp    310024d <kexec2+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:74
        }
    }
    else
        print("Error executing %s\n",path);
 310023a:	83 ec 08             	sub    esp,0x8
 310023d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100240:	68 14 16 10 03       	push   0x3101614
 3100245:	e8 a6 10 00 00       	call   31012f0 <kShell+0x403>
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
 3100286:	e8 cb 05 00 00       	call   3100856 <parseParamsShell>
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
 31002c6:	e8 95 10 00 00       	call   3101360 <kShell+0x473>
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
 31002de:	68 28 16 10 03       	push   0x3101628
 31002e3:	e8 18 10 00 00       	call   3101300 <kShell+0x413>
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
 3100319:	e8 72 10 00 00       	call   3101390 <kShell+0x4a3>
 310031e:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:112
    
    forkPid = fork();
 3100321:	e8 ea 10 00 00       	call   3101410 <kShell+0x523>
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
 3100342:	e8 59 10 00 00       	call   31013a0 <kShell+0x4b3>
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
 310035a:	e8 81 0f 00 00       	call   31012e0 <kShell+0x3f3>
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
 3100374:	e8 e7 10 00 00       	call   3101460 <kShell+0x573>
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
 310038d:	68 40 16 10 03       	push   0x3101640
 3100392:	e8 59 0f 00 00       	call   31012f0 <kShell+0x403>
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
 31003b1:	e8 2a 0f 00 00       	call   31012e0 <kShell+0x3f3>
 31003b6:	83 c4 10             	add    esp,0x10
 31003b9:	a3 44 27 10 03       	mov    ds:0x3102744,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:134
            if (lastExecExitCode == 0xBADBADBA)
 31003be:	a1 44 27 10 03       	mov    eax,ds:0x3102744
 31003c3:	3d ba ad db ba       	cmp    eax,0xbadbadba
 31003c8:	75 16                	jne    31003e0 <kexec+0x190>
/home/yogi/src/os/aproj/kshell/src/commands.c:135
                print("execTime: Cannot execute %s\n",argv[0]);
 31003ca:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31003cd:	8b 00                	mov    eax,DWORD PTR [eax]
 31003cf:	83 ec 08             	sub    esp,0x8
 31003d2:	50                   	push   eax
 31003d3:	68 4e 16 10 03       	push   0x310164e
 31003d8:	e8 13 0f 00 00       	call   31012f0 <kShell+0x403>
 31003dd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:137
        }
        if (timeIt)
 31003e0:	80 bd b4 fa ff ff 00 	cmp    BYTE PTR [ebp-0x54c],0x0
 31003e7:	74 1f                	je     3100408 <kexec+0x1b8>
/home/yogi/src/os/aproj/kshell/src/commands.c:139
        {
            endTicks=getticks();
 31003e9:	e8 a2 0f 00 00       	call   3101390 <kShell+0x4a3>
 31003ee:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:140
            print("\n%u ticks\n",endTicks-startTicks);
 31003f1:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 31003f4:	2b 45 d4             	sub    eax,DWORD PTR [ebp-0x2c]
 31003f7:	83 ec 08             	sub    esp,0x8
 31003fa:	50                   	push   eax
 31003fb:	68 6b 16 10 03       	push   0x310166b
 3100400:	e8 eb 0e 00 00       	call   31012f0 <kShell+0x403>
 3100405:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:143
        }
        char ret[10];
        itoa(lastExecExitCode,ret);
 3100408:	a1 44 27 10 03       	mov    eax,ds:0x3102744
 310040d:	89 c2                	mov    edx,eax
 310040f:	83 ec 08             	sub    esp,0x8
 3100412:	8d 85 be fa ff ff    	lea    eax,[ebp-0x542]
 3100418:	50                   	push   eax
 3100419:	52                   	push   edx
 310041a:	e8 61 0f 00 00       	call   3101380 <kShell+0x493>
 310041f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:144
        setenv("LASTEXIT",ret);    
 3100422:	83 ec 08             	sub    esp,0x8
 3100425:	8d 85 be fa ff ff    	lea    eax,[ebp-0x542]
 310042b:	50                   	push   eax
 310042c:	68 0b 16 10 03       	push   0x310160b
 3100431:	e8 ba 0f 00 00       	call   31013f0 <kShell+0x503>
 3100436:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:147 (discriminator 1)
    }
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    free(argv);
 3100439:	83 ec 0c             	sub    esp,0xc
 310043c:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 310043f:	e8 5c 10 00 00       	call   31014a0 <kShell+0x5b3>
 3100444:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:148 (discriminator 1)
    free(pgm);
 3100447:	83 ec 0c             	sub    esp,0xc
 310044a:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 310044d:	e8 4e 10 00 00       	call   31014a0 <kShell+0x5b3>
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
 310047d:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:162
    char *newCmdLine=cmdline+2;
 3100484:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100487:	83 c0 02             	add    eax,0x2
 310048a:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:163
    argv = cmdlineToArgv(cmdline, &argc);
 310048d:	83 ec 08             	sub    esp,0x8
 3100490:	8d 45 e4             	lea    eax,[ebp-0x1c]
 3100493:	50                   	push   eax
 3100494:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100497:	e8 c4 0e 00 00       	call   3101360 <kShell+0x473>
 310049c:	83 c4 10             	add    esp,0x10
 310049f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:165
    
    count = atoi(argv[0]);
 31004a2:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 31004a5:	8b 00                	mov    eax,DWORD PTR [eax]
 31004a7:	83 ec 0c             	sub    esp,0xc
 31004aa:	50                   	push   eax
 31004ab:	e8 c0 0f 00 00       	call   3101470 <kShell+0x583>
 31004b0:	83 c4 10             	add    esp,0x10
 31004b3:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:167

    for (int cnt=0;cnt<count;cnt++)
 31004b6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31004bd:	eb 48                	jmp    3100507 <cmdRepeat+0x97>
/home/yogi/src/os/aproj/kshell/src/commands.c:169
    {
        printf("\n*************** REPEAT EXECUTION #%u of %u ***************\n",cnt+1,count);
 31004bf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004c2:	83 c0 01             	add    eax,0x1
 31004c5:	83 ec 04             	sub    esp,0x4
 31004c8:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31004cb:	50                   	push   eax
 31004cc:	68 78 16 10 03       	push   0x3101678
 31004d1:	e8 2a 0e 00 00       	call   3101300 <kShell+0x413>
 31004d6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:170
        kexec(newCmdLine,false);
 31004d9:	83 ec 08             	sub    esp,0x8
 31004dc:	6a 00                	push   0x0
 31004de:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 31004e1:	e8 6a fd ff ff       	call   3100250 <kexec>
 31004e6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:171
        if (bSigIntReceived)
 31004e9:	0f b6 05 00 24 10 03 	movzx  eax,BYTE PTR ds:0x3102400
 31004f0:	84 c0                	test   al,al
 31004f2:	74 0f                	je     3100503 <cmdRepeat+0x93>
/home/yogi/src/os/aproj/kshell/src/commands.c:173
        {
            processSignal(SIGINT);
 31004f4:	83 ec 0c             	sub    esp,0xc
 31004f7:	6a 08                	push   0x8
 31004f9:	e8 c4 09 00 00       	call   3100ec2 <processSignal>
 31004fe:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:174
            break;
 3100501:	eb 0c                	jmp    310050f <cmdRepeat+0x9f>
/home/yogi/src/os/aproj/kshell/src/commands.c:167 (discriminator 2)
    char *newCmdLine=cmdline+2;
    argv = cmdlineToArgv(cmdline, &argc);
    
    count = atoi(argv[0]);

    for (int cnt=0;cnt<count;cnt++)
 3100503:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:167 (discriminator 1)
 3100507:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310050a:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 310050d:	7c b0                	jl     31004bf <cmdRepeat+0x4f>
/home/yogi/src/os/aproj/kshell/src/commands.c:178
            processSignal(SIGINT);
            break;
        }
    }
    
}
 310050f:	90                   	nop
 3100510:	c9                   	leave  
 3100511:	c3                   	ret    

03100512 <cmdExecp>:
cmdExecp():
/home/yogi/src/os/aproj/kshell/src/commands.c:181

void cmdExecp(char* cmdline)
{
 3100512:	55                   	push   ebp
 3100513:	89 e5                	mov    ebp,esp
 3100515:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:182
    kexec(cmdline,false);
 3100518:	83 ec 08             	sub    esp,0x8
 310051b:	6a 00                	push   0x0
 310051d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100520:	e8 2b fd ff ff       	call   3100250 <kexec>
 3100525:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:183
}
 3100528:	90                   	nop
 3100529:	c9                   	leave  
 310052a:	c3                   	ret    

0310052b <cmdExit>:
cmdExit():
/home/yogi/src/os/aproj/kshell/src/commands.c:186

void cmdExit(char *cmdline)
{
 310052b:	55                   	push   ebp
 310052c:	89 e5                	mov    ebp,esp
 310052e:	81 ec 08 05 00 00    	sub    esp,0x508
/home/yogi/src/os/aproj/kshell/src/commands.c:189
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 3100534:	83 ec 04             	sub    esp,0x4
 3100537:	68 00 05 00 00       	push   0x500
 310053c:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 3100542:	50                   	push   eax
 3100543:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100546:	e8 0b 03 00 00       	call   3100856 <parseParamsShell>
 310054b:	83 c4 10             	add    esp,0x10
 310054e:	85 c0                	test   eax,eax
 3100550:	74 1d                	je     310056f <cmdExit+0x44>
/home/yogi/src/os/aproj/kshell/src/commands.c:191
    {
        exitCode = strtoul(params[0],0,10);
 3100552:	83 ec 04             	sub    esp,0x4
 3100555:	6a 0a                	push   0xa
 3100557:	6a 00                	push   0x0
 3100559:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 310055f:	50                   	push   eax
 3100560:	e8 0b 0e 00 00       	call   3101370 <kShell+0x483>
 3100565:	83 c4 10             	add    esp,0x10
 3100568:	a3 48 27 10 03       	mov    ds:0x3102748,eax
 310056d:	eb 0a                	jmp    3100579 <cmdExit+0x4e>
/home/yogi/src/os/aproj/kshell/src/commands.c:194
    }
    else
        exitCode = 0;
 310056f:	c7 05 48 27 10 03 00 	mov    DWORD PTR ds:0x3102748,0x0
 3100576:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:195
    timeToExit=true;
 3100579:	c6 05 54 27 10 03 01 	mov    BYTE PTR ds:0x3102754,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:196
}
 3100580:	90                   	nop
 3100581:	c9                   	leave  
 3100582:	c3                   	ret    

03100583 <cmdHelp>:
cmdHelp():
/home/yogi/src/os/aproj/kshell/src/commands.c:199

void cmdHelp(char *cmdline)
{
 3100583:	55                   	push   ebp
 3100584:	89 e5                	mov    ebp,esp
 3100586:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:202
    char* tok;
    
    tok=strtok(cmdline,delim);
 3100589:	83 ec 08             	sub    esp,0x8
 310058c:	68 04 24 10 03       	push   0x3102404
 3100591:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100594:	e8 67 0e 00 00       	call   3101400 <kShell+0x513>
 3100599:	83 c4 10             	add    esp,0x10
 310059c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:209
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
 310059f:	83 ec 08             	sub    esp,0x8
 31005a2:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005a5:	68 b5 16 10 03       	push   0x31016b5
 31005aa:	e8 41 0d 00 00       	call   31012f0 <kShell+0x403>
 31005af:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:210
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 31005b2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31005b9:	e9 86 00 00 00       	jmp    3100644 <cmdHelp+0xc1>
/home/yogi/src/os/aproj/kshell/src/commands.c:211
        if (tok!=NULL)
 31005be:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31005c2:	74 50                	je     3100614 <cmdHelp+0x91>
/home/yogi/src/os/aproj/kshell/src/commands.c:213
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
 31005c4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005c7:	c1 e0 04             	shl    eax,0x4
 31005ca:	05 a0 21 10 03       	add    eax,0x31021a0
 31005cf:	8b 00                	mov    eax,DWORD PTR [eax]
 31005d1:	83 ec 04             	sub    esp,0x4
 31005d4:	6a 64                	push   0x64
 31005d6:	50                   	push   eax
 31005d7:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005da:	e8 f1 0d 00 00       	call   31013d0 <kShell+0x4e3>
 31005df:	83 c4 10             	add    esp,0x10
 31005e2:	85 c0                	test   eax,eax
 31005e4:	75 5a                	jne    3100640 <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:214
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 31005e6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005e9:	c1 e0 04             	shl    eax,0x4
 31005ec:	05 a4 21 10 03       	add    eax,0x31021a4
 31005f1:	8b 10                	mov    edx,DWORD PTR [eax]
 31005f3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005f6:	c1 e0 04             	shl    eax,0x4
 31005f9:	05 a0 21 10 03       	add    eax,0x31021a0
 31005fe:	8b 00                	mov    eax,DWORD PTR [eax]
 3100600:	83 ec 04             	sub    esp,0x4
 3100603:	52                   	push   edx
 3100604:	50                   	push   eax
 3100605:	68 bf 16 10 03       	push   0x31016bf
 310060a:	e8 e1 0c 00 00       	call   31012f0 <kShell+0x403>
 310060f:	83 c4 10             	add    esp,0x10
 3100612:	eb 2c                	jmp    3100640 <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:218
        }
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100614:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100617:	c1 e0 04             	shl    eax,0x4
 310061a:	05 a4 21 10 03       	add    eax,0x31021a4
 310061f:	8b 10                	mov    edx,DWORD PTR [eax]
 3100621:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100624:	c1 e0 04             	shl    eax,0x4
 3100627:	05 a0 21 10 03       	add    eax,0x31021a0
 310062c:	8b 00                	mov    eax,DWORD PTR [eax]
 310062e:	83 ec 04             	sub    esp,0x4
 3100631:	52                   	push   edx
 3100632:	50                   	push   eax
 3100633:	68 bf 16 10 03       	push   0x31016bf
 3100638:	e8 b3 0c 00 00       	call   31012f0 <kShell+0x403>
 310063d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:210 (discriminator 2)
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100640:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:210 (discriminator 1)
 3100644:	83 7d f4 09          	cmp    DWORD PTR [ebp-0xc],0x9
 3100648:	0f 86 70 ff ff ff    	jbe    31005be <cmdHelp+0x3b>
/home/yogi/src/os/aproj/kshell/src/commands.c:221
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
    
}
 310064e:	90                   	nop
 310064f:	c9                   	leave  
 3100650:	c3                   	ret    

03100651 <cmdPwd>:
cmdPwd():
/home/yogi/src/os/aproj/kshell/src/commands.c:224

void cmdPwd()
{
 3100651:	55                   	push   ebp
 3100652:	89 e5                	mov    ebp,esp
 3100654:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:225
    char* buf=malloc(512);
 3100657:	83 ec 0c             	sub    esp,0xc
 310065a:	68 00 02 00 00       	push   0x200
 310065f:	e8 dc 0c 00 00       	call   3101340 <kShell+0x453>
 3100664:	83 c4 10             	add    esp,0x10
 3100667:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:226
    print("%s\n",getcwd(buf,512));
 310066a:	83 ec 08             	sub    esp,0x8
 310066d:	68 00 02 00 00       	push   0x200
 3100672:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100675:	e8 c6 0d 00 00       	call   3101440 <kShell+0x553>
 310067a:	83 c4 10             	add    esp,0x10
 310067d:	83 ec 08             	sub    esp,0x8
 3100680:	50                   	push   eax
 3100681:	68 ea 15 10 03       	push   0x31015ea
 3100686:	e8 65 0c 00 00       	call   31012f0 <kShell+0x403>
 310068b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:227
    free(buf);
 310068e:	83 ec 0c             	sub    esp,0xc
 3100691:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100694:	e8 07 0e 00 00       	call   31014a0 <kShell+0x5b3>
 3100699:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:228
}
 310069c:	90                   	nop
 310069d:	c9                   	leave  
 310069e:	c3                   	ret    

0310069f <cmdSleep>:
cmdSleep():
/home/yogi/src/os/aproj/kshell/src/commands.c:231

void cmdSleep(char *cmdline)
{
 310069f:	55                   	push   ebp
 31006a0:	89 e5                	mov    ebp,esp
 31006a2:	53                   	push   ebx
 31006a3:	81 ec 24 05 00 00    	sub    esp,0x524
 31006a9:	89 e0                	mov    eax,esp
 31006ab:	89 c3                	mov    ebx,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:233
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 31006ad:	83 ec 04             	sub    esp,0x4
 31006b0:	68 00 05 00 00       	push   0x500
 31006b5:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 31006bb:	50                   	push   eax
 31006bc:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31006bf:	e8 92 01 00 00       	call   3100856 <parseParamsShell>
 31006c4:	83 c4 10             	add    esp,0x10
 31006c7:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:236

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
 31006ca:	c7 45 e8 a8 61 00 00 	mov    DWORD PTR [ebp-0x18],0x61a8
/home/yogi/src/os/aproj/kshell/src/commands.c:237
    int test[size];
 31006d1:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 31006d4:	8d 50 ff             	lea    edx,[eax-0x1]
 31006d7:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 31006da:	c1 e0 02             	shl    eax,0x2
 31006dd:	8d 50 03             	lea    edx,[eax+0x3]
 31006e0:	b8 10 00 00 00       	mov    eax,0x10
 31006e5:	83 e8 01             	sub    eax,0x1
 31006e8:	01 d0                	add    eax,edx
 31006ea:	b9 10 00 00 00       	mov    ecx,0x10
 31006ef:	ba 00 00 00 00       	mov    edx,0x0
 31006f4:	f7 f1                	div    ecx
 31006f6:	6b c0 10             	imul   eax,eax,0x10
 31006f9:	29 c4                	sub    esp,eax
 31006fb:	89 e0                	mov    eax,esp
 31006fd:	83 c0 03             	add    eax,0x3
 3100700:	c1 e8 02             	shr    eax,0x2
 3100703:	c1 e0 02             	shl    eax,0x2
 3100706:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:239
    
    for (int cnt=0;cnt<size;cnt++)
 3100709:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100710:	eb 10                	jmp    3100722 <cmdSleep+0x83>
/home/yogi/src/os/aproj/kshell/src/commands.c:240 (discriminator 3)
        test[cnt]=cnt;
 3100712:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100715:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100718:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 310071b:	89 0c 90             	mov    DWORD PTR [eax+edx*4],ecx
/home/yogi/src/os/aproj/kshell/src/commands.c:239 (discriminator 3)

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
 310071e:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:239 (discriminator 1)
 3100722:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100725:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 3100728:	7c e8                	jl     3100712 <cmdSleep+0x73>
/home/yogi/src/os/aproj/kshell/src/commands.c:242
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
 310072a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 3100731:	eb 22                	jmp    3100755 <cmdSleep+0xb6>
/home/yogi/src/os/aproj/kshell/src/commands.c:243
        if (test[cnt]!=cnt)
 3100733:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100736:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 3100739:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
 310073c:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 310073f:	74 10                	je     3100751 <cmdSleep+0xb2>
/home/yogi/src/os/aproj/kshell/src/commands.c:244
            printf("uh oh!");
 3100741:	83 ec 0c             	sub    esp,0xc
 3100744:	68 c8 16 10 03       	push   0x31016c8
 3100749:	e8 b2 0b 00 00       	call   3101300 <kShell+0x413>
 310074e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:242 (discriminator 2)
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
 3100751:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:242 (discriminator 1)
 3100755:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100758:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 310075b:	7c d6                	jl     3100733 <cmdSleep+0x94>
/home/yogi/src/os/aproj/kshell/src/commands.c:246
        if (test[cnt]!=cnt)
            printf("uh oh!");
    
    if (params[0][0]==0)
 310075d:	0f b6 85 e0 fa ff ff 	movzx  eax,BYTE PTR [ebp-0x520]
 3100764:	84 c0                	test   al,al
 3100766:	75 17                	jne    310077f <cmdSleep+0xe0>
/home/yogi/src/os/aproj/kshell/src/commands.c:248
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 3100768:	83 ec 0c             	sub    esp,0xc
 310076b:	68 d0 16 10 03       	push   0x31016d0
 3100770:	e8 7b 0b 00 00       	call   31012f0 <kShell+0x403>
 3100775:	83 c4 10             	add    esp,0x10
 3100778:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:249
        return;
 310077d:	eb 27                	jmp    31007a6 <cmdSleep+0x107>
/home/yogi/src/os/aproj/kshell/src/commands.c:252
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 310077f:	83 ec 04             	sub    esp,0x4
 3100782:	6a 0a                	push   0xa
 3100784:	6a 00                	push   0x0
 3100786:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 310078c:	50                   	push   eax
 310078d:	e8 de 0b 00 00       	call   3101370 <kShell+0x483>
 3100792:	83 c4 10             	add    esp,0x10
 3100795:	83 ec 0c             	sub    esp,0xc
 3100798:	50                   	push   eax
 3100799:	e8 b2 0b 00 00       	call   3101350 <kShell+0x463>
 310079e:	83 c4 10             	add    esp,0x10
 31007a1:	b8 01 00 00 00       	mov    eax,0x1
 31007a6:	89 dc                	mov    esp,ebx
 31007a8:	83 f8 01             	cmp    eax,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:253
}
 31007ab:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31007ae:	c9                   	leave  
 31007af:	c3                   	ret    

031007b0 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:26
void execInternalCommand(char lCommand[256]);
int findCommand(char* command);
char **buildargv (const char *input);

void execInternalCommand(char lCommand[256])
{
 31007b0:	55                   	push   ebp
 31007b1:	89 e5                	mov    ebp,esp
 31007b3:	53                   	push   ebx
 31007b4:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:27
    int i = findCommand(lCommand);
 31007b7:	83 ec 0c             	sub    esp,0xc
 31007ba:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31007bd:	e8 3d 02 00 00       	call   31009ff <findCommand>
 31007c2:	83 c4 10             	add    esp,0x10
 31007c5:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:29

    if(i>0)
 31007c8:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31007cc:	7e 74                	jle    3100842 <execInternalCommand+0x92>
/home/yogi/src/os/aproj/kshell/src/kshell.c:31
    {
        i--;
 31007ce:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:33
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 31007d2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31007d5:	c1 e0 04             	shl    eax,0x4
 31007d8:	05 48 22 10 03       	add    eax,0x3102248
 31007dd:	8b 00                	mov    eax,DWORD PTR [eax]
 31007df:	a3 34 27 10 03       	mov    ds:0x3102734,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:34
        command_function_p = cmds[i].function;
 31007e4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31007e7:	c1 e0 04             	shl    eax,0x4
 31007ea:	05 48 22 10 03       	add    eax,0x3102248
 31007ef:	8b 00                	mov    eax,DWORD PTR [eax]
 31007f1:	a3 20 27 10 03       	mov    ds:0x3102720,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:35
        if (cmds[i].paramCount==0)
 31007f6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31007f9:	c1 e0 04             	shl    eax,0x4
 31007fc:	05 4c 22 10 03       	add    eax,0x310224c
 3100801:	8b 00                	mov    eax,DWORD PTR [eax]
 3100803:	85 c0                	test   eax,eax
 3100805:	75 09                	jne    3100810 <execInternalCommand+0x60>
/home/yogi/src/os/aproj/kshell/src/kshell.c:36
            command_function();
 3100807:	a1 34 27 10 03       	mov    eax,ds:0x3102734
 310080c:	ff d0                	call   eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:47
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 310080e:	eb 40                	jmp    3100850 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:39
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
 3100810:	8b 1d 20 27 10 03    	mov    ebx,DWORD PTR ds:0x3102720
 3100816:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100819:	c1 e0 04             	shl    eax,0x4
 310081c:	05 40 22 10 03       	add    eax,0x3102240
 3100821:	8b 00                	mov    eax,DWORD PTR [eax]
 3100823:	83 ec 0c             	sub    esp,0xc
 3100826:	50                   	push   eax
 3100827:	e8 54 0c 00 00       	call   3101480 <kShell+0x593>
 310082c:	83 c4 10             	add    esp,0x10
 310082f:	8d 50 01             	lea    edx,[eax+0x1]
 3100832:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100835:	01 d0                	add    eax,edx
 3100837:	83 ec 0c             	sub    esp,0xc
 310083a:	50                   	push   eax
 310083b:	ff d3                	call   ebx
 310083d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:47
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 3100840:	eb 0e                	jmp    3100850 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:45
        }
    }
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
 3100842:	83 ec 0c             	sub    esp,0xc
 3100845:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100848:	e8 c5 fc ff ff       	call   3100512 <cmdExecp>
 310084d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:47
    }
}
 3100850:	90                   	nop
 3100851:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100854:	c9                   	leave  
 3100855:	c3                   	ret    

03100856 <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:50

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 3100856:	55                   	push   ebp
 3100857:	89 e5                	mov    ebp,esp
 3100859:	53                   	push   ebx
 310085a:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/aproj/kshell/src/kshell.c:51
    int x=0,y=0;
 310085d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100864:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:52
    int lRetVal=0,parsedChars=0;
 310086b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100872:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:53
    bool needDoubleQuotetoEndParam=0;
 3100879:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:55
    
    memset(params,0, size);
 310087d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100880:	83 ec 04             	sub    esp,0x4
 3100883:	50                   	push   eax
 3100884:	6a 00                	push   0x0
 3100886:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100889:	e8 92 0b 00 00       	call   3101420 <kShell+0x533>
 310088e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:57
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100891:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 3100898:	e9 24 01 00 00       	jmp    31009c1 <parseParamsShell+0x16b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:59
    {
        if(cmdLine[cnt]=='"')
 310089d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31008a0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31008a3:	01 d0                	add    eax,edx
 31008a5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31008a8:	3c 22                	cmp    al,0x22
 31008aa:	75 41                	jne    31008ed <parseParamsShell+0x97>
/home/yogi/src/os/aproj/kshell/src/kshell.c:61
        {
            if (!needDoubleQuotetoEndParam)
 31008ac:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 31008b0:	83 f0 01             	xor    eax,0x1
 31008b3:	84 c0                	test   al,al
 31008b5:	74 09                	je     31008c0 <parseParamsShell+0x6a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:63
            {
                needDoubleQuotetoEndParam=true;
 31008b7:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 31008bb:	e9 f9 00 00 00       	jmp    31009b9 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:67
            }
            else
            {
                params[y][x]='\0';
 31008c0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31008c3:	c1 e0 07             	shl    eax,0x7
 31008c6:	89 c2                	mov    edx,eax
 31008c8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31008cb:	01 c2                	add    edx,eax
 31008cd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31008d0:	01 d0                	add    eax,edx
 31008d2:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:68
                {x=0;y++;lRetVal++;}
 31008d5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31008dc:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31008e0:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:69
                needDoubleQuotetoEndParam=false;
 31008e4:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 31008e8:	e9 cc 00 00 00       	jmp    31009b9 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 31008ed:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31008f0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31008f3:	01 d0                	add    eax,edx
 31008f5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31008f8:	3c 20                	cmp    al,0x20
 31008fa:	74 1e                	je     310091a <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72 (discriminator 2)
 31008fc:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31008ff:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100902:	01 d0                	add    eax,edx
 3100904:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100907:	3c 2d                	cmp    al,0x2d
 3100909:	74 0f                	je     310091a <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72 (discriminator 4)
 310090b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310090e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100911:	01 d0                	add    eax,edx
 3100913:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100916:	3c 2c                	cmp    al,0x2c
 3100918:	75 7a                	jne    3100994 <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72 (discriminator 5)
 310091a:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 310091e:	83 f0 01             	xor    eax,0x1
 3100921:	84 c0                	test   al,al
 3100923:	74 6f                	je     3100994 <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:75
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 3100925:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100928:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310092b:	01 d0                	add    eax,edx
 310092d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100930:	3c 2d                	cmp    al,0x2d
 3100932:	74 0f                	je     3100943 <parseParamsShell+0xed>
/home/yogi/src/os/aproj/kshell/src/kshell.c:75 (discriminator 1)
 3100934:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100937:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310093a:	01 d0                	add    eax,edx
 310093c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310093f:	3c 2f                	cmp    al,0x2f
 3100941:	75 25                	jne    3100968 <parseParamsShell+0x112>
/home/yogi/src/os/aproj/kshell/src/kshell.c:76
                params[y][x++]=cmdLine[cnt];
 3100943:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100946:	c1 e0 07             	shl    eax,0x7
 3100949:	89 c2                	mov    edx,eax
 310094b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310094e:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100951:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100954:	8d 50 01             	lea    edx,[eax+0x1]
 3100957:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310095a:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 310095d:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 3100960:	01 da                	add    edx,ebx
 3100962:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100965:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:77
            params[y][x]='\0';
 3100968:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310096b:	c1 e0 07             	shl    eax,0x7
 310096e:	89 c2                	mov    edx,eax
 3100970:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100973:	01 c2                	add    edx,eax
 3100975:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100978:	01 d0                	add    eax,edx
 310097a:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:78
            if (cnt>0)
 310097d:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 3100981:	74 36                	je     31009b9 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:79
                {x=0;y++;lRetVal++;}
 3100983:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310098a:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 310098e:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:78
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 3100992:	eb 25                	jmp    31009b9 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:84
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 3100994:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100997:	c1 e0 07             	shl    eax,0x7
 310099a:	89 c2                	mov    edx,eax
 310099c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310099f:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31009a2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31009a5:	8d 50 01             	lea    edx,[eax+0x1]
 31009a8:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31009ab:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31009ae:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 31009b1:	01 da                	add    edx,ebx
 31009b3:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31009b6:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:86 (discriminator 2)
        }
        parsedChars++;
 31009b9:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:57 (discriminator 2)
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31009bd:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:57 (discriminator 1)
 31009c1:	83 ec 0c             	sub    esp,0xc
 31009c4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31009c7:	e8 b4 0a 00 00       	call   3101480 <kShell+0x593>
 31009cc:	83 c4 10             	add    esp,0x10
 31009cf:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 31009d2:	0f 87 c5 fe ff ff    	ja     310089d <parseParamsShell+0x47>
/home/yogi/src/os/aproj/kshell/src/kshell.c:88
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 31009d8:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31009dc:	74 19                	je     31009f7 <parseParamsShell+0x1a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:90
    {
        lRetVal++;
 31009de:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:91
        params[y][x]='\0';
 31009e2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31009e5:	c1 e0 07             	shl    eax,0x7
 31009e8:	89 c2                	mov    edx,eax
 31009ea:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31009ed:	01 c2                	add    edx,eax
 31009ef:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31009f2:	01 d0                	add    eax,edx
 31009f4:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:96
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 31009f7:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/aproj/kshell/src/kshell.c:97
}
 31009fa:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31009fd:	c9                   	leave  
 31009fe:	c3                   	ret    

031009ff <findCommand>:
findCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:100

int findCommand(char* command)
{
 31009ff:	55                   	push   ebp
 3100a00:	89 e5                	mov    ebp,esp
 3100a02:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:104
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100a05:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100a0c:	eb 4d                	jmp    3100a5b <findCommand+0x5c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:106
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3100a0e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a11:	c1 e0 04             	shl    eax,0x4
 3100a14:	05 40 22 10 03       	add    eax,0x3102240
 3100a19:	8b 00                	mov    eax,DWORD PTR [eax]
 3100a1b:	83 ec 0c             	sub    esp,0xc
 3100a1e:	50                   	push   eax
 3100a1f:	e8 5c 0a 00 00       	call   3101480 <kShell+0x593>
 3100a24:	83 c4 10             	add    esp,0x10
 3100a27:	89 c2                	mov    edx,eax
 3100a29:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a2c:	c1 e0 04             	shl    eax,0x4
 3100a2f:	05 40 22 10 03       	add    eax,0x3102240
 3100a34:	8b 00                	mov    eax,DWORD PTR [eax]
 3100a36:	83 ec 04             	sub    esp,0x4
 3100a39:	52                   	push   edx
 3100a3a:	50                   	push   eax
 3100a3b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100a3e:	e8 8d 09 00 00       	call   31013d0 <kShell+0x4e3>
 3100a43:	83 c4 10             	add    esp,0x10
 3100a46:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:108
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 3100a49:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100a4d:	75 08                	jne    3100a57 <findCommand+0x58>
/home/yogi/src/os/aproj/kshell/src/kshell.c:111
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 3100a4f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a52:	83 c0 01             	add    eax,0x1
 3100a55:	eb 0f                	jmp    3100a66 <findCommand+0x67>
/home/yogi/src/os/aproj/kshell/src/kshell.c:104 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100a57:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:104 (discriminator 1)
 3100a5b:	83 7d f4 09          	cmp    DWORD PTR [ebp-0xc],0x9
 3100a5f:	76 ad                	jbe    3100a0e <findCommand+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:115
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 3100a61:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:116
}
 3100a66:	c9                   	leave  
 3100a67:	c3                   	ret    

03100a68 <buildargv>:
buildargv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:120

/*parts from http://*/
char **buildargv (const char *input)
{
 3100a68:	55                   	push   ebp
 3100a69:	89 e5                	mov    ebp,esp
 3100a6b:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:123
  char *arg;
  char *copybuf;
  int squote = 0;
 3100a6e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:124
  int dquote = 0;
 3100a75:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:125
  int bsquote = 0;
 3100a7c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:126
  int argc = 0;
 3100a83:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:127
  int maxargc = 0;
 3100a8a:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:128
  char **argv = NULL;
 3100a91:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:132
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 3100a98:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 3100a9c:	0f 84 33 02 00 00    	je     3100cd5 <buildargv+0x26d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:135
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 3100aa2:	83 ec 0c             	sub    esp,0xc
 3100aa5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100aa8:	e8 d3 09 00 00       	call   3101480 <kShell+0x593>
 3100aad:	83 c4 10             	add    esp,0x10
 3100ab0:	83 c0 01             	add    eax,0x1
 3100ab3:	83 ec 0c             	sub    esp,0xc
 3100ab6:	50                   	push   eax
 3100ab7:	e8 84 08 00 00       	call   3101340 <kShell+0x453>
 3100abc:	83 c4 10             	add    esp,0x10
 3100abf:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:143
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 3100ac2:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 3100ac6:	74 0b                	je     3100ad3 <buildargv+0x6b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:143 (discriminator 1)
 3100ac8:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100acb:	83 e8 01             	sub    eax,0x1
 3100ace:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100ad1:	7f 3d                	jg     3100b10 <buildargv+0xa8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:146
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 3100ad3:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 3100ad7:	75 1c                	jne    3100af5 <buildargv+0x8d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:148
		{
		  maxargc = INITIAL_MAXARGC;
 3100ad9:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:149
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 3100ae0:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100ae3:	c1 e0 02             	shl    eax,0x2
 3100ae6:	83 ec 0c             	sub    esp,0xc
 3100ae9:	50                   	push   eax
 3100aea:	e8 51 08 00 00       	call   3101340 <kShell+0x453>
 3100aef:	83 c4 10             	add    esp,0x10
 3100af2:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:151
		}
	      argv = nargv;
 3100af5:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 3100af8:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:152
	      argv[argc] = NULL;
 3100afb:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100afe:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100b05:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100b08:	01 d0                	add    eax,edx
 3100b0a:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:155
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 3100b10:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100b13:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:156
	  while (*input != EOS)
 3100b16:	e9 ec 00 00 00       	jmp    3100c07 <buildargv+0x19f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100b1b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b1e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b21:	3c 20                	cmp    al,0x20
 3100b23:	75 16                	jne    3100b3b <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158 (discriminator 1)
 3100b25:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100b29:	75 10                	jne    3100b3b <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158 (discriminator 2)
 3100b2b:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100b2f:	75 0a                	jne    3100b3b <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158 (discriminator 3)
 3100b31:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100b35:	0f 84 da 00 00 00    	je     3100c15 <buildargv+0x1ad>
/home/yogi/src/os/aproj/kshell/src/kshell.c:164
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100b3b:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100b3f:	74 1d                	je     3100b5e <buildargv+0xf6>
/home/yogi/src/os/aproj/kshell/src/kshell.c:166
		    {
		      bsquote = 0;
 3100b41:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:167
		      *arg++ = *input;
 3100b48:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100b4b:	8d 50 01             	lea    edx,[eax+0x1]
 3100b4e:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100b51:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100b54:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100b57:	88 10                	mov    BYTE PTR [eax],dl
 3100b59:	e9 a5 00 00 00       	jmp    3100c03 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:169
		    }
		  else if (*input == '\\')
 3100b5e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b61:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b64:	3c 5c                	cmp    al,0x5c
 3100b66:	75 0c                	jne    3100b74 <buildargv+0x10c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:171
		    {
		      bsquote = 1;
 3100b68:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 3100b6f:	e9 8f 00 00 00       	jmp    3100c03 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:173
		    }
		  else if (squote)
 3100b74:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100b78:	74 26                	je     3100ba0 <buildargv+0x138>
/home/yogi/src/os/aproj/kshell/src/kshell.c:175
		    {
		      if (*input == '\'')
 3100b7a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b7d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b80:	3c 27                	cmp    al,0x27
 3100b82:	75 09                	jne    3100b8d <buildargv+0x125>
/home/yogi/src/os/aproj/kshell/src/kshell.c:177
			{
			  squote = 0;
 3100b84:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100b8b:	eb 76                	jmp    3100c03 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:181
			}
		      else
			{
			  *arg++ = *input;
 3100b8d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100b90:	8d 50 01             	lea    edx,[eax+0x1]
 3100b93:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100b96:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100b99:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100b9c:	88 10                	mov    BYTE PTR [eax],dl
 3100b9e:	eb 63                	jmp    3100c03 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:184
			}
		    }
		  else if (dquote)
 3100ba0:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100ba4:	74 26                	je     3100bcc <buildargv+0x164>
/home/yogi/src/os/aproj/kshell/src/kshell.c:186
		    {
		      if (*input == '"')
 3100ba6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100ba9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100bac:	3c 22                	cmp    al,0x22
 3100bae:	75 09                	jne    3100bb9 <buildargv+0x151>
/home/yogi/src/os/aproj/kshell/src/kshell.c:188
			{
			  dquote = 0;
 3100bb0:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 3100bb7:	eb 4a                	jmp    3100c03 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:192
			}
		      else
			{
			  *arg++ = *input;
 3100bb9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bbc:	8d 50 01             	lea    edx,[eax+0x1]
 3100bbf:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100bc2:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100bc5:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100bc8:	88 10                	mov    BYTE PTR [eax],dl
 3100bca:	eb 37                	jmp    3100c03 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:197
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100bcc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100bcf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100bd2:	3c 27                	cmp    al,0x27
 3100bd4:	75 09                	jne    3100bdf <buildargv+0x177>
/home/yogi/src/os/aproj/kshell/src/kshell.c:199
			{
			  squote = 1;
 3100bd6:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100bdd:	eb 24                	jmp    3100c03 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:201
			}
		      else if (*input == '"')
 3100bdf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100be2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100be5:	3c 22                	cmp    al,0x22
 3100be7:	75 09                	jne    3100bf2 <buildargv+0x18a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:203
			{
			  dquote = 1;
 3100be9:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 3100bf0:	eb 11                	jmp    3100c03 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:207
			}
		      else
			{
			  *arg++ = *input;
 3100bf2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bf5:	8d 50 01             	lea    edx,[eax+0x1]
 3100bf8:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100bfb:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100bfe:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100c01:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:211
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 3100c03:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:156
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 3100c07:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100c0a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c0d:	84 c0                	test   al,al
 3100c0f:	0f 85 06 ff ff ff    	jne    3100b1b <buildargv+0xb3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:214
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3100c15:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c18:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:216
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100c1b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100c1e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c21:	84 c0                	test   al,al
 3100c23:	0f 84 9e 00 00 00    	je     3100cc7 <buildargv+0x25f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:218
          {
            char* temp=malloc(strlen(copybuf)+1);
 3100c29:	83 ec 0c             	sub    esp,0xc
 3100c2c:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c2f:	e8 4c 08 00 00       	call   3101480 <kShell+0x593>
 3100c34:	83 c4 10             	add    esp,0x10
 3100c37:	83 c0 01             	add    eax,0x1
 3100c3a:	83 ec 0c             	sub    esp,0xc
 3100c3d:	50                   	push   eax
 3100c3e:	e8 fd 06 00 00       	call   3101340 <kShell+0x453>
 3100c43:	83 c4 10             	add    esp,0x10
 3100c46:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:221
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3100c49:	83 ec 08             	sub    esp,0x8
 3100c4c:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c4f:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100c52:	e8 79 06 00 00       	call   31012d0 <kShell+0x3e3>
 3100c57:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:222
            free(copybuf);
 3100c5a:	83 ec 0c             	sub    esp,0xc
 3100c5d:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c60:	e8 3b 08 00 00       	call   31014a0 <kShell+0x5b3>
 3100c65:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:223
            copybuf = (char *) malloc (strlen (input) + 1);
 3100c68:	83 ec 0c             	sub    esp,0xc
 3100c6b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100c6e:	e8 0d 08 00 00       	call   3101480 <kShell+0x593>
 3100c73:	83 c4 10             	add    esp,0x10
 3100c76:	83 c0 01             	add    eax,0x1
 3100c79:	83 ec 0c             	sub    esp,0xc
 3100c7c:	50                   	push   eax
 3100c7d:	e8 be 06 00 00       	call   3101340 <kShell+0x453>
 3100c82:	83 c4 10             	add    esp,0x10
 3100c85:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:224
            argv[argc] = temp;
 3100c88:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100c8b:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100c92:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100c95:	01 c2                	add    edx,eax
 3100c97:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100c9a:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:226
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 3100c9c:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:227
            argv[argc] = NULL;
 3100ca0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100ca3:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100caa:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100cad:	01 d0                	add    eax,edx
 3100caf:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:228
            input++;
 3100cb5:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:229
            free(temp);
 3100cb9:	83 ec 0c             	sub    esp,0xc
 3100cbc:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100cbf:	e8 dc 07 00 00       	call   31014a0 <kShell+0x5b3>
 3100cc4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:232
          }
	}
      while (*input != EOS);
 3100cc7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100cca:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100ccd:	84 c0                	test   al,al
 3100ccf:	0f 85 ed fd ff ff    	jne    3100ac2 <buildargv+0x5a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:235
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 3100cd5:	83 ec 0c             	sub    esp,0xc
 3100cd8:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100cdb:	e8 c0 07 00 00       	call   31014a0 <kShell+0x5b3>
 3100ce0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:236
  free(nargv);
 3100ce3:	83 ec 0c             	sub    esp,0xc
 3100ce6:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100ce9:	e8 b2 07 00 00       	call   31014a0 <kShell+0x5b3>
 3100cee:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:237
  return (argv);
 3100cf1:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/kshell/src/kshell.c:238
}
 3100cf4:	c9                   	leave  
 3100cf5:	c3                   	ret    

03100cf6 <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:241

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
 3100cf6:	55                   	push   ebp
 3100cf7:	89 e5                	mov    ebp,esp
 3100cf9:	53                   	push   ebx
 3100cfa:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:242
    for (int cnt=0;cnt<pcount;cnt++)
 3100cfd:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100d04:	eb 56                	jmp    3100d5c <paramsToArgv+0x66>
/home/yogi/src/os/aproj/kshell/src/kshell.c:244 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 3100d06:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d09:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100d10:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100d13:	8d 1c 02             	lea    ebx,[edx+eax*1]
 3100d16:	83 ec 0c             	sub    esp,0xc
 3100d19:	68 80 00 00 00       	push   0x80
 3100d1e:	e8 1d 06 00 00       	call   3101340 <kShell+0x453>
 3100d23:	83 c4 10             	add    esp,0x10
 3100d26:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:245 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 3100d28:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d2b:	c1 e0 07             	shl    eax,0x7
 3100d2e:	89 c2                	mov    edx,eax
 3100d30:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100d33:	01 c2                	add    edx,eax
 3100d35:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d38:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 3100d3f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100d42:	01 c8                	add    eax,ecx
 3100d44:	8b 00                	mov    eax,DWORD PTR [eax]
 3100d46:	83 ec 04             	sub    esp,0x4
 3100d49:	68 80 00 00 00       	push   0x80
 3100d4e:	52                   	push   edx
 3100d4f:	50                   	push   eax
 3100d50:	e8 db 05 00 00       	call   3101330 <kShell+0x443>
 3100d55:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:242 (discriminator 3)
  return (argv);
}

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100d58:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:242 (discriminator 1)
 3100d5c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d5f:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100d62:	7c a2                	jl     3100d06 <paramsToArgv+0x10>
/home/yogi/src/os/aproj/kshell/src/kshell.c:247
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 3100d64:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
/home/yogi/src/os/aproj/kshell/src/kshell.c:248
}
 3100d67:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100d6a:	c9                   	leave  
 3100d6b:	c3                   	ret    

03100d6c <freeArgV>:
freeArgV():
/home/yogi/src/os/aproj/kshell/src/kshell.c:251

void freeArgV(int pcount, char **params)
{
 3100d6c:	55                   	push   ebp
 3100d6d:	89 e5                	mov    ebp,esp
 3100d6f:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:252
    for (int cnt=0;cnt<pcount;cnt++)
 3100d72:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100d79:	eb 15                	jmp    3100d90 <freeArgV+0x24>
/home/yogi/src/os/aproj/kshell/src/kshell.c:253 (discriminator 3)
        free(*params);
 3100d7b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100d7e:	8b 00                	mov    eax,DWORD PTR [eax]
 3100d80:	83 ec 0c             	sub    esp,0xc
 3100d83:	50                   	push   eax
 3100d84:	e8 17 07 00 00       	call   31014a0 <kShell+0x5b3>
 3100d89:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:252 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100d8c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:252 (discriminator 1)
 3100d90:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d93:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100d96:	7c e3                	jl     3100d7b <freeArgV+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:254
        free(*params);
    free(params);
 3100d98:	83 ec 0c             	sub    esp,0xc
 3100d9b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100d9e:	e8 fd 06 00 00       	call   31014a0 <kShell+0x5b3>
 3100da3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:255
}
 3100da6:	90                   	nop
 3100da7:	c9                   	leave  
 3100da8:	c3                   	ret    

03100da9 <getEnvVariableValue>:
getEnvVariableValue():
/home/yogi/src/os/aproj/kshell/src/kshell.c:258

bool getEnvVariableValue(char* evName, char* value)
{
 3100da9:	55                   	push   ebp
 3100daa:	89 e5                	mov    ebp,esp
 3100dac:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:260
    
    for (int cnt=0;cnt<50;cnt++)
 3100daf:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100db6:	eb 70                	jmp    3100e28 <getEnvVariableValue+0x7f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:262
    {
        if (environmentLoc[cnt]!=0)
 3100db8:	a1 0c 24 10 03       	mov    eax,ds:0x310240c
 3100dbd:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100dc0:	c1 e2 02             	shl    edx,0x2
 3100dc3:	01 d0                	add    eax,edx
 3100dc5:	8b 00                	mov    eax,DWORD PTR [eax]
 3100dc7:	85 c0                	test   eax,eax
 3100dc9:	74 59                	je     3100e24 <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:264
        {
            char* idx = strstr((char*)environmentLoc[cnt],evName);
 3100dcb:	a1 0c 24 10 03       	mov    eax,ds:0x310240c
 3100dd0:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100dd3:	c1 e2 02             	shl    edx,0x2
 3100dd6:	01 d0                	add    eax,edx
 3100dd8:	8b 00                	mov    eax,DWORD PTR [eax]
 3100dda:	83 ec 08             	sub    esp,0x8
 3100ddd:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100de0:	50                   	push   eax
 3100de1:	e8 ca 05 00 00       	call   31013b0 <kShell+0x4c3>
 3100de6:	83 c4 10             	add    esp,0x10
 3100de9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:265
            if (idx>0)
 3100dec:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100df0:	74 32                	je     3100e24 <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:267
            {
                idx = strstr(idx,"=");
 3100df2:	83 ec 08             	sub    esp,0x8
 3100df5:	68 45 18 10 03       	push   0x3101845
 3100dfa:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100dfd:	e8 ae 05 00 00       	call   31013b0 <kShell+0x4c3>
 3100e02:	83 c4 10             	add    esp,0x10
 3100e05:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:269
                //++ because we don't want to include the = sign
                strcpy(value, ++idx);
 3100e08:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100e0c:	83 ec 08             	sub    esp,0x8
 3100e0f:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100e12:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100e15:	e8 b6 04 00 00       	call   31012d0 <kShell+0x3e3>
 3100e1a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:271
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
 3100e1d:	b8 01 00 00 00       	mov    eax,0x1
 3100e22:	eb 0f                	jmp    3100e33 <getEnvVariableValue+0x8a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:260 (discriminator 2)
}

bool getEnvVariableValue(char* evName, char* value)
{
    
    for (int cnt=0;cnt<50;cnt++)
 3100e24:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:260 (discriminator 1)
 3100e28:	83 7d f4 31          	cmp    DWORD PTR [ebp-0xc],0x31
 3100e2c:	7e 8a                	jle    3100db8 <getEnvVariableValue+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:275
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
            }
        }
    } 
    return false;
 3100e2e:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:276
}
 3100e33:	c9                   	leave  
 3100e34:	c3                   	ret    

03100e35 <saveCommand>:
saveCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:289
    
}
*/

void saveCommand(char* command)
{
 3100e35:	55                   	push   ebp
 3100e36:	89 e5                	mov    ebp,esp
 3100e38:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:290
    strcpy(commandHistory[commandHistoryMax++],command);
 3100e3b:	a1 5c 27 10 03       	mov    eax,ds:0x310275c
 3100e40:	8d 50 01             	lea    edx,[eax+0x1]
 3100e43:	89 15 5c 27 10 03    	mov    DWORD PTR ds:0x310275c,edx
 3100e49:	c1 e0 07             	shl    eax,0x7
 3100e4c:	05 60 27 10 03       	add    eax,0x3102760
 3100e51:	83 ec 08             	sub    esp,0x8
 3100e54:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100e57:	50                   	push   eax
 3100e58:	e8 73 04 00 00       	call   31012d0 <kShell+0x3e3>
 3100e5d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:291
}
 3100e60:	90                   	nop
 3100e61:	c9                   	leave  
 3100e62:	c3                   	ret    

03100e63 <prompt>:
prompt():
/home/yogi/src/os/aproj/kshell/src/kshell.c:294

void prompt()
{
 3100e63:	55                   	push   ebp
 3100e64:	89 e5                	mov    ebp,esp
 3100e66:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:295
    print("%s %s> ",sExecutingProgram, cwd);
 3100e69:	83 ec 04             	sub    esp,0x4
 3100e6c:	68 20 24 10 03       	push   0x3102420
 3100e71:	68 20 25 10 03       	push   0x3102520
 3100e76:	68 47 18 10 03       	push   0x3101847
 3100e7b:	e8 70 04 00 00       	call   31012f0 <kShell+0x403>
 3100e80:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:296
}
 3100e83:	90                   	nop
 3100e84:	c9                   	leave  
 3100e85:	c3                   	ret    

03100e86 <reprintCommand>:
reprintCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:299

int reprintCommand(char* command)
{
 3100e86:	55                   	push   ebp
 3100e87:	89 e5                	mov    ebp,esp
 3100e89:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:300
    resetRow();
 3100e8c:	e8 7f 04 00 00       	call   3101310 <kShell+0x423>
/home/yogi/src/os/aproj/kshell/src/kshell.c:301
    prompt();
 3100e91:	e8 cd ff ff ff       	call   3100e63 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:302
    print("%s",command);
 3100e96:	83 ec 08             	sub    esp,0x8
 3100e99:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100e9c:	68 4f 18 10 03       	push   0x310184f
 3100ea1:	e8 4a 04 00 00       	call   31012f0 <kShell+0x403>
 3100ea6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:304
 
}
 3100ea9:	90                   	nop
 3100eaa:	c9                   	leave  
 3100eab:	c3                   	ret    

03100eac <handleSignals>:
handleSignals():
/home/yogi/src/os/aproj/kshell/src/kshell.c:307

int handleSignals(int signal)
{
 3100eac:	55                   	push   ebp
 3100ead:	89 e5                	mov    ebp,esp
/home/yogi/src/os/aproj/kshell/src/kshell.c:308
    switch (signal)
 3100eaf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100eb2:	83 f8 08             	cmp    eax,0x8
 3100eb5:	75 08                	jne    3100ebf <handleSignals+0x13>
/home/yogi/src/os/aproj/kshell/src/kshell.c:311
    {
        case SIGINT:
            bSigIntReceived = true;
 3100eb7:	c6 05 00 24 10 03 01 	mov    BYTE PTR ds:0x3102400,0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:312
            break;
 3100ebe:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:314
    }
}
 3100ebf:	90                   	nop
 3100ec0:	5d                   	pop    ebp
 3100ec1:	c3                   	ret    

03100ec2 <processSignal>:
processSignal():
/home/yogi/src/os/aproj/kshell/src/kshell.c:317

void processSignal(int signal)
{
 3100ec2:	55                   	push   ebp
 3100ec3:	89 e5                	mov    ebp,esp
 3100ec5:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:318
    switch (signal)
 3100ec8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100ecb:	83 f8 08             	cmp    eax,0x8
 3100ece:	74 02                	je     3100ed2 <processSignal+0x10>
/home/yogi/src/os/aproj/kshell/src/kshell.c:325
        case SIGINT:
            printf("^C\n");
            bSigIntReceived = false;
            break;
    }
}
 3100ed0:	eb 18                	jmp    3100eea <processSignal+0x28>
/home/yogi/src/os/aproj/kshell/src/kshell.c:321
void processSignal(int signal)
{
    switch (signal)
    {
        case SIGINT:
            printf("^C\n");
 3100ed2:	83 ec 0c             	sub    esp,0xc
 3100ed5:	68 52 18 10 03       	push   0x3101852
 3100eda:	e8 21 04 00 00       	call   3101300 <kShell+0x413>
 3100edf:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:322
            bSigIntReceived = false;
 3100ee2:	c6 05 00 24 10 03 00 	mov    BYTE PTR ds:0x3102400,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:323
            break;
 3100ee9:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:325
    }
}
 3100eea:	90                   	nop
 3100eeb:	c9                   	leave  
 3100eec:	c3                   	ret    

03100eed <kShell>:
kShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:328

int kShell(int argc, char** argv, char** envp)
{
 3100eed:	55                   	push   ebp
 3100eee:	89 e5                	mov    ebp,esp
 3100ef0:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:329
    uint8_t lCurrKey=0;
 3100ef3:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:330
    int lCurrKeyCount=0;
 3100ef7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:331
    int commandWasFromThisBufferPtr=0;
 3100efe:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:334
    char ansiSeq[20];

    bSigIntReceived = false;
 3100f05:	c6 05 00 24 10 03 00 	mov    BYTE PTR ds:0x3102400,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:335
    exitCode = 0;
 3100f0c:	c7 05 48 27 10 03 00 	mov    DWORD PTR ds:0x3102748,0x0
 3100f13:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/kshell.c:336
    timeToExit = false;
 3100f16:	c6 05 54 27 10 03 00 	mov    BYTE PTR ds:0x3102754,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:337
    strcpy(delim," \t\n-,");
 3100f1d:	83 ec 08             	sub    esp,0x8
 3100f20:	68 56 18 10 03       	push   0x3101856
 3100f25:	68 04 24 10 03       	push   0x3102404
 3100f2a:	e8 a1 03 00 00       	call   31012d0 <kShell+0x3e3>
 3100f2f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:338
    environmentLoc = envp;
 3100f32:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100f35:	a3 0c 24 10 03       	mov    ds:0x310240c,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:339
    ansiSeq[0]=0x1b;
 3100f3a:	c6 45 d7 1b          	mov    BYTE PTR [ebp-0x29],0x1b
/home/yogi/src/os/aproj/kshell/src/kshell.c:340
    sKShellProgramName=malloc(1024);
 3100f3e:	83 ec 0c             	sub    esp,0xc
 3100f41:	68 00 04 00 00       	push   0x400
 3100f46:	e8 f5 03 00 00       	call   3101340 <kShell+0x453>
 3100f4b:	83 c4 10             	add    esp,0x10
 3100f4e:	a3 4c 27 10 03       	mov    ds:0x310274c,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:341
    strcpy(sKShellProgramName,"kShell");
 3100f53:	a1 4c 27 10 03       	mov    eax,ds:0x310274c
 3100f58:	83 ec 08             	sub    esp,0x8
 3100f5b:	68 5c 18 10 03       	push   0x310185c
 3100f60:	50                   	push   eax
 3100f61:	e8 6a 03 00 00       	call   31012d0 <kShell+0x3e3>
 3100f66:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:342
    strcpy(sExecutingProgram,sKShellProgramName);
 3100f69:	a1 4c 27 10 03       	mov    eax,ds:0x310274c
 3100f6e:	83 ec 08             	sub    esp,0x8
 3100f71:	50                   	push   eax
 3100f72:	68 20 25 10 03       	push   0x3102520
 3100f77:	e8 54 03 00 00       	call   31012d0 <kShell+0x3e3>
 3100f7c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:345
    //puts("\nWelcome to kShell ... hang a while!\n");

    modifySignal(SIGINT, handleSignals, SIGINT);
 3100f7f:	83 ec 04             	sub    esp,0x4
 3100f82:	6a 08                	push   0x8
 3100f84:	68 ac 0e 10 03       	push   0x3100eac
 3100f89:	6a 08                	push   0x8
 3100f8b:	e8 c0 04 00 00       	call   3101450 <kShell+0x563>
 3100f90:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:347
    
    while (!timeToExit)
 3100f93:	e9 f6 02 00 00       	jmp    310128e <kShell+0x3a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:350
    {
getACommand:
        commandHistoryPtr = commandHistoryMax;
 3100f98:	a1 5c 27 10 03       	mov    eax,ds:0x310275c
 3100f9d:	a3 58 27 10 03       	mov    ds:0x3102758,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:351
        commandWasFromThisBufferPtr = -1;
 3100fa2:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:352
        lCurrKey=0;
 3100fa9:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:353
        lCurrKeyCount=0;
 3100fad:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:354
        memset(lCommand,0,256);
 3100fb4:	83 ec 04             	sub    esp,0x4
 3100fb7:	68 00 01 00 00       	push   0x100
 3100fbc:	6a 00                	push   0x0
 3100fbe:	68 60 21 11 03       	push   0x3112160
 3100fc3:	e8 58 04 00 00       	call   3101420 <kShell+0x533>
 3100fc8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:355
        getenv("CWD",cwd);
 3100fcb:	83 ec 08             	sub    esp,0x8
 3100fce:	68 20 24 10 03       	push   0x3102420
 3100fd3:	68 63 18 10 03       	push   0x3101863
 3100fd8:	e8 43 03 00 00       	call   3101320 <kShell+0x433>
 3100fdd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:356
        prompt();
 3100fe0:	e8 7e fe ff ff       	call   3100e63 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:358
getAKey:
        lCurrKey=0;
 3100fe5:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:359
        while(lCurrKey==0)
 3100fe9:	eb 3d                	jmp    3101028 <kShell+0x13b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:361
        {
            read(STDIN, &lCurrKey, 1, 1); //Reading from STDIN blocks until a key is available
 3100feb:	6a 01                	push   0x1
 3100fed:	6a 01                	push   0x1
 3100fef:	8d 45 eb             	lea    eax,[ebp-0x15]
 3100ff2:	50                   	push   eax
 3100ff3:	6a 00                	push   0x0
 3100ff5:	e8 c6 03 00 00       	call   31013c0 <kShell+0x4d3>
 3100ffa:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:363
//            gets(&lCurrKey,1,1);
            if (bSigIntReceived)
 3100ffd:	0f b6 05 00 24 10 03 	movzx  eax,BYTE PTR ds:0x3102400
 3101004:	84 c0                	test   al,al
 3101006:	74 20                	je     3101028 <kShell+0x13b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:365
            {
                processSignal(SIGINT);
 3101008:	83 ec 0c             	sub    esp,0xc
 310100b:	6a 08                	push   0x8
 310100d:	e8 b0 fe ff ff       	call   3100ec2 <processSignal>
 3101012:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:366
                lCommand[0] = 0x0;
 3101015:	c6 05 60 21 11 03 00 	mov    BYTE PTR ds:0x3112160,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:367
                lCurrKeyCount = 0;
 310101c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:368
                prompt();
 3101023:	e8 3b fe ff ff       	call   3100e63 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:359
        memset(lCommand,0,256);
        getenv("CWD",cwd);
        prompt();
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 3101028:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 310102c:	84 c0                	test   al,al
 310102e:	74 bb                	je     3100feb <kShell+0xfe>
/home/yogi/src/os/aproj/kshell/src/kshell.c:372
                lCurrKeyCount = 0;
                prompt();
            }
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3101030:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 3101034:	3c c8                	cmp    al,0xc8
 3101036:	0f 85 91 00 00 00    	jne    31010cd <kShell+0x1e0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:374
        {
            if (commandHistoryPtr>=0)
 310103c:	a1 58 27 10 03       	mov    eax,ds:0x3102758
 3101041:	85 c0                	test   eax,eax
 3101043:	78 a0                	js     3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:377
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
 3101045:	a1 58 27 10 03       	mov    eax,ds:0x3102758
 310104a:	83 e8 01             	sub    eax,0x1
 310104d:	85 c0                	test   eax,eax
 310104f:	78 94                	js     3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:379
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
 3101051:	a1 58 27 10 03       	mov    eax,ds:0x3102758
 3101056:	83 e8 01             	sub    eax,0x1
 3101059:	a3 58 27 10 03       	mov    ds:0x3102758,eax
 310105e:	a1 58 27 10 03       	mov    eax,ds:0x3102758
 3101063:	c1 e0 07             	shl    eax,0x7
 3101066:	05 60 27 10 03       	add    eax,0x3102760
 310106b:	83 ec 08             	sub    esp,0x8
 310106e:	50                   	push   eax
 310106f:	68 60 21 11 03       	push   0x3112160
 3101074:	e8 57 02 00 00       	call   31012d0 <kShell+0x3e3>
 3101079:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:380
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 310107c:	a1 58 27 10 03       	mov    eax,ds:0x3102758
 3101081:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:381
                    while (lCurrKeyCount>0)
 3101084:	eb 14                	jmp    310109a <kShell+0x1ad>
/home/yogi/src/os/aproj/kshell/src/kshell.c:383
                    {
                        printf(KEY_BACKSPACE);
 3101086:	83 ec 0c             	sub    esp,0xc
 3101089:	68 67 18 10 03       	push   0x3101867
 310108e:	e8 6d 02 00 00       	call   3101300 <kShell+0x413>
 3101093:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:384
                        lCurrKeyCount--;
 3101096:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:381
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 310109a:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 310109e:	7f e6                	jg     3101086 <kShell+0x199>
/home/yogi/src/os/aproj/kshell/src/kshell.c:386
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 31010a0:	83 ec 08             	sub    esp,0x8
 31010a3:	68 60 21 11 03       	push   0x3112160
 31010a8:	68 4f 18 10 03       	push   0x310184f
 31010ad:	e8 4e 02 00 00       	call   3101300 <kShell+0x413>
 31010b2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:387
                    lCurrKeyCount=strlen(lCommand);
 31010b5:	83 ec 0c             	sub    esp,0xc
 31010b8:	68 60 21 11 03       	push   0x3112160
 31010bd:	e8 be 03 00 00       	call   3101480 <kShell+0x593>
 31010c2:	83 c4 10             	add    esp,0x10
 31010c5:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:389
                }
                goto getAKey;
 31010c8:	e9 18 ff ff ff       	jmp    3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:394
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 31010cd:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31010d1:	3c d0                	cmp    al,0xd0
 31010d3:	0f 85 9e 00 00 00    	jne    3101177 <kShell+0x28a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:396
        {
            if (commandHistoryPtr>=0)
 31010d9:	a1 58 27 10 03       	mov    eax,ds:0x3102758
 31010de:	85 c0                	test   eax,eax
 31010e0:	0f 88 ff fe ff ff    	js     3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:399
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
 31010e6:	a1 58 27 10 03       	mov    eax,ds:0x3102758
 31010eb:	8d 50 01             	lea    edx,[eax+0x1]
 31010ee:	a1 5c 27 10 03       	mov    eax,ds:0x310275c
 31010f3:	39 c2                	cmp    edx,eax
 31010f5:	0f 8d ea fe ff ff    	jge    3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:401
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
 31010fb:	a1 58 27 10 03       	mov    eax,ds:0x3102758
 3101100:	83 c0 01             	add    eax,0x1
 3101103:	a3 58 27 10 03       	mov    ds:0x3102758,eax
 3101108:	a1 58 27 10 03       	mov    eax,ds:0x3102758
 310110d:	c1 e0 07             	shl    eax,0x7
 3101110:	05 60 27 10 03       	add    eax,0x3102760
 3101115:	83 ec 08             	sub    esp,0x8
 3101118:	50                   	push   eax
 3101119:	68 60 21 11 03       	push   0x3112160
 310111e:	e8 ad 01 00 00       	call   31012d0 <kShell+0x3e3>
 3101123:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:402
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3101126:	a1 58 27 10 03       	mov    eax,ds:0x3102758
 310112b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:403
                    while (lCurrKeyCount>0)
 310112e:	eb 14                	jmp    3101144 <kShell+0x257>
/home/yogi/src/os/aproj/kshell/src/kshell.c:405
                    {
                        printf(KEY_BACKSPACE);
 3101130:	83 ec 0c             	sub    esp,0xc
 3101133:	68 67 18 10 03       	push   0x3101867
 3101138:	e8 c3 01 00 00       	call   3101300 <kShell+0x413>
 310113d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:406
                        lCurrKeyCount--;
 3101140:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:403
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 3101144:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3101148:	7f e6                	jg     3101130 <kShell+0x243>
/home/yogi/src/os/aproj/kshell/src/kshell.c:408
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 310114a:	83 ec 08             	sub    esp,0x8
 310114d:	68 60 21 11 03       	push   0x3112160
 3101152:	68 4f 18 10 03       	push   0x310184f
 3101157:	e8 a4 01 00 00       	call   3101300 <kShell+0x413>
 310115c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:409
                    lCurrKeyCount=strlen(lCommand);
 310115f:	83 ec 0c             	sub    esp,0xc
 3101162:	68 60 21 11 03       	push   0x3112160
 3101167:	e8 14 03 00 00       	call   3101480 <kShell+0x593>
 310116c:	83 c4 10             	add    esp,0x10
 310116f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:411
                }
                goto getAKey;
 3101172:	e9 6e fe ff ff       	jmp    3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:416
            }
            else
                goto getAKey;
        }   
        else if (lCurrKey==0xcb) //left
 3101177:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 310117b:	3c cb                	cmp    al,0xcb
 310117d:	75 1f                	jne    310119e <kShell+0x2b1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:418
        {
            if (lCurrKeyCount>0)
 310117f:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3101183:	0f 8e 5c fe ff ff    	jle    3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:420
            {
                print("\033[1D");
 3101189:	83 ec 0c             	sub    esp,0xc
 310118c:	68 71 18 10 03       	push   0x3101871
 3101191:	e8 5a 01 00 00       	call   31012f0 <kShell+0x403>
 3101196:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:423
            }
             
            goto getAKey;
 3101199:	e9 47 fe ff ff       	jmp    3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:425
        }
        else if (lCurrKey==0xcd) //right
 310119e:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31011a2:	3c cd                	cmp    al,0xcd
 31011a4:	75 15                	jne    31011bb <kShell+0x2ce>
/home/yogi/src/os/aproj/kshell/src/kshell.c:427
        {
            print("\033[1C");
 31011a6:	83 ec 0c             	sub    esp,0xc
 31011a9:	68 76 18 10 03       	push   0x3101876
 31011ae:	e8 3d 01 00 00       	call   31012f0 <kShell+0x403>
 31011b3:	83 c4 10             	add    esp,0x10
 31011b6:	e9 2a fe ff ff       	jmp    3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:429
        }
        else if (lCurrKey=='\b') //backspace
 31011bb:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31011bf:	3c 08                	cmp    al,0x8
 31011c1:	75 32                	jne    31011f5 <kShell+0x308>
/home/yogi/src/os/aproj/kshell/src/kshell.c:431
        {
            if (lCurrKeyCount-1 >= 0)
 31011c3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31011c6:	83 e8 01             	sub    eax,0x1
 31011c9:	85 c0                	test   eax,eax
 31011cb:	0f 88 14 fe ff ff    	js     3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:433
            {
                lCurrKeyCount--;
 31011d1:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:434
                lCommand[lCurrKeyCount]='\0';
 31011d5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31011d8:	05 60 21 11 03       	add    eax,0x3112160
 31011dd:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:435
                printf(KEY_BACKSPACE);
 31011e0:	83 ec 0c             	sub    esp,0xc
 31011e3:	68 67 18 10 03       	push   0x3101867
 31011e8:	e8 13 01 00 00       	call   3101300 <kShell+0x413>
 31011ed:	83 c4 10             	add    esp,0x10
 31011f0:	e9 f0 fd ff ff       	jmp    3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:438
            }
        }
        else if (lCurrKey==0xa) //Enter
 31011f5:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31011f9:	3c 0a                	cmp    al,0xa
 31011fb:	75 21                	jne    310121e <kShell+0x331>
/home/yogi/src/os/aproj/kshell/src/kshell.c:440
        {
            print("\n");
 31011fd:	83 ec 0c             	sub    esp,0xc
 3101200:	68 7b 18 10 03       	push   0x310187b
 3101205:	e8 e6 00 00 00       	call   31012f0 <kShell+0x403>
 310120a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:441
            goto doneGettingKeys;
 310120d:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:454
            commandWasFromThisBufferPtr=-1;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 310120e:	0f b6 05 60 21 11 03 	movzx  eax,BYTE PTR ds:0x3112160
 3101215:	84 c0                	test   al,al
 3101217:	75 3c                	jne    3101255 <kShell+0x368>
 3101219:	e9 7a fd ff ff       	jmp    3100f98 <kShell+0xab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:445
            print("\n");
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 310121e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101221:	8d 50 01             	lea    edx,[eax+0x1]
 3101224:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3101227:	0f b6 55 eb          	movzx  edx,BYTE PTR [ebp-0x15]
 310122b:	88 90 60 21 11 03    	mov    BYTE PTR [eax+0x3112160],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:447
            //reprintCommand(lCommand);
            printf("%c",lCurrKey);
 3101231:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 3101235:	0f b6 c0             	movzx  eax,al
 3101238:	83 ec 08             	sub    esp,0x8
 310123b:	50                   	push   eax
 310123c:	68 7d 18 10 03       	push   0x310187d
 3101241:	e8 ba 00 00 00       	call   3101300 <kShell+0x413>
 3101246:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:449
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
 3101249:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:451
        }
        goto getAKey;
 3101250:	e9 90 fd ff ff       	jmp    3100fe5 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:456
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
            goto getACommand;
        if (commandWasFromThisBufferPtr == -1)
 3101255:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
 3101259:	75 10                	jne    310126b <kShell+0x37e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:457
            saveCommand(lCommand);
 310125b:	83 ec 0c             	sub    esp,0xc
 310125e:	68 60 21 11 03       	push   0x3112160
 3101263:	e8 cd fb ff ff       	call   3100e35 <saveCommand>
 3101268:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:458
        int i = findCommand(lCommand);
 310126b:	83 ec 0c             	sub    esp,0xc
 310126e:	68 60 21 11 03       	push   0x3112160
 3101273:	e8 87 f7 ff ff       	call   31009ff <findCommand>
 3101278:	83 c4 10             	add    esp,0x10
 310127b:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:459
        execInternalCommand(lCommand);
 310127e:	83 ec 0c             	sub    esp,0xc
 3101281:	68 60 21 11 03       	push   0x3112160
 3101286:	e8 25 f5 ff ff       	call   31007b0 <execInternalCommand>
 310128b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:347
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    modifySignal(SIGINT, handleSignals, SIGINT);
    
    while (!timeToExit)
 310128e:	0f b6 05 54 27 10 03 	movzx  eax,BYTE PTR ds:0x3102754
 3101295:	83 f0 01             	xor    eax,0x1
 3101298:	84 c0                	test   al,al
 310129a:	0f 85 f8 fc ff ff    	jne    3100f98 <kShell+0xab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:461
        if (commandWasFromThisBufferPtr == -1)
            saveCommand(lCommand);
        int i = findCommand(lCommand);
        execInternalCommand(lCommand);
    }
    free(sKShellProgramName);
 31012a0:	a1 4c 27 10 03       	mov    eax,ds:0x310274c
 31012a5:	83 ec 0c             	sub    esp,0xc
 31012a8:	50                   	push   eax
 31012a9:	e8 f2 01 00 00       	call   31014a0 <kShell+0x5b3>
 31012ae:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:462
    return exitCode;
 31012b1:	a1 48 27 10 03       	mov    eax,ds:0x3102748
/home/yogi/src/os/aproj/kshell/src/kshell.c:463
}
 31012b6:	c9                   	leave  
 31012b7:	c3                   	ret    

Disassembly of section .plt:

031012c0 <.plt>:
 31012c0:	ff 35 74 23 10 03    	push   DWORD PTR ds:0x3102374
 31012c6:	ff 25 78 23 10 03    	jmp    DWORD PTR ds:0x3102378
 31012cc:	00 00                	add    BYTE PTR [eax],al
 31012ce:	00 00                	add    BYTE PTR [eax],al
 31012d0:	ff 25 7c 23 10 03    	jmp    DWORD PTR ds:0x310237c
 31012d6:	68 00 00 00 00       	push   0x0
 31012db:	e9 e0 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 31012e0:	ff 25 80 23 10 03    	jmp    DWORD PTR ds:0x3102380
 31012e6:	68 08 00 00 00       	push   0x8
 31012eb:	e9 d0 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 31012f0:	ff 25 84 23 10 03    	jmp    DWORD PTR ds:0x3102384
 31012f6:	68 10 00 00 00       	push   0x10
 31012fb:	e9 c0 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101300:	ff 25 88 23 10 03    	jmp    DWORD PTR ds:0x3102388
 3101306:	68 18 00 00 00       	push   0x18
 310130b:	e9 b0 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101310:	ff 25 8c 23 10 03    	jmp    DWORD PTR ds:0x310238c
 3101316:	68 20 00 00 00       	push   0x20
 310131b:	e9 a0 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101320:	ff 25 90 23 10 03    	jmp    DWORD PTR ds:0x3102390
 3101326:	68 28 00 00 00       	push   0x28
 310132b:	e9 90 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101330:	ff 25 94 23 10 03    	jmp    DWORD PTR ds:0x3102394
 3101336:	68 30 00 00 00       	push   0x30
 310133b:	e9 80 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101340:	ff 25 98 23 10 03    	jmp    DWORD PTR ds:0x3102398
 3101346:	68 38 00 00 00       	push   0x38
 310134b:	e9 70 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101350:	ff 25 9c 23 10 03    	jmp    DWORD PTR ds:0x310239c
 3101356:	68 40 00 00 00       	push   0x40
 310135b:	e9 60 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101360:	ff 25 a0 23 10 03    	jmp    DWORD PTR ds:0x31023a0
 3101366:	68 48 00 00 00       	push   0x48
 310136b:	e9 50 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101370:	ff 25 a4 23 10 03    	jmp    DWORD PTR ds:0x31023a4
 3101376:	68 50 00 00 00       	push   0x50
 310137b:	e9 40 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101380:	ff 25 a8 23 10 03    	jmp    DWORD PTR ds:0x31023a8
 3101386:	68 58 00 00 00       	push   0x58
 310138b:	e9 30 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101390:	ff 25 ac 23 10 03    	jmp    DWORD PTR ds:0x31023ac
 3101396:	68 60 00 00 00       	push   0x60
 310139b:	e9 20 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 31013a0:	ff 25 b0 23 10 03    	jmp    DWORD PTR ds:0x31023b0
 31013a6:	68 68 00 00 00       	push   0x68
 31013ab:	e9 10 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 31013b0:	ff 25 b4 23 10 03    	jmp    DWORD PTR ds:0x31023b4
 31013b6:	68 70 00 00 00       	push   0x70
 31013bb:	e9 00 ff ff ff       	jmp    31012c0 <kShell+0x3d3>
 31013c0:	ff 25 b8 23 10 03    	jmp    DWORD PTR ds:0x31023b8
 31013c6:	68 78 00 00 00       	push   0x78
 31013cb:	e9 f0 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 31013d0:	ff 25 bc 23 10 03    	jmp    DWORD PTR ds:0x31023bc
 31013d6:	68 80 00 00 00       	push   0x80
 31013db:	e9 e0 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 31013e0:	ff 25 c0 23 10 03    	jmp    DWORD PTR ds:0x31023c0
 31013e6:	68 88 00 00 00       	push   0x88
 31013eb:	e9 d0 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 31013f0:	ff 25 c4 23 10 03    	jmp    DWORD PTR ds:0x31023c4
 31013f6:	68 90 00 00 00       	push   0x90
 31013fb:	e9 c0 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101400:	ff 25 c8 23 10 03    	jmp    DWORD PTR ds:0x31023c8
 3101406:	68 98 00 00 00       	push   0x98
 310140b:	e9 b0 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101410:	ff 25 cc 23 10 03    	jmp    DWORD PTR ds:0x31023cc
 3101416:	68 a0 00 00 00       	push   0xa0
 310141b:	e9 a0 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101420:	ff 25 d0 23 10 03    	jmp    DWORD PTR ds:0x31023d0
 3101426:	68 a8 00 00 00       	push   0xa8
 310142b:	e9 90 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101430:	ff 25 d4 23 10 03    	jmp    DWORD PTR ds:0x31023d4
 3101436:	68 b0 00 00 00       	push   0xb0
 310143b:	e9 80 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101440:	ff 25 d8 23 10 03    	jmp    DWORD PTR ds:0x31023d8
 3101446:	68 b8 00 00 00       	push   0xb8
 310144b:	e9 70 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101450:	ff 25 dc 23 10 03    	jmp    DWORD PTR ds:0x31023dc
 3101456:	68 c0 00 00 00       	push   0xc0
 310145b:	e9 60 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101460:	ff 25 e0 23 10 03    	jmp    DWORD PTR ds:0x31023e0
 3101466:	68 c8 00 00 00       	push   0xc8
 310146b:	e9 50 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101470:	ff 25 e4 23 10 03    	jmp    DWORD PTR ds:0x31023e4
 3101476:	68 d0 00 00 00       	push   0xd0
 310147b:	e9 40 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101480:	ff 25 e8 23 10 03    	jmp    DWORD PTR ds:0x31023e8
 3101486:	68 d8 00 00 00       	push   0xd8
 310148b:	e9 30 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 3101490:	ff 25 ec 23 10 03    	jmp    DWORD PTR ds:0x31023ec
 3101496:	68 e0 00 00 00       	push   0xe0
 310149b:	e9 20 fe ff ff       	jmp    31012c0 <kShell+0x3d3>
 31014a0:	ff 25 f0 23 10 03    	jmp    DWORD PTR ds:0x31023f0
 31014a6:	68 e8 00 00 00       	push   0xe8
 31014ab:	e9 10 fe ff ff       	jmp    31012c0 <kShell+0x3d3>

Disassembly of section .rodata:

031014b0 <.rodata>:
 31014b0:	63 6c 65 61          	arpl   WORD PTR [ebp+eiz*2+0x61],bp
 31014b4:	72 00                	jb     31014b6 <kShell+0x5c9>
 31014b6:	43                   	inc    ebx
 31014b7:	6c                   	ins    BYTE PTR es:[edi],dx
 31014b8:	65                   	gs
 31014b9:	61                   	popa   
 31014ba:	72 20                	jb     31014dc <kShell+0x5ef>
 31014bc:	74 68                	je     3101526 <kShell+0x639>
 31014be:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 31014c2:	72 65                	jb     3101529 <kShell+0x63c>
 31014c4:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31014c6:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 31014c9:	76 00                	jbe    31014cb <kShell+0x5de>
 31014cb:	50                   	push   eax
 31014cc:	72 69                	jb     3101537 <kShell+0x64a>
 31014ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31014cf:	74 20                	je     31014f1 <kShell+0x604>
 31014d1:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31014d3:	76 69                	jbe    310153e <kShell+0x651>
 31014d5:	72 6f                	jb     3101546 <kShell+0x659>
 31014d7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31014d8:	6d                   	ins    DWORD PTR es:[edi],dx
 31014d9:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31014db:	74 00                	je     31014dd <kShell+0x5f0>
 31014dd:	65                   	gs
 31014de:	78 65                	js     3101545 <kShell+0x658>
 31014e0:	63 00                	arpl   WORD PTR [eax],ax
 31014e2:	45                   	inc    ebp
 31014e3:	78 65                	js     310154a <kShell+0x65d>
 31014e5:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 31014e8:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 31014ec:	70 72                	jo     3101560 <kShell+0x673>
 31014ee:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31014ef:	67 72 61             	addr16 jb 3101553 <kShell+0x666>
 31014f2:	6d                   	ins    DWORD PTR es:[edi],dx
 31014f3:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 31014f6:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 31014fd:	20 
 31014fe:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3101502:	6c                   	ins    BYTE PTR es:[edi],dx
 3101503:	6c                   	ins    BYTE PTR es:[edi],dx
 3101504:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101507:	6c                   	ins    BYTE PTR es:[edi],dx
 3101508:	70 00                	jo     310150a <kShell+0x61d>
 310150a:	47                   	inc    edi
 310150b:	65                   	gs
 310150c:	74 20                	je     310152e <kShell+0x641>
 310150e:	68 65 6c 70 20       	push   0x20706c65
 3101513:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101517:	73 20                	jae    3101539 <kShell+0x64c>
 3101519:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3101520:	74 69                	je     310158b <kShell+0x69e>
 3101522:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101523:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101524:	29 00                	sub    DWORD PTR [eax],eax
 3101526:	70 77                	jo     310159f <kShell+0x6b2>
 3101528:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 310152c:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3101533:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3101537:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 310153b:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3101540:	79 00                	jns    3101542 <kShell+0x655>
 3101542:	72 65                	jb     31015a9 <kShell+0x6bc>
 3101544:	70 65                	jo     31015ab <kShell+0x6be>
 3101546:	61                   	popa   
 3101547:	74 00                	je     3101549 <kShell+0x65c>
 3101549:	52                   	push   edx
 310154a:	65                   	gs
 310154b:	70 65                	jo     31015b2 <kShell+0x6c5>
 310154d:	61                   	popa   
 310154e:	74 20                	je     3101570 <kShell+0x683>
 3101550:	61                   	popa   
 3101551:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 3101554:	6d                   	ins    DWORD PTR es:[edi],dx
 3101555:	6d                   	ins    DWORD PTR es:[edi],dx
 3101556:	61                   	popa   
 3101557:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101558:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 310155c:	74 69                	je     31015c7 <kShell+0x6da>
 310155e:	6d                   	ins    DWORD PTR es:[edi],dx
 310155f:	65                   	gs
 3101560:	73 00                	jae    3101562 <kShell+0x675>
 3101562:	73 65                	jae    31015c9 <kShell+0x6dc>
 3101564:	74 00                	je     3101566 <kShell+0x679>
 3101566:	53                   	push   ebx
 3101567:	65                   	gs
 3101568:	74 20                	je     310158a <kShell+0x69d>
 310156a:	61                   	popa   
 310156b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310156c:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 310156f:	76 69                	jbe    31015da <kShell+0x6ed>
 3101571:	72 6f                	jb     31015e2 <kShell+0x6f5>
 3101573:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101574:	6d                   	ins    DWORD PTR es:[edi],dx
 3101575:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101577:	74 20                	je     3101599 <kShell+0x6ac>
 3101579:	76 61                	jbe    31015dc <kShell+0x6ef>
 310157b:	72 69                	jb     31015e6 <kShell+0x6f9>
 310157d:	61                   	popa   
 310157e:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 3101582:	73 6c                	jae    31015f0 <kShell+0x703>
 3101584:	65                   	gs
 3101585:	65                   	gs
 3101586:	70 00                	jo     3101588 <kShell+0x69b>
 3101588:	53                   	push   ebx
 3101589:	6c                   	ins    BYTE PTR es:[edi],dx
 310158a:	65                   	gs
 310158b:	65                   	gs
 310158c:	70 20                	jo     31015ae <kShell+0x6c1>
 310158e:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3101590:	72 20                	jb     31015b2 <kShell+0x6c5>
 3101592:	78 20                	js     31015b4 <kShell+0x6c7>
 3101594:	73 65                	jae    31015fb <kShell+0x70e>
 3101596:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101599:	64                   	fs
 310159a:	73 00                	jae    310159c <kShell+0x6af>
 310159c:	74 69                	je     3101607 <kShell+0x71a>
 310159e:	6d                   	ins    DWORD PTR es:[edi],dx
 310159f:	65 00 00             	add    BYTE PTR gs:[eax],al
 31015a2:	00 00                	add    BYTE PTR [eax],al
 31015a4:	54                   	push   esp
 31015a5:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 31015ac:	72 6f                	jb     310161d <kShell+0x730>
 31015ae:	67 72 61             	addr16 jb 3101612 <kShell+0x725>
 31015b1:	6d                   	ins    DWORD PTR es:[edi],dx
 31015b2:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 31015b5:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 31015bc:	72 
 31015bd:	75 6e                	jne    310162d <kShell+0x740>
 31015bf:	73 2e                	jae    31015ef <kShell+0x702>
 31015c1:	0a 09                	or     cl,BYTE PTR [ecx]
 31015c3:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 31015c6:	61                   	popa   
 31015c7:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 31015cb:	74 69                	je     3101636 <kShell+0x749>
 31015cd:	6d                   	ins    DWORD PTR es:[edi],dx
 31015ce:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 31015d2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31015d3:	67 72 61             	addr16 jb 3101637 <kShell+0x74a>
 31015d6:	6d                   	ins    DWORD PTR es:[edi],dx
 31015d7:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 31015da:	61                   	popa   
 31015db:	72 61                	jb     310163e <kShell+0x751>
 31015dd:	6d                   	ins    DWORD PTR es:[edi],dx
 31015de:	65                   	gs
 31015df:	74 65                	je     3101646 <kShell+0x759>
 31015e1:	72 73                	jb     3101656 <kShell+0x769>
 31015e3:	5d                   	pop    ebp
 31015e4:	00 1b                	add    BYTE PTR [ebx],bl
 31015e6:	5b                   	pop    ebx
 31015e7:	32 4a 00             	xor    cl,BYTE PTR [edx+0x0]
 31015ea:	25 73 0a 00 3d       	and    eax,0x3d000a73
 31015ef:	00 55 73             	add    BYTE PTR [ebp+0x73],dl
 31015f2:	61                   	popa   
 31015f3:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 31015f7:	73 65                	jae    310165e <kShell+0x771>
 31015f9:	74 20                	je     310161b <kShell+0x72e>
 31015fb:	76 61                	jbe    310165e <kShell+0x771>
 31015fd:	72 69                	jb     3101668 <kShell+0x77b>
 31015ff:	61                   	popa   
 3101600:	62 6c 65 3d          	bound  ebp,QWORD PTR [ebp+eiz*2+0x3d]
 3101604:	76 61                	jbe    3101667 <kShell+0x77a>
 3101606:	6c                   	ins    BYTE PTR es:[edi],dx
 3101607:	75 65                	jne    310166e <kShell+0x781>
 3101609:	0a 00                	or     al,BYTE PTR [eax]
 310160b:	4c                   	dec    esp
 310160c:	41                   	inc    ecx
 310160d:	53                   	push   ebx
 310160e:	54                   	push   esp
 310160f:	45                   	inc    ebp
 3101610:	58                   	pop    eax
 3101611:	49                   	dec    ecx
 3101612:	54                   	push   esp
 3101613:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3101616:	72 6f                	jb     3101687 <kShell+0x79a>
 3101618:	72 20                	jb     310163a <kShell+0x74d>
 310161a:	65                   	gs
 310161b:	78 65                	js     3101682 <kShell+0x795>
 310161d:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101620:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3101627:	00 6b 65             	add    BYTE PTR [ebx+0x65],ch
 310162a:	78 65                	js     3101691 <kShell+0x7a4>
 310162c:	63 3a                	arpl   WORD PTR [edx],di
 310162e:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
 3101631:	76 61                	jbe    3101694 <kShell+0x7a7>
 3101633:	6c                   	ins    BYTE PTR es:[edi],dx
 3101634:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 310163b:	61 
 310163c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310163d:	64 0a 00             	or     al,BYTE PTR fs:[eax]
 3101640:	46                   	inc    esi
 3101641:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101642:	72 6b                	jb     31016af <kShell+0x7c2>
 3101644:	20 65 72             	and    BYTE PTR [ebp+0x72],ah
 3101647:	72 6f                	jb     31016b8 <kShell+0x7cb>
 3101649:	72 20                	jb     310166b <kShell+0x77e>
 310164b:	25 75 00 65 78       	and    eax,0x78650075
 3101650:	65 63 54 69 6d       	arpl   WORD PTR gs:[ecx+ebp*2+0x6d],dx
 3101655:	65 3a 20             	cmp    ah,BYTE PTR gs:[eax]
 3101658:	43                   	inc    ebx
 3101659:	61                   	popa   
 310165a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310165b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310165c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310165d:	74 20                	je     310167f <kShell+0x792>
 310165f:	65                   	gs
 3101660:	78 65                	js     31016c7 <kShell+0x7da>
 3101662:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101665:	65 20 25 73 0a 00 0a 	and    BYTE PTR gs:0xa000a73,ah
 310166c:	25 75 20 74 69       	and    eax,0x69742075
 3101671:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 3101674:	0a 00                	or     al,BYTE PTR [eax]
 3101676:	00 00                	add    BYTE PTR [eax],al
 3101678:	0a 2a                	or     ch,BYTE PTR [edx]
 310167a:	2a 2a                	sub    ch,BYTE PTR [edx]
 310167c:	2a 2a                	sub    ch,BYTE PTR [edx]
 310167e:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101680:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101682:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101684:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101686:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101688:	20 52 45             	and    BYTE PTR [edx+0x45],dl
 310168b:	50                   	push   eax
 310168c:	45                   	inc    ebp
 310168d:	41                   	inc    ecx
 310168e:	54                   	push   esp
 310168f:	20 45 58             	and    BYTE PTR [ebp+0x58],al
 3101692:	45                   	inc    ebp
 3101693:	43                   	inc    ebx
 3101694:	55                   	push   ebp
 3101695:	54                   	push   esp
 3101696:	49                   	dec    ecx
 3101697:	4f                   	dec    edi
 3101698:	4e                   	dec    esi
 3101699:	20 23                	and    BYTE PTR [ebx],ah
 310169b:	25 75 20 6f 66       	and    eax,0x666f2075
 31016a0:	20 25 75 20 2a 2a    	and    BYTE PTR ds:0x2a2a2075,ah
 31016a6:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016a8:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016aa:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016ac:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016ae:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016b0:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016b2:	2a 0a                	sub    cl,BYTE PTR [edx]
 31016b4:	00 48 65             	add    BYTE PTR [eax+0x65],cl
 31016b7:	6c                   	ins    BYTE PTR es:[edi],dx
 31016b8:	70 3a                	jo     31016f4 <kShell+0x807>
 31016ba:	20 25 73 0a 00 09    	and    BYTE PTR ds:0x9000a73,ah
 31016c0:	25 73 3a 20 25       	and    eax,0x25203a73
 31016c5:	73 0a                	jae    31016d1 <kShell+0x7e4>
 31016c7:	00 75 68             	add    BYTE PTR [ebp+0x68],dh
 31016ca:	20 6f 68             	and    BYTE PTR [edi+0x68],ch
 31016cd:	21 00                	and    DWORD PTR [eax],eax
 31016cf:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 31016d2:	71 75                	jno    3101749 <kShell+0x85c>
 31016d4:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 31016db:	70 61                	jo     310173e <kShell+0x851>
 31016dd:	72 61                	jb     3101740 <kShell+0x853>
 31016df:	6d                   	ins    DWORD PTR es:[edi],dx
 31016e0:	65                   	gs
 31016e1:	74 65                	je     3101748 <kShell+0x85b>
 31016e3:	72 20                	jb     3101705 <kShell+0x818>
 31016e5:	77 68                	ja     310174f <kShell+0x862>
 31016e7:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 31016ee:	74 68                	je     3101758 <kShell+0x86b>
 31016f0:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 31016f4:	6d                   	ins    DWORD PTR es:[edi],dx
 31016f5:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 31016f8:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 31016fb:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 31016fe:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101701:	64                   	fs
 3101702:	73 20                	jae    3101724 <kShell+0x837>
 3101704:	74 6f                	je     3101775 <kShell+0x888>
 3101706:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3101709:	65                   	gs
 310170a:	65                   	gs
 310170b:	70 0a                	jo     3101717 <kShell+0x82a>
 310170d:	00 00                	add    BYTE PTR [eax],al
 310170f:	00 63 6c             	add    BYTE PTR [ebx+0x6c],ah
 3101712:	65                   	gs
 3101713:	61                   	popa   
 3101714:	72 00                	jb     3101716 <kShell+0x829>
 3101716:	43                   	inc    ebx
 3101717:	6c                   	ins    BYTE PTR es:[edi],dx
 3101718:	65                   	gs
 3101719:	61                   	popa   
 310171a:	72 20                	jb     310173c <kShell+0x84f>
 310171c:	74 68                	je     3101786 <kShell+0x899>
 310171e:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 3101722:	72 65                	jb     3101789 <kShell+0x89c>
 3101724:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101726:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 3101729:	76 00                	jbe    310172b <kShell+0x83e>
 310172b:	50                   	push   eax
 310172c:	72 69                	jb     3101797 <kShell+0x8aa>
 310172e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310172f:	74 20                	je     3101751 <kShell+0x864>
 3101731:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101733:	76 69                	jbe    310179e <kShell+0x8b1>
 3101735:	72 6f                	jb     31017a6 <kShell+0x8b9>
 3101737:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101738:	6d                   	ins    DWORD PTR es:[edi],dx
 3101739:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 310173b:	74 00                	je     310173d <kShell+0x850>
 310173d:	65                   	gs
 310173e:	78 65                	js     31017a5 <kShell+0x8b8>
 3101740:	63 00                	arpl   WORD PTR [eax],ax
 3101742:	45                   	inc    ebp
 3101743:	78 65                	js     31017aa <kShell+0x8bd>
 3101745:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101748:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 310174c:	70 72                	jo     31017c0 <kShell+0x8d3>
 310174e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310174f:	67 72 61             	addr16 jb 31017b3 <kShell+0x8c6>
 3101752:	6d                   	ins    DWORD PTR es:[edi],dx
 3101753:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101756:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 310175d:	20 
 310175e:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3101762:	6c                   	ins    BYTE PTR es:[edi],dx
 3101763:	6c                   	ins    BYTE PTR es:[edi],dx
 3101764:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101767:	6c                   	ins    BYTE PTR es:[edi],dx
 3101768:	70 00                	jo     310176a <kShell+0x87d>
 310176a:	47                   	inc    edi
 310176b:	65                   	gs
 310176c:	74 20                	je     310178e <kShell+0x8a1>
 310176e:	68 65 6c 70 20       	push   0x20706c65
 3101773:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101777:	73 20                	jae    3101799 <kShell+0x8ac>
 3101779:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3101780:	74 69                	je     31017eb <kShell+0x8fe>
 3101782:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101783:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101784:	29 00                	sub    DWORD PTR [eax],eax
 3101786:	70 77                	jo     31017ff <kShell+0x912>
 3101788:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 310178c:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3101793:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3101797:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 310179b:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 31017a0:	79 00                	jns    31017a2 <kShell+0x8b5>
 31017a2:	72 65                	jb     3101809 <kShell+0x91c>
 31017a4:	70 65                	jo     310180b <kShell+0x91e>
 31017a6:	61                   	popa   
 31017a7:	74 00                	je     31017a9 <kShell+0x8bc>
 31017a9:	52                   	push   edx
 31017aa:	65                   	gs
 31017ab:	70 65                	jo     3101812 <kShell+0x925>
 31017ad:	61                   	popa   
 31017ae:	74 20                	je     31017d0 <kShell+0x8e3>
 31017b0:	61                   	popa   
 31017b1:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 31017b4:	6d                   	ins    DWORD PTR es:[edi],dx
 31017b5:	6d                   	ins    DWORD PTR es:[edi],dx
 31017b6:	61                   	popa   
 31017b7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31017b8:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 31017bc:	74 69                	je     3101827 <kShell+0x93a>
 31017be:	6d                   	ins    DWORD PTR es:[edi],dx
 31017bf:	65                   	gs
 31017c0:	73 00                	jae    31017c2 <kShell+0x8d5>
 31017c2:	73 65                	jae    3101829 <kShell+0x93c>
 31017c4:	74 00                	je     31017c6 <kShell+0x8d9>
 31017c6:	53                   	push   ebx
 31017c7:	65                   	gs
 31017c8:	74 20                	je     31017ea <kShell+0x8fd>
 31017ca:	61                   	popa   
 31017cb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31017cc:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 31017cf:	76 69                	jbe    310183a <kShell+0x94d>
 31017d1:	72 6f                	jb     3101842 <kShell+0x955>
 31017d3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31017d4:	6d                   	ins    DWORD PTR es:[edi],dx
 31017d5:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31017d7:	74 20                	je     31017f9 <kShell+0x90c>
 31017d9:	76 61                	jbe    310183c <kShell+0x94f>
 31017db:	72 69                	jb     3101846 <kShell+0x959>
 31017dd:	61                   	popa   
 31017de:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 31017e2:	73 6c                	jae    3101850 <kShell+0x963>
 31017e4:	65                   	gs
 31017e5:	65                   	gs
 31017e6:	70 00                	jo     31017e8 <kShell+0x8fb>
 31017e8:	53                   	push   ebx
 31017e9:	6c                   	ins    BYTE PTR es:[edi],dx
 31017ea:	65                   	gs
 31017eb:	65                   	gs
 31017ec:	70 20                	jo     310180e <kShell+0x921>
 31017ee:	66 6f                	outs   dx,WORD PTR ds:[esi]
 31017f0:	72 20                	jb     3101812 <kShell+0x925>
 31017f2:	78 20                	js     3101814 <kShell+0x927>
 31017f4:	73 65                	jae    310185b <kShell+0x96e>
 31017f6:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 31017f9:	64                   	fs
 31017fa:	73 00                	jae    31017fc <kShell+0x90f>
 31017fc:	74 69                	je     3101867 <kShell+0x97a>
 31017fe:	6d                   	ins    DWORD PTR es:[edi],dx
 31017ff:	65 00 00             	add    BYTE PTR gs:[eax],al
 3101802:	00 00                	add    BYTE PTR [eax],al
 3101804:	54                   	push   esp
 3101805:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 310180c:	72 6f                	jb     310187d <kShell+0x990>
 310180e:	67 72 61             	addr16 jb 3101872 <kShell+0x985>
 3101811:	6d                   	ins    DWORD PTR es:[edi],dx
 3101812:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3101815:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 310181c:	72 
 310181d:	75 6e                	jne    310188d <kShell+0x9a0>
 310181f:	73 2e                	jae    310184f <kShell+0x962>
 3101821:	0a 09                	or     cl,BYTE PTR [ecx]
 3101823:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 3101826:	61                   	popa   
 3101827:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 310182b:	74 69                	je     3101896 <kShell+0x9a9>
 310182d:	6d                   	ins    DWORD PTR es:[edi],dx
 310182e:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 3101832:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101833:	67 72 61             	addr16 jb 3101897 <kShell+0x9aa>
 3101836:	6d                   	ins    DWORD PTR es:[edi],dx
 3101837:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 310183a:	61                   	popa   
 310183b:	72 61                	jb     310189e <kShell+0x9b1>
 310183d:	6d                   	ins    DWORD PTR es:[edi],dx
 310183e:	65                   	gs
 310183f:	74 65                	je     31018a6 <kShell+0x9b9>
 3101841:	72 73                	jb     31018b6 <kShell+0x9c9>
 3101843:	5d                   	pop    ebp
 3101844:	00 3d 00 25 73 20    	add    BYTE PTR ds:0x20732500,bh
 310184a:	25 73 3e 20 00       	and    eax,0x203e73
 310184f:	25 73 00 5e 43       	and    eax,0x435e0073
 3101854:	0a 00                	or     al,BYTE PTR [eax]
 3101856:	20 09                	and    BYTE PTR [ecx],cl
 3101858:	0a 2d 2c 00 6b 53    	or     ch,BYTE PTR ds:0x536b002c
 310185e:	68 65 6c 6c 00       	push   0x6c6c65
 3101863:	43                   	inc    ebx
 3101864:	57                   	push   edi
 3101865:	44                   	inc    esp
 3101866:	00 1b                	add    BYTE PTR [ebx],bl
 3101868:	5b                   	pop    ebx
 3101869:	31 44 20 1b          	xor    DWORD PTR [eax+eiz*1+0x1b],eax
 310186d:	5b                   	pop    ebx
 310186e:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 3101872:	5b                   	pop    ebx
 3101873:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 3101877:	5b                   	pop    ebx
 3101878:	31 43 00             	xor    DWORD PTR [ebx+0x0],eax
 310187b:	0a 00                	or     al,BYTE PTR [eax]
 310187d:	25                   	.byte 0x25
 310187e:	63 00                	arpl   WORD PTR [eax],ax

Disassembly of section .eh_frame:

03101880 <.eh_frame>:
 3101880:	14 00                	adc    al,0x0
 3101882:	00 00                	add    BYTE PTR [eax],al
 3101884:	00 00                	add    BYTE PTR [eax],al
 3101886:	00 00                	add    BYTE PTR [eax],al
 3101888:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 310188b:	00 01                	add    BYTE PTR [ecx],al
 310188d:	7c 08                	jl     3101897 <kShell+0x9aa>
 310188f:	01 1b                	add    DWORD PTR [ebx],ebx
 3101891:	0c 04                	or     al,0x4
 3101893:	04 88                	add    al,0x88
 3101895:	01 00                	add    DWORD PTR [eax],eax
 3101897:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310189a:	00 00                	add    BYTE PTR [eax],al
 310189c:	1c 00                	sbb    al,0x0
 310189e:	00 00                	add    BYTE PTR [eax],al
 31018a0:	60                   	pusha  
 31018a1:	e7 ff                	out    0xff,eax
 31018a3:	ff 19                	call   FWORD PTR [ecx]
 31018a5:	00 00                	add    BYTE PTR [eax],al
 31018a7:	00 00                	add    BYTE PTR [eax],al
 31018a9:	41                   	inc    ecx
 31018aa:	0e                   	push   cs
 31018ab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31018b1:	55                   	push   ebp
 31018b2:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31018b5:	04 00                	add    al,0x0
 31018b7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31018ba:	00 00                	add    BYTE PTR [eax],al
 31018bc:	3c 00                	cmp    al,0x0
 31018be:	00 00                	add    BYTE PTR [eax],al
 31018c0:	59                   	pop    ecx
 31018c1:	e7 ff                	out    0xff,eax
 31018c3:	ff 4f 00             	dec    DWORD PTR [edi+0x0]
 31018c6:	00 00                	add    BYTE PTR [eax],al
 31018c8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31018cb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31018d1:	02 4b c5             	add    cl,BYTE PTR [ebx-0x3b]
 31018d4:	0c 04                	or     al,0x4
 31018d6:	04 00                	add    al,0x0
 31018d8:	1c 00                	sbb    al,0x0
 31018da:	00 00                	add    BYTE PTR [eax],al
 31018dc:	5c                   	pop    esp
 31018dd:	00 00                	add    BYTE PTR [eax],al
 31018df:	00 88 e7 ff ff 5d    	add    BYTE PTR [eax+0x5dffffe7],cl
 31018e5:	01 00                	add    DWORD PTR [eax],eax
 31018e7:	00 00                	add    BYTE PTR [eax],al
 31018e9:	41                   	inc    ecx
 31018ea:	0e                   	push   cs
 31018eb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31018f1:	03 59 01             	add    ebx,DWORD PTR [ecx+0x1]
 31018f4:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31018f7:	04 1c                	add    al,0x1c
 31018f9:	00 00                	add    BYTE PTR [eax],al
 31018fb:	00 7c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bh
 31018ff:	00 c5                	add    ch,al
 3101901:	e8 ff ff 8b 00       	call   39c1905 <lCommand+0x8af7a5>
 3101906:	00 00                	add    BYTE PTR [eax],al
 3101908:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310190b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101911:	02 87 c5 0c 04 04    	add    al,BYTE PTR [edi+0x4040cc5]
 3101917:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310191a:	00 00                	add    BYTE PTR [eax],al
 310191c:	9c                   	pushf  
 310191d:	00 00                	add    BYTE PTR [eax],al
 310191f:	00 30                	add    BYTE PTR [eax],dh
 3101921:	e9 ff ff 07 02       	jmp    5181925 <lCommand+0x206f7c5>
 3101926:	00 00                	add    BYTE PTR [eax],al
 3101928:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310192b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101931:	03 03                	add    eax,DWORD PTR [ebx]
 3101933:	02 c5                	add    al,ch
 3101935:	0c 04                	or     al,0x4
 3101937:	04 1c                	add    al,0x1c
 3101939:	00 00                	add    BYTE PTR [eax],al
 310193b:	00 bc 00 00 00 17 eb 	add    BYTE PTR [eax+eax*1-0x14e90000],bh
 3101942:	ff                   	(bad)  
 3101943:	ff 19                	call   FWORD PTR [ecx]
 3101945:	00 00                	add    BYTE PTR [eax],al
 3101947:	00 00                	add    BYTE PTR [eax],al
 3101949:	41                   	inc    ecx
 310194a:	0e                   	push   cs
 310194b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101951:	55                   	push   ebp
 3101952:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101955:	04 00                	add    al,0x0
 3101957:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310195a:	00 00                	add    BYTE PTR [eax],al
 310195c:	dc 00                	fadd   QWORD PTR [eax]
 310195e:	00 00                	add    BYTE PTR [eax],al
 3101960:	10 eb                	adc    bl,ch
 3101962:	ff                   	(bad)  
 3101963:	ff a2 00 00 00 00    	jmp    DWORD PTR [edx+0x0]
 3101969:	41                   	inc    ecx
 310196a:	0e                   	push   cs
 310196b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101971:	02 9e c5 0c 04 04    	add    bl,BYTE PTR [esi+0x4040cc5]
 3101977:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310197a:	00 00                	add    BYTE PTR [eax],al
 310197c:	fc                   	cld    
 310197d:	00 00                	add    BYTE PTR [eax],al
 310197f:	00 92 eb ff ff 19    	add    BYTE PTR [edx+0x19ffffeb],dl
 3101985:	00 00                	add    BYTE PTR [eax],al
 3101987:	00 00                	add    BYTE PTR [eax],al
 3101989:	41                   	inc    ecx
 310198a:	0e                   	push   cs
 310198b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101991:	55                   	push   ebp
 3101992:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101995:	04 00                	add    al,0x0
 3101997:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310199a:	00 00                	add    BYTE PTR [eax],al
 310199c:	1c 01                	sbb    al,0x1
 310199e:	00 00                	add    BYTE PTR [eax],al
 31019a0:	8b eb                	mov    ebp,ebx
 31019a2:	ff                   	(bad)  
 31019a3:	ff 58 00             	call   FWORD PTR [eax+0x0]
 31019a6:	00 00                	add    BYTE PTR [eax],al
 31019a8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31019ab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31019b1:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 31019b5:	04 04                	add    al,0x4
 31019b7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31019ba:	00 00                	add    BYTE PTR [eax],al
 31019bc:	3c 01                	cmp    al,0x1
 31019be:	00 00                	add    BYTE PTR [eax],al
 31019c0:	c3                   	ret    
 31019c1:	eb ff                	jmp    31019c2 <kShell+0xad5>
 31019c3:	ff ce                	dec    esi
 31019c5:	00 00                	add    BYTE PTR [eax],al
 31019c7:	00 00                	add    BYTE PTR [eax],al
 31019c9:	41                   	inc    ecx
 31019ca:	0e                   	push   cs
 31019cb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31019d1:	02 ca                	add    cl,dl
 31019d3:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31019d6:	04 00                	add    al,0x0
 31019d8:	1c 00                	sbb    al,0x0
 31019da:	00 00                	add    BYTE PTR [eax],al
 31019dc:	5c                   	pop    esp
 31019dd:	01 00                	add    DWORD PTR [eax],eax
 31019df:	00 71 ec             	add    BYTE PTR [ecx-0x14],dh
 31019e2:	ff                   	(bad)  
 31019e3:	ff 4e 00             	dec    DWORD PTR [esi+0x0]
 31019e6:	00 00                	add    BYTE PTR [eax],al
 31019e8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31019eb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31019f1:	02 4a c5             	add    cl,BYTE PTR [edx-0x3b]
 31019f4:	0c 04                	or     al,0x4
 31019f6:	04 00                	add    al,0x0
 31019f8:	20 00                	and    BYTE PTR [eax],al
 31019fa:	00 00                	add    BYTE PTR [eax],al
 31019fc:	7c 01                	jl     31019ff <kShell+0xb12>
 31019fe:	00 00                	add    BYTE PTR [eax],al
 3101a00:	9f                   	lahf   
 3101a01:	ec                   	in     al,dx
 3101a02:	ff                   	(bad)  
 3101a03:	ff 11                	call   DWORD PTR [ecx]
 3101a05:	01 00                	add    DWORD PTR [eax],eax
 3101a07:	00 00                	add    BYTE PTR [eax],al
 3101a09:	41                   	inc    ecx
 3101a0a:	0e                   	push   cs
 3101a0b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a11:	47                   	inc    edi
 3101a12:	83 03 03             	add    DWORD PTR [ebx],0x3
 3101a15:	06                   	push   es
 3101a16:	01 c5                	add    ebp,eax
 3101a18:	c3                   	ret    
 3101a19:	0c 04                	or     al,0x4
 3101a1b:	04 20                	add    al,0x20
 3101a1d:	00 00                	add    BYTE PTR [eax],al
 3101a1f:	00 a0 01 00 00 8c    	add    BYTE PTR [eax-0x73ffffff],ah
 3101a25:	ed                   	in     eax,dx
 3101a26:	ff                   	(bad)  
 3101a27:	ff a6 00 00 00 00    	jmp    DWORD PTR [esi+0x0]
 3101a2d:	41                   	inc    ecx
 3101a2e:	0e                   	push   cs
 3101a2f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a35:	44                   	inc    esp
 3101a36:	83 03 02             	add    DWORD PTR [ebx],0x2
 3101a39:	9e                   	sahf   
 3101a3a:	c5 c3 0c             	(bad)  
 3101a3d:	04 04                	add    al,0x4
 3101a3f:	00 20                	add    BYTE PTR [eax],ah
 3101a41:	00 00                	add    BYTE PTR [eax],al
 3101a43:	00 c4                	add    ah,al
 3101a45:	01 00                	add    DWORD PTR [eax],eax
 3101a47:	00 0e                	add    BYTE PTR [esi],cl
 3101a49:	ee                   	out    dx,al
 3101a4a:	ff                   	(bad)  
 3101a4b:	ff a9 01 00 00 00    	jmp    FWORD PTR [ecx+0x1]
 3101a51:	41                   	inc    ecx
 3101a52:	0e                   	push   cs
 3101a53:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a59:	44                   	inc    esp
 3101a5a:	83 03 03             	add    DWORD PTR [ebx],0x3
 3101a5d:	a1 01 c5 c3 0c       	mov    eax,ds:0xcc3c501
 3101a62:	04 04                	add    al,0x4
 3101a64:	1c 00                	sbb    al,0x0
 3101a66:	00 00                	add    BYTE PTR [eax],al
 3101a68:	e8 01 00 00 93       	call   96101a6e <lCommand+0x92fef90e>
 3101a6d:	ef                   	out    dx,eax
 3101a6e:	ff                   	(bad)  
 3101a6f:	ff 69 00             	jmp    FWORD PTR [ecx+0x0]
 3101a72:	00 00                	add    BYTE PTR [eax],al
 3101a74:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101a77:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a7d:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3101a80:	0c 04                	or     al,0x4
 3101a82:	04 00                	add    al,0x0
 3101a84:	1c 00                	sbb    al,0x0
 3101a86:	00 00                	add    BYTE PTR [eax],al
 3101a88:	08 02                	or     BYTE PTR [edx],al
 3101a8a:	00 00                	add    BYTE PTR [eax],al
 3101a8c:	dc ef                	fsub   st(7),st
 3101a8e:	ff                   	(bad)  
 3101a8f:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3101a95:	41                   	inc    ecx
 3101a96:	0e                   	push   cs
 3101a97:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a9d:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 3101aa3:	04 20                	add    al,0x20
 3101aa5:	00 00                	add    BYTE PTR [eax],al
 3101aa7:	00 28                	add    BYTE PTR [eax],ch
 3101aa9:	02 00                	add    al,BYTE PTR [eax]
 3101aab:	00 4a f2             	add    BYTE PTR [edx-0xe],cl
 3101aae:	ff                   	(bad)  
 3101aaf:	ff 76 00             	push   DWORD PTR [esi+0x0]
 3101ab2:	00 00                	add    BYTE PTR [eax],al
 3101ab4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101ab7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101abd:	44                   	inc    esp
 3101abe:	83 03 02             	add    DWORD PTR [ebx],0x2
 3101ac1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101ac2:	c5 c3 0c             	(bad)  
 3101ac5:	04 04                	add    al,0x4
 3101ac7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101aca:	00 00                	add    BYTE PTR [eax],al
 3101acc:	4c                   	dec    esp
 3101acd:	02 00                	add    al,BYTE PTR [eax]
 3101acf:	00 9c f2 ff ff 3d 00 	add    BYTE PTR [edx+esi*8+0x3dffff],bl
 3101ad6:	00 00                	add    BYTE PTR [eax],al
 3101ad8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101adb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101ae1:	79 c5                	jns    3101aa8 <kShell+0xbbb>
 3101ae3:	0c 04                	or     al,0x4
 3101ae5:	04 00                	add    al,0x0
 3101ae7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101aea:	00 00                	add    BYTE PTR [eax],al
 3101aec:	6c                   	ins    BYTE PTR es:[edi],dx
 3101aed:	02 00                	add    al,BYTE PTR [eax]
 3101aef:	00 b9 f2 ff ff 8c    	add    BYTE PTR [ecx-0x7300000e],bh
 3101af5:	00 00                	add    BYTE PTR [eax],al
 3101af7:	00 00                	add    BYTE PTR [eax],al
 3101af9:	41                   	inc    ecx
 3101afa:	0e                   	push   cs
 3101afb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b01:	02 88 c5 0c 04 04    	add    cl,BYTE PTR [eax+0x4040cc5]
 3101b07:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b0a:	00 00                	add    BYTE PTR [eax],al
 3101b0c:	8c 02                	mov    WORD PTR [edx],es
 3101b0e:	00 00                	add    BYTE PTR [eax],al
 3101b10:	25 f3 ff ff 2e       	and    eax,0x2efffff3
 3101b15:	00 00                	add    BYTE PTR [eax],al
 3101b17:	00 00                	add    BYTE PTR [eax],al
 3101b19:	41                   	inc    ecx
 3101b1a:	0e                   	push   cs
 3101b1b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b21:	6a c5                	push   0xffffffc5
 3101b23:	0c 04                	or     al,0x4
 3101b25:	04 00                	add    al,0x0
 3101b27:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b2a:	00 00                	add    BYTE PTR [eax],al
 3101b2c:	ac                   	lods   al,BYTE PTR ds:[esi]
 3101b2d:	02 00                	add    al,BYTE PTR [eax]
 3101b2f:	00 33                	add    BYTE PTR [ebx],dh
 3101b31:	f3 ff                	repz (bad) 
 3101b33:	ff 23                	jmp    DWORD PTR [ebx]
 3101b35:	00 00                	add    BYTE PTR [eax],al
 3101b37:	00 00                	add    BYTE PTR [eax],al
 3101b39:	41                   	inc    ecx
 3101b3a:	0e                   	push   cs
 3101b3b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b41:	5f                   	pop    edi
 3101b42:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101b45:	04 00                	add    al,0x0
 3101b47:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b4a:	00 00                	add    BYTE PTR [eax],al
 3101b4c:	cc                   	int3   
 3101b4d:	02 00                	add    al,BYTE PTR [eax]
 3101b4f:	00 36                	add    BYTE PTR [esi],dh
 3101b51:	f3 ff                	repz (bad) 
 3101b53:	ff 26                	jmp    DWORD PTR [esi]
 3101b55:	00 00                	add    BYTE PTR [eax],al
 3101b57:	00 00                	add    BYTE PTR [eax],al
 3101b59:	41                   	inc    ecx
 3101b5a:	0e                   	push   cs
 3101b5b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b61:	62                   	(bad)  
 3101b62:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101b65:	04 00                	add    al,0x0
 3101b67:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b6a:	00 00                	add    BYTE PTR [eax],al
 3101b6c:	ec                   	in     al,dx
 3101b6d:	02 00                	add    al,BYTE PTR [eax]
 3101b6f:	00 3c f3             	add    BYTE PTR [ebx+esi*8],bh
 3101b72:	ff                   	(bad)  
 3101b73:	ff 16                	call   DWORD PTR [esi]
 3101b75:	00 00                	add    BYTE PTR [eax],al
 3101b77:	00 00                	add    BYTE PTR [eax],al
 3101b79:	41                   	inc    ecx
 3101b7a:	0e                   	push   cs
 3101b7b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b81:	52                   	push   edx
 3101b82:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101b85:	04 00                	add    al,0x0
 3101b87:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b8a:	00 00                	add    BYTE PTR [eax],al
 3101b8c:	0c 03                	or     al,0x3
 3101b8e:	00 00                	add    BYTE PTR [eax],al
 3101b90:	32 f3                	xor    dh,bl
 3101b92:	ff                   	(bad)  
 3101b93:	ff 2b                	jmp    FWORD PTR [ebx]
 3101b95:	00 00                	add    BYTE PTR [eax],al
 3101b97:	00 00                	add    BYTE PTR [eax],al
 3101b99:	41                   	inc    ecx
 3101b9a:	0e                   	push   cs
 3101b9b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101ba1:	67 c5 0c             	lds    ecx,FWORD PTR [si]
 3101ba4:	04 04                	add    al,0x4
 3101ba6:	00 00                	add    BYTE PTR [eax],al
 3101ba8:	1c 00                	sbb    al,0x0
 3101baa:	00 00                	add    BYTE PTR [eax],al
 3101bac:	2c 03                	sub    al,0x3
 3101bae:	00 00                	add    BYTE PTR [eax],al
 3101bb0:	3d f3 ff ff cb       	cmp    eax,0xcbfffff3
 3101bb5:	03 00                	add    eax,DWORD PTR [eax]
 3101bb7:	00 00                	add    BYTE PTR [eax],al
 3101bb9:	41                   	inc    ecx
 3101bba:	0e                   	push   cs
 3101bbb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101bc1:	03 c7                	add    eax,edi
 3101bc3:	03 c5                	add    eax,ebp
 3101bc5:	0c 04                	or     al,0x4
 3101bc7:	04                   	.byte 0x4

Disassembly of section .interp:

03101bc8 <.interp>:
 3101bc8:	2f                   	das    
 3101bc9:	6c                   	ins    BYTE PTR es:[edi],dx
 3101bca:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3101bd1:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3101bd8:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03101bdc <.dynsym>:
	...
 3101bec:	09 00                	or     DWORD PTR [eax],eax
	...
 3101bf6:	00 00                	add    BYTE PTR [eax],al
 3101bf8:	12 00                	adc    al,BYTE PTR [eax]
 3101bfa:	00 00                	add    BYTE PTR [eax],al
 3101bfc:	10 00                	adc    BYTE PTR [eax],al
	...
 3101c06:	00 00                	add    BYTE PTR [eax],al
 3101c08:	12 00                	adc    al,BYTE PTR [eax]
 3101c0a:	00 00                	add    BYTE PTR [eax],al
 3101c0c:	18 00                	sbb    BYTE PTR [eax],al
	...
 3101c16:	00 00                	add    BYTE PTR [eax],al
 3101c18:	12 00                	adc    al,BYTE PTR [eax]
 3101c1a:	00 00                	add    BYTE PTR [eax],al
 3101c1c:	1e                   	push   ds
	...
 3101c25:	00 00                	add    BYTE PTR [eax],al
 3101c27:	00 12                	add    BYTE PTR [edx],dl
 3101c29:	00 00                	add    BYTE PTR [eax],al
 3101c2b:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
 3101c31:	00 00                	add    BYTE PTR [eax],al
 3101c33:	00 00                	add    BYTE PTR [eax],al
 3101c35:	00 00                	add    BYTE PTR [eax],al
 3101c37:	00 12                	add    BYTE PTR [edx],dl
 3101c39:	00 00                	add    BYTE PTR [eax],al
 3101c3b:	00 2e                	add    BYTE PTR [esi],ch
	...
 3101c45:	00 00                	add    BYTE PTR [eax],al
 3101c47:	00 12                	add    BYTE PTR [edx],dl
 3101c49:	00 00                	add    BYTE PTR [eax],al
 3101c4b:	00 35 00 00 00 00    	add    BYTE PTR ds:0x0,dh
 3101c51:	00 00                	add    BYTE PTR [eax],al
 3101c53:	00 00                	add    BYTE PTR [eax],al
 3101c55:	00 00                	add    BYTE PTR [eax],al
 3101c57:	00 12                	add    BYTE PTR [edx],dl
 3101c59:	00 00                	add    BYTE PTR [eax],al
 3101c5b:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
	...
 3101c66:	00 00                	add    BYTE PTR [eax],al
 3101c68:	12 00                	adc    al,BYTE PTR [eax]
 3101c6a:	00 00                	add    BYTE PTR [eax],al
 3101c6c:	43                   	inc    ebx
	...
 3101c75:	00 00                	add    BYTE PTR [eax],al
 3101c77:	00 12                	add    BYTE PTR [edx],dl
 3101c79:	00 00                	add    BYTE PTR [eax],al
 3101c7b:	00 49 00             	add    BYTE PTR [ecx+0x0],cl
	...
 3101c86:	00 00                	add    BYTE PTR [eax],al
 3101c88:	12 00                	adc    al,BYTE PTR [eax]
 3101c8a:	00 00                	add    BYTE PTR [eax],al
 3101c8c:	57                   	push   edi
	...
 3101c95:	00 00                	add    BYTE PTR [eax],al
 3101c97:	00 12                	add    BYTE PTR [edx],dl
 3101c99:	00 00                	add    BYTE PTR [eax],al
 3101c9b:	00 5f 00             	add    BYTE PTR [edi+0x0],bl
	...
 3101ca6:	00 00                	add    BYTE PTR [eax],al
 3101ca8:	12 00                	adc    al,BYTE PTR [eax]
 3101caa:	00 00                	add    BYTE PTR [eax],al
 3101cac:	64 00 00             	add    BYTE PTR fs:[eax],al
	...
 3101cb7:	00 12                	add    BYTE PTR [edx],dl
 3101cb9:	00 00                	add    BYTE PTR [eax],al
 3101cbb:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
	...
 3101cc6:	00 00                	add    BYTE PTR [eax],al
 3101cc8:	12 00                	adc    al,BYTE PTR [eax]
 3101cca:	00 00                	add    BYTE PTR [eax],al
 3101ccc:	72 00                	jb     3101cce <kShell+0xde1>
	...
 3101cd6:	00 00                	add    BYTE PTR [eax],al
 3101cd8:	12 00                	adc    al,BYTE PTR [eax]
 3101cda:	00 00                	add    BYTE PTR [eax],al
 3101cdc:	79 00                	jns    3101cde <kShell+0xdf1>
	...
 3101ce6:	00 00                	add    BYTE PTR [eax],al
 3101ce8:	12 00                	adc    al,BYTE PTR [eax]
 3101cea:	00 00                	add    BYTE PTR [eax],al
 3101cec:	7e 00                	jle    3101cee <kShell+0xe01>
	...
 3101cf6:	00 00                	add    BYTE PTR [eax],al
 3101cf8:	12 00                	adc    al,BYTE PTR [eax]
 3101cfa:	00 00                	add    BYTE PTR [eax],al
 3101cfc:	86 00                	xchg   BYTE PTR [eax],al
	...
 3101d06:	00 00                	add    BYTE PTR [eax],al
 3101d08:	12 00                	adc    al,BYTE PTR [eax]
 3101d0a:	00 00                	add    BYTE PTR [eax],al
 3101d0c:	8e 00                	mov    es,WORD PTR [eax]
	...
 3101d16:	00 00                	add    BYTE PTR [eax],al
 3101d18:	12 00                	adc    al,BYTE PTR [eax]
 3101d1a:	00 00                	add    BYTE PTR [eax],al
 3101d1c:	95                   	xchg   ebp,eax
	...
 3101d25:	00 00                	add    BYTE PTR [eax],al
 3101d27:	00 12                	add    BYTE PTR [edx],dl
 3101d29:	00 00                	add    BYTE PTR [eax],al
 3101d2b:	00 9c 00 00 00 00 00 	add    BYTE PTR [eax+eax*1+0x0],bl
 3101d32:	00 00                	add    BYTE PTR [eax],al
 3101d34:	00 00                	add    BYTE PTR [eax],al
 3101d36:	00 00                	add    BYTE PTR [eax],al
 3101d38:	12 00                	adc    al,BYTE PTR [eax]
 3101d3a:	00 00                	add    BYTE PTR [eax],al
 3101d3c:	a1 00 00 00 00       	mov    eax,ds:0x0
 3101d41:	00 00                	add    BYTE PTR [eax],al
 3101d43:	00 00                	add    BYTE PTR [eax],al
 3101d45:	00 00                	add    BYTE PTR [eax],al
 3101d47:	00 12                	add    BYTE PTR [edx],dl
 3101d49:	00 00                	add    BYTE PTR [eax],al
 3101d4b:	00 a8 00 00 00 00    	add    BYTE PTR [eax+0x0],ch
 3101d51:	00 00                	add    BYTE PTR [eax],al
 3101d53:	00 00                	add    BYTE PTR [eax],al
 3101d55:	00 00                	add    BYTE PTR [eax],al
 3101d57:	00 12                	add    BYTE PTR [edx],dl
 3101d59:	00 00                	add    BYTE PTR [eax],al
 3101d5b:	00 b0 00 00 00 00    	add    BYTE PTR [eax+0x0],dh
 3101d61:	00 00                	add    BYTE PTR [eax],al
 3101d63:	00 00                	add    BYTE PTR [eax],al
 3101d65:	00 00                	add    BYTE PTR [eax],al
 3101d67:	00 12                	add    BYTE PTR [edx],dl
 3101d69:	00 00                	add    BYTE PTR [eax],al
 3101d6b:	00 b7 00 00 00 00    	add    BYTE PTR [edi+0x0],dh
 3101d71:	00 00                	add    BYTE PTR [eax],al
 3101d73:	00 00                	add    BYTE PTR [eax],al
 3101d75:	00 00                	add    BYTE PTR [eax],al
 3101d77:	00 12                	add    BYTE PTR [edx],dl
 3101d79:	00 00                	add    BYTE PTR [eax],al
 3101d7b:	00 c4                	add    ah,al
	...
 3101d85:	00 00                	add    BYTE PTR [eax],al
 3101d87:	00 12                	add    BYTE PTR [edx],dl
 3101d89:	00 00                	add    BYTE PTR [eax],al
 3101d8b:	00 c9                	add    cl,cl
	...
 3101d95:	00 00                	add    BYTE PTR [eax],al
 3101d97:	00 12                	add    BYTE PTR [edx],dl
 3101d99:	00 00                	add    BYTE PTR [eax],al
 3101d9b:	00 ce                	add    dh,cl
	...
 3101da5:	00 00                	add    BYTE PTR [eax],al
 3101da7:	00 12                	add    BYTE PTR [edx],dl
 3101da9:	00 00                	add    BYTE PTR [eax],al
 3101dab:	00 d5                	add    ch,dl
	...
 3101db5:	00 00                	add    BYTE PTR [eax],al
 3101db7:	00 12                	add    BYTE PTR [edx],dl
 3101db9:	00 00                	add    BYTE PTR [eax],al
 3101dbb:	00 db                	add    bl,bl
	...
 3101dc5:	00 00                	add    BYTE PTR [eax],al
 3101dc7:	00 12                	add    BYTE PTR [edx],dl
 3101dc9:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

03101dcc <.dynstr>:
 3101dcc:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3101dd0:	63 2e                	arpl   WORD PTR [esi],bp
 3101dd2:	73 6f                	jae    3101e43 <kShell+0xf56>
 3101dd4:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101dd7:	72 63                	jb     3101e3c <kShell+0xf4f>
 3101dd9:	70 79                	jo     3101e54 <kShell+0xf67>
 3101ddb:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3101dde:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3101de5:	72 
 3101de6:	69 6e 74 00 70 72 69 	imul   ebp,DWORD PTR [esi+0x74],0x69727000
 3101ded:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101dee:	74 66                	je     3101e56 <kShell+0xf69>
 3101df0:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 3101df3:	73 65                	jae    3101e5a <kShell+0xf6d>
 3101df5:	74 52                	je     3101e49 <kShell+0xf5c>
 3101df7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101df8:	77 00                	ja     3101dfa <kShell+0xf0d>
 3101dfa:	67                   	addr16
 3101dfb:	65                   	gs
 3101dfc:	74 65                	je     3101e63 <kShell+0xf76>
 3101dfe:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101dff:	76 00                	jbe    3101e01 <kShell+0xf14>
 3101e01:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e02:	65                   	gs
 3101e03:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e04:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3101e07:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 3101e0a:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e0b:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e0c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e0d:	63 00                	arpl   WORD PTR [eax],ax
 3101e0f:	73 6c                	jae    3101e7d <kShell+0xf90>
 3101e11:	65                   	gs
 3101e12:	65                   	gs
 3101e13:	70 00                	jo     3101e15 <kShell+0xf28>
 3101e15:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 3101e18:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e19:	69 6e 65 54 6f 41 72 	imul   ebp,DWORD PTR [esi+0x65],0x72416f54
 3101e20:	67 76 00             	addr16 jbe 3101e23 <kShell+0xf36>
 3101e23:	73 74                	jae    3101e99 <kShell+0xfac>
 3101e25:	72 74                	jb     3101e9b <kShell+0xfae>
 3101e27:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e28:	75 6c                	jne    3101e96 <kShell+0xfa9>
 3101e2a:	00 69 74             	add    BYTE PTR [ecx+0x74],ch
 3101e2d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e2e:	61                   	popa   
 3101e2f:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101e32:	74 74                	je     3101ea8 <kShell+0xfbb>
 3101e34:	69 63 6b 73 00 65 78 	imul   esp,DWORD PTR [ebx+0x6b],0x78650073
 3101e3b:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 3101e3e:	73 74                	jae    3101eb4 <kShell+0xfc7>
 3101e40:	72 73                	jb     3101eb5 <kShell+0xfc8>
 3101e42:	74 72                	je     3101eb6 <kShell+0xfc9>
 3101e44:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 3101e47:	61                   	popa   
 3101e48:	64 00 73 74          	add    BYTE PTR fs:[ebx+0x74],dh
 3101e4c:	72 6e                	jb     3101ebc <kShell+0xfcf>
 3101e4e:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 3101e51:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101e54:	72 6e                	jb     3101ec4 <kShell+0xfd7>
 3101e56:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3101e59:	00 73 65             	add    BYTE PTR [ebx+0x65],dh
 3101e5c:	74 65                	je     3101ec3 <kShell+0xfd6>
 3101e5e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101e5f:	76 00                	jbe    3101e61 <kShell+0xf74>
 3101e61:	73 74                	jae    3101ed7 <kShell+0xfea>
 3101e63:	72 74                	jb     3101ed9 <kShell+0xfec>
 3101e65:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e66:	6b 00 66             	imul   eax,DWORD PTR [eax],0x66
 3101e69:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e6a:	72 6b                	jb     3101ed7 <kShell+0xfea>
 3101e6c:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3101e6f:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e70:	73 65                	jae    3101ed7 <kShell+0xfea>
 3101e72:	74 00                	je     3101e74 <kShell+0xf87>
 3101e74:	73 74                	jae    3101eea <kShell+0xffd>
 3101e76:	72 74                	jb     3101eec <kShell+0xfff>
 3101e78:	72 69                	jb     3101ee3 <kShell+0xff6>
 3101e7a:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e7b:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101e7e:	74 63                	je     3101ee3 <kShell+0xff6>
 3101e80:	77 64                	ja     3101ee6 <kShell+0xff9>
 3101e82:	00 6d 6f             	add    BYTE PTR [ebp+0x6f],ch
 3101e85:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
 3101e8c:	6e 
 3101e8d:	61                   	popa   
 3101e8e:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e8f:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101e92:	69 74 00 61 74 6f 69 	imul   esi,DWORD PTR [eax+eax*1+0x61],0x696f74
 3101e99:	00 
 3101e9a:	73 74                	jae    3101f10 <kShell+0x1023>
 3101e9c:	72 6c                	jb     3101f0a <kShell+0x101d>
 3101e9e:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101ea0:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101ea3:	65 63 61 00          	arpl   WORD PTR gs:[ecx+0x0],sp
 3101ea7:	66                   	data16
 3101ea8:	72 65                	jb     3101f0f <kShell+0x1022>
 3101eaa:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 3101ead:	2e                   	cs
 3101eae:	2f                   	das    
 3101eaf:	6c                   	ins    BYTE PTR es:[edi],dx
 3101eb0:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3101eb7:	4f                   	dec    edi
 3101eb8:	53                   	push   ebx
 3101eb9:	2f                   	das    
 3101eba:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3101ec1:	62 
 3101ec2:	75 67                	jne    3101f2b <kShell+0x103e>
 3101ec4:	2f                   	das    
 3101ec5:	47                   	inc    edi
 3101ec6:	4e                   	dec    esi
 3101ec7:	55                   	push   ebp
 3101ec8:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3101ecd:	78 00                	js     3101ecf <kShell+0xfe2>

Disassembly of section .hash:

03101ed0 <.hash>:
 3101ed0:	11 00                	adc    DWORD PTR [eax],eax
 3101ed2:	00 00                	add    BYTE PTR [eax],al
 3101ed4:	1f                   	pop    ds
 3101ed5:	00 00                	add    BYTE PTR [eax],al
 3101ed7:	00 0f                	add    BYTE PTR [edi],cl
 3101ed9:	00 00                	add    BYTE PTR [eax],al
 3101edb:	00 00                	add    BYTE PTR [eax],al
 3101edd:	00 00                	add    BYTE PTR [eax],al
 3101edf:	00 15 00 00 00 0b    	add    BYTE PTR ds:0xb000000,dl
 3101ee5:	00 00                	add    BYTE PTR [eax],al
 3101ee7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101eea:	00 00                	add    BYTE PTR [eax],al
 3101eec:	00 00                	add    BYTE PTR [eax],al
 3101eee:	00 00                	add    BYTE PTR [eax],al
 3101ef0:	12 00                	adc    al,BYTE PTR [eax]
 3101ef2:	00 00                	add    BYTE PTR [eax],al
 3101ef4:	10 00                	adc    BYTE PTR [eax],al
 3101ef6:	00 00                	add    BYTE PTR [eax],al
 3101ef8:	07                   	pop    es
 3101ef9:	00 00                	add    BYTE PTR [eax],al
 3101efb:	00 00                	add    BYTE PTR [eax],al
 3101efd:	00 00                	add    BYTE PTR [eax],al
 3101eff:	00 17                	add    BYTE PTR [edi],dl
 3101f01:	00 00                	add    BYTE PTR [eax],al
 3101f03:	00 19                	add    BYTE PTR [ecx],bl
 3101f05:	00 00                	add    BYTE PTR [eax],al
 3101f07:	00 1e                	add    BYTE PTR [esi],bl
 3101f09:	00 00                	add    BYTE PTR [eax],al
 3101f0b:	00 1b                	add    BYTE PTR [ebx],bl
 3101f0d:	00 00                	add    BYTE PTR [eax],al
 3101f0f:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 3101f12:	00 00                	add    BYTE PTR [eax],al
 3101f14:	05 00 00 00 14       	add    eax,0x14000000
	...
 3101f35:	00 00                	add    BYTE PTR [eax],al
 3101f37:	00 06                	add    BYTE PTR [esi],al
 3101f39:	00 00                	add    BYTE PTR [eax],al
 3101f3b:	00 04 00             	add    BYTE PTR [eax+eax*1],al
	...
 3101f4e:	00 00                	add    BYTE PTR [eax],al
 3101f50:	09 00                	or     DWORD PTR [eax],eax
 3101f52:	00 00                	add    BYTE PTR [eax],al
 3101f54:	0d 00 00 00 0e       	or     eax,0xe000000
 3101f59:	00 00                	add    BYTE PTR [eax],al
 3101f5b:	00 03                	add    BYTE PTR [ebx],al
 3101f5d:	00 00                	add    BYTE PTR [eax],al
 3101f5f:	00 00                	add    BYTE PTR [eax],al
 3101f61:	00 00                	add    BYTE PTR [eax],al
 3101f63:	00 0a                	add    BYTE PTR [edx],cl
 3101f65:	00 00                	add    BYTE PTR [eax],al
 3101f67:	00 02                	add    BYTE PTR [edx],al
	...
 3101f71:	00 00                	add    BYTE PTR [eax],al
 3101f73:	00 13                	add    BYTE PTR [ebx],dl
 3101f75:	00 00                	add    BYTE PTR [eax],al
 3101f77:	00 08                	add    BYTE PTR [eax],cl
 3101f79:	00 00                	add    BYTE PTR [eax],al
 3101f7b:	00 16                	add    BYTE PTR [esi],dl
 3101f7d:	00 00                	add    BYTE PTR [eax],al
 3101f7f:	00 11                	add    BYTE PTR [ecx],dl
 3101f81:	00 00                	add    BYTE PTR [eax],al
 3101f83:	00 18                	add    BYTE PTR [eax],bl
 3101f85:	00 00                	add    BYTE PTR [eax],al
 3101f87:	00 1a                	add    BYTE PTR [edx],bl
 3101f89:	00 00                	add    BYTE PTR [eax],al
 3101f8b:	00 00                	add    BYTE PTR [eax],al
 3101f8d:	00 00                	add    BYTE PTR [eax],al
 3101f8f:	00 01                	add    BYTE PTR [ecx],al
 3101f91:	00 00                	add    BYTE PTR [eax],al
 3101f93:	00                   	.byte 0x0
 3101f94:	1d                   	.byte 0x1d
 3101f95:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03101f98 <.eh_frame>:
 3101f98:	14 00                	adc    al,0x0
 3101f9a:	00 00                	add    BYTE PTR [eax],al
 3101f9c:	00 00                	add    BYTE PTR [eax],al
 3101f9e:	00 00                	add    BYTE PTR [eax],al
 3101fa0:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3101fa3:	00 01                	add    BYTE PTR [ecx],al
 3101fa5:	7c 08                	jl     3101faf <kShell+0x10c2>
 3101fa7:	01 1b                	add    DWORD PTR [ebx],ebx
 3101fa9:	0c 04                	or     al,0x4
 3101fab:	04 88                	add    al,0x88
 3101fad:	01 00                	add    DWORD PTR [eax],eax
 3101faf:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3101fb2:	00 00                	add    BYTE PTR [eax],al
 3101fb4:	1c 00                	sbb    al,0x0
 3101fb6:	00 00                	add    BYTE PTR [eax],al
 3101fb8:	08 f3                	or     bl,dh
 3101fba:	ff                   	(bad)  
 3101fbb:	ff f0                	push   eax
 3101fbd:	01 00                	add    DWORD PTR [eax],eax
 3101fbf:	00 00                	add    BYTE PTR [eax],al
 3101fc1:	0e                   	push   cs
 3101fc2:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3101fc5:	0c 4a                	or     al,0x4a
 3101fc7:	0f 0b                	ud2    
 3101fc9:	74 04                	je     3101fcf <kShell+0x10e2>
 3101fcb:	78 00                	js     3101fcd <kShell+0x10e0>
 3101fcd:	3f                   	aas    
 3101fce:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3101fd0:	2a 32                	sub    dh,BYTE PTR [edx]
 3101fd2:	24 22                	and    al,0x22
 3101fd4:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03101fd8 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3101fd8:	01 1b                	add    DWORD PTR [ebx],ebx
 3101fda:	03 3b                	add    edi,DWORD PTR [ebx]
 3101fdc:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 3101fdd:	f8                   	clc    
 3101fde:	ff                   	(bad)  
 3101fdf:	ff 19                	call   FWORD PTR [ecx]
 3101fe1:	00 00                	add    BYTE PTR [eax],al
 3101fe3:	00 28                	add    BYTE PTR [eax],ch
 3101fe5:	e0 ff                	loopne 3101fe6 <__GNU_EH_FRAME_HDR+0xe>
 3101fe7:	ff c0                	inc    eax
 3101fe9:	f8                   	clc    
 3101fea:	ff                   	(bad)  
 3101feb:	ff 41 e0             	inc    DWORD PTR [ecx-0x20]
 3101fee:	ff                   	(bad)  
 3101fef:	ff e0                	jmp    eax
 3101ff1:	f8                   	clc    
 3101ff2:	ff                   	(bad)  
 3101ff3:	ff 90 e0 ff ff 00    	call   DWORD PTR [eax+0xffffe0]
 3101ff9:	f9                   	stc    
 3101ffa:	ff                   	(bad)  
 3101ffb:	ff ed                	jmp    <internal disassembler error>
 3101ffd:	e1 ff                	loope  3101ffe <__GNU_EH_FRAME_HDR+0x26>
 3101fff:	ff 20                	jmp    DWORD PTR [eax]
 3102001:	f9                   	stc    
 3102002:	ff                   	(bad)  
 3102003:	ff                   	(bad)  
 3102004:	78 e2                	js     3101fe8 <__GNU_EH_FRAME_HDR+0x10>
 3102006:	ff                   	(bad)  
 3102007:	ff 40 f9             	inc    DWORD PTR [eax-0x7]
 310200a:	ff                   	(bad)  
 310200b:	ff                   	(bad)  
 310200c:	7f e4                	jg     3101ff2 <__GNU_EH_FRAME_HDR+0x1a>
 310200e:	ff                   	(bad)  
 310200f:	ff 60 f9             	jmp    DWORD PTR [eax-0x7]
 3102012:	ff                   	(bad)  
 3102013:	ff 98 e4 ff ff 80    	call   FWORD PTR [eax-0x7f00001c]
 3102019:	f9                   	stc    
 310201a:	ff                   	(bad)  
 310201b:	ff                   	(bad)  
 310201c:	3a e5                	cmp    ah,ch
 310201e:	ff                   	(bad)  
 310201f:	ff a0 f9 ff ff 53    	jmp    DWORD PTR [eax+0x53fffff9]
 3102025:	e5 ff                	in     eax,0xff
 3102027:	ff c0                	inc    eax
 3102029:	f9                   	stc    
 310202a:	ff                   	(bad)  
 310202b:	ff ab e5 ff ff e0    	jmp    FWORD PTR [ebx-0x1f00001b]
 3102031:	f9                   	stc    
 3102032:	ff                   	(bad)  
 3102033:	ff                   	(bad)  
 3102034:	79 e6                	jns    310201c <__GNU_EH_FRAME_HDR+0x44>
 3102036:	ff                   	(bad)  
 3102037:	ff 00                	inc    DWORD PTR [eax]
 3102039:	fa                   	cli    
 310203a:	ff                   	(bad)  
 310203b:	ff c7                	inc    edi
 310203d:	e6 ff                	out    0xff,al
 310203f:	ff 20                	jmp    DWORD PTR [eax]
 3102041:	fa                   	cli    
 3102042:	ff                   	(bad)  
 3102043:	ff d8                	call   <internal disassembler error>
 3102045:	e7 ff                	out    0xff,eax
 3102047:	ff 44 fa ff          	inc    DWORD PTR [edx+edi*8-0x1]
 310204b:	ff                   	(bad)  
 310204c:	7e e8                	jle    3102036 <__GNU_EH_FRAME_HDR+0x5e>
 310204e:	ff                   	(bad)  
 310204f:	ff 68 fa             	jmp    FWORD PTR [eax-0x6]
 3102052:	ff                   	(bad)  
 3102053:	ff 27                	jmp    DWORD PTR [edi]
 3102055:	ea ff ff 8c fa ff ff 	jmp    0xffff:0xfa8cffff
 310205c:	90                   	nop
 310205d:	ea ff ff ac fa ff ff 	jmp    0xffff:0xfaacffff
 3102064:	1e                   	push   ds
 3102065:	ed                   	in     eax,dx
 3102066:	ff                   	(bad)  
 3102067:	ff cc                	dec    esp
 3102069:	fa                   	cli    
 310206a:	ff                   	(bad)  
 310206b:	ff 94 ed ff ff f0 fa 	call   DWORD PTR [ebp+ebp*8-0x50f0001]
 3102072:	ff                   	(bad)  
 3102073:	ff d1                	call   ecx
 3102075:	ed                   	in     eax,dx
 3102076:	ff                   	(bad)  
 3102077:	ff 10                	call   DWORD PTR [eax]
 3102079:	fb                   	sti    
 310207a:	ff                   	(bad)  
 310207b:	ff 5d ee             	call   FWORD PTR [ebp-0x12]
 310207e:	ff                   	(bad)  
 310207f:	ff 30                	push   DWORD PTR [eax]
 3102081:	fb                   	sti    
 3102082:	ff                   	(bad)  
 3102083:	ff 8b ee ff ff 50    	dec    DWORD PTR [ebx+0x50ffffee]
 3102089:	fb                   	sti    
 310208a:	ff                   	(bad)  
 310208b:	ff ae ee ff ff 70    	jmp    FWORD PTR [esi+0x70ffffee]
 3102091:	fb                   	sti    
 3102092:	ff                   	(bad)  
 3102093:	ff d4                	call   esp
 3102095:	ee                   	out    dx,al
 3102096:	ff                   	(bad)  
 3102097:	ff 90 fb ff ff ea    	call   DWORD PTR [eax-0x15000005]
 310209d:	ee                   	out    dx,al
 310209e:	ff                   	(bad)  
 310209f:	ff b0 fb ff ff 15    	push   DWORD PTR [eax+0x15fffffb]
 31020a5:	ef                   	out    dx,eax
 31020a6:	ff                   	(bad)  
 31020a7:	ff d0                	call   eax
 31020a9:	fb                   	sti    
 31020aa:	ff                   	(bad)  
 31020ab:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

031020ac <.rel.dyn>:
 31020ac:	7c 23                	jl     31020d1 <__GNU_EH_FRAME_HDR+0xf9>
 31020ae:	10 03                	adc    BYTE PTR [ebx],al
 31020b0:	07                   	pop    es
 31020b1:	01 00                	add    DWORD PTR [eax],eax
 31020b3:	00 80 23 10 03 07    	add    BYTE PTR [eax+0x7031023],al
 31020b9:	02 00                	add    al,BYTE PTR [eax]
 31020bb:	00 84 23 10 03 07 03 	add    BYTE PTR [ebx+eiz*1+0x3070310],al
 31020c2:	00 00                	add    BYTE PTR [eax],al
 31020c4:	88 23                	mov    BYTE PTR [ebx],ah
 31020c6:	10 03                	adc    BYTE PTR [ebx],al
 31020c8:	07                   	pop    es
 31020c9:	04 00                	add    al,0x0
 31020cb:	00 8c 23 10 03 07 05 	add    BYTE PTR [ebx+eiz*1+0x5070310],cl
 31020d2:	00 00                	add    BYTE PTR [eax],al
 31020d4:	90                   	nop
 31020d5:	23 10                	and    edx,DWORD PTR [eax]
 31020d7:	03 07                	add    eax,DWORD PTR [edi]
 31020d9:	06                   	push   es
 31020da:	00 00                	add    BYTE PTR [eax],al
 31020dc:	94                   	xchg   esp,eax
 31020dd:	23 10                	and    edx,DWORD PTR [eax]
 31020df:	03 07                	add    eax,DWORD PTR [edi]
 31020e1:	07                   	pop    es
 31020e2:	00 00                	add    BYTE PTR [eax],al
 31020e4:	98                   	cwde   
 31020e5:	23 10                	and    edx,DWORD PTR [eax]
 31020e7:	03 07                	add    eax,DWORD PTR [edi]
 31020e9:	08 00                	or     BYTE PTR [eax],al
 31020eb:	00 9c 23 10 03 07 09 	add    BYTE PTR [ebx+eiz*1+0x9070310],bl
 31020f2:	00 00                	add    BYTE PTR [eax],al
 31020f4:	a0 23 10 03 07       	mov    al,ds:0x7031023
 31020f9:	0a 00                	or     al,BYTE PTR [eax]
 31020fb:	00 a4 23 10 03 07 0b 	add    BYTE PTR [ebx+eiz*1+0xb070310],ah
 3102102:	00 00                	add    BYTE PTR [eax],al
 3102104:	a8 23                	test   al,0x23
 3102106:	10 03                	adc    BYTE PTR [ebx],al
 3102108:	07                   	pop    es
 3102109:	0c 00                	or     al,0x0
 310210b:	00 ac 23 10 03 07 0d 	add    BYTE PTR [ebx+eiz*1+0xd070310],ch
 3102112:	00 00                	add    BYTE PTR [eax],al
 3102114:	b0 23                	mov    al,0x23
 3102116:	10 03                	adc    BYTE PTR [ebx],al
 3102118:	07                   	pop    es
 3102119:	0e                   	push   cs
 310211a:	00 00                	add    BYTE PTR [eax],al
 310211c:	b4 23                	mov    ah,0x23
 310211e:	10 03                	adc    BYTE PTR [ebx],al
 3102120:	07                   	pop    es
 3102121:	0f 00 00             	sldt   WORD PTR [eax]
 3102124:	b8 23 10 03 07       	mov    eax,0x7031023
 3102129:	10 00                	adc    BYTE PTR [eax],al
 310212b:	00 bc 23 10 03 07 11 	add    BYTE PTR [ebx+eiz*1+0x11070310],bh
 3102132:	00 00                	add    BYTE PTR [eax],al
 3102134:	c0 23 10             	shl    BYTE PTR [ebx],0x10
 3102137:	03 07                	add    eax,DWORD PTR [edi]
 3102139:	12 00                	adc    al,BYTE PTR [eax]
 310213b:	00 c4                	add    ah,al
 310213d:	23 10                	and    edx,DWORD PTR [eax]
 310213f:	03 07                	add    eax,DWORD PTR [edi]
 3102141:	13 00                	adc    eax,DWORD PTR [eax]
 3102143:	00 c8                	add    al,cl
 3102145:	23 10                	and    edx,DWORD PTR [eax]
 3102147:	03 07                	add    eax,DWORD PTR [edi]
 3102149:	14 00                	adc    al,0x0
 310214b:	00 cc                	add    ah,cl
 310214d:	23 10                	and    edx,DWORD PTR [eax]
 310214f:	03 07                	add    eax,DWORD PTR [edi]
 3102151:	15 00 00 d0 23       	adc    eax,0x23d00000
 3102156:	10 03                	adc    BYTE PTR [ebx],al
 3102158:	07                   	pop    es
 3102159:	16                   	push   ss
 310215a:	00 00                	add    BYTE PTR [eax],al
 310215c:	d4 23                	aam    0x23
 310215e:	10 03                	adc    BYTE PTR [ebx],al
 3102160:	07                   	pop    es
 3102161:	17                   	pop    ss
 3102162:	00 00                	add    BYTE PTR [eax],al
 3102164:	d8 23                	fsub   DWORD PTR [ebx]
 3102166:	10 03                	adc    BYTE PTR [ebx],al
 3102168:	07                   	pop    es
 3102169:	18 00                	sbb    BYTE PTR [eax],al
 310216b:	00 dc                	add    ah,bl
 310216d:	23 10                	and    edx,DWORD PTR [eax]
 310216f:	03 07                	add    eax,DWORD PTR [edi]
 3102171:	19 00                	sbb    DWORD PTR [eax],eax
 3102173:	00 e0                	add    al,ah
 3102175:	23 10                	and    edx,DWORD PTR [eax]
 3102177:	03 07                	add    eax,DWORD PTR [edi]
 3102179:	1a 00                	sbb    al,BYTE PTR [eax]
 310217b:	00 e4                	add    ah,ah
 310217d:	23 10                	and    edx,DWORD PTR [eax]
 310217f:	03 07                	add    eax,DWORD PTR [edi]
 3102181:	1b 00                	sbb    eax,DWORD PTR [eax]
 3102183:	00 e8                	add    al,ch
 3102185:	23 10                	and    edx,DWORD PTR [eax]
 3102187:	03 07                	add    eax,DWORD PTR [edi]
 3102189:	1c 00                	sbb    al,0x0
 310218b:	00 ec                	add    ah,ch
 310218d:	23 10                	and    edx,DWORD PTR [eax]
 310218f:	03 07                	add    eax,DWORD PTR [edi]
 3102191:	1d 00 00 f0 23       	sbb    eax,0x23f00000
 3102196:	10 03                	adc    BYTE PTR [ebx],al
 3102198:	07                   	pop    es
 3102199:	1e                   	push   ds
	...

Disassembly of section .data:

031021a0 <cmds>:
 31021a0:	b0 14                	mov    al,0x14
 31021a2:	10 03                	adc    BYTE PTR [ebx],al
 31021a4:	b6 14                	mov    dh,0x14
 31021a6:	10 03                	adc    BYTE PTR [ebx],al
 31021a8:	00 00                	add    BYTE PTR [eax],al
 31021aa:	10 03                	adc    BYTE PTR [ebx],al
 31021ac:	00 00                	add    BYTE PTR [eax],al
 31021ae:	00 00                	add    BYTE PTR [eax],al
 31021b0:	c7                   	(bad)  
 31021b1:	14 10                	adc    al,0x10
 31021b3:	03 cb                	add    ecx,ebx
 31021b5:	14 10                	adc    al,0x10
 31021b7:	03 19                	add    ebx,DWORD PTR [ecx]
 31021b9:	00 10                	add    BYTE PTR [eax],dl
 31021bb:	03 00                	add    eax,DWORD PTR [eax]
 31021bd:	00 00                	add    BYTE PTR [eax],al
 31021bf:	00 dd                	add    ch,bl
 31021c1:	14 10                	adc    al,0x10
 31021c3:	03 e2                	add    esp,edx
 31021c5:	14 10                	adc    al,0x10
 31021c7:	03 12                	add    edx,DWORD PTR [edx]
 31021c9:	05 10 03 01 00       	add    eax,0x10310
 31021ce:	00 00                	add    BYTE PTR [eax],al
 31021d0:	f4                   	hlt    
 31021d1:	14 10                	adc    al,0x10
 31021d3:	03 f9                	add    edi,ecx
 31021d5:	14 10                	adc    al,0x10
 31021d7:	03 2b                	add    ebp,DWORD PTR [ebx]
 31021d9:	05 10 03 01 00       	add    eax,0x10310
 31021de:	00 00                	add    BYTE PTR [eax],al
 31021e0:	05 15 10 03 0a       	add    eax,0xa031015
 31021e5:	15 10 03 83 05       	adc    eax,0x5830310
 31021ea:	10 03                	adc    BYTE PTR [ebx],al
 31021ec:	01 00                	add    DWORD PTR [eax],eax
 31021ee:	00 00                	add    BYTE PTR [eax],al
 31021f0:	26                   	es
 31021f1:	15 10 03 2a 15       	adc    eax,0x152a0310
 31021f6:	10 03                	adc    BYTE PTR [ebx],al
 31021f8:	51                   	push   ecx
 31021f9:	06                   	push   es
 31021fa:	10 03                	adc    BYTE PTR [ebx],al
 31021fc:	00 00                	add    BYTE PTR [eax],al
 31021fe:	00 00                	add    BYTE PTR [eax],al
 3102200:	42                   	inc    edx
 3102201:	15 10 03 49 15       	adc    eax,0x15490310
 3102206:	10 03                	adc    BYTE PTR [ebx],al
 3102208:	70 04                	jo     310220e <cmds+0x6e>
 310220a:	10 03                	adc    BYTE PTR [ebx],al
 310220c:	01 00                	add    DWORD PTR [eax],eax
 310220e:	00 00                	add    BYTE PTR [eax],al
 3102210:	62 15 10 03 66 15    	bound  edx,QWORD PTR ds:0x15660310
 3102216:	10 03                	adc    BYTE PTR [ebx],al
 3102218:	68 00 10 03 01       	push   0x1031000
 310221d:	00 00                	add    BYTE PTR [eax],al
 310221f:	00 82 15 10 03 88    	add    BYTE PTR [edx-0x77fcefeb],al
 3102225:	15 10 03 9f 06       	adc    eax,0x69f0310
 310222a:	10 03                	adc    BYTE PTR [ebx],al
 310222c:	01 00                	add    DWORD PTR [eax],eax
 310222e:	00 00                	add    BYTE PTR [eax],al
 3102230:	9c                   	pushf  
 3102231:	15 10 03 a4 15       	adc    eax,0x15a40310
 3102236:	10 03                	adc    BYTE PTR [ebx],al
 3102238:	57                   	push   edi
 3102239:	04 10                	add    al,0x10
 310223b:	03 01                	add    eax,DWORD PTR [ecx]
 310223d:	00 00                	add    BYTE PTR [eax],al
	...

03102240 <cmds>:
 3102240:	10 17                	adc    BYTE PTR [edi],dl
 3102242:	10 03                	adc    BYTE PTR [ebx],al
 3102244:	16                   	push   ss
 3102245:	17                   	pop    ss
 3102246:	10 03                	adc    BYTE PTR [ebx],al
 3102248:	00 00                	add    BYTE PTR [eax],al
 310224a:	10 03                	adc    BYTE PTR [ebx],al
 310224c:	00 00                	add    BYTE PTR [eax],al
 310224e:	00 00                	add    BYTE PTR [eax],al
 3102250:	27                   	daa    
 3102251:	17                   	pop    ss
 3102252:	10 03                	adc    BYTE PTR [ebx],al
 3102254:	2b 17                	sub    edx,DWORD PTR [edi]
 3102256:	10 03                	adc    BYTE PTR [ebx],al
 3102258:	19 00                	sbb    DWORD PTR [eax],eax
 310225a:	10 03                	adc    BYTE PTR [ebx],al
 310225c:	00 00                	add    BYTE PTR [eax],al
 310225e:	00 00                	add    BYTE PTR [eax],al
 3102260:	3d 17 10 03 42       	cmp    eax,0x42031017
 3102265:	17                   	pop    ss
 3102266:	10 03                	adc    BYTE PTR [ebx],al
 3102268:	12 05 10 03 01 00    	adc    al,BYTE PTR ds:0x10310
 310226e:	00 00                	add    BYTE PTR [eax],al
 3102270:	54                   	push   esp
 3102271:	17                   	pop    ss
 3102272:	10 03                	adc    BYTE PTR [ebx],al
 3102274:	59                   	pop    ecx
 3102275:	17                   	pop    ss
 3102276:	10 03                	adc    BYTE PTR [ebx],al
 3102278:	2b 05 10 03 01 00    	sub    eax,DWORD PTR ds:0x10310
 310227e:	00 00                	add    BYTE PTR [eax],al
 3102280:	65                   	gs
 3102281:	17                   	pop    ss
 3102282:	10 03                	adc    BYTE PTR [ebx],al
 3102284:	6a 17                	push   0x17
 3102286:	10 03                	adc    BYTE PTR [ebx],al
 3102288:	83 05 10 03 01 00 00 	add    DWORD PTR ds:0x10310,0x0
 310228f:	00 86 17 10 03 8a    	add    BYTE PTR [esi-0x75fcefe9],al
 3102295:	17                   	pop    ss
 3102296:	10 03                	adc    BYTE PTR [ebx],al
 3102298:	51                   	push   ecx
 3102299:	06                   	push   es
 310229a:	10 03                	adc    BYTE PTR [ebx],al
 310229c:	00 00                	add    BYTE PTR [eax],al
 310229e:	00 00                	add    BYTE PTR [eax],al
 31022a0:	a2 17 10 03 a9       	mov    ds:0xa9031017,al
 31022a5:	17                   	pop    ss
 31022a6:	10 03                	adc    BYTE PTR [ebx],al
 31022a8:	70 04                	jo     31022ae <cmds+0x6e>
 31022aa:	10 03                	adc    BYTE PTR [ebx],al
 31022ac:	01 00                	add    DWORD PTR [eax],eax
 31022ae:	00 00                	add    BYTE PTR [eax],al
 31022b0:	c2 17 10             	ret    0x1017
 31022b3:	03 c6                	add    eax,esi
 31022b5:	17                   	pop    ss
 31022b6:	10 03                	adc    BYTE PTR [ebx],al
 31022b8:	68 00 10 03 01       	push   0x1031000
 31022bd:	00 00                	add    BYTE PTR [eax],al
 31022bf:	00 e2                	add    dl,ah
 31022c1:	17                   	pop    ss
 31022c2:	10 03                	adc    BYTE PTR [ebx],al
 31022c4:	e8 17 10 03 9f       	call   a21332e0 <lCommand+0x9f021180>
 31022c9:	06                   	push   es
 31022ca:	10 03                	adc    BYTE PTR [ebx],al
 31022cc:	01 00                	add    DWORD PTR [eax],eax
 31022ce:	00 00                	add    BYTE PTR [eax],al
 31022d0:	fc                   	cld    
 31022d1:	17                   	pop    ss
 31022d2:	10 03                	adc    BYTE PTR [ebx],al
 31022d4:	04 18                	add    al,0x18
 31022d6:	10 03                	adc    BYTE PTR [ebx],al
 31022d8:	57                   	push   edi
 31022d9:	04 10                	add    al,0x10
 31022db:	03 01                	add    eax,DWORD PTR [ecx]
 31022dd:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynamic:

031022e0 <_DYNAMIC>:
 31022e0:	01 00                	add    DWORD PTR [eax],eax
 31022e2:	00 00                	add    BYTE PTR [eax],al
 31022e4:	01 00                	add    DWORD PTR [eax],eax
 31022e6:	00 00                	add    BYTE PTR [eax],al
 31022e8:	0f 00 00             	sldt   WORD PTR [eax]
 31022eb:	00 e0                	add    al,ah
 31022ed:	00 00                	add    BYTE PTR [eax],al
 31022ef:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 31022f2:	00 00                	add    BYTE PTR [eax],al
 31022f4:	d0 1e                	rcr    BYTE PTR [esi],1
 31022f6:	10 03                	adc    BYTE PTR [ebx],al
 31022f8:	05 00 00 00 cc       	add    eax,0xcc000000
 31022fd:	1d 10 03 06 00       	sbb    eax,0x60310
 3102302:	00 00                	add    BYTE PTR [eax],al
 3102304:	dc 1b                	fcomp  QWORD PTR [ebx]
 3102306:	10 03                	adc    BYTE PTR [ebx],al
 3102308:	0a 00                	or     al,BYTE PTR [eax]
 310230a:	00 00                	add    BYTE PTR [eax],al
 310230c:	03 01                	add    eax,DWORD PTR [ecx]
 310230e:	00 00                	add    BYTE PTR [eax],al
 3102310:	0b 00                	or     eax,DWORD PTR [eax]
 3102312:	00 00                	add    BYTE PTR [eax],al
 3102314:	10 00                	adc    BYTE PTR [eax],al
 3102316:	00 00                	add    BYTE PTR [eax],al
 3102318:	15 00 00 00 00       	adc    eax,0x0
 310231d:	00 00                	add    BYTE PTR [eax],al
 310231f:	00 03                	add    BYTE PTR [ebx],al
 3102321:	00 00                	add    BYTE PTR [eax],al
 3102323:	00 70 23             	add    BYTE PTR [eax+0x23],dh
 3102326:	10 03                	adc    BYTE PTR [ebx],al
 3102328:	02 00                	add    al,BYTE PTR [eax]
 310232a:	00 00                	add    BYTE PTR [eax],al
 310232c:	f0 00 00             	lock add BYTE PTR [eax],al
 310232f:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
 3102332:	00 00                	add    BYTE PTR [eax],al
 3102334:	11 00                	adc    DWORD PTR [eax],eax
 3102336:	00 00                	add    BYTE PTR [eax],al
 3102338:	17                   	pop    ss
 3102339:	00 00                	add    BYTE PTR [eax],al
 310233b:	00 ac 20 10 03 00 00 	add    BYTE PTR [eax+eiz*1+0x310],ch
	...

Disassembly of section .got.plt:

03102370 <_GLOBAL_OFFSET_TABLE_>:
 3102370:	e0 22                	loopne 3102394 <_GLOBAL_OFFSET_TABLE_+0x24>
 3102372:	10 03                	adc    BYTE PTR [ebx],al
	...
 310237c:	d6                   	(bad)  
 310237d:	12 10                	adc    dl,BYTE PTR [eax]
 310237f:	03 e6                	add    esp,esi
 3102381:	12 10                	adc    dl,BYTE PTR [eax]
 3102383:	03 f6                	add    esi,esi
 3102385:	12 10                	adc    dl,BYTE PTR [eax]
 3102387:	03 06                	add    eax,DWORD PTR [esi]
 3102389:	13 10                	adc    edx,DWORD PTR [eax]
 310238b:	03 16                	add    edx,DWORD PTR [esi]
 310238d:	13 10                	adc    edx,DWORD PTR [eax]
 310238f:	03 26                	add    esp,DWORD PTR [esi]
 3102391:	13 10                	adc    edx,DWORD PTR [eax]
 3102393:	03 36                	add    esi,DWORD PTR [esi]
 3102395:	13 10                	adc    edx,DWORD PTR [eax]
 3102397:	03 46 13             	add    eax,DWORD PTR [esi+0x13]
 310239a:	10 03                	adc    BYTE PTR [ebx],al
 310239c:	56                   	push   esi
 310239d:	13 10                	adc    edx,DWORD PTR [eax]
 310239f:	03 66 13             	add    esp,DWORD PTR [esi+0x13]
 31023a2:	10 03                	adc    BYTE PTR [ebx],al
 31023a4:	76 13                	jbe    31023b9 <_GLOBAL_OFFSET_TABLE_+0x49>
 31023a6:	10 03                	adc    BYTE PTR [ebx],al
 31023a8:	86 13                	xchg   BYTE PTR [ebx],dl
 31023aa:	10 03                	adc    BYTE PTR [ebx],al
 31023ac:	96                   	xchg   esi,eax
 31023ad:	13 10                	adc    edx,DWORD PTR [eax]
 31023af:	03 a6 13 10 03 b6    	add    esp,DWORD PTR [esi-0x49fcefed]
 31023b5:	13 10                	adc    edx,DWORD PTR [eax]
 31023b7:	03 c6                	add    eax,esi
 31023b9:	13 10                	adc    edx,DWORD PTR [eax]
 31023bb:	03 d6                	add    edx,esi
 31023bd:	13 10                	adc    edx,DWORD PTR [eax]
 31023bf:	03 e6                	add    esp,esi
 31023c1:	13 10                	adc    edx,DWORD PTR [eax]
 31023c3:	03 f6                	add    esi,esi
 31023c5:	13 10                	adc    edx,DWORD PTR [eax]
 31023c7:	03 06                	add    eax,DWORD PTR [esi]
 31023c9:	14 10                	adc    al,0x10
 31023cb:	03 16                	add    edx,DWORD PTR [esi]
 31023cd:	14 10                	adc    al,0x10
 31023cf:	03 26                	add    esp,DWORD PTR [esi]
 31023d1:	14 10                	adc    al,0x10
 31023d3:	03 36                	add    esi,DWORD PTR [esi]
 31023d5:	14 10                	adc    al,0x10
 31023d7:	03 46 14             	add    eax,DWORD PTR [esi+0x14]
 31023da:	10 03                	adc    BYTE PTR [ebx],al
 31023dc:	56                   	push   esi
 31023dd:	14 10                	adc    al,0x10
 31023df:	03 66 14             	add    esp,DWORD PTR [esi+0x14]
 31023e2:	10 03                	adc    BYTE PTR [ebx],al
 31023e4:	76 14                	jbe    31023fa <_GLOBAL_OFFSET_TABLE_+0x8a>
 31023e6:	10 03                	adc    BYTE PTR [ebx],al
 31023e8:	86 14 10             	xchg   BYTE PTR [eax+edx*1],dl
 31023eb:	03 96 14 10 03 a6    	add    edx,DWORD PTR [esi-0x59fcefec]
 31023f1:	14 10                	adc    al,0x10
 31023f3:	03                   	.byte 0x3

Disassembly of section .bss:

03102400 <bSigIntReceived>:
 3102400:	00 00                	add    BYTE PTR [eax],al
	...

03102404 <delim>:
	...

0310240c <environmentLoc>:
	...

03102420 <cwd>:
	...

03102520 <sExecutingProgram>:
	...

03102720 <command_function_p>:
 3102720:	00 00                	add    BYTE PTR [eax],al
	...

03102724 <cpuid_extended_feature_bits>:
 3102724:	00 00                	add    BYTE PTR [eax],al
	...

03102728 <heapEnd>:
 3102728:	00 00                	add    BYTE PTR [eax],al
	...

0310272c <heapBase>:
 310272c:	00 00                	add    BYTE PTR [eax],al
	...

03102730 <heapCurr>:
 3102730:	00 00                	add    BYTE PTR [eax],al
	...

03102734 <command_function>:
 3102734:	00 00                	add    BYTE PTR [eax],al
	...

03102738 <cpuid_procinfo>:
	...

03102740 <processEnvp>:
 3102740:	00 00                	add    BYTE PTR [eax],al
	...

03102744 <lastExecExitCode>:
 3102744:	00 00                	add    BYTE PTR [eax],al
	...

03102748 <exitCode>:
 3102748:	00 00                	add    BYTE PTR [eax],al
	...

0310274c <sKShellProgramName>:
 310274c:	00 00                	add    BYTE PTR [eax],al
	...

03102750 <libcTZ>:
 3102750:	00 00                	add    BYTE PTR [eax],al
	...

03102754 <timeToExit>:
 3102754:	00 00                	add    BYTE PTR [eax],al
	...

03102758 <commandHistoryPtr>:
 3102758:	00 00                	add    BYTE PTR [eax],al
	...

0310275c <commandHistoryMax>:
 310275c:	00 00                	add    BYTE PTR [eax],al
	...

03102760 <commandHistory>:
	...

03112160 <lCommand>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	dd 08                	fisttp QWORD PTR [eax]
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
      1c:	03 b0 07 00 00 00    	add    esi,DWORD PTR [eax+0x7]
      22:	00 00                	add    BYTE PTR [eax],al
      24:	00 02                	add    BYTE PTR [edx],al
      26:	01 06                	add    DWORD PTR [esi],eax
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
      98:	a8 03                	test   al,0x3
      9a:	00 00                	add    BYTE PTR [eax],al
      9c:	03 2e                	add    ebp,DWORD PTR [esi]
      9e:	3a 00                	cmp    al,BYTE PTR [eax]
      a0:	00 00                	add    BYTE PTR [eax],al
      a2:	00 06                	add    BYTE PTR [esi],al
      a4:	23 03                	and    eax,DWORD PTR [ebx]
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
      e0:	4d                   	dec    ebp
      e1:	03 00                	add    eax,DWORD PTR [eax]
      e3:	00 03                	add    BYTE PTR [ebx],al
      e5:	34 3a                	xor    al,0x3a
      e7:	00 00                	add    BYTE PTR [eax],al
      e9:	00 18                	add    BYTE PTR [eax],bl
      eb:	06                   	push   es
      ec:	08 03                	or     BYTE PTR [ebx],al
      ee:	00 00                	add    BYTE PTR [eax],al
      f0:	03 35 3a 00 00 00    	add    esi,DWORD PTR ds:0x3a
      f6:	1c 06                	sbb    al,0x6
      f8:	2a 03                	sub    al,BYTE PTR [ebx]
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
     12a:	10 03                	adc    BYTE PTR [ebx],al
     12c:	00 00                	add    BYTE PTR [eax],al
     12e:	09 04 02             	or     DWORD PTR [edx+eax*1],eax
     131:	04 07                	add    al,0x7
     133:	85 00                	test   DWORD PTR [eax],eax
     135:	00 00                	add    BYTE PTR [eax],al
     137:	0a 05 04 58 b8 01    	or     al,BYTE PTR ds:0x1b85804
     13d:	00 00                	add    BYTE PTR [eax],al
     13f:	0b f3                	or     esi,ebx
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
     1da:	8a 03                	mov    al,BYTE PTR [ebx]
     1dc:	00 00                	add    BYTE PTR [eax],al
     1de:	04 dc                	add    al,0xdc
     1e0:	48                   	dec    eax
     1e1:	00 00                	add    BYTE PTR [eax],al
     1e3:	00 01                	add    BYTE PTR [ecx],al
     1e5:	01 07                	add    DWORD PTR [edi],eax
     1e7:	00 0b                	add    BYTE PTR [ebx],cl
     1e9:	9d                   	popf   
     1ea:	03 00                	add    eax,DWORD PTR [eax]
     1ec:	00 04 dd 48 00 00 00 	add    BYTE PTR [ebx*8+0x48],al
     1f3:	01 01                	add    DWORD PTR [ecx],eax
     1f5:	06                   	push   es
     1f6:	00 0b                	add    BYTE PTR [ebx],cl
     1f8:	d0 03                	rol    BYTE PTR [ebx],1
     1fa:	00 00                	add    BYTE PTR [eax],al
     1fc:	04 de                	add    al,0xde
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
     22b:	15 55 02 00 00       	adc    eax,0x255
     230:	10 16                	adc    BYTE PTR [esi],dl
     232:	03 00                	add    eax,DWORD PTR [eax]
     234:	00 01                	add    BYTE PTR [ecx],al
     236:	10 05 02 00 00 02    	adc    BYTE PTR ds:0x2000002,al
     23c:	10 16                	adc    BYTE PTR [esi],dl
     23e:	01 00                	add    DWORD PTR [eax],eax
     240:	00 04 10             	add    BYTE PTR [eax+edx*1],al
     243:	d9 03                	fld    DWORD PTR [ebx]
     245:	00 00                	add    BYTE PTR [eax],al
     247:	08 10                	or     BYTE PTR [eax],dl
     249:	45                   	inc    ebp
     24a:	03 00                	add    eax,DWORD PTR [eax]
     24c:	00 10                	add    BYTE PTR [eax],dl
     24e:	10 97 00 00 00 20    	adc    BYTE PTR [edi+0x20000000],dl
     254:	00 0a                	add    BYTE PTR [edx],cl
     256:	10 05 13 8e 02 00    	adc    BYTE PTR ds:0x28e13,al
     25c:	00 06                	add    BYTE PTR [esi],al
     25e:	4b                   	dec    ebx
     25f:	02 00                	add    al,BYTE PTR [eax]
     261:	00 05 15 8e 02 00    	add    BYTE PTR ds:0x28e15,al
     267:	00 00                	add    BYTE PTR [eax],al
     269:	06                   	push   es
     26a:	79 00                	jns    26c <cmdClearScreen-0x30ffd94>
     26c:	00 00                	add    BYTE PTR [eax],al
     26e:	05 16 8e 02 00       	add    eax,0x28e16
     273:	00 04 06             	add    BYTE PTR [esi+eax*1],al
     276:	75 01                	jne    279 <cmdClearScreen-0x30ffd87>
     278:	00 00                	add    BYTE PTR [eax],al
     27a:	05 17 2e 01 00       	add    eax,0x12e17
     27f:	00 08                	add    BYTE PTR [eax],cl
     281:	06                   	push   es
     282:	9c                   	pushf  
     283:	01 00                	add    DWORD PTR [eax],eax
     285:	00 05 18 3a 00 00    	add    BYTE PTR ds:0x3a18,al
     28b:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
     28e:	07                   	pop    es
     28f:	04 25                	add    al,0x25
     291:	00 00                	add    BYTE PTR [eax],al
     293:	00 04 ff             	add    BYTE PTR [edi+edi*8],al
     296:	03 00                	add    eax,DWORD PTR [eax]
     298:	00 05 19 55 02 00    	add    BYTE PTR ds:0x25519,al
     29e:	00 11                	add    BYTE PTR [ecx],dl
     2a0:	85 01                	test   DWORD PTR [ecx],eax
     2a2:	00 00                	add    BYTE PTR [eax],al
     2a4:	01 0a                	add    DWORD PTR [edx],ecx
     2a6:	00 00                	add    BYTE PTR [eax],al
     2a8:	10 03                	adc    BYTE PTR [ebx],al
     2aa:	19 00                	sbb    DWORD PTR [eax],eax
     2ac:	00 00                	add    BYTE PTR [eax],al
     2ae:	01 9c 12 5e 00 00 00 	add    DWORD PTR [edx+edx*1+0x5e],ebx
     2b5:	01 0f                	add    DWORD PTR [edi],ecx
     2b7:	19 00                	sbb    DWORD PTR [eax],eax
     2b9:	10 03                	adc    BYTE PTR [ebx],al
     2bb:	4f                   	dec    edi
     2bc:	00 00                	add    BYTE PTR [eax],al
     2be:	00 01                	add    BYTE PTR [ecx],al
     2c0:	9c                   	pushf  
     2c1:	de 02                	fiadd  WORD PTR [edx]
     2c3:	00 00                	add    BYTE PTR [eax],al
     2c5:	13 1f                	adc    ebx,DWORD PTR [edi]
     2c7:	00 10                	add    BYTE PTR [eax],dl
     2c9:	03 46 00             	add    eax,DWORD PTR [esi+0x0]
     2cc:	00 00                	add    BYTE PTR [eax],al
     2ce:	14 63                	adc    al,0x63
     2d0:	6e                   	outs   dx,BYTE PTR ds:[esi]
     2d1:	74 00                	je     2d3 <cmdClearScreen-0x30ffd2d>
     2d3:	01 11                	add    DWORD PTR [ecx],edx
     2d5:	3a 00                	cmp    al,BYTE PTR [eax]
     2d7:	00 00                	add    BYTE PTR [eax],al
     2d9:	02 91 6c 00 00 15    	add    dl,BYTE PTR [ecx+0x1500006c]
     2df:	f6 02 00             	test   BYTE PTR [edx],0x0
     2e2:	00 01                	add    BYTE PTR [ecx],al
     2e4:	1b 68 00             	sbb    ebp,DWORD PTR [eax+0x0]
     2e7:	10 03                	adc    BYTE PTR [ebx],al
     2e9:	5d                   	pop    ebp
     2ea:	01 00                	add    DWORD PTR [eax],eax
     2ec:	00 01                	add    BYTE PTR [ecx],al
     2ee:	9c                   	pushf  
     2ef:	61                   	popa   
     2f0:	03 00                	add    eax,DWORD PTR [eax]
     2f2:	00 16                	add    BYTE PTR [esi],dl
     2f4:	9f                   	lahf   
     2f5:	00 00                	add    BYTE PTR [eax],al
     2f7:	00 01                	add    BYTE PTR [ecx],al
     2f9:	1b 8e 02 00 00 02    	sbb    ecx,DWORD PTR [esi+0x2000002]
     2ff:	91                   	xchg   ecx,eax
     300:	00 17                	add    BYTE PTR [edi],dl
     302:	44                   	inc    esp
     303:	02 00                	add    al,BYTE PTR [eax]
     305:	00 01                	add    BYTE PTR [ecx],al
     307:	1d 61 03 00 00       	sbb    eax,0x361
     30c:	03 91 dc 75 17 cc    	add    edx,DWORD PTR [ecx-0x33e88a24]
     312:	01 00                	add    DWORD PTR [eax],eax
     314:	00 01                	add    BYTE PTR [ecx],al
     316:	1e                   	push   ds
     317:	8e 02                	mov    es,WORD PTR [edx]
     319:	00 00                	add    BYTE PTR [eax],al
     31b:	02 91 60 17 0f 00    	add    dl,BYTE PTR [ecx+0xf1760]
     321:	00 00                	add    BYTE PTR [eax],al
     323:	01 1e                	add    DWORD PTR [esi],ebx
     325:	8e 02                	mov    es,WORD PTR [edx]
     327:	00 00                	add    BYTE PTR [eax],al
     329:	02 91 5c 13 93 00    	add    dl,BYTE PTR [ecx+0x93135c]
     32f:	10 03                	adc    BYTE PTR [ebx],al
     331:	29 01                	sub    DWORD PTR [ecx],eax
     333:	00 00                	add    BYTE PTR [eax],al
     335:	17                   	pop    ss
     336:	27                   	daa    
     337:	00 00                	add    BYTE PTR [eax],al
     339:	00 01                	add    BYTE PTR [ecx],al
     33b:	22 3a                	and    bh,BYTE PTR [edx]
     33d:	00 00                	add    BYTE PTR [eax],al
     33f:	00 02                	add    BYTE PTR [edx],al
     341:	91                   	xchg   ecx,eax
     342:	6c                   	ins    BYTE PTR es:[edi],dx
     343:	17                   	pop    ss
     344:	af                   	scas   eax,DWORD PTR es:[edi]
     345:	03 00                	add    eax,DWORD PTR [eax]
     347:	00 01                	add    BYTE PTR [ecx],al
     349:	22 3a                	and    bh,BYTE PTR [edx]
     34b:	00 00                	add    BYTE PTR [eax],al
     34d:	00 02                	add    BYTE PTR [edx],al
     34f:	91                   	xchg   ecx,eax
     350:	68 17 5a 03 00       	push   0x35a17
     355:	00 01                	add    BYTE PTR [ecx],al
     357:	23 3a                	and    edi,DWORD PTR [edx]
     359:	00 00                	add    BYTE PTR [eax],al
     35b:	00 02                	add    BYTE PTR [edx],al
     35d:	91                   	xchg   ecx,eax
     35e:	64 00 00             	add    BYTE PTR fs:[eax],al
     361:	18 25 00 00 00 77    	sbb    BYTE PTR ds:0x77000000,ah
     367:	03 00                	add    eax,DWORD PTR [eax]
     369:	00 19                	add    BYTE PTR [ecx],bl
     36b:	30 01                	xor    BYTE PTR [ecx],al
     36d:	00 00                	add    BYTE PTR [eax],al
     36f:	09 19                	or     DWORD PTR [ecx],ebx
     371:	30 01                	xor    BYTE PTR [ecx],al
     373:	00 00                	add    BYTE PTR [eax],al
     375:	7f 00                	jg     377 <cmdClearScreen-0x30ffc89>
     377:	1a f8                	sbb    bh,al
     379:	03 00                	add    eax,DWORD PTR [eax]
     37b:	00 01                	add    BYTE PTR [ecx],al
     37d:	3a 3a                	cmp    bh,BYTE PTR [edx]
     37f:	00 00                	add    BYTE PTR [eax],al
     381:	00 c5                	add    ch,al
     383:	01 10                	add    DWORD PTR [eax],edx
     385:	03 8b 00 00 00 01    	add    ecx,DWORD PTR [ebx+0x1000000]
     38b:	9c                   	pushf  
     38c:	ef                   	out    dx,eax
     38d:	03 00                	add    eax,DWORD PTR [eax]
     38f:	00 16                	add    BYTE PTR [esi],dl
     391:	69 03 00 00 01 3a    	imul   eax,DWORD PTR [ebx],0x3a010000
     397:	8e 02                	mov    es,WORD PTR [edx]
     399:	00 00                	add    BYTE PTR [eax],al
     39b:	02 91 00 16 09 05    	add    dl,BYTE PTR [ecx+0x5091600]
     3a1:	00 00                	add    BYTE PTR [eax],al
     3a3:	01 3a                	add    DWORD PTR [edx],edi
     3a5:	3a 00                	cmp    al,BYTE PTR [eax]
     3a7:	00 00                	add    BYTE PTR [eax],al
     3a9:	02 91 04 16 4e 05    	add    dl,BYTE PTR [ecx+0x54e1604]
     3af:	00 00                	add    BYTE PTR [eax],al
     3b1:	01 3a                	add    DWORD PTR [edx],edi
     3b3:	ef                   	out    dx,eax
     3b4:	03 00                	add    eax,DWORD PTR [eax]
     3b6:	00 02                	add    BYTE PTR [edx],al
     3b8:	91                   	xchg   ecx,eax
     3b9:	08 16                	or     BYTE PTR [esi],dl
     3bb:	fa                   	cli    
     3bc:	01 00                	add    DWORD PTR [eax],eax
     3be:	00 01                	add    BYTE PTR [ecx],al
     3c0:	3a 27                	cmp    ah,BYTE PTR [edi]
     3c2:	01 00                	add    DWORD PTR [eax],eax
     3c4:	00 02                	add    BYTE PTR [edx],al
     3c6:	91                   	xchg   ecx,eax
     3c7:	5c                   	pop    esp
     3c8:	14 70                	adc    al,0x70
     3ca:	69 64 00 01 3c 3a 00 	imul   esp,DWORD PTR [eax+eax*1+0x1],0x3a3c
     3d1:	00 
     3d2:	00 02                	add    BYTE PTR [edx],al
     3d4:	91                   	xchg   ecx,eax
     3d5:	6c                   	ins    BYTE PTR es:[edi],dx
     3d6:	13 f9                	adc    edi,ecx
     3d8:	01 10                	add    DWORD PTR [eax],edx
     3da:	03 41 00             	add    eax,DWORD PTR [ecx+0x0]
     3dd:	00 00                	add    BYTE PTR [eax],al
     3df:	14 72                	adc    al,0x72
     3e1:	65                   	gs
     3e2:	74 00                	je     3e4 <cmdClearScreen-0x30ffc1c>
     3e4:	01 44 f5 03          	add    DWORD PTR [ebp+esi*8+0x3],eax
     3e8:	00 00                	add    BYTE PTR [eax],al
     3ea:	02 91 62 00 00 07    	add    dl,BYTE PTR [ecx+0x7000062]
     3f0:	04 8e                	add    al,0x8e
     3f2:	02 00                	add    al,BYTE PTR [eax]
     3f4:	00 18                	add    BYTE PTR [eax],bl
     3f6:	25 00 00 00 05       	and    eax,0x5000000
     3fb:	04 00                	add    al,0x0
     3fd:	00 19                	add    BYTE PTR [ecx],bl
     3ff:	30 01                	xor    BYTE PTR [ecx],al
     401:	00 00                	add    BYTE PTR [eax],al
     403:	09 00                	or     DWORD PTR [eax],eax
     405:	1a 4c 01 00          	sbb    cl,BYTE PTR [ecx+eax*1+0x0]
     409:	00 01                	add    BYTE PTR [ecx],al
     40b:	4e                   	dec    esi
     40c:	3a 00                	cmp    al,BYTE PTR [eax]
     40e:	00 00                	add    BYTE PTR [eax],al
     410:	50                   	push   eax
     411:	02 10                	add    dl,BYTE PTR [eax]
     413:	03 07                	add    eax,DWORD PTR [edi]
     415:	02 00                	add    al,BYTE PTR [eax]
     417:	00 01                	add    BYTE PTR [ecx],al
     419:	9c                   	pushf  
     41a:	3c 05                	cmp    al,0x5
     41c:	00 00                	add    BYTE PTR [eax],al
     41e:	16                   	push   ss
     41f:	9f                   	lahf   
     420:	00 00                	add    BYTE PTR [eax],al
     422:	00 01                	add    BYTE PTR [ecx],al
     424:	4e                   	dec    esi
     425:	8e 02                	mov    es,WORD PTR [edx]
     427:	00 00                	add    BYTE PTR [eax],al
     429:	02 91 00 16 72 00    	add    dl,BYTE PTR [ecx+0x721600]
     42f:	00 00                	add    BYTE PTR [eax],al
     431:	01 4e 27             	add    DWORD PTR [esi+0x27],ecx
     434:	01 00                	add    DWORD PTR [eax],eax
     436:	00 03                	add    BYTE PTR [ebx],al
     438:	91                   	xchg   ecx,eax
     439:	ac                   	lods   al,BYTE PTR ds:[esi]
     43a:	75 17                	jne    453 <cmdClearScreen-0x30ffbad>
     43c:	fa                   	cli    
     43d:	01 00                	add    DWORD PTR [eax],eax
     43f:	00 01                	add    BYTE PTR [ecx],al
     441:	50                   	push   eax
     442:	27                   	daa    
     443:	01 00                	add    DWORD PTR [eax],eax
     445:	00 02                	add    BYTE PTR [edx],al
     447:	91                   	xchg   ecx,eax
     448:	6f                   	outs   dx,DWORD PTR ds:[esi]
     449:	17                   	pop    ss
     44a:	50                   	push   eax
     44b:	02 00                	add    al,BYTE PTR [eax]
     44d:	00 01                	add    BYTE PTR [ecx],al
     44f:	51                   	push   ecx
     450:	3a 00                	cmp    al,BYTE PTR [eax]
     452:	00 00                	add    BYTE PTR [eax],al
     454:	02 91 64 1b 74 6f    	add    dl,BYTE PTR [ecx+0x6f741b64]
     45a:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
     45d:	52                   	push   edx
     45e:	8e 02                	mov    es,WORD PTR [edx]
     460:	00 00                	add    BYTE PTR [eax],al
     462:	14 70                	adc    al,0x70
     464:	67 6d                	ins    DWORD PTR es:[di],dx
     466:	00 01                	add    BYTE PTR [ecx],al
     468:	53                   	push   ebx
     469:	8e 02                	mov    es,WORD PTR [edx]
     46b:	00 00                	add    BYTE PTR [eax],al
     46d:	02 91 60 17 44 02    	add    dl,BYTE PTR [ecx+0x2441760]
     473:	00 00                	add    BYTE PTR [eax],al
     475:	01 55 61             	add    DWORD PTR [ebp+0x61],edx
     478:	03 00                	add    eax,DWORD PTR [eax]
     47a:	00 03                	add    BYTE PTR [ebx],al
     47c:	91                   	xchg   ecx,eax
     47d:	c4 75 17             	les    esi,FWORD PTR [ebp+0x17]
     480:	9c                   	pushf  
     481:	01 00                	add    DWORD PTR [eax],eax
     483:	00 01                	add    BYTE PTR [ecx],al
     485:	56                   	push   esi
     486:	3a 00                	cmp    al,BYTE PTR [eax]
     488:	00 00                	add    BYTE PTR [eax],al
     48a:	02 91 5c 17 18 00    	add    dl,BYTE PTR [ecx+0x18175c]
     490:	00 00                	add    BYTE PTR [eax],al
     492:	01 57 3a             	add    DWORD PTR [edi+0x3a],edx
     495:	00 00                	add    BYTE PTR [eax],al
     497:	00 02                	add    BYTE PTR [edx],al
     499:	91                   	xchg   ecx,eax
     49a:	58                   	pop    eax
     49b:	17                   	pop    ss
     49c:	cc                   	int3   
     49d:	02 00                	add    al,BYTE PTR [eax]
     49f:	00 01                	add    BYTE PTR [ecx],al
     4a1:	58                   	pop    eax
     4a2:	3a 00                	cmp    al,BYTE PTR [eax]
     4a4:	00 00                	add    BYTE PTR [eax],al
     4a6:	02 91 54 1c 3b 03    	add    dl,BYTE PTR [ecx+0x33b1c54]
     4ac:	00 00                	add    BYTE PTR [eax],al
     4ae:	01 59 3c             	add    DWORD PTR [ecx+0x3c],ebx
     4b1:	05 00 00 1c 33       	add    eax,0x331c0000
     4b6:	03 00                	add    eax,DWORD PTR [eax]
     4b8:	00 01                	add    BYTE PTR [ecx],al
     4ba:	59                   	pop    ecx
     4bb:	3c 05                	cmp    al,0x5
     4bd:	00 00                	add    BYTE PTR [eax],al
     4bf:	17                   	pop    ss
     4c0:	41                   	inc    ecx
     4c1:	01 00                	add    DWORD PTR [eax],eax
     4c3:	00 01                	add    BYTE PTR [ecx],al
     4c5:	5a                   	pop    edx
     4c6:	61                   	popa   
     4c7:	00 00                	add    BYTE PTR [eax],al
     4c9:	00 02                	add    BYTE PTR [edx],al
     4cb:	91                   	xchg   ecx,eax
     4cc:	4c                   	dec    esp
     4cd:	17                   	pop    ss
     4ce:	e6 02                	out    0x2,al
     4d0:	00 00                	add    BYTE PTR [eax],al
     4d2:	01 5a 61             	add    DWORD PTR [edx+0x61],ebx
     4d5:	00 00                	add    BYTE PTR [eax],al
     4d7:	00 02                	add    BYTE PTR [edx],al
     4d9:	91                   	xchg   ecx,eax
     4da:	44                   	inc    esp
     4db:	17                   	pop    ss
     4dc:	09 05 00 00 01 5f    	or     DWORD PTR ds:0x5f010000,eax
     4e2:	3a 00                	cmp    al,BYTE PTR [eax]
     4e4:	00 00                	add    BYTE PTR [eax],al
     4e6:	03 91 c0 75 17 4e    	add    edx,DWORD PTR [ecx+0x4e1775c0]
     4ec:	05 00 00 01 60       	add    eax,0x60010000
     4f1:	ef                   	out    dx,eax
     4f2:	03 00                	add    eax,DWORD PTR [eax]
     4f4:	00 02                	add    BYTE PTR [edx],al
     4f6:	91                   	xchg   ecx,eax
     4f7:	50                   	push   eax
     4f8:	1d 2f 03 10 03       	sbb    eax,0x310032f
     4fd:	4d                   	dec    ebp
     4fe:	00 00                	add    BYTE PTR [eax],al
     500:	00 22                	add    BYTE PTR [edx],ah
     502:	05 00 00 17 7e       	add    eax,0x7e170000
     507:	01 00                	add    DWORD PTR [eax],eax
     509:	00 01                	add    BYTE PTR [ecx],al
     50b:	74 3a                	je     547 <cmdClearScreen-0x30ffab9>
     50d:	00 00                	add    BYTE PTR [eax],al
     50f:	00 02                	add    BYTE PTR [edx],al
     511:	91                   	xchg   ecx,eax
     512:	68 17 f1 01 00       	push   0x1f117
     517:	00 01                	add    BYTE PTR [ecx],al
     519:	75 3a                	jne    555 <cmdClearScreen-0x30ffaab>
     51b:	00 00                	add    BYTE PTR [eax],al
     51d:	00 02                	add    BYTE PTR [edx],al
     51f:	91                   	xchg   ecx,eax
     520:	48                   	dec    eax
     521:	00 13                	add    BYTE PTR [ebx],dl
     523:	9f                   	lahf   
     524:	03 10                	add    edx,DWORD PTR [eax]
     526:	03 9a 00 00 00 14    	add    ebx,DWORD PTR [edx+0x14000000]
     52c:	72 65                	jb     593 <cmdClearScreen-0x30ffa6d>
     52e:	74 00                	je     530 <cmdClearScreen-0x30ffad0>
     530:	01 8e f5 03 00 00    	add    DWORD PTR [esi+0x3f5],ecx
     536:	03 91 b6 75 00 00    	add    edx,DWORD PTR [ecx+0x75b6]
     53c:	07                   	pop    es
     53d:	04 8c                	add    al,0x8c
     53f:	00 00                	add    BYTE PTR [eax],al
     541:	00 15 00 03 00 00    	add    BYTE PTR ds:0x300,dl
     547:	01 98 57 04 10 03    	add    DWORD PTR [eax+0x3100457],ebx
     54d:	19 00                	sbb    DWORD PTR [eax],eax
     54f:	00 00                	add    BYTE PTR [eax],al
     551:	01 9c 66 05 00 00 16 	add    DWORD PTR [esi+eiz*2+0x16000005],ebx
     558:	9f                   	lahf   
     559:	00 00                	add    BYTE PTR [eax],al
     55b:	00 01                	add    BYTE PTR [ecx],al
     55d:	98                   	cwde   
     55e:	8e 02                	mov    es,WORD PTR [edx]
     560:	00 00                	add    BYTE PTR [eax],al
     562:	02 91 00 00 15 3a    	add    dl,BYTE PTR [ecx+0x3a150000]
     568:	02 00                	add    al,BYTE PTR [eax]
     56a:	00 01                	add    BYTE PTR [ecx],al
     56c:	9d                   	popf   
     56d:	70 04                	jo     573 <cmdClearScreen-0x30ffa8d>
     56f:	10 03                	adc    BYTE PTR [ebx],al
     571:	a2 00 00 00 01       	mov    ds:0x1000000,al
     576:	9c                   	pushf  
     577:	da 05 00 00 16 9f    	fiadd  DWORD PTR ds:0x9f160000
     57d:	00 00                	add    BYTE PTR [eax],al
     57f:	00 01                	add    BYTE PTR [ecx],al
     581:	9d                   	popf   
     582:	8e 02                	mov    es,WORD PTR [edx]
     584:	00 00                	add    BYTE PTR [eax],al
     586:	02 91 00 17 09 05    	add    dl,BYTE PTR [ecx+0x5091700]
     58c:	00 00                	add    BYTE PTR [eax],al
     58e:	01 9f 3a 00 00 00    	add    DWORD PTR [edi+0x3a],ebx
     594:	02 91 5c 17 4e 05    	add    dl,BYTE PTR [ecx+0x54e175c]
     59a:	00 00                	add    BYTE PTR [eax],al
     59c:	01 a0 ef 03 00 00    	add    DWORD PTR [eax+0x3ef],esp
     5a2:	02 91 60 17 cd 02    	add    dl,BYTE PTR [ecx+0x2cd1760]
     5a8:	00 00                	add    BYTE PTR [eax],al
     5aa:	01 a1 3a 00 00 00    	add    DWORD PTR [ecx+0x3a],esp
     5b0:	02 91 68 17 2f 02    	add    dl,BYTE PTR [ecx+0x22f1768]
     5b6:	00 00                	add    BYTE PTR [eax],al
     5b8:	01 a2 8e 02 00 00    	add    DWORD PTR [edx+0x28e],esp
     5be:	02 91 64 13 b6 04    	add    dl,BYTE PTR [ecx+0x4b61364]
     5c4:	10 03                	adc    BYTE PTR [ebx],al
     5c6:	59                   	pop    ecx
     5c7:	00 00                	add    BYTE PTR [eax],al
     5c9:	00 14 63             	add    BYTE PTR [ebx+eiz*2],dl
     5cc:	6e                   	outs   dx,BYTE PTR ds:[esi]
     5cd:	74 00                	je     5cf <cmdClearScreen-0x30ffa31>
     5cf:	01 a7 3a 00 00 00    	add    DWORD PTR [edi+0x3a],esp
     5d5:	02 91 6c 00 00 15    	add    dl,BYTE PTR [ecx+0x1500006c]
     5db:	8e 00                	mov    es,WORD PTR [eax]
     5dd:	00 00                	add    BYTE PTR [eax],al
     5df:	01 b4 12 05 10 03 19 	add    DWORD PTR [edx+edx*1+0x19031005],esi
     5e6:	00 00                	add    BYTE PTR [eax],al
     5e8:	00 01                	add    BYTE PTR [ecx],al
     5ea:	9c                   	pushf  
     5eb:	fe 05 00 00 16 9f    	inc    BYTE PTR ds:0x9f160000
     5f1:	00 00                	add    BYTE PTR [eax],al
     5f3:	00 01                	add    BYTE PTR [ecx],al
     5f5:	b4 8e                	mov    ah,0x8e
     5f7:	02 00                	add    al,BYTE PTR [eax]
     5f9:	00 02                	add    BYTE PTR [edx],al
     5fb:	91                   	xchg   ecx,eax
     5fc:	00 00                	add    BYTE PTR [eax],al
     5fe:	15 2f 00 00 00       	adc    eax,0x2f
     603:	01 b9 2b 05 10 03    	add    DWORD PTR [ecx+0x310052b],edi
     609:	58                   	pop    eax
     60a:	00 00                	add    BYTE PTR [eax],al
     60c:	00 01                	add    BYTE PTR [ecx],al
     60e:	9c                   	pushf  
     60f:	31 06                	xor    DWORD PTR [esi],eax
     611:	00 00                	add    BYTE PTR [eax],al
     613:	16                   	push   ss
     614:	9f                   	lahf   
     615:	00 00                	add    BYTE PTR [eax],al
     617:	00 01                	add    BYTE PTR [ecx],al
     619:	b9 8e 02 00 00       	mov    ecx,0x28e
     61e:	02 91 00 17 44 02    	add    dl,BYTE PTR [ecx+0x2441700]
     624:	00 00                	add    BYTE PTR [eax],al
     626:	01 bb 61 03 00 00    	add    DWORD PTR [ebx+0x361],edi
     62c:	03 91 f0 75 00 15    	add    edx,DWORD PTR [ecx+0x150075f0]
     632:	77 02                	ja     636 <cmdClearScreen-0x30ff9ca>
     634:	00 00                	add    BYTE PTR [eax],al
     636:	01 c6                	add    esi,eax
     638:	83 05 10 03 ce 00 00 	add    DWORD PTR ds:0xce0310,0x0
     63f:	00 01                	add    BYTE PTR [ecx],al
     641:	9c                   	pushf  
     642:	7b 06                	jnp    64a <cmdClearScreen-0x30ff9b6>
     644:	00 00                	add    BYTE PTR [eax],al
     646:	16                   	push   ss
     647:	9f                   	lahf   
     648:	00 00                	add    BYTE PTR [eax],al
     64a:	00 01                	add    BYTE PTR [ecx],al
     64c:	c6                   	(bad)  
     64d:	8e 02                	mov    es,WORD PTR [edx]
     64f:	00 00                	add    BYTE PTR [eax],al
     651:	02 91 00 14 74 6f    	add    dl,BYTE PTR [ecx+0x6f741400]
     657:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
     65a:	c8 8e 02 00          	enter  0x28e,0x0
     65e:	00 02                	add    BYTE PTR [edx],al
     660:	91                   	xchg   ecx,eax
     661:	68 13 b2 05 10       	push   0x1005b213
     666:	03 9c 00 00 00 14 63 	add    ebx,DWORD PTR [eax+eax*1+0x63140000]
     66d:	6e                   	outs   dx,BYTE PTR ds:[esi]
     66e:	74 00                	je     670 <cmdClearScreen-0x30ff990>
     670:	01 d2                	add    edx,edx
     672:	6c                   	ins    BYTE PTR es:[edi],dx
     673:	00 00                	add    BYTE PTR [eax],al
     675:	00 02                	add    BYTE PTR [edx],al
     677:	91                   	xchg   ecx,eax
     678:	6c                   	ins    BYTE PTR es:[edi],dx
     679:	00 00                	add    BYTE PTR [eax],al
     67b:	12 20                	adc    ah,BYTE PTR [eax]
     67d:	01 00                	add    DWORD PTR [eax],eax
     67f:	00 01                	add    BYTE PTR [ecx],al
     681:	df 51 06             	fist   WORD PTR [ecx+0x6]
     684:	10 03                	adc    BYTE PTR [ebx],al
     686:	4e                   	dec    esi
     687:	00 00                	add    BYTE PTR [eax],al
     689:	00 01                	add    BYTE PTR [ecx],al
     68b:	9c                   	pushf  
     68c:	9f                   	lahf   
     68d:	06                   	push   es
     68e:	00 00                	add    BYTE PTR [eax],al
     690:	14 62                	adc    al,0x62
     692:	75 66                	jne    6fa <cmdClearScreen-0x30ff906>
     694:	00 01                	add    BYTE PTR [ecx],al
     696:	e1 8e                	loope  626 <cmdClearScreen-0x30ff9da>
     698:	02 00                	add    al,BYTE PTR [eax]
     69a:	00 02                	add    BYTE PTR [edx],al
     69c:	91                   	xchg   ecx,eax
     69d:	6c                   	ins    BYTE PTR es:[edi],dx
     69e:	00 15 c7 03 00 00    	add    BYTE PTR ds:0x3c7,dl
     6a4:	01 e6                	add    esi,esp
     6a6:	9f                   	lahf   
     6a7:	06                   	push   es
     6a8:	10 03                	adc    BYTE PTR [ebx],al
     6aa:	11 01                	adc    DWORD PTR [ecx],eax
     6ac:	00 00                	add    BYTE PTR [eax],al
     6ae:	01 9c 31 07 00 00 16 	add    DWORD PTR [ecx+esi*1+0x16000007],ebx
     6b5:	9f                   	lahf   
     6b6:	00 00                	add    BYTE PTR [eax],al
     6b8:	00 01                	add    BYTE PTR [ecx],al
     6ba:	e6 8e                	out    0x8e,al
     6bc:	02 00                	add    al,BYTE PTR [eax]
     6be:	00 02                	add    BYTE PTR [edx],al
     6c0:	91                   	xchg   ecx,eax
     6c1:	00 17                	add    BYTE PTR [edi],dl
     6c3:	44                   	inc    esp
     6c4:	02 00                	add    al,BYTE PTR [eax]
     6c6:	00 01                	add    BYTE PTR [ecx],al
     6c8:	e8 61 03 00 00       	call   a2e <cmdClearScreen-0x30ff5d2>
     6cd:	03 91 d8 75 17 9c    	add    edx,DWORD PTR [ecx-0x63e88a28]
     6d3:	01 00                	add    DWORD PTR [eax],eax
     6d5:	00 01                	add    BYTE PTR [ecx],al
     6d7:	e9 3a 00 00 00       	jmp    716 <cmdClearScreen-0x30ff8ea>
     6dc:	02 91 64 17 55 03    	add    dl,BYTE PTR [ecx+0x3551764]
     6e2:	00 00                	add    BYTE PTR [eax],al
     6e4:	01 ec                	add    esp,ebp
     6e6:	3a 00                	cmp    al,BYTE PTR [eax]
     6e8:	00 00                	add    BYTE PTR [eax],al
     6ea:	02 91 60 17 1e 03    	add    dl,BYTE PTR [ecx+0x31e1760]
     6f0:	00 00                	add    BYTE PTR [eax],al
     6f2:	01 ed                	add    ebp,ebp
     6f4:	31 07                	xor    DWORD PTR [edi],eax
     6f6:	00 00                	add    BYTE PTR [eax],al
     6f8:	03 91 58 06 1d 09    	add    edx,DWORD PTR [ecx+0x91d0658]
     6fe:	07                   	pop    es
     6ff:	10 03                	adc    BYTE PTR [ebx],al
     701:	21 00                	and    DWORD PTR [eax],eax
     703:	00 00                	add    BYTE PTR [eax],al
     705:	18 07                	sbb    BYTE PTR [edi],al
     707:	00 00                	add    BYTE PTR [eax],al
     709:	14 63                	adc    al,0x63
     70b:	6e                   	outs   dx,BYTE PTR ds:[esi]
     70c:	74 00                	je     70e <cmdClearScreen-0x30ff8f2>
     70e:	01 ef                	add    edi,ebp
     710:	3a 00                	cmp    al,BYTE PTR [eax]
     712:	00 00                	add    BYTE PTR [eax],al
     714:	02 91 6c 00 13 2a    	add    dl,BYTE PTR [ecx+0x2a13006c]
     71a:	07                   	pop    es
     71b:	10 03                	adc    BYTE PTR [ebx],al
     71d:	33 00                	xor    eax,DWORD PTR [eax]
     71f:	00 00                	add    BYTE PTR [eax],al
     721:	14 63                	adc    al,0x63
     723:	6e                   	outs   dx,BYTE PTR ds:[esi]
     724:	74 00                	je     726 <cmdClearScreen-0x30ff8da>
     726:	01 f2                	add    edx,esi
     728:	3a 00                	cmp    al,BYTE PTR [eax]
     72a:	00 00                	add    BYTE PTR [eax],al
     72c:	02 91 68 00 00 18    	add    dl,BYTE PTR [ecx+0x18000068]
     732:	3a 00                	cmp    al,BYTE PTR [eax]
     734:	00 00                	add    BYTE PTR [eax],al
     736:	44                   	inc    esp
     737:	07                   	pop    es
     738:	00 00                	add    BYTE PTR [eax],al
     73a:	1e                   	push   ds
     73b:	30 01                	xor    BYTE PTR [ecx],al
     73d:	00 00                	add    BYTE PTR [eax],al
     73f:	03 91 5c 06 00 18    	add    edx,DWORD PTR [ecx+0x1800065c]
     745:	94                   	xchg   esp,eax
     746:	02 00                	add    al,BYTE PTR [eax]
     748:	00 54 07 00          	add    BYTE PTR [edi+eax*1+0x0],dl
     74c:	00 19                	add    BYTE PTR [ecx],bl
     74e:	30 01                	xor    BYTE PTR [ecx],al
     750:	00 00                	add    BYTE PTR [eax],al
     752:	09 00                	or     DWORD PTR [eax],eax
     754:	17                   	pop    ss
     755:	3c 01                	cmp    al,0x1
     757:	00 00                	add    BYTE PTR [eax],al
     759:	05 36 44 07 00       	add    eax,0x74436
     75e:	00 05 03 a0 21 10    	add    BYTE PTR ds:0x1021a003,al
     764:	03 1f                	add    ebx,DWORD PTR [edi]
     766:	60                   	pusha  
     767:	03 00                	add    eax,DWORD PTR [eax]
     769:	00 06                	add    BYTE PTR [esi],al
     76b:	34 61                	xor    al,0x61
     76d:	00 00                	add    BYTE PTR [eax],al
     76f:	00 05 03 2c 27 10    	add    BYTE PTR ds:0x10272c03,al
     775:	03 1f                	add    ebx,DWORD PTR [edi]
     777:	0e                   	push   cs
     778:	02 00                	add    al,BYTE PTR [eax]
     77a:	00 06                	add    BYTE PTR [esi],al
     77c:	35 61 00 00 00       	xor    eax,0x61
     781:	05 03 30 27 10       	add    eax,0x10273003
     786:	03 1f                	add    ebx,DWORD PTR [edi]
     788:	6a 00                	push   0x0
     78a:	00 00                	add    BYTE PTR [eax],al
     78c:	06                   	push   es
     78d:	36                   	ss
     78e:	61                   	popa   
     78f:	00 00                	add    BYTE PTR [eax],al
     791:	00 05 03 28 27 10    	add    BYTE PTR ds:0x10272803,al
     797:	03 1f                	add    ebx,DWORD PTR [edi]
     799:	96                   	xchg   esi,eax
     79a:	03 00                	add    eax,DWORD PTR [eax]
     79c:	00 06                	add    BYTE PTR [esi],al
     79e:	37                   	aaa    
     79f:	85 00                	test   DWORD PTR [eax],eax
     7a1:	00 00                	add    BYTE PTR [eax],al
     7a3:	05 03 50 27 10       	add    eax,0x10275003
     7a8:	03 1f                	add    ebx,DWORD PTR [edi]
     7aa:	b7 02                	mov    bh,0x2
     7ac:	00 00                	add    BYTE PTR [eax],al
     7ae:	07                   	pop    es
     7af:	50                   	push   eax
     7b0:	ef                   	out    dx,eax
     7b1:	03 00                	add    eax,DWORD PTR [eax]
     7b3:	00 05 03 40 27 10    	add    BYTE PTR ds:0x10274003,al
     7b9:	03 1f                	add    ebx,DWORD PTR [edi]
     7bb:	b8 03 00 00 04       	mov    eax,0x4000003
     7c0:	63 b8 01 00 00 05    	arpl   WORD PTR [eax+0x5000001],di
     7c6:	03 38                	add    edi,DWORD PTR [eax]
     7c8:	27                   	daa    
     7c9:	10 03                	adc    BYTE PTR [ebx],al
     7cb:	1f                   	pop    ds
     7cc:	6e                   	outs   dx,BYTE PTR ds:[esi]
     7cd:	03 00                	add    eax,DWORD PTR [eax]
     7cf:	00 04 e1             	add    BYTE PTR [ecx+eiz*8],al
     7d2:	07                   	pop    es
     7d3:	02 00                	add    al,BYTE PTR [eax]
     7d5:	00 05 03 24 27 10    	add    BYTE PTR ds:0x10272403,al
     7db:	03 20                	add    esp,DWORD PTR [eax]
     7dd:	1f                   	pop    ds
     7de:	6d                   	ins    DWORD PTR es:[edi],dx
     7df:	01 00                	add    DWORD PTR [eax],eax
     7e1:	00 05 25 ee 07 00    	add    BYTE PTR ds:0x7ee25,al
     7e7:	00 05 03 34 27 10    	add    BYTE PTR ds:0x10273403,al
     7ed:	03 07                	add    eax,DWORD PTR [edi]
     7ef:	04 dc                	add    al,0xdc
     7f1:	07                   	pop    es
     7f2:	00 00                	add    BYTE PTR [eax],al
     7f4:	21 ff                	and    edi,edi
     7f6:	07                   	pop    es
     7f7:	00 00                	add    BYTE PTR [eax],al
     7f9:	22 8e 02 00 00 00    	and    cl,BYTE PTR [esi+0x2]
     7ff:	1f                   	pop    ds
     800:	d4 01                	aam    0x1
     802:	00 00                	add    BYTE PTR [eax],al
     804:	05 26 10 08 00       	add    eax,0x81026
     809:	00 05 03 20 27 10    	add    BYTE PTR ds:0x10272003,al
     80f:	03 07                	add    eax,DWORD PTR [edi]
     811:	04 f4                	add    al,0xf4
     813:	07                   	pop    es
     814:	00 00                	add    BYTE PTR [eax],al
     816:	18 25 00 00 00 27    	sbb    BYTE PTR ds:0x27000000,ah
     81c:	08 00                	or     BYTE PTR [eax],al
     81e:	00 23                	add    BYTE PTR [ebx],ah
     820:	30 01                	xor    BYTE PTR [ecx],al
     822:	00 00                	add    BYTE PTR [eax],al
     824:	ff 01                	inc    DWORD PTR [ecx]
     826:	00 1f                	add    BYTE PTR [edi],bl
     828:	17                   	pop    ss
     829:	02 00                	add    al,BYTE PTR [eax]
     82b:	00 05 2d 16 08 00    	add    BYTE PTR ds:0x8162d,al
     831:	00 05 03 20 25 10    	add    BYTE PTR ds:0x10252003,al
     837:	03 1f                	add    ebx,DWORD PTR [edi]
     839:	e0 03                	loopne 83e <cmdClearScreen-0x30ff7c2>
     83b:	00 00                	add    BYTE PTR [eax],al
     83d:	05 2e 8e 02 00       	add    eax,0x28e2e
     842:	00 05 03 4c 27 10    	add    BYTE PTR ds:0x10274c03,al
     848:	03 1f                	add    ebx,DWORD PTR [edi]
     84a:	00 00                	add    BYTE PTR [eax],al
     84c:	00 00                	add    BYTE PTR [eax],al
     84e:	05 2f ef 03 00       	add    eax,0x3ef2f
     853:	00 05 03 0c 24 10    	add    BYTE PTR ds:0x10240c03,al
     859:	03 18                	add    ebx,DWORD PTR [eax]
     85b:	25 00 00 00 6a       	and    eax,0x6a000000
     860:	08 00                	or     BYTE PTR [eax],al
     862:	00 19                	add    BYTE PTR [ecx],bl
     864:	30 01                	xor    BYTE PTR [ecx],al
     866:	00 00                	add    BYTE PTR [eax],al
     868:	05 00 1f 29 02       	add    eax,0x2291f00
     86d:	00 00                	add    BYTE PTR [eax],al
     86f:	05 30 5a 08 00       	add    eax,0x85a30
     874:	00 05 03 04 24 10    	add    BYTE PTR ds:0x10240403,al
     87a:	03 1f                	add    ebx,DWORD PTR [edi]
     87c:	c3                   	ret    
     87d:	02 00                	add    al,BYTE PTR [eax]
     87f:	00 05 31 61 00 00    	add    BYTE PTR ds:0x6131,al
     885:	00 05 03 48 27 10    	add    BYTE PTR ds:0x10274803,al
     88b:	03 1f                	add    ebx,DWORD PTR [edi]
     88d:	58                   	pop    eax
     88e:	02 00                	add    al,BYTE PTR [eax]
     890:	00 05 31 61 00 00    	add    BYTE PTR ds:0x6131,al
     896:	00 05 03 44 27 10    	add    BYTE PTR ds:0x10274403,al
     89c:	03 1f                	add    ebx,DWORD PTR [edi]
     89e:	31 01                	xor    DWORD PTR [ecx],eax
     8a0:	00 00                	add    BYTE PTR [eax],al
     8a2:	05 32 27 01 00       	add    eax,0x12732
     8a7:	00 05 03 54 27 10    	add    BYTE PTR ds:0x10275403,al
     8ad:	03 18                	add    ebx,DWORD PTR [eax]
     8af:	25 00 00 00 be       	and    eax,0xbe000000
     8b4:	08 00                	or     BYTE PTR [eax],al
     8b6:	00 19                	add    BYTE PTR [ecx],bl
     8b8:	30 01                	xor    BYTE PTR [ecx],al
     8ba:	00 00                	add    BYTE PTR [eax],al
     8bc:	ff 00                	inc    DWORD PTR [eax]
     8be:	24 63                	and    al,0x63
     8c0:	77 64                	ja     926 <cmdClearScreen-0x30ff6da>
     8c2:	00 05 33 ae 08 00    	add    BYTE PTR ds:0x8ae33,al
     8c8:	00 05 03 20 24 10    	add    BYTE PTR ds:0x10242003,al
     8ce:	03 1f                	add    ebx,DWORD PTR [edi]
     8d0:	ae                   	scas   al,BYTE PTR es:[edi]
     8d1:	01 00                	add    DWORD PTR [eax],eax
     8d3:	00 05 34 27 01 00    	add    BYTE PTR ds:0x12734,al
     8d9:	00 05 03 00 24 10    	add    BYTE PTR ds:0x10240003,al
     8df:	03 00                	add    eax,DWORD PTR [eax]
     8e1:	89 08                	mov    DWORD PTR [eax],ecx
     8e3:	00 00                	add    BYTE PTR [eax],al
     8e5:	04 00                	add    al,0x0
     8e7:	e5 01                	in     eax,0x1
     8e9:	00 00                	add    BYTE PTR [eax],al
     8eb:	04 01                	add    al,0x1
     8ed:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
     8ee:	00 00                	add    BYTE PTR [eax],al
     8f0:	00 0c 6c             	add    BYTE PTR [esp+ebp*2],cl
     8f3:	05 00 00 37 00       	add    eax,0x370000
     8f8:	00 00                	add    BYTE PTR [eax],al
     8fa:	b0 07                	mov    al,0x7
     8fc:	10 03                	adc    BYTE PTR [ebx],al
     8fe:	08 0b                	or     BYTE PTR [ebx],cl
     900:	00 00                	add    BYTE PTR [eax],al
     902:	46                   	inc    esi
     903:	02 00                	add    al,BYTE PTR [eax]
     905:	00 02                	add    BYTE PTR [edx],al
     907:	01 06                	add    DWORD PTR [esi],eax
     909:	72 02                	jb     90d <cmdClearScreen-0x30ff6f3>
     90b:	00 00                	add    BYTE PTR [eax],al
     90d:	02 01                	add    al,BYTE PTR [ecx]
     90f:	06                   	push   es
     910:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
     913:	00 02                	add    BYTE PTR [edx],al
     915:	02 05 27 01 00 00    	add    al,BYTE PTR ds:0x127
     91b:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     922:	02 08                	add    cl,BYTE PTR [eax]
     924:	05 be 01 00 00       	add    eax,0x1be
     929:	04 52                	add    al,0x52
     92b:	01 00                	add    DWORD PTR [eax],eax
     92d:	00 02                	add    BYTE PTR [edx],al
     92f:	2e                   	cs
     930:	53                   	push   ebx
     931:	00 00                	add    BYTE PTR [eax],al
     933:	00 02                	add    BYTE PTR [edx],al
     935:	01 08                	add    DWORD PTR [eax],ecx
     937:	69 02 00 00 02 02    	imul   eax,DWORD PTR [edx],0x2020000
     93d:	07                   	pop    es
     93e:	d3 02                	rol    DWORD PTR [edx],cl
     940:	00 00                	add    BYTE PTR [eax],al
     942:	04 a6                	add    al,0xa6
     944:	02 00                	add    al,BYTE PTR [eax]
     946:	00 02                	add    BYTE PTR [edx],al
     948:	34 6c                	xor    al,0x6c
     94a:	00 00                	add    BYTE PTR [eax],al
     94c:	00 02                	add    BYTE PTR [edx],al
     94e:	04 07                	add    al,0x7
     950:	91                   	xchg   ecx,eax
     951:	02 00                	add    al,BYTE PTR [eax]
     953:	00 02                	add    BYTE PTR [edx],al
     955:	08 07                	or     BYTE PTR [edi],al
     957:	87 02                	xchg   DWORD PTR [edx],eax
     959:	00 00                	add    BYTE PTR [eax],al
     95b:	02 04 05 c3 01 00 00 	add    al,BYTE PTR [eax*1+0x1c3]
     962:	05 04 87 00 00       	add    eax,0x8704
     967:	00 06                	add    BYTE PTR [esi],al
     969:	25 00 00 00 02       	and    eax,0x2000000
     96e:	01 02                	add    DWORD PTR [edx],eax
     970:	10 03                	adc    BYTE PTR [ebx],al
     972:	00 00                	add    BYTE PTR [eax],al
     974:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
     977:	85 00                	test   DWORD PTR [eax],eax
     979:	00 00                	add    BYTE PTR [eax],al
     97b:	07                   	pop    es
     97c:	04 02                	add    al,0x2
     97e:	04 07                	add    al,0x7
     980:	8c 02                	mov    WORD PTR [edx],es
     982:	00 00                	add    BYTE PTR [eax],al
     984:	08 05 03 58 24 01    	or     BYTE PTR ds:0x1245803,al
     98a:	00 00                	add    BYTE PTR [eax],al
     98c:	09 f3                	or     ebx,esi
     98e:	03 00                	add    eax,DWORD PTR [eax]
     990:	00 03                	add    BYTE PTR [ebx],al
     992:	59                   	pop    ecx
     993:	48                   	dec    eax
     994:	00 00                	add    BYTE PTR [eax],al
     996:	00 01                	add    BYTE PTR [ecx],al
     998:	04 04                	add    al,0x4
     99a:	00 09                	add    BYTE PTR [ecx],cl
     99c:	f0 02 00             	lock add al,BYTE PTR [eax]
     99f:	00 03                	add    BYTE PTR [ebx],al
     9a1:	5a                   	pop    edx
     9a2:	48                   	dec    eax
     9a3:	00 00                	add    BYTE PTR [eax],al
     9a5:	00 01                	add    BYTE PTR [ecx],al
     9a7:	04 00                	add    al,0x0
     9a9:	00 09                	add    BYTE PTR [ecx],cl
     9ab:	9f                   	lahf   
     9ac:	02 00                	add    al,BYTE PTR [eax]
     9ae:	00 03                	add    BYTE PTR [ebx],al
     9b0:	5b                   	pop    ebx
     9b1:	48                   	dec    eax
     9b2:	00 00                	add    BYTE PTR [eax],al
     9b4:	00 01                	add    BYTE PTR [ecx],al
     9b6:	04 04                	add    al,0x4
     9b8:	01 09                	add    DWORD PTR [ecx],ecx
     9ba:	89 00                	mov    DWORD PTR [eax],eax
     9bc:	00 00                	add    BYTE PTR [eax],al
     9be:	03 5c 48 00          	add    ebx,DWORD PTR [eax+ecx*2+0x0]
     9c2:	00 00                	add    BYTE PTR [eax],al
     9c4:	01 02                	add    DWORD PTR [edx],eax
     9c6:	02 01                	add    al,BYTE PTR [ecx]
     9c8:	09 e7                	or     edi,esp
     9ca:	01 00                	add    DWORD PTR [eax],eax
     9cc:	00 03                	add    BYTE PTR [ebx],al
     9ce:	5d                   	pop    ebp
     9cf:	48                   	dec    eax
     9d0:	00 00                	add    BYTE PTR [eax],al
     9d2:	00 01                	add    BYTE PTR [ecx],al
     9d4:	02 00                	add    al,BYTE PTR [eax]
     9d6:	01 09                	add    DWORD PTR [ecx],ecx
     9d8:	ef                   	out    dx,eax
     9d9:	02 00                	add    al,BYTE PTR [eax]
     9db:	00 03                	add    BYTE PTR [ebx],al
     9dd:	5e                   	pop    esi
     9de:	48                   	dec    eax
     9df:	00 00                	add    BYTE PTR [eax],al
     9e1:	00 01                	add    BYTE PTR [ecx],al
     9e3:	04 04                	add    al,0x4
     9e5:	02 09                	add    cl,BYTE PTR [ecx]
     9e7:	9e                   	sahf   
     9e8:	02 00                	add    al,BYTE PTR [eax]
     9ea:	00 03                	add    BYTE PTR [ebx],al
     9ec:	5f                   	pop    edi
     9ed:	48                   	dec    eax
     9ee:	00 00                	add    BYTE PTR [eax],al
     9f0:	00 01                	add    BYTE PTR [ecx],al
     9f2:	08 00                	or     BYTE PTR [eax],al
     9f4:	03 09                	add    ecx,DWORD PTR [ecx]
     9f6:	ec                   	in     al,dx
     9f7:	01 00                	add    DWORD PTR [eax],eax
     9f9:	00 03                	add    BYTE PTR [ebx],al
     9fb:	60                   	pusha  
     9fc:	48                   	dec    eax
     9fd:	00 00                	add    BYTE PTR [eax],al
     9ff:	00 01                	add    BYTE PTR [ecx],al
     a01:	04 04                	add    al,0x4
     a03:	04 00                	add    al,0x0
     a05:	0a 08                	or     cl,BYTE PTR [eax]
     a07:	03 56 3d             	add    edx,DWORD PTR [esi+0x3d]
     a0a:	01 00                	add    DWORD PTR [eax],eax
     a0c:	00 0b                	add    BYTE PTR [ebx],cl
     a0e:	a3 00 00 00 0c       	mov    ds:0xc000000,eax
     a13:	72 65                	jb     a7a <cmdClearScreen-0x30ff586>
     a15:	67 00 03             	add    BYTE PTR [bp+di],al
     a18:	62 61 00             	bound  esp,QWORD PTR [ecx+0x0]
     a1b:	00 00                	add    BYTE PTR [eax],al
     a1d:	00 08                	add    BYTE PTR [eax],cl
     a1f:	04 03                	add    al,0x3
     a21:	db 73 01             	(bad)  [ebx+0x1]
     a24:	00 00                	add    BYTE PTR [eax],al
     a26:	09 8a 03 00 00 03    	or     DWORD PTR [edx+0x3000003],ecx
     a2c:	dc 48 00             	fmul   QWORD PTR [eax+0x0]
     a2f:	00 00                	add    BYTE PTR [eax],al
     a31:	01 01                	add    DWORD PTR [ecx],eax
     a33:	07                   	pop    es
     a34:	00 09                	add    BYTE PTR [ecx],cl
     a36:	9d                   	popf   
     a37:	03 00                	add    eax,DWORD PTR [eax]
     a39:	00 03                	add    BYTE PTR [ebx],al
     a3b:	dd 48 00             	fisttp QWORD PTR [eax+0x0]
     a3e:	00 00                	add    BYTE PTR [eax],al
     a40:	01 01                	add    DWORD PTR [ecx],eax
     a42:	06                   	push   es
     a43:	00 09                	add    BYTE PTR [ecx],cl
     a45:	d0 03                	rol    BYTE PTR [ebx],1
     a47:	00 00                	add    BYTE PTR [eax],al
     a49:	03 de                	add    ebx,esi
     a4b:	61                   	popa   
     a4c:	00 00                	add    BYTE PTR [eax],al
     a4e:	00 04 1e             	add    BYTE PTR [esi+ebx*1],al
     a51:	00 00                	add    BYTE PTR [eax],al
     a53:	00 0a                	add    BYTE PTR [edx],cl
     a55:	04 03                	add    al,0x3
     a57:	da 8c 01 00 00 0b 3d 	fimul  DWORD PTR [ecx+eax*1+0x3d0b0000]
     a5e:	01 00                	add    DWORD PTR [eax],eax
     a60:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     a63:	65 67 00 03          	add    BYTE PTR gs:[bp+di],al
     a67:	e0 61                	loopne aca <cmdClearScreen-0x30ff536>
     a69:	00 00                	add    BYTE PTR [eax],al
     a6b:	00 00                	add    BYTE PTR [eax],al
     a6d:	0d 5a 01 00 00       	or     eax,0x15a
     a72:	04 6c                	add    al,0x6c
     a74:	00 00                	add    BYTE PTR [eax],al
     a76:	00 07                	add    BYTE PTR [edi],al
     a78:	15 c1 01 00 00       	adc    eax,0x1c1
     a7d:	0e                   	push   cs
     a7e:	16                   	push   ss
     a7f:	03 00                	add    eax,DWORD PTR [eax]
     a81:	00 01                	add    BYTE PTR [ecx],al
     a83:	0e                   	push   cs
     a84:	05 02 00 00 02       	add    eax,0x2000002
     a89:	0e                   	push   cs
     a8a:	16                   	push   ss
     a8b:	01 00                	add    DWORD PTR [eax],eax
     a8d:	00 04 0e             	add    BYTE PTR [esi+ecx*1],al
     a90:	d9 03                	fld    DWORD PTR [ebx]
     a92:	00 00                	add    BYTE PTR [eax],al
     a94:	08 0e                	or     BYTE PTR [esi],cl
     a96:	45                   	inc    ebp
     a97:	03 00                	add    eax,DWORD PTR [eax]
     a99:	00 10                	add    BYTE PTR [eax],dl
     a9b:	0e                   	push   cs
     a9c:	97                   	xchg   edi,eax
     a9d:	00 00                	add    BYTE PTR [eax],al
     a9f:	00 20                	add    BYTE PTR [eax],ah
     aa1:	00 08                	add    BYTE PTR [eax],cl
     aa3:	10 04 13             	adc    BYTE PTR [ebx+edx*1],al
     aa6:	fa                   	cli    
     aa7:	01 00                	add    DWORD PTR [eax],eax
     aa9:	00 0f                	add    BYTE PTR [edi],cl
     aab:	4b                   	dec    ebx
     aac:	02 00                	add    al,BYTE PTR [eax]
     aae:	00 04 15 fa 01 00 00 	add    BYTE PTR [edx*1+0x1fa],al
     ab5:	00 0f                	add    BYTE PTR [edi],cl
     ab7:	79 00                	jns    ab9 <cmdClearScreen-0x30ff547>
     ab9:	00 00                	add    BYTE PTR [eax],al
     abb:	04 16                	add    al,0x16
     abd:	fa                   	cli    
     abe:	01 00                	add    DWORD PTR [eax],eax
     ac0:	00 04 0f             	add    BYTE PTR [edi+ecx*1],al
     ac3:	75 01                	jne    ac6 <cmdClearScreen-0x30ff53a>
     ac5:	00 00                	add    BYTE PTR [eax],al
     ac7:	04 17                	add    al,0x17
     ac9:	9a 00 00 00 08 0f 9c 	call   0x9c0f:0x8000000
     ad0:	01 00                	add    DWORD PTR [eax],eax
     ad2:	00 04 18             	add    BYTE PTR [eax+ebx*1],al
     ad5:	3a 00                	cmp    al,BYTE PTR [eax]
     ad7:	00 00                	add    BYTE PTR [eax],al
     ad9:	0c 00                	or     al,0x0
     adb:	05 04 25 00 00       	add    eax,0x2504
     ae0:	00 04 ff             	add    BYTE PTR [edi+edi*8],al
     ae3:	03 00                	add    eax,DWORD PTR [eax]
     ae5:	00 04 19             	add    BYTE PTR [ecx+ebx*1],al
     ae8:	c1 01 00             	rol    DWORD PTR [ecx],0x0
     aeb:	00 10                	add    BYTE PTR [eax],dl
     aed:	80 04 00 00          	add    BYTE PTR [eax+eax*1],0x0
     af1:	01 19                	add    DWORD PTR [ecx],ebx
     af3:	b0 07                	mov    al,0x7
     af5:	10 03                	adc    BYTE PTR [ebx],al
     af7:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     af8:	00 00                	add    BYTE PTR [eax],al
     afa:	00 01                	add    BYTE PTR [ecx],al
     afc:	9c                   	pushf  
     afd:	3b 02                	cmp    eax,DWORD PTR [edx]
     aff:	00 00                	add    BYTE PTR [eax],al
     b01:	11 8b 04 00 00 01    	adc    DWORD PTR [ebx+0x1000004],ecx
     b07:	19 fa                	sbb    edx,edi
     b09:	01 00                	add    DWORD PTR [eax],eax
     b0b:	00 02                	add    BYTE PTR [edx],al
     b0d:	91                   	xchg   ecx,eax
     b0e:	00 12                	add    BYTE PTR [edx],dl
     b10:	69 00 01 1b 3a 00    	imul   eax,DWORD PTR [eax],0x3a1b01
     b16:	00 00                	add    BYTE PTR [eax],al
     b18:	02 91 6c 00 13 4a    	add    dl,BYTE PTR [ecx+0x4a13006c]
     b1e:	04 00                	add    al,0x0
     b20:	00 01                	add    BYTE PTR [ecx],al
     b22:	31 3a                	xor    DWORD PTR [edx],edi
     b24:	00 00                	add    BYTE PTR [eax],al
     b26:	00 56 08             	add    BYTE PTR [esi+0x8],dl
     b29:	10 03                	adc    BYTE PTR [ebx],al
     b2b:	a9 01 00 00 01       	test   eax,0x1000001
     b30:	9c                   	pushf  
     b31:	d9 02                	fld    DWORD PTR [edx]
     b33:	00 00                	add    BYTE PTR [eax],al
     b35:	11 9c 05 00 00 01 31 	adc    DWORD PTR [ebp+eax*1+0x31010000],ebx
     b3c:	fa                   	cli    
     b3d:	01 00                	add    DWORD PTR [eax],eax
     b3f:	00 02                	add    BYTE PTR [edx],al
     b41:	91                   	xchg   ecx,eax
     b42:	00 11                	add    BYTE PTR [ecx],dl
     b44:	44                   	inc    esp
     b45:	02 00                	add    al,BYTE PTR [eax]
     b47:	00 01                	add    BYTE PTR [ecx],al
     b49:	31 e9                	xor    ecx,ebp
     b4b:	02 00                	add    al,BYTE PTR [eax]
     b4d:	00 02                	add    BYTE PTR [edx],al
     b4f:	91                   	xchg   ecx,eax
     b50:	04 11                	add    al,0x11
     b52:	55                   	push   ebp
     b53:	03 00                	add    eax,DWORD PTR [eax]
     b55:	00 01                	add    BYTE PTR [ecx],al
     b57:	31 3a                	xor    DWORD PTR [edx],edi
     b59:	00 00                	add    BYTE PTR [eax],al
     b5b:	00 02                	add    BYTE PTR [edx],al
     b5d:	91                   	xchg   ecx,eax
     b5e:	08 12                	or     BYTE PTR [edx],dl
     b60:	78 00                	js     b62 <cmdClearScreen-0x30ff49e>
     b62:	01 33                	add    DWORD PTR [ebx],esi
     b64:	3a 00                	cmp    al,BYTE PTR [eax]
     b66:	00 00                	add    BYTE PTR [eax],al
     b68:	02 91 6c 12 79 00    	add    dl,BYTE PTR [ecx+0x79126c]
     b6e:	01 33                	add    DWORD PTR [ebx],esi
     b70:	3a 00                	cmp    al,BYTE PTR [eax]
     b72:	00 00                	add    BYTE PTR [eax],al
     b74:	02 91 68 14 1f 04    	add    dl,BYTE PTR [ecx+0x41f1468]
     b7a:	00 00                	add    BYTE PTR [eax],al
     b7c:	01 34 3a             	add    DWORD PTR [edx+edi*1],esi
     b7f:	00 00                	add    BYTE PTR [eax],al
     b81:	00 02                	add    BYTE PTR [edx],al
     b83:	91                   	xchg   ecx,eax
     b84:	64                   	fs
     b85:	14 6f                	adc    al,0x6f
     b87:	04 00                	add    al,0x0
     b89:	00 01                	add    BYTE PTR [ecx],al
     b8b:	34 3a                	xor    al,0x3a
     b8d:	00 00                	add    BYTE PTR [eax],al
     b8f:	00 02                	add    BYTE PTR [edx],al
     b91:	91                   	xchg   ecx,eax
     b92:	60                   	pusha  
     b93:	14 1c                	adc    al,0x1c
     b95:	05 00 00 01 35       	add    eax,0x35010000
     b9a:	8c 00                	mov    WORD PTR [eax],es
     b9c:	00 00                	add    BYTE PTR [eax],al
     b9e:	02 91 5f 15 91 08    	add    dl,BYTE PTR [ecx+0x891155f]
     ba4:	10 03                	adc    BYTE PTR [ebx],al
     ba6:	47                   	inc    edi
     ba7:	01 00                	add    DWORD PTR [eax],eax
     ba9:	00 12                	add    BYTE PTR [edx],dl
     bab:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     bae:	00 01                	add    BYTE PTR [ecx],al
     bb0:	39 6c 00 00          	cmp    DWORD PTR [eax+eax*1+0x0],ebp
     bb4:	00 02                	add    BYTE PTR [edx],al
     bb6:	91                   	xchg   ecx,eax
     bb7:	58                   	pop    eax
     bb8:	00 00                	add    BYTE PTR [eax],al
     bba:	16                   	push   ss
     bbb:	25 00 00 00 e9       	and    eax,0xe9000000
     bc0:	02 00                	add    al,BYTE PTR [eax]
     bc2:	00 17                	add    BYTE PTR [edi],dl
     bc4:	93                   	xchg   ebx,eax
     bc5:	00 00                	add    BYTE PTR [eax],al
     bc7:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
     bca:	05 04 d9 02 00       	add    eax,0x2d904
     bcf:	00 13                	add    BYTE PTR [ebx],dl
     bd1:	ac                   	lods   al,BYTE PTR ds:[esi]
     bd2:	05 00 00 01 63       	add    eax,0x63010000
     bd7:	3a 00                	cmp    al,BYTE PTR [eax]
     bd9:	00 00                	add    BYTE PTR [eax],al
     bdb:	ff 09                	dec    DWORD PTR [ecx]
     bdd:	10 03                	adc    BYTE PTR [ebx],al
     bdf:	69 00 00 00 01 9c    	imul   eax,DWORD PTR [eax],0x9c010000
     be5:	31 03                	xor    DWORD PTR [ebx],eax
     be7:	00 00                	add    BYTE PTR [eax],al
     be9:	11 a4 05 00 00 01 63 	adc    DWORD PTR [ebp+eax*1+0x63010000],esp
     bf0:	fa                   	cli    
     bf1:	01 00                	add    DWORD PTR [eax],eax
     bf3:	00 02                	add    BYTE PTR [edx],al
     bf5:	91                   	xchg   ecx,eax
     bf6:	00 12                	add    BYTE PTR [edx],dl
     bf8:	69 00 01 65 6c 00    	imul   eax,DWORD PTR [eax],0x6c6501
     bfe:	00 00                	add    BYTE PTR [eax],al
     c00:	02 91 6c 12 72 65    	add    dl,BYTE PTR [ecx+0x6572126c]
     c06:	74 00                	je     c08 <cmdClearScreen-0x30ff3f8>
     c08:	01 66 3a             	add    DWORD PTR [esi+0x3a],esp
     c0b:	00 00                	add    BYTE PTR [eax],al
     c0d:	00 02                	add    BYTE PTR [edx],al
     c0f:	91                   	xchg   ecx,eax
     c10:	68 00 13 49 05       	push   0x5491300
     c15:	00 00                	add    BYTE PTR [eax],al
     c17:	01 77 ef             	add    DWORD PTR [edi-0x11],esi
     c1a:	03 00                	add    eax,DWORD PTR [eax]
     c1c:	00 68 0a             	add    BYTE PTR [eax+0xa],ch
     c1f:	10 03                	adc    BYTE PTR [ebx],al
     c21:	8e 02                	mov    es,WORD PTR [edx]
     c23:	00 00                	add    BYTE PTR [eax],al
     c25:	01 9c ef 03 00 00 11 	add    DWORD PTR [edi+ebp*8+0x11000003],ebx
     c2c:	5b                   	pop    ebx
     c2d:	04 00                	add    al,0x0
     c2f:	00 01                	add    BYTE PTR [ecx],al
     c31:	77 81                	ja     bb4 <cmdClearScreen-0x30ff44c>
     c33:	00 00                	add    BYTE PTR [eax],al
     c35:	00 02                	add    BYTE PTR [edx],al
     c37:	91                   	xchg   ecx,eax
     c38:	00 12                	add    BYTE PTR [edx],dl
     c3a:	61                   	popa   
     c3b:	72 67                	jb     ca4 <cmdClearScreen-0x30ff35c>
     c3d:	00 01                	add    BYTE PTR [ecx],al
     c3f:	79 fa                	jns    c3b <cmdClearScreen-0x30ff3c5>
     c41:	01 00                	add    DWORD PTR [eax],eax
     c43:	00 02                	add    BYTE PTR [edx],al
     c45:	91                   	xchg   ecx,eax
     c46:	6c                   	ins    BYTE PTR es:[edi],dx
     c47:	14 b8                	adc    al,0xb8
     c49:	05 00 00 01 7a       	add    eax,0x7a010000
     c4e:	fa                   	cli    
     c4f:	01 00                	add    DWORD PTR [eax],eax
     c51:	00 02                	add    BYTE PTR [edx],al
     c53:	91                   	xchg   ecx,eax
     c54:	68 14 e4 04 00       	push   0x4e414
     c59:	00 01                	add    BYTE PTR [ecx],al
     c5b:	7b 3a                	jnp    c97 <cmdClearScreen-0x30ff369>
     c5d:	00 00                	add    BYTE PTR [eax],al
     c5f:	00 02                	add    BYTE PTR [edx],al
     c61:	91                   	xchg   ecx,eax
     c62:	64                   	fs
     c63:	14 bd                	adc    al,0xbd
     c65:	04 00                	add    al,0x0
     c67:	00 01                	add    BYTE PTR [ecx],al
     c69:	7c 3a                	jl     ca5 <cmdClearScreen-0x30ff35b>
     c6b:	00 00                	add    BYTE PTR [eax],al
     c6d:	00 02                	add    BYTE PTR [edx],al
     c6f:	91                   	xchg   ecx,eax
     c70:	60                   	pusha  
     c71:	14 e3                	adc    al,0xe3
     c73:	04 00                	add    al,0x0
     c75:	00 01                	add    BYTE PTR [ecx],al
     c77:	7d 3a                	jge    cb3 <cmdClearScreen-0x30ff34d>
     c79:	00 00                	add    BYTE PTR [eax],al
     c7b:	00 02                	add    BYTE PTR [edx],al
     c7d:	91                   	xchg   ecx,eax
     c7e:	5c                   	pop    esp
     c7f:	14 09                	adc    al,0x9
     c81:	05 00 00 01 7e       	add    eax,0x7e010000
     c86:	3a 00                	cmp    al,BYTE PTR [eax]
     c88:	00 00                	add    BYTE PTR [eax],al
     c8a:	02 91 58 14 06 05    	add    dl,BYTE PTR [ecx+0x5061458]
     c90:	00 00                	add    BYTE PTR [eax],al
     c92:	01 7f 3a             	add    DWORD PTR [edi+0x3a],edi
     c95:	00 00                	add    BYTE PTR [eax],al
     c97:	00 02                	add    BYTE PTR [edx],al
     c99:	91                   	xchg   ecx,eax
     c9a:	54                   	push   esp
     c9b:	14 4e                	adc    al,0x4e
     c9d:	05 00 00 01 80       	add    eax,0x80010000
     ca2:	ef                   	out    dx,eax
     ca3:	03 00                	add    eax,DWORD PTR [eax]
     ca5:	00 02                	add    BYTE PTR [edx],al
     ca7:	91                   	xchg   ecx,eax
     ca8:	50                   	push   eax
     ca9:	14 88                	adc    al,0x88
     cab:	05 00 00 01 81       	add    eax,0x81010000
     cb0:	ef                   	out    dx,eax
     cb1:	03 00                	add    eax,DWORD PTR [eax]
     cb3:	00 02                	add    BYTE PTR [edx],al
     cb5:	91                   	xchg   ecx,eax
     cb6:	4c                   	dec    esp
     cb7:	15 29 0c 10 03       	adc    eax,0x3100c29
     cbc:	9e                   	sahf   
     cbd:	00 00                	add    BYTE PTR [eax],al
     cbf:	00 14 45 04 00 00 01 	add    BYTE PTR [eax*2+0x1000004],dl
     cc6:	da fa                	(bad)  
     cc8:	01 00                	add    DWORD PTR [eax],eax
     cca:	00 02                	add    BYTE PTR [edx],al
     ccc:	91                   	xchg   ecx,eax
     ccd:	48                   	dec    eax
     cce:	00 00                	add    BYTE PTR [eax],al
     cd0:	05 04 fa 01 00       	add    eax,0x1fa04
     cd5:	00 13                	add    BYTE PTR [ebx],dl
     cd7:	d6                   	(bad)  
     cd8:	04 00                	add    al,0x0
     cda:	00 01                	add    BYTE PTR [ecx],al
     cdc:	f0 ef                	lock out dx,eax
     cde:	03 00                	add    eax,DWORD PTR [eax]
     ce0:	00 f6                	add    dh,dh
     ce2:	0c 10                	or     al,0x10
     ce4:	03 76 00             	add    esi,DWORD PTR [esi+0x0]
     ce7:	00 00                	add    BYTE PTR [eax],al
     ce9:	01 9c 51 04 00 00 11 	add    DWORD PTR [ecx+edx*2+0x11000004],ebx
     cf0:	cc                   	int3   
     cf1:	02 00                	add    al,BYTE PTR [eax]
     cf3:	00 01                	add    BYTE PTR [ecx],al
     cf5:	f0 3a 00             	lock cmp al,BYTE PTR [eax]
     cf8:	00 00                	add    BYTE PTR [eax],al
     cfa:	02 91 00 11 44 02    	add    dl,BYTE PTR [ecx+0x2441100]
     d00:	00 00                	add    BYTE PTR [eax],al
     d02:	01 f0                	add    eax,esi
     d04:	e9 02 00 00 02       	jmp    2000d0b <cmdClearScreen-0x10ff2f5>
     d09:	91                   	xchg   ecx,eax
     d0a:	04 11                	add    al,0x11
     d0c:	7b 04                	jnp    d12 <cmdClearScreen-0x30ff2ee>
     d0e:	00 00                	add    BYTE PTR [eax],al
     d10:	01 f0                	add    eax,esi
     d12:	ef                   	out    dx,eax
     d13:	03 00                	add    eax,DWORD PTR [eax]
     d15:	00 02                	add    BYTE PTR [edx],al
     d17:	91                   	xchg   ecx,eax
     d18:	08 15 fd 0c 10 03    	or     BYTE PTR ds:0x3100cfd,dl
     d1e:	67 00 00             	add    BYTE PTR [bx+si],al
     d21:	00 12                	add    BYTE PTR [edx],dl
     d23:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     d26:	00 01                	add    BYTE PTR [ecx],al
     d28:	f2 3a 00             	repnz cmp al,BYTE PTR [eax]
     d2b:	00 00                	add    BYTE PTR [eax],al
     d2d:	02 91 6c 00 00 10    	add    dl,BYTE PTR [ecx+0x1000006c]
     d33:	c4 04 00             	les    eax,FWORD PTR [eax+eax*1]
     d36:	00 01                	add    BYTE PTR [ecx],al
     d38:	fa                   	cli    
     d39:	6c                   	ins    BYTE PTR es:[edi],dx
     d3a:	0d 10 03 3d 00       	or     eax,0x3d0310
     d3f:	00 00                	add    BYTE PTR [eax],al
     d41:	01 9c 9b 04 00 00 11 	add    DWORD PTR [ebx+ebx*4+0x11000004],ebx
     d48:	cc                   	int3   
     d49:	02 00                	add    al,BYTE PTR [eax]
     d4b:	00 01                	add    BYTE PTR [ecx],al
     d4d:	fa                   	cli    
     d4e:	3a 00                	cmp    al,BYTE PTR [eax]
     d50:	00 00                	add    BYTE PTR [eax],al
     d52:	02 91 00 11 44 02    	add    dl,BYTE PTR [ecx+0x2441100]
     d58:	00 00                	add    BYTE PTR [eax],al
     d5a:	01 fa                	add    edx,edi
     d5c:	ef                   	out    dx,eax
     d5d:	03 00                	add    eax,DWORD PTR [eax]
     d5f:	00 02                	add    BYTE PTR [edx],al
     d61:	91                   	xchg   ecx,eax
     d62:	04 15                	add    al,0x15
     d64:	72 0d                	jb     d73 <cmdClearScreen-0x30ff28d>
     d66:	10 03                	adc    BYTE PTR [ebx],al
     d68:	26 00 00             	add    BYTE PTR es:[eax],al
     d6b:	00 12                	add    BYTE PTR [edx],dl
     d6d:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     d70:	00 01                	add    BYTE PTR [ecx],al
     d72:	fc                   	cld    
     d73:	3a 00                	cmp    al,BYTE PTR [eax]
     d75:	00 00                	add    BYTE PTR [eax],al
     d77:	02 91 6c 00 00 18    	add    dl,BYTE PTR [ecx+0x1800006c]
     d7d:	a9 04 00 00 01       	test   eax,0x1000004
     d82:	01 01                	add    DWORD PTR [ecx],eax
     d84:	8c 00                	mov    WORD PTR [eax],es
     d86:	00 00                	add    BYTE PTR [eax],al
     d88:	a9 0d 10 03 8c       	test   eax,0x8c03100d
     d8d:	00 00                	add    BYTE PTR [eax],al
     d8f:	00 01                	add    BYTE PTR [ecx],al
     d91:	9c                   	pushf  
     d92:	06                   	push   es
     d93:	05 00 00 19 36       	add    eax,0x36190000
     d98:	05 00 00 01 01       	add    eax,0x1010000
     d9d:	01 fa                	add    edx,edi
     d9f:	01 00                	add    DWORD PTR [eax],eax
     da1:	00 02                	add    BYTE PTR [edx],al
     da3:	91                   	xchg   ecx,eax
     da4:	00 19                	add    BYTE PTR [ecx],bl
     da6:	a3 04 00 00 01       	mov    ds:0x1000004,eax
     dab:	01 01                	add    DWORD PTR [ecx],eax
     dad:	fa                   	cli    
     dae:	01 00                	add    DWORD PTR [eax],eax
     db0:	00 02                	add    BYTE PTR [edx],al
     db2:	91                   	xchg   ecx,eax
     db3:	04 15                	add    al,0x15
     db5:	af                   	scas   eax,DWORD PTR es:[edi]
     db6:	0d 10 03 7f 00       	or     eax,0x7f0310
     dbb:	00 00                	add    BYTE PTR [eax],al
     dbd:	1a 63 6e             	sbb    ah,BYTE PTR [ebx+0x6e]
     dc0:	74 00                	je     dc2 <cmdClearScreen-0x30ff23e>
     dc2:	01 04 01             	add    DWORD PTR [ecx+eax*1],eax
     dc5:	3a 00                	cmp    al,BYTE PTR [eax]
     dc7:	00 00                	add    BYTE PTR [eax],al
     dc9:	02 91 6c 15 cb 0d    	add    dl,BYTE PTR [ecx+0xdcb156c]
     dcf:	10 03                	adc    BYTE PTR [ebx],al
     dd1:	59                   	pop    ecx
     dd2:	00 00                	add    BYTE PTR [eax],al
     dd4:	00 1a                	add    BYTE PTR [edx],bl
     dd6:	69 64 78 00 01 08 01 	imul   esp,DWORD PTR [eax+edi*2+0x0],0xfa010801
     ddd:	fa 
     dde:	01 00                	add    DWORD PTR [eax],eax
     de0:	00 02                	add    BYTE PTR [edx],al
     de2:	91                   	xchg   ecx,eax
     de3:	68 00 00 00 1b       	push   0x1b000000
     de8:	3d 05 00 00 01       	cmp    eax,0x1000005
     ded:	20 01                	and    BYTE PTR [ecx],al
     def:	35 0e 10 03 2e       	xor    eax,0x2e03100e
     df4:	00 00                	add    BYTE PTR [eax],al
     df6:	00 01                	add    BYTE PTR [ecx],al
     df8:	9c                   	pushf  
     df9:	2c 05                	sub    al,0x5
     dfb:	00 00                	add    BYTE PTR [eax],al
     dfd:	19 a4 05 00 00 01 20 	sbb    DWORD PTR [ebp+eax*1+0x20010000],esp
     e04:	01 fa                	add    edx,edi
     e06:	01 00                	add    DWORD PTR [eax],eax
     e08:	00 02                	add    BYTE PTR [edx],al
     e0a:	91                   	xchg   ecx,eax
     e0b:	00 00                	add    BYTE PTR [eax],al
     e0d:	1c 27                	sbb    al,0x27
     e0f:	04 00                	add    al,0x0
     e11:	00 01                	add    BYTE PTR [ecx],al
     e13:	25 01 63 0e 10       	and    eax,0x100e6301
     e18:	03 23                	add    esp,DWORD PTR [ebx]
     e1a:	00 00                	add    BYTE PTR [eax],al
     e1c:	00 01                	add    BYTE PTR [ecx],al
     e1e:	9c                   	pushf  
     e1f:	18 eb                	sbb    bl,ch
     e21:	04 00                	add    al,0x0
     e23:	00 01                	add    BYTE PTR [ecx],al
     e25:	2a 01                	sub    al,BYTE PTR [ecx]
     e27:	3a 00                	cmp    al,BYTE PTR [eax]
     e29:	00 00                	add    BYTE PTR [eax],al
     e2b:	86 0e                	xchg   BYTE PTR [esi],cl
     e2d:	10 03                	adc    BYTE PTR [ebx],al
     e2f:	26 00 00             	add    BYTE PTR es:[eax],al
     e32:	00 01                	add    BYTE PTR [ecx],al
     e34:	9c                   	pushf  
     e35:	76 05                	jbe    e3c <cmdClearScreen-0x30ff1c4>
     e37:	00 00                	add    BYTE PTR [eax],al
     e39:	19 a4 05 00 00 01 2a 	sbb    DWORD PTR [ebp+eax*1+0x2a010000],esp
     e40:	01 fa                	add    edx,edi
     e42:	01 00                	add    DWORD PTR [eax],eax
     e44:	00 02                	add    BYTE PTR [edx],al
     e46:	91                   	xchg   ecx,eax
     e47:	00 1d c0 05 00 00    	add    BYTE PTR ds:0x5c0,bl
     e4d:	01 2c 01             	add    DWORD PTR [ecx+eax*1],ebp
     e50:	3a 00                	cmp    al,BYTE PTR [eax]
     e52:	00 00                	add    BYTE PTR [eax],al
     e54:	1e                   	push   ds
     e55:	00 00                	add    BYTE PTR [eax],al
     e57:	1f                   	pop    ds
     e58:	8e 05 00 00 01 32    	mov    es,WORD PTR ds:0x32010000
     e5e:	01 3a                	add    DWORD PTR [edx],edi
     e60:	00 00                	add    BYTE PTR [eax],al
     e62:	00 ac 0e 10 03 16 00 	add    BYTE PTR [esi+ecx*1+0x160310],ch
     e69:	00 00                	add    BYTE PTR [eax],al
     e6b:	01 9c a0 05 00 00 19 	add    DWORD PTR [eax+eiz*4+0x19000005],ebx
     e72:	65                   	gs
     e73:	05 00 00 01 32       	add    eax,0x32010000
     e78:	01 3a                	add    DWORD PTR [edx],edi
     e7a:	00 00                	add    BYTE PTR [eax],al
     e7c:	00 02                	add    BYTE PTR [edx],al
     e7e:	91                   	xchg   ecx,eax
     e7f:	00 00                	add    BYTE PTR [eax],al
     e81:	1b 0e                	sbb    ecx,DWORD PTR [esi]
     e83:	05 00 00 01 3c       	add    eax,0x3c010000
     e88:	01 c2                	add    edx,eax
     e8a:	0e                   	push   cs
     e8b:	10 03                	adc    BYTE PTR [ebx],al
     e8d:	2b 00                	sub    eax,DWORD PTR [eax]
     e8f:	00 00                	add    BYTE PTR [eax],al
     e91:	01 9c c6 05 00 00 19 	add    DWORD PTR [esi+eax*8+0x19000005],ebx
     e98:	65                   	gs
     e99:	05 00 00 01 3c       	add    eax,0x3c010000
     e9e:	01 3a                	add    DWORD PTR [edx],edi
     ea0:	00 00                	add    BYTE PTR [eax],al
     ea2:	00 02                	add    BYTE PTR [edx],al
     ea4:	91                   	xchg   ecx,eax
     ea5:	00 00                	add    BYTE PTR [eax],al
     ea7:	18 79 05             	sbb    BYTE PTR [ecx+0x5],bh
     eaa:	00 00                	add    BYTE PTR [eax],al
     eac:	01 47 01             	add    DWORD PTR [edi+0x1],eax
     eaf:	3a 00                	cmp    al,BYTE PTR [eax]
     eb1:	00 00                	add    BYTE PTR [eax],al
     eb3:	ed                   	in     eax,dx
     eb4:	0e                   	push   cs
     eb5:	10 03                	adc    BYTE PTR [ebx],al
     eb7:	cb                   	retf   
     eb8:	03 00                	add    eax,DWORD PTR [eax]
     eba:	00 01                	add    BYTE PTR [ecx],al
     ebc:	9c                   	pushf  
     ebd:	85 06                	test   DWORD PTR [esi],eax
     ebf:	00 00                	add    BYTE PTR [eax],al
     ec1:	19 09                	sbb    DWORD PTR [ecx],ecx
     ec3:	05 00 00 01 47       	add    eax,0x47010000
     ec8:	01 3a                	add    DWORD PTR [edx],edi
     eca:	00 00                	add    BYTE PTR [eax],al
     ecc:	00 02                	add    BYTE PTR [edx],al
     ece:	91                   	xchg   ecx,eax
     ecf:	00 19                	add    BYTE PTR [ecx],bl
     ed1:	4e                   	dec    esi
     ed2:	05 00 00 01 47       	add    eax,0x47010000
     ed7:	01 ef                	add    edi,ebp
     ed9:	03 00                	add    eax,DWORD PTR [eax]
     edb:	00 02                	add    BYTE PTR [edx],al
     edd:	91                   	xchg   ecx,eax
     ede:	04 19                	add    al,0x19
     ee0:	2e                   	cs
     ee1:	04 00                	add    al,0x0
     ee3:	00 01                	add    BYTE PTR [ecx],al
     ee5:	47                   	inc    edi
     ee6:	01 ef                	add    edi,ebp
     ee8:	03 00                	add    eax,DWORD PTR [eax]
     eea:	00 02                	add    BYTE PTR [edx],al
     eec:	91                   	xchg   ecx,eax
     eed:	08 20                	or     BYTE PTR [eax],ah
     eef:	cd 04                	int    0x4
     ef1:	00 00                	add    BYTE PTR [eax],al
     ef3:	01 49 01             	add    DWORD PTR [ecx+0x1],ecx
     ef6:	48                   	dec    eax
     ef7:	00 00                	add    BYTE PTR [eax],al
     ef9:	00 02                	add    BYTE PTR [edx],al
     efb:	91                   	xchg   ecx,eax
     efc:	63 20                	arpl   WORD PTR [eax],sp
     efe:	61                   	popa   
     eff:	04 00                	add    al,0x0
     f01:	00 01                	add    BYTE PTR [ecx],al
     f03:	4a                   	dec    edx
     f04:	01 3a                	add    DWORD PTR [edx],edi
     f06:	00 00                	add    BYTE PTR [eax],al
     f08:	00 02                	add    BYTE PTR [edx],al
     f0a:	91                   	xchg   ecx,eax
     f0b:	6c                   	ins    BYTE PTR es:[edi],dx
     f0c:	20 c9                	and    cl,cl
     f0e:	05 00 00 01 4b       	add    eax,0x4b010000
     f13:	01 3a                	add    DWORD PTR [edx],edi
     f15:	00 00                	add    BYTE PTR [eax],al
     f17:	00 02                	add    BYTE PTR [edx],al
     f19:	91                   	xchg   ecx,eax
     f1a:	68 20 80 05 00       	push   0x58020
     f1f:	00 01                	add    BYTE PTR [ecx],al
     f21:	4c                   	dec    esp
     f22:	01 85 06 00 00 02    	add    DWORD PTR [ebp+0x2000006],eax
     f28:	91                   	xchg   ecx,eax
     f29:	4f                   	dec    edi
     f2a:	21 fa                	and    edx,edi
     f2c:	04 00                	add    al,0x0
     f2e:	00 01                	add    BYTE PTR [ecx],al
     f30:	5d                   	pop    ebp
     f31:	01 98 0f 10 03 21    	add    DWORD PTR [eax+0x2103100f],ebx
     f37:	e5 05                	in     eax,0x5
     f39:	00 00                	add    BYTE PTR [eax],al
     f3b:	01 65 01             	add    DWORD PTR [ebp+0x1],esp
     f3e:	e5 0f                	in     eax,0xf
     f40:	10 03                	adc    BYTE PTR [ebx],al
     f42:	21 0f                	and    DWORD PTR [edi],ecx
     f44:	04 00                	add    al,0x0
     f46:	00 01                	add    BYTE PTR [ecx],al
     f48:	c5 01                	lds    eax,FWORD PTR [ecx]
     f4a:	0e                   	push   cs
     f4b:	12 10                	adc    dl,BYTE PTR [eax]
     f4d:	03 15 98 0f 10 03    	add    edx,DWORD PTR ds:0x3100f98
     f53:	f6 02 00             	test   BYTE PTR [edx],0x0
     f56:	00 1a                	add    BYTE PTR [edx],bl
     f58:	69 00 01 ca 01 3a    	imul   eax,DWORD PTR [eax],0x3a01ca01
     f5e:	00 00                	add    BYTE PTR [eax],al
     f60:	00 02                	add    BYTE PTR [edx],al
     f62:	91                   	xchg   ecx,eax
     f63:	64 00 00             	add    BYTE PTR fs:[eax],al
     f66:	16                   	push   ss
     f67:	25 00 00 00 95       	and    eax,0x95000000
     f6c:	06                   	push   es
     f6d:	00 00                	add    BYTE PTR [eax],al
     f6f:	17                   	pop    ss
     f70:	93                   	xchg   ebx,eax
     f71:	00 00                	add    BYTE PTR [eax],al
     f73:	00 13                	add    BYTE PTR [ebx],dl
     f75:	00 16                	add    BYTE PTR [esi],dl
     f77:	00 02                	add    BYTE PTR [edx],al
     f79:	00 00                	add    BYTE PTR [eax],al
     f7b:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
     f7c:	06                   	push   es
     f7d:	00 00                	add    BYTE PTR [eax],al
     f7f:	17                   	pop    ss
     f80:	93                   	xchg   ebx,eax
     f81:	00 00                	add    BYTE PTR [eax],al
     f83:	00 09                	add    BYTE PTR [ecx],cl
     f85:	00 14 3c             	add    BYTE PTR [esp+edi*1],dl
     f88:	01 00                	add    DWORD PTR [eax],eax
     f8a:	00 04 36             	add    BYTE PTR [esi+esi*1],al
     f8d:	95                   	xchg   ebp,eax
     f8e:	06                   	push   es
     f8f:	00 00                	add    BYTE PTR [eax],al
     f91:	05 03 40 22 10       	add    eax,0x10224003
     f96:	03 22                	add    esp,DWORD PTR [edx]
     f98:	60                   	pusha  
     f99:	03 00                	add    eax,DWORD PTR [eax]
     f9b:	00 05 34 61 00 00    	add    BYTE PTR ds:0x6134,al
     fa1:	00 05 03 2c 27 10    	add    BYTE PTR ds:0x10272c03,al
     fa7:	03 22                	add    esp,DWORD PTR [edx]
     fa9:	0e                   	push   cs
     faa:	02 00                	add    al,BYTE PTR [eax]
     fac:	00 05 35 61 00 00    	add    BYTE PTR ds:0x6135,al
     fb2:	00 05 03 30 27 10    	add    BYTE PTR ds:0x10273003,al
     fb8:	03 22                	add    esp,DWORD PTR [edx]
     fba:	6a 00                	push   0x0
     fbc:	00 00                	add    BYTE PTR [eax],al
     fbe:	05 36 61 00 00       	add    eax,0x6136
     fc3:	00 05 03 28 27 10    	add    BYTE PTR ds:0x10272803,al
     fc9:	03 22                	add    esp,DWORD PTR [edx]
     fcb:	96                   	xchg   esi,eax
     fcc:	03 00                	add    eax,DWORD PTR [eax]
     fce:	00 05 37 7a 00 00    	add    BYTE PTR ds:0x7a37,al
     fd4:	00 05 03 50 27 10    	add    BYTE PTR ds:0x10275003,al
     fda:	03 22                	add    esp,DWORD PTR [edx]
     fdc:	b7 02                	mov    bh,0x2
     fde:	00 00                	add    BYTE PTR [eax],al
     fe0:	06                   	push   es
     fe1:	4f                   	dec    edi
     fe2:	ef                   	out    dx,eax
     fe3:	03 00                	add    eax,DWORD PTR [eax]
     fe5:	00 05 03 40 27 10    	add    BYTE PTR ds:0x10274003,al
     feb:	03 22                	add    esp,DWORD PTR [edx]
     fed:	b8 03 00 00 03       	mov    eax,0x3000003
     ff2:	63 24 01             	arpl   WORD PTR [ecx+eax*1],sp
     ff5:	00 00                	add    BYTE PTR [eax],al
     ff7:	05 03 38 27 10       	add    eax,0x10273803
     ffc:	03 22                	add    esp,DWORD PTR [edx]
     ffe:	6e                   	outs   dx,BYTE PTR ds:[esi]
     fff:	03 00                	add    eax,DWORD PTR [eax]
    1001:	00 03                	add    BYTE PTR [ebx],al
    1003:	e1 73                	loope  1078 <cmdClearScreen-0x30fef88>
    1005:	01 00                	add    DWORD PTR [eax],eax
    1007:	00 05 03 24 27 10    	add    BYTE PTR ds:0x10272403,al
    100d:	03 23                	add    esp,DWORD PTR [ebx]
    100f:	22 6d 01             	and    ch,BYTE PTR [ebp+0x1]
    1012:	00 00                	add    BYTE PTR [eax],al
    1014:	04 25                	add    al,0x25
    1016:	3f                   	aas    
    1017:	07                   	pop    es
    1018:	00 00                	add    BYTE PTR [eax],al
    101a:	05 03 34 27 10       	add    eax,0x10273403
    101f:	03 05 04 2d 07 00    	add    eax,DWORD PTR ds:0x72d04
    1025:	00 24 50             	add    BYTE PTR [eax+edx*2],ah
    1028:	07                   	pop    es
    1029:	00 00                	add    BYTE PTR [eax],al
    102b:	25 fa 01 00 00       	and    eax,0x1fa
    1030:	00 22                	add    BYTE PTR [edx],ah
    1032:	d4 01                	aam    0x1
    1034:	00 00                	add    BYTE PTR [eax],al
    1036:	04 26                	add    al,0x26
    1038:	61                   	popa   
    1039:	07                   	pop    es
    103a:	00 00                	add    BYTE PTR [eax],al
    103c:	05 03 20 27 10       	add    eax,0x10272003
    1041:	03 05 04 45 07 00    	add    eax,DWORD PTR ds:0x74504
    1047:	00 16                	add    BYTE PTR [esi],dl
    1049:	25 00 00 00 78       	and    eax,0x78000000
    104e:	07                   	pop    es
    104f:	00 00                	add    BYTE PTR [eax],al
    1051:	26                   	es
    1052:	93                   	xchg   ebx,eax
    1053:	00 00                	add    BYTE PTR [eax],al
    1055:	00 ff                	add    bh,bh
    1057:	01 00                	add    DWORD PTR [eax],eax
    1059:	22 17                	and    dl,BYTE PTR [edi]
    105b:	02 00                	add    al,BYTE PTR [eax]
    105d:	00 04 2d 67 07 00 00 	add    BYTE PTR [ebp*1+0x767],al
    1064:	05 03 20 25 10       	add    eax,0x10252003
    1069:	03 22                	add    esp,DWORD PTR [edx]
    106b:	e0 03                	loopne 1070 <cmdClearScreen-0x30fef90>
    106d:	00 00                	add    BYTE PTR [eax],al
    106f:	04 2e                	add    al,0x2e
    1071:	fa                   	cli    
    1072:	01 00                	add    DWORD PTR [eax],eax
    1074:	00 05 03 4c 27 10    	add    BYTE PTR ds:0x10274c03,al
    107a:	03 22                	add    esp,DWORD PTR [edx]
    107c:	00 00                	add    BYTE PTR [eax],al
    107e:	00 00                	add    BYTE PTR [eax],al
    1080:	04 2f                	add    al,0x2f
    1082:	ef                   	out    dx,eax
    1083:	03 00                	add    eax,DWORD PTR [eax]
    1085:	00 05 03 0c 24 10    	add    BYTE PTR ds:0x10240c03,al
    108b:	03 16                	add    edx,DWORD PTR [esi]
    108d:	25 00 00 00 bb       	and    eax,0xbb000000
    1092:	07                   	pop    es
    1093:	00 00                	add    BYTE PTR [eax],al
    1095:	17                   	pop    ss
    1096:	93                   	xchg   ebx,eax
    1097:	00 00                	add    BYTE PTR [eax],al
    1099:	00 05 00 22 29 02    	add    BYTE PTR ds:0x2292200,al
    109f:	00 00                	add    BYTE PTR [eax],al
    10a1:	04 30                	add    al,0x30
    10a3:	ab                   	stos   DWORD PTR es:[edi],eax
    10a4:	07                   	pop    es
    10a5:	00 00                	add    BYTE PTR [eax],al
    10a7:	05 03 04 24 10       	add    eax,0x10240403
    10ac:	03 22                	add    esp,DWORD PTR [edx]
    10ae:	c3                   	ret    
    10af:	02 00                	add    al,BYTE PTR [eax]
    10b1:	00 04 31             	add    BYTE PTR [ecx+esi*1],al
    10b4:	61                   	popa   
    10b5:	00 00                	add    BYTE PTR [eax],al
    10b7:	00 05 03 48 27 10    	add    BYTE PTR ds:0x10274803,al
    10bd:	03 22                	add    esp,DWORD PTR [edx]
    10bf:	58                   	pop    eax
    10c0:	02 00                	add    al,BYTE PTR [eax]
    10c2:	00 04 31             	add    BYTE PTR [ecx+esi*1],al
    10c5:	61                   	popa   
    10c6:	00 00                	add    BYTE PTR [eax],al
    10c8:	00 05 03 44 27 10    	add    BYTE PTR ds:0x10274403,al
    10ce:	03 22                	add    esp,DWORD PTR [edx]
    10d0:	31 01                	xor    DWORD PTR [ecx],eax
    10d2:	00 00                	add    BYTE PTR [eax],al
    10d4:	04 32                	add    al,0x32
    10d6:	8c 00                	mov    WORD PTR [eax],es
    10d8:	00 00                	add    BYTE PTR [eax],al
    10da:	05 03 54 27 10       	add    eax,0x10275403
    10df:	03 16                	add    edx,DWORD PTR [esi]
    10e1:	25 00 00 00 0f       	and    eax,0xf000000
    10e6:	08 00                	or     BYTE PTR [eax],al
    10e8:	00 17                	add    BYTE PTR [edi],dl
    10ea:	93                   	xchg   ebx,eax
    10eb:	00 00                	add    BYTE PTR [eax],al
    10ed:	00 ff                	add    bh,bh
    10ef:	00 27                	add    BYTE PTR [edi],ah
    10f1:	63 77 64             	arpl   WORD PTR [edi+0x64],si
    10f4:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    10f7:	ff 07                	inc    DWORD PTR [edi]
    10f9:	00 00                	add    BYTE PTR [eax],al
    10fb:	05 03 20 24 10       	add    eax,0x10242003
    1100:	03 22                	add    esp,DWORD PTR [edx]
    1102:	ae                   	scas   al,BYTE PTR es:[edi]
    1103:	01 00                	add    DWORD PTR [eax],eax
    1105:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    1108:	8c 00                	mov    WORD PTR [eax],es
    110a:	00 00                	add    BYTE PTR [eax],al
    110c:	05 03 00 24 10       	add    eax,0x10240003
    1111:	03 16                	add    edx,DWORD PTR [esi]
    1113:	25 00 00 00 48       	and    eax,0x48000000
    1118:	08 00                	or     BYTE PTR [eax],al
    111a:	00 26                	add    BYTE PTR [esi],ah
    111c:	93                   	xchg   ebx,eax
    111d:	00 00                	add    BYTE PTR [eax],al
    111f:	00 f3                	add    bl,dh
    1121:	01 17                	add    DWORD PTR [edi],edx
    1123:	93                   	xchg   ebx,eax
    1124:	00 00                	add    BYTE PTR [eax],al
    1126:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
    1129:	22 94 04 00 00 01 10 	and    dl,BYTE PTR [esp+eax*1+0x10010000]
    1130:	31 08                	xor    DWORD PTR [eax],ecx
    1132:	00 00                	add    BYTE PTR [eax],al
    1134:	05 03 60 27 10       	add    eax,0x10276003
    1139:	03 22                	add    esp,DWORD PTR [edx]
    113b:	53                   	push   ebx
    113c:	05 00 00 01 11       	add    eax,0x11010000
    1141:	3a 00                	cmp    al,BYTE PTR [eax]
    1143:	00 00                	add    BYTE PTR [eax],al
    1145:	05 03 58 27 10       	add    eax,0x10275803
    114a:	03 22                	add    esp,DWORD PTR [edx]
    114c:	33 04 00             	xor    eax,DWORD PTR [eax+eax*1]
    114f:	00 01                	add    BYTE PTR [ecx],al
    1151:	12 3a                	adc    bh,BYTE PTR [edx]
    1153:	00 00                	add    BYTE PTR [eax],al
    1155:	00 05 03 5c 27 10    	add    BYTE PTR ds:0x10275c03,al
    115b:	03 22                	add    esp,DWORD PTR [edx]
    115d:	8b 04 00             	mov    eax,DWORD PTR [eax+eax*1]
    1160:	00 01                	add    BYTE PTR [ecx],al
    1162:	13 ff                	adc    edi,edi
    1164:	07                   	pop    es
    1165:	00 00                	add    BYTE PTR [eax],al
    1167:	05 03 60 21 11       	add    eax,0x11216003
    116c:	03 00                	add    eax,DWORD PTR [eax]

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
 19a:	21 00                	and    DWORD PTR [eax],eax
 19c:	49                   	dec    ecx
 19d:	13 2f                	adc    ebp,DWORD PTR [edi]
 19f:	18 00                	sbb    BYTE PTR [eax],al
 1a1:	00 1f                	add    BYTE PTR [edi],bl
 1a3:	34 00                	xor    al,0x0
 1a5:	03 0e                	add    ecx,DWORD PTR [esi]
 1a7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1a9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1ab:	49                   	dec    ecx
 1ac:	13 3f                	adc    edi,DWORD PTR [edi]
 1ae:	19 02                	sbb    DWORD PTR [edx],eax
 1b0:	18 00                	sbb    BYTE PTR [eax],al
 1b2:	00 20                	add    BYTE PTR [eax],ah
 1b4:	15 00 27 19 00       	adc    eax,0x192700
 1b9:	00 21                	add    BYTE PTR [ecx],ah
 1bb:	15 01 27 19 01       	adc    eax,0x1192701
 1c0:	13 00                	adc    eax,DWORD PTR [eax]
 1c2:	00 22                	add    BYTE PTR [edx],ah
 1c4:	05 00 49 13 00       	add    eax,0x134900
 1c9:	00 23                	add    BYTE PTR [ebx],ah
 1cb:	21 00                	and    DWORD PTR [eax],eax
 1cd:	49                   	dec    ecx
 1ce:	13 2f                	adc    ebp,DWORD PTR [edi]
 1d0:	05 00 00 24 34       	add    eax,0x34240000
 1d5:	00 03                	add    BYTE PTR [ebx],al
 1d7:	08 3a                	or     BYTE PTR [edx],bh
 1d9:	0b 3b                	or     edi,DWORD PTR [ebx]
 1db:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 1de:	3f                   	aas    
 1df:	19 02                	sbb    DWORD PTR [edx],eax
 1e1:	18 00                	sbb    BYTE PTR [eax],al
 1e3:	00 00                	add    BYTE PTR [eax],al
 1e5:	01 11                	add    DWORD PTR [ecx],edx
 1e7:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 1ed:	0e                   	push   cs
 1ee:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 1f0:	11 01                	adc    DWORD PTR [ecx],eax
 1f2:	12 06                	adc    al,BYTE PTR [esi]
 1f4:	10 17                	adc    BYTE PTR [edi],dl
 1f6:	00 00                	add    BYTE PTR [eax],al
 1f8:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 1fb:	0b 0b                	or     ecx,DWORD PTR [ebx]
 1fd:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 200:	0e                   	push   cs
 201:	00 00                	add    BYTE PTR [eax],al
 203:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 206:	0b 0b                	or     ecx,DWORD PTR [ebx]
 208:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 20b:	08 00                	or     BYTE PTR [eax],al
 20d:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 210:	00 03                	add    BYTE PTR [ebx],al
 212:	0e                   	push   cs
 213:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 215:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 217:	49                   	dec    ecx
 218:	13 00                	adc    eax,DWORD PTR [eax]
 21a:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 220:	49                   	dec    ecx
 221:	13 00                	adc    eax,DWORD PTR [eax]
 223:	00 06                	add    BYTE PTR [esi],al
 225:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 229:	00 00                	add    BYTE PTR [eax],al
 22b:	07                   	pop    es
 22c:	0f 00 0b             	str    WORD PTR [ebx]
 22f:	0b 00                	or     eax,DWORD PTR [eax]
 231:	00 08                	add    BYTE PTR [eax],cl
 233:	13 01                	adc    eax,DWORD PTR [ecx]
 235:	0b 0b                	or     ecx,DWORD PTR [ebx]
 237:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 239:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 23b:	01 13                	add    DWORD PTR [ebx],edx
 23d:	00 00                	add    BYTE PTR [eax],al
 23f:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
 245:	0b 3b                	or     edi,DWORD PTR [ebx]
 247:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 24a:	0b 0b                	or     ecx,DWORD PTR [ebx]
 24c:	0d 0b 0c 0b 38       	or     eax,0x380b0c0b
 251:	0b 00                	or     eax,DWORD PTR [eax]
 253:	00 0a                	add    BYTE PTR [edx],cl
 255:	17                   	pop    ss
 256:	01 0b                	add    DWORD PTR [ebx],ecx
 258:	0b 3a                	or     edi,DWORD PTR [edx]
 25a:	0b 3b                	or     edi,DWORD PTR [ebx]
 25c:	0b 01                	or     eax,DWORD PTR [ecx]
 25e:	13 00                	adc    eax,DWORD PTR [eax]
 260:	00 0b                	add    BYTE PTR [ebx],cl
 262:	0d 00 49 13 00       	or     eax,0x134900
 267:	00 0c 0d 00 03 08 3a 	add    BYTE PTR [ecx*1+0x3a080300],cl
 26e:	0b 3b                	or     edi,DWORD PTR [ebx]
 270:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 273:	00 00                	add    BYTE PTR [eax],al
 275:	0d 04 01 03 0e       	or     eax,0xe030104
 27a:	0b 0b                	or     ecx,DWORD PTR [ebx]
 27c:	49                   	dec    ecx
 27d:	13 3a                	adc    edi,DWORD PTR [edx]
 27f:	0b 3b                	or     edi,DWORD PTR [ebx]
 281:	0b 01                	or     eax,DWORD PTR [ecx]
 283:	13 00                	adc    eax,DWORD PTR [eax]
 285:	00 0e                	add    BYTE PTR [esi],cl
 287:	28 00                	sub    BYTE PTR [eax],al
 289:	03 0e                	add    ecx,DWORD PTR [esi]
 28b:	1c 0b                	sbb    al,0xb
 28d:	00 00                	add    BYTE PTR [eax],al
 28f:	0f 0d 00             	prefetch BYTE PTR [eax]
 292:	03 0e                	add    ecx,DWORD PTR [esi]
 294:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 296:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 298:	49                   	dec    ecx
 299:	13 38                	adc    edi,DWORD PTR [eax]
 29b:	0b 00                	or     eax,DWORD PTR [eax]
 29d:	00 10                	add    BYTE PTR [eax],dl
 29f:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 2a2:	19 03                	sbb    DWORD PTR [ebx],eax
 2a4:	0e                   	push   cs
 2a5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2a7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2a9:	27                   	daa    
 2aa:	19 11                	sbb    DWORD PTR [ecx],edx
 2ac:	01 12                	add    DWORD PTR [edx],edx
 2ae:	06                   	push   es
 2af:	40                   	inc    eax
 2b0:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 2b6:	00 00                	add    BYTE PTR [eax],al
 2b8:	11 05 00 03 0e 3a    	adc    DWORD PTR ds:0x3a0e0300,eax
 2be:	0b 3b                	or     edi,DWORD PTR [ebx]
 2c0:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 2c3:	02 18                	add    bl,BYTE PTR [eax]
 2c5:	00 00                	add    BYTE PTR [eax],al
 2c7:	12 34 00             	adc    dh,BYTE PTR [eax+eax*1]
 2ca:	03 08                	add    ecx,DWORD PTR [eax]
 2cc:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2ce:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2d0:	49                   	dec    ecx
 2d1:	13 02                	adc    eax,DWORD PTR [edx]
 2d3:	18 00                	sbb    BYTE PTR [eax],al
 2d5:	00 13                	add    BYTE PTR [ebx],dl
 2d7:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 2da:	19 03                	sbb    DWORD PTR [ebx],eax
 2dc:	0e                   	push   cs
 2dd:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2df:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2e1:	27                   	daa    
 2e2:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 2e5:	11 01                	adc    DWORD PTR [ecx],eax
 2e7:	12 06                	adc    al,BYTE PTR [esi]
 2e9:	40                   	inc    eax
 2ea:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 2f0:	00 00                	add    BYTE PTR [eax],al
 2f2:	14 34                	adc    al,0x34
 2f4:	00 03                	add    BYTE PTR [ebx],al
 2f6:	0e                   	push   cs
 2f7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2f9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2fb:	49                   	dec    ecx
 2fc:	13 02                	adc    eax,DWORD PTR [edx]
 2fe:	18 00                	sbb    BYTE PTR [eax],al
 300:	00 15 0b 01 11 01    	add    BYTE PTR ds:0x111010b,dl
 306:	12 06                	adc    al,BYTE PTR [esi]
 308:	00 00                	add    BYTE PTR [eax],al
 30a:	16                   	push   ss
 30b:	01 01                	add    DWORD PTR [ecx],eax
 30d:	49                   	dec    ecx
 30e:	13 01                	adc    eax,DWORD PTR [ecx]
 310:	13 00                	adc    eax,DWORD PTR [eax]
 312:	00 17                	add    BYTE PTR [edi],dl
 314:	21 00                	and    DWORD PTR [eax],eax
 316:	49                   	dec    ecx
 317:	13 2f                	adc    ebp,DWORD PTR [edi]
 319:	0b 00                	or     eax,DWORD PTR [eax]
 31b:	00 18                	add    BYTE PTR [eax],bl
 31d:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 320:	19 03                	sbb    DWORD PTR [ebx],eax
 322:	0e                   	push   cs
 323:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 325:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 32b:	11 01                	adc    DWORD PTR [ecx],eax
 32d:	12 06                	adc    al,BYTE PTR [esi]
 32f:	40                   	inc    eax
 330:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 336:	00 00                	add    BYTE PTR [eax],al
 338:	19 05 00 03 0e 3a    	sbb    DWORD PTR ds:0x3a0e0300,eax
 33e:	0b 3b                	or     edi,DWORD PTR [ebx]
 340:	05 49 13 02 18       	add    eax,0x18021349
 345:	00 00                	add    BYTE PTR [eax],al
 347:	1a 34 00             	sbb    dh,BYTE PTR [eax+eax*1]
 34a:	03 08                	add    ecx,DWORD PTR [eax]
 34c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 34e:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 354:	00 00                	add    BYTE PTR [eax],al
 356:	1b 2e                	sbb    ebp,DWORD PTR [esi]
 358:	01 3f                	add    DWORD PTR [edi],edi
 35a:	19 03                	sbb    DWORD PTR [ebx],eax
 35c:	0e                   	push   cs
 35d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 35f:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 365:	12 06                	adc    al,BYTE PTR [esi]
 367:	40                   	inc    eax
 368:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 36e:	00 00                	add    BYTE PTR [eax],al
 370:	1c 2e                	sbb    al,0x2e
 372:	00 3f                	add    BYTE PTR [edi],bh
 374:	19 03                	sbb    DWORD PTR [ebx],eax
 376:	0e                   	push   cs
 377:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 379:	3b 05 11 01 12 06    	cmp    eax,DWORD PTR ds:0x6120111
 37f:	40                   	inc    eax
 380:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 386:	1d 2e 01 3f 19       	sbb    eax,0x193f012e
 38b:	03 0e                	add    ecx,DWORD PTR [esi]
 38d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 38f:	3b 05 49 13 3c 19    	cmp    eax,DWORD PTR ds:0x193c1349
 395:	00 00                	add    BYTE PTR [eax],al
 397:	1e                   	push   ds
 398:	18 00                	sbb    BYTE PTR [eax],al
 39a:	00 00                	add    BYTE PTR [eax],al
 39c:	1f                   	pop    ds
 39d:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 3a0:	19 03                	sbb    DWORD PTR [ebx],eax
 3a2:	0e                   	push   cs
 3a3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3a5:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 3ab:	11 01                	adc    DWORD PTR [ecx],eax
 3ad:	12 06                	adc    al,BYTE PTR [esi]
 3af:	40                   	inc    eax
 3b0:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 3b6:	00 00                	add    BYTE PTR [eax],al
 3b8:	20 34 00             	and    BYTE PTR [eax+eax*1],dh
 3bb:	03 0e                	add    ecx,DWORD PTR [esi]
 3bd:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3bf:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 3c5:	00 00                	add    BYTE PTR [eax],al
 3c7:	21 0a                	and    DWORD PTR [edx],ecx
 3c9:	00 03                	add    BYTE PTR [ebx],al
 3cb:	0e                   	push   cs
 3cc:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3ce:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 3d4:	22 34 00             	and    dh,BYTE PTR [eax+eax*1]
 3d7:	03 0e                	add    ecx,DWORD PTR [esi]
 3d9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3db:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 3dd:	49                   	dec    ecx
 3de:	13 3f                	adc    edi,DWORD PTR [edi]
 3e0:	19 02                	sbb    DWORD PTR [edx],eax
 3e2:	18 00                	sbb    BYTE PTR [eax],al
 3e4:	00 23                	add    BYTE PTR [ebx],ah
 3e6:	15 00 27 19 00       	adc    eax,0x192700
 3eb:	00 24 15 01 27 19 01 	add    BYTE PTR [edx*1+0x1192701],ah
 3f2:	13 00                	adc    eax,DWORD PTR [eax]
 3f4:	00 25 05 00 49 13    	add    BYTE PTR ds:0x13490005,ah
 3fa:	00 00                	add    BYTE PTR [eax],al
 3fc:	26 21 00             	and    DWORD PTR es:[eax],eax
 3ff:	49                   	dec    ecx
 400:	13 2f                	adc    ebp,DWORD PTR [edi]
 402:	05 00 00 27 34       	add    eax,0x34270000
 407:	00 03                	add    BYTE PTR [ebx],al
 409:	08 3a                	or     BYTE PTR [edx],bh
 40b:	0b 3b                	or     edi,DWORD PTR [ebx]
 40d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 410:	3f                   	aas    
 411:	19 02                	sbb    DWORD PTR [edx],eax
 413:	18 00                	sbb    BYTE PTR [eax],al
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
  14:	b0 07                	mov    al,0x7
	...
  1e:	00 00                	add    BYTE PTR [eax],al
  20:	1c 00                	sbb    al,0x0
  22:	00 00                	add    BYTE PTR [eax],al
  24:	02 00                	add    al,BYTE PTR [eax]
  26:	e1 08                	loope  30 <cmdClearScreen-0x30fffd0>
  28:	00 00                	add    BYTE PTR [eax],al
  2a:	04 00                	add    al,0x0
  2c:	00 00                	add    BYTE PTR [eax],al
  2e:	00 00                	add    BYTE PTR [eax],al
  30:	b0 07                	mov    al,0x7
  32:	10 03                	adc    BYTE PTR [ebx],al
  34:	08 0b                	or     BYTE PTR [ebx],cl
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	42                   	inc    edx
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
 1c0:	91                   	xchg   ecx,eax
 1c1:	08 4c 08 3e          	or     BYTE PTR [eax+ecx*1+0x3e],cl
 1c5:	92                   	xchg   edx,eax
 1c6:	08 91 f3 ae c9 00    	or     BYTE PTR [ecx+0xc9aef3],dl
 1cc:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
 1cf:	03 79 2e             	add    edi,DWORD PTR [ecx+0x2e]
 1d2:	00 02                	add    BYTE PTR [edx],al
 1d4:	04 01                	add    al,0x1
 1d6:	06                   	push   es
 1d7:	4a                   	dec    edx
 1d8:	06                   	push   es
 1d9:	03 0b                	add    ecx,DWORD PTR [ebx]
 1db:	82                   	(bad)  
 1dc:	3f                   	aas    
 1dd:	67 f3 3f             	addr16 repz aas 
 1e0:	93                   	xchg   ebx,eax
 1e1:	08 ca                	or     dl,cl
 1e3:	08 bd 9f 75 3f 69    	or     BYTE PTR [ebp+0x693f759f],bh
 1e9:	08 5f 08             	or     BYTE PTR [edi+0x8],bl
 1ec:	2f                   	das    
 1ed:	bb 68 02 22 13       	mov    ebx,0x13220268
 1f2:	02 2e                	add    ch,BYTE PTR [esi]
 1f4:	16                   	push   ss
 1f5:	00 02                	add    BYTE PTR [edx],al
 1f7:	04 02                	add    al,0x2
 1f9:	03 78 02             	add    edi,DWORD PTR [eax+0x2]
 1fc:	2c 01                	sub    al,0x1
 1fe:	00 02                	add    BYTE PTR [edx],al
 200:	04 01                	add    al,0x1
 202:	06                   	push   es
 203:	4a                   	dec    edx
 204:	06                   	push   es
 205:	03 0b                	add    ecx,DWORD PTR [ebx]
 207:	9e                   	sahf   
 208:	3f                   	aas    
 209:	67 08 2f             	or     BYTE PTR [bx],ch
 20c:	02 24 13             	add    ah,BYTE PTR [ebx+edx*1]
 20f:	d7                   	xlat   BYTE PTR ds:[ebx]
 210:	3f                   	aas    
 211:	9e                   	sahf   
 212:	4c                   	dec    esp
 213:	08 bd 75 02 38 14    	or     BYTE PTR [ebp+0x14380275],bh
 219:	00 02                	add    BYTE PTR [edx],al
 21b:	04 03                	add    al,0x3
 21d:	91                   	xchg   ecx,eax
 21e:	00 02                	add    BYTE PTR [edx],al
 220:	04 03                	add    al,0x3
 222:	b9 00 02 04 01       	mov    ecx,0x1040200
 227:	06                   	push   es
 228:	4a                   	dec    edx
 229:	06                   	push   es
 22a:	85 91 d7 00 02 04    	test   DWORD PTR [ecx+0x40200d7],edx
 230:	02 f0                	add    dh,al
 232:	00 02                	add    BYTE PTR [edx],al
 234:	04 01                	add    al,0x1
 236:	06                   	push   es
 237:	4a                   	dec    edx
 238:	06                   	push   es
 239:	86 ae 08 4b 31 02    	xchg   BYTE PTR [esi+0x2314b08],ch
 23f:	2c 13                	sub    al,0x13
 241:	02 05 00 01 01 f4    	add    al,BYTE PTR ds:0xf4010100
 247:	02 00                	add    al,BYTE PTR [eax]
 249:	00 02                	add    BYTE PTR [edx],al
 24b:	00 1d 01 00 00 01    	add    BYTE PTR ds:0x1000001,bl
 251:	01 fb                	add    ebx,edi
 253:	0e                   	push   cs
 254:	0d 00 01 01 01       	or     eax,0x1010100
 259:	01 00                	add    DWORD PTR [eax],eax
 25b:	00 00                	add    BYTE PTR [eax],al
 25d:	01 00                	add    DWORD PTR [eax],eax
 25f:	00 01                	add    BYTE PTR [ecx],al
 261:	73 72                	jae    2d5 <cmdClearScreen-0x30ffd2b>
 263:	63 00                	arpl   WORD PTR [eax],ax
 265:	2f                   	das    
 266:	68 6f 6d 65 2f       	push   0x2f656d6f
 26b:	79 6f                	jns    2dc <cmdClearScreen-0x30ffd24>
 26d:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
 274:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 277:	73 73                	jae    2ec <cmdClearScreen-0x30ffd14>
 279:	2f                   	das    
 27a:	6c                   	ins    BYTE PTR es:[edi],dx
 27b:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
 282:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
 288:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
 28e:	78 2d                	js     2bd <cmdClearScreen-0x30ffd43>
 290:	67 6e                	outs   dx,BYTE PTR ds:[si]
 292:	75 2f                	jne    2c3 <cmdClearScreen-0x30ffd3d>
 294:	35 2e 33 2e 30       	xor    eax,0x302e332e
 299:	2f                   	das    
 29a:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 2a1:	00 2e                	add    BYTE PTR [esi],ch
 2a3:	2e                   	cs
 2a4:	2f                   	das    
 2a5:	2e                   	cs
 2a6:	2e                   	cs
 2a7:	2f                   	das    
 2a8:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 2ac:	6a 2f                	push   0x2f
 2ae:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 2b1:	69 73 4f 53 2f 69 6e 	imul   esi,DWORD PTR [ebx+0x4f],0x6e692f53
 2b8:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 2bc:	65                   	gs
 2bd:	2f                   	das    
 2be:	69 33 38 36 00 69    	imul   esi,DWORD PTR [ebx],0x69003638
 2c4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2c5:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 2c9:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 2cc:	2e                   	cs
 2cd:	2f                   	das    
 2ce:	6c                   	ins    BYTE PTR es:[edi],dx
 2cf:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 2d6:	4f                   	dec    edi
 2d7:	53                   	push   ebx
 2d8:	2f                   	das    
 2d9:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 2e0:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 2e3:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 2e7:	65                   	gs
 2e8:	2f                   	das    
 2e9:	2e                   	cs
 2ea:	2e                   	cs
 2eb:	2f                   	das    
 2ec:	2e                   	cs
 2ed:	2e                   	cs
 2ee:	2f                   	das    
 2ef:	2e                   	cs
 2f0:	2e                   	cs
 2f1:	2f                   	das    
 2f2:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 2f6:	6a 2f                	push   0x2f
 2f8:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 2fb:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
 302:	6e                   	outs   dx,BYTE PTR ds:[esi]
 303:	65                   	gs
 304:	6c                   	ins    BYTE PTR es:[edi],dx
 305:	2f                   	das    
 306:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 30d:	00 00                	add    BYTE PTR [eax],al
 30f:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 313:	6c                   	ins    BYTE PTR es:[edi],dx
 314:	6c                   	ins    BYTE PTR es:[edi],dx
 315:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 318:	01 00                	add    DWORD PTR [eax],eax
 31a:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31d:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
 324:	63 
 325:	2e                   	cs
 326:	68 00 02 00 00       	push   0x200
 32b:	63 70 75             	arpl   WORD PTR [eax+0x75],si
 32e:	2e                   	cs
 32f:	68 00 03 00 00       	push   0x300
 334:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 338:	6c                   	ins    BYTE PTR es:[edi],dx
 339:	6c                   	ins    BYTE PTR es:[edi],dx
 33a:	2e                   	cs
 33b:	68 00 04 00 00       	push   0x400
 340:	6d                   	ins    DWORD PTR es:[edi],dx
 341:	61                   	popa   
 342:	6c                   	ins    BYTE PTR es:[edi],dx
 343:	6c                   	ins    BYTE PTR es:[edi],dx
 344:	6f                   	outs   dx,DWORD PTR ds:[esi]
 345:	63 2e                	arpl   WORD PTR [esi],bp
 347:	68 00 05 00 00       	push   0x500
 34c:	6c                   	ins    BYTE PTR es:[edi],dx
 34d:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 354:	4f                   	dec    edi
 355:	53                   	push   ebx
 356:	2e                   	cs
 357:	68 00 05 00 00       	push   0x500
 35c:	74 68                	je     3c6 <cmdClearScreen-0x30ffc3a>
 35e:	65                   	gs
 35f:	73 69                	jae    3ca <cmdClearScreen-0x30ffc36>
 361:	67 6e                	outs   dx,BYTE PTR ds:[si]
 363:	61                   	popa   
 364:	6c                   	ins    BYTE PTR es:[edi],dx
 365:	73 2e                	jae    395 <cmdClearScreen-0x30ffc6b>
 367:	68 00 06 00 00       	push   0x600
 36c:	00 00                	add    BYTE PTR [eax],al
 36e:	05 02 b0 07 10       	add    eax,0x1007b002
 373:	03 03                	add    eax,DWORD PTR [ebx]
 375:	19 01                	sbb    DWORD PTR [ecx],eax
 377:	75 08                	jne    381 <cmdClearScreen-0x30ffc7f>
 379:	14 68                	adc    al,0x68
 37b:	4c                   	dec    esp
 37c:	08 21                	or     BYTE PTR [ecx],ah
 37e:	08 21                	or     BYTE PTR [ecx],ah
 380:	08 13                	or     BYTE PTR [ebx],dl
 382:	03 0b                	add    ecx,DWORD PTR [ebx]
 384:	74 03                	je     389 <cmdClearScreen-0x30ffc77>
 386:	78 2e                	js     3b6 <cmdClearScreen-0x30ffc4a>
 388:	02 30                	add    dh,BYTE PTR [eax]
 38a:	1a 2c d8             	sbb    ch,BYTE PTR [eax+ebx*8]
 38d:	69 75 d7 d7 4c 08 3e 	imul   esi,DWORD PTR [ebp-0x29],0x3e084cd7
 394:	bc e6 ae 94 08       	mov    esp,0x894aee6
 399:	4b                   	dec    ebx
 39a:	e5 93                	in     eax,0x93
 39c:	00 02                	add    BYTE PTR [edx],al
 39e:	04 02                	add    al,0x2
 3a0:	06                   	push   es
 3a1:	e4 00                	in     al,0x0
 3a3:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
 3a6:	e4 00                	in     al,0x0
 3a8:	02 04 05 e4 06 af 00 	add    al,BYTE PTR [eax*1+0xaf06e4]
 3af:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 3b2:	06                   	push   es
 3b3:	e4 06                	in     al,0x6
 3b5:	e5 02                	in     eax,0x2
 3b7:	25 13 08 4b 67       	and    eax,0x674b0813
 3bc:	e3 34                	jecxz  3f2 <cmdClearScreen-0x30ffc0e>
 3be:	00 02                	add    BYTE PTR [edx],al
 3c0:	04 02                	add    al,0x2
 3c2:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 3c8:	02 03                	add    al,BYTE PTR [ebx]
 3ca:	63 4a 00             	arpl   WORD PTR [edx+0x0],cx
 3cd:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 3d0:	06                   	push   es
 3d1:	4a                   	dec    edx
 3d2:	06                   	push   es
 3d3:	03 1f                	add    ebx,DWORD PTR [edi]
 3d5:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 3d8:	4b                   	dec    ebx
 3d9:	08 4f 3d             	or     BYTE PTR [edi+0x3d],cl
 3dc:	5b                   	pop    ebx
 3dd:	6a 92                	push   0xffffff92
 3df:	02 3b                	add    bh,BYTE PTR [ebx]
 3e1:	14 69                	adc    al,0x69
 3e3:	00 02                	add    BYTE PTR [edx],al
 3e5:	04 02                	add    al,0x2
 3e7:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 3ea:	00 02                	add    BYTE PTR [edx],al
 3ec:	04 01                	add    al,0x1
 3ee:	06                   	push   es
 3ef:	4a                   	dec    edx
 3f0:	06                   	push   es
 3f1:	03 0b                	add    ecx,DWORD PTR [ebx]
 3f3:	66 59                	pop    cx
 3f5:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 3f8:	75 75                	jne    46f <cmdClearScreen-0x30ffb91>
 3fa:	75 75                	jne    471 <cmdClearScreen-0x30ffb8f>
 3fc:	78 a1                	js     39f <cmdClearScreen-0x30ffc61>
 3fe:	08 ec                	or     ah,ch
 400:	00 02                	add    BYTE PTR [edx],al
 402:	04 01                	add    al,0x1
 404:	06                   	push   es
 405:	66 06                	pushw  es
 407:	af                   	scas   eax,DWORD PTR es:[edi]
 408:	68 75 08 4c 67       	push   0x674c0875
 40d:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 410:	5a                   	pop    edx
 411:	00 02                	add    BYTE PTR [edx],al
 413:	04 01                	add    al,0x1
 415:	06                   	push   es
 416:	9e                   	sahf   
 417:	00 02                	add    BYTE PTR [edx],al
 419:	04 02                	add    al,0x2
 41b:	66                   	data16
 41c:	00 02                	add    BYTE PTR [edx],al
 41e:	04 03                	add    al,0x3
 420:	66 06                	pushw  es
 422:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 423:	68 75 08 5a a0       	push   0xa05a0875
 428:	bc 68 a0 94 08       	mov    esp,0x894a068
 42d:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 430:	94                   	xchg   esp,eax
 431:	08 33                	or     BYTE PTR [ebx],dh
 433:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 438:	16                   	push   ss
 439:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 43c:	03 3a                	add    edi,DWORD PTR [edx]
 43e:	d6                   	(bad)  
 43f:	68 d8 08 e7 08       	push   0x8e708d8
 444:	13 d7                	adc    edx,edi
 446:	08 e5                	or     ch,ah
 448:	08 3e                	or     BYTE PTR [esi],bh
 44a:	4b                   	dec    ebx
 44b:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 44e:	d9 d9                	(bad)  
 450:	d7                   	xlat   BYTE PTR ds:[ebx]
 451:	d7                   	xlat   BYTE PTR ds:[ebx]
 452:	3d 31 75 00 02       	cmp    eax,0x2007531
 457:	04 03                	add    al,0x3
 459:	92                   	xchg   edx,eax
 45a:	00 02                	add    BYTE PTR [edx],al
 45c:	04 03                	add    al,0x3
 45e:	02 22                	add    ah,BYTE PTR [edx]
 460:	13 00                	adc    eax,DWORD PTR [eax]
 462:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 465:	02 30                	add    dh,BYTE PTR [eax]
 467:	0f 00 02             	sldt   WORD PTR [edx]
 46a:	04 01                	add    al,0x1
 46c:	06                   	push   es
 46d:	4a                   	dec    edx
 46e:	06                   	push   es
 46f:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 475:	04 03                	add    al,0x3
 477:	91                   	xchg   ecx,eax
 478:	00 02                	add    BYTE PTR [edx],al
 47a:	04 03                	add    al,0x3
 47c:	ff 00                	inc    DWORD PTR [eax]
 47e:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 481:	06                   	push   es
 482:	4a                   	dec    edx
 483:	06                   	push   es
 484:	84 d7                	test   bh,dl
 486:	3f                   	aas    
 487:	68 92 08 30 08       	push   0x8300892
 48c:	f3 68 08 5a 08 4c    	repz push 0x4c085a08
 492:	00 02                	add    BYTE PTR [edx],al
 494:	04 02                	add    al,0x2
 496:	03 75 74             	add    esi,DWORD PTR [ebp+0x74]
 499:	00 02                	add    BYTE PTR [edx],al
 49b:	04 01                	add    al,0x1
 49d:	06                   	push   es
 49e:	4a                   	dec    edx
 49f:	06                   	push   es
 4a0:	03 0f                	add    ecx,DWORD PTR [edi]
 4a2:	66 59                	pop    cx
 4a4:	03 0d 2e 67 02 25    	add    ecx,DWORD PTR ds:0x2502672e
 4aa:	13 3f                	adc    edi,DWORD PTR [edi]
 4ac:	67 08 91 3f 67       	or     BYTE PTR [bx+di+0x673f],dl
 4b1:	59                   	pop    ecx
 4b2:	59                   	pop    ecx
 4b3:	08 30                	or     BYTE PTR [eax],dh
 4b5:	3f                   	aas    
 4b6:	3d 85 75 22 3f       	cmp    eax,0x3f227585
 4bb:	67 89 2a             	mov    DWORD PTR [bp+si],ebp
 4be:	f3 75 22             	repz jne 4e3 <cmdClearScreen-0x30ffb1d>
 4c1:	3f                   	aas    
 4c2:	67 4b                	addr16 dec ebx
 4c4:	75 77                	jne    53d <cmdClearScreen-0x30ffac3>
 4c6:	75 9f                	jne    467 <cmdClearScreen-0x30ffb99>
 4c8:	75 08                	jne    4d2 <cmdClearScreen-0x30ffb2e>
 4ca:	4b                   	dec    ebx
 4cb:	83 4b 08 4b          	or     DWORD PTR [ebx+0x8],0x4b
 4cf:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 4d2:	5b                   	pop    ebx
 4d3:	08 3e                	or     BYTE PTR [esi],bh
 4d5:	5b                   	pop    ebx
 4d6:	9f                   	lahf   
 4d7:	75 4b                	jne    524 <cmdClearScreen-0x30ffadc>
 4d9:	75 08                	jne    4e3 <cmdClearScreen-0x30ffb1d>
 4db:	67 08 4b 5a          	or     BYTE PTR [bp+di+0x5a],cl
 4df:	4b                   	dec    ebx
 4e0:	30 08                	xor    BYTE PTR [eax],cl
 4e2:	22 ae c9 75 75 03    	and    ch,BYTE PTR [esi+0x37575c9]
 4e8:	77 58                	ja     542 <cmdClearScreen-0x30ffabe>
 4ea:	03 0d 82 bc 93 bc    	add    ecx,DWORD PTR ds:0xbc93bc82
 4f0:	02 2b                	add    ch,BYTE PTR [ebx]
 4f2:	13 83 30 f3 47 6b    	adc    eax,DWORD PTR [ebx+0x6b47f330]
 4f8:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 4fb:	30 5d bc             	xor    BYTE PTR [ebp-0x44],bl
 4fe:	cb                   	retf   
 4ff:	08 4c 02 2b          	or     BYTE PTR [edx+eax*1+0x2b],cl
 503:	13 83 30 f3 47 6b    	adc    eax,DWORD PTR [ebx+0x6b47f330]
 509:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 50c:	30 5d 84             	xor    BYTE PTR [ebp-0x7c],bl
 50f:	a0 f5 5a 84 08       	mov    al,ds:0x8845af5
 514:	4c                   	dec    esp
 515:	84 d8                	test   al,bl
 517:	4b                   	dec    ebx
 518:	ad                   	lods   eax,DWORD PTR ds:[esi]
 519:	08 4d 84             	or     BYTE PTR [ebp-0x7c],cl
 51c:	f3 03 0d 20 03 77 f2 	repz add ecx,DWORD PTR ds:0xf2770320
 523:	08 30                	or     BYTE PTR [eax],dh
 525:	08 76 76             	or     BYTE PTR [esi+0x76],dh
 528:	5d                   	pop    ebp
 529:	67 f3 08 2f          	repz or BYTE PTR [bx],ch
 52d:	03 90 7f f2 03 f2    	add    edx,DWORD PTR [eax-0xdfc0d81]
 533:	00 08                	add    BYTE PTR [eax],cl
 535:	20 08                	and    BYTE PTR [eax],cl
 537:	13 59 02             	adc    ebx,DWORD PTR [ecx+0x2]
 53a:	02 00                	add    al,BYTE PTR [eax]
 53c:	01 01                	add    DWORD PTR [ecx],eax

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
 300:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 303:	54                   	push   esp
 304:	69 6d 65 00 74 6d 5f 	imul   ebp,DWORD PTR [ebp+0x65],0x5f6d7400
 30b:	79 64                	jns    371 <cmdClearScreen-0x30ffc8f>
 30d:	61                   	popa   
 30e:	79 00                	jns    310 <cmdClearScreen-0x30ffcf0>
 310:	5f                   	pop    edi
 311:	42                   	inc    edx
 312:	6f                   	outs   dx,DWORD PTR ds:[esi]
 313:	6f                   	outs   dx,DWORD PTR ds:[esi]
 314:	6c                   	ins    BYTE PTR es:[edi],dx
 315:	00 53 49             	add    BYTE PTR [ebx+0x49],dl
 318:	47                   	inc    edi
 319:	48                   	dec    eax
 31a:	41                   	inc    ecx
 31b:	4c                   	dec    esp
 31c:	54                   	push   esp
 31d:	00 74 65 73          	add    BYTE PTR [ebp+eiz*2+0x73],dh
 321:	74 00                	je     323 <cmdClearScreen-0x30ffcdd>
 323:	74 6d                	je     392 <cmdClearScreen-0x30ffc6e>
 325:	5f                   	pop    edi
 326:	6d                   	ins    DWORD PTR es:[edi],dx
 327:	69 6e 00 74 6d 5f 69 	imul   ebp,DWORD PTR [esi+0x0],0x695f6d74
 32e:	73 64                	jae    394 <cmdClearScreen-0x30ffc6c>
 330:	73 74                	jae    3a6 <cmdClearScreen-0x30ffc5a>
 332:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 335:	64                   	fs
 336:	54                   	push   esp
 337:	69 6d 65 00 73 74 61 	imul   ebp,DWORD PTR [ebp+0x65],0x61747300
 33e:	72 74                	jb     3b4 <cmdClearScreen-0x30ffc4c>
 340:	54                   	push   esp
 341:	69 6d 65 00 53 49 47 	imul   ebp,DWORD PTR [ebp+0x65],0x47495300
 348:	53                   	push   ebx
 349:	45                   	inc    ebp
 34a:	47                   	inc    edi
 34b:	56                   	push   esi
 34c:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 350:	77 64                	ja     3b6 <cmdClearScreen-0x30ffc4a>
 352:	61                   	popa   
 353:	79 00                	jns    355 <cmdClearScreen-0x30ffcab>
 355:	73 69                	jae    3c0 <cmdClearScreen-0x30ffc40>
 357:	7a 65                	jp     3be <cmdClearScreen-0x30ffc42>
 359:	00 66 6f             	add    BYTE PTR [esi+0x6f],ah
 35c:	75 6e                	jne    3cc <cmdClearScreen-0x30ffc34>
 35e:	64 00 68 65          	add    BYTE PTR fs:[eax+0x65],ch
 362:	61                   	popa   
 363:	70 42                	jo     3a7 <cmdClearScreen-0x30ffc59>
 365:	61                   	popa   
 366:	73 65                	jae    3cd <cmdClearScreen-0x30ffc33>
 368:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 36b:	74 68                	je     3d5 <cmdClearScreen-0x30ffc2b>
 36d:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 370:	75 69                	jne    3db <cmdClearScreen-0x30ffc25>
 372:	64                   	fs
 373:	5f                   	pop    edi
 374:	65                   	gs
 375:	78 74                	js     3eb <cmdClearScreen-0x30ffc15>
 377:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 379:	64                   	fs
 37a:	65                   	gs
 37b:	64                   	fs
 37c:	5f                   	pop    edi
 37d:	66                   	data16
 37e:	65                   	gs
 37f:	61                   	popa   
 380:	74 75                	je     3f7 <cmdClearScreen-0x30ffc09>
 382:	72 65                	jb     3e9 <cmdClearScreen-0x30ffc17>
 384:	5f                   	pop    edi
 385:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
 388:	73 00                	jae    38a <cmdClearScreen-0x30ffc76>
 38a:	70 72                	jo     3fe <cmdClearScreen-0x30ffc02>
 38c:	65                   	gs
 38d:	66                   	data16
 38e:	65                   	gs
 38f:	74 63                	je     3f4 <cmdClearScreen-0x30ffc0c>
 391:	68 77 74 31 00       	push   0x317477
 396:	6c                   	ins    BYTE PTR es:[edi],dx
 397:	69 62 63 54 5a 00 61 	imul   esp,DWORD PTR [edx+0x63],0x61005a54
 39e:	76 78                	jbe    418 <cmdClearScreen-0x30ffbe8>
 3a0:	35 31 32 76 62       	xor    eax,0x62763231
 3a5:	6d                   	ins    DWORD PTR es:[edi],dx
 3a6:	69 00 74 6d 5f 73    	imul   eax,DWORD PTR [eax],0x735f6d74
 3ac:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 3af:	76 61                	jbe    412 <cmdClearScreen-0x30ffbee>
 3b1:	6c                   	ins    BYTE PTR es:[edi],dx
 3b2:	75 65                	jne    419 <cmdClearScreen-0x30ffbe7>
 3b4:	4c                   	dec    esp
 3b5:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3b7:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 3ba:	75 69                	jne    425 <cmdClearScreen-0x30ffbdb>
 3bc:	64                   	fs
 3bd:	5f                   	pop    edi
 3be:	70 72                	jo     432 <cmdClearScreen-0x30ffbce>
 3c0:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3c1:	63 69 6e             	arpl   WORD PTR [ecx+0x6e],bp
 3c4:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3c6:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 3c9:	64                   	fs
 3ca:	53                   	push   ebx
 3cb:	6c                   	ins    BYTE PTR es:[edi],dx
 3cc:	65                   	gs
 3cd:	65                   	gs
 3ce:	70 00                	jo     3d0 <cmdClearScreen-0x30ffc30>
 3d0:	72 65                	jb     437 <cmdClearScreen-0x30ffbc9>
 3d2:	73 65                	jae    439 <cmdClearScreen-0x30ffbc7>
 3d4:	72 76                	jb     44c <cmdClearScreen-0x30ffbb4>
 3d6:	65 64 00 53 49       	gs add BYTE PTR fs:gs:[ebx+0x49],dl
 3db:	47                   	inc    edi
 3dc:	49                   	dec    ecx
 3dd:	4e                   	dec    esi
 3de:	54                   	push   esp
 3df:	00 73 4b             	add    BYTE PTR [ebx+0x4b],dh
 3e2:	53                   	push   ebx
 3e3:	68 65 6c 6c 50       	push   0x506c6c65
 3e8:	72 6f                	jb     459 <cmdClearScreen-0x30ffba7>
 3ea:	67 72 61             	addr16 jb 44e <cmdClearScreen-0x30ffbb2>
 3ed:	6d                   	ins    DWORD PTR es:[edi],dx
 3ee:	4e                   	dec    esi
 3ef:	61                   	popa   
 3f0:	6d                   	ins    DWORD PTR es:[edi],dx
 3f1:	65 00 73 74          	add    BYTE PTR gs:[ebx+0x74],dh
 3f5:	65                   	gs
 3f6:	70 00                	jo     3f8 <cmdClearScreen-0x30ffc08>
 3f8:	6b 65 78 65          	imul   esp,DWORD PTR [ebp+0x78],0x65
 3fc:	63 32                	arpl   WORD PTR [edx],si
 3fe:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 401:	6d                   	ins    DWORD PTR es:[edi],dx
 402:	6d                   	ins    DWORD PTR es:[edi],dx
 403:	61                   	popa   
 404:	6e                   	outs   dx,BYTE PTR ds:[esi]
 405:	64                   	fs
 406:	5f                   	pop    edi
 407:	74 61                	je     46a <cmdClearScreen-0x30ffb96>
 409:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 40d:	74 00                	je     40f <cmdClearScreen-0x30ffbf1>
 40f:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 411:	6e                   	outs   dx,BYTE PTR ds:[esi]
 412:	65                   	gs
 413:	47                   	inc    edi
 414:	65                   	gs
 415:	74 74                	je     48b <cmdClearScreen-0x30ffb75>
 417:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
 41e:	00 6c 52 65          	add    BYTE PTR [edx+edx*2+0x65],ch
 422:	74 56                	je     47a <cmdClearScreen-0x30ffb86>
 424:	61                   	popa   
 425:	6c                   	ins    BYTE PTR es:[edi],dx
 426:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 429:	6f                   	outs   dx,DWORD PTR ds:[esi]
 42a:	6d                   	ins    DWORD PTR es:[edi],dx
 42b:	70 74                	jo     4a1 <cmdClearScreen-0x30ffb5f>
 42d:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 430:	76 70                	jbe    4a2 <cmdClearScreen-0x30ffb5e>
 432:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 435:	6d                   	ins    DWORD PTR es:[edi],dx
 436:	6d                   	ins    DWORD PTR es:[edi],dx
 437:	61                   	popa   
 438:	6e                   	outs   dx,BYTE PTR ds:[esi]
 439:	64                   	fs
 43a:	48                   	dec    eax
 43b:	69 73 74 6f 72 79 4d 	imul   esi,DWORD PTR [ebx+0x74],0x4d79726f
 442:	61                   	popa   
 443:	78 00                	js     445 <cmdClearScreen-0x30ffbbb>
 445:	74 65                	je     4ac <cmdClearScreen-0x30ffb54>
 447:	6d                   	ins    DWORD PTR es:[edi],dx
 448:	70 00                	jo     44a <cmdClearScreen-0x30ffbb6>
 44a:	70 61                	jo     4ad <cmdClearScreen-0x30ffb53>
 44c:	72 73                	jb     4c1 <cmdClearScreen-0x30ffb3f>
 44e:	65                   	gs
 44f:	50                   	push   eax
 450:	61                   	popa   
 451:	72 61                	jb     4b4 <cmdClearScreen-0x30ffb4c>
 453:	6d                   	ins    DWORD PTR es:[edi],dx
 454:	73 53                	jae    4a9 <cmdClearScreen-0x30ffb57>
 456:	68 65 6c 6c 00       	push   0x6c6c65
 45b:	69 6e 70 75 74 00 6c 	imul   ebp,DWORD PTR [esi+0x70],0x6c007475
 462:	43                   	inc    ebx
 463:	75 72                	jne    4d7 <cmdClearScreen-0x30ffb29>
 465:	72 4b                	jb     4b2 <cmdClearScreen-0x30ffb4e>
 467:	65                   	gs
 468:	79 43                	jns    4ad <cmdClearScreen-0x30ffb53>
 46a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 46b:	75 6e                	jne    4db <cmdClearScreen-0x30ffb25>
 46d:	74 00                	je     46f <cmdClearScreen-0x30ffb91>
 46f:	70 61                	jo     4d2 <cmdClearScreen-0x30ffb2e>
 471:	72 73                	jb     4e6 <cmdClearScreen-0x30ffb1a>
 473:	65                   	gs
 474:	64                   	fs
 475:	43                   	inc    ebx
 476:	68 61 72 73 00       	push   0x737261
 47b:	70 70                	jo     4ed <cmdClearScreen-0x30ffb13>
 47d:	74 72                	je     4f1 <cmdClearScreen-0x30ffb0f>
 47f:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 482:	65 63 49 6e          	arpl   WORD PTR gs:[ecx+0x6e],cx
 486:	74 65                	je     4ed <cmdClearScreen-0x30ffb13>
 488:	72 6e                	jb     4f8 <cmdClearScreen-0x30ffb08>
 48a:	61                   	popa   
 48b:	6c                   	ins    BYTE PTR es:[edi],dx
 48c:	43                   	inc    ebx
 48d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 48e:	6d                   	ins    DWORD PTR es:[edi],dx
 48f:	6d                   	ins    DWORD PTR es:[edi],dx
 490:	61                   	popa   
 491:	6e                   	outs   dx,BYTE PTR ds:[esi]
 492:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 496:	6d                   	ins    DWORD PTR es:[edi],dx
 497:	6d                   	ins    DWORD PTR es:[edi],dx
 498:	61                   	popa   
 499:	6e                   	outs   dx,BYTE PTR ds:[esi]
 49a:	64                   	fs
 49b:	48                   	dec    eax
 49c:	69 73 74 6f 72 79 00 	imul   esi,DWORD PTR [ebx+0x74],0x79726f
 4a3:	76 61                	jbe    506 <cmdClearScreen-0x30ffafa>
 4a5:	6c                   	ins    BYTE PTR es:[edi],dx
 4a6:	75 65                	jne    50d <cmdClearScreen-0x30ffaf3>
 4a8:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 4ab:	74 45                	je     4f2 <cmdClearScreen-0x30ffb0e>
 4ad:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4ae:	76 56                	jbe    506 <cmdClearScreen-0x30ffafa>
 4b0:	61                   	popa   
 4b1:	72 69                	jb     51c <cmdClearScreen-0x30ffae4>
 4b3:	61                   	popa   
 4b4:	62 6c 65 56          	bound  ebp,QWORD PTR [ebp+eiz*2+0x56]
 4b8:	61                   	popa   
 4b9:	6c                   	ins    BYTE PTR es:[edi],dx
 4ba:	75 65                	jne    521 <cmdClearScreen-0x30ffadf>
 4bc:	00 64 71 75          	add    BYTE PTR [ecx+esi*2+0x75],ah
 4c0:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4c1:	74 65                	je     528 <cmdClearScreen-0x30ffad8>
 4c3:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 4c6:	65                   	gs
 4c7:	65                   	gs
 4c8:	41                   	inc    ecx
 4c9:	72 67                	jb     532 <cmdClearScreen-0x30fface>
 4cb:	56                   	push   esi
 4cc:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
 4d0:	72 72                	jb     544 <cmdClearScreen-0x30ffabc>
 4d2:	4b                   	dec    ebx
 4d3:	65                   	gs
 4d4:	79 00                	jns    4d6 <cmdClearScreen-0x30ffb2a>
 4d6:	70 61                	jo     539 <cmdClearScreen-0x30ffac7>
 4d8:	72 61                	jb     53b <cmdClearScreen-0x30ffac5>
 4da:	6d                   	ins    DWORD PTR es:[edi],dx
 4db:	73 54                	jae    531 <cmdClearScreen-0x30ffacf>
 4dd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4de:	41                   	inc    ecx
 4df:	72 67                	jb     548 <cmdClearScreen-0x30ffab8>
 4e1:	76 00                	jbe    4e3 <cmdClearScreen-0x30ffb1d>
 4e3:	62 73 71             	bound  esi,QWORD PTR [ebx+0x71]
 4e6:	75 6f                	jne    557 <cmdClearScreen-0x30ffaa9>
 4e8:	74 65                	je     54f <cmdClearScreen-0x30ffab1>
 4ea:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 4ed:	70 72                	jo     561 <cmdClearScreen-0x30ffa9f>
 4ef:	69 6e 74 43 6f 6d 6d 	imul   ebp,DWORD PTR [esi+0x74],0x6d6d6f43
 4f6:	61                   	popa   
 4f7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4f8:	64 00 67 65          	add    BYTE PTR fs:[edi+0x65],ah
 4fc:	74 41                	je     53f <cmdClearScreen-0x30ffac1>
 4fe:	43                   	inc    ebx
 4ff:	6f                   	outs   dx,DWORD PTR ds:[esi]
 500:	6d                   	ins    DWORD PTR es:[edi],dx
 501:	6d                   	ins    DWORD PTR es:[edi],dx
 502:	61                   	popa   
 503:	6e                   	outs   dx,BYTE PTR ds:[esi]
 504:	64 00 6d 61          	add    BYTE PTR fs:[ebp+0x61],ch
 508:	78 61                	js     56b <cmdClearScreen-0x30ffa95>
 50a:	72 67                	jb     573 <cmdClearScreen-0x30ffa8d>
 50c:	63 00                	arpl   WORD PTR [eax],ax
 50e:	70 72                	jo     582 <cmdClearScreen-0x30ffa7e>
 510:	6f                   	outs   dx,DWORD PTR ds:[esi]
 511:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 514:	73 53                	jae    569 <cmdClearScreen-0x30ffa97>
 516:	69 67 6e 61 6c 00 6e 	imul   esp,DWORD PTR [edi+0x6e],0x6e006c61
 51d:	65                   	gs
 51e:	65                   	gs
 51f:	64                   	fs
 520:	44                   	inc    esp
 521:	6f                   	outs   dx,DWORD PTR ds:[esi]
 522:	75 62                	jne    586 <cmdClearScreen-0x30ffa7a>
 524:	6c                   	ins    BYTE PTR es:[edi],dx
 525:	65                   	gs
 526:	51                   	push   ecx
 527:	75 6f                	jne    598 <cmdClearScreen-0x30ffa68>
 529:	74 65                	je     590 <cmdClearScreen-0x30ffa70>
 52b:	74 6f                	je     59c <cmdClearScreen-0x30ffa64>
 52d:	45                   	inc    ebp
 52e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 52f:	64                   	fs
 530:	50                   	push   eax
 531:	61                   	popa   
 532:	72 61                	jb     595 <cmdClearScreen-0x30ffa6b>
 534:	6d                   	ins    DWORD PTR es:[edi],dx
 535:	00 65 76             	add    BYTE PTR [ebp+0x76],ah
 538:	4e                   	dec    esi
 539:	61                   	popa   
 53a:	6d                   	ins    DWORD PTR es:[edi],dx
 53b:	65 00 73 61          	add    BYTE PTR gs:[ebx+0x61],dh
 53f:	76 65                	jbe    5a6 <cmdClearScreen-0x30ffa5a>
 541:	43                   	inc    ebx
 542:	6f                   	outs   dx,DWORD PTR ds:[esi]
 543:	6d                   	ins    DWORD PTR es:[edi],dx
 544:	6d                   	ins    DWORD PTR es:[edi],dx
 545:	61                   	popa   
 546:	6e                   	outs   dx,BYTE PTR ds:[esi]
 547:	64 00 62 75          	add    BYTE PTR fs:[edx+0x75],ah
 54b:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 552:	00 
 553:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 556:	6d                   	ins    DWORD PTR es:[edi],dx
 557:	61                   	popa   
 558:	6e                   	outs   dx,BYTE PTR ds:[esi]
 559:	64                   	fs
 55a:	48                   	dec    eax
 55b:	69 73 74 6f 72 79 50 	imul   esi,DWORD PTR [ebx+0x74],0x5079726f
 562:	74 72                	je     5d6 <cmdClearScreen-0x30ffa2a>
 564:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 567:	67 6e                	outs   dx,BYTE PTR ds:[si]
 569:	61                   	popa   
 56a:	6c                   	ins    BYTE PTR es:[edi],dx
 56b:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 56e:	63 2f                	arpl   WORD PTR [edi],bp
 570:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 574:	6c                   	ins    BYTE PTR es:[edi],dx
 575:	6c                   	ins    BYTE PTR es:[edi],dx
 576:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 579:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 57d:	6c                   	ins    BYTE PTR es:[edi],dx
 57e:	6c                   	ins    BYTE PTR es:[edi],dx
 57f:	00 61 6e             	add    BYTE PTR [ecx+0x6e],ah
 582:	73 69                	jae    5ed <cmdClearScreen-0x30ffa13>
 584:	53                   	push   ebx
 585:	65                   	gs
 586:	71 00                	jno    588 <cmdClearScreen-0x30ffa78>
 588:	6e                   	outs   dx,BYTE PTR ds:[esi]
 589:	61                   	popa   
 58a:	72 67                	jb     5f3 <cmdClearScreen-0x30ffa0d>
 58c:	76 00                	jbe    58e <cmdClearScreen-0x30ffa72>
 58e:	68 61 6e 64 6c       	push   0x6c646e61
 593:	65                   	gs
 594:	53                   	push   ebx
 595:	69 67 6e 61 6c 73 00 	imul   esp,DWORD PTR [edi+0x6e],0x736c61
 59c:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 59f:	4c                   	dec    esp
 5a0:	69 6e 65 00 63 6f 6d 	imul   ebp,DWORD PTR [esi+0x65],0x6d6f6300
 5a7:	6d                   	ins    DWORD PTR es:[edi],dx
 5a8:	61                   	popa   
 5a9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5aa:	64 00 66 69          	add    BYTE PTR fs:[esi+0x69],ah
 5ae:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5af:	64                   	fs
 5b0:	43                   	inc    ebx
 5b1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5b2:	6d                   	ins    DWORD PTR es:[edi],dx
 5b3:	6d                   	ins    DWORD PTR es:[edi],dx
 5b4:	61                   	popa   
 5b5:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5b6:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 5ba:	70 79                	jo     635 <cmdClearScreen-0x30ff9cb>
 5bc:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 5bf:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 5c2:	73 65                	jae    629 <cmdClearScreen-0x30ff9d7>
 5c4:	74 52                	je     618 <cmdClearScreen-0x30ff9e8>
 5c6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5c7:	77 00                	ja     5c9 <cmdClearScreen-0x30ffa37>
 5c9:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 5cc:	6d                   	ins    DWORD PTR es:[edi],dx
 5cd:	61                   	popa   
 5ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5cf:	64                   	fs
 5d0:	57                   	push   edi
 5d1:	61                   	popa   
 5d2:	73 46                	jae    61a <cmdClearScreen-0x30ff9e6>
 5d4:	72 6f                	jb     645 <cmdClearScreen-0x30ff9bb>
 5d6:	6d                   	ins    DWORD PTR es:[edi],dx
 5d7:	54                   	push   esp
 5d8:	68 69 73 42 75       	push   0x75427369
 5dd:	66                   	data16
 5de:	66                   	data16
 5df:	65                   	gs
 5e0:	72 50                	jb     632 <cmdClearScreen-0x30ff9ce>
 5e2:	74 72                	je     656 <cmdClearScreen-0x30ff9aa>
 5e4:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 5e7:	74 41                	je     62a <cmdClearScreen-0x30ff9d6>
 5e9:	4b                   	dec    ebx
 5ea:	65                   	gs
 5eb:	79 00                	jns    5ed <cmdClearScreen-0x30ffa13>

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
