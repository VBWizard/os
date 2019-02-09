
Debug/GNU-Linux/kshell:     file format elf32-i386


Disassembly of section .text:

03100000 <cmdClearScreen>:
cmdClearScreen():
/home/yogi/src/os/aproj/kshell/src/commands.c:13
#include "kshell.h"

int execPipes[2];

void cmdClearScreen()
{
 3100000:	55                   	push   ebp
 3100001:	89 e5                	mov    ebp,esp
 3100003:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:14
    printf("\033[2J");
 3100006:	83 ec 0c             	sub    esp,0xc
 3100009:	68 b5 19 10 03       	push   0x31019b5
 310000e:	e8 8d 16 00 00       	call   31016a0 <kShell+0x478>
 3100013:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:15
}
 3100016:	90                   	nop
 3100017:	c9                   	leave  
 3100018:	c3                   	ret    

03100019 <cmdPrintEnv>:
cmdPrintEnv():
/home/yogi/src/os/aproj/kshell/src/commands.c:18

void cmdPrintEnv()
{
 3100019:	55                   	push   ebp
 310001a:	89 e5                	mov    ebp,esp
 310001c:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:19
    for (int cnt=0;cnt<100;cnt++)
 310001f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100026:	eb 37                	jmp    310005f <cmdPrintEnv+0x46>
/home/yogi/src/os/aproj/kshell/src/commands.c:21
    {
        if (environmentLoc[cnt]!=0)
 3100028:	a1 0c 2a 10 03       	mov    eax,ds:0x3102a0c
 310002d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100030:	c1 e2 02             	shl    edx,0x2
 3100033:	01 d0                	add    eax,edx
 3100035:	8b 00                	mov    eax,DWORD PTR [eax]
 3100037:	85 c0                	test   eax,eax
 3100039:	74 20                	je     310005b <cmdPrintEnv+0x42>
/home/yogi/src/os/aproj/kshell/src/commands.c:23
        {
            print("%s\n",environmentLoc[cnt]);
 310003b:	a1 0c 2a 10 03       	mov    eax,ds:0x3102a0c
 3100040:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100043:	c1 e2 02             	shl    edx,0x2
 3100046:	01 d0                	add    eax,edx
 3100048:	8b 00                	mov    eax,DWORD PTR [eax]
 310004a:	83 ec 08             	sub    esp,0x8
 310004d:	50                   	push   eax
 310004e:	68 ba 19 10 03       	push   0x31019ba
 3100053:	e8 38 16 00 00       	call   3101690 <kShell+0x468>
 3100058:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:19 (discriminator 2)
    printf("\033[2J");
}

void cmdPrintEnv()
{
    for (int cnt=0;cnt<100;cnt++)
 310005b:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:19 (discriminator 1)
 310005f:	83 7d f4 63          	cmp    DWORD PTR [ebp-0xc],0x63
 3100063:	7e c3                	jle    3100028 <cmdPrintEnv+0xf>
/home/yogi/src/os/aproj/kshell/src/commands.c:27
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
/home/yogi/src/os/aproj/kshell/src/commands.c:30

void cmdSetEnv(char* cmdline)
{
 3100068:	55                   	push   ebp
 3100069:	89 e5                	mov    ebp,esp
 310006b:	81 ec 28 05 00 00    	sub    esp,0x528
/home/yogi/src/os/aproj/kshell/src/commands.c:34
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    char *varName, *varValue;
    
    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 3100071:	83 ec 04             	sub    esp,0x4
 3100074:	68 00 05 00 00       	push   0x500
 3100079:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 310007f:	50                   	push   eax
 3100080:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100083:	e8 14 0b 00 00       	call   3100b9c <parseParamsShell>
 3100088:	83 c4 10             	add    esp,0x10
 310008b:	85 c0                	test   eax,eax
 310008d:	0f 84 2b 01 00 00    	je     31001be <cmdSetEnv+0x156>
/home/yogi/src/os/aproj/kshell/src/commands.c:36
    {
        int nameLen=0, valueLen=0;
 3100093:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310009a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:37
        int found=(uintptr_t)strstr(params[0],"=");
 31000a1:	83 ec 08             	sub    esp,0x8
 31000a4:	68 be 19 10 03       	push   0x31019be
 31000a9:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000af:	50                   	push   eax
 31000b0:	e8 ab 16 00 00       	call   3101760 <kShell+0x538>
 31000b5:	83 c4 10             	add    esp,0x10
 31000b8:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:38
        if (found==0)
 31000bb:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31000bf:	75 15                	jne    31000d6 <cmdSetEnv+0x6e>
/home/yogi/src/os/aproj/kshell/src/commands.c:40
        {
            print("Usage: set variable=value\n");
 31000c1:	83 ec 0c             	sub    esp,0xc
 31000c4:	68 c0 19 10 03       	push   0x31019c0
 31000c9:	e8 c2 15 00 00       	call   3101690 <kShell+0x468>
 31000ce:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:41
            return;
 31000d1:	e9 ed 00 00 00       	jmp    31001c3 <cmdSetEnv+0x15b>
/home/yogi/src/os/aproj/kshell/src/commands.c:43
        }
        nameLen=found-(uintptr_t)params[0];
 31000d6:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 31000d9:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000df:	29 c2                	sub    edx,eax
 31000e1:	89 d0                	mov    eax,edx
 31000e3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:44
        valueLen=strlen(params[0])-nameLen-1;
 31000e6:	83 ec 0c             	sub    esp,0xc
 31000e9:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000ef:	50                   	push   eax
 31000f0:	e8 5b 17 00 00       	call   3101850 <kShell+0x628>
 31000f5:	83 c4 10             	add    esp,0x10
 31000f8:	89 c2                	mov    edx,eax
 31000fa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31000fd:	29 c2                	sub    edx,eax
 31000ff:	89 d0                	mov    eax,edx
 3100101:	83 e8 01             	sub    eax,0x1
 3100104:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:45
        varName = malloc(nameLen+1);
 3100107:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310010a:	83 c0 01             	add    eax,0x1
 310010d:	83 ec 0c             	sub    esp,0xc
 3100110:	50                   	push   eax
 3100111:	e8 ca 15 00 00       	call   31016e0 <kShell+0x4b8>
 3100116:	83 c4 10             	add    esp,0x10
 3100119:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:46
        varValue = malloc(valueLen);
 310011c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310011f:	83 ec 0c             	sub    esp,0xc
 3100122:	50                   	push   eax
 3100123:	e8 b8 15 00 00       	call   31016e0 <kShell+0x4b8>
 3100128:	83 c4 10             	add    esp,0x10
 310012b:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:47
        strncpy(varName,params[0],nameLen);
 310012e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100131:	83 ec 04             	sub    esp,0x4
 3100134:	50                   	push   eax
 3100135:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 310013b:	50                   	push   eax
 310013c:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 310013f:	e8 4c 16 00 00       	call   3101790 <kShell+0x568>
 3100144:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:48
        varName[nameLen]=0;
 3100147:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 310014a:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 310014d:	01 d0                	add    eax,edx
 310014f:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:49
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
 310016b:	e8 20 16 00 00       	call   3101790 <kShell+0x568>
 3100170:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:50
        strtrim(varName);
 3100173:	83 ec 0c             	sub    esp,0xc
 3100176:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100179:	e8 62 16 00 00       	call   31017e0 <kShell+0x5b8>
 310017e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:51
        strtrim(varValue);
 3100181:	83 ec 0c             	sub    esp,0xc
 3100184:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100187:	e8 54 16 00 00       	call   31017e0 <kShell+0x5b8>
 310018c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:52
        setenv(varName, varValue);
 310018f:	83 ec 08             	sub    esp,0x8
 3100192:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100195:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100198:	e8 03 16 00 00       	call   31017a0 <kShell+0x578>
 310019d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:53
        free(varName);
 31001a0:	83 ec 0c             	sub    esp,0xc
 31001a3:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31001a6:	e8 c5 16 00 00       	call   3101870 <kShell+0x648>
 31001ab:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:54
        free(varValue);
 31001ae:	83 ec 0c             	sub    esp,0xc
 31001b1:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31001b4:	e8 b7 16 00 00       	call   3101870 <kShell+0x648>
 31001b9:	83 c4 10             	add    esp,0x10
 31001bc:	eb 05                	jmp    31001c3 <cmdSetEnv+0x15b>
/home/yogi/src/os/aproj/kshell/src/commands.c:57
    }
    else
        cmdPrintEnv();
 31001be:	e8 56 fe ff ff       	call   3100019 <cmdPrintEnv>
/home/yogi/src/os/aproj/kshell/src/commands.c:58
}
 31001c3:	c9                   	leave  
 31001c4:	c3                   	ret    

031001c5 <kexec2>:
kexec2():
/home/yogi/src/os/aproj/kshell/src/commands.c:61

int kexec2(char* path, int argc, char** argv, bool background)
{
 31001c5:	55                   	push   ebp
 31001c6:	89 e5                	mov    ebp,esp
 31001c8:	83 ec 28             	sub    esp,0x28
 31001cb:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 31001ce:	88 45 e4             	mov    BYTE PTR [ebp-0x1c],al
/home/yogi/src/os/aproj/kshell/src/commands.c:62
    int pid=execa(path,argc,argv);
 31001d1:	83 ec 04             	sub    esp,0x4
 31001d4:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 31001d7:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31001da:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31001dd:	e8 7e 16 00 00       	call   3101860 <kShell+0x638>
 31001e2:	83 c4 10             	add    esp,0x10
 31001e5:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:64

    if (pid>0)
 31001e8:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31001ec:	7e 4c                	jle    310023a <kexec2+0x75>
/home/yogi/src/os/aproj/kshell/src/commands.c:66
    {
        if (!background)
 31001ee:	0f b6 45 e4          	movzx  eax,BYTE PTR [ebp-0x1c]
 31001f2:	83 f0 01             	xor    eax,0x1
 31001f5:	84 c0                	test   al,al
 31001f7:	74 54                	je     310024d <kexec2+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:69
        {
            //print("DEBUG1: waitpid = %08X\n",&waitpid);
            lastExecExitCode = waitpid(pid);
 31001f9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001fc:	83 ec 0c             	sub    esp,0xc
 31001ff:	50                   	push   eax
 3100200:	e8 7b 14 00 00       	call   3101680 <kShell+0x458>
 3100205:	83 c4 10             	add    esp,0x10
 3100208:	a3 68 2d 10 03       	mov    ds:0x3102d68,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:71
            char ret[10];
            itoa(lastExecExitCode,ret);
 310020d:	a1 68 2d 10 03       	mov    eax,ds:0x3102d68
 3100212:	89 c2                	mov    edx,eax
 3100214:	83 ec 08             	sub    esp,0x8
 3100217:	8d 45 ea             	lea    eax,[ebp-0x16]
 310021a:	50                   	push   eax
 310021b:	52                   	push   edx
 310021c:	e8 ff 14 00 00       	call   3101720 <kShell+0x4f8>
 3100221:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:72
            setenv("LASTEXIT",ret);
 3100224:	83 ec 08             	sub    esp,0x8
 3100227:	8d 45 ea             	lea    eax,[ebp-0x16]
 310022a:	50                   	push   eax
 310022b:	68 db 19 10 03       	push   0x31019db
 3100230:	e8 6b 15 00 00       	call   31017a0 <kShell+0x578>
 3100235:	83 c4 10             	add    esp,0x10
 3100238:	eb 13                	jmp    310024d <kexec2+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:76
        }
    }
    else
        print("Error executing %s\n",path);
 310023a:	83 ec 08             	sub    esp,0x8
 310023d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100240:	68 e4 19 10 03       	push   0x31019e4
 3100245:	e8 46 14 00 00       	call   3101690 <kShell+0x468>
 310024a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:78

}
 310024d:	90                   	nop
 310024e:	c9                   	leave  
 310024f:	c3                   	ret    

03100250 <kexec>:
kexec():
/home/yogi/src/os/aproj/kshell/src/commands.c:81

int kexec(char* cmdline, int stdinpipe, int stdoutpipe, int stderrpipe)
{
 3100250:	55                   	push   ebp
 3100251:	89 e5                	mov    ebp,esp
 3100253:	57                   	push   edi
 3100254:	81 ec 54 06 00 00    	sub    esp,0x654
/home/yogi/src/os/aproj/kshell/src/commands.c:82
    bool background=false;
 310025a:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:83
    int forkPid=0;
 310025e:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:85
    char* tok;
    char* pgm=NULL;
 3100265:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:86
    char fileToExec[256] = "/\0";
 310026c:	0f b7 05 88 1a 10 03 	movzx  eax,WORD PTR ds:0x3101a88
 3100273:	66 89 85 c8 fe ff ff 	mov    WORD PTR [ebp-0x138],ax
 310027a:	0f b6 05 8a 1a 10 03 	movzx  eax,BYTE PTR ds:0x3101a8a
 3100281:	88 85 ca fe ff ff    	mov    BYTE PTR [ebp-0x136],al
 3100287:	8d 95 cb fe ff ff    	lea    edx,[ebp-0x135]
 310028d:	b8 00 00 00 00       	mov    eax,0x0
 3100292:	88 02                	mov    BYTE PTR [edx],al
 3100294:	83 c2 01             	add    edx,0x1
 3100297:	b9 3f 00 00 00       	mov    ecx,0x3f
 310029c:	89 d7                	mov    edi,edx
 310029e:	f3 ab                	rep stos DWORD PTR es:[edi],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:90

    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];  //strangely, if I remove this variable I get a SEGV at 0x009B:0x7000e0bf for 0x00000023
    char *stdinRedir, *stdoutRedir;
    char *stdinfile=NULL, *stdoutfile=NULL, *stderrfile=NULL;
 31002a0:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 31002a7:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 31002ae:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:91
    int argc = 0;
 31002b5:	c7 85 c4 f9 ff ff 00 	mov    DWORD PTR [ebp-0x63c],0x0
 31002bc:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:95
    char **argv;
    
    //look for < and > redirects so that we can strip them from the command line and use them to redirect stdin/stdout
    stdinRedir = strstr(cmdline,"<");
 31002bf:	83 ec 08             	sub    esp,0x8
 31002c2:	68 f8 19 10 03       	push   0x31019f8
 31002c7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31002ca:	e8 91 14 00 00       	call   3101760 <kShell+0x538>
 31002cf:	83 c4 10             	add    esp,0x10
 31002d2:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:96
    if (stdinRedir)
 31002d5:	83 7d d0 00          	cmp    DWORD PTR [ebp-0x30],0x0
 31002d9:	0f 84 a6 00 00 00    	je     3100385 <kexec+0x135>
/home/yogi/src/os/aproj/kshell/src/commands.c:98
    {
        stdinfile = malloc(256);
 31002df:	83 ec 0c             	sub    esp,0xc
 31002e2:	68 00 01 00 00       	push   0x100
 31002e7:	e8 f4 13 00 00       	call   31016e0 <kShell+0x4b8>
 31002ec:	83 c4 10             	add    esp,0x10
 31002ef:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:99
        char *start = strstr(stdinRedir," ")+1;
 31002f2:	83 ec 08             	sub    esp,0x8
 31002f5:	68 fa 19 10 03       	push   0x31019fa
 31002fa:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 31002fd:	e8 5e 14 00 00       	call   3101760 <kShell+0x538>
 3100302:	83 c4 10             	add    esp,0x10
 3100305:	83 c0 01             	add    eax,0x1
 3100308:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:100
        if (!start)
 310030b:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310030f:	75 06                	jne    3100317 <kexec+0xc7>
/home/yogi/src/os/aproj/kshell/src/commands.c:101
            start=stdinRedir;
 3100311:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100314:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:102
        char *end = strstr(start," ");
 3100317:	83 ec 08             	sub    esp,0x8
 310031a:	68 fa 19 10 03       	push   0x31019fa
 310031f:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100322:	e8 39 14 00 00       	call   3101760 <kShell+0x538>
 3100327:	83 c4 10             	add    esp,0x10
 310032a:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:103
        if (!end)
 310032d:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100331:	75 16                	jne    3100349 <kexec+0xf9>
/home/yogi/src/os/aproj/kshell/src/commands.c:104
            end = strstr(start,"\n");
 3100333:	83 ec 08             	sub    esp,0x8
 3100336:	68 fc 19 10 03       	push   0x31019fc
 310033b:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310033e:	e8 1d 14 00 00       	call   3101760 <kShell+0x538>
 3100343:	83 c4 10             	add    esp,0x10
 3100346:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:105
        if (end)
 3100349:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 310034d:	74 1e                	je     310036d <kexec+0x11d>
/home/yogi/src/os/aproj/kshell/src/commands.c:106
            strncpy(stdinfile,start,end-start);
 310034f:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
 3100352:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100355:	29 c2                	sub    edx,eax
 3100357:	89 d0                	mov    eax,edx
 3100359:	83 ec 04             	sub    esp,0x4
 310035c:	50                   	push   eax
 310035d:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100360:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100363:	e8 28 14 00 00       	call   3101790 <kShell+0x568>
 3100368:	83 c4 10             	add    esp,0x10
 310036b:	eb 11                	jmp    310037e <kexec+0x12e>
/home/yogi/src/os/aproj/kshell/src/commands.c:108
        else
            strcpy(stdinfile, start);
 310036d:	83 ec 08             	sub    esp,0x8
 3100370:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100373:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100376:	e8 f5 12 00 00       	call   3101670 <kShell+0x448>
 310037b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:109
        stdinRedir='\0';
 310037e:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:112
    }
    
    argv = cmdlineToArgv(cmdline, &argc);
 3100385:	83 ec 08             	sub    esp,0x8
 3100388:	8d 85 c4 f9 ff ff    	lea    eax,[ebp-0x63c]
 310038e:	50                   	push   eax
 310038f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100392:	e8 69 13 00 00       	call   3101700 <kShell+0x4d8>
 3100397:	83 c4 10             	add    esp,0x10
 310039a:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:114

    if (argc==0)
 310039d:	8b 85 c4 f9 ff ff    	mov    eax,DWORD PTR [ebp-0x63c]
 31003a3:	85 c0                	test   eax,eax
 31003a5:	75 0a                	jne    31003b1 <kexec+0x161>
/home/yogi/src/os/aproj/kshell/src/commands.c:115
        return -3;
 31003a7:	b8 fd ff ff ff       	mov    eax,0xfffffffd
 31003ac:	e9 7c 02 00 00       	jmp    310062d <kexec+0x3dd>
/home/yogi/src/os/aproj/kshell/src/commands.c:117

    if (argc<1)
 31003b1:	8b 85 c4 f9 ff ff    	mov    eax,DWORD PTR [ebp-0x63c]
 31003b7:	85 c0                	test   eax,eax
 31003b9:	7f 1a                	jg     31003d5 <kexec+0x185>
/home/yogi/src/os/aproj/kshell/src/commands.c:119
    {
        printf("kexec: Invalid command\n");
 31003bb:	83 ec 0c             	sub    esp,0xc
 31003be:	68 fe 19 10 03       	push   0x31019fe
 31003c3:	e8 d8 12 00 00       	call   31016a0 <kShell+0x478>
 31003c8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:120
        return -5;
 31003cb:	b8 fb ff ff ff       	mov    eax,0xfffffffb
 31003d0:	e9 58 02 00 00       	jmp    310062d <kexec+0x3dd>
/home/yogi/src/os/aproj/kshell/src/commands.c:124
    }


    if (argv[0][0]=='/')
 31003d5:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 31003d8:	8b 00                	mov    eax,DWORD PTR [eax]
 31003da:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003dd:	3c 2f                	cmp    al,0x2f
 31003df:	75 1a                	jne    31003fb <kexec+0x1ab>
/home/yogi/src/os/aproj/kshell/src/commands.c:125
        strcpy(fileToExec,argv[0]);
 31003e1:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 31003e4:	8b 00                	mov    eax,DWORD PTR [eax]
 31003e6:	83 ec 08             	sub    esp,0x8
 31003e9:	50                   	push   eax
 31003ea:	8d 85 c8 fe ff ff    	lea    eax,[ebp-0x138]
 31003f0:	50                   	push   eax
 31003f1:	e8 7a 12 00 00       	call   3101670 <kShell+0x448>
 31003f6:	83 c4 10             	add    esp,0x10
 31003f9:	eb 18                	jmp    3100413 <kexec+0x1c3>
/home/yogi/src/os/aproj/kshell/src/commands.c:127
    else
        strcat(fileToExec,argv[0]);
 31003fb:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 31003fe:	8b 00                	mov    eax,DWORD PTR [eax]
 3100400:	83 ec 08             	sub    esp,0x8
 3100403:	50                   	push   eax
 3100404:	8d 85 c8 fe ff ff    	lea    eax,[ebp-0x138]
 310040a:	50                   	push   eax
 310040b:	e8 20 13 00 00       	call   3101730 <kShell+0x508>
 3100410:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:130

    fstat_t fstat;
    if (stat(argv[0],&fstat)) //stat returns 0 if successful
 3100413:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 3100416:	8b 00                	mov    eax,DWORD PTR [eax]
 3100418:	83 ec 08             	sub    esp,0x8
 310041b:	8d 95 bc f9 ff ff    	lea    edx,[ebp-0x644]
 3100421:	52                   	push   edx
 3100422:	50                   	push   eax
 3100423:	e8 e8 13 00 00       	call   3101810 <kShell+0x5e8>
 3100428:	83 c4 10             	add    esp,0x10
 310042b:	85 c0                	test   eax,eax
 310042d:	74 20                	je     310044f <kexec+0x1ff>
/home/yogi/src/os/aproj/kshell/src/commands.c:132
    {
        printf("invalid path or filename%s\n",argv[0]);
 310042f:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 3100432:	8b 00                	mov    eax,DWORD PTR [eax]
 3100434:	83 ec 08             	sub    esp,0x8
 3100437:	50                   	push   eax
 3100438:	68 16 1a 10 03       	push   0x3101a16
 310043d:	e8 5e 12 00 00       	call   31016a0 <kShell+0x478>
 3100442:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:133
        return -4;
 3100445:	b8 fc ff ff ff       	mov    eax,0xfffffffc
 310044a:	e9 de 01 00 00       	jmp    310062d <kexec+0x3dd>
/home/yogi/src/os/aproj/kshell/src/commands.c:136
    }
    
    if (*argv[argc-1]=='&')
 310044f:	8b 85 c4 f9 ff ff    	mov    eax,DWORD PTR [ebp-0x63c]
 3100455:	05 ff ff ff 3f       	add    eax,0x3fffffff
 310045a:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100461:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 3100464:	01 d0                	add    eax,edx
 3100466:	8b 00                	mov    eax,DWORD PTR [eax]
 3100468:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310046b:	3c 26                	cmp    al,0x26
 310046d:	75 04                	jne    3100473 <kexec+0x223>
/home/yogi/src/os/aproj/kshell/src/commands.c:137
        background=true;
 310046f:	c6 45 f7 01          	mov    BYTE PTR [ebp-0x9],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:139
    
    forkPid = fork();
 3100473:	e8 48 13 00 00       	call   31017c0 <kShell+0x598>
 3100478:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:141
    
    if (forkPid == 0)
 310047b:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 310047f:	0f 85 c3 00 00 00    	jne    3100548 <kexec+0x2f8>
/home/yogi/src/os/aproj/kshell/src/commands.c:146
    {
        int retVal;
        
        //CLR 02/05/2019: Redirect standard input/output/err from/to a file (i.e. < and >)
        if (stdinfile!=NULL)
 3100485:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100489:	74 34                	je     31004bf <kexec+0x26f>
/home/yogi/src/os/aproj/kshell/src/commands.c:147
            if (freopen(stdinfile, "r",(void*)STDIN_FILE)==(void*)-1)
 310048b:	83 ec 04             	sub    esp,0x4
 310048e:	6a 00                	push   0x0
 3100490:	68 32 1a 10 03       	push   0x3101a32
 3100495:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100498:	e8 83 13 00 00       	call   3101820 <kShell+0x5f8>
 310049d:	83 c4 10             	add    esp,0x10
 31004a0:	83 f8 ff             	cmp    eax,0xffffffff
 31004a3:	75 1a                	jne    31004bf <kexec+0x26f>
/home/yogi/src/os/aproj/kshell/src/commands.c:149
            {
                printf("Redirect of input failed, cannot continue\n");
 31004a5:	83 ec 0c             	sub    esp,0xc
 31004a8:	68 34 1a 10 03       	push   0x3101a34
 31004ad:	e8 ee 11 00 00       	call   31016a0 <kShell+0x478>
 31004b2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:150
                return -3;
 31004b5:	b8 fd ff ff ff       	mov    eax,0xfffffffd
 31004ba:	e9 6e 01 00 00       	jmp    310062d <kexec+0x3dd>
/home/yogi/src/os/aproj/kshell/src/commands.c:152
            }
        if (stdoutfile!=NULL)
 31004bf:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 31004c3:	74 15                	je     31004da <kexec+0x28a>
/home/yogi/src/os/aproj/kshell/src/commands.c:153
            freopen(stdoutfile,"w",(void*)STDOUT_FILE);
 31004c5:	83 ec 04             	sub    esp,0x4
 31004c8:	6a 01                	push   0x1
 31004ca:	68 5f 1a 10 03       	push   0x3101a5f
 31004cf:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31004d2:	e8 49 13 00 00       	call   3101820 <kShell+0x5f8>
 31004d7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:154
        if (stderrfile!=NULL)
 31004da:	83 7d d4 00          	cmp    DWORD PTR [ebp-0x2c],0x0
 31004de:	74 15                	je     31004f5 <kexec+0x2a5>
/home/yogi/src/os/aproj/kshell/src/commands.c:155
            freopen(stderrfile,"w",(void*)STDERR_FILE);
 31004e0:	83 ec 04             	sub    esp,0x4
 31004e3:	6a 02                	push   0x2
 31004e5:	68 5f 1a 10 03       	push   0x3101a5f
 31004ea:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 31004ed:	e8 2e 13 00 00       	call   3101820 <kShell+0x5f8>
 31004f2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:156
        int childPid = exec(fileToExec, argc, argv);
 31004f5:	8b 85 c4 f9 ff ff    	mov    eax,DWORD PTR [ebp-0x63c]
 31004fb:	83 ec 04             	sub    esp,0x4
 31004fe:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 3100501:	50                   	push   eax
 3100502:	8d 85 c8 fe ff ff    	lea    eax,[ebp-0x138]
 3100508:	50                   	push   eax
 3100509:	e8 42 12 00 00       	call   3101750 <kShell+0x528>
 310050e:	83 c4 10             	add    esp,0x10
 3100511:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:158
        
        if (childPid > 0)
 3100514:	83 7d c8 00          	cmp    DWORD PTR [ebp-0x38],0x0
 3100518:	7e 14                	jle    310052e <kexec+0x2de>
/home/yogi/src/os/aproj/kshell/src/commands.c:160
        {
            retVal = waitpid(childPid);
 310051a:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 310051d:	83 ec 0c             	sub    esp,0xc
 3100520:	50                   	push   eax
 3100521:	e8 5a 11 00 00       	call   3101680 <kShell+0x458>
 3100526:	83 c4 10             	add    esp,0x10
 3100529:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 310052c:	eb 07                	jmp    3100535 <kexec+0x2e5>
/home/yogi/src/os/aproj/kshell/src/commands.c:163
        }
        else
            retVal = 0xBADBADBA;
 310052e:	c7 45 e4 ba ad db ba 	mov    DWORD PTR [ebp-0x1c],0xbadbadba
/home/yogi/src/os/aproj/kshell/src/commands.c:164
        exit(retVal);
 3100535:	83 ec 0c             	sub    esp,0xc
 3100538:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 310053b:	e8 f0 12 00 00       	call   3101830 <kShell+0x608>
 3100540:	83 c4 10             	add    esp,0x10
 3100543:	e9 8d 00 00 00       	jmp    31005d5 <kexec+0x385>
/home/yogi/src/os/aproj/kshell/src/commands.c:166
    }
    else if (forkPid < 0)
 3100548:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 310054c:	79 15                	jns    3100563 <kexec+0x313>
/home/yogi/src/os/aproj/kshell/src/commands.c:167
        print("Fork error %u", forkPid);
 310054e:	83 ec 08             	sub    esp,0x8
 3100551:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 3100554:	68 61 1a 10 03       	push   0x3101a61
 3100559:	e8 32 11 00 00       	call   3101690 <kShell+0x468>
 310055e:	83 c4 10             	add    esp,0x10
 3100561:	eb 72                	jmp    31005d5 <kexec+0x385>
/home/yogi/src/os/aproj/kshell/src/commands.c:170
    else
    {
        if (!background)
 3100563:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 3100567:	83 f0 01             	xor    eax,0x1
 310056a:	84 c0                	test   al,al
 310056c:	74 36                	je     31005a4 <kexec+0x354>
/home/yogi/src/os/aproj/kshell/src/commands.c:172
        {
            lastExecExitCode = waitpid(forkPid);
 310056e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100571:	83 ec 0c             	sub    esp,0xc
 3100574:	50                   	push   eax
 3100575:	e8 06 11 00 00       	call   3101680 <kShell+0x458>
 310057a:	83 c4 10             	add    esp,0x10
 310057d:	a3 68 2d 10 03       	mov    ds:0x3102d68,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:173
            if (lastExecExitCode == 0xBADBADBA)
 3100582:	a1 68 2d 10 03       	mov    eax,ds:0x3102d68
 3100587:	3d ba ad db ba       	cmp    eax,0xbadbadba
 310058c:	75 16                	jne    31005a4 <kexec+0x354>
/home/yogi/src/os/aproj/kshell/src/commands.c:174
                print("exec: Cannot execute %s\n",argv[0]);
 310058e:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 3100591:	8b 00                	mov    eax,DWORD PTR [eax]
 3100593:	83 ec 08             	sub    esp,0x8
 3100596:	50                   	push   eax
 3100597:	68 6f 1a 10 03       	push   0x3101a6f
 310059c:	e8 ef 10 00 00       	call   3101690 <kShell+0x468>
 31005a1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:177
        }
        char ret[10];
        itoa(lastExecExitCode,ret);
 31005a4:	a1 68 2d 10 03       	mov    eax,ds:0x3102d68
 31005a9:	89 c2                	mov    edx,eax
 31005ab:	83 ec 08             	sub    esp,0x8
 31005ae:	8d 85 b2 f9 ff ff    	lea    eax,[ebp-0x64e]
 31005b4:	50                   	push   eax
 31005b5:	52                   	push   edx
 31005b6:	e8 65 11 00 00       	call   3101720 <kShell+0x4f8>
 31005bb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:178
        setenv("LASTEXIT",ret);    
 31005be:	83 ec 08             	sub    esp,0x8
 31005c1:	8d 85 b2 f9 ff ff    	lea    eax,[ebp-0x64e]
 31005c7:	50                   	push   eax
 31005c8:	68 db 19 10 03       	push   0x31019db
 31005cd:	e8 ce 11 00 00       	call   31017a0 <kShell+0x578>
 31005d2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:181
    }
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    free(argv);
 31005d5:	83 ec 0c             	sub    esp,0xc
 31005d8:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 31005db:	e8 90 12 00 00       	call   3101870 <kShell+0x648>
 31005e0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:182
    free(pgm);
 31005e3:	83 ec 0c             	sub    esp,0xc
 31005e6:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 31005e9:	e8 82 12 00 00       	call   3101870 <kShell+0x648>
 31005ee:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:183
    if (stdinfile)
 31005f1:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31005f5:	74 0e                	je     3100605 <kexec+0x3b5>
/home/yogi/src/os/aproj/kshell/src/commands.c:184
        free(stdinfile);
 31005f7:	83 ec 0c             	sub    esp,0xc
 31005fa:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005fd:	e8 6e 12 00 00       	call   3101870 <kShell+0x648>
 3100602:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:185
    if (stdoutfile)
 3100605:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 3100609:	74 0e                	je     3100619 <kexec+0x3c9>
/home/yogi/src/os/aproj/kshell/src/commands.c:186
        free(stdoutfile);
 310060b:	83 ec 0c             	sub    esp,0xc
 310060e:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 3100611:	e8 5a 12 00 00       	call   3101870 <kShell+0x648>
 3100616:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:187
    if (stderrfile)
 3100619:	83 7d d4 00          	cmp    DWORD PTR [ebp-0x2c],0x0
 310061d:	74 0e                	je     310062d <kexec+0x3dd>
/home/yogi/src/os/aproj/kshell/src/commands.c:188
        free(stderrfile);
 310061f:	83 ec 0c             	sub    esp,0xc
 3100622:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100625:	e8 46 12 00 00       	call   3101870 <kShell+0x648>
 310062a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:190
    
}
 310062d:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 3100630:	c9                   	leave  
 3100631:	c3                   	ret    

03100632 <cmdTime>:
cmdTime():
/home/yogi/src/os/aproj/kshell/src/commands.c:193

void cmdTime(char* cmdline)
{
 3100632:	55                   	push   ebp
 3100633:	89 e5                	mov    ebp,esp
 3100635:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:196
    uint32_t startTicks, endTicks;
    
    startTicks=getticks();
 3100638:	e8 03 11 00 00       	call   3101740 <kShell+0x518>
 310063d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:197
    execInternalCommand(cmdline);
 3100640:	83 ec 0c             	sub    esp,0xc
 3100643:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100646:	e8 9d 04 00 00       	call   3100ae8 <execInternalCommand>
 310064b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:198
    endTicks=getticks();
 310064e:	e8 ed 10 00 00       	call   3101740 <kShell+0x518>
 3100653:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:199
    print("\n%u ticks\n",endTicks-startTicks);
 3100656:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100659:	2b 45 f4             	sub    eax,DWORD PTR [ebp-0xc]
 310065c:	83 ec 08             	sub    esp,0x8
 310065f:	50                   	push   eax
 3100660:	68 88 1b 10 03       	push   0x3101b88
 3100665:	e8 26 10 00 00       	call   3101690 <kShell+0x468>
 310066a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:201
    
}
 310066d:	90                   	nop
 310066e:	c9                   	leave  
 310066f:	c3                   	ret    

03100670 <cmdRepeat>:
cmdRepeat():
/home/yogi/src/os/aproj/kshell/src/commands.c:204

void cmdRepeat(char * cmdline)
{
 3100670:	55                   	push   ebp
 3100671:	89 e5                	mov    ebp,esp
 3100673:	83 ec 28             	sub    esp,0x28
/home/yogi/src/os/aproj/kshell/src/commands.c:205
    int argc = 0;
 3100676:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:207
    char **argv;
    int count = 0;
 310067d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:208
    char *newCmdLine=cmdline;
 3100684:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100687:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:209
    argv = cmdlineToArgv(cmdline, &argc);
 310068a:	83 ec 08             	sub    esp,0x8
 310068d:	8d 45 e4             	lea    eax,[ebp-0x1c]
 3100690:	50                   	push   eax
 3100691:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100694:	e8 67 10 00 00       	call   3101700 <kShell+0x4d8>
 3100699:	83 c4 10             	add    esp,0x10
 310069c:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:211
    
    count = atoi(argv[0]);
 310069f:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 31006a2:	8b 00                	mov    eax,DWORD PTR [eax]
 31006a4:	83 ec 0c             	sub    esp,0xc
 31006a7:	50                   	push   eax
 31006a8:	e8 93 11 00 00       	call   3101840 <kShell+0x618>
 31006ad:	83 c4 10             	add    esp,0x10
 31006b0:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:213

    if (count >= 100)
 31006b3:	83 7d ec 63          	cmp    DWORD PTR [ebp-0x14],0x63
 31006b7:	7e 06                	jle    31006bf <cmdRepeat+0x4f>
/home/yogi/src/os/aproj/kshell/src/commands.c:214
        newCmdLine+=3;
 31006b9:	83 45 f4 03          	add    DWORD PTR [ebp-0xc],0x3
 31006bd:	eb 10                	jmp    31006cf <cmdRepeat+0x5f>
/home/yogi/src/os/aproj/kshell/src/commands.c:215
    else if (count >= 10)
 31006bf:	83 7d ec 09          	cmp    DWORD PTR [ebp-0x14],0x9
 31006c3:	7e 06                	jle    31006cb <cmdRepeat+0x5b>
/home/yogi/src/os/aproj/kshell/src/commands.c:216
        newCmdLine+=2;
 31006c5:	83 45 f4 02          	add    DWORD PTR [ebp-0xc],0x2
 31006c9:	eb 04                	jmp    31006cf <cmdRepeat+0x5f>
/home/yogi/src/os/aproj/kshell/src/commands.c:218
    else 
        newCmdLine+=1;
 31006cb:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:220
    
    for (int cnt=0;cnt<count;cnt++)
 31006cf:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 31006d6:	eb 51                	jmp    3100729 <cmdRepeat+0xb9>
/home/yogi/src/os/aproj/kshell/src/commands.c:222
    {
        printf("\n*************** REPEAT EXECUTION #%u of %u ***************\n",cnt+1,count);
 31006d8:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31006db:	83 c0 01             	add    eax,0x1
 31006de:	83 ec 04             	sub    esp,0x4
 31006e1:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 31006e4:	50                   	push   eax
 31006e5:	68 94 1b 10 03       	push   0x3101b94
 31006ea:	e8 b1 0f 00 00       	call   31016a0 <kShell+0x478>
 31006ef:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:223
        execInternalCommand(newCmdLine);
 31006f2:	83 ec 0c             	sub    esp,0xc
 31006f5:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 31006f8:	e8 eb 03 00 00       	call   3100ae8 <execInternalCommand>
 31006fd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:224
        if (bSigIntReceived)
 3100700:	0f b6 05 00 2a 10 03 	movzx  eax,BYTE PTR ds:0x3102a00
 3100707:	84 c0                	test   al,al
 3100709:	74 1a                	je     3100725 <cmdRepeat+0xb5>
/home/yogi/src/os/aproj/kshell/src/commands.c:226
        {
            if (processSignal(SIGINT)==SIGINT)
 310070b:	83 ec 0c             	sub    esp,0xc
 310070e:	6a 08                	push   0x8
 3100710:	e8 f3 0a 00 00       	call   3101208 <processSignal>
 3100715:	83 c4 10             	add    esp,0x10
 3100718:	83 f8 08             	cmp    eax,0x8
 310071b:	75 16                	jne    3100733 <cmdRepeat+0xc3>
/home/yogi/src/os/aproj/kshell/src/commands.c:227
                cnt=count;
 310071d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100720:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:228
            break;
 3100723:	eb 0e                	jmp    3100733 <cmdRepeat+0xc3>
/home/yogi/src/os/aproj/kshell/src/commands.c:220 (discriminator 2)
    else if (count >= 10)
        newCmdLine+=2;
    else 
        newCmdLine+=1;
    
    for (int cnt=0;cnt<count;cnt++)
 3100725:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:220 (discriminator 1)
 3100729:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310072c:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 310072f:	7c a7                	jl     31006d8 <cmdRepeat+0x68>
/home/yogi/src/os/aproj/kshell/src/commands.c:232
                cnt=count;
            break;
        }
    }
    
}
 3100731:	eb 01                	jmp    3100734 <cmdRepeat+0xc4>
/home/yogi/src/os/aproj/kshell/src/commands.c:228
        execInternalCommand(newCmdLine);
        if (bSigIntReceived)
        {
            if (processSignal(SIGINT)==SIGINT)
                cnt=count;
            break;
 3100733:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/commands.c:232 (discriminator 1)
        }
    }
    
}
 3100734:	90                   	nop
 3100735:	c9                   	leave  
 3100736:	c3                   	ret    

03100737 <cmdExecp>:
cmdExecp():
/home/yogi/src/os/aproj/kshell/src/commands.c:235

void cmdExecp(char* cmdline)
{
 3100737:	55                   	push   ebp
 3100738:	89 e5                	mov    ebp,esp
 310073a:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:236
    kexec(cmdline, STDIN_FILE, STDOUT_FILE, STDERR_FILE);
 310073d:	6a 02                	push   0x2
 310073f:	6a 01                	push   0x1
 3100741:	6a 00                	push   0x0
 3100743:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100746:	e8 05 fb ff ff       	call   3100250 <kexec>
 310074b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:237
}
 310074e:	90                   	nop
 310074f:	c9                   	leave  
 3100750:	c3                   	ret    

03100751 <cmdExit>:
cmdExit():
/home/yogi/src/os/aproj/kshell/src/commands.c:240

void cmdExit(char *cmdline)
{
 3100751:	55                   	push   ebp
 3100752:	89 e5                	mov    ebp,esp
 3100754:	81 ec 08 05 00 00    	sub    esp,0x508
/home/yogi/src/os/aproj/kshell/src/commands.c:243
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 310075a:	83 ec 04             	sub    esp,0x4
 310075d:	68 00 05 00 00       	push   0x500
 3100762:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 3100768:	50                   	push   eax
 3100769:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310076c:	e8 2b 04 00 00       	call   3100b9c <parseParamsShell>
 3100771:	83 c4 10             	add    esp,0x10
 3100774:	85 c0                	test   eax,eax
 3100776:	74 1d                	je     3100795 <cmdExit+0x44>
/home/yogi/src/os/aproj/kshell/src/commands.c:245
    {
        exitCode = strtoul(params[0],0,10);
 3100778:	83 ec 04             	sub    esp,0x4
 310077b:	6a 0a                	push   0xa
 310077d:	6a 00                	push   0x0
 310077f:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 3100785:	50                   	push   eax
 3100786:	e8 85 0f 00 00       	call   3101710 <kShell+0x4e8>
 310078b:	83 c4 10             	add    esp,0x10
 310078e:	a3 6c 2d 10 03       	mov    ds:0x3102d6c,eax
 3100793:	eb 0a                	jmp    310079f <cmdExit+0x4e>
/home/yogi/src/os/aproj/kshell/src/commands.c:248
    }
    else
        exitCode = 0;
 3100795:	c7 05 6c 2d 10 03 00 	mov    DWORD PTR ds:0x3102d6c,0x0
 310079c:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:249
    timeToExit=true;
 310079f:	c6 05 78 2d 10 03 01 	mov    BYTE PTR ds:0x3102d78,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:250
}
 31007a6:	90                   	nop
 31007a7:	c9                   	leave  
 31007a8:	c3                   	ret    

031007a9 <cmdHelp>:
cmdHelp():
/home/yogi/src/os/aproj/kshell/src/commands.c:253

void cmdHelp(char *cmdline)
{
 31007a9:	55                   	push   ebp
 31007aa:	89 e5                	mov    ebp,esp
 31007ac:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:256
    char* tok;
    
    tok=strtok(cmdline,delim);
 31007af:	83 ec 08             	sub    esp,0x8
 31007b2:	68 04 2a 10 03       	push   0x3102a04
 31007b7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31007ba:	e8 f1 0f 00 00       	call   31017b0 <kShell+0x588>
 31007bf:	83 c4 10             	add    esp,0x10
 31007c2:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:263
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
 31007c5:	83 ec 08             	sub    esp,0x8
 31007c8:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31007cb:	68 d1 1b 10 03       	push   0x3101bd1
 31007d0:	e8 bb 0e 00 00       	call   3101690 <kShell+0x468>
 31007d5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:264
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 31007d8:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31007df:	e9 86 00 00 00       	jmp    310086a <cmdHelp+0xc1>
/home/yogi/src/os/aproj/kshell/src/commands.c:265
        if (tok!=NULL)
 31007e4:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31007e8:	74 50                	je     310083a <cmdHelp+0x91>
/home/yogi/src/os/aproj/kshell/src/commands.c:267
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
 31007ea:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31007ed:	c1 e0 04             	shl    eax,0x4
 31007f0:	05 a0 27 10 03       	add    eax,0x31027a0
 31007f5:	8b 00                	mov    eax,DWORD PTR [eax]
 31007f7:	83 ec 04             	sub    esp,0x4
 31007fa:	6a 64                	push   0x64
 31007fc:	50                   	push   eax
 31007fd:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100800:	e8 7b 0f 00 00       	call   3101780 <kShell+0x558>
 3100805:	83 c4 10             	add    esp,0x10
 3100808:	85 c0                	test   eax,eax
 310080a:	75 5a                	jne    3100866 <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:268
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 310080c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310080f:	c1 e0 04             	shl    eax,0x4
 3100812:	05 a4 27 10 03       	add    eax,0x31027a4
 3100817:	8b 10                	mov    edx,DWORD PTR [eax]
 3100819:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310081c:	c1 e0 04             	shl    eax,0x4
 310081f:	05 a0 27 10 03       	add    eax,0x31027a0
 3100824:	8b 00                	mov    eax,DWORD PTR [eax]
 3100826:	83 ec 04             	sub    esp,0x4
 3100829:	52                   	push   edx
 310082a:	50                   	push   eax
 310082b:	68 db 1b 10 03       	push   0x3101bdb
 3100830:	e8 5b 0e 00 00       	call   3101690 <kShell+0x468>
 3100835:	83 c4 10             	add    esp,0x10
 3100838:	eb 2c                	jmp    3100866 <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:272
        }
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 310083a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310083d:	c1 e0 04             	shl    eax,0x4
 3100840:	05 a4 27 10 03       	add    eax,0x31027a4
 3100845:	8b 10                	mov    edx,DWORD PTR [eax]
 3100847:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310084a:	c1 e0 04             	shl    eax,0x4
 310084d:	05 a0 27 10 03       	add    eax,0x31027a0
 3100852:	8b 00                	mov    eax,DWORD PTR [eax]
 3100854:	83 ec 04             	sub    esp,0x4
 3100857:	52                   	push   edx
 3100858:	50                   	push   eax
 3100859:	68 db 1b 10 03       	push   0x3101bdb
 310085e:	e8 2d 0e 00 00       	call   3101690 <kShell+0x468>
 3100863:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:264 (discriminator 2)
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100866:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:264 (discriminator 1)
 310086a:	83 7d f4 09          	cmp    DWORD PTR [ebp-0xc],0x9
 310086e:	0f 86 70 ff ff ff    	jbe    31007e4 <cmdHelp+0x3b>
/home/yogi/src/os/aproj/kshell/src/commands.c:275
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
    
}
 3100874:	90                   	nop
 3100875:	c9                   	leave  
 3100876:	c3                   	ret    

03100877 <cmdPwd>:
cmdPwd():
/home/yogi/src/os/aproj/kshell/src/commands.c:278

void cmdPwd()
{
 3100877:	55                   	push   ebp
 3100878:	89 e5                	mov    ebp,esp
 310087a:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:279
    char* buf=malloc(512);
 310087d:	83 ec 0c             	sub    esp,0xc
 3100880:	68 00 02 00 00       	push   0x200
 3100885:	e8 56 0e 00 00       	call   31016e0 <kShell+0x4b8>
 310088a:	83 c4 10             	add    esp,0x10
 310088d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:280
    print("%s\n",getcwd(buf,512));
 3100890:	83 ec 08             	sub    esp,0x8
 3100893:	68 00 02 00 00       	push   0x200
 3100898:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 310089b:	e8 50 0f 00 00       	call   31017f0 <kShell+0x5c8>
 31008a0:	83 c4 10             	add    esp,0x10
 31008a3:	83 ec 08             	sub    esp,0x8
 31008a6:	50                   	push   eax
 31008a7:	68 ba 19 10 03       	push   0x31019ba
 31008ac:	e8 df 0d 00 00       	call   3101690 <kShell+0x468>
 31008b1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:281
    free(buf);
 31008b4:	83 ec 0c             	sub    esp,0xc
 31008b7:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 31008ba:	e8 b1 0f 00 00       	call   3101870 <kShell+0x648>
 31008bf:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:282
}
 31008c2:	90                   	nop
 31008c3:	c9                   	leave  
 31008c4:	c3                   	ret    

031008c5 <cmdSleep>:
cmdSleep():
/home/yogi/src/os/aproj/kshell/src/commands.c:285

void cmdSleep(char *cmdline)
{
 31008c5:	55                   	push   ebp
 31008c6:	89 e5                	mov    ebp,esp
 31008c8:	53                   	push   ebx
 31008c9:	81 ec 24 05 00 00    	sub    esp,0x524
 31008cf:	89 e0                	mov    eax,esp
 31008d1:	89 c3                	mov    ebx,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:287
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 31008d3:	83 ec 04             	sub    esp,0x4
 31008d6:	68 00 05 00 00       	push   0x500
 31008db:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 31008e1:	50                   	push   eax
 31008e2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31008e5:	e8 b2 02 00 00       	call   3100b9c <parseParamsShell>
 31008ea:	83 c4 10             	add    esp,0x10
 31008ed:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:290

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
 31008f0:	c7 45 e8 a8 61 00 00 	mov    DWORD PTR [ebp-0x18],0x61a8
/home/yogi/src/os/aproj/kshell/src/commands.c:291
    int test[size];
 31008f7:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 31008fa:	8d 50 ff             	lea    edx,[eax-0x1]
 31008fd:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 3100900:	c1 e0 02             	shl    eax,0x2
 3100903:	8d 50 03             	lea    edx,[eax+0x3]
 3100906:	b8 10 00 00 00       	mov    eax,0x10
 310090b:	83 e8 01             	sub    eax,0x1
 310090e:	01 d0                	add    eax,edx
 3100910:	b9 10 00 00 00       	mov    ecx,0x10
 3100915:	ba 00 00 00 00       	mov    edx,0x0
 310091a:	f7 f1                	div    ecx
 310091c:	6b c0 10             	imul   eax,eax,0x10
 310091f:	29 c4                	sub    esp,eax
 3100921:	89 e0                	mov    eax,esp
 3100923:	83 c0 03             	add    eax,0x3
 3100926:	c1 e8 02             	shr    eax,0x2
 3100929:	c1 e0 02             	shl    eax,0x2
 310092c:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:293
    
    for (int cnt=0;cnt<size;cnt++)
 310092f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100936:	eb 10                	jmp    3100948 <cmdSleep+0x83>
/home/yogi/src/os/aproj/kshell/src/commands.c:294 (discriminator 3)
        test[cnt]=cnt;
 3100938:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310093b:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 310093e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 3100941:	89 0c 90             	mov    DWORD PTR [eax+edx*4],ecx
/home/yogi/src/os/aproj/kshell/src/commands.c:293 (discriminator 3)

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
 3100944:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:293 (discriminator 1)
 3100948:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310094b:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 310094e:	7c e8                	jl     3100938 <cmdSleep+0x73>
/home/yogi/src/os/aproj/kshell/src/commands.c:296
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
 3100950:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 3100957:	eb 22                	jmp    310097b <cmdSleep+0xb6>
/home/yogi/src/os/aproj/kshell/src/commands.c:297
        if (test[cnt]!=cnt)
 3100959:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310095c:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 310095f:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
 3100962:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 3100965:	74 10                	je     3100977 <cmdSleep+0xb2>
/home/yogi/src/os/aproj/kshell/src/commands.c:298
            printf("uh oh!");
 3100967:	83 ec 0c             	sub    esp,0xc
 310096a:	68 e4 1b 10 03       	push   0x3101be4
 310096f:	e8 2c 0d 00 00       	call   31016a0 <kShell+0x478>
 3100974:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:296 (discriminator 2)
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
 3100977:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:296 (discriminator 1)
 310097b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310097e:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 3100981:	7c d6                	jl     3100959 <cmdSleep+0x94>
/home/yogi/src/os/aproj/kshell/src/commands.c:300
        if (test[cnt]!=cnt)
            printf("uh oh!");
    
    if (params[0][0]==0)
 3100983:	0f b6 85 e0 fa ff ff 	movzx  eax,BYTE PTR [ebp-0x520]
 310098a:	84 c0                	test   al,al
 310098c:	75 17                	jne    31009a5 <cmdSleep+0xe0>
/home/yogi/src/os/aproj/kshell/src/commands.c:302
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 310098e:	83 ec 0c             	sub    esp,0xc
 3100991:	68 ec 1b 10 03       	push   0x3101bec
 3100996:	e8 f5 0c 00 00       	call   3101690 <kShell+0x468>
 310099b:	83 c4 10             	add    esp,0x10
 310099e:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:303
        return;
 31009a3:	eb 27                	jmp    31009cc <cmdSleep+0x107>
/home/yogi/src/os/aproj/kshell/src/commands.c:306
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 31009a5:	83 ec 04             	sub    esp,0x4
 31009a8:	6a 0a                	push   0xa
 31009aa:	6a 00                	push   0x0
 31009ac:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 31009b2:	50                   	push   eax
 31009b3:	e8 58 0d 00 00       	call   3101710 <kShell+0x4e8>
 31009b8:	83 c4 10             	add    esp,0x10
 31009bb:	83 ec 0c             	sub    esp,0xc
 31009be:	50                   	push   eax
 31009bf:	e8 2c 0d 00 00       	call   31016f0 <kShell+0x4c8>
 31009c4:	83 c4 10             	add    esp,0x10
 31009c7:	b8 01 00 00 00       	mov    eax,0x1
 31009cc:	89 dc                	mov    esp,ebx
 31009ce:	83 f8 01             	cmp    eax,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:307
}
 31009d1:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31009d4:	c9                   	leave  
 31009d5:	c3                   	ret    
 31009d6:	66 90                	xchg   ax,ax

031009d8 <preprocessCmd>:
preprocessCmd():
/home/yogi/src/os/aproj/kshell/src/kshell.c:26
int findCommand(char* command);
char **buildargv (const char *input);


void preprocessCmd(char *command)
{
 31009d8:	55                   	push   ebp
 31009d9:	89 e5                	mov    ebp,esp
/home/yogi/src/os/aproj/kshell/src/kshell.c:28
    
}
 31009db:	90                   	nop
 31009dc:	5d                   	pop    ebp
 31009dd:	c3                   	ret    

031009de <execCmds>:
execCmds():
/home/yogi/src/os/aproj/kshell/src/kshell.c:31

void execCmds(char **cmds)
{
 31009de:	55                   	push   ebp
 31009df:	89 e5                	mov    ebp,esp
 31009e1:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:32
    char **lcmds = cmds;
 31009e4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31009e7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:34
    
    while (*lcmds)
 31009ea:	eb 15                	jmp    3100a01 <execCmds+0x23>
/home/yogi/src/os/aproj/kshell/src/kshell.c:36
    {
        execInternalCommand(*lcmds);
 31009ec:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31009ef:	8b 00                	mov    eax,DWORD PTR [eax]
 31009f1:	83 ec 0c             	sub    esp,0xc
 31009f4:	50                   	push   eax
 31009f5:	e8 ee 00 00 00       	call   3100ae8 <execInternalCommand>
 31009fa:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:37
        lcmds++;
 31009fd:	83 45 f4 04          	add    DWORD PTR [ebp-0xc],0x4
/home/yogi/src/os/aproj/kshell/src/kshell.c:34

void execCmds(char **cmds)
{
    char **lcmds = cmds;
    
    while (*lcmds)
 3100a01:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a04:	8b 00                	mov    eax,DWORD PTR [eax]
 3100a06:	85 c0                	test   eax,eax
 3100a08:	75 e2                	jne    31009ec <execCmds+0xe>
/home/yogi/src/os/aproj/kshell/src/kshell.c:39
    {
        execInternalCommand(*lcmds);
        lcmds++;
    }
}
 3100a0a:	90                   	nop
 3100a0b:	c9                   	leave  
 3100a0c:	c3                   	ret    

03100a0d <parseCmds>:
parseCmds():
/home/yogi/src/os/aproj/kshell/src/kshell.c:43

//Parse individual commandline (look for pipes)
char** parseCmds(char *command)
{
 3100a0d:	55                   	push   ebp
 3100a0e:	89 e5                	mov    ebp,esp
 3100a10:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:44
    char delims[3] = ";";
 3100a13:	66 c7 45 e9 3b 00    	mov    WORD PTR [ebp-0x17],0x3b
 3100a19:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    char **cmds;
    char *lcommand=malloc(1024);
 3100a1d:	83 ec 0c             	sub    esp,0xc
 3100a20:	68 00 04 00 00       	push   0x400
 3100a25:	e8 b6 0c 00 00       	call   31016e0 <kShell+0x4b8>
 3100a2a:	83 c4 10             	add    esp,0x10
 3100a2d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:48
    char *cmd;
    int cmdptr=0;
 3100a30:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:51
    
    //Get a local copy of the command for strtok which will modify the string
    strncpy(lcommand,command,1024);
 3100a37:	83 ec 04             	sub    esp,0x4
 3100a3a:	68 00 04 00 00       	push   0x400
 3100a3f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100a42:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100a45:	e8 46 0d 00 00       	call   3101790 <kShell+0x568>
 3100a4a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:53
    
    memset(kCmdline,0,CMDLINE_BUFFER_SIZE);
 3100a4d:	a1 a0 28 11 03       	mov    eax,ds:0x31128a0
 3100a52:	83 ec 04             	sub    esp,0x4
 3100a55:	68 00 c8 00 00       	push   0xc800
 3100a5a:	6a 00                	push   0x0
 3100a5c:	50                   	push   eax
 3100a5d:	e8 6e 0d 00 00       	call   31017d0 <kShell+0x5a8>
 3100a62:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:54
    cmd = strtok(lcommand, delims);
 3100a65:	83 ec 08             	sub    esp,0x8
 3100a68:	8d 45 e9             	lea    eax,[ebp-0x17]
 3100a6b:	50                   	push   eax
 3100a6c:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100a6f:	e8 3c 0d 00 00       	call   31017b0 <kShell+0x588>
 3100a74:	83 c4 10             	add    esp,0x10
 3100a77:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:55
    while( cmd != NULL )
 3100a7a:	eb 5f                	jmp    3100adb <parseCmds+0xce>
/home/yogi/src/os/aproj/kshell/src/kshell.c:57
    {
        kCmdline[cmdptr]=kCmdline+(PARSE_CMD_COUNT*4) + (cmdptr*CMDLINE_MAX_SIZE);
 3100a7c:	a1 a0 28 11 03       	mov    eax,ds:0x31128a0
 3100a81:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 3100a84:	c1 e2 02             	shl    edx,0x2
 3100a87:	01 d0                	add    eax,edx
 3100a89:	8b 15 a0 28 11 03    	mov    edx,DWORD PTR ds:0x31128a0
 3100a8f:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
 3100a92:	c1 e1 0b             	shl    ecx,0xb
 3100a95:	81 c1 40 06 00 00    	add    ecx,0x640
 3100a9b:	01 ca                	add    edx,ecx
 3100a9d:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/kshell/src/kshell.c:58
        strcpy(kCmdline[cmdptr],cmd);
 3100a9f:	a1 a0 28 11 03       	mov    eax,ds:0x31128a0
 3100aa4:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 3100aa7:	c1 e2 02             	shl    edx,0x2
 3100aaa:	01 d0                	add    eax,edx
 3100aac:	8b 00                	mov    eax,DWORD PTR [eax]
 3100aae:	83 ec 08             	sub    esp,0x8
 3100ab1:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100ab4:	50                   	push   eax
 3100ab5:	e8 b6 0b 00 00       	call   3101670 <kShell+0x448>
 3100aba:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:59
        cmd = strtok(NULL, delims);
 3100abd:	83 ec 08             	sub    esp,0x8
 3100ac0:	8d 45 e9             	lea    eax,[ebp-0x17]
 3100ac3:	50                   	push   eax
 3100ac4:	6a 00                	push   0x0
 3100ac6:	e8 e5 0c 00 00       	call   31017b0 <kShell+0x588>
 3100acb:	83 c4 10             	add    esp,0x10
 3100ace:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:60
        if (cmd!=NULL)
 3100ad1:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100ad5:	74 04                	je     3100adb <parseCmds+0xce>
/home/yogi/src/os/aproj/kshell/src/kshell.c:61
            cmdptr++;
 3100ad7:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:55
    //Get a local copy of the command for strtok which will modify the string
    strncpy(lcommand,command,1024);
    
    memset(kCmdline,0,CMDLINE_BUFFER_SIZE);
    cmd = strtok(lcommand, delims);
    while( cmd != NULL )
 3100adb:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100adf:	75 9b                	jne    3100a7c <parseCmds+0x6f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:63
        strcpy(kCmdline[cmdptr],cmd);
        cmd = strtok(NULL, delims);
        if (cmd!=NULL)
            cmdptr++;
    };
    return kCmdline;
 3100ae1:	a1 a0 28 11 03       	mov    eax,ds:0x31128a0
/home/yogi/src/os/aproj/kshell/src/kshell.c:64
}
 3100ae6:	c9                   	leave  
 3100ae7:	c3                   	ret    

03100ae8 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:67

void execInternalCommand(char lCommand[256])
{
 3100ae8:	55                   	push   ebp
 3100ae9:	89 e5                	mov    ebp,esp
 3100aeb:	53                   	push   ebx
 3100aec:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:68
    strtrim(lCommand);
 3100aef:	83 ec 0c             	sub    esp,0xc
 3100af2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100af5:	e8 e6 0c 00 00       	call   31017e0 <kShell+0x5b8>
 3100afa:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:69
    int i = findCommand(lCommand);
 3100afd:	83 ec 0c             	sub    esp,0xc
 3100b00:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100b03:	e8 3d 02 00 00       	call   3100d45 <findCommand>
 3100b08:	83 c4 10             	add    esp,0x10
 3100b0b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:71

    if(i>0)
 3100b0e:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100b12:	7e 74                	jle    3100b88 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:73
    {
        i--;
 3100b14:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:75
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 3100b18:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100b1b:	c1 e0 04             	shl    eax,0x4
 3100b1e:	05 48 28 10 03       	add    eax,0x3102848
 3100b23:	8b 00                	mov    eax,DWORD PTR [eax]
 3100b25:	a3 58 2d 10 03       	mov    ds:0x3102d58,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:76
        command_function_p = cmds[i].function;
 3100b2a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100b2d:	c1 e0 04             	shl    eax,0x4
 3100b30:	05 48 28 10 03       	add    eax,0x3102848
 3100b35:	8b 00                	mov    eax,DWORD PTR [eax]
 3100b37:	a3 40 2d 10 03       	mov    ds:0x3102d40,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:77
        if (cmds[i].paramCount==0)
 3100b3c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100b3f:	c1 e0 04             	shl    eax,0x4
 3100b42:	05 4c 28 10 03       	add    eax,0x310284c
 3100b47:	8b 00                	mov    eax,DWORD PTR [eax]
 3100b49:	85 c0                	test   eax,eax
 3100b4b:	75 09                	jne    3100b56 <execInternalCommand+0x6e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:78
            command_function();
 3100b4d:	a1 58 2d 10 03       	mov    eax,ds:0x3102d58
 3100b52:	ff d0                	call   eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:89
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 3100b54:	eb 40                	jmp    3100b96 <execInternalCommand+0xae>
/home/yogi/src/os/aproj/kshell/src/kshell.c:81
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
 3100b56:	8b 1d 40 2d 10 03    	mov    ebx,DWORD PTR ds:0x3102d40
 3100b5c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100b5f:	c1 e0 04             	shl    eax,0x4
 3100b62:	05 40 28 10 03       	add    eax,0x3102840
 3100b67:	8b 00                	mov    eax,DWORD PTR [eax]
 3100b69:	83 ec 0c             	sub    esp,0xc
 3100b6c:	50                   	push   eax
 3100b6d:	e8 de 0c 00 00       	call   3101850 <kShell+0x628>
 3100b72:	83 c4 10             	add    esp,0x10
 3100b75:	8d 50 01             	lea    edx,[eax+0x1]
 3100b78:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b7b:	01 d0                	add    eax,edx
 3100b7d:	83 ec 0c             	sub    esp,0xc
 3100b80:	50                   	push   eax
 3100b81:	ff d3                	call   ebx
 3100b83:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:89
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 3100b86:	eb 0e                	jmp    3100b96 <execInternalCommand+0xae>
/home/yogi/src/os/aproj/kshell/src/kshell.c:87
        }
    }
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
 3100b88:	83 ec 0c             	sub    esp,0xc
 3100b8b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100b8e:	e8 a4 fb ff ff       	call   3100737 <cmdExecp>
 3100b93:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:89
    }
}
 3100b96:	90                   	nop
 3100b97:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100b9a:	c9                   	leave  
 3100b9b:	c3                   	ret    

03100b9c <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:92

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 3100b9c:	55                   	push   ebp
 3100b9d:	89 e5                	mov    ebp,esp
 3100b9f:	53                   	push   ebx
 3100ba0:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/aproj/kshell/src/kshell.c:93
    int x=0,y=0;
 3100ba3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100baa:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:94
    int lRetVal=0,parsedChars=0;
 3100bb1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100bb8:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:95
    bool needDoubleQuotetoEndParam=0;
 3100bbf:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:97
    
    memset(params,0, size);
 3100bc3:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100bc6:	83 ec 04             	sub    esp,0x4
 3100bc9:	50                   	push   eax
 3100bca:	6a 00                	push   0x0
 3100bcc:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100bcf:	e8 fc 0b 00 00       	call   31017d0 <kShell+0x5a8>
 3100bd4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:99
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100bd7:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 3100bde:	e9 24 01 00 00       	jmp    3100d07 <parseParamsShell+0x16b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:101
    {
        if(cmdLine[cnt]=='"')
 3100be3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100be6:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100be9:	01 d0                	add    eax,edx
 3100beb:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100bee:	3c 22                	cmp    al,0x22
 3100bf0:	75 41                	jne    3100c33 <parseParamsShell+0x97>
/home/yogi/src/os/aproj/kshell/src/kshell.c:103
        {
            if (!needDoubleQuotetoEndParam)
 3100bf2:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100bf6:	83 f0 01             	xor    eax,0x1
 3100bf9:	84 c0                	test   al,al
 3100bfb:	74 09                	je     3100c06 <parseParamsShell+0x6a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:105
            {
                needDoubleQuotetoEndParam=true;
 3100bfd:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 3100c01:	e9 f9 00 00 00       	jmp    3100cff <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:109
            }
            else
            {
                params[y][x]='\0';
 3100c06:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100c09:	c1 e0 07             	shl    eax,0x7
 3100c0c:	89 c2                	mov    edx,eax
 3100c0e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100c11:	01 c2                	add    edx,eax
 3100c13:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c16:	01 d0                	add    eax,edx
 3100c18:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:110
                {x=0;y++;lRetVal++;}
 3100c1b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100c22:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100c26:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:111
                needDoubleQuotetoEndParam=false;
 3100c2a:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 3100c2e:	e9 cc 00 00 00       	jmp    3100cff <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:114
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 3100c33:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100c36:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100c39:	01 d0                	add    eax,edx
 3100c3b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c3e:	3c 20                	cmp    al,0x20
 3100c40:	74 1e                	je     3100c60 <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:114 (discriminator 2)
 3100c42:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100c45:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100c48:	01 d0                	add    eax,edx
 3100c4a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c4d:	3c 2d                	cmp    al,0x2d
 3100c4f:	74 0f                	je     3100c60 <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:114 (discriminator 4)
 3100c51:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100c54:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100c57:	01 d0                	add    eax,edx
 3100c59:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c5c:	3c 2c                	cmp    al,0x2c
 3100c5e:	75 7a                	jne    3100cda <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:114 (discriminator 5)
 3100c60:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100c64:	83 f0 01             	xor    eax,0x1
 3100c67:	84 c0                	test   al,al
 3100c69:	74 6f                	je     3100cda <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:117
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 3100c6b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100c6e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100c71:	01 d0                	add    eax,edx
 3100c73:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c76:	3c 2d                	cmp    al,0x2d
 3100c78:	74 0f                	je     3100c89 <parseParamsShell+0xed>
/home/yogi/src/os/aproj/kshell/src/kshell.c:117 (discriminator 1)
 3100c7a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100c7d:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100c80:	01 d0                	add    eax,edx
 3100c82:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c85:	3c 2f                	cmp    al,0x2f
 3100c87:	75 25                	jne    3100cae <parseParamsShell+0x112>
/home/yogi/src/os/aproj/kshell/src/kshell.c:118
                params[y][x++]=cmdLine[cnt];
 3100c89:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100c8c:	c1 e0 07             	shl    eax,0x7
 3100c8f:	89 c2                	mov    edx,eax
 3100c91:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100c94:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100c97:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c9a:	8d 50 01             	lea    edx,[eax+0x1]
 3100c9d:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100ca0:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100ca3:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 3100ca6:	01 da                	add    edx,ebx
 3100ca8:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100cab:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:119
            params[y][x]='\0';
 3100cae:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100cb1:	c1 e0 07             	shl    eax,0x7
 3100cb4:	89 c2                	mov    edx,eax
 3100cb6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100cb9:	01 c2                	add    edx,eax
 3100cbb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100cbe:	01 d0                	add    eax,edx
 3100cc0:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:120
            if (cnt>0)
 3100cc3:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 3100cc7:	74 36                	je     3100cff <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:121
                {x=0;y++;lRetVal++;}
 3100cc9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100cd0:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100cd4:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:120
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 3100cd8:	eb 25                	jmp    3100cff <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:126
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 3100cda:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100cdd:	c1 e0 07             	shl    eax,0x7
 3100ce0:	89 c2                	mov    edx,eax
 3100ce2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100ce5:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100ce8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100ceb:	8d 50 01             	lea    edx,[eax+0x1]
 3100cee:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100cf1:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100cf4:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 3100cf7:	01 da                	add    edx,ebx
 3100cf9:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100cfc:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:128 (discriminator 2)
        }
        parsedChars++;
 3100cff:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:99 (discriminator 2)
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100d03:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:99 (discriminator 1)
 3100d07:	83 ec 0c             	sub    esp,0xc
 3100d0a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100d0d:	e8 3e 0b 00 00       	call   3101850 <kShell+0x628>
 3100d12:	83 c4 10             	add    esp,0x10
 3100d15:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100d18:	0f 87 c5 fe ff ff    	ja     3100be3 <parseParamsShell+0x47>
/home/yogi/src/os/aproj/kshell/src/kshell.c:130
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 3100d1e:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100d22:	74 19                	je     3100d3d <parseParamsShell+0x1a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:132
    {
        lRetVal++;
 3100d24:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:133
        params[y][x]='\0';
 3100d28:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100d2b:	c1 e0 07             	shl    eax,0x7
 3100d2e:	89 c2                	mov    edx,eax
 3100d30:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100d33:	01 c2                	add    edx,eax
 3100d35:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d38:	01 d0                	add    eax,edx
 3100d3a:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:138
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 3100d3d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/aproj/kshell/src/kshell.c:139
}
 3100d40:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100d43:	c9                   	leave  
 3100d44:	c3                   	ret    

03100d45 <findCommand>:
findCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:142

int findCommand(char* command)
{
 3100d45:	55                   	push   ebp
 3100d46:	89 e5                	mov    ebp,esp
 3100d48:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:146
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100d4b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100d52:	eb 4d                	jmp    3100da1 <findCommand+0x5c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:148
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3100d54:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d57:	c1 e0 04             	shl    eax,0x4
 3100d5a:	05 40 28 10 03       	add    eax,0x3102840
 3100d5f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100d61:	83 ec 0c             	sub    esp,0xc
 3100d64:	50                   	push   eax
 3100d65:	e8 e6 0a 00 00       	call   3101850 <kShell+0x628>
 3100d6a:	83 c4 10             	add    esp,0x10
 3100d6d:	89 c2                	mov    edx,eax
 3100d6f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d72:	c1 e0 04             	shl    eax,0x4
 3100d75:	05 40 28 10 03       	add    eax,0x3102840
 3100d7a:	8b 00                	mov    eax,DWORD PTR [eax]
 3100d7c:	83 ec 04             	sub    esp,0x4
 3100d7f:	52                   	push   edx
 3100d80:	50                   	push   eax
 3100d81:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100d84:	e8 f7 09 00 00       	call   3101780 <kShell+0x558>
 3100d89:	83 c4 10             	add    esp,0x10
 3100d8c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:150
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 3100d8f:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100d93:	75 08                	jne    3100d9d <findCommand+0x58>
/home/yogi/src/os/aproj/kshell/src/kshell.c:153
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 3100d95:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d98:	83 c0 01             	add    eax,0x1
 3100d9b:	eb 0f                	jmp    3100dac <findCommand+0x67>
/home/yogi/src/os/aproj/kshell/src/kshell.c:146 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100d9d:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:146 (discriminator 1)
 3100da1:	83 7d f4 09          	cmp    DWORD PTR [ebp-0xc],0x9
 3100da5:	76 ad                	jbe    3100d54 <findCommand+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 3100da7:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:158
}
 3100dac:	c9                   	leave  
 3100dad:	c3                   	ret    

03100dae <buildargv>:
buildargv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:162

/*parts from http://*/
char **buildargv (const char *input)
{
 3100dae:	55                   	push   ebp
 3100daf:	89 e5                	mov    ebp,esp
 3100db1:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:165
  char *arg;
  char *copybuf;
  int squote = 0;
 3100db4:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:166
  int dquote = 0;
 3100dbb:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:167
  int bsquote = 0;
 3100dc2:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:168
  int argc = 0;
 3100dc9:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:169
  int maxargc = 0;
 3100dd0:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:170
  char **argv = NULL;
 3100dd7:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:174
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 3100dde:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 3100de2:	0f 84 33 02 00 00    	je     310101b <buildargv+0x26d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:177
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 3100de8:	83 ec 0c             	sub    esp,0xc
 3100deb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100dee:	e8 5d 0a 00 00       	call   3101850 <kShell+0x628>
 3100df3:	83 c4 10             	add    esp,0x10
 3100df6:	83 c0 01             	add    eax,0x1
 3100df9:	83 ec 0c             	sub    esp,0xc
 3100dfc:	50                   	push   eax
 3100dfd:	e8 de 08 00 00       	call   31016e0 <kShell+0x4b8>
 3100e02:	83 c4 10             	add    esp,0x10
 3100e05:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:185
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 3100e08:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 3100e0c:	74 0b                	je     3100e19 <buildargv+0x6b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:185 (discriminator 1)
 3100e0e:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100e11:	83 e8 01             	sub    eax,0x1
 3100e14:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100e17:	7f 3d                	jg     3100e56 <buildargv+0xa8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:188
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 3100e19:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 3100e1d:	75 1c                	jne    3100e3b <buildargv+0x8d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:190
		{
		  maxargc = INITIAL_MAXARGC;
 3100e1f:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:191
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 3100e26:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100e29:	c1 e0 02             	shl    eax,0x2
 3100e2c:	83 ec 0c             	sub    esp,0xc
 3100e2f:	50                   	push   eax
 3100e30:	e8 ab 08 00 00       	call   31016e0 <kShell+0x4b8>
 3100e35:	83 c4 10             	add    esp,0x10
 3100e38:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:193
		}
	      argv = nargv;
 3100e3b:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 3100e3e:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:194
	      argv[argc] = NULL;
 3100e41:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100e44:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100e4b:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100e4e:	01 d0                	add    eax,edx
 3100e50:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:197
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 3100e56:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100e59:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:198
	  while (*input != EOS)
 3100e5c:	e9 ec 00 00 00       	jmp    3100f4d <buildargv+0x19f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:200
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100e61:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100e64:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100e67:	3c 20                	cmp    al,0x20
 3100e69:	75 16                	jne    3100e81 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:200 (discriminator 1)
 3100e6b:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100e6f:	75 10                	jne    3100e81 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:200 (discriminator 2)
 3100e71:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100e75:	75 0a                	jne    3100e81 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:200 (discriminator 3)
 3100e77:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100e7b:	0f 84 da 00 00 00    	je     3100f5b <buildargv+0x1ad>
/home/yogi/src/os/aproj/kshell/src/kshell.c:206
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100e81:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100e85:	74 1d                	je     3100ea4 <buildargv+0xf6>
/home/yogi/src/os/aproj/kshell/src/kshell.c:208
		    {
		      bsquote = 0;
 3100e87:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:209
		      *arg++ = *input;
 3100e8e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100e91:	8d 50 01             	lea    edx,[eax+0x1]
 3100e94:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100e97:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100e9a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100e9d:	88 10                	mov    BYTE PTR [eax],dl
 3100e9f:	e9 a5 00 00 00       	jmp    3100f49 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:211
		    }
		  else if (*input == '\\')
 3100ea4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100ea7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100eaa:	3c 5c                	cmp    al,0x5c
 3100eac:	75 0c                	jne    3100eba <buildargv+0x10c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:213
		    {
		      bsquote = 1;
 3100eae:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 3100eb5:	e9 8f 00 00 00       	jmp    3100f49 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:215
		    }
		  else if (squote)
 3100eba:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100ebe:	74 26                	je     3100ee6 <buildargv+0x138>
/home/yogi/src/os/aproj/kshell/src/kshell.c:217
		    {
		      if (*input == '\'')
 3100ec0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100ec3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100ec6:	3c 27                	cmp    al,0x27
 3100ec8:	75 09                	jne    3100ed3 <buildargv+0x125>
/home/yogi/src/os/aproj/kshell/src/kshell.c:219
			{
			  squote = 0;
 3100eca:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100ed1:	eb 76                	jmp    3100f49 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:223
			}
		      else
			{
			  *arg++ = *input;
 3100ed3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100ed6:	8d 50 01             	lea    edx,[eax+0x1]
 3100ed9:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100edc:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100edf:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100ee2:	88 10                	mov    BYTE PTR [eax],dl
 3100ee4:	eb 63                	jmp    3100f49 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:226
			}
		    }
		  else if (dquote)
 3100ee6:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100eea:	74 26                	je     3100f12 <buildargv+0x164>
/home/yogi/src/os/aproj/kshell/src/kshell.c:228
		    {
		      if (*input == '"')
 3100eec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100eef:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100ef2:	3c 22                	cmp    al,0x22
 3100ef4:	75 09                	jne    3100eff <buildargv+0x151>
/home/yogi/src/os/aproj/kshell/src/kshell.c:230
			{
			  dquote = 0;
 3100ef6:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 3100efd:	eb 4a                	jmp    3100f49 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:234
			}
		      else
			{
			  *arg++ = *input;
 3100eff:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100f02:	8d 50 01             	lea    edx,[eax+0x1]
 3100f05:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100f08:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100f0b:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100f0e:	88 10                	mov    BYTE PTR [eax],dl
 3100f10:	eb 37                	jmp    3100f49 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:239
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100f12:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100f15:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100f18:	3c 27                	cmp    al,0x27
 3100f1a:	75 09                	jne    3100f25 <buildargv+0x177>
/home/yogi/src/os/aproj/kshell/src/kshell.c:241
			{
			  squote = 1;
 3100f1c:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100f23:	eb 24                	jmp    3100f49 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:243
			}
		      else if (*input == '"')
 3100f25:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100f28:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100f2b:	3c 22                	cmp    al,0x22
 3100f2d:	75 09                	jne    3100f38 <buildargv+0x18a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:245
			{
			  dquote = 1;
 3100f2f:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 3100f36:	eb 11                	jmp    3100f49 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:249
			}
		      else
			{
			  *arg++ = *input;
 3100f38:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100f3b:	8d 50 01             	lea    edx,[eax+0x1]
 3100f3e:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100f41:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100f44:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100f47:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:253
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 3100f49:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:198
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 3100f4d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100f50:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100f53:	84 c0                	test   al,al
 3100f55:	0f 85 06 ff ff ff    	jne    3100e61 <buildargv+0xb3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:256
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3100f5b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100f5e:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:258
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100f61:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100f64:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100f67:	84 c0                	test   al,al
 3100f69:	0f 84 9e 00 00 00    	je     310100d <buildargv+0x25f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:260
          {
            char* temp=malloc(strlen(copybuf)+1);
 3100f6f:	83 ec 0c             	sub    esp,0xc
 3100f72:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100f75:	e8 d6 08 00 00       	call   3101850 <kShell+0x628>
 3100f7a:	83 c4 10             	add    esp,0x10
 3100f7d:	83 c0 01             	add    eax,0x1
 3100f80:	83 ec 0c             	sub    esp,0xc
 3100f83:	50                   	push   eax
 3100f84:	e8 57 07 00 00       	call   31016e0 <kShell+0x4b8>
 3100f89:	83 c4 10             	add    esp,0x10
 3100f8c:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:263
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3100f8f:	83 ec 08             	sub    esp,0x8
 3100f92:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100f95:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100f98:	e8 d3 06 00 00       	call   3101670 <kShell+0x448>
 3100f9d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:264
            free(copybuf);
 3100fa0:	83 ec 0c             	sub    esp,0xc
 3100fa3:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100fa6:	e8 c5 08 00 00       	call   3101870 <kShell+0x648>
 3100fab:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:265
            copybuf = (char *) malloc (strlen (input) + 1);
 3100fae:	83 ec 0c             	sub    esp,0xc
 3100fb1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100fb4:	e8 97 08 00 00       	call   3101850 <kShell+0x628>
 3100fb9:	83 c4 10             	add    esp,0x10
 3100fbc:	83 c0 01             	add    eax,0x1
 3100fbf:	83 ec 0c             	sub    esp,0xc
 3100fc2:	50                   	push   eax
 3100fc3:	e8 18 07 00 00       	call   31016e0 <kShell+0x4b8>
 3100fc8:	83 c4 10             	add    esp,0x10
 3100fcb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:266
            argv[argc] = temp;
 3100fce:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100fd1:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100fd8:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100fdb:	01 c2                	add    edx,eax
 3100fdd:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100fe0:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:268
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 3100fe2:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:269
            argv[argc] = NULL;
 3100fe6:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100fe9:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100ff0:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100ff3:	01 d0                	add    eax,edx
 3100ff5:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:270
            input++;
 3100ffb:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:271
            free(temp);
 3100fff:	83 ec 0c             	sub    esp,0xc
 3101002:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3101005:	e8 66 08 00 00       	call   3101870 <kShell+0x648>
 310100a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:274
          }
	}
      while (*input != EOS);
 310100d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3101010:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101013:	84 c0                	test   al,al
 3101015:	0f 85 ed fd ff ff    	jne    3100e08 <buildargv+0x5a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:277
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 310101b:	83 ec 0c             	sub    esp,0xc
 310101e:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3101021:	e8 4a 08 00 00       	call   3101870 <kShell+0x648>
 3101026:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:278
  free(nargv);
 3101029:	83 ec 0c             	sub    esp,0xc
 310102c:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 310102f:	e8 3c 08 00 00       	call   3101870 <kShell+0x648>
 3101034:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:279
  return (argv);
 3101037:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/kshell/src/kshell.c:280
}
 310103a:	c9                   	leave  
 310103b:	c3                   	ret    

0310103c <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:283

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
 310103c:	55                   	push   ebp
 310103d:	89 e5                	mov    ebp,esp
 310103f:	53                   	push   ebx
 3101040:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:284
    for (int cnt=0;cnt<pcount;cnt++)
 3101043:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310104a:	eb 56                	jmp    31010a2 <paramsToArgv+0x66>
/home/yogi/src/os/aproj/kshell/src/kshell.c:286 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 310104c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310104f:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3101056:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3101059:	8d 1c 02             	lea    ebx,[edx+eax*1]
 310105c:	83 ec 0c             	sub    esp,0xc
 310105f:	68 80 00 00 00       	push   0x80
 3101064:	e8 77 06 00 00       	call   31016e0 <kShell+0x4b8>
 3101069:	83 c4 10             	add    esp,0x10
 310106c:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:287 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 310106e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101071:	c1 e0 07             	shl    eax,0x7
 3101074:	89 c2                	mov    edx,eax
 3101076:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3101079:	01 c2                	add    edx,eax
 310107b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310107e:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 3101085:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3101088:	01 c8                	add    eax,ecx
 310108a:	8b 00                	mov    eax,DWORD PTR [eax]
 310108c:	83 ec 04             	sub    esp,0x4
 310108f:	68 80 00 00 00       	push   0x80
 3101094:	52                   	push   edx
 3101095:	50                   	push   eax
 3101096:	e8 35 06 00 00       	call   31016d0 <kShell+0x4a8>
 310109b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:284 (discriminator 3)
  return (argv);
}

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
    for (int cnt=0;cnt<pcount;cnt++)
 310109e:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:284 (discriminator 1)
 31010a2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31010a5:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 31010a8:	7c a2                	jl     310104c <paramsToArgv+0x10>
/home/yogi/src/os/aproj/kshell/src/kshell.c:289
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 31010aa:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
/home/yogi/src/os/aproj/kshell/src/kshell.c:290
}
 31010ad:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31010b0:	c9                   	leave  
 31010b1:	c3                   	ret    

031010b2 <freeArgV>:
freeArgV():
/home/yogi/src/os/aproj/kshell/src/kshell.c:293

void freeArgV(int pcount, char **params)
{
 31010b2:	55                   	push   ebp
 31010b3:	89 e5                	mov    ebp,esp
 31010b5:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:294
    for (int cnt=0;cnt<pcount;cnt++)
 31010b8:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31010bf:	eb 15                	jmp    31010d6 <freeArgV+0x24>
/home/yogi/src/os/aproj/kshell/src/kshell.c:295 (discriminator 3)
        free(*params);
 31010c1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31010c4:	8b 00                	mov    eax,DWORD PTR [eax]
 31010c6:	83 ec 0c             	sub    esp,0xc
 31010c9:	50                   	push   eax
 31010ca:	e8 a1 07 00 00       	call   3101870 <kShell+0x648>
 31010cf:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:294 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 31010d2:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:294 (discriminator 1)
 31010d6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31010d9:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 31010dc:	7c e3                	jl     31010c1 <freeArgV+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:296
        free(*params);
    free(params);
 31010de:	83 ec 0c             	sub    esp,0xc
 31010e1:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31010e4:	e8 87 07 00 00       	call   3101870 <kShell+0x648>
 31010e9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:297
}
 31010ec:	90                   	nop
 31010ed:	c9                   	leave  
 31010ee:	c3                   	ret    

031010ef <getEnvVariableValue>:
getEnvVariableValue():
/home/yogi/src/os/aproj/kshell/src/kshell.c:300

bool getEnvVariableValue(char* evName, char* value)
{
 31010ef:	55                   	push   ebp
 31010f0:	89 e5                	mov    ebp,esp
 31010f2:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:302
    
    for (int cnt=0;cnt<50;cnt++)
 31010f5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31010fc:	eb 70                	jmp    310116e <getEnvVariableValue+0x7f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:304
    {
        if (environmentLoc[cnt]!=0)
 31010fe:	a1 0c 2a 10 03       	mov    eax,ds:0x3102a0c
 3101103:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3101106:	c1 e2 02             	shl    edx,0x2
 3101109:	01 d0                	add    eax,edx
 310110b:	8b 00                	mov    eax,DWORD PTR [eax]
 310110d:	85 c0                	test   eax,eax
 310110f:	74 59                	je     310116a <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:306
        {
            char* idx = strstr((char*)environmentLoc[cnt],evName);
 3101111:	a1 0c 2a 10 03       	mov    eax,ds:0x3102a0c
 3101116:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3101119:	c1 e2 02             	shl    edx,0x2
 310111c:	01 d0                	add    eax,edx
 310111e:	8b 00                	mov    eax,DWORD PTR [eax]
 3101120:	83 ec 08             	sub    esp,0x8
 3101123:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3101126:	50                   	push   eax
 3101127:	e8 34 06 00 00       	call   3101760 <kShell+0x538>
 310112c:	83 c4 10             	add    esp,0x10
 310112f:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:307
            if (idx>0)
 3101132:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3101136:	74 32                	je     310116a <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:309
            {
                idx = strstr(idx,"=");
 3101138:	83 ec 08             	sub    esp,0x8
 310113b:	68 61 1d 10 03       	push   0x3101d61
 3101140:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3101143:	e8 18 06 00 00       	call   3101760 <kShell+0x538>
 3101148:	83 c4 10             	add    esp,0x10
 310114b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:311
                //++ because we don't want to include the = sign
                strcpy(value, ++idx);
 310114e:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3101152:	83 ec 08             	sub    esp,0x8
 3101155:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3101158:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 310115b:	e8 10 05 00 00       	call   3101670 <kShell+0x448>
 3101160:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:313
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
 3101163:	b8 01 00 00 00       	mov    eax,0x1
 3101168:	eb 0f                	jmp    3101179 <getEnvVariableValue+0x8a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:302 (discriminator 2)
}

bool getEnvVariableValue(char* evName, char* value)
{
    
    for (int cnt=0;cnt<50;cnt++)
 310116a:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:302 (discriminator 1)
 310116e:	83 7d f4 31          	cmp    DWORD PTR [ebp-0xc],0x31
 3101172:	7e 8a                	jle    31010fe <getEnvVariableValue+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:317
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
            }
        }
    } 
    return false;
 3101174:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:318
}
 3101179:	c9                   	leave  
 310117a:	c3                   	ret    

0310117b <saveCommand>:
saveCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:331
    
}
*/

void saveCommand(char* command)
{
 310117b:	55                   	push   ebp
 310117c:	89 e5                	mov    ebp,esp
 310117e:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:332
    strcpy(commandHistory[commandHistoryMax++],command);
 3101181:	a1 88 2d 10 03       	mov    eax,ds:0x3102d88
 3101186:	8d 50 01             	lea    edx,[eax+0x1]
 3101189:	89 15 88 2d 10 03    	mov    DWORD PTR ds:0x3102d88,edx
 310118f:	c1 e0 07             	shl    eax,0x7
 3101192:	05 a0 2d 10 03       	add    eax,0x3102da0
 3101197:	83 ec 08             	sub    esp,0x8
 310119a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310119d:	50                   	push   eax
 310119e:	e8 cd 04 00 00       	call   3101670 <kShell+0x448>
 31011a3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:333
}
 31011a6:	90                   	nop
 31011a7:	c9                   	leave  
 31011a8:	c3                   	ret    

031011a9 <prompt>:
prompt():
/home/yogi/src/os/aproj/kshell/src/kshell.c:336

void prompt()
{
 31011a9:	55                   	push   ebp
 31011aa:	89 e5                	mov    ebp,esp
 31011ac:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:337
    print("%s %s> ",sExecutingProgram, cwd);
 31011af:	83 ec 04             	sub    esp,0x4
 31011b2:	68 20 2a 10 03       	push   0x3102a20
 31011b7:	68 40 2b 10 03       	push   0x3102b40
 31011bc:	68 63 1d 10 03       	push   0x3101d63
 31011c1:	e8 ca 04 00 00       	call   3101690 <kShell+0x468>
 31011c6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:338
}
 31011c9:	90                   	nop
 31011ca:	c9                   	leave  
 31011cb:	c3                   	ret    

031011cc <reprintCommand>:
reprintCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:341

int reprintCommand(char* command)
{
 31011cc:	55                   	push   ebp
 31011cd:	89 e5                	mov    ebp,esp
 31011cf:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:342
    resetRow();
 31011d2:	e8 d9 04 00 00       	call   31016b0 <kShell+0x488>
/home/yogi/src/os/aproj/kshell/src/kshell.c:343
    prompt();
 31011d7:	e8 cd ff ff ff       	call   31011a9 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:344
    print("%s",command);
 31011dc:	83 ec 08             	sub    esp,0x8
 31011df:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31011e2:	68 6b 1d 10 03       	push   0x3101d6b
 31011e7:	e8 a4 04 00 00       	call   3101690 <kShell+0x468>
 31011ec:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:346
 
}
 31011ef:	90                   	nop
 31011f0:	c9                   	leave  
 31011f1:	c3                   	ret    

031011f2 <handleSignals>:
handleSignals():
/home/yogi/src/os/aproj/kshell/src/kshell.c:349

int handleSignals(int signal)
{
 31011f2:	55                   	push   ebp
 31011f3:	89 e5                	mov    ebp,esp
/home/yogi/src/os/aproj/kshell/src/kshell.c:350
    switch (signal)
 31011f5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31011f8:	83 f8 08             	cmp    eax,0x8
 31011fb:	75 08                	jne    3101205 <handleSignals+0x13>
/home/yogi/src/os/aproj/kshell/src/kshell.c:353
    {
        case SIGINT:
            bSigIntReceived = true;
 31011fd:	c6 05 00 2a 10 03 01 	mov    BYTE PTR ds:0x3102a00,0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:354
            break;
 3101204:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:356
    }
}
 3101205:	90                   	nop
 3101206:	5d                   	pop    ebp
 3101207:	c3                   	ret    

03101208 <processSignal>:
processSignal():
/home/yogi/src/os/aproj/kshell/src/kshell.c:359

int processSignal(int signal)
{
 3101208:	55                   	push   ebp
 3101209:	89 e5                	mov    ebp,esp
/home/yogi/src/os/aproj/kshell/src/kshell.c:360
    switch (signal)
 310120b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310120e:	83 f8 08             	cmp    eax,0x8
 3101211:	75 0e                	jne    3101221 <processSignal+0x19>
/home/yogi/src/os/aproj/kshell/src/kshell.c:364
    {
        case SIGINT:
            //printf("^C\n");
            bSigIntReceived = false;
 3101213:	c6 05 00 2a 10 03 00 	mov    BYTE PTR ds:0x3102a00,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:365
            return SIGINT;
 310121a:	b8 08 00 00 00       	mov    eax,0x8
 310121f:	eb 05                	jmp    3101226 <processSignal+0x1e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:368
            break;
    }
    return 0;
 3101221:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:369
}
 3101226:	5d                   	pop    ebp
 3101227:	c3                   	ret    

03101228 <kShell>:
kShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:372

int kShell(int argc, char** argv, char** envp)
{
 3101228:	55                   	push   ebp
 3101229:	89 e5                	mov    ebp,esp
 310122b:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:373
    uint8_t lCurrKey=0;
 310122e:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:374
    int lCurrKeyCount=0;
 3101232:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:375
    int commandWasFromThisBufferPtr=0;
 3101239:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:378
    char ansiSeq[20];

    kCmdline = malloc(CMDLINE_BUFFER_SIZE);  //Possibility of 25 chained commands
 3101240:	83 ec 0c             	sub    esp,0xc
 3101243:	68 00 c8 00 00       	push   0xc800
 3101248:	e8 93 04 00 00       	call   31016e0 <kShell+0x4b8>
 310124d:	83 c4 10             	add    esp,0x10
 3101250:	a3 a0 28 11 03       	mov    ds:0x31128a0,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:379
    bSigIntReceived = false;
 3101255:	c6 05 00 2a 10 03 00 	mov    BYTE PTR ds:0x3102a00,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:380
    exitCode = 0;
 310125c:	c7 05 6c 2d 10 03 00 	mov    DWORD PTR ds:0x3102d6c,0x0
 3101263:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/kshell.c:381
    timeToExit = false;
 3101266:	c6 05 78 2d 10 03 00 	mov    BYTE PTR ds:0x3102d78,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:382
    strcpy(delim," \t\n-,");
 310126d:	83 ec 08             	sub    esp,0x8
 3101270:	68 6e 1d 10 03       	push   0x3101d6e
 3101275:	68 04 2a 10 03       	push   0x3102a04
 310127a:	e8 f1 03 00 00       	call   3101670 <kShell+0x448>
 310127f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:383
    environmentLoc = envp;
 3101282:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3101285:	a3 0c 2a 10 03       	mov    ds:0x3102a0c,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:384
    ansiSeq[0]=0x1b;
 310128a:	c6 45 d7 1b          	mov    BYTE PTR [ebp-0x29],0x1b
/home/yogi/src/os/aproj/kshell/src/kshell.c:385
    sKShellProgramName=malloc(1024);
 310128e:	83 ec 0c             	sub    esp,0xc
 3101291:	68 00 04 00 00       	push   0x400
 3101296:	e8 45 04 00 00       	call   31016e0 <kShell+0x4b8>
 310129b:	83 c4 10             	add    esp,0x10
 310129e:	a3 70 2d 10 03       	mov    ds:0x3102d70,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:386
    strcpy(sKShellProgramName,"kShell");
 31012a3:	a1 70 2d 10 03       	mov    eax,ds:0x3102d70
 31012a8:	83 ec 08             	sub    esp,0x8
 31012ab:	68 74 1d 10 03       	push   0x3101d74
 31012b0:	50                   	push   eax
 31012b1:	e8 ba 03 00 00       	call   3101670 <kShell+0x448>
 31012b6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:387
    strcpy(sExecutingProgram,sKShellProgramName);
 31012b9:	a1 70 2d 10 03       	mov    eax,ds:0x3102d70
 31012be:	83 ec 08             	sub    esp,0x8
 31012c1:	50                   	push   eax
 31012c2:	68 40 2b 10 03       	push   0x3102b40
 31012c7:	e8 a4 03 00 00       	call   3101670 <kShell+0x448>
 31012cc:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:390
    //puts("\nWelcome to kShell ... hang a while!\n");

    modifySignal(SIGINT, handleSignals, 0);
 31012cf:	83 ec 04             	sub    esp,0x4
 31012d2:	6a 00                	push   0x0
 31012d4:	68 f2 11 10 03       	push   0x31011f2
 31012d9:	6a 08                	push   0x8
 31012db:	e8 20 05 00 00       	call   3101800 <kShell+0x5d8>
 31012e0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:392
    
    while (!timeToExit)
 31012e3:	e9 2c 03 00 00       	jmp    3101614 <kShell+0x3ec>
/home/yogi/src/os/aproj/kshell/src/kshell.c:395
    {
getACommand:
        commandHistoryPtr = commandHistoryMax;
 31012e8:	a1 88 2d 10 03       	mov    eax,ds:0x3102d88
 31012ed:	a3 84 2d 10 03       	mov    ds:0x3102d84,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:396
        commandWasFromThisBufferPtr = -1;
 31012f2:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:397
        lCurrKey=0;
 31012f9:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:398
        lCurrKeyCount=0;
 31012fd:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:399
        memset(lCommand,0,256);
 3101304:	83 ec 04             	sub    esp,0x4
 3101307:	68 00 01 00 00       	push   0x100
 310130c:	6a 00                	push   0x0
 310130e:	68 a0 27 11 03       	push   0x31127a0
 3101313:	e8 b8 04 00 00       	call   31017d0 <kShell+0x5a8>
 3101318:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:400
        getenv("CWD",cwd);
 310131b:	83 ec 08             	sub    esp,0x8
 310131e:	68 20 2a 10 03       	push   0x3102a20
 3101323:	68 7b 1d 10 03       	push   0x3101d7b
 3101328:	e8 93 03 00 00       	call   31016c0 <kShell+0x498>
 310132d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:401
        prompt();
 3101330:	e8 74 fe ff ff       	call   31011a9 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:403
getAKey:
        lCurrKey=0;
 3101335:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:404
        while(lCurrKey==0)
 3101339:	eb 5f                	jmp    310139a <kShell+0x172>
/home/yogi/src/os/aproj/kshell/src/kshell.c:407
        {
            //Reading from STDIN blocks until a key is available.  It will only return 0 when STDIN is redirected to a file
            if (!read(STDIN_FILE, &lCurrKey, 1, 1))
 310133b:	6a 01                	push   0x1
 310133d:	6a 01                	push   0x1
 310133f:	8d 45 eb             	lea    eax,[ebp-0x15]
 3101342:	50                   	push   eax
 3101343:	6a 00                	push   0x0
 3101345:	e8 26 04 00 00       	call   3101770 <kShell+0x548>
 310134a:	83 c4 10             	add    esp,0x10
 310134d:	85 c0                	test   eax,eax
 310134f:	75 09                	jne    310135a <kShell+0x132>
/home/yogi/src/os/aproj/kshell/src/kshell.c:409
            {
                timeToExit=true;
 3101351:	c6 05 78 2d 10 03 01 	mov    BYTE PTR ds:0x3102d78,0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:410
                continue;
 3101358:	eb 40                	jmp    310139a <kShell+0x172>
/home/yogi/src/os/aproj/kshell/src/kshell.c:414
            }
            
//            gets(&lCurrKey,1,1);
            if (bSigIntReceived)
 310135a:	0f b6 05 00 2a 10 03 	movzx  eax,BYTE PTR ds:0x3102a00
 3101361:	84 c0                	test   al,al
 3101363:	74 35                	je     310139a <kShell+0x172>
/home/yogi/src/os/aproj/kshell/src/kshell.c:416
            {
                if (processSignal(SIGINT)==SIGINT)
 3101365:	83 ec 0c             	sub    esp,0xc
 3101368:	6a 08                	push   0x8
 310136a:	e8 99 fe ff ff       	call   3101208 <processSignal>
 310136f:	83 c4 10             	add    esp,0x10
 3101372:	83 f8 08             	cmp    eax,0x8
 3101375:	75 23                	jne    310139a <kShell+0x172>
/home/yogi/src/os/aproj/kshell/src/kshell.c:418
                {
                    lCommand[0] = 0x0;
 3101377:	c6 05 a0 27 11 03 00 	mov    BYTE PTR ds:0x31127a0,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:419
                    lCurrKeyCount = 0;
 310137e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:420
                    printf("\n");
 3101385:	83 ec 0c             	sub    esp,0xc
 3101388:	68 7f 1d 10 03       	push   0x3101d7f
 310138d:	e8 0e 03 00 00       	call   31016a0 <kShell+0x478>
 3101392:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:421
                    prompt();
 3101395:	e8 0f fe ff ff       	call   31011a9 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:404
        memset(lCommand,0,256);
        getenv("CWD",cwd);
        prompt();
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 310139a:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 310139e:	84 c0                	test   al,al
 31013a0:	74 99                	je     310133b <kShell+0x113>
/home/yogi/src/os/aproj/kshell/src/kshell.c:426
                    prompt();
                }
            }
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 31013a2:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31013a6:	3c c8                	cmp    al,0xc8
 31013a8:	0f 85 99 00 00 00    	jne    3101447 <kShell+0x21f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:428
        {
            if (commandHistoryPtr>=0)
 31013ae:	a1 84 2d 10 03       	mov    eax,ds:0x3102d84
 31013b3:	85 c0                	test   eax,eax
 31013b5:	0f 88 7a ff ff ff    	js     3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:431
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
 31013bb:	a1 84 2d 10 03       	mov    eax,ds:0x3102d84
 31013c0:	83 e8 01             	sub    eax,0x1
 31013c3:	85 c0                	test   eax,eax
 31013c5:	0f 88 6a ff ff ff    	js     3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:433
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
 31013cb:	a1 84 2d 10 03       	mov    eax,ds:0x3102d84
 31013d0:	83 e8 01             	sub    eax,0x1
 31013d3:	a3 84 2d 10 03       	mov    ds:0x3102d84,eax
 31013d8:	a1 84 2d 10 03       	mov    eax,ds:0x3102d84
 31013dd:	c1 e0 07             	shl    eax,0x7
 31013e0:	05 a0 2d 10 03       	add    eax,0x3102da0
 31013e5:	83 ec 08             	sub    esp,0x8
 31013e8:	50                   	push   eax
 31013e9:	68 a0 27 11 03       	push   0x31127a0
 31013ee:	e8 7d 02 00 00       	call   3101670 <kShell+0x448>
 31013f3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:434
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 31013f6:	a1 84 2d 10 03       	mov    eax,ds:0x3102d84
 31013fb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:435
                    while (lCurrKeyCount>0)
 31013fe:	eb 14                	jmp    3101414 <kShell+0x1ec>
/home/yogi/src/os/aproj/kshell/src/kshell.c:437
                    {
                        printf(KEY_BACKSPACE);
 3101400:	83 ec 0c             	sub    esp,0xc
 3101403:	68 81 1d 10 03       	push   0x3101d81
 3101408:	e8 93 02 00 00       	call   31016a0 <kShell+0x478>
 310140d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:438
                        lCurrKeyCount--;
 3101410:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:435
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 3101414:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3101418:	7f e6                	jg     3101400 <kShell+0x1d8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:440
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 310141a:	83 ec 08             	sub    esp,0x8
 310141d:	68 a0 27 11 03       	push   0x31127a0
 3101422:	68 6b 1d 10 03       	push   0x3101d6b
 3101427:	e8 74 02 00 00       	call   31016a0 <kShell+0x478>
 310142c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:441
                    lCurrKeyCount=strlen(lCommand);
 310142f:	83 ec 0c             	sub    esp,0xc
 3101432:	68 a0 27 11 03       	push   0x31127a0
 3101437:	e8 14 04 00 00       	call   3101850 <kShell+0x628>
 310143c:	83 c4 10             	add    esp,0x10
 310143f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:443
                }
                goto getAKey;
 3101442:	e9 ee fe ff ff       	jmp    3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:448
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 3101447:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 310144b:	3c d0                	cmp    al,0xd0
 310144d:	0f 85 9e 00 00 00    	jne    31014f1 <kShell+0x2c9>
/home/yogi/src/os/aproj/kshell/src/kshell.c:450
        {
            if (commandHistoryPtr>=0)
 3101453:	a1 84 2d 10 03       	mov    eax,ds:0x3102d84
 3101458:	85 c0                	test   eax,eax
 310145a:	0f 88 d5 fe ff ff    	js     3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:453
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
 3101460:	a1 84 2d 10 03       	mov    eax,ds:0x3102d84
 3101465:	8d 50 01             	lea    edx,[eax+0x1]
 3101468:	a1 88 2d 10 03       	mov    eax,ds:0x3102d88
 310146d:	39 c2                	cmp    edx,eax
 310146f:	0f 8d c0 fe ff ff    	jge    3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:455
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
 3101475:	a1 84 2d 10 03       	mov    eax,ds:0x3102d84
 310147a:	83 c0 01             	add    eax,0x1
 310147d:	a3 84 2d 10 03       	mov    ds:0x3102d84,eax
 3101482:	a1 84 2d 10 03       	mov    eax,ds:0x3102d84
 3101487:	c1 e0 07             	shl    eax,0x7
 310148a:	05 a0 2d 10 03       	add    eax,0x3102da0
 310148f:	83 ec 08             	sub    esp,0x8
 3101492:	50                   	push   eax
 3101493:	68 a0 27 11 03       	push   0x31127a0
 3101498:	e8 d3 01 00 00       	call   3101670 <kShell+0x448>
 310149d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:456
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 31014a0:	a1 84 2d 10 03       	mov    eax,ds:0x3102d84
 31014a5:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:457
                    while (lCurrKeyCount>0)
 31014a8:	eb 14                	jmp    31014be <kShell+0x296>
/home/yogi/src/os/aproj/kshell/src/kshell.c:459
                    {
                        printf(KEY_BACKSPACE);
 31014aa:	83 ec 0c             	sub    esp,0xc
 31014ad:	68 81 1d 10 03       	push   0x3101d81
 31014b2:	e8 e9 01 00 00       	call   31016a0 <kShell+0x478>
 31014b7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:460
                        lCurrKeyCount--;
 31014ba:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:457
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 31014be:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31014c2:	7f e6                	jg     31014aa <kShell+0x282>
/home/yogi/src/os/aproj/kshell/src/kshell.c:462
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 31014c4:	83 ec 08             	sub    esp,0x8
 31014c7:	68 a0 27 11 03       	push   0x31127a0
 31014cc:	68 6b 1d 10 03       	push   0x3101d6b
 31014d1:	e8 ca 01 00 00       	call   31016a0 <kShell+0x478>
 31014d6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:463
                    lCurrKeyCount=strlen(lCommand);
 31014d9:	83 ec 0c             	sub    esp,0xc
 31014dc:	68 a0 27 11 03       	push   0x31127a0
 31014e1:	e8 6a 03 00 00       	call   3101850 <kShell+0x628>
 31014e6:	83 c4 10             	add    esp,0x10
 31014e9:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:465
                }
                goto getAKey;
 31014ec:	e9 44 fe ff ff       	jmp    3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:470
            }
            else
                goto getAKey;
        }   
        else if (lCurrKey==0xcb) //left
 31014f1:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31014f5:	3c cb                	cmp    al,0xcb
 31014f7:	75 1f                	jne    3101518 <kShell+0x2f0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:472
        {
            if (lCurrKeyCount>0)
 31014f9:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31014fd:	0f 8e 32 fe ff ff    	jle    3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:474
            {
                print("\033[1D");
 3101503:	83 ec 0c             	sub    esp,0xc
 3101506:	68 8b 1d 10 03       	push   0x3101d8b
 310150b:	e8 80 01 00 00       	call   3101690 <kShell+0x468>
 3101510:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:477
            }
             
            goto getAKey;
 3101513:	e9 1d fe ff ff       	jmp    3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:479
        }
        else if (lCurrKey==0xcd) //right
 3101518:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 310151c:	3c cd                	cmp    al,0xcd
 310151e:	75 15                	jne    3101535 <kShell+0x30d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:481
        {
            print("\033[1C");
 3101520:	83 ec 0c             	sub    esp,0xc
 3101523:	68 90 1d 10 03       	push   0x3101d90
 3101528:	e8 63 01 00 00       	call   3101690 <kShell+0x468>
 310152d:	83 c4 10             	add    esp,0x10
 3101530:	e9 00 fe ff ff       	jmp    3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:483
        }
        else if (lCurrKey=='\b') //backspace
 3101535:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 3101539:	3c 08                	cmp    al,0x8
 310153b:	75 32                	jne    310156f <kShell+0x347>
/home/yogi/src/os/aproj/kshell/src/kshell.c:485
        {
            if (lCurrKeyCount-1 >= 0)
 310153d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101540:	83 e8 01             	sub    eax,0x1
 3101543:	85 c0                	test   eax,eax
 3101545:	0f 88 ea fd ff ff    	js     3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:487
            {
                lCurrKeyCount--;
 310154b:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:488
                lCommand[lCurrKeyCount]='\0';
 310154f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101552:	05 a0 27 11 03       	add    eax,0x31127a0
 3101557:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:489
                printf(KEY_BACKSPACE);
 310155a:	83 ec 0c             	sub    esp,0xc
 310155d:	68 81 1d 10 03       	push   0x3101d81
 3101562:	e8 39 01 00 00       	call   31016a0 <kShell+0x478>
 3101567:	83 c4 10             	add    esp,0x10
 310156a:	e9 c6 fd ff ff       	jmp    3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:492
            }
        }
        else if (lCurrKey==0xa) //Enter
 310156f:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 3101573:	3c 0a                	cmp    al,0xa
 3101575:	75 21                	jne    3101598 <kShell+0x370>
/home/yogi/src/os/aproj/kshell/src/kshell.c:494
        {
            print("\n");
 3101577:	83 ec 0c             	sub    esp,0xc
 310157a:	68 7f 1d 10 03       	push   0x3101d7f
 310157f:	e8 0c 01 00 00       	call   3101690 <kShell+0x468>
 3101584:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:495
            goto doneGettingKeys;
 3101587:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:508
            commandWasFromThisBufferPtr=-1;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 3101588:	0f b6 05 a0 27 11 03 	movzx  eax,BYTE PTR ds:0x31127a0
 310158f:	84 c0                	test   al,al
 3101591:	75 3c                	jne    31015cf <kShell+0x3a7>
 3101593:	e9 50 fd ff ff       	jmp    31012e8 <kShell+0xc0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:499
            print("\n");
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3101598:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310159b:	8d 50 01             	lea    edx,[eax+0x1]
 310159e:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31015a1:	0f b6 55 eb          	movzx  edx,BYTE PTR [ebp-0x15]
 31015a5:	88 90 a0 27 11 03    	mov    BYTE PTR [eax+0x31127a0],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:501
            //reprintCommand(lCommand);
            printf("%c",lCurrKey);
 31015ab:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31015af:	0f b6 c0             	movzx  eax,al
 31015b2:	83 ec 08             	sub    esp,0x8
 31015b5:	50                   	push   eax
 31015b6:	68 95 1d 10 03       	push   0x3101d95
 31015bb:	e8 e0 00 00 00       	call   31016a0 <kShell+0x478>
 31015c0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:503
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
 31015c3:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:505
        }
        goto getAKey;
 31015ca:	e9 66 fd ff ff       	jmp    3101335 <kShell+0x10d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:510
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
            goto getACommand;
        if (commandWasFromThisBufferPtr == -1)
 31015cf:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
 31015d3:	75 10                	jne    31015e5 <kShell+0x3bd>
/home/yogi/src/os/aproj/kshell/src/kshell.c:511
            saveCommand(lCommand);
 31015d5:	83 ec 0c             	sub    esp,0xc
 31015d8:	68 a0 27 11 03       	push   0x31127a0
 31015dd:	e8 99 fb ff ff       	call   310117b <saveCommand>
 31015e2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:512
        int i = findCommand(lCommand);
 31015e5:	83 ec 0c             	sub    esp,0xc
 31015e8:	68 a0 27 11 03       	push   0x31127a0
 31015ed:	e8 53 f7 ff ff       	call   3100d45 <findCommand>
 31015f2:	83 c4 10             	add    esp,0x10
 31015f5:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:513
        execCmds(parseCmds(lCommand));
 31015f8:	83 ec 0c             	sub    esp,0xc
 31015fb:	68 a0 27 11 03       	push   0x31127a0
 3101600:	e8 08 f4 ff ff       	call   3100a0d <parseCmds>
 3101605:	83 c4 10             	add    esp,0x10
 3101608:	83 ec 0c             	sub    esp,0xc
 310160b:	50                   	push   eax
 310160c:	e8 cd f3 ff ff       	call   31009de <execCmds>
 3101611:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:392
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    modifySignal(SIGINT, handleSignals, 0);
    
    while (!timeToExit)
 3101614:	0f b6 05 78 2d 10 03 	movzx  eax,BYTE PTR ds:0x3102d78
 310161b:	83 f0 01             	xor    eax,0x1
 310161e:	84 c0                	test   al,al
 3101620:	0f 85 c2 fc ff ff    	jne    31012e8 <kShell+0xc0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:515
        if (commandWasFromThisBufferPtr == -1)
            saveCommand(lCommand);
        int i = findCommand(lCommand);
        execCmds(parseCmds(lCommand));
    }
    free(sKShellProgramName);
 3101626:	a1 70 2d 10 03       	mov    eax,ds:0x3102d70
 310162b:	83 ec 0c             	sub    esp,0xc
 310162e:	50                   	push   eax
 310162f:	e8 3c 02 00 00       	call   3101870 <kShell+0x648>
 3101634:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:516
    if (kCmdline)
 3101637:	a1 a0 28 11 03       	mov    eax,ds:0x31128a0
 310163c:	85 c0                	test   eax,eax
 310163e:	74 11                	je     3101651 <kShell+0x429>
/home/yogi/src/os/aproj/kshell/src/kshell.c:517
        free(kCmdline);
 3101640:	a1 a0 28 11 03       	mov    eax,ds:0x31128a0
 3101645:	83 ec 0c             	sub    esp,0xc
 3101648:	50                   	push   eax
 3101649:	e8 22 02 00 00       	call   3101870 <kShell+0x648>
 310164e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:518
    return exitCode;
 3101651:	a1 6c 2d 10 03       	mov    eax,ds:0x3102d6c
/home/yogi/src/os/aproj/kshell/src/kshell.c:519
}
 3101656:	c9                   	leave  
 3101657:	c3                   	ret    

Disassembly of section .plt:

03101660 <.plt>:
 3101660:	ff 35 74 29 10 03    	push   DWORD PTR ds:0x3102974
 3101666:	ff 25 78 29 10 03    	jmp    DWORD PTR ds:0x3102978
 310166c:	00 00                	add    BYTE PTR [eax],al
 310166e:	00 00                	add    BYTE PTR [eax],al
 3101670:	ff 25 7c 29 10 03    	jmp    DWORD PTR ds:0x310297c
 3101676:	68 00 00 00 00       	push   0x0
 310167b:	e9 e0 ff ff ff       	jmp    3101660 <kShell+0x438>
 3101680:	ff 25 80 29 10 03    	jmp    DWORD PTR ds:0x3102980
 3101686:	68 08 00 00 00       	push   0x8
 310168b:	e9 d0 ff ff ff       	jmp    3101660 <kShell+0x438>
 3101690:	ff 25 84 29 10 03    	jmp    DWORD PTR ds:0x3102984
 3101696:	68 10 00 00 00       	push   0x10
 310169b:	e9 c0 ff ff ff       	jmp    3101660 <kShell+0x438>
 31016a0:	ff 25 88 29 10 03    	jmp    DWORD PTR ds:0x3102988
 31016a6:	68 18 00 00 00       	push   0x18
 31016ab:	e9 b0 ff ff ff       	jmp    3101660 <kShell+0x438>
 31016b0:	ff 25 8c 29 10 03    	jmp    DWORD PTR ds:0x310298c
 31016b6:	68 20 00 00 00       	push   0x20
 31016bb:	e9 a0 ff ff ff       	jmp    3101660 <kShell+0x438>
 31016c0:	ff 25 90 29 10 03    	jmp    DWORD PTR ds:0x3102990
 31016c6:	68 28 00 00 00       	push   0x28
 31016cb:	e9 90 ff ff ff       	jmp    3101660 <kShell+0x438>
 31016d0:	ff 25 94 29 10 03    	jmp    DWORD PTR ds:0x3102994
 31016d6:	68 30 00 00 00       	push   0x30
 31016db:	e9 80 ff ff ff       	jmp    3101660 <kShell+0x438>
 31016e0:	ff 25 98 29 10 03    	jmp    DWORD PTR ds:0x3102998
 31016e6:	68 38 00 00 00       	push   0x38
 31016eb:	e9 70 ff ff ff       	jmp    3101660 <kShell+0x438>
 31016f0:	ff 25 9c 29 10 03    	jmp    DWORD PTR ds:0x310299c
 31016f6:	68 40 00 00 00       	push   0x40
 31016fb:	e9 60 ff ff ff       	jmp    3101660 <kShell+0x438>
 3101700:	ff 25 a0 29 10 03    	jmp    DWORD PTR ds:0x31029a0
 3101706:	68 48 00 00 00       	push   0x48
 310170b:	e9 50 ff ff ff       	jmp    3101660 <kShell+0x438>
 3101710:	ff 25 a4 29 10 03    	jmp    DWORD PTR ds:0x31029a4
 3101716:	68 50 00 00 00       	push   0x50
 310171b:	e9 40 ff ff ff       	jmp    3101660 <kShell+0x438>
 3101720:	ff 25 a8 29 10 03    	jmp    DWORD PTR ds:0x31029a8
 3101726:	68 58 00 00 00       	push   0x58
 310172b:	e9 30 ff ff ff       	jmp    3101660 <kShell+0x438>
 3101730:	ff 25 ac 29 10 03    	jmp    DWORD PTR ds:0x31029ac
 3101736:	68 60 00 00 00       	push   0x60
 310173b:	e9 20 ff ff ff       	jmp    3101660 <kShell+0x438>
 3101740:	ff 25 b0 29 10 03    	jmp    DWORD PTR ds:0x31029b0
 3101746:	68 68 00 00 00       	push   0x68
 310174b:	e9 10 ff ff ff       	jmp    3101660 <kShell+0x438>
 3101750:	ff 25 b4 29 10 03    	jmp    DWORD PTR ds:0x31029b4
 3101756:	68 70 00 00 00       	push   0x70
 310175b:	e9 00 ff ff ff       	jmp    3101660 <kShell+0x438>
 3101760:	ff 25 b8 29 10 03    	jmp    DWORD PTR ds:0x31029b8
 3101766:	68 78 00 00 00       	push   0x78
 310176b:	e9 f0 fe ff ff       	jmp    3101660 <kShell+0x438>
 3101770:	ff 25 bc 29 10 03    	jmp    DWORD PTR ds:0x31029bc
 3101776:	68 80 00 00 00       	push   0x80
 310177b:	e9 e0 fe ff ff       	jmp    3101660 <kShell+0x438>
 3101780:	ff 25 c0 29 10 03    	jmp    DWORD PTR ds:0x31029c0
 3101786:	68 88 00 00 00       	push   0x88
 310178b:	e9 d0 fe ff ff       	jmp    3101660 <kShell+0x438>
 3101790:	ff 25 c4 29 10 03    	jmp    DWORD PTR ds:0x31029c4
 3101796:	68 90 00 00 00       	push   0x90
 310179b:	e9 c0 fe ff ff       	jmp    3101660 <kShell+0x438>
 31017a0:	ff 25 c8 29 10 03    	jmp    DWORD PTR ds:0x31029c8
 31017a6:	68 98 00 00 00       	push   0x98
 31017ab:	e9 b0 fe ff ff       	jmp    3101660 <kShell+0x438>
 31017b0:	ff 25 cc 29 10 03    	jmp    DWORD PTR ds:0x31029cc
 31017b6:	68 a0 00 00 00       	push   0xa0
 31017bb:	e9 a0 fe ff ff       	jmp    3101660 <kShell+0x438>
 31017c0:	ff 25 d0 29 10 03    	jmp    DWORD PTR ds:0x31029d0
 31017c6:	68 a8 00 00 00       	push   0xa8
 31017cb:	e9 90 fe ff ff       	jmp    3101660 <kShell+0x438>
 31017d0:	ff 25 d4 29 10 03    	jmp    DWORD PTR ds:0x31029d4
 31017d6:	68 b0 00 00 00       	push   0xb0
 31017db:	e9 80 fe ff ff       	jmp    3101660 <kShell+0x438>
 31017e0:	ff 25 d8 29 10 03    	jmp    DWORD PTR ds:0x31029d8
 31017e6:	68 b8 00 00 00       	push   0xb8
 31017eb:	e9 70 fe ff ff       	jmp    3101660 <kShell+0x438>
 31017f0:	ff 25 dc 29 10 03    	jmp    DWORD PTR ds:0x31029dc
 31017f6:	68 c0 00 00 00       	push   0xc0
 31017fb:	e9 60 fe ff ff       	jmp    3101660 <kShell+0x438>
 3101800:	ff 25 e0 29 10 03    	jmp    DWORD PTR ds:0x31029e0
 3101806:	68 c8 00 00 00       	push   0xc8
 310180b:	e9 50 fe ff ff       	jmp    3101660 <kShell+0x438>
 3101810:	ff 25 e4 29 10 03    	jmp    DWORD PTR ds:0x31029e4
 3101816:	68 d0 00 00 00       	push   0xd0
 310181b:	e9 40 fe ff ff       	jmp    3101660 <kShell+0x438>
 3101820:	ff 25 e8 29 10 03    	jmp    DWORD PTR ds:0x31029e8
 3101826:	68 d8 00 00 00       	push   0xd8
 310182b:	e9 30 fe ff ff       	jmp    3101660 <kShell+0x438>
 3101830:	ff 25 ec 29 10 03    	jmp    DWORD PTR ds:0x31029ec
 3101836:	68 e0 00 00 00       	push   0xe0
 310183b:	e9 20 fe ff ff       	jmp    3101660 <kShell+0x438>
 3101840:	ff 25 f0 29 10 03    	jmp    DWORD PTR ds:0x31029f0
 3101846:	68 e8 00 00 00       	push   0xe8
 310184b:	e9 10 fe ff ff       	jmp    3101660 <kShell+0x438>
 3101850:	ff 25 f4 29 10 03    	jmp    DWORD PTR ds:0x31029f4
 3101856:	68 f0 00 00 00       	push   0xf0
 310185b:	e9 00 fe ff ff       	jmp    3101660 <kShell+0x438>
 3101860:	ff 25 f8 29 10 03    	jmp    DWORD PTR ds:0x31029f8
 3101866:	68 f8 00 00 00       	push   0xf8
 310186b:	e9 f0 fd ff ff       	jmp    3101660 <kShell+0x438>
 3101870:	ff 25 fc 29 10 03    	jmp    DWORD PTR ds:0x31029fc
 3101876:	68 00 01 00 00       	push   0x100
 310187b:	e9 e0 fd ff ff       	jmp    3101660 <kShell+0x438>

Disassembly of section .rodata:

03101880 <.rodata>:
 3101880:	63 6c 65 61          	arpl   WORD PTR [ebp+eiz*2+0x61],bp
 3101884:	72 00                	jb     3101886 <kShell+0x65e>
 3101886:	43                   	inc    ebx
 3101887:	6c                   	ins    BYTE PTR es:[edi],dx
 3101888:	65                   	gs
 3101889:	61                   	popa   
 310188a:	72 20                	jb     31018ac <kShell+0x684>
 310188c:	74 68                	je     31018f6 <kShell+0x6ce>
 310188e:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 3101892:	72 65                	jb     31018f9 <kShell+0x6d1>
 3101894:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101896:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 3101899:	76 00                	jbe    310189b <kShell+0x673>
 310189b:	50                   	push   eax
 310189c:	72 69                	jb     3101907 <kShell+0x6df>
 310189e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310189f:	74 20                	je     31018c1 <kShell+0x699>
 31018a1:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31018a3:	76 69                	jbe    310190e <kShell+0x6e6>
 31018a5:	72 6f                	jb     3101916 <kShell+0x6ee>
 31018a7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31018a8:	6d                   	ins    DWORD PTR es:[edi],dx
 31018a9:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31018ab:	74 00                	je     31018ad <kShell+0x685>
 31018ad:	65                   	gs
 31018ae:	78 65                	js     3101915 <kShell+0x6ed>
 31018b0:	63 00                	arpl   WORD PTR [eax],ax
 31018b2:	45                   	inc    ebp
 31018b3:	78 65                	js     310191a <kShell+0x6f2>
 31018b5:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 31018b8:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 31018bc:	70 72                	jo     3101930 <kShell+0x708>
 31018be:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31018bf:	67 72 61             	addr16 jb 3101923 <kShell+0x6fb>
 31018c2:	6d                   	ins    DWORD PTR es:[edi],dx
 31018c3:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 31018c6:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 31018cd:	20 
 31018ce:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 31018d2:	6c                   	ins    BYTE PTR es:[edi],dx
 31018d3:	6c                   	ins    BYTE PTR es:[edi],dx
 31018d4:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 31018d7:	6c                   	ins    BYTE PTR es:[edi],dx
 31018d8:	70 00                	jo     31018da <kShell+0x6b2>
 31018da:	47                   	inc    edi
 31018db:	65                   	gs
 31018dc:	74 20                	je     31018fe <kShell+0x6d6>
 31018de:	68 65 6c 70 20       	push   0x20706c65
 31018e3:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 31018e7:	73 20                	jae    3101909 <kShell+0x6e1>
 31018e9:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 31018f0:	74 69                	je     310195b <kShell+0x733>
 31018f2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31018f3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31018f4:	29 00                	sub    DWORD PTR [eax],eax
 31018f6:	70 77                	jo     310196f <kShell+0x747>
 31018f8:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 31018fc:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3101903:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3101907:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 310190b:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3101910:	79 00                	jns    3101912 <kShell+0x6ea>
 3101912:	72 65                	jb     3101979 <kShell+0x751>
 3101914:	70 65                	jo     310197b <kShell+0x753>
 3101916:	61                   	popa   
 3101917:	74 00                	je     3101919 <kShell+0x6f1>
 3101919:	52                   	push   edx
 310191a:	65                   	gs
 310191b:	70 65                	jo     3101982 <kShell+0x75a>
 310191d:	61                   	popa   
 310191e:	74 20                	je     3101940 <kShell+0x718>
 3101920:	61                   	popa   
 3101921:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 3101924:	6d                   	ins    DWORD PTR es:[edi],dx
 3101925:	6d                   	ins    DWORD PTR es:[edi],dx
 3101926:	61                   	popa   
 3101927:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101928:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 310192c:	74 69                	je     3101997 <kShell+0x76f>
 310192e:	6d                   	ins    DWORD PTR es:[edi],dx
 310192f:	65                   	gs
 3101930:	73 00                	jae    3101932 <kShell+0x70a>
 3101932:	73 65                	jae    3101999 <kShell+0x771>
 3101934:	74 00                	je     3101936 <kShell+0x70e>
 3101936:	53                   	push   ebx
 3101937:	65                   	gs
 3101938:	74 20                	je     310195a <kShell+0x732>
 310193a:	61                   	popa   
 310193b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310193c:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 310193f:	76 69                	jbe    31019aa <kShell+0x782>
 3101941:	72 6f                	jb     31019b2 <kShell+0x78a>
 3101943:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101944:	6d                   	ins    DWORD PTR es:[edi],dx
 3101945:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101947:	74 20                	je     3101969 <kShell+0x741>
 3101949:	76 61                	jbe    31019ac <kShell+0x784>
 310194b:	72 69                	jb     31019b6 <kShell+0x78e>
 310194d:	61                   	popa   
 310194e:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 3101952:	73 6c                	jae    31019c0 <kShell+0x798>
 3101954:	65                   	gs
 3101955:	65                   	gs
 3101956:	70 00                	jo     3101958 <kShell+0x730>
 3101958:	53                   	push   ebx
 3101959:	6c                   	ins    BYTE PTR es:[edi],dx
 310195a:	65                   	gs
 310195b:	65                   	gs
 310195c:	70 20                	jo     310197e <kShell+0x756>
 310195e:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3101960:	72 20                	jb     3101982 <kShell+0x75a>
 3101962:	78 20                	js     3101984 <kShell+0x75c>
 3101964:	73 65                	jae    31019cb <kShell+0x7a3>
 3101966:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101969:	64                   	fs
 310196a:	73 00                	jae    310196c <kShell+0x744>
 310196c:	74 69                	je     31019d7 <kShell+0x7af>
 310196e:	6d                   	ins    DWORD PTR es:[edi],dx
 310196f:	65 00 00             	add    BYTE PTR gs:[eax],al
 3101972:	00 00                	add    BYTE PTR [eax],al
 3101974:	54                   	push   esp
 3101975:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 310197c:	72 6f                	jb     31019ed <kShell+0x7c5>
 310197e:	67 72 61             	addr16 jb 31019e2 <kShell+0x7ba>
 3101981:	6d                   	ins    DWORD PTR es:[edi],dx
 3101982:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3101985:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 310198c:	72 
 310198d:	75 6e                	jne    31019fd <kShell+0x7d5>
 310198f:	73 2e                	jae    31019bf <kShell+0x797>
 3101991:	0a 09                	or     cl,BYTE PTR [ecx]
 3101993:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 3101996:	61                   	popa   
 3101997:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 310199b:	74 69                	je     3101a06 <kShell+0x7de>
 310199d:	6d                   	ins    DWORD PTR es:[edi],dx
 310199e:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 31019a2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31019a3:	67 72 61             	addr16 jb 3101a07 <kShell+0x7df>
 31019a6:	6d                   	ins    DWORD PTR es:[edi],dx
 31019a7:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 31019aa:	61                   	popa   
 31019ab:	72 61                	jb     3101a0e <kShell+0x7e6>
 31019ad:	6d                   	ins    DWORD PTR es:[edi],dx
 31019ae:	65                   	gs
 31019af:	74 65                	je     3101a16 <kShell+0x7ee>
 31019b1:	72 73                	jb     3101a26 <kShell+0x7fe>
 31019b3:	5d                   	pop    ebp
 31019b4:	00 1b                	add    BYTE PTR [ebx],bl
 31019b6:	5b                   	pop    ebx
 31019b7:	32 4a 00             	xor    cl,BYTE PTR [edx+0x0]
 31019ba:	25 73 0a 00 3d       	and    eax,0x3d000a73
 31019bf:	00 55 73             	add    BYTE PTR [ebp+0x73],dl
 31019c2:	61                   	popa   
 31019c3:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 31019c7:	73 65                	jae    3101a2e <kShell+0x806>
 31019c9:	74 20                	je     31019eb <kShell+0x7c3>
 31019cb:	76 61                	jbe    3101a2e <kShell+0x806>
 31019cd:	72 69                	jb     3101a38 <kShell+0x810>
 31019cf:	61                   	popa   
 31019d0:	62 6c 65 3d          	bound  ebp,QWORD PTR [ebp+eiz*2+0x3d]
 31019d4:	76 61                	jbe    3101a37 <kShell+0x80f>
 31019d6:	6c                   	ins    BYTE PTR es:[edi],dx
 31019d7:	75 65                	jne    3101a3e <kShell+0x816>
 31019d9:	0a 00                	or     al,BYTE PTR [eax]
 31019db:	4c                   	dec    esp
 31019dc:	41                   	inc    ecx
 31019dd:	53                   	push   ebx
 31019de:	54                   	push   esp
 31019df:	45                   	inc    ebp
 31019e0:	58                   	pop    eax
 31019e1:	49                   	dec    ecx
 31019e2:	54                   	push   esp
 31019e3:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 31019e6:	72 6f                	jb     3101a57 <kShell+0x82f>
 31019e8:	72 20                	jb     3101a0a <kShell+0x7e2>
 31019ea:	65                   	gs
 31019eb:	78 65                	js     3101a52 <kShell+0x82a>
 31019ed:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 31019f0:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 31019f7:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
 31019fa:	20 00                	and    BYTE PTR [eax],al
 31019fc:	0a 00                	or     al,BYTE PTR [eax]
 31019fe:	6b 65 78 65          	imul   esp,DWORD PTR [ebp+0x78],0x65
 3101a02:	63 3a                	arpl   WORD PTR [edx],di
 3101a04:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
 3101a07:	76 61                	jbe    3101a6a <kShell+0x842>
 3101a09:	6c                   	ins    BYTE PTR es:[edi],dx
 3101a0a:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 3101a11:	61 
 3101a12:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101a13:	64 0a 00             	or     al,BYTE PTR fs:[eax]
 3101a16:	69 6e 76 61 6c 69 64 	imul   ebp,DWORD PTR [esi+0x76],0x64696c61
 3101a1d:	20 70 61             	and    BYTE PTR [eax+0x61],dh
 3101a20:	74 68                	je     3101a8a <kShell+0x862>
 3101a22:	20 6f 72             	and    BYTE PTR [edi+0x72],ch
 3101a25:	20 66 69             	and    BYTE PTR [esi+0x69],ah
 3101a28:	6c                   	ins    BYTE PTR es:[edi],dx
 3101a29:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101a2b:	61                   	popa   
 3101a2c:	6d                   	ins    DWORD PTR es:[edi],dx
 3101a2d:	65                   	gs
 3101a2e:	25 73 0a 00 72       	and    eax,0x72000a73
 3101a33:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 3101a36:	64 69 72 65 63 74 20 	imul   esi,DWORD PTR fs:[edx+0x65],0x6f207463
 3101a3d:	6f 
 3101a3e:	66                   	data16
 3101a3f:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 3101a42:	70 75                	jo     3101ab9 <kShell+0x891>
 3101a44:	74 20                	je     3101a66 <kShell+0x83e>
 3101a46:	66 61                	popaw  
 3101a48:	69 6c 65 64 2c 20 63 	imul   ebp,DWORD PTR [ebp+eiz*2+0x64],0x6163202c
 3101a4f:	61 
 3101a50:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101a51:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101a52:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101a53:	74 20                	je     3101a75 <kShell+0x84d>
 3101a55:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101a58:	74 69                	je     3101ac3 <kShell+0x89b>
 3101a5a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101a5b:	75 65                	jne    3101ac2 <kShell+0x89a>
 3101a5d:	0a 00                	or     al,BYTE PTR [eax]
 3101a5f:	77 00                	ja     3101a61 <kShell+0x839>
 3101a61:	46                   	inc    esi
 3101a62:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101a63:	72 6b                	jb     3101ad0 <kShell+0x8a8>
 3101a65:	20 65 72             	and    BYTE PTR [ebp+0x72],ah
 3101a68:	72 6f                	jb     3101ad9 <kShell+0x8b1>
 3101a6a:	72 20                	jb     3101a8c <kShell+0x864>
 3101a6c:	25 75 00 65 78       	and    eax,0x78650075
 3101a71:	65 63 3a             	arpl   WORD PTR gs:[edx],di
 3101a74:	20 43 61             	and    BYTE PTR [ebx+0x61],al
 3101a77:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101a78:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101a79:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101a7a:	74 20                	je     3101a9c <kShell+0x874>
 3101a7c:	65                   	gs
 3101a7d:	78 65                	js     3101ae4 <kShell+0x8bc>
 3101a7f:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101a82:	65 20 25 73 0a 00 2f 	and    BYTE PTR gs:0x2f000a73,ah
	...
 3101b85:	00 00                	add    BYTE PTR [eax],al
 3101b87:	00 0a                	add    BYTE PTR [edx],cl
 3101b89:	25 75 20 74 69       	and    eax,0x69742075
 3101b8e:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 3101b91:	0a 00                	or     al,BYTE PTR [eax]
 3101b93:	00 0a                	add    BYTE PTR [edx],cl
 3101b95:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101b97:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101b99:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101b9b:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101b9d:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101b9f:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101ba1:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101ba3:	2a 20                	sub    ah,BYTE PTR [eax]
 3101ba5:	52                   	push   edx
 3101ba6:	45                   	inc    ebp
 3101ba7:	50                   	push   eax
 3101ba8:	45                   	inc    ebp
 3101ba9:	41                   	inc    ecx
 3101baa:	54                   	push   esp
 3101bab:	20 45 58             	and    BYTE PTR [ebp+0x58],al
 3101bae:	45                   	inc    ebp
 3101baf:	43                   	inc    ebx
 3101bb0:	55                   	push   ebp
 3101bb1:	54                   	push   esp
 3101bb2:	49                   	dec    ecx
 3101bb3:	4f                   	dec    edi
 3101bb4:	4e                   	dec    esi
 3101bb5:	20 23                	and    BYTE PTR [ebx],ah
 3101bb7:	25 75 20 6f 66       	and    eax,0x666f2075
 3101bbc:	20 25 75 20 2a 2a    	and    BYTE PTR ds:0x2a2a2075,ah
 3101bc2:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101bc4:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101bc6:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101bc8:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101bca:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101bcc:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101bce:	2a 0a                	sub    cl,BYTE PTR [edx]
 3101bd0:	00 48 65             	add    BYTE PTR [eax+0x65],cl
 3101bd3:	6c                   	ins    BYTE PTR es:[edi],dx
 3101bd4:	70 3a                	jo     3101c10 <kShell+0x9e8>
 3101bd6:	20 25 73 0a 00 09    	and    BYTE PTR ds:0x9000a73,ah
 3101bdc:	25 73 3a 20 25       	and    eax,0x25203a73
 3101be1:	73 0a                	jae    3101bed <kShell+0x9c5>
 3101be3:	00 75 68             	add    BYTE PTR [ebp+0x68],dh
 3101be6:	20 6f 68             	and    BYTE PTR [edi+0x68],ch
 3101be9:	21 00                	and    DWORD PTR [eax],eax
 3101beb:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 3101bee:	71 75                	jno    3101c65 <kShell+0xa3d>
 3101bf0:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 3101bf7:	70 61                	jo     3101c5a <kShell+0xa32>
 3101bf9:	72 61                	jb     3101c5c <kShell+0xa34>
 3101bfb:	6d                   	ins    DWORD PTR es:[edi],dx
 3101bfc:	65                   	gs
 3101bfd:	74 65                	je     3101c64 <kShell+0xa3c>
 3101bff:	72 20                	jb     3101c21 <kShell+0x9f9>
 3101c01:	77 68                	ja     3101c6b <kShell+0xa43>
 3101c03:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 3101c0a:	74 68                	je     3101c74 <kShell+0xa4c>
 3101c0c:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 3101c10:	6d                   	ins    DWORD PTR es:[edi],dx
 3101c11:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 3101c14:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 3101c17:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 3101c1a:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101c1d:	64                   	fs
 3101c1e:	73 20                	jae    3101c40 <kShell+0xa18>
 3101c20:	74 6f                	je     3101c91 <kShell+0xa69>
 3101c22:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3101c25:	65                   	gs
 3101c26:	65                   	gs
 3101c27:	70 0a                	jo     3101c33 <kShell+0xa0b>
 3101c29:	00 00                	add    BYTE PTR [eax],al
 3101c2b:	00 63 6c             	add    BYTE PTR [ebx+0x6c],ah
 3101c2e:	65                   	gs
 3101c2f:	61                   	popa   
 3101c30:	72 00                	jb     3101c32 <kShell+0xa0a>
 3101c32:	43                   	inc    ebx
 3101c33:	6c                   	ins    BYTE PTR es:[edi],dx
 3101c34:	65                   	gs
 3101c35:	61                   	popa   
 3101c36:	72 20                	jb     3101c58 <kShell+0xa30>
 3101c38:	74 68                	je     3101ca2 <kShell+0xa7a>
 3101c3a:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 3101c3e:	72 65                	jb     3101ca5 <kShell+0xa7d>
 3101c40:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101c42:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 3101c45:	76 00                	jbe    3101c47 <kShell+0xa1f>
 3101c47:	50                   	push   eax
 3101c48:	72 69                	jb     3101cb3 <kShell+0xa8b>
 3101c4a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101c4b:	74 20                	je     3101c6d <kShell+0xa45>
 3101c4d:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101c4f:	76 69                	jbe    3101cba <kShell+0xa92>
 3101c51:	72 6f                	jb     3101cc2 <kShell+0xa9a>
 3101c53:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101c54:	6d                   	ins    DWORD PTR es:[edi],dx
 3101c55:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101c57:	74 00                	je     3101c59 <kShell+0xa31>
 3101c59:	65                   	gs
 3101c5a:	78 65                	js     3101cc1 <kShell+0xa99>
 3101c5c:	63 00                	arpl   WORD PTR [eax],ax
 3101c5e:	45                   	inc    ebp
 3101c5f:	78 65                	js     3101cc6 <kShell+0xa9e>
 3101c61:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101c64:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3101c68:	70 72                	jo     3101cdc <kShell+0xab4>
 3101c6a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101c6b:	67 72 61             	addr16 jb 3101ccf <kShell+0xaa7>
 3101c6e:	6d                   	ins    DWORD PTR es:[edi],dx
 3101c6f:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101c72:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3101c79:	20 
 3101c7a:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3101c7e:	6c                   	ins    BYTE PTR es:[edi],dx
 3101c7f:	6c                   	ins    BYTE PTR es:[edi],dx
 3101c80:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101c83:	6c                   	ins    BYTE PTR es:[edi],dx
 3101c84:	70 00                	jo     3101c86 <kShell+0xa5e>
 3101c86:	47                   	inc    edi
 3101c87:	65                   	gs
 3101c88:	74 20                	je     3101caa <kShell+0xa82>
 3101c8a:	68 65 6c 70 20       	push   0x20706c65
 3101c8f:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101c93:	73 20                	jae    3101cb5 <kShell+0xa8d>
 3101c95:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3101c9c:	74 69                	je     3101d07 <kShell+0xadf>
 3101c9e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101c9f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101ca0:	29 00                	sub    DWORD PTR [eax],eax
 3101ca2:	70 77                	jo     3101d1b <kShell+0xaf3>
 3101ca4:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 3101ca8:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3101caf:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3101cb3:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 3101cb7:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3101cbc:	79 00                	jns    3101cbe <kShell+0xa96>
 3101cbe:	72 65                	jb     3101d25 <kShell+0xafd>
 3101cc0:	70 65                	jo     3101d27 <kShell+0xaff>
 3101cc2:	61                   	popa   
 3101cc3:	74 00                	je     3101cc5 <kShell+0xa9d>
 3101cc5:	52                   	push   edx
 3101cc6:	65                   	gs
 3101cc7:	70 65                	jo     3101d2e <kShell+0xb06>
 3101cc9:	61                   	popa   
 3101cca:	74 20                	je     3101cec <kShell+0xac4>
 3101ccc:	61                   	popa   
 3101ccd:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 3101cd0:	6d                   	ins    DWORD PTR es:[edi],dx
 3101cd1:	6d                   	ins    DWORD PTR es:[edi],dx
 3101cd2:	61                   	popa   
 3101cd3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101cd4:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 3101cd8:	74 69                	je     3101d43 <kShell+0xb1b>
 3101cda:	6d                   	ins    DWORD PTR es:[edi],dx
 3101cdb:	65                   	gs
 3101cdc:	73 00                	jae    3101cde <kShell+0xab6>
 3101cde:	73 65                	jae    3101d45 <kShell+0xb1d>
 3101ce0:	74 00                	je     3101ce2 <kShell+0xaba>
 3101ce2:	53                   	push   ebx
 3101ce3:	65                   	gs
 3101ce4:	74 20                	je     3101d06 <kShell+0xade>
 3101ce6:	61                   	popa   
 3101ce7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101ce8:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 3101ceb:	76 69                	jbe    3101d56 <kShell+0xb2e>
 3101ced:	72 6f                	jb     3101d5e <kShell+0xb36>
 3101cef:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101cf0:	6d                   	ins    DWORD PTR es:[edi],dx
 3101cf1:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101cf3:	74 20                	je     3101d15 <kShell+0xaed>
 3101cf5:	76 61                	jbe    3101d58 <kShell+0xb30>
 3101cf7:	72 69                	jb     3101d62 <kShell+0xb3a>
 3101cf9:	61                   	popa   
 3101cfa:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 3101cfe:	73 6c                	jae    3101d6c <kShell+0xb44>
 3101d00:	65                   	gs
 3101d01:	65                   	gs
 3101d02:	70 00                	jo     3101d04 <kShell+0xadc>
 3101d04:	53                   	push   ebx
 3101d05:	6c                   	ins    BYTE PTR es:[edi],dx
 3101d06:	65                   	gs
 3101d07:	65                   	gs
 3101d08:	70 20                	jo     3101d2a <kShell+0xb02>
 3101d0a:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3101d0c:	72 20                	jb     3101d2e <kShell+0xb06>
 3101d0e:	78 20                	js     3101d30 <kShell+0xb08>
 3101d10:	73 65                	jae    3101d77 <kShell+0xb4f>
 3101d12:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101d15:	64                   	fs
 3101d16:	73 00                	jae    3101d18 <kShell+0xaf0>
 3101d18:	74 69                	je     3101d83 <kShell+0xb5b>
 3101d1a:	6d                   	ins    DWORD PTR es:[edi],dx
 3101d1b:	65 00 00             	add    BYTE PTR gs:[eax],al
 3101d1e:	00 00                	add    BYTE PTR [eax],al
 3101d20:	54                   	push   esp
 3101d21:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 3101d28:	72 6f                	jb     3101d99 <kShell+0xb71>
 3101d2a:	67 72 61             	addr16 jb 3101d8e <kShell+0xb66>
 3101d2d:	6d                   	ins    DWORD PTR es:[edi],dx
 3101d2e:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3101d31:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 3101d38:	72 
 3101d39:	75 6e                	jne    3101da9 <kShell+0xb81>
 3101d3b:	73 2e                	jae    3101d6b <kShell+0xb43>
 3101d3d:	0a 09                	or     cl,BYTE PTR [ecx]
 3101d3f:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 3101d42:	61                   	popa   
 3101d43:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 3101d47:	74 69                	je     3101db2 <kShell+0xb8a>
 3101d49:	6d                   	ins    DWORD PTR es:[edi],dx
 3101d4a:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 3101d4e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101d4f:	67 72 61             	addr16 jb 3101db3 <kShell+0xb8b>
 3101d52:	6d                   	ins    DWORD PTR es:[edi],dx
 3101d53:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 3101d56:	61                   	popa   
 3101d57:	72 61                	jb     3101dba <kShell+0xb92>
 3101d59:	6d                   	ins    DWORD PTR es:[edi],dx
 3101d5a:	65                   	gs
 3101d5b:	74 65                	je     3101dc2 <kShell+0xb9a>
 3101d5d:	72 73                	jb     3101dd2 <kShell+0xbaa>
 3101d5f:	5d                   	pop    ebp
 3101d60:	00 3d 00 25 73 20    	add    BYTE PTR ds:0x20732500,bh
 3101d66:	25 73 3e 20 00       	and    eax,0x203e73
 3101d6b:	25 73 00 20 09       	and    eax,0x9200073
 3101d70:	0a 2d 2c 00 6b 53    	or     ch,BYTE PTR ds:0x536b002c
 3101d76:	68 65 6c 6c 00       	push   0x6c6c65
 3101d7b:	43                   	inc    ebx
 3101d7c:	57                   	push   edi
 3101d7d:	44                   	inc    esp
 3101d7e:	00 0a                	add    BYTE PTR [edx],cl
 3101d80:	00 1b                	add    BYTE PTR [ebx],bl
 3101d82:	5b                   	pop    ebx
 3101d83:	31 44 20 1b          	xor    DWORD PTR [eax+eiz*1+0x1b],eax
 3101d87:	5b                   	pop    ebx
 3101d88:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 3101d8c:	5b                   	pop    ebx
 3101d8d:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 3101d91:	5b                   	pop    ebx
 3101d92:	31 43 00             	xor    DWORD PTR [ebx+0x0],eax
 3101d95:	25                   	.byte 0x25
 3101d96:	63 00                	arpl   WORD PTR [eax],ax

Disassembly of section .eh_frame:

03101d98 <.eh_frame>:
 3101d98:	14 00                	adc    al,0x0
 3101d9a:	00 00                	add    BYTE PTR [eax],al
 3101d9c:	00 00                	add    BYTE PTR [eax],al
 3101d9e:	00 00                	add    BYTE PTR [eax],al
 3101da0:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3101da3:	00 01                	add    BYTE PTR [ecx],al
 3101da5:	7c 08                	jl     3101daf <kShell+0xb87>
 3101da7:	01 1b                	add    DWORD PTR [ebx],ebx
 3101da9:	0c 04                	or     al,0x4
 3101dab:	04 88                	add    al,0x88
 3101dad:	01 00                	add    DWORD PTR [eax],eax
 3101daf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101db2:	00 00                	add    BYTE PTR [eax],al
 3101db4:	1c 00                	sbb    al,0x0
 3101db6:	00 00                	add    BYTE PTR [eax],al
 3101db8:	48                   	dec    eax
 3101db9:	e2 ff                	loop   3101dba <kShell+0xb92>
 3101dbb:	ff 19                	call   FWORD PTR [ecx]
 3101dbd:	00 00                	add    BYTE PTR [eax],al
 3101dbf:	00 00                	add    BYTE PTR [eax],al
 3101dc1:	41                   	inc    ecx
 3101dc2:	0e                   	push   cs
 3101dc3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101dc9:	55                   	push   ebp
 3101dca:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101dcd:	04 00                	add    al,0x0
 3101dcf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101dd2:	00 00                	add    BYTE PTR [eax],al
 3101dd4:	3c 00                	cmp    al,0x0
 3101dd6:	00 00                	add    BYTE PTR [eax],al
 3101dd8:	41                   	inc    ecx
 3101dd9:	e2 ff                	loop   3101dda <kShell+0xbb2>
 3101ddb:	ff 4f 00             	dec    DWORD PTR [edi+0x0]
 3101dde:	00 00                	add    BYTE PTR [eax],al
 3101de0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101de3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101de9:	02 4b c5             	add    cl,BYTE PTR [ebx-0x3b]
 3101dec:	0c 04                	or     al,0x4
 3101dee:	04 00                	add    al,0x0
 3101df0:	1c 00                	sbb    al,0x0
 3101df2:	00 00                	add    BYTE PTR [eax],al
 3101df4:	5c                   	pop    esp
 3101df5:	00 00                	add    BYTE PTR [eax],al
 3101df7:	00 70 e2             	add    BYTE PTR [eax-0x1e],dh
 3101dfa:	ff                   	(bad)  
 3101dfb:	ff 5d 01             	call   FWORD PTR [ebp+0x1]
 3101dfe:	00 00                	add    BYTE PTR [eax],al
 3101e00:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101e03:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101e09:	03 59 01             	add    ebx,DWORD PTR [ecx+0x1]
 3101e0c:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101e0f:	04 1c                	add    al,0x1c
 3101e11:	00 00                	add    BYTE PTR [eax],al
 3101e13:	00 7c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bh
 3101e17:	00 ad e3 ff ff 8b    	add    BYTE PTR [ebp-0x7400001d],ch
 3101e1d:	00 00                	add    BYTE PTR [eax],al
 3101e1f:	00 00                	add    BYTE PTR [eax],al
 3101e21:	41                   	inc    ecx
 3101e22:	0e                   	push   cs
 3101e23:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101e29:	02 87 c5 0c 04 04    	add    al,BYTE PTR [edi+0x4040cc5]
 3101e2f:	00 20                	add    BYTE PTR [eax],ah
 3101e31:	00 00                	add    BYTE PTR [eax],al
 3101e33:	00 9c 00 00 00 18 e4 	add    BYTE PTR [eax+eax*1-0x1be80000],bl
 3101e3a:	ff                   	(bad)  
 3101e3b:	ff e2                	jmp    edx
 3101e3d:	03 00                	add    eax,DWORD PTR [eax]
 3101e3f:	00 00                	add    BYTE PTR [eax],al
 3101e41:	41                   	inc    ecx
 3101e42:	0e                   	push   cs
 3101e43:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101e49:	47                   	inc    edi
 3101e4a:	87 03                	xchg   DWORD PTR [ebx],eax
 3101e4c:	03 d7                	add    edx,edi
 3101e4e:	03 c5                	add    eax,ebp
 3101e50:	c7                   	(bad)  
 3101e51:	0c 04                	or     al,0x4
 3101e53:	04 1c                	add    al,0x1c
 3101e55:	00 00                	add    BYTE PTR [eax],al
 3101e57:	00 c0                	add    al,al
 3101e59:	00 00                	add    BYTE PTR [eax],al
 3101e5b:	00 d6                	add    dh,dl
 3101e5d:	e7 ff                	out    0xff,eax
 3101e5f:	ff                   	(bad)  
 3101e60:	3e 00 00             	add    BYTE PTR ds:[eax],al
 3101e63:	00 00                	add    BYTE PTR [eax],al
 3101e65:	41                   	inc    ecx
 3101e66:	0e                   	push   cs
 3101e67:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101e6d:	7a c5                	jp     3101e34 <kShell+0xc0c>
 3101e6f:	0c 04                	or     al,0x4
 3101e71:	04 00                	add    al,0x0
 3101e73:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101e76:	00 00                	add    BYTE PTR [eax],al
 3101e78:	e0 00                	loopne 3101e7a <kShell+0xc52>
 3101e7a:	00 00                	add    BYTE PTR [eax],al
 3101e7c:	f4                   	hlt    
 3101e7d:	e7 ff                	out    0xff,eax
 3101e7f:	ff c7                	inc    edi
 3101e81:	00 00                	add    BYTE PTR [eax],al
 3101e83:	00 00                	add    BYTE PTR [eax],al
 3101e85:	41                   	inc    ecx
 3101e86:	0e                   	push   cs
 3101e87:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101e8d:	02 c3                	add    al,bl
 3101e8f:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101e92:	04 00                	add    al,0x0
 3101e94:	1c 00                	sbb    al,0x0
 3101e96:	00 00                	add    BYTE PTR [eax],al
 3101e98:	00 01                	add    BYTE PTR [ecx],al
 3101e9a:	00 00                	add    BYTE PTR [eax],al
 3101e9c:	9b                   	fwait
 3101e9d:	e8 ff ff 1a 00       	call   32b1ea1 <kCmdline+0x19f601>
 3101ea2:	00 00                	add    BYTE PTR [eax],al
 3101ea4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101ea7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101ead:	56                   	push   esi
 3101eae:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101eb1:	04 00                	add    al,0x0
 3101eb3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101eb6:	00 00                	add    BYTE PTR [eax],al
 3101eb8:	20 01                	and    BYTE PTR [ecx],al
 3101eba:	00 00                	add    BYTE PTR [eax],al
 3101ebc:	95                   	xchg   ebp,eax
 3101ebd:	e8 ff ff 58 00       	call   3691ec1 <kCmdline+0x57f621>
 3101ec2:	00 00                	add    BYTE PTR [eax],al
 3101ec4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101ec7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101ecd:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3101ed1:	04 04                	add    al,0x4
 3101ed3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101ed6:	00 00                	add    BYTE PTR [eax],al
 3101ed8:	40                   	inc    eax
 3101ed9:	01 00                	add    DWORD PTR [eax],eax
 3101edb:	00 cd                	add    ch,cl
 3101edd:	e8 ff ff ce 00       	call   3df1ee1 <kCmdline+0xcdf641>
 3101ee2:	00 00                	add    BYTE PTR [eax],al
 3101ee4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101ee7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101eed:	02 ca                	add    cl,dl
 3101eef:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101ef2:	04 00                	add    al,0x0
 3101ef4:	1c 00                	sbb    al,0x0
 3101ef6:	00 00                	add    BYTE PTR [eax],al
 3101ef8:	60                   	pusha  
 3101ef9:	01 00                	add    DWORD PTR [eax],eax
 3101efb:	00 7b e9             	add    BYTE PTR [ebx-0x17],bh
 3101efe:	ff                   	(bad)  
 3101eff:	ff 4e 00             	dec    DWORD PTR [esi+0x0]
 3101f02:	00 00                	add    BYTE PTR [eax],al
 3101f04:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101f07:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101f0d:	02 4a c5             	add    cl,BYTE PTR [edx-0x3b]
 3101f10:	0c 04                	or     al,0x4
 3101f12:	04 00                	add    al,0x0
 3101f14:	20 00                	and    BYTE PTR [eax],al
 3101f16:	00 00                	add    BYTE PTR [eax],al
 3101f18:	80 01 00             	add    BYTE PTR [ecx],0x0
 3101f1b:	00 a9 e9 ff ff 11    	add    BYTE PTR [ecx+0x11ffffe9],ch
 3101f21:	01 00                	add    DWORD PTR [eax],eax
 3101f23:	00 00                	add    BYTE PTR [eax],al
 3101f25:	41                   	inc    ecx
 3101f26:	0e                   	push   cs
 3101f27:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101f2d:	47                   	inc    edi
 3101f2e:	83 03 03             	add    DWORD PTR [ebx],0x3
 3101f31:	06                   	push   es
 3101f32:	01 c5                	add    ebp,eax
 3101f34:	c3                   	ret    
 3101f35:	0c 04                	or     al,0x4
 3101f37:	04 1c                	add    al,0x1c
 3101f39:	00 00                	add    BYTE PTR [eax],al
 3101f3b:	00 a4 01 00 00 98 ea 	add    BYTE PTR [ecx+eax*1-0x15680000],ah
 3101f42:	ff                   	(bad)  
 3101f43:	ff 06                	inc    DWORD PTR [esi]
 3101f45:	00 00                	add    BYTE PTR [eax],al
 3101f47:	00 00                	add    BYTE PTR [eax],al
 3101f49:	41                   	inc    ecx
 3101f4a:	0e                   	push   cs
 3101f4b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101f51:	42                   	inc    edx
 3101f52:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101f55:	04 00                	add    al,0x0
 3101f57:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101f5a:	00 00                	add    BYTE PTR [eax],al
 3101f5c:	c4 01                	les    eax,FWORD PTR [ecx]
 3101f5e:	00 00                	add    BYTE PTR [eax],al
 3101f60:	7e ea                	jle    3101f4c <kShell+0xd24>
 3101f62:	ff                   	(bad)  
 3101f63:	ff 2f                	jmp    FWORD PTR [edi]
 3101f65:	00 00                	add    BYTE PTR [eax],al
 3101f67:	00 00                	add    BYTE PTR [eax],al
 3101f69:	41                   	inc    ecx
 3101f6a:	0e                   	push   cs
 3101f6b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101f71:	6b c5 0c             	imul   eax,ebp,0xc
 3101f74:	04 04                	add    al,0x4
 3101f76:	00 00                	add    BYTE PTR [eax],al
 3101f78:	1c 00                	sbb    al,0x0
 3101f7a:	00 00                	add    BYTE PTR [eax],al
 3101f7c:	e4 01                	in     al,0x1
 3101f7e:	00 00                	add    BYTE PTR [eax],al
 3101f80:	8d                   	(bad)  
 3101f81:	ea ff ff db 00 00 00 	jmp    0x0:0xdbffff
 3101f88:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101f8b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101f91:	02 d7                	add    dl,bh
 3101f93:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101f96:	04 00                	add    al,0x0
 3101f98:	20 00                	and    BYTE PTR [eax],al
 3101f9a:	00 00                	add    BYTE PTR [eax],al
 3101f9c:	04 02                	add    al,0x2
 3101f9e:	00 00                	add    BYTE PTR [eax],al
 3101fa0:	48                   	dec    eax
 3101fa1:	eb ff                	jmp    3101fa2 <kShell+0xd7a>
 3101fa3:	ff b4 00 00 00 00 41 	push   DWORD PTR [eax+eax*1+0x41000000]
 3101faa:	0e                   	push   cs
 3101fab:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101fb1:	44                   	inc    esp
 3101fb2:	83 03 02             	add    DWORD PTR [ebx],0x2
 3101fb5:	ac                   	lods   al,BYTE PTR ds:[esi]
 3101fb6:	c5 c3 0c             	(bad)  
 3101fb9:	04 04                	add    al,0x4
 3101fbb:	00 20                	add    BYTE PTR [eax],ah
 3101fbd:	00 00                	add    BYTE PTR [eax],al
 3101fbf:	00 28                	add    BYTE PTR [eax],ch
 3101fc1:	02 00                	add    al,BYTE PTR [eax]
 3101fc3:	00 d8                	add    al,bl
 3101fc5:	eb ff                	jmp    3101fc6 <kShell+0xd9e>
 3101fc7:	ff a9 01 00 00 00    	jmp    FWORD PTR [ecx+0x1]
 3101fcd:	41                   	inc    ecx
 3101fce:	0e                   	push   cs
 3101fcf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101fd5:	44                   	inc    esp
 3101fd6:	83 03 03             	add    DWORD PTR [ebx],0x3
 3101fd9:	a1 01 c5 c3 0c       	mov    eax,ds:0xcc3c501
 3101fde:	04 04                	add    al,0x4
 3101fe0:	1c 00                	sbb    al,0x0
 3101fe2:	00 00                	add    BYTE PTR [eax],al
 3101fe4:	4c                   	dec    esp
 3101fe5:	02 00                	add    al,BYTE PTR [eax]
 3101fe7:	00 5d ed             	add    BYTE PTR [ebp-0x13],bl
 3101fea:	ff                   	(bad)  
 3101feb:	ff 69 00             	jmp    FWORD PTR [ecx+0x0]
 3101fee:	00 00                	add    BYTE PTR [eax],al
 3101ff0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101ff3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101ff9:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3101ffc:	0c 04                	or     al,0x4
 3101ffe:	04 00                	add    al,0x0
 3102000:	1c 00                	sbb    al,0x0
 3102002:	00 00                	add    BYTE PTR [eax],al
 3102004:	6c                   	ins    BYTE PTR es:[edi],dx
 3102005:	02 00                	add    al,BYTE PTR [eax]
 3102007:	00 a6 ed ff ff 8e    	add    BYTE PTR [esi-0x71000013],ah
 310200d:	02 00                	add    al,BYTE PTR [eax]
 310200f:	00 00                	add    BYTE PTR [eax],al
 3102011:	41                   	inc    ecx
 3102012:	0e                   	push   cs
 3102013:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102019:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 310201f:	04 20                	add    al,0x20
 3102021:	00 00                	add    BYTE PTR [eax],al
 3102023:	00 8c 02 00 00 14 f0 	add    BYTE PTR [edx+eax*1-0xfec0000],cl
 310202a:	ff                   	(bad)  
 310202b:	ff 76 00             	push   DWORD PTR [esi+0x0]
 310202e:	00 00                	add    BYTE PTR [eax],al
 3102030:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3102033:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102039:	44                   	inc    esp
 310203a:	83 03 02             	add    DWORD PTR [ebx],0x2
 310203d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310203e:	c5 c3 0c             	(bad)  
 3102041:	04 04                	add    al,0x4
 3102043:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102046:	00 00                	add    BYTE PTR [eax],al
 3102048:	b0 02                	mov    al,0x2
 310204a:	00 00                	add    BYTE PTR [eax],al
 310204c:	66                   	data16
 310204d:	f0 ff                	lock (bad) 
 310204f:	ff                   	(bad)  
 3102050:	3d 00 00 00 00       	cmp    eax,0x0
 3102055:	41                   	inc    ecx
 3102056:	0e                   	push   cs
 3102057:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310205d:	79 c5                	jns    3102024 <kShell+0xdfc>
 310205f:	0c 04                	or     al,0x4
 3102061:	04 00                	add    al,0x0
 3102063:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102066:	00 00                	add    BYTE PTR [eax],al
 3102068:	d0 02                	rol    BYTE PTR [edx],1
 310206a:	00 00                	add    BYTE PTR [eax],al
 310206c:	83 f0 ff             	xor    eax,0xffffffff
 310206f:	ff 8c 00 00 00 00 41 	dec    DWORD PTR [eax+eax*1+0x41000000]
 3102076:	0e                   	push   cs
 3102077:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310207d:	02 88 c5 0c 04 04    	add    cl,BYTE PTR [eax+0x4040cc5]
 3102083:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102086:	00 00                	add    BYTE PTR [eax],al
 3102088:	f0 02 00             	lock add al,BYTE PTR [eax]
 310208b:	00 ef                	add    bh,ch
 310208d:	f0 ff                	lock (bad) 
 310208f:	ff 2e                	jmp    FWORD PTR [esi]
 3102091:	00 00                	add    BYTE PTR [eax],al
 3102093:	00 00                	add    BYTE PTR [eax],al
 3102095:	41                   	inc    ecx
 3102096:	0e                   	push   cs
 3102097:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310209d:	6a c5                	push   0xffffffc5
 310209f:	0c 04                	or     al,0x4
 31020a1:	04 00                	add    al,0x0
 31020a3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31020a6:	00 00                	add    BYTE PTR [eax],al
 31020a8:	10 03                	adc    BYTE PTR [ebx],al
 31020aa:	00 00                	add    BYTE PTR [eax],al
 31020ac:	fd                   	std    
 31020ad:	f0 ff                	lock (bad) 
 31020af:	ff 23                	jmp    DWORD PTR [ebx]
 31020b1:	00 00                	add    BYTE PTR [eax],al
 31020b3:	00 00                	add    BYTE PTR [eax],al
 31020b5:	41                   	inc    ecx
 31020b6:	0e                   	push   cs
 31020b7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31020bd:	5f                   	pop    edi
 31020be:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31020c1:	04 00                	add    al,0x0
 31020c3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31020c6:	00 00                	add    BYTE PTR [eax],al
 31020c8:	30 03                	xor    BYTE PTR [ebx],al
 31020ca:	00 00                	add    BYTE PTR [eax],al
 31020cc:	00 f1                	add    cl,dh
 31020ce:	ff                   	(bad)  
 31020cf:	ff 26                	jmp    DWORD PTR [esi]
 31020d1:	00 00                	add    BYTE PTR [eax],al
 31020d3:	00 00                	add    BYTE PTR [eax],al
 31020d5:	41                   	inc    ecx
 31020d6:	0e                   	push   cs
 31020d7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31020dd:	62                   	(bad)  
 31020de:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31020e1:	04 00                	add    al,0x0
 31020e3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31020e6:	00 00                	add    BYTE PTR [eax],al
 31020e8:	50                   	push   eax
 31020e9:	03 00                	add    eax,DWORD PTR [eax]
 31020eb:	00 06                	add    BYTE PTR [esi],al
 31020ed:	f1                   	icebp  
 31020ee:	ff                   	(bad)  
 31020ef:	ff 16                	call   DWORD PTR [esi]
 31020f1:	00 00                	add    BYTE PTR [eax],al
 31020f3:	00 00                	add    BYTE PTR [eax],al
 31020f5:	41                   	inc    ecx
 31020f6:	0e                   	push   cs
 31020f7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31020fd:	52                   	push   edx
 31020fe:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102101:	04 00                	add    al,0x0
 3102103:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102106:	00 00                	add    BYTE PTR [eax],al
 3102108:	70 03                	jo     310210d <kShell+0xee5>
 310210a:	00 00                	add    BYTE PTR [eax],al
 310210c:	fc                   	cld    
 310210d:	f0 ff                	lock (bad) 
 310210f:	ff 20                	jmp    DWORD PTR [eax]
 3102111:	00 00                	add    BYTE PTR [eax],al
 3102113:	00 00                	add    BYTE PTR [eax],al
 3102115:	41                   	inc    ecx
 3102116:	0e                   	push   cs
 3102117:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310211d:	5c                   	pop    esp
 310211e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102121:	04 00                	add    al,0x0
 3102123:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102126:	00 00                	add    BYTE PTR [eax],al
 3102128:	90                   	nop
 3102129:	03 00                	add    eax,DWORD PTR [eax]
 310212b:	00 fc                	add    ah,bh
 310212d:	f0 ff                	lock (bad) 
 310212f:	ff 30                	push   DWORD PTR [eax]
 3102131:	04 00                	add    al,0x0
 3102133:	00 00                	add    BYTE PTR [eax],al
 3102135:	41                   	inc    ecx
 3102136:	0e                   	push   cs
 3102137:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310213d:	03 2c 04             	add    ebp,DWORD PTR [esp+eax*1]
 3102140:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102143:	04                   	.byte 0x4

Disassembly of section .interp:

03102144 <.interp>:
 3102144:	2f                   	das    
 3102145:	6c                   	ins    BYTE PTR es:[edi],dx
 3102146:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 310214d:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3102154:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03102158 <.dynsym>:
	...
 3102168:	09 00                	or     DWORD PTR [eax],eax
	...
 3102172:	00 00                	add    BYTE PTR [eax],al
 3102174:	12 00                	adc    al,BYTE PTR [eax]
 3102176:	00 00                	add    BYTE PTR [eax],al
 3102178:	10 00                	adc    BYTE PTR [eax],al
	...
 3102182:	00 00                	add    BYTE PTR [eax],al
 3102184:	12 00                	adc    al,BYTE PTR [eax]
 3102186:	00 00                	add    BYTE PTR [eax],al
 3102188:	18 00                	sbb    BYTE PTR [eax],al
	...
 3102192:	00 00                	add    BYTE PTR [eax],al
 3102194:	12 00                	adc    al,BYTE PTR [eax]
 3102196:	00 00                	add    BYTE PTR [eax],al
 3102198:	1e                   	push   ds
	...
 31021a1:	00 00                	add    BYTE PTR [eax],al
 31021a3:	00 12                	add    BYTE PTR [edx],dl
 31021a5:	00 00                	add    BYTE PTR [eax],al
 31021a7:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
 31021ad:	00 00                	add    BYTE PTR [eax],al
 31021af:	00 00                	add    BYTE PTR [eax],al
 31021b1:	00 00                	add    BYTE PTR [eax],al
 31021b3:	00 12                	add    BYTE PTR [edx],dl
 31021b5:	00 00                	add    BYTE PTR [eax],al
 31021b7:	00 2e                	add    BYTE PTR [esi],ch
	...
 31021c1:	00 00                	add    BYTE PTR [eax],al
 31021c3:	00 12                	add    BYTE PTR [edx],dl
 31021c5:	00 00                	add    BYTE PTR [eax],al
 31021c7:	00 35 00 00 00 00    	add    BYTE PTR ds:0x0,dh
 31021cd:	00 00                	add    BYTE PTR [eax],al
 31021cf:	00 00                	add    BYTE PTR [eax],al
 31021d1:	00 00                	add    BYTE PTR [eax],al
 31021d3:	00 12                	add    BYTE PTR [edx],dl
 31021d5:	00 00                	add    BYTE PTR [eax],al
 31021d7:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
	...
 31021e2:	00 00                	add    BYTE PTR [eax],al
 31021e4:	12 00                	adc    al,BYTE PTR [eax]
 31021e6:	00 00                	add    BYTE PTR [eax],al
 31021e8:	43                   	inc    ebx
	...
 31021f1:	00 00                	add    BYTE PTR [eax],al
 31021f3:	00 12                	add    BYTE PTR [edx],dl
 31021f5:	00 00                	add    BYTE PTR [eax],al
 31021f7:	00 49 00             	add    BYTE PTR [ecx+0x0],cl
	...
 3102202:	00 00                	add    BYTE PTR [eax],al
 3102204:	12 00                	adc    al,BYTE PTR [eax]
 3102206:	00 00                	add    BYTE PTR [eax],al
 3102208:	57                   	push   edi
	...
 3102211:	00 00                	add    BYTE PTR [eax],al
 3102213:	00 12                	add    BYTE PTR [edx],dl
 3102215:	00 00                	add    BYTE PTR [eax],al
 3102217:	00 5f 00             	add    BYTE PTR [edi+0x0],bl
	...
 3102222:	00 00                	add    BYTE PTR [eax],al
 3102224:	12 00                	adc    al,BYTE PTR [eax]
 3102226:	00 00                	add    BYTE PTR [eax],al
 3102228:	64 00 00             	add    BYTE PTR fs:[eax],al
	...
 3102233:	00 12                	add    BYTE PTR [edx],dl
 3102235:	00 00                	add    BYTE PTR [eax],al
 3102237:	00 6b 00             	add    BYTE PTR [ebx+0x0],ch
	...
 3102242:	00 00                	add    BYTE PTR [eax],al
 3102244:	12 00                	adc    al,BYTE PTR [eax]
 3102246:	00 00                	add    BYTE PTR [eax],al
 3102248:	74 00                	je     310224a <kShell+0x1022>
	...
 3102252:	00 00                	add    BYTE PTR [eax],al
 3102254:	12 00                	adc    al,BYTE PTR [eax]
 3102256:	00 00                	add    BYTE PTR [eax],al
 3102258:	79 00                	jns    310225a <kShell+0x1032>
	...
 3102262:	00 00                	add    BYTE PTR [eax],al
 3102264:	12 00                	adc    al,BYTE PTR [eax]
 3102266:	00 00                	add    BYTE PTR [eax],al
 3102268:	80 00 00             	add    BYTE PTR [eax],0x0
	...
 3102273:	00 12                	add    BYTE PTR [edx],dl
 3102275:	00 00                	add    BYTE PTR [eax],al
 3102277:	00 85 00 00 00 00    	add    BYTE PTR [ebp+0x0],al
 310227d:	00 00                	add    BYTE PTR [eax],al
 310227f:	00 00                	add    BYTE PTR [eax],al
 3102281:	00 00                	add    BYTE PTR [eax],al
 3102283:	00 12                	add    BYTE PTR [edx],dl
 3102285:	00 00                	add    BYTE PTR [eax],al
 3102287:	00 8d 00 00 00 00    	add    BYTE PTR [ebp+0x0],cl
 310228d:	00 00                	add    BYTE PTR [eax],al
 310228f:	00 00                	add    BYTE PTR [eax],al
 3102291:	00 00                	add    BYTE PTR [eax],al
 3102293:	00 12                	add    BYTE PTR [edx],dl
 3102295:	00 00                	add    BYTE PTR [eax],al
 3102297:	00 95 00 00 00 00    	add    BYTE PTR [ebp+0x0],dl
 310229d:	00 00                	add    BYTE PTR [eax],al
 310229f:	00 00                	add    BYTE PTR [eax],al
 31022a1:	00 00                	add    BYTE PTR [eax],al
 31022a3:	00 12                	add    BYTE PTR [edx],dl
 31022a5:	00 00                	add    BYTE PTR [eax],al
 31022a7:	00 9c 00 00 00 00 00 	add    BYTE PTR [eax+eax*1+0x0],bl
 31022ae:	00 00                	add    BYTE PTR [eax],al
 31022b0:	00 00                	add    BYTE PTR [eax],al
 31022b2:	00 00                	add    BYTE PTR [eax],al
 31022b4:	12 00                	adc    al,BYTE PTR [eax]
 31022b6:	00 00                	add    BYTE PTR [eax],al
 31022b8:	a3 00 00 00 00       	mov    ds:0x0,eax
 31022bd:	00 00                	add    BYTE PTR [eax],al
 31022bf:	00 00                	add    BYTE PTR [eax],al
 31022c1:	00 00                	add    BYTE PTR [eax],al
 31022c3:	00 12                	add    BYTE PTR [edx],dl
 31022c5:	00 00                	add    BYTE PTR [eax],al
 31022c7:	00 a8 00 00 00 00    	add    BYTE PTR [eax+0x0],ch
 31022cd:	00 00                	add    BYTE PTR [eax],al
 31022cf:	00 00                	add    BYTE PTR [eax],al
 31022d1:	00 00                	add    BYTE PTR [eax],al
 31022d3:	00 12                	add    BYTE PTR [edx],dl
 31022d5:	00 00                	add    BYTE PTR [eax],al
 31022d7:	00 af 00 00 00 00    	add    BYTE PTR [edi+0x0],ch
 31022dd:	00 00                	add    BYTE PTR [eax],al
 31022df:	00 00                	add    BYTE PTR [eax],al
 31022e1:	00 00                	add    BYTE PTR [eax],al
 31022e3:	00 12                	add    BYTE PTR [edx],dl
 31022e5:	00 00                	add    BYTE PTR [eax],al
 31022e7:	00 b7 00 00 00 00    	add    BYTE PTR [edi+0x0],dh
 31022ed:	00 00                	add    BYTE PTR [eax],al
 31022ef:	00 00                	add    BYTE PTR [eax],al
 31022f1:	00 00                	add    BYTE PTR [eax],al
 31022f3:	00 12                	add    BYTE PTR [edx],dl
 31022f5:	00 00                	add    BYTE PTR [eax],al
 31022f7:	00 be 00 00 00 00    	add    BYTE PTR [esi+0x0],bh
 31022fd:	00 00                	add    BYTE PTR [eax],al
 31022ff:	00 00                	add    BYTE PTR [eax],al
 3102301:	00 00                	add    BYTE PTR [eax],al
 3102303:	00 12                	add    BYTE PTR [edx],dl
 3102305:	00 00                	add    BYTE PTR [eax],al
 3102307:	00 cb                	add    bl,cl
	...
 3102311:	00 00                	add    BYTE PTR [eax],al
 3102313:	00 12                	add    BYTE PTR [edx],dl
 3102315:	00 00                	add    BYTE PTR [eax],al
 3102317:	00 d0                	add    al,dl
	...
 3102321:	00 00                	add    BYTE PTR [eax],al
 3102323:	00 12                	add    BYTE PTR [edx],dl
 3102325:	00 00                	add    BYTE PTR [eax],al
 3102327:	00 d8                	add    al,bl
	...
 3102331:	00 00                	add    BYTE PTR [eax],al
 3102333:	00 12                	add    BYTE PTR [edx],dl
 3102335:	00 00                	add    BYTE PTR [eax],al
 3102337:	00 dd                	add    ch,bl
	...
 3102341:	00 00                	add    BYTE PTR [eax],al
 3102343:	00 12                	add    BYTE PTR [edx],dl
 3102345:	00 00                	add    BYTE PTR [eax],al
 3102347:	00 e2                	add    dl,ah
	...
 3102351:	00 00                	add    BYTE PTR [eax],al
 3102353:	00 12                	add    BYTE PTR [edx],dl
 3102355:	00 00                	add    BYTE PTR [eax],al
 3102357:	00 e9                	add    cl,ch
	...
 3102361:	00 00                	add    BYTE PTR [eax],al
 3102363:	00 12                	add    BYTE PTR [edx],dl
 3102365:	00 00                	add    BYTE PTR [eax],al
 3102367:	00 ef                	add    bh,ch
	...
 3102371:	00 00                	add    BYTE PTR [eax],al
 3102373:	00 12                	add    BYTE PTR [edx],dl
 3102375:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

03102378 <.dynstr>:
 3102378:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 310237c:	63 2e                	arpl   WORD PTR [esi],bp
 310237e:	73 6f                	jae    31023ef <kShell+0x11c7>
 3102380:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3102383:	72 63                	jb     31023e8 <kShell+0x11c0>
 3102385:	70 79                	jo     3102400 <kShell+0x11d8>
 3102387:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 310238a:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3102391:	72 
 3102392:	69 6e 74 00 70 72 69 	imul   ebp,DWORD PTR [esi+0x74],0x69727000
 3102399:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310239a:	74 66                	je     3102402 <kShell+0x11da>
 310239c:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 310239f:	73 65                	jae    3102406 <kShell+0x11de>
 31023a1:	74 52                	je     31023f5 <kShell+0x11cd>
 31023a3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31023a4:	77 00                	ja     31023a6 <kShell+0x117e>
 31023a6:	67                   	addr16
 31023a7:	65                   	gs
 31023a8:	74 65                	je     310240f <kShell+0x11e7>
 31023aa:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31023ab:	76 00                	jbe    31023ad <kShell+0x1185>
 31023ad:	6d                   	ins    DWORD PTR es:[edi],dx
 31023ae:	65                   	gs
 31023af:	6d                   	ins    DWORD PTR es:[edi],dx
 31023b0:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 31023b3:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 31023b6:	6c                   	ins    BYTE PTR es:[edi],dx
 31023b7:	6c                   	ins    BYTE PTR es:[edi],dx
 31023b8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31023b9:	63 00                	arpl   WORD PTR [eax],ax
 31023bb:	73 6c                	jae    3102429 <kShell+0x1201>
 31023bd:	65                   	gs
 31023be:	65                   	gs
 31023bf:	70 00                	jo     31023c1 <kShell+0x1199>
 31023c1:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 31023c4:	6c                   	ins    BYTE PTR es:[edi],dx
 31023c5:	69 6e 65 54 6f 41 72 	imul   ebp,DWORD PTR [esi+0x65],0x72416f54
 31023cc:	67 76 00             	addr16 jbe 31023cf <kShell+0x11a7>
 31023cf:	73 74                	jae    3102445 <kShell+0x121d>
 31023d1:	72 74                	jb     3102447 <kShell+0x121f>
 31023d3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31023d4:	75 6c                	jne    3102442 <kShell+0x121a>
 31023d6:	00 69 74             	add    BYTE PTR [ecx+0x74],ch
 31023d9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31023da:	61                   	popa   
 31023db:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31023de:	72 63                	jb     3102443 <kShell+0x121b>
 31023e0:	61                   	popa   
 31023e1:	74 00                	je     31023e3 <kShell+0x11bb>
 31023e3:	67                   	addr16
 31023e4:	65                   	gs
 31023e5:	74 74                	je     310245b <kShell+0x1233>
 31023e7:	69 63 6b 73 00 65 78 	imul   esp,DWORD PTR [ebx+0x6b],0x78650073
 31023ee:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 31023f1:	73 74                	jae    3102467 <kShell+0x123f>
 31023f3:	72 73                	jb     3102468 <kShell+0x1240>
 31023f5:	74 72                	je     3102469 <kShell+0x1241>
 31023f7:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 31023fa:	61                   	popa   
 31023fb:	64 00 73 74          	add    BYTE PTR fs:[ebx+0x74],dh
 31023ff:	72 6e                	jb     310246f <kShell+0x1247>
 3102401:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 3102404:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3102407:	72 6e                	jb     3102477 <kShell+0x124f>
 3102409:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 310240c:	00 73 65             	add    BYTE PTR [ebx+0x65],dh
 310240f:	74 65                	je     3102476 <kShell+0x124e>
 3102411:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102412:	76 00                	jbe    3102414 <kShell+0x11ec>
 3102414:	73 74                	jae    310248a <kShell+0x1262>
 3102416:	72 74                	jb     310248c <kShell+0x1264>
 3102418:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3102419:	6b 00 66             	imul   eax,DWORD PTR [eax],0x66
 310241c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310241d:	72 6b                	jb     310248a <kShell+0x1262>
 310241f:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3102422:	6d                   	ins    DWORD PTR es:[edi],dx
 3102423:	73 65                	jae    310248a <kShell+0x1262>
 3102425:	74 00                	je     3102427 <kShell+0x11ff>
 3102427:	73 74                	jae    310249d <kShell+0x1275>
 3102429:	72 74                	jb     310249f <kShell+0x1277>
 310242b:	72 69                	jb     3102496 <kShell+0x126e>
 310242d:	6d                   	ins    DWORD PTR es:[edi],dx
 310242e:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3102431:	74 63                	je     3102496 <kShell+0x126e>
 3102433:	77 64                	ja     3102499 <kShell+0x1271>
 3102435:	00 6d 6f             	add    BYTE PTR [ebp+0x6f],ch
 3102438:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
 310243f:	6e 
 3102440:	61                   	popa   
 3102441:	6c                   	ins    BYTE PTR es:[edi],dx
 3102442:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3102445:	61                   	popa   
 3102446:	74 00                	je     3102448 <kShell+0x1220>
 3102448:	66                   	data16
 3102449:	72 65                	jb     31024b0 <kShell+0x1288>
 310244b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310244c:	70 65                	jo     31024b3 <kShell+0x128b>
 310244e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310244f:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3102452:	69 74 00 61 74 6f 69 	imul   esi,DWORD PTR [eax+eax*1+0x61],0x696f74
 3102459:	00 
 310245a:	73 74                	jae    31024d0 <kShell+0x12a8>
 310245c:	72 6c                	jb     31024ca <kShell+0x12a2>
 310245e:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3102460:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3102463:	65 63 61 00          	arpl   WORD PTR gs:[ecx+0x0],sp
 3102467:	66                   	data16
 3102468:	72 65                	jb     31024cf <kShell+0x12a7>
 310246a:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 310246d:	2e                   	cs
 310246e:	2f                   	das    
 310246f:	6c                   	ins    BYTE PTR es:[edi],dx
 3102470:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3102477:	4f                   	dec    edi
 3102478:	53                   	push   ebx
 3102479:	2f                   	das    
 310247a:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3102481:	62 
 3102482:	75 67                	jne    31024eb <kShell+0x12c3>
 3102484:	2f                   	das    
 3102485:	47                   	inc    edi
 3102486:	4e                   	dec    esi
 3102487:	55                   	push   ebp
 3102488:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 310248d:	78 00                	js     310248f <kShell+0x1267>

Disassembly of section .hash:

03102490 <.hash>:
 3102490:	11 00                	adc    DWORD PTR [eax],eax
 3102492:	00 00                	add    BYTE PTR [eax],al
 3102494:	22 00                	and    al,BYTE PTR [eax]
 3102496:	00 00                	add    BYTE PTR [eax],al
 3102498:	10 00                	adc    BYTE PTR [eax],al
 310249a:	00 00                	add    BYTE PTR [eax],al
 310249c:	1c 00                	sbb    al,0x0
 310249e:	00 00                	add    BYTE PTR [eax],al
 31024a0:	16                   	push   ss
 31024a1:	00 00                	add    BYTE PTR [eax],al
 31024a3:	00 1b                	add    BYTE PTR [ebx],bl
 31024a5:	00 00                	add    BYTE PTR [eax],al
 31024a7:	00 1f                	add    BYTE PTR [edi],bl
 31024a9:	00 00                	add    BYTE PTR [eax],al
 31024ab:	00 0d 00 00 00 13    	add    BYTE PTR ds:0x13000000,cl
 31024b1:	00 00                	add    BYTE PTR [eax],al
 31024b3:	00 11                	add    BYTE PTR [ecx],dl
 31024b5:	00 00                	add    BYTE PTR [eax],al
 31024b7:	00 07                	add    BYTE PTR [edi],al
 31024b9:	00 00                	add    BYTE PTR [eax],al
 31024bb:	00 00                	add    BYTE PTR [eax],al
 31024bd:	00 00                	add    BYTE PTR [eax],al
 31024bf:	00 18                	add    BYTE PTR [eax],bl
 31024c1:	00 00                	add    BYTE PTR [eax],al
 31024c3:	00 1a                	add    BYTE PTR [edx],bl
 31024c5:	00 00                	add    BYTE PTR [eax],al
 31024c7:	00 21                	add    BYTE PTR [ecx],ah
 31024c9:	00 00                	add    BYTE PTR [eax],al
 31024cb:	00 1e                	add    BYTE PTR [esi],bl
 31024cd:	00 00                	add    BYTE PTR [eax],al
 31024cf:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 31024d2:	00 00                	add    BYTE PTR [eax],al
 31024d4:	05 00 00 00 15       	add    eax,0x15000000
	...
 31024f5:	00 00                	add    BYTE PTR [eax],al
 31024f7:	00 06                	add    BYTE PTR [esi],al
 31024f9:	00 00                	add    BYTE PTR [eax],al
 31024fb:	00 04 00             	add    BYTE PTR [eax+eax*1],al
	...
 3102512:	00 00                	add    BYTE PTR [eax],al
 3102514:	09 00                	or     DWORD PTR [eax],eax
 3102516:	00 00                	add    BYTE PTR [eax],al
 3102518:	0e                   	push   cs
 3102519:	00 00                	add    BYTE PTR [eax],al
 310251b:	00 0f                	add    BYTE PTR [edi],cl
 310251d:	00 00                	add    BYTE PTR [eax],al
 310251f:	00 03                	add    BYTE PTR [ebx],al
 3102521:	00 00                	add    BYTE PTR [eax],al
 3102523:	00 00                	add    BYTE PTR [eax],al
 3102525:	00 00                	add    BYTE PTR [eax],al
 3102527:	00 0a                	add    BYTE PTR [edx],cl
 3102529:	00 00                	add    BYTE PTR [eax],al
 310252b:	00 02                	add    BYTE PTR [edx],al
	...
 3102535:	00 00                	add    BYTE PTR [eax],al
 3102537:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
 310253a:	00 00                	add    BYTE PTR [eax],al
 310253c:	08 00                	or     BYTE PTR [eax],al
 310253e:	00 00                	add    BYTE PTR [eax],al
 3102540:	17                   	pop    ss
 3102541:	00 00                	add    BYTE PTR [eax],al
 3102543:	00 12                	add    BYTE PTR [edx],dl
 3102545:	00 00                	add    BYTE PTR [eax],al
 3102547:	00 0b                	add    BYTE PTR [ebx],cl
 3102549:	00 00                	add    BYTE PTR [eax],al
 310254b:	00 00                	add    BYTE PTR [eax],al
 310254d:	00 00                	add    BYTE PTR [eax],al
 310254f:	00 19                	add    BYTE PTR [ecx],bl
 3102551:	00 00                	add    BYTE PTR [eax],al
 3102553:	00 1d 00 00 00 00    	add    BYTE PTR ds:0x0,bl
 3102559:	00 00                	add    BYTE PTR [eax],al
 310255b:	00 01                	add    BYTE PTR [ecx],al
 310255d:	00 00                	add    BYTE PTR [eax],al
 310255f:	00 20                	add    BYTE PTR [eax],ah
 3102561:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03102564 <.eh_frame>:
 3102564:	14 00                	adc    al,0x0
 3102566:	00 00                	add    BYTE PTR [eax],al
 3102568:	00 00                	add    BYTE PTR [eax],al
 310256a:	00 00                	add    BYTE PTR [eax],al
 310256c:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 310256f:	00 01                	add    BYTE PTR [ecx],al
 3102571:	7c 08                	jl     310257b <kShell+0x1353>
 3102573:	01 1b                	add    DWORD PTR [ebx],ebx
 3102575:	0c 04                	or     al,0x4
 3102577:	04 88                	add    al,0x88
 3102579:	01 00                	add    DWORD PTR [eax],eax
 310257b:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 310257e:	00 00                	add    BYTE PTR [eax],al
 3102580:	1c 00                	sbb    al,0x0
 3102582:	00 00                	add    BYTE PTR [eax],al
 3102584:	dc f0                	fdivr  st(0),st
 3102586:	ff                   	(bad)  
 3102587:	ff 20                	jmp    DWORD PTR [eax]
 3102589:	02 00                	add    al,BYTE PTR [eax]
 310258b:	00 00                	add    BYTE PTR [eax],al
 310258d:	0e                   	push   cs
 310258e:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3102591:	0c 4a                	or     al,0x4a
 3102593:	0f 0b                	ud2    
 3102595:	74 04                	je     310259b <kShell+0x1373>
 3102597:	78 00                	js     3102599 <kShell+0x1371>
 3102599:	3f                   	aas    
 310259a:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 310259c:	2a 32                	sub    dh,BYTE PTR [edx]
 310259e:	24 22                	and    al,0x22
 31025a0:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

031025a4 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 31025a4:	01 1b                	add    DWORD PTR [ebx],ebx
 31025a6:	03 3b                	add    edi,DWORD PTR [ebx]
 31025a8:	f0 f7 ff             	lock idiv edi
 31025ab:	ff 1c 00             	call   FWORD PTR [eax+eax*1]
 31025ae:	00 00                	add    BYTE PTR [eax],al
 31025b0:	5c                   	pop    esp
 31025b1:	da ff                	(bad)  
 31025b3:	ff 0c f8             	dec    DWORD PTR [eax+edi*8]
 31025b6:	ff                   	(bad)  
 31025b7:	ff 75 da             	push   DWORD PTR [ebp-0x26]
 31025ba:	ff                   	(bad)  
 31025bb:	ff 2c f8             	jmp    FWORD PTR [eax+edi*8]
 31025be:	ff                   	(bad)  
 31025bf:	ff c4                	inc    esp
 31025c1:	da ff                	(bad)  
 31025c3:	ff 4c f8 ff          	dec    DWORD PTR [eax+edi*8-0x1]
 31025c7:	ff 21                	jmp    DWORD PTR [ecx]
 31025c9:	dc ff                	fdiv   st(7),st
 31025cb:	ff 6c f8 ff          	jmp    FWORD PTR [eax+edi*8-0x1]
 31025cf:	ff ac dc ff ff 8c f8 	jmp    FWORD PTR [esp+ebx*8-0x7730001]
 31025d6:	ff                   	(bad)  
 31025d7:	ff 8e e0 ff ff b0    	dec    DWORD PTR [esi-0x4f000020]
 31025dd:	f8                   	clc    
 31025de:	ff                   	(bad)  
 31025df:	ff cc                	dec    esp
 31025e1:	e0 ff                	loopne 31025e2 <__GNU_EH_FRAME_HDR+0x3e>
 31025e3:	ff d0                	call   eax
 31025e5:	f8                   	clc    
 31025e6:	ff                   	(bad)  
 31025e7:	ff 93 e1 ff ff f0    	call   DWORD PTR [ebx-0xf00001f]
 31025ed:	f8                   	clc    
 31025ee:	ff                   	(bad)  
 31025ef:	ff ad e1 ff ff 10    	jmp    FWORD PTR [ebp+0x10ffffe1]
 31025f5:	f9                   	stc    
 31025f6:	ff                   	(bad)  
 31025f7:	ff 05 e2 ff ff 30    	inc    DWORD PTR ds:0x30ffffe2
 31025fd:	f9                   	stc    
 31025fe:	ff                   	(bad)  
 31025ff:	ff d3                	call   ebx
 3102601:	e2 ff                	loop   3102602 <__GNU_EH_FRAME_HDR+0x5e>
 3102603:	ff 50 f9             	call   DWORD PTR [eax-0x7]
 3102606:	ff                   	(bad)  
 3102607:	ff 21                	jmp    DWORD PTR [ecx]
 3102609:	e3 ff                	jecxz  310260a <__GNU_EH_FRAME_HDR+0x66>
 310260b:	ff 70 f9             	push   DWORD PTR [eax-0x7]
 310260e:	ff                   	(bad)  
 310260f:	ff 34 e4             	push   DWORD PTR [esp+eiz*8]
 3102612:	ff                   	(bad)  
 3102613:	ff 94 f9 ff ff 3a e4 	call   DWORD PTR [ecx+edi*8-0x1bc50001]
 310261a:	ff                   	(bad)  
 310261b:	ff b4 f9 ff ff 69 e4 	push   DWORD PTR [ecx+edi*8-0x1b960001]
 3102622:	ff                   	(bad)  
 3102623:	ff d4                	call   esp
 3102625:	f9                   	stc    
 3102626:	ff                   	(bad)  
 3102627:	ff 44 e5 ff          	inc    DWORD PTR [ebp+eiz*8-0x1]
 310262b:	ff f4                	push   esp
 310262d:	f9                   	stc    
 310262e:	ff                   	(bad)  
 310262f:	ff                   	(bad)  
 3102630:	f8                   	clc    
 3102631:	e5 ff                	in     eax,0xff
 3102633:	ff 18                	call   FWORD PTR [eax]
 3102635:	fa                   	cli    
 3102636:	ff                   	(bad)  
 3102637:	ff a1 e7 ff ff 3c    	jmp    DWORD PTR [ecx+0x3cffffe7]
 310263d:	fa                   	cli    
 310263e:	ff                   	(bad)  
 310263f:	ff 0a                	dec    DWORD PTR [edx]
 3102641:	e8 ff ff 5c fa       	call   fd6d2645 <kCmdline+0xfa5bfda5>
 3102646:	ff                   	(bad)  
 3102647:	ff 98 ea ff ff 7c    	call   FWORD PTR [eax+0x7cffffea]
 310264d:	fa                   	cli    
 310264e:	ff                   	(bad)  
 310264f:	ff 0e                	dec    DWORD PTR [esi]
 3102651:	eb ff                	jmp    3102652 <__GNU_EH_FRAME_HDR+0xae>
 3102653:	ff a0 fa ff ff 4b    	jmp    DWORD PTR [eax+0x4bfffffa]
 3102659:	eb ff                	jmp    310265a <__GNU_EH_FRAME_HDR+0xb6>
 310265b:	ff c0                	inc    eax
 310265d:	fa                   	cli    
 310265e:	ff                   	(bad)  
 310265f:	ff d7                	call   edi
 3102661:	eb ff                	jmp    3102662 <__GNU_EH_FRAME_HDR+0xbe>
 3102663:	ff e0                	jmp    eax
 3102665:	fa                   	cli    
 3102666:	ff                   	(bad)  
 3102667:	ff 05 ec ff ff 00    	inc    DWORD PTR ds:0xffffec
 310266d:	fb                   	sti    
 310266e:	ff                   	(bad)  
 310266f:	ff 28                	jmp    FWORD PTR [eax]
 3102671:	ec                   	in     al,dx
 3102672:	ff                   	(bad)  
 3102673:	ff 20                	jmp    DWORD PTR [eax]
 3102675:	fb                   	sti    
 3102676:	ff                   	(bad)  
 3102677:	ff 4e ec             	dec    DWORD PTR [esi-0x14]
 310267a:	ff                   	(bad)  
 310267b:	ff 40 fb             	inc    DWORD PTR [eax-0x5]
 310267e:	ff                   	(bad)  
 310267f:	ff 64 ec ff          	jmp    DWORD PTR [esp+ebp*8-0x1]
 3102683:	ff 60 fb             	jmp    DWORD PTR [eax-0x5]
 3102686:	ff                   	(bad)  
 3102687:	ff 84 ec ff ff 80 fb 	inc    DWORD PTR [esp+ebp*8-0x47f0001]
 310268e:	ff                   	(bad)  
 310268f:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03102690 <.rel.dyn>:
 3102690:	7c 29                	jl     31026bb <__GNU_EH_FRAME_HDR+0x117>
 3102692:	10 03                	adc    BYTE PTR [ebx],al
 3102694:	07                   	pop    es
 3102695:	01 00                	add    DWORD PTR [eax],eax
 3102697:	00 80 29 10 03 07    	add    BYTE PTR [eax+0x7031029],al
 310269d:	02 00                	add    al,BYTE PTR [eax]
 310269f:	00 84 29 10 03 07 03 	add    BYTE PTR [ecx+ebp*1+0x3070310],al
 31026a6:	00 00                	add    BYTE PTR [eax],al
 31026a8:	88 29                	mov    BYTE PTR [ecx],ch
 31026aa:	10 03                	adc    BYTE PTR [ebx],al
 31026ac:	07                   	pop    es
 31026ad:	04 00                	add    al,0x0
 31026af:	00 8c 29 10 03 07 05 	add    BYTE PTR [ecx+ebp*1+0x5070310],cl
 31026b6:	00 00                	add    BYTE PTR [eax],al
 31026b8:	90                   	nop
 31026b9:	29 10                	sub    DWORD PTR [eax],edx
 31026bb:	03 07                	add    eax,DWORD PTR [edi]
 31026bd:	06                   	push   es
 31026be:	00 00                	add    BYTE PTR [eax],al
 31026c0:	94                   	xchg   esp,eax
 31026c1:	29 10                	sub    DWORD PTR [eax],edx
 31026c3:	03 07                	add    eax,DWORD PTR [edi]
 31026c5:	07                   	pop    es
 31026c6:	00 00                	add    BYTE PTR [eax],al
 31026c8:	98                   	cwde   
 31026c9:	29 10                	sub    DWORD PTR [eax],edx
 31026cb:	03 07                	add    eax,DWORD PTR [edi]
 31026cd:	08 00                	or     BYTE PTR [eax],al
 31026cf:	00 9c 29 10 03 07 09 	add    BYTE PTR [ecx+ebp*1+0x9070310],bl
 31026d6:	00 00                	add    BYTE PTR [eax],al
 31026d8:	a0 29 10 03 07       	mov    al,ds:0x7031029
 31026dd:	0a 00                	or     al,BYTE PTR [eax]
 31026df:	00 a4 29 10 03 07 0b 	add    BYTE PTR [ecx+ebp*1+0xb070310],ah
 31026e6:	00 00                	add    BYTE PTR [eax],al
 31026e8:	a8 29                	test   al,0x29
 31026ea:	10 03                	adc    BYTE PTR [ebx],al
 31026ec:	07                   	pop    es
 31026ed:	0c 00                	or     al,0x0
 31026ef:	00 ac 29 10 03 07 0d 	add    BYTE PTR [ecx+ebp*1+0xd070310],ch
 31026f6:	00 00                	add    BYTE PTR [eax],al
 31026f8:	b0 29                	mov    al,0x29
 31026fa:	10 03                	adc    BYTE PTR [ebx],al
 31026fc:	07                   	pop    es
 31026fd:	0e                   	push   cs
 31026fe:	00 00                	add    BYTE PTR [eax],al
 3102700:	b4 29                	mov    ah,0x29
 3102702:	10 03                	adc    BYTE PTR [ebx],al
 3102704:	07                   	pop    es
 3102705:	0f 00 00             	sldt   WORD PTR [eax]
 3102708:	b8 29 10 03 07       	mov    eax,0x7031029
 310270d:	10 00                	adc    BYTE PTR [eax],al
 310270f:	00 bc 29 10 03 07 11 	add    BYTE PTR [ecx+ebp*1+0x11070310],bh
 3102716:	00 00                	add    BYTE PTR [eax],al
 3102718:	c0 29 10             	shr    BYTE PTR [ecx],0x10
 310271b:	03 07                	add    eax,DWORD PTR [edi]
 310271d:	12 00                	adc    al,BYTE PTR [eax]
 310271f:	00 c4                	add    ah,al
 3102721:	29 10                	sub    DWORD PTR [eax],edx
 3102723:	03 07                	add    eax,DWORD PTR [edi]
 3102725:	13 00                	adc    eax,DWORD PTR [eax]
 3102727:	00 c8                	add    al,cl
 3102729:	29 10                	sub    DWORD PTR [eax],edx
 310272b:	03 07                	add    eax,DWORD PTR [edi]
 310272d:	14 00                	adc    al,0x0
 310272f:	00 cc                	add    ah,cl
 3102731:	29 10                	sub    DWORD PTR [eax],edx
 3102733:	03 07                	add    eax,DWORD PTR [edi]
 3102735:	15 00 00 d0 29       	adc    eax,0x29d00000
 310273a:	10 03                	adc    BYTE PTR [ebx],al
 310273c:	07                   	pop    es
 310273d:	16                   	push   ss
 310273e:	00 00                	add    BYTE PTR [eax],al
 3102740:	d4 29                	aam    0x29
 3102742:	10 03                	adc    BYTE PTR [ebx],al
 3102744:	07                   	pop    es
 3102745:	17                   	pop    ss
 3102746:	00 00                	add    BYTE PTR [eax],al
 3102748:	d8 29                	fsubr  DWORD PTR [ecx]
 310274a:	10 03                	adc    BYTE PTR [ebx],al
 310274c:	07                   	pop    es
 310274d:	18 00                	sbb    BYTE PTR [eax],al
 310274f:	00 dc                	add    ah,bl
 3102751:	29 10                	sub    DWORD PTR [eax],edx
 3102753:	03 07                	add    eax,DWORD PTR [edi]
 3102755:	19 00                	sbb    DWORD PTR [eax],eax
 3102757:	00 e0                	add    al,ah
 3102759:	29 10                	sub    DWORD PTR [eax],edx
 310275b:	03 07                	add    eax,DWORD PTR [edi]
 310275d:	1a 00                	sbb    al,BYTE PTR [eax]
 310275f:	00 e4                	add    ah,ah
 3102761:	29 10                	sub    DWORD PTR [eax],edx
 3102763:	03 07                	add    eax,DWORD PTR [edi]
 3102765:	1b 00                	sbb    eax,DWORD PTR [eax]
 3102767:	00 e8                	add    al,ch
 3102769:	29 10                	sub    DWORD PTR [eax],edx
 310276b:	03 07                	add    eax,DWORD PTR [edi]
 310276d:	1c 00                	sbb    al,0x0
 310276f:	00 ec                	add    ah,ch
 3102771:	29 10                	sub    DWORD PTR [eax],edx
 3102773:	03 07                	add    eax,DWORD PTR [edi]
 3102775:	1d 00 00 f0 29       	sbb    eax,0x29f00000
 310277a:	10 03                	adc    BYTE PTR [ebx],al
 310277c:	07                   	pop    es
 310277d:	1e                   	push   ds
 310277e:	00 00                	add    BYTE PTR [eax],al
 3102780:	f4                   	hlt    
 3102781:	29 10                	sub    DWORD PTR [eax],edx
 3102783:	03 07                	add    eax,DWORD PTR [edi]
 3102785:	1f                   	pop    ds
 3102786:	00 00                	add    BYTE PTR [eax],al
 3102788:	f8                   	clc    
 3102789:	29 10                	sub    DWORD PTR [eax],edx
 310278b:	03 07                	add    eax,DWORD PTR [edi]
 310278d:	20 00                	and    BYTE PTR [eax],al
 310278f:	00 fc                	add    ah,bh
 3102791:	29 10                	sub    DWORD PTR [eax],edx
 3102793:	03 07                	add    eax,DWORD PTR [edi]
 3102795:	21 00                	and    DWORD PTR [eax],eax
	...

Disassembly of section .data:

031027a0 <cmds>:
 31027a0:	80 18 10             	sbb    BYTE PTR [eax],0x10
 31027a3:	03 86 18 10 03 00    	add    eax,DWORD PTR [esi+0x31018]
 31027a9:	00 10                	add    BYTE PTR [eax],dl
 31027ab:	03 00                	add    eax,DWORD PTR [eax]
 31027ad:	00 00                	add    BYTE PTR [eax],al
 31027af:	00 97 18 10 03 9b    	add    BYTE PTR [edi-0x64fcefe8],dl
 31027b5:	18 10                	sbb    BYTE PTR [eax],dl
 31027b7:	03 19                	add    ebx,DWORD PTR [ecx]
 31027b9:	00 10                	add    BYTE PTR [eax],dl
 31027bb:	03 00                	add    eax,DWORD PTR [eax]
 31027bd:	00 00                	add    BYTE PTR [eax],al
 31027bf:	00 ad 18 10 03 b2    	add    BYTE PTR [ebp-0x4dfcefe8],ch
 31027c5:	18 10                	sbb    BYTE PTR [eax],dl
 31027c7:	03 37                	add    esi,DWORD PTR [edi]
 31027c9:	07                   	pop    es
 31027ca:	10 03                	adc    BYTE PTR [ebx],al
 31027cc:	01 00                	add    DWORD PTR [eax],eax
 31027ce:	00 00                	add    BYTE PTR [eax],al
 31027d0:	c4 18                	les    ebx,FWORD PTR [eax]
 31027d2:	10 03                	adc    BYTE PTR [ebx],al
 31027d4:	c9                   	leave  
 31027d5:	18 10                	sbb    BYTE PTR [eax],dl
 31027d7:	03 51 07             	add    edx,DWORD PTR [ecx+0x7]
 31027da:	10 03                	adc    BYTE PTR [ebx],al
 31027dc:	01 00                	add    DWORD PTR [eax],eax
 31027de:	00 00                	add    BYTE PTR [eax],al
 31027e0:	d5 18                	aad    0x18
 31027e2:	10 03                	adc    BYTE PTR [ebx],al
 31027e4:	da 18                	ficomp DWORD PTR [eax]
 31027e6:	10 03                	adc    BYTE PTR [ebx],al
 31027e8:	a9 07 10 03 01       	test   eax,0x1031007
 31027ed:	00 00                	add    BYTE PTR [eax],al
 31027ef:	00 f6                	add    dh,dh
 31027f1:	18 10                	sbb    BYTE PTR [eax],dl
 31027f3:	03 fa                	add    edi,edx
 31027f5:	18 10                	sbb    BYTE PTR [eax],dl
 31027f7:	03 77 08             	add    esi,DWORD PTR [edi+0x8]
 31027fa:	10 03                	adc    BYTE PTR [ebx],al
 31027fc:	00 00                	add    BYTE PTR [eax],al
 31027fe:	00 00                	add    BYTE PTR [eax],al
 3102800:	12 19                	adc    bl,BYTE PTR [ecx]
 3102802:	10 03                	adc    BYTE PTR [ebx],al
 3102804:	19 19                	sbb    DWORD PTR [ecx],ebx
 3102806:	10 03                	adc    BYTE PTR [ebx],al
 3102808:	70 06                	jo     3102810 <cmds+0x70>
 310280a:	10 03                	adc    BYTE PTR [ebx],al
 310280c:	01 00                	add    DWORD PTR [eax],eax
 310280e:	00 00                	add    BYTE PTR [eax],al
 3102810:	32 19                	xor    bl,BYTE PTR [ecx]
 3102812:	10 03                	adc    BYTE PTR [ebx],al
 3102814:	36 19 10             	sbb    DWORD PTR ss:[eax],edx
 3102817:	03 68 00             	add    ebp,DWORD PTR [eax+0x0]
 310281a:	10 03                	adc    BYTE PTR [ebx],al
 310281c:	01 00                	add    DWORD PTR [eax],eax
 310281e:	00 00                	add    BYTE PTR [eax],al
 3102820:	52                   	push   edx
 3102821:	19 10                	sbb    DWORD PTR [eax],edx
 3102823:	03 58 19             	add    ebx,DWORD PTR [eax+0x19]
 3102826:	10 03                	adc    BYTE PTR [ebx],al
 3102828:	c5 08                	lds    ecx,FWORD PTR [eax]
 310282a:	10 03                	adc    BYTE PTR [ebx],al
 310282c:	01 00                	add    DWORD PTR [eax],eax
 310282e:	00 00                	add    BYTE PTR [eax],al
 3102830:	6c                   	ins    BYTE PTR es:[edi],dx
 3102831:	19 10                	sbb    DWORD PTR [eax],edx
 3102833:	03 74 19 10          	add    esi,DWORD PTR [ecx+ebx*1+0x10]
 3102837:	03 32                	add    esi,DWORD PTR [edx]
 3102839:	06                   	push   es
 310283a:	10 03                	adc    BYTE PTR [ebx],al
 310283c:	01 00                	add    DWORD PTR [eax],eax
	...

03102840 <cmds>:
 3102840:	2c 1c                	sub    al,0x1c
 3102842:	10 03                	adc    BYTE PTR [ebx],al
 3102844:	32 1c 10             	xor    bl,BYTE PTR [eax+edx*1]
 3102847:	03 00                	add    eax,DWORD PTR [eax]
 3102849:	00 10                	add    BYTE PTR [eax],dl
 310284b:	03 00                	add    eax,DWORD PTR [eax]
 310284d:	00 00                	add    BYTE PTR [eax],al
 310284f:	00 43 1c             	add    BYTE PTR [ebx+0x1c],al
 3102852:	10 03                	adc    BYTE PTR [ebx],al
 3102854:	47                   	inc    edi
 3102855:	1c 10                	sbb    al,0x10
 3102857:	03 19                	add    ebx,DWORD PTR [ecx]
 3102859:	00 10                	add    BYTE PTR [eax],dl
 310285b:	03 00                	add    eax,DWORD PTR [eax]
 310285d:	00 00                	add    BYTE PTR [eax],al
 310285f:	00 59 1c             	add    BYTE PTR [ecx+0x1c],bl
 3102862:	10 03                	adc    BYTE PTR [ebx],al
 3102864:	5e                   	pop    esi
 3102865:	1c 10                	sbb    al,0x10
 3102867:	03 37                	add    esi,DWORD PTR [edi]
 3102869:	07                   	pop    es
 310286a:	10 03                	adc    BYTE PTR [ebx],al
 310286c:	01 00                	add    DWORD PTR [eax],eax
 310286e:	00 00                	add    BYTE PTR [eax],al
 3102870:	70 1c                	jo     310288e <cmds+0x4e>
 3102872:	10 03                	adc    BYTE PTR [ebx],al
 3102874:	75 1c                	jne    3102892 <cmds+0x52>
 3102876:	10 03                	adc    BYTE PTR [ebx],al
 3102878:	51                   	push   ecx
 3102879:	07                   	pop    es
 310287a:	10 03                	adc    BYTE PTR [ebx],al
 310287c:	01 00                	add    DWORD PTR [eax],eax
 310287e:	00 00                	add    BYTE PTR [eax],al
 3102880:	81 1c 10 03 86 1c 10 	sbb    DWORD PTR [eax+edx*1],0x101c8603
 3102887:	03 a9 07 10 03 01    	add    ebp,DWORD PTR [ecx+0x1031007]
 310288d:	00 00                	add    BYTE PTR [eax],al
 310288f:	00 a2 1c 10 03 a6    	add    BYTE PTR [edx-0x59fcefe4],ah
 3102895:	1c 10                	sbb    al,0x10
 3102897:	03 77 08             	add    esi,DWORD PTR [edi+0x8]
 310289a:	10 03                	adc    BYTE PTR [ebx],al
 310289c:	00 00                	add    BYTE PTR [eax],al
 310289e:	00 00                	add    BYTE PTR [eax],al
 31028a0:	be 1c 10 03 c5       	mov    esi,0xc503101c
 31028a5:	1c 10                	sbb    al,0x10
 31028a7:	03 70 06             	add    esi,DWORD PTR [eax+0x6]
 31028aa:	10 03                	adc    BYTE PTR [ebx],al
 31028ac:	01 00                	add    DWORD PTR [eax],eax
 31028ae:	00 00                	add    BYTE PTR [eax],al
 31028b0:	de 1c 10             	ficomp WORD PTR [eax+edx*1]
 31028b3:	03 e2                	add    esp,edx
 31028b5:	1c 10                	sbb    al,0x10
 31028b7:	03 68 00             	add    ebp,DWORD PTR [eax+0x0]
 31028ba:	10 03                	adc    BYTE PTR [ebx],al
 31028bc:	01 00                	add    DWORD PTR [eax],eax
 31028be:	00 00                	add    BYTE PTR [eax],al
 31028c0:	fe                   	(bad)  
 31028c1:	1c 10                	sbb    al,0x10
 31028c3:	03 04 1d 10 03 c5 08 	add    eax,DWORD PTR [ebx*1+0x8c50310]
 31028ca:	10 03                	adc    BYTE PTR [ebx],al
 31028cc:	01 00                	add    DWORD PTR [eax],eax
 31028ce:	00 00                	add    BYTE PTR [eax],al
 31028d0:	18 1d 10 03 20 1d    	sbb    BYTE PTR ds:0x1d200310,bl
 31028d6:	10 03                	adc    BYTE PTR [ebx],al
 31028d8:	32 06                	xor    al,BYTE PTR [esi]
 31028da:	10 03                	adc    BYTE PTR [ebx],al
 31028dc:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

031028e0 <_DYNAMIC>:
 31028e0:	01 00                	add    DWORD PTR [eax],eax
 31028e2:	00 00                	add    BYTE PTR [eax],al
 31028e4:	01 00                	add    DWORD PTR [eax],eax
 31028e6:	00 00                	add    BYTE PTR [eax],al
 31028e8:	0f 00 00             	sldt   WORD PTR [eax]
 31028eb:	00 f4                	add    ah,dh
 31028ed:	00 00                	add    BYTE PTR [eax],al
 31028ef:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 31028f2:	00 00                	add    BYTE PTR [eax],al
 31028f4:	90                   	nop
 31028f5:	24 10                	and    al,0x10
 31028f7:	03 05 00 00 00 78    	add    eax,DWORD PTR ds:0x78000000
 31028fd:	23 10                	and    edx,DWORD PTR [eax]
 31028ff:	03 06                	add    eax,DWORD PTR [esi]
 3102901:	00 00                	add    BYTE PTR [eax],al
 3102903:	00 58 21             	add    BYTE PTR [eax+0x21],bl
 3102906:	10 03                	adc    BYTE PTR [ebx],al
 3102908:	0a 00                	or     al,BYTE PTR [eax]
 310290a:	00 00                	add    BYTE PTR [eax],al
 310290c:	17                   	pop    ss
 310290d:	01 00                	add    DWORD PTR [eax],eax
 310290f:	00 0b                	add    BYTE PTR [ebx],cl
 3102911:	00 00                	add    BYTE PTR [eax],al
 3102913:	00 10                	add    BYTE PTR [eax],dl
 3102915:	00 00                	add    BYTE PTR [eax],al
 3102917:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 310291d:	00 00                	add    BYTE PTR [eax],al
 310291f:	00 03                	add    BYTE PTR [ebx],al
 3102921:	00 00                	add    BYTE PTR [eax],al
 3102923:	00 70 29             	add    BYTE PTR [eax+0x29],dh
 3102926:	10 03                	adc    BYTE PTR [ebx],al
 3102928:	02 00                	add    al,BYTE PTR [eax]
 310292a:	00 00                	add    BYTE PTR [eax],al
 310292c:	08 01                	or     BYTE PTR [ecx],al
 310292e:	00 00                	add    BYTE PTR [eax],al
 3102930:	14 00                	adc    al,0x0
 3102932:	00 00                	add    BYTE PTR [eax],al
 3102934:	11 00                	adc    DWORD PTR [eax],eax
 3102936:	00 00                	add    BYTE PTR [eax],al
 3102938:	17                   	pop    ss
 3102939:	00 00                	add    BYTE PTR [eax],al
 310293b:	00 90 26 10 03 00    	add    BYTE PTR [eax+0x31026],dl
	...

Disassembly of section .got.plt:

03102970 <_GLOBAL_OFFSET_TABLE_>:
 3102970:	e0 28                	loopne 310299a <_GLOBAL_OFFSET_TABLE_+0x2a>
 3102972:	10 03                	adc    BYTE PTR [ebx],al
	...
 310297c:	76 16                	jbe    3102994 <_GLOBAL_OFFSET_TABLE_+0x24>
 310297e:	10 03                	adc    BYTE PTR [ebx],al
 3102980:	86 16                	xchg   BYTE PTR [esi],dl
 3102982:	10 03                	adc    BYTE PTR [ebx],al
 3102984:	96                   	xchg   esi,eax
 3102985:	16                   	push   ss
 3102986:	10 03                	adc    BYTE PTR [ebx],al
 3102988:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 3102989:	16                   	push   ss
 310298a:	10 03                	adc    BYTE PTR [ebx],al
 310298c:	b6 16                	mov    dh,0x16
 310298e:	10 03                	adc    BYTE PTR [ebx],al
 3102990:	c6                   	(bad)  
 3102991:	16                   	push   ss
 3102992:	10 03                	adc    BYTE PTR [ebx],al
 3102994:	d6                   	(bad)  
 3102995:	16                   	push   ss
 3102996:	10 03                	adc    BYTE PTR [ebx],al
 3102998:	e6 16                	out    0x16,al
 310299a:	10 03                	adc    BYTE PTR [ebx],al
 310299c:	f6 16                	not    BYTE PTR [esi]
 310299e:	10 03                	adc    BYTE PTR [ebx],al
 31029a0:	06                   	push   es
 31029a1:	17                   	pop    ss
 31029a2:	10 03                	adc    BYTE PTR [ebx],al
 31029a4:	16                   	push   ss
 31029a5:	17                   	pop    ss
 31029a6:	10 03                	adc    BYTE PTR [ebx],al
 31029a8:	26                   	es
 31029a9:	17                   	pop    ss
 31029aa:	10 03                	adc    BYTE PTR [ebx],al
 31029ac:	36                   	ss
 31029ad:	17                   	pop    ss
 31029ae:	10 03                	adc    BYTE PTR [ebx],al
 31029b0:	46                   	inc    esi
 31029b1:	17                   	pop    ss
 31029b2:	10 03                	adc    BYTE PTR [ebx],al
 31029b4:	56                   	push   esi
 31029b5:	17                   	pop    ss
 31029b6:	10 03                	adc    BYTE PTR [ebx],al
 31029b8:	66 17                	popw   ss
 31029ba:	10 03                	adc    BYTE PTR [ebx],al
 31029bc:	76 17                	jbe    31029d5 <_GLOBAL_OFFSET_TABLE_+0x65>
 31029be:	10 03                	adc    BYTE PTR [ebx],al
 31029c0:	86 17                	xchg   BYTE PTR [edi],dl
 31029c2:	10 03                	adc    BYTE PTR [ebx],al
 31029c4:	96                   	xchg   esi,eax
 31029c5:	17                   	pop    ss
 31029c6:	10 03                	adc    BYTE PTR [ebx],al
 31029c8:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 31029c9:	17                   	pop    ss
 31029ca:	10 03                	adc    BYTE PTR [ebx],al
 31029cc:	b6 17                	mov    dh,0x17
 31029ce:	10 03                	adc    BYTE PTR [ebx],al
 31029d0:	c6                   	(bad)  
 31029d1:	17                   	pop    ss
 31029d2:	10 03                	adc    BYTE PTR [ebx],al
 31029d4:	d6                   	(bad)  
 31029d5:	17                   	pop    ss
 31029d6:	10 03                	adc    BYTE PTR [ebx],al
 31029d8:	e6 17                	out    0x17,al
 31029da:	10 03                	adc    BYTE PTR [ebx],al
 31029dc:	f6 17                	not    BYTE PTR [edi]
 31029de:	10 03                	adc    BYTE PTR [ebx],al
 31029e0:	06                   	push   es
 31029e1:	18 10                	sbb    BYTE PTR [eax],dl
 31029e3:	03 16                	add    edx,DWORD PTR [esi]
 31029e5:	18 10                	sbb    BYTE PTR [eax],dl
 31029e7:	03 26                	add    esp,DWORD PTR [esi]
 31029e9:	18 10                	sbb    BYTE PTR [eax],dl
 31029eb:	03 36                	add    esi,DWORD PTR [esi]
 31029ed:	18 10                	sbb    BYTE PTR [eax],dl
 31029ef:	03 46 18             	add    eax,DWORD PTR [esi+0x18]
 31029f2:	10 03                	adc    BYTE PTR [ebx],al
 31029f4:	56                   	push   esi
 31029f5:	18 10                	sbb    BYTE PTR [eax],dl
 31029f7:	03 66 18             	add    esp,DWORD PTR [esi+0x18]
 31029fa:	10 03                	adc    BYTE PTR [ebx],al
 31029fc:	76 18                	jbe    3102a16 <environmentLoc+0xa>
 31029fe:	10 03                	adc    BYTE PTR [ebx],al

Disassembly of section .bss:

03102a00 <bSigIntReceived>:
 3102a00:	00 00                	add    BYTE PTR [eax],al
	...

03102a04 <delim>:
	...

03102a0c <environmentLoc>:
	...

03102a20 <cwd>:
	...

03102b20 <filesToCloseCount>:
	...

03102b40 <sExecutingProgram>:
	...

03102d40 <command_function_p>:
 3102d40:	00 00                	add    BYTE PTR [eax],al
	...

03102d44 <cpuid_extended_feature_bits>:
 3102d44:	00 00                	add    BYTE PTR [eax],al
	...

03102d48 <filesToClose>:
 3102d48:	00 00                	add    BYTE PTR [eax],al
	...

03102d4c <heapEnd>:
 3102d4c:	00 00                	add    BYTE PTR [eax],al
	...

03102d50 <heapBase>:
 3102d50:	00 00                	add    BYTE PTR [eax],al
	...

03102d54 <heapCurr>:
 3102d54:	00 00                	add    BYTE PTR [eax],al
	...

03102d58 <command_function>:
 3102d58:	00 00                	add    BYTE PTR [eax],al
	...

03102d5c <cpuid_procinfo>:
	...

03102d64 <processEnvp>:
 3102d64:	00 00                	add    BYTE PTR [eax],al
	...

03102d68 <lastExecExitCode>:
 3102d68:	00 00                	add    BYTE PTR [eax],al
	...

03102d6c <exitCode>:
 3102d6c:	00 00                	add    BYTE PTR [eax],al
	...

03102d70 <sKShellProgramName>:
 3102d70:	00 00                	add    BYTE PTR [eax],al
	...

03102d74 <libcTZ>:
 3102d74:	00 00                	add    BYTE PTR [eax],al
	...

03102d78 <timeToExit>:
 3102d78:	00 00                	add    BYTE PTR [eax],al
	...

03102d7c <execPipes>:
	...

03102d84 <commandHistoryPtr>:
 3102d84:	00 00                	add    BYTE PTR [eax],al
	...

03102d88 <commandHistoryMax>:
	...

03102da0 <commandHistory>:
	...

031127a0 <lCommand>:
	...

031128a0 <kCmdline>:
 31128a0:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	28 09                	sub    BYTE PTR [ecx],cl
       2:	00 00                	add    BYTE PTR [eax],al
       4:	04 00                	add    al,0x0
       6:	00 00                	add    BYTE PTR [eax],al
       8:	00 00                	add    BYTE PTR [eax],al
       a:	04 01                	add    al,0x1
       c:	9c                   	pushf  
       d:	00 00                	add    BYTE PTR [eax],al
       f:	00 0c f2             	add    BYTE PTR [edx+esi*8],cl
      12:	00 00                	add    BYTE PTR [eax],al
      14:	00 32                	add    BYTE PTR [edx],dh
      16:	00 00                	add    BYTE PTR [eax],al
      18:	00 00                	add    BYTE PTR [eax],al
      1a:	00 10                	add    BYTE PTR [eax],dl
      1c:	03 d6                	add    edx,esi
      1e:	09 00                	or     DWORD PTR [eax],eax
      20:	00 00                	add    BYTE PTR [eax],al
      22:	00 00                	add    BYTE PTR [eax],al
      24:	00 02                	add    BYTE PTR [edx],al
      26:	01 06                	add    DWORD PTR [esi],eax
      28:	7f 02                	jg     2c <cmdClearScreen-0x30fffd4>
      2a:	00 00                	add    BYTE PTR [eax],al
      2c:	02 01                	add    al,BYTE PTR [ecx]
      2e:	06                   	push   es
      2f:	78 02                	js     33 <cmdClearScreen-0x30fffcd>
      31:	00 00                	add    BYTE PTR [eax],al
      33:	02 02                	add    al,BYTE PTR [edx]
      35:	05 96 01 00 00       	add    eax,0x196
      3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
      41:	02 08                	add    cl,BYTE PTR [eax]
      43:	05 bb 01 00 00       	add    eax,0x1bb
      48:	04 4c                	add    al,0x4c
      4a:	01 00                	add    DWORD PTR [eax],eax
      4c:	00 02                	add    BYTE PTR [edx],al
      4e:	2e                   	cs
      4f:	53                   	push   ebx
      50:	00 00                	add    BYTE PTR [eax],al
      52:	00 02                	add    BYTE PTR [edx],al
      54:	01 08                	add    DWORD PTR [eax],ecx
      56:	76 02                	jbe    5a <cmdClearScreen-0x30fffa6>
      58:	00 00                	add    BYTE PTR [eax],al
      5a:	02 02                	add    al,BYTE PTR [edx]
      5c:	07                   	pop    es
      5d:	fe 02                	inc    BYTE PTR [edx]
      5f:	00 00                	add    BYTE PTR [eax],al
      61:	04 ab                	add    al,0xab
      63:	02 00                	add    al,BYTE PTR [eax]
      65:	00 02                	add    BYTE PTR [edx],al
      67:	34 6c                	xor    al,0x6c
      69:	00 00                	add    BYTE PTR [eax],al
      6b:	00 02                	add    BYTE PTR [edx],al
      6d:	04 07                	add    al,0x7
      6f:	96                   	xchg   esi,eax
      70:	02 00                	add    al,BYTE PTR [eax]
      72:	00 02                	add    BYTE PTR [edx],al
      74:	08 07                	or     BYTE PTR [edi],al
      76:	8c 02                	mov    WORD PTR [edx],es
      78:	00 00                	add    BYTE PTR [eax],al
      7a:	04 5d                	add    al,0x5d
      7c:	01 00                	add    DWORD PTR [eax],eax
      7e:	00 02                	add    BYTE PTR [edx],al
      80:	56                   	push   esi
      81:	6c                   	ins    BYTE PTR es:[edi],dx
      82:	00 00                	add    BYTE PTR [eax],al
      84:	00 02                	add    BYTE PTR [edx],al
      86:	04 05                	add    al,0x5
      88:	c0 01 00             	rol    BYTE PTR [ecx],0x0
      8b:	00 02                	add    BYTE PTR [edx],al
      8d:	01 02                	add    DWORD PTR [edx],eax
      8f:	44                   	inc    esp
      90:	03 00                	add    eax,DWORD PTR [eax]
      92:	00 02                	add    BYTE PTR [edx],al
      94:	04 07                	add    al,0x7
      96:	7a 00                	jp     98 <cmdClearScreen-0x30fff68>
      98:	00 00                	add    BYTE PTR [eax],al
      9a:	05 23 00 00 00       	add    eax,0x23
      9f:	08 03                	or     BYTE PTR [ebx],al
      a1:	24 bf                	and    al,0xbf
      a3:	00 00                	add    BYTE PTR [eax],al
      a5:	00 06                	add    BYTE PTR [esi],al
      a7:	64 03 00             	add    eax,DWORD PTR fs:[eax]
      aa:	00 03                	add    BYTE PTR [ebx],al
      ac:	26                   	es
      ad:	61                   	popa   
      ae:	00 00                	add    BYTE PTR [eax],al
      b0:	00 00                	add    BYTE PTR [eax],al
      b2:	06                   	push   es
      b3:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
      b6:	00 03                	add    BYTE PTR [ebx],al
      b8:	27                   	daa    
      b9:	61                   	popa   
      ba:	00 00                	add    BYTE PTR [eax],al
      bc:	00 04 00             	add    BYTE PTR [eax+eax*1],al
      bf:	04 7f                	add    al,0x7f
      c1:	01 00                	add    DWORD PTR [eax],eax
      c3:	00 03                	add    BYTE PTR [ebx],al
      c5:	2b 9a 00 00 00 07    	sub    ebx,DWORD PTR [edx+0x7000000]
      cb:	04 08                	add    al,0x8
      cd:	05 04 58 4d 01       	add    eax,0x14d5804
      d2:	00 00                	add    BYTE PTR [eax],al
      d4:	09 1b                	or     DWORD PTR [ebx],ebx
      d6:	04 00                	add    al,0x0
      d8:	00 04 59             	add    BYTE PTR [ecx+ebx*2],al
      db:	48                   	dec    eax
      dc:	00 00                	add    BYTE PTR [eax],al
      de:	00 01                	add    BYTE PTR [ecx],al
      e0:	04 04                	add    al,0x4
      e2:	00 09                	add    BYTE PTR [ecx],cl
      e4:	1d 03 00 00 04       	sbb    eax,0x4000003
      e9:	5a                   	pop    edx
      ea:	48                   	dec    eax
      eb:	00 00                	add    BYTE PTR [eax],al
      ed:	00 01                	add    BYTE PTR [ecx],al
      ef:	04 00                	add    al,0x0
      f1:	00 09                	add    BYTE PTR [ecx],cl
      f3:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
      f4:	02 00                	add    al,BYTE PTR [eax]
      f6:	00 04 5b             	add    BYTE PTR [ebx+ebx*2],al
      f9:	48                   	dec    eax
      fa:	00 00                	add    BYTE PTR [eax],al
      fc:	00 01                	add    BYTE PTR [ecx],al
      fe:	04 04                	add    al,0x4
     100:	01 09                	add    DWORD PTR [ecx],ecx
     102:	7e 00                	jle    104 <cmdClearScreen-0x30ffefc>
     104:	00 00                	add    BYTE PTR [eax],al
     106:	04 5c                	add    al,0x5c
     108:	48                   	dec    eax
     109:	00 00                	add    BYTE PTR [eax],al
     10b:	00 01                	add    BYTE PTR [ecx],al
     10d:	02 02                	add    al,BYTE PTR [edx]
     10f:	01 09                	add    DWORD PTR [ecx],ecx
     111:	ee                   	out    dx,al
     112:	01 00                	add    DWORD PTR [eax],eax
     114:	00 04 5d 48 00 00 00 	add    BYTE PTR [ebx*2+0x48],al
     11b:	01 02                	add    DWORD PTR [edx],eax
     11d:	00 01                	add    BYTE PTR [ecx],al
     11f:	09 1c 03             	or     DWORD PTR [ebx+eax*1],ebx
     122:	00 00                	add    BYTE PTR [eax],al
     124:	04 5e                	add    al,0x5e
     126:	48                   	dec    eax
     127:	00 00                	add    BYTE PTR [eax],al
     129:	00 01                	add    BYTE PTR [ecx],al
     12b:	04 04                	add    al,0x4
     12d:	02 09                	add    cl,BYTE PTR [ecx]
     12f:	a3 02 00 00 04       	mov    ds:0x4000002,eax
     134:	5f                   	pop    edi
     135:	48                   	dec    eax
     136:	00 00                	add    BYTE PTR [eax],al
     138:	00 01                	add    BYTE PTR [ecx],al
     13a:	08 00                	or     BYTE PTR [eax],al
     13c:	03 09                	add    ecx,DWORD PTR [ecx]
     13e:	f3 01 00             	repz add DWORD PTR [eax],eax
     141:	00 04 60             	add    BYTE PTR [eax+eiz*2],al
     144:	48                   	dec    eax
     145:	00 00                	add    BYTE PTR [eax],al
     147:	00 01                	add    BYTE PTR [ecx],al
     149:	04 04                	add    al,0x4
     14b:	04 00                	add    al,0x0
     14d:	0a 08                	or     cl,BYTE PTR [eax]
     14f:	04 56                	add    al,0x56
     151:	66 01 00             	add    WORD PTR [eax],ax
     154:	00 0b                	add    BYTE PTR [ebx],cl
     156:	cc                   	int3   
     157:	00 00                	add    BYTE PTR [eax],al
     159:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     15c:	65 67 00 04          	add    BYTE PTR gs:[si],al
     160:	62 61 00             	bound  esp,QWORD PTR [ecx+0x0]
     163:	00 00                	add    BYTE PTR [eax],al
     165:	00 08                	add    BYTE PTR [eax],cl
     167:	04 04                	add    al,0x4
     169:	db 9c 01 00 00 09 ae 	fistp  DWORD PTR [ecx+eax*1-0x51f70000]
     170:	03 00                	add    eax,DWORD PTR [eax]
     172:	00 04 dc             	add    BYTE PTR [esp+ebx*8],al
     175:	48                   	dec    eax
     176:	00 00                	add    BYTE PTR [eax],al
     178:	00 01                	add    BYTE PTR [ecx],al
     17a:	01 07                	add    DWORD PTR [edi],eax
     17c:	00 09                	add    BYTE PTR [ecx],cl
     17e:	c1 03 00             	rol    DWORD PTR [ebx],0x0
     181:	00 04 dd 48 00 00 00 	add    BYTE PTR [ebx*8+0x48],al
     188:	01 01                	add    DWORD PTR [ecx],eax
     18a:	06                   	push   es
     18b:	00 09                	add    BYTE PTR [ecx],cl
     18d:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     190:	00 04 de             	add    BYTE PTR [esi+ebx*8],al
     193:	61                   	popa   
     194:	00 00                	add    BYTE PTR [eax],al
     196:	00 04 1e             	add    BYTE PTR [esi+ebx*1],al
     199:	00 00                	add    BYTE PTR [eax],al
     19b:	00 0a                	add    BYTE PTR [edx],cl
     19d:	04 04                	add    al,0x4
     19f:	da b5 01 00 00 0b    	fidiv  DWORD PTR [ebp+0xb000001]
     1a5:	66 01 00             	add    WORD PTR [eax],ax
     1a8:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     1ab:	65 67 00 04          	add    BYTE PTR gs:[si],al
     1af:	e0 61                	loopne 212 <cmdClearScreen-0x30ffdee>
     1b1:	00 00                	add    BYTE PTR [eax],al
     1b3:	00 00                	add    BYTE PTR [eax],al
     1b5:	0d 54 01 00 00       	or     eax,0x154
     1ba:	04 6c                	add    al,0x6c
     1bc:	00 00                	add    BYTE PTR [eax],al
     1be:	00 08                	add    BYTE PTR [eax],cl
     1c0:	15 f0 01 00 00       	adc    eax,0x1f0
     1c5:	0e                   	push   cs
     1c6:	4a                   	dec    edx
     1c7:	03 00                	add    eax,DWORD PTR [eax]
     1c9:	00 01                	add    BYTE PTR [ecx],al
     1cb:	0e                   	push   cs
     1cc:	0c 02                	or     al,0x2
     1ce:	00 00                	add    BYTE PTR [eax],al
     1d0:	02 0e                	add    cl,BYTE PTR [esi]
     1d2:	01 01                	add    DWORD PTR [ecx],eax
     1d4:	00 00                	add    BYTE PTR [eax],al
     1d6:	04 0e                	add    al,0xe
     1d8:	09 04 00             	or     DWORD PTR [eax+eax*1],eax
     1db:	00 08                	add    BYTE PTR [eax],cl
     1dd:	0e                   	push   cs
     1de:	6c                   	ins    BYTE PTR es:[edi],dx
     1df:	03 00                	add    eax,DWORD PTR [eax]
     1e1:	00 10                	add    BYTE PTR [eax],dl
     1e3:	0e                   	push   cs
     1e4:	8c 00                	mov    WORD PTR [eax],es
     1e6:	00 00                	add    BYTE PTR [eax],al
     1e8:	20 0e                	and    BYTE PTR [esi],cl
     1ea:	2d 03 00 00 40       	sub    eax,0x40000003
     1ef:	00 08                	add    BYTE PTR [eax],cl
     1f1:	10 05 19 29 02 00    	adc    BYTE PTR ds:0x22919,al
     1f7:	00 06                	add    BYTE PTR [esi],al
     1f9:	5e                   	pop    esi
     1fa:	02 00                	add    al,BYTE PTR [eax]
     1fc:	00 05 1b 29 02 00    	add    BYTE PTR ds:0x2291b,al
     202:	00 00                	add    BYTE PTR [eax],al
     204:	06                   	push   es
     205:	6e                   	outs   dx,BYTE PTR ds:[esi]
     206:	00 00                	add    BYTE PTR [eax],al
     208:	00 05 1c 29 02 00    	add    BYTE PTR ds:0x2291c,al
     20e:	00 04 06             	add    BYTE PTR [esi+eax*1],al
     211:	6f                   	outs   dx,DWORD PTR ds:[esi]
     212:	01 00                	add    DWORD PTR [eax],eax
     214:	00 05 1d ca 00 00    	add    BYTE PTR ds:0xca1d,al
     21a:	00 08                	add    BYTE PTR [eax],cl
     21c:	06                   	push   es
     21d:	a0 01 00 00 05       	mov    al,ds:0x5000001
     222:	1e                   	push   ds
     223:	3a 00                	cmp    al,BYTE PTR [eax]
     225:	00 00                	add    BYTE PTR [eax],al
     227:	0c 00                	or     al,0x0
     229:	0f 04                	(bad)  
     22b:	25 00 00 00 04       	and    eax,0x4000000
     230:	27                   	daa    
     231:	04 00                	add    al,0x0
     233:	00 05 1f f0 01 00    	add    BYTE PTR ds:0x1f01f,al
     239:	00 10                	add    BYTE PTR [eax],dl
     23b:	87 01                	xchg   DWORD PTR [ecx],eax
     23d:	00 00                	add    BYTE PTR [eax],al
     23f:	01 0c 00             	add    DWORD PTR [eax+eax*1],ecx
     242:	00 10                	add    BYTE PTR [eax],dl
     244:	03 19                	add    ebx,DWORD PTR [ecx]
     246:	00 00                	add    BYTE PTR [eax],al
     248:	00 01                	add    BYTE PTR [ecx],al
     24a:	9c                   	pushf  
     24b:	11 5a 00             	adc    DWORD PTR [edx+0x0],ebx
     24e:	00 00                	add    BYTE PTR [eax],al
     250:	01 11                	add    DWORD PTR [ecx],edx
     252:	19 00                	sbb    DWORD PTR [eax],eax
     254:	10 03                	adc    BYTE PTR [ebx],al
     256:	4f                   	dec    edi
     257:	00 00                	add    BYTE PTR [eax],al
     259:	00 01                	add    BYTE PTR [ecx],al
     25b:	9c                   	pushf  
     25c:	79 02                	jns    260 <cmdClearScreen-0x30ffda0>
     25e:	00 00                	add    BYTE PTR [eax],al
     260:	12 1f                	adc    bl,BYTE PTR [edi]
     262:	00 10                	add    BYTE PTR [eax],dl
     264:	03 46 00             	add    eax,DWORD PTR [esi+0x0]
     267:	00 00                	add    BYTE PTR [eax],al
     269:	13 63 6e             	adc    esp,DWORD PTR [ebx+0x6e]
     26c:	74 00                	je     26e <cmdClearScreen-0x30ffd92>
     26e:	01 13                	add    DWORD PTR [ebx],edx
     270:	3a 00                	cmp    al,BYTE PTR [eax]
     272:	00 00                	add    BYTE PTR [eax],al
     274:	02 91 6c 00 00 14    	add    dl,BYTE PTR [ecx+0x1400006c]
     27a:	23 03                	and    eax,DWORD PTR [ebx]
     27c:	00 00                	add    BYTE PTR [eax],al
     27e:	01 1d 68 00 10 03    	add    DWORD PTR ds:0x3100068,ebx
     284:	5d                   	pop    ebp
     285:	01 00                	add    DWORD PTR [eax],eax
     287:	00 01                	add    BYTE PTR [ecx],al
     289:	9c                   	pushf  
     28a:	fc                   	cld    
     28b:	02 00                	add    al,BYTE PTR [eax]
     28d:	00 15 94 00 00 00    	add    BYTE PTR ds:0x94,dl
     293:	01 1d 29 02 00 00    	add    DWORD PTR ds:0x229,ebx
     299:	02 91 00 16 57 02    	add    dl,BYTE PTR [ecx+0x2571600]
     29f:	00 00                	add    BYTE PTR [eax],al
     2a1:	01 1f                	add    DWORD PTR [edi],ebx
     2a3:	fc                   	cld    
     2a4:	02 00                	add    al,BYTE PTR [eax]
     2a6:	00 03                	add    BYTE PTR [ebx],al
     2a8:	91                   	xchg   ecx,eax
     2a9:	dc 75 16             	fdiv   QWORD PTR [ebp+0x16]
     2ac:	d3 01                	rol    DWORD PTR [ecx],cl
     2ae:	00 00                	add    BYTE PTR [eax],al
     2b0:	01 20                	add    DWORD PTR [eax],esp
     2b2:	29 02                	sub    DWORD PTR [edx],eax
     2b4:	00 00                	add    BYTE PTR [eax],al
     2b6:	02 91 60 16 1a 00    	add    dl,BYTE PTR [ecx+0x1a1660]
     2bc:	00 00                	add    BYTE PTR [eax],al
     2be:	01 20                	add    DWORD PTR [eax],esp
     2c0:	29 02                	sub    DWORD PTR [edx],eax
     2c2:	00 00                	add    BYTE PTR [eax],al
     2c4:	02 91 5c 12 93 00    	add    dl,BYTE PTR [ecx+0x93125c]
     2ca:	10 03                	adc    BYTE PTR [ebx],al
     2cc:	29 01                	sub    DWORD PTR [ecx],eax
     2ce:	00 00                	add    BYTE PTR [eax],al
     2d0:	16                   	push   ss
     2d1:	f0 02 00             	lock add al,BYTE PTR [eax]
     2d4:	00 01                	add    BYTE PTR [ecx],al
     2d6:	24 3a                	and    al,0x3a
     2d8:	00 00                	add    BYTE PTR [eax],al
     2da:	00 02                	add    BYTE PTR [edx],al
     2dc:	91                   	xchg   ecx,eax
     2dd:	6c                   	ins    BYTE PTR es:[edi],dx
     2de:	16                   	push   ss
     2df:	d6                   	(bad)  
     2e0:	03 00                	add    eax,DWORD PTR [eax]
     2e2:	00 01                	add    BYTE PTR [ecx],al
     2e4:	24 3a                	and    al,0x3a
     2e6:	00 00                	add    BYTE PTR [eax],al
     2e8:	00 02                	add    BYTE PTR [edx],al
     2ea:	91                   	xchg   ecx,eax
     2eb:	68 16 74 03 00       	push   0x37416
     2f0:	00 01                	add    BYTE PTR [ecx],al
     2f2:	25 3a 00 00 00       	and    eax,0x3a
     2f7:	02 91 64 00 00 17    	add    dl,BYTE PTR [ecx+0x17000064]
     2fd:	25 00 00 00 12       	and    eax,0x12000000
     302:	03 00                	add    eax,DWORD PTR [eax]
     304:	00 18                	add    BYTE PTR [eax],bl
     306:	93                   	xchg   ebx,eax
     307:	00 00                	add    BYTE PTR [eax],al
     309:	00 09                	add    BYTE PTR [ecx],cl
     30b:	18 93 00 00 00 7f    	sbb    BYTE PTR [ebx+0x7f000000],dl
     311:	00 19                	add    BYTE PTR [ecx],bl
     313:	20 04 00             	and    BYTE PTR [eax+eax*1],al
     316:	00 01                	add    BYTE PTR [ecx],al
     318:	3c 3a                	cmp    al,0x3a
     31a:	00 00                	add    BYTE PTR [eax],al
     31c:	00 c5                	add    ch,al
     31e:	01 10                	add    DWORD PTR [eax],edx
     320:	03 8b 00 00 00 01    	add    ecx,DWORD PTR [ebx+0x1000000]
     326:	9c                   	pushf  
     327:	8a 03                	mov    al,BYTE PTR [ebx]
     329:	00 00                	add    BYTE PTR [eax],al
     32b:	15 8d 03 00 00       	adc    eax,0x38d
     330:	01 3c 29             	add    DWORD PTR [ecx+ebp*1],edi
     333:	02 00                	add    al,BYTE PTR [eax]
     335:	00 02                	add    BYTE PTR [edx],al
     337:	91                   	xchg   ecx,eax
     338:	00 15 cf 05 00 00    	add    BYTE PTR ds:0x5cf,dl
     33e:	01 3c 3a             	add    DWORD PTR [edx+edi*1],edi
     341:	00 00                	add    BYTE PTR [eax],al
     343:	00 02                	add    BYTE PTR [edx],al
     345:	91                   	xchg   ecx,eax
     346:	04 15                	add    al,0x15
     348:	bf 04 00 00 01       	mov    edi,0x1000004
     34d:	3c 8a                	cmp    al,0x8a
     34f:	03 00                	add    eax,DWORD PTR [eax]
     351:	00 02                	add    BYTE PTR [edx],al
     353:	91                   	xchg   ecx,eax
     354:	08 15 01 02 00 00    	or     BYTE PTR ds:0x201,dl
     35a:	01 3c 8c             	add    DWORD PTR [esp+ecx*4],edi
     35d:	00 00                	add    BYTE PTR [eax],al
     35f:	00 02                	add    BYTE PTR [edx],al
     361:	91                   	xchg   ecx,eax
     362:	5c                   	pop    esp
     363:	13 70 69             	adc    esi,DWORD PTR [eax+0x69]
     366:	64 00 01             	add    BYTE PTR fs:[ecx],al
     369:	3e 3a 00             	cmp    al,BYTE PTR ds:[eax]
     36c:	00 00                	add    BYTE PTR [eax],al
     36e:	02 91 6c 12 f9 01    	add    dl,BYTE PTR [ecx+0x1f9126c]
     374:	10 03                	adc    BYTE PTR [ebx],al
     376:	41                   	inc    ecx
     377:	00 00                	add    BYTE PTR [eax],al
     379:	00 13                	add    BYTE PTR [ebx],dl
     37b:	72 65                	jb     3e2 <cmdClearScreen-0x30ffc1e>
     37d:	74 00                	je     37f <cmdClearScreen-0x30ffc81>
     37f:	01 46 90             	add    DWORD PTR [esi-0x70],eax
     382:	03 00                	add    eax,DWORD PTR [eax]
     384:	00 02                	add    BYTE PTR [edx],al
     386:	91                   	xchg   ecx,eax
     387:	62 00                	bound  eax,QWORD PTR [eax]
     389:	00 0f                	add    BYTE PTR [edi],cl
     38b:	04 29                	add    al,0x29
     38d:	02 00                	add    al,BYTE PTR [eax]
     38f:	00 17                	add    BYTE PTR [edi],dl
     391:	25 00 00 00 a0       	and    eax,0xa0000000
     396:	03 00                	add    eax,DWORD PTR [eax]
     398:	00 18                	add    BYTE PTR [eax],bl
     39a:	93                   	xchg   ebx,eax
     39b:	00 00                	add    BYTE PTR [eax],al
     39d:	00 09                	add    BYTE PTR [ecx],cl
     39f:	00 19                	add    BYTE PTR [ecx],bl
     3a1:	3b 01                	cmp    eax,DWORD PTR [ecx]
     3a3:	00 00                	add    BYTE PTR [eax],al
     3a5:	01 50 3a             	add    DWORD PTR [eax+0x3a],edx
     3a8:	00 00                	add    BYTE PTR [eax],al
     3aa:	00 50 02             	add    BYTE PTR [eax+0x2],dl
     3ad:	10 03                	adc    BYTE PTR [ebx],al
     3af:	e2 03                	loop   3b4 <cmdClearScreen-0x30ffc4c>
     3b1:	00 00                	add    BYTE PTR [eax],al
     3b3:	01 9c 21 05 00 00 15 	add    DWORD PTR [ecx+eiz*1+0x15000005],ebx
     3ba:	94                   	xchg   esp,eax
     3bb:	00 00                	add    BYTE PTR [eax],al
     3bd:	00 01                	add    BYTE PTR [ecx],al
     3bf:	50                   	push   eax
     3c0:	29 02                	sub    DWORD PTR [edx],eax
     3c2:	00 00                	add    BYTE PTR [eax],al
     3c4:	02 91 00 15 cc 03    	add    dl,BYTE PTR [ecx+0x3cc1500]
     3ca:	00 00                	add    BYTE PTR [eax],al
     3cc:	01 50 3a             	add    DWORD PTR [eax+0x3a],edx
     3cf:	00 00                	add    BYTE PTR [eax],al
     3d1:	00 02                	add    BYTE PTR [edx],al
     3d3:	91                   	xchg   ecx,eax
     3d4:	04 15                	add    al,0x15
     3d6:	41                   	inc    ecx
     3d7:	01 00                	add    DWORD PTR [eax],eax
     3d9:	00 01                	add    BYTE PTR [ecx],al
     3db:	50                   	push   eax
     3dc:	3a 00                	cmp    al,BYTE PTR [eax]
     3de:	00 00                	add    BYTE PTR [eax],al
     3e0:	02 91 08 15 11 03    	add    dl,BYTE PTR [ecx+0x3111508]
     3e6:	00 00                	add    BYTE PTR [eax],al
     3e8:	01 50 3a             	add    DWORD PTR [eax+0x3a],edx
     3eb:	00 00                	add    BYTE PTR [eax],al
     3ed:	00 02                	add    BYTE PTR [edx],al
     3ef:	91                   	xchg   ecx,eax
     3f0:	0c 16                	or     al,0x16
     3f2:	01 02                	add    DWORD PTR [edx],eax
     3f4:	00 00                	add    BYTE PTR [eax],al
     3f6:	01 52 8c             	add    DWORD PTR [edx-0x74],edx
     3f9:	00 00                	add    BYTE PTR [eax],al
     3fb:	00 02                	add    BYTE PTR [edx],al
     3fd:	91                   	xchg   ecx,eax
     3fe:	6f                   	outs   dx,DWORD PTR ds:[esi]
     3ff:	16                   	push   ss
     400:	63 02                	arpl   WORD PTR [edx],ax
     402:	00 00                	add    BYTE PTR [eax],al
     404:	01 53 3a             	add    DWORD PTR [ebx+0x3a],edx
     407:	00 00                	add    BYTE PTR [eax],al
     409:	00 02                	add    BYTE PTR [edx],al
     40b:	91                   	xchg   ecx,eax
     40c:	58                   	pop    eax
     40d:	1a 74 6f 6b          	sbb    dh,BYTE PTR [edi+ebp*2+0x6b]
     411:	00 01                	add    BYTE PTR [ecx],al
     413:	54                   	push   esp
     414:	29 02                	sub    DWORD PTR [edx],eax
     416:	00 00                	add    BYTE PTR [eax],al
     418:	13 70 67             	adc    esi,DWORD PTR [eax+0x67]
     41b:	6d                   	ins    DWORD PTR es:[edi],dx
     41c:	00 01                	add    BYTE PTR [ecx],al
     41e:	55                   	push   ebp
     41f:	29 02                	sub    DWORD PTR [edx],eax
     421:	00 00                	add    BYTE PTR [eax],al
     423:	02 91 54 16 e5 02    	add    dl,BYTE PTR [ecx+0x2e51654]
     429:	00 00                	add    BYTE PTR [eax],al
     42b:	01 56 21             	add    DWORD PTR [esi+0x21],edx
     42e:	05 00 00 03 91       	add    eax,0x91030000
     433:	c0 7d 16 57          	sar    BYTE PTR [ebp+0x16],0x57
     437:	02 00                	add    al,BYTE PTR [eax]
     439:	00 01                	add    BYTE PTR [ecx],al
     43b:	58                   	pop    eax
     43c:	fc                   	cld    
     43d:	02 00                	add    al,BYTE PTR [eax]
     43f:	00 03                	add    BYTE PTR [ebx],al
     441:	91                   	xchg   ecx,eax
     442:	c0                   	(bad)  
     443:	73 16                	jae    45b <cmdClearScreen-0x30ffba5>
     445:	0f 00 00             	sldt   WORD PTR [eax]
     448:	00 01                	add    BYTE PTR [ecx],al
     44a:	59                   	pop    ecx
     44b:	29 02                	sub    DWORD PTR [edx],eax
     44d:	00 00                	add    BYTE PTR [eax],al
     44f:	02 91 48 1b 1e 02    	add    dl,BYTE PTR [ecx+0x21e1b48]
     455:	00 00                	add    BYTE PTR [eax],al
     457:	01 59 29             	add    DWORD PTR [ecx+0x29],ebx
     45a:	02 00                	add    al,BYTE PTR [eax]
     45c:	00 16                	add    BYTE PTR [esi],dl
     45e:	83 03 00             	add    DWORD PTR [ebx],0x0
     461:	00 01                	add    BYTE PTR [ecx],al
     463:	5a                   	pop    edx
     464:	29 02                	sub    DWORD PTR [edx],eax
     466:	00 00                	add    BYTE PTR [eax],al
     468:	02 91 68 16 d1 02    	add    dl,BYTE PTR [ecx+0x2d11668]
     46e:	00 00                	add    BYTE PTR [eax],al
     470:	01 5a 29             	add    DWORD PTR [edx+0x29],ebx
     473:	02 00                	add    al,BYTE PTR [eax]
     475:	00 02                	add    BYTE PTR [edx],al
     477:	91                   	xchg   ecx,eax
     478:	50                   	push   eax
     479:	16                   	push   ss
     47a:	10 04 00             	adc    BYTE PTR [eax+eax*1],al
     47d:	00 01                	add    BYTE PTR [ecx],al
     47f:	5a                   	pop    edx
     480:	29 02                	sub    DWORD PTR [edx],eax
     482:	00 00                	add    BYTE PTR [eax],al
     484:	02 91 4c 16 cf 05    	add    dl,BYTE PTR [ecx+0x5cf164c]
     48a:	00 00                	add    BYTE PTR [eax],al
     48c:	01 5b 3a             	add    DWORD PTR [ebx+0x3a],ebx
     48f:	00 00                	add    BYTE PTR [eax],al
     491:	00 03                	add    BYTE PTR [ebx],al
     493:	91                   	xchg   ecx,eax
     494:	bc 73 16 bf 04       	mov    esp,0x4bf1673
     499:	00 00                	add    BYTE PTR [eax],al
     49b:	01 5c 8a 03          	add    DWORD PTR [edx+ecx*4+0x3],ebx
     49f:	00 00                	add    BYTE PTR [eax],al
     4a1:	02 91 44 16 24 00    	add    dl,BYTE PTR [ecx+0x241644]
     4a7:	00 00                	add    BYTE PTR [eax],al
     4a9:	01 81 bf 00 00 00    	add    DWORD PTR [ecx+0xbf],eax
     4af:	03 91 b4 73 1c df    	add    edx,DWORD PTR [ecx-0x20e38c4c]
     4b5:	02 10                	add    dl,BYTE PTR [eax]
     4b7:	03 a6 00 00 00 dd    	add    esp,DWORD PTR [esi-0x23000000]
     4bd:	04 00                	add    al,0x0
     4bf:	00 16                	add    BYTE PTR [esi],dl
     4c1:	f8                   	clc    
     4c2:	02 00                	add    al,BYTE PTR [eax]
     4c4:	00 01                	add    BYTE PTR [ecx],al
     4c6:	63 29                	arpl   WORD PTR [ecx],bp
     4c8:	02 00                	add    al,BYTE PTR [eax]
     4ca:	00 02                	add    BYTE PTR [edx],al
     4cc:	91                   	xchg   ecx,eax
     4cd:	64 13 65 6e          	adc    esp,DWORD PTR fs:[ebp+0x6e]
     4d1:	64 00 01             	add    BYTE PTR fs:[ecx],al
     4d4:	66 29 02             	sub    WORD PTR [edx],ax
     4d7:	00 00                	add    BYTE PTR [eax],al
     4d9:	02 91 60 00 1c 85    	add    dl,BYTE PTR [ecx-0x7ae3ffa0]
     4df:	04 10                	add    al,0x10
     4e1:	03 be 00 00 00 07    	add    edi,DWORD PTR [esi+0x7000000]
     4e7:	05 00 00 16 78       	add    eax,0x78160000
     4ec:	01 00                	add    DWORD PTR [eax],eax
     4ee:	00 01                	add    BYTE PTR [ecx],al
     4f0:	8f                   	(bad)  
     4f1:	3a 00                	cmp    al,BYTE PTR [eax]
     4f3:	00 00                	add    BYTE PTR [eax],al
     4f5:	02 91 5c 16 f8 01    	add    dl,BYTE PTR [ecx+0x1f8165c]
     4fb:	00 00                	add    BYTE PTR [eax],al
     4fd:	01 9c 3a 00 00 00 02 	add    DWORD PTR [edx+edi*1+0x2000000],ebx
     504:	91                   	xchg   ecx,eax
     505:	40                   	inc    eax
     506:	00 12                	add    BYTE PTR [edx],dl
     508:	63 05 10 03 72 00    	arpl   WORD PTR ds:0x720310,ax
     50e:	00 00                	add    BYTE PTR [eax],al
     510:	13 72 65             	adc    esi,DWORD PTR [edx+0x65]
     513:	74 00                	je     515 <cmdClearScreen-0x30ffaeb>
     515:	01 b0 90 03 00 00    	add    DWORD PTR [eax+0x390],esi
     51b:	03 91 aa 73 00 00    	add    edx,DWORD PTR [ecx+0x73aa]
     521:	17                   	pop    ss
     522:	25 00 00 00 31       	and    eax,0x31000000
     527:	05 00 00 18 93       	add    eax,0x93180000
     52c:	00 00                	add    BYTE PTR [eax],al
     52e:	00 ff                	add    bh,bh
     530:	00 14 3c             	add    BYTE PTR [esp+edi*1],dl
     533:	03 00                	add    eax,DWORD PTR [eax]
     535:	00 01                	add    BYTE PTR [ecx],al
     537:	c0                   	(bad)  
     538:	32 06                	xor    al,BYTE PTR [esi]
     53a:	10 03                	adc    BYTE PTR [ebx],al
     53c:	3e 00 00             	add    BYTE PTR ds:[eax],al
     53f:	00 01                	add    BYTE PTR [ecx],al
     541:	9c                   	pushf  
     542:	71 05                	jno    549 <cmdClearScreen-0x30ffab7>
     544:	00 00                	add    BYTE PTR [eax],al
     546:	15 94 00 00 00       	adc    eax,0x94
     54b:	01 c0                	add    eax,eax
     54d:	29 02                	sub    DWORD PTR [edx],eax
     54f:	00 00                	add    BYTE PTR [eax],al
     551:	02 91 00 16 30 01    	add    dl,BYTE PTR [ecx+0x1301600]
     557:	00 00                	add    BYTE PTR [eax],al
     559:	01 c2                	add    edx,eax
     55b:	61                   	popa   
     55c:	00 00                	add    BYTE PTR [eax],al
     55e:	00 02                	add    BYTE PTR [edx],al
     560:	91                   	xchg   ecx,eax
     561:	6c                   	ins    BYTE PTR es:[edi],dx
     562:	16                   	push   ss
     563:	33 03                	xor    eax,DWORD PTR [ebx]
     565:	00 00                	add    BYTE PTR [eax],al
     567:	01 c2                	add    edx,eax
     569:	61                   	popa   
     56a:	00 00                	add    BYTE PTR [eax],al
     56c:	00 02                	add    BYTE PTR [edx],al
     56e:	91                   	xchg   ecx,eax
     56f:	68 00 14 4d 02       	push   0x24d1400
     574:	00 00                	add    BYTE PTR [eax],al
     576:	01 cb                	add    ebx,ecx
     578:	70 06                	jo     580 <cmdClearScreen-0x30ffa80>
     57a:	10 03                	adc    BYTE PTR [ebx],al
     57c:	c7 00 00 00 01 9c    	mov    DWORD PTR [eax],0x9c010000
     582:	e1 05                	loope  589 <cmdClearScreen-0x30ffa77>
     584:	00 00                	add    BYTE PTR [eax],al
     586:	15 94 00 00 00       	adc    eax,0x94
     58b:	01 cb                	add    ebx,ecx
     58d:	29 02                	sub    DWORD PTR [edx],eax
     58f:	00 00                	add    BYTE PTR [eax],al
     591:	02 91 00 16 cf 05    	add    dl,BYTE PTR [ecx+0x5cf1600]
     597:	00 00                	add    BYTE PTR [eax],al
     599:	01 cd                	add    ebp,ecx
     59b:	3a 00                	cmp    al,BYTE PTR [eax]
     59d:	00 00                	add    BYTE PTR [eax],al
     59f:	02 91 5c 16 bf 04    	add    dl,BYTE PTR [ecx+0x4bf165c]
     5a5:	00 00                	add    BYTE PTR [eax],al
     5a7:	01 ce                	add    esi,ecx
     5a9:	8a 03                	mov    al,BYTE PTR [ebx]
     5ab:	00 00                	add    BYTE PTR [eax],al
     5ad:	02 91 60 16 f8 05    	add    dl,BYTE PTR [ecx+0x5f81660]
     5b3:	00 00                	add    BYTE PTR [eax],al
     5b5:	01 cf                	add    edi,ecx
     5b7:	3a 00                	cmp    al,BYTE PTR [eax]
     5b9:	00 00                	add    BYTE PTR [eax],al
     5bb:	02 91 64 16 42 02    	add    dl,BYTE PTR [ecx+0x2421664]
     5c1:	00 00                	add    BYTE PTR [eax],al
     5c3:	01 d0                	add    eax,edx
     5c5:	29 02                	sub    DWORD PTR [edx],eax
     5c7:	00 00                	add    BYTE PTR [eax],al
     5c9:	02 91 6c 1d 00 00    	add    dl,BYTE PTR [ecx+0x1d6c]
     5cf:	00 00                	add    BYTE PTR [eax],al
     5d1:	13 63 6e             	adc    esp,DWORD PTR [ebx+0x6e]
     5d4:	74 00                	je     5d6 <cmdClearScreen-0x30ffa2a>
     5d6:	01 dc                	add    esp,ebx
     5d8:	3a 00                	cmp    al,BYTE PTR [eax]
     5da:	00 00                	add    BYTE PTR [eax],al
     5dc:	02 91 68 00 00 14    	add    dl,BYTE PTR [ecx+0x14000068]
     5e2:	83 00 00             	add    DWORD PTR [eax],0x0
     5e5:	00 01                	add    BYTE PTR [ecx],al
     5e7:	ea 37 07 10 03 1a 00 	jmp    0x1a:0x3100737
     5ee:	00 00                	add    BYTE PTR [eax],al
     5f0:	01 9c 05 06 00 00 15 	add    DWORD PTR [ebp+eax*1+0x15000006],ebx
     5f7:	94                   	xchg   esp,eax
     5f8:	00 00                	add    BYTE PTR [eax],al
     5fa:	00 01                	add    BYTE PTR [ecx],al
     5fc:	ea 29 02 00 00 02 91 	jmp    0x9102:0x229
     603:	00 00                	add    BYTE PTR [eax],al
     605:	14 2a                	adc    al,0x2a
     607:	00 00                	add    BYTE PTR [eax],al
     609:	00 01                	add    BYTE PTR [ecx],al
     60b:	ef                   	out    dx,eax
     60c:	51                   	push   ecx
     60d:	07                   	pop    es
     60e:	10 03                	adc    BYTE PTR [ebx],al
     610:	58                   	pop    eax
     611:	00 00                	add    BYTE PTR [eax],al
     613:	00 01                	add    BYTE PTR [ecx],al
     615:	9c                   	pushf  
     616:	38 06                	cmp    BYTE PTR [esi],al
     618:	00 00                	add    BYTE PTR [eax],al
     61a:	15 94 00 00 00       	adc    eax,0x94
     61f:	01 ef                	add    edi,ebp
     621:	29 02                	sub    DWORD PTR [edx],eax
     623:	00 00                	add    BYTE PTR [eax],al
     625:	02 91 00 16 57 02    	add    dl,BYTE PTR [ecx+0x2571600]
     62b:	00 00                	add    BYTE PTR [eax],al
     62d:	01 f1                	add    ecx,esi
     62f:	fc                   	cld    
     630:	02 00                	add    al,BYTE PTR [eax]
     632:	00 03                	add    BYTE PTR [ebx],al
     634:	91                   	xchg   ecx,eax
     635:	f0 75 00             	lock jne 638 <cmdClearScreen-0x30ff9c8>
     638:	14 84                	adc    al,0x84
     63a:	02 00                	add    al,BYTE PTR [eax]
     63c:	00 01                	add    BYTE PTR [ecx],al
     63e:	fc                   	cld    
     63f:	a9 07 10 03 ce       	test   eax,0xce031007
     644:	00 00                	add    BYTE PTR [eax],al
     646:	00 01                	add    BYTE PTR [ecx],al
     648:	9c                   	pushf  
     649:	83 06 00             	add    DWORD PTR [esi],0x0
     64c:	00 15 94 00 00 00    	add    BYTE PTR ds:0x94,dl
     652:	01 fc                	add    esp,edi
     654:	29 02                	sub    DWORD PTR [edx],eax
     656:	00 00                	add    BYTE PTR [eax],al
     658:	02 91 00 13 74 6f    	add    dl,BYTE PTR [ecx+0x6f741300]
     65e:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
     661:	fe                   	(bad)  
     662:	29 02                	sub    DWORD PTR [edx],eax
     664:	00 00                	add    BYTE PTR [eax],al
     666:	02 91 68 12 d8 07    	add    dl,BYTE PTR [ecx+0x7d81268]
     66c:	10 03                	adc    BYTE PTR [ebx],al
     66e:	9c                   	pushf  
     66f:	00 00                	add    BYTE PTR [eax],al
     671:	00 1e                	add    BYTE PTR [esi],bl
     673:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     676:	00 01                	add    BYTE PTR [ecx],al
     678:	08 01                	or     BYTE PTR [ecx],al
     67a:	6c                   	ins    BYTE PTR es:[edi],dx
     67b:	00 00                	add    BYTE PTR [eax],al
     67d:	00 02                	add    BYTE PTR [edx],al
     67f:	91                   	xchg   ecx,eax
     680:	6c                   	ins    BYTE PTR es:[edi],dx
     681:	00 00                	add    BYTE PTR [eax],al
     683:	1f                   	pop    ds
     684:	0b 01                	or     eax,DWORD PTR [ecx]
     686:	00 00                	add    BYTE PTR [eax],al
     688:	01 15 01 77 08 10    	add    DWORD PTR ds:0x10087701,edx
     68e:	03 4e 00             	add    ecx,DWORD PTR [esi+0x0]
     691:	00 00                	add    BYTE PTR [eax],al
     693:	01 9c a9 06 00 00 1e 	add    DWORD PTR [ecx+ebp*4+0x1e000006],ebx
     69a:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
     69d:	00 01                	add    BYTE PTR [ecx],al
     69f:	17                   	pop    ss
     6a0:	01 29                	add    DWORD PTR [ecx],ebp
     6a2:	02 00                	add    al,BYTE PTR [eax]
     6a4:	00 02                	add    BYTE PTR [edx],al
     6a6:	91                   	xchg   ecx,eax
     6a7:	6c                   	ins    BYTE PTR es:[edi],dx
     6a8:	00 20                	add    BYTE PTR [eax],ah
     6aa:	51                   	push   ecx
     6ab:	00 00                	add    BYTE PTR [eax],al
     6ad:	00 01                	add    BYTE PTR [ecx],al
     6af:	1c 01                	sbb    al,0x1
     6b1:	c5 08                	lds    ecx,FWORD PTR [eax]
     6b3:	10 03                	adc    BYTE PTR [ebx],al
     6b5:	11 01                	adc    DWORD PTR [ecx],eax
     6b7:	00 00                	add    BYTE PTR [eax],al
     6b9:	01 9c 43 07 00 00 21 	add    DWORD PTR [ebx+eax*2+0x21000007],ebx
     6c0:	94                   	xchg   esp,eax
     6c1:	00 00                	add    BYTE PTR [eax],al
     6c3:	00 01                	add    BYTE PTR [ecx],al
     6c5:	1c 01                	sbb    al,0x1
     6c7:	29 02                	sub    DWORD PTR [edx],eax
     6c9:	00 00                	add    BYTE PTR [eax],al
     6cb:	02 91 00 22 57 02    	add    dl,BYTE PTR [ecx+0x2572200]
     6d1:	00 00                	add    BYTE PTR [eax],al
     6d3:	01 1e                	add    DWORD PTR [esi],ebx
     6d5:	01 fc                	add    esp,edi
     6d7:	02 00                	add    al,BYTE PTR [eax]
     6d9:	00 03                	add    BYTE PTR [ebx],al
     6db:	91                   	xchg   ecx,eax
     6dc:	d8 75 22             	fdiv   DWORD PTR [ebp+0x22]
     6df:	a0 01 00 00 01       	mov    al,ds:0x1000001
     6e4:	1f                   	pop    ds
     6e5:	01 3a                	add    DWORD PTR [edx],edi
     6e7:	00 00                	add    BYTE PTR [eax],al
     6e9:	00 02                	add    BYTE PTR [edx],al
     6eb:	91                   	xchg   ecx,eax
     6ec:	64 22 67 03          	and    ah,BYTE PTR fs:[edi+0x3]
     6f0:	00 00                	add    BYTE PTR [eax],al
     6f2:	01 22                	add    DWORD PTR [edx],esp
     6f4:	01 3a                	add    DWORD PTR [edx],edi
     6f6:	00 00                	add    BYTE PTR [eax],al
     6f8:	00 02                	add    BYTE PTR [edx],al
     6fa:	91                   	xchg   ecx,eax
     6fb:	60                   	pusha  
     6fc:	22 52 03             	and    dl,BYTE PTR [edx+0x3]
     6ff:	00 00                	add    BYTE PTR [eax],al
     701:	01 23                	add    DWORD PTR [ebx],esp
     703:	01 43 07             	add    DWORD PTR [ebx+0x7],eax
     706:	00 00                	add    BYTE PTR [eax],al
     708:	03 91 58 06 1c 2f    	add    edx,DWORD PTR [ecx+0x2f1c0658]
     70e:	09 10                	or     DWORD PTR [eax],edx
     710:	03 21                	add    esp,DWORD PTR [ecx]
     712:	00 00                	add    BYTE PTR [eax],al
     714:	00 29                	add    BYTE PTR [ecx],ch
     716:	07                   	pop    es
     717:	00 00                	add    BYTE PTR [eax],al
     719:	1e                   	push   ds
     71a:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     71d:	00 01                	add    BYTE PTR [ecx],al
     71f:	25 01 3a 00 00       	and    eax,0x3a01
     724:	00 02                	add    BYTE PTR [edx],al
     726:	91                   	xchg   ecx,eax
     727:	6c                   	ins    BYTE PTR es:[edi],dx
     728:	00 12                	add    BYTE PTR [edx],dl
     72a:	50                   	push   eax
     72b:	09 10                	or     DWORD PTR [eax],edx
     72d:	03 33                	add    esi,DWORD PTR [ebx]
     72f:	00 00                	add    BYTE PTR [eax],al
     731:	00 1e                	add    BYTE PTR [esi],bl
     733:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     736:	00 01                	add    BYTE PTR [ecx],al
     738:	28 01                	sub    BYTE PTR [ecx],al
     73a:	3a 00                	cmp    al,BYTE PTR [eax]
     73c:	00 00                	add    BYTE PTR [eax],al
     73e:	02 91 68 00 00 17    	add    dl,BYTE PTR [ecx+0x17000068]
     744:	3a 00                	cmp    al,BYTE PTR [eax]
     746:	00 00                	add    BYTE PTR [eax],al
     748:	56                   	push   esi
     749:	07                   	pop    es
     74a:	00 00                	add    BYTE PTR [eax],al
     74c:	23 93 00 00 00 03    	and    edx,DWORD PTR [ebx+0x3000000]
     752:	91                   	xchg   ecx,eax
     753:	5c                   	pop    esp
     754:	06                   	push   es
     755:	00 17                	add    BYTE PTR [edi],dl
     757:	2f                   	das    
     758:	02 00                	add    al,BYTE PTR [eax]
     75a:	00 66 07             	add    BYTE PTR [esi+0x7],ah
     75d:	00 00                	add    BYTE PTR [eax],al
     75f:	18 93 00 00 00 09    	sbb    BYTE PTR [ebx+0x9000000],dl
     765:	00 16                	add    BYTE PTR [esi],dl
     767:	45                   	inc    ebp
     768:	04 00                	add    al,0x0
     76a:	00 05 3d 56 07 00    	add    BYTE PTR ds:0x7563d,al
     770:	00 05 03 a0 27 10    	add    BYTE PTR ds:0x1027a003,al
     776:	03 24 7a             	add    esp,DWORD PTR [edx+edi*2]
     779:	03 00                	add    eax,DWORD PTR [eax]
     77b:	00 06                	add    BYTE PTR [esi],al
     77d:	34 61                	xor    al,0x61
     77f:	00 00                	add    BYTE PTR [eax],al
     781:	00 05 03 50 2d 10    	add    BYTE PTR ds:0x102d5003,al
     787:	03 24 15 02 00 00 06 	add    esp,DWORD PTR [edx*1+0x6000002]
     78e:	35 61 00 00 00       	xor    eax,0x61
     793:	05 03 54 2d 10       	add    eax,0x102d5403
     798:	03 24 66             	add    esp,DWORD PTR [esi+eiz*2]
     79b:	00 00                	add    BYTE PTR [eax],al
     79d:	00 06                	add    BYTE PTR [esi],al
     79f:	36                   	ss
     7a0:	61                   	popa   
     7a1:	00 00                	add    BYTE PTR [eax],al
     7a3:	00 05 03 4c 2d 10    	add    BYTE PTR ds:0x102d4c03,al
     7a9:	03 24 ba             	add    esp,DWORD PTR [edx+edi*4]
     7ac:	03 00                	add    eax,DWORD PTR [eax]
     7ae:	00 06                	add    BYTE PTR [esi],al
     7b0:	37                   	aaa    
     7b1:	85 00                	test   DWORD PTR [eax],eax
     7b3:	00 00                	add    BYTE PTR [eax],al
     7b5:	05 03 74 2d 10       	add    eax,0x102d7403
     7ba:	03 24 57             	add    esp,DWORD PTR [edi+edx*2]
     7bd:	03 00                	add    eax,DWORD PTR [eax]
     7bf:	00 03                	add    BYTE PTR [ebx],al
     7c1:	2d cc 07 00 00       	sub    eax,0x7cc
     7c6:	05 03 48 2d 10       	add    eax,0x102d4803
     7cb:	03 0f                	add    ecx,DWORD PTR [edi]
     7cd:	04 7a                	add    al,0x7a
     7cf:	00 00                	add    BYTE PTR [eax],al
     7d1:	00 24 df             	add    BYTE PTR [edi+ebx*8],ah
     7d4:	03 00                	add    eax,DWORD PTR [eax]
     7d6:	00 03                	add    BYTE PTR [ebx],al
     7d8:	2e                   	cs
     7d9:	61                   	popa   
     7da:	00 00                	add    BYTE PTR [eax],al
     7dc:	00 05 03 20 2b 10    	add    BYTE PTR ds:0x102b2003,al
     7e2:	03 24 c5 02 00 00 07 	add    esp,DWORD PTR [eax*8+0x7000002]
     7e9:	53                   	push   ebx
     7ea:	8a 03                	mov    al,BYTE PTR [ebx]
     7ec:	00 00                	add    BYTE PTR [eax],al
     7ee:	05 03 64 2d 10       	add    eax,0x102d6403
     7f3:	03 24 f1             	add    esp,DWORD PTR [ecx+esi*8]
     7f6:	03 00                	add    eax,DWORD PTR [eax]
     7f8:	00 04 63             	add    BYTE PTR [ebx+eiz*2],al
     7fb:	4d                   	dec    ebp
     7fc:	01 00                	add    DWORD PTR [eax],eax
     7fe:	00 05 03 5c 2d 10    	add    BYTE PTR ds:0x102d5c03,al
     804:	03 24 92             	add    esp,DWORD PTR [edx+edx*4]
     807:	03 00                	add    eax,DWORD PTR [eax]
     809:	00 04 e1             	add    BYTE PTR [ecx+eiz*8],al
     80c:	9c                   	pushf  
     80d:	01 00                	add    DWORD PTR [eax],eax
     80f:	00 05 03 44 2d 10    	add    BYTE PTR ds:0x102d4403,al
     815:	03 25 24 67 01 00    	add    esp,DWORD PTR ds:0x16724
     81b:	00 05 2b 28 08 00    	add    BYTE PTR ds:0x8282b,al
     821:	00 05 03 58 2d 10    	add    BYTE PTR ds:0x102d5803,al
     827:	03 0f                	add    ecx,DWORD PTR [edi]
     829:	04 16                	add    al,0x16
     82b:	08 00                	or     BYTE PTR [eax],al
     82d:	00 26                	add    BYTE PTR [esi],ah
     82f:	39 08                	cmp    DWORD PTR [eax],ecx
     831:	00 00                	add    BYTE PTR [eax],al
     833:	27                   	daa    
     834:	29 02                	sub    DWORD PTR [edx],eax
     836:	00 00                	add    BYTE PTR [eax],al
     838:	00 24 db             	add    BYTE PTR [ebx+ebx*8],ah
     83b:	01 00                	add    DWORD PTR [eax],eax
     83d:	00 05 2c 4a 08 00    	add    BYTE PTR ds:0x84a2c,al
     843:	00 05 03 40 2d 10    	add    BYTE PTR ds:0x102d4003,al
     849:	03 0f                	add    ecx,DWORD PTR [edi]
     84b:	04 2e                	add    al,0x2e
     84d:	08 00                	or     BYTE PTR [eax],al
     84f:	00 17                	add    BYTE PTR [edi],dl
     851:	25 00 00 00 61       	and    eax,0x61000000
     856:	08 00                	or     BYTE PTR [eax],al
     858:	00 28                	add    BYTE PTR [eax],ch
     85a:	93                   	xchg   ebx,eax
     85b:	00 00                	add    BYTE PTR [eax],al
     85d:	00 ff                	add    bh,bh
     85f:	01 00                	add    DWORD PTR [eax],eax
     861:	24 2a                	and    al,0x2a
     863:	02 00                	add    al,BYTE PTR [eax]
     865:	00 05 34 50 08 00    	add    BYTE PTR ds:0x85034,al
     86b:	00 05 03 40 2b 10    	add    BYTE PTR ds:0x102b4003,al
     871:	03 24 12             	add    esp,DWORD PTR [edx+edx*1]
     874:	01 00                	add    DWORD PTR [eax],eax
     876:	00 05 35 29 02 00    	add    BYTE PTR ds:0x22935,al
     87c:	00 05 03 70 2d 10    	add    BYTE PTR ds:0x102d7003,al
     882:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     885:	00 00                	add    BYTE PTR [eax],al
     887:	00 05 36 8a 03 00    	add    BYTE PTR ds:0x38a36,al
     88d:	00 05 03 0c 2a 10    	add    BYTE PTR ds:0x102a0c03,al
     893:	03 17                	add    edx,DWORD PTR [edi]
     895:	25 00 00 00 a4       	and    eax,0xa4000000
     89a:	08 00                	or     BYTE PTR [eax],al
     89c:	00 18                	add    BYTE PTR [eax],bl
     89e:	93                   	xchg   ebx,eax
     89f:	00 00                	add    BYTE PTR [eax],al
     8a1:	00 05 00 24 3c 02    	add    BYTE PTR ds:0x23c2400,al
     8a7:	00 00                	add    BYTE PTR [eax],al
     8a9:	05 37 94 08 00       	add    eax,0x89437
     8ae:	00 05 03 04 2a 10    	add    BYTE PTR ds:0x102a0403,al
     8b4:	03 24 dc             	add    esp,DWORD PTR [esp+ebx*8]
     8b7:	02 00                	add    al,BYTE PTR [eax]
     8b9:	00 05 38 61 00 00    	add    BYTE PTR ds:0x6138,al
     8bf:	00 05 03 6c 2d 10    	add    BYTE PTR ds:0x102d6c03,al
     8c5:	03 24 b4             	add    esp,DWORD PTR [esp+esi*4]
     8c8:	02 00                	add    al,BYTE PTR [eax]
     8ca:	00 05 38 61 00 00    	add    BYTE PTR ds:0x6138,al
     8d0:	00 05 03 68 2d 10    	add    BYTE PTR ds:0x102d6803,al
     8d6:	03 24 25 01 00 00 05 	add    esp,DWORD PTR [eiz*1+0x5000001]
     8dd:	39 8c 00 00 00 05 03 	cmp    DWORD PTR [eax+eax*1+0x3050000],ecx
     8e4:	78 2d                	js     913 <cmdClearScreen-0x30ff6ed>
     8e6:	10 03                	adc    BYTE PTR [ebx],al
     8e8:	29 63 77             	sub    DWORD PTR [ebx+0x77],esp
     8eb:	64 00 05 3a 21 05 00 	add    BYTE PTR fs:0x5213a,al
     8f2:	00 05 03 20 2a 10    	add    BYTE PTR ds:0x102a2003,al
     8f8:	03 24 ab             	add    esp,DWORD PTR [ebx+ebp*4]
     8fb:	01 00                	add    DWORD PTR [eax],eax
     8fd:	00 05 3b 8c 00 00    	add    BYTE PTR ds:0x8c3b,al
     903:	00 05 03 00 2a 10    	add    BYTE PTR ds:0x102a0003,al
     909:	03 17                	add    edx,DWORD PTR [edi]
     90b:	3a 00                	cmp    al,BYTE PTR [eax]
     90d:	00 00                	add    BYTE PTR [eax],al
     90f:	1a 09                	sbb    cl,BYTE PTR [ecx]
     911:	00 00                	add    BYTE PTR [eax],al
     913:	18 93 00 00 00 01    	sbb    BYTE PTR [ebx+0x1000000],dl
     919:	00 24 c9             	add    BYTE PTR [ecx+ecx*8],ah
     91c:	01 00                	add    DWORD PTR [eax],eax
     91e:	00 01                	add    BYTE PTR [ecx],al
     920:	0a 0a                	or     cl,BYTE PTR [edx]
     922:	09 00                	or     DWORD PTR [eax],eax
     924:	00 05 03 7c 2d 10    	add    BYTE PTR ds:0x102d7c03,al
     92a:	03 00                	add    eax,DWORD PTR [eax]
     92c:	9d                   	popf   
     92d:	09 00                	or     DWORD PTR [eax],eax
     92f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     932:	44                   	inc    esp
     933:	02 00                	add    al,BYTE PTR [eax]
     935:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     938:	9c                   	pushf  
     939:	00 00                	add    BYTE PTR [eax],al
     93b:	00 0c 5e             	add    BYTE PTR [esi+ebx*2],cl
     93e:	04 00                	add    al,0x0
     940:	00 32                	add    BYTE PTR [edx],dh
     942:	00 00                	add    BYTE PTR [eax],al
     944:	00 d8                	add    al,bl
     946:	09 10                	or     DWORD PTR [eax],edx
     948:	03 80 0c 00 00 7a    	add    eax,DWORD PTR [eax+0x7a00000c]
     94e:	02 00                	add    al,BYTE PTR [eax]
     950:	00 02                	add    BYTE PTR [edx],al
     952:	01 06                	add    DWORD PTR [esi],eax
     954:	7f 02                	jg     958 <cmdClearScreen-0x30ff6a8>
     956:	00 00                	add    BYTE PTR [eax],al
     958:	02 01                	add    al,BYTE PTR [ecx]
     95a:	06                   	push   es
     95b:	78 02                	js     95f <cmdClearScreen-0x30ff6a1>
     95d:	00 00                	add    BYTE PTR [eax],al
     95f:	02 02                	add    al,BYTE PTR [edx]
     961:	05 96 01 00 00       	add    eax,0x196
     966:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     96d:	02 08                	add    cl,BYTE PTR [eax]
     96f:	05 bb 01 00 00       	add    eax,0x1bb
     974:	04 4c                	add    al,0x4c
     976:	01 00                	add    DWORD PTR [eax],eax
     978:	00 02                	add    BYTE PTR [edx],al
     97a:	2e                   	cs
     97b:	53                   	push   ebx
     97c:	00 00                	add    BYTE PTR [eax],al
     97e:	00 02                	add    BYTE PTR [edx],al
     980:	01 08                	add    DWORD PTR [eax],ecx
     982:	76 02                	jbe    986 <cmdClearScreen-0x30ff67a>
     984:	00 00                	add    BYTE PTR [eax],al
     986:	02 02                	add    al,BYTE PTR [edx]
     988:	07                   	pop    es
     989:	fe 02                	inc    BYTE PTR [edx]
     98b:	00 00                	add    BYTE PTR [eax],al
     98d:	04 ab                	add    al,0xab
     98f:	02 00                	add    al,BYTE PTR [eax]
     991:	00 02                	add    BYTE PTR [edx],al
     993:	34 6c                	xor    al,0x6c
     995:	00 00                	add    BYTE PTR [eax],al
     997:	00 02                	add    BYTE PTR [edx],al
     999:	04 07                	add    al,0x7
     99b:	96                   	xchg   esi,eax
     99c:	02 00                	add    al,BYTE PTR [eax]
     99e:	00 02                	add    BYTE PTR [edx],al
     9a0:	08 07                	or     BYTE PTR [edi],al
     9a2:	8c 02                	mov    WORD PTR [edx],es
     9a4:	00 00                	add    BYTE PTR [eax],al
     9a6:	04 5d                	add    al,0x5d
     9a8:	01 00                	add    DWORD PTR [eax],eax
     9aa:	00 02                	add    BYTE PTR [edx],al
     9ac:	56                   	push   esi
     9ad:	6c                   	ins    BYTE PTR es:[edi],dx
     9ae:	00 00                	add    BYTE PTR [eax],al
     9b0:	00 02                	add    BYTE PTR [edx],al
     9b2:	04 05                	add    al,0x5
     9b4:	c0 01 00             	rol    BYTE PTR [ecx],0x0
     9b7:	00 05 04 92 00 00    	add    BYTE PTR ds:0x9204,al
     9bd:	00 06                	add    BYTE PTR [esi],al
     9bf:	25 00 00 00 02       	and    eax,0x2000000
     9c4:	01 02                	add    DWORD PTR [edx],eax
     9c6:	44                   	inc    esp
     9c7:	03 00                	add    eax,DWORD PTR [eax]
     9c9:	00 02                	add    BYTE PTR [edx],al
     9cb:	04 07                	add    al,0x7
     9cd:	7a 00                	jp     9cf <cmdClearScreen-0x30ff631>
     9cf:	00 00                	add    BYTE PTR [eax],al
     9d1:	07                   	pop    es
     9d2:	04 08                	add    al,0x8
     9d4:	05 03 58 28 01       	add    eax,0x1285803
     9d9:	00 00                	add    BYTE PTR [eax],al
     9db:	09 1b                	or     DWORD PTR [ebx],ebx
     9dd:	04 00                	add    al,0x0
     9df:	00 03                	add    BYTE PTR [ebx],al
     9e1:	59                   	pop    ecx
     9e2:	48                   	dec    eax
     9e3:	00 00                	add    BYTE PTR [eax],al
     9e5:	00 01                	add    BYTE PTR [ecx],al
     9e7:	04 04                	add    al,0x4
     9e9:	00 09                	add    BYTE PTR [ecx],cl
     9eb:	1d 03 00 00 03       	sbb    eax,0x3000003
     9f0:	5a                   	pop    edx
     9f1:	48                   	dec    eax
     9f2:	00 00                	add    BYTE PTR [eax],al
     9f4:	00 01                	add    BYTE PTR [ecx],al
     9f6:	04 00                	add    al,0x0
     9f8:	00 09                	add    BYTE PTR [ecx],cl
     9fa:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
     9fb:	02 00                	add    al,BYTE PTR [eax]
     9fd:	00 03                	add    BYTE PTR [ebx],al
     9ff:	5b                   	pop    ebx
     a00:	48                   	dec    eax
     a01:	00 00                	add    BYTE PTR [eax],al
     a03:	00 01                	add    BYTE PTR [ecx],al
     a05:	04 04                	add    al,0x4
     a07:	01 09                	add    DWORD PTR [ecx],ecx
     a09:	7e 00                	jle    a0b <cmdClearScreen-0x30ff5f5>
     a0b:	00 00                	add    BYTE PTR [eax],al
     a0d:	03 5c 48 00          	add    ebx,DWORD PTR [eax+ecx*2+0x0]
     a11:	00 00                	add    BYTE PTR [eax],al
     a13:	01 02                	add    DWORD PTR [edx],eax
     a15:	02 01                	add    al,BYTE PTR [ecx]
     a17:	09 ee                	or     esi,ebp
     a19:	01 00                	add    DWORD PTR [eax],eax
     a1b:	00 03                	add    BYTE PTR [ebx],al
     a1d:	5d                   	pop    ebp
     a1e:	48                   	dec    eax
     a1f:	00 00                	add    BYTE PTR [eax],al
     a21:	00 01                	add    BYTE PTR [ecx],al
     a23:	02 00                	add    al,BYTE PTR [eax]
     a25:	01 09                	add    DWORD PTR [ecx],ecx
     a27:	1c 03                	sbb    al,0x3
     a29:	00 00                	add    BYTE PTR [eax],al
     a2b:	03 5e 48             	add    ebx,DWORD PTR [esi+0x48]
     a2e:	00 00                	add    BYTE PTR [eax],al
     a30:	00 01                	add    BYTE PTR [ecx],al
     a32:	04 04                	add    al,0x4
     a34:	02 09                	add    cl,BYTE PTR [ecx]
     a36:	a3 02 00 00 03       	mov    ds:0x3000002,eax
     a3b:	5f                   	pop    edi
     a3c:	48                   	dec    eax
     a3d:	00 00                	add    BYTE PTR [eax],al
     a3f:	00 01                	add    BYTE PTR [ecx],al
     a41:	08 00                	or     BYTE PTR [eax],al
     a43:	03 09                	add    ecx,DWORD PTR [ecx]
     a45:	f3 01 00             	repz add DWORD PTR [eax],eax
     a48:	00 03                	add    BYTE PTR [ebx],al
     a4a:	60                   	pusha  
     a4b:	48                   	dec    eax
     a4c:	00 00                	add    BYTE PTR [eax],al
     a4e:	00 01                	add    BYTE PTR [ecx],al
     a50:	04 04                	add    al,0x4
     a52:	04 00                	add    al,0x0
     a54:	0a 08                	or     cl,BYTE PTR [eax]
     a56:	03 56 41             	add    edx,DWORD PTR [esi+0x41]
     a59:	01 00                	add    DWORD PTR [eax],eax
     a5b:	00 0b                	add    BYTE PTR [ebx],cl
     a5d:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
     a5e:	00 00                	add    BYTE PTR [eax],al
     a60:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     a63:	65 67 00 03          	add    BYTE PTR gs:[bp+di],al
     a67:	62 61 00             	bound  esp,QWORD PTR [ecx+0x0]
     a6a:	00 00                	add    BYTE PTR [eax],al
     a6c:	00 08                	add    BYTE PTR [eax],cl
     a6e:	04 03                	add    al,0x3
     a70:	db 77 01             	(bad)  [edi+0x1]
     a73:	00 00                	add    BYTE PTR [eax],al
     a75:	09 ae 03 00 00 03    	or     DWORD PTR [esi+0x3000003],ebp
     a7b:	dc 48 00             	fmul   QWORD PTR [eax+0x0]
     a7e:	00 00                	add    BYTE PTR [eax],al
     a80:	01 01                	add    DWORD PTR [ecx],eax
     a82:	07                   	pop    es
     a83:	00 09                	add    BYTE PTR [ecx],cl
     a85:	c1 03 00             	rol    DWORD PTR [ebx],0x0
     a88:	00 03                	add    BYTE PTR [ebx],al
     a8a:	dd 48 00             	fisttp QWORD PTR [eax+0x0]
     a8d:	00 00                	add    BYTE PTR [eax],al
     a8f:	01 01                	add    DWORD PTR [ecx],eax
     a91:	06                   	push   es
     a92:	00 09                	add    BYTE PTR [ecx],cl
     a94:	00 04 00             	add    BYTE PTR [eax+eax*1],al
     a97:	00 03                	add    BYTE PTR [ebx],al
     a99:	de 61 00             	fisub  WORD PTR [ecx+0x0]
     a9c:	00 00                	add    BYTE PTR [eax],al
     a9e:	04 1e                	add    al,0x1e
     aa0:	00 00                	add    BYTE PTR [eax],al
     aa2:	00 0a                	add    BYTE PTR [edx],cl
     aa4:	04 03                	add    al,0x3
     aa6:	da 90 01 00 00 0b    	ficom  DWORD PTR [eax+0xb000001]
     aac:	41                   	inc    ecx
     aad:	01 00                	add    DWORD PTR [eax],eax
     aaf:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     ab2:	65 67 00 03          	add    BYTE PTR gs:[bp+di],al
     ab6:	e0 61                	loopne b19 <cmdClearScreen-0x30ff4e7>
     ab8:	00 00                	add    BYTE PTR [eax],al
     aba:	00 00                	add    BYTE PTR [eax],al
     abc:	0d 54 01 00 00       	or     eax,0x154
     ac1:	04 6c                	add    al,0x6c
     ac3:	00 00                	add    BYTE PTR [eax],al
     ac5:	00 08                	add    BYTE PTR [eax],cl
     ac7:	15 cb 01 00 00       	adc    eax,0x1cb
     acc:	0e                   	push   cs
     acd:	4a                   	dec    edx
     ace:	03 00                	add    eax,DWORD PTR [eax]
     ad0:	00 01                	add    BYTE PTR [ecx],al
     ad2:	0e                   	push   cs
     ad3:	0c 02                	or     al,0x2
     ad5:	00 00                	add    BYTE PTR [eax],al
     ad7:	02 0e                	add    cl,BYTE PTR [esi]
     ad9:	01 01                	add    DWORD PTR [ecx],eax
     adb:	00 00                	add    BYTE PTR [eax],al
     add:	04 0e                	add    al,0xe
     adf:	09 04 00             	or     DWORD PTR [eax+eax*1],eax
     ae2:	00 08                	add    BYTE PTR [eax],cl
     ae4:	0e                   	push   cs
     ae5:	6c                   	ins    BYTE PTR es:[edi],dx
     ae6:	03 00                	add    eax,DWORD PTR [eax]
     ae8:	00 10                	add    BYTE PTR [eax],dl
     aea:	0e                   	push   cs
     aeb:	8c 00                	mov    WORD PTR [eax],es
     aed:	00 00                	add    BYTE PTR [eax],al
     aef:	20 0e                	and    BYTE PTR [esi],cl
     af1:	2d 03 00 00 40       	sub    eax,0x40000003
     af6:	00 08                	add    BYTE PTR [eax],cl
     af8:	10 04 19             	adc    BYTE PTR [ecx+ebx*1],al
     afb:	04 02                	add    al,0x2
     afd:	00 00                	add    BYTE PTR [eax],al
     aff:	0f 5e 02             	divps  xmm0,XMMWORD PTR [edx]
     b02:	00 00                	add    BYTE PTR [eax],al
     b04:	04 1b                	add    al,0x1b
     b06:	04 02                	add    al,0x2
     b08:	00 00                	add    BYTE PTR [eax],al
     b0a:	00 0f                	add    BYTE PTR [edi],cl
     b0c:	6e                   	outs   dx,BYTE PTR ds:[esi]
     b0d:	00 00                	add    BYTE PTR [eax],al
     b0f:	00 04 1c             	add    BYTE PTR [esp+ebx*1],al
     b12:	04 02                	add    al,0x2
     b14:	00 00                	add    BYTE PTR [eax],al
     b16:	04 0f                	add    al,0xf
     b18:	6f                   	outs   dx,DWORD PTR ds:[esi]
     b19:	01 00                	add    DWORD PTR [eax],eax
     b1b:	00 04 1d a5 00 00 00 	add    BYTE PTR [ebx*1+0xa5],al
     b22:	08 0f                	or     BYTE PTR [edi],cl
     b24:	a0 01 00 00 04       	mov    al,ds:0x4000001
     b29:	1e                   	push   ds
     b2a:	3a 00                	cmp    al,BYTE PTR [eax]
     b2c:	00 00                	add    BYTE PTR [eax],al
     b2e:	0c 00                	or     al,0x0
     b30:	05 04 25 00 00       	add    eax,0x2504
     b35:	00 04 27             	add    BYTE PTR [edi+eiz*1],al
     b38:	04 00                	add    al,0x0
     b3a:	00 04 1f             	add    BYTE PTR [edi+ebx*1],al
     b3d:	cb                   	retf   
     b3e:	01 00                	add    DWORD PTR [eax],eax
     b40:	00 10                	add    BYTE PTR [eax],dl
     b42:	46                   	inc    esi
     b43:	05 00 00 01 19       	add    eax,0x19010000
     b48:	d8 09                	fmul   DWORD PTR [ecx]
     b4a:	10 03                	adc    BYTE PTR [ebx],al
     b4c:	06                   	push   es
     b4d:	00 00                	add    BYTE PTR [eax],al
     b4f:	00 01                	add    BYTE PTR [ecx],al
     b51:	9c                   	pushf  
     b52:	39 02                	cmp    DWORD PTR [edx],eax
     b54:	00 00                	add    BYTE PTR [eax],al
     b56:	11 1e                	adc    DWORD PTR [esi],ebx
     b58:	05 00 00 01 19       	add    eax,0x19010000
     b5d:	04 02                	add    al,0x2
     b5f:	00 00                	add    BYTE PTR [eax],al
     b61:	02 91 00 00 12 0b    	add    dl,BYTE PTR [ecx+0xb120000]
     b67:	05 00 00 01 1e       	add    eax,0x1e010000
     b6c:	de 09                	fimul  WORD PTR [ecx]
     b6e:	10 03                	adc    BYTE PTR [ebx],al
     b70:	2f                   	das    
     b71:	00 00                	add    BYTE PTR [eax],al
     b73:	00 01                	add    BYTE PTR [ecx],al
     b75:	9c                   	pushf  
     b76:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
     b79:	00 11                	add    BYTE PTR [ecx],dl
     b7b:	45                   	inc    ebp
     b7c:	04 00                	add    al,0x0
     b7e:	00 01                	add    BYTE PTR [ecx],al
     b80:	1e                   	push   ds
     b81:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
     b84:	00 02                	add    BYTE PTR [edx],al
     b86:	91                   	xchg   ecx,eax
     b87:	00 13                	add    BYTE PTR [ebx],dl
     b89:	44                   	inc    esp
     b8a:	04 00                	add    al,0x0
     b8c:	00 01                	add    BYTE PTR [ecx],al
     b8e:	20 6b 02             	and    BYTE PTR [ebx+0x2],ch
     b91:	00 00                	add    BYTE PTR [eax],al
     b93:	02 91 6c 00 05 04    	add    dl,BYTE PTR [ecx+0x405006c]
     b99:	04 02                	add    al,0x2
     b9b:	00 00                	add    BYTE PTR [eax],al
     b9d:	14 cc                	adc    al,0xcc
     b9f:	04 00                	add    al,0x0
     ba1:	00 01                	add    BYTE PTR [ecx],al
     ba3:	2a 6b 02             	sub    ch,BYTE PTR [ebx+0x2]
     ba6:	00 00                	add    BYTE PTR [eax],al
     ba8:	0d 0a 10 03 db       	or     eax,0xdb03100a
     bad:	00 00                	add    BYTE PTR [eax],al
     baf:	00 01                	add    BYTE PTR [ecx],al
     bb1:	9c                   	pushf  
     bb2:	dc 02                	fadd   QWORD PTR [edx]
     bb4:	00 00                	add    BYTE PTR [eax],al
     bb6:	11 1e                	adc    DWORD PTR [esi],ebx
     bb8:	05 00 00 01 2a       	add    eax,0x2a010000
     bbd:	04 02                	add    al,0x2
     bbf:	00 00                	add    BYTE PTR [eax],al
     bc1:	02 91 00 13 d4 05    	add    dl,BYTE PTR [ecx+0x5d41300]
     bc7:	00 00                	add    BYTE PTR [eax],al
     bc9:	01 2c dc             	add    DWORD PTR [esp+ebx*8],ebp
     bcc:	02 00                	add    al,BYTE PTR [eax]
     bce:	00 02                	add    BYTE PTR [edx],al
     bd0:	91                   	xchg   ecx,eax
     bd1:	61                   	popa   
     bd2:	15 45 04 00 00       	adc    eax,0x445
     bd7:	01 2d 6b 02 00 00    	add    DWORD PTR ds:0x26b,ebp
     bdd:	13 1d 05 00 00 01    	adc    ebx,DWORD PTR ds:0x1000005
     be3:	2e                   	cs
     be4:	04 02                	add    al,0x2
     be6:	00 00                	add    BYTE PTR [eax],al
     be8:	02 91 64 16 63 6d    	add    dl,BYTE PTR [ecx+0x6d631664]
     bee:	64 00 01             	add    BYTE PTR fs:[ecx],al
     bf1:	2f                   	das    
     bf2:	04 02                	add    al,0x2
     bf4:	00 00                	add    BYTE PTR [eax],al
     bf6:	02 91 6c 13 a1 04    	add    dl,BYTE PTR [ecx+0x4a1136c]
     bfc:	00 00                	add    BYTE PTR [eax],al
     bfe:	01 30                	add    DWORD PTR [eax],esi
     c00:	3a 00                	cmp    al,BYTE PTR [eax]
     c02:	00 00                	add    BYTE PTR [eax],al
     c04:	02 91 68 00 17 25    	add    dl,BYTE PTR [ecx+0x25170068]
     c0a:	00 00                	add    BYTE PTR [eax],al
     c0c:	00 ec                	add    ah,ch
     c0e:	02 00                	add    al,BYTE PTR [eax]
     c10:	00 18                	add    BYTE PTR [eax],bl
     c12:	9e                   	sahf   
     c13:	00 00                	add    BYTE PTR [eax],al
     c15:	00 02                	add    BYTE PTR [edx],al
     c17:	00 12                	add    BYTE PTR [edx],dl
     c19:	32 05 00 00 01 42    	xor    al,BYTE PTR ds:0x42010000
     c1f:	e8 0a 10 03 b4       	call   b4031c2e <kCmdline+0xb0f1f38e>
     c24:	00 00                	add    BYTE PTR [eax],al
     c26:	00 01                	add    BYTE PTR [ecx],al
     c28:	9c                   	pushf  
     c29:	1c 03                	sbb    al,0x3
     c2b:	00 00                	add    BYTE PTR [eax],al
     c2d:	11 3d 05 00 00 01    	adc    DWORD PTR ds:0x1000005,edi
     c33:	42                   	inc    edx
     c34:	04 02                	add    al,0x2
     c36:	00 00                	add    BYTE PTR [eax],al
     c38:	02 91 00 16 69 00    	add    dl,BYTE PTR [ecx+0x691600]
     c3e:	01 45 3a             	add    DWORD PTR [ebp+0x3a],eax
     c41:	00 00                	add    BYTE PTR [eax],al
     c43:	00 02                	add    BYTE PTR [edx],al
     c45:	91                   	xchg   ecx,eax
     c46:	6c                   	ins    BYTE PTR es:[edi],dx
     c47:	00 14 2b             	add    BYTE PTR [ebx+ebp*1],dl
     c4a:	06                   	push   es
     c4b:	00 00                	add    BYTE PTR [eax],al
     c4d:	01 5b 3a             	add    DWORD PTR [ebx+0x3a],ebx
     c50:	00 00                	add    BYTE PTR [eax],al
     c52:	00 9c 0b 10 03 a9 01 	add    BYTE PTR [ebx+ecx*1+0x1a90310],bl
     c59:	00 00                	add    BYTE PTR [eax],al
     c5b:	01 9c ba 03 00 00 11 	add    DWORD PTR [edx+edi*4+0x11000003],ebx
     c62:	c4 04 00             	les    eax,FWORD PTR [eax+eax*1]
     c65:	00 01                	add    BYTE PTR [ecx],al
     c67:	5b                   	pop    ebx
     c68:	04 02                	add    al,0x2
     c6a:	00 00                	add    BYTE PTR [eax],al
     c6c:	02 91 00 11 57 02    	add    dl,BYTE PTR [ecx+0x2571100]
     c72:	00 00                	add    BYTE PTR [eax],al
     c74:	01 5b ca             	add    DWORD PTR [ebx-0x36],ebx
     c77:	03 00                	add    eax,DWORD PTR [eax]
     c79:	00 02                	add    BYTE PTR [edx],al
     c7b:	91                   	xchg   ecx,eax
     c7c:	04 11                	add    al,0x11
     c7e:	67 03 00             	add    eax,DWORD PTR [bx+si]
     c81:	00 01                	add    BYTE PTR [ecx],al
     c83:	5b                   	pop    ebx
     c84:	3a 00                	cmp    al,BYTE PTR [eax]
     c86:	00 00                	add    BYTE PTR [eax],al
     c88:	02 91 08 16 78 00    	add    dl,BYTE PTR [ecx+0x781608]
     c8e:	01 5d 3a             	add    DWORD PTR [ebp+0x3a],ebx
     c91:	00 00                	add    BYTE PTR [eax],al
     c93:	00 02                	add    BYTE PTR [edx],al
     c95:	91                   	xchg   ecx,eax
     c96:	6c                   	ins    BYTE PTR es:[edi],dx
     c97:	16                   	push   ss
     c98:	79 00                	jns    c9a <cmdClearScreen-0x30ff366>
     c9a:	01 5d 3a             	add    DWORD PTR [ebp+0x3a],ebx
     c9d:	00 00                	add    BYTE PTR [eax],al
     c9f:	00 02                	add    BYTE PTR [edx],al
     ca1:	91                   	xchg   ecx,eax
     ca2:	68 13 77 04 00       	push   0x47713
     ca7:	00 01                	add    BYTE PTR [ecx],al
     ca9:	5e                   	pop    esi
     caa:	3a 00                	cmp    al,BYTE PTR [eax]
     cac:	00 00                	add    BYTE PTR [eax],al
     cae:	02 91 64 13 52 04    	add    dl,BYTE PTR [ecx+0x4521364]
     cb4:	00 00                	add    BYTE PTR [eax],al
     cb6:	01 5e 3a             	add    DWORD PTR [esi+0x3a],ebx
     cb9:	00 00                	add    BYTE PTR [eax],al
     cbb:	00 02                	add    BYTE PTR [edx],al
     cbd:	91                   	xchg   ecx,eax
     cbe:	60                   	pusha  
     cbf:	13 e9                	adc    ebp,ecx
     cc1:	04 00                	add    al,0x0
     cc3:	00 01                	add    BYTE PTR [ecx],al
     cc5:	5f                   	pop    edi
     cc6:	97                   	xchg   edi,eax
     cc7:	00 00                	add    BYTE PTR [eax],al
     cc9:	00 02                	add    BYTE PTR [edx],al
     ccb:	91                   	xchg   ecx,eax
     ccc:	5f                   	pop    edi
     ccd:	19 d7                	sbb    edi,edx
     ccf:	0b 10                	or     edx,DWORD PTR [eax]
     cd1:	03 47 01             	add    eax,DWORD PTR [edi+0x1]
     cd4:	00 00                	add    BYTE PTR [eax],al
     cd6:	16                   	push   ss
     cd7:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     cda:	00 01                	add    BYTE PTR [ecx],al
     cdc:	63 6c 00 00          	arpl   WORD PTR [eax+eax*1+0x0],bp
     ce0:	00 02                	add    BYTE PTR [edx],al
     ce2:	91                   	xchg   ecx,eax
     ce3:	58                   	pop    eax
     ce4:	00 00                	add    BYTE PTR [eax],al
     ce6:	17                   	pop    ss
     ce7:	25 00 00 00 ca       	and    eax,0xca000000
     cec:	03 00                	add    eax,DWORD PTR [eax]
     cee:	00 18                	add    BYTE PTR [eax],bl
     cf0:	9e                   	sahf   
     cf1:	00 00                	add    BYTE PTR [eax],al
     cf3:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
     cf6:	05 04 ba 03 00       	add    eax,0x3ba04
     cfb:	00 14 26             	add    BYTE PTR [esi+eiz*1],dl
     cfe:	05 00 00 01 8d       	add    eax,0x8d010000
     d03:	3a 00                	cmp    al,BYTE PTR [eax]
     d05:	00 00                	add    BYTE PTR [eax],al
     d07:	45                   	inc    ebp
     d08:	0d 10 03 69 00       	or     eax,0x690310
     d0d:	00 00                	add    BYTE PTR [eax],al
     d0f:	01 9c 12 04 00 00 11 	add    DWORD PTR [edx+edx*1+0x11000004],ebx
     d16:	1e                   	push   ds
     d17:	05 00 00 01 8d       	add    eax,0x8d010000
     d1c:	04 02                	add    al,0x2
     d1e:	00 00                	add    BYTE PTR [eax],al
     d20:	02 91 00 16 69 00    	add    dl,BYTE PTR [ecx+0x691600]
     d26:	01 8f 6c 00 00 00    	add    DWORD PTR [edi+0x6c],ecx
     d2c:	02 91 6c 16 72 65    	add    dl,BYTE PTR [ecx+0x6572166c]
     d32:	74 00                	je     d34 <cmdClearScreen-0x30ff2cc>
     d34:	01 90 3a 00 00 00    	add    DWORD PTR [eax+0x3a],edx
     d3a:	02 91 68 00 14 ba    	add    dl,BYTE PTR [ecx-0x45ebff98]
     d40:	04 00                	add    al,0x0
     d42:	00 01                	add    BYTE PTR [ecx],al
     d44:	a1 6b 02 00 00       	mov    eax,ds:0x26b
     d49:	ae                   	scas   al,BYTE PTR es:[edi]
     d4a:	0d 10 03 8e 02       	or     eax,0x28e0310
     d4f:	00 00                	add    BYTE PTR [eax],al
     d51:	01 9c d1 04 00 00 11 	add    DWORD PTR [ecx+edx*8+0x11000004],ebx
     d58:	83 05 00 00 01 a1 8c 	add    DWORD PTR ds:0xa1010000,0xffffff8c
     d5f:	00 00                	add    BYTE PTR [eax],al
     d61:	00 02                	add    BYTE PTR [edx],al
     d63:	91                   	xchg   ecx,eax
     d64:	00 16                	add    BYTE PTR [esi],dl
     d66:	61                   	popa   
     d67:	72 67                	jb     dd0 <cmdClearScreen-0x30ff230>
     d69:	00 01                	add    BYTE PTR [ecx],al
     d6b:	a3 04 02 00 00       	mov    ds:0x204,eax
     d70:	02 91 6c 13 62 05    	add    dl,BYTE PTR [ecx+0x562136c]
     d76:	00 00                	add    BYTE PTR [eax],al
     d78:	01 a4 04 02 00 00 02 	add    DWORD PTR [esp+eax*1+0x2000002],esp
     d7f:	91                   	xchg   ecx,eax
     d80:	68 13 04 05 00       	push   0x50413
     d85:	00 01                	add    BYTE PTR [ecx],al
     d87:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
     d88:	3a 00                	cmp    al,BYTE PTR [eax]
     d8a:	00 00                	add    BYTE PTR [eax],al
     d8c:	02 91 64 13 70 04    	add    dl,BYTE PTR [ecx+0x4701364]
     d92:	00 00                	add    BYTE PTR [eax],al
     d94:	01 a6 3a 00 00 00    	add    DWORD PTR [esi+0x3a],esp
     d9a:	02 91 60 13 03 05    	add    dl,BYTE PTR [ecx+0x5031360]
     da0:	00 00                	add    BYTE PTR [eax],al
     da2:	01 a7 3a 00 00 00    	add    DWORD PTR [edi+0x3a],esp
     da8:	02 91 5c 13 cf 05    	add    dl,BYTE PTR [ecx+0x5cf135c]
     dae:	00 00                	add    BYTE PTR [eax],al
     db0:	01 a8 3a 00 00 00    	add    DWORD PTR [eax+0x3a],ebp
     db6:	02 91 58 13 cc 05    	add    dl,BYTE PTR [ecx+0x5cc1358]
     dbc:	00 00                	add    BYTE PTR [eax],al
     dbe:	01 a9 3a 00 00 00    	add    DWORD PTR [ecx+0x3a],ebp
     dc4:	02 91 54 13 bf 04    	add    dl,BYTE PTR [ecx+0x4bf1354]
     dca:	00 00                	add    BYTE PTR [eax],al
     dcc:	01 aa 6b 02 00 00    	add    DWORD PTR [edx+0x26b],ebp
     dd2:	02 91 50 13 3e 04    	add    dl,BYTE PTR [ecx+0x43e1350]
     dd8:	00 00                	add    BYTE PTR [eax],al
     dda:	01 ab 6b 02 00 00    	add    DWORD PTR [ebx+0x26b],ebp
     de0:	02 91 4c 19 6f 0f    	add    dl,BYTE PTR [ecx+0xf6f194c]
     de6:	10 03                	adc    BYTE PTR [ebx],al
     de8:	9e                   	sahf   
     de9:	00 00                	add    BYTE PTR [eax],al
     deb:	00 1a                	add    BYTE PTR [edx],bl
     ded:	6b 04 00 00          	imul   eax,DWORD PTR [eax+eax*1],0x0
     df1:	01 04 01             	add    DWORD PTR [ecx+eax*1],eax
     df4:	04 02                	add    al,0x2
     df6:	00 00                	add    BYTE PTR [eax],al
     df8:	02 91 48 00 00 1b    	add    dl,BYTE PTR [ecx+0x1b000048]
     dfe:	ad                   	lods   eax,DWORD PTR ds:[esi]
     dff:	05 00 00 01 1a       	add    eax,0x1a010000
     e04:	01 6b 02             	add    DWORD PTR [ebx+0x2],ebp
     e07:	00 00                	add    BYTE PTR [eax],al
     e09:	3c 10                	cmp    al,0x10
     e0b:	10 03                	adc    BYTE PTR [ebx],al
     e0d:	76 00                	jbe    e0f <cmdClearScreen-0x30ff1f1>
     e0f:	00 00                	add    BYTE PTR [eax],al
     e11:	01 9c 32 05 00 00 1c 	add    DWORD PTR [edx+esi*1+0x1c000005],ebx
     e18:	f7 05 00 00 01 1a 01 	test   DWORD PTR ds:0x1a010000,0x3a01
     e1f:	3a 00 00 
     e22:	00 02                	add    BYTE PTR [edx],al
     e24:	91                   	xchg   ecx,eax
     e25:	00 1c 57             	add    BYTE PTR [edi+edx*2],bl
     e28:	02 00                	add    al,BYTE PTR [eax]
     e2a:	00 01                	add    BYTE PTR [ecx],al
     e2c:	1a 01                	sbb    al,BYTE PTR [ecx]
     e2e:	ca 03 00             	retf   0x3
     e31:	00 02                	add    BYTE PTR [edx],al
     e33:	91                   	xchg   ecx,eax
     e34:	04 1c                	add    al,0x1c
     e36:	d6                   	(bad)  
     e37:	04 00                	add    al,0x0
     e39:	00 01                	add    BYTE PTR [ecx],al
     e3b:	1a 01                	sbb    al,BYTE PTR [ecx]
     e3d:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
     e40:	00 02                	add    BYTE PTR [edx],al
     e42:	91                   	xchg   ecx,eax
     e43:	08 19                	or     BYTE PTR [ecx],bl
     e45:	43                   	inc    ebx
     e46:	10 10                	adc    BYTE PTR [eax],dl
     e48:	03 67 00             	add    esp,DWORD PTR [edi+0x0]
     e4b:	00 00                	add    BYTE PTR [eax],al
     e4d:	1d 63 6e 74 00       	sbb    eax,0x746e63
     e52:	01 1c 01             	add    DWORD PTR [ecx+eax*1],ebx
     e55:	3a 00                	cmp    al,BYTE PTR [eax]
     e57:	00 00                	add    BYTE PTR [eax],al
     e59:	02 91 6c 00 00 1e    	add    dl,BYTE PTR [ecx+0x1e00006c]
     e5f:	90                   	nop
     e60:	05 00 00 01 24       	add    eax,0x24010000
     e65:	01 b2 10 10 03 3d    	add    DWORD PTR [edx+0x3d031010],esi
     e6b:	00 00                	add    BYTE PTR [eax],al
     e6d:	00 01                	add    BYTE PTR [ecx],al
     e6f:	9c                   	pushf  
     e70:	80 05 00 00 1c f7 05 	add    BYTE PTR ds:0xf71c0000,0x5
     e77:	00 00                	add    BYTE PTR [eax],al
     e79:	01 24 01             	add    DWORD PTR [ecx+eax*1],esp
     e7c:	3a 00                	cmp    al,BYTE PTR [eax]
     e7e:	00 00                	add    BYTE PTR [eax],al
     e80:	02 91 00 1c 57 02    	add    dl,BYTE PTR [ecx+0x2571c00]
     e86:	00 00                	add    BYTE PTR [eax],al
     e88:	01 24 01             	add    DWORD PTR [ecx+eax*1],esp
     e8b:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
     e8e:	00 02                	add    BYTE PTR [edx],al
     e90:	91                   	xchg   ecx,eax
     e91:	04 19                	add    al,0x19
     e93:	b8 10 10 03 26       	mov    eax,0x26031010
     e98:	00 00                	add    BYTE PTR [eax],al
     e9a:	00 1d 63 6e 74 00    	add    BYTE PTR ds:0x746e63,bl
     ea0:	01 26                	add    DWORD PTR [esi],esp
     ea2:	01 3a                	add    DWORD PTR [edx],edi
     ea4:	00 00                	add    BYTE PTR [eax],al
     ea6:	00 02                	add    BYTE PTR [edx],al
     ea8:	91                   	xchg   ecx,eax
     ea9:	6c                   	ins    BYTE PTR es:[edi],dx
     eaa:	00 00                	add    BYTE PTR [eax],al
     eac:	1b 8d 04 00 00 01    	sbb    ecx,DWORD PTR [ebp+0x1000004]
     eb2:	2b 01                	sub    eax,DWORD PTR [ecx]
     eb4:	97                   	xchg   edi,eax
     eb5:	00 00                	add    BYTE PTR [eax],al
     eb7:	00 ef                	add    bh,ch
     eb9:	10 10                	adc    BYTE PTR [eax],dl
     ebb:	03 8c 00 00 00 01 9c 	add    ecx,DWORD PTR [eax+eax*1-0x63ff0000]
     ec2:	eb 05                	jmp    ec9 <cmdClearScreen-0x30ff137>
     ec4:	00 00                	add    BYTE PTR [eax],al
     ec6:	1c 6a                	sbb    al,0x6a
     ec8:	05 00 00 01 2b       	add    eax,0x2b010000
     ecd:	01 04 02             	add    DWORD PTR [edx+eax*1],eax
     ed0:	00 00                	add    BYTE PTR [eax],al
     ed2:	02 91 00 1c b4 04    	add    dl,BYTE PTR [ecx+0x4b41c00]
     ed8:	00 00                	add    BYTE PTR [eax],al
     eda:	01 2b                	add    DWORD PTR [ebx],ebp
     edc:	01 04 02             	add    DWORD PTR [edx+eax*1],eax
     edf:	00 00                	add    BYTE PTR [eax],al
     ee1:	02 91 04 19 f5 10    	add    dl,BYTE PTR [ecx+0x10f51904]
     ee7:	10 03                	adc    BYTE PTR [ebx],al
     ee9:	7f 00                	jg     eeb <cmdClearScreen-0x30ff115>
     eeb:	00 00                	add    BYTE PTR [eax],al
     eed:	1d 63 6e 74 00       	sbb    eax,0x746e63
     ef2:	01 2e                	add    DWORD PTR [esi],ebp
     ef4:	01 3a                	add    DWORD PTR [edx],edi
     ef6:	00 00                	add    BYTE PTR [eax],al
     ef8:	00 02                	add    BYTE PTR [edx],al
     efa:	91                   	xchg   ecx,eax
     efb:	6c                   	ins    BYTE PTR es:[edi],dx
     efc:	19 11                	sbb    DWORD PTR [ecx],edx
     efe:	11 10                	adc    DWORD PTR [eax],edx
     f00:	03 59 00             	add    ebx,DWORD PTR [ecx+0x0]
     f03:	00 00                	add    BYTE PTR [eax],al
     f05:	1d 69 64 78 00       	sbb    eax,0x786469
     f0a:	01 32                	add    DWORD PTR [edx],esi
     f0c:	01 04 02             	add    DWORD PTR [edx+eax*1],eax
     f0f:	00 00                	add    BYTE PTR [eax],al
     f11:	02 91 68 00 00 00    	add    dl,BYTE PTR [ecx+0x68]
     f17:	1e                   	push   ds
     f18:	a1 05 00 00 01       	mov    eax,ds:0x1000005
     f1d:	4a                   	dec    edx
     f1e:	01 7b 11             	add    DWORD PTR [ebx+0x11],edi
     f21:	10 03                	adc    BYTE PTR [ebx],al
     f23:	2e 00 00             	add    BYTE PTR cs:[eax],al
     f26:	00 01                	add    BYTE PTR [ecx],al
     f28:	9c                   	pushf  
     f29:	11 06                	adc    DWORD PTR [esi],eax
     f2b:	00 00                	add    BYTE PTR [eax],al
     f2d:	1c 1e                	sbb    al,0x1e
     f2f:	05 00 00 01 4a       	add    eax,0x4a010000
     f34:	01 04 02             	add    DWORD PTR [edx+eax*1],eax
     f37:	00 00                	add    BYTE PTR [eax],al
     f39:	02 91 00 00 1f 37    	add    dl,BYTE PTR [ecx+0x371f0000]
     f3f:	04 00                	add    al,0x0
     f41:	00 01                	add    BYTE PTR [ecx],al
     f43:	4f                   	dec    edi
     f44:	01 a9 11 10 03 23    	add    DWORD PTR [ecx+0x23031011],ebp
     f4a:	00 00                	add    BYTE PTR [eax],al
     f4c:	00 01                	add    BYTE PTR [ecx],al
     f4e:	9c                   	pushf  
     f4f:	1b 1c 06             	sbb    ebx,DWORD PTR [esi+eax*1]
     f52:	00 00                	add    BYTE PTR [eax],al
     f54:	01 54 01 3a          	add    DWORD PTR [ecx+eax*1+0x3a],edx
     f58:	00 00                	add    BYTE PTR [eax],al
     f5a:	00 cc                	add    ah,cl
     f5c:	11 10                	adc    DWORD PTR [eax],edx
     f5e:	03 26                	add    esp,DWORD PTR [esi]
     f60:	00 00                	add    BYTE PTR [eax],al
     f62:	00 01                	add    BYTE PTR [ecx],al
     f64:	9c                   	pushf  
     f65:	4d                   	dec    ebp
     f66:	06                   	push   es
     f67:	00 00                	add    BYTE PTR [eax],al
     f69:	1c 1e                	sbb    al,0x1e
     f6b:	05 00 00 01 54       	add    eax,0x54010000
     f70:	01 04 02             	add    DWORD PTR [edx+eax*1],eax
     f73:	00 00                	add    BYTE PTR [eax],al
     f75:	02 91 00 00 20 db    	add    dl,BYTE PTR [ecx-0x24e00000]
     f7b:	04 00                	add    al,0x0
     f7d:	00 01                	add    BYTE PTR [ecx],al
     f7f:	5c                   	pop    esp
     f80:	01 3a                	add    DWORD PTR [edx],edi
     f82:	00 00                	add    BYTE PTR [eax],al
     f84:	00 f2                	add    dl,dh
     f86:	11 10                	adc    DWORD PTR [eax],edx
     f88:	03 16                	add    edx,DWORD PTR [esi]
     f8a:	00 00                	add    BYTE PTR [eax],al
     f8c:	00 01                	add    BYTE PTR [ecx],al
     f8e:	9c                   	pushf  
     f8f:	77 06                	ja     f97 <cmdClearScreen-0x30ff069>
     f91:	00 00                	add    BYTE PTR [eax],al
     f93:	1c 89                	sbb    al,0x89
     f95:	05 00 00 01 5c       	add    eax,0x5c010000
     f9a:	01 3a                	add    DWORD PTR [edx],edi
     f9c:	00 00                	add    BYTE PTR [eax],al
     f9e:	00 02                	add    BYTE PTR [edx],al
     fa0:	91                   	xchg   ecx,eax
     fa1:	00 00                	add    BYTE PTR [eax],al
     fa3:	20 54 05 00          	and    BYTE PTR [ebp+eax*1+0x0],dl
     fa7:	00 01                	add    BYTE PTR [ecx],al
     fa9:	66 01 3a             	add    WORD PTR [edx],di
     fac:	00 00                	add    BYTE PTR [eax],al
     fae:	00 08                	add    BYTE PTR [eax],cl
     fb0:	12 10                	adc    dl,BYTE PTR [eax]
     fb2:	03 20                	add    esp,DWORD PTR [eax]
     fb4:	00 00                	add    BYTE PTR [eax],al
     fb6:	00 01                	add    BYTE PTR [ecx],al
     fb8:	9c                   	pushf  
     fb9:	a1 06 00 00 1c       	mov    eax,ds:0x1c000006
     fbe:	89 05 00 00 01 66    	mov    DWORD PTR ds:0x66010000,eax
     fc4:	01 3a                	add    DWORD PTR [edx],edi
     fc6:	00 00                	add    BYTE PTR [eax],al
     fc8:	00 02                	add    BYTE PTR [edx],al
     fca:	91                   	xchg   ecx,eax
     fcb:	00 00                	add    BYTE PTR [eax],al
     fcd:	1b 4b 06             	sbb    ecx,DWORD PTR [ebx+0x6]
     fd0:	00 00                	add    BYTE PTR [eax],al
     fd2:	01 73 01             	add    DWORD PTR [ebx+0x1],esi
     fd5:	3a 00                	cmp    al,BYTE PTR [eax]
     fd7:	00 00                	add    BYTE PTR [eax],al
     fd9:	28 12                	sub    BYTE PTR [edx],dl
     fdb:	10 03                	adc    BYTE PTR [ebx],al
     fdd:	30 04 00             	xor    BYTE PTR [eax+eax*1],al
     fe0:	00 01                	add    BYTE PTR [ecx],al
     fe2:	9c                   	pushf  
     fe3:	60                   	pusha  
     fe4:	07                   	pop    es
     fe5:	00 00                	add    BYTE PTR [eax],al
     fe7:	1c cf                	sbb    al,0xcf
     fe9:	05 00 00 01 73       	add    eax,0x73010000
     fee:	01 3a                	add    DWORD PTR [edx],edi
     ff0:	00 00                	add    BYTE PTR [eax],al
     ff2:	00 02                	add    BYTE PTR [edx],al
     ff4:	91                   	xchg   ecx,eax
     ff5:	00 1c bf             	add    BYTE PTR [edi+edi*4],bl
     ff8:	04 00                	add    al,0x0
     ffa:	00 01                	add    BYTE PTR [ecx],al
     ffc:	73 01                	jae    fff <cmdClearScreen-0x30ff001>
     ffe:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
    1001:	00 02                	add    BYTE PTR [edx],al
    1003:	91                   	xchg   ecx,eax
    1004:	04 1c                	add    al,0x1c
    1006:	7f 04                	jg     100c <cmdClearScreen-0x30feff4>
    1008:	00 00                	add    BYTE PTR [eax],al
    100a:	01 73 01             	add    DWORD PTR [ebx+0x1],esi
    100d:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
    1010:	00 02                	add    BYTE PTR [edx],al
    1012:	91                   	xchg   ecx,eax
    1013:	08 1a                	or     BYTE PTR [edx],bl
    1015:	84 04 00             	test   BYTE PTR [eax+eax*1],al
    1018:	00 01                	add    BYTE PTR [ecx],al
    101a:	75 01                	jne    101d <cmdClearScreen-0x30fefe3>
    101c:	48                   	dec    eax
    101d:	00 00                	add    BYTE PTR [eax],al
    101f:	00 02                	add    BYTE PTR [edx],al
    1021:	91                   	xchg   ecx,eax
    1022:	63 1a                	arpl   WORD PTR [edx],bx
    1024:	0e                   	push   cs
    1025:	06                   	push   es
    1026:	00 00                	add    BYTE PTR [eax],al
    1028:	01 76 01             	add    DWORD PTR [esi+0x1],esi
    102b:	3a 00                	cmp    al,BYTE PTR [eax]
    102d:	00 00                	add    BYTE PTR [eax],al
    102f:	02 91 6c 1a db 05    	add    dl,BYTE PTR [ecx+0x5db1a6c]
    1035:	00 00                	add    BYTE PTR [eax],al
    1037:	01 77 01             	add    DWORD PTR [edi+0x1],esi
    103a:	3a 00                	cmp    al,BYTE PTR [eax]
    103c:	00 00                	add    BYTE PTR [eax],al
    103e:	02 91 68 1a 99 05    	add    dl,BYTE PTR [ecx+0x5991a68]
    1044:	00 00                	add    BYTE PTR [eax],al
    1046:	01 78 01             	add    DWORD PTR [eax+0x1],edi
    1049:	60                   	pusha  
    104a:	07                   	pop    es
    104b:	00 00                	add    BYTE PTR [eax],al
    104d:	02 91 4f 21 a8 04    	add    dl,BYTE PTR [ecx+0x4a8214f]
    1053:	00 00                	add    BYTE PTR [eax],al
    1055:	01 8a 01 e8 12 10    	add    DWORD PTR [edx+0x1012e801],ecx
    105b:	03 21                	add    esp,DWORD PTR [ecx]
    105d:	4a                   	dec    edx
    105e:	04 00                	add    al,0x0
    1060:	00 01                	add    BYTE PTR [ecx],al
    1062:	92                   	xchg   edx,eax
    1063:	01 35 13 10 03 21    	add    DWORD PTR ds:0x21031013,esi
    1069:	fe 05 00 00 01 fb    	inc    BYTE PTR ds:0xfb010000
    106f:	01 88 15 10 03 19    	add    DWORD PTR [eax+0x19031015],ecx
    1075:	e8 12 10 03 2c       	call   2c03208c <kCmdline+0x28f1f7ec>
    107a:	03 00                	add    eax,DWORD PTR [eax]
    107c:	00 1d 69 00 01 00    	add    BYTE PTR ds:0x10069,bl
    1082:	02 3a                	add    bh,BYTE PTR [edx]
    1084:	00 00                	add    BYTE PTR [eax],al
    1086:	00 02                	add    BYTE PTR [edx],al
    1088:	91                   	xchg   ecx,eax
    1089:	64 00 00             	add    BYTE PTR fs:[eax],al
    108c:	17                   	pop    ss
    108d:	25 00 00 00 70       	and    eax,0x70000000
    1092:	07                   	pop    es
    1093:	00 00                	add    BYTE PTR [eax],al
    1095:	18 9e 00 00 00 13    	sbb    BYTE PTR [esi+0x13000000],bl
    109b:	00 17                	add    BYTE PTR [edi],dl
    109d:	0a 02                	or     al,BYTE PTR [edx]
    109f:	00 00                	add    BYTE PTR [eax],al
    10a1:	80 07 00             	add    BYTE PTR [edi],0x0
    10a4:	00 18                	add    BYTE PTR [eax],bl
    10a6:	9e                   	sahf   
    10a7:	00 00                	add    BYTE PTR [eax],al
    10a9:	00 09                	add    BYTE PTR [ecx],cl
    10ab:	00 13                	add    BYTE PTR [ebx],dl
    10ad:	45                   	inc    ebp
    10ae:	04 00                	add    al,0x0
    10b0:	00 04 3d 70 07 00 00 	add    BYTE PTR [edi*1+0x770],al
    10b7:	05 03 40 28 10       	add    eax,0x10284003
    10bc:	03 22                	add    esp,DWORD PTR [edx]
    10be:	7a 03                	jp     10c3 <cmdClearScreen-0x30fef3d>
    10c0:	00 00                	add    BYTE PTR [eax],al
    10c2:	05 34 61 00 00       	add    eax,0x6134
    10c7:	00 05 03 50 2d 10    	add    BYTE PTR ds:0x102d5003,al
    10cd:	03 22                	add    esp,DWORD PTR [edx]
    10cf:	15 02 00 00 05       	adc    eax,0x5000002
    10d4:	35 61 00 00 00       	xor    eax,0x61
    10d9:	05 03 54 2d 10       	add    eax,0x102d5403
    10de:	03 22                	add    esp,DWORD PTR [edx]
    10e0:	66                   	data16
    10e1:	00 00                	add    BYTE PTR [eax],al
    10e3:	00 05 36 61 00 00    	add    BYTE PTR ds:0x6136,al
    10e9:	00 05 03 4c 2d 10    	add    BYTE PTR ds:0x102d4c03,al
    10ef:	03 22                	add    esp,DWORD PTR [edx]
    10f1:	ba 03 00 00 05       	mov    edx,0x5000003
    10f6:	37                   	aaa    
    10f7:	85 00                	test   DWORD PTR [eax],eax
    10f9:	00 00                	add    BYTE PTR [eax],al
    10fb:	05 03 74 2d 10       	add    eax,0x102d7403
    1100:	03 22                	add    esp,DWORD PTR [edx]
    1102:	57                   	push   edi
    1103:	03 00                	add    eax,DWORD PTR [eax]
    1105:	00 06                	add    BYTE PTR [esi],al
    1107:	2d e6 07 00 00       	sub    eax,0x7e6
    110c:	05 03 48 2d 10       	add    eax,0x102d4803
    1111:	03 05 04 7a 00 00    	add    eax,DWORD PTR ds:0x7a04
    1117:	00 22                	add    BYTE PTR [edx],ah
    1119:	df 03                	fild   WORD PTR [ebx]
    111b:	00 00                	add    BYTE PTR [eax],al
    111d:	06                   	push   es
    111e:	2e                   	cs
    111f:	61                   	popa   
    1120:	00 00                	add    BYTE PTR [eax],al
    1122:	00 05 03 20 2b 10    	add    BYTE PTR ds:0x102b2003,al
    1128:	03 22                	add    esp,DWORD PTR [edx]
    112a:	c5 02                	lds    eax,FWORD PTR [edx]
    112c:	00 00                	add    BYTE PTR [eax],al
    112e:	07                   	pop    es
    112f:	53                   	push   ebx
    1130:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
    1133:	00 05 03 64 2d 10    	add    BYTE PTR ds:0x102d6403,al
    1139:	03 22                	add    esp,DWORD PTR [edx]
    113b:	f1                   	icebp  
    113c:	03 00                	add    eax,DWORD PTR [eax]
    113e:	00 03                	add    BYTE PTR [ebx],al
    1140:	63 28                	arpl   WORD PTR [eax],bp
    1142:	01 00                	add    DWORD PTR [eax],eax
    1144:	00 05 03 5c 2d 10    	add    BYTE PTR ds:0x102d5c03,al
    114a:	03 22                	add    esp,DWORD PTR [edx]
    114c:	92                   	xchg   edx,eax
    114d:	03 00                	add    eax,DWORD PTR [eax]
    114f:	00 03                	add    BYTE PTR [ebx],al
    1151:	e1 77                	loope  11ca <cmdClearScreen-0x30fee36>
    1153:	01 00                	add    DWORD PTR [eax],eax
    1155:	00 05 03 44 2d 10    	add    BYTE PTR ds:0x102d4403,al
    115b:	03 23                	add    esp,DWORD PTR [ebx]
    115d:	22 67 01             	and    ah,BYTE PTR [edi+0x1]
    1160:	00 00                	add    BYTE PTR [eax],al
    1162:	04 2b                	add    al,0x2b
    1164:	42                   	inc    edx
    1165:	08 00                	or     BYTE PTR [eax],al
    1167:	00 05 03 58 2d 10    	add    BYTE PTR ds:0x102d5803,al
    116d:	03 05 04 30 08 00    	add    eax,DWORD PTR ds:0x83004
    1173:	00 24 53             	add    BYTE PTR [ebx+edx*2],ah
    1176:	08 00                	or     BYTE PTR [eax],al
    1178:	00 25 04 02 00 00    	add    BYTE PTR ds:0x204,ah
    117e:	00 22                	add    BYTE PTR [edx],ah
    1180:	db 01                	fild   DWORD PTR [ecx]
    1182:	00 00                	add    BYTE PTR [eax],al
    1184:	04 2c                	add    al,0x2c
    1186:	64 08 00             	or     BYTE PTR fs:[eax],al
    1189:	00 05 03 40 2d 10    	add    BYTE PTR ds:0x102d4003,al
    118f:	03 05 04 48 08 00    	add    eax,DWORD PTR ds:0x84804
    1195:	00 17                	add    BYTE PTR [edi],dl
    1197:	25 00 00 00 7b       	and    eax,0x7b000000
    119c:	08 00                	or     BYTE PTR [eax],al
    119e:	00 26                	add    BYTE PTR [esi],ah
    11a0:	9e                   	sahf   
    11a1:	00 00                	add    BYTE PTR [eax],al
    11a3:	00 ff                	add    bh,bh
    11a5:	01 00                	add    DWORD PTR [eax],eax
    11a7:	22 2a                	and    ch,BYTE PTR [edx]
    11a9:	02 00                	add    al,BYTE PTR [eax]
    11ab:	00 04 34             	add    BYTE PTR [esp+esi*1],al
    11ae:	6a 08                	push   0x8
    11b0:	00 00                	add    BYTE PTR [eax],al
    11b2:	05 03 40 2b 10       	add    eax,0x102b4003
    11b7:	03 22                	add    esp,DWORD PTR [edx]
    11b9:	12 01                	adc    al,BYTE PTR [ecx]
    11bb:	00 00                	add    BYTE PTR [eax],al
    11bd:	04 35                	add    al,0x35
    11bf:	04 02                	add    al,0x2
    11c1:	00 00                	add    BYTE PTR [eax],al
    11c3:	05 03 70 2d 10       	add    eax,0x102d7003
    11c8:	03 22                	add    esp,DWORD PTR [edx]
    11ca:	00 00                	add    BYTE PTR [eax],al
    11cc:	00 00                	add    BYTE PTR [eax],al
    11ce:	04 36                	add    al,0x36
    11d0:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
    11d3:	00 05 03 0c 2a 10    	add    BYTE PTR ds:0x102a0c03,al
    11d9:	03 17                	add    edx,DWORD PTR [edi]
    11db:	25 00 00 00 be       	and    eax,0xbe000000
    11e0:	08 00                	or     BYTE PTR [eax],al
    11e2:	00 18                	add    BYTE PTR [eax],bl
    11e4:	9e                   	sahf   
    11e5:	00 00                	add    BYTE PTR [eax],al
    11e7:	00 05 00 22 3c 02    	add    BYTE PTR ds:0x23c2200,al
    11ed:	00 00                	add    BYTE PTR [eax],al
    11ef:	04 37                	add    al,0x37
    11f1:	ae                   	scas   al,BYTE PTR es:[edi]
    11f2:	08 00                	or     BYTE PTR [eax],al
    11f4:	00 05 03 04 2a 10    	add    BYTE PTR ds:0x102a0403,al
    11fa:	03 22                	add    esp,DWORD PTR [edx]
    11fc:	dc 02                	fadd   QWORD PTR [edx]
    11fe:	00 00                	add    BYTE PTR [eax],al
    1200:	04 38                	add    al,0x38
    1202:	61                   	popa   
    1203:	00 00                	add    BYTE PTR [eax],al
    1205:	00 05 03 6c 2d 10    	add    BYTE PTR ds:0x102d6c03,al
    120b:	03 22                	add    esp,DWORD PTR [edx]
    120d:	b4 02                	mov    ah,0x2
    120f:	00 00                	add    BYTE PTR [eax],al
    1211:	04 38                	add    al,0x38
    1213:	61                   	popa   
    1214:	00 00                	add    BYTE PTR [eax],al
    1216:	00 05 03 68 2d 10    	add    BYTE PTR ds:0x102d6803,al
    121c:	03 22                	add    esp,DWORD PTR [edx]
    121e:	25 01 00 00 04       	and    eax,0x4000001
    1223:	39 97 00 00 00 05    	cmp    DWORD PTR [edi+0x5000000],edx
    1229:	03 78 2d             	add    edi,DWORD PTR [eax+0x2d]
    122c:	10 03                	adc    BYTE PTR [ebx],al
    122e:	17                   	pop    ss
    122f:	25 00 00 00 12       	and    eax,0x12000000
    1234:	09 00                	or     DWORD PTR [eax],eax
    1236:	00 18                	add    BYTE PTR [eax],bl
    1238:	9e                   	sahf   
    1239:	00 00                	add    BYTE PTR [eax],al
    123b:	00 ff                	add    bh,bh
    123d:	00 27                	add    BYTE PTR [edi],ah
    123f:	63 77 64             	arpl   WORD PTR [edi+0x64],si
    1242:	00 04 3a             	add    BYTE PTR [edx+edi*1],al
    1245:	02 09                	add    cl,BYTE PTR [ecx]
    1247:	00 00                	add    BYTE PTR [eax],al
    1249:	05 03 20 2a 10       	add    eax,0x102a2003
    124e:	03 22                	add    esp,DWORD PTR [edx]
    1250:	ab                   	stos   DWORD PTR es:[edi],eax
    1251:	01 00                	add    DWORD PTR [eax],eax
    1253:	00 04 3b             	add    BYTE PTR [ebx+edi*1],al
    1256:	97                   	xchg   edi,eax
    1257:	00 00                	add    BYTE PTR [eax],al
    1259:	00 05 03 00 2a 10    	add    BYTE PTR ds:0x102a0003,al
    125f:	03 17                	add    edx,DWORD PTR [edi]
    1261:	25 00 00 00 4b       	and    eax,0x4b000000
    1266:	09 00                	or     DWORD PTR [eax],eax
    1268:	00 26                	add    BYTE PTR [esi],ah
    126a:	9e                   	sahf   
    126b:	00 00                	add    BYTE PTR [eax],al
    126d:	00 f3                	add    bl,dh
    126f:	01 18                	add    DWORD PTR [eax],ebx
    1271:	9e                   	sahf   
    1272:	00 00                	add    BYTE PTR [eax],al
    1274:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
    1277:	22 3c 06             	and    bh,BYTE PTR [esi+eax*1]
    127a:	00 00                	add    BYTE PTR [eax],al
    127c:	01 10                	add    DWORD PTR [eax],edx
    127e:	34 09                	xor    al,0x9
    1280:	00 00                	add    BYTE PTR [eax],al
    1282:	05 03 a0 2d 10       	add    eax,0x102da003
    1287:	03 22                	add    esp,DWORD PTR [edx]
    1289:	71 05                	jno    1290 <cmdClearScreen-0x30fed70>
    128b:	00 00                	add    BYTE PTR [eax],al
    128d:	01 11                	add    DWORD PTR [ecx],edx
    128f:	3a 00                	cmp    al,BYTE PTR [eax]
    1291:	00 00                	add    BYTE PTR [eax],al
    1293:	05 03 84 2d 10       	add    eax,0x102d8403
    1298:	03 22                	add    esp,DWORD PTR [edx]
    129a:	ba 05 00 00 01       	mov    edx,0x1000005
    129f:	12 3a                	adc    bh,BYTE PTR [edx]
    12a1:	00 00                	add    BYTE PTR [eax],al
    12a3:	00 05 03 88 2d 10    	add    BYTE PTR ds:0x102d8803,al
    12a9:	03 22                	add    esp,DWORD PTR [edx]
    12ab:	3d 05 00 00 01       	cmp    eax,0x1000005
    12b0:	13 02                	adc    eax,DWORD PTR [edx]
    12b2:	09 00                	or     DWORD PTR [eax],eax
    12b4:	00 05 03 a0 27 11    	add    BYTE PTR ds:0x1127a003,al
    12ba:	03 22                	add    esp,DWORD PTR [edx]
    12bc:	14 05                	adc    al,0x5
    12be:	00 00                	add    BYTE PTR [eax],al
    12c0:	01 14 6b             	add    DWORD PTR [ebx+ebp*2],edx
    12c3:	02 00                	add    al,BYTE PTR [eax]
    12c5:	00 05 03 a0 28 11    	add    BYTE PTR ds:0x1128a003,al
    12cb:	03 00                	add    eax,DWORD PTR [eax]

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
  35:	00 05 13 01 03 0e    	add    BYTE PTR ds:0xe030113,al
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
  58:	0b 00                	or     eax,DWORD PTR [eax]
  5a:	00 08                	add    BYTE PTR [eax],cl
  5c:	13 01                	adc    eax,DWORD PTR [ecx]
  5e:	0b 0b                	or     ecx,DWORD PTR [ebx]
  60:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  62:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  64:	01 13                	add    DWORD PTR [ebx],edx
  66:	00 00                	add    BYTE PTR [eax],al
  68:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
  6e:	0b 3b                	or     edi,DWORD PTR [ebx]
  70:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  73:	0b 0b                	or     ecx,DWORD PTR [ebx]
  75:	0d 0b 0c 0b 38       	or     eax,0x380b0c0b
  7a:	0b 00                	or     eax,DWORD PTR [eax]
  7c:	00 0a                	add    BYTE PTR [edx],cl
  7e:	17                   	pop    ss
  7f:	01 0b                	add    DWORD PTR [ebx],ecx
  81:	0b 3a                	or     edi,DWORD PTR [edx]
  83:	0b 3b                	or     edi,DWORD PTR [ebx]
  85:	0b 01                	or     eax,DWORD PTR [ecx]
  87:	13 00                	adc    eax,DWORD PTR [eax]
  89:	00 0b                	add    BYTE PTR [ebx],cl
  8b:	0d 00 49 13 00       	or     eax,0x134900
  90:	00 0c 0d 00 03 08 3a 	add    BYTE PTR [ecx*1+0x3a080300],cl
  97:	0b 3b                	or     edi,DWORD PTR [ebx]
  99:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  9c:	00 00                	add    BYTE PTR [eax],al
  9e:	0d 04 01 03 0e       	or     eax,0xe030104
  a3:	0b 0b                	or     ecx,DWORD PTR [ebx]
  a5:	49                   	dec    ecx
  a6:	13 3a                	adc    edi,DWORD PTR [edx]
  a8:	0b 3b                	or     edi,DWORD PTR [ebx]
  aa:	0b 01                	or     eax,DWORD PTR [ecx]
  ac:	13 00                	adc    eax,DWORD PTR [eax]
  ae:	00 0e                	add    BYTE PTR [esi],cl
  b0:	28 00                	sub    BYTE PTR [eax],al
  b2:	03 0e                	add    ecx,DWORD PTR [esi]
  b4:	1c 0b                	sbb    al,0xb
  b6:	00 00                	add    BYTE PTR [eax],al
  b8:	0f                   	(bad)  
  b9:	0f 00 0b             	str    WORD PTR [ebx]
  bc:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  bf:	00 00                	add    BYTE PTR [eax],al
  c1:	10 2e                	adc    BYTE PTR [esi],ch
  c3:	00 3f                	add    BYTE PTR [edi],bh
  c5:	19 03                	sbb    DWORD PTR [ebx],eax
  c7:	0e                   	push   cs
  c8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  ca:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  cc:	11 01                	adc    DWORD PTR [ecx],eax
  ce:	12 06                	adc    al,BYTE PTR [esi]
  d0:	40                   	inc    eax
  d1:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
  d7:	11 2e                	adc    DWORD PTR [esi],ebp
  d9:	01 3f                	add    DWORD PTR [edi],edi
  db:	19 03                	sbb    DWORD PTR [ebx],eax
  dd:	0e                   	push   cs
  de:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  e0:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  e2:	11 01                	adc    DWORD PTR [ecx],eax
  e4:	12 06                	adc    al,BYTE PTR [esi]
  e6:	40                   	inc    eax
  e7:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  ed:	00 00                	add    BYTE PTR [eax],al
  ef:	12 0b                	adc    cl,BYTE PTR [ebx]
  f1:	01 11                	add    DWORD PTR [ecx],edx
  f3:	01 12                	add    DWORD PTR [edx],edx
  f5:	06                   	push   es
  f6:	00 00                	add    BYTE PTR [eax],al
  f8:	13 34 00             	adc    esi,DWORD PTR [eax+eax*1]
  fb:	03 08                	add    ecx,DWORD PTR [eax]
  fd:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  ff:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 101:	49                   	dec    ecx
 102:	13 02                	adc    eax,DWORD PTR [edx]
 104:	18 00                	sbb    BYTE PTR [eax],al
 106:	00 14 2e             	add    BYTE PTR [esi+ebp*1],dl
 109:	01 3f                	add    DWORD PTR [edi],edi
 10b:	19 03                	sbb    DWORD PTR [ebx],eax
 10d:	0e                   	push   cs
 10e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 110:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 112:	27                   	daa    
 113:	19 11                	sbb    DWORD PTR [ecx],edx
 115:	01 12                	add    DWORD PTR [edx],edx
 117:	06                   	push   es
 118:	40                   	inc    eax
 119:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 11f:	00 00                	add    BYTE PTR [eax],al
 121:	15 05 00 03 0e       	adc    eax,0xe030005
 126:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 128:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 12a:	49                   	dec    ecx
 12b:	13 02                	adc    eax,DWORD PTR [edx]
 12d:	18 00                	sbb    BYTE PTR [eax],al
 12f:	00 16                	add    BYTE PTR [esi],dl
 131:	34 00                	xor    al,0x0
 133:	03 0e                	add    ecx,DWORD PTR [esi]
 135:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 137:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 139:	49                   	dec    ecx
 13a:	13 02                	adc    eax,DWORD PTR [edx]
 13c:	18 00                	sbb    BYTE PTR [eax],al
 13e:	00 17                	add    BYTE PTR [edi],dl
 140:	01 01                	add    DWORD PTR [ecx],eax
 142:	49                   	dec    ecx
 143:	13 01                	adc    eax,DWORD PTR [ecx]
 145:	13 00                	adc    eax,DWORD PTR [eax]
 147:	00 18                	add    BYTE PTR [eax],bl
 149:	21 00                	and    DWORD PTR [eax],eax
 14b:	49                   	dec    ecx
 14c:	13 2f                	adc    ebp,DWORD PTR [edi]
 14e:	0b 00                	or     eax,DWORD PTR [eax]
 150:	00 19                	add    BYTE PTR [ecx],bl
 152:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 155:	19 03                	sbb    DWORD PTR [ebx],eax
 157:	0e                   	push   cs
 158:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 15a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 15c:	27                   	daa    
 15d:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 160:	11 01                	adc    DWORD PTR [ecx],eax
 162:	12 06                	adc    al,BYTE PTR [esi]
 164:	40                   	inc    eax
 165:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 16b:	00 00                	add    BYTE PTR [eax],al
 16d:	1a 34 00             	sbb    dh,BYTE PTR [eax+eax*1]
 170:	03 08                	add    ecx,DWORD PTR [eax]
 172:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 174:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 176:	49                   	dec    ecx
 177:	13 00                	adc    eax,DWORD PTR [eax]
 179:	00 1b                	add    BYTE PTR [ebx],bl
 17b:	34 00                	xor    al,0x0
 17d:	03 0e                	add    ecx,DWORD PTR [esi]
 17f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 181:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 183:	49                   	dec    ecx
 184:	13 00                	adc    eax,DWORD PTR [eax]
 186:	00 1c 0b             	add    BYTE PTR [ebx+ecx*1],bl
 189:	01 11                	add    DWORD PTR [ecx],edx
 18b:	01 12                	add    DWORD PTR [edx],edx
 18d:	06                   	push   es
 18e:	01 13                	add    DWORD PTR [ebx],edx
 190:	00 00                	add    BYTE PTR [eax],al
 192:	1d 0b 01 55 17       	sbb    eax,0x1755010b
 197:	00 00                	add    BYTE PTR [eax],al
 199:	1e                   	push   ds
 19a:	34 00                	xor    al,0x0
 19c:	03 08                	add    ecx,DWORD PTR [eax]
 19e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1a0:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 1a6:	00 00                	add    BYTE PTR [eax],al
 1a8:	1f                   	pop    ds
 1a9:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 1ac:	19 03                	sbb    DWORD PTR [ebx],eax
 1ae:	0e                   	push   cs
 1af:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1b1:	3b 05 11 01 12 06    	cmp    eax,DWORD PTR ds:0x6120111
 1b7:	40                   	inc    eax
 1b8:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 1be:	00 00                	add    BYTE PTR [eax],al
 1c0:	20 2e                	and    BYTE PTR [esi],ch
 1c2:	01 3f                	add    DWORD PTR [edi],edi
 1c4:	19 03                	sbb    DWORD PTR [ebx],eax
 1c6:	0e                   	push   cs
 1c7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1c9:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 1cf:	12 06                	adc    al,BYTE PTR [esi]
 1d1:	40                   	inc    eax
 1d2:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 1d8:	00 00                	add    BYTE PTR [eax],al
 1da:	21 05 00 03 0e 3a    	and    DWORD PTR ds:0x3a0e0300,eax
 1e0:	0b 3b                	or     edi,DWORD PTR [ebx]
 1e2:	05 49 13 02 18       	add    eax,0x18021349
 1e7:	00 00                	add    BYTE PTR [eax],al
 1e9:	22 34 00             	and    dh,BYTE PTR [eax+eax*1]
 1ec:	03 0e                	add    ecx,DWORD PTR [esi]
 1ee:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1f0:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 1f6:	00 00                	add    BYTE PTR [eax],al
 1f8:	23 21                	and    esp,DWORD PTR [ecx]
 1fa:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 1fd:	2f                   	das    
 1fe:	18 00                	sbb    BYTE PTR [eax],al
 200:	00 24 34             	add    BYTE PTR [esp+esi*1],ah
 203:	00 03                	add    BYTE PTR [ebx],al
 205:	0e                   	push   cs
 206:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 208:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 20a:	49                   	dec    ecx
 20b:	13 3f                	adc    edi,DWORD PTR [edi]
 20d:	19 02                	sbb    DWORD PTR [edx],eax
 20f:	18 00                	sbb    BYTE PTR [eax],al
 211:	00 25 15 00 27 19    	add    BYTE PTR ds:0x19270015,ah
 217:	00 00                	add    BYTE PTR [eax],al
 219:	26                   	es
 21a:	15 01 27 19 01       	adc    eax,0x1192701
 21f:	13 00                	adc    eax,DWORD PTR [eax]
 221:	00 27                	add    BYTE PTR [edi],ah
 223:	05 00 49 13 00       	add    eax,0x134900
 228:	00 28                	add    BYTE PTR [eax],ch
 22a:	21 00                	and    DWORD PTR [eax],eax
 22c:	49                   	dec    ecx
 22d:	13 2f                	adc    ebp,DWORD PTR [edi]
 22f:	05 00 00 29 34       	add    eax,0x34290000
 234:	00 03                	add    BYTE PTR [ebx],al
 236:	08 3a                	or     BYTE PTR [edx],bh
 238:	0b 3b                	or     edi,DWORD PTR [ebx]
 23a:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 23d:	3f                   	aas    
 23e:	19 02                	sbb    DWORD PTR [edx],eax
 240:	18 00                	sbb    BYTE PTR [eax],al
 242:	00 00                	add    BYTE PTR [eax],al
 244:	01 11                	add    DWORD PTR [ecx],edx
 246:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 24c:	0e                   	push   cs
 24d:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 24f:	11 01                	adc    DWORD PTR [ecx],eax
 251:	12 06                	adc    al,BYTE PTR [esi]
 253:	10 17                	adc    BYTE PTR [edi],dl
 255:	00 00                	add    BYTE PTR [eax],al
 257:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 25a:	0b 0b                	or     ecx,DWORD PTR [ebx]
 25c:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 25f:	0e                   	push   cs
 260:	00 00                	add    BYTE PTR [eax],al
 262:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 265:	0b 0b                	or     ecx,DWORD PTR [ebx]
 267:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 26a:	08 00                	or     BYTE PTR [eax],al
 26c:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 26f:	00 03                	add    BYTE PTR [ebx],al
 271:	0e                   	push   cs
 272:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 274:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 276:	49                   	dec    ecx
 277:	13 00                	adc    eax,DWORD PTR [eax]
 279:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 27f:	49                   	dec    ecx
 280:	13 00                	adc    eax,DWORD PTR [eax]
 282:	00 06                	add    BYTE PTR [esi],al
 284:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 288:	00 00                	add    BYTE PTR [eax],al
 28a:	07                   	pop    es
 28b:	0f 00 0b             	str    WORD PTR [ebx]
 28e:	0b 00                	or     eax,DWORD PTR [eax]
 290:	00 08                	add    BYTE PTR [eax],cl
 292:	13 01                	adc    eax,DWORD PTR [ecx]
 294:	0b 0b                	or     ecx,DWORD PTR [ebx]
 296:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 298:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 29a:	01 13                	add    DWORD PTR [ebx],edx
 29c:	00 00                	add    BYTE PTR [eax],al
 29e:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
 2a4:	0b 3b                	or     edi,DWORD PTR [ebx]
 2a6:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 2a9:	0b 0b                	or     ecx,DWORD PTR [ebx]
 2ab:	0d 0b 0c 0b 38       	or     eax,0x380b0c0b
 2b0:	0b 00                	or     eax,DWORD PTR [eax]
 2b2:	00 0a                	add    BYTE PTR [edx],cl
 2b4:	17                   	pop    ss
 2b5:	01 0b                	add    DWORD PTR [ebx],ecx
 2b7:	0b 3a                	or     edi,DWORD PTR [edx]
 2b9:	0b 3b                	or     edi,DWORD PTR [ebx]
 2bb:	0b 01                	or     eax,DWORD PTR [ecx]
 2bd:	13 00                	adc    eax,DWORD PTR [eax]
 2bf:	00 0b                	add    BYTE PTR [ebx],cl
 2c1:	0d 00 49 13 00       	or     eax,0x134900
 2c6:	00 0c 0d 00 03 08 3a 	add    BYTE PTR [ecx*1+0x3a080300],cl
 2cd:	0b 3b                	or     edi,DWORD PTR [ebx]
 2cf:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 2d2:	00 00                	add    BYTE PTR [eax],al
 2d4:	0d 04 01 03 0e       	or     eax,0xe030104
 2d9:	0b 0b                	or     ecx,DWORD PTR [ebx]
 2db:	49                   	dec    ecx
 2dc:	13 3a                	adc    edi,DWORD PTR [edx]
 2de:	0b 3b                	or     edi,DWORD PTR [ebx]
 2e0:	0b 01                	or     eax,DWORD PTR [ecx]
 2e2:	13 00                	adc    eax,DWORD PTR [eax]
 2e4:	00 0e                	add    BYTE PTR [esi],cl
 2e6:	28 00                	sub    BYTE PTR [eax],al
 2e8:	03 0e                	add    ecx,DWORD PTR [esi]
 2ea:	1c 0b                	sbb    al,0xb
 2ec:	00 00                	add    BYTE PTR [eax],al
 2ee:	0f 0d 00             	prefetch BYTE PTR [eax]
 2f1:	03 0e                	add    ecx,DWORD PTR [esi]
 2f3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2f5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2f7:	49                   	dec    ecx
 2f8:	13 38                	adc    edi,DWORD PTR [eax]
 2fa:	0b 00                	or     eax,DWORD PTR [eax]
 2fc:	00 10                	add    BYTE PTR [eax],dl
 2fe:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 301:	19 03                	sbb    DWORD PTR [ebx],eax
 303:	0e                   	push   cs
 304:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 306:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 308:	27                   	daa    
 309:	19 11                	sbb    DWORD PTR [ecx],edx
 30b:	01 12                	add    DWORD PTR [edx],edx
 30d:	06                   	push   es
 30e:	40                   	inc    eax
 30f:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 315:	00 00                	add    BYTE PTR [eax],al
 317:	11 05 00 03 0e 3a    	adc    DWORD PTR ds:0x3a0e0300,eax
 31d:	0b 3b                	or     edi,DWORD PTR [ebx]
 31f:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 322:	02 18                	add    bl,BYTE PTR [eax]
 324:	00 00                	add    BYTE PTR [eax],al
 326:	12 2e                	adc    ch,BYTE PTR [esi]
 328:	01 3f                	add    DWORD PTR [edi],edi
 32a:	19 03                	sbb    DWORD PTR [ebx],eax
 32c:	0e                   	push   cs
 32d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 32f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 331:	27                   	daa    
 332:	19 11                	sbb    DWORD PTR [ecx],edx
 334:	01 12                	add    DWORD PTR [edx],edx
 336:	06                   	push   es
 337:	40                   	inc    eax
 338:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 33e:	00 00                	add    BYTE PTR [eax],al
 340:	13 34 00             	adc    esi,DWORD PTR [eax+eax*1]
 343:	03 0e                	add    ecx,DWORD PTR [esi]
 345:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 347:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 349:	49                   	dec    ecx
 34a:	13 02                	adc    eax,DWORD PTR [edx]
 34c:	18 00                	sbb    BYTE PTR [eax],al
 34e:	00 14 2e             	add    BYTE PTR [esi+ebp*1],dl
 351:	01 3f                	add    DWORD PTR [edi],edi
 353:	19 03                	sbb    DWORD PTR [ebx],eax
 355:	0e                   	push   cs
 356:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 358:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 35a:	27                   	daa    
 35b:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 35e:	11 01                	adc    DWORD PTR [ecx],eax
 360:	12 06                	adc    al,BYTE PTR [esi]
 362:	40                   	inc    eax
 363:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 369:	00 00                	add    BYTE PTR [eax],al
 36b:	15 34 00 03 0e       	adc    eax,0xe030034
 370:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 372:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 374:	49                   	dec    ecx
 375:	13 00                	adc    eax,DWORD PTR [eax]
 377:	00 16                	add    BYTE PTR [esi],dl
 379:	34 00                	xor    al,0x0
 37b:	03 08                	add    ecx,DWORD PTR [eax]
 37d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 37f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 381:	49                   	dec    ecx
 382:	13 02                	adc    eax,DWORD PTR [edx]
 384:	18 00                	sbb    BYTE PTR [eax],al
 386:	00 17                	add    BYTE PTR [edi],dl
 388:	01 01                	add    DWORD PTR [ecx],eax
 38a:	49                   	dec    ecx
 38b:	13 01                	adc    eax,DWORD PTR [ecx]
 38d:	13 00                	adc    eax,DWORD PTR [eax]
 38f:	00 18                	add    BYTE PTR [eax],bl
 391:	21 00                	and    DWORD PTR [eax],eax
 393:	49                   	dec    ecx
 394:	13 2f                	adc    ebp,DWORD PTR [edi]
 396:	0b 00                	or     eax,DWORD PTR [eax]
 398:	00 19                	add    BYTE PTR [ecx],bl
 39a:	0b 01                	or     eax,DWORD PTR [ecx]
 39c:	11 01                	adc    DWORD PTR [ecx],eax
 39e:	12 06                	adc    al,BYTE PTR [esi]
 3a0:	00 00                	add    BYTE PTR [eax],al
 3a2:	1a 34 00             	sbb    dh,BYTE PTR [eax+eax*1]
 3a5:	03 0e                	add    ecx,DWORD PTR [esi]
 3a7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3a9:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 3af:	00 00                	add    BYTE PTR [eax],al
 3b1:	1b 2e                	sbb    ebp,DWORD PTR [esi]
 3b3:	01 3f                	add    DWORD PTR [edi],edi
 3b5:	19 03                	sbb    DWORD PTR [ebx],eax
 3b7:	0e                   	push   cs
 3b8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3ba:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 3c0:	11 01                	adc    DWORD PTR [ecx],eax
 3c2:	12 06                	adc    al,BYTE PTR [esi]
 3c4:	40                   	inc    eax
 3c5:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 3cb:	00 00                	add    BYTE PTR [eax],al
 3cd:	1c 05                	sbb    al,0x5
 3cf:	00 03                	add    BYTE PTR [ebx],al
 3d1:	0e                   	push   cs
 3d2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3d4:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 3da:	00 00                	add    BYTE PTR [eax],al
 3dc:	1d 34 00 03 08       	sbb    eax,0x8030034
 3e1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3e3:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 3e9:	00 00                	add    BYTE PTR [eax],al
 3eb:	1e                   	push   ds
 3ec:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 3ef:	19 03                	sbb    DWORD PTR [ebx],eax
 3f1:	0e                   	push   cs
 3f2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3f4:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 3fa:	12 06                	adc    al,BYTE PTR [esi]
 3fc:	40                   	inc    eax
 3fd:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 403:	00 00                	add    BYTE PTR [eax],al
 405:	1f                   	pop    ds
 406:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
 409:	19 03                	sbb    DWORD PTR [ebx],eax
 40b:	0e                   	push   cs
 40c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 40e:	3b 05 11 01 12 06    	cmp    eax,DWORD PTR ds:0x6120111
 414:	40                   	inc    eax
 415:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 41b:	20 2e                	and    BYTE PTR [esi],ch
 41d:	01 3f                	add    DWORD PTR [edi],edi
 41f:	19 03                	sbb    DWORD PTR [ebx],eax
 421:	0e                   	push   cs
 422:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 424:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 42a:	11 01                	adc    DWORD PTR [ecx],eax
 42c:	12 06                	adc    al,BYTE PTR [esi]
 42e:	40                   	inc    eax
 42f:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 435:	00 00                	add    BYTE PTR [eax],al
 437:	21 0a                	and    DWORD PTR [edx],ecx
 439:	00 03                	add    BYTE PTR [ebx],al
 43b:	0e                   	push   cs
 43c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 43e:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 444:	22 34 00             	and    dh,BYTE PTR [eax+eax*1]
 447:	03 0e                	add    ecx,DWORD PTR [esi]
 449:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 44b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 44d:	49                   	dec    ecx
 44e:	13 3f                	adc    edi,DWORD PTR [edi]
 450:	19 02                	sbb    DWORD PTR [edx],eax
 452:	18 00                	sbb    BYTE PTR [eax],al
 454:	00 23                	add    BYTE PTR [ebx],ah
 456:	15 00 27 19 00       	adc    eax,0x192700
 45b:	00 24 15 01 27 19 01 	add    BYTE PTR [edx*1+0x1192701],ah
 462:	13 00                	adc    eax,DWORD PTR [eax]
 464:	00 25 05 00 49 13    	add    BYTE PTR ds:0x13490005,ah
 46a:	00 00                	add    BYTE PTR [eax],al
 46c:	26 21 00             	and    DWORD PTR es:[eax],eax
 46f:	49                   	dec    ecx
 470:	13 2f                	adc    ebp,DWORD PTR [edi]
 472:	05 00 00 27 34       	add    eax,0x34270000
 477:	00 03                	add    BYTE PTR [ebx],al
 479:	08 3a                	or     BYTE PTR [edx],bh
 47b:	0b 3b                	or     edi,DWORD PTR [ebx]
 47d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 480:	3f                   	aas    
 481:	19 02                	sbb    DWORD PTR [edx],eax
 483:	18 00                	sbb    BYTE PTR [eax],al
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
  14:	d6                   	(bad)  
  15:	09 00                	or     DWORD PTR [eax],eax
	...
  1f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  22:	00 00                	add    BYTE PTR [eax],al
  24:	02 00                	add    al,BYTE PTR [eax]
  26:	2c 09                	sub    al,0x9
  28:	00 00                	add    BYTE PTR [eax],al
  2a:	04 00                	add    al,0x0
  2c:	00 00                	add    BYTE PTR [eax],al
  2e:	00 00                	add    BYTE PTR [eax],al
  30:	d8 09                	fmul   DWORD PTR [ecx]
  32:	10 03                	adc    BYTE PTR [ebx],al
  34:	80 0c 00 00          	or     BYTE PTR [eax+eax*1],0x0
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	cf                   	iret   
   1:	06                   	push   es
   2:	00 00                	add    BYTE PTR [eax],al
   4:	31 07                	xor    DWORD PTR [edi],eax
   6:	00 00                	add    BYTE PTR [eax],al
   8:	33 07                	xor    eax,DWORD PTR [edi]
   a:	00 00                	add    BYTE PTR [eax],al
   c:	34 07                	xor    al,0x7
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	76 02                	jbe    4 <cmdClearScreen-0x30ffffc>
   2:	00 00                	add    BYTE PTR [eax],al
   4:	02 00                	add    al,BYTE PTR [eax]
   6:	29 01                	sub    DWORD PTR [ecx],eax
   8:	00 00                	add    BYTE PTR [eax],al
   a:	01 01                	add    DWORD PTR [ecx],eax
   c:	fb                   	sti    
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
  e7:	66 69 6c 65 2e 68 00 	imul   bp,WORD PTR [ebp+eiz*2+0x2e],0x68
  ee:	03 00                	add    eax,DWORD PTR [eax]
  f0:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
  f3:	75 2e                	jne    123 <cmdClearScreen-0x30ffedd>
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
 13b:	0c 01                	or     al,0x1
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
 17f:	9f                   	lahf   
 180:	4b                   	dec    ebx
 181:	76 75                	jbe    1f8 <cmdClearScreen-0x30ffe08>
 183:	02 34 16             	add    dh,BYTE PTR [esi+edx*1]
 186:	08 4b a2             	or     BYTE PTR [ebx-0x5e],cl
 189:	08 59 a0             	or     BYTE PTR [ecx-0x60],bl
 18c:	08 2f                	or     BYTE PTR [edi],ch
 18e:	08 83 67 67 08 59    	or     BYTE PTR [ebx+0x59086767],al
 194:	67 08 59 67          	or     BYTE PTR [bx+di+0x67],bl
 198:	08 ca                	or     dl,cl
 19a:	08 13                	or     BYTE PTR [ebx],dl
 19c:	77 08                	ja     1a6 <cmdClearScreen-0x30ffe5a>
 19e:	76 9f                	jbe    13f <cmdClearScreen-0x30ffec1>
 1a0:	a0 a0 f3 a2 bb       	mov    al,ds:0xbba2f3a0
 1a5:	08 92 08 77 08 ae    	or     BYTE PTR [edx-0x51f788f8],dl
 1ab:	08 59 a1             	or     BYTE PTR [ecx-0x5f],bl
 1ae:	08 e5                	or     ch,ah
 1b0:	4c                   	dec    esp
 1b1:	84 a3 67 08 92 f3    	test   BYTE PTR [ebx-0xc6df799],ah
 1b7:	a0 67 08 4b 67       	mov    al,ds:0x674b0867
 1bc:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 1bf:	d8 68 08             	fsubr  DWORD PTR [eax+0x8]
 1c2:	3f                   	aas    
 1c3:	75 08                	jne    1cd <cmdClearScreen-0x30ffe33>
 1c5:	30 67 08             	xor    BYTE PTR [edi+0x8],ah
 1c8:	4d                   	dec    ebp
 1c9:	ae                   	scas   al,BYTE PTR es:[edi]
 1ca:	08 3d bb 08 5b 08    	or     BYTE PTR ds:0x85b08bb,bh
 1d0:	91                   	xchg   ecx,eax
 1d1:	08 69 d7             	or     BYTE PTR [ecx-0x29],ch
 1d4:	d7                   	xlat   BYTE PTR ds:[ebx]
 1d5:	67 d7                	xlat   BYTE PTR ds:[bx]
 1d7:	67 d7                	xlat   BYTE PTR ds:[bx]
 1d9:	67 d8 5b 69          	fcomp  DWORD PTR [bp+di+0x69]
 1dd:	83 d7 83             	adc    edi,0xffffff83
 1e0:	08 68 3f             	or     BYTE PTR [eax+0x3f],ch
 1e3:	67 76 75             	addr16 jbe 25b <cmdClearScreen-0x30ffda5>
 1e6:	67 08 4c 08          	or     BYTE PTR [si+0x8],cl
 1ea:	3e                   	ds
 1eb:	67 67 67 68 4c 92 08 	addr32 addr32 addr16 push 0x9108924c
 1f2:	91 
 1f3:	d7                   	xlat   BYTE PTR ds:[ebx]
 1f4:	ae                   	scas   al,BYTE PTR es:[edi]
 1f5:	08 21                	or     BYTE PTR [ecx],ah
 1f7:	67 00 02             	add    BYTE PTR [bp+si],al
 1fa:	04 02                	add    al,0x2
 1fc:	03 78 2e             	add    edi,DWORD PTR [eax+0x2e]
 1ff:	00 02                	add    BYTE PTR [edx],al
 201:	04 01                	add    al,0x1
 203:	06                   	push   es
 204:	4a                   	dec    edx
 205:	06                   	push   es
 206:	03 0c 82             	add    ecx,DWORD PTR [edx+eax*4]
 209:	2a 00                	sub    al,BYTE PTR [eax]
 20b:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 20e:	24 3f                	and    al,0x3f
 210:	67 08 13             	or     BYTE PTR [bp+di],dl
 213:	3f                   	aas    
 214:	93                   	xchg   ebx,eax
 215:	08 ca                	or     dl,cl
 217:	08 bd 9f 75 3f 69    	or     BYTE PTR [ebp+0x693f759f],bh
 21d:	08 5f 08             	or     BYTE PTR [edi+0x8],bl
 220:	2f                   	das    
 221:	bb 68 02 22 13       	mov    ebx,0x13220268
 226:	02 2e                	add    ch,BYTE PTR [esi]
 228:	16                   	push   ss
 229:	00 02                	add    BYTE PTR [edx],al
 22b:	04 02                	add    al,0x2
 22d:	03 78 02             	add    edi,DWORD PTR [eax+0x2]
 230:	2c 01                	sub    al,0x1
 232:	00 02                	add    BYTE PTR [edx],al
 234:	04 01                	add    al,0x1
 236:	06                   	push   es
 237:	4a                   	dec    edx
 238:	06                   	push   es
 239:	03 0b                	add    ecx,DWORD PTR [ebx]
 23b:	9e                   	sahf   
 23c:	3f                   	aas    
 23d:	67 08 2f             	or     BYTE PTR [bx],ch
 240:	02 24 13             	add    ah,BYTE PTR [ebx+edx*1]
 243:	d7                   	xlat   BYTE PTR ds:[ebx]
 244:	3f                   	aas    
 245:	9e                   	sahf   
 246:	4c                   	dec    esp
 247:	08 bd 75 02 38 14    	or     BYTE PTR [ebp+0x14380275],bh
 24d:	00 02                	add    BYTE PTR [edx],al
 24f:	04 03                	add    al,0x3
 251:	91                   	xchg   ecx,eax
 252:	00 02                	add    BYTE PTR [edx],al
 254:	04 03                	add    al,0x3
 256:	b9 00 02 04 01       	mov    ecx,0x1040200
 25b:	06                   	push   es
 25c:	4a                   	dec    edx
 25d:	06                   	push   es
 25e:	85 91 d7 00 02 04    	test   DWORD PTR [ecx+0x40200d7],edx
 264:	02 f0                	add    dh,al
 266:	00 02                	add    BYTE PTR [edx],al
 268:	04 01                	add    al,0x1
 26a:	06                   	push   es
 26b:	4a                   	dec    edx
 26c:	06                   	push   es
 26d:	86 ae 08 4b 31 02    	xchg   BYTE PTR [esi+0x2314b08],ch
 273:	2c 13                	sub    al,0x13
 275:	02 05 00 01 01 2c    	add    al,BYTE PTR ds:0x2c010100
 27b:	03 00                	add    eax,DWORD PTR [eax]
 27d:	00 02                	add    BYTE PTR [edx],al
 27f:	00 27                	add    BYTE PTR [edi],ah
 281:	01 00                	add    DWORD PTR [eax],eax
 283:	00 01                	add    BYTE PTR [ecx],al
 285:	01 fb                	add    ebx,edi
 287:	0e                   	push   cs
 288:	0d 00 01 01 01       	or     eax,0x1010100
 28d:	01 00                	add    DWORD PTR [eax],eax
 28f:	00 00                	add    BYTE PTR [eax],al
 291:	01 00                	add    DWORD PTR [eax],eax
 293:	00 01                	add    BYTE PTR [ecx],al
 295:	73 72                	jae    309 <cmdClearScreen-0x30ffcf7>
 297:	63 00                	arpl   WORD PTR [eax],ax
 299:	2f                   	das    
 29a:	68 6f 6d 65 2f       	push   0x2f656d6f
 29f:	79 6f                	jns    310 <cmdClearScreen-0x30ffcf0>
 2a1:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
 2a8:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 2ab:	73 73                	jae    320 <cmdClearScreen-0x30ffce0>
 2ad:	2f                   	das    
 2ae:	6c                   	ins    BYTE PTR es:[edi],dx
 2af:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
 2b6:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
 2bc:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
 2c2:	78 2d                	js     2f1 <cmdClearScreen-0x30ffd0f>
 2c4:	67 6e                	outs   dx,BYTE PTR ds:[si]
 2c6:	75 2f                	jne    2f7 <cmdClearScreen-0x30ffd09>
 2c8:	35 2e 33 2e 30       	xor    eax,0x302e332e
 2cd:	2f                   	das    
 2ce:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 2d5:	00 2e                	add    BYTE PTR [esi],ch
 2d7:	2e                   	cs
 2d8:	2f                   	das    
 2d9:	2e                   	cs
 2da:	2e                   	cs
 2db:	2f                   	das    
 2dc:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 2e0:	6a 2f                	push   0x2f
 2e2:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 2e5:	69 73 4f 53 2f 69 6e 	imul   esi,DWORD PTR [ebx+0x4f],0x6e692f53
 2ec:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 2f0:	65                   	gs
 2f1:	2f                   	das    
 2f2:	69 33 38 36 00 69    	imul   esi,DWORD PTR [ebx],0x69003638
 2f8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2f9:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 2fd:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 300:	2e                   	cs
 301:	2f                   	das    
 302:	6c                   	ins    BYTE PTR es:[edi],dx
 303:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 30a:	4f                   	dec    edi
 30b:	53                   	push   ebx
 30c:	2f                   	das    
 30d:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 314:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 317:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 31b:	65                   	gs
 31c:	2f                   	das    
 31d:	2e                   	cs
 31e:	2e                   	cs
 31f:	2f                   	das    
 320:	2e                   	cs
 321:	2e                   	cs
 322:	2f                   	das    
 323:	2e                   	cs
 324:	2e                   	cs
 325:	2f                   	das    
 326:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 32a:	6a 2f                	push   0x2f
 32c:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 32f:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
 336:	6e                   	outs   dx,BYTE PTR ds:[esi]
 337:	65                   	gs
 338:	6c                   	ins    BYTE PTR es:[edi],dx
 339:	2f                   	das    
 33a:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 341:	00 00                	add    BYTE PTR [eax],al
 343:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 347:	6c                   	ins    BYTE PTR es:[edi],dx
 348:	6c                   	ins    BYTE PTR es:[edi],dx
 349:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 34c:	01 00                	add    DWORD PTR [eax],eax
 34e:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 351:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
 358:	63 
 359:	2e                   	cs
 35a:	68 00 02 00 00       	push   0x200
 35f:	63 70 75             	arpl   WORD PTR [eax+0x75],si
 362:	2e                   	cs
 363:	68 00 03 00 00       	push   0x300
 368:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 36c:	6c                   	ins    BYTE PTR es:[edi],dx
 36d:	6c                   	ins    BYTE PTR es:[edi],dx
 36e:	2e                   	cs
 36f:	68 00 04 00 00       	push   0x400
 374:	6d                   	ins    DWORD PTR es:[edi],dx
 375:	61                   	popa   
 376:	6c                   	ins    BYTE PTR es:[edi],dx
 377:	6c                   	ins    BYTE PTR es:[edi],dx
 378:	6f                   	outs   dx,DWORD PTR ds:[esi]
 379:	63 2e                	arpl   WORD PTR [esi],bp
 37b:	68 00 05 00 00       	push   0x500
 380:	66 69 6c 65 2e 68 00 	imul   bp,WORD PTR [ebp+eiz*2+0x2e],0x68
 387:	05 00 00 6c 69       	add    eax,0x696c0000
 38c:	62 43 68             	bound  eax,QWORD PTR [ebx+0x68]
 38f:	72 69                	jb     3fa <cmdClearScreen-0x30ffc06>
 391:	73 4f                	jae    3e2 <cmdClearScreen-0x30ffc1e>
 393:	53                   	push   ebx
 394:	2e                   	cs
 395:	68 00 05 00 00       	push   0x500
 39a:	74 68                	je     404 <cmdClearScreen-0x30ffbfc>
 39c:	65                   	gs
 39d:	73 69                	jae    408 <cmdClearScreen-0x30ffbf8>
 39f:	67 6e                	outs   dx,BYTE PTR ds:[si]
 3a1:	61                   	popa   
 3a2:	6c                   	ins    BYTE PTR es:[edi],dx
 3a3:	73 2e                	jae    3d3 <cmdClearScreen-0x30ffc2d>
 3a5:	68 00 06 00 00       	push   0x600
 3aa:	00 00                	add    BYTE PTR [eax],al
 3ac:	05 02 d8 09 10       	add    eax,0x1009d802
 3b1:	03 03                	add    eax,DWORD PTR [ebx]
 3b3:	19 01                	sbb    DWORD PTR [ecx],eax
 3b5:	3e                   	ds
 3b6:	3f                   	aas    
 3b7:	67 68 30 08 13 47    	addr16 push 0x47130830
 3bd:	95                   	xchg   ebp,eax
 3be:	40                   	inc    eax
 3bf:	67 a0 08 30          	addr16 mov al,ds:0x3008
 3c3:	77 08                	ja     3cd <cmdClearScreen-0x30ffc33>
 3c5:	5a                   	pop    edx
 3c6:	08 75 08             	or     BYTE PTR [ebp+0x8],dh
 3c9:	4b                   	dec    ebx
 3ca:	30 02                	xor    BYTE PTR [edx],al
 3cc:	23 13                	and    edx,DWORD PTR [ebx]
 3ce:	08 c9                	or     cl,cl
 3d0:	08 3d 67 03 7a 4a    	or     BYTE PTR ds:0x4a7a0367,bh
 3d6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3d7:	59                   	pop    ecx
 3d8:	31 75 d7             	xor    DWORD PTR [ebp-0x29],esi
 3db:	08 14 68             	or     BYTE PTR [eax+ebp*2],dl
 3de:	4c                   	dec    esp
 3df:	08 21                	or     BYTE PTR [ecx],ah
 3e1:	08 21                	or     BYTE PTR [ecx],ah
 3e3:	08 13                	or     BYTE PTR [ebx],dl
 3e5:	03 0b                	add    ecx,DWORD PTR [ebx]
 3e7:	74 03                	je     3ec <cmdClearScreen-0x30ffc14>
 3e9:	78 2e                	js     419 <cmdClearScreen-0x30ffbe7>
 3eb:	02 30                	add    dh,BYTE PTR [eax]
 3ed:	1a 2c d8             	sbb    ch,BYTE PTR [eax+ebx*8]
 3f0:	69 75 d7 d7 4c 08 3e 	imul   esi,DWORD PTR [ebp-0x29],0x3e084cd7
 3f7:	bc e6 ae 94 08       	mov    esp,0x894aee6
 3fc:	4b                   	dec    ebx
 3fd:	e5 93                	in     eax,0x93
 3ff:	00 02                	add    BYTE PTR [edx],al
 401:	04 02                	add    al,0x2
 403:	06                   	push   es
 404:	e4 00                	in     al,0x0
 406:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
 409:	e4 00                	in     al,0x0
 40b:	02 04 05 e4 06 af 00 	add    al,BYTE PTR [eax*1+0xaf06e4]
 412:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 415:	06                   	push   es
 416:	e4 06                	in     al,0x6
 418:	e5 02                	in     eax,0x2
 41a:	25 13 08 4b 67       	and    eax,0x674b0813
 41f:	e3 34                	jecxz  455 <cmdClearScreen-0x30ffbab>
 421:	00 02                	add    BYTE PTR [edx],al
 423:	04 02                	add    al,0x2
 425:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 42b:	02 03                	add    al,BYTE PTR [ebx]
 42d:	63 4a 00             	arpl   WORD PTR [edx+0x0],cx
 430:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 433:	06                   	push   es
 434:	4a                   	dec    edx
 435:	06                   	push   es
 436:	03 1f                	add    ebx,DWORD PTR [edi]
 438:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 43b:	4b                   	dec    ebx
 43c:	08 4f 3d             	or     BYTE PTR [edi+0x3d],cl
 43f:	5b                   	pop    ebx
 440:	6a 92                	push   0xffffff92
 442:	02 3b                	add    bh,BYTE PTR [ebx]
 444:	14 69                	adc    al,0x69
 446:	00 02                	add    BYTE PTR [edx],al
 448:	04 02                	add    al,0x2
 44a:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 44d:	00 02                	add    BYTE PTR [edx],al
 44f:	04 01                	add    al,0x1
 451:	06                   	push   es
 452:	4a                   	dec    edx
 453:	06                   	push   es
 454:	03 0b                	add    ecx,DWORD PTR [ebx]
 456:	66 59                	pop    cx
 458:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 45b:	75 75                	jne    4d2 <cmdClearScreen-0x30ffb2e>
 45d:	75 75                	jne    4d4 <cmdClearScreen-0x30ffb2c>
 45f:	78 a1                	js     402 <cmdClearScreen-0x30ffbfe>
 461:	08 ec                	or     ah,ch
 463:	00 02                	add    BYTE PTR [edx],al
 465:	04 01                	add    al,0x1
 467:	06                   	push   es
 468:	66 06                	pushw  es
 46a:	af                   	scas   eax,DWORD PTR es:[edi]
 46b:	68 75 08 4c 67       	push   0x674c0875
 470:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 473:	5a                   	pop    edx
 474:	00 02                	add    BYTE PTR [edx],al
 476:	04 01                	add    al,0x1
 478:	06                   	push   es
 479:	9e                   	sahf   
 47a:	00 02                	add    BYTE PTR [edx],al
 47c:	04 02                	add    al,0x2
 47e:	66                   	data16
 47f:	00 02                	add    BYTE PTR [edx],al
 481:	04 03                	add    al,0x3
 483:	66 06                	pushw  es
 485:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 486:	68 75 08 5a a0       	push   0xa05a0875
 48b:	bc 68 a0 94 08       	mov    esp,0x894a068
 490:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 493:	94                   	xchg   esp,eax
 494:	08 33                	or     BYTE PTR [ebx],dh
 496:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 49b:	16                   	push   ss
 49c:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 49f:	03 3a                	add    edi,DWORD PTR [edx]
 4a1:	d6                   	(bad)  
 4a2:	68 d8 08 e7 08       	push   0x8e708d8
 4a7:	13 d7                	adc    edx,edi
 4a9:	08 e5                	or     ch,ah
 4ab:	08 3e                	or     BYTE PTR [esi],bh
 4ad:	4b                   	dec    ebx
 4ae:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 4b1:	d9 d9                	(bad)  
 4b3:	d7                   	xlat   BYTE PTR ds:[ebx]
 4b4:	d7                   	xlat   BYTE PTR ds:[ebx]
 4b5:	3d 31 75 00 02       	cmp    eax,0x2007531
 4ba:	04 03                	add    al,0x3
 4bc:	92                   	xchg   edx,eax
 4bd:	00 02                	add    BYTE PTR [edx],al
 4bf:	04 03                	add    al,0x3
 4c1:	02 22                	add    ah,BYTE PTR [edx]
 4c3:	13 00                	adc    eax,DWORD PTR [eax]
 4c5:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 4c8:	02 30                	add    dh,BYTE PTR [eax]
 4ca:	0f 00 02             	sldt   WORD PTR [edx]
 4cd:	04 01                	add    al,0x1
 4cf:	06                   	push   es
 4d0:	4a                   	dec    edx
 4d1:	06                   	push   es
 4d2:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 4d8:	04 03                	add    al,0x3
 4da:	91                   	xchg   ecx,eax
 4db:	00 02                	add    BYTE PTR [edx],al
 4dd:	04 03                	add    al,0x3
 4df:	ff 00                	inc    DWORD PTR [eax]
 4e1:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 4e4:	06                   	push   es
 4e5:	4a                   	dec    edx
 4e6:	06                   	push   es
 4e7:	84 d7                	test   bh,dl
 4e9:	3f                   	aas    
 4ea:	68 92 08 30 08       	push   0x8300892
 4ef:	f3 68 08 5a 08 4c    	repz push 0x4c085a08
 4f5:	00 02                	add    BYTE PTR [edx],al
 4f7:	04 02                	add    al,0x2
 4f9:	03 75 74             	add    esi,DWORD PTR [ebp+0x74]
 4fc:	00 02                	add    BYTE PTR [edx],al
 4fe:	04 01                	add    al,0x1
 500:	06                   	push   es
 501:	4a                   	dec    edx
 502:	06                   	push   es
 503:	03 0f                	add    ecx,DWORD PTR [edi]
 505:	66 59                	pop    cx
 507:	03 0d 2e 67 02 25    	add    ecx,DWORD PTR ds:0x2502672e
 50d:	13 3f                	adc    edi,DWORD PTR [edi]
 50f:	67 08 91 3f 67       	or     BYTE PTR [bx+di+0x673f],dl
 514:	59                   	pop    ecx
 515:	59                   	pop    ecx
 516:	08 30                	or     BYTE PTR [eax],dh
 518:	3f                   	aas    
 519:	3d 85 75 22 3f       	cmp    eax,0x3f227585
 51e:	3d 86 75 77 59       	cmp    eax,0x59777586
 523:	31 67 4b             	xor    DWORD PTR [edi+0x4b],esp
 526:	75 77                	jne    59f <cmdClearScreen-0x30ffa61>
 528:	08 4b 75             	or     BYTE PTR [ebx+0x75],cl
 52b:	9f                   	lahf   
 52c:	75 08                	jne    536 <cmdClearScreen-0x30ffaca>
 52e:	4b                   	dec    ebx
 52f:	83 4b 08 4b          	or     DWORD PTR [ebx+0x8],0x4b
 533:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 536:	5b                   	pop    ebx
 537:	08 3e                	or     BYTE PTR [esi],bh
 539:	5b                   	pop    ebx
 53a:	9f                   	lahf   
 53b:	75 4b                	jne    588 <cmdClearScreen-0x30ffa78>
 53d:	75 08                	jne    547 <cmdClearScreen-0x30ffab9>
 53f:	67 08 4b 5a          	or     BYTE PTR [bp+di+0x5a],cl
 543:	4b                   	dec    ebx
 544:	31 08                	xor    DWORD PTR [eax],ecx
 546:	5a                   	pop    edx
 547:	75 32                	jne    57b <cmdClearScreen-0x30ffa85>
 549:	ae                   	scas   al,BYTE PTR es:[edi]
 54a:	08 22                	or     BYTE PTR [edx],ah
 54c:	75 75                	jne    5c3 <cmdClearScreen-0x30ffa3d>
 54e:	f3 03 6f 58          	repz add ebp,DWORD PTR [edi+0x58]
 552:	03 16                	add    edx,DWORD PTR [esi]
 554:	82                   	(bad)  
 555:	bc cb f4 02 2b       	mov    esp,0x2b02f4cb
 55a:	13 83 30 f3 47 6b    	adc    eax,DWORD PTR [ebx+0x6b47f330]
 560:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 563:	30 5d bc             	xor    BYTE PTR [ebp-0x44],bl
 566:	cb                   	retf   
 567:	08 4c 02 2b          	or     BYTE PTR [edx+eax*1+0x2b],cl
 56b:	13 83 30 f3 47 6b    	adc    eax,DWORD PTR [ebx+0x6b47f330]
 571:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 574:	30 5d 84             	xor    BYTE PTR [ebp-0x7c],bl
 577:	a0 f5 5a 84 08       	mov    al,ds:0x8845af5
 57c:	4c                   	dec    esp
 57d:	84 d8                	test   al,bl
 57f:	4b                   	dec    ebx
 580:	ad                   	lods   eax,DWORD PTR ds:[esi]
 581:	08 4d 84             	or     BYTE PTR [ebp-0x7c],cl
 584:	f3 03 0d 20 03 77 f2 	repz add ecx,DWORD PTR ds:0xf2770320
 58b:	08 30                	or     BYTE PTR [eax],dh
 58d:	08 76 76             	or     BYTE PTR [esi+0x76],dh
 590:	5d                   	pop    ebp
 591:	67 f3 08 2f          	repz or BYTE PTR [bx],ch
 595:	03 87 7f 08 ac 03    	add    eax,DWORD PTR [edi+0x3ac087f]
 59b:	fb                   	sti    
 59c:	00 08                	add    BYTE PTR [eax],cl
 59e:	20 08                	and    BYTE PTR [eax],cl
 5a0:	13 91 08 13 59 02    	adc    edx,DWORD PTR [ecx+0x2591308]
 5a6:	02 00                	add    al,BYTE PTR [eax]
 5a8:	01 01                	add    DWORD PTR [ecx],eax

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
   f:	73 74                	jae    85 <cmdClearScreen-0x30fff7b>
  11:	64 69 6e 52 65 64 69 	imul   ebp,DWORD PTR fs:[esi+0x52],0x72696465
  18:	72 
  19:	00 76 61             	add    BYTE PTR [esi+0x61],dh
  1c:	72 56                	jb     74 <cmdClearScreen-0x30fff8c>
  1e:	61                   	popa   
  1f:	6c                   	ins    BYTE PTR es:[edi],dx
  20:	75 65                	jne    87 <cmdClearScreen-0x30fff79>
  22:	00 73 66             	add    BYTE PTR [ebx+0x66],dh
  25:	73 74                	jae    9b <cmdClearScreen-0x30fff65>
  27:	61                   	popa   
  28:	74 00                	je     2a <cmdClearScreen-0x30fffd6>
  2a:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
  2d:	45                   	inc    ebp
  2e:	78 69                	js     99 <cmdClearScreen-0x30fff67>
  30:	74 00                	je     32 <cmdClearScreen-0x30fffce>
  32:	2f                   	das    
  33:	68 6f 6d 65 2f       	push   0x2f656d6f
  38:	79 6f                	jns    a9 <cmdClearScreen-0x30fff57>
  3a:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  41:	6f                   	outs   dx,DWORD PTR ds:[esi]
  42:	73 2f                	jae    73 <cmdClearScreen-0x30fff8d>
  44:	61                   	popa   
  45:	70 72                	jo     b9 <cmdClearScreen-0x30fff47>
  47:	6f                   	outs   dx,DWORD PTR ds:[esi]
  48:	6a 2f                	push   0x2f
  4a:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  4e:	6c                   	ins    BYTE PTR es:[edi],dx
  4f:	6c                   	ins    BYTE PTR es:[edi],dx
  50:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  53:	64                   	fs
  54:	53                   	push   ebx
  55:	6c                   	ins    BYTE PTR es:[edi],dx
  56:	65                   	gs
  57:	65                   	gs
  58:	70 00                	jo     5a <cmdClearScreen-0x30fffa6>
  5a:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
  5d:	50                   	push   eax
  5e:	72 69                	jb     c9 <cmdClearScreen-0x30fff37>
  60:	6e                   	outs   dx,BYTE PTR ds:[esi]
  61:	74 45                	je     a8 <cmdClearScreen-0x30fff58>
  63:	6e                   	outs   dx,BYTE PTR ds:[esi]
  64:	76 00                	jbe    66 <cmdClearScreen-0x30fff9a>
  66:	68 65 61 70 45       	push   0x45706165
  6b:	6e                   	outs   dx,BYTE PTR ds:[esi]
  6c:	64 00 64 65 73       	add    BYTE PTR fs:[ebp+eiz*2+0x73],ah
  71:	63 72 69             	arpl   WORD PTR [edx+0x69],si
  74:	70 74                	jo     ea <cmdClearScreen-0x30fff16>
  76:	69 6f 6e 00 73 69 7a 	imul   ebp,DWORD PTR [edi+0x6e],0x7a697300
  7d:	65                   	gs
  7e:	74 79                	je     f9 <cmdClearScreen-0x30fff07>
  80:	70 65                	jo     e7 <cmdClearScreen-0x30fff19>
  82:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  85:	64                   	fs
  86:	45                   	inc    ebp
  87:	78 65                	js     ee <cmdClearScreen-0x30fff12>
  89:	63 70 00             	arpl   WORD PTR [eax+0x0],si
  8c:	53                   	push   ebx
  8d:	49                   	dec    ecx
  8e:	47                   	inc    edi
  8f:	53                   	push   ebx
  90:	54                   	push   esp
  91:	4f                   	dec    edi
  92:	50                   	push   eax
  93:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  96:	64                   	fs
  97:	6c                   	ins    BYTE PTR es:[edi],dx
  98:	69 6e 65 00 47 4e 55 	imul   ebp,DWORD PTR [esi+0x65],0x554e4700
  9f:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  a2:	39 20                	cmp    DWORD PTR [eax],esp
  a4:	35 2e 33 2e 30       	xor    eax,0x302e332e
  a9:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
  af:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  b4:	6c                   	ins    BYTE PTR es:[edi],dx
  b5:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  bb:	65                   	gs
  bc:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  c1:	72 69                	jb     12c <cmdClearScreen-0x30ffed4>
  c3:	63 20                	arpl   WORD PTR [eax],sp
  c5:	2d 6d 61 72 63       	sub    eax,0x6372616d
  ca:	68 3d 70 65 6e       	push   0x6e65703d
  cf:	74 69                	je     13a <cmdClearScreen-0x30ffec6>
  d1:	75 6d                	jne    140 <cmdClearScreen-0x30ffec0>
  d3:	70 72                	jo     147 <cmdClearScreen-0x30ffeb9>
  d5:	6f                   	outs   dx,DWORD PTR ds:[esi]
  d6:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  dc:	74 64                	je     142 <cmdClearScreen-0x30ffebe>
  de:	3d 63 39 39 20       	cmp    eax,0x20393963
  e3:	2d 66 66 72 65       	sub    eax,0x65726666
  e8:	65                   	gs
  e9:	73 74                	jae    15f <cmdClearScreen-0x30ffea1>
  eb:	61                   	popa   
  ec:	6e                   	outs   dx,BYTE PTR ds:[esi]
  ed:	64 69 6e 67 00 73 72 	imul   ebp,DWORD PTR fs:[esi+0x67],0x63727300
  f4:	63 
  f5:	2f                   	das    
  f6:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  f9:	6d                   	ins    DWORD PTR es:[edi],dx
  fa:	61                   	popa   
  fb:	6e                   	outs   dx,BYTE PTR ds:[esi]
  fc:	64                   	fs
  fd:	73 2e                	jae    12d <cmdClearScreen-0x30ffed3>
  ff:	63 00                	arpl   WORD PTR [eax],ax
 101:	53                   	push   ebx
 102:	49                   	dec    ecx
 103:	47                   	inc    edi
 104:	55                   	push   ebp
 105:	53                   	push   ebx
 106:	4c                   	dec    esp
 107:	45                   	inc    ebp
 108:	45                   	inc    ebp
 109:	50                   	push   eax
 10a:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 10d:	64                   	fs
 10e:	50                   	push   eax
 10f:	77 64                	ja     175 <cmdClearScreen-0x30ffe8b>
 111:	00 73 4b             	add    BYTE PTR [ebx+0x4b],dh
 114:	53                   	push   ebx
 115:	68 65 6c 6c 50       	push   0x506c6c65
 11a:	72 6f                	jb     18b <cmdClearScreen-0x30ffe75>
 11c:	67 72 61             	addr16 jb 180 <cmdClearScreen-0x30ffe80>
 11f:	6d                   	ins    DWORD PTR es:[edi],dx
 120:	4e                   	dec    esi
 121:	61                   	popa   
 122:	6d                   	ins    DWORD PTR es:[edi],dx
 123:	65 00 74 69 6d       	add    BYTE PTR gs:[ecx+ebp*2+0x6d],dh
 128:	65                   	gs
 129:	54                   	push   esp
 12a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 12b:	45                   	inc    ebp
 12c:	78 69                	js     197 <cmdClearScreen-0x30ffe69>
 12e:	74 00                	je     130 <cmdClearScreen-0x30ffed0>
 130:	73 74                	jae    1a6 <cmdClearScreen-0x30ffe5a>
 132:	61                   	popa   
 133:	72 74                	jb     1a9 <cmdClearScreen-0x30ffe57>
 135:	54                   	push   esp
 136:	69 63 6b 73 00 6b 65 	imul   esp,DWORD PTR [ebx+0x6b],0x656b0073
 13d:	78 65                	js     1a4 <cmdClearScreen-0x30ffe5c>
 13f:	63 00                	arpl   WORD PTR [eax],ax
 141:	73 74                	jae    1b7 <cmdClearScreen-0x30ffe49>
 143:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 145:	75 74                	jne    1bb <cmdClearScreen-0x30ffe45>
 147:	70 69                	jo     1b2 <cmdClearScreen-0x30ffe4e>
 149:	70 65                	jo     1b0 <cmdClearScreen-0x30ffe50>
 14b:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 14e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 14f:	74 38                	je     189 <cmdClearScreen-0x30ffe77>
 151:	5f                   	pop    edi
 152:	74 00                	je     154 <cmdClearScreen-0x30ffeac>
 154:	65                   	gs
 155:	73 69                	jae    1c0 <cmdClearScreen-0x30ffe40>
 157:	67 6e                	outs   dx,BYTE PTR ds:[si]
 159:	61                   	popa   
 15a:	6c                   	ins    BYTE PTR es:[edi],dx
 15b:	73 00                	jae    15d <cmdClearScreen-0x30ffea3>
 15d:	75 69                	jne    1c8 <cmdClearScreen-0x30ffe38>
 15f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 160:	74 70                	je     1d2 <cmdClearScreen-0x30ffe2e>
 162:	74 72                	je     1d6 <cmdClearScreen-0x30ffe2a>
 164:	5f                   	pop    edi
 165:	74 00                	je     167 <cmdClearScreen-0x30ffe99>
 167:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 16a:	6d                   	ins    DWORD PTR es:[edi],dx
 16b:	61                   	popa   
 16c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 16d:	64                   	fs
 16e:	5f                   	pop    edi
 16f:	66                   	data16
 170:	75 6e                	jne    1e0 <cmdClearScreen-0x30ffe20>
 172:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 176:	6e                   	outs   dx,BYTE PTR ds:[esi]
 177:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 17a:	74 56                	je     1d2 <cmdClearScreen-0x30ffe2e>
 17c:	61                   	popa   
 17d:	6c                   	ins    BYTE PTR es:[edi],dx
 17e:	00 66 73             	add    BYTE PTR [esi+0x73],ah
 181:	74 61                	je     1e4 <cmdClearScreen-0x30ffe1c>
 183:	74 5f                	je     1e4 <cmdClearScreen-0x30ffe1c>
 185:	74 00                	je     187 <cmdClearScreen-0x30ffe79>
 187:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 18a:	43                   	inc    ebx
 18b:	6c                   	ins    BYTE PTR es:[edi],dx
 18c:	65                   	gs
 18d:	61                   	popa   
 18e:	72 53                	jb     1e3 <cmdClearScreen-0x30ffe1d>
 190:	63 72 65             	arpl   WORD PTR [edx+0x65],si
 193:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 195:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
 198:	6f                   	outs   dx,DWORD PTR ds:[esi]
 199:	72 74                	jb     20f <cmdClearScreen-0x30ffdf1>
 19b:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 19e:	74 00                	je     1a0 <cmdClearScreen-0x30ffe60>
 1a0:	70 61                	jo     203 <cmdClearScreen-0x30ffdfd>
 1a2:	72 61                	jb     205 <cmdClearScreen-0x30ffdfb>
 1a4:	6d                   	ins    DWORD PTR es:[edi],dx
 1a5:	43                   	inc    ebx
 1a6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1a7:	75 6e                	jne    217 <cmdClearScreen-0x30ffde9>
 1a9:	74 00                	je     1ab <cmdClearScreen-0x30ffe55>
 1ab:	62 53 69             	bound  edx,QWORD PTR [ebx+0x69]
 1ae:	67 49                	addr16 dec ecx
 1b0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1b1:	74 52                	je     205 <cmdClearScreen-0x30ffdfb>
 1b3:	65 63 65 69          	arpl   WORD PTR gs:[ebp+0x69],sp
 1b7:	76 65                	jbe    21e <cmdClearScreen-0x30ffde2>
 1b9:	64 00 6c 6f 6e       	add    BYTE PTR fs:[edi+ebp*2+0x6e],ch
 1be:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 1c2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1c3:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 1c7:	74 00                	je     1c9 <cmdClearScreen-0x30ffe37>
 1c9:	65                   	gs
 1ca:	78 65                	js     231 <cmdClearScreen-0x30ffdcf>
 1cc:	63 50 69             	arpl   WORD PTR [eax+0x69],dx
 1cf:	70 65                	jo     236 <cmdClearScreen-0x30ffdca>
 1d1:	73 00                	jae    1d3 <cmdClearScreen-0x30ffe2d>
 1d3:	76 61                	jbe    236 <cmdClearScreen-0x30ffdca>
 1d5:	72 4e                	jb     225 <cmdClearScreen-0x30ffddb>
 1d7:	61                   	popa   
 1d8:	6d                   	ins    DWORD PTR es:[edi],dx
 1d9:	65 00 63 6f          	add    BYTE PTR gs:[ebx+0x6f],ah
 1dd:	6d                   	ins    DWORD PTR es:[edi],dx
 1de:	6d                   	ins    DWORD PTR es:[edi],dx
 1df:	61                   	popa   
 1e0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1e1:	64                   	fs
 1e2:	5f                   	pop    edi
 1e3:	66                   	data16
 1e4:	75 6e                	jne    254 <cmdClearScreen-0x30ffdac>
 1e6:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 1ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1eb:	5f                   	pop    edi
 1ec:	70 00                	jo     1ee <cmdClearScreen-0x30ffe12>
 1ee:	70 61                	jo     251 <cmdClearScreen-0x30ffdaf>
 1f0:	64 31 00             	xor    DWORD PTR fs:[eax],eax
 1f3:	70 61                	jo     256 <cmdClearScreen-0x30ffdaa>
 1f5:	64 32 00             	xor    al,BYTE PTR fs:[eax]
 1f8:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
 1fb:	6c                   	ins    BYTE PTR es:[edi],dx
 1fc:	64                   	fs
 1fd:	50                   	push   eax
 1fe:	69 64 00 62 61 63 6b 	imul   esp,DWORD PTR [eax+eax*1+0x62],0x676b6361
 205:	67 
 206:	72 6f                	jb     277 <cmdClearScreen-0x30ffd89>
 208:	75 6e                	jne    278 <cmdClearScreen-0x30ffd88>
 20a:	64 00 53 49          	add    BYTE PTR fs:[ebx+0x49],dl
 20e:	47                   	inc    edi
 20f:	53                   	push   ebx
 210:	4c                   	dec    esp
 211:	45                   	inc    ebp
 212:	45                   	inc    ebp
 213:	50                   	push   eax
 214:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 217:	61                   	popa   
 218:	70 43                	jo     25d <cmdClearScreen-0x30ffda3>
 21a:	75 72                	jne    28e <cmdClearScreen-0x30ffd72>
 21c:	72 00                	jb     21e <cmdClearScreen-0x30ffde2>
 21e:	73 74                	jae    294 <cmdClearScreen-0x30ffd6c>
 220:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 222:	75 74                	jne    298 <cmdClearScreen-0x30ffd68>
 224:	52                   	push   edx
 225:	65 64 69 72 00 73 45 	gs imul esi,DWORD PTR fs:gs:[edx+0x0],0x65784573
 22c:	78 65 
 22e:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 231:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 238:	72 61                	jb     29b <cmdClearScreen-0x30ffd65>
 23a:	6d                   	ins    DWORD PTR es:[edi],dx
 23b:	00 64 65 6c          	add    BYTE PTR [ebp+eiz*2+0x6c],ah
 23f:	69 6d 00 6e 65 77 43 	imul   ebp,DWORD PTR [ebp+0x0],0x4377656e
 246:	6d                   	ins    DWORD PTR es:[edi],dx
 247:	64                   	fs
 248:	4c                   	dec    esp
 249:	69 6e 65 00 63 6d 64 	imul   ebp,DWORD PTR [esi+0x65],0x646d6300
 250:	52                   	push   edx
 251:	65                   	gs
 252:	70 65                	jo     2b9 <cmdClearScreen-0x30ffd47>
 254:	61                   	popa   
 255:	74 00                	je     257 <cmdClearScreen-0x30ffda9>
 257:	70 61                	jo     2ba <cmdClearScreen-0x30ffd46>
 259:	72 61                	jb     2bc <cmdClearScreen-0x30ffd44>
 25b:	6d                   	ins    DWORD PTR es:[edi],dx
 25c:	73 00                	jae    25e <cmdClearScreen-0x30ffda2>
 25e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 25f:	61                   	popa   
 260:	6d                   	ins    DWORD PTR es:[edi],dx
 261:	65 00 66 6f          	add    BYTE PTR gs:[esi+0x6f],ah
 265:	72 6b                	jb     2d2 <cmdClearScreen-0x30ffd2e>
 267:	50                   	push   eax
 268:	69 64 00 73 74 5f 6c 	imul   esp,DWORD PTR [eax+eax*1+0x73],0x616c5f74
 26f:	61 
 270:	73 74                	jae    2e6 <cmdClearScreen-0x30ffd1a>
 272:	6d                   	ins    DWORD PTR es:[edi],dx
 273:	6f                   	outs   dx,DWORD PTR ds:[esi]
 274:	64 00 75 6e          	add    BYTE PTR fs:[ebp+0x6e],dh
 278:	73 69                	jae    2e3 <cmdClearScreen-0x30ffd1d>
 27a:	67 6e                	outs   dx,BYTE PTR ds:[si]
 27c:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 281:	61                   	popa   
 282:	72 00                	jb     284 <cmdClearScreen-0x30ffd7c>
 284:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 287:	48                   	dec    eax
 288:	65                   	gs
 289:	6c                   	ins    BYTE PTR es:[edi],dx
 28a:	70 00                	jo     28c <cmdClearScreen-0x30ffd74>
 28c:	6c                   	ins    BYTE PTR es:[edi],dx
 28d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 28e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 28f:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 293:	6e                   	outs   dx,BYTE PTR ds:[esi]
 294:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 298:	73 69                	jae    303 <cmdClearScreen-0x30ffcfd>
 29a:	67 6e                	outs   dx,BYTE PTR ds:[si]
 29c:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 2a1:	74 00                	je     2a3 <cmdClearScreen-0x30ffd5d>
 2a3:	65                   	gs
 2a4:	66 61                	popaw  
 2a6:	6d                   	ins    DWORD PTR es:[edi],dx
 2a7:	69 6c 79 00 75 69 6e 	imul   ebp,DWORD PTR [ecx+edi*2+0x0],0x746e6975
 2ae:	74 
 2af:	33 32                	xor    esi,DWORD PTR [edx]
 2b1:	5f                   	pop    edi
 2b2:	74 00                	je     2b4 <cmdClearScreen-0x30ffd4c>
 2b4:	6c                   	ins    BYTE PTR es:[edi],dx
 2b5:	61                   	popa   
 2b6:	73 74                	jae    32c <cmdClearScreen-0x30ffcd4>
 2b8:	45                   	inc    ebp
 2b9:	78 65                	js     320 <cmdClearScreen-0x30ffce0>
 2bb:	63 45 78             	arpl   WORD PTR [ebp+0x78],ax
 2be:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x70006564
 2c5:	70 
 2c6:	72 6f                	jb     337 <cmdClearScreen-0x30ffcc9>
 2c8:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 2cb:	73 45                	jae    312 <cmdClearScreen-0x30ffcee>
 2cd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2ce:	76 70                	jbe    340 <cmdClearScreen-0x30ffcc0>
 2d0:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 2d3:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 2d5:	75 74                	jne    34b <cmdClearScreen-0x30ffcb5>
 2d7:	66 69 6c 65 00 65 78 	imul   bp,WORD PTR [ebp+eiz*2+0x0],0x7865
 2de:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x66006564
 2e5:	66 
 2e6:	69 6c 65 54 6f 45 78 	imul   ebp,DWORD PTR [ebp+eiz*2+0x54],0x6578456f
 2ed:	65 
 2ee:	63 00                	arpl   WORD PTR [eax],ax
 2f0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2f1:	61                   	popa   
 2f2:	6d                   	ins    DWORD PTR es:[edi],dx
 2f3:	65                   	gs
 2f4:	4c                   	dec    esp
 2f5:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2f7:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 2fa:	61                   	popa   
 2fb:	72 74                	jb     371 <cmdClearScreen-0x30ffc8f>
 2fd:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
 300:	6f                   	outs   dx,DWORD PTR ds:[esi]
 301:	72 74                	jb     377 <cmdClearScreen-0x30ffc89>
 303:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 306:	73 69                	jae    371 <cmdClearScreen-0x30ffc8f>
 308:	67 6e                	outs   dx,BYTE PTR ds:[si]
 30a:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 30f:	74 00                	je     311 <cmdClearScreen-0x30ffcef>
 311:	73 74                	jae    387 <cmdClearScreen-0x30ffc79>
 313:	64                   	fs
 314:	65                   	gs
 315:	72 72                	jb     389 <cmdClearScreen-0x30ffc77>
 317:	70 69                	jo     382 <cmdClearScreen-0x30ffc7e>
 319:	70 65                	jo     380 <cmdClearScreen-0x30ffc80>
 31b:	00 65 6d             	add    BYTE PTR [ebp+0x6d],ah
 31e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31f:	64                   	fs
 320:	65                   	gs
 321:	6c                   	ins    BYTE PTR es:[edi],dx
 322:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 325:	64                   	fs
 326:	53                   	push   ebx
 327:	65                   	gs
 328:	74 45                	je     36f <cmdClearScreen-0x30ffc91>
 32a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 32b:	76 00                	jbe    32d <cmdClearScreen-0x30ffcd3>
 32d:	53                   	push   ebx
 32e:	49                   	dec    ecx
 32f:	47                   	inc    edi
 330:	49                   	dec    ecx
 331:	4f                   	dec    edi
 332:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 335:	64                   	fs
 336:	54                   	push   esp
 337:	69 63 6b 73 00 63 6d 	imul   esp,DWORD PTR [ebx+0x6b],0x6d630073
 33e:	64                   	fs
 33f:	54                   	push   esp
 340:	69 6d 65 00 5f 42 6f 	imul   ebp,DWORD PTR [ebp+0x65],0x6f425f00
 347:	6f                   	outs   dx,DWORD PTR ds:[esi]
 348:	6c                   	ins    BYTE PTR es:[edi],dx
 349:	00 53 49             	add    BYTE PTR [ebx+0x49],dl
 34c:	47                   	inc    edi
 34d:	48                   	dec    eax
 34e:	41                   	inc    ecx
 34f:	4c                   	dec    esp
 350:	54                   	push   esp
 351:	00 74 65 73          	add    BYTE PTR [ebp+eiz*2+0x73],dh
 355:	74 00                	je     357 <cmdClearScreen-0x30ffca9>
 357:	66 69 6c 65 73 54 6f 	imul   bp,WORD PTR [ebp+eiz*2+0x73],0x6f54
 35e:	43                   	inc    ebx
 35f:	6c                   	ins    BYTE PTR es:[edi],dx
 360:	6f                   	outs   dx,DWORD PTR ds:[esi]
 361:	73 65                	jae    3c8 <cmdClearScreen-0x30ffc38>
 363:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 366:	5f                   	pop    edi
 367:	73 69                	jae    3d2 <cmdClearScreen-0x30ffc2e>
 369:	7a 65                	jp     3d0 <cmdClearScreen-0x30ffc30>
 36b:	00 53 49             	add    BYTE PTR [ebx+0x49],dl
 36e:	47                   	inc    edi
 36f:	53                   	push   ebx
 370:	45                   	inc    ebp
 371:	47                   	inc    edi
 372:	56                   	push   esi
 373:	00 66 6f             	add    BYTE PTR [esi+0x6f],ah
 376:	75 6e                	jne    3e6 <cmdClearScreen-0x30ffc1a>
 378:	64 00 68 65          	add    BYTE PTR fs:[eax+0x65],ch
 37c:	61                   	popa   
 37d:	70 42                	jo     3c1 <cmdClearScreen-0x30ffc3f>
 37f:	61                   	popa   
 380:	73 65                	jae    3e7 <cmdClearScreen-0x30ffc19>
 382:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 385:	64 69 6e 66 69 6c 65 	imul   ebp,DWORD PTR fs:[esi+0x66],0x656c69
 38c:	00 
 38d:	70 61                	jo     3f0 <cmdClearScreen-0x30ffc10>
 38f:	74 68                	je     3f9 <cmdClearScreen-0x30ffc07>
 391:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 394:	75 69                	jne    3ff <cmdClearScreen-0x30ffc01>
 396:	64                   	fs
 397:	5f                   	pop    edi
 398:	65                   	gs
 399:	78 74                	js     40f <cmdClearScreen-0x30ffbf1>
 39b:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 39d:	64                   	fs
 39e:	65                   	gs
 39f:	64                   	fs
 3a0:	5f                   	pop    edi
 3a1:	66                   	data16
 3a2:	65                   	gs
 3a3:	61                   	popa   
 3a4:	74 75                	je     41b <cmdClearScreen-0x30ffbe5>
 3a6:	72 65                	jb     40d <cmdClearScreen-0x30ffbf3>
 3a8:	5f                   	pop    edi
 3a9:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
 3ac:	73 00                	jae    3ae <cmdClearScreen-0x30ffc52>
 3ae:	70 72                	jo     422 <cmdClearScreen-0x30ffbde>
 3b0:	65                   	gs
 3b1:	66                   	data16
 3b2:	65                   	gs
 3b3:	74 63                	je     418 <cmdClearScreen-0x30ffbe8>
 3b5:	68 77 74 31 00       	push   0x317477
 3ba:	6c                   	ins    BYTE PTR es:[edi],dx
 3bb:	69 62 63 54 5a 00 61 	imul   esp,DWORD PTR [edx+0x63],0x61005a54
 3c2:	76 78                	jbe    43c <cmdClearScreen-0x30ffbc4>
 3c4:	35 31 32 76 62       	xor    eax,0x62763231
 3c9:	6d                   	ins    DWORD PTR es:[edi],dx
 3ca:	69 00 73 74 64 69    	imul   eax,DWORD PTR [eax],0x69647473
 3d0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3d1:	70 69                	jo     43c <cmdClearScreen-0x30ffbc4>
 3d3:	70 65                	jo     43a <cmdClearScreen-0x30ffbc6>
 3d5:	00 76 61             	add    BYTE PTR [esi+0x61],dh
 3d8:	6c                   	ins    BYTE PTR es:[edi],dx
 3d9:	75 65                	jne    440 <cmdClearScreen-0x30ffbc0>
 3db:	4c                   	dec    esp
 3dc:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3de:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 3e1:	6c                   	ins    BYTE PTR es:[edi],dx
 3e2:	65                   	gs
 3e3:	73 54                	jae    439 <cmdClearScreen-0x30ffbc7>
 3e5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3e6:	43                   	inc    ebx
 3e7:	6c                   	ins    BYTE PTR es:[edi],dx
 3e8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3e9:	73 65                	jae    450 <cmdClearScreen-0x30ffbb0>
 3eb:	43                   	inc    ebx
 3ec:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3ed:	75 6e                	jne    45d <cmdClearScreen-0x30ffba3>
 3ef:	74 00                	je     3f1 <cmdClearScreen-0x30ffc0f>
 3f1:	63 70 75             	arpl   WORD PTR [eax+0x75],si
 3f4:	69 64 5f 70 72 6f 63 	imul   esp,DWORD PTR [edi+ebx*2+0x70],0x69636f72
 3fb:	69 
 3fc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3fd:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3ff:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 402:	73 65                	jae    469 <cmdClearScreen-0x30ffb97>
 404:	72 76                	jb     47c <cmdClearScreen-0x30ffb84>
 406:	65 64 00 53 49       	gs add BYTE PTR fs:gs:[ebx+0x49],dl
 40b:	47                   	inc    edi
 40c:	49                   	dec    ecx
 40d:	4e                   	dec    esi
 40e:	54                   	push   esp
 40f:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 412:	64                   	fs
 413:	65                   	gs
 414:	72 72                	jb     488 <cmdClearScreen-0x30ffb78>
 416:	66 69 6c 65 00 73 74 	imul   bp,WORD PTR [ebp+eiz*2+0x0],0x7473
 41d:	65                   	gs
 41e:	70 00                	jo     420 <cmdClearScreen-0x30ffbe0>
 420:	6b 65 78 65          	imul   esp,DWORD PTR [ebp+0x78],0x65
 424:	63 32                	arpl   WORD PTR [edx],si
 426:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 429:	6d                   	ins    DWORD PTR es:[edi],dx
 42a:	6d                   	ins    DWORD PTR es:[edi],dx
 42b:	61                   	popa   
 42c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 42d:	64                   	fs
 42e:	5f                   	pop    edi
 42f:	74 61                	je     492 <cmdClearScreen-0x30ffb6e>
 431:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 435:	74 00                	je     437 <cmdClearScreen-0x30ffbc9>
 437:	70 72                	jo     4ab <cmdClearScreen-0x30ffb55>
 439:	6f                   	outs   dx,DWORD PTR ds:[esi]
 43a:	6d                   	ins    DWORD PTR es:[edi],dx
 43b:	70 74                	jo     4b1 <cmdClearScreen-0x30ffb4f>
 43d:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 440:	72 67                	jb     4a9 <cmdClearScreen-0x30ffb57>
 442:	76 00                	jbe    444 <cmdClearScreen-0x30ffbbc>
 444:	6c                   	ins    BYTE PTR es:[edi],dx
 445:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 448:	73 00                	jae    44a <cmdClearScreen-0x30ffbb6>
 44a:	67                   	addr16
 44b:	65                   	gs
 44c:	74 41                	je     48f <cmdClearScreen-0x30ffb71>
 44e:	4b                   	dec    ebx
 44f:	65                   	gs
 450:	79 00                	jns    452 <cmdClearScreen-0x30ffbae>
 452:	70 61                	jo     4b5 <cmdClearScreen-0x30ffb4b>
 454:	72 73                	jb     4c9 <cmdClearScreen-0x30ffb37>
 456:	65                   	gs
 457:	64                   	fs
 458:	43                   	inc    ebx
 459:	68 61 72 73 00       	push   0x737261
 45e:	73 72                	jae    4d2 <cmdClearScreen-0x30ffb2e>
 460:	63 2f                	arpl   WORD PTR [edi],bp
 462:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 466:	6c                   	ins    BYTE PTR es:[edi],dx
 467:	6c                   	ins    BYTE PTR es:[edi],dx
 468:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 46b:	74 65                	je     4d2 <cmdClearScreen-0x30ffb2e>
 46d:	6d                   	ins    DWORD PTR es:[edi],dx
 46e:	70 00                	jo     470 <cmdClearScreen-0x30ffb90>
 470:	64                   	fs
 471:	71 75                	jno    4e8 <cmdClearScreen-0x30ffb18>
 473:	6f                   	outs   dx,DWORD PTR ds:[esi]
 474:	74 65                	je     4db <cmdClearScreen-0x30ffb25>
 476:	00 6c 52 65          	add    BYTE PTR [edx+edx*2+0x65],ch
 47a:	74 56                	je     4d2 <cmdClearScreen-0x30ffb2e>
 47c:	61                   	popa   
 47d:	6c                   	ins    BYTE PTR es:[edi],dx
 47e:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 481:	76 70                	jbe    4f3 <cmdClearScreen-0x30ffb0d>
 483:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
 487:	72 72                	jb     4fb <cmdClearScreen-0x30ffb05>
 489:	4b                   	dec    ebx
 48a:	65                   	gs
 48b:	79 00                	jns    48d <cmdClearScreen-0x30ffb73>
 48d:	67                   	addr16
 48e:	65                   	gs
 48f:	74 45                	je     4d6 <cmdClearScreen-0x30ffb2a>
 491:	6e                   	outs   dx,BYTE PTR ds:[esi]
 492:	76 56                	jbe    4ea <cmdClearScreen-0x30ffb16>
 494:	61                   	popa   
 495:	72 69                	jb     500 <cmdClearScreen-0x30ffb00>
 497:	61                   	popa   
 498:	62 6c 65 56          	bound  ebp,QWORD PTR [ebp+eiz*2+0x56]
 49c:	61                   	popa   
 49d:	6c                   	ins    BYTE PTR es:[edi],dx
 49e:	75 65                	jne    505 <cmdClearScreen-0x30ffafb>
 4a0:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 4a3:	64                   	fs
 4a4:	70 74                	jo     51a <cmdClearScreen-0x30ffae6>
 4a6:	72 00                	jb     4a8 <cmdClearScreen-0x30ffb58>
 4a8:	67                   	addr16
 4a9:	65                   	gs
 4aa:	74 41                	je     4ed <cmdClearScreen-0x30ffb13>
 4ac:	43                   	inc    ebx
 4ad:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4ae:	6d                   	ins    DWORD PTR es:[edi],dx
 4af:	6d                   	ins    DWORD PTR es:[edi],dx
 4b0:	61                   	popa   
 4b1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4b2:	64 00 76 61          	add    BYTE PTR fs:[esi+0x61],dh
 4b6:	6c                   	ins    BYTE PTR es:[edi],dx
 4b7:	75 65                	jne    51e <cmdClearScreen-0x30ffae2>
 4b9:	00 62 75             	add    BYTE PTR [edx+0x75],ah
 4bc:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 4c3:	00 
 4c4:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 4c7:	4c                   	dec    esp
 4c8:	69 6e 65 00 70 61 72 	imul   ebp,DWORD PTR [esi+0x65],0x72617000
 4cf:	73 65                	jae    536 <cmdClearScreen-0x30ffaca>
 4d1:	43                   	inc    ebx
 4d2:	6d                   	ins    DWORD PTR es:[edi],dx
 4d3:	64                   	fs
 4d4:	73 00                	jae    4d6 <cmdClearScreen-0x30ffb2a>
 4d6:	70 70                	jo     548 <cmdClearScreen-0x30ffab8>
 4d8:	74 72                	je     54c <cmdClearScreen-0x30ffab4>
 4da:	00 68 61             	add    BYTE PTR [eax+0x61],ch
 4dd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4de:	64                   	fs
 4df:	6c                   	ins    BYTE PTR es:[edi],dx
 4e0:	65                   	gs
 4e1:	53                   	push   ebx
 4e2:	69 67 6e 61 6c 73 00 	imul   esp,DWORD PTR [edi+0x6e],0x736c61
 4e9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4ea:	65                   	gs
 4eb:	65                   	gs
 4ec:	64                   	fs
 4ed:	44                   	inc    esp
 4ee:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4ef:	75 62                	jne    553 <cmdClearScreen-0x30ffaad>
 4f1:	6c                   	ins    BYTE PTR es:[edi],dx
 4f2:	65                   	gs
 4f3:	51                   	push   ecx
 4f4:	75 6f                	jne    565 <cmdClearScreen-0x30ffa9b>
 4f6:	74 65                	je     55d <cmdClearScreen-0x30ffaa3>
 4f8:	74 6f                	je     569 <cmdClearScreen-0x30ffa97>
 4fa:	45                   	inc    ebp
 4fb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4fc:	64                   	fs
 4fd:	50                   	push   eax
 4fe:	61                   	popa   
 4ff:	72 61                	jb     562 <cmdClearScreen-0x30ffa9e>
 501:	6d                   	ins    DWORD PTR es:[edi],dx
 502:	00 62 73             	add    BYTE PTR [edx+0x73],ah
 505:	71 75                	jno    57c <cmdClearScreen-0x30ffa84>
 507:	6f                   	outs   dx,DWORD PTR ds:[esi]
 508:	74 65                	je     56f <cmdClearScreen-0x30ffa91>
 50a:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 50d:	65 63 43 6d          	arpl   WORD PTR gs:[ebx+0x6d],ax
 511:	64                   	fs
 512:	73 00                	jae    514 <cmdClearScreen-0x30ffaec>
 514:	6b 43 6d 64          	imul   eax,DWORD PTR [ebx+0x6d],0x64
 518:	6c                   	ins    BYTE PTR es:[edi],dx
 519:	69 6e 65 00 6c 63 6f 	imul   ebp,DWORD PTR [esi+0x65],0x6f636c00
 520:	6d                   	ins    DWORD PTR es:[edi],dx
 521:	6d                   	ins    DWORD PTR es:[edi],dx
 522:	61                   	popa   
 523:	6e                   	outs   dx,BYTE PTR ds:[esi]
 524:	64 00 66 69          	add    BYTE PTR fs:[esi+0x69],ah
 528:	6e                   	outs   dx,BYTE PTR ds:[esi]
 529:	64                   	fs
 52a:	43                   	inc    ebx
 52b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 52c:	6d                   	ins    DWORD PTR es:[edi],dx
 52d:	6d                   	ins    DWORD PTR es:[edi],dx
 52e:	61                   	popa   
 52f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 530:	64 00 65 78          	add    BYTE PTR fs:[ebp+0x78],ah
 534:	65 63 49 6e          	arpl   WORD PTR gs:[ecx+0x6e],cx
 538:	74 65                	je     59f <cmdClearScreen-0x30ffa61>
 53a:	72 6e                	jb     5aa <cmdClearScreen-0x30ffa56>
 53c:	61                   	popa   
 53d:	6c                   	ins    BYTE PTR es:[edi],dx
 53e:	43                   	inc    ebx
 53f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 540:	6d                   	ins    DWORD PTR es:[edi],dx
 541:	6d                   	ins    DWORD PTR es:[edi],dx
 542:	61                   	popa   
 543:	6e                   	outs   dx,BYTE PTR ds:[esi]
 544:	64 00 70 72          	add    BYTE PTR fs:[eax+0x72],dh
 548:	65                   	gs
 549:	70 72                	jo     5bd <cmdClearScreen-0x30ffa43>
 54b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 54c:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 54f:	73 43                	jae    594 <cmdClearScreen-0x30ffa6c>
 551:	6d                   	ins    DWORD PTR es:[edi],dx
 552:	64 00 70 72          	add    BYTE PTR fs:[eax+0x72],dh
 556:	6f                   	outs   dx,DWORD PTR ds:[esi]
 557:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 55a:	73 53                	jae    5af <cmdClearScreen-0x30ffa51>
 55c:	69 67 6e 61 6c 00 63 	imul   esp,DWORD PTR [edi+0x6e],0x63006c61
 563:	6f                   	outs   dx,DWORD PTR ds:[esi]
 564:	70 79                	jo     5df <cmdClearScreen-0x30ffa21>
 566:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 569:	00 65 76             	add    BYTE PTR [ebp+0x76],ah
 56c:	4e                   	dec    esi
 56d:	61                   	popa   
 56e:	6d                   	ins    DWORD PTR es:[edi],dx
 56f:	65 00 63 6f          	add    BYTE PTR gs:[ebx+0x6f],ah
 573:	6d                   	ins    DWORD PTR es:[edi],dx
 574:	6d                   	ins    DWORD PTR es:[edi],dx
 575:	61                   	popa   
 576:	6e                   	outs   dx,BYTE PTR ds:[esi]
 577:	64                   	fs
 578:	48                   	dec    eax
 579:	69 73 74 6f 72 79 50 	imul   esi,DWORD PTR [ebx+0x74],0x5079726f
 580:	74 72                	je     5f4 <cmdClearScreen-0x30ffa0c>
 582:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 585:	70 75                	jo     5fc <cmdClearScreen-0x30ffa04>
 587:	74 00                	je     589 <cmdClearScreen-0x30ffa77>
 589:	73 69                	jae    5f4 <cmdClearScreen-0x30ffa0c>
 58b:	67 6e                	outs   dx,BYTE PTR ds:[si]
 58d:	61                   	popa   
 58e:	6c                   	ins    BYTE PTR es:[edi],dx
 58f:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 592:	65                   	gs
 593:	65                   	gs
 594:	41                   	inc    ecx
 595:	72 67                	jb     5fe <cmdClearScreen-0x30ffa02>
 597:	56                   	push   esi
 598:	00 61 6e             	add    BYTE PTR [ecx+0x6e],ah
 59b:	73 69                	jae    606 <cmdClearScreen-0x30ff9fa>
 59d:	53                   	push   ebx
 59e:	65                   	gs
 59f:	71 00                	jno    5a1 <cmdClearScreen-0x30ffa5f>
 5a1:	73 61                	jae    604 <cmdClearScreen-0x30ff9fc>
 5a3:	76 65                	jbe    60a <cmdClearScreen-0x30ff9f6>
 5a5:	43                   	inc    ebx
 5a6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5a7:	6d                   	ins    DWORD PTR es:[edi],dx
 5a8:	6d                   	ins    DWORD PTR es:[edi],dx
 5a9:	61                   	popa   
 5aa:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5ab:	64 00 70 61          	add    BYTE PTR fs:[eax+0x61],dh
 5af:	72 61                	jb     612 <cmdClearScreen-0x30ff9ee>
 5b1:	6d                   	ins    DWORD PTR es:[edi],dx
 5b2:	73 54                	jae    608 <cmdClearScreen-0x30ff9f8>
 5b4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5b5:	41                   	inc    ecx
 5b6:	72 67                	jb     61f <cmdClearScreen-0x30ff9e1>
 5b8:	76 00                	jbe    5ba <cmdClearScreen-0x30ffa46>
 5ba:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 5bd:	6d                   	ins    DWORD PTR es:[edi],dx
 5be:	61                   	popa   
 5bf:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5c0:	64                   	fs
 5c1:	48                   	dec    eax
 5c2:	69 73 74 6f 72 79 4d 	imul   esi,DWORD PTR [ebx+0x74],0x4d79726f
 5c9:	61                   	popa   
 5ca:	78 00                	js     5cc <cmdClearScreen-0x30ffa34>
 5cc:	6d                   	ins    DWORD PTR es:[edi],dx
 5cd:	61                   	popa   
 5ce:	78 61                	js     631 <cmdClearScreen-0x30ff9cf>
 5d0:	72 67                	jb     639 <cmdClearScreen-0x30ff9c7>
 5d2:	63 00                	arpl   WORD PTR [eax],ax
 5d4:	64                   	fs
 5d5:	65                   	gs
 5d6:	6c                   	ins    BYTE PTR es:[edi],dx
 5d7:	69 6d 73 00 63 6f 6d 	imul   ebp,DWORD PTR [ebp+0x73],0x6d6f6300
 5de:	6d                   	ins    DWORD PTR es:[edi],dx
 5df:	61                   	popa   
 5e0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5e1:	64                   	fs
 5e2:	57                   	push   edi
 5e3:	61                   	popa   
 5e4:	73 46                	jae    62c <cmdClearScreen-0x30ff9d4>
 5e6:	72 6f                	jb     657 <cmdClearScreen-0x30ff9a9>
 5e8:	6d                   	ins    DWORD PTR es:[edi],dx
 5e9:	54                   	push   esp
 5ea:	68 69 73 42 75       	push   0x75427369
 5ef:	66                   	data16
 5f0:	66                   	data16
 5f1:	65                   	gs
 5f2:	72 50                	jb     644 <cmdClearScreen-0x30ff9bc>
 5f4:	74 72                	je     668 <cmdClearScreen-0x30ff998>
 5f6:	00 70 63             	add    BYTE PTR [eax+0x63],dh
 5f9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5fa:	75 6e                	jne    66a <cmdClearScreen-0x30ff996>
 5fc:	74 00                	je     5fe <cmdClearScreen-0x30ffa02>
 5fe:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 600:	6e                   	outs   dx,BYTE PTR ds:[esi]
 601:	65                   	gs
 602:	47                   	inc    edi
 603:	65                   	gs
 604:	74 74                	je     67a <cmdClearScreen-0x30ff986>
 606:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
 60d:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
 611:	72 72                	jb     685 <cmdClearScreen-0x30ff97b>
 613:	4b                   	dec    ebx
 614:	65                   	gs
 615:	79 43                	jns    65a <cmdClearScreen-0x30ff9a6>
 617:	6f                   	outs   dx,DWORD PTR ds:[esi]
 618:	75 6e                	jne    688 <cmdClearScreen-0x30ff978>
 61a:	74 00                	je     61c <cmdClearScreen-0x30ff9e4>
 61c:	72 65                	jb     683 <cmdClearScreen-0x30ff97d>
 61e:	70 72                	jo     692 <cmdClearScreen-0x30ff96e>
 620:	69 6e 74 43 6f 6d 6d 	imul   ebp,DWORD PTR [esi+0x74],0x6d6d6f43
 627:	61                   	popa   
 628:	6e                   	outs   dx,BYTE PTR ds:[esi]
 629:	64 00 70 61          	add    BYTE PTR fs:[eax+0x61],dh
 62d:	72 73                	jb     6a2 <cmdClearScreen-0x30ff95e>
 62f:	65                   	gs
 630:	50                   	push   eax
 631:	61                   	popa   
 632:	72 61                	jb     695 <cmdClearScreen-0x30ff96b>
 634:	6d                   	ins    DWORD PTR es:[edi],dx
 635:	73 53                	jae    68a <cmdClearScreen-0x30ff976>
 637:	68 65 6c 6c 00       	push   0x6c6c65
 63c:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 63f:	6d                   	ins    DWORD PTR es:[edi],dx
 640:	61                   	popa   
 641:	6e                   	outs   dx,BYTE PTR ds:[esi]
 642:	64                   	fs
 643:	48                   	dec    eax
 644:	69 73 74 6f 72 79 00 	imul   esi,DWORD PTR [ebx+0x74],0x79726f
 64b:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 64f:	6c                   	ins    BYTE PTR es:[edi],dx
 650:	6c                   	ins    BYTE PTR es:[edi],dx
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
