
Debug/GNU-Linux/kshell:     file format elf32-i386


Disassembly of section .text:

03100000 <cmdPrintEnv>:
cmdPrintEnv():
/home/yogi/src/os/aproj/kshell/src/commands.c:11


#include "kshell.h"

void cmdPrintEnv()
{
 3100000:	55                   	push   ebp
 3100001:	89 e5                	mov    ebp,esp
 3100003:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:12
    for (int cnt=0;cnt<100;cnt++)
 3100006:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310000d:	eb 37                	jmp    3100046 <cmdPrintEnv+0x46>
/home/yogi/src/os/aproj/kshell/src/commands.c:14
    {
        if (environmentLoc[cnt]!=0)
 310000f:	a1 08 20 10 03       	mov    eax,ds:0x3102008
 3100014:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100017:	c1 e2 02             	shl    edx,0x2
 310001a:	01 d0                	add    eax,edx
 310001c:	8b 00                	mov    eax,DWORD PTR [eax]
 310001e:	85 c0                	test   eax,eax
 3100020:	74 20                	je     3100042 <cmdPrintEnv+0x42>
/home/yogi/src/os/aproj/kshell/src/commands.c:16
        {
            print("%s\n",environmentLoc[cnt]);
 3100022:	a1 08 20 10 03       	mov    eax,ds:0x3102008
 3100027:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 310002a:	c1 e2 02             	shl    edx,0x2
 310002d:	01 d0                	add    eax,edx
 310002f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100031:	83 ec 08             	sub    esp,0x8
 3100034:	50                   	push   eax
 3100035:	68 ad 13 10 03       	push   0x31013ad
 310003a:	e8 c1 10 00 00       	call   3101100 <kShell+0x3a0>
 310003f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:12 (discriminator 2)

#include "kshell.h"

void cmdPrintEnv()
{
    for (int cnt=0;cnt<100;cnt++)
 3100042:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:12 (discriminator 1)
 3100046:	83 7d f4 63          	cmp    DWORD PTR [ebp-0xc],0x63
 310004a:	7e c3                	jle    310000f <cmdPrintEnv+0xf>
/home/yogi/src/os/aproj/kshell/src/commands.c:20
        {
            print("%s\n",environmentLoc[cnt]);
        }
    }
   
}
 310004c:	90                   	nop
 310004d:	c9                   	leave  
 310004e:	c3                   	ret    

0310004f <cmdSetEnv>:
cmdSetEnv():
/home/yogi/src/os/aproj/kshell/src/commands.c:23

void cmdSetEnv(char* cmdline)
{
 310004f:	55                   	push   ebp
 3100050:	89 e5                	mov    ebp,esp
 3100052:	81 ec 28 05 00 00    	sub    esp,0x528
/home/yogi/src/os/aproj/kshell/src/commands.c:27
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    char *varName, *varValue;
    
    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 3100058:	83 ec 04             	sub    esp,0x4
 310005b:	68 00 05 00 00       	push   0x500
 3100060:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 3100066:	50                   	push   eax
 3100067:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310006a:	e8 9b 06 00 00       	call   310070a <parseParamsShell>
 310006f:	83 c4 10             	add    esp,0x10
 3100072:	85 c0                	test   eax,eax
 3100074:	0f 84 2b 01 00 00    	je     31001a5 <cmdSetEnv+0x156>
/home/yogi/src/os/aproj/kshell/src/commands.c:29
    {
        int nameLen=0, valueLen=0;
 310007a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100081:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:30
        int found=(uintptr_t)strstr(params[0],"=");
 3100088:	83 ec 08             	sub    esp,0x8
 310008b:	68 b1 13 10 03       	push   0x31013b1
 3100090:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 3100096:	50                   	push   eax
 3100097:	e8 34 11 00 00       	call   31011d0 <kShell+0x470>
 310009c:	83 c4 10             	add    esp,0x10
 310009f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:31
        if (found==0)
 31000a2:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31000a6:	75 15                	jne    31000bd <cmdSetEnv+0x6e>
/home/yogi/src/os/aproj/kshell/src/commands.c:33
        {
            print("Usage: set variable=value\n");
 31000a8:	83 ec 0c             	sub    esp,0xc
 31000ab:	68 b3 13 10 03       	push   0x31013b3
 31000b0:	e8 4b 10 00 00       	call   3101100 <kShell+0x3a0>
 31000b5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:34
            return;
 31000b8:	e9 ed 00 00 00       	jmp    31001aa <cmdSetEnv+0x15b>
/home/yogi/src/os/aproj/kshell/src/commands.c:36
        }
        nameLen=found-(uintptr_t)params[0];
 31000bd:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 31000c0:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000c6:	29 c2                	sub    edx,eax
 31000c8:	89 d0                	mov    eax,edx
 31000ca:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:37
        valueLen=strlen(params[0])-nameLen-1;
 31000cd:	83 ec 0c             	sub    esp,0xc
 31000d0:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000d6:	50                   	push   eax
 31000d7:	e8 a4 11 00 00       	call   3101280 <kShell+0x520>
 31000dc:	83 c4 10             	add    esp,0x10
 31000df:	89 c2                	mov    edx,eax
 31000e1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31000e4:	29 c2                	sub    edx,eax
 31000e6:	89 d0                	mov    eax,edx
 31000e8:	83 e8 01             	sub    eax,0x1
 31000eb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:38
        varName = malloc(nameLen+1);
 31000ee:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31000f1:	83 c0 01             	add    eax,0x1
 31000f4:	83 ec 0c             	sub    esp,0xc
 31000f7:	50                   	push   eax
 31000f8:	e8 63 10 00 00       	call   3101160 <kShell+0x400>
 31000fd:	83 c4 10             	add    esp,0x10
 3100100:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:39
        varValue = malloc(valueLen);
 3100103:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100106:	83 ec 0c             	sub    esp,0xc
 3100109:	50                   	push   eax
 310010a:	e8 51 10 00 00       	call   3101160 <kShell+0x400>
 310010f:	83 c4 10             	add    esp,0x10
 3100112:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:40
        strncpy(varName,params[0],nameLen);
 3100115:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100118:	83 ec 04             	sub    esp,0x4
 310011b:	50                   	push   eax
 310011c:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 3100122:	50                   	push   eax
 3100123:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100126:	e8 d5 10 00 00       	call   3101200 <kShell+0x4a0>
 310012b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:41
        varName[nameLen]=0;
 310012e:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100131:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 3100134:	01 d0                	add    eax,edx
 3100136:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:42
        strncpy(varValue,params[0]+nameLen+1,valueLen);
 3100139:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310013c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 310013f:	8d 4a 01             	lea    ecx,[edx+0x1]
 3100142:	8d 95 e4 fa ff ff    	lea    edx,[ebp-0x51c]
 3100148:	01 ca                	add    edx,ecx
 310014a:	83 ec 04             	sub    esp,0x4
 310014d:	50                   	push   eax
 310014e:	52                   	push   edx
 310014f:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100152:	e8 a9 10 00 00       	call   3101200 <kShell+0x4a0>
 3100157:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:43
        strtrim(varName);
 310015a:	83 ec 0c             	sub    esp,0xc
 310015d:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100160:	e8 eb 10 00 00       	call   3101250 <kShell+0x4f0>
 3100165:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:44
        strtrim(varValue);
 3100168:	83 ec 0c             	sub    esp,0xc
 310016b:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 310016e:	e8 dd 10 00 00       	call   3101250 <kShell+0x4f0>
 3100173:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:45
        setenv(varName, varValue);
 3100176:	83 ec 08             	sub    esp,0x8
 3100179:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 310017c:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 310017f:	e8 8c 10 00 00       	call   3101210 <kShell+0x4b0>
 3100184:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:46
        free(varName);
 3100187:	83 ec 0c             	sub    esp,0xc
 310018a:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 310018d:	e8 0e 11 00 00       	call   31012a0 <kShell+0x540>
 3100192:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:47
        free(varValue);
 3100195:	83 ec 0c             	sub    esp,0xc
 3100198:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 310019b:	e8 00 11 00 00       	call   31012a0 <kShell+0x540>
 31001a0:	83 c4 10             	add    esp,0x10
 31001a3:	eb 05                	jmp    31001aa <cmdSetEnv+0x15b>
/home/yogi/src/os/aproj/kshell/src/commands.c:50
    }
    else
        cmdPrintEnv();
 31001a5:	e8 56 fe ff ff       	call   3100000 <cmdPrintEnv>
/home/yogi/src/os/aproj/kshell/src/commands.c:51
}
 31001aa:	c9                   	leave  
 31001ab:	c3                   	ret    

031001ac <kexec>:
kexec():
/home/yogi/src/os/aproj/kshell/src/commands.c:54

int kexec(char* path, int argc, char** argv, bool background)
{
 31001ac:	55                   	push   ebp
 31001ad:	89 e5                	mov    ebp,esp
 31001af:	83 ec 28             	sub    esp,0x28
 31001b2:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 31001b5:	88 45 e4             	mov    BYTE PTR [ebp-0x1c],al
/home/yogi/src/os/aproj/kshell/src/commands.c:55
    int pid=execa(path,argc,argv);
 31001b8:	83 ec 04             	sub    esp,0x4
 31001bb:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 31001be:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31001c1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31001c4:	e8 c7 10 00 00       	call   3101290 <kShell+0x530>
 31001c9:	83 c4 10             	add    esp,0x10
 31001cc:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:57

    if (pid>0)
 31001cf:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31001d3:	7e 4c                	jle    3100221 <kexec+0x75>
/home/yogi/src/os/aproj/kshell/src/commands.c:59
    {
        if (!background)
 31001d5:	0f b6 45 e4          	movzx  eax,BYTE PTR [ebp-0x1c]
 31001d9:	83 f0 01             	xor    eax,0x1
 31001dc:	84 c0                	test   al,al
 31001de:	74 54                	je     3100234 <kexec+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:62
        {
            //print("DEBUG1: waitpid = %08X\n",&waitpid);
            lastExecExitCode = waitpid(pid);
 31001e0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001e3:	83 ec 0c             	sub    esp,0xc
 31001e6:	50                   	push   eax
 31001e7:	e8 04 0f 00 00       	call   31010f0 <kShell+0x390>
 31001ec:	83 c4 10             	add    esp,0x10
 31001ef:	a3 38 23 10 03       	mov    ds:0x3102338,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:64
            char ret[10];
            itoa(lastExecExitCode,ret);
 31001f4:	a1 38 23 10 03       	mov    eax,ds:0x3102338
 31001f9:	89 c2                	mov    edx,eax
 31001fb:	83 ec 08             	sub    esp,0x8
 31001fe:	8d 45 ea             	lea    eax,[ebp-0x16]
 3100201:	50                   	push   eax
 3100202:	52                   	push   edx
 3100203:	e8 98 0f 00 00       	call   31011a0 <kShell+0x440>
 3100208:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:65
            setenv("LASTEXIT",ret);
 310020b:	83 ec 08             	sub    esp,0x8
 310020e:	8d 45 ea             	lea    eax,[ebp-0x16]
 3100211:	50                   	push   eax
 3100212:	68 ce 13 10 03       	push   0x31013ce
 3100217:	e8 f4 0f 00 00       	call   3101210 <kShell+0x4b0>
 310021c:	83 c4 10             	add    esp,0x10
 310021f:	eb 13                	jmp    3100234 <kexec+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:69
        }
    }
    else
        print("Error executing %s\n",path);
 3100221:	83 ec 08             	sub    esp,0x8
 3100224:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100227:	68 d7 13 10 03       	push   0x31013d7
 310022c:	e8 cf 0e 00 00       	call   3101100 <kShell+0x3a0>
 3100231:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:71

}
 3100234:	90                   	nop
 3100235:	c9                   	leave  
 3100236:	c3                   	ret    

03100237 <execTime>:
execTime():
/home/yogi/src/os/aproj/kshell/src/commands.c:74

int execTime(char* cmdline, bool timeIt)
{
 3100237:	55                   	push   ebp
 3100238:	89 e5                	mov    ebp,esp
 310023a:	81 ec 58 05 00 00    	sub    esp,0x558
 3100240:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100243:	88 85 b4 fa ff ff    	mov    BYTE PTR [ebp-0x54c],al
/home/yogi/src/os/aproj/kshell/src/commands.c:75
    bool background=false;
 3100249:	c6 45 f3 00          	mov    BYTE PTR [ebp-0xd],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:76
    int forkPid=0;
 310024d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:78
    char* tok;
    char* pgm=NULL;
 3100254:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:81

    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 310025b:	83 ec 04             	sub    esp,0x4
 310025e:	68 00 05 00 00       	push   0x500
 3100263:	8d 85 cc fa ff ff    	lea    eax,[ebp-0x534]
 3100269:	50                   	push   eax
 310026a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310026d:	e8 98 04 00 00       	call   310070a <parseParamsShell>
 3100272:	83 c4 10             	add    esp,0x10
 3100275:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:82
    int execParamCount=0;
 3100278:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:83
    int pcount=1;
 310027f:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:87
    struct tm *startTime, *endTime;
    uint32_t startTicks, endTicks;
    
    if (paramCount==0)
 3100286:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310028a:	0f 84 55 01 00 00    	je     31003e5 <execTime+0x1ae>
/home/yogi/src/os/aproj/kshell/src/commands.c:90
        return;

    int argc = 0;
 3100290:	c7 85 c8 fa ff ff 00 	mov    DWORD PTR [ebp-0x538],0x0
 3100297:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:93
    char **argv;
    
    argv = cmdlineToArgv(cmdline, &argc);
 310029a:	83 ec 08             	sub    esp,0x8
 310029d:	8d 85 c8 fa ff ff    	lea    eax,[ebp-0x538]
 31002a3:	50                   	push   eax
 31002a4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31002a7:	e8 d4 0e 00 00       	call   3101180 <kShell+0x420>
 31002ac:	83 c4 10             	add    esp,0x10
 31002af:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:96
            
//    print ("Executing %s\n",pgm);
    startTicks=getticks();
 31002b2:	e8 f9 0e 00 00       	call   31011b0 <kShell+0x450>
 31002b7:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:98
    
    forkPid = fork();
 31002ba:	e8 71 0f 00 00       	call   3101230 <kShell+0x4d0>
 31002bf:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:100
    
    if (forkPid == 0)
 31002c2:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31002c6:	75 52                	jne    310031a <execTime+0xe3>
/home/yogi/src/os/aproj/kshell/src/commands.c:103
    {
        int retVal;
        int childPid = exec(argv[0], argc, argv);
 31002c8:	8b 95 c8 fa ff ff    	mov    edx,DWORD PTR [ebp-0x538]
 31002ce:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31002d1:	8b 00                	mov    eax,DWORD PTR [eax]
 31002d3:	83 ec 04             	sub    esp,0x4
 31002d6:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31002d9:	52                   	push   edx
 31002da:	50                   	push   eax
 31002db:	e8 e0 0e 00 00       	call   31011c0 <kShell+0x460>
 31002e0:	83 c4 10             	add    esp,0x10
 31002e3:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:105
        
        if (childPid > 0)
 31002e6:	83 7d d0 00          	cmp    DWORD PTR [ebp-0x30],0x0
 31002ea:	7e 14                	jle    3100300 <execTime+0xc9>
/home/yogi/src/os/aproj/kshell/src/commands.c:107
        {
            retVal = waitpid(childPid);
 31002ec:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 31002ef:	83 ec 0c             	sub    esp,0xc
 31002f2:	50                   	push   eax
 31002f3:	e8 f8 0d 00 00       	call   31010f0 <kShell+0x390>
 31002f8:	83 c4 10             	add    esp,0x10
 31002fb:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 31002fe:	eb 07                	jmp    3100307 <execTime+0xd0>
/home/yogi/src/os/aproj/kshell/src/commands.c:110
        }
        else
            retVal = 0xBADBADBA;
 3100300:	c7 45 f4 ba ad db ba 	mov    DWORD PTR [ebp-0xc],0xbadbadba
/home/yogi/src/os/aproj/kshell/src/commands.c:111
        exit(retVal);
 3100307:	83 ec 0c             	sub    esp,0xc
 310030a:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 310030d:	e8 5e 0f 00 00       	call   3101270 <kShell+0x510>
 3100312:	83 c4 10             	add    esp,0x10
 3100315:	e9 ad 00 00 00       	jmp    31003c7 <execTime+0x190>
/home/yogi/src/os/aproj/kshell/src/commands.c:113
    }
    else if (forkPid < 0)
 310031a:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310031e:	79 18                	jns    3100338 <execTime+0x101>
/home/yogi/src/os/aproj/kshell/src/commands.c:114
        print("Fork error %u", forkPid);
 3100320:	83 ec 08             	sub    esp,0x8
 3100323:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100326:	68 eb 13 10 03       	push   0x31013eb
 310032b:	e8 d0 0d 00 00       	call   3101100 <kShell+0x3a0>
 3100330:	83 c4 10             	add    esp,0x10
 3100333:	e9 8f 00 00 00       	jmp    31003c7 <execTime+0x190>
/home/yogi/src/os/aproj/kshell/src/commands.c:117
    else
    {
            lastExecExitCode = waitpid(forkPid);
 3100338:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 310033b:	83 ec 0c             	sub    esp,0xc
 310033e:	50                   	push   eax
 310033f:	e8 ac 0d 00 00       	call   31010f0 <kShell+0x390>
 3100344:	83 c4 10             	add    esp,0x10
 3100347:	a3 38 23 10 03       	mov    ds:0x3102338,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:118
            if (lastExecExitCode == 0xBADBADBA)
 310034c:	a1 38 23 10 03       	mov    eax,ds:0x3102338
 3100351:	3d ba ad db ba       	cmp    eax,0xbadbadba
 3100356:	75 16                	jne    310036e <execTime+0x137>
/home/yogi/src/os/aproj/kshell/src/commands.c:119
                print("Cannot execute %s\n",argv[0]);
 3100358:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 310035b:	8b 00                	mov    eax,DWORD PTR [eax]
 310035d:	83 ec 08             	sub    esp,0x8
 3100360:	50                   	push   eax
 3100361:	68 f9 13 10 03       	push   0x31013f9
 3100366:	e8 95 0d 00 00       	call   3101100 <kShell+0x3a0>
 310036b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:120
            if (timeIt)
 310036e:	80 bd b4 fa ff ff 00 	cmp    BYTE PTR [ebp-0x54c],0x0
 3100375:	74 1f                	je     3100396 <execTime+0x15f>
/home/yogi/src/os/aproj/kshell/src/commands.c:122
            {
                endTicks=getticks();
 3100377:	e8 34 0e 00 00       	call   31011b0 <kShell+0x450>
 310037c:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:123
                print("%u ticks\n",endTicks-startTicks);
 310037f:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 3100382:	2b 45 d4             	sub    eax,DWORD PTR [ebp-0x2c]
 3100385:	83 ec 08             	sub    esp,0x8
 3100388:	50                   	push   eax
 3100389:	68 0c 14 10 03       	push   0x310140c
 310038e:	e8 6d 0d 00 00       	call   3101100 <kShell+0x3a0>
 3100393:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:126
            }
            char ret[10];
            itoa(lastExecExitCode,ret);
 3100396:	a1 38 23 10 03       	mov    eax,ds:0x3102338
 310039b:	89 c2                	mov    edx,eax
 310039d:	83 ec 08             	sub    esp,0x8
 31003a0:	8d 85 be fa ff ff    	lea    eax,[ebp-0x542]
 31003a6:	50                   	push   eax
 31003a7:	52                   	push   edx
 31003a8:	e8 f3 0d 00 00       	call   31011a0 <kShell+0x440>
 31003ad:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:127
            setenv("LASTEXIT",ret);    
 31003b0:	83 ec 08             	sub    esp,0x8
 31003b3:	8d 85 be fa ff ff    	lea    eax,[ebp-0x542]
 31003b9:	50                   	push   eax
 31003ba:	68 ce 13 10 03       	push   0x31013ce
 31003bf:	e8 4c 0e 00 00       	call   3101210 <kShell+0x4b0>
 31003c4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:130 (discriminator 1)
    }
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    free(argv);
 31003c7:	83 ec 0c             	sub    esp,0xc
 31003ca:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31003cd:	e8 ce 0e 00 00       	call   31012a0 <kShell+0x540>
 31003d2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:131 (discriminator 1)
    free(pgm);
 31003d5:	83 ec 0c             	sub    esp,0xc
 31003d8:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31003db:	e8 c0 0e 00 00       	call   31012a0 <kShell+0x540>
 31003e0:	83 c4 10             	add    esp,0x10
 31003e3:	eb 01                	jmp    31003e6 <execTime+0x1af>
/home/yogi/src/os/aproj/kshell/src/commands.c:88
    int pcount=1;
    struct tm *startTime, *endTime;
    uint32_t startTicks, endTicks;
    
    if (paramCount==0)
        return;
 31003e5:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/commands.c:133 (discriminator 2)
    }
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    free(argv);
    free(pgm);
    
}
 31003e6:	c9                   	leave  
 31003e7:	c3                   	ret    

031003e8 <cmdTime>:
cmdTime():
/home/yogi/src/os/aproj/kshell/src/commands.c:135
void cmdTime(char* cmdline)
{
 31003e8:	55                   	push   ebp
 31003e9:	89 e5                	mov    ebp,esp
 31003eb:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:136
    execTime(cmdline,true);
 31003ee:	83 ec 08             	sub    esp,0x8
 31003f1:	6a 01                	push   0x1
 31003f3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31003f6:	e8 3c fe ff ff       	call   3100237 <execTime>
 31003fb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:137
}
 31003fe:	90                   	nop
 31003ff:	c9                   	leave  
 3100400:	c3                   	ret    

03100401 <cmdExecp>:
cmdExecp():
/home/yogi/src/os/aproj/kshell/src/commands.c:140

void cmdExecp(char* cmdline)
{
 3100401:	55                   	push   ebp
 3100402:	89 e5                	mov    ebp,esp
 3100404:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:141
    execTime(cmdline,false);
 3100407:	83 ec 08             	sub    esp,0x8
 310040a:	6a 00                	push   0x0
 310040c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310040f:	e8 23 fe ff ff       	call   3100237 <execTime>
 3100414:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:142
}
 3100417:	90                   	nop
 3100418:	c9                   	leave  
 3100419:	c3                   	ret    

0310041a <cmdExit>:
cmdExit():
/home/yogi/src/os/aproj/kshell/src/commands.c:145

void cmdExit(char *cmdline)
{
 310041a:	55                   	push   ebp
 310041b:	89 e5                	mov    ebp,esp
 310041d:	81 ec 08 05 00 00    	sub    esp,0x508
/home/yogi/src/os/aproj/kshell/src/commands.c:148
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 3100423:	83 ec 04             	sub    esp,0x4
 3100426:	68 00 05 00 00       	push   0x500
 310042b:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 3100431:	50                   	push   eax
 3100432:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100435:	e8 d0 02 00 00       	call   310070a <parseParamsShell>
 310043a:	83 c4 10             	add    esp,0x10
 310043d:	85 c0                	test   eax,eax
 310043f:	74 1d                	je     310045e <cmdExit+0x44>
/home/yogi/src/os/aproj/kshell/src/commands.c:150
    {
        exitCode = strtoul(params[0],0,10);
 3100441:	83 ec 04             	sub    esp,0x4
 3100444:	6a 0a                	push   0xa
 3100446:	6a 00                	push   0x0
 3100448:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 310044e:	50                   	push   eax
 310044f:	e8 3c 0d 00 00       	call   3101190 <kShell+0x430>
 3100454:	83 c4 10             	add    esp,0x10
 3100457:	a3 3c 23 10 03       	mov    ds:0x310233c,eax
 310045c:	eb 0a                	jmp    3100468 <cmdExit+0x4e>
/home/yogi/src/os/aproj/kshell/src/commands.c:153
    }
    else
        exitCode = 0;
 310045e:	c7 05 3c 23 10 03 00 	mov    DWORD PTR ds:0x310233c,0x0
 3100465:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:154
    timeToExit=true;
 3100468:	c6 05 48 23 10 03 01 	mov    BYTE PTR ds:0x3102348,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:155
}
 310046f:	90                   	nop
 3100470:	c9                   	leave  
 3100471:	c3                   	ret    

03100472 <cmdHelp>:
cmdHelp():
/home/yogi/src/os/aproj/kshell/src/commands.c:158

void cmdHelp(char *cmdline)
{
 3100472:	55                   	push   ebp
 3100473:	89 e5                	mov    ebp,esp
 3100475:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:161
    char* tok;
    
    tok=strtok(cmdline,delim);
 3100478:	83 ec 08             	sub    esp,0x8
 310047b:	68 00 20 10 03       	push   0x3102000
 3100480:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100483:	e8 98 0d 00 00       	call   3101220 <kShell+0x4c0>
 3100488:	83 c4 10             	add    esp,0x10
 310048b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:168
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
 310048e:	83 ec 08             	sub    esp,0x8
 3100491:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100494:	68 16 14 10 03       	push   0x3101416
 3100499:	e8 62 0c 00 00       	call   3101100 <kShell+0x3a0>
 310049e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:169
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 31004a1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31004a8:	e9 b6 00 00 00       	jmp    3100563 <cmdHelp+0xf1>
/home/yogi/src/os/aproj/kshell/src/commands.c:170
        if (tok!=NULL)
 31004ad:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31004b1:	74 54                	je     3100507 <cmdHelp+0x95>
/home/yogi/src/os/aproj/kshell/src/commands.c:172
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
 31004b3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004b6:	c1 e0 04             	shl    eax,0x4
 31004b9:	05 e0 1d 10 03       	add    eax,0x3101de0
 31004be:	8b 00                	mov    eax,DWORD PTR [eax]
 31004c0:	83 ec 04             	sub    esp,0x4
 31004c3:	6a 64                	push   0x64
 31004c5:	50                   	push   eax
 31004c6:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31004c9:	e8 22 0d 00 00       	call   31011f0 <kShell+0x490>
 31004ce:	83 c4 10             	add    esp,0x10
 31004d1:	85 c0                	test   eax,eax
 31004d3:	0f 85 86 00 00 00    	jne    310055f <cmdHelp+0xed>
/home/yogi/src/os/aproj/kshell/src/commands.c:173
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 31004d9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004dc:	c1 e0 04             	shl    eax,0x4
 31004df:	05 e4 1d 10 03       	add    eax,0x3101de4
 31004e4:	8b 10                	mov    edx,DWORD PTR [eax]
 31004e6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004e9:	c1 e0 04             	shl    eax,0x4
 31004ec:	05 e0 1d 10 03       	add    eax,0x3101de0
 31004f1:	8b 00                	mov    eax,DWORD PTR [eax]
 31004f3:	83 ec 04             	sub    esp,0x4
 31004f6:	52                   	push   edx
 31004f7:	50                   	push   eax
 31004f8:	68 20 14 10 03       	push   0x3101420
 31004fd:	e8 fe 0b 00 00       	call   3101100 <kShell+0x3a0>
 3100502:	83 c4 10             	add    esp,0x10
 3100505:	eb 58                	jmp    310055f <cmdHelp+0xed>
/home/yogi/src/os/aproj/kshell/src/commands.c:177
        }
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100507:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310050a:	c1 e0 04             	shl    eax,0x4
 310050d:	05 e4 1d 10 03       	add    eax,0x3101de4
 3100512:	8b 10                	mov    edx,DWORD PTR [eax]
 3100514:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100517:	c1 e0 04             	shl    eax,0x4
 310051a:	05 e0 1d 10 03       	add    eax,0x3101de0
 310051f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100521:	83 ec 04             	sub    esp,0x4
 3100524:	52                   	push   edx
 3100525:	50                   	push   eax
 3100526:	68 20 14 10 03       	push   0x3101420
 310052b:	e8 d0 0b 00 00       	call   3101100 <kShell+0x3a0>
 3100530:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:178
            printf("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100533:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100536:	c1 e0 04             	shl    eax,0x4
 3100539:	05 e4 1d 10 03       	add    eax,0x3101de4
 310053e:	8b 10                	mov    edx,DWORD PTR [eax]
 3100540:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100543:	c1 e0 04             	shl    eax,0x4
 3100546:	05 e0 1d 10 03       	add    eax,0x3101de0
 310054b:	8b 00                	mov    eax,DWORD PTR [eax]
 310054d:	83 ec 04             	sub    esp,0x4
 3100550:	52                   	push   edx
 3100551:	50                   	push   eax
 3100552:	68 20 14 10 03       	push   0x3101420
 3100557:	e8 b4 0b 00 00       	call   3101110 <kShell+0x3b0>
 310055c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:169 (discriminator 2)
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 310055f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:169 (discriminator 1)
 3100563:	83 7d f4 07          	cmp    DWORD PTR [ebp-0xc],0x7
 3100567:	0f 86 40 ff ff ff    	jbe    31004ad <cmdHelp+0x3b>
/home/yogi/src/os/aproj/kshell/src/commands.c:181
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
            printf("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
    //This is just a test, remove me later!!!
    char *buffer = malloc(1024);
 310056d:	83 ec 0c             	sub    esp,0xc
 3100570:	68 00 04 00 00       	push   0x400
 3100575:	e8 e6 0b 00 00       	call   3101160 <kShell+0x400>
 310057a:	83 c4 10             	add    esp,0x10
 310057d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:182
    memset(buffer, 0, 1024);
 3100580:	83 ec 04             	sub    esp,0x4
 3100583:	68 00 04 00 00       	push   0x400
 3100588:	6a 00                	push   0x0
 310058a:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310058d:	e8 ae 0c 00 00       	call   3101240 <kShell+0x4e0>
 3100592:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:183
    read(1, buffer, 1024,1);
 3100595:	6a 01                	push   0x1
 3100597:	68 00 04 00 00       	push   0x400
 310059c:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310059f:	6a 01                	push   0x1
 31005a1:	e8 3a 0c 00 00       	call   31011e0 <kShell+0x480>
 31005a6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:185
    
}
 31005a9:	90                   	nop
 31005aa:	c9                   	leave  
 31005ab:	c3                   	ret    

031005ac <cmdPwd>:
cmdPwd():
/home/yogi/src/os/aproj/kshell/src/commands.c:188

void cmdPwd()
{
 31005ac:	55                   	push   ebp
 31005ad:	89 e5                	mov    ebp,esp
 31005af:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:189
    char* buf=malloc(512);
 31005b2:	83 ec 0c             	sub    esp,0xc
 31005b5:	68 00 02 00 00       	push   0x200
 31005ba:	e8 a1 0b 00 00       	call   3101160 <kShell+0x400>
 31005bf:	83 c4 10             	add    esp,0x10
 31005c2:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:190
    print("%s\n",getcwd(buf,512));
 31005c5:	83 ec 08             	sub    esp,0x8
 31005c8:	68 00 02 00 00       	push   0x200
 31005cd:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 31005d0:	e8 8b 0c 00 00       	call   3101260 <kShell+0x500>
 31005d5:	83 c4 10             	add    esp,0x10
 31005d8:	83 ec 08             	sub    esp,0x8
 31005db:	50                   	push   eax
 31005dc:	68 ad 13 10 03       	push   0x31013ad
 31005e1:	e8 1a 0b 00 00       	call   3101100 <kShell+0x3a0>
 31005e6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:191
    free(buf);
 31005e9:	83 ec 0c             	sub    esp,0xc
 31005ec:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 31005ef:	e8 ac 0c 00 00       	call   31012a0 <kShell+0x540>
 31005f4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:192
}
 31005f7:	90                   	nop
 31005f8:	c9                   	leave  
 31005f9:	c3                   	ret    

031005fa <cmdSleep>:
cmdSleep():
/home/yogi/src/os/aproj/kshell/src/commands.c:195

void cmdSleep(char *cmdline)
{
 31005fa:	55                   	push   ebp
 31005fb:	89 e5                	mov    ebp,esp
 31005fd:	81 ec 18 05 00 00    	sub    esp,0x518
/home/yogi/src/os/aproj/kshell/src/commands.c:197
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 3100603:	83 ec 04             	sub    esp,0x4
 3100606:	68 00 05 00 00       	push   0x500
 310060b:	8d 85 f4 fa ff ff    	lea    eax,[ebp-0x50c]
 3100611:	50                   	push   eax
 3100612:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100615:	e8 f0 00 00 00       	call   310070a <parseParamsShell>
 310061a:	83 c4 10             	add    esp,0x10
 310061d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:199

    if (params[0][0]==0)
 3100620:	0f b6 85 f4 fa ff ff 	movzx  eax,BYTE PTR [ebp-0x50c]
 3100627:	84 c0                	test   al,al
 3100629:	75 12                	jne    310063d <cmdSleep+0x43>
/home/yogi/src/os/aproj/kshell/src/commands.c:201
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 310062b:	83 ec 0c             	sub    esp,0xc
 310062e:	68 2c 14 10 03       	push   0x310142c
 3100633:	e8 c8 0a 00 00       	call   3101100 <kShell+0x3a0>
 3100638:	83 c4 10             	add    esp,0x10
 310063b:	eb 22                	jmp    310065f <cmdSleep+0x65>
/home/yogi/src/os/aproj/kshell/src/commands.c:205
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 310063d:	83 ec 04             	sub    esp,0x4
 3100640:	6a 0a                	push   0xa
 3100642:	6a 00                	push   0x0
 3100644:	8d 85 f4 fa ff ff    	lea    eax,[ebp-0x50c]
 310064a:	50                   	push   eax
 310064b:	e8 40 0b 00 00       	call   3101190 <kShell+0x430>
 3100650:	83 c4 10             	add    esp,0x10
 3100653:	83 ec 0c             	sub    esp,0xc
 3100656:	50                   	push   eax
 3100657:	e8 14 0b 00 00       	call   3101170 <kShell+0x410>
 310065c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:206
}
 310065f:	c9                   	leave  
 3100660:	c3                   	ret    
 3100661:	66 90                	xchg   ax,ax
 3100663:	90                   	nop

03100664 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:25
void execInternalCommand(char lCommand[256]);
int findCommand(char* command);
char **buildargv (const char *input);

void execInternalCommand(char lCommand[256])
{
 3100664:	55                   	push   ebp
 3100665:	89 e5                	mov    ebp,esp
 3100667:	53                   	push   ebx
 3100668:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:26
    int i = findCommand(lCommand);
 310066b:	83 ec 0c             	sub    esp,0xc
 310066e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100671:	e8 3d 02 00 00       	call   31008b3 <findCommand>
 3100676:	83 c4 10             	add    esp,0x10
 3100679:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:28

    if(i>0)
 310067c:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100680:	7e 74                	jle    31006f6 <execInternalCommand+0x92>
/home/yogi/src/os/aproj/kshell/src/kshell.c:30
    {
        i--;
 3100682:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:32
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 3100686:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100689:	c1 e0 04             	shl    eax,0x4
 310068c:	05 68 1e 10 03       	add    eax,0x3101e68
 3100691:	8b 00                	mov    eax,DWORD PTR [eax]
 3100693:	a3 30 23 10 03       	mov    ds:0x3102330,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:33
        command_function_p = cmds[i].function;
 3100698:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310069b:	c1 e0 04             	shl    eax,0x4
 310069e:	05 68 1e 10 03       	add    eax,0x3101e68
 31006a3:	8b 00                	mov    eax,DWORD PTR [eax]
 31006a5:	a3 20 23 10 03       	mov    ds:0x3102320,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:34
        if (cmds[i].paramCount==0)
 31006aa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31006ad:	c1 e0 04             	shl    eax,0x4
 31006b0:	05 6c 1e 10 03       	add    eax,0x3101e6c
 31006b5:	8b 00                	mov    eax,DWORD PTR [eax]
 31006b7:	85 c0                	test   eax,eax
 31006b9:	75 09                	jne    31006c4 <execInternalCommand+0x60>
/home/yogi/src/os/aproj/kshell/src/kshell.c:35
            command_function();
 31006bb:	a1 30 23 10 03       	mov    eax,ds:0x3102330
 31006c0:	ff d0                	call   eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 31006c2:	eb 40                	jmp    3100704 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:38
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
 31006c4:	8b 1d 20 23 10 03    	mov    ebx,DWORD PTR ds:0x3102320
 31006ca:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31006cd:	c1 e0 04             	shl    eax,0x4
 31006d0:	05 60 1e 10 03       	add    eax,0x3101e60
 31006d5:	8b 00                	mov    eax,DWORD PTR [eax]
 31006d7:	83 ec 0c             	sub    esp,0xc
 31006da:	50                   	push   eax
 31006db:	e8 a0 0b 00 00       	call   3101280 <kShell+0x520>
 31006e0:	83 c4 10             	add    esp,0x10
 31006e3:	8d 50 01             	lea    edx,[eax+0x1]
 31006e6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31006e9:	01 d0                	add    eax,edx
 31006eb:	83 ec 0c             	sub    esp,0xc
 31006ee:	50                   	push   eax
 31006ef:	ff d3                	call   ebx
 31006f1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 31006f4:	eb 0e                	jmp    3100704 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:44
        }
    }
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
 31006f6:	83 ec 0c             	sub    esp,0xc
 31006f9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31006fc:	e8 00 fd ff ff       	call   3100401 <cmdExecp>
 3100701:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    }
}
 3100704:	90                   	nop
 3100705:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100708:	c9                   	leave  
 3100709:	c3                   	ret    

0310070a <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:49

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 310070a:	55                   	push   ebp
 310070b:	89 e5                	mov    ebp,esp
 310070d:	53                   	push   ebx
 310070e:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/aproj/kshell/src/kshell.c:50
    int x=0,y=0;
 3100711:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100718:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:51
    int lRetVal=0,parsedChars=0;
 310071f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100726:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:52
    bool needDoubleQuotetoEndParam=0;
 310072d:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:54
    
    memset(params,0, size);
 3100731:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100734:	83 ec 04             	sub    esp,0x4
 3100737:	50                   	push   eax
 3100738:	6a 00                	push   0x0
 310073a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 310073d:	e8 fe 0a 00 00       	call   3101240 <kShell+0x4e0>
 3100742:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:56
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100745:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 310074c:	e9 24 01 00 00       	jmp    3100875 <parseParamsShell+0x16b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:58
    {
        if(cmdLine[cnt]=='"')
 3100751:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100754:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100757:	01 d0                	add    eax,edx
 3100759:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310075c:	3c 22                	cmp    al,0x22
 310075e:	75 41                	jne    31007a1 <parseParamsShell+0x97>
/home/yogi/src/os/aproj/kshell/src/kshell.c:60
        {
            if (!needDoubleQuotetoEndParam)
 3100760:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100764:	83 f0 01             	xor    eax,0x1
 3100767:	84 c0                	test   al,al
 3100769:	74 09                	je     3100774 <parseParamsShell+0x6a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:62
            {
                needDoubleQuotetoEndParam=true;
 310076b:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 310076f:	e9 f9 00 00 00       	jmp    310086d <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:66
            }
            else
            {
                params[y][x]='\0';
 3100774:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100777:	c1 e0 07             	shl    eax,0x7
 310077a:	89 c2                	mov    edx,eax
 310077c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310077f:	01 c2                	add    edx,eax
 3100781:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100784:	01 d0                	add    eax,edx
 3100786:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:67
                {x=0;y++;lRetVal++;}
 3100789:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100790:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100794:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:68
                needDoubleQuotetoEndParam=false;
 3100798:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 310079c:	e9 cc 00 00 00       	jmp    310086d <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 31007a1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31007a4:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31007a7:	01 d0                	add    eax,edx
 31007a9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31007ac:	3c 20                	cmp    al,0x20
 31007ae:	74 1e                	je     31007ce <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71 (discriminator 2)
 31007b0:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31007b3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31007b6:	01 d0                	add    eax,edx
 31007b8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31007bb:	3c 2d                	cmp    al,0x2d
 31007bd:	74 0f                	je     31007ce <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71 (discriminator 4)
 31007bf:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31007c2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31007c5:	01 d0                	add    eax,edx
 31007c7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31007ca:	3c 2c                	cmp    al,0x2c
 31007cc:	75 7a                	jne    3100848 <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71 (discriminator 5)
 31007ce:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 31007d2:	83 f0 01             	xor    eax,0x1
 31007d5:	84 c0                	test   al,al
 31007d7:	74 6f                	je     3100848 <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:74
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 31007d9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31007dc:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31007df:	01 d0                	add    eax,edx
 31007e1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31007e4:	3c 2d                	cmp    al,0x2d
 31007e6:	74 0f                	je     31007f7 <parseParamsShell+0xed>
/home/yogi/src/os/aproj/kshell/src/kshell.c:74 (discriminator 1)
 31007e8:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31007eb:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31007ee:	01 d0                	add    eax,edx
 31007f0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31007f3:	3c 2f                	cmp    al,0x2f
 31007f5:	75 25                	jne    310081c <parseParamsShell+0x112>
/home/yogi/src/os/aproj/kshell/src/kshell.c:75
                params[y][x++]=cmdLine[cnt];
 31007f7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31007fa:	c1 e0 07             	shl    eax,0x7
 31007fd:	89 c2                	mov    edx,eax
 31007ff:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100802:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100805:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100808:	8d 50 01             	lea    edx,[eax+0x1]
 310080b:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310080e:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100811:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 3100814:	01 da                	add    edx,ebx
 3100816:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100819:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:76
            params[y][x]='\0';
 310081c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310081f:	c1 e0 07             	shl    eax,0x7
 3100822:	89 c2                	mov    edx,eax
 3100824:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100827:	01 c2                	add    edx,eax
 3100829:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310082c:	01 d0                	add    eax,edx
 310082e:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:77
            if (cnt>0)
 3100831:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 3100835:	74 36                	je     310086d <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:78
                {x=0;y++;lRetVal++;}
 3100837:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310083e:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100842:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:77
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 3100846:	eb 25                	jmp    310086d <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:83
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 3100848:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310084b:	c1 e0 07             	shl    eax,0x7
 310084e:	89 c2                	mov    edx,eax
 3100850:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100853:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100856:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100859:	8d 50 01             	lea    edx,[eax+0x1]
 310085c:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310085f:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100862:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 3100865:	01 da                	add    edx,ebx
 3100867:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310086a:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:85 (discriminator 2)
        }
        parsedChars++;
 310086d:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:56 (discriminator 2)
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100871:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:56 (discriminator 1)
 3100875:	83 ec 0c             	sub    esp,0xc
 3100878:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310087b:	e8 00 0a 00 00       	call   3101280 <kShell+0x520>
 3100880:	83 c4 10             	add    esp,0x10
 3100883:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100886:	0f 87 c5 fe ff ff    	ja     3100751 <parseParamsShell+0x47>
/home/yogi/src/os/aproj/kshell/src/kshell.c:87
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 310088c:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100890:	74 19                	je     31008ab <parseParamsShell+0x1a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:89
    {
        lRetVal++;
 3100892:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:90
        params[y][x]='\0';
 3100896:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100899:	c1 e0 07             	shl    eax,0x7
 310089c:	89 c2                	mov    edx,eax
 310089e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31008a1:	01 c2                	add    edx,eax
 31008a3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31008a6:	01 d0                	add    eax,edx
 31008a8:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:95
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 31008ab:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/aproj/kshell/src/kshell.c:96
}
 31008ae:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31008b1:	c9                   	leave  
 31008b2:	c3                   	ret    

031008b3 <findCommand>:
findCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:99

int findCommand(char* command)
{
 31008b3:	55                   	push   ebp
 31008b4:	89 e5                	mov    ebp,esp
 31008b6:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:103
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 31008b9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31008c0:	eb 4d                	jmp    310090f <findCommand+0x5c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:105
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 31008c2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31008c5:	c1 e0 04             	shl    eax,0x4
 31008c8:	05 60 1e 10 03       	add    eax,0x3101e60
 31008cd:	8b 00                	mov    eax,DWORD PTR [eax]
 31008cf:	83 ec 0c             	sub    esp,0xc
 31008d2:	50                   	push   eax
 31008d3:	e8 a8 09 00 00       	call   3101280 <kShell+0x520>
 31008d8:	83 c4 10             	add    esp,0x10
 31008db:	89 c2                	mov    edx,eax
 31008dd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31008e0:	c1 e0 04             	shl    eax,0x4
 31008e3:	05 60 1e 10 03       	add    eax,0x3101e60
 31008e8:	8b 00                	mov    eax,DWORD PTR [eax]
 31008ea:	83 ec 04             	sub    esp,0x4
 31008ed:	52                   	push   edx
 31008ee:	50                   	push   eax
 31008ef:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31008f2:	e8 f9 08 00 00       	call   31011f0 <kShell+0x490>
 31008f7:	83 c4 10             	add    esp,0x10
 31008fa:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:107
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 31008fd:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100901:	75 08                	jne    310090b <findCommand+0x58>
/home/yogi/src/os/aproj/kshell/src/kshell.c:110
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 3100903:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100906:	83 c0 01             	add    eax,0x1
 3100909:	eb 0f                	jmp    310091a <findCommand+0x67>
/home/yogi/src/os/aproj/kshell/src/kshell.c:103 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 310090b:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:103 (discriminator 1)
 310090f:	83 7d f4 07          	cmp    DWORD PTR [ebp-0xc],0x7
 3100913:	76 ad                	jbe    31008c2 <findCommand+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:114
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 3100915:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:115
}
 310091a:	c9                   	leave  
 310091b:	c3                   	ret    

0310091c <buildargv>:
buildargv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:119

/*parts from http://*/
char **buildargv (const char *input)
{
 310091c:	55                   	push   ebp
 310091d:	89 e5                	mov    ebp,esp
 310091f:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:122
  char *arg;
  char *copybuf;
  int squote = 0;
 3100922:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:123
  int dquote = 0;
 3100929:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:124
  int bsquote = 0;
 3100930:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:125
  int argc = 0;
 3100937:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:126
  int maxargc = 0;
 310093e:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:127
  char **argv = NULL;
 3100945:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:131
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 310094c:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 3100950:	0f 84 33 02 00 00    	je     3100b89 <buildargv+0x26d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:134
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 3100956:	83 ec 0c             	sub    esp,0xc
 3100959:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310095c:	e8 1f 09 00 00       	call   3101280 <kShell+0x520>
 3100961:	83 c4 10             	add    esp,0x10
 3100964:	83 c0 01             	add    eax,0x1
 3100967:	83 ec 0c             	sub    esp,0xc
 310096a:	50                   	push   eax
 310096b:	e8 f0 07 00 00       	call   3101160 <kShell+0x400>
 3100970:	83 c4 10             	add    esp,0x10
 3100973:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:142
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 3100976:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 310097a:	74 0b                	je     3100987 <buildargv+0x6b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:142 (discriminator 1)
 310097c:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 310097f:	83 e8 01             	sub    eax,0x1
 3100982:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100985:	7f 3d                	jg     31009c4 <buildargv+0xa8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:145
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 3100987:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 310098b:	75 1c                	jne    31009a9 <buildargv+0x8d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:147
		{
		  maxargc = INITIAL_MAXARGC;
 310098d:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:148
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 3100994:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100997:	c1 e0 02             	shl    eax,0x2
 310099a:	83 ec 0c             	sub    esp,0xc
 310099d:	50                   	push   eax
 310099e:	e8 bd 07 00 00       	call   3101160 <kShell+0x400>
 31009a3:	83 c4 10             	add    esp,0x10
 31009a6:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:150
		}
	      argv = nargv;
 31009a9:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 31009ac:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:151
	      argv[argc] = NULL;
 31009af:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31009b2:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31009b9:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31009bc:	01 d0                	add    eax,edx
 31009be:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:154
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 31009c4:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31009c7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:155
	  while (*input != EOS)
 31009ca:	e9 ec 00 00 00       	jmp    3100abb <buildargv+0x19f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 31009cf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31009d2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31009d5:	3c 20                	cmp    al,0x20
 31009d7:	75 16                	jne    31009ef <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 1)
 31009d9:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31009dd:	75 10                	jne    31009ef <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 2)
 31009df:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31009e3:	75 0a                	jne    31009ef <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 3)
 31009e5:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 31009e9:	0f 84 da 00 00 00    	je     3100ac9 <buildargv+0x1ad>
/home/yogi/src/os/aproj/kshell/src/kshell.c:163
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 31009ef:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 31009f3:	74 1d                	je     3100a12 <buildargv+0xf6>
/home/yogi/src/os/aproj/kshell/src/kshell.c:165
		    {
		      bsquote = 0;
 31009f5:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:166
		      *arg++ = *input;
 31009fc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31009ff:	8d 50 01             	lea    edx,[eax+0x1]
 3100a02:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100a05:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100a08:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100a0b:	88 10                	mov    BYTE PTR [eax],dl
 3100a0d:	e9 a5 00 00 00       	jmp    3100ab7 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:168
		    }
		  else if (*input == '\\')
 3100a12:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a15:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a18:	3c 5c                	cmp    al,0x5c
 3100a1a:	75 0c                	jne    3100a28 <buildargv+0x10c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:170
		    {
		      bsquote = 1;
 3100a1c:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 3100a23:	e9 8f 00 00 00       	jmp    3100ab7 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:172
		    }
		  else if (squote)
 3100a28:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100a2c:	74 26                	je     3100a54 <buildargv+0x138>
/home/yogi/src/os/aproj/kshell/src/kshell.c:174
		    {
		      if (*input == '\'')
 3100a2e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a31:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a34:	3c 27                	cmp    al,0x27
 3100a36:	75 09                	jne    3100a41 <buildargv+0x125>
/home/yogi/src/os/aproj/kshell/src/kshell.c:176
			{
			  squote = 0;
 3100a38:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100a3f:	eb 76                	jmp    3100ab7 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:180
			}
		      else
			{
			  *arg++ = *input;
 3100a41:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a44:	8d 50 01             	lea    edx,[eax+0x1]
 3100a47:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100a4a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100a4d:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100a50:	88 10                	mov    BYTE PTR [eax],dl
 3100a52:	eb 63                	jmp    3100ab7 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:183
			}
		    }
		  else if (dquote)
 3100a54:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100a58:	74 26                	je     3100a80 <buildargv+0x164>
/home/yogi/src/os/aproj/kshell/src/kshell.c:185
		    {
		      if (*input == '"')
 3100a5a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a5d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a60:	3c 22                	cmp    al,0x22
 3100a62:	75 09                	jne    3100a6d <buildargv+0x151>
/home/yogi/src/os/aproj/kshell/src/kshell.c:187
			{
			  dquote = 0;
 3100a64:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 3100a6b:	eb 4a                	jmp    3100ab7 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:191
			}
		      else
			{
			  *arg++ = *input;
 3100a6d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a70:	8d 50 01             	lea    edx,[eax+0x1]
 3100a73:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100a76:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100a79:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100a7c:	88 10                	mov    BYTE PTR [eax],dl
 3100a7e:	eb 37                	jmp    3100ab7 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:196
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100a80:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a83:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a86:	3c 27                	cmp    al,0x27
 3100a88:	75 09                	jne    3100a93 <buildargv+0x177>
/home/yogi/src/os/aproj/kshell/src/kshell.c:198
			{
			  squote = 1;
 3100a8a:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100a91:	eb 24                	jmp    3100ab7 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:200
			}
		      else if (*input == '"')
 3100a93:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a96:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a99:	3c 22                	cmp    al,0x22
 3100a9b:	75 09                	jne    3100aa6 <buildargv+0x18a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:202
			{
			  dquote = 1;
 3100a9d:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 3100aa4:	eb 11                	jmp    3100ab7 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:206
			}
		      else
			{
			  *arg++ = *input;
 3100aa6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100aa9:	8d 50 01             	lea    edx,[eax+0x1]
 3100aac:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100aaf:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100ab2:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100ab5:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:210
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 3100ab7:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:155
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 3100abb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100abe:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100ac1:	84 c0                	test   al,al
 3100ac3:	0f 85 06 ff ff ff    	jne    31009cf <buildargv+0xb3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:213
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3100ac9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100acc:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:215
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100acf:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100ad2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100ad5:	84 c0                	test   al,al
 3100ad7:	0f 84 9e 00 00 00    	je     3100b7b <buildargv+0x25f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:217
          {
            char* temp=malloc(strlen(copybuf)+1);
 3100add:	83 ec 0c             	sub    esp,0xc
 3100ae0:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100ae3:	e8 98 07 00 00       	call   3101280 <kShell+0x520>
 3100ae8:	83 c4 10             	add    esp,0x10
 3100aeb:	83 c0 01             	add    eax,0x1
 3100aee:	83 ec 0c             	sub    esp,0xc
 3100af1:	50                   	push   eax
 3100af2:	e8 69 06 00 00       	call   3101160 <kShell+0x400>
 3100af7:	83 c4 10             	add    esp,0x10
 3100afa:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:220
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3100afd:	83 ec 08             	sub    esp,0x8
 3100b00:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100b03:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100b06:	e8 d5 05 00 00       	call   31010e0 <kShell+0x380>
 3100b0b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:221
            free(copybuf);
 3100b0e:	83 ec 0c             	sub    esp,0xc
 3100b11:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100b14:	e8 87 07 00 00       	call   31012a0 <kShell+0x540>
 3100b19:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:222
            copybuf = (char *) malloc (strlen (input) + 1);
 3100b1c:	83 ec 0c             	sub    esp,0xc
 3100b1f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100b22:	e8 59 07 00 00       	call   3101280 <kShell+0x520>
 3100b27:	83 c4 10             	add    esp,0x10
 3100b2a:	83 c0 01             	add    eax,0x1
 3100b2d:	83 ec 0c             	sub    esp,0xc
 3100b30:	50                   	push   eax
 3100b31:	e8 2a 06 00 00       	call   3101160 <kShell+0x400>
 3100b36:	83 c4 10             	add    esp,0x10
 3100b39:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:223
            argv[argc] = temp;
 3100b3c:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100b3f:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100b46:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100b49:	01 c2                	add    edx,eax
 3100b4b:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100b4e:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:225
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 3100b50:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:226
            argv[argc] = NULL;
 3100b54:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100b57:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100b5e:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100b61:	01 d0                	add    eax,edx
 3100b63:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:227
            input++;
 3100b69:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:228
            free(temp);
 3100b6d:	83 ec 0c             	sub    esp,0xc
 3100b70:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100b73:	e8 28 07 00 00       	call   31012a0 <kShell+0x540>
 3100b78:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:231
          }
	}
      while (*input != EOS);
 3100b7b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b7e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b81:	84 c0                	test   al,al
 3100b83:	0f 85 ed fd ff ff    	jne    3100976 <buildargv+0x5a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:234
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 3100b89:	83 ec 0c             	sub    esp,0xc
 3100b8c:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100b8f:	e8 0c 07 00 00       	call   31012a0 <kShell+0x540>
 3100b94:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:235
  free(nargv);
 3100b97:	83 ec 0c             	sub    esp,0xc
 3100b9a:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100b9d:	e8 fe 06 00 00       	call   31012a0 <kShell+0x540>
 3100ba2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:236
  return (argv);
 3100ba5:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/kshell/src/kshell.c:237
}
 3100ba8:	c9                   	leave  
 3100ba9:	c3                   	ret    

03100baa <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:240

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
 3100baa:	55                   	push   ebp
 3100bab:	89 e5                	mov    ebp,esp
 3100bad:	53                   	push   ebx
 3100bae:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:241
    for (int cnt=0;cnt<pcount;cnt++)
 3100bb1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100bb8:	eb 56                	jmp    3100c10 <paramsToArgv+0x66>
/home/yogi/src/os/aproj/kshell/src/kshell.c:243 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 3100bba:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bbd:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100bc4:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100bc7:	8d 1c 02             	lea    ebx,[edx+eax*1]
 3100bca:	83 ec 0c             	sub    esp,0xc
 3100bcd:	68 80 00 00 00       	push   0x80
 3100bd2:	e8 89 05 00 00       	call   3101160 <kShell+0x400>
 3100bd7:	83 c4 10             	add    esp,0x10
 3100bda:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:244 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 3100bdc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bdf:	c1 e0 07             	shl    eax,0x7
 3100be2:	89 c2                	mov    edx,eax
 3100be4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100be7:	01 c2                	add    edx,eax
 3100be9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bec:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 3100bf3:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100bf6:	01 c8                	add    eax,ecx
 3100bf8:	8b 00                	mov    eax,DWORD PTR [eax]
 3100bfa:	83 ec 04             	sub    esp,0x4
 3100bfd:	68 80 00 00 00       	push   0x80
 3100c02:	52                   	push   edx
 3100c03:	50                   	push   eax
 3100c04:	e8 47 05 00 00       	call   3101150 <kShell+0x3f0>
 3100c09:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:241 (discriminator 3)
  return (argv);
}

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100c0c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:241 (discriminator 1)
 3100c10:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c13:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100c16:	7c a2                	jl     3100bba <paramsToArgv+0x10>
/home/yogi/src/os/aproj/kshell/src/kshell.c:246
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 3100c18:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
/home/yogi/src/os/aproj/kshell/src/kshell.c:247
}
 3100c1b:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100c1e:	c9                   	leave  
 3100c1f:	c3                   	ret    

03100c20 <freeArgV>:
freeArgV():
/home/yogi/src/os/aproj/kshell/src/kshell.c:250

void freeArgV(int pcount, char **params)
{
 3100c20:	55                   	push   ebp
 3100c21:	89 e5                	mov    ebp,esp
 3100c23:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:251
    for (int cnt=0;cnt<pcount;cnt++)
 3100c26:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100c2d:	eb 15                	jmp    3100c44 <freeArgV+0x24>
/home/yogi/src/os/aproj/kshell/src/kshell.c:252 (discriminator 3)
        free(*params);
 3100c2f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100c32:	8b 00                	mov    eax,DWORD PTR [eax]
 3100c34:	83 ec 0c             	sub    esp,0xc
 3100c37:	50                   	push   eax
 3100c38:	e8 63 06 00 00       	call   31012a0 <kShell+0x540>
 3100c3d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:251 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100c40:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:251 (discriminator 1)
 3100c44:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c47:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100c4a:	7c e3                	jl     3100c2f <freeArgV+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:253
        free(*params);
    free(params);
 3100c4c:	83 ec 0c             	sub    esp,0xc
 3100c4f:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100c52:	e8 49 06 00 00       	call   31012a0 <kShell+0x540>
 3100c57:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:254
}
 3100c5a:	90                   	nop
 3100c5b:	c9                   	leave  
 3100c5c:	c3                   	ret    

03100c5d <getEnvVariableValue>:
getEnvVariableValue():
/home/yogi/src/os/aproj/kshell/src/kshell.c:257

bool getEnvVariableValue(char* evName, char* value)
{
 3100c5d:	55                   	push   ebp
 3100c5e:	89 e5                	mov    ebp,esp
 3100c60:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:259
    
    for (int cnt=0;cnt<50;cnt++)
 3100c63:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100c6a:	eb 70                	jmp    3100cdc <getEnvVariableValue+0x7f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:261
    {
        if (environmentLoc[cnt]!=0)
 3100c6c:	a1 08 20 10 03       	mov    eax,ds:0x3102008
 3100c71:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100c74:	c1 e2 02             	shl    edx,0x2
 3100c77:	01 d0                	add    eax,edx
 3100c79:	8b 00                	mov    eax,DWORD PTR [eax]
 3100c7b:	85 c0                	test   eax,eax
 3100c7d:	74 59                	je     3100cd8 <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:263
        {
            char* idx = strstr((char*)environmentLoc[cnt],evName);
 3100c7f:	a1 08 20 10 03       	mov    eax,ds:0x3102008
 3100c84:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100c87:	c1 e2 02             	shl    edx,0x2
 3100c8a:	01 d0                	add    eax,edx
 3100c8c:	8b 00                	mov    eax,DWORD PTR [eax]
 3100c8e:	83 ec 08             	sub    esp,0x8
 3100c91:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100c94:	50                   	push   eax
 3100c95:	e8 36 05 00 00       	call   31011d0 <kShell+0x470>
 3100c9a:	83 c4 10             	add    esp,0x10
 3100c9d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:264
            if (idx>0)
 3100ca0:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100ca4:	74 32                	je     3100cd8 <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:266
            {
                idx = strstr(idx,"=");
 3100ca6:	83 ec 08             	sub    esp,0x8
 3100ca9:	68 69 15 10 03       	push   0x3101569
 3100cae:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100cb1:	e8 1a 05 00 00       	call   31011d0 <kShell+0x470>
 3100cb6:	83 c4 10             	add    esp,0x10
 3100cb9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:268
                //++ because we don't want to include the = sign
                strcpy(value, ++idx);
 3100cbc:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100cc0:	83 ec 08             	sub    esp,0x8
 3100cc3:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100cc6:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100cc9:	e8 12 04 00 00       	call   31010e0 <kShell+0x380>
 3100cce:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:270
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
 3100cd1:	b8 01 00 00 00       	mov    eax,0x1
 3100cd6:	eb 0f                	jmp    3100ce7 <getEnvVariableValue+0x8a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:259 (discriminator 2)
}

bool getEnvVariableValue(char* evName, char* value)
{
    
    for (int cnt=0;cnt<50;cnt++)
 3100cd8:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:259 (discriminator 1)
 3100cdc:	83 7d f4 31          	cmp    DWORD PTR [ebp-0xc],0x31
 3100ce0:	7e 8a                	jle    3100c6c <getEnvVariableValue+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:274
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
            }
        }
    } 
    return false;
 3100ce2:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:275
}
 3100ce7:	c9                   	leave  
 3100ce8:	c3                   	ret    

03100ce9 <saveCommand>:
saveCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:288
    
}
*/

void saveCommand(char* command)
{
 3100ce9:	55                   	push   ebp
 3100cea:	89 e5                	mov    ebp,esp
 3100cec:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:289
    strcpy(commandHistory[commandHistoryMax++],command);
 3100cef:	a1 50 23 10 03       	mov    eax,ds:0x3102350
 3100cf4:	8d 50 01             	lea    edx,[eax+0x1]
 3100cf7:	89 15 50 23 10 03    	mov    DWORD PTR ds:0x3102350,edx
 3100cfd:	c1 e0 07             	shl    eax,0x7
 3100d00:	05 60 23 10 03       	add    eax,0x3102360
 3100d05:	83 ec 08             	sub    esp,0x8
 3100d08:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100d0b:	50                   	push   eax
 3100d0c:	e8 cf 03 00 00       	call   31010e0 <kShell+0x380>
 3100d11:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:290
}
 3100d14:	90                   	nop
 3100d15:	c9                   	leave  
 3100d16:	c3                   	ret    

03100d17 <prompt>:
prompt():
/home/yogi/src/os/aproj/kshell/src/kshell.c:293

void prompt()
{
 3100d17:	55                   	push   ebp
 3100d18:	89 e5                	mov    ebp,esp
 3100d1a:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:294
    print("%s %s> ",sExecutingProgram, cwd);
 3100d1d:	83 ec 04             	sub    esp,0x4
 3100d20:	68 20 20 10 03       	push   0x3102020
 3100d25:	68 20 21 10 03       	push   0x3102120
 3100d2a:	68 6b 15 10 03       	push   0x310156b
 3100d2f:	e8 cc 03 00 00       	call   3101100 <kShell+0x3a0>
 3100d34:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:295
}
 3100d37:	90                   	nop
 3100d38:	c9                   	leave  
 3100d39:	c3                   	ret    

03100d3a <reprintCommand>:
reprintCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:298

int reprintCommand(char* command)
{
 3100d3a:	55                   	push   ebp
 3100d3b:	89 e5                	mov    ebp,esp
 3100d3d:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:299
    resetRow();
 3100d40:	e8 db 03 00 00       	call   3101120 <kShell+0x3c0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:300
    prompt();
 3100d45:	e8 cd ff ff ff       	call   3100d17 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:301
    print("%s",command);
 3100d4a:	83 ec 08             	sub    esp,0x8
 3100d4d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100d50:	68 73 15 10 03       	push   0x3101573
 3100d55:	e8 a6 03 00 00       	call   3101100 <kShell+0x3a0>
 3100d5a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:303
 
}
 3100d5d:	90                   	nop
 3100d5e:	c9                   	leave  
 3100d5f:	c3                   	ret    

03100d60 <kShell>:
kShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:307


int kShell(int argc, char** argv, char** envp)
{
 3100d60:	55                   	push   ebp
 3100d61:	89 e5                	mov    ebp,esp
 3100d63:	81 ec 38 01 00 00    	sub    esp,0x138
/home/yogi/src/os/aproj/kshell/src/kshell.c:309
    char lCommand[256];
    uint8_t lCurrKey=0;
 3100d69:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:310
    int lCurrKeyCount=0;
 3100d70:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:311
    int commandWasFromThisBufferPtr=0;
 3100d77:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:314
    char ansiSeq[20];

    exitCode = 0;
 3100d7e:	c7 05 3c 23 10 03 00 	mov    DWORD PTR ds:0x310233c,0x0
 3100d85:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/kshell.c:315
    timeToExit = false;
 3100d88:	c6 05 48 23 10 03 00 	mov    BYTE PTR ds:0x3102348,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:316
    strcpy(delim," \t\n-,");
 3100d8f:	83 ec 08             	sub    esp,0x8
 3100d92:	68 76 15 10 03       	push   0x3101576
 3100d97:	68 00 20 10 03       	push   0x3102000
 3100d9c:	e8 3f 03 00 00       	call   31010e0 <kShell+0x380>
 3100da1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:317
    environmentLoc = envp;
 3100da4:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100da7:	a3 08 20 10 03       	mov    ds:0x3102008,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:318
    ansiSeq[0]=0x1b;
 3100dac:	c6 85 d7 fe ff ff 1b 	mov    BYTE PTR [ebp-0x129],0x1b
/home/yogi/src/os/aproj/kshell/src/kshell.c:319
    sKShellProgramName=malloc(1024);
 3100db3:	83 ec 0c             	sub    esp,0xc
 3100db6:	68 00 04 00 00       	push   0x400
 3100dbb:	e8 a0 03 00 00       	call   3101160 <kShell+0x400>
 3100dc0:	83 c4 10             	add    esp,0x10
 3100dc3:	a3 40 23 10 03       	mov    ds:0x3102340,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:320
    strcpy(sKShellProgramName,"kShell");
 3100dc8:	a1 40 23 10 03       	mov    eax,ds:0x3102340
 3100dcd:	83 ec 08             	sub    esp,0x8
 3100dd0:	68 7c 15 10 03       	push   0x310157c
 3100dd5:	50                   	push   eax
 3100dd6:	e8 05 03 00 00       	call   31010e0 <kShell+0x380>
 3100ddb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:321
    strcpy(sExecutingProgram,sKShellProgramName);
 3100dde:	a1 40 23 10 03       	mov    eax,ds:0x3102340
 3100de3:	83 ec 08             	sub    esp,0x8
 3100de6:	50                   	push   eax
 3100de7:	68 20 21 10 03       	push   0x3102120
 3100dec:	e8 ef 02 00 00       	call   31010e0 <kShell+0x380>
 3100df1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:324
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 3100df4:	e9 a8 02 00 00       	jmp    31010a1 <kShell+0x341>
/home/yogi/src/os/aproj/kshell/src/kshell.c:327
    {
getACommand:
        commandHistoryPtr = commandHistoryMax;
 3100df9:	a1 50 23 10 03       	mov    eax,ds:0x3102350
 3100dfe:	a3 4c 23 10 03       	mov    ds:0x310234c,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:328
        commandWasFromThisBufferPtr = -1;
 3100e03:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:329
        lCurrKey=0;
 3100e0a:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:330
        lCurrKeyCount=0;
 3100e11:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:331
        memset(lCommand,0,256);
 3100e18:	83 ec 04             	sub    esp,0x4
 3100e1b:	68 00 01 00 00       	push   0x100
 3100e20:	6a 00                	push   0x0
 3100e22:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100e28:	50                   	push   eax
 3100e29:	e8 12 04 00 00       	call   3101240 <kShell+0x4e0>
 3100e2e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:332
        getenv("CWD",cwd);
 3100e31:	83 ec 08             	sub    esp,0x8
 3100e34:	68 20 20 10 03       	push   0x3102020
 3100e39:	68 83 15 10 03       	push   0x3101583
 3100e3e:	e8 ed 02 00 00       	call   3101130 <kShell+0x3d0>
 3100e43:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:333
        prompt();
 3100e46:	e8 cc fe ff ff       	call   3100d17 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:335
getAKey:
        lCurrKey=0;
 3100e4b:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:336
        while(lCurrKey==0)
 3100e52:	eb 16                	jmp    3100e6a <kShell+0x10a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:338
        {
            gets(&lCurrKey,1,1);
 3100e54:	83 ec 04             	sub    esp,0x4
 3100e57:	6a 01                	push   0x1
 3100e59:	6a 01                	push   0x1
 3100e5b:	8d 85 eb fe ff ff    	lea    eax,[ebp-0x115]
 3100e61:	50                   	push   eax
 3100e62:	e8 d9 02 00 00       	call   3101140 <kShell+0x3e0>
 3100e67:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:336
        memset(lCommand,0,256);
        getenv("CWD",cwd);
        prompt();
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 3100e6a:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100e71:	84 c0                	test   al,al
 3100e73:	74 df                	je     3100e54 <kShell+0xf4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:341
        {
            gets(&lCurrKey,1,1);
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3100e75:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100e7c:	3c c8                	cmp    al,0xc8
 3100e7e:	75 76                	jne    3100ef6 <kShell+0x196>
/home/yogi/src/os/aproj/kshell/src/kshell.c:343
        {
            if (commandHistoryPtr>=0)
 3100e80:	a1 4c 23 10 03       	mov    eax,ds:0x310234c
 3100e85:	85 c0                	test   eax,eax
 3100e87:	78 c2                	js     3100e4b <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:346
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
 3100e89:	a1 4c 23 10 03       	mov    eax,ds:0x310234c
 3100e8e:	83 e8 01             	sub    eax,0x1
 3100e91:	85 c0                	test   eax,eax
 3100e93:	78 b6                	js     3100e4b <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:348
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
 3100e95:	a1 4c 23 10 03       	mov    eax,ds:0x310234c
 3100e9a:	83 e8 01             	sub    eax,0x1
 3100e9d:	a3 4c 23 10 03       	mov    ds:0x310234c,eax
 3100ea2:	a1 4c 23 10 03       	mov    eax,ds:0x310234c
 3100ea7:	c1 e0 07             	shl    eax,0x7
 3100eaa:	05 60 23 10 03       	add    eax,0x3102360
 3100eaf:	83 ec 08             	sub    esp,0x8
 3100eb2:	50                   	push   eax
 3100eb3:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100eb9:	50                   	push   eax
 3100eba:	e8 21 02 00 00       	call   31010e0 <kShell+0x380>
 3100ebf:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:349
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3100ec2:	a1 4c 23 10 03       	mov    eax,ds:0x310234c
 3100ec7:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:350
                    reprintCommand(lCommand);
 3100eca:	83 ec 0c             	sub    esp,0xc
 3100ecd:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100ed3:	50                   	push   eax
 3100ed4:	e8 61 fe ff ff       	call   3100d3a <reprintCommand>
 3100ed9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:351
                    lCurrKeyCount=strlen(lCommand);
 3100edc:	83 ec 0c             	sub    esp,0xc
 3100edf:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100ee5:	50                   	push   eax
 3100ee6:	e8 95 03 00 00       	call   3101280 <kShell+0x520>
 3100eeb:	83 c4 10             	add    esp,0x10
 3100eee:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:353
                }
                goto getAKey;
 3100ef1:	e9 55 ff ff ff       	jmp    3100e4b <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:358
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 3100ef6:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100efd:	3c d0                	cmp    al,0xd0
 3100eff:	0f 85 99 00 00 00    	jne    3100f9e <kShell+0x23e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:360
        {
            if (commandHistoryPtr>=0)
 3100f05:	a1 4c 23 10 03       	mov    eax,ds:0x310234c
 3100f0a:	85 c0                	test   eax,eax
 3100f0c:	0f 88 39 ff ff ff    	js     3100e4b <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:363
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<=commandHistoryMax)
 3100f12:	a1 4c 23 10 03       	mov    eax,ds:0x310234c
 3100f17:	8d 50 01             	lea    edx,[eax+0x1]
 3100f1a:	a1 50 23 10 03       	mov    eax,ds:0x3102350
 3100f1f:	39 c2                	cmp    edx,eax
 3100f21:	0f 8f 24 ff ff ff    	jg     3100e4b <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:365
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
 3100f27:	a1 4c 23 10 03       	mov    eax,ds:0x310234c
 3100f2c:	83 c0 01             	add    eax,0x1
 3100f2f:	a3 4c 23 10 03       	mov    ds:0x310234c,eax
 3100f34:	a1 4c 23 10 03       	mov    eax,ds:0x310234c
 3100f39:	c1 e0 07             	shl    eax,0x7
 3100f3c:	05 60 23 10 03       	add    eax,0x3102360
 3100f41:	83 ec 08             	sub    esp,0x8
 3100f44:	50                   	push   eax
 3100f45:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100f4b:	50                   	push   eax
 3100f4c:	e8 8f 01 00 00       	call   31010e0 <kShell+0x380>
 3100f51:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:366
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3100f54:	a1 4c 23 10 03       	mov    eax,ds:0x310234c
 3100f59:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:367
                    if (commandHistoryPtr>=commandHistoryMax)
 3100f5c:	8b 15 4c 23 10 03    	mov    edx,DWORD PTR ds:0x310234c
 3100f62:	a1 50 23 10 03       	mov    eax,ds:0x3102350
 3100f67:	39 c2                	cmp    edx,eax
 3100f69:	7c 07                	jl     3100f72 <kShell+0x212>
/home/yogi/src/os/aproj/kshell/src/kshell.c:368
                        commandWasFromThisBufferPtr=-1;
 3100f6b:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:369
                    reprintCommand(lCommand);
 3100f72:	83 ec 0c             	sub    esp,0xc
 3100f75:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100f7b:	50                   	push   eax
 3100f7c:	e8 b9 fd ff ff       	call   3100d3a <reprintCommand>
 3100f81:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:370
                    lCurrKeyCount=strlen(lCommand);
 3100f84:	83 ec 0c             	sub    esp,0xc
 3100f87:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100f8d:	50                   	push   eax
 3100f8e:	e8 ed 02 00 00       	call   3101280 <kShell+0x520>
 3100f93:	83 c4 10             	add    esp,0x10
 3100f96:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:372
                }
                goto getAKey;
 3100f99:	e9 ad fe ff ff       	jmp    3100e4b <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:377
            }
            else
                goto getAKey;
        }   
        else if (lCurrKey==0xcb) //left
 3100f9e:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100fa5:	3c cb                	cmp    al,0xcb
 3100fa7:	75 23                	jne    3100fcc <kShell+0x26c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:379
        {
            if (lCurrKeyCount>0)
 3100fa9:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100fad:	0f 8e 98 fe ff ff    	jle    3100e4b <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:381
            {
                print("\033[1D");
 3100fb3:	83 ec 0c             	sub    esp,0xc
 3100fb6:	68 87 15 10 03       	push   0x3101587
 3100fbb:	e8 40 01 00 00       	call   3101100 <kShell+0x3a0>
 3100fc0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:382
                lCurrKeyCount--;
 3100fc3:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:385
            }
             
            goto getAKey;
 3100fc7:	e9 7f fe ff ff       	jmp    3100e4b <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:387
        }
        else if (lCurrKey==0xcd) //right
 3100fcc:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100fd3:	3c cd                	cmp    al,0xcd
 3100fd5:	0f 84 70 fe ff ff    	je     3100e4b <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:390
        {
        }
        else if (lCurrKey=='\b') //backspace
 3100fdb:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100fe2:	3c 08                	cmp    al,0x8
 3100fe4:	75 1b                	jne    3101001 <kShell+0x2a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:392
        {
            lCurrKeyCount--;
 3100fe6:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:393
            lCommand[lCurrKeyCount]='\0';
 3100fea:	8d 95 ec fe ff ff    	lea    edx,[ebp-0x114]
 3100ff0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100ff3:	01 d0                	add    eax,edx
 3100ff5:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:394
            if (lCurrKeyCount>0)
 3100ff8:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100ffc:	e9 4a fe ff ff       	jmp    3100e4b <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:406
                cursorMoveTo(cursorGetPosX()-1,lTemp);*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa) //Enter
 3101001:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3101008:	3c 0a                	cmp    al,0xa
 310100a:	75 21                	jne    310102d <kShell+0x2cd>
/home/yogi/src/os/aproj/kshell/src/kshell.c:408
        {
            print("\n");
 310100c:	83 ec 0c             	sub    esp,0xc
 310100f:	68 8c 15 10 03       	push   0x310158c
 3101014:	e8 e7 00 00 00       	call   3101100 <kShell+0x3a0>
 3101019:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:409
            goto doneGettingKeys;
 310101c:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:421
            commandWasFromThisBufferPtr=-1;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 310101d:	0f b6 85 ec fe ff ff 	movzx  eax,BYTE PTR [ebp-0x114]
 3101024:	84 c0                	test   al,al
 3101026:	75 3a                	jne    3101062 <kShell+0x302>
 3101028:	e9 cc fd ff ff       	jmp    3100df9 <kShell+0x99>
/home/yogi/src/os/aproj/kshell/src/kshell.c:413
            print("\n");
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 310102d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101030:	8d 50 01             	lea    edx,[eax+0x1]
 3101033:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3101036:	0f b6 95 eb fe ff ff 	movzx  edx,BYTE PTR [ebp-0x115]
 310103d:	88 94 05 ec fe ff ff 	mov    BYTE PTR [ebp+eax*1-0x114],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:414
            reprintCommand(lCommand);
 3101044:	83 ec 0c             	sub    esp,0xc
 3101047:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 310104d:	50                   	push   eax
 310104e:	e8 e7 fc ff ff       	call   3100d3a <reprintCommand>
 3101053:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:416
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
 3101056:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:418
        }
        goto getAKey;
 310105d:	e9 e9 fd ff ff       	jmp    3100e4b <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:423
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
            goto getACommand;
        if (commandWasFromThisBufferPtr == -1)
 3101062:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
 3101066:	75 12                	jne    310107a <kShell+0x31a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:424
            saveCommand(lCommand);
 3101068:	83 ec 0c             	sub    esp,0xc
 310106b:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3101071:	50                   	push   eax
 3101072:	e8 72 fc ff ff       	call   3100ce9 <saveCommand>
 3101077:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:425
        int i = findCommand(lCommand);
 310107a:	83 ec 0c             	sub    esp,0xc
 310107d:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3101083:	50                   	push   eax
 3101084:	e8 2a f8 ff ff       	call   31008b3 <findCommand>
 3101089:	83 c4 10             	add    esp,0x10
 310108c:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:426
        execInternalCommand(lCommand);
 310108f:	83 ec 0c             	sub    esp,0xc
 3101092:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3101098:	50                   	push   eax
 3101099:	e8 c6 f5 ff ff       	call   3100664 <execInternalCommand>
 310109e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:324
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 31010a1:	0f b6 05 48 23 10 03 	movzx  eax,BYTE PTR ds:0x3102348
 31010a8:	83 f0 01             	xor    eax,0x1
 31010ab:	84 c0                	test   al,al
 31010ad:	0f 85 46 fd ff ff    	jne    3100df9 <kShell+0x99>
/home/yogi/src/os/aproj/kshell/src/kshell.c:428
        if (commandWasFromThisBufferPtr == -1)
            saveCommand(lCommand);
        int i = findCommand(lCommand);
        execInternalCommand(lCommand);
    }
    free(sKShellProgramName);
 31010b3:	a1 40 23 10 03       	mov    eax,ds:0x3102340
 31010b8:	83 ec 0c             	sub    esp,0xc
 31010bb:	50                   	push   eax
 31010bc:	e8 df 01 00 00       	call   31012a0 <kShell+0x540>
 31010c1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:429
    return exitCode;
 31010c4:	a1 3c 23 10 03       	mov    eax,ds:0x310233c
/home/yogi/src/os/aproj/kshell/src/kshell.c:430
}
 31010c9:	c9                   	leave  
 31010ca:	c3                   	ret    

Disassembly of section .plt:

031010d0 <.plt>:
 31010d0:	ff 35 74 1f 10 03    	push   DWORD PTR ds:0x3101f74
 31010d6:	ff 25 78 1f 10 03    	jmp    DWORD PTR ds:0x3101f78
 31010dc:	00 00                	add    BYTE PTR [eax],al
 31010de:	00 00                	add    BYTE PTR [eax],al
 31010e0:	ff 25 7c 1f 10 03    	jmp    DWORD PTR ds:0x3101f7c
 31010e6:	68 00 00 00 00       	push   0x0
 31010eb:	e9 e0 ff ff ff       	jmp    31010d0 <kShell+0x370>
 31010f0:	ff 25 80 1f 10 03    	jmp    DWORD PTR ds:0x3101f80
 31010f6:	68 08 00 00 00       	push   0x8
 31010fb:	e9 d0 ff ff ff       	jmp    31010d0 <kShell+0x370>
 3101100:	ff 25 84 1f 10 03    	jmp    DWORD PTR ds:0x3101f84
 3101106:	68 10 00 00 00       	push   0x10
 310110b:	e9 c0 ff ff ff       	jmp    31010d0 <kShell+0x370>
 3101110:	ff 25 88 1f 10 03    	jmp    DWORD PTR ds:0x3101f88
 3101116:	68 18 00 00 00       	push   0x18
 310111b:	e9 b0 ff ff ff       	jmp    31010d0 <kShell+0x370>
 3101120:	ff 25 8c 1f 10 03    	jmp    DWORD PTR ds:0x3101f8c
 3101126:	68 20 00 00 00       	push   0x20
 310112b:	e9 a0 ff ff ff       	jmp    31010d0 <kShell+0x370>
 3101130:	ff 25 90 1f 10 03    	jmp    DWORD PTR ds:0x3101f90
 3101136:	68 28 00 00 00       	push   0x28
 310113b:	e9 90 ff ff ff       	jmp    31010d0 <kShell+0x370>
 3101140:	ff 25 94 1f 10 03    	jmp    DWORD PTR ds:0x3101f94
 3101146:	68 30 00 00 00       	push   0x30
 310114b:	e9 80 ff ff ff       	jmp    31010d0 <kShell+0x370>
 3101150:	ff 25 98 1f 10 03    	jmp    DWORD PTR ds:0x3101f98
 3101156:	68 38 00 00 00       	push   0x38
 310115b:	e9 70 ff ff ff       	jmp    31010d0 <kShell+0x370>
 3101160:	ff 25 9c 1f 10 03    	jmp    DWORD PTR ds:0x3101f9c
 3101166:	68 40 00 00 00       	push   0x40
 310116b:	e9 60 ff ff ff       	jmp    31010d0 <kShell+0x370>
 3101170:	ff 25 a0 1f 10 03    	jmp    DWORD PTR ds:0x3101fa0
 3101176:	68 48 00 00 00       	push   0x48
 310117b:	e9 50 ff ff ff       	jmp    31010d0 <kShell+0x370>
 3101180:	ff 25 a4 1f 10 03    	jmp    DWORD PTR ds:0x3101fa4
 3101186:	68 50 00 00 00       	push   0x50
 310118b:	e9 40 ff ff ff       	jmp    31010d0 <kShell+0x370>
 3101190:	ff 25 a8 1f 10 03    	jmp    DWORD PTR ds:0x3101fa8
 3101196:	68 58 00 00 00       	push   0x58
 310119b:	e9 30 ff ff ff       	jmp    31010d0 <kShell+0x370>
 31011a0:	ff 25 ac 1f 10 03    	jmp    DWORD PTR ds:0x3101fac
 31011a6:	68 60 00 00 00       	push   0x60
 31011ab:	e9 20 ff ff ff       	jmp    31010d0 <kShell+0x370>
 31011b0:	ff 25 b0 1f 10 03    	jmp    DWORD PTR ds:0x3101fb0
 31011b6:	68 68 00 00 00       	push   0x68
 31011bb:	e9 10 ff ff ff       	jmp    31010d0 <kShell+0x370>
 31011c0:	ff 25 b4 1f 10 03    	jmp    DWORD PTR ds:0x3101fb4
 31011c6:	68 70 00 00 00       	push   0x70
 31011cb:	e9 00 ff ff ff       	jmp    31010d0 <kShell+0x370>
 31011d0:	ff 25 b8 1f 10 03    	jmp    DWORD PTR ds:0x3101fb8
 31011d6:	68 78 00 00 00       	push   0x78
 31011db:	e9 f0 fe ff ff       	jmp    31010d0 <kShell+0x370>
 31011e0:	ff 25 bc 1f 10 03    	jmp    DWORD PTR ds:0x3101fbc
 31011e6:	68 80 00 00 00       	push   0x80
 31011eb:	e9 e0 fe ff ff       	jmp    31010d0 <kShell+0x370>
 31011f0:	ff 25 c0 1f 10 03    	jmp    DWORD PTR ds:0x3101fc0
 31011f6:	68 88 00 00 00       	push   0x88
 31011fb:	e9 d0 fe ff ff       	jmp    31010d0 <kShell+0x370>
 3101200:	ff 25 c4 1f 10 03    	jmp    DWORD PTR ds:0x3101fc4
 3101206:	68 90 00 00 00       	push   0x90
 310120b:	e9 c0 fe ff ff       	jmp    31010d0 <kShell+0x370>
 3101210:	ff 25 c8 1f 10 03    	jmp    DWORD PTR ds:0x3101fc8
 3101216:	68 98 00 00 00       	push   0x98
 310121b:	e9 b0 fe ff ff       	jmp    31010d0 <kShell+0x370>
 3101220:	ff 25 cc 1f 10 03    	jmp    DWORD PTR ds:0x3101fcc
 3101226:	68 a0 00 00 00       	push   0xa0
 310122b:	e9 a0 fe ff ff       	jmp    31010d0 <kShell+0x370>
 3101230:	ff 25 d0 1f 10 03    	jmp    DWORD PTR ds:0x3101fd0
 3101236:	68 a8 00 00 00       	push   0xa8
 310123b:	e9 90 fe ff ff       	jmp    31010d0 <kShell+0x370>
 3101240:	ff 25 d4 1f 10 03    	jmp    DWORD PTR ds:0x3101fd4
 3101246:	68 b0 00 00 00       	push   0xb0
 310124b:	e9 80 fe ff ff       	jmp    31010d0 <kShell+0x370>
 3101250:	ff 25 d8 1f 10 03    	jmp    DWORD PTR ds:0x3101fd8
 3101256:	68 b8 00 00 00       	push   0xb8
 310125b:	e9 70 fe ff ff       	jmp    31010d0 <kShell+0x370>
 3101260:	ff 25 dc 1f 10 03    	jmp    DWORD PTR ds:0x3101fdc
 3101266:	68 c0 00 00 00       	push   0xc0
 310126b:	e9 60 fe ff ff       	jmp    31010d0 <kShell+0x370>
 3101270:	ff 25 e0 1f 10 03    	jmp    DWORD PTR ds:0x3101fe0
 3101276:	68 c8 00 00 00       	push   0xc8
 310127b:	e9 50 fe ff ff       	jmp    31010d0 <kShell+0x370>
 3101280:	ff 25 e4 1f 10 03    	jmp    DWORD PTR ds:0x3101fe4
 3101286:	68 d0 00 00 00       	push   0xd0
 310128b:	e9 40 fe ff ff       	jmp    31010d0 <kShell+0x370>
 3101290:	ff 25 e8 1f 10 03    	jmp    DWORD PTR ds:0x3101fe8
 3101296:	68 d8 00 00 00       	push   0xd8
 310129b:	e9 30 fe ff ff       	jmp    31010d0 <kShell+0x370>
 31012a0:	ff 25 ec 1f 10 03    	jmp    DWORD PTR ds:0x3101fec
 31012a6:	68 e0 00 00 00       	push   0xe0
 31012ab:	e9 20 fe ff ff       	jmp    31010d0 <kShell+0x370>

Disassembly of section .rodata:

031012b0 <.rodata>:
 31012b0:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31012b2:	76 00                	jbe    31012b4 <kShell+0x554>
 31012b4:	50                   	push   eax
 31012b5:	72 69                	jb     3101320 <kShell+0x5c0>
 31012b7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31012b8:	74 20                	je     31012da <kShell+0x57a>
 31012ba:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31012bc:	76 69                	jbe    3101327 <kShell+0x5c7>
 31012be:	72 6f                	jb     310132f <kShell+0x5cf>
 31012c0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31012c1:	6d                   	ins    DWORD PTR es:[edi],dx
 31012c2:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31012c4:	74 00                	je     31012c6 <kShell+0x566>
 31012c6:	65                   	gs
 31012c7:	78 65                	js     310132e <kShell+0x5ce>
 31012c9:	63 00                	arpl   WORD PTR [eax],ax
 31012cb:	45                   	inc    ebp
 31012cc:	78 65                	js     3101333 <kShell+0x5d3>
 31012ce:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 31012d1:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 31012d5:	70 72                	jo     3101349 <kShell+0x5e9>
 31012d7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31012d8:	67 72 61             	addr16 jb 310133c <kShell+0x5dc>
 31012db:	6d                   	ins    DWORD PTR es:[edi],dx
 31012dc:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 31012df:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 31012e6:	20 
 31012e7:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 31012eb:	6c                   	ins    BYTE PTR es:[edi],dx
 31012ec:	6c                   	ins    BYTE PTR es:[edi],dx
 31012ed:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 31012f0:	6c                   	ins    BYTE PTR es:[edi],dx
 31012f1:	70 00                	jo     31012f3 <kShell+0x593>
 31012f3:	47                   	inc    edi
 31012f4:	65                   	gs
 31012f5:	74 20                	je     3101317 <kShell+0x5b7>
 31012f7:	68 65 6c 70 20       	push   0x20706c65
 31012fc:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101300:	73 20                	jae    3101322 <kShell+0x5c2>
 3101302:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3101309:	74 69                	je     3101374 <kShell+0x614>
 310130b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310130c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310130d:	29 00                	sub    DWORD PTR [eax],eax
 310130f:	70 77                	jo     3101388 <kShell+0x628>
 3101311:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 3101315:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 310131c:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3101320:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 3101324:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3101329:	79 00                	jns    310132b <kShell+0x5cb>
 310132b:	73 65                	jae    3101392 <kShell+0x632>
 310132d:	74 00                	je     310132f <kShell+0x5cf>
 310132f:	53                   	push   ebx
 3101330:	65                   	gs
 3101331:	74 20                	je     3101353 <kShell+0x5f3>
 3101333:	61                   	popa   
 3101334:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101335:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 3101338:	76 69                	jbe    31013a3 <kShell+0x643>
 310133a:	72 6f                	jb     31013ab <kShell+0x64b>
 310133c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310133d:	6d                   	ins    DWORD PTR es:[edi],dx
 310133e:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101340:	74 20                	je     3101362 <kShell+0x602>
 3101342:	76 61                	jbe    31013a5 <kShell+0x645>
 3101344:	72 69                	jb     31013af <kShell+0x64f>
 3101346:	61                   	popa   
 3101347:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 310134b:	73 6c                	jae    31013b9 <kShell+0x659>
 310134d:	65                   	gs
 310134e:	65                   	gs
 310134f:	70 00                	jo     3101351 <kShell+0x5f1>
 3101351:	53                   	push   ebx
 3101352:	6c                   	ins    BYTE PTR es:[edi],dx
 3101353:	65                   	gs
 3101354:	65                   	gs
 3101355:	70 20                	jo     3101377 <kShell+0x617>
 3101357:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3101359:	72 20                	jb     310137b <kShell+0x61b>
 310135b:	78 20                	js     310137d <kShell+0x61d>
 310135d:	73 65                	jae    31013c4 <kShell+0x664>
 310135f:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101362:	64                   	fs
 3101363:	73 00                	jae    3101365 <kShell+0x605>
 3101365:	74 69                	je     31013d0 <kShell+0x670>
 3101367:	6d                   	ins    DWORD PTR es:[edi],dx
 3101368:	65 00 00             	add    BYTE PTR gs:[eax],al
 310136b:	00 54 69 6d          	add    BYTE PTR [ecx+ebp*2+0x6d],dl
 310136f:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3101373:	70 72                	jo     31013e7 <kShell+0x687>
 3101375:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101376:	67 72 61             	addr16 jb 31013da <kShell+0x67a>
 3101379:	6d                   	ins    DWORD PTR es:[edi],dx
 310137a:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 310137d:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 3101384:	72 
 3101385:	75 6e                	jne    31013f5 <kShell+0x695>
 3101387:	73 2e                	jae    31013b7 <kShell+0x657>
 3101389:	0a 09                	or     cl,BYTE PTR [ecx]
 310138b:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 310138e:	61                   	popa   
 310138f:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 3101393:	74 69                	je     31013fe <kShell+0x69e>
 3101395:	6d                   	ins    DWORD PTR es:[edi],dx
 3101396:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 310139a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310139b:	67 72 61             	addr16 jb 31013ff <kShell+0x69f>
 310139e:	6d                   	ins    DWORD PTR es:[edi],dx
 310139f:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 31013a2:	61                   	popa   
 31013a3:	72 61                	jb     3101406 <kShell+0x6a6>
 31013a5:	6d                   	ins    DWORD PTR es:[edi],dx
 31013a6:	65                   	gs
 31013a7:	74 65                	je     310140e <kShell+0x6ae>
 31013a9:	72 73                	jb     310141e <kShell+0x6be>
 31013ab:	5d                   	pop    ebp
 31013ac:	00 25 73 0a 00 3d    	add    BYTE PTR ds:0x3d000a73,ah
 31013b2:	00 55 73             	add    BYTE PTR [ebp+0x73],dl
 31013b5:	61                   	popa   
 31013b6:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 31013ba:	73 65                	jae    3101421 <kShell+0x6c1>
 31013bc:	74 20                	je     31013de <kShell+0x67e>
 31013be:	76 61                	jbe    3101421 <kShell+0x6c1>
 31013c0:	72 69                	jb     310142b <kShell+0x6cb>
 31013c2:	61                   	popa   
 31013c3:	62 6c 65 3d          	bound  ebp,QWORD PTR [ebp+eiz*2+0x3d]
 31013c7:	76 61                	jbe    310142a <kShell+0x6ca>
 31013c9:	6c                   	ins    BYTE PTR es:[edi],dx
 31013ca:	75 65                	jne    3101431 <kShell+0x6d1>
 31013cc:	0a 00                	or     al,BYTE PTR [eax]
 31013ce:	4c                   	dec    esp
 31013cf:	41                   	inc    ecx
 31013d0:	53                   	push   ebx
 31013d1:	54                   	push   esp
 31013d2:	45                   	inc    ebp
 31013d3:	58                   	pop    eax
 31013d4:	49                   	dec    ecx
 31013d5:	54                   	push   esp
 31013d6:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 31013d9:	72 6f                	jb     310144a <kShell+0x6ea>
 31013db:	72 20                	jb     31013fd <kShell+0x69d>
 31013dd:	65                   	gs
 31013de:	78 65                	js     3101445 <kShell+0x6e5>
 31013e0:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 31013e3:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 31013ea:	00 46 6f             	add    BYTE PTR [esi+0x6f],al
 31013ed:	72 6b                	jb     310145a <kShell+0x6fa>
 31013ef:	20 65 72             	and    BYTE PTR [ebp+0x72],ah
 31013f2:	72 6f                	jb     3101463 <kShell+0x703>
 31013f4:	72 20                	jb     3101416 <kShell+0x6b6>
 31013f6:	25 75 00 43 61       	and    eax,0x61430075
 31013fb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31013fc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31013fd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31013fe:	74 20                	je     3101420 <kShell+0x6c0>
 3101400:	65                   	gs
 3101401:	78 65                	js     3101468 <kShell+0x708>
 3101403:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101406:	65 20 25 73 0a 00 25 	and    BYTE PTR gs:0x25000a73,ah
 310140d:	75 20                	jne    310142f <kShell+0x6cf>
 310140f:	74 69                	je     310147a <kShell+0x71a>
 3101411:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 3101414:	0a 00                	or     al,BYTE PTR [eax]
 3101416:	48                   	dec    eax
 3101417:	65                   	gs
 3101418:	6c                   	ins    BYTE PTR es:[edi],dx
 3101419:	70 3a                	jo     3101455 <kShell+0x6f5>
 310141b:	20 25 73 0a 00 09    	and    BYTE PTR ds:0x9000a73,ah
 3101421:	25 73 3a 20 25       	and    eax,0x25203a73
 3101426:	73 0a                	jae    3101432 <kShell+0x6d2>
 3101428:	00 00                	add    BYTE PTR [eax],al
 310142a:	00 00                	add    BYTE PTR [eax],al
 310142c:	52                   	push   edx
 310142d:	65                   	gs
 310142e:	71 75                	jno    31014a5 <kShell+0x745>
 3101430:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 3101437:	70 61                	jo     310149a <kShell+0x73a>
 3101439:	72 61                	jb     310149c <kShell+0x73c>
 310143b:	6d                   	ins    DWORD PTR es:[edi],dx
 310143c:	65                   	gs
 310143d:	74 65                	je     31014a4 <kShell+0x744>
 310143f:	72 20                	jb     3101461 <kShell+0x701>
 3101441:	77 68                	ja     31014ab <kShell+0x74b>
 3101443:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 310144a:	74 68                	je     31014b4 <kShell+0x754>
 310144c:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 3101450:	6d                   	ins    DWORD PTR es:[edi],dx
 3101451:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 3101454:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 3101457:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 310145a:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 310145d:	64                   	fs
 310145e:	73 20                	jae    3101480 <kShell+0x720>
 3101460:	74 6f                	je     31014d1 <kShell+0x771>
 3101462:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3101465:	65                   	gs
 3101466:	65                   	gs
 3101467:	70 0a                	jo     3101473 <kShell+0x713>
 3101469:	00 00                	add    BYTE PTR [eax],al
 310146b:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 310146e:	76 00                	jbe    3101470 <kShell+0x710>
 3101470:	50                   	push   eax
 3101471:	72 69                	jb     31014dc <kShell+0x77c>
 3101473:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101474:	74 20                	je     3101496 <kShell+0x736>
 3101476:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101478:	76 69                	jbe    31014e3 <kShell+0x783>
 310147a:	72 6f                	jb     31014eb <kShell+0x78b>
 310147c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310147d:	6d                   	ins    DWORD PTR es:[edi],dx
 310147e:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101480:	74 00                	je     3101482 <kShell+0x722>
 3101482:	65                   	gs
 3101483:	78 65                	js     31014ea <kShell+0x78a>
 3101485:	63 00                	arpl   WORD PTR [eax],ax
 3101487:	45                   	inc    ebp
 3101488:	78 65                	js     31014ef <kShell+0x78f>
 310148a:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 310148d:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3101491:	70 72                	jo     3101505 <kShell+0x7a5>
 3101493:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101494:	67 72 61             	addr16 jb 31014f8 <kShell+0x798>
 3101497:	6d                   	ins    DWORD PTR es:[edi],dx
 3101498:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 310149b:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 31014a2:	20 
 31014a3:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 31014a7:	6c                   	ins    BYTE PTR es:[edi],dx
 31014a8:	6c                   	ins    BYTE PTR es:[edi],dx
 31014a9:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 31014ac:	6c                   	ins    BYTE PTR es:[edi],dx
 31014ad:	70 00                	jo     31014af <kShell+0x74f>
 31014af:	47                   	inc    edi
 31014b0:	65                   	gs
 31014b1:	74 20                	je     31014d3 <kShell+0x773>
 31014b3:	68 65 6c 70 20       	push   0x20706c65
 31014b8:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 31014bc:	73 20                	jae    31014de <kShell+0x77e>
 31014be:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 31014c5:	74 69                	je     3101530 <kShell+0x7d0>
 31014c7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31014c8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31014c9:	29 00                	sub    DWORD PTR [eax],eax
 31014cb:	70 77                	jo     3101544 <kShell+0x7e4>
 31014cd:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 31014d1:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 31014d8:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 31014dc:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 31014e0:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 31014e5:	79 00                	jns    31014e7 <kShell+0x787>
 31014e7:	73 65                	jae    310154e <kShell+0x7ee>
 31014e9:	74 00                	je     31014eb <kShell+0x78b>
 31014eb:	53                   	push   ebx
 31014ec:	65                   	gs
 31014ed:	74 20                	je     310150f <kShell+0x7af>
 31014ef:	61                   	popa   
 31014f0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31014f1:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 31014f4:	76 69                	jbe    310155f <kShell+0x7ff>
 31014f6:	72 6f                	jb     3101567 <kShell+0x807>
 31014f8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31014f9:	6d                   	ins    DWORD PTR es:[edi],dx
 31014fa:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31014fc:	74 20                	je     310151e <kShell+0x7be>
 31014fe:	76 61                	jbe    3101561 <kShell+0x801>
 3101500:	72 69                	jb     310156b <kShell+0x80b>
 3101502:	61                   	popa   
 3101503:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 3101507:	73 6c                	jae    3101575 <kShell+0x815>
 3101509:	65                   	gs
 310150a:	65                   	gs
 310150b:	70 00                	jo     310150d <kShell+0x7ad>
 310150d:	53                   	push   ebx
 310150e:	6c                   	ins    BYTE PTR es:[edi],dx
 310150f:	65                   	gs
 3101510:	65                   	gs
 3101511:	70 20                	jo     3101533 <kShell+0x7d3>
 3101513:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3101515:	72 20                	jb     3101537 <kShell+0x7d7>
 3101517:	78 20                	js     3101539 <kShell+0x7d9>
 3101519:	73 65                	jae    3101580 <kShell+0x820>
 310151b:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 310151e:	64                   	fs
 310151f:	73 00                	jae    3101521 <kShell+0x7c1>
 3101521:	74 69                	je     310158c <kShell+0x82c>
 3101523:	6d                   	ins    DWORD PTR es:[edi],dx
 3101524:	65 00 00             	add    BYTE PTR gs:[eax],al
 3101527:	00 54 69 6d          	add    BYTE PTR [ecx+ebp*2+0x6d],dl
 310152b:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 310152f:	70 72                	jo     31015a3 <kShell+0x843>
 3101531:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101532:	67 72 61             	addr16 jb 3101596 <kShell+0x836>
 3101535:	6d                   	ins    DWORD PTR es:[edi],dx
 3101536:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3101539:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 3101540:	72 
 3101541:	75 6e                	jne    31015b1 <kShell+0x851>
 3101543:	73 2e                	jae    3101573 <kShell+0x813>
 3101545:	0a 09                	or     cl,BYTE PTR [ecx]
 3101547:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 310154a:	61                   	popa   
 310154b:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 310154f:	74 69                	je     31015ba <kShell+0x85a>
 3101551:	6d                   	ins    DWORD PTR es:[edi],dx
 3101552:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 3101556:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101557:	67 72 61             	addr16 jb 31015bb <kShell+0x85b>
 310155a:	6d                   	ins    DWORD PTR es:[edi],dx
 310155b:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 310155e:	61                   	popa   
 310155f:	72 61                	jb     31015c2 <kShell+0x862>
 3101561:	6d                   	ins    DWORD PTR es:[edi],dx
 3101562:	65                   	gs
 3101563:	74 65                	je     31015ca <kShell+0x86a>
 3101565:	72 73                	jb     31015da <kShell+0x87a>
 3101567:	5d                   	pop    ebp
 3101568:	00 3d 00 25 73 20    	add    BYTE PTR ds:0x20732500,bh
 310156e:	25 73 3e 20 00       	and    eax,0x203e73
 3101573:	25 73 00 20 09       	and    eax,0x9200073
 3101578:	0a 2d 2c 00 6b 53    	or     ch,BYTE PTR ds:0x536b002c
 310157e:	68 65 6c 6c 00       	push   0x6c6c65
 3101583:	43                   	inc    ebx
 3101584:	57                   	push   edi
 3101585:	44                   	inc    esp
 3101586:	00 1b                	add    BYTE PTR [ebx],bl
 3101588:	5b                   	pop    ebx
 3101589:	31 44 00 0a          	xor    DWORD PTR [eax+eax*1+0xa],eax
	...

Disassembly of section .eh_frame:

03101590 <.eh_frame>:
 3101590:	14 00                	adc    al,0x0
 3101592:	00 00                	add    BYTE PTR [eax],al
 3101594:	00 00                	add    BYTE PTR [eax],al
 3101596:	00 00                	add    BYTE PTR [eax],al
 3101598:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 310159b:	00 01                	add    BYTE PTR [ecx],al
 310159d:	7c 08                	jl     31015a7 <kShell+0x847>
 310159f:	01 1b                	add    DWORD PTR [ebx],ebx
 31015a1:	0c 04                	or     al,0x4
 31015a3:	04 88                	add    al,0x88
 31015a5:	01 00                	add    DWORD PTR [eax],eax
 31015a7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31015aa:	00 00                	add    BYTE PTR [eax],al
 31015ac:	1c 00                	sbb    al,0x0
 31015ae:	00 00                	add    BYTE PTR [eax],al
 31015b0:	50                   	push   eax
 31015b1:	ea ff ff 4f 00 00 00 	jmp    0x0:0x4fffff
 31015b8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31015bb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31015c1:	02 4b c5             	add    cl,BYTE PTR [ebx-0x3b]
 31015c4:	0c 04                	or     al,0x4
 31015c6:	04 00                	add    al,0x0
 31015c8:	1c 00                	sbb    al,0x0
 31015ca:	00 00                	add    BYTE PTR [eax],al
 31015cc:	3c 00                	cmp    al,0x0
 31015ce:	00 00                	add    BYTE PTR [eax],al
 31015d0:	7f ea                	jg     31015bc <kShell+0x85c>
 31015d2:	ff                   	(bad)  
 31015d3:	ff 5d 01             	call   FWORD PTR [ebp+0x1]
 31015d6:	00 00                	add    BYTE PTR [eax],al
 31015d8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31015db:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31015e1:	03 59 01             	add    ebx,DWORD PTR [ecx+0x1]
 31015e4:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31015e7:	04 1c                	add    al,0x1c
 31015e9:	00 00                	add    BYTE PTR [eax],al
 31015eb:	00 5c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bl
 31015ef:	00 bc eb ff ff 8b 00 	add    BYTE PTR [ebx+ebp*8+0x8bffff],bh
 31015f6:	00 00                	add    BYTE PTR [eax],al
 31015f8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31015fb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101601:	02 87 c5 0c 04 04    	add    al,BYTE PTR [edi+0x4040cc5]
 3101607:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310160a:	00 00                	add    BYTE PTR [eax],al
 310160c:	7c 00                	jl     310160e <kShell+0x8ae>
 310160e:	00 00                	add    BYTE PTR [eax],al
 3101610:	27                   	daa    
 3101611:	ec                   	in     al,dx
 3101612:	ff                   	(bad)  
 3101613:	ff b1 01 00 00 00    	push   DWORD PTR [ecx+0x1]
 3101619:	41                   	inc    ecx
 310161a:	0e                   	push   cs
 310161b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101621:	03 ad 01 c5 0c 04    	add    ebp,DWORD PTR [ebp+0x40cc501]
 3101627:	04 1c                	add    al,0x1c
 3101629:	00 00                	add    BYTE PTR [eax],al
 310162b:	00 9c 00 00 00 b8 ed 	add    BYTE PTR [eax+eax*1-0x12480000],bl
 3101632:	ff                   	(bad)  
 3101633:	ff 19                	call   FWORD PTR [ecx]
 3101635:	00 00                	add    BYTE PTR [eax],al
 3101637:	00 00                	add    BYTE PTR [eax],al
 3101639:	41                   	inc    ecx
 310163a:	0e                   	push   cs
 310163b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101641:	55                   	push   ebp
 3101642:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101645:	04 00                	add    al,0x0
 3101647:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310164a:	00 00                	add    BYTE PTR [eax],al
 310164c:	bc 00 00 00 b1       	mov    esp,0xb1000000
 3101651:	ed                   	in     eax,dx
 3101652:	ff                   	(bad)  
 3101653:	ff 19                	call   FWORD PTR [ecx]
 3101655:	00 00                	add    BYTE PTR [eax],al
 3101657:	00 00                	add    BYTE PTR [eax],al
 3101659:	41                   	inc    ecx
 310165a:	0e                   	push   cs
 310165b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101661:	55                   	push   ebp
 3101662:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101665:	04 00                	add    al,0x0
 3101667:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310166a:	00 00                	add    BYTE PTR [eax],al
 310166c:	dc 00                	fadd   QWORD PTR [eax]
 310166e:	00 00                	add    BYTE PTR [eax],al
 3101670:	aa                   	stos   BYTE PTR es:[edi],al
 3101671:	ed                   	in     eax,dx
 3101672:	ff                   	(bad)  
 3101673:	ff 58 00             	call   FWORD PTR [eax+0x0]
 3101676:	00 00                	add    BYTE PTR [eax],al
 3101678:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310167b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101681:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3101685:	04 04                	add    al,0x4
 3101687:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310168a:	00 00                	add    BYTE PTR [eax],al
 310168c:	fc                   	cld    
 310168d:	00 00                	add    BYTE PTR [eax],al
 310168f:	00 e2                	add    dl,ah
 3101691:	ed                   	in     eax,dx
 3101692:	ff                   	(bad)  
 3101693:	ff                   	(bad)  
 3101694:	3a 01                	cmp    al,BYTE PTR [ecx]
 3101696:	00 00                	add    BYTE PTR [eax],al
 3101698:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310169b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31016a1:	03 36                	add    esi,DWORD PTR [esi]
 31016a3:	01 c5                	add    ebp,eax
 31016a5:	0c 04                	or     al,0x4
 31016a7:	04 1c                	add    al,0x1c
 31016a9:	00 00                	add    BYTE PTR [eax],al
 31016ab:	00 1c 01             	add    BYTE PTR [ecx+eax*1],bl
 31016ae:	00 00                	add    BYTE PTR [eax],al
 31016b0:	fc                   	cld    
 31016b1:	ee                   	out    dx,al
 31016b2:	ff                   	(bad)  
 31016b3:	ff 4e 00             	dec    DWORD PTR [esi+0x0]
 31016b6:	00 00                	add    BYTE PTR [eax],al
 31016b8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31016bb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31016c1:	02 4a c5             	add    cl,BYTE PTR [edx-0x3b]
 31016c4:	0c 04                	or     al,0x4
 31016c6:	04 00                	add    al,0x0
 31016c8:	1c 00                	sbb    al,0x0
 31016ca:	00 00                	add    BYTE PTR [eax],al
 31016cc:	3c 01                	cmp    al,0x1
 31016ce:	00 00                	add    BYTE PTR [eax],al
 31016d0:	2a ef                	sub    ch,bh
 31016d2:	ff                   	(bad)  
 31016d3:	ff 67 00             	jmp    DWORD PTR [edi+0x0]
 31016d6:	00 00                	add    BYTE PTR [eax],al
 31016d8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31016db:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31016e1:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
 31016e4:	0c 04                	or     al,0x4
 31016e6:	04 00                	add    al,0x0
 31016e8:	20 00                	and    BYTE PTR [eax],al
 31016ea:	00 00                	add    BYTE PTR [eax],al
 31016ec:	5c                   	pop    esp
 31016ed:	01 00                	add    DWORD PTR [eax],eax
 31016ef:	00 74 ef ff          	add    BYTE PTR [edi+ebp*8-0x1],dh
 31016f3:	ff a6 00 00 00 00    	jmp    DWORD PTR [esi+0x0]
 31016f9:	41                   	inc    ecx
 31016fa:	0e                   	push   cs
 31016fb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101701:	44                   	inc    esp
 3101702:	83 03 02             	add    DWORD PTR [ebx],0x2
 3101705:	9e                   	sahf   
 3101706:	c5 c3 0c             	(bad)  
 3101709:	04 04                	add    al,0x4
 310170b:	00 20                	add    BYTE PTR [eax],ah
 310170d:	00 00                	add    BYTE PTR [eax],al
 310170f:	00 80 01 00 00 f6    	add    BYTE PTR [eax-0x9ffffff],al
 3101715:	ef                   	out    dx,eax
 3101716:	ff                   	(bad)  
 3101717:	ff a9 01 00 00 00    	jmp    FWORD PTR [ecx+0x1]
 310171d:	41                   	inc    ecx
 310171e:	0e                   	push   cs
 310171f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101725:	44                   	inc    esp
 3101726:	83 03 03             	add    DWORD PTR [ebx],0x3
 3101729:	a1 01 c5 c3 0c       	mov    eax,ds:0xcc3c501
 310172e:	04 04                	add    al,0x4
 3101730:	1c 00                	sbb    al,0x0
 3101732:	00 00                	add    BYTE PTR [eax],al
 3101734:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 3101735:	01 00                	add    DWORD PTR [eax],eax
 3101737:	00 7b f1             	add    BYTE PTR [ebx-0xf],bh
 310173a:	ff                   	(bad)  
 310173b:	ff 69 00             	jmp    FWORD PTR [ecx+0x0]
 310173e:	00 00                	add    BYTE PTR [eax],al
 3101740:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101743:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101749:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 310174c:	0c 04                	or     al,0x4
 310174e:	04 00                	add    al,0x0
 3101750:	1c 00                	sbb    al,0x0
 3101752:	00 00                	add    BYTE PTR [eax],al
 3101754:	c4 01                	les    eax,FWORD PTR [ecx]
 3101756:	00 00                	add    BYTE PTR [eax],al
 3101758:	c4                   	(bad)  
 3101759:	f1                   	icebp  
 310175a:	ff                   	(bad)  
 310175b:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3101761:	41                   	inc    ecx
 3101762:	0e                   	push   cs
 3101763:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101769:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 310176f:	04 20                	add    al,0x20
 3101771:	00 00                	add    BYTE PTR [eax],al
 3101773:	00 e4                	add    ah,ah
 3101775:	01 00                	add    DWORD PTR [eax],eax
 3101777:	00 32                	add    BYTE PTR [edx],dh
 3101779:	f4                   	hlt    
 310177a:	ff                   	(bad)  
 310177b:	ff 76 00             	push   DWORD PTR [esi+0x0]
 310177e:	00 00                	add    BYTE PTR [eax],al
 3101780:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101783:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101789:	44                   	inc    esp
 310178a:	83 03 02             	add    DWORD PTR [ebx],0x2
 310178d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310178e:	c5 c3 0c             	(bad)  
 3101791:	04 04                	add    al,0x4
 3101793:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101796:	00 00                	add    BYTE PTR [eax],al
 3101798:	08 02                	or     BYTE PTR [edx],al
 310179a:	00 00                	add    BYTE PTR [eax],al
 310179c:	84 f4                	test   ah,dh
 310179e:	ff                   	(bad)  
 310179f:	ff                   	(bad)  
 31017a0:	3d 00 00 00 00       	cmp    eax,0x0
 31017a5:	41                   	inc    ecx
 31017a6:	0e                   	push   cs
 31017a7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31017ad:	79 c5                	jns    3101774 <kShell+0xa14>
 31017af:	0c 04                	or     al,0x4
 31017b1:	04 00                	add    al,0x0
 31017b3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31017b6:	00 00                	add    BYTE PTR [eax],al
 31017b8:	28 02                	sub    BYTE PTR [edx],al
 31017ba:	00 00                	add    BYTE PTR [eax],al
 31017bc:	a1 f4 ff ff 8c       	mov    eax,ds:0x8cfffff4
 31017c1:	00 00                	add    BYTE PTR [eax],al
 31017c3:	00 00                	add    BYTE PTR [eax],al
 31017c5:	41                   	inc    ecx
 31017c6:	0e                   	push   cs
 31017c7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31017cd:	02 88 c5 0c 04 04    	add    cl,BYTE PTR [eax+0x4040cc5]
 31017d3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31017d6:	00 00                	add    BYTE PTR [eax],al
 31017d8:	48                   	dec    eax
 31017d9:	02 00                	add    al,BYTE PTR [eax]
 31017db:	00 0d f5 ff ff 2e    	add    BYTE PTR ds:0x2efffff5,cl
 31017e1:	00 00                	add    BYTE PTR [eax],al
 31017e3:	00 00                	add    BYTE PTR [eax],al
 31017e5:	41                   	inc    ecx
 31017e6:	0e                   	push   cs
 31017e7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31017ed:	6a c5                	push   0xffffffc5
 31017ef:	0c 04                	or     al,0x4
 31017f1:	04 00                	add    al,0x0
 31017f3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31017f6:	00 00                	add    BYTE PTR [eax],al
 31017f8:	68 02 00 00 1b       	push   0x1b000002
 31017fd:	f5                   	cmc    
 31017fe:	ff                   	(bad)  
 31017ff:	ff 23                	jmp    DWORD PTR [ebx]
 3101801:	00 00                	add    BYTE PTR [eax],al
 3101803:	00 00                	add    BYTE PTR [eax],al
 3101805:	41                   	inc    ecx
 3101806:	0e                   	push   cs
 3101807:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310180d:	5f                   	pop    edi
 310180e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101811:	04 00                	add    al,0x0
 3101813:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101816:	00 00                	add    BYTE PTR [eax],al
 3101818:	88 02                	mov    BYTE PTR [edx],al
 310181a:	00 00                	add    BYTE PTR [eax],al
 310181c:	1e                   	push   ds
 310181d:	f5                   	cmc    
 310181e:	ff                   	(bad)  
 310181f:	ff 26                	jmp    DWORD PTR [esi]
 3101821:	00 00                	add    BYTE PTR [eax],al
 3101823:	00 00                	add    BYTE PTR [eax],al
 3101825:	41                   	inc    ecx
 3101826:	0e                   	push   cs
 3101827:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310182d:	62                   	(bad)  
 310182e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101831:	04 00                	add    al,0x0
 3101833:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101836:	00 00                	add    BYTE PTR [eax],al
 3101838:	a8 02                	test   al,0x2
 310183a:	00 00                	add    BYTE PTR [eax],al
 310183c:	24 f5                	and    al,0xf5
 310183e:	ff                   	(bad)  
 310183f:	ff 6b 03             	jmp    FWORD PTR [ebx+0x3]
 3101842:	00 00                	add    BYTE PTR [eax],al
 3101844:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101847:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310184d:	03 67 03             	add    esp,DWORD PTR [edi+0x3]
 3101850:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101853:	04                   	.byte 0x4

Disassembly of section .interp:

03101854 <.interp>:
 3101854:	2f                   	das    
 3101855:	6c                   	ins    BYTE PTR es:[edi],dx
 3101856:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 310185d:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3101864:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03101868 <.dynsym>:
	...
 3101878:	09 00                	or     DWORD PTR [eax],eax
	...
 3101882:	00 00                	add    BYTE PTR [eax],al
 3101884:	12 00                	adc    al,BYTE PTR [eax]
 3101886:	00 00                	add    BYTE PTR [eax],al
 3101888:	10 00                	adc    BYTE PTR [eax],al
	...
 3101892:	00 00                	add    BYTE PTR [eax],al
 3101894:	12 00                	adc    al,BYTE PTR [eax]
 3101896:	00 00                	add    BYTE PTR [eax],al
 3101898:	18 00                	sbb    BYTE PTR [eax],al
	...
 31018a2:	00 00                	add    BYTE PTR [eax],al
 31018a4:	12 00                	adc    al,BYTE PTR [eax]
 31018a6:	00 00                	add    BYTE PTR [eax],al
 31018a8:	1e                   	push   ds
	...
 31018b1:	00 00                	add    BYTE PTR [eax],al
 31018b3:	00 12                	add    BYTE PTR [edx],dl
 31018b5:	00 00                	add    BYTE PTR [eax],al
 31018b7:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
 31018bd:	00 00                	add    BYTE PTR [eax],al
 31018bf:	00 00                	add    BYTE PTR [eax],al
 31018c1:	00 00                	add    BYTE PTR [eax],al
 31018c3:	00 12                	add    BYTE PTR [edx],dl
 31018c5:	00 00                	add    BYTE PTR [eax],al
 31018c7:	00 2e                	add    BYTE PTR [esi],ch
	...
 31018d1:	00 00                	add    BYTE PTR [eax],al
 31018d3:	00 12                	add    BYTE PTR [edx],dl
 31018d5:	00 00                	add    BYTE PTR [eax],al
 31018d7:	00 35 00 00 00 00    	add    BYTE PTR ds:0x0,dh
 31018dd:	00 00                	add    BYTE PTR [eax],al
 31018df:	00 00                	add    BYTE PTR [eax],al
 31018e1:	00 00                	add    BYTE PTR [eax],al
 31018e3:	00 12                	add    BYTE PTR [edx],dl
 31018e5:	00 00                	add    BYTE PTR [eax],al
 31018e7:	00 3a                	add    BYTE PTR [edx],bh
	...
 31018f1:	00 00                	add    BYTE PTR [eax],al
 31018f3:	00 12                	add    BYTE PTR [edx],dl
 31018f5:	00 00                	add    BYTE PTR [eax],al
 31018f7:	00 41 00             	add    BYTE PTR [ecx+0x0],al
	...
 3101902:	00 00                	add    BYTE PTR [eax],al
 3101904:	12 00                	adc    al,BYTE PTR [eax]
 3101906:	00 00                	add    BYTE PTR [eax],al
 3101908:	48                   	dec    eax
	...
 3101911:	00 00                	add    BYTE PTR [eax],al
 3101913:	00 12                	add    BYTE PTR [edx],dl
 3101915:	00 00                	add    BYTE PTR [eax],al
 3101917:	00 4e 00             	add    BYTE PTR [esi+0x0],cl
	...
 3101922:	00 00                	add    BYTE PTR [eax],al
 3101924:	12 00                	adc    al,BYTE PTR [eax]
 3101926:	00 00                	add    BYTE PTR [eax],al
 3101928:	5c                   	pop    esp
	...
 3101931:	00 00                	add    BYTE PTR [eax],al
 3101933:	00 12                	add    BYTE PTR [edx],dl
 3101935:	00 00                	add    BYTE PTR [eax],al
 3101937:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
	...
 3101943:	00 12                	add    BYTE PTR [edx],dl
 3101945:	00 00                	add    BYTE PTR [eax],al
 3101947:	00 69 00             	add    BYTE PTR [ecx+0x0],ch
	...
 3101952:	00 00                	add    BYTE PTR [eax],al
 3101954:	12 00                	adc    al,BYTE PTR [eax]
 3101956:	00 00                	add    BYTE PTR [eax],al
 3101958:	72 00                	jb     310195a <kShell+0xbfa>
	...
 3101962:	00 00                	add    BYTE PTR [eax],al
 3101964:	12 00                	adc    al,BYTE PTR [eax]
 3101966:	00 00                	add    BYTE PTR [eax],al
 3101968:	77 00                	ja     310196a <kShell+0xc0a>
	...
 3101972:	00 00                	add    BYTE PTR [eax],al
 3101974:	12 00                	adc    al,BYTE PTR [eax]
 3101976:	00 00                	add    BYTE PTR [eax],al
 3101978:	7e 00                	jle    310197a <kShell+0xc1a>
	...
 3101982:	00 00                	add    BYTE PTR [eax],al
 3101984:	12 00                	adc    al,BYTE PTR [eax]
 3101986:	00 00                	add    BYTE PTR [eax],al
 3101988:	83 00 00             	add    DWORD PTR [eax],0x0
	...
 3101993:	00 12                	add    BYTE PTR [edx],dl
 3101995:	00 00                	add    BYTE PTR [eax],al
 3101997:	00 8b 00 00 00 00    	add    BYTE PTR [ebx+0x0],cl
 310199d:	00 00                	add    BYTE PTR [eax],al
 310199f:	00 00                	add    BYTE PTR [eax],al
 31019a1:	00 00                	add    BYTE PTR [eax],al
 31019a3:	00 12                	add    BYTE PTR [edx],dl
 31019a5:	00 00                	add    BYTE PTR [eax],al
 31019a7:	00 93 00 00 00 00    	add    BYTE PTR [ebx+0x0],dl
 31019ad:	00 00                	add    BYTE PTR [eax],al
 31019af:	00 00                	add    BYTE PTR [eax],al
 31019b1:	00 00                	add    BYTE PTR [eax],al
 31019b3:	00 12                	add    BYTE PTR [edx],dl
 31019b5:	00 00                	add    BYTE PTR [eax],al
 31019b7:	00 9a 00 00 00 00    	add    BYTE PTR [edx+0x0],bl
 31019bd:	00 00                	add    BYTE PTR [eax],al
 31019bf:	00 00                	add    BYTE PTR [eax],al
 31019c1:	00 00                	add    BYTE PTR [eax],al
 31019c3:	00 12                	add    BYTE PTR [edx],dl
 31019c5:	00 00                	add    BYTE PTR [eax],al
 31019c7:	00 a1 00 00 00 00    	add    BYTE PTR [ecx+0x0],ah
 31019cd:	00 00                	add    BYTE PTR [eax],al
 31019cf:	00 00                	add    BYTE PTR [eax],al
 31019d1:	00 00                	add    BYTE PTR [eax],al
 31019d3:	00 12                	add    BYTE PTR [edx],dl
 31019d5:	00 00                	add    BYTE PTR [eax],al
 31019d7:	00 a6 00 00 00 00    	add    BYTE PTR [esi+0x0],ah
 31019dd:	00 00                	add    BYTE PTR [eax],al
 31019df:	00 00                	add    BYTE PTR [eax],al
 31019e1:	00 00                	add    BYTE PTR [eax],al
 31019e3:	00 12                	add    BYTE PTR [edx],dl
 31019e5:	00 00                	add    BYTE PTR [eax],al
 31019e7:	00 ad 00 00 00 00    	add    BYTE PTR [ebp+0x0],ch
 31019ed:	00 00                	add    BYTE PTR [eax],al
 31019ef:	00 00                	add    BYTE PTR [eax],al
 31019f1:	00 00                	add    BYTE PTR [eax],al
 31019f3:	00 12                	add    BYTE PTR [edx],dl
 31019f5:	00 00                	add    BYTE PTR [eax],al
 31019f7:	00 b5 00 00 00 00    	add    BYTE PTR [ebp+0x0],dh
 31019fd:	00 00                	add    BYTE PTR [eax],al
 31019ff:	00 00                	add    BYTE PTR [eax],al
 3101a01:	00 00                	add    BYTE PTR [eax],al
 3101a03:	00 12                	add    BYTE PTR [edx],dl
 3101a05:	00 00                	add    BYTE PTR [eax],al
 3101a07:	00 bc 00 00 00 00 00 	add    BYTE PTR [eax+eax*1+0x0],bh
 3101a0e:	00 00                	add    BYTE PTR [eax],al
 3101a10:	00 00                	add    BYTE PTR [eax],al
 3101a12:	00 00                	add    BYTE PTR [eax],al
 3101a14:	12 00                	adc    al,BYTE PTR [eax]
 3101a16:	00 00                	add    BYTE PTR [eax],al
 3101a18:	c1 00 00             	rol    DWORD PTR [eax],0x0
	...
 3101a23:	00 12                	add    BYTE PTR [edx],dl
 3101a25:	00 00                	add    BYTE PTR [eax],al
 3101a27:	00 c8                	add    al,cl
	...
 3101a31:	00 00                	add    BYTE PTR [eax],al
 3101a33:	00 12                	add    BYTE PTR [edx],dl
 3101a35:	00 00                	add    BYTE PTR [eax],al
 3101a37:	00 ce                	add    dh,cl
	...
 3101a41:	00 00                	add    BYTE PTR [eax],al
 3101a43:	00 12                	add    BYTE PTR [edx],dl
 3101a45:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

03101a48 <.dynstr>:
 3101a48:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3101a4c:	63 2e                	arpl   WORD PTR [esi],bp
 3101a4e:	73 6f                	jae    3101abf <kShell+0xd5f>
 3101a50:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101a53:	72 63                	jb     3101ab8 <kShell+0xd58>
 3101a55:	70 79                	jo     3101ad0 <kShell+0xd70>
 3101a57:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3101a5a:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3101a61:	72 
 3101a62:	69 6e 74 00 70 72 69 	imul   ebp,DWORD PTR [esi+0x74],0x69727000
 3101a69:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101a6a:	74 66                	je     3101ad2 <kShell+0xd72>
 3101a6c:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 3101a6f:	73 65                	jae    3101ad6 <kShell+0xd76>
 3101a71:	74 52                	je     3101ac5 <kShell+0xd65>
 3101a73:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101a74:	77 00                	ja     3101a76 <kShell+0xd16>
 3101a76:	67                   	addr16
 3101a77:	65                   	gs
 3101a78:	74 65                	je     3101adf <kShell+0xd7f>
 3101a7a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101a7b:	76 00                	jbe    3101a7d <kShell+0xd1d>
 3101a7d:	67                   	addr16
 3101a7e:	65                   	gs
 3101a7f:	74 73                	je     3101af4 <kShell+0xd94>
 3101a81:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3101a84:	6d                   	ins    DWORD PTR es:[edi],dx
 3101a85:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3101a88:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 3101a8b:	6c                   	ins    BYTE PTR es:[edi],dx
 3101a8c:	6c                   	ins    BYTE PTR es:[edi],dx
 3101a8d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101a8e:	63 00                	arpl   WORD PTR [eax],ax
 3101a90:	73 6c                	jae    3101afe <kShell+0xd9e>
 3101a92:	65                   	gs
 3101a93:	65                   	gs
 3101a94:	70 00                	jo     3101a96 <kShell+0xd36>
 3101a96:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 3101a99:	6c                   	ins    BYTE PTR es:[edi],dx
 3101a9a:	69 6e 65 54 6f 41 72 	imul   ebp,DWORD PTR [esi+0x65],0x72416f54
 3101aa1:	67 76 00             	addr16 jbe 3101aa4 <kShell+0xd44>
 3101aa4:	73 74                	jae    3101b1a <kShell+0xdba>
 3101aa6:	72 74                	jb     3101b1c <kShell+0xdbc>
 3101aa8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101aa9:	75 6c                	jne    3101b17 <kShell+0xdb7>
 3101aab:	00 69 74             	add    BYTE PTR [ecx+0x74],ch
 3101aae:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101aaf:	61                   	popa   
 3101ab0:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101ab3:	74 74                	je     3101b29 <kShell+0xdc9>
 3101ab5:	69 63 6b 73 00 65 78 	imul   esp,DWORD PTR [ebx+0x6b],0x78650073
 3101abc:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 3101abf:	73 74                	jae    3101b35 <kShell+0xdd5>
 3101ac1:	72 73                	jb     3101b36 <kShell+0xdd6>
 3101ac3:	74 72                	je     3101b37 <kShell+0xdd7>
 3101ac5:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 3101ac8:	61                   	popa   
 3101ac9:	64 00 73 74          	add    BYTE PTR fs:[ebx+0x74],dh
 3101acd:	72 6e                	jb     3101b3d <kShell+0xddd>
 3101acf:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 3101ad2:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101ad5:	72 6e                	jb     3101b45 <kShell+0xde5>
 3101ad7:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3101ada:	00 73 65             	add    BYTE PTR [ebx+0x65],dh
 3101add:	74 65                	je     3101b44 <kShell+0xde4>
 3101adf:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101ae0:	76 00                	jbe    3101ae2 <kShell+0xd82>
 3101ae2:	73 74                	jae    3101b58 <kShell+0xdf8>
 3101ae4:	72 74                	jb     3101b5a <kShell+0xdfa>
 3101ae6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101ae7:	6b 00 66             	imul   eax,DWORD PTR [eax],0x66
 3101aea:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101aeb:	72 6b                	jb     3101b58 <kShell+0xdf8>
 3101aed:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3101af0:	6d                   	ins    DWORD PTR es:[edi],dx
 3101af1:	73 65                	jae    3101b58 <kShell+0xdf8>
 3101af3:	74 00                	je     3101af5 <kShell+0xd95>
 3101af5:	73 74                	jae    3101b6b <kShell+0xe0b>
 3101af7:	72 74                	jb     3101b6d <kShell+0xe0d>
 3101af9:	72 69                	jb     3101b64 <kShell+0xe04>
 3101afb:	6d                   	ins    DWORD PTR es:[edi],dx
 3101afc:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101aff:	74 63                	je     3101b64 <kShell+0xe04>
 3101b01:	77 64                	ja     3101b67 <kShell+0xe07>
 3101b03:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101b06:	69 74 00 73 74 72 6c 	imul   esi,DWORD PTR [eax+eax*1+0x73],0x656c7274
 3101b0d:	65 
 3101b0e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101b0f:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101b12:	65 63 61 00          	arpl   WORD PTR gs:[ecx+0x0],sp
 3101b16:	66                   	data16
 3101b17:	72 65                	jb     3101b7e <kShell+0xe1e>
 3101b19:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 3101b1c:	2e                   	cs
 3101b1d:	2f                   	das    
 3101b1e:	6c                   	ins    BYTE PTR es:[edi],dx
 3101b1f:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3101b26:	4f                   	dec    edi
 3101b27:	53                   	push   ebx
 3101b28:	2f                   	das    
 3101b29:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3101b30:	62 
 3101b31:	75 67                	jne    3101b9a <kShell+0xe3a>
 3101b33:	2f                   	das    
 3101b34:	47                   	inc    edi
 3101b35:	4e                   	dec    esi
 3101b36:	55                   	push   ebp
 3101b37:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3101b3c:	78 00                	js     3101b3e <kShell+0xdde>

Disassembly of section .hash:

03101b40 <.hash>:
 3101b40:	11 00                	adc    DWORD PTR [eax],eax
 3101b42:	00 00                	add    BYTE PTR [eax],al
 3101b44:	1e                   	push   ds
 3101b45:	00 00                	add    BYTE PTR [eax],al
 3101b47:	00 10                	add    BYTE PTR [eax],dl
 3101b49:	00 00                	add    BYTE PTR [eax],al
 3101b4b:	00 00                	add    BYTE PTR [eax],al
 3101b4d:	00 00                	add    BYTE PTR [eax],al
 3101b4f:	00 16                	add    BYTE PTR [esi],dl
 3101b51:	00 00                	add    BYTE PTR [eax],al
 3101b53:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 3101b56:	00 00                	add    BYTE PTR [eax],al
 3101b58:	1b 00                	sbb    eax,DWORD PTR [eax]
 3101b5a:	00 00                	add    BYTE PTR [eax],al
 3101b5c:	00 00                	add    BYTE PTR [eax],al
 3101b5e:	00 00                	add    BYTE PTR [eax],al
 3101b60:	13 00                	adc    eax,DWORD PTR [eax]
 3101b62:	00 00                	add    BYTE PTR [eax],al
 3101b64:	11 00                	adc    DWORD PTR [eax],eax
 3101b66:	00 00                	add    BYTE PTR [eax],al
 3101b68:	08 00                	or     BYTE PTR [eax],al
 3101b6a:	00 00                	add    BYTE PTR [eax],al
 3101b6c:	00 00                	add    BYTE PTR [eax],al
 3101b6e:	00 00                	add    BYTE PTR [eax],al
 3101b70:	18 00                	sbb    BYTE PTR [eax],al
 3101b72:	00 00                	add    BYTE PTR [eax],al
 3101b74:	12 00                	adc    al,BYTE PTR [eax]
 3101b76:	00 00                	add    BYTE PTR [eax],al
 3101b78:	1d 00 00 00 1a       	sbb    eax,0x1a000000
 3101b7d:	00 00                	add    BYTE PTR [eax],al
 3101b7f:	00 0d 00 00 00 05    	add    BYTE PTR ds:0x5000000,cl
 3101b85:	00 00                	add    BYTE PTR [eax],al
 3101b87:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
	...
 3101ba9:	00 00                	add    BYTE PTR [eax],al
 3101bab:	00 06                	add    BYTE PTR [esi],al
 3101bad:	00 00                	add    BYTE PTR [eax],al
 3101baf:	00 04 00             	add    BYTE PTR [eax+eax*1],al
	...
 3101bbe:	00 00                	add    BYTE PTR [eax],al
 3101bc0:	07                   	pop    es
 3101bc1:	00 00                	add    BYTE PTR [eax],al
 3101bc3:	00 0a                	add    BYTE PTR [edx],cl
 3101bc5:	00 00                	add    BYTE PTR [eax],al
 3101bc7:	00 0e                	add    BYTE PTR [esi],cl
 3101bc9:	00 00                	add    BYTE PTR [eax],al
 3101bcb:	00 0f                	add    BYTE PTR [edi],cl
 3101bcd:	00 00                	add    BYTE PTR [eax],al
 3101bcf:	00 03                	add    BYTE PTR [ebx],al
 3101bd1:	00 00                	add    BYTE PTR [eax],al
 3101bd3:	00 00                	add    BYTE PTR [eax],al
 3101bd5:	00 00                	add    BYTE PTR [eax],al
 3101bd7:	00 0b                	add    BYTE PTR [ebx],cl
 3101bd9:	00 00                	add    BYTE PTR [eax],al
 3101bdb:	00 02                	add    BYTE PTR [edx],al
	...
 3101be5:	00 00                	add    BYTE PTR [eax],al
 3101be7:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
 3101bea:	00 00                	add    BYTE PTR [eax],al
 3101bec:	09 00                	or     DWORD PTR [eax],eax
 3101bee:	00 00                	add    BYTE PTR [eax],al
 3101bf0:	17                   	pop    ss
 3101bf1:	00 00                	add    BYTE PTR [eax],al
 3101bf3:	00 19                	add    BYTE PTR [ecx],bl
 3101bf5:	00 00                	add    BYTE PTR [eax],al
 3101bf7:	00 00                	add    BYTE PTR [eax],al
 3101bf9:	00 00                	add    BYTE PTR [eax],al
 3101bfb:	00 01                	add    BYTE PTR [ecx],al
 3101bfd:	00 00                	add    BYTE PTR [eax],al
 3101bff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
	...

Disassembly of section .eh_frame:

03101c04 <.eh_frame>:
 3101c04:	14 00                	adc    al,0x0
 3101c06:	00 00                	add    BYTE PTR [eax],al
 3101c08:	00 00                	add    BYTE PTR [eax],al
 3101c0a:	00 00                	add    BYTE PTR [eax],al
 3101c0c:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3101c0f:	00 01                	add    BYTE PTR [ecx],al
 3101c11:	7c 08                	jl     3101c1b <kShell+0xebb>
 3101c13:	01 1b                	add    DWORD PTR [ebx],ebx
 3101c15:	0c 04                	or     al,0x4
 3101c17:	04 88                	add    al,0x88
 3101c19:	01 00                	add    DWORD PTR [eax],eax
 3101c1b:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3101c1e:	00 00                	add    BYTE PTR [eax],al
 3101c20:	1c 00                	sbb    al,0x0
 3101c22:	00 00                	add    BYTE PTR [eax],al
 3101c24:	ac                   	lods   al,BYTE PTR ds:[esi]
 3101c25:	f4                   	hlt    
 3101c26:	ff                   	(bad)  
 3101c27:	ff e0                	jmp    eax
 3101c29:	01 00                	add    DWORD PTR [eax],eax
 3101c2b:	00 00                	add    BYTE PTR [eax],al
 3101c2d:	0e                   	push   cs
 3101c2e:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3101c31:	0c 4a                	or     al,0x4a
 3101c33:	0f 0b                	ud2    
 3101c35:	74 04                	je     3101c3b <kShell+0xedb>
 3101c37:	78 00                	js     3101c39 <kShell+0xed9>
 3101c39:	3f                   	aas    
 3101c3a:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3101c3c:	2a 32                	sub    dh,BYTE PTR [edx]
 3101c3e:	24 22                	and    al,0x22
 3101c40:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03101c44 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3101c44:	01 1b                	add    DWORD PTR [ebx],ebx
 3101c46:	03 3b                	add    edi,DWORD PTR [ebx]
 3101c48:	48                   	dec    eax
 3101c49:	f9                   	stc    
 3101c4a:	ff                   	(bad)  
 3101c4b:	ff 15 00 00 00 bc    	call   DWORD PTR ds:0xbc000000
 3101c51:	e3 ff                	jecxz  3101c52 <__GNU_EH_FRAME_HDR+0xe>
 3101c53:	ff 64 f9 ff          	jmp    DWORD PTR [ecx+edi*8-0x1]
 3101c57:	ff 0b                	dec    DWORD PTR [ebx]
 3101c59:	e4 ff                	in     al,0xff
 3101c5b:	ff 84 f9 ff ff 68 e5 	inc    DWORD PTR [ecx+edi*8-0x1a970001]
 3101c62:	ff                   	(bad)  
 3101c63:	ff a4 f9 ff ff f3 e5 	jmp    DWORD PTR [ecx+edi*8-0x1a0c0001]
 3101c6a:	ff                   	(bad)  
 3101c6b:	ff c4                	inc    esp
 3101c6d:	f9                   	stc    
 3101c6e:	ff                   	(bad)  
 3101c6f:	ff a4 e7 ff ff e4 f9 	jmp    DWORD PTR [edi+eiz*8-0x61b0001]
 3101c76:	ff                   	(bad)  
 3101c77:	ff                   	(bad)  
 3101c78:	bd e7 ff ff 04       	mov    ebp,0x4ffffe7
 3101c7d:	fa                   	cli    
 3101c7e:	ff                   	(bad)  
 3101c7f:	ff d6                	call   esi
 3101c81:	e7 ff                	out    0xff,eax
 3101c83:	ff 24 fa             	jmp    DWORD PTR [edx+edi*8]
 3101c86:	ff                   	(bad)  
 3101c87:	ff 2e                	jmp    FWORD PTR [esi]
 3101c89:	e8 ff ff 44 fa       	call   fd551c8d <commandHistory+0xfa44f92d>
 3101c8e:	ff                   	(bad)  
 3101c8f:	ff 68 e9             	jmp    FWORD PTR [eax-0x17]
 3101c92:	ff                   	(bad)  
 3101c93:	ff 64 fa ff          	jmp    DWORD PTR [edx+edi*8-0x1]
 3101c97:	ff b6 e9 ff ff 84    	push   DWORD PTR [esi-0x7b000017]
 3101c9d:	fa                   	cli    
 3101c9e:	ff                   	(bad)  
 3101c9f:	ff 20                	jmp    DWORD PTR [eax]
 3101ca1:	ea ff ff a4 fa ff ff 	jmp    0xffff:0xfaa4ffff
 3101ca8:	c6                   	(bad)  
 3101ca9:	ea ff ff c8 fa ff ff 	jmp    0xffff:0xfac8ffff
 3101cb0:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101cb1:	ec                   	in     al,dx
 3101cb2:	ff                   	(bad)  
 3101cb3:	ff ec                	jmp    <internal disassembler error>
 3101cb5:	fa                   	cli    
 3101cb6:	ff                   	(bad)  
 3101cb7:	ff d8                	call   <internal disassembler error>
 3101cb9:	ec                   	in     al,dx
 3101cba:	ff                   	(bad)  
 3101cbb:	ff 0c fb             	dec    DWORD PTR [ebx+edi*8]
 3101cbe:	ff                   	(bad)  
 3101cbf:	ff 66 ef             	jmp    DWORD PTR [esi-0x11]
 3101cc2:	ff                   	(bad)  
 3101cc3:	ff 2c fb             	jmp    FWORD PTR [ebx+edi*8]
 3101cc6:	ff                   	(bad)  
 3101cc7:	ff dc                	call   <internal disassembler error>
 3101cc9:	ef                   	out    dx,eax
 3101cca:	ff                   	(bad)  
 3101ccb:	ff 50 fb             	call   DWORD PTR [eax-0x5]
 3101cce:	ff                   	(bad)  
 3101ccf:	ff 19                	call   FWORD PTR [ecx]
 3101cd1:	f0 ff                	lock (bad) 
 3101cd3:	ff 70 fb             	push   DWORD PTR [eax-0x5]
 3101cd6:	ff                   	(bad)  
 3101cd7:	ff a5 f0 ff ff 90    	jmp    DWORD PTR [ebp-0x6f000010]
 3101cdd:	fb                   	sti    
 3101cde:	ff                   	(bad)  
 3101cdf:	ff d3                	call   ebx
 3101ce1:	f0 ff                	lock (bad) 
 3101ce3:	ff b0 fb ff ff f6    	push   DWORD PTR [eax-0x9000005]
 3101ce9:	f0 ff                	lock (bad) 
 3101ceb:	ff d0                	call   eax
 3101ced:	fb                   	sti    
 3101cee:	ff                   	(bad)  
 3101cef:	ff 1c f1             	call   FWORD PTR [ecx+esi*8]
 3101cf2:	ff                   	(bad)  
 3101cf3:	ff f0                	push   eax
 3101cf5:	fb                   	sti    
 3101cf6:	ff                   	(bad)  
 3101cf7:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03101cf8 <.rel.dyn>:
 3101cf8:	7c 1f                	jl     3101d19 <__GNU_EH_FRAME_HDR+0xd5>
 3101cfa:	10 03                	adc    BYTE PTR [ebx],al
 3101cfc:	07                   	pop    es
 3101cfd:	01 00                	add    DWORD PTR [eax],eax
 3101cff:	00 80 1f 10 03 07    	add    BYTE PTR [eax+0x703101f],al
 3101d05:	02 00                	add    al,BYTE PTR [eax]
 3101d07:	00 84 1f 10 03 07 03 	add    BYTE PTR [edi+ebx*1+0x3070310],al
 3101d0e:	00 00                	add    BYTE PTR [eax],al
 3101d10:	88 1f                	mov    BYTE PTR [edi],bl
 3101d12:	10 03                	adc    BYTE PTR [ebx],al
 3101d14:	07                   	pop    es
 3101d15:	04 00                	add    al,0x0
 3101d17:	00 8c 1f 10 03 07 05 	add    BYTE PTR [edi+ebx*1+0x5070310],cl
 3101d1e:	00 00                	add    BYTE PTR [eax],al
 3101d20:	90                   	nop
 3101d21:	1f                   	pop    ds
 3101d22:	10 03                	adc    BYTE PTR [ebx],al
 3101d24:	07                   	pop    es
 3101d25:	06                   	push   es
 3101d26:	00 00                	add    BYTE PTR [eax],al
 3101d28:	94                   	xchg   esp,eax
 3101d29:	1f                   	pop    ds
 3101d2a:	10 03                	adc    BYTE PTR [ebx],al
 3101d2c:	07                   	pop    es
 3101d2d:	07                   	pop    es
 3101d2e:	00 00                	add    BYTE PTR [eax],al
 3101d30:	98                   	cwde   
 3101d31:	1f                   	pop    ds
 3101d32:	10 03                	adc    BYTE PTR [ebx],al
 3101d34:	07                   	pop    es
 3101d35:	08 00                	or     BYTE PTR [eax],al
 3101d37:	00 9c 1f 10 03 07 09 	add    BYTE PTR [edi+ebx*1+0x9070310],bl
 3101d3e:	00 00                	add    BYTE PTR [eax],al
 3101d40:	a0 1f 10 03 07       	mov    al,ds:0x703101f
 3101d45:	0a 00                	or     al,BYTE PTR [eax]
 3101d47:	00 a4 1f 10 03 07 0b 	add    BYTE PTR [edi+ebx*1+0xb070310],ah
 3101d4e:	00 00                	add    BYTE PTR [eax],al
 3101d50:	a8 1f                	test   al,0x1f
 3101d52:	10 03                	adc    BYTE PTR [ebx],al
 3101d54:	07                   	pop    es
 3101d55:	0c 00                	or     al,0x0
 3101d57:	00 ac 1f 10 03 07 0d 	add    BYTE PTR [edi+ebx*1+0xd070310],ch
 3101d5e:	00 00                	add    BYTE PTR [eax],al
 3101d60:	b0 1f                	mov    al,0x1f
 3101d62:	10 03                	adc    BYTE PTR [ebx],al
 3101d64:	07                   	pop    es
 3101d65:	0e                   	push   cs
 3101d66:	00 00                	add    BYTE PTR [eax],al
 3101d68:	b4 1f                	mov    ah,0x1f
 3101d6a:	10 03                	adc    BYTE PTR [ebx],al
 3101d6c:	07                   	pop    es
 3101d6d:	0f 00 00             	sldt   WORD PTR [eax]
 3101d70:	b8 1f 10 03 07       	mov    eax,0x703101f
 3101d75:	10 00                	adc    BYTE PTR [eax],al
 3101d77:	00 bc 1f 10 03 07 11 	add    BYTE PTR [edi+ebx*1+0x11070310],bh
 3101d7e:	00 00                	add    BYTE PTR [eax],al
 3101d80:	c0 1f 10             	rcr    BYTE PTR [edi],0x10
 3101d83:	03 07                	add    eax,DWORD PTR [edi]
 3101d85:	12 00                	adc    al,BYTE PTR [eax]
 3101d87:	00 c4                	add    ah,al
 3101d89:	1f                   	pop    ds
 3101d8a:	10 03                	adc    BYTE PTR [ebx],al
 3101d8c:	07                   	pop    es
 3101d8d:	13 00                	adc    eax,DWORD PTR [eax]
 3101d8f:	00 c8                	add    al,cl
 3101d91:	1f                   	pop    ds
 3101d92:	10 03                	adc    BYTE PTR [ebx],al
 3101d94:	07                   	pop    es
 3101d95:	14 00                	adc    al,0x0
 3101d97:	00 cc                	add    ah,cl
 3101d99:	1f                   	pop    ds
 3101d9a:	10 03                	adc    BYTE PTR [ebx],al
 3101d9c:	07                   	pop    es
 3101d9d:	15 00 00 d0 1f       	adc    eax,0x1fd00000
 3101da2:	10 03                	adc    BYTE PTR [ebx],al
 3101da4:	07                   	pop    es
 3101da5:	16                   	push   ss
 3101da6:	00 00                	add    BYTE PTR [eax],al
 3101da8:	d4 1f                	aam    0x1f
 3101daa:	10 03                	adc    BYTE PTR [ebx],al
 3101dac:	07                   	pop    es
 3101dad:	17                   	pop    ss
 3101dae:	00 00                	add    BYTE PTR [eax],al
 3101db0:	d8 1f                	fcomp  DWORD PTR [edi]
 3101db2:	10 03                	adc    BYTE PTR [ebx],al
 3101db4:	07                   	pop    es
 3101db5:	18 00                	sbb    BYTE PTR [eax],al
 3101db7:	00 dc                	add    ah,bl
 3101db9:	1f                   	pop    ds
 3101dba:	10 03                	adc    BYTE PTR [ebx],al
 3101dbc:	07                   	pop    es
 3101dbd:	19 00                	sbb    DWORD PTR [eax],eax
 3101dbf:	00 e0                	add    al,ah
 3101dc1:	1f                   	pop    ds
 3101dc2:	10 03                	adc    BYTE PTR [ebx],al
 3101dc4:	07                   	pop    es
 3101dc5:	1a 00                	sbb    al,BYTE PTR [eax]
 3101dc7:	00 e4                	add    ah,ah
 3101dc9:	1f                   	pop    ds
 3101dca:	10 03                	adc    BYTE PTR [ebx],al
 3101dcc:	07                   	pop    es
 3101dcd:	1b 00                	sbb    eax,DWORD PTR [eax]
 3101dcf:	00 e8                	add    al,ch
 3101dd1:	1f                   	pop    ds
 3101dd2:	10 03                	adc    BYTE PTR [ebx],al
 3101dd4:	07                   	pop    es
 3101dd5:	1c 00                	sbb    al,0x0
 3101dd7:	00 ec                	add    ah,ch
 3101dd9:	1f                   	pop    ds
 3101dda:	10 03                	adc    BYTE PTR [ebx],al
 3101ddc:	07                   	pop    es
 3101ddd:	1d                   	.byte 0x1d
	...

Disassembly of section .data:

03101de0 <cmds>:
 3101de0:	b0 12                	mov    al,0x12
 3101de2:	10 03                	adc    BYTE PTR [ebx],al
 3101de4:	b4 12                	mov    ah,0x12
 3101de6:	10 03                	adc    BYTE PTR [ebx],al
 3101de8:	00 00                	add    BYTE PTR [eax],al
 3101dea:	10 03                	adc    BYTE PTR [ebx],al
 3101dec:	00 00                	add    BYTE PTR [eax],al
 3101dee:	00 00                	add    BYTE PTR [eax],al
 3101df0:	c6                   	(bad)  
 3101df1:	12 10                	adc    dl,BYTE PTR [eax]
 3101df3:	03 cb                	add    ecx,ebx
 3101df5:	12 10                	adc    dl,BYTE PTR [eax]
 3101df7:	03 01                	add    eax,DWORD PTR [ecx]
 3101df9:	04 10                	add    al,0x10
 3101dfb:	03 01                	add    eax,DWORD PTR [ecx]
 3101dfd:	00 00                	add    BYTE PTR [eax],al
 3101dff:	00 dd                	add    ch,bl
 3101e01:	12 10                	adc    dl,BYTE PTR [eax]
 3101e03:	03 e2                	add    esp,edx
 3101e05:	12 10                	adc    dl,BYTE PTR [eax]
 3101e07:	03 1a                	add    ebx,DWORD PTR [edx]
 3101e09:	04 10                	add    al,0x10
 3101e0b:	03 01                	add    eax,DWORD PTR [ecx]
 3101e0d:	00 00                	add    BYTE PTR [eax],al
 3101e0f:	00 ee                	add    dh,ch
 3101e11:	12 10                	adc    dl,BYTE PTR [eax]
 3101e13:	03 f3                	add    esi,ebx
 3101e15:	12 10                	adc    dl,BYTE PTR [eax]
 3101e17:	03 72 04             	add    esi,DWORD PTR [edx+0x4]
 3101e1a:	10 03                	adc    BYTE PTR [ebx],al
 3101e1c:	01 00                	add    DWORD PTR [eax],eax
 3101e1e:	00 00                	add    BYTE PTR [eax],al
 3101e20:	0f 13 10             	movlps QWORD PTR [eax],xmm2
 3101e23:	03 13                	add    edx,DWORD PTR [ebx]
 3101e25:	13 10                	adc    edx,DWORD PTR [eax]
 3101e27:	03 ac 05 10 03 00 00 	add    ebp,DWORD PTR [ebp+eax*1+0x310]
 3101e2e:	00 00                	add    BYTE PTR [eax],al
 3101e30:	2b 13                	sub    edx,DWORD PTR [ebx]
 3101e32:	10 03                	adc    BYTE PTR [ebx],al
 3101e34:	2f                   	das    
 3101e35:	13 10                	adc    edx,DWORD PTR [eax]
 3101e37:	03 4f 00             	add    ecx,DWORD PTR [edi+0x0]
 3101e3a:	10 03                	adc    BYTE PTR [ebx],al
 3101e3c:	01 00                	add    DWORD PTR [eax],eax
 3101e3e:	00 00                	add    BYTE PTR [eax],al
 3101e40:	4b                   	dec    ebx
 3101e41:	13 10                	adc    edx,DWORD PTR [eax]
 3101e43:	03 51 13             	add    edx,DWORD PTR [ecx+0x13]
 3101e46:	10 03                	adc    BYTE PTR [ebx],al
 3101e48:	fa                   	cli    
 3101e49:	05 10 03 01 00       	add    eax,0x10310
 3101e4e:	00 00                	add    BYTE PTR [eax],al
 3101e50:	65 13 10             	adc    edx,DWORD PTR gs:[eax]
 3101e53:	03 6c 13 10          	add    ebp,DWORD PTR [ebx+edx*1+0x10]
 3101e57:	03 e8                	add    ebp,eax
 3101e59:	03 10                	add    edx,DWORD PTR [eax]
 3101e5b:	03 01                	add    eax,DWORD PTR [ecx]
 3101e5d:	00 00                	add    BYTE PTR [eax],al
	...

03101e60 <cmds>:
 3101e60:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e61:	14 10                	adc    al,0x10
 3101e63:	03 70 14             	add    esi,DWORD PTR [eax+0x14]
 3101e66:	10 03                	adc    BYTE PTR [ebx],al
 3101e68:	00 00                	add    BYTE PTR [eax],al
 3101e6a:	10 03                	adc    BYTE PTR [ebx],al
 3101e6c:	00 00                	add    BYTE PTR [eax],al
 3101e6e:	00 00                	add    BYTE PTR [eax],al
 3101e70:	82                   	(bad)  
 3101e71:	14 10                	adc    al,0x10
 3101e73:	03 87 14 10 03 01    	add    eax,DWORD PTR [edi+0x1031014]
 3101e79:	04 10                	add    al,0x10
 3101e7b:	03 01                	add    eax,DWORD PTR [ecx]
 3101e7d:	00 00                	add    BYTE PTR [eax],al
 3101e7f:	00 99 14 10 03 9e    	add    BYTE PTR [ecx-0x61fcefec],bl
 3101e85:	14 10                	adc    al,0x10
 3101e87:	03 1a                	add    ebx,DWORD PTR [edx]
 3101e89:	04 10                	add    al,0x10
 3101e8b:	03 01                	add    eax,DWORD PTR [ecx]
 3101e8d:	00 00                	add    BYTE PTR [eax],al
 3101e8f:	00 aa 14 10 03 af    	add    BYTE PTR [edx-0x50fcefec],ch
 3101e95:	14 10                	adc    al,0x10
 3101e97:	03 72 04             	add    esi,DWORD PTR [edx+0x4]
 3101e9a:	10 03                	adc    BYTE PTR [ebx],al
 3101e9c:	01 00                	add    DWORD PTR [eax],eax
 3101e9e:	00 00                	add    BYTE PTR [eax],al
 3101ea0:	cb                   	retf   
 3101ea1:	14 10                	adc    al,0x10
 3101ea3:	03 cf                	add    ecx,edi
 3101ea5:	14 10                	adc    al,0x10
 3101ea7:	03 ac 05 10 03 00 00 	add    ebp,DWORD PTR [ebp+eax*1+0x310]
 3101eae:	00 00                	add    BYTE PTR [eax],al
 3101eb0:	e7 14                	out    0x14,eax
 3101eb2:	10 03                	adc    BYTE PTR [ebx],al
 3101eb4:	eb 14                	jmp    3101eca <cmds+0x6a>
 3101eb6:	10 03                	adc    BYTE PTR [ebx],al
 3101eb8:	4f                   	dec    edi
 3101eb9:	00 10                	add    BYTE PTR [eax],dl
 3101ebb:	03 01                	add    eax,DWORD PTR [ecx]
 3101ebd:	00 00                	add    BYTE PTR [eax],al
 3101ebf:	00 07                	add    BYTE PTR [edi],al
 3101ec1:	15 10 03 0d 15       	adc    eax,0x150d0310
 3101ec6:	10 03                	adc    BYTE PTR [ebx],al
 3101ec8:	fa                   	cli    
 3101ec9:	05 10 03 01 00       	add    eax,0x10310
 3101ece:	00 00                	add    BYTE PTR [eax],al
 3101ed0:	21 15 10 03 28 15    	and    DWORD PTR ds:0x15280310,edx
 3101ed6:	10 03                	adc    BYTE PTR [ebx],al
 3101ed8:	e8 03 10 03 01       	call   4132ee0 <commandHistory+0x1030b80>
 3101edd:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynamic:

03101ee0 <_DYNAMIC>:
 3101ee0:	01 00                	add    DWORD PTR [eax],eax
 3101ee2:	00 00                	add    BYTE PTR [eax],al
 3101ee4:	01 00                	add    DWORD PTR [eax],eax
 3101ee6:	00 00                	add    BYTE PTR [eax],al
 3101ee8:	0f 00 00             	sldt   WORD PTR [eax]
 3101eeb:	00 d3                	add    bl,dl
 3101eed:	00 00                	add    BYTE PTR [eax],al
 3101eef:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3101ef2:	00 00                	add    BYTE PTR [eax],al
 3101ef4:	40                   	inc    eax
 3101ef5:	1b 10                	sbb    edx,DWORD PTR [eax]
 3101ef7:	03 05 00 00 00 48    	add    eax,DWORD PTR ds:0x48000000
 3101efd:	1a 10                	sbb    dl,BYTE PTR [eax]
 3101eff:	03 06                	add    eax,DWORD PTR [esi]
 3101f01:	00 00                	add    BYTE PTR [eax],al
 3101f03:	00 68 18             	add    BYTE PTR [eax+0x18],ch
 3101f06:	10 03                	adc    BYTE PTR [ebx],al
 3101f08:	0a 00                	or     al,BYTE PTR [eax]
 3101f0a:	00 00                	add    BYTE PTR [eax],al
 3101f0c:	f6 00 00             	test   BYTE PTR [eax],0x0
 3101f0f:	00 0b                	add    BYTE PTR [ebx],cl
 3101f11:	00 00                	add    BYTE PTR [eax],al
 3101f13:	00 10                	add    BYTE PTR [eax],dl
 3101f15:	00 00                	add    BYTE PTR [eax],al
 3101f17:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 3101f1d:	00 00                	add    BYTE PTR [eax],al
 3101f1f:	00 03                	add    BYTE PTR [ebx],al
 3101f21:	00 00                	add    BYTE PTR [eax],al
 3101f23:	00 70 1f             	add    BYTE PTR [eax+0x1f],dh
 3101f26:	10 03                	adc    BYTE PTR [ebx],al
 3101f28:	02 00                	add    al,BYTE PTR [eax]
 3101f2a:	00 00                	add    BYTE PTR [eax],al
 3101f2c:	e8 00 00 00 14       	call   17101f31 <commandHistory+0x13fffbd1>
 3101f31:	00 00                	add    BYTE PTR [eax],al
 3101f33:	00 11                	add    BYTE PTR [ecx],dl
 3101f35:	00 00                	add    BYTE PTR [eax],al
 3101f37:	00 17                	add    BYTE PTR [edi],dl
 3101f39:	00 00                	add    BYTE PTR [eax],al
 3101f3b:	00 f8                	add    al,bh
 3101f3d:	1c 10                	sbb    al,0x10
 3101f3f:	03 00                	add    eax,DWORD PTR [eax]
	...

Disassembly of section .got.plt:

03101f70 <_GLOBAL_OFFSET_TABLE_>:
 3101f70:	e0 1e                	loopne 3101f90 <_GLOBAL_OFFSET_TABLE_+0x20>
 3101f72:	10 03                	adc    BYTE PTR [ebx],al
	...
 3101f7c:	e6 10                	out    0x10,al
 3101f7e:	10 03                	adc    BYTE PTR [ebx],al
 3101f80:	f6 10                	not    BYTE PTR [eax]
 3101f82:	10 03                	adc    BYTE PTR [ebx],al
 3101f84:	06                   	push   es
 3101f85:	11 10                	adc    DWORD PTR [eax],edx
 3101f87:	03 16                	add    edx,DWORD PTR [esi]
 3101f89:	11 10                	adc    DWORD PTR [eax],edx
 3101f8b:	03 26                	add    esp,DWORD PTR [esi]
 3101f8d:	11 10                	adc    DWORD PTR [eax],edx
 3101f8f:	03 36                	add    esi,DWORD PTR [esi]
 3101f91:	11 10                	adc    DWORD PTR [eax],edx
 3101f93:	03 46 11             	add    eax,DWORD PTR [esi+0x11]
 3101f96:	10 03                	adc    BYTE PTR [ebx],al
 3101f98:	56                   	push   esi
 3101f99:	11 10                	adc    DWORD PTR [eax],edx
 3101f9b:	03 66 11             	add    esp,DWORD PTR [esi+0x11]
 3101f9e:	10 03                	adc    BYTE PTR [ebx],al
 3101fa0:	76 11                	jbe    3101fb3 <_GLOBAL_OFFSET_TABLE_+0x43>
 3101fa2:	10 03                	adc    BYTE PTR [ebx],al
 3101fa4:	86 11                	xchg   BYTE PTR [ecx],dl
 3101fa6:	10 03                	adc    BYTE PTR [ebx],al
 3101fa8:	96                   	xchg   esi,eax
 3101fa9:	11 10                	adc    DWORD PTR [eax],edx
 3101fab:	03 a6 11 10 03 b6    	add    esp,DWORD PTR [esi-0x49fcefef]
 3101fb1:	11 10                	adc    DWORD PTR [eax],edx
 3101fb3:	03 c6                	add    eax,esi
 3101fb5:	11 10                	adc    DWORD PTR [eax],edx
 3101fb7:	03 d6                	add    edx,esi
 3101fb9:	11 10                	adc    DWORD PTR [eax],edx
 3101fbb:	03 e6                	add    esp,esi
 3101fbd:	11 10                	adc    DWORD PTR [eax],edx
 3101fbf:	03 f6                	add    esi,esi
 3101fc1:	11 10                	adc    DWORD PTR [eax],edx
 3101fc3:	03 06                	add    eax,DWORD PTR [esi]
 3101fc5:	12 10                	adc    dl,BYTE PTR [eax]
 3101fc7:	03 16                	add    edx,DWORD PTR [esi]
 3101fc9:	12 10                	adc    dl,BYTE PTR [eax]
 3101fcb:	03 26                	add    esp,DWORD PTR [esi]
 3101fcd:	12 10                	adc    dl,BYTE PTR [eax]
 3101fcf:	03 36                	add    esi,DWORD PTR [esi]
 3101fd1:	12 10                	adc    dl,BYTE PTR [eax]
 3101fd3:	03 46 12             	add    eax,DWORD PTR [esi+0x12]
 3101fd6:	10 03                	adc    BYTE PTR [ebx],al
 3101fd8:	56                   	push   esi
 3101fd9:	12 10                	adc    dl,BYTE PTR [eax]
 3101fdb:	03 66 12             	add    esp,DWORD PTR [esi+0x12]
 3101fde:	10 03                	adc    BYTE PTR [ebx],al
 3101fe0:	76 12                	jbe    3101ff4 <_GLOBAL_OFFSET_TABLE_+0x84>
 3101fe2:	10 03                	adc    BYTE PTR [ebx],al
 3101fe4:	86 12                	xchg   BYTE PTR [edx],dl
 3101fe6:	10 03                	adc    BYTE PTR [ebx],al
 3101fe8:	96                   	xchg   esi,eax
 3101fe9:	12 10                	adc    dl,BYTE PTR [eax]
 3101feb:	03                   	.byte 0x3
 3101fec:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 3101fed:	12 10                	adc    dl,BYTE PTR [eax]
 3101fef:	03                   	.byte 0x3

Disassembly of section .bss:

03102000 <delim>:
	...

03102008 <environmentLoc>:
	...

03102020 <cwd>:
	...

03102120 <sExecutingProgram>:
	...

03102320 <command_function_p>:
 3102320:	00 00                	add    BYTE PTR [eax],al
	...

03102324 <heapEnd>:
 3102324:	00 00                	add    BYTE PTR [eax],al
	...

03102328 <heapBase>:
 3102328:	00 00                	add    BYTE PTR [eax],al
	...

0310232c <heapCurr>:
 310232c:	00 00                	add    BYTE PTR [eax],al
	...

03102330 <command_function>:
 3102330:	00 00                	add    BYTE PTR [eax],al
	...

03102334 <processEnvp>:
 3102334:	00 00                	add    BYTE PTR [eax],al
	...

03102338 <lastExecExitCode>:
 3102338:	00 00                	add    BYTE PTR [eax],al
	...

0310233c <exitCode>:
 310233c:	00 00                	add    BYTE PTR [eax],al
	...

03102340 <sKShellProgramName>:
 3102340:	00 00                	add    BYTE PTR [eax],al
	...

03102344 <libcTZ>:
 3102344:	00 00                	add    BYTE PTR [eax],al
	...

03102348 <timeToExit>:
 3102348:	00 00                	add    BYTE PTR [eax],al
	...

0310234c <commandHistoryPtr>:
 310234c:	00 00                	add    BYTE PTR [eax],al
	...

03102350 <commandHistoryMax>:
	...

03102360 <commandHistory>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
   1:	06                   	push   es
   2:	00 00                	add    BYTE PTR [eax],al
   4:	04 00                	add    al,0x0
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	a2 00 00 00 0c       	mov    ds:0xc000000,al
  11:	55                   	push   ebp
  12:	02 00                	add    al,BYTE PTR [eax]
  14:	00 37                	add    BYTE PTR [edi],dh
  16:	00 00                	add    BYTE PTR [eax],al
  18:	00 00                	add    BYTE PTR [eax],al
  1a:	00 10                	add    BYTE PTR [eax],dl
  1c:	03 61 06             	add    esp,DWORD PTR [ecx+0x6]
  1f:	00 00                	add    BYTE PTR [eax],al
  21:	00 00                	add    BYTE PTR [eax],al
  23:	00 00                	add    BYTE PTR [eax],al
  25:	02 01                	add    al,BYTE PTR [ecx]
  27:	06                   	push   es
  28:	e8 01 00 00 02       	call   200002e <cmdPrintEnv-0x10fffd2>
  2d:	01 06                	add    DWORD PTR [esi],eax
  2f:	e1 01                	loope  32 <cmdPrintEnv-0x30fffce>
  31:	00 00                	add    BYTE PTR [eax],al
  33:	02 02                	add    al,BYTE PTR [edx]
  35:	05 7e 00 00 00       	add    eax,0x7e
  3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  41:	02 08                	add    cl,BYTE PTR [eax]
  43:	05 68 01 00 00       	add    eax,0x168
  48:	02 01                	add    al,BYTE PTR [ecx]
  4a:	08 df                	or     bh,bl
  4c:	01 00                	add    DWORD PTR [eax],eax
  4e:	00 02                	add    BYTE PTR [edx],al
  50:	02 07                	add    al,BYTE PTR [edi]
  52:	39 02                	cmp    DWORD PTR [edx],eax
  54:	00 00                	add    BYTE PTR [eax],al
  56:	04 0c                	add    al,0xc
  58:	02 00                	add    al,BYTE PTR [eax]
  5a:	00 02                	add    BYTE PTR [edx],al
  5c:	34 61                	xor    al,0x61
  5e:	00 00                	add    BYTE PTR [eax],al
  60:	00 02                	add    BYTE PTR [edx],al
  62:	04 07                	add    al,0x7
  64:	ff 01                	inc    DWORD PTR [ecx]
  66:	00 00                	add    BYTE PTR [eax],al
  68:	02 08                	add    cl,BYTE PTR [eax]
  6a:	07                   	pop    es
  6b:	f5                   	cmc    
  6c:	01 00                	add    DWORD PTR [eax],eax
  6e:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
  71:	01 00                	add    DWORD PTR [eax],eax
  73:	00 02                	add    BYTE PTR [edx],al
  75:	56                   	push   esi
  76:	61                   	popa   
  77:	00 00                	add    BYTE PTR [eax],al
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	04 05                	add    al,0x5
  7d:	6d                   	ins    DWORD PTR es:[edi],dx
  7e:	01 00                	add    DWORD PTR [eax],eax
  80:	00 05 74 6d 00 2c    	add    BYTE PTR ds:0x2c006d74,al
  86:	03 2c 11             	add    ebp,DWORD PTR [ecx+edx*1]
  89:	01 00                	add    DWORD PTR [eax],eax
  8b:	00 06                	add    BYTE PTR [esi],al
  8d:	e7 02                	out    0x2,eax
  8f:	00 00                	add    BYTE PTR [eax],al
  91:	03 2e                	add    ebp,DWORD PTR [esi]
  93:	3a 00                	cmp    al,BYTE PTR [eax]
  95:	00 00                	add    BYTE PTR [eax],al
  97:	00 06                	add    BYTE PTR [esi],al
  99:	7a 02                	jp     9d <cmdPrintEnv-0x30fff63>
  9b:	00 00                	add    BYTE PTR [eax],al
  9d:	03 2f                	add    ebp,DWORD PTR [edi]
  9f:	3a 00                	cmp    al,BYTE PTR [eax]
  a1:	00 00                	add    BYTE PTR [eax],al
  a3:	04 06                	add    al,0x6
  a5:	4e                   	dec    esi
  a6:	01 00                	add    DWORD PTR [eax],eax
  a8:	00 03                	add    BYTE PTR [ebx],al
  aa:	30 3a                	xor    BYTE PTR [edx],bh
  ac:	00 00                	add    BYTE PTR [eax],al
  ae:	00 08                	add    BYTE PTR [eax],cl
  b0:	06                   	push   es
  b1:	15 02 00 00 03       	adc    eax,0x3000002
  b6:	31 3a                	xor    DWORD PTR [edx],edi
  b8:	00 00                	add    BYTE PTR [eax],al
  ba:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
  bd:	61                   	popa   
  be:	01 00                	add    DWORD PTR [eax],eax
  c0:	00 03                	add    BYTE PTR [ebx],al
  c2:	32 3a                	xor    bh,BYTE PTR [edx]
  c4:	00 00                	add    BYTE PTR [eax],al
  c6:	00 10                	add    BYTE PTR [eax],dl
  c8:	06                   	push   es
  c9:	ed                   	in     eax,dx
  ca:	01 00                	add    DWORD PTR [eax],eax
  cc:	00 03                	add    BYTE PTR [ebx],al
  ce:	33 3a                	xor    edi,DWORD PTR [edx]
  d0:	00 00                	add    BYTE PTR [eax],al
  d2:	00 14 06             	add    BYTE PTR [esi+eax*1],dl
  d5:	d7                   	xlat   BYTE PTR ds:[ebx]
  d6:	01 00                	add    DWORD PTR [eax],eax
  d8:	00 03                	add    BYTE PTR [ebx],al
  da:	34 3a                	xor    al,0x3a
  dc:	00 00                	add    BYTE PTR [eax],al
  de:	00 18                	add    BYTE PTR [eax],bl
  e0:	06                   	push   es
  e1:	6c                   	ins    BYTE PTR es:[edi],dx
  e2:	02 00                	add    al,BYTE PTR [eax]
  e4:	00 03                	add    BYTE PTR [ebx],al
  e6:	35 3a 00 00 00       	xor    eax,0x3a
  eb:	1c 06                	sbb    al,0x6
  ed:	88 02                	mov    BYTE PTR [edx],al
  ef:	00 00                	add    BYTE PTR [eax],al
  f1:	03 36                	add    esi,DWORD PTR [esi]
  f3:	3a 00                	cmp    al,BYTE PTR [eax]
  f5:	00 00                	add    BYTE PTR [eax],al
  f7:	20 06                	and    BYTE PTR [esi],al
  f9:	f8                   	clc    
  fa:	00 00                	add    BYTE PTR [eax],al
  fc:	00 03                	add    BYTE PTR [ebx],al
  fe:	37                   	aaa    
  ff:	7a 00                	jp     101 <cmdPrintEnv-0x30ffeff>
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
 11f:	74 02                	je     123 <cmdPrintEnv-0x30ffedd>
 121:	00 00                	add    BYTE PTR [eax],al
 123:	09 10                	or     DWORD PTR [eax],edx
 125:	04 12                	add    al,0x12
 127:	5c                   	pop    esp
 128:	01 00                	add    DWORD PTR [eax],eax
 12a:	00 06                	add    BYTE PTR [esi],al
 12c:	ca 01 00             	retf   0x1
 12f:	00 04 14             	add    BYTE PTR [esp+edx*1],al
 132:	5c                   	pop    esp
 133:	01 00                	add    DWORD PTR [eax],eax
 135:	00 00                	add    BYTE PTR [eax],al
 137:	06                   	push   es
 138:	72 00                	jb     13a <cmdPrintEnv-0x30ffec6>
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
 150:	56                   	push   esi
 151:	01 00                	add    DWORD PTR [eax],eax
 153:	00 04 17             	add    BYTE PTR [edi+edx*1],al
 156:	3a 00                	cmp    al,BYTE PTR [eax]
 158:	00 00                	add    BYTE PTR [eax],al
 15a:	0c 00                	or     al,0x0
 15c:	07                   	pop    es
 15d:	04 25                	add    al,0x25
 15f:	00 00                	add    BYTE PTR [eax],al
 161:	00 0a                	add    BYTE PTR [edx],cl
 163:	04 04                	add    al,0x4
 165:	1e                   	push   ds
 166:	03 00                	add    eax,DWORD PTR [eax]
 168:	00 04 18             	add    BYTE PTR [eax+ebx*1],al
 16b:	23 01                	and    eax,DWORD PTR [ecx]
 16d:	00 00                	add    BYTE PTR [eax],al
 16f:	0b 5e 00             	or     ebx,DWORD PTR [esi+0x0]
 172:	00 00                	add    BYTE PTR [eax],al
 174:	01 0a                	add    DWORD PTR [edx],ecx
 176:	00 00                	add    BYTE PTR [eax],al
 178:	10 03                	adc    BYTE PTR [ebx],al
 17a:	4f                   	dec    edi
 17b:	00 00                	add    BYTE PTR [eax],al
 17d:	00 01                	add    BYTE PTR [ecx],al
 17f:	9c                   	pushf  
 180:	9d                   	popf   
 181:	01 00                	add    DWORD PTR [eax],eax
 183:	00 0c 06             	add    BYTE PTR [esi+eax*1],cl
 186:	00 10                	add    BYTE PTR [eax],dl
 188:	03 46 00             	add    eax,DWORD PTR [esi+0x0]
 18b:	00 00                	add    BYTE PTR [eax],al
 18d:	0d 63 6e 74 00       	or     eax,0x746e63
 192:	01 0c 3a             	add    DWORD PTR [edx+edi*1],ecx
 195:	00 00                	add    BYTE PTR [eax],al
 197:	00 02                	add    BYTE PTR [edx],al
 199:	91                   	xchg   ecx,eax
 19a:	6c                   	ins    BYTE PTR es:[edi],dx
 19b:	00 00                	add    BYTE PTR [eax],al
 19d:	0e                   	push   cs
 19e:	99                   	cdq    
 19f:	02 00                	add    al,BYTE PTR [eax]
 1a1:	00 01                	add    BYTE PTR [ecx],al
 1a3:	16                   	push   ss
 1a4:	4f                   	dec    edi
 1a5:	00 10                	add    BYTE PTR [eax],dl
 1a7:	03 5d 01             	add    ebx,DWORD PTR [ebp+0x1]
 1aa:	00 00                	add    BYTE PTR [eax],al
 1ac:	01 9c 20 02 00 00 0f 	add    DWORD PTR [eax+eiz*1+0xf000002],ebx
 1b3:	9a 00 00 00 01 16 5c 	call   0x5c16:0x1000000
 1ba:	01 00                	add    DWORD PTR [eax],eax
 1bc:	00 02                	add    BYTE PTR [edx],al
 1be:	91                   	xchg   ecx,eax
 1bf:	00 10                	add    BYTE PTR [eax],dl
 1c1:	c3                   	ret    
 1c2:	01 00                	add    DWORD PTR [eax],eax
 1c4:	00 01                	add    BYTE PTR [ecx],al
 1c6:	18 20                	sbb    BYTE PTR [eax],ah
 1c8:	02 00                	add    al,BYTE PTR [eax]
 1ca:	00 03                	add    BYTE PTR [ebx],al
 1cc:	91                   	xchg   ecx,eax
 1cd:	dc 75 10             	fdiv   QWORD PTR [ebp+0x10]
 1d0:	76 01                	jbe    1d3 <cmdPrintEnv-0x30ffe2d>
 1d2:	00 00                	add    BYTE PTR [eax],al
 1d4:	01 19                	add    DWORD PTR [ecx],ebx
 1d6:	5c                   	pop    esp
 1d7:	01 00                	add    DWORD PTR [eax],eax
 1d9:	00 02                	add    BYTE PTR [edx],al
 1db:	91                   	xchg   ecx,eax
 1dc:	60                   	pusha  
 1dd:	10 0f                	adc    BYTE PTR [edi],cl
 1df:	00 00                	add    BYTE PTR [eax],al
 1e1:	00 01                	add    BYTE PTR [ecx],al
 1e3:	19 5c 01 00          	sbb    DWORD PTR [ecx+eax*1+0x0],ebx
 1e7:	00 02                	add    BYTE PTR [edx],al
 1e9:	91                   	xchg   ecx,eax
 1ea:	5c                   	pop    esp
 1eb:	0c 7a                	or     al,0x7a
 1ed:	00 10                	add    BYTE PTR [eax],dl
 1ef:	03 29                	add    ebp,DWORD PTR [ecx]
 1f1:	01 00                	add    DWORD PTR [eax],eax
 1f3:	00 10                	add    BYTE PTR [eax],dl
 1f5:	27                   	daa    
 1f6:	00 00                	add    BYTE PTR [eax],al
 1f8:	00 01                	add    BYTE PTR [ecx],al
 1fa:	1d 3a 00 00 00       	sbb    eax,0x3a
 1ff:	02 91 6c 10 f9 02    	add    dl,BYTE PTR [ecx+0x2f9106c]
 205:	00 00                	add    BYTE PTR [eax],al
 207:	01 1d 3a 00 00 00    	add    DWORD PTR ds:0x3a,ebx
 20d:	02 91 68 10 b5 02    	add    dl,BYTE PTR [ecx+0x2b51068]
 213:	00 00                	add    BYTE PTR [eax],al
 215:	01 1e                	add    DWORD PTR [esi],ebx
 217:	3a 00                	cmp    al,BYTE PTR [eax]
 219:	00 00                	add    BYTE PTR [eax],al
 21b:	02 91 64 00 00 11    	add    dl,BYTE PTR [ecx+0x11000064]
 221:	25 00 00 00 36       	and    eax,0x36000000
 226:	02 00                	add    al,BYTE PTR [eax]
 228:	00 12                	add    BYTE PTR [edx],dl
 22a:	36 02 00             	add    al,BYTE PTR ss:[eax]
 22d:	00 09                	add    BYTE PTR [ecx],cl
 22f:	12 36                	adc    dh,BYTE PTR [esi]
 231:	02 00                	add    al,BYTE PTR [eax]
 233:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
 236:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
 239:	88 00                	mov    BYTE PTR [eax],al
 23b:	00 00                	add    BYTE PTR [eax],al
 23d:	13 27                	adc    esp,DWORD PTR [edi]
 23f:	01 00                	add    DWORD PTR [eax],eax
 241:	00 01                	add    BYTE PTR [ecx],al
 243:	35 3a 00 00 00       	xor    eax,0x3a
 248:	ac                   	lods   al,BYTE PTR ds:[esi]
 249:	01 10                	add    DWORD PTR [eax],edx
 24b:	03 8b 00 00 00 01    	add    ecx,DWORD PTR [ebx+0x1000000]
 251:	9c                   	pushf  
 252:	b5 02                	mov    ch,0x2
 254:	00 00                	add    BYTE PTR [eax],al
 256:	0f cf                	bswap  edi
 258:	02 00                	add    al,BYTE PTR [eax]
 25a:	00 01                	add    BYTE PTR [ecx],al
 25c:	35 5c 01 00 00       	xor    eax,0x15c
 261:	02 91 00 0f 3e 04    	add    dl,BYTE PTR [ecx+0x43e0f00]
 267:	00 00                	add    BYTE PTR [eax],al
 269:	01 35 3a 00 00 00    	add    DWORD PTR ds:0x3a,esi
 26f:	02 91 04 0f 5b 04    	add    dl,BYTE PTR [ecx+0x45b0f04]
 275:	00 00                	add    BYTE PTR [eax],al
 277:	01 35 b5 02 00 00    	add    DWORD PTR ds:0x2b5,esi
 27d:	02 91 08 0f ee 02    	add    dl,BYTE PTR [ecx+0x2ee0f08]
 283:	00 00                	add    BYTE PTR [eax],al
 285:	01 35 1c 01 00 00    	add    DWORD PTR ds:0x11c,esi
 28b:	02 91 5c 0d 70 69    	add    dl,BYTE PTR [ecx+0x69700d5c]
 291:	64 00 01             	add    BYTE PTR fs:[ecx],al
 294:	37                   	aaa    
 295:	3a 00                	cmp    al,BYTE PTR [eax]
 297:	00 00                	add    BYTE PTR [eax],al
 299:	02 91 6c 0c e0 01    	add    dl,BYTE PTR [ecx+0x1e00c6c]
 29f:	10 03                	adc    BYTE PTR [ebx],al
 2a1:	41                   	inc    ecx
 2a2:	00 00                	add    BYTE PTR [eax],al
 2a4:	00 0d 72 65 74 00    	add    BYTE PTR ds:0x746572,cl
 2aa:	01 3f                	add    DWORD PTR [edi],edi
 2ac:	bb 02 00 00 02       	mov    ebx,0x2000002
 2b1:	91                   	xchg   ecx,eax
 2b2:	62 00                	bound  eax,QWORD PTR [eax]
 2b4:	00 07                	add    BYTE PTR [edi],al
 2b6:	04 5c                	add    al,0x5c
 2b8:	01 00                	add    DWORD PTR [eax],eax
 2ba:	00 11                	add    BYTE PTR [ecx],dl
 2bc:	25 00 00 00 cb       	and    eax,0xcb000000
 2c1:	02 00                	add    al,BYTE PTR [eax]
 2c3:	00 12                	add    BYTE PTR [edx],dl
 2c5:	36 02 00             	add    al,BYTE PTR ss:[eax]
 2c8:	00 09                	add    BYTE PTR [ecx],cl
 2ca:	00 13                	add    BYTE PTR [ebx],dl
 2cc:	4c                   	dec    esp
 2cd:	02 00                	add    al,BYTE PTR [eax]
 2cf:	00 01                	add    BYTE PTR [ecx],al
 2d1:	49                   	dec    ecx
 2d2:	3a 00                	cmp    al,BYTE PTR [eax]
 2d4:	00 00                	add    BYTE PTR [eax],al
 2d6:	37                   	aaa    
 2d7:	02 10                	add    dl,BYTE PTR [eax]
 2d9:	03 b1 01 00 00 01    	add    esi,DWORD PTR [ecx+0x1000001]
 2df:	9c                   	pushf  
 2e0:	02 04 00             	add    al,BYTE PTR [eax+eax*1]
 2e3:	00 0f                	add    BYTE PTR [edi],cl
 2e5:	9a 00 00 00 01 49 5c 	call   0x5c49:0x1000000
 2ec:	01 00                	add    DWORD PTR [eax],eax
 2ee:	00 02                	add    BYTE PTR [edx],al
 2f0:	91                   	xchg   ecx,eax
 2f1:	00 0f                	add    BYTE PTR [edi],cl
 2f3:	7e 01                	jle    2f6 <cmdPrintEnv-0x30ffd0a>
 2f5:	00 00                	add    BYTE PTR [eax],al
 2f7:	01 49 1c             	add    DWORD PTR [ecx+0x1c],ecx
 2fa:	01 00                	add    DWORD PTR [eax],eax
 2fc:	00 03                	add    BYTE PTR [ebx],al
 2fe:	91                   	xchg   ecx,eax
 2ff:	ac                   	lods   al,BYTE PTR ds:[esi]
 300:	75 10                	jne    312 <cmdPrintEnv-0x30ffcee>
 302:	ee                   	out    dx,al
 303:	02 00                	add    al,BYTE PTR [eax]
 305:	00 01                	add    BYTE PTR [ecx],al
 307:	4b                   	dec    ebx
 308:	1c 01                	sbb    al,0x1
 30a:	00 00                	add    BYTE PTR [eax],al
 30c:	02 91 6b 10 cf 01    	add    dl,BYTE PTR [ecx+0x1cf106b]
 312:	00 00                	add    BYTE PTR [eax],al
 314:	01 4c 3a 00          	add    DWORD PTR [edx+edi*1+0x0],ecx
 318:	00 00                	add    BYTE PTR [eax],al
 31a:	02 91 64 14 74 6f    	add    dl,BYTE PTR [ecx+0x6f741464]
 320:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
 323:	4d                   	dec    ebp
 324:	5c                   	pop    esp
 325:	01 00                	add    DWORD PTR [eax],eax
 327:	00 0d 70 67 6d 00    	add    BYTE PTR ds:0x6d6770,cl
 32d:	01 4e 5c             	add    DWORD PTR [esi+0x5c],ecx
 330:	01 00                	add    DWORD PTR [eax],eax
 332:	00 02                	add    BYTE PTR [edx],al
 334:	91                   	xchg   ecx,eax
 335:	60                   	pusha  
 336:	10 c3                	adc    bl,al
 338:	01 00                	add    DWORD PTR [eax],eax
 33a:	00 01                	add    BYTE PTR [ecx],al
 33c:	50                   	push   eax
 33d:	20 02                	and    BYTE PTR [edx],al
 33f:	00 00                	add    BYTE PTR [eax],al
 341:	03 91 c4 75 10 56    	add    edx,DWORD PTR [ecx+0x561075c4]
 347:	01 00                	add    DWORD PTR [eax],eax
 349:	00 01                	add    BYTE PTR [ecx],al
 34b:	51                   	push   ecx
 34c:	3a 00                	cmp    al,BYTE PTR [eax]
 34e:	00 00                	add    BYTE PTR [eax],al
 350:	02 91 5c 10 18 00    	add    dl,BYTE PTR [ecx+0x18105c]
 356:	00 00                	add    BYTE PTR [eax],al
 358:	01 52 3a             	add    DWORD PTR [edx+0x3a],edx
 35b:	00 00                	add    BYTE PTR [eax],al
 35d:	00 02                	add    BYTE PTR [edx],al
 35f:	91                   	xchg   ecx,eax
 360:	58                   	pop    eax
 361:	10 32                	adc    BYTE PTR [edx],dh
 363:	02 00                	add    al,BYTE PTR [eax]
 365:	00 01                	add    BYTE PTR [ecx],al
 367:	53                   	push   ebx
 368:	3a 00                	cmp    al,BYTE PTR [eax]
 36a:	00 00                	add    BYTE PTR [eax],al
 36c:	02 91 54 15 a3 02    	add    dl,BYTE PTR [ecx+0x2a31554]
 372:	00 00                	add    BYTE PTR [eax],al
 374:	01 54 02 04          	add    DWORD PTR [edx+eax*1+0x4],edx
 378:	00 00                	add    BYTE PTR [eax],al
 37a:	15 91 02 00 00       	adc    eax,0x291
 37f:	01 54 02 04          	add    DWORD PTR [edx+eax*1+0x4],edx
 383:	00 00                	add    BYTE PTR [eax],al
 385:	10 1c 01             	adc    BYTE PTR [ecx+eax*1],bl
 388:	00 00                	add    BYTE PTR [eax],al
 38a:	01 55 56             	add    DWORD PTR [ebp+0x56],edx
 38d:	00 00                	add    BYTE PTR [eax],al
 38f:	00 02                	add    BYTE PTR [edx],al
 391:	91                   	xchg   ecx,eax
 392:	4c                   	dec    esp
 393:	10 91 00 00 00 01    	adc    BYTE PTR [ecx+0x1000000],dl
 399:	55                   	push   ebp
 39a:	56                   	push   esi
 39b:	00 00                	add    BYTE PTR [eax],al
 39d:	00 02                	add    BYTE PTR [edx],al
 39f:	91                   	xchg   ecx,eax
 3a0:	44                   	inc    esp
 3a1:	10 3e                	adc    BYTE PTR [esi],bh
 3a3:	04 00                	add    al,0x0
 3a5:	00 01                	add    BYTE PTR [ecx],al
 3a7:	5a                   	pop    edx
 3a8:	3a 00                	cmp    al,BYTE PTR [eax]
 3aa:	00 00                	add    BYTE PTR [eax],al
 3ac:	03 91 c0 75 10 5b    	add    edx,DWORD PTR [ecx+0x5b1075c0]
 3b2:	04 00                	add    al,0x0
 3b4:	00 01                	add    BYTE PTR [ecx],al
 3b6:	5b                   	pop    ebx
 3b7:	b5 02                	mov    ch,0x2
 3b9:	00 00                	add    BYTE PTR [eax],al
 3bb:	02 91 50 16 c8 02    	add    dl,BYTE PTR [ecx+0x2c81650]
 3c1:	10 03                	adc    BYTE PTR [ebx],al
 3c3:	4d                   	dec    ebp
 3c4:	00 00                	add    BYTE PTR [eax],al
 3c6:	00 e8                	add    al,ch
 3c8:	03 00                	add    eax,DWORD PTR [eax]
 3ca:	00 10                	add    BYTE PTR [eax],dl
 3cc:	e0 02                	loopne 3d0 <cmdPrintEnv-0x30ffc30>
 3ce:	00 00                	add    BYTE PTR [eax],al
 3d0:	01 66 3a             	add    DWORD PTR [esi+0x3a],esp
 3d3:	00 00                	add    BYTE PTR [eax],al
 3d5:	00 02                	add    BYTE PTR [edx],al
 3d7:	91                   	xchg   ecx,eax
 3d8:	6c                   	ins    BYTE PTR es:[edi],dx
 3d9:	10 8e 01 00 00 01    	adc    BYTE PTR [esi+0x1000001],cl
 3df:	67 3a 00             	cmp    al,BYTE PTR [bx+si]
 3e2:	00 00                	add    BYTE PTR [eax],al
 3e4:	02 91 48 00 0c 38    	add    dl,BYTE PTR [ecx+0x380c0048]
 3ea:	03 10                	add    edx,DWORD PTR [eax]
 3ec:	03 8f 00 00 00 0d    	add    ecx,DWORD PTR [edi+0xd000000]
 3f2:	72 65                	jb     459 <cmdPrintEnv-0x30ffba7>
 3f4:	74 00                	je     3f6 <cmdPrintEnv-0x30ffc0a>
 3f6:	01 7d bb             	add    DWORD PTR [ebp-0x45],edi
 3f9:	02 00                	add    al,BYTE PTR [eax]
 3fb:	00 03                	add    BYTE PTR [ebx],al
 3fd:	91                   	xchg   ecx,eax
 3fe:	b6 75                	mov    dh,0x75
 400:	00 00                	add    BYTE PTR [eax],al
 402:	07                   	pop    es
 403:	04 81                	add    al,0x81
 405:	00 00                	add    BYTE PTR [eax],al
 407:	00 0e                	add    BYTE PTR [esi],cl
 409:	64 02 00             	add    al,BYTE PTR fs:[eax]
 40c:	00 01                	add    BYTE PTR [ecx],al
 40e:	86 e8                	xchg   al,ch
 410:	03 10                	add    edx,DWORD PTR [eax]
 412:	03 19                	add    ebx,DWORD PTR [ecx]
 414:	00 00                	add    BYTE PTR [eax],al
 416:	00 01                	add    BYTE PTR [ecx],al
 418:	9c                   	pushf  
 419:	2c 04                	sub    al,0x4
 41b:	00 00                	add    BYTE PTR [eax],al
 41d:	0f 9a 00             	setp   BYTE PTR [eax]
 420:	00 00                	add    BYTE PTR [eax],al
 422:	01 86 5c 01 00 00    	add    DWORD PTR [esi+0x15c],eax
 428:	02 91 00 00 0e 15    	add    dl,BYTE PTR [ecx+0x150e0000]
 42e:	03 00                	add    eax,DWORD PTR [eax]
 430:	00 01                	add    BYTE PTR [ecx],al
 432:	8b 01                	mov    eax,DWORD PTR [ecx]
 434:	04 10                	add    al,0x10
 436:	03 19                	add    ebx,DWORD PTR [ecx]
 438:	00 00                	add    BYTE PTR [eax],al
 43a:	00 01                	add    BYTE PTR [ecx],al
 43c:	9c                   	pushf  
 43d:	50                   	push   eax
 43e:	04 00                	add    al,0x0
 440:	00 0f                	add    BYTE PTR [edi],cl
 442:	9a 00 00 00 01 8b 5c 	call   0x5c8b:0x1000000
 449:	01 00                	add    DWORD PTR [eax],eax
 44b:	00 02                	add    BYTE PTR [edx],al
 44d:	91                   	xchg   ecx,eax
 44e:	00 00                	add    BYTE PTR [eax],al
 450:	0e                   	push   cs
 451:	2f                   	das    
 452:	00 00                	add    BYTE PTR [eax],al
 454:	00 01                	add    BYTE PTR [ecx],al
 456:	90                   	nop
 457:	1a 04 10             	sbb    al,BYTE PTR [eax+edx*1]
 45a:	03 58 00             	add    ebx,DWORD PTR [eax+0x0]
 45d:	00 00                	add    BYTE PTR [eax],al
 45f:	01 9c 83 04 00 00 0f 	add    DWORD PTR [ebx+eax*4+0xf000004],ebx
 466:	9a 00 00 00 01 90 5c 	call   0x5c90:0x1000000
 46d:	01 00                	add    DWORD PTR [eax],eax
 46f:	00 02                	add    BYTE PTR [edx],al
 471:	91                   	xchg   ecx,eax
 472:	00 10                	add    BYTE PTR [eax],dl
 474:	c3                   	ret    
 475:	01 00                	add    DWORD PTR [eax],eax
 477:	00 01                	add    BYTE PTR [ecx],al
 479:	92                   	xchg   edx,eax
 47a:	20 02                	and    BYTE PTR [edx],al
 47c:	00 00                	add    BYTE PTR [eax],al
 47e:	03 91 f0 75 00 0e    	add    edx,DWORD PTR [ecx+0xe0075f0]
 484:	ad                   	lods   eax,DWORD PTR ds:[esi]
 485:	02 00                	add    al,BYTE PTR [eax]
 487:	00 01                	add    BYTE PTR [ecx],al
 489:	9d                   	popf   
 48a:	72 04                	jb     490 <cmdPrintEnv-0x30ffb70>
 48c:	10 03                	adc    BYTE PTR [ebx],al
 48e:	3a 01                	cmp    al,BYTE PTR [ecx]
 490:	00 00                	add    BYTE PTR [eax],al
 492:	01 9c db 04 00 00 0f 	add    DWORD PTR [ebx+ebx*8+0xf000004],ebx
 499:	9a 00 00 00 01 9d 5c 	call   0x5c9d:0x1000000
 4a0:	01 00                	add    DWORD PTR [eax],eax
 4a2:	00 02                	add    BYTE PTR [edx],al
 4a4:	91                   	xchg   ecx,eax
 4a5:	00 0d 74 6f 6b 00    	add    BYTE PTR ds:0x6b6f74,cl
 4ab:	01 9f 5c 01 00 00    	add    DWORD PTR [edi+0x15c],ebx
 4b1:	02 91 68 10 81 02    	add    dl,BYTE PTR [ecx+0x2811068]
 4b7:	00 00                	add    BYTE PTR [eax],al
 4b9:	01 b5 5c 01 00 00    	add    DWORD PTR [ebp+0x15c],esi
 4bf:	02 91 64 0c a1 04    	add    dl,BYTE PTR [ecx+0x4a10c64]
 4c5:	10 03                	adc    BYTE PTR [ebx],al
 4c7:	cc                   	int3   
 4c8:	00 00                	add    BYTE PTR [eax],al
 4ca:	00 0d 63 6e 74 00    	add    BYTE PTR ds:0x746e63,cl
 4d0:	01 a9 61 00 00 00    	add    DWORD PTR [ecx+0x61],ebp
 4d6:	02 91 6c 00 00 0b    	add    dl,BYTE PTR [ecx+0xb00006c]
 4dc:	02 01                	add    al,BYTE PTR [ecx]
 4de:	00 00                	add    BYTE PTR [eax],al
 4e0:	01 bb ac 05 10 03    	add    DWORD PTR [ebx+0x31005ac],edi
 4e6:	4e                   	dec    esi
 4e7:	00 00                	add    BYTE PTR [eax],al
 4e9:	00 01                	add    BYTE PTR [ecx],al
 4eb:	9c                   	pushf  
 4ec:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
 4ef:	00 0d 62 75 66 00    	add    BYTE PTR ds:0x667562,cl
 4f5:	01 bd 5c 01 00 00    	add    DWORD PTR [ebp+0x15c],edi
 4fb:	02 91 6c 00 0e 85    	add    dl,BYTE PTR [ecx-0x7af1ff94]
 501:	01 00                	add    DWORD PTR [eax],eax
 503:	00 01                	add    BYTE PTR [ecx],al
 505:	c2 fa 05             	ret    0x5fa
 508:	10 03                	adc    BYTE PTR [ebx],al
 50a:	67 00 00             	add    BYTE PTR [bx+si],al
 50d:	00 01                	add    BYTE PTR [ecx],al
 50f:	9c                   	pushf  
 510:	40                   	inc    eax
 511:	05 00 00 0f 9a       	add    eax,0x9a0f0000
 516:	00 00                	add    BYTE PTR [eax],al
 518:	00 01                	add    BYTE PTR [ecx],al
 51a:	c2 5c 01             	ret    0x15c
 51d:	00 00                	add    BYTE PTR [eax],al
 51f:	02 91 00 10 c3 01    	add    dl,BYTE PTR [ecx+0x1c31000]
 525:	00 00                	add    BYTE PTR [eax],al
 527:	01 c4                	add    esp,eax
 529:	20 02                	and    BYTE PTR [edx],al
 52b:	00 00                	add    BYTE PTR [eax],al
 52d:	03 91 ec 75 10 56    	add    edx,DWORD PTR [ecx+0x561075ec]
 533:	01 00                	add    DWORD PTR [eax],eax
 535:	00 01                	add    BYTE PTR [ecx],al
 537:	c5 3a                	lds    edi,FWORD PTR [edx]
 539:	00 00                	add    BYTE PTR [eax],al
 53b:	00 02                	add    BYTE PTR [edx],al
 53d:	91                   	xchg   ecx,eax
 53e:	6c                   	ins    BYTE PTR es:[edi],dx
 53f:	00 11                	add    BYTE PTR [ecx],dl
 541:	64 01 00             	add    DWORD PTR fs:[eax],eax
 544:	00 50 05             	add    BYTE PTR [eax+0x5],dl
 547:	00 00                	add    BYTE PTR [eax],al
 549:	12 36                	adc    dh,BYTE PTR [esi]
 54b:	02 00                	add    al,BYTE PTR [eax]
 54d:	00 07                	add    BYTE PTR [edi],al
 54f:	00 10                	add    BYTE PTR [eax],dl
 551:	d4 02                	aam    0x2
 553:	00 00                	add    BYTE PTR [eax],al
 555:	04 31                	add    al,0x31
 557:	40                   	inc    eax
 558:	05 00 00 05 03       	add    eax,0x3050000
 55d:	e0 1d                	loopne 57c <cmdPrintEnv-0x30ffa84>
 55f:	10 03                	adc    BYTE PTR [ebx],al
 561:	17                   	pop    ss
 562:	c6 02 00             	mov    BYTE PTR [edx],0x0
 565:	00 05 34 56 00 00    	add    BYTE PTR ds:0x5634,al
 56b:	00 05 03 28 23 10    	add    BYTE PTR ds:0x10232803,al
 571:	03 17                	add    edx,DWORD PTR [edi]
 573:	a8 01                	test   al,0x1
 575:	00 00                	add    BYTE PTR [eax],al
 577:	05 35 56 00 00       	add    eax,0x5635
 57c:	00 05 03 2c 23 10    	add    BYTE PTR ds:0x10232c03,al
 582:	03 17                	add    edx,DWORD PTR [edi]
 584:	6a 00                	push   0x0
 586:	00 00                	add    BYTE PTR [eax],al
 588:	05 36 56 00 00       	add    eax,0x5636
 58d:	00 05 03 24 23 10    	add    BYTE PTR ds:0x10232403,al
 593:	03 17                	add    edx,DWORD PTR [edi]
 595:	d9 02                	fld    DWORD PTR [edx]
 597:	00 00                	add    BYTE PTR [eax],al
 599:	05 37 7a 00 00       	add    eax,0x7a37
 59e:	00 05 03 44 23 10    	add    BYTE PTR ds:0x10234403,al
 5a4:	03 17                	add    edx,DWORD PTR [edi]
 5a6:	1d 02 00 00 06       	sbb    eax,0x6000002
 5ab:	4c                   	dec    esp
 5ac:	b5 02                	mov    ch,0x2
 5ae:	00 00                	add    BYTE PTR [eax],al
 5b0:	05 03 34 23 10       	add    eax,0x10233403
 5b5:	03 18                	add    ebx,DWORD PTR [eax]
 5b7:	17                   	pop    ss
 5b8:	3d 01 00 00 04       	cmp    eax,0x4000001
 5bd:	22 c8                	and    cl,al
 5bf:	05 00 00 05 03       	add    eax,0x3050000
 5c4:	30 23                	xor    BYTE PTR [ebx],ah
 5c6:	10 03                	adc    BYTE PTR [ebx],al
 5c8:	07                   	pop    es
 5c9:	04 b6                	add    al,0xb6
 5cb:	05 00 00 19 d9       	add    eax,0xd9190000
 5d0:	05 00 00 1a 5c       	add    eax,0x5c1a0000
 5d5:	01 00                	add    DWORD PTR [eax],eax
 5d7:	00 00                	add    BYTE PTR [eax],al
 5d9:	17                   	pop    ss
 5da:	09 01                	or     DWORD PTR [ecx],eax
 5dc:	00 00                	add    BYTE PTR [eax],al
 5de:	04 23                	add    al,0x23
 5e0:	ea 05 00 00 05 03 20 	jmp    0x2003:0x5000005
 5e7:	23 10                	and    edx,DWORD PTR [eax]
 5e9:	03 07                	add    eax,DWORD PTR [edi]
 5eb:	04 ce                	add    al,0xce
 5ed:	05 00 00 11 25       	add    eax,0x25110000
 5f2:	00 00                	add    BYTE PTR [eax],al
 5f4:	00 01                	add    BYTE PTR [ecx],al
 5f6:	06                   	push   es
 5f7:	00 00                	add    BYTE PTR [eax],al
 5f9:	1b 36                	sbb    esi,DWORD PTR [esi]
 5fb:	02 00                	add    al,BYTE PTR [eax]
 5fd:	00 ff                	add    bh,bh
 5ff:	01 00                	add    DWORD PTR [eax],eax
 601:	17                   	pop    ss
 602:	b1 01                	mov    cl,0x1
 604:	00 00                	add    BYTE PTR [eax],al
 606:	04 29                	add    al,0x29
 608:	f0 05 00 00 05 03    	lock add eax,0x3050000
 60e:	20 21                	and    BYTE PTR [ecx],ah
 610:	10 03                	adc    BYTE PTR [ebx],al
 612:	17                   	pop    ss
 613:	02 03                	add    al,BYTE PTR [ebx]
 615:	00 00                	add    BYTE PTR [eax],al
 617:	04 2a                	add    al,0x2a
 619:	5c                   	pop    esp
 61a:	01 00                	add    DWORD PTR [eax],eax
 61c:	00 05 03 40 23 10    	add    BYTE PTR ds:0x10234003,al
 622:	03 17                	add    edx,DWORD PTR [edi]
 624:	00 00                	add    BYTE PTR [eax],al
 626:	00 00                	add    BYTE PTR [eax],al
 628:	04 2b                	add    al,0x2b
 62a:	b5 02                	mov    ch,0x2
 62c:	00 00                	add    BYTE PTR [eax],al
 62e:	05 03 08 20 10       	add    eax,0x10200803
 633:	03 11                	add    edx,DWORD PTR [ecx]
 635:	25 00 00 00 44       	and    eax,0x44000000
 63a:	06                   	push   es
 63b:	00 00                	add    BYTE PTR [eax],al
 63d:	12 36                	adc    dh,BYTE PTR [esi]
 63f:	02 00                	add    al,BYTE PTR [eax]
 641:	00 05 00 17 2d 01    	add    BYTE PTR ds:0x12d1700,al
 647:	00 00                	add    BYTE PTR [eax],al
 649:	04 2c                	add    al,0x2c
 64b:	34 06                	xor    al,0x6
 64d:	00 00                	add    BYTE PTR [eax],al
 64f:	05 03 00 20 10       	add    eax,0x10200003
 654:	03 17                	add    edx,DWORD PTR [edi]
 656:	29 02                	sub    DWORD PTR [edx],eax
 658:	00 00                	add    BYTE PTR [eax],al
 65a:	04 2d                	add    al,0x2d
 65c:	56                   	push   esi
 65d:	00 00                	add    BYTE PTR [eax],al
 65f:	00 05 03 3c 23 10    	add    BYTE PTR ds:0x10233c03,al
 665:	03 17                	add    edx,DWORD PTR [edi]
 667:	97                   	xchg   edi,eax
 668:	01 00                	add    DWORD PTR [eax],eax
 66a:	00 04 2d 56 00 00 00 	add    BYTE PTR [ebp*1+0x56],al
 671:	05 03 38 23 10       	add    eax,0x10233803
 676:	03 17                	add    edx,DWORD PTR [edi]
 678:	bb 02 00 00 04       	mov    ebx,0x4000002
 67d:	2e                   	cs
 67e:	1c 01                	sbb    al,0x1
 680:	00 00                	add    BYTE PTR [eax],al
 682:	05 03 48 23 10       	add    eax,0x10234803
 687:	03 11                	add    edx,DWORD PTR [ecx]
 689:	25 00 00 00 98       	and    eax,0x98000000
 68e:	06                   	push   es
 68f:	00 00                	add    BYTE PTR [eax],al
 691:	12 36                	adc    dh,BYTE PTR [esi]
 693:	02 00                	add    al,BYTE PTR [eax]
 695:	00 ff                	add    bh,bh
 697:	00 1c 63             	add    BYTE PTR [ebx+eiz*2],bl
 69a:	77 64                	ja     700 <cmdPrintEnv-0x30ff900>
 69c:	00 04 2f             	add    BYTE PTR [edi+ebp*1],al
 69f:	88 06                	mov    BYTE PTR [esi],al
 6a1:	00 00                	add    BYTE PTR [eax],al
 6a3:	05 03 20 20 10       	add    eax,0x10202003
 6a8:	03 00                	add    eax,DWORD PTR [eax]
 6aa:	e2 06                	loop   6b2 <cmdPrintEnv-0x30ff94e>
 6ac:	00 00                	add    BYTE PTR [eax],al
 6ae:	04 00                	add    al,0x0
 6b0:	76 01                	jbe    6b3 <cmdPrintEnv-0x30ff94d>
 6b2:	00 00                	add    BYTE PTR [eax],al
 6b4:	04 01                	add    al,0x1
 6b6:	a2 00 00 00 0c       	mov    ds:0xc000000,al
 6bb:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 6bc:	03 00                	add    eax,DWORD PTR [eax]
 6be:	00 37                	add    BYTE PTR [edi],dh
 6c0:	00 00                	add    BYTE PTR [eax],al
 6c2:	00 64 06 10          	add    BYTE PTR [esi+eax*1+0x10],ah
 6c6:	03 67 0a             	add    esp,DWORD PTR [edi+0xa]
 6c9:	00 00                	add    BYTE PTR [eax],al
 6cb:	9f                   	lahf   
 6cc:	01 00                	add    DWORD PTR [eax],eax
 6ce:	00 02                	add    BYTE PTR [edx],al
 6d0:	01 06                	add    DWORD PTR [esi],eax
 6d2:	e8 01 00 00 02       	call   20006d8 <cmdPrintEnv-0x10ff928>
 6d7:	01 06                	add    DWORD PTR [esi],eax
 6d9:	e1 01                	loope  6dc <cmdPrintEnv-0x30ff924>
 6db:	00 00                	add    BYTE PTR [eax],al
 6dd:	02 02                	add    al,BYTE PTR [edx]
 6df:	05 7e 00 00 00       	add    eax,0x7e
 6e4:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
 6eb:	02 08                	add    cl,BYTE PTR [eax]
 6ed:	05 68 01 00 00       	add    eax,0x168
 6f2:	04 cc                	add    al,0xcc
 6f4:	03 00                	add    eax,DWORD PTR [eax]
 6f6:	00 02                	add    BYTE PTR [edx],al
 6f8:	2e                   	cs
 6f9:	53                   	push   ebx
 6fa:	00 00                	add    BYTE PTR [eax],al
 6fc:	00 02                	add    BYTE PTR [edx],al
 6fe:	01 08                	add    DWORD PTR [eax],ecx
 700:	df 01                	fild   WORD PTR [ecx]
 702:	00 00                	add    BYTE PTR [eax],al
 704:	02 02                	add    al,BYTE PTR [edx]
 706:	07                   	pop    es
 707:	39 02                	cmp    DWORD PTR [edx],eax
 709:	00 00                	add    BYTE PTR [eax],al
 70b:	04 0c                	add    al,0xc
 70d:	02 00                	add    al,BYTE PTR [eax]
 70f:	00 02                	add    BYTE PTR [edx],al
 711:	34 6c                	xor    al,0x6c
 713:	00 00                	add    BYTE PTR [eax],al
 715:	00 02                	add    BYTE PTR [edx],al
 717:	04 07                	add    al,0x7
 719:	ff 01                	inc    DWORD PTR [ecx]
 71b:	00 00                	add    BYTE PTR [eax],al
 71d:	02 08                	add    cl,BYTE PTR [eax]
 71f:	07                   	pop    es
 720:	f5                   	cmc    
 721:	01 00                	add    DWORD PTR [eax],eax
 723:	00 02                	add    BYTE PTR [edx],al
 725:	04 05                	add    al,0x5
 727:	6d                   	ins    DWORD PTR es:[edi],dx
 728:	01 00                	add    DWORD PTR [eax],eax
 72a:	00 05 04 87 00 00    	add    BYTE PTR ds:0x8704,al
 730:	00 06                	add    BYTE PTR [esi],al
 732:	25 00 00 00 02       	and    eax,0x2000000
 737:	01 02                	add    DWORD PTR [edx],eax
 739:	74 02                	je     73d <cmdPrintEnv-0x30ff8c3>
 73b:	00 00                	add    BYTE PTR [eax],al
 73d:	07                   	pop    es
 73e:	10 03                	adc    BYTE PTR [ebx],al
 740:	12 cc                	adc    cl,ah
 742:	00 00                	add    BYTE PTR [eax],al
 744:	00 08                	add    BYTE PTR [eax],cl
 746:	ca 01 00             	retf   0x1
 749:	00 03                	add    BYTE PTR [ebx],al
 74b:	14 cc                	adc    al,0xcc
 74d:	00 00                	add    BYTE PTR [eax],al
 74f:	00 00                	add    BYTE PTR [eax],al
 751:	08 72 00             	or     BYTE PTR [edx+0x0],dh
 754:	00 00                	add    BYTE PTR [eax],al
 756:	03 15 cc 00 00 00    	add    edx,DWORD PTR ds:0xcc
 75c:	04 08                	add    al,0x8
 75e:	45                   	inc    ebp
 75f:	01 00                	add    DWORD PTR [eax],eax
 761:	00 03                	add    BYTE PTR [ebx],al
 763:	16                   	push   ss
 764:	d2 00                	rol    BYTE PTR [eax],cl
 766:	00 00                	add    BYTE PTR [eax],al
 768:	08 08                	or     BYTE PTR [eax],cl
 76a:	56                   	push   esi
 76b:	01 00                	add    DWORD PTR [eax],eax
 76d:	00 03                	add    BYTE PTR [ebx],al
 76f:	17                   	pop    ss
 770:	3a 00                	cmp    al,BYTE PTR [eax]
 772:	00 00                	add    BYTE PTR [eax],al
 774:	0c 00                	or     al,0x0
 776:	05 04 25 00 00       	add    eax,0x2504
 77b:	00 09                	add    BYTE PTR [ecx],cl
 77d:	04 04                	add    al,0x4
 77f:	1e                   	push   ds
 780:	03 00                	add    eax,DWORD PTR [eax]
 782:	00 03                	add    BYTE PTR [ebx],al
 784:	18 93 00 00 00 0a    	sbb    BYTE PTR [ebx+0xa000000],dl
 78a:	92                   	xchg   edx,eax
 78b:	03 00                	add    eax,DWORD PTR [eax]
 78d:	00 01                	add    BYTE PTR [ecx],al
 78f:	18 64 06 10          	sbb    BYTE PTR [esi+eax*1+0x10],ah
 793:	03 a6 00 00 00 01    	add    esp,DWORD PTR [esi+0x1000000]
 799:	9c                   	pushf  
 79a:	0f 01 00             	sgdtd  [eax]
 79d:	00 0b                	add    BYTE PTR [ebx],cl
 79f:	9d                   	popf   
 7a0:	03 00                	add    eax,DWORD PTR [eax]
 7a2:	00 01                	add    BYTE PTR [ecx],al
 7a4:	18 cc                	sbb    ah,cl
 7a6:	00 00                	add    BYTE PTR [eax],al
 7a8:	00 02                	add    BYTE PTR [edx],al
 7aa:	91                   	xchg   ecx,eax
 7ab:	00 0c 69             	add    BYTE PTR [ecx+ebp*2],cl
 7ae:	00 01                	add    BYTE PTR [ecx],al
 7b0:	1a 3a                	sbb    bh,BYTE PTR [edx]
 7b2:	00 00                	add    BYTE PTR [eax],al
 7b4:	00 02                	add    BYTE PTR [edx],al
 7b6:	91                   	xchg   ecx,eax
 7b7:	6c                   	ins    BYTE PTR es:[edi],dx
 7b8:	00 0d 61 03 00 00    	add    BYTE PTR ds:0x361,cl
 7be:	01 30                	add    DWORD PTR [eax],esi
 7c0:	3a 00                	cmp    al,BYTE PTR [eax]
 7c2:	00 00                	add    BYTE PTR [eax],al
 7c4:	0a 07                	or     al,BYTE PTR [edi]
 7c6:	10 03                	adc    BYTE PTR [ebx],al
 7c8:	a9 01 00 00 01       	test   eax,0x1000001
 7cd:	9c                   	pushf  
 7ce:	ad                   	lods   eax,DWORD PTR ds:[esi]
 7cf:	01 00                	add    DWORD PTR [eax],eax
 7d1:	00 0b                	add    BYTE PTR [ebx],cl
 7d3:	a9 04 00 00 01       	test   eax,0x1000004
 7d8:	30 cc                	xor    ah,cl
 7da:	00 00                	add    BYTE PTR [eax],al
 7dc:	00 02                	add    BYTE PTR [edx],al
 7de:	91                   	xchg   ecx,eax
 7df:	00 0b                	add    BYTE PTR [ebx],cl
 7e1:	c3                   	ret    
 7e2:	01 00                	add    DWORD PTR [eax],eax
 7e4:	00 01                	add    BYTE PTR [ecx],al
 7e6:	30 c4                	xor    ah,al
 7e8:	01 00                	add    DWORD PTR [eax],eax
 7ea:	00 02                	add    BYTE PTR [edx],al
 7ec:	91                   	xchg   ecx,eax
 7ed:	04 0b                	add    al,0xb
 7ef:	9e                   	sahf   
 7f0:	04 00                	add    al,0x0
 7f2:	00 01                	add    BYTE PTR [ecx],al
 7f4:	30 3a                	xor    BYTE PTR [edx],bh
 7f6:	00 00                	add    BYTE PTR [eax],al
 7f8:	00 02                	add    BYTE PTR [edx],al
 7fa:	91                   	xchg   ecx,eax
 7fb:	08 0c 78             	or     BYTE PTR [eax+edi*2],cl
 7fe:	00 01                	add    BYTE PTR [ecx],al
 800:	32 3a                	xor    bh,BYTE PTR [edx]
 802:	00 00                	add    BYTE PTR [eax],al
 804:	00 02                	add    BYTE PTR [edx],al
 806:	91                   	xchg   ecx,eax
 807:	6c                   	ins    BYTE PTR es:[edi],dx
 808:	0c 79                	or     al,0x79
 80a:	00 01                	add    BYTE PTR [ecx],al
 80c:	32 3a                	xor    bh,BYTE PTR [edx]
 80e:	00 00                	add    BYTE PTR [eax],al
 810:	00 02                	add    BYTE PTR [edx],al
 812:	91                   	xchg   ecx,eax
 813:	68 0e b1 04 00       	push   0x4b10e
 818:	00 01                	add    BYTE PTR [ecx],al
 81a:	33 3a                	xor    edi,DWORD PTR [edx]
 81c:	00 00                	add    BYTE PTR [eax],al
 81e:	00 02                	add    BYTE PTR [edx],al
 820:	91                   	xchg   ecx,eax
 821:	64                   	fs
 822:	0e                   	push   cs
 823:	86 03                	xchg   BYTE PTR [ebx],al
 825:	00 00                	add    BYTE PTR [eax],al
 827:	01 33                	add    DWORD PTR [ebx],esi
 829:	3a 00                	cmp    al,BYTE PTR [eax]
 82b:	00 00                	add    BYTE PTR [eax],al
 82d:	02 91 60 0e fd 03    	add    dl,BYTE PTR [ecx+0x3fd0e60]
 833:	00 00                	add    BYTE PTR [eax],al
 835:	01 34 8c             	add    DWORD PTR [esp+ecx*4],esi
 838:	00 00                	add    BYTE PTR [eax],al
 83a:	00 02                	add    BYTE PTR [edx],al
 83c:	91                   	xchg   ecx,eax
 83d:	5f                   	pop    edi
 83e:	0f 45 07             	cmovne eax,DWORD PTR [edi]
 841:	10 03                	adc    BYTE PTR [ebx],al
 843:	47                   	inc    edi
 844:	01 00                	add    DWORD PTR [eax],eax
 846:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 849:	6e                   	outs   dx,BYTE PTR ds:[esi]
 84a:	74 00                	je     84c <cmdPrintEnv-0x30ff7b4>
 84c:	01 38                	add    DWORD PTR [eax],edi
 84e:	6c                   	ins    BYTE PTR es:[edi],dx
 84f:	00 00                	add    BYTE PTR [eax],al
 851:	00 02                	add    BYTE PTR [edx],al
 853:	91                   	xchg   ecx,eax
 854:	58                   	pop    eax
 855:	00 00                	add    BYTE PTR [eax],al
 857:	10 25 00 00 00 bd    	adc    BYTE PTR ds:0xbd000000,ah
 85d:	01 00                	add    DWORD PTR [eax],eax
 85f:	00 11                	add    BYTE PTR [ecx],dl
 861:	bd 01 00 00 7f       	mov    ebp,0x7f000001
 866:	00 02                	add    BYTE PTR [edx],al
 868:	04 07                	add    al,0x7
 86a:	88 00                	mov    BYTE PTR [eax],al
 86c:	00 00                	add    BYTE PTR [eax],al
 86e:	05 04 ad 01 00       	add    eax,0x1ad04
 873:	00 0d e8 03 00 00    	add    BYTE PTR ds:0x3e8,cl
 879:	01 62 3a             	add    DWORD PTR [edx+0x3a],esp
 87c:	00 00                	add    BYTE PTR [eax],al
 87e:	00 b3 08 10 03 69    	add    BYTE PTR [ebx+0x69031008],dh
 884:	00 00                	add    BYTE PTR [eax],al
 886:	00 01                	add    BYTE PTR [ecx],al
 888:	9c                   	pushf  
 889:	0c 02                	or     al,0x2
 88b:	00 00                	add    BYTE PTR [eax],al
 88d:	0b e6                	or     esp,esi
 88f:	04 00                	add    al,0x0
 891:	00 01                	add    BYTE PTR [ecx],al
 893:	62                   	(bad)  
 894:	cc                   	int3   
 895:	00 00                	add    BYTE PTR [eax],al
 897:	00 02                	add    BYTE PTR [edx],al
 899:	91                   	xchg   ecx,eax
 89a:	00 0c 69             	add    BYTE PTR [ecx+ebp*2],cl
 89d:	00 01                	add    BYTE PTR [ecx],al
 89f:	64                   	fs
 8a0:	6c                   	ins    BYTE PTR es:[edi],dx
 8a1:	00 00                	add    BYTE PTR [eax],al
 8a3:	00 02                	add    BYTE PTR [edx],al
 8a5:	91                   	xchg   ecx,eax
 8a6:	6c                   	ins    BYTE PTR es:[edi],dx
 8a7:	0c 72                	or     al,0x72
 8a9:	65                   	gs
 8aa:	74 00                	je     8ac <cmdPrintEnv-0x30ff754>
 8ac:	01 65 3a             	add    DWORD PTR [ebp+0x3a],esp
 8af:	00 00                	add    BYTE PTR [eax],al
 8b1:	00 02                	add    BYTE PTR [edx],al
 8b3:	91                   	xchg   ecx,eax
 8b4:	68 00 0d 56 04       	push   0x4560d00
 8b9:	00 00                	add    BYTE PTR [eax],al
 8bb:	01 76 ca             	add    DWORD PTR [esi-0x36],esi
 8be:	02 00                	add    al,BYTE PTR [eax]
 8c0:	00 1c 09             	add    BYTE PTR [ecx+ecx*1],bl
 8c3:	10 03                	adc    BYTE PTR [ebx],al
 8c5:	8e 02                	mov    es,WORD PTR [edx]
 8c7:	00 00                	add    BYTE PTR [eax],al
 8c9:	01 9c ca 02 00 00 0b 	add    DWORD PTR [edx+ecx*8+0xb000002],ebx
 8d0:	72 03                	jb     8d5 <cmdPrintEnv-0x30ff72b>
 8d2:	00 00                	add    BYTE PTR [eax],al
 8d4:	01 76 81             	add    DWORD PTR [esi-0x7f],esi
 8d7:	00 00                	add    BYTE PTR [eax],al
 8d9:	00 02                	add    BYTE PTR [edx],al
 8db:	91                   	xchg   ecx,eax
 8dc:	00 0c 61             	add    BYTE PTR [ecx+eiz*2],cl
 8df:	72 67                	jb     948 <cmdPrintEnv-0x30ff6b8>
 8e1:	00 01                	add    BYTE PTR [ecx],al
 8e3:	78 cc                	js     8b1 <cmdPrintEnv-0x30ff74f>
 8e5:	00 00                	add    BYTE PTR [eax],al
 8e7:	00 02                	add    BYTE PTR [edx],al
 8e9:	91                   	xchg   ecx,eax
 8ea:	6c                   	ins    BYTE PTR es:[edi],dx
 8eb:	0e                   	push   cs
 8ec:	b9 04 00 00 01       	mov    ecx,0x1000004
 8f1:	79 cc                	jns    8bf <cmdPrintEnv-0x30ff741>
 8f3:	00 00                	add    BYTE PTR [eax],al
 8f5:	00 02                	add    BYTE PTR [edx],al
 8f7:	91                   	xchg   ecx,eax
 8f8:	68 0e 34 04 00       	push   0x4340e
 8fd:	00 01                	add    BYTE PTR [ecx],al
 8ff:	7a 3a                	jp     93b <cmdPrintEnv-0x30ff6c5>
 901:	00 00                	add    BYTE PTR [eax],al
 903:	00 02                	add    BYTE PTR [edx],al
 905:	91                   	xchg   ecx,eax
 906:	64                   	fs
 907:	0e                   	push   cs
 908:	b3 03                	mov    bl,0x3
 90a:	00 00                	add    BYTE PTR [eax],al
 90c:	01 7b 3a             	add    DWORD PTR [ebx+0x3a],edi
 90f:	00 00                	add    BYTE PTR [eax],al
 911:	00 02                	add    BYTE PTR [edx],al
 913:	91                   	xchg   ecx,eax
 914:	60                   	pusha  
 915:	0e                   	push   cs
 916:	33 04 00             	xor    eax,DWORD PTR [eax+eax*1]
 919:	00 01                	add    BYTE PTR [ecx],al
 91b:	7c 3a                	jl     957 <cmdPrintEnv-0x30ff6a9>
 91d:	00 00                	add    BYTE PTR [eax],al
 91f:	00 02                	add    BYTE PTR [edx],al
 921:	91                   	xchg   ecx,eax
 922:	5c                   	pop    esp
 923:	0e                   	push   cs
 924:	3e                   	ds
 925:	04 00                	add    al,0x0
 927:	00 01                	add    BYTE PTR [ecx],al
 929:	7d 3a                	jge    965 <cmdPrintEnv-0x30ff69b>
 92b:	00 00                	add    BYTE PTR [eax],al
 92d:	00 02                	add    BYTE PTR [edx],al
 92f:	91                   	xchg   ecx,eax
 930:	58                   	pop    eax
 931:	0e                   	push   cs
 932:	3b 04 00             	cmp    eax,DWORD PTR [eax+eax*1]
 935:	00 01                	add    BYTE PTR [ecx],al
 937:	7e 3a                	jle    973 <cmdPrintEnv-0x30ff68d>
 939:	00 00                	add    BYTE PTR [eax],al
 93b:	00 02                	add    BYTE PTR [edx],al
 93d:	91                   	xchg   ecx,eax
 93e:	54                   	push   esp
 93f:	0e                   	push   cs
 940:	5b                   	pop    ebx
 941:	04 00                	add    al,0x0
 943:	00 01                	add    BYTE PTR [ecx],al
 945:	7f ca                	jg     911 <cmdPrintEnv-0x30ff6ef>
 947:	02 00                	add    al,BYTE PTR [eax]
 949:	00 02                	add    BYTE PTR [edx],al
 94b:	91                   	xchg   ecx,eax
 94c:	50                   	push   eax
 94d:	0e                   	push   cs
 94e:	a3 04 00 00 01       	mov    ds:0x1000004,eax
 953:	80 ca 02             	or     dl,0x2
 956:	00 00                	add    BYTE PTR [eax],al
 958:	02 91 4c 0f dd 0a    	add    dl,BYTE PTR [ecx+0xadd0f4c]
 95e:	10 03                	adc    BYTE PTR [ebx],al
 960:	9e                   	sahf   
 961:	00 00                	add    BYTE PTR [eax],al
 963:	00 0e                	add    BYTE PTR [esi],cl
 965:	5c                   	pop    esp
 966:	03 00                	add    eax,DWORD PTR [eax]
 968:	00 01                	add    BYTE PTR [ecx],al
 96a:	d9 cc                	fxch   st(4)
 96c:	00 00                	add    BYTE PTR [eax],al
 96e:	00 02                	add    BYTE PTR [edx],al
 970:	91                   	xchg   ecx,eax
 971:	48                   	dec    eax
 972:	00 00                	add    BYTE PTR [eax],al
 974:	05 04 cc 00 00       	add    eax,0xcc04
 979:	00 0d 17 04 00 00    	add    BYTE PTR ds:0x417,cl
 97f:	01 ef                	add    edi,ebp
 981:	ca 02 00             	retf   0x2
 984:	00 aa 0b 10 03 76    	add    BYTE PTR [edx+0x7603100b],ch
 98a:	00 00                	add    BYTE PTR [eax],al
 98c:	00 01                	add    BYTE PTR [ecx],al
 98e:	9c                   	pushf  
 98f:	2c 03                	sub    al,0x3
 991:	00 00                	add    BYTE PTR [eax],al
 993:	0b 32                	or     esi,DWORD PTR [edx]
 995:	02 00                	add    al,BYTE PTR [eax]
 997:	00 01                	add    BYTE PTR [ecx],al
 999:	ef                   	out    dx,eax
 99a:	3a 00                	cmp    al,BYTE PTR [eax]
 99c:	00 00                	add    BYTE PTR [eax],al
 99e:	02 91 00 0b c3 01    	add    dl,BYTE PTR [ecx+0x1c30b00]
 9a4:	00 00                	add    BYTE PTR [eax],al
 9a6:	01 ef                	add    edi,ebp
 9a8:	c4 01                	les    eax,FWORD PTR [ecx]
 9aa:	00 00                	add    BYTE PTR [eax],al
 9ac:	02 91 04 0b 99 04    	add    dl,BYTE PTR [ecx+0x4990b04]
 9b2:	00 00                	add    BYTE PTR [eax],al
 9b4:	01 ef                	add    edi,ebp
 9b6:	ca 02 00             	retf   0x2
 9b9:	00 02                	add    BYTE PTR [edx],al
 9bb:	91                   	xchg   ecx,eax
 9bc:	08 0f                	or     BYTE PTR [edi],cl
 9be:	b1 0b                	mov    cl,0xb
 9c0:	10 03                	adc    BYTE PTR [ebx],al
 9c2:	67 00 00             	add    BYTE PTR [bx+si],al
 9c5:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 9c8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 9c9:	74 00                	je     9cb <cmdPrintEnv-0x30ff635>
 9cb:	01 f1                	add    ecx,esi
 9cd:	3a 00                	cmp    al,BYTE PTR [eax]
 9cf:	00 00                	add    BYTE PTR [eax],al
 9d1:	02 91 6c 00 00 0a    	add    dl,BYTE PTR [ecx+0xa00006c]
 9d7:	f4                   	hlt    
 9d8:	03 00                	add    eax,DWORD PTR [eax]
 9da:	00 01                	add    BYTE PTR [ecx],al
 9dc:	f9                   	stc    
 9dd:	20 0c 10             	and    BYTE PTR [eax+edx*1],cl
 9e0:	03 3d 00 00 00 01    	add    edi,DWORD PTR ds:0x1000000
 9e6:	9c                   	pushf  
 9e7:	76 03                	jbe    9ec <cmdPrintEnv-0x30ff614>
 9e9:	00 00                	add    BYTE PTR [eax],al
 9eb:	0b 32                	or     esi,DWORD PTR [edx]
 9ed:	02 00                	add    al,BYTE PTR [eax]
 9ef:	00 01                	add    BYTE PTR [ecx],al
 9f1:	f9                   	stc    
 9f2:	3a 00                	cmp    al,BYTE PTR [eax]
 9f4:	00 00                	add    BYTE PTR [eax],al
 9f6:	02 91 00 0b c3 01    	add    dl,BYTE PTR [ecx+0x1c30b00]
 9fc:	00 00                	add    BYTE PTR [eax],al
 9fe:	01 f9                	add    ecx,edi
 a00:	ca 02 00             	retf   0x2
 a03:	00 02                	add    BYTE PTR [edx],al
 a05:	91                   	xchg   ecx,eax
 a06:	04 0f                	add    al,0xf
 a08:	26                   	es
 a09:	0c 10                	or     al,0x10
 a0b:	03 26                	add    esp,DWORD PTR [esi]
 a0d:	00 00                	add    BYTE PTR [eax],al
 a0f:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 a12:	6e                   	outs   dx,BYTE PTR ds:[esi]
 a13:	74 00                	je     a15 <cmdPrintEnv-0x30ff5eb>
 a15:	01 fb                	add    ebx,edi
 a17:	3a 00                	cmp    al,BYTE PTR [eax]
 a19:	00 00                	add    BYTE PTR [eax],al
 a1b:	02 91 6c 00 00 12    	add    dl,BYTE PTR [ecx+0x1200006c]
 a21:	d4 03                	aam    0x3
 a23:	00 00                	add    BYTE PTR [eax],al
 a25:	01 00                	add    DWORD PTR [eax],eax
 a27:	01 8c 00 00 00 5d 0c 	add    DWORD PTR [eax+eax*1+0xc5d0000],ecx
 a2e:	10 03                	adc    BYTE PTR [ebx],al
 a30:	8c 00                	mov    WORD PTR [eax],es
 a32:	00 00                	add    BYTE PTR [eax],al
 a34:	01 9c e1 03 00 00 13 	add    DWORD PTR [ecx+eiz*8+0x13000003],ebx
 a3b:	43                   	inc    ebx
 a3c:	04 00                	add    al,0x0
 a3e:	00 01                	add    BYTE PTR [ecx],al
 a40:	00 01                	add    BYTE PTR [ecx],al
 a42:	cc                   	int3   
 a43:	00 00                	add    BYTE PTR [eax],al
 a45:	00 02                	add    BYTE PTR [edx],al
 a47:	91                   	xchg   ecx,eax
 a48:	00 13                	add    BYTE PTR [ebx],dl
 a4a:	ba 03 00 00 01       	mov    edx,0x1000003
 a4f:	00 01                	add    BYTE PTR [ecx],al
 a51:	cc                   	int3   
 a52:	00 00                	add    BYTE PTR [eax],al
 a54:	00 02                	add    BYTE PTR [edx],al
 a56:	91                   	xchg   ecx,eax
 a57:	04 0f                	add    al,0xf
 a59:	63 0c 10             	arpl   WORD PTR [eax+edx*1],cx
 a5c:	03 7f 00             	add    edi,DWORD PTR [edi+0x0]
 a5f:	00 00                	add    BYTE PTR [eax],al
 a61:	14 63                	adc    al,0x63
 a63:	6e                   	outs   dx,BYTE PTR ds:[esi]
 a64:	74 00                	je     a66 <cmdPrintEnv-0x30ff59a>
 a66:	01 03                	add    DWORD PTR [ebx],eax
 a68:	01 3a                	add    DWORD PTR [edx],edi
 a6a:	00 00                	add    BYTE PTR [eax],al
 a6c:	00 02                	add    BYTE PTR [edx],al
 a6e:	91                   	xchg   ecx,eax
 a6f:	6c                   	ins    BYTE PTR es:[edi],dx
 a70:	0f 7f 0c 10          	movq   QWORD PTR [eax+edx*1],mm1
 a74:	03 59 00             	add    ebx,DWORD PTR [ecx+0x0]
 a77:	00 00                	add    BYTE PTR [eax],al
 a79:	14 69                	adc    al,0x69
 a7b:	64                   	fs
 a7c:	78 00                	js     a7e <cmdPrintEnv-0x30ff582>
 a7e:	01 07                	add    DWORD PTR [edi],eax
 a80:	01 cc                	add    esp,ecx
 a82:	00 00                	add    BYTE PTR [eax],al
 a84:	00 02                	add    BYTE PTR [edx],al
 a86:	91                   	xchg   ecx,eax
 a87:	68 00 00 00 15       	push   0x15000000
 a8c:	4a                   	dec    edx
 a8d:	04 00                	add    al,0x0
 a8f:	00 01                	add    BYTE PTR [ecx],al
 a91:	1f                   	pop    ds
 a92:	01 e9                	add    ecx,ebp
 a94:	0c 10                	or     al,0x10
 a96:	03 2e                	add    ebp,DWORD PTR [esi]
 a98:	00 00                	add    BYTE PTR [eax],al
 a9a:	00 01                	add    BYTE PTR [ecx],al
 a9c:	9c                   	pushf  
 a9d:	07                   	pop    es
 a9e:	04 00                	add    al,0x0
 aa0:	00 13                	add    BYTE PTR [ebx],dl
 aa2:	e6 04                	out    0x4,al
 aa4:	00 00                	add    BYTE PTR [eax],al
 aa6:	01 1f                	add    DWORD PTR [edi],ebx
 aa8:	01 cc                	add    esp,ecx
 aaa:	00 00                	add    BYTE PTR [eax],al
 aac:	00 02                	add    BYTE PTR [edx],al
 aae:	91                   	xchg   ecx,eax
 aaf:	00 00                	add    BYTE PTR [eax],al
 ab1:	16                   	push   ss
 ab2:	3e 03 00             	add    eax,DWORD PTR ds:[eax]
 ab5:	00 01                	add    BYTE PTR [ecx],al
 ab7:	24 01                	and    al,0x1
 ab9:	17                   	pop    ss
 aba:	0d 10 03 23 00       	or     eax,0x230310
 abf:	00 00                	add    BYTE PTR [eax],al
 ac1:	01 9c 12 24 04 00 00 	add    DWORD PTR [edx+edx*1+0x424],ebx
 ac8:	01 29                	add    DWORD PTR [ecx],ebp
 aca:	01 3a                	add    DWORD PTR [edx],edi
 acc:	00 00                	add    BYTE PTR [eax],al
 ace:	00 3a                	add    BYTE PTR [edx],bh
 ad0:	0d 10 03 26 00       	or     eax,0x260310
 ad5:	00 00                	add    BYTE PTR [eax],al
 ad7:	01 9c 51 04 00 00 13 	add    DWORD PTR [ecx+edx*2+0x13000004],ebx
 ade:	e6 04                	out    0x4,al
 ae0:	00 00                	add    BYTE PTR [eax],al
 ae2:	01 29                	add    DWORD PTR [ecx],ebp
 ae4:	01 cc                	add    esp,ecx
 ae6:	00 00                	add    BYTE PTR [eax],al
 ae8:	00 02                	add    BYTE PTR [edx],al
 aea:	91                   	xchg   ecx,eax
 aeb:	00 17                	add    BYTE PTR [edi],dl
 aed:	c1 04 00 00          	rol    DWORD PTR [eax+eax*1],0x0
 af1:	01 2b                	add    DWORD PTR [ebx],ebp
 af3:	01 3a                	add    DWORD PTR [edx],edi
 af5:	00 00                	add    BYTE PTR [eax],al
 af7:	00 18                	add    BYTE PTR [eax],bl
 af9:	00 00                	add    BYTE PTR [eax],al
 afb:	12 78 04             	adc    bh,BYTE PTR [eax+0x4]
 afe:	00 00                	add    BYTE PTR [eax],al
 b00:	01 32                	add    DWORD PTR [edx],esi
 b02:	01 3a                	add    DWORD PTR [edx],edi
 b04:	00 00                	add    BYTE PTR [eax],al
 b06:	00 60 0d             	add    BYTE PTR [eax+0xd],ah
 b09:	10 03                	adc    BYTE PTR [ebx],al
 b0b:	6b 03 00             	imul   eax,DWORD PTR [ebx],0x0
 b0e:	00 01                	add    BYTE PTR [ecx],al
 b10:	9c                   	pushf  
 b11:	22 05 00 00 13 3e    	and    al,BYTE PTR ds:0x3e130000
 b17:	04 00                	add    al,0x0
 b19:	00 01                	add    BYTE PTR [ecx],al
 b1b:	32 01                	xor    al,BYTE PTR [ecx]
 b1d:	3a 00                	cmp    al,BYTE PTR [eax]
 b1f:	00 00                	add    BYTE PTR [eax],al
 b21:	02 91 00 13 5b 04    	add    dl,BYTE PTR [ecx+0x45b1300]
 b27:	00 00                	add    BYTE PTR [eax],al
 b29:	01 32                	add    DWORD PTR [edx],esi
 b2b:	01 ca                	add    edx,ecx
 b2d:	02 00                	add    al,BYTE PTR [eax]
 b2f:	00 02                	add    BYTE PTR [edx],al
 b31:	91                   	xchg   ecx,eax
 b32:	04 13                	add    al,0x13
 b34:	45                   	inc    ebp
 b35:	03 00                	add    eax,DWORD PTR [eax]
 b37:	00 01                	add    BYTE PTR [ecx],al
 b39:	32 01                	xor    al,BYTE PTR [ecx]
 b3b:	ca 02 00             	retf   0x2
 b3e:	00 02                	add    BYTE PTR [edx],al
 b40:	91                   	xchg   ecx,eax
 b41:	08 19                	or     BYTE PTR [ecx],bl
 b43:	9d                   	popf   
 b44:	03 00                	add    eax,DWORD PTR [eax]
 b46:	00 01                	add    BYTE PTR [ecx],al
 b48:	34 01                	xor    al,0x1
 b4a:	22 05 00 00 03 91    	and    al,BYTE PTR ds:0x91030000
 b50:	e4 7d                	in     al,0x7d
 b52:	19 6f 04             	sbb    DWORD PTR [edi+0x4],ebp
 b55:	00 00                	add    BYTE PTR [eax],al
 b57:	01 35 01 48 00 00    	add    DWORD PTR ds:0x4801,esi
 b5d:	00 03                	add    BYTE PTR [ebx],al
 b5f:	91                   	xchg   ecx,eax
 b60:	e3 7d                	jecxz  bdf <cmdPrintEnv-0x30ff421>
 b62:	19 78 03             	sbb    DWORD PTR [eax+0x3],edi
 b65:	00 00                	add    BYTE PTR [eax],al
 b67:	01 36                	add    DWORD PTR [esi],esi
 b69:	01 3a                	add    DWORD PTR [edx],edi
 b6b:	00 00                	add    BYTE PTR [eax],al
 b6d:	00 02                	add    BYTE PTR [edx],al
 b6f:	91                   	xchg   ecx,eax
 b70:	6c                   	ins    BYTE PTR es:[edi],dx
 b71:	19 ca                	sbb    edx,ecx
 b73:	04 00                	add    al,0x0
 b75:	00 01                	add    BYTE PTR [ecx],al
 b77:	37                   	aaa    
 b78:	01 3a                	add    DWORD PTR [edx],edi
 b7a:	00 00                	add    BYTE PTR [eax],al
 b7c:	00 02                	add    BYTE PTR [edx],al
 b7e:	91                   	xchg   ecx,eax
 b7f:	68 19 7f 04 00       	push   0x47f19
 b84:	00 01                	add    BYTE PTR [ecx],al
 b86:	38 01                	cmp    BYTE PTR [ecx],al
 b88:	32 05 00 00 03 91    	xor    al,BYTE PTR ds:0x91030000
 b8e:	cf                   	iret   
 b8f:	7d 1a                	jge    bab <cmdPrintEnv-0x30ff455>
 b91:	c0 03 00             	rol    BYTE PTR [ebx],0x0
 b94:	00 01                	add    BYTE PTR [ecx],al
 b96:	46                   	inc    esi
 b97:	01 f9                	add    ecx,edi
 b99:	0d 10 03 1a ee       	or     eax,0xee1a0310
 b9e:	04 00                	add    al,0x0
 ba0:	00 01                	add    BYTE PTR [ecx],al
 ba2:	4e                   	dec    esi
 ba3:	01 4b 0e             	add    DWORD PTR [ebx+0xe],ecx
 ba6:	10 03                	adc    BYTE PTR [ebx],al
 ba8:	1a 2e                	sbb    ch,BYTE PTR [esi]
 baa:	03 00                	add    eax,DWORD PTR [eax]
 bac:	00 01                	add    BYTE PTR [ecx],al
 bae:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 baf:	01 1d 10 10 03 0f    	add    DWORD PTR ds:0xf031010,ebx
 bb5:	f9                   	stc    
 bb6:	0d 10 03 a8 02       	or     eax,0x2a80310
 bbb:	00 00                	add    BYTE PTR [eax],al
 bbd:	14 69                	adc    al,0x69
 bbf:	00 01                	add    BYTE PTR [ecx],al
 bc1:	a9 01 3a 00 00       	test   eax,0x3a01
 bc6:	00 02                	add    BYTE PTR [edx],al
 bc8:	91                   	xchg   ecx,eax
 bc9:	64 00 00             	add    BYTE PTR fs:[eax],al
 bcc:	10 25 00 00 00 32    	adc    BYTE PTR ds:0x32000000,ah
 bd2:	05 00 00 11 bd       	add    eax,0xbd110000
 bd7:	01 00                	add    DWORD PTR [eax],eax
 bd9:	00 ff                	add    bh,bh
 bdb:	00 10                	add    BYTE PTR [eax],dl
 bdd:	25 00 00 00 42       	and    eax,0x42000000
 be2:	05 00 00 11 bd       	add    eax,0xbd110000
 be7:	01 00                	add    DWORD PTR [eax],eax
 be9:	00 13                	add    BYTE PTR [ebx],dl
 beb:	00 10                	add    BYTE PTR [eax],dl
 bed:	d4 00                	aam    0x0
 bef:	00 00                	add    BYTE PTR [eax],al
 bf1:	52                   	push   edx
 bf2:	05 00 00 11 bd       	add    eax,0xbd110000
 bf7:	01 00                	add    DWORD PTR [eax],eax
 bf9:	00 07                	add    BYTE PTR [edi],al
 bfb:	00 0e                	add    BYTE PTR [esi],cl
 bfd:	d4 02                	aam    0x2
 bff:	00 00                	add    BYTE PTR [eax],al
 c01:	03 31                	add    esi,DWORD PTR [ecx]
 c03:	42                   	inc    edx
 c04:	05 00 00 05 03       	add    eax,0x3050000
 c09:	60                   	pusha  
 c0a:	1e                   	push   ds
 c0b:	10 03                	adc    BYTE PTR [ebx],al
 c0d:	1b c6                	sbb    eax,esi
 c0f:	02 00                	add    al,BYTE PTR [eax]
 c11:	00 04 34             	add    BYTE PTR [esp+esi*1],al
 c14:	61                   	popa   
 c15:	00 00                	add    BYTE PTR [eax],al
 c17:	00 05 03 28 23 10    	add    BYTE PTR ds:0x10232803,al
 c1d:	03 1b                	add    ebx,DWORD PTR [ebx]
 c1f:	a8 01                	test   al,0x1
 c21:	00 00                	add    BYTE PTR [eax],al
 c23:	04 35                	add    al,0x35
 c25:	61                   	popa   
 c26:	00 00                	add    BYTE PTR [eax],al
 c28:	00 05 03 2c 23 10    	add    BYTE PTR ds:0x10232c03,al
 c2e:	03 1b                	add    ebx,DWORD PTR [ebx]
 c30:	6a 00                	push   0x0
 c32:	00 00                	add    BYTE PTR [eax],al
 c34:	04 36                	add    al,0x36
 c36:	61                   	popa   
 c37:	00 00                	add    BYTE PTR [eax],al
 c39:	00 05 03 24 23 10    	add    BYTE PTR ds:0x10232403,al
 c3f:	03 1b                	add    ebx,DWORD PTR [ebx]
 c41:	d9 02                	fld    DWORD PTR [edx]
 c43:	00 00                	add    BYTE PTR [eax],al
 c45:	04 37                	add    al,0x37
 c47:	7a 00                	jp     c49 <cmdPrintEnv-0x30ff3b7>
 c49:	00 00                	add    BYTE PTR [eax],al
 c4b:	05 03 44 23 10       	add    eax,0x10234403
 c50:	03 1b                	add    ebx,DWORD PTR [ebx]
 c52:	1d 02 00 00 05       	sbb    eax,0x5000002
 c57:	4c                   	dec    esp
 c58:	ca 02 00             	retf   0x2
 c5b:	00 05 03 34 23 10    	add    BYTE PTR ds:0x10233403,al
 c61:	03 1c 1b             	add    ebx,DWORD PTR [ebx+ebx*1]
 c64:	3d 01 00 00 03       	cmp    eax,0x3000001
 c69:	22 ca                	and    cl,dl
 c6b:	05 00 00 05 03       	add    eax,0x3050000
 c70:	30 23                	xor    BYTE PTR [ebx],ah
 c72:	10 03                	adc    BYTE PTR [ebx],al
 c74:	05 04 b8 05 00       	add    eax,0x5b804
 c79:	00 1d db 05 00 00    	add    BYTE PTR ds:0x5db,bl
 c7f:	1e                   	push   ds
 c80:	cc                   	int3   
 c81:	00 00                	add    BYTE PTR [eax],al
 c83:	00 00                	add    BYTE PTR [eax],al
 c85:	1b 09                	sbb    ecx,DWORD PTR [ecx]
 c87:	01 00                	add    DWORD PTR [eax],eax
 c89:	00 03                	add    BYTE PTR [ebx],al
 c8b:	23 ec                	and    ebp,esp
 c8d:	05 00 00 05 03       	add    eax,0x3050000
 c92:	20 23                	and    BYTE PTR [ebx],ah
 c94:	10 03                	adc    BYTE PTR [ebx],al
 c96:	05 04 d0 05 00       	add    eax,0x5d004
 c9b:	00 10                	add    BYTE PTR [eax],dl
 c9d:	25 00 00 00 03       	and    eax,0x3000000
 ca2:	06                   	push   es
 ca3:	00 00                	add    BYTE PTR [eax],al
 ca5:	1f                   	pop    ds
 ca6:	bd 01 00 00 ff       	mov    ebp,0xff000001
 cab:	01 00                	add    DWORD PTR [eax],eax
 cad:	1b b1 01 00 00 03    	sbb    esi,DWORD PTR [ecx+0x3000001]
 cb3:	29 f2                	sub    edx,esi
 cb5:	05 00 00 05 03       	add    eax,0x3050000
 cba:	20 21                	and    BYTE PTR [ecx],ah
 cbc:	10 03                	adc    BYTE PTR [ebx],al
 cbe:	1b 02                	sbb    eax,DWORD PTR [edx]
 cc0:	03 00                	add    eax,DWORD PTR [eax]
 cc2:	00 03                	add    BYTE PTR [ebx],al
 cc4:	2a cc                	sub    cl,ah
 cc6:	00 00                	add    BYTE PTR [eax],al
 cc8:	00 05 03 40 23 10    	add    BYTE PTR ds:0x10234003,al
 cce:	03 1b                	add    ebx,DWORD PTR [ebx]
 cd0:	00 00                	add    BYTE PTR [eax],al
 cd2:	00 00                	add    BYTE PTR [eax],al
 cd4:	03 2b                	add    ebp,DWORD PTR [ebx]
 cd6:	ca 02 00             	retf   0x2
 cd9:	00 05 03 08 20 10    	add    BYTE PTR ds:0x10200803,al
 cdf:	03 10                	add    edx,DWORD PTR [eax]
 ce1:	25 00 00 00 46       	and    eax,0x46000000
 ce6:	06                   	push   es
 ce7:	00 00                	add    BYTE PTR [eax],al
 ce9:	11 bd 01 00 00 05    	adc    DWORD PTR [ebp+0x5000001],edi
 cef:	00 1b                	add    BYTE PTR [ebx],bl
 cf1:	2d 01 00 00 03       	sub    eax,0x3000001
 cf6:	2c 36                	sub    al,0x36
 cf8:	06                   	push   es
 cf9:	00 00                	add    BYTE PTR [eax],al
 cfb:	05 03 00 20 10       	add    eax,0x10200003
 d00:	03 1b                	add    ebx,DWORD PTR [ebx]
 d02:	29 02                	sub    DWORD PTR [edx],eax
 d04:	00 00                	add    BYTE PTR [eax],al
 d06:	03 2d 61 00 00 00    	add    ebp,DWORD PTR ds:0x61
 d0c:	05 03 3c 23 10       	add    eax,0x10233c03
 d11:	03 1b                	add    ebx,DWORD PTR [ebx]
 d13:	97                   	xchg   edi,eax
 d14:	01 00                	add    DWORD PTR [eax],eax
 d16:	00 03                	add    BYTE PTR [ebx],al
 d18:	2d 61 00 00 00       	sub    eax,0x61
 d1d:	05 03 38 23 10       	add    eax,0x10233803
 d22:	03 1b                	add    ebx,DWORD PTR [ebx]
 d24:	bb 02 00 00 03       	mov    ebx,0x3000002
 d29:	2e 8c 00             	mov    WORD PTR cs:[eax],es
 d2c:	00 00                	add    BYTE PTR [eax],al
 d2e:	05 03 48 23 10       	add    eax,0x10234803
 d33:	03 20                	add    esp,DWORD PTR [eax]
 d35:	63 77 64             	arpl   WORD PTR [edi+0x64],si
 d38:	00 03                	add    BYTE PTR [ebx],al
 d3a:	2f                   	das    
 d3b:	22 05 00 00 05 03    	and    al,BYTE PTR ds:0x3050000
 d41:	20 20                	and    BYTE PTR [eax],ah
 d43:	10 03                	adc    BYTE PTR [ebx],al
 d45:	10 25 00 00 00 b2    	adc    BYTE PTR ds:0xb2000000,ah
 d4b:	06                   	push   es
 d4c:	00 00                	add    BYTE PTR [eax],al
 d4e:	1f                   	pop    ds
 d4f:	bd 01 00 00 f3       	mov    ebp,0xf3000001
 d54:	01 11                	add    DWORD PTR [ecx],edx
 d56:	bd 01 00 00 7f       	mov    ebp,0x7f000001
 d5b:	00 1b                	add    BYTE PTR [ebx],bl
 d5d:	60                   	pusha  
 d5e:	04 00                	add    al,0x0
 d60:	00 01                	add    BYTE PTR [ecx],al
 d62:	10 9b 06 00 00 05    	adc    BYTE PTR [ebx+0x5000006],bl
 d68:	03 60 23             	add    esp,DWORD PTR [eax+0x23]
 d6b:	10 03                	adc    BYTE PTR [ebx],al
 d6d:	1b 87 04 00 00 01    	sbb    eax,DWORD PTR [edi+0x1000004]
 d73:	11 3a                	adc    DWORD PTR [edx],edi
 d75:	00 00                	add    BYTE PTR [eax],al
 d77:	00 05 03 4c 23 10    	add    BYTE PTR ds:0x10234c03,al
 d7d:	03 1b                	add    ebx,DWORD PTR [ebx]
 d7f:	4a                   	dec    edx
 d80:	03 00                	add    eax,DWORD PTR [eax]
 d82:	00 01                	add    BYTE PTR [ecx],al
 d84:	12 3a                	adc    bh,BYTE PTR [edx]
 d86:	00 00                	add    BYTE PTR [eax],al
 d88:	00 05 03 50 23 10    	add    BYTE PTR ds:0x10235003,al
 d8e:	03 00                	add    eax,DWORD PTR [eax]

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
  79:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  7c:	19 03                	sbb    DWORD PTR [ebx],eax
  7e:	0e                   	push   cs
  7f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  81:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  83:	11 01                	adc    DWORD PTR [ecx],eax
  85:	12 06                	adc    al,BYTE PTR [esi]
  87:	40                   	inc    eax
  88:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  8e:	00 00                	add    BYTE PTR [eax],al
  90:	0c 0b                	or     al,0xb
  92:	01 11                	add    DWORD PTR [ecx],edx
  94:	01 12                	add    DWORD PTR [edx],edx
  96:	06                   	push   es
  97:	00 00                	add    BYTE PTR [eax],al
  99:	0d 34 00 03 08       	or     eax,0x8030034
  9e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  a0:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  a2:	49                   	dec    ecx
  a3:	13 02                	adc    eax,DWORD PTR [edx]
  a5:	18 00                	sbb    BYTE PTR [eax],al
  a7:	00 0e                	add    BYTE PTR [esi],cl
  a9:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  ac:	19 03                	sbb    DWORD PTR [ebx],eax
  ae:	0e                   	push   cs
  af:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  b1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  b3:	27                   	daa    
  b4:	19 11                	sbb    DWORD PTR [ecx],edx
  b6:	01 12                	add    DWORD PTR [edx],edx
  b8:	06                   	push   es
  b9:	40                   	inc    eax
  ba:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  c0:	00 00                	add    BYTE PTR [eax],al
  c2:	0f 05                	syscall 
  c4:	00 03                	add    BYTE PTR [ebx],al
  c6:	0e                   	push   cs
  c7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  c9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  cb:	49                   	dec    ecx
  cc:	13 02                	adc    eax,DWORD PTR [edx]
  ce:	18 00                	sbb    BYTE PTR [eax],al
  d0:	00 10                	add    BYTE PTR [eax],dl
  d2:	34 00                	xor    al,0x0
  d4:	03 0e                	add    ecx,DWORD PTR [esi]
  d6:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  d8:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  da:	49                   	dec    ecx
  db:	13 02                	adc    eax,DWORD PTR [edx]
  dd:	18 00                	sbb    BYTE PTR [eax],al
  df:	00 11                	add    BYTE PTR [ecx],dl
  e1:	01 01                	add    DWORD PTR [ecx],eax
  e3:	49                   	dec    ecx
  e4:	13 01                	adc    eax,DWORD PTR [ecx]
  e6:	13 00                	adc    eax,DWORD PTR [eax]
  e8:	00 12                	add    BYTE PTR [edx],dl
  ea:	21 00                	and    DWORD PTR [eax],eax
  ec:	49                   	dec    ecx
  ed:	13 2f                	adc    ebp,DWORD PTR [edi]
  ef:	0b 00                	or     eax,DWORD PTR [eax]
  f1:	00 13                	add    BYTE PTR [ebx],dl
  f3:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  f6:	19 03                	sbb    DWORD PTR [ebx],eax
  f8:	0e                   	push   cs
  f9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  fb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  fd:	27                   	daa    
  fe:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 101:	11 01                	adc    DWORD PTR [ecx],eax
 103:	12 06                	adc    al,BYTE PTR [esi]
 105:	40                   	inc    eax
 106:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 10c:	00 00                	add    BYTE PTR [eax],al
 10e:	14 34                	adc    al,0x34
 110:	00 03                	add    BYTE PTR [ebx],al
 112:	08 3a                	or     BYTE PTR [edx],bh
 114:	0b 3b                	or     edi,DWORD PTR [ebx]
 116:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 119:	00 00                	add    BYTE PTR [eax],al
 11b:	15 34 00 03 0e       	adc    eax,0xe030034
 120:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 122:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 124:	49                   	dec    ecx
 125:	13 00                	adc    eax,DWORD PTR [eax]
 127:	00 16                	add    BYTE PTR [esi],dl
 129:	0b 01                	or     eax,DWORD PTR [ecx]
 12b:	11 01                	adc    DWORD PTR [ecx],eax
 12d:	12 06                	adc    al,BYTE PTR [esi]
 12f:	01 13                	add    DWORD PTR [ebx],edx
 131:	00 00                	add    BYTE PTR [eax],al
 133:	17                   	pop    ss
 134:	34 00                	xor    al,0x0
 136:	03 0e                	add    ecx,DWORD PTR [esi]
 138:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 13a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 13c:	49                   	dec    ecx
 13d:	13 3f                	adc    edi,DWORD PTR [edi]
 13f:	19 02                	sbb    DWORD PTR [edx],eax
 141:	18 00                	sbb    BYTE PTR [eax],al
 143:	00 18                	add    BYTE PTR [eax],bl
 145:	15 00 27 19 00       	adc    eax,0x192700
 14a:	00 19                	add    BYTE PTR [ecx],bl
 14c:	15 01 27 19 01       	adc    eax,0x1192701
 151:	13 00                	adc    eax,DWORD PTR [eax]
 153:	00 1a                	add    BYTE PTR [edx],bl
 155:	05 00 49 13 00       	add    eax,0x134900
 15a:	00 1b                	add    BYTE PTR [ebx],bl
 15c:	21 00                	and    DWORD PTR [eax],eax
 15e:	49                   	dec    ecx
 15f:	13 2f                	adc    ebp,DWORD PTR [edi]
 161:	05 00 00 1c 34       	add    eax,0x341c0000
 166:	00 03                	add    BYTE PTR [ebx],al
 168:	08 3a                	or     BYTE PTR [edx],bh
 16a:	0b 3b                	or     edi,DWORD PTR [ebx]
 16c:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 16f:	3f                   	aas    
 170:	19 02                	sbb    DWORD PTR [edx],eax
 172:	18 00                	sbb    BYTE PTR [eax],al
 174:	00 00                	add    BYTE PTR [eax],al
 176:	01 11                	add    DWORD PTR [ecx],edx
 178:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 17e:	0e                   	push   cs
 17f:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 181:	11 01                	adc    DWORD PTR [ecx],eax
 183:	12 06                	adc    al,BYTE PTR [esi]
 185:	10 17                	adc    BYTE PTR [edi],dl
 187:	00 00                	add    BYTE PTR [eax],al
 189:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 18c:	0b 0b                	or     ecx,DWORD PTR [ebx]
 18e:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 191:	0e                   	push   cs
 192:	00 00                	add    BYTE PTR [eax],al
 194:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 197:	0b 0b                	or     ecx,DWORD PTR [ebx]
 199:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 19c:	08 00                	or     BYTE PTR [eax],al
 19e:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 1a1:	00 03                	add    BYTE PTR [ebx],al
 1a3:	0e                   	push   cs
 1a4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1a6:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1a8:	49                   	dec    ecx
 1a9:	13 00                	adc    eax,DWORD PTR [eax]
 1ab:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 1b1:	49                   	dec    ecx
 1b2:	13 00                	adc    eax,DWORD PTR [eax]
 1b4:	00 06                	add    BYTE PTR [esi],al
 1b6:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 1ba:	00 00                	add    BYTE PTR [eax],al
 1bc:	07                   	pop    es
 1bd:	13 01                	adc    eax,DWORD PTR [ecx]
 1bf:	0b 0b                	or     ecx,DWORD PTR [ebx]
 1c1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1c3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1c5:	01 13                	add    DWORD PTR [ebx],edx
 1c7:	00 00                	add    BYTE PTR [eax],al
 1c9:	08 0d 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,cl
 1cf:	0b 3b                	or     edi,DWORD PTR [ebx]
 1d1:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 1d4:	38 0b                	cmp    BYTE PTR [ebx],cl
 1d6:	00 00                	add    BYTE PTR [eax],al
 1d8:	09 0f                	or     DWORD PTR [edi],ecx
 1da:	00 0b                	add    BYTE PTR [ebx],cl
 1dc:	0b 00                	or     eax,DWORD PTR [eax]
 1de:	00 0a                	add    BYTE PTR [edx],cl
 1e0:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 1e3:	19 03                	sbb    DWORD PTR [ebx],eax
 1e5:	0e                   	push   cs
 1e6:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1e8:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1ea:	27                   	daa    
 1eb:	19 11                	sbb    DWORD PTR [ecx],edx
 1ed:	01 12                	add    DWORD PTR [edx],edx
 1ef:	06                   	push   es
 1f0:	40                   	inc    eax
 1f1:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 1f7:	00 00                	add    BYTE PTR [eax],al
 1f9:	0b 05 00 03 0e 3a    	or     eax,DWORD PTR ds:0x3a0e0300
 1ff:	0b 3b                	or     edi,DWORD PTR [ebx]
 201:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 204:	02 18                	add    bl,BYTE PTR [eax]
 206:	00 00                	add    BYTE PTR [eax],al
 208:	0c 34                	or     al,0x34
 20a:	00 03                	add    BYTE PTR [ebx],al
 20c:	08 3a                	or     BYTE PTR [edx],bh
 20e:	0b 3b                	or     edi,DWORD PTR [ebx]
 210:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 213:	02 18                	add    bl,BYTE PTR [eax]
 215:	00 00                	add    BYTE PTR [eax],al
 217:	0d 2e 01 3f 19       	or     eax,0x193f012e
 21c:	03 0e                	add    ecx,DWORD PTR [esi]
 21e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 220:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 222:	27                   	daa    
 223:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 226:	11 01                	adc    DWORD PTR [ecx],eax
 228:	12 06                	adc    al,BYTE PTR [esi]
 22a:	40                   	inc    eax
 22b:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 231:	00 00                	add    BYTE PTR [eax],al
 233:	0e                   	push   cs
 234:	34 00                	xor    al,0x0
 236:	03 0e                	add    ecx,DWORD PTR [esi]
 238:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 23a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 23c:	49                   	dec    ecx
 23d:	13 02                	adc    eax,DWORD PTR [edx]
 23f:	18 00                	sbb    BYTE PTR [eax],al
 241:	00 0f                	add    BYTE PTR [edi],cl
 243:	0b 01                	or     eax,DWORD PTR [ecx]
 245:	11 01                	adc    DWORD PTR [ecx],eax
 247:	12 06                	adc    al,BYTE PTR [esi]
 249:	00 00                	add    BYTE PTR [eax],al
 24b:	10 01                	adc    BYTE PTR [ecx],al
 24d:	01 49 13             	add    DWORD PTR [ecx+0x13],ecx
 250:	01 13                	add    DWORD PTR [ebx],edx
 252:	00 00                	add    BYTE PTR [eax],al
 254:	11 21                	adc    DWORD PTR [ecx],esp
 256:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 259:	2f                   	das    
 25a:	0b 00                	or     eax,DWORD PTR [eax]
 25c:	00 12                	add    BYTE PTR [edx],dl
 25e:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 261:	19 03                	sbb    DWORD PTR [ebx],eax
 263:	0e                   	push   cs
 264:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 266:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 26c:	11 01                	adc    DWORD PTR [ecx],eax
 26e:	12 06                	adc    al,BYTE PTR [esi]
 270:	40                   	inc    eax
 271:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 277:	00 00                	add    BYTE PTR [eax],al
 279:	13 05 00 03 0e 3a    	adc    eax,DWORD PTR ds:0x3a0e0300
 27f:	0b 3b                	or     edi,DWORD PTR [ebx]
 281:	05 49 13 02 18       	add    eax,0x18021349
 286:	00 00                	add    BYTE PTR [eax],al
 288:	14 34                	adc    al,0x34
 28a:	00 03                	add    BYTE PTR [ebx],al
 28c:	08 3a                	or     BYTE PTR [edx],bh
 28e:	0b 3b                	or     edi,DWORD PTR [ebx]
 290:	05 49 13 02 18       	add    eax,0x18021349
 295:	00 00                	add    BYTE PTR [eax],al
 297:	15 2e 01 3f 19       	adc    eax,0x193f012e
 29c:	03 0e                	add    ecx,DWORD PTR [esi]
 29e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2a0:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 2a6:	12 06                	adc    al,BYTE PTR [esi]
 2a8:	40                   	inc    eax
 2a9:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 2af:	00 00                	add    BYTE PTR [eax],al
 2b1:	16                   	push   ss
 2b2:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
 2b5:	19 03                	sbb    DWORD PTR [ebx],eax
 2b7:	0e                   	push   cs
 2b8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2ba:	3b 05 11 01 12 06    	cmp    eax,DWORD PTR ds:0x6120111
 2c0:	40                   	inc    eax
 2c1:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 2c7:	17                   	pop    ss
 2c8:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 2cb:	19 03                	sbb    DWORD PTR [ebx],eax
 2cd:	0e                   	push   cs
 2ce:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2d0:	3b 05 49 13 3c 19    	cmp    eax,DWORD PTR ds:0x193c1349
 2d6:	00 00                	add    BYTE PTR [eax],al
 2d8:	18 18                	sbb    BYTE PTR [eax],bl
 2da:	00 00                	add    BYTE PTR [eax],al
 2dc:	00 19                	add    BYTE PTR [ecx],bl
 2de:	34 00                	xor    al,0x0
 2e0:	03 0e                	add    ecx,DWORD PTR [esi]
 2e2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2e4:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 2ea:	00 00                	add    BYTE PTR [eax],al
 2ec:	1a 0a                	sbb    cl,BYTE PTR [edx]
 2ee:	00 03                	add    BYTE PTR [ebx],al
 2f0:	0e                   	push   cs
 2f1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2f3:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 2f9:	1b 34 00             	sbb    esi,DWORD PTR [eax+eax*1]
 2fc:	03 0e                	add    ecx,DWORD PTR [esi]
 2fe:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 300:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 302:	49                   	dec    ecx
 303:	13 3f                	adc    edi,DWORD PTR [edi]
 305:	19 02                	sbb    DWORD PTR [edx],eax
 307:	18 00                	sbb    BYTE PTR [eax],al
 309:	00 1c 15 00 27 19 00 	add    BYTE PTR [edx*1+0x192700],bl
 310:	00 1d 15 01 27 19    	add    BYTE PTR ds:0x19270115,bl
 316:	01 13                	add    DWORD PTR [ebx],edx
 318:	00 00                	add    BYTE PTR [eax],al
 31a:	1e                   	push   ds
 31b:	05 00 49 13 00       	add    eax,0x134900
 320:	00 1f                	add    BYTE PTR [edi],bl
 322:	21 00                	and    DWORD PTR [eax],eax
 324:	49                   	dec    ecx
 325:	13 2f                	adc    ebp,DWORD PTR [edi]
 327:	05 00 00 20 34       	add    eax,0x34200000
 32c:	00 03                	add    BYTE PTR [ebx],al
 32e:	08 3a                	or     BYTE PTR [edx],bh
 330:	0b 3b                	or     edi,DWORD PTR [ebx]
 332:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 335:	3f                   	aas    
 336:	19 02                	sbb    DWORD PTR [edx],eax
 338:	18 00                	sbb    BYTE PTR [eax],al
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
  14:	61                   	popa   
  15:	06                   	push   es
	...
  1e:	00 00                	add    BYTE PTR [eax],al
  20:	1c 00                	sbb    al,0x0
  22:	00 00                	add    BYTE PTR [eax],al
  24:	02 00                	add    al,BYTE PTR [eax]
  26:	aa                   	stos   BYTE PTR es:[edi],al
  27:	06                   	push   es
  28:	00 00                	add    BYTE PTR [eax],al
  2a:	04 00                	add    al,0x0
  2c:	00 00                	add    BYTE PTR [eax],al
  2e:	00 00                	add    BYTE PTR [eax],al
  30:	64                   	fs
  31:	06                   	push   es
  32:	10 03                	adc    BYTE PTR [ebx],al
  34:	67 0a 00             	or     al,BYTE PTR [bx+si]
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	9b                   	fwait
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
  1b:	73 72                	jae    8f <cmdPrintEnv-0x30fff71>
  1d:	63 00                	arpl   WORD PTR [eax],ax
  1f:	2f                   	das    
  20:	68 6f 6d 65 2f       	push   0x2f656d6f
  25:	79 6f                	jns    96 <cmdPrintEnv-0x30fff6a>
  27:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
  2e:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
  31:	73 73                	jae    a6 <cmdPrintEnv-0x30fff5a>
  33:	2f                   	das    
  34:	6c                   	ins    BYTE PTR es:[edi],dx
  35:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
  3c:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
  42:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
  48:	78 2d                	js     77 <cmdPrintEnv-0x30fff89>
  4a:	67 6e                	outs   dx,BYTE PTR ds:[si]
  4c:	75 2f                	jne    7d <cmdPrintEnv-0x30fff83>
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
  82:	73 2e                	jae    b2 <cmdPrintEnv-0x30fff4e>
  84:	63 00                	arpl   WORD PTR [eax],ax
  86:	01 00                	add    DWORD PTR [eax],eax
  88:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  8b:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
  92:	63 
  93:	2e                   	cs
  94:	68 00 02 00 00       	push   0x200
  99:	74 69                	je     104 <cmdPrintEnv-0x30ffefc>
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
  d6:	67 92                	addr16 xchg edx,eax
  d8:	08 30                	or     BYTE PTR [eax],dh
  da:	00 02                	add    BYTE PTR [edx],al
  dc:	04 02                	add    al,0x2
  de:	08 e0                	or     al,ah
  e0:	00 02                	add    BYTE PTR [edx],al
  e2:	04 01                	add    al,0x1
  e4:	06                   	push   es
  e5:	4a                   	dec    edx
  e6:	06                   	push   es
  e7:	6e                   	outs   dx,BYTE PTR ds:[esi]
  e8:	3f                   	aas    
  e9:	94                   	xchg   esp,eax
  ea:	02 22                	add    ah,BYTE PTR [edx]
  ec:	14 d7                	adc    al,0xd7
  ee:	08 91 68 f3 5a f3    	or     BYTE PTR [ecx-0xca50c98],dl
  f4:	08 f3                	or     bl,dh
  f6:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
  f9:	21 08                	and    DWORD PTR [eax],ecx
  fb:	83 ad 08 f3 d7 d7 08 	sub    DWORD PTR [ebp-0x28280cf8],0x8
 102:	13 d7                	adc    edx,edi
 104:	f5                   	cmc    
 105:	59                   	pop    ecx
 106:	31 bb 08 68 68 af    	xor    DWORD PTR [ebx-0x509797f8],edi
 10c:	08 3e                	or     BYTE PTR [esi],bh
 10e:	08 67 08             	or     BYTE PTR [edi+0x8],ah
 111:	5c                   	pop    esp
 112:	08 30                	or     BYTE PTR [eax],dh
 114:	3f                   	aas    
 115:	08 21                	or     BYTE PTR [ecx],ah
 117:	4b                   	dec    ebx
 118:	76 77                	jbe    191 <cmdPrintEnv-0x30ffe6f>
 11a:	08 bb 75 78 a1 a1    	or     BYTE PTR [ebx-0x5e5e878b],bh
 120:	08 77 84             	or     BYTE PTR [edi-0x7c],dh
 123:	84 69 08             	test   BYTE PTR [ecx+0x8],ch
 126:	ca 68 08             	retf   0x868
 129:	3f                   	aas    
 12a:	75 08                	jne    134 <cmdPrintEnv-0x30ffecc>
 12c:	30 67 08             	xor    BYTE PTR [edi+0x8],ah
 12f:	77 08                	ja     139 <cmdPrintEnv-0x30ffec7>
 131:	3d bb 08 59 92       	cmp    eax,0x925908bb
 136:	83 08 69             	or     DWORD PTR [eax],0x69
 139:	08 91 00 02 04 01    	or     BYTE PTR [ecx+0x1040200],dl
 13f:	08 69 00             	or     BYTE PTR [ecx+0x0],ch
 142:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 145:	d7                   	xlat   BYTE PTR ds:[ebx]
 146:	03 55 f2             	add    edx,DWORD PTR [ebp-0xe]
 149:	00 02                	add    BYTE PTR [edx],al
 14b:	04 02                	add    al,0x2
 14d:	03 2d 20 30 67 f3    	add    ebp,DWORD PTR ds:0xf3673020
 153:	3f                   	aas    
 154:	67 f3 3f             	addr16 repz aas 
 157:	93                   	xchg   ebx,eax
 158:	08 ca                	or     dl,cl
 15a:	08 bd 9f 75 3f 69    	or     BYTE PTR [ebp+0x693f759f],bh
 160:	08 5f 08             	or     BYTE PTR [edi+0x8],bl
 163:	2f                   	das    
 164:	bb 68 02 26 13       	mov    ebx,0x13260268
 169:	02 2e                	add    ch,BYTE PTR [esi]
 16b:	16                   	push   ss
 16c:	02 2c 13             	add    ch,BYTE PTR [ebx+edx*1]
 16f:	00 02                	add    BYTE PTR [edx],al
 171:	04 02                	add    al,0x2
 173:	03 77 02             	add    esi,DWORD PTR [edi+0x2]
 176:	2c 01                	sub    al,0x1
 178:	00 02                	add    BYTE PTR [edx],al
 17a:	04 01                	add    al,0x1
 17c:	06                   	push   es
 17d:	4a                   	dec    edx
 17e:	06                   	push   es
 17f:	03 0c 9e             	add    ecx,DWORD PTR [esi+ebx*4]
 182:	08 2f                	or     BYTE PTR [edi],ch
 184:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 187:	3e                   	ds
 188:	3f                   	aas    
 189:	67 08 2f             	or     BYTE PTR [bx],ch
 18c:	02 24 13             	add    ah,BYTE PTR [ebx+edx*1]
 18f:	d7                   	xlat   BYTE PTR ds:[ebx]
 190:	3f                   	aas    
 191:	92                   	xchg   edx,eax
 192:	08 bc ae 08 24 02 22 	or     BYTE PTR [esi+ebp*4+0x22022408],bh
 199:	13 02                	adc    eax,DWORD PTR [edx]
 19b:	02 00                	add    al,BYTE PTR [eax]
 19d:	01 01                	add    DWORD PTR [ecx],eax
 19f:	70 02                	jo     1a3 <cmdPrintEnv-0x30ffe5d>
 1a1:	00 00                	add    BYTE PTR [eax],al
 1a3:	02 00                	add    al,BYTE PTR [eax]
 1a5:	b6 00                	mov    dh,0x0
 1a7:	00 00                	add    BYTE PTR [eax],al
 1a9:	01 01                	add    DWORD PTR [ecx],eax
 1ab:	fb                   	sti    
 1ac:	0e                   	push   cs
 1ad:	0d 00 01 01 01       	or     eax,0x1010100
 1b2:	01 00                	add    DWORD PTR [eax],eax
 1b4:	00 00                	add    BYTE PTR [eax],al
 1b6:	01 00                	add    DWORD PTR [eax],eax
 1b8:	00 01                	add    BYTE PTR [ecx],al
 1ba:	73 72                	jae    22e <cmdPrintEnv-0x30ffdd2>
 1bc:	63 00                	arpl   WORD PTR [eax],ax
 1be:	2f                   	das    
 1bf:	68 6f 6d 65 2f       	push   0x2f656d6f
 1c4:	79 6f                	jns    235 <cmdPrintEnv-0x30ffdcb>
 1c6:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
 1cd:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 1d0:	73 73                	jae    245 <cmdPrintEnv-0x30ffdbb>
 1d2:	2f                   	das    
 1d3:	6c                   	ins    BYTE PTR es:[edi],dx
 1d4:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
 1db:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
 1e1:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
 1e7:	78 2d                	js     216 <cmdPrintEnv-0x30ffdea>
 1e9:	67 6e                	outs   dx,BYTE PTR ds:[si]
 1eb:	75 2f                	jne    21c <cmdPrintEnv-0x30ffde4>
 1ed:	35 2e 33 2e 30       	xor    eax,0x302e332e
 1f2:	2f                   	das    
 1f3:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 1fa:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 1fd:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 201:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 204:	2e                   	cs
 205:	2f                   	das    
 206:	6c                   	ins    BYTE PTR es:[edi],dx
 207:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 20e:	4f                   	dec    edi
 20f:	53                   	push   ebx
 210:	2f                   	das    
 211:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 218:	00 00                	add    BYTE PTR [eax],al
 21a:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 21e:	6c                   	ins    BYTE PTR es:[edi],dx
 21f:	6c                   	ins    BYTE PTR es:[edi],dx
 220:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 223:	01 00                	add    DWORD PTR [eax],eax
 225:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 228:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
 22f:	63 
 230:	2e                   	cs
 231:	68 00 02 00 00       	push   0x200
 236:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 23a:	6c                   	ins    BYTE PTR es:[edi],dx
 23b:	6c                   	ins    BYTE PTR es:[edi],dx
 23c:	2e                   	cs
 23d:	68 00 03 00 00       	push   0x300
 242:	6d                   	ins    DWORD PTR es:[edi],dx
 243:	61                   	popa   
 244:	6c                   	ins    BYTE PTR es:[edi],dx
 245:	6c                   	ins    BYTE PTR es:[edi],dx
 246:	6f                   	outs   dx,DWORD PTR ds:[esi]
 247:	63 2e                	arpl   WORD PTR [esi],bp
 249:	68 00 04 00 00       	push   0x400
 24e:	6c                   	ins    BYTE PTR es:[edi],dx
 24f:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 256:	4f                   	dec    edi
 257:	53                   	push   ebx
 258:	2e                   	cs
 259:	68 00 04 00 00       	push   0x400
 25e:	00 00                	add    BYTE PTR [eax],al
 260:	05 02 64 06 10       	add    eax,0x10066402
 265:	03 03                	add    eax,DWORD PTR [ebx]
 267:	18 01                	sbb    BYTE PTR [ecx],al
 269:	75 08                	jne    273 <cmdPrintEnv-0x30ffd8d>
 26b:	14 68                	adc    al,0x68
 26d:	4c                   	dec    esp
 26e:	08 21                	or     BYTE PTR [ecx],ah
 270:	08 21                	or     BYTE PTR [ecx],ah
 272:	08 13                	or     BYTE PTR [ebx],dl
 274:	03 0b                	add    ecx,DWORD PTR [ebx]
 276:	74 03                	je     27b <cmdPrintEnv-0x30ffd85>
 278:	78 2e                	js     2a8 <cmdPrintEnv-0x30ffd58>
 27a:	02 30                	add    dh,BYTE PTR [eax]
 27c:	1a 2c d8             	sbb    ch,BYTE PTR [eax+ebx*8]
 27f:	69 75 d7 d7 4c 08 3e 	imul   esi,DWORD PTR [ebp-0x29],0x3e084cd7
 286:	bc e6 ae 94 08       	mov    esp,0x894aee6
 28b:	4b                   	dec    ebx
 28c:	e5 93                	in     eax,0x93
 28e:	00 02                	add    BYTE PTR [edx],al
 290:	04 02                	add    al,0x2
 292:	06                   	push   es
 293:	e4 00                	in     al,0x0
 295:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
 298:	e4 00                	in     al,0x0
 29a:	02 04 05 e4 06 af 00 	add    al,BYTE PTR [eax*1+0xaf06e4]
 2a1:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 2a4:	06                   	push   es
 2a5:	e4 06                	in     al,0x6
 2a7:	e5 02                	in     eax,0x2
 2a9:	25 13 08 4b 67       	and    eax,0x674b0813
 2ae:	e3 34                	jecxz  2e4 <cmdPrintEnv-0x30ffd1c>
 2b0:	00 02                	add    BYTE PTR [edx],al
 2b2:	04 02                	add    al,0x2
 2b4:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 2ba:	02 03                	add    al,BYTE PTR [ebx]
 2bc:	63 4a 00             	arpl   WORD PTR [edx+0x0],cx
 2bf:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 2c2:	06                   	push   es
 2c3:	4a                   	dec    edx
 2c4:	06                   	push   es
 2c5:	03 1f                	add    ebx,DWORD PTR [edi]
 2c7:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 2ca:	4b                   	dec    ebx
 2cb:	08 4f 3d             	or     BYTE PTR [edi+0x3d],cl
 2ce:	5b                   	pop    ebx
 2cf:	6a 92                	push   0xffffff92
 2d1:	02 3b                	add    bh,BYTE PTR [ebx]
 2d3:	14 69                	adc    al,0x69
 2d5:	00 02                	add    BYTE PTR [edx],al
 2d7:	04 02                	add    al,0x2
 2d9:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 2dc:	00 02                	add    BYTE PTR [edx],al
 2de:	04 01                	add    al,0x1
 2e0:	06                   	push   es
 2e1:	4a                   	dec    edx
 2e2:	06                   	push   es
 2e3:	03 0b                	add    ecx,DWORD PTR [ebx]
 2e5:	66 59                	pop    cx
 2e7:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 2ea:	75 75                	jne    361 <cmdPrintEnv-0x30ffc9f>
 2ec:	75 75                	jne    363 <cmdPrintEnv-0x30ffc9d>
 2ee:	78 a1                	js     291 <cmdPrintEnv-0x30ffd6f>
 2f0:	08 ec                	or     ah,ch
 2f2:	00 02                	add    BYTE PTR [edx],al
 2f4:	04 01                	add    al,0x1
 2f6:	06                   	push   es
 2f7:	66 06                	pushw  es
 2f9:	af                   	scas   eax,DWORD PTR es:[edi]
 2fa:	68 75 08 4c 67       	push   0x674c0875
 2ff:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 302:	5a                   	pop    edx
 303:	00 02                	add    BYTE PTR [edx],al
 305:	04 01                	add    al,0x1
 307:	06                   	push   es
 308:	9e                   	sahf   
 309:	00 02                	add    BYTE PTR [edx],al
 30b:	04 02                	add    al,0x2
 30d:	66                   	data16
 30e:	00 02                	add    BYTE PTR [edx],al
 310:	04 03                	add    al,0x3
 312:	66 06                	pushw  es
 314:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 315:	68 75 08 5a a0       	push   0xa05a0875
 31a:	bc 68 a0 94 08       	mov    esp,0x894a068
 31f:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 322:	94                   	xchg   esp,eax
 323:	08 33                	or     BYTE PTR [ebx],dh
 325:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 32a:	16                   	push   ss
 32b:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 32e:	03 3a                	add    edi,DWORD PTR [edx]
 330:	d6                   	(bad)  
 331:	68 d8 08 e7 08       	push   0x8e708d8
 336:	13 d7                	adc    edx,edi
 338:	08 e5                	or     ch,ah
 33a:	08 3e                	or     BYTE PTR [esi],bh
 33c:	4b                   	dec    ebx
 33d:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 340:	d9 d9                	(bad)  
 342:	d7                   	xlat   BYTE PTR ds:[ebx]
 343:	d7                   	xlat   BYTE PTR ds:[ebx]
 344:	3d 31 75 00 02       	cmp    eax,0x2007531
 349:	04 03                	add    al,0x3
 34b:	92                   	xchg   edx,eax
 34c:	00 02                	add    BYTE PTR [edx],al
 34e:	04 03                	add    al,0x3
 350:	02 22                	add    ah,BYTE PTR [edx]
 352:	13 00                	adc    eax,DWORD PTR [eax]
 354:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 357:	02 30                	add    dh,BYTE PTR [eax]
 359:	0f 00 02             	sldt   WORD PTR [edx]
 35c:	04 01                	add    al,0x1
 35e:	06                   	push   es
 35f:	4a                   	dec    edx
 360:	06                   	push   es
 361:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 367:	04 03                	add    al,0x3
 369:	91                   	xchg   ecx,eax
 36a:	00 02                	add    BYTE PTR [edx],al
 36c:	04 03                	add    al,0x3
 36e:	ff 00                	inc    DWORD PTR [eax]
 370:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 373:	06                   	push   es
 374:	4a                   	dec    edx
 375:	06                   	push   es
 376:	84 d7                	test   bh,dl
 378:	3f                   	aas    
 379:	68 92 08 30 08       	push   0x8300892
 37e:	f3 68 08 5a 08 4c    	repz push 0x4c085a08
 384:	00 02                	add    BYTE PTR [edx],al
 386:	04 02                	add    al,0x2
 388:	03 75 74             	add    esi,DWORD PTR [ebp+0x74]
 38b:	00 02                	add    BYTE PTR [edx],al
 38d:	04 01                	add    al,0x1
 38f:	06                   	push   es
 390:	4a                   	dec    edx
 391:	06                   	push   es
 392:	03 0f                	add    ecx,DWORD PTR [edi]
 394:	66 59                	pop    cx
 396:	03 0d 2e 67 02 25    	add    ecx,DWORD PTR ds:0x2502672e
 39c:	13 3f                	adc    edi,DWORD PTR [edi]
 39e:	67 08 91 3f 67       	or     BYTE PTR [bx+di+0x673f],dl
 3a3:	59                   	pop    ecx
 3a4:	59                   	pop    ecx
 3a5:	08 30                	or     BYTE PTR [eax],dh
 3a7:	40                   	inc    eax
 3a8:	92                   	xchg   edx,eax
 3a9:	75 75                	jne    420 <cmdPrintEnv-0x30ffbe0>
 3ab:	77 9f                	ja     34c <cmdPrintEnv-0x30ffcb4>
 3ad:	75 08                	jne    3b7 <cmdPrintEnv-0x30ffc49>
 3af:	4b                   	dec    ebx
 3b0:	83 75 08 4b          	xor    DWORD PTR [ebp+0x8],0x4b
 3b4:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 3b7:	5b                   	pop    ebx
 3b8:	5b                   	pop    ebx
 3b9:	9f                   	lahf   
 3ba:	75 75                	jne    431 <cmdPrintEnv-0x30ffbcf>
 3bc:	75 08                	jne    3c6 <cmdPrintEnv-0x30ffc3a>
 3be:	83 08 4b             	or     DWORD PTR [eax],0x4b
 3c1:	5a                   	pop    edx
 3c2:	75 30                	jne    3f4 <cmdPrintEnv-0x30ffc0c>
 3c4:	08 56 b1             	or     BYTE PTR [esi-0x4f],dl
 3c7:	ae                   	scas   al,BYTE PTR es:[edi]
 3c8:	93                   	xchg   ebx,eax
 3c9:	bc 02 2d 13 83       	mov    esp,0x83132d02
 3ce:	08 21                	or     BYTE PTR [ecx],ah
 3d0:	08 4c 5d e6          	or     BYTE PTR [ebp+ebx*2-0x1a],cl
 3d4:	cb                   	retf   
 3d5:	08 4c 02 2d          	or     BYTE PTR [edx+eax*1+0x2d],cl
 3d9:	13 83 e5 75 08 21    	adc    eax,DWORD PTR [ebx+0x210875e5]
 3df:	08 4c 5d ae          	or     BYTE PTR [ebp+ebx*2-0x52],cl
 3e3:	a0 f3 4d 5a e7       	mov    al,ds:0xe75a4df3
 3e8:	ae                   	scas   al,BYTE PTR es:[edi]
 3e9:	4b                   	dec    ebx
 3ea:	d7                   	xlat   BYTE PTR ds:[ebx]
 3eb:	03 0c 90             	add    ecx,DWORD PTR [eax+edx*4]
 3ee:	ae                   	scas   al,BYTE PTR es:[edi]
 3ef:	f3 03 0c 20          	repz add ecx,DWORD PTR [eax+eiz*1]
 3f3:	03 78 f2             	add    edi,DWORD PTR [eax-0xe]
 3f6:	08 67 08             	or     BYTE PTR [edi+0x8],ah
 3f9:	22 76 5d             	and    dh,BYTE PTR [esi+0x5d]
 3fc:	67 08 21             	or     BYTE PTR [bx+di],ah
 3ff:	08 4b 03             	or     BYTE PTR [ebx+0x3],cl
 402:	9a 7f 08 20 03 e8 00 	call   0xe8:0x320087f
 409:	08 20                	or     BYTE PTR [eax],ah
 40b:	08 13                	or     BYTE PTR [ebx],dl
 40d:	59                   	pop    ecx
 40e:	02 02                	add    al,BYTE PTR [edx]
 410:	00 01                	add    BYTE PTR [ecx],al
 412:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	65 6e                	outs   dx,BYTE PTR gs:[esi]
   2:	76 69                	jbe    6d <cmdPrintEnv-0x30fff93>
   4:	72 6f                	jb     75 <cmdPrintEnv-0x30fff8b>
   6:	6e                   	outs   dx,BYTE PTR ds:[esi]
   7:	6d                   	ins    DWORD PTR es:[edi],dx
   8:	65 6e                	outs   dx,BYTE PTR gs:[esi]
   a:	74 4c                	je     58 <cmdPrintEnv-0x30fffa8>
   c:	6f                   	outs   dx,DWORD PTR ds:[esi]
   d:	63 00                	arpl   WORD PTR [eax],ax
   f:	76 61                	jbe    72 <cmdPrintEnv-0x30fff8e>
  11:	72 56                	jb     69 <cmdPrintEnv-0x30fff97>
  13:	61                   	popa   
  14:	6c                   	ins    BYTE PTR es:[edi],dx
  15:	75 65                	jne    7c <cmdPrintEnv-0x30fff84>
  17:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
  1a:	65 63 50 61          	arpl   WORD PTR gs:[eax+0x61],dx
  1e:	72 61                	jb     81 <cmdPrintEnv-0x30fff7f>
  20:	6d                   	ins    DWORD PTR es:[edi],dx
  21:	43                   	inc    ebx
  22:	6f                   	outs   dx,DWORD PTR ds:[esi]
  23:	75 6e                	jne    93 <cmdPrintEnv-0x30fff6d>
  25:	74 00                	je     27 <cmdPrintEnv-0x30fffd9>
  27:	6e                   	outs   dx,BYTE PTR ds:[esi]
  28:	61                   	popa   
  29:	6d                   	ins    DWORD PTR es:[edi],dx
  2a:	65                   	gs
  2b:	4c                   	dec    esp
  2c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
  2e:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  31:	64                   	fs
  32:	45                   	inc    ebp
  33:	78 69                	js     9e <cmdPrintEnv-0x30fff62>
  35:	74 00                	je     37 <cmdPrintEnv-0x30fffc9>
  37:	2f                   	das    
  38:	68 6f 6d 65 2f       	push   0x2f656d6f
  3d:	79 6f                	jns    ae <cmdPrintEnv-0x30fff52>
  3f:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  46:	6f                   	outs   dx,DWORD PTR ds:[esi]
  47:	73 2f                	jae    78 <cmdPrintEnv-0x30fff88>
  49:	61                   	popa   
  4a:	70 72                	jo     be <cmdPrintEnv-0x30fff42>
  4c:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4d:	6a 2f                	push   0x2f
  4f:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  53:	6c                   	ins    BYTE PTR es:[edi],dx
  54:	6c                   	ins    BYTE PTR es:[edi],dx
  55:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
  59:	7a 6f                	jp     ca <cmdPrintEnv-0x30fff36>
  5b:	6e                   	outs   dx,BYTE PTR ds:[esi]
  5c:	65 00 63 6d          	add    BYTE PTR gs:[ebx+0x6d],ah
  60:	64                   	fs
  61:	50                   	push   eax
  62:	72 69                	jb     cd <cmdPrintEnv-0x30fff33>
  64:	6e                   	outs   dx,BYTE PTR ds:[esi]
  65:	74 45                	je     ac <cmdPrintEnv-0x30fff54>
  67:	6e                   	outs   dx,BYTE PTR ds:[esi]
  68:	76 00                	jbe    6a <cmdPrintEnv-0x30fff96>
  6a:	68 65 61 70 45       	push   0x45706165
  6f:	6e                   	outs   dx,BYTE PTR ds:[esi]
  70:	64 00 64 65 73       	add    BYTE PTR fs:[ebp+eiz*2+0x73],ah
  75:	63 72 69             	arpl   WORD PTR [edx+0x69],si
  78:	70 74                	jo     ee <cmdPrintEnv-0x30fff12>
  7a:	69 6f 6e 00 73 68 6f 	imul   ebp,DWORD PTR [edi+0x6e],0x6f687300
  81:	72 74                	jb     f7 <cmdPrintEnv-0x30fff09>
  83:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
  86:	74 00                	je     88 <cmdPrintEnv-0x30fff78>
  88:	73 69                	jae    f3 <cmdPrintEnv-0x30fff0d>
  8a:	7a 65                	jp     f1 <cmdPrintEnv-0x30fff0f>
  8c:	74 79                	je     107 <cmdPrintEnv-0x30ffef9>
  8e:	70 65                	jo     f5 <cmdPrintEnv-0x30fff0b>
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
  c7:	72 69                	jb     132 <cmdPrintEnv-0x30ffece>
  c9:	63 20                	arpl   WORD PTR [eax],sp
  cb:	2d 6d 61 72 63       	sub    eax,0x6372616d
  d0:	68 3d 70 65 6e       	push   0x6e65703d
  d5:	74 69                	je     140 <cmdPrintEnv-0x30ffec0>
  d7:	75 6d                	jne    146 <cmdPrintEnv-0x30ffeba>
  d9:	70 72                	jo     14d <cmdPrintEnv-0x30ffeb3>
  db:	6f                   	outs   dx,DWORD PTR ds:[esi]
  dc:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  e2:	74 64                	je     148 <cmdPrintEnv-0x30ffeb8>
  e4:	3d 63 39 39 20       	cmp    eax,0x20393963
  e9:	2d 66 66 72 65       	sub    eax,0x65726666
  ee:	65                   	gs
  ef:	73 74                	jae    165 <cmdPrintEnv-0x30ffe9b>
  f1:	61                   	popa   
  f2:	6e                   	outs   dx,BYTE PTR ds:[esi]
  f3:	64 69 6e 67 00 74 6d 	imul   ebp,DWORD PTR fs:[esi+0x67],0x5f6d7400
  fa:	5f 
  fb:	67 6d                	ins    DWORD PTR es:[di],dx
  fd:	74 6f                	je     16e <cmdPrintEnv-0x30ffe92>
  ff:	66                   	data16
 100:	66                   	data16
 101:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 104:	64                   	fs
 105:	50                   	push   eax
 106:	77 64                	ja     16c <cmdPrintEnv-0x30ffe94>
 108:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 10b:	6d                   	ins    DWORD PTR es:[edi],dx
 10c:	6d                   	ins    DWORD PTR es:[edi],dx
 10d:	61                   	popa   
 10e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 10f:	64                   	fs
 110:	5f                   	pop    edi
 111:	66                   	data16
 112:	75 6e                	jne    182 <cmdPrintEnv-0x30ffe7e>
 114:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 118:	6e                   	outs   dx,BYTE PTR ds:[esi]
 119:	5f                   	pop    edi
 11a:	70 00                	jo     11c <cmdPrintEnv-0x30ffee4>
 11c:	73 74                	jae    192 <cmdPrintEnv-0x30ffe6e>
 11e:	61                   	popa   
 11f:	72 74                	jb     195 <cmdPrintEnv-0x30ffe6b>
 121:	54                   	push   esp
 122:	69 63 6b 73 00 6b 65 	imul   esp,DWORD PTR [ebx+0x6b],0x656b0073
 129:	78 65                	js     190 <cmdPrintEnv-0x30ffe70>
 12b:	63 00                	arpl   WORD PTR [eax],ax
 12d:	64                   	fs
 12e:	65                   	gs
 12f:	6c                   	ins    BYTE PTR es:[edi],dx
 130:	69 6d 00 75 69 6e 74 	imul   ebp,DWORD PTR [ebp+0x0],0x746e6975
 137:	70 74                	jo     1ad <cmdPrintEnv-0x30ffe53>
 139:	72 5f                	jb     19a <cmdPrintEnv-0x30ffe66>
 13b:	74 00                	je     13d <cmdPrintEnv-0x30ffec3>
 13d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 140:	6d                   	ins    DWORD PTR es:[edi],dx
 141:	61                   	popa   
 142:	6e                   	outs   dx,BYTE PTR ds:[esi]
 143:	64                   	fs
 144:	5f                   	pop    edi
 145:	66                   	data16
 146:	75 6e                	jne    1b6 <cmdPrintEnv-0x30ffe4a>
 148:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 14c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 14d:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 151:	68 6f 75 72 00       	push   0x72756f
 156:	70 61                	jo     1b9 <cmdPrintEnv-0x30ffe47>
 158:	72 61                	jb     1bb <cmdPrintEnv-0x30ffe45>
 15a:	6d                   	ins    DWORD PTR es:[edi],dx
 15b:	43                   	inc    ebx
 15c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 15d:	75 6e                	jne    1cd <cmdPrintEnv-0x30ffe33>
 15f:	74 00                	je     161 <cmdPrintEnv-0x30ffe9f>
 161:	74 6d                	je     1d0 <cmdPrintEnv-0x30ffe30>
 163:	5f                   	pop    edi
 164:	6d                   	ins    DWORD PTR es:[edi],dx
 165:	6f                   	outs   dx,DWORD PTR ds:[esi]
 166:	6e                   	outs   dx,BYTE PTR ds:[esi]
 167:	00 6c 6f 6e          	add    BYTE PTR [edi+ebp*2+0x6e],ch
 16b:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 16f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 170:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 174:	74 00                	je     176 <cmdPrintEnv-0x30ffe8a>
 176:	76 61                	jbe    1d9 <cmdPrintEnv-0x30ffe27>
 178:	72 4e                	jb     1c8 <cmdPrintEnv-0x30ffe38>
 17a:	61                   	popa   
 17b:	6d                   	ins    DWORD PTR es:[edi],dx
 17c:	65 00 74 69 6d       	add    BYTE PTR gs:[ecx+ebp*2+0x6d],dh
 181:	65                   	gs
 182:	49                   	dec    ecx
 183:	74 00                	je     185 <cmdPrintEnv-0x30ffe7b>
 185:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 188:	53                   	push   ebx
 189:	6c                   	ins    BYTE PTR es:[edi],dx
 18a:	65                   	gs
 18b:	65                   	gs
 18c:	70 00                	jo     18e <cmdPrintEnv-0x30ffe72>
 18e:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
 191:	6c                   	ins    BYTE PTR es:[edi],dx
 192:	64                   	fs
 193:	50                   	push   eax
 194:	69 64 00 6c 61 73 74 	imul   esp,DWORD PTR [eax+eax*1+0x6c],0x45747361
 19b:	45 
 19c:	78 65                	js     203 <cmdPrintEnv-0x30ffdfd>
 19e:	63 45 78             	arpl   WORD PTR [ebp+0x78],ax
 1a1:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x68006564
 1a8:	68 
 1a9:	65                   	gs
 1aa:	61                   	popa   
 1ab:	70 43                	jo     1f0 <cmdPrintEnv-0x30ffe10>
 1ad:	75 72                	jne    221 <cmdPrintEnv-0x30ffddf>
 1af:	72 00                	jb     1b1 <cmdPrintEnv-0x30ffe4f>
 1b1:	73 45                	jae    1f8 <cmdPrintEnv-0x30ffe08>
 1b3:	78 65                	js     21a <cmdPrintEnv-0x30ffde6>
 1b5:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 1b8:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 1bf:	72 61                	jb     222 <cmdPrintEnv-0x30ffdde>
 1c1:	6d                   	ins    DWORD PTR es:[edi],dx
 1c2:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 1c5:	72 61                	jb     228 <cmdPrintEnv-0x30ffdd8>
 1c7:	6d                   	ins    DWORD PTR es:[edi],dx
 1c8:	73 00                	jae    1ca <cmdPrintEnv-0x30ffe36>
 1ca:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1cb:	61                   	popa   
 1cc:	6d                   	ins    DWORD PTR es:[edi],dx
 1cd:	65 00 66 6f          	add    BYTE PTR gs:[esi+0x6f],ah
 1d1:	72 6b                	jb     23e <cmdPrintEnv-0x30ffdc2>
 1d3:	50                   	push   eax
 1d4:	69 64 00 74 6d 5f 77 	imul   esp,DWORD PTR [eax+eax*1+0x74],0x64775f6d
 1db:	64 
 1dc:	61                   	popa   
 1dd:	79 00                	jns    1df <cmdPrintEnv-0x30ffe21>
 1df:	75 6e                	jne    24f <cmdPrintEnv-0x30ffdb1>
 1e1:	73 69                	jae    24c <cmdPrintEnv-0x30ffdb4>
 1e3:	67 6e                	outs   dx,BYTE PTR ds:[si]
 1e5:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 1ea:	61                   	popa   
 1eb:	72 00                	jb     1ed <cmdPrintEnv-0x30ffe13>
 1ed:	74 6d                	je     25c <cmdPrintEnv-0x30ffda4>
 1ef:	5f                   	pop    edi
 1f0:	79 65                	jns    257 <cmdPrintEnv-0x30ffda9>
 1f2:	61                   	popa   
 1f3:	72 00                	jb     1f5 <cmdPrintEnv-0x30ffe0b>
 1f5:	6c                   	ins    BYTE PTR es:[edi],dx
 1f6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1f7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1f8:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 1fc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1fd:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 201:	73 69                	jae    26c <cmdPrintEnv-0x30ffd94>
 203:	67 6e                	outs   dx,BYTE PTR ds:[si]
 205:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 20a:	74 00                	je     20c <cmdPrintEnv-0x30ffdf4>
 20c:	75 69                	jne    277 <cmdPrintEnv-0x30ffd89>
 20e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 20f:	74 33                	je     244 <cmdPrintEnv-0x30ffdbc>
 211:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 214:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 218:	6d                   	ins    DWORD PTR es:[edi],dx
 219:	64                   	fs
 21a:	61                   	popa   
 21b:	79 00                	jns    21d <cmdPrintEnv-0x30ffde3>
 21d:	70 72                	jo     291 <cmdPrintEnv-0x30ffd6f>
 21f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 220:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 223:	73 45                	jae    26a <cmdPrintEnv-0x30ffd96>
 225:	6e                   	outs   dx,BYTE PTR ds:[esi]
 226:	76 70                	jbe    298 <cmdPrintEnv-0x30ffd68>
 228:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 22b:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x70006564
 232:	70 
 233:	63 6f 75             	arpl   WORD PTR [edi+0x75],bp
 236:	6e                   	outs   dx,BYTE PTR ds:[esi]
 237:	74 00                	je     239 <cmdPrintEnv-0x30ffdc7>
 239:	73 68                	jae    2a3 <cmdPrintEnv-0x30ffd5d>
 23b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 23c:	72 74                	jb     2b2 <cmdPrintEnv-0x30ffd4e>
 23e:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 241:	73 69                	jae    2ac <cmdPrintEnv-0x30ffd54>
 243:	67 6e                	outs   dx,BYTE PTR ds:[si]
 245:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 24a:	74 00                	je     24c <cmdPrintEnv-0x30ffdb4>
 24c:	65                   	gs
 24d:	78 65                	js     2b4 <cmdPrintEnv-0x30ffd4c>
 24f:	63 54 69 6d          	arpl   WORD PTR [ecx+ebp*2+0x6d],dx
 253:	65 00 73 72          	add    BYTE PTR gs:[ebx+0x72],dh
 257:	63 2f                	arpl   WORD PTR [edi],bp
 259:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 25c:	6d                   	ins    DWORD PTR es:[edi],dx
 25d:	61                   	popa   
 25e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 25f:	64                   	fs
 260:	73 2e                	jae    290 <cmdPrintEnv-0x30ffd70>
 262:	63 00                	arpl   WORD PTR [eax],ax
 264:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 267:	54                   	push   esp
 268:	69 6d 65 00 74 6d 5f 	imul   ebp,DWORD PTR [ebp+0x65],0x5f6d7400
 26f:	79 64                	jns    2d5 <cmdPrintEnv-0x30ffd2b>
 271:	61                   	popa   
 272:	79 00                	jns    274 <cmdPrintEnv-0x30ffd8c>
 274:	5f                   	pop    edi
 275:	42                   	inc    edx
 276:	6f                   	outs   dx,DWORD PTR ds:[esi]
 277:	6f                   	outs   dx,DWORD PTR ds:[esi]
 278:	6c                   	ins    BYTE PTR es:[edi],dx
 279:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 27d:	6d                   	ins    DWORD PTR es:[edi],dx
 27e:	69 6e 00 62 75 66 66 	imul   ebp,DWORD PTR [esi+0x0],0x66667562
 285:	65                   	gs
 286:	72 00                	jb     288 <cmdPrintEnv-0x30ffd78>
 288:	74 6d                	je     2f7 <cmdPrintEnv-0x30ffd09>
 28a:	5f                   	pop    edi
 28b:	69 73 64 73 74 00 65 	imul   esi,DWORD PTR [ebx+0x64],0x65007473
 292:	6e                   	outs   dx,BYTE PTR ds:[esi]
 293:	64                   	fs
 294:	54                   	push   esp
 295:	69 6d 65 00 63 6d 64 	imul   ebp,DWORD PTR [ebp+0x65],0x646d6300
 29c:	53                   	push   ebx
 29d:	65                   	gs
 29e:	74 45                	je     2e5 <cmdPrintEnv-0x30ffd1b>
 2a0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2a1:	76 00                	jbe    2a3 <cmdPrintEnv-0x30ffd5d>
 2a3:	73 74                	jae    319 <cmdPrintEnv-0x30ffce7>
 2a5:	61                   	popa   
 2a6:	72 74                	jb     31c <cmdPrintEnv-0x30ffce4>
 2a8:	54                   	push   esp
 2a9:	69 6d 65 00 63 6d 64 	imul   ebp,DWORD PTR [ebp+0x65],0x646d6300
 2b0:	48                   	dec    eax
 2b1:	65                   	gs
 2b2:	6c                   	ins    BYTE PTR es:[edi],dx
 2b3:	70 00                	jo     2b5 <cmdPrintEnv-0x30ffd4b>
 2b5:	66 6f                	outs   dx,WORD PTR ds:[esi]
 2b7:	75 6e                	jne    327 <cmdPrintEnv-0x30ffcd9>
 2b9:	64 00 74 69 6d       	add    BYTE PTR fs:[ecx+ebp*2+0x6d],dh
 2be:	65                   	gs
 2bf:	54                   	push   esp
 2c0:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2c1:	45                   	inc    ebp
 2c2:	78 69                	js     32d <cmdPrintEnv-0x30ffcd3>
 2c4:	74 00                	je     2c6 <cmdPrintEnv-0x30ffd3a>
 2c6:	68 65 61 70 42       	push   0x42706165
 2cb:	61                   	popa   
 2cc:	73 65                	jae    333 <cmdPrintEnv-0x30ffccd>
 2ce:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 2d1:	74 68                	je     33b <cmdPrintEnv-0x30ffcc5>
 2d3:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 2d6:	64                   	fs
 2d7:	73 00                	jae    2d9 <cmdPrintEnv-0x30ffd27>
 2d9:	6c                   	ins    BYTE PTR es:[edi],dx
 2da:	69 62 63 54 5a 00 72 	imul   esp,DWORD PTR [edx+0x63],0x72005a54
 2e1:	65                   	gs
 2e2:	74 56                	je     33a <cmdPrintEnv-0x30ffcc6>
 2e4:	61                   	popa   
 2e5:	6c                   	ins    BYTE PTR es:[edi],dx
 2e6:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 2ea:	73 65                	jae    351 <cmdPrintEnv-0x30ffcaf>
 2ec:	63 00                	arpl   WORD PTR [eax],ax
 2ee:	62 61 63             	bound  esp,QWORD PTR [ecx+0x63]
 2f1:	6b 67 72 6f          	imul   esp,DWORD PTR [edi+0x72],0x6f
 2f5:	75 6e                	jne    365 <cmdPrintEnv-0x30ffc9b>
 2f7:	64 00 76 61          	add    BYTE PTR fs:[esi+0x61],dh
 2fb:	6c                   	ins    BYTE PTR es:[edi],dx
 2fc:	75 65                	jne    363 <cmdPrintEnv-0x30ffc9d>
 2fe:	4c                   	dec    esp
 2ff:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 301:	00 73 4b             	add    BYTE PTR [ebx+0x4b],dh
 304:	53                   	push   ebx
 305:	68 65 6c 6c 50       	push   0x506c6c65
 30a:	72 6f                	jb     37b <cmdPrintEnv-0x30ffc85>
 30c:	67 72 61             	addr16 jb 370 <cmdPrintEnv-0x30ffc90>
 30f:	6d                   	ins    DWORD PTR es:[edi],dx
 310:	4e                   	dec    esi
 311:	61                   	popa   
 312:	6d                   	ins    DWORD PTR es:[edi],dx
 313:	65 00 63 6d          	add    BYTE PTR gs:[ebx+0x6d],ah
 317:	64                   	fs
 318:	45                   	inc    ebp
 319:	78 65                	js     380 <cmdPrintEnv-0x30ffc80>
 31b:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 31e:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 321:	6d                   	ins    DWORD PTR es:[edi],dx
 322:	61                   	popa   
 323:	6e                   	outs   dx,BYTE PTR ds:[esi]
 324:	64                   	fs
 325:	5f                   	pop    edi
 326:	74 61                	je     389 <cmdPrintEnv-0x30ffc77>
 328:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 32c:	74 00                	je     32e <cmdPrintEnv-0x30ffcd2>
 32e:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 330:	6e                   	outs   dx,BYTE PTR ds:[esi]
 331:	65                   	gs
 332:	47                   	inc    edi
 333:	65                   	gs
 334:	74 74                	je     3aa <cmdPrintEnv-0x30ffc56>
 336:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
 33d:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 340:	6f                   	outs   dx,DWORD PTR ds:[esi]
 341:	6d                   	ins    DWORD PTR es:[edi],dx
 342:	70 74                	jo     3b8 <cmdPrintEnv-0x30ffc48>
 344:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 347:	76 70                	jbe    3b9 <cmdPrintEnv-0x30ffc47>
 349:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 34c:	6d                   	ins    DWORD PTR es:[edi],dx
 34d:	6d                   	ins    DWORD PTR es:[edi],dx
 34e:	61                   	popa   
 34f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 350:	64                   	fs
 351:	48                   	dec    eax
 352:	69 73 74 6f 72 79 4d 	imul   esi,DWORD PTR [ebx+0x74],0x4d79726f
 359:	61                   	popa   
 35a:	78 00                	js     35c <cmdPrintEnv-0x30ffca4>
 35c:	74 65                	je     3c3 <cmdPrintEnv-0x30ffc3d>
 35e:	6d                   	ins    DWORD PTR es:[edi],dx
 35f:	70 00                	jo     361 <cmdPrintEnv-0x30ffc9f>
 361:	70 61                	jo     3c4 <cmdPrintEnv-0x30ffc3c>
 363:	72 73                	jb     3d8 <cmdPrintEnv-0x30ffc28>
 365:	65                   	gs
 366:	50                   	push   eax
 367:	61                   	popa   
 368:	72 61                	jb     3cb <cmdPrintEnv-0x30ffc35>
 36a:	6d                   	ins    DWORD PTR es:[edi],dx
 36b:	73 53                	jae    3c0 <cmdPrintEnv-0x30ffc40>
 36d:	68 65 6c 6c 00       	push   0x6c6c65
 372:	69 6e 70 75 74 00 6c 	imul   ebp,DWORD PTR [esi+0x70],0x6c007475
 379:	43                   	inc    ebx
 37a:	75 72                	jne    3ee <cmdPrintEnv-0x30ffc12>
 37c:	72 4b                	jb     3c9 <cmdPrintEnv-0x30ffc37>
 37e:	65                   	gs
 37f:	79 43                	jns    3c4 <cmdPrintEnv-0x30ffc3c>
 381:	6f                   	outs   dx,DWORD PTR ds:[esi]
 382:	75 6e                	jne    3f2 <cmdPrintEnv-0x30ffc0e>
 384:	74 00                	je     386 <cmdPrintEnv-0x30ffc7a>
 386:	70 61                	jo     3e9 <cmdPrintEnv-0x30ffc17>
 388:	72 73                	jb     3fd <cmdPrintEnv-0x30ffc03>
 38a:	65                   	gs
 38b:	64                   	fs
 38c:	43                   	inc    ebx
 38d:	68 61 72 73 00       	push   0x737261
 392:	65                   	gs
 393:	78 65                	js     3fa <cmdPrintEnv-0x30ffc06>
 395:	63 49 6e             	arpl   WORD PTR [ecx+0x6e],cx
 398:	74 65                	je     3ff <cmdPrintEnv-0x30ffc01>
 39a:	72 6e                	jb     40a <cmdPrintEnv-0x30ffbf6>
 39c:	61                   	popa   
 39d:	6c                   	ins    BYTE PTR es:[edi],dx
 39e:	43                   	inc    ebx
 39f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3a0:	6d                   	ins    DWORD PTR es:[edi],dx
 3a1:	6d                   	ins    DWORD PTR es:[edi],dx
 3a2:	61                   	popa   
 3a3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3a4:	64 00 73 72          	add    BYTE PTR fs:[ebx+0x72],dh
 3a8:	63 2f                	arpl   WORD PTR [edi],bp
 3aa:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3ae:	6c                   	ins    BYTE PTR es:[edi],dx
 3af:	6c                   	ins    BYTE PTR es:[edi],dx
 3b0:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 3b3:	64                   	fs
 3b4:	71 75                	jno    42b <cmdPrintEnv-0x30ffbd5>
 3b6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3b7:	74 65                	je     41e <cmdPrintEnv-0x30ffbe2>
 3b9:	00 76 61             	add    BYTE PTR [esi+0x61],dh
 3bc:	6c                   	ins    BYTE PTR es:[edi],dx
 3bd:	75 65                	jne    424 <cmdPrintEnv-0x30ffbdc>
 3bf:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3c2:	74 41                	je     405 <cmdPrintEnv-0x30ffbfb>
 3c4:	43                   	inc    ebx
 3c5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3c6:	6d                   	ins    DWORD PTR es:[edi],dx
 3c7:	6d                   	ins    DWORD PTR es:[edi],dx
 3c8:	61                   	popa   
 3c9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3ca:	64 00 75 69          	add    BYTE PTR fs:[ebp+0x69],dh
 3ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3cf:	74 38                	je     409 <cmdPrintEnv-0x30ffbf7>
 3d1:	5f                   	pop    edi
 3d2:	74 00                	je     3d4 <cmdPrintEnv-0x30ffc2c>
 3d4:	67                   	addr16
 3d5:	65                   	gs
 3d6:	74 45                	je     41d <cmdPrintEnv-0x30ffbe3>
 3d8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3d9:	76 56                	jbe    431 <cmdPrintEnv-0x30ffbcf>
 3db:	61                   	popa   
 3dc:	72 69                	jb     447 <cmdPrintEnv-0x30ffbb9>
 3de:	61                   	popa   
 3df:	62 6c 65 56          	bound  ebp,QWORD PTR [ebp+eiz*2+0x56]
 3e3:	61                   	popa   
 3e4:	6c                   	ins    BYTE PTR es:[edi],dx
 3e5:	75 65                	jne    44c <cmdPrintEnv-0x30ffbb4>
 3e7:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 3ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3eb:	64                   	fs
 3ec:	43                   	inc    ebx
 3ed:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3ee:	6d                   	ins    DWORD PTR es:[edi],dx
 3ef:	6d                   	ins    DWORD PTR es:[edi],dx
 3f0:	61                   	popa   
 3f1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3f2:	64 00 66 72          	add    BYTE PTR fs:[esi+0x72],ah
 3f6:	65                   	gs
 3f7:	65                   	gs
 3f8:	41                   	inc    ecx
 3f9:	72 67                	jb     462 <cmdPrintEnv-0x30ffb9e>
 3fb:	56                   	push   esi
 3fc:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 3ff:	65                   	gs
 400:	64                   	fs
 401:	44                   	inc    esp
 402:	6f                   	outs   dx,DWORD PTR ds:[esi]
 403:	75 62                	jne    467 <cmdPrintEnv-0x30ffb99>
 405:	6c                   	ins    BYTE PTR es:[edi],dx
 406:	65                   	gs
 407:	51                   	push   ecx
 408:	75 6f                	jne    479 <cmdPrintEnv-0x30ffb87>
 40a:	74 65                	je     471 <cmdPrintEnv-0x30ffb8f>
 40c:	74 6f                	je     47d <cmdPrintEnv-0x30ffb83>
 40e:	45                   	inc    ebp
 40f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 410:	64                   	fs
 411:	50                   	push   eax
 412:	61                   	popa   
 413:	72 61                	jb     476 <cmdPrintEnv-0x30ffb8a>
 415:	6d                   	ins    DWORD PTR es:[edi],dx
 416:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 419:	72 61                	jb     47c <cmdPrintEnv-0x30ffb84>
 41b:	6d                   	ins    DWORD PTR es:[edi],dx
 41c:	73 54                	jae    472 <cmdPrintEnv-0x30ffb8e>
 41e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 41f:	41                   	inc    ecx
 420:	72 67                	jb     489 <cmdPrintEnv-0x30ffb77>
 422:	76 00                	jbe    424 <cmdPrintEnv-0x30ffbdc>
 424:	72 65                	jb     48b <cmdPrintEnv-0x30ffb75>
 426:	70 72                	jo     49a <cmdPrintEnv-0x30ffb66>
 428:	69 6e 74 43 6f 6d 6d 	imul   ebp,DWORD PTR [esi+0x74],0x6d6d6f43
 42f:	61                   	popa   
 430:	6e                   	outs   dx,BYTE PTR ds:[esi]
 431:	64 00 62 73          	add    BYTE PTR fs:[edx+0x73],ah
 435:	71 75                	jno    4ac <cmdPrintEnv-0x30ffb54>
 437:	6f                   	outs   dx,DWORD PTR ds:[esi]
 438:	74 65                	je     49f <cmdPrintEnv-0x30ffb61>
 43a:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 43d:	78 61                	js     4a0 <cmdPrintEnv-0x30ffb60>
 43f:	72 67                	jb     4a8 <cmdPrintEnv-0x30ffb58>
 441:	63 00                	arpl   WORD PTR [eax],ax
 443:	65                   	gs
 444:	76 4e                	jbe    494 <cmdPrintEnv-0x30ffb6c>
 446:	61                   	popa   
 447:	6d                   	ins    DWORD PTR es:[edi],dx
 448:	65 00 73 61          	add    BYTE PTR gs:[ebx+0x61],dh
 44c:	76 65                	jbe    4b3 <cmdPrintEnv-0x30ffb4d>
 44e:	43                   	inc    ebx
 44f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 450:	6d                   	ins    DWORD PTR es:[edi],dx
 451:	6d                   	ins    DWORD PTR es:[edi],dx
 452:	61                   	popa   
 453:	6e                   	outs   dx,BYTE PTR ds:[esi]
 454:	64 00 62 75          	add    BYTE PTR fs:[edx+0x75],ah
 458:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 45f:	00 
 460:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 463:	6d                   	ins    DWORD PTR es:[edi],dx
 464:	61                   	popa   
 465:	6e                   	outs   dx,BYTE PTR ds:[esi]
 466:	64                   	fs
 467:	48                   	dec    eax
 468:	69 73 74 6f 72 79 00 	imul   esi,DWORD PTR [ebx+0x74],0x79726f
 46f:	6c                   	ins    BYTE PTR es:[edi],dx
 470:	43                   	inc    ebx
 471:	75 72                	jne    4e5 <cmdPrintEnv-0x30ffb1b>
 473:	72 4b                	jb     4c0 <cmdPrintEnv-0x30ffb40>
 475:	65                   	gs
 476:	79 00                	jns    478 <cmdPrintEnv-0x30ffb88>
 478:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 47c:	6c                   	ins    BYTE PTR es:[edi],dx
 47d:	6c                   	ins    BYTE PTR es:[edi],dx
 47e:	00 61 6e             	add    BYTE PTR [ecx+0x6e],ah
 481:	73 69                	jae    4ec <cmdPrintEnv-0x30ffb14>
 483:	53                   	push   ebx
 484:	65                   	gs
 485:	71 00                	jno    487 <cmdPrintEnv-0x30ffb79>
 487:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 48a:	6d                   	ins    DWORD PTR es:[edi],dx
 48b:	61                   	popa   
 48c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 48d:	64                   	fs
 48e:	48                   	dec    eax
 48f:	69 73 74 6f 72 79 50 	imul   esi,DWORD PTR [ebx+0x74],0x5079726f
 496:	74 72                	je     50a <cmdPrintEnv-0x30ffaf6>
 498:	00 70 70             	add    BYTE PTR [eax+0x70],dh
 49b:	74 72                	je     50f <cmdPrintEnv-0x30ffaf1>
 49d:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 4a0:	7a 65                	jp     507 <cmdPrintEnv-0x30ffaf9>
 4a2:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 4a5:	72 67                	jb     50e <cmdPrintEnv-0x30ffaf2>
 4a7:	76 00                	jbe    4a9 <cmdPrintEnv-0x30ffb57>
 4a9:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 4ac:	4c                   	dec    esp
 4ad:	69 6e 65 00 6c 52 65 	imul   ebp,DWORD PTR [esi+0x65],0x65526c00
 4b4:	74 56                	je     50c <cmdPrintEnv-0x30ffaf4>
 4b6:	61                   	popa   
 4b7:	6c                   	ins    BYTE PTR es:[edi],dx
 4b8:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 4bb:	70 79                	jo     536 <cmdPrintEnv-0x30ffaca>
 4bd:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 4c0:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 4c3:	73 65                	jae    52a <cmdPrintEnv-0x30ffad6>
 4c5:	74 52                	je     519 <cmdPrintEnv-0x30ffae7>
 4c7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4c8:	77 00                	ja     4ca <cmdPrintEnv-0x30ffb36>
 4ca:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 4cd:	6d                   	ins    DWORD PTR es:[edi],dx
 4ce:	61                   	popa   
 4cf:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4d0:	64                   	fs
 4d1:	57                   	push   edi
 4d2:	61                   	popa   
 4d3:	73 46                	jae    51b <cmdPrintEnv-0x30ffae5>
 4d5:	72 6f                	jb     546 <cmdPrintEnv-0x30ffaba>
 4d7:	6d                   	ins    DWORD PTR es:[edi],dx
 4d8:	54                   	push   esp
 4d9:	68 69 73 42 75       	push   0x75427369
 4de:	66                   	data16
 4df:	66                   	data16
 4e0:	65                   	gs
 4e1:	72 50                	jb     533 <cmdPrintEnv-0x30ffacd>
 4e3:	74 72                	je     557 <cmdPrintEnv-0x30ffaa9>
 4e5:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 4e8:	6d                   	ins    DWORD PTR es:[edi],dx
 4e9:	6d                   	ins    DWORD PTR es:[edi],dx
 4ea:	61                   	popa   
 4eb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4ec:	64 00 67 65          	add    BYTE PTR fs:[edi+0x65],ah
 4f0:	74 41                	je     533 <cmdPrintEnv-0x30ffacd>
 4f2:	4b                   	dec    ebx
 4f3:	65                   	gs
 4f4:	79 00                	jns    4f6 <cmdPrintEnv-0x30ffb0a>

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
